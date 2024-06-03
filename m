Return-Path: <linux-media+bounces-12483-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8B58D8752
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 18:32:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D24191F21C2E
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 16:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE8B136674;
	Mon,  3 Jun 2024 16:32:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from iodev.co.uk (iodev.co.uk [46.30.189.100])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FAD27E8;
	Mon,  3 Jun 2024 16:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.189.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717432327; cv=none; b=DlJ7dOKXa12vgFMEVZB0mrSmT6YxZQRPhDEU02ov2NHkNpHlG0KscNPoBNNyYwQo8oVvCzt8tIBlRE3CuA/sI/Uo90LusWu+mM3D7G+mH4iruBzUrbNgPOawyx/3GdlGN0aA+niHP9/sOvYEKbG6G6pngwIPpqh81qECOu8LwYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717432327; c=relaxed/simple;
	bh=n2MNycYzLz0lakSHL4JSDI/HsK0K7GI2jUwG3ZDFX9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YZ0G1aIbC1AwK3GgamYI3pp6hsXVlQZBD6ao/oKvMeOJoOuTJZK1V+EsNMQU7YhFhcfVYPcjN8tungLypmxgAoLntQHVqM12GtZQVSPuqXrzw2EJ8o2rwSJdao+Aj4Ao3nZ4JCaJmzoGCubjA2tsSFKNuxnMNSlF6Gf1NX18MXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iodev.co.uk; spf=pass smtp.mailfrom=iodev.co.uk; arc=none smtp.client-ip=46.30.189.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iodev.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iodev.co.uk
Received: from pirotess (222.red-83-46-228.dynamicip.rima-tde.net [83.46.228.222])
	by iodev.co.uk (Postfix) with ESMTPSA id E11952EF94D;
	Mon, 03 Jun 2024 18:25:51 +0200 (CEST)
Date: Mon, 3 Jun 2024 18:25:50 +0200
From: Ismael Luceno <ismael@iodev.co.uk>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org,
	Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
	Anton Sviridenko <anton@corp.bluecherry.net>,
	Andrey Utkin <andrey_utkin@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 6/8] media: solo6x10: use 'time_left' variable with
 wait_for_completion_timeout()
Message-ID: <Zl3ujm4KEBviJIWP@pirotess>
References: <20240603092841.9500-1-wsa+renesas@sang-engineering.com>
 <20240603092841.9500-7-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603092841.9500-7-wsa+renesas@sang-engineering.com>

On 03/Jun/2024 11:28, Wolfram Sang wrote:
> There is a confusing pattern in the kernel to use a variable named 'timeout' to
> store the result of wait_for_completion_timeout() causing patterns like:
> 
> 	timeout = wait_for_completion_timeout(...)
> 	if (!timeout) return -ETIMEDOUT;
> 
> with all kinds of permutations. Use 'time_left' as a variable to make the code
> self explaining.
> 
> Fix to the proper variable type 'unsigned long' while here.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/media/pci/solo6x10/solo6x10-p2m.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/pci/solo6x10/solo6x10-p2m.c b/drivers/media/pci/solo6x10/solo6x10-p2m.c
> index ca70a864a3ef..5f100e5e03d9 100644
> --- a/drivers/media/pci/solo6x10/solo6x10-p2m.c
> +++ b/drivers/media/pci/solo6x10/solo6x10-p2m.c
> @@ -57,7 +57,7 @@ int solo_p2m_dma_desc(struct solo_dev *solo_dev,
>  		      int desc_cnt)
>  {
>  	struct solo_p2m_dev *p2m_dev;
> -	unsigned int timeout;
> +	unsigned long time_left;
>  	unsigned int config = 0;
>  	int ret = 0;
>  	unsigned int p2m_id = 0;
> @@ -99,12 +99,12 @@ int solo_p2m_dma_desc(struct solo_dev *solo_dev,
>  			       desc[1].ctrl);
>  	}
>  
> -	timeout = wait_for_completion_timeout(&p2m_dev->completion,
> -					      solo_dev->p2m_jiffies);
> +	time_left = wait_for_completion_timeout(&p2m_dev->completion,
> +						solo_dev->p2m_jiffies);
>  
>  	if (WARN_ON_ONCE(p2m_dev->error))
>  		ret = -EIO;
> -	else if (timeout == 0) {
> +	else if (time_left == 0) {
>  		solo_dev->p2m_timeouts++;
>  		ret = -EAGAIN;
>  	}

Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>

