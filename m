Return-Path: <linux-media+bounces-25969-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0DDA2FB50
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 22:03:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A25211886E94
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 21:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A29F253344;
	Mon, 10 Feb 2025 21:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="etiAeGdA"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2050.outbound.protection.outlook.com [40.107.22.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E374253335;
	Mon, 10 Feb 2025 21:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739221256; cv=fail; b=BYWXksfNKwcuLLF/sY53EiRHhxNnVv8USw10tpnY8d6p2RygJYaRSYk+jeoA/PEPp5oiDpl+643afenpc0+6NmpmeLZMFPo7BumHDYXmjcsaQD72oy8Myx3O4Q+y+HmGWnLaoDpnkecpLdK08O3Qh1hBJyYk/SwLu3WXebfObFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739221256; c=relaxed/simple;
	bh=SSl7prdsYwX33Yieqclv3UcCzkCJtLi0NvOduCOyH6k=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=dyYU+MekSXzAVRwF04HphLJQoXzcAer5y43ovnDYfkxcCialrLZTnh2uJDzSkD/jwkdTcolwg7j+IsnFiUAz4CjAnina1pjfvEh6dY8UpM2BZPsn+YXv4eJLKk8sA4/b9/qK4vSxVdGEPUDcv1zj0g/cnWYDBB9Gp5qPFEgZH48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=etiAeGdA; arc=fail smtp.client-ip=40.107.22.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lwfMmqD0yN8UkqrHi4+HfuPDcua1xY/EJQbMwibUnLQCACqfRf6EdlXUMtou8GvB9DSC/YGXw7eoLsfgEHLGNwonufbTDQ3hJTbWK/z78biLeGLstezV2E0blx086fvSz/oiLv6Cm6CC5mVO+H5Zpr/DQjpoOHVB2+gzQfDHwns6bW8m214yCn8m4H5IupVNQcwJ3KkB2hHJ0fdQBCsHsMNVEXo4aBpp+6QSackb3cR44ez0mX6bZheGkeNKi8z+4up6qsZMd8jebKkAV/adZ7Rs9NeEzNhgN1BzZsT7FvwoEwBqGlZZeygFBOcl4KyYCgmhtrXqplKOYKl6N9T0Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZVwgaLKMaFCvrc2TPPaR2R1MyL0cPReWIbORuF/9kI=;
 b=BeLqCWwxSYK5a1R3/BjN6FTpePneYmPeKtrEvv6UOUyKzvY4sl4loODoTh3jg1geBCT0k3dYyeJFKRx1KenBQFi2RP3k0xLBL5OmOKeJ7ksUIO1/qSFk+VY/36DCWlYW0JkcA1yPUzCr1Mh068WChF5TpdFP0vvB+gzJbRQhyLCjpPyrOG1G4mP1k2NMVOEdwdRCTomRxwdLKmLg9Xy8CKc7rJubKdPoKcpBquyYhUReLZfssRNqXjErsn6Bx2Smmq8TxuVq+X2x1a2k4DT9QhiZEgpOqYz2HsD30K5ZMBYYp3f7mB9HqGWhMihIjykgkQmlg9o/aK6ssvVoS2t2xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZVwgaLKMaFCvrc2TPPaR2R1MyL0cPReWIbORuF/9kI=;
 b=etiAeGdAhEiLLAggr2gz33tCpZeg8SIU+r+n0tn5+VS4EFSvLvUsy2eoXnSmT94WyRzTVWScaPNnOPXMm9e8gePhYT9jzTr/Lh3FRCkJ2HZEQ5YPrMvVePmUyVpMTuXCwojsSNjbh7sFhkPwFEU715rr+j9R1Wlko3k68UBElPiDM1vQKyf7VzZEy31kpoX/GY5HF1RRUwlV21ndFzwMmZpNvfoLmafOjqEhsY1CG5d+hvB3Z/4ldqYCX8wlMW4UGAbLRoATb0cOck+AdlBfisE5L3J0v++9zTX+hZiPeRwRfwHvMtJgdGrKFHqzl1ActNisQMdxn3iyCA6v7bFc5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB9PR04MB9474.eurprd04.prod.outlook.com (2603:10a6:10:368::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 21:00:51 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 21:00:51 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 10 Feb 2025 15:59:31 -0500
Subject: [PATCH v3 12/12] arm64: dts: imx8q: add camera ov5640 support for
 imx8qm-mek and imx8qxp-mek
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-8qxp_camera-v3-12-324f5105accc@nxp.com>
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
In-Reply-To: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, Robert Chiras <robert.chiras@nxp.com>, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739221181; l=12190;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=SSl7prdsYwX33Yieqclv3UcCzkCJtLi0NvOduCOyH6k=;
 b=KgSdalDag7UVXDyIzphhbWgTRrc8hmfUd8swGJNBtwgQ0T7xamFR3tWSl3X55uQy5Q0gp3XNA
 Pgaa+dk277IAIH6assj1lRsaCqY58SJmckxWTOcFDfvZsq3bdeUR/za
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY3PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB9PR04MB9474:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e617b60-dfbd-4de0-29d9-08dd4a16004a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?RkpWMzRHNXlEK0NEelg2YjJjS055VHpxcEtQc0tPUVRqQmFyTk1LUFBpVC8y?=
 =?utf-8?B?d2VMLzY0SFFBeGNuSzZ5TU5UVHZPMzJxT3NGV210cUZBbFAzaWE1NjNrTGd2?=
 =?utf-8?B?RTkzK2RXMUFVUTIxRStuVTg2RGVsQXdmK1prOGFXR3p0dko1VDl4MDVPdG5h?=
 =?utf-8?B?K3BaWkdSYnE2WDE3emdISGYzQnRNMlQ3czEyeXhhTTJhNXFuN0lscHFTQ3lN?=
 =?utf-8?B?VVcwL0t1L2ZEcEIvYnZZVzhzYllLVjlKekFub2l5cUgvTG51THgyZVVORnJM?=
 =?utf-8?B?Ull3V2w1TWtYaElHZDA2bnlRNzA0RXFSR2F5K2FBRXg0WnNrNGdKM0x2ayts?=
 =?utf-8?B?Smc3ZzZ5MkNzb29YNDkrbmpoZkdWTVZjdnhMUHNIUFU2aGlPSnJpUStIRW5Z?=
 =?utf-8?B?SnpGNzZmMXJKZTVVcGdCdnhRMHZWbWl1U1dsQTJDSHBxYllJbzFoKytwQnZY?=
 =?utf-8?B?QWRaZFJ5OGJpSU54MWNtbmtHZENydHg5MmRNVHNzUmVFaW9CUG1MMnJCZkQv?=
 =?utf-8?B?Zk9NZWtZL3REVkNXRG5Scld2Wlh4a3VTZ0xwdlhMWGpmdnRjd25MeEsvUVBw?=
 =?utf-8?B?dk9zY25uUjNjZlNkL0t4VE9RUVFOZ0NTRUNBYkM0b0plVEJrdFBhSm5FN0M3?=
 =?utf-8?B?VkdyRWFzYUJHYTNINXp1UkNnajd5RWlqWGlsdXBKVjNPVGpUOVgvajUvMXlr?=
 =?utf-8?B?WlNRZVFKRDdTZHo3Q0QwL0pKWDM0K21wVCtTSXdhaGZDcmVSamU4bnZkTzRG?=
 =?utf-8?B?QmpjYlBhNjJwNjR5ZURzMUE5eGdzSEJKOWxWRGJOellYOHFNd3JLUjFiTStO?=
 =?utf-8?B?TXkvV1JpTE5iS0hvcEtBTThQMkJTS2xpQlBEV01Ed2tKT2FlenhlQWV5QzM5?=
 =?utf-8?B?eld1THYvSlEzMS9sZDRZQWRyRXRPUlBtR0I4UDNiYlI5YlQ2T2VjYktrZHhN?=
 =?utf-8?B?Z3dLOWNkVFR4SkFoSWwwZitiYkd0RnN3amJPbmN5Ly8veDE5OFA5VTFLWUhn?=
 =?utf-8?B?Zld1UFYyTjczeWRUMkovYmN5WXBOeThVZHF5d21EdnhCdTNEbEpHbGdJbFpI?=
 =?utf-8?B?SG9QalpJTUw2cGxEcVJMcDdOOHpMeWp4WUtYTkxyajd6cVlnOTlmYkt0ZEhy?=
 =?utf-8?B?eUFZK1M1R29zYTAvTmhLKzVIU1ZsQzlFcmJXbWFaNVI2b2J5VVUwZC9xOVZz?=
 =?utf-8?B?bmwxMndzQzdna0lVMFYrR2krRWhzNUJqQXYyaXU0L1dUWlNCOTJDTHhyMUg5?=
 =?utf-8?B?R1g3c0h3bWlxcGltbUM4WFlkcHZlbHo2YjZnNDAvZ29JUnZEYjMxd21NZUZJ?=
 =?utf-8?B?Y0M0S2wxM28zV01ZYjVLWUV3L1BEQnRCVGl2ZHNaaXh0V1BBVUJOMzlmMHlX?=
 =?utf-8?B?Tkt6Y2hkMnl0RmtrU3RYaGIxQmo3Qnc0bkRkY2hoWS9DcndWaXJZdmlOUloz?=
 =?utf-8?B?L01KOU04ZjN6NHVzNllKbFR6dkRKbmZ6c214NGNnQ0NxRUQwTlorN3RoNEh0?=
 =?utf-8?B?K1duN0lVOXdocENFWkt4L2EzM2h0VTZSdGg1dFpRYWVZelpkV3ZKYmZIL25T?=
 =?utf-8?B?NjNISGZUSjZSSnpiVk1zbEVqbDBBMElTRGlTZis0M3QvZ092ZHVUTjNSclls?=
 =?utf-8?B?d2xWSTZ0UlZXL2ZReWoyN3dSM1ZsSlRnejJoQzM3MWVGblppNHp1ekUyK2N1?=
 =?utf-8?B?N1J1UGlQQ3lPbHNjTUdkMEdvUkc1OHhrdkk0bGFaT1BFVzdqZ0V2RS9aZjhl?=
 =?utf-8?B?cWhLRzl3RGpOdlQyNGlNOG4vMU1tdTJzMUdMODJtM3VBSGJpUlJLdjFvVkdy?=
 =?utf-8?B?c1MzRHpmNytIVDdkZnlwRHlVQWV0RDk4b1hGSWNaMkU1S25LMjZZSzBpZUFi?=
 =?utf-8?B?cHFVYkdtc3ZYeWhQSU9CekZPd3RDZHVvblFla3lIU2svTXJVVWwzQzU1ZWFo?=
 =?utf-8?B?b1JObWo4NWh0dGpTanNmYTV2YXd3YlBzcXRyY3Zpdng1T3cvTFhVc2t2YXZG?=
 =?utf-8?B?cEZyS1lmSTJBPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Q0ZEbmdnVWEweVpMMzg3MUJleUtkVERKb2tTLzhmNXJRdHN2VkRhQ0ZSQk40?=
 =?utf-8?B?bEFRaW5PWHdEU2Q0Q3pkMWhHWlFSZFFYV1FXcVRaYXoyV1kwYUlrVTFwdzJ1?=
 =?utf-8?B?dFYrcjZZdGhzY2JsbFBQQjJZRjdrRGJ0YS9GSXVrcXJvQUpSVWhPeG9vVlNw?=
 =?utf-8?B?dkgrZ0pBMnVRS3Z0OHQ5T3JXeGszQVIzb3NnVzhxRXlDQ0xYZDZSZXZQLzBu?=
 =?utf-8?B?VE5KcEROVFJmL2tGUmVZRTB1cFFGNjlYajlJSVRxWGdiTGVuZTJZUTEvdWQ2?=
 =?utf-8?B?V2IreFJPKy9NSVlVellLOHpIUjhhNWQrZWZId2NrZ25MOE5XNGJiRTM5eDE2?=
 =?utf-8?B?NG1wd1lEbFNtMm9JVWlQS3h1dnVNTzBiU3NtMnJYVEFURnVybWdmNHlSVFZN?=
 =?utf-8?B?UGVnUG4vVWh6bm55QlhiZXNPRFc1TTJOMXkrU3cvaUxFU2RKQmE3V3JuNHky?=
 =?utf-8?B?eVhNdHVPNVVybGl5dUk1TUdWaDNFOGVmTjNQbG1lZ2JzM3RVbTlPc2hQckpK?=
 =?utf-8?B?RnhXNUIrODgwZU5JY1Vhb2NoT2ZZVjBVNldNWUZ0ZGdJWnFEWFl6Vk9ZNXE0?=
 =?utf-8?B?V2JvSDVjcUtIOFpxSUdTbmV1Sm83KzVjbmw5SkllbFpQb2k1NVM0L3c3ZTkz?=
 =?utf-8?B?cFZiaW1FaHpmSXFSL3lFdzhHMEhzUnVQQUhkKzJhay9aTm5FK0d4dzZieEdo?=
 =?utf-8?B?UHRSU1BFS3g4N21FUVF0MWlkTEpvdzBZMXJ5dG1YdnNEZXVCci9WaEtqSTR4?=
 =?utf-8?B?UkU3akVVazRmU1FNYjY2SGlJcWtzSE0wb1Vybkx3RGczYzFqWjBaVitYdmc5?=
 =?utf-8?B?VGxjTHBZTzZpYjl3d0NCNC93T0FjdlBWVFdSYkpQQWxJa3NVRytaNUF1OEEy?=
 =?utf-8?B?MTFiRDFaNHo4WVpyN1ZVNXJKTC92YW00MGNkeVE5cUg1bVN1djRLQjd0Znlj?=
 =?utf-8?B?RkJPMVJPdXk3S0lRNG1IS09QOUMzMHN3a2pjc2xVN0c5aDZaaFBhTnlyQWQv?=
 =?utf-8?B?QmZvRjg2bitPc0RKVWpQUnhZSTc5RXBIQjNPN3EzNk8vVXRNelluYjNhbWhq?=
 =?utf-8?B?ZGptTUwwWStmQmhlTjcrR2dnbHQ0V213bnloa3ZGUWFXSHZEM3p3QnJqVGRU?=
 =?utf-8?B?dktyWFJSM0dLR0VxZWJrTHFkdGZvOEtnTldRVnhEM0IxdzRLeEZ4ek9rM1Mw?=
 =?utf-8?B?SHh6V0V2eWlDVW9ad3ZtU290TlhqU0hXT2dlaTltaDdjeDVFODhRenUxL0o4?=
 =?utf-8?B?L1o2dU1IQU40KzJtZmN6RjlGVWprMHJMVU1mVE9udEZCWkk4aE9YbFNsWTQv?=
 =?utf-8?B?VUFWOUh4UkV5dzlmU3JOd1hLc3VsWkJxVU1KSEFTc1pPQlhrZ3B1d25NUW9j?=
 =?utf-8?B?T29BbzFvanBrbUh2bXcvRUVqRjU3ZHBBYkJkNDRhY1BFZjA5RlRFOWFnVXNQ?=
 =?utf-8?B?dFpGeVVBWjB1bzY5OGE4NUVkS3VqRU5Rd2pxV29hOVFyVEkyWkhFTHBUN3h3?=
 =?utf-8?B?VEZOaWQzZjk4aXNibzVSdXNUSHJ3QVNJZ1R4YmlEY3dUckNBRHRNWCtkTjUw?=
 =?utf-8?B?ZnZWa210aWd2cFZXMCs1b2o0NUtBQys3RFh0Zm5uaWI1N01TVmFlbWtCSm1N?=
 =?utf-8?B?cENkb3dCb0RoYjlNem4yeTNaR0paRTNIWGMvSVo2NGh1eERjY0UySmhiMXJL?=
 =?utf-8?B?Wi9yWENkbUJCV0tPeUJuWGxQM1lrY0NxN2x2cE8vWTRzY1g1U2k0RUpnaU4z?=
 =?utf-8?B?WS80MW0vd1ZSL0c0VFlMa0F6UWJvOGgyT0wwM1JiNVVDOHR1Q0NvRjl3bDVU?=
 =?utf-8?B?YWlqMTFBV2szRjJpdTVmVm9KWFFBODdyS1Nzbm1ZSUxFb0FicmFnZEtsOFJa?=
 =?utf-8?B?em9XOHVQVFpVcDBqNkl5UjFzSFk0Y0YxWFhTVXRyY3MzcDBSMDRHOWpleVdn?=
 =?utf-8?B?RHRhbzZ2aTdFSTF4YVNOMmpZcE9tMjNaOXcvRWduOU8rQWplSTNZd2R2eUNW?=
 =?utf-8?B?VHBQZGE5RmhlVFArNEhoSXVOSkNjYWwvU2Z2cHY5dUc3SEM1dGFrcEZ6ek4z?=
 =?utf-8?B?MS9ub3hvbm9ISnZtOXBHWVYwcS9LS2NYeFpRZ1RHY3dhVG1QNmpBRHJPVFpF?=
 =?utf-8?Q?h6AI=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e617b60-dfbd-4de0-29d9-08dd4a16004a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 21:00:51.2259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: db+Ia/OIMSZN396Pe4QDo4afmeKiIc/jSAuKe2mAP05vxVL3l6GFvDOuca3M9eow2xU0+cD2+J7RfkDBKp8oNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9474

Add ov5640 overlay file for imx8qm-mek and imx8qxp-mek board. Camera can
connect different CSI port. So use dts overlay file to handle these
difference connect options.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v2 to v3
- remove phy nodes

change from v1 to v2
- none
---
 arch/arm64/boot/dts/freescale/Makefile             | 12 +++
 .../boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtso | 90 ++++++++++++++++++++++
 .../boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtso | 90 ++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       | 51 ++++++++++++
 .../boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtso | 89 +++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      | 36 +++++++++
 6 files changed, 368 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 839432153cc7a..d1cbc08eb3f4d 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -261,12 +261,24 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-eval-v1.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-ixora-v1.1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-ixora-v1.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-mek.dtb
+
+imx8qm-mek-ov5640-csi0-dtbs := imx8qm-mek.dtb imx8qm-mek-ov5640-csi0.dtbo
+dtb-${CONFIG_ARCH_MXC} += imx8qm-mek-ov5640-csi0.dtb
+imx8qm-mek-ov5640-csi1-dtbs := imx8qm-mek.dtb imx8qm-mek-ov5640-csi1.dtbo
+dtb-${CONFIG_ARCH_MXC} += imx8qm-mek-ov5640-csi1.dtb
+imx8qm-mek-ov5640-dual-dtbs := imx8qm-mek.dtb imx8qm-mek-ov5640-csi0.dtbo imx8qm-mek-ov5640-csi1.dtbo
+dtb-${CONFIG_ARCH_MXC} += imx8qm-mek-ov5640-dual.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-ai_ml.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-aster.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-eval-v3.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-iris.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-iris-v2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek.dtb
+
+imx8qxp-mek-ov5640-csi-dtbs := imx8qxp-mek.dtb imx8qxp-mek-ov5640-csi.dtbo
+dtb-${CONFIG_ARCH_MXC} += imx8qxp-mek-ov5640-csi.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtso b/arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtso
new file mode 100644
index 0000000000000..cfd599db997b9
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtso
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interfaces.h>
+
+&i2c_mipi_csi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <100000>;
+	pinctrl-0 = <&pinctrl_i2c_mipi_csi0>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	ov5640_mipi_0: camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&xtal24m>;
+		clock-names = "xclk";
+		pinctrl-0 = <&pinctrl_mipi_csi0>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&lsio_gpio1 28 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&lsio_gpio1 27 GPIO_ACTIVE_LOW>;
+		AVDD-supply = <&reg_2v8>;
+		DVDD-supply = <&reg_1v5>;
+		DOVDD-supply = <&reg_1v8>;
+		status = "okay";
+
+		port {
+			ov5640_mipi_0_ep: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&mipi_csi0_in>;
+			};
+		};
+	};
+};
+
+&irqsteer_csi0 {
+	status = "okay";
+};
+
+&isi {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@2 {
+			reg = <2>;
+
+			isi_in_2: endpoint {
+				remote-endpoint = <&mipi_csi0_out>;
+			};
+		};
+	};
+};
+
+&mipi_csi_0 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			mipi_csi0_in: endpoint {
+				data-lanes = <1 2>;
+				remote-endpoint = <&ov5640_mipi_0_ep>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			mipi_csi0_out: endpoint {
+				remote-endpoint = <&isi_in_2>;
+			};
+		};
+	};
+};
+
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtso b/arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtso
new file mode 100644
index 0000000000000..199a79e98d88b
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtso
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interfaces.h>
+
+&i2c_mipi_csi1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <100000>;
+	pinctrl-0 = <&pinctrl_i2c_mipi_csi1>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	ov5640_mipi_1: camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&xtal24m>;
+		clock-names = "xclk";
+		pinctrl-0 = <&pinctrl_mipi_csi1>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&lsio_gpio1 31 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&lsio_gpio1 30 GPIO_ACTIVE_LOW>;
+		AVDD-supply = <&reg_2v8>;
+		DVDD-supply = <&reg_1v5>;
+		DOVDD-supply = <&reg_1v8>;
+		status = "okay";
+
+		port {
+			ov5640_mipi_1_ep: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&mipi_csi1_in>;
+			};
+		};
+	};
+};
+
+&irqsteer_csi1 {
+	status = "okay";
+};
+
+&isi {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@3 {
+			reg = <3>;
+
+			isi_in_3: endpoint {
+				remote-endpoint = <&mipi_csi1_out>;
+			};
+		};
+	};
+};
+
+&mipi_csi_1 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			mipi_csi1_in: endpoint {
+				data-lanes = <1 2>;
+				remote-endpoint = <&ov5640_mipi_1_ep>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			mipi_csi1_out: endpoint {
+				remote-endpoint = <&isi_in_3>;
+			};
+		};
+	};
+};
+
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index 61ef00f4259e1..3a6e25e08c26a 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -155,6 +155,27 @@ usb3_data_ss: endpoint {
 		};
 	};
 
