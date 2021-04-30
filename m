Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E336536FE85
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 18:31:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbhD3QcL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 12:32:11 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2959 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbhD3QcL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 12:32:11 -0400
Received: from fraeml738-chm.china.huawei.com (unknown [172.18.147.200])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FWyK33ZbNz70gG8;
        Sat,  1 May 2021 00:20:39 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml738-chm.china.huawei.com (10.206.15.219) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 30 Apr 2021 18:31:21 +0200
Received: from localhost (10.52.124.90) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 30 Apr
 2021 17:31:20 +0100
Date:   Fri, 30 Apr 2021 17:29:45 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC:     <linuxarm@huawei.com>, <mauro.chehab@huawei.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Allen Pais <allen.lkml@gmail.com>,
        Chuhong Yuan <hslester96@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        "Hans Verkuil" <hverkuil-cisco@xs4all.nl>,
        Helen Koike <helen.koike@collabora.com>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Vaibhav Gupta" <vaibhavgupta40@gmail.com>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
Subject: Re: [PATCH v4 09/79] media: marvel-ccic: fix some issues when
 getting pm_runtime
Message-ID: <20210430172945.000000fc@Huawei.com>
In-Reply-To: <eb819ab09ce3ac98ed13493b88495fbd0ca05dec.1619621413.git.mchehab+huawei@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
        <eb819ab09ce3ac98ed13493b88495fbd0ca05dec.1619621413.git.mchehab+huawei@kernel.org>
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

On Wed, 28 Apr 2021 16:51:30 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Calling pm_runtime_get_sync() is bad, since even when it
> returns an error, pm_runtime_put*() should be called.
> So, use instead pm_runtime_resume_and_get().
> 
> While here, ensure that the error condition will be checked
> during clock enable an media open() calls.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/media/platform/marvell-ccic/mcam-core.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/marvell-ccic/mcam-core.c b/drivers/media/platform/marvell-ccic/mcam-core.c
> index 141bf5d97a04..ea87110d9073 100644
> --- a/drivers/media/platform/marvell-ccic/mcam-core.c
> +++ b/drivers/media/platform/marvell-ccic/mcam-core.c
> @@ -918,6 +918,7 @@ static int mclk_enable(struct clk_hw *hw)
>  	struct mcam_camera *cam = container_of(hw, struct mcam_camera, mclk_hw);
>  	int mclk_src;
>  	int mclk_div;
> +	int ret;
>  
>  	/*
>  	 * Clock the sensor appropriately.  Controller clock should
> @@ -931,7 +932,9 @@ static int mclk_enable(struct clk_hw *hw)
>  		mclk_div = 2;
>  	}
>  
> -	pm_runtime_get_sync(cam->dev);
> +	ret = pm_runtime_resume_and_get(cam->dev);
> +	if (ret < 0)
> +		return ret;
>  	clk_enable(cam->clk[0]);
>  	mcam_reg_write(cam, REG_CLKCTRL, (mclk_src << 29) | mclk_div);
>  	mcam_ctlr_power_up(cam);
> @@ -1611,7 +1614,9 @@ static int mcam_v4l_open(struct file *filp)
>  		ret = sensor_call(cam, core, s_power, 1);
>  		if (ret)
>  			goto out;
> -		pm_runtime_get_sync(cam->dev);
> +		ret = pm_runtime_resume_and_get(cam->dev);
> +		if (ret < 0)
> +			goto out;
>  		__mcam_cam_reset(cam);
>  		mcam_set_config_needed(cam, 1);
>  	}

