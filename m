Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB23520D74D
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2020 22:07:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732271AbgF2T2k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jun 2020 15:28:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732678AbgF2T1m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jun 2020 15:27:42 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08F18C0307A8
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2020 08:50:18 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 3B9242A0D6B
Subject: Re: [RFC v3 2/2] media: staging: rkisp1: allow quantization
 conversion from userspace for isp source pad
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Dafna Hirschfeld <dafna3@gmail.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20200604175443.GB76282@chromium.org>
 <87f11ebf-aecf-7eee-f18c-98dd4e8d692b@collabora.com>
 <CAAFQd5BPOUFsKb0Qa_6QiytE6=OM3jjSVWyoikdgyNvr4vu0fw@mail.gmail.com>
 <CAAFQd5DoUu+bMO1GeSX0qbsW5u-KDmRvtO2kfGePghrv59bQmw@mail.gmail.com>
 <62611ccd-e4cd-728a-355b-532661b36be0@collabora.com>
 <20200618184923.GB68039@chromium.org>
 <a163dbb3-8278-684e-6324-4c36924ed335@collabora.com>
 <20200618192535.GD73379@chromium.org>
 <67cdd3be-ee2a-3b88-5d17-d9d1d17b2603@collabora.com>
 <CAAFQd5Bkh1QphjQtMyWQeN7wtK93YN2PeU-bKkUFh46PQ=ujLw@mail.gmail.com>
 <20200628131537.GT6954@pendragon.ideasonboard.com>
 <CAAFQd5BDXJVZ1UNvbLwccFnTOoQ_U7MdZhQNNzQSZtn9ne40cA@mail.gmail.com>
 <848a7c75-7d63-7763-cbd2-84833f85cec8@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <aed7c3a2-2a35-17f0-f06b-4ef2e5232415@collabora.com>
Date:   Mon, 29 Jun 2020 12:50:06 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <848a7c75-7d63-7763-cbd2-84833f85cec8@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Dafna, Laurent and Tomasz,

