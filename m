Return-Path: <linux-media+bounces-4182-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8925483C4C3
	for <lists+linux-media@lfdr.de>; Thu, 25 Jan 2024 15:34:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A6351F26436
	for <lists+linux-media@lfdr.de>; Thu, 25 Jan 2024 14:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C9286E2B9;
	Thu, 25 Jan 2024 14:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="G9W2mY5b"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2106.outbound.protection.outlook.com [40.107.114.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9807A6340E;
	Thu, 25 Jan 2024 14:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706193254; cv=fail; b=VVJpT201ibPvK+x6SWBxyN0Zne/XVHQaYCi0rDooYQdQAPAwA5Us5tNytiqYH5abRBv9ScvG+XTYQ3Ug2Pnsqo7pU3WMLPr6soDcXQZhyP9usMBql6Xl3Br1d3ohvP+wWYsQJEHATRXjLFc2Tmmnu0WmxauRyyrkLTL+Qlj0nUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706193254; c=relaxed/simple;
	bh=bSzC+l+XVtHTfu80XUh1r5J1GeMlpSlhYz5arluLsLc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Z1ZxEXmqR1t/PeUVVnR8sqyy7g58MeMuVPJPZciPsyMRKPrbZwxFIHmcRdnYjGDgtMdFdeg/dGPr254EFsWi2/Za6ACVQDxFxGVJZR1m6WYjpcXK+XalyHIJGHP2nKcahvsq7AkfhtWv2ylYmr1Cl2FjZf1tPCdxbSimkzZ4hzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=G9W2mY5b; arc=fail smtp.client-ip=40.107.114.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JDC7d4KIloiisRW71AogeRaQq7WBTlASgPgQwpniY+P1KPSrrQbwfLGc4KBfU6Lb17Da2HxDMpyNC80D3bwkTeIPA2VOdLbPIKpklCVIb7/3ysKys0pG35iSsJ8gK7IPaoeAUcLNCIqlWDY2uKcQP4YNAKz6b5nXoFLf4jOJp1UmB5KbdCV867fWdj1z0plagGTUCK1uJXPtb8Y6DYgT+aAtVIvSdGTWKTbTCM90DtnVYlT6I2sVyBAbGVU0M+2wxPvp8BtDI19qzj48c8JWeaKKPkgoF5d0xcz/bZzovwxhNm8yaTnfS5Kfg97oU6szo//YsUvt07iW8BS/WzbTmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LGiFtCarvij/ndM6FEG1n5M3govxtm/r/bCSEcrJ3Jo=;
 b=geM/XfDe/m20vIU4HR1puyenmYY62duUiCmB5MBNdiAeQ4SLZIzLuM3qYqJnFo5I717Zzpywg7gaHbhX1kikTkbJvynhkgogySOr/2QiCyaW9cjbw0bQp1cLy+ckX8/D9rzOjfKJm1d/TgX1KiMf+Gc1GwhmkL9GEE0Ml2IwrQm++IVmEb+dUC9qGm5TAqnilii1ccO6HiOePcyH4BnxzzdSmYGXSvVcpOkZPpNT6gMFJZiYnZLUfA1IOg8VajsFEVfvkkvVPKwVuRa56vg7Ip7oPoonz/wMdGfn+PkOMN5bBhd1w6pZCPpesxTIKrAN3Mh0XWtNTjjKrBrss9Ra/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LGiFtCarvij/ndM6FEG1n5M3govxtm/r/bCSEcrJ3Jo=;
 b=G9W2mY5bQnrIKrG7SpeNOMt8parWqRkddfcKjWrPq1BfQO3BaWkYBzyIBfnyk39wgk8yfmoCS0TJZk6fhrwOROj6Sii+L3JEJ3iZVwlA0O/FqI4Cc/dMDTjOylQaEdtDM0+kpfOX4E9EJjb9VOcymseh4Aw2mel6HRJiTaAyZzA=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYCPR01MB9716.jpnprd01.prod.outlook.com
 (2603:1096:400:221::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.12; Thu, 25 Jan
 2024 14:34:08 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78%5]) with mapi id 15.20.7249.013; Thu, 25 Jan 2024
 14:34:08 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Conor Dooley <conor@kernel.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, biju.das.au <biju.das.au@gmail.com>
