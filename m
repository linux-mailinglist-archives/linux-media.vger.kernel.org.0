Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E47755D940
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:21:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234260AbiF0KWa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jun 2022 06:22:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234255AbiF0KW3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jun 2022 06:22:29 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EE36264E
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 03:22:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 08F4ACE13B0
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 10:22:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C124C3411D;
        Mon, 27 Jun 2022 10:22:23 +0000 (UTC)
Message-ID: <acaaea9c-e98c-d589-35a9-610950a890fd@xs4all.nl>
Date:   Mon, 27 Jun 2022 12:22:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v8 3/6] staging: media: wave5: Add the v4l2 layer
Content-Language: en-US
To:     Nas Chung <nas.chung@chipsnmedia.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Robert Beckett <bob.beckett@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
References: <20220427114638.1638-1-nas.chung@chipsnmedia.com>
 <20220427114638.1638-4-nas.chung@chipsnmedia.com>
 <3e45e409-39de-de94-683a-81218f94095b@xs4all.nl>
 <SL2P216MB12469E4D85AB5A0D1CAB6CB7FBB99@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <SL2P216MB12469E4D85AB5A0D1CAB6CB7FBB99@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/06/2022 12:10, Nas Chung wrote:
> Hi, Hans.
> 
> Thanks for the feedback.
> 
> I have one question for g_volatile, please refer the below.
> 
>> -----Original Message-----
>> From: Hans Verkuil <hverkuil@xs4all.nl>
>> Sent: Wednesday, June 22, 2022 7:16 PM
>> To: Nas Chung <nas.chung@chipsnmedia.com>; linux-media@vger.kernel.org
>> Cc: Robert Beckett <bob.beckett@collabora.com>; Dafna Hirschfeld
>> <dafna.hirschfeld@collabora.com>
>> Subject: Re: [PATCH v8 3/6] staging: media: wave5: Add the v4l2 layer
>>
>> Hi Nas,
>>
>> Some review comments below:
>>

<snip>

>>> +static int wave5_vpu_dec_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
>>> +{
>>> +	struct vpu_instance *inst = wave5_ctrl_to_vpu_inst(ctrl);
>>> +
>>> +	dev_dbg(inst->dev->dev, "name : %s\n", ctrl->name);
>>> +
>>> +	switch (ctrl->id) {
>>> +	case V4L2_CID_MIN_BUFFERS_FOR_CAPTURE:
>>> +		if (inst->state != VPU_INST_STATE_NONE && inst->state !=
>> VPU_INST_STATE_OPEN)
>>> +			ctrl->val = inst->min_dst_frame_buf_count;
>>
>> This isn't a volatile control, it's just a regular control. Whenever
>> inst->min_dst_frame_buf_count is changed by the driver it should also
>> update this control by calling v4l2_ctrl_s_ctrl().
>>
>> Volatile controls are for cases where the hardware is autonomously
>> changing a value (e.g. the gain when auto gain is enabled).
>>
>> But here the value is controlled by the driver, so it's not volatile.
>>
> 
> v4l2_ctrl_s_ctrl() returns EINVAL error, when I change the value of V4L2_CID_MIN_BUFFERS_FOR_CAPTURE/V4L2_CID_MIN_BUFFERS_FOR_OUTPUT.
> Is it possible to change the value for READ_ONLY interface?

Yes. The vivid driver does the same thing for the read only integer control that it creates.

Could it be that you set it to an out-of-range value?

> 
> Actually, min_dst_frame_buf_count value is updated by driver based on HW return value.
> So, That's why I use the g_volatile function.

It's not the same thing: you know when the value changes and you just update it in the control.

A true volatile control will take a snapshot from the hardware whenever userspace reads it.

E.g. hardware that automatically changes the gain will do so without informing userspace when
the gain value changes, so when userspace tries to read the current gain control value it always
has to ask the hardware what that value is. The VOLATILE flag means that the control framework
can't return the cached value of the control, it always has to ask the hardware.

Regards,

	Hans
