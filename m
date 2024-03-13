Return-Path: <linux-media+bounces-6987-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4795187A5FC
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 11:39:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B5CD1C21919
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 10:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D933D3B1;
	Wed, 13 Mar 2024 10:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="gzMsku0D"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2088.outbound.protection.outlook.com [40.107.114.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F108D383BD;
	Wed, 13 Mar 2024 10:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710326378; cv=fail; b=gf8YtoXU7hewPuPC91VoAtefZ7iORQZdbzL4AoNmUkXKHwmVn2YFzq6PatXKKc/sKWOKZsTYbD8ZdRDpGp8xOlwM7BKDx0j/QXrz3MUsOqcKvTJWIFYlY03FQ7ZiBK+/DcE3wtRJLjhJpIFrpG/v+Oq9jAE7D36OndmAP/DzqjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710326378; c=relaxed/simple;
	bh=JLbg30Wj9fo7Pk2FbTHGsbEqhZe5TcRjBB2TC+Otu7w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Wpy/ZmEGOPAan1jxclm38JrQ/qaM/Bxogt8hDj3ZC2xiINU31guZdY7wZYVqKIs9F9vonsP+tQLOvGgWOeMxqN7uOkIvaQUuXJIjhXAjaIdEBdYUgagbisezM/HwjqgupywSV506TAXArIxd3jGljne3+/fKdHE2MU2DSjivMEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=gzMsku0D; arc=fail smtp.client-ip=40.107.114.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LEJVgO/9dwC6qs0TAoZZE5/Nm704sD6mn/phtLBv6JqD1GM2hfhPUHmc73yVO4ZTtfTCncyggfj9ty9bt5TwkzXt3fegG0Eec7O+dplNFseJjtwinrXCpP+YTnU58tCltGfHMNg4kNWBY8oRcdhWa4sSMZwO/hjAHE90o6+FmtQ+9kl/3Pxq+4C7ooKH919N2ZAJKatm6f6Bh0r1OcU5yI7ensNMD/UMOtDMk5E/ItI/PtTCzdTgv2/lqHN6VL7yH8p2Ub+RpF2TtUfTUavwWKSCn6rNnNov75SQGk8Lqv2w71TJwVZo+GFcGll3OkbUfztqHUOMs7mOEdYU+xhLQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sx75CZNE6D4z8RuxwDr58Ndja1RuMaXdJEJfUoshLgM=;
 b=XpEgkvjbgW/j5P4yBnIW4Q8K+qFd9q+BswxBKr7DZdOYoWj2GpMWzeBmRIJDBA84wG8BqIyGHUkT5h5qOZu+SeN2Mx7NjqgmP+fvsFrtqlJiMIE0OU0Vlb0X+NvenUy318Tj4G1n+HD1CT2Z/AzrAbOapfG5gCqR6lv3+AYPYzkuIn1HlhTFnjMCiLb0HfdkRxfLO3Y4e/lx9aKoiM4Nm5IZ5FgNk7JQ8itlcMbPctSf2GlClTbY9qeZikEDJS0mkpg4vLKXrAchKUNCIptPITym14DSuFPRRM9d+2DK5DeYzQ8bxF4JVnC0z950jhxNzSc0aBNqDwuyeTc9GuscYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sx75CZNE6D4z8RuxwDr58Ndja1RuMaXdJEJfUoshLgM=;
 b=gzMsku0DIXgSjvR60KRFgntg77zJ/FprUvdd7IOyxDm8kZQxsCdEvzgnozaCMOaUwo+6US4WL59jfPFdn4ezTsUQQvX4HEMjrhC9fLvDOvaeFkM4CRV27myuO1rjCUsZG16Bh6ipxAY3irfIHJQfWRgl+QezkTlug0n1G+6eXK4=
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com (2603:1096:603:2e::16)
 by TYCPR01MB8342.jpnprd01.prod.outlook.com (2603:1096:400:15f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Wed, 13 Mar
 2024 10:39:24 +0000
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::aef6:c35b:b90d:2e3f]) by OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::aef6:c35b:b90d:2e3f%5]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 10:39:24 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, biju.das.au <biju.das.au@gmail.com>
Subject: RE: [PATCH v3 0/2] Document RZ/G2UL CRU and CSI support
Thread-Topic: [PATCH v3 0/2] Document RZ/G2UL CRU and CSI support
Thread-Index: AQHaXokZWryfxE0HzkOQ5OsjkjLQg7E1p7/w
Date: Wed, 13 Mar 2024 10:39:24 +0000
Message-ID:
 <OSAPR01MB1587A4AD9B455886E777DA38862A2@OSAPR01MB1587.jpnprd01.prod.outlook.com>
