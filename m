Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A440536C29C
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:15:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235772AbhD0KPK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:15:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:34660 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235420AbhD0KOg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:14:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E2621613C7;
        Tue, 27 Apr 2021 10:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518431;
        bh=qwDrXziLd0wYa0ewaYbUQgnXX/81MfUZUDj4i+ZfQ3c=;
        h=From:To:Cc:Subject:Date:From;
        b=cgewf2WlhJEoRncqoUgtVjzA9f3sOoOfzHCQZACKQmDeO2jGaK4NZXObarBk6UJp2
         pxno8Y1i3eGLAU+TZbYECXQBmz+vrUFi+U8LqG8YZ8UnwckxZzN0G7WZS8SIEhU9rV
         d5x1zKEWBz7qkDq4BkR3OpmBPdJfos5Onw1MX0/RXzgmj0IjyYZH16/q1mBAqKRvpN
         sUxncBirqBuIbH495UuBIh19eXEVgo0yj3zNcuYn9I7OOosbtUlzYNm4PEl3A3zOSB
         WKYjFjjbgNWRQnszaz4w2QKIppoiqD5DhIt1clxJYx0h6Eaau5+BUGCvMrAgTQdX2N
         Z7m70gj9X8Oow==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKiy-000j4b-6W; Tue, 27 Apr 2021 12:13:48 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Andy Gross <agross@kernel.org>, Benoit Parrot <bparrot@ti.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Dan Scally <djrscally@gmail.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Jacob Chen <jacob-chen@iotwrt.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Leon Luo <leonl@leopardimaging.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Matt Ranostay <matt.ranostay@konsulko.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Shawn Tu <shawnx.tu@intel.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Todor Tomov <todor.too@gmail.com>,
        Wenyou Yang <wenyou.yang@microchip.com>,
        Yong Zhi <yong.zhi@intel.com>, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 00/79] Address some issues with PM runtime at media subsystem
Date:   Tue, 27 Apr 2021 12:12:27 +0200
Message-Id: <cover.1619518193.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

During the review of the patches from unm.edu, one of the patterns
I noticed is the amount of patches trying to fix pm_runtime_get_sync()
calls.

After analyzing the feedback from version 1 of this series, I noticed
a few other weird behaviors at the PM runtime resume code. So, this
series start addressing some bugs and issues at the current code.
Then, it gets rid of pm_runtime_get_sync() at the media subsystem
(with 2 exceptions).

It should be noticed that
Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
added a new method to does a pm_runtime get, which increments
the usage count only on success.

The rationale of getting rid of pm_runtime_get_sync() is:

1. despite its name, this is actually a PM runtime resume call,
   but some developers didn't seem to realize that, as I got this
   pattern on some drivers:

        pm_runtime_get_sync(&client->dev);
        pm_runtime_disable(&client->dev);
        pm_runtime_set_suspended(&client->dev);
        pm_runtime_put_noidle(&client->dev);

   It makes no sense to resume PM just to suspend it again ;-)

2. Usual *_get() methods only increment their use count on success,
   but pm_runtime_get_sync() increments it unconditionally. Due to
   that, several drivers were mistakenly not calling
   pm_runtime_put_noidle() when it fails;

3. The name of the new variant is a lot clearer:
	pm_runtime_resume_and_get()
    As its same clearly says that this is a PM runtime resume function,
    that also increments the usage counter on success;

4. Consistency: we did similar changes subsystem wide with
   for instance strlcpy() and strcpy() that got replaced by
   strscpy(). Having all drivers using the same known-to-be-safe
   methods is a good thing;

5. Prevent newer drivers to copy-and-paste a code that it would
   be easier to break if they don't truly understand what's behind
   the scenes.

This series replace places  pm_runtime_get_sync(), by calling
pm_runtime_resume_and_get() instead.

This should help to avoid future mistakes like that, as people
tend to use the existing drivers as examples for newer ones.

compile-tested only.

Patches 1 to 7 fix some issues that already exists at the current
PM runtime code;

patches 8 to 20 fix some usage_count problems that still exists
at the media subsystem;

patches 21 to 78 repaces pm_runtime_get_sync() by 
pm_runtime_resume_and_get();

