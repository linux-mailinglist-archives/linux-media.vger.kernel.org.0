Return-Path: <linux-media+bounces-12461-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 665E08D83AC
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 15:15:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 92132B238B4
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 13:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A19A012CD9D;
	Mon,  3 Jun 2024 13:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="V9zoN1GM"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2086.outbound.protection.outlook.com [40.107.113.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8171EB39;
	Mon,  3 Jun 2024 13:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717420493; cv=fail; b=DQNE5FM0IuClFoGRrbWh5Z4DZgrQlCRIB1chHlookDNCQ58MTzw2hFZ+e2SEPgOeqBqUTLjBsIYCjx/gnxuGNhY0g/xPtgnm0sWVQogUZyxrzW3UqJq1jkkZX09HY2XTBgoNKKTiMRHl+0stX1Uyk9o7nm/AW+RRQ4EreLhsIBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717420493; c=relaxed/simple;
	bh=PedYZ9KoLES92rrAvkCMIPCQjQR+5bLlVotnmSB4Jk8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iICGQ9bwpb7OUYjDbBC7BbudjykIKBrRs1yXrJurbX+4No4Sg0L9MWTeYZR3UyuUomjFtX91Kc4paeyagbMpHpiouzkHOHcZ7U2uCt1IX8sJdxyVGWraNIYsr1fjqB7UqnnHA3aNrbK5wo9K32+EDIROQ8lyGIbNU1G5jDQsYE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=V9zoN1GM; arc=fail smtp.client-ip=40.107.113.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JPktr9Y0Mskrf6+TOv6KbsXbNekD1tAl8L508UoVeXD0Qf1fdyIXVqWOiqb2T6bhq5AUE7L1ntBCaVIluIK3tRjIXVV9VWJCnMLqETheSOztXj4nzEPYxGfvmjCQle52WOKiukK+Zk5FIxOy2NNK1asveRca3y5jjlrUsK9PwZ08Ki49yY4KbnihAn3wjt9EKQYQh8lKS0ChzMa7C4HnCl06XvYm+wc0OTiReHJ9Fhc/svi9+39eFplc9+589TuNSm7grAmFNauMexI6pAhY8fIa6Q++ABt7XqiRx40TJNsJ+k+2DN7XxcfDigQ8mkpuEuqUE+bbAz6SwO0YvQWycA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ncqWqc9GlyWmQChLrUO9AdND1s1sJpEWrx51/wU1jg=;
 b=g18zdVMnLA6VhklBdsYsqVwRy08I9+Y+/dfm/vv/m0Bz9ezMM4TPQEd2He57GHSZLD/i0OyFqay0CABrl39GYLPkA7RSVl10cjKY+UuTyUJqaNy/KWJ4wym0Dz+OAYiJ3qHzUdBW8Mn2sQHhrecNtv32OlC4DHPGrTNILBmq5TSWn6SzZFc+NTVWHE+W+48n4kpmFHjoBAsp4xC17Q8Tt/XOwEGWV44guR3RDqBGxRcWVeSJpKKmsnCLDuo7/6612fUyZj5NEQI8ZFllsu34S/oaG/uwsU2MVZy8XzixaO/0y/Ky3uWpoIJhnq6YbopAurB7kRUtkKQempVbyU0VPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ncqWqc9GlyWmQChLrUO9AdND1s1sJpEWrx51/wU1jg=;
 b=V9zoN1GMjerlZqQgV0OUJAjXdFZy/OIPDkFDuVM75iYlZGejiBCRIlMhfz1P+n/FOmQJocC6Ae3vxLqrVZh2b7KODOv3iWzXmg8fbPZKWfgn8Bxhekmknlrcp35Ax10ug/SYrsFGCUPN3O1tahXVWdDKilrAOm02RErNxMqal3c=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by OSZPR01MB8663.jpnprd01.prod.outlook.com (2603:1096:604:16c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Mon, 3 Jun
 2024 13:14:47 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%5]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 13:14:47 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, biju.das.au <biju.das.au@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: RE: [PATCH v3 1/2] media: dt-bindings: renesas,rzg2l-csi2: Document
 Renesas RZ/G2UL CSI-2 block
Thread-Topic: [PATCH v3 1/2] media: dt-bindings: renesas,rzg2l-csi2: Document
 Renesas RZ/G2UL CSI-2 block
Thread-Index: AQHaXokbVPxFqmIFPk+fhu0S7UxUIrGEP5JQgDJzEJA=
Date: Mon, 3 Jun 2024 13:14:47 +0000
Message-ID:
 <TYCPR01MB11332472451C991CBE23ADF3186FF2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20240213142941.161217-1-biju.das.jz@bp.renesas.com>
 <20240213142941.161217-2-biju.das.jz@bp.renesas.com>
 <TYCPR01MB1133274126C782BFECF1F145A86182@TYCPR01MB11332.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TYCPR01MB1133274126C782BFECF1F145A86182@TYCPR01MB11332.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|OSZPR01MB8663:EE_
x-ms-office365-filtering-correlation-id: 9a20ee29-8143-4f09-7f84-08dc83cf249e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|7416005|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?g/mlh5cZp9i2uo49zt8kktZItuHBM2gJkR50pX0/S1Qg/BRQxbiGUykL3pEx?=
 =?us-ascii?Q?2aJv6ZWPudmDS/S5bMdpBNLJNv/UmVppdbIPn66TLcLHQuLPkrC4ipqBriXF?=
 =?us-ascii?Q?NV+XA9NdWzIyycFrW/U6lB7t3ykpew8AhVfUl9TeD5bs7rEie01/Dgwm+ivc?=
 =?us-ascii?Q?ghRDGqUKZ/DC3TcL83SRoAvaRbkHnFTsjWrE9ll8cWpUHBitOu5XLF2gHA9e?=
 =?us-ascii?Q?YTv+gz2d3tWYGRKyqsF6qpUQ4g1AIjs67nSREnSgJi4WpJ5XE3CSiT7z0jhF?=
 =?us-ascii?Q?UwcuALn1g9t9dYXgRk5AxM3FpfcX8hZei0RthVag1rBtep7zQZ6kKFjTnAC5?=
 =?us-ascii?Q?eCbFZWtp+aPMiZNrKC/Q8FTlYY537df0OPNsR+yu2oSCPNjEzi5DwRatPzwH?=
 =?us-ascii?Q?M6tbtGCYTAlydeJ5TU3qbxLzhp2Szz8sOha9qeOWJBh34pmeVbZabiK5gnvp?=
 =?us-ascii?Q?JAKtSKgpmlpQa/k+dr+OMI0q6UOADUMgrJSV9H66T+DOtFgMDRehJP6Wrj19?=
 =?us-ascii?Q?1ST7Az74SGWzpx5oeeYTxgOAsSylwCG4IJAyCNiWfAGkjM7B6/GUI1lzNYJP?=
 =?us-ascii?Q?QlqVB/QUqrHC9zvZXyye8X/x0/YHl6+RBq+1OvExqGad9dmCXjzlzWauf/Pp?=
 =?us-ascii?Q?gtUq4b1gHScucctbAgLKh3/FKDpx1ueXeE85VkmOm5cQfrCcNDSQegTfVep1?=
 =?us-ascii?Q?A6TcVrnt71XQFUqCfsxBSyYP7uOcsteginlqP1UcQMdfwKQhKrVsGr5W2Fo3?=
 =?us-ascii?Q?Ufn0Xom3F9xyZ1JF7LVbbtjqWlirML2BHvi3DU2SaliPRIIAq9yG/5snVdxb?=
 =?us-ascii?Q?7rEpjLdWOIjKq4jaUiRr+9A2Kt0VraFBZKkacnMPChznGhtX7zZmIJohU2Z2?=
 =?us-ascii?Q?E6UhYAVgMtQ3QesEjTnvjXcZ7yU1KPAPKa/wkJUhijcQukcVTMYUPl54Bzv/?=
 =?us-ascii?Q?9tTZvyGSTf9CCl+JUX0ISqABcy43ueiXMx52VV7ug6Tu5+l6/k5PKvEBsd3r?=
 =?us-ascii?Q?nDpP/5oobYdTbjtt3yKG7up9uO7ERlyswWh96rO/rkBtCpzoRfXyNn38URNx?=
 =?us-ascii?Q?uOm+2+7L3NepwXZRHyAJzkT9FUIVYBGP1Bv5qWkVYgHatXb1y/4ArYIiETf3?=
 =?us-ascii?Q?Jehk0VxhcI+fm/zCA705H0metI0J8VlssHTgiEEo5NxyjKnbwC72UIDcuUdb?=
 =?us-ascii?Q?VuimJvL/wGzPkqFLOfbvdVsv1rnAsFuizhEJVsw+nftm7XJCQmfKFkNY9vjP?=
 =?us-ascii?Q?gr7YU5Qfys+2Fvb8C+m7QZctr9jmApmA4magAhqiP4Dt5x/ACj73u+nzXbK4?=
 =?us-ascii?Q?7CiBJPG9xF0b0+qWEDP6ikeHsJYAPifeAM+r2ZIFyMbn9Q=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?OnUhBfim32K3wrSR/yOX+xQwC359Big1UxezrpjEgf46LRtn/aS+cW0LVb1q?=
 =?us-ascii?Q?XwxUA6Cia0qiRfXsTvjSteO8vzNNaYp8wW/7tISQcoUBqcJ6di/DbI4GmOL7?=
 =?us-ascii?Q?UD4kWmbLZ2MhJGZTQ6ck3bs4jBD6+lC4NnpzpQ/W7fmZkR/Qx5G40GTifnv0?=
 =?us-ascii?Q?ik5WNpy7BM3yCEMokGYdgonbU78/ZNf2B3QFR3E+bWkEdsFZBMMIfu/6NEJa?=
 =?us-ascii?Q?smUBKzMyP/AQzDIcB/pM6suDnkWfvGQcNhQYq5gIqv9cHjTmNdcn4ZHiAm/K?=
 =?us-ascii?Q?WLCEmvzQdWSLXSIK5eZAIEkP3+SBCWy2Q7Sagwl+zBdgsOqQcKiQiuG4VZJ4?=
 =?us-ascii?Q?JiS9lZL+AmPfWzye8vDlI6dI3sbj099BXiIKHbPASJU8b7DNHYoI7hyaY4+1?=
 =?us-ascii?Q?G1C8MSpjHOUNeUB/07q7B/BRcy0yPuWteHpYftL4rGLHyxH1MerqgOKSAa85?=
 =?us-ascii?Q?Ae8mPvDMBZL9gmw+UVG0a83E3pT1TVQ/Qfdeg0pD82Kk6HDyPZ5z10bul4ls?=
 =?us-ascii?Q?HUe+FtzsZjZn831YceDj3EqLnVRjDjNbTNrSrqj3E1cecNkmgKtoRmNQasRO?=
 =?us-ascii?Q?a5sYfExZe22CX/PxL/ZPYeUeelucRI9Qn0U/2aL5UKWMFV8XUZ7L6R1FAZ4S?=
 =?us-ascii?Q?b2itQsPVBceoeO82ewFSgIVHxLo1y75kPKCcJAGcKGIQsZ25f71YwGrfKOgk?=
 =?us-ascii?Q?a7/can2YisHVV7uDRDKe9+9qUNr0WI8M8CyuSWK6yRjewMUpfHEQjiUKidt0?=
 =?us-ascii?Q?heCj0MKdVlNvk35vFJzSOhomihEdN3V4zavY1gVT2RcBeQcNC4NbBE8Vfdi9?=
 =?us-ascii?Q?5AbwmH8c+Ow/jQSALyxCIRqa+JRtZAc01xztbzW/BXPVF9gCtcn5STz4GKKn?=
 =?us-ascii?Q?cxSie1z2WRCqH+gTbjuX1BWsCCaresgUSnQwmNP45zI99ySqVrlws5QYrVmm?=
 =?us-ascii?Q?24OLIKO4AcwOYVv3qCbg0c1Jl/cWqXkqGlZeBDVWZwQoIMOALvtoBGGat1Za?=
 =?us-ascii?Q?nO9/5aByxjPFEDOZtnGXhXj4eVLUCYRGqqUw4kEulZPlTrFFcjjG2GAvnILL?=
 =?us-ascii?Q?eM2siR4yxaxMdQAlNZ3nkQDxa+kqzWusgS4GH7IbpIsh2wft/eVbgqqL5rQj?=
 =?us-ascii?Q?+2TcGLQrstZ9Z0dK7hShr7SdeEK/lfN2QeGAkVp5HBzSjpAJ/wo5XH95tEYK?=
 =?us-ascii?Q?MZpiaF63+v6D1+Op7zzCztV6GR+BiAOMzxjkRzyp+1kQiWnbaluI0YwYVzNk?=
 =?us-ascii?Q?XunwqHNj0aMeeXmOwhV3HccGE+3I0uNk3VsPDPJz65CHEWY2Tp/sylLl5CTG?=
 =?us-ascii?Q?E8NpOrgq6F3k507M/AkxKvmsuuSx6h/VUTjBx0ao0MHxy02p5tkEIgXuWRLz?=
 =?us-ascii?Q?FjrcgHm6GHvl7YQD6JsjHucqCMLgwwZ6w1KHOBAt+iXN+WqvXgtR3u9tyW9H?=
 =?us-ascii?Q?gmx9KUfsOXvhv7TQITjC3L9vkiYA3EZhOYCafeqANaxTywrLmYtVxGDa0huy?=
 =?us-ascii?Q?l6WCYaoWLvA54eh45RuOI8vMIfpIr6/tiArIWet1thJcyLeFdwETug44bC31?=
 =?us-ascii?Q?CX6jLkt0rrXeMsFruiKy12K7oYeBF4YG3wuklMZ0eMdPIqDaCt9BPlUpJ2Ap?=
 =?us-ascii?Q?xw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a20ee29-8143-4f09-7f84-08dc83cf249e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2024 13:14:47.5095
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2OJVyoxTV4FMsqV9eVESXxACNqgzecqbeLg1uF2pEHRS6DzZeNe7HnoXXImoSMjZ6n6/YGfx7JwFhJiJA++H6e5YFL00iVBf6dQz2LfiBmU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8663

Hi All,

Gentle ping. This patch has been Reviewed by DT/Renesas SoC maintainer. Sti=
ll not in the tree.

Cheers,
Biju

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Thursday, May 2, 2024 11:50 AM
> Subject: RE: [PATCH v3 1/2] media: dt-bindings: renesas,rzg2l-csi2: Docum=
ent Renesas RZ/G2UL CSI-2
> block
>=20
> Hi All,
>=20
> Gentle ping. Looks like it missed out in previous kernel cycle.
>=20
> Are we happy with this patch?
>=20
> Cheers,
> Biju
>=20
> > -----Original Message-----
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> > Sent: Tuesday, February 13, 2024 2:30 PM
> > Subject: [PATCH v3 1/2] media: dt-bindings: renesas,rzg2l-csi2:
> > Document Renesas RZ/G2UL CSI-2 block
> >
> > Document the CSI-2 block which is part of CRU found in Renesas RZ/G2UL =
SoC.
> >
> > The CSI-2 block on the RZ/G2UL SoC is identical to one found on the RZ/=
G2L SoC.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v2->v3:
> >  * Added Rb tag from Geert.
> > v1->v2:
> >  * Added Ack from Conor Dooley.
> >  * Dropped driver reference from commit description.
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


