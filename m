Return-Path: <linux-media+bounces-63958-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /8HQE/JCI2p8mgEAu9opvQ
	(envelope-from <linux-media+bounces-63958-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 23:43:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A93E364B779
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 23:43:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iki.fi header.s=meesny header.b=DDWuc+Uw;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63958-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63958-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBBBC3037488
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 21:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD4963D333B;
	Fri,  5 Jun 2026 21:36:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B292F745D;
	Fri,  5 Jun 2026 21:36:41 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780695404; cv=pass; b=Hkz2Jq0mHQ0Or5ZNnp7r/N+YjQtiHjkqXbaIDef85dxq1Uyoyqftd1IcA5Qccl3qcdY8EzSOyeiQwoPtkhKCysk2h8yHfwPfDZV1+6IpaoFOqS6rnlaXJEguSaNSfkWB0i8z1cEzQp0Zpc2ljZTqpvyCOAa2IJRUuFa3vB0ekFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780695404; c=relaxed/simple;
	bh=svLTHubM8kTwsp+XVeVR0+myZZSUyQeQm8uzL5t1S2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OpwoVVM1dqlsKcMSzi/RxdpT+0oX3z1cotVMm0wbDlqoI79JSMrqo2q4LWvBEfyViTFLng4lEL3d2CFPhN7JB3r1LLbELA8Zc4RiEZChgd1Z5KocpWGHOJCFnGRPONy137YzVkXBkQKpHtul9X01njRQ7hpg02ZwiPfn3QkPsbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=DDWuc+Uw; arc=pass smtp.client-ip=195.140.195.201
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4gXFB80nTNzyQ4;
	Sat, 06 Jun 2026 00:36:31 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1780695392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pU0x3uSHUqkJVgJTsk55EB8SawA/d1X33Aek+VkYZ4A=;
	b=DDWuc+Uwdht9dDQTQhmRHc5NirTpZ7yE9vU/PNgq7Pzuh/fOCVwJItz++jsTaSzZJaBaZW
	Q7HLMj6lardIFdUTxjoUxlNL3wRD+btE6lDuYbAGFA9j79qrNOynldsjjS0hu07QbOVOa3
	Uu7iVL6OYIH1tmqg79Zht4pWEcww/DQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1780695392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pU0x3uSHUqkJVgJTsk55EB8SawA/d1X33Aek+VkYZ4A=;
	b=vGsVpAcmKm1qO9zuZ8jLCv1fqmKPUVriezkhllEPBZO5Jbow8rGVmviEe7LLuYYwbTGfMi
	Js6B7SDb4RfehIOphjCATcQHOsn2znsGlXK/IdQFFrTbYPyG2AzH07mxjbqKeOSe/N+4/Z
	B72+l0pZ7N6zZgEmM3/gOIm1Bnv5ZjQ=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1780695392;
	b=Hza4GXta7uZgaqVcsfxBNBoukoM3fRem+QaNwIkSXuHTrdOF0mEgG0mQrdLoSE3k/0A9B3
	FQT7Ud3dcK25M8xAr2Bkbt+CnqkMb8TUDlD5CVyZ7b2ZIx1YWr4RAr4bwC4HnEO2QPGIwe
	22XbcVhjj8bdhxXW8qCajMDfeQewI8Q=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 60F82634C50;
	Sat, 06 Jun 2026 00:36:31 +0300 (EEST)
Date: Sat, 6 Jun 2026 00:36:31 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: media: Add macros for video interface
 devices
Message-ID: <aiNBXzmezUX9fB6_@valkosipuli.retiisi.eu>
References: <20260605150309.2451456-1-kieran.bingham@ideasonboard.com>
 <20260605151353.GB4350@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605151353.GB4350@killaraus.ideasonboard.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=meesny];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-63958-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[iki.fi:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sakari.ailus@iki.fi,linux-media@vger.kernel.org];
	DMARC_NA(0.00)[iki.fi];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valkosipuli.retiisi.eu:mid,ideasonboard.com:email,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A93E364B779

Hi Laurent, Kieran,

On Fri, Jun 05, 2026 at 06:13:53PM +0300, Laurent Pinchart wrote:
> CC'ing Sakari.

Thanks for cc'ing me.

> 
> On Fri, Jun 05, 2026 at 04:03:08PM +0100, Kieran Bingham wrote:
> > Add a new dt-bindings/media/video-interface-devices.h header that
> > defines macros corresponding to the orientation enumeration types from
> > media/video-interface-devices.yaml.
> > 
> > This allows avoiding hardcoded constants in device tree sources.
> > 
> > Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> > ---
> >  include/dt-bindings/media/video-interface-devices.h | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >  create mode 100644 include/dt-bindings/media/video-interface-devices.h
> > 
> > diff --git a/include/dt-bindings/media/video-interface-devices.h b/include/dt-bindings/media/video-interface-devices.h
> > new file mode 100644
> > index 000000000000..d2340b457292
> > --- /dev/null
> > +++ b/include/dt-bindings/media/video-interface-devices.h
> > @@ -0,0 +1,13 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> > +/*
> > + * Copyright (C) 2026 Kieran Bingham <kieran.bingham@ideasonboard.com>
> > + */
> > +
> > +#ifndef __DT_BINDINGS_MEDIA_VIDEO_INTERFACE_DEVICES_H__
> > +#define __DT_BINDINGS_MEDIA_VIDEO_INTERFACE_DEVICES_H__
> > +
> > +#define MEDIA_ORIENTATION_FRONT		0
> > +#define MEDIA_ORIENTATION_BACK		1
> > +#define MEDIA_ORIENTATION_EXTERNAL	2
> > +
> > +#endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACE_DEVICES_H__ */
> 

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Kind regards,

Sakari Ailus

