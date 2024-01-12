Return-Path: <linux-media+bounces-3606-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7F082B9E6
	for <lists+linux-media@lfdr.de>; Fri, 12 Jan 2024 04:17:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 362D71F24FDC
	for <lists+linux-media@lfdr.de>; Fri, 12 Jan 2024 03:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C1A15C6;
	Fri, 12 Jan 2024 03:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xa1lVIGJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500DD1108
	for <linux-media@vger.kernel.org>; Fri, 12 Jan 2024 03:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-58962bf3f89so842626a12.0
        for <linux-media@vger.kernel.org>; Thu, 11 Jan 2024 19:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705029444; x=1705634244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lFINQhVngeuL3Q+9yY5Ts2V/N3kA4KP1+cnBd9hCA/c=;
        b=Xa1lVIGJ2C/3xo08/2wfmNykOYsUFPQjtlN5FJerCjRV6rFJoeufMlmehXbbn9pkHO
         j8/KtnMa9VerfMw0hiUYrZV4h8bA0PLv7ewZjj46imRdc+XO+nz/L3GhchRUspy8Qq8F
         m2GcWN13OwE7MRKJ0hyWCQ6lYGNvSVk3IvEr17lX9VGyw5hTk2IWZDl2PdKn43AFnpcL
         VbjMr0BlRdvRXdekLjmrCOL7VY9XRKGAELXJqdkNR4aRGUdvYoJ/cs6nEH3SdMBUiZsS
         604GJRrrWNp3TGT0L8Hu/9qwWe/YMPbaXwVAk2Lx5eVrcwwT55/ys/+brMmEatCBfJJT
         Cemw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705029444; x=1705634244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lFINQhVngeuL3Q+9yY5Ts2V/N3kA4KP1+cnBd9hCA/c=;
        b=UeHcHT6GVFq32VrBm5i4DYF5WjYv1WTbsn33uiP3OJJwnKJLgItXd6E5S+yrpgNYRb
         MUxfNxuzHqdOg7bmKtl2HWxHqt7aLiBz/wAlaibTOgATa/JJjAO/O/PBqN2tZWNLqnoa
         G9vj1+6uzK4nZU+GSyImQfWroWenyMaA1YXCMAn89FpGgBDydg7UHWWYJAdn9UGSFYvY
         LuSEwGn76nMAgwshAyKMSvWSE5NxaCOZmnH6jR22dUFJ9QdwWxtoomiVzAUtF218pSn0
         8jdCnqZE+2JyiB/KPliouu05I9Et9xblP3n+F/LMoMTcUSMaBF7okck9Z1j9mYcekfQ4
         NnxA==
X-Gm-Message-State: AOJu0Yxu70zXFoiYi5i4taZKLkYbROlGIyb/Uv986ijqPY6ecfmZCA/a
	CzeC035JQjwrKuy+9ZnouKSmhLx8v8w=
X-Google-Smtp-Source: AGHT+IF8H9OltSr+GuU8A1gKSxvL5GS8gEXHGOHdQ3PsAG76atTp+S39LVuyR2IrlywbnsyVoghzJg==
X-Received: by 2002:a05:6a20:8e20:b0:199:7f36:d88f with SMTP id y32-20020a056a208e2000b001997f36d88fmr779360pzj.1.1705029444515;
        Thu, 11 Jan 2024 19:17:24 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:e92d:49e3:5f9:e0a4])
        by smtp.gmail.com with ESMTPSA id e12-20020a17090301cc00b001d4e0752b5esm1952713plh.157.2024.01.11.19.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 19:17:23 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: hverkuil-cisco@xs4all.nl
Cc: sean@mess.org,
	raj.khem@gmail.com,
	linux-media@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v4l-utils] keytable: meson: Restrict the installation of 50-rc_keymap.conf
Date: Fri, 12 Jan 2024 00:17:14 -0300
Message-Id: <20240112031714.242522-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Currently, meson tries to install 50-rc_keymap.conf even if systemd
is not used.

Commit 01f2c6c58e6f ("keytable: restrict installation of 50-rc_keymap.conf"),
only allowed 50-rc_keymap.conf to be installed when both BPF and systemd
were used.

Apply the same logic in meson to fix the problem.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 utils/keytable/meson.build | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/utils/keytable/meson.build b/utils/keytable/meson.build
index 4130a4bea514..76ce329eae8e 100644
--- a/utils/keytable/meson.build
+++ b/utils/keytable/meson.build
@@ -69,6 +69,8 @@ ir_keytable_udev_rules = files(
 install_data(ir_keytable_udev_rules,
              install_dir : ir_keytable_system_dir / 'rules.d')
 
+if ir_bpf_enabled
+if dep_systemd.found()
 if have_udevdsyscallfilter
     ir_keytable_systemd_files = files(
         '50-rc_keymap.conf',
@@ -76,6 +78,8 @@ if have_udevdsyscallfilter
     install_data(ir_keytable_systemd_files,
                  install_dir : systemd_systemdir / 'systemd-udevd.service.d')
 endif
+endif
+endif
 
 # Install non-existing directory to create empty directory structure
 # See: https://github.com/mesonbuild/meson/issues/2904
-- 
2.34.1


