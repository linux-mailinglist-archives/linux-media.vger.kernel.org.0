Return-Path: <linux-media+bounces-42522-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EABA9B5712A
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 09:22:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DF8C7AA977
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 07:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C9E52D5436;
	Mon, 15 Sep 2025 07:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vSY/eILt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0902D46BB;
	Mon, 15 Sep 2025 07:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757920920; cv=none; b=fzoLc1r8h6kkKSHvsV+3UKccLxpOO+Q4vK7mwMhKxpP3RCuw9egf4jyACbgrPRHVgRFan5u6hGKu+TisYYTwT46pEB3Kmu5IHrkVA/eEdvOmJsNuDAClbPyPDMPzDJFJyC9waubA36pCwDYeVvrDRH5yoFskCn5quPQ3nAzQhdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757920920; c=relaxed/simple;
	bh=iER8ImaZiIpxm5WMViFuw+tlKm3YdnHp1TOGEzGXbY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YJJIk2HzCU3IeLfZIm7GGPytBUcgcihiT3PdPXpusr79+7bNRDPqRIJc7eQDcxVRRbVHowWzJjtgApPqSprO7d9U/rrTcui+OBRtGe7fOw1YBjYpcqORHUrcFYglJhn4ChuJ3760lRkO5eG0z6TMAMhgbRfBqfu+qQ4e83ugjQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vSY/eILt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2EBF4EC1;
	Mon, 15 Sep 2025 09:20:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757920839;
	bh=iER8ImaZiIpxm5WMViFuw+tlKm3YdnHp1TOGEzGXbY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vSY/eILtKKl4P0nyN5UgnhsW7UIlSlOsre213uDiQJJOQuyIVQ9vK72NPsAlw/SUn
	 9arqxyv8XHSiMeN87a7PkuFzmd3NQ23SzLe1RjkMFgyX7ZDVvquYuCo0OiXcrjtb9U
	 rik6JNhebmltMDYD3kcICSgvnxAs/NcoTr1kx+ic=
Date: Mon, 15 Sep 2025 10:21:31 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 4/4] media: uvcvideo: Support
 UVC_CROSXU_CONTROL_IQ_PROFILE
Message-ID: <20250915072131.GA22385@pendragon.ideasonboard.com>
References: <20250818-uvc-iq-switch-v1-0-f7ea5e740ddd@chromium.org>
 <20250818-uvc-iq-switch-v1-4-f7ea5e740ddd@chromium.org>
 <20250913140628.GB10328@pendragon.ideasonboard.com>
 <CANiDSCtsFYoDdQPakhX=mvkYCFpP-U82FBhDwdGJwOME-hFYQg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCtsFYoDdQPakhX=mvkYCFpP-U82FBhDwdGJwOME-hFYQg@mail.gmail.com>

