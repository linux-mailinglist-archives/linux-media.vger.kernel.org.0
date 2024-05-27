Return-Path: <linux-media+bounces-11910-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3E98CFA33
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 09:34:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC5EE1C20E72
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 07:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2AB6249FF;
	Mon, 27 May 2024 07:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="XZLZT5u4"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07B817BCA;
	Mon, 27 May 2024 07:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716795268; cv=pass; b=r7CdySXFBVtEElfAc+dgqMrqumDtZAlc43ZmjBNh8gAD50aJyV7gQYnWss+RQfpj8jNhMVx9r1gtMrSis7d0hMGCzFghQ+3CpP1PhlsdAD5eeTw7PkDN3W6Q9RMQ3p9kaxqKeNZWybbJ7FIRKJ9s+xSuQiabWJdMjtuA9MEc1P8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716795268; c=relaxed/simple;
	bh=2aUHCuEHYPSY1aqgTbH07WewgGXDHVS+cl/5npazbSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HDtpnImklA6gQ8zH4gVWT8ZzJJymeu4RbnbbsXLvSMZwl1SrTyX4sS8saX/FlcCPoQNPcC6TUnKLTRmlh8+hzsDGd/Xw0G+0xpC855VJePgw1UUAbtH6X7lIrzpoy8gWNI/ZThi5b9WzCxzHsIlBitf8eA9O06C1H/N6tE4wAyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=XZLZT5u4; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4VnnTW2kzQz49Pyk;
	Mon, 27 May 2024 10:34:23 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1716795263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=20RQnVNvBDYr+FH4kFsSKaG6M/MyCTgpME0lCI4FhFw=;
	b=XZLZT5u4WxvUYJAuY12Mkc2QAwE223rUqwwSRo29WTZt/ntX1zEddEQANMsAWXHflDk+/+
	I9LwirdI/w5aM2mwdxEGCYMgzpjmd2TLC2HNNpLsxsNyDWm8QuzCw4klXUy0bF/0ZOzHrx
	jz8KVu8vTgE005ffyxNqSEgfzFCMV2TkH+d367KX8V2ZnFvAHKbyCcjhxnO7Z1rtYWTp5l
	Z+Djo9BOI0YCuBXAE5gEfnIda4ly2YfGctSKM9s9ojzv6BcCQBKusZoYKFz0XljFwfxQxg
	WzG7bciJv/jp9Te7ez9kjphaZQkhzBqW4E8NmI+95qd9asON7C9Tv7J+JAOrfw==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1716795263; a=rsa-sha256;
	cv=none;
	b=OrTm0sGPkg/Fj/sLTOBHDpgC+0oUY1LYA+z9GJzm7r2MF2Fsg/D3LKUPRUlsyMiN9bbY8m
	BKgk+sELKUsH7yHjzeYPbZvaWLITWhFiQ24drtITXDsFYvKGpaCGP3fG8qMXndBDkKn9He
	26Sl1vaqpXlLHk/KcOm/bYuzAut7vktyNNqOIdGueWB+aJHsXgXe5GYq2a2AsMkQeCBiiV
	APmpnDL354SLShJs10FuqMh0cXEke0ANDyKLQiolFqocot1NW1IQxnTcpZSmUgH/VkwI4t
	Gi/OFpAr/SUUeTrT0cS7uB+Z8RtiEMEQOM3lNvTTnr2RGMI/peoOrMPhiiufmQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1716795263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=20RQnVNvBDYr+FH4kFsSKaG6M/MyCTgpME0lCI4FhFw=;
	b=eHyxaXzusUS5nE1k+w8Tx2OKSomDhZUF3v5f8Q68A3OAvnzHK+JynoJIMG90skV629Ms44
	J5Hr6BD7iGMSkCnjPNn0RkwcffcCZ31PVmmFhCbREq4aE8KhNwwLOis2kDezVgmmifmvNT
	2wDZ+1HCVRjmhor2LuZG7TcIQPlM55UufwRf4G6GzCRZdSi3lNnQ2RhTi6Km1eoTAYE1mE
	p/AECKIuzg66C3CQdPC9jcJuDSfqNcNqnewWp5RWLC5NjQ8V6b9w0IaIuOfDEvgCnkmckM
	UXdgh+4L+wwUJSeDJEEI1K2whY2jtP4GkaZosFrUmpNTi50jD8h2Fkb82NR0Sw==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 38798634C93;
	Mon, 27 May 2024 10:31:28 +0300 (EEST)
Date: Mon, 27 May 2024 07:31:27 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Sylvain Petinot <sylvain.petinot@foss.st.com>, mchehab@kernel.org,
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	hdegoede@redhat.com, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 2/2] media: i2c: Add driver for ST VD56G3 camera sensor
Message-ID: <ZlQ2zymJguCipLMl@valkosipuli.retiisi.eu>
References: <20240417133453.17406-1-sylvain.petinot@foss.st.com>
 <20240417133453.17406-3-sylvain.petinot@foss.st.com>
 <Zil1wiCcCdwZs5Df@valkosipuli.retiisi.eu>
 <d45a2ea1-bc2d-441a-b036-1da40290c6b3@foss.st.com>
 <c9b35dc4-6f52-48e2-8952-5a43c500f819@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9b35dc4-6f52-48e2-8952-5a43c500f819@foss.st.com>

Hi Benjamin,

On Mon, May 13, 2024 at 03:37:25PM +0200, Benjamin Mugnier wrote:
> >>> +static int vd56g3_read_expo_cluster(struct vd56g3 *sensor, bool force_cur_val)
> >>> +{
> >>> +	u64 exposure = 0;
> >>> +	u64 again = 0;
> >>> +	u64 dgain = 0;
> >>
> >> Do you need the assignments? The values are assigned by cci_read() below,
> >> right?
> > 
> > Well initially, I didn't have those assignments and some checker
> > complains (Honestly I didn't investigate the warning).
> > I will double check and see if they are necessary.
> > 
> 
> Since I have smatch ready, I ran it without these initialization against
> the latest media tree. I got these :
> 
> drivers/media/i2c/st-vd56g3.c:403 vd56g3_read_expo_cluster() error:
> uninitialized symbol 'exposure'.
> drivers/media/i2c/st-vd56g3.c:404 vd56g3_read_expo_cluster() error:
> uninitialized symbol 'again'.
> drivers/media/i2c/st-vd56g3.c:405 vd56g3_read_expo_cluster() error:
> uninitialized symbol 'dgain'.
> drivers/media/i2c/st-vd56g3.c:407 vd56g3_read_expo_cluster() error:
> uninitialized symbol 'exposure'.
> drivers/media/i2c/st-vd56g3.c:408 vd56g3_read_expo_cluster() error:
> uninitialized symbol 'again'.
> drivers/media/i2c/st-vd56g3.c:409 vd56g3_read_expo_cluster() error:
> uninitialized symbol 'dgain'.
> 
> cci_read() is indeed not modifying its 'var' argument in the default
> case of the switch [1]. Spawning these errors.
> Adding a '*val = 0' in the default case would also fix it, but will
> change the function behavior.

I think I'd add the assignment to cci_read(). This isn't the only driver
that's affected. In the best case smatch would be fixed to figure this out.

Any thoughts?

Cc also Hans and Laurent.

-- 
Regards,

Sakari Ailus

