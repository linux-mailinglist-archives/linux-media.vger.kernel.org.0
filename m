Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A191B5F77BA
	for <lists+linux-media@lfdr.de>; Fri,  7 Oct 2022 13:56:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbiJGL4p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Oct 2022 07:56:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbiJGL4o (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Oct 2022 07:56:44 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E3EDCF85A
        for <linux-media@vger.kernel.org>; Fri,  7 Oct 2022 04:56:42 -0700 (PDT)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2979ppqh003023;
        Fri, 7 Oct 2022 13:56:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=mK3fHxEolTmw6h8qdCYf8/e2p0cmMBEpv/vZuf8VuCg=;
 b=LOyFDkpBQWL0KdSKDIE6IDU9r95lACErS3IRsz5nrj1qjIIMDOqNMDHUEhsF14aGqd5C
 tsTAwoafobw4wnCp4C3ARHWLgrhRqJsxD0ARnvAq3iEt2PivxjR71LpzaLT8kRUNO7kZ
 ifmDbHM3QnbDtf4NCJM7lRGlMv33LWRxBVbpXmOsYfAR3p530lDjTL7OlK4bBu/8JM+i
 lkhnWa6Isvt0qKUqwf8u/cR/SnS5XWh9LyF5/nuaXYWAW8MXQU6zhsQz8AsK0q/bCEHj
 ChkvAAC74xxQqjroApVy7EKiZB9kOVTYoeQ1H9Ii3mqI+EIP3mVmXxeIg3qC5kRIv8UH 9Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3k16dsewg9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 07 Oct 2022 13:56:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 77AFA10002A;
        Fri,  7 Oct 2022 13:56:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 58E6021F148;
        Fri,  7 Oct 2022 13:56:26 +0200 (CEST)
Received: from [10.252.8.171] (10.75.127.123) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Fri, 7 Oct
 2022 13:56:25 +0200
Message-ID: <31392601-bde1-e383-e0f6-30ad804240d8@foss.st.com>
Date:   Fri, 7 Oct 2022 13:56:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 1/4] media: v4l: Add 1X16 16-bit greyscale media bus
 code definition
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     <linux-media@vger.kernel.org>, <alain.volmat@foss.st.com>,
        <hugues.fruchet@foss.st.com>, <sylvain.petinot@foss.st.com>,
        <dave.stevenson@raspberrypi.com>, <sakari.ailus@linux.intel.com>,
        <kieran.bingham@ideasonboard.com>, <nicolas@ndufresne.ca>,
        <hverkuil@xs4all.nl>
References: <20220927083702.14138-1-benjamin.mugnier@foss.st.com>
 <20220927083702.14138-2-benjamin.mugnier@foss.st.com>
 <Yz9IIN2Jgum27tk0@pendragon.ideasonboard.com>
From:   Benjamin MUGNIER <benjamin.mugnier@foss.st.com>
In-Reply-To: <Yz9IIN2Jgum27tk0@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.123]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_05,2022-10-07_01,2022-06-22_01
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thank you for your review.

On 10/6/22 23:26, Laurent Pinchart wrote:
> Hi Benjamin,
> 
> Thank you for the patch.
> 
> On Tue, Sep 27, 2022 at 10:36:59AM +0200, Benjamin Mugnier wrote:
>> This extends the greyscale media bus family originally from
>> MEDIA_BUS_FMT_Y8_1X8 up to MEDIA_BUS_FMT_Y14_1X14 by adding
>> MEDIA_BUS_FMT_Y16_1X16, and behaves the same way with 16 bits.
>> Add its documentation in subdev-formats.rst
>>
>> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>> ---
>>  .../media/v4l/subdev-formats.rst              | 37 +++++++++++++++++++
>>  include/uapi/linux/media-bus-format.h         |  3 +-
>>  2 files changed, 39 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
>> index d21d532eee15..19025e9ba447 100644
>> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
>> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
>> @@ -7355,6 +7355,43 @@ the following codes.
>>        - v\ :sub:`2`
>>        - v\ :sub:`1`
>>        - v\ :sub:`0`
>> +    * .. _MEDIA-BUS-FMT-Y16-1X16:
>> +
>> +      - MEDIA_BUS_FMT_Y16_1X16
>> +      - 0x202e
>> +      -
>> +      -
>> +      -
>> +      -
>> +      -
>> +      -
>> +      -
>> +      -
>> +      -
>> +      -
>> +      -
>> +      -
>> +      -
>> +      -
>> +      -
>> +      -
>> +      -
>> +      - y\ :sub:`15`
>> +      - y\ :sub:`14`
>> +      - y\ :sub:`13`
>> +      - y\ :sub:`12`
>> +      - y\ :sub:`11`
>> +      - y\ :sub:`10`
>> +      - y\ :sub:`9`
>> +      - y\ :sub:`8`
>> +      - y\ :sub:`7`
>> +      - y\ :sub:`6`
>> +      - y\ :sub:`5`
>> +      - y\ :sub:`4`
>> +      - y\ :sub:`3`
>> +      - y\ :sub:`2`
>> +      - y\ :sub:`1`
>> +      - y\ :sub:`0`
> 
> Could you please add this right after MEDIA_BUS_FMT_Y14_1X14 ? Same in include/uapi/linux/media-bus-format.h. With this change,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 

Sure no problem.


Regards,

Benjamin

>>  
>>  
>>  .. raw:: latex
>> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
>> index ec3323dbb927..b078dd125e57 100644
>> --- a/include/uapi/linux/media-bus-format.h
>> +++ b/include/uapi/linux/media-bus-format.h
>> @@ -69,7 +69,7 @@
>>  #define MEDIA_BUS_FMT_RGB121212_1X36		0x1019
>>  #define MEDIA_BUS_FMT_RGB161616_1X48		0x101a
>>  
>> -/* YUV (including grey) - next is	0x202e */
>> +/* YUV (including grey) - next is	0x202f */
>>  #define MEDIA_BUS_FMT_Y8_1X8			0x2001
>>  #define MEDIA_BUS_FMT_UV8_1X8			0x2015
>>  #define MEDIA_BUS_FMT_UYVY8_1_5X8		0x2002
>> @@ -115,6 +115,7 @@
>>  #define MEDIA_BUS_FMT_YUV12_1X36		0x2029
>>  #define MEDIA_BUS_FMT_YUV16_1X48		0x202a
>>  #define MEDIA_BUS_FMT_UYYVYY16_0_5X48		0x202b
>> +#define MEDIA_BUS_FMT_Y16_1X16			0x202e
>>  
>>  /* Bayer - next is	0x3021 */
>>  #define MEDIA_BUS_FMT_SBGGR8_1X8		0x3001
> 
