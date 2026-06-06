Return-Path: <linux-media+bounces-64023-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WBjPCK8yJGox4AEAu9opvQ
	(envelope-from <linux-media+bounces-64023-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 16:46:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7593864DBF5
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 16:46:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=siliconsignals.io header.s=selector1 header.b=jnno3L9s;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64023-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64023-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=siliconsignals.io;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D8C2302EE81
	for <lists+linux-media@lfdr.de>; Sat,  6 Jun 2026 14:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED83D3B42CC;
	Sat,  6 Jun 2026 14:45:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021130.outbound.protection.outlook.com [40.107.51.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228072773D3;
	Sat,  6 Jun 2026 14:45:52 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780757155; cv=fail; b=egyxwhRLn+CLTdzm0JH64IThdaBtmeIR9+G87LKSIzCuCViXCjXnweQEK7OMlguRpW5j0eInw+Cl5E7mvmTcjtqXbv7BrzqRfpXhui7SrARKc0D4pD7f0346gv+IgsoG/VpmPIiGNyG6unueDvBNeWMK7pYA/bdcEDvVYcV5Rjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780757155; c=relaxed/simple;
	bh=r1EBneCeRS+mpYHy4jZdlRbsNYm7eMArSUNF8dMj8hc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CkquRLlTfR6vePeBzmcyCV+92kpTs4xRunjC68gF72+6HnadTcV2bZjaDcOnZgF8sn2ATm41+QLh08AgDBEvse8nbPZz4ZrSMi+jn0w71Q62SlgbRF8AymBfcnE1Vy0JbpCacANNK1sszPkbO8QF+QewKmK37w4xL4Hh1cbRBMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=jnno3L9s; arc=fail smtp.client-ip=40.107.51.130
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=svTEJ2zEmyqyQRegitIM/m9FlQVKJnSqdrCvdPLFRLsuiaztHbIezQsxl5FQiA+xCW3//3IyqiOb71XpnyWmwqTYbgBv8caSYZLkD+HSzsBcqvLyLttGlTQSN8VuU8IIk/36vxEoZVe/nhwqQnLsPIq7kzqCmxdCo7+9iLYVBhcrJv3pip9p2PUdANmf1UMVP3D+LKBrC56O87bBwu5vEXqksMUG7paOwUq5Dp+XF4C3ix7T3o+pfBodk0zizh6qrKY/vaM0yzjTV0vSP72J/v5BJvb+0SgDOm3jifdUsxIu2fILLAYeOsOwZ9b+NFo7BJGHw5MvnjdrEclp+badrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B8Kgd2UP6F3kJeKxM8DXxwOBxHAmTWqzXaftJJnGlnQ=;
 b=QNz38bE+4mq+huSqZT2J8wJHDMQ5g0WlG5bGoiIiJjF1hjjnrPzi2u8/pSbyuGjPjE0QugShdzSERaeA907xlw8MxPVhG8NBbF5YQMeePNZKwgA8TDI3x0k67N245C5VR0gsgzWlDSmsriQDJ3ZbwRDGDFZa2qq6pJh0Wi9SnAs97prUEAaha7yqhnsyxxAUf4CaEV/MlGpcBHBr91QahyhwaPIZNah/HXjcDm9+VIxK/K0yqLUwTb6R/jP0hqIgHYFn3bw3wrQ1R9TApNKmSdagS81lO6xd32o8F2yXfSg5chKVQG2tTFFLRzBD3bEzm33oJxXJfEnuLt19wUt/fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B8Kgd2UP6F3kJeKxM8DXxwOBxHAmTWqzXaftJJnGlnQ=;
 b=jnno3L9sU2rXCQtLdErx1T8K0MQo3YVNLxthZlVoMczSLsu5vw7AUOjz/t90hhPcY+LB/C5sc1qPtQTzE7Lexksf5mP1pmkcV7ELA7LfZiNVmiwONL6KVDn09L8ztbUKCdNb/1BWJOSrOvp5kjmDj0fM/B0zdq/3Mgz27wBAe/QaCKttInYA8VJeLvoaRTtkqHC0HL9OLQqB7He+kvxlsQcJ/VedV06i9gjBWFOIDOsOGYvWqgOvcqq7Px16xo4GNLdKEXhRCsDBZq577F91In52AsyyeAAlNV7aBZr0/92LSDKblEp6OCQXdTIg/86QsPkeN92rAVfV4/f6CfMR+A==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MAUP287MB5604.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:1f9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Sat, 6 Jun 2026
 14:45:49 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.21.0092.007; Sat, 6 Jun 2026
 14:45:48 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Jai Luthra <jai.luthra@ideasonboard.com>, Conor Dooley
	<conor+dt@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>
CC: Lachlan Michael <Lachlan.Michael@sony.com>, Ryuichi Tadano
	<Ryuichi.Tadano@sony.com>, Kengo Hayasaka <Kengo.Hayasaka@sony.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] media: i2c: imx678: Add driver for Sony IMX678
Thread-Topic: [PATCH v4 2/2] media: i2c: imx678: Add driver for Sony IMX678
Thread-Index: AQHc9QDxR/cbdD8AmEyAZncD5gOfZLYw/V86gACHxYCAAAc0YA==
Date: Sat, 6 Jun 2026 14:45:48 +0000
Message-ID:
 <PN3P287MB18292FBAEABB556C051434848B1E2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260605-imx678-v4-0-58e57c67143d@ideasonboard.com>
 <20260605-imx678-v4-2-58e57c67143d@ideasonboard.com>
 <PN3P287MB1829593C2DF9AFF8F24A39AF8B1E2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <178075217188.9570.14789474340505402551@freya>
In-Reply-To: <178075217188.9570.14789474340505402551@freya>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MAUP287MB5604:EE_
x-ms-office365-filtering-correlation-id: bed04f3c-5264-4830-9c8e-08dec3da4c65
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|7416014|38070700021|6133799003|4143699003|3023799007|18002099003|56012099006|22082099003;
x-microsoft-antispam-message-info:
 6hr6SYoBD8WtzeYjf48l+/PFzuCMHonocq9uCDMbcwcwG9YC4oXKJrLdGo1xhSXeMIDwrxwhsF0+n9CtGgXjdEYSbUxSE2nMIdcxqha2R481J6iVoJ3QMXfPQyEEU4ICCWsyGgdAFsWrjahdrCfRDQUOB9TGEJSwpgXJLVmx9sQiTHNTGNmVU/J74JYRR0Hg0w/4170H4wrjzleho4xLAqx6qvm5WYfkwxEOUOdygqZpD3wdH9JwZ/+7JwT66/aFn+v83na2tU5uZTKxbQNWDwA0UDmR904pgvw9nQ9mudEmkaw2b2SEhKWrzxkfigkTvbVd+E0xkeMPutyXWYAgaZ6RYPFdX/rxNf8zEwhlc+9klzaa/aw7j10JZMUu5iNnOx6ydL+v3cnxOjlehkjeEEYmtL7XcKQpa6NsWu8fYQlFiKdKh86YT6c0R3LvmFBnYEdkYCTW1R6rKcIAclTT2t8vsp6ZE3Jne6Ba9S85XZGkMCMZQ+0oeJXnTcHyjO1Yosch/6KqiOcfTC80e55G2yqxOF/EPNQ/AwBfkdl0lg47F+6hGBkJ2Q3BmBNYLWEMBrL0GU0Sq43yEewAI8cl9rIdS24EpJ7+IzxUtBDin38uIQumHsrqDozcO6swsGYdfUWhe7aKUy40Hhr1vRpCxz/urf38vsiRJX7fP2F2RO1rCTjmXtS5P5iFIfYqTtaxmj+FD3gLIz2nlMsi9pecJA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(38070700021)(6133799003)(4143699003)(3023799007)(18002099003)(56012099006)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?R/pH+3pD2mH0Dj0JF10A6vAHVqfGuDnlo8dh2qsJ2m74bcJDl98sTooHr+?=
 =?iso-8859-1?Q?Iu1ll5cOoZLOmMQulFDTKH1iITHyXa71bK17FUKxJ3gUlaPfNNTG/jpasR?=
 =?iso-8859-1?Q?tDpDDRzH08CQeAIt8nEpLXno5soiXDTtvj/8pIzGNzBVwZ7ip4BQ5LnRQy?=
 =?iso-8859-1?Q?/e835Y26oNsZTuJasHciyW2eTAnuWrGhEKxKHeOj76quPX88my4cLJf66g?=
 =?iso-8859-1?Q?kFZHRmA4aKLbfLzqgHpgawdCoJ6700YjzOmKDAFbsXiay1/WkhjxACvA21?=
 =?iso-8859-1?Q?tEXw87lbLCVxP9yUVlxVglHM+xUSaoekECkdwyiZ+Ofcqnq4Cz3QhEcUI2?=
 =?iso-8859-1?Q?4nR47Bh3D2shqKN6ZnQRHnBFV0rHM83h91kx9WsXyOKxArzfwqflGxgujZ?=
 =?iso-8859-1?Q?hZnX7brg6P/cDcZfJlh1S6DgyjPL0Rs+5015lFqKy09hvzvoo4+1K7Vhol?=
 =?iso-8859-1?Q?sYa4hw6vlUBoitRn/hhDrxWZGZOJcYej5elcgrt8nXOtYtaMYDT8c23Kt4?=
 =?iso-8859-1?Q?j2nTyuax658NFc8lg0kd7/u+fL+N66DbbSrZ2d9UL39T3wKlkoydXJziHm?=
 =?iso-8859-1?Q?SNJx5VFD0OOEKtnLUTZvo7VusLf43YOl75p+PjHVDSh/sm3hEbYSCgn+q0?=
 =?iso-8859-1?Q?x+c4okbzGOiNZ92vOTyaIWp2pWg0d3nwxdD4Zwfsc/90vaUGO77NUADK+p?=
 =?iso-8859-1?Q?OE1x6JdDKOw4eDpsXQQDliESo+vze4IjwNYQJ/b6+PfZPD31GUB9ofsAks?=
 =?iso-8859-1?Q?0ze8FCm+KQlSHftLZ068G36TgXPIw2ow8sDZ4tTqWUR1i2Fh43o9p4Z7aO?=
 =?iso-8859-1?Q?BkEF1p6kNAx/u5DHjSNAQygOKIOHDEGNSRfrPuhUWsNnBu708N1w/QaIGH?=
 =?iso-8859-1?Q?X/FGy+OASJwI6ftjdVcdUVaysAmu01ILiK5Eo70T4wkSQ7CA/bKWmtqyHd?=
 =?iso-8859-1?Q?NoMU0fw7q+Nn2iBpJr3gdxJJjU5zHNAN8emx4q8rrC1YyshRWL9RrX3fft?=
 =?iso-8859-1?Q?+IJ4T8EviB0buqcnl33PP7NDCCOAjjg4kbQmz6Uv58jrKcbC7Jzwj2Ot/j?=
 =?iso-8859-1?Q?0G/IsNoIve5KIr+fI0g1vO+fBLdviDLkPJwcXDdri8Zhxuvn+Cgvf384yg?=
 =?iso-8859-1?Q?n99er+jMTJ0n8ZsTcHdKJbyetgvj2q9Fr2swQ82g7AzcmsARxLl6BcdZWG?=
 =?iso-8859-1?Q?VUAZkpOwlgJX8/1XYCFI/8xoYq8n2vIKrXxh1jSrvb2mKDsG85aoUOZ+G/?=
 =?iso-8859-1?Q?8hqRwLvZaESVW06ItgIOGAqQzCGidKYxTE9YfHobQDC6GJ6Dvg1/IwhtZJ?=
 =?iso-8859-1?Q?/pL9MoS67hRbz7LRZLuJqDybPdCANhJA53bUq5SwpMTql+5StPiqhRC+XP?=
 =?iso-8859-1?Q?xex2PkdaAOuJqiSmsi9dBqeSG9A+lSxSnEN3oFAatwEEuhygm/5O6TdZ4q?=
 =?iso-8859-1?Q?Ds3eotzL+MvY4OrQDWI6Srpiep5K+ObRir3gy+FM93Yuu5lpEjLcEyb5PF?=
 =?iso-8859-1?Q?Fa6mkHenoB+vqPiRVrl2nWQOC2+Y7njLk1Rh09IZBDGrOZSkRDGsuelBpS?=
 =?iso-8859-1?Q?4DSNPr6YIkN/FpUvXaHd34/5zXjGcaBmXSvR+QD1vCkmEXHyeUDRub27Sc?=
 =?iso-8859-1?Q?rmHjlejBULXPSmDEgKjP9DEoVOCIfDGlzZhKg2Xkdnc2U9A4Pq0JcO+xbP?=
 =?iso-8859-1?Q?VrKl8yPDG1xE1k7ASvhkdX56oq5BGY+08BiCfG1VUAXeObUJ6BYaBlH3qb?=
 =?iso-8859-1?Q?rtoUmnCRRVYvAy8BNai27rRz/yrP/kl8ifZv/UCBGR3By5ljdn3xwgB/4G?=
 =?iso-8859-1?Q?7yx7tD9yNw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bed04f3c-5264-4830-9c8e-08dec3da4c65
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2026 14:45:48.4626
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: stp3zrOPXZzFg0fytuo/VlLB7RX2w2uecwlvpE4aoeQTCuiA6KS6JK2Hi9NySrxvh5ZNCT0Y3vm2U//94Q6fxE7d7FyiaAcgwRJ06YGfCbs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB5604
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64023-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jai.luthra@ideasonboard.com,m:conor+dt@kernel.org,m:kieran.bingham@ideasonboard.com,m:krzk+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:robh@kernel.org,m:sakari.ailus@linux.intel.com,m:Lachlan.Michael@sony.com,m:Ryuichi.Tadano@sony.com,m:Kengo.Hayasaka@sony.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,PN3P287MB1829.INDP287.PROD.OUTLOOK.COM:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7593864DBF5

Hi Jai.=0A=
=0A=
> Quoting Tarang Raval (2026-06-06 13:47:36)=0A=
> > Hi Jai,=0A=
> >=0A=
> > Sorry, in my first review I missed a few minor issues listed below.=0A=
> >=0A=
>=0A=
> No worries, thank you for the reviews.=0A=
>=0A=
> > I also noticed one major issue in the driver. Please check the comments=
 below.=0A=
> >=0A=
> > Other than that, the driver looks perfect.=0A=
> >=0A=
> > > Add a V4L2 subdev driver for the Sony IMX678 image sensor.=0A=
> > >=0A=
> > > IMX678 is a diagonal 8.86 mm (Type 1/1.8) CMOS active pixel type=0A=
> > > solid-state image sensor with a square pixel array and 8.40 M effecti=
ve=0A=
> > > pixels.=0A=
> > >=0A=
> > > The following features are supported by this driver:=0A=
> > > - MIPI RAW12 output=0A=
> > > - Monochrome and Color (Bayer filter) variants=0A=
> > > - Multiple input clock frequencies=0A=
> > > - Multiple link frequencies=0A=
> > > - VBLANK and HBLANK control for variable framerate=0A=
> > > - VFLIP and HFLIP control for flipping readout=0A=
> > > - Exposure and analogue gain control=0A=
> > > - Test pattern control=0A=
> > >=0A=
> > > Following features are not currently supported:=0A=
> > > - MIPI RAW10 output=0A=
> > > - Pixel-perfect crop reporting, accounting for the shift-by-1 when=0A=
> > >   doing HFLIP/VFLIP where the sensor maintains RGGB bayer ordering=0A=
> > >=0A=
> > > Along with the ones below which depend on the new raw sensor model:=
=0A=
> > > - Embedded data stream=0A=
> > > - Freely configurable cropping=0A=
> > > - Increased framerate when cropping=0A=
> > > - 2x2 binning support=0A=
> > >=0A=
> > > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>=0A=
> >=0A=
> > ...=0A=
> >=0A=
> > > +static const u32 codes_bayer[] =3D {=0A=
> > > +       MEDIA_BUS_FMT_SRGGB12_1X12,=0A=
> > > +};=0A=
> > > +=0A=
> > > +static const u32 codes_monochrome[] =3D {=0A=
> > > +       MEDIA_BUS_FMT_Y12_1X12,   /* 12-bit mono */=0A=
> >=0A=
> > Above comment adds no useful information and can be dropped.=0A=
> >=0A=
> > > +};=0A=
> > > +=0A=
> > > +static const struct imx678_model_info imx678_aaqr_info =3D {=0A=
> > > +       .type =3D IMX678_COLOR,=0A=
> > > +       .codes =3D codes_bayer,=0A=
> > > +       .num_codes =3D ARRAY_SIZE(codes_bayer),=0A=
> > > +};=0A=
> > > +=0A=
> > > +static const struct imx678_model_info imx678_aamr_info =3D {=0A=
> > > +       .type =3D IMX678_MONOCHROME,=0A=
> > > +       .codes =3D codes_monochrome,=0A=
> > > +       .num_codes =3D ARRAY_SIZE(codes_monochrome),=0A=
> > > +};=0A=
> > > +=0A=
> > > +static const char * const imx678_supply_name[] =3D {=0A=
> > > +       "avdd",  /* Analog (3.3V) supply */=0A=
> > > +       "dvdd",  /* Digital Core (1.1V) supply */=0A=
> > > +       "ovdd",  /* IF (1.8V) supply */=0A=
> > > +};=0A=
> > > +=0A=
> > > +struct imx678 {=0A=
> > > +       struct v4l2_subdev sd;=0A=
> > > +       struct media_pad pad;=0A=
> > > +       struct regmap *cci;=0A=
> > > +=0A=
> > > +       const struct imx678_model_info *info;=0A=
> > > +=0A=
> > > +       struct clk *xclk;=0A=
> > > +       u32 xclk_freq;=0A=
> > > +=0A=
> > > +       /* chosen INCK_SEL register value */=0A=
> > > +       u8  inck_sel_val;=0A=
> > > +=0A=
> > > +       /* Link configurations */=0A=
> > > +       enum imx678_lanemode lane_mode;=0A=
> > > +       unsigned long link_freq_bitmap;=0A=
> > > +=0A=
> > > +       struct gpio_desc *reset_gpio;=0A=
> > > +       struct regulator_bulk_data supplies[ARRAY_SIZE(imx678_supply_=
name)];=0A=
> > > +=0A=
> > > +       struct v4l2_ctrl_handler ctrl_handler;=0A=
> > > +=0A=
> > > +       /* V4L2 Controls */=0A=
> > > +       struct v4l2_ctrl *exposure;=0A=
> > > +       struct v4l2_ctrl *vblank;=0A=
> > > +       struct v4l2_ctrl *hblank;=0A=
> > > +=0A=
> > > +       /* Tracking sensor VMAX/HMAX value */=0A=
> > > +       u32 vmax;=0A=
> > > +};=0A=
> > > +=0A=
> > > +static inline struct imx678 *to_imx678(struct v4l2_subdev *_sd)=0A=
> > > +{=0A=
> > > +       return container_of(_sd, struct imx678, sd);=0A=
> >=0A=
> > Use container_of_const.=0A=
> >=0A=
>=0A=
> Why is that necessary?=0A=
=0A=
container_of_const() preserves const and avoids accidentally casting it awa=
y.=0A=
For non-const pointers it behaves the same as container_of(), while for con=
st=0A=
pointers it preserves constness.=0A=
=0A=
>=0A=
> > > +}=0A=
> >=0A=
> > ...=0A=
> >=0A=
> > > +static int imx678_set_ctrl(struct v4l2_ctrl *ctrl)=0A=
> > > +{=0A=
> > > +       struct imx678 *imx678 =3D container_of(ctrl->handler, struct =
imx678,=0A=
> > > +                                            ctrl_handler);=0A=
> >=0A=
> > Use container_of_const.=0A=
> >=0A=
> > > +       struct i2c_client *client =3D v4l2_get_subdevdata(&imx678->sd=
);=0A=
> > > +       const struct v4l2_mbus_framefmt *format;=0A=
> > > +       struct v4l2_subdev_state *state;=0A=
> > > +       int rpm_in_use;=0A=
> > > +       int ret =3D 0;=0A=
> > > +=0A=
> > > +       state =3D v4l2_subdev_get_locked_active_state(&imx678->sd);=
=0A=
> > > +       format =3D v4l2_subdev_state_get_format(state, IMX678_SOURCE_=
PAD);=0A=
> > > +=0A=
> > > +       if (ctrl->id =3D=3D V4L2_CID_VBLANK) {=0A=
> > > +               u32 current_exposure =3D imx678->exposure->cur.val;=
=0A=
> > > +=0A=
> > > +               imx678->vmax =3D format->height + ctrl->val;=0A=
> >=0A=
> > ........(1)=0A=
> >=0A=
> > > +=0A=
> > > +               current_exposure =3D clamp_t(u32, current_exposure,=
=0A=
> > > +                                          IMX678_EXPOSURE_MIN,=0A=
> > > +                                          imx678->vmax - IMX678_SHR_=
MIN);=0A=
> > > +               ret =3D __v4l2_ctrl_modify_range(imx678->exposure,=0A=
> > > +                                              IMX678_EXPOSURE_MIN,=
=0A=
> > > +                                              imx678->vmax - IMX678_=
SHR_MIN,=0A=
> > > +                                              1, current_exposure);=
=0A=
> > > +               if (ret)=0A=
> > > +                       return ret;=0A=
> > > +       }=0A=
> > > +=0A=
> > > +       /*=0A=
> > > +        * Applying V4L2 control value only happens when power is up =
for=0A=
> > > +        * streaming=0A=
> > > +        */=0A=
> > > +       rpm_in_use =3D pm_runtime_get_if_in_use(&client->dev);=0A=
> > > +       if (!rpm_in_use)=0A=
> > > +               return 0;=0A=
> >=0A=
> > As in the last revision, as I suggested before, I will again suggest us=
ing=0A=
> > pm_runtime_get_if_active() here instead of pm_runtime_get_if_in_use().=
=0A=
> >=0A=
> > This does not seem to align with the comment above:=0A=
> > Applying V4L2 control value only happens when power is up for streaming=
=0A=
> >=0A=
> > "Power is up" implies that the device is in the runtime PM ACTIVE state=
,=0A=
> > rather than simply having a non-zero usage count.=0A=
> >=0A=
>=0A=
> I agree with the comment being slightly misleading, but same as the last=
=0A=
> revision, I still don't fully buy your argument here :-)=0A=
>=0A=
> In the case you talk about, where PM is ACTIVE but usage count =3D=3D 0, =
we=0A=
> anyway know that the count will only increase when .enable_streams is=0A=
> called, at which point the driver will anyway write *all* the registers=
=0A=
> including calling set_ctrl for each control with the cached values.=0A=
>=0A=
> So why should we do (redundant) writes here?=0A=
=0A=
I think this is mostly a difference in expectations.=0A=
=0A=
My view is that if the device is runtime PM ACTIVE, the hardware is accessi=
ble=0A=
and register writes can be performed. In that case, I would expect a contro=
l=0A=
change to be applied to hardware immediately.=0A=
=0A=
With pm_runtime_get_if_in_use(), there is a state where the device is still=
=0A=
ACTIVE but control changes are only cached in software and not written to=
=0A=
hardware until streaming starts again. While the value is not lost, I would=
=0A=
expect hardware and control state to remain synchronized whenever the devic=
e=0A=
is already active.=0A=
=0A=
So I understand the cached-control argument, but if the hardware is accessi=
ble,=0A=
I would prefer applying the control immediately rather than deferring it.=
=0A=
=0A=
> > I also don't understand why we need to be strict here and require the=
=0A=
> > runtime PM usage count to be greater than zero. What matters before acc=
essing=0A=
> > the hardware registers is that the device is powered and accessible, no=
t=0A=
> > whether there is an active user holding a runtime PM reference.=0A=
> >=0A=
> > Anyway, rpm_in_use does not seem necessary here. The check could be sim=
plified to:=0A=
> > if (pm_runtime_get_if_active(&client->dev) <=3D 0)=0A=
>=0A=
> The rpm_in_use value is used below in this function to ensure we don't do=
=0A=
> pm_runtime_put() in case of a negative retval. This is not really handled=
=0A=
> by most drivers today, but I wanted to fix it here given recent discussio=
n=0A=
> [1] and annoying Sashiko reports.=0A=
>=0A=
> [1]: https://lore.kernel.org/all/ahyh0ZlwlZqr7VNa%40kekkonen.localdomain=
=0A=
=0A=
Thats my understanding as well. With:=0A=
if (pm_runtime_get_if_active(&client->dev) <=3D 0)=0A=
	return 0;=0A=
=0A=
both the 0 and negative return paths exit immediately, so neither the switc=
h=0A=
statement nor pm_runtime_put() can be reached.=0A=
=0A=
Best Regards,=0A=
Tarang=

