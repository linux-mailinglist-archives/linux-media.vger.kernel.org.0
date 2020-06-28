Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6340920CA5A
	for <lists+linux-media@lfdr.de>; Sun, 28 Jun 2020 22:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726080AbgF1U1H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Jun 2020 16:27:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726011AbgF1U1H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Jun 2020 16:27:07 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF836C03E979
        for <linux-media@vger.kernel.org>; Sun, 28 Jun 2020 13:27:06 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C07F4FB;
        Sun, 28 Jun 2020 22:27:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1593376023;
        bh=e6nORgmVothb1fYeN60nWx2Gck3W2vO5viZCmQZ4TSU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QI8lonjy0wZjXrK57J92FW7bEfGUCo1YmLk/dVFSx+eotyQrk4GZPH4DjeSs+RqJ1
         tZqQS15sApZLdaYVMcoRkK5zOy21tCXBT6rdsT0FbGr1L/ijxBQxTZPEDA3xaEN4u5
         QvhqKyp1bB5tz1rJqdk56Aw7SN9qUzJxP18lCigA=
Date:   Sun, 28 Jun 2020 23:27:00 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Dafna Hirschfeld <dafna3@gmail.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [RFC v3 2/2] media: staging: rkisp1: allow quantization
 conversion from userspace for isp source pad
Message-ID: <20200628202700.GV6954@pendragon.ideasonboard.com>
References: <CAAFQd5BPOUFsKb0Qa_6QiytE6=OM3jjSVWyoikdgyNvr4vu0fw@mail.gmail.com>
 <CAAFQd5DoUu+bMO1GeSX0qbsW5u-KDmRvtO2kfGePghrv59bQmw@mail.gmail.com>
 <62611ccd-e4cd-728a-355b-532661b36be0@collabora.com>
 <20200618184923.GB68039@chromium.org>
 <a163dbb3-8278-684e-6324-4c36924ed335@collabora.com>
 <20200618192535.GD73379@chromium.org>
 <67cdd3be-ee2a-3b88-5d17-d9d1d17b2603@collabora.com>
 <CAAFQd5Bkh1QphjQtMyWQeN7wtK93YN2PeU-bKkUFh46PQ=ujLw@mail.gmail.com>
 <20200628131537.GT6954@pendragon.ideasonboard.com>
 <CAAFQd5BDXJVZ1UNvbLwccFnTOoQ_U7MdZhQNNzQSZtn9ne40cA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAAFQd5BDXJVZ1UNvbLwccFnTOoQ_U7MdZhQNNzQSZtn9ne40cA@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz,

