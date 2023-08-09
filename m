Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 652D077594D
	for <lists+linux-media@lfdr.de>; Wed,  9 Aug 2023 12:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232820AbjHIK7S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Aug 2023 06:59:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232815AbjHIK7R (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Aug 2023 06:59:17 -0400
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC1F62100
        for <linux-media@vger.kernel.org>; Wed,  9 Aug 2023 03:59:15 -0700 (PDT)
X-KPN-MessageId: c2624ad9-36a3-11ee-849a-005056abad63
Received: from smtp.kpnmail.nl (unknown [10.31.155.37])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id c2624ad9-36a3-11ee-849a-005056abad63;
        Wed, 09 Aug 2023 12:59:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:from:to:subject:mime-version:date:message-id;
        bh=tzi/Khrm1mjD22uZkcujIBjpTKTnnvixSuO83y7cu8w=;
        b=mxcmc+ytDZSCEAowvdY00pIqlkvTk7nHAavO65hA0OQlwDtX9uyauXPi7Pd3kxcGsya71u149dxs0
         e8BMDJsEMRkHnnH4DCdK3WcdwLcFjRfxBEDBxQOje68TbHx0quOY6dGhsmQa8YrVMXvd6HnRIUxEK8
         fN8sb3a/JcYdianit7LAEkQ7nzNbzNZwQkL76oDW24FBE5QWgwPfBBNihg9pOWZ55CcnxtkW4GoUAm
         aeLa2k3ayc35jBeOl3ZaebTeg3j9aFh3L8hw01GuWU/fv4AXZ/00X5fU1dYB3XTZfnEPEd2SLLE8pz
         zAdCcTYr7O0uo0gHzT26ZSMqiyAV0Bg==
X-KPN-MID: 33|VA1VoYHUXxKx8X+Zrea6gotqrTZHKJbTCMmdRr82kXQSWuLSjHsH25m0RL8vJXy
 EICnXikRhM4iosRQjGWJS6blfF2GPad5w0lLXedyhvxM=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|G3Sms/njorebu0kmT+rWUkiL/yokX4rhYJcgknHZwVNM+W694S25aZ2q03MLgbw
 6VxfGjoQOL5DY5Tjel3Tlag==
X-Originating-IP: 173.38.220.44
Received: from [10.47.77.214] (unknown [173.38.220.44])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id c6b3589f-36a3-11ee-8a21-005056ab1411;
        Wed, 09 Aug 2023 12:59:14 +0200 (CEST)
Message-ID: <caefa8ad-7ae4-6ef0-e247-fcc5d49d6c54@xs4all.nl>
Date:   Wed, 9 Aug 2023 12:59:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v11 06/11] v4l2-ctrls: add support for
 V4L2_CTRL_WHICH_MIN/MAX_VAL
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Yunke Cao <yunkec@google.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
References: <20230426082923.132909-1-yunkec@google.com>
 <20230426082923.132909-7-yunkec@google.com>
 <da90bdb2-45f4-2ffe-2d62-1190b43fccd5@xs4all.nl>
 <CANqU6Fds77JBjkq5epiL5iyEBgC-goVAXXfFGK_-fnZx04z8WQ@mail.gmail.com>
 <04a11648-fc00-bb29-774d-d1ba0f199872@xs4all.nl>
 <20230809101535.GA5737@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230809101535.GA5737@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/9/23 12:15, Laurent Pinchart wrote:
