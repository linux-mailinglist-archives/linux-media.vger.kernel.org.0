Return-Path: <linux-media+bounces-53757-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOkEBePeoWlcwgQAu9opvQ
	(envelope-from <linux-media+bounces-53757-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 19:13:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AC01BBD7E
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 19:13:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6C5C0305BFCC
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 18:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E7C536AB6F;
	Fri, 27 Feb 2026 18:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gTXU7wbL"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A0B35D5F8;
	Fri, 27 Feb 2026 18:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772215833; cv=none; b=CtFkrtoTT5y9ZWKVwz0LUaAsB4Q1C8xF0crhTPS4mBY7XmYKED5fdOOSj8zCI3mKkUCqfDLkkyD08meg7GkFUtJtupYD0/AUZwV/OL51ETM4H5hogwHG7SkErEpBaH+bMbFQmZ+pnynzlQA1eaQRYQxKl0r27S04bAqykI2OeSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772215833; c=relaxed/simple;
	bh=+7qcDgN76clpfkPEQ7toWJQgeAFbmTue8JQioohY3Qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NiwjIhNimym3DKzVMR+O4sR2dKxOI08TFg0fqVgn7JYhnLkc0M9a5f670dN3AZgZsPSgLZijJ92rd8dNIPqt11zFGaBpKyTH7tJIphZcI8hnToHb/jEaI/gBPg8dCimS9f7Ax+WIoPFicG+Rb49x0jlm6jr59bgbOYyDGP6pb9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gTXU7wbL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4084C116C6;
	Fri, 27 Feb 2026 18:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772215833;
	bh=+7qcDgN76clpfkPEQ7toWJQgeAFbmTue8JQioohY3Qk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gTXU7wbLlsKzNEdiWj3SBc6qFHGrf0uK0+CoKA7YF/AWIVQhoHzdelgz9eVHaxO47
	 Jxk41tU0Pdvg2vB4ha7J7PBolwFC+ZfAFpUi4Et0r5xxnxSXCxzEiu+7KSBrkJUSAk
	 0r40EzShDAgrIMFtvLEthHEzcAgtCMislSehrrOrYu+A4CXIdLs8bvFjSmK12h16PO
	 sFwu0tPOAY/jXi6XycrE3orEi864hBodGUmNRNwEzKsSqKBXAZL58Q/6BQA7UhRhXH
	 TClc0499OQWoWD8OV1K/1+Oq60ciaYxdOxLs3nE3QS7iCzOkQLU2eGRQIRJ95T5AGd
	 Wj/wTWo8XdFhw==
Date: Fri, 27 Feb 2026 18:10:27 +0000
From: Conor Dooley <conor@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, kernel@collabora.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v4 1/3] media: dt-bindings: rockchip,vdec: Add
 alternative reg-names order for RK35{76,88}
Message-ID: <20260227-wreckage-cozily-200175c6efce@spud>
References: <20260226-vdec-reg-order-rk3576-v4-0-b8d72dc75250@collabora.com>
 <20260226-vdec-reg-order-rk3576-v4-1-b8d72dc75250@collabora.com>
 <20260226-salute-threaten-a3eabb232396@spud>
 <429f3c7aa22eccffedbf8db6aa91bee3dd13814a.camel@collabora.com>
 <20260226-snide-foil-a05e1aa156a8@spud>
 <3d28c699e47f606bad46bb6447785badace37793.camel@collabora.com>
 <20260227-atonable-glamorous-920cfd832bc1@spud>
 <86f4e4ee-cf49-4ebe-8cc6-0a9763ade36a@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tog0ews7lACG9O5/"
Content-Disposition: inline
In-Reply-To: <86f4e4ee-cf49-4ebe-8cc6-0a9763ade36a@collabora.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53757-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,fdc38000:email]
X-Rspamd-Queue-Id: 80AC01BBD7E
X-Rspamd-Action: no action


