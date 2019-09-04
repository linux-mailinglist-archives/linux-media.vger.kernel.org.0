Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40D55A8337
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2019 14:52:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729806AbfIDMwF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Sep 2019 08:52:05 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40622 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727125AbfIDMwF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Sep 2019 08:52:05 -0400
Received: by mail-lf1-f65.google.com with SMTP id u29so15796089lfk.7
        for <linux-media@vger.kernel.org>; Wed, 04 Sep 2019 05:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=QapMVwCvqsvHRPXogEEyjY3CWz4VQZs74eWGqYWOjLo=;
        b=JCySh4TFONJVVb8lNIrdXUocQ8MyvL8UnZahcOxgg5xO5Oh9ZaEMbdGDbVRrOYf9ou
         +AfI4ahqI9SBaqCThOwJAFkmGRJ8PSN/wvrrkpCmvZTPL4YHuWMUu4HyyCkm6VRE7Ryb
         nUyFL/vJqctCmoDhivdI6v47aZfCTM7TAFODpbxDdwcgbIc1z8jWRcNNzKW36OkXDelO
         Ta8RGUqmHCAi0Yn36cf/ZA70I7eTUYHFw00uh/7Ff1/gC0PagiSJIz+N7kHjiZDXyBBv
         wsch4KHenttQM1yUxVfJCQgXoi9CP4pPAaKP10vrGifvRGWj+YkQlbpO5u2RiFDxomli
         P3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=QapMVwCvqsvHRPXogEEyjY3CWz4VQZs74eWGqYWOjLo=;
        b=KSNkLlQ3u2dthOaFwVQPAhNtOrxvU0nKZdsBUCA3xYrkvLILEuYgqQ76atGkJeTPku
         AVbUP/ps1CeGTmC+njq/LSYwLd+opO5VlN4MUJOKFwWjxhyiTBq6Y7nbDl7NYvu0hLFF
         0c/GsWR9YHk2GOoN9/AUErt6eNmNOtn9//C0rE//f8PsSZwkzbX5FHUmUWUFitrUEFxq
         kQwcFMBSxkVylRvBTINonoA6tmQfHYLDo6kX9sZoQveWONSYt7yXikp03xK/2Xt4q5+r
         gQn/g31Usn05y40Ao9s70fI/Ra6vyOtgHTBBxNxSAaVMCfNpD8lhS+1eLTiPEdprb2p+
         8h9Q==
X-Gm-Message-State: APjAAAUmtjS4jLohJxL0cbTMTOuCN/nTFM6GnLJf3dMjFO3D33RJulzl
        HYKwB5gaqBuKVDWjXgNNE8PT5A==
X-Google-Smtp-Source: APXvYqzxRB9S5u35nzqbbGUjb1YoYtFPuB3blvO/EQx9ykZeSFKpyQ9ZnBcE7gxLFE/A7Q/0SQzCnw==
X-Received: by 2002:a05:6512:210:: with SMTP id a16mr11280139lfo.42.1567601522477;
        Wed, 04 Sep 2019 05:52:02 -0700 (PDT)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id u9sm3787515lja.27.2019.09.04.05.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2019 05:52:01 -0700 (PDT)
Date:   Wed, 4 Sep 2019 14:52:01 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/6] rcar-vin: Rename rectangle holding the video
 source information
Message-ID: <20190904125201.GM8086@bigcity.dyn.berto.se>
References: <20190808011850.21219-1-niklas.soderlund+renesas@ragnatech.se>
 <20190808011850.21219-4-niklas.soderlund+renesas@ragnatech.se>
 <20190808083045.GE6055@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190808083045.GE6055@pendragon.ideasonboard.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for your feedback.

