Return-Path: <linux-media+bounces-52532-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFw+DsZni2kiUQAAu9opvQ
	(envelope-from <linux-media+bounces-52532-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 18:15:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EEB11DBD7
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 18:15:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 29BE63093A71
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 17:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6708638A9B1;
	Tue, 10 Feb 2026 17:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Qp2mR36w"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013019.outbound.protection.outlook.com [40.107.159.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8FF389449;
	Tue, 10 Feb 2026 17:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770743573; cv=fail; b=UMB6lNxZaEZ6Nxm8S+QCFQ8FU9gQ5MmT1gNaRR+IHCol/UJ/Lg/dKivbruJSZ1JbnZ+n29ot4m024ee+nCM+ccr/BC8irAm5Xft7caF710OBMvDBZtY2D621/ge3Ej1DUWbgOewaq08f8L5+qsiZCiE1iQ+9a1Rsl9WNaY47RUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770743573; c=relaxed/simple;
	bh=6xj06aWRemvK0y+/nzs631Qp/8EkYxtcZCK0hear1ww=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Jfs805jh2Z+756ulIHuNj7ecfslGRfg2wIPw1v+Xayl24sskgO5MG1RchIcqy50kutmtar9itdgk1Kl2UsLAPeNVou0OAnhE4k9Hzy/Exfseq1aLX9zZwsC0MyzYSe9EMV3S+hbDEHAw7AUYAcFhwR6Kr81mfFq7BdWP/Ty12qI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Qp2mR36w; arc=fail smtp.client-ip=40.107.159.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TpegN2P9vj5gk8Zh/LWJObbdeZSZ3s8vo/qIyxnQu0L1u/UAUFoyzvCF1kvDPGNc6Vc26qvXoRtFPO+jChdUef/P3F6R/C6rbgaxzkbAXgZ7fjR62LZb/477Oy86jtJhM9oSntleYlStCUOX6kdTozL6B3/HRNVuF89RIR39uDHwmxNf2CXkL0qZTGsL366gyqomF0re5bjAj6fkGjhntL8+bqmaJ2xVThtH96PYZqHhZMrcL03zDKCrisRgdypUELgvK+xHazb8VIied4dF0XE58l21ymVNad27EOkzQzn716m1XJSpU6sOw5ClxEmFArwm3gCWPI7wQices71l3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bb5G0BcP+KAkPwZivYy+Ert2WvO7BGujVc7DeDvnSlI=;
 b=vip2Notcq8CV3klXYsJVmZSDrk5pk/KvXSZHTibv0lJidODEbW4zNyUmW6E26uw5Yeo9kITVQDpTCO+2BW2fbVB2IvMn/wOejwTNOGPYxaZICJV116X/yiOtxms+mbCtmrjneSx61MLISn+PSG3kR+A8wxpbxn1+C4vhRu+0K3D+4NZAcJ63NJViDzYU1O2Np9mecTxC1yAhPeXZuk8rBiMOp2jUC40qh3SK3RG3b9YC4WrKBFRVuHzQD/CgA5MXkMUTZaqw12aEx0m/zOiWN5z8UG9sZg97Hy16QICQdKqElYasKvWXcN+2QYONO3fuHgJ5plTnrhEYQ65R0sSSPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bb5G0BcP+KAkPwZivYy+Ert2WvO7BGujVc7DeDvnSlI=;
 b=Qp2mR36wt+Tm76OHmwMHNtqRtY2aqkRswAaIohZIHel3XilVevM8kUpphGRIZLqFLQ+XO3dICgShm+pokjmmLb5ng2gs43hLHFzdPOt8VAGEOR/NxrQsTA+bHUefLOBva7rGd19wZ0Z7B8jbnkqSN4Rq7Au6SC5PDHcoOpDSO/Qd86Ec94oaVTDMrmIaNFJT6pfCPNT2sC7U0NhZZ3wcOWsLrXdcK2jX4OKIrGleGV/GxznhfITLoimy8iOP+mo7nB6v4Oe9UrN36aRiTKTBMVVakcZAoF76+lkv6+E+AH+jgnu4xoppuP06sfZ+hj2vgq+25cldA/Arc6QFDpXUXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB8428.eurprd04.prod.outlook.com (2603:10a6:102:1ce::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 17:11:30 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Tue, 10 Feb 2026
 17:11:30 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 0/6] media: synopsys: Add imx93 support
Date: Tue, 10 Feb 2026 12:11:07 -0500
Message-Id: <20260210-imx93-dw-csi2-v1-0-69667bb86bfa@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKtmi2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyML3czcCktj3ZRy3eTiTCPdJBNzo5SU5CRDc7NEJaCegqLUtMwKsHn
 RsbW1AD/PECVfAAAA
X-Change-ID: 20260128-imx93-dw-csi2-b472ddcb176a
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770743486; l=1423;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=6xj06aWRemvK0y+/nzs631Qp/8EkYxtcZCK0hear1ww=;
 b=RPFp2jIyIBpoylc9xvSwjavqkLbpVAp1euTweiCd5PqVF7pR+BE6uz90AMlOJ6HWG5bCgmyFt
 ajZMsUFs4b8Bp2khQvx9Xs+xbQ/hza70+6cFaePPhaBklHkRQfLMsDz
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA0PR11CA0102.namprd11.prod.outlook.com
 (2603:10b6:806:d1::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB8428:EE_
X-MS-Office365-Filtering-Correlation-Id: 899820dd-a42f-4cbb-014d-08de68c76e65
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?elVETGJObFRERzdxazErWnNCempUU0hDbEJ5bWRTTDRDNGcvOVlXZStXeU9C?=
 =?utf-8?B?MXVLR2dndlF6dXppT2wrRnZaWXhiTzI3SDRXMDJVbVRCUktmTkxGZlMzbWlP?=
 =?utf-8?B?akdaM0w3K3c1d2RJZUV6SVU5VTRYTHRJY2R0c2xzekVSNktuWlU4L3E2LzZw?=
 =?utf-8?B?eHBFd2pEd2lWd1NMOFY2Q2FKdjRBVDN3MFdFa0svcklzNjdteVBHWXcxbE5j?=
 =?utf-8?B?azFtNnFCajBrOWdmU1BSUzRiQitHZmd3M0VBV0RFd0dWbld0R2FsemZCMVQ3?=
 =?utf-8?B?SVdIOUdCYXNzalRmekhXTnhseDlTTkFBN0NpTFVKRU5GZ0ZrNnNmcHRzK3dm?=
 =?utf-8?B?Y1dnd2h1cGdMK1E4MW4wOFBKU09Qc0pUbGhWTElLTTM5d3RtL3ZVdGRuYTh5?=
 =?utf-8?B?cVpNY1Jkb0ZjeCtjaEpaSmx3bEM5SGRXOWhHNCtmOEJQcmdHWnVPVUl2aS9Q?=
 =?utf-8?B?RHErczZvMk5kbjM3VThEaXdpZEZuTW5RSHF0TndpMjBoSW5ZMEJDczY0NkM1?=
 =?utf-8?B?VE9GL3QzczNVdDMzMCtCb25EamdEM013a2NqZmMyNzNvSmJxTFdVU2NrYWlu?=
 =?utf-8?B?UDF5NWFWR2wwcWpWTlpZamFQZ3BrcWJjV21waWJQNFhCR0ErLzNEcStCdDVs?=
 =?utf-8?B?SklQWFJjVkhEOFpJVGVHMjJNRVBtMVZxZC9JMXhCWVF1OThIbjdQbDdDeGJh?=
 =?utf-8?B?UjhXcHJjcTFKRS9BKy9pVHpJaVVzcmticTd0RiticlZnWU5vbDBVem1PNU4z?=
 =?utf-8?B?NW50VkJNakhaOW1OQ3p6K21mZ0c1TTI3MzFhYVlRZXcvdi80bWdwd1RxOXVC?=
 =?utf-8?B?clk4SUI4UTQ4NzgyS3ZIalRrNGNmcytzT01nTkYzcUFxeUljMnZZVEhrdm5u?=
 =?utf-8?B?VnN5ZytXdjZzVnFLajd2R1FRbVVjSkpWVFJOSVk5ZWl0R3k4dG5uRnl4RTVw?=
 =?utf-8?B?TVhuVVdLWWx1S3B6MENBYkVROG94OW9JMmJzZUtBOGRDbWovanAweEMxaVph?=
 =?utf-8?B?ODVhWkdDSUJ1RmhRMXpHY1BWWm0zclFFZWZtd3JuV09QVVdrTlZ3dVoweFhF?=
 =?utf-8?B?SlBIOFRQdDNhK0kramlrTTNvL2UzZXNwb1dHOTVMTkR1elpicEhyTTRRUk1T?=
 =?utf-8?B?L0lsUWtWd2VGakc4NEFVOHByYjBnR0NJNTV6UEZpenNVQ1JUTXpBOEhIMTB5?=
 =?utf-8?B?RTg0aE1OeUxjM0Fid0FFcnBUVUdrbkY5ekdySjhiY0sxOTM2Y3RXbmlPcjBm?=
 =?utf-8?B?T1hWRDFaNjJjalk1WWVEei9ZeDgvVWppTTBzaWpvWWRYZEZOT0dxbmNOVllD?=
 =?utf-8?B?d0JVcXVrVStsWmt1bnB5blVEdzJiYW5VTTJwVE5IYXFHSFRJVEFLeVRyZzRX?=
 =?utf-8?B?dUVwWlJodGlGQXZxa254M3VWcU5BMHJHVlJKTThIRWxXejlKWE5ac1ZlVFI0?=
 =?utf-8?B?TURoV0M0bEZhcHZHVDlmMis2dEdPWE9YMlJSOVIvN2lCUWR2ajBTL0tVRWwv?=
 =?utf-8?B?TG5LWkxPL2U4czBzMXFiNGh5aTVrK0R0WjJJUmtyNFVBZm9GK29peVQ1ZzNi?=
 =?utf-8?B?OHQxMGFuQ1dsK2NQMGx3YTNlVTFoN3RacldvVGU1dGtnNWsxSmp0MkVMcyts?=
 =?utf-8?B?cGIvZGswNEJadk9lcGtrUHlDeVRWUzg0MEtueHdEb3FZaGtxRENJY1dFOUY0?=
 =?utf-8?B?RVM1ZjBMYUE5S3M0SWEzdXdwL3AyMjZFOGY0eCtnUTVDTlRIMXI1OFdtZk03?=
 =?utf-8?B?MENqV3RzemxqaVVNMEFFSk5iWXRjd1pnak04cjR4ZEdTSklTZ0RoS3BrSnZ4?=
 =?utf-8?B?ZkJTNXc1Ynl4aEIyQ2hxMmh5eUEzdkNZQjdlMlBVRFhET2VMalFIZk1QN0tr?=
 =?utf-8?B?TXMyMmUzM0pvQzJOR3FPR3ZBQ0JZMndrTHF6L1psdlVhTzF2Z1Q5LzZlWVlz?=
 =?utf-8?B?MEg0Z0VTSkhoeHhVZFhsako1KzUyL0ZVbFB6U2ZxMlE5K0dsdG5nT1U4VDd5?=
 =?utf-8?B?eEVWTVh3c3FsSENrZmM0bURFZlpSeVBuY1pYTktkN1FjWjVDcUw2dVFQSlp5?=
 =?utf-8?B?ZllKMkNOdkl6cFdZRGpOQTJKczNkNkM4OWllRkxPQ1NYWng4YU1qLzhhdGxG?=
 =?utf-8?B?Y0lqOTFzazl1U2hnR0YwVzlyd1BsWi9nV3gyanlRTnZMKzRWZGpXenQxSW45?=
 =?utf-8?Q?WKIWDX5e34xv323/6JEQ8F8=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TGU0Rkx5c0Z3cWRKay9IczNGOXd0dEp4UUUwQzVyNStwQnJzYlhzbVVKVVJm?=
 =?utf-8?B?c2RjcGg4T01kOWxiQzI0Ty95SlR6V1I0d0tMNEJUTEdHM01yZFV2RTB1emlH?=
 =?utf-8?B?cGJSMlBrUEN2T2p1Y2FmckdHZGdiNmhNQXZ0eVh3SXlvSTNNRGw4bTl2VlVn?=
 =?utf-8?B?SkthSmpzTmlhSHB3Mk1TZC85dzM1UkIxdTZlckZXRUhKME55WkVMajN2UHNZ?=
 =?utf-8?B?dU9OQ3hlZTlva0xTUmY5ZkJWVTgvSDhOd3V0M1hmb1ZGMjZYVHpOUzhzNTFS?=
 =?utf-8?B?YmdaNDVHYmdScWtSYjltd3VtSEl4UkRRZWVpT2Rlb0RNZ2NvVHJsMFJxcU5J?=
 =?utf-8?B?ajVkTUp2Vlh3NlVkeWlyZm51amNRck9yZFA2TG5uNmowZzhYaWhPODVTa1BS?=
 =?utf-8?B?UG0yNk1ONUlQalp3V1hKUy93c2xmS2xuVTh5anFISExZNHQvNFZDelMvTThP?=
 =?utf-8?B?TFJxeUE1SlJIVUUwUnVQOG5VcThRTmswQnJFOTNWU1RNYkoxNFJUcXU4MHhW?=
 =?utf-8?B?SjNoZ3BTdkNoSUNBQXVubStoc1pSMkwrWE01NmtNSmZlSEdpZEZielBJdnVp?=
 =?utf-8?B?SnZqMEIyNWlxelBRR2lvVEV6RTVQUkdWVTdpRkFPZjdWOWtDcExQSDF2Rm56?=
 =?utf-8?B?OXd6aVZTR2FRQTRWZ2ZUTFRvL2xiVjRiQW5YUGp3NWdnbWZUdGhESlN4NnVu?=
 =?utf-8?B?VjBYLzdZOE5jK0d3akhtSGdYOEhXL3NnTU5IUFdnUDBHR3FTaE8yRWZIVDFy?=
 =?utf-8?B?NUw4elRzeWRNakJuclJid1Z5TjJVY3M0K1pkeDRodHl3Q05KZVN1aEVUcFo1?=
 =?utf-8?B?dURaeFhPUVZWQW40TDArcGdGN090U3hJSkhUWkxzWE9OK3A3eDhlNUtaSnE2?=
 =?utf-8?B?WW1LYkNBaFNDaFlYM0lWWk1VRGEyd2xBc2pWbEJVL2ozMFVpUi9lZUYvSVJr?=
 =?utf-8?B?NVlEekFLN0dqV21FMUg5R24wbTBUZVhOaDNtZXp2bFVGT3ZWWjkxTWNYM1FD?=
 =?utf-8?B?YVdTek9BWThWeEJENStqOE1mVFRQTk9kY0s2dG5oYkVqR3VmYncxYklUMmRR?=
 =?utf-8?B?cDdvQWRYZjVZdjBKc2ZDM2kyeGRlVmJHZllNZFYrd1Zmck95bzAzeStVU1hk?=
 =?utf-8?B?M2V4Wnl5SjdpTjRpWFJ1Q2RpSHozUlJaVXU0djAzTGI3b3ZyVTBsN3RacnBZ?=
 =?utf-8?B?TDJxVDlZUGhpWncyNzhwOVZmOEczWWw5NmZsZC9XOERERStNVDV6eXl4bmxJ?=
 =?utf-8?B?ZkYybWw4L1hRZ0E5MmFQMWRqaDZqV1p6K0N1b3BpaVBTZ1lTbnd0Y1VGZWVJ?=
 =?utf-8?B?SzB0T2U3ZlBwYzBNeGNRK0hTZkVpWVloZkhnQjdDeUZNaGNBQndtaTVPNFNx?=
 =?utf-8?B?a3JBZSswdGc0QS9sakJDT3VUdG1YNkcvZlhLLzA2UUJXaGZ6cDVDbnFaajZu?=
 =?utf-8?B?ai9lNzZEenhBdkVaZkY4SjRONVhVNmFTT1V3MkZqNEZLRWQvbHBqODZjRkU5?=
 =?utf-8?B?MkN3SFlnQmFSZmlwa0llZ1hrbHpybUFCNHJKbG5kZTM4RWZCaVlPLzFDWktQ?=
 =?utf-8?B?bTlVZXJDT2JIWFF0eU94YnM4d3JNM2RuRUVrZzV4VTNzaklzKzd5S0Z4QnJN?=
 =?utf-8?B?d2NKSTgyZDlSNldFY1JSZFdqN0YvWm5zdmE1eWs1U0dVUVlad05DM0FtNmZx?=
 =?utf-8?B?dFhkc0RFcVRUL3lBNnNKMkJ4cmpVMGN3RWU3NHpoaXhDU0hkOE5NbUdqMEVO?=
 =?utf-8?B?YWtlZ1p1Wk5qQzhRaWdUY0pSeTJxalVJcXh2T1hTMloxdmtoS3lVZGlmT1Vj?=
 =?utf-8?B?bVYrVWNRaWJnQjNuZ1BOYSs5QmRjMXBDeWRxck1KcVVEVVlrU3FqcEZScnZo?=
 =?utf-8?B?dHROak5vellVSGlJRTlDTjMyeklleWlIYTVwcFBCeFVrRkVMZzZCZ3VKZFNB?=
 =?utf-8?B?NWdEZ3FLWVNIVWpYL1h4eVdZdWhDYkw4S3ZCa2gxOHYxUitMWDYwRVYrZGs1?=
 =?utf-8?B?aFIxQmNtcFdFOGtHekw3Zkc1R3pHU0x2VDRCRzdUbTJ1WUpZTVN6a2t6NEgy?=
 =?utf-8?B?Uk9MbWhjRHR3KzdtaDJRVWlkL1hiK3R3emFnN3VOMmxVMWxVVVFzMGc0ZVVp?=
 =?utf-8?B?UkJPVk42M3NGYThoU2hGUHdFWmw3eTE5VGRoSE55ZWhQNUxxODRheGNldmh3?=
 =?utf-8?B?NkVXYUFDYUZhWGEyeC9tRGcvOHJzL3dsT2pSVlI3Z3FMVTQvVFBmU29VMUk4?=
 =?utf-8?B?YmlVUG1sTXF6QzNzU2ZCeUNyZlBxZGIydkdrNER6ZlFFRzBPR3FjY1ZrUXpl?=
 =?utf-8?Q?MsBROU/+6kYJ6eoo34?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 899820dd-a42f-4cbb-014d-08de68c76e65
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 17:11:29.7885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AIZdKm9rHPhLX8mN+99+96C1GNdtkF41Jqf3iAZ4qq2/eDDn6/TZtc9f2lYRFn2NS0p9QH7f8mG2GUcUzPbkgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8428
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52532-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:dkim,nxp.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A7EEB11DBD7
X-Rspamd-Action: no action

This 3rd time try to support DW CSI2RX support for imx93.

1st: Create new dw csi2 driver
https://lore.kernel.org/all/20250701-95_cam-v1-5-c5172bab387b@nxp.com/

2nd: Based on legacy imx6's DW CSI2 constroller.
https://lore.kernel.org/imx/20250821-95_cam-v3-0-c9286fbb34b9@nxp.com/

Now rockchip create a common DW CSI2RX driver at
drivers/media/platform/synopsys/dw-mipi-csi2rx.c

This time base on rockchip's implement.

i.MX93's version is newer than rockchip one. i.MX6's is more similar with
rockchips.

But i.MX6 is too old. So start at i.MX93 firstly even it has bigger
difference.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (6):
      media: synopsys: use devm_reset_control_get_optional_exclusive()
      media: synopsys: only check errors from devm_clk_bulk_get_all()
      media: synopsys: implement .get_frame_desc() callback
      media: synopsys: use struct dw_mipi_csi2rx_regs to describe register offsets
      media: dt-bindings: add NXP i.MX93 compatible string
      media: synopsys: add i.MX93 support

 .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  |  47 +++-
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c   | 280 ++++++++++++++++++---
 2 files changed, 293 insertions(+), 34 deletions(-)
---
base-commit: ada3fa02f7a95623b724dfe300fce6f49cc2d75a
change-id: 20260128-imx93-dw-csi2-b472ddcb176a

Best regards,
--
Frank Li <Frank.Li@nxp.com>


