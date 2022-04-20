Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43B9C508BF4
	for <lists+linux-media@lfdr.de>; Wed, 20 Apr 2022 17:21:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379964AbiDTPXp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Apr 2022 11:23:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379871AbiDTPXo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Apr 2022 11:23:44 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDEC045536;
        Wed, 20 Apr 2022 08:20:56 -0700 (PDT)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23KEQQND031424;
        Wed, 20 Apr 2022 17:19:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=yo8MLZBBljRxw6RWLBl55/j1HTt3jnLE1UxBXkdfahI=;
 b=p9XvJW6PJnS4mob6rW4YHa12O1m5NU3XQ9tG8NTylqwMPrxEGt3u2OAOq7yF+PVd8h0b
 AGfE2HBoUvIX71ydzHOAYrA70VLxNimr8l5fQU9WzWRcIppMbG7HV//Gop3iibFJ8Za9
 nAM1Y+y1KSNEKl9sIbOsSh6sn0HwrSFD8S+C3FrSFmLX6op3YMSSqO0gBWVetln9z883
 /pzw8AXjQJ9XWiEqCQl8touX9nomaxt5nUqt0mxXn0dQGyxtcEqx3HnqPmOymAkeuWHu
 +Z8Xwjgz7Xyvw/Du3B6wpOnlsfVb4mWmOjw2+NGWPCll1VW5NPiFaXFcCSWqF4qwbDjF Jg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fh09rq57a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 20 Apr 2022 17:19:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 33C8410002A;
        Wed, 20 Apr 2022 17:19:35 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9B139231513;
        Wed, 20 Apr 2022 17:19:35 +0200 (CEST)
Received: from [10.0.2.15] (10.75.127.51) by SFHDAG2NODE1.st.com (10.75.127.4)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 20 Apr 2022 17:19:35
 +0200
Subject: Re: [PATCH v2 2/5] media: v4l: ctrls: Add a control for temperature
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Guenter Roeck <linux@roeck-us.net>
CC:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        <linux-media@vger.kernel.org>, <alain.volmat@foss.st.com>,
        <hugues.fruchet@foss.st.com>, <sylvain.petinot@foss.st.com>,
        <dave.stevenson@raspberrypi.com>, <sakari.ailus@linux.intel.com>,
        <kieran.bingham@ideasonboard.com>, <linux-hwmon@vger.kernel.org>,
        Ricardo Ribalda <ribalda@chromium.org>
References: <20220415111845.27130-1-benjamin.mugnier@foss.st.com>
 <20220415111845.27130-3-benjamin.mugnier@foss.st.com>
 <d4c868d5ef05f338bdc2237d9b9304077d268c8b.camel@ndufresne.ca>
 <3a4fad80-b16a-3780-a0f7-41dd6c80689e@roeck-us.net>
 <Yl8jF1KLzP6YO6t+@pendragon.ideasonboard.com>
 <1c700e5b-5bf2-f0eb-78f3-12290fd88234@roeck-us.net>
 <dec71c79-3141-8dcf-6d37-8495f4b7c7e9@foss.st.com>
 <YmAI3QVSPMq3mR7E@pendragon.ideasonboard.com>
 <76789333-bb0b-fcc2-6ba9-ab01c9aab62a@roeck-us.net>
 <YmAXd5F2Rm/VDIb5@pendragon.ideasonboard.com>
From:   Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Message-ID: <8b8aa915-d08c-9cc6-fc01-2f062a79b078@foss.st.com>
Date:   Wed, 20 Apr 2022 17:19:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YmAXd5F2Rm/VDIb5@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE1.st.com
 (10.75.127.4)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-20_04,2022-04-20_01,2022-02-23_01
