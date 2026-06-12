Return-Path: <linux-media+bounces-64718-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2467LXg6LGofOAQAu9opvQ
	(envelope-from <linux-media+bounces-64718-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 18:57:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C9E67B20E
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 18:57:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=EXU9ADyD;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64718-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64718-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ABD923001A61
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 16:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF7053FF88C;
	Fri, 12 Jun 2026 16:55:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013063.outbound.protection.outlook.com [52.101.83.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB5A400DF4;
	Fri, 12 Jun 2026 16:55:45 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781283347; cv=fail; b=YIBoU2ZMakvMgSgsMTBxjTHLy6D8Cn2L0qqn1FOBooX8WDzGmeJGyoYs+23mdaNi/3D9DmljMzBK3UvLG1DIN3doNiE6yZ1n5+0ZHIoAdAf1Gr6VzoBt/1Uek79qjCdbGbSLoT5W3WFbk7o4YKTDtTRaG5HqDaTvZegUI72gi7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781283347; c=relaxed/simple;
	bh=5uW25Q59jzofXy7LEzrVVB1XU/YVslQf+wNO0GNrDf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=V88O4U3mqsbdJNzZorckd/AaE4OeBt/JBmPbKbXVh/r3RVweAEh9VIQ1DJmVg9bCOUENQsFq1yL3Addcr71kk/v3hiUHPHglpwZKFyDcbOvpNwHTkcbw9J2xZijKDgDW0XNOoP6h9USXeUqBw2ux+ixu79tJWpB2m2PYvaxvOrc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EXU9ADyD; arc=fail smtp.client-ip=52.101.83.63
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PdXnLbu4TscwcEPJI1d59tzWijUTq1d9xRE9iZOEbodkgc65dKvva4KJ/EovRthxxxuMYzmoGcpt+GHMxWrYPeQLxfENdJNhrrwA3LRD230qttyprBqmjiGC5DCwDKT3SUwj4o60NiLsqsXinaUdBgcMqoPLW9dx39W5eekasos8j0aIguv29T3oQLUYP6Fd8Yxl0TG71J7XTiTLLbjyA9QE4Y9lt6E+8ZY5Qepas7GmRZJpdXaURc2q6JuDmg0iWUyGptRqPuOtO7VAnL6/S4fvldhWokOWrDbK8tI+serozKF0XGt5rKsxw+mR8ZLGmOkS+hcHmD+H91Ww/u/V2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=STTlgm1YZ1O9G8j3yPM8uxED+OWEdoeaqnWuhmEau98=;
 b=ocqsiLlkdmozfFy7lW0w5exYvzxhBt91xY4ElXUPagDXqaMdMwJe/mJArE/72s5jEict+O5L2lPWm3Hk3OUn7GGdF6dvaZhjEdknJsWhHPxmpqAX12L+GvxYnTI9/svrXyrtec7jUseeJoBjIgsJYtbS4jQME7tyPxvLft9GBwp8LhlA20e4NEbOmDrSynKObMUhJObw6GOJX8UoHrIMA+UPv9zdIdWvAGixGV/E1lY1Z8WixKVXpJdfdeERetLYD3bFXJUBa1nrpeeh1FB+sivpAG7OTGf+1FEtHVpx1KhDxnKn+QB2+GjTjYhGjOg1hcRs2s4SzcqtbGRcalFupA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STTlgm1YZ1O9G8j3yPM8uxED+OWEdoeaqnWuhmEau98=;
 b=EXU9ADyD5VGSZpl2Ow5yopY3/LhfozVER+WdFm4gZavI+yPtE/gwtQ5Z+Jb1eQc0O2VHkWqRUGZjUpOoV5q3xxfNd5Cjih4fT49N37xd5tmQbd69H3Uz6c3lVd3rRGG7DfwsycLtWFmXe8gT83gzNN/zxqjf86JjMfKLSUIrIbIEsjXLteTC6+jo4D5ZmkKYYQJwp4oh2WQusEB0O9opZVOh8t7/al6bWYylWndIg7sH4sh2Su+DoxZNsX8du68W8F9m9obKcbm9wYgKDgpm5YWeezykajVZlfQhR0KblRGc7YKS/4Qsnci8bfO9COPA9UEHu13fOp7F5CRSNefq5A==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 16:55:42 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 16:55:42 +0000
Date: Fri, 12 Jun 2026 11:55:29 -0500
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
Subject: Re: [PATCH v3 3/8] media: Add meta formats supported by NXP neoisp
 driver
Message-ID: <aiw6AexhNWigL-ob@SMW015318>
References: <20260612132039.2089051-1-antoine.bouyer@nxp.com>
 <20260612132039.2089051-4-antoine.bouyer@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612132039.2089051-4-antoine.bouyer@nxp.com>
X-ClientProxiedBy: PH0PR07CA0079.namprd07.prod.outlook.com
 (2603:10b6:510:f::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8604:EE_
X-MS-Office365-Filtering-Correlation-Id: ba9e141e-71e2-4f92-6012-08dec8a37010
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|19092799006|3023799007|56012099006|6133799003|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 UnHHRbuqTEi8QjsdMWfx/APBMUtK2pIQpVtXFzf/KmXsCZ370XtX1nNHE1hkPFFe+stltnLSkezhc+dUpiy7jsBnQhXuUXLPclNc8BGcSVM4ChTZQ2KY8Sd90NVlAaxCPir14LIessWQ0TOTMMBmelbNMULzQfetmdtEBC6wLdGSsEvS8QSMVcevS1MSYlnwgeZz2Dl6OK6ZGHNrylkP39k9Q3PPeHyGaPFOpeoBNy7GyLKcHBbqUNt8515d91EZTdG6njjkdA59vajjgi2A/2A3/9lVaMOdKp0m5z/O3mZVBqtadnk/pgbcR4tlSlXShnfhkKVPzSN2NR340JprEbkQxmKgNvBzMNhQCfjkFdbC064kzGB9qpOjB6fNgoOs5z+rq0qg1zu2E3A9U0XpK5Y66UUrXbfxIzY70zTE9+zKi6tD2lBH2ilFq6AvvEo34cJO9Z1JQIyA07DD5Vo1y4iXCU30Iqvqw7KInMlGbBzAVM8Mjddh49Ew0XAoFLm6kcFPKYrvPKePCVd0UFaS6uTxmPebKJxbjnfDHaKIlu4lkSljXAqVoyb3kCpQAN8Gc3HjOEvjwI5dGYWOQE5W4iqXIxBoa8/g8Kj/hvGeCNG05c60uTUEorFMpYTZxEg8AknEkXBm0s4XFCndqYhHxOhdYaTriR5G1H04yYZiY5W8/tcspJWXDFRWjHh2MybA
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(19092799006)(3023799007)(56012099006)(6133799003)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Rwdan8FkdlMD33SEQbyTCxOSQGZbFCHiC5fzzrGdMwc2LHN0QqUBNJ2TP+oV?=
 =?us-ascii?Q?F8MlRY8em3VhIFqphn+2gCEaIe4RjY2QJIi1lb+oKdJkiTeQvFKseIHOLTwd?=
 =?us-ascii?Q?bg4H5zmbJyqWFNJ2y2K4HXTsvJpiAVHDn7W7nsO4Gtq1z1koyR6OQ99CBbKn?=
 =?us-ascii?Q?FDaHQUPeMQskh1TyjHKih1sFUqSeEj590xwiF79BmBUbICvfSnN/mI9Y52oy?=
 =?us-ascii?Q?RhLQDpKsfBzupejifAq7Lgfc0B8E1iTmtmFLCknQouFQw9Xp8Sg8HsXqd+7U?=
 =?us-ascii?Q?CyZaKL2qyfJXTbFtk5CQAEABZON3EoN4gKaClRP2OFxxY/4VvGJVUfmKtLRq?=
 =?us-ascii?Q?jvlGfJyPxsU3YyPpinSTKgb523oqFr1QPaQHeDgazEbn03G4EXuD5K8rBbNr?=
 =?us-ascii?Q?gVJmzaYj5lS4kxzu2tfpOhrTbOYfzY+PWN+3ri5Pb95A1yjsA+nQTmjm9QCq?=
 =?us-ascii?Q?KcO1CRcHeocr2GhpF4X44Yg9ga6wafLH2hOO26tjhmLttLQRmtQTL+GEcerM?=
 =?us-ascii?Q?XSfnpW1v3dszA6sWSvxx+0uzkfNiLAQDe+JkURIX2XIb+mteMd7VnfCUPHoI?=
 =?us-ascii?Q?xECxtR4/t0Kve+DxiSc6ACCx2GAPL1I4drX8p4El2qqsm4ckp9wgMcf3RI3j?=
 =?us-ascii?Q?RxlLHjlMPLSpGOF+rGW3dgh27bhGJMa7NTrCkygPv317wpMtOaQo5+tsvF69?=
 =?us-ascii?Q?CPjmLbHFQ7VPxoEYKXCvLi+ZfqOLOMc+pbFMzfEPd0UtLYx3V7aEnIzvhcTI?=
 =?us-ascii?Q?xCai3J8yKnPbcbfsk33eS830yqod9KJXcbNvuLUcn/tFimX/88SDH5FRFrxo?=
 =?us-ascii?Q?1ZjDlXoereE/WwFpiXQe6a+xwAotxHnag4S3fhKE6j8j0//mOd6XhETPKRmQ?=
 =?us-ascii?Q?mrL6UrW2xURIwT3NIMPdz/Iu0K3VsmkpklegG509azYRYYwAesMjnfQdlM7o?=
 =?us-ascii?Q?K3c995orVHyOBEZwCvdOyq/jZYWvyNkUf1X5tbrYs3g1QaCiZxW2x6dQWM9V?=
 =?us-ascii?Q?IPSh7oldxprs5WVVCn8S9hD0cuNY290YqVoABVAZJ34ZmxdxDavo9IYHzeMd?=
 =?us-ascii?Q?oj0bVgg9uJI3kpdSk9uEvVslVTAtyXCnjjqh5DU2yb2diBTX13WQOhAs7OCO?=
 =?us-ascii?Q?0IrrQx7rFSqcgUT9CSoGP3/JLHs0jTSW47VsCoQRG+FNdaeAYYZtRd2Ks/P2?=
 =?us-ascii?Q?KbobearnlTQ0mBjlexeIVF7kGo4Nh1tuhgpFV5JNE63EiE7jzTcVLhnx05R6?=
 =?us-ascii?Q?1XCVQNq9xuTgmEWYHUl+01S/6HFAHiKTSLtzabIHCXjqEkiEnRVMafDp9MPm?=
 =?us-ascii?Q?m3e2zptUTiN4pQKvi1qvCOXMUNCo44aDFO7OachmPdGvGbBdShhI/YEU/h/9?=
 =?us-ascii?Q?YX396QGR0/RuRNVmoTfyQAlypF2kzTrURAG+najklJFUgYfGp/FNDMZgreGA?=
 =?us-ascii?Q?bDXyA3HDmXk+ImESgzpW85qkMzFJxVCoxTBnVA19/cKPllqQNqoW4PdJd3p2?=
 =?us-ascii?Q?wdRpOKK7Fb7MT+f10sZ7yKaA3ZsIuL/eaE6PF0ABSNwRlZd+V4wDJQwsytfl?=
 =?us-ascii?Q?JkBSPk9pGi4MbH6EZRr5t4OND1Mgd8adGhF1KtuKsVo3Agzz7l5VzX6Cimwl?=
 =?us-ascii?Q?zBox5vD6jEYrRGFO5hPaLsuc5jNHxP+BIpDatPV/3tI2zU9tTOu8xXrDHs6/?=
 =?us-ascii?Q?2/XqizWPBxxI4fNCn+1VHvhno14pcjLuht1hYW+KZpacH+UQS/b9BpyDlweZ?=
 =?us-ascii?Q?JKXi88xXDIUl0jMm/MvHLNiLa8fGzIPz/ZchMakD/jF3zrVucwtp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba9e141e-71e2-4f92-6012-08dec8a37010
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 16:55:42.2250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mkWCrH33RrSTXz0l5wu3acRSK8mncUBjtFJHEB6BUUwrVVxZYNXiBRIlGZ7JRtFSUWnqbX73kaYQUTWUz+TZLEqgH5H/gjQAo/dndss62Xgn+JbmqorTIhdTt2JsNbDX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8604
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64718-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[SMW015318:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.nxp.com:from_mime,NXP1.onmicrosoft.com:dkim,nxp.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B1C9E67B20E

On Fri, Jun 12, 2026 at 03:20:34PM +0200, Antoine Bouyer wrote:
> This patch adds new v4l2 meta formats definitions and descriptions used by

Avoid use words "This patch"\ "This commit") in commit message.

Add new v4l2 ....

> neoisp driver for the parameters and statistics buffers:
>  - `V4L2_META_FMT_NEO_ISP_EXT_PARAMS` used for the generic v4l2-isp
> extensible parameters structure, supporting a non-fixed-size buffer and
> changeable ISP configuration blocks.
>  - `V4L2_META_FMT_NEO_ISP_EXT_STATS` used for the generic v4l2-isp
> extensible statistics structure, supporting a non-fixed-size buffer
> and changeable ISP statistics blocks.
>
> Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
>  include/uapi/linux/videodev2.h       | 4 ++++
>  2 files changed, 6 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index a2b650f4ec3c..acc60dc69d31 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1471,6 +1471,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
>  	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
>  	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
> +	case V4L2_META_FMT_NEO_ISP_EXT_PARAMS:	descr = "NXP Neo ISP ext 3A Parameters"; break;
> +	case V4L2_META_FMT_NEO_ISP_EXT_STATS:	descr = "NXP Neo ISP ext 3A Statistics"; break;
>  	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
>  	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
>  	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index eda4492e40dc..e1656520b312 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -889,6 +889,10 @@ struct v4l2_pix_format {
>  #define V4L2_META_FMT_MALI_C55_PARAMS	v4l2_fourcc('C', '5', '5', 'P') /* ARM Mali-C55 Parameters */
>  #define V4L2_META_FMT_MALI_C55_STATS	v4l2_fourcc('C', '5', '5', 'S') /* ARM Mali-C55 3A Statistics */
>
> +/* Vendor specific - used for NXP NEOISP sub-system */
> +#define V4L2_META_FMT_NEO_ISP_EXT_PARAMS	v4l2_fourcc('N', 'N', 'E', 'P') /* NXP NEOISP Extensible Parameters */
> +#define V4L2_META_FMT_NEO_ISP_EXT_STATS		v4l2_fourcc('N', 'N', 'E', 'S') /* NXP NEOISP Extensible Statistics */

Does checkpatch report extend 100 chas warning?

Frank
> +
>  #ifdef __KERNEL__
>  /*
>   * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when
> --
> 2.53.0
>
>

