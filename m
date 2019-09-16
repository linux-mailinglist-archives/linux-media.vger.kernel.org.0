Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73F1EB32E2
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2019 03:18:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728999AbfIPBSU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Sep 2019 21:18:20 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:50868 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726472AbfIPBST (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Sep 2019 21:18:19 -0400
X-UUID: 9fd79929a08c40069bd8474fccda773a-20190916
X-UUID: 9fd79929a08c40069bd8474fccda773a-20190916
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by mailgw02.mediatek.com
        (envelope-from <yingjoe.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1504289671; Mon, 16 Sep 2019 09:18:12 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 16 Sep 2019 09:18:11 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 16 Sep 2019 09:18:11 +0800
Message-ID: <1568596691.26177.1.camel@mtksdaap41>
Subject: Re: [RFC PATCH V4 2/4] media: platform: Add Mediatek sensor
 interface driver KConfig
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
Date:   Mon, 16 Sep 2019 09:18:11 +0800
In-Reply-To: <20190915065004.20257-3-louis.kuo@mediatek.com>
References: <20190915065004.20257-1-louis.kuo@mediatek.com>
         <20190915065004.20257-3-louis.kuo@mediatek.com>
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
> This patch adds KConfig for sensor interface driver. Sensor interface
> driver
> is a MIPI-CSI2 host driver, namely, a HW camera interface controller.
> It support a widely adopted, simple, high-speed protocol primarily
> intended
> for point-to-point image and video transmission between cameras and host
> devices.
> 
> Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> ---
>  drivers/media/platform/mtk-isp/Kconfig | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 drivers/media/platform/mtk-isp/Kconfig

Please squash this into driver patch.


> diff --git a/drivers/media/platform/mtk-isp/Kconfig b/drivers/media/platform/mtk-isp/Kconfig
> new file mode 100644
> index 000000000000..bc7fd01808b3
> --- /dev/null
> +++ b/drivers/media/platform/mtk-isp/Kconfig
> @@ -0,0 +1,17 @@
> +config MTK_SENINF
> +	bool "Mediatek mipi csi2 driver"

MediaTek

> +	depends on VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
> +	depends on MEDIA_CAMERA_SUPPORT
> +	select V4L2_FWNODE
> +
> +	default n

Do not add 'default n'
Remove the extra blank line.

> +	help
> +	    This driver provides a mipi-csi2 host driver used as a
> +	    interface to connect camera with Mediatek's

MediaTek

> +	    MT8183 SOCs. It is able to handle multiple cameras
> +	    at the same time.
> +
> +	    Choose y if you want to use Mediatek SoCs to create image

MediaTek

> +	    capture application such as video recording and still image
> +	    capture.
> +


