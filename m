Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60BF63634E9
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 13:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbhDRLzh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Apr 2021 07:55:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbhDRLzg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Apr 2021 07:55:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80129C06174A
        for <linux-media@vger.kernel.org>; Sun, 18 Apr 2021 04:55:08 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF49C51E;
        Sun, 18 Apr 2021 13:55:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618746907;
        bh=oWteC8HzZfZM/hTPPWQwBbSqD7ej3JWCjhFt5/m5q6A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KYhy+IuGiYAYo7mD91+9GoKG181DXRm5eCnIM1jYeEhnRqtqfZCEMFaK7vQp1niq1
         KrqU/v8LI7UMwM17ipow8LpQnWed43W0I3SMxGyfZ2R6XmOxJ1paZOhD4ECzjS1nuz
         x4br7L/ONHjBx17Lq3xeHqNHpje4aiVWl1AqzBB4=
Date:   Sun, 18 Apr 2021 14:55:03 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 08/28] media: ti-vpe: cal: change index and cport to u8
Message-ID: <YHweFzMQ1U6SY238@pendragon.ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-9-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210412113457.328012-9-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, Apr 12, 2021 at 02:34:37PM +0300, Tomi Valkeinen wrote:
> cal_ctx's index and cport fields are numbers less than 8. In the
> following patches we will get a bunch of new fields, all of which are
> similar small numbers, so lets change the type to u8.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/ti-vpe/cal.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
> index 09ad20faa9e1..251bb0ba7b3b 100644
> --- a/drivers/media/platform/ti-vpe/cal.h
> +++ b/drivers/media/platform/ti-vpe/cal.h
> @@ -217,8 +217,8 @@ struct cal_ctx {
>  
>  	unsigned int		sequence;
>  	struct vb2_queue	vb_vidq;
> -	unsigned int		index;
> -	unsigned int		cport;
> +	u8			index;
> +	u8			cport;
>  };
>  
>  extern unsigned int cal_debug;

-- 
Regards,

Laurent Pinchart
