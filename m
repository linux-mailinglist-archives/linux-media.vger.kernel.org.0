Return-Path: <linux-media+bounces-45188-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA78BFA6A1
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 09:01:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2CEE95074D0
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 07:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3EAB2F3605;
	Wed, 22 Oct 2025 06:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="OuGmIJ8O"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09172F2909;
	Wed, 22 Oct 2025 06:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761116395; cv=pass; b=j7nwr1KzbRUxHlj14Lf8+9DRA/KsgdAA8waruROYbYD6wbnX/CfEaw7s4JMbYQtBZ0/asmIGnev5QlN+rKTnEDZYJiibTWn+Ixj9Meir4rH0tK9LcsV+D6bWerFxCh9ErOt4t+tHUYST7zkecfKMc9B8ooVPjx4R4/qNd7XoBpE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761116395; c=relaxed/simple;
	bh=RsWchHbELTivadR+0rIWFwyZFY5yk9Z2SlOJZ7YoLlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rFqrjWEPWW3WDOdjh7aF6w576biUg/8m4vyn+/2l+hMaO7/El/M0YmpMczob3BkyESwmiCWf2EHMGtIGFu+y1oXoFq8wyd+Dhj6n0X49ClBUlb9PF9mVv9K7cOoBE/UwLyszSOlMENWybiFN0WqLAAEC26+TYcOacXLtpHCHB/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=OuGmIJ8O; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4cs0Qj2FTnz49Q6J;
	Wed, 22 Oct 2025 09:59:41 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1761116381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5s9tZ0plDw04XwnJ5ZHGqexlhG4hJB0+iwmd9AJaK6w=;
	b=OuGmIJ8O0bNLXyfl/DOR87mbWDaGq8s7nrUYgaZdUNx+S2t0ROBOcgxdwOn8gD9jNLtGYm
	FhWtHLm7XvXW+zrnoGmC9O9QQxaGCnesp5vBwOUZeJmHPiZgIILHYkKjlpRmyRIotkVv0N
	ZU47G0eHkhD7Y/6iQNXWfi2Lugw2UR+bOmxqqtN1VG1bnr2/m7iLHiY5QjD2lda9a7mtXW
	xkalyMPp4MRRbpho5Ka0MGoTEt4jNzRpvZDzOXJLP4K8VgR3lGk/gpeNazM/Fy1EeyMh5e
	ImT5plat6EHVohgjDaY/juuTwc86ECUmwqr88iuizFi6foWRl5mvcYC0MsEtew==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1761116381; a=rsa-sha256;
	cv=none;
	b=AsLWqzwwpeSWK7s89tLugPc5/LYNXM8zDE5kJ7H9uLCl36VRGwO25QswhfQSsg5PejbWk4
	T5xqk7oVZj3l5vheEyvY3+S6t2VXLGTkBKXL/6iJgHyyTj01nbI5gJc+4actapHD1F/ymI
	yQvW/Wf0YJEdiNXwtOFmwg0qgBsN3wRN58NpYAkI+XfbxEx0OmHNdH+vDRUmUHCsoWQu5l
	ae9Le61iS3vSQ0tpEyyICym2lNxgD1KJGrUIQRMd6z8Rx2ZuSzwV8b/u0VosObXmF6THOS
	452ahEM1gqB9Ve6lE2tpb7hZvCUa9LJrN7v4OwXt22SePD4xZpchI+MyBv5acg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1761116381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5s9tZ0plDw04XwnJ5ZHGqexlhG4hJB0+iwmd9AJaK6w=;
	b=UrwaRpOdekIoCIzNLX/haEcKkfIGnlHb3Arz6cIjfgonkRGB13JVMsfFDiygkN1L3hTuuc
	OcOJ7TZ+MdLj/H7b45z5TopCkIiWEc2gYH+09VEigvGBOIFneWVkzJO3kltYdZfPDW2uRJ
	3JBCHc9bgaI/baCgMMGYAxYPqITTJ8S/QdBI4+lOxyuoxfKEhxcun+dEH/8EOSYODWJE4E
	tHcd487GFCiNJV73gwhU98LS7/oMCYPu98yLfTv8QStULq3tYWToZAt+gCvIBbFUmt/965
	SAGIzPBceOMRyJLKd8TYKXfhzRdjRWcgVKaSimjGvJ8ZMjTzJUbOajSm1+xgPA==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id E5D6F634C50;
	Wed, 22 Oct 2025 09:59:40 +0300 (EEST)
Date: Wed, 22 Oct 2025 09:59:40 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Frank Li <Frank.li@nxp.com>
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
Message-ID: <aPiA3G9x_RsTL9Mv@valkosipuli.retiisi.eu>
References: <20250827194919.82725-1-Frank.Li@nxp.com>
 <aPdLmWM8a_ikhJfK@valkosipuli.retiisi.eu>
 <aPepRZOL1Ys4PH/u@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPepRZOL1Ys4PH/u@lizhi-Precision-Tower-5810>

Hi Frank,

On Tue, Oct 21, 2025 at 11:39:49AM -0400, Frank Li wrote:
> On Tue, Oct 21, 2025 at 12:00:09PM +0300, Sakari Ailus wrote:
> > Hi Frank,
> >
> > On Wed, Aug 27, 2025 at 03:49:18PM -0400, Frank Li wrote:
> > > The endpoint ref to /schemas/media/video-interfaces.yaml#, so replace
> > > additionalProperties with unevaluatedProperties to allow use common
> > > properties.
> > >
> > > Fix below CHECK_DTBS warnings:
> > >   arch/arm/boot/dts/nxp/imx/imx7s-warp.dtb: camera@36 (ovti,ov2680): port:endpoint: 'clock-lanes', 'data-lanes' do not match any of the regexes: '^pinctrl-[0-9]+$'
> > > 	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov2680.yaml
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
> > > index 634d3b821b8c7..ec5c40684b6bd 100644
> > > --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
> > > +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
> > > @@ -58,7 +58,7 @@ properties:
> > >      properties:
> > >        endpoint:
> > >          $ref: /schemas/media/video-interfaces.yaml#
> > > -        additionalProperties: false
> > > +        unevaluatedProperties: false
> >
> > There are a lot more than just data-lanes in video-interfaces.yaml.
> >
> > Could you instead drop data-lanes and clock-lanes from the bindings? They
> > are redundant.
> 
> What's your means?  drop data-lanes and clock-lanes from the dts file?
> 
> The board design may use less data-lanes, why it is reduntant?

That would be no data lanes at all then. The sensor supports a single lane
only, which is why data-lanes isn't listed as a property in bindings.

-- 
Regards,

Sakari Ailus

