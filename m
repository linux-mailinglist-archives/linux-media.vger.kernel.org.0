Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC041BF397
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 10:56:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbgD3I4E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 04:56:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726547AbgD3I4E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 04:56:04 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EC9BC035494
        for <linux-media@vger.kernel.org>; Thu, 30 Apr 2020 01:56:04 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id d17so2467261pgo.0
        for <linux-media@vger.kernel.org>; Thu, 30 Apr 2020 01:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LuFSML6Qs1jNQuh9f7FSxevmV01WKXUBt/xqATWhD2Y=;
        b=ksdrqkjg7/bPOyrlGVVf5QUEd5k1BXZ7bCgdmtHeYMIpFDf3Jwi86zlBfnZ6G3eGFf
         LjWDtJd1vQdHqlaiLjGGzrDiDeZunzNT9EZuzxEKG+XvlqlYRXstu/pFE85897AfscDN
         cdvyqJux8jQb2/CbeMwu4HqV5OW4SuxYJe+T4wNF3A6Av7o3axQUEJfZxOQzwMzm8/Jg
         MWfCDjZqBpH1VUis4SI0tuLnbul1+ql36EAFLt+4kHhoeKtaTsLLPv/fYAZc8yL/1/V5
         v2Jyc2hwtlG/8NlLhlIWkQ0Ql9LBguqNuCEvpxC3Y8JmemOdTlDhZM7wlLGEmPN7B1cX
         ABrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LuFSML6Qs1jNQuh9f7FSxevmV01WKXUBt/xqATWhD2Y=;
        b=rePCfZjgKaPjcyCr/8E4RsR4VvWzGubJz5TowQmK4L4SdAOYHZWICteQVn7Li/M9ZO
         L99Ia8oVbLO+HSmiqN6g2r0FQ7k4pzXvz+HVxkxVZx+rpw8qYWcv4Sd+5Y3yohv2Bufv
         et81Vyc4zGLq5vH64kXj6ifB17RoFt6I6b0RezdzrhfmXae9aPi34XA5zlL1BABpI448
         mRpz2n+b5wQN6ekyAInMnKFdWO+rccmT2nCe+Bou7Xn5qsINHdh84Y3oW79y6a+U/MzH
         Fy6/E9euW92g6+cDKk8iqhhLH7QdAwUTC6Nri2FSZOwbjYhEXqeMMGRVmoOgxXeJRW5l
         yTpQ==
X-Gm-Message-State: AGi0Pua5wIQmBIucESW8UrhGuHrsIChu56ay8/vOKwKiKY0z67yRXHlx
        hbbMUC5MlT6L8WGdMYKifCW49A==
X-Google-Smtp-Source: APiQypLoq0/7IkBcTUdghxEn6PlqSyQyh8qIGbADqzsQq+98Hiyrqq/DxAocwK3AWb7h9Fm8F5nYxQ==
X-Received: by 2002:a63:cf0d:: with SMTP id j13mr2186045pgg.379.1588236963542;
        Thu, 30 Apr 2020 01:56:03 -0700 (PDT)
Received: from starnight.localdomain (123-204-46-122.static.seed.net.tw. [123.204.46.122])
        by smtp.googlemail.com with ESMTPSA id 23sm1189356pjb.11.2020.04.30.01.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 01:56:03 -0700 (PDT)
From:   Jian-Hong Pan <jian-hong@endlessm.com>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        David Zhou <David1.Zhou@amd.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "Tianci . Yin" <tianci.yin@amd.com>,
        =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, linux@endlessm.com,
        Jian-Hong Pan <jian-hong@endlessm.com>
Subject: [PATCH] drm/radeon: drm/amdgpu: Disable [1002:6611] in radeon
Date:   Thu, 30 Apr 2020 16:53:19 +0800
Message-Id: <20200430085318.114894-1-jian-hong@endlessm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The AMD/ATI Oland [1002:6611]'s HDMI output status is not synchronous
as shown on UI after hot re-plug the HDMI cable, if it is radeon in
used. The amdgpu module does not hit this issue.

This patch disables [1002:6611] in radeon and enables it in amdgpu.

Fixes: https://gitlab.freedesktop.org/drm/amd/-/issues/1117
Signed-off-by: Jian-Hong Pan <jian-hong@endlessm.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 11 +++++++++++
 include/drm/drm_pciids.h                |  1 -
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 8ea86ffdea0d..1ad6f13a5bc0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1017,6 +1017,15 @@ MODULE_DEVICE_TABLE(pci, pciidlist);
 
 static struct drm_driver kms_driver;
 
+static void amdgpu_pci_fixup(struct pci_dev *pdev)
+{
+#ifdef CONFIG_DRM_AMDGPU_SI
+	/* [1002:6611] is disabled in radeon, so enable si_support in amdgpu. */
+	if (pdev->vendor == PCI_VENDOR_ID_ATI && pdev->device == 0x6611)
+		amdgpu_si_support = 1;
+#endif
+}
+
 static int amdgpu_pci_probe(struct pci_dev *pdev,
 			    const struct pci_device_id *ent)
 {
@@ -1036,6 +1045,8 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 		return -ENODEV;
 	}
 
+	amdgpu_pci_fixup(pdev);
+
 #ifdef CONFIG_DRM_AMDGPU_SI
 	if (!amdgpu_si_support) {
 		switch (flags & AMD_ASIC_MASK) {
diff --git a/include/drm/drm_pciids.h b/include/drm/drm_pciids.h
index b7e899ce44f0..57368a0f5b82 100644
--- a/include/drm/drm_pciids.h
+++ b/include/drm/drm_pciids.h
@@ -171,7 +171,6 @@
 	{0x1002, 0x6607, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_OLAND|RADEON_IS_MOBILITY|RADEON_NEW_MEMMAP}, \
 	{0x1002, 0x6608, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_OLAND|RADEON_NEW_MEMMAP}, \
 	{0x1002, 0x6610, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_OLAND|RADEON_NEW_MEMMAP}, \
-	{0x1002, 0x6611, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_OLAND|RADEON_NEW_MEMMAP}, \
 	{0x1002, 0x6613, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_OLAND|RADEON_NEW_MEMMAP}, \
 	{0x1002, 0x6617, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_OLAND|RADEON_IS_MOBILITY|RADEON_NEW_MEMMAP}, \
 	{0x1002, 0x6620, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_OLAND|RADEON_IS_MOBILITY|RADEON_NEW_MEMMAP}, \
-- 
2.26.2

