Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11CA65A2934
	for <lists+linux-media@lfdr.de>; Fri, 26 Aug 2022 16:18:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238164AbiHZORY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Aug 2022 10:17:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237327AbiHZORW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Aug 2022 10:17:22 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C60591D2D
        for <linux-media@vger.kernel.org>; Fri, 26 Aug 2022 07:17:18 -0700 (PDT)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27QAQDVe029243;
        Fri, 26 Aug 2022 16:17:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=WJCPKwEisyfsX+FNTKG1Dqod3umOI1EZg0jrngXJkxs=;
 b=IUjl4pd4ITIup7KDsVA7IQMg8najxIrbVGaXqjv0P//Dbs81tv+o7N47hEj53i5e66nG
 fTyiJvr2jrkF8SiTcfMWXMbcu82K4Tl31ZZtmgS7sjIVAI7T4OahyKlOBA+fuHhJoSZv
 dKcCq+IjhTdxpxUBAA0ptzdZBsXrU1RWZhKum5E6hHazxwbROLrFv8hKCrad+FARvQeI
 T2zfO2hqOBdQ2jPqyjy45g3GQU+sRUHdIqPCnAHkoqMvCjd2cIGJR5BR0hqlF0J/hMhR
 o/KWyLT7zdbH8Xks1Gl5aZNTHnH8oWRE3QrhWX0I/uw4kXvKocl+4RqfXHtGnyPVjeMp SA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3j4w3dmpre-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 26 Aug 2022 16:17:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2909E10002A;
        Fri, 26 Aug 2022 16:17:12 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 24D7C22D167;
        Fri, 26 Aug 2022 16:17:12 +0200 (CEST)
Received: from [10.252.9.162] (10.75.127.122) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 26 Aug
 2022 16:17:11 +0200
Message-ID: <1191003f-2e95-6ce0-7fbf-323a03496359@foss.st.com>
Date:   Fri, 26 Aug 2022 16:17:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 3/5] media: uapi: Add ST VGXY61 header file
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     <linux-media@vger.kernel.org>, <alain.volmat@foss.st.com>,
        <hugues.fruchet@foss.st.com>, <sylvain.petinot@foss.st.com>,
        <dave.stevenson@raspberrypi.com>,
        <laurent.pinchart@ideasonboard.com>,
        <kieran.bingham@ideasonboard.com>
References: <20220512074037.3829926-1-benjamin.mugnier@foss.st.com>
 <20220512074037.3829926-4-benjamin.mugnier@foss.st.com>
 <YwNcUpsw1psudCOC@paasikivi.fi.intel.com>
From:   Benjamin MUGNIER <benjamin.mugnier@foss.st.com>
In-Reply-To: <YwNcUpsw1psudCOC@paasikivi.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.122]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-26_08,2022-08-25_01,2022-06-22_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 8/22/22 12:37, Sakari Ailus wrote:
> Hi Benjamin,
> 
> On Thu, May 12, 2022 at 09:40:35AM +0200, Benjamin Mugnier wrote:
>> Define an HDR control in it, and adds its documentation in st-vgxy61.rst
>> file.
>>
>> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>> ---
>>   .../userspace-api/media/drivers/st-vgxy61.rst | 23 +++++++++++++++++++
>>   include/uapi/linux/st-vgxy61.h                | 15 ++++++++++++
>>   2 files changed, 38 insertions(+)
>>   create mode 100644 Documentation/userspace-api/media/drivers/st-vgxy61.rst
>>   create mode 100644 include/uapi/linux/st-vgxy61.h
>>
>> diff --git a/Documentation/userspace-api/media/drivers/st-vgxy61.rst b/Documentation/userspace-api/media/drivers/st-vgxy61.rst
>> new file mode 100644
>> index 000000000000..7a11adbb558f
>> --- /dev/null
>> +++ b/Documentation/userspace-api/media/drivers/st-vgxy61.rst
>> @@ -0,0 +1,23 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +ST VGXY61 camera sensor driver
>> +==============================
>> +
>> +The ST VGXY61 driver implements the following driver-specific controls:
>> +
>> +``V4L2_CID_STVGXY61_HDR``
>> +-------------------------------
>> +    Change the sensor HDR mode. A HDR picture is obtained by merging two captures of the same scene
>> +    using two different exposure periods.
>> +
>> +.. flat-table::
>> +    :header-rows:  0
>> +    :stub-columns: 0
>> +    :widths:       1 4
>> +
>> +    * - HDR linearize
>> +      - The merger outputs a long exposure capture as long as it is not saturated.
>> +    * - HDR substraction
>> +      - This involves subtracting the short exposure frame from the long exposure frame.
>> +    * - "no HDR"
>> +      - This mode is used for standard dynamic range (SDR) exposures.
> 
> I wonder how many different kinds of HDR implementations there are that
> could be meaningfully controlled using a single control. We have controls
> such as scene mode that are much more generic than this.
> 
> Could this be standardised, even if the menu items wouldn't be? Say, call
> it e.g. V4L2_CID_HDR_MODE? Raw sensors have different configuration with
> more parameters though.
> 
> I wonder what others think.
> 

I agree.
I would like to standardize the control and not the menu items just like 
you said, as some sensors are missing some modes and/or have some 
others. This is the way to go.

I will submit something for v4 if nobody is against this idea.

>> diff --git a/include/uapi/linux/st-vgxy61.h b/include/uapi/linux/st-vgxy61.h
>> new file mode 100644
>> index 000000000000..fbabe2cb64ac
>> --- /dev/null
>> +++ b/include/uapi/linux/st-vgxy61.h
>> @@ -0,0 +1,15 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (C) 2022 STMicroelectronics SA
>> + *
>> + */
>> +
>> +#ifndef __UAPI_STVGXY61_H_
>> +#define __UAPI_STVGXY61_H_
>> +
>> +#include <linux/v4l2-controls.h>
>> +
>> +/* Control HDR mode */
>> +#define V4L2_CID_STVGXY61_HDR	(V4L2_CID_USER_STVGXY61_BASE + 0)
>> +
>> +#endif /* __UAPI_STVGXY61_H_ */
> 
