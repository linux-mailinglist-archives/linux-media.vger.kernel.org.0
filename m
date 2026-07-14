Return-Path: <linux-media+bounces-67554-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UDudHZgOVmp5ygAAu9opvQ
	(envelope-from <linux-media+bounces-67554-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 12:25:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B016D7535E8
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 12:25:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=siliconsignals.io header.s=selector1 header.b=Jv66GRIS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67554-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67554-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=siliconsignals.io (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27D17304E335
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 10:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9866036DA15;
	Tue, 14 Jul 2026 10:23:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021125.outbound.protection.outlook.com [40.107.51.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CD8363C60;
	Tue, 14 Jul 2026 10:23:11 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784024593; cv=fail; b=jXCsrYVnUaQzg/eaNILayKXzbYnUD1IwQjLdPEjFSuj8PrK5EYeIBIQXbs+yIt7AsMfic/6EW6hPAmJH+1heM9KMazcuxfeycFkfxHEx13XZR6P87Gh1sDmOZEB5+byrWGVeWuQAzv+J8TrQLAwrPaXUg3QBq7X6D80L2klkPyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784024593; c=relaxed/simple;
	bh=DSyg9tpTBmID65mCD+tMDXBsdWv/VWjyyY4lDP/Q/kU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SxQtt5IpA7g/i63LUE8CrGkZHZqPrNFmZsWqOA4znqnaW+4Fu8IF8/8Z1hVrA+bPhjjleU9CWdXTrIK1nbQgW6/cxykBR2Rz4R08VtoTzvePrwQqf0nNT8GHcnTHIs2MgfQih2EDFjBLzSHof/ph5+6xNkPC3s7ANhpDYbbqI7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=Jv66GRIS reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.51.125
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vbrytaZ4KCYhOh6lKUnWbCOoHn2BVWDB0G+tFVjxcsUBlzWGXOnpFemKxp0G1kQt6J4RFtBFwSykDtXl9XjpqqOG/oqEvmGNQDLIZoo6YcrjW427f1JOe66EbE1pXBmo1RFPOeBSwc4Dl4j7FH2kMPNEN0trZO8DK5SGJ5AHrT0fpieihjEoALX6ytTcXteyUgaPOeI97effHY+pzoKEVWMRAideHj69tYBAFKp5FborPb4o7G5mx8jVqhbNaeDU6HyN0ymx/Y19MF51CQ251IecZaMOazd+ExLE+qNvKs3T+7557AGHx421LMdWqrrGwRB3eHi1IZdY5o3bT48kqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rj6y7fMEfawzWVadMM7sCMqWdhGB7qO9eS9ocXGh7C4=;
 b=p9v9ew4lct3hbUJZ8vUzj2ZuD+IZqwXyy6RHi3tEvuTFRXMMi/XC8MzwAV/5yxtgoO/VXyQ+rHjv2KWQuqKr30Mt5Wsg1jYB/2hd2eXE36XDWktU6/6nzkjNVWe77ICw6VojiitFdUH1x6MNdZ3NkPSCnjcx90h9Qv1gD9S/wnjTJlAfa7AmqCVAvRYeCVBLkONQaS4DzcTue9YU3tVukgh9KZamulERAfQYEaNq5RDFMn+/AzNlEh5ILXPCi6Y96tY7qzx2W/GcDy0tbazQM5fmHWt7lQJy/SRTcfxXlbkewI3FpUO5PN9TMSWVT9O5n5ebkTMGa+1i9pdvbaxeNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rj6y7fMEfawzWVadMM7sCMqWdhGB7qO9eS9ocXGh7C4=;
 b=Jv66GRISG2pS7xGpoMgqMdwaQbXm+ZcohMAbAIISBoJl3NMzQB6frZS1N+7MPidQkId9ScWxFx4bPya97S0o2o/5Mf/jBkQ7Q+aD7ugYe6YMGORHE5q0obbzgYy45Df3TszlJgUVyuSDEN5wRHJqLiLkn1P7mnsNiLPzMqYFyAhsg0Xyi9MN7ewNMYpm58CIoV3NHtSAFJXLL4utHS0nQfXdpsxeFY6aqPPeA8WXY6oKBwaWDG9ZInTpPiaPJxIRuw7ZFBABaTfgaug2fOQDHpS1aD/Zf6hpCVpU7/CCtA9SBVlJhJHTK9CqUwi6YSFKSYey5KPiYaQ+Z/6LBR6Y7Q==
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11e::14)
 by PN4P287MB4902.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2eb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.20; Tue, 14 Jul
 2026 10:23:07 +0000
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167]) by MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167%6]) with mapi id 15.21.0202.018; Tue, 14 Jul 2026
 10:23:07 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Tarang Raval
	<tarang.raval@siliconsignals.io>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, Hans de Goede
	<johannes.goede@oss.qualcomm.com>, Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>, Mehdi Djait <mehdi.djait@linux.intel.com>,
	Xiaolei Wang <xiaolei.wang@windriver.com>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Sylvain Petinot
	<sylvain.petinot@foss.st.com>, Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] media: i2c: imx412: Convert to CCI register access
 helpers
