Return-Path: <linux-media+bounces-60465-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Z7SIDRUd+ml3JwMAu9opvQ
	(envelope-from <linux-media+bounces-60465-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 18:38:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C49FA4D173E
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 18:38:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7FAC302BE16
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 16:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2257A48C8C1;
	Tue,  5 May 2026 16:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="h0SJf48m"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092273B0AEF;
	Tue,  5 May 2026 16:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777999038; cv=none; b=GeHNvZW2wBdY7uOJNuRlWzToI9Ufb0nI7nQakYN6rx2kD5URDKUbTbD+Vv/7yNZYhXSt4IVKYsqYp1IGExOfY/vV6dsf58uFJlMe5ySNTCu8G0qR+lNh48C54nrKxTtgsm1cEodIZrFp6e3UsGAOUEsDKF/cxxHKdldqBaJFzjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777999038; c=relaxed/simple;
	bh=gCRZ9zw9cbPqwklRu5auihnWw933qIunEKMOOegx/Ac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MYdGvNstYatQHw1sZ7CP6HQWtUjRtrz62puZJfPf4IPsqfckzvGCZfu5xklpy8BD5ACGKgbmi6ZTb6BnFP9QHOyuauDehcKbNRCv+gGN+y50VG07cQPep5+58K6hdDyCKyG3h3bOVlxQRQQ6Lecc4W9CAbjq1B5MkX3B5HlkyPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=h0SJf48m; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 79C151F8;
	Tue,  5 May 2026 18:37:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777999032;
	bh=gCRZ9zw9cbPqwklRu5auihnWw933qIunEKMOOegx/Ac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h0SJf48mno56zTRlhCl1nmzhkN+8Beb3P/DLBn+ccQ0lSHXOVOrP7Wtgav19PPcFy
	 FRPq9Qrnwh3A5/BmyNGonvXNavczmM4kFFodPAa7O9BEvDLub3yvyeJopqU0d7cSmW
	 il3FcQDlmjV3JAZNItYd4A2z1/demQuLm1TILkuI=
Date: Tue, 5 May 2026 19:37:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: linux-media@vger.kernel.org, Isaac Scott <isaac.scott@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>, devicetree@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Subject: Re: [RFC PATCH v3 1/2] dt-bindings: media: i2c: Add onsemi AR0234
 image sensor binding
Message-ID: <20260505163713.GE1547435@killaraus.ideasonboard.com>
References: <20260306103614.3208182-1-eagle.alexander923@gmail.com>
 <20260306103614.3208182-2-eagle.alexander923@gmail.com>
 <20260505101505.GB1547435@killaraus.ideasonboard.com>
 <CAP1tNvQBKWkd0e9Yr+3swhaiHvkzUV+Ewb1qLF2kEYZy78meCQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP1tNvQBKWkd0e9Yr+3swhaiHvkzUV+Ewb1qLF2kEYZy78meCQ@mail.gmail.com>
X-Rspamd-Queue-Id: C49FA4D173E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-60465-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[vger.kernel.org,ideasonboard.com,raspberrypi.com,intel.com,kernel.org,linux.intel.com,oss.qualcomm.com,linaro.org,foss.st.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[killaraus.ideasonboard.com:mid,devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim]

On Tue, May 05, 2026 at 05:09:18PM +0300, Alexander Shiyan wrote:
> > On Fri, Mar 06, 2026 at 01:36:13PM +0300, Alexander Shiyan wrote:
> > > Add devicetree binding for the onsemi AR0234 CMOS image sensor.
> > >
> > > Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> > > ---
> > >  .../bindings/media/i2c/onnn,ar0234.yaml       | 109 ++++++++++++++++++
> > >  1 file changed, 109 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
> > > new file mode 100644
> > > index 000000000000..d93fa99e6535
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
> > > @@ -0,0 +1,109 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/i2c/onnn,ar0234.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: ON Semiconductor AR0234 1/2.6-inch CMOS Digital Image Sensor
> > > +
> > > +description:
> > > +  The AR0234 is a 1/2.6-inch CMOS digital image sensor with a pixel
> > > +  array of 1940x1220 pixels, capable of 1920x1200 resolution at up
> > > +  to 120 fps. It supports MIPI CSI-2 output with 1, 2, or 4 data lanes,
> > > +  and raw Bayer (8/10-bit) or monochrome output.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: onnn,ar0234cs
> >
> > Should we define separate compatible strings for the mono and colour
> > variants ? I know you identify the variant at runtime in the driver, but
> > avoid I2C communication at boot time can be beneficial (to reduce boot
> > time, and also to avoid flashing the privacy LED on systems that have
> > one, albeit the latter is probably less applicable to the AR0234).
> 
> We could do it like this — Color: ar0234cssc, Mono: ar0234cssm.
> But the current approach is more universal...
> Could we add two compatible strings and keep the base one for auto-detection?
> For detection, it would still be good to check the identifier anyway...
> Or just add two compatible strings but detect connected variant in any case?

I see multiple use cases:

1. You know at build time that you have an AR0234CS, but the model (mono
   or colour) is only known at runtime (e.g. a product exists in mono and
   colour options, with the options being otherwise identical).

   This can be implemented with a single compatible string
   "onnn,ar0234cs" and a runtime check of the model in the driver, *or*
   with two compatible strings for the two models and a runtime check in
   the boot loader that will set the correct compatible string.

2. You know at build time what exact camera module you have, and you
   want to avoid powering the sensor up at boot time (e.g. boot time
   optimization, avoiding privacy LED flashing, ...).

   This requires two separate compatible strings for the two models.

3. You know at build time what exact camera module you have, and you
   want a runtime sanity check.

   This requires two separate compatible strings for the two models.


In order to cover all those use cases, we could use

properties:
  compatible:
    enum:
      - onnn,ar0234cssc
      - onnn,ar0234cssm
      - onnn,ar0234cs

The first two compatible strings would cover use case 1 with the boot
loader detection, use case 2, and use case 3. The last compatible string
would cover use case 1 without the boot loader detection. This is waht
the sony,imx296.yaml binding does. The sony,imx290.yaml binding, on the
other hand, has deprecated the generic compatible string.

We could also use

properties:
  compatible:
    oneOf:
      - const: onnn,ar0234cs
      - items:
          - enum:
              - onnn,ar0234cssc
              - onnn,ar0234cssm
          - const: onnn,ar0234cs

if we want a fallback compatible string, which could allow systems that
only case about use case 1 without boot loader detection to only match
on "onnn,ar0234cs" in their driver. I don't think we have any such
bindings for image sensors.

I don't think we've decided on a recommended practice.

-- 
Regards,

Laurent Pinchart

