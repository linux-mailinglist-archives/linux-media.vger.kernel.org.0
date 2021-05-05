Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFE2C373B59
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 14:34:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232934AbhEEMfg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 08:35:36 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:3027 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232200AbhEEMff (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 May 2021 08:35:35 -0400
Received: from fraeml708-chm.china.huawei.com (unknown [172.18.147.207])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FZwxF3yppz6yhyt;
        Wed,  5 May 2021 20:28:49 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml708-chm.china.huawei.com (10.206.15.36) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 5 May 2021 14:34:38 +0200
Received: from localhost (10.52.120.138) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 5 May 2021
 13:34:37 +0100
Date:   Wed, 5 May 2021 13:32:58 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC:     <linuxarm@huawei.com>, <mauro.chehab@huawei.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 18/25] media: mtk-vcodec: fix PM runtime get logic
Message-ID: <20210505133258.00002ae4@Huawei.com>
In-Reply-To: <b8d69ce52e4e455aa8c6e629e215a52847c7c9e0.1620207353.git.mchehab+huawei@kernel.org>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
        <b8d69ce52e4e455aa8c6e629e215a52847c7c9e0.1620207353.git.mchehab+huawei@kernel.org>
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

On Wed,  5 May 2021 11:42:08 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Currently, the driver just assumes that PM runtime logic
> succeded resuming the device.
> 
> That may not be the case, as pm_runtime_get_sync()
> can fail (but keeping the usage count incremented).
> 
> Replace the code to use pm_runtime_resume_and_get(),
> and letting it return the error code.
> 
> This way, if mtk_vcodec_dec_pw_on() fails, the logic
> under fops_vcodec_open() will do the right thing and
> return an error, instead of just assuming that the
> device is ready to be used.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 4 +++-
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c  | 8 +++++---
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h  | 2 +-
>  3 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> index 147dfef1638d..f87dc47d9e63 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> @@ -126,7 +126,9 @@ static int fops_vcodec_open(struct file *file)
>  	mtk_vcodec_dec_set_default_params(ctx);
>  
>  	if (v4l2_fh_is_singular(&ctx->fh)) {
> -		mtk_vcodec_dec_pw_on(&dev->pm);
> +		ret = mtk_vcodec_dec_pw_on(&dev->pm);
> +		if (ret < 0)
> +			goto err_load_fw;
>  		/*
>  		 * Does nothing if firmware was already loaded.
>  		 */
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> index ddee7046ce42..6038db96f71c 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> @@ -88,13 +88,15 @@ void mtk_vcodec_release_dec_pm(struct mtk_vcodec_dev *dev)
>  	put_device(dev->pm.larbvdec);
>  }
>  
> -void mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
> +int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
>  {
>  	int ret;
>  
> -	ret = pm_runtime_get_sync(pm->dev);
> +	ret = pm_runtime_resume_and_get(pm->dev);
>  	if (ret)
> -		mtk_v4l2_err("pm_runtime_get_sync fail %d", ret);
> +		mtk_v4l2_err("pm_runtime_resume_and_get fail %d", ret);
> +
> +	return ret;
>  }
>  
>  void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm)
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
> index 872d8bf8cfaf..280aeaefdb65 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
> @@ -12,7 +12,7 @@
>  int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *dev);
>  void mtk_vcodec_release_dec_pm(struct mtk_vcodec_dev *dev);
>  
> -void mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm);
> +int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm);
>  void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm);
>  void mtk_vcodec_dec_clock_on(struct mtk_vcodec_pm *pm);
>  void mtk_vcodec_dec_clock_off(struct mtk_vcodec_pm *pm);

