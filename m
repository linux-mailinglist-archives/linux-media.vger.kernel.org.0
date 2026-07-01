Return-Path: <linux-media+bounces-66251-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XAV1Now/RWpv9QoAu9opvQ
	(envelope-from <linux-media+bounces-66251-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 18:25:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C12F6EFC3B
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 18:25:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=jKEnOKty;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66251-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66251-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02559317781E
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 16:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4D393563F0;
	Wed,  1 Jul 2026 16:17:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010017.outbound.protection.outlook.com [52.101.84.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A957A2253EC
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 16:17:54 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782922676; cv=fail; b=AtJ4cs3a7qLZhxWpqtMI59XgkZ+tsKlJLmP1nxHt3u2aY3IwhRSx9Qp/v7rXnTOfFlW9YYL1sSUlDaD9v5yZo5jh5uvbnsvTqyDZPuJ9yYljdE+nGC8Y3Nhvws11ZO264wzC0kzz2lA+7YJCuf4HBBJ5JKRhYJWiQklKX99dzVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782922676; c=relaxed/simple;
	bh=YfQHfcVqHePLzaZVN6ysi8++/t4mjjblBR2eNCCFW+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sbnT+atd6orwpBpyddiBwQAW9+GEsHiXa9iakWBOeTPlNI7slcSSL2vy3rqLv0eFV2r7xtXdYmHDRmtztgFIClagNJQk8kiSpOBvD+uNzBihdDxlsci7D1RgBqmwcBUjezEAdS3hOPqdaDvMMEyWQlnlahYpLgrp8euUAOfZIQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jKEnOKty; arc=fail smtp.client-ip=52.101.84.17
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BeenkKrFB0XdUPEDK5uA6rGrGAboL1fY5maz+1wj5yeAV+P9pmwXmrng9vrHD/k7itHAeP11qJ/a7tyvT996W7/PU8I02Nka4b/3/BiujECRpyY4uWjC3vKnbdX7zcwDvk3IAZQf3jcqVP4QdZc1+wkNIIqh3UQAS/jknLXbEFI5ltdVr5WVqIkLvVOmHN6UGt91mlQ/ZSYZhpkLUwq7MkGijhMZqhiiS52FcAOEE1gCTqQ5eBpVFiyWvfs/tzC6MKVF763ZgzlHyDolP1sVmvMR8c8wSIouEMtZFBXWlxiyJWP+IqRUvPwg0gVJPHbbvkKEijeT6dpazmUlPiIe1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vh60GtwBblEHg99SPr3/DxDt/YpaR4RRDMlS6XQtlWE=;
 b=a1cGkqXXJmEOGdCJGxkLQCO3G7S8V/ghsVP+cfpp/f0/jVuUzGlb1Lm3Q/MYtoEYQUKXRfauGWeSzeqtB2iIqh4YwSMuTERiJuZO6On2khxr+91NgXtgqoISH38snYpnsPopnLANPHMZRFymY21Yv7seX1a3TFZ7QCnvhVRZdDfcSyGNUVyxtvXUMUU2roIu97mGUpNoDZZ2t0V74pbDulTYsNVS2YlVcAy7mmMCfvPDSFrnbUN2tRtd+s4QZ9Ept09Z3FbX+cfRm+d3+apz41eoJc9DTxxlIaqQLRo3SxLvYXR7T61q/5G5RnDKw1deAsXQroH+m4avVBqXQ1pL7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vh60GtwBblEHg99SPr3/DxDt/YpaR4RRDMlS6XQtlWE=;
 b=jKEnOKtyV6kBeXHJj74Rx/vs16WQ662fp72/z0TKemqKd9izdut3Bbuj4Swus9rrlvCbH9RxXx0upHDs+ThwhLBzaulzWj7XMtQn0IvEUkZyU/KM7GzeR8/XB2IWIIXocfH9phoKb2UOcbS+WVtCVWZmLxePXy7kv+eGL/35MZDjaQEIts10sOtPSklcnw3LgHBN/zluMUe/XIuJaGkm0Jz/hLSDBOz3PDCWhznN1lhTpWV9JqUC+IFUfWAiYpGTkNdYu/6AsDD10fb6st1bhYs2iB62psVEqrqimtEIK/xFYaGbkrkzNqMDon6/nCla9oFNmLwjnrsr/b1DsvFdPw==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB12350.eurprd04.prod.outlook.com (2603:10a6:800:30f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Wed, 1 Jul
 2026 16:17:50 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 1 Jul 2026
 16:17:50 +0000
Date: Wed, 1 Jul 2026 12:17:40 -0400
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
Subject: Re: [PATCH v6 07/16] media: v4l2-subdev: Move subdev client
 capabilities into a new struct
Message-ID: <akU9pDAt_-AypCFW@lizhi-Precision-Tower-5810>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260701122634.1728782-7-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701122634.1728782-7-sakari.ailus@linux.intel.com>
X-ClientProxiedBy: SN7PR04CA0219.namprd04.prod.outlook.com
 (2603:10b6:806:127::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB12350:EE_
X-MS-Office365-Filtering-Correlation-Id: 20cda35e-9276-41c9-f5b9-08ded78c4bec
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|7416014|23010399003|18002099003|22082099003|6133799003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
 z56tlW3duwyRxH3A56Ffoo/xADX3g2SsNjQkGR6LCG2aI6eHuf69mAA0zvwltYnzE/sb2kgI47i4eJXa/iA+ZN4Ie93ebygT0GhbD0e/rVRAmIleDR2pEPH7rmvxsdAwn609k0WshXTHBBr+gnVxz321ZS8KhrWobqOFMOGJKCbsl2jjNVNks4YlX2xoyYfot4A9P5Do3uodXAxomFADkBdGqtckC+rY+HqOyYMAa2RJW2qQ2oIQB4cZW3MF+La9ULK9/At2HF93I2VHZsofGpj9J0LfuFJtcFXmzY0NoH08PGr3Wt+mF4jgcKIMwnShPfOX8+kEn6RHrMXcfKpEOTnDLVctYPGA48jeneReVA8MQVDOUCJQAutdDOC3X9BFSC3bf9gcIT4dWrcq40zHlILgAA19al8rbt3dkYmBdevWF5EupxE8LHH5zqIcH6sAvqJBMrQX1FhqySH5hgfIT+zmaPjql0TvXQ/Dxo3Rd55JYaPZfIWeouQqtY7CXKQxGnMYBUqDtU5oCmnz1shCd0+18ZMEnNIBzkdJ4SyNk/Uo26SQsjwjx5eWXF5QtelfMrgcalacYSIM68p8l5JL0Y5ePeCBeSDxwH7sMLtS3gOox1Zgq163DgkZaLYOAdNlmys1Om6gMdpCzFo1wf3AdX9nyJTxakfIRF2b1nuJ6zs=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(7416014)(23010399003)(18002099003)(22082099003)(6133799003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?amkKoHyKhIKeJ+OniI2dh8EfLW5AD7qLjZLPXOKisg7dDx8xnlnyig+fiakE?=
 =?us-ascii?Q?8kUuMQEnlzLTJHaQgt+2DDjtfbowP4kYfIS9u44ipRBwL2QghTmrN5+8hGqc?=
 =?us-ascii?Q?Khva2jz0yggfVDUURcMNd3b0o7gBzn2BrAiShupG4QtkIMEl7SXDxs6ZiHcl?=
 =?us-ascii?Q?iZkgGZMXYFp3JZv9rx8WYrjZJQakyzp85t0aPjO9MlOektoMI8s8UDL1ro+7?=
 =?us-ascii?Q?7NXom3cHkiKXGyLyUodRK6RC8GHeLjsSnPo/BuvDUzWJ4TnajvK9cPr/UWam?=
 =?us-ascii?Q?1Caz1T/8WSgyyuvx9vcCiCGh2I+tehUwfRdh+LzR0by9Z5XrYDqMvxoPPneD?=
 =?us-ascii?Q?dwTGAF1Ad8QXdPpEkU1EsFC8Jh06oz79elStVSxmUeb1XG3zqSuDJ3pgd+3m?=
 =?us-ascii?Q?EAIXcEe4Ad5EfGOWqTMg6ctLpGAUaYjEyUESGLZG9IsbVw5RwoxYfd99M6RD?=
 =?us-ascii?Q?mg4kH5N2TV2Vhbjrk6FDQHjjGe+mrbKvArVSpCQDCKsQF9eE9poSvkw1QgN+?=
 =?us-ascii?Q?z1cAAcIsbeVGaEPEluv4mlAKWV88ac5lV+tlCMTQkVcjlPitaIjbisqXnDkS?=
 =?us-ascii?Q?PJCUOyTmcyhpKACH7fycQSkHIX/kh4+PAROp2QwtFXB9NrykgkvpGol5Vvzp?=
 =?us-ascii?Q?se7v5NwPJmo1HI2f02W3uI3CftiIrGd1+7CkMu1NEwm392WORhJd+GWhmA+I?=
 =?us-ascii?Q?fRfJp/vV1T6O85iGMvi5UzUUybxYaEv3Rrok2COMsgrrWMiw/WT8wOfR74XG?=
 =?us-ascii?Q?QMMfLtBNdE41v8Ixc38ZM6s+g0yw9tfECpP9CCxcyLcQi63HCoLglthLuAQf?=
 =?us-ascii?Q?MYDuflcr1msVw+6u2P4NNodIOduBDf1m8OoJdOoFcdhkD6evOhxSQmZ/zs9B?=
 =?us-ascii?Q?Rf3ZK011hL0JtcPzUjns6XShF9v2alz9OHI9GzloU7oLX14LDR+XoPEvZJVY?=
 =?us-ascii?Q?pgGg6NyNTlwi2FFjMffGkDngZ0+WFLbpu26mkxlSgRcEk/UT+RBUldOQWyA+?=
 =?us-ascii?Q?RxbLh+xb2+gh68isDtgXJqJuhDyE2nxot7zrZYw5Z3EiIFhSKLjNWCEBRN6Z?=
 =?us-ascii?Q?Pab6RNcKaVNPZF+69nSAdHD22STLCM8sXVNTNgAMpCNTdJipMs4FreMhcCQZ?=
 =?us-ascii?Q?+dwqZxfi1pQiZeJwpTse5xG5M7eHeJNcCTh+aFQIHKF+MuoWTNrp5RXAou2K?=
 =?us-ascii?Q?SBYBVByNTq4EUh7KWBv3260F5yov4UGibrPibsasN+xXweYjjyFQ6joGqFo+?=
 =?us-ascii?Q?4yFXuNbfKz0f5ZDHgZwDkqAmwshMVXmga0sxBFxAaS4rEuoRtkJkW7uIgWIs?=
 =?us-ascii?Q?XUTcFQr6ir+sMbEXaj6u6ty5hqJydu44fmYmbohC5mVZKhOaP7zKMsYZiOH/?=
 =?us-ascii?Q?oEVNRXNLODuJLeeo+15FrBn7uBGRsXMsjyhGZnRWC3DAZCepefT4rF0o14mA?=
 =?us-ascii?Q?cg5jyXuE5SPAHtdAcwSehJ7b02diRST+jenoHXcBWqkG0yGwQxVqVdHjHIn2?=
 =?us-ascii?Q?SN2SpyoXlhbQS/B7UJBXOpfZyBkECKdzyUsdqq74I10A6xWum3xSSa3rvIwA?=
 =?us-ascii?Q?eSKA0pBmkAIyZXfe+mssQ164If5eOQjDuS7nLmKisSrOSj6n74QzYTgnzf1a?=
 =?us-ascii?Q?g+ssJFkuma31Az+lJFJvgNXEGvJo5Cjf6a5/RLm+bz0sw4ZggiMaaR5oNXj2?=
 =?us-ascii?Q?NtEVMmNMSeLp0rKSuc4wwYlo7XYLX4piecrR8F+kSi/INOCAUng/PkfJ+QE0?=
 =?us-ascii?Q?G2tgCT0HJB3M8RXhC5AN6mWH7GAXn+hIx/klgm+UDetx6ntAVsUg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20cda35e-9276-41c9-f5b9-08ded78c4bec
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 16:17:50.4831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B012gLpxksbsjCr0Hg0HrfJJ07CaK5XRgSaDpsfkYaCI76fjGqDfOiX2YJ45UBCdEcFmWMJsVSkjWAmH7/CYNxITdvfrfC1LrWRXPsJzqnRaGLrKT8SUOvO2wZ3HOzuF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12350
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
	TAGGED_FROM(0.00)[bounces-66251-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,nxp.com:email,NXP1.onmicrosoft.com:dkim,vger.kernel.org:from_smtp,oss.nxp.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,lizhi-Precision-Tower-5810:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C12F6EFC3B

On Wed, Jul 01, 2026 at 03:26:24PM +0300, Sakari Ailus wrote:
> Add struct v4l2_subdev_client_info to hold sub-device client capability
> bits that used to be stored in the client_caps field of struct
> v4l2_subdev_fh. The intent is to enable passing this struct to sub-device
> pad operation callbacks for capability information. The main reason why
> this is a new struct instead of a u64 field is that modifying the callback
> arguments requires touching almost every sub-device driver and that is
> desirable to avoid in the future, should more than the client capability bits
> need to be known to the callbacks.
>
> To be squashed to the previous patch.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/media/v4l2-core/v4l2-subdev.c |  8 ++++----
>  include/media/v4l2-subdev.h           | 12 ++++++++++--
>  2 files changed, 14 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index e9f81b9be9e2..070a9e607fe3 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -611,7 +611,7 @@ subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
>  	case VIDIOC_SUBDEV_S_FRAME_INTERVAL: {
>  		struct v4l2_subdev_frame_interval *fi = arg;
>
> -		if (!(subdev_fh->client_caps &
> +		if (!(subdev_fh->ci.client_caps &
>  		      V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH))
>  			fi->which = V4L2_SUBDEV_FORMAT_ACTIVE;
>
> @@ -650,7 +650,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  	struct v4l2_subdev_fh *subdev_fh = to_v4l2_subdev_fh(vfh);
>  	bool ro_subdev = test_bit(V4L2_FL_SUBDEV_RO_DEVNODE, &vdev->flags);
>  	bool streams_subdev = sd->flags & V4L2_SUBDEV_FL_STREAMS;
> -	bool client_supports_streams = subdev_fh->client_caps &
> +	bool client_supports_streams = subdev_fh->ci.client_caps &
>  				       V4L2_SUBDEV_CLIENT_CAP_STREAMS;
>  	int rval;
>
> @@ -1117,7 +1117,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  	case VIDIOC_SUBDEV_G_CLIENT_CAP: {
>  		struct v4l2_subdev_client_capability *client_cap = arg;
>
> -		client_cap->capabilities = subdev_fh->client_caps;
> +		client_cap->capabilities = subdev_fh->ci.client_caps;
>
>  		return 0;
>  	}
> @@ -1137,7 +1137,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  		client_cap->capabilities &= (V4L2_SUBDEV_CLIENT_CAP_STREAMS |
>  					     V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH);
>
> -		subdev_fh->client_caps = client_cap->capabilities;
> +		subdev_fh->ci.client_caps = client_cap->capabilities;
>
>  		return 0;
>  	}
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index d9dca6905b33..b797923738b6 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -734,6 +734,14 @@ struct v4l2_subdev_state {
>  	struct v4l2_subdev_stream_configs stream_configs;
>  };
>
> +/**
> + * struct v4l2_subdev_client_info - Sub-device client information
> + * @client_caps: bitmask of ``V4L2_SUBDEV_CLIENT_CAP_*``
> + */
> +struct v4l2_subdev_client_info {
> +	u64 client_caps;
> +};
> +
>  /**
>   * struct v4l2_subdev_pad_ops - v4l2-subdev pad level operations
>   *
> @@ -1130,14 +1138,14 @@ struct v4l2_subdev {
>   * @vfh: pointer to &struct v4l2_fh
>   * @state: pointer to &struct v4l2_subdev_state
>   * @owner: module pointer to the owner of this file handle
> - * @client_caps: bitmask of ``V4L2_SUBDEV_CLIENT_CAP_*``
> + * @ci: sub-device client info related to this file handle
>   */
>  struct v4l2_subdev_fh {
>  	struct v4l2_fh vfh;
>  	struct module *owner;
>  #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
>  	struct v4l2_subdev_state *state;
> -	u64 client_caps;
> +	struct v4l2_subdev_client_info ci;
>  #endif
>  };
>
> --
> 2.47.3
>