+	reg_1v5: regulator-1v5 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v5";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+	};
+
+	reg_1v8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reg_2v8: regulator-2v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "2v8";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+	};
+
 	reg_usdhc2_vmmc: usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		regulator-name = "SD1_SPWR";
@@ -727,6 +748,20 @@ IMX8QM_SCU_GPIO0_03_LSIO_GPIO0_IO31			0x0600004c
 		>;
 	};
 
+	pinctrl_i2c_mipi_csi0: i2c-mipi-csi0grp {
+		fsl,pins = <
+			IMX8QM_MIPI_CSI0_I2C0_SCL_MIPI_CSI0_I2C0_SCL		0xc2000020
+			IMX8QM_MIPI_CSI0_I2C0_SDA_MIPI_CSI0_I2C0_SDA		0xc2000020
+		>;
+	};
+
+	pinctrl_i2c_mipi_csi1: i2c-mipi-csi1grp {
+		fsl,pins = <
+			IMX8QM_MIPI_CSI1_I2C0_SCL_MIPI_CSI1_I2C0_SCL		0xc2000020
+			IMX8QM_MIPI_CSI1_I2C0_SDA_MIPI_CSI1_I2C0_SDA		0xc2000020
+		>;
+	};
+
 	pinctrl_i2c0: i2c0grp {
 		fsl,pins = <
 			IMX8QM_HDMI_TX0_TS_SCL_DMA_I2C0_SCL			0x06000021
@@ -905,6 +940,22 @@ IMX8QM_LVDS1_I2C1_SDA_LVDS1_I2C1_SDA	0xc600004c
 		>;
 	};
 
