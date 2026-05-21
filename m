Return-Path: <linux-media+bounces-62407-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPHrLze2DmrBBgYAu9opvQ
	(envelope-from <linux-media+bounces-62407-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 09:37:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 365915A036E
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 09:37:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 91FE730CE0C5
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 07:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92E0F346771;
	Thu, 21 May 2026 07:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="V0SesEAJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F39A39BFED;
	Thu, 21 May 2026 07:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779348665; cv=none; b=PogEftTAZgiUTob1lyp8+brpYyracpTRaAwUfCNA5tudBlT+4wFsmjOunxpbW2/kb38kLgbbUhx+zzRrRWtZMZiBFptR09D51QlWwo/2k7DNwm5UKCMuWalp4jZJD2aGbgANg/OWbgucGvLyyIoxpnoBSH49PACQfIhO8Y8KRl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779348665; c=relaxed/simple;
	bh=EUIAnhlGU8MnIszvjINplPMFDRzN+GGGnhbHFUGwXaA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=iVwI/XQo6/qUbb8bepe6frjWpUCu73O2NyxIUA5beB2bPl+ulwmiXeqbc1kGn3HKD6UqMgS1D4QDa1IFRXHxaP94XzLTJzlpmhI03PmTYc+WqwRa2N/Fg2oeI24PpAEJ/IdwUdPde3Ps4tNDNSR1Xh1XcBygYah/OIViG3Co7og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=V0SesEAJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2a01:cb1d:8f2:800:ad48:920a:da6f:a034])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9730563D;
	Thu, 21 May 2026 09:30:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779348645;
	bh=EUIAnhlGU8MnIszvjINplPMFDRzN+GGGnhbHFUGwXaA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=V0SesEAJ+jgzPtiGfXxR+EA6v2MnF3qkuta5FnyNumTfqMNg7iQOJpB+eEwarpm+v
	 Bq0uKwjBxPG0N0PWWOmL5mfb3SalZu60V4hTNm6bC92hYUhtaonc/q7bLAgvW8dvQ5
	 /J08T8X3yio8MvOWt314xL8WsdBNvu555F0bej2s=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260520-during-rocklike-a7436513d559@spud>
References: <20260520-imx678-v3-0-8b5f9676486e@ideasonboard.com> <20260520-imx678-v3-1-8b5f9676486e@ideasonboard.com> <20260520-crusher-species-cf707a9a8b46@spud> <177929757691.2341049.18374545669142492074@selene> <20260520-during-rocklike-a7436513d559@spud>
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: Add Sony IMX678
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Lachlan Michael <Lachlan.Michael@sony.com>, Ryuichi Tadano <Ryuichi.Tadano@sony.com>, Kengo Hayasaka <Kengo.Hayasaka@sony.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Conor Dooley <conor@kernel.org>
Date: Thu, 21 May 2026 09:30:56 +0200
Message-ID: <177934865612.2341049.12699321483523040036@selene>
User-Agent: alot/0.12.dev70+g31692a239
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62407-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 365915A036E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Quoting Conor Dooley (2026-05-21 00:04:16)
> On Wed, May 20, 2026 at 07:19:36PM +0200, Jai Luthra wrote:
> > Hi Conor,
> >=20
> > Thank you for the review.
> >=20
> > Quoting Conor Dooley (2026-05-20 17:56:29)
> > > On Wed, May 20, 2026 at 05:17:25PM +0200, Jai Luthra wrote:
> > > > Sony IMX678 is an 8.4 Megapixel (3856x2180) CMOS sensor, that can o=
utput
> > > > pixels over MIPI CSI-2 bus. Add bindings for it.
> > > >=20
> > > > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > > > ---
> > > > Changes in v3:
> > > > - Use `reset-gpios`, mentioning the sensor XCLR acts like RESETN, i=
nstead of `xclr-gpios`
> > > > Changes in v2:
> > > > - Add per-variant compatibles for mono and colour, alongside the
> > > >   generic fallback, so the variant can be declared without powering
> > > >   the sensor at probe.
> > > > - Rename reset GPIO to xclr as that's what it's called in the
> > > >   datasheet, and how it behaves
> > > > - Reference the generic video interface devices schema and switch to
> > > >   unevaluatedProperties.
> > > > - Drop "link-frequencies: true"
> > > > - Drop the T: entry for media.git from MAINTAINERS.
> > > > ---
> > > >  .../devicetree/bindings/media/i2c/sony,imx678.yaml | 129 +++++++++=
++++++++++++
> > > >  MAINTAINERS                                        |   6 +
> > > >  2 files changed, 135 insertions(+)
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx67=
8.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
> > > > new file mode 100644
> > > > index 000000000000..d85745ddbefd
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
> > > > @@ -0,0 +1,129 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +# Copyright (C) 2026 Ideas on Board Oy
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/media/i2c/sony,imx678.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Sony IMX678 Sensor
> > > > +
> > > > +maintainers:
> > > > +  - Jai Luthra <jai.luthra@ideasonboard.com>
> > > > +
> > > > +description:
> > > > +  Sony IMX678 diagonal 8.86 mm (Type 1/1.8) CMOS active pixel type=
 solid-state
