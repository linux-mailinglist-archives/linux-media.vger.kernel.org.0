Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E96616FC91
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 11:54:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727686AbgBZKya (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 05:54:30 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50722 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726329AbgBZKya (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 05:54:30 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id A078328531A
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
        p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
        sboyd@kernel.org, ulrich.hecht+renesas@gmail.com,
        laurent.pinchart@ideasonboard.com
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, rdunlap@infradead.org,
        dri-devel@lists.freedesktop.org, Weiyi Lu <weiyi.lu@mediatek.com>,
        Seiya Wang <seiya.wang@mediatek.com>,
        linux-clk@vger.kernel.org,
        Collabora Kernel ML <kernel@collabora.com>,
        mtk01761 <wendell.lin@mediatek.com>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>, wens@csie.org,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        sean.wang@mediatek.com, frank-w@public-files.de,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
        Matthias Brugger <mbrugger@suse.com>,
        linux-arm-kernel@lists.infradead.org,
        Richard Fontana <rfontana@redhat.com>,
        linux-kernel@vger.kernel.org, matthias.bgg@kernel.org,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v9 0/4] arm64: mediatek: Fix mt8173 mmsys device probing
Date:   Wed, 26 Feb 2020 11:54:15 +0100
Message-Id: <20200226105419.632771-1-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear all,

Those patches are intended to solve an old standing issue on some
Mediatek devices (mt8173, mt2701 and mt2712).

Up to now both drivers, clock and drm are probed with the same device tree
compatible. But only the first driver gets probed, which in effect breaks
graphics on those devices.

The MMSYS (Multimedia subsystem) in Mediatek SoCs has some registers to
control clock gates (which is used in the clk driver) and some registers
to set the routing and enable the differnet blocks of the display
and MDP (Media Data Path) subsystem. On this series the clk driver is
not a pure clock controller but a system controller that can provide
access to the shared registers between the different drivers that need
it (mediatek-drm and mediatek-mdp). Hence the MMSYS clk driver was moved
to drivers/soc/mediatek and is the entry point (parent) which will trigger
the probe of the corresponding mediatek-drm driver.

**IMPORTANT** This series only fixes the issue on mt8173 to make it
simple and as is the only platform I can test. Similar changes should be
applied for mt2701 and mt2712 to have display working.

For reference, here are the links to the old discussions:
* v8: https://patchwork.kernel.org/project/linux-mediatek/list/?series=244891
* v7: https://patchwork.kernel.org/project/linux-mediatek/list/?series=241217
* v6: https://patchwork.kernel.org/project/linux-mediatek/list/?series=213219
* v5: https://patchwork.kernel.org/project/linux-mediatek/list/?series=44063
* v4:
  * https://patchwork.kernel.org/patch/10530871/
  * https://patchwork.kernel.org/patch/10530883/
  * https://patchwork.kernel.org/patch/10530885/
  * https://patchwork.kernel.org/patch/10530911/
  * https://patchwork.kernel.org/patch/10530913/
* v3:
  * https://patchwork.kernel.org/patch/10367857/
  * https://patchwork.kernel.org/patch/10367861/
  * https://patchwork.kernel.org/patch/10367877/
  * https://patchwork.kernel.org/patch/10367875/
  * https://patchwork.kernel.org/patch/10367885/
  * https://patchwork.kernel.org/patch/10367883/
  * https://patchwork.kernel.org/patch/10367889/
  * https://patchwork.kernel.org/patch/10367907/
  * https://patchwork.kernel.org/patch/10367909/
  * https://patchwork.kernel.org/patch/10367905/
* v2: No relevant discussion, see v3
* v1:
  * https://patchwork.kernel.org/patch/10016497/
  * https://patchwork.kernel.org/patch/10016499/
  * https://patchwork.kernel.org/patch/10016505/
  * https://patchwork.kernel.org/patch/10016507/

Best regards,
 Enric

Changes in v9:
- Move mmsys to drivers/soc/mediatek (CK)
- Do not move the display routing from the drm driver (CK)
- Removed from this series because are not needed:
  * [PATCH v8 5/6] drm/mediatek: Move MMSYS configuration to include/linux/platform_data
- Removed from this series because are applied:
  * [PATCH v8 3/6] media: mtk-mdp: Check return value of of_clk_get.

Changes in v8:
- Select REGMAP and MFD_SYSCON (Randy Dunlap)
- Be a builtin_platform_driver like other mediatek mmsys drivers.
- New patch introduced in this series.

Changes in v7:
- Add R-by from CK
- Free clk_data->clks as well
- Get rid of private data structure

Enric Balletbo i Serra (1):
  drm/mediatek: Fix mediatek-drm device probing

Matthias Brugger (3):
  drm/mediatek: Use regmap for register access
  drm/mediatek: Omit warning on probe defers
  soc: mediatek: Move mt8173 MMSYS to platform driver

 drivers/clk/mediatek/clk-mt8173.c         | 104 ----------------
 drivers/gpu/drm/mediatek/Kconfig          |   2 +
 drivers/gpu/drm/mediatek/mtk_disp_color.c |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c   |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c  |   5 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c        |  12 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c   |   4 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c    |  53 ++++----
 drivers/gpu/drm/mediatek/mtk_drm_ddp.h    |   4 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c    |  45 ++++---
 drivers/gpu/drm/mediatek/mtk_drm_drv.h    |   2 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c        |   8 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c       |   4 +-
 drivers/soc/mediatek/Kconfig              |   7 ++
 drivers/soc/mediatek/Makefile             |   1 +
 drivers/soc/mediatek/mt8173-mmsys.c       | 143 ++++++++++++++++++++++
 16 files changed, 233 insertions(+), 171 deletions(-)
 create mode 100644 drivers/soc/mediatek/mt8173-mmsys.c

-- 
2.25.0

