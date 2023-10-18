Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC8467CDC0F
	for <lists+linux-media@lfdr.de>; Wed, 18 Oct 2023 14:41:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230397AbjJRMlX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Oct 2023 08:41:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231289AbjJRMlM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Oct 2023 08:41:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC071106
        for <linux-media@vger.kernel.org>; Wed, 18 Oct 2023 05:41:08 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8F6545AA;
        Wed, 18 Oct 2023 14:40:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697632859;
        bh=Abg4cWW/qvbpQ3j6SQ/yO305OVSh2VH6ub81c6y154c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mjDEledRj0dUARTZxnGhZTpLLu6KeBBUbkhMx+uiEXP8kKEgRqHUFdz0fk0rbOMD5
         en0c90IKeYR1FJt5prJnPq/2UM81Mxn7Az8GvNz8F6dG5PQLebZWI/Ta0h/mZzQY3x
         wnahfPB6datT0LfDyYHZvgzHGG0A5jWSygI4NTyE=
Date:   Wed, 18 Oct 2023 15:41:13 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Umang Jain <umang.jain@ideasonboard.com>
Cc:     linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <error27@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v2 2/3] staging: vc04_services: bcm2835-audio: Drop
 MODULE_ALIAS
Message-ID: <20231018124113.GH11118@pendragon.ideasonboard.com>
References: <20231018054214.824296-1-umang.jain@ideasonboard.com>
 <20231018054214.824296-3-umang.jain@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231018054214.824296-3-umang.jain@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Umang,

Thank you for the patch.

On Wed, Oct 18, 2023 at 11:12:13AM +0530, Umang Jain wrote:
> Drop MODULE_ALIAS in favour of MODULE_DEVICE_TABLE as the module
> alias should be dropped from there.
> 
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  drivers/staging/vc04_services/bcm2835-audio/bcm2835.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/vc04_services/bcm2835-audio/bcm2835.c b/drivers/staging/vc04_services/bcm2835-audio/bcm2835.c
> index 06bdc7673d4b..d5bd8a36a010 100644
> --- a/drivers/staging/vc04_services/bcm2835-audio/bcm2835.c
> +++ b/drivers/staging/vc04_services/bcm2835-audio/bcm2835.c
> @@ -311,12 +311,19 @@ static int snd_bcm2835_alsa_resume(struct vchiq_device *device)
>  
>  #endif
>  
> +static struct vchiq_bus_device_id device_id_table[] = {
> +	{ .name = "bcm2835-audio" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(vchiq_bus, device_id_table);

With the "_bus" suffix dropped (see review of 1/3),

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>  static struct vchiq_driver bcm2835_alsa_driver = {
>  	.probe = snd_bcm2835_alsa_probe,
>  #ifdef CONFIG_PM
>  	.suspend = snd_bcm2835_alsa_suspend,
>  	.resume = snd_bcm2835_alsa_resume,
>  #endif
> +	.id_table = device_id_table,
>  	.driver = {
>  		.name = "bcm2835-audio",
>  	},
> @@ -326,4 +333,3 @@ module_vchiq_driver(bcm2835_alsa_driver);
>  MODULE_AUTHOR("Dom Cobley");
>  MODULE_DESCRIPTION("Alsa driver for BCM2835 chip");
>  MODULE_LICENSE("GPL");
> -MODULE_ALIAS("bcm2835-audio");

-- 
Regards,

Laurent Pinchart