Thread-Topic: [PATCH v2 1/3] media: i2c: imx412: Convert to CCI register
 access helpers
Thread-Index: AQHctSN++RjrNl/e2UmJiKFogo9yn7ZtazOAgAAe7t4=
Date: Tue, 14 Jul 2026 10:23:06 +0000
Message-ID:
 <MA0P287MB21789AF2D9584C75F4D7D5E388F92@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
References: <20260316090059.121605-1-elgin.perumbilly@siliconsignals.io>
 <20260316090059.121605-2-elgin.perumbilly@siliconsignals.io>
 <alXzKeKnDPk99Y5m@kekkonen.localdomain>
In-Reply-To: <alXzKeKnDPk99Y5m@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB2178:EE_|PN4P287MB4902:EE_
x-ms-office365-filtering-correlation-id: ffee0e22-344c-4251-3d19-08dee191e577
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|23010399003|4143699003|56012099006|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 JjaRfwQf7DCEx0mphEt3Gzl0SDye8lK67CkPBbHP5Tfg3sCvG82jHr57wiaW3EGbXWcBNY2bufKKJaDyaVTtEVXSuhdWHvpuFNi/hCvCXSfCkromXSB3nUX/NwJSNxDwFKCcSysjLH/FcxhXpYpPOJ2rQ46Ed6dYzTOcHNxYcH091FevUvIC7mDsR7gcUrmCP8ubzu1p0S0uMMcmB9MLdk989jUAjKiMo7AChwMWcpmNfvm1BN6YIEd7dKdJIVFDBAZq0m2DyWxq7fbr5sDsWnA/6y8xm0aG0v6M7QOImoOnz54smDPmboYyCxhu4F7Mcx6+Bo2IhO/CHJ+pulz8KaApF32J+f2jMHiYOmVmjCXy7/xCXDXoOwGSeMdMWUlkGJG8gZhBD8gfCaVJEbUvYJcyhd67VfhUk3JC4OSfnckjq+P05xiGMh2PKlsv5Bs+leiIOIJWjoCpx3zf9B+I07LZ9V+R4X1i9dGyGn4fB/eLLFZwSLBDZ3HptqlSYMudRdU+5kQysoN7Rb8XV8OcAxyl2/JeYc8UTorgP+EkCUoBCRnDcYuKAxy2OPwnFWEI3Q5WIoyflZWY8tlEloh4Qff2IfnweB4lU3CsbUjvtMkc6vkCyQ+fh6qEOx6pZpkpPt1YnCslR7lfWUU2wfkOKikjeeTKQUz3mha0xKDgZtIzGSli/BGUYDVteo5qdfDeEgDQZmt2n2GXxCjfDbyxNS8hhzA0hFG4QxtEkz9755o=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB2178.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(23010399003)(4143699003)(56012099006)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?yqXDO9dwg0mRnbAWM7hMvi6Wgbl/25SIjNAoRHvB5dC72ygXoSa7RBB+2q?=
 =?iso-8859-1?Q?TKxItQFUAotTxbsVz13DnM3/1G0VzhIliv/z7Yc3G742YpatLUWUCQ47gT?=
 =?iso-8859-1?Q?Xfdd63z9BxugySjYMn0Q+Pf7Q8RkJEp6CB6HfqXFaHwifCcu1zFxdOAVjK?=
 =?iso-8859-1?Q?nVYcPrfK03h+oo4qO059kObkTlcuRDfXMiyFwFcwv3E6OONEI6PF2Djs0a?=
 =?iso-8859-1?Q?qfnTtmr+AuOj097EOwFZxI3nJiq9gdXej20G1kB+RB0mLPg3Ar5dlOJ3/F?=
 =?iso-8859-1?Q?YfiDNYUpVjo6nOObSDJhAXL00z6OFWC0sMEDQsSY9W2uNtJpazG/3mv1BJ?=
 =?iso-8859-1?Q?cWHgxK6eeu4wtWojiS09CdrKEHC3lBHZY9/hGUiW51oyjOesEhiU0q86vv?=
 =?iso-8859-1?Q?UPweC2JWFSih59RQoH+b1QcBTSpdMYqM+vOl1L0d720HADUWkof2ow3bB8?=
 =?iso-8859-1?Q?HBI4pKclK1zAgDlmOg+CTanPr8lki+SxYXTUNp2pX65OhbfcWEQ6o0lIps?=
 =?iso-8859-1?Q?1fEZVRmrFhZ2A1qCOtCQ8el9LNenl94nWJe9Li/RDrqsvSBkE7vcCha81l?=
 =?iso-8859-1?Q?Xjq/xDFDstRNGg1SwxFA/OGTYf5Z6p1GFrPZc5EKtOS0rcF/tYNURmyYtB?=
 =?iso-8859-1?Q?5rWHwiR+ETOxAp3nXu7/OZ8Sj4/s35QzQPjwl4jdq3KlHTXG6HCdEVbUnH?=
 =?iso-8859-1?Q?TVATPMa+6059IXCzB89aoPEHOyw9agGbBk/tT27U7yF9kd58XoT541Q8UO?=
 =?iso-8859-1?Q?/DJz3jiiWa82s5HZqRP2tXAZTSZgjlXWlAUNC4MS0B9u4abQA7dJd81yvG?=
 =?iso-8859-1?Q?RvWxF0/cHlOcJh0oxle/9MOHW7jtSRVkaSEZTqqpYPIUV6HAd4Ra10N7sJ?=
 =?iso-8859-1?Q?lmuMmHanrLfqqiq8w2WtlYM7cSkN3MxET5bQo54t8y318WKtVpyN6I5H51?=
 =?iso-8859-1?Q?OT37a1z1ePDlqPHuJfeZZQGdKn8c06xvYg1FyUEoQrk6jOfhkBV4G8E5aT?=
 =?iso-8859-1?Q?R1vTllS9GtcGK3qI2HeErLVUId1yOm4Grn3UuR9wD7xCIeGWuB/p449w8c?=
 =?iso-8859-1?Q?MKVIxbOjhJOaYT5qYgFEjkBmRpgo9Ix+sivm5YTwUCQqgm2TsnhAwBuNHL?=
 =?iso-8859-1?Q?FhE224IqjT0c3Rr2yoWpKc2kB7+fm3GNPr+dbELPJnyXmza+kGP6ObvylX?=
 =?iso-8859-1?Q?er50ww1K2W4jxDtcuyDpw7I6h2q/RRLLYI+73QE1tQKtho6E89wgLFSgcP?=
 =?iso-8859-1?Q?uI8yhKWnEZ8ZPEHBUY5iuvieeVUm0izHDFa02jaMF+ToT3/py/JdKt0d5F?=
 =?iso-8859-1?Q?y2mi3an/5y8z/S/BEVI+iC7QpZucfuMeP6O/5gTdWwzs+iNbxCnqTDJk+l?=
 =?iso-8859-1?Q?wsXU0oOxNTo+32fFA3vDPGes/ZjLpQt+a0NCxXoElKM7D9M+7wBt29707c?=
 =?iso-8859-1?Q?mAxRSl4ovk2SWOybNq45M82OGWsMRwG90q9Tu0zQTAPUR2lg/wP5WztC50?=
 =?iso-8859-1?Q?wPHvkclRNlp3RNnc29BMKHHSFo+agBtSTKlgS2sbbe/mCPCU7QSsdy7OnE?=
 =?iso-8859-1?Q?UZFe6M7PHREu7WJ4yh+FY6NMJP5esIFgt2bdVJ9ZA7HiykVNjaww3HkDcn?=
 =?iso-8859-1?Q?ITNJLh+bwG2KDs6nPNICEuKvB40VEC6LU/MRYZJEuo7aUyIomgo2cEfclc?=
 =?iso-8859-1?Q?wxNKOVSD8KjXU3xmG9K5xEDV4QoP4cM4H3NKulDcRJEbK9SRSuV5UzbNnr?=
 =?iso-8859-1?Q?3INJvgu3Y6RyJbuW1Mj2Ofof2YUCyVsjMQ2xA7lAVk6nFHaSU9m7yega0n?=
 =?iso-8859-1?Q?PgmpB6ezYEhB3gm7eBKzsMiKk5jSnnI=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ffee0e22-344c-4251-3d19-08dee191e577
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2026 10:23:06.9074
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ru0Sk8um3/Y2wkFxRlOQbsUZX+Q/h3y1kiBIrOK2L4CsAjqGKi9ePdOYnytpt3Sa+VqqdYleWmtgK3Ry3/mZGipk2cmOkZoTb4AtOZySxaAdYAiKo8aoPpiS2dt9G+6j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN4P287MB4902
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[siliconsignals.io : SPF not aligned (relaxed),quarantine];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67554-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:tarang.raval@siliconsignals.io,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:johannes.goede@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:mehdi.djait@linux.intel.com,m:xiaolei.wang@windriver.com,m:laurent.pinchart@ideasonboard.com,m:sylvain.petinot@foss.st.com,m:benjamin.mugnier@foss.st.com,m:clamor95@gmail.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[elgin.perumbilly@siliconsignals.io,linux-media@vger.kernel.org];
	R_DKIM_PERMFAIL(0.00)[siliconsignals.io:s=selector1];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,linux.intel.com,windriver.com,ideasonboard.com,foss.st.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elgin.perumbilly@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,MA0P287MB2178.INDP287.PROD.OUTLOOK.COM:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B016D7535E8

