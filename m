Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFD0A117048
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2019 16:22:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbfLIPWf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Dec 2019 10:22:35 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:45537 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbfLIPWf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Dec 2019 10:22:35 -0500
Received: from litschi.hi.pengutronix.de ([2001:67c:670:100:feaa:14ff:fe6a:8db5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1ieKro-00068J-4u; Mon, 09 Dec 2019 16:22:32 +0100
Date:   Mon, 9 Dec 2019 16:22:30 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Chuhong Yuan <hslester96@gmail.com>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: allegro: add the missed check for
 v4l2_m2m_ctx_init
Message-ID: <20191209162230.24ad5018@litschi.hi.pengutronix.de>
In-Reply-To: <20191209085807.16126-1-hslester96@gmail.com>
References: <20191209085807.16126-1-hslester96@gmail.com>
Organization: Pengutronix
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:feaa:14ff:fe6a:8db5
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 09 Dec 2019 16:58:07 +0800, Chuhong Yuan wrote:
> allegro_open() misses a check for v4l2_m2m_ctx_init().
> Add a check and error handling code to fix it.
> 
> Fixes: f20387dfd065 ("media: allegro: add Allegro DVT video IP core driver")
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>

Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>

> ---
>  drivers/staging/media/allegro-dvt/allegro-core.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
> index 6f0cd0784786..5f1d454b41bb 100644
> --- a/drivers/staging/media/allegro-dvt/allegro-core.c
> +++ b/drivers/staging/media/allegro-dvt/allegro-core.c
> @@ -2341,6 +2341,13 @@ static int allegro_open(struct file *file)
>  	channel->fh.m2m_ctx = v4l2_m2m_ctx_init(dev->m2m_dev, channel,
>  						allegro_queue_init);
>  
> +	if (IS_ERR(channel->fh.m2m_ctx)) {
> +		v4l2_fh_del(&channel->fh);
> +		v4l2_fh_exit(&channel->fh);
> +		kfree(channel);
> +		return PTR_ERR(channel->fh.m2m_ctx);
> +	}
> +
>  	return 0;
>  }
>  
