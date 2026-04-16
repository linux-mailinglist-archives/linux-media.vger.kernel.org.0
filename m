Return-Path: <linux-media+bounces-58866-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPuoKA+x4GkRkwAAu9opvQ
	(envelope-from <linux-media+bounces-58866-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 11:51:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E344340C9E0
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 11:51:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 639F73025715
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 09:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A0EF37FF78;
	Thu, 16 Apr 2026 09:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="n34kiLld"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDFA1E98E3;
	Thu, 16 Apr 2026 09:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776332786; cv=pass; b=o/3DI/ZW9cECc7tNnM6GNFL+Jx6T+UcnCtmdfA1HP2L1rB+UdVoOwpEvRWhsUUzawNjr7L2xCgjfw3e/YpfClgWFabH3IM+saTcp9Ztm9zfGtWHxccMw0VNr0XyLZCr8wYBX6tpT1AWMRLpetNz7y09xFj/oP+7HBfGRRpeXMiw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776332786; c=relaxed/simple;
	bh=N4qepz4YpGLcuNetyEV2sjiyG1LEBKbIYNpkffaK9d4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ftrocOmBat3BZVnloA1eW7vY4rSS2eA4dBbI6YqN7s/VMuPCrHqKz9OUx4NFLEjHldwbpZt+rsae9Uq8n4kVr5g/3AEU1Rd+6wjWPS3IirxpFFpbg38g0wNtakvHLimpxpMkWurgJBU2tajST31vOr6ffxMgryuLM9KXE+Qiz3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=n34kiLld; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4fxCnb56ryz49PsT;
	Thu, 16 Apr 2026 12:46:11 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1776332772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VaHdyCzXNJr7IekKuziJhqeGSsHGHBseulsPhW9yVdI=;
	b=n34kiLldjrbmmjxsaJgFCzZAAJnwFCEx/epb9V7mAv62nVPAsVl+U2AsogPYJ9AekcQClg
	ixjYFJ6z1d3NCORCrYWoap4lT0wofbskeMO/S6N/IJj82to5YsZ2bWxuccGrQXdQT4ErxN
	lroN0PitwgKhItKfBY0mwLfnwwImA9cWMbmSuOg2CahbTAGW9UNYgkIaj71QGoomyCEYCe
	Gza+/IYzII2iDVA/zapr8QSo2SNqNGWlA0/4Z7Z1Ud1EY3RMyk/7zAyQwHTMo5IVxkOheQ
	9OfpY3514TaS2i5o+/UdCZKkcLQ0mNvyKqRQyshiqYbqdaGUd6YTPUwoSgUobQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1776332772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VaHdyCzXNJr7IekKuziJhqeGSsHGHBseulsPhW9yVdI=;
	b=HTTe0Ve7qF9k1oOQwjymUI37dAQRI1+Q2AYO6IY8oY1WTaPebl7h9yiQpbKC+jKF9dNEbE
	KuxvD4/g3zjrXnx0na06YqnEH8A565HDvANXzU4327WAKs5bkIC7pjR1XYDQUBJrV4MUb9
	qGhNaye3yIPPUpJspGtvA3zHkaGxFAWadQT3x6CM7qvSOX/8Uisgi9bBxGk+ocqTess+i2
	5qq3dzmrPmnsKC66dSmo26KPWyVDZU//qXWuGmINjNruOvfDFvSFXNpyX4UuzDjFr7IKUC
	cx0h61Dt4KXKBe/VGf5es2yVt99E0eB3ejlPp09lbvwj2/xZrwTFtVP8ymiwYA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1776332772;
	b=v+LeiZ2nW7V2UioIgZp8RaHJ1BqL65GUBUrvnsbuoYT/EYsZ9+e77QMzZY4ZuuOSqs+l1q
	aHhTMLc7OtfkgQeEwtI2U7etmwQOyrHpZ7AIDpi9RN1VdnOF4U6TLz1VLJP/cg94TzU6lT
	UZsjvrFVlEgAbrXpedAKcrvpGGKMEdgoboOJ2P6eUVwekmd3u4QBr6M7vxWL+CCNPQS3DQ
	r5ofup1mKbhfjIIwYfu04tqKHA4jW42se1uNafqbb9+uZ97AcEjqbTjHRDV/+uEZsChMNe
	GiTm400rGvmS+SgYah0WwlnuLUdXALOVhw+VLCJr1YdUqMF6TPGZnO1Mp6RgEQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 21C32634C4E;
	Thu, 16 Apr 2026 12:46:11 +0300 (EEST)
Date: Thu, 16 Apr 2026 12:46:10 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Ramon Watson Vilar <watsonvilar@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: atomisp: use usleep_range instead of
 msleep for short delays
Message-ID: <aeCv4m9eW6E-YE1j@valkosipuli.retiisi.eu>
References: <20260415190005.114900-1-watsonvilar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415190005.114900-1-watsonvilar@gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=lahtoruutu];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58866-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[iki.fi:+];
	DMARC_NA(0.00)[iki.fi];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iki.fi:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,protonmail.com:email,valkosipuli.retiisi.eu:mid]
X-Rspamd-Queue-Id: E344340C9E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Ramon,

On Wed, Apr 15, 2026 at 04:00:05PM -0300, Ramon Watson Vilar wrote:
> The msleep() function is not precise for delays shorter than 20ms and
> can sleep for significantly longer than requested. Replacing it with
> usleep_range() improves accuracy and is the recommended practice
> according to documentation.
> 
> Signed-off-by: Ramon Watson Vilar <watsonvilar@gmail.com>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> index d3414312e1de..e0b0f09a5c26 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> @@ -433,7 +433,7 @@ static int power_up(struct v4l2_subdev *sd)
>  			goto fail_power;
>  	}
>  
> -	msleep(5);
> +	usleep_range(5000, 10000);

A similar patch <20260319204242.2076191-1-abhai@protonmail.com> has already
been submitted.

>  	return 0;
>  
>  fail_clk:

-- 
Regards,

Sakari Ailus

