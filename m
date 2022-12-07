Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B6EC64516B
	for <lists+linux-media@lfdr.de>; Wed,  7 Dec 2022 02:45:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbiLGBp1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Dec 2022 20:45:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbiLGBpY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Dec 2022 20:45:24 -0500
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6460B5288C
        for <linux-media@vger.kernel.org>; Tue,  6 Dec 2022 17:45:21 -0800 (PST)
Received: from kwepemi500016.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NRg3n4MtczqSsG;
        Wed,  7 Dec 2022 09:41:09 +0800 (CST)
Received: from [10.174.176.230] (10.174.176.230) by
 kwepemi500016.china.huawei.com (7.221.188.220) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 7 Dec 2022 09:45:08 +0800
Message-ID: <0c95c17e-7fc9-3225-2c57-d7fc8ba00f39@huawei.com>
Date:   Wed, 7 Dec 2022 09:45:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Subject: Re: [PATCH] media: max9286: Fix memleak in max9286_v4l2_register()
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
CC:     <jacopo+renesas@jmondi.org>,
        <kieran.bingham+renesas@ideasonboard.com>, <mchehab@kernel.org>,
        <sakari.ailus@linux.intel.com>, <linux-media@vger.kernel.org>
References: <20221206130555.9322-1-shangxiaojing@huawei.com>
 <Y49QPaYDe2iZjBLu@oden.dyn.berto.se>
 <Y4+uSMEQSaYLiExO@pendragon.ideasonboard.com>
From:   shangxiaojing <shangxiaojing@huawei.com>
In-Reply-To: <Y4+uSMEQSaYLiExO@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.176.230]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
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



On 2022/12/7 5:04, Laurent Pinchart wrote:
> On Tue, Dec 06, 2022 at 03:22:53PM +0100, Niklas Söderlund wrote:
>> Hi Shang,
>>
>> Thanks for your work.
>>
>> On 2022-12-06 21:05:55 +0800, Shang XiaoJing wrote:
>>> There is a kmemleak when testing the media/i2c/max9286.c with bpf mock
>>> device:
>>
>> Out of curiosity, what exactly is a bpf mock device?
> 
> I'm curious as well, is it something like
> https://lwn.net/Articles/906236/ but for I2C devices ? 

Yes, I'm using the tool provided by Yongjun, and now it can support for 
the tests of spi drivers and i2c drivers, which is still in the 
preliminary validation phase.

> Is the implementation public ?
> 

Will send the test set to the community after the further verification 
to the tool.

By the way, here's an introduction to the tool, but now only in Chinese:

https://github.com/ChinaLinuxKernel/CLK2022/blob/main/%E5%9F%BA%E4%BA%8EeBPF%E7%9A%84%E8%AE%BE%E5%A4%87%E9%A9%B1%E5%8A%A8%E6%B5%8B%E8%AF%95%E6%A1%86%E6%9E%B6.pdf

> 
> Regardless of how this has been tested, the fix looks good.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
Thanks for the review!
-- 
Shang XiaoJing
