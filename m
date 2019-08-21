Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DB499803B
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2019 18:35:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729010AbfHUQfo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Aug 2019 12:35:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:55666 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727222AbfHUQfo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 12:35:44 -0400
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 694E22332A;
        Wed, 21 Aug 2019 16:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566405342;
        bh=6pH/6tPMV6vhjvltNFeXW1/VbcjNfegziuOzahf8/ew=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Eb8JfXwc5whGq8mkT/MsJV1yWh9E1+eR6E2O5GmiPjB7XNcneSc3XvEUCb2KP3Tlv
         r69vw2SJLOuv9zJRD8xGZBTpR1Ax0SnSA2MdGpeS1NMNMwfxGA1WRwM2IHagNsRM18
         RXALCwjwxPBu+faJFVEd1UuS6HP1BIDBVwVBYRNI=
Received: by mail-lf1-f48.google.com with SMTP id n19so2248006lfe.13;
        Wed, 21 Aug 2019 09:35:42 -0700 (PDT)
X-Gm-Message-State: APjAAAVLXtOGzYOjz/enead2dcVqJM4NS1LR7/MXgOvkICPsgxw961aa
        TsNhqflWqYXuiO0x4wGBX2A5EZPrXIRhwkWDbik=
X-Google-Smtp-Source: APXvYqwFEQBJGJtVAuxtnj8z3ebfjKStxXd0Mm/Kam6qxN0Jx2ohvs8hyjHHkv/Ju/dnaGCy0P/piQ3s5h3t+uNvuPg=
X-Received: by 2002:ac2:44ce:: with SMTP id d14mr19165284lfm.143.1566405340543;
 Wed, 21 Aug 2019 09:35:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190819121720.31345-1-ribalda@kernel.org> <20190821161150.hcbxzxcjvbkoqyb3@uno.localdomain>
In-Reply-To: <20190821161150.hcbxzxcjvbkoqyb3@uno.localdomain>
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
Date:   Wed, 21 Aug 2019 18:35:22 +0200
X-Gmail-Original-Message-ID: <CAPybu_3bttSTcDgEuyR0G2gsQKe7gwwU2fu=eAH0Yj+FH98XJQ@mail.gmail.com>
Message-ID: <CAPybu_3bttSTcDgEuyR0G2gsQKe7gwwU2fu=eAH0Yj+FH98XJQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: add pixel_size control
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="000000000000e6c52a0590a329a0"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--000000000000e6c52a0590a329a0
Content-Type: text/plain; charset="UTF-8"

Hi Jacopo

[sorry for the multiple send, working on a train and fighting with the
mail client and the 4g connection :S]

On Wed, 21 Aug 2019, 18:10 Jacopo Mondi, <jacopo@jmondi.org> wrote:
>
> Hi Ricardo,
>
> On Mon, Aug 19, 2019 at 02:17:18PM +0200, Ricardo Ribalda Delgado wrote:
> > This control returns the pixel size in nanometres. The struct provides
> > the width and the height in separated fields to take into consideration
> > asymmetric pixels and/or hardware binning.
> > This control is required for automatic calibration of the sensor.
> >
> > Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> > ---
> >  drivers/media/v4l2-core/v4l2-ctrls.c | 11 +++++++++++
> >  include/media/v4l2-ctrls.h           |  2 ++
> >  include/uapi/linux/v4l2-controls.h   |  3 +++
> >  include/uapi/linux/videodev2.h       | 11 +++++++++++
> >  4 files changed, 27 insertions(+)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> > index cd1ae016706f..a3a0086c96ff 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> > @@ -978,6 +978,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> >       case V4L2_CID_AUTO_FOCUS_RANGE:         return "Auto Focus, Range";
> >       case V4L2_CID_PAN_SPEED:                return "Pan, Speed";
> >       case V4L2_CID_TILT_SPEED:               return "Tilt, Speed";
> > +     case V4L2_CID_PIXEL_SIZE:               return "Pixel Size";
>
> Is this a camera class control or an image source one ?
> Also, isn't pixel size a bit too generic? I would somehow specify this is
> the physical pixel size

Please review v2. It has changed from pixel_size to unit size, which
is more clear.

