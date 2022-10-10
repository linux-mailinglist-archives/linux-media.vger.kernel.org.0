Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5290A5F9E86
	for <lists+linux-media@lfdr.de>; Mon, 10 Oct 2022 14:12:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231277AbiJJMMc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Oct 2022 08:12:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232462AbiJJMMD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Oct 2022 08:12:03 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4C686CF69
        for <linux-media@vger.kernel.org>; Mon, 10 Oct 2022 05:12:01 -0700 (PDT)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29ABx1RI007153;
        Mon, 10 Oct 2022 14:11:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=jEh9pyGo2U1QUwFNS76CwOy56ayPZRSUICDOqLsEE2Y=;
 b=NrvbKcCUspnLQCRF9TOcMneOASqfHI8ZjKxtT6B/nC+gurFBjJyye20rg+uzkMvpuKh+
 +UUl3VhuY6c0X6F/7caQMjh2/LwEmr5PpUGjNZQWKD4T3v5iIc2x6lCsFJl0p3cCF6tv
 ctN4xk4BbA5bjtFHz6guhdTNKfnwsJTBJEu+P+fcTVBdjLGo1X42IMKmP8/Ewg9q11SD
 IIvnN8gmAFJKqJiXwX88Rz236bS8hFfJSJhZ1Jf87ciuYteDYpS/kAmcSZe17hnZp6j3
 uDE/tFziDgnmoDU+i+jfPfOrFZtbma2gowJxA0ZY/01M9o67fDkGE9CxgPBJ2MjcI440 LA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3k31exb04u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 10 Oct 2022 14:11:52 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5541E10002A;
        Mon, 10 Oct 2022 14:11:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 456382278A1;
        Mon, 10 Oct 2022 14:11:47 +0200 (CEST)
Received: from [10.129.166.189] (10.75.127.46) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 10 Oct
 2022 14:11:46 +0200
Message-ID: <b5175106-cab0-4a6a-6ba5-20070940ccff@foss.st.com>
Date:   Mon, 10 Oct 2022 14:11:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v6 4/4] media: i2c: Add driver for ST VGXY61 camera sensor
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     <linux-media@vger.kernel.org>, <alain.volmat@foss.st.com>,
        <hugues.fruchet@foss.st.com>, <sylvain.petinot@foss.st.com>,
        <dave.stevenson@raspberrypi.com>,
        <laurent.pinchart@ideasonboard.com>,
        <kieran.bingham@ideasonboard.com>, <nicolas@ndufresne.ca>,
        <hverkuil@xs4all.nl>
References: <20220927083702.14138-1-benjamin.mugnier@foss.st.com>
 <20220927083702.14138-5-benjamin.mugnier@foss.st.com>
 <Yz8pE15/9tDf6Tjy@paasikivi.fi.intel.com>
 <af876e81-9105-9a0f-4dd1-47bc17886536@foss.st.com>
 <Y0PX8SRn51FlOS5c@paasikivi.fi.intel.com>
 <7c36fdaf-fa2a-4581-5f16-02fbfc3b20fb@foss.st.com>
 <Y0Pm0WhZpWgKxDbD@paasikivi.fi.intel.com>
 <62b268df-3c9d-79b2-31a6-61770843ee66@foss.st.com>
 <Y0QITlCsMe0wdPam@paasikivi.fi.intel.com>
