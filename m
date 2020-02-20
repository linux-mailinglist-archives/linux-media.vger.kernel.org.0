Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D844516644B
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2020 18:22:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728802AbgBTRWA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Feb 2020 12:22:00 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48646 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726959AbgBTRWA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Feb 2020 12:22:00 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id CCF2F29527F
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
        Daniel Vetter <daniel@ffwll.ch>,
        Fabien Parent <fparent@baylibre.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Owen Chen <owen.chen@mediatek.com>
Subject: [PATCH v8 0/6] arm/arm64: mediatek: Fix mmsys device probing
Date:   Thu, 20 Feb 2020 18:21:41 +0100
Message-Id: <20200220172147.919996-1-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear all,

Those patches are intended to solve an old standing issue on some
Mediatek devices (mt8173, mt2701 and mt2712) in a slightly different way
to the precedent series.

Up to now both drivers, clock and drm are probed with the same device tree
compatible. But only the first driver get probed, which in effect breaks
graphics on those devices.

The version eight of the series tries to solve the problem with a
different approach than the previous series but similar to how is solved
on other Mediatek devices.

The MMSYS (Multimedia subsystem) in Mediatek SoCs has some registers to
control clock gates (which is used in the clk driver) and some registers
to set the routing and enable the differnet blocks of the display
and MDP (Media Data Path) subsystem. On this series the clk driver is
not a pure clock controller but a system controller that can provide
access to the shared registers between the different drivers that need
it (mediatek-drm and mediatek-mdp). And the biggest change is, that in
this version, clk driver is the entry point (parent) which will trigger
the probe of the corresponding mediatek-drm driver and pass its MMSYS
platform data for display configuration.

All this series was tested on the Acer R13 Chromebook only.

For reference, here are the links to the old discussions:

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

Changes in v8:
- Be a builtin_platform_driver like other mediatek mmsys drivers.
- New patches introduced in this series.

Changes in v7:
- Add R-by from CK
- Add R-by from CK
- Fix check of return value of of_clk_get
- Fix identation
- Free clk_data->clks as well
- Get rid of private data structure

Enric Balletbo i Serra (2):
  drm/mediatek: Move MMSYS configuration to include/linux/platform_data
  clk/drm: mediatek: Fix mediatek-drm device probing

Matthias Brugger (4):
  drm/mediatek: Use regmap for register access
  drm/mediatek: Omit warning on probe defers
  media: mtk-mdp: Check return value of of_clk_get
  clk: mediatek: mt8173: Switch MMSYS to platform driver

 drivers/clk/mediatek/Kconfig                  |   6 +
 drivers/clk/mediatek/Makefile                 |   1 +
 drivers/clk/mediatek/clk-mt2701-mm.c          |  30 +++
 drivers/clk/mediatek/clk-mt2712-mm.c          |  44 +++++
 drivers/clk/mediatek/clk-mt8173-mm.c          | 172 ++++++++++++++++++
 drivers/clk/mediatek/clk-mt8173.c             | 104 -----------
 drivers/gpu/drm/mediatek/mtk_disp_color.c     |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |   5 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c            |  12 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |   4 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c        |  53 +++---
 drivers/gpu/drm/mediatek/mtk_drm_ddp.h        |   4 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |  56 +-----
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 113 +-----------
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |  13 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c            |   8 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c           |   4 +-
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c |   6 +
 include/linux/platform_data/mtk_mmsys.h       |  73 ++++++++
 20 files changed, 401 insertions(+), 317 deletions(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8173-mm.c
 create mode 100644 include/linux/platform_data/mtk_mmsys.h

-- 
2.25.0

