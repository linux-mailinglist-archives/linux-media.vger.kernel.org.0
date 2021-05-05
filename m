Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E4BE373B25
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 14:26:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232578AbhEEM1P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 08:27:15 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:3021 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232101AbhEEM1O (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 May 2021 08:27:14 -0400
Received: from fraeml706-chm.china.huawei.com (unknown [172.18.147.200])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FZwj244FLz6rlcx;
        Wed,  5 May 2021 20:18:14 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml706-chm.china.huawei.com (10.206.15.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 5 May 2021 14:26:16 +0200
Received: from localhost (10.52.120.138) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 5 May 2021
 13:26:15 +0100
Date:   Wed, 5 May 2021 13:24:37 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC:     <linuxarm@huawei.com>, <mauro.chehab@huawei.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
Subject: Re: [PATCH 05/25] media: i2c: ccs-core: return the right error code
 at suspend
Message-ID: <20210505132437.00000a54@Huawei.com>
In-Reply-To: <92cb0f741d16d9eaa9f99f336d826f30ac7a2671.1620207353.git.mchehab+huawei@kernel.org>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
        <92cb0f741d16d9eaa9f99f336d826f30ac7a2671.1620207353.git.mchehab+huawei@kernel.org>
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

On Wed, 5 May 2021 11:41:55 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> If pm_runtime resume logic fails, return the error code
> provided by it, instead of -EAGAIN, as, depending on what
> caused it to fail, it may not be something that would be
> recovered.
> 
> Fixes: cbba45d43631 ("[media] smiapp: Use runtime PM")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/media/i2c/ccs/ccs-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index 9dc3f45da3dc..b05f409014b2 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -3093,7 +3093,7 @@ static int __maybe_unused ccs_suspend(struct device *dev)
>  	if (rval < 0) {
>  		pm_runtime_put_noidle(dev);
>  
> -		return -EAGAIN;
> +		return rval;
>  	}
>  
>  	if (sensor->streaming)

