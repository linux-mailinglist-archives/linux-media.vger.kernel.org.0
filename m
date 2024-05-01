Return-Path: <linux-media+bounces-10513-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE8B8B8596
	for <lists+linux-media@lfdr.de>; Wed,  1 May 2024 08:33:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC6B51F22E3D
	for <lists+linux-media@lfdr.de>; Wed,  1 May 2024 06:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE45F21105;
	Wed,  1 May 2024 06:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="MOpZhgfb"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2078.outbound.protection.outlook.com [40.107.113.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7414A41;
	Wed,  1 May 2024 06:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714545175; cv=fail; b=iWGLpf5fBQ9oq9Vypp7gjsY8TbWzotj88zygP7aGzlbA4c+GebnmQE5CS3krS5j+LtKfF26SAYsmZ9/olDiIVaGtzAC2OohuhhicAqjuIpE/G+g/sFOdGoXfmpdk8NkvctnXf5zoVyhbGq87aI3xnBa9JuBfAmm+6OkmnR/HspI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714545175; c=relaxed/simple;
	bh=ImwrQq/qCYDZoAOnyXJlmFvSfuuaXPSntkxJ6aXBseU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kJT0Cw3yaFuDhB01+YW8xd1+uW+o3t2BkcvX5nRUvstjxaE6zi5A6hZtJW+gandmyxdk+nYWUMwOyJQDjFlKdkRQeIJzwnzt3bpPEponnpvmL6x+YR4x+wxjFShQ/yH1Ff/o0lbo5zESKaQNg8ON9nXTLMBgmlZpitmrBv2UZB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=MOpZhgfb; arc=fail smtp.client-ip=40.107.113.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fh7dn9c8b0cRrs95qOmRTr7QB8KQsjZnS2k/svEybJfWkAtf+dLIhTdpTIQIvYrmJQpndjOQqi+9RN6uf99meqJ2qxg65uc1Wq6KQRnPrV4m2zJCRK8TMOc2JcL78g//O3twE1w3ts+C96olO1NOcGBomfFFKT66/npMt3L5rQmtLjYvpg99VGl2ZYZ3JuRRbQwPypavQu+19A0rbCpZ9Sl07agPjqs1ArbUJDGgFDLd6fFivuyhIpas0Ufh/MBx//Ectjknh90mTWyJQwt/y+Pi/X/WO06EJy7FSuug87obOGEpFhpnEhOW8Va48IkUXp1JW87TZNeyDDebjELGQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+6QbrGNmrzX54038ivXk+Mgy1vK8XkcO3BlO/UlrMFQ=;
 b=L0iUWWrNGo6XqZqwPBdsKTcjqyoBdRSFmouYmL4gZQKldqRAvccLoAfgakvAjX1AIiZ4XLfk+Ln24qK6vUlXvMHsOoZ4L8RBt+PelkbUpTJKVNpAXx1Rqg+Dsvzq9E5yGbtWcJQAoYi6BbR1ycN7zNQmq7isnlYnVcS0317ZSboBA0aUCSEPddVjtJzQYcGPB3Uszd0ptma4L9mz+3e3cjpsM6Be+B1WhVOH9k3mzECkOo8MMp1a0uBRqy7X8/ESiD0Md4s6gngDrWHCzCLEhjfTEXVSPirSpqlfEGvi1KUs1EJK1KsvJ5wzXXDjjxOY9aG6W84huLAeQjb9aBYuew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+6QbrGNmrzX54038ivXk+Mgy1vK8XkcO3BlO/UlrMFQ=;
 b=MOpZhgfb3UqSiTPE8PAIoUd24YtYgWwO4ShaTiWfjX819K0TI3F2TtvFbLhK5M66/dtT30Cxe1ioKAemEV5MVkly7SRpu0tA6hbJTFdtH5cdl6ReKfWLCjNh/rVjeioSGPuL9RT6X/hqtD8sUp6oJurKYkv/rpO7XZe7CY5AdKM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB10285.jpnprd01.prod.outlook.com (2603:1096:400:1dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.36; Wed, 1 May
 2024 06:32:47 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::500e:ab62:e02b:994e]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::500e:ab62:e02b:994e%4]) with mapi id 15.20.7386.025; Wed, 1 May 2024
 06:32:47 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, biju.das.au <biju.das.au@gmail.com>
