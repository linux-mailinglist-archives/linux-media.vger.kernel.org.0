Return-Path: <linux-media+bounces-38059-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E64C6B0A454
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 14:40:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 564611C43BE4
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 12:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68CAF2DAFD2;
	Fri, 18 Jul 2025 12:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hgbwoas+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAD62DAFC1;
	Fri, 18 Jul 2025 12:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752842426; cv=none; b=YNn5iqwuCp2VEyOR7vAAnWUki2XhGom0Vp8V9sJ4hENkQrokapileGwkuE+WEWFCsrSSDxtPH6NkSTM8rfDawxPFhMUn8hWO4mOFddjr2X/KRXdh2K+YrMzanvoYpIYP0ARX2H3LIXSTfxfrFffOyQDIl/zeY+l/BcxmF+9DMvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752842426; c=relaxed/simple;
	bh=13JiryTUqvHobefpOGHqTVk5FnzqxAodhM9uj0YvSPA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=j91n0Uc9JgYHjq8NUR5suK/3VKDyKNVtrTM9JJfRxV2kURnZ5GUn5NJtpN1E0hc6GhOWNYJRlKpWxrjYWCt8AJgNFVj9bmtElpkONzY1r9YxW5tHmGiD4Dr0v64lwYGQBQsOyiRbOejdH0gQlwoPl+bAAr/n3vE+TxODV5h9btI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hgbwoas+; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-73c17c770a7so2565475b3a.2;
        Fri, 18 Jul 2025 05:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752842425; x=1753447225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dc4RmbubOACKDopQNCQandB/1PMGeDeSvCmTVZVuJ74=;
        b=hgbwoas+x6+yuHUP0ZX0fLuW7maJ2kuDzDkj2KTtwMfPQ3kg13b0K53+KjjSSzXz2+
         /PtUQx5nfYc4u1ocOd0SGwIRZUZ9vRY6bqxixw/KigBtRHbLUKXNZ2087/XpDerd/J8i
         TaP4ukOKZHd/1OaovvFZkH466cHsprGlW5BuLagMQbviRT15xW5rY4pG4T0LEtzkudh7
         gFj2iqaqrZV9KZi4LzlpM8S2J5pHjk/CvuDmLQsqNfX2/Z9V91EzTydhkA7qjl97T45R
         3qSPUksuHCtwd0wWcHEjsHbT56OBUIXmucsOz6xIcPjHXqBQ32TiFTrZhRZF2hoOdNX7
         r6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752842425; x=1753447225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dc4RmbubOACKDopQNCQandB/1PMGeDeSvCmTVZVuJ74=;
        b=oMXpF+gA9RmEHg4RoQ8oPRdExFu1ofAAXKBQx+c+RpkOEOj1JA7pfVCgT1wEGPq33U
         8dCyz7ya5f5DXEVaBOOEaafn9i1tOiP7JbW0aZruIa2bFZppBIufX0QwilRHBG11GT5Y
         hBldDJWkZGpvouxXaToxPZ5lPV34Ax+5m1bGSvVEus66u+EHYlNs4S+VKQVI2L10sGhM
         0bCbAkX4IAY5qg+oI8a8ItxmgUiGDewpAH7Xu3Xk9qjVE1EzRsFKMgcC98o7De5BAmNW
         RWwklw26EsADV+SqxI8g4iXB6H12r9Ia1fcOitFiuCvO0O3lLZEu27a+KR5cjnrINIke
         Tl+Q==
X-Forwarded-Encrypted: i=1; AJvYcCX23GqlC/ZFLc56+QxsQgxVAThz9DrIpipJqpTeZwZW2SjoLIvyzy4JbXfibUyFURaiYd4Qjs1HPvbW6vY=@vger.kernel.org, AJvYcCX7FGQy6M+YnvOD7YNiYBH2/WUfD1t1EVimdNCg+NLAKwJ03EEZhtTJ5zODr4Cxmkef8jbVdM/cTsIoZAA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8VYoeyj1i5PqIfaXg19MtRYATF7u/taZffNQQg3ZJUVXhJgYk
	+HfsGWVfuT1qyGCpmZ7dFq+QDoBoAVa9DFmMgNCPLHiPNoGtNJ1xAoQ+tkNmjjrfH5OvUg==
X-Gm-Gg: ASbGncuIojLx7H1viXBdMPy/qK01HSISZPQcQsxhI4YwJDmvtHLAqW2jzmsknpS18BU
	6+AfHGjpd+3XpTsekYAvkuUb+mkvCebpysrEYP/YmGHVMA9nwc4NyTeZmOOiNw3qgj5q98i0cmQ
	ke6DYBmXfMXlV7x/4aX4q4/7X/XhVnosORsdFOniE4ewKD8cgWouypqMTAvOWST46xOboMsnbso
	zkcE10s25AatTb6gfVO7KmghUw/gRnkv+IQm8XAeVrfQ3dp6/pQS7KZjSj4HJWucV/Xi7ArX404
	yDnHPyCr0tCrxslQuN9ez9sraPea+5GIK1K5/vtKr/lTe113eEJpRUkMuH+K9ebaK+sp+zP/BjC
	9kRJmSPWrB+KEG5lLj/dWKqqAtFp2ILQaO3Qto0aEW3eyHjA5U8t3cpjvJutnF14vajJUUrG6/w
	==
