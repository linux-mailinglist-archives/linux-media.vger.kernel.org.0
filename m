Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B28DB3B1002
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 00:23:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbhFVWZd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 18:25:33 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40840 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbhFVWZc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 18:25:32 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id D68571F42BE0
Message-ID: <dea119557eb7ba37b3b468a44a2b6b98bc56a690.camel@collabora.com>
Subject: Re: [PATCH v3 4/8] media: Add P010 video format
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        hverkuil@xs4all.nl, p.zabel@pengutronix.de, mchehab@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com,
        andrzej.p@collabora.com, jc@kynesim.co.uk, jernej.skrabec@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date:   Tue, 22 Jun 2021 19:21:23 -0300
In-Reply-To: <be4b635675df2111cb7c095013323b3ba1ac246e.camel@ndufresne.ca>
References: <20210618131526.566762-1-benjamin.gaignard@collabora.com>
         <20210618131526.566762-5-benjamin.gaignard@collabora.com>
         <fbf31c292fde2f7dafb1441fc85a1ead34fdf96d.camel@collabora.com>
         <be4b635675df2111cb7c095013323b3ba1ac246e.camel@ndufresne.ca>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2021-06-22 at 17:24 -0400, Nicolas Dufresne wrote:
> Le vendredi 18 juin 2021 à 16:38 -0300, Ezequiel Garcia a écrit :
> > Hi Benjamin,
> > 
> > On Fri, 2021-06-18 at 15:15 +0200, Benjamin Gaignard wrote:
> > > P010 is a YUV format with 10-bits per pixel with interleaved UV.
> > > 
> > > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > > ---
> > > version 2:
> > >  - Add documentation about P010 padding
> > >  - Fix the number of bits per component (16)
> > > 
> > >  .../media/v4l/pixfmt-yuv-planar.rst           | 78 ++++++++++++++++++-
> > >  drivers/media/v4l2-core/v4l2-common.c         |  1 +
> > >  drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
> > >  include/uapi/linux/videodev2.h                |  1 +
> > >  4 files changed, 79 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> > > index 090c091affd2..af400d37c8fd 100644
> > > --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> > > +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> > > @@ -100,8 +100,13 @@ All components are stored with the same number of bits per component.
> > >        - Cb, Cr
> > >        - No
> > >        - 64x32 macroblocks
> > > -
> > > -        Horizontal Z order
> > > +    * - V4L2_PIX_FMT_P010
> > 
> > Do we have support in GStreamer (or elsewhere) for this?
> 
> I believe you wanted to ask for patched framework to exercise this ? Since both
> FFMPEG and GSTreamer have had that format for ages. For GStreamer:
> 
> https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/blob/master/gst-libs/gst/video/video-format.h#L102
> 

Ah, great. This sort of info really could be in the commit description
as it's not always clear if a new pixel format looks sane or not.

> No V4L2 mapping upstream, but this is a bit normal, can't upstream a mapping for
> something that does not exist yet.
> 

Well, if you are happy with the patch as-is could you ack it? IIRC, Hantro
and VC8000D produce this, so we'll use it sooner or later. (This information
could be in the commit description as well).
-- 
Kindly,
Ezequiel

