Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E8B536AC6B
	for <lists+linux-media@lfdr.de>; Mon, 26 Apr 2021 08:53:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231980AbhDZGyL convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 26 Apr 2021 02:54:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232018AbhDZGyK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Apr 2021 02:54:10 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A21D8C061756
        for <linux-media@vger.kernel.org>; Sun, 25 Apr 2021 23:53:29 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1lav7M-0003nv-L8; Mon, 26 Apr 2021 08:53:16 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1lav7K-00051L-VC; Mon, 26 Apr 2021 08:53:14 +0200
Message-ID: <3ef4238e7e173eb97017aa3d5af86ed578b7c294.camel@pengutronix.de>
Subject: Re: [PATCH 56/78] media: coda: use pm_runtime_resume_and_get()
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Date:   Mon, 26 Apr 2021 08:53:14 +0200
In-Reply-To: <5102aef0e5d4ccfafed92087e3800ffaca4736ba.1619191723.git.mchehab+huawei@kernel.org>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
         <5102aef0e5d4ccfafed92087e3800ffaca4736ba.1619191723.git.mchehab+huawei@kernel.org>
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

Hi Mauro,

On Sat, 2021-04-24 at 08:45 +0200, Mauro Carvalho Chehab wrote:
> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> added pm_runtime_resume_and_get() in order to automatically handle
> dev->power.usage_count decrement on errors.
> 
> Use the new API, in order to cleanup the error check logic.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/media/platform/coda/coda-common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
> index bd666c858fa1..fea1c136a42c 100644
> --- a/drivers/media/platform/coda/coda-common.c
> +++ b/drivers/media/platform/coda/coda-common.c
> @@ -2660,7 +2660,7 @@ static int coda_open(struct file *file)
>  	ctx->use_vdoa = false;
>  
>  	/* Power up and upload firmware if necessary */
> -	ret = pm_runtime_get_sync(dev->dev);
> +	ret = pm_runtime_resume_and_get(dev->dev);
>  	if (ret < 0) {
>  		v4l2_err(&dev->v4l2_dev, "failed to power up: %d\n", ret);
>  		goto err_pm_get;

There's a pm_runtime_put_sync() at the err_pm_get below, so the label
needs to be moved down a line:

@@ -2705,8 +2705,8 @@ static int coda_open(struct file *file)
 	clk_disable_unprepare(dev->clk_ahb);
 err_clk_ahb:
 	clk_disable_unprepare(dev->clk_per);
-err_pm_get:
 	pm_runtime_put_sync(dev->dev);
+err_pm_get:
 	v4l2_fh_del(&ctx->fh);
 	v4l2_fh_exit(&ctx->fh);
 err_coda_name_init:

regards
Philipp
