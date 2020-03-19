Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FA1918C333
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 23:47:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727456AbgCSWrC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 18:47:02 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:49058 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727192AbgCSWrC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 18:47:02 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02JMkx2m047545;
        Thu, 19 Mar 2020 17:46:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584658019;
        bh=2XjKMbDopU1NocJeUvLQbJJB/tC/a6T62XsL3b/pXis=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=uxFuPA+RSEtKzIvweK1zESzpvBvZ/YD1Eonje3cOKdT0pueu4k7g+N5sMncIOCocO
         Gy6vt+n200WprILA7xL/k3HHTyOgS7QwrDKJBJfBnIXs7ISTBtYUOygCV63Zy0bLmV
         fRMI5IJuuS2zm96ZGbzx7Pz3WHCKL4fmBQe8gt1I=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02JMkxGB034353
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Mar 2020 17:46:59 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Mar 2020 17:46:58 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Mar 2020 17:46:58 -0500
Received: from [10.250.87.129] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02JMkwj4070517;
        Thu, 19 Mar 2020 17:46:58 -0500
Subject: Re: [PATCH v2 18/19] media: ti-vpe: cal: improve wait for stop-state
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        <linux-media@vger.kernel.org>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
References: <20200319075023.22151-1-tomi.valkeinen@ti.com>
 <20200319075023.22151-19-tomi.valkeinen@ti.com>
From:   Benoit Parrot <bparrot@ti.com>
Message-ID: <0e7841fe-56b4-68e6-b839-2951726fe7b2@ti.com>
Date:   Thu, 19 Mar 2020 17:46:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200319075023.22151-19-tomi.valkeinen@ti.com>
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
> Sometimes there is a timeout when waiting for the Stop-State.  Testing
> shows that sometimes we need to wait more than what the current code
> does. It is not clear how long this wait can be, but it is based on how
> quickly the sensor provides a valid clock, and how quickly CAL syncs to
> it.
> 
> Change the code to make it more obvious how long we'll wait, and set a
> wider range for usleep_range. Increase the timeout to 750ms.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Tested-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Benoit Parrot <bparrot@ti.com>

> ---
>  drivers/media/platform/ti-vpe/cal.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index 0dc7892881e7..0f90078ee8c2 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -846,19 +846,16 @@ static void csi2_wait_complexio_reset(struct cal_ctx *ctx)
>  
>  static void csi2_wait_stop_state(struct cal_ctx *ctx)
>  {
> -	int i;
> +	unsigned long timeout;
>  
> -	for (i = 0; i < 10; i++) {
> +	timeout = jiffies + msecs_to_jiffies(750);
> +	while (time_before(jiffies, timeout)) {
>  		if (reg_read_field(ctx->dev,
>  				   CAL_CSI2_TIMING(ctx->csi2_port),
>  				   CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK) == 0)
>  			break;
> -		usleep_range(1000, 1100);
> +		usleep_range(500, 5000);
>  	}
> -	ctx_dbg(3, ctx, "CAL_CSI2_TIMING(%d) = 0x%08x Stop State Reached %s\n",
> -		ctx->csi2_port,
> -		reg_read(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port)),
> -		(i >= 10) ? "(timeout)" : "");
>  
>  	if (reg_read_field(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port),
>  			   CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK) != 0)
> 
