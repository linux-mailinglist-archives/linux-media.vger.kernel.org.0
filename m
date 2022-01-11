Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A464548A449
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 01:23:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345393AbiAKAXZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jan 2022 19:23:25 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:4418 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S238204AbiAKAXY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jan 2022 19:23:24 -0500
X-IronPort-AV: E=Sophos;i="5.88,278,1635174000"; 
   d="scan'208";a="106595495"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 11 Jan 2022 09:23:22 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id E5E404157D0D;
        Tue, 11 Jan 2022 09:23:20 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 00/13] media: Use platform_get_irq*() variants to fetch IRQ's
Date:   Tue, 11 Jan 2022 00:23:01 +0000
Message-Id: <20220111002314.15213-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

This patch series aims to drop using platform_get_resource() for IRQ types
in preparation for removal of static setup of IRQ resource from DT core
code.

Dropping usage of platform_get_resource() was agreed based on
the discussion [0].

[0] https://patchwork.kernel.org/project/linux-renesas-soc/
patch/20211209001056.29774-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (13):
  media: vsp1: Use platform_get_irq() to get the interrupt
  media: camss: Use platform_get_irq_byname() to get the interrupt
  media: bdisp: Use platform_get_irq() to get the interrupt
  media: s5p-mfc: Use platform_get_irq() to get the interrupt
  media: stm32-dma2d: Use platform_get_irq() to get the interrupt
  media: davinci: vpif: Use platform_get_irq_optional() to get the
    interrupt
  media: exynos-gsc: Use platform_get_irq() to get the interrupt
  media: marvell-ccic: Use platform_get_irq() to get the interrupt
  media: mtk-vcodec: Drop unnecessary call to platform_get_resource()
  media: exynos4-is: Use platform_get_irq() to get the interrupt
  media: s5p-g2d: Use platform_get_irq() to get the interrupt
  media: mtk-vpu: Drop unnecessary call to platform_get_resource()
  media: coda: Use platform_get_irq() to get the interrupt

 drivers/media/platform/coda/imx-vdoa.c        |  9 ++++---
 drivers/media/platform/davinci/vpif.c         | 18 ++++++++------
 drivers/media/platform/davinci/vpif_capture.c | 24 ++++++++++++-------
 drivers/media/platform/davinci/vpif_display.c | 21 ++++++++++------
 drivers/media/platform/exynos-gsc/gsc-core.c  | 14 +++++------
 drivers/media/platform/exynos4-is/fimc-core.c | 11 ++++-----
 drivers/media/platform/exynos4-is/fimc-lite.c | 11 ++++-----
 .../media/platform/marvell-ccic/mmp-driver.c  |  8 +++----
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 11 ++++-----
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  | 10 +++-----
 drivers/media/platform/mtk-vpu/mtk_vpu.c      | 10 +++-----
 .../media/platform/qcom/camss/camss-csid.c    | 12 ++++------
 .../media/platform/qcom/camss/camss-csiphy.c  | 12 ++++------
 .../media/platform/qcom/camss/camss-ispif.c   | 12 ++++------
 drivers/media/platform/qcom/camss/camss-vfe.c | 12 ++++------
 drivers/media/platform/s5p-g2d/g2d.c          | 10 +++-----
 drivers/media/platform/s5p-mfc/s5p_mfc.c      | 11 ++++-----
 drivers/media/platform/sti/bdisp/bdisp-v4l2.c | 10 +++-----
 drivers/media/platform/stm32/dma2d/dma2d.c    |  9 +++----
 drivers/media/platform/vsp1/vsp1_drv.c        | 14 +++++------
 20 files changed, 108 insertions(+), 141 deletions(-)

-- 
2.17.1

