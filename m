Return-Path: <linux-media+bounces-4181-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AA583C486
	for <lists+linux-media@lfdr.de>; Thu, 25 Jan 2024 15:17:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 857601C23E4C
	for <lists+linux-media@lfdr.de>; Thu, 25 Jan 2024 14:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F220D633F4;
	Thu, 25 Jan 2024 14:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="IWQFHSBP"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2110.outbound.protection.outlook.com [40.107.114.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9192D627;
	Thu, 25 Jan 2024 14:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706192232; cv=fail; b=I8+Q726Ap0OKbtlNhXTlCRbG7ui56sASq7AAqD2HeN8qGKZqlOsYZ0ecK88pQburMX8jTiAOLV6hWYIfe8NPx+3rnFZLAk4aq2cmKnRp9SZoXJxsUale0HKC8prSr5HcRUU1utCOMgYdbDlL04oNZkHDJyzNz0u6PvsEGPpPjdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706192232; c=relaxed/simple;
	bh=Ho8gQddjRg7r5ziODxCObWcRMMETC7SqmtFc5mUpV9M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dlhQiF8xDOUVeiBMOXZ4a0enFXucI5xhZNu+tadksullPlIt1hROqlTgBjYlLIB8IRiwJhtASQCL71pLlqPBU3I80Dqyw+h5Jn6dREi+bh6Pwy+CUM+KQAHaJBWbZwcEuETpE4KahNeyQanOgDZ/KCtgpPywGEoktCmATeu30+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=IWQFHSBP; arc=fail smtp.client-ip=40.107.114.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e3neBkSuuTScodnxI7qZkG1OP3sYHhPsjzddSm+HJ3skOIHnVkg30CPDoigm6ypzMGLPydYYJq/MgsAHUlWy4h/ljSbYLVEEHl+rFTFMa8TO27RvSH/cV04dCRkCLm85s0/EWg1kG0BeQiDzAg1S7nxGJ6PgjcldxEW6RNxCuSfMJJmu6T3y9MXmXwsbHSLx1s536jz6Wn3tkw/sRaas4x1Zs5qrKzxKDxACpeB2OEmq0gVaIRSPidptzjp1QVq9oJxex+F96Q2GAbS76+GN+dtD5kszZXExXlBwkK3zFVTzUSMfF+0BM4LWiLDnIlaVT6rW5bDQ5xnycMxRdyaBYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QY/4f90g55YcGfeQkbdqGLUD3W0Hdg/mysn+6IZKSuw=;
 b=U31QJOIQ0jINOuoYxwN/Z3sl4MNpVh+6YGNvVvLOw529aP57qKR+gcl6m2yY8HgcjJqZ/ONVEKWDXdOlkvKZZl4/86vYeRCUhZ3tInrKRwmgBzyld6+03owTtBCQZhc4HCij3XO9004b44UTu49VMiI9QT9QNcAjJqGcx0O6lm/t+fszTqsIC+kSEFj7pmINqsFqsoksXnbC5Vp57eltN/pWkX/+snsHh/egY+mtd7GkjAjLsmvsrDvkruAP4qF72y5VtFXSbyrjNXaZiid0Oqr45GwempyyBGAGfzmkCE2lDdnPdpl6o+ZY/H4usD6lo1kHVrFySHSo5h3+8/IYew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QY/4f90g55YcGfeQkbdqGLUD3W0Hdg/mysn+6IZKSuw=;
 b=IWQFHSBPOKwW2sh39JLAOLrB4L6kpiKTWHH7EGmKufAm3OetOsl072xJNHm9ZChJ62JN5QZUTg/LOysXTZej2vJUCtJ3lyM44hH7UsqwFsPSp5ksYz5BveU3Ew8wvt5UfrWToU3wziwEQhmuXcZh5DaRRIL23UpMXxWxCRpPJVg=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYCPR01MB9877.jpnprd01.prod.outlook.com
 (2603:1096:400:20f::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Thu, 25 Jan
 2024 14:17:05 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78%5]) with mapi id 15.20.7249.013; Thu, 25 Jan 2024
 14:17:05 +0000
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
Subject: RE: [PATCH 1/5] media: dt-bindings: renesas,rzg2l-csi2: Document
 Renesas RZ/G2UL CSI-2 block
Thread-Topic: [PATCH 1/5] media: dt-bindings: renesas,rzg2l-csi2: Document
 Renesas RZ/G2UL CSI-2 block
Thread-Index: AQHaTfYjtASPYwiQLk6t8lgz1jelFLDpP2yAgAFVsaA=
Date: Thu, 25 Jan 2024 14:17:05 +0000
Message-ID:
 <TYCPR01MB11269296E09CC1FB4BC59A42C867A2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240123121720.294753-1-biju.das.jz@bp.renesas.com>
 <20240123121720.294753-2-biju.das.jz@bp.renesas.com>
 <20240124-financial-unfiled-2a5485fea2d4@spud>
