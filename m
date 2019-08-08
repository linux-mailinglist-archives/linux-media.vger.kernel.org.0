Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE868633D
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2019 15:35:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733171AbfHHNf1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Aug 2019 09:35:27 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37958 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733110AbfHHNf1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Aug 2019 09:35:27 -0400
Received: by mail-lj1-f195.google.com with SMTP id r9so88911853ljg.5
        for <linux-media@vger.kernel.org>; Thu, 08 Aug 2019 06:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=XwEt+9TwxWlYRRpyYJ1QKarb+hNPwQFyPJXkKq2cxpI=;
        b=yQIOGQ66LXdE7mrDeeghON/HZ+UPeWpzuOQSrnPDDtZblka39h16WkYNDiPTBkR6tm
         MbC8HgaKqrTZyUrzr1PPaNEUziDa4+X6aRJLgMjWfOu+lGvhN/q6gzodKRMl39zar58/
         yh0d/DnairB+LpYhXMdhpQ//c5KaKuNld1RQ+qTkHS6p6sTiOoLmVDihRoohikR8C13N
         JpPWPvF2h07Zq9SsVAO8VTYZKoYYO1TkvrWTK7p7G/Orgva6doj9at+xnOec5+Of6aD+
         DcRSWFFEmTQ4GtY91FPVSRHzpT1qEXIRsuosxK0Ql43LPkNLWuMGh+imm2NybckG3pFI
         71Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=XwEt+9TwxWlYRRpyYJ1QKarb+hNPwQFyPJXkKq2cxpI=;
        b=nQAIIc4ZXnktA4RfjnfetWJos9sSzb6JhKuxbmanjeQW8DP3eampJCQ3TSnWoMRnDR
         Y0wzOV1QlWbFO1CskDnKidKx4cBzhizDW32fqR8l2+vQWFf3G7jww5FjsSWTO5j7MVGY
         ncps6hajhylNG0/Rauc64b/7MRbqMpP2TZEav40wmDKLXlUh9xmZgzEVG9mbErk/sgYu
         nzIDi7Id6dB0ldiyg1K/JnOuf+fQQ5hzrLqRlVXOGZ2n/uRe9Y8GqqjaXxE4q5PWkUFt
         HYo6FoWsnlNJP/BvanDdT8bBIPGxQSBZtTzigvOD+0H9W/QkoxaFgXszSc9pvv9A/kBn
         Rl0Q==
X-Gm-Message-State: APjAAAVmkaTxeU49m7LndgCOMVJYWf+qeBLRCQ5WePkiCIXI6TldHbr/
        rnoQwRBDoWJWNQDP4/w6E1CIoIMn6rU=
X-Google-Smtp-Source: APXvYqzTR5Yvv0iRLHhh4qhEfOT9Mkh2qjU16lN3YXLbJY3KHC4hcvmw3eg3vWB3BlO7vcLvmXHgIw==
X-Received: by 2002:a2e:9ec9:: with SMTP id h9mr7974744ljk.90.1565271325210;
        Thu, 08 Aug 2019 06:35:25 -0700 (PDT)
Received: from localhost (customer-145-14-112-32.stosn.net. [145.14.112.32])
        by smtp.gmail.com with ESMTPSA id m21sm18724790ljj.48.2019.08.08.06.35.24
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 08 Aug 2019 06:35:24 -0700 (PDT)
Date:   Thu, 8 Aug 2019 15:35:23 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 4/6] rcar-vin: Do not reset the crop and compose
 rectangles in s_fmt
Message-ID: <20190808133523.GA24385@bigcity.dyn.berto.se>
References: <20190808011850.21219-1-niklas.soderlund+renesas@ragnatech.se>
 <20190808011850.21219-5-niklas.soderlund+renesas@ragnatech.se>
 <20190808083751.GF6055@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190808083751.GF6055@pendragon.ideasonboard.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for your feedback.

On 2019-08-08 11:37:51 +0300, Laurent Pinchart wrote:
> Hi Niklas,
> 
> Thank you for the patch.
> 
> On Thu, Aug 08, 2019 at 03:18:48AM +0200, Niklas Söderlund wrote:
> > The crop and compose rectangles are reset when s_fmt is called
> > resulting in potentially valid rectangles being lost when updating the
> > format.
> 
> Isn't this the expected behaviour ?

I though so to at first but I had a nagging feeling as I was not sure.  
So I went and looked at vivid and it does do map the old crop/compose 
rectangles inside the new limits vivid_s_fmt_vid_cap().

Please note that the variable names in this patch are horrible and are 
fixed later in this series. In essence the current crop rectangle is 
mapped inside the size of the video coming from the sensor and the 
compose rectangle is mapped inside the new format set on the VIN video 
device.

I'm open to dropping this patch, I just want this driver to get this 
part right so I mimic vivid.

> 
> > Fix this by mapping the rectangles inside the new format.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > ---
> >  drivers/media/platform/rcar-vin/rcar-v4l2.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > index 8b30267f1636aaf1..5dcd787a9cf96ac9 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> > @@ -279,8 +279,8 @@ static int rvin_s_fmt_vid_cap(struct file *file, void *priv,
> >  		return ret;
> >  
> >  	vin->format = f->fmt.pix;
> > -	vin->crop = crop;
> > -	vin->compose = compose;
> > +	v4l2_rect_map_inside(&vin->crop, &crop);
> > +	v4l2_rect_map_inside(&vin->compose, &compose);
> >  	vin->src_rect = crop;
> >  
> >  	return 0;
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Regards,
Niklas Söderlund