X-Google-Smtp-Source: AGHT+IE8ehQKTfVTqyEWV4TCGPTjnVFzWooLl7yjN7DwU13QhGc/2oIOjKMkEhGCb59irReoDlkbuA==
X-Received: by 2002:a05:6a21:3283:b0:215:dbb0:2a85 with SMTP id adf61e73a8af0-2380df8037cmr13790568637.0.1752842424545;
        Fri, 18 Jul 2025 05:40:24 -0700 (PDT)
Received: from SIQOL-WIN-0002-DARSHAN.localdomain ([49.36.68.205])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c84e2506sm1218295b3a.26.2025.07.18.05.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 05:40:24 -0700 (PDT)
From: Darshan Rathod <darshanrathod475@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Darshan Rathod <darshanrathod475@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: b2c2: flexcop: Fix coding style issues
Date: Fri, 18 Jul 2025 12:40:14 +0000
Message-ID: <20250718124018.79205-1-darshanrathod475@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code in flexcop.c has several instances where spaces are missing
after commas in function call arguments. This violates the Linux
kernel coding style guidelines.

This patch cleans up these minor style issues by adding the required
spaces. This is a purely stylistic change with no functional impact
and improves overall code readability and consistency.

Signed-off-by: Darshan Rathod <darshanrathod475@gmail.com>
---
 drivers/media/common/b2c2/flexcop.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/media/common/b2c2/flexcop.c b/drivers/media/common/b2c2/flexcop.c
index e7a88a2d248c..8506de48ba45 100644
--- a/drivers/media/common/b2c2/flexcop.c
+++ b/drivers/media/common/b2c2/flexcop.c
@@ -170,7 +170,7 @@ static void flexcop_reset(struct flexcop_device *fc)
 	flexcop_ibi_value v210, v204;
 
 	/* reset the flexcop itself */
-	fc->write_ibi_reg(fc,ctrl_208,ibi_zero);
+	fc->write_ibi_reg(fc, ctrl_208, ibi_zero);
 
 	v210.raw = 0;
 	v210.sw_reset_210.reset_block_000 = 1;
@@ -183,17 +183,17 @@ static void flexcop_reset(struct flexcop_device *fc)
 	v210.sw_reset_210.reset_block_700 = 1;
 	v210.sw_reset_210.Block_reset_enable = 0xb2;
 	v210.sw_reset_210.Special_controls = 0xc259;
-	fc->write_ibi_reg(fc,sw_reset_210,v210);
+	fc->write_ibi_reg(fc, sw_reset_210, v210);
 	msleep(1);
 
 	/* reset the periphical devices */
 
-	v204 = fc->read_ibi_reg(fc,misc_204);
+	v204 = fc->read_ibi_reg(fc, misc_204);
 	v204.misc_204.Per_reset_sig = 0;
-	fc->write_ibi_reg(fc,misc_204,v204);
+	fc->write_ibi_reg(fc, misc_204, v204);
 	msleep(1);
 	v204.misc_204.Per_reset_sig = 1;
-	fc->write_ibi_reg(fc,misc_204,v204);
+	fc->write_ibi_reg(fc, misc_204, v204);
 }
 
 void flexcop_reset_block_300(struct flexcop_device *fc)
@@ -202,13 +202,13 @@ void flexcop_reset_block_300(struct flexcop_device *fc)
 			  v210 = fc->read_ibi_reg(fc, sw_reset_210);
 
 	deb_rdump("208: %08x, 210: %08x\n", v208_save.raw, v210.raw);
-	fc->write_ibi_reg(fc,ctrl_208,ibi_zero);
+	fc->write_ibi_reg(fc, ctrl_208, ibi_zero);
 
 	v210.sw_reset_210.reset_block_300 = 1;
 	v210.sw_reset_210.Block_reset_enable = 0xb2;
 
-	fc->write_ibi_reg(fc,sw_reset_210,v210);
-	fc->write_ibi_reg(fc,ctrl_208,v208_save);
+	fc->write_ibi_reg(fc, sw_reset_210, v210);
+	fc->write_ibi_reg(fc, ctrl_208, v208_save);
 }
 
 struct flexcop_device *flexcop_device_kmalloc(size_t bus_specific_len)
@@ -266,8 +266,8 @@ int flexcop_device_initialize(struct flexcop_device *fc)
 	if (fc->get_mac_addr(fc, 0) == 0) {
 		u8 *b = fc->dvb_adapter.proposed_mac;
 		info("MAC address = %pM", b);
-		flexcop_set_mac_filter(fc,b);
-		flexcop_mac_filter_ctrl(fc,1);
+		flexcop_set_mac_filter(fc, b);
+		flexcop_mac_filter_ctrl(fc, 1);
 	} else
 		warn("reading of MAC address failed.\n");
 
@@ -275,7 +275,7 @@ int flexcop_device_initialize(struct flexcop_device *fc)
 	if (ret)
 		goto error;
 
-	flexcop_device_name(fc,"initialization of","complete");
+	flexcop_device_name(fc, "initialization of", "complete");
 	return 0;
 
 error:
-- 
2.43.0