Hi Sakari,=0A=
=0A=
>Hi Elgin,=0A=
>=0A=
>On Mon, Mar 16, 2026 at 02:30:54PM +0530, Elgin Perumbilly wrote:=0A=
>> @@ -543,29 +445,25 @@ static int imx412_update_controls(struct imx412 *i=
mx412,=0A=
>>  static int imx412_update_exp_gain(struct imx412 *imx412, u32 exposure, =
u32 gain)=0A=
>>  {=0A=
>>  	u32 lpfr;=0A=
>> -	int ret;=0A=
>> +	int ret =3D 0;=0A=
>> +	int ret_hold;=0A=
>>=0A=
>>  	lpfr =3D imx412->vblank + imx412->cur_mode->height;=0A=
>>=0A=
>>  	dev_dbg(imx412->dev, "Set exp %u, analog gain %u, lpfr %u\n",=0A=
>>  		exposure, gain, lpfr);=0A=
>>=0A=
>> -	ret =3D imx412_write_reg(imx412, IMX412_REG_HOLD, 1, 1);=0A=
>> -	if (ret)=0A=
>> -		return ret;=0A=
>> +	cci_write(imx412->cci, IMX412_REG_HOLD, 1, &ret);=0A=
>>=0A=
>> -	ret =3D imx412_write_reg(imx412, IMX412_REG_LPFR, 2, lpfr);=0A=
>> -	if (ret)=0A=
>> -		goto error_release_group_hold;=0A=
>> +	cci_write(imx412->cci, IMX412_REG_LPFR, lpfr, &ret);=0A=
>>=0A=
>> -	ret =3D imx412_write_reg(imx412, IMX412_REG_EXPOSURE_CIT, 2, exposure)=
;=0A=
>> -	if (ret)=0A=
>> -		goto error_release_group_hold;=0A=
>> +	cci_write(imx412->cci, IMX412_REG_EXPOSURE_CIT, exposure, &ret);=0A=
>>=0A=
>> -	ret =3D imx412_write_reg(imx412, IMX412_REG_AGAIN, 2, gain);=0A=
>> +	cci_write(imx412->cci, IMX412_REG_AGAIN, gain, &ret);=0A=
>>=0A=
>> -error_release_group_hold:=0A=
>> -	imx412_write_reg(imx412, IMX412_REG_HOLD, 1, 0);=0A=
>> +	ret_hold =3D cci_write(imx412->cci, IMX412_REG_HOLD, 0, NULL);=0A=
>=0A=
>	return cci_write(...);=0A=
>=0A=
>I'll fix it while applying.=0A=
>=0A=
=0A=
Thanks for the review.=0A=
=0A=
>> +	if (ret_hold)=0A=
>> +		return ret_hold;=0A=
>>=0A=
>>  	return ret;=0A=
>>  }=0A=
>=0A=
>--=0A=
>Regards,=0A=
>=0A=
>Sakari Ailus=0A=
=0A=
Best Regards,=0A=
Elgin=0A=