Patch 79 (and a hunk on patch 78) documents the two exceptions
where pm_runtime_get_sync() will still be used for now.

Mauro Carvalho Chehab (79):
  media: venus: fix PM runtime logic at venus_sys_error_handler()
  media: i2c: ccs-core: return the right error code at suspend
  media: i2c: mt9m001: don't resume at remove time
  media: i2c: ov7740: don't resume at remove time
  media: i2c: video-i2c: don't resume at remove time
  media: exynos-gsc: don't resume at remove time
  media: atmel: properly get pm_runtime
  media: marvel-ccic: fix some issues when getting pm_runtime
  media: mdk-mdp: fix pm_runtime_get_sync() usage count
  media: rcar_fdp1: fix pm_runtime_get_sync() usage count
  media: rga-buf: use pm_runtime_resume_and_get()
  media: renesas-ceu: Properly check for PM errors
  media: s5p: fix pm_runtime_get_sync() usage count
  media: am437x: fix pm_runtime_get_sync() usage count
  media: sh_vou: fix pm_runtime_get_sync() usage count
  media: mtk-vcodec: fix pm_runtime_get_sync() usage count
  media: s5p-jpeg: fix pm_runtime_get_sync() usage count
  media: delta-v4l2: fix pm_runtime_get_sync() usage count
  media: sun8i_rotate: fix pm_runtime_get_sync() usage count
  staging: media: rkvdec: fix pm_runtime_get_sync() usage count
  staging: media: atomisp_fops: use pm_runtime_resume_and_get()
  staging: media: imx7-mipi-csis: use pm_runtime_resume_and_get()
  staging: media: ipu3: use pm_runtime_resume_and_get()
  staging: media: cedrus_video: use pm_runtime_resume_and_get()
  staging: media: vde: use pm_runtime_resume_and_get()
  staging: media: csi: use pm_runtime_resume_and_get()
  staging: media: vi: use pm_runtime_resume_and_get()
  media: i2c: ak7375: use pm_runtime_resume_and_get()
  media: i2c: ccs-core: use pm_runtime_resume_and_get()
  media: i2c: dw9714: use pm_runtime_resume_and_get()
  media: i2c: dw9768: use pm_runtime_resume_and_get()
  media: i2c: dw9807-vcm: use pm_runtime_resume_and_get()
  media: i2c: hi556: use pm_runtime_resume_and_get()
  media: i2c: imx214: use pm_runtime_resume_and_get()
  media: i2c: imx219: use pm_runtime_resume_and_get()
  media: i2c: imx258: use pm_runtime_resume_and_get()
  media: i2c: imx274: use pm_runtime_resume_and_get()
  media: i2c: imx290: use pm_runtime_resume_and_get()
  media: i2c: imx319: use pm_runtime_resume_and_get()
  media: i2c: imx334: use pm_runtime_resume_and_get()
  media: i2c: imx355: use pm_runtime_resume_and_get()
  media: i2c: mt9m001: use pm_runtime_resume_and_get()
  media: i2c: ov02a10: use pm_runtime_resume_and_get()
  media: i2c: ov13858: use pm_runtime_resume_and_get()
  media: i2c: ov2659: use pm_runtime_resume_and_get()
  media: i2c: ov2685: use pm_runtime_resume_and_get()
  media: i2c: ov2740: use pm_runtime_resume_and_get()
  media: i2c: ov5647: use pm_runtime_resume_and_get()
  media: i2c: ov5648: use pm_runtime_resume_and_get()
  media: i2c: ov5670: use pm_runtime_resume_and_get()
  media: i2c: ov5675: use pm_runtime_resume_and_get()
  media: i2c: ov5695: use pm_runtime_resume_and_get()
  media: i2c: ov7740: use pm_runtime_resume_and_get()
  media: i2c: ov8856: use pm_runtime_resume_and_get()
  media: i2c: ov8865: use pm_runtime_resume_and_get()
  media: i2c: ov9734: use pm_runtime_resume_and_get()
  media: i2c: tvp5150: use pm_runtime_resume_and_get()
  media: i2c: video-i2c: use pm_runtime_resume_and_get()
  media: sti/hva: use pm_runtime_resume_and_get()
  media: ipu3: use pm_runtime_resume_and_get()
  media: coda: use pm_runtime_resume_and_get()
  media: exynos4-is: use pm_runtime_resume_and_get()
  media: exynos-gsc: use pm_runtime_resume_and_get()
  media: mtk-jpeg: use pm_runtime_resume_and_get()
  media: camss: use pm_runtime_resume_and_get()
  media: venus: use pm_runtime_resume_and_get()
  media: venus: vdec: use pm_runtime_resume_and_get()
  media: venus: venc: use pm_runtime_resume_and_get()
  media: rcar-fcp: use pm_runtime_resume_and_get()
  media: rkisp1: use pm_runtime_resume_and_get()
  media: s3c-camif: use pm_runtime_resume_and_get()
  media: s5p-mfc: use pm_runtime_resume_and_get()
  media: bdisp-v4l2: use pm_runtime_resume_and_get()
  media: stm32: use pm_runtime_resume_and_get()
  media: sunxi: use pm_runtime_resume_and_get()
  media: ti-vpe: use pm_runtime_resume_and_get()
  media: vsp1: use pm_runtime_resume_and_get()
  media: rcar-vin: use pm_runtime_resume_and_get()
  media: hantro: document the usage of pm_runtime_get_sync()

 drivers/media/cec/platform/s5p/s5p_cec.c      |  5 +++-
 drivers/media/i2c/ak7375.c                    | 10 +------
 drivers/media/i2c/ccs/ccs-core.c              | 18 +++++-------
 drivers/media/i2c/dw9714.c                    | 10 +------
 drivers/media/i2c/dw9768.c                    | 10 +------
 drivers/media/i2c/dw9807-vcm.c                | 10 +------
 drivers/media/i2c/hi556.c                     |  3 +-
 drivers/media/i2c/imx214.c                    |  6 ++--
 drivers/media/i2c/imx219.c                    |  6 ++--
 drivers/media/i2c/imx258.c                    |  6 ++--
 drivers/media/i2c/imx274.c                    |  3 +-
 drivers/media/i2c/imx290.c                    |  6 ++--
 drivers/media/i2c/imx319.c                    |  6 ++--
 drivers/media/i2c/imx334.c                    |  5 ++--
 drivers/media/i2c/imx355.c                    |  6 ++--
 drivers/media/i2c/mt9m001.c                   |  8 ++----
 drivers/media/i2c/ov02a10.c                   |  6 ++--
 drivers/media/i2c/ov13858.c                   |  6 ++--
 drivers/media/i2c/ov2659.c                    |  6 ++--
 drivers/media/i2c/ov2685.c                    |  7 ++---
 drivers/media/i2c/ov2740.c                    |  6 ++--
 drivers/media/i2c/ov5647.c                    |  9 +++---
 drivers/media/i2c/ov5648.c                    |  6 ++--
 drivers/media/i2c/ov5670.c                    |  6 ++--
 drivers/media/i2c/ov5675.c                    |  3 +-
 drivers/media/i2c/ov5695.c                    |  6 ++--
 drivers/media/i2c/ov7740.c                    |  8 ++----
 drivers/media/i2c/ov8856.c                    |  3 +-
 drivers/media/i2c/ov8865.c                    |  6 ++--
 drivers/media/i2c/ov9734.c                    |  3 +-
 drivers/media/i2c/tvp5150.c                   | 16 ++---------
 drivers/media/i2c/video-i2c.c                 | 14 +++-------
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  3 +-
 drivers/media/platform/am437x/am437x-vpfe.c   | 22 +++++++++++----
 drivers/media/platform/atmel/atmel-isc-base.c | 27 +++++++++++++-----
 drivers/media/platform/atmel/atmel-isi.c      | 19 ++++++++++---
 drivers/media/platform/coda/coda-common.c     |  5 ++--
 drivers/media/platform/exynos-gsc/gsc-core.c  |  3 --
 drivers/media/platform/exynos-gsc/gsc-m2m.c   |  2 +-
 .../media/platform/exynos4-is/fimc-capture.c  |  6 ++--
 drivers/media/platform/exynos4-is/fimc-is.c   |  4 +--
 .../platform/exynos4-is/fimc-isp-video.c      |  3 +-
 drivers/media/platform/exynos4-is/fimc-isp.c  |  7 ++---
 drivers/media/platform/exynos4-is/fimc-lite.c |  5 ++--
 drivers/media/platform/exynos4-is/fimc-m2m.c  |  2 +-
 drivers/media/platform/exynos4-is/media-dev.c |  8 ++----
 drivers/media/platform/exynos4-is/mipi-csis.c |  8 ++----
 .../media/platform/marvell-ccic/mcam-core.c   |  9 ++++--
 .../media/platform/mtk-jpeg/mtk_jpeg_core.c   |  4 +--
 drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c  |  6 ++--
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   |  4 +--
 .../media/platform/qcom/camss/camss-csid.c    |  6 ++--
 .../media/platform/qcom/camss/camss-csiphy.c  |  6 ++--
 .../media/platform/qcom/camss/camss-ispif.c   |  6 ++--
 drivers/media/platform/qcom/camss/camss-vfe.c |  5 ++--
 drivers/media/platform/qcom/venus/core.c      | 28 +++++++++++--------
 .../media/platform/qcom/venus/pm_helpers.c    | 10 +++----
 drivers/media/platform/qcom/venus/vdec.c      |  4 +--
 drivers/media/platform/qcom/venus/venc.c      |  5 ++--
 drivers/media/platform/rcar-fcp.c             |  6 ++--
 drivers/media/platform/rcar-vin/rcar-csi2.c   |  6 ++++
 drivers/media/platform/rcar-vin/rcar-dma.c    |  6 ++--
 drivers/media/platform/rcar-vin/rcar-v4l2.c   |  6 ++--
 drivers/media/platform/rcar_fdp1.c            | 12 ++++++--
 drivers/media/platform/renesas-ceu.c          |  4 +--
 drivers/media/platform/rockchip/rga/rga-buf.c |  3 +-
 drivers/media/platform/rockchip/rga/rga.c     |  4 ++-
 .../platform/rockchip/rkisp1/rkisp1-capture.c |  3 +-
 .../media/platform/s3c-camif/camif-capture.c  |  2 +-
 drivers/media/platform/s3c-camif/camif-core.c |  5 ++--
 drivers/media/platform/s5p-jpeg/jpeg-core.c   |  2 +-
 drivers/media/platform/s5p-mfc/s5p_mfc_pm.c   |  6 ++--
 drivers/media/platform/sh_vou.c               |  6 +++-
 drivers/media/platform/sti/bdisp/bdisp-v4l2.c |  7 +++--
 drivers/media/platform/sti/delta/delta-v4l2.c |  4 +--
 drivers/media/platform/sti/hva/hva-hw.c       | 17 +++++------
 drivers/media/platform/stm32/stm32-dcmi.c     |  5 ++--
 .../platform/sunxi/sun4i-csi/sun4i_v4l2.c     |  6 ++--
 .../sunxi/sun8i-rotate/sun8i_rotate.c         |  2 +-
 drivers/media/platform/ti-vpe/cal-video.c     |  4 ++-
 drivers/media/platform/ti-vpe/cal.c           |  8 ++++--
 drivers/media/platform/ti-vpe/vpe.c           |  4 +--
 drivers/media/platform/vsp1/vsp1_drv.c        |  6 ++--
 .../staging/media/atomisp/pci/atomisp_fops.c  |  6 ++--
 drivers/staging/media/hantro/hantro_drv.c     |  7 +++++
 drivers/staging/media/imx/imx7-mipi-csis.c    |  7 ++---
 drivers/staging/media/ipu3/ipu3.c             |  3 +-
 drivers/staging/media/rkvdec/rkvdec.c         |  2 +-
 .../staging/media/sunxi/cedrus/cedrus_video.c |  6 ++--
 drivers/staging/media/tegra-vde/vde.c         | 16 +++++++----
 drivers/staging/media/tegra-video/csi.c       |  3 +-
 drivers/staging/media/tegra-video/vi.c        |  3 +-
 92 files changed, 298 insertions(+), 335 deletions(-)

-- 
2.30.2


