Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E6EF1BD032
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2020 00:53:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbgD1Wxh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 18:53:37 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:45728 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726042AbgD1Wxh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 18:53:37 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03SMrTmW006373;
        Tue, 28 Apr 2020 17:53:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588114409;
        bh=vdp97xI44K5xWlxMxBx4f5N9IE1CtlaJ13tCZhnzq2c=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=FriYSZDAcPzprRRFyWMVBPikadf+rd6wdfkLh1XyxiweDrCgd1tmdZIE219Tugcwq
         BDe1/xF2e4dPk+hdB3Z++kwgCiMFRMsho4A0oM9duC90sKhV0f3KaiMTaTzY5YXoAH
         JjcP8V7yBY0HtsEabFEZNhxi2mWiExWG6AgM3ZmE=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03SMrTEZ118037
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 28 Apr 2020 17:53:29 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 28
 Apr 2020 17:53:29 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 28 Apr 2020 17:53:29 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with SMTP id 03SMrSIT127092;
        Tue, 28 Apr 2020 17:53:28 -0500
Date:   Tue, 28 Apr 2020 17:53:28 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Arnd Bergmann <arnd@arndb.de>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@osg.samsung.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: ti-vpe: avoid gcc-9 warning
Message-ID: <20200428225328.phmj4eymkzmyyy2h@ti.com>
References: <20200428213430.3419189-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200428213430.3419189-1-arnd@arndb.de>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reviewed-by: Benoit Parrot <bparrot@ti.com>

Arnd Bergmann <arnd@arndb.de> wrote on Tue [2020-Apr-28 23:34:19 +0200]:
> gcc warns about empty array declarations, which we get in this driver
> when compile-testing without CONFIG_OF:
> 
> drivers/media/platform/ti-vpe/cal.c:2194:34: warning: array 'cal_of_match' assumed to have one element
>  2194 | static const struct of_device_id cal_of_match[];
> 
> Since all users of this driver do need CONFIG_OF anyway, there is no
> point in making the array definition conditional to save space, so
> just remove the #ifdef and move the array up a little.
> 
> Fixes: 343e89a792a5 ("[media] media: ti-vpe: Add CAL v4l2 camera capture driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/media/platform/ti-vpe/cal.c | 46 +++++++++++++----------------
>  1 file changed, 21 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index 49204872e711..9b18db7af6c3 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -2237,7 +2237,26 @@ static struct cal_ctx *cal_create_instance(struct cal_dev *dev, int inst)
>  	return NULL;
>  }
>  
> -static const struct of_device_id cal_of_match[];
> +static const struct of_device_id cal_of_match[] = {
> +	{
> +		.compatible = "ti,dra72-cal",
> +		.data = (void *)&dra72x_cal_data,
> +	},
> +	{
> +		.compatible = "ti,dra72-pre-es2-cal",
> +		.data = (void *)&dra72x_es1_cal_data,
> +	},
> +	{
> +		.compatible = "ti,dra76-cal",
> +		.data = (void *)&dra76x_cal_data,
> +	},
> +	{
> +		.compatible = "ti,am654-cal",
> +		.data = (void *)&am654_cal_data,
> +	},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, cal_of_match);
>  
>  static int cal_probe(struct platform_device *pdev)
>  {
> @@ -2413,29 +2432,6 @@ static int cal_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -#if defined(CONFIG_OF)
> -static const struct of_device_id cal_of_match[] = {
> -	{
> -		.compatible = "ti,dra72-cal",
> -		.data = (void *)&dra72x_cal_data,
> -	},
> -	{
> -		.compatible = "ti,dra72-pre-es2-cal",
> -		.data = (void *)&dra72x_es1_cal_data,
> -	},
> -	{
> -		.compatible = "ti,dra76-cal",
> -		.data = (void *)&dra76x_cal_data,
> -	},
> -	{
> -		.compatible = "ti,am654-cal",
> -		.data = (void *)&am654_cal_data,
> -	},
> -	{},
> -};
> -MODULE_DEVICE_TABLE(of, cal_of_match);
> -#endif
> -
>  static int cal_runtime_resume(struct device *dev)
>  {
>  	struct cal_dev *caldev = dev_get_drvdata(dev);
> @@ -2462,7 +2458,7 @@ static struct platform_driver cal_pdrv = {
>  	.driver		= {
>  		.name	= CAL_MODULE_NAME,
>  		.pm	= &cal_pm_ops,
> -		.of_match_table = of_match_ptr(cal_of_match),
> +		.of_match_table = cal_of_match,
>  	},
>  };
>  
> -- 
> 2.26.0
> 
