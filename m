Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CF9824067F
	for <lists+linux-media@lfdr.de>; Mon, 10 Aug 2020 15:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726723AbgHJNPb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Aug 2020 09:15:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726330AbgHJNPa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Aug 2020 09:15:30 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FABCC061756
        for <linux-media@vger.kernel.org>; Mon, 10 Aug 2020 06:15:30 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 34E6B2935BE
Subject: Re: [RFC v3 2/2] media: staging: rkisp1: allow quantization
 conversion from userspace for isp source pad
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Dafna Hirschfeld <dafna3@gmail.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <a163dbb3-8278-684e-6324-4c36924ed335@collabora.com>
 <20200618192535.GD73379@chromium.org>
 <67cdd3be-ee2a-3b88-5d17-d9d1d17b2603@collabora.com>
 <CAAFQd5Bkh1QphjQtMyWQeN7wtK93YN2PeU-bKkUFh46PQ=ujLw@mail.gmail.com>
 <20200628131537.GT6954@pendragon.ideasonboard.com>
 <CAAFQd5BDXJVZ1UNvbLwccFnTOoQ_U7MdZhQNNzQSZtn9ne40cA@mail.gmail.com>
 <848a7c75-7d63-7763-cbd2-84833f85cec8@collabora.com>
 <aed7c3a2-2a35-17f0-f06b-4ef2e5232415@collabora.com>
 <20200629230806.GE21452@pendragon.ideasonboard.com>
 <b1dabda6-06b2-5c7d-be43-cfb40f439591@collabora.com>
 <20200701125212.GB27013@pendragon.ideasonboard.com>
 <6b23a99a-27b9-f61e-68e3-80eacd61580f@collabora.com>
