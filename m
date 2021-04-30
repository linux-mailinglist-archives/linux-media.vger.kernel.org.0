Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8587A36FED9
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 18:45:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbhD3Qqi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 12:46:38 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2963 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbhD3Qqi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 12:46:38 -0400
Received: from fraeml741-chm.china.huawei.com (unknown [172.18.147.207])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FWydk2XZ5z70gGM;
        Sat,  1 May 2021 00:35:06 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml741-chm.china.huawei.com (10.206.15.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 30 Apr 2021 18:45:48 +0200
Received: from localhost (10.52.124.90) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 30 Apr
 2021 17:45:47 +0100
Date:   Fri, 30 Apr 2021 17:44:13 +0100
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
Subject: Re: [PATCH v4 16/79] media: mtk-vcodec: fix pm_runtime_get_sync()
 usage count
Message-ID: <20210430174413.0000452c@Huawei.com>
In-Reply-To: <b2f5f6e6287d4b56530dcf51b25b5a1c009381f8.1619621413.git.mchehab+huawei@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
        <b2f5f6e6287d4b56530dcf51b25b5a1c009381f8.1619621413.git.mchehab+huawei@kernel.org>
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

On Wed, 28 Apr 2021 16:51:37 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> The pm_runtime_get_sync() internally increments the
> dev->power.usage_count without decrementing it, even on errors.
> Replace it by the new pm_runtime_resume_and_get(), introduced by:
> commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> in order to properly decrement the usage counter and avoid memory
> leaks.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Without a return value, this seems like it's not complete as driver
will carry on and eventually call mtk_vcode_dec_pw_off() which will assume
it needs to decrement the count.


> ---
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> index ddee7046ce42..fe096fe61c9d 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> @@ -92,9 +92,9 @@ void mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
>  {
>  	int ret;
>  
> -	ret = pm_runtime_get_sync(pm->dev);
> +	ret = pm_runtime_resume_and_get(pm->dev);
>  	if (ret)
> -		mtk_v4l2_err("pm_runtime_get_sync fail %d", ret);
> +		mtk_v4l2_err("pm_runtime_resume_and_get fail %d", ret);
>  }
>  
>  void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm)

