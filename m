Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BECE20A449
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2020 19:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406938AbgFYRwg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jun 2020 13:52:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405562AbgFYRwg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jun 2020 13:52:36 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFC42C08C5C1;
        Thu, 25 Jun 2020 10:52:35 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 34B042A5774
Message-ID: <d2d50756882b7cf23673c3a1b444c03d59648278.camel@collabora.com>
Subject: Re: [RFC 7/7] media: uapi: make H264 stateless codec interface
 public
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date:   Thu, 25 Jun 2020 14:51:56 -0300
In-Reply-To: <478a33a8-89e2-7ed8-4efe-76d62ddc223a@xs4all.nl>
References: <20200623182809.1375-1-ezequiel@collabora.com>
         <20200623182809.1375-8-ezequiel@collabora.com>
         <478a33a8-89e2-7ed8-4efe-76d62ddc223a@xs4all.nl>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2020-06-25 at 09:52 +0200, Hans Verkuil wrote:
> On 23/06/2020 20:28, Ezequiel Garcia wrote:
> > The H264 interface is now ready to be part of the official
> > public API.
> > 
> > In addition, sanitize header includes.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> >  drivers/staging/media/hantro/hantro_hw.h                  | 5 ++---
> >  include/media/v4l2-ctrls.h                                | 3 ++-
> >  include/media/v4l2-h264.h                                 | 2 +-
> >  .../{media/h264-ctrls.h => uapi/linux/v4l2-h264-ctrls.h}  | 8 ++------
> >  4 files changed, 7 insertions(+), 11 deletions(-)
> >  rename include/{media/h264-ctrls.h => uapi/linux/v4l2-h264-ctrls.h} (96%)
> 
> This isn't quite how this should be done.
> 
> The V4L2_PIX_FMT_H264_SLICE define and the V4L2_CTRL_TYPE_H264_* defines should
> move to videodev2.h.
> 

OK.

> The remaining CID defines and the data structures should be moved to v4l2-controls.h.
> 

OK.

> Yes, I know, v4l2-controls.h is getting large. At some point (could actually be
> done in a follow-up patch) the codec controls in v4l2-controls.h should be split off
> into their own header (v4l2-codec-controls.h).
> 

OK, that makes sense.

> One more thing that I was wondering about:
> 
> #define V4L2_CID_MPEG_VIDEO_H264_SPS            (V4L2_CID_MPEG_BASE+1000)
> 
> These controls are at V4L2_CID_MPEG_BASE+1000. But I was wondering if:
> 
> 1) wouldn't it be a good thing to use new CID values since this is the actual
>    uAPI version? This series changes the layout of several structs, so creating
>    new CID values to prevent confusion in applications might be a good idea.
> 
> 2) related to 1): should we make a new control class for stateless codecs?
>    Currently it is mixed in with the stateful codec controls, but I am not so
>    sure that that is such a good idea. Creating a separate stateless codec
>    control class would be a clean separation of stateful and stateless, and it
>    would probably improve the documentation as well.
> 

Good idea.

>    The only 'standard' codec control that is used by stateless codecs is
>    V4L2_CID_MPEG_VIDEO_H264_PROFILE in hantro, although it is not clear to me
>    how it is used. It looks like it is just to report the supported profiles?
>    But it isn't present in the cedrus driver, so it's a bit odd.
> 

I can take a look and add profiles to cedrus as well.

> Thank you for working on finalizing the H264 API.
> 

Thanks for the guidelines and feedback.

I will drop this patch for now, since I think we
now have a clear guideline on how to go public
(which was the goal of this RFC!).

I will move forward the H264 uAPI changes,
and then we can try to push H264, MPEG-2 and VP8
public, as these interfaces are the ones
that seem stable.

Thanks!
Ezequiel  

> Regards,
> 
> 	Hans
> 
> > diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
> > index 4053d8710e04..48d5be144319 100644
> > --- a/drivers/staging/media/hantro/hantro_hw.h
> > +++ b/drivers/staging/media/hantro/hantro_hw.h
> > @@ -11,9 +11,8 @@
> >  
> >  #include <linux/interrupt.h>
> >  #include <linux/v4l2-controls.h>
> > -#include <media/h264-ctrls.h>
> > -#include <media/mpeg2-ctrls.h>
> > -#include <media/vp8-ctrls.h>
> > +
> > +#include <media/v4l2-ctrls.h>
> >  #include <media/videobuf2-core.h>
> >  
> >  #define DEC_8190_ALIGN_MASK	0x07U
> > diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> > index f40e2cbb21d3..fc725ba2ebd8 100644
> > --- a/include/media/v4l2-ctrls.h
> > +++ b/include/media/v4l2-ctrls.h
> > @@ -13,13 +13,14 @@
> >  #include <linux/videodev2.h>
> >  #include <media/media-request.h>
> >  
> > +#include <linux/v4l2-h264-ctrls.h>
> > +
> >  /*
> >   * Include the stateless codec compound control definitions.
> >   * This will move to the public headers once this API is fully stable.
> >   */
> >  #include <media/mpeg2-ctrls.h>
> >  #include <media/fwht-ctrls.h>
> > -#include <media/h264-ctrls.h>
> >  #include <media/vp8-ctrls.h>
> >  #include <media/hevc-ctrls.h>
> >  
> > diff --git a/include/media/v4l2-h264.h b/include/media/v4l2-h264.h
> > index f08ba181263d..d2314f4d4490 100644
> > --- a/include/media/v4l2-h264.h
> > +++ b/include/media/v4l2-h264.h
> > @@ -10,7 +10,7 @@
> >  #ifndef _MEDIA_V4L2_H264_H
> >  #define _MEDIA_V4L2_H264_H
> >  
> > -#include <media/h264-ctrls.h>
> > +#include <media/v4l2-ctrls.h>
> >  
> >  /**
> >   * struct v4l2_h264_reflist_builder - Reference list builder object
> > diff --git a/include/media/h264-ctrls.h b/include/uapi/linux/v4l2-h264-ctrls.h
> > similarity index 96%
> > rename from include/media/h264-ctrls.h
> > rename to include/uapi/linux/v4l2-h264-ctrls.h
> > index 6446ec9f283d..a06f60670d68 100644
> > --- a/include/media/h264-ctrls.h
> > +++ b/include/uapi/linux/v4l2-h264-ctrls.h
> > @@ -2,14 +2,10 @@
> >  /*
> >   * These are the H.264 state controls for use with stateless H.264
> >   * codec drivers.
> > - *
> > - * It turns out that these structs are not stable yet and will undergo
> > - * more changes. So keep them private until they are stable and ready to
> > - * become part of the official public API.
> >   */
> >  
> > -#ifndef _H264_CTRLS_H_
> > -#define _H264_CTRLS_H_
> > +#ifndef __LINUX_V4L2_H264_CONTROLS_H
> > +#define __LINUX_V4L2_H264_CONTROLS_H
> >  
> >  #include <linux/videodev2.h>
> >  
> > 


