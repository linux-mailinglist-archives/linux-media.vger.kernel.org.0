Return-Path: <linux-media+bounces-40671-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC24B305DE
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 22:37:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A2D8AE657D
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 20:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38C4735E4FE;
	Thu, 21 Aug 2025 20:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KllV666e"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013061.outbound.protection.outlook.com [40.107.159.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A1235E4DC;
	Thu, 21 Aug 2025 20:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755807462; cv=fail; b=nW5vD9uzmM+OcRPUCd0zAjzxLSdLVM+iPjPWmx+Kc22UZYMS9TsCUq5rQq+SlsP2iPQ58JBWOQrXrr2LrM4UDHpqKl+sCTcX7aWAa0NmuBPSw10FPp3otwQCH5cyjglrhElY9IW4rRsr6bb91NCwq6T1RvCeiFxxszc8Vyn4mzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755807462; c=relaxed/simple;
	bh=RvzFCrTNqFCiSku/iUpT66qluclYVbPXZhqfa/xW/Gw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=VtJ20XotKY7RFjkf5UqvfReElGcqmiLabjwbhCZQugGOn0Mn6/kn6lphmU75y5ltyZj6mVqn3EgxTWPHmHepp3GbHMF9K/3gbA83dwNJB+DY2tSymp2fqg64HtqbXf6RVOaGAguiuIk8mZNSptUN4j7C4w8Lj/xTj+yM/aUMHug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KllV666e; arc=fail smtp.client-ip=40.107.159.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L73ASmyKVSbyUCL5fN23CMKZSQOYazLRBWg62Yfk104M36UQoQ3qxEahGbgJ1+8d/ZErWXr6jAakJctl647qj2+w+PRK1mmuiNl29qF1unU7IR4XoP2I+4P5mS5zEB0vepB8uZVy87NWtxeZaJZLoa02X362dPiLwyihK9R7yAcTrMwNsfJye9RBNxRnAURTTAprYFSdybKt58sQWwYe1SW8n3ajDng4hdz6QXTNOy+snGcWllgmFTfheEz6JVy2vp2VW2935hPvWTpnTcdEEgFqq9WoGu+31LKz9YzD26RKc4tHlW/F/lDGtz9jt+kJKd+tLvREVD8aa4i8KOvAvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YDFjkWi2VycgN5IYKSzwSycYpCFYlCbbQfA8/AXN9e0=;
 b=UcxhE82x+Tx6noRBEu9ZI1c6dWl4HtNTy7zxtKzEEFOSWzmzI/r433szTcmIo8OjFEFQ3cyASxXyY/6f6oY5EzRQ1GQvEY6Zs7xRkCveVCX+q/SOtLqMW79Rs+z/er7V5fevbDJp2u3g90HQpv9Nk0Kw/oFdEkONALXHm8VsPhaRHqQztENovnzi3ef5bU6T0edsiUlxFPzTFzARsHj1w1VWOH4syxsGKcerZ0fE1rvp+HIwjt8QWR6kyIKF+kxfE0O7h3xXTlgtaChAJGHhu1uLiaEWPRLsj3yxL/0Z1kZo/5fECwa83P6o9uSgtcT9cW+ZHRKCI0oim2S75boPJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YDFjkWi2VycgN5IYKSzwSycYpCFYlCbbQfA8/AXN9e0=;
 b=KllV666eQsnqYdHAKIC9JNsb/CN1ICy5k+MvkDzf/6asPea7u4CkREl8kjZGp1Ax1MvqojbdkgGYTvTwkY4e8ySgG7re4E4CSoR8lgpmvfsg6F/8VotFDMloCnrem9aFnu6ayZQ4n1VPiGwjTFmkXWo1ZuxPaN/84qjsl2OirAPz87DPlzmS0nfjN1afvlxQALY0gPQLhDNg6gZLEDp1g1KsW6nmq4TzsKvhDOAzP4OaH4cQRYVqY+wlbsddtXtYV8PEs1OuaQnL4Gl+GkUlZg3POIZrgAY/jx5vJbcOukwMv8UddrP4XYNd53v7LdeDiJFZszZ1hnPCIfiziEE5sA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM9PR04MB8438.eurprd04.prod.outlook.com (2603:10a6:20b:411::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Thu, 21 Aug
 2025 20:17:36 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 20:17:36 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 21 Aug 2025 16:15:49 -0400
Subject: [PATCH v3 14/31] media: staging: media: imx6-mipi-csi2: move
 number pad macro define into imx6-csi2.c
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-95_cam-v3-14-c9286fbb34b9@nxp.com>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
In-Reply-To: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755807361; l=5799;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=RvzFCrTNqFCiSku/iUpT66qluclYVbPXZhqfa/xW/Gw=;
 b=qUjkqVXnEBr5lBQmNgtHvivMIbDBwxnb4lTugcAzllNYzCpqXZ655kIZ6mtIf4W1BLQ+0j+GK
 ivX/Yh5Ovs0DpuDV7/5YRQqiMLtbfx1ZVq2T7/unZjNrw/d1T/Pul27
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR03CA0338.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::13) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM9PR04MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: 740212e6-6200-48d0-83d4-08dde0efc524
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|19092799006|52116014|7416014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?RzZObVM0L09mUkk2MktPN1NwaE5HdlFlbXFJMzhzQndSUXFmUDlNcUJ0T1h1?=
 =?utf-8?B?cSttSHN5STRrYXhoamk2QWtKYlM4SXlQTVBJR1JxZVY3QnovYXd2L2pPWXBX?=
 =?utf-8?B?c1F0c2ZoREhtL01icjRhWFM1QWFtaitZdnM2dUdycUtUWTFVUU9SMWtSVU5B?=
 =?utf-8?B?UGVzSklkSWxkUi9YVm5pdFZyNHlyKytIbmRpSFJYVEJITHpSdVF2YXhJd3dh?=
 =?utf-8?B?bk1HemxXUUp2RHNhbzBHTkFtd00zMi82U0VMT1EvWDlQaWJpNDZvamJMcmli?=
 =?utf-8?B?UVcrbGo1YXU0aVNXYTR1QjFqdS9sR0dLY0xmWUUxMEs5VWdZOVpRZ2xDcW9u?=
 =?utf-8?B?U29BNTlvZy9sT1FCdGhra2xzSGUvcllBRkpXVGFBbGhZNU9PbXdaSmNKZGpt?=
 =?utf-8?B?VjM5NExzSkkvM1ZSWVlNbkN4QlZGQVlkUGpIR29McmFUVXN3K1J2VGxNRGpM?=
 =?utf-8?B?NXI0UWpFL0I4eGl1c1pySHF1Qkk3R0hQdHRVa3VvVTNpVGZ5VFRqTzZ2MVcy?=
 =?utf-8?B?TXJnb0ZTZ2lOWFgxNHhPdU01RFRISmhCWXh1ZnJ3Nm5pUFFGYzdta1BGeTAw?=
 =?utf-8?B?Z0NGSXowRURlSk1HcHpjZm5Cb2ptUGxaVHJDMWFBS05zb3NpUjBkNTRuVTQw?=
 =?utf-8?B?dmlvRVZCNVkxUDJwcHNKdVJ2ODJ2bkx5dTQ2cVVBamRrZmRNaWZsMlk0NGta?=
 =?utf-8?B?T3UyWGpCbU1GSHVjMDRxcHl6MjkyV2N6QVBLMk1oOXVmUDZrQWNJeHk0NHNt?=
 =?utf-8?B?SUxSZndydTF3dWtPMlZ0bmpVSHJQQXN5c05OQUloVS80bzBFZ25yaFBJdCtE?=
 =?utf-8?B?U1dFbkhVMzFoemJjL2lJTU05c2x3Rm51bkl1alNzc3NIcFpWTmp4Qi96YnZp?=
 =?utf-8?B?UVNYOWRuYnhkeHY2b0t1NFJlT1hhTGR2UmI2TE85dGJWUnJqa1RRcjBOWXVB?=
 =?utf-8?B?emVCeHBrdlNibE5YQms3ZkdJUVFoWHZ4MGZmeGtqWXV4M2s1NExQd2JzOG1p?=
 =?utf-8?B?TktqWDR2MDBHdWdvbC9Ha2RpT0VwanNwYk5SMk1CTVhiTGE2SnJicWp3Y05x?=
 =?utf-8?B?d1VwRDR2Y1RJdTc0ZXd2SUM0YlMrc2ZZcFpTODJEbFJiTmNXcVpvMVA4Z3VZ?=
 =?utf-8?B?OXhmMkRGazI3NEFSZjlCL1N0dE1SRnovSzFmNDRDOUxQc29rc29BZzdOTlMr?=
 =?utf-8?B?WlBHRlZCTjhKSjYxWjd4MEZST01aTjlxVE16RVA1WWRHWWdjNmR1K2htQUFL?=
 =?utf-8?B?RmdHK0w2NFdXbnhsaENQVjZCN1pSOEJRMEpzWDNaVTYzSXVCVTN6VXRqV3Vq?=
 =?utf-8?B?QWVaR2Z5clJwSUF5bURGdno2dEU5eHZ6Q1ZhWDdVQ3pvczVPMS9aVHZPL1l5?=
 =?utf-8?B?Rko5S0R6VE5DY09hVEFlaGp1ckxoOGo2blhrNmpCY3BucjJ1V0FPdEJaSkNj?=
 =?utf-8?B?VzZ4ZHFUVU9scE1BK0hWaGNOODM4Q2RiK3pIS09qOHNKc0FaVnljQVB4R2tP?=
 =?utf-8?B?MTIzMkZhMW9LOGhBYVA0ZlNQdlVjZnlkQ3F2eVNZKzlleTFiWThXVTQ3U3Bv?=
 =?utf-8?B?UUY1aHh3UGNaV1NJYWkxOEFPQVRxZyszRzkxejJTQ2s0OVhRN3lja3FBTStH?=
 =?utf-8?B?ZnhvOUZWa1lmT2pRb012MXBBZmFhcnVLRVo2cFBBZWxZVENrbHlvSXRvL2NU?=
 =?utf-8?B?VEVTUHk5YTZGSFBQYXBjUkhoMzA2cTcrbHphdTRvdVNYZEhLc3oyU25USG1Z?=
 =?utf-8?B?SHh4OVBIUTFURG9hY3dOR2xLcFByYm9MamVWSGl3eTlrTElOR1VLc0tIcWtk?=
 =?utf-8?B?eEZDaWVMTm5rTzMyTThTakRjaVpmYUNmS0JWb2dpU0pnVTgwTWxrb1cwdlk2?=
 =?utf-8?B?emZHSXcwUUl1eVNpWWJOWjVqcmwzcUVQc1ZuVFpaWHI3NkY4Yk5GVFVmVUhV?=
 =?utf-8?B?L1JwZStRazJBWTR2dkF2ZUNzZzRxVlVnT2tXQWREWmdsSjk4TXBXejM2aEwz?=
 =?utf-8?Q?1A//61OhuQ7JwRv6dG+tXVCSQZOAFk=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(52116014)(7416014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?c0p3V01BeGJoSStTZmNGZktCbWNEd3VjOTRMRHRPSXQ0OEV4d0twamgrSmVj?=
 =?utf-8?B?K1pWZ1RnSjhiOWVCd0FxL0o3OVpqTkQwVHR1TnNGTUxPMS9Tc0NPTXdPV3VU?=
 =?utf-8?B?SW55SW1iR3FMZHU0OTRFakpPWk5HR0lWN3ZkcXJ4akpaL3BiK2NndlZWTTV0?=
 =?utf-8?B?U3dkRGNSNStqRWY3Y29sSU8yTDcyYmNVRlFGWEVVdllpbTQ1ZitUSGxmTExq?=
 =?utf-8?B?RS9zRndjVkxRaEpoSXhodTdVRktMNzQvRXFyWU9ZbTk5cFRyYTFEVFFkQVVz?=
 =?utf-8?B?U0gvaHRRUGplNXQrZFgzcksrbHE4bVNDQ1kxZmxMUkFqWVNiM3hDZVpCTDFP?=
 =?utf-8?B?akN5bDNoMXl6WTFYZUd1K1ZFUGUyMmlFNjFUejBCMWNHdHF3YUduaTNOdWk3?=
 =?utf-8?B?MWp3Skl1TDVYSWJTQTJ6QnVHaTBIWEk4S1BaR3gxUlNBSW4zVnc5a3RrMFZ2?=
 =?utf-8?B?UVdwYmg1Um5oN3V6ZVU5Nzk5N20vd1FWcEE2T2d4ckxuSWFxNlN1UURWRmFm?=
 =?utf-8?B?ZnovVzV4VEc3VmRMNng4cGhiWU9wZjR5ZHdwczdoM3JrNm84UE9jSURlK0Js?=
 =?utf-8?B?QWVBQUlVS082V0hKeFROOUJWRG5xTTY2c3Fva2VXTnRMR2ZGMEtxTUNtbktC?=
 =?utf-8?B?S2tNUzZKVkk1VHBYWWc1U2VDb3dOSE05UHBlb3E4RlpTSE1tWmJsRHFjaUNq?=
 =?utf-8?B?MXB0Rlp4b2dNVTQyUktwUnJBeUtFSWh6M1NHa2VuMWdZMHJEUVduaVFrdnlv?=
 =?utf-8?B?ZFR6bEthZGhmUlcyNHJWVE5KLzFhMUVsbjJ5VjJPeHIyWnpjd2V6TFVCbUxr?=
 =?utf-8?B?NEVCVVlwMWwrVTVCWitCNXZYR0dXV2l1MGMzNVgyaFU3amlqcFFuZ1I2WFha?=
 =?utf-8?B?bG1vQUlGUTcwYm1MNW5peTZtY0EzRjI2YytDUzBqN3c3azk0aEFheHhRdFpw?=
 =?utf-8?B?cXZESGQrV01Cbk95Y2U0am44UWM5ZnQ5OU94aFFjdzAzWUw3cTU3VjVER3E3?=
 =?utf-8?B?WklGUTRVaDdyU24wNXdNZjhSb0F2SVVwckR1VkJRT0paaTR1clRyeWlPajUy?=
 =?utf-8?B?Uy9QdGVldFdITGJpTFQwenJzN2lSaXVVQnFRRDFETEdMQWtrdjU2ZnRHKzUr?=
 =?utf-8?B?Yy9ZOURkWVpMRFJndkl2LytwalZDMVVKbUxJYWI0T1hib2E5bkdYQ2dibUhw?=
 =?utf-8?B?T2w2NXRMRkRiU3NIdnVPMjhMVkRnZXd2R2d5WFhQMGpvZW1QRDJvWTdLTk9k?=
 =?utf-8?B?Uzhwc1JaWkZEMHpVTFdZeUFvTk1sbG14c25YSjVqUEh6aEJoZXVPZXVVRks1?=
 =?utf-8?B?WVkxNHdCU2RlOEVXT1BNZ0ZXTk0wRmxIN1YzTUJkdER5NlR0SDYyTlVsSzBG?=
 =?utf-8?B?eGFhTzBRNUpQNjZxaWU1Z2dSV0FOWFZCUU5mWFlqekN1T1BTV2h2ZzZ2Wmgr?=
 =?utf-8?B?cTkxdTJKdXI1YWFJT2lNTmVSdk91Y2J1YjVLSHRveXFhRTRoRXkxZHJzK2JW?=
 =?utf-8?B?NU5CMGRXMytoQWExL2dOTW4xTm0yMThnNlo4cU1ORGRXZGI0VVQrWU1SbC9V?=
 =?utf-8?B?UzdqYm5SR2FYZndtUVZQK2JkUjJ1WUliY2pNWGtTbHdHNHRUTlJzekNPU3or?=
 =?utf-8?B?Sytja254VGQ0RDBBNjZnU1hiaXRGQi91OXNGQ0tEejhjckhNeXFESmY1T29M?=
 =?utf-8?B?WDg2ak1WTGd5ZlorS1h2T1p3ZERpbW9iQlh6bkVMcDEyYXVTOUVYbmZGblQz?=
 =?utf-8?B?Vnl3OUJFWlpORndjNkFWd2tKVTVMcmVNRFROMk5xZUh5bVA0d2h2Skd1cUFO?=
 =?utf-8?B?bUhQNUxuMEFzME1INnBGRkl5TjdUa3pMOTFOYkFZYTlRV0NvTkdXblJ3bitk?=
 =?utf-8?B?MWk4RFR1TVpEN0xGc3pnWFY3czV1NG5jUWxqenRoU3NUS0c2OFlXSEtFa0xW?=
 =?utf-8?B?MDE1ckd2M1kzUVlzZzFSK1lFSzltcjBjeWZDNUVxV1lkaENjb1FwK1dtNGt1?=
 =?utf-8?B?OFI2N2ZIbTg2cHdqSGtHczB6VUVReUhUWGd4ZUdhNThCTW5BUGt2K3hpRitF?=
 =?utf-8?B?dEQwdEY4U0R3dGdhbmhMQkhqQmg5em9mdDczS0lDQm1jS09NL3VzMWdIdWdy?=
 =?utf-8?Q?ooDM=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 740212e6-6200-48d0-83d4-08dde0efc524
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 20:17:36.7783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mReCaB4ZcCLCvX/FAj2Bo+UYlh8P/u+Hvs2nO3cdFTKQcD9PYV5XR8reLzGppAiRiajxYqtFwHa5/hGG33CJfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8438

