Return-Path: <linux-media+bounces-28088-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B3FA5DE2A
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 14:37:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 484EE7A25C6
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 13:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 485802459FF;
	Wed, 12 Mar 2025 13:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="R2FaBO3k"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010011.outbound.protection.outlook.com [52.101.228.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FB223E229;
	Wed, 12 Mar 2025 13:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741786659; cv=fail; b=PHqgCaXHwYPbP9pcZQzaai7G+mUsam4R92UrrbdASLKxRdrRTWqEl1LzRTQVqkKBsUvCBGPcM6Vb40rCU8uw0n/vPg1jNszgJTgk1UnlizeuuSG7nhxFNQPJ61lsB9zszS+qT+1ShoO66EfhVufjNXdHJ/1zbiSo9b2KS4ZlK50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741786659; c=relaxed/simple;
	bh=mun/okK8CalcdIgRSGGXU6liScOpTW7ANWR/qrvyRQE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=p5RjCyN/m3NPZWGJHUwB1NSmbsQAOa90a4tK+vLwh4Qd3R8E6rzADCsMbLcVPjoZdSQoCzT+x8xGQAFLP/mZYIo10kKBfEKAE+ylUaaWHem12wWgMplxz/yGZXoFzb4zfgY4u2gs3NpFQ131Z45hyR1bvtiTR8yBOuF5ABEev40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=R2FaBO3k; arc=fail smtp.client-ip=52.101.228.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dCMieC/SAi56jDvmt2Xg4sSw7bN5F0yKhQTN9+HEvjhxvvuNzJ1MXefaGRGfb7OOFeDMaXauNA9GyAIyRxW8o/MFh8v/RC2PHaSrv3kyjwhx0DYL9f83cKLBT4HoeJ+m4wbp2voQuvMKsYIWdZ0UWpXvaqzpUL2UEYnEzIVVGv8fi8DgowhDLkwqcb0qdW3nwFcToRoSmOPfsh+Q032wy1Ia+hSSD9lWlfxqg3eENPuQiph7PfoMD29++kxdCH7qnGij/ZW/yNlepv5wDV+Z+je4hU2A8/JDjRlW1G4fwf9eeJm45+G3KkCKIqHZfmsPQ/jQt975bLNCPN4BhMALUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a2rjcXIotHObVoTAK+l7+KNuZ42V8+0Nln6ta2a30sw=;
 b=mAz3DxAZG+ue8XBNprB0LXkmSxRk1bc842AWxQ8DMJf0XNuvxpb7VQd1AlUiwePeA1KSnZ+TXZ3QFUTRBvDERf698DFvR797DoQ4BTFs8piT2yGz/r1RYwPZF9mC7lKbZVHbTw8tfBJ2OCLAHBPQMIoCnlnMbWsY0cDvOMo1/ITSYvdsCfWeNRxSXKOVYMinZzsMSNozRMbQ+lhRbtisBuiQ/oFnPcb5maRGBYY2+Y/PBG/LC8ze3JN1rtjd8npjHS8DJQmBWaz+HNxI1pV5l+pbd3g4mtdto3iQpfHP0PPxiyD/4Pm9bc86xIA6drEq2d680Y9j3ZnH4qkYsdKK7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a2rjcXIotHObVoTAK+l7+KNuZ42V8+0Nln6ta2a30sw=;
 b=R2FaBO3kG6tKyqHSNkAwjqhH/9WVHgpaRub3egH9N06KyFtgvZ/9//VPT0VUS2kTzXT0hi7laZbWnUkLZe7U43UYhvx1S/hrZuhwh7QxvvXbRjt9fCJck8fRzqGjvUvqPHBKacQvYfdtYi7Vo+H35xzmuMYoTsU4trSoT+Drbs8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB8594.jpnprd01.prod.outlook.com (2603:1096:604:18f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 13:37:31 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 13:37:25 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Tommaso Merciai
	<tomm.merciai@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Laurent
 Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Hans Verkuil
	<hverkuil@xs4all.nl>, =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?=
	<u.kleine-koenig@baylibre.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 11/17] media: rzg2l-cru: Add register mapping support
