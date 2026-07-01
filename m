Return-Path: <linux-media+bounces-66252-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8xbKNdFCRWpc9goAu9opvQ
	(envelope-from <linux-media+bounces-66252-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 18:39:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 728CD6EFE06
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 18:39:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=KNrFpbwi;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66252-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66252-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A2B3830A91F5
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 16:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52FE8370AC9;
	Wed,  1 Jul 2026 16:38:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013060.outbound.protection.outlook.com [52.101.72.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCC436C5B4
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 16:38:03 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782923885; cv=fail; b=mQm7TAFWCOq0Qd9+QtlmuR2DF7UGvJSfMDU4U3VyqJMeSNUtqNsrFQ9Y0xmsk3BI7thKD4Ay0XmxliG4TYnpVPer3tlMvLTHAg9QCwstOyI7NhDj59tNNoXebvb0kuFpox+/34uYBcQLCG50jb3mOJTnxh+6qQA+7PeNpEa+9Ng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782923885; c=relaxed/simple;
	bh=yUZ+pK3G91m57qhnqxaheH0hUMQFvhMycioOeYc+UC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OGGt3wd1y4Z0IN7FTPdAhrgS9UgX4ceD6ghbDb6MwFZxJ5dVEjviEvOn8qAfwigwwzfnXBsNeGgmoEvGPE7oJc1ZRy9gfkR9vOkPEiKBFxh0NydxRck7Uv7yxt6QYikBbSx2A5JABTphI1rZNesuQ0ggARa/bii9ubYwbw66/1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KNrFpbwi; arc=fail smtp.client-ip=52.101.72.60
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JVKGuHX22iVV8FwrxC73BrKbrV2jaYf7zVZqgyzMqYuPPByyfiqcEmABWGDZnvlUA4EG9pJ84+GnNmD1XHuee0Y9C/6XYCbBDdNUK7c+NHlDcAzJK21HXQBs1ae2AnMD52vaG8vyfaOiB81Pi2nR4Ofxlv1kPmsp0J9eVQw5/o8PwKu42TImZk5d9YMtfZ8LD6V5ZSAotz+EG0ZeEi9cRz1kHKbtokHXWCqWrPLI7VOzuX0xFHIY5Zh+9aqUTpXdZY4QX+V8iU1ZZnoa6spzrfTkcgAIp/0mcIiZDlEGL1q6FjQPeC5RfiJ4ibhLCh16AzQGlT9t9+AtdLS9H5+Pzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXChY5R0wPJ3mS0/4OafSrGR/Wx2z3VVYkvcFeIpr2k=;
 b=ezSyUb7eeGfMBywEsJxYy+eJLrZkF8LW/snMkm8vvlRX/CaELH2ljRlQiaBuQ7zVAB9FBJ+jpfMy2K+q860NTVyyM3oeJrvyVbwedkxSILBEaa0oTMPOVVlh7TuUwdye6CY/dpYiv2rV+R0/9AqLTpHILLLFAT9Qa9Kbuy9c+ZeF8UypHURJD3HVPBfuVgBp5/BjjK1Q+6coFPDFr0EDd22QXXDW9tQaFlZmg4u1xaTjnfhWiT808tEitpCz7BJOmdV2ZhlPN293R5WOzMWAS/Pw/m7Xo1jVRJAo0lbYuOg1IzNprluGaExWhaztj4V1g/8f6hb6bcptBiIIRSq7fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vXChY5R0wPJ3mS0/4OafSrGR/Wx2z3VVYkvcFeIpr2k=;
 b=KNrFpbwiesJkJFbPFwGfeUjve5oPh27gpjkeeXGGSl+KF1NgZeOBfNEuwKbSOB5ItzkJeOCprXVbPdCPMDYbbKfHnkvGMkq2xwhalC1Cqwn+sM4S+2O6vLmPwDaGe9QVGfl5pRZUxK/gzcTqbFU/h4CLe4W9OspslwGb455pM3t5EjGDg0xuEd3Z7tNoLuiDY6Bz7QhbeGh0dQGEs/6M1zEisjqCoB9eZNQfFDpcxTgbAUukds21aevoOduq8taGlIMKx/gZQfELZyVN5YIRN4Rv+/VEW+ofMvDWRhH64LT67Odfv2q58v6Pkm8z916z9Dxd/UENjn0rOctF+9ErYA==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAWPR04MB11570.eurprd04.prod.outlook.com (2603:10a6:102:50c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 16:38:00 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 1 Jul 2026
 16:38:00 +0000
Date: Wed, 1 Jul 2026 12:37:48 -0400
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
Subject: Re: [PATCH v6 08/16] media: v4l2-subdev: Move op check to sub-device
 op wrappers
Message-ID: <akVCXOP8Nwsv8Ji2@lizhi-Precision-Tower-5810>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260701122634.1728782-8-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701122634.1728782-8-sakari.ailus@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0131.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAWPR04MB11570:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dee3484-a201-4f70-c279-08ded78f1d3d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|19092799006|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
 +Cpep0JrtVHx4uJwuwdg4evkckaF1+6NJpbLc/NkhS4TPxgB73C765M3071CBJYBHjIAz0Zqsqwag9XmTxT1rfNIuKkx6V7YU87TOwPxn7+oRO3LOqV44Y1SHdsztmffZt+1bjt+aR5po3Vzj/zKqGrldUEzRmk6PIXiRhTiDvOGeCYG4uAKG5QZBF2AX6MIpozQ0MDaP6RGQQocXSvAcMGKxGVpbuXkZrZz9P+hO+CS4EYugr3npqmrQxz4QRiHUzKpU8bAZwYEexXKoxXhA9+HhPChPfHVr7ntgnl2LzQTFYN8tKEt7Y3NNO+OikDHJr+eJnWnGEAXym1uPjW9pK/VR1CJTrahAoC/fNwEyfhXypesE3qFRfqIGOsiaBFik6nv/1uf+ddBtUnYQVT+2T9c7TIuTUV6Fs/fc/7ixZgRTguCv+0v8Dzgv3KGqDpqQFzJRz3xXiu039j3QYr7h6ZD57INcjXu/Dlwc7+usK7uZVCpOPtpVXpVOwsr8pw/dPDxf5CfZJNVMJo1PODCZaQ+xeD2d9RWzUNr2lF6OL0b+gImRzROEoeaDiygpuvGoqU8cgLmUzBl7tpY65MGLzoj5e5PF6uVvLa+h3NjiAkcWEZi/UElpFhlirR9T4IUUrByjqxG+xmX6m6hwgPlKugKZvzDzeM9JXXVz7AfX/g=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(19092799006)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?ZPrsrLfTn0bvA6EodjAxUCANwREvII/2umNgIbVqw89hs6q6WM8XuuGpkW8P?=
 =?us-ascii?Q?mCXPnjlqsp51IR0r+LCcVhk7w1ddPL5REhcwZXaPwOzSu8NGP1Z0h26H0OLu?=
 =?us-ascii?Q?631Bmwy6nKxsRltdXc6ihpHFVP8oCjyPTLSvZmVT9nZynwZjKafC6xlUI3gj?=
 =?us-ascii?Q?nFQiQ3nO91lOU9f3SPc/Acuwthfhj0Le2mUB4D/M9TGUjPDjmddhI/gl/hkL?=
 =?us-ascii?Q?JGBR8gFP8bBpnaGGhI3IQGqyDTCwnCWzXGF/3dkNbMAsWcY+euQhn3U/av1a?=
 =?us-ascii?Q?/VBtZmQdrU4rGX1moKmRg5cBx0BJDcv17JMiHTQoAiilBiCWzTVbCVXR2Nq2?=
 =?us-ascii?Q?mb52CdtNTch+iLpEMbcUV+u3Zja+r/IeVQ2GBd93LY0QU4BjQKYjyFHUWXfA?=
 =?us-ascii?Q?JKrv6pE6I1oszAdnvvOaV6dKgPQER7T3psNeWc9+Yx7BOTwRXXIJOmbnlsAh?=
 =?us-ascii?Q?UmBIM0WvRmxAERYyCMzvg7IvBCu0NR2a/Hx7ENvKybTPO3h9SjlBQG4hsWV5?=
 =?us-ascii?Q?T5zGDlynSuCPjQTm5Jqx5aUC/DMkRSS6tmnITZ1Akq4MbUVsMUBZoqSskCtc?=
 =?us-ascii?Q?Kr3BeB796O6n3xq1KNOzXPInSolB9eu9G6YHw7+go0ltJCAn5vJQqzL09YYl?=
 =?us-ascii?Q?+XLNcQLaIjrj486JJke/7FVS6o0lQkMbuinZ5CtMYFV8QILFt/8+IWX2XQjA?=
 =?us-ascii?Q?3gN+xHtvcNFagSvzNAE31KwYRkAOjaPQzpul2lyNDwgWiE0TmQqUmG+Afioi?=
 =?us-ascii?Q?yHg/fmisM30mxWLrRXQVgCyb4qS6A3WziphprFZ1PGWcjd+qRf+HsfJmUs5c?=
 =?us-ascii?Q?ll9s8gmMBfp6s9sS6Gjm8TWGqhumwlVUzVvDBzgR8AKFtd1OOZ/zW5Z0t7f5?=
 =?us-ascii?Q?DWkoRuReTNGznIdJ4UNXYmcMau6Z5xLg0FYwZk+ozfQiRrNvfI0k3n/mTsk3?=
 =?us-ascii?Q?4rWFUZi6n35ZaflwEopRbgLQIn7XYD8n7EZfDLBzb7b0p7pHm3Fryji73Rj8?=
 =?us-ascii?Q?++an9IaFdOP84IipCAVuVgJRlREAmN5Z5vUqXEGH2GQiQh6wslF5helOridB?=
 =?us-ascii?Q?dAvZweNtk34WL0BQbvq4BTBWFN9zj5pU44LAaS8IlvMvfPfFtEvBmf0MIcIR?=
 =?us-ascii?Q?LbIdNcX4uqJvgEJ3JqpwEQDRAReM7JrwXPDNGFh653GFpK2LiF4FnLA+3TgX?=
 =?us-ascii?Q?GxcVb2FrCQEY5A2vjyf2f1iMODu8/WgTXgRePk+AntVFM9jy6wB52u0C7Qkx?=
 =?us-ascii?Q?eHJ5+DhJMtn+3ZAPpSj9/dn5eE+W5s2SVp+7yTV3+mERwq0Lb595tqPWJ85v?=
 =?us-ascii?Q?T+ZuopGs6/xoGuq62Di50e7ME4IGU0fwp4raqz7B0DWyzIaamMgGcuJPmTKv?=
 =?us-ascii?Q?bjjW8Upldc8BwPgzWG/9kZjBakXapavSy9x3AdDDNzp8bWQcTtfTLuHubKsz?=
 =?us-ascii?Q?nO7KJP8tvKeoEcekorrPIrP1zye2qDQeou8hSZVqYDJmxV/t0L59bqk1AU6P?=
 =?us-ascii?Q?0NBMXREV9adBhVxO4AxQQ6/XWppaR+B91JAnB5BrJLn8rL5KanckKoWxzbMe?=
 =?us-ascii?Q?FiJJes/SNn/RYbUsC+QNwBDx8CRrC2WGt+D6ys9k2Ai7UzRRuMEvWpH5lpRT?=
 =?us-ascii?Q?6csVStbjyq9VPCWsgi/bD6nZBigKKDczLCtIiaeR0NY37vgM4Q/c7fSU92JP?=
 =?us-ascii?Q?p0RX5sFnkWWBzNfQII42t2wgr0aCRK+5k8T0VMZer4/WycS8aTtiF0JyuN7U?=
 =?us-ascii?Q?wryZISnIuS3R9NMq081zFMtGNlfID9SgEn+7n8JG9VdKzgSp7LTS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dee3484-a201-4f70-c279-08ded78f1d3d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 16:38:00.5847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nGCULsn/a1WD50LhA/KKF3mKdmkox/mvsHwPtkWxY0vUuMtY8rXYn8+XmwsqRYWZJEeRwH6CWJr7lVuwPVBIwnYx0jrDoaaH2smjle2ifmEyUNGPh2QM8m2Ly/XSUenY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB11570
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66252-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,intel.com:email,vger.kernel.org:from_smtp,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 728CD6EFE06

On Wed, Jul 01, 2026 at 03:26:25PM +0300, Sakari Ailus wrote:
> In anticipation of performing work for sub-device operation when the
> driver doesn't implement one, move the check of operation existence to the
> wrapper itself.
>
> No functional change intended.
>
> Many drivers implement set_fmt() pad op that simply returns the format
> just as get_fmt() would do, usually because the driver only supports a
> single one. The arguments to set_fmt() and get_fmt() are about to get
> differentiated so call get_fmt() always if set_fmt() isn't supported by
> the driver. This avoids changing drivers now and allows removing
> boilerplate code from existing drivers.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 117 ++++++++++++++++++--------
>  include/media/v4l2-subdev.h           |   6 +-
>  2 files changed, 84 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 070a9e607fe3..86be4d51c9a5 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -244,20 +244,24 @@ static inline int check_format(struct v4l2_subdev *sd,
>  	       check_state(sd, state, format->which, format->pad, format->stream);
>  }
>
...
>
> -	return check_which(code->which) ? : check_pad(sd, code->pad) ? :
> -	       check_state(sd, state, code->which, code->pad, code->stream) ? :
> -	       sd->ops->pad->enum_mbus_code(sd, state, code);
> +	/*
> +	 * FIXME: Convert the check below to use the ternary operator once
> +	 * smatch can handle it.
> +	 */
> +	return do_subdev_call(sd,
> +			      ({
> +				      int ret = check_which(code->which);
> +				      if (!ret)
> +					      ret = check_pad(sd, code->pad);
> +				      if (!ret)
> +					      ret = check_state(sd, state, code->which,
> +								code->pad, code->stream);
> +				      ret;
> +			      }), pad, enum_mbus_code, state, code);
>  }
>
>  static int call_enum_frame_size(struct v4l2_subdev *sd,
> @@ -279,9 +294,20 @@ static int call_enum_frame_size(struct v4l2_subdev *sd,
>  	if (!fse)
>  		return -EINVAL;
>
> -	return check_which(fse->which) ? : check_pad(sd, fse->pad) ? :
> -	       check_state(sd, state, fse->which, fse->pad, fse->stream) ? :
> -	       sd->ops->pad->enum_frame_size(sd, state, fse);
> +	/*
> +	 * FIXME: Convert the check below to use the ternary operator once
> +	 * smatch can handle it.
> +	 */
> +	return do_subdev_call(sd,
> +			      ({
> +				      int ret = check_which(fse->which);
> +				      if (!ret)
> +					      ret = check_pad(sd, fse->pad);
> +				      if (!ret)
> +					      ret = check_state(sd, state, fse->which,
> +								fse->pad, fse->stream);
> +				      ret;
> +			      }), pad, enum_frame_size, state, fse);

>  }
>
>  static int call_enum_frame_interval(struct v4l2_subdev *sd,
> @@ -291,9 +317,20 @@ static int call_enum_frame_interval(struct v4l2_subdev *sd,
>  	if (!fie)
>  		return -EINVAL;
>
> -	return check_which(fie->which) ? : check_pad(sd, fie->pad) ? :
> -	       check_state(sd, state, fie->which, fie->pad, fie->stream) ? :
> -	       sd->ops->pad->enum_frame_interval(sd, state, fie);
> +	/*
> +	 * FIXME: Convert the check below to use the ternary operator once
> +	 * smatch can handle it.
> +	 */
> +	return do_subdev_call(sd,
> +			      ({
> +				      int ret = check_which(fie->which);
> +				      if (!ret)
> +					      ret = check_pad(sd, fie->pad);
> +				      if (!ret)
> +					      ret = check_state(sd, state, fie->which,
> +								fie->pad, fie->stream);
> +				      ret;
> +			      }), pad, enum_frame_interval, state, fie);

look like similar with above check logic, can you use helper funciton
or macro to reduce duplicate and easy to read.

Frank

