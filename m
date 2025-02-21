Return-Path: <linux-media+bounces-26632-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE33A3FDD6
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 18:50:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAAB1704308
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 17:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0818F250BFC;
	Fri, 21 Feb 2025 17:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AwkHHf9K"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2067.outbound.protection.outlook.com [40.107.249.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C42B2512E2;
	Fri, 21 Feb 2025 17:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740160125; cv=fail; b=rMkVs2KTehXcRH/UjHrFcl5A8wiWfG7YZFiJRcVzVyMBPQjOfJ3f51WXQ5ndXAes7VSY9xZ7CI4LgVbjROkdVKSHYjaXnKFczfR6SXVQTmfMQlnbW8IOCiAOwGKpLLHPcOgX9/fOK4RsVzDHQ5xJ4cKlyRXxPq7hRsnjRBneoJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740160125; c=relaxed/simple;
	bh=p2JwntAUPGczKG/jHlRMacqU4jQGoNhsnRbBZY6GGkA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=kVffPA/Y0obf95XWi5smmtzYkdgcfy+GcByehloJ0bIOTkHxzP+2u180Ny1cXM2zvYPtvwAyndgl4JU53Dskh1MV2/wQ8ltG/Q04aGw4fopahxK6AtSTNj5c5irvkOPZfj7ZSNtv0SPx9TYn4p/+C1SKi0o1uCqmUwUdAmuDvNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AwkHHf9K; arc=fail smtp.client-ip=40.107.249.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iik76ZI/Y7ZNvx3DoxKm4246NxtHrB4YMhKyuCX/YFXiWgp4sxXYPOJcw5inPWW+NzFpvhfo9k72HaFwM6Tjid8Tt4IdQFLN5k6JL2UlMMu50stkvYOsXGLi/+31i4j3UcITdumTnqMXgDuHQqwri4ygg489O49e6b4eEUTj6stsr0CDjRW2IQt6Gi+VkCrvyoVoxKM6KnuY50TAo9MsWvRDbB+gXDf9vZALlTe7YZLWUmFNCcE/C0mVoaUNmcpkOOcZrQWSGA2nvpM+9b5z+S4P5oiHGam//89Mm2Xa1wGO5o+yO3fFq8S3uJ4CkOhsvwdu1npNrOKYwVP2E4XUwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DxW1+xNHIpvfGbibSzp3TFLArZLN+dzOzedEhZb6seQ=;
 b=Z9RPvfj2rARXZtBDtWoIW0fyjG5Gswu24+MejsHW9tV+fcTdd1AEMkkzYi2St2guzR75JidJ09+5+eorBQTrjFg7GTkLzJ4TeNeDBMlRBm02kwT+NnjUUEHNsiQW927m16g36P3YQ7zMJZPqpYppx75I2mUS/qTU4Yzz9OuU/Jk+Q6oOPwxSBy/bDaV1nBh+YY53rpzDIn61sXLh0oRfJuoPCtCs3kaN+nmK9btpg4mpQNiyKp+yjm/rqFaeYdmfJPG1dSeH14Vt4xWnWRQleuNLoWW/cUsc94yQ9xdtWrtTcCmPCxS2BnREEnAupTOm/PiOJhBT3JW/b3AagyP1Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DxW1+xNHIpvfGbibSzp3TFLArZLN+dzOzedEhZb6seQ=;
 b=AwkHHf9KqEGLdeI2m38MtZp5kGHb56LHySvi4FI+KYYSSOP82YIik52nBw39EJSA8yHO7rX2DjHMDWkDfZIFAY6+SOvcl0pnfOqeYtBYPSeQKqrZrYV4DqJYs3fXI8TglkVVR4BtVHQI7vL06yS954oBXJH6LbOHS5iZPqkIknJbR5rnPf/gFPHZmvm/Nm33jci7fRo2wvvmC1HfEEjR+vSQoUlkv+DidhHs0zsqWe0EsJB7fsr/sR+MNEguoHzcbJWROAFwzYNXuN7PrSguvvG0F8weKFiJGFuzylqj4xVrvEImmDRLrZDKDdW9MXoYg6VEzeR3H4M2tnE+yet4Iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM8PR04MB7762.eurprd04.prod.outlook.com (2603:10a6:20b:241::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Fri, 21 Feb
 2025 17:48:40 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 17:48:40 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 21 Feb 2025 12:48:19 -0500
Subject: [PATCH 2/2] arm64: dts: imx95: add jpeg encode and decode nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-95_jpeg-v1-2-053decdb452c@nxp.com>
References: <20250221-95_jpeg-v1-0-053decdb452c@nxp.com>
In-Reply-To: <20250221-95_jpeg-v1-0-053decdb452c@nxp.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Ming Qian <ming.qian@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740160108; l=2743;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=p2JwntAUPGczKG/jHlRMacqU4jQGoNhsnRbBZY6GGkA=;
 b=ZX2wd8e52Yvxp/S7RITp4mOxaoT7lD1kb6dAuXUWLbI7h0xV/1pffxB80jkY52ceWqb9PA1y8
 QdU+MNlFj5TCC7UL4rscShQlVPIO4q+Z7du/Waqe+E/zHJ0jVqAJ0oV
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR13CA0001.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::6) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM8PR04MB7762:EE_
X-MS-Office365-Filtering-Correlation-Id: 58a46d75-3371-45e3-d743-08dd529ff9c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b0djcnY1Q3pzQTJoSkJuWnZibXh0WGFqNzNrbGxnblA0YUJxcVEzVUZGalFF?=
 =?utf-8?B?aTZ4dWd3dmhoRnZaYTRDdFFLeURjT05EMTBIZWY1Q0RBd1FqQ3ZGbnRLWEox?=
 =?utf-8?B?OTU2SFNqSEtkbzNLbTRSQllyTk91Nzl6c2gxTWtJMGU3NDFXUGlyRTZHQXFX?=
 =?utf-8?B?Q0dIYTFzZ3FzRjNPaUlDT2wycnBwVk8zMy90YytyVUNWa29UU2Ira1NheHNo?=
 =?utf-8?B?QkZLSmxPM080MURFcTJaS3p0TStrNzkzSlkyYmpGVzhoNUxYK09PVWs2R244?=
 =?utf-8?B?NlcwM1cyTVl1WFF1Q2xiOWRvSkpmd1FML0xNdDc4ZnF6d2JPcnU0MDh6Mk9i?=
 =?utf-8?B?dWw0bm1rcEo5c0dZS2VYZmNIMFl3ekE2Q0VEZzhkMXUvc09sQ3BvOUJ0Skdr?=
 =?utf-8?B?UmM1UTVsRGljZFF4VjBySmRKT1dlUGdyUDVIdnBpVDFkS2Z5bzhHT2U5VkhF?=
 =?utf-8?B?TjFaTmwyWkllTTZJTEZaTi8xcUdaLzdjeUZmaEw0bTRjakNxRnJSTERiYWFR?=
 =?utf-8?B?dzFXb3lPeDZCUzhpT0dXRGtCd2lzNkpPNncycUxZMWZURXhNNTZSaXJiZFZI?=
 =?utf-8?B?Qmh6YVI1UUNsK3p2NFgrWVF3cXFDMnl3TG4yY3Q2eWYxZ3BUNy9tQ2pHNFV1?=
 =?utf-8?B?T1pQUkoyZS9xR1UzVTZuOW50Q3BpbDJHMXBRam56OTdkRnhhVTdjTXh3cVFn?=
 =?utf-8?B?TG1sQk15U1NwZWwzWnJEV0ppNlBBZTZIdmtKOFRBanJvejU4MDRpRUhGaklQ?=
 =?utf-8?B?L3BNRkR6UlVRQXBXYXZIYStOWVVFejRlbXM3aGpkd2xDcDFNU0lpK1NteFR3?=
 =?utf-8?B?UUR4d2VvSEQ5TnlkeFV0RTV1MGx0Z0gvOWVmVXNVRVlZS0lzUEtEMnVQTnpz?=
 =?utf-8?B?TnlDa2ZSeUJnNWlYTjNMN1JmMWNreDZVQ1FoeGx2c0ZpWGxVODVKaytlKy9E?=
 =?utf-8?B?a3hlR21jM0RQZDB5aGVWNEZRVkxjLzVPLytMQUx6dTUvYjg0L2NTeTNMU3BQ?=
 =?utf-8?B?N2puUWJFNm9tVCtQV3BxeWhrSXJmOGZpZWFlTGFlejI5TXV2OHY0dUk5OEFU?=
 =?utf-8?B?MW9sckthbFhpelFxbWkrTy9lRkpFL3VEVmJQU3puQXMwTmFmU09SS3NXTnVk?=
 =?utf-8?B?K1RaTDNUaGVEbnhvUXBJWHRvdlhBSXlqTERkS1Z6cVo4N09mWVRRZ29IQ0px?=
 =?utf-8?B?bzBidUR1b09RVzhvOXBQWUMxUTFXZ05ibkV3K0JDR0w5VUdjcHM3ckh5b1dN?=
 =?utf-8?B?eDRvQ0Z4VDh6VGhkeEFMdTBoYlU0b3NPNUV5Yk1FTG5xTHR3SzlaSzFEdisz?=
 =?utf-8?B?SUZqSDFWZHFtZ0d0bFprU3RFK3ZDTzhUa205Z0ViY1N2R3c5UW1jODcyVWd2?=
 =?utf-8?B?cWtTcG9SZWlJVFFHYTI0MGVzYXE2VXVKMUhwbG9Cc3RZMzB3MGNid3lMNjBV?=
 =?utf-8?B?QVNoZEUzL1QxUkREbFBtODdZbDlXS0hXSGNTeldFb05nZHF3QXZabXhrenlh?=
 =?utf-8?B?TTlJOGdDZUNXTWg5YTJIbXBzK2NkdlJ5Y2YwZm50MHJHUUYzUm9mbVB0cVpn?=
 =?utf-8?B?ZzdZZXNUMms1MjBPUjAyK0JKcmlObUhaYU9kaXYwc1BIc3RyZXRMNFlaWnBn?=
 =?utf-8?B?eVA3VmlnVjhIbWgrSDVyUi9TMHB5VzZwOVY4Y3JVUE1MK2N0dFpJNDRiWWp1?=
 =?utf-8?B?L2x0d1diLzdaWE5qS1UvNUt0dmV3aElzWHdsV2NBZ2U2dXhnK0JBbXREalJ2?=
 =?utf-8?B?YkdoNFVQQjF4QTJlZkdFenZkc054NHZ0R2FsYW1rTGt2VGVnT0JlWk9aelNR?=
 =?utf-8?B?SlNwZEJSa2NpczM5Ui84R0pyS0E5OVhxRHo2aE1KSWtoc1FxeHdwQmdlMTF0?=
 =?utf-8?B?UGpsSTBuL0NjV2ZJbGVOV0l5KzZVWWt1ZWF5TjMzU1lCRCtTTU1udU5JWEVF?=
 =?utf-8?Q?9GAmnBtdItg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGZLVEpHNjR1ajNubEI5YnNIVm5QaG1hYXFiU1J1c3FEUXNoMDQ3VVdwTFJx?=
 =?utf-8?B?WFNJNUc4TnZ3Tnd2dWJoQ0Y3N1J6cjlaY3Z1SGdYaERpa2ZDdFdjUjRWZTdw?=
 =?utf-8?B?elUrWVZ6WEZuT210WG5TT09SYUN5QUd2WE8yTTUvYVVhbmNrNi8yTzZueVNR?=
 =?utf-8?B?Ym8rcHZrT3VONVRTbCttdkVUVU9PNUhGVTFOaVVDbWc4dndmc2FBRHB2R1gr?=
 =?utf-8?B?TW8vUkt0REFWOWFKQk1UekJOU2lhUUZJY0M4b0ZhOFdMVU4zb0FVaEl0eWs3?=
 =?utf-8?B?eEs0Q01YNWhYd2JVak9mQTRYWkJnUnBySTVNSWNEMzF1MnlVeWRYN2RmUGxn?=
 =?utf-8?B?bUdSUTZwN1JNSGdtVE9nMVp4empkbEk1ZXA5WFU2VGVHL21teWhiRXNScWZo?=
 =?utf-8?B?L2lXUXhQMHhGcjFZbWZpcmprb3kzM1hSTWYvUEtFZHN6Y253UHFRd2MzUFVX?=
 =?utf-8?B?L0VESnhNSndqNHFGRUQ4ZU5hY2Vkcnh5aWtqWlA1TE8wOXZRWnJkRzR2QXVw?=
 =?utf-8?B?aElpVkdpSVZPUEp0TFJkTTdac004aHhnK3lEUGN2UHMwMG45Q0JOeXd1TCs3?=
 =?utf-8?B?QWthdUcxS1EvMk1PdVh4cnhrQVRVblErSUhjUzRwZGVOZXJaRFFFOTNFbms5?=
 =?utf-8?B?eDhYcVl6Q0RzWGplUnBzUjZ6WGZFL1IycUsrRitKVmFCT3J2VTRmSUNGSVdW?=
 =?utf-8?B?TmMrTk4xT3NwLzZKTm9IWldGMTA2QnpkTXJCRUUzbFZldHZnbUFadlVOaXBy?=
 =?utf-8?B?NWI5RnFVMFg3dTBhQllXS2JYNWtzcTc3YlhnVGtlanhzS0ExaTR2clU5QVl1?=
 =?utf-8?B?bVQzR3FDa0hRTFFlQVdTd01lanhMQXpySTdTb2ZaUUlJbGFENDhaTjZ2NUJ5?=
 =?utf-8?B?VUdOUWlUajZvYW9LZFNkQlpLZ05YU3ZtNlMzTU1mNmwzWmVMMWgxYTlRUFNO?=
 =?utf-8?B?QmpjdmdidDR4WG5kZzY4cElBTWlSS1FWcmpzdlkwRlBZejQyaTNqdk00MXFC?=
 =?utf-8?B?RkxSdlRiMjY2aEt3OEhxNCttTFI5YVdYblh0a3RuWktYSE9EM1oxMGdrOWZz?=
 =?utf-8?B?M0dDbjN1dGwzc3NIYm1IUjhtOG9RUklubnIxMGJ0MFh5Wnk5L0xXK2p3S2Fw?=
 =?utf-8?B?NVJieFhGbUdQUVRUd2VoVWIzMXJKdHVTby9LZDFtNmhML0M4Q1pLUFU2cEF2?=
 =?utf-8?B?SkZQbnhXbFJsLysrRnRqV3pKZ0VpS01Ucm9sMHJmNGE0T0NqUHNPRnJGbk1O?=
 =?utf-8?B?aG8yK2FQOUR1TFQrRmNkS0lvNlVrVmZ6ZVg4YmhhYW9XdzlOMG5yOS93Y20w?=
 =?utf-8?B?Y0VFQUNUUmZxb1N5M2RQN3lpYjZFWkRYZXlxbG14d2dJcGxJQlVKd3JrTmNT?=
 =?utf-8?B?YXZmK2c0UnVIRThGYThCQXBQdHlzTnJPNW9iLzJZNEtTRVJCMERVTGZTbkRx?=
 =?utf-8?B?aitWbCtqck01ZkhmUEcyeFlGQXNpMERTRkZPaHVuQ1ZwYjVMNmZqbng0cklX?=
 =?utf-8?B?U0tzQkNvZER3S0VrYmErTnhsNFZtb2lQT2JEanZZb3h4RVVWWk1CRExIU2VH?=
 =?utf-8?B?V1hzRWR0eXRCekxSclJXS3V0K0ZVTGtYTnViT3h6Q0RnMmJKS2NKWGFEMmd1?=
 =?utf-8?B?NkNPZVdIejBKcEp0SFh0WTJ5a3JpclVmMm5MSEM4T0tTM0czME5GVk1waEo3?=
 =?utf-8?B?dDZzNmZuM0hrVnB1MHhsNXYwcmlHbEFQMjFGODB0dDE1b3VEcGl0MjR1dmtn?=
 =?utf-8?B?dkQydHRudGRkVkpYcUFGUVNadlBLWGlKdFY4VzJldUlnZXBUV2RUSm9GZ0wz?=
 =?utf-8?B?NFRRaURNV2tIVUhvSWRkMEpzaW5kN2l1aFRubVMrb08rME45eHdtM1hpelJT?=
 =?utf-8?B?Yllna0JPU09XaXNFdDZ1U25sSk9BOWdtQnBwTXk4VnJwcmFXeldrdW9VS0Vu?=
 =?utf-8?B?ZjM5bERPelNjdjVhVElDd3U5VEFTaDRvNlhTdGRvWUNNVXdWYjloZmNSbGt1?=
 =?utf-8?B?SlNhKzJYa0ZQNWhFT0ZCR2hDMFF2ZTROWW9Zb3M2MCtCWE9pc2pBcENjY0hN?=
 =?utf-8?B?cTlpKzNlSTg2L3V4S1lZUlpHL3l2blNLKzI1WG81anExSGNaQ2xOVC9JMGZP?=
 =?utf-8?Q?kgQmhA+UaJvyTqoXsHfdWgnWx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58a46d75-3371-45e3-d743-08dd529ff9c6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 17:48:40.1252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 53zlXO/ezN7CPgIfvoFm4FbzJVkIaURZ54QhkgoJHEnQIlwl28TlwJ4el39N+ZATTv9o+ZNuJzlXvokQpiu2LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7762

