Return-Path: <linux-media+bounces-12018-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5D58D0E86
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 22:11:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BE1B1F21FB6
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 20:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13852161308;
	Mon, 27 May 2024 20:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="QsbTQAwA"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F4E15EFDF;
	Mon, 27 May 2024 20:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716840678; cv=pass; b=o2v6wNCoNrcU5scSAjkz0alAAqEAx8QC+GSKnwPb/B3CljEq/mcEhBO03Gh/m0W+BiIRwP5QSZRheuKzZo3mB6E/r5IISI277B8zX8W9idYBgSAgnDeO2KWq/Jw+P2ISB1WGMoTqcqIAqcmTnCeYyrnVPpilblhu2XYXkl9RlYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716840678; c=relaxed/simple;
	bh=GAna6CmtZWwigrmOfREHXsKA0rw/oX+CUaud9yi1C00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nOoVgupO+/guMhHqQhiX2lbS77wyKoOdmL7YsP5O/EKqi9Yh2pOem+HXAggZmFCpQx6nsD6082jaQxhk3XTF6xZi73LMPjjkTwixSU65W5PR1MawsgAb5cgzAzXsT6EgFn0KyZWhvHFlozc7k+tSInseQfbaz6PUiBqcCmH6naU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=QsbTQAwA; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4Vp6Gm2HZ0z49Pym;
	Mon, 27 May 2024 23:11:12 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1716840673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1dOUbisstpfi5giuXiz9vGluX9yAy7I4sBmLBvo2Ydc=;
	b=QsbTQAwAma3JX5ZGrUCLdSWQnWGRM/VwuK7OTY5B+WDfopMDOnR5/vwkLA/2rNk3O+Ov/4
	yk3jd65h8potPC9lJZqtpdpgCfB1d8tW+mW4huz1Fm3RjtaVSkYyjaWul8fTtewRhbnJHe
	NDkwNnx+IgGyr8o5EEv1G1qzxdYTdpLW3sACLfm4BddEAOiYTwO7+ppVaGPIBxssneAE5n
	v/T0FtV4Ob65ZAvFvtT9loniss5l1Vx2WCkLJzR8DerIRHsgpzJio5P0QQknWi2apiDNNB
	l7qdWzreVLRFIpQyfHxfQh002WUhHkh4bFOJG4EPidq7GqYoB0S4BwyEs1Qykw==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1716840673; a=rsa-sha256;
	cv=none;
	b=SC4sjRWTrFvXnVp8v21dLlzWxxQ+IyI84hwLvdadAcjsT6VBEzHDg60p4l4WHYeeuGorHq
	9++UsgQXuQPi3PFRzChZzdu3cknxdjh+KDJDFjheLPhQZIUixFoTy+F7wbv/ZRMghpbIdq
	dLsVP16GL4q2+69L5Qc1+cKl717nuPZSkf0N2gbAZBvSdZLe67XSFfUYQLx9MtK0HojEJV
	dK3J0IrKi3gpY/c52th8JBc0XgQEO9jEr5sENXEBMcBQZXPocieY6YnNk9Hj/bmZUWElRU
	WAtwNppfC5T2ZhXihD1hRL1VpfGp27vUahssQ5jbqL/59qytC8BQJ7pbJsNgvQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1716840673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1dOUbisstpfi5giuXiz9vGluX9yAy7I4sBmLBvo2Ydc=;
	b=AaC3JrXcUqWFTzZohNx4Ja74VBdcE8NXcyHSI9828U13xvpehMUerBjzCZFwqrwpAVaujz
	5nvLxPHaFhwBZgLEwI2fBB5G6n5WFjuYrZnYDXbDV9Eyt/3Luflc/H0mIn/NVdt0cWS5wl
	yfF6XeJ3jSEyXPjHanEqSq3fHL1YhyiGbR3bN4CchKL30lzqVKRsjlvnsmqychu7nF91Tr
	RJceAlFvuwxDp+b4Cm0bJmbJEn/J2Ay2vuX3F693l8UdesloViQUhZ8A19VfCl5uWdp2da
	SGuQmpsfLLckG+6YPDJ7Q8d+oja2ZRgjdOPQsuddLpvQDzNgIxWuCUWMHRPD9A==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 9F48C634C93;
	Mon, 27 May 2024 23:08:14 +0300 (EEST)
Date: Mon, 27 May 2024 20:08:14 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Sylvain Petinot <sylvain.petinot@foss.st.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	benjamin.mugnier@foss.st.com, mchehab@kernel.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: dt-bindings: Add ST VD56G3 camera sensor
 binding
Message-ID: <ZlToLtUkVqzrZf4p@valkosipuli.retiisi.eu>
References: <20240521162950.6987-1-sylvain.petinot@foss.st.com>
 <20240521162950.6987-2-sylvain.petinot@foss.st.com>
 <2110ba34-658e-4d60-b524-2f5ead6c8d3e@linaro.org>
 <77fa3ed3-2341-4106-adf2-ec8bd9de91ff@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77fa3ed3-2341-4106-adf2-ec8bd9de91ff@foss.st.com>

Hi Sylvain,

On Mon, May 27, 2024 at 03:14:35PM +0200, Sylvain Petinot wrote:
> >> diff --git a/Documentation/devicetree/bindings/media/i2c/st,st-vd56g3.yaml b/Documentation/devicetree/bindings/media/i2c/st,st-vd56g3.yaml
> >> new file mode 100644
> >> index 000000000000..22cb2557e311
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/media/i2c/st,st-vd56g3.yaml
> > 
> > Why duplicated 'st'?
> 
> Legacy : our first st-mipid02 driver was upstream this way few years back.
> 
> We have 3 options :
> 
> 1- keep this unpleasant naming to keep consistency with st-mipid02 [1]
> and st-vgxy61 [2]
> 2- rename this driver properly ('vd56g3') and keep the two others the
> old way (I personally don't like this option)
> 3- rename this driver properly ('vd56g3') and in a second patch rename
> the two others drivers.
> 
> I would be interested to get Sakari's opinion on this subject.
> 
> [1]:
> https://elixir.bootlin.com/linux/v6.9.1/source/drivers/media/i2c/st-mipid02.c
> 
> [2]:
> https://elixir.bootlin.com/linux/v6.9.1/source/drivers/media/i2c/st-vgxy61.c

The driver could be renamed to align with a large majority that use the
same name as the bindings without the vendor prefix. You could add
MODULE_ALIAS() to help user space to cope with the change.

The DT compatible string indeed should reflect the name of the device, the
driver is indeed another matter.

-- 
Kind regards,

Sakari Ailus

