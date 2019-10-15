Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FDDED6FB2
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2019 08:47:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727260AbfJOGr3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Oct 2019 02:47:29 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:59389 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726052AbfJOGr3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Oct 2019 02:47:29 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id KGc7iNvFRop0AKGcBiirTf; Tue, 15 Oct 2019 08:47:27 +0200
Subject: Re: [PATCHv6 4/3] v4l2-dev: disable frequency and tuner ioctls for
 touch
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Vandana BN <bnvandana@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20191014084021.54191-1-hverkuil-cisco@xs4all.nl>
 <20191014084021.54191-4-hverkuil-cisco@xs4all.nl>
 <44ce4b09-9452-37d5-f7c4-26a26b4adfd7@xs4all.nl>
 <20191014214331.GH23442@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <0c6762e5-bd86-69a4-0ab5-8c2ec8a2a20f@xs4all.nl>
Date:   Tue, 15 Oct 2019 08:47:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191014214331.GH23442@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKaPIlswbsa1u6hmdbcGECnJ3LLlKcDxwe1CedYpC9Fe537C621D0oAQG0ooR5Hh664wMl1YkA2OZR4xRp2dtX1M2yEccYRLJ7qvys7Ey2Ql4nkYlEv2
 gGn/YDTaoxhjXaTpdp1tqFCWYDHeAGDUww+ChAsYYr8SNSjPQa2qhRgNH7nF0ZtI+D99434v/mXD/T1KTx27S5oL5kXCc/pcYf9QbmYFXQAfDiNGNSeL5yHJ
 TpV6JNQw39rha/xpBGdcovQNHeCWjn3MGUwy4Wexo4H6pAhY3OM726T4LKUDVJMCC70sm+XaCRFLk4N3Wfp6yw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/14/19 11:43 PM, Laurent Pinchart wrote:
> Hi Hans,
> 
> Thank you for the patch.
> 
> On Mon, Oct 14, 2019 at 02:01:05PM +0200, Hans Verkuil wrote:
>> Touch devices have obviously no tuner, so don't attempt to enable those ioctls
>> for such devices.
> 
> Shouldn't this be disabled for pure metadata devices (is_meta &&
> !is_vid) too ?

No. It doesn't matter for this whether metadata is a separate or combined device,
in both cases a meta device can be connected to a source that is controlled via
a tuner.

Regards,

	Hans

> 
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
>> index cec588b04711..da42d172714a 100644
>> --- a/drivers/media/v4l2-core/v4l2-dev.c
>> +++ b/drivers/media/v4l2-core/v4l2-dev.c
>> @@ -581,8 +581,10 @@ static void determine_valid_ioctls(struct video_device *vdev)
>>  		set_bit(_IOC_NR(VIDIOC_TRY_EXT_CTRLS), valid_ioctls);
>>  	if (vdev->ctrl_handler || ops->vidioc_querymenu)
>>  		set_bit(_IOC_NR(VIDIOC_QUERYMENU), valid_ioctls);
>> -	SET_VALID_IOCTL(ops, VIDIOC_G_FREQUENCY, vidioc_g_frequency);
>> -	SET_VALID_IOCTL(ops, VIDIOC_S_FREQUENCY, vidioc_s_frequency);
>> +	if (!is_tch) {
>> +		SET_VALID_IOCTL(ops, VIDIOC_G_FREQUENCY, vidioc_g_frequency);
>> +		SET_VALID_IOCTL(ops, VIDIOC_S_FREQUENCY, vidioc_s_frequency);
>> +	}
>>  	SET_VALID_IOCTL(ops, VIDIOC_LOG_STATUS, vidioc_log_status);
>>  #ifdef CONFIG_VIDEO_ADV_DEBUG
>>  	set_bit(_IOC_NR(VIDIOC_DBG_G_CHIP_INFO), valid_ioctls);
>> @@ -754,7 +756,7 @@ static void determine_valid_ioctls(struct video_device *vdev)
>>  		SET_VALID_IOCTL(ops, VIDIOC_G_MODULATOR, vidioc_g_modulator);
>>  		SET_VALID_IOCTL(ops, VIDIOC_S_MODULATOR, vidioc_s_modulator);
>>  	}
>> -	if (is_rx) {
>> +	if (is_rx && !is_tch) {
>>  		/* receiver only ioctls */
>>  		SET_VALID_IOCTL(ops, VIDIOC_G_TUNER, vidioc_g_tuner);
>>  		SET_VALID_IOCTL(ops, VIDIOC_S_TUNER, vidioc_s_tuner);
>>
> 

