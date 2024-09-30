Return-Path: <linux-media+bounces-18755-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2484C989B0D
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 09:08:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBCB21F22D4E
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 07:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CB1914A0AB;
	Mon, 30 Sep 2024 07:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gM04+wcO"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012001.outbound.protection.outlook.com [52.101.66.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940E33F8F7;
	Mon, 30 Sep 2024 07:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727680095; cv=fail; b=K0N7UJOnlyndOmYmn63sv1p+3syhl8MljGNovuKGhH3XTKL10xg6JmfCcG9IqZ6dZZcd3p187nNSITCci9TMWkS7/4XVhn2IOajT9Sn3D2BU0YAE/8c7O/znc42NkwPEcpWBAMOXLB7iVYiM7FcawPfjCQmNK5p7DZ9S25fDe/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727680095; c=relaxed/simple;
	bh=s9QxPF1Cj51LXWY4UurkBqxH7OaS8cd77Y40Dc8VVOU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=j1GKA9t2Ywm7LVzchuYUczdISXmte7XYuGzhQO61VIcYHIuxaZ7NQ4o4HYTAFQBUtDeztHmYMsrUDD//Q0IWUHC/FhwTHxuwTktAE4sacWC28GAQ/lNT3CEfwa5SzNIX9R5b2DlEN86k7Glo9mRrJTxlHW1lwyiFJV5/cjmARDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gM04+wcO; arc=fail smtp.client-ip=52.101.66.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ppMxLx/V5NdoBcDYdZklA4EosC9VCIei3wy7+xykWYVo0SoXPGpv6nA4n9FPWj5E+nN4MNsJS3ple1vhNj4dzHbJ3vfcFipmEfFRKcYJA4Guiykv6lRRTOdT33Lj3SAooCOLAjSpPwtH7zbHBcUa8S51uaIAuRVTa5uoEZewp4xlspNM2PLx8oJtBdIYTVAYS8NqWjdlacEbcKlXRWfvjdWKtr5JTtEGxUa17cDqWGksJm0xe5e/z1eeLJ96YAs0Fl7MDOY3+wqQAE902/Sof4BtdtW/1kwZYygcj5jwsXaHEm5BqAD+Sdzy7ElN4BV01DKFTw5hS2kwadPKxdlIIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SR8h+0xUuDzQfXEsFyUL1t/Dyqj+rrC3kojBzcEQVN8=;
 b=jiw198Jz+G0hj5tXdceNjcAOdRc/pdOnIASbFr1KQBwG9DzizWaJbWWfVyc1p5MHQ3rZwG/ggxfgBHATJ/UwgQghqHUBa7A2Hxj2BklaywG7R4qzH7l3SZU0xYLqraoPAneqjaUuHuNIkPvHhJLtnev2BCxmX3xksQELPke6Pm20Q/5lyUx7Vu6mXoyrjMZCTRLJFcED96OuVp7Dc9fkQv9QDUAthJmeOdGp7cYbcePn8FuECBJhryPiQ8Pe5JmT2vaqaVf1hs/vxPvAItTrWuzvWA6g3uUu/BgH+3cgVtWr+mNPiYxAH4rXBoUmxk/2vyG2hMY6yZDkISdoARBNmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SR8h+0xUuDzQfXEsFyUL1t/Dyqj+rrC3kojBzcEQVN8=;
 b=gM04+wcOKzZtCeVG7jxHGUVYbIZylh6WCEORGc3beu8qLg/HgqMv4lQ1gt+iABb1jOFZTwEQUtabvZxotoc63ZUaakVlFjl7s0HZdSt1w708+eZrV/Ovp/KBaTfL5C7TscQIwVWtn9CpJZV9L4ex8pIm4MCC1BkljliSltZpmZ/5LsqU6plczfwJHY6AwVXZJEg/0Oiz6dyT0wdpLMblK3Nn39q5ZxWY6nQxHVZFLOD4NypJnP3MWWBG3cDFEqHtNm5gBh6hGJMkuolJYJbEqPWgkgZnWffCxKRwFwUJmtYIldL/93zE81DRyiU6l1lqBh8nlcDvFKcX37mfLZw/RQ==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by GV1PR04MB11016.eurprd04.prod.outlook.com (2603:10a6:150:206::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 07:08:09 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 07:08:09 +0000
From: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "rmfrfs@gmail.com"
	<rmfrfs@gmail.com>, "martink@posteo.de" <martink@posteo.de>, "kernel@puri.sm"
	<kernel@puri.sm>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>
CC: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 0/3] media: imx8mq-mipi-csi2: Simplify power management
 handling
