Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A04FC18C332
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 23:46:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727448AbgCSWqh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 18:46:37 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:34752 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727331AbgCSWqh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 18:46:37 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02JMkY78042618;
        Thu, 19 Mar 2020 17:46:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584657994;
        bh=jiomwRHGwwslOIrJKXqYVVVaRBJo5iQj3ukD5Ru7Na0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=eGQKqgGUWvao587xyIUOdddMm6i7wDHf/bUMO/yGpe/iLswaNlykHTUXdJ5skHvb3
         4X9FzMHmW217nOJ064dxoaUq/YXo9sjwJnHeP0LyeLc8odjqA2Jnqv1typf8mahXzP
         Sfm1/JqlB/LzVSp6g2XPUdSxfO1GDY0qKxA3+ONo=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02JMkYQQ121592
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Mar 2020 17:46:34 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Mar 2020 17:46:33 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Mar 2020 17:46:34 -0500
Received: from [10.250.87.129] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02JMkXSC062280;
        Thu, 19 Mar 2020 17:46:33 -0500
Subject: Re: [PATCH v2 17/19] media: ti-vpe: cal: improve wait for CIO
 resetdone
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        <linux-media@vger.kernel.org>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
References: <20200319075023.22151-1-tomi.valkeinen@ti.com>
 <20200319075023.22151-18-tomi.valkeinen@ti.com>
From:   Benoit Parrot <bparrot@ti.com>
Message-ID: <abcb0681-ff99-2505-e00a-1c0bcc352137@ti.com>
Date:   Thu, 19 Mar 2020 17:46:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200319075023.22151-18-tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tomi,

Thanks for the patch.

On 3/19/20 2:50 AM, Tomi Valkeinen wrote:
> Sometimes there is a timeout when waiting for the 'ComplexIO Reset
> Done'.  Testing shows that sometimes we need to wait more than what the
> current code does. It is not clear how long this wait can be, but it is
> based on how quickly the sensor provides a valid clock, and how quickly
> CAL syncs to it.
> 
> Change the code to make it more obvious how long we'll wait, and set a
> wider range for usleep_range. Increase the timeout to 750ms.

Hmm strange, I am pretty sure I had tried larger values in the past...

> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Tested-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Benoit Parrot <bparrot@ti.com>

> ---
>  drivers/media/platform/ti-vpe/cal.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index ed68ad58121e..0dc7892881e7 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -825,20 +825,17 @@ static void csi2_phy_init(struct cal_ctx *ctx)
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
> -		ctx->csi2_port,
> -		reg_read(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port)), i,
> -		(i >= 250) ? "(timeout)" : "");
>  
>  	if (reg_read_field(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
>  			   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_MASK) !=
> 
