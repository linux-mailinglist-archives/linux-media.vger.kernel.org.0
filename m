Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89D6A5FC0B9
	for <lists+linux-media@lfdr.de>; Wed, 12 Oct 2022 08:37:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbiJLGhB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Oct 2022 02:37:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbiJLGhA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Oct 2022 02:37:00 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63B01AE22C
        for <linux-media@vger.kernel.org>; Tue, 11 Oct 2022 23:36:58 -0700 (PDT)
Received: from [192.168.1.15] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0307F4DB;
        Wed, 12 Oct 2022 08:36:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665556615;
        bh=yzyZmUZKimNlFKvBs+5neaPTl9s7bglN+1KFVumvE5U=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=M153ULekxq94svVuBDUtVKaf8gk6CnqqAB5Hk4/QsD95F0BPC4qaQKsKZ72zWUJtx
         UYITBAyC8pmPeZ3DKzItlR/PlAHHO6LXDeRvaHwzYUL8+d/+2sv+FuWJJE4sfFp3wJ
         4ZFYZkOsKZWEPd2Zwvasaiicq8zIfmuL07yyN7bs=
Message-ID: <d0f39af5-41f3-1fe6-be5f-7d563888e771@ideasonboard.com>
Date:   Wed, 12 Oct 2022 09:36:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v15 10/19] media: subdev: add stream based configuration
Content-Language: en-US
To:     Dafna Hirschfeld <dafna@fastmail.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
References: <20221003121852.616745-1-tomi.valkeinen@ideasonboard.com>
 <20221003121852.616745-11-tomi.valkeinen@ideasonboard.com>
 <20221009062434.27flg66oxt6wxrc7@guri>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20221009062434.27flg66oxt6wxrc7@guri>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/10/2022 09:24, Dafna Hirschfeld wrote:
> On 03.10.2022 15:18, Tomi Valkeinen wrote:
>> Add support to manage configurations (format, crop, compose) per stream,
>> instead of per pad. This is accomplished with data structures that hold
>> an array of all subdev's stream configurations.
>>
>> The number of streams can vary at runtime based on routing. Every time
>> the routing is changed, the stream configurations need to be
>> re-initialized.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>> .../v4l/vidioc-subdev-enum-frame-interval.rst |   5 +-
>> .../v4l/vidioc-subdev-enum-frame-size.rst     |   5 +-
>> .../v4l/vidioc-subdev-enum-mbus-code.rst      |   5 +-
>> .../media/v4l/vidioc-subdev-g-crop.rst        |   5 +-
>> .../media/v4l/vidioc-subdev-g-fmt.rst         |   5 +-
>> .../v4l/vidioc-subdev-g-frame-interval.rst    |   5 +-
>> .../media/v4l/vidioc-subdev-g-selection.rst   |   5 +-
>> drivers/media/v4l2-core/v4l2-subdev.c         | 154 +++++++++++++++++-
>> include/media/v4l2-subdev.h                   |  79 +++++++++
>> include/uapi/linux/v4l2-subdev.h              |  28 +++-
>> 10 files changed, 275 insertions(+), 21 deletions(-)
>>
>> diff --git 
>> a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-interval.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-interval.rst
>> index 3703943b412f..8def4c05d3da 100644
>> --- 
>> a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-interval.rst
>> +++ 
>> b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-interval.rst
>> @@ -92,7 +92,10 @@ multiple pads of the same sub-device is not defined.
>>       - Frame intervals to be enumerated, from enum
>>     :ref:`v4l2_subdev_format_whence <v4l2-subdev-format-whence>`.
>>     * - __u32
>> -      - ``reserved``\ [8]
>> +      - ``stream``
>> +      - Stream identifier.
>> +    * - __u32
>> +      - ``reserved``\ [7]
>>       - Reserved for future extensions. Applications and drivers must set
>>     the array to zero.
>>
>> diff --git 
>> a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-size.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-size.rst
>> index c25a9896df0e..3ef361c0dca7 100644
>> --- 
>> a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-size.rst
>> +++ 
>> b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-frame-size.rst
>> @@ -97,7 +97,10 @@ information about try formats.
>>       - Frame sizes to be enumerated, from enum
>>     :ref:`v4l2_subdev_format_whence <v4l2-subdev-format-whence>`.
>>     * - __u32
>> -      - ``reserved``\ [8]
>> +      - ``stream``
>> +      - Stream identifier.
>> +    * - __u32
>> +      - ``reserved``\ [7]
>>       - Reserved for future extensions. Applications and drivers must set
>>     the array to zero.
>>
>> diff --git 
>> a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst
>> index 417f1a19bcc4..248f6f9ee7c5 100644
>> --- 
>> a/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst
>> +++ 
>> b/Documentation/userspace-api/media/v4l/vidioc-subdev-enum-mbus-code.rst
>> @@ -73,7 +73,10 @@ information about the try formats.
>>       - ``flags``
>>       - See :ref:`v4l2-subdev-mbus-code-flags`
>>     * - __u32
>> -      - ``reserved``\ [7]
>> +      - ``stream``
>> +      - Stream identifier.
>> +    * - __u32
>> +      - ``reserved``\ [6]
>>       - Reserved for future extensions. Applications and drivers must set
>>     the array to zero.
>>
>> diff --git 
>> a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst 
>> b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
>> index bd15c0a5a66b..1d267f7e7991 100644
>> --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
>> @@ -96,7 +96,10 @@ modified format should be as close as possible to 
>> the original request.
>>       - ``rect``
>>       - Crop rectangle boundaries, in pixels.
>>     * - __u32
>> -      - ``reserved``\ [8]
>> +      - ``stream``
>> +      - Stream identifier.
>> +    * - __u32
>> +      - ``reserved``\ [7]
>>       - Reserved for future extensions. Applications and drivers must set
>>     the array to zero.
>>
>> diff --git 
>> a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-fmt.rst 
>> b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-fmt.rst
>> index 7acdbb939d89..ed253a1e44b7 100644
>> --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-fmt.rst
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-fmt.rst
>> @@ -102,7 +102,10 @@ should be as close as possible to the original 
>> request.
>>       - Definition of an image format, see 
>> :c:type:`v4l2_mbus_framefmt` for
>>     details.
>>     * - __u32
>> -      - ``reserved``\ [8]
>> +      - ``stream``
>> +      - Stream identifier.
>> +    * - __u32
>> +      - ``reserved``\ [7]
>>       - Reserved for future extensions. Applications and drivers must set
>>     the array to zero.
>>
>> diff --git 
>> a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-frame-interval.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-frame-interval.rst
>> index d7fe7543c506..842f962d2aea 100644
>> --- 
>> a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-frame-interval.rst
>> +++ 
>> b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-frame-interval.rst
>> @@ -90,7 +90,10 @@ the same sub-device is not defined.
>>       - ``interval``
>>       - Period, in seconds, between consecutive video frames.
>>     * - __u32
>> -      - ``reserved``\ [9]
>> +      - ``stream``
>> +      - Stream identifier.
>> +    * - __u32
>> +      - ``reserved``\ [8]
>>       - Reserved for future extensions. Applications and drivers must set
>>     the array to zero.
>>
>> diff --git 
>> a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-selection.rst 
>> b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-selection.rst
>> index f9172a42f036..6b629c19168c 100644
>> --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-selection.rst
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-selection.rst
>> @@ -94,7 +94,10 @@ Selection targets and flags are documented in
>>       - ``r``
>>       - Selection rectangle, in pixels.
>>     * - __u32
>> -      - ``reserved``\ [8]
>> +      - ``stream``
>> +      - Stream identifier.
>> +    * - __u32
>> +      - ``reserved``\ [7]
>>       - Reserved for future extensions. Applications and drivers must set
>>     the array to zero.
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c 
>> b/drivers/media/v4l2-core/v4l2-subdev.c
>> index 1049c07d2e49..be778e619694 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -159,8 +159,22 @@ static inline int check_pad(struct v4l2_subdev 
>> *sd, u32 pad)
>>     return 0;
>> }
>>
>> -static int check_state_pads(u32 which, struct v4l2_subdev_state *state)
>> +static int check_state(struct v4l2_subdev *sd, struct 
>> v4l2_subdev_state *state,
>> +               u32 which, u32 pad, u32 stream)
>> {
>> +    if (sd->flags & V4L2_SUBDEV_FL_STREAMS) {
>> +#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
>> +        if (!v4l2_subdev_state_get_stream_format(state, pad, stream))
>> +            return -EINVAL;
>> +        return 0;
>> +#else
>> +        return -EINVAL;
>> +#endif
>> +    }
>> +
>> +    if (stream != 0)
>> +        return -EINVAL;
>> +
>>     if (which == V4L2_SUBDEV_FORMAT_TRY && (!state || !state->pads))
>>         return -EINVAL;
>>
>> @@ -175,7 +189,7 @@ static inline int check_format(struct v4l2_subdev 
>> *sd,
>>         return -EINVAL;
>>
>>     return check_which(format->which) ? : check_pad(sd, format->pad) ? :
>> -           check_state_pads(format->which, state);
>> +           check_state(sd, state, format->which, format->pad, 
>> format->stream);
>> }
>>
>> static int call_get_fmt(struct v4l2_subdev *sd,
>> @@ -202,7 +216,7 @@ static int call_enum_mbus_code(struct v4l2_subdev 
>> *sd,
>>         return -EINVAL;
>>
>>     return check_which(code->which) ? : check_pad(sd, code->pad) ? :
>> -           check_state_pads(code->which, state) ? :
>> +           check_state(sd, state, code->which, code->pad, 
>> code->stream) ? :
>>            sd->ops->pad->enum_mbus_code(sd, state, code);
>> }
>>
>> @@ -214,7 +228,7 @@ static int call_enum_frame_size(struct v4l2_subdev 
>> *sd,
>>         return -EINVAL;
>>
>>     return check_which(fse->which) ? : check_pad(sd, fse->pad) ? :
>> -           check_state_pads(fse->which, state) ? :
>> +           check_state(sd, state, fse->which, fse->pad, fse->stream) ? :
>>            sd->ops->pad->enum_frame_size(sd, state, fse);
>> }
>>
>> @@ -249,7 +263,7 @@ static int call_enum_frame_interval(struct 
>> v4l2_subdev *sd,
>>         return -EINVAL;
>>
>>     return check_which(fie->which) ? : check_pad(sd, fie->pad) ? :
>> -           check_state_pads(fie->which, state) ? :
>> +           check_state(sd, state, fie->which, fie->pad, fie->stream) ? :
>>            sd->ops->pad->enum_frame_interval(sd, state, fie);
>> }
>>
>> @@ -261,7 +275,7 @@ static inline int check_selection(struct 
>> v4l2_subdev *sd,
>>         return -EINVAL;
>>
>>     return check_which(sel->which) ? : check_pad(sd, sel->pad) ? :
>> -           check_state_pads(sel->which, state);
>> +           check_state(sd, state, sel->which, sel->pad, sel->stream);
>> }
>>
>> static int call_get_selection(struct v4l2_subdev *sd,
>> @@ -1095,7 +1109,8 @@ __v4l2_subdev_state_alloc(struct v4l2_subdev 
>> *sd, const char *lock_name,
>>     else
>>         state->lock = &state->_lock;
>>
>> -    if (sd->entity.num_pads) {
>> +    /* Drivers that support streams do not need the legacy pad config */
>> +    if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS) && sd->entity.num_pads) {
>>         state->pads = kvcalloc(sd->entity.num_pads,
>>                        sizeof(*state->pads), GFP_KERNEL);
>>         if (!state->pads) {
>> @@ -1135,6 +1150,7 @@ void __v4l2_subdev_state_free(struct 
>> v4l2_subdev_state *state)
>>     mutex_destroy(&state->_lock);
>>
>>     kfree(state->routing.routes);
>> +    kvfree(state->stream_configs.configs);
>>     kvfree(state->pads);
>>     kfree(state);
>> }
>> @@ -1164,6 +1180,59 @@ EXPORT_SYMBOL_GPL(v4l2_subdev_cleanup);
>>
>> #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
>>
>> +static int
>> +v4l2_subdev_init_stream_configs(struct v4l2_subdev_stream_configs 
>> *stream_configs,
>> +                const struct v4l2_subdev_krouting *routing)
>> +{
>> +    struct v4l2_subdev_stream_configs new_configs = { 0 };
>> +    struct v4l2_subdev_route *route;
>> +    u32 format_idx = 0;
> I think you don't need both format_idx and idx,
> also, it can be 'int'

Yes, we can do with just a single variable.

I'll keep it as unsigned, as it's an index to an array. Signed doesn't 
make sense there.

  Tomi