On 6/28/20 4:34 PM, Dafna Hirschfeld wrote:
> 
> 
> On 28.06.20 16:59, Tomasz Figa wrote:
>> On Sun, Jun 28, 2020 at 3:15 PM Laurent Pinchart
>> <laurent.pinchart@ideasonboard.com> wrote:
>>>
>>> Hi Tomasz,
>>>
>>> On Sun, Jun 28, 2020 at 03:10:41PM +0200, Tomasz Figa wrote:
>>>> On Fri, Jun 26, 2020 at 2:15 AM Helen Koike <helen.koike@collabora.com> wrote:
>>>>> On 6/18/20 4:25 PM, Tomasz Figa wrote:
>>>>>> On Thu, Jun 18, 2020 at 08:54:34PM +0200, Dafna Hirschfeld wrote:
>>>>>>> On 18.06.20 20:49, Tomasz Figa wrote:
>>>>>>>> On Thu, Jun 18, 2020 at 08:26:33PM +0200, Dafna Hirschfeld wrote:
>>>>>>>>> On 18.06.20 19:27, Tomasz Figa wrote:
>>>>>>>>>> On Wed, Jun 10, 2020 at 2:08 PM Tomasz Figa wrote:
>>>>>>>>>>> On Thu, Jun 4, 2020 at 9:11 PM Dafna Hirschfeld wrote:
>>>>>>>>>>>> On 04.06.20 19:54, Tomasz Figa wrote:
>>>>>>>>>>>>> On Thu, Apr 16, 2020 at 04:56:05PM +0200, Dafna Hirschfeld wrote:
>>>>>>>>>>>>>> The isp entity has a hardware support to force full range quantization
>>>>>>>>>>>>>> for YUV formats. Use the new API to indicate userspace that
>>>>>>>>>>>>>> quantization conversion is supported by adding the flag
>>>>>>>>>>>>>> V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION during media code enumeration.
>>>>>>>>>>>>>> Then uppon s_fmt on the video source pad, we assign the
>>>>>>>>>>>>>> quantization from userspace for YUV formats.
>>>>>>>>>>>>>> Also in the capture and resizer entities we retrieve the colorspace
>>>>>>>>>>>>>> from the isp entity.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>      drivers/staging/media/rkisp1/rkisp1-capture.c | 28 ++++++-------
>>>>>>>>>>>>>>      drivers/staging/media/rkisp1/rkisp1-common.h  |  2 +
>>>>>>>>>>>>>>      drivers/staging/media/rkisp1/rkisp1-isp.c     | 39 +++++++++++++++++--
>>>>>>>>>>>>>>      drivers/staging/media/rkisp1/rkisp1-resizer.c | 13 +++++++
>>>>>>>>>>>>>>      4 files changed, 65 insertions(+), 17 deletions(-)
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
>>>>>>>>>>>>>> index fbf62399fe3d..aca0f93bc772 100644
>>>>>>>>>>>>>> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
>>>>>>>>>>>>>> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
>>>>>>>>>>>>>> @@ -1066,14 +1066,13 @@ static void rkisp1_try_fmt(const struct rkisp1_capture *cap,
>>>>>>>>>>>>>>                            const struct v4l2_format_info **fmt_info)
>>>>>>>>>>>>>>      {
>>>>>>>>>>>>>>         const struct rkisp1_capture_config *config = cap->config;
>>>>>>>>>>>>>> -    struct rkisp1_capture *other_cap =
>>>>>>>>>>>>>> -                    &cap->rkisp1->capture_devs[cap->id ^ 1];
>>>>>>>>>>>>>>         const struct rkisp1_capture_fmt_cfg *fmt;
>>>>>>>>>>>>>>         const struct v4l2_format_info *info;
>>>>>>>>>>>>>>         const unsigned int max_widths[] = { RKISP1_RSZ_MP_SRC_MAX_WIDTH,
>>>>>>>>>>>>>>                                             RKISP1_RSZ_SP_SRC_MAX_WIDTH };
>>>>>>>>>>>>>>         const unsigned int max_heights[] = { RKISP1_RSZ_MP_SRC_MAX_HEIGHT,
>>>>>>>>>>>>>>                                              RKISP1_RSZ_SP_SRC_MAX_HEIGHT};
>>>>>>>>>>>>>> +    struct v4l2_subdev_format isp_sd_fmt;
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>         fmt = rkisp1_find_fmt_cfg(cap, pixm->pixelformat);
>>>>>>>>>>>>>>         if (!fmt) {
>>>>>>>>>>>>>> @@ -1081,24 +1080,27 @@ static void rkisp1_try_fmt(const struct rkisp1_capture *cap,
>>>>>>>>>>>>>>                 pixm->pixelformat = fmt->fourcc;
>>>>>>>>>>>>>>         }
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> +    rkisp1_get_isp_src_fmt(cap->rkisp1, &isp_sd_fmt);
>>>>>>>>>>>>>> +    pixm->field = isp_sd_fmt.format.field;
>>>>>>>>>>>>>> +    pixm->colorspace = isp_sd_fmt.format.colorspace;
>>>>>>>>>>>>>> +    pixm->ycbcr_enc = isp_sd_fmt.format.ycbcr_enc;
>>>>>>>>>>>>>> +    pixm->xfer_func = isp_sd_fmt.format.xfer_func;
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>> +    /*
>>>>>>>>>>>>>> +     * isp has a feature to set full range quantization for yuv formats.
>>>>>>>>>>>>>
>>>>>>>>>>>>> How about "select between limited and full range for YUV formats"?
>>>>>>>>>>>>>
>>>>>>>>>>>>>> +     * so we need to get the format from the isp.
>>>>>>>>>>>>>> +     */
>>>>>>>>>>>>>> +    pixm->quantization = isp_sd_fmt.format.quantization;
>>>>>>>>>>>>>> +    if (!v4l2_is_format_yuv(cap->pix.info))
>>>>>>>>>>>>>> +            pixm->quantization = V4L2_QUANTIZATION_FULL_RANGE;
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>         pixm->width = clamp_t(u32, pixm->width,
>>>>>>>>>>>>>>                               RKISP1_RSZ_SRC_MIN_WIDTH, max_widths[cap->id]);
>>>>>>>>>>>>>>         pixm->height = clamp_t(u32, pixm->height,
>>>>>>>>>>>>>>                                RKISP1_RSZ_SRC_MIN_HEIGHT, max_heights[cap->id]);
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> -    pixm->field = V4L2_FIELD_NONE;
>>>>>>>>>>>>>> -    pixm->colorspace = V4L2_COLORSPACE_DEFAULT;
>>>>>>>>>>>>>> -    pixm->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
>>>>>>>>>>>>>> -
>>>>>>>>>>>>>>         info = rkisp1_fill_pixfmt(pixm, cap->id);
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> -    /* can not change quantization when stream-on */
>>>>>>>>>>>>>> -    if (other_cap->is_streaming)
>>>>>>>>>>>>>> -            pixm->quantization = other_cap->pix.fmt.quantization;
>>>>>>>>>>>>>> -    /* output full range by default, take effect in params */
>>>>>>>>>>>>>> -    else if (!pixm->quantization ||
>>>>>>>>>>>>>> -             pixm->quantization > V4L2_QUANTIZATION_LIM_RANGE)
>>>>>>>>>>>>>> -            pixm->quantization = V4L2_QUANTIZATION_FULL_RANGE;
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>         if (fmt_cfg)
>>>>>>>>>>>>>>                 *fmt_cfg = fmt;
>>>>>>>>>>>>>> diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
>>>>>>>>>>>>>> index 2d7b7e078636..7a5576fa14c9 100644
>>>>>>>>>>>>>> --- a/drivers/staging/media/rkisp1/rkisp1-common.h
>>>>>>>>>>>>>> +++ b/drivers/staging/media/rkisp1/rkisp1-common.h
>>>>>>>>>>>>>> @@ -300,6 +300,8 @@ int rkisp1_isp_register(struct rkisp1_device *rkisp1,
>>>>>>>>>>>>>>                         struct v4l2_device *v4l2_dev);
>>>>>>>>>>>>>>      void rkisp1_isp_unregister(struct rkisp1_device *rkisp1);
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> +int rkisp1_get_isp_src_fmt(struct rkisp1_device *rkisp1,
>>>>>>>>>>>>>> +                       struct v4l2_subdev_format *sd_fmt);
>>>>>>>>>>>>>>      const struct rkisp1_isp_mbus_info *rkisp1_isp_mbus_info_get(u32 mbus_code);
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>      irqreturn_t rkisp1_isp_isr(struct rkisp1_device *rkisp1);
>>>>>>>>>>>>>> diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
>>>>>>>>>>>>>> index dee8e96f3900..6fdf5ed0b6b1 100644
>>>>>>>>>>>>>> --- a/drivers/staging/media/rkisp1/rkisp1-isp.c
>>>>>>>>>>>>>> +++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
>>>>>>>>>>>>>> @@ -613,6 +613,10 @@ static int rkisp1_isp_enum_mbus_code(struct v4l2_subdev *sd,
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>                 if (code->index == pos - 1) {
>>>>>>>>>>>>>>                         code->code = fmt->mbus_code;
>>>>>>>>>>>>>> +                    if (fmt->pixel_enc == V4L2_PIXEL_ENC_YUV &&
>>>>>>>>>>>>>> +                        dir == RKISP1_DIR_SRC)
>>>>>>>>>>>>>> +                            code->flags =
>>>>>>>>>>>>>> +                                    V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION;
>>>>>>>>>>>>>>                         return 0;
>>>>>>>>>>>>>>                 }
>>>>>>>>>>>>>>         }
>>>>>>>>>>>>>> @@ -639,12 +643,21 @@ static int rkisp1_isp_init_config(struct v4l2_subdev *sd,
>>>>>>>>>>>>>>         sink_crop->height = RKISP1_DEFAULT_HEIGHT;
>>>>>>>>>>>>>>         sink_crop->left = 0;
>>>>>>>>>>>>>>         sink_crop->top = 0;
>>>>>>>>>>>>>> +    sink_fmt->colorspace = V4L2_COLORSPACE_SRGB;
>>>>>>>>>>>>>> +    sink_fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(sink_fmt->colorspace);
>>>>>>>>>>>>>> +    sink_fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(sink_fmt->colorspace);
>>>>>>>>>>>>>> +    sink_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>         src_fmt = v4l2_subdev_get_try_format(sd, cfg,
>>>>>>>>>>>>>>                                              RKISP1_ISP_PAD_SOURCE_VIDEO);
>>>>>>>>>>>>>>         *src_fmt = *sink_fmt;
>>>>>>>>>>>>>>         src_fmt->code = RKISP1_DEF_SRC_PAD_FMT;
>>>>>>>>>>>>>> -    src_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
>>>>>>>>>>>>>> +    src_fmt->colorspace = V4L2_COLORSPACE_SRGB;
>>>>>>>>>>>>>> +    src_fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(src_fmt->colorspace);
>>>>>>>>>>>>>> +    src_fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(src_fmt->colorspace);
>>>>>>>>>>>>>> +    src_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>         src_crop = v4l2_subdev_get_try_crop(sd, cfg,
>>>>>>>>>>>>>>                                             RKISP1_ISP_PAD_SOURCE_VIDEO);
>>>>>>>>>>>>>> @@ -687,10 +700,17 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
>>>>>>>>>>>>>>                 isp->src_fmt = mbus_info;
>>>>>>>>>>>>>>         src_fmt->width  = src_crop->width;
>>>>>>>>>>>>>>         src_fmt->height = src_crop->height;
>>>>>>>>>>>>>> -    src_fmt->quantization = format->quantization;
>>>>>>>>>>>>>> -    /* full range by default */
>>>>>>>>>>>>>> -    if (!src_fmt->quantization)
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>> +    src_fmt->colorspace = V4L2_COLORSPACE_SRGB;
>>>>>>>>>>>>>> +    src_fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(src_fmt->colorspace);
>>>>>>>>>>>>>> +    src_fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(src_fmt->colorspace);
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>> +    if (mbus_info->pixel_enc == V4L2_PIXEL_ENC_BAYER)
>>>>>>>>>>>>>>                 src_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
>>>>>>>>>>>>>> +    else if (format->quantization == V4L2_QUANTIZATION_DEFAULT)
>>>>>>>>>>>>>> +            src_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
>>>>>>>>>>>>>> +    else
>>>>>>>>>>>>>> +            src_fmt->quantization = format->quantization;
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>         *format = *src_fmt;
>>>>>>>>>>>>>>      }
>>>>>>>>>>>>>> @@ -1068,6 +1088,17 @@ int rkisp1_isp_register(struct rkisp1_device *rkisp1,
>>>>>>>>>>>>>>         return ret;
>>>>>>>>>>>>>>      }
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> +int rkisp1_get_isp_src_fmt(struct rkisp1_device *rkisp1,
>>>>>>>>>>>>>> +                       struct v4l2_subdev_format *sd_fmt)
>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>> +    struct rkisp1_isp *isp = &rkisp1->isp;
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>> +    sd_fmt->which = V4L2_SUBDEV_FORMAT_ACTIVE;
>>>>>>>>>>>>>> +    sd_fmt->pad = RKISP1_ISP_PAD_SOURCE_VIDEO;
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>> +    return v4l2_subdev_call(&isp->sd, pad, get_fmt, NULL, sd_fmt);
>>>>>>>>>>>>>
>>>>>>>>>>>>> Do we need to get through the external API to access data that is
>>>>>>>>>>>>> driver-internal anyway?
>>>>>>>>>>>>>
>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>      void rkisp1_isp_unregister(struct rkisp1_device *rkisp1)
>>>>>>>>>>>>>>      {
>>>>>>>>>>>>>>         struct v4l2_subdev *sd = &rkisp1->isp.sd;
>>>>>>>>>>>>>> diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
>>>>>>>>>>>>>> index 7b6b7ddd4169..8705b133de68 100644
>>>>>>>>>>>>>> --- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
>>>>>>>>>>>>>> +++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
>>>>>>>>>>>>>> @@ -525,6 +525,7 @@ static void rkisp1_rsz_set_sink_fmt(struct rkisp1_resizer *rsz,
>>>>>>>>>>>>>>         const struct rkisp1_isp_mbus_info *mbus_info;
>>>>>>>>>>>>>>         struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
>>>>>>>>>>>>>>         struct v4l2_rect *sink_crop;
>>>>>>>>>>>>>> +    struct v4l2_subdev_format isp_sd_fmt;
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>         sink_fmt = rkisp1_rsz_get_pad_fmt(rsz, cfg, RKISP1_RSZ_PAD_SINK, which);
>>>>>>>>>>>>>>         src_fmt = rkisp1_rsz_get_pad_fmt(rsz, cfg, RKISP1_RSZ_PAD_SRC, which);
>>>>>>>>>>>>>> @@ -539,8 +540,20 @@ static void rkisp1_rsz_set_sink_fmt(struct rkisp1_resizer *rsz,
>>>>>>>>>>>>>>         if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
>>>>>>>>>>>>>>                 rsz->pixel_enc = mbus_info->pixel_enc;
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> +    rkisp1_get_isp_src_fmt(rsz->rkisp1, &isp_sd_fmt);
>>>>>>>>>>>>>> +
>>>>>>>>>>>>>
>>>>>>>>>>>>> Is this necessary? My understanding was that in the subdev model, it was
>>>>>>>>>>>>> the userspace responsibility to propagate any configuration changes through
>>>>>>>>>>>>> the graph.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Also, doing this only here wouldn't fully maintain the
>>>>>>>>>>>>> consistency of the state. For example, if one sets the ISP subdev format
>>>>>>>>>>>>> first, then the resizer subdev and then the ISP subdev again, wouldn't the
>>>>>>>>>>>>> resizer subdev end up with a wrong format?
>>>>>>>>>>>>
>>>>>>>>>>>> yes, this is indeed a bug, I am preparing v4 now.
>>>>>>>>>>>> What I thought to do is adding quantization conversion
>>>>>>>>>>>> support also on ther resizer and capture entities.
>>>>>>>>>>>> Then in the 'link_validation' callbacks, there
>>>>>>>>>>>> is a validation that the quantization fields matches.
>>>>>>>>>>>
>>>>>>>>>>> My understanding is that, if we have the following topology
>>>>>>>>>>>
>>>>>>>>>>> [ ISP ] -> [ Resizer ] -> [ Video node ]
>>>>>>>>>>>
>>>>>>>>>>> then the ISP source pad would have the csc capability, while resizer
>>>>>>>>>>> and video node would just accept whatever is configured on their sink
>>>>>>>>>>> pads (no need for csc capability for that) and propagate that to their
>>>>>>>>>>> outputs, i.e. resizer source pad and video node CAPTURE format.
>>>>>>>>>>>
>>>>>>>>>>> Is this what you were going to implement?
>>>>>>>>> Hi, I sent a v4 where the CSC capability is set on the reiszer and capture as well.
>>>>>>>>> I can send a v5 implementing it the way you suggest. Currently the doc says that the colorspace fields
>>>>>>>>> must be set by the driver for capture streams. This implies that userspace can set it
>>>>>>>>> only if the CSC is supported.
>>>>>>>>
>>>>>>>> Why would the userspace have to set it for the capture stream on the
>>>>>>>> resizer and video nodes? Couldn't the userspace set it to DEFAULT and
>>>>>>>> then the driver override to whatever it received on the corresponding
>>>>>>>> sink?
>>>>>
>>>>> According to the documentation [1]:
>>>>>
>>>>> "the default quantization encoding as defined by the colorspace"
>>>>>
>>>>> Then, for instance, the default for V4L2_COLORSPACE_SRGB is limited range [2].
>>>>>
>>>>> Unless we change the definition of DEFAULT to let it accept whatever it receives on the corresponding sink.
>>>>>
>>>>> Then the way I understand is:
>>>>>
>>>>> [sensor]->[isp]->[resizer]->[capture]
>>>>>
>>>>> Userspace should set quantization on:
>>>>> * sensor source pad
>>>>> * isp sink pad
>>>>> * resizer sink pad
>>>>> * capture node
>>>>>
>>>>> The remaining source pads would get values propagated from their sink pads.
>>>>>
>>>>> [1] https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/colorspaces-defs.html#c.v4l2_quantization
>>>>> [2] https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/colorspaces-details.html#col-srgb
>>>>
>>>> After discussing this offline, we concluded that:
>>>> - only the source pad of the ISP entity should expose the CSC capability,
>>>> - the CAPTURE video node should expose only the formats/color spaces
>>>> compatible with the current setting of the resizer source,
>>>> - consistency between the resizer source format and CAPTURE format
>>>> should be implicitly maintained by the driver.
>>>
>>> Do you mean it should be validated at streamon time ?
>>
>> Nope. Any V4L2 state must be kept valid all the time, as mandated by
>> the general V4L2 principles. Wrong configuration of the video node
>> must not be a reason for STREAMON failing.
>>
>>> In MC-based
>>> drivers, entities are isolated from each other from a configuration
>>> point of view, and the validity of the configuration across the whole
>>> pipeline is checked at streamon time. I don't think CSC parameters
>>> should be treated differently than formats in this regard.
>>
>> Indeed, the ISP entity and the resizer entity are isolated from each
>> other and they need to be validated separately. However, the resizer
>> entity is not isolated from the video node, as there is no
>> configuration exposed for the video node in the MC API. If MC exposed
>> an explicit format control for the video interface sink pad, then the
>> resizer would have to be validated separately indeed, but still that
>> video interface sink pad would be tied to the rest of the
>> configuration of the video node (e.g. the CAPTURE format).
> 
> Two questions:
> 
> The validation callback between the resizer and the isp has to include check
> that the quantization values matches ?


To sumarize:

The current quantization fields from VIDIOC_SUBDEV_{S,G}_FMT and VIDEO_{SET,GET}_FORMAT
are filled by the driver (read-only by userspace).

This RFC exposes an API that allows the quantization to be a read-write configuration.
The question is where we expose the read-write capability.

We have two main design choices here.

1) Expose read-write quantization in all pads and video nodes.
And userspace must set matching quantization in all of them.
Which makes userspace more complicated, but userspace already needs to configure
the whole topology anyway.
This wouldn't make much sense in video nodes for metadata (params and statistics)

In this options, the validation callback should check for matching quantizations
between all links, and it would failed on STREAMON if formats don't match.

2-A) Expose read-write quantization only on the isp source pad.
The others pads and video nodes would be keept read-only.
Which means that changing quantization on a read-write node, will implicitly
change the values on the read-only nodes.
Which maybe not be a problem, since current API (read-only) already says this field
is filled by the driver.

In this options, the validation callback doesn't need to check for matching quantizations
between links.

2-A) Expose read-write quantization only on the video node
This is basically the same as 2-A, but userspace could interpret that we
could have different quantizations in each video node.


I'd like to hear from others what would be better here, design choice 1 or 2.


> Userspace have to configure the quantizaion on the resizer sink pad without that CSC
> API beeing expose on it?

In the current API, the quantization field is read-only, so to allow userspace to configure
quantization in any pad, the CSC API needs to be exposed on the pad to make it read-write.


Regards,
Helen

> 
> 
> Thanks,
> Dafna
>  
>>
>> Best regards,
>> Tomasz
>>
>>>
>>>> Below is the rationale for that:
>>>> - In the MC model, the video node represents the DMA alone (and thus
>>>> the reason to have the resizer entities at all) and since the
>>>> colorspace is not a property of the DMA, it doesn't belong there.
>>>> - Even if we put that aside, both MP and SP can only output the same
>>>> colorspace, which would create a dependency between the configuration
>>>> of the two video nodes, which is not something well defined by V4L2.
>>>> - A video interface in the MC API doesn't expose control over its
>>>> input format, which means that the relation between the other side of
>>>> the link (resizer source) and the video node is implicit and needs to
>>>> be handled internally in the driver.
>>>> - V4L2, as opposed to MC, requires that the current state is always
>>>> consistent and valid. In this case it means that an ioctl on the video
>>>> node must not be able to alter the state in a way that would make it
>>>> inconsistent with the state of the matching resizer source.
>>>
>>> -- 
>>> Regards,
>>>
>>> Laurent Pinchart
