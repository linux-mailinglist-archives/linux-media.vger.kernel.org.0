Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1341373B4D
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 14:33:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233354AbhEEMeb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 08:34:31 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:3025 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbhEEMe3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 May 2021 08:34:29 -0400
Received: from fraeml711-chm.china.huawei.com (unknown [172.18.147.207])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FZwvz13Gpz72f1w;
        Wed,  5 May 2021 20:27:43 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml711-chm.china.huawei.com (10.206.15.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 5 May 2021 14:33:31 +0200
Received: from localhost (10.52.120.138) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 5 May 2021
 13:33:30 +0100
Date:   Wed, 5 May 2021 13:31:52 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC:     <linuxarm@huawei.com>, <mauro.chehab@huawei.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-samsung-soc@vger.kernel.org>,
        "Sylwester Nawrocki" <s.nawrocki@samsung.com>
Subject: Re: [PATCH 15/25] media: s5p: fix pm_runtime_get_sync() usage count
Message-ID: <20210505133152.000017ff@Huawei.com>
In-Reply-To: <57a141a2c538b253f1c9502a790c370007d2ed83.1620207353.git.mchehab+huawei@kernel.org>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
        <57a141a2c538b253f1c9502a790c370007d2ed83.1620207353.git.mchehab+huawei@kernel.org>
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

On Wed, 5 May 2021 11:42:05 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> The pm_runtime_get_sync() internally increments the
> dev->power.usage_count without decrementing it, even on errors.
> Replace it by the new pm_runtime_resume_and_get(), introduced by:
> commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> in order to properly decrement the usage counter, avoiding
> a potential PM usage counter leak.
> 
> While here, check if the PM runtime error was caught at
> s5p_cec_adap_enable().
> 
> Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/media/cec/platform/s5p/s5p_cec.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/cec/platform/s5p/s5p_cec.c b/drivers/media/cec/platform/s5p/s5p_cec.c
> index 3c7c4c3c798c..028a09a7531e 100644
> --- a/drivers/media/cec/platform/s5p/s5p_cec.c
> +++ b/drivers/media/cec/platform/s5p/s5p_cec.c
> @@ -35,10 +35,13 @@ MODULE_PARM_DESC(debug, "debug level (0-2)");
>  
>  static int s5p_cec_adap_enable(struct cec_adapter *adap, bool enable)
>  {
> +	int ret;
>  	struct s5p_cec_dev *cec = cec_get_drvdata(adap);
>  
>  	if (enable) {
> -		pm_runtime_get_sync(cec->dev);
> +		ret = pm_runtime_resume_and_get(cec->dev);
> +		if (ret < 0)
> +			return ret;
>  
>  		s5p_cec_reset(cec);
>  

