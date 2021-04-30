Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80C5436FEE2
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 18:49:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbhD3Qtw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 12:49:52 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2964 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbhD3Qtw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 12:49:52 -0400
Received: from fraeml738-chm.china.huawei.com (unknown [172.18.147.206])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FWyml2sMGz686Ph;
        Sat,  1 May 2021 00:41:11 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml738-chm.china.huawei.com (10.206.15.219) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 30 Apr 2021 18:49:02 +0200
Received: from localhost (10.52.125.96) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 30 Apr
 2021 17:49:01 +0100
Date:   Fri, 30 Apr 2021 17:47:27 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC:     <linuxarm@huawei.com>, <mauro.chehab@huawei.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
Subject: Re: [PATCH v4 18/79] media: sti/delta: fix pm_runtime_get_sync()
 usage count
Message-ID: <20210430174658.00002e26@Huawei.com>
In-Reply-To: <e4d120126b7c3be15d33ed8bcf07c285e14c25bf.1619621413.git.mchehab+huawei@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
        <e4d120126b7c3be15d33ed8bcf07c285e14c25bf.1619621413.git.mchehab+huawei@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.52.125.96]
X-ClientProxiedBy: lhreml721-chm.china.huawei.com (10.201.108.72) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 28 Apr 2021 16:51:39 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> The pm_runtime_get_sync() internally increments the
> dev->power.usage_count without decrementing it, even on errors.
> Replace it by the new pm_runtime_resume_and_get(), introduced by:
> commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> in order to properly decrement the usage counter and avoid memory
> leaks.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
This looks wrong.    The caller of this calls delta_put_autosuspend()
on error which calls pm_runtime_put_autosuspend() on something where
we never incremented the count after your change.

> ---
>  drivers/media/platform/sti/delta/delta-v4l2.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/sti/delta/delta-v4l2.c b/drivers/media/platform/sti/delta/delta-v4l2.c
> index c691b3d81549..9928b7c46a41 100644
> --- a/drivers/media/platform/sti/delta/delta-v4l2.c
> +++ b/drivers/media/platform/sti/delta/delta-v4l2.c
> @@ -1277,9 +1277,9 @@ int delta_get_sync(struct delta_ctx *ctx)
>  	int ret = 0;
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

