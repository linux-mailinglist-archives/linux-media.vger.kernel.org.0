Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4303D3739CC
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 14:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232139AbhEEMEg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 08:04:36 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:3016 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbhEEMEf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 May 2021 08:04:35 -0400
Received: from fraeml703-chm.china.huawei.com (unknown [172.18.147.207])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FZwBv70z0z6rlXZ;
        Wed,  5 May 2021 19:55:35 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml703-chm.china.huawei.com (10.206.15.52) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 5 May 2021 14:03:37 +0200
Received: from localhost (10.52.120.138) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 5 May 2021
 13:03:37 +0100
Date:   Wed, 5 May 2021 13:01:58 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC:     <linuxarm@huawei.com>, <mauro.chehab@huawei.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
Subject: Re: [PATCH 20/25] media: sti/delta: use pm_runtime_resume_and_get()
Message-ID: <20210505130158.000027d0@Huawei.com>
In-Reply-To: <a2056fdad3cd3d87b5e9653dc18deca83bb554c2.1620207353.git.mchehab+huawei@kernel.org>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
        <a2056fdad3cd3d87b5e9653dc18deca83bb554c2.1620207353.git.mchehab+huawei@kernel.org>
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

On Wed, 5 May 2021 11:42:10 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> added pm_runtime_resume_and_get() in order to automatically handle
> dev->power.usage_count decrement on errors.
> 
> Use the new API, in order to cleanup the error check logic.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Trivial thing inline otherwise fine.

> ---
>  drivers/media/platform/sti/delta/delta-v4l2.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/sti/delta/delta-v4l2.c b/drivers/media/platform/sti/delta/delta-v4l2.c
> index c691b3d81549..064a00a3084a 100644
> --- a/drivers/media/platform/sti/delta/delta-v4l2.c
> +++ b/drivers/media/platform/sti/delta/delta-v4l2.c
> @@ -954,10 +954,8 @@ static void delta_run_work(struct work_struct *work)
>  	/* enable the hardware */
>  	if (!dec->pm) {
>  		ret = delta_get_sync(ctx);
> -		if (ret) {
> -			delta_put_autosuspend(ctx);
> +		if (ret)
>  			goto err;
> -		}
>  	}
>  
>  	/* decode this access unit */
> @@ -1277,9 +1275,9 @@ int delta_get_sync(struct delta_ctx *ctx)
>  	int ret = 0;

Loose the init

>  
>  	/* enable the hardware */
> -	ret = pm_runtime_get_sync(delta->dev);
> +	ret = pm_runtime_resume_and_get(delta->dev);
>  	if (ret < 0) {
> -		dev_err(delta->dev, "%s pm_runtime_get_sync failed (%d)\n",
> +		dev_err(delta->dev, "%s pm_runtime_resume_and_get failed (%d)\n",
>  			__func__, ret);
>  		return ret;
>  	}