In-Reply-To: <20240124-financial-unfiled-2a5485fea2d4@spud>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYCPR01MB9877:EE_
x-ms-office365-filtering-correlation-id: 65034d6a-d7bf-4ec7-8b0b-08dc1db04eaf
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 aHtGHcnkbUSJedivLRlBy5ZEu0jj3gZZlbsEwQV4oPa5giL2eifmSM2whZYLgN+5LuMsTu97xrAGAgnBwhdi53l2Ch3NENmAW96CXuthNi2AOB6pnTcrp/6+pOsBgGlzaSljN9WKKuEenqvvq4onERQJp36ByDP7snyzxcSpqMr1cpe9BrfQTmH9NpPQnWq7eDx0yTjRdg0ua+STRANH+qGcq2w/WJM89nxeWXIWg6kHKVfFLaImQRwxXGYgg4867Xjf4SWksuzW0Gu6FUtlTbVOUNyd43BA+G/H8jv+X5pCDL4OPCdZXQy/4oUBFTNdI5TQIECPK79U4AiKmSUE6TkGvk3ybjuB2ZtD3Wnkjnedc0mWkT9zgafO1OvRsk0TJMpDQ8P8DNVHFsAC9EgLzw0WRE7QDv9IJzD1iigDtC+IwaVy1f7+FHmEDccE82dZoYGWTb6M0kISPW5mIwwGb4f/m46H1MD9vGJWzC/7IRJcN0ZIiZ3OqLtOoMKrgJ5i5C0iQdqrYG9NIxSjUhC6auIrAKoKy4TjL8/rgq2psaCYvfAxedExlFODw6HeYAedJ0tbERGiAfNCzx3LnPx/hkgz5b+1nfPDPUnY/FrZtqT8n4EQTzsLMybDVnkok/1l
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(39860400002)(376002)(366004)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(38100700002)(86362001)(478600001)(38070700009)(66476007)(71200400001)(26005)(55016003)(9686003)(6506007)(66556008)(6916009)(316002)(54906003)(8676002)(8936002)(4326008)(52536014)(76116006)(66946007)(66446008)(64756008)(2906002)(33656002)(5660300002)(53546011)(7416002)(41300700001)(122000001)(83380400001)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?m+UplMW9nqAw3Z9VZdhEYruNQpZM7AqweugEGVslccc6BX4XKwfHRFotvlt1?=
 =?us-ascii?Q?bMQRETbgf8vnibNxT0ly4kAT+0gjYrpaMZUEotZiqP3h8mhMAeCpL48R/Za7?=
 =?us-ascii?Q?b/3i9f1imEebTvlEOAcwjnTGeJ3N9YFnsIkbH5NCVSSwSxQPCgBH2f8+7CLL?=
 =?us-ascii?Q?0hW7ejTxZMB9ypX2pt/NTfxSQCVgAXaXjbwsZjvvrOnmt4hzQAAFDcx95JZE?=
 =?us-ascii?Q?Bd07l2N88kOKjd7G0FU6uMd98HeogVvD11le8pStjODWUPjsZLkjA+GZAcjj?=
 =?us-ascii?Q?hMB17k4U7pUHyClYXA47CZSdheC5diGStNkQcdR9ZQLHjPEkdXgnDFRSl7JJ?=
 =?us-ascii?Q?K+lDueLzkqYSZTPBiBAM5iNlwO6j8oQod7we8Oej2GJbJYipQIKdeZz3gWSE?=
 =?us-ascii?Q?uUzNCWtLS+we+K0r+Zfdu7ToJyCV0CSe9yL51NFRrh/HgI55Ky71v6PH9GL7?=
 =?us-ascii?Q?fTalOriQkR4MfK0qRJA9JJ+haatAdD4y7WJnV58dPVsDc4hk8CO3iZHTufS5?=
 =?us-ascii?Q?SHeMaE2CxeXIXuh0B8k4Evi6ijC4D1VXQCJTZfYPtoCEU35SmZNEEzxy1R5f?=
 =?us-ascii?Q?14yz8IvD9qOlarxN9i9MVqyHXHniLIZdo5RjmBDyX6vkd7jPs7HQg70C5gq7?=
 =?us-ascii?Q?qZBtf9gY88QY52Fiue8lKZNqhOG3jHzv/xMZpr2g/d8BPrxdlpa7QcIvHfTR?=
 =?us-ascii?Q?djM+8PqbIOp9oOlyY6WSMb1al4YftgfNYcChBTiFKFOoraInbqgI4XxkZYAs?=
 =?us-ascii?Q?uqD8fb2EoGMr+DTJhCnhTY3MHERdQaKaaiS7vl3dcYdEXF4hyAUX/x5+1wtw?=
 =?us-ascii?Q?/p/cDDDVQvAQoSsHQRlhZumJYTKMBGKCCZoTwXinoHAI/az1oLTWuekrJrTC?=
 =?us-ascii?Q?o5OtMP5HnStUO+tKMKFXrx0MC0DKe16QPXM87djyRaqy3eUWwg74fmtiGHqw?=
 =?us-ascii?Q?K7UsJ1u+KsDsuAu2IRF10jhkS10RgW8XO3kuHbVr4MqDeuKxxCk04MPimFXA?=
 =?us-ascii?Q?gbIMyw4Q9pEboQNIgPVASin+/56HnHhioGPAGC7U2wxCQSROAZ1N2NwwUb1y?=
 =?us-ascii?Q?trG8P1ZxCAL2u8EAeKrSLrg5DlTAyejym5hMp3aVQIpzwSkW2VLGFE7MVunJ?=
 =?us-ascii?Q?Uo4MXDk7r7Ucm48PpcUd+NNyXl2dINISTJmLpRPP04kXKzONLS6xoTwQM7gL?=
 =?us-ascii?Q?a3jupqizFmwg211C7GzDbhSbTR4lpJI+2R1Pa8ihOvXy9a9zKxGkAozpqYAs?=
 =?us-ascii?Q?AoFPN/YFTyJ5q2oXEe+eYRJMYtIuqsJtEv/clMynJS/lnLB90Kgy5nWJGcJz?=
 =?us-ascii?Q?NIMoIZmGqyxNKvoKew0LFm6kLOrCDFuxzICQ4xX59Vogu2RPhjINo3Lg2nQY?=
 =?us-ascii?Q?o6JZ3mdiYB0Jlq2QKQ7kpoDDS47i9kjW2ppaWkNat3+7/Xy0nNWagX6q1xxR?=
 =?us-ascii?Q?Tc7zNrhw9PnS77FlWQuPY4yaAO4OS2S2s9qlpG5PYZfgonStPqkp11srEZoH?=
 =?us-ascii?Q?n+h6TqmoFJkJuzWZN5AOPA5Ly//aRFdbY82K0FUF1HJhNgKUR7md6s/p0YGc?=
 =?us-ascii?Q?jxxKh8RzAxFzZa//kziwX2t5gIig/0W1L798OBuaWudnulzbvNDjSvjHMGbU?=
 =?us-ascii?Q?HA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 65034d6a-d7bf-4ec7-8b0b-08dc1db04eaf
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2024 14:17:05.0856
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AFiCbuGFUgWANdQRtZ/4mR0Z9CWQZVJNlXblBD6fT3D+lsXeufoj/V32zuVGVeUmcY+mmZtHUDDwFcQcO/HG0qs2n5UotyN7vH4Oz3ZjzKY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9877