Message-ID: <76f86df3-fb7c-5429-a86f-c43ec3229f6f@collabora.com>
Date:   Mon, 10 Aug 2020 15:15:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6b23a99a-27b9-f61e-68e3-80eacd61580f@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 10.08.20 um 14:33 schrieb Dafna Hirschfeld:
> hi
> 
> Am 01.07.20 um 14:52 schrieb Laurent Pinchart:
>> Hi Dafna,
>>
>> On Tue, Jun 30, 2020 at 11:36:35AM +0200, Dafna Hirschfeld wrote:
>>> On 30.06.20 01:08, Laurent Pinchart wrote:
>>>> On Mon, Jun 29, 2020 at 12:50:06PM -0300, Helen Koike wrote:
>>>>> On 6/28/20 4:34 PM, Dafna Hirschfeld wrote:
>>>>>> On 28.06.20 16:59, Tomasz Figa wrote:
>>>>>>> On Sun, Jun 28, 2020 at 3:15 PM Laurent Pinchart wrote:
>>>>>>>> On Sun, Jun 28, 2020 at 03:10:41PM +0200, Tomasz Figa wrote:
>>>>>>>>> On Fri, Jun 26, 2020 at 2:15 AM Helen Koike <helen.koike@collabora.com> wrote:
>>>>>>>>>> On 6/18/20 4:25 PM, Tomasz Figa wrote:
>>>>>>>>>>> On Thu, Jun 18, 2020 at 08:54:34PM +0200, Dafna Hirschfeld wrote:
>>>>>>>>>>>> On 18.06.20 20:49, Tomasz Figa wrote:
>>>>>>>>>>>>> On Thu, Jun 18, 2020 at 08:26:33PM +0200, Dafna Hirschfeld wrote:
>>>>>>>>>>>>>> On 18.06.20 19:27, Tomasz Figa wrote:
>>>>>>>>>>>>>>> On Wed, Jun 10, 2020 at 2:08 PM Tomasz Figa wrote:
>>>>>>>>>>>>>>>> On Thu, Jun 4, 2020 at 9:11 PM Dafna Hirschfeld wrote:
>>>>>>>>>>>>>>>>> On 04.06.20 19:54, Tomasz Figa wrote:
>>>>>>>>>>>>>>>>>> On Thu, Apr 16, 2020 at 04:56:05PM +0200, Dafna Hirschfeld wrote:
>>>>>>>>>>>>>>>>>>> The isp entity has a hardware support to force full range quantization
>>>>>>>>>>>>>>>>>>> for YUV formats. Use the new API to indicate userspace that
>>>>>>>>>>>>>>>>>>> quantization conversion is supported by adding the flag
>>>>>>>>>>>>>>>>>>> V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION during media code enumeration.
>>>>>>>>>>>>>>>>>>> Then uppon s_fmt on the video source pad, we assign the
>>>>>>>>>>>>>>>>>>> quantization from userspace for YUV formats.
>>>>>>>>>>>>>>>>>>> Also in the capture and resizer entities we retrieve the colorspace
>>>>>>>>>>>>>>>>>>> from the isp entity.
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>>>>>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>>>>>>        drivers/staging/media/rkisp1/rkisp1-capture.c | 28 ++++++-------
>>>>>>>>>>>>>>>>>>>        drivers/staging/media/rkisp1/rkisp1-common.h  |  2 +
>>>>>>>>>>>>>>>>>>>        drivers/staging/media/rkisp1/rkisp1-isp.c     | 39 +++++++++++++++++--
>>>>>>>>>>>>>>>>>>>        drivers/staging/media/rkisp1/rkisp1-resizer.c | 13 +++++++
>>>>>>>>>>>>>>>>>>>        4 files changed, 65 insertions(+), 17 deletions(-)
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
>>>>>>>>>>>>>>>>>>> index fbf62399fe3d..aca0f93bc772 100644
>>>>>>>>>>>>>>>>>>> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
>>>>>>>>>>>>>>>>>>> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
>>>>>>>>>>>>>>>>>>> @@ -1066,14 +1066,13 @@ static void rkisp1_try_fmt(const struct rkisp1_capture *cap,
>>>>>>>>>>>>>>>>>>>                              const struct v4l2_format_info **fmt_info)
>>>>>>>>>>>>>>>>>>>        {
>>>>>>>>>>>>>>>>>>>           const struct rkisp1_capture_config *config = cap->config;
>>>>>>>>>>>>>>>>>>> -    struct rkisp1_capture *other_cap =
>>>>>>>>>>>>>>>>>>> -                    &cap->rkisp1->capture_devs[cap->id ^ 1];
>>>>>>>>>>>>>>>>>>>           const struct rkisp1_capture_fmt_cfg *fmt;
>>>>>>>>>>>>>>>>>>>           const struct v4l2_format_info *info;
>>>>>>>>>>>>>>>>>>>           const unsigned int max_widths[] = { RKISP1_RSZ_MP_SRC_MAX_WIDTH,
>>>>>>>>>>>>>>>>>>>                                               RKISP1_RSZ_SP_SRC_MAX_WIDTH };
>>>>>>>>>>>>>>>>>>>           const unsigned int max_heights[] = { RKISP1_RSZ_MP_SRC_MAX_HEIGHT,
>>>>>>>>>>>>>>>>>>>                                                RKISP1_RSZ_SP_SRC_MAX_HEIGHT};
>>>>>>>>>>>>>>>>>>> +    struct v4l2_subdev_format isp_sd_fmt;
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>           fmt = rkisp1_find_fmt_cfg(cap, pixm->pixelformat);
>>>>>>>>>>>>>>>>>>>           if (!fmt) {
>>>>>>>>>>>>>>>>>>> @@ -1081,24 +1080,27 @@ static void rkisp1_try_fmt(const struct rkisp1_capture *cap,
>>>>>>>>>>>>>>>>>>>                   pixm->pixelformat = fmt->fourcc;
>>>>>>>>>>>>>>>>>>>           }
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> +    rkisp1_get_isp_src_fmt(cap->rkisp1, &isp_sd_fmt);
>>>>>>>>>>>>>>>>>>> +    pixm->field = isp_sd_fmt.format.field;
>>>>>>>>>>>>>>>>>>> +    pixm->colorspace = isp_sd_fmt.format.colorspace;
>>>>>>>>>>>>>>>>>>> +    pixm->ycbcr_enc = isp_sd_fmt.format.ycbcr_enc;
>>>>>>>>>>>>>>>>>>> +    pixm->xfer_func = isp_sd_fmt.format.xfer_func;
>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>> +    /*
>>>>>>>>>>>>>>>>>>> +     * isp has a feature to set full range quantization for yuv formats.
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> How about "select between limited and full range for YUV formats"?
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> +     * so we need to get the format from the isp.
>>>>>>>>>>>>>>>>>>> +     */
>>>>>>>>>>>>>>>>>>> +    pixm->quantization = isp_sd_fmt.format.quantization;
>>>>>>>>>>>>>>>>>>> +    if (!v4l2_is_format_yuv(cap->pix.info))
>>>>>>>>>>>>>>>>>>> +            pixm->quantization = V4L2_QUANTIZATION_FULL_RANGE;
>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>           pixm->width = clamp_t(u32, pixm->width,
>>>>>>>>>>>>>>>>>>>                                 RKISP1_RSZ_SRC_MIN_WIDTH, max_widths[cap->id]);
>>>>>>>>>>>>>>>>>>>           pixm->height = clamp_t(u32, pixm->height,
>>>>>>>>>>>>>>>>>>>                                  RKISP1_RSZ_SRC_MIN_HEIGHT, max_heights[cap->id]);
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> -    pixm->field = V4L2_FIELD_NONE;
>>>>>>>>>>>>>>>>>>> -    pixm->colorspace = V4L2_COLORSPACE_DEFAULT;
>>>>>>>>>>>>>>>>>>> -    pixm->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
>>>>>>>>>>>>>>>>>>> -
>>>>>>>>>>>>>>>>>>>           info = rkisp1_fill_pixfmt(pixm, cap->id);
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> -    /* can not change quantization when stream-on */
>>>>>>>>>>>>>>>>>>> -    if (other_cap->is_streaming)
>>>>>>>>>>>>>>>>>>> -            pixm->quantization = other_cap->pix.fmt.quantization;
>>>>>>>>>>>>>>>>>>> -    /* output full range by default, take effect in params */
>>>>>>>>>>>>>>>>>>> -    else if (!pixm->quantization ||
>>>>>>>>>>>>>>>>>>> -             pixm->quantization > V4L2_QUANTIZATION_LIM_RANGE)
>>>>>>>>>>>>>>>>>>> -            pixm->quantization = V4L2_QUANTIZATION_FULL_RANGE;
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>           if (fmt_cfg)
>>>>>>>>>>>>>>>>>>>                   *fmt_cfg = fmt;
>>>>>>>>>>>>>>>>>>> diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
>>>>>>>>>>>>>>>>>>> index 2d7b7e078636..7a5576fa14c9 100644
>>>>>>>>>>>>>>>>>>> --- a/drivers/staging/media/rkisp1/rkisp1-common.h
>>>>>>>>>>>>>>>>>>> +++ b/drivers/staging/media/rkisp1/rkisp1-common.h
>>>>>>>>>>>>>>>>>>> @@ -300,6 +300,8 @@ int rkisp1_isp_register(struct rkisp1_device *rkisp1,
>>>>>>>>>>>>>>>>>>>                           struct v4l2_device *v4l2_dev);
>>>>>>>>>>>>>>>>>>>        void rkisp1_isp_unregister(struct rkisp1_device *rkisp1);
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> +int rkisp1_get_isp_src_fmt(struct rkisp1_device *rkisp1,
>>>>>>>>>>>>>>>>>>> +                       struct v4l2_subdev_format *sd_fmt);
>>>>>>>>>>>>>>>>>>>        const struct rkisp1_isp_mbus_info *rkisp1_isp_mbus_info_get(u32 mbus_code);
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>        irqreturn_t rkisp1_isp_isr(struct rkisp1_device *rkisp1);
>>>>>>>>>>>>>>>>>>> diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
>>>>>>>>>>>>>>>>>>> index dee8e96f3900..6fdf5ed0b6b1 100644
>>>>>>>>>>>>>>>>>>> --- a/drivers/staging/media/rkisp1/rkisp1-isp.c
>>>>>>>>>>>>>>>>>>> +++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
>>>>>>>>>>>>>>>>>>> @@ -613,6 +613,10 @@ static int rkisp1_isp_enum_mbus_code(struct v4l2_subdev *sd,
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>                   if (code->index == pos - 1) {
>>>>>>>>>>>>>>>>>>>                           code->code = fmt->mbus_code;
>>>>>>>>>>>>>>>>>>> +                    if (fmt->pixel_enc == V4L2_PIXEL_ENC_YUV &&
>>>>>>>>>>>>>>>>>>> +                        dir == RKISP1_DIR_SRC)
>>>>>>>>>>>>>>>>>>> +                            code->flags =
>>>>>>>>>>>>>>>>>>> +                                    V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION;
>>>>>>>>>>>>>>>>>>>                           return 0;
>>>>>>>>>>>>>>>>>>>                   }
>>>>>>>>>>>>>>>>>>>           }
>>>>>>>>>>>>>>>>>>> @@ -639,12 +643,21 @@ static int rkisp1_isp_init_config(struct v4l2_subdev *sd,
>>>>>>>>>>>>>>>>>>>           sink_crop->height = RKISP1_DEFAULT_HEIGHT;
>>>>>>>>>>>>>>>>>>>           sink_crop->left = 0;
>>>>>>>>>>>>>>>>>>>           sink_crop->top = 0;
>>>>>>>>>>>>>>>>>>> +    sink_fmt->colorspace = V4L2_COLORSPACE_SRGB;
>>>>>>>>>>>>>>>>>>> +    sink_fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(sink_fmt->colorspace);
>>>>>>>>>>>>>>>>>>> +    sink_fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(sink_fmt->colorspace);
>>>>>>>>>>>>>>>>>>> +    sink_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>           src_fmt = v4l2_subdev_get_try_format(sd, cfg,
>>>>>>>>>>>>>>>>>>>                                                RKISP1_ISP_PAD_SOURCE_VIDEO);
>>>>>>>>>>>>>>>>>>>           *src_fmt = *sink_fmt;
>>>>>>>>>>>>>>>>>>>           src_fmt->code = RKISP1_DEF_SRC_PAD_FMT;
>>>>>>>>>>>>>>>>>>> -    src_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
>>>>>>>>>>>>>>>>>>> +    src_fmt->colorspace = V4L2_COLORSPACE_SRGB;
>>>>>>>>>>>>>>>>>>> +    src_fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(src_fmt->colorspace);
>>>>>>>>>>>>>>>>>>> +    src_fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(src_fmt->colorspace);
>>>>>>>>>>>>>>>>>>> +    src_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>           src_crop = v4l2_subdev_get_try_crop(sd, cfg,
>>>>>>>>>>>>>>>>>>>                                               RKISP1_ISP_PAD_SOURCE_VIDEO);
>>>>>>>>>>>>>>>>>>> @@ -687,10 +700,17 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
>>>>>>>>>>>>>>>>>>>                   isp->src_fmt = mbus_info;
>>>>>>>>>>>>>>>>>>>           src_fmt->width  = src_crop->width;
>>>>>>>>>>>>>>>>>>>           src_fmt->height = src_crop->height;
>>>>>>>>>>>>>>>>>>> -    src_fmt->quantization = format->quantization;
>>>>>>>>>>>>>>>>>>> -    /* full range by default */
>>>>>>>>>>>>>>>>>>> -    if (!src_fmt->quantization)
>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>> +    src_fmt->colorspace = V4L2_COLORSPACE_SRGB;
>>>>>>>>>>>>>>>>>>> +    src_fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(src_fmt->colorspace);
>>>>>>>>>>>>>>>>>>> +    src_fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(src_fmt->colorspace);
>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>> +    if (mbus_info->pixel_enc == V4L2_PIXEL_ENC_BAYER)
>>>>>>>>>>>>>>>>>>>                   src_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
>>>>>>>>>>>>>>>>>>> +    else if (format->quantization == V4L2_QUANTIZATION_DEFAULT)
>>>>>>>>>>>>>>>>>>> +            src_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
>>>>>>>>>>>>>>>>>>> +    else
>>>>>>>>>>>>>>>>>>> +            src_fmt->quantization = format->quantization;
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>           *format = *src_fmt;
>>>>>>>>>>>>>>>>>>>        }
>>>>>>>>>>>>>>>>>>> @@ -1068,6 +1088,17 @@ int rkisp1_isp_register(struct rkisp1_device *rkisp1,
>>>>>>>>>>>>>>>>>>>           return ret;
>>>>>>>>>>>>>>>>>>>        }
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> +int rkisp1_get_isp_src_fmt(struct rkisp1_device *rkisp1,
>>>>>>>>>>>>>>>>>>> +                       struct v4l2_subdev_format *sd_fmt)
>>>>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>>>>> +    struct rkisp1_isp *isp = &rkisp1->isp;
>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>> +    sd_fmt->which = V4L2_SUBDEV_FORMAT_ACTIVE;
>>>>>>>>>>>>>>>>>>> +    sd_fmt->pad = RKISP1_ISP_PAD_SOURCE_VIDEO;
>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>> +    return v4l2_subdev_call(&isp->sd, pad, get_fmt, NULL, sd_fmt);
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> Do we need to get through the external API to access data that is
>>>>>>>>>>>>>>>>>> driver-internal anyway?
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>        void rkisp1_isp_unregister(struct rkisp1_device *rkisp1)
>>>>>>>>>>>>>>>>>>>        {
>>>>>>>>>>>>>>>>>>>           struct v4l2_subdev *sd = &rkisp1->isp.sd;
>>>>>>>>>>>>>>>>>>> diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
>>>>>>>>>>>>>>>>>>> index 7b6b7ddd4169..8705b133de68 100644
>>>>>>>>>>>>>>>>>>> --- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
>>>>>>>>>>>>>>>>>>> +++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
>>>>>>>>>>>>>>>>>>> @@ -525,6 +525,7 @@ static void rkisp1_rsz_set_sink_fmt(struct rkisp1_resizer *rsz,
>>>>>>>>>>>>>>>>>>>           const struct rkisp1_isp_mbus_info *mbus_info;
>>>>>>>>>>>>>>>>>>>           struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
>>>>>>>>>>>>>>>>>>>           struct v4l2_rect *sink_crop;
>>>>>>>>>>>>>>>>>>> +    struct v4l2_subdev_format isp_sd_fmt;
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>           sink_fmt = rkisp1_rsz_get_pad_fmt(rsz, cfg, RKISP1_RSZ_PAD_SINK, which);
>>>>>>>>>>>>>>>>>>>           src_fmt = rkisp1_rsz_get_pad_fmt(rsz, cfg, RKISP1_RSZ_PAD_SRC, which);
>>>>>>>>>>>>>>>>>>> @@ -539,8 +540,20 @@ static void rkisp1_rsz_set_sink_fmt(struct rkisp1_resizer *rsz,
>>>>>>>>>>>>>>>>>>>           if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
>>>>>>>>>>>>>>>>>>>                   rsz->pixel_enc = mbus_info->pixel_enc;
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> +    rkisp1_get_isp_src_fmt(rsz->rkisp1, &isp_sd_fmt);
>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> Is this necessary? My understanding was that in the subdev model, it was
>>>>>>>>>>>>>>>>>> the userspace responsibility to propagate any configuration changes through
>>>>>>>>>>>>>>>>>> the graph.
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> Also, doing this only here wouldn't fully maintain the
>>>>>>>>>>>>>>>>>> consistency of the state. For example, if one sets the ISP subdev format
>>>>>>>>>>>>>>>>>> first, then the resizer subdev and then the ISP subdev again, wouldn't the
>>>>>>>>>>>>>>>>>> resizer subdev end up with a wrong format?
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> yes, this is indeed a bug, I am preparing v4 now.
>>>>>>>>>>>>>>>>> What I thought to do is adding quantization conversion
>>>>>>>>>>>>>>>>> support also on ther resizer and capture entities.
>>>>>>>>>>>>>>>>> Then in the 'link_validation' callbacks, there
>>>>>>>>>>>>>>>>> is a validation that the quantization fields matches.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> My understanding is that, if we have the following topology
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> [ ISP ] -> [ Resizer ] -> [ Video node ]
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> then the ISP source pad would have the csc capability, while resizer
>>>>>>>>>>>>>>>> and video node would just accept whatever is configured on their sink
>>>>>>>>>>>>>>>> pads (no need for csc capability for that) and propagate that to their
>>>>>>>>>>>>>>>> outputs, i.e. resizer source pad and video node CAPTURE format.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Is this what you were going to implement?
>>>>>>>>>>>>>> Hi, I sent a v4 where the CSC capability is set on the reiszer and capture as well.
>>>>>>>>>>>>>> I can send a v5 implementing it the way you suggest. Currently the doc says that the colorspace fields
>>>>>>>>>>>>>> must be set by the driver for capture streams. This implies that userspace can set it
>>>>>>>>>>>>>> only if the CSC is supported.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Why would the userspace have to set it for the capture stream on the
>>>>>>>>>>>>> resizer and video nodes? Couldn't the userspace set it to DEFAULT and
>>>>>>>>>>>>> then the driver override to whatever it received on the corresponding
>>>>>>>>>>>>> sink?
>>>>>>>>>>
>>>>>>>>>> According to the documentation [1]:
>>>>>>>>>>
>>>>>>>>>> "the default quantization encoding as defined by the colorspace"
>>>>>>>>>>
>>>>>>>>>> Then, for instance, the default for V4L2_COLORSPACE_SRGB is limited range [2].
>>>>>>>>>>
>>>>>>>>>> Unless we change the definition of DEFAULT to let it accept whatever it receives on the corresponding sink.
>>>>>>>>>>
>>>>>>>>>> Then the way I understand is:
>>>>>>>>>>
>>>>>>>>>> [sensor]->[isp]->[resizer]->[capture]
>>>>>>>>>>
>>>>>>>>>> Userspace should set quantization on:
>>>>>>>>>> * sensor source pad
>>>>>>>>>> * isp sink pad
>>>>>>>>>> * resizer sink pad
>>>>>>>>>> * capture node
>>>>>>>>>>
>>>>>>>>>> The remaining source pads would get values propagated from their sink pads.
>>>>>>>>>>
>>>>>>>>>> [1] https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/colorspaces-defs.html#c.v4l2_quantization
>>>>>>>>>> [2] https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/colorspaces-details.html#col-srgb
>>>>>>>>>
>>>>>>>>> After discussing this offline, we concluded that:
>>>>>>>>> - only the source pad of the ISP entity should expose the CSC capability,
>>>>>>>>> - the CAPTURE video node should expose only the formats/color spaces
>>>>>>>>> compatible with the current setting of the resizer source,
>>>>>>>>> - consistency between the resizer source format and CAPTURE format
>>>>>>>>> should be implicitly maintained by the driver.
>>>>>>>>
>>>>>>>> Do you mean it should be validated at streamon time ?
>>>>>>>
>>>>>>> Nope. Any V4L2 state must be kept valid all the time, as mandated by
>>>>>>> the general V4L2 principles. Wrong configuration of the video node
>>>>>>> must not be a reason for STREAMON failing.
>>>>>>>
>>>>>>>> In MC-based
>>>>>>>> drivers, entities are isolated from each other from a configuration
>>>>>>>> point of view, and the validity of the configuration across the whole
>>>>>>>> pipeline is checked at streamon time. I don't think CSC parameters
>>>>>>>> should be treated differently than formats in this regard.
>>>>>>>
>>>>>>> Indeed, the ISP entity and the resizer entity are isolated from each
>>>>>>> other and they need to be validated separately. However, the resizer
>>>>>>> entity is not isolated from the video node, as there is no
>>>>>>> configuration exposed for the video node in the MC API. If MC exposed
>>>>>>> an explicit format control for the video interface sink pad, then the
>>>>>>> resizer would have to be validated separately indeed, but still that
>>>>>>> video interface sink pad would be tied to the rest of the
>>>>>>> configuration of the video node (e.g. the CAPTURE format).
>>>>>>
>>>>>> Two questions:
>>>>>>
>>>>>> The validation callback between the resizer and the isp has to include check
>>>>>> that the quantization values matches ?
>>>>>
>>>>> To sumarize:
>>>>>
>>>>> The current quantization fields from VIDIOC_SUBDEV_{S,G}_FMT and VIDEO_{SET,GET}_FORMAT
>>>>> are filled by the driver (read-only by userspace).
>>>>>
>>>>> This RFC exposes an API that allows the quantization to be a read-write configuration.
>>>>> The question is where we expose the read-write capability.
>>>>>
>>>>> We have two main design choices here.
>>>>>
>>>>> 1) Expose read-write quantization in all pads and video nodes.
>>>>> And userspace must set matching quantization in all of them.
>>>>> Which makes userspace more complicated, but userspace already needs to configure
>>>>> the whole topology anyway.
>>>>> This wouldn't make much sense in video nodes for metadata (params and statistics)
>>>>>
>>>>> In this options, the validation callback should check for matching quantizations
>>>>> between all links, and it would failed on STREAMON if formats don't match.
>>>>>
>>>>> 2-A) Expose read-write quantization only on the isp source pad.
>>>>> The others pads and video nodes would be keept read-only.
>>>>> Which means that changing quantization on a read-write node, will implicitly
>>>>> change the values on the read-only nodes.
>>>>> Which maybe not be a problem, since current API (read-only) already says this field
>>>>> is filled by the driver.
>>>>>
>>>>> In this options, the validation callback doesn't need to check for matching quantizations
>>>>> between links.
>>>>>
>>>>> 2-A) Expose read-write quantization only on the video node
>>>>> This is basically the same as 2-A, but userspace could interpret that we
>>>>> could have different quantizations in each video node.
>>>>>
>>>>>
>>>>> I'd like to hear from others what would be better here, design choice 1 or 2.
>>>>
>>>> To keep things simple, I'd go for 2-A, and I would ignore the colorspace
>>>> fields completely on the video nodes.
>>>>
>>>> In an MC-centric driver there should be no automatic in-kernel
>>>> propagation of userspace-visible configuration from a source pad to the
>>>> connected sink pad (regardless of whether the sink is a subdev or a
>>>> video node). It's userspace that is responsible for propagating the
>>>> configuration, and the kernel is supposed to validate it at stream-on
>>>> time.
>>>>
>>>> In this case, the colorspace information is only relevant to the ISP and
>>>> nobody else cares (neither the resizer nor the DMA engines) - please
>>>> correct me if I'm wrong. Given that userspace will be specific to this
>>>> particular hardware, I would not enforce matching colorspace beyond the
>>>> output of the ISP. Userspace will deal with colorspace at the output of
>>>> the ISP and ignore it on the video node.
>>>
>>> So you mean that userspace should know that the quantization of the video
>>> is the one configured on the isp, and not 'Default Quantization' as would
>>> be reported by the resizers captures?
>>
>> Yes. The Rockchip ISP requires device-specific userspace, so requiring
>> it to know about the driver doesn't seem a problem to me. I however
>> expect some people to disagree :-) We should however record this in
>> documentation somewhere, requiring userspace developers to read the
>> rkisp1 documentation is one thing, requiring them to read the driver
>> source code to figure out how to use it would be going one step too far
>> I think.
> 
> Hi, I already sent a v5 with your suggestion and already got your "reviewd-by" and Acked-by from Helen.
> [1] https://patchwork.kernel.org/patch/11642383/#23505365
> 
> But thinking of it again, the purpose of adding the CSC API was to make the code compatible
> by supporting it in the v4l2 API.
> Now we end up with a new API feature for subdevices and the rkisp1 still have a non compatible weird behavior
> that needs special documentation. It might be just a simpler solution to document the rkisp1 that although
> a quantization should be set by the driver according to the core API, for this driver it can
> also be set by userspace.
> 
> It is also not clear how other subdevices suppose to use the CSC API. Either they implement the
> same weird behavior as rkisp1 or they will have to require userspace to propagate the
> colorspace param that is set on the subdevice. It is not clear then if the CSC API should be
> supported on the other subdev nodes in the topology in order to allow it.
> 
> Thanks,
> Dafna

Thinking about it even more, we can just make the quantization conversion a capability of the video nodes.
Userspace doesn't care which of the nodes expose this capability so I don't see a problem doing it.
The big benefits are that we don't need to add the CSC API for subdevices, we add it only for video nodes
and also the rkisp1 will be compatible with the API without this weird behavior.
The CSC for video nodes is also useful for other drivers that Philipp Zabel is working on while the CSC
for subdeivces is introduced only for the rkisp1.

Thanks,
Dafna

> 
>>
>>>>>> Userspace have to configure the quantizaion on the resizer sink pad without that CSC
>>>>>> API beeing expose on it?
>>>>>
>>>>> In the current API, the quantization field is read-only, so to allow userspace to configure
>>>>> quantization in any pad, the CSC API needs to be exposed on the pad to make it read-write.
>>>>>
>>>>>>>>> Below is the rationale for that:
>>>>>>>>> - In the MC model, the video node represents the DMA alone (and thus
>>>>>>>>> the reason to have the resizer entities at all) and since the
>>>>>>>>> colorspace is not a property of the DMA, it doesn't belong there.
>>>>>>>>> - Even if we put that aside, both MP and SP can only output the same
>>>>>>>>> colorspace, which would create a dependency between the configuration
>>>>>>>>> of the two video nodes, which is not something well defined by V4L2.
>>>>>>>>> - A video interface in the MC API doesn't expose control over its
>>>>>>>>> input format, which means that the relation between the other side of
>>>>>>>>> the link (resizer source) and the video node is implicit and needs to
>>>>>>>>> be handled internally in the driver.
>>>>>>>>> - V4L2, as opposed to MC, requires that the current state is always
>>>>>>>>> consistent and valid. In this case it means that an ioctl on the video
>>>>>>>>> node must not be able to alter the state in a way that would make it
>>>>>>>>> inconsistent with the state of the matching resizer source.
>>
