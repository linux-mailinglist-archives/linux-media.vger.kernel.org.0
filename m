Return-Path: <linux-media+bounces-16057-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D5594D25D
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2024 16:41:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 231C0B21E77
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2024 14:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E2DB196C6C;
	Fri,  9 Aug 2024 14:41:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C9C12B82
	for <linux-media@vger.kernel.org>; Fri,  9 Aug 2024 14:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723214509; cv=none; b=geQJImqpX9OF1a59+gGDJ9OXAGEv9L6jR8eGDT+OdMx/3ybQvlBBvojBIACdhGD9ck7CejDLRARdKvKwcWxVWFif2kQnhkLHz6+LEOHJIAIgcH8nQjG0FFMZupOiL/j5cshS5KXs0Z5C+93U5P4AqfaUng+ThUDV4DKH7uiUd9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723214509; c=relaxed/simple;
	bh=Ms6m2p4k/aOdNsvobWpEhn3YNGcIF2jrpB5iYTuuvM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P5wlW29aELfLgNo5FoY8QAFak4KVxMy0Avmmxp45fFiOi7MMrK7WcHHaPgya12ZjeQq/m9szmQnOArw+bffPtfYULmmjebxtLUakcqXzWjoWdOQXSs9vY1pty79xVrFcKc/PzHFXRzf7M193RtipGTF1CojTt34TTTqngYEjJ1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mtr@pengutronix.de>)
	id 1scQoK-0001sj-Vz; Fri, 09 Aug 2024 16:41:45 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mtr@pengutronix.de>)
	id 1scQoK-005gnP-El; Fri, 09 Aug 2024 16:41:44 +0200
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mtr@pengutronix.de>)
	id 1scQoK-00AqA0-16;
	Fri, 09 Aug 2024 16:41:44 +0200
Date: Fri, 9 Aug 2024 16:41:44 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-media@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 1/8] media: allegro: use 'time_left' variable with
 wait_for_completion_timeout()
Message-ID: <ZrYqqEOpk0v8MDeB@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-media@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240805215123.3528-1-wsa+renesas@sang-engineering.com>
 <20240805215123.3528-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240805215123.3528-2-wsa+renesas@sang-engineering.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

On Mon, 05 Aug 2024 23:51:14 +0200, Wolfram Sang wrote:
> There is a confusing pattern in the kernel to use a variable named
> 'timeout' to store the result of wait_for_completion_timeout() causing
> patterns like:
> 
>         timeout = wait_for_completion_timeout(...)
>         if (!timeout) return -ETIMEDOUT;
> 
> with all kinds of permutations. Use 'time_left' as a variable to make the
> code self explaining, also for the code path using 'tmo' as a variable.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>

> ---
> 
> Change since v1:
> * fixed the 'tmo' variable as well
> 
>  .../media/platform/allegro-dvt/allegro-core.c | 24 +++++++++----------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
> index da61f9beb6b4..0142ba175198 100644
> --- a/drivers/media/platform/allegro-dvt/allegro-core.c
> +++ b/drivers/media/platform/allegro-dvt/allegro-core.c
> @@ -1415,11 +1415,11 @@ static int allegro_mcu_send_encode_frame(struct allegro_dev *dev,
>  static int allegro_mcu_wait_for_init_timeout(struct allegro_dev *dev,
>  					     unsigned long timeout_ms)
>  {
> -	unsigned long tmo;
> +	unsigned long time_left;
>  
> -	tmo = wait_for_completion_timeout(&dev->init_complete,
> -					  msecs_to_jiffies(timeout_ms));
> -	if (tmo == 0)
> +	time_left = wait_for_completion_timeout(&dev->init_complete,
> +						msecs_to_jiffies(timeout_ms));
> +	if (time_left == 0)
>  		return -ETIMEDOUT;
>  
>  	reinit_completion(&dev->init_complete);
> @@ -2481,14 +2481,14 @@ static void allegro_mcu_interrupt(struct allegro_dev *dev)
>  static void allegro_destroy_channel(struct allegro_channel *channel)
>  {
>  	struct allegro_dev *dev = channel->dev;
> -	unsigned long timeout;
> +	unsigned long time_left;
>  
>  	if (channel_exists(channel)) {
>  		reinit_completion(&channel->completion);
>  		allegro_mcu_send_destroy_channel(dev, channel);
> -		timeout = wait_for_completion_timeout(&channel->completion,
> -						      msecs_to_jiffies(5000));
> -		if (timeout == 0)
> +		time_left = wait_for_completion_timeout(&channel->completion,
> +							msecs_to_jiffies(5000));
> +		if (time_left == 0)
>  			v4l2_warn(&dev->v4l2_dev,
>  				  "channel %d: timeout while destroying\n",
>  				  channel->mcu_channel_id);
> @@ -2544,7 +2544,7 @@ static void allegro_destroy_channel(struct allegro_channel *channel)
>  static int allegro_create_channel(struct allegro_channel *channel)
>  {
>  	struct allegro_dev *dev = channel->dev;
> -	unsigned long timeout;
> +	unsigned long time_left;
>  
>  	if (channel_exists(channel)) {
>  		v4l2_warn(&dev->v4l2_dev,
> @@ -2595,9 +2595,9 @@ static int allegro_create_channel(struct allegro_channel *channel)
>  
>  	reinit_completion(&channel->completion);
>  	allegro_mcu_send_create_channel(dev, channel);
> -	timeout = wait_for_completion_timeout(&channel->completion,
> -					      msecs_to_jiffies(5000));
> -	if (timeout == 0)
> +	time_left = wait_for_completion_timeout(&channel->completion,
> +						msecs_to_jiffies(5000));
> +	if (time_left == 0)
>  		channel->error = -ETIMEDOUT;
>  	if (channel->error)
>  		goto err;
> -- 
> 2.43.0
> 
> 