On 2019-08-08 11:30:45 +0300, Laurent Pinchart wrote:
> Hi Niklas,
> 
> Thank you for the patch.
> 
> On Thu, Aug 08, 2019 at 03:18:47AM +0200, Niklas Söderlund wrote:
> > The variable to hold the video source information dimensions was poorly
> > named 'source'. This is confusing as a lot of other members of structs
> > share the same name with different purposes, rename it src_rect in
> > preparation of refactoring code.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > ---
> >  drivers/media/platform/rcar-vin/rcar-v4l2.c | 33 +++++++++++----------
> >  drivers/media/platform/rcar-vin/rcar-vin.h  |  4 +--
> >  2 files changed, 19 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > index 402b40fcf7184fde..8b30267f1636aaf1 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > @@ -163,13 +163,13 @@ static int rvin_reset_format(struct rvin_dev *vin)
> >  
> >  	rvin_format_align(vin, &vin->format);
> >  
> > -	vin->source.top = 0;
> > -	vin->source.left = 0;
> > -	vin->source.width = vin->format.width;
> > -	vin->source.height = vin->format.height;
> > +	vin->src_rect.top = 0;
> > +	vin->src_rect.left = 0;
> > +	vin->src_rect.width = vin->format.width;
> > +	vin->src_rect.height = vin->format.height;
> >  
> > -	vin->crop = vin->source;
> > -	vin->compose = vin->source;
> > +	vin->crop = vin->src_rect;
> > +	vin->compose = vin->src_rect;
> >  
> >  	return 0;
> >  }
> > @@ -281,7 +281,7 @@ static int rvin_s_fmt_vid_cap(struct file *file, void *priv,
> >  	vin->format = f->fmt.pix;
> >  	vin->crop = crop;
> >  	vin->compose = compose;
> > -	vin->source = crop;
> > +	vin->src_rect = crop;
> >  
> >  	return 0;
> >  }
> > @@ -319,8 +319,8 @@ static int rvin_g_selection(struct file *file, void *fh,
> >  	case V4L2_SEL_TGT_CROP_BOUNDS:
> >  	case V4L2_SEL_TGT_CROP_DEFAULT:
> >  		s->r.left = s->r.top = 0;
> > -		s->r.width = vin->source.width;
> > -		s->r.height = vin->source.height;
> > +		s->r.width = vin->src_rect.width;
> > +		s->r.height = vin->src_rect.height;
> >  		break;
> >  	case V4L2_SEL_TGT_CROP:
> >  		s->r = vin->crop;
> > @@ -362,21 +362,22 @@ static int rvin_s_selection(struct file *file, void *fh,
> >  	case V4L2_SEL_TGT_CROP:
> >  		/* Can't crop outside of source input */
> >  		max_rect.top = max_rect.left = 0;
> > -		max_rect.width = vin->source.width;
> > -		max_rect.height = vin->source.height;
> > +		max_rect.width = vin->src_rect.width;
> > +		max_rect.height = vin->src_rect.height;
> >  		v4l2_rect_map_inside(&r, &max_rect);
> >  
> > -		v4l_bound_align_image(&r.width, 6, vin->source.width, 0,
> > -				      &r.height, 2, vin->source.height, 0, 0);
> > +		v4l_bound_align_image(&r.width, 6, vin->src_rect.width, 0,
> > +				      &r.height, 2, vin->src_rect.height, 0, 0);
> >  
> > -		r.top  = clamp_t(s32, r.top, 0, vin->source.height - r.height);
> > -		r.left = clamp_t(s32, r.left, 0, vin->source.width - r.width);
> > +		r.top  = clamp_t(s32, r.top, 0,
> > +				 vin->src_rect.height - r.height);
> > +		r.left = clamp_t(s32, r.left, 0, vin->src_rect.width - r.width);
> >  
> >  		vin->crop = s->r = r;
> >  
> >  		vin_dbg(vin, "Cropped %dx%d@%d:%d of %dx%d\n",
> >  			r.width, r.height, r.left, r.top,
> > -			vin->source.width, vin->source.height);
> > +			vin->src_rect.width, vin->src_rect.height);
> >  		break;
> >  	case V4L2_SEL_TGT_COMPOSE:
> >  		/* Make sure compose rect fits inside output format */
> > diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
> > index e562c2ff21ec7e7b..86e9bad44484092c 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-vin.h
> > +++ b/drivers/media/platform/rcar-vin/rcar-vin.h
> > @@ -176,7 +176,7 @@ struct rvin_info {
> >   *
> >   * @crop:		active cropping
> >   * @compose:		active composing
> > - * @source:		active size of the video source
> > + * @src_rect:		active size of the video source
> 
> As this only holds a size you don't need a full rectangle, src_width and
> src_height would save a bit of space. Up to you, in any case

I hope to get around to adding a struct v4l2_size to address this in the 
future. For now I prefer to keep it as a v4l2_rect as there are other 
members of struct rvin_dev which would benefit from a size structure as 
well and having them all the same makes it easier to spot IMHO.

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks.

> 
> >   * @std:		active video standard of the video source
> >   *
> >   * @alpha:		Alpha component to fill in for supported pixel formats
> > @@ -215,7 +215,7 @@ struct rvin_dev {
> >  
> >  	struct v4l2_rect crop;
> >  	struct v4l2_rect compose;
> > -	struct v4l2_rect source;
> > +	struct v4l2_rect src_rect;
> >  	v4l2_std_id std;
> >  
> >  	unsigned int alpha;
> 
> -- 
> Regards,
> 
> Laurent Pinchart
