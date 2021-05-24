Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BE0738E7C1
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 15:36:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232858AbhEXNh5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 09:37:57 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3651 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232401AbhEXNh5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 09:37:57 -0400
Received: from dggems706-chm.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FpdSM5pW1zNypK;
        Mon, 24 May 2021 21:32:51 +0800 (CST)
Received: from dggeml759-chm.china.huawei.com (10.1.199.138) by
 dggems706-chm.china.huawei.com (10.3.19.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 24 May 2021 21:36:27 +0800
Received: from [10.174.178.165] (10.174.178.165) by
 dggeml759-chm.china.huawei.com (10.1.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Mon, 24 May 2021 21:36:26 +0800
Subject: Re: [PATCH -next] media: staging: tegra-vde: Fix error return code in
 tegra_vde_probe()
To:     Dmitry Osipenko <digetx@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "Philipp Zabel" <p.zabel@pengutronix.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
CC:     <linux-media@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-staging@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>,
        <kernel-janitors@vger.kernel.org>, "Hulk Robot" <hulkci@huawei.com>
References: <20210524133550.2363884-1-weiyongjun1@huawei.com>
 <db911ac9-2d08-ae30-03ea-dfb7db964441@gmail.com>
 <1e05ad22-c4d8-c443-5377-7cd9db024cb9@gmail.com>
From:   "weiyongjun (A)" <weiyongjun1@huawei.com>
Message-ID: <20768acd-2ab5-2e7e-263d-d3176268412e@huawei.com>
Date:   Mon, 24 May 2021 21:36:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1e05ad22-c4d8-c443-5377-7cd9db024cb9@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.165]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggeml759-chm.china.huawei.com (10.1.199.138)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


> 24.05.2021 16:27, Dmitry Osipenko пишет:
>> 24.05.2021 16:35, Wei Yongjun пишет:
>>> Fix to return a negative error code from the error handling
>>> case instead of 0, as done elsewhere in this function.
>>>
>>> Fixes: dc8276b78917 ("staging: media: tegra-vde: use pm_runtime_resume_and_get()")
>>> Reported-by: Hulk Robot <hulkci@huawei.com>
>>> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
>>> ---
>>>   drivers/staging/media/tegra-vde/vde.c | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
>>> index e025b69776f2..321d14ba2e56 100644
>>> --- a/drivers/staging/media/tegra-vde/vde.c
>>> +++ b/drivers/staging/media/tegra-vde/vde.c
>>> @@ -1071,7 +1071,8 @@ static int tegra_vde_probe(struct platform_device *pdev)
>>>   	 * power-cycle it in order to put hardware into a predictable lower
>>>   	 * power state.
>>>   	 */
>>> -	if (pm_runtime_resume_and_get(dev) < 0)
>>> +	err = pm_runtime_resume_and_get(dev);
>>> +	if (err < 0)
>>>   		goto err_pm_runtime;
>>>   
>>>   	pm_runtime_put(dev);
>>>
>> pm_runtime_resume_and_get() doesn't return positive values, the previous
>> variant was okay.
>>
>> You should also version your patches and add changelog.
>>
> Ah, sorry. The other patch is from Yang Yingliang.


Sorry, it is my bad. I missed that patch.


Regards,

Wei Yongjun