+	pinctrl_mipi_csi0: mipi-csi0grp {
+		fsl,pins = <
+			IMX8QM_MIPI_CSI0_GPIO0_00_LSIO_GPIO1_IO27		0xC0000041
+			IMX8QM_MIPI_CSI0_GPIO0_01_LSIO_GPIO1_IO28		0xC0000041
+			IMX8QM_MIPI_CSI0_MCLK_OUT_MIPI_CSI0_ACM_MCLK_OUT	0xC0000041
+		>;
+	};
+
+	pinctrl_mipi_csi1: mipi-csi1grp {
+		fsl,pins = <
+			IMX8QM_MIPI_CSI1_GPIO0_00_LSIO_GPIO1_IO30		0xC0000041
+			IMX8QM_MIPI_CSI1_GPIO0_01_LSIO_GPIO1_IO31		0xC0000041
+			IMX8QM_MIPI_CSI1_MCLK_OUT_MIPI_CSI1_ACM_MCLK_OUT	0xC0000041
+		>;
+	};
+
 	pinctrl_pciea: pcieagrp {
 		fsl,pins = <
 			IMX8QM_PCIE_CTRL0_WAKE_B_LSIO_GPIO4_IO28		0x04000021
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtso b/arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtso
new file mode 100644
index 0000000000000..0546a2dc2a543
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtso
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 NXP
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interfaces.h>
+
+&i2c_mipi_csi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <100000>;
+	pinctrl-0 = <&pinctrl_i2c_mipi_csi0>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	ov5640_mipi: camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&xtal24m>;
+		clock-names = "xclk";
+		pinctrl-0 = <&pinctrl_mipi_csi0>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&lsio_gpio3 7 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&lsio_gpio3 8 GPIO_ACTIVE_LOW>;
+		AVDD-supply = <&reg_2v8>;
+		DVDD-supply = <&reg_1v5>;
+		DOVDD-supply = <&reg_1v8>;
+		status = "okay";
+
+		port {
+			ov5640_mipi_ep: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&mipi_csi0_in>;
+			};
+		};
+	};
+};
+
+&irqsteer_csi0 {
+	status = "okay";
+};
+
+&isi {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@2 {
+			reg = <2>;
+
+			isi_in_2: endpoint {
+				remote-endpoint = <&mipi_csi0_out>;
+			};
+		};
+	};
+};
+
+&mipi_csi_0 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			mipi_csi0_in: endpoint {
+				data-lanes = <1 2>;
+				remote-endpoint = <&ov5640_mipi_ep>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			mipi_csi0_out: endpoint {
+				remote-endpoint = <&isi_in_2>;
+			};
+		};
+	};
+};
+
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index 89c6516c5ba90..a356c491375cb 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -90,6 +90,27 @@ usb3_data_ss: endpoint {
 		};
 	};
 
