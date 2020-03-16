Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3E71186898
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 11:05:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730564AbgCPKFI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 06:05:08 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:55945 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730557AbgCPKFI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 06:05:08 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud7.xs4all.net with ESMTPA
        id DmcIjxAXQEE3qDmcLjdTuh; Mon, 16 Mar 2020 11:05:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1584353106; bh=2MzIfRVY9hk4rDe47x8OpIaKR2XtBgFnCFMQsgDqjos=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=XUwwRkGeeve7U3LWSiiZggBCff2ch9yls8yjDWVNCYQyI3e1WqL2UG3zkyNn94K64
         hvHRwO0lqSi7P35uDGzA2//QCNPXumO2W6uGZgDaenjZMlBQi4y3jjoewUhUARZcgT
         7leYOUAxqjzEH1e7p0nn0vvHMNWyHqxBAG8wdYE8xRl+RpEdSRFpWR+hmvo7YNPpZH
         YEY5QnXJAP9ZtCzlnop6zBMv0PbU99MgBH0uiFecMvy+oNFpToZedEioxvgO8nH1sw
         Y1QM43r8SqB9uXMamAvuIOug59ExGp2KgqexS/Fp6YA3OmI+dAJWY/KwD6rRALb/+D
         E63OI9ByHFPNg==
Subject: Re: [PATCH 14/16] media: ti-vpe: cal: improve wait for CIO resetdone
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        linux-media@vger.kernel.org, Benoit Parrot <bparrot@ti.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200313114121.32182-1-tomi.valkeinen@ti.com>
 <20200313114121.32182-14-tomi.valkeinen@ti.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <1da1aa0c-ac99-bfcb-d341-452be9997611@xs4all.nl>
Date:   Mon, 16 Mar 2020 11:05:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200313114121.32182-14-tomi.valkeinen@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPKD+a6RjKIHyCB9bGkF1o4Ch/ct+NYpGb9woFWEbx/ko+zMgGaAO9SMJZOXLjuTzHsq+07cUho/AjEQ6GV7pJNlwJPcOLJoh04yhVEFz4lPWRfkpiKj
 O6YdmsiFbe97GluqmbTUdu+K9fP5nTDb3bi1LUfFtwIX6UQQ7v9wE/BB0PGh4ytUZ36t+taxx5ADZJf4NEjvMAWyPZQu0SfJpa32PNzM3R0dgEkcwTyEJIUu
 sd3vvMbp+aAOD9gNeDEZ5ue0D8zYLtIu/x98jMyDQAH1WrTcUPkIFvSQ03ggUbPfNzPyeVxZ8BGkATy5YWjizQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/13/20 12:41 PM, Tomi Valkeinen wrote:
> Sometimes waiting for ComplexIO resetdone timeouts. 

This sentence is hard to read. You probably mean:

Sometimes there is a timeout when waiting for the 'ComplexIO Reset Done'.

Regards,

	Hans

Testing shows that
> sometimes we need to wait more than what the current code does. It is
> not clear how long this wait can be, but it is based on how quickly the
> sensor provides a valid clock, and how quickly CAL syncs to it.
> 
> Change the code to make it more obvious how long we'll wait, and set a
> wider range for usleep_range. Increase the timeout to 750ms.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/media/platform/ti-vpe/cal.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index 319312770eea..929f9b3ca4f9 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -824,20 +824,21 @@ static void csi2_phy_init(struct cal_ctx *ctx)
>  
>  static void csi2_wait_complexio_reset(struct cal_ctx *ctx)
>  {
> -	int i;
> +	unsigned long timeout;
>  
> -	for (i = 0; i < 250; i++) {
> +	timeout = jiffies + msecs_to_jiffies(750);
> +	while (time_before(jiffies, timeout)) {
>  		if (reg_read_field(ctx->dev,
>  				   CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
>  				   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_MASK) ==
>  		    CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETCOMPLETED)
>  			break;
> -		usleep_range(1000, 1100);
> +		usleep_range(500, 5000);
>  	}
> -	ctx_dbg(3, ctx, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x Complex IO Reset Done (%d) %s\n",
> +
> +	ctx_dbg(3, ctx, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x Complex IO Reset Done\n",
>  		ctx->csi2_port,
> -		reg_read(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port)), i,
> -		(i >= 250) ? "(timeout)" : "");
> +		reg_read(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port)));
>  
>  	if (reg_read_field(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
>  			   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_MASK) !=
> 