> Hello,
> 
> On Wed, Aug 09, 2023 at 10:36:16AM +0200, Hans Verkuil wrote:
>> On 8/9/23 09:34, Yunke Cao wrote:
>>> On Wed, Aug 9, 2023 at 4:05 PM Hans Verkuil wrote:
>>>> On 26/04/2023 10:29, Yunke Cao wrote:
>>>>> From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>>>>
>>>>> Add the capability of retrieving the min and max values of a
>>>>> compound control.
>>>>>
>>>>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>>>> Signed-off-by: Yunke Cao <yunkec@google.com>
>>>>> ---
>>>>> Changelog since v10:
>>>>> - No change.
>>>>> Changelog since v9:
>>>>> - No change.
>>>>> Changelog since v8:
>>>>> - Return ENODATA when min/max is not implemented. Document this behavior.
>>>>> - Created a shared helper function __v4l2_ctrl_type_op_init that takes "which"
>>>>>   as a parameter. Call it in def, min and max operations.
>>>>> Changelog since v7:
>>>>> - Document that the definition of the min/max are provided by compound controls
>>>>>   are defined in control documentation.
>>>>> - Return error, instead of zeroed memory for v4l2_ctrl_ptr_create(NULL).
>>>>>
>>>>> git am from https://lore.kernel.org/all/20191119113457.57833-3-hverkuil-cisco@xs4all.nl/
>>>>> - Fixed some merge conflits.
>>>>> - Fixed the build error in drivers/media/platform/qcom/venus.
>>>>>
>>>>>  .../media/v4l/vidioc-g-ext-ctrls.rst          |  11 +-
>>>>>  .../media/videodev2.h.rst.exceptions          |   2 +
>>>>>  drivers/media/i2c/imx214.c                    |   5 +-
>>>>>  .../media/platform/qcom/venus/venc_ctrls.c    |   9 +-
>>>>>  drivers/media/v4l2-core/v4l2-ctrls-api.c      |  57 +++++--
>>>>>  drivers/media/v4l2-core/v4l2-ctrls-core.c     | 156 +++++++++++++++---
>>>>>  drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
>>>>>  include/media/v4l2-ctrls.h                    |  34 +++-
>>>>>  include/uapi/linux/videodev2.h                |   2 +
>>>>>  9 files changed, 236 insertions(+), 44 deletions(-)
>>>>>
>>>>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
>>>>> index 927ef397f1ce..1cc21ee229aa 100644
>>>>> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
>>>>> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
>>>>> @@ -304,14 +304,21 @@ still cause this situation.
>>>>>        - Which value of the control to get/set/try.
>>>>>      * - :cspan:`2` ``V4L2_CTRL_WHICH_CUR_VAL`` will return the current value of
>>>>>       the control, ``V4L2_CTRL_WHICH_DEF_VAL`` will return the default
>>>>> +     value of the control, ``V4L2_CTRL_WHICH_MIN_VAL`` will return the minimum
>>>>> +     value of the control, ``V4L2_CTRL_WHICH_MAX_VAL`` will return the maximum
>>>>>       value of the control and ``V4L2_CTRL_WHICH_REQUEST_VAL`` indicates that
>>>>>       these controls have to be retrieved from a request or tried/set for
>>>>>       a request. In the latter case the ``request_fd`` field contains the
>>>>>       file descriptor of the request that should be used. If the device
>>>>>       does not support requests, then ``EACCES`` will be returned.
>>>>>
>>>>> -     When using ``V4L2_CTRL_WHICH_DEF_VAL`` be aware that you can only
>>>>> -     get the default value of the control, you cannot set or try it.
>>>>> +     When using ``V4L2_CTRL_WHICH_DEF_VAL``, ``V4L2_CTRL_WHICH_MIN_VAL``
>>>>> +     or ``V4L2_CTRL_WHICH_MAX_VAL`` be aware that you can only get the
>>>>> +     default/minimum/maximum value of the control, you cannot set or try it.
>>>>> +     The definition of minimum/maximum values for compound types are provided by
>>>>> +     the control documentation. If the control documentation does not
>>>>> +     document the meaning of minimum/maximum value, then it is not supported.
>>>>> +     Querying its minmimum/maximum value will result in -ENODATA.
>>>>
>>>> typo: minmimum -> minimum
>>>>
>>>> That last line is a bit ambiguous, I suggest this:
>>>>
>>>> If  ``V4L2_CTRL_WHICH_MIN_VAL`` and ``V4L2_CTRL_WHICH_MAX_VAL`` are not supported,
>>>> then querying the minimum or maximum value will result in -ENODATA.
>>>
>>> This sounds clearer indeed! I will change it in the next version.
>>
>> Thinking some more about this, I believe it would be better to add a flag
>> indicating WHICH_MIN/MAX support. I never like relying on an error to
>> discover a feature. You still need this error, but in addition we need a new
>> flag:
>>
>> #define V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX 0x1000
>>
>> that is set for any control that supports this.
> 
> I think the intent here was to indicate that drivers must return
> -ENODATA for V4L2_CTRL_WHICH_MIN_VAL and V4L2_CTRL_WHICH_MAX_VAL if the
> control's documentation doesn't specify the meaning of minimum and
> maximum for a control. A flag to indicate support for this new API is
> likely a good idea, but the documentation here should still clearly
> indicate that only controls that have defined minimum and maximum
> concepts in the API documentation can implement this API.

This flag is specific to the control ID: so if set, then you can get
the min/max value using V4L2_CTRL_WHICH_MIN/MAX_VAL for that control ID.

This flag must be set for any control that uses the s64 minimum/maximum
fields in struct v4l2_ext_query_ctrl, and for any compound control that
has explicit support for MIN/MAX_VAL (the UVC rectangle control in this
case).

Regards,

	Hans


