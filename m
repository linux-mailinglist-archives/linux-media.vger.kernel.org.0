Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A4C450FD16
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 14:33:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349993AbiDZMg0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Apr 2022 08:36:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349979AbiDZMgZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 08:36:25 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D87A2C6ED6
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 05:33:15 -0700 (PDT)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23QALrl0009527;
        Tue, 26 Apr 2022 14:32:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=bKYs7crw3Z9kpaRFvV3us2rmNqJbdiE/mFHz6rEN6S4=;
 b=AheNZDA6fMiWPDFUcCdeNif9gXPhhBV9WU2P0N7tJ368ZAKN7j2QaM83EjsnzANHcVAs
 a0vnktMgoSOh1IeXqAcOJXJLbeYCAgzBpjHlV8p54dNqchidvSn7G0MCBAsZsk4XM2GV
 TWKynXr2SgeMytLYw2BN4+NAVb1sINWaczD8U2eY8HkTLCocJof7uV2+2XsLrsEUJYHW
 Z+cOP1OL6ad+4xG5wcPONRTgBdpkjrZh0Lg0rk05cEUzzwLF8lekuRIQ4rm1MLm59XH0
 s+zrrzHdi6JleqlOCZ264L2kYjECV2mQWK8zO7MJ/YX9lSqSRZXKOWSGrO6AYoe7dY0f 8A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fm6vkf833-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Apr 2022 14:32:48 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E45BB10002A;
        Tue, 26 Apr 2022 14:32:46 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CD8542248A9;
        Tue, 26 Apr 2022 14:32:46 +0200 (CEST)
Received: from [10.201.23.19] (10.75.127.48) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 26 Apr
 2022 14:32:45 +0200
Subject: Re: [PATCH v5 00/27] media: ov5640: Rework the clock tree programming
 for MIPI
To:     Sakari Ailus <sakari.ailus@iki.fi>
CC:     Jacopo Mondi <jacopo@jmondi.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        <laurent.pinchart@ideasonboard.com>, <hverkuil-cisco@xs4all.nl>,
        <mirela.rabulea@nxp.com>, <xavier.roumegue@oss.nxp.com>,
        <hugues.fruchet@st.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <aford173@gmail.com>, <festevam@gmail.com>,
        <Eugen.Hristev@microchip.com>, <jbrunet@baylibre.com>,
        <paul.elder@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>
References: <20220224094313.233347-1-jacopo@jmondi.org>
 <7c082420-63f4-0520-21a2-7e10a1e2c321@ideasonboard.com>
 <20220323095019.edql22tjb3ea5npx@uno.localdomain>
 <a9972878-dda3-15fb-90fc-ae6686e35818@foss.st.com>
 <YlAW6apXjdHVkyEZ@valkosipuli.retiisi.eu>
From:   Hugues FRUCHET - FOSS <hugues.fruchet@foss.st.com>
Message-ID: <00560f31-a118-bc48-3561-1d1023b733c2@foss.st.com>
Date:   Tue, 26 Apr 2022 14:32:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YlAW6apXjdHVkyEZ@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-26_02,2022-04-26_02,2022-02-23_01
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 4/8/22 1:05 PM, Sakari Ailus wrote:
> Hi Hugues,
> 
> On Thu, Apr 07, 2022 at 06:25:11PM +0200, Hugues FRUCHET - FOSS wrote:
>> Hi Jacopo,
>>
>> On 3/23/22 10:50 AM, Jacopo Mondi wrote:
>>> Hi Tomi thanks for testing
>>>
>>> On Wed, Mar 23, 2022 at 10:51:04AM +0200, Tomi Valkeinen wrote:
>>>> Hi Jacopo,
>>>>
>>>> On 24/02/2022 11:42, Jacopo Mondi wrote:
>>>>> v1:
>>>>> https://patchwork.linuxtv.org/project/linux-media/list/?series=7249
>>>>> v2:
>>>>> https://patchwork.linuxtv.org/project/linux-media/list/?series=7311
>>>>> v3:
>>>>> https://patchwork.linuxtv.org/project/linux-media/list/?series=7385
>>>>> v4:
>>>>> https://patchwork.linuxtv.org/project/linux-media/list/?series=7389
>>>>>
>>>>> A branch for testing based on the most recent media-master is available at
>>>>> https://git.sr.ht/~jmondi_/linux #jmondi/media-master/ov5640-v5
>>>>
>>>> I tested these with DRA76 EVM & CAL, using CAL's legacy non-MC mode. It
>>>> doesn't work. I think there are two problems:
>>>>
>>>> - CAL uses mbus codes like MEDIA_BUS_FMT_UYVY8_2X8 for CSI-2, not 1X16.
>>>> OV5640 used to support 2X8, but now it doesn't.
>>>>
>>>> - OV5640 sets the default code to MEDIA_BUS_FMT_UYVY8_2X8, even for CSI-2
>>>> where it doesn't support MEDIA_BUS_FMT_UYVY8_2X8.
>>>
>>> This might be worth an additional patch that decides what default
>>> format to use based on the bus type.
>>>
>>>>
>>>> I'd like to just change CAL and drop the 2X8 support and instead use 1X16,
>>>> but then any sensor that uses 2X8 would work. So I guess I need to change
>>>> the code to support both.
>>>>
>>>> Anyway, both of those issues might also surface on other platforms, as
>>>> ov5640 behavior has changed.
>>>>
>>
>> I am facing the same "2X8" compatibility problem on ST platforms:
>> - st-mipid02 CSI-2 to parallel bridge [1] must be enhanced to support 1X16
>> formats
>> - dcmi controller [2] must also be enhanced to support 1X16 and extra code
>> to support 1X16 input to 2X8 output (as we only have as input the V4L2
>> format, not the mediabus one)
>> => with current code, support with OV5640 is broken.
>>
>> I feel that your proposal to let OV5640 accept 2X8 then silently switch to
>> 1X16 can do the job without breaking dcmi/bridge support but need further
>> testing to confirm.
>>
>> Appart from that I don't really understand the logic behind naming "1X16"
>> for CSI-2 serial formats, if "2X8" means 2 bytes to send one pixel, I would
>> expect that "1X16" means 1 word to send one pixel (16bits wide bus), so how
>> to differentiate 16 bits // code from CSI-2 code ?
> 
> Please see:
> 
> <URL:https://hverkuil.home.xs4all.nl/spec/userspace-api/v4l/subdev-formats.html#v4l2-mbus-pixelcode>
> 
> I.e. st-mipid02 and dcmi drivers should be fixed.
> 

OK, so "single clock cycle" convention for serial bus (copy/paste here 
for the sake of clarity):

4.13.3.4.1.1. Media Bus Pixel Codes

The media bus pixel codes document parallel formats. Should the pixel 
data be transported over a serial bus, the media bus pixel code that 
describes a parallel format that transfers a sample on a single clock 
cycle is used. For instance, both MEDIA_BUS_FMT_BGR888_1X24 and 
MEDIA_BUS_FMT_BGR888_3X8 are used on parallel busses for transferring an 
8 bits per sample BGR data, whereas on serial busses the data in this 
format is only referred to using MEDIA_BUS_FMT_BGR888_1X24. This is 
because there is effectively only a single way to transport that format 
on the serial busses.

I'll try to change both dcmi and mipid02 in that way...

Best regards,
Hugues.


