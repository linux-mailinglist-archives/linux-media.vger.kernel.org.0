Return-Path: <linux-media+bounces-67434-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id e7SADfmbVGrkoAMAu9opvQ
	(envelope-from <linux-media+bounces-67434-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 10:04:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D777487B4
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 10:04:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=PNLyo1ru;
	dmarc=pass (policy=none) header.from=renesas.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67434-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67434-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3E4B301D309
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 08:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02230396D1A;
	Mon, 13 Jul 2026 08:03:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011050.outbound.protection.outlook.com [52.101.125.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3684D3A48F1;
	Mon, 13 Jul 2026 08:03:34 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783929818; cv=fail; b=FgV9oG3/w3KFVH2tWBB0iKEAY0DKYWZ134SG9WfzOScysZ6HcNcOzveyafNlgOQv4MJPxpy+CEmSyQdqYyCX44lwaS6rjuGC8nDSpP//y5rJV2v2dyXkOkaW91THC9JKluL9olgboCO3q6uR6cxVLFavD8/3CMD+OQuiwDHVz4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783929818; c=relaxed/simple;
	bh=EN/WRb9kiwxpEdLDkMHPZxca36qwDROujW2CWAJMiQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NaVtO5TqX+iSaJY3juberp0dpSLtHKEtD9QKrTc/QoFQ6pVnAoiHPYjAkSio6Olv4pxJJjlKV3cg7T4SNoYG0dQPrxwSVKh6gsDdm6LX0nBxsNXHjG/AquXSNpj21a6xeEt7VXod/KoAgmMYkix5wJ4R4yvYna1/KO+TwjPjiPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=PNLyo1ru; arc=fail smtp.client-ip=52.101.125.50
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tzxreROahcuAW+dCy0jIbSus3ys3de5Sh+ZDexoQX9AzAA506v0kPrIPvAiVWF9vgNrlqaqnKt5KaAvF3LStwYXFWxJT0xI3NLcJ6B7i6B3nlUgpDFGcUZS/NzQO3HrchUYiCNR31iHsuR7jflQtAPcrOK//aO/hrKPs8GpM7RFPuh+oi1VgfRqwTpW4CmT9i0AXiuGPnkSuiPUQEMPu+KDSmJyx2f5SIT74CJfh2SOavU8WSDkEQBh7QOiMpl4nW7i5Xy+KMq3mJCphauDEaZ82zIsXslH9Ev16Z+Z5iluYmrue5PfYYIYn5cG1TMOJlmosYP7gM4oSk9ha3q5sAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bZANI5/9ZKEyktP2x89FIdPQom6CXt2tLKOU1MeXjP4=;
 b=I5qOpezkeZLdcSZRB9ivqt1yEuS3SSh9BOcd0B1B94ckBBTOANyKBxgwfudUwQcglmFblQ63+udoc7fTeLgJDv0Y3+0aLuZ5xOykI2W6rh+lq0hwbUE+aKTDBzstzxS3e5BE511uZbiN2QRj4TokKNHpWEAXlo3rLrPdxpap3zy8AoRYz7sXYES3bftBPrKjBSg2EdEwOMkeCwazYwJi7E0N6op2xGjE9eG1nM/iavPGnb9r5TPf9E1S6CL08hEBKxBOb2dvCQ1FGJj5uvrMDm0TIHMR05RNY8QZawuCufYADw9drn0FjRYSp4Q8Jn2VMiVxttFmBlIsRpy67zFwkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZANI5/9ZKEyktP2x89FIdPQom6CXt2tLKOU1MeXjP4=;
 b=PNLyo1ru3QgOVQdTftFZsCE52CSr/00CFRyWyZjkN1qrOq58Ol17xSzIEceKV7z9rg6xgSVsn1+x44obU2BBUI7npsZUzCXcwWVecIt+hA1+/T4Ffg8xiBfM5zXXdjR/wRiXKWmLJDhPV79SJJqnPtqxEZiCElGTVo/kX14xBzQ=
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYCPR01MB11657.jpnprd01.prod.outlook.com (2603:1096:400:3b8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 08:03:31 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 08:03:31 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	=?UTF-8?q?Sven=20P=C3=BCschel?= <s.pueschel@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: [PATCH v4 1/4] media: v4l2-common: Convert v4l2_fill_pixfmt_mp() to static inline wrapper
Date: Mon, 13 Jul 2026 10:02:50 +0200
Message-ID: <20260713080259.21835-2-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260713080259.21835-1-tommaso.merciai.xr@bp.renesas.com>
References: <20260713080259.21835-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0217.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::9) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TYCPR01MB11657:EE_
X-MS-Office365-Filtering-Correlation-Id: 4022924b-23e6-435e-289a-08dee0b53adf
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|52116014|23010399003|366016|1800799024|3023799007|18002099003|22082099003|56012099006|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 6CUukg+j9uNIQbx6d/bG102Yax7NTrovI4Hk8SNge0AbuonBg9UUlxzzXliSGT/h2bfle2SvGe1Glgs4LPdQjklHBbGNcwqIFBS6mxJNKX6RoBMkPpgKswLgr7lIWD3dfmTOqcvUhA8ehEtI56DQTDsBawzTMEw1gEM79yN49oSfLL/Uo78gAPxlOHz6W5x7R9NSdmJ21FAXxypCO1x+Yjb4xhWri3E3QKHuecab+jRt1lmbGboRm23TmwSshZss1L142Qu1q44lHsr3seFujA4VkWP1piYguW72dDKPLeXttsOVNP7wmtI21uTV71SlvUF1OG8E3bORTIxzlnQNLhIz67UXhR+5ldPk6XG5TP1x0wUYPjR8uOyJC4W385vsXbAPdf0ea9qICa30J0sTypF2clmDUkUGp8xgK8C8+0cqwHmP2ZoBy0b/x6bvh+qbslwSzikMne6G7EYVA7DQjo2CPit6h1Pq60Msl2zbWka+D6klLucmPIUIyIEA0Yb3Fs+qdBvAjUE/ChflgY8Xe0vHe9Li4UCzX4Vp50EUogsZQ5fYSoIv+j0EraHyg2LBIAXdM81pfdSIeBuORheiSkwYnDyPmBWCL0ZX6x2xhWh96YPDn6gJOKFGCMSeBcjVBoIMDwTMekNnQAoc1P/Uyhhu8j+nEGZpikdfWTGxq8FcvdtCfV0lMNM3zJmpOlVgtnEaF6HGWM0vovCKh0P3L6ITyToaN6iUKp9qAWKIG/U=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(23010399003)(366016)(1800799024)(3023799007)(18002099003)(22082099003)(56012099006)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?MWXRLsMRfqLD+tOkmEqfOGZRBHuENORd1SwFwa+BuXt/J0V4udIjr24SaaYm?=
 =?us-ascii?Q?yUZkKuNsokDZoiAIbBVQDb9hB/R0HGjFvPIM+mS7KTyfxGIS2t1skBqIhmk3?=
 =?us-ascii?Q?hgZBVymuYlw0pC1+IR9po6hckCk7L3mShuPyFhv7f+Rxxx5LkqcWI9Qz6eBp?=
 =?us-ascii?Q?nfzlZSJYCrw7AddMw+6MzxOTF0/qXpTYqIzCZ34WhF9GMpwFq6zB0S1ig0sO?=
 =?us-ascii?Q?g7RK3ywTxsqamYYC63H8NCJEJOyHMG2nXIm/cEKkB/th5Xt3TqXBZRr0yE3D?=
 =?us-ascii?Q?AOzU88jb0HXa/+6l9KIlIoPULjNy2OacaygJR1BzODXks3KYvZw09X1Uwb4a?=
 =?us-ascii?Q?XGlr1w4Zkb74Ty6E4WZqxB8fzTyX32OWEL80IrfBUl3Jw6a183ycwvswvCBa?=
 =?us-ascii?Q?RXvxDGeX8zfziIb+bGZvD325GLR0MskOLOjqM3xCRwzeiLpvfLiwzvZnGQbf?=
 =?us-ascii?Q?YJCv6Y79z7Fo5c1H0DcZ2Itnynfb+r9oTPWXyrzkpOtvSsfd2nXt5PklJFMG?=
 =?us-ascii?Q?xVSh+yCD7CrbPtaJJvAddQHFB38uuSkgoZ7xVoPYY5gsPAxsJyKK06f4e/RT?=
 =?us-ascii?Q?mQakcLL/SKHUJLEcADgw7ZndcsF1ZdhKvAZD6Ls9lCivBYoE0PMJpDwDZZW9?=
 =?us-ascii?Q?euzo/rDYUcnKm/1hyEbAU9rSRjhD/l1jGiwXXdQ1leZ6tuaquudZp1XgON23?=
 =?us-ascii?Q?/EtZVGtdrN2VsPSDWYrbHV/w9TGgUMAq67yhLKoOr4dxpCAlQz3oEFn9F6rE?=
 =?us-ascii?Q?ZLUeblW888Af/HAIUlMw7fBLUbvSk8IuLtFfdjf1Ft8aw44x71ydl5/J2T2w?=
 =?us-ascii?Q?cRGdGYQZIyCtLjBQrybzyU+erCsB+fm8BEx43jwxqqQ2WPEAvvWn9GqNx/1f?=
 =?us-ascii?Q?/kYiUuJD6w+RnN2eFdqh9Q0IjyMxvNpm+ebhmTbtL9VBUIqqUfRRrU37qMft?=
 =?us-ascii?Q?7xOauBNd9NE6Wgftb3JTifSKvrXQIS9b04+BDY5FGVsEqFQQQqLJ0n4opzWi?=
 =?us-ascii?Q?ZRbOkYNpCQfpeXbZ8kA2Fb1v73vJ5FdVPhwXbVsBNczXGx/AdV2RHWJJialn?=
 =?us-ascii?Q?5KcVYyAsaOVl4qv2+aWh6C0t0YtVfXRr/Ej1vt7DewBFO0x+zfk7c8j/adsm?=
 =?us-ascii?Q?f5hs2G/wpTxh0bx6AdSweHedz9r0BSVdr4lRYD2gMKXD6fwyx0q2GjD4TL0O?=
 =?us-ascii?Q?mX5lHputUh2VHn5eY4MK5iLofwk/tAgNfDuEDB/iHPXotzy2dJbYB3Vo2A3k?=
 =?us-ascii?Q?CExWiGDq98dU+xGTKAFZLEZsqX1FeyxHvaGjsN0QLEqNRVrDt4/Oc3Fw+9Mh?=
 =?us-ascii?Q?zbVeDiEQiPda3JTIDT/pv1Sn0l1eilL8nbesVcB0x96K3ATiBCBQQbaLf/Q9?=
 =?us-ascii?Q?y0W7W8PDNppIEfgHopLV/ktKTelewYL5UkOeF3lZAh1IcfP56ojhAhQEwdJa?=
 =?us-ascii?Q?jHYmZn+ADadYkLW1WHhkwFH+2NGSQCjBUKQUfW4EXQak4fjotmVohtlIdsd0?=
 =?us-ascii?Q?SpilAI/sZFdP45CBU9D7bXLEDDWk9auZiyijii638P3HlM16H7xyiqSYF5gc?=
 =?us-ascii?Q?D2X2MCvIXPFPk0XIrgXWtPqC4hFfYmBYKWRY+iE0wLZhjd/fJNbMaai6FUO2?=
 =?us-ascii?Q?/N/YgUTGoZV5VhB07b8QUfKpDUgqRxFX2WOx6jLb/hwttmT8ulIVk2pDWepp?=
 =?us-ascii?Q?EBMOhGbHqYYCZZJ7UGJSG3xLicVYHV3aHOK1FhIHlQ+qgyN06LjaCXVcdND5?=
 =?us-ascii?Q?bctaEvpRAP5BuHgntKWFp7Yso4WRIyEdA+I3KM/p8gs7eq0vPWV7?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4022924b-23e6-435e-289a-08dee0b53adf
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 08:03:31.8007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rx1AYgE5CgFvwrDkYi0AawFoM2GJHxETC1ulogN91TtSefsSYVfrpEoPQEiHnciPlp9B6vvMgPf/G71Lfs1o4YJzibnRsouj5ZtxxphnJZQPbVdk3LJm7vTKwM2PWgyw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11657
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67434-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jacopo.mondi@ideasonboard.com,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:nicolas.dufresne@collabora.com,m:laurent.pinchart@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:s.pueschel@pengutronix.de,m:m.szyprowski@samsung.com,m:mehdi.djait@linux.intel.com,m:isaac.scott@ideasonboard.com,m:paul@crapouillou.net,m:dan.scally+renesas@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,m:tommmerciai@gmail.com,m:hverkuil@kernel.org,m:dan.scally@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,bp.renesas.com:from_mime,bp.renesas.com:dkim,bp.renesas.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 53D777487B4

Convert v4l2_fill_pixfmt_mp() to static inline wrapper: drop the exported
v4l2_fill_pixfmt_mp() function from v4l2-common.c and replace it with
an equivalent static inline in the header that delegates to
v4l2_fill_pixfmt_mp_aligned() with stride_alignment=1.

Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v3->v4:
 - Collected tag.

v2->v3:
 - No changes

v1->v2:
 - New patch

 drivers/media/v4l2-core/v4l2-common.c | 8 --------
 include/media/v4l2-common.h           | 9 +++++++--
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 65db7340ad38..54995ba8c20d 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -537,14 +537,6 @@ int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
 }
 EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_mp_aligned);
 
-int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
-			u32 pixelformat, u32 width, u32 height)
-{
-	return v4l2_fill_pixfmt_mp_aligned(pixfmt, pixelformat,
-					   width, height, 1);
-}
-EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_mp);
-
 int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
 		     u32 width, u32 height)
 {
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index edd416178c33..749fe38c134e 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -556,13 +556,18 @@ void v4l2_apply_frmsize_constraints(u32 *width, u32 *height,
 				    const struct v4l2_frmsize_stepwise *frmsize);
 int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
 		     u32 width, u32 height);
-int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
-			u32 width, u32 height);
+
 /* @stride_alignment is a power of 2 value in bytes */
 int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
 				u32 pixelformat, u32 width, u32 height,
 				u8 stride_alignment);
 
+static inline int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
+				      u32 pixelformat, u32 width, u32 height)
+{
+	return v4l2_fill_pixfmt_mp_aligned(pixfmt, pixelformat, width, height, 1);
+}
+
 /**
  * v4l2_get_link_freq - Get link rate from transmitter
  *
-- 
2.54.0


