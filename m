Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8C371A78DA
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 12:55:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438692AbgDNKzJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 06:55:09 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:53107 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438444AbgDNKfb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 06:35:31 -0400
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jOIue-0007vh-CD; Tue, 14 Apr 2020 12:35:28 +0200
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jOIud-00014C-OU; Tue, 14 Apr 2020 12:35:27 +0200
Date:   Tue, 14 Apr 2020 12:35:27 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Chuhong Yuan <hslester96@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        kernel@pengutronix.de
Subject: Re: [PATCH] media: staging: allegro: fix broken registration of
 controls
Message-ID: <20200414103527.GB4598@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Chuhong Yuan <hslester96@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@pengutronix.de
References: <20200319091630.6981-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200319091630.6981-1-m.tretter@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:32:26 up 54 days, 18:02, 95 users,  load average: 0.09, 0.13,
 0.15
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 19, 2020 at 10:16:30AM +0100, Michael Tretter wrote:
> Since commit cc62c74749a3 ("media: allegro: add missed checks in
> allegro_open()") the allegro device does provide v4l2 controls to user
> space anymore. The reason is that v4l2_fh_init() initializes
> fh->ctrl_handler to vdev->ctrl_handler, which invalidates the previous
> driver override of the ctrl_handler.
> 
> Therefore, v4l2_fh_init() must be called before the driver overrides the
> fh->ctrl_handler with its own handler.
> 
> Move the initialization of the fh back to the top, as the initialization
> does not does not need to be reverted on errors, but it is enough to
> free the channel.

Gentle ping.

Michael

> 
> Fixes: cc62c74749a3 ("media: allegro: add missed checks in allegro_open()")
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>  drivers/staging/media/allegro-dvt/allegro-core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
> index cb6bdabaaff3..761f2c7ff8e7 100644
> --- a/drivers/staging/media/allegro-dvt/allegro-core.c
> +++ b/drivers/staging/media/allegro-dvt/allegro-core.c
> @@ -2467,6 +2467,8 @@ static int allegro_open(struct file *file)
>  	if (!channel)
>  		return -ENOMEM;
>  
> +	v4l2_fh_init(&channel->fh, vdev);
> +
>  	init_completion(&channel->completion);
>  	INIT_LIST_HEAD(&channel->source_shadow_list);
>  	INIT_LIST_HEAD(&channel->stream_shadow_list);
> @@ -2588,7 +2590,6 @@ static int allegro_open(struct file *file)
>  		goto error;
>  	}
>  
> -	v4l2_fh_init(&channel->fh, vdev);
>  	file->private_data = &channel->fh;
>  	v4l2_fh_add(&channel->fh);
>  
> -- 
> 2.20.1
> 
> 