References: <20240213142941.161217-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240213142941.161217-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSAPR01MB1587:EE_|TYCPR01MB8342:EE_
x-ms-office365-filtering-correlation-id: 6a0a1ff1-ed38-4fa7-5cb4-08dc4349d9c3
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 mqpn91pfCU88tj0VBr7orpk7lQWXAJLoclT9AatB1CvwEsUvPIcdwFFYsB/30+h8FajsLGqno/SjENrSSaHZnXjxCWsBJZ6VeW3IJO+735bZFzE7MRzflFuZO1Unx8vmGUk3VdxYiqYiM0q9zwyGMI1K3I9Xl3nk4nwzu3GgLNkK+ZQyp18IuuCBE9rys6yFZQpQWxcKwqJmGkvl1/MT30hSPLdTreULQIAHTM+oZXs+KBtc+z9in821UREXgmkzz8LJbNkovfXJlM+ZHUcjOMlciuWGp4F/KDAJMDbejn2P6JNEytR2DVuivGUdURGpZqmWGjxBH8DgTQo79PmIAOVqA6j2DFlcsTAHZWnEoBPUUc8JTNb5/RNOD8Q15zilO1Rdcyxn8XcmYdjNfFJuDr0U+pt4olPUxY3vmibwTdtZ98dM4mNfUQ3qBmWrh4o2puilDNno9epCtEpwzooSQIY5ZbPAoAkIW0IdOF6xQg4cGtVQy+MdQJUu9N+k8o0qASuBVbq+ov+PXjS44DrjgU4FG2rptbWIjAPpM/EXw0038UglxpMzMj6PsmXC2qsAJEIhG3sLrTLLB1CGJM0Gd2G2CRhblDG8Ous6adron3qm1tqPQlO/ekwkHFmUYUyB5Th/8M29XW4gv77niAZP/4QGsQcpP3gokAXStTVXinFq4yHEalLUm4DSw5b4QSAvNgGQttMxJFkyB0Qa3i8gJa+5Y8mWOanbDa/15iOyZA4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB1587.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?konOpQmCuex0SE0HAOt77RamFaH5GydsuoS0HY/zqgihqsLU5TwE0pqijTpc?=
 =?us-ascii?Q?SC53PP3LBJHP6+tyqm3PZrVJD8oJygxyozkYqGBYGcrL95rrcdoq9ud+fZYz?=
 =?us-ascii?Q?/CNv54H0YVp8CGL8fTjA7R8QEYob4cG6efzFXlh7DX1sGAukUu1Dt7Z28k7W?=
 =?us-ascii?Q?SSp7NSoW2sPK+OPm9cvZarzpaiL3ENWPbGTgeeZTR9n14g0SNUDGDqCEWBWZ?=
 =?us-ascii?Q?YF9GsDcnjMhtYe8XzS074DMBpsNgXsgffXydkHBNcbwZR6Srn8gUhZcrx2nq?=
 =?us-ascii?Q?8UWVOANWEzV8FV3ipl84crKcVheLaQoLyQCVnMibMZ7bvdHfHWeG90ImymDP?=
 =?us-ascii?Q?M9YcYUcSwAqBzmbHBOzE2BDoAWn0D9r75LLmzJRwwEBFr1v5AnEGK6MpE/D3?=
 =?us-ascii?Q?Er+acZsSverqnlQ+BMRt5xtD6mzPaVn8H++s9gyETTbVrfIFuLhNz5YfCZpr?=
 =?us-ascii?Q?D2V/B8q6epK4UKiaDVn+dt2DeycGXc6J1ijUnV4aikpDoAat2vBQNkrw2W1z?=
 =?us-ascii?Q?47LHRzBUM3V/s2dD7jHD4nUD2ans3WkNR7TTA1fw7kpvBq7YvaHM70ywm66d?=
 =?us-ascii?Q?8+r3LeV1RWepzuGIchzxWI+skqR8FWvJ+AJ77uvgS+iQeWLWyuRg7inW8sKa?=
 =?us-ascii?Q?QO5Wss9dDBd41P110wHQfufIhb+vhIqfPiK36V1jWCDczYs5EXONNbvIUDkl?=
 =?us-ascii?Q?q0TZ1hYeKpILMQ87s4WXo6xR2LunbFRrdwZsAUScXOzpyIVb7r25zXv5Lf9h?=
 =?us-ascii?Q?rUgwpK23LReAYkUrEs4Cq9GnxbUx0ndJSVBhgWR07GuaUtJL79ETMw4QeIda?=
 =?us-ascii?Q?wRTMfVs2stNBygICCmSWjGzIpAeT+6lLLaleLs35ISVQZ264Uq5x7KBa+Mxi?=
 =?us-ascii?Q?mvVR/3mNyRB+TtlDGwaMSyDAGJnAu1xWBtBtiAZT8k4v0wZRQuNT/Z8ScKHX?=
 =?us-ascii?Q?0KGar1nD28z+/IeeAtuU4x9jTEaLDEC8R/7pN2VePIzTjH+keV40ntYoPu2k?=
 =?us-ascii?Q?tfu0PxQdnWeVIC9GocKSAHgu/OZmfbjoRyvWzPMbAv1FZ/xfSz7ZfroiBmf8?=
 =?us-ascii?Q?WIoGRjpBS/MJfzRd8+d1R39tM7BZv5qHr+0rZWIkFezJrrZ8O6B8A1a4SkiB?=
 =?us-ascii?Q?WHt6If7NLSJYXoH6EE0iE0aVxAD4xfneeRMzgqrqyCufjd3N0utn+Li1+WJF?=
 =?us-ascii?Q?eFEOzmxVhaQDHl6Am8xrU+T5UZ9EmVAAOfWyqSD8lgn3GsLdVhZrw4Y8Z0tk?=
 =?us-ascii?Q?VO7pD6IG4lz1Mx/EeJBBxINDVR+zze/njbSyummA5AoYlPR+LD9bRwr9/wDg?=
 =?us-ascii?Q?2VEUKv/pO5bZquwP+uNVnKYgP5/ld4No5yabzIQ06k8HkVG0ndEKchQOGOvG?=
 =?us-ascii?Q?4UIXnWAJq/QpE+SqwZ7RhVweChENRMuUWRYmZA5C2UpiglaFBHiZ1NiB8/2G?=
 =?us-ascii?Q?cXbmZik86zVZ1pm3zg01dXJO7JDQUikO0nPz5afzK58RlBpELfIgFFvh6ub+?=
 =?us-ascii?Q?6xaHQ2CozC+SjKVSLzRBBkxQlA3lAYiy2W1S6kgExBT9EwYhYI/C7U2cF4s8?=
 =?us-ascii?Q?NZ34ETZgeofKeoN7XBmvBMxd0GigEJm37URT7KS7forDnXD3Yf3SJ5IDIGUq?=
 =?us-ascii?Q?Mw=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB1587.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a0a1ff1-ed38-4fa7-5cb4-08dc4349d9c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2024 10:39:24.4657
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Us7M+iUFvj4eQTKEKpiPrqFHCX3wkiZxQ8LhS7aphtzTfj4MLSYnEQrAZXeOKH0ooCw4iQIWstSIodfHc4b0ashCwEp0D7g04e6X3e9e+m0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8342

