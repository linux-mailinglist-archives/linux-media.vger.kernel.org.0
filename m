Return-Path: <linux-media+bounces-64235-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MszxNcgHJ2ruqQIAu9opvQ
	(envelope-from <linux-media+bounces-64235-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 20:19:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A93D6659A4A
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 20:19:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=VX9PFIsR;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64235-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-64235-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1B44A3012E5D
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 18:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4787F3D9DAC;
	Mon,  8 Jun 2026 18:18:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012044.outbound.protection.outlook.com [52.101.66.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0C6307AC7;
	Mon,  8 Jun 2026 18:18:19 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780942701; cv=fail; b=FxJjUR6OItvKKdhJiaf+oFW2iIXMXBd29KUnPdGwbtUSWvj0P0J8wF3pTMd78eWH4hQpJzDaGyyq/qOzmOIXxw28PYSUTxHBL+1qsso3Z6lUngggJeQgHlYG8QAWVxZSZ+G/mKvJ/GowXfAzDV7iLU75NDoaAJdnMHQAxBotixk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780942701; c=relaxed/simple;
	bh=9TgYqH4zEmGEaVpSXuemQWi9ntQn5rWlCKaHcUtsyAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gxrL9dnakzV8BtU1d0Y9OVoA0z62ttaMWvu2Qz6rBxyelOUc4AkoeiG4b8/BoM6sslg2LR3QmSD5w7J8JTC7P1a0+PjWvBruvGYivylHGz/jtJ08O5vXLXAHGprY317GSMSAd66GziRq6n33r98DXT+E3y1Jp8L8yeGEVnO+uEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VX9PFIsR; arc=fail smtp.client-ip=52.101.66.44
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=efwadxVEhzG1LhjjldyqLIfTOKC3jF4MOLPft73ZcisG32dW5lYwQ8u5emQBoPdkganm4/Zi0PlEHxGeWXK+bezuItG7EpxDPzFAyrOp424KHAOOFtz3gw67LnG8EbaauXTLxl941XW8htud7yM4KegqDVPRpW+TdjqnhKNu6BmaaJIGlNJcA68J7HWIt6f21NEHiEuaeCB/OoAb8HGMHPYbrghTgPhnQ/DxU6OuMM0XbJeiiar5CmSqOBn1CAdKgYPB184hFXWxcXzhGcfvDxYU7FiIBAiRo9Qzt7O3taD0CETqPMr8mouqo92/p6eAsNPJSBnbGPp2m2kzSeBRVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+rP6vcHgk9V+zxpf/gfcerGGcXyPB/VNSS0kCaZaLs0=;
 b=VlHD7zG8gDQBcRTJQj7606ND2L3faof7ihaZbwzHasb1k+NaanXc4TRiIRUuk6mrGO5mB3D6FpNLxJ06sXp1bZeZNfoapVyixi2KPm/Okr43r0VPkyOMVhR1+i3WY6aYzU0sVfAR1yUIGuY903+OVx1E4Eb0BCPttiRjEypb6fKyA2HPsdXdXAg3YkJjlOzERGvhrt6dLxXVdKIqgqvx4vqbivGucXDI6T9yKso7XkpQVELVCP35nXzxrDgKEeePIN2aDf0PdKAAZmN+1xRRCO0kPXuVMuEW8cvLKTqgamxwBgUZTcBOQWyzLcH30R5Mam9XXEAnmlaorORZg9D+3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+rP6vcHgk9V+zxpf/gfcerGGcXyPB/VNSS0kCaZaLs0=;
 b=VX9PFIsR0b9lq4lW8tUkeC8X/8iJN9muJfX+QW07I4AVzAxGXFXIkqfBieY8cL4t4tnozVIn1wWuVsViZqco5pQd1WgW8lcil1fublOgw3jc6Dj7Vhr/Ljqedaz/f4VPS52CbrhQhxKB6DrYOv0JUL1m+/6JuigfaZqTd8XZ6cHxcxnV4oJNtCdBEo4JKWlkyaTvhoka9DSHRosDgzD7Olb2LFaaM3MaMefAYvFGoWJrVhmEZrEVDNgLQltDM/ovgq+DVbRFBDNw5lN2lsxhJQjpktHA9xKEaI6UGWqlPn2hyZ8vDz3GHdgqTj0kPCU0dwh8PetHAuHBA3J1W4tuYg==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8671.eurprd04.prod.outlook.com (2603:10a6:102:21e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 18:18:16 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 18:18:16 +0000
Date: Mon, 8 Jun 2026 14:18:11 -0400
From: Frank Li <Frank.Li@oss.nxp.com>
To: David Heidelberg <david@ixit.cz>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Petr Hodina <phodina@protonmail.com>, "Dr. Git" <drgitx@gmail.com>,
	Cory Keitz <ckeitz@amazon.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Frank Li <Frank.Li@nxp.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v7 3/8] media: qcom: camss: Prepare CSID for C-PHY support
Message-ID: <aicHY0RRxsvsIRzQ@lizhi-Precision-Tower-5810>
References: <20260605-qcom-cphy-v7-0-426c37e9008f@ixit.cz>
 <20260605-qcom-cphy-v7-3-426c37e9008f@ixit.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605-qcom-cphy-v7-3-426c37e9008f@ixit.cz>
X-ClientProxiedBy: PH8PR02CA0010.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8671:EE_
X-MS-Office365-Filtering-Correlation-Id: 4deda186-b1d4-4af4-ccb8-08dec58a4f54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|376014|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	E5OOYt7JjYcT7kWFpJdwerQYFyGKuT1gTMrHW9QEnU8zfkAqnH2AMPdoxVyoi19OTcwbv+7aPSX9u0Z4r09Zr96LLjyiFQX3wemY9i5HYCpNjfGhQhPKg3lxSguoYpmsV+WCxRLlcvAgANvvfw/KNoMOU3H9yj8IuYFUxXSppl4hKW7BIur/hKEjZkSIwibXAEYnTikikLas/4KCqcBsSb2J2y4fMpQtx5m0bAjMDbDqxKSsRDKsN439z4YQQJOveERat5nYrt8PP4+WBEz/VeyBJ4J0M8r5vLXiBgwYh86/Q5BKH5Ng3GsBKpPvWZlNGFoQ8IZtq3P/PKoCLsk/lZ8EzxBHoI5+31A5Re6utFc9niwxMpB284ffrS1bxw3UMznYfn2Q//wo9IBm4UKxZs0GCFnlirFm2fBHDVx9m4tovhr9aqniaWXWuwZSofFrCQXvadLJrfmq4t8gkHp/ZXzT1nONUii6vj846g8sFvoUfD94vrWTkciHsMIFz2Lr66eIb8jQc5C4qkxYg5IrLVe30F4C/iWIqeCEQRt8ezlA0935CcIbx8nkjaJLPIgAQGHBBR7yD2/8EXM66i0Ry3TpVrHvp78snbyFtne8eoXgwGL3LN/6/Of2OODUG0pBFE3iqR386kFoIPnkODPwLLbNY5BDOALeWYUkOBe56SgwNQ6jLWJ0mXZKQi9aO/wx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(376014)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J35yZeOUtVfwbJ/a1CHx1XI6eRgIQ/+bI8I28jkTPoiR+NPWsS9f/NjZjeVn?=
 =?us-ascii?Q?uJbf2RJs5G7uk3gJKYrbPCkBMzdnu4AuBXCjewUJ+j6fNaOiVud1l4kcV/IW?=
 =?us-ascii?Q?6c/NEFRwwL0tb2HIHn0qUg9Am2NFkfij4do3mqTZwRVOhd0GucdMz3eNsAW5?=
 =?us-ascii?Q?JmH/dR1tox4hN4wiClYlArHyF7QczrAedu6OXoXjvykMrxEvqX4YXrPJrvmh?=
 =?us-ascii?Q?xqhTjNP2yPpKXLeL4gJvfH4T4Jx2mh7GbDWAG3iIsjaOm4CRcZ+r9yiMFncx?=
 =?us-ascii?Q?BfhzaPSplbB9QLJFXLhON01i9xX4SU823H+nPHi26sB+Bsyieomee4NV2hjg?=
 =?us-ascii?Q?LTTrQwVoJqjGSt/BzbryZ3DvbnMPqf279o7MmHvw0yxZd25kjNZSfvjE9uyS?=
 =?us-ascii?Q?FI+qwdcQ1p1Tmrjek6yXxza9Ojv83pEMLNeJAHCKqu09jQ7Cfjfj42ANAFM7?=
 =?us-ascii?Q?psOYxfPCUGb4ODVaGVMvtfN3vhYiWW0JQ170u2BcEdmyH5zyG9oFWacrz37V?=
 =?us-ascii?Q?qGhwEt9L367JGsiMEeZLMgnaqZQuZEkW+QLX2XiawCzu1Bic6KZLjhksBDTo?=
 =?us-ascii?Q?bBmv3z5rhAyPe5yJ5CHn8xIxDB51EkJY3lfdjsX1NrJ3WjwzNHZAmLSegCgO?=
 =?us-ascii?Q?QYxdnh671Y60q4iIgDp2DDLhk24KtrK+85U6eobbyQ+61rLmdAolJ4p3uj0m?=
 =?us-ascii?Q?4q2d8oDuPF7TAVzT+mpEW2YON7DHV+X10Yk7NvIPOJr/ltlnJWYwZ/+f9yt7?=
 =?us-ascii?Q?a7rTu3adQYO6iZMV9YhnFoamTKdKk1bqHReZ5TSAE3dgFuHvvjkNIe2h/+bt?=
 =?us-ascii?Q?TXN2eFZiFk0uuQ3nv4CmyhaI00l3s6WIy8dVYIRVCPdf1xDh5kZLEvx67JAn?=
 =?us-ascii?Q?DquqH1adA4UBVrMf+cSRhIzyCpm3783QWiGDonG0m64XMGgKwuSuLGlMNI0D?=
 =?us-ascii?Q?3ROTSkgDrww7x6OSgTgPxtywNuR0ZKTGf94/+ElpcV/KnxpM6fWkZPIn58cO?=
 =?us-ascii?Q?7fmTNSS71cUPP0pxs7ozoiDyCRt/XS2S9KZLhac5czOTpLKphWzZ+TSLCEYG?=
 =?us-ascii?Q?TV3beIVqGTdZST55UloBWC+sw1aLIL+GVR8oA90SY82smFgG6+xW8RGs4FxZ?=
 =?us-ascii?Q?mnD9udJTiQcOC4+LOcq0/BlGaGZRYdzNmspBAgEhVp7z9aKfSj3950f8hU40?=
 =?us-ascii?Q?l/uA3ebhVi9wTye9+XQ+R3ZGPpwYolNl3MWT7pwOqXqF3QqrHBbfGQP9aE18?=
 =?us-ascii?Q?smJXo4ptN+3bTEcI09nhJl0QX7nuQTPYMnAvORPKKgxcmckXFrPKoBqlaL/+?=
 =?us-ascii?Q?ay04Hg680dW+GfNggIBYS0S55XQD+Ua9jqXiTyRFcdKkD8Rd3n4hx50+EC+x?=
 =?us-ascii?Q?Vli0Z4J/oXAVdHnqOvWXbRUDFKwXVFCJwbL9WnxP6x2ijyC21lcnv1bTgGno?=
 =?us-ascii?Q?Ua52nSaT4+HQNP4LxBF4qWL0BMabCgD2gQQbakDvoc5QsoXlyQJ5VoblIqpt?=
 =?us-ascii?Q?NMfw4hjfipExFxscaAk35cvijrHln3kTDA1GBWx9lbJ/E4FG7TJ27vz5Ra43?=
 =?us-ascii?Q?tVTHXf5MICggRPlknuDSrpYSZkLWURTWGBNTv2dSNW9fHhDUhYv8kCXZJPpq?=
 =?us-ascii?Q?9mxI3zWLvq4Wokklh8mabquFfNIWs3swCFfi7jVmlTM37Ma8OgfGlTLthVSd?=
 =?us-ascii?Q?BMLVt65dthQDa/iptQOqi6j87OZ/5tttSN1N4mmIL/y0wO+SG/oWYu9qVfFW?=
 =?us-ascii?Q?KdowT1FIjiE/3kjEnXlgMYneUnzZv9/TzimAladuVkDBjC4ncgUo?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4deda186-b1d4-4af4-ccb8-08dec58a4f54
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 18:18:16.2051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VjN04E31hxeZeftNPejTFeoDmdSX6FsHunsZvm60hK3AO2wVCHIu8mnURMdn71yVPVejGaw6w6OLj+X662XWW5BuaMe72ZL/0th2nu+Mr5kEJHxNuYGy1D7TQGdwLV9R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8671
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64235-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:rfoss@kernel.org,m:todor.too@gmail.com,m:bryan.odonoghue@linaro.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:luca.weiss@fairphone.com,m:phodina@protonmail.com,m:drgitx@gmail.com,m:ckeitz@amazon.com,m:loic.poulain@oss.qualcomm.com,m:Frank.Li@nxp.com,m:konrad.dybcio@oss.qualcomm.com,m:kbingham@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,amazon.com,oss.qualcomm.com,nxp.com,linux.intel.com,vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lizhi-Precision-Tower-5810:mid,ixit.cz:email,oss.nxp.com:from_mime,vger.kernel.org:from_smtp,linaro.org:email,nxp.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A93D6659A4A

On Fri, Jun 05, 2026 at 03:14:41PM +0200, David Heidelberg wrote:
> Inherit C-PHY information from CSIPHY, so we can configure CSID
> properly.
>
> CSI2_RX_CFG0_PHY_TYPE_SEL must be set to 1, when C-PHY mode is used.
>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Acked-by: Cory Keitz <ckeitz@amazon.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/media/platform/qcom/camss/camss-csid-gen2.c | 1 +
>  drivers/media/platform/qcom/camss/camss-csid.c      | 5 +++++
>  drivers/media/platform/qcom/camss/camss-csid.h      | 6 ++++++
>  3 files changed, 12 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> index eadcb2f7e3aaa..a5b406cc8ead3 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> @@ -178,16 +178,17 @@ static void __csid_configure_rx(struct csid_device *csid,
>  	int val;
>
>  	if (!lane_cnt)
>  		lane_cnt = 4;
>
>  	val = (lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
>  	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
>  	val |= phy->csiphy_id << CSI2_RX_CFG0_PHY_NUM_SEL;
> +	val |= csid->phy.phy_sel << CSI2_RX_CFG0_PHY_TYPE_SEL;


It is fine for now. Suggest change to FIELD_PREP() in future.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG0);
>
>  	val = 1 << CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
>  	if (vc > 3)
>  		val |= 1 << CSI2_RX_CFG1_VC_MODE;
>  	val |= 1 << CSI2_RX_CFG1_MISR_EN;
>  	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1);
>  }
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index 48459b46a981b..bcc34ac9dd212 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -1286,16 +1286,21 @@ static int csid_link_setup(struct media_entity *entity,
>  			/* do no allow a link from CSIPHY to CSID */
>  			if (!csiphy->cfg.csi2)
>  				return -EPERM;
>
>  			csid->phy.csiphy_id = csiphy->id;
>
>  			lane_cfg = &csiphy->cfg.csi2->lane_cfg;
>  			csid->phy.lane_cnt = lane_cfg->num_data;
> +			if (lane_cfg->phy_cfg == V4L2_MBUS_CSI2_CPHY)
> +				csid->phy.phy_sel = CSID_PHY_SEL_CPHY;
> +			else
> +				csid->phy.phy_sel = CSID_PHY_SEL_DPHY;
> +
>  			csid->phy.lane_assign = csid_get_lane_assign(lane_cfg, lane_cfg->num_data);
>  			csid->tpg_linked = false;
>  		}
>  	}
>  	/* Decide which virtual channels to enable based on which source pads are enabled */
>  	if (local->flags & MEDIA_PAD_FL_SOURCE) {
>  		struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
>  		struct csid_device *csid = v4l2_get_subdevdata(sd);
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
> index 5296b10f6bac8..e65590b0df69f 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -39,16 +39,21 @@ enum csid_testgen_mode {
>  	CSID_PAYLOAD_MODE_USER_SPECIFIED = 6,
>  	CSID_PAYLOAD_MODE_NUM_SUPPORTED_GEN1 = 6, /* excluding disabled */
>  	CSID_PAYLOAD_MODE_COMPLEX_PATTERN = 7,
>  	CSID_PAYLOAD_MODE_COLOR_BOX = 8,
>  	CSID_PAYLOAD_MODE_COLOR_BARS = 9,
>  	CSID_PAYLOAD_MODE_NUM_SUPPORTED_GEN2 = 9, /* excluding disabled */
>  };
>
> +enum csid_phy_sel {
> +	CSID_PHY_SEL_DPHY = 0,
> +	CSID_PHY_SEL_CPHY = 1
> +};
> +
>  struct csid_format_info {
>  	u32 code;
>  	u8 data_type;
>  	u8 decode_format;
>  	u8 bpp;
>  	u8 spp; /* bus samples per pixel */
>  };
>
> @@ -65,16 +70,17 @@ struct csid_testgen_config {
>  };
>
>  struct csid_phy_config {
>  	u8 csiphy_id;
>  	u8 lane_cnt;
>  	u32 lane_assign;
>  	u32 en_vc;
>  	u8 need_vc_update;
> +	enum csid_phy_sel phy_sel;
>  };
>
>  struct csid_device;
>
>  struct csid_hw_ops {
>  	/*
>  	 * configure_stream - Configures and starts CSID input stream
>  	 * @csid: CSID device
>
> --
> 2.53.0
>