>
>
> >
> >       /* FM Radio Modulator controls */
> >       /* Keep the order of the 'case's the same as in v4l2-controls.h! */
> > @@ -1357,6 +1358,9 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
> >       case V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER:
> >               *type = V4L2_CTRL_TYPE_VP8_FRAME_HEADER;
> >               break;
> > +     case V4L2_CID_PIXEL_SIZE:
> > +             *type = V4L2_CTRL_TYPE_PIXEL_SIZE;
>
> Isn't this a read-only control?
>
> > +             break;
> >       default:
> >               *type = V4L2_CTRL_TYPE_INTEGER;
> >               break;
> > @@ -1423,6 +1427,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
> >       case V4L2_CID_RDS_RX_TRAFFIC_ANNOUNCEMENT:
> >       case V4L2_CID_RDS_RX_TRAFFIC_PROGRAM:
> >       case V4L2_CID_RDS_RX_MUSIC_SPEECH:
> > +     case V4L2_CID_PIXEL_SIZE:
> >               *flags |= V4L2_CTRL_FLAG_READ_ONLY;
>
> Ah yes, you set flags here... I don't get why we have two switches
> here.. Anyway, I would set both type and flags in a single case,
> otherwise one should jump back and forth...

Sure. will do on v3

>
> >               break;
> >       case V4L2_CID_RF_TUNER_PLL_LOCK:
> > @@ -1705,6 +1710,9 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
> >       case V4L2_CTRL_TYPE_FWHT_PARAMS:
> >               break;
> >
> > +     case V4L2_CTRL_TYPE_PIXEL_SIZE:
> > +             break;
> > +
> >       case V4L2_CTRL_TYPE_H264_SPS:
> >       case V4L2_CTRL_TYPE_H264_PPS:
> >       case V4L2_CTRL_TYPE_H264_SCALING_MATRIX:
> > @@ -2403,6 +2411,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
> >       case V4L2_CTRL_TYPE_VP8_FRAME_HEADER:
> >               elem_size = sizeof(struct v4l2_ctrl_vp8_frame_header);
> >               break;
> > +     case V4L2_CTRL_TYPE_PIXEL_SIZE:
> > +             elem_size = sizeof(struct v4l2_pixel_size);
> > +             break;
> >       default:
> >               if (type < V4L2_CTRL_COMPOUND_TYPES)
> >                       elem_size = sizeof(s32);
> > diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> > index 570ff4b0205a..63de780398b8 100644
> > --- a/include/media/v4l2-ctrls.h
> > +++ b/include/media/v4l2-ctrls.h
> > @@ -50,6 +50,7 @@ struct poll_table_struct;
> >   * @p_h264_slice_params:     Pointer to a struct v4l2_ctrl_h264_slice_params.
> >   * @p_h264_decode_params:    Pointer to a struct v4l2_ctrl_h264_decode_params.
> >   * @p_vp8_frame_header:              Pointer to a VP8 frame header structure.
> > + * @p_pixel_size:            Pointer to a pixel_size value.
> >   * @p:                               Pointer to a compound value.
> >   */
> >  union v4l2_ctrl_ptr {
> > @@ -68,6 +69,7 @@ union v4l2_ctrl_ptr {
> >       struct v4l2_ctrl_h264_slice_params *p_h264_slice_params;
> >       struct v4l2_ctrl_h264_decode_params *p_h264_decode_params;
> >       struct v4l2_ctrl_vp8_frame_header *p_vp8_frame_header;
> > +     struct v4l2_pixel_size *p_pixel_size;
> >       void *p;
> >  };
> >
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> > index a2669b79b294..13f0410df4c6 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -912,6 +912,9 @@ enum v4l2_auto_focus_range {
> >  #define V4L2_CID_PAN_SPEED                   (V4L2_CID_CAMERA_CLASS_BASE+32)
> >  #define V4L2_CID_TILT_SPEED                  (V4L2_CID_CAMERA_CLASS_BASE+33)
> >
> > +#define V4L2_CID_PIXEL_SIZE                  (V4L2_CID_CAMERA_CLASS_BASE+34)
> > +
> > +
>
> Double empty line

Thanks , will fix in v3
>
> >  /* FM Modulator class control IDs */
> >
> >  #define V4L2_CID_FM_TX_CLASS_BASE            (V4L2_CTRL_CLASS_FM_TX | 0x900)
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index 2427bc4d8eba..21f4846dca0b 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -422,6 +422,11 @@ struct v4l2_fract {
> >       __u32   denominator;
> >  };
> >
> > +struct v4l2_pixel_size {
>
> I wonder if instead of defining a 'pixel size' this shouldn't be a
> more generic v4l2_size or something similar. Or even a v4l2_rect with
> left=top=0.

Fixed on v2

>
> > +     __u32   width;
> > +     __u32   height;
> > +};
> > +
> >  /**
> >    * struct v4l2_capability - Describes V4L2 device caps returned by VIDIOC_QUERYCAP
> >    *
> > @@ -1718,6 +1723,12 @@ enum v4l2_ctrl_type {
> >       V4L2_CTRL_TYPE_U8            = 0x0100,
> >       V4L2_CTRL_TYPE_U16           = 0x0101,
> >       V4L2_CTRL_TYPE_U32           = 0x0102,
> > +     /*
> > +      * V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS = 0x0103,
> > +      * V4L2_CTRL_TYPE_MPEG2_QUANTIZATION = 0x0104,
> > +      * V4L2_CTRL_TYPE_FWHT_PARAMS = 0x0105,
> > +      */
>
> leftovers ?
They are defined on other .h. I thought it was nice to know why I did
not use 0x0103

include/media/mpeg2-ctrls.h:#define V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS 0x0103
include/media/mpeg2-ctrls.h:#define V4L2_CTRL_TYPE_MPEG2_QUANTIZATION 0x0104
include/media/fwht-ctrls.h:#define V4L2_CTRL_TYPE_FWHT_PARAMS 0x0105



>
> > +     V4L2_CTRL_TYPE_PIXEL_SIZE    = 0x0106,
>
> I don't see other compound controls with a custom payload adding their
> types here. What am I missing?

@Hans could you clarify here what is the best practice?

Thanks!!


On Wed, Aug 21, 2019 at 6:10 PM Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Hi Ricardo,
>
> On Mon, Aug 19, 2019 at 02:17:18PM +0200, Ricardo Ribalda Delgado wrote:
> > This control returns the pixel size in nanometres. The struct provides
> > the width and the height in separated fields to take into consideration
> > asymmetric pixels and/or hardware binning.
> > This control is required for automatic calibration of the sensor.
> >
> > Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> > ---
> >  drivers/media/v4l2-core/v4l2-ctrls.c | 11 +++++++++++
> >  include/media/v4l2-ctrls.h           |  2 ++
> >  include/uapi/linux/v4l2-controls.h   |  3 +++
> >  include/uapi/linux/videodev2.h       | 11 +++++++++++
> >  4 files changed, 27 insertions(+)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> > index cd1ae016706f..a3a0086c96ff 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> > @@ -978,6 +978,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> >       case V4L2_CID_AUTO_FOCUS_RANGE:         return "Auto Focus, Range";
> >       case V4L2_CID_PAN_SPEED:                return "Pan, Speed";
> >       case V4L2_CID_TILT_SPEED:               return "Tilt, Speed";
> > +     case V4L2_CID_PIXEL_SIZE:               return "Pixel Size";
>
> Is this a camera class control or an image source one ?
> Also, isn't pixel size a bit too generic? I would somehow specify this is
> the physical pixel size
>
> >
> >       /* FM Radio Modulator controls */
> >       /* Keep the order of the 'case's the same as in v4l2-controls.h! */
> > @@ -1357,6 +1358,9 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
> >       case V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER:
> >               *type = V4L2_CTRL_TYPE_VP8_FRAME_HEADER;
> >               break;
> > +     case V4L2_CID_PIXEL_SIZE:
> > +             *type = V4L2_CTRL_TYPE_PIXEL_SIZE;
>
> Isn't this a read-only control?
>
> > +             break;
> >       default:
> >               *type = V4L2_CTRL_TYPE_INTEGER;
> >               break;
> > @@ -1423,6 +1427,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
> >       case V4L2_CID_RDS_RX_TRAFFIC_ANNOUNCEMENT:
> >       case V4L2_CID_RDS_RX_TRAFFIC_PROGRAM:
> >       case V4L2_CID_RDS_RX_MUSIC_SPEECH:
> > +     case V4L2_CID_PIXEL_SIZE:
> >               *flags |= V4L2_CTRL_FLAG_READ_ONLY;
>
> Ah yes, you set flags here... I don't get why we have two switches
> here.. Anyway, I would set both type and flags in a single case,
> otherwise one should jump back and forth...
>
> >               break;
> >       case V4L2_CID_RF_TUNER_PLL_LOCK:
> > @@ -1705,6 +1710,9 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
> >       case V4L2_CTRL_TYPE_FWHT_PARAMS:
> >               break;
> >
> > +     case V4L2_CTRL_TYPE_PIXEL_SIZE:
> > +             break;
> > +
> >       case V4L2_CTRL_TYPE_H264_SPS:
> >       case V4L2_CTRL_TYPE_H264_PPS:
> >       case V4L2_CTRL_TYPE_H264_SCALING_MATRIX:
> > @@ -2403,6 +2411,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
> >       case V4L2_CTRL_TYPE_VP8_FRAME_HEADER:
> >               elem_size = sizeof(struct v4l2_ctrl_vp8_frame_header);
> >               break;
> > +     case V4L2_CTRL_TYPE_PIXEL_SIZE:
> > +             elem_size = sizeof(struct v4l2_pixel_size);
> > +             break;
> >       default:
> >               if (type < V4L2_CTRL_COMPOUND_TYPES)
> >                       elem_size = sizeof(s32);
> > diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> > index 570ff4b0205a..63de780398b8 100644
> > --- a/include/media/v4l2-ctrls.h
> > +++ b/include/media/v4l2-ctrls.h
> > @@ -50,6 +50,7 @@ struct poll_table_struct;
> >   * @p_h264_slice_params:     Pointer to a struct v4l2_ctrl_h264_slice_params.
> >   * @p_h264_decode_params:    Pointer to a struct v4l2_ctrl_h264_decode_params.
> >   * @p_vp8_frame_header:              Pointer to a VP8 frame header structure.
> > + * @p_pixel_size:            Pointer to a pixel_size value.
> >   * @p:                               Pointer to a compound value.
> >   */
> >  union v4l2_ctrl_ptr {
> > @@ -68,6 +69,7 @@ union v4l2_ctrl_ptr {
> >       struct v4l2_ctrl_h264_slice_params *p_h264_slice_params;
> >       struct v4l2_ctrl_h264_decode_params *p_h264_decode_params;
> >       struct v4l2_ctrl_vp8_frame_header *p_vp8_frame_header;
> > +     struct v4l2_pixel_size *p_pixel_size;
> >       void *p;
> >  };
> >
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> > index a2669b79b294..13f0410df4c6 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -912,6 +912,9 @@ enum v4l2_auto_focus_range {
> >  #define V4L2_CID_PAN_SPEED                   (V4L2_CID_CAMERA_CLASS_BASE+32)
> >  #define V4L2_CID_TILT_SPEED                  (V4L2_CID_CAMERA_CLASS_BASE+33)
> >
> > +#define V4L2_CID_PIXEL_SIZE                  (V4L2_CID_CAMERA_CLASS_BASE+34)
> > +
> > +
>
> Double empty line
>
> >  /* FM Modulator class control IDs */
> >
> >  #define V4L2_CID_FM_TX_CLASS_BASE            (V4L2_CTRL_CLASS_FM_TX | 0x900)
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index 2427bc4d8eba..21f4846dca0b 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -422,6 +422,11 @@ struct v4l2_fract {
> >       __u32   denominator;
> >  };
> >
> > +struct v4l2_pixel_size {
>
> I wonder if instead of defining a 'pixel size' this shouldn't be a
> more generic v4l2_size or something similar. Or even a v4l2_rect with
> left=top=0.
>
> > +     __u32   width;
> > +     __u32   height;
> > +};
> > +
> >  /**
> >    * struct v4l2_capability - Describes V4L2 device caps returned by VIDIOC_QUERYCAP
> >    *
> > @@ -1718,6 +1723,12 @@ enum v4l2_ctrl_type {
> >       V4L2_CTRL_TYPE_U8            = 0x0100,
> >       V4L2_CTRL_TYPE_U16           = 0x0101,
> >       V4L2_CTRL_TYPE_U32           = 0x0102,
> > +     /*
> > +      * V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS = 0x0103,
> > +      * V4L2_CTRL_TYPE_MPEG2_QUANTIZATION = 0x0104,
> > +      * V4L2_CTRL_TYPE_FWHT_PARAMS = 0x0105,
> > +      */
>
> leftovers ?
>
> > +     V4L2_CTRL_TYPE_PIXEL_SIZE    = 0x0106,
>
> I don't see other compound controls with a custom payload adding their
> types here. What am I missing?
>
> Thanks
>   j
>
> >  };
> >
> >  /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */
> > --
> > 2.23.0.rc1
> >

--000000000000e6c52a0590a329a0
Content-Type: text/plain; charset="US-ASCII"; name="signature.asc"
Content-Disposition: attachment; filename="signature.asc"
Content-Transfer-Encoding: base64
Content-ID: <16cb501814f61a8e03b2>
X-Attachment-Id: 16cb501814f61a8e03b2

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0NCg0KaVFJekJBQUJDQUFkRmlFRXRjUTlTSUNh
SUlxUFdEakFjalFHanhhaFZqd0ZBbDFkYlVZQUNna1FjalFHanhhaA0KVmp6TVNnLy9UM1owUG4v
TU00cmwwZDlFMDgrVWhvdnd5bU05MmcvazJnaUJuVFREbUx5WlNhbmg0d0o1ejk1eg0KQ2N5U3FE
cVNkc2drNG9lN0JTTVIzK2thSy9PME05bzd3a3pOVUl6cGdUMEgyelBJa2hMbzRya1lOOTdXMlhD
ag0KZVZJY1VrZEswWVNScEpMVVlYUDRQeVRZTU5od3dtUDh1Z0N0Zm5oZE1uVlA1bHk1SC9qSGNI
OVBWbEJVVnBhcQ0KcXJaVlJtZnpYN042anQ1TDNRRTdFTVhuSDBPb3VRdVpSRTdjMFJxY1JZa0Z3
dHN5RHR1N1djOWNmQXhRR0tXMg0KVWRreDM4N1lUc0xHVHZoM1RnVnlpUjI4Zm9uWXhmbzQ4bGo4
WVBNNDlPNTNzdHdzcWdNZWc2NjdVSjZIUHprbw0KUlk2UVV3Yno5WW81VGhuTWhmSVJxSVA4OHdQ
VFl5ZCtnbHM4SHM2UEorTFp4NUFHWWF2ZkJ2dFdJMTVOdVJTYw0KK1ZLck45czJwcXJPNFNKc1p2
dHhSMFA0aGU2U2VHUE5Eam96THYycmd0ckpEbFdzdFBLZTk3ZndvUldCaEZ3ZA0KeGI4ZEhHRDZM
RDVYNmJEaUpOV0ZOczVnTXRpM2xNSDkyQ2ZYQzM2UzJPa3RWNDBFVkFYV1FDcnlRV29oSDNjbQ0K
aHZGYlM4b2RqMkF2WFArMW9nRXJQNVFnWmU0aUkra0RjdDFrVXh0MVRqRTNpV2pidklFTnBqZ1RV
OVdVdk03MA0KVlk2WWNXNThKMXZrK0RaSE9SaUViQjVsQS84Y0Rlb1dZU1ZUUk9LcTlGUHJmR3hP
eWJ3ekx6Y1ZmbzVOMzdRTw0KSmFQaE1mbTFUTGllY1pWMnc4S2RwZGZIc0VKRjNRRUdEeTlwQnp0
TFYvQjhGQ3c3eEEwPQ0KPStFZFANCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQ0K
--000000000000e6c52a0590a329a0--
