Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E7E23819E
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2019 01:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbfFFXKw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 19:10:52 -0400
Received: from merlin.infradead.org ([205.233.59.134]:43810 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbfFFXKv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jun 2019 19:10:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=WrR8a0nd7OqHeGMYq59lvGgYOhTcXv05lY92PTWM2CQ=; b=oGpZKv7v1449BYsCbjNBM23I59
        AeS10K3WrsuNY4wsvrv1v35sohJrGMRvaGQEKNq3MdRM8lvHiWBOBBBoPxXt+FXCQN5Fnem47OjSY
        Qzwa3F1vokFNDVeBNOtxbdTgUvwUk7VOD/k/FinOC44l2cTTG0crQ1sWOAIpg3/Jiq9Y4yiW0I9Aw
        WGO/zPFTdSE6bCX6qM5sF9XMPGXawRE5EctHBBcCVoct1Leh53VSTvD20ebDJhUzjIzEeDd4v3a1q
        zUAlixJtXCC1UQp7bOmgCiTpB1DT/LPw8z15jOb8ERhJ/KtT9nqL0MQW22vuzZ1QlwiEUEPuabx4m
        BH/G2evQ==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=dragon.dunlab)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hZ1Wn-0007f1-Gj; Thu, 06 Jun 2019 23:10:37 +0000
Subject: Re: [PATCH v2 2/3] media: imx7-media-csi: add i.MX6UL support
To:     =?UTF-8?Q?S=c3=a9bastien_Szymanski?= 
        <sebastien.szymanski@armadeus.com>, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        Shawn Guo <shawnguo@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
References: <20190606153825.8183-1-sebastien.szymanski@armadeus.com>
 <20190606153825.8183-2-sebastien.szymanski@armadeus.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <92ca6e6e-2ebd-cec4-4f75-2674fd2c3d99@infradead.org>
Date:   Thu, 6 Jun 2019 16:10:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190606153825.8183-2-sebastien.szymanski@armadeus.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/6/19 8:38 AM, Sébastien Szymanski wrote:
> i.MX7 and i.MX6UL/L have the same CSI controller. So add i.MX6UL/L support
> to imx7-media-csi driver.
> 
> Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
> ---
> 
> Changes for v2:
>  - rebase on top of linuxtv/master
>  - mention i.MX6UL/L in header and Kconfig help text
>  - rename csi_type to csi_soc_id
> 
>  drivers/staging/media/imx/Kconfig          |  4 +-
>  drivers/staging/media/imx/imx7-media-csi.c | 62 ++++++++++++++++------
>  2 files changed, 49 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/imx/Kconfig
> index ad3d7df6bb3c..8b6dc42c39e0 100644
> --- a/drivers/staging/media/imx/Kconfig
> +++ b/drivers/staging/media/imx/Kconfig
> @@ -22,11 +22,11 @@ config VIDEO_IMX_CSI
>  	  A video4linux camera sensor interface driver for i.MX5/6.
>  
>  config VIDEO_IMX7_CSI
> -	tristate "i.MX7 Camera Sensor Interface driver"
> +	tristate "i.MX6UL/L / i.MX7 Camera Sensor Interface driver"
>  	depends on VIDEO_IMX_MEDIA && VIDEO_DEV && I2C
>  	default y

Hi,
I realize that this "default y" is not part of this patch set, but we have
pretty strong guidance that a driver should not default to 'y' unless it is
needed for a system to boot.  If this driver is optional, then please drop
the 2 occurrences of "default y" in this Kconfig file.

thanks.
>  	help
>  	  Enable support for video4linux camera sensor interface driver for
> -	  i.MX7.
> +	  i.MX6UL/L or i.MX7.
>  endmenu
>  endif


-- 
~Randy
