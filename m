Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6599A39BA25
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 15:47:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230132AbhFDNtZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 09:49:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230122AbhFDNtZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Jun 2021 09:49:25 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2468C061766
        for <linux-media@vger.kernel.org>; Fri,  4 Jun 2021 06:47:38 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5DE809E5;
        Fri,  4 Jun 2021 15:47:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1622814457;
        bh=b8Kf4Djd5P9zAOvs1iD+hjvLw/un9BhGjbudvs+bEH0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QMf08xbSaCjptVyNpU5Ip+GzjY3RIwQNruYExz7Vtj77XEziAdPb7WVQ/WMy29xWs
         dcPnQHkrMOq06TdJBUmu7H1VmS+f9Rj21JLjcK3oTe17PScilTw63TMM0MFvHjV4yh
         mom9U77mZd/2D4z4QyAdr/EPUGAt3ZDmqKhA5tlI=
Date:   Fri, 4 Jun 2021 16:47:25 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Pratyush Yadav <p.yadav@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 21/38] media: ti-vpe: cal: handle
 cal_ctx_v4l2_register error
Message-ID: <YLou7fPDyQaCaz1o@pendragon.ideasonboard.com>
References: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
 <20210524110909.672432-22-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210524110909.672432-22-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, May 24, 2021 at 02:08:52PM +0300, Tomi Valkeinen wrote:
> cal_async_notifier_complete() doesn't handle errors returned from
> cal_ctx_v4l2_register(). Add the error handling.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/ti-vpe/cal.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index ba8821a3b262..9e051c2e84a9 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -743,8 +743,12 @@ static int cal_async_notifier_complete(struct v4l2_async_notifier *notifier)
>  	int ret = 0;
>  
>  	for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
> -		if (cal->ctx[i])
> -			cal_ctx_v4l2_register(cal->ctx[i]);
> +		if (!cal->ctx[i])
> +			continue;
> +
> +		ret = cal_ctx_v4l2_register(cal->ctx[i]);
> +		if (ret)
> +			return ret;

This part looks good, so

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Don't we need to call cal_ctx_v4l2_unregister() in the error path of
cal_async_notifier_register() though ?

>  	}
>  
>  	if (cal_mc_api)

-- 
Regards,

Laurent Pinchart
