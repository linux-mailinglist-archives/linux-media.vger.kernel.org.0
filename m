Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57AA83A2A27
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 13:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230166AbhFJL2o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 07:28:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbhFJL2o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 07:28:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11301C061574
        for <linux-media@vger.kernel.org>; Thu, 10 Jun 2021 04:26:48 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 62D368D4;
        Thu, 10 Jun 2021 13:26:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623324406;
        bh=hlV1kUmm+rIfWKNBpjJn8I+ssReywSMR0S4G1KGM4Zs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EKBUv4zngroBeMB9s4LusBXwJjl2jTDTI1la8HBDdHvh/EdQkufhFLT//CSZC5EKT
         H4MYk074CrmfZiHzogz70ZhkSR0psQKt6akohvkUaa1cIeFCYqjJk96BTiYAEJWWKe
         KMKnKNyPNPiwH/+K5AH5Y7MvGbn8TXiwdpx6NndI=
Date:   Thu, 10 Jun 2021 14:26:28 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v3 4/5] media: v4l2-subdev: v4l2_subdev_free_state() to
 accept a NULL state
Message-ID: <YMH25MJfvIu9hIta@pendragon.ideasonboard.com>
References: <20210609100228.278798-1-tomi.valkeinen@ideasonboard.com>
 <20210610094903.343183-1-tomi.valkeinen@ideasonboard.com>
 <20210610094903.343183-3-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210610094903.343183-3-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Thu, Jun 10, 2021 at 12:49:02PM +0300, Tomi Valkeinen wrote:
> Make v4l2_subdev_free_state() accept a NULL state.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index dacae53b68d5..25c80d6de23b 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -931,7 +931,8 @@ EXPORT_SYMBOL_GPL(v4l2_subdev_alloc_state);
>  
>  void v4l2_subdev_free_state(struct v4l2_subdev_state *state)
>  {
> -	kvfree(state->pads);
> +	if (state)
> +		kvfree(state->pads);
>  	kfree(state);

I'd write

	if (!state)
		return;

as I expect we'll have more code in the future.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_free_state);

-- 
Regards,

Laurent Pinchart
