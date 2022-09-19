Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E241C5BD0F1
	for <lists+linux-media@lfdr.de>; Mon, 19 Sep 2022 17:30:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230070AbiISPaQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Sep 2022 11:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230049AbiISPaP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Sep 2022 11:30:15 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EEAD120AF
        for <linux-media@vger.kernel.org>; Mon, 19 Sep 2022 08:30:10 -0700 (PDT)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MWT5L6tPrzMmx8;
        Mon, 19 Sep 2022 23:25:26 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 19 Sep 2022 23:30:07 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 19 Sep 2022 23:30:06 +0800
Subject: Re: [PATCH -next 00/13] media: Switch to use dev_err_probe() helper
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     <linux-media@vger.kernel.org>, <mchehab@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <pavel@ucw.cz>,
        <sakari.ailus@linux.intel.com>, <sean@mess.org>
References: <20220915150324.688062-1-yangyingliang@huawei.com>
 <Yyh/uouJ8hHmD/Mc@pendragon.ideasonboard.com>
From:   Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <00d0b240-e350-c3e0-92cc-5c85a75a7951@huawei.com>
Date:   Mon, 19 Sep 2022 23:30:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <Yyh/uouJ8hHmD/Mc@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 2022/9/19 22:42, Laurent Pinchart wrote:
> Hi Yang,
>
> On Thu, Sep 15, 2022 at 11:03:11PM +0800, Yang Yingliang wrote:
>> In the probe path, dev_err() can be replace with dev_err_probe()
>> which will check if error code is -EPROBE_DEFER. It will print
>> error code in a human readable way and simplify the code.
> How would you like to get this merged ? A few patches need fixes, and
> all of them could benefit from a typo fix in the commit message. If you
> send a v2, it could be merged in one go instead of individual
> maintainers taking patches in their tree. Hans, would you handle this ?
OK, I can merge them in one and send a v2.

Thanks,
Yang
>
>> Yang Yingliang (13):
>>    media: platform: stm32-cec: Switch to use dev_err_probe() helper
>>    media: i2c: ad5820: Switch to use dev_err_probe() helper
>>    media: i2c: imx274: Switch to use dev_err_probe() helper
>>    media: i2c: tc358743: Switch to use dev_err_probe() helper
>>    media: platform: mtk_mdp_comp: Switch to use dev_err_probe() helper
>>    media: platform: exynos4-is: Switch to use dev_err_probe() helper
>>    media: stm32-dcmi: Switch to use dev_err_probe() helper
>>    media: omap3isp: Switch to use dev_err_probe() helper
>>    media: xilinx: csi2rxss: Switch to use dev_err_probe() helper
>>    media: rc: gpio-ir-recv: Switch to use dev_err_probe() helper
>>    media: rc: gpio-ir-tx: Switch to use dev_err_probe() helper
>>    media: rc: ir-rx51: Switch to use dev_err_probe() helper
>>    media: uvcvideo: Switch to use dev_err_probe() helper
>>
>>   drivers/media/cec/platform/stm32/stm32-cec.c  |  9 +++----
>>   drivers/media/i2c/ad5820.c                    | 18 +++++--------
>>   drivers/media/i2c/imx274.c                    |  5 ++--
>>   drivers/media/i2c/tc358743.c                  |  9 +++----
>>   .../platform/mediatek/mdp/mtk_mdp_comp.c      |  5 ++--
>>   .../platform/samsung/exynos4-is/media-dev.c   |  4 +--
>>   drivers/media/platform/st/stm32/stm32-dcmi.c  | 27 +++++++------------
>>   drivers/media/platform/ti/omap3isp/isp.c      |  3 +--
>>   .../media/platform/xilinx/xilinx-csi2rxss.c   |  8 +++---
>>   drivers/media/rc/gpio-ir-recv.c               | 10 +++----
>>   drivers/media/rc/gpio-ir-tx.c                 |  9 +++----
>>   drivers/media/rc/ir-rx51.c                    |  9 ++-----
>>   drivers/media/usb/uvc/uvc_driver.c            |  9 +++----
>>   13 files changed, 41 insertions(+), 84 deletions(-)
