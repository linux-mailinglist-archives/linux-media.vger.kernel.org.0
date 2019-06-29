Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C035B5A9B5
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2019 10:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbfF2Iyr convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Sat, 29 Jun 2019 04:54:47 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:56505 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726818AbfF2Iyq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jun 2019 04:54:46 -0400
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 3B672E000D;
        Sat, 29 Jun 2019 08:54:36 +0000 (UTC)
Date:   Sat, 29 Jun 2019 10:54:35 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Fish Lin <linfish@google.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Will Deacon <will.deacon@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Smitha T Murthy <smitha.t@samsung.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>
Subject: Re: [PATCH] media: v4l-ctrl: add control for variable frame rate
Message-ID: <20190629085435.GA1985@aptenodytes>
References: <20190320031022.174052-1-linfish@google.com>
 <0aaba609-1551-e09d-a39f-111dbe99288e@xs4all.nl>
 <CAHpF3df+nJFyg=40NnK-4uRm3fQnrmXk-Ra3QPMHu3jpTZOuQg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <CAHpF3df+nJFyg=40NnK-4uRm3fQnrmXk-Ra3QPMHu3jpTZOuQg@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Fri 29 Mar 19, 10:46, Fish Lin wrote:
> The idea for variable framerate is to reduce bitrate by encode less frames.
> Sometimes the motion is too much and encoder can encode in really low
> bitrate, will be able to dynamic drop some frames to archive
> requirement.

This looks like an interesting optimization to support!

> Codec like H.264 and HEVC can support VFR, and lots of containers also support.
> https://en.wikipedia.org/wiki/Comparison_of_video_container_formats
> 
> Yes, the decoder need to know if video is CFR or VFR, not all decoder
> support VFR, especially for video editing.
> There are also some tools to convert VFR video to CFR video.

Do you have some idea of what using this feature requires in terms of bitstream
elements? We are currently working on the H.264 stateless decoding spec for
hardware decoders and it would be useful to have a somewhat precise idea of how
we could fit support for this feature into it.

Cheers,

Paul

> Some reference:
> https://en.wikipedia.org/wiki/Variable_frame_rate
> https://www.bandicam.com/support/tips/vfr-cfr/
> https://pro-av.panasonic.net/manual/html/AJ-PX270P_PJ_PX_EN_AN(VQT5J83A-8(E))/chapter04_08.htm
> 
> Hans Verkuil <hverkuil-cisco@xs4all.nl> 於 2019年3月28日 週四 下午10:57寫道：
> >
> > On 3/20/19 4:10 AM, Fish Lin wrote:
> > > These flag are added
> > > * V4L2_CID_MPEG_VIDEO_VFR_ENABLE
> > > * V4L2_CID_MPEG_VIDEO_VFR_MIN_FRAMERATE
> > > One is to set variable frame rate enable or not, another is to control
> > > minimal frame rate that video encoder should keep per second.
> > >
> > > Signed-off-by: Fish Lin <linfish@google.com>
> > > ---
> > >  Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 9 +++++++++
> > >  drivers/media/v4l2-core/v4l2-ctrls.c             | 3 +++
> > >  include/uapi/linux/v4l2-controls.h               | 3 +++
> > >  3 files changed, 15 insertions(+)
> > >
> > > diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > > index c97fb7923be5..4bc013d71b67 100644
> > > --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > > +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > > @@ -620,7 +620,16 @@ enum v4l2_mpeg_video_bitrate_mode -
> > >      * - Bit 24:31
> > >        - Must be zero.
> > >
> > > +.. _v4l2-mpeg-video-variable-framerate:
> > >
> > > +``V4L2_CID_MPEG_VIDEO_VFR_ENABLE (boolean)``
> > > +    Set variable framerate enable or not. When enabled, video encoder is able
> > > +    to drop frames based on some mechanism, like frame similarity or bitrate
> > > +    control (default disable).
> > > +
> > > +``V4L2_CID_MPEG_VIDEO_VFR_MIN_FRAMERATE (integer)``
> > > +    Minimal kept frame per second when variable framerate is enabled (default
> > > +    is input framerate).
> >
> > You don't really have a concept of frames per second when encoding. What you
> > are probably trying to say is something like: "don't drop more than one frame for
> > every X frames" or something like that.
> >
> > Which codecs support this? A decoder needs to know that a frame is missing, right?
> >
> > What's the use-case for this?
> >
> > Sorry, just trying to understand this better.
> >
> > Regards,
> >
> >         Hans
> >
> > >
> > >  .. _v4l2-mpeg-video-dec-pts:
> > >
> > > diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> > > index b79d3bbd8350..566c6552c9a0 100644
> > > --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> > > +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> > > @@ -786,6 +786,8 @@ const char *v4l2_ctrl_get_name(u32 id)
> > >       case V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE:                  return "H264 MB Level Rate Control";
> > >       case V4L2_CID_MPEG_VIDEO_HEADER_MODE:                   return "Sequence Header Mode";
> > >       case V4L2_CID_MPEG_VIDEO_MAX_REF_PIC:                   return "Max Number of Reference Pics";
> > > +     case V4L2_CID_MPEG_VIDEO_VFR_ENABLE:                    return "Variable Frame Rate Enable";
> > > +     case V4L2_CID_MPEG_VIDEO_VFR_MIN_FRAMERATE:             return "VFR Minimal Frame Rate";
> > >       case V4L2_CID_MPEG_VIDEO_H263_I_FRAME_QP:               return "H263 I-Frame QP Value";
> > >       case V4L2_CID_MPEG_VIDEO_H263_P_FRAME_QP:               return "H263 P-Frame QP Value";
> > >       case V4L2_CID_MPEG_VIDEO_H263_B_FRAME_QP:               return "H263 B-Frame QP Value";
> > > @@ -1108,6 +1110,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
> > >       case V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE:
> > >       case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:
> > >       case V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE:
> > > +     case V4L2_CID_MPEG_VIDEO_VFR_ENABLE:
> > >       case V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM:
> > >       case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE:
> > >       case V4L2_CID_MPEG_VIDEO_MPEG4_QPEL:
> > > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> > > index 06479f2fb3ae..f1bf52eb0152 100644
> > > --- a/include/uapi/linux/v4l2-controls.h
> > > +++ b/include/uapi/linux/v4l2-controls.h
> > > @@ -404,6 +404,9 @@ enum v4l2_mpeg_video_multi_slice_mode {
> > >  #define V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE                (V4L2_CID_MPEG_BASE+228)
> > >  #define V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME          (V4L2_CID_MPEG_BASE+229)
> > >
> > > +#define V4L2_CID_MPEG_VIDEO_VFR_ENABLE (V4L2_CID_MPEG_BASE + 250)
> > > +#define V4L2_CID_MPEG_VIDEO_VFR_MIN_FRAMERATE (V4L2_CID_MPEG_BASE + 251)
> > > +
> > >  #define V4L2_CID_MPEG_VIDEO_H263_I_FRAME_QP          (V4L2_CID_MPEG_BASE+300)
> > >  #define V4L2_CID_MPEG_VIDEO_H263_P_FRAME_QP          (V4L2_CID_MPEG_BASE+301)
> > >  #define V4L2_CID_MPEG_VIDEO_H263_B_FRAME_QP          (V4L2_CID_MPEG_BASE+302)
> > >
> >

-- 
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