Subject: RE: [PATCH v3 0/2] Document RZ/G2UL CRU and CSI support
Thread-Topic: [PATCH v3 0/2] Document RZ/G2UL CRU and CSI support
Thread-Index: AQHaXokZWryfxE0HzkOQ5OsjkjLQg7E1p7/wgEy90MA=
Date: Wed, 1 May 2024 06:32:47 +0000
Message-ID:
 <TY3PR01MB11346A440AAC2D357F237EF4C86192@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240213142941.161217-1-biju.das.jz@bp.renesas.com>
 <OSAPR01MB1587A4AD9B455886E777DA38862A2@OSAPR01MB1587.jpnprd01.prod.outlook.com>
In-Reply-To:
 <OSAPR01MB1587A4AD9B455886E777DA38862A2@OSAPR01MB1587.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB10285:EE_
x-ms-office365-filtering-correlation-id: 4da2a8a8-8008-4666-64af-08dc69a88471
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|1800799015|376005|7416005|366007|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?wuc2qPI/KeeYBISQ9K+HkCfqYHYImfCBbMPhuatvl5CTP2W1OCaEtzQgkZ4b?=
 =?us-ascii?Q?IXz3v4T3nuyARUSJCm4RbvZps1K0/jl5zMeSBAMCXjS1AFoRrqbxtvmdZ9RW?=
 =?us-ascii?Q?f1b7s06biXGKKGX/aQmur8y9iFQrwkxfuH70h0BOnxii2XjWEp15vz0AJM22?=
 =?us-ascii?Q?0Fcr7US2KmtEE9cGLbHOx+wRj4CwFJ22eWOc4QVCV5PrTcn10zNQaPYc5oKt?=
 =?us-ascii?Q?IbpTrLpxPAaUT/MDzbS4n2Dbdpza4wkUqAzTsUkU0Yu/6FjpYGpPLmVAAQbN?=
 =?us-ascii?Q?cDzExwRFIpAET5LcsLKD66OLqbO0sSG6Z3UV0+Q6K30oT+0GYWTus3BEH7RT?=
 =?us-ascii?Q?vBKHRoSCtdGsOlAFfe67y+b/yGrBJNJlibyP26YMcl2wNti4qtwFecUBcGF4?=
 =?us-ascii?Q?MhBYMaStWHMdh5mCdCpW2UFOtB3PNGMSSQf9I/nOCSnSkADeFRzb12TXe84n?=
 =?us-ascii?Q?xXJvOM+rj82RuRdHryVfkQzW21aqsWCao8mCYRffskBHYXuAMm94s2DCmzkj?=
 =?us-ascii?Q?Khrktu57UeI61DUEYcPNepSxZBsbM7qxWaxsxte7qZS6lpQF96ODzfCxvjXI?=
 =?us-ascii?Q?sVqWVUIgBXlpWZxJ6NMF6EqWp+B8FAJyEDp8ZG2avl5eK5iA3gqSLXpGldpP?=
 =?us-ascii?Q?8Tf+1bcRSRBbME830TjitmQcDRtUFSZp44/wnMX6G246KVvfkmaj0FZoKk3b?=
 =?us-ascii?Q?qt1DI6Wqm6FY26dhOMWfH3c4swR01YyskBawqbynn9yBhy7ALFRl3hQTe6l8?=
 =?us-ascii?Q?fxtac+Nw8VoALk7dlianPCFMigFWWAG4L0Zm3F9AijgNWB9T3bkopYcZKF9s?=
 =?us-ascii?Q?Vu466jUSlskdvNu8bkBKX5SYtcU2wG2JZLt1PM5XktPkKN6tu/DBxE/0Wq8G?=
 =?us-ascii?Q?BA3K+3BV+GNh46cqgAkLJG+E0WiqeNclb1NzpM9S66fqSt/nrYG+wAE/9FDD?=
 =?us-ascii?Q?40C3Cl+oclQJ+P8BYdsQ73hSS7cc8CzgrghzFIPyeo7lMqP9hNjk/xauW5/o?=
 =?us-ascii?Q?ffccUR7dD/N2qr19976E67tckl0eTAYuYfMcx4izydR3wcBXj9edPaGJVI5K?=
 =?us-ascii?Q?l5OI/DJtxzoBduRKt2qC2BSNbrC9mhAIoo9S2X2ngI5GqcQUMJ0wPDMX+K56?=
 =?us-ascii?Q?rAcDMhJpTqr0vw/9BjGff3vmlNuzoZU0manZrOIz/AdM6C4YsYcdSpchV7me?=
 =?us-ascii?Q?MlORD22ZXAJheG34eSvUoi8Hox0ZQQdSH8iTI8UtWoTeZqnUihh6TyBBKy7k?=
 =?us-ascii?Q?nDzoq3cMwywBhVMwMfcKbHoVxNlPBZlKC+tRo7YRpudUgsiof4TJMtpvd7rf?=
 =?us-ascii?Q?1zGUpHKc/9WW+NANVYBKM/v3bwrz0SXtDntqhCd6KZferw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(7416005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?wOW9EZaFSHjFolgYLdODJTqZRBaZkkOY1R8CjQYLKikowqPa9CEtjsRwWmxK?=
 =?us-ascii?Q?Z6nJhrOIDph6mtiSIFjMHxKJWs7XoRDIpziRB+10Lec206PKKRi6rxsKHP5B?=
 =?us-ascii?Q?fIehP9Ng1ds4bFC8f4Ha0aB2Kk6EaS1GAXkJkaiPKlOZ2H0juNnPGcw1Imbf?=
 =?us-ascii?Q?Vqx37WotuZiEQmxquxFULRqr4tzao/lXJmUDMqxfQTaDa8WHoFhDZ/qUq7DT?=
 =?us-ascii?Q?JM9LFWqV1FtPmBmPM16xZ/HJoGuyfA7X3V5a/ZjJcngp+ok7isoQjyRfR+Uh?=
 =?us-ascii?Q?UoZAX3bRoTZqAHZ+OtYe7tDQU50Ad+pamugBpczpTEoPxzEOYWE6a8V6+AEM?=
 =?us-ascii?Q?GVd+Vx4RWYxIjRlI9XMfFrsWfgvTd8YjhmURCbpv8qrBELFWHpRaOIaNbPSn?=
 =?us-ascii?Q?lYOjWO84aBpEHUg3pvZklJuz+R4nutxkv6W601vUzwzE2SMkMIBSKSr6WivG?=
 =?us-ascii?Q?gprJXRw7kyLJCvgIIa90nDTCPOJj94N67yM5fqZfmuAGMhKgOTZRMKpe5Et/?=
 =?us-ascii?Q?ld13r0EavwwjZ7zyUI9Jhtj5bVjNkNMBAx8q+PLxqSFVMg7U6EIMNPGvZiic?=
 =?us-ascii?Q?WeN3QXd6/i48PkaiHKD5gxAiiit7KvwvoGtCGPV0Ld0f0EaWJTqxY12bWjhR?=
 =?us-ascii?Q?L3cLeLNBMtkqxho20jKRCMlEnNwYMT3+Y+MckMd8pF2KdXArRffjz7M4b4Wh?=
 =?us-ascii?Q?+27S3NLmsW3wM5Gd2rOJQk0+a32dXAfBgqeSKSe9OwjgVtebK/Lh/ij+lOPS?=
 =?us-ascii?Q?pItdzpSkVFfTXrxwob8yeuM7jLOD2/0hUoguGmFSf9fE6TZBD4psv/YJiF7h?=
 =?us-ascii?Q?uF5C0wf+xrOau+UHAtEbzdrhVB6rVUWdUCXmx3Dmt5QiXOY1zky91XbRjWRM?=
 =?us-ascii?Q?7K76yHS1CO2ka+bhGxU3TSSuivyE+GYdy2IXfabFhw7ckLQzX7c9TlQPjWCV?=
 =?us-ascii?Q?KkhJnOZTR/v2kHJnzH0TnGdyS0iZjY9VUXf5VXBA+jdl20Hthk1SWtLjY9wT?=
 =?us-ascii?Q?cXVFOrZigpK/b4UsM1s8tNdB234nubMTubyuws3IRn2DizCK40EHrUwhSPgQ?=
 =?us-ascii?Q?L18NWexqZ5otpUDFl6PrT+s2VYEWbCZfeDo2TRuXb1CFfJ8gyDMWvQZAxqgb?=
 =?us-ascii?Q?/rFmA2P5SDAVdLqbTCJmq/KMgFSSI8DwprNrFJNT2IM2Id0yv/LILZsiLOpk?=
 =?us-ascii?Q?buzjRWvCQjExBJ3tPVCwSxEzf9Zg6AYwas0EuD3RXLud/yIYc+CiKUDDg5MX?=
 =?us-ascii?Q?E/Kp5Lla6jGAp2gJOeov49rSBWuhoDOaczzNx7jMMetZcqonecQphPbU/YhY?=
 =?us-ascii?Q?oYfo4ZxmbmdX4hlNkhXeg6aHX+mehACvWD5r8nfz8H6hPN1R4yneB4D1dC/i?=
 =?us-ascii?Q?xV7BTNfZWKLgr/xQ3AXFCUQg0QpMQ6cmWGCrmYhvKdj3GULnb1PoeMgXjSsj?=
 =?us-ascii?Q?TMoIHeriVgmLwAcRUorp0Ha2IAgKvaNcnwEu01HO7RRzS4li6s2nz0Y/7Mx+?=
 =?us-ascii?Q?A2b847F7qXiS80WPSJ9Q8VZ/XRbTSKpn6f+yiBJMNFB16OO7dDtoGFhySZAE?=
 =?us-ascii?Q?kUg+FTzeOhqC2olB5aNL9IDKlAmixle0PHSZQBVDvF/qqp4loHe2ucbAjc8F?=
 =?us-ascii?Q?Vg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4da2a8a8-8008-4666-64af-08dc69a88471
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2024 06:32:47.6780
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZRA7jGIzw0SwgQO3oBhxncFicFqmSsjNbm9W8+QbVisbDp6JN7SaJ5cC1tPkwTkB8BIIM8Nxm44BeRWhQWNh5z2x+sf74KwGK3B6fJBm3cA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10285

Hi All,

Gentle ping.

Cheers,
Biju

> Subject: RE: [PATCH v3 0/2] Document RZ/G2UL CRU and CSI support
>=20
> Hi All,
>=20
> Gentle ping.
>=20
> Cheers,
> Biju
>=20
> > -----Original Message-----
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> > Sent: Tuesday, February 13, 2024 2:30 PM
> > Subject: [PATCH v3 0/2] Document RZ/G2UL CRU and CSI support
> >
> > This patch series aims to Document CSI/CRU interface found on RZ/G2UL S=
oC.
> >
> > v2->v3:
> >  * Added Rb tag from Geert for patch#1 and #2.
> >  * Added Ack from Conor Dooley for patch#2.
> >  * Dropped SoC dtsi patches from this series as it accepted and
> >    also dropped Overlay patch for enabling CSI/CRU on RZ/G2UL SMARC EVK
> >    as it is sent as separate patch.
> >  * Updated commit header and description of the cover letter.
> > v1->v2:
> >  * Added Ack from Conor Dooley for patch#1.
> >  * Dropped driver reference from commit description for the binding
> >    patches.
> >
> > Biju Das (2):
> >   media: dt-bindings: renesas,rzg2l-csi2: Document Renesas RZ/G2UL CSI-=
2
> >     block
> >   media: dt-bindings: renesas,rzg2l-cru: Document Renesas RZ/G2UL CRU
> >     block
> >
> >  .../bindings/media/renesas,rzg2l-cru.yaml     | 35 ++++++++++++++++---
> >  .../bindings/media/renesas,rzg2l-csi2.yaml    |  1 +
> >  2 files changed, 32 insertions(+), 4 deletions(-)
> >
> > --
> > 2.25.1