> > > > +  image sensor with a square pixel array and 8.40M (3856x2180) eff=
ective pixels.
> > > > +
> > > > +allOf:
> > > > +  - $ref: /schemas/media/video-interface-devices.yaml#
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    enum:
> > > > +      - sony,imx678
> > > > +      - sony,imx678-aamr
> > > > +      - sony,imx678-aaqr
> > > > +    description:
> > > > +      The IMX678 sensor exists in a colour variant (IMX678-AAQR) a=
nd a mono
> > > > +      variant (IMX678-AAMR). An internal register can also help de=
tect this at
> > > > +      runtime.
> > >=20
> > > I don't understand the compatibles here. If aaqr is tge colour varian=
t,
> > > and aamr is mono, what does the suffix-less compatible represent?
> >=20
> > Sorry, I had seen Laurent's comment on this area in v2 but forgot to up=
date
> > it in this revision.
> >=20
> > The suffix-less compatible is for the cases where a product comes in two
> > variants with the sensor being either mono or color.
>=20
> This response is very weird. It's worded in a really generic way that
> barely seems to be a response to my mail. We aren't talking about
> "a product" here, we are specifically talking about the imx678, and we
> know it comes it these variants. There are no "cases" involved.
>=20

It's very myopic to say bindings should only care about the camera sensor
on its own and not how or where it is integrated in, which is usually a
"product".

Maybe my response won't sound "weird" (?) if you see Dave's comment on v1:
https://lore.kernel.org/all/CAPY8ntBi88-dd2HxxftErf8h5-ERRPcGy5KJ-+oF7jawNO=
JpuA@mail.gmail.com/
and Laurent's recent proposal(s) for handling this for a different sensor:
https://lore.kernel.org/linux-media/20260505163713.GE1547435@killaraus.idea=
sonboard.com/

Both of those threads have you in CC, so I assumed you were aware. That's a
higher bar for "being aware of something" than DT maintainers often have
for contributors, like Krzysztof's comment with unnecessarily snappy tone
about the reset-gpio on v2.

> > It allows sharing DT blobs amongst the two variants, where the driver
> > powers the sensor on and reads the register to figure out if it is mono
> > or color.
>=20
> To be honest, I don't really get why the driver uses the specific
> compatibles at all, if it can just determine if it is colour or mono at
> runtime. Seems to me like this should be
> compatible:
>   items:
>     - enum:
>        - imx678-aamr
>        - imx678-aaqr
>     - const: imx678

Yes, that's the other proposal. The downside being having a certainty of
the variant at integration time, and not allowing sharing binary blobs
as-is between two "products" that differ only in which of the two sensor
variants it ships with.

>=20
> Or just entirely drop the suffixed compatibles from the binding, since
> you can detect mono v colour at runtime. The justification for the
> aamr/aaqr compatibles seems to be that it avoids powering on the device
> to check, but it looks like you unconditionally power it on and check
> which variant it is, so that argument holds no water.
>=20
> > It allows sharing DT blobs amongst the two variants, where the driver
> > powers the sensor on and reads the register to figure out if it is mono
> > or color.
>=20
> Why would you want to share the dtb anyway? That makes no sense to
> me as a usecase in the first place. If the sensor isn't part of the
> board, you should be using an overlay or something similar to apply it,
> because if you can swap the sensor you can also have no sensor!
>=20
> Also doesn't your driver print a warning if you did this anyway?
>=20

I thought the bindings are for the hardware and all its potential usecases,
and not tied to a specific driver or OS? Has that changed??

The specific compatibles are useful for the potential usecase of not waking
up the sensor to save boot-time or avoiding privacy LED flash at multiple
stages of the boot process.

What we do in the linux driver today should be irrelevant to it.

--
Jai

> > > Your commit message says:
> > > > - Add per-variant compatibles for mono and colour, alongside the
> > > >   generic fallback, so the variant can be declared without powering
> > > >   the sensor at probe.
> > > But that's not what you have permitted in the binding, you've describ=
ed
> > > 3 different variants and using the one with no suffix as a fallback w=
ill
> > > produce validation errors.
> > >=20
> >=20
> > "fallback" was a wrong choice of word, I'll update the description in v=
4.
> >=20
> > > I think this probably is
> > > pw-bot: changes-requested
> > >=20
> > > Thanks,
> > > Conor.
> >=20
> > Thanks,
> >     Jai

