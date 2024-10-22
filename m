Return-Path: <linux-media+bounces-20047-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 554B59AB1BF
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 17:10:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B7651F2198B
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 15:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 601DE1A2653;
	Tue, 22 Oct 2024 15:10:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040491A257D
	for <linux-media@vger.kernel.org>; Tue, 22 Oct 2024 15:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729609851; cv=none; b=b5mL3CJbqBAvg+gFfsYRNm77rOCbfJ7nChO9BjXTJiPQEtlaD/3z4lCf2VY0EpAi5pC3/4lRdLHKcj+P4aJMbZ/IkEo5lcEWUS43TKPeg19RO4/EEyhWhEHQYRYe3CufA6dAIYPHcpn8BESoahIyF1sq5BhdzRZ5V4xtFKtuMkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729609851; c=relaxed/simple;
	bh=8Z/OWl5aL2NHid7SE+JcuG/wkW9jpT5xbvlrR0wyqjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hVuix0x7fumDSpivIEvhNOcdk9YDkN6ApWZM6qJsDm78fz68Qm2x4tTk73wRXNquLkbdJZH3CdsCHGlS9FuRBaW4zOL4vva1Lc++QG1ntB1+mNHGWRZ3z57P7qc6+Fz+ByQaPQVTJKk9va/gvHJriGYutxtKTGfcGR+PYbOuE90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mtr@pengutronix.de>)
	id 1t3GWf-0002fc-KB; Tue, 22 Oct 2024 17:10:25 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mtr@pengutronix.de>)
	id 1t3GWf-000t5P-0G;
	Tue, 22 Oct 2024 17:10:25 +0200
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mtr@pengutronix.de>)
	id 1t3GWe-007dKF-33;
	Tue, 22 Oct 2024 17:10:24 +0200
Date: Tue, 22 Oct 2024 17:10:24 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: Gaosheng Cui <cuigaosheng1@huawei.com>
Cc: kernel@pengutronix.de, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	wangweiyang2@huawei.com, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: platform: allegro-dvt: Fix possible memory leak
 in allocate_buffers_internal()
Message-ID: <ZxfAYHJmPCi5xc3s@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
	Gaosheng Cui <cuigaosheng1@huawei.com>, kernel@pengutronix.de,
	mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	wangweiyang2@huawei.com, linux-media@vger.kernel.org
References: <20241009082802.1587618-1-cuigaosheng1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241009082802.1587618-1-cuigaosheng1@huawei.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

On Wed, 09 Oct 2024 16:28:02 +0800, Gaosheng Cui wrote:
> The buffer in the loop should be released under the exception path,
> otherwise there may be a memory leak here.
> 
> To mitigate this, free the buffer when allegro_alloc_buffer fails.
> 
> Fixes: f20387dfd065 ("media: allegro: add Allegro DVT video IP core driver")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>

Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>

> ---
>  drivers/media/platform/allegro-dvt/allegro-core.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
> index 73606cee586e..88c36eb6174a 100644
> --- a/drivers/media/platform/allegro-dvt/allegro-core.c
> +++ b/drivers/media/platform/allegro-dvt/allegro-core.c
> @@ -1509,8 +1509,10 @@ static int allocate_buffers_internal(struct allegro_channel *channel,
>  		INIT_LIST_HEAD(&buffer->head);
>  
>  		err = allegro_alloc_buffer(dev, buffer, size);
> -		if (err)
> +		if (err) {
> +			kfree(buffer);
>  			goto err;
> +		}
>  		list_add(&buffer->head, list);
>  	}
>  
> -- 
> 2.25.1
> 
> 

