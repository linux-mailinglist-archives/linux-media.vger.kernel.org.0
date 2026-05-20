Return-Path: <linux-media+bounces-62347-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOa/KN4WDmpT6AUAu9opvQ
	(envelope-from <linux-media+bounces-62347-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 22:17:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41224599673
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 22:17:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4DC8C34CBB23
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 17:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA9893D75A0;
	Wed, 20 May 2026 17:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IQ5JZ0MQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D327135AC18;
	Wed, 20 May 2026 17:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779297584; cv=none; b=PjBEnuJbLyS2hdFojiCqmg/huWF10R9GxiKAXbvb/ha976C0y4543LE5P20PfEL7C23vFcJ1CthO7xLJWrGval67bj1lYRPCqPSDSovT7uVFsk1TrD2oI/eEAX+bwNbjd6iomkUP498aLxPYYBHVs9Zo4JXZJR2/oWlDTri6O8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779297584; c=relaxed/simple;
	bh=YGUOvZisXTQXeFd+HUnwWWyKzPimkENrKtF68voXF88=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=HF0R6Y2OrTjFeRsfZrPqMEvnkKukZFGn1RnQlZZ5NntR1s7SlhnzX6E1czKNKjwwtilgEN3IqyLWzUg1URoEJ2kX9CdhnS7co1auPJ2wSS5/jo2gYUi4OfBZoOHhegZ0jnMfaKqLGa2vaKhJRTwCgToeVZfRemmgnQPkAh50YsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IQ5JZ0MQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2a01:cb1d:8f2:800:ad48:920a:da6f:a034])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 846D9268;
	Wed, 20 May 2026 19:19:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779297567;
	bh=YGUOvZisXTQXeFd+HUnwWWyKzPimkENrKtF68voXF88=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=IQ5JZ0MQgtZNHiHrlJcNfPxrajzPaKnzlOnIgItUJ1f4X88md6Nhb1cF60RZGkT6U
	 NhYw5Z2/brO9GE5k42yCgSzw/D6V889Gjpnfn9rJtjeTZvS6Sg9WkATyjIy5XeVWin
	 nU1CQaD4UoN4q23uWcaesbWv2jMw4SztfQ9JvsLg=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260520-crusher-species-cf707a9a8b46@spud>
References: <20260520-imx678-v3-0-8b5f9676486e@ideasonboard.com> <20260520-imx678-v3-1-8b5f9676486e@ideasonboard.com> <20260520-crusher-species-cf707a9a8b46@spud>
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: Add Sony IMX678
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Lachlan Michael <Lachlan.Michael@sony.com>, Ryuichi Tadano <Ryuichi.Tadano@sony.com>, Kengo Hayasaka <Kengo.Hayasaka@sony.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Conor Dooley <conor@kernel.org>
Date: Wed, 20 May 2026 19:19:36 +0200
Message-ID: <177929757691.2341049.18374545669142492074@selene>
User-Agent: alot/0.12.dev70+g31692a239
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62347-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,devicetree.org:url]
X-Rspamd-Queue-Id: 41224599673
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Conor,

Thank you for the review.

Quoting Conor Dooley (2026-05-20 17:56:29)
> On Wed, May 20, 2026 at 05:17:25PM +0200, Jai Luthra wrote:
> > Sony IMX678 is an 8.4 Megapixel (3856x2180) CMOS sensor, that can output
> > pixels over MIPI CSI-2 bus. Add bindings for it.
> >=20
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > ---
> > Changes in v3:
> > - Use `reset-gpios`, mentioning the sensor XCLR acts like RESETN, inste=
ad of `xclr-gpios`
> > Changes in v2:
> > - Add per-variant compatibles for mono and colour, alongside the
> >   generic fallback, so the variant can be declared without powering
> >   the sensor at probe.
> > - Rename reset GPIO to xclr as that's what it's called in the
> >   datasheet, and how it behaves
> > - Reference the generic video interface devices schema and switch to
> >   unevaluatedProperties.
> > - Drop "link-frequencies: true"
> > - Drop the T: entry for media.git from MAINTAINERS.
> > ---
> >  .../devicetree/bindings/media/i2c/sony,imx678.yaml | 129 +++++++++++++=
++++++++
> >  MAINTAINERS                                        |   6 +
> >  2 files changed, 135 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx678.ya=
ml b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
> > new file mode 100644
> > index 000000000000..d85745ddbefd
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
> > @@ -0,0 +1,129 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright (C) 2026 Ideas on Board Oy
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/sony,imx678.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sony IMX678 Sensor
> > +
> > +maintainers:
> > +  - Jai Luthra <jai.luthra@ideasonboard.com>
> > +
> > +description:
> > +  Sony IMX678 diagonal 8.86 mm (Type 1/1.8) CMOS active pixel type sol=
id-state
> > +  image sensor with a square pixel array and 8.40M (3856x2180) effecti=
ve pixels.
> > +
> > +allOf:
> > +  - $ref: /schemas/media/video-interface-devices.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - sony,imx678
> > +      - sony,imx678-aamr
> > +      - sony,imx678-aaqr
> > +    description:
> > +      The IMX678 sensor exists in a colour variant (IMX678-AAQR) and a=
 mono
> > +      variant (IMX678-AAMR). An internal register can also help detect=
 this at
> > +      runtime.
>=20
> I don't understand the compatibles here. If aaqr is tge colour variant,
> and aamr is mono, what does the suffix-less compatible represent?

Sorry, I had seen Laurent's comment on this area in v2 but forgot to update
it in this revision.

The suffix-less compatible is for the cases where a product comes in two
variants with the sensor being either mono or color. It allows sharing DT
blobs amongst the two variants, where the driver powers the sensor on and
reads the register to figure out if it is mono or color.

>=20
> Your commit message says:
> > - Add per-variant compatibles for mono and colour, alongside the
> >   generic fallback, so the variant can be declared without powering
> >   the sensor at probe.
> But that's not what you have permitted in the binding, you've described
> 3 different variants and using the one with no suffix as a fallback will
> produce validation errors.
>=20

"fallback" was a wrong choice of word, I'll update the description in v4.

> I think this probably is
> pw-bot: changes-requested
>=20
> Thanks,
> Conor.

Thanks,
    Jai

