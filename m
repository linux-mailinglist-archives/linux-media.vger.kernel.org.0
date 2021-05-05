Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BD2B3737D2
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 11:42:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232674AbhEEJnY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 05:43:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:48572 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232242AbhEEJnQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 May 2021 05:43:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0602D61401;
        Wed,  5 May 2021 09:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620207739;
        bh=yt06NNHz8DnYKToINWX+kvUyHzX2tR5CxsEbiivgk9Q=;
        h=From:To:Cc:Subject:Date:From;
        b=aqDRmaF3drwaIh64M6SmLAXcURg7md3/lxLq6hY7zb9NqADehFDhLwTfZdBs7O+Ua
         PrWk1xzp0TuIUKCqW49WlvukyoTfR5zgDGz7Uu2PZqSgv1pEGUUxNbyoLUBf8HZnu5
         qRdm6t31xE9TWLgGFmfaTYQA8hMkY0ziRes30XuBsRHwKIVlQv7wfSkyxIpDYtEO+h
         OCd1Y0Rg6YCyxJf0fUjbsEoL8cTStyP6CBORWLMbL183NygQ2Jt0qsW8FwH+QN9AJO
         UNaAIvqUS7AS4O6rIj0PTrvaAvgGwleAAphalHt9KMZmiBAzijNKMWxdBLmzF/O1Jj
         VRSlJc4wK+6AA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1leE2q-00AHvp-Hf; Wed, 05 May 2021 11:42:16 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-sunxi@lists.linux.dev
Subject: [PATCH 00/25] Fix some PM runtime issues at the media subsystem
Date:   Wed,  5 May 2021 11:41:50 +0200
Message-Id: <cover.1620207353.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As part of an effort to cleanup pm_runtime*get* calls, I detected a number
of issues at the media subsystem.

Most of the patches here were submitted previously at:

	https://lore.kernel.org/linux-media/cover.1619621413.git.mchehab+huawei@kernel.org/

This series contain just the bug fixes and other related issues that are
present with the current code on media.

It address the points from the existing reviews. I also did my own
set of reviews, in order to avoid regressions.

Changes from v4 of the previous changeset:

- reworked i2c/css RPM get logic;
- dropped two patches that could cause regressions;
- am437x: keep using pm_runtime_get_sync on suspend/resume;
- atmel: fix the returned code and add a print on failures at start streaming;
- simplify some checks for return code > 0;
- mdk-vcodec: properly handle RPM errors at device on logic;
- venus: rework venus_sys_error_handler() logic;
- sti/delta: fix an issue at the error checking logic.

Mauro Carvalho Chehab (25):
  staging: media: rkvdec: fix pm_runtime_get_sync() usage count
  staging: media: imx7-mipi-csis: fix pm_runtime_get_sync() usage count
  media: venus: Rework error fail recover logic
  media: s5p_cec: decrement usage count if disabled
  media: i2c: ccs-core: return the right error code at suspend
  media: i2c: imx334: fix the pm runtime get logic
  media: exynos-gsc: don't resume at remove time
  media: atmel: properly get pm_runtime
  media: hantro: do a PM resume earlier
  media: marvel-ccic: fix some issues when getting pm_runtime
  media: mdk-mdp: fix pm_runtime_get_sync() usage count
  media: rcar_fdp1: simplify error check logic at fdp_open()
  media: rcar_fdp1: fix pm_runtime_get_sync() usage count
  media: renesas-ceu: Properly check for PM errors
  media: s5p: fix pm_runtime_get_sync() usage count
  media: am437x: fix pm_runtime_get_sync() usage count
  media: sh_vou: fix pm_runtime_get_sync() usage count
  media: mtk-vcodec: fix PM runtime get logic
  media: s5p-jpeg: fix pm_runtime_get_sync() usage count
  media: sti/delta: use pm_runtime_resume_and_get()
  media: sunxi: fix pm_runtime_get_sync() usage count
  media: sti/bdisp: fix pm_runtime_get_sync() usage count
  media: exynos4-is: fix pm_runtime_get_sync() usage count
  media: exynos-gsc: fix pm_runtime_get_sync() usage count
  media: i2c: ccs-core: fix pm_runtime_get_sync() usage count

 drivers/media/cec/platform/s5p/s5p_cec.c      |  7 ++-
 drivers/media/i2c/ccs/ccs-core.c              | 41 ++++++++-----
 drivers/media/i2c/imx334.c                    |  7 ++-
 drivers/media/platform/am437x/am437x-vpfe.c   | 15 ++++-
 drivers/media/platform/atmel/atmel-isc-base.c | 30 +++++++---
 drivers/media/platform/atmel/atmel-isi.c      | 19 ++++--
 drivers/media/platform/exynos-gsc/gsc-core.c  | 11 ++--
 drivers/media/platform/exynos-gsc/gsc-m2m.c   |  4 +-
 .../media/platform/exynos4-is/fimc-capture.c  |  6 +-
 drivers/media/platform/exynos4-is/fimc-is.c   |  4 +-
 .../platform/exynos4-is/fimc-isp-video.c      |  3 +-
 drivers/media/platform/exynos4-is/fimc-isp.c  |  7 +--
 drivers/media/platform/exynos4-is/fimc-lite.c |  5 +-
 drivers/media/platform/exynos4-is/fimc-m2m.c  |  5 +-
 drivers/media/platform/exynos4-is/media-dev.c |  9 +--
 drivers/media/platform/exynos4-is/mipi-csis.c | 10 ++--
 .../media/platform/marvell-ccic/mcam-core.c   |  9 ++-
 drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c  |  6 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  4 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   |  8 ++-
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.h   |  2 +-
 drivers/media/platform/qcom/venus/core.c      | 59 +++++++++++++++----
 drivers/media/platform/rcar_fdp1.c            | 28 ++++++---
 drivers/media/platform/renesas-ceu.c          |  4 +-
 drivers/media/platform/s5p-jpeg/jpeg-core.c   |  5 +-
 drivers/media/platform/sh_vou.c               |  6 +-
 drivers/media/platform/sti/bdisp/bdisp-v4l2.c |  7 ++-
 drivers/media/platform/sti/delta/delta-v4l2.c |  8 +--
 .../sunxi/sun8i-rotate/sun8i_rotate.c         |  2 +-
 drivers/staging/media/hantro/hantro_drv.c     |  7 ++-
 drivers/staging/media/imx/imx7-mipi-csis.c    |  7 +--
 drivers/staging/media/rkvdec/rkvdec.c         |  2 +-
 32 files changed, 220 insertions(+), 127 deletions(-)

-- 
2.30.2