On Mon, Sep 15, 2025 at 09:18:33AM +0200, Ricardo Ribalda wrote:
> On Sat, 13 Sept 2025 at 16:06, Laurent Pinchart wrote:
> > On Mon, Aug 18, 2025 at 08:15:39PM +0000, Ricardo Ribalda wrote:
> > > The ChromeOS XU provides a control to change the IQ profile for a camera.
> > > It can be switched from VIVID (a.k.a. standard) to NONE (a.k.a. natural).
> > >
> > > Wire it up to the standard v4l2 control.
> > >
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/usb/uvc/uvc_ctrl.c | 32 ++++++++++++++++++++++++++++++++
> > >  include/linux/usb/uvc.h          |  5 +++++
> > >  2 files changed, 37 insertions(+)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > index ff975f96e1325532e2299047c07de5d1b9cf09db..8766a441ad1d8554c0daaed3f87758321684246b 100644
> > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > @@ -376,6 +376,15 @@ static const struct uvc_control_info uvc_ctrls[] = {
> > >                               | UVC_CTRL_FLAG_GET_DEF
> > >                               | UVC_CTRL_FLAG_AUTO_UPDATE,
> > >       },
> > > +     {
> > > +             .entity         = UVC_GUID_CHROMEOS_XU,
> > > +             .selector       = UVC_CROSXU_CONTROL_IQ_PROFILE,
> > > +             .index          = 3,
> > > +             .size           = 1,
> > > +             .flags          = UVC_CTRL_FLAG_SET_CUR
> > > +                             | UVC_CTRL_FLAG_GET_RANGE
> > > +                             | UVC_CTRL_FLAG_RESTORE,
> > > +     },
> > >  };
> > >
> > >  static const u32 uvc_control_classes[] = {
> > > @@ -384,6 +393,17 @@ static const u32 uvc_control_classes[] = {
> > >  };
> > >
> > >  static const int exposure_auto_mapping[] = { 2, 1, 4, 8 };
> > > +static const int cros_colorfx_mapping[] = { 1, // V4L2_COLORFX_NONE
> > > +                                         -1, // V4L2_COLORFX_BW
> > > +                                         -1, // V4L2_COLORFX_SEPIA
> > > +                                         -1, // V4L2_COLORFX_NEGATIVE
> > > +                                         -1, // V4L2_COLORFX_EMBOSS
> > > +                                         -1, // V4L2_COLORFX_SKETCH
> > > +                                         -1, // V4L2_COLORFX_SKY_BLUE
> > > +                                         -1, // V4L2_COLORFX_GRASS_GREEN
> > > +                                         -1, // V4L2_COLORFX_SKIN_WHITEN
> > > +                                         0}; // V4L2_COLORFX_VIVID};
> >
> > Extar '};' at the end of the line. The indentation also looks a bit
> > weird. I'll replace it with
> >
> > static const int cros_colorfx_mapping[] = {
> >         1,      /* V4L2_COLORFX_NONE */
> >         -1,     /* V4L2_COLORFX_BW */
> >         -1,     /* V4L2_COLORFX_SEPIA */
> >         -1,     /* V4L2_COLORFX_NEGATIVE */
> >         -1,     /* V4L2_COLORFX_EMBOSS */
> >         -1,     /* V4L2_COLORFX_SKETCH */
> >         -1,     /* V4L2_COLORFX_SKY_BLUE */
> >         -1,     /* V4L2_COLORFX_GRASS_GREEN */
> >         -1,     /* V4L2_COLORFX_SKIN_WHITEN */
> >         0,      /* V4L2_COLORFX_VIVID */
> > };
> >
> > > +
> > >
> > >  static bool uvc_ctrl_mapping_is_compound(struct uvc_control_mapping *mapping)
> > >  {
> > > @@ -975,6 +995,18 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
> > >               .data_type      = UVC_CTRL_DATA_TYPE_BITMASK,
> > >               .name           = "Region of Interest Auto Ctrls",
> > >       },
> > > +     {
> > > +             .id             = V4L2_CID_COLORFX,
> > > +             .entity         = UVC_GUID_CHROMEOS_XU,
> > > +             .selector       = UVC_CROSXU_CONTROL_IQ_PROFILE,
> > > +             .size           = 8,
> > > +             .offset         = 0,
> > > +             .v4l2_type      = V4L2_CTRL_TYPE_MENU,
> > > +             .data_type      = UVC_CTRL_DATA_TYPE_ENUM,
> > > +             .menu_mapping   = cros_colorfx_mapping,
> > > +             .menu_mask      = BIT(V4L2_COLORFX_VIVID) |
> > > +                               BIT(V4L2_COLORFX_NONE),
> > > +     },
> > >  };
> > >
> > >  /* ------------------------------------------------------------------------
> > > diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> > > index 12a57e1d34674a3a264ed7f88bed43926661fcd4..22e0dab0809e296e089940620ae0e8838e109701 100644
> > > --- a/include/linux/usb/uvc.h
> > > +++ b/include/linux/usb/uvc.h
> > > @@ -29,6 +29,9 @@
> > >  #define UVC_GUID_EXT_GPIO_CONTROLLER \
> > >       {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, \
> > >        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x03}
> > > +#define UVC_GUID_CHROMEOS_XU \
> > > +     {0x24, 0xe9, 0xd7, 0x74, 0xc9, 0x49, 0x45, 0x4a, \
> > > +      0x98, 0xa3, 0xc8, 0x07, 0x7e, 0x05, 0x1c, 0xa3}
> >
> > I'd like to add a link to the documentation, but searching for the GUID
> > didn't turn up any meaningful result. Where can I find documentation for
> > this XU ?
> 
> It is not public yet. Not because there is anything secret about it,
> but because of the "making documentation process".

That makes reviewing patches annoying :-/ Any expected time frame ?

You don't have to polish the documentation, if it was good enough to be
shared with webcam vendors to be implemented, it's good enough for the
community too :-)

> Once there is a public document I will add a link.
> 
> > The link can be added later, so
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > >  #define UVC_GUID_MSXU_1_5 \
> > >       {0xdc, 0x95, 0x3f, 0x0f, 0x32, 0x26, 0x4e, 0x4c, \
> > >        0x92, 0xc9, 0xa0, 0x47, 0x82, 0xf4, 0x3b, 0xc8}
> > > @@ -50,6 +53,8 @@
> > >  #define UVC_MSXU_CONTROL_FIELDOFVIEW2_CONFIG 0x0f
> > >  #define UVC_MSXU_CONTROL_FIELDOFVIEW2                0x10
> > >
> > > +#define UVC_CROSXU_CONTROL_IQ_PROFILE                0x04
> > > +
> > >  #define UVC_GUID_FORMAT_MJPEG \
> > >       { 'M',  'J',  'P',  'G', 0x00, 0x00, 0x10, 0x00, \
> > >        0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}

-- 
Regards,

Laurent Pinchart

