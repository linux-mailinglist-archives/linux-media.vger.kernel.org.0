Return-Path: <linux-media+bounces-18014-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C8A971D5E
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 17:01:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45FEC280C14
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 15:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31E7D18C3B;
	Mon,  9 Sep 2024 15:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="wwOUSBgH"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010003.outbound.protection.outlook.com [52.101.229.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25863FC2;
	Mon,  9 Sep 2024 15:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725894057; cv=fail; b=sOvJLblnmtgMuLOrgDJzyKSTRu0aIiX/ya0gn7OMPAc4s/ghSsSqmvBUVPMTeBAaEQscaqJzljDX7y7LX9kizUWIBgYTOf7RGxOFJF40umv0Q3ggZHPaLlhJGH/ro4MzyHht5ISLKCLvyplFOWbx0Ubp7fOWfDKdNIdWK1bVYe4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725894057; c=relaxed/simple;
	bh=OeVcfoHDlShfe9IwU8g2RxwrfnNEXCmPHVqjMxEmyOM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nxMepGdMjhM+6c+9tz50yc/3rDp7xC89zigsefMeij8D0HPf58vZbTwobZg36xvi4uC0F8UIC/AH94t4H/aLLGl7J0LQgqPN5U4dBkZUR22fAuSKzMK7U8V5ICbUZDzLJO2hyKF4wX1XdJQTokJqo/8UGtl0TkCu8ZBHEe+yZ2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=wwOUSBgH; arc=fail smtp.client-ip=52.101.229.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sGrHT1AjTwUnzLIv6cawUhMFhhlemmS0f8NHwBkxbiNdryr5odemSVQqmF3XIDm80v75qeT+BlJ0NF15Vij7rWE92edjC3u5daRzq6+KL/A/AIuOsBiBs92ia98Hr53SJplsAQ9lnpKcEptUxW39uQrgxePgTWDeSPs+mqrhjj1JOA0/3kGim37mOZlScYPVkhwoIT3yRFlrMcUah2dqCiG8BvSlV4qjVnZzJumITWdYGKjcD4RjjeWzda/L2Q4IGJriCu7TAZu0TgWap6m3x5HXfH8W5wxE4+xMED+0tqbPbQVJgP22OgbbiYZAtvt0B5bDTUiGa+KBuGJPDNdzHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bKVgz1XkAHpyqcIDqFb2ZJMKaVcDFwM5O7WusnmkrVI=;
 b=yQtShmA+E2lzuCHlHdjF1jkmTJzrfV2zhOYQNIv7VztyrXaRr+2c3Nc2EVi75cI46XrCT5STQyI2QYw2j+MSVt64ExPBl/4fXbVNM9SLdecYgg4b0JimCot5arBCKr5zemm9NWi2GNlIqOi/UFGUS2Z9pWp+A/d17xiE2eglBJ+5J473A02RrhHxtsjwB5qAfwBVSE1uT9xhGs5YZ2QshWaYlZD5eIB8XtIurRPMtQtU63oHQV/lOiGjiKgw9fxnbkP8DnEMX8+SBDifj0SQwHISAhe2rhtExGcDDradv+rhzGenLH0GZpsRTtNzJO5M0cPk+qJeWsKLzPRmBFXNLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bKVgz1XkAHpyqcIDqFb2ZJMKaVcDFwM5O7WusnmkrVI=;
 b=wwOUSBgH2U7/HpvKuLfUYvw/OTF7RUKxfm7XSwc7UuRpxkcCXoENOhgWIBCF9JvQ/ydnvfeBQE4ULf6p7dLN+EDx2N1I4oFKl3aozjBO1A4rxYtz62PDHlqvUFo4s8ptAb8bh2Y75JorSx6p6xYBOgh9kFxNL3h8NVoGj1ce7M0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB11253.jpnprd01.prod.outlook.com (2603:1096:400:3c4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Mon, 9 Sep
 2024 15:00:50 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7939.022; Mon, 9 Sep 2024
 15:00:50 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	biju.das.au <biju.das.au@gmail.com>, Pavel Machek <pavel@denx.de>
Subject: RE: [PATCH] media: dt-bindings: renesas,rzg2l-cru: Improve
 documentation
Thread-Topic: [PATCH] media: dt-bindings: renesas,rzg2l-cru: Improve
 documentation
Thread-Index: AQHa/2PFSQG7X9WnW0mXz/i4/znslLJPi9QAgAACpVA=
Date: Mon, 9 Sep 2024 15:00:50 +0000
Message-ID:
 <TY3PR01MB113464C40BD627A1F0F54D14286992@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240905071803.8920-1-biju.das.jz@bp.renesas.com>
 <20240909143358.GA2013-robh@kernel.org>
In-Reply-To: <20240909143358.GA2013-robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB11253:EE_
x-ms-office365-filtering-correlation-id: 35dbb43b-1157-44d0-fccf-08dcd0e0319b
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?H+V7+GmfzJAcLavLxMIGPTWdp9/gZYqMOLPLjuk6OrKdpkLaOBY87yU3izWU?=
 =?us-ascii?Q?SoAd5pxJnCrMxchMJSgBBUwZKgvtHNb/QSOl9QtU9YVqsWIcO6N1cuWjJJYg?=
 =?us-ascii?Q?fMaY9aAu24r/RuFXNSBf1A/JNiEWyoTQjX9tjUuBfE9Z2shIfCTay5Y0znYU?=
 =?us-ascii?Q?GRRMkyGnwV6Pgl0iQEfNsiQXWbCa1CngCzHaZ0YS9ypW2owL9nyxP4hmoXIn?=
 =?us-ascii?Q?IUVKI/Hk5LK8sV2XGL/34qzVvCtIyQm6eMu+uWH+GM2uCSNyL/Q3QTpGxPrw?=
 =?us-ascii?Q?0ZQDXOY2KcUbZ9OF+qrGeOkSnhMeeG0g5EcXUYMdKvuW8SSy3RyNop2ZEEcA?=
 =?us-ascii?Q?+YwBbcYSIauVRUYyAIFCFjnSMYpppOW6phDEXhkoIQAURPnPluXexgW4Xst8?=
 =?us-ascii?Q?tHktD8LgqVHsQVVgBymyw+ZwzGo00fmUBooB41VqHmDjOWNj/VSbT6V0Drkf?=
 =?us-ascii?Q?e0FdFStMYf8bjmeYw0APAlMXZ1QCqr5rmAiGuMqrkVNZgtDeGKAmKzyDzAKI?=
 =?us-ascii?Q?d1WzkEImK3lKb7rwL09zznxgXJJ3reQLJM1UmmTkodvUgRFRB4UvW7mULFZp?=
 =?us-ascii?Q?XDmOwK8mi0eZQlERYyFmxzJP/SEQi8SxAEYOMPXKROEtx5Fx70frNLjWhQa5?=
 =?us-ascii?Q?Nk4zh3wZY0jkn5h1c09/qewKB1O7WYWPFYCNu0oe10ha3nnNfm5ilzdIjha2?=
 =?us-ascii?Q?0DsgspclNEDo4ERU6+uio18krGn+vKnGtP8Hldtgfgb9Bl2ZayVyEV4SqNPV?=
 =?us-ascii?Q?eGdNjDh4LK8iLOH0Mf77Qp6i3l9mgJHTo+xFtyx3D/WAUpYWUY+1heEcL6EA?=
 =?us-ascii?Q?9wy+OF1/RJdLSEFvtM/f3GalW465MXPF6ioG1ZeSqbt6ssXOVkoYxUft4t35?=
 =?us-ascii?Q?qXM9k/b0dgRtNUNN7EOq65VDxWTieql6HLBc9lIUCWfXxZNe2H6np9FFd5X0?=
 =?us-ascii?Q?eTCvYFeIwoZW5W5lfhTK7wdTLQye30fYtvFCU+zLmOQXPPwRHeXr0fu/2hB8?=
 =?us-ascii?Q?80rUeYC1PHlSulq1oyd83HqRZ/YWDuJ8KIsV6XMnrSufjcPgf6wBUAzzb7xv?=
 =?us-ascii?Q?nSZEzarWGV5Kq4iEPjjUDuhM7Kr/sfIMijkYvKPTruA4mEY0LUGUXf5kJaQn?=
 =?us-ascii?Q?z4mEZg5tackI6FqeswLWBatOHi6kydi+9EpqDJlCvIS1th0LojffhZgjADU4?=
 =?us-ascii?Q?wBdHAj71+zyaU0bIiB3ez06pDK+9TiVPWV4PtzSRf724oG0XPQV3uhRNN2BN?=
 =?us-ascii?Q?CC1dR26KuD7T22ZIcHmBC0TEgydytv8XMC0FdWVv19Zv+R9yH52g/3WF6jBR?=
 =?us-ascii?Q?f+cEu9t2ogbCY2lNXxyEvLEhw39UHskHcZqFGMJ1k0kir2eJa1k1Q7j3toxI?=
 =?us-ascii?Q?4a3UvJlIujc0I/zRUNOEtPibZGQNrU3nO7n05O/cUB+LjNzt7Q=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?pdyUDRZHZ+J+fO/QIttBeT5wYxGx+qadNDXDCu6gort6zAGU3iszG6YF6Mor?=
 =?us-ascii?Q?XGdYK3kZtMXhK+HvVQHR04jmm3myUJKWmNMVaQCv/hst0zZ8DxF3RKbN/J5P?=
 =?us-ascii?Q?2kLrxR+Wsm08kU2UuDz9Jgts2469lzUEji/I9h2UUPuFgLeoVIuNDv50K0WU?=
 =?us-ascii?Q?4O4mLcdpkEuuIWH356BRTmHZK9ubjb0iiLfn1PALuU+ky0IFZcF0v60xH6wx?=
 =?us-ascii?Q?E3FIw+Z3ljEYxy/fpniVV25hwy2h3ZVBL3qNbY4t14z9PbOdIoV8FehJkM5K?=
 =?us-ascii?Q?p6iEoKiLd5egWvn4GkVzA3Qk9c8ny1sjrHZjKsdynho9PkHa5La+DxqreIF+?=
 =?us-ascii?Q?8VM+mb9RWIH0hzmcCYKeo0RM7dN2SPztxEQljVbdYEpD3lglYYBmxnzY5gn1?=
 =?us-ascii?Q?9f9u9+JBLTyuNWA1J/dYxDm2vPFAYspUA9uRCG21Ianpu8BmCgBqewNlp9Su?=
 =?us-ascii?Q?vmgjKn8bVS70RSmoeRFDmcTV6IS7E5Y6Oj6/RukVtaJt9mlFoFscEmYAPta6?=
 =?us-ascii?Q?2zC8z2Q6YyAFQHZIONJ4ShNonSrO/xxApc7u/nOWCi3JqIUZ3c0xK5SeaPG4?=
 =?us-ascii?Q?9S9lie1H8TAqJ3JfzMjUhoBu/o4oU/muAezoYhaj+ui2oA0yqVF7WAG9M2Sl?=
 =?us-ascii?Q?a8StnaE0lFKD65wZ867q2Rbdn3YsU1eEKEsjGVcNPiQwC77AC5HmB44psHw0?=
 =?us-ascii?Q?11jAbmLsU1k35IyNVFEjAUr/UG0dCykVttizhTvX3W1AdFBX9ZClFcSvgTMK?=
 =?us-ascii?Q?U0a0xqlXUuO0+66rl6zeQ28CXEFWS2UAC7qQFymQ9gJ3TqoosCQ/4pPAwflN?=
 =?us-ascii?Q?cLjSTjCJcB1M/IXxJP5fsN8z2sCtB5c+uVC0FaRSf1BPPVPsiVgEvx/uB2e0?=
 =?us-ascii?Q?k/rOI4vBCE6TlcQa2rgq78AbcPIa9d+5z/j2HvEsJDb7NsfL30iXkSobSLtO?=
 =?us-ascii?Q?K1PCkJC2H8nLi6rwq9z8blFxiyYKUNQ8GiGprowCAVnivxzcdkV6lJFRZSru?=
 =?us-ascii?Q?bKjA+pIejPHJCcJgBErUv4c9ScKJh3RAVK6q3lJ9f4aDtzx4sMJ+I00aog6p?=
 =?us-ascii?Q?AbUcq8JNOY1H6/6UrnlhlX0SkpwGOXjj4xmR14SaKuUz6k2SxfP/OlYqxep6?=
 =?us-ascii?Q?0H/oaLUVsfM5I0eCw2rVLH0Y5Q23AsT+RiC4Qb5uO+EuiYar0nduNdoucxct?=
 =?us-ascii?Q?S1b3B4BStS35+2ISP352ZxikIQImQ9SqBSm5YymbWBvr6GxHHHmNnN5G/PUI?=
 =?us-ascii?Q?JA0oc69G4QENIJoorBjncLHz7lg0II4jfNnWeGRMy4PKGt7WeOO025TMO/Uc?=
 =?us-ascii?Q?zBd7wuLjEwBUlBX7RQneKSrJVPMBrJAAisBhnNssyBk0Bv5h3dqBbwL01FEK?=
 =?us-ascii?Q?+luEalaI16IdBOJDkzuoeMDEaXdoBggyU5q6OEaSrtRjsW1xppZZ7aOdEqjW?=
 =?us-ascii?Q?mCKAvDvMO20d4yxxSe9ELVLDaBVSR7BF3sYNaXjE5iY1/wdgY7yDKRr30GDl?=
 =?us-ascii?Q?Uv+0lJltex22Kaze+wwlGsL7aeaSYumTMFywWvm7qwAfEipyCJDQ0St+jlM2?=
 =?us-ascii?Q?kNHlkFgqEpQaueXhPk9Wu6nWBWNc8BtJqlYWZ678guynRG3vbAfii8dWyMtq?=
 =?us-ascii?Q?yA=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35dbb43b-1157-44d0-fccf-08dcd0e0319b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2024 15:00:50.2791
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VK5GBujCppR0mxUVMd/4ID4UIoXcz0R4XXt8M+jZtnVHyva7G+jABEGlM22BzlBCCahNgGZd4HCsiIbZ/VsCRiLvBu1l/0+7ez6DmV+A0L4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11253

Hi Rob,

Thanks for the feedback.

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Monday, September 9, 2024 3:34 PM
> Subject: Re: [PATCH] media: dt-bindings: renesas,rzg2l-cru: Improve docum=
entation
>=20
> On Thu, Sep 05, 2024 at 08:18:01AM +0100, Biju Das wrote:
> > Fix the documentation issues pointed by Pavel while backporting it to
> > 6.1.y-cip.
> >  - Replace 'input'->'inputs' in main description
> >  - Replace 'Main'->'main' in CRU main clock description
> >  - Replace 'Register'-> 'register' in CRU Register access clock
> >    description
> >
> > Reported-by: Pavel Machek <pavel@denx.de>
> > Closes: https://lore.kernel.org/all/ZtWJqOdRxkBkUb9y@duo.ucw.cz/
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  .../devicetree/bindings/media/renesas,rzg2l-cru.yaml        | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
> > b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
> > index bc1245127025..d3c74341febc 100644
> > --- a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
> > +++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
> > @@ -13,7 +13,7 @@ maintainers:
> >  description:
> >    The CRU image processing module is a data conversion module equipped=
 with pixel
> >    color space conversion, LUT, pixel format conversion, etc. An MIPI
> > CSI-2 input and
> > -  parallel (including ITU-R BT.656) input are provided as the image se=
nsor interface.
> > +  parallel (including ITU-R BT.656) inputs are provided as the image s=
ensor interface.
>=20
> Are there multiple parallel inputs? If not, this change is wrong. The exi=
sting text is 'a foo input
> and bar input...'. It could be changed to 'foo and bar inputs...' though.

No, it is "a foo input and bar input" this wording is in line with hardware=
 manual.
So, I will leave like as it is.

>=20
> >
> >  properties:
> >    compatible:
> > @@ -38,8 +38,8 @@ properties:
> >
> >    clocks:
> >      items:
> > -      - description: CRU Main clock
> > -      - description: CRU Register access clock
> > +      - description: CRU main clock
> > +      - description: CRU register access clock
> >        - description: CRU image transfer clock
>=20
> I'd remove "CRU" instead.

OK, will remove "CRU" from description.

Cheers,
Biju

>=20
> >
> >    clock-names:
> > --
> > 2.43.0
> >


