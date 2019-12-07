Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81819115F60
	for <lists+linux-media@lfdr.de>; Sat,  7 Dec 2019 23:48:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbfLGWsE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Dec 2019 17:48:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:42852 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726416AbfLGWsE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 7 Dec 2019 17:48:04 -0500
Received: from ziggy.de (unknown [95.169.229.25])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D691D206DF;
        Sat,  7 Dec 2019 22:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575758882;
        bh=93NzKwhH96xN9ph6jHZTyuNaVTL3dPzKjPH/rfZohME=;
        h=From:To:Cc:Subject:Date:From;
        b=e5NmXO42FZJxfWU96LzDKeiQX5mbz0BLaxnTby1/9Pn0Q+JizVFSuHjnqRW0s9ZnY
         hnN5q3R2ur6DOk9b02yjQvdFxlp7N/IsI5sxaEXsJM68Q0thsq6Sc5+H0jUsrVLdY3
         ORalyU0pxGNSd6MkPptb313Q+9TlthVRPr6mio+w=
From:   matthias.bgg@kernel.org
To:     robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
        p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
        sboyd@kernel.org, ulrich.hecht+renesas@gmail.com,
        laurent.pinchart@ideasonboard.com, enric.balletbo@collabora.com
Cc:     sean.wang@mediatek.com, sean.wang@kernel.org,
        rdunlap@infradead.org, wens@csie.org, hsinyi@chromium.org,
        frank-w@public-files.de, drinkcat@chromium.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, mbrugger@suse.com,
        matthias.bgg@kernel.org
Subject: [resend PATCH v6 00/12] arm/arm64: mediatek: Fix mmsys device probing
Date:   Sat,  7 Dec 2019 23:47:28 +0100
Message-Id: <20191207224740.24536-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Matthias Brugger <mbrugger@suse.com>

[reseding due to wrong mail of Stephen]

This is version five of the series. It's a long time this wasn't worked on, so
as a reminder, version four can be found here:
https://patchwork.kernel.org/cover/10686247/

The biggest changes this new version does, is to implement the clock probing
through a platform driver. The corresponding platform device get's created in
the DRM driver. I converted all the clock drivers to platform drivers and tested
the approach on the Acer Chromebook R13 (mt8173 based).
Apart from that I reordered the patches so that the DT bindings update are the first
patches.

Changes since v5:
- re-arrange the patch order
- generate platform_device for mmsys clock driver inside the DRM driver
- fix DTS binding accordingly
- switch all mmsys clock driver to platform probing
- fix mt8173 platform driver remove function
- fix probe defer path in HDMI driver
- fix probe defer path in mtk_mdp_comp
- fix identation of error messages

Changes since v4:
- fix missing regmap accessors in drm diver (patch 1)
- omit probe deffered warning on all drivers (patch 5)
- update drm and clk bindings (patch 6 and 7)
- put mmsys clock part in dts child node of mmsys. Only done
for HW where no dts backport compatible breakage is expected 
(either DRM driver not yet implemented or no HW available to
the public) (patch 9 to 12)

Changes since v3:
- use platform device to probe clock driver
- add Acked-by CK Hu for the probe deferred patch

Changes since v2:
- fix kconfig typo (shame on me)
- delete __initconst from mm_clocks as converted to a platform driver
  
Changes since v1:
- add binding documentation
- ddp: use regmap_update_bits
- ddp: ignore EPROBE_DEFER on clock probing
- mfd: delete mmsys_private
- add Reviewed-by and Acked-by tags
 
MMSYS in Mediatek SoCs has some registers to control clock gates (which is 
used in the clk driver) and some registers to set the routing and enable
the differnet blocks of the display subsystem.

Up to now both drivers, clock and drm are probed with the same device tree
compatible. But only the first driver get probed, which in effect breaks
graphics on mt8173 and mt2701.

This patch uses a platform device registration in the DRM driver, which
will trigger the probe of the corresponding clock driver. It was tested on the
bananapi-r2 and the Acer R13 Chromebook.


Matthias Brugger (12):
  dt-bindings: display: mediatek: Add mmsys binding description
  dt-bindings: mediatek: Add compatible for mt7623
  drm/mediatek: Use regmap for register access
  drm: mediatek: Omit warning on probe defers
  media: mtk-mdp: Check return value of of_clk_get
  clk: mediatek: mt2701: switch mmsys to platform device probing
  clk: mediatek: mt2712e: switch to platform device probing
  clk: mediatek: mt6779: switch mmsys to platform device probing
  clk: mediatek: mt6797: switch to platform device probing
  clk: mediatek: mt8183: switch mmsys to platform device probing
  clk: mediatek: mt8173: switch mmsys to platform device probing
  drm/mediatek: Add support for mmsys through a pdev

 .../display/mediatek/mediatek,disp.txt        | 30 ++++++-----
 drivers/clk/mediatek/clk-mt2701-mm.c          | 41 +++++++++-----
 drivers/clk/mediatek/clk-mt2712-mm.c          | 39 +++++++++-----
 drivers/clk/mediatek/clk-mt6779-mm.c          | 41 +++++++++-----
 drivers/clk/mediatek/clk-mt6797-mm.c          | 43 ++++++++++-----
 drivers/clk/mediatek/clk-mt8173.c             | 51 +++++++++++++++---
 drivers/clk/mediatek/clk-mt8183-mm.c          | 39 +++++++++-----
 drivers/gpu/drm/mediatek/mtk_disp_color.c     |  5 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |  5 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |  5 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c            | 12 +++--
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |  4 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c        | 54 +++++++++----------
 drivers/gpu/drm/mediatek/mtk_drm_ddp.h        |  4 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 35 +++++++++---
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |  4 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c            |  8 ++-
 drivers/gpu/drm/mediatek/mtk_hdmi.c           |  4 +-
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c |  6 +++
 19 files changed, 295 insertions(+), 135 deletions(-)

-- 
2.24.0

