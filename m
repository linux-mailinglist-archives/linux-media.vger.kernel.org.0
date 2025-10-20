Return-Path: <linux-media+bounces-45065-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A677ABF2EF5
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 20:29:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B39018A5ECD
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 18:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F12133291C;
	Mon, 20 Oct 2025 18:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="FCfovOsZ"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562C627B345;
	Mon, 20 Oct 2025 18:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760984946; cv=pass; b=lmdD1tjB7Fbvw1t2QFgQDpoef2rTzYGbNn0toyHPlRjAriCIj5agsFSIvDijunpydaK54Perzqwpi157xk4GzSPJDb/7CG7mhjSlourgrCz35l45XqbKMTdekU7FevM2GdXsI5TKCvTDAYU8USs0bUSAyeWq6+OP44zKE2oi/Rk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760984946; c=relaxed/simple;
	bh=C4Q5V6tBRB3IMyf1AeACx4S8uv7NjMA3quCujeqqqZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n44dg2oIiyvWcVAMgB+7qrv+OlkMVzh2AtpuGF741OkXPMNpv7l3IuMkbrbQ5DESUw9hVAcJJuiIenPDDpl2aZKBRQ66bszRjDbdKMKcgtAXAhz/ADSn6fa/tTMe6XQPtfAG2AAkH1dEDaWiuany5KfAxR7dhB5AWieGwCbaHeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=FCfovOsZ; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4cr3pp30Nnz49Pv9;
	Mon, 20 Oct 2025 21:28:50 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1760984930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p0qqzZHHz/0r7H8SMWr8rylCvjrXud3IqxroUD42/J0=;
	b=FCfovOsZq4B1TX5f6aM5jtfBh9Iyxy12lDbaY9dFc0gkTl5dtXw8ji5+RgyHRZrxzSsLwG
	aJ1Fo0OqVpgcmTwyrZCB1ixGNhxrCvUv7PLV4N5ASOEGNaI0jKrQCUkd+JratuEOWgV1ef
	CsO+nFkUIHKi4emyolGEJ2+wdHngufzBEIczqwqBwcD0+/fPvNdwcZO0/akocQwvqRyEL6
	ZZmwqfMCu7SIj0hYa91wpBSglbNd/4SbNbtYKOggvmnBytXyKajnY/++dgzlZ0n7rIyrQd
	F37DJGaeXDPb/Hj+I/37hKI+wf4HC9/2KwJ6AacBbx3l526eNo6XpuHfqkCM2Q==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1760984930; a=rsa-sha256;
	cv=none;
	b=l498ZiT4N5HGKaNBBURODcs07DNMh2BIfQK4Mb6lcmBITJRZE620+yAi+ZGl+dxV6ZkaoA
	bibweS6mtaXMqMz3BBEuvo19VBDjefg+2KUKgblWKGq4FixGhz9u2HiDFkruZlOvMkFniP
	GbED5y8jf8pFeLGAeLnM4fnRQhg9KxLWv9QPYa4QSCKa750+aJwojy0zsZKl4zRUZpnVu0
	js7ovhhXxW+CRJCaXkUBmhy6QgNWhhp2h4a1iVGZbgKo+rKHrfj4yyeu3+P7W7IfBUGDTl
	LJBj1vj0JMtFcn+Qxyr2bjOwYlaLnUZ0U0N4KGYZcxCD/RDMhE0SIKPfBZZWmw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1760984930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p0qqzZHHz/0r7H8SMWr8rylCvjrXud3IqxroUD42/J0=;
	b=EE9Syeoxhls1mtOm6JGqTLhcjAdgymKXsXCY623S/rb80ExBijc2l/I4mchGpqlS+0C5Q9
	cbFZJQubQWDC2DervNV7XFwm2dzoGNfrwA2w40RZQ5qt18SFOyCqWNsp6HZ2UqdmfjWKEJ
	JLlsUaZDyXneodvi3Whf/70JZG0deGPg/GsDMSDY4+zw6h3M48Bfi5bi5p4C27LRBtPQ39
	P6X565p+2dBVCf8d2x+QMQmu0UtdLuezKNhtZS8+y/dkfRBDN3mpyK37t0FpLKuQOqLrVE
	0dmKBLGeckMqdyaPLpjv6UaWHhPqCLmCm0iaWwAhht/roFJcjKdew/4mQCMqUQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id CBFAD634C50;
	Mon, 20 Oct 2025 21:28:49 +0300 (EEST)
Date: Mon, 20 Oct 2025 21:28:49 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Ricardo Ribalda <ribalda@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: i2c: imx214: Exit early on control init errors
Message-ID: <aPZ_YRwpDNPFjePX@valkosipuli.retiisi.eu>
References: <20251014-imx214-smatch-v2-1-04218043086d@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014-imx214-smatch-v2-1-04218043086d@chromium.org>

Hi Ricardo,

On Tue, Oct 14, 2025 at 11:00:17AM +0000, Ricardo Ribalda wrote:
> Now we try to initialize all the controls and at the very end check
> ctrl_hdlr->error to check if one of them has failed.
> 
> This confuses smatch, who do not know how to track the state of
> imx214->link_freq.
> 
> drivers/media/i2c/imx214.c:1109 imx214_ctrls_init() error: we previously assumed 'imx214->link_freq' could be null (see line 1017)
> 
> Fix this by exiting early on control initialization errors.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Right now we are handling this with a quirk in media-ci, if Dan cannot
> fix smatch in a kernel cycle we should merge this patch.
> ---
> Changes in v2:
> - Fix typo in commit message commit
> - Move error tag where it belongs (Thanks Hans!)
> - Link to v1: https://lore.kernel.org/r/20250829-imx214-smatch-v1-1-f3d1653b48e4@chromium.org
> ---
>  drivers/media/i2c/imx214.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 94ebe625c9e6ee0fb67fe1d89b48b2f1bf58ffc6..c66f0e18726c3fc15df91c37888a797bcea82134 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -1014,8 +1014,10 @@ static int imx214_ctrls_init(struct imx214 *imx214)
>  						   V4L2_CID_LINK_FREQ,
>  						   imx214->bus_cfg.nr_of_link_frequencies - 1,
>  						   0, imx214->bus_cfg.link_frequencies);
> -	if (imx214->link_freq)
> -		imx214->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +	if (!imx214->link_freq)
> +		goto err_init_ctrl;
> +
> +	imx214->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;

You could do this cleaner by simply moving the assignment after the handler
error check. Some drivers do that already.

I wonder why this seems to be a problem for smatch in the imx214 driver as
the pattern is widely used across the sensor drivers.

>  
>  	/*
>  	 * WARNING!
> @@ -1099,6 +1101,7 @@ static int imx214_ctrls_init(struct imx214 *imx214)
>  
>  	v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &imx214_ctrl_ops, &props);
>  
> +err_init_ctrl:
>  	ret = ctrl_hdlr->error;
>  	if (ret) {
>  		v4l2_ctrl_handler_free(ctrl_hdlr);
> 

-- 
Kind regards,

Sakari Ailus

