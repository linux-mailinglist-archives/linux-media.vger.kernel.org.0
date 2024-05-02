Return-Path: <linux-media+bounces-10596-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0558B9975
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 12:51:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59AAE28ABCA
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 10:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2F4F5E091;
	Thu,  2 May 2024 10:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="AWdl9oOZ"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2053.outbound.protection.outlook.com [40.107.113.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302FC17984;
	Thu,  2 May 2024 10:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714647088; cv=fail; b=OqAbR/+/Gkyd7kVAek93x4v/aZSRFvUizgNH4wEgC3m4z6gcnZ7fGExWuUAAJgN474yynkGW0IZQqRBzKSKldYjfd2ma6doT3eVcmNd4/TYK7pJzDgjf3qrnmptaSjgRyrDnkHo3Iq3rd/nbGW+jDfWapkTserCe5STMdL7z7co=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714647088; c=relaxed/simple;
	bh=sd+LcTephAUZ0nlYkmMcznR4HacPye2i9ZBC09U/d3Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cswaCw8LRqtKLuiAP/qamEak0qGMILmz2LVcjtBKSmremxbxVkilUfa8ug9NboBNnuuicV9gjOgLUhqxuyy7tcIJZwn9DDiC3XCk0IBvZ3PW01MatQjwC9wtRMT7t2o807w4BDcZZCXI5CeNsfeQWJX+RVii2KE0nXCklxbxuas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=AWdl9oOZ; arc=fail smtp.client-ip=40.107.113.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d9kAS+yP1zjhHTbJjXGMOz71768XBChR4uCOL96NmnEcLoqf+VQvHV+JqpQ9wOH3FCJTraGXYyQCTTQxJhLTutwSJkkknWMIsR/TtF/PaC4+w7kqr1E8zFJxrqmgg78KodlLZ8reUuVLgbymi7qfizjFigOZVTX3FvBiA01DQU56ndS+swSHCvP4124P5AcLJnR7hmq2/raJVU+HPAk5DZE7CAy0NcUjqq7MOm+R91iiVhH8W89yAKgMdi+iMPta3bPo/bHQvy43BpFO/irMpnhwS28C2FOP06l31HQ0It4V3ZgAY5TyV5Jdj5TCuxLVD5l9Qp7K4BhyNAFscTOfmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJVVD/YoGncE47bwqoUeKBpvOG1CRvFZv8920epFsoc=;
 b=Oa3slpm8UMum/0/GpWGdBSXGpd95rcL/JLdyZXAEgNTq3SjBFnh3Gna6kZaz8qT+Qgld8k/WYhBgV98mX5JZ9cN7Tma5azyQjLdA6swunjFCvxvYQTLRqdP6l/g52VBORrC71GUeixEYk+vgw5UELyJJeLJFq2TJwSlGUJW5gewU2mApdm+Dtj+IQ27SzVu9DjP6Hl998Q39u9MigeArC8eLNHoD/6C13UQHfmao0YdK8ymjS7LHaCcjCzGMaspPdwUZCZPmpfljzpBy46qqPFA3CnkLTJF86/QeTuLKNzTQi6LlBV0G541h3nNdjj2zPqNvyz8Zc7wNJpi2a1QEDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJVVD/YoGncE47bwqoUeKBpvOG1CRvFZv8920epFsoc=;
 b=AWdl9oOZaC0LTixTIhX2i77978lmvxr23PNweDeWkBAhHmCntP5l4octx/6AwdE5zP+jjQhiAFC6mij1JaUyIJ3ANvaHmzKBrGSklLAq7kP+/i7nRTjW3y6GTBXj7yM8gkfMJWQRpuMkD1u04rJvViptYvQ23ZLu3hajYYqLH4w=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYCPR01MB6430.jpnprd01.prod.outlook.com (2603:1096:400:99::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.30; Thu, 2 May
 2024 10:51:22 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%5]) with mapi id 15.20.7544.029; Thu, 2 May 2024
 10:51:22 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, biju.das.au <biju.das.au@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: RE: [PATCH v3 2/2] media: dt-bindings: renesas,rzg2l-cru: Document
 Renesas RZ/G2UL CRU block
