Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 863663BFA79
	for <lists+linux-media@lfdr.de>; Thu,  8 Jul 2021 14:42:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230451AbhGHMpH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jul 2021 08:45:07 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:50537 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230417AbhGHMpH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jul 2021 08:45:07 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 764AA240005;
        Thu,  8 Jul 2021 12:42:21 +0000 (UTC)
Date:   Thu, 8 Jul 2021 14:43:10 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v7 08/27] media: entity: Add has_route entity operation
Message-ID: <20210708124310.ievjt7effrkc6g6d@uno.localdomain>
References: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
 <20210524104408.599645-9-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210524104408.599645-9-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,
   a small note

On Mon, May 24, 2021 at 01:43:49PM +0300, Tomi Valkeinen wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> The optional operation can be used by entities to report whether two
> pads are internally connected.
>
> While at there, fix a Sphinx compiler warning in a comment block a few
> lines above.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  include/media/media-entity.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index 516d73a2941e..ad4020b2df65 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -187,6 +187,7 @@ enum media_pad_signal_type {
>   * @flags:	Pad flags, as defined in
>   *		:ref:`include/uapi/linux/media.h <media_header>`
>   *		(seek for ``MEDIA_PAD_FL_*``)
> + *
>   * .. note::
>   *
>   *    @stream_count reference count must never be negative, but is a signed
> @@ -214,6 +215,10 @@ struct media_pad {
>   * @link_validate:	Return whether a link is valid from the entity point of
>   *			view. The media_pipeline_start() function
>   *			validates all links by calling this operation. Optional.
> + * @has_route:		Return whether a route exists inside the entity between
> + *			two given pads. Pads are passed to the operation ordered
> + *			by index. Optional: If the operation isn't implemented

According to the next patch, this doesn't seem to be 'Optional:' :)

Thanks
   j

> + *			all pads will be considered as connected.
>   *
>   * .. note::
>   *
> @@ -227,6 +232,8 @@ struct media_entity_operations {
>  			  const struct media_pad *local,
>  			  const struct media_pad *remote, u32 flags);
>  	int (*link_validate)(struct media_link *link);
> +	bool (*has_route)(struct media_entity *entity, unsigned int pad0,
> +			  unsigned int pad1);
>  };
>
>  /**
> --
> 2.25.1
>
