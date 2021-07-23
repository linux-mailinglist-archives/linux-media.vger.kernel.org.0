Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A53723D39E1
	for <lists+linux-media@lfdr.de>; Fri, 23 Jul 2021 14:01:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234451AbhGWLUL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Jul 2021 07:20:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234231AbhGWLUK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Jul 2021 07:20:10 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05BE9C061575;
        Fri, 23 Jul 2021 05:00:42 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id n21so651156wmq.5;
        Fri, 23 Jul 2021 05:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=v4erG6x25Y7gUjmB3e7srmQPrlXmV2oyTDL7qJ+Pfus=;
        b=qj8OaaXXnfWlAB9ryQaO7oWiO37Y1IDr/qsDIsKB1j6DbZhmEFFH3PfTg397o5Qdb2
         rBXvMyEgSKqQ2FsqCm4KAQbo4pcRBW+3hP059tAT0SVNioYrg97zZVxgDGNcHPl65AGe
         x1CERYnsMJLevoPJZCDeRXUKfa82KdgG8vNs+4Vk41XyuDhOT2hsYD3hjHFEk2TESsvJ
         jn4gd6QECcoWyVqhiRlUG822XV1gCQ9xCbky1ATP/cXQtt7/2wWoL0haBmIfXy9vmkVy
         mUmWCM2rV3LGwMeLsO9z1f3ttR6fggYkPuaP3eIq5G6gddCvOOEhIkdJqr3qGM2k9t5K
         830g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=v4erG6x25Y7gUjmB3e7srmQPrlXmV2oyTDL7qJ+Pfus=;
        b=PAtf5DVocGnvMoEAOmAsWZzIswmgFloYqe0NtY01tvhpxeK1edN3IZqrmoPPpKshr1
         grocPQu70qiFgFAK9fFbT+y1xQBBftqizS8c05TnQ6jF9QmdIT5mEQrDgEVSnBIr/xRW
         1qNqKhmgYvvJUbbD7Guvy31HoomXRxUEbIGUTRcEnb6bpwX1enB5OKZiPbQYXrjiIDij
         VXs7+sZMg4NQLglwxI2AaMxwCRfFmA7MSpLX9xfdBL4yrCaDyC7HDsLhCCyF2+iJaVOx
         dFj+LbXLbG2YzRRM2uCeanfqj6YPexfiBU9Zo3YV2ro388/uJnarmaQE9bJLw+ImraGH
         84Eg==
X-Gm-Message-State: AOAM5314APtjy9K3NE+MGSWgXg/yRhda15xRcq2URFZiv4oJr81Dq9hm
        6nuiYPQ2kzfGYt7uHAk7YRw=
X-Google-Smtp-Source: ABdhPJzp4NI21twle20NQC/6wn+ZY0ScTi7ScDf4N2GjW5UWCDPveWlpk59GwbmmTcfK3ATcIwlatQ==
X-Received: by 2002:a05:600c:3509:: with SMTP id h9mr4153066wmq.81.1627041641575;
        Fri, 23 Jul 2021 05:00:41 -0700 (PDT)
Received: from [192.168.1.211] ([2.29.20.106])
        by smtp.gmail.com with ESMTPSA id r19sm34668685wrr.32.2021.07.23.05.00.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jul 2021 05:00:41 -0700 (PDT)
Subject: Re: [PATCH 06/13] media: i2c: Switch control to
 V4L2_CID_ANALOGUE_GAIN
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yang Li <yang.lee@linux.alibaba.com>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Colin Ian King <colin.king@canonical.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
References: <20210722203407.3588046-1-djrscally@gmail.com>
 <20210722203407.3588046-7-djrscally@gmail.com> <YPp2X71VoMV4O+io@aptenodytes>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <b7a32257-45ce-517f-ece1-63a27f768dc6@gmail.com>
Date:   Fri, 23 Jul 2021 13:00:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPp2X71VoMV4O+io@aptenodytes>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul

On 23/07/2021 08:57, Paul Kocialkowski wrote:
> Hi,
>
> On Thu 22 Jul 21, 21:34, Daniel Scally wrote:
>> The V4L2_CID_GAIN control for this driver configures registers that
>> the datasheet specifies as analogue gain. Switch the control's ID
>> to V4L2_CID_ANALOGUE_GAIN.
> I had some doubts about this when writing the driver because it's called
> "AEC gain" but it seems that you're right. The datasheet also defines
> 0x350a and 0x350b as digital gain (which are unused by the driver).
>
> This is:
> Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>


Thanks - yeah it took me a while to be sure too. Particularly confusing
because it's called "AEC gain" in a section headed "Manual exposure /
gain compensation"...they do like to make the datasheets clear as mud
sometimes.

>
> Cheers,
>
> Paul
>
>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>> ---
>>  drivers/media/i2c/ov8865.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
>> index c012f5cb11ab..09558a3342dd 100644
>> --- a/drivers/media/i2c/ov8865.c
>> +++ b/drivers/media/i2c/ov8865.c
>> @@ -2137,7 +2137,7 @@ static int ov8865_exposure_configure(struct ov8865_sensor *sensor, u32 exposure)
>>  
>>  /* Gain */
>>  
>> -static int ov8865_gain_configure(struct ov8865_sensor *sensor, u32 gain)
>> +static int ov8865_analog_gain_configure(struct ov8865_sensor *sensor, u32 gain)
>>  {
>>  	int ret;
>>  
>> @@ -2447,8 +2447,8 @@ static int ov8865_s_ctrl(struct v4l2_ctrl *ctrl)
>>  		if (ret)
>>  			return ret;
>>  		break;
>> -	case V4L2_CID_GAIN:
>> -		ret = ov8865_gain_configure(sensor, ctrl->val);
>> +	case V4L2_CID_ANALOGUE_GAIN:
>> +		ret = ov8865_analog_gain_configure(sensor, ctrl->val);
>>  		if (ret)
>>  			return ret;
>>  		break;
>> @@ -2493,7 +2493,7 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
>>  
>>  	/* Gain */
>>  
>> -	v4l2_ctrl_new_std(handler, ops, V4L2_CID_GAIN, 128, 8191, 128, 128);
>> +	v4l2_ctrl_new_std(handler, ops, V4L2_CID_ANALOGUE_GAIN, 128, 8191, 128, 128);
>>  
>>  	/* White Balance */
>>  
>> -- 
>> 2.25.1
>>
