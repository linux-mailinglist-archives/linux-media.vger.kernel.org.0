Return-Path: <linux-media+bounces-66972-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E0VOHaAyTmrhGQIAu9opvQ
	(envelope-from <linux-media+bounces-66972-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 13:21:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A32724D96
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 13:21:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=siliconsignals.io header.s=selector1 header.b=DbaXqI3S;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=siliconsignals.io (policy=quarantine);
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66972-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66972-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85C373085CEC
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 11:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AE9940FD9B;
	Wed,  8 Jul 2026 11:11:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021118.outbound.protection.outlook.com [40.107.57.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393EE221546;
	Wed,  8 Jul 2026 11:11:11 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509073; cv=fail; b=ihuXOXvYObLxfS/TO5jwaMwNQ8G2Nf6OKOQk6RqAgtnMnr4xa81A0DSW//C/xsgOp8HOrMfBxpLbiyiGUGEjZtiLq/IzjJLmH+J6BJPjXebkjHgOnIm4nwcFEtv4lCJBFstuyg0qpcl+xeT+bq6v4q3kaB/A8RAMLbZShfrbOnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509073; c=relaxed/simple;
	bh=p+/9350UqbuRVhZ/R4PH5MmGoPoiqo5JlBSEeTnZ6FM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p56QdBfN1ZuwbLWmhbe4aIRZtSjX5qtAQZ748wjcw7UWWYywNBSM/hz+Vg9G21kuqv6sZ8lRh6aC8VVu3a/d/HLoGYsrEpQDGIFUNpPkiFjnQof7IijYxJIhu5DlHlkfsKp908tq7BDt1LBNsT5nMIOV8FNJhDpNRtxaQIwJuRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=DbaXqI3S reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.57.118
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hmz6Z661TRsB7+7E//OW2e4tSqocIiB5gNQTl/7IBeTE/CPkwnFudEmiKMr74vmroqsUoz5406OaSmkQQwdXPeyDLdXGxUUNpL6SSoOJw3bq1ToqVrzyQZSwu7ZV1LNotmuCZJJA/1eTQNqhr8cZVXOP+6MEw8/OhpujfD2VcDEP6onRQ6yeg0G5qv76iYqk3ly0qUVIodfiTGr2nD6GuzGMaa1WShUxnT54CPntw77KVZwQKoGSgclNo6F03Ulwev8DnCfXrC2C//wQAPp7zxVfqc8X0V86CENQYqcUuMIDXZvd1yxA96ik1hYswm3m8usKFRIb+nkuwYoViyzfFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K93PPdVfWCIrohGRE/toKciv63GUopVMKm/pf1B+Mzk=;
 b=RKxYLJz7164ayDBP3IvCT4Wr09jLlmMDo/3fEGTRKWF3Jss/reZHiLcT0GSMhjPGpKaGuI7ZikmJJIDAwthvVVorERt1G5t7RX2TvNAOQO7SNc90dp0fbuJEGdISFkhZd2H90iS6RkEjqPp/EDsHWd55vuo6iQY2TtGlbc88VVo0Yz7SJesJkOAIzQsQq8Dg/mlq+QW+kFXuXI5b6yWRk9Kewk+P3U+AqgzbUD+wEBspwwvqIZj7Eek/RBqKD3+MNWLoUenjXpscm7aWHinE6jRVnZdtvrrMQVnocg8P7817cTRyhtmSRrjBHz+Up30sl5n7Q6+i6YEGCeaFD+CBkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K93PPdVfWCIrohGRE/toKciv63GUopVMKm/pf1B+Mzk=;
 b=DbaXqI3ScZIc0ORobpLb3mWKqbFKq38rToIL2VAyJQ4AC/YCNIoYMTbxZPY9jMjzVTlE6DH52WrtTmB7tRaZ6xsncYDRt9e5eBb0Nk/ahJY3Tg9JsZLbmbeaUHYx3qgvIfDPBUIBFNLld/z8vKmCph7jaHlPM+7obhffh3jgXwxjNWxuqiWdREYJ7kRLdBU1XeMZVTaruexuSSoE8RjEZpY5Z2A1nmcsQY45K8eWC5cNR6L1LsSkjmRISAYnEDKfb9OWaXhCYWNFHf4GqlP0+m34w5bIbhFWFRD071T7An9W/hYsbqpbIzq26ZDFVWvcR92hMlHLfmQ3L6IxN01Q0w==
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11e::14)
 by MA5P287MB6144.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:236::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Wed, 8 Jul
 2026 11:11:08 +0000
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167]) by MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167%6]) with mapi id 15.21.0181.010; Wed, 8 Jul 2026
 11:11:08 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	vladimir.zapolskiy@linaro.org,
	laurent.pinchart@ideasonboard.com
