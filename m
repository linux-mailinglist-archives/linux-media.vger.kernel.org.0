Return-Path: <linux-media+bounces-62443-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMeENDzYDmr2CQYAu9opvQ
	(envelope-from <linux-media+bounces-62443-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 12:02:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BFF5A2DD9
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 12:02:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF68A3284E09
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 09:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F6B2376A04;
	Thu, 21 May 2026 09:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bXGpr9Y/"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011042.outbound.protection.outlook.com [52.101.70.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E306D2D7D27;
	Thu, 21 May 2026 09:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779355786; cv=fail; b=OTqQ8mETKFVtGU6+lPVnTvQNc1W0oS0AyJ+le2OCHOYVFOkHsfBhigztUq+S0CG+iPuYsH9fZ1krU7FPwVyGoUjK83W2u6Qaty7jydJQmFLlnpppfe4xVKhfWsfXXrS3v+5aH5PmT99+oVqlGa5gaY5st5qq0yalwyM1XC7PCJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779355786; c=relaxed/simple;
	bh=tgNfrc7BBE4NFbrht0Arx9diwKi+FG0/0EoRyAlE9do=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oHVCnkZ1XGHvz2J2y8hOhgFwbt+s013bB2UY5VBd/A6I8KRhTXumytDbmj3A5oY23xWK5AdhR7jKjXSDxcj4qVMy1uArlmLU+QG8yzeNHe0PDqPSwL/GI2fmGN71GK/+QPCemLt1NGmWchkUdp+tk1CYn/b1SJx/bfL9B6AaHBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bXGpr9Y/; arc=fail smtp.client-ip=52.101.70.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jJcv+zShWkGsmFSRviNLOg3OZ7zoO2LbfleBDsYI8pf6a/tjjpY1EbkeheQ6HT/VPEoC0QPtK33C5vpmVVQSfoCII3Uib0BRqhbD86MYH19QIARJTeeQXehGmREEJ9W0veLz1YSqpyZwkMXMD0gw77VURb0uuZnPznWC0DJ7WZASwYw61vmxHCIfk/VXhxESbxfykqCoR9aaBKpQiIOhLH3T9u8qoQJyUtK8+Hj7bTW9dhsB1VhMLYd5lVKS7bEHGILyV9J6rhHq9nyXe2WYzAzmugpcFvzf2pqIsZbFmGpoXPX/s+n++o+SLh3EUGecPyLf/2fEXz8J7rou4f/Frg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1vxdJ/7D9H4TKn7YPL8bXXHihM6ipwRxiZf86f71IYg=;
 b=f3L4dnyuvXF21viEdk1dsKnxS6nSyC2OSM0VJeLBK46IYYqHxJ7Cqzug+J2TTgv85WBNo5owTsSwKhEHm/ESr0eys3m+foYUdF9TaOFSXLhBfBFi4LcKpBlXB9nPybYD5RYcsboEcuDchyyQWsIo7dyhCNKLBbjey7txOEHQq57g916arezIKU6HA+PTfWmz75yae1TniWZorxkd4narVuBjvG5B+Hb9K9/VKiKWQzToJ8CamuKYZta72PZhTAiCGzk8w3CTAGDDJxP3Z9Qn/N/dfCty5ye7V608LE4GVpfSkSXriA42v7xGFibS0JrNRcUNCU+oTAGBNjhXILKv9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1vxdJ/7D9H4TKn7YPL8bXXHihM6ipwRxiZf86f71IYg=;
 b=bXGpr9Y/qKD1Tzv5TXkye98trWDjFJebaTAdFNkxZWB+5DIZTuTXZdLhLNGcJBgmpvHTnhY6me0C3VquJWfRW4Jh2i3Tf421ijyCRhmDaU1BZAf3a6Ofa4MDQAty99NPVnE9/VcjUXYxkC1tBDOBQLiexe2IBTaDVfcgqXTaUKUs1ZT0AG7nj3HC/a+KBVee+MJEdakjH4Zdc+IcoAUJCm/850OFroD1XqLy6gDIrSd0H3oKl5tnstYRfzcIXtRagwNNyP5sbUQN2Ks9+WcF8yVeQZtcbwOrlYevkrPRRy3Qt6+4VMoAz5DLH3RKriR2ftIRblGzSgd7r03lXH4jIA==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by GV4PR04MB11404.eurprd04.prod.outlook.com (2603:10a6:150:299::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 09:29:39 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 09:29:39 +0000
From: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>, Michael Riesch
	<michael.riesch@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Frank Li <frank.li@nxp.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>, Mehdi Djait <mehdi.djait@linux.intel.com>, Hans
 Verkuil <hverkuil+cisco@kernel.org>, "G.N. Zhou (OSS)"
	<guoniu.zhou@oss.nxp.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>, "G.N. Zhou (OSS)"
	<guoniu.zhou@oss.nxp.com>
Subject: RE: [PATCH v4 4/6] media: synopsys: Add PHY stopstate wait for i.MX93
Thread-Topic: [PATCH v4 4/6] media: synopsys: Add PHY stopstate wait for
 i.MX93
Thread-Index: AQHc5zP2JYPXSBO7kE+Ny5UmAbIYVbYWxKQAgAFy8WA=
Date: Thu, 21 May 2026 09:29:39 +0000
Message-ID:
 <AS8PR04MB9080D3B1A6B522F3F9342E23FA0E2@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20260519-csi2_imx95-v4-0-84ea4bb78a88@oss.nxp.com>
 <20260519-csi2_imx95-v4-4-84ea4bb78a88@oss.nxp.com>
 <10853728.nUPlyArG6x@steina-w>
In-Reply-To: <10853728.nUPlyArG6x@steina-w>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|GV4PR04MB11404:EE_
x-ms-office365-filtering-correlation-id: f929aed1-e38c-48f0-e5cf-08deb71b7b5f
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|366016|7416014|376014|56012099003|3023799007|38070700021|921020|18002099003|11063799006|4143699003|22082099003|6133799003;
x-microsoft-antispam-message-info:
 13Nr+Q4GXMwz46YKa3U/LYauhPdB+Is23P7V1/zIelhrnuzI1YRLX40Za+3RfXbXDDvyC+d5rHlCfXEfGhviIcDYKqIKjK8tZD51Py6Xxk1slxlISXQuwAfON+ISnMqNN4JxpJ6SFmzIN7+967dHJhlHV4vsXLi5p4WsyK7lBxHDMNmN9/OitsJSPocdzaSRODPCaM1q2MHBDAfkalz7YGMb9S60lc6kbR4aVRpbzD8Dxn6OPx0n8ikQwDt0AdSHVaeB/aj4J4UV7q9E/+k128cWvwtvJO6R59nat3PTIfTX3CVF0EFc6tov4l/jbIFUG/3b5wivrEG+yaJ53oefIshZUhHMBdEkRh5IiqbfMy8hxW1KD8LGuX+n7JwZgl7WbrCG3RfPSu3mN65IGlGbzTIL+LLBEwm1s4yQC+4yJpNoEg7E/K/Zf5ftIpb2E6zSjnxJ8Dch3NeJDeVrLJNOToWOFoiigIid1eGTgXzUeULJqJRUd6QWr7k7/w5+NRzG+2dQ6/a0E77z7DlhRbYMzUa1y4UOSjK67qk1NOmZ56Dbs+Q2kXZq4qWccJ57fw0jNFKwISKZ/rAsCa9riU1+2hc92roSZEKJxlRJLpr076THCpGPrEn6t5KeyOugohx74gCKdea4j20HbLPv8kYU1H0TIZZN/Ot0UQsdtJFodzZoswlygb2PUbXDvxwCVfHqzBFKj5ZbqZEj4SLwdmAcRg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(376014)(56012099003)(3023799007)(38070700021)(921020)(18002099003)(11063799006)(4143699003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?OUs+kTqygGT/o/4MzEoh7vzM9cGPSTMFav+omy84v2XTsWiGGss9XWnvKB?=
 =?iso-8859-1?Q?r13sTeyX7puVSgxrLbzi6YOqdOkGMndhC9Cq3z/yW7fANbly2eYvjYq1uo?=
 =?iso-8859-1?Q?XjWzzO5e2Z1ucd4uV3B9pmLDcc/guR21qbKfD4fZWeN0KRgemrBorJjptZ?=
 =?iso-8859-1?Q?uIprjCF5Ggt/XUjN9TOsZeUsX840YtE+5URVwVA3ok4NOdfBFvOJsYe9iy?=
 =?iso-8859-1?Q?fZtEl2E3ODHBWTfrndaKDNBUI2egTO3VACV9+QOMhMRhmR2oRwDhNiAXS/?=
 =?iso-8859-1?Q?jxC1h+PYi5Pcx6gzrXF/AJ9788a0LFAU3N3/iQ/yLC9pnFGViZE3sMc2Rr?=
 =?iso-8859-1?Q?I8nAKQHYusYx4GqgAfmd/Bx1ngZ/XpYv9d0JFhQwR0N0FGFf2u1gf1cO4C?=
 =?iso-8859-1?Q?SS1oF2QDAxNYR5vL3KYnFOVntROul4DgJ60J65wBy7kugjwUkKzIPnQ+vd?=
 =?iso-8859-1?Q?unFMHYjpEgd5QNrnwspoAmvkrutLWtRHXoFCfBNfBJkiTAdVY/HK7V/6ma?=
 =?iso-8859-1?Q?q0IImral7FFIrmLg15K9Ckn2G8yrvl7/uW/yBb8c98brgjgZ7hkzIVehch?=
 =?iso-8859-1?Q?YdQu0TFgXGKfhvAg/dC7HzFKd/+GDIOX+4MTlt1fRQtJm0w2+Q4IFh/mIP?=
 =?iso-8859-1?Q?cRLTgG00jeTzjoj7/Q8mEweawoWPqJIGXgjqav0f41I4mq+i7c7aVlRZTt?=
 =?iso-8859-1?Q?Lm6Apg2KWE3a4E6OkshNLDRQfOOn5ynpxkTWD3O1jQ3V3o8HnWv+nlMhyp?=
 =?iso-8859-1?Q?uVFe5vvdcP7/i9kpWk6D9PlJ40z9chOzx6j0ghAGVN7TKHKM+RVBPdDwdL?=
 =?iso-8859-1?Q?cOeoTQyBbn14mRDC0kCghj+n/K+tI+qRmOWk70BdqOINbZ39Tb2sSpvq/E?=
 =?iso-8859-1?Q?wVL+3RoKKWceXEOj6GHBwKQ6ru6u6YW70M6pOINqiYqwUwIGuvfO1ALcc4?=
 =?iso-8859-1?Q?6qpWCnTSmBBuzX+XuKcPv4fLxk/Bms1CR+WS1zPYmYeM+HdnDi1ZPcLF4p?=
 =?iso-8859-1?Q?L3Cna6oJ0aZasxOGzgHgMVuBPSqnaHO/w7TOrKpwiPvamozIDTM1Sj02gT?=
 =?iso-8859-1?Q?w81vke+ANX8xqB0zAg8egkIxOOdbBSHmv+N57KQN6s8oDbFQAWuejRZWHq?=
 =?iso-8859-1?Q?C17MoN4IR201vvxcT92OozWtx+5IchsOUbGKr5VomiwEYhoNPctHZ/AS4R?=
 =?iso-8859-1?Q?0a2uhI2UerHk1rVbGSoNmCei7JAP/EiVjJQB0UpjeKUzNG7QQTQ21ZeDuf?=
 =?iso-8859-1?Q?lUrqIJ8zMdURLFgnYJ2ZOtNKmsH3p6MXMB5jK9qBTQvJPN9CGjzwIVbtWY?=
 =?iso-8859-1?Q?cqH/FApROvnqgoyNyap9I7l9lPDB5CGpgW+k7Ovqp9EIip0GpoNCWr0BDn?=
 =?iso-8859-1?Q?LHYWtGeNTgA3f6fIpz7880alpaYd4VWynqASbpKKOERn9ZVG57nhjxoX0D?=
 =?iso-8859-1?Q?GcBPRlS6X4qFxjxEXauzdEAj4vDRS1H/fQwv4xRYkolFFdVUqQ1ChbLpwB?=
 =?iso-8859-1?Q?X1HA817B/lyn6frhMUWZp24+EsLyiomGyNDZ/6egRNakdJxlL86HvUVRQZ?=
 =?iso-8859-1?Q?JWTTcJANzBMLzmMut0OmOKeiBZ5HN4FaLFiv5/N03ESleN5XJZjBelvC1x?=
 =?iso-8859-1?Q?oAafHX5jfSYCq2WxDNFmHCvxxvCbWHcu+fmcOf68NKluQkf6aULPGFdOSg?=
 =?iso-8859-1?Q?n79+ejgCLi+m6XAtA8UoObxLU06VSb8uQ+2KS0C3UBBVl8Lf/07os+8p17?=
 =?iso-8859-1?Q?SZlSAAOs8Vgk8+w+DCvemb8bGmW6S8YtvNcB0/Mdhjnncs?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f929aed1-e38c-48f0-e5cf-08deb71b7b5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2026 09:29:39.4623
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HN33azddSE2rGP7iO9OsO4nOV128qGJf429rJnJSb+k2zGdeW5G4r6JLxcaEnY+3kKVrOsPH5wQ3MNY5jAp7QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11404
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62443-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 53BFF5A2DD9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Alexander,

> -----Original Message-----
> From: Alexander Stein <alexander.stein@ew.tq-group.com>
> Sent: Wednesday, May 20, 2026 7:12 PM
> To: Michael Riesch <michael.riesch@collabora.com>; Mauro Carvalho Chehab
> <mchehab@kernel.org>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Heiko Stuebner
> <heiko@sntech.de>; Laurent Pinchart <laurent.pinchart@ideasonboard.com>;
> Frank Li <frank.li@nxp.com>; Sakari Ailus <sakari.ailus@linux.intel.com>;=
 Bryan
> O'Donoghue <bryan.odonoghue@linaro.org>; Mehdi Djait
> <mehdi.djait@linux.intel.com>; Hans Verkuil <hverkuil+cisco@kernel.org>;
> G.N. Zhou (OSS) <guoniu.zhou@oss.nxp.com>
> Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org;
> devicetree@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> kernel@lists.infradead.org; linux-rockchip@lists.infradead.org; G.N. Zhou=
 (OSS)
> <guoniu.zhou@oss.nxp.com>
> Subject: Re: [PATCH v4 4/6] media: synopsys: Add PHY stopstate wait for
> i.MX93
>=20
> Hi,
>=20
> Am Dienstag, 19. Mai 2026, 04:07:41 CEST schrieb Guoniu Zhou:
> > Implement waiting for D-PHY lanes to enter stop state on i.MX93. This
> > ensures proper PHY initialization by verifying that the clock lane and
> > all active data lanes have entered the stop state before proceeding
> > with further operations.
> >
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> > ---
> > Changes in v2:
> > - Removes redundant register availability check
> > - Uses read_poll_timeout() with dw_mipi_csi2rx_read() instead of
> >   readl_poll_timeout() with direct register address
> > - Fixes stopstate condition logic
> > - Check PHY stopstate after sensor enable instead of before to ensure
> >   correct timing.
> > - Optimize PHY stopstate polling parameters (1000us->10us, 2s->1ms) to
> >   balance performance and responsiveness.
> > ---
> >  drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 36
> > ++++++++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> >
> > diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> > b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> > index 92178a3dec5d..8a34aec550ad 100644
> > --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> > +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/clk.h>
> >  #include <linux/delay.h>
> >  #include <linux/io.h>
> > +#include <linux/iopoll.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> >  #include <linux/phy/phy.h>
> > @@ -35,6 +36,8 @@
> >  #define DW_REG_EXIST		BIT(31)
> >  #define DW_REG(x)		(DW_REG_EXIST | (x))
> >
> > +#define DPHY_STOPSTATE_CLK_LANE		BIT(16)
> > +
> >  #define DPHY_TEST_CTRL0_TEST_CLR	BIT(0)
> >
> >  #define IPI_VCID_VC(x)			FIELD_PREP(GENMASK(1, 0),
> (x))
> > @@ -65,6 +68,7 @@ enum dw_mipi_csi2rx_regs_index {
> >  	DW_MIPI_CSI2RX_PHY_TST_CTRL0,
> >  	DW_MIPI_CSI2RX_PHY_TST_CTRL1,
> >  	DW_MIPI_CSI2RX_PHY_SHUTDOWNZ,
> > +	DW_MIPI_CSI2RX_PHY_STOPSTATE,
> >  	DW_MIPI_CSI2RX_IPI_DATATYPE,
> >  	DW_MIPI_CSI2RX_IPI_MEM_FLUSH,
> >  	DW_MIPI_CSI2RX_IPI_MODE,
> > @@ -87,6 +91,7 @@ struct dw_mipi_csi2rx_drvdata {
> >  	void (*dphy_assert_reset)(struct dw_mipi_csi2rx_device *csi2);
> >  	void (*dphy_deassert_reset)(struct dw_mipi_csi2rx_device *csi2);
> >  	void (*ipi_enable)(struct dw_mipi_csi2rx_device *csi2);
> > +	int (*wait_for_phy_stopstate)(struct dw_mipi_csi2rx_device *csi2);
> >  };
> >
> >  struct dw_mipi_csi2rx_format {
> > @@ -139,6 +144,7 @@ static const u32 imx93_regs[DW_MIPI_CSI2RX_MAX]
> =3D {
> >  	[DW_MIPI_CSI2RX_PHY_SHUTDOWNZ] =3D DW_REG(0x40),
> >  	[DW_MIPI_CSI2RX_DPHY_RSTZ] =3D DW_REG(0x44),
> >  	[DW_MIPI_CSI2RX_PHY_STATE] =3D DW_REG(0x48),
> > +	[DW_MIPI_CSI2RX_PHY_STOPSTATE] =3D DW_REG(0x4c),
> >  	[DW_MIPI_CSI2RX_PHY_TST_CTRL0] =3D DW_REG(0x50),
> >  	[DW_MIPI_CSI2RX_PHY_TST_CTRL1] =3D DW_REG(0x54),
> >  	[DW_MIPI_CSI2RX_IPI_MODE] =3D DW_REG(0x80), @@ -556,10 +562,19
> @@
> > static int dw_mipi_csi2rx_enable_streams(struct v4l2_subdev *sd,
> >  	if (ret)
> >  		goto err_csi_stop;
> >
> > +	if (!csi2->enabled_streams &&
> > +	    csi2->drvdata->wait_for_phy_stopstate) {
> > +		ret =3D csi2->drvdata->wait_for_phy_stopstate(csi2);
> > +		if (ret)
> > +			goto err_disable_streams;
> > +	}
> > +
> >  	csi2->enabled_streams |=3D streams_mask;
> >
> >  	return 0;
> >
> > +err_disable_streams:
> > +	v4l2_subdev_disable_streams(remote_sd, remote_pad->index, mask);
> >  err_csi_stop:
> >  	/* Stop CSI hardware if no streams are enabled */
> >  	if (!csi2->enabled_streams)
> > @@ -871,11 +886,32 @@ static void imx93_csi2rx_dphy_ipi_enable(struct
> dw_mipi_csi2rx_device *csi2)
> >  	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_IPI_MODE, val);  }
> >
> > +static int imx93_csi2rx_wait_for_phy_stopstate(struct
> > +dw_mipi_csi2rx_device *csi2) {
> > +	struct device *dev =3D csi2->dev;
> > +	u32 stopstate_mask;
> > +	u32 val;
> > +	int ret;
> > +
> > +	stopstate_mask =3D DPHY_STOPSTATE_CLK_LANE | GENMASK(csi2-
> >lanes_num -
> > +1, 0);
> > +
> > +	ret =3D read_poll_timeout(dw_mipi_csi2rx_read, val,
> > +				(val & stopstate_mask) =3D=3D stopstate_mask,
> > +				 10, 1000, true,
> > +				 csi2, DW_MIPI_CSI2RX_PHY_STOPSTATE);
> > +	if (ret)
> > +		dev_err(dev, "lanes are not in stop state: %#x,
> expected %#x\n",
> > +			val, stopstate_mask);
>=20
> Did you actually test this on imx93? I'm trying to get my imx327 sensor t=
o run,
> but only run into this error message:
> dw-mipi-csi2rx 4ae00000.mipi-csi: lanes are not in stop state: 0x0, expec=
ted
> 0x10003

Thanks for testing. Regarding the lane stop state error on i.MX93 with imx3=
27:

This error indicates the CSI-2 lanes are not in LP-11 (stop) state when=20
expected. Please check:

1) Verify the sensor PHY is in LP-11 state before returning from the sensor=
's=20
   s_stream(1) call. The CSI-2 receiver expects lanes to be in stop state=20
   initially.

2) Check if the imx327 driver has a delay between starting the stream and=20
   returning from s_stream(). If the sensor transitions PHY out of LP-11=20
   state during this delay, the CSI driver's lane state check will fail=20
   when it runs later. The sensor should remain in LP-11 until the CSI=20
   controller completes its initialization.

You may need to remove any delays in the imx327 s_stream implementation, or=
=20
ensure the sensor stays in LP-11 state until the CSI receiver is ready.

If possible, could you share the imx327 driver code or check its s_stream i=
mplementation?

Best Regards
G.N Zhou

>=20
> Currently I'm using this DT node:
> --8<--
> mipi_csi: mipi-csi@4ae00000 {
> 	compatible =3D "fsl,imx93-mipi-csi2";
> 	reg =3D <0x4ae00000 0x10000>;
> 	interrupts =3D <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
> 	clocks =3D <&clk IMX93_CLK_MIPI_CSI_GATE>,
> 			<&clk IMX93_CLK_CAM_PIX>;
> 	clock-names =3D "per", "pixel";
> 	assigned-clocks =3D <&clk IMX93_CLK_CAM_PIX>;
> 	assigned-clock-parents =3D <&clk IMX93_CLK_VIDEO_PLL>;
> 	assigned-clock-rates =3D <140000000>;
> 	power-domains =3D <&media_blk_ctrl IMX93_MEDIABLK_PD_MIPI_CSI>;
> 	phys =3D <&dphy_rx>;
> 	phy-names =3D "dphy-rx";
> 	status =3D "disabled";
>=20
> 	ports {
> 		#address-cells =3D <1>;
> 		#size-cells =3D <0>;
>=20
> 		port@0 {
> 			reg =3D <0>;
>=20
> 			mipi_from_sensor: endpoint {
> 				data-lanes =3D <1 2>;
> 				bus-type =3D <MEDIA_BUS_TYPE_CSI2_DPHY>;
> 			};
> 		};
>=20
> 		port@1 {
> 			reg =3D <1>;
>=20
> 			mipi_to_isi: endpoint {
> 				remote-endpoint =3D <&isi_in>;
> 			};
> 		};
> 	};
> };
> --8<--
>=20
> Am I'm missing something?
>=20
> best regards,
> Alexander
>=20
> > +
> > +	return ret;
> > +}
> > +
> >  static const struct dw_mipi_csi2rx_drvdata imx93_drvdata =3D {
> >  	.regs =3D imx93_regs,
> >  	.dphy_assert_reset =3D imx93_csi2rx_dphy_assert_reset,
> >  	.dphy_deassert_reset =3D imx93_csi2rx_dphy_deassert_reset,
> >  	.ipi_enable =3D imx93_csi2rx_dphy_ipi_enable,
> > +	.wait_for_phy_stopstate =3D imx93_csi2rx_wait_for_phy_stopstate,
> >  };
> >
> >  static const struct of_device_id dw_mipi_csi2rx_of_match[] =3D {
> >
> >
>=20
>=20
> --
> TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht M=FCnchen, HRB 105018
> Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> http://www.tq-group.com/
>=20


