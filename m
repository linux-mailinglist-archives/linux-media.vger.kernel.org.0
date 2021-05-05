Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E67E373B6D
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 14:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233167AbhEEMhb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 08:37:31 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:3031 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbhEEMh2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 May 2021 08:37:28 -0400
Received: from fraeml701-chm.china.huawei.com (unknown [172.18.147.201])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FZwwq3HLLz6rlcd;
        Wed,  5 May 2021 20:28:27 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml701-chm.china.huawei.com (10.206.15.50) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 5 May 2021 14:36:29 +0200
Received: from localhost (10.52.120.138) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 5 May 2021
 13:36:28 +0100
Date:   Wed, 5 May 2021 13:34:50 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC:     <linuxarm@huawei.com>, <mauro.chehab@huawei.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski@canonical.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH 24/25] media: exynos-gsc: fix pm_runtime_get_sync()
 usage count
Message-ID: <20210505133450.00001fda@Huawei.com>
In-Reply-To: <d73f24e33fb9b1cc0ff968bec833184c6510b9ec.1620207353.git.mchehab+huawei@kernel.org>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
        <d73f24e33fb9b1cc0ff968bec833184c6510b9ec.1620207353.git.mchehab+huawei@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.52.120.138]
X-ClientProxiedBy: lhreml725-chm.china.huawei.com (10.201.108.76) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 5 May 2021 11:42:14 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> The pm_runtime_get_sync() internally increments the
> dev->power.usage_count without decrementing it, even on errors.
> Replace it by the new pm_runtime_resume_and_get(), introduced by:
> commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> in order to properly decrement the usage counter, avoiding
> a potential PM usage counter leak.
> 
> As a bonus, as pm_runtime_get_sync() always return 0 on
> success, the logic can be simplified.
> 
> Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/media/platform/exynos-gsc/gsc-m2m.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/exynos-gsc/gsc-m2m.c b/drivers/media/platform/exynos-gsc/gsc-m2m.c
> index 27a3c92c73bc..f1cf847d1cc2 100644
> --- a/drivers/media/platform/exynos-gsc/gsc-m2m.c
> +++ b/drivers/media/platform/exynos-gsc/gsc-m2m.c
> @@ -56,10 +56,8 @@ static void __gsc_m2m_job_abort(struct gsc_ctx *ctx)
>  static int gsc_m2m_start_streaming(struct vb2_queue *q, unsigned int count)
>  {
>  	struct gsc_ctx *ctx = q->drv_priv;
> -	int ret;
>  
> -	ret = pm_runtime_get_sync(&ctx->gsc_dev->pdev->dev);
> -	return ret > 0 ? 0 : ret;
> +	return pm_runtime_resume_and_get(&ctx->gsc_dev->pdev->dev);
>  }
>  
>  static void __gsc_m2m_cleanup_queue(struct gsc_ctx *ctx)

