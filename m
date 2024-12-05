Return-Path: <linux-media+bounces-22672-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 259D99E5040
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 09:52:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4B5A18822A3
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 08:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A44B1D5141;
	Thu,  5 Dec 2024 08:52:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02761D0DEC
	for <linux-media@vger.kernel.org>; Thu,  5 Dec 2024 08:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733388721; cv=none; b=fX+Dcyk3h0w03jZ/Cv9iSAtZurYOQy3ERz2+/4HwBDtmGdLv/wxj050fhRKJ5xaA/a5gHjt/hxNTEHAYC/TJVCrW/5CzaKmeooe4aJehoEOO7y1AzR0B3GUFCztFJ9e6/IP6JDra9Lwo2ZbnZug6pVdAIJpSHyveGjLY0wKvscQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733388721; c=relaxed/simple;
	bh=b4p7yGWZGdXYw7p/q4RYXFl3rS0DHckT4uq6uQrXwK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kycShYIbsswI3iXdQ3KZj+AV0zEUp0sDYxGtwZW2MmEkDLkELuDc8pL0yCqC08fPYOkr+nuoSjU5eKheY3k9EB1XptoVTIF5J+S95vlGkZu0Skoebaz+v6I7OfgluO/bx4hDjpiMKTEmDxkbwKigI6tGG04uh5zKCUhactH6BRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mtr@pengutronix.de>)
	id 1tJ7aV-0001RK-NL; Thu, 05 Dec 2024 09:51:55 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mtr@pengutronix.de>)
	id 1tJ7aS-001nHN-2q;
	Thu, 05 Dec 2024 09:51:53 +0100
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mtr@pengutronix.de>)
	id 1tJ7aT-00GOvn-1p;
	Thu, 05 Dec 2024 09:51:53 +0100
Date: Thu, 5 Dec 2024 09:51:53 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: kernel@pengutronix.de, mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: platform: allgro-dvt: unregister v4l2_device on
 the error path
Message-ID: <Z1FpqQldoZvVlydA@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, kernel@pengutronix.de,
	mchehab@kernel.org, linux-media@vger.kernel.org
References: <20241205020621.2051079-1-joe@pf.is.s.u-tokyo.ac.jp>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205020621.2051079-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

Hi Joe,

On Thu, 05 Dec 2024 11:06:21 +0900, Joe Hattori wrote:
> In allegro_probe(), the v4l2 device is not unregistered in the error
> path, which results in a memory leak. Fix it by calling
> v4l2_device_unregister() before returning error.

Thanks for the patch!

Out of curiosity: How did you find the memory leak? Did you use some
specific tooling for that?

> 
> Fixes: d74d4e2359ec ("media: allegro: move driver out of staging")
> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>

Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>

> ---
>  drivers/media/platform/allegro-dvt/allegro-core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
> index e491399afcc9..eb03df0d8652 100644
> --- a/drivers/media/platform/allegro-dvt/allegro-core.c
> +++ b/drivers/media/platform/allegro-dvt/allegro-core.c
> @@ -3912,6 +3912,7 @@ static int allegro_probe(struct platform_device *pdev)
>  	if (ret < 0) {
>  		v4l2_err(&dev->v4l2_dev,
>  			 "failed to request firmware: %d\n", ret);
> +		v4l2_device_unregister(&dev->v4l2_dev);
>  		return ret;
>  	}
>  
> -- 
> 2.34.1
> 
> 

