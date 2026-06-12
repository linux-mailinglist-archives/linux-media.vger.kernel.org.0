Return-Path: <linux-media+bounces-64695-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id evq0HgEKLGqqKAQAu9opvQ
	(envelope-from <linux-media+bounces-64695-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 15:30:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C817679D77
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 15:30:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nxp.com header.s=selector1 header.b=LGEKKYEM;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64695-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64695-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=nxp.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3623031EC95D
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 13:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 946C93F0762;
	Fri, 12 Jun 2026 13:21:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011050.outbound.protection.outlook.com [52.101.70.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C7A3FE379;
	Fri, 12 Jun 2026 13:21:23 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270487; cv=fail; b=gvVrbU+8W+rj6rO2ceyBtM1IFMZtG697Np9D0BumH9H8JO47z9j0iKwxaATEdKwu2m/FIQSFdHmzOBwjEhAsIhca5ZPpdrgRcczr+70RqWkSLwfiMhW3dpPz1vfYZM61KYH+gmX859ELix8mPXPwFFCjbd9+tSJ2enOtmEZioas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270487; c=relaxed/simple;
	bh=y5VOkNTPYDIKZSzprc7bjiunGRY0wkUtO037+s225VQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K9SLlVLfikqmZMhv7pZYEvxiJn6ZbEWgA8B4UciR5PybNbFuxgX3k6pUZ3yRIzm4+QP4kkHrnVjIjfehQXcLNDpIP0kV6J+620MS5wjZIwKEnOpNo6Pk6SMskf4O+mMCYJm++teT25vjrrShhNUw2dcYgTybetSFrN63e9g/TZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LGEKKYEM; arc=fail smtp.client-ip=52.101.70.50
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gk4Ij1W1/u+63nsXzQzsagmPvgW1y9PJj16Vl8P/mmvAVNPsgVYEubvoydnyBepIHP6nPFFkdIjf+qmMnJRRYbCMywT9dGQOnbB4KpU9AC3S09AFl2QRzmZrL7CbORPj+gucXFMk8gztUZRBi+bpS9MvEKi9/sFMsHB1RBRuVdR6h4zkiQGe7F2BJwCsvEsczIky+nE2hPJQ+LLi+Ill3JXwNBqwePt1CnR9jAWiy6yqjzuM69y+e6Ba10lhqwgVUP0wvnDyRNVUSSJjfiWIX3SqaMpYBX0HPi/eqeOubiU9T2FWf1xm9cpcksbOKReer2IK5ckFjNtJNVIr1+vMzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ys7g+P+KoB+tyLZML5PHHzf6bGVXMeHGS+LFnO3Nh/M=;
 b=QXVAXVCEzls6TlvfL/FqDqJi6WUwisnftSj9ODTqZ45Pgq/Qt8W6GU/xx1EIKf2oG0wzccm4hWN/1jCHqWmS/AbkXwNRcOl2W/by9CSJD02D7hcqpevBzqJzUdji7zSXnKHj6g4pKiXufDXxg+JOeonv4SCkjje53m77r4BGuO/xX7IbraUza3eBj0nBJzqbBfULkF5XBo60lTzMhAg/2JlfTVbRB6PZOPO6nogETbD4hrsNaUmKkOAfpjm+ext/mRomDYTxMtmV50nWXzusmI3nzgUmFengK+qWqNL16QEnJMJ6JDyzLm2Zyv4Zup7hj1qemXopPTa8YdGLGLRzdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ys7g+P+KoB+tyLZML5PHHzf6bGVXMeHGS+LFnO3Nh/M=;
 b=LGEKKYEMGAJ0zFw07PwbDGlVvlXpEDVvvuFchvh+j2FnFog6H1geauuRqSSgRWR8ghljLp5GfNrrNxEitibJf7bgsmebQhS04hkU9D6oGNnK9jqDlXdnmusQka/EpmpNkNbpazLW2rdtchn0lRhDVeDiVl4QYWpAvwEFVKf3DPgaF2J4nxND1ZO6j68Xzm6Fb1sZtM9irGatEPBwmOdZ8b2yxIGKBCz5TFCQt2O0X+iXOZ7O2fBNBlLDV+z0jWif0pmcJtQ+tBFcJO3yBs3HnmOB7pxxRhcIn2+ulDkTyLzi6QpY/6JMdkIgdfkgc0vIcL9ErH4Q3ORWolFcyI+6ig==
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by DB9PR04MB8203.eurprd04.prod.outlook.com
 (2603:10a6:10:242::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 13:21:00 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 13:21:00 +0000
From: Antoine Bouyer <antoine.bouyer@nxp.com>
To: julien.vuillaumier@nxp.com,
	alexi.birlinger@nxp.com,
	daniel.baluta@nxp.com,
	peng.fan@nxp.com,
	frank.li@nxp.com,
	jacopo.mondi@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	michael.riesch@collabora.com,
	anthony.mcgivern@arm.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	ai.luthra@ideasonboard.com,
	paul.elder@ideasonboard.com,
	geert@linux-m68k.org,
	sakari.ailus@linux.intel.com,
	hverkuil+cisco@kernel.org,
	Antoine Bouyer <antoine.bouyer@nxp.com>
Subject: [PATCH v3 7/8] media: platform: neoisp: Add debugfs support
Date: Fri, 12 Jun 2026 15:20:38 +0200
Message-ID: <20260612132039.2089051-8-antoine.bouyer@nxp.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260612132039.2089051-1-antoine.bouyer@nxp.com>
References: <20260612132039.2089051-1-antoine.bouyer@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0416.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::19) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|DB9PR04MB8203:EE_
X-MS-Office365-Filtering-Correlation-Id: 207c4062-b9dd-42ad-0caf-08dec88571be
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|366016|23010399003|10086099003|921020|6133799003|18092099006|18002099003|22082099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
 Uf/TjQDDlBDtJRuNU7ggCxELrRxeE4V/kNZ16SCSFolnRb+tdU63xlc9eHuIxBaAV3AWcMhpolxqQm0gMdlwSZ1gv02gRpsDFGc3MDk6r5w8Ac40S9ifIKEZXEpZP/vYiH3cI6JTDzip5vdQdlGQyMK77hu5dfJGjcCgOc4mDkh8WshMz6fw8LIbATObAf5zd/G1b+gKoBVrCHnFOshz63n5Pu8dZxbfwaFQklfAppsdV2g0/pxCcJl1QhYf7xihsuFDqPFtoayIuJgJii4qRe+WYTxAnpfQCwIIhiAj6ZcxszNRNNyKMfze2D0qrl4p0maM9dljGEL9SfSG9lUN3LZYCxZDk6y0cOaI59WrE4Y0HIlabRrWpVyJEGv84BZ9uZbub7036uDFqWQDmeFesy6N+L0Qo30DNTINzRk3hpfO3+XYMELWN+FODuHDLQ8EO4ZNN9GnUg9ygvXngkKb0H44HZ+UGfm7OmStt7dtYxYZqUkXmwpTE1i6S6YFpSVU7FqmirtZ4rRmVtpR02A5jczaBtNhRGOvcMP2XbgrbLeOrINlZ0LVo1EpeV14EoOCYxIbvN32ZBSAW8vicjxRkViNF4JuSpZYupFo3J9/JL/ciJCP43qfZ2z3l9sctpaGkxhQygfK3XMVzejaC29+nJW0GKuvCaAzPJltmEwxQq3G0Tp7ElHNx9qs9yKRbMDu9LGYb7oGIsBDhEIlCivVPCNFsNZJnsgmryFAzLrXw/o=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(366016)(23010399003)(10086099003)(921020)(6133799003)(18092099006)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?S+sLosfot5jCL8sIZBAJJYO31FF0YVKBMoSeeFooCXs2BjGY1NsltgQUHK+a?=
 =?us-ascii?Q?ABtMyzNXFxMwY9IYSnIHluOQMC51REh481vJscgVg0wRAS0iMuXS8TdeMv0/?=
 =?us-ascii?Q?kcvsXY9ozV0AQV+eyZq01SfM/mwjfSgyzy+2Hfsm6eYfg/6IZMftxX/VpmdY?=
 =?us-ascii?Q?PbYmcQiHVVmOCmM7KaL3T2p64W+5ESujU4WTgySZPbF/cHNCWLVwOD0Vbum/?=
 =?us-ascii?Q?iW4vmf3QGq0X91e8wKK0EANgfWXJo9wMELJONEiuiP+SZDnC4e7J6p06t5rj?=
 =?us-ascii?Q?smscbrpAdfZitjy2XoveBsx4AC5rmQeFNgYRT5C8cPQ9vSSsGdcRMbbyAOOF?=
 =?us-ascii?Q?mAyLps+tHR1xJSZu16hOILvyD8nDnSd+q9fYW5FMVD3pS5or3hbaObgwzy2F?=
 =?us-ascii?Q?8qm9a/KLGoodoTqF51HELY07NqyP/hyPoeD+BZCxZNPv6C90ZnDTGpwk19+7?=
 =?us-ascii?Q?U3VSszvMhfM5EzmkGfiPJFS4M3doqcTrHVMEvV1vPNycI5wOQmeFh6ZzqwMy?=
 =?us-ascii?Q?Tfiwd507kntRun0LLjo4cByhJ4aWJhsEq5ENzKKBfBXe5GytIUGYrXVEle5U?=
 =?us-ascii?Q?UbhqM9hBHJy+4giN88Buimo9vDKMVljmlmiy3dm45N9JxGpc9zb+IZCw6Kpy?=
 =?us-ascii?Q?JtkRAAvmq6LclDy73ndDJxRtOJQQYiqQNgwDISs1EuGRmu3iwJG++OScysBu?=
 =?us-ascii?Q?GHeviRaMgYEh4RR63BgJy8qzhMV1JW37d3aMmcGcG3xuN8oL1gICZgHlSUVT?=
 =?us-ascii?Q?08z8Zz82bC0Zbtta2HvkI0HASG96L6TERu+7v8XKjdJjmhLk+4kG5YauNnS0?=
 =?us-ascii?Q?TLqdbPUNS7ZHoWmPwD4q1X8Sw9utAldHUOuRwLvn7PZ/0VhP3mrp5jjfUdAx?=
 =?us-ascii?Q?7QQus/515AXoFmNvwCTwrbqzXEHqUv4sV9xCig1lQ8KBFztG66/AO3d86yz/?=
 =?us-ascii?Q?IMYvLVVBEFo20dkpH2YeHGyHRjB/8VE3RHT/Zvqq5zX6ojHLoPXo+oi3lnwm?=
 =?us-ascii?Q?cegevs9DsuIG9avMk/SIGCsibTGHZD3gel7t++QXqAMy1fVT8BZ4SXHROS9Z?=
 =?us-ascii?Q?no5vlldpX2VGUvD3dOFlknQZU15p9yd41WOF1df+SUfrow6LOG4CZFhMNS5T?=
 =?us-ascii?Q?Yvq9TLTpmBjVS/fMkjkRH27h9bzeZ/dSfVweEs8gxvnV0S0uig5P36lQzQ/+?=
 =?us-ascii?Q?c1iOiMM/9snszqOiEPjzWJ/SEI8d/FFqF/YlVQU1kqhNR8x88K8aTg28bhRn?=
 =?us-ascii?Q?GdM/KD8xspYPxsskCt/Io6AmNIAeNy5Py4srGhxpwHjg0cleqOCMSGvOOCzU?=
 =?us-ascii?Q?PNAn85AFQePkeGYLUqld6hFIgeO+SUpwHRvDCpIslR0IxzyJMjRugGsf1+X8?=
 =?us-ascii?Q?PnfLFNehPZ2sudW6uacNL8DLY5eBjzp+bpIMxfnTdqqkR6JgztI3A0FqZZiQ?=
 =?us-ascii?Q?mxfilDaXt2/SyMNVJSjHa3iKHYnuRp+CjbZkeYL2+gWoc8In7hnukW0s6L09?=
 =?us-ascii?Q?WXbLm+mNjN83i+BAGXinzJ7PtZnKa4S/foIombiJdfuHnoCWKlkryCjvH+zd?=
 =?us-ascii?Q?3WvuF872zIOsUx1NB5tLXIHEqedsnwWcL5yG0kChXVJDIgFs+lP4i+Iu4f8N?=
 =?us-ascii?Q?iitI/l0kLbZaRy6Bs5XJLHdvx6ih3LLbxPlQQn76WW1ykF+MoD7pLQ/dbbY+?=
 =?us-ascii?Q?yI1hAdi+9gVMTxX5/Akj/GdXOsjTK/BGZuwXw9wGGuN+N8wXaboQdCdlyMqK?=
 =?us-ascii?Q?4WkbKuR3Aw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 207c4062-b9dd-42ad-0caf-08dec88571be
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 13:20:59.9691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aVpcPK/hPxSpr1DDV27Hf7v0o/kjvy7bw6vY6AofeGzlahqZP0H657Rl1pSxiRO8syf6B4SCsoup/yQagtEqVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8203
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-64695-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julien.vuillaumier@nxp.com,m:alexi.birlinger@nxp.com,m:daniel.baluta@nxp.com,m:peng.fan@nxp.com,m:frank.li@nxp.com,m:jacopo.mondi@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:michael.riesch@collabora.com,m:anthony.mcgivern@arm.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:ai.luthra@ideasonboard.com,m:paul.elder@ideasonboard.com,m:geert@linux-m68k.org,m:sakari.ailus@linux.intel.com,m:hverkuil+cisco@kernel.org,m:antoine.bouyer@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,nxp.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C817679D77

Add debugfs entries to dump ISP registers, and some internal memory
regions used to store Vignetting, DRC global and DRC local coefficients.

Debug mode is activated with the `enable_debugfs` module's parameter, to
avoid runtime suspend which blocks register access when IP is not active,
so we can capture an ISP snapshot after a frame is decoded.

Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
---
 drivers/media/platform/nxp/neoisp/Makefile    |   2 +
 drivers/media/platform/nxp/neoisp/neoisp.h    |  16 +
 .../platform/nxp/neoisp/neoisp_debugfs.c      | 495 ++++++++++++++++++
 .../media/platform/nxp/neoisp/neoisp_main.c   |  19 +
 4 files changed, 532 insertions(+)
 create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_debugfs.c

diff --git a/drivers/media/platform/nxp/neoisp/Makefile b/drivers/media/platform/nxp/neoisp/Makefile
index 7652df785e98..c68e216980dc 100644
--- a/drivers/media/platform/nxp/neoisp/Makefile
+++ b/drivers/media/platform/nxp/neoisp/Makefile
@@ -4,3 +4,5 @@ obj-$(CONFIG_VIDEO_NXP_NEOISP) += neoisp.o
 
 neoisp-objs := neoisp_ctx.o \
 	neoisp_main.o
+
+neoisp-$(CONFIG_DEBUG_FS) += neoisp_debugfs.o
diff --git a/drivers/media/platform/nxp/neoisp/neoisp.h b/drivers/media/platform/nxp/neoisp/neoisp.h
index a777625974fe..d8ddf057eb4d 100644
--- a/drivers/media/platform/nxp/neoisp/neoisp.h
+++ b/drivers/media/platform/nxp/neoisp/neoisp.h
@@ -9,6 +9,7 @@
 #define __NXP_NEOISP_H
 
 #include <linux/bits.h>
+#include <linux/debugfs.h>
 #include <linux/media/nxp/nxp_neoisp.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -223,8 +224,23 @@ struct neoisp_dev_s {
 	dma_addr_t dummy_dma;
 	u32 dummy_size;
 	struct neoisp_context_s *context;
+	struct dentry *debugfs_entry;
+	struct debugfs_regset32 *regset;
 };
 
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+void neoisp_debugfs_init(struct neoisp_dev_s *neoispd);
+void neoisp_debugfs_exit(struct neoisp_dev_s *neoispd);
+#else
+static inline void neoisp_debugfs_init(struct neoisp_dev_s *neoispd)
+{
+}
+
+static inline void neoisp_debugfs_exit(struct neoisp_dev_s *neoispd)
+{
+}
+#endif
+
 static inline int neoisp_node_link_is_enabled(struct neoisp_node_s *node)
 {
 	return (node->intf_link->flags & MEDIA_LNK_FL_ENABLED);
diff --git a/drivers/media/platform/nxp/neoisp/neoisp_debugfs.c b/drivers/media/platform/nxp/neoisp/neoisp_debugfs.c
new file mode 100644
index 000000000000..e730569184b3
--- /dev/null
+++ b/drivers/media/platform/nxp/neoisp/neoisp_debugfs.c
@@ -0,0 +1,495 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * NEOISP debugfs definition
+ *
+ * Copyright 2024-2026 NXP
+ */
+
+#include <linux/debugfs.h>
+
+#include "neoisp.h"
+#include "neoisp_ctx.h"
+#include "neoisp_regs.h"
+
+#define NEOISP_DFS_REG(reg) {.name = #reg, .offset = reg}
+
+static const struct debugfs_reg32 neoisp_dfs_regs[] = {
+	NEOISP_DFS_REG(NEO_PIPE_CONF_SOFT_RESET),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_BUS_TXPARAM),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_REG_XFR_DIS),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_CSI_CTRL),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_FRAME_NUM),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_REG_SHD_CTRL),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_REG_SHD_CMD),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_TRIG_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_INT_EN0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_INT_STAT0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_CSI_STAT),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_IMG_CONF_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_IMG_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_IMG0_IN_ADDR_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_IMG1_IN_ADDR_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_OUTCH0_ADDR_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_OUTCH1_ADDR_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_OUTIR_ADDR_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_IMG0_IN_LS_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_IMG1_IN_LS_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_OUTCH0_LS_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_OUTCH1_LS_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_OUTIR_LS_CAM0),
+	NEOISP_DFS_REG(NEO_PIPE_CONF_SKIP_CTRL0),
+	NEOISP_DFS_REG(NEO_HC_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_POINT1_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_POINT2_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_POINT3_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_POINT4_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_OFFSET0_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_OFFSET1_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_OFFSET2_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_OFFSET3_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_OFFSET4_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_RATIO01_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_RATIO23_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_RATIO4_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_NPOINT0_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_NPOINT1_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_NPOINT2_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_NPOINT3_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS0_KNEE_NPOINT4_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_POINT1_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_POINT2_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_POINT3_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_POINT4_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_OFFSET0_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_OFFSET1_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_OFFSET2_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_OFFSET3_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_OFFSET4_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_RATIO01_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_RATIO23_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_RATIO4_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_NPOINT0_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_NPOINT1_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_NPOINT2_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_NPOINT3_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_DECOMPRESS1_KNEE_NPOINT4_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB0_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB0_R_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB0_GR_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB0_GB_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB0_B_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB1_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB1_R_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB1_GR_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB1_GB_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB1_B_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB2_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB2_R_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB2_GR_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB2_GB_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_OB_WB2_B_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_GAIN_OFFSET_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_GAIN_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_GAIN_SHIFT_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_LUMA_TH_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_LUMA_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_DOWNSCALE_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_UPSCALE_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_POST_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_S_GAIN_OFFSET_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_S_GAIN_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_S_GAIN_SHIFT_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_S_LUMA_TH_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_S_LUMA_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_S_DOWNSCALE_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_S_UPSCALE_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_S_POST_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_HDR_MERGE_S_LINE_NUM_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_ROI_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_ROI_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_REDGAIN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_BLUEGAIN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_POINT1_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_POINT2_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_HOFFSET_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_VOFFSET_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_POINT1_SLOPE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_POINT2_SLOPE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_LUMA_TH_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CSC_MAT0_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CSC_MAT1_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CSC_MAT2_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CSC_MAT3_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CSC_MAT4_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_R_GR_OFFSET_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_GB_B_OFFSET_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CNT_WHITE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_SUMRL_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_SUMRH_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_SUMGL_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_SUMGH_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_SUMBL_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_SUMBH_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_SUMRGL_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_SUMRGH_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_SUMBGL_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_SUMBGH_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_STAT_BLK_SIZE0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_STAT_CURR_BLK_Y0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI0_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI0_PIXCNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI0_SUMRED_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI0_SUMGREEN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI0_SUMBLUE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI1_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI1_PIXCNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI1_SUMRED_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI1_SUMGREEN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI1_SUMBLUE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI2_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI2_PIXCNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI2_SUMRED_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI2_SUMGREEN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI2_SUMBLUE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI3_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI3_PIXCNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI3_SUMRED_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI3_SUMGREEN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI3_SUMBLUE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI4_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI4_PIXCNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI4_SUMRED_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI4_SUMGREEN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI4_SUMBLUE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI5_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI5_PIXCNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI5_SUMRED_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI5_SUMGREEN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI5_SUMBLUE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI6_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI6_PIXCNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI6_SUMRED_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI6_SUMGREEN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI6_SUMBLUE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI7_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI7_PIXCNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI7_SUMRED_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI7_SUMGREEN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI7_SUMBLUE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI8_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI8_PIXCNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI8_SUMRED_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI8_SUMGREEN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI8_SUMBLUE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI9_POS_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI9_PIXCNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI9_SUMRED_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI9_SUMGREEN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_CROI9_SUMBLUE_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_GR_AVG_IN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_GB_AVG_IN_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_GR_GB_CNT_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_GR_SUM_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_GB_SUM_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_GR2_SUM_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_GB2_SUM_CAM0),
+	NEOISP_DFS_REG(NEO_COLOR_TEMP_GRGB_SUM_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_CCM0_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_CCM1_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_CCM2_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_CCM0_TH_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_CCM1_TH_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_CCM2_TH_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_ROI0_POS_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_ROI0_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_ROI1_POS_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_ROI1_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_HIST0_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_HIST0_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_HIST1_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_RGBIR_HIST1_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_ROI0_POS_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_ROI0_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_ROI1_POS_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_ROI1_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_HIST0_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_HIST0_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_HIST1_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_HIST1_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_HIST2_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_HIST2_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_HIST3_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_STAT_HIST3_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_POINT1_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_POINT2_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_POINT3_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_POINT4_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_OFFSET0_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_OFFSET1_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_OFFSET2_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_OFFSET3_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_OFFSET4_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_RATIO01_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_RATIO23_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_RATIO4_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_NPOINT0_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_NPOINT1_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_NPOINT2_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_NPOINT3_CAM0),
+	NEOISP_DFS_REG(NEO_IR_COMPRESS_KNEE_NPOINT4_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YPEAK_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YEDGE_TH0_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YEDGE_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YEDGES_TH0_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YEDGES_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YEDGEA_TH0_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YEDGEA_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YLUMA_X_TH0_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YLUMA_Y_TH_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YLUMA_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_YALPHA_GAIN_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CPEAK_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CEDGE_TH0_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CEDGE_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CEDGES_TH0_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CEDGES_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CEDGEA_TH0_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CEDGEA_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CLUMA_X_TH0_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CLUMA_Y_TH_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CLUMA_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_CALPHA_GAIN_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_EDGE_STAT_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_EDGES_STAT_CAM0),
+	NEOISP_DFS_REG(NEO_BNR_STRETCH_CAM0),
+	NEOISP_DFS_REG(NEO_VIGNETTING_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_VIGNETTING_BLK_CONF_CAM0),
+	NEOISP_DFS_REG(NEO_VIGNETTING_BLK_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_VIGNETTING_BLK_STEPY_CAM0),
+	NEOISP_DFS_REG(NEO_VIGNETTING_BLK_STEPX_CAM0),
+	NEOISP_DFS_REG(NEO_VIGNETTING_BLK_C_LINE_CAM0),
+	NEOISP_DFS_REG(NEO_VIGNETTING_BLK_C_ROW_CAM0),
+	NEOISP_DFS_REG(NEO_VIGNETTING_BLK_C_FRACY_CAM0),
+	NEOISP_DFS_REG(NEO_IDBG1_LINE_NUM),
+	NEOISP_DFS_REG(NEO_IDBG1_CURR_LINE_NUM),
+	NEOISP_DFS_REG(NEO_IDBG1_IMA),
+	NEOISP_DFS_REG(NEO_IDBG1_IMD),
+	NEOISP_DFS_REG(NEO_IDBG1_DONE_STAT),
+	NEOISP_DFS_REG(NEO_DEMOSAIC_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_DEMOSAIC_ACTIVITY_CTL_CAM0),
+	NEOISP_DFS_REG(NEO_DEMOSAIC_DYNAMICS_CTL0_CAM0),
+	NEOISP_DFS_REG(NEO_DEMOSAIC_DYNAMICS_CTL2_CAM0),
+	NEOISP_DFS_REG(NEO_RGB_TO_YUV_GAIN_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_RGB_TO_YUV_MAT0_CAM0),
+	NEOISP_DFS_REG(NEO_RGB_TO_YUV_MAT1_CAM0),
+	NEOISP_DFS_REG(NEO_RGB_TO_YUV_MAT2_CAM0),
+	NEOISP_DFS_REG(NEO_RGB_TO_YUV_MAT3_CAM0),
+	NEOISP_DFS_REG(NEO_RGB_TO_YUV_MAT4_CAM0),
+	NEOISP_DFS_REG(NEO_RGB_TO_YUV_MAT5_CAM0),
+	NEOISP_DFS_REG(NEO_RGB_TO_YUV_OFFSET0_CAM0),
+	NEOISP_DFS_REG(NEO_RGB_TO_YUV_OFFSET1_CAM0),
+	NEOISP_DFS_REG(NEO_RGB_TO_YUV_OFFSET2_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_ROI0_POS_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_ROI0_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_ROI1_POS_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_ROI1_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_GROI_SUM_SHIFT_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_GBL_GAIN_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_LCL_BLK_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_LCL_STRETCH_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_LCL_BLK_STEPY_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_LCL_BLK_STEPX_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_LCL_SUM_SHIFT_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_ALPHA_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_GROI0_SUM_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_GROI1_SUM_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_STAT_BLK_Y_CAM0),
+	NEOISP_DFS_REG(NEO_DRC_CURR_YFRACT_CAM0),
+	NEOISP_DFS_REG(NEO_NR_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_NR_BLEND_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_NR_BLEND_TH0_CAM0),
+	NEOISP_DFS_REG(NEO_NR_EDGECNT_CAM0),
+	NEOISP_DFS_REG(NEO_DF_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_DF_TH_SCALE_CAM0),
+	NEOISP_DFS_REG(NEO_DF_BLEND_SHIFT_CAM0),
+	NEOISP_DFS_REG(NEO_DF_BLEND_TH0_CAM0),
+	NEOISP_DFS_REG(NEO_DF_EDGECNT_CAM0),
+	NEOISP_DFS_REG(NEO_EE_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_EE_CORING_CAM0),
+	NEOISP_DFS_REG(NEO_EE_CLIP_CAM0),
+	NEOISP_DFS_REG(NEO_EE_MASKGAIN_CAM0),
+	NEOISP_DFS_REG(NEO_EE_EDGECNT_CAM0),
+	NEOISP_DFS_REG(NEO_CCONVMED_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_CAS_GAIN_CAM0),
+	NEOISP_DFS_REG(NEO_CAS_CORR_CAM0),
+	NEOISP_DFS_REG(NEO_CAS_OFFSET_CAM0),
+	NEOISP_DFS_REG(NEO_PACKETIZER_CH0_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_PACKETIZER_CH12_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_PACKETIZER_PACK_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_IMAT0_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_IMAT1_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_IMAT2_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_IMAT3_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_IMAT4_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_IMAT5_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_IOFFSET0_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_IOFFSET1_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_IOFFSET2_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_OMAT0_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_OMAT1_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_OMAT2_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_OMAT3_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_OMAT4_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_OMAT5_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_OOFFSET0_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_OOFFSET1_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_OOFFSET2_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_GAMMA0_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_GAMMA1_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_GAMMA2_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_BLKLVL0_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_BLKLVL1_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_BLKLVL2_CTRL_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_LOWTH_CTRL01_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_LOWTH_CTRL2_CAM0),
+	NEOISP_DFS_REG(NEO_GCM_MAT_CONFG_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI0_POS_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI0_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI1_POS_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI1_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI2_POS_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI2_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI3_POS_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI3_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI4_POS_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI4_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI5_POS_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI5_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI6_POS_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI6_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI7_POS_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI7_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI8_POS_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI8_SIZE_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_FIL0_COEFFS1_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_FIL0_COEFFS2_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_FIL0_SHIFT_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_FIL1_COEFFS0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_FIL1_COEFFS1_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_FIL1_COEFFS2_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_FIL1_SHIFT_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI0_SUM0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI0_SUM1_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI1_SUM0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI1_SUM1_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI2_SUM0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI2_SUM1_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI3_SUM0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI3_SUM1_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI4_SUM0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI4_SUM1_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI5_SUM0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI5_SUM1_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI6_SUM0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI6_SUM1_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI7_SUM0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI7_SUM1_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI8_SUM0_CAM0),
+	NEOISP_DFS_REG(NEO_AUTOFOCUS_ROI8_SUM1_CAM0),
+	NEOISP_DFS_REG(NEO_IDBG2_LINE_NUM),
+	NEOISP_DFS_REG(NEO_IDBG2_CURR_LINE_NUM),
+	NEOISP_DFS_REG(NEO_IDBG2_IMA),
+	NEOISP_DFS_REG(NEO_IDBG2_IMD),
+	NEOISP_DFS_REG(NEO_IDBG2_DONE_STAT),
+};
+
+/* Structure to store word when reading memory */
+union udata_t {
+	u8 byte[4];
+	u16 half[2];
+	u32 word;
+};
+
+static inline int
+neoisp_dump_memory(struct seq_file *m, enum isp_block_map_e map, int wsize)
+{
+	struct neoisp_dev_s *neoispd = m->private;
+	union udata_t data;
+	u32 addr;
+	u32 *src = (u32 *)neoispd->local_mem;
+	u32 offset = ISP_GET_OFF(map) / sizeof(u32);
+	u32 size = ISP_GET_SZ(map) / sizeof(u32);
+	int i, j;
+
+	for (i = 0; i < size; i++) {
+		addr = offset * sizeof(u32);
+		data.word = src[offset++];
+
+		if (wsize == sizeof(u8)) {
+			for (j = 0; j < ARRAY_SIZE(data.byte); j++)
+				seq_printf(m, "%#x: %#04x\n",
+					   addr + (j * wsize), data.byte[j]);
+		}
+
+		if (wsize == sizeof(u16)) {
+			for (j = 0; j < ARRAY_SIZE(data.half); j++)
+				seq_printf(m, "%#x: %#06x\n",
+					   addr + (j * wsize), data.half[j]);
+		}
+	}
+
+	return 0;
+}
+
+static int neoisp_dump_vignetting_show(struct seq_file *m, void *private)
+{
+	return neoisp_dump_memory(m, NEO_VIGNETTING_TABLE_MAP, sizeof(u16));
+}
+DEFINE_SHOW_ATTRIBUTE(neoisp_dump_vignetting);
+
+static int neoisp_dump_drc_global_show(struct seq_file *m, void *private)
+{
+	return neoisp_dump_memory(m, NEO_DRC_GLOBAL_TONEMAP_MAP, sizeof(u16));
+}
+DEFINE_SHOW_ATTRIBUTE(neoisp_dump_drc_global);
+
+static int neoisp_dump_drc_local_show(struct seq_file *m, void *private)
+{
+	return neoisp_dump_memory(m, NEO_DRC_LOCAL_TONEMAP_MAP, sizeof(u8));
+}
+DEFINE_SHOW_ATTRIBUTE(neoisp_dump_drc_local);
+
+void neoisp_debugfs_init(struct neoisp_dev_s *neoispd)
+{
+	neoispd->regset = devm_kzalloc(neoispd->dev, sizeof(*neoispd->regset), GFP_KERNEL);
+	if (!neoispd->regset)
+		return;
+
+	neoispd->regset->regs = neoisp_dfs_regs;
+	neoispd->regset->nregs = ARRAY_SIZE(neoisp_dfs_regs);
+	neoispd->regset->base = neoispd->mmio;
+
+	neoispd->debugfs_entry = debugfs_create_dir(dev_name(neoispd->dev), NULL);
+
+	debugfs_create_regset32("registers", 0400, neoispd->debugfs_entry, neoispd->regset);
+
+	debugfs_create_file("vignetting", 0400, neoispd->debugfs_entry, neoispd,
+			    &neoisp_dump_vignetting_fops);
+	debugfs_create_file("drc_global", 0400, neoispd->debugfs_entry, neoispd,
+			    &neoisp_dump_drc_global_fops);
+	debugfs_create_file("drc_local", 0400, neoispd->debugfs_entry, neoispd,
+			    &neoisp_dump_drc_local_fops);
+}
+
+void neoisp_debugfs_exit(struct neoisp_dev_s *neoispd)
+{
+	debugfs_remove_recursive(neoispd->debugfs_entry);
+}
diff --git a/drivers/media/platform/nxp/neoisp/neoisp_main.c b/drivers/media/platform/nxp/neoisp/neoisp_main.c
index b08995403c59..ca61af8cf66e 100644
--- a/drivers/media/platform/nxp/neoisp/neoisp_main.c
+++ b/drivers/media/platform/nxp/neoisp/neoisp_main.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -41,6 +42,10 @@ static int standalone_mdev;
 module_param_named(standalone_mdev, standalone_mdev, uint, 0644);
 MODULE_PARM_DESC(standalone_mdev, " Create standalone neoisp media device, default is 0 (off)");
 
