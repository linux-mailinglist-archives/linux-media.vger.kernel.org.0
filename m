Return-Path: <linux-media+bounces-11912-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 384FC8CFA6F
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 09:49:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C1811C210D8
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 07:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99AFC3D978;
	Mon, 27 May 2024 07:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="tnoW2b8c"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C638E2E40E;
	Mon, 27 May 2024 07:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716796091; cv=pass; b=A//MkmnD1A+qOLgVFot7YMq9bJJFu8SMwH3Cn36vmWGx7GYOEAWhucyIqBfbve+WMkP/YsKz7LlLxoCR43Xl5uUrxfu1xd6QoxaXH3xSh3E2nX33P7+H5caBrbuXawAdER4mhA8EJ52Ft91gjf6qNjQz4fCqCWV/VxEWeIhwNZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716796091; c=relaxed/simple;
	bh=keh5W7U3dzsEif6ksUmuqn4x55o5x9L/8HfBAVTKtxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C+xJwJO79JJLhVjmTP62k1C5ibd263pZKLdvK6tyCujG+xx+yLlC6dYxsKsq/XcHkSJC+ebjdqq95jPHzw6oFmT+TrhwkTrxGCZUkSKaBUDsEViStK4bmeRWYd1mM7W9yMVagnyt+RkcAGjNLG5mp8FfDoqNBA8x6gF//1kmrJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=tnoW2b8c; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4VnnnK2tg0z49Pyk;
	Mon, 27 May 2024 10:48:05 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1716796085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hfBVpEPdEi/Ida+CmoF5UCxGqdboIgH47sljlECVuIs=;
	b=tnoW2b8cLuTt8UKe7iN88sAtOeI9i9K2vjv+XJXvAFA0t+4SNnMdmEDOUNijRlBK/NsJ0h
	uUzotMwRH1EZz/t8mO9ijz+S/7DK39MDXNuajhj2/pVrcw1FbQUFm1efCA+znDx5VUrQ2G
	/Ckj+uOBdsRD3W7SQvwbU0OYwhqhDqe53nmjNs0kOUr4FWUBosMN3z2vTKFzjX5w+jA9eZ
	WjVAdqkt78csYJcQauRuyhlh/Q511gsxo/tBueLhJmJme3coht+pvaDT57d6gx2qOO600D
	T51rObGuRPWqyN6gkM7ngnh1VolzFWzQmgALHO7NLhTQyoHuH+dGj4MJrkem8A==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1716796085; a=rsa-sha256;
	cv=none;
	b=b7Jkeh351bThPsf2iZpujuWgqn01uSvebMT9Sm79zb6zO7o8ADi4MBXktkYRJisQ81cmBN
	2yNpNO/MogsTWcb7ojhfw2aa1VPohy94WOHYCRKyBB1KAQR72kJhaGleppzN90qKjyKMpt
	EVxKZdZkxXGzWTPnxj0+JCR2MU6D576G7EjSK5lFTNAE+y1xCXLlMS7eV8tYP+T8zU6qkg
	sFHZ2GDoqq5qP+lEjLsZYFHpOCLlSCFV2FyDhxKx2cBXLLtLrdvXWAyU2lBh/SE9Zhm7Sg
	vWJge4WryhijygAjn/gfO72Hox/pBZSo66UdKAdAotNxXniwyKMww1XdmUamHg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1716796085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hfBVpEPdEi/Ida+CmoF5UCxGqdboIgH47sljlECVuIs=;
	b=Mj58O8gZ3WhdDHzNm1zQxgpvo0+yrIqPafXCEkJnp4xgLIKznp8Mb05Wq7bBUv/2h5M1sz
	XQFR+g2iuFKzKDEQ9i6hxOWi5GYpK1zkeG/7IE6Kc3jnx1qba0BxVqgYpYTNAzCeSsAxYp
	YWkVcQ+mmbFshgC0FGVJdeXuIYJz5acZb4S27vVG9mZ7rmEJCqJEsOrN37YU/CUVr8/mcp
	92JWYZG9vhTQHJntmDhQhl0jBiEp6zK8npQYo17R71X3BLV25hkLzj931GxFE+q/tMgJLD
	/kI+AdMiu8amxFplZLJ5xPosR65k7oNWFqs35AnZHEJbGLVHt4vAYu/gWPNYmA==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 25730634C93;
	Mon, 27 May 2024 10:45:10 +0300 (EEST)