Cc: tarang.raval@siliconsignals.io,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Walter Werner Schneider <contact@schnwalter.eu>,
	Kate Hsuan <hpa@redhat.com>,
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/2] media: i2c: add os02g10 image sensor driver
Date: Wed,  8 Jul 2026 16:39:40 +0530
Message-Id: <20260708110949.31313-3-elgin.perumbilly@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260708110949.31313-1-elgin.perumbilly@siliconsignals.io>
References: <20260708110949.31313-1-elgin.perumbilly@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PNYP287CA0108.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2bb::11) To MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:11e::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2178:EE_|MA5P287MB6144:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bb54b23-bcf8-473e-2274-08dedce19c63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|376014|23010399003|52116014|22082099003|6133799003|56012099006|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	XXOW6bUhnBwKLH0jhJI6x7NnIAW3VVUSE+p3I7a9vLP40Auo3X7pmqzBjFt/fFypTpyT29hBYPXudTMsOZuXX3tt/M0PVJ4KUd9tiS4KNQlf3QVm2UNoi1xAaHv+Y95whySpbBI8If34i2qv6bvPZwqk34uI/6B/4houXAUnzl6Qg+Oj4wGkZm8b1hSimkoWFYQCtu0Fqa1yWpdj1wLgqon2T4SJJLF+05IFPSkzFMYbmvAw/lMYRc8p4HX2zO0F85JDavulDKB0og0CTq9fatqyY1lKiJ03mWid3LV4hbSzQfSq/JXSuEd3B208XpdUUe8t8Oc60iqXmVhL0nIwpXZ9qocul4ETmkO94tv2MDhGrJvyYssBuphJ3pC34JHXLf12jj51RWz02GT1REmeBmEZstNYUVKqgs7OW6RxRcxTYejkhJt098vpDAeEI2PeUsQc+Umo2Z79m02BCzkdioEhUI0zF3EbP3uFnNJ15AFhoT2ytnJuNzqknhp4qIQY7rCoflmzYwW8hBhg3AI9qPymrTQcXcXnDi6yBMrAzAnqR6QzkUtADn8rbIy6jcB3z8raYd9ccIUatoM04s6S8X5C80AIENaE/d+UVRBWuEDCqiMgQUrDIdK8dXya0Nh82pypxh71UgLQ5pLK6w9ynaVqPcE4M7JCuJ9yV/LrEo9h5TXN5T5oNH2wD5+6O2scNz2BYo44jFSKo/C9rEKsFd01abjNL/tprQn/9HcbqI4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB2178.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(23010399003)(52116014)(22082099003)(6133799003)(56012099006)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4SN1DTLCWQj4PO1OEvKOzdlrEjj96t+vtz5dVaAIMcQU7rOfNZ+Cp/E6jvYX?=
 =?us-ascii?Q?xW8YeFFX1vn3JrPTnfEFuJjkJK1r3AJTxHEsK2Vdl59z97nZalKkxzcG+Yt3?=
 =?us-ascii?Q?Prt/bb08EvB/6MFl4fMplneaeVH+sCV2CZJsg0Ow1hvzLgSO6qDPt4lkQ/Zb?=
 =?us-ascii?Q?Xa7dFoYhbxskbXWy+Ab+aPjIf/x8cYdK7+p52SS4jOWMzrgYsCMe0sMyZRXv?=
 =?us-ascii?Q?2dzO6ICECRRcqBrTIQ9KRiyXT9UPV7yPFhe4eANBa+L+rMnEmbwpIi81bIWG?=
 =?us-ascii?Q?QqoNXgQtha59/yetmwd4OzHEqynhakBQukewOL+S1Ye3ioTKaQVAbTLPFmuk?=
 =?us-ascii?Q?vhn4pTRWL4+q0f+dwAp4zuSv8rUbcLai0G4mAjIDSeLg6DG7iA8mgPFo2Agp?=
 =?us-ascii?Q?EtbOqkrbndsBTay0+GlpjZpWBWxMQmCI2GFFJ+mbHCEsPKnZi0TyduKLdP88?=
 =?us-ascii?Q?rDc6qN2emS8VVqo/5FC7DLtwJLTOYVTJq2AEO7YGJBR8dGGbLH44Z1DLCIKu?=
 =?us-ascii?Q?reM0y0AuhZmu3Xav2XGuTQxgDvFfj0bVgjhdYwen9ScNOjxVDdna2nT5yWRo?=
 =?us-ascii?Q?xX9LJFfPjpJ58M0q7Ya7G2lAUuUnNC8isdSB2QrCE0w091h+wc25J5f+etXe?=
 =?us-ascii?Q?2vJ8P+nVeSdpZzq0xllNVZEn9wSsLJnkU51x0+ZupgJQQrgC5QO835XYIvFO?=
 =?us-ascii?Q?KkpxsJC/PYRxEXTjmF5KYEM/gluRVjGV0uAxWtJIjxN4V0h0Z0T/kkHRORFp?=
 =?us-ascii?Q?jiwjnRQn0kHid4ziWZ4mF3pagkHyelKfAk1FbiIPHmjbULX1trLPF737OybX?=
 =?us-ascii?Q?mCa13Luw24+96StuXwGkZSUL4HwG63lfdIPS7QUOrXLgqmRKNhXs/AHScRLE?=
 =?us-ascii?Q?OYf531Qzr+p2a3RWXFp8Dr5tjk9pz7174x5e8lKl7l+Typis1Z1BWT6boLHa?=
 =?us-ascii?Q?OyVxlM/YLALsa9eLEbu5FU02+B9xqgpJZ9ANcWc1gFSh0W9WNMp3u5T8dcSv?=
 =?us-ascii?Q?6OGCP5yxEMrUj1KOw24xGTiWlBFNxnKp/zWWlLRvKcDHjY4V3bvHoo6VFMAs?=
 =?us-ascii?Q?aby5/tsjwNNrQCy++8VJYChroGR7G2B9l8Kguf7jfeK/opuT6RmmkDwyjxDP?=
 =?us-ascii?Q?6/31QJtCDCvmyJipOwFMIBsNKPBI5GgALvEaWKRd5EtyFPmTeOFG5HOdEDeT?=
 =?us-ascii?Q?kP0SnjYN5yUnv1GHrIFqmtthhl9Jnm+K/gPERQsOSpuI1eX/bQnyCgfJYnWy?=
 =?us-ascii?Q?fH868AZ+nW1HT5/45zpIZhwVefv5iY0c5efwe1nznxT1yOMwVjM2ogTjP/tU?=
 =?us-ascii?Q?ITilnknTZh9yE/8mpEU/fU/VbwkXtIXiUHjHEkcgGdxNFlxy6GsfIbBAEHL4?=
 =?us-ascii?Q?zPlrmNTUAm9Z+HyAD+0ctFQj28leRfuOhDzIqJhTbxMtSM8ZShUrVRvCSVAW?=
 =?us-ascii?Q?QMyhDTFjAhBzHWgzhGMlmPmRSm5T8H19O5SoQyIqWxuwyc9miTOngNTqUq04?=
 =?us-ascii?Q?vImcbIxBvj5kSwhwyIUv9WEJSfuUAX5k0h2GDYUNQVgW+qLVvndmYqcbJtau?=
 =?us-ascii?Q?+dWwYTZo3hsBrXZqCszfSq0fGNi5SKN3phUvGejH0Mct54oeAT6NwiNV89m2?=
 =?us-ascii?Q?uEOpoCGb5cH93rop6ymQFnHUPfJ8iwrvQe7+V1YsOdGE+2ZITNqIc9HO55ZM?=
 =?us-ascii?Q?gKLOBsUsOtzEQ9Zw0rmblLsIOaqnvhaNes4f6z7SwxlnPTeklDSMid+w92iB?=
 =?us-ascii?Q?ZbLkcCrWNhs3padOowzLisHy9AvMPN4=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bb54b23-bcf8-473e-2274-08dedce19c63
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 11:11:08.4430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kjyZ1KxCtpRRBm8leF3gwvmDH9s7asaYqc4hKBVr015KAr+kzz71nKR5kDGVZ+jOXK8KBkq+5fR3b2IgkJ3GOmJ+gnmj/DT2LDX0HciWQiGwQlSjSAzcQ9xBLpQyI62p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB6144
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[siliconsignals.io : SPF not aligned (relaxed),quarantine];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66972-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:vladimir.zapolskiy@linaro.org,m:laurent.pinchart@ideasonboard.com,m:tarang.raval@siliconsignals.io,m:elgin.perumbilly@siliconsignals.io,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:himanshu.bhavani@siliconsignals.io,m:contact@schnwalter.eu,m:hpa@redhat.com,m:y-abhilashchandra@ti.com,m:clamor95@gmail.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[elgin.perumbilly@siliconsignals.io,linux-media@vger.kernel.org];
	GREYLIST(0.00)[pass,body];
	FREEMAIL_CC(0.00)[siliconsignals.io,kernel.org,oss.qualcomm.com,schnwalter.eu,redhat.com,ti.com,gmail.com,vger.kernel.org];
	R_DKIM_PERMFAIL(0.00)[siliconsignals.io:s=selector1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elgin.perumbilly@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:~];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[siliconsignals.io:from_mime,siliconsignals.io:email,siliconsignals.io:mid,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 08A32724D96

Add a v4l2 subdevice driver for the Omnivision os02g10 sensor.

The Omnivision os02g10 is a CMOS image sensor with an active array size of
1920 x 1080.

The following features are supported:
- Manual exposure and gain control support
- vblank/hblank control support
- vflip/hflip control support
- Test pattern control support
- Supported resolution: 1920 x 1080 @ 30fps (SBGGR10)

Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 MAINTAINERS                 |   1 +
 drivers/media/i2c/Kconfig   |  10 +
 drivers/media/i2c/Makefile  |   1 +
 drivers/media/i2c/os02g10.c | 932 ++++++++++++++++++++++++++++++++++++
 4 files changed, 944 insertions(+)
 create mode 100644 drivers/media/i2c/os02g10.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 83bce5e9dc49..20f619149bfd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19835,6 +19835,7 @@ M:	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml
+F:	drivers/media/i2c/os02g10.c

 OMNIVISION OS05B10 SENSOR DRIVER
 M:	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 5d173e0ecf42..e189c5e15c0e 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -373,6 +373,16 @@ config VIDEO_OG0VE1B
 	  To compile this driver as a module, choose M here: the
 	  module will be called og0ve1b.

+config VIDEO_OS02G10
+	tristate "OmniVision OS02G10 sensor support"
+	select V4L2_CCI_I2C
+	help
+	  This is a Video4Linux2 sensor driver for OmniVision
+	  OS02G10 camera sensor.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called os02g10.
+
 config VIDEO_OS05B10
         tristate "OmniVision OS05B10 sensor support"
         select V4L2_CCI_I2C
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index e45359efe0e4..60eb6efd73e4 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -84,6 +84,7 @@ obj-$(CONFIG_VIDEO_MT9V032) += mt9v032.o
 obj-$(CONFIG_VIDEO_MT9V111) += mt9v111.o
 obj-$(CONFIG_VIDEO_OG01A1B) += og01a1b.o
 obj-$(CONFIG_VIDEO_OG0VE1B) += og0ve1b.o
+obj-$(CONFIG_VIDEO_OS02G10) += os02g10.o
 obj-$(CONFIG_VIDEO_OS05B10) += os05b10.o
 obj-$(CONFIG_VIDEO_OV01A10) += ov01a10.o
 obj-$(CONFIG_VIDEO_OV02A10) += ov02a10.o
diff --git a/drivers/media/i2c/os02g10.c b/drivers/media/i2c/os02g10.c
new file mode 100644
index 000000000000..61de45c54d18
--- /dev/null
+++ b/drivers/media/i2c/os02g10.c
@@ -0,0 +1,932 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * V4L2 Support for the OS02G10
+ *
+ * Copyright (C) 2026 Silicon Signals Pvt. Ltd.
+ *
+ */
+
+#include <linux/array_size.h>
+#include <linux/bitops.h>
+#include <linux/cleanup.h>
+#include <linux/clk.h>
+#include <linux/container_of.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/pm_runtime.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/units.h>
+#include <linux/types.h>
+#include <linux/time.h>
+
+#include <media/v4l2-cci.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-mediabus.h>
+
+#define OS02G10_XCLK_FREQ_24MHZ			(24 * HZ_PER_MHZ)
+
+/* Page 0 */
+#define OS02G10_REG_CHIPID			CCI_REG24(0x002)
+#define OS02G10_CHIPID				0x560247
+
+#define OS02G10_REG_PLL_DIV_CTRL		CCI_REG8(0x030)
+#define OS02G10_REG_PLL_DCTL_BIAS_CTRL		CCI_REG8(0x035)
+#define OS02G10_REG_GATE_EN_CTRL		CCI_REG8(0x038)
+#define OS02G10_REG_DPLL_NC			CCI_REG8(0x041)
+#define OS02G10_REG_MP_PHASE_CTRL		CCI_REG8(0x044)
+
+/* Page 1 */
+#define OS02G10_REG_FRAME_SYNC			CCI_REG8(0x101)
+
+#define OS02G10_REG_LONG_EXPOSURE		CCI_REG16(0x103)
+#define OS02G10_EXPOSURE_MIN			4
+#define OS02G10_EXPOSURE_STEP			1
+#define OS02G10_EXPOSURE_MARGIN			9
+
+#define OS02G10_REG_HBLANK			CCI_REG16(0x109)
+
+#define OS02G10_REG_FRAME_TEST_CTRL		CCI_REG8(0x10d)
+#define OS02G10_FRAME_EXP_SEPERATE_EN		BIT(4)
+#define OS02G10_TEST_PATTERN_ENABLE		BIT(0)
+
+#define OS02G10_REG_FRAME_LENGTH		CCI_REG16(0x10e)
+#define OS02G10_FRAME_LENGTH_MAX		(BIT(16) - 1)
+
+#define OS02G10_REG_ANALOG_GAIN			CCI_REG8(0x124)
+#define OS02G10_ANALOG_GAIN_MIN			16
+#define OS02G10_ANALOG_GAIN_MAX			248
+#define OS02G10_ANALOG_GAIN_STEP		1
+#define OS02G10_ANALOG_GAIN_DEFAULT		16
+
+#define OS02G10_REG_DIGITAL_GAIN_H		CCI_REG8(0x137)
+#define OS02G10_REG_DIGITAL_GAIN_L		CCI_REG8(0x139)
+#define OS02G10_DIGITAL_GAIN_MIN		64
+#define OS02G10_DIGITAL_GAIN_MAX		2048
+#define OS02G10_DIGITAL_GAIN_STEP		64
+#define OS02G10_DIGITAL_GAIN_DEFAULT		64
+
+#define OS02G10_REG_ULP_PWD_DUMMY_CTRL		CCI_REG8(0x13c)
+
+#define OS02G10_REG_FLIP_MIRROR			CCI_REG8(0x13f)
+#define OS02G10_FLIP				BIT(1)
+#define OS02G10_MIRROR				BIT(0)
+
+#define OS02G10_REG_DC_LEVEL_LIMIT_EN		CCI_REG8(0x146)
+#define OS02G10_REG_DC_LEVEL_LIMIT_L		CCI_REG8(0x147)
+#define OS02G10_REG_BLC_DATA_LIMIT_L		CCI_REG8(0x148)
+#define OS02G10_REG_DC_BLC_LIMIT_H		CCI_REG8(0x149)
+
+#define OS02G10_REG_H_SIZE_MIPI			CCI_REG16(0x18e)
+#define OS02G10_REG_V_SIZE_MIPI			CCI_REG16(0x190)
+
+#define OS02G10_REG_HS_LP_CTRL			CCI_REG8(0x192)
+#define OS02G10_REG_HS_LEVEL			CCI_REG8(0x19d)
+#define OS02G10_REG_HS_DRV			CCI_REG8(0x19e)
+
+#define OS02G10_REG_MIPI_TX_SPEED_CTRL		CCI_REG8(0x1a1)
+
+#define OS02G10_REG_STREAM_CTRL			CCI_REG8(0x1b1)
+#define OS02G10_STREAM_CTRL_ON			0x03
+#define OS02G10_STREAM_CTRL_OFF			0x00
+
+#define OS02G10_REG_GB_SUBOFFSET		CCI_REG8(0x1f0)
+#define OS02G10_REG_BLUE_SUBOFFSET		CCI_REG8(0x1f1)
+#define OS02G10_REG_RED_SUBOFFSET		CCI_REG8(0x1f2)
+#define OS02G10_REG_GR_SUBOFFSET		CCI_REG8(0x1f3)
+
+#define OS02G10_REG_ABL_TRIGGER			CCI_REG8(0x1fa)
+#define OS02G10_REG_ABL				CCI_REG8(0x1fb)
+
+/* Page 2 */
+#define OS02G10_REG_SIF_CTRL			CCI_REG8(0x25e)
+#define OS02G10_ORIENTATION_BAYER_FIX		0x32
+
+#define OS02G10_REG_V_START			CCI_REG16(0x2a0)
+#define OS02G10_REG_V_SIZE			CCI_REG16(0x2a2)
+#define OS02G10_REG_H_START			CCI_REG16(0x2a4)
+#define OS02G10_REG_H_SIZE			CCI_REG16(0x2a6)
+
+#define OS02G10_LINK_FREQ_720MHZ		(720 * HZ_PER_MHZ)
+#define OS02G10_DATA_LANES			2
+
+/* OS02G10 native and active pixel array size */
+static const struct v4l2_rect os02g10_native_area = {
+	.top = 0,
+	.left = 0,
+	.width = 1928,
+	.height = 1088,
+};
+
+static const struct v4l2_rect os02g10_active_area = {
+	.top = 4,
+	.left = 4,
+	.width = 1920,
+	.height = 1080,
+};
+
+static const char * const os02g10_supply_name[] = {
+	"avdd",		/* Analog power */
+	"dovdd",	/* Digital I/O power */
+	"dvdd",		/* Digital core power */
+};
+
+struct os02g10 {
+	struct device *dev;
+	struct regmap *cci;
+	struct v4l2_subdev sd;
+	struct media_pad pad;
+	struct clk *xclk;
+	struct gpio_desc *reset_gpio;
+	struct regulator_bulk_data supplies[ARRAY_SIZE(os02g10_supply_name)];
+
+	/* V4L2 Controls */
+	struct v4l2_ctrl_handler handler;
+	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *vflip;
+	struct v4l2_ctrl *hflip;
+};
+
+struct os02g10_mode {
+	u32 width;
+	u32 height;
+	u32 vts_def;
+	u32 exp_def;
+	u32 x_start;
+	u32 y_start;
+};
+
+static const struct cci_reg_sequence os02g10_common_regs[] = {
+	{ OS02G10_REG_PLL_DIV_CTRL,		0x0a},
+	{ OS02G10_REG_PLL_DCTL_BIAS_CTRL,	0x04},
+	{ OS02G10_REG_GATE_EN_CTRL,		0x11},
+	{ OS02G10_REG_DPLL_NC,			0x06},
+	{ OS02G10_REG_MP_PHASE_CTRL,		0x20},
+	{ CCI_REG8(0x119),			0x50},
+	{ CCI_REG8(0x11a),			0x0c},
+	{ CCI_REG8(0x11b),			0x0d},
+	{ CCI_REG8(0x11c),			0x00},
+	{ CCI_REG8(0x11d),			0x75},
+	{ CCI_REG8(0x11e),			0x52},
+	{ CCI_REG8(0x122),			0x14},
+	{ CCI_REG8(0x125),			0x44},
+	{ CCI_REG8(0x126),			0x0f},
+	{ OS02G10_REG_ULP_PWD_DUMMY_CTRL,	0xca},
+	{ CCI_REG8(0x13d),			0x4a},
+	{ CCI_REG8(0x140),			0x0f},
+	{ CCI_REG8(0x143),			0x38},
+	{ OS02G10_REG_DC_LEVEL_LIMIT_EN,	0x01},
+	{ OS02G10_REG_DC_LEVEL_LIMIT_L,		0x00},
+	{ OS02G10_REG_DC_BLC_LIMIT_H,		0x32},
+	{ CCI_REG8(0x150),			0x01},
+	{ CCI_REG8(0x151),			0x28},
+	{ CCI_REG8(0x152),			0x20},
+	{ CCI_REG8(0x153),			0x03},
+	{ CCI_REG8(0x157),			0x16},
+	{ CCI_REG8(0x159),			0x01},
+	{ CCI_REG8(0x15a),			0x01},
+	{ CCI_REG8(0x15d),			0x04},
+	{ CCI_REG8(0x16a),			0x04},
+	{ CCI_REG8(0x16b),			0x03},
+	{ CCI_REG8(0x16e),			0x28},
+	{ CCI_REG8(0x171),			0xc2},
+	{ CCI_REG8(0x172),			0x04},
+	{ CCI_REG8(0x173),			0x38},
+	{ CCI_REG8(0x174),			0x04},
+	{ CCI_REG8(0x179),			0x00},
+	{ CCI_REG8(0x17a),			0xb2},
+	{ CCI_REG8(0x17b),			0x10},
+	{ OS02G10_REG_HS_LP_CTRL,		0x02},
+	{ OS02G10_REG_HS_LEVEL,			0x03},
+	{ OS02G10_REG_HS_DRV,			0x55},
+	{ CCI_REG8(0x1b8),			0x70},
+	{ CCI_REG8(0x1b9),			0x70},
+	{ CCI_REG8(0x1ba),			0x70},
+	{ CCI_REG8(0x1bb),			0x70},
+	{ CCI_REG8(0x1bc),			0x00},
+	{ CCI_REG8(0x1c4),			0x6d},
+	{ CCI_REG8(0x1c5),			0x6d},
+	{ CCI_REG8(0x1c6),			0x6d},
+	{ CCI_REG8(0x1c7),			0x6d},
+	{ CCI_REG8(0x1cc),			0x11},
+	{ CCI_REG8(0x1cd),			0xe0},
+	{ CCI_REG8(0x1d0),			0x1b},
+	{ CCI_REG8(0x1d2),			0x76},
+	{ CCI_REG8(0x1d3),			0x68},
+	{ CCI_REG8(0x1d4),			0x68},
+	{ CCI_REG8(0x1d5),			0x73},
+	{ CCI_REG8(0x1d6),			0x73},
+	{ CCI_REG8(0x1e8),			0x55},
+	{ OS02G10_REG_GB_SUBOFFSET,		0x40},
+	{ OS02G10_REG_BLUE_SUBOFFSET,		0x40},
+	{ OS02G10_REG_RED_SUBOFFSET,		0x40},
+	{ OS02G10_REG_GR_SUBOFFSET,		0x40},
+	{ OS02G10_REG_ABL_TRIGGER,		0x1c},
+	{ OS02G10_REG_ABL,			0x33},
+	{ CCI_REG8(0x1fc),			0x80},
+	{ CCI_REG8(0x1fe),			0x80},
+	{ CCI_REG8(0x303),			0x67},
+	{ CCI_REG8(0x300),			0x59},
+	{ CCI_REG8(0x304),			0x11},
+	{ CCI_REG8(0x305),			0x04},
+	{ CCI_REG8(0x306),			0x0c},
+	{ CCI_REG8(0x307),			0x08},
+	{ CCI_REG8(0x308),			0x08},
+	{ CCI_REG8(0x309),			0x4f},
+	{ CCI_REG8(0x30b),			0x08},
+	{ CCI_REG8(0x30d),			0x26},
+	{ CCI_REG8(0x30f),			0x00},
+	{ CCI_REG8(0x234),			0xfe},
+	{ OS02G10_REG_MIPI_TX_SPEED_CTRL,	0x05},
+};
+
+static const struct os02g10_mode supported_modes[] = {
+	{
+		.width = 1920,
+		.height = 1080,
+		.vts_def = 1246,
+		.exp_def = 1100,
+		.x_start = 2,
+		.y_start = 6,
+	},
+};
+
+static const s64 link_freq_menu_items[] = {
+	OS02G10_LINK_FREQ_720MHZ,
+};
+
+static const char * const os02g10_test_pattern_menu[] = {
+	"Disabled",
+	"Colorbar",
+};
+
+static inline struct os02g10 *to_os02g10(struct v4l2_subdev *sd)
+{
+	return container_of_const(sd, struct os02g10, sd);
+}
+
+static u32 os02g10_get_format_code(struct os02g10 *os02g10)
+{
+	static const u32 codes[2][2] = {
+		{ MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SGBRG10_1X10, },
+		{ MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SRGGB10_1X10, },
+	};
+
+	return codes[os02g10->vflip->val][os02g10->hflip->val];
+}
+
+static int os02g10_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct os02g10 *os02g10 = container_of_const(ctrl->handler,
+						     struct os02g10, handler);
+	struct v4l2_subdev_state *state;
+	struct v4l2_mbus_framefmt *fmt;
+	int ret = 0;
+
+	state = v4l2_subdev_get_locked_active_state(&os02g10->sd);
+	fmt = v4l2_subdev_state_get_format(state, 0);
+
+	if (ctrl->id == V4L2_CID_VBLANK) {
+		/* Honour the VBLANK limits when setting exposure */
+		s64 max = fmt->height + ctrl->val - OS02G10_EXPOSURE_MARGIN;
+
+		ret = __v4l2_ctrl_modify_range(os02g10->exposure,
+					       os02g10->exposure->minimum, max,
+					       os02g10->exposure->step,
+					       os02g10->exposure->default_value);
+		if (ret)
+			return ret;
+	}
+
+	if (pm_runtime_get_if_active(os02g10->dev) == 0)
+		return 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_EXPOSURE:
+		cci_write(os02g10->cci, OS02G10_REG_LONG_EXPOSURE,
+			  ctrl->val, &ret);
+		break;
+	case V4L2_CID_ANALOGUE_GAIN:
+		cci_write(os02g10->cci, OS02G10_REG_ANALOG_GAIN,
+			  ctrl->val, &ret);
+		break;
+	case V4L2_CID_DIGITAL_GAIN:
+		cci_write(os02g10->cci, OS02G10_REG_DIGITAL_GAIN_L,
+			  (ctrl->val & 0xff), &ret);
+		cci_write(os02g10->cci, OS02G10_REG_DIGITAL_GAIN_H,
+			  ((ctrl->val >> 8) & 0x7), &ret);
+		break;
+	case V4L2_CID_VBLANK: {
+		u64 vts = ctrl->val + fmt->height;
+
+		cci_update_bits(os02g10->cci, OS02G10_REG_FRAME_TEST_CTRL,
+				OS02G10_FRAME_EXP_SEPERATE_EN,
+				OS02G10_FRAME_EXP_SEPERATE_EN, &ret);
+		cci_write(os02g10->cci, OS02G10_REG_FRAME_LENGTH, vts, &ret);
+		break;
+	}
+	case V4L2_CID_HFLIP:
+	case V4L2_CID_VFLIP:
+		cci_write(os02g10->cci, OS02G10_REG_FLIP_MIRROR,
+			  os02g10->hflip->val | os02g10->vflip->val << 1, &ret);
+		cci_write(os02g10->cci, OS02G10_REG_SIF_CTRL,
+			  OS02G10_ORIENTATION_BAYER_FIX, &ret);
+		break;
+	case V4L2_CID_TEST_PATTERN:
+		cci_update_bits(os02g10->cci,
+				OS02G10_REG_FRAME_TEST_CTRL,
+				OS02G10_TEST_PATTERN_ENABLE,
+				ctrl->val ? OS02G10_TEST_PATTERN_ENABLE : 0,
+				&ret);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+	cci_write(os02g10->cci, OS02G10_REG_FRAME_SYNC, 0x01, &ret);
+
+	pm_runtime_put(os02g10->dev);
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops os02g10_ctrl_ops = {
+	.s_ctrl = os02g10_set_ctrl,
+};
+
+static int os02g10_init_controls(struct os02g10 *os02g10)
+{
+	const struct os02g10_mode *mode = &supported_modes[0];
+	struct v4l2_fwnode_device_properties props;
+	u64 vblank_def, exp_max, pixel_rate;
+	struct v4l2_ctrl_handler *ctrl_hdlr;
+	struct v4l2_ctrl *link_freq;
+	int ret;
+
+	ret = v4l2_fwnode_device_parse(os02g10->dev, &props);
+	if (ret)
+		return ret;
+
+	ctrl_hdlr = &os02g10->handler;
+	v4l2_ctrl_handler_init(ctrl_hdlr, 11);
+
+	/* pixel_rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
+	pixel_rate = div_u64(OS02G10_LINK_FREQ_720MHZ * 2 * OS02G10_DATA_LANES, 10);
+	v4l2_ctrl_new_std(ctrl_hdlr, &os02g10_ctrl_ops, V4L2_CID_PIXEL_RATE, 0,
+			  pixel_rate, 1, pixel_rate);
+
+	link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &os02g10_ctrl_ops,
+					   V4L2_CID_LINK_FREQ,
+					   ARRAY_SIZE(link_freq_menu_items) - 1,
+					   0, link_freq_menu_items);
+
+	vblank_def = mode->vts_def - mode->height;
+	os02g10->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &os02g10_ctrl_ops,
+					    V4L2_CID_VBLANK, vblank_def,
+					    OS02G10_FRAME_LENGTH_MAX - mode->height,
+					    1, vblank_def);
+
+	exp_max = mode->vts_def - OS02G10_EXPOSURE_MARGIN;
+	os02g10->exposure =
+		v4l2_ctrl_new_std(ctrl_hdlr, &os02g10_ctrl_ops,
+				  V4L2_CID_EXPOSURE,
+				  OS02G10_EXPOSURE_MIN, exp_max,
+				  OS02G10_EXPOSURE_STEP, mode->exp_def);
+
+	v4l2_ctrl_new_std(ctrl_hdlr, &os02g10_ctrl_ops,
+			  V4L2_CID_ANALOGUE_GAIN, OS02G10_ANALOG_GAIN_MIN,
+			  OS02G10_ANALOG_GAIN_MAX, OS02G10_ANALOG_GAIN_STEP,
+			  OS02G10_ANALOG_GAIN_DEFAULT);
+
+	v4l2_ctrl_new_std(ctrl_hdlr, &os02g10_ctrl_ops,
+			  V4L2_CID_DIGITAL_GAIN, OS02G10_DIGITAL_GAIN_MIN,
+			  OS02G10_DIGITAL_GAIN_MAX, OS02G10_DIGITAL_GAIN_STEP,
+			  OS02G10_DIGITAL_GAIN_DEFAULT);
+
+	os02g10->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &os02g10_ctrl_ops,
+					   V4L2_CID_HFLIP, 0, 1, 1, 0);
+
+	os02g10->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &os02g10_ctrl_ops,
+					   V4L2_CID_VFLIP, 0, 1, 1, 0);
+
+	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &os02g10_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(os02g10_test_pattern_menu) - 1,
+				     0, 0, os02g10_test_pattern_menu);
+
+	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr,
+					      &os02g10_ctrl_ops, &props);
+	if (ret)
+		goto err_handler_free;
+
+	if (ctrl_hdlr->error) {
+		ret = ctrl_hdlr->error;
+		goto err_handler_free;
+	}
+
+	link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	os02g10->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+	os02g10->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+
+	os02g10->sd.ctrl_handler = ctrl_hdlr;
+
+	return 0;
+
+err_handler_free:
+	v4l2_ctrl_handler_free(ctrl_hdlr);
+
+	return ret;
+}
+
+static int os02g10_set_framefmt(struct os02g10 *os02g10,
+				struct v4l2_subdev_state *state)
+{
+	const struct v4l2_mbus_framefmt *format;
+	const struct os02g10_mode *mode;
+	int ret = 0;
+
+	format = v4l2_subdev_state_get_format(state, 0);
+	mode = v4l2_find_nearest_size(supported_modes,
+				      ARRAY_SIZE(supported_modes), width,
+				      height, format->width, format->height);
+
+	cci_write(os02g10->cci, OS02G10_REG_V_START, mode->y_start, &ret);
+	cci_write(os02g10->cci, OS02G10_REG_V_SIZE, mode->height, &ret);
+	cci_write(os02g10->cci, OS02G10_REG_V_SIZE_MIPI, mode->height, &ret);
+	cci_write(os02g10->cci, OS02G10_REG_H_START, mode->x_start, &ret);
+	cci_write(os02g10->cci, OS02G10_REG_H_SIZE, mode->width, &ret);
+	cci_write(os02g10->cci, OS02G10_REG_H_SIZE_MIPI, mode->width, &ret);
+
+	return ret;
+}
+
+static int os02g10_enable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state, u32 pad,
+				  u64 streams_mask)
+{
+	struct os02g10 *os02g10 = to_os02g10(sd);
+	int ret;
+
+	ret = pm_runtime_resume_and_get(os02g10->dev);
+	if (ret < 0)
+		return ret;
+
+	ret = cci_multi_reg_write(os02g10->cci, os02g10_common_regs,
+				  ARRAY_SIZE(os02g10_common_regs), NULL);
+	if (ret) {
+		dev_err(os02g10->dev, "failed to write common registers\n");
+		goto err_rpm_put;
+	}
+
+	ret = os02g10_set_framefmt(os02g10, state);
+	if (ret) {
+		dev_err(os02g10->dev, "failed to set frame foramt\n");
+		goto err_rpm_put;
+	}
+
+	/* Apply customized values from user */
+	ret = __v4l2_ctrl_handler_setup(os02g10->sd.ctrl_handler);
+	if (ret)
+		goto err_rpm_put;
+
+	ret = cci_write(os02g10->cci, OS02G10_REG_STREAM_CTRL,
+			OS02G10_STREAM_CTRL_ON, NULL);
+	if (ret)
+		goto err_rpm_put;
+
+	/* vflip and hflip cannot change during streaming */
+	__v4l2_ctrl_grab(os02g10->vflip, true);
+	__v4l2_ctrl_grab(os02g10->hflip, true);
+
+	return 0;
+
+err_rpm_put:
+	pm_runtime_put(os02g10->dev);
+	return ret;
+}
+
+static int os02g10_disable_streams(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state, u32 pad,
+				   u64 streams_mask)
+{
+	struct os02g10 *os02g10 = to_os02g10(sd);
+	int ret;
+
+	ret = cci_write(os02g10->cci, OS02G10_REG_STREAM_CTRL,
+			OS02G10_STREAM_CTRL_OFF, NULL);
+	if (ret)
+		dev_err(os02g10->dev, "Failed to stop stream\n");
+
+	__v4l2_ctrl_grab(os02g10->vflip, false);
+	__v4l2_ctrl_grab(os02g10->hflip, false);
+
+	pm_runtime_put(os02g10->dev);
+
+	return ret;
+}
+
+static int os02g10_get_selection(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_selection *sel)
+{
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+		sel->r = os02g10_native_area;
+		return 0;
+	case V4L2_SEL_TGT_CROP:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+		sel->r = os02g10_active_area;
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int os02g10_enum_mbus_code(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct os02g10 *os02g10 = to_os02g10(sd);
+
+	if (code->index)
+		return -EINVAL;
+
+	code->code = os02g10_get_format_code(os02g10);
+
+	return 0;
+}
+
+static int os02g10_enum_frame_size(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *sd_state,
+				   struct v4l2_subdev_frame_size_enum *fse)
+{
+	struct os02g10 *os02g10 = to_os02g10(sd);
+
+	if (fse->index >= ARRAY_SIZE(supported_modes))
+		return -EINVAL;
+
+	if (fse->code != os02g10_get_format_code(os02g10))
+		return -EINVAL;
+
+	fse->min_width = supported_modes[fse->index].width;
+	fse->max_width = fse->min_width;
+	fse->min_height = supported_modes[fse->index].height;
+	fse->max_height = fse->min_height;
+
+	return 0;
+}
+
+static int os02g10_set_pad_format(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_format *fmt)
+{
+	struct os02g10 *os02g10 = to_os02g10(sd);
+	struct v4l2_mbus_framefmt *format;
+	const struct os02g10_mode *mode;
+
+	format = v4l2_subdev_state_get_format(sd_state, 0);
+
+	mode = v4l2_find_nearest_size(supported_modes,
+				      ARRAY_SIZE(supported_modes),
+				      width, height,
+				      fmt->format.width, fmt->format.height);
+
+	fmt->format.code = os02g10_get_format_code(os02g10);
+	fmt->format.width = mode->width;
+	fmt->format.height = mode->height;
+	fmt->format.field = V4L2_FIELD_NONE;
+	fmt->format.colorspace = V4L2_COLORSPACE_RAW;
+	fmt->format.quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
+
+	*format = fmt->format;
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
+		u32 vblank_def = mode->vts_def - mode->height;
+
+		return __v4l2_ctrl_modify_range(os02g10->vblank, vblank_def,
+						OS02G10_FRAME_LENGTH_MAX -
+						mode->height, 1, vblank_def);
+	}
+
+	return 0;
+}
+
+static int os02g10_init_state(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *state)
+{
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_TRY,
+		.format = {
+			.width = supported_modes[0].width,
+			.height = supported_modes[0].height,
+		},
+	};
+
+	return os02g10_set_pad_format(sd, state, &fmt);
+}
+
+static const struct v4l2_subdev_video_ops os02g10_video_ops = {
+	.s_stream = v4l2_subdev_s_stream_helper,
+};
+
+static const struct v4l2_subdev_pad_ops os02g10_pad_ops = {
+	.enum_mbus_code = os02g10_enum_mbus_code,
+	.enum_frame_size = os02g10_enum_frame_size,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = os02g10_set_pad_format,
+	.get_selection = os02g10_get_selection,
+	.enable_streams = os02g10_enable_streams,
+	.disable_streams = os02g10_disable_streams,
+};
+
+static const struct v4l2_subdev_ops os02g10_subdev_ops = {
+	.video = &os02g10_video_ops,
+	.pad = &os02g10_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops os02g10_internal_ops = {
+	.init_state = os02g10_init_state,
+};
+
+static int os02g10_power_on(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct os02g10 *os02g10 = to_os02g10(sd);
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(os02g10_supply_name),
+				    os02g10->supplies);
+	if (ret) {
+		dev_err(os02g10->dev, "failed to enable regulators\n");
+		return ret;
+	}
+
+	/* Wait for T3/T4 timing requirements after supplies become stable */
+	fsleep(5 * USEC_PER_MSEC);
+
+	ret = clk_prepare_enable(os02g10->xclk);
+	if (ret)
+		goto err_regulator_off;
+
+	gpiod_set_value_cansleep(os02g10->reset_gpio, 0);
+
+	/* T5: delay from sensor power up stable to SCCB initialization */
+	fsleep(5 * USEC_PER_MSEC);
+
+	return 0;
+
+err_regulator_off:
+	regulator_bulk_disable(ARRAY_SIZE(os02g10_supply_name), os02g10->supplies);
+
+	return ret;
+}
+
+static int os02g10_power_off(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct os02g10 *os02g10 = to_os02g10(sd);
+
+	clk_disable_unprepare(os02g10->xclk);
+	gpiod_set_value_cansleep(os02g10->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(os02g10_supply_name), os02g10->supplies);
+
+	return 0;
+}
+
+static int os02g10_identify_module(struct os02g10 *os02g10)
+{
+	u64 chip_id;
+	int ret;
+
+	ret = cci_read(os02g10->cci, OS02G10_REG_CHIPID, &chip_id, NULL);
+	if (ret)
+		return dev_err_probe(os02g10->dev, ret,
+				     "failed to read chip id %x\n",
+				     OS02G10_CHIPID);
+
+	if (chip_id != OS02G10_CHIPID)
+		return dev_err_probe(os02g10->dev, -EIO,
+				     "chip id mismatch: %x!=%llx\n",
+				     OS02G10_CHIPID, chip_id);
+
+	return 0;
+}
+
+static int os02g10_parse_endpoint(struct os02g10 *os02g10)
+{
+	struct v4l2_fwnode_endpoint bus_cfg = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY,
+	};
+	unsigned long link_freq_bitmap;
+	struct fwnode_handle *ep;
+	int ret;
+
+	ep = fwnode_graph_get_next_endpoint(dev_fwnode(os02g10->dev), NULL);
+	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	fwnode_handle_put(ep);
+	if (ret)
+		return ret;
+
+	ret = v4l2_link_freq_to_bitmap(os02g10->dev, bus_cfg.link_frequencies,
+				       bus_cfg.nr_of_link_frequencies,
+				       link_freq_menu_items,
+				       ARRAY_SIZE(link_freq_menu_items),
+				       &link_freq_bitmap);
+
+	v4l2_fwnode_endpoint_free(&bus_cfg);
+
+	return ret;
+}
+
+static const struct regmap_range_cfg os02g10_ranges[] = {
+	{
+		.range_min      = 0x0000,
+		.range_max      = 0x03ff,
+		.selector_reg   = 0xfd,
+		.selector_mask  = 0x03,
+		.selector_shift = 0,
+		.window_start   = 0x00,
+		.window_len     = 0x100,
+	},
+};
+
+static const struct regmap_config os02g10_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.reg_format_endian = REGMAP_ENDIAN_BIG,
+	.max_register = 0x3ff,
+	.ranges = os02g10_ranges,
+	.num_ranges = ARRAY_SIZE(os02g10_ranges),
+	.disable_locking = true,
+};
+
+static int os02g10_probe(struct i2c_client *client)
+{
+	struct os02g10 *os02g10;
+	unsigned int xclk_freq;
+	int ret;
+
+	os02g10 = devm_kzalloc(&client->dev, sizeof(*os02g10), GFP_KERNEL);
+	if (!os02g10)
+		return -ENOMEM;
+
+	os02g10->dev = &client->dev;
+
+	v4l2_i2c_subdev_init(&os02g10->sd, client, &os02g10_subdev_ops);
+	os02g10->sd.internal_ops = &os02g10_internal_ops;
+
+	/*
+	 * This is not using devm_cci_regmap_init_i2c(), because the driver
+	 * makes use of regmap's pagination feature. The chosen settings are
+	 * compatible with the CCI helpers.
+	 */
+	os02g10->cci = devm_regmap_init_i2c(client, &os02g10_regmap_config);
+	if (IS_ERR(os02g10->cci))
+		return dev_err_probe(os02g10->dev, PTR_ERR(os02g10->cci),
+				     "failed to initialize CCI\n");
+
+	ret = os02g10_parse_endpoint(os02g10);
+	if (ret)
+		return dev_err_probe(os02g10->dev, ret,
+				     "failed to parse endpoint configuration\n");
+
+	/* Get system clock (xvclk) */
+	os02g10->xclk = devm_v4l2_sensor_clk_get(os02g10->dev, NULL);
+	if (IS_ERR(os02g10->xclk))
+		return dev_err_probe(os02g10->dev, PTR_ERR(os02g10->xclk),
+				     "failed to get xclk\n");
+
+	xclk_freq = clk_get_rate(os02g10->xclk);
+	if (xclk_freq != OS02G10_XCLK_FREQ_24MHZ)
+		return dev_err_probe(os02g10->dev, -EINVAL,
+				     "xclk frequency not supported: %u Hz\n",
+				     xclk_freq);
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(os02g10_supply_name); i++)
+		os02g10->supplies[i].supply = os02g10_supply_name[i];
+
+	ret = devm_regulator_bulk_get(os02g10->dev,
+				      ARRAY_SIZE(os02g10_supply_name),
+				      os02g10->supplies);
+	if (ret)
+		return dev_err_probe(os02g10->dev, ret,
+				     "failed to get regulators\n");
+
+	os02g10->reset_gpio = devm_gpiod_get_optional(os02g10->dev,
+						      "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(os02g10->reset_gpio))
+		return dev_err_probe(os02g10->dev, PTR_ERR(os02g10->reset_gpio),
+				     "failed to get reset GPIO\n");
+
+	ret = os02g10_power_on(os02g10->dev);
+	if (ret)
+		return ret;
+
+	ret = os02g10_identify_module(os02g10);
+	if (ret)
+		goto error_power_off;
+
+	ret = os02g10_init_controls(os02g10);
+	if (ret)
+		goto error_power_off;
+
+	/* Initialize subdev */
+	os02g10->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	os02g10->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+	os02g10->pad.flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&os02g10->sd.entity, 1, &os02g10->pad);
+	if (ret) {
+		dev_err_probe(os02g10->dev, ret, "failed to init entity pads\n");
+		goto error_handler_free;
+	}
+
+	os02g10->sd.state_lock = os02g10->handler.lock;
+	ret = v4l2_subdev_init_finalize(&os02g10->sd);
+	if (ret) {
+		dev_err_probe(os02g10->dev, ret, "subdev init error\n");
+		goto error_media_entity;
+	}
+
+	pm_runtime_set_active(os02g10->dev);
+	pm_runtime_enable(os02g10->dev);
+
+	ret = v4l2_async_register_subdev_sensor(&os02g10->sd);
+	if (ret) {
+		dev_err_probe(os02g10->dev, ret,
+			      "failed to register os02g10 sub-device\n");
+		goto error_subdev_cleanup;
+	}
+
+	pm_runtime_idle(os02g10->dev);
+
+	return 0;
+
+error_subdev_cleanup:
+	v4l2_subdev_cleanup(&os02g10->sd);
+	pm_runtime_disable(os02g10->dev);
+	pm_runtime_set_suspended(os02g10->dev);
+
+error_media_entity:
+	media_entity_cleanup(&os02g10->sd.entity);
+
+error_handler_free:
+	v4l2_ctrl_handler_free(os02g10->sd.ctrl_handler);
+
+error_power_off:
+	os02g10_power_off(os02g10->dev);
+
+	return ret;
+}
+
+static void os02g10_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct os02g10 *os02g10 = to_os02g10(sd);
+
+	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(&os02g10->sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_ctrl_handler_free(os02g10->sd.ctrl_handler);
+
+	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev)) {
+		os02g10_power_off(&client->dev);
+		pm_runtime_set_suspended(&client->dev);
+	}
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(os02g10_pm_ops,
+				 os02g10_power_off, os02g10_power_on, NULL);
+
+static const struct of_device_id os02g10_id[] = {
+	{ .compatible = "ovti,os02g10" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, os02g10_id);
+
+static struct i2c_driver os02g10_driver = {
+	.driver = {
+		.name = "os02g10",
+		.pm = pm_ptr(&os02g10_pm_ops),
+		.of_match_table = os02g10_id,
+	},
+	.probe = os02g10_probe,
+	.remove = os02g10_remove,
+};
+module_i2c_driver(os02g10_driver);
+
+MODULE_DESCRIPTION("OS02G10 Camera Sensor Driver");
+MODULE_AUTHOR("Tarang Raval <tarang.raval@siliconsignals.io>");
+MODULE_AUTHOR("Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>");
+MODULE_LICENSE("GPL");
--
2.34.1


