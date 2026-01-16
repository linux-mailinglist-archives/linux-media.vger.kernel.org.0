Return-Path: <linux-media+bounces-50913-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CEBD3380D
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 17:30:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B8A88303271E
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 16:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A95AD394478;
	Fri, 16 Jan 2026 16:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iYagpEg0"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011000.outbound.protection.outlook.com [52.101.70.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FCA33A03F;
	Fri, 16 Jan 2026 16:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768580979; cv=fail; b=sjHhO1UF0y9+H9nLXmGYGckYNaTl9FaZsuMEBTmRj0D515ekvjCH3wyHB1+QIEuzh5Lz8hZM6dSELqQFLPiIkQJ4fsyrXzVu+riddZiZFHNi6ybc1VPZuVDNhpRmlMeXHCHsegQgreKomFaRC2G38EJqM34trCfCUHH0Goka9QQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768580979; c=relaxed/simple;
	bh=zzsAy4almkpn4t4gIstw07UOzol6/iryUWqTtO3aa/Y=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=b/i4DYYAu3I/iaqDRkkjlYpI7oAvP5Ke5W6fgh2pucJZCYbDPgyWlxtTiVY4R8ieBVQsH3XBk/N6brMbp5g28uCof6nTbegVGv+F2z2TQ1au53PEHsW20CKkCqiKLGgBtxFWs4h9VLHsonmXA0EHp5mYETDGE9LpfqD3c9bMeag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iYagpEg0; arc=fail smtp.client-ip=52.101.70.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IcSE04xwtqScNEMw2M42hONnURfEXFFZ/MBO+CsKtQVj+ftLMUfbKiMoRu2Y3gWqjnlvM9p+CNCIQ2QCEx+LtRfpX4B3sMSj8BeKnKfkD3DJFmopRuwbS5KfN4QsIQmjvPCyonSCZ4NHM8sGw23nGrrIIsS71fKJoRTPVXB7yfuYCTxMjoqu7Bsc70dTPDsc1iV+XCLSCyqN8RPY93c/ddXnOs2+rmFgD/QWrvwngVVmUtHXJqPy+8T3Ou/xsFVSQ9sL39c35qbOB/f7Op9+8yP2AUcqALtdtDjtbi4+hcabl61nRTaD35SZZAFqc0c1/jUTcMb9edQ/mq+8tgwEKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRz7tVgLRHwxIiIht0vYHLKnIcJIeQzwuEoa3Hycxv8=;
 b=wssBXq20NQsJu0jDFoVT7Wrgiwks7EyNffY7PINBVMmqlh/c+X4hVNGWZfkD9e3j8gXMD2n5f9cyKORczMlaNrB5E2A5dFTap4VoInLGRUU8YJyaN4kKrqJu88yFgt+DOJQnx+qn/I7XkdJBW2ikasYJB1Jm8B7NttpiidB0HGY+y9jsvkNzH9PV97SYdRUdnJjWX19IuOlU1PxlIM3ceWd/zQiQneWyIltxAkC3CtC33mE5hr+X6S2WpEs+q9mO7oPRie/1zK2zilVzfmXChzvt1rBgY25lhqBRau6cHuqdR3HmsAJq+MUzY6Iebiw4XAU+GcZ+1O+kECoZggMcWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PRz7tVgLRHwxIiIht0vYHLKnIcJIeQzwuEoa3Hycxv8=;
 b=iYagpEg0yeoXLQdqWvowj5K+M2XZk7oR2ElsaOLgB8F3pVtpw9x1NZUsnny+SAmgGcz+i7m2MNSP1tuxZmW6yGlnt0QeUpNYAKLkF/oCRGzeBT8V6g2runQsRUmdp/Vd5UFi3Ylf/MiSZ31Fspfn+F8pO/gWig+ZLoN822/sikmXi01z1Shtj37r+fCIDToJOyq82aMJpOXWn68BgXk9CDmOLUDC8Hq41hvCGVEzfrtpz5fV4a5RH3g0iCUUchg5nQYeu/Z0GHlERU8cMuWe7hP1d5o4EtAt9oE8vHLVjLk+BrouJUZ6YozzSkyYw6tYyG5XUS6PyFx7SvpnuWCqpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DU4PR04MB11433.eurprd04.prod.outlook.com (2603:10a6:10:5d7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 16:29:34 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Fri, 16 Jan 2026
 16:29:34 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v4 0/4] media: platform: nxp: Trivial cleanup pathces
