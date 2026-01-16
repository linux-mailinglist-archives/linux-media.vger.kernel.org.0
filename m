Return-Path: <linux-media+bounces-50908-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A42D33719
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 17:19:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CFB9E304A99A
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 16:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76EC83933F4;
	Fri, 16 Jan 2026 16:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PsskA0m0"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011000.outbound.protection.outlook.com [52.101.65.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE61341062;
	Fri, 16 Jan 2026 16:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768580329; cv=fail; b=SacY9BVlEdMIFpoDM3HLJLJ5aqs0EPX4d8l8HS+1dyVIINIO7ib2KQJfrX2LCuSmdSF0vCTZKsbiGtu5wFIYjLoPld+kTe5PBScZyZiHR35/X1Y7qmSfQiC/nfSP36+fdGSBcsGKzJD8VPZHF1G5Rf9jfELDAcubxwDNuHKXQNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768580329; c=relaxed/simple;
	bh=rIIGj1pOcYLbPuEP8tSVf6f/1J3pRx8B92aOnfdq/vc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=pr+9FVEKpniA/NPIIDSB8u33tpq2QtEXtsack230NVARBpWvI1AqgHh9lS/ABrOjrWb41zFBXnIA/9fy9RC5FOAYgZnTn1upNWC4/BfZPLjtuvzlU8ts+puFRnpFWWCldzF9C3vUZg7G8tzv/WXNJgRyYk5cNN5QO3MOMJTImas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PsskA0m0; arc=fail smtp.client-ip=52.101.65.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V1Blz4fY7KsVMAG9k38o8VJXypmyLjX+XMtTBlfM5Ge56SGkeygtkyvRgw3D/ByPOl74Vhg7YUIQocDqdJ3Qvee82qTnGIhZiHdyMgHLECmiwSojR8+eli0gak61DNCFwubXpOg4pywCNOa4anaY6BdEUBwwFN7HSVtCG033j2q+Olxu1NlkJkJ2ThZtiBurMDb/j0ba6Y1/84WSTV9cjZc3EGAQRNi7fT3Tpg6KsXN3EdtoVFEZZlKF9g5LOcT76Sh+uINrftgL6PSe+nAxlQSWuJco1GbUxqlU6hZJYP6tCoMxBlnWAgwX+9kTWjiW/iMLhCs4FRVWhoVpvrgQPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MwJuK9xH9uZEaFmpscjMDx4HuCXH0qH/UiUYdvbnMig=;
 b=RakZBSm2SrF2axQXY40LfnA5s1TfM2bEhblwGsGWAKF6Z/+u9K36F5qXVj0R1bQu9U3OnLy6ZOu4BP5GOzf4nHpQB7dx5/B8NryNAg3g16+rmHoQPw/aIqcPQHKpWpJjBNCbGrKUYcQ5pRHjKFw+C167mLlFbBS7ws3m4bnHMmBKDj8wBCJHiKULxesVtyVXYIIee10leExxTkSMYG+Vp8xXXSOYatF2Xikl2//3RqZtGjZyGQ9yRfto2dzQIsad35zMkGJJlW/osM10ZzTA0axcVQf/NJH9UmsNRQ0aWvLniNH5UYwu8yoF24QxISYAnnRA8DJpgwI7pz8AVc4V3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MwJuK9xH9uZEaFmpscjMDx4HuCXH0qH/UiUYdvbnMig=;
 b=PsskA0m0heXiaavanGSCGXMeyo7FLD2v7u56st0Hv9PK1G3FwHBiVZaPOz2jSF98PtUK+ben3NWzRDcexSX36LqacqGyBzetr1yJUAE45C1gTqiwBmoHIPJGhGchnsO5ctm22HT2YpkSIdU8PxpWLc3oI6v/kaxbu+6c8FiLYyvsbAOUcN6RAyKGuckjS8JJbhoW0xsnyp/u5PEsTHaGSTvc8Zan8QwFJlH0KDJyJNYm2p8zp+GCun0GHSP3chknMlDeSr5iCdXdCpOUWm5yTyOzEKACxYcEPwp1C/ah/rgWkzy9XxTmTbYBadZd7BwZdRGti0ILMPHpa6lCCqTrGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GVXPR04MB9733.eurprd04.prod.outlook.com (2603:10a6:150:119::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 16:18:34 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Fri, 16 Jan 2026
 16:18:34 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 16 Jan 2026 11:17:56 -0500
Subject: [PATCH RESEND v2 1/5] media: staging: media: imx6-mipi-csi2:
 replace spaces with tabs for alignment
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-stage-csi2-cleanup-v2-1-a56e9cb25196@nxp.com>
References: <20260116-stage-csi2-cleanup-v2-0-a56e9cb25196@nxp.com>
In-Reply-To: <20260116-stage-csi2-cleanup-v2-0-a56e9cb25196@nxp.com>
To: Steve Longerbeam <slongerbeam@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768580309; l=5038;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=rIIGj1pOcYLbPuEP8tSVf6f/1J3pRx8B92aOnfdq/vc=;
 b=JmX0Z4frr34wxnrIeZa2Gdi338CAuK1vcZehpHcp6EgfsVxvlTlg2cActYg9FvJsx7XrTBZ8D
 21kb8prvajOAg6pfKqH3W7FArr+4yrsoa1CSAW82Jm7DuhsjS3S5Nwh
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA1P222CA0002.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::9) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GVXPR04MB9733:EE_
X-MS-Office365-Filtering-Correlation-Id: db2c48c8-9d28-479a-a2aa-08de551ae582
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|7416014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NmlCM0VLck9lVVNLQmZ5RVBpeHdpUFpFaEJBR0Z6cnBaMEJyaGszUTlnNzEy?=
 =?utf-8?B?bnFzVXd3UnArYWQ3RFZlVHd5Sy9kVDZnSDI0TDZiU0l1aVFjK3h5aUdnNWVo?=
 =?utf-8?B?QWdqLzFQSnM3SE1NR0pTMS9iY1VkN0t6T29mcVhoSmVVdjZPS29XSFYyTm1M?=
 =?utf-8?B?NkJQSDhPNXpMaWVJbDB2VE84WmNKVTkvdVV5VHhsVWF4YUx5WlRuY2F3ZFVm?=
 =?utf-8?B?bVpFK1dCZTk1TWphd3UxNnY0Yi9GNDZKSDlrcjdxb0xJVHVOVU1UM0tUM09Z?=
 =?utf-8?B?QlRSeEVncFp0YTdFWGxiS0pMSGpKeFhKMzlDWUhFeTBreDRxNzZxanI2eVZl?=
 =?utf-8?B?N2tYOFlabk5FbjlibE9hdGEwL0FISVloV1BmRkxoci9odGhGbjN5aXgva2JC?=
 =?utf-8?B?QVdaVTEvV3l4V3lvSDNBUGt1SE4xVm5TV2RaNGNaeC9SVzN6ME1abGR1Z21J?=
 =?utf-8?B?UDlkQThZRldBMit2NjZpVnlxU2grdWU4TVVHSFYvWkJ0SDkrQUdMcjRONjB4?=
 =?utf-8?B?eUhYbEh0UUpEUHM2VHREbGxzZkh1R0psMnpadFZqOXJ0Ty80V29yREgxd2hn?=
 =?utf-8?B?bzNUbFVITkQ4WmQwVEZBZ0psMlRKVjI3ekRpMnFDWE5vaXE5M3FYUmpUaEZv?=
 =?utf-8?B?d1dlQjYzNFhCK2Q3Y1JJWmJpeHJnUWQ1eGhDZDNXSmVlaEdaSTFOcDE3aVBa?=
 =?utf-8?B?Rm5UcmgvaGw3NXJKSU5ZSi81c3R4RE5zRWVtb1RlLzBGRDdqeE9iMkZqQmtE?=
 =?utf-8?B?aVpJc2tBMGZGWFV5QXUvMm9BeW1WSm5SM3hkOGczcDNLM0hIYktJbGFUU1pn?=
 =?utf-8?B?cVlkZE5FMW05UWplMmQ1T0hKdkxqOFlkR0VzaTliL09vZVJKdFIyczV5dVcw?=
 =?utf-8?B?eFplK1duL1A1SFNyTTJNazY3cDRvV0ZmUmxoRnJSOTYxWFgxTVVmcmRVWlYv?=
 =?utf-8?B?ZEc1bitzZ1pzMjIrdUQrRDhOMWxiL2w4dW44MVlzekxxYUVxUFQ2UDlySXcv?=
 =?utf-8?B?cTN4UkpGSWtUTDlPNEZiTXlMTXZoMnVDOHZ3M0RpMjQ2ZVNTRkM4eFhxY3Rt?=
 =?utf-8?B?dHBQaC9HMVA1aW95N3FiZ1dOcU94Wk95c1ZkYkQyYmZUaWUzaWF0WGhhaXpP?=
 =?utf-8?B?VkNGYUNXZCtzMjhZKzVLVkNpK0NodnBhZDJLZzQ0dERqQ1N3cEUxWDBOSGVi?=
 =?utf-8?B?TW92TXhVZEpQWmxQaE44NjVmMnU1dmo1bGRmeTNpd2hHcUVlanROMjdvRko0?=
 =?utf-8?B?Q0llNG5TMXFMbTI3NDVULzhKRDRkc2t5WFd0MkEydS9QSXluNE45b0RsajBV?=
 =?utf-8?B?YkZaVCtmVmFhVWs0dnAwb1RJZWY2ellpcEhyL1FPTHBDM3lDY05kNVl0cXZ2?=
 =?utf-8?B?K0pldElpTDkvS0VyV2o0dHNVZTVqL2FTL2ExNzlrL2I5bWpuRzNUNFluaUN2?=
 =?utf-8?B?ZDBSVmtmdXlEQnI1c2N1STVBdWk0b3c3UXJHQTQrTjlIYVRFM09GZjZYQmJa?=
 =?utf-8?B?KzFlU0hOSERveFZ1aWtRd1kzZnhJL0hMZncwMlFzeEozeUw2VWVzOW16RlFl?=
 =?utf-8?B?N3BVSGhKMW1DVnV0OVpFeXE1RXIwZWtTUm1QalFGZVhMNWUzeDRSanUxVmVp?=
 =?utf-8?B?eGVtU3ZOL09LNzlhZzNTRGFwWWFMTjBRS3BOOUdXa2dPVm5MOGxyczZmTjV1?=
 =?utf-8?B?ZXpwdFh3a2k1cFhRQ0RnL1pOUWtXYVlGdm02SlE3VytxNUc1NHpCcm15ZjU0?=
 =?utf-8?B?cG9xS3JYNjNjVWdXajVUZFYwSzd2ZUJETlhWSG1RVks2eVN2R253amlJek9F?=
 =?utf-8?B?WUhsWXQzS2FhSTdrV21iWjgrK01leENvVzBlMVIxRTVpcURMN296clhYS3Fo?=
 =?utf-8?B?bUh1ejYxdkNCS2tUUlNsWlpFOGJXQkt4ck1vZ3JiT3g1SVJBa1pLSDlUczNl?=
 =?utf-8?B?VkhRMXJSTlQ0RlhxdlNjZVhFWEUwQUR6WnhEaWIvWndQUDZwZGpSWGhqbWQv?=
 =?utf-8?B?YzR3K2F4Unh4Kys1R2E3Qmk4TXpCYng1a2xKNDV0K2Y5Y0JQQkdQWjFtT1ZB?=
 =?utf-8?B?N3hoRitmL2FiajZDalJ3RVpNUTJXSW84WjI2Y3MrcVpManJWZDFkajB4aFNk?=
 =?utf-8?B?MTk5SDd2T1F1ZnA2eDBqUXFWc2QySEM2V2JSdnd1WGlEZVI0S0kxN25URk5F?=
 =?utf-8?Q?IhxCfWsk7mG24vNo5WPQ4xs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(7416014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N05rMXpWQytvNzVEOEl1L1BRRk5KVG1pSm1ZMEJqaDNheSt2KzhOMDQrWVJu?=
 =?utf-8?B?bGxOZE5xYUtRM1YwdVBCTG1wdmFxMUhPdENDOWlmVUZkUUxwQmluM0diTHNs?=
 =?utf-8?B?ZWxxSzVXTzNGM3hjQzFYemtaL1E5czNIdnRRK2kvSng3TkpsczVnRWZzWTFJ?=
 =?utf-8?B?MXViaGo1VFZKUVE0c3J0L1c0QXJjMDMyMmVpUTRheEVnQWtoeDFOMEpITlFr?=
 =?utf-8?B?WnVDNGw3Z2ZYZzRSQ0hCVk9SR0JUZWpMY0dlaGlJWlpOeTRtN1E5aFA4Ty82?=
 =?utf-8?B?QlRsaTVQWlhTTjFyeTgweUt6RktjYUZuSFhQNkZRbHlBSlRMcTU4eFpvRGlz?=
 =?utf-8?B?d3lPQVBqM3owcXIxMjFmOFJmRHpjb2VkdXFySUs0KzRjN3lMTXdmY01OUVFD?=
 =?utf-8?B?VUl3R0VvRXhVbGRZeG5CMzNaSldMT3NaMlVTTjhnKzZhNXVvS0d0SCtkUmpi?=
 =?utf-8?B?VjlmQ3hZLzVHTzdyQ0VVSG10aXdxU3hDb043QThOVTRVVmlhOGxxb1pDZUNs?=
 =?utf-8?B?NytvT3h6NVJvOGtVUEpFZ1poeUpyTmd3TVdZZmlGaGxSSjBLUHhQY3MrclNr?=
 =?utf-8?B?RmczelJJNlVpRlFJNFhLSHFEbmZMaytZcld6REhMc3V1YVNKeGU1dVNFQzRF?=
 =?utf-8?B?TnhBaFpwRFd5Y0pkMk0vN080KzZPdjlzeVQ1WXVWNmR0MzJ2enNJMlNSa1dn?=
 =?utf-8?B?Y3JJOE9YWUxSRnh3Q3JXVlRKSHlqQnVtZ1U3ZVZ1MS94NmpNemNJMkxSb3ZM?=
 =?utf-8?B?UXhSMU1Oam90azNta2RyaktCamZ0ZTJRc0theVBIUWpRVmszNE0rV2FvSG96?=
 =?utf-8?B?UTZOcXB4ZXp1ZGJRaHlVcFg2RVdCR3lmSWJHWVNYc1Z2NDkxT3hvY0hMRnNN?=
 =?utf-8?B?aDZORVNjcFpYTEFJa1BTK2VTZDZEa0FpZWY4c0FWMXdUNldGN0Q4QkdQMXM2?=
 =?utf-8?B?R3drU080Qy9wb2doRnI0anE3SXhJRkFpbWtqZUExWGptZzZDUmd1YVE4c29C?=
 =?utf-8?B?TlZUNlRkT0tIdTdNUVprTWhOSWpvS213NDJYOVRMUFV4NVpPYno5QUc2aXl1?=
 =?utf-8?B?YklEL0x4dC82N2VsRlh6eHlMZEtYZWEzU3Q3bHgrS05ULzI5ekYxQ0Z4eWNn?=
 =?utf-8?B?SW9HdDhzcTIvQVUyTGxiY0JyeUxoSkNsNEZ2cUJUREx1YVBvRkp5U0kzYUky?=
 =?utf-8?B?TnZ5eE1XcTlLbFlXVS9PSHZPd3gzczY1SnB4UjgxcDZHMnlYUHpyUTVCUHQr?=
 =?utf-8?B?QWZnSGttT2xveHp2cUsvSXZQalRKSU9ua3NBdzZ3L1JvY0l1bmxBZEp3NTBj?=
 =?utf-8?B?QytjbVBraExVRTBxOUVVRVVCazdxb1JJbGJwbGxNTXlLSWFIc09uSFZFeFZ4?=
 =?utf-8?B?akZNL01jblBiK05JbHNrbnNRMkhqNVgrRWwvZmdubGFINFQ1TitlcllYdy9U?=
 =?utf-8?B?T3VNcFE5VWlFYTZ0R0RkVFF0aytaSVZFWFUzS1VQRHIzVjBrNDBadlowM0Rl?=
 =?utf-8?B?UVdpem9lbHlmcVo1WFA2YXJ0ZnlOK29hQ1NSdWNwRXpOWStjeUdySGdHWlJ3?=
 =?utf-8?B?dUs0N2NJTDBZRmdUR01QUFZ5ZnkyUHl5UDJvcXFIZDFGQ2NWVHpsM3pPNXRD?=
 =?utf-8?B?OVJBdWE4STBYQnordElxM0pKMHl5NUVqMEZUZ1JMSzZNZllFTGZpQU9rVWo5?=
 =?utf-8?B?eXZXSWJ0YTBCMXhUTFhBMnJYdWxBMHVwNGRzUmhkM1MvQVFmOE1pY1hJY0Ex?=
 =?utf-8?B?S3BRMTkyc1VRS0JRMHp2SjlEMTlsSnoxRTIwaVdUR2RHbnhYcFpONG1aVnR1?=
 =?utf-8?B?Nis2VGJlQTNXbnFoc2I3bXFDaUVRNUQ3ay9jQ2lLb1ZONVVQVEl3WUQyODhL?=
 =?utf-8?B?VDZwdFYrR0VjeEpuRDdYVUVzMlF6SHl5Rk9Wd3lCakJtZGkxNS9Lc1hHTERo?=
 =?utf-8?B?bzFFWUZtVnBqc2RxTDlQOGJrcGNOSkZ4MjFVZUoxUUhBUFc2QmVSOEZwUFFY?=
 =?utf-8?B?M3IvWmxoUWpaczhYaEJsUElyUjZaang4M3g1V25QVW5SaEZBRkpOcnN6bUZ2?=
 =?utf-8?B?RldRWGxZdXE0VzVnT3Q0UHZFQStEU0lvTUlMQ0lzblZWb3ZjQXlueGVTMlJL?=
 =?utf-8?B?Ylo0eDBDWHpMU2VFOGk0NVJTbjVOQit2WElGa3JXU2ZqOGJyZ3UydlI5REto?=
 =?utf-8?B?Q2kwQ0Y0NjZ5bEpQcFpNZ2dHLyt5c09SWVBrbVliTkVFcHZzZXpJVUFpaUlK?=
 =?utf-8?B?dnRINTJVQWlKSlR4YW4rbkFndGp4SzcwOGdVRW1lcS9yRFU1alRySHdvS2Rl?=
 =?utf-8?Q?IheUB606ELlukmfeqv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db2c48c8-9d28-479a-a2aa-08de551ae582
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 16:18:34.2117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F5xRNHA3XD6cw8YyiLouULBHTPGzY8tReSV9YN0p0Kh/6EhNfyGap+zneascwVPlPwrY6zX8wdXpxYEzVul1yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9733

Replace spaces with tabs to align register value definitions, making it
easier to add new entries and maintain consistent formatting.

Also use a space between the type and field in struct csi2_dev.

No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
changes in v2
- struct use one space between type and field name.
---
 drivers/staging/media/imx/imx6-mipi-csi2.c | 84 +++++++++++++++---------------
 1 file changed, 42 insertions(+), 42 deletions(-)

diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index dd8c7b3233bccfc34b59e0f0ff813b36752e1526..1113ea2a37f03753423164069b95c049968cc0af 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -23,65 +23,65 @@
  * there must be 5 pads: 1 input pad from sensor, and
  * the 4 virtual channel output pads
  */
-#define CSI2_SINK_PAD       0
-#define CSI2_NUM_SINK_PADS  1
-#define CSI2_NUM_SRC_PADS   4
-#define CSI2_NUM_PADS       5
+#define CSI2_SINK_PAD		0
+#define CSI2_NUM_SINK_PADS	1
+#define CSI2_NUM_SRC_PADS	4
+#define CSI2_NUM_PADS		5
 
 /*
  * The default maximum bit-rate per lane in Mbps, if the
  * source subdev does not provide V4L2_CID_LINK_FREQ.
  */
-#define CSI2_DEFAULT_MAX_MBPS 849
+#define CSI2_DEFAULT_MAX_MBPS	849
 
 struct csi2_dev {
-	struct device          *dev;
-	struct v4l2_subdev      sd;
+	struct device *dev;
+	struct v4l2_subdev sd;
 	struct v4l2_async_notifier notifier;
-	struct media_pad       pad[CSI2_NUM_PADS];
-	struct clk             *dphy_clk;
-	struct clk             *pllref_clk;
-	struct clk             *pix_clk; /* what is this? */
-	void __iomem           *base;
+	struct media_pad pad[CSI2_NUM_PADS];
+	struct clk *dphy_clk;
+	struct clk *pllref_clk;
+	struct clk *pix_clk; /* what is this? */
+	void __iomem *base;
 
-	struct v4l2_subdev	*remote;
-	unsigned int		remote_pad;
-	unsigned short		data_lanes;
+	struct v4l2_subdev *remote;
+	unsigned int remote_pad;
+	unsigned short data_lanes;
 
 	/* lock to protect all members below */
 	struct mutex lock;
 
 	struct v4l2_mbus_framefmt format_mbus;
 
-	int                     stream_count;
-	struct v4l2_subdev      *src_sd;
-	bool                    sink_linked[CSI2_NUM_SRC_PADS];
+	int stream_count;
+	struct v4l2_subdev *src_sd;
+	bool sink_linked[CSI2_NUM_SRC_PADS];
 };
 
 #define DEVICE_NAME "imx6-mipi-csi2"
 
 /* Register offsets */
-#define CSI2_VERSION            0x000
-#define CSI2_N_LANES            0x004
-#define CSI2_PHY_SHUTDOWNZ      0x008
-#define CSI2_DPHY_RSTZ          0x00c
-#define CSI2_RESETN             0x010
-#define CSI2_PHY_STATE          0x014
-#define PHY_STOPSTATEDATA_BIT   4
-#define PHY_STOPSTATEDATA(n)    BIT(PHY_STOPSTATEDATA_BIT + (n))
-#define PHY_RXCLKACTIVEHS       BIT(8)
-#define PHY_RXULPSCLKNOT        BIT(9)
-#define PHY_STOPSTATECLK        BIT(10)
-#define CSI2_DATA_IDS_1         0x018
-#define CSI2_DATA_IDS_2         0x01c
-#define CSI2_ERR1               0x020
-#define CSI2_ERR2               0x024
-#define CSI2_MSK1               0x028
-#define CSI2_MSK2               0x02c
-#define CSI2_PHY_TST_CTRL0      0x030
+#define CSI2_VERSION		0x000
+#define CSI2_N_LANES		0x004
+#define CSI2_PHY_SHUTDOWNZ	0x008
+#define CSI2_DPHY_RSTZ		0x00c
+#define CSI2_RESETN		0x010
+#define CSI2_PHY_STATE		0x014
+#define PHY_STOPSTATEDATA_BIT	4
+#define PHY_STOPSTATEDATA(n)	BIT(PHY_STOPSTATEDATA_BIT + (n))
+#define PHY_RXCLKACTIVEHS	BIT(8)
+#define PHY_RXULPSCLKNOT	BIT(9)
+#define PHY_STOPSTATECLK	BIT(10)
+#define CSI2_DATA_IDS_1		0x018
+#define CSI2_DATA_IDS_2		0x01c
+#define CSI2_ERR1		0x020
+#define CSI2_ERR2		0x024
+#define CSI2_MSK1		0x028
+#define CSI2_MSK2		0x02c
+#define CSI2_PHY_TST_CTRL0	0x030
 #define PHY_TESTCLR		BIT(0)
 #define PHY_TESTCLK		BIT(1)
-#define CSI2_PHY_TST_CTRL1      0x034
+#define CSI2_PHY_TST_CTRL1	0x034
 #define PHY_TESTEN		BIT(16)
 /*
  * i.MX CSI2IPU Gasket registers follow. The CSI2IPU gasket is
@@ -106,13 +106,13 @@ static inline struct csi2_dev *notifier_to_dev(struct v4l2_async_notifier *n)
  * reference manual is as follows:
  *
  * 1. Deassert presetn signal (global reset).
- *        It's not clear what this "global reset" signal is (maybe APB
- *        global reset), but in any case this step would be probably
- *        be carried out during driver load in csi2_probe().
+ *	It's not clear what this "global reset" signal is (maybe APB
+ *	global reset), but in any case this step would be probably
+ *	be carried out during driver load in csi2_probe().
  *
  * 2. Configure MIPI Camera Sensor to put all Tx lanes in LP-11 state.
- *        This must be carried out by the MIPI sensor's s_power(ON) subdev
- *        op.
+ *	This must be carried out by the MIPI sensor's s_power(ON) subdev
+ *	op.
  *
  * 3. D-PHY initialization.
  * 4. CSI2 Controller programming (Set N_LANES, deassert PHY_SHUTDOWNZ,

-- 
2.34.1


