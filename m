Return-Path: <linux-media+bounces-13170-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 113A5906736
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 10:42:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2B50280FDB
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 08:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9553B14291A;
	Thu, 13 Jun 2024 08:39:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AECD142916
	for <linux-media@vger.kernel.org>; Thu, 13 Jun 2024 08:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718267976; cv=none; b=OCuivDmzu3I2L1ZETppqncaFgu7AsJk/nkjkIAKYlr4dSwOjSxEaTuN35IAv51Jgw0O8tRWrRT3P7EBq7G0v4R7yphgoQ8xhewG+Nk6c1dr2Yj1CFWxWt9R18nQVI8s/bn+cv4p0r/gQJV7culXDDBtZFfgsSwCXdBP5Tdc54F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718267976; c=relaxed/simple;
	bh=7ACeVZMYX61l7lQaZDCozpxXuPOFLEdwjRMo2FdSZf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wpo+a4N7Ma3SI3/d7ObIjXRpjaSOKeF1MyaU//0hDurVEAcr7Lc7Efpboi3XyE1skvWp/RJ2xmgP7zLBQOW8YTBHqgi0J8KDYKme5eLr8+cb7ldxLy0ojYHK2ybiS+CY12nL8FHJHt8jt85fKjYkHsHIo1kPNIq1CQq5X+oipis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mtr@pengutronix.de>)
	id 1sHfzV-0005MD-Oq; Thu, 13 Jun 2024 10:39:29 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mtr@pengutronix.de>)
	id 1sHfzV-001zED-9V; Thu, 13 Jun 2024 10:39:29 +0200
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mtr@pengutronix.de>)
	id 1sHfzV-008R01-0d;
	Thu, 13 Jun 2024 10:39:29 +0200
Date: Thu, 13 Jun 2024 10:39:29 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 1/8] media: allegro: use 'time_left' variable with
 wait_for_completion_timeout()
Message-ID: <ZmqwQV6Qm1kqoM8t@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
References: <20240603092841.9500-1-wsa+renesas@sang-engineering.com>
 <20240603092841.9500-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240603092841.9500-2-wsa+renesas@sang-engineering.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

Hi Wolfram,

On Mon, 03 Jun 2024 11:28:32 +0200, Wolfram Sang wrote:
> There is a confusing pattern in the kernel to use a variable named 'timeout' to
> store the result of wait_for_completion_timeout() causing patterns like:
> 
> 	timeout = wait_for_completion_timeout(...)
> 	if (!timeout) return -ETIMEDOUT;
> 
> with all kinds of permutations. Use 'time_left' as a variable to make the code
> self explaining.

Thanks for the patch.

There is another instance of wait_for_completion_timeout() in the
driver, which uses tmo instead of timeout. Maybe this patch should
change that, too.

Michael

> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  .../media/platform/allegro-dvt/allegro-core.c    | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
> index da61f9beb6b4..4016aef5fdb9 100644
> --- a/drivers/media/platform/allegro-dvt/allegro-core.c
> +++ b/drivers/media/platform/allegro-dvt/allegro-core.c
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

