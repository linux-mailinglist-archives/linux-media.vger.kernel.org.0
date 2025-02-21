Return-Path: <linux-media+bounces-26630-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9649BA3FDCE
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 18:48:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBB8C426783
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 17:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1AC3250BFE;
	Fri, 21 Feb 2025 17:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="St1b4WRu"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2062.outbound.protection.outlook.com [40.107.249.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4B31FBCB1;
	Fri, 21 Feb 2025 17:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740160118; cv=fail; b=L+MUtNCgw1Ga4MTmGcoOaOu6WeDDAjUMp4NXkgRScGh7j2004ge+7BOHUs4SwrTCAKCXtZP4V3yVtpYTxra0Omz9lfa9W/0JpKDzQQ4ZgQr/KRzqtHyf3sUjDCvmRzTr2y/RpcOqOqa/3grnXJMO4wlwXD7+Rvf9lfag4T4VykQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740160118; c=relaxed/simple;
	bh=vJhAC9DOUQ44MFao5kMqCzek68F4oPYMpuIgRDLTUls=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=TYvbtZVzMQRb4iYSL/aaRhe+1oFUkXfqm3dx7zFqD0bkQ6Uw353p18NktWX+2bdu02ZFgm7B7LUjIwE0ow3iTZj2FzyFXcxxykZb7Kkc7xKBjLR36Rp1eEFEbsfWV17WkKOvLzDF+odzNrnu0mZ5HJKkQg/l4wNq87JEMTQYMic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=St1b4WRu; arc=fail smtp.client-ip=40.107.249.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xwr6EcOkhj4r6Ia8skLKHHYUw082sLqpDoNUkveoRLjGO/hjyHk6vakAdK+1xDhsTwIEo4qMYT1PlvwiPYmG5Eqh00aYwgsqR1rTdA0dMcwiGIyNdjz6I+5qOOkRkx9o15GXK+NqEqFl7rQneAsG0DG388OV4zR1/pTS6XYh9CgfwOi/4LXBVkAJwlYqWJRnmB+kH0TFeKOMdb/3zAM5xpj6VuBad5/AIaiO19ZIQ20TV8hs+axtm3HoororGeAu422431N6nmJwxnFOjGs6EPZ6p1jnTfpGAKvws1xth8YoQTDBZVks/v0LJicSv9OwD6qMLm12nTX7Vp7jIa2J7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GB2VG+rgEO2/OUlslEbKrTu5xNKxxDn1QhZZTowVktQ=;
 b=v1CQNZLpStKb43s8kr/BUk7+v0/4CwwNtdl24agVefKtkmmC6c1sMD31sMx13KsljUIUsNA28LHgmcVeTx+ipvEnXGTSR/3PZB3W6VZLodu4qHcWNKs63va4F+0hOVo0XGZSWE+I6+BD/C/KARa1aHi8QAiB468QPBSSVbZcs+gt9NLd1akGdZzrkIo5bPG30nnrTsa/V5v+WlEZ9DVJUaELAmRpnZZ81IuBWh9100s4w68buDaJOe17mm29+R/Yc3uPCRU178QKmV5j9FBScLGsNDTZPE4B3/OuOifRGUci34sdVodSRL6n8AayLMVOl//zj3QdcrgI7+c8gkk91g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GB2VG+rgEO2/OUlslEbKrTu5xNKxxDn1QhZZTowVktQ=;
 b=St1b4WRuKZmGDHtksM2YLBq4AwQg+eloy3VucrmCgaiDOqAKtUBUARkoSgAoxucSg+kHeMARel6Ii0BUUCwomW/7HU/vzgmKhd8HIIz3j52t+noXbd+QvG60rK3l+vZwmtcKgO53/ZwHNy3bLXF5Ik6BghRmYR6Sl9Xwwonx2E/ap6U3f77DZDZPzz/mwuvAfYxspS1lE76ffNxMEb6iKNIEpO5gm4YdM9DPi1XjFus9SNKkqHR+ivhJcROyKOV9qRYukLHzlmsQ6dFIAQNEqtnb6MjFgkm/DEA4Nu8Ge/ET4NC3+kqKRC4WUcpsfyPjV4ioQGXKwNpSxM6ZVFIDtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM8PR04MB7762.eurprd04.prod.outlook.com (2603:10a6:20b:241::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Fri, 21 Feb
 2025 17:48:32 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 17:48:31 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 0/2] media: nxp,imx8-jpeg: Add imx95 support
Date: Fri, 21 Feb 2025 12:48:17 -0500
Message-Id: <20250221-95_jpeg-v1-0-053decdb452c@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGG8uGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyNDXUvT+KyC1HTdRBNLIxNTI+O0tDQjJaDqgqLUtMwKsEnRsbW1AAU
 X18VZAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740160107; l=634;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=vJhAC9DOUQ44MFao5kMqCzek68F4oPYMpuIgRDLTUls=;
 b=7KXk+ocZ3cceL1Bsi/vgaG10I7/daNUwhIETB7AUif463lkZ+SlRZXyqpUJmPmdegy7U6kUHQ
 2LoQElA+k/MBBtCJcUSi4/v1Mi8aPbyT+uaKXGBEXTVesyF/LKkQDuV
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
X-MS-Office365-Filtering-Correlation-Id: 76b1ecae-2586-4faf-d9f3-08dd529ff4dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ODRqOUJJNHRmeHkyYU5wM20wQ1JaT1ZBRUxxcm42UVNZNng4S2lJYk5xLytH?=
 =?utf-8?B?eDhVMkMybXFyWC9YMC9rcS91VlRjbDhXNE1ET09xMmpwZit2bytXZFBqR2hT?=
 =?utf-8?B?VzJRRVBWY2JMMVRtNDVmeTYvRE5yVHlRU3Bic0dzMStnL2ZsSUh3V0lKMUJP?=
 =?utf-8?B?dGkzU3pGRUlLZ3FiQzJwajMxUmZFNjRqNkFybnJvbkVYMHVjamlPQ3lVT0ht?=
 =?utf-8?B?OFFmQzJSZVdWZCtITlFXU2RiZ1grVTdUZWsxc3JWY2MvOExLaGEzRXBvNnhj?=
 =?utf-8?B?cmc1S2JLNTduK1A4bFVRTUs5ZnRzOXRrTmdCV0FMc0Z2Ly9rWW9JWWpYZ2xU?=
 =?utf-8?B?NkpYN0pjTXVSSzR3bWRxQUNSYWtTWlJwZTR5bjJqMGFvYlIwbzlRY0xWdloy?=
 =?utf-8?B?RERTYTNnc2pxbG8rNVQ0NHdmN0M1aVlhTkFzazRaZEc4elpCclFYRWpVTjNr?=
 =?utf-8?B?dTg1Qm51b044V3FPY0lYYUV1YkJXS2NGRVJpZFdJM2lhajZjaGRRa01ha0V4?=
 =?utf-8?B?QTJBUktTS2lRMEx1U2w0clhnL2ExcEllWGJMS1U0eXpiMmE0WW85dHBlNkRG?=
 =?utf-8?B?Y1RLcWlrcEYvdk1LT21Mc1l4NEdEQzFEdmJjMGZtSk9kOEFFVm9xQ1dLTjRs?=
 =?utf-8?B?aTQ5WEt1bFhQdXl0cnZ4WExZTVE5Q0tXMEYwUTN4V2N4RmFNa2RMWUU3aXVC?=
 =?utf-8?B?WjZpdWZCc0dOTVZBS2pBSUViaVhLSVJtTTRlcHMyWnRWU2hHWGJENDN5cENs?=
 =?utf-8?B?VHRVTkFUM0g1MEtKVmJIVDNJb2xlaU0vNVRzd1FOcjlaejFVQXpiaWtKeWxH?=
 =?utf-8?B?M3pmT1ZBMy9PQ25HaDdKM2hYNG03aHd4WnJwcld2VGY4WkFJblFPVmw0M3Yw?=
 =?utf-8?B?Z3ljbjZWNmdmVUFzcG1UcmVvZzN2VndkWitnVFVueDlEaFR2U1NMakI4QzM1?=
 =?utf-8?B?bFRJT2JnajdHbGJVNFo0cFVlWDNsMXZLNDJkaXozWXYwWm1rbWlmOWg4dURG?=
 =?utf-8?B?ZkthWnFQVk9iNUFqdU5WQlVCbHBmOHRPc2cyYXdXK01qeGNrcE5CZEI1bHAv?=
 =?utf-8?B?MHVhMTlPV3B3N0NMakc4bklDbk9yL0huNHNGbnM1cWpyREgydDdEK2ppTC9N?=
 =?utf-8?B?emxMb24zUEJlR0NVeC9hR2h2dGdNdkJnK3RESVN2UzFwblJpUHRmYmxwb2pL?=
 =?utf-8?B?dmE0UDdVeWo0UEo2ZlNDTVNUcHZIN2JoRHhiWHVBdCtIZkpJa0RyMlNESlM4?=
 =?utf-8?B?YStuaXFBb0dSTVFHZWNDc0wzZnhMVGwxSmZFc1ZEemEra2w5UUJQWERyUUd0?=
 =?utf-8?B?MEkvSXpHNnVrbXQydndCY0FJaFdEa1pYdXJVeUpqYUtiSW4rRkFEMnFML3Az?=
 =?utf-8?B?N2V6OVcyVlBvNy9xT1NkZFdTWHBCNHFQcGhjVm5sZW4rSHlYQ1k0QlBFS3Fm?=
 =?utf-8?B?d1E0bVdwYWp3bGpqaXZqN1BqVitJYWUxNnI3a2lMcFpnTzVvM0ZIV3MxeTVl?=
 =?utf-8?B?emUzRVBrcm16bDloWHRMSWxHdzFoV3JjQWVvQU45YkQ3NkJyNVNXMHgwaWZ1?=
 =?utf-8?B?QlY5UE9SWjZYSU9leUIwMXhrakM3aFFJUGpjNndnTlhVTURrUnAwT1QyeU9H?=
 =?utf-8?B?alFrSHJjQWtHYjV3OVZ0K1Qra0pCTzdxeVAxdHFqRHMyME9KVEtEdmRselVG?=
 =?utf-8?B?Y0tPRUNEQVZ5RlNIbUtZcmlGTmxySUFWVUNSQ3VSeGEyRHpBbitld0ZQQ1cx?=
 =?utf-8?B?MWlXN2k3alJvSDhNQ25CMktheEo4b1k4cXR1ai9HdzkxYUY2M0E1VmhjVUJO?=
 =?utf-8?B?dHM4dGp5Wk5mZmZCcU5NbGNuc0dwbUpzZFRCa2dFY2xXOHFMU3NSMDlZemdp?=
 =?utf-8?B?VFJPWmJXeG9pU1ZSRUhTVVdrdzhvUWtTTDlUcmFZYTQyQ1pHUlgwVGs1WDVk?=
 =?utf-8?Q?sBkCfsclkBWcmreaZE+T/AimMe/Q5XAL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tmk5VDVJcWVCR2hRZHlQMWZGd1BtcGZhRDA3U3ZkYU9RTFlWN05FWVhwSDBH?=
 =?utf-8?B?Vis1eHJEU0JUbnVrUVJQZ2R0ZFUwdWFNU2QrRnE4V05GTUlaSVMrbU91UkN6?=
 =?utf-8?B?N05ibDcwVk42NHN0dURZNUpwTDRvTjNqck1LcHhHVnA1QnNSc1FJcG1JdFN2?=
 =?utf-8?B?NUFRb3laZ3ZwSkQxeWVBQlN1K2d5RmhHR0tMMytmMDR6aVNTM1k3bTB6WUNT?=
 =?utf-8?B?MFhJc0NCWmVzM2dHR1RwZmIyWEJGcVZYdG94MzFLQ0ZFbFBwU3huTDRQVUht?=
 =?utf-8?B?S0FoY3ViRlphWkJWdVRvSUlTNThwQ0JvQ2ZRTXZWOVRkT1gyN1FMWjdVR1R1?=
 =?utf-8?B?ME5MZG0vZTl4ZzdNbldJNDNmMFBJVmFqNUg5a0s4NXdROWc1V3F6TUNGRDFQ?=
 =?utf-8?B?dnZPclJEMG9la2lpbXo3ZTYzd0VYSXVYVkdVN251UFZ4d0J6OW5mTzk4OHA1?=
 =?utf-8?B?bUNmdjl1UnpmSXJZbkN3TWk1M2ErQU5xdmlxeXlpTzVXKy9CV2VKSVR1SGo0?=
 =?utf-8?B?ZGZCZFBJS1pkYUZreTM4bDZsNHpqeTJZN3c2SUVZSUNlTXpIaXFTS3hhUHFC?=
 =?utf-8?B?M2pWdDJudllzNnhyWFowWDgvYndWTnh5VDI2cERTNTVwL2JqQUlqNUpwb2N0?=
 =?utf-8?B?b3VZV0hJblBPZXp6RVNLNU9CWXVrRHM5cTB0YW9Bb0grcXhENmNlZUMwYksv?=
 =?utf-8?B?aXl0R1Z5YXR5b2wyeUQwQlVpVmRsTW4ycENyU1dMSGJpNmpvVnlYWFhOcVZX?=
 =?utf-8?B?bFBEUFRFVG1aSWcwVDNtUDRsRFhmU2Ridis2OERHeHh1R1NsSWJHeTZjTFJO?=
 =?utf-8?B?Z09tcUNYaXdZaS9WVXVEVkFNUlc3TWJvTy92QXJ3NzNiQytxSkpLSCs5R2o4?=
 =?utf-8?B?Tlp5YnNVS29TbnYvSFBZaFdBcjNseXVuY1Y5Z2lxY3NWeVRBOWdHcWlodUR4?=
 =?utf-8?B?aVRpTEM0OTRjZGJXaEk4RnFBNWRweVVUTVNjeFJldE1iWWZJWXAyclk4YVg1?=
 =?utf-8?B?ZS91L1cvRm1IL0NqNTA3S1N5d1I0Y2xjQ1N3YW44T2JqUEsxdUNCTmhZWkwy?=
 =?utf-8?B?Z2FEMXVPb2VxV2N6ZFR6SEhUWU5NcVNHanZGQmxzTU4wS3g2RHlOV1JzRzBv?=
 =?utf-8?B?YmNZSjZhZ3FuS0x0RW1nempSbkoySlltZ0RGTlZmcGJJY0U1TlZHUWN0VjY5?=
 =?utf-8?B?WkVHUWJiaW01VFNPL2hJUEswNGhMQ2FUYkxIRmVvL1YwRGVaVkZEZ1FDbERs?=
 =?utf-8?B?SFV3SDRiTHdIeUdPa1VTT3B1b1hCbmJGa0JWOEUxNm5PMTdmODUvd1lCSnJT?=
 =?utf-8?B?WHRkc25Wa3ZOT2VCRmdDSmQ5SVZoc0gvL3ZuL1Zrc0dDTzJGVWFRWUU4ZG9s?=
 =?utf-8?B?WjVCdEQzZ1dVKzBtNWZ3bGJRUmtKdXd4Ni8vWlgvT0grZzJhdmVaTFhCdGNn?=
 =?utf-8?B?K2dlbVFGN1VpbldUY3BrU1pmQUZISjhFanlLTUdLUVdxZjNEOVRWd05nVitQ?=
 =?utf-8?B?ZHJkbzhadmsyTkR6ZUNSTFB6dEhiNEtOclFDdEp1RUEzRjdLTEVEdlYrajJt?=
 =?utf-8?B?cFlmTEdob0RhbmFMWmErUDBnTThWcDM2ejRtMCtLMDZpYmZVTndEWHY5VFIr?=
 =?utf-8?B?VWsyWjJ5b2U3eXBObjBaSGRFbjViOXVPWjZVMndWRXRxUGJkalkrWXFyc1RM?=
 =?utf-8?B?ZmlkRi83N242UGRZRUdKS0pVb0tZcklwb2tJdm83Q2ZkLzd3YWJmRHFndDRS?=
 =?utf-8?B?UjRIazFpcVkyemF1WjNwam40SlZTY0Z5Ylk5WEpNdlJUZWZrMEN3NTcxSmNt?=
 =?utf-8?B?V0ZBdDIxMjhaY2xqMDdqcGovK1RBRlpoWkwzNHFwekZkWHBMZ2ppVHZNejI2?=
 =?utf-8?B?WXZCT1VoMnNaQzBhTjZXNWtVR2RrQitOS1hya0tZc1BEU1V0cTBkcFZCM3Jt?=
 =?utf-8?B?ZC9DcnR5dHM0RmRodXd1SWN6WFI5UURTdXNyK0h0UmpwOGNkc2FRVURuV05y?=
 =?utf-8?B?eFlBSVlFdm55UjJmSkhIb1V0WDlTTjJTNXdnazZGVzdQaGJJNW1KUGIyblhH?=
 =?utf-8?B?RVo0WWpYcS9nV2JNV2VjaUJobGxyL052VnFyQnhoUHRsNldyVnA5WU02M3l4?=
 =?utf-8?Q?aLN4K1FySFkAH3fOXq4MT9USG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76b1ecae-2586-4faf-d9f3-08dd529ff4dd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 17:48:31.9004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rm8GuezBXYFw7/wQAaA0DjhOZ/IP+dyF6rhIOLxEifjNkENYwXTEF5p6Jvsk/vSUFLQVePHA9jhCH+oRx6ztqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7762

Update binding doc for imx95 support.
Update dts to support imx95

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (2):
      media: dt-bindings: nxp,imx8-jpeg: Add compatible strings for IMX95 JPEG
      arm64: dts: imx95: add jpeg encode and decode nodes

 .../devicetree/bindings/media/nxp,imx8-jpeg.yaml   | 28 ++++++++++++--
 arch/arm64/boot/dts/freescale/imx95.dtsi           | 44 ++++++++++++++++++++++
 2 files changed, 69 insertions(+), 3 deletions(-)
---
base-commit: f3df6ce76ecb8eb47f0d3198ab4b81df31217fa7
change-id: 20250221-95_jpeg-a4924523fff2

Best regards,
---
Frank Li <Frank.Li@nxp.com>