Thread-Topic: [PATCH v3 2/2] media: dt-bindings: renesas,rzg2l-cru: Document
 Renesas RZ/G2UL CRU block
Thread-Index: AQHaXokelDhLAFX23keERFMch9PldbGEQB4w
Date: Thu, 2 May 2024 10:51:22 +0000
Message-ID:
 <TYCPR01MB113324049EB71B18E63A075DF86182@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20240213142941.161217-1-biju.das.jz@bp.renesas.com>
 <20240213142941.161217-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240213142941.161217-3-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYCPR01MB6430:EE_
x-ms-office365-filtering-correlation-id: da12a4f1-d5f9-4eb1-008e-08dc6a95ce78
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|366007|7416005|376005|1800799015|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Judur8rwHXpK6uVlN9Kd1VM9/zdrvsarGtjlJ751+Okt4pYMvReqXSKW8Z42?=
 =?us-ascii?Q?DXaulidT9fL3BsemSi6T5/kkj0qnW89sND+mNMhQ5qPeTaY0v0EljuwbqP0l?=
 =?us-ascii?Q?B9Hz3qLcOmPG+0Ff1YsdDiYzJyyVwDQeXafboi2y8aQokd85hsNztC5jMqa3?=
 =?us-ascii?Q?qRsZVwEItqC6gWBcoUXfsGfSWO4ci1p1cI6Y177R8dM1FglT6FrRwAzDE+9d?=
 =?us-ascii?Q?P3HGO3VwqFwyXhgL7wmYfXgdq0UC3Yfjl/bYgAW00s+4ovJ08061cQ8TQbbc?=
 =?us-ascii?Q?/FhYeaqbK6OsrkYQ8uxNRqsKeZzyWvJ2TPx5tpQt8iq+GSn67y5IJKk9KRYN?=
 =?us-ascii?Q?dofL98Hwns2rWCLH8ZOrJNIdfreyuilujusxGHxoq+nIIX+9YmUU8NoMfafF?=
 =?us-ascii?Q?R++F3cK8eTvRe2fM0zkMrNkPbab8/puLQilYVnuQuX+ujP7ml4h5IhxDoO2H?=
 =?us-ascii?Q?oYzUhlogSdw2C4ppPzbmsPycuy1U4oCR8W5pL4yeG9T1JmkR2crCLYeE8zav?=
 =?us-ascii?Q?IjdT48RsrAZi1gi8UAekYQBkeJSXD4FMsxjJIi7j+zYT1rMCfj46xwn6JTst?=
 =?us-ascii?Q?AgnP1ltAen2z8lYl/hoTUafPf6qZ3FoUZJ/mZSN0JyzgPSh1JCwsAr7Qx+1a?=
 =?us-ascii?Q?jJ/aOg2ydcMOY445xehQhtZP25pqa8Pb9H5zdNdjiXJnxLv0CoKQ4dLtYppd?=
 =?us-ascii?Q?Ei61nY0hl7AoVGdj9yB4MDV99F+LWGFyIBZS2Il1krL2vnm2DshP41A+unep?=
 =?us-ascii?Q?zjXzau4AtGV4AwlpHoS2Oisf3yWe0elVbIS6cjQlGMOxtuuCxuqQh6/c6HbG?=
 =?us-ascii?Q?iYIZC2gQovCLaDoJTycsCXMvYgEoo5IPOwPjVMLHc1ZMgf1Tw8xXFsgzenwa?=
 =?us-ascii?Q?4M947rMXeyqYMaCPS3+Ul2C0Up+49Zzwo5N3ZBBcMCz0ZzTfmc/I3HNqbzqf?=
 =?us-ascii?Q?fCxqA/X6jPzrsomel6mjrlkaOo8+tWLN3Tgh8F9EUFD55knBs+o5IWRpafat?=
 =?us-ascii?Q?pFZ+Lrdb398F0BxQIG+fvcgEzi064DK+YGsn0njU61qcpMHCIuqmRgeXrKBe?=
 =?us-ascii?Q?nDR+l5LvsrC9GTNeqp+TcfoP+FdCaNryXChy+G2/FWCwBxf/BMv37NVQkh0M?=
 =?us-ascii?Q?ugZotDSxQmEFhDOs0FM9vDVbsp0Q706H4ULoWarzq5F4i9tKb1Bk/Q6jNTBd?=
 =?us-ascii?Q?q26eHNsia6wrNJcX6BMmLxjaBW0QPgoNoYhtX1d03nf3YC/2Rwo1CipSE7sn?=
 =?us-ascii?Q?pZDht4ySFhXomELJR4b8BVB/5x9Esdcik/ogdpYr90CU0cnZILx1/3j1mgt7?=
 =?us-ascii?Q?8rUEAKlNck5V4HTtyQHmYSBxpC1bCagMdG4VxT2gPl++xw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?8OdRnYdu5ZKhpes9cPtzgHV2gheBueJeyNETnj5Q6tCQbE3R2RKQ8H+CqDaH?=
 =?us-ascii?Q?HoITpMxbQVF8paprIhSekP3Le40ULwW4K19mK7gxVjuxlRiEl6Z7EUEVlNQD?=
 =?us-ascii?Q?IVpD9vFGkT8yZaV4NDwI2xG1Qv7mteu0V7joHNcsXrq6gUy7VTo13b/Su8KN?=
 =?us-ascii?Q?Pr9u0VZskBwhFbt4UmoTX7K8xU+8XFN6zEHSrkBJIls6z2q98ocxdbkrSD71?=
 =?us-ascii?Q?Dn8i1Xv8TPFTncQpxRrkLHvH4w3UF5KHlicKvlGX1awSQfGj0GCJ/5lPrtz1?=
 =?us-ascii?Q?GQIPqQcDU02Cqv8DDAoRI5ZPQ77LBhpegx5DNNXU4nqfR91ZjfJAdFm2BTre?=
 =?us-ascii?Q?gTE7CoMSDgieOTnrPebDGgghXUZPM3DUIydqMyADAyMRG/m2P7SbL6ZOwF6v?=
 =?us-ascii?Q?ZQGPnmJEDenqcQF07y7pGoCTiMNAwNPPKaTEui2TLw6Kg1NnPKIuqLL/0+C3?=
 =?us-ascii?Q?jYM0t0OhP4f8gJsUZO3dgu+ai1Fj+LrUhiEPwC3MkKSBTYqdxyHZmgziwKPx?=
 =?us-ascii?Q?wUnAWLDhqdclVUbxwVvuJrhA2NgmaqLJzNPax/Qkq263QDDGs5kAiau2+6XL?=
 =?us-ascii?Q?VdwxUqyrjvMhnsgd6Vwn9de7v+HdEQQjFvZg2tBItw7mq2A9ElwfHSkg9/RE?=
 =?us-ascii?Q?YrExoFSdasEJ93BF952u0yMwtn/AEcvjjFzEw0YJnm/Ge1LA2ZxEz4OKex2R?=
 =?us-ascii?Q?pWT4lZmk4S8F4AygHdrRfGQE8MpxexCP8hIYOIXfZIel4msaIzkAfVcAegdy?=
 =?us-ascii?Q?eJ/I3KGEdzLwhgteGwgeZOFlvI9jQkbBsCH7pM5HVSYExTfxM1mjO1wPjRDv?=
 =?us-ascii?Q?1Y7PpYiUEx4T8luRK9+PQj2XrHFh/Nb+DzDtLyi4iWnWjl1jzluXyBF8sgDz?=
 =?us-ascii?Q?IueR90edpoKgGKHkxJwjfV/915Py7AGcvtaqlzHeBEotIPTNQdqVo5Fc9xZB?=
 =?us-ascii?Q?Ind8P1o5q1XUvS8IPpL5YUmtNZz94t8HwYjgWByfyG/FoltM1BA88Gjk+3jF?=
 =?us-ascii?Q?8nEYSMnHNZPKJ3pF49KXbgh9m/LJnHtbTSZ0xRif31rJah9kq19LzjGjxMls?=
 =?us-ascii?Q?6TVzxpE0Q6tpkLCdOumUvpiMb2wmbosqtxzMJkPpDA3/KXjAIHbLkufPAjM/?=
 =?us-ascii?Q?XX0KwHf9e+o5ecajMfkxw2mVoLJmqu0/hUDHtPsyxoksyZxMGYuqYeUltcHp?=
 =?us-ascii?Q?/HMJ8NMLM5SYU6LcJij5Ra04reu35gssoriPc8SHbQSTc4ldieFCSuY9+aJZ?=
 =?us-ascii?Q?HTcZ7hi8mv9nlWfhEm3++vqOE8jGWDh3+5p7LRJ4iMHEVrEOcR/sK26DCSU+?=
 =?us-ascii?Q?4ejjDEOix7i5KIKrf71K8aNA2b8AhxTrIKMfF56Fc8Wu7VKbHGdtm+JQ0lOA?=
 =?us-ascii?Q?h1om5sHX/82bQZctO7oUGEtBw5oSxI2FM8QL81GbmaOBh+cNHpGSIdF77srV?=
 =?us-ascii?Q?tdL9/WW2Mteu7fzekmGs+hh6e5p4hEQy8/AaNJJvtRVOfM9+gT90jHTX0Z/4?=
 =?us-ascii?Q?OO34ojzpZ8Zumh3N61zXnrV+ebVRxX8S/1eHh+CjX6dSJvx/2hQxWzLz3Xka?=
 =?us-ascii?Q?hjuLouee7m79RhS7/3qoj7xI4A88M4Ru6egWgvraIjjerOXGp951SHTtcnv3?=
 =?us-ascii?Q?zg=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da12a4f1-d5f9-4eb1-008e-08dc6a95ce78
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2024 10:51:22.5931
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L9r73mp8ExHeSxsSRcSOitT9tOupQF/REAGDFEKC117kJ9S4vWFgEV6638qHUcNMrn/W+DHD0tWyHmZD6bvPbFO7SpjtUHFxWYUzrEZaACk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6430