On Sun, Jun 28, 2020 at 04:59:34PM +0200, Tomasz Figa wrote:
> On Sun, Jun 28, 2020 at 3:15 PM Laurent Pinchart wrote:
> > On Sun, Jun 28, 2020 at 03:10:41PM +0200, Tomasz Figa wrote:
> >> On Fri, Jun 26, 2020 at 2:15 AM Helen Koike <helen.koike@collabora.com> wrote:
> >>> On 6/18/20 4:25 PM, Tomasz Figa wrote:
> >>>> On Thu, Jun 18, 2020 at 08:54:34PM +0200, Dafna Hirschfeld wrote:
> >>>>> On 18.06.20 20:49, Tomasz Figa wrote:
> >>>>>> On Thu, Jun 18, 2020 at 08:26:33PM +0200, Dafna Hirschfeld wrote:
> >>>>>>> On 18.06.20 19:27, Tomasz Figa wrote:
> >>>>>>>> On Wed, Jun 10, 2020 at 2:08 PM Tomasz Figa wrote:
> >>>>>>>>> On Thu, Jun 4, 2020 at 9:11 PM Dafna Hirschfeld wrote:
> >>>>>>>>>> On 04.06.20 19:54, Tomasz Figa wrote:
> >>>>>>>>>>> On Thu, Apr 16, 2020 at 04:56:05PM +0200, Dafna Hirschfeld wrote:
> >>>>>>>>>>>> The isp entity has a hardware support to force full range quantization
> >>>>>>>>>>>> for YUV formats. Use the new API to indicate userspace that
> >>>>>>>>>>>> quantization conversion is supported by adding the flag
> >>>>>>>>>>>> V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION during media code enumeration.
> >>>>>>>>>>>> Then uppon s_fmt on the video source pad, we assign the
> >>>>>>>>>>>> quantization from userspace for YUV formats.
> >>>>>>>>>>>> Also in the capture and resizer entities we retrieve the colorspace
> >>>>>>>>>>>> from the isp entity.
> >>>>>>>>>>>>
> >>>>>>>>>>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> >>>>>>>>>>>> ---
> >>>>>>>>>>>>     drivers/staging/media/rkisp1/rkisp1-capture.c | 28 ++++++-------
> >>>>>>>>>>>>     drivers/staging/media/rkisp1/rkisp1-common.h  |  2 +
> >>>>>>>>>>>>     drivers/staging/media/rkisp1/rkisp1-isp.c     | 39 +++++++++++++++++--
> >>>>>>>>>>>>     drivers/staging/media/rkisp1/rkisp1-resizer.c | 13 +++++++
> >>>>>>>>>>>>     4 files changed, 65 insertions(+), 17 deletions(-)
> >>>>>>>>>>>>
> >>>>>>>>>>>> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> >>>>>>>>>>>> index fbf62399fe3d..aca0f93bc772 100644
> >>>>>>>>>>>> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
> >>>>>>>>>>>> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
> >>>>>>>>>>>> @@ -1066,14 +1066,13 @@ static void rkisp1_try_fmt(const struct rkisp1_capture *cap,
> >>>>>>>>>>>>                           const struct v4l2_format_info **fmt_info)
> >>>>>>>>>>>>     {
> >>>>>>>>>>>>        const struct rkisp1_capture_config *config = cap->config;
> >>>>>>>>>>>> -    struct rkisp1_capture *other_cap =
> >>>>>>>>>>>> -                    &cap->rkisp1->capture_devs[cap->id ^ 1];
> >>>>>>>>>>>>        const struct rkisp1_capture_fmt_cfg *fmt;
> >>>>>>>>>>>>        const struct v4l2_format_info *info;
> >>>>>>>>>>>>        const unsigned int max_widths[] = { RKISP1_RSZ_MP_SRC_MAX_WIDTH,
> >>>>>>>>>>>>                                            RKISP1_RSZ_SP_SRC_MAX_WIDTH };
> >>>>>>>>>>>>        const unsigned int max_heights[] = { RKISP1_RSZ_MP_SRC_MAX_HEIGHT,
> >>>>>>>>>>>>                                             RKISP1_RSZ_SP_SRC_MAX_HEIGHT};
> >>>>>>>>>>>> +    struct v4l2_subdev_format isp_sd_fmt;
> >>>>>>>>>>>>
> >>>>>>>>>>>>        fmt = rkisp1_find_fmt_cfg(cap, pixm->pixelformat);
> >>>>>>>>>>>>        if (!fmt) {
> >>>>>>>>>>>> @@ -1081,24 +1080,27 @@ static void rkisp1_try_fmt(const struct rkisp1_capture *cap,
> >>>>>>>>>>>>                pixm->pixelformat = fmt->fourcc;
> >>>>>>>>>>>>        }
> >>>>>>>>>>>>
> >>>>>>>>>>>> +    rkisp1_get_isp_src_fmt(cap->rkisp1, &isp_sd_fmt);
> >>>>>>>>>>>> +    pixm->field = isp_sd_fmt.format.field;
> >>>>>>>>>>>> +    pixm->colorspace = isp_sd_fmt.format.colorspace;
> >>>>>>>>>>>> +    pixm->ycbcr_enc = isp_sd_fmt.format.ycbcr_enc;
> >>>>>>>>>>>> +    pixm->xfer_func = isp_sd_fmt.format.xfer_func;
> >>>>>>>>>>>> +
> >>>>>>>>>>>> +    /*
> >>>>>>>>>>>> +     * isp has a feature to set full range quantization for yuv formats.
> >>>>>>>>>>>
> >>>>>>>>>>> How about "select between limited and full range for YUV formats"?
> >>>>>>>>>>>
> >>>>>>>>>>>> +     * so we need to get the format from the isp.
> >>>>>>>>>>>> +     */
> >>>>>>>>>>>> +    pixm->quantization = isp_sd_fmt.format.quantization;
> >>>>>>>>>>>> +    if (!v4l2_is_format_yuv(cap->pix.info))
> >>>>>>>>>>>> +            pixm->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> >>>>>>>>>>>> +
> >>>>>>>>>>>>        pixm->width = clamp_t(u32, pixm->width,
> >>>>>>>>>>>>                              RKISP1_RSZ_SRC_MIN_WIDTH, max_widths[cap->id]);
> >>>>>>>>>>>>        pixm->height = clamp_t(u32, pixm->height,
> >>>>>>>>>>>>                               RKISP1_RSZ_SRC_MIN_HEIGHT, max_heights[cap->id]);
> >>>>>>>>>>>>
> >>>>>>>>>>>> -    pixm->field = V4L2_FIELD_NONE;
> >>>>>>>>>>>> -    pixm->colorspace = V4L2_COLORSPACE_DEFAULT;
> >>>>>>>>>>>> -    pixm->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> >>>>>>>>>>>> -
> >>>>>>>>>>>>        info = rkisp1_fill_pixfmt(pixm, cap->id);
> >>>>>>>>>>>>
> >>>>>>>>>>>> -    /* can not change quantization when stream-on */
> >>>>>>>>>>>> -    if (other_cap->is_streaming)
> >>>>>>>>>>>> -            pixm->quantization = other_cap->pix.fmt.quantization;
> >>>>>>>>>>>> -    /* output full range by default, take effect in params */
> >>>>>>>>>>>> -    else if (!pixm->quantization ||
> >>>>>>>>>>>> -             pixm->quantization > V4L2_QUANTIZATION_LIM_RANGE)
> >>>>>>>>>>>> -            pixm->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> >>>>>>>>>>>>
> >>>>>>>>>>>>        if (fmt_cfg)
> >>>>>>>>>>>>                *fmt_cfg = fmt;
> >>>>>>>>>>>> diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
> >>>>>>>>>>>> index 2d7b7e078636..7a5576fa14c9 100644
> >>>>>>>>>>>> --- a/drivers/staging/media/rkisp1/rkisp1-common.h
> >>>>>>>>>>>> +++ b/drivers/staging/media/rkisp1/rkisp1-common.h
> >>>>>>>>>>>> @@ -300,6 +300,8 @@ int rkisp1_isp_register(struct rkisp1_device *rkisp1,
> >>>>>>>>>>>>                        struct v4l2_device *v4l2_dev);
> >>>>>>>>>>>>     void rkisp1_isp_unregister(struct rkisp1_device *rkisp1);
> >>>>>>>>>>>>
> >>>>>>>>>>>> +int rkisp1_get_isp_src_fmt(struct rkisp1_device *rkisp1,
> >>>>>>>>>>>> +                       struct v4l2_subdev_format *sd_fmt);
> >>>>>>>>>>>>     const struct rkisp1_isp_mbus_info *rkisp1_isp_mbus_info_get(u32 mbus_code);
> >>>>>>>>>>>>
> >>>>>>>>>>>>     irqreturn_t rkisp1_isp_isr(struct rkisp1_device *rkisp1);
> >>>>>>>>>>>> diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
> >>>>>>>>>>>> index dee8e96f3900..6fdf5ed0b6b1 100644
> >>>>>>>>>>>> --- a/drivers/staging/media/rkisp1/rkisp1-isp.c
> >>>>>>>>>>>> +++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
> >>>>>>>>>>>> @@ -613,6 +613,10 @@ static int rkisp1_isp_enum_mbus_code(struct v4l2_subdev *sd,
> >>>>>>>>>>>>
> >>>>>>>>>>>>                if (code->index == pos - 1) {
> >>>>>>>>>>>>                        code->code = fmt->mbus_code;
> >>>>>>>>>>>> +                    if (fmt->pixel_enc == V4L2_PIXEL_ENC_YUV &&
> >>>>>>>>>>>> +                        dir == RKISP1_DIR_SRC)
> >>>>>>>>>>>> +                            code->flags =
> >>>>>>>>>>>> +                                    V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION;
> >>>>>>>>>>>>                        return 0;
> >>>>>>>>>>>>                }
> >>>>>>>>>>>>        }
> >>>>>>>>>>>> @@ -639,12 +643,21 @@ static int rkisp1_isp_init_config(struct v4l2_subdev *sd,
> >>>>>>>>>>>>        sink_crop->height = RKISP1_DEFAULT_HEIGHT;
> >>>>>>>>>>>>        sink_crop->left = 0;
> >>>>>>>>>>>>        sink_crop->top = 0;
> >>>>>>>>>>>> +    sink_fmt->colorspace = V4L2_COLORSPACE_SRGB;
> >>>>>>>>>>>> +    sink_fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(sink_fmt->colorspace);
> >>>>>>>>>>>> +    sink_fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(sink_fmt->colorspace);
> >>>>>>>>>>>> +    sink_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> >>>>>>>>>>>> +
> >>>>>>>>>>>>
> >>>>>>>>>>>>        src_fmt = v4l2_subdev_get_try_format(sd, cfg,
> >>>>>>>>>>>>                                             RKISP1_ISP_PAD_SOURCE_VIDEO);
> >>>>>>>>>>>>        *src_fmt = *sink_fmt;
> >>>>>>>>>>>>        src_fmt->code = RKISP1_DEF_SRC_PAD_FMT;
> >>>>>>>>>>>> -    src_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> >>>>>>>>>>>> +    src_fmt->colorspace = V4L2_COLORSPACE_SRGB;
> >>>>>>>>>>>> +    src_fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(src_fmt->colorspace);
> >>>>>>>>>>>> +    src_fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(src_fmt->colorspace);
> >>>>>>>>>>>> +    src_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
> >>>>>>>>>>>> +
> >>>>>>>>>>>>
> >>>>>>>>>>>>        src_crop = v4l2_subdev_get_try_crop(sd, cfg,
> >>>>>>>>>>>>                                            RKISP1_ISP_PAD_SOURCE_VIDEO);
> >>>>>>>>>>>> @@ -687,10 +700,17 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
> >>>>>>>>>>>>                isp->src_fmt = mbus_info;
> >>>>>>>>>>>>        src_fmt->width  = src_crop->width;
> >>>>>>>>>>>>        src_fmt->height = src_crop->height;
> >>>>>>>>>>>> -    src_fmt->quantization = format->quantization;
> >>>>>>>>>>>> -    /* full range by default */
> >>>>>>>>>>>> -    if (!src_fmt->quantization)
> >>>>>>>>>>>> +
> >>>>>>>>>>>> +    src_fmt->colorspace = V4L2_COLORSPACE_SRGB;
> >>>>>>>>>>>> +    src_fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(src_fmt->colorspace);
> >>>>>>>>>>>> +    src_fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(src_fmt->colorspace);
> >>>>>>>>>>>> +
> >>>>>>>>>>>> +    if (mbus_info->pixel_enc == V4L2_PIXEL_ENC_BAYER)
> >>>>>>>>>>>>                src_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
> >>>>>>>>>>>> +    else if (format->quantization == V4L2_QUANTIZATION_DEFAULT)
> >>>>>>>>>>>> +            src_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
> >>>>>>>>>>>> +    else
> >>>>>>>>>>>> +            src_fmt->quantization = format->quantization;
> >>>>>>>>>>>>
> >>>>>>>>>>>>        *format = *src_fmt;
> >>>>>>>>>>>>     }
> >>>>>>>>>>>> @@ -1068,6 +1088,17 @@ int rkisp1_isp_register(struct rkisp1_device *rkisp1,
> >>>>>>>>>>>>        return ret;
> >>>>>>>>>>>>     }
> >>>>>>>>>>>>
> >>>>>>>>>>>> +int rkisp1_get_isp_src_fmt(struct rkisp1_device *rkisp1,
> >>>>>>>>>>>> +                       struct v4l2_subdev_format *sd_fmt)
> >>>>>>>>>>>> +{
> >>>>>>>>>>>> +    struct rkisp1_isp *isp = &rkisp1->isp;
> >>>>>>>>>>>> +
> >>>>>>>>>>>> +    sd_fmt->which = V4L2_SUBDEV_FORMAT_ACTIVE;
> >>>>>>>>>>>> +    sd_fmt->pad = RKISP1_ISP_PAD_SOURCE_VIDEO;
> >>>>>>>>>>>> +
> >>>>>>>>>>>> +    return v4l2_subdev_call(&isp->sd, pad, get_fmt, NULL, sd_fmt);
> >>>>>>>>>>>
> >>>>>>>>>>> Do we need to get through the external API to access data that is
> >>>>>>>>>>> driver-internal anyway?
> >>>>>>>>>>>
> >>>>>>>>>>>> +}
> >>>>>>>>>>>> +
> >>>>>>>>>>>>     void rkisp1_isp_unregister(struct rkisp1_device *rkisp1)
> >>>>>>>>>>>>     {
> >>>>>>>>>>>>        struct v4l2_subdev *sd = &rkisp1->isp.sd;
> >>>>>>>>>>>> diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> >>>>>>>>>>>> index 7b6b7ddd4169..8705b133de68 100644
> >>>>>>>>>>>> --- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
> >>>>>>>>>>>> +++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> >>>>>>>>>>>> @@ -525,6 +525,7 @@ static void rkisp1_rsz_set_sink_fmt(struct rkisp1_resizer *rsz,
> >>>>>>>>>>>>        const struct rkisp1_isp_mbus_info *mbus_info;
> >>>>>>>>>>>>        struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
> >>>>>>>>>>>>        struct v4l2_rect *sink_crop;
> >>>>>>>>>>>> +    struct v4l2_subdev_format isp_sd_fmt;
> >>>>>>>>>>>>
> >>>>>>>>>>>>        sink_fmt = rkisp1_rsz_get_pad_fmt(rsz, cfg, RKISP1_RSZ_PAD_SINK, which);
> >>>>>>>>>>>>        src_fmt = rkisp1_rsz_get_pad_fmt(rsz, cfg, RKISP1_RSZ_PAD_SRC, which);
> >>>>>>>>>>>> @@ -539,8 +540,20 @@ static void rkisp1_rsz_set_sink_fmt(struct rkisp1_resizer *rsz,
> >>>>>>>>>>>>        if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
> >>>>>>>>>>>>                rsz->pixel_enc = mbus_info->pixel_enc;
> >>>>>>>>>>>>
> >>>>>>>>>>>> +    rkisp1_get_isp_src_fmt(rsz->rkisp1, &isp_sd_fmt);
> >>>>>>>>>>>> +
> >>>>>>>>>>>
> >>>>>>>>>>> Is this necessary? My understanding was that in the subdev model, it was
> >>>>>>>>>>> the userspace responsibility to propagate any configuration changes through
> >>>>>>>>>>> the graph.
> >>>>>>>>>>>
> >>>>>>>>>>> Also, doing this only here wouldn't fully maintain the
> >>>>>>>>>>> consistency of the state. For example, if one sets the ISP subdev format
> >>>>>>>>>>> first, then the resizer subdev and then the ISP subdev again, wouldn't the
> >>>>>>>>>>> resizer subdev end up with a wrong format?
> >>>>>>>>>>
> >>>>>>>>>> yes, this is indeed a bug, I am preparing v4 now.
> >>>>>>>>>> What I thought to do is adding quantization conversion
> >>>>>>>>>> support also on ther resizer and capture entities.
> >>>>>>>>>> Then in the 'link_validation' callbacks, there
> >>>>>>>>>> is a validation that the quantization fields matches.
> >>>>>>>>>
> >>>>>>>>> My understanding is that, if we have the following topology
> >>>>>>>>>
> >>>>>>>>> [ ISP ] -> [ Resizer ] -> [ Video node ]
> >>>>>>>>>
> >>>>>>>>> then the ISP source pad would have the csc capability, while resizer
> >>>>>>>>> and video node would just accept whatever is configured on their sink
> >>>>>>>>> pads (no need for csc capability for that) and propagate that to their
> >>>>>>>>> outputs, i.e. resizer source pad and video node CAPTURE format.
> >>>>>>>>>
> >>>>>>>>> Is this what you were going to implement?
> >>>>>>> Hi, I sent a v4 where the CSC capability is set on the reiszer and capture as well.
> >>>>>>> I can send a v5 implementing it the way you suggest. Currently the doc says that the colorspace fields
> >>>>>>> must be set by the driver for capture streams. This implies that userspace can set it
> >>>>>>> only if the CSC is supported.
> >>>>>>
> >>>>>> Why would the userspace have to set it for the capture stream on the
> >>>>>> resizer and video nodes? Couldn't the userspace set it to DEFAULT and
> >>>>>> then the driver override to whatever it received on the corresponding
> >>>>>> sink?
> >>>
> >>> According to the documentation [1]:
> >>>
> >>> "the default quantization encoding as defined by the colorspace"
> >>>
> >>> Then, for instance, the default for V4L2_COLORSPACE_SRGB is limited range [2].
> >>>
> >>> Unless we change the definition of DEFAULT to let it accept whatever it receives on the corresponding sink.
> >>>
> >>> Then the way I understand is:
> >>>
> >>> [sensor]->[isp]->[resizer]->[capture]
> >>>
> >>> Userspace should set quantization on:
> >>> * sensor source pad
> >>> * isp sink pad
> >>> * resizer sink pad
> >>> * capture node
> >>>
> >>> The remaining source pads would get values propagated from their sink pads.
> >>>
> >>> [1] https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/colorspaces-defs.html#c.v4l2_quantization
> >>> [2] https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/colorspaces-details.html#col-srgb
> >>
> >> After discussing this offline, we concluded that:
> >> - only the source pad of the ISP entity should expose the CSC capability,
> >> - the CAPTURE video node should expose only the formats/color spaces
> >> compatible with the current setting of the resizer source,
> >> - consistency between the resizer source format and CAPTURE format
> >> should be implicitly maintained by the driver.
> >
> > Do you mean it should be validated at streamon time ?
> 
> Nope. Any V4L2 state must be kept valid all the time, as mandated by
> the general V4L2 principles. Wrong configuration of the video node
> must not be a reason for STREAMON failing.

That's a wrong interpretation of V4L2. On a video-node-centric device (a
device that doesn't use the subdev userspace API for configuration) this
is correct. In a MC-centric device, the video node and its connected
subdev are configured separately.

> > In MC-based
> > drivers, entities are isolated from each other from a configuration
> > point of view, and the validity of the configuration across the whole
> > pipeline is checked at streamon time. I don't think CSC parameters
> > should be treated differently than formats in this regard.
> 
> Indeed, the ISP entity and the resizer entity are isolated from each
> other and they need to be validated separately. However, the resizer
> entity is not isolated from the video node, as there is no
> configuration exposed for the video node in the MC API. If MC exposed
> an explicit format control for the video interface sink pad, then the
> resizer would have to be validated separately indeed, but still that
> video interface sink pad would be tied to the rest of the
> configuration of the video node (e.g. the CAPTURE format).
> 
> >> Below is the rationale for that:
> >> - In the MC model, the video node represents the DMA alone (and thus
> >> the reason to have the resizer entities at all) and since the
> >> colorspace is not a property of the DMA, it doesn't belong there.
> >> - Even if we put that aside, both MP and SP can only output the same
> >> colorspace, which would create a dependency between the configuration
> >> of the two video nodes, which is not something well defined by V4L2.
> >> - A video interface in the MC API doesn't expose control over its
> >> input format, which means that the relation between the other side of
> >> the link (resizer source) and the video node is implicit and needs to
> >> be handled internally in the driver.
> >> - V4L2, as opposed to MC, requires that the current state is always
> >> consistent and valid. In this case it means that an ioctl on the video
> >> node must not be able to alter the state in a way that would make it
> >> inconsistent with the state of the matching resizer source.

-- 
Regards,

Laurent Pinchart