Hi Conor Dooley,

Thanks for the feedback.

> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: Wednesday, January 24, 2024 5:49 PM
> Subject: Re: [PATCH 1/5] media: dt-bindings: renesas,rzg2l-csi2: Document
> Renesas RZ/G2UL CSI-2 block
>=20
> On Tue, Jan 23, 2024 at 12:17:16PM +0000, Biju Das wrote:
> > Document the CSI-2 block which is part of CRU found in Renesas RZ/G2UL
> > SoC.
> >
> > The CSI-2 block on the RZ/G2UL SoC is identical to one found on the
> > RZ/G2L SoC.
> >
>=20
> > No driver changes are required as generic compatible string
> > "renesas,rzg2l-csi2" will be used as a fallback on RZ/G2UL SoC.
>=20
> Not super relevant to the bindings commit tbh.

I agree driver doesn't have anything to do with bindings other than using
the fallback compatible. From bindings anyway one can get fallback
compatible details for a device. So strictly speaking it is not required.
I will remove this in next version, if there is no objection.

Cheers,
Biju

>=20
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Cheers,
> Conor.
>=20
> > ---
> >  Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> > b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> > index 67eea2ac1d22..7faa12fecd5b 100644
> > --- a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> > +++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> > @@ -19,6 +19,7 @@ properties:
> >    compatible:
> >      items:
> >        - enum:
> > +          - renesas,r9a07g043-csi2       # RZ/G2UL
> >            - renesas,r9a07g044-csi2       # RZ/G2{L,LC}
> >            - renesas,r9a07g054-csi2       # RZ/V2L
> >        - const: renesas,rzg2l-csi2
> > --
> > 2.25.1
> >

