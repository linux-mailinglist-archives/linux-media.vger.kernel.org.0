Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9591B5EA882
	for <lists+linux-media@lfdr.de>; Mon, 26 Sep 2022 16:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234673AbiIZOfc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Sep 2022 10:35:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234674AbiIZOeh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Sep 2022 10:34:37 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6DBE6746A
        for <linux-media@vger.kernel.org>; Mon, 26 Sep 2022 05:52:48 -0700 (PDT)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28Q9Q7VB008220;
        Mon, 26 Sep 2022 14:52:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=X7a3/vwHNL6Pq7FW4Dr7fc4sBJSak1ubgvS+CpqZ5Ag=;
 b=KL3mxTFVyPPohGGjWBD5g5GOsIkrYhpW/6KuIlmBSAVlZFtAJI0M1SN2SMj8bpFl65KJ
 3NTjGevD9l/ONFfEkENLpr3nuDTM/2yOlr51cCWSxVpdVfILfQPvz0tHn5uDjhhliK9D
 SshfKayPd8UJGJ44+ZgLsDZn9jtlLDish7xkZds6HaeteQkxcUhkobb24KAhCVZKVjJ1
 ZclYuUa9tlFH36BuS1dkEdGtB51Fr624MrKQ2qUWLyyKlXCV4UKg9oxXGOWodJOEB0/u
 5dJ1PD65uxkNO1oLQJItdJ3jfoRIMf91Iqq9YR2LNw5qUa2Y+B1EDVDuAaWOeW5C+P7z 7w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jsqam338x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 26 Sep 2022 14:52:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6300910002A;
        Mon, 26 Sep 2022 14:52:42 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5666622A6D5;
        Mon, 26 Sep 2022 14:52:42 +0200 (CEST)
Received: from [10.129.167.120] (10.75.127.50) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 26 Sep
 2022 14:52:42 +0200
Message-ID: <0f7468ed-6806-131a-71a6-d6f9b923f958@foss.st.com>
Date:   Mon, 26 Sep 2022 14:52:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 5/5] media: i2c: Add driver for ST VGXY61 camera sensor
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     <linux-media@vger.kernel.org>, <alain.volmat@foss.st.com>,
        <hugues.fruchet@foss.st.com>, <sylvain.petinot@foss.st.com>,
        <dave.stevenson@raspberrypi.com>,
        <laurent.pinchart@ideasonboard.com>,
        <kieran.bingham@ideasonboard.com>
References: <20220512074037.3829926-1-benjamin.mugnier@foss.st.com>
 <20220512074037.3829926-6-benjamin.mugnier@foss.st.com>
 <YwNUqE0f0hSOh0ul@paasikivi.fi.intel.com>
 <52dc65fd-6120-286c-1314-d7af1e8360df@foss.st.com>
 <YzA8QEBXmwlwpHqV@paasikivi.fi.intel.com>
 <0e00e072-93e7-66b2-446e-ea793c38bd0c@foss.st.com>
 <YzF0H/tNFgeSGlsU@paasikivi.fi.intel.com>
From:   Benjamin MUGNIER <benjamin.mugnier@foss.st.com>
In-Reply-To: <YzF0H/tNFgeSGlsU@paasikivi.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_08,2022-09-22_02,2022-06-22_01
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 9/26/22 11:42, Sakari Ailus wrote:
[...]
>>>>>> +	ctrl = v4l2_ctrl_new_int_menu(hdl, ops, V4L2_CID_LINK_FREQ, ARRAY_SIZE(link_freq) - 1, 0,
>>>>>> +				      link_freq);
>>>>>> +	ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>>>>> +	/* Custom controls */
>>>>>> +	v4l2_ctrl_new_custom(hdl, &vgxy61_hdr_ctrl, NULL);
>>>>>> +	/* Keep a pointer to these controls as we need to update them when setting the format */
>>>>>> +	sensor->pixel_rate_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_PIXEL_RATE, 1, INT_MAX, 1,
>>>>>> +						    get_pixel_rate(sensor));
>>>>>> +	sensor->pixel_rate_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>>>>> +	sensor->expo_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE, sensor->expo_min,
>>>>>> +					      sensor->expo_max, 1, sensor->expo_long);
>>>>>> +	sensor->vblank_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK, sensor->vblank_min,
>>>>>> +						0xffff - sensor->current_mode->crop.height, 1,
>>>>>> +						sensor->vblank);
>>>>>> +	sensor->vflip_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VFLIP, 0, 1, 1, sensor->vflip);
>>>>>> +	sensor->hflip_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HFLIP, 0, 1, 1, sensor->hflip);
>>>>>
>>>>> You don't seem to have the link frequency control. I suppose you should, as
>>>>> well as have it in DT.
>>>>>
>>>>> <URL:https://hverkuil.home.xs4all.nl/spec/driver-api/camera-sensor.html#handling-clocks>
>>>>>
>>>>
>>>> Are you referring to V4L2_CID_LINK_FREQ? I defined it above as a read only
>>>> control as it is fixed for this sensor.
>>>
>>> Ah, it was of course the first control.
>>>
>>> Anyway, in general case, the frequencies that can be used on the board
>>> should come from DT, as using other frequencies may interfere with other
>>> devices in the same system.
>>
>> Ah I just remembered we talked about this with Laurent on v2:
>>
>> https://lore.kernel.org/linux-media/YmA5eTOoGNEbMyKB@pendragon.ideasonboard.com/
>>
>> Here is the relevant part:
>>>>> The link frequencies should come from DT.
>>>>
>>>> This is a hard requirement for this sensor. This value can not be
>>>> modified and must be 402MHz.
>>>>
>>>> I see the ov9734.c does something similar. Is adding this value to the
>>>> device tree really mandatory?
>>>
>>> I suppose it's fine then. Sakari, what do you think ?
>>
>> With this extra information, should I move the link frequency to the device tree or is it fine this way?
> 
> If the hardware can only use a single frequency (i.e. it's not a driver
> limitation), then sure, no need to put this in DT.
> 

Yes this is hardware limited.
I'll send v6 soon. Thanks a ton.

>>
>>>
>>> ...
>>>
>>>>>> +	sensor->slave_mode = of_property_read_bool(dev->of_node, "slave-mode");
>>>>>
>>>>> What does this actually do?
>>>>>
>>>>> On parallel bus the slave mode tells the synchronisation signals originate
>>>>> from the receiver. On CSI-2 there are no specific synchronisation signals.
>>>>>
>>>>
>>>> We discussed about this on v1 a while ago:
>>>>
>>>> https://lore.kernel.org/all/c610a2c9-31b1-1950-00fa-a6b3fd3517a1@foss.st.com/
>>>>
>>>> Tell me if there is any changes to be made, or maybe some documentation to
>>>> clarify?
>>>
>>> Ah, yes, I hadn't had time to read that reply yet. :-(
>>>
>>> I think we should have a generic solution for this. You may not have two
>>> similar kinds of sensors you're synchronising this way. One option could be
>>> to drop this functionality from the driver now to get it in sooner.
>>>
>>> Something to consider:
>>>
>>> - how to convey where the signal comes from (phandle),
>>>
>>> - capture start signal polarity,
>>>
>>> - whether it's input/output and
>>>
>>> - pull-down / pull-up configuration?
>>>
>>> These are similar to what GPIOs have. Hardware support may vary of course.
>>>
>>
>> Yes, we discussed this in the media summit.
>> I'll drop this for now.
>> I'll come back to this once the first version of the driver is accepted, and if Dave is not faster than me on this topic ;)
> 
> Sounds good.
> 
