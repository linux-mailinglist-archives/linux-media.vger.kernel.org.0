Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B341B3A74D3
	for <lists+linux-media@lfdr.de>; Tue, 15 Jun 2021 05:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbhFODRH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 23:17:07 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:4905 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229869AbhFODRG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 23:17:06 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4G3rxH3x8kz6yrs;
        Tue, 15 Jun 2021 09:55:15 +0800 (CST)
Received: from dggpeml500020.china.huawei.com (7.185.36.88) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 15 Jun 2021 09:58:24 +0800
Received: from [10.174.177.174] (10.174.177.174) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 15 Jun 2021 09:58:23 +0800
Subject: Re: [PATCH -next] drm/nouveau: Remove set but not used variable 'dev'
To:     <bskeggs@redhat.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
        <sumit.semwal@linaro.org>, <christian.koenig@amd.com>,
        <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linaro-mm-sig@lists.linaro.org>
CC:     <weiyongjun1@huawei.com>, <yuehaibing@huawei.com>,
        <yangjihong1@huawei.com>, <yukuai3@huawei.com>
References: <20210525082511.580068-1-libaokun1@huawei.com>
From:   "libaokun (A)" <libaokun1@huawei.com>
Message-ID: <cee44d34-81c1-4972-e68b-e6b193598763@huawei.com>
Date:   Tue, 15 Jun 2021 09:58:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210525082511.580068-1-libaokun1@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.174]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

ping

在 2021/5/25 16:25, Baokun Li 写道:
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/gpu/drm/nouveau/nouveau_bo.c: In function 'nouveau_ttm_tt_populate':
> drivers/gpu/drm/nouveau/nouveau_bo.c:1258:17: warning:
>   variable ‘dev’ set but not used [-Wunused-but-set-variable]
>
> drivers/gpu/drm/nouveau/nouveau_bo.c: In function 'nouveau_ttm_tt_unpopulate':
> drivers/gpu/drm/nouveau/nouveau_bo.c:1281:17: warning:
>   variable ‘dev’ set but not used [-Wunused-but-set-variable]
>
> It never used since introduction.
>
> Signed-off-by: Baokun Li <libaokun1@huawei.com>
> ---
>   drivers/gpu/drm/nouveau/nouveau_bo.c | 4 ----
>   1 file changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 7a2624c0ba4c..51f9a2e6532e 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -1254,7 +1254,6 @@ nouveau_ttm_tt_populate(struct ttm_device *bdev,
>   {
>   	struct ttm_tt *ttm_dma = (void *)ttm;
>   	struct nouveau_drm *drm;
> -	struct device *dev;
>   	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
>   
>   	if (ttm_tt_is_populated(ttm))
> @@ -1267,7 +1266,6 @@ nouveau_ttm_tt_populate(struct ttm_device *bdev,
>   	}
>   
>   	drm = nouveau_bdev(bdev);
> -	dev = drm->dev->dev;
>   
>   	return ttm_pool_alloc(&drm->ttm.bdev.pool, ttm, ctx);
>   }
> @@ -1277,14 +1275,12 @@ nouveau_ttm_tt_unpopulate(struct ttm_device *bdev,
>   			  struct ttm_tt *ttm)
>   {
>   	struct nouveau_drm *drm;
> -	struct device *dev;
>   	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
>   
>   	if (slave)
>   		return;
>   
>   	drm = nouveau_bdev(bdev);
> -	dev = drm->dev->dev;
>   
>   	return ttm_pool_free(&drm->ttm.bdev.pool, ttm);
>   }