From:   Benjamin MUGNIER <benjamin.mugnier@foss.st.com>
In-Reply-To: <Y0QITlCsMe0wdPam@paasikivi.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-10_06,2022-10-10_02,2022-06-22_01
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 10/10/22 13:55, Sakari Ailus wrote:
> Hi Benjamin,
> 
> On Mon, Oct 10, 2022 at 11:50:25AM +0200, Benjamin MUGNIER wrote:
>> Hi Sakari,
>>
>> On 10/10/22 11:33, Sakari Ailus wrote:
>>> Hi Benjamin,
>>>
>>> On Mon, Oct 10, 2022 at 11:19:01AM +0200, Benjamin MUGNIER wrote:
>>>> Hi Sakari,
>>>>
>>>> On 10/10/22 10:29, Sakari Ailus wrote:
>>>>> Hi Benjamin,
>>>>>
>>>>> On Fri, Oct 07, 2022 at 02:24:16PM +0200, Benjamin MUGNIER wrote:
>>>>>> Hi Sakari,
>>>>>>
>>>>>> Thank you for your review.
>>>>>> Please consider everything not commented as queued for v7.
>>>>>>
>>>>>> On 10/6/22 21:14, Sakari Ailus wrote:
>>>>>>> Hi Benjamin,
>>>>>>>
>>>>>>> Thanks for the update. A few more comments below...
>>>>>>>
>>>>>>> On Tue, Sep 27, 2022 at 10:37:02AM +0200, Benjamin Mugnier wrote:
>>>>>>>> +static const char * const vgxy61_hdr_mode_menu[] = {
>>>>>>>> +	"HDR linearize",
>>>>>>>> +	"HDR substraction",
>>>>>>>> +	"No HDR",
>>>>>>>> +};
>>>>>>>
>>>>>>> I think more documentation is needed on the HDR modes. What do these mean?
>>>>>>> For instance, are they something that requires further processing or is the
>>>>>>> result e.g. a ready HDR image?
>>>>>>>
>>>>>>> This should probably make it to driver specific documentation.
>>>>>>>
>>>>>>
>>>>>> Sure, in fact I did something like this in v3:
>>>>>> https://lore.kernel.org/linux-media/20220512074037.3829926-4-benjamin.mugnier@foss.st.com/
>>>>>>
>>>>>> Since I standardized the control I was unsure what to do with this documentation, and dropped it.
>>>>>> I will add back the Documentation/userspace-api/media/drivers/st-vgxy61.rst file from this commit to the patchset, while changing the control name to the new one.
>>>>>
>>>>> Yes, please. That seems reasonably good.
>>>>>
>>>>> I think Laurent's proposal on a HDR control for sensor-implemented HDR is a
>>>>> good one. Further controls can be added later on.
>>>>>
>>>>>>>> +	sensor->gpios_polarity = of_property_read_bool(dev->of_node,
>>>>>>>> +						       "invert-gpios-polarity");
>>>>>
>>>>> How about:
>>>>>
>>>>> 	device_property_read_bool(dev, ...);
>>>>>
>>>>
>>>> Sounds great.
>>>>
>>>>>>>
>>>>>>> I thought we did discuss dropping support for sensor synchronisation in
>>>>>>> this version?
>>>>>>>
>>>>>>
>>>>>> This properties affects strobing lights gpios polarities as you can see
>>>>>> in vgxy61_update_gpios_strobe_polarity. If set to '1' all strobing gpios
>>>>>> are inverted. This has nothing to do with the sensor synchronization.
>>>>>
>>>>> So this is for strobing a LED flash? It would be good to mention this in
>>>>> DT bindings.
>>>>>
>>>>>>
>>>>>> Now I realize this is poorly named, and I even forgot to document it in
>>>>>> the device tree bindings file. I apologize.
>>>>>
>>>>> No problem.
>>>>>
>>>>>>
>>>>>> I would like to rename it to 'st,strobe-polarity' since this is vendor
>>>>>> specific and to better reflect that it affects strobing gpios. I'll make
>>>>>> this change for v7 and document this in the bindings file too. Tell me if
>>>>>> there is any issues with that.
>>>>>
>>>>> That name seems reasonable to me. Although, *if* this is actually usable as
>>>>> a GPIO as the bindings suggest, then the GPIO flags would probably be a
>>>>> better alternative.
>>>>>
>>>>
>>>> If by GPIO flag you mean adding 'gpios' to the property, We could go with 'st,strobe-gpios-polarity', which in the end this leads to the same property name as it was in the dt bindings :)
>>>> I'll add a bit of comments on the bindings. It seems to be the best choice.
>>>
>>> Is this a GPIO or is it not (e.g. strobe signal only)?
>>>
>>> For the latter the this should be fine. And "flash-leds" property should be
>>> there as well I guess?
>>>
>>
> 
> Please wrap the lines at around 74. Rewrapped now...
> 

Done. Thank you.

>> This property controls the polarity of and output GPIO connected to the
>> sensor. This output GPIO is driven by the sensor firmware in order to
>> illuminate the scene whenever necessary. I'm not sure this goes under the
>> "flash-leds" category, as it only provides a signal with either "0"
>> (don't illuminate) or a 1 (illuminate) ? The sensor controls the signal
> 
> This is what sensors generally do.
> 
>> following the programmed "strobe-mode" as you can see in
>> vgxy61_strobe_mode according to the HDR mode. It does not have a
>> max-microamp or timeout values as a flash I suppose, it is really a
>> simple signal.
> 
> Those are usually configured for the flash driver, not on the sensor.
> 

Ok, I guess in this case there is no flash driver. Should I keep the
'st,strobe-gpios-polarity' property or are you aware of an already
defined property for this behavior?

>>
>> Practically we have what we call "illuminators" that are either built in
>> the sensor'smodule, are externally connected to the sensor's module.
>>
>> Hope this is clearer.
> 

-- 
Regards,

Benjamin