Hi All,

Gentle ping.

Cheers,
Biju

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Tuesday, February 13, 2024 2:30 PM
> Subject: [PATCH v3 0/2] Document RZ/G2UL CRU and CSI support
>=20
> This patch series aims to Document CSI/CRU interface found on RZ/G2UL SoC=
.
>=20
> v2->v3:
>  * Added Rb tag from Geert for patch#1 and #2.
>  * Added Ack from Conor Dooley for patch#2.
>  * Dropped SoC dtsi patches from this series as it accepted and
>    also dropped Overlay patch for enabling CSI/CRU on RZ/G2UL SMARC EVK
>    as it is sent as separate patch.
>  * Updated commit header and description of the cover letter.
> v1->v2:
>  * Added Ack from Conor Dooley for patch#1.
>  * Dropped driver reference from commit description for the binding
>    patches.
>=20
> Biju Das (2):
>   media: dt-bindings: renesas,rzg2l-csi2: Document Renesas RZ/G2UL CSI-2
>     block
>   media: dt-bindings: renesas,rzg2l-cru: Document Renesas RZ/G2UL CRU
>     block
>=20
>  .../bindings/media/renesas,rzg2l-cru.yaml     | 35 ++++++++++++++++---
>  .../bindings/media/renesas,rzg2l-csi2.yaml    |  1 +
>  2 files changed, 32 insertions(+), 4 deletions(-)
>=20
> --
> 2.25.1


