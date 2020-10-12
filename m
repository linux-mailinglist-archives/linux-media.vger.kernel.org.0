Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F9E828ADC5
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 07:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726883AbgJLFgR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 01:36:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726330AbgJLFgO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 01:36:14 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07353C0613CE
        for <linux-media@vger.kernel.org>; Sun, 11 Oct 2020 22:36:14 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id u24so13224739pgi.1
        for <linux-media@vger.kernel.org>; Sun, 11 Oct 2020 22:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NGXxcVkdEIPxLMPM+DjvJ1L3Bp/KN7ULl6Fng8qdl50=;
        b=QX3XduyfaK5fSjHQCSvj2nkIhaFtCrbsbxGTYvDDsk6USd+sgaRveUMyi3ORztJDDg
         nQF8sp444G4IRgwBQSqpikV8zOMWULZM0B/yH3O72CzmCVkGa6RPJuOO/KPKeP08INkF
         5YCMNv6AAMqXcbg9+hKW5C67B0EazAs8yYC3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NGXxcVkdEIPxLMPM+DjvJ1L3Bp/KN7ULl6Fng8qdl50=;
        b=mM0hpRnN+X41iQcYnRdVBC+BatTJjf0YWagGk7ltHiVlcMYxM8wXguOI1XfCndCC+3
         XTSdL9HanvwgWUEL+Pf+FKgUyplmtvuWKXlCoh88ZhwvWD+XSJyScl8DiJ0v5rlpy9bv
         TO1GkDfgUU+46YvWFm0mCYU8TYvMDmMYpo3BIF7tPxdqb49Jk5O+/rcapRlRy9mquhPp
         S/q5lMyz0QIcLegBypqJ0UHWTAbERYwR0j0Mt1sowtxK03kSrmIKKMAF2ktE27raZTmf
         Dh4dyAMPZx5+CFWj5ss5FzsgzgGz6MNXpNR1EA7wYzuo3t+pl4aHIKxhSoyOY9pq0WON
         XVTg==
X-Gm-Message-State: AOAM532tMcHyakFXuj6hJ3n1VtqDprGMOprajq5O5yHjFURAgnyabU1c
        RpRGrlLdQg5V+t9KVKcIyk33YA==
X-Google-Smtp-Source: ABdhPJw2uksfn73q7EcvJsiYTd4dOgxOV3OXK8WpW8AEjEDE/iUxuK+aS4GEQFS8l9CyQlec74xZNg==
X-Received: by 2002:a17:90a:6d26:: with SMTP id z35mr17755363pjj.41.1602480973555;
        Sun, 11 Oct 2020 22:36:13 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
        by smtp.gmail.com with ESMTPSA id z1sm17646817pgu.80.2020.10.11.22.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2020 22:36:12 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, gnurou@gmail.com,
        Alexandre Courbot <acourbot@chromium.org>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v3 2/2] media: mtk-vcodec: fix build breakage when one of VPU or SCP is enabled
Date:   Mon, 12 Oct 2020 14:35:57 +0900
Message-Id: <20201012053557.4102148-3-acourbot@chromium.org>
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
In-Reply-To: <20201012053557.4102148-1-acourbot@chromium.org>
References: <20201012053557.4102148-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The addition of MT8183 support added a dependency on the SCP remoteproc
module. However the initial patch used the "select" Kconfig directive,
which may result in the SCP module to not be compiled if remoteproc was
disabled. In such a case, mtk-vcodec would try to link against
non-existent SCP symbols. "select" was clearly misused here as explained
in kconfig-language.txt.

Replace this by a "depends" directive on at least one of the VPU and
SCP modules, to allow the driver to be compiled as long as one of these
is enabled, and adapt the code to support this new scenario.

Also adapt the Kconfig text to explain the extra requirements for MT8173
and MT8183.

Reported-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/platform/Kconfig                | 22 +++++++++++++++----
 drivers/media/platform/mtk-vcodec/Makefile    | 10 +++++++--
 .../platform/mtk-vcodec/mtk_vcodec_fw_priv.h  | 18 +++++++++++++++
 3 files changed, 44 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index a3cb104956d5..457b6c39ddc0 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -253,18 +253,32 @@ config VIDEO_MEDIATEK_VCODEC
 	depends on MTK_IOMMU || COMPILE_TEST
 	depends on VIDEO_DEV && VIDEO_V4L2
 	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on VIDEO_MEDIATEK_VPU || MTK_SCP
