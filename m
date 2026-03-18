Return-Path: <linux-media+bounces-56225-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPqUFTzmumkpdAIAu9opvQ
	(envelope-from <linux-media+bounces-56225-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 18:51:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F12BE2C0ACD
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 18:51:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14F1031CE347
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 17:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D0E4346781;
	Wed, 18 Mar 2026 17:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pz9Bl2rh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D7C3321BF;
	Wed, 18 Mar 2026 17:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773853973; cv=none; b=Dl3IrisTHJAGUctlM2pkj2a3jJzvxEm61LvHkyZnsJq75t/dR3odVYFDjSiqrnZTEctvG6xzPnRStUd8Y/ef4BrmsfwUcRa2SEv/eZ736UvO0+QXQ6kGY5lo6wqONbnQM4jocBIIpMT4TOaDatbiTHE2pTtgJiqcQEkQMCODY6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773853973; c=relaxed/simple;
	bh=+soT7CgPwsST9+iURXHYHL9umDg0X2h2QIjg8vunO8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OfHMteEIPQaC5pwpuztDAbuO+ODLUv489N/Gr0j3F5l3+TUd1+P3FfwXSgh/uOIW4OzfLPjtiPTuvyz6LMbxEeP1667gl7YFIFUKvd63XF9GYa+jqj5gcNMJEjyC6pYIDkuKUuAu474YoJPIjEcltc+61COq7TNRIlkNc5hYBvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pz9Bl2rh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5238A460;
	Wed, 18 Mar 2026 18:11:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773853895;
	bh=+soT7CgPwsST9+iURXHYHL9umDg0X2h2QIjg8vunO8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pz9Bl2rhS7eXokxqUPjNjmWUUp7wHg0T1jQxnEbQJl0yhN3nJKi4xvbUVL2cFo1/i
	 lYqtqNJGEPnNeQuNTmQYnkMYyda7kVrc2FmAIxx22wzBIl46AWxJ24hrYn8xKnJwJZ
	 UK/OrXRCxCUfhjKBfnGQ6ZVBAS29IK1JA8hchtzw=
Date: Wed, 18 Mar 2026 19:12:46 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
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
Subject: Re: [PATCH 1/2] media: dt-bindings: i2c: Drop redundant endpoint
 properties
Message-ID: <20260318171246.GH633439@killaraus.ideasonboard.com>
References: <20260316134533.56941-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260316135352.GA31616@killaraus.ideasonboard.com>
 <a429887b-13f7-4ba3-9260-ddae92adfe51@oss.qualcomm.com>
 <abg7rvczKjyIA5jN@kekkonen.localdomain>
 <138cc10a-b30a-4fcc-8401-ed8ac89ac04c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <138cc10a-b30a-4fcc-8401-ed8ac89ac04c@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56225-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,kernel.org,foss.st.com,jmondi.org,ideasonboard.com,ragnatech.se,raspberrypi.com,glider.be,linaro.org,mediatek.com,bootlin.com,theobroma-systems.com,intel.com,pengutronix.de,v3.sk,vger.kernel.org,bp.renesas.com];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.959];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: F12BE2C0ACD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Krzysztof,

