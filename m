Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7F67646634
	for <lists+linux-media@lfdr.de>; Thu,  8 Dec 2022 02:00:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbiLHBAu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Dec 2022 20:00:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbiLHBAt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Dec 2022 20:00:49 -0500
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA18284DF1
        for <linux-media@vger.kernel.org>; Wed,  7 Dec 2022 17:00:47 -0800 (PST)
Received: from kwepemi500016.china.huawei.com (unknown [172.30.72.57])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NSG5k18mYzRpqH;
        Thu,  8 Dec 2022 08:59:54 +0800 (CST)
Received: from [10.174.176.230] (10.174.176.230) by
 kwepemi500016.china.huawei.com (7.221.188.220) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Dec 2022 09:00:12 +0800
Message-ID: <d0c200f5-9995-d1cc-45a7-2d7a6f1db09c@huawei.com>
Date:   Thu, 8 Dec 2022 09:00:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Subject: Re: [PATCH] media: max9286: Fix memleak in max9286_v4l2_register()
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        <jacopo+renesas@jmondi.org>,
        <kieran.bingham+renesas@ideasonboard.com>, <mchehab@kernel.org>,
        <sakari.ailus@linux.intel.com>, <linux-media@vger.kernel.org>
References: <20221206130555.9322-1-shangxiaojing@huawei.com>
 <Y49QPaYDe2iZjBLu@oden.dyn.berto.se>
 <Y4+uSMEQSaYLiExO@pendragon.ideasonboard.com>
 <0c95c17e-7fc9-3225-2c57-d7fc8ba00f39@huawei.com>
 <Y4/5bFxTc4Q5xVy+@oden.dyn.berto.se>
 <96f2fbc6-845e-d387-7346-20622697d7d0@huawei.com>
 <Y5BJ+V88K21W5vFL@oden.dyn.berto.se>
From:   shangxiaojing <shangxiaojing@huawei.com>
In-Reply-To: <Y5BJ+V88K21W5vFL@oden.dyn.berto.se>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.176.230]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500016.china.huawei.com (7.221.188.220)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2022/12/7 16:08, Niklas Söderlund wrote:
> Hello Shang,
> 
> On 2022-12-07 11:27:54 +0800, shangxiaojing wrote:
>>
>>
>> On 2022/12/7 10:24, Niklas Söderlund wrote:
>>> Hi Shang,
>>>
>>> On 2022-12-07 09:45:07 +0800, shangxiaojing wrote:
>>>>
>>>>
>>>> On 2022/12/7 5:04, Laurent Pinchart wrote:
>>>>> On Tue, Dec 06, 2022 at 03:22:53PM +0100, Niklas Söderlund wrote:
>>>>>> Hi Shang,
>>>>>>
>>>>>> Thanks for your work.
>>>>>>
>>>>>> On 2022-12-06 21:05:55 +0800, Shang XiaoJing wrote:
>>>>>>> There is a kmemleak when testing the media/i2c/max9286.c with bpf mock
>>>>>>> device:
>>>>>>
>>>>>> Out of curiosity, what exactly is a bpf mock device?
>>>>>
>>>>> I'm curious as well, is it something like
>>>>> https://lwn.net/Articles/906236/ but for I2C devices ?
>>>>
>>>> Yes, I'm using the tool provided by Yongjun, and now it can support for the
>>>> tests of spi drivers and i2c drivers, which is still in the preliminary
>>>> validation phase.
>>>
>>> Is there a public repository for the MAX9286 work already available? Or
>>> any other V4L2 related device?
>>
>> The test of MAX9286 is build temporarily, and maybe here's no public
>> repository yet. V4L2 neither.
>>
>> I'm sorry but please wait for the completaion of the verification to the
>> mock test tool. And then the tool will push to the community.
> 
> No problem, thanks for this sneak preview of what this work can do. Out
> of curiosity, where will this work be announced? I don't subscribe to
> many mailing lists.

Sorry, I'm not sure actually, but maybe https://lwn.net/Articles/906236/ 
can give some suggection to us.


Thanks,
-- 
Shang XiaoJing
