Return-Path: <linux-media+bounces-16946-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6869F9618E8
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 23:00:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7E6C3B2236E
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 21:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 887221D362C;
	Tue, 27 Aug 2024 21:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="pyCuVy1r"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05451197A7E;
	Tue, 27 Aug 2024 21:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724792415; cv=pass; b=T2F1lAqJQB3OaJW1lIaf81ViYE2Zv3w61mtNivjW2xMniiL0rU5e/sFLBDqFF8dcwfIrsM+rNDek0MqtUStrOiSHKhqS4xZ/wp6WY2TXwHvixWAN/6QKx/pHKja09EMZa9E9Qlgx6MC05MeLrKkCAMzPns+nNXzmRk+vSfZMLNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724792415; c=relaxed/simple;
	bh=3tmDa+ApxpjRgL2H90px7hBugPgj5TyRTNHhII8BCbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FOup29OeyuBAfVRvMK7QnWiMnzil8G+zWHjTX4MU0GYEeuQBRBU3GtW+IZ/H6ctIPmzFB1sscbWXv+M5HqdbUAqGDr3JKQVayoCpIACD/WIg7i7zjupOycSphlhS7OdPd/rvV8AQb5WDCAhWk2Y9UFO17MFyxdwtpZRKHn4UGjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=pyCuVy1r; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4Wtg0n4YMnz49Q02;
	Wed, 28 Aug 2024 00:00:09 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1724792410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GfbL8MyofjzCdyK16tjATQ9HNfwXNF25derEKHzcUuQ=;
	b=pyCuVy1rJH8XxzUpXSN4mtcajlztgB+66nhrYUM4PblAxTkxyvchBopdiA+MnRoK9Nivpq
	Yk7VQHx5xYf0YMjB9Nf6ng46o/32f65FCQ87Nu0tvjsTe1u9NTLzrPC+u/GmXoHHo1sR4Y
	sg5UTiOGdpsUp2QLJ8dyUX85yCQGD+UasXQmLgvB1w9kEAiTzy0LP4Ly0FAyjqRmMfo8i5
	xqqbqxJXpjLWrzyGr7AgoFq+qmwAizhUhsA2tM8AkGgH1HC0syR7el+IdSeqqHnInW23uH
	ALMc+rR7yBjzR9WxOGVd+pATzFzgyXC0F8BU0T4jJyO94CCrwBteBSpUcMimeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1724792410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GfbL8MyofjzCdyK16tjATQ9HNfwXNF25derEKHzcUuQ=;
	b=CndQjWSLQXTZn+GA+GaEcKyWPNUVz4yIpZcZyPXrh6w/kOnl+NA8d5A1xT5vJE0fTdkfgb
	OglOcknhKYOWkMB+rVB3WEcWxWjeRdolI8L0rni6TgkV8OZo0HrMJBfhwNwPOjbdqFQBkj
	2TtDgnje/k1+QBRkBSh5VPUMMNTWiSyqah5eVxrOcGeJLu3uHaiZoB0RdCtNKi1qdJjnmb
	SevNGfBGdB5Pgwlu8Oij7VyB41gCfU2ehiRaoXdGcPCJZt1nRJQ0JLIGalt2EZ9XE/y23Q
	yc2FfLob1vDK4O2Q1zsC/jIFe80dnQJ5vmx8adXkCpTDQ1sUIKOYmkdVXF/oZQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1724792410; a=rsa-sha256;
	cv=none;
	b=CS2W89WRcs2QI0ZVh5pyVP+HRJ7qnBK4SyDQj/OQBKs5dkR0TZ3Lfeh8AJ6/U8BGwC39GZ
	rWrK0J9VqvhW8sAXu3/aTZZZFzf5SzL/80Jit4IEqzmukEeFOU3drPyJolzIoBfLe9H8s4
	fJ6BjwVnEFPANs01gxsNZxnOUmwlNv2Aa2In/cS8X5U66PigaRKnaRIO5a8N6Ee7TLty7O
	l8ucUofp7s/yeQBWD00XfUAioEjyp3lWtpAiJgUDoj3SKegVU9PDgk7lcqGL3x1KNYRFte
	sTsx+EQkKEFYIaicaL3jGs3WznjMXBqpWGlfKsbNA64rrmVehFh6TjBVyrU68g==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id C4D4E634C93;
	Wed, 28 Aug 2024 00:00:08 +0300 (EEST)
Date: Tue, 27 Aug 2024 21:00:08 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: staging: max96712: Add support for MAX96724
Message-ID: <Zs4-WGZYt_QjgeXE@valkosipuli.retiisi.eu>
References: <20240827131841.629920-1-niklas.soderlund+renesas@ragnatech.se>
 <20240827131841.629920-3-niklas.soderlund+renesas@ragnatech.se>
 <Zs3Vey0NEdGJAyTE@valkosipuli.retiisi.eu>
 <20240827175735.GH2636928@fsdn.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240827175735.GH2636928@fsdn.se>

Hejssan!

On Tue, Aug 27, 2024 at 07:57:35PM +0200, Niklas Söderlund wrote:
> Hej Sakari,
> 
> Tack för feedback.

Var så god!

> > > @@ -181,7 +186,8 @@ static void max96712_pattern_enable(struct max96712_priv *priv, bool enable)
> > >  	}
> > >  
> > >  	/* PCLK 75MHz. */
> > > -	max96712_write(priv, 0x0009, 0x01);
> > > +	if (!priv->max96724)
> > > +		max96712_write(priv, 0x0009, 0x01);
> > 
> > It'd be nice to have a macro for this, espeically now that the driver
> > supports more than one chip.
> 
> What do you mean by macro? To test for priv->max96724, a define for the 
> register name or something else?

Ah, I meant 0x0009 and preferrably 0x01 as well.

-- 
Hälsningar,

Sakari Ailus