--tog0ews7lACG9O5/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 07:49:33PM +0200, Cristian Ciocaltea wrote:
> On 2/27/26 7:18 PM, Conor Dooley wrote:
> > On Thu, Feb 26, 2026 at 04:56:30PM -0500, Nicolas Dufresne wrote:
> >> Le jeudi 26 f=E9vrier 2026 =E0 20:59 +0000, Conor Dooley a =E9crit :
> >>> On Thu, Feb 26, 2026 at 02:45:11PM -0500, Nicolas Dufresne wrote:
> >>>> Le jeudi 26 f=E9vrier 2026 =E0 18:43 +0000, Conor Dooley a =E9crit :
> >=20
> >>>>> Deprecating the order also makes little sense to me, given that som=
e of
> >>>>> these devices only have one reg entry, which as far as I can tell f=
rom
> >>>>> looking at the driver *is* the "function" region, so it can never be
> >>>>> entirely deprecated.
> >>>>
> >>>> What I'd like to see, is a binding expression that behave like a set=
, not a
> >>>> list, and leave the ordering open. As people keep repeating, there i=
s nothing in
> >>>> a binding that assist to define the right ordering (its not address =
or base
> >>>> addres aware). That basically means, we can't as reviewer see that o=
rdering is
> >>>> going to imposing using a base address in the unit name (which is a =
convenience,
> >>>> not a rule I suppose) that differ from the vendor documented base ad=
dress.
> >>>>
> >>>> By explicitly removing the ordering in the binding, we create a stri=
ct rule that
> >>>> driver should retrieve this by name, and never assume the ordering, =
which I
> >>>> personally like.
> >>>>
> >>>> thoughts ?
> >>>
> >>> Yeah, you can do this, but to avoid potential breaks you have to do it
> >>> from the start, not after the fact. Probably there's bindings that get
> >>> acked every day that do do this. Even the retcon is okay to do when
> >>> reg-names is mandated by the binding and the users use reg-names in my
> >>> opinion.
> >>
> >> I think from the above analyses, since the usage only starts in rc1, w=
e have
> >> room for improving it knowing we aren't creating problem for anyone. N=
ote that I
> >> have no idea what the syntax is to "do this", and I doubt either Detle=
v or
> >> Cristian have a clue.
> >=20
> > I think this is the only bit that really still needs a reply, this can
> > be solved by adding reg-names as "required" to the existing conditional
> > portion of the binding. There's probably hundreds of examples if one
> > does a search for "then:\n.*required:" to use a basis for the change
> > here. Probably should be an independent change, since it is needed even
> > without the re-order given the bug I brought up.
>=20
> As mentioned in my previous reply, the actual problem is that the binding=
 has
> been already released, and I'm not sure we can change this without breaki=
ng the
> ABI.

I feel like I am losing my mind here lol. Forget about this patch for a
moment and consider the driver right now. The code currently looks like
this:
	if (rkvdec->variant->has_single_reg_region) {
		rkvdec->regs =3D devm_platform_ioremap_resource(pdev, 0);
		if (IS_ERR(rkvdec->regs))
			return PTR_ERR(rkvdec->regs);
	} else {
		rkvdec->regs =3D devm_platform_ioremap_resource_byname(pdev, "function");
		if (IS_ERR(rkvdec->regs))
			return PTR_ERR(rkvdec->regs);

		rkvdec->link =3D devm_platform_ioremap_resource_byname(pdev, "link");
		if (IS_ERR(rkvdec->link))
			return PTR_ERR(rkvdec->link);
	}
This means you will fail to probe on any platform that does not have
has_single_reg_region set if the reg-names property is not present.
rk3588-vdec uses:
	static const struct rkvdec_variant vdpu381_variant =3D {
		.coded_fmts =3D vdpu381_coded_fmts,
		.num_coded_fmts =3D ARRAY_SIZE(vdpu381_coded_fmts),
		.rcb_sizes =3D vdpu381_rcb_sizes,
		.num_rcb_sizes =3D ARRAY_SIZE(vdpu381_rcb_sizes),
		.ops =3D &vdpu381_variant_ops,
	};
The binding does not currently require rk3588-vdec use reg-names. This
means that the driver will fail to probe if someone provides what the
binding considers to be a valid devicetree.

