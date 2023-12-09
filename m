Return-Path: <linux-media+bounces-2052-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DC480B676
	for <lists+linux-media@lfdr.de>; Sat,  9 Dec 2023 22:14:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCB22280F85
	for <lists+linux-media@lfdr.de>; Sat,  9 Dec 2023 21:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 988411CA95;
	Sat,  9 Dec 2023 21:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=heitbaum.com header.i=@heitbaum.com header.b="BgHvMg6E"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E79DF103
	for <linux-media@vger.kernel.org>; Sat,  9 Dec 2023 13:14:25 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1d076ebf79cso20940475ad.1
        for <linux-media@vger.kernel.org>; Sat, 09 Dec 2023 13:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=heitbaum.com; s=google; t=1702156465; x=1702761265; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F4FT7Da77JC2hI10d0v7o+Ao/9ubWT8bJdDuCRJCx44=;
        b=BgHvMg6EDm5eE8UoPLQ+BuzoDq0fFohBrtVywd32xpbFAa3k5j11Ep2C5pUhsvvgF2
         Mdfwa+t2gagaTD/34Pd/QVAPqOd4ECVB1YzxMBebAXtzcMvgqpp7zzHJQswzNDbbKrah
         lBuwJytzm1gjWm3ntP4rrad4acB+dJma8KgTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702156465; x=1702761265;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F4FT7Da77JC2hI10d0v7o+Ao/9ubWT8bJdDuCRJCx44=;
        b=Iq+3+CGzcKNuFPFAN/pCi706dOxEVmxCjvrqYX9FdGy4akGJLDnSY1oFFGlPh29QkY
         JYQYyRFtlNyk2rQt3+YVztyllRtw5ATJpkcQe4cAYUC1dnTXRiKsHgWqRrN3otzoHJR7
         K1TYVYJTg7vrghg7kuAS0GG9qB5iq8gGRq4vMZIGtdZxNRKbqs3WcwrcK1aEel0XNtTY
         bF7J38vlZ25RFT3RbjxnzKrPkQQudhU7NiaYdxQgYLtO4QHV9HAE4LtfL1/K4bBlke+n
         PFeDZYJ6Z3N/QFkLX1jD9iF4xCVHmf25jw4ZWIjbaS9p2KqdgJTXyxbFxwfCuxALsFdW
         jLTw==
X-Gm-Message-State: AOJu0YxUlqsZHZ9MBGwh0mvFaxke3yGT32bL24dglfIFT4GITvCGVgmN
	o9QmFc2QjBA+b7lksJ7psx9OjmzgvP5I6vI7lJI=
X-Google-Smtp-Source: AGHT+IEGV8huER15uQ3eHbAx7lJqwH0+SoS9mwyDuCEFUzfvpznal8lXeON53BcC4pzd67vVTjDcKA==
X-Received: by 2002:a05:6a20:8423:b0:18c:432b:c075 with SMTP id c35-20020a056a20842300b0018c432bc075mr1264730pzd.42.1702156464575;
        Sat, 09 Dec 2023 13:14:24 -0800 (PST)
Received: from 99906519899e ([122.199.31.3])
        by smtp.gmail.com with ESMTPSA id pg7-20020a17090b1e0700b002801ca4fad2sm5443147pjb.10.2023.12.09.13.14.22
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 13:14:23 -0800 (PST)
Date: Sat, 9 Dec 2023 21:14:18 +0000
From: Rudi Heitbaum <rudi@heitbaum.com>
To: linux-media@vger.kernel.org
Subject: [PATCH] keytable: meson not passing rc_keymaps system directory
Message-ID: <ZXTYqtVgjG2y2u4S@99906519899e>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In the meson build ir_keytable_system_dir is used as the parent directory
for both rc_keymaps and rules.d, whereas udevrulesdir was defined
sepeartely in the configure script. Update the -DIR_KEYTABLE_SYSTEM_DIR
to include the rc_keymaps subdirectory aligning with the install_data
functions.

Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
---
 utils/keytable/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/keytable/meson.build b/utils/keytable/meson.build
index 0ca08a18..4130a4be 100644
--- a/utils/keytable/meson.build
+++ b/utils/keytable/meson.build
@@ -17,7 +17,7 @@ ir_keytable_system_dir = udevdir
 ir_keytable_user_dir = get_option('sysconfdir') / 'rc_keymaps'
 
 ir_keytable_c_args = [
-    '-DIR_KEYTABLE_SYSTEM_DIR="@0@"'.format(ir_keytable_system_dir),
+    '-DIR_KEYTABLE_SYSTEM_DIR="@0@"'.format(ir_keytable_system_dir / 'rc_keymaps'),
     '-DIR_KEYTABLE_USER_DIR="@0@"'.format(ir_keytable_user_dir),
 ]
 
-- 
2.34.1