Thread-Topic: [PATCH v4 11/17] media: rzg2l-cru: Add register mapping support
Thread-Index: AQHbjFbPYso18q5X+UKLXO3xAvHo/LNvjghQ
Date: Wed, 12 Mar 2025 13:37:25 +0000
Message-ID:
 <TY3PR01MB113467D4C0BE9691A6E4630C786D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250303160834.3493507-1-tommaso.merciai.xr@bp.renesas.com>
 <20250303160834.3493507-12-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250303160834.3493507-12-tommaso.merciai.xr@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB8594:EE_
x-ms-office365-filtering-correlation-id: b9208e89-ab82-46b9-b153-08dd616b06a7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?XtUaBNbB9ppai8sCpCz2SSgo7AGLE4enQCovQJlSZ0g72ZilIJA4V+5wpb?=
 =?iso-8859-1?Q?EKE8FEx4ClKYQhN71kjiJq9UOv4Eq4k4xtRzzyfD+/ECcipMJAs80CR40b?=
 =?iso-8859-1?Q?pcwavtr59R9mF0rFNGzsWlUNiETaKExLLpuvS/GF6oaSAYiol+xDUHfoGL?=
 =?iso-8859-1?Q?Bn/hTmQjBwzE4ULS2PP0X9/4yDHd2IBwlqvtI0NfcxAAr635qKT5AADYLV?=
 =?iso-8859-1?Q?2lk1p4nksLzjy1scLZgkoG8xwNI6eESE6bsltaR7cEIxzmFae383StFqeV?=
 =?iso-8859-1?Q?GiDfBz8iK2POMxDV6iXlgIsGBcK0zmfjW7p24QhtU08xRm4f6YUnDEZBTg?=
 =?iso-8859-1?Q?rwxp51s6RMmUSZHn/z6kLNEVTwoEJh/jfe/uasbKExJxE/MYWJCJczM5WZ?=
 =?iso-8859-1?Q?Rd8nF0Cp+DO47pH4SBVUXv/GB3cw3bR4DAlBk0A6eNaYkgcyTiLj/RFItp?=
 =?iso-8859-1?Q?JiEdjVBy4BVx4XmgOVk5PsynEO3LuW3yAUozSrDFJ1PHEjNMX0C+WEnrv/?=
 =?iso-8859-1?Q?F5dg3zhDDR9fG7hKrEgxzV24s5RnbwAJKdJ5CHQ2EY+wftoMlV6sJ4qXYv?=
 =?iso-8859-1?Q?VqgzFgoboEaqUGyPMUIkCAxVsruHCKAhccT2JAd/j5Jbd9Bf/b8e9Anxcm?=
 =?iso-8859-1?Q?2xwI+Tn63YNfsg7Cy8N8nrWche9zatLr9VsyMs2RzrfoUVd3Yv/92eXyZ5?=
 =?iso-8859-1?Q?X42ruxkIr0TmLj4TVoW2ss1ktNbDrBywE5x+CGlKzdybmjYgH+yR1RRolk?=
 =?iso-8859-1?Q?/Q9CLSPVRmgGPblB3LHO+kMpRIYlJe8TQEmaJOscSIofVGZCQ0MMSJER86?=
 =?iso-8859-1?Q?f4v5i1DTY2mgwxC1lvoGnIZDHgHYXYfw87AX0rlvubuLIObt64fqnav2/O?=
 =?iso-8859-1?Q?fvu14wG5pWsbmr/8/uvhOOQzRBrv9Nb/30FbFJCDI2RQayqUkTX7mdnF6E?=
 =?iso-8859-1?Q?Zz0fRQ9k1V8DMWc8v9GulsO+LX5XsscHkLMImxG7WLafXdizBK+cCAjfT+?=
 =?iso-8859-1?Q?yjMUnX/ps5CKYatfbuoUbRo2hkPV38j2hxcXRRNb24PXdI/4e9Pl6rvDh8?=
 =?iso-8859-1?Q?w1FTSJTLxFF8y7t0kbauuK8WkxfeaOwjA9N8qcn3BTCuaDGtBjoKwf4DhE?=
 =?iso-8859-1?Q?e82QSITureWaS3YPJeibZsjGRbDqyie+azYkzh1qUM5JO9vFmBfiJfnK1W?=
 =?iso-8859-1?Q?B/uLfySgzUkLTA1KhpHO9OBv6bYTwGzZvDXGlbk9TdV9CqOlisgpSbhM+0?=
 =?iso-8859-1?Q?sGHXg8l0zdJTnUZrNw7jnVRal0tYjUKI6Yskipbc4u108kGdRuvhQLkAJf?=
 =?iso-8859-1?Q?kmrnNsfgOx67H7T3VZ6YDOvzOY24F3NS+7IW19xIzOjCizVa/JOVuScf37?=
 =?iso-8859-1?Q?/E1zd5ByNCY8prTN0hYQBMC3AqKlnUZkIpAf1G7h06PakHiRa0uj1Ds707?=
 =?iso-8859-1?Q?vSg24jVmqguafZQEoPtezGz8SNRkJfWboqRuZSkw6c1HElVQb6a5O+pof9?=
 =?iso-8859-1?Q?q4Rjbp9rhJGdqUnKoIlZ5b?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Yt+iCrOm5oLpEjc3/4TpEKj9aD9RWU1yoP34tyouheuzgknqazVvh21FsN?=
 =?iso-8859-1?Q?qdvLALQl1yaFM5e6wBdZ06iVmEw+a6uoqyHWBTlrYbedoCzOdNUDgBrCce?=
 =?iso-8859-1?Q?XBRedDwgStbJiLI4zfHCql6Kwd577PsLLS1LIZVDXTMgPMAOAIQ1aGCGDH?=
 =?iso-8859-1?Q?nTTVH9q6BLGQrQwNY5WMRtd/tY5hJELUkl1UOGZVA61W3ygWiuKWyE6tV2?=
 =?iso-8859-1?Q?DGywISWv+cCsArH+tkCB4lrvufD89gjy+wyq8frcpt1/JXQgA13vOawY7r?=
 =?iso-8859-1?Q?RgtTtpkeELBHeAeWZc47PRTDfO98d2UPAbNJGdPW5R7d0Y6hT1gygSZP0Q?=
 =?iso-8859-1?Q?+SpnZCXznXUw2EUXtpOwENkxD5Y580bov0XEik7PP8tIPYhloq0p+Bxu+J?=
 =?iso-8859-1?Q?HJgiWNqNiT84JlcCYR8NsoU693jiaN9lSVcEZF9Z4VMQiWhNHaNkWlI2h2?=
 =?iso-8859-1?Q?TuSA1CgGjv7zIJ/DnPwDcosx4BVr+vKrFMw/N3FgePwmCD6GUVemAjyS6d?=
 =?iso-8859-1?Q?+885X30MMj43Y7r1ntkt+TYwGr1hOvLO8Aiib+n9xujmHwLvIPNhpIeGty?=
 =?iso-8859-1?Q?R197SwYmeuPS0XIKhVWTpVIu5Rfp4J8UM3juXgkC8grS4hW1wAU2kbQrqR?=
 =?iso-8859-1?Q?mVPcT5VA6OMkof5KvamWYcSLZHNErg745tjeAwLwdNxBmKkGGHuwTdoVRC?=
 =?iso-8859-1?Q?ZI+2VujB+NUoTWcW8LE1y25nnZgLfbjJ1FPRjNoV4VYlZXdB3jVnNqjOYp?=
 =?iso-8859-1?Q?ZP4g30MD9bm54afXbeBdR2D+LVi4K+WqIfRVZ30K6fAUpB4XloLgjXEqoq?=
 =?iso-8859-1?Q?JHxMLkAsPGgp4obC9ZlMkOjMtrf58zBAa50VDgPN5zSwncBLQYM0JsEHaf?=
 =?iso-8859-1?Q?w38JZXwICIbsagdErdE9T1U3zcmpEHTi2WCHee9d2ThxmCutpwtixS60yf?=
 =?iso-8859-1?Q?cWuIrLt/9AMSEs+6HIMeAGws2SW2nHXj2Y8bjFVUm4u62hniQw9ZCJWCVx?=
 =?iso-8859-1?Q?yY+mG+GODzKqaE7AoUamGgd6dQAy0VKYvIrVz1fpqVyggH1/yveSntslGq?=
 =?iso-8859-1?Q?y/C71QlTwqOvWjWZtqvXNFucmDmmEmMU7H6ctIbmtCgBRuEECIePCPr8bl?=
 =?iso-8859-1?Q?8MRQII9nIGbLF5zmeCQ3+ffRoCDMVONuE2OSk3xIvXq8nwTH4Iw3VFskqj?=
 =?iso-8859-1?Q?FWqLYXJqnhYvscVkU5gWAGnmnrm/lZhqm1YadNf+VeO7Jgq9YqpaYvcUp9?=
 =?iso-8859-1?Q?lzHTCXE9l1swlIFLZD932p4hgsKpn4IpgcgUwzGlZYrX0jtaHA9eDzayy+?=
 =?iso-8859-1?Q?KA4F8w5YnCX1H3wn+KboUPV1vZmQA8dEelI7OkuaS6XZfFFnwgzukyclfQ?=
 =?iso-8859-1?Q?SQ2ThhOm2zhbJbKZfCHJPPfIDfsOJo90Vxi+iEWaQRJkwYmDQ1SFFpShAU?=
 =?iso-8859-1?Q?2/iTNnGqWCaSb/4KNbZYmmkNWC8Qu2HP5eQs9E6UCw3RAmdZr1A5+sO2yn?=
 =?iso-8859-1?Q?CLQrxIZl50OjvlnMJx4BdjRN8IjCoLPqQ98emw/IuGIde4a5wFZUbC3lVS?=
 =?iso-8859-1?Q?8XFjAIwpxA0kWrl9j31ohrnVNriEMZ4k7OdPdxDNy9t5D++IpTHR8iP+xD?=
 =?iso-8859-1?Q?KAIHvZT8xhAPgBadmVFetSnB4IxP+iqrwjhZp0xBVzalVjUlkaE1qjZg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b9208e89-ab82-46b9-b153-08dd616b06a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2025 13:37:25.7344
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nnOpjdurdnnEmrU7jEAS2s/RUUOEV9H+FnBAc+abW7jUIKBmMUCdI3VMVcF7nzSNC56kZkajj0cvVl1XWGRczBXU8TnTYOGS4sHXyJ+0SRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8594

