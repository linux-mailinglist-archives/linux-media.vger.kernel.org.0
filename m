Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04FE636FECC
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 18:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230342AbhD3Qmb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 12:42:31 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2962 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbhD3Qmb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 12:42:31 -0400
Received: from fraeml742-chm.china.huawei.com (unknown [172.18.147.226])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FWycF6TPmz71fn9;
        Sat,  1 May 2021 00:33:49 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml742-chm.china.huawei.com (10.206.15.223) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 30 Apr 2021 18:41:41 +0200
Received: from localhost (10.52.124.90) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 30 Apr
 2021 17:41:40 +0100
Date:   Fri, 30 Apr 2021 17:40:05 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC:     <linuxarm@huawei.com>, <mauro.chehab@huawei.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Hans Verkuil" <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
Subject: Re: [PATCH v4 15/79] media: sh_vou: fix pm_runtime_get_sync() usage
 count
Message-ID: <20210430174005.00007dc4@Huawei.com>
In-Reply-To: <f7fc9697e61bef13937c3455b20e7c855e31d6f7.1619621413.git.mchehab+huawei@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
        <f7fc9697e61bef13937c3455b20e7c855e31d6f7.1619621413.git.mchehab+huawei@kernel.org>
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

On Wed, 28 Apr 2021 16:51:36 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> The pm_runtime_get_sync() internally increments the
> dev->power.usage_count without decrementing it, even on errors.
> Replace it by the new pm_runtime_resume_and_get(), introduced by:
> commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> in order to properly decrement the usage counter and avoid memory
> leaks.
> 
> While here, check if the PM runtime error was caught at open time.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  drivers/media/platform/sh_vou.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/sh_vou.c b/drivers/media/platform/sh_vou.c
> index 4ac48441f22c..ca4310e26c49 100644
> --- a/drivers/media/platform/sh_vou.c
> +++ b/drivers/media/platform/sh_vou.c
> @@ -1133,7 +1133,11 @@ static int sh_vou_open(struct file *file)
>  	if (v4l2_fh_is_singular_file(file) &&
>  	    vou_dev->status == SH_VOU_INITIALISING) {
>  		/* First open */
> -		pm_runtime_get_sync(vou_dev->v4l2_dev.dev);
> +		err = pm_runtime_resume_and_get(vou_dev->v4l2_dev.dev);
> +		if (err < 0) {
> +			v4l2_fh_release(file);
> +			goto done_open;
> +		}
>  		err = sh_vou_hw_init(vou_dev);
>  		if (err < 0) {
>  			pm_runtime_put(vou_dev->v4l2_dev.dev);

