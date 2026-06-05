Return-Path: <linux-media+bounces-63959-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NJwLE8pHI2orngEAu9opvQ
	(envelope-from <linux-media+bounces-63959-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 00:03:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD0964B88B
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 00:03:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=FzGgOX7C;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63959-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63959-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CDAF3303EF5D
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 21:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEC763C4161;
	Fri,  5 Jun 2026 21:59:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9F719D8AC;
	Fri,  5 Jun 2026 21:59:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780696761; cv=none; b=ew+1RNtwdJNIBJaKRlDlyq0s6kVflfE1InnV86rsP2QTH/IXHTXs+SQkm3jDOD1gvYtD9v5wUqpRp89jqOIrfh9hSeexfr1XMCzXwv8aM2bmYE7k0tXtLkjGqShjHU6EuUN9rWGLKMdJo5V6iJ+H2rTmyh01ecVoDN0QRtWVtfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780696761; c=relaxed/simple;
	bh=/qPumg2Nle3zpDmRleRAgtq84tFaKpcOCbUJPuueXzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ynac9TUAhokrf4VAwu80zd/wgYB5kegDZ3TEAPxh8luJ3CK87lU/M8d/LUhLYEZ5/u5qiAAKt71WrzE+MlyTYsAMsFqZZcxvILoZ+M+DOfs0dqfRTkmvNPmclgNc1E+Rd6EpcBLcNXMtN+ByOoLZhyU/BnhRS3L2kFY1UqPl02g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FzGgOX7C; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D9B7E20EA;
	Fri,  5 Jun 2026 23:58:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780696732;
	bh=/qPumg2Nle3zpDmRleRAgtq84tFaKpcOCbUJPuueXzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FzGgOX7C31YQORfusB+iVgGAG8sjKkhBW+dswFB6T4ajhopyaSLsE9vcRjdEVceVR
	 wU3NktAOQpS77Q1KwsHw9RKaTYcy4VoPqAf0Zqd/jIxLVLvvu6wtH9d5Ov2j9j239q
	 rFXC3qpa3eKdLh+qvWuAZkiA+F+OMMJFcMf7DZmk=
Date: Sat, 6 Jun 2026 00:59:15 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
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
Message-ID: <20260605215915.GA160511@killaraus.ideasonboard.com>
References: <20260605150309.2451456-1-kieran.bingham@ideasonboard.com>
 <20260605151353.GB4350@killaraus.ideasonboard.com>
 <aiNBXzmezUX9fB6_@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aiNBXzmezUX9fB6_@valkosipuli.retiisi.eu>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-63959-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@iki.fi,m:kieran.bingham@ideasonboard.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:from_mime,ideasonboard.com:email,killaraus.ideasonboard.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BBD0964B88B

On Sat, Jun 06, 2026 at 12:36:31AM +0300, Sakari Ailus wrote:
> Hi Laurent, Kieran,
> 
> On Fri, Jun 05, 2026 at 06:13:53PM +0300, Laurent Pinchart wrote:
> > CC'ing Sakari.
> 
> Thanks for cc'ing me.
> 
> > On Fri, Jun 05, 2026 at 04:03:08PM +0100, Kieran Bingham wrote:
> > > Add a new dt-bindings/media/video-interface-devices.h header that
> > > defines macros corresponding to the orientation enumeration types from
> > > media/video-interface-devices.yaml.
> > > 
> > > This allows avoiding hardcoded constants in device tree sources.
> > > 
> > > Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> > > ---
> > >  include/dt-bindings/media/video-interface-devices.h | 13 +++++++++++++

A mention of the header in video-interface-devices.yaml would be useful,
the same way we mention video-interfaces.h in video-interfaces.yaml.
Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > >  1 file changed, 13 insertions(+)
> > >  create mode 100644 include/dt-bindings/media/video-interface-devices.h
> > > 
> > > diff --git a/include/dt-bindings/media/video-interface-devices.h b/include/dt-bindings/media/video-interface-devices.h
> > > new file mode 100644
> > > index 000000000000..d2340b457292
> > > --- /dev/null
> > > +++ b/include/dt-bindings/media/video-interface-devices.h
> > > @@ -0,0 +1,13 @@
> > > +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> > > +/*
> > > + * Copyright (C) 2026 Kieran Bingham <kieran.bingham@ideasonboard.com>
> > > + */
> > > +
> > > +#ifndef __DT_BINDINGS_MEDIA_VIDEO_INTERFACE_DEVICES_H__
> > > +#define __DT_BINDINGS_MEDIA_VIDEO_INTERFACE_DEVICES_H__
> > > +
> > > +#define MEDIA_ORIENTATION_FRONT		0
> > > +#define MEDIA_ORIENTATION_BACK		1
> > > +#define MEDIA_ORIENTATION_EXTERNAL	2
> > > +
> > > +#endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACE_DEVICES_H__ */
> 
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Regards,

Laurent Pinchart

