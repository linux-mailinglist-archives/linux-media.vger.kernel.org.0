Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF3062080B
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 15:25:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727473AbfEPNZd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 May 2019 09:25:33 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:33760 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726703AbfEPNZd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 09:25:33 -0400
Received: by mail-lj1-f193.google.com with SMTP id w1so3138165ljw.0
        for <linux-media@vger.kernel.org>; Thu, 16 May 2019 06:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=lHLSdqCoZF/+IMRBaUDO/KQERWYK0QXozOvevKBoc4Q=;
        b=gIiDL3EYBLMICvrZXa9kxoU0ZsX4wM+ckObreuHlwefv3u385HWrGas/ZEb50r06PU
         ZiKHgwneGocd2VJWAg/Tbq1n8SU2+5glcJE/L4FeyB5Jd5hxfPA6c3SXxkouxgFBWs8S
         mhxirZC/On1KaPZNifl1LHzulU9PYgSbqah4XKXKiDkbWZP7KJ/WcZRAnyiGzc1Xx9fj
         9zpex9BPmIb6ysm92O9CHGrgONFPg+GLCJ2qKU1CnvjlVg8fmqcSfmvFbkg9x6BADe7G
         vt7s9wLMjSs/yXT8qNMuzCT4ryjuTqqQGzbfka/acKjlgt0avibGzBa3mRnK+qHTSbK9
         9GIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=lHLSdqCoZF/+IMRBaUDO/KQERWYK0QXozOvevKBoc4Q=;
        b=SmwMYzsRTvUpHR3LZtsj2OvFHE6SummGTEkhacgqgviqWSfRvintDKFNcrZy/qfK0F
         w9ETlaVzM4CNJ1/mMoBG8dpdDaqHt4XzfLM4hLrMRUDIoN9vizKOYF5KI4XzIuT/Uqx/
         6LpqF/CoH8Ysgd2cXIc/f+NfveIvnFquBd6UonHuKFtUk3UrdjSxmoHtyhgUDYAJgsfO
         VhL1PhSrAqtVQUGSd7r9rLhDvDcNoTHZInsafrpGR9zeJyjiwFfESwONeV59Nt4LmFDW
         kVcJiUL9nB8ugLN4ouv5cRlSKWaY3rduei8mwoC9xfrAqWtWRUfoYhugIey4e0rUOmPb
         OtLg==
X-Gm-Message-State: APjAAAXyyiHpZXua78t6KSx4QkPDZw6dvGUDvF8+1l9KMuxAYgNbI7sS
        b4Feu2iZTBztBDFPJXbsydbb3A==
X-Google-Smtp-Source: APXvYqwVX/lX098OSL27eXIt81H4yujYTxUoNlC3nPbi35VOxUJW5X2UJUfcTyTjbBa4X7dIv8UyEA==
X-Received: by 2002:a2e:3611:: with SMTP id d17mr2758540lja.72.1558013130835;
        Thu, 16 May 2019 06:25:30 -0700 (PDT)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id x23sm954845lfc.25.2019.05.16.06.25.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 May 2019 06:25:30 -0700 (PDT)
From:   "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
X-Google-Original-From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Date:   Thu, 16 May 2019 15:25:29 +0200
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Ulrich Hecht <uli@fpond.eu>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: Re: [PATCH v2 4/8] rcar-vin: Do not sync subdevice format when
 opening the video device
Message-ID: <20190516132529.GE31788@bigcity.dyn.berto.se>
References: <20190516011417.10590-1-niklas.soderlund+renesas@ragnatech.se>
 <20190516011417.10590-5-niklas.soderlund+renesas@ragnatech.se>
 <20190516112644.GB14820@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190516112644.GB14820@pendragon.ideasonboard.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for your feedback.

On 2019-05-16 14:26:44 +0300, Laurent Pinchart wrote:
> Hi Niklas,
> 
> Thank you for the patch.
> 
> On Thu, May 16, 2019 at 03:14:13AM +0200, Niklas Söderlund wrote:
> > The format is already synced when the subdevice is bound, there is no
> > need to do do it every time the video device is opened.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
> 
> This seems a bug fix to me, formats should not be modified at open()
> time according to the V4L2 spec. You may want to add a Fixes: line,
> although I suppose this would go back to the origins of the driver, and
> this series is likely not a candidate for the stable tree, so it may not
> be a good idea.

I agree, a fixes tag could have been useful. But as you deduce this go 
way back to the beginning pre Gen3 support and I don't think it would 
backport easily. As it's not critical I'm fine moving forward without 
such a tag.

> 
> I'm slightly worried of side effects as rvin_s_fmt_vid_cap() calls
> rvin_try_format() which in turn calls v4l2_subdev_call(sd, pad, set_fmt,
> pad_cfg, &format). If you're confident that there's no risk of breakage,

I was worried to, but then I concluded the risk for breakage is the same 
with or without the call to v4l2_subdev_call(..., set_fmt, ...) at bound 
time. The breakage is if the video source format is changed between 
bound to stream on without the user setting the format. The same risk 
exists between open() and stream on before this patch. The user should 
always set the format before it starts to stream. And once I'm daring 
enough to drop the devnode centric support from rcar-vin this will go 
away entirely.

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > ---
> >  drivers/media/platform/rcar-vin/rcar-v4l2.c | 25 ---------------------
> >  1 file changed, 25 deletions(-)
> > 
> > diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > index f67cef97b89a3bd4..71651c5a69483367 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > @@ -782,38 +782,13 @@ static int rvin_initialize_device(struct file *file)
> >  	struct rvin_dev *vin = video_drvdata(file);
> >  	int ret;
> >  
> > -	struct v4l2_format f = {
> > -		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
> > -		.fmt.pix = {
> > -			.width		= vin->format.width,
> > -			.height		= vin->format.height,
> > -			.field		= vin->format.field,
> > -			.colorspace	= vin->format.colorspace,
> > -			.pixelformat	= vin->format.pixelformat,
> > -		},
> > -	};
> > -
> >  	ret = rvin_power_on(vin);
> >  	if (ret < 0)
> >  		return ret;
> >  
> > -	/*
> > -	 * Try to configure with default parameters. Notice: this is the
> > -	 * very first open, so, we cannot race against other calls,
> > -	 * apart from someone else calling open() simultaneously, but
> > -	 * .host_lock is protecting us against it.
> > -	 */
> > -	ret = rvin_s_fmt_vid_cap(file, NULL, &f);
> > -	if (ret < 0)
> > -		goto esfmt;
> > -
> >  	v4l2_ctrl_handler_setup(&vin->ctrl_handler);
> >  
> >  	return 0;
> > -esfmt:
> > -	rvin_power_off(vin);
> > -
> > -	return ret;
> >  }
> >  
> >  static int rvin_open(struct file *file)
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Regards,
Niklas Söderlund
