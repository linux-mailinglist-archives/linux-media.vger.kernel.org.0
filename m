Return-Path: <linux-media+bounces-65144-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SDtVJ3L7MmoW8QUAu9opvQ
	(envelope-from <linux-media+bounces-65144-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 21:54:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C88269C414
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 21:54:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=LtXOaAZw;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65144-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65144-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CD95A31333B8
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 19:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D93063A9601;
	Wed, 17 Jun 2026 19:51:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013065.outbound.protection.outlook.com [40.107.159.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683823A874A;
	Wed, 17 Jun 2026 19:51:22 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781725886; cv=fail; b=NEKsJjwzyIX4U3cpB5JTqn3PO8SE4Xc6+0hESaBIMUsX9/W1Q6mzNMF9MzDg5fIWpOJL6Mdr3F6H5Rz5u/5zB+WkcXsWGiE7UUpvJLCm/1pe9TX+rcfICn3yo0LRUFRyzF+fjIZ62SjBgRdnKFDWB1eUW2z8SuTl/A8LguvfZG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781725886; c=relaxed/simple;
	bh=G3yhgzITGjQL1U3q6wJlybO+4Gck8hZOXnGiN+lVUbc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=QlvR6U/FtdCpE8uK1oQWo62Fv1yDqsKTZeTQe+nQkrDZvTvRg7kz3FIU9PKtyAGF//p4tmizA9zyp5KhVHPM+7GTVqok1vfxGjGQaNwXwfXN85PlXB+6HLHsaKeW9Gf6NGNnH83JVEF9THTYWPePtBl1B4iWSuZx5/rmmAlF2vc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LtXOaAZw; arc=fail smtp.client-ip=40.107.159.65
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JP7kuoLTliupAxECyz64AVe06Gq3EQ/E/xsW2nCCWHtHk1b9BSo2xa8jtCxzshfjANXzzyAdYzt4HLCdh3Fy+5XoTj3+p/EK38v28r87NoERt7RkxyDkccqF/bN/IcCd1yABvD+eCZjsNNHDBexFsX4Y6gTCfsiqG0SQRWNqaumLYnjptYO2D15vp4uvJGAXgfmclApOCjKS79vJ6Hb/50/pl5dEWckfTlwmVCQJGI2U6SVEYl0z0hS6ZDQLfJnRcrtDfVwYOrT5l7hZURcdUOTxRFmIM2ALJCnkXQ6U1KnT8zAx9a0Qcsv/An4fL4YhBZ9P4qLABpaK0uLHPZoA/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pn8S8kSlxWBZYe6I9dUisZDypIMnFOpvLaM8pSVZR+Y=;
 b=unja/LNLDHvYu1bjYCbCeJ1rcjo/zLAVq0rffkNSxKLz6YdV1hdhUfkdOUSOqvvOinVz7vk5nB0kndDPmG/bGcp+A5hbQ0dhwxI+incpXi3kBYKF+bioClobCs8Z1Pk0SRniRQ+ro9jKgWQNmnR9WrtCKiMX93xRP4KyWXat6mmb4NexiqXetCGbpiqqNiE4dZ8IsdpwMPF5e7kz8hkPSSylHp+pe1f5hDFkJDYVzYDfomGKgrV3/vFi9dkH0nhjMG2n2dBmiVjrvv9kXeZFzYd0SdOMflPpa70VcfNOJFxfslHxQmUYKqHInpXWFipDMBC3BlzwH5Fg/txKIcjKHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pn8S8kSlxWBZYe6I9dUisZDypIMnFOpvLaM8pSVZR+Y=;
 b=LtXOaAZwVKayjK2RpD9aq8ZXo27Rei99P3kAtSKS0fLIXyrswfzE5sd0spW9AHHZRDxHtu/AAcf0Kr+C/tyoq3x+1/tmyMriC9UVabS/8/0zLYUvYpu+bw2zQJmVTKRkvhmVoDbHcFCev1h9dj9Tol/ewP7Cm68uq3cGDrL+r/EUEQPYAsDfyqqo5tZ/hWlfNpyF24a9+sAIOgc814TyTDJa8HbEoRBtnGAxuU6NtYDxiSzjMZJZRF3hHJOsULEFLUHSCa9bTh6QG8eOxltZuBIgcb3RF9A56WVa1JK1hhLIsXdxbEHgoLMvSVNkJiKF6ioaHI4c2tQh6Jtbbl/W2A==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8227.eurprd04.prod.outlook.com (2603:10a6:20b:3b4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 19:50:57 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 19:50:57 +0000
From: Frank.Li@oss.nxp.com
Date: Wed, 17 Jun 2026 15:50:18 -0400
Subject: [PATCH v5 8/8] arm64: dts: imx8qxp-mek: add parallel ov5640 camera
 support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-imx8qxp_pcam-v5-8-7fa6c8e7fba7@nxp.com>
References: <20260617-imx8qxp_pcam-v5-0-7fa6c8e7fba7@nxp.com>
In-Reply-To: <20260617-imx8qxp_pcam-v5-0-7fa6c8e7fba7@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Martin Kepplinger-Novakovic <martink@posteo.de>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781725817; l=3773;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=V6G3zqx+tgMOsXyT5WGWuzLbZFf0v8KlmXNNbO3GwxU=;
 b=iAKVJZjdxa/dCM8Y5DXkF0Z7k4VsB7RRvsAI6To2zE7eRtJZXw5bc30tcWSUOhyG7bScmtgfW
 GBJS9MoFQQMCsjJsA8KneJHXOdSlhr1hisrwh8CMlue8/ZFwCYGoNWg
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SN6PR2101CA0006.namprd21.prod.outlook.com
 (2603:10b6:805:106::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8227:EE_
X-MS-Office365-Filtering-Correlation-Id: 0de49cbf-a0f8-4d7f-5dc0-08decca9bf8a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|19092799006|23010399003|1800799024|18002099003|22082099003|11063799006|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
 JAf2POVFG1GJBQHabffTDLyCRLqv/4WqnzrsWcNyxtIs1Re6YpkCogVptVJKBZQ/HT3aY6B03iRcNqRJi9muxmsmoYiIffmuf8QrRWJYPiCBFa0Pp27esUvz9VVjkyTcyus2QjZSdM8cpqi/Arbg3TNY6QIyRxxYBbbIsH5fUHVwsewMnvoqZMoFdLHxwIGyh7a30Cxsf9xTHt8DX3IT1Qer84iZCx/WHzSN3JGFZOXtdPEkpxqXaD8++TYmfnVxCIB4/N2fMPvYX04Z7ms+c4Bp6ONRfiwW6h7pEPAo/dRCF2uwsT+DhyAux/6/fAIp/191wnzzZJ8E49rvDVn4HDh0Xc+9B1a2YpixzLvxYQMnM0eNT4fK4DhaCRJgTtumCOWa8AKqj1CdEzC953vk4cbl7QGhj6pB6vP5srLwvyHFUQNLedLJN2CHudiWUb/5DiYJpN2uDpux39yrYUbYzhYylx0vw9Ngiu4cv84ucNrw12+e/wG/FUtdFEXVH3zhbR78nZBLituO4YgWRYpKp/G3QsSW3t+Gp5MakY/AkpkOwZOtmi7wBzu/bRqKfXPotYbS03t+QlzgFJrznJ/0Mj+YgnPArLTFdEKarrlCNhOuPvECPVX7SbuOkmLE53g0ZtfZITZbu2iDlCYAFR7puqG8i7l5dqScvQIF5vQV+U/4AySZQ9tITIP1eeW9mpe0x1bN6ljzMnmalypDGmwV/Z3Yb0Lp5bjFfThiOOmZpI8=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(19092799006)(23010399003)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?NStMTDZBVjN6VHlJbnAyVlZ0eWpSY2RwSmo0aHhKc2U1MGt0UmNWbklxdFBO?=
 =?utf-8?B?V09WTHFXWVhCblIxRUxBL01OSWxoQUtKQ08rZnhPWTBQN2tMbTg4TDcvcS9C?=
 =?utf-8?B?RU5ETnNENDdMR2VtY0s5dG9qaVFEVnZmbTYwM2FrK3pJRHQxQU5sQ1A1ZW5P?=
 =?utf-8?B?QkZiS2w0cFE1UnhFL1RYUk5pYTRUbDRCRmVkOXdJQjltZ0xueVQ3aVFoTTV2?=
 =?utf-8?B?K2dwN1VHdXpRa3ZnT2dQVnh3NE4vNjhuOVF5SGhnVVNxdHRMWG1qL3BqTXZT?=
 =?utf-8?B?RDB3U3gvSHNCb2d0SCtkNUk1N0JtSVlWTHlacEVrZXlNSkVob2ZWQmFpd1o1?=
 =?utf-8?B?U1VpQSt0UXBPbFRIYTJ3L3hjY045TEhFd2V5WTFpZkR0aWhhSHhXZ0NoQyto?=
 =?utf-8?B?L1NQbHVDemdTVVlUVDdublNFVTZnUE40dTJzSzVaZlJhdzVHc0dHTDRHTWl3?=
 =?utf-8?B?YVVWV3F2eG1pa0tQdTZmQlBuNFpxeVVIdlkzRzViVUYyRkJBaUpVTXZDbmE5?=
 =?utf-8?B?M0tvQkJVQ2p2U0tESUdnTUZMdjYvaXJrdW1zdFJFcFAzSGJ6UHF1cVYzb1pw?=
 =?utf-8?B?ZFFQYkJIeUE1Q3UvTmtHeGtHQjBJbmhPTXduejE1WFNaU01YT2ZBVThueHkv?=
 =?utf-8?B?ZFpESzV0TGUxOWxmbWYxTWhmSHBUUzQ3SitlSVpFRHMrYk1TWndXbDRhMStQ?=
 =?utf-8?B?ZlFMdE54WWwrSmpBSU52MjJRRnVZTzRTNmJ4WkpHSVQwR3NCbHlBNjZMcTZW?=
 =?utf-8?B?UVNCNkQ5V0tuSW5kV2kxb3FaNGZTZ3lqY3J4SXlabDhjWGRWSG4zUkh4R3E0?=
 =?utf-8?B?WTh3U3hxWmFMS2tKZFl6WGxPcGx5andsRVJRckZGNlk4MlYyQXNSMldDdTVS?=
 =?utf-8?B?YnBoZVd6NGFZRkYxSGo1NXdON2xUL2xSaklNVlZ4a2lZb1BlUmIvaWpkcnh2?=
 =?utf-8?B?V3dkQ0gwWklZWERyZit1ZGgwRURKd1Zhd2pOQXNmL0g2NVNzWkhJb3p4TGlG?=
 =?utf-8?B?WVFoNWhGL0czaGRRbWE1RHUzaEVza2NMZXVGM2NlU1hmcFlHRnlkQ1dOYVk3?=
 =?utf-8?B?NEhCeVJKMk0yRG83NHJEV1NtWlZXYjY1Sys1WXVwK2ZNV2p0SHk5MW5LUGMx?=
 =?utf-8?B?eXczN1JLK0pDNFVwZUwwNkxMcElZemphWUcvdkd5TndIN0UxM2hTK3N5Z2Ur?=
 =?utf-8?B?Q2dZVzBpNytUZDJUQktrTHVLWWMwWHRjYkg1TkdObWFxVVFTNDVMY0VZOVR0?=
 =?utf-8?B?SEtIakRnZC8xTjI4R1NlSzVPR0ZGMFpKOUNESGhYUmp2MDN6V2ZMdy9WaHlW?=
 =?utf-8?B?ZWhQMnE2dll4UUJyOEt3Z1JuUUtsaE9PdGorVlVkUTFCaDJ1RGpuV1FpTzZV?=
 =?utf-8?B?bEMzN1dnUnpkVTQvRkNXVjNYZlo0T0VvVDR3T2RwdWF4ODhwWWR2NmhUanIx?=
 =?utf-8?B?dmd2MElTYzVCNm1JWEMvYUpzblkxRjhtT1FWTGwzOFgzNWo4SU14Q2o2UG9q?=
 =?utf-8?B?VVNHQnYrbXpiRlVwRmhBMFU5OFJIem1IdnEvKzdiblpYVUFiajV5aHRUdnM1?=
 =?utf-8?B?WStWcjM2b3ZJd1ZGaHVsK2NBUHNVa0FLaDNUYlg3OHU4NUVNelBLQzhBYmd5?=
 =?utf-8?B?MWU1ZHEvZHluQU1kRkVhbGZXeGZ2VC8xSG9SQWhzRHowVUY5SGxkaG5jQUpi?=
 =?utf-8?B?d2dTRFVBL3ducUlxZlpURDM2czFhV3J2azZkYUZnRjU1QU9XaUxjOG9CUitt?=
 =?utf-8?B?MnhNbkIzYlcrcWo2UExxbEsraUNoVlo0NTZRMk0vdjVzUHcxY3pBY1VNQ2xP?=
 =?utf-8?B?UENIQW5UOWJKRzQ5aVJpSzIvMFhnNUMzNVFwTjkzZGFCd3NvRDVzWllsY3Vs?=
 =?utf-8?B?cGwxK1kzU2phT05qRjhkenRTd3FDa3MyMDVLcWswZmhEK3lzSG9jYUNzU3g4?=
 =?utf-8?B?NEpFc0pScTA4UlJzNk1ja1FYcEtHRzBVVDluM2hHc3pEcDVQVmMxazltN2RR?=
 =?utf-8?B?aEdMLzVwa1lCb2xST3hxcmU2NEpTQzV6bXpwZ05KUi9panFGZUpGZGk4WGp4?=
 =?utf-8?B?cjRvaDhwNXlQRnVSdTEwMFBtWFlEbmR6S3p4a0VnbkwvUWJqZEoyYTVFcjk4?=
 =?utf-8?B?bHB3Tlhuc3FKM0dYcmZxR1hNQ0EyaHlaUXVYaEtNQmFtTHNpc0Y5SGtVNno1?=
 =?utf-8?B?VFZoS215cGx3STg4ZTU5R1RabVpzaWRVakxlTDRPdWErd1poZkdwTStWem5M?=
 =?utf-8?B?TXh4Tjd2MTB6S0RncnozeklpVTlNVUVuMFRCdGlMNGZiS0hPcTRiWjBiSitY?=
 =?utf-8?B?MGQ2VUxpQWJZOU15UGVWTml6bzhVeFVQdVc4R1lNWHlOVmd4K0tLT2IrbkRK?=
 =?utf-8?Q?xhsP1dyFBmzDfl6/0f24Tm+bNoefVKJp20QIN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0de49cbf-a0f8-4d7f-5dc0-08decca9bf8a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 19:50:57.0070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JL8O/LavdpF2taDjtU49jin41US/zMU6hwGhK8Pan/pTIq2FXeCfz260dU76OV2zTEotL3rkw2KgVs1bgbZ72NvqeKWMDcLd8xt47qc00pP5wblgRCJsCyOPzXfyxMWi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8227
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:michael.riesch@collabora.com,m:laurent.pinchart@ideasonboard.com,m:Frank.Li@nxp.com,m:martink@posteo.de,m:rmfrfs@gmail.com,m:kernel@puri.sm,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65144-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,collabora.com,ideasonboard.com,nxp.com,posteo.de,gmail.com,puri.sm,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.nxp.com:from_mime,nxp.com:mid,nxp.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4C88269C414

From: Frank Li <Frank.Li@nxp.com>

Add parallel ov5640 nodes in imx8qxp-mek and create overlay file to enable
it because it can work at two mode: MIPI CSI and parallel mode.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
changes in v4
- add hsync-active = <1>

changes in v3
- replace csi with cpi.
- use imx8qxp-mek-ov5640-cpi.dtso since csi use imx8qxp-mek-ov5640-csi.dtso

change in v2
- move ov5640 part to overlay file
- rename to imx8qxp-mek-ov5640-parallel.dtso
- remove data-lanes
---
 arch/arm64/boot/dts/freescale/Makefile             |  3 +
 .../boot/dts/freescale/imx8qxp-mek-ov5640-cpi.dtso | 83 ++++++++++++++++++++++
 2 files changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 001ca3a12c0ae..3b9e9844f11ef 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -554,6 +554,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek-pcie-ep.dtb
 imx8qxp-mek-ov5640-csi-dtbs := imx8qxp-mek.dtb imx8qxp-mek-ov5640-csi.dtbo
 dtb-${CONFIG_ARCH_MXC} += imx8qxp-mek-ov5640-csi.dtb
 
+imx8qxp-mek-ov5640-cpi-dtbs := imx8qxp-mek.dtb imx8qxp-mek-ov5640-cpi.dtbo
+dtb-${CONFIG_ARCH_MXC} += imx8qxp-mek-ov5640-cpi.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqps-mb-smarc-2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8ulp-9x9-evk.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-cpi.dtso b/arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-cpi.dtso
new file mode 100644
index 0000000000000..9fbdd798f17d6
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-cpi.dtso
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8-lpcg.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/pinctrl/pads-imx8qxp.h>
+
+&cm40_i2c {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	ov5640_pi: camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&pi0_misc_lpcg IMX_LPCG_CLK_0>;
+		clock-names = "xclk";
+		assigned-clocks = <&pi0_misc_lpcg IMX_LPCG_CLK_0>;
+		assigned-clock-rates = <24000000>;
+		AVDD-supply = <&reg_2v8>;
+		DOVDD-supply = <&reg_1v8>;
+		DVDD-supply = <&reg_1v5>;
+		pinctrl-0 = <&pinctrl_parallel_cpi>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&lsio_gpio3 2 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&lsio_gpio3 3 GPIO_ACTIVE_LOW>;
+
+		port {
+			ov5640_pi_ep: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
+				bus-width = <8>;
+				hsync-active = <1>;
+				pclk-sample = <1>;
+				remote-endpoint = <&parallel_cpi_in>;
+				vsync-active = <0>;
+			};
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl_parallel_cpi: parallelcpigrp {
+		fsl,pins = <
+			IMX8QXP_CSI_D00_CI_PI_D02		0xc0000041
+			IMX8QXP_CSI_D01_CI_PI_D03		0xc0000041
+			IMX8QXP_CSI_D02_CI_PI_D04		0xc0000041
+			IMX8QXP_CSI_D03_CI_PI_D05		0xc0000041
+			IMX8QXP_CSI_D04_CI_PI_D06		0xc0000041
+			IMX8QXP_CSI_D05_CI_PI_D07		0xc0000041
+			IMX8QXP_CSI_D06_CI_PI_D08		0xc0000041
+			IMX8QXP_CSI_D07_CI_PI_D09		0xc0000041
+
+			IMX8QXP_CSI_MCLK_CI_PI_MCLK		0xc0000041
+			IMX8QXP_CSI_PCLK_CI_PI_PCLK		0xc0000041
+			IMX8QXP_CSI_HSYNC_CI_PI_HSYNC		0xc0000041
+			IMX8QXP_CSI_VSYNC_CI_PI_VSYNC		0xc0000041
+			IMX8QXP_CSI_EN_LSIO_GPIO3_IO02		0xc0000041
+			IMX8QXP_CSI_RESET_LSIO_GPIO3_IO03	0xc0000041
+		>;
+	};
+};
+
+&isi {
+	status = "okay";
+};
+
+&parallel_cpi {
+	status = "okay";
+
+	ports {
+		port@0 {
+			parallel_cpi_in: endpoint {
+				hsync-active = <1>;
+				remote-endpoint = <&ov5640_pi_ep>;
+			};
+		};
+	};
+};

-- 
2.43.0


