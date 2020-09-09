Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93DFE26369D
	for <lists+linux-media@lfdr.de>; Wed,  9 Sep 2020 21:27:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbgIIT1n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Sep 2020 15:27:43 -0400
Received: from mail.v3.sk ([167.172.186.51]:57288 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726184AbgIIT1n (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Sep 2020 15:27:43 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 1103DDF974;
        Wed,  9 Sep 2020 19:26:23 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id OxZBVLL3k2hu; Wed,  9 Sep 2020 19:26:22 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 9E54BDF97D;
        Wed,  9 Sep 2020 19:26:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id lA7oYzmcbh_5; Wed,  9 Sep 2020 19:26:22 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
        by zimbra.v3.sk (Postfix) with ESMTPSA id 593D5DF974;
        Wed,  9 Sep 2020 19:26:22 +0000 (UTC)
Date:   Wed, 9 Sep 2020 21:27:40 +0200
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Hulk Robot <hulkci@huawei.com>, Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH -next] media: marvell-ccic: mmp: mark PM functions as
 __maybe_unused
Message-ID: <20200909192740.GB1105946@demiurge.local>
References: <20200909112921.5116-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200909112921.5116-1-weiyongjun1@huawei.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 09, 2020 at 07:29:21PM +0800, Wei Yongjun wrote:
> The suspend/resume functions have no callers depending on
> configuration, so they must be marked __maybe_unused to
> avoid these harmless warnings:
> 
> drivers/media/platform/marvell-ccic/mmp-driver.c:347:12: warning:
>  'mmpcam_resume' defined but not used [-Wunused-function]
>   347 | static int mmpcam_resume(struct device *dev)
>       |            ^~~~~~~~~~~~~
> drivers/media/platform/marvell-ccic/mmp-driver.c:338:12: warning:
>  'mmpcam_suspend' defined but not used [-Wunused-function]
>   338 | static int mmpcam_suspend(struct device *dev)
>       |            ^~~~~~~~~~~~~~
> 
> Fixes: 55cd34524aa3 ("media: marvell-ccic: add support for runtime PM")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Acked-by: Lubomir Rintel <lkundrak@v3.sk>

Thank you!
Lubo

> ---
>  drivers/media/platform/marvell-ccic/mmp-driver.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/marvell-ccic/mmp-driver.c b/drivers/media/platform/marvell-ccic/mmp-driver.c
> index c4b28a00a3a2..cd902b180669 100644
> --- a/drivers/media/platform/marvell-ccic/mmp-driver.c
> +++ b/drivers/media/platform/marvell-ccic/mmp-driver.c
> @@ -335,7 +335,7 @@ static int mmpcam_runtime_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int mmpcam_suspend(struct device *dev)
> +static int __maybe_unused mmpcam_suspend(struct device *dev)
>  {
>  	struct mmp_camera *cam = dev_get_drvdata(dev);
>  
> @@ -344,7 +344,7 @@ static int mmpcam_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int mmpcam_resume(struct device *dev)
> +static int __maybe_unused mmpcam_resume(struct device *dev)
>  {
>  	struct mmp_camera *cam = dev_get_drvdata(dev);
>  
> 
