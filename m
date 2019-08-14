Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74E088D5B2
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 16:12:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbfHNOM2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 10:12:28 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:55000 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbfHNOM2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 10:12:28 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 78E88286289
Message-ID: <c490068a4d1ea550f330e8127826014bec0e12f2.camel@collabora.com>
Subject: Re: [PATCH v5 04/11] media: uapi: h264: Add the concept of start
 code
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        fbuergisser@chromium.org, linux-kernel@vger.kernel.org
Date:   Wed, 14 Aug 2019 11:12:16 -0300
In-Reply-To: <20190814114928.GB4687@aptenodytes>
References: <20190812193522.10911-1-ezequiel@collabora.com>
         <20190812193522.10911-5-ezequiel@collabora.com>
         <f88d144f-e0fe-6974-efe5-77b5ed5c6e09@xs4all.nl>
         <20190814114928.GB4687@aptenodytes>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2019-08-14 at 13:49 +0200, Paul Kocialkowski wrote:
> Hi,
> 
> On Wed 14 Aug 19, 10:11, Hans Verkuil wrote:
> > On 8/12/19 9:35 PM, Ezequiel Garcia wrote:
> > > Stateless decoders have different expectations about the
> > > start code that is prepended on H264 slices. Add a
> > > menu control to express the supported start code types
> > > (including no start code).
> > > 
> > > Drivers are allowed to support only one start code type,
> > > but they can support both too.
> > > 
> > > Note that this is independent of the H264 decoding mode,
> > > which specifies the granularity of the decoding operations.
> > > Either in frame-based or slice-based mode, this new control
> > > will allow to define the start code expected on H264 slices.
> > > 
> > > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > > Tested-by: Philipp Zabel <p.zabel@pengutronix.de>
> > > ---
> > > Changes in v5:
> > > * Improve specification as suggested by Hans.
> > > Changes in v4:
> > > * New patch.
> > > ---
> > >  .../media/uapi/v4l/ext-ctrls-codec.rst        | 33 +++++++++++++++++++
> > >  .../media/uapi/v4l/pixfmt-compressed.rst      |  3 +-
> > >  drivers/media/v4l2-core/v4l2-ctrls.c          |  9 +++++
> > >  include/media/h264-ctrls.h                    |  6 ++++
> > >  4 files changed, 50 insertions(+), 1 deletion(-)
> > > 
> > 
> > <snip>
> > 
> > > diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
> > > index e6c510877f67..31555c99f64a 100644
> > > --- a/include/media/h264-ctrls.h
> > > +++ b/include/media/h264-ctrls.h
> > > @@ -27,6 +27,7 @@
> > >  #define V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS	(V4L2_CID_MPEG_BASE+1003)
> > >  #define V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS	(V4L2_CID_MPEG_BASE+1004)
> > >  #define V4L2_CID_MPEG_VIDEO_H264_DECODING_MODE	(V4L2_CID_MPEG_BASE+1005)
> > > +#define V4L2_CID_MPEG_VIDEO_H264_STARTCODE	(V4L2_CID_MPEG_BASE+1006)
> > 
> > I almost forgot: can you change this to _START_CODE? Since it is two words?
> 
> Agreed, I like it better this way too.
> 

The reason to have STARTCODE instead of START_CODE was to have some
consistency with other controls (namely, V4L2_CID_MPEG_VIDEO_HEVC_WITHOUT_STARTCODE).

Consistency is really important in a API,
but at the same time, I agree START_CODE looks better.

> > Thanks!
> > 
> > 	Hans
> > 
> > >  
> > >  /* enum v4l2_ctrl_type type values */
> > >  #define V4L2_CTRL_TYPE_H264_SPS			0x0110
> > > @@ -41,6 +42,11 @@ enum v4l2_mpeg_video_h264_decoding_mode {
> > >  	V4L2_MPEG_VIDEO_H264_FRAME_BASED_DECODING,
> > >  };
> > >  
> > > +enum v4l2_mpeg_video_h264_start_code {
> > > +	V4L2_MPEG_VIDEO_H264_NO_STARTCODE,
> > > +	V4L2_MPEG_VIDEO_H264_ANNEX_B_STARTCODE,
> 
> Could we apply the same START_CODE renaming here too?
> 
> I was also thinking that it would be slightly more readable put like this,
> with START_CODE as a prefix since it's common to both options and the name of
> the enum:
> 
> - V4L2_MPEG_VIDEO_H264_START_CODE_NONE
> - V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B
> 

Yes, that looks much better.

Thanks,
Ezequiel

