Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 408D1373905
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 13:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232591AbhEELJc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 07:09:32 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:3000 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232535AbhEELJb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 May 2021 07:09:31 -0400
Received: from fraeml702-chm.china.huawei.com (unknown [172.18.147.226])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FZv1x4l78z6yj64;
        Wed,  5 May 2021 19:02:45 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml702-chm.china.huawei.com (10.206.15.51) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 5 May 2021 13:08:33 +0200
Received: from localhost (10.52.120.138) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 5 May 2021
 12:08:32 +0100
Date:   Wed, 5 May 2021 12:06:52 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC:     <linuxarm@huawei.com>, <mauro.chehab@huawei.com>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-staging@lists.linux.dev>
Subject: Re: [PATCH 02/25] staging: media: imx7-mipi-csis: fix
 pm_runtime_get_sync() usage count
Message-ID: <20210505120652.00001236@Huawei.com>
In-Reply-To: <793a5806a63b6313606fd1c344b9eec41e61a440.1620207353.git.mchehab+huawei@kernel.org>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
        <793a5806a63b6313606fd1c344b9eec41e61a440.1620207353.git.mchehab+huawei@kernel.org>
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

On Wed, 5 May 2021 11:41:52 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> The pm_runtime_get_sync() internally increments the
> dev->power.usage_count without decrementing it, even on errors.
> Replace it by the new pm_runtime_resume_and_get(), introduced by:
> commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> in order to properly decrement the usage counter, avoiding
> a potential PM usage counter leak.
> 
> Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Not a fix as far as I can see, just a cleanup - so perhaps not this set?

Jonathan


> ---
>  drivers/staging/media/imx/imx7-mipi-csis.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> index 025fdc488bd6..1dc680d94a46 100644
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -695,11 +695,10 @@ static int mipi_csis_s_stream(struct v4l2_subdev *mipi_sd, int enable)
>  
>  		mipi_csis_clear_counters(state);
>  
> -		ret = pm_runtime_get_sync(&state->pdev->dev);
> -		if (ret < 0) {
> -			pm_runtime_put_noidle(&state->pdev->dev);
> +		ret = pm_runtime_resume_and_get(&state->pdev->dev);
> +		if (ret < 0)
>  			return ret;
> -		}
> +
>  		ret = v4l2_subdev_call(state->src_sd, core, s_power, 1);
>  		if (ret < 0 && ret != -ENOIOCTLCMD)
>  			goto done;