+	# The two following lines ensure we have the same state ("m" or "y") as
+	# our dependencies, to avoid missing symbols during link.
+	depends on VIDEO_MEDIATEK_VPU || !VIDEO_MEDIATEK_VPU
+	depends on MTK_SCP || !MTK_SCP
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
-	select VIDEO_MEDIATEK_VPU
-	select MTK_SCP
+	select VIDEO_MEDIATEK_VCODEC_VPU if VIDEO_MEDIATEK_VPU
+	select VIDEO_MEDIATEK_VCODEC_SCP if MTK_SCP
 	help
 	    Mediatek video codec driver provides HW capability to
-	    encode and decode in a range of video formats
-	    This driver rely on VPU driver to communicate with VPU.
+	    encode and decode in a range of video formats on MT8173
+	    and MT8183.
+
+	    Note that support for MT8173 requires VIDEO_MEDIATEK_VPU to
+	    also be selected. Support for MT8183 depends on MTK_SCP.
 
 	    To compile this driver as modules, choose M here: the
 	    modules will be called mtk-vcodec-dec and mtk-vcodec-enc.
 
+config VIDEO_MEDIATEK_VCODEC_VPU
+	bool
+
+config VIDEO_MEDIATEK_VCODEC_SCP
+	bool
+
 config VIDEO_MEM2MEM_DEINTERLACE
 	tristate "Deinterlace support"
 	depends on VIDEO_DEV && VIDEO_V4L2
diff --git a/drivers/media/platform/mtk-vcodec/Makefile b/drivers/media/platform/mtk-vcodec/Makefile
index 6e1ea3a9f052..4618d43dbbc8 100644
--- a/drivers/media/platform/mtk-vcodec/Makefile
+++ b/drivers/media/platform/mtk-vcodec/Makefile
@@ -25,5 +25,11 @@ mtk-vcodec-enc-y := venc/venc_vp8_if.o \
 mtk-vcodec-common-y := mtk_vcodec_intr.o \
 		mtk_vcodec_util.o \
 		mtk_vcodec_fw.o \
-		mtk_vcodec_fw_vpu.o \
-		mtk_vcodec_fw_scp.o
+
+ifneq ($(CONFIG_VIDEO_MEDIATEK_VCODEC_VPU),)
+mtk-vcodec-common-y += mtk_vcodec_fw_vpu.o
+endif
+
+ifneq ($(CONFIG_VIDEO_MEDIATEK_VCODEC_SCP),)
+mtk-vcodec-common-y += mtk_vcodec_fw_scp.o
+endif
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_priv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_priv.h
index 51f1694a7c7d..b41e66185cec 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_priv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_priv.h
@@ -27,8 +27,26 @@ struct mtk_vcodec_fw_ops {
 	void (*release)(struct mtk_vcodec_fw *fw);
 };
 
+#if IS_ENABLED(CONFIG_VIDEO_MEDIATEK_VCODEC_VPU)
 struct mtk_vcodec_fw *mtk_vcodec_fw_vpu_init(struct mtk_vcodec_dev *dev,
 					     enum mtk_vcodec_fw_use fw_use);
+#else
+static inline struct mtk_vcodec_fw *
+mtk_vcodec_fw_vpu_init(struct mtk_vcodec_dev *dev,
+		       enum mtk_vcodec_fw_use fw_use)
+{
+	return ERR_PTR(-ENODEV);
+}
+#endif /* CONFIG_VIDEO_MEDIATEK_VCODEC_VPU */
+
+#if IS_ENABLED(CONFIG_VIDEO_MEDIATEK_VCODEC_SCP)
 struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(struct mtk_vcodec_dev *dev);
+#else
+static inline struct mtk_vcodec_fw *
+mtk_vcodec_fw_scp_init(struct mtk_vcodec_dev *dev)
+{
+	return ERR_PTR(-ENODEV);
+}
+#endif /* CONFIG_VIDEO_MEDIATEK_VCODEC_SCP */
 
 #endif /* _MTK_VCODEC_FW_PRIV_H_ */
-- 
2.28.0.1011.ga647a8990f-goog

