Return-Path: <linux-media+bounces-67380-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D+SEIHciU2ovXwMAu9opvQ
	(envelope-from <linux-media+bounces-67380-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 07:13:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC564743EA1
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 07:13:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=PD90buyW;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67380-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67380-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18714301A1FA
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 05:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDB8F35B62F;
	Sun, 12 Jul 2026 05:13:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3743F1C01
	for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 05:13:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783833196; cv=none; b=agbuK9wwxPPEGn+nO3Wn2D34WbqTVgOiWnzLRDORHvFxsmVr7PWf4oR8DdRaek+VXE5rDhPutTlA/QkHE4Kz7cWvKG14fJ72c5aRG975oGz6e2PluGOmaVDM36mC9eLiPegKN6GzSmXcxJ1H5JEKmw+XJ5U3GF6yvRnThowy9uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783833196; c=relaxed/simple;
	bh=uqygXZPSLZQO0SRlxM+UGSn3H6OXnYQPC0oJsol+Kmc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GW/ZYu9EtsHw+WdgWd+7bunaHFK6POzHTGHd64zUWaz5SWTg3R1qlMfe0LbY0jknPdVFw1fRiyowBPFybAw+wC10Z4quWVmUXARS5/iQy1lmSy8bFcvVuGcBHs5wL07P6+zsyvBOKk3UgYN2dFIVOZSdvKnnXF3wZyxrwwCdYmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PD90buyW; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D35B61F00A3E
	for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 05:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783833194;
	bh=rLTCb96hFjM2FfPbsAHnO1f3U06p3l/uWtkaSYyB/bQ=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=PD90buyWcLDuUV/b7DNrnqmFNFfpaxzYNFbWdbGWa/ycjBz2RGTqmzrB1kW4lnWKi
	 vbvdrARrRZ5wvwGNqpQmCxI9lzaX3OTZCWtI4jjPKqJax9DvhhtlZLT+u8lXisDyRV
	 r5UOn1D/5OKv2EF3l6eY8v55pkYnBO1pgrVuwMjdfQiH4QXQUx2dieJvruUHEkZAVz
	 iasBuIp75IK10Y4ebhs/lczxIVDg/7LfIuDIfH3SDYJt6108U5rqUSruFp6JoiLVHB
	 GsLEr2IzPUFfCLKAVYfRQQV0/j1ekc8Ay9vdT0xaR7YJbNbtf/i9u1pPioplysezC6
	 mDxfrZeJyx4Qw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aeb24c0807so1695358e87.0
        for <linux-media@vger.kernel.org>; Sat, 11 Jul 2026 22:13:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoaaWseEj2xx92S2k404VcmHoUJt37kmqChtG5wpGYGs6AnAm1zKUVMDrJg1XPBaSo1Wk9D/9BDUN2YwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyItwDHTKMuMsYe7PZ6GYLqo9nhVVMiHmJCR5v5F+D2fjfhyf2a
	LP3cFl+1b4vagEB19xW1RB+72GgGMm9NYdnPLq1XHcf1VokW7EVIQGexlN8axHbtl1ObAWmWjDB
	tirGhjURLicnoLyfDEXGi4RXGvHUxx4w=
X-Received: by 2002:ac2:5284:0:b0:5ae:c636:5c with SMTP id 2adb3069b0e04-5b0236de96dmr689800e87.47.1783833193266;
 Sat, 11 Jul 2026 22:13:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702214750.3428694-1-utilityemal77@gmail.com>
 <20260702214750.3428694-2-utilityemal77@gmail.com> <20260703-versed-locust-of-agility-d76fda@quoll>
 <akgR7N1LmqEmPSLy@suesslenovo>
In-Reply-To: <akgR7N1LmqEmPSLy@suesslenovo>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 12 Jul 2026 13:13:00 +0800
X-Gmail-Original-Message-ID: <CAGb2v64dEj_M+LvCok91EuH6uq3ivutMRqU8-XUno2_ag5p+tg@mail.gmail.com>
X-Gm-Features: AUfX_mwTG0Ej3M8TCZ8CoQWahuofQ1shmnD3lKfX2hOd7HU_ITVHuXMr_RVFxTM
Message-ID: <CAGb2v64dEj_M+LvCok91EuH6uq3ivutMRqU8-XUno2_ag5p+tg@mail.gmail.com>
Subject: Re: [PATCH 1/4] media: dt-bindings: allwinner,sun4i-a10-ir: add A523 compatible
To: Justin Suess <utilityemal77@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sean Young <sean@mess.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:utilityemal77@gmail.com,m:krzk@kernel.org,m:sean@mess.org,m:mchehab@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mripard@kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:sashiko-bot@kernel.org,m:jernejskrabec@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67380-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[wens@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,mess.org,gmail.com,sholland.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[wens@kernel.org];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BC564743EA1

On Sat, Jul 4, 2026 at 3:50=E2=80=AFAM Justin Suess <utilityemal77@gmail.co=
m> wrote:
>
> On Fri, Jul 03, 2026 at 12:56:00PM +0200, Krzysztof Kozlowski wrote:
> > On Thu, Jul 02, 2026 at 05:47:47PM -0400, Justin Suess wrote:
> > > The A523 (sun55i) contains a newer revision of the sunxi CIR receiver=
.
> > > It is not backwards-compatible with the A31 programming model: the
> > > control register has a pulse capture mode field (bits [7:6]) that
> > > resets to a value which captures no pulses at all, and the sample
> > > clock divider is now selectable via SPLCFG bits [1:0] instead of
> > > being fixed at the old module clock / 64.
> > >
> > > Since a kernel driving it as an A31 CIR receives nothing, add the
> > > compatible as a standalone entry rather than under the
> > > allwinner,sun6i-a31-ir fallback.
> > >
> > > Signed-off-by: Justin Suess <utilityemal77@gmail.com>
> > > ---
> > >  .../devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml        | 1=
 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-=
a10-ir.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-i=
r.yaml
> > > index 42dfe22ad5f1..06656058ce91 100644
> > > --- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.=
yaml
> > > +++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.=
yaml
> > > @@ -19,6 +19,7 @@ properties:
> > >        - const: allwinner,sun4i-a10-ir
> > >        - const: allwinner,sun5i-a13-ir
> > >        - const: allwinner,sun6i-a31-ir
> > > +      - const: allwinner,sun55i-a523-ir
> >
> > I assume you are adding it in expected order that Allwinner is
> > following, not just randomly at the end of any list.
> >
> I did it in product generation order, is that what is expected?
> I know that the a523 series succeeded a31, so that's what I put for
> ordering.

Yes it is.

> > Also, please change all above entries to one enum, can be the same
> > commit.
> >
> No problem, I'll do that for v2.
> >
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> >
> > Best regards,
> > Krzysztof
> >

