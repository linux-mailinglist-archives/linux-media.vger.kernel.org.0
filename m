Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E7DB2B31C0
	for <lists+linux-media@lfdr.de>; Sun, 15 Nov 2020 02:13:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgKOBME (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Nov 2020 20:12:04 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45734 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726290AbgKOBME (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Nov 2020 20:12:04 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 123321F47E3B
Message-ID: <3803ef740171b4684c788ab21f7fcc32231ca198.camel@collabora.com>
Subject: Re: [PATCH v2 9/9] media: docs: Move the H264 stateless codec uAPI
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Date:   Sat, 14 Nov 2020 22:11:52 -0300
In-Reply-To: <df05d7ea-45be-76d6-78a0-47b1a6846ad4@xs4all.nl>
References: <20201113215121.505173-1-ezequiel@collabora.com>
         <20201113215121.505173-10-ezequiel@collabora.com>
         <df05d7ea-45be-76d6-78a0-47b1a6846ad4@xs4all.nl>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 2020-11-14 at 13:57 +0100, Hans Verkuil wrote:
> On 13/11/2020 22:51, Ezequiel Garcia wrote:
> > Now that we've destaged the H264 stateless codec controls,
> > and with all the pieces in place, update the documentation
> > and move it to its own section.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> >  .../userspace-api/media/v4l/common.rst        |   1 +
> >  .../media/v4l/ext-ctrls-codec-stateless.rst   | 674 +++++++++++++++++
> >  .../media/v4l/ext-ctrls-codec.rst             | 692 ------------------
> >  .../media/v4l/pixfmt-compressed.rst           |  14 +-
> >  4 files changed, 682 insertions(+), 699 deletions(-)
> >  create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> > 
> 
> <snip>
> 
> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> > index d585909bc4e2..32b91ce0f0d9 100644
> > --- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> > +++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> > @@ -59,14 +59,14 @@ Compressed Formats
> >  	This format is adapted for stateless video decoders that implement an
> >  	H264 pipeline (using the :ref:`mem2mem` and :ref:`media-request-api`).
> >  	This pixelformat has two modifiers that must be set at least once
> > -	through the ``V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE``
> > -        and ``V4L2_CID_MPEG_VIDEO_H264_START_CODE`` controls.
> > +	through the ``V4L2_CID_STATELESS_H264_DECODE_MODE``
> > +        and ``V4L2_CID_STATELESS_H264_START_CODE`` controls.
> >  	In addition, metadata associated with the frame to decode are
> > -	required to be passed through the ``V4L2_CID_MPEG_VIDEO_H264_SPS``,
> > -	``V4L2_CID_MPEG_VIDEO_H264_PPS``,
> > -	``V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX``,
> > -	``V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS`` and
> > -	``V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS`` controls.  See the
> > +	required to be passed through the ``V4L2_CID_STATELESS_H264_SPS``,
> > +	``V4L2_CID_STATELESS_H264_PPS``,
> > +	``V4L2_CID_STATELESS_H264_SCALING_MATRIX``,
> > +	``V4L2_CID_STATELESS_H264_SLICE_PARAMS`` and
> > +	``V4L2_CID_STATELESS_H264_DECODE_PARAMS`` controls.  See the
> >  	:ref:`associated Codec Control IDs <v4l2-mpeg-h264>`.  Exactly
> >  	one output and one capture buffer must be provided for use
> >  	with this pixel format. The output buffer must contain the
> > 
> 
> There is a note about this 'format not yet part of the public API' that
> needs to be deleted as well.
> 

Good catch.

Thanks,
Eze

> 
> 
> 

