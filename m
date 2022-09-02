Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E986F5AAC28
	for <lists+linux-media@lfdr.de>; Fri,  2 Sep 2022 12:15:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235177AbiIBKPn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Sep 2022 06:15:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231344AbiIBKPi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Sep 2022 06:15:38 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDAF660D6;
        Fri,  2 Sep 2022 03:15:36 -0700 (PDT)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MJtzY44CrzHnYm;
        Fri,  2 Sep 2022 18:13:45 +0800 (CST)
Received: from kwepemm600010.china.huawei.com (7.193.23.86) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 2 Sep 2022 18:15:34 +0800
Received: from [10.174.178.31] (10.174.178.31) by
 kwepemm600010.china.huawei.com (7.193.23.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 2 Sep 2022 18:15:33 +0800
Subject: Re: [PATCH 3/3] media: platform: mtk-mdp3: fix error return code in
 mdp_vpu_dev_init()
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, <mchehab@kernel.org>,
        <matthias.bgg@gmail.com>, <hverkuil-cisco@xs4all.nl>,
        <ping-hsun.wu@mediatek.com>, <daoyuan.huang@mediatek.com>,
        <moudy.ho@mediatek.com>
CC:     <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <kernel-janitors@vger.kernel.org>
References: <20220902085820.3777360-1-sunke32@huawei.com>
 <20220902085820.3777360-4-sunke32@huawei.com>
 <ee6221e1-8ce6-9fe0-6094-1cd156fdaae3@collabora.com>
From:   Sun Ke <sunke32@huawei.com>
Message-ID: <957c9e9a-d729-0109-92e9-4fafe9ef7622@huawei.com>
Date:   Fri, 2 Sep 2022 18:15:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <ee6221e1-8ce6-9fe0-6094-1cd156fdaae3@collabora.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.31]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600010.china.huawei.com (7.193.23.86)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



在 2022/9/2 17:10, AngeloGioacchino Del Regno 写道:
> Il 02/09/22 10:58, Sun Ke ha scritto:
>> If mdp_vpu_shared_mem_alloc failed, mdp_vpu_dev_init should return 
>> -ENOMEM.
>>
>> Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 
>> driver")
>> Signed-off-by: Sun Ke <sunke32@huawei.com>
> 
> Hello Sun,
> thanks for the patch! However, someone else already sent the same fix 
> and it's
> in a better shape. Please look at [1].
> 
> Thanks,
> Angelo
> 
> [1]: 
> https://patchwork.kernel.org/project/linux-mediatek/patch/YxDGFMwyeNXFPaig@kili/ 

Oh. I am late.

Thanks,
Sun Ke

> 
> 
>> ---
>>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c 
>> b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
>> index 9f5844385c8f..078040b7f65e 100644
>> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
>> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
>> @@ -175,6 +175,7 @@ int mdp_vpu_dev_init(struct mdp_vpu_dev *vpu, 
>> struct mtk_scp *scp,
>>       mem_size = vpu_alloc_size;
>>       if (mdp_vpu_shared_mem_alloc(vpu)) {
>>           dev_err(&mdp->pdev->dev, "VPU memory alloc fail!");
>> +        err = -ENOMEM;
>>           goto err_mem_alloc;
>>       }
>>
> 
> 
> .