Move number of pad macro to imx6-csi2.c. The number of pads is platform
related feature.

This version just support maximum 32 pads.

Prepare to create common library for dw MIPI CSI2 controller.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/staging/media/imx/imx6-csi2.c      | 12 ++++++++++++
 drivers/staging/media/imx/imx6-mipi-csi2.c | 27 ++++++++++++++++++---------
 include/media/dw-mipi-csi2.h               | 21 +++++++++------------
 3 files changed, 39 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/media/imx/imx6-csi2.c b/drivers/staging/media/imx/imx6-csi2.c
index b7ea710df07cba33465d79ef57be4792c503958a..062db72a36ef294566272d9f39d82e9414640e9a 100644
--- a/drivers/staging/media/imx/imx6-csi2.c
+++ b/drivers/staging/media/imx/imx6-csi2.c
@@ -4,6 +4,7 @@
  *
  * Copyright (c) 2012-2017 Mentor Graphics Inc.
  */
+#include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -60,12 +61,23 @@ static const struct v4l2_subdev_internal_ops csi2_internal_ops = {
 	.registered = csi2_registered,
 };
 
+/*
+ * there must be 5 pads: 1 input pad from sensor, and
+ * the 4 virtual channel output pads
+ */
+#define CSI2_SINK_PAD		0
+#define CSI2_NUM_SINK_PADS	1
+#define CSI2_NUM_SRC_PADS	4
+#define CSI2_NUM_PADS		5
+
 static const struct dw_mipi_csi2_config imx6_config = {
 	.module = THIS_MODULE,
 	.name = "imx6-mipi-csi2",
 	.internal_ops = &csi2_internal_ops,
 	.grp_id = IMX_MEDIA_GRP_ID_CSI2,
 	.gasket_init = csi2ipu_gasket_init,
+	.num_pads = CSI2_NUM_PADS,
+	.sink_pad_mask = BIT(CSI2_NUM_SINK_PADS),
 };
 
 static int csi2_probe(struct platform_device *pdev)
diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index e5593f23253b92def63040fa70fcf5fb50ec2fd2..d591288d2240c9042851f3a862299d372af9775c 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -399,11 +399,11 @@ static int csi2_s_stream(struct v4l2_subdev *sd, int enable)
 	if (!csi2->src_sd)
 		return -EPIPE;
 
-	for (i = 0; i < CSI2_NUM_SRC_PADS; i++) {
+	for (i = 0; i < csi2->num_sink_pads; i++) {
 		if (csi2->sink_linked[i])
 			break;
 	}
-	if (i >= CSI2_NUM_SRC_PADS)
+	if (i >= csi2->num_sink_pads)
 		return -EPIPE;
 
 	/*
@@ -500,7 +500,7 @@ static int csi2_set_fmt(struct v4l2_subdev *sd,
 	struct dw_mipi_csi2_dev *csi2 = sd_to_dev(sd);
 	struct v4l2_mbus_framefmt *fmt;
 
-	if (sdformat->pad >= CSI2_NUM_PADS)
+	if (sdformat->pad >= (csi2->num_src_pads + csi2->num_sink_pads))
 		return -EINVAL;
 
 	guard(mutex)(&csi2->lock);
@@ -509,7 +509,7 @@ static int csi2_set_fmt(struct v4l2_subdev *sd,
 		return -EBUSY;
 
 	/* Output pads mirror active input pad, no limits on input pads */
-	if (sdformat->pad != CSI2_SINK_PAD)
+	if (!(csi2->config->sink_pad_mask & BIT(sdformat->pad)))
 		sdformat->format = csi2->format_mbus;
 
 	fmt = __csi2_get_fmt(csi2, sd_state, sdformat->pad, sdformat->which);
@@ -574,7 +574,8 @@ static int csi2_notify_bound(struct v4l2_async_notifier *notifier,
 			     struct v4l2_async_connection *asd)
 {
 	struct dw_mipi_csi2_dev *csi2 = notifier_to_dev(notifier);
-	struct media_pad *sink = &csi2->sd.entity.pads[CSI2_SINK_PAD];
+	int sink_index = ffs(csi2->config->sink_pad_mask) - 1;
+	struct media_pad *sink = &csi2->sd.entity.pads[sink_index];
 	int pad;
 
 	pad = media_entity_get_fwnode_pad(&sd->entity, asd->match.fwnode,
@@ -679,12 +680,20 @@ int dw_mipi_csi2_init(struct platform_device *pdev, struct dw_mipi_csi2_dev *csi
 	csi2->sd.grp_id = config->grp_id;
 	csi2->config = config;
 
-	for (i = 0; i < CSI2_NUM_PADS; i++) {
-		csi2->pad[i].flags = (i == CSI2_SINK_PAD) ?
-		MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;
+	if (!config)
+		return -EINVAL;
+
+	for (i = 0; i < config->num_pads; i++) {
+		if (config->sink_pad_mask & BIT(i)) {
+			csi2->pad[i].flags = MEDIA_PAD_FL_SINK;
+			csi2->num_sink_pads++;
+		} else {
+			csi2->pad[i].flags = MEDIA_PAD_FL_SOURCE;
+			csi2->num_src_pads++;
+		}
 	}
 
-	ret = media_entity_pads_init(&csi2->sd.entity, CSI2_NUM_PADS,
+	ret = media_entity_pads_init(&csi2->sd.entity, config->num_pads,
 				     csi2->pad);
 	if (ret)
 		return ret;
diff --git a/include/media/dw-mipi-csi2.h b/include/media/dw-mipi-csi2.h
index d3e1c334df692c5dff10b467d759fe4da45b7b5f..12e1db1d149513fcd0db8c191c801cb144d18143 100644
--- a/include/media/dw-mipi-csi2.h
+++ b/include/media/dw-mipi-csi2.h
@@ -11,6 +11,8 @@
 
 struct dw_mipi_csi2_dev;
 
+#define DW_MAX_PAD_NUM		32
+
 struct dw_mipi_csi2_config {
 	struct module *module;
 	const char *name;
@@ -18,22 +20,18 @@ struct dw_mipi_csi2_config {
 	const struct v4l2_subdev_internal_ops *internal_ops;
 	/* Deprecated, should go through phy interface */
 	void (*gasket_init)(struct dw_mipi_csi2_dev *dev);
+	u32	num_pads;	/* Max 64 pad now */
+	u32	sink_pad_mask;
 };
 
-/*
- * there must be 5 pads: 1 input pad from sensor, and
- * the 4 virtual channel output pads
- */
-#define CSI2_SINK_PAD		0
-#define CSI2_NUM_SINK_PADS	1
-#define CSI2_NUM_SRC_PADS	4
-#define CSI2_NUM_PADS		5
-
 struct dw_mipi_csi2_dev {
 	struct device			*dev;
 	struct v4l2_subdev		sd;
 	struct v4l2_async_notifier	notifier;
-	struct media_pad		pad[CSI2_NUM_PADS];
+	struct media_pad		pad[DW_MAX_PAD_NUM];
+	int				num_src_pads;
+	int				num_sink_pads;
+
 	void __iomem			*base;
 	const struct dw_csi2_regs	*regs;
 
@@ -51,8 +49,7 @@ struct dw_mipi_csi2_dev {
 
 	int				stream_count;
 	struct v4l2_subdev		*src_sd;
-	bool				sink_linked[CSI2_NUM_SRC_PADS];
-
+	bool				sink_linked[DW_MAX_PAD_NUM];
 	const struct dw_mipi_csi2_config *config;
 };
 

-- 
2.34.1


