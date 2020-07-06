Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34810215450
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 11:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728467AbgGFJA7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 05:00:59 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:49139 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728183AbgGFJA7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 05:00:59 -0400
Received: from localhost (lfbn-lyo-1-23-225.w86-202.abo.wanadoo.fr [86.202.118.225])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 7A35120000D;
        Mon,  6 Jul 2020 09:00:56 +0000 (UTC)
Date:   Mon, 6 Jul 2020 11:00:56 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Dariusz Marcinkiewicz <darekm@google.com>
Cc:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Dariusz Marcinkiewicz <darekm@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: cros-ec-cec: disable the device wakeup on remove
Message-ID: <20200706090056.GI6538@piout.net>
References: <20200706085240.1979622-1-darekm@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200706085240.1979622-1-darekm@google.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/07/2020 10:52:38+0200, Dariusz Marcinkiewicz wrote:
> The device is enabled for wake up while the driver is loaded.
> For symmetry, disable wakeup when it is removed.
> 

This is not necessary as it is handled by the core properly. There are
currently 73 calls to device_init_wakeup that are not necessary, this
would add one more.

> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
> ---
>  drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
> index 2d95e16cd248..3881ed7bc3d9 100644
> --- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
> +++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
> @@ -277,8 +277,6 @@ static int cros_ec_cec_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, cros_ec_cec);
>  	cros_ec_cec->cros_ec = cros_ec;
>  
> -	device_init_wakeup(&pdev->dev, 1);
> -
>  	cros_ec_cec->adap = cec_allocate_adapter(&cros_ec_cec_ops, cros_ec_cec,
>  						 DRV_NAME,
>  						 CEC_CAP_DEFAULTS |
> @@ -306,6 +304,8 @@ static int cros_ec_cec_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		goto out_probe_notify;
>  
> +	device_init_wakeup(&pdev->dev, 1);
> +
>  	return 0;
>  
>  out_probe_notify:
> @@ -335,6 +335,8 @@ static int cros_ec_cec_remove(struct platform_device *pdev)
>  					 cros_ec_cec->adap);
>  	cec_unregister_adapter(cros_ec_cec->adap);
>  
> +	device_init_wakeup(&pdev->dev, 0);
> +
>  	return 0;
>  }
>  
> -- 
> 2.27.0.212.ge8ba1cc988-goog
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
