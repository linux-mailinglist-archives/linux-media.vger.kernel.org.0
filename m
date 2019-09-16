Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8292BB32F3
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2019 03:28:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729171AbfIPB2t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Sep 2019 21:28:49 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:7147 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729166AbfIPB2s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Sep 2019 21:28:48 -0400
X-UUID: 79585c2e7a7a4e31906063ba60eed741-20190916
X-UUID: 79585c2e7a7a4e31906063ba60eed741-20190916
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <yingjoe.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1316106580; Mon, 16 Sep 2019 09:28:42 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 16 Sep 2019 09:28:40 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 16 Sep 2019 09:28:41 +0800
Message-ID: <1568597321.26177.9.camel@mtksdaap41>
Subject: Re: [RFC PATCH V4 1/4] media: platform: mtk-isp: Add Mediatek
 sensor interface driver
From:   Yingjoe Chen <yingjoe.chen@mediatek.com>
To:     Louis Kuo <louis.kuo@mediatek.com>
CC:     <hans.verkuil@cisco.com>,
        <laurent.pinchart+renesas@ideasonboard.com>, <tfiga@chromium.org>,
        <keiichiw@chromium.org>, <matthias.bgg@gmail.com>,
        <mchehab@kernel.org>, <devicetree@vger.kernel.org>,
        <Sean.Cheng@mediatek.com>, <Rynn.Wu@mediatek.com>,
        <srv_heupstream@mediatek.com>, <Jerry-ch.Chen@mediatek.com>,
        <jungo.lin@mediatek.com>, <sj.huang@mediatek.com>,
        <yuzhao@chromium.org>, <linux-mediatek@lists.infradead.org>,
        <zwisler@chromium.org>, <christie.yu@mediatek.com>,
        <frederic.chen@mediatek.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>
Date:   Mon, 16 Sep 2019 09:28:41 +0800
In-Reply-To: <20190915065004.20257-2-louis.kuo@mediatek.com>
References: <20190915065004.20257-1-louis.kuo@mediatek.com>
         <20190915065004.20257-2-louis.kuo@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, 2019-09-15 at 14:50 +0800, Louis Kuo wrote:
> This patch adds Mediat:ek's sensor interface driver. Sensor interface
> driver
> is a MIPI-CSI2 host driver, namely, a HW camera interface controller.
> It support a widely adopted, simple, high-speed protocol primarily
> intended
> for point-to-point image and video transmission between cameras and host
> devices.

Please properly wrap the commit text and fix typo.


> 
> The mtk-isp directory will contain drivers for multiple IP blocks found in
> Mediatek ISP system. It will include ISP Pass 1 driver, sensor interface
> driver, DIP driver and face detection driver.
> 
> Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> ---
>  drivers/media/platform/Makefile               |    2 +
>  drivers/media/platform/mtk-isp/Makefile       |    3 +
>  .../media/platform/mtk-isp/isp_50/Makefile    |    5 +
>  .../platform/mtk-isp/isp_50/seninf/Makefile   |    6 +
>  .../mtk-isp/isp_50/seninf/mtk_seninf.c        | 1011 +++++++++++++++++
>  .../mtk-isp/isp_50/seninf/mtk_seninf_def.h    |   59 +
>  .../mtk-isp/isp_50/seninf/mtk_seninf_reg.h    |  853 ++++++++++++++
>  7 files changed, 1939 insertions(+)
>  create mode 100644 drivers/media/platform/mtk-isp/Makefile
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/Makefile
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/seninf/Makefile
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf_def.h
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf_reg.h
> 
> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
> index 7cbbd925124c..b0f4543f2f86 100644
> --- a/drivers/media/platform/Makefile
> +++ b/drivers/media/platform/Makefile
> @@ -73,6 +73,8 @@ obj-$(CONFIG_VIDEO_ROCKCHIP_RGA)	+= rockchip/rga/
>  
>  obj-y	+= omap/
>  
> +obj-y	+= mtk-isp/
> +
>  obj-$(CONFIG_VIDEO_AM437X_VPFE)		+= am437x/
>  
>  obj-$(CONFIG_VIDEO_XILINX)		+= xilinx/
> diff --git a/drivers/media/platform/mtk-isp/Makefile b/drivers/media/platform/mtk-isp/Makefile
> new file mode 100644
> index 000000000000..c17fb3fc3340
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-y += isp_50/
> diff --git a/drivers/media/platform/mtk-isp/isp_50/Makefile b/drivers/media/platform/mtk-isp/isp_50/Makefile
> new file mode 100644
> index 000000000000..8b4a792328e5
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/Makefile
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +ifeq ($(CONFIG_MTK_SENINF),y)
> +obj-y += seninf/
> +endif


Please use 'obj-$(CONFIG_MTK_SENINF) += seninf/' instead.
In fact, as Sakari mention in previous review, you should just remove
the check.

You should address all comments in previous run, otherwise what's the
point for resend and the review?


> diff --git a/drivers/media/platform/mtk-isp/isp_50/seninf/Makefile b/drivers/media/platform/mtk-isp/isp_50/seninf/Makefile
> new file mode 100644
> index 000000000000..bf193feb0ce9
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/seninf/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +MODULE		= mtk_seninf
> +LIB_FILES	= mtk_seninf
> +
> +obj-$(CONFIG_MTK_SENINF) += mtk_seninf.o
> diff --git a/drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c b/drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c
> new file mode 100644
> index 000000000000..3253510cf7fd
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c
> @@ -0,0 +1,1011 @@
> +// SPDX-License-Identifier: GPL-2.0


<...>

> +
> +static struct platform_driver seninf_pdrv = {
> +	.driver	= {
> +		.name	= "seninf",
> +		.pm  = &runtime_pm_ops,
> +		.of_match_table = of_match_ptr(mtk_seninf_of_match),
> +	},
> +	.probe	= seninf_probe,
> +	.remove	= seninf_remove,
> +};
> +
> +module_platform_driver(seninf_pdrv);
> +
> +MODULE_DESCRIPTION("MTK seninf driver");
> +MODULE_AUTHOR("Louis Kuo <louis.kuo@mediatek.com>");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("MTK:mtk_seninf");

You don't need MODULE_* since this can't be built as module now.

However, I think this should be able to build as module.

Joe.C


