Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2BEB2298D9
	for <lists+linux-media@lfdr.de>; Wed, 22 Jul 2020 15:00:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728642AbgGVNAe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 09:00:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726525AbgGVNAd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 09:00:33 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B63B5C0619DC
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2020 06:00:33 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jyEMF-0007sw-P8; Wed, 22 Jul 2020 15:00:27 +0200
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jyEMD-0002xc-D3; Wed, 22 Jul 2020 15:00:25 +0200
Date:   Wed, 22 Jul 2020 15:00:25 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Colin King <colin.king@canonical.com>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] media: allegro: fix potential null dereference on
 header
Message-ID: <20200722130025.GA21264@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        Colin King <colin.king@canonical.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200720163804.340047-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200720163804.340047-1-colin.king@canonical.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 14:53:31 up 153 days, 20:24, 131 users,  load average: 0.03, 0.11,
 0.09
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 20 Jul 2020 17:38:04 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer header is an alias to msg and msg is being null checked.
> However, if msg is null then header is also null and this can lead to
> a null pointer dereference on the assignment type = header->type. Fix
> this by only dereferencing header after the null check on msg.
> 
> Addresses-Coverity: ("Dereference before null check")
> Fixes: 3de16839669f ("media: allegro: add explicit mail encoding and decoding")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/staging/media/allegro-dvt/allegro-mail.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/allegro-dvt/allegro-mail.c b/drivers/staging/media/allegro-dvt/allegro-mail.c
> index 4ac65de12463..4496e2a4da5c 100644
> --- a/drivers/staging/media/allegro-dvt/allegro-mail.c
> +++ b/drivers/staging/media/allegro-dvt/allegro-mail.c
> @@ -462,12 +462,14 @@ allegro_dec_encode_frame(struct mcu_msg_encode_frame_response *msg, u32 *src)
>  ssize_t allegro_encode_mail(u32 *dst, void *msg)
>  {
>  	const struct mcu_msg_header *header = msg;
> -	enum mcu_msg_type type = header->type;
> +	enum mcu_msg_type type;
>  	ssize_t size;
>  
>  	if (!msg || !dst)
>  		return -EINVAL;
>  
> +	type = header->type;

type is only used in the switch statement right below the assignment. Thus,
you could remove the local variable and directly use header->type in the
switch.

Michael

> +
>  	switch (type) {
>  	case MCU_MSG_TYPE_INIT:
>  		size = allegro_enc_init(&dst[1], msg);
> -- 
> 2.27.0
> 
> 
