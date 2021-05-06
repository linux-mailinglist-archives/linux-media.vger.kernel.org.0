Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E607375648
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 17:12:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235014AbhEFPNH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 11:13:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:33862 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234888AbhEFPNH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 11:13:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7452D61041;
        Thu,  6 May 2021 15:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620313928;
        bh=5pyBiTEHvMxAj8e/yO3yGgrWonLAEYO6vTvkoiWBA6I=;
        h=Date:From:Cc:Subject:In-Reply-To:References:From;
        b=gCHwiMQxRg/34kpnWeUtVHGRkYuqPEOIQkZjVTbPZZPFy2jqZ6oslJA4TOQa+gcHd
         Z0NptbjOm1CDOQB3ZQKMyntN6xQ5y7grAgI5pG3HJhrWpTilFGoxYfvmb6EoYj445K
         CQ0uc3Z4NuK9pz7n4SC/EZcPlSxDibZYfzeHq83K3HcpNS0SlwJvX6wThXiW6AEk2u
         hMwzEy9DylBCX+jg+CvlvqsbQ2ABQrFVf8X1Vi88Uh4ZWYq9UGScRPv8ih+Dd5UE7z
         mmJ11YeiM3YEzKEgUBlxxi6W4vsOo94Lj61ii0dn8Sbwu0SCHHobKO2iHWqCOgTTiV
         lZpsKjD8tnxqw==
Date:   Thu, 6 May 2021 17:11:57 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
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
Subject: Re: [PATCH 00/25] Fix some PM runtime issues at the media subsystem
Message-ID: <20210506171157.678f5c15@coco.lan>
In-Reply-To: <cover.1620207353.git.mchehab+huawei@kernel.org>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed,  5 May 2021 11:41:50 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> As part of an effort to cleanup pm_runtime*get* calls, I detected a number
> of issues at the media subsystem.
> 
> Most of the patches here were submitted previously at:
> 
> 	https://lore.kernel.org/linux-media/cover.1619621413.git.mchehab+huawei@kernel.org/
> 
> This series contain just the bug fixes and other related issues that are
> present with the current code on media.

Series merged on my stage tree, at:
	https://git.linuxtv.org/media_stage.git/log/

I'll be merging it at media_tree (either for 5.13 or 5.14) after the
end of the merge window (likely next week).

Please let me know if you find any problems on it.

PS.: please notice that my stage tree can be rebased.

Regards,
Mauro

> 
> It address the points from the existing reviews. I also did my own
> set of reviews, in order to avoid regressions.
> 
> Changes from v4 of the previous changeset:
> 
> - reworked i2c/css RPM get logic;
> - dropped two patches that could cause regressions;
> - am437x: keep using pm_runtime_get_sync on suspend/resume;
> - atmel: fix the returned code and add a print on failures at start streaming;
> - simplify some checks for return code > 0;
> - mdk-vcodec: properly handle RPM errors at device on logic;
> - venus: rework venus_sys_error_handler() logic;
> - sti/delta: fix an issue at the error checking logic.
> 
> Mauro Carvalho Chehab (25):
>   staging: media: rkvdec: fix pm_runtime_get_sync() usage count
>   staging: media: imx7-mipi-csis: fix pm_runtime_get_sync() usage count
>   media: venus: Rework error fail recover logic
>   media: s5p_cec: decrement usage count if disabled
>   media: i2c: ccs-core: return the right error code at suspend
>   media: i2c: imx334: fix the pm runtime get logic
>   media: exynos-gsc: don't resume at remove time
>   media: atmel: properly get pm_runtime
>   media: hantro: do a PM resume earlier
>   media: marvel-ccic: fix some issues when getting pm_runtime
>   media: mdk-mdp: fix pm_runtime_get_sync() usage count
>   media: rcar_fdp1: simplify error check logic at fdp_open()
>   media: rcar_fdp1: fix pm_runtime_get_sync() usage count
>   media: renesas-ceu: Properly check for PM errors
>   media: s5p: fix pm_runtime_get_sync() usage count
>   media: am437x: fix pm_runtime_get_sync() usage count
>   media: sh_vou: fix pm_runtime_get_sync() usage count
>   media: mtk-vcodec: fix PM runtime get logic
>   media: s5p-jpeg: fix pm_runtime_get_sync() usage count
>   media: sti/delta: use pm_runtime_resume_and_get()
>   media: sunxi: fix pm_runtime_get_sync() usage count
>   media: sti/bdisp: fix pm_runtime_get_sync() usage count
>   media: exynos4-is: fix pm_runtime_get_sync() usage count
>   media: exynos-gsc: fix pm_runtime_get_sync() usage count
>   media: i2c: ccs-core: fix pm_runtime_get_sync() usage count
> 
>  drivers/media/cec/platform/s5p/s5p_cec.c      |  7 ++-
>  drivers/media/i2c/ccs/ccs-core.c              | 41 ++++++++-----
>  drivers/media/i2c/imx334.c                    |  7 ++-
>  drivers/media/platform/am437x/am437x-vpfe.c   | 15 ++++-
>  drivers/media/platform/atmel/atmel-isc-base.c | 30 +++++++---
>  drivers/media/platform/atmel/atmel-isi.c      | 19 ++++--
>  drivers/media/platform/exynos-gsc/gsc-core.c  | 11 ++--
>  drivers/media/platform/exynos-gsc/gsc-m2m.c   |  4 +-
>  .../media/platform/exynos4-is/fimc-capture.c  |  6 +-
>  drivers/media/platform/exynos4-is/fimc-is.c   |  4 +-
>  .../platform/exynos4-is/fimc-isp-video.c      |  3 +-
>  drivers/media/platform/exynos4-is/fimc-isp.c  |  7 +--
>  drivers/media/platform/exynos4-is/fimc-lite.c |  5 +-
>  drivers/media/platform/exynos4-is/fimc-m2m.c  |  5 +-
>  drivers/media/platform/exynos4-is/media-dev.c |  9 +--
>  drivers/media/platform/exynos4-is/mipi-csis.c | 10 ++--
>  .../media/platform/marvell-ccic/mcam-core.c   |  9 ++-
>  drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c  |  6 +-
>  .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  4 +-
>  .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   |  8 ++-
>  .../platform/mtk-vcodec/mtk_vcodec_dec_pm.h   |  2 +-
>  drivers/media/platform/qcom/venus/core.c      | 59 +++++++++++++++----
>  drivers/media/platform/rcar_fdp1.c            | 28 ++++++---
>  drivers/media/platform/renesas-ceu.c          |  4 +-
>  drivers/media/platform/s5p-jpeg/jpeg-core.c   |  5 +-
>  drivers/media/platform/sh_vou.c               |  6 +-
>  drivers/media/platform/sti/bdisp/bdisp-v4l2.c |  7 ++-
>  drivers/media/platform/sti/delta/delta-v4l2.c |  8 +--
>  .../sunxi/sun8i-rotate/sun8i_rotate.c         |  2 +-
>  drivers/staging/media/hantro/hantro_drv.c     |  7 ++-
>  drivers/staging/media/imx/imx7-mipi-csis.c    |  7 +--
>  drivers/staging/media/rkvdec/rkvdec.c         |  2 +-
>  32 files changed, 220 insertions(+), 127 deletions(-)
> 



Thanks,
Mauro