Hi All,

Gentle ping. Looks like it missed out in previous kernel cycle.

Are we happy with this patch?

Cheers,
Biju

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Tuesday, February 13, 2024 2:30 PM
> Subject: [PATCH v3 2/2] media: dt-bindings: renesas,rzg2l-cru: Document R=
enesas RZ/G2UL CRU block
>=20
> Document the CRU IP found in Renesas RZ/G2UL SoC.
>=20
> The CRU block on the RZ/G2UL SoC is identical to one found on the RZ/G2L =
SoC, but it does not
> support parallel input.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2->v3:
>  * Added Ack from Conor Dooley and Rb tag from Geert.
> v1->v2:
>  * Dropped the description from if/else block.
>  * Dropped driver reference from commit description.
> ---
>  .../bindings/media/renesas,rzg2l-cru.yaml     | 35 ++++++++++++++++---
>  1 file changed, 31 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.ya=
ml
> b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
> index 1e72b8808d24..bc1245127025 100644
> --- a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
> @@ -19,6 +19,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - renesas,r9a07g043-cru       # RZ/G2UL
>            - renesas,r9a07g044-cru       # RZ/G2{L,LC}
>            - renesas,r9a07g054-cru       # RZ/V2L
>        - const: renesas,rzg2l-cru
> @@ -87,10 +88,6 @@ properties:
>            Input port node, describing the Image Processing module connec=
ted to the
>            CSI-2 receiver.
>=20
> -    required:
> -      - port@0
> -      - port@1
> -
>  required:
>    - compatible
>    - reg
> @@ -102,6 +99,36 @@ required:
>    - reset-names
>    - power-domains
>=20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,r9a07g044-cru
> +              - renesas,r9a07g054-cru
> +    then:
> +      properties:
> +        ports:
> +          required:
> +            - port@0
> +            - port@1
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,r9a07g043-cru
> +    then:
> +      properties:
> +        ports:
> +          properties:
> +            port@0: false
> +
> +          required:
> +            - port@1
> +
>  additionalProperties: false
>=20
>  examples:
> --
> 2.25.1


