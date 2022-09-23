Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 525865E73EE
	for <lists+linux-media@lfdr.de>; Fri, 23 Sep 2022 08:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230206AbiIWGZM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Sep 2022 02:25:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbiIWGZL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Sep 2022 02:25:11 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D44A9B87E;
        Thu, 22 Sep 2022 23:25:09 -0700 (PDT)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MYhpb5MpdzMp1N;
        Fri, 23 Sep 2022 14:20:23 +0800 (CST)
Received: from kwepemm600010.china.huawei.com (7.193.23.86) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 23 Sep 2022 14:25:06 +0800
Received: from [10.174.178.31] (10.174.178.31) by
 kwepemm600010.china.huawei.com (7.193.23.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 23 Sep 2022 14:25:05 +0800
Subject: Re: [PATCH 2/3] media: platform: mtk-mdp3: fix PM reference leak in
 mdp_comp_clock_on()
To:     <mchehab@kernel.org>, <matthias.bgg@gmail.com>,
        <hverkuil-cisco@xs4all.nl>, <ping-hsun.wu@mediatek.com>,
        <daoyuan.huang@mediatek.com>, <moudy.ho@mediatek.com>
CC:     <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <kernel-janitors@vger.kernel.org>
References: <20220902085820.3777360-1-sunke32@huawei.com>
 <20220902085820.3777360-3-sunke32@huawei.com>
From:   Sun Ke <sunke32@huawei.com>
Message-ID: <38c78ee6-8b7e-34fb-1dc0-8b2d28acdd3d@huawei.com>
Date:   Fri, 23 Sep 2022 14:25:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20220902085820.3777360-3-sunke32@huawei.com>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.31]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600010.china.huawei.com (7.193.23.86)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

ping...

ÔÚ 2022/9/2 16:58, Sun Ke Ð´µÀ:
> mdp_comp_clock_on will increase runtime PM usage counter,
> and mdp_comp_clock_off will decrease the runtime PM usage counter.
> so, if mdp_comp_clock_on failed after increment runtime PM usage
> counter, it should decrease it before return a error code.
> 
> pm_runtime_get_sync will increment pm usage counter even it failed.
> Forgetting to putting operation will result in reference leak here.
> Fix it by replacing it with pm_runtime_resume_and_get to keep usage
> counter balanced.
> 
> And if failed to enable clk, add pm_runtime_put() to decrease the
> runtime PM usage counter.
> 
> Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
> Signed-off-by: Sun Ke <sunke32@huawei.com>
> ---
>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
> index 9a6ba5851ccb..d3eaf8884412 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
> @@ -682,7 +682,7 @@ int mdp_comp_clock_on(struct device *dev, struct mdp_comp *comp)
>   	int i, ret;
>   
>   	if (comp->comp_dev) {
> -		ret = pm_runtime_get_sync(comp->comp_dev);
> +		ret = pm_runtime_resume_and_get(comp->comp_dev);
>   		if (ret < 0) {
>   			dev_err(dev,
>   				"Failed to get power, err %d. type:%d id:%d\n",
> @@ -699,6 +699,7 @@ int mdp_comp_clock_on(struct device *dev, struct mdp_comp *comp)
>   			dev_err(dev,
>   				"Failed to enable clk %d. type:%d id:%d\n",
>   				i, comp->type, comp->id);
> +			pm_runtime_put(comp->comp_dev);
>   			return ret;
>   		}
>   	}
> 
