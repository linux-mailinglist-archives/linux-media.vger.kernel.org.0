Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97FB23C9D5A
	for <lists+linux-media@lfdr.de>; Thu, 15 Jul 2021 12:57:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241719AbhGOLAg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jul 2021 07:00:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237196AbhGOLAf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jul 2021 07:00:35 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F144C061762
        for <linux-media@vger.kernel.org>; Thu, 15 Jul 2021 03:57:41 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id h19so8179989ljl.4
        for <linux-media@vger.kernel.org>; Thu, 15 Jul 2021 03:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=kUzYOF+Pui+/I75Qhr4DvmdNbJq7Jy8ptwao2NR3kdg=;
        b=GMnRE7I5TbmchgHxyTG5ByDoqCJLG/yi1OZs8iSb5pbm54yJ8MDssnqdyp/yselDdk
         w/7cJ8D4nFkYdCuFGb8l1Vnf3PWDVhR9NVZDBAnHjZ0m9DGXLGzMIRk8iDIHgX+ohzZl
         9yidPSlXzuQFg2Y2cTA3qUUSRkyr/1bJvr1QR9uRqexCa2rhmHDcPWe2zJMplC7tDZpT
         UayNiwlWGEkIWKTlY0gbImih/Q1+Vg3pMsR4lNBqcbHY7P/n2i4xFQ7WnBnH4tqFmbtH
         Eon9DgyDN5YvIgkOzr4SEXY+EIEBQHPbh7as1acZAzc6wn/oyZt58boPFISr5E0AfQ3x
         Jzqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=kUzYOF+Pui+/I75Qhr4DvmdNbJq7Jy8ptwao2NR3kdg=;
        b=HyyWRPCkdd+tjV3+gtmmHw6xDnoQ4wVIc5SpVvkMrObThTvQoNhgsLq2YBVue5aXOv
         o6IOnqOce5zjK4sx/ck8Am1LgfosQdX3ly0ayslOzJ3d0+wj0BQp2C+WPNvANwtFjpbb
         FVARRU9txV+bEpCtpDzb5WsLv24ZqpCP0gTWSlfflsBRq1Jl/Rl5Yf1OxcXso9551x2B
         zrT5LXaLiLghaKPNsaJVBuovpjbTB2oVY3mukHCU5okVNRFRqHykt/nCd/j3/KgJONNm
         LoRBcw/ww78CL408U4xh4xY2bW6wPeBNgA8g2TmSJBCh61bUJZNCl7UGDT3568SE0SIt
         LIOg==
X-Gm-Message-State: AOAM532r29zmDz1uA88/75w0oFvC1/JA9f+IYJhcTf11Yw/ebANVf6hu
        wBp490NUHP/WgqEk9RcPCYdILw==
X-Google-Smtp-Source: ABdhPJyTA6w/sbL14AlzwBQEySRFLleWEmN4PHtGsm1l1itiJyfLMgN3IGdBKYJkgBbygWh8f8M1ew==
X-Received: by 2002:a2e:904b:: with SMTP id n11mr3481143ljg.104.1626346659431;
        Thu, 15 Jul 2021 03:57:39 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id z8sm385585lfh.119.2021.07.15.03.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 03:57:38 -0700 (PDT)
Date:   Thu, 15 Jul 2021 12:57:37 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Dennis Rachui <drachui@de.adit-jv.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rcar-csi2: do not update format while streaming
Message-ID: <YPAUoQ8KmmAE3fWD@oden.dyn.berto.se>
References: <1625750578-108454-1-git-send-email-drachui@de.adit-jv.com>
 <YOhbOHnCn9eFgKWG@oden.dyn.berto.se>
 <YOoiZM+oicZBD4o1@pendragon.ideasonboard.com>
 <YO1f+SOTBS44/Wf0@oden.dyn.berto.se>
 <YO8vs4V/lhVA8mY9@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YO8vs4V/lhVA8mY9@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 2021-07-14 21:40:51 +0300, Laurent Pinchart wrote:
