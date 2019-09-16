Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BEB9B372C
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2019 11:31:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731973AbfIPJb3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Sep 2019 05:31:29 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:38357 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725850AbfIPJb3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Sep 2019 05:31:29 -0400
Received: from [IPv6:2001:983:e9a7:1:3124:3fc9:5634:2d8] ([IPv6:2001:983:e9a7:1:3124:3fc9:5634:2d8])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 9nLyiUeod8SjN9nLziWhpX; Mon, 16 Sep 2019 11:31:27 +0200
Subject: Re: [PATCH 1/2] videodev2.h: add macros to print a fourcc
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
References: <20190916090047.122078-1-hverkuil-cisco@xs4all.nl>
 <20190916090047.122078-2-hverkuil-cisco@xs4all.nl>
 <20190916092642.GM843@valkosipuli.retiisi.org.uk>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <5c60c178-00db-96dd-f356-1704aa454d84@xs4all.nl>
Date:   Mon, 16 Sep 2019 11:31:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190916092642.GM843@valkosipuli.retiisi.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKUIezu8gBauBYY69SHyrl/xlUWnOGCEgqAVgHCCn90rWYcc9mdWGazoo3K/Cu2+O+Ki7hkdGx/pQwzK4RhlJ0pktkObjdSLa/c2zS+1nC3dz9bmBe2Q
 kjwjjZj9452IFsy0j3f33K+J24atgD5KEoTbWSkYYFPeLd7Ii11inxBCLQ36sEiHLG4NWCnJs/+KoQvD0G0lHE0YV11cR7W89Fql+Cs74QFeDR0SmhShYtHN
 YlgCXxXneeXOk6BNpSPUxxW922S0YnF+zlClcVb4kc2OoYoVolFzcudTn5IZ0A3XopLlgWDgo/R1Ar5VrDSasiOXWFGBJeVbROmApCcOXNoXddPegsQrlXvk
 ZWAjcpf0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/16/19 11:26 AM, Sakari Ailus wrote:
> Hi Hans,
> 
> On Mon, Sep 16, 2019 at 11:00:46AM +0200, Hans Verkuil wrote:
>> Add new macros V4L2_FOURCC_CONV and V4L2_FOURCC_ARGS for use
>> in code that prints a fourcc. These macros can be used in both
>> kernel and userspace.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> Suggested-by: Sakari Ailus <sakari.ailus@iki.fi>
>> ---
>>  include/uapi/linux/videodev2.h | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index 530638dffd93..7a34eb93437e 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -82,6 +82,19 @@
>>  	((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
>>  #define v4l2_fourcc_be(a, b, c, d)	(v4l2_fourcc(a, b, c, d) | (1U << 31))
>>  
>> +/*
>> + * Helper macros to print a fourcc in a standard format. E.g.:
>> + *
>> + * printf("fourcc is " V4L2_FOURCC_CONV "\n", V4L2_FOURCC_ARGS(fourcc));
>> + *
>> + * Note that V4L2_FOURCC_ARGS reuses fourcc, so this can't be an
>> + * expression with side-effects.
>> + */
>> +#define V4L2_FOURCC_CONV "%c%c%c%c%s"
>> +#define V4L2_FOURCC_ARGS(fourcc) \
>> +	(fourcc) & 0x7f, ((fourcc) >> 8) & 0x7f, ((fourcc) >> 16) & 0x7f, \
>> +	((fourcc) >> 24) & 0x7f, ((fourcc) & (1U << 31) ? "-BE" : "")
>> +
>>  /*
>>   *	E N U M S
>>   */
> 
> KernelDoc comments would be nice. Such as in here:
> 
> <URL:https://patchwork.linuxtv.org/patch/48372/>

I was searching for old patches with the string 'fourcc', not '4cc',
so that's why I missed your patch.

I'll respin with that (slightly updated) patch.

Regards,

	Hans

> 
> I'm fine with either patch though.
> 

