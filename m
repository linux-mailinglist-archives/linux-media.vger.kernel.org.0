Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A09A464EB52
	for <lists+linux-media@lfdr.de>; Fri, 16 Dec 2022 13:20:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbiLPMUB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Dec 2022 07:20:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbiLPMT7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Dec 2022 07:19:59 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DA6311A15
        for <linux-media@vger.kernel.org>; Fri, 16 Dec 2022 04:19:58 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CA761A31;
        Fri, 16 Dec 2022 13:19:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671193196;
        bh=1OoquYjDjJQlr+dMtaGC/giPAWyeyErbkkt3Tp1iwJw=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=Xskw7Wes0Ks5zwOuCKZKa+psUwMN6V0S7+pmVsvEHH5WCbp59h8OW9jQ5OzZhQuXy
         brYLdTnn3fOoSL9bk+SZk9Hgkqax9LsOqOIZsz/TESTf85Zlg7TCODTran22vksOKt
         ZenhzRtZMzE4sHIEWpSItc6d6drflyq74LNqMJb4=
Message-ID: <ff58878b-0503-43c8-9e93-2a371dc7f0c4@ideasonboard.com>
Date:   Fri, 16 Dec 2022 12:19:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To:     Yunke Cao <yunkec@google.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
References: <20221109060621.704531-1-yunkec@google.com>
 <20221109060621.704531-7-yunkec@google.com>
 <72782fc9-ebe6-bab5-78b5-a66b226b4d74@ideasonboard.com>
 <CANqU6FeT3WtZYn8DVx5tkt+N9sdYhfOyHQeSzOHnS0E4dP_7_w@mail.gmail.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH v10 06/11] media: uvcvideo: implement UVC v1.5 ROI
In-Reply-To: <CANqU6FeT3WtZYn8DVx5tkt+N9sdYhfOyHQeSzOHnS0E4dP_7_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello

On 16/12/2022 01:30, Yunke Cao wrote:
> Hi Dan,
>
> On Fri, Dec 16, 2022 at 12:55 AM Dan Scally <dan.scally@ideasonboard.com> wrote:
>> Hi Yunke
>>
>> On 09/11/2022 06:06, Yunke Cao wrote:
>>> Implement support for ROI as described in UVC 1.5:
>>> 4.2.2.1.20 Digital Region of Interest (ROI) Control
>>>
>>> ROI control is implemented using V4L2 control API as
>>> two UVC-specific controls:
>>> V4L2_CID_UVC_REGION_OF_INTEREST_RECT and
>>> V4L2_CID_UVC_REGION_OF_INTEREST_AUTO.
>>>
>>> Signed-off-by: Yunke Cao <yunkec@google.com>
>>> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
>>> ---
>>> Changelog since v9:
>>> - No change.
>>> Changelog since v8:
>>> - No change.
>>> Changelog since v7:
>>> - Fix a few style issues.
>>> - Only allow 4-byte aligned data.
>>> - Add control names.
>>> - Move initialization to 7/10.
>>>
>>> Question:
>>> - Is V4L2_CID_CAMERA_UVC_BASE defined correctly?
>>>     Should we use V4L2_CID_PRIVATE_BASE?
>>>
>>>    drivers/media/usb/uvc/uvc_ctrl.c   | 111 +++++++++++++++++++++++++++--
>>>    drivers/media/usb/uvc/uvc_v4l2.c   |   5 +-
>>>    drivers/media/usb/uvc/uvcvideo.h   |   7 ++
>>>    include/uapi/linux/usb/video.h     |   1 +
>>>    include/uapi/linux/uvcvideo.h      |  13 ++++
>>>    include/uapi/linux/v4l2-controls.h |   9 +++
>>>    6 files changed, 140 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
>>> index 7d86aa695b34..6279a3edf944 100644
>>> --- a/drivers/media/usb/uvc/uvc_ctrl.c
>>> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
>>> @@ -356,6 +356,24 @@ static const struct uvc_control_info uvc_ctrls[] = {
>>>                .flags          = UVC_CTRL_FLAG_GET_CUR
>>>                                | UVC_CTRL_FLAG_AUTO_UPDATE,
>>>        },
>>> +     /*
>>> +      * UVC_CTRL_FLAG_AUTO_UPDATE is needed because the RoI may get updated
>>> +      * by sensors.
>>> +      * "This RoI should be the same as specified in most recent SET_CUR
>>> +      * except in the case where the ‘Auto Detect and Track’ and/or
>>> +      * ‘Image Stabilization’ bit have been set."
>>> +      * 4.2.2.1.20 Digital Region of Interest (ROI) Control
>>> +      */
>>> +     {
>>> +             .entity         = UVC_GUID_UVC_CAMERA,
>>> +             .selector       = UVC_CT_REGION_OF_INTEREST_CONTROL,
>>> +             .index          = 21,
>>> +             .size           = 10,
>>> +             .flags          = UVC_CTRL_FLAG_SET_CUR | UVC_CTRL_FLAG_GET_CUR
>>> +                             | UVC_CTRL_FLAG_GET_MIN | UVC_CTRL_FLAG_GET_MAX
>>> +                             | UVC_CTRL_FLAG_GET_DEF
>>> +                             | UVC_CTRL_FLAG_AUTO_UPDATE,
>>> +     },
>>>    };
>>>
>>>    static const u32 uvc_control_classes[] = {
>>> @@ -431,6 +449,57 @@ static void uvc_ctrl_set_rel_speed(struct uvc_control_mapping *mapping,
>>>        data[first+1] = min_t(int, abs(value), 0xff);
>>>    }
>>>
>>> +static int uvc_to_v4l2_rect(struct v4l2_rect *v4l2_rect,
>>> +                         const struct uvc_rect *uvc_rect)
>>> +{
>>> +     if (uvc_rect->top < uvc_rect->bottom ||
>>> +         uvc_rect->right < uvc_rect->left)
>>> +             return -EINVAL;
>>> +
>>> +     v4l2_rect->top = uvc_rect->top;
>>> +     v4l2_rect->left = uvc_rect->left;
>>> +     v4l2_rect->height = uvc_rect->bottom - uvc_rect->top + 1;
>>> +     v4l2_rect->width = uvc_rect->right - uvc_rect->left + 1;
>>> +     return 0;
>>> +}
>>> +
>>> +static int v4l2_to_uvc_rect(struct uvc_rect *uvc_rect,
>>> +                         const struct v4l2_rect *v4l2_rect)
>>> +{
>>> +     /* Safely converts s32 and u32 to u16. */
>>> +     if (v4l2_rect->top > U16_MAX || v4l2_rect->top < 0 ||
>>> +         v4l2_rect->left > U16_MAX || v4l2_rect->left < 0 ||
>>> +         v4l2_rect->height > U16_MAX || v4l2_rect->height == 0 ||
>>> +         v4l2_rect->width > U16_MAX || v4l2_rect->width == 0 ||
>>> +         v4l2_rect->height + v4l2_rect->top - 1 > U16_MAX ||
>>> +         v4l2_rect->width + v4l2_rect->left - 1 > U16_MAX)
>>> +             return -ERANGE;
>>> +
>>> +     uvc_rect->top = v4l2_rect->top;
>>> +     uvc_rect->left = v4l2_rect->left;
>>> +     uvc_rect->bottom = v4l2_rect->height + v4l2_rect->top - 1;
>>> +     uvc_rect->right = v4l2_rect->width + v4l2_rect->left - 1;
>>> +     return 0;
>>> +}
>>
>> uvc_ctrl_set() clamps out of range values...which is of course hard to
>> do at that point with the compound controls, but I think it would be ok
>> to simplify this function by clamping the values from v4l2_rect.
>>
> Sorry, I didn't get it. Do you mean clamping the value in [0, U16_MAX] ?


Sorry, that was poorly explained. I meant to the control's min, max 
values in the same way that uvc_ctrl_set() clamps controls of type 
V4L2_CTRL_TYPE_INTEGER [1], which would inherently guarantee that they 
were within 0 to U16_MAX (because the min/max for that control have to 
be within that range anyway) and so simplify this function...but the 
clamping wouldn't be in this function, it would have to be in 
uvc_set_compound_rect(), and would also necessitate re-ordering the 
series such that support for V4L2_CTRL_WHICH_MIN/MAX_VAL were added 
first. In addition to simplifying this function without that (unless I'm 
missing something) there's nothing to stop userspace from calling 
uvc_ioctl_s_try_ext_ctls() with a p_rect that is outside the min/max for 
the control.


What do you think?



[1] 
https://elixir.bootlin.com/linux/v6.1/source/drivers/media/usb/uvc/uvc_ctrl.c#L1769

>
> Best,
> Yunke
>
>>> +
>>> +static int uvc_get_compound_rect(struct uvc_control_mapping *mapping,
>>> +                              const u8 *data,  u8 *data_out)
>>> +{
>>> +     struct uvc_rect *uvc_rect;
>>> +
>>> +     uvc_rect = (struct uvc_rect *)(data + mapping->offset / 8);
>>> +     return uvc_to_v4l2_rect((struct v4l2_rect *)data_out, uvc_rect);
>>> +}
>>> +
>>> +static int uvc_set_compound_rect(struct uvc_control_mapping *mapping,
>>> +                              const u8 *data_in, u8 *data)
>>> +{
>>> +     struct uvc_rect *uvc_rect;
>>> +
>>> +     uvc_rect = (struct uvc_rect *)(data + mapping->offset / 8);
>>> +     return v4l2_to_uvc_rect(uvc_rect, (struct v4l2_rect *)data_in);
>>> +}
>>> +
>>>    static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>>>        {
>>>                .id             = V4L2_CID_BRIGHTNESS,
>>> @@ -719,6 +788,29 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>>>                .v4l2_type      = V4L2_CTRL_TYPE_BOOLEAN,
>>>                .data_type      = UVC_CTRL_DATA_TYPE_BOOLEAN,
>>>        },
>>> +     {
>>> +             .id             = V4L2_CID_UVC_REGION_OF_INTEREST_RECT,
>>> +             .entity         = UVC_GUID_UVC_CAMERA,
>>> +             .selector       = UVC_CT_REGION_OF_INTEREST_CONTROL,
>>> +             .v4l2_size      = sizeof(struct v4l2_rect) * 8,
>>> +             .data_size      = sizeof(struct uvc_rect) * 8,
>>> +             .offset         = 0,
>>> +             .v4l2_type      = V4L2_CTRL_TYPE_RECT,
>>> +             .data_type      = UVC_CTRL_DATA_TYPE_RECT,
>>> +             .get_compound   = uvc_get_compound_rect,
>>> +             .set_compound   = uvc_set_compound_rect,
>>> +             .name           = "Region Of Interest Rectangle",
>>> +     },
>>> +     {
>>> +             .id             = V4L2_CID_UVC_REGION_OF_INTEREST_AUTO,
>>> +             .entity         = UVC_GUID_UVC_CAMERA,
>>> +             .selector       = UVC_CT_REGION_OF_INTEREST_CONTROL,
>>> +             .data_size      = 16,
>>> +             .offset         = 64,
>>> +             .v4l2_type      = V4L2_CTRL_TYPE_BITMASK,
>>> +             .data_type      = UVC_CTRL_DATA_TYPE_BITMASK,
>>> +             .name           = "Region Of Interest Auto Controls",
>>> +     },
>>>    };
>>>
>>>    static const struct uvc_control_mapping uvc_ctrl_mappings_uvc11[] = {
>>> @@ -2444,12 +2536,21 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
>>>        }
>>>
>>>        if (uvc_ctrl_mapping_is_compound(map)) {
>>> -             if (map->data_size != map->v4l2_size)
>>> -                     return -EINVAL;
>>> +             switch (map->v4l2_type) {
>>> +             case V4L2_CTRL_TYPE_RECT:
>>> +                     /* Only supports 4 bytes-aligned data. */
>>> +                     if (WARN_ON(map->offset % 32))
>>> +                             return -EINVAL;
>>> +                     break;
>>> +             default:
>>> +                     if (WARN_ON(map->data_size != map->v4l2_size))
>>> +                             return -EINVAL;
>>> +
>>> +                     /* Only supports byte-aligned data. */
>>> +                     if (WARN_ON(map->offset % 8 || map->data_size % 8))
>>> +                             return -EINVAL;
>>> +             }
>>>
>>> -             /* Only supports byte-aligned data. */
>>> -             if (WARN_ON(map->offset % 8 || map->data_size % 8))
>>> -                     return -EINVAL;
>>>        }
>>>
>>>        if (!map->get && !uvc_ctrl_mapping_is_compound(map))
>>> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
>>> index 36ff1d0d6edb..52a7dc9ad4b9 100644
>>> --- a/drivers/media/usb/uvc/uvc_v4l2.c
>>> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
>>> @@ -1002,7 +1002,10 @@ static int uvc_ioctl_query_ext_ctrl(struct file *file, void *fh,
>>>        qec->step = qc.step;
>>>        qec->default_value = qc.default_value;
>>>        qec->flags = qc.flags;
>>> -     qec->elem_size = 4;
>>> +     if (qc.type == V4L2_CTRL_TYPE_RECT)
>>> +             qec->elem_size = sizeof(struct v4l2_rect);
>>> +     else
>>> +             qec->elem_size = 4;
>>>        qec->elems = 1;
>>>        qec->nr_of_dims = 0;
>>>        memset(qec->dims, 0, sizeof(qec->dims));
>>> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
>>> index 1e1bccd3b2e5..c47304a63a7d 100644
>>> --- a/drivers/media/usb/uvc/uvcvideo.h
>>> +++ b/drivers/media/usb/uvc/uvcvideo.h
>>> @@ -291,6 +291,13 @@ struct uvc_streaming_header {
>>>        u8 bTriggerUsage;
>>>    };
>>>
>>> +struct uvc_rect {
>>> +     u16 top;
>>> +     u16 left;
>>> +     u16 bottom;
>>> +     u16 right;
>>> +} __packed;
>>> +
>>>    enum uvc_buffer_state {
>>>        UVC_BUF_STATE_IDLE      = 0,
>>>        UVC_BUF_STATE_QUEUED    = 1,
>>> diff --git a/include/uapi/linux/usb/video.h b/include/uapi/linux/usb/video.h
>>> index bfdae12cdacf..9076a444758a 100644
>>> --- a/include/uapi/linux/usb/video.h
>>> +++ b/include/uapi/linux/usb/video.h
>>> @@ -104,6 +104,7 @@
>>>    #define UVC_CT_ROLL_ABSOLUTE_CONTROL                        0x0f
>>>    #define UVC_CT_ROLL_RELATIVE_CONTROL                        0x10
>>>    #define UVC_CT_PRIVACY_CONTROL                              0x11
>>> +#define UVC_CT_REGION_OF_INTEREST_CONTROL            0x14
>>>
>>>    /* A.9.5. Processing Unit Control Selectors */
>>>    #define UVC_PU_CONTROL_UNDEFINED                    0x00
>>> diff --git a/include/uapi/linux/uvcvideo.h b/include/uapi/linux/uvcvideo.h
>>> index 8288137387c0..ae5eaa14eca2 100644
>>> --- a/include/uapi/linux/uvcvideo.h
>>> +++ b/include/uapi/linux/uvcvideo.h
>>> @@ -16,6 +16,7 @@
>>>    #define UVC_CTRL_DATA_TYPE_BOOLEAN  3
>>>    #define UVC_CTRL_DATA_TYPE_ENUM             4
>>>    #define UVC_CTRL_DATA_TYPE_BITMASK  5
>>> +#define UVC_CTRL_DATA_TYPE_RECT              6
>>>
>>>    /* Control flags */
>>>    #define UVC_CTRL_FLAG_SET_CUR               (1 << 0)
>>> @@ -36,6 +37,18 @@
>>>         UVC_CTRL_FLAG_GET_MAX | UVC_CTRL_FLAG_GET_RES | \
>>>         UVC_CTRL_FLAG_GET_DEF)
>>>
>>> +/* V4L2 driver-specific controls */
>>> +#define V4L2_CID_UVC_REGION_OF_INTEREST_RECT (V4L2_CID_CAMERA_UVC_BASE + 1)
>>> +#define V4L2_CID_UVC_REGION_OF_INTEREST_AUTO (V4L2_CID_CAMERA_UVC_BASE + 2)
>>> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_EXPOSURE            (1 << 0)
>>> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_IRIS                        (1 << 1)
>>> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_WHITE_BALANCE               (1 << 2)
>>> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_FOCUS                       (1 << 3)
>>> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_FACE_DETECT         (1 << 4)
>>> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_DETECT_AND_TRACK    (1 << 5)
>>> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_IMAGE_STABILIZATION (1 << 6)
>>> +#define V4L2_UVC_REGION_OF_INTEREST_AUTO_HIGHER_QUALITY              (1 << 7)
>>> +
>>>    struct uvc_menu_info {
>>>        __u32 value;
>>>        __u8 name[32];
>>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
>>> index b5e7d082b8ad..b3544355be8f 100644
>>> --- a/include/uapi/linux/v4l2-controls.h
>>> +++ b/include/uapi/linux/v4l2-controls.h
>>> @@ -1019,6 +1019,15 @@ enum v4l2_auto_focus_range {
>>>
>>>    #define V4L2_CID_CAMERA_SENSOR_ROTATION             (V4L2_CID_CAMERA_CLASS_BASE+35)
>>>
>>> +/* CAMERA-class private control IDs */
>>> +
>>> +/*
>>> + * The base for the uvc driver controls.
>>> + * See linux/uvcvideo.h for the list of controls.
>>> + * We reserve 64 controls for this driver.
>>> + */
>>> +#define V4L2_CID_CAMERA_UVC_BASE             (V4L2_CID_CAMERA_CLASS_BASE + 0x1000)
>>> +
>>>    /* FM Modulator class control IDs */
>>>
>>>    #define V4L2_CID_FM_TX_CLASS_BASE           (V4L2_CTRL_CLASS_FM_TX | 0x900)
