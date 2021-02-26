Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B15213263C9
	for <lists+linux-media@lfdr.de>; Fri, 26 Feb 2021 15:09:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbhBZOJI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Feb 2021 09:09:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:33798 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230292AbhBZOIt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Feb 2021 09:08:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1BF0064E54;
        Fri, 26 Feb 2021 14:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614348488;
        bh=uX1wk3Re81K2lVoPsSrwtXUc+sakhXsAIMJ5zinq3DE=;
        h=From:To:Cc:Subject:Date:From;
        b=NnVERTGQUN+rGA6EO0PHEnol5K9bYRnc/JlBnFN2e2ZRG7+uKjEBijMfHILIkrmfX
         r7XSEOTs5IsdrQ8Ibz1ctJ17utIByWr/fOKS9H507BcVmGmLzuVpDdnbCmNHQnWcP9
         Kck1muHldgCwdafyQa9i+rWP6P6NuTTuS00wpcHZq5U9BkW6SNULHzIAoUHJ1VPni0
         Gv7E9w2hbFsboE/v1ndkoPJxmSyHe3wyC0Ngn25mqnW1ZB5vPLbDRgOP2fCZwyO54t
         IltNK0IZhwOHuDc0zqwgElHhaHMuRSGxsw11Pa7lbnnQsTG6VpWIRIbu5eQZfKboXc
         NCmCtW9PqMiJg==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Yong Wu <yong.wu@mediatek.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: mtk: fix mtk-smi dependency
Date:   Fri, 26 Feb 2021 15:07:14 +0100
Message-Id: <20210226140733.3478898-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The mtk-smi driver can now be built as a loadable module, but
this leads to a build time regression when the drivers that
depend on it are built-in:

aarch64-linux-ld: drivers/media/platform/mtk-mdp/mtk_mdp_comp.o: in function `mtk_mdp_comp_clock_on':
mtk_mdp_comp.c:(.text.mtk_mdp_comp_clock_on+0x54): undefined reference to `mtk_smi_larb_get'
aarch64-linux-ld: drivers/media/platform/mtk-mdp/mtk_mdp_comp.o: in function `mtk_mdp_comp_clock_off':
mtk_mdp_comp.c:(.text.mtk_mdp_comp_clock_off+0x12c): undefined reference to `mtk_smi_larb_put'

Add a dependency on the interface, but keep allowing
compile-testing without that driver, as it was originally
intended.

Fixes: 50fc8d9232cd ("memory: mtk-smi: Allow building as module")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/platform/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 366df01c718b..f3ba26f4075e 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -244,6 +244,7 @@ config VIDEO_MEDIATEK_JPEG
 	depends on MTK_IOMMU_V1 || MTK_IOMMU || COMPILE_TEST
 	depends on VIDEO_DEV && VIDEO_V4L2
 	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on MTK_SMI || (COMPILE_TEST && MTK_SMI=n)
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
 	help
@@ -271,6 +272,7 @@ config VIDEO_MEDIATEK_MDP
 	depends on MTK_IOMMU || COMPILE_TEST
 	depends on VIDEO_DEV && VIDEO_V4L2
 	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on MTK_SMI || (COMPILE_TEST && MTK_SMI=n)
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
 	select VIDEO_MEDIATEK_VPU
@@ -291,6 +293,7 @@ config VIDEO_MEDIATEK_VCODEC
 	# our dependencies, to avoid missing symbols during link.
 	depends on VIDEO_MEDIATEK_VPU || !VIDEO_MEDIATEK_VPU
 	depends on MTK_SCP || !MTK_SCP
+	depends on MTK_SMI || (COMPILE_TEST && MTK_SMI=n)
 	depends on REMOTEPROC
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
-- 
2.29.2

