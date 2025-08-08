Return-Path: <linux-media+bounces-39156-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A567B1F0C3
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 00:41:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 443D4189944B
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 22:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56E2A28CF43;
	Fri,  8 Aug 2025 22:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Zov1Kq32"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010039.outbound.protection.outlook.com [52.101.69.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA45F28C5AD;
	Fri,  8 Aug 2025 22:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754692826; cv=fail; b=kCfV5k8wX6FE4odKMIo9E77VN/a9AkEK3UPSpV4rgG2WEZ5JSfYaEjTjztuxF9+Z7j9StYS5rDZJLtYmnZKIiFDQ7SqpAzCPaDKqts6+DJ9WJjEH0MtyifqI7/47m/0RhAwW0nG/ICtrIY+mtW1wGDN8LugCXAkDoPyqNP3TXrA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754692826; c=relaxed/simple;
	bh=X0rcS9VlFbAeOp/XgJyugP9v/oXOXqQsIoGwSsXsl8c=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=eoiS3fys5mFkDR8DrKNva7N+C1tE3CMo9viP+rz3e6acdaJMnjJQ7dYVKlSRST8gJZAT+DOsbAlBh9SdZaY65Tj5v/oDRu0je5hAXqnqW96zHa48w66zZ887zyKKtXK+17z3EmP/GUcpuuHmDAtjBtm2woPC/0NgNMSVYFBtgbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Zov1Kq32; arc=fail smtp.client-ip=52.101.69.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZCqaCbn6s0PXFferrsTjmUVcWxIOymuyLfYYWx9vqHHEOV7swiY5eT+AufY8jtqIlOjfyWfEJPgoLga0b3Qrr80km+gJwurcn6I1m1cXIHlTXr3S4HUfG1y8OcGAUl1hy+hjTe+bZeYIqESVwq7KaqWTdk4jFDcFD+1Uo1bAu7myWT4Q2SRBYP7/EoBGo463AcJsKwocmgeqIRDRddIKGeDazvmQ3+yZ11fjzravkwbAXmsS1j4JqQWHycG/kVicERa5P5g+FC6oNTbyiY++aED9VYz6IpGEgeDcZjXEqtx1zAuwr/BEoNW3s3BvyfOG9+pXrioYoOshsB5az8G8Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYFpg+NPKhaNxXArrWUVkQQJ9Ds+FtGkHQq/ixQaosk=;
 b=B7/DJocXAh+X0UhUw4GaktZe2DAKI8D55YRqFQLdN1Pg6UpuAfVOgLPRS8tY4pVWY0kc0VuCSVCmb7PgavYP5izxiwuKC9eI2ijSZ9ncAPTLMQ1bhBeqshF0uoPGT0YH17z1ZSiOfK69EEhgt3EezZ0oEkwx3Nvi0hLohiqLaQUiuNIM5wHJS9Dj8/taV84Co0VOSABIszaRUUyHPERhHJU35JdfLRUQh7FuabZ/xWK2Bxqj+K0wR4RCPctkp5eokQaDDKJaTXKRHAil/zUuddaKG7Z2uAMs7P8Rq35yx+evNdgGNNJbYHOvlJnH5q3Gwa6FHCrSW78iNwsHHsbKzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYFpg+NPKhaNxXArrWUVkQQJ9Ds+FtGkHQq/ixQaosk=;
 b=Zov1Kq325OHx+cFqWRriC5T2cN/Pmr1hTiJsRa9m7Ry0P5Z9y3D2e+MjLOtBVc4Qcjvr7DrWFudUANF5S1Kv+y03/8T1IFoOh7zoWy9ocdSWU4KUT/whW8ejTWXKgVOL/cHp7dYELR+lFc+1SJHanmwTX2So0KWyForHEfvQ2lkegsRZSXBUrx4PM2/af187+anpldFdbHCnyD1q9sAeFnu67Fedrjv50IrvxyOsg2CWllVysZDufbgks63WCU6F+nBhvhfoM8wJTeQ7bCWVgKD9D3Qd2d16KaR0Mz5dSdib8DSHI7jZAf6rslA4F+78YfzerB5sval9IXb37yNDKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10528.eurprd04.prod.outlook.com (2603:10a6:102:445::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 22:40:22 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.008; Fri, 8 Aug 2025
 22:40:22 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 08 Aug 2025 18:39:07 -0400
Subject: [PATCH v2 04/32] media: v4l2-common: Add helper function
 media_bus_fmt_to_csi2_dt()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-95_cam-v2-4-4b29fa6919a7@nxp.com>
References: <20250808-95_cam-v2-0-4b29fa6919a7@nxp.com>
In-Reply-To: <20250808-95_cam-v2-0-4b29fa6919a7@nxp.com>
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
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Steve Longerbeam <slongerbeam@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-staging@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754692792; l=3153;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=X0rcS9VlFbAeOp/XgJyugP9v/oXOXqQsIoGwSsXsl8c=;
 b=kVbFZr3mVepQUfkS7UmqlIKO3h788i28s5l0P7l1pZsgXoRFaR5h+FOwehA6G9GQPA2WTMzyf
 iNEtkc7sR7DBX1zMkZNvHhvABcUNJ8Jyr4+dSpmc879KQtHvBtpqetR
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:510:339::7) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10528:EE_
X-MS-Office365-Filtering-Correlation-Id: 59e57485-97db-4b49-e0df-08ddd6cc8f15
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?QmE3SG91Lzk5SzMwdzdmMFhLK0l6VEFMMnRNVEhkTllKaWoxOUlEckN5TDJF?=
 =?utf-8?B?TUFsLzgxNjJISE9XbmoxUFhCWlJla01oZjBZK0RDWHVIUnEvaStHQkFlajB5?=
 =?utf-8?B?WStRVFJNRmNTMWRGemxNaGVHWThWM1Avb0V2SWZ4WnhjVHpaN3lIcXc5dVNF?=
 =?utf-8?B?c1ROeHEzSDFhd0laODk3ODZkNFBmck5PZklKOXVCRGthalhCdzNSTHJaVnJM?=
 =?utf-8?B?VjlKd250Qk9xVXcyQjFEdEgzTFUrTGorL1c0b2FRaVp4anJYNTBOd2pBZHcw?=
 =?utf-8?B?VUd1L3paaFdoNHVNc2pGa0tRa1pyZmF0KzJnUEg4dFR5T09ITFYvMHZ6YmQv?=
 =?utf-8?B?djE4cmpDZkJBN0ZvN2dyZStOQThpWU5RSFNmdzYzM1ZCUnFEblBuUmN2dmV4?=
 =?utf-8?B?MkJLa21oT2RoV3hnL2JZaXJrVG9wWGUzMndtN3I2MWxYZ2lkRU1kVmdPbi9u?=
 =?utf-8?B?Q29XMWo2NjYxUnhqWG81V0RFaXZ6cTg1alZlRCtWOS9qc0IyTnFFQlg3QXhD?=
 =?utf-8?B?TVNWc2w0Z2FLcTRmTTFzdGk1NGM5ZURRTEFub0thNWxWMkIycGxSenJnS2dP?=
 =?utf-8?B?SmxVdytHeWQ3NWpYU1pBU0dJbzliNEpOSWpOUnBGMEUwZ2FXTm5uTVdWdGU2?=
 =?utf-8?B?K3Z0WjFWZ09aTm1YNkY2SXRIczl3akFwL1hLcUxObTdBdFZ1bTJUQTl4dlhj?=
 =?utf-8?B?WjBxMkFwdUZ5c1A2cUU2T04yQm1mZFlWR29OY2hEOUFmM2p6TGtPdTFXQUFi?=
 =?utf-8?B?NHVlalErN080bTlNVzBjWXRpSzMzMjNsYW1qbGZoZnZuYzJTUFJxYm5pTENK?=
 =?utf-8?B?TkNrQ1VMNzAyRm4xVHdoR2hOSm51dEorZitQL1JPYlFBUWhjZm9yZ05FbGFN?=
 =?utf-8?B?OWtKa2k4elUwZnR4VFkwVlExckxSdVpZNjJpcFVMb3g2eTNyMmRnbE1Xc3hE?=
 =?utf-8?B?YkFnNG5XUkVUdDJLNllGT1ZMV3FSVnNSZXVqTjIwYWhsaUZja251ZUo3eXNX?=
 =?utf-8?B?Q093Wi9WblRUc0FkdzhFcVZIbWU2cE15aUMra01meDhyL3lQRnd0UjJjNUd4?=
 =?utf-8?B?dFJsMU5zbkdyTitKN2lZU0xXQ09udUxUa0hlZGgwQWEyYnc4ZmtXNkdhbnJW?=
 =?utf-8?B?ellkQTQxT0R1dlFoaDV1RU5ULzMwN1NRNFUyWmY5MktYOHBzT0tEcVJmclgx?=
 =?utf-8?B?RUNkcE5CMUJTQU16YWdYSjJOdDJtUUhrUG9BZTBtVGVjUVplcG1YZk5QWThH?=
 =?utf-8?B?cTdCUFBlbnpQR1FsWnZqV1RUY1VPZWlKSVh3YSsrMFZkYzVzYnFZU0k1SzNJ?=
 =?utf-8?B?Q0VaTmVleGcrTU5paVFKTE1iS3VVeFpFRDJhcUgrQjJLci9hbVdwZjFraTJD?=
 =?utf-8?B?RUM3aFNTUTQ1T3ZsRm9GV1RobEJLb0N0RHVXRFp2eExWWTVWMkQxMFJFNHFS?=
 =?utf-8?B?dmZIMExlUHo3R3R3M0Q0Wm5xakQ0QWZiSFZLc1JwMG1jR3hVYkRaRTBUTEta?=
 =?utf-8?B?ektKTTUrcmkzZVhpMFdackhWSXlQVnRaOUZNV0tRbDlGdGNJSlBSVzV3ZEJu?=
 =?utf-8?B?dWdINFhzWWVFbjRRY3huWU5iakZ0SlY3bkhHbHIxcTJYSEFZaVdUSjhEVUpT?=
 =?utf-8?B?RTZONkNKTG5kUktNb0E4WmVvZzZiaU1RVU5GMHJkK2VFbnVzVEQwV2xYdEli?=
 =?utf-8?B?N0hoSkY5NjQ2dHFTa1EwQ3VpWlNQR2ZsSFd0SExyMy8yQWp2ajY0Sm04Z29w?=
 =?utf-8?B?RFo5b0U3bkMvcVdoTmh4bnhOZFZNanZPQ0NMa1QvVUlTc2ZQWUh1aXN3bkJV?=
 =?utf-8?B?Z2FEUEFJOGdJek5KV3drYmtSMmJZc0VyK0pQQkpLcnhxQmhaU3VlSzRTdkxN?=
 =?utf-8?B?MDBWclJmQzhZR1RERUpLQyt0My9DSFFDYWVzWnFlU3Nld3NBTmJGTVNrZzc2?=
 =?utf-8?B?NGVPUUgwclozNDYrMTdpWWtHNzhmRGdzUnFrZUNLZjVGSHl0RGxTWmZCZEwr?=
 =?utf-8?Q?DK5y9t8uPRAMOFIpM2Md1/dtiDuznM=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?aS9aSEgzU1cxUGYwb0xqZkZyZlFSdXpJWmJzRlk4S0M0SzVyVnljbkptMUpY?=
 =?utf-8?B?clNGUWlRQ1VhVHFVbVFnUS9EcXRaM3IybkJyOFREQ3NvQ0x3S1FsSU9MU05y?=
 =?utf-8?B?M3Fndm9sdW5IOG0vWnNwTy9BMzlsdWRUNml6M3dTVGN2Si84VHF4K1MrbStG?=
 =?utf-8?B?YWZySU9zNGRmM3luWnRtaDYrTjEzY1NSRFY2M2p0RUdzK2p3MzZWZ3BjZ0lv?=
 =?utf-8?B?cnhid3c0T3UvUnY3a3dIVklqa05QSDBzRHd6bXBWRjg4RUx1SGkvSDRRZTEw?=
 =?utf-8?B?ZjdOS3J5dVh1TXRYcDFPSC9TTVJTSng3Y0ZKblRSSGdKTkQySzRWa0dmZDJv?=
 =?utf-8?B?MDA3d1FlYWwyRkVRZ2VRVzdrZ005YnMweVVZVUZMV1JaV0pyekpMUzRqTE95?=
 =?utf-8?B?ZGwycm9uTWNKY3pRdVZuL21kWjFKZ2FlYlRENVlTWVh4aG1IUUFKbEg5SzdY?=
 =?utf-8?B?NXBKaTBHem8zVVEzUWR1MVJxbk9kVk9aVGlYa0lGVzNVMXhhbjM1QWtFeHRn?=
 =?utf-8?B?dkJldHJmY29PT1gzM1g1a2owb2h4SklzTXZFYTlYblc4WXEyVjM4bUZudzVn?=
 =?utf-8?B?L25LTHpZOEtjTll0eG52clUzZVpvTkpBN21nZkF3UXZzalg0dXU2L2FzRnUy?=
 =?utf-8?B?Z0JuU21GRGxncXl3UlM1Q1NPR1ZybXQyY1NLamtaYWd1bWx3Qlo0czg3UENJ?=
 =?utf-8?B?QTE4V2htcmE3NjZxcXB4L29Nd3VQNDcyeERjQSt2QS9vcXR0KzJSanJlSFlM?=
 =?utf-8?B?MjQvbGVvQkF1amI4Ukk4dmkyWGllekZVZFdyL0taMDlwelV0YUhwU1E2dEND?=
 =?utf-8?B?Z2VKSzRLb0sxMlhtWU5MbzAra1E0TklqbmhXM1NLVnNTOW1Fc0lCSFRxR1NG?=
 =?utf-8?B?YmJ6cGRxQ1MrODRqSEdOWFhocENna1Y3N3EzV3YrUmIyM1BEYjhOSUF6bjJq?=
 =?utf-8?B?eFIxOWZZamwyWWJTdWk3ajByaVpPQ2gxemlza1NBdkNDZUtXakI5UzVodm1M?=
 =?utf-8?B?NGVGcFA0OHU2aklrMTRpYTI0SUFrSCtKR0REMDMzUjNucXF3MitCeGNXYTVu?=
 =?utf-8?B?a0Z4SXUyLzBVWiswY1FDMW42Q0pQelU4ZmtTZWZhTlYxYXhzaWozRzdPTU5a?=
 =?utf-8?B?MW5sdnk1V091Ly9EU0F6VjBPaTdobW11UjVGSlE1c3FqV0d2R1d5QTRLU3E0?=
 =?utf-8?B?TE1BRkFoMFhhMUk3WXB1VzdmczljbXJTOEZJdXE3SUd4T3lGamxZMm1DYVVq?=
 =?utf-8?B?aG9wOWZOQ3IwNklQazV4eFVkeEhHN2hYbVhhUTRNSmZVWUE2blZzSmdUM1RS?=
 =?utf-8?B?UUlhWXRDOGpMcmd4VUxhVzFka3dtSXZXc3NKNTJJWHhzSjBQL01vTnV4SElm?=
 =?utf-8?B?RVZ5bmFJNXVrMkNHd2Ewa0lhMkpHeTlScTNHY3FHZzA5VkNIYjZ1M01UVFRk?=
 =?utf-8?B?dXVHWExTTURVQ0l5ejVGeDhINEppU284US9uZUxRRlgrdUlqRzMyVm9Pdk1h?=
 =?utf-8?B?dVo5cmNaVUZkMmNDQ3JJeWtFOVhib0Zia0FuV2ZzZmZoVVZPa1dwdWVCVUl6?=
 =?utf-8?B?Q3R4UWljZnhVTkRPUC9QNFplalZCdm5ia0JjZ0NCR2ZOcGE4TWtuRHN0dWxt?=
 =?utf-8?B?TlRHY1RnNDFpV0pjWUphemQxQnllczNyeHZwODVNTWZ5cnlJOWhNQkp4bXRs?=
 =?utf-8?B?dlRjWkpOY1pYQUdQb3lCWVJuRmFpbFVpN3M4eHlzYnd6eVdwL1IrVjVQN25N?=
 =?utf-8?B?d2RVTkUwN1FaWjdNOUh5VkNCcm1ya1ZsK1ZrQUw2RFRHTzZjUnRmbXlPb0Vm?=
 =?utf-8?B?aTJLM2Y0cVdaVlVsVmtzRmNMc1R0YS9LcEd1OTBSOHk1d0M3bnV1MHN2dS9z?=
 =?utf-8?B?bzlTcy9VbldNa1hpUGJlNld5UzVVNTQ2R2Z1aTR2dkdLZmRuWTd4dCtLVld4?=
 =?utf-8?B?MXFNais4N0VjSjAwNFBHdy93S0NaODVZL3lwS0VaUlUvdzRhdGttU3Evb2JS?=
 =?utf-8?B?N3hBQk1pYWRhQ2RhTDJhT1hqUjlnRFpIcHJiV2xEMlFuNEVIb0RaQnFDQUhx?=
 =?utf-8?B?RVpDcHRhNXo2ZWgvcGovZllpdTRCN0cxdUVJdktLNEhKbEVqSTFGQ0lFNmZM?=
 =?utf-8?Q?3iBMTo2rQvkviVDC0udeV7nE0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59e57485-97db-4b49-e0df-08ddd6cc8f15
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 22:40:22.0837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E1LQNpJsTKGAGWw2uR4/uMKfFsZTfVYBvMWxVm/YUDmg04ww8Q2zhUcSHJKgEYXIOsDwshQSuZxdBiX8OARNYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10528

