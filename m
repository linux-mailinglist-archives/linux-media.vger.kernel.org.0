Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6603F5E7B48
	for <lists+linux-media@lfdr.de>; Fri, 23 Sep 2022 15:04:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231694AbiIWNES (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Sep 2022 09:04:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230448AbiIWNEO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Sep 2022 09:04:14 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 317AB138F04;
        Fri, 23 Sep 2022 06:04:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E0B0FB82653;
        Fri, 23 Sep 2022 13:04:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF145C433C1;
        Fri, 23 Sep 2022 13:04:08 +0000 (UTC)
Message-ID: <cca427ac-436d-9cee-d3e7-8a957a0add25@xs4all.nl>
Date:   Fri, 23 Sep 2022 15:04:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/3] media: platform: mtk-mdp3: fix PM reference leak in
 mdp_comp_clock_on()
Content-Language: en-US
To:     Sun Ke <sunke32@huawei.com>, mchehab@kernel.org,
        matthias.bgg@gmail.com, ping-hsun.wu@mediatek.com,
        daoyuan.huang@mediatek.com, moudy.ho@mediatek.com
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
References: <20220902085820.3777360-1-sunke32@huawei.com>
 <20220902085820.3777360-3-sunke32@huawei.com>
 <38c78ee6-8b7e-34fb-1dc0-8b2d28acdd3d@huawei.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <38c78ee6-8b7e-34fb-1dc0-8b2d28acdd3d@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It's in a pull request, waiting to be merged.

Regards,

	Hans

On 23/09/2022 08:25, Sun Ke wrote:
> ping...
> 
> 在 2022/9/2 16:58, Sun Ke 写道:
>> mdp_comp_clock_on will increase runtime PM usage counter,
>> and mdp_comp_clock_off will decrease the runtime PM usage counter.
>> so, if mdp_comp_clock_on failed after increment runtime PM usage
>> counter, it should decrease it before return a error code.
>>
>> pm_runtime_get_sync will increment pm usage counter even it failed.
>> Forgetting to putting operation will result in reference leak here.
>> Fix it by replacing it with pm_runtime_resume_and_get to keep usage
>> counter balanced.
>>
>> And if failed to enable clk, add pm_runtime_put() to decrease the
>> runtime PM usage counter.
>>
>> Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
>> Signed-off-by: Sun Ke <sunke32@huawei.com>
>> ---
>>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
>> index 9a6ba5851ccb..d3eaf8884412 100644
>> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
>> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
>> @@ -682,7 +682,7 @@ int mdp_comp_clock_on(struct device *dev, struct mdp_comp *comp)
>>       int i, ret;
>>         if (comp->comp_dev) {
>> -        ret = pm_runtime_get_sync(comp->comp_dev);
>> +        ret = pm_runtime_resume_and_get(comp->comp_dev);
>>           if (ret < 0) {
>>               dev_err(dev,
>>                   "Failed to get power, err %d. type:%d id:%d\n",
>> @@ -699,6 +699,7 @@ int mdp_comp_clock_on(struct device *dev, struct mdp_comp *comp)
>>               dev_err(dev,
>>                   "Failed to enable clk %d. type:%d id:%d\n",
>>                   i, comp->type, comp->id);
>> +            pm_runtime_put(comp->comp_dev);
>>               return ret;
>>           }
>>       }
>>