On Mon, Mar 16, 2026 at 07:02:41PM +0100, Krzysztof Kozlowski wrote:
> On 16/03/2026 18:19, Sakari Ailus wrote:
> > On Mon, Mar 16, 2026 at 03:42:09PM +0100, Krzysztof Kozlowski wrote:
> >> On 16/03/2026 14:53, Laurent Pinchart wrote:
> >>> On Mon, Mar 16, 2026 at 02:45:34PM +0100, Krzysztof Kozlowski wrote:
> >>>> The "endpoint" node references video-interfaces.yaml schema with
> >>>> "unevaluatedProperties: false" which means that all properties from
> >>>> referenced schema apply.  Listing some of them with ": true" is simply
> >>>> redundant and does not make this code easier to read.
> >>>
> >>> I think you know my opinion on this topic. I believe we would be better
> >>> off by turning "unevaluatedProperties: false" into
> >>> "additionalProperties: false" here, and keeping the list of applicable
> >>> properties. It brings value to device tree authors by telling which
> >>> properties are applicable to the device at hand. For instance ... (see
> >>> below)
> >>
> >> (let me trim)
> >>
> >>>> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
> >>>> index 2d7937a372a2..7a05a1eda58d 100644
> >>>> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
> >>>> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
> >>>> @@ -51,9 +51,6 @@ properties:
> >>>>          $ref: /schemas/media/video-interfaces.yaml#
> >>>>          unevaluatedProperties: false
> >>>>  
> >>>> -        properties:
> >>>> -          clock-noncontinuous: true
> >>>> -
> >>>
> >>> ... Without this, an integrator will need to dive into driver code to
> >>> know if non-continuous clock is usable for the device.
> >>
> >> I see. Our usual interpretation of common schema, expressed by @Rob in
> >> few places, that eventually all properties might be applicable. This
> >> applies especially for ABI tied to the core Linux specifics, e.g.
> >> rotation and orientation from video-interface-devices.yaml.
> >>
> >> Absolutely every sensor can be mounted rotated, therefore every binding
> >> referencing video-interface-devices should allow it, even if driver is
> >> not using it. Because basically that's the ABI we want to define for
> >> each sensor, thus each binding referencing common schema should have
> >> "unevaluatedProps: true" without listing them.

Yes, that's totally fine. I agree that properties defined in
video-interface-devices.yaml should not be listed in individual
bindings. They're generic, and all of them are applicable to each image
sensor device. That part is fine, I think we have no disagreement.

> >> Similarly touchscreen.yaml.
> >>
> >> OTOH, second option, properties which are strictly hardware, e.g. name
> >> of power supply or whether clock has or has not non-continuous mode,
> >> should be allowed only when they match the hardware. Such bindings
> >> should use "additionalProperties: false" so the hardware description is
> >> constrained/fixed/specific.
> > 
> > The patch may be technically correct but I'm afraid it won't improve the
> > bindings but rather the opposite: it removes information telling whether a
> > property is relevant for a given device.
> > 
> > I bet there are a lot of possibilities to write invalid DTS while the
> > checker says it's fine (missing data-lanes or link-frequencies, for
> > instance). That may have been the case before the patch but I'd make
> > properties a driver needs to function mandatory rather than removing them
> > from bindings altogether.
> 
> That's pretty different problem and I am not removing any mandatory
> properties. I changed absolutely nothing from functional point of view.
> 
> > It'd been on my to-do list to split the current video-interfaces.yaml into
> > several files: generic camera sensor properties, CSI-2 interface
> > properties, DVP/Bt.656 interface properties and the rest (full list
> > probably requires more thought). That way we could only include properties
> > that are relevant for the device without necessarily listing each one for
> > all bindings.
> > 
> > I'd also continue to list boolean properties relevant for devices as well
> > as other properties that are relevant for a device but not mandatory.
> 
> I don't think there is such goal and particular subsystem does not get
> exception here. What is relevant for device comes either from the
> hardware or implemented ABI, as I explained. Bindings arbitrarily
> choosing "I think this might be relevant" from some big schema with
> irrelevant pieces is not manageable and not correct.

But that's not what we're discussing. The properties you're dropping
here are not "arbitrarily" choosen as being relevant. Whether it is
possible or not to use a non-continuous clock is a hardware property,
it's not an arbitrary choice.

Your patch will not change anything when it comes to validation of DT by
tools using the schema, but it drops important information relevant to
DT writers. What I recommend instead is to switch from
"unevaluatedProperties: false" to "additionalProperties: false". Not
only will we keep the information, but it will also be enforced properly
by tools.

> The common schema should be rather entirely relevant thus making such
> arbitrary choice what could be "more relevant" not even needed.

Sakari mentioned splitting video-interfaces.yaml into multiple files,
which may help, but I don't think it will solve the problem completely.
Even with a video-interface-csi2.yaml, whether or not the clock can be
non-continuous, or if the data lines polarity can be configured, is a
hardware property.

-- 
Regards,

Laurent Pinchart