Date: Fri, 16 Jan 2026 11:29:18 -0500
Message-Id: <20260116-cam_cleanup-v4-0-29ce01640443@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF5namkC/1XM3Q6CIACG4VtxHEfjRxE66j5aa8hPsiU6KGZz3
 nvoiXH4fdvzLiCa4EwEl2oBwSQX3ejzqE8VUL30TwOdzhsQRBrEUQuVHB7qZaT/TLBjWqBOCi0
 VBVlMwVg377XbPe/exfcYvns84e3dOxjjspMwRJApXRPeEt214urn6azGAWyVRP6lKCXJUtuWE
 qU4tRaXkh6S4KaUNEvJsBANYtxSfsh1XX/0GETQGAEAAA==
X-Change-ID: 20250807-cam_cleanup-b6d90ba9dac3
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger-Novakovic <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768580970; l=1503;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=zzsAy4almkpn4t4gIstw07UOzol6/iryUWqTtO3aa/Y=;
 b=h/zhYjuAIX/v2xdtCyYeaXBvi8qjzNs6QztPK7j4lMy/Qwu3dMTzTfUXcEbGggwn9YkH3I2so
 O2RVA0BpJU4DkQuSvEtDdpZBEZ7ten8jlU6ekyyggAXEKAJCgXLcgxC
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR05CA0127.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::12) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DU4PR04MB11433:EE_
X-MS-Office365-Filtering-Correlation-Id: 88965f84-638c-463c-e9ad-08de551c6ef5
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|52116014|7416014|366016|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?K25wa0tjeVBZWGJDek13RUt1VHN0QVpTdWgvdjV4b05MSS8wKzcwN0tBd0ZS?=
 =?utf-8?B?VEFHUWgwWjVmb1NLRm91Y3VlajBhYlFrc1ZCcFE4YWUyYXUvWTl3WXYvZDc2?=
 =?utf-8?B?aU82UUg1QWVQYnVSYU5zMTMwMnY2c21Xd21WNy8xQWE1cEhuNU1zY1lqbUFj?=
 =?utf-8?B?K0lyVTZ6YlFBWWZzVXNVUXNLMTdpYTlRMFFUb3RTSDBlQ3UxTWV5amFuaHY3?=
 =?utf-8?B?eEY2dERtOU9remNsTDlLMmM4Uk5CcythSmlYYi9idURlZmU2QnJKNVU0NTVW?=
 =?utf-8?B?cTRIeUZDUUpYQTQ2ZlJLaVVVekU3dnlzY0NmcHhIUzhBLytrU0h6YVNLOWpD?=
 =?utf-8?B?aVArNGk4RFp6c052Snd2amY1V3lSWEdjRlIrYlZrOUU4OXV3UU5BR0hSOS9y?=
 =?utf-8?B?alJzSktDa3JGSWJTb0pZQkVmbm5KQmM3N2FJb1F3SHhuVHUyd3F2WjRQNW0z?=
 =?utf-8?B?TXJJMkpyU05PQ0RENG96L3pxUHkzaFZCaG52SDlVcVFkTVREcGNXdE5HM1dU?=
 =?utf-8?B?VFI0am9BWENsVE5zQXpNamhJSUZVN2UrZmN2QS9zR0ZnNUxpNjQ2dlRhZDVR?=
 =?utf-8?B?ZVZKemV1NnNKZW5JT0dYODR5OGlkYk5YckdVVGV3UUIvUlVaOFNuVHJqM1R3?=
 =?utf-8?B?dmY5NFVOT3BzWTRqRmtQOFpFS3RyN1d0VHVaZENkMVR0aFo5M1RVRnRLMXEw?=
 =?utf-8?B?cVZvaFdvWU9MYXBrT3hhUmNoSy80N3JHTHFHNlRnWUlsQmUxL2JENys3T09P?=
 =?utf-8?B?UUNRUnlxR0NLQ1hCY3VodGtqamlVaDlSM21qMFp0RzRLS3Q5NXN1WlV6Njk1?=
 =?utf-8?B?TnBPN2RPU01NeExDNHdtdGhuZldyL2FTdkFIVFVKTlNjbmU1RTIzN2kvOHIx?=
 =?utf-8?B?bzJkWTZVR25GUGVCOE9zeFpFcHErbXVVVmJhbHo0YTllYjNKc1czdGdsam5m?=
 =?utf-8?B?d1ZtVFBjMnR2d2pCdFlLR2tvR2xmOEhpNGg4UGlVNzdJVDdVL0M5U2NjZXdX?=
 =?utf-8?B?aGgxckR3UU1DcEc0eFRmLzhmMytZNWFsQk53WmxmLzFldTNIclZZMTJjNGhR?=
 =?utf-8?B?eGdhbVpwVnFZUDNYTURlTURJTXBlTjBINFR5NFBENEM4bmdTcHEyQW1CQVVj?=
 =?utf-8?B?cE83SlYxdGczMG50U0VBVEdkejlCY0duR21rSjh5cS9oMlgreVNnRENxdzFK?=
 =?utf-8?B?S0FxblJzUVJRTEdGU1NjYjV5QzhCR0RJS3J2bitnT2dwaTFOTG9ZVTl3RE5i?=
 =?utf-8?B?L1VJWE1EcElDbGc5dGxjVDJ5OVNKa1IvazlRMytuOTNuWXViT2l5MWNwejZy?=
 =?utf-8?B?WlpnTlhyTEdKVXVyR3ZYZEpWNFUxc3dTbk9rWG4rOU5BNm1RQW5CM2lhSTVO?=
 =?utf-8?B?UVZwVFFCanQxb2tHWnZEc3o0NXZSbnVEUlhBNFpRT250N0pVeVlRblRpVktO?=
 =?utf-8?B?aVh4Wnd2aUd2ajdkMnhaS0d0YnR6UWVoTXluQ0ZoKzNWMXJ5TjRrYldmclBx?=
 =?utf-8?B?Z25uVElJU1NWZlNYQzd6d2FDaUp5eDZ5YjZrenpXRGRpWFNEYThhMDZjNjJQ?=
 =?utf-8?B?eVRZSGU2cUJwNHEyVDdMU05pRnRFN1hOZDA4RVlORE1rUHR0bHlVS2FGYzNz?=
 =?utf-8?B?dXNLSVpaNHlEQWhlalkvSHRrWVNsQ3BJU1hWYzR0TWExZFljWThQYURLZ29Y?=
 =?utf-8?B?T1M1UjVLSEh6eGp1OS9zekJsTHlyTlFUS2ZTVU9scjdVWmd2cGlaZThUQnZo?=
 =?utf-8?B?OGdSUW0vV3dNREY1T0lmME9tSThUbHRJVFhyeDlHZGFoYnJUdUpXM2d3U1l6?=
 =?utf-8?B?RlV5QVJUeHVYbFdIYnRtSFAzNmkyVkw2Y2tKbzFTZzFlQzRZMk0vTVdmSVZt?=
 =?utf-8?B?bmtZdXgrVzN4a3liTFBGbTl1SlNpSWxIUUdzbHJuTWRhbXRnTXpkS3pxTEVL?=
 =?utf-8?B?VHFzeC9Sc3FUdE5PdW11VTBHZ3J2WVBENUo2OUxiWml1Q3YyQ3p1M09IVmtT?=
 =?utf-8?B?djZMSEtuVGtscVNKY2pYd0dqNTZYL056bHBiNC9HVkdFTlhSMWVPbHNGSnRH?=
 =?utf-8?B?OVdYWWZoQVpBRDViNHJIT3N2QjRwMUw1cHZOWjU1L1dSK3Y0YUtJOFFZVjln?=
 =?utf-8?B?aE1RMVllU3lEWEordGhaUnlaWGU2RVlvc2dJVXNLOStmUkZwcUwzTFpnWHd0?=
 =?utf-8?Q?q/ODlzVG7HnbVgB0RJya8IN9XnnzVRluhdMTmHoDw5+l?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(7416014)(366016)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?VlpNOVZMdXZBbjF6eitEL2REOXZNcWJ1OVN0RGpmMlVwamh6bm9qVnRqQUps?=
 =?utf-8?B?aHgzRW9JS1o2c3MxRUlNR3NRb3g3TnZPOUo2QkV4ZDh0aVZ5SldFb2VudjVz?=
 =?utf-8?B?ZWp4NzFDVk9NbmlxdTRoVERqNXdCYm1HbnJsTVFvUGl3OUJtanl3azF1RTg3?=
 =?utf-8?B?WnpNVTFVRGNLd1JMOFcwczhCQzVsNk0rZmFzZjZPQ3NoZWIwYnpoWEVraElx?=
 =?utf-8?B?VWRwakd4S0dPWGlVY1BBRFlVdnE4YlFlTTU3b2hiU1NvTzJEUC9tUzRsZDJx?=
 =?utf-8?B?RjBKeFFibWx2SFZCN0pvTlc1M29kbUhSKzV5dzI1dzVLbm9FSTVYM0ZUMm1j?=
 =?utf-8?B?V1oxdS9IODNGc3VoS0FVYVV1eHNjQUhoTm5MRlY2cC9xNVdKSGVLemFIdmtl?=
 =?utf-8?B?d1lXbDFNL084RlVRZDF2cmRMNy92MjFsZWRlbzM5Z1dab3ZhblphRHN3TjN2?=
 =?utf-8?B?NUNEUWl4ZkRPOThoM1VOMGZBc29FS1pTWkFyanY3bFQ1Rkg2T202L3owWUp0?=
 =?utf-8?B?ckJKWElJNnFhNkV3cmtVYXlnblUzbTg2YmVWNjRHRjJLSGcrT2Fwb3hXRVVG?=
 =?utf-8?B?SHo3a0o4QnpkWGNmMG1FYVJLUWVjVWJVVXhDeHlhbXdacWJKdkhrUWUvalE4?=
 =?utf-8?B?ck9Jd29tZE1tQzc5emNWQmxJYWM2c0N3ZHpHWTgzRTNjN3NVT1dqeGdYVzZ5?=
 =?utf-8?B?YTMyQ25LNkJFMnZHck45bkFGdmlpeEI1NnRuVi9BRkdIZTdtdUxoeXBlaWg3?=
 =?utf-8?B?UjAweDAremY5VktmMkFxazIwVmw4R1o2MEdpcmgwNWRsU0VmYk8xODJSTVFz?=
 =?utf-8?B?eHZnUDdYc24yL0ZYQnpnc2U2ejBZNmZsMHp5WU1weWhhQWJHWlQ4Vi9zbGlt?=
 =?utf-8?B?K1JINDZFeFdWTzNKUzhKYmh0ZVlzS0k5RFBSZmhTSy91UXZCZE5VNEZXRlNW?=
 =?utf-8?B?NVJKZFRDUzBpNUszUkNBOXo4bVVDVFBQUEovU2RrRWVmUThyeFF4MUJFeGVG?=
 =?utf-8?B?eDhETUlUMGg1MEdQZy9mWi9xRk9VM3VaQ0ZMMUdkcHYwK2pSU1lyZ3RGd3Fi?=
 =?utf-8?B?OEZmZE41cTVkVTJaVktDeURiZWJZRUhYdW9kVU9zY2swMnBkbTVlbnp5M2hM?=
 =?utf-8?B?ZllaR1IzZmlSTXJjK2dKVmxXRHUzMnRJNHAxVGp4VnpjdXlrN3hkcG43YUNx?=
 =?utf-8?B?cmJNTlNFMll4OUQwa3hWRFZoWUZvWjRPTCtqaWtHNHQvQjFiakZCc0NidnFX?=
 =?utf-8?B?UExOUTJ1MnV4eXhUeTF3em14dU56dVVxM050NWJxc1BKMXJjVVM3WEF0djls?=
 =?utf-8?B?VERRZGtQd1UremFaWUlwcUJDSXMvYXpubFJEbDBIV2lrT2U1SllPWDFra2pC?=
 =?utf-8?B?UWM0SERPMmhjMGJLRGN5TU5Oa0NHeWJTMXdNSXN6K0l0RHF4RmVBQXhJSmpN?=
 =?utf-8?B?Yyt6bXpjNnYyWURQbDlDU1FGMTZPK3JqMjBHRm1KdHRoK3gyMTJvQXg4TllI?=
 =?utf-8?B?dlhZaCtCZkVYa21LRCtCZGkrcDRMNER3SkoyWDcwSUE0RWtONW5MTlYyR3NX?=
 =?utf-8?B?aFArUWNnN05yQzlBM1h0TUt4OWNyTHNZbmtOOWNZcUJLeFNyVm5uZEFTb0RK?=
 =?utf-8?B?QnQ4dTY3b254SU1pVCtiRW0vQ24rTEZ3a1ovTGt6b3ZvaURYVks2SFI2Z2g2?=
 =?utf-8?B?OUUyVGJBRGE0VHN4UzhaRzJoa2dZZ0N2ZTRzcEdVL2RBakpQQ0VKSThIOStK?=
 =?utf-8?B?ZTdVYUpwZHM1bm5RL2RQZUxSWjhlc3ZVenlkTCtobGk4MTY2dGtpNHFZS2N4?=
 =?utf-8?B?QTBoK2RxcEQzTGEvaGxoRXpoUWdCM3RxZytrT21iclQzckVVZW1nRXZZMklj?=
 =?utf-8?B?NlhqT2V2RFczZjlUZnFOOTFtZk1NRjJNM3pTUStHWC92M2FSRDNQaGxWUnB3?=
 =?utf-8?B?elYwRi93WTZ4TGxvWHdCelgxVlhSeCs4cGNIU3JFanRKRUc4SkwyMlcyNjFh?=
 =?utf-8?B?QzhYU3NoaWU4VmllbndPWTBwM2MzNDc4c1FkWGFxYjFXS2FZaDIzZVpSU1kw?=
 =?utf-8?B?VjY2dk00NnZjMTNYdEFjZjJUZXRBLzdNRERoVHE1UE9Zdis0UUphK1pnMy9r?=
 =?utf-8?B?ajJmck1ES0RLbms1OXltK0dLV0FxWkhJQjVYRzNKa3V2bWh3UU02RWhwd21N?=
 =?utf-8?B?Zlg1Ui93SlFaMWFTT0FWKzFxQy9VT0ZqVVpZN0JpSW1ibGE2bjlrdDhvblN6?=
 =?utf-8?B?YTNuZnNDV1NkREl2b0MySDRlVXFVV2ZXRnZtS2RsM2wyNUUyQURBSUx6OUZZ?=
 =?utf-8?Q?Uabo+sgzI1eTYuDfe1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88965f84-638c-463c-e9ad-08de551c6ef5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 16:29:34.3721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cMTL75BEY+ZsnYJ7aJrUmOA69zJhxC/qFDIoQLnvG/Dy45ULGGCKyMcd1OE2sAiuWhl1RArVgqk9KdKxvhw+rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11433

