Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 202455088B1
	for <lists+linux-media@lfdr.de>; Wed, 20 Apr 2022 15:02:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378745AbiDTNE2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Apr 2022 09:04:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378741AbiDTNE1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Apr 2022 09:04:27 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2718B3A719;
        Wed, 20 Apr 2022 06:01:39 -0700 (PDT)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23KC7CDN009613;
        Wed, 20 Apr 2022 15:01:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : subject : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=yWe/3heny43KuV7czgDZS3xembVK4Ho5GtmprWV6jUM=;
 b=G2zSJmSnET8xomlcvhD5SrHQoYPiUzsYh5/g3z4hV8aJ7vUVRhsnhnXdwEouVB2oIuWL
 XtDb/ny2t5UP63hk7FbllKaDq1MLIyeknixPhHgYRzFAm2z40Er101jrLHmouxvlVSaI
 QzOBfSz4FcD3YguNmsh454Uc77xuqrbCUzACJedFKfykuMEXYAjU6eFOW82uTfbSDtCP
 5px55ngJI5TaRZOl6x6y+7aJCA8qnM6JVSc1lt33Y5yvmuisVokPlbPkRu8sw8jtGQB1
 2ZIldMCJctiZYpJ6T36FTU3EPatXaJyWk5PzIuFsHLaOP6jvT+d3DdSpOUhNRKoGNofc CA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ffpqgw2b7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 20 Apr 2022 15:01:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6F8C5100034;
        Wed, 20 Apr 2022 15:01:19 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 68AC020FC96;
        Wed, 20 Apr 2022 15:01:19 +0200 (CEST)
Received: from [10.0.2.15] (10.75.127.49) by SFHDAG2NODE1.st.com (10.75.127.4)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 20 Apr 2022 15:01:18
 +0200
From:   Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: Re: [PATCH v2 2/5] media: v4l: ctrls: Add a control for temperature
To:     Guenter Roeck <linux@roeck-us.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Message-ID: <dec71c79-3141-8dcf-6d37-8495f4b7c7e9@foss.st.com>
Date:   Wed, 20 Apr 2022 15:01:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1c700e5b-5bf2-f0eb-78f3-12290fd88234@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE1.st.com
 (10.75.127.4)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-20_03,2022-04-20_01,2022-02-23_01
X-Spam-Status: No, score=-6.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi everyone,

Just some little comments for my use case. Hope that helps.

On 20/04/2022 00:04, Guenter Roeck wrote:
> On 4/19/22 14:01, Laurent Pinchart wrote:
>> On Tue, Apr 19, 2022 at 12:28:06PM -0700, Guenter Roeck wrote:
>>> On 4/19/22 11:24, Nicolas Dufresne wrote:
>>>> Hi,
>>>>
>>>> adding linux-hwmon in CC for a wider feedback.
>>>>
>>>> Le vendredi 15 avril 2022 à 13:18 +0200, Benjamin Mugnier a écrit :
>>>>> Add V4L2_CID_TEMPERATURE control to get temperature from sensor in
>>>>> celsius as a volatile and read-only control, and its documentation.
>>>>> Useful to monitor thermals from v4l controls for sensors that support
>>>>> this.
>>>>
>>>> Any justification to expose a temperature sensor outside of the dedicated kernel
>>>> API hwmon ? I know if may makes it harder to use, as the sensor isn't bound to
>>>> the camera driver, and also the sensor may not work if the camera is not
>>>> streaming. But in the end, the API in hwmon does not look that complex, and is
>>>> perhaps more precise ?

This sensor is able to read the temperature even if not streaming.

>>>>
>>>> All in all, I think we need a strong justification to implement a custom
>>>> thermometer interface, something described here and documented with care to
>>>> prevent abuse. I would also see opinion from folks outside of the linux-media,
>>>> hence why I have CCed hwmon mailing list.
>>>
>>> All I can say is that this seems to be odd and a bit outside the scope of
>>> v4l2. I would have expected the vgxy61 driver to register a hwmon device
>>> instead.
>>
>> I don't have a definitive opinion yet, but as Nicolas raised the issue
>> by pushing towards hwmon, I'll offer counter-arguments for the sake of
>> it :-)
>>
>> The temperature sensor in the imaging sensor is used to measure the die
>> temperature, in order to tune the noise and spectral response model of
>> the imaging sensor. It's thus not a generic-purpose temperature sensor.
>> If the feature were to be exposed through hwmon, userspace would need to
>> associate an hwmon device to the imaging sensor V4L2 subdev (we have a
>> way to do so through the MC API, it doesn't support hwmon at this point,
>> but I suppose it could be added). There are also various constraints
>> that tie the temperature reading to the imaging side, it could be that
>> the temperature would only be readable while capturing frames. That's
>> probably possible to handle too but returning an error from the
>> temperature read.
>>
>> Code-wise, both the driver and userspace would be more complex, for very
>> little practical gain (I don't dispute a theorical gain).
>>
> 
> All I can say is - not my subsystem, not my call to make. If you say this
> is special and is better handled in V4L2, I'll take you by your word.
> 
> Guenter
> 

I'll happily implement whatever conclusion we make here.

I could also drop this control for the first iteration of the driver, and come back later once a consensus is reached.

Benjamin
