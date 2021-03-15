Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56CF633C703
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 20:46:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233709AbhCOTp3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 15:45:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233477AbhCOTo5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 15:44:57 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2BB2C06174A
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 12:44:56 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id g8so8386262qvx.1
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 12:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EHeLVXlmhPRECUIK0de41y19EjtaBfFrDmnjaMTTa68=;
        b=jRW9hmD/wTmt3Bm28Q9OK9DF2rdC0t9qk/Jz3wGlS47BTw3AO4PiBthR96zupMnWPk
         tv1NzAVNwfXrxqx45G0TYjrcVO9uF0wa+0ndx93xN992t8elDj1CRUPuaF2d3YejEybk
         563ztfgYj+rAbSoD+rJXnU4b4tnPAIhcx3Jn/O8zfzBH4NTrj8/X4JnB7b0AWmjyVhAJ
         jeQ+O4bNIEj7C2pXPH3bQfcAiZcryWQcLc7bUbvZ7U0cPIEAEQzbv9HY3YltGpbv/H2a
         IRPHCefnVZL95mxcfmREg68yh/tZYJEXfe2wVKgcNe+qW43hPEMSo6+ntKk7yiX4LprJ
         YljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EHeLVXlmhPRECUIK0de41y19EjtaBfFrDmnjaMTTa68=;
        b=m95jkF1AL4qim7ne3Fp9yDM6HtMv3a0HNXIZai3kGsdaMAUMu4LaiaRXXxfUqzQmKk
         rfHFMZCuCQqwLALZEKqfILNBn/MrV6AycFCgixhH4oMTJNgr7cy0wqmHRLJvUdvj9Gzm
         IXKDj9xv344cAoLf4tii0YhyeK9EPQiYM8uhcA7aqsYBcONJA8Z4NF5TqQlInAEfX3Vw
         oq1YJUs9VqemC3qJyaXVvQwMAamqrRA2zYPFTJ/Nup7+phzFx5MSWKUsYSxmmYZgrZ3S
         F2GkD3K4IiH6GzYxARxPI8puRoZUMNJuRxd1t9c7upN5kngOblE9GmHsDuulIFsy9CIb
         RZWw==
X-Gm-Message-State: AOAM533AERvAA1hCzXrDMsbxwV5iue/CK0hOdWl8AprLCq3bRe3JFmT2
        NpktnW12tbFrVKZAxcqJoWo=
X-Google-Smtp-Source: ABdhPJw98/iC+QwL3dAWC1A6jIbae3dIdsm7vpauIhCRazemJ4GBGnoj2XvVuAt5lE0cRpUSKk4dzg==
X-Received: by 2002:a0c:f6cf:: with SMTP id d15mr9817862qvo.62.1615837496069;
        Mon, 15 Mar 2021 12:44:56 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:919::1000])
        by smtp.gmail.com with ESMTPSA id z8sm7468576qtn.12.2021.03.15.12.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 12:44:55 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil@xs4all.nl
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 1/2] media: camera-mx2: Remove unused header file
Date:   Mon, 15 Mar 2021 16:44:45 -0300
Message-Id: <20210315194446.183453-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The imx27/imx25 camera driver has been removed a long time ago,
so get rid of this unused header file.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../linux/platform_data/media/camera-mx2.h    | 31 -------------------
 1 file changed, 31 deletions(-)
 delete mode 100644 include/linux/platform_data/media/camera-mx2.h

diff --git a/include/linux/platform_data/media/camera-mx2.h b/include/linux/platform_data/media/camera-mx2.h
deleted file mode 100644
index 8cfa76b6e1e1..000000000000
--- a/include/linux/platform_data/media/camera-mx2.h
+++ /dev/null
@@ -1,31 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * mx2-cam.h - i.MX27/i.MX25 camera driver header file
- *
- * Copyright (C) 2003, Intel Corporation
- * Copyright (C) 2008, Sascha Hauer <s.hauer@pengutronix.de>
- * Copyright (C) 2010, Baruch Siach <baruch@tkos.co.il>
- */
-
-#ifndef __MACH_MX2_CAM_H_
-#define __MACH_MX2_CAM_H_
-
-#define MX2_CAMERA_EXT_VSYNC		(1 << 1)
-#define MX2_CAMERA_CCIR			(1 << 2)
-#define MX2_CAMERA_CCIR_INTERLACE	(1 << 3)
-#define MX2_CAMERA_HSYNC_HIGH		(1 << 4)
-#define MX2_CAMERA_GATED_CLOCK		(1 << 5)
-#define MX2_CAMERA_INV_DATA		(1 << 6)
-#define MX2_CAMERA_PCLK_SAMPLE_RISING	(1 << 7)
-
-/**
- * struct mx2_camera_platform_data - optional platform data for mx2_camera
- * @flags: any combination of MX2_CAMERA_*
- * @clk: clock rate of the csi block / 2
- */
-struct mx2_camera_platform_data {
-	unsigned long flags;
-	unsigned long clk;
-};
-
-#endif /* __MACH_MX2_CAM_H_ */
-- 
2.25.1

