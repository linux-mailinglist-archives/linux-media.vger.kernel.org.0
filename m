Return-Path: <linux-media+bounces-45113-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A1830BF5625
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 11:00:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AA4F835243E
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 09:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4880A2E11CB;
	Tue, 21 Oct 2025 09:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="Afhm0J56"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3A0329C76;
	Tue, 21 Oct 2025 09:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761037219; cv=pass; b=VPBt5P7BuJcPzY7khQEEM9kidItTq8z3ps2Xs/7chEyOFY/f9GMduiu/UeRQLBcqtZMbcPIMBdM4rerSQRmuRXkibeMdcyAiD0VzjNpcARUy3RDwVDb6SBGBdGBwzUOlZ5imC0kWS5bDW7AX0PMTJa8DckWtg5KP/Q/ZaGmJQwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761037219; c=relaxed/simple;
	bh=Ery3wCWKUyPGPwDNSyS3Pks0jJfbeTvhsm/cOUBQB6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rRQTczcGsVm6vl7my0gKR9YvhXrVy7mFftq5pDZz8mqRGNfNseFSFjjpj8+3IK4JM4sLEp0hGveHa4JL5ZauGEy9wCsbAxWSP/jZX40PivZNovr2xy0tT3IXepJJgVespTNcZT++9/vm6EmG2U/eGhak9a4GHvc7D1ZRwLeobiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=Afhm0J56; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4crR8B2lPgz49Q3N;
	Tue, 21 Oct 2025 12:00:10 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1761037210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=piJWpdhM1u4toBOe7fZrGYz+sw0Os5Sq1JWEfMVwKy0=;
	b=Afhm0J56blq6WOxEWdpqMJj8z2Bu3vxCY36jgycDJJifiEEXFaOvT4ziEK9j5aeRa4bpd6
	iwOtHdNfS21Uly7lOHFAu7wtGbq4hZHwLvNLrAh2R0geP0hxU0fZQXC+0ZEGuYg/3MeOZE
	pOeNx05/n/miyCqzGlvlzMecKdXQKsEp0O4zVO0qOxw5V5lJq95qciOdL281eNEShV8lA2
	HlRUQz/MQZ+DaUdaSwsaqxtllZd5h3SicPQj1LJUIPxyZsvayrgLyUF07fXxW7DHD4PBE/
	Gy0bpvrtlp5zVwVKiZV2YCoaAZ23gBQubpTk6qdsqfv5IDc8bBAx+bPQgntpTQ==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1761037210; a=rsa-sha256;
	cv=none;
	b=Q/ghmEWI+UT6uAQO1tR5PJpcRSmhr2P9Y9QxiR839K7B1mOn26QxpsdmEAWxc7th1/JRHv
	b316LtxhN/snPuT0ZsPBaMI8Phateb1fGXjQcqouk0kTR288s/WWGWjvgBjE6UmECNgy4S
	ZY63vuG2sjiOcMai9wT6GdyD4uG1Wpz/NJsNpepbzPU9dVAZBgPdL8Zg6XVIbNjcyesP7T
	51KuF6eHgRbXrbIX+zIE407rbiffqcd0z8oMqcN7XVvRYsHT0uQ8gy6BWOkvSyyq7EeTHl
	gNGU5r21zEAwjWqtBrNoRiovuhGYOVsrXoYxc80Ant6fFrjaPGjnB2jsd8r4TA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1761037210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=piJWpdhM1u4toBOe7fZrGYz+sw0Os5Sq1JWEfMVwKy0=;
	b=l0Wor7q9EfhpGTe/atzTtxJ79Kxu2o78QPbmol2nlUdweNm7uiNMs8uadSsPzDe7HpsKbr
	Bddabdu7Mc9ga7vCiyC0YA9fuq9Vl+w7XANi107iBLDhDfdV6dzkOGVhDQqLWqFosrIRk0
	kLWIYFycNu7jCMhuN5zHgrd+ztTCqlLkamgW/LSUqmrFqvMzGixi9SSvwl1bALY14uQ2hj
	0ndmPZ1j8cPpvZe2S0Dedugb3FcGfE0UP6d/nzkxw7SBtyLQc6P/o5m44JC17lRp8BdF15
	iwDof96I17ZCfyxMnOBIUbitfD21n41NEjF8DKR0RmGdoVXIVOm2Q4+bHhd85A==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 266D7634C50;
	Tue, 21 Oct 2025 12:00:10 +0300 (EEST)
Date: Tue, 21 Oct 2025 12:00:09 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:OMNIVISION OV2680 SENSOR DRIVER" <linux-media@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] media: dt-bindings: ovti,ov2680: Use
 unevaluatedProperties for endpoint
Message-ID: <aPdLmWM8a_ikhJfK@valkosipuli.retiisi.eu>
References: <20250827194919.82725-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827194919.82725-1-Frank.Li@nxp.com>

Hi Frank,

On Wed, Aug 27, 2025 at 03:49:18PM -0400, Frank Li wrote:
> The endpoint ref to /schemas/media/video-interfaces.yaml#, so replace
> additionalProperties with unevaluatedProperties to allow use common
> properties.
> 
> Fix below CHECK_DTBS warnings:
>   arch/arm/boot/dts/nxp/imx/imx7s-warp.dtb: camera@36 (ovti,ov2680): port:endpoint: 'clock-lanes', 'data-lanes' do not match any of the regexes: '^pinctrl-[0-9]+$'
> 	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov2680.yaml
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
> index 634d3b821b8c7..ec5c40684b6bd 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
> @@ -58,7 +58,7 @@ properties:
>      properties:
>        endpoint:
>          $ref: /schemas/media/video-interfaces.yaml#
> -        additionalProperties: false
> +        unevaluatedProperties: false

There are a lot more than just data-lanes in video-interfaces.yaml.

Could you instead drop data-lanes and clock-lanes from the bindings? They
are redundant.

>  
>          properties:
>            link-frequencies: true

-- 
Kind regards,

Sakari Ailus

