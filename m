Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2B741F13CE
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2020 09:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729067AbgFHHq5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jun 2020 03:46:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728993AbgFHHq5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Jun 2020 03:46:57 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72DE7C08C5C3
        for <linux-media@vger.kernel.org>; Mon,  8 Jun 2020 00:46:57 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jiCUc-0006ou-Jk; Mon, 08 Jun 2020 09:46:50 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1jiCUb-000511-Lj; Mon, 08 Jun 2020 09:46:49 +0200
Date:   Mon, 8 Jun 2020 09:46:49 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Chuhong Yuan <hslester96@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: tvp5150: Add missed media_entity_cleanup()
Message-ID: <20200608074649.bppdrdoxn6xig6jy@pengutronix.de>
References: <20200606143918.2869528-1-hslester96@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200606143918.2869528-1-hslester96@gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:45:45 up 205 days, 23:04, 198 users,  load average: 0.11, 0.08,
 0.02
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

thanks for covering that. Appart of the fact that this function does
nothing:

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>

On 20-06-06 22:39, Chuhong Yuan wrote:
> This driver does not call media_entity_cleanup() in the error handler
> of tvp5150_registered() and tvp5150_remove(), while it has called
> media_entity_pads_init() at first.
> Add the missed calls to fix it.
> 
> Fixes: 0556f1d580d4 ("media: tvp5150: add input source selection of_graph support")
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> ---
>  drivers/media/i2c/tvp5150.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
> index eb39cf5ea089..9df575238952 100644
> --- a/drivers/media/i2c/tvp5150.c
> +++ b/drivers/media/i2c/tvp5150.c
> @@ -1664,8 +1664,10 @@ static int tvp5150_registered(struct v4l2_subdev *sd)
>  	return 0;
>  
>  err:
> -	for (i = 0; i < decoder->connectors_num; i++)
> +	for (i = 0; i < decoder->connectors_num; i++) {
>  		media_device_unregister_entity(&decoder->connectors[i].ent);
> +		media_entity_cleanup(&decoder->connectors[i].ent);
> +	}
>  	return ret;
>  #endif
>  
> @@ -2248,8 +2250,10 @@ static int tvp5150_remove(struct i2c_client *c)
>  
>  	for (i = 0; i < decoder->connectors_num; i++)
>  		v4l2_fwnode_connector_free(&decoder->connectors[i].base);
> -	for (i = 0; i < decoder->connectors_num; i++)
> +	for (i = 0; i < decoder->connectors_num; i++) {
>  		media_device_unregister_entity(&decoder->connectors[i].ent);
> +		media_entity_cleanup(&decoder->connectors[i].ent);
> +	}
>  	v4l2_async_unregister_subdev(sd);
>  	v4l2_ctrl_handler_free(&decoder->hdl);
>  	pm_runtime_disable(&c->dev);
> -- 
> 2.26.2
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
