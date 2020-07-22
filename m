Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E1F12298ED
	for <lists+linux-media@lfdr.de>; Wed, 22 Jul 2020 15:04:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732290AbgGVNET (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 09:04:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728642AbgGVNET (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 09:04:19 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAA46C0619DC
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2020 06:04:18 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jyEPr-0008VD-Jy; Wed, 22 Jul 2020 15:04:11 +0200
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jyEPr-0004IR-3E; Wed, 22 Jul 2020 15:04:11 +0200
Date:   Wed, 22 Jul 2020 15:04:11 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: allegro: fix an error pointer vs NULL check
Message-ID: <20200722130411.GB21264@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel-janitors@vger.kernel.org
References: <20200722123848.GA220681@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200722123848.GA220681@mwanda>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 15:03:07 up 153 days, 20:33, 131 users,  load average: 0.38, 0.36,
 0.20
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 22 Jul 2020 15:38:48 +0300, Dan Carpenter wrote:
> The allegro_mbox_init() function returns error pointers, it never
> returns NULL.
> 
> Fixes: 94dc76560261 ("media: allegro: rework mbox handling")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>

> ---
>  drivers/staging/media/allegro-dvt/allegro-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
> index 61beae1fca36..9f718f43282b 100644
> --- a/drivers/staging/media/allegro-dvt/allegro-core.c
> +++ b/drivers/staging/media/allegro-dvt/allegro-core.c
> @@ -2952,7 +2952,7 @@ static int allegro_mcu_hw_init(struct allegro_dev *dev,
>  					      info->mailbox_size);
>  	dev->mbox_status = allegro_mbox_init(dev, info->mailbox_status,
>  					     info->mailbox_size);
> -	if (!dev->mbox_command || !dev->mbox_status) {
> +	if (IS_ERR(dev->mbox_command) || IS_ERR(dev->mbox_status)) {
>  		v4l2_err(&dev->v4l2_dev,
>  			 "failed to initialize mailboxes\n");
>  		return -EIO;
> -- 
> 2.27.0
> 
> 
