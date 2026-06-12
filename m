Return-Path: <linux-media+bounces-64717-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PQmKHis6LGoQOAQAu9opvQ
	(envelope-from <linux-media+bounces-64717-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 18:56:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FA367B1E8
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 18:56:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b="ONqhm/wh";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64717-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-64717-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2E25B3027637
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 16:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DBA4403B13;
	Fri, 12 Jun 2026 16:52:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013006.outbound.protection.outlook.com [52.101.83.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC240403AE1;
	Fri, 12 Jun 2026 16:52:39 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781283174; cv=fail; b=FCKmp4o/Mc36xvbkC35FOZU4OvQ+wSTanwvvbNq3hcQt8ds9JPdQ8s2okznSKhCrpnNYP5RkTY0S53LF94rwZL9ImihxUsQI/LU/1xSYWmWH8gLrrlrSKh1mc1IE/AKuHyTbPO2BljByuvwDQ78BnYIYebh25fS+eVJDTeoeYWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781283174; c=relaxed/simple;
	bh=jZ9kngVissZ8nkalzFTk3gmOz9BVfWVALzkW+6nXeSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VBKRd/ZEHYZ/s3+Rs7fDjEli7b7XeK7R3Yxrv69LSCTTppC5OTAsQgR6LeecquGlCDzY0/rXsJ6Tz1Fo1R3lzPJTg79ZkyuGjsuAAv8R3L5ay7Y2x2esOSNWEQpfrRlRryj9cFIiHn7TQhoH8tZrpIsQSixQsEMRGBwaUue8QME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ONqhm/wh; arc=fail smtp.client-ip=52.101.83.6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PDwoA6ew7gMwtfOB2cM5p0pN8I9ofjOSUAl4fX/Sxinz16mQkSGLKy6UsQl5kn657Djq3t7HJ5EfiFGOOQcY0bT3K8pUsJd5fpXx5FBtopNAtz0VU1GZhymxSUs6ZpTBQWrfshr2Y4bMmhIkL7K78ZGyXzUy4/I+u+ZNBpFx0j7qCBr+l3Mrhnm5FEHCALLeL6Bn22qnQPXD6qwojh/u1mGewP4bQXmsWMRGw/SKLQcoYtAon8ea0RtxuYUNos4ugq4yP92PwJDmZ4THFoCHQ79bHonR3dCJuC6Hg3JDmox8fK+VY8sGLhmiOILBseFld1c+5KLWYJ+5uxVlto/+xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O44i1Fwyshg2YQpGEFNiRgDQoEkxRQNSf8YpR8HUdi0=;
 b=kdzU5M8PmhG3Lo3mkhPuzYJ7aQVXumK5Wt1MaOlVlxinBSzzLhmYTHStnjKS/7crNbpb4vMAqIJ5WBiQQvLvsbE2mhFonKNhoRV/7290S5zhifHjuzMiaexOQc9Y0ItUGoDfunmWps0HPHzUpnkYevEXJvwFYN8pXsi+/HF3nAuakTYJLc1w+wrZymQka7g7Ocz0j40mExEsEGpVMB1GFzoaVkRn5v/4g5Q1kDXtZIBMWB2fOSgGDoATlBdrrPehd1+ty0z8jI2sD6Cwb5uZl/Zp3GzOb1hzOlx3Z1kIqSkroZE/Ir0pB9zfl2Zb4LQbE1pxHhT+6Nu/T6zVafI5ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O44i1Fwyshg2YQpGEFNiRgDQoEkxRQNSf8YpR8HUdi0=;
 b=ONqhm/wh2t0sIMOP7iFD6JnyHV2BAJEUkjZ3Cyv52Bj4LfT/3yWz/oR7OdmdD5GOyqQerfGyHwrzmAJ2zy3nLnC8UaIFo5cewoFySPjzNV9VqLW/IbUlqcc0XEJU16J5CCuinf0rnO4QfHFNXVH6j23sePn7EBQXLn02LkRBpkwELskIpYYQRdFEG290SaHShrC4Pli4FRU8iTrKaBgV6QWSjBM5oZDKVnWOY2k8xbqXymP4rQMcXVSHOcAaZ91+9OMI8qqSu5byF+rk9rao4C3tdwcv6yvLEWreqamMwnA/XHku1ZukDR7BNFbH1tVxEdApEOtX9Of35N1/rme9Dw==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB11544.eurprd04.prod.outlook.com (2603:10a6:150:2c1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 16:52:36 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 16:52:36 +0000
Date: Fri, 12 Jun 2026 11:52:24 -0500
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
Subject: Re: [PATCH v3 2/8] media: v4l2-ctrls: Add user control base for NXP
 neoisp controls
Message-ID: <aiw5SBQpk_tFYJeN@SMW015318>
References: <20260612132039.2089051-1-antoine.bouyer@nxp.com>
 <20260612132039.2089051-3-antoine.bouyer@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612132039.2089051-3-antoine.bouyer@nxp.com>
X-ClientProxiedBy: SA9PR13CA0099.namprd13.prod.outlook.com
 (2603:10b6:806:24::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB11544:EE_
X-MS-Office365-Filtering-Correlation-Id: 84de4fb5-e076-4600-66a8-08dec8a300fe
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|19092799006|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
 LbGDMJ7oK4XCgFeT42IsWgQnodfVkXST1Mwh5GL4v82kqFCiufQVoPqeHTVKN083Npa1QxzIstAp1U0S0vzuJ8JwXkdHxfBm7QZ1gKTC+IO2qQWx6mLQyPWj43B0QF3raZImG9FXSvCP7CttjtDGogtj0aOy5GibCf6Z8mpL3Wg/NTtUVxSBjzWaNmAgAA2yNuHxCOPMoNdKdVrTl6Vj1IefF0LATrc0oZULkx7ouQ/fzXnoFkZeiFSKdKso+qn3pkn2ZI6D7zxdU0x2UUq/SBIcwjoDgIsy1SnVuR5uDUh5tFGOVZik9sMfcQEzsN4mHq9TcWwxx0w8tEJkVHcAoOF2PKKl9YMqjs4oRvK7qf5R6PkbLGReJM+UvowyLMtuPN3XEY+KIVX7VDONsvXJVK7X81S1ADNiI0T88dgyrj3Q2c0ETLTlo7eGscAKI9hoOLE89N5kEIKT8x3l7uMi0DEssNl/xIX80ZgRKTPqqqR8G5uXVpiNyH81wpsk2Mq1zBAXCK1rxDjc/0r98qbqWeIAVcQOEeovorEiZOnnPNTqxhLG1xfdLcVauXSZVfR+sE+E847+h+ROXg5goqB0FqyQQAQqQ/DWnPVIoS61vxEcILmg8UgFsQri17YnK+eivKoL/9cCVaA016bsnLxdKe2iO96M5NihQGlweQ62VVx0U0mFwl0pJWfXRSahkus1
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(19092799006)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?V3pMpigLOckE9Pb+JBBSV0jAXLmb+k1uXKkJ2GaE4DfgkkIMZatNPCagrVjL?=
 =?us-ascii?Q?NNQ4P8U5aEDReM7rtldHFCFWJIThggQBQXDyLQiaAJe8SFM5Qi/7S+ABNtA1?=
 =?us-ascii?Q?ZwBu2Jv5MOBQtzbLweHmi9CtypuKH1ZofkcHycQ96mWP8o1D/napWK8JaORN?=
 =?us-ascii?Q?lxJhg+cenC7/4xe61vhjKHfKzLGy0Aewst+zLxWHW/aGQiGpYUiKxVm1lwvU?=
 =?us-ascii?Q?PTj3s/vwHPCmTZOKnqmB1Nos9sqcVO6kMT8fgoCzppVF1lCIki6bpYTyzNcq?=
 =?us-ascii?Q?wnqFlB5C8L/+cByBqT7Y2H6+t76J+a8IPtOdSVLQQzVj0CfmEFlDqbm9kLM2?=
 =?us-ascii?Q?G9We9iP4PQQ7n4bwmOYy0rH0DHRs8zzP+E+ZIx7uI1ZCXQgYVbuf6WvtFlA7?=
 =?us-ascii?Q?rOrsdyQjFZRyQeWNq+fK3hKyEMMB3G9CQZmodajX81sZlcq6ZCeWafVdWX/g?=
 =?us-ascii?Q?+XBCzogtZ/axBAq74HKi2/LLE6IHWJJlAfq6C5DigElP0nNpOSRxnY03GuHk?=
 =?us-ascii?Q?yD9QooEuMS/SJE69LhwxHOOgto27b+FXUuX5bW0PZWUpEh4cczCO7cBPzzjs?=
 =?us-ascii?Q?isTJDe4eLuD/EJK7pQcGBwBajg/qSp+v41RoOdWCA3pgvTBCQEOw/aHozO9r?=
 =?us-ascii?Q?vnraRprOylkVk6uOKD4Lc7DpXh4HjZv6kCjMDidBSdCjKjkzxqzsPRhbk+gx?=
 =?us-ascii?Q?3FzsRehf9XslyrEFCYSTTcQMMWf7YEzONS57O7yCQMHQsjNNZr9cFD/RxQHl?=
 =?us-ascii?Q?wehLCBG4v1WSJf+/s8KGoWoiHfiC/qYXOoAM64kkcGNZ9FHXodAMtkYfpsPC?=
 =?us-ascii?Q?raWmQjODk1CNsji6Pv/xWWneR9Idw0x0YNQdO1/JmmqRM5wi4S2DXoW6dWbt?=
 =?us-ascii?Q?XniyJTuDH4FSGm/aZhOlU21r20tApjFyX4VlD6sVY3rpRUVI/FlpH5ah46jj?=
 =?us-ascii?Q?M8slr+PRM6ZPV3hZ9RG69tkU1czcUOiJ9Z332vwEMfabwSeFmUYoM1W7SeHB?=
 =?us-ascii?Q?K/wn88wDiOStq2vr7i2sA6fWIlD9+HGEp8x4o534Zfr2VFVMIWtAc8nUT9Dr?=
 =?us-ascii?Q?AtwIJt4DACzSv7N7mITVHa8tpmFvMP2ul8J7H7dd6N9ccW57Yny1T3KcnPFA?=
 =?us-ascii?Q?rMMoJ7PlyJs3+zajYXnpxapGMeuqH5qIv0tAauO8meUp/W4qzDF5vCSU9gpp?=
 =?us-ascii?Q?lppBD+FWQ3f/DwVB7m5VJK5aI7DT6yaNbhJjN4Sql0reOjV0Ezi8huSIvyol?=
 =?us-ascii?Q?EfvZOPtauWzE35Q9UUwxjxTuYwjBkE8M8Z29t1eJ21KYp5fcQ2HANtFJqTAB?=
 =?us-ascii?Q?9EP/GkOw6/VdU3m3Zsj2C45anL9ZnQud9JlAuAwMj8PRaH5yBVh2EHy0LZJU?=
 =?us-ascii?Q?TSFdxaMvbXkV0V59Ipip+OoVPSb5ZjkQ/ACf4t2W0dMRIQUqd8sNAUlvvocw?=
 =?us-ascii?Q?24DFPn/Qb38N55vLD8w/TfV4Kfwih10/ZHmDSlkNBAuZC+FWodY2vhtNyzlo?=
 =?us-ascii?Q?q7uwxOOAMQafgk9fb01tPk49M7yuaZi3VQR5V0wr8gMlMbOIjj5rVdmhtN+n?=
 =?us-ascii?Q?liuID6eP3/pLeLtZkY5smDcRtOWL7ABHXsERpGW1uTV9LjwnNB/O9CmMYit9?=
 =?us-ascii?Q?4mRbyPTn7MpCZJmdBOg9Ftj+Zb4QQVgxV1Yb9jUxcHM80MrErhdvGB2UfbMz?=
 =?us-ascii?Q?dQdtMyrhM/W/pt+LjLldwgiD5yLw8vDqHgPcR2rjRX4NLCCR+91QW5t6i6pr?=
 =?us-ascii?Q?0H6cYrkaGj5uGlS3yJYhMeMJwu4Wt3viMbMZ2z1jHurN3m9FNTqy?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84de4fb5-e076-4600-66a8-08dec8a300fe
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 16:52:35.9089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JSurdobn/NdcvX9iBJ+8Wazb4DcgWvDf0mn1f0LIlaLpAJ9OMx9dnGDa2zKCxe8HgjSB2q59b8zaIhbndkdC33w9dhm9ENJoA+8RCEjxgHru9X8KzfMyv1zM/pFe23TL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11544
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64717-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:antoine.bouyer@nxp.com,m:julien.vuillaumier@nxp.com,m:alexi.birlinger@nxp.com,m:daniel.baluta@nxp.com,m:peng.fan@nxp.com,m:frank.li@nxp.com,m:jacopo.mondi@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:michael.riesch@collabora.com,m:anthony.mcgivern@arm.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:ai.luthra@ideasonboard.com,m:paul.elder@ideasonboard.com,m:geert@linux-m68k.org,m:sakari.ailus@linux.intel.com,m:hverkuil+cisco@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	REDIRECTOR_URL(0.00)[aka.ms];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.nxp.com:from_mime,SMW015318:mid,nxp.com:email,NXP1.onmicrosoft.com:dkim,aka.ms:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 76FA367B1E8

On Fri, Jun 12, 2026 at 03:20:33PM +0200, Antoine Bouyer wrote:
> [You don't often get email from antoine.bouyer@nxp.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Add a control base for the NXP neoisp driver controls, and reserve up to
> 16 controls.
>
> Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
> ---
>  include/uapi/linux/v4l2-controls.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index affec0ab4781..1c44229d349d 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -234,6 +234,12 @@ enum v4l2_colorfx {
>   */
>  #define V4L2_CID_USER_MALI_C55_BASE            (V4L2_CID_USER_BASE + 0x1230)
>
> +/*
> + * The base for NEOISP driver controls.
> + * We reserve 16 controls for this driver.

Generally, don't use "we" \ "you", just

	Reserve 16 controls for NXP NeoISP

Frank

> + */
> +#define V4L2_CID_USER_NEOISP_BASE              (V4L2_CID_USER_BASE + 0x1240)
> +
>  /* MPEG-class control IDs */
>  /* The MPEG controls are applicable to all codec controls
>   * and the 'MPEG' part of the define is historical */
> --
> 2.53.0
>
>