Subject: RE: [PATCH 2/5] media: dt-bindings: renesas,rzg2l-cru: Document
 Renesas RZ/G2UL CRU block
Thread-Topic: [PATCH 2/5] media: dt-bindings: renesas,rzg2l-cru: Document
 Renesas RZ/G2UL CRU block
Thread-Index: AQHaTfYmdKcXEDxpDUStoR2ODm6NFLDpPx6AgAFbFtA=
Date: Thu, 25 Jan 2024 14:34:08 +0000
Message-ID:
 <TYCPR01MB1126931651C463760B95B3773867A2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240123121720.294753-1-biju.das.jz@bp.renesas.com>
 <20240123121720.294753-3-biju.das.jz@bp.renesas.com>
 <20240124-staging-handgrip-a95b44189566@spud>
In-Reply-To: <20240124-staging-handgrip-a95b44189566@spud>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYCPR01MB9716:EE_
x-ms-office365-filtering-correlation-id: ef47ed75-50a9-4af3-6685-08dc1db2b0bf
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ngP43SgOiCY2+XZ4OQ8hAVZ33OmJAsaQjj4nMQljfWwMFP/IbXwQ/XWAvz3++PFHWI53EtkHhvdxIkTxTad7/iy2VYfMppiZAhIy1idQLOoqmJXCBAIxSHCGSQyNKhO7cZGzDqjE6cmSpQpax3h509L7QzrhBmL6ZtTyNhDmZ9B04XC57yi2jZwx6urB8kFP+L4X35lO76JBZ0mPTJgw7T0YfENnJ0phMXfCHrSlB1heDFpIGPfnHjiTZ7tp6zLLg16AWdusNDEF9Rd4LRsuoSdlZMkJuPCIqyRLTecA9Sj0KG3bd6kMCb3sTiQm2wM460kQL7JshS9Ia2HJ64nkqpNJmRgNKHs1PVtBMjrHLReMsxub7ta1oH4avTuGQ5nKhJYTRAFoTCmvPDCkdYayGUFOuIU6JH2ZFycy7F0A8j5Z1C6YrW0poDTVX4SHaHRSwgjcAL6MNeHrHe7XqMiNFuVpIwZhljCEb53TzRqb47JlzBLpq+ClTTiVDQ5sPUmCqfzj/8vkwXqmhga8kkmjXlmFsqfLuvhz3YueyKFN2gM/57leGB9fizkAfAVgR+nICg4nYWdPa+A/ywfRXuuDWTHOszz0KyHGDKFQWusmQCy/s3zeqwyq8rwOlGcAaZ4Z
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(366004)(346002)(39860400002)(136003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(41300700001)(86362001)(122000001)(33656002)(38100700002)(52536014)(4326008)(316002)(66446008)(66476007)(66556008)(6916009)(5660300002)(8676002)(478600001)(8936002)(54906003)(6506007)(26005)(64756008)(2906002)(83380400001)(53546011)(7696005)(71200400001)(9686003)(76116006)(66946007)(7416002)(38070700009)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?/Tfaaq0B7uE8FWWD4QNAmPIt1qGHl2FifwIa5xlCrntAMepC+JfY5RxYKBha?=
 =?us-ascii?Q?lGQLCe0Rwg9gYhRXtHn3NgHKsCZdp2V3fVeMBxNv6N5sylLKVDjGu3oXSaXt?=
 =?us-ascii?Q?LWSkhHrMmtumbG88uwfnWhE/Tpp8HbjVfw05W6kaqdhBOoU68ArIQsJyc34k?=
 =?us-ascii?Q?lOpAZlvdolAroLS/BUxIRSDHQ+CFs8tU7pQSG9Ry2lo0YBltPT22sueBM+21?=
 =?us-ascii?Q?rLMOmHeJQX01g71IW2K093z8M1tpBcQ5v83fKcwepx7uIN+0+ynA5imF74j6?=
 =?us-ascii?Q?NgxQ3hngPat+KI5+42Rfmr9mCkb8+iJMsk/AJ+I5n+Qm9qqkgJbRSR/sEntI?=
 =?us-ascii?Q?aI98YKkSDBi6eZehU076jQs4AHIzowUZwTzYmoENx0Q0t6l3RkG6yV8QqpmM?=
 =?us-ascii?Q?kAN9p2NTkNm18/gbdR5higdqpVmyVy7ZglkUDbo/ZD/F5Y5OXMOLI5UXMYxa?=
 =?us-ascii?Q?5p2cNdBaNqydAwGIlQgypS9aHal2zcELcwuCKsut6bxaE8/zbnJ4i9dun4Hw?=
 =?us-ascii?Q?hiYaLmuMuawV7/c9BwT9/nFvU5LNx1STE7n1maB3s6Ir0dziMMAjO3Gaehv0?=
 =?us-ascii?Q?kxbG41MEFRmNE0NNVtx8xQC2jiS+XVlFdWwKRLK3rAfdsr725d+ubOEWCKNu?=
 =?us-ascii?Q?QZRMvjXrozZM54/q48MXEEJRDTTIJWiKrKRz9TOLLQbzMlvADPdvqDXQ1I/n?=
 =?us-ascii?Q?n4B0DIC2B9h3QjOjrCw4ktfDwGg14tuRfFoJffdjnF9NKhUN3obaVxZQpcku?=
 =?us-ascii?Q?tdVba0AfDjgpCAPYgIUQSVcbCKbc8e8QP4xD71ELJCxBtn+fAxzAoGXzqZq4?=
 =?us-ascii?Q?6pCYgg8nTGnNttGPZ9HT+2ZrWS9Is2HwL6U33dCRlg16i5K/PU6vJtrdKwFa?=
 =?us-ascii?Q?8NXnsArZsQ3q1P8UTFD3fgydRXcoJKbSKeiDSqHoQHmO6BQvlWzMwlN0oftC?=
 =?us-ascii?Q?kuBy4sYPfxsm7Ghdl+U2zJIKOmnUBz3IkWRWSfi0NEwwtfjsBjDi8gI1acxh?=
 =?us-ascii?Q?XOV7bCAgizwv764+n/uv4rwqA6sO4Hl+wzVeezCSXccKbRT9MhtbkCQWU4nL?=
 =?us-ascii?Q?2xYYzmiF+G0Eu9CnQ73E8cVgNQ/z2GXQZt+jR+P2Mu0E/aZeb6JrynB/VQQ1?=
 =?us-ascii?Q?1nwgd7Yv7J6fjhNJ/aXOdUB/spDgqh+udd9vSweWYJ3epQSy7a8o1Bod/Gqe?=
 =?us-ascii?Q?uimEEXUs3SPcOmy3yd7JPHdpzFZKd8Lwmirqu3XX304SEcYG18HW+ytmFlcf?=
 =?us-ascii?Q?aP0ctv0mActbeGkmpavkhUvbDyYOoK7vUULTfWRZYWwAuFYfimcCeXqNzQDk?=
 =?us-ascii?Q?XBge6JHBBEj9GS+HszMMyxRneqg0/qUqccCHEMh/7YwLk1gf56tQudplXqkn?=
 =?us-ascii?Q?Ym0k1kKtUhVjjcjtawcThBDBYOQeqUJEWdJOPBVZPKWgciNBVp57LYh2vmwW?=
 =?us-ascii?Q?exKKlwveEYHhF19uQKt3EcSZf1PEveVC8VEqXzCZKHQZliRHOKEuwG8ooRpI?=
 =?us-ascii?Q?w4gfWO3MaFn2l5CIHfGIw2y0nCLAzoCES3Oz+py16tjYiqYDbJmzKEKJRat3?=
 =?us-ascii?Q?CysoaFlEc0MM4QgtEzctMAOmg+kRXrbMzc2YD8e+JiYJXXpjtvB1IZN7V9m0?=
 =?us-ascii?Q?/g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef47ed75-50a9-4af3-6685-08dc1db2b0bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2024 14:34:08.6294
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0Tu1TpS+DidFu43zR8sNEFQ5efd51fF/Ox4mdV/NBE9ApGPph2+n1ZiGHt07+OhYzdpLXbq/Y/IojhwSLkOFGLHTbFq9wGkQbDZ5XO8fkNo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9716

Hi Conor Dooley,

Thanks for the feedback.

> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: Wednesday, January 24, 2024 5:48 PM
> Subject: Re: [PATCH 2/5] media: dt-bindings: renesas,rzg2l-cru: Document
> Renesas RZ/G2UL CRU block
>=20
> On Tue, Jan 23, 2024 at 12:17:17PM +0000, Biju Das wrote:
> > Document the CRU IP found in Renesas RZ/G2UL SoC.
> >
> > The CRU block on the RZ/G2UL SoC is identical to one found on the
> > RZ/G2L SoC, but it does not support parallel input.
> >
> > No driver changes are required as generic compatible string
> > "renesas,rzg2l-cru" will be used as a fallback on RZ/G2UL SoC.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  .../bindings/media/renesas,rzg2l-cru.yaml     | 43 +++++++++++++++++--
> >  1 file changed, 39 insertions(+), 4 deletions(-)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
> > b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
> > index 1e72b8808d24..7015a01fc1bc 100644
> > --- a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
> > +++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
> > @@ -19,6 +19,7 @@ properties:
> >    compatible:
> >      items:
> >        - enum:
> > +          - renesas,r9a07g043-cru       # RZ/G2UL
> >            - renesas,r9a07g044-cru       # RZ/G2{L,LC}
> >            - renesas,r9a07g054-cru       # RZ/V2L
> >        - const: renesas,rzg2l-cru
> > @@ -87,10 +88,6 @@ properties:
> >            Input port node, describing the Image Processing module
> connected to the
> >            CSI-2 receiver.
> >
> > -    required:
> > -      - port@0
> > -      - port@1
> > -
> >  required:
> >    - compatible
> >    - reg
> > @@ -102,6 +99,44 @@ required:
> >    - reset-names
> >    - power-domains
> >
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - renesas,r9a07g044-cru
> > +              - renesas,r9a07g054-cru
> > +    then:
> > +      properties:
> > +        ports:
> > +          properties:
> > +            port@0:
> > +              description: Parallel input
> > +            port@1:
> > +              description: CSI
> > +
> > +          required:
> > +            - port@0
> > +            - port@1
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - renesas,r9a07g043-cru
> > +    then:
> > +      properties:
> > +        ports:
> > +          properties:
> > +            port@0: false
> > +            port@1:
> > +              description: CSI-2
>=20
> The description in the existing binding says that port @ 1 is CSI-2
> already - but this patch seems to imply that it is only CSI-2 for the 43
> model. I don't know the media stuff all that well, but is the port
> actually CSI-2 on all 3 devices?

RZ/G2{L,LC} abd RZ/V2L has 2 ports one is parallel and other one is CSI
Where as RZ/G2UL has only 1 port (CSI).

As you said, it correct CSI-2 present on all 3 devices.

>=20
> If so, I would drop the description stuff from here and just use the
> if/else stuff to restrict the ports, rather than try to re-describe them.

Agreed. Will fix this in next version along with fixing commit description
for removing driver changes.

Cheers,
Biju

