Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 528E136C473
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235514AbhD0KzN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 27 Apr 2021 06:55:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234773AbhD0KzM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:55:12 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1399C061574
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 03:54:29 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1lbLMB-0006Jj-B1; Tue, 27 Apr 2021 12:54:19 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1lbLM9-0001KL-7U; Tue, 27 Apr 2021 12:54:17 +0200
Message-ID: <7842222df58b2be4207d33e25d122eb587a54f12.camel@pengutronix.de>
Subject: Re: [PATCH v3 61/79] media: coda: use pm_runtime_resume_and_get()
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Date:   Tue, 27 Apr 2021 12:54:17 +0200
In-Reply-To: <18b66005a971b96fd50fea61da138a1bcc68bd8c.1619519080.git.mchehab+huawei@kernel.org>
References: <cover.1619519080.git.mchehab+huawei@kernel.org>
         <18b66005a971b96fd50fea61da138a1bcc68bd8c.1619519080.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2021-04-27 at 12:26 +0200, Mauro Carvalho Chehab wrote:
> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> added pm_runtime_resume_and_get() in order to automatically handle
> dev->power.usage_count decrement on errors.
> 
> Use the new API, in order to cleanup the error check logic.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/media/platform/coda/coda-common.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
> index bd666c858fa1..13ff05e7d850 100644
> --- a/drivers/media/platform/coda/coda-common.c
> +++ b/drivers/media/platform/coda/coda-common.c
> @@ -2660,10 +2660,10 @@ static int coda_open(struct file *file)
>  	ctx->use_vdoa = false;
>  
>  	/* Power up and upload firmware if necessary */
> -	ret = pm_runtime_get_sync(dev->dev);
> +	ret = pm_runtime_resume_and_get(dev->dev);
>  	if (ret < 0) {
>  		v4l2_err(&dev->v4l2_dev, "failed to power up: %d\n", ret);
> -		goto err_pm_get;
> +		goto err_fh_del;
>  	}
>  
>  	ret = clk_prepare_enable(dev->clk_per);
> @@ -2709,6 +2709,7 @@ static int coda_open(struct file *file)
>  	clk_disable_unprepare(dev->clk_per);
>  err_pm_get:

Oh right, the PER clk enable also fails through this label. Thanks!

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

>  	pm_runtime_put_sync(dev->dev);
> +err_fh_del:

Just a note that - contrary to what coding-style suggests - the other
labels in this function are currently named after what operation failed,
instead of what they do in response.

regards
Philipp
