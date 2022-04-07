Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD7A4F84F1
	for <lists+linux-media@lfdr.de>; Thu,  7 Apr 2022 18:26:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242846AbiDGQ2E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Apr 2022 12:28:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345716AbiDGQ1i (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Apr 2022 12:27:38 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4286FBC9C
        for <linux-media@vger.kernel.org>; Thu,  7 Apr 2022 09:25:35 -0700 (PDT)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 237Aq1xH009487;
        Thu, 7 Apr 2022 18:25:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=EqA1ZkZypaGTCyOoj7xJYX2seaZdyRfdJjoAxkt4YU0=;
 b=3TdZVs9fBdmNoaag064xqq8ks1CeXMVCuCtJU7Kz9QHuvGzjqh+3cy0wphDjetR6pbX7
 YrORFAdcfn8zoGzfkxCz3PAGbSfbQMqZTZed0YM/WEB+fW714ovTo7PSXDHv4oRn7Tls
 MQZf3PwQahk6Nn/jfy9y6dc6Elnq6W3ioUHt7Mjf/dJLblbupJQ37fZz6e0PnH3smUZT
 5Bh9/VmwjcQuNYhDy2ECxxamWwXCcC1805CaguenHy1FJ01PMPH4zrBaFc9F5EiVrBag
 KZgFIvSo8VZOYpdouiYZUx0YCx43M7w8s2Q7uXgD7JDm8amQt4EAkbToZ3VyY1Xqwa1R Xg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3f8x4rnex6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 07 Apr 2022 18:25:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 49E5310002A;
        Thu,  7 Apr 2022 18:25:14 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 438CC221778;
        Thu,  7 Apr 2022 18:25:14 +0200 (CEST)
Received: from [10.201.23.19] (10.75.127.44) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 7 Apr
 2022 18:25:12 +0200
Subject: Re: [PATCH v5 00/27] media: ov5640: Rework the clock tree programming
 for MIPI
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC:     Steve Longerbeam <slongerbeam@gmail.com>,
        <laurent.pinchart@ideasonboard.com>, <sakari.ailus@iki.fi>,
        <hverkuil-cisco@xs4all.nl>, <mirela.rabulea@nxp.com>,
        <xavier.roumegue@oss.nxp.com>, <hugues.fruchet@st.com>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>, <aford173@gmail.com>,
        <festevam@gmail.com>, <Eugen.Hristev@microchip.com>,
        <jbrunet@baylibre.com>, <paul.elder@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>
References: <20220224094313.233347-1-jacopo@jmondi.org>
 <7c082420-63f4-0520-21a2-7e10a1e2c321@ideasonboard.com>
 <20220323095019.edql22tjb3ea5npx@uno.localdomain>
From:   Hugues FRUCHET - FOSS <hugues.fruchet@foss.st.com>
Message-ID: <a9972878-dda3-15fb-90fc-ae6686e35818@foss.st.com>
Date:   Thu, 7 Apr 2022 18:25:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220323095019.edql22tjb3ea5npx@uno.localdomain>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-07_03,2022-04-07_01,2022-02-23_01
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 3/23/22 10:50 AM, Jacopo Mondi wrote:
> Hi Tomi thanks for testing
> 
> On Wed, Mar 23, 2022 at 10:51:04AM +0200, Tomi Valkeinen wrote:
>> Hi Jacopo,
>>
>> On 24/02/2022 11:42, Jacopo Mondi wrote:
>>> v1:
>>> https://patchwork.linuxtv.org/project/linux-media/list/?series=7249
>>> v2:
>>> https://patchwork.linuxtv.org/project/linux-media/list/?series=7311
>>> v3:
>>> https://patchwork.linuxtv.org/project/linux-media/list/?series=7385
>>> v4:
>>> https://patchwork.linuxtv.org/project/linux-media/list/?series=7389
>>>
>>> A branch for testing based on the most recent media-master is available at
>>> https://git.sr.ht/~jmondi_/linux #jmondi/media-master/ov5640-v5
>>
>> I tested these with DRA76 EVM & CAL, using CAL's legacy non-MC mode. It
>> doesn't work. I think there are two problems:
>>
>> - CAL uses mbus codes like MEDIA_BUS_FMT_UYVY8_2X8 for CSI-2, not 1X16.
>> OV5640 used to support 2X8, but now it doesn't.
>>
>> - OV5640 sets the default code to MEDIA_BUS_FMT_UYVY8_2X8, even for CSI-2
>> where it doesn't support MEDIA_BUS_FMT_UYVY8_2X8.
> 
> This might be worth an additional patch that decides what default
> format to use based on the bus type.
> 
>>
>> I'd like to just change CAL and drop the 2X8 support and instead use 1X16,
>> but then any sensor that uses 2X8 would work. So I guess I need to change
>> the code to support both.
>>
>> Anyway, both of those issues might also surface on other platforms, as
>> ov5640 behavior has changed.
>>

I am facing the same "2X8" compatibility problem on ST platforms:
- st-mipid02 CSI-2 to parallel bridge [1] must be enhanced to support 
1X16 formats
- dcmi controller [2] must also be enhanced to support 1X16 and extra 
code to support 1X16 input to 2X8 output (as we only have as input the 
V4L2 format, not the mediabus one)
=> with current code, support with OV5640 is broken.

I feel that your proposal to let OV5640 accept 2X8 then silently switch 
to 1X16 can do the job without breaking dcmi/bridge support but need 
further testing to confirm.

Appart from that I don't really understand the logic behind naming 
"1X16" for CSI-2 serial formats, if "2X8" means 2 bytes to send one 
pixel, I would expect that "1X16" means 1 word to send one pixel (16bits 
wide bus), so how to differentiate 16 bits // code from CSI-2 code ?

For the time being I have reverted this commit in order to test the 
other topics of this patchset.

[1] drivers/media/i2c/st-mipid02.c
[2] drivers/media/platform/stm32/stm32-dcmi.c

> 
> I'm afraid sooner or later this should have happened ?
> 
> I think CSI-2 receivers should be updated, but I share your concerns
> about breaking other platforms.
> 
> On one side we shouldn't be breaking userspace and this change might
> break some assumptions in users' pipeline configuration scripts and
> could prevent drivers that used to work together from being
> compatible at all.
> 
> On the other side we would never be able to change anything at all if
> such a change is expected to happen atomically on all platforms and
> sensors.
> 
> As the change is so trivial I guess it's fair to expect users of
> bridge drivers not compatible with 1X16 to fix them, but I cannot tell
> if it's an acceptable policy or not.
> 
> As Sakari suggested we could also move all CSI-2 transmitters to use 1X16
> and have receivers adjust as soon as someone detects a breakage.
> 
> I can revert the change that restricts the enumerated format to the
> currently in use bus type[1] if desired, but I would prefer receivers
> to adjust when needed. Is this acceptable ?
> 
> Thanks
>    j
> 
> [1] "media: ov5640: Split DVP and CSI-2 formats
> 
>>   Tomi
> 
> 

Best regards,
Hugues.
