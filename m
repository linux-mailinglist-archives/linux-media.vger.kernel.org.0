Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 880F42D9D6E
	for <lists+linux-media@lfdr.de>; Mon, 14 Dec 2020 18:18:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408439AbgLNRRU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Dec 2020 12:17:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408434AbgLNRRU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Dec 2020 12:17:20 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C61DDC061793
        for <linux-media@vger.kernel.org>; Mon, 14 Dec 2020 09:16:39 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1korSW-0004ht-Dr; Mon, 14 Dec 2020 18:16:28 +0100
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1korSV-0004k3-In; Mon, 14 Dec 2020 18:16:27 +0100
Date:   Mon, 14 Dec 2020 18:16:27 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Chuhong Yuan <hslester96@gmail.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: allegro: Fix use after free on error
Message-ID: <20201214171627.GE1861@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Chuhong Yuan <hslester96@gmail.com>, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org
References: <X9dShwq8PrThDpn9@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <X9dShwq8PrThDpn9@mwanda>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 17:36:29 up 12 days,  5:03, 46 users,  load average: 0.08, 0.09,
 0.86
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 14 Dec 2020 14:54:47 +0300, Dan Carpenter wrote:
> The "channel" is added to the "dev->channels" but then if
> v4l2_m2m_ctx_init() fails then we free "channel" but it's still on the
> list so it could lead to a use after free.  Let's not add it to the
> list until after v4l2_m2m_ctx_init() succeeds.

Thanks.

The patch conflicts with the series that moves the driver from staging to
mainline [0]. I'm not sure, which patch should go in first.

It is also correct to not change the order of list_del and
v4l2_m2m_ctx_release in allegro_release. The list is used to relate messages
from the VCU to their destination channel and this should be possible until
the context has been released and no further messages are expected for that
channel.

[0] https://lore.kernel.org/linux-media/20201202133040.1954837-1-m.tretter@pengutronix.de/

> 
> Fixes: cc62c74749a3 ("media: allegro: add missed checks in allegro_open()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>

> ---
> From static analysis.  Not tested.
> 
>  drivers/staging/media/allegro-dvt/allegro-core.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
> index 9f718f43282b..640451134072 100644
> --- a/drivers/staging/media/allegro-dvt/allegro-core.c
> +++ b/drivers/staging/media/allegro-dvt/allegro-core.c
> @@ -2483,8 +2483,6 @@ static int allegro_open(struct file *file)
>  	INIT_LIST_HEAD(&channel->buffers_reference);
>  	INIT_LIST_HEAD(&channel->buffers_intermediate);
>  
> -	list_add(&channel->list, &dev->channels);
> -
>  	channel->fh.m2m_ctx = v4l2_m2m_ctx_init(dev->m2m_dev, channel,
>  						allegro_queue_init);
>  
> @@ -2493,6 +2491,7 @@ static int allegro_open(struct file *file)
>  		goto error;
>  	}
>  
> +	list_add(&channel->list, &dev->channels);
>  	file->private_data = &channel->fh;
>  	v4l2_fh_add(&channel->fh);
>  
> -- 
> 2.29.2
> 
> 