Thread-Topic: [PATCH 0/3] media: imx8mq-mipi-csi2: Simplify power management
 handling
Thread-Index: AQHbEnWjWQbBoFwBjkOAXS+Cpks20bJv48vQ
Date: Mon, 30 Sep 2024 07:08:09 +0000
Message-ID:
 <AS8PR04MB9080211FC5A0FFCB255C3247FA762@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20240929134354.20735-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20240929134354.20735-1-laurent.pinchart@ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|GV1PR04MB11016:EE_
x-ms-office365-filtering-correlation-id: 0ea0e5c0-313f-4c6a-2acb-08dce11ea410
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?t2MvxDwLvnkhsoE3a4SM82TocPb61KAbS8h+0mHGznJPqPWP/9BA5XedHBcE?=
 =?us-ascii?Q?tujk1TBR69+SOuZyHb2k4zBWRVYq8w88u3gLco10drc++qyHVxft9a2SHryW?=
 =?us-ascii?Q?RNyfepSQlT46OuOeWolQ/KHV+QOX0m/iWe8z9uzWnVMb4Mn5C+DT4nCImWL6?=
 =?us-ascii?Q?QpRGEO9aNiX3UP0JncHkGTtJ+pfdzQN9zDuA4G9EoUahZ8sc7Lu1+j9oHTWz?=
 =?us-ascii?Q?guFDJb6be3skiiUKLG4tG9wXWTh3wnRaTFacMr8r180CDBOjKW14nlCjs2lX?=
 =?us-ascii?Q?1d3jKmx3T1QjmLSaQtLXJyawtvzTXUhypaF5NZkQY6VIrm7UuYyXawEd9vyb?=
 =?us-ascii?Q?1dZqDU9e9Ld8DEzb9qWg792P8IsEtKdEhxYl+teD82k6XZpnqMjwhz/XEZjJ?=
 =?us-ascii?Q?UTKofOsq31d6yuN+jgY1+i44S/av1rXo1VuZg0XL9gMd87K7Q3f8BmNf7pPF?=
 =?us-ascii?Q?wvayKQOhR+USTjFtH6UNMsb+e7a2VyNi+Aom7UHq+ZDU9Vp5nxv2INgtU6ad?=
 =?us-ascii?Q?DgzbkhxatUPgVEb+qqrBZ9AE1m69ReA6eiWmkoHB5R8NSPkBJ1JkVT9v/f+r?=
 =?us-ascii?Q?82GUvnlmNhSJpCJzPVlI8/e0NPum2ZTjV5NSfgPiSzN4c7gDBORvTFSDu2Dc?=
 =?us-ascii?Q?spzPeGTWg4IQ/zDCs3AwaTSMEfSk+i8jcFZcmol2hwN87+SxbUB0aCo/3MrF?=
 =?us-ascii?Q?YfODPHvLhhdntGQiXmbl8RRg2YKfHS95zUzTLFdqMRgkch7Ilx1fDmEcuM0J?=
 =?us-ascii?Q?UljVWdgBd0qZL9DBxnKl6gqdTA8VTEM5+s5bQjPnQmTmOWfUTgiLYPTYu7Pe?=
 =?us-ascii?Q?3gU0E7v7ZR7dJqh45Jjk2AGjMcv04bUPiWlA8cf7mGt5TkgBphCgHx65iZ0w?=
 =?us-ascii?Q?wMy9nogq4WzALhRBCSIDhKC8Gwmeq288/QZ/gMfZ8eTbjMPLhImQUzWZE+Ul?=
 =?us-ascii?Q?EhnPZzzSTDs+s1iDhpfwnIYvySyIwsT1u6ygLqQe22M6wLqMhigilPNSdM8m?=
 =?us-ascii?Q?djTIfXfbs5MwcdOixTLHGUZr0JmsJyHckY9pdWk7bguwF+JUT6/rmEA4Iry7?=
 =?us-ascii?Q?suAwgXmkZgDvVWYMs31GLvtcZ8flRZL4ke0NtQV3LUcqXJckJEuI4IH7aVMN?=
 =?us-ascii?Q?OOP9supiygVStoNlO6XRIw0wQufgj1lzRDmGlJy38VeC1KfSe+90yrNtZ7h/?=
 =?us-ascii?Q?LpnxrZjm3pSHaBMzExQbhUxVrnLCCIvFR6paeeAtDvQW/k1wTffQOSnT6IkZ?=
 =?us-ascii?Q?ZPa1nbu5vnqu+UR16MkI/sj7aGoI0Wk+1gl4Sy60/4DugS3C8U8mVmALKJBp?=
 =?us-ascii?Q?ZrvPUrWefDdkRdY4IejRFZ+jQ2KNQSBktd1ecfeiJLocOFwznsbKl/k87Rh1?=
 =?us-ascii?Q?Xja0hmaEz54hnB2NG4JfxqGGXgheAh05DUR27jdX7Me8z62VRA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?kP1MPMLBE33IRsRb5Q6evCx2+sDAXCm/pO50tRPYS3LtghCW+4dPWdcw3Ihw?=
 =?us-ascii?Q?YA3dnVg8IpDQy6NGmg0pFI0jE2XEG9oKlTF1J6SDoJem9bJ3MufirlhW249B?=
 =?us-ascii?Q?qf9T7BfYxgpk6KZEcSLO9v/8EN886/idZQj4+1WQKRG4748PxDMYrF1AYB24?=
 =?us-ascii?Q?9+wjvsgcf1rFikaR+4o0vfGQZ6h9Yh4FUuzw4pneGugRsXwGHazQ1ZSpDPRp?=
 =?us-ascii?Q?itaK+Myv9c9f/J0s6t6/1m+GT/wkHmgSPgVMUb42wwkeHv33i/gbwCmAg+jM?=
 =?us-ascii?Q?l9p2EU/UZGYkTs2Q4KBzOAX0ADJ1wFlhSmCsa03H3IZRbMw9apccoqfybEmt?=
 =?us-ascii?Q?nIgdZiVMkzs2t1Qscye+i0ssbrtfUkFAO/NgraP9+XClU63lUmY7txkkhZtB?=
 =?us-ascii?Q?2GrB8IsThy6gb+F/MVwuahMeMgXfiNEIB54/t8j2+vdBPi4/s4rRheUoTURQ?=
 =?us-ascii?Q?tfSrBNHyHboso6jLC4REc79gI8rBpcczAhHRF0YB8zKQAnJ0k/LKzZlwhOR2?=
 =?us-ascii?Q?O+Ur6OdjWuco/U2QMFU2AJq9eqt6zRbfCR0H27B/1E8+h4Mw6cSZ/hW0MH9L?=
 =?us-ascii?Q?VYizroKt9X38y4Q82dVLk9N36DMnzpjfDQ3g7MIqAde1GUaH4FfklSJGWV/c?=
 =?us-ascii?Q?+OzduiBHThBBaKSaakwaAQgxkUruuYzdrYzTHUYl6TbyYsIxL2YyZyAqWztg?=
 =?us-ascii?Q?15ZHkXzRFCMHlJscmZROgl0CQWgPCNlv2jwtehf3XJILC2by+OLgXIofFhS7?=
 =?us-ascii?Q?4SWxJia0z2IUVHj/cVZTwSi4sk0kiHM8Pr6xMyMCC7NLEERFd1D+pcUFBRjL?=
 =?us-ascii?Q?TyzmSuZIy59/W8Kgus3yVd82zeKjbmGymJNqlrq8L0vlcLBzogcBu8WIq+X9?=
 =?us-ascii?Q?nRONyGY5L6JeKFSKMD+fZwV+1D0WD5DLhDYFauu2JRwMYoKw9YyTRStScRg3?=
 =?us-ascii?Q?JRIM6JP1LnaDxFGqVcgrJXpgDpZrnmxttCl/LPTcbHM3VtfZVTzi4CGyqUCx?=
 =?us-ascii?Q?Pf1hSMyIIPfA+jF4ssPqikQEzNTZrt7tg3wh40ljbMy1Ucl6ht4iXUTKn6SY?=
 =?us-ascii?Q?OihpvXBlCUHi5cK60S7Ix/uRWkdCYBLBZcBqnDRn8T3qqqXCv0xP3gPmsYWH?=
 =?us-ascii?Q?+/YKBFhpMwoqJb1W170Xq8kPEuqjKJddSHVfRlOMfmzdAqKtWlwXkEgwgW3J?=
 =?us-ascii?Q?NCccrk7EVbyYbyWRg2BbH0vgkKDggAsFTx7jQGR7r4VRaq6OXkwX3FCNlPkJ?=
 =?us-ascii?Q?5JbJMDCjAvlixv2bjNWRN4SFMi2j0TS1FDCPs24czDnJ2jLZj+e7wg4XILsv?=
 =?us-ascii?Q?uLIg92l56/7ysrniLUGApNqPGJGPzWgAr7JAu0npEih091Ur/WMwFy2mm+8M?=
 =?us-ascii?Q?8NMP4IlqgCzaXdPBrCxFVnNTBLYTyndt2bPP21GsCWdDlNKV+Ma+BXbHrXeW?=
 =?us-ascii?Q?1wfPZojfoJ3BAsM++CozC5+ZkPbLkAtfj5aV6zJ+4A7KuiF5cPOOUo2JLBpm?=
 =?us-ascii?Q?jSpySG3zzCZP+XdXwF+NsGxY5oAAZC+vJoqZ0aTM+FWkNC0fgW4abbPjiPKW?=
 =?us-ascii?Q?WfKcwsA6+qIdPMCp435f73FLGd6IRbl60NSx+H2O?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ea0e5c0-313f-4c6a-2acb-08dce11ea410
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2024 07:08:09.7180
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ure7dscyzr7yAlYNpltHTqEwRDi8cJMj7fO6sG7dn4QzZJAF6ch80AOakWkJxaDVAEdzZ3U+bAky4dA5a5vYwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11016

