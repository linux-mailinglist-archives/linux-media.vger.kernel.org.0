Return-Path: <linux-media+bounces-14673-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6576E928511
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2024 11:25:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D55C2859B7
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2024 09:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C839146A77;
	Fri,  5 Jul 2024 09:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="F1vd4jDX"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF501465A2;
	Fri,  5 Jul 2024 09:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720171498; cv=none; b=tM6av3U1H99XAx7hFg774oTcYaET2g9P7E4TKYOhB6S5ITf0uyZkhpjd75PqWA/Mlb1puVNbYtdl7po5iN6h9Zk7pOyRWlrs4xf2elsMD2kN3WIRnybceNbi3cZWR8cYWLkJcjpXoaNrUPaS3oAG4XGyE5bbkYRv6qsBRSWg1hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720171498; c=relaxed/simple;
	bh=IpzYlcLyGZggZz37P8C2WpNn+1o1JR+g5xfz2xJPw88=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r1oMFzaeLOR5hLY8nN9RT7uYHksudCY9yyGBN4o834o3ZYNXxIDSOlbd5pArF6iQFgdFQ6oHFff86v2fri9xZtvJCXpt6osjhq0jclB7tAl+NPOKMdgjrHiW43y58DceNplGghH4EJ6eRw/vYanH7lya0zYv5RbdZcA+9dTMLLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=fail smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=F1vd4jDX; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1720171496; x=1751707496;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IpzYlcLyGZggZz37P8C2WpNn+1o1JR+g5xfz2xJPw88=;
  b=F1vd4jDXYRTpPz5cONQlPEqaiWLiQ2U1BpdCo9g2tw1cfmDJ1g3D7kC0
   nKexiLGCkLsTXHbpZWU0NP3kWxSb9oJq1vv8TXkXv3oL+hpX2sb91XcV1
   daHdRrgxlOEUd+Ey3p42w9Ikv2XUQFY1FuV/feqeFeCocJbrBmm5B5Akr
   4kx4RfISXmT0rTZ8LCd4VzQq7m62KTrHJPbNazal8eucyoftpmsOkx4Q4
   Q28zsXNLS2KV+aDQiiGbg9WZQ7pLuRqneVl6S9LbcsWLI5amr9E0hXUeY
   rspG2RHe2OIYLShTnHFQ4/b0CyHAlLnAqL0XOmOPeR5Uab53Xzocb3TZy
   Q==;
X-CSE-ConnectionGUID: Yn65gHikT7axoCy5KcB3PQ==
X-CSE-MsgGUID: 4/jZXMxxQ8uDQgruNOjggA==
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="asc'?scan'208";a="31512592"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Jul 2024 02:24:48 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Jul 2024 02:24:15 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 5 Jul 2024 02:24:13 -0700
Date: Fri, 5 Jul 2024 10:23:52 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Julien Stephan <jstephan@baylibre.com>
CC: Conor Dooley <conor@kernel.org>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Andy Hsieh <andy.hsieh@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Louis Kuo <louis.kuo@mediatek.com>, Phi-Bang Nguyen <pnguyen@baylibre.com>
Subject: Re: [PATCH v5 1/5] dt-bindings: media: add mediatek ISP3.0 sensor
 interface
Message-ID: <20240705-riding-overtime-642faba3dbbf@wendy>
References: <20240704-add-mtk-isp-3-0-support-v5-0-bfccccc5ec21@baylibre.com>
 <20240704-add-mtk-isp-3-0-support-v5-1-bfccccc5ec21@baylibre.com>
 <20240704-catcall-stubbly-9258b056e42e@spud>
 <CAEHHSvb6Y8g_KCmu0bK__EP2TyPhf8i-ctMNfOGdyMUUGoKQVw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PEGn/ECUutpW8XYs"
Content-Disposition: inline
In-Reply-To: <CAEHHSvb6Y8g_KCmu0bK__EP2TyPhf8i-ctMNfOGdyMUUGoKQVw@mail.gmail.com>

--PEGn/ECUutpW8XYs
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 05, 2024 at 09:50:59AM +0200, Julien Stephan wrote:
> Le jeu. 4 juil. 2024 =E0 18:27, Conor Dooley <conor@kernel.org> a =E9crit=
 :
> >
> > On Thu, Jul 04, 2024 at 03:36:40PM +0200, Julien Stephan wrote:
> > > From: Louis Kuo <louis.kuo@mediatek.com>
> > >
> > > This adds the bindings, for the mediatek ISP3.0 SENINF module embedde=
d in
> > > some Mediatek SoC, such as the mt8365
> > >
> > > Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> > > Signed-off-by: Phi-Bang Nguyen <pnguyen@baylibre.com>
> > > Link: https://lore.kernel.org/r/20230807094940.329165-2-jstephan@bayl=
ibre.com
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> >
> > I'm really confused by the link tag here. At first glance this looked
> > like you were sending out something that had been applied by Laurent,
> > given the Link, Rb and SoB from him. Why does he have a SoB on this
> > patch? What did Phi-Bang Nguyen do with this patch, and should they have
> > a Co-developed-by tag?
>=20
> I was not using b4 for the previous revisions of this series, so maybe
> I messed something up here :(

b4 am has an option to add a link to a patch you apply from the mailing
list (-l, --add-link) but you should not be using that as a contributor.
In this case, that link provides no value and is just confusing.

> About Phi-Bang, this series has been in our internal tree for a long
> time, and Phi-Bang has his SoB on it, so I kept it.
>=20
> About Laurent's tags, they were already on v4. But maybe it was an
> error ? Should I remove them?

They were also on v1. Did Laurent write part of these bindings, and
should he have a Co-developed-by?

> > > +additionalProperties: false
> > > +
> > > +if:
> > > +  properties:
> > > +    compatible:
> > > +      contains:
> > > +        const: mediatek,mt8365-seninf
> >
> > The binding supports only a single compatible, why is this complexity
> > required? I don't see other devices being added in this series.
>=20
> Right. The idea is that the number of PHYs depends on the SoC. In the
> previous revision of the series,
> the number of PHYs was not fixed, and Krzysztof asked me to fix it by
> SoC. So I wanted to make it clear
> that the number of PHYs depends on SoC but maybe I don't need that
> complexity for that?
>=20
> Is something like the following enough? And if complexity is added
> later if some other SoC are added?

Yes, that looks reasonable to me. Adding conditional stuff can be done
iff another soc re-uses the binding.

Thanks,
Conor.

>     phys:
>       minItems: 2
>       maxItems: 2
>       description:
>         phandle to the PHYs connected to CSI0/A, CSI1, CSI0B
>=20
>     phy-names:
>       description:
>         list of PHYs names
>       minItems: 2
>       maxItems: 2
>       items:
>         type: string
>         enum:
>           - csi0
>           - csi1
>           - csi0b
>       uniqueItems: true

--PEGn/ECUutpW8XYs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoe7qAAKCRB4tDGHoIJi
0odFAQCqSuKOC6xxTTtCAhTTnqB1QzwpVY7IpRWZIyMf2ypITQEAhhOyvYTb2vfL
J5TietI11/9desdP1qsxIOxlj8iUcwU=
=Oeen
-----END PGP SIGNATURE-----

--PEGn/ECUutpW8XYs--

