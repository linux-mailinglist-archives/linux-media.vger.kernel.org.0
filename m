Return-Path: <linux-media+bounces-40682-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B673EB30601
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 22:40:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E0F717C01A
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 20:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59BDD388904;
	Thu, 21 Aug 2025 20:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="geRJD+yd"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013064.outbound.protection.outlook.com [40.107.159.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D951B37D5B4;
	Thu, 21 Aug 2025 20:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755807529; cv=fail; b=obcjZTddlejyLqlyn3X65WU/IloVwuji7EuWb2ZlrWEq7a2aIw9hok9hbvjHZ4Q3vJoPNolopUe2zkXxyolZYpBb8VmLG8LWVeWMH0RV1/vZvBJ8OrQE8tTPADkLrKomE9sEEdfQKBbnZsyFiXJrkn+KGphczSRLLi5XOp54Uh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755807529; c=relaxed/simple;
	bh=qWVsquHGhDd64SFLAyClZ64a2Eo3tPOBOv/foAqdFEQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=jZE9FWSg1h7fBBptO2t2mC21BxLhmDqrg//XHZqaXA9aqGGocw9H7jWRy5AI6HYaG9FDS+cWC/IrRIqlHfVm1mG03h1H392aQkbyHh+m52a+S+D5z4nhhjYSEZiZSfW0ZThtBAO4tPcntgnbP0yjSRMaiJk+EW2TPX4XVrOV6ag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=geRJD+yd; arc=fail smtp.client-ip=40.107.159.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XKTWnLaDID1uGQUQM8Q9UyDp0smlbyRAapgDSt6XtcKqeRpPpIlLDmVxP/EFG7kUsLpx1qSmSD5ulEF0Lm0jedMsxrhj6x5W++F3GAHKgaS6D9nbQWvSKH0BfPFV1zwL8ajGQs/MQzpU3QWtD4ZNnAQaFsRPQUDUwt+l0bnCmzakE1VB1LCeyreywBdcBX80cD5Ej3TkZi4B2cpOTkRxd1aBOQh2kfhI7t8Y95oFcZQqPWRI9MCpxwgjAy/neH56J/I0Mmd26Q6MTycZdyMGqs0DLn3U8QkizR8tpF+HC4R8m6naPUFrHiPQoVFBwNVbA5RDK6SBjjHkaEWMkz3+9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8/86aNc7rhhTpxV3iBf8fVoMhWF2oSw9UYKMHUp8xg=;
 b=AptrFzih/IVz+4V5O0vM8cRhzkWjJYGnvMtCTquMkymuw84EMzDn9+PuBozxYzFDMx1AeImq9/1vCZAfMx8aEctOgWHp6JdBlg7w7gYr3zW9WTInpdQOhtT0UEO1tzYz9oM1Ly8znqSuPnSh1j8GrllIc/Sfh/XbT5la76UW4ib1YWLLCyxD3pgOU3zqKwkhrFKyWRMPu22CTRC6B+BX1kT8tDRQw8YmyWy192rROeQBQwiOBPbl9EA1VrQkIo3G2QNy76aROHu0BwaHbDKSqFqrLLbTw72WTp8G6hHq/HHLUKIDxeWFftFqa0qXuvPZmV3LRWP7pCDB3JDpvGT2iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x8/86aNc7rhhTpxV3iBf8fVoMhWF2oSw9UYKMHUp8xg=;
 b=geRJD+ydBsdJBFRWW2tFbAxJyecCT6i+xk/FtLcn7x4kQE3I7WJOIm/7v0hm8d3D74U2DUDnCQiOgUrjK5GJDILrOy/SZ5ZX6jf5n0LiHlcDk231kyQDnlTWLDsliyTCxq6l3ZVY1gnqDlz/t4DH2LIDhE/WCtfTcnEHHhrOi0/FlVO5Rs1jHZ+oFZOvXwFtp1qXebcH8QOezFHSE1VipaFaCwdvMN6s4bb54t5cl6XCj8PrWRRLuy2WMgUuITu/6NDfeZWUxpTDK/s7U/Y8aMmHdji1fXT9Owicn7SJNWB/2u7p++HMvUEW6z8TbdiSv6n6BIbOb/zDeCpP2LmYtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM9PR04MB8438.eurprd04.prod.outlook.com (2603:10a6:20b:411::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Thu, 21 Aug
 2025 20:18:45 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 20:18:45 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 21 Aug 2025 16:16:00 -0400
Subject: [PATCH v3 25/31] media: synopsys: csi2: Add default simple
 dw_csi2_subdev_init_state
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-95_cam-v3-25-c9286fbb34b9@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755807362; l=2835;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=qWVsquHGhDd64SFLAyClZ64a2Eo3tPOBOv/foAqdFEQ=;
 b=wWE7QivrZAdSsXT1MjJSRC/2wqWX2uEZ1EODukp0A3Trk7ig6Z/oWN+NKv5TNg/y8EBvR4OV3
 WL5UArlyzdnDV+srE0kMoKecJn4ougfqXvbIYP4KvsJGnmbOQEJFWpe
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
X-MS-Office365-Filtering-Correlation-Id: 34730e0b-3d08-4d52-c544-08dde0efee09
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|19092799006|52116014|7416014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?YkdlRHhtN0ZENmxIQ0J3YTNtbDVPb1BTb29RR2hCTzFoRXFrandmYnZEcXpu?=
 =?utf-8?B?NkVXb045QkdzQnhabkZ5ckdBWVJOd1VtZ29uU3VtNnRObENPOHhwcFA0N1NV?=
 =?utf-8?B?cjRCRFp1RXpiS0pPOVdQeGc2bU5TV1ZnWlBGMkxPRzJTN0lnZnZaa0pBWHE1?=
 =?utf-8?B?OVRzNGZENXFqT2t6QUhDMnVoQlZ2ZDdLSThoUjNGTUwxOVU2b3RXNnl2QWs5?=
 =?utf-8?B?cytwZTNRVE11NVVtMCs4c0VibkQ4TlBmN0pIQ2NyWnI0OFNObU9ZcWwwZGVy?=
 =?utf-8?B?Qm1LNFhOVnRBVmhLU0ovSldqTFRPTk1JN09hZC95YzYyT2JCTlNvU1g5VkdB?=
 =?utf-8?B?eXYxTmNSSEMvd0laYTRybHBxZmF5Q0k2RXZrMjl2MDJuVDYwZkZZcmNrTGZM?=
 =?utf-8?B?NCtaWWhDY2Y3NERsYXVKRU9wcUpTK2tzaU1Md0JwdlFmNG1USFh4VEIveVRq?=
 =?utf-8?B?cFBod2k4eTkyQ2JsZUpoS2YwR0xnZXkxajUrdHVmcmIzaXRDb3IwRlBGck8v?=
 =?utf-8?B?TXpXcHU3eHl6S3B2NE9RUktyZ0NpaDZNS3pncGZmcEhyUnZObDFlQnFLdERM?=
 =?utf-8?B?RFNyOGdNazYvZkhKQ2V4bUQ2OTBWUnVkZE85Z1NpYjc2U1RxeHFUdVpIcVh3?=
 =?utf-8?B?SnBHQTJjKzdqRjZJcnltY1RKcXFiZlFiWHNaV0YvVWpmNURUdUVlakhPejhD?=
 =?utf-8?B?RmdEeHcvNkNQVmFDbXNzSkpPanU4VjVtdDhhcGdOUlFxeWszNkpiL0ZFTHAy?=
 =?utf-8?B?WFpid0l6RTJtNUxoT0ZJaXFZd2FEcFhPYk1nMmlmZXJoU0xUQnBxL0JpRDQv?=
 =?utf-8?B?RHBxemJnUDVtSzU3WVprR01tOFdVNlFMeW9RQnlSUTJpY2Z0SUNoR1hpcFI1?=
 =?utf-8?B?UloxTE1CeGlNcGpMYXJMaEZnR0hYUkxQVE40ZmI4SkJFUGJ2R29lMXBYd21N?=
 =?utf-8?B?VlB2TCtKYitSRllPbHJ3WWpIbXUvNURKNlhSS3BHaDVuWlpJc0tITDFaRllq?=
 =?utf-8?B?STNKbEQ1VlJXcmpnQmlLVG15d1hUakNBazVZdExMM05icVFlSTYyMk5teUhE?=
 =?utf-8?B?NkdNcmRJSHcyaStwSUVxQkVxbkcxTHQ0OGNTL1dkRlhheFhWN2Y2eXVKSFNP?=
 =?utf-8?B?OXdERU5La3lyVG1RSkNodGpLUlA0Mk9TYUtVVS82YlBuK2dVOThUM2tqM2JH?=
 =?utf-8?B?S052Y1NLWnZmU1BoYVo0K1M0TjV3dCsyczZBbkVRbnpXdnhrTkRVL0V2SmVw?=
 =?utf-8?B?U3hwV3pKS0g2Y1lSTEJ3eHJSRFdVMHRpYkdsK3dOR1VlNlJLWG8wdU56UkVt?=
 =?utf-8?B?WVlpendmeTQwdDJNYWlRb2plbDFRYmIvWW9NQjdhOTFVT3Q3WGNSUnNibW5R?=
 =?utf-8?B?WURKMlRielp6b2tOM1FzY2FaMVNUYWRmNjNtYU9YN1JVdUFQQXNsWFNGTi9z?=
 =?utf-8?B?ZlVoenVUeGxHbXNhMnRnb1FZUW5FNStBYWpmaW91eDFLTTNTN1dqNkhDNktQ?=
 =?utf-8?B?VkpyaXFkWStqV3VMTlNxcTB5ZUhVNkszRC9ZS0ZLSVdsYjIvektJVmNaVXVq?=
 =?utf-8?B?ekEveDl1NFlyb0hLajczakZDZHFzVTcvcmdicjEzZ0l6cnd5OCtsQnFCWkZP?=
 =?utf-8?B?MEV0Tk5IVmxuVW9IV2xNUithc2VFc0s0YWo0UlRhcEs1OHpLdXlaZXlORUlx?=
 =?utf-8?B?bm9MYW12MHBTWTE4Mk5oaFRwZ3ZxdDhyZWgwSVhxbW5SN1NNL0cycHVnWmwr?=
 =?utf-8?B?WjhQNklkUFVqcWpjQysyZmUyNG1zVnV6L0g5d2RRWjU2dUFPNGtSbmszaTY2?=
 =?utf-8?B?WmlpT01sTE5HcWlZM25hVEcrOE9VZElUUlNXZW1WWjVFdENudll4UjZJeDhi?=
 =?utf-8?B?RFhHMjdYUEFtZDdoV01KbWFlejVqaE1ncGdOV08wdlQ3YXdwWk1EWWQzRk1O?=
 =?utf-8?B?MmpBY1p0azE0QXR5WkNXQUltWHZWc2ovcXRZUkRSZk9wN2N1TUVLVTFERER0?=
 =?utf-8?Q?8rcsdKSYuHF5Tb/OqWwSGP7+rtB5E8=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(52116014)(7416014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?bkJOUmpETzM2NEp6TmIyWS9oc3RJUDZmaXN6Z2k1NU9sRzR4Q3NiclVoay9k?=
 =?utf-8?B?ajZGTFFFdXpuL3VBUnlNNjNoS0RUb2p2dElvaGN1RDI3b2NnOTdZUTVubXN6?=
 =?utf-8?B?elVNdzhVVEVodUxPeXJSUHVHaEFQMFJXcEJhUWoxcXpHS0JSRzJ3WWNBWkZS?=
 =?utf-8?B?UzFMb1NzRkRSYk80N211d28xSzFiU3NhRGNMaUE3NXNBbUptR3RqaFhuTmsx?=
 =?utf-8?B?dnh1Vm5SK1VRYUMyRFkvMVVSRVBYUzFEUWlwaFAxMFNDVW1OMjM2TlVqTjlw?=
 =?utf-8?B?VnEvSmJrc2FkQTA0SVlWOE9EZ3hrQlRKSGFTZ3pxSU0xU3JYd2MreVhDellw?=
 =?utf-8?B?a1RtbmN5Qlp2WCtMbTYxRFZJbVZ3ajR1YTB6SzltS0NHQVhoRkxFRjJSTXVt?=
 =?utf-8?B?b1M5bkRkMjlKSzR3MDZ1RVFtczEySWR5eHBRM2xOYVQ3aW9TbFVmeGtDall0?=
 =?utf-8?B?QTUzcGQ2aWlCOURqRFpicTJUcEVSTDNEK25VVXB4NUxQeXJEODA1RGlFVGZk?=
 =?utf-8?B?SWVYNHFOVUlNMVgyVGtXc2pMWWh5UjlDSnh4TnhnZWJxN0JPNFhXcTlRU2JS?=
 =?utf-8?B?SGFGeDZJWDZtM01TVFdONjA4RlNXck5aYnRxSEFvK1N0aDJOQUVRakVzWHFY?=
 =?utf-8?B?UjFiWkFoT1NGbVI0ZHFEMno3UEFibmgyajFyMUYwQnArTFN0NSt4eldoYUpN?=
 =?utf-8?B?MHVaYm9IeFZIZDBXODN1cUZTVmppV3RPd2gvWkFMNG5VTWJsaElNVEF3NDE1?=
 =?utf-8?B?Y1JiZG1RTzVldUxiQ3N6TXpSUFVIN3NrckhyS0ZldFNvSDFyd1NiNzBZdnZO?=
 =?utf-8?B?L1dINkFYNHRqUlRRL0RuVVZWWFQ2L3RyaDJDck0wVWU3SjU2K2RUeFBSN28w?=
 =?utf-8?B?WXNTLzJIU1I5NU8rbnhqbjRKdGMyTTZSbWswZVc0YjRMVnNNbjNENkRDaHRp?=
 =?utf-8?B?T1p5Qmp0QVp6c1pMalVMMEx3dzVmOTBVWjErL1dRS1dWL2ZnK0Nlb24vMHk4?=
 =?utf-8?B?SjNlMUtqaHA3elQ0WThyUmJvQjczblFEazZGVy9tTkVsZXZzMDcyR0N0OE8x?=
 =?utf-8?B?M3l6WUxzTHczb214eUU2UndjN2JNQlBId0tjSVdJZTFPK0FWVlc4OWV4R2Vo?=
 =?utf-8?B?eFdnMVJWV3JZcHBVWUFIaU1RTmVaMDZhWkNDUzNuUzVScytmeE5tSXREYzJR?=
 =?utf-8?B?Uk1xa3RwLytyenN1TVN6TVFJSjArUVd4TmpqRk9uWG1vWWxRaVQxZGhISUg5?=
 =?utf-8?B?ZFFuaks5b1JuNUVTaXp2bEdqNThNb0NONlQ0SE16cTRFbkZveHZkUnB0aE1B?=
 =?utf-8?B?em5CVnE3cDFLWExtQkJrNE1oR1dGcEYrNTU3ZnRTeW1taUN0QmViT2dqZit6?=
 =?utf-8?B?c2FpNlFSYUpCQVJMVG1CN2Ewa1duOEpZbTlxT0ZiMUFUc1k0TTM2NUkvcGlD?=
 =?utf-8?B?M0QxWjU0Tm1pOWNJMk55TXRyajY5R1VyYy9jNHVJSEJrS29PZHNSSGV3OGE1?=
 =?utf-8?B?WWlqQ013WkFDQTkzS09MSzk1QTA3VHJ5d3JEcC9CV0NiYlduTS83RGZqRzF1?=
 =?utf-8?B?ZTNJRGhxYWZuRUVNUXNST3ZObHMwTnBLb0JmdDlJSU1BZlBHWVRXc3JNWDBq?=
 =?utf-8?B?TFRGclZRL25JZDNySFRrYy9ETW1ZVDFCZHVRZUgyVkVVNTdJVlVJN2Qvbjlt?=
 =?utf-8?B?cUluS0lZQWxmMXYrQTYvUmIraDNITHJSLzZpR3ZBR2FuWWl0di95TVFYTnRC?=
 =?utf-8?B?RnBIeTA4ZzgwR3I5TDBsa1ZobWU3Yit0RmpEL1J5NzlUZ2MzczhFV2s1b0VR?=
 =?utf-8?B?T0RGRkppVzIrM0crRmkvK0F0M0haaGxxQWNabjZlQ3djeHNESXl2Qm56Y3R3?=
 =?utf-8?B?eCtWNGZYSU5vRVRHZTVwbnlpTmJpT283Z2R1TkZCN3NyUEhyYmFGTzI2cHox?=
 =?utf-8?B?bVRlQWYrZDBtVmt3L0hTYTkwWFNpZ05Gb0tlY1VVM0t1NmhaVldSTGkrZ0pU?=
 =?utf-8?B?Q2JwaVJyckoxb2tFQzBqak5zQzBmVHZ5OVg2OEtlWE9NTXdMYzdWUVYyTkxy?=
 =?utf-8?B?TUtaVnppL3p6N0dVMENEUE1rSFBtRVczQU5zUUowSkJ0MXJiYWUrOHMvYThL?=
 =?utf-8?Q?jym4=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34730e0b-3d08-4d52-c544-08dde0efee09
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 20:18:45.3072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zAbS6yF/QhCA2wh1O1CS4tqHmx+zNBQDIug8QO81ba715IHqjb/EOLYFGt8/xoPIOdMWzQeRE6eT5/3oRoMy6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8438

Add default simple dw_csi2_subdev_init_state, which have 1 sink and 1
source pad, 1920x1080p and MEDIA_BUS_FMT_UYVY8_1X16 format.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/synopsys/mipi-csi2.c | 57 ++++++++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/synopsys/mipi-csi2.c b/drivers/media/platform/synopsys/mipi-csi2.c
index 632ae5fd7da7850374c79dcff63b6ee4aee7b611..0b3bb099329017e81d2fb41387a3671e429dfe1c 100644
--- a/drivers/media/platform/synopsys/mipi-csi2.c
+++ b/drivers/media/platform/synopsys/mipi-csi2.c
@@ -831,6 +831,59 @@ static const struct v4l2_async_notifier_operations csi2_notify_ops = {
 	.unbind = csi2_notify_unbind,
 };
 
+static const struct v4l2_mbus_framefmt dwc_csi_default_fmt = {
+	.code = MEDIA_BUS_FMT_UYVY8_1X16,
+	.width = 1920,
+	.height = 1080,
+	.field = V4L2_FIELD_NONE,
+	.colorspace = V4L2_COLORSPACE_SMPTE170M,
+	.xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(V4L2_COLORSPACE_SMPTE170M),
+	.ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(V4L2_COLORSPACE_SMPTE170M),
+	.quantization = V4L2_QUANTIZATION_LIM_RANGE,
+};
+
+static int dw_csi2_subdev_set_routing(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *state,
+				      struct v4l2_subdev_krouting *routing)
+{
+	int ret;
+
+	if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
+		return -EINVAL;
+
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
+	if (ret)
+		return ret;
+
+	return v4l2_subdev_set_routing_with_fmt(sd, state, routing, &dwc_csi_default_fmt);
+}
+
+static int dw_csi2_subdev_init_state_simple(struct v4l2_subdev *sd,
+					    struct v4l2_subdev_state *sd_state)
+{
+	struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = 0,
+			.sink_stream = 0,
+			.source_pad = 1,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+	};
+
+	struct v4l2_subdev_krouting routing = {
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
+
+	return dw_csi2_subdev_set_routing(sd, sd_state, &routing);
+}
+
+static const struct v4l2_subdev_internal_ops dw_csi2_simple_internal_ops = {
+	.init_state = dw_csi2_subdev_init_state_simple,
+};
+
 static int csi2_async_register(struct dw_mipi_csi2_dev *csi2)
 {
 	struct v4l2_fwnode_endpoint vep = {
@@ -954,7 +1007,9 @@ int dw_mipi_csi2_init(struct platform_device *pdev, struct dw_mipi_csi2_dev *csi
 
 	csi2->sd.owner = config->module;
 	strscpy(csi2->sd.name, config->name, sizeof(csi2->sd.name));
-	csi2->sd.internal_ops = config->internal_ops;
+	csi2->sd.internal_ops = config->internal_ops ?
+					config->internal_ops :
+					&dw_csi2_simple_internal_ops;
 	csi2->sd.grp_id = config->grp_id;
 	csi2->config = config;
 

-- 
2.34.1


