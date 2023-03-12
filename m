Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AEDB6B6614
	for <lists+linux-media@lfdr.de>; Sun, 12 Mar 2023 14:01:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbjCLNBp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Mar 2023 09:01:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbjCLNBn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Mar 2023 09:01:43 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 893233864A
        for <linux-media@vger.kernel.org>; Sun, 12 Mar 2023 06:01:42 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-76-145-228-nat.elisa-mobile.fi [85.76.145.228])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 22F0E814;
        Sun, 12 Mar 2023 14:01:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1678626100;
        bh=3FDP3Dg4M0ucCu7F/Q2MN3VS4CdbZAAjYPM9xzkcnyU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gyA7JfdHSiZ+LlTsffmO+l29RR6+3OAPsKxWqAw5yeP9b+mTAc31Ayp7r2Y/acyuz
         dPCfNUDHEHnAfdFcRY5mz/gKf5TLmCR647VMR8TwdKC5J6PF8j62mXmFup/1+cYRiU
         AT+rtkR3kQ+bnoMlM3CEdXs6T73qFWanNaFvlbJU=
Date:   Sun, 12 Mar 2023 15:01:06 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        hdegoede@redhat.com,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kate Hsuan <hpa@redhat.com>
Subject: Re: [PATCH 1/1] media: v4l: subdev: Make link validation safer
Message-ID: <20230312130106.GF2545@pendragon.ideasonboard.com>
References: <20230309122716.1624141-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230309122716.1624141-1-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Thu, Mar 09, 2023 at 02:27:16PM +0200, Sakari Ailus wrote:
> Link validation currently accesses invalid pointers if the link passed to it
> is not between two sub-devices. This is of course a driver bug.
> 
> Ignore the error but print a debug message, as this is how it used to work
> previously.
> 
> Fixes: a6b995ed03ff ("media: subdev: use streams in v4l2_subdev_link_validate()")
> Reported-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reported-and-tested-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 1bebcda2bd20c..dd911180ec899 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1209,6 +1209,17 @@ int v4l2_subdev_link_validate(struct media_link *link)
>  	struct v4l2_subdev_state *source_state, *sink_state;
>  	int ret;
>  
> +	if (!is_media_entity_v4l2_subdev(link->sink->entity)) {
> +		pr_warn_once("entity \"%s\" not a V4L2 sub-device, driver bug!\n",
> +			     link->sink->entity->name);

Printing the whole link would make it easier to debug the problem:

		pr_warn_once("sink of link '%s':%u->'%s':%u is not a V4L2 sub-device, driver bug!\n",
			     link->source->entity->name, link->source->index);
			     link->sink->entity->name, link->sink->index);

Same below. With this, and the other comments in the mail thread
addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +		return 0;
> +	}
> +	if (!is_media_entity_v4l2_subdev(link->source->entity)) {
> +		pr_warn_once("entity \"%s\" not a V4L2 sub-device, driver bug!\n",
> +			     link->source->entity->name);
> +		return 0;
> +	}
> +
>  	sink_sd = media_entity_to_v4l2_subdev(link->sink->entity);
>  	source_sd = media_entity_to_v4l2_subdev(link->source->entity);
>  

-- 
Regards,

Laurent Pinchart
