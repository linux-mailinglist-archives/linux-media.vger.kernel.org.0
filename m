Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 859D06C7BAC
	for <lists+linux-media@lfdr.de>; Fri, 24 Mar 2023 10:40:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231896AbjCXJkM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Mar 2023 05:40:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232116AbjCXJjs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Mar 2023 05:39:48 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D8C023861;
        Fri, 24 Mar 2023 02:39:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A2822B81E21;
        Fri, 24 Mar 2023 09:39:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9B94C433EF;
        Fri, 24 Mar 2023 09:39:14 +0000 (UTC)
Message-ID: <caa72a5c-a40f-e5e1-84c5-44d376cbe87c@xs4all.nl>
Date:   Fri, 24 Mar 2023 10:39:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/8] usb: gadget: uvc: implement s/g_output ioctl
Content-Language: en-US
To:     Dan Scally <dan.scally@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Michael Tretter <m.tretter@pengutronix.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de
References: <20230323-uvc-gadget-cleanup-v1-0-e41f0c5d9d8e@pengutronix.de>
 <20230323-uvc-gadget-cleanup-v1-3-e41f0c5d9d8e@pengutronix.de>
 <20230324092021.GC18895@pendragon.ideasonboard.com>
 <79c319ab-1d65-f3cf-473c-ca4cd502c1f9@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <79c319ab-1d65-f3cf-473c-ca4cd502c1f9@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/03/2023 10:21, Dan Scally wrote:
> 
> On 24/03/2023 09:20, Laurent Pinchart wrote:
>> Hi Michael,
>>
>> (CC'ing Hans)
>>
>> Thank you for the patch.
>>
>> On Thu, Mar 23, 2023 at 12:41:11PM +0100, Michael Tretter wrote:
>>> V4L2 OUTPUT devices should implement ENUM_OUTPUT, G_OUTPUT, and
>>> S_OUTPUT. The UVC gadget provides only a single output. Therefore, allow
>>> only a single output 0.
>>>
>>> According to the documentation, "_TYPE_ANALOG" is historical and should
>>> be read as "_TYPE_VIDEO".
>> I think v4l2-compliance should be fixed to not require those ioctls. As
>> this patch clearly shows, they're useless :-)

They are not useless. An application doesn't know how many outputs there are,
and what type they are. Just because there is only one output, doesn't mean
you can skip this.

The application also has to know the capabilities of the output.

Now, it can be useful to add some helper functions for this to v4l2-common.c,
at least for g/s_output.

Regards,

	Hans

> 
> 
> +1 for this vote
> 
>>
>>> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
>>> ---
>>>   drivers/usb/gadget/function/uvc_v4l2.c | 28 ++++++++++++++++++++++++++++
>>>   1 file changed, 28 insertions(+)
>>>
>>> diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
>>> index 13c7ba06f994..4b8bf94e06fc 100644
>>> --- a/drivers/usb/gadget/function/uvc_v4l2.c
>>> +++ b/drivers/usb/gadget/function/uvc_v4l2.c
>>> @@ -377,6 +377,31 @@ uvc_v4l2_enum_format(struct file *file, void *fh, struct v4l2_fmtdesc *f)
>>>       return 0;
>>>   }
>>>   +static int
>>> +uvc_v4l2_enum_output(struct file *file, void *priv_fh, struct v4l2_output *out)
>>> +{
>>> +    if (out->index != 0)
>>> +        return -EINVAL;
>>> +
>>> +    out->type = V4L2_OUTPUT_TYPE_ANALOG;
>>> +    snprintf(out->name, sizeof(out->name), "UVC");
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int
>>> +uvc_v4l2_g_output(struct file *file, void *priv_fh, unsigned int *i)
>>> +{
>>> +    *i = 0;
>>> +    return 0;
>>> +}
>>> +
>>> +static int
>>> +uvc_v4l2_s_output(struct file *file, void *priv_fh, unsigned int i)
>>> +{
>>> +    return i ? -EINVAL : 0;
>>> +}
>>> +
>>>   static int
>>>   uvc_v4l2_reqbufs(struct file *file, void *fh, struct v4l2_requestbuffers *b)
>>>   {
>>> @@ -547,6 +572,9 @@ const struct v4l2_ioctl_ops uvc_v4l2_ioctl_ops = {
>>>       .vidioc_enum_frameintervals = uvc_v4l2_enum_frameintervals,
>>>       .vidioc_enum_framesizes = uvc_v4l2_enum_framesizes,
>>>       .vidioc_enum_fmt_vid_out = uvc_v4l2_enum_format,
>>> +    .vidioc_enum_output = uvc_v4l2_enum_output,
>>> +    .vidioc_g_output = uvc_v4l2_g_output,
>>> +    .vidioc_s_output = uvc_v4l2_s_output,
>>>       .vidioc_reqbufs = uvc_v4l2_reqbufs,
>>>       .vidioc_querybuf = uvc_v4l2_querybuf,
>>>       .vidioc_qbuf = uvc_v4l2_qbuf,