X-Spam-Status: No, score=-6.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 20/04/2022 16:23, Laurent Pinchart wrote:
> On Wed, Apr 20, 2022 at 06:58:32AM -0700, Guenter Roeck wrote:
>> On 4/20/22 06:21, Laurent Pinchart wrote:
>>> On Wed, Apr 20, 2022 at 03:01:18PM +0200, Benjamin Mugnier wrote:
>>>> On 20/04/2022 00:04, Guenter Roeck wrote:
>>>>> On 4/19/22 14:01, Laurent Pinchart wrote:
>>>>>> On Tue, Apr 19, 2022 at 12:28:06PM -0700, Guenter Roeck wrote:
>>>>>>> On 4/19/22 11:24, Nicolas Dufresne wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> adding linux-hwmon in CC for a wider feedback.
>>>>>>>>
>>>>>>>> Le vendredi 15 avril 2022 à 13:18 +0200, Benjamin Mugnier a écrit :
>>>>>>>>> Add V4L2_CID_TEMPERATURE control to get temperature from sensor in
>>>>>>>>> celsius as a volatile and read-only control, and its documentation.
>>>>>>>>> Useful to monitor thermals from v4l controls for sensors that support
>>>>>>>>> this.
>>>>>>>>
>>>>>>>> Any justification to expose a temperature sensor outside of the dedicated kernel
>>>>>>>> API hwmon ? I know if may makes it harder to use, as the sensor isn't bound to
>>>>>>>> the camera driver, and also the sensor may not work if the camera is not
>>>>>>>> streaming. But in the end, the API in hwmon does not look that complex, and is
>>>>>>>> perhaps more precise ?
>>>>
>>>> This sensor is able to read the temperature even if not streaming.
>>>>
>>>>>>>>
>>>>>>>> All in all, I think we need a strong justification to implement a custom
>>>>>>>> thermometer interface, something described here and documented with care to
>>>>>>>> prevent abuse. I would also see opinion from folks outside of the linux-media,
>>>>>>>> hence why I have CCed hwmon mailing list.
>>>>>>>
>>>>>>> All I can say is that this seems to be odd and a bit outside the scope of
>>>>>>> v4l2. I would have expected the vgxy61 driver to register a hwmon device
>>>>>>> instead.
>>>>>>
>>>>>> I don't have a definitive opinion yet, but as Nicolas raised the issue
>>>>>> by pushing towards hwmon, I'll offer counter-arguments for the sake of
>>>>>> it :-)
>>>>>>
>>>>>> The temperature sensor in the imaging sensor is used to measure the die
>>>>>> temperature, in order to tune the noise and spectral response model of
>>>>>> the imaging sensor. It's thus not a generic-purpose temperature sensor.
>>>>>> If the feature were to be exposed through hwmon, userspace would need to
>>>>>> associate an hwmon device to the imaging sensor V4L2 subdev (we have a
>>>>>> way to do so through the MC API, it doesn't support hwmon at this point,
>>>>>> but I suppose it could be added). There are also various constraints
>>>>>> that tie the temperature reading to the imaging side, it could be that
>>>>>> the temperature would only be readable while capturing frames. That's
>>>>>> probably possible to handle too but returning an error from the
>>>>>> temperature read.
>>>>>>
>>>>>> Code-wise, both the driver and userspace would be more complex, for very
>>>>>> little practical gain (I don't dispute a theorical gain).
>>>>>>
>>>>>
>>>>> All I can say is - not my subsystem, not my call to make. If you say this
>>>>> is special and is better handled in V4L2, I'll take you by your word.
>>>>>
>>>>> Guenter
>>>>>
>>>>
>>>> I'll happily implement whatever conclusion we make here.
>>>>
>>>> I could also drop this control for the first iteration of the driver,
>>>> and come back later once a consensus is reached.
>>>
>>> That would work too. By the way, what are your use cases for the
>>> temperature sensor ? Have you added the control for the sake of
>>> completeness, or do you have use cases ?
>>
>> You provided a use case above. Are you saying you made it up ?
>> Still fine with me, your call, just wondering.
> 
> It's the two most common use cases for imaging sensor temperature
> measurements that I know of. My question to Benjamin is if he has the
> same and/or other use cases.
> 

Just like you said in a previous mail. This temperature sensor can be used to implement a retroactive loop from the host according to its value, such as noise correction for instance.
We don't have anything in the Linux user space that implements this yet, this was in anticipation.
So dropping it is fine, I will come back to it if need be ;)
