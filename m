Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1231136FF50
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 19:14:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230473AbhD3RP0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 13:15:26 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2971 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbhD3RP0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 13:15:26 -0400
Received: from fraeml738-chm.china.huawei.com (unknown [172.18.147.206])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FWzGy0pltz70gFK;
        Sat,  1 May 2021 01:03:54 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml738-chm.china.huawei.com (10.206.15.219) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 30 Apr 2021 19:14:36 +0200
Received: from localhost (10.52.125.96) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 30 Apr
 2021 18:14:35 +0100
Date:   Fri, 30 Apr 2021 18:13:00 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC:     <linuxarm@huawei.com>, <mauro.chehab@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        <devel@driverdev.osuosl.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v4 26/79] staging: media: tegra-video: use
 pm_runtime_resume_and_get()
Message-ID: <20210430181300.00003f78@Huawei.com>
In-Reply-To: <956254cdffbc7d07b30e41f7b7cb41cf60bbfc72.1619621413.git.mchehab+huawei@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
        <956254cdffbc7d07b30e41f7b7cb41cf60bbfc72.1619621413.git.mchehab+huawei@kernel.org>
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

On Wed, 28 Apr 2021 16:51:47 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> added pm_runtime_resume_and_get() in order to automatically handle
> dev->power.usage_count decrement on errors.
> 
> Use the new API, in order to cleanup the error check logic.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
NOP patch so 
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  drivers/staging/media/tegra-video/csi.c | 3 +--
>  drivers/staging/media/tegra-video/vi.c  | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
> index 033a6935c26d..e938bf4c48b6 100644
> --- a/drivers/staging/media/tegra-video/csi.c
> +++ b/drivers/staging/media/tegra-video/csi.c
> @@ -298,10 +298,9 @@ static int tegra_csi_enable_stream(struct v4l2_subdev *subdev)
>  	struct tegra_csi *csi = csi_chan->csi;
>  	int ret, err;
>  
> -	ret = pm_runtime_get_sync(csi->dev);
> +	ret = pm_runtime_resume_and_get(csi->dev);
>  	if (ret < 0) {
>  		dev_err(csi->dev, "failed to get runtime PM: %d\n", ret);
> -		pm_runtime_put_noidle(csi->dev);
>  		return ret;
>  	}
>  
> diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
> index 7a09061cda57..1298740a9c6c 100644
> --- a/drivers/staging/media/tegra-video/vi.c
> +++ b/drivers/staging/media/tegra-video/vi.c
> @@ -297,10 +297,9 @@ static int tegra_channel_start_streaming(struct vb2_queue *vq, u32 count)
>  	struct tegra_vi_channel *chan = vb2_get_drv_priv(vq);
>  	int ret;
>  
> -	ret = pm_runtime_get_sync(chan->vi->dev);
> +	ret = pm_runtime_resume_and_get(chan->vi->dev);
>  	if (ret < 0) {
>  		dev_err(chan->vi->dev, "failed to get runtime PM: %d\n", ret);
> -		pm_runtime_put_noidle(chan->vi->dev);
>  		return ret;
>  	}
>  

