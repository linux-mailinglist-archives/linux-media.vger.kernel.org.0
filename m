Return-Path: <linux-media+bounces-66253-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Pw57BY1ERWrQ9goAu9opvQ
	(envelope-from <linux-media+bounces-66253-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 18:47:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 603746EFED0
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 18:47:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=X5ecJppn;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66253-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66253-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2AFE30E652D
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 16:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6254E36CE1E;
	Wed,  1 Jul 2026 16:42:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013043.outbound.protection.outlook.com [52.101.83.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F687E56A
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 16:42:36 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924157; cv=fail; b=B2Le1Sndx4v7VMXjV0YQEkenHm2tBvrcGWVUc9FzFKL/ZpF0ywMaCbf2gbknSWepXFIngiOkvTRUoAXATPtetRm+Tnnhk/8O43LFqg+lnkIkH5W5mzjc3oLIsTzr5Pvu5QEbXlhIPlncOqmlSwdUlqMHTsKGG1+Yqy81sB0t43Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924157; c=relaxed/simple;
	bh=Hx0GTJu1LCyY4hgieIZrl/TsCIK+a7YRoxayKjiqvao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=A1uyD6sriR9j7c771o3J7vqwBV1K5HQm3Ijoqsw3uhhsKlXTj3Uv+p0wOB9nL0UXWdhbt7PjUd+3Dur9FEshLFUdoZTnP6b7kU9bI2D+MclysWp7+oHrxDI0LnDnYwbwXY3bYl/+07+uUEMMXmHOWi4ktG49DP008B1ZJwzB1lk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=X5ecJppn; arc=fail smtp.client-ip=52.101.83.43
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oSMaRYMRICZHD6QgKWf3GEyTYga/bPJnN/EM8etx91bgMSdlLZwNvczeRPMFRh5xzdWgYMESs+j0BMww/IqHm92+oCUlXFPX9gyRHiTkLOiRrEYthgJpWKUEx/SXiPCZ5adtx33DXdG+/RBcXmVnudx0InxFVuLJIoSLCR5OgD+WduqONC8ErCT5K2lcDdcuzBSOJ8RRVrFM8ya6P3JqRiWjlmQq+R5ajxng/Tv2MFBhw9Tj6FNlSDP6uy6BUY3kL0u/cBP10XEaB0LUj8pYB6B5dkfA4bPlS7HP5i1rhyPf5L1cLljRU3WfpMJ+q8k+pNWsGIohZNSLkmPwrcsStg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5x09/5+iacBfotI7MagBQOnwGcJN5FqPfJrqEu0a/BM=;
 b=wzMprSyGAMQ+lgSImUkB+jPrDf9k62aj1ExaN7vjqnT5pcUzEvVD5DazZwZb+qtSSa+Ghh+sdA20vDvlD2WvSJw4HGhCbMYMTo0f5+l/zrAu1J9t9fPvUqW4XHfJdivtxFi5T2YDMIehNdMLGk7D2EbAMzDPaAtmRy8bT6rTqWLiZVRqDJ/qI4ONvjQpVM3GVmsSEgL9v/LNVO/B9r0pa1xf7zo2rbvcw3QlWmmmIeqdrua3j/EvBeL3VU9QOpynDlQvCCmfjGoX3b6/cc8ykFSbN/kKDI/V5YkkfP8GDyOxmh69hOAKudzFYk7PxjRhhiQ20sCBL0K+42HJi0ZMLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5x09/5+iacBfotI7MagBQOnwGcJN5FqPfJrqEu0a/BM=;
 b=X5ecJppn/5WBpqT4TeDzHEtbyaT1orSVvrqHFCOE2euCzNogkrqvXNaa3YpUVVlyQwGFrWa+sJoTXRM4FL7TaIfYRBaRUu9X0e++hI21SIdiwSApNclnsqvm/pS5p3X82ALojqoBesvIS30RlKLFGkzfvzP+tHR7F8MdMjnx7lKnRI/XYNeUGdWNm4CoCcPJroAJRLumDhzWpy0jORp0Ih87N4baP3mnrbz8LgQ8djkcLSx2ZHyiqIdqIfkoT5TJ9mYRO51UOikmz2TB413zloq6vC8Tb8Vw/Xk5pdLAWS+IZ0wHNweAsBaqAp8n7YpUeVO3ClJXL/K9v9rYXKaITg==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB9819.eurprd04.prod.outlook.com (2603:10a6:10:4c0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 16:42:23 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 1 Jul 2026
 16:42:23 +0000
Date: Wed, 1 Jul 2026 12:42:10 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v6 09/16] media: v4l2-subdev: Always call get_fmt() if
 set_fmt() is unavailable
Message-ID: <akVDYmAnEckbecpA@lizhi-Precision-Tower-5810>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260701122634.1728782-9-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701122634.1728782-9-sakari.ailus@linux.intel.com>
X-ClientProxiedBy: PH8PR07CA0002.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB9819:EE_
X-MS-Office365-Filtering-Correlation-Id: 553b44eb-ebac-4981-9e9e-08ded78fb997
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|376014|7416014|22082099003|18002099003|4143699003|56012099006|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
 Qt/m9elG5/oraWABao1avvgi4h08zLbd7NwPgpvZ6CMSdm3q4khm8TC0cTb1LsZxwQtkUFAwnW4GCfBt+p64RAHXJHY3hspsLdtc5lLDfyB9TF+s6eUbVpZ9lSdNNqBgrAOntpqwPMIDgVU30AhhEU0b/6zojHcVNU+//62V1eJ0YCUcshLZ68nWULfAVKFESotyJ33cf8Pzxr37G98yBQODYsqVXozZiZDXy3aodNPpSG9ypcZ87jN4it0hcndVctrVQSdcW4tkRHIfSj81OI4qecAwhdVakfq+guzCgnuTF8/yUUo2gZaAV3/N0n2ArOFGt2BE7/OHwcd8r0c0rkJ+H5Xd0/khjBfHDPCWPcG7mlXnAamzLqY6wdUifnXQj7uib0iG87treBqlG84k1o9hR2zK9PaW2iCTbqZOsF2zZ8bMYCa3o7bkwuGF457NxN13nZ9cDiOotZU9nKrnzJPOwIvWSvVPL2oJf/im6NWEFWhpS+3nsL2oRRJasYVDkAh6yXpcMi426nxBG1RqhhiX1jWDkZH4RuADHMhLPLvGun5tSDSA4DGtW/akIslRHfx5QRxWMEga+J4UBiYbB+syP8EQU/ML5USa2l83ipmC5sh3pnz5o8lr0Ep4B0+sHtciv12Vlt4gPHQhT/drXWB9f/YPUgLL1On9RRotDAY=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(376014)(7416014)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?cOZJJtMC1hopUGWEtz3hR4Ztf37HHCKqe6fL/1J16bsZZcKvReu17PBqjRPX?=
 =?us-ascii?Q?WBpmaPxtzbnTVvilhODOg2jmsWjVy1OWMe3GueqPSmEn1e+YsLv57fZDHgku?=
 =?us-ascii?Q?CDhcn7uVuBYvft+fr3F6woFdF2Y55QogZH+rB3UU4GxjnNH6sjnPT/Tpqxb+?=
 =?us-ascii?Q?nL41+ofRrZF0L/gxumPxzFqq6cQrzO230VtzqEL0kHmmXk8wwwG+CjGPGyuv?=
 =?us-ascii?Q?YFckVHffPXs+D2ZNHgTcbxvVbdJWlk2duyEymoJ0zGB1L7M9RF41u6/XlLlJ?=
 =?us-ascii?Q?D8A5jTvjDkvA1qw2ZnbfUYQGzYH3M2Ss/dfOEl2UUsTXmiMOkLCobXCotmSq?=
 =?us-ascii?Q?lqR0aS2iW8Y6CyX8ckoFXk5OIEGT6Amu4gWm3U/Xcoow1CEq3i1COYqT5LFe?=
 =?us-ascii?Q?YdqUuspIjmIq/HYuLyLyUucd5Jf+eC5cVgDZ6+6z0B3pijYVgMyFN2MuyVGo?=
 =?us-ascii?Q?EwnkKqavUWzwFId3Xs/Sk1+wEgm8p+/s6JQFcahY0OaO+zEUZZsJqkAZea+O?=
 =?us-ascii?Q?Ug6Iy91aOhAFb7oiAoG0Qk/r2LwIFaSQ/na1Y4ltJgQk1f7R7ABUG/vt93yj?=
 =?us-ascii?Q?2urbOfgvt4fsEvtLDZkqa9aeDRXsOzXP3ws5IYHZpAJ3yt5mPVqT5Al+zSjf?=
 =?us-ascii?Q?jDvogqhGo6KjhDB44+akFIU5UQCGdVyrW89RbCzH+HQTrb7HIF5XOycpoobC?=
 =?us-ascii?Q?1HN2eCrZIniaz15JJZeZ6+nnztyA9pq8tGWi1Ii1jSyNIjqr13LzfrO1aml1?=
 =?us-ascii?Q?2skE+MlaiZpqwkAtaocOoM4BNw8vKd/BGEoVTQRK3qf/2xN/L5behrZM6CeY?=
 =?us-ascii?Q?tyMwgs9gLwtkeN52TDWXUkq5YzdLR/O5Ia4XWP9hk+J3MlZLKHlO4+fUuUNI?=
 =?us-ascii?Q?p4JsoScL8JPo16reyhAM5CnBh+GEHXEtZXC3XVypiwUHTJbWYvU3Ex5b4Mnw?=
 =?us-ascii?Q?Cy713bqJucMMLTtRyZpwEN/J2YVojphWCAodH0efCmMucA/2VlyKeJOrdELT?=
 =?us-ascii?Q?D8fljtsuX4Voli68BZIZxn4ynWUe0J7zQUMIbMCCA4HqL9BslXPJ5272/iqM?=
 =?us-ascii?Q?u8c9hrYUfMJeqo6BOlZkdc2JYowouJNC1dE2wEd/dQqce3xRPIg0iDveaokX?=
 =?us-ascii?Q?7HTW6f7PEKAAIrTXnGP2XWcpImss7Dho83+Xhcw+Uhjb763ddsO5itq5jeqa?=
 =?us-ascii?Q?k4pCUD7jgtDRMwrPdtQj+w6X1Jrqo4fJBGw8wtwSM62afh7R/N+DvmstMuBE?=
 =?us-ascii?Q?uIwBElqnmhpDMtIrFnSXpZmrlLxMkLnt48+TcenmmyaoGbLTCfG+ii13TssL?=
 =?us-ascii?Q?u5yoLx/7GStWIvB4dOFWmM4lIv5SDqnplptK2rMG/6og5JtDCknQM+F9cjXl?=
 =?us-ascii?Q?UNqnsFwhe+MiMeuILWzaTlDys5jq4kkeulin1VG2CBaUFGaW665MvORIA8JE?=
 =?us-ascii?Q?GjqG1fYUhcovV+qHz2pFytHruSmmr1xOBhE8ejcMgpWpU6cNLFSNGL1fmkOG?=
 =?us-ascii?Q?S9lB8xg4KwpEyi0JFehi5xy04pdYl+fh9eXOZ7Cvmi8oxTbGUPeEakvppMeR?=
 =?us-ascii?Q?vpCEqX1spPxuN+EDfMs0+9iCVIqZoRNdVMWLIwIqs+PHhOckk752UnypjLvJ?=
 =?us-ascii?Q?Fga2EZiupzFj0J4ZohNwMlFs0RF6tBX8Q46BwrN/V/2iuUO5JkX/Zjx9Mbe4?=
 =?us-ascii?Q?3ETV2ZJ8MdG+iuUfK6i+w+ehE866BlNZpXuZjGvtbYKsZHnlWTwAx/usZC0d?=
 =?us-ascii?Q?3nYVSd8eBxBQowuvY6ZmJfQinLCRpP8Urqdvdm6jcSDaCUFz9npY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 553b44eb-ebac-4981-9e9e-08ded78fb997
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 16:42:23.0266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gx7YAqIHzX3sDojsiv7aEUmSTcfkNC9y/PJMlXIzOz7pFcSZHGD4hGCc9bq9X1/Jiq4T21eBcSqDnY3EYBUmS4wZzr0yZEOr0mcWnsUXEoy34qCqHUNTuRozcZUNjABe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9819
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66253-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:hans@jjverkuil.nl,m:laurent.pinchart@ideasonboard.com,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:dave.stevenson@raspberrypi.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:dongcheng.yan@intel.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:jacopo.mondi@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:jai.luthra@ideasonboard.com,m:r-donadkar@ti.com,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email,NXP1.onmicrosoft.com:dkim,vger.kernel.org:from_smtp,oss.nxp.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 603746EFED0

On Wed, Jul 01, 2026 at 03:26:26PM +0300, Sakari Ailus wrote:
> Many drivers implement set_fmt() pad op that simply returns the format
> just as get_fmt() would do,

Does get_fmt() do actualy thing? according to naming, it should just
fetch some information.

If only fetch information, set_fmt() can do nothing, why need call get_fmt()?

Frank

> usually because the driver only supports a
> single one. As a driver should always implement set_fmt() either on its
> own or via get_fmt(), call get_fmt() in case set_fmt() isn't implemented
> by the driver. This allows removing a fair amount of boilerplate code as
> well as ensures that set_fmt() works whenever get_fmt() does.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 86be4d51c9a5..c2be59e4c4a7 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -260,8 +260,11 @@ static int call_set_fmt(struct v4l2_subdev *sd,
>  			struct v4l2_subdev_state *state,
>  			struct v4l2_subdev_format *format)
>  {
> -	return do_subdev_call(sd, check_format(sd, state, format), pad, set_fmt,
> -			      state, format);
> +	return check_format(sd, state, format) ? :
> +		sd->ops->pad->set_fmt ?
> +		sd->ops->pad->set_fmt(sd, state, format) :
> +		sd->ops->pad->get_fmt ?
> +		sd->ops->pad->get_fmt(sd, state, format) : -ENOIOCTLCMD;
>  }
>
>  static int call_enum_mbus_code(struct v4l2_subdev *sd,
> --
> 2.47.3
>