+	reg_1v5: regulator-1v5 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v5";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+	};
+
+	reg_1v8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reg_2v8: regulator-2v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "2v8";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+	};
+
 	reg_pcieb: regulator-pcie {
 		compatible = "regulator-fixed";
 		regulator-max-microvolt = <3300000>;
@@ -749,6 +770,13 @@ IMX8QXP_FLEXCAN1_RX_ADMA_FLEXCAN1_RX			0x21
 		>;
 	};
 
+	pinctrl_i2c_mipi_csi0: i2c-mipi-csi0grp {
+		fsl,pins = <
+			IMX8QXP_MIPI_CSI0_I2C0_SCL_MIPI_CSI0_I2C0_SCL		0xc2000020
+			IMX8QXP_MIPI_CSI0_I2C0_SDA_MIPI_CSI0_I2C0_SDA		0xc2000020
+		>;
+	};
+
 	pinctrl_ioexp_rst: ioexprstgrp {
 		fsl,pins = <
 			IMX8QXP_SPI2_SDO_LSIO_GPIO1_IO01			0x06000021
@@ -789,6 +817,14 @@ IMX8QXP_FLEXCAN2_RX_ADMA_UART3_RX       0x06000020
 		>;
 	};
 
+	pinctrl_mipi_csi0: mipi-csi0grp {
+		fsl,pins = <
+			IMX8QXP_MIPI_CSI0_GPIO0_01_LSIO_GPIO3_IO07		0xC0000041
+			IMX8QXP_MIPI_CSI0_GPIO0_00_LSIO_GPIO3_IO08		0xC0000041
+			IMX8QXP_MIPI_CSI0_MCLK_OUT_MIPI_CSI0_ACM_MCLK_OUT	0xC0000041
+		>;
+	};
+
 	pinctrl_pcieb: pcieagrp {
 		fsl,pins = <
 			IMX8QXP_PCIE_CTRL0_PERST_B_LSIO_GPIO4_IO00		0x06000021

-- 
2.34.1


