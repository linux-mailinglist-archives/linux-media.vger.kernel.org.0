Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB19A36FE7F
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 18:29:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbhD3Qak (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 12:30:40 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2958 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229821AbhD3Qak (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 12:30:40 -0400
Received: from fraeml715-chm.china.huawei.com (unknown [172.18.147.207])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FWyLb22clz71fjS;
        Sat,  1 May 2021 00:21:59 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml715-chm.china.huawei.com (10.206.15.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 30 Apr 2021 18:29:50 +0200
Received: from localhost (10.52.124.90) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 30 Apr
 2021 17:29:49 +0100
Date:   Fri, 30 Apr 2021 17:28:15 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC:     <linuxarm@huawei.com>, <mauro.chehab@huawei.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v4 12/79] media: renesas-ceu: Properly check for PM
 errors
Message-ID: <20210430172815.00007111@Huawei.com>
In-Reply-To: <70e2f612d1d3b7ad74fbfc5f90850f3874670fb2.1619621413.git.mchehab+huawei@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
        <70e2f612d1d3b7ad74fbfc5f90850f3874670fb2.1619621413.git.mchehab+huawei@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.52.124.90]
X-ClientProxiedBy: lhreml719-chm.china.huawei.com (10.201.108.70) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 28 Apr 2021 16:51:33 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Right now, the driver just assumes that PM runtime resume
> worked, but it may fail.
> 
> Well, the pm_runtime_get_sync() internally increments the
> dev->power.usage_count without decrementing it, even on errors.
> 
> So, using it is tricky. Let's replace it by the new
> pm_runtime_resume_and_get(), introduced by:
> commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> and return an error if something bad happens.
> 
> This should ensure that the PM runtime usage_count will be
> properly decremented if an error happens at open time.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
LGTM
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/media/platform/renesas-ceu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas-ceu.c b/drivers/media/platform/renesas-ceu.c
> index cd137101d41e..17f01b6e3fe0 100644
> --- a/drivers/media/platform/renesas-ceu.c
> +++ b/drivers/media/platform/renesas-ceu.c
> @@ -1099,10 +1099,10 @@ static int ceu_open(struct file *file)
>  
>  	mutex_lock(&ceudev->mlock);
>  	/* Causes soft-reset and sensor power on on first open */
> -	pm_runtime_get_sync(ceudev->dev);
> +	ret = pm_runtime_resume_and_get(ceudev->dev);
>  	mutex_unlock(&ceudev->mlock);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static int ceu_release(struct file *file)