Date: Mon, 27 May 2024 07:45:09 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Sylvain Petinot <sylvain.petinot@foss.st.com>, mchehab@kernel.org,
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	hdegoede@redhat.com, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 2/2] media: i2c: Add driver for ST VD56G3 camera sensor
Message-ID: <ZlQ6BV2sEw8PioBS@valkosipuli.retiisi.eu>
References: <20240417133453.17406-1-sylvain.petinot@foss.st.com>
 <20240417133453.17406-3-sylvain.petinot@foss.st.com>
 <Zil1wiCcCdwZs5Df@valkosipuli.retiisi.eu>
 <d45a2ea1-bc2d-441a-b036-1da40290c6b3@foss.st.com>
 <c9b35dc4-6f52-48e2-8952-5a43c500f819@foss.st.com>
 <ZlQ2zymJguCipLMl@valkosipuli.retiisi.eu>
 <864dc1d3-2478-46a2-84a5-c7c51f96268f@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <864dc1d3-2478-46a2-84a5-c7c51f96268f@foss.st.com>

Hi Benjamin,

On Mon, May 27, 2024 at 09:44:15AM +0200, Benjamin Mugnier wrote:
> Hi Sakari,
> 
> On 5/27/24 09:31, Sakari Ailus wrote:
> > Hi Benjamin,
> > 
> > On Mon, May 13, 2024 at 03:37:25PM +0200, Benjamin Mugnier wrote:
> >>>>> +static int vd56g3_read_expo_cluster(struct vd56g3 *sensor, bool force_cur_val)
> >>>>> +{
> >>>>> +	u64 exposure = 0;
> >>>>> +	u64 again = 0;
> >>>>> +	u64 dgain = 0;
> >>>>
> >>>> Do you need the assignments? The values are assigned by cci_read() below,
> >>>> right?
> >>>
> >>> Well initially, I didn't have those assignments and some checker
> >>> complains (Honestly I didn't investigate the warning).
> >>> I will double check and see if they are necessary.
> >>>
> >>
> >> Since I have smatch ready, I ran it without these initialization against
> >> the latest media tree. I got these :
> >>
> >> drivers/media/i2c/st-vd56g3.c:403 vd56g3_read_expo_cluster() error:
> >> uninitialized symbol 'exposure'.
> >> drivers/media/i2c/st-vd56g3.c:404 vd56g3_read_expo_cluster() error:
> >> uninitialized symbol 'again'.
> >> drivers/media/i2c/st-vd56g3.c:405 vd56g3_read_expo_cluster() error:
> >> uninitialized symbol 'dgain'.
> >> drivers/media/i2c/st-vd56g3.c:407 vd56g3_read_expo_cluster() error:
> >> uninitialized symbol 'exposure'.
> >> drivers/media/i2c/st-vd56g3.c:408 vd56g3_read_expo_cluster() error:
> >> uninitialized symbol 'again'.
> >> drivers/media/i2c/st-vd56g3.c:409 vd56g3_read_expo_cluster() error:
> >> uninitialized symbol 'dgain'.
> >>
> >> cci_read() is indeed not modifying its 'var' argument in the default
> >> case of the switch [1]. Spawning these errors.
> >> Adding a '*val = 0' in the default case would also fix it, but will
> >> change the function behavior.
> > 
> > I think I'd add the assignment to cci_read(). This isn't the only driver
> > that's affected. In the best case smatch would be fixed to figure this out.
> > 
> > Any thoughts?
> 
> IMHO adding the assignment to cci_read() is the cleanest way to handle it.

A fix in smatch would be the best in my opinion as it could catch the use
of the value in case of an error. But it's not going to be a short term
solution, hence I'd also assign *val to 0 now.

> 
> > 
> > Cc also Hans and Laurent.
> > 
> 

-- 
Regards,

Sakari Ailus

