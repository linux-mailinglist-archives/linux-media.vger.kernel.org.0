Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65FA689D61
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 13:57:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728196AbfHLL4y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 07:56:54 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:56360 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728063AbfHLL4y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 07:56:54 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 5DB3628AC52
Message-ID: <95b8f8f8d5d4f6394cfd5858a29d507b7e77be2f.camel@collabora.com>
Subject: Re: [PATCH v4 04/11] media: uapi: h264: Add the concept of start
 code
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        fbuergisser@chromium.org, linux-kernel@vger.kernel.org
Date:   Mon, 12 Aug 2019 08:56:32 -0300
In-Reply-To: <a729d241-6550-c23a-4f75-f106ab1c7ff9@xs4all.nl>
References: <20190808103432.12062-1-ezequiel@collabora.com>
         <20190808103432.12062-5-ezequiel@collabora.com>
         <a729d241-6550-c23a-4f75-f106ab1c7ff9@xs4all.nl>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2019-08-12 at 12:11 +0200, Hans Verkuil wrote:
> On 8/8/19 12:34 PM, Ezequiel Garcia wrote:
> > Stateless decoders have different expectations about the
> > start code that is prepended on H264 slices. Add a
> > menu control to express the supported start code types
> > (including no start code).
> > 
> > Drivers are allowed to support only one start code type,
> > but they can support both too.
> > 
> > Note that this is independent of the H264 decoding mode,
> > which specifies the granularity of the decoding operations.
> > Either in frame-based or slice-based mode, this new control
> > will allow to define the start code expected on H264 slices.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> > Changes in v4:
> > * New patch.
> > ---
> >  .../media/uapi/v4l/ext-ctrls-codec.rst        | 31 +++++++++++++++++++
> >  drivers/media/v4l2-core/v4l2-ctrls.c          |  9 ++++++
> >  include/media/h264-ctrls.h                    |  6 ++++
> >  3 files changed, 46 insertions(+)
> > 
> > diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > index ea0455957149..94fd3a9b8b9e 100644
> > --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > @@ -2062,6 +2062,37 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> >          The OUTPUT buffer should contain all slices needed to decode the
> >          frame/field.
> >  
> > +``V4L2_CID_MPEG_VIDEO_H264_STARTCODE (enum)``
> > +    Specifies the H264 slice start code expected for each slice.
> > +    This control shall e used to complement V4L2_PIX_FMT_H264_SLICE
> 
> e -> be
> 
> > +    pixel format. Drivers may expose a single or multiple
> > +    start codes, depending on what they can support.
> > +
> > +    .. note::
> > +
> > +       This menu control is not yet part of the public kernel API and
> > +       it is expected to change.
> > +
> > +.. c:type:: v4l2_mpeg_video_h264_startcode
> > +
> > +.. cssclass:: longtable
> > +
> > +.. flat-table::
> > +    :header-rows:  0
> > +    :stub-columns: 0
> > +    :widths:       1 1 2
> > +
> > +    * - ``V4L2_MPEG_VIDEO_H264_NO_STARTCODE``
> > +      - 0
> > +      - Selecting this value specifies that H264 slices are passed
> > +        to the driver without any start code.
> > +        Bla.
> 
> Bla?
> 

Well, despite how many times I reviewed this doc, it seems
this slipped through :-(

> > +    * - ``V4L2_MPEG_VIDEO_H264_ANNEX_B_STARTCODE``
> > +      - 1
> > +      - Selecting this value specifies that H264 slices are expected
> > +        to be prefixed by Annex B start codes. According to :ref:`h264`
> > +        valid start codes can be 3-bytes 0x000001, or 4-bytes 0x00000001.
> > +
> 
> I had the impression that it is more common to require startcodes. If that's
> indeed the case, shouldn't this have value 0 instead of 1?
> 1?
> 

I'm not sure this is indeed the case.

For instance, VA-API accelerators work on H264 slices that are not
prepended by the NALU start code.

I'm fine flipping the values, but at this point, with only cedrus and hantro,
there's doesn't seem to be a "natural" choice.

Thanks,
Ezequiel