Hi Laurent,

> -----Original Message-----
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Sent: Sunday, September 29, 2024 9:44 PM
> To: rmfrfs@gmail.com; martink@posteo.de; kernel@puri.sm;
> mchehab@kernel.org; shawnguo@kernel.org; s.hauer@pengutronix.de;
> kernel@pengutronix.de; festevam@gmail.com
> Cc: G.N. Zhou (OSS) <guoniu.zhou@oss.nxp.com>; imx@lists.linux.dev; linux=
-
> media@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Subject: [PATCH 0/3] media: imx8mq-mipi-csi2: Simplify power management
> handling
>=20
> Hello,
>=20
> This small patch series is a reaction to "[PATCH] media: nxp:
> imx8mq-mipi-csi2: Fix CSI clocks always enabled issue" ([1]). Instead of =
making
> the PM handling more complex, I think it can be greatly simplified.
>=20
> I have only compile-tested the patches. Guoniu, could you give this a try=
 ?

After applying the patches and test both on iMX8ULP.

  For iMX8ULP, it will cause kernel dump when access CSI registers and syst=
em hang during do suspend/resume while streaming
  Need to add system suspend/resume handlers and call pm_runtime_force_susp=
end/resume in the handlers.
 =20
  I tried to debug this issue and found pm runtime callback won't be called=
 when system resume. The state of power domain won't
  enabled.

>=20
> [1] https://lore.kernel.org/r/20240929101635.1648234-1-
> guoniu.zhou@oss.nxp.com
>=20
> Laurent Pinchart (3):
>   media: imx8mq-mipi-csi2: Drop stream stop/restart at suspend/resume
>     time
>   media: imx8mq-mipi-csi2: Drop ST_SUSPENDED guard
>   media: imx8mq-mipi-csi2: Drop system suspend/resume handlers
>=20
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 113 ++----------------
>  1 file changed, 10 insertions(+), 103 deletions(-)
>=20
>=20
> base-commit: 81ee62e8d09ee3c7107d11c8bbfd64073ab601ad
> --
> Regards,
>=20
> Laurent Pinchart


