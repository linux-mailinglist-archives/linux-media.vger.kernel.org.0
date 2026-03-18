Return-Path: <linux-media+bounces-56226-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MFMKJTeumk3cwIAu9opvQ
	(envelope-from <linux-media+bounces-56226-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 18:19:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D582C01CA
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 18:19:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4AC34303099E
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 17:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF713343D63;
	Wed, 18 Mar 2026 17:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QnJqHirE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3703E2BCF5D;
	Wed, 18 Mar 2026 17:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773854069; cv=none; b=nEvNDUC/lB2jrLC6RfUxUaGluYk1BFannFdLojJbXBw7EVe6aUTF8+ow5Yr6LO9CP1SiFE1FYld0MtUj7DYxItv27L6irZmqJxCMQRuaaVu1dlip8DTv62x9k9ZF0TQHdQ/K3pNtUQvScKBjHyyTHR1JrSOYk76cV6jyOY1SJKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773854069; c=relaxed/simple;
	bh=2f6SY21HIHKTWALsoKhdsKNISHYJnM7rcNMIAWcMzSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OjWJooI3z2CMvVgWVkpY0KplM83gkf5H/LP0lkOS11rncUnhnFxaZ/LGyvttpmOyoHiBBdayzMyUOWd8QwLeW0DAXs1yG0dDQimIwsgGGpx563/hBO8uQuyfxWd9kz5vWcLbCMV2sMjhQJiphkdDyk9e/QCQiDybfF98HUVA7nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QnJqHirE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 30F35460;
	Wed, 18 Mar 2026 18:13:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773853993;
	bh=2f6SY21HIHKTWALsoKhdsKNISHYJnM7rcNMIAWcMzSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QnJqHirEZCbXmp7zBAabFz6fF9t4t2L5g5Ib474/Ctt94BC/xW5reLD/b1ExW+ZGB
	 7NlaIwhhqeS0H567AqsXz9u29l19lw+fhMLbfeDOpCLE41xt9B3xwjOnEDE8sBsOY/
	 c0PoZlXmY5Ilcs2u7uYs9xeoOnhMb7k0s+W/2d/U=
Date: Wed, 18 Mar 2026 19:14:24 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Martin Hecht <mhecht73@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Dongchun Zhu <dongchun.zhu@mediatek.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Todor Tomov <todor.too@gmail.com>,
	"Paul J. Murphy" <paul.j.murphy@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@gmail.com>,
	Marco Felsch <kernel@pengutronix.de>,
	Lubomir Rintel <lkundrak@v3.sk>, linux-renesas-soc@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: dt-bindings: Drop redundant endpoint
 properties
Message-ID: <20260318171424.GI633439@killaraus.ideasonboard.com>
References: <20260316134533.56941-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260316134533.56941-4-krzysztof.kozlowski@oss.qualcomm.com>
 <9ea2c5d6-8d75-43cd-9e1f-f39bf714d2e5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9ea2c5d6-8d75-43cd-9e1f-f39bf714d2e5@kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56226-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,gmail.com,kernel.org,foss.st.com,jmondi.org,ideasonboard.com,ragnatech.se,linux.intel.com,raspberrypi.com,glider.be,linaro.org,mediatek.com,bootlin.com,theobroma-systems.com,intel.com,pengutronix.de,v3.sk,vger.kernel.org,bp.renesas.com];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.958];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,ideasonboard.com:dkim,killaraus.ideasonboard.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 27D582C01CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 07:08:01PM +0100, Krzysztof Kozlowski wrote:
> On 16/03/2026 14:45, Krzysztof Kozlowski wrote:
> > The "endpoint" node references video-interfaces.yaml schema with
> > "unevaluatedProperties: false" which means that all properties from
> > referenced schema apply.  Listing some of them with ": true" is simply
> > redundant and does not make this code easier to read.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/media/marvell,mmp2-ccic.yaml        | 6 ------
> >  Documentation/devicetree/bindings/media/renesas,ceu.yaml    | 3 ---
> >  .../devicetree/bindings/media/renesas,rzg2l-cru.yaml        | 6 ------
> >  3 files changed, 15 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml b/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml
> > index de3e483f146a..a8bf06108158 100644
> > --- a/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml
> > +++ b/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml
> > @@ -35,12 +35,6 @@ properties:
> >          $ref: video-interfaces.yaml#
> >          unevaluatedProperties: false
> >  
> > -        properties:
> > -          hsync-active: true
> > -          vsync-active: true
> > -          pclk-sample: true
> > -          bus-type: true
> > -
> >    clocks:
> >      minItems: 1
> >      items:
> > diff --git a/Documentation/devicetree/bindings/media/renesas,ceu.yaml b/Documentation/devicetree/bindings/media/renesas,ceu.yaml
> > index d527fc42c3fd..5f78c77b10a3 100644
> > --- a/Documentation/devicetree/bindings/media/renesas,ceu.yaml
> > +++ b/Documentation/devicetree/bindings/media/renesas,ceu.yaml
> > @@ -43,9 +43,6 @@ properties:
> >          unevaluatedProperties: false
> >  
> >          properties:
> > -          hsync-active: true
> > -          vsync-active: true
> > -          field-even-active: false
> 
> Removed too much, this must stay.

Disabling properties not relevant for a device doesn't scale. You would
need to disable way more than that one here. The better option is to use
"additionalProperties: false" and list the allowed properties.

> 
> >            bus-width:
> >              enum: [8, 16]

-- 
Regards,

Laurent Pinchart

