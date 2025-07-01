Return-Path: <linux-media+bounces-36479-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3008EAF0640
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 00:08:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8D5D7A1D3C
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 22:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E46753093BB;
	Tue,  1 Jul 2025 22:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dIGkYHlG"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012068.outbound.protection.outlook.com [52.101.71.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56610306DBC;
	Tue,  1 Jul 2025 22:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751407610; cv=fail; b=M7wZ3sN4VnMjByrta5oFfznagH4jXqyuckWjnMCkTcNAkExKGYNYWdULFobsXJEFloaoikBNaVbqDEhuSqNAHXNBTUoLhRpfdmJFeZTE4qqDMo1L6l02GG26sJRDMYVaLJnzWZO7DUx1+TbJBvvup2jJ8H2SmVTzM74qFzUIK4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751407610; c=relaxed/simple;
	bh=jE9FfxmSgXhxhZIS7ZZmvsyrA3Gb8Z33cn3M5NiDYCQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=EX5/+xRq7KiV6r8TIQ4oMfsjcj5blN6k5/3I12v5iQRVlXqLMb5KJlug/CGRntBi0Fi0UmBvFnB3Oyaa7RGshFpjwLvHhEZiLs7gMS/sl2+Vp0YcJwL+t5pQNalft8pm6QCuQbreoU4+jpWPsRWgKiwF2FCfDANAJFpgNEWYh+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dIGkYHlG; arc=fail smtp.client-ip=52.101.71.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DX861hGSAZhqT9tUWgqpAa1guC+r1jYEJNUjTvY17GHQpasT1EN72Rc+sL+oGU/RLTL5l6xomw1coMPIzw3QErNQGTanCNseoSZWWtxcWLGTgauNr2o4PNMh00xdiU+o7jjvY3nd4pVubMkOUGKW0/AiA2OCOWvz9uzNeceQ8qstxQ1FVpip2VBaFh5qBvCNn2XRxnJCWsGe2sA672P148DJAqs9KR9kIkbfFGeWBvRdYzGU5V9mzUGhaXJopKBxa7P1bFAffjHAiy9Z3GSDLpBkkmtLeQitYSxqqjXT7S3lyMD2XymqUWgnIv8V97UzMdf1u/o90wmCD0YnupkEog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xWi6yfh/Z+OFgDrhtZeHZRhc9EDr4LKe+efwI1yAhns=;
 b=ZN0Nupdttdnrnyf0qBC80teCu2JYx4kG8zCJEg0woKRYSDe7SQE7TzkNBATo0EKsm9AP6yqjPlt8Ls4jsWWTItN8qwoRaWI/o12ubIzMEtIYVlYsknqYdOT0fyZVyBuAjY9RrkmPG6X2RagEfggZJ+b/F9Z4WGGgOgrRcvhNJjaX0uyL9W4cOQjTCbfSUysO378EkD0fD54lpFABHhk6/M5A6eAI2sUBgm+Ft09psDYDoLZPT1+dOQMI1mXdDNOcTiMtL5VQ4XY0QudocPdxoK1knMvLxOgMgt2dmn4Em+XK7dSfke4kIeGdmWhlcbpA5qf2r4BMJ18haGUC2zf4Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xWi6yfh/Z+OFgDrhtZeHZRhc9EDr4LKe+efwI1yAhns=;
 b=dIGkYHlGdkRFryoag8/rNpmcN48u6UsRK/Hxj7y+nEqhNqUIDUwpnDdYskRPhrHWhyAtPHff7O0Yy/4GK8K+0hRte64nsi88aBncVrKdx3wwCgE6WhmDr2voUIqh4hbyEZWd3uQUTVlfAMS89F0pPT3dlCryInGJT1Ff93clVI5NtvdmSBd4LusgJ84+LutL2+3fttWa0qNBXxq1krFGYgPE4xCTOvOcWLgUSktJVnhiSP6C3RI9Ew4nd6mM1UxopfvUKMA/sw3Bz+s0tKqd+3d/S+5kNDqRflErxY/9jLpZLSMoP5gJQK6uaG4+DzCYntTJUJRdL8V6EH2c9Rj1qA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8843.eurprd04.prod.outlook.com (2603:10a6:20b:40a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Tue, 1 Jul
 2025 22:06:45 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 22:06:45 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 01 Jul 2025 18:06:08 -0400
Subject: [PATCH 3/7] pmdomain: imx93-blk-ctrl: populate child devices
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-95_cam-v1-3-c5172bab387b@nxp.com>
References: <20250701-95_cam-v1-0-c5172bab387b@nxp.com>
In-Reply-To: <20250701-95_cam-v1-0-c5172bab387b@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Eugen Hristev <eugen.hristev@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751407588; l=1025;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=jE9FfxmSgXhxhZIS7ZZmvsyrA3Gb8Z33cn3M5NiDYCQ=;
 b=iH60DJa5zEuxyuo6ZLFv0OvXZ2ygjI4xwX7B5kMHLyE4OtwNIC999f6yw8PFh5tTtGJldSfSZ
 Lql4WvC5BWOC3akoc2yFdvsgLBZNFaDY4Bv+qqI00jou5ZM98fR5Fgr
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: AM9P250CA0027.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::32) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8843:EE_
X-MS-Office365-Filtering-Correlation-Id: f89a7e10-f739-417d-52b4-08ddb8eb9188
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?aHNZWGVDVitxbnU4bTVKUXF3dEYwbmlkUTFMaDZnUUlhQ3dYcU1BZlRIR1Jy?=
 =?utf-8?B?Y2VzU3M0RVVVdkhUMDBTYllXKzZMMnVQM2NzWTVzdTl3YnlrMDkwNlZweGc4?=
 =?utf-8?B?enEvaWlMek8yUTViNVVja09jcWhsbW9jakRNREJkKzJTRGNZVDlDVGVNcjBJ?=
 =?utf-8?B?MmxMYXZ1MjR4TllxR2JyeFR6MzBWT2FoTUxsbXJ5ejk3eEZqeHZERmZuNnln?=
 =?utf-8?B?SDk0M29RSlNLUWx0S3QxMFMrU3lKV28wam93VW5tcXp3dkp5cnFQQ0tabzdF?=
 =?utf-8?B?VStBbldFZ1cwNzkzeVVIa0xqNUs4bkpDbXcxdkFDSHFYeFRndWdtSnRHVTBq?=
 =?utf-8?B?a0VrMDJPOHd0YVpHak1WOHZMbVZCa3JhMHVhWVZtT1l0S2VUMWY5VFFUUUg5?=
 =?utf-8?B?dmtnOU1nQ3pBL1cxLzlCUytUQ3FtQk50b0VYQXpSZTBtWE1oSmVFeDBVYnhB?=
 =?utf-8?B?R0w2V2ZvV2ZpdUFIRmhSSjZJOXZMaXR5ZDMwSFR0NkVUN20ralRoQkV1VXVY?=
 =?utf-8?B?TUp0YWNlUVlnS29mRVJjQ2Q4cXJUeGU5NTFYV09KTHpqMGJ6U0JOMUh3dTRm?=
 =?utf-8?B?elZ2bFErYlNkNlJZTUYwSTFpaFQ2aEFOVDk1cnFkR09ROHF2NTVUeEhQWWph?=
 =?utf-8?B?RDNhTlovaERpYmZFN04wRytySk1aVjlaQXdOT2dOQlNpMllaSmpsWnpSMTdR?=
 =?utf-8?B?aGIxVGZmUmpnYjF6TGpzeW9rWlU0ZDZSdUk4Z3hGQ1kyK2h6MzZWNmtsSCtt?=
 =?utf-8?B?TkZvcGlSTFlvdTMzMVh6RHZXRFE5MWNJNXI0cTZEbXdHNkdXREcrNFc5UnVr?=
 =?utf-8?B?UDArbFhPbEJaVy9mVEp2RVhOb2VqTHNQMHhJdm5xYS9mbDczNFd6WjNyekpV?=
 =?utf-8?B?a0ticXhucW02YmtOZ1FiVlVzRDd5dTVqblZpWUt4SmN4MDIwbFdycXVoMlJ3?=
 =?utf-8?B?QlMxSjdmMTAyQkZTMCtUaUdVT2JtcXZkUXN6c3lxRTAxeXBnMkRxdHFCNkcz?=
 =?utf-8?B?ZHBjVEUzaW95aVhWd1FkdVh1Z2xPS3Bsc2ZIelM1RVQzREIreWVYZTAzc2Fs?=
 =?utf-8?B?TjN4RytyRGsybUMxVVc5WjZlWTd4Tk5DbllRb0lBdDRxZjAyaXM4OGdnNXlP?=
 =?utf-8?B?a1FacElxbEhESEtPSEM3WjJPR0NPcHE1RUVOaFhxZ0F6ZUJreTRyc1hXMEpt?=
 =?utf-8?B?NXNEUzdOVStQcXBTenhVQ3pmcmRINXJ1cGdybGErMVA0ZVN5RkV3a3dLQ2VD?=
 =?utf-8?B?MUxYeDRtdk9TVnBZTm5ia285MVRPbHp3aVYyakVYdWZvb3Y1Y2crTXNOYUpT?=
 =?utf-8?B?eEhkSUtMNEszQ1ZPRWNuWUJib215OWcydjlUbFRKL3N2V1gzcmQ5cStFcnZK?=
 =?utf-8?B?YWxXSU9NR1A5UGVnd2cwTWUxRk9SQnlONlFmZUYyMGtoMUNaUXowajhRaXhO?=
 =?utf-8?B?enk1Si9VYXhRelhxNU10SjZ6ZW1qcWorNW8rbDVJLzZFUFVUQmtWQVBpZVVG?=
 =?utf-8?B?Z1lDamJZcGtKY2lWTUk5NUJ6U3l6K3RkZUlQN1J6VFlSeHV6aE1NSXZ5bDVp?=
 =?utf-8?B?ekVmVUVUZEk2eXNYdFdzaXFsL2M1dHFIOWR5MFNrendOSWZWelRmZ2xUSjY1?=
 =?utf-8?B?UkRZZmlNSThPMkMyNzNLL1lWWEUzdEVnSDl4YnhOWHlqNVlBNUhJelNVMFVN?=
 =?utf-8?B?UU12bjMxYWUzejY2bER3bjlLZnAyZHhiZDY0bHlhWjl5MFYxbUNxVGhsaVlJ?=
 =?utf-8?B?bm84Ulo2VzBNZENpUll3MmRucWVIVUxOdVhESTQ4WWNNNGdJZ01sVVhPUnov?=
 =?utf-8?B?dE1RMnRyeVVGVit5b3o3bWJOMU5VaWF1cUROVlVaRzN0YTR1dkNoL0o4VDQz?=
 =?utf-8?B?NkY2eGJLd1RvY3oxUFE1RzJiZ3VOOERJTTk0Tm9MZzVKWjJMdWpmL2s3MzZh?=
 =?utf-8?B?NitFYUEzcFFJU1BvL2FLaWpMRVI0SzFpeURGeWttQTd1K3N5Kzd2cUtMUjFy?=
 =?utf-8?Q?wXP8dvZFtPTQBAY1calkdBgkkakZEs=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?eWRCZXo0Z29KOGQwWE16LzJLeERoQTdjSE45M2Jid1o4ZkNoUWpjVGMxYXAv?=
 =?utf-8?B?VnBmUW5HOWlYNDM2cUVyaTNYYTVWdzNZak5LM2R0RGRFSzNzamNrUDl3SVpi?=
 =?utf-8?B?NzNYejB6OTNiS2hmbzFDOTh4ZmJGakJwWmRiZXM5cEhGMHAxbE5aclJId0Fq?=
 =?utf-8?B?M0dVRlJtV0VHcVhGV0NRZ29kaFVINjg0ck1Ob05tUUlkTGJ0SlZGMFNTelpB?=
 =?utf-8?B?dldYeHZ2eUhoQllTQVg4WGJycU1QM1E2bzNRUjBDVXE0NlByRnBFSUJHM1ha?=
 =?utf-8?B?TVRWcUdJWVpJMTc0Z2xZTUNqWnRPYzJRRFBVcmQzUFlTdVBzNjhyaWorUDF2?=
 =?utf-8?B?aEtibGh4dmRQTEFJL0hYYTl2a29jUVJabHF2UnVrR1hlbHBIcTZtaVYrM2J4?=
 =?utf-8?B?RmFNY3VxQlBvb0NkMGNZS01tV20rMVR1NFIzVGRpRVF2b3lSWUZBaEhuMG5Z?=
 =?utf-8?B?V1lNcllFZkVtYTNKNkg1Zy9OQytIZys5TVU2OStJaTVyb1JjUkRnQkxJWG5P?=
 =?utf-8?B?TnBPdThQdDVDTkJkcXN2a1NJVkVlVmdhbG5tMmdUcXN2WS9kVUdmaXpwUUp6?=
 =?utf-8?B?QmFBZGcrVjdBMS9Ga29sYU1RV0xBeEpDa0FiYWczVHVyWTlHQlJNRFlxQURF?=
 =?utf-8?B?MVNDY1Erdy9najBEVnVRQTJoeTU3MXoyNDBENSt6MWdZaGp2cjBHME1vYm9W?=
 =?utf-8?B?TVM1Ni9VajJ0VnhQcWk5YWFvVElZOSsybmJHckhBcEdZYllJODlLK0tYQmhj?=
 =?utf-8?B?aDBReDJhMUxSY1dXbGswWU45cE1BUHhwYmNhOGJTak5VbVRLTC8vTERUWGdD?=
 =?utf-8?B?RUVaT2laNEwvVGprNS9pSytvU0prdjJWZE9WQjFqWXFKaFQxVmVseVpyY0xU?=
 =?utf-8?B?OFJNeFdyanVGWm9jMWRscE95SHR2YTJBaVoyQVBYOEpTbVYwa1hrNzZaTjdJ?=
 =?utf-8?B?bWFJY0xPZ0JSRkU0M3ZuTklTWkI0ZklWMEZRVHVTN1BEZFpIUFdOdUthMzlv?=
 =?utf-8?B?L1BVR0UwOUw0Y29iR05HSnpHbjVMVUIwbGxBQ1M4WXNCNUxSWm9odjFGV2k2?=
 =?utf-8?B?TGdhSVE3RXVDR3RKYXFDeXF3cFBjdU1VRnFNWll3dSt4cWYzRkROdGFiN3h6?=
 =?utf-8?B?V0g5dis4bG9VVUZJZFpzN3JGZzdCb3BKN0ZXYWdwTm9kUG8vcUtwOUVzVVMx?=
 =?utf-8?B?ekhjT0dYSUJUMjcyYzl6eitCUVU2U01vdUdDMVpITEhId3RDUEZZVHdvdkRo?=
 =?utf-8?B?SlZsY1Rtb1lPbVVSTG8wRnErQXNxUGhUOGdnTTJnUnJxUURHTWl1a0hSSmZC?=
 =?utf-8?B?bmZJRjNySm4rRHA3enNFQldqdVJ0ckc2V0lKS1pGbk9XN0lDM3gwbUNWd25T?=
 =?utf-8?B?MHdCUVBWTHNSTXh4Rmtwd1d6VnBSQVpWS3FMYStDbVFTQWl5YTN3T3Zya2NW?=
 =?utf-8?B?cXpEeThzcE5HeFVxb3Jtc0xYL0VuVkE3UU9MeFBsaC9BNVJlMUQ1Q3lENEpJ?=
 =?utf-8?B?akd6dWEvNG5SN3c1N085RlplekNSdXJZMHJ0eWhNcENIeU1YWFZoZjJsd2Jp?=
 =?utf-8?B?S3QyV2Nocm5HbDlzb0VYalI2eTBGZzZJc1FxeE81aDFVa1JXbzJlNEdZTFZt?=
 =?utf-8?B?MWtwKzFxTHVBckxaNEttaDlENXkxRi93YU11VFdDNUFTbXZuSEozSkpjcmVs?=
 =?utf-8?B?SUxvTk9XQmZHbDlWN1poT0MrbWp5VjBvWHluT0J0dmR0R2EyektRSGl5eEZZ?=
 =?utf-8?B?U09uSmRTaEtsWU1VYUkxMDhiYlZuUnhSVDcyeXVVeGpNQytnMVhtME43ZCt5?=
 =?utf-8?B?NzY1UkxmR2VqWG9KZ2NxL1NJY2lIU2xlblRNY1FMbXFtbk5HYk5TTjRJSG5V?=
 =?utf-8?B?MUg4c01SL1MxT1VYbHUvZENtNDdVQ3M1cEU1OE9sNThXaU9KdkJwS1BIbkY5?=
 =?utf-8?B?czlibkJueUpmY01qcUViMW5NVC9ZZ0dBMlY1aVpIN2dXZDA0b3BxWDNiNXR4?=
 =?utf-8?B?RG5jbnQ4bEdZdmpNZWNSVnM5NUplNWM0WERKK0ZNVzJlTFdGYkxYR0JVeXk0?=
 =?utf-8?B?eWFUYmg5TDV2Tkw1R1JqamxUSUcreW8ra3B6a3NTUFNUcVVOeDc2RDcyU3lr?=
 =?utf-8?Q?rtg4gK5ofYE/Z5I3zXHEbFC9A?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f89a7e10-f739-417d-52b4-08ddb8eb9188
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 22:06:45.6424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B3fKFyIZuI2D0V4LIUyNdBxEpSTl1vVEL7AIbnfi0xCKBqgEoPNYOiwQJAYS/MG8d5WNMVDr6MKDR7qWEhv8uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8843

imx93-blk-ctrl is miscellaneous devices, which include reset, clock, MIPI
CSI2 PHY and DSI's miscellaneous logic. Call of_platform_populate() to
probe child nodes.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/pmdomain/imx/imx93-blk-ctrl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/imx/imx93-blk-ctrl.c b/drivers/pmdomain/imx/imx93-blk-ctrl.c
index 0e2ba8ec55d75..ba2dd8bd143d1 100644
--- a/drivers/pmdomain/imx/imx93-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx93-blk-ctrl.c
@@ -7,6 +7,7 @@
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
@@ -297,7 +298,7 @@ static int imx93_blk_ctrl_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(dev, bc);
 
-	return 0;
+	return of_platform_populate(dev->of_node, NULL, NULL, dev);
 
 cleanup_pds:
 	for (i--; i >= 0; i--)

-- 
2.34.1


