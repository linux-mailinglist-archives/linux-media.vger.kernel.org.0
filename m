Return-Path: <linux-media+bounces-64716-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FXfyAtA4LGrHNwQAu9opvQ
	(envelope-from <linux-media+bounces-64716-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 18:50:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE2867B13D
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 18:50:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=a3w9uJ5h;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64716-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64716-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E86F030BCB6E
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 16:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 951AF402BA0;
	Fri, 12 Jun 2026 16:50:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012065.outbound.protection.outlook.com [52.101.66.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA10531F998;
	Fri, 12 Jun 2026 16:50:07 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781283009; cv=fail; b=liymKDqbkFHMtBJRPXxSsCtM7dP1Gh/MvQw4dXJmr0WNjI1BnIZB14MsbYq1oJ/7qW+CxifsC60W4oyjscicsBgA8j+oQttIHDfzd3U2WGRASwazrjlzIyYtfO+42zDYbjwzAytrWfsUd8rsSGtkW4LZRSIquakrVZfptN8tMNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781283009; c=relaxed/simple;
	bh=z8VrCIM6jto8Vt6YJMT0WES4lKx76HzvvpXWLPOElYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sExoX6hm2wpPNB21lusdm7k38Ctl7hTF4klJteM5dmGas4JsmzKfYmwczeKPDUFxyUeb74La0PskBL3pZaGXELnItlbnjRmwHtr7ys5zNgYxTboAJFpiScKjGcb4N3cxnUffJVM3e5WD95aOuOEPs0L7bCaIk3DvIuwQJ4BEPhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=a3w9uJ5h; arc=fail smtp.client-ip=52.101.66.65
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fYZr3HMFYtYct7j2PmIj8RMx4fg+G5cjsxEyhtttW4rk0AoCFiG6ZxO7Zte5xCpIDisF9JZnz+da/Wg1u6YtJjbSLhgfvcqLMzpcy7aHDTaMDPXVEkE1AXuupdlwz5CFt9ZXQWdVHTSTD5tZP6IvFWOFrtSTHET0uFmn1hCCfC2KUq3yJXqOazoWNQzNAj8j2D+KY/MOzKfELGSqu479RngOafNrYa8F0UZ5KBcOpWfXiKDUT2RGzx9JpR5Ijqico6sAN/A5t4rR6LKnNsGiGys/8Av1jvRqrh8H5LiPozbY+eBMOJ/05z/82SaBdIxis2yz6jhKpnZeqtMXlEN2UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sDJOZSh0yVW8ptHHyrvHsfIlJIsFpCg0IYF+656SEKQ=;
 b=LU27Y72uI1TEi+dykRhfbbwHSVexW061BRVsKemjFCuuJWIP4HYrANAkzoCKZi4vkMqfcBYwQ0iuTJ6t9PDkbJ8KEsHb0rlFjoua7v9+X0ua4NXsnfHi/EIR68UyqISRxI6krlS7Dk+gcD3oX0QckhPZnIY1AbzxDdEPQu63ZAg0lQlc0Yr++yO1JsXdroww92ig47jX7Qi6woRmNR8t1KRraXVU92onr9v4K4xaq+FWpDK59hKew6qOFtGCHxRo6x1xtEef8j0K0IDGtjslVI61yqqSpVEvSfzEkFSzPUq7W9NlhIoeHg0CK/roRWPENV2i4u5UV/U3UKi1QddQLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDJOZSh0yVW8ptHHyrvHsfIlJIsFpCg0IYF+656SEKQ=;
 b=a3w9uJ5hb2+lYDD07iwmy/5nImpWp/fyvzL1df2mj7vbrY8iYKSDMYky6O9UgsD4kuSQ2WMDjnSGe+rnfBzhI3tPZU/UIQgjULluNrOy8Ie/9MJiugTmy6IPATEAOIuc6K7lIeqcMK5rZo+Vi05sG5gZDDG1P05MBm4sQL0rZYOpnnCV9+6cLq/cqBmeS/6ikTAXsuB3L/QKUs6OkFaBHvLUlqESJbqziq6Y2V9RtLkxV00wSri6fo4+UItr0y6J2w/PQ5WL7tYtGx5u/BHtroNhjL6JRDya9qZRpmH8MpZQJf5L5PChNM13HT6pJeDXYmS0/z7D161surNUKSTn0g==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB11544.eurprd04.prod.outlook.com (2603:10a6:150:2c1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 16:50:04 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 16:50:04 +0000
Date: Fri, 12 Jun 2026 11:49:51 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com,
	daniel.baluta@nxp.com, peng.fan@nxp.com, frank.li@nxp.com,
	jacopo.mondi@ideasonboard.com, laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, michael.riesch@collabora.com,
	anthony.mcgivern@arm.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, ai.luthra@ideasonboard.com,
	paul.elder@ideasonboard.com, geert@linux-m68k.org,
	sakari.ailus@linux.intel.com, hverkuil+cisco@kernel.org
Subject: Re: [PATCH v3 7/8] media: platform: neoisp: Add debugfs support
Message-ID: <aiw4r5NXBBrMZ0a4@SMW015318>
References: <20260612132039.2089051-1-antoine.bouyer@nxp.com>
 <20260612132039.2089051-8-antoine.bouyer@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612132039.2089051-8-antoine.bouyer@nxp.com>
X-ClientProxiedBy: PH7PR10CA0013.namprd10.prod.outlook.com
 (2603:10b6:510:23d::9) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB11544:EE_
X-MS-Office365-Filtering-Correlation-Id: 49c6a2ac-1d99-411b-c1e7-08dec8a2a5ea
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|19092799006|6133799003|22082099003|18092099006|18002099003|10086099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
 1S9ma+UKxnekJV+Z7zpBQz7grkuQbWeVDUee9oTvk1MSnx3hX8eEjwHZ7GhCBK+JBxw4JoVb/pS4NQuVbDz7i7CgWSe4SeXlic6v6PjCBZqx8R9Vjhei5KIA68d6CoNBB1CJuU5O2Z4GqENQqFkxZ+3refDnC+TTDGOYmrE6KCEl1msVbnlEKXdtDqEueKu5YDKSDROobtCAGardWIOgsaNOisNgZTqmypGg70RpDWxvPtQUt94jTg1re+IFmUggaqNLth6CvSR4fbr0nB9Yy2KbMpNMqM4ZBzXj6N8ma+GXgaNgdpdTs1py9SayHE45H/Lq+kaWd7CAYRXwcvVGBOvLKE3r5kK+UQ1vKLhZ9ob0EQPhO4OeH++mO1KjQsbAsFBKILWsQolEgK5NsGOwL76BMLUqCcMCEQ7Lub4e4Wx+qtUZ0w8aQeP2HqyHBIuOiQrm0hrNuvdtv3fEtlMQqNI3R/hyQIuEDpsoowIQjDzTZopzkwiMbbHDd7W8qesRoxxgp02GqWtbxANmKPQWFZ/w0sdPqsrkAkguyRrYRcksiytJrfm4pXccTw+9D1eKyHCIhKVI0aH243jjmGc8gjDNPY9D//L/4yNq1XfJKf4RUj+chPObp8QJ/k+8O+bsML67UxKoHpuxDwCUelufVug5YAaOBsGpjtQfQQFa5ixPO0H7mORFmbQ9H1AXuDJs
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(19092799006)(6133799003)(22082099003)(18092099006)(18002099003)(10086099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?/YD+vHNGdRmF+xWH1UPF6SHkVNuV1FuevN9rr7EOFqsv+NevienE5zX264+B?=
 =?us-ascii?Q?KvD8DZWkYlpMi5idV7tnuwyZTS6RF1pBUl7tyykcH1WhO+DrHHB4CbCn7VCh?=
 =?us-ascii?Q?zaAHJJPJHgtBvjKEoDJ3VBclrcKVoTHrcm2EYI27S6EsfVvUPm8/Bg1tzOOy?=
 =?us-ascii?Q?tjeH0fWzsuF1JknYqYhX4q0XoIaiYv46AU6ypsTeR7/sLNIgI7SMqs5hm7zg?=
 =?us-ascii?Q?zrN48OIoy+xxkb0vYRP/i/AhMuCNNvHuVYBe9CBDRa+QByBna3HUbgut77XR?=
 =?us-ascii?Q?0M6kpAG1Lk/sfDEtQV7OegTa68Dy8neRXA9PknRlUrZBiV0sWr5Y1qH6IM5g?=
 =?us-ascii?Q?8Jn7wgqpo6NRjMWSmtcye1/8JrJZCpk9VkreMUvNDbLNmGGSDpgeDjqPCL11?=
 =?us-ascii?Q?iffPqUEQ6wft0ywLtd4JkFHIyihm1/pN004QjFasQTihA6qFpcGobLwzgvx9?=
 =?us-ascii?Q?PNAiIa4aYftZuUmn5CTfsVTlyf9ZPeF3Upf3HTxtWedjuxTMXsttlfts4rCn?=
 =?us-ascii?Q?bOCyl4UvzqTZUHcADvvBZcbOh7n9Ldvs4bYvfkrRuyCJiA3ybD4uKFxsTwt+?=
 =?us-ascii?Q?64NWwJSIjS4vrjJ2Pb7jkpbBZbY0sHq4tyBnkMdsejXmmk923JZrI26gEamm?=
 =?us-ascii?Q?obWJXgDgJ4hiYkSDOHQK5Fua0JNoOGvPM1qYx5JcXuXTMZ6wYeHIZRX3gZmS?=
 =?us-ascii?Q?6CZSaKB5ONBwlkMq1gy/CAtV9TGzfIezZ64e/5imalnXYS4kCetBSJn1NDKR?=
 =?us-ascii?Q?wnFfNYIeRj3n6EkL0k1TnT4S7N4fxC18lbuT26sdlgc/UIfaKWcAwtFOW+uz?=
 =?us-ascii?Q?WX7jcJQP72Wmzyz+1G55DCqOBRrx6u32vM3GLKVcT92kuk1N5r8p0d63eaWJ?=
 =?us-ascii?Q?yS2kTkF5PRBw3BopG+hrTGe1DTrf7erOUP1CfEmMZ/95L4vVCmPBq/8YGz6n?=
 =?us-ascii?Q?9t3pkix44/3KnunMg1Uvin0zrw8DmCKCfoOHOPsRGwBBtq38vx3/zURdQG6Y?=
 =?us-ascii?Q?yMVgBF5+40cI9dGocAnSnYHvwd8P7rlWuNWiHvaMgZH6/MirKKSsAXRIUs12?=
 =?us-ascii?Q?pckU1ChTkLAAwaEONPIy3y4lWPKfaCRQM4x6RmNpsF35rk47u+b1Ai2U1cgh?=
 =?us-ascii?Q?UOEI2wsBd41jrreL/V8OC92/WUZrPjpNZjH8hwhz5ssYMPMHkCozlTKL782D?=
 =?us-ascii?Q?gth7cTXAviJevPCb62/i8jBnLK6HlJhcPNRB9dHssk5KyWZQ4YHly4Td4LIu?=
 =?us-ascii?Q?XWEoJCAQvm7E9uLfRTjF1FCctON4VWjnUkxqFQVW6Sb4TSntkh20EZ2JkQXK?=
 =?us-ascii?Q?XIh1KL4DhJHgS//IrNgei+9+aSeL1hdd064oQk2GkEdsvQydBcUJDl2OVCXN?=
 =?us-ascii?Q?9yRJ0VR9kj2/xshlQvL+uSR7JSzp56lef8lj3Vk2PyKlYBrt3KppufARQvR5?=
 =?us-ascii?Q?CVPgrb2YpzS05/Cj17bTpQQgODjw4jfTFSmNlA/kw8KrzBjUGmGKARLwk3rM?=
 =?us-ascii?Q?Sa5/ahlqtC6p4GIUH6vIexsxgO7ISWSAyPyb07azHZikmGGR9XufaJp13AX0?=
 =?us-ascii?Q?x5Zvym7gZG9QLIOfKRYF+RhAZD7yedQjsexjn++CWov43ZUX8w+vAlPWfEEp?=
 =?us-ascii?Q?Vw8z+w+FNn6QBn8vgwjhDP0Y+Vc1+500mnZKLATjYE/K9QYBCnupusgXG8PO?=
 =?us-ascii?Q?wnVuk8FKB4pCQJLEwbi1SbLNfmU6Sj9i11vlzxBxWaeuVuoBMfs7mtyctXMQ?=
 =?us-ascii?Q?+D2mD6gjDsyLsJqMR7q4iMqkwEtnZEA5sAlVgTaxUEpXWeuZOVmO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49c6a2ac-1d99-411b-c1e7-08dec8a2a5ea
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 16:50:04.0425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j+x7lu3kFsy6iq9/TK3TiENDjqWRuyzgik03/D+fO02bIOh9XLwlgjqUDH+ibs8CyCRgkhJoqaCOU0fXZDIhhkwLA1J9YMgoxxGzqdzkLa0rvsoTxdY5gBpPfk8VLv3u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11544
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64716-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:antoine.bouyer@nxp.com,m:julien.vuillaumier@nxp.com,m:alexi.birlinger@nxp.com,m:daniel.baluta@nxp.com,m:peng.fan@nxp.com,m:frank.li@nxp.com,m:jacopo.mondi@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:michael.riesch@collabora.com,m:anthony.mcgivern@arm.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:ai.luthra@ideasonboard.com,m:paul.elder@ideasonboard.com,m:geert@linux-m68k.org,m:sakari.ailus@linux.intel.com,m:hverkuil+cisco@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,SMW015318:mid,vger.kernel.org:from_smtp,oss.nxp.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5AE2867B13D

On Fri, Jun 12, 2026 at 03:20:38PM +0200, Antoine Bouyer wrote:
> Add debugfs entries to dump ISP registers, and some internal memory
> regions used to store Vignetting, DRC global and DRC local coefficients.
>
> Debug mode is activated with the `enable_debugfs` module's parameter, to
> avoid runtime suspend which blocks register access when IP is not active,
> so we can capture an ISP snapshot after a frame is decoded.

Look like you needn't this option, see below implementaiton. If you correct
set regset->dev, it will call pm_runtime_get_sync() for you

static int debugfs_regset32_show(struct seq_file *s, void *data)
{
	struct debugfs_regset32 *regset = s->private;

	if (regset->dev)
		pm_runtime_get_sync(regset->dev);

	debugfs_print_regs32(s, regset->regs, regset->nregs, regset->base, "");

	if (regset->dev)
		pm_runtime_put(regset->dev);

	return 0;
}

Frank