CSI2 data type is defined by MIPI Camera Serial Interface 2 Spec Ver4.1.
See section 9.4.

Add helper function media_bus_fmt_to_csi2_dt() to convert media bus fmt to
MIPI defined data type and avoid below duplicated static array in each CSI2
drivers.

	{
		.code = MEDIA_BUS_FMT_UYVY8_1X16,
		.data_type = MIPI_CSI2_DT_YUV422_8B,
	}

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 44 +++++++++++++++++++++++++++++++++++
 include/media/mipi-csi2.h             |  3 +++
 2 files changed, 47 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 3a48b6a55c6e322696b910dd519def4f0b4a58fb..fcc01030beb347499da2a3c8539793d20f6f512c 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -701,6 +701,50 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
 }
 EXPORT_SYMBOL_GPL(v4l2_link_freq_to_bitmap);
 
+int media_bus_fmt_to_csi2_dt(int bus_fmt)
+{
+	switch (bus_fmt) {
+	case MEDIA_BUS_FMT_UYVY8_1X16:
+		return MIPI_CSI2_DT_YUV422_8B;
+	case MEDIA_BUS_FMT_RGB565_1X16:
+		return MIPI_CSI2_DT_RGB565;
+	case MEDIA_BUS_FMT_BGR888_1X24:
+		return MIPI_CSI2_DT_RGB888;
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+	case MEDIA_BUS_FMT_Y8_1X8:
+		return MIPI_CSI2_DT_RAW8;
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+	case MEDIA_BUS_FMT_Y10_1X10:
+		return MIPI_CSI2_DT_RAW10;
+	case MEDIA_BUS_FMT_SBGGR12_1X12:
+	case MEDIA_BUS_FMT_SGBRG12_1X12:
+	case MEDIA_BUS_FMT_SGRBG12_1X12:
+	case MEDIA_BUS_FMT_SRGGB12_1X12:
+	case MEDIA_BUS_FMT_Y12_1X12:
+		return MIPI_CSI2_DT_RAW12;
+	case MEDIA_BUS_FMT_SBGGR14_1X14:
+	case MEDIA_BUS_FMT_SGBRG14_1X14:
+	case MEDIA_BUS_FMT_SGRBG14_1X14:
+	case MEDIA_BUS_FMT_SRGGB14_1X14:
+		return MIPI_CSI2_DT_RAW14;
+	case MEDIA_BUS_FMT_SBGGR16_1X16:
+	case MEDIA_BUS_FMT_SGBRG16_1X16:
+	case MEDIA_BUS_FMT_SGRBG16_1X16:
+	case MEDIA_BUS_FMT_SRGGB16_1X16:
+		return MIPI_CSI2_DT_RAW16;
+
+	default:
+		return MIPI_CSI2_DT_NULL;
+	}
+}
+EXPORT_SYMBOL_GPL(media_bus_fmt_to_csi2_dt);
+
 int media_bus_fmt_to_csi2_bpp(int bus_fmt)
 {
 	switch (bus_fmt) {
diff --git a/include/media/mipi-csi2.h b/include/media/mipi-csi2.h
index c5b4e8e1ca93803568b1eee85f7f99c3a45a0b6e..35de536b9b65b49ad9e2914437d26d0e4240cf38 100644
--- a/include/media/mipi-csi2.h
+++ b/include/media/mipi-csi2.h
@@ -8,6 +8,8 @@
 #ifndef _MEDIA_MIPI_CSI2_H
 #define _MEDIA_MIPI_CSI2_H
 
+/* DT value ref to MIPI Camera Serial Interface 2 Spec Ver4.1 section 9.4 */
+
 /* Short packet data types */
 #define MIPI_CSI2_DT_FS			0x00
 #define MIPI_CSI2_DT_FE			0x01
@@ -44,6 +46,7 @@
 #define MIPI_CSI2_DT_RAW20		0x2f
 #define MIPI_CSI2_DT_USER_DEFINED(n)	(0x30 + (n))	/* 0..7 */
 
+int media_bus_fmt_to_csi2_dt(int buf_fmt);
 int media_bus_fmt_to_csi2_bpp(int bus_fmt);
 
 #endif /* _MEDIA_MIPI_CSI2_H */

-- 
2.34.1


