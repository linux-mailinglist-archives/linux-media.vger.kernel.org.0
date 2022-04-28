Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EE26512D97
	for <lists+linux-media@lfdr.de>; Thu, 28 Apr 2022 09:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343684AbiD1IC6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Apr 2022 04:02:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244693AbiD1IC5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Apr 2022 04:02:57 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AEC220BCE;
        Thu, 28 Apr 2022 00:59:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 04672B82B32;
        Thu, 28 Apr 2022 07:59:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9609DC385A9;
        Thu, 28 Apr 2022 07:59:38 +0000 (UTC)
Message-ID: <cdc76135-f143-310e-6b54-6ce41b19f7e1@xs4all.nl>
Date:   Thu, 28 Apr 2022 09:59:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [EXT] Re: [PATCH] media: amphion: ensure the buffer count is not
 less than min_buffer
Content-Language: en-US
To:     Ming Qian <ming.qian@nxp.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
References: <20220322082859.9834-1-ming.qian@nxp.com>
 <3cdf47f5-ad38-44ca-1720-d70a96432045@xs4all.nl>
 <AM6PR04MB6341DAEF2FCC3CB48A7F7E19E7FA9@AM6PR04MB6341.eurprd04.prod.outlook.com>
 <ecd9f658-09f2-783e-8cc0-34d4b0a8ed26@xs4all.nl>
 <AM6PR04MB6341A433AC17C5A6C773245FE7FA9@AM6PR04MB6341.eurprd04.prod.outlook.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <AM6PR04MB6341A433AC17C5A6C773245FE7FA9@AM6PR04MB6341.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/04/2022 11:31, Ming Qian wrote:
>> From: Hans Verkuil [mailto:hverkuil-cisco@xs4all.nl]
>> Sent: Wednesday, April 27, 2022 3:25 PM
>> To: Ming Qian <ming.qian@nxp.com>; mchehab@kernel.org;
>> shawnguo@kernel.org
>> Cc: robh+dt@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
>> festevam@gmail.com; dl-linux-imx <linux-imx@nxp.com>; Aisheng Dong
>> <aisheng.dong@nxp.com>; linux-media@vger.kernel.org;
>> linux-kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org
>> Subject: Re: [EXT] Re: [PATCH] media: amphion: ensure the buffer count is not
>> less than min_buffer
>>
>> Caution: EXT Email
>>
>> On 27/04/2022 09:01, Ming Qian wrote:
>>>> From: Hans Verkuil [mailto:hverkuil-cisco@xs4all.nl]
>>>> Sent: Wednesday, April 27, 2022 2:38 PM
>>>> To: Ming Qian <ming.qian@nxp.com>; mchehab@kernel.org;
>>>> shawnguo@kernel.org
>>>> Cc: robh+dt@kernel.org; s.hauer@pengutronix.de;
>>>> kernel@pengutronix.de; festevam@gmail.com; dl-linux-imx
>>>> <linux-imx@nxp.com>; Aisheng Dong <aisheng.dong@nxp.com>;
>>>> linux-media@vger.kernel.org; linux-kernel@vger.kernel.org;
>>>> linux-arm-kernel@lists.infradead.org
>>>> Subject: [EXT] Re: [PATCH] media: amphion: ensure the buffer count is
>>>> not less than min_buffer
>>>>
>>>> Caution: EXT Email
>>>>
>>>> Hi Ming Qian,
>>>>
>>>> On 22/03/2022 09:28, Ming Qian wrote:
>>>>> the output buffer count should >= min_buffer_out the capture buffer
>>>>> count should >= min_buffer_cap
>>>>>
>>>>> Signed-off-by: Ming Qian <ming.qian@nxp.com>
>>>>> ---
>>>>>  drivers/media/platform/amphion/vpu_v4l2.c | 4 ++++
>>>>>  1 file changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/drivers/media/platform/amphion/vpu_v4l2.c
>>>>> b/drivers/media/platform/amphion/vpu_v4l2.c
>>>>> index cbf3315605a9..72a0544f4da3 100644
>>>>> --- a/drivers/media/platform/amphion/vpu_v4l2.c
>>>>> +++ b/drivers/media/platform/amphion/vpu_v4l2.c
>>>>> @@ -355,6 +355,10 @@ static int vpu_vb2_queue_setup(struct
>> vb2_queue
>>>> *vq,
>>>>>               return 0;
>>>>>       }
>>>>>
>>>>> +     if (V4L2_TYPE_IS_OUTPUT(vq->type))
>>>>> +             *buf_count = max_t(unsigned int, *buf_count,
>>>> inst->min_buffer_out);
>>>>> +     else
>>>>> +             *buf_count = max_t(unsigned int, *buf_count,
>>>>> + inst->min_buffer_cap);
>>>>
>>>> I noticed that min_buffer_out/cap is set to 2, but min_buffers_needed
>>>> is set to 1. Wouldn't it make more sense to set min_buffers_needed to
>>>> 2 as well?
>>>>
>>>> If you do that, then the vb2 core will already take care of ensuring
>>>> that the buf_count is adjusted.
>>>>
>>>> If you *do* have to do this manually, then you need to place the
>>>> whole if-else under 'if (!*num_planes) {', otherwise it will mess up
>>>> the VIDIOC_CREATE_BUFS ioctl. See the queue_setup in
>>>> include/media/videobuf2-core.h documentation for the sordid details.
>>>>
>>>> Regards,
>>>>
>>>>         Hans
>>>>
>>>
>>> Hi Hans,
>>>     I want to make the vpu start when 1 frames is queued, so I set the
>> min_buffers_needed to 1.
>>> And the min_buffer_cap may be changed when a source change event is
>> triggered. So in most case, it will be larger than 2.
>>
>> Ah, I only grepped for min_buffer_out, not _cap, so I missed that that one isn't
>> constant.
>>
>>>     I'll make a v2 patch that place the whole if-else under 'if (!*num_planes)
>> {'
>>
> Hi Hans,
>     I send a v2 patch. 
> 	But I think the v1 is OK, as the full code has already guaranteed the condition ` if (!*num_planes)`,
> 
> 	if (*plane_count) {
> 		... ...
> 		return 0;
>     }
>  	if (V4L2_TYPE_IS_OUTPUT(vq->type))
> 		*buf_count = max_t(unsigned int, *buf_count, inst->min_buffer_out);
> 	else
> 		*buf_count = max_t(unsigned int, *buf_count, inst->min_buffer_cap);
> 

You are correct, it wasn't visible in the patch that the *buf_count adjustments
only happened if *plane_count == 0.

I'm going back to v1.

Sorry for the confusion!

	Hans

> Ming
> 
>> Great, thank you!
>>
>>         Hans
>>
>>>     Thanks for your reminder
>>>
>>> Ming
>>>
>>>>>       *plane_count = cur_fmt->num_planes;
>>>>>       for (i = 0; i < cur_fmt->num_planes; i++)
>>>>>               psize[i] = cur_fmt->sizeimage[i];
>>>
> 

