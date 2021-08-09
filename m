Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 569F03E457C
	for <lists+linux-media@lfdr.de>; Mon,  9 Aug 2021 14:19:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234654AbhHIMUE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Aug 2021 08:20:04 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:51560 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233632AbhHIMUD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Aug 2021 08:20:03 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F2AD466;
        Mon,  9 Aug 2021 14:19:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1628511582;
        bh=j6V6Cjp3JCRuXQHvmqQ6hphQEj5SdZE/JyneUt2h4og=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SDnonr2tDmxFYyTpdhvilaC9QRjlwwYeQBxT47v10fbwA2q8YscOO2jbokSY/kvgZ
         uEvRcHYMHkEULd7C3klZILEaW5TEKMtPxc5gr8X9q5rcaUipFAMpJddIhzV2qAuOZw
         TmxgbHxaeefSBZSU2YFfIE2PkPbrNPNQ2IjVe8K0=
Date:   Mon, 9 Aug 2021 15:19:40 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     David Plowman <david.plowman@raspberrypi.com>,
        linux-media@vger.kernel.org, sakari.ailus@iki.fi,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v4 1/2] media: v4l2-ctrls: Add V4L2_CID_NOTIFY_GAINS
 control
Message-ID: <YREdXF2XhR6WA+50@pendragon.ideasonboard.com>
References: <20210809093448.4461-1-david.plowman@raspberrypi.com>
 <20210809093448.4461-2-david.plowman@raspberrypi.com>
 <21527f47-3c9e-55e2-3973-bfd0ebc91c2e@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <21527f47-3c9e-55e2-3973-bfd0ebc91c2e@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Mon, Aug 09, 2021 at 01:05:00PM +0200, Hans Verkuil wrote:
> On 09/08/2021 11:34, David Plowman wrote:
> > We add a new control V4L2_CID_NOTIFY_GAINS which allows the sensor to
> > be notified what gains will be applied to the different colour
> > channels by subsequent processing (such as by an ISP), even though the
> > sensor will not apply any of these gains itself.
> > 
> > For Bayer sensors this will be an array control taking 4 values which
> > are the 4 gains arranged in the fixed order B, Gb, Gr and R,
> > irrespective of the exact Bayer order of the sensor itself.
> > 
> > The units are in all cases linear with the default value indicating a
> > gain of exactly 1.
> 
> So a value of 2 means a gain of 2? Or are these fixed point values? How do
> I represent a gain of 1.5?

No, the default value corresponds to a x1.0 gain, but it's not 1. If the
default is, let's say, 128, then x2.0 will be 256.

> > Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c | 1 +
> >  include/uapi/linux/v4l2-controls.h        | 1 +
> >  2 files changed, 2 insertions(+)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > index 421300e13a41..f87053c83249 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > @@ -1107,6 +1107,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> >  	case V4L2_CID_TEST_PATTERN_GREENR:	return "Green (Red) Pixel Value";
> >  	case V4L2_CID_TEST_PATTERN_BLUE:	return "Blue Pixel Value";
> >  	case V4L2_CID_TEST_PATTERN_GREENB:	return "Green (Blue) Pixel Value";
> > +	case V4L2_CID_NOTIFY_GAINS:		return "Notify Gains";
> >  
> >  	/* Image processing controls */
> >  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> 
> Since this is a standard control, it should also be configured correctly in
> v4l2_ctrl_fill().
> 
> Instead of an array, would a compound control (aka a struct) be better? Then you can
> explicitly have field names g, gb, gr and r.
> 
> Is there a specific reason we want an array instead of that? I'm not opposed, but
> I'd like to see a rationale for that.

Bayer ia only one of the possible CFA patterns for sensors. With a
structure containing named b, gb, gr and r fields, we wouldn't be able
to support, for instance, RGBW filters. It's not clear at this point
what other CFA patterns will be seen in sensors that require this
feature, but an array control will be able to more easily support these
use cases.

> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> > index 5532b5f68493..133e20444939 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -1118,6 +1118,7 @@ enum v4l2_jpeg_chroma_subsampling {
> >  #define V4L2_CID_TEST_PATTERN_BLUE		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 6)
> >  #define V4L2_CID_TEST_PATTERN_GREENB		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 7)
> >  #define V4L2_CID_UNIT_CELL_SIZE			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 8)
> > +#define V4L2_CID_NOTIFY_GAINS			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 9)
> >  
> >  
> >  /* Image processing controls */

-- 
Regards,

Laurent Pinchart
