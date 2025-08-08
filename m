Return-Path: <linux-media+bounces-39157-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 802FDB1F0C7
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 00:41:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3499917FE6C
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 22:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D5B428D85C;
	Fri,  8 Aug 2025 22:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Efyfb8IT"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010012.outbound.protection.outlook.com [52.101.69.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEA128CF7B;
	Fri,  8 Aug 2025 22:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754692832; cv=fail; b=T2rFjRoCAKFXNmgy8QRVpMuVgkZoN7xentNQT9YjUo5bmT1cdgsDa5yD1ecWjMkZ+l5bn3kTi3GE6bG9D6yN86iCvAWCaRoCCO+JWczQ/fAPtcNw2oB2Z7O+61d07q6KjH7aNeWqhrdEQ6ZPgR9QyDMjTRjk4oo28g0DLEExfb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754692832; c=relaxed/simple;
	bh=LJheYFsFE3gTgbB/4exm7kW6px7qSqmIClCgzXMKKxs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=IW/YBsTYJfc0sXkAL7ZvfocjMrZ06qeYf11QhBqF6N+7FrB2m7v42dHJ/ZyVrHOQUZUVI06InfgB4v9zk6wSBr8IeuEYNRo9EKAvhq2HZn8T6FnDCPP9CY8SOXX62TjvTTVrexA/CtUqY2peBwdtCEk4keQbBS3ecBGWjkvwjaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Efyfb8IT; arc=fail smtp.client-ip=52.101.69.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BeSN3m5JUYSnp8aIxbSlDVUmys80dHly3MtFpQuZT6jj5gQ1UFs0tOW9Lk7gTNNKWne/f/4XTk19ZE+pCH8XipT0yUAMDSD5iPBtuOYZBYCbx4jA8xpIFrcb4RUSwI4IBVUO1eOBaRtB5Q91xHi02+fR+ljfzBFWnzHPT3/c2eWU6kk+VBo7G11goAJTwu016UYkjdPTlSsE+u/+FjP9WR7YQ1b/wcVt7eHAjb6Se+CWCymOUMPTHPmUMR59mzR/PL6BlTZkLspR4nEJBgz/SLNn4nOBzZQYN9zsSMPluo3Re1ewAgg5ZrR0CtrGxMaJHMytkO/i1LYrXpvK9AlyHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GWDSKYGOK866sldsSpKS6S3hnBKaYQtP/Dg7w21A5r4=;
 b=dkimv9ev1KfwsqdjPJH4inPP29+7Lhlka65R0pFUB4s3Sk1Hr9im1KNpljbgQOepRdzkRboV9GWFvLRBMkWJbwBs+HtzgIQN2t8Xk03wAhgXZp2zmnUxTXSTHaV6OOWKUVc/E1RSG7xDfhY+I7P1TsjkdTNMRFQcsbaKCzSFiV55zztRlwWHf/2BxjyOeXtKLzvemq8LK2etRtbkRFrzEP8iqFFV28LadmiFKfKJhinDnfqPVUz4M+2+lw3A81W/bzkqARnRSjgjH1OQGT57hCh626F/wpdRPpqNbXhTXUS2ziqz/QSujPMpTLysrr/jQhnBwSL9Pv5krZdmvoA64w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GWDSKYGOK866sldsSpKS6S3hnBKaYQtP/Dg7w21A5r4=;
 b=Efyfb8ITf3nZwpJCOaiCZpvCQOKiPd4qxsMHrl5Ows7C5kCryEtDAb2z6mFZg+CDd5+zc42/6DZemDoIqw83+W6VHjbH0Zgb6W0UqPu7wZLX1ReNzlN7SqzaGLk0HK0MLVKgpB3A/9a0U2fnLdY8oJgJnov1T0GytLPfqF/k1G+9qeKSx01xFEcz+uGul/DBsTFOW/0AWucT9pJuwhixZg0FAms5foDwAwN8pT+NEOQ7IUCxv0hZJ0/EDhv4vtsh+yPcMmb06SkxIm7nDk7Xc+KdWOqv+lguVLxjDDBjzGp8GaOrZ7trWFOvTEN3HDEXLHcFANfH5HIU0daGM6URNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10528.eurprd04.prod.outlook.com (2603:10a6:102:445::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 22:40:28 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.008; Fri, 8 Aug 2025
 22:40:27 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 08 Aug 2025 18:39:08 -0400
Subject: [PATCH v2 05/32] media: staging: media: imx6-mipi-csi2: replace
 space with tab for alignment
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-95_cam-v2-5-4b29fa6919a7@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754692792; l=4945;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=LJheYFsFE3gTgbB/4exm7kW6px7qSqmIClCgzXMKKxs=;
 b=aCoUokHAXCAMGLCwQnhIPHEJCPDXuzXjSjiZwL+gluejwegu92Z8NtPIDhbFiibrvFoxVCrCJ
 NseiwSM4f3MDvS37MGlURQasMhI/m07C9iSt5hAyAyZxKD1+c3aoUCp
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
X-MS-Office365-Filtering-Correlation-Id: 53a66ccc-a200-4154-aadb-08ddd6cc928c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?emk0OENma0cyVDBkaGJJNDdOYWlTV1lWcjkvamVQeFhFTGx1a0VTd0U4WFdH?=
 =?utf-8?B?VDJTdXU2Y0V1VktSVUw5RXQ1QlBHdmhSZXprN25Pd3BUYnhPQnpiYXdlb1V2?=
 =?utf-8?B?dk5HSWRGRTZrb3pRRTdMcVpIUnByTWdPWllETkg5YWFwcVhGYUJXS2lxOUtk?=
 =?utf-8?B?T3QvSE9lTWpzWVJUb055ZmVwRGgvV2J2NTdnQ1pVNTdCdjhSUHA3OEVmM1Jm?=
 =?utf-8?B?bVViNVZBUHVrU0pqUU9qYW9iMklCVnZuT1d1RTZ5VDh3VzVBN1R5UDNoRlJv?=
 =?utf-8?B?S2REUXdsK1lKZU4rL0lBWHhzdFhCRllodHlTcCtWQm5yRzBVcjRGZlhPQndG?=
 =?utf-8?B?Z3FQZFZ4VFlZMUxySCt2MVhoSVlVUlQ5cC9tUVJRZlA2emNxRHMrRGNVdlBh?=
 =?utf-8?B?Wlpybm1zRUMrVnJWdU9BVmdpZHNUbHpyc2s3VEdMc1g1cFdVakRWNXVnNUZV?=
 =?utf-8?B?bkRPQUNmQndyQk1JdnBrTGdSZEs5K1RDTWdXNXlPQmR6OWIyMjludGRON1Nm?=
 =?utf-8?B?SWYzdmZ4QVRzWWY5bzd1ek9aaUlSWVJMdU8yNSsvVjV4VEM5d1FOdGRlZmU1?=
 =?utf-8?B?RmZhWWJCOXhHZWxZMlc1REUrM0pDVktmUVIyK1M2ZG9xVDByNzRJNGV6b08w?=
 =?utf-8?B?SytUWFdNSTE5NFhJYTI5alhINkdtdmVwNnFmczkrNFlCbXVBcW01Nm1tY1B6?=
 =?utf-8?B?ZndoOFkzR0VMMmswYk5sZnN5T0VDMUREMXdxbDBxSUEwSi9wK1o3VkxWR1Ir?=
 =?utf-8?B?ZnZtdklmYkg1RVNIWmtSTndHSXZxSmpNR2pVNU1IQnFxREQxa1lTVS9EaTRU?=
 =?utf-8?B?TUR2cFp2MUo2VXJUYnFTZUt6bFVkeERqR0xoeXBqdEh0by9pREFPNVRhN2VZ?=
 =?utf-8?B?K1luZU1mSmZmZktlV0tpTTdJeWpLQVdncW01bE0xa1ZEbkF1clNRYXFaVkFw?=
 =?utf-8?B?endsZHJSaC9JcmMrTnVLVkQ1bDFCazhkbExhTVc3SUtGMW5RY0R5Nk9XTTVs?=
 =?utf-8?B?VXpWNm1sdnVMMThsQ3RxNUxqRUZObG1RVnllN2hoQ3BlYjNRR0MwNU1pc09M?=
 =?utf-8?B?bytwZVo0cUtwNTUrOWI0KzVRWXVyK296NHdVOFZJczNrTU1UUy91OEtMK0V6?=
 =?utf-8?B?bkQwWjY2ZXQ1WnlJdldvdFJSTUtZZVZqMUVvaWpCanVLdHhRSHlKc0RvWkxj?=
 =?utf-8?B?UTBJOTI1VHFDK0VGY0dqOGY0cHN2K3FmK1YvNkV4Q0lDb21jZ0l0aXg1N1hM?=
 =?utf-8?B?eVRMSTFBQkp6KzVzVXFuNCtTUzJXNzFIbWRUbTZHK29NYjIzdDBGeGppcUpl?=
 =?utf-8?B?NWZTelFMSkp2Ty8zbENKZTh2K1hVbmlqcEYzYlArb1UvK3NwNHVEMnNmSFF6?=
 =?utf-8?B?bDdhcUNVUTlFa1JNTi8rSGErZmR3NnNoUDhFNEFGbVdvdVA2aHluQTE0NzM4?=
 =?utf-8?B?S2pDdWRPd1JDMCtRTkpocmhQdFBiRW4vVytTdmhnTldyNUFsVXZEUVp4OGVQ?=
 =?utf-8?B?WXdrNlE1VXVwRmhHejRIa3pvV24rR0hqcDRvTG5WZ3JBLzRNWENUcTNtOHVp?=
 =?utf-8?B?YS91OGZxS1prakdqTDZjbHMvS3I0R2dGd0F4cVNYbEE2cG90MnpuWWVaN2p3?=
 =?utf-8?B?WFpCSHB1dzdFaFlCNmFHWGE1dGdJaENsdDl0Mjd2dXFDV3prbVNUM0d0djNQ?=
 =?utf-8?B?R3dXaVA5WlBISjh4U3ZUQ1Fjc3VhdzBIdjREUy9CdEFtZXJEWm5uNGFkemh5?=
 =?utf-8?B?RzRXazJsWFZGVzl1QUFua2ZjMldISXcydlY3MkZpOGd1T042VEM3NFVmNVNV?=
 =?utf-8?B?bHRtMGFiZ0hLRWRxUkRacWlvTU5ncUNSZVpjaEFoRVpRaVlwR3pPUHFta3ox?=
 =?utf-8?B?VXpEWHREUDh4RWdKSTdtc3pKM3RVa09UQTBTbXR6RDhlMmY4b0JwdWpHVWg0?=
 =?utf-8?B?TWFmblM0ZWVZNUdRcTZLZWU0b0gxVExEQ2hka1E2a29BTFVnWTRCWnltTkZG?=
 =?utf-8?Q?KGyKG/DLP/uUQfQfMZtJsB/+kj+RNQ=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?SU0wVXVYZVdxeThPNnAyajkwRW40UVo5WmZGNUdDRDdCUC9kWHkwcUpnZjB3?=
 =?utf-8?B?aURZOU5UeU83b3RYV3pyLzNBZHJvL3Ezb2NtQ1NuL3dEY3NFVk5YWFBVbUlp?=
 =?utf-8?B?ZkpvYWNQWEp5K04vdk1QajM3TlhNL3JVbzZzOHhONUlwRnhsT3ZvcitpYUsv?=
 =?utf-8?B?M1ZtWU5pZlY1TkpONFE4UzRoQTViTVdEZG1OTVhQUUdkbXc0OXJXVHlNYjZy?=
 =?utf-8?B?SkhhTXJqSWR0M3FjUU9aMFJTcDlmSWZmaWYvNlJtSmVQWHp5VXArTUZiZ1F4?=
 =?utf-8?B?MXE0cUVJQlVnbGtnSnpoRWRSamNTbHJwNUhIdEZ3RE43T0J0ZzRSYUd5S1hx?=
 =?utf-8?B?WVAxRTFucjFQWUNvQTZ1ZENQR2Y3dnllVDQwOUJTM2ZBNk0vclRlbnBuT3o4?=
 =?utf-8?B?NkNmNTdSbDk5RUpEM1dUeFhJSmRXTWR0Vkl5bXVpWUxXT0ZqNXI0bUNWUS9y?=
 =?utf-8?B?enVtU1ZvdDY2V3ZTOTgwbkpRMm5LQ0R0ejA1alQvbEhTeDhHVW5LM2lrWEx2?=
 =?utf-8?B?SzVXRUw4d1k4Ykp0OUZJMC9hUFRLcUoycEQvbkN3SE1pUG15WkthZ1VwRnZN?=
 =?utf-8?B?NDhmL2lvV3F3OElHdnZxYW4zaGF4SmoyOUhQdHU0dk5HVUdhYmlmeTRIWlRm?=
 =?utf-8?B?VG5uQnlOVy81cGJ4RnVrUVRiRXN6b1UxNXM0Tkw5dCtyTGhQTjB5MVF0cklS?=
 =?utf-8?B?UVB3YlhDMC9VeStCRW91c2FETGVaKzdWQzdNUjAxYStvOENOeTFkM00yVlJp?=
 =?utf-8?B?aHZleDY4UHkxb2c4VEdrengrenFLRDk4UHlhQUQ5bGxwK1dMRm1wS1ZiTlJD?=
 =?utf-8?B?bHR0YXNhUm1VbEIzUkQ2eTdSdFM0TnN6TDRYSGVqK3pPWWpkZUNJVDRXK0V1?=
 =?utf-8?B?SjJyNElQQ3JUWXk1Q2xLMG9TQ1BTV0hSdHFBdnRNQWFIbWRXRXBiYy93NHM4?=
 =?utf-8?B?WE5qays0Zk5mYi9nanZ4S25PKzZVaVV1UnJzYkl2NHgxYmdyb05FeVdpTDRv?=
 =?utf-8?B?OUZlclJGWWZ0ODNscFM4UXpWc09zMitVM1BZM2VBQ2ZrOEQwZ0VUYWE1Q2p1?=
 =?utf-8?B?MzB4Ni94ZVJFblcyTlR5MHBwNmtXbVRnamZLSVUyK2drNmVOeTErZDMvR09H?=
 =?utf-8?B?QUpVK0Q5M1MrTWxsN00zQ3pib1Y5QklJT3J0WDdOL1NTaEtnYjJTQ0hBOXRy?=
 =?utf-8?B?MDFkYVljKzhYQkJ0SitSRzcwVUZIc1paUEhqaHRhQnUxYndlalZwT2FYOEZt?=
 =?utf-8?B?cExRR0x2aDMvUDhGWWo0WU42NmhsZWJRQ2lzSEdrdTlDaW5mbnpYL2dtNmpp?=
 =?utf-8?B?VFd4WXZGRm1PYy9FQk1mM3NCWVJTL3hoMUZSWW45NTd4ZFJwbEtZWVJEYWxx?=
 =?utf-8?B?Tm1jeFhWNnpsYjd5bGNOSUV1aGRPdW4wRSsrNWo4bHFWdE1ZNXYxQ3U4Zkc1?=
 =?utf-8?B?ZGl3QStyVWRiQTFUMXBxMEg5U21LU3ZGQ1ZQRGV2OXF0Y2dkaVNQRzNJL1Bv?=
 =?utf-8?B?WllHOXJ1OVFGNHltK1BFUDJZcWZEY0NCMk42c2NoMFZtSFk3ZVVoSldlN1Qv?=
 =?utf-8?B?YjFRVk1BM0Njc3VFZkduZmxwZm4rMk5qVkJoaGhRcDB5NHNvTUlDVG5mT093?=
 =?utf-8?B?Q1lmWmVpZ2djNldZNTlqMjdDSW9GSndrK0NmWVUwelhaVGNhbVRLWG05RzR4?=
 =?utf-8?B?VjBLUkpSWGI5UDgzK3l4eVMzRS9JUlJyWWlObGl3cmVtK3MvZ0poVDZRZ1VL?=
 =?utf-8?B?MC9ZOFRzRkxudzJFMGNubDZBU3NRUHVwWWxaNm5yWTVuSTRQekZ5NDJIUURo?=
 =?utf-8?B?WGhoTEUveFJlbzF3TzZmZld4SGV0emo3RUVRcm9YT0k5d2xxdW9oZDM5UjlL?=
 =?utf-8?B?RGtkRzluS21sOW9zbzFLTTVEalF2YUYxc05yWWhseHA3Vm15MUg3NzJrQ0lU?=
 =?utf-8?B?QWNGVGhYbVFrcnhlMVI2YU0wMW5iL1czdURJZE9DU0Y1VDFZdkxaTjl3WWdq?=
 =?utf-8?B?aXhrZlY0UENxT05kQmZjTUxWZ0NxcU9QUnkvRUlDU1hkazJXcHpZaU0wdTZP?=
 =?utf-8?B?bHN4MEtCR3hwNjlGZUF0S0t6MkJ4NHlEK0JrRzgxbGszaVRDMm00bzRWS1NP?=
 =?utf-8?Q?H72aG2WsSTbMjyloGnIvBG6LU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53a66ccc-a200-4154-aadb-08ddd6cc928c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 22:40:27.8787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MIeRvkWgFVjA2DiurOoDXXkT//DgO1IWnt70D56LLFwvMQAd3lkiESNqY3/Vq3V2zuT6NfNtMioOBkNp2bv+fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10528

Replace space with tab to follow coding convention. No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/staging/media/imx/imx6-mipi-csi2.c | 92 +++++++++++++++---------------
 1 file changed, 46 insertions(+), 46 deletions(-)

diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index dd8c7b3233bccfc34b59e0f0ff813b36752e1526..42256441b881d9f132ad7ff899d6f1e35643b4ac 100644
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
-	struct v4l2_async_notifier notifier;
-	struct media_pad       pad[CSI2_NUM_PADS];
-	struct clk             *dphy_clk;
-	struct clk             *pllref_clk;
-	struct clk             *pix_clk; /* what is this? */
-	void __iomem           *base;
-
-	struct v4l2_subdev	*remote;
-	unsigned int		remote_pad;
-	unsigned short		data_lanes;
+	struct device			*dev;
+	struct v4l2_subdev		sd;
+	struct v4l2_async_notifier	notifier;
+	struct media_pad		pad[CSI2_NUM_PADS];
+	struct clk			*dphy_clk;
+	struct clk			*pllref_clk;
+	struct clk			*pix_clk; /* what is this? */
+	void __iomem			*base;
+
+	struct v4l2_subdev		*remote;
+	unsigned int			remote_pad;
+	unsigned short			data_lanes;
 
 	/* lock to protect all members below */
-	struct mutex lock;
+	struct mutex			lock;
 
-	struct v4l2_mbus_framefmt format_mbus;
+	struct v4l2_mbus_framefmt	format_mbus;
 
-	int                     stream_count;
-	struct v4l2_subdev      *src_sd;
-	bool                    sink_linked[CSI2_NUM_SRC_PADS];
+	int				stream_count;
+	struct v4l2_subdev		*src_sd;
+	bool				sink_linked[CSI2_NUM_SRC_PADS];
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


