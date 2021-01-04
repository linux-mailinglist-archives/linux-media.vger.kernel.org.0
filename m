Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6D9F2E928D
	for <lists+linux-media@lfdr.de>; Mon,  4 Jan 2021 10:25:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726602AbhADJZA convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 4 Jan 2021 04:25:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbhADJZA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jan 2021 04:25:00 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A08BC061574
        for <linux-media@vger.kernel.org>; Mon,  4 Jan 2021 01:24:20 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kwM64-0001dG-65; Mon, 04 Jan 2021 10:24:16 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kwM61-0003Gi-GZ; Mon, 04 Jan 2021 10:24:13 +0100
Message-ID: <48c8384b5bb91ec4028a9c0255e643153983fbaf.camel@pengutronix.de>
Subject: Re: [PATCH -next] media/platform/coda: convert comma to semicolon
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Zheng Yongjun <zhengyongjun3@huawei.com>, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Mon, 04 Jan 2021 10:24:13 +0100
In-Reply-To: <20201216132123.15099-1-zhengyongjun3@huawei.com>
References: <20201216132123.15099-1-zhengyongjun3@huawei.com>
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

On Wed, 2020-12-16 at 21:21 +0800, Zheng Yongjun wrote:
> Replace a comma between expression statements by a semicolon.
> 
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> ---
>  drivers/media/platform/coda/coda-common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
> index 87a2c706f747..547ad34b1424 100644
> --- a/drivers/media/platform/coda/coda-common.c
> +++ b/drivers/media/platform/coda/coda-common.c
> @@ -2861,7 +2861,7 @@ static int coda_register_device(struct coda_dev *dev, int i)
>  	strscpy(vfd->name, dev->devtype->vdevs[i]->name, sizeof(vfd->name));
>  	vfd->fops	= &coda_fops;
>  	vfd->ioctl_ops	= &coda_ioctl_ops;
> -	vfd->release	= video_device_release_empty,
> +	vfd->release	= video_device_release_empty;
>  	vfd->lock	= &dev->dev_mutex;
>  	vfd->v4l2_dev	= &dev->v4l2_dev;
>  	vfd->vfl_dir	= VFL_DIR_M2M;

Thank you,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