> Hi Niklas,
> 
> On Tue, Jul 13, 2021 at 11:42:17AM +0200, Niklas Söderlund wrote:
> > On 2021-07-11 01:42:44 +0300, Laurent Pinchart wrote:
> > > On Fri, Jul 09, 2021 at 04:20:40PM +0200, Niklas Söderlund wrote:
> > > > On 2021-07-08 15:22:58 +0200, Dennis Rachui wrote:
> > > > > Verify that streaming is not active before setting the pad format.
> > > > > 
> > > > > According to the VIDIOC documentation [1] changes to the active
> > > > > format of a media pad via the VIDIOC_SUBDEV_S_FMT ioctl are
> > > > > applied to the underlying hardware.
> > > > > In rcar-csi2 a format change only applies to hardware, when the
> > > > > pipeline is started. While the device is not in use, it is therefore
> > > > > okay to update the format.
> > > > > 
> > > > > However, when the pipeline is active, this leads to a format
> > > > > mismatch between driver and device.
> > > > > Other applications can query the format with
> > > > > VIDIOC_SUBDEV_G_FMT at any time and would be reported
> > > > > a format that does not fit the current stream.
> > > > > 
> > > > > This commit prevents format update while streaming is active
> > > > > and returns -EBUSY to user space, as suggested by [1].
> > > > > 
> > > > > [1] Documentation/userspace-api/media/v4l/vidioc-subdev-g-fmt.rst
> > > > 
> > > > I like that this is addressed, but I wonder is this not something that 
> > > > should be fixed in the V4L2 core and not in drivers?
> > > 
> > > Some drivers may support format changes during streaming (that's allowed
> > > by the V4L2 API, I'm not sure if it's used anywhere though). While I'd
> > > favour not duplicating the same logic in different (and differently
> > > buggy) ways in drivers, I'm not sure how this could be implemented in a
> > > sane way in the V4L2 core in its current state.
> > 
> > I understand it's possible from some devices to support to format 
> > changes during streaming, but as you point out it's the exception and 
> > not the rule, if used at all.
> > 
> > So my point is if we start to enforce this in drivers we are headed down 
> > a road where this will be messier to clean up. Would it not make more 
> > sens to default the V4L2 core to disallow format changes while streaming 
> > and add a new flag to V4L2_SUBDEV_CAP_ to signal that the subdevice 
> > supports format changes while streaming?
> > 
> > We already have V4L2_SUBDEV_CAP_RO_SUBDEV to signal that a subdevice 
> > only supports read-only operations so I think it would not be too hard 
> > to move this functionality into the core?
> 
> Yes, that's something we could try. The subdev core will then need to
> track the streaming state, which may require wrapping the .s_stream()
> call. Locking should then also likely be handled by the core. Probably
> nothing impossible, but quite a bit of work. Any volunteer ? :-)

We already track the stream count in struct media_entity and it's 
incremented/decremented under the media device lock by 
media_pipeline_start() and media_pipeline_stop(). So I don't think it's 
such a hard feature to add.

The large task IMHO is to figure out if we have any subdevice in tree 
that allows format changes while streaming and that would need to set 
this new V4L2_SUBDEV_CAP_ flag.

> 
> > > > > Note: after creation of this commit, it was noticed that Steve
> > > > > Longerbeam has a very similar solution in his fork.
> > > > > 
> > > > > Fixes: 769afd212b16 ("media: rcar-csi2: add Renesas R-Car MIPI CSI-2 receiver driver")
> > > > > Cc: Steve Longerbeam <slongerbeam@gmail.com>
> > > > > Signed-off-by: Dennis Rachui <drachui@de.adit-jv.com>
> > > > > ---
> > > > >  drivers/media/platform/rcar-vin/rcar-csi2.c | 21 ++++++++++++++++++++-
> > > > >  1 file changed, 20 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > > > index e28eff0..98152e1 100644
> > > > > --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > > > +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > > > @@ -724,18 +724,37 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
> > > > >  {
> > > > >  	struct rcar_csi2 *priv = sd_to_csi2(sd);
> > > > >  	struct v4l2_mbus_framefmt *framefmt;
> > > > > +	int ret = 0;
> > > > > +
> > > > > +	mutex_lock(&priv->lock);
> > > > >  
> > > > >  	if (!rcsi2_code_to_fmt(format->format.code))
> > > > >  		format->format.code = rcar_csi2_formats[0].code;
> > > > >  
> > > > >  	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> > > > > +
> > > > > +		/*
> > > > > +		 * Do not apply changes to active format while streaming.
> > > > > +		 *
> > > > > +		 * Since video streams could be forwarded from sink pad to any
> > > > > +		 * source pad (depending on CSI-2 channel routing), all
> > > > > +		 * media pads are effected by this rule.
> > > > > +		 */
> > > > > +		if (priv->stream_count > 0) {
> > > > > +			ret = -EBUSY;
> > > > > +			goto out;
> > > > > +		}
> > > > > +
> > > > >  		priv->mf = format->format;
> > > > >  	} else {
> > > > >  		framefmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
> > > > >  		*framefmt = format->format;
> > > > >  	}
> > > > >  
> > > > > -	return 0;
> > > > > +out:
> > > > > +	mutex_unlock(&priv->lock);
> > > > > +
> > > > > +	return ret;
> > > > >  }
> > > > >  
> > > > >  static int rcsi2_get_pad_format(struct v4l2_subdev *sd,
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Regards,
Niklas Söderlund
