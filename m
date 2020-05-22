Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF2921DEBC8
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2020 17:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730397AbgEVP1P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 May 2020 11:27:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729929AbgEVP1O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 May 2020 11:27:14 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9756CC061A0E
        for <linux-media@vger.kernel.org>; Fri, 22 May 2020 08:27:14 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id u22so4507728plq.12
        for <linux-media@vger.kernel.org>; Fri, 22 May 2020 08:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aBCkYZN2JWwS8LtkHm2mbF8qcWb9zwu6Xi+ynSufKYk=;
        b=dOn5s1dAYvW15Q2yuCDYzzI45CC5Jlpp8PF/oHdtrnmGqcuvIPv6slCfBfgzcyM6k9
         8gsU/Ce6PhEiJqeJEjKmACr1tHS6PraVzBzcKpsIpyD3+873UrAH5GW1Q/oeL01ePZyP
         94w+HDtnoR37xcf5jSnOIoxBqGHc9Z+d4IpnH8/zLFB1N5iFwNzAGjKBlnJlBDIYVy1i
         JFV4trMXTe7kkMa6jFA3gKPMbOTymiXPVaxMb1UyxvCQamVkvw+TM89OgTqRENiRY861
         unPrG2rUj/N8o44xge7UUvVPgdhg2HchOUfDL+pjpRYDkEfIKddls/YVdwTAG2APWiek
         9xPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aBCkYZN2JWwS8LtkHm2mbF8qcWb9zwu6Xi+ynSufKYk=;
        b=oAhmNjk9RMkQB0rYiAgDokONbztXlCs7mCZt+PtqGlydbEMCt/gKWGVaCoZgVUBxVU
         VpT9mQJVfDSw1LwCFoQpI9ofDklrCqsfLmuTne/NgW1G9PtPFP7NfU6dahMVkzSZVX21
         4i1ERMMViniW4LBH3/Bb7ayHEZDjDnLBmky/bHyOOZpMNoc1nIG+t97myBbdYYf4RRhn
         af+oFwyjmJF3WqPIkJKVKupDPX4hNZcjuOvC4WCCFRGbHVi5dVc9lHwMLXwVZDHI06KU
         BHd5J7KzFkNxjvnP+gQCvNoAdNT9AP+T1p6VJCqzivR8Et2arpXkDbXpI1/Du3LefrCl
         mMmg==
X-Gm-Message-State: AOAM5304VdxNepraalo79UU5YJfXRVjVapep5tPEjgOYUI4Rw9sSpYPC
        vnaW/I/zpFeh4u9/VJidksOoDw==
X-Google-Smtp-Source: ABdhPJw7793+0EDYEEGlkVHk+jAoXRySkC+rN+IN4TFTiwi1t3PjaqZPKJgBL2eho/s01B256j5qmg==
X-Received: by 2002:a17:902:d208:: with SMTP id t8mr15690228ply.324.1590161233962;
        Fri, 22 May 2020 08:27:13 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([103.113.213.155])
        by smtp.gmail.com with ESMTPSA id u20sm3670061pfc.55.2020.05.22.08.27.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 May 2020 08:27:13 -0700 (PDT)
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
X-Google-Original-From: Kaaira Gupta <Kaairakgupta@es.iitr.ac.in>
Date:   Fri, 22 May 2020 20:57:02 +0530
To:     Helen Koike <helen.koike@collabora.com>
Cc:     Kaaira Gupta <kgupta@es.iitr.ac.in>, linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH] media: vimc: Apply right blue and red channels to BGR
Message-ID: <20200522152701.GA26597@kaaira-HP-Pavilion-Notebook>
References: <20200522071145.GA17375@kaaira-HP-Pavilion-Notebook>
 <d0668aa2-a091-6c33-bdc2-d0bddbb3e50e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0668aa2-a091-6c33-bdc2-d0bddbb3e50e@collabora.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 22, 2020 at 11:15:21AM -0300, Helen Koike wrote:
> Hi Kaaira,

Hii!

> 
> Thanks for the patch.
> 
> On 5/22/20 4:11 AM, Kaaira Gupta wrote:
> > rgb[] is already calculated in the right order, there is no need to swap
> > the blue and red channels in it for BGR images. Hence give right rgb
> > channels to the src_frame.
> 
> It would be nice if you explain the issue you are facing, and what this fixes.

Sure. So libcamera's qcam configures the Capture to BGR for certain qt versions
(<5.14). So when we test qcam using vimc (by configuring the subdevs
from qcam side to BGR as well), we see that the red and blue channels on
the test image get inter-changed.This is a fix for that.

Should I describe this in the commit message as well?

> 
> > 
> > Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
> > ---
> >  drivers/media/test-drivers/vimc/vimc-debayer.c | 14 ++------------
> >  1 file changed, 2 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/media/test-drivers/vimc/vimc-debayer.c b/drivers/media/test-drivers/vimc/vimc-debayer.c
> > index c3f6fef34f68..d41d9f6180df 100644
> > --- a/drivers/media/test-drivers/vimc/vimc-debayer.c
> > +++ b/drivers/media/test-drivers/vimc/vimc-debayer.c
> > @@ -318,21 +318,11 @@ static void vimc_deb_process_rgb_frame(struct vimc_deb_device *vdeb,
> >  				       unsigned int col,
> >  				       unsigned int rgb[3])
> >  {
> > -	const struct vimc_pix_map *vpix;
> >  	unsigned int i, index;
> >  
> > -	vpix = vimc_pix_map_by_code(vdeb->src_code);
> >  	index = VIMC_FRAME_INDEX(lin, col, vdeb->sink_fmt.width, 3);
> > -	for (i = 0; i < 3; i++) {
> > -		switch (vpix->pixelformat) {
> > -		case V4L2_PIX_FMT_RGB24:
> > -			vdeb->src_frame[index + i] = rgb[i];
> > -			break;
> > -		case V4L2_PIX_FMT_BGR24:
> > -			vdeb->src_frame[index + i] = rgb[2 - i];
> > -			break;
> > -		}
> > -	}
> 
> This code looks correct to me.
> 
> The rgb[] arrays is an intermediary representation of the pixel, in the order of Red Green Blue.
> 
> If you look at vimc_deb_calc_rgb_sink(), you will see that rgb[] is indexed by this enum:
> 
> enum vimc_deb_rgb_colors {
> 	VIMC_DEB_RED = 0,
> 	VIMC_DEB_GREEN = 1,
> 	VIMC_DEB_BLUE = 2,
> };
> 
> So rgb[0] is the red component, rgb[1] green and rgb[2] blue.
> 
> The, in this part of the code that you removed, we use rgb[] array to calculate the final frame.
> 
> So, if there is an error, then I don't think it is here.
> Maybe the rgb[] array is wrong, and the error would be somewhere in vimc_deb_calc_rgb_sink().

I printed out the rbg[] array, and it was correctly calculating the r,g,
and b components. I think the channels should not be swapped while
assigning to src_frame, because for all the cases (BGR or RGB) it takes
input in the order of R,then G and finally B. Hence when we swap the
assignment to the frame, we are interchanging the channels.

> 
> Regards,
> Helen
> 
> 
> > +	for (i = 0; i < 3; i++)
> > +		vdeb->src_frame[index + i] = rgb[i];
> >  }
> >  
> >  static int vimc_deb_s_stream(struct v4l2_subdev *sd, int enable)
> > 
