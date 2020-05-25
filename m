Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 032261E0E8B
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2020 14:38:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390551AbgEYMi6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 May 2020 08:38:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390488AbgEYMi5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 May 2020 08:38:57 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92CE7C061A0E
        for <linux-media@vger.kernel.org>; Mon, 25 May 2020 05:38:57 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <pza@pengutronix.de>)
        id 1jdCNR-0002xS-7D; Mon, 25 May 2020 14:38:45 +0200
Received: from pza by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <pza@pengutronix.de>)
        id 1jdCNK-0004LN-Ul; Mon, 25 May 2020 14:38:38 +0200
Date:   Mon, 25 May 2020 14:38:38 +0200
From:   Philipp Zabel <pza@pengutronix.de>
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>
Cc:     kjlu@umn.edu, Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: coda: Fix runtime PM imbalance in coda_probe
Message-ID: <20200525123838.GA12983@pengutronix.de>
References: <20200523100332.32626-1-dinghao.liu@zju.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200523100332.32626-1-dinghao.liu@zju.edu.cn>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 14:21:25 up 95 days, 19:51, 121 users,  load average: 0.21, 0.19,
 0.19
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dinghao,

thank you for the patch! The first part is fine, but I think the second
part is not necessary, see below:

On Sat, May 23, 2020 at 06:03:32PM +0800, Dinghao Liu wrote:
> When coda_firmware_request() returns an error code,
> a pairing runtime PM usage counter decrement is needed
> to keep the counter balanced.
> 
> Also, the caller expects coda_probe() to increase PM
> usage counter, there should be a refcount decrement
> in coda_remove() to keep the counter balanced.

coda_probe() increments the usage counter only until coda_fw_callback()
decrements it again. Where is the imbalance?

> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
>  drivers/media/platform/coda/coda-common.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
> index d0d093dd8f7c..550e9a1266da 100644
> --- a/drivers/media/platform/coda/coda-common.c
> +++ b/drivers/media/platform/coda/coda-common.c
> @@ -3119,6 +3119,8 @@ static int coda_probe(struct platform_device *pdev)
>  	return 0;
>  
>  err_alloc_workqueue:
> +	pm_runtime_disable(&pdev->dev);
> +	pm_runtime_put_noidle(&pdev->dev);

These seem right, they balance out the pm_runtime_enable()
and pm_runtime_get_noresume() right before the error.

>  	destroy_workqueue(dev->workqueue);
>  err_v4l2_register:
>  	v4l2_device_unregister(&dev->v4l2_dev);
> @@ -3136,6 +3138,7 @@ static int coda_remove(struct platform_device *pdev)
>  	}
>  	if (dev->m2m_dev)
>  		v4l2_m2m_release(dev->m2m_dev);
> +	pm_runtime_put_noidle(&pdev->dev);

I think this is incorrect. There is one pm_runtime_get_noresume() in
coda_probe(), and one pm_runtime_put_sync() in coda_fw_callback().
By the time coda_remove() is called, balance is already restored.

regards
Philipp