Hi Tommaso,

> -----Original Message-----
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Sent: 03 March 2025 16:08
> Subject: [PATCH v4 11/17] media: rzg2l-cru: Add register mapping support
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Prepare for adding support for RZ/G3E and RZ/V2HP SoCs, which have a CRU-=
IP that is mostly identical
> to RZ/G2L but with different register offsets and additional registers. I=
ntroduce a flexible register
> mapping mechanism to handle these variations.
>=20
> Define the `rzg2l_cru_info` structure to store register mappings and pass=
 it as part of the OF match
> data. Update the read/write functions to check out-of-bound accesses and =
use indexed register offsets
> from `rzg2l_cru_info`, ensuring compatibility across different SoC varian=
ts.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> Changes since v2:
>  - Implemented new rzg2l_cru_write/read() that now are checking out-of-bo=
und
>    accesses as suggested by LPinchart.
>  - Fixed AMnMBxADDRL() and AMnMBxADDRH() as suggested by LPinchart.
>  - Update commit body
>=20
>  .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 46 ++++++++++++-
>  .../renesas/rzg2l-cru/rzg2l-cru-regs.h        | 66 ++++++++++---------
>  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  4 ++
>  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 58 ++++++++++++++--
>  4 files changed, 139 insertions(+), 35 deletions(-)
>=20
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> index eed9d2bd0841..abc2a979833a 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> @@ -22,6 +22,7 @@
>  #include <media/v4l2-mc.h>
>=20
>  #include "rzg2l-cru.h"
> +#include "rzg2l-cru-regs.h"
>=20
>  static inline struct rzg2l_cru_dev *notifier_to_cru(struct v4l2_async_no=
tifier *n)  { @@ -269,6
> +270,9 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
>=20
>  	cru->dev =3D dev;
>  	cru->info =3D of_device_get_match_data(dev);
> +	if (!cru->info)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Failed to get OF match data\n");
>=20
>  	irq =3D platform_get_irq(pdev, 0);
>  	if (irq < 0)
> @@ -317,8 +321,48 @@ static void rzg2l_cru_remove(struct platform_device =
*pdev)
>  	rzg2l_cru_dma_unregister(cru);
>  }
>=20
> +static const u16 rzg2l_cru_regs[] =3D {
> +	[CRUnCTRL] =3D 0x0,
> +	[CRUnIE] =3D 0x4,
> +	[CRUnINTS] =3D 0x8,
> +	[CRUnRST] =3D 0xc,
> +	[AMnMB1ADDRL] =3D 0x100,
> +	[AMnMB1ADDRH] =3D 0x104,
> +	[AMnMB2ADDRL] =3D 0x108,
> +	[AMnMB2ADDRH] =3D 0x10c,
> +	[AMnMB3ADDRL] =3D 0x110,
> +	[AMnMB3ADDRH] =3D 0x114,
> +	[AMnMB4ADDRL] =3D 0x118,
> +	[AMnMB4ADDRH] =3D 0x11c,
> +	[AMnMB5ADDRL] =3D 0x120,
> +	[AMnMB5ADDRH] =3D 0x124,
> +	[AMnMB6ADDRL] =3D 0x128,
> +	[AMnMB6ADDRH] =3D 0x12c,
> +	[AMnMB7ADDRL] =3D 0x130,
> +	[AMnMB7ADDRH] =3D 0x134,
> +	[AMnMB8ADDRL] =3D 0x138,
> +	[AMnMB8ADDRH] =3D 0x13c,
> +	[AMnMBVALID] =3D 0x148,
> +	[AMnMBS] =3D 0x14c,
> +	[AMnAXIATTR] =3D 0x158,
> +	[AMnFIFOPNTR] =3D 0x168,
> +	[AMnAXISTP] =3D 0x174,
> +	[AMnAXISTPACK] =3D 0x178,
> +	[ICnEN] =3D 0x200,
> +	[ICnMC] =3D 0x208,
> +	[ICnMS] =3D 0x254,
> +	[ICnDMR] =3D 0x26c,
> +};
> +
> +static const struct rzg2l_cru_info rzgl2_cru_info =3D {
> +	.regs =3D rzg2l_cru_regs,
> +};
> +
>  static const struct of_device_id rzg2l_cru_of_id_table[] =3D {
> -	{ .compatible =3D "renesas,rzg2l-cru", },
> +	{
> +		.compatible =3D "renesas,rzg2l-cru",
> +		.data =3D &rzgl2_cru_info,
> +	},
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, rzg2l_cru_of_id_table); diff --git a/drivers/med=
ia/platform/renesas/rzg2l-
> cru/rzg2l-cru-regs.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru=
-regs.h
> index 1c9f22118a5d..86c320286246 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> @@ -10,71 +10,77 @@
>=20
>  /* HW CRU Registers Definition */
>=20
> -/* CRU Control Register */
> -#define CRUnCTRL			0x0
>  #define CRUnCTRL_VINSEL(x)		((x) << 0)
>=20
> -/* CRU Interrupt Enable Register */
> -#define CRUnIE				0x4
>  #define CRUnIE_EFE			BIT(17)
>=20
> -/* CRU Interrupt Status Register */
> -#define CRUnINTS			0x8
>  #define CRUnINTS_SFS			BIT(16)
>=20
> -/* CRU Reset Register */
> -#define CRUnRST				0xc
>  #define CRUnRST_VRESETN			BIT(0)
>=20
>  /* Memory Bank Base Address (Lower) Register for CRU Image Data */
> -#define AMnMBxADDRL(x)			(0x100 + ((x) * 8))
> +#define AMnMBxADDRL(x)			(AMnMB1ADDRL + (x) * 2)
>=20
>  /* Memory Bank Base Address (Higher) Register for CRU Image Data */
> -#define AMnMBxADDRH(x)			(0x104 + ((x) * 8))
> +#define AMnMBxADDRH(x)			(AMnMB1ADDRH + (x) * 2)
>=20
> -/* Memory Bank Enable Register for CRU Image Data */
> -#define AMnMBVALID			0x148
>  #define AMnMBVALID_MBVALID(x)		GENMASK(x, 0)
>=20
> -/* Memory Bank Status Register for CRU Image Data */
> -#define AMnMBS				0x14c
>  #define AMnMBS_MBSTS			0x7
>=20
> -/* AXI Master Transfer Setting Register for CRU Image Data */
> -#define AMnAXIATTR			0x158
>  #define AMnAXIATTR_AXILEN_MASK		GENMASK(3, 0)
>  #define AMnAXIATTR_AXILEN		(0xf)
>=20
> -/* AXI Master FIFO Pointer Register for CRU Image Data */
> -#define AMnFIFOPNTR			0x168
>  #define AMnFIFOPNTR_FIFOWPNTR		GENMASK(7, 0)
>  #define AMnFIFOPNTR_FIFORPNTR_Y		GENMASK(23, 16)
>=20
> -/* AXI Master Transfer Stop Register for CRU Image Data */
> -#define AMnAXISTP			0x174
>  #define AMnAXISTP_AXI_STOP		BIT(0)
>=20
> -/* AXI Master Transfer Stop Status Register for CRU Image Data */
> -#define AMnAXISTPACK			0x178
>  #define AMnAXISTPACK_AXI_STOP_ACK	BIT(0)
>=20
> -/* CRU Image Processing Enable Register */
> -#define ICnEN				0x200
>  #define ICnEN_ICEN			BIT(0)
>=20
> -/* CRU Image Processing Main Control Register */
> -#define ICnMC				0x208
>  #define ICnMC_CSCTHR			BIT(5)
>  #define ICnMC_INF(x)			((x) << 16)
>  #define ICnMC_VCSEL(x)			((x) << 22)
>  #define ICnMC_INF_MASK			GENMASK(21, 16)
>=20
> -/* CRU Module Status Register */
> -#define ICnMS				0x254
>  #define ICnMS_IA			BIT(2)
>=20
> -/* CRU Data Output Mode Register */
> -#define ICnDMR				0x26c
>  #define ICnDMR_YCMODE_UYVY		(1 << 4)
>=20
> +enum rzg2l_cru_common_regs {
> +	CRUnCTRL,	/* CRU Control */
> +	CRUnIE,		/* CRU Interrupt Enable */
> +	CRUnINTS,	/* CRU Interrupt Status */
> +	CRUnRST, 	/* CRU Reset */
> +	AMnMB1ADDRL,	/* Bank 1 Address (Lower) for CRU Image Data */
> +	AMnMB1ADDRH,	/* Bank 1 Address (Higher) for CRU Image Data */
> +	AMnMB2ADDRL,    /* Bank 2 Address (Lower) for CRU Image Data */
> +	AMnMB2ADDRH,    /* Bank 2 Address (Higher) for CRU Image Data */
> +	AMnMB3ADDRL,    /* Bank 3 Address (Lower) for CRU Image Data */
> +	AMnMB3ADDRH,    /* Bank 3 Address (Higher) for CRU Image Data */
> +	AMnMB4ADDRL,    /* Bank 4 Address (Lower) for CRU Image Data */
> +	AMnMB4ADDRH,    /* Bank 4 Address (Higher) for CRU Image Data */
> +	AMnMB5ADDRL,    /* Bank 5 Address (Lower) for CRU Image Data */
> +	AMnMB5ADDRH,    /* Bank 5 Address (Higher) for CRU Image Data */
> +	AMnMB6ADDRL,    /* Bank 6 Address (Lower) for CRU Image Data */
> +	AMnMB6ADDRH,    /* Bank 6 Address (Higher) for CRU Image Data */
> +	AMnMB7ADDRL,    /* Bank 7 Address (Lower) for CRU Image Data */
> +	AMnMB7ADDRH,    /* Bank 7 Address (Higher) for CRU Image Data */
> +	AMnMB8ADDRL,    /* Bank 8 Address (Lower) for CRU Image Data */
> +	AMnMB8ADDRH,    /* Bank 8 Address (Higher) for CRU Image Data */
> +	AMnMBVALID,	/* Memory Bank Enable for CRU Image Data */
> +	AMnMBS,		/* Memory Bank Status for CRU Image Data */
> +	AMnAXIATTR,	/* AXI Master Transfer Setting Register for CRU Image Data =
*/
> +	AMnFIFOPNTR,	/* AXI Master FIFO Pointer for CRU Image Data */
> +	AMnAXISTP,	/* AXI Master Transfer Stop for CRU Image Data */
> +	AMnAXISTPACK,	/* AXI Master Transfer Stop Status for CRU Image Data */
> +	ICnEN,		/* CRU Image Processing Enable */
> +	ICnMC,		/* CRU Image Processing Main Control */
> +	ICnMS,		/* CRU Module Status */
> +	ICnDMR,		/* CRU Data Output Mode */
> +	RZG2L_CRU_MAX_REG,
> +};
> +
>  #endif /* __RZG2L_CRU_REGS_H__ */
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index 8b898ce05b84..00c3f7458e20 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -80,6 +80,10 @@ struct rzg2l_cru_ip_format {
>  	bool yuv;
>  };
>=20
> +struct rzg2l_cru_info {
> +	const u16 *regs;
> +};
> +
>  /**
>   * struct rzg2l_cru_dev - Renesas CRU device structure
>   * @dev:		(OF) device
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index cd69c8a686d3..792f0df51a4b 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -42,16 +42,66 @@ struct rzg2l_cru_buffer {
>  /* ---------------------------------------------------------------------=
--------
>   * DMA operations
>   */
> -static void rzg2l_cru_write(struct rzg2l_cru_dev *cru, u32 offset, u32 v=
alue)
> +static void __rzg2l_cru_write(struct rzg2l_cru_dev *cru, u32 offset,
> +u32 value)
>  {
> -	iowrite32(value, cru->base + offset);
> +	const u16 *regs =3D cru->info->regs;
> +
> +	/*
> +	 * CRUnCTRL is a first register on all CRU supported SoCs so validate
> +	 * rest of the registers have valid offset being set in cru->info->regs=
.
> +	 */
> +	if (WARN_ON(offset >=3D RZG2L_CRU_MAX_REG) ||
> +	    WARN_ON(offset !=3D CRUnCTRL && regs[offset] =3D=3D 0))
> +		return;
> +
> +	iowrite32(value, cru->base + regs[offset]); }
> +
> +static u32 __rzg2l_cru_read(struct rzg2l_cru_dev *cru, u32 offset) {
> +	const u16 *regs =3D cru->info->regs;
> +
> +	/*
> +	 * CRUnCTRL is a first register on all CRU supported SoCs so validate
> +	 * rest of the registers have valid offset being set in cru->info->regs=
.
> +	 */
> +	if (WARN_ON(offset >=3D RZG2L_CRU_MAX_REG) ||
> +	    WARN_ON(offset !=3D CRUnCTRL && regs[offset] =3D=3D 0))
> +		return 0;
> +
> +	return ioread32(cru->base + regs[offset]);
>  }
>=20
> -static u32 rzg2l_cru_read(struct rzg2l_cru_dev *cru, u32 offset)
> +static inline void
> +__rzg2l_cru_write_constant(struct rzg2l_cru_dev *cru, u32 offset, u32
> +value)
>  {
> -	return ioread32(cru->base + offset);
> +	const u16 *regs =3D cru->info->regs;
> +
> +	BUILD_BUG_ON(offset >=3D RZG2L_CRU_MAX_REG);
> +
> +	iowrite32(value, cru->base + regs[offset]);
Do you need this code as the purpose is to test compile time constant and
It won't execute at run time?


>  }
>=20
> +static inline u32
> +__rzg2l_cru_read_constant(struct rzg2l_cru_dev *cru, u32 offset) {
> +	const u16 *regs =3D cru->info->regs;
> +
> +	BUILD_BUG_ON(offset >=3D RZG2L_CRU_MAX_REG);
> +
> +	return ioread32(cru->base + regs[offset]);=20

Do you need this code as the purpose is to test compile time constant and
It won't execute at run time?

Not sure, maybe adding an entry with MAX_ID in LUT,
that will avoid buffer overflows and you can take out
All out of bound array checks?

Cheers,
Biju

}
> +
> +#define rzg2l_cru_write(cru, offset, value) \
> +	(__builtin_constant_p(offset) ? \
> +	 __rzg2l_cru_write_constant(cru, offset, value) : \
> +	 __rzg2l_cru_write(cru, offset, value))
> +
> +#define rzg2l_cru_read(cru, offset) \
> +	(__builtin_constant_p(offset) ? \
> +	 __rzg2l_cru_read_constant(cru, offset) : \
> +	 __rzg2l_cru_read(cru, offset))
> +
>  /* Need to hold qlock before calling */  static void return_unused_buffe=
rs(struct rzg2l_cru_dev *cru,
>  				  enum vb2_buffer_state state)
> --
> 2.43.0