+static int enable_debugfs;
+module_param_named(enable_debugfs, enable_debugfs, uint, 0644);
+MODULE_PARM_DESC(enable_debugfs, " Turn on/off debugfs, default is 0 (off)");
+
 static inline bool node_desc_is_output(const struct neoisp_node_desc_s *desc)
 {
 	return desc->buf_type == V4L2_BUF_TYPE_META_OUTPUT ||
@@ -1766,9 +1771,18 @@ static int neoisp_probe(struct platform_device *pdev)
 	neoisp_init_hw(neoispd);
 	neoisp_set_default_context(neoispd);
 
+	if (enable_debugfs) {
+		neoisp_debugfs_init(neoispd);
+		/* Increase pm_runtime counter to prevent suspend */
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret)
+			goto err_pm_runtime_suspend;
+	}
+
 	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
+	dev_dbg(dev, "probe: done (%d) debugfs (%x)\n", ret, enable_debugfs);
 	return 0;
 
 err_pm_runtime_suspend:
@@ -1785,6 +1799,11 @@ static void neoisp_remove(struct platform_device *pdev)
 {
 	struct neoisp_dev_s *neoispd = platform_get_drvdata(pdev);
 
+	if (neoispd->regset) {
+		neoisp_debugfs_exit(neoispd);
+		pm_runtime_put(neoispd->dev);
+	}
+
 	neoisp_destroy_devices(neoispd);
 
 	if (standalone_mdev)
-- 
2.53.0