Some trivial patch to reduce goto at probe functions.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v4:
- collect alex's review tag
- fix grammer in error message
- Link to v3: https://lore.kernel.org/r/20251215-cam_cleanup-v3-0-a61995068f38@nxp.com

Changes in v3:
- rebase to v6.19-rc1
- avoid use __free() == NULL according to cleanup.h
- Link to v2: https://lore.kernel.org/r/20251119-cam_cleanup-v2-0-df732cc83ff1@nxp.com

Changes in v2:
- add new patch media: nxp: Add dev_err_probe() to all error paths in *async_register() helpers
- detail change see each patch's change log.
- Link to v1: https://lore.kernel.org/r/20251117-cam_cleanup-v1-0-6cd42872db79@nxp.com

---
Frank Li (4):
      media: nxp: use dev_err_probe() to simplify code
      media: nxp: imx8-isi: use devm_pm_runtime_enable() to simplify code
      media: nxp: use cleanup  __free(fwnode_handle) simplify code
      media: nxp: Add dev_err_probe() to all error paths in *async_register() helpers

 drivers/media/platform/nxp/imx-mipi-csis.c         | 54 +++++++--------
 drivers/media/platform/nxp/imx7-media-csi.c        | 14 ++--
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 16 ++---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c      | 77 ++++++++++------------
 4 files changed, 71 insertions(+), 90 deletions(-)
---
base-commit: 49cc7b5d0dee386c44b51a90eb49037b2a1f5b2e
change-id: 20250807-cam_cleanup-b6d90ba9dac3

Best regards,
--
Frank Li <Frank.Li@nxp.com>