Add jpeg encode\decode and related nodes for i.MX95.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 44 ++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 0f2094d670527..520f52a72884c 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -3,6 +3,7 @@
  * Copyright 2024 NXP
  */
 
+#include <dt-bindings/clock/nxp,imx95-clock.h>
 #include <dt-bindings/dma/fsl-edma.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
@@ -1740,6 +1741,49 @@ pcie1_ep: pcie-ep@4c380000 {
 			status = "disabled";
 		};
 
+		vpu_blk_ctrl: clock-controller@4c410000 {
+			compatible = "nxp,imx95-vpu-csr", "syscon";
+			reg = <0x0 0x4c410000 0x0 0x10000>;
+			#clock-cells = <1>;
+			clocks = <&scmi_clk IMX95_CLK_VPUAPB>;
+			power-domains = <&scmi_devpd IMX95_PD_VPU>;
+			assigned-clocks = <&scmi_clk IMX95_CLK_VPUAPB>,
+					  <&scmi_clk IMX95_CLK_VPU>,
+					  <&scmi_clk IMX95_CLK_VPUJPEG>;
+			assigned-clock-parents = <&scmi_clk IMX95_CLK_SYSPLL1_PFD1_DIV2>,
+						 <&scmi_clk IMX95_CLK_SYSPLL1_PFD2>,
+						 <&scmi_clk IMX95_CLK_SYSPLL1_PFD0>;
+			assigned-clock-rates = <133333333>, <667000000>, <500000000>;
+		};
+
+		jpegdec: jpegdec@4c500000 {
+			compatible = "nxp,imx95-jpgdec", "nxp,imx8qxp-jpgdec";
+			reg = <0x0 0x4C500000 0x0 0x00050000>;
+			interrupts = <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX95_CLK_VPU>,
+				 <&vpu_blk_ctrl IMX95_CLK_VPUBLK_JPEG_DEC>;
+			assigned-clocks = <&vpu_blk_ctrl IMX95_CLK_VPUBLK_JPEG_DEC>;
+			assigned-clock-parents = <&scmi_clk IMX95_CLK_VPUJPEG>;
+			power-domains = <&scmi_devpd IMX95_PD_VPU>;
+		};
+
+		jpegenc: jpegenc@4c550000 {
+			compatible = "nxp,imx95-jpgenc", "nxp,imx8qxp-jpgenc";
+			reg = <0x0 0x4C550000 0x0 0x00050000>;
+			interrupts = <GIC_SPI 291 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX95_CLK_VPU>,
+				 <&vpu_blk_ctrl IMX95_CLK_VPUBLK_JPEG_ENC>;
+			assigned-clocks = <&vpu_blk_ctrl IMX95_CLK_VPUBLK_JPEG_DEC>;
+			assigned-clock-parents = <&scmi_clk IMX95_CLK_VPUJPEG>;
+			power-domains = <&scmi_devpd IMX95_PD_VPU>;
+		};
+
 		netcmix_blk_ctrl: syscon@4c810000 {
 			compatible = "nxp,imx95-netcmix-blk-ctrl", "syscon";
 			reg = <0x0 0x4c810000 0x0 0x8>;

-- 
2.34.1


