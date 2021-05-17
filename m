Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6E76382B52
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 13:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236803AbhEQLlb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 07:41:31 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2998 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236720AbhEQLlb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 07:41:31 -0400
Received: from dggems703-chm.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FkHCd3JgzzQnCJ;
        Mon, 17 May 2021 19:36:45 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggems703-chm.china.huawei.com (10.3.19.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 17 May 2021 19:40:13 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpeml500017.china.huawei.com (7.185.36.243) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 17 May 2021 19:40:13 +0800
Subject: Re: [PATCH -next] media: i2c: ov5648: fix wrong pointer passed to
 IS_ERR() and PTR_ERR()
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <mchehab@kernel.org>
References: <20210330130446.1053644-1-yangyingliang@huawei.com>
Message-ID: <f4480fa4-3b7b-cce2-034b-9f458b1026d4@huawei.com>
Date:   Mon, 17 May 2021 19:40:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20210330130446.1053644-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

ping...

On 2021/3/30 21:04, Yang Yingliang wrote:
> IS_ERR() and PTR_ERR() use wrong pointer, it should be
> sensor->dovdd, fix it.
>
> Fixes: e43ccb0a045f ("media: i2c: Add support for the OV5648 image sensor")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>   drivers/media/i2c/ov5648.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
> index dfe38ab8224d..db6f626f92fb 100644
> --- a/drivers/media/i2c/ov5648.c
> +++ b/drivers/media/i2c/ov5648.c
> @@ -2494,9 +2494,9 @@ static int ov5648_probe(struct i2c_client *client)
>   
>   	/* DOVDD: digital I/O */
>   	sensor->dovdd = devm_regulator_get(dev, "dovdd");
> -	if (IS_ERR(sensor->dvdd)) {
> +	if (IS_ERR(sensor->dovdd)) {
>   		dev_err(dev, "cannot get DOVDD (digital I/O) regulator\n");
> -		ret = PTR_ERR(sensor->dvdd);
> +		ret = PTR_ERR(sensor->dovdd);
>   		goto error_endpoint;
>   	}
>   
