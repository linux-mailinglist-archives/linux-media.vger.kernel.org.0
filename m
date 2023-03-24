Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67E306C7B24
	for <lists+linux-media@lfdr.de>; Fri, 24 Mar 2023 10:22:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231896AbjCXJVz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Mar 2023 05:21:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231722AbjCXJVy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Mar 2023 05:21:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F222023669;
        Fri, 24 Mar 2023 02:21:25 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63854A58;
        Fri, 24 Mar 2023 10:21:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679649683;
        bh=je3oKA+4p3KIg1mbHmMQuGZyaXYfCtyh+Oyy51jWYv8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=tteusz/E77jrsLui0UQSk1szaQqGZ8bjRoqv8eKhzZbYrHtSfAj/UTbCnt19fq0li
         phd2mcZu1C/iwwQd7xc1soQMMLE+l/lJhXYngwU7EnW/+Xe34tF4K4Dj0GLvJaty2W
         sEDtyYC4I4Czw95zsKQxtXyAc1juXgLsXf7jBqEA=
Message-ID: <79c319ab-1d65-f3cf-473c-ca4cd502c1f9@ideasonboard.com>
Date:   Fri, 24 Mar 2023 09:21:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/8] usb: gadget: uvc: implement s/g_output ioctl
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Michael Tretter <m.tretter@pengutronix.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de, Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20230323-uvc-gadget-cleanup-v1-0-e41f0c5d9d8e@pengutronix.de>
 <20230323-uvc-gadget-cleanup-v1-3-e41f0c5d9d8e@pengutronix.de>
 <20230324092021.GC18895@pendragon.ideasonboard.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20230324092021.GC18895@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 24/03/2023 09:20, Laurent Pinchart wrote:
> Hi Michael,
>
> (CC'ing Hans)
>
> Thank you for the patch.
>
> On Thu, Mar 23, 2023 at 12:41:11PM +0100, Michael Tretter wrote:
>> V4L2 OUTPUT devices should implement ENUM_OUTPUT, G_OUTPUT, and
>> S_OUTPUT. The UVC gadget provides only a single output. Therefore, allow
>> only a single output 0.
>>
>> According to the documentation, "_TYPE_ANALOG" is historical and should
>> be read as "_TYPE_VIDEO".
> I think v4l2-compliance should be fixed to not require those ioctls. As
> this patch clearly shows, they're useless :-)


+1 for this vote

>
>> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
>> ---
>>   drivers/usb/gadget/function/uvc_v4l2.c | 28 ++++++++++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
>> index 13c7ba06f994..4b8bf94e06fc 100644
>> --- a/drivers/usb/gadget/function/uvc_v4l2.c
>> +++ b/drivers/usb/gadget/function/uvc_v4l2.c
>> @@ -377,6 +377,31 @@ uvc_v4l2_enum_format(struct file *file, void *fh, struct v4l2_fmtdesc *f)
>>   	return 0;
>>   }
>>   
>> +static int
>> +uvc_v4l2_enum_output(struct file *file, void *priv_fh, struct v4l2_output *out)
>> +{
>> +	if (out->index != 0)
>> +		return -EINVAL;
>> +
>> +	out->type = V4L2_OUTPUT_TYPE_ANALOG;
>> +	snprintf(out->name, sizeof(out->name), "UVC");
>> +
>> +	return 0;
>> +}
>> +
>> +static int
>> +uvc_v4l2_g_output(struct file *file, void *priv_fh, unsigned int *i)
>> +{
>> +	*i = 0;
>> +	return 0;
>> +}
>> +
>> +static int
>> +uvc_v4l2_s_output(struct file *file, void *priv_fh, unsigned int i)
>> +{
>> +	return i ? -EINVAL : 0;
>> +}
>> +
>>   static int
>>   uvc_v4l2_reqbufs(struct file *file, void *fh, struct v4l2_requestbuffers *b)
>>   {
>> @@ -547,6 +572,9 @@ const struct v4l2_ioctl_ops uvc_v4l2_ioctl_ops = {
>>   	.vidioc_enum_frameintervals = uvc_v4l2_enum_frameintervals,
>>   	.vidioc_enum_framesizes = uvc_v4l2_enum_framesizes,
>>   	.vidioc_enum_fmt_vid_out = uvc_v4l2_enum_format,
>> +	.vidioc_enum_output = uvc_v4l2_enum_output,
>> +	.vidioc_g_output = uvc_v4l2_g_output,
>> +	.vidioc_s_output = uvc_v4l2_s_output,
>>   	.vidioc_reqbufs = uvc_v4l2_reqbufs,
>>   	.vidioc_querybuf = uvc_v4l2_querybuf,
>>   	.vidioc_qbuf = uvc_v4l2_qbuf,
