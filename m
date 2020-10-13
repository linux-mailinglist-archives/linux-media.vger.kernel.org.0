Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C640128C9E6
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 10:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391035AbgJMIM5 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 13 Oct 2020 04:12:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391120AbgJMIML (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 04:12:11 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68434C0613D9
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2020 01:12:08 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kSFPX-0001LU-SH; Tue, 13 Oct 2020 10:11:55 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kSFPV-0003Qg-TN; Tue, 13 Oct 2020 10:11:53 +0200
Message-ID: <35ebc7a7c56c86dee523812bfb55d1bac96f4b42.camel@pengutronix.de>
Subject: Re: [PATCH 04/18] media: hantro: add reset controller support
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Adrian Ratiu <adrian.ratiu@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Fruehberger Peter <Peter.Fruehberger@de.bosch.com>,
        kuhanh.murugasen.krishnan@intel.com,
        Daniel Vetter <daniel@ffwll.ch>, kernel@collabora.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Date:   Tue, 13 Oct 2020 10:11:53 +0200
In-Reply-To: <20201012205957.889185-5-adrian.ratiu@collabora.com>
References: <20201012205957.889185-1-adrian.ratiu@collabora.com>
         <20201012205957.889185-5-adrian.ratiu@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Adrian,

On Mon, 2020-10-12 at 23:59 +0300, Adrian Ratiu wrote:
> Some SoCs might have a reset controller which disables clocks
> by default in reset state which then drivers need to unreset
> before being able to ungate a specific clock.
> 
> In this specific case, the hantro driver needs to ensure the
> peripheral clock can be properly ungated otherwise MMIO reg
> values can't be accessed.
> 
> If the SoC has no reset controller or there is no "resets" DT
> property defined, this new code will have no effect.
> 
> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/staging/media/hantro/hantro.h     | 1 +
>  drivers/staging/media/hantro/hantro_drv.c | 8 ++++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
> index 65f9f7ea7dcf..bb442eb1974e 100644
> --- a/drivers/staging/media/hantro/hantro.h
> +++ b/drivers/staging/media/hantro/hantro.h
> @@ -183,6 +183,7 @@ struct hantro_dev {
>  	struct platform_device *pdev;
>  	struct device *dev;
>  	struct clk_bulk_data *clocks;
> +	struct reset_control *reset;
>  	void __iomem **reg_bases;
>  	void __iomem *enc_base;
>  	void __iomem *dec_base;
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index 3cd00cc0a364..c2ea54552ce9 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -17,6 +17,7 @@
>  #include <linux/pm.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/slab.h>
> +#include <linux/reset.h>
>  #include <linux/videodev2.h>
>  #include <linux/workqueue.h>
>  #include <media/v4l2-event.h>
> @@ -747,6 +748,13 @@ static int hantro_probe(struct platform_device *pdev)
>  
>  	INIT_DELAYED_WORK(&vpu->watchdog_work, hantro_watchdog);
>  
> +	vpu->reset = devm_reset_control_get_optional_exclusive(&pdev->dev,
> +							       NULL);
> +	if (IS_ERR(vpu->reset))
> +		vpu->reset = NULL;

Please return the error. If the optional reset is missing from the
device tree, devm_reset_control_get_optional_exclusive() returns NULL
already.

regards
Philipp
