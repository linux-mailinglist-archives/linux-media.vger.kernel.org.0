Return-Path: <linux-media+bounces-29190-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B88A78827
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 08:31:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C596E1887346
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 06:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 054FA23237F;
	Wed,  2 Apr 2025 06:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="IPi6+y+C"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011005.outbound.protection.outlook.com [40.107.74.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952C3367;
	Wed,  2 Apr 2025 06:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743575476; cv=fail; b=LIbVS4xikzoMqkxH8X9CX3oO7XwKGbY2xzxwvEJXCTLyPprCwW2YuKXvxAwUZlHTHJujoOish6tYMU6prw90wdzKZ1k/bk5szAF99XnHyeW+HLkOleBxpbt8BJWD+X/gWgY/mbCXadXdjvUMnHCRHUSPcIaP2A1vlbq1Hd1VHmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743575476; c=relaxed/simple;
	bh=dL//0kP5MsTqEW8pEOaaib8ChpOUqxgTzVh2iJZHEwU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iCxeGLeWB94F+fnvQiSgJIGiZw8qecF0kxubW0c1W1jENjKdOEV+QDQl9Lnz1e+RQQysKhodtcsGyu8vHmMUtyRdUdOxyM28SLbIvasHEEotEgdaHdmaRIjtMhZVEOUQIdSDSOrJbbGL7HqQUXgt0mEwspS6cjf9qD9x7P/vCg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=IPi6+y+C; arc=fail smtp.client-ip=40.107.74.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CWBzEDC6MFSV2KWHbMHijYvs5n0+hR9XwDpUl+iyQkQGhn/1cX3pXSTXZ8/e/51XDB0l+zxurKWC38xZ3o1Wo2I3doczpizLqrS1vANdl1fUsIBtVZa8KG3PtEhHP/UVIEx+XPYbIMsVAeow6zB1Fpzav3KKNtf5HRbT/k7TnFjhNh5QpkMB3ESc8rgdZb3DG6TWHcW+/wjBwGCj/eqKiuD99cMs48m5vqYhNM0lWUSlNvvBI5yBWNTzyL+QZ7Rn/6qE9f+f6U0MWamXtAtxhbQym+s3MJnxHEwI/DNmOI9yeS3J6N46si/IcCbFQghvwzQO/MvVCacvAwbuSXyyXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8vxMGNeJAPxTDasEKbeeobgJYM2X0dKrrPAw01mozKk=;
 b=ZfgKLbnq9lvazi4PpvphYJMqq6pcb0j3fHBtwEF3LX+Uzuz2X4djTUIKfDv6AUl9WiGUOSm0RBWJr+yTG8XQrLeU4+ikoC51IkxY+q01DmFLq+QZ2XudGR1oa2+kkY85nNHqWIfIYIk4VSo4yPaIeNcYgPUmM9AKsoKeNWBZ5XTsIXm13Q4Feo61thcTiJodeIGuBHVLm51ZXoo7PtpbSrN9QZFTxYjqqh0Br1HXiYatL6et3dGnZLPyUBZ8TuRphIx8yHnqI/x2BZzxyxhH2/COPh6F4jE6CMNfpAE5eab+4sEAU5k2tGkgYJjvo9pmCdk14l2o0UCJL7G3XtPtKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8vxMGNeJAPxTDasEKbeeobgJYM2X0dKrrPAw01mozKk=;
 b=IPi6+y+Cx+u+iWWf7yTphza46DlSPsnU7PbwkfdRKWbfCvm4nqY48JWKEWudtK+KxAXMlsp+r3Nzeg0zmW1HhfFKMeduAjv0OG2df8AYe8w15j/yNmMQTCIaS8mAzEGJKIlyPAG5cx3liWRe4Vy+EpmkiTZkNDCyDpeFmBIoekk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB9672.jpnprd01.prod.outlook.com (2603:1096:604:1f0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.37; Wed, 2 Apr
 2025 06:31:04 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8583.038; Wed, 2 Apr 2025
 06:31:02 +0000
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
Subject: RE: [PATCH v5 11/17] media: rzg2l-cru: Add register mapping support
Thread-Topic: [PATCH v5 11/17] media: rzg2l-cru: Add register mapping support
Thread-Index: AQHboAdhMLT6c7RZOkyzH0oxaSH/n7OP8Rdw
Date: Wed, 2 Apr 2025 06:31:02 +0000
Message-ID:
 <TY3PR01MB11346ECE31CB6C8DC33459C2486AF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250328173032.423322-1-tommaso.merciai.xr@bp.renesas.com>
 <20250328173032.423322-12-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250328173032.423322-12-tommaso.merciai.xr@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB9672:EE_
x-ms-office365-filtering-correlation-id: d8600acc-38f1-4337-f60b-08dd71aff0c7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Yc/8EPW/lHdsnbx+RZ4e/SArfEXZQYxKKegcOnKdWrspz2QQooY3NJL/wK?=
 =?iso-8859-1?Q?WSwtgw9ctSYjqcGO0gLmkHOenGw5YA4TUv7aceV6lQVcfVuaWvl4rxM/KS?=
 =?iso-8859-1?Q?oi0Rb9gci4a4G+6cEDkbd/wyVkyQ95xsjdn3GNwvh3vGUpXqKM3tK9EQPj?=
 =?iso-8859-1?Q?CU8uB3HnbibpS26ppYDDYA+V8waEUiueAfWoLrBT2TSWqGttUQ2SctUFPt?=
 =?iso-8859-1?Q?xoScUm0/6IMqtC3HsR7ULRgJDwyVKzZOrhlszXrtjkLYj0CPtWKqLhGWYb?=
 =?iso-8859-1?Q?yvMfqN4CxjB3rtlVLTeFp34jOsgE2eoRR73gfy+84fGAsba0C5xdHO3RHh?=
 =?iso-8859-1?Q?Kztemw9HDSipSeL7Md8nSEgW0lKL3KlUn7+wwIce11GP7q4hKYwD3ony09?=
 =?iso-8859-1?Q?Yi6XG8NKwC8w75lNcNKdAEy1ChuWDTP92po0mUJapnVwOCiXnntMjyZymX?=
 =?iso-8859-1?Q?uoABbpny9ppVUnXAqZtCUHdsYpOePEQLWX2bSc0Uh9ZhitL/YsAp28Y/Yj?=
 =?iso-8859-1?Q?iSfLA2UuJBpEhh3+10mbyl32Wji+sDvetXNQl9q1CsAKeGBtrBoKXfKMJ3?=
 =?iso-8859-1?Q?gCDxUbGjISyA5mqgKhienw624o8NQI6ebsQzJC4ayiTwrfV9MrlFDKvJB6?=
 =?iso-8859-1?Q?KzjjFETheNCrp3PVu80B6v0+pUp+tKs/DaNK+PEY6i64ifZs3yhbZX4TPz?=
 =?iso-8859-1?Q?ty/z0ZM9eR0CIFJfLI2Z/MCaqWgMmxRLBOLSROyIYWQStgBJbOsIcaDFuU?=
 =?iso-8859-1?Q?rbi9OEyDOCuh/bn25xAtoDzkVg7tUKVpEYUC4PpgZvK4ELyKXUf86etAPl?=
 =?iso-8859-1?Q?iwYcQsvcO1G8wL0sTIT6DLoPZ72JcDrz8FMKQ4vx55LX8f0AiXcWw0z9rr?=
 =?iso-8859-1?Q?sMqkd+fcZGTK7uM+/+IoLg5qv1DfOEuryKYk/Bg2coH3EOD55YXX2Nck7F?=
 =?iso-8859-1?Q?mV8HkJrTZpaZYT/RQA3wwEVrkycHWzMLpaCr3HVA7oAXolRP9NE0K5bbbr?=
 =?iso-8859-1?Q?8cnVhklNQIGXixMO5MplGGEpAkAOA9UeofgdWrR9gp8+LV1sqyahl4SEG+?=
 =?iso-8859-1?Q?eVF51oUD4jAyixQcQCUstgq0B8Y+aogsZEz0OKI/ZWqZUDAzfsaXB+xZ3W?=
 =?iso-8859-1?Q?9DOjvRykCOXA+wI2AGFzDYkhR+X1QP59ay5AURShDindnWp4oeyG/4KwCs?=
 =?iso-8859-1?Q?kmY1rxR7W120srMIrlJMfD/IncYBWkXiQCvEPyciVF/IPZXi/uPldqBtcO?=
 =?iso-8859-1?Q?GJPKsAoO1j4N9v6WWxpZzcJxBA1KlTNDk066IlYXNCGz5qZ38i0MlnpXP3?=
 =?iso-8859-1?Q?9bZdVPcQ3owuG5UpVYxArusQyd2ddmlRWxBMSH4FrjU5eL6fRNpjedTZga?=
 =?iso-8859-1?Q?6hX8j4AK3YzjT0jTzk6q/os8XW+AwgCsGO+ZCbHfT4FUQlZCBTvXMwjfb+?=
 =?iso-8859-1?Q?h4/3E/2Hcs6ol3Ozzbm5/wQLDdKwgYjc/EX9S5S0j8v7BpKK39WlPt7tg5?=
 =?iso-8859-1?Q?s73pk08O5Rmaj2MD6fcaq8?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?DWkPHg/BIzqoCN+nYI/4DeXigMTJH7VlDDSiCTtGSm2VzcDWBuulkvhXEy?=
 =?iso-8859-1?Q?fTyK3u3HDe70uFjgkuWVdjFkIszIadkySFArFj8GYiz/WP5MqHTGvxe/uT?=
 =?iso-8859-1?Q?97Y2vqrgj+bpCY9G3OQphIyxwSOKGiV18XpTvnpqwPAtQ/Fd7g4H+oNn7c?=
 =?iso-8859-1?Q?A6jIj/ans9+077+EjhmzRf2NibXVLwegVkv7+LnpSeaneXkA0G0FVPvnek?=
 =?iso-8859-1?Q?PqX0gf8RLuYPe0O/WPL8ELGaJYIRUyb3p3DmJzlakPXYKSFTql/DNwB+8y?=
 =?iso-8859-1?Q?ZJthdEdDK3dQT0mMpRHUR70siUKv3Gsb8tgUjjfblYyzEGtY6q2lJBPuhg?=
 =?iso-8859-1?Q?/s7h7Nt85yuD4SOEiJua5QLS5oZ9IX3imzZKZxh5S2/sGOGssS8stD3t1g?=
 =?iso-8859-1?Q?2BkF+sLY9naoV44nVDvLDVz51IJAOTij+yMvGGrKDG5hEc/gosj1QCUPb7?=
 =?iso-8859-1?Q?y+1PHBbizEIB8Dz/c7AnigascML7LHxSjJVCpoQvFjpxUjCTVDopCEbAcT?=
 =?iso-8859-1?Q?BhTL1dcNZJViYn4yGecYvgnfK1GkXDdGlznKeJkdaLv9eaCfsE/KQ2CTO1?=
 =?iso-8859-1?Q?elL/3KoM324l2JI9GUCH0y/hoAGgFufcPYn9laIQDrBssDzolViHVx2EJJ?=
 =?iso-8859-1?Q?rlz6eX5RvRKTf1GUGG/8EPr587xwGVviBCSddkYtfi15I2zr4mFgVd5+oz?=
 =?iso-8859-1?Q?b4OQyPGf2uaHvRQoMuxKXR1x0VximU29o72wM08SMMXT+g570U0mgbq4eG?=
 =?iso-8859-1?Q?a8WxwglsOM7qUy/bq+lEobyXm/XJolcPv5C/jw3FgEL0da5auY5klhD0dv?=
 =?iso-8859-1?Q?mzV2BcbCotn5+0cmbaidW0HmPAfj3GSwQrZoXqbRMGkaftgAprfBedxfjL?=
 =?iso-8859-1?Q?FVqIqxWzaeuXh3rQM/UeyHq9PkrXSSt4zwDdDe8LjD9gQJOTgOqQwvUQpH?=
 =?iso-8859-1?Q?hgls23oiodm0Okj9gM2zIFmaI0wQTUuy6dz5ZrOyrsY+9nNnoKaak9xKJl?=
 =?iso-8859-1?Q?gTzd8pvuufH89m5LvBtruvaS9eDXKFTRVNO/K9G+t8pwE5jFl4GMpuSJwE?=
 =?iso-8859-1?Q?WGycb/XV0uWe7AbYUXJ4rj4kv20wKC/7D3ok/L7PEad4Z4TXpMvP90Z6Hi?=
 =?iso-8859-1?Q?TIsgLLzOfUR1huOfzNReO1lXO+LyBZvYlia49W7BZrD29Z0o5EXIiileSf?=
 =?iso-8859-1?Q?DiBlCTp+unbrBkvvVP/7Ybk74o76J5tBl6VZirXML5xd0mZXyCIQYj9dEw?=
 =?iso-8859-1?Q?I4im/xpYRnGEHk4PKnNIoWTutVXk2IZMAZchGmkv3vBABooTIY0LJRSOJ7?=
 =?iso-8859-1?Q?TtIk0h1YcT2KMteBLfDkQ95BfgLl7UQrZ8zJWFe3D8GbjJFSB32ozGH0F/?=
 =?iso-8859-1?Q?FaB2A+MC8EI9sglU+PAvjHZV4YR4k7cfAJBQKNE518xrMvvtRb+NwU4KzP?=
 =?iso-8859-1?Q?r5NdNg+jJF8AcX4MpdK3m7gyZbR1P9naxkXmFUKDnCmUzY2zsid0/ebPw9?=
 =?iso-8859-1?Q?zqWuKbHDDm73H0gTkzx2MAomt9skbjKvyMqULXRU6NlSUY1PyNWXiyT4Fu?=
 =?iso-8859-1?Q?GriCmLKgeVTj46gkwCwnGo70gkibDgfksOPw4izD96SYzNgSqKWNIjkpqy?=
 =?iso-8859-1?Q?R0JNEsVhCF47O+V+WfL1Gm7U131eFSDJSLjpk/1/GMUSht1zNAeby9QQ?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d8600acc-38f1-4337-f60b-08dd71aff0c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2025 06:31:02.8798
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qMazonS5rLsPkdIjFb1FJJr6KfUuYOAASDLSOjcjxqn+mMF5lHBwZSuEE+BQ9XChu1JXys2Z0JqB30ankUkcm0bs8WVM7n5u0OkTcXFdBPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9672

Hi Tommaso,

Thanks for the patch.

> -----Original Message-----
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Sent: 28 March 2025 17:30
> Subject: [PATCH v5 11/17] media: rzg2l-cru: Add register mapping support
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
> Changes since v4:
>  - Mark __rzg2l_cru_write_constant/__rzg2l_cru_read_constant
>    as __always_inline
>=20
>  .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 46 ++++++++++++-
>  .../renesas/rzg2l-cru/rzg2l-cru-regs.h        | 66 ++++++++++---------
>  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  4 ++
>  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 58 ++++++++++++++--
>  4 files changed, 139 insertions(+), 35 deletions(-)
>=20
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> index eed9d2bd08414..abc2a979833aa 100644
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

Do we need enum, can't we use struct instead with all these entries instead=
?

> +
> +static const struct rzg2l_cru_info rzgl2_cru_info =3D {
> +	.regs =3D rzg2l_cru_regs,
> +};

For a single entry, why you need struct?


Cheers,
Biju

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
> index 1c9f22118a5d9..86c3202862465 100644
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
> index 8b898ce05b847..00c3f7458e20a 100644
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
> index cd69c8a686d35..c82db80c33552 100644
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
> +static __always_inline void
> +__rzg2l_cru_write_constant(struct rzg2l_cru_dev *cru, u32 offset, u32
> +value)
>  {
> -	return ioread32(cru->base + offset);
> +	const u16 *regs =3D cru->info->regs;
> +
> +	BUILD_BUG_ON(offset >=3D RZG2L_CRU_MAX_REG);
> +
> +	iowrite32(value, cru->base + regs[offset]);
>  }
>=20
> +static __always_inline u32
> +__rzg2l_cru_read_constant(struct rzg2l_cru_dev *cru, u32 offset) {
> +	const u16 *regs =3D cru->info->regs;
> +
> +	BUILD_BUG_ON(offset >=3D RZG2L_CRU_MAX_REG);
> +
> +	return ioread32(cru->base + regs[offset]); }
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


