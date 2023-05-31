Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D921718024
	for <lists+linux-media@lfdr.de>; Wed, 31 May 2023 14:44:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235816AbjEaMoF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 May 2023 08:44:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232718AbjEaMoF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 May 2023 08:44:05 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0343D98
        for <linux-media@vger.kernel.org>; Wed, 31 May 2023 05:44:04 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126205251136.34.openmobile.ne.jp [126.205.251.136])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77DC5844;
        Wed, 31 May 2023 14:43:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685537021;
        bh=N6kD9N2hNbHBV1D5xKGFBW4a0uqyxmZRGfiHXszF/FE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jWeG+evgAkq9xg6aHbHBkoDx/02467cN1Dr6FElEzImbMrtUODOlPAi94aSLoub9j
         WsFcOzEq6gTvLiEhY13td1lD5ymmI3TEcps3HTpO4gcEOryIXOPx7wSY7OfS69AbZS
         BWbIGqe+MLL0bDMlhbrgOvVsXmaSeKOiYuMEfpeg=
Date:   Wed, 31 May 2023 15:44:01 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Linux regressions mailing list <regressions@lists.linux.dev>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] media: usb: uvc: fill in description for unknown
 pixelformats
Message-ID: <20230531124401.GG27043@pendragon.ideasonboard.com>
References: <4b1bc0d5-808b-816d-d7de-5baa8851e74f@xs4all.nl>
 <a47b5d61-f512-22ca-ca75-5f7ec40c5af7@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a47b5d61-f512-22ca-ca75-5f7ec40c5af7@leemhuis.info>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Thorsten,

On Wed, May 31, 2023 at 01:48:51PM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 29.03.23 14:28, Hans Verkuil wrote:
> > If the fcc is 0 (indicating an unknown GUID format), then fill in the
> > description field in ENUM_FMT. Otherwise the V4L2 core will WARN.
> 
> What happened to this? It seems this fall through the cracks.

I've posted a better fix, see
https://lore.kernel.org/linux-media/20230506065809.24645-1-laurent.pinchart@ideasonboard.com/.
Of course, fate had it that it got reviewed exactly on the day when I started by holidays :-S I'm now back, and will send a pull request.

> BTW:
> 
> > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
> Afaics it might be good to have these in here:
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217252
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2180107

I'll add those two links.

> A comment in the former is what brought me here.
> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
> 
> #regzbot ^backmonitor:
> https://lore.kernel.org/lkml/dc8e5276-ef88-648f-9f0d-10151ea62c90@leemhuis.info/
> #regzbot poke
> 
> > Fixes: 50459f103edf ("media: uvcvideo: Remove format descriptions")
> > ---
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index 7aefa76a42b3..2f1ced1212cd 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -256,6 +256,9 @@ static int uvc_parse_format(struct uvc_device *dev,
> >  		} else {
> >  			dev_info(&streaming->intf->dev,
> >  				 "Unknown video format %pUl\n", &buffer[5]);
> > +			snprintf(format->name, sizeof(format->name), "%pUl\n",
> > +				 &buffer[5]);
> > +
> >  			format->fcc = 0;
> >  		}
> > 
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index 35453f81c1d9..fc6f9e7d8506 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -713,6 +713,10 @@ static int uvc_ioctl_enum_fmt(struct uvc_streaming *stream,
> >  	if (format->flags & UVC_FMT_FLAG_COMPRESSED)
> >  		fmt->flags |= V4L2_FMT_FLAG_COMPRESSED;
> >  	fmt->pixelformat = format->fcc;
> > +	if (format->name[0])
> > +		strscpy(fmt->description, format->name,
> > +			sizeof(fmt->description));
> > +
> >  	return 0;
> >  }
> > 
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index 9a596c8d894a..22656755a801 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -264,6 +264,8 @@ struct uvc_format {
> >  	u32 fcc;
> >  	u32 flags;
> > 
> > +	char name[32];
> > +
> >  	unsigned int nframes;
> >  	struct uvc_frame *frame;
> >  };

-- 
Regards,

Laurent Pinchart
