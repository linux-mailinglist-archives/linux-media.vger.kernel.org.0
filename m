Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C6CA248687
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 15:56:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726786AbgHRN4a convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 18 Aug 2020 09:56:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726605AbgHRN4T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 09:56:19 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD00CC061389
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2020 06:56:18 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1k825w-0001mv-Mx; Tue, 18 Aug 2020 15:56:08 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1k825w-0001Hd-BR; Tue, 18 Aug 2020 15:56:08 +0200
Message-ID: <94002fe8f460de93ab3d9ba7e5bae6ee2c1f6b64.camel@pengutronix.de>
Subject: Re: [PATCH 2/7] media: coda: no need to check return value of
 debugfs_create functions
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Date:   Tue, 18 Aug 2020 15:56:08 +0200
In-Reply-To: <20200818133608.462514-2-gregkh@linuxfoundation.org>
References: <20200818133608.462514-1-gregkh@linuxfoundation.org>
         <20200818133608.462514-2-gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2020-08-18 at 15:36 +0200, Greg Kroah-Hartman wrote:
> When calling debugfs functions, there is no need to ever check the
> return value.  The function can work or not, but the code logic should
> never do something different based on this.
>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-media@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thank you,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

> ---
>  drivers/media/platform/coda/coda-common.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
> index 3ab3d976d8ca..9020be29d8f2 100644
> --- a/drivers/media/platform/coda/coda-common.c
> +++ b/drivers/media/platform/coda/coda-common.c
> @@ -1937,9 +1937,6 @@ int coda_alloc_aux_buf(struct coda_dev *dev, struct coda_aux_buf *buf,
>  		buf->blob.size = size;
>  		buf->dentry = debugfs_create_blob(name, 0644, parent,
>  						  &buf->blob);
> -		if (!buf->dentry)
> -			dev_warn(dev->dev,
> -				 "failed to create debugfs entry %s\n", name);
>  	}
>  
>  	return 0;
> @@ -3211,8 +3208,6 @@ static int coda_probe(struct platform_device *pdev)
>  	ida_init(&dev->ida);
>  
>  	dev->debugfs_root = debugfs_create_dir("coda", NULL);
> -	if (!dev->debugfs_root)
> -		dev_warn(&pdev->dev, "failed to create debugfs root\n");
>  
>  	/* allocate auxiliary per-device buffers for the BIT processor */
>  	if (dev->devtype->product == CODA_DX6) {

