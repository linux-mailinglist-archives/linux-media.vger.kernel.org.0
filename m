Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4C62185C15
	for <lists+linux-media@lfdr.de>; Sun, 15 Mar 2020 11:56:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728318AbgCOK4l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Mar 2020 06:56:41 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45320 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728234AbgCOK4k (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Mar 2020 06:56:40 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 40BDA2D6;
        Sun, 15 Mar 2020 11:56:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584269798;
        bh=wBHI1FuPG8VN3qlmnNu6k1DtQ3wMNO+VIn6GJctKDuw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=junzBuMesSYYoLueMP7hQSX9UrKCfzGa4LmFNTzPWzvvD1okAfOXqERvo22URweSp
         ULZc2eXcbymSf5rkPVsXMQX5QE99NAZZux5gLnIqBOXg2wCBgFQLGIIviA7TcxTBQk
         vlqv9Frx63aSW9XCesSEouU/bXhyofw2oZQ1uzFw=
Date:   Sun, 15 Mar 2020 12:56:34 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Lad Prabhakar <prabhakar.csengg@gmail.com>
Cc:     Niklas <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/2] media: v4l2-async: Pass pointer to struct
 v4l2_subdev in match_custom callback
Message-ID: <20200315105634.GC4732@pendragon.ideasonboard.com>
References: <20200315102724.26850-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200315102724.26850-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200315102724.26850-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

Thank you for the patch.

On Sun, Mar 15, 2020 at 10:27:23AM +0000, Lad Prabhakar wrote:
> Passing a pointer to struct device for the match_custom callback is of no
> use as in the bridge driver to match the fwnode, so instead pass the
> struct v4l2_subdev pointer so that the bridge driver has enough
> information to match against the subdevices.

I'm not sure I like this. Conceptually speaking, the driver that
registers the notifier wants to get v4l2_subdev instances corresponding
to devices. A struct device is thus all it should need. Giving the match
function access to the subdev opens the door to all kind of nasty hacks.

In any case, I don't think is is required, see my reply to patch 2/2.

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/media/v4l2-core/v4l2-async.c | 2 +-
>  include/media/v4l2-async.h           | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 8bde33c21ce4..f897d4025f97 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -80,7 +80,7 @@ static bool match_custom(struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
>  		/* Match always */
>  		return true;
>  
> -	return asd->match.custom.match(sd->dev, asd);
> +	return asd->match.custom.match(sd, asd);
>  }
>  
>  static LIST_HEAD(subdev_list);
> diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> index 8319284c93cb..8c014e3bbd6c 100644
> --- a/include/media/v4l2-async.h
> +++ b/include/media/v4l2-async.h
> @@ -86,8 +86,8 @@ struct v4l2_async_subdev {
>  			unsigned short address;
>  		} i2c;
>  		struct {
> -			bool (*match)(struct device *dev,
> -				      struct v4l2_async_subdev *sd);
> +			bool (*match)(struct v4l2_subdev *sd,
> +				      struct v4l2_async_subdev *asd);
>  			void *priv;
>  		} custom;
>  	} match;

-- 
Regards,

Laurent Pinchart
