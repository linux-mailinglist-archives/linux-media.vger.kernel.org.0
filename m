Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 323D5624506
	for <lists+linux-media@lfdr.de>; Thu, 10 Nov 2022 16:05:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230324AbiKJPFK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Nov 2022 10:05:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbiKJPFH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Nov 2022 10:05:07 -0500
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 819E618B26
        for <linux-media@vger.kernel.org>; Thu, 10 Nov 2022 07:05:06 -0800 (PST)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AAEvtH8031631;
        Thu, 10 Nov 2022 16:04:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=4gF578ExNH07Lc9DfDPMF3cEAXfOZuhpOjSsRZ6L3M0=;
 b=r7wAFu3O6vPv9RXq7+NiEknMjMVhTU37nK2zn0crQa8iqyNQloyV83SAMaBnt9OcXx6/
 k/s6LtKYoifnaAsPYYEv9TJ+vGH7XyLGddWotSsc+aZt85dhswMV0YLizWgCnsR4d0cu
 RwXI3QF+uioC7Mfjabd49VuwOnuBjIvze/80hyjy9yqZ1VL+HOO8wMTapVIPjk7LeB6Q
 dwAZ+jdch9Tbzi8YF3h5iyLgpj2RYNrPAIyeSVP3pkI85HyroIB5TZc0vnRHTjFcv2BQ
 rbgNNpOllfGpwBt2iec/GNoGfXaZVOfMB0TzxZgk5NF8xSITyb10CSLY/6KISAgocD7H QA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ks3h9r1er-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 10 Nov 2022 16:04:40 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1FF1D100038;
        Thu, 10 Nov 2022 16:04:35 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1A4552291D6;
        Thu, 10 Nov 2022 16:04:35 +0100 (CET)
Received: from [10.211.12.224] (10.211.12.224) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Thu, 10 Nov
 2022 16:04:34 +0100
Message-ID: <2cb3af44-8624-ded7-a904-5261f619f436@foss.st.com>
Date:   Thu, 10 Nov 2022 16:04:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [sailus-media-tree:master 17/47]
 drivers/media/i2c/st-vgxy61.c:891 vgxy61_apply_gpiox_strobe_mode() warn:
 impossible condition '(reg < 0) => (0-u16max < 0)'
Content-Language: en-US
To:     Dan Carpenter <error27@gmail.com>
CC:     <oe-kbuild@lists.linux.dev>, <lkp@intel.com>,
        <oe-kbuild-all@lists.linux.dev>, <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <202211091255.jCcREh11-lkp@intel.com>
 <fcb1fc9c-df59-aefd-93f7-9acd2df44f91@foss.st.com> <Y2z4n8b+tEtzNR/4@kadam>
 <Y20ErxBkDVVGzYim@kadam> <Y20FWdCTPiKWOdNd@kadam>
From:   Benjamin MUGNIER <benjamin.mugnier@foss.st.com>
In-Reply-To: <Y20FWdCTPiKWOdNd@kadam>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.211.12.224]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-10_10,2022-11-09_01,2022-06-22_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/10/22 15:06, Dan Carpenter wrote:
> On Thu, Nov 10, 2022 at 05:03:27PM +0300, Dan Carpenter wrote:
>> On Thu, Nov 10, 2022 at 04:11:59PM +0300, Dan Carpenter wrote:
>>> On Thu, Nov 10, 2022 at 12:43:30PM +0100, Benjamin MUGNIER wrote:
>>>> After running smatch on my tree I couldn't reproduce this warning:
>>>>   warn: pm_runtime_get_sync() also returns 1 on success
>>>> I'm using the latest smatch cloned from github. Do you append some
>>>> options to kchecker to get this output ?
>>>
>>> TL;DR: Thanks for the report!  I will fix it later this week.
>>>
>>
>> [ snip ]
>>
>>> It creates a fake environment to test what !ret means
>>> for uninitialized variables.  The check_pm_runtime_get_sync.c check sees
>>> the "!ret" condition and says, "Nope.  That's supposed to be "ret < 0"".
>>>
>>> Smatch shouldn't be printing warnings from inside the fake environment.
>>
>> Nope.  That's not it...  It already has code to not print from a fake
>> environment (unless you're in debug mode).  It's a mystery how the
>> kbuild bot triggered this warning.
>>
>> :(
> 
> Ah...  Seeing your patch helped me figure it out.  The kbuild bot does
> not have the cross function db built so when it sees:
> 
> 	vgxy61_write_reg(sensor, VGXY61_REG_ROI0_START_V, crop->top, &ret);
> 
> Then it doesn't see that "ret" is modified.  On my system I have the
> DB so I don't see the warning.

I also have the DB, so that explains why.

However, 'vgxy61_write_reg' does not always modify 'ret'. In fact it's
worse, at the beginning it checks if it not 0 in 'vgxy61_write_multiple'
and returns if it's not:
  if (err && *err)
    return *err;
with 'err' being an alias to 'ret'.

I did this to avoid checking all my i2c writes. I just send a bunch of
them and check the return code at the end. But if one i2c write fails,
'err' is filled and all following writes are aborted due to the code above.

To summarize: if 'pm_runtime_get_sync' ever returned 1, no i2c write was
performed. That's why I needed to set 'ret' to 0 in my patch.


The warning spared me from debugging this, thanks a lot.
Could this warning be produced even with having the DB?

> 
> regards,
> dan carpenter
> 

-- 
Regards,

Benjamin
