Return-Path: <linux-media+bounces-60499-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIa/K6J9+mmhPQMAu9opvQ
	(envelope-from <linux-media+bounces-60499-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 01:30:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3BC4D4BC6
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 01:30:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AF4BA300D4EA
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 23:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC53533893D;
	Tue,  5 May 2026 23:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EA4rmnVZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217517080D;
	Tue,  5 May 2026 23:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778023836; cv=none; b=MkTKvLfA7MRM86Gq12R+A6g3FL/5sN6v8+9wYmgkdEYPo5rFclahikbCc98Xp/O3u2RnJanvABWjGyufe0VRJ/XF8B1vbSLZ5DIck3RBqYeQ7lv381P68yPVLjJILNFSXDMv4ggkzb+zTjXNE7m6t24y59rzMhkPoN7KWLoI8q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778023836; c=relaxed/simple;
	bh=jfba1FUJr5IYEQ0/wIyPjceGv4ZgR9wAsIYNOtF4tDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ovokH872xDPoGCWgODSe4k/I8yK4GKv1RlkCKd2dh3xdumhfTecULyu33utmmwLu1zIS9e8A+K/5PVY6/+uXcTtHxBw/P9RevE4Ooq3wf+DwrApznTzFOYGlulHnnURoo3GKTNM53eeh/CLfA4I8olMAGnZVkraWN+QVDLr35QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EA4rmnVZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ABEF35B2;
	Wed,  6 May 2026 01:30:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778023830;
	bh=jfba1FUJr5IYEQ0/wIyPjceGv4ZgR9wAsIYNOtF4tDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EA4rmnVZscE4Ul946oD6gh/mNWHAuqlS5zWLRsfRW6rVg6xQJIcFeS+7jjh9PfoFu
	 706t6UImEStYrNK5m+9gK6/2G0a5WVOf9mJNOTek2l8TQ2IB7GJsCbDDqaRYgFVmq6
	 trqaigPq+Zo6oNav4wFJJj8Uf2adYcm3AtVKpvwY=
Date: Wed, 6 May 2026 02:30:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] dt-bindings: media: mt9m114: document common
 video device properties
Message-ID: <20260505233032.GH1598374@killaraus.ideasonboard.com>
References: <20260406081330.30362-1-clamor95@gmail.com>
 <20260406081330.30362-2-clamor95@gmail.com>
 <20260416214025.GG1824072@killaraus.ideasonboard.com>
 <CAPVz0n0uEsJg94GUky8cF7LNpejfpYxY9vLCY1iv5HYoxE_WeQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n0uEsJg94GUky8cF7LNpejfpYxY9vLCY1iv5HYoxE_WeQ@mail.gmail.com>
X-Rspamd-Queue-Id: AF3BC4D4BC6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60499-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,killaraus.ideasonboard.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Tue, May 05, 2026 at 08:29:30AM +0300, Svyatoslav Ryhel wrote:
> пт, 17 квіт. 2026 р. о 00:40 Laurent Pinchart пише:
> > On Mon, Apr 06, 2026 at 11:13:30AM +0300, Svyatoslav Ryhel wrote:
> > > Document common video interface device properties, such as rotation and
> > > orientation.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > > ---
> > >  .../devicetree/bindings/media/i2c/onnn,mt9m114.yaml          | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > > index e896f4db2421..2b39614f5cbf 100644
> > > --- a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > > +++ b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > > @@ -15,6 +15,9 @@ description: |-
> > >    an I2C interface and outputs image data over a 8-bit parallel or 1-lane MIPI
> > >    CSI-2 connection.
> > >
> > > +allOf:
> > > +  - $ref: /schemas/media/video-interface-devices.yaml#
> > > +
> > >  properties:
> > >    compatible:
> > >      enum:
> > > @@ -90,7 +93,7 @@ required:
> > >    - vaa-supply
> > >    - port
> > >
> > > -additionalProperties: false
> > > +unevaluatedProperties: false
> > >
> > >  examples:
> > >    - |
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
> 
> I am looping in Sakari since they are i2c media devices maintainer and
> this patch touches i2c camera binding (get_maintainer for some reason
> did not include them).
> 
> Hello Sakari, Rob!
> 
> This patch hangs in the LKML for quite a while, and if no one has any
> objections may it be applied?

This should normally go through Sakari's tree.

-- 
Regards,

Laurent Pinchart

