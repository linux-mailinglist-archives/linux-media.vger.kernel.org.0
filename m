Return-Path: <linux-media+bounces-41149-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5BDB37F5F
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 11:55:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9A22460F4B
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 09:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E7C834DCCA;
	Wed, 27 Aug 2025 09:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="l1YzmUTm"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010044.outbound.protection.outlook.com [52.101.84.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C040832C319;
	Wed, 27 Aug 2025 09:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756288482; cv=fail; b=QwsmuuO+FZ3reftn8x/FKPh2QUecAkhXdxP4X2fch0yagFwgmh0W93oT/p8vNh5lyxr3bNsW6fbreYGuzWC79upAJeqEXL4FCRTipc/ba8MOGOd2SO5nAde5moLW0hjE8wQ+VHNReDty8CGJfEotWtfPkmqV78W2vN5D1NDttQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756288482; c=relaxed/simple;
	bh=e+UQzyKziiwQfewK19IXyFiDEghdjK9jDERbsFOeiO8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=YYjSiia5t7h0NHeq1gu86qdAB5ZmkUdpK2TSmZSIFjwFWcSlI4BhPDmlRFOOOQpJe2xbsViq20DIopjgysWqsjPa2O1llhT0Pi49QX9scpPjd4RrP0Pzvup01Rw1i626eXmBOrPB6a4pKh7DV+LhHRKWpeRMj2aAJHjv7/lzLDk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=l1YzmUTm; arc=fail smtp.client-ip=52.101.84.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D2ookxYCVaJna6xI0BQSm/ElE1YOq/JitWWZUgBc1pbB9TAVMyFiXjBIJ6PP+p847S0Ik+PHPr6Gl1XDDdoPC2P+yCr/6ev1OHlw4Y55CGBha6CPgABRbYl/KWFPC7MAyQ2zaQkhKQTR61UVkBaMCIai/iK7MkMzXXByJQ1+hB4+Q/JB/Ru2IVzqVISBkz7eFEOBLcYdfNrRB5D+KI6znoFn7eVPLuCTUU6LOnhufOm6wkEnwzvaMJTw5s+XgKrDjhC0buYi9qh8QfFKGLVAAI7xtJrwJstCPkloIDiI80lXpx3jh9j7M3l9BW7CPAzTklQJ3mBKOlR7k280NIWhVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQGJVonPGaRq2/IkUamcysnQsgtHAUutzwzH0dTDwcc=;
 b=XpgPIgmzn1nflSLC/SLp/4K4I2FyCKz1PzzhSzFpwjXPAScOFGWgysyXKCVC87Gqr2bidDWsi1agYDyg1CtWU/GT2tctnoHSzmltdWAepY5gX4fRAIBWUoT4D1/ZwpIoVHsxvuSJYt7AeaophsGCDsuT+GD3Tkd25q3vn9wBFXA6uJKh2p/O/c8WsUxq2e9DOJJ0hcWyCBjOVwaztuojdcHuSGTf6QVYzIg0EdXArPedMZfyiC7EirzYtATGM8iaQfU987vPbYQsvy3HNT4q2s8U1tuF88WxwbyxDkj0KSvrCt1eaRCqPNR3IJ/Q27LW112fs1shp0tzR0qEkpvdCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQGJVonPGaRq2/IkUamcysnQsgtHAUutzwzH0dTDwcc=;
 b=l1YzmUTmXFhePc/QZVgaNNjXljC6ZhnApuouT8+RIv+0Yj76c4aeKwk8erV1AAMtCZPNvj8Lg0OySckgZ8jB4hPp480SifX7ZOVLf50wDDLgGwy2gXAladsqxATU28GdpM4MX7PfW9V9AkGnybul+A/sqeRjhG3jVirtrM43HJYIjWwS1ipcQdCdEPz1cMzfFkqTBlLJVyesdNAUC44QxhcQWU5oY8XZk6NTjZtCpfRVVltVhpbPym3ES9Z7+nsoMk/OCcZ1B8JkTFA0IbdRZGjZ6VfmGIA57mTjHjfaVO5ewo3Prphk0FAc9qDeCs2aM29V8x/9qjnnJuwh8y/nNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DU2PR04MB8839.eurprd04.prod.outlook.com (2603:10a6:10:2e2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.10; Wed, 27 Aug
 2025 09:54:38 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9073.009; Wed, 27 Aug 2025
 09:54:38 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Wed, 27 Aug 2025 17:53:51 +0800
Subject: [PATCH 4/5] media: nxp: imx8-isi: Reorder the platform data
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-isi_imx93-v1-4-83e6b4b50c4d@nxp.com>
References: <20250827-isi_imx93-v1-0-83e6b4b50c4d@nxp.com>
In-Reply-To: <20250827-isi_imx93-v1-0-83e6b4b50c4d@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756288458; l=2338;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=e+UQzyKziiwQfewK19IXyFiDEghdjK9jDERbsFOeiO8=;
 b=6mf2qyxUcDjBR8qUc8lIFiz0hLFdkhu+bNkwppBqCsuAqst8lQacV1hovSiARpGgRYv4tUg5I
 HpdqnIjARAKB4gxUv2f8Aeo8/HZXpayRsS16kCy3j1Es3ZynfoQNEEx
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI1PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::8) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DU2PR04MB8839:EE_
X-MS-Office365-Filtering-Correlation-Id: a7d64646-1f2b-408d-60d7-08dde54fbc33
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|7416014|366016|52116014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?UjRkM0xCSkJEaHR6cXNRTURWRUlPQ2I0L2RZUUluVXRzVkh2OGVScEFqRVJo?=
 =?utf-8?B?Yk5YcG1ZY0hmK0ZkVFhtU0N3S242Ni94NHM1TFA3T1hHdkpxZTRMUmhFb2hw?=
 =?utf-8?B?Z2xaM2pTS0JCM0xBZllLSVZ2QW1hTXppMHdGejdlVmRVdGNRWnFXWFFQOE9K?=
 =?utf-8?B?WlFxY1M5WGl5aHVRMlgwRmY3a04wdXZtaE9ZOVFBNytoSjh5SzdTM1lKVnp2?=
 =?utf-8?B?T25sZHBJam0rMDhmd0E3QXJzaEZvSjN4RVQ3Q2o0QTBQZXVOMHBGSy9mQ1g5?=
 =?utf-8?B?Z2MvNHpjUnRGN2N6aG45QVUxM1hlYXV5dXpKaWV0N0MzWXhKUEZHRGxqTDZl?=
 =?utf-8?B?ZEM4eTRRWStwRDFBdnZVck9GTXJzTk1BN21seFM3TzZpRk1wbXZJUHZqNjhT?=
 =?utf-8?B?WGxTTWRlRDZKaWUxQjlmQ0tlbW1UQmV0MmcrcnFLSWY0T0lkVjQyLzV0Um1S?=
 =?utf-8?B?UGpYLzRKS1NQTlAydnNrNTFBdTdnSUw5TEFBdDI0VVY3bW43KzFya0NBS09x?=
 =?utf-8?B?U2hZa1g1cjJyVUlVUDFERVR3eVQrd2Y5TEFKaG1QcVpyWW1DOWp0Z2RycmJz?=
 =?utf-8?B?bXdTcWhxVkJxYnk0OGhyaTZwckM5RWxnMXRvRDJvZ0FyVzVnVTJBZnZKNTVv?=
 =?utf-8?B?TmZMaE9QVTd1RTdBMC85b25JUGQrMXlrVlFEVHVpQ3lnbWtrUXN0UW5mMkJs?=
 =?utf-8?B?SDRJYTBzanlsZHF0TEN0cXNMem9NZ1h4bnZzV1lCd3QyRUdWcVJXYXNLczND?=
 =?utf-8?B?OGl3RzhJWG03bFQ4VkNqMWNadFpzS3ZnZmxONHdwZmpMZXBtc0dqcjVMNitm?=
 =?utf-8?B?ZnZNNmcwZXVEWHcyNTNoVHBEbTZEL3Z0NDAzRkF0akY3bkVPckkrRG1MSW9v?=
 =?utf-8?B?U0l2NjFWd0I1TlNmR3VQMVZaOFNkWVdINVcvakpkVGNKMkpCdVZNbHFyV3c2?=
 =?utf-8?B?bGlaSVdRakkvQXF1OWV6ZFU1MHlHSTR4TUpRRDh1YzVRM1Z2Q014bmw1Rlo4?=
 =?utf-8?B?c2tqTHRnTlNCL200UDRxWkk5N21MQkxDOGpnYzFWSWY2RjR0QWxpV3NmZ2c0?=
 =?utf-8?B?T1F0S3J2TTltQTd3bHJVU2lGM3ZCdTlFM0kweEQ0ZU52K0dpY2NzK0E3cFlV?=
 =?utf-8?B?WFdaOEU5RTBGcDJPL3p2eHZrVDBPRDgyNTZuMEUyd201VE9yVjFzRXo2ZE0r?=
 =?utf-8?B?YTk2YlhLZ0hQVnJsRnoxdS85TkJEbEk3SGprcnF3cU1yRjR5QzlTOGpadWMr?=
 =?utf-8?B?bjRJRW1ySVUrT1oxSUd0UlQxM0Y2eGtNc0FIL0RpcmJhcWR3RXpFbC9SZk12?=
 =?utf-8?B?RWJuN3ZtSXprcXFGZ2tLR0ZJR00vMDRUbGNZbFpnL1BlaHVkeXVBa0xON3c1?=
 =?utf-8?B?RGlaOWpDeXNuaEY2QVVwWi9WeWlrSUdQUG82VldFeUNIVjZ5Y3Y1WGkrajZv?=
 =?utf-8?B?RWJmbDZnaE96ekduNXJlZlF6S1ViT0ZIdjdiK2h0Ky9KVysrc1ZZUDFUN1Ax?=
 =?utf-8?B?c0FISWNyMklYMFpXTXg5ZUdVRGZURGs2REZHZXZpYktJemZSK3JneDlrQXJs?=
 =?utf-8?B?eU02cWl2MWVBUnlvdURScFNkWkN1Qm9QT1BXUWtYZXlhcldaT3BGZkdmbENG?=
 =?utf-8?B?RFpqU0hsWEpSTVhjMFpENGxoL0pUTGVmWUNvRnh0N3VkSHlkZ2NiOW1qMk0r?=
 =?utf-8?B?WGRTTTdySXp5RHFUdnFUTkFEVTV4RVpRa29rcWVtajlWN014dUtZWDZaZ0R0?=
 =?utf-8?B?dW1WL0tNdWZOdWVHcFl6RHhqYXN5a2tWTTlBcStvc2VDSExoMjZTV3Y3M3Nx?=
 =?utf-8?B?WU15Vk5WWXh3cDk2NWZpcHZSTjM5d3B6NllJamVLUXZ6TVQ5V2EvZnRpRVBi?=
 =?utf-8?B?b1ZOL3VwUVQ0NS9DK2FRbU8yYTZiN2pPNTc0dUtULytad3A1ejJURnk1SG1M?=
 =?utf-8?B?S1F2WktQeHpGSDJpT1BYd3lKN3lmQ0xrbTFHUjExVUd3U2k3NGt0cUVCQllj?=
 =?utf-8?Q?/Em8/ZYJTPZYvsxOM9mHbSMIS2+44g=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(366016)(52116014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TDB4UlBWSUpQMWIwWVQwbGhvUkhqaHkxK0pZV3hYZ2krQkFDM3Qzb2hzaWRt?=
 =?utf-8?B?bHY4NVBhZDlEVGg0M0xhTHFNSlRZbElyMEdqTW9FTHJtNUprZldHaUhobFh0?=
 =?utf-8?B?cXZkZEI5ZTRWUldzaXlHSUE1WlNjSXZmSHZhMWgrSGRXVTR6Q25wd3pFTk1I?=
 =?utf-8?B?dkdqVjdaaStQU3NWa3NXSG8zYkgrckdFdUIwZi9ScDN6S2JYYW1rbWxLZ25m?=
 =?utf-8?B?YXc2Y0ZBUzhFTjRJd28yVkZ6WXUwMkc3SmpvVlZFSG5rMDluN1k2ekNlNzJB?=
 =?utf-8?B?ZTdSQ1F3OUhGd2ZjKzc2WFpyVkMrSzV0UEsrb04wLzMxR3JWSmM5VFBkQWlC?=
 =?utf-8?B?blA3ZlhYSnNIU0hBTUU3OFV5a0p6c0cvc21qckJWRXZadTgzbGRyQnJ3MGJz?=
 =?utf-8?B?WTFvRkhqNm44TEgzNUtUUGttZjA0SnpROE5WZnVML2xQdDd1L01iRVNRQlZq?=
 =?utf-8?B?cXp5NlR1OFc3dVZBZHB5cmhkZ2tUdTUrTmE2cEpzZFI5c1ovVllnU1lwZGR0?=
 =?utf-8?B?eUxKR3VTQ1ZsckJHQUJ2Wm4zT2JtdTlEMjlOektHVTVCZFkzS3d0UVdYbUNt?=
 =?utf-8?B?MENteVVvNVZsalNQQk5BT0o4ZXgvUTk2NnlicnZQUEpHWmxXa2wvaU1wc2sv?=
 =?utf-8?B?UDQyNEJQUXM3MEsyUXlyZFlCOUFJUGJURkFvc2FHTk1WNXJENTUzWDRwZWdU?=
 =?utf-8?B?SndPa1ExUnR5bDliTEJaZ3NhT05NSk5KQ2hFc0puU1UrZHlDd3hxT2pOZDYx?=
 =?utf-8?B?eDFDM2Q1bGpVWWxmZ1A1RVFoSkNaaVE3SlZPY1Z4Uyttd2hRSkM1TTlyd1hB?=
 =?utf-8?B?Wkp3NEhObTNNL1BaYi9lQU5YVko5K1lLV1RrRmlyR1NCSjExWVJpbFFjL0dv?=
 =?utf-8?B?M0RNY0txR0NJVGZ6dkt2K2wzYnpNMU5jS3JHMHRaZnBQQXJuck9LeUV3LzhB?=
 =?utf-8?B?aElpTmdFVTBUR1dTYitqMXBDMnp6Vit4eWx0elUzYWRPcWJCcmJzeWNnZjhS?=
 =?utf-8?B?S0FRWTZ0Mkh3Q2ZQazdIY00zb0lTdjhnVlQyUXl5VWhDSFhCMFNmN2twQnNn?=
 =?utf-8?B?OVIxM2RtbVlEZkEwUEJhcFFHVGhRQjdKU1MySjZXbnFmd0lFT2VCQVRBUGVB?=
 =?utf-8?B?eGJQR2hYZll6dlZVV09ZRk5kU05hVVhUOCt1T3g3dE1Vb0hYRkR0V0IwSXBz?=
 =?utf-8?B?SXdhRmU3LzRBMU5ySlhPaHZuV0lHRnd5bTBldVFIQkhNcjhTNU0xbDJWRm5K?=
 =?utf-8?B?ZE5FcDI0V1pIU1ZDa0FWczVkeFFnSzVaaDNBbWJYK3QzekVrcEg4ZWF0WmVX?=
 =?utf-8?B?SkFmbkZjclJvOUlDK09qT2loNWw5ZWc5MGdSNGdKV2FzQlFJTmNoSWpLVWVm?=
 =?utf-8?B?NTJVN3V0NCtBWXlJKytLUy9LZk5nU204RWlIb3o5NWludGI1dGM3RFVSOWZ3?=
 =?utf-8?B?WnhNVDNMRWRUOHFCVzZzTFdxOXFDY0tDTlZNR0NJT0swRndqaHFFcmFvNUFH?=
 =?utf-8?B?b1VEbzRLNjdWTW5rUi94eXB2VUVXaHFZQUdNaklTVjFTY3d5ZHNlanMvY0R6?=
 =?utf-8?B?Y09FVHA4RFpoTW8vampGeGdydWVnaFdmeU0zWERNUzlnNlZ0eEFqZ2ZWL3Zv?=
 =?utf-8?B?WGE3MXpRV2xkem45R3NmbTZ3SE9FdmFQbVBjM2Z5cTNmaVZFcWx1aklhOC9l?=
 =?utf-8?B?OE9UazdTbmJrMDA2cTBHTDhXdHRvQVFGRWNla1lSRTJkUEdSeGF4L1hialpv?=
 =?utf-8?B?RFdsWVZVRWV1b3E4UDJOSmVUUE5KdnZlK1VaajZ0TTlWc0tUUm92SUtFemJ2?=
 =?utf-8?B?VmY5QjI1T3cvRjUwdHV5VWRmd0xsZnRpb2ptZTJhSzRJcld2V1FkVVZXc2tY?=
 =?utf-8?B?RzJlSm5RVGJKU0YvY3JLbm1CYU10TFprRW1vMnV5ZlBzWXliSy9mV3RJelEv?=
 =?utf-8?B?WVgxN2FWcllqb1FhWWQ3YnZud1V0dVpkSDUwMElFN2tVeGRSdUl5bWwwaitE?=
 =?utf-8?B?ZDZnNTB0QjRXQmoyTzRycVZDUC9HYVlCVi84bFhoMThwM29pcTF3NFJSYUNB?=
 =?utf-8?B?Zjhod0VONXYxdkZKUUxmV2VoL0tsZlZPUXhnZHhPbWZ3eUM0RDBQV28yRFZK?=
 =?utf-8?Q?t9G8mIpuMrj3m5933XBwfLWqU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7d64646-1f2b-408d-60d7-08dde54fbc33
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 09:54:38.1682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5XzvamUqMxLmMGdFL+tbYqTh6eLlM2WVmHszg6QdE7x3AfID1eQhUDOPLRZklf/n5IJtNQBtWhjhLkCNEDX2qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8839

Sort platform data in the order of compatible strings in of_match table
to make it more convenient to read.

No functions changed.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 44 +++++++++++-----------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 981648a0311374597a033a7ecbf39f7b0b252cb0..cae918792ddbe3e6f458606fbbb7d0ad5738504c 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -314,6 +314,28 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
 	.has_36bit_dma		= true,
 };
 
+static const struct mxc_isi_plat_data mxc_imx8qm_data = {
+	.model			= MXC_ISI_IMX8QM,
+	.num_ports		= 5,
+	.num_channels		= 8,
+	.reg_offset		= 0x10000,
+	.ier_reg		= &mxc_imx8_isi_ier_qm,
+	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.buf_active_reverse	= true,
+	.has_36bit_dma		= false,
+};
+
+static const struct mxc_isi_plat_data mxc_imx8qxp_data = {
+	.model			= MXC_ISI_IMX8QXP,
+	.num_ports		= 5,
+	.num_channels		= 6,
+	.reg_offset		= 0x10000,
+	.ier_reg		= &mxc_imx8_isi_ier_v2,
+	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.buf_active_reverse	= true,
+	.has_36bit_dma		= false,
+};
+
 static const struct mxc_isi_plat_data mxc_imx8ulp_data = {
 	.model			= MXC_ISI_IMX8ULP,
 	.num_ports		= 1,
@@ -337,28 +359,6 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
 	.has_36bit_dma		= false,
 };
 
-static const struct mxc_isi_plat_data mxc_imx8qm_data = {
-	.model			= MXC_ISI_IMX8QM,
-	.num_ports		= 5,
-	.num_channels		= 8,
-	.reg_offset		= 0x10000,
-	.ier_reg		= &mxc_imx8_isi_ier_qm,
-	.set_thd		= &mxc_imx8_isi_thd_v1,
-	.buf_active_reverse	= true,
-	.has_36bit_dma		= false,
-};
-
-static const struct mxc_isi_plat_data mxc_imx8qxp_data = {
-	.model			= MXC_ISI_IMX8QXP,
-	.num_ports		= 5,
-	.num_channels		= 6,
-	.reg_offset		= 0x10000,
-	.ier_reg		= &mxc_imx8_isi_ier_v2,
-	.set_thd		= &mxc_imx8_isi_thd_v1,
-	.buf_active_reverse	= true,
-	.has_36bit_dma		= false,
-};
-
 /* -----------------------------------------------------------------------------
  * Power management
  */

-- 
2.34.1