There are two ways to resolve this. The first is to do the following:
| diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.c
| index 967c452ab61f7..f508fc4746a87 100644
| --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
| +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
| @@ -1800,11 +1800,11 @@ static int rkvdec_probe(struct platform_device *p=
dev)
|  		if (IS_ERR(rkvdec->regs))
|  			return PTR_ERR(rkvdec->regs);
|  	} else {
| -		rkvdec->regs =3D devm_platform_ioremap_resource_byname(pdev, "function=
");
| +		rkvdec->regs =3D devm_platform_ioremap_resource(pdev, 0);
|  		if (IS_ERR(rkvdec->regs))
|  			return PTR_ERR(rkvdec->regs);
| =20
| -		rkvdec->link =3D devm_platform_ioremap_resource_byname(pdev, "link");
| +		rkvdec->link =3D devm_platform_ioremap_resource(pdev, 1);
|  		if (IS_ERR(rkvdec->link))
|  			return PTR_ERR(rkvdec->link);
|  	}

The second is to make the reg-names property mandatory.

The first way does not constitute an ABI break. The second way is an ABI
break, as you rightly point out.

Now thinking about your patch here. Without it, the following is a valid
vdec node on rk3588.
	video-codec@fdc38000 {
		compatible =3D "rockchip,rk3588-vdec";
		reg =3D <0x0 0xfdc38100 0x0 0x500>,
		      <0x0 0xfdc38000 0x0 0x100>,
		      <0x0 0xfdc38600 0x0 0x100>;
		interrupts =3D <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH 0>;
		clocks =3D <&cru ACLK_RKVDEC0>, <&cru HCLK_RKVDEC0>, <&cru CLK_RKVDEC0_CA=
>,
			 <&cru CLK_RKVDEC0_CORE>, <&cru CLK_RKVDEC0_HEVC_CA>;
		clock-names =3D "axi", "ahb", "cabac", "core", "hevc_cabac";
		assigned-clocks =3D <&cru ACLK_RKVDEC0>, <&cru CLK_RKVDEC0_CORE>,
				  <&cru CLK_RKVDEC0_CA>, <&cru CLK_RKVDEC0_HEVC_CA>;
		assigned-clock-rates =3D <800000000>, <600000000>,
				       <600000000>, <1000000000>;
		iommus =3D <&vdec0_mmu>;
		power-domains =3D <&power RK3588_PD_RKVDEC0>;
		resets =3D <&cru SRST_A_RKVDEC0>, <&cru SRST_H_RKVDEC0>, <&cru SRST_RKVDE=
C0_CA>,
			 <&cru SRST_RKVDEC0_CORE>, <&cru SRST_RKVDEC0_HEVC_CA>;
		reset-names =3D "axi", "ahb", "cabac", "core", "hevc_cabac";
		sram =3D <&vdec0_sram>;
	};
Ignore the fact that this will not currently probe for a moment, assuming
we applied my diff above to the driver, and look at what will be a valid
node after your patch:
	video-codec@fdc38000 {
		compatible =3D "rockchip,rk3588-vdec";
		reg =3D <0x0 0xfdc38000 0x0 0x100>,
		      <0x0 0xfdc38100 0x0 0x500>,
		      <0x0 0xfdc38600 0x0 0x100>;
		interrupts =3D <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH 0>;
		clocks =3D <&cru ACLK_RKVDEC0>, <&cru HCLK_RKVDEC0>, <&cru CLK_RKVDEC0_CA=
>,
			 <&cru CLK_RKVDEC0_CORE>, <&cru CLK_RKVDEC0_HEVC_CA>;
		clock-names =3D "axi", "ahb", "cabac", "core", "hevc_cabac";
		assigned-clocks =3D <&cru ACLK_RKVDEC0>, <&cru CLK_RKVDEC0_CORE>,
				  <&cru CLK_RKVDEC0_CA>, <&cru CLK_RKVDEC0_HEVC_CA>;
		assigned-clock-rates =3D <800000000>, <600000000>,
				       <600000000>, <1000000000>;
		iommus =3D <&vdec0_mmu>;
		power-domains =3D <&power RK3588_PD_RKVDEC0>;
		resets =3D <&cru SRST_A_RKVDEC0>, <&cru SRST_H_RKVDEC0>, <&cru SRST_RKVDE=
C0_CA>,
			 <&cru SRST_RKVDEC0_CORE>, <&cru SRST_RKVDEC0_HEVC_CA>;
		reset-names =3D "axi", "ahb", "cabac", "core", "hevc_cabac";
		sram =3D <&vdec0_sram>;
	};
Driver is going to break here, cos it will pick up the link region and
set rkvdec->regs to it!

So, the only way to accommodate the deprecated scheme and the new scheme
is to use the reg-names property (as the driver currently does).

So yes, while what I propose is an ABI break, the driver currently
expects reg-names to be mandatory for the rk3588-vdec. Additionally, new
required properties are only really a meaningful ABI break if the driver
is changed to required them, since that would render old devicetrees
non-functional. The driver in question already requires them, so that's
pretty moot! Were it not for your patch here, I would say that my diff
should be applied to the driver instead of making the property required.

reg-names is a dependency for your ABI-annihilation, as my example above
demonstrates, so I find it really bemusing that you're worried about its
impact!

Hopefully I've made my point about reg-names being mandatory this time
around?

Cheers,
Conor.

--tog0ews7lACG9O5/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaHeEwAKCRB4tDGHoIJi
0h+NAP4wvw68BaqcFHVHj48rD2Vnv9LSwbppWEC2vOaFAP95HAEA5WPKJx6VQARw
oqJ6yXzhKxmRsV9FyXNxhTx5TORXhw4=
=FGCk
-----END PGP SIGNATURE-----

--tog0ews7lACG9O5/--

