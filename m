Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A38F5B0CE5
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 21:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbiIGTJg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 15:09:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbiIGTJ0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 15:09:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BF11F23
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 12:09:24 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C07B478;
        Wed,  7 Sep 2022 21:09:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1662577762;
        bh=uhTxXWiasDstU8bzNOnJQEc/9xqJS1+3B9u4d61pqNE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tlrEGkPgTSuZ/nxRgXLQmPKhKzaMHQJ8VzEQpUm2PdOkgD5faKPXuPvzAjwupVUuC
         8egME6PRyDWP3Yk5j/aPPnC7yuqBtAeiyHe/0zJ7AOFFXKfxESUHC9KBeGhKyT5hup
         xGrdMbjGKsdTLGVXZn6o5dWlgyY+z3QdPj07WL4g=
Date:   Wed, 7 Sep 2022 22:09:06 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        linux-media@vger.kernel.org, tian.shu.qiu@intel.com,
        tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 1/1] ipu3-imgu: Fix NULL pointer dereference in active
 selection access
Message-ID: <YxjsUhnZIyvmwGyR@pendragon.ideasonboard.com>
References: <20220825190351.3241444-1-sakari.ailus@linux.intel.com>
 <db44a24b-2a9a-6682-4825-eedc4ecb1340@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <db44a24b-2a9a-6682-4825-eedc4ecb1340@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Max,

On Wed, Sep 07, 2022 at 03:44:44PM +0200, Maximilian Luz wrote:
> On Thu, 25 Aug 2022 22:03:51 +0300, Sakari Ailus  wrote:
> > What the IMGU driver did was that it first acquired the pointers to active
> > and try V4L2 subdev state, and only then figured out which one to use.
> > 
> > The problem with that approach and a later patch (see Fixes: tag) is that
> > as sd_state argument to v4l2_subdev_get_try_crop() et al is NULL, there is
> > now an attempt to dereference that.
> > 
> > Fix this.
> 
> Thank you for this fix, this however only addresses
> imgu_subdev_get_selection(), but the issue is also present in
> imgu_subdev_set_selection(). I assume that a similar fix is needed for that.
> I've added a diff for that below. Feel free to squash that into your patch or
> let me know if I should submit this separately.

This looks like a problem indeed. I'll let Sakari decide what he wants
to do. Adding wrappers along the lines of

static struct v4l2_rect *
imgu_subdev_get_crop(struct imgu_v4l2_subdev *sd,
		     struct v4l2_subdev_state *sd_state, unsigned int pad,
		     enum v4l2_subdev_format_whence which)
{
	if (which == V4L2_SUBDEV_FORMAT_TRY)
		return v4l2_subdev_get_try_crop(&imgu_sd->subdev, sd_state, pad);
	else
		return &imgu_sd->rect.eff;
}

(same for the selection rectangle) and using them through the code may
help.

> ---
>   drivers/staging/media/ipu3/ipu3-v4l2.c | 25 ++++++++++++-------------
>   1 file changed, 12 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
> index 2234bb8d48b3..079f2635c70d 100644
> --- a/drivers/staging/media/ipu3/ipu3-v4l2.c
> +++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
> @@ -223,10 +223,9 @@ static int imgu_subdev_set_selection(struct v4l2_subdev *sd,
>                                       struct v4l2_subdev_selection *sel)
>   {
>          struct imgu_device *imgu = v4l2_get_subdevdata(sd);
> -       struct imgu_v4l2_subdev *imgu_sd = container_of(sd,
> -                                                       struct imgu_v4l2_subdev,
> -                                                       subdev);
> -       struct v4l2_rect *rect, *try_sel;
> +       struct imgu_v4l2_subdev *imgu_sd =
> +               container_of(sd, struct imgu_v4l2_subdev, subdev);
> +       struct v4l2_rect *rect;
> 
>          dev_dbg(&imgu->pci_dev->dev,
>                   "set subdev %u sel which %u target 0x%4x rect [%ux%u]",
> @@ -238,22 +237,22 @@ static int imgu_subdev_set_selection(struct v4l2_subdev *sd,
> 
>          switch (sel->target) {
>          case V4L2_SEL_TGT_CROP:
> -               try_sel = v4l2_subdev_get_try_crop(sd, sd_state, sel->pad);
> -               rect = &imgu_sd->rect.eff;
> +               if (sel->which == V4L2_SUBDEV_FORMAT_TRY)
> +                       rect = v4l2_subdev_get_try_crop(sd, sd_state, sel->pad);
> +               else
> +                       rect = &imgu_sd->rect.eff;
>                  break;
>          case V4L2_SEL_TGT_COMPOSE:
> -               try_sel = v4l2_subdev_get_try_compose(sd, sd_state, sel->pad);
> -               rect = &imgu_sd->rect.bds;
> +               if (sel->which == V4L2_SUBDEV_FORMAT_TRY)
> +                       rect = v4l2_subdev_get_try_compose(sd, sd_state, sel->pad);
> +               else
> +                       rect = &imgu_sd->rect.bds;
>                  break;
>          default:
>                  return -EINVAL;
>          }
> 
> -       if (sel->which == V4L2_SUBDEV_FORMAT_TRY)
> -               *try_sel = sel->r;
> -       else
> -               *rect = sel->r;
> -
> +       *rect = sel->r;
>          return 0;
>   }
> 

-- 
Regards,

Laurent Pinchart
