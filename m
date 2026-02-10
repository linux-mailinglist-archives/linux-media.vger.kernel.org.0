Return-Path: <linux-media+bounces-52546-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIs9GoGmi2lPXwAAu9opvQ
	(envelope-from <linux-media+bounces-52546-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 22:43:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BF711F7AA
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 22:43:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32FBB3055E7F
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 21:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C0A633858F;
	Tue, 10 Feb 2026 21:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="n4FTVr/I"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011067.outbound.protection.outlook.com [40.107.130.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B587334C36;
	Tue, 10 Feb 2026 21:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770759767; cv=fail; b=bd0CMBMG92fm2rztTfiFm0PV/C1djuqXCyx1RdJZt7pLpf6hiAdB4Kx8iZH5GjuvtWKKctvQOXFgwCsSzlAVstLzDTwpxlRVxgIW3xDYp4CatcwmgzOY1pK7jaxIBZ7vtty9TYqWcx877CaBUNBwejWO0ix/0u1QGisSMpeZhTc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770759767; c=relaxed/simple;
	bh=YTGjwTod6KdlyZRw/rF4rlNmH6z2umL1GoO4g+CzzuA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=DCNokd/rQy7/0SpOpj40orbA0N0QxasgcxqdaZZWW8DlgkpvxbvS5kjPcuWVHPNHOXwVgprjvXppvhq29ETlpTKTEVEiKJVEIpYARM26RkigiOSzumfCkXmLVKcz+ARG8KZN6w1ydBumZtTP2c5vSihKG5WJDnGAmyruIUtjZaw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=n4FTVr/I; arc=fail smtp.client-ip=40.107.130.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OeASRQGGktNcynoZ7lwBmQBA6l1m9/mtErN/ezGbdwy56uW5eP7YOshh6R+B62MaGa5TkxdAE6ODfdIyL6ZkiB3B/kz+xTshfURIjtBQvVHrCGnTrP/LJu+6i59uD+F3twvQmbD43vXTHtlvbZadBLoTIJGD8gLmOfRRNu4fWQ9ElGJo6JcYiH5ZMn5hn34jp9j4BODfbJgc02NQHVK+Q6/W9BWG3wYOQ9/BUS9Ae59ISp40RufWnSK6q7iHWB8ypMJgeSVeAy6t3RP53U7fNY5apig+ghZEZIgQU+JN9WaBbOyD9VUjmnXVLzD2y+wCfXQ6eH2+7n0T9T5pcYsJtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mMUy/ZZl63a9SPbpso3zWlkdZPTK9k3YU0JA4aiqcAg=;
 b=Q/0oNHmAESHdQoyHBFZG/M0fffXXK7l2ABpdIJWsYNpczfMqtbAnI3xfSt0JjdvvT9V9/1LkKEuWjksP05eOgczlBXyKpft62hwcBKFDjzJ/KJSOEXWSlfbDxYuVo1VVy4GAPCoPy+52/F5hb3CExRGuu8xjgG/cL+F12+p1lFn3v2xK99Ym+YxnMm2WLrTDlQ8bAgsRXb4QuY55W3SxmytERJFGgDliYiKcknfghLiEVY/kezOCDeE32e5zWEL3ArXdtF9SCPu3MYpRL/3m2XgyriiuHFwXIfx6tkdAGmpKqV7qR/9VJ0hDYPojSs9VN1De8A6FRWtcVESQPYhu9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mMUy/ZZl63a9SPbpso3zWlkdZPTK9k3YU0JA4aiqcAg=;
 b=n4FTVr/IMV0ze3WFRe4HoehNqjExqqye0WZ6P05P4eAOXQ0WLh4qB5B+iyW/QxZ265GB76919WnMvl7bkw6rayUSbzSL++vXK8CI+TkO7tvYLCDj42/VknsHtT6DVBxqrSFpBS2dJvPRIchdfPOvDTU3BeiFIKY5Vafz5x/YSyjDbp2iQKAw0Q5BYzY2fQzgDrnC98Mn2JA842oCpHyp3SxiDDwkVnEs2k2RroJ4rr5nDIyNP8EHebf3KajS/I5fHAaQbljmdzijihLmfMM6cqKONTISbb5YIyrW02wcdX64LjNS2VW1+u0u8aQ8R26fXnG15MNGDslhmruxlFUPwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV4PR04MB11401.eurprd04.prod.outlook.com (2603:10a6:150:29c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 21:42:41 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Tue, 10 Feb 2026
 21:42:41 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 10 Feb 2026 16:42:22 -0500
Subject: [PATCH 2/3] media: synopsys: Use
 v4l2_async_pad_init_and_register_subdev() to simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-v4l2_init_register-v1-2-8fe43f7d349f@nxp.com>
References: <20260210-v4l2_init_register-v1-0-8fe43f7d349f@nxp.com>
In-Reply-To: <20260210-v4l2_init_register-v1-0-8fe43f7d349f@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770759754; l=1671;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=YTGjwTod6KdlyZRw/rF4rlNmH6z2umL1GoO4g+CzzuA=;
 b=FF0kdpxpAOG6qKMXKKl/m003+t0Ru4Xrrbpo26odady+iiO4BaPofQ4izeV2CKyym+zZK2UWe
 YIXrCnBst8fD3kcwHngPbro7LbscIx6g/g+0cge68TbjLCXLJ+CLyem
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR13CA0206.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::31) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV4PR04MB11401:EE_
X-MS-Office365-Filtering-Correlation-Id: 09cfa497-dd6c-4c63-1ff5-08de68ed5154
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VXE4UjdBNGdsdXBEQlZzQXdZTmdrN1RHVmNDaytJcllTeUR2dVE3Y0xuTlFI?=
 =?utf-8?B?K0Ivb2lDT2tOTmF0aktjdWZaSHdWcWl0eFBybG5xKy8zMVp2VHduaDRFdWFX?=
 =?utf-8?B?YlZuajBRMll3NXVHYWpWT3dZVE8wRDFmQWcyQ0Y4Q0d3L0hBMWp2S3B4OUVU?=
 =?utf-8?B?bEJIRjh4ZzRrZ256Ymo3Szd6a2R2OU5mdHJDWUtkbTNWSTVrOFd1YTJRSFU4?=
 =?utf-8?B?NWZqV0ZIelNpS3ZBY3kvenl0ejVPTHhOQ1FCM1BNbHhRKzZINE9DdFVkNzNY?=
 =?utf-8?B?Ujg5aVVjTDZ2THJYSmt0aHkvZU5waVJRb25rSVRDNGdjeksxN0pYT0JHV2ty?=
 =?utf-8?B?aEpoVjd5bDk4QXptVGFPcmNFQU1VdStqMURSSFBvTnJadUtoSWFSU1cvUzZw?=
 =?utf-8?B?VUtydkpCbVE1d0lhNGtYQ01oRWNLaG9zSE9oU3ppZmY4cGQ3bEFpSzN4MDRD?=
 =?utf-8?B?MXJ1NkZVcUE4RFZsVXJPTGx6ZlEvY2ZIdmVoUXlZeWEyMFpSekFxRm8rbnI3?=
 =?utf-8?B?SnJBaHd3dXhsSHFGb2xYWTM1bVJhK3IrNkxYSVB5a2p0bXovblJUY2dTbVdq?=
 =?utf-8?B?ZmY3VVA5cXNXak8yMXFPdE8yeUl1M1lzWTlZSnptdnZFL3dtTTNjcEZIcVkx?=
 =?utf-8?B?Y2gyazNYUW16NGJISVAxOGMvYnJKdmxXL1drMVBxaE95Y0pEZVpKSmhZclA0?=
 =?utf-8?B?Vm02d0cxQkFhSEQzMmRsWEdNcU5IdWgvUldqMXYvTTFqakNObGNYc2VaWXM1?=
 =?utf-8?B?QTVPWWkrRGZOYlFPczRmK0ltdUhMMWEyMjVYUWhHdFBhWTc5c2NMUXp6R2lY?=
 =?utf-8?B?Zk1ZajJzeXJ1N3RMV21LeXFFay9xMTFmZHQyL29lVDJrWktNMzRndGg0cTV1?=
 =?utf-8?B?aWlEaXhOVjM5NVd6WUNiUElHZlMxRGM5TDl0bnAxL3BPMndSMlVnR3ZEcU45?=
 =?utf-8?B?VXQyR2gvemlsZ0VIYmdvR0dMdzlDWnpIelI4VkNLLzNPdTRjN3Uzb3pyMnBK?=
 =?utf-8?B?cVlZSWFkUm1TalZJRHhYU2E1N2llaW9EYlhlYUZ2Vm04cFVEalZQZ3lrc0ta?=
 =?utf-8?B?WkJ3c0VmWENPMkRoM05lOERFL0pzMTZ2bFYwS2k0a1E2Kzl6VHU2eVlEcUxH?=
 =?utf-8?B?UHdEUWs0ZXJSMjN0cDFhYU05b2ZJK0VRM2tORzY0bDhLWHdFWk9sTlhBdWFP?=
 =?utf-8?B?VlN3V21DOXZjTzFBMzBRMnJReWhsUTUwd2xWWGM4N3RaL2luTzA3Qm5BandN?=
 =?utf-8?B?TG03N3drUEhPUnlzem1tUXNBY0V1b0hMVjh2N3NZRHV3SDVKcEdpU3JvV09j?=
 =?utf-8?B?WU5JRXV1Um9sNXdGeUo5ZEpDTWVoSHNyaHVORXZqS2VSS3kxQUFuWTc1b1k4?=
 =?utf-8?B?c3E5bVNzd1dORkFIcU1GNlFLT1psWVI4MklvUjBXdWFWYU5kYTZ2V2NVVXhF?=
 =?utf-8?B?S2dSSGY0bEdTZEFxeDZyWThVSGRiQWsvTzRkL200elI3djhZaCtXUVhMUTlB?=
 =?utf-8?B?RTdxVjFkUWVWTmZGcmVVREFwRUYxUElUSE1CWXliamZBaG9Ddlgzc1NkVDVk?=
 =?utf-8?B?TVd2ektUS2ovanBKdTRleDRSQkFFdmtmb1pmdk1HNEx6TUR4clJmNU8xQzla?=
 =?utf-8?B?T0EyMFFvQ2xlMUV6Z3NEaFRXSjVPdEZHNm5SVUY2NXBzUElQdzhWQkFUbjJ0?=
 =?utf-8?B?ak56N0IxYlplRnlqbTBKejV6SFBFR21BMjk0bjZMdnAyNXVmWTlSdjlMbWhF?=
 =?utf-8?B?Mytna1ZLVDVycWZjWHh4NmljUWJGeDluS0dmQnNtbzlxRDFKcTQyMSt4eTZp?=
 =?utf-8?B?QXBwb3VZUTNmeGdDT0dlOTVRZFJaTURMUkp0S0FNbnFCSzJhWWVXcnZxc01X?=
 =?utf-8?B?Q2NUQWptZCt0M2ZKLzZuRlhuclZ4YmZOMTQ3alBpdkxsMTZteUE2SXhKZGR1?=
 =?utf-8?B?MTFJYlhVVGIxNEg0OW5JZmM4MUZpTG1yYWlWN2poV25kZUJjcVRXeXY3czdq?=
 =?utf-8?B?OEhzL3pUaUZzTGtBRUNrdm9PREZrRjJjajI4eVBhc25YUi9WY3NKZmhvQTdQ?=
 =?utf-8?B?NnFEUzhtckpIUERjOVlsTWljbXM0M21KMVh6SDhZSmJHY0daSGxPbDJiOE5l?=
 =?utf-8?B?QTlLSmRTdjBlcEtscGszc2JvN3IzSWprajh6cTlyRU5iSHhZWkFJajY0cStY?=
 =?utf-8?Q?osT1SYnL62q/JSLlWdvpqNY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFN1ZmNTdDczTkNNRzB5aURVM2oxcHZ5b0tIQW51QmwzUlI3dWlMUTd3VlJ3?=
 =?utf-8?B?R2pZaEh1ZjQvSUJNTnpnZHdBNnQxd09kNlNXakszOXR1VVZZYlVBUWxIR3V5?=
 =?utf-8?B?SjFmU0VqakhuM0NxZzBLc2g4cHMxeC8vSHpKSDFrLzFnd3FqMTBHdk5MZGVJ?=
 =?utf-8?B?SmduK2tSNGRnZFZ4YTRwV2haUFYrbVdZQkk2clMzc20zc2JObEd4UUxLOVk1?=
 =?utf-8?B?T25MMXVwb3poNWV2SHBwMHpqVmwyakFxODRsbjZoNGxHSE1OVTViQThYekJJ?=
 =?utf-8?B?SnlQd2YwdjJsN3FnbFA3ZWRxK2QwOVlnSWZTc1NFWEZZcHVMR0ZxeXZNeHNT?=
 =?utf-8?B?R0NCblFrYmgwN2ZONTJ3YUxEMURZQXE3Uy9tV0UwTE1JdW9CK3hFUDVBeDAx?=
 =?utf-8?B?dFZNUm9hVjBYTjlwYXErRmNqSk11RWlnL240R0UzVDFMektJQU1neTVyWjhr?=
 =?utf-8?B?ZVo0alJTUDhGOWt2aGJGWmdURzlvaWpoa3gvU0VUNGZzelgwQnBlWW12bUZT?=
 =?utf-8?B?ZCs4aUlFTlc1aUkraW9KTUllR1ZkSVJxNDFSSHYyL2RvallKTWtESUJtOHcv?=
 =?utf-8?B?MUpNMWVuWm9GRlIvT25Kanl4WEV1NHF5U0Z3UVJXeU94NjRZLzNWN1V0aURp?=
 =?utf-8?B?U1p6S3VueFoveXFBd09VUG9jaDBYMGNrY0E4ZHpEMU1vR1B4OGs2MkJxYWRO?=
 =?utf-8?B?RFQ5THZndHNCWDNHOGJQYkozOFFpdnFhb0hhTXVTNzlWTE9HZWRzRDhGOTNt?=
 =?utf-8?B?ejVWZ1JZY21ZRUJaaEVJblYzUVE3NUwvdlVBWURXTXU4Nlk4V1lTRXRBeTZN?=
 =?utf-8?B?ZS83cXpNd1Q4clM2N2o5MjVMOWwyVWJSelhIazk1R2VWcnFneDU2TGRDWWVE?=
 =?utf-8?B?cUJ1eGtxeUFRUEZWWVJzT1BSOGxnQ0lia1NpRUoySStNemVXUFBtK1lzcmlP?=
 =?utf-8?B?b1lNM3hSY0JrUklvMzhDSkNhOTVQdHB6aGpLVzhTaWdTQllWL3Y0MFk2WVFI?=
 =?utf-8?B?LzlMZndwNjZ2ZWZ6b0RhZGlNWGRBTHZXdjdIV3lST2Y0ajFWemxnRmMvL1ND?=
 =?utf-8?B?Zm1QSFpZZjlzTGJpZ0J2bVZMSG1LNnFFWm1WdHR1QitMelRvcmJTdkZIcFBE?=
 =?utf-8?B?WU5mcU9NMXI2QTJOUVhyOEtLRWloVE9qbzBYRE14TzFENTJnT0FKVDQzaUt1?=
 =?utf-8?B?MVRMdFYvSzBrZ3JhaUMwR25RSVZGby9ITkZQZ3NudkpheU5Tc01iMnVvTm9Z?=
 =?utf-8?B?K0trQkpkb0paVEVHeGpyaXBnL0RDOEY5SkRBYTlzYWl0TjE2bU11eXR5VFBh?=
 =?utf-8?B?bnpmY0FiUmRXUCt3eGM1a21DdGo4VU01Z2tMS3owUWtVT2doWEV5OEd5KzlE?=
 =?utf-8?B?aXBkaWp1QUM5NjZEVWVRT2lkWkJSRDN5dkFDMFpkcDdETmVuSlVCZnNGME4r?=
 =?utf-8?B?QmI3Z2pjdXZCUnV5SVdZclBBWFNIWE8zMUYwd3BIQUpMbWliTnNrQXU4cEFJ?=
 =?utf-8?B?aFh0dWZSNittWCtMQWVqb1BvZnZrQ0ZnUGZQMUVQV3M0V05CNmdpWlVlV0Nn?=
 =?utf-8?B?cHdZRmYyay9QK2M0N1NiaGVaUlU5VFVhUWNtWjY3NXV2VU41clNBT2hVN3k2?=
 =?utf-8?B?UWZaUDRWMEQzdzc2NGdTblU0aWo0bCtJZDc0Z2I5cXdhQlllUVY2SEMyb1R1?=
 =?utf-8?B?Ti92YVdIdDAreWJTanc1ZUUzTC9obVpncXhxeGFWRWw5a0N2RmV3aVJwTWtE?=
 =?utf-8?B?aWhhMHhmVVhBa3dDNFI3WjhZY09UVFhLdHdraURPbXdWUE94eW1FRHZ0c3VZ?=
 =?utf-8?B?QTJDME5hbm9lcE54djdUOFEvbTBzTTNqWHJNbjM0OE92WXFZS3ZVVGZHZ2FP?=
 =?utf-8?B?WDV3RFBUbUtOMGNGQ1ZYQklrTnpIVXpSbEh4dmNxVFQ0bzJKcHlTb2VVRjRL?=
 =?utf-8?B?ZVFsYVpHeTZ0VkFUR2QzSHk4b2wrc0VUanlUYUJueFVLVkQvK0VJVisvdkNn?=
 =?utf-8?B?aWxXMXVrdkpKT2IwYlh6R2ZvYTAyTmJCTjB0SnJkaDczYmtKUkxYRmNrOTF6?=
 =?utf-8?B?SlVTUm9GOWtHV3lJTlZlTk9vb25DTXJ0dTBBQWhqcXFXOU9xUStNNENHQzlN?=
 =?utf-8?B?cVZhRkcwZnBOTjIvY0hOb0NEUm1YZFEzWmRMYVlPWWJVNkVoZGt2R1E0VS9n?=
 =?utf-8?B?NURndm1UVGJmQWJxMUljNUlLTm9NTmh4ZlhHOG5QK3ZWc0czZEVxdzNqbitR?=
 =?utf-8?B?QkMwT0RPL1dhTmNRVjgvZFNYV2RWd1pNSllhTnlDYTdvKzdlc25iTFZQVi9S?=
 =?utf-8?Q?m0IDODQzECDeK1hYQw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09cfa497-dd6c-4c63-1ff5-08de68ed5154
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 21:42:41.5927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uN2rvlBBCEALOq9rial5reb1mWu1Up586q9u5guKhNmpEKI55JKOM8TA2542Nc34c8BHm+x1zzlAad8LsriQ6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11401
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:dkim,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_FROM(0.00)[bounces-52546-lists,linux-media=lfdr.de];
	RCPT_COUNT_SEVEN(0.00)[8];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+]
X-Rspamd-Queue-Id: D3BF711F7AA
X-Rspamd-Action: no action

Use v4l2_async_pad_init_and_register_subdev() to simplify the code.

No functional changes.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index 5dc55b59d6aeed4b6cb207c8e2ebe0fb3c462644..64ad7ac62c085400e2544cceb91cfa55c66910bd 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -681,15 +681,10 @@ static int dw_mipi_csi2rx_register(struct dw_mipi_csi2rx_device *csi2)
 	pads[DW_MIPI_CSI2RX_PAD_SINK].flags = MEDIA_PAD_FL_SINK |
 					      MEDIA_PAD_FL_MUST_CONNECT;
 	pads[DW_MIPI_CSI2RX_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
-	ret = media_entity_pads_init(&sd->entity, DW_MIPI_CSI2RX_PAD_MAX, pads);
-	if (ret)
-		goto err_notifier_unregister;
-
-	ret = v4l2_subdev_init_finalize(sd);
-	if (ret)
-		goto err_entity_cleanup;
 
-	ret = v4l2_async_register_subdev(sd);
+	ret = v4l2_async_pad_init_and_register_subdev(sd,
+						      DW_MIPI_CSI2RX_PAD_MAX,
+						      pads);
 	if (ret) {
 		dev_err(sd->dev, "failed to register CSI-2 subdev\n");
 		goto err_subdev_cleanup;
@@ -698,10 +693,6 @@ static int dw_mipi_csi2rx_register(struct dw_mipi_csi2rx_device *csi2)
 	return 0;
 
 err_subdev_cleanup:
-	v4l2_subdev_cleanup(sd);
-err_entity_cleanup:
-	media_entity_cleanup(&sd->entity);
-err_notifier_unregister:
 	v4l2_async_nf_unregister(&csi2->notifier);
 	v4l2_async_nf_cleanup(&csi2->notifier);
 err:

-- 
2.43.0


