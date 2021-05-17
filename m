Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC3C382C45
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 14:35:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234930AbhEQMhG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 08:37:06 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4715 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbhEQMhG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 08:37:06 -0400
Received: from dggems702-chm.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FkJRm4T2jzmhZW;
        Mon, 17 May 2021 20:32:20 +0800 (CST)
Received: from dggema762-chm.china.huawei.com (10.1.198.204) by
 dggems702-chm.china.huawei.com (10.3.19.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 17 May 2021 20:35:48 +0800
Received: from [10.174.179.129] (10.174.179.129) by
 dggema762-chm.china.huawei.com (10.1.198.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Mon, 17 May 2021 20:35:47 +0800
Subject: Re: [PATCH] media: hantro: Fix PM reference leak in device_run()
To:     Johan Hovold <johan@kernel.org>
CC:     <ezequiel@collabora.com>, <p.zabel@pengutronix.de>,
        <mchehab@kernel.org>, <gregkh@linuxfoundation.org>,
        <linux-media@vger.kernel.org>,
        <linux-rockchip@lists.infradead.org>,
        <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <yi.zhang@huawei.com>
References: <20210517081516.1562794-1-yukuai3@huawei.com>
 <YKInrIMZYGI1VKdl@hovoldconsulting.com>
From:   "yukuai (C)" <yukuai3@huawei.com>
Message-ID: <7ee3a948-8249-9f07-82ba-6d347037e50f@huawei.com>
Date:   Mon, 17 May 2021 20:35:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <YKInrIMZYGI1VKdl@hovoldconsulting.com>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.129]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggema762-chm.china.huawei.com (10.1.198.204)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2021/05/17 16:22, Johan Hovold wrote:
> On Mon, May 17, 2021 at 04:15:16PM +0800, Yu Kuai wrote:
>> pm_runtime_get_sync will increment pm usage counter even it failed.
>> Forgetting to putting operation will result in reference leak here.
>> Fix it by replacing it with pm_runtime_resume_and_get to keep usage
>> counter balanced.
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
>> ---
>>   drivers/staging/media/hantro/hantro_drv.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
>> index eea2009fa17b..7a6d3ef22096 100644
>> --- a/drivers/staging/media/hantro/hantro_drv.c
>> +++ b/drivers/staging/media/hantro/hantro_drv.c
>> @@ -160,7 +160,7 @@ static void device_run(void *priv)
>>   	src = hantro_get_src_buf(ctx);
>>   	dst = hantro_get_dst_buf(ctx);
>>   
>> -	ret = pm_runtime_get_sync(ctx->dev->dev);
>> +	ret = pm_runtime_resume_and_get(ctx->dev->dev);
>>   	if (ret < 0) {
>>   		pm_runtime_put_noidle(ctx->dev->dev);
> 
> This is clearly broken as there is no PM usage count leak here.
> 
> Please try to understand the code you're changing before submitting any
> more patches based on "robot" feedback.

Hi,

Sorry about the mistake, and thank you very much for your explanation

Yu Kuai
> 
>>   		goto err_cancel_job;
> 
> Johan
> .
> 
