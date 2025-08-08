Return-Path: <linux-media+bounces-39170-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7284B1F0EE
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 00:45:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C721617BB51
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 22:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23F0329616A;
	Fri,  8 Aug 2025 22:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lFpFR5+Q"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011047.outbound.protection.outlook.com [52.101.65.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC1F28C5BA;
	Fri,  8 Aug 2025 22:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754692909; cv=fail; b=cNLRZJoV0Mc92NjN4KRrAdgLqcqSr9w5w51ff3ykN/MU6Yb78GJ7PoGIaCQXdtDjCkPlETRAXIRB4vpZgpbMIA1ljMVAJGRbVIO/HlBtrRxkfhQA23K3gMf1NsLq2OfiSeGqT5rtLwU+iUhTr5HwBi3TJlzSRpmL/DqrgV/2Nbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754692909; c=relaxed/simple;
	bh=S37Bf1KZBfE8dF5MUGPi/zF/YObDJGNoXWg6MjoaFzQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ibgm61JUng9PKaunXIZWflMRFNUxQDaywOBwSHRykcLqDVql9uEnuprwBLSL8q0VlbdXv/ZOLAMMx6qQgWAYHbDyQa3LuiZSPhm5yt8nM0EHQyvdA14rn66anzPlycucU5ifkqxdGEvB91Mg5U4l0t0UNEHvLpirKpYuhJ3zcoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lFpFR5+Q; arc=fail smtp.client-ip=52.101.65.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IgRRBzEaTkQ51kBbl/gaF0MqFTyOkJ4+bLvIr4VxukcFoJVDHl8+cTsRndOVqMwihsc8bGVATxjiqWaHIPHfNCn+spsntPEL8EkPbWmjomHdLTncbWEIi0rS43mmdA7+jPT2CrUZoP2eLnLep2uW/d5uNqm+fPE5BPw1Wi63l2+KCYebkLB7gd0OQ2EO3cdrBgKWq6oPfqex/IqZl0f9qGkiVgrYq5zp2Mv3sW7sS3Rmqwcz6tBSGrMI0e5nd+eG8RdnEj4evsq8AIQ9mAslMYRWj5+UeeCFWpTMcnl1CyHPfFXCVsxkD27WR2KoYXkoiEBvtywYHwAEUZ6rdK/0dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JwCXkMMYMtGtf/YAT9fCxB/d8zsUxX3DACZ6s1GR+cU=;
 b=GL+n3/VYcnf8wcBTZ5Ba1IDXDK6/vDMDSvebHUqytH4y4BDUd337hnjf1cNyESo448qybFueLrZKnrQ4eC8/OcGAeGcPJw5V0cwh6ox43ofzSt0ATCUQlD5IISghFN/EcEfbeo2ifhvv9R9PmjvSU4fuboPhnjj4MchEUKv6mLIeuYXSJ2qK4iiY5Odtw0ZRHvXmHf47OkesiDXlMzzUU3ZUDJezgxnQIBO1zE9JFW35q2QDVDzL3+BNg7iGCMMpNp/S/4Vq5I48G8yjLvWpAyHJn13yCTk+zQtwjmmSB/OqEdR0UYymZBhUaPHUFoZ4o9lSfIixWioHT+zk5Uo7JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JwCXkMMYMtGtf/YAT9fCxB/d8zsUxX3DACZ6s1GR+cU=;
 b=lFpFR5+QQlPkzcQQdGWvzw22+I3Dcs53cURUxu2mCHIh5a17zI0ZxZMjGs2TtZUstuuk30+nP8y6q8rTcdDuLfoaU0s3CIj3TwJLGmLtbLVV7sxPAbh5yF+X1jCPTFF9N+kklBmIazlfADi1U0GxrMNfFN0IV8uaReeVqhhXv4WLwr5Rowf1Tw+siF+PWBocO4mASpNFfXA4CpyqO3EpRdX4GAt2dc5505QNAnh5R4qbNyyPl6GGV3OZEzerute6dkSBNjMno2Fxflajx+PSyKfp0TABYUNYkwae3zEKOTRbW5YWscAE8nwn15RPXTCwyjSUEY0kepBHTJph6c43iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10528.eurprd04.prod.outlook.com (2603:10a6:102:445::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 22:41:44 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.008; Fri, 8 Aug 2025
 22:41:44 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 08 Aug 2025 18:39:21 -0400
Subject: [PATCH v2 18/32] media: synopsys: move imx6-mipi-csi2.c to
 synopsys/mipi-csi2.c
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-95_cam-v2-18-4b29fa6919a7@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754692792; l=3262;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=S37Bf1KZBfE8dF5MUGPi/zF/YObDJGNoXWg6MjoaFzQ=;
 b=CVMHvzO+zzj4+RqyoPqNoXKEDDFGQcjahhsPEA2WeQN7GLFauGOtS5Y7JZ3XyaRWbIT+WyGWF
 5yA7/sOfolEDcXpvCmp8CmoHJebZoOAVu/o2EuRUKNdelmnr66gifyO
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
X-MS-Office365-Filtering-Correlation-Id: 620c0873-bc89-4354-520f-08ddd6ccbfdf
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?TWV5SHJwakVqb3RVa1dkT2dkay9ockNrYnA3TmM5VjI1YnR0VXJxZ2t3VEE1?=
 =?utf-8?B?dmJuQ0dRZS9sOGIwbGhIa1JQRDE2NFNrUXdtb1NKa1N6aWU1dko1K2NUUndZ?=
 =?utf-8?B?VW1BdGtEV3lXcTlQOHJtWTQ0bUxQUzd4YUZmYW5oS0M2TlRxK3BCQ2NIcDJ6?=
 =?utf-8?B?VnJwb3RRYnI5MmRKWTA4TC9RQjdmSm1vR3Ywa3kyakFCWHNPOTRzYUxuYjQ5?=
 =?utf-8?B?akM5d0xaRnhqQnhiK0dMcUlGNUo3bERwd0F0cDN4WWZHRHNtbTN6d0EyNXRt?=
 =?utf-8?B?dEFGbVNwa2lSS1lrWWV1UFZQdlVGSmNZY21qc3ZrSFR3bGgyeUpvaEU0Szdt?=
 =?utf-8?B?cll3YkU4cHljL1hFZGRZcU56U0pSeE13cmdKdjJIQWdxb2FHWDNkek1VOTZy?=
 =?utf-8?B?ZUJOZWI4dGg5ODRnL3g2ZlRxdVBOaXF0Tys1R0crejNtQVhBdGlBdmtkTmMz?=
 =?utf-8?B?eTdoaWIxNHZnRVo4UVNBa1ZwRzRpSWFMcUpiUXFrUlNkdEl2MVZhdXdBbnRq?=
 =?utf-8?B?c215cUhMMitFWGcrYk00dXNpMEFZSmdrc2p1aXM4Y1d5NWlpTmNWZEprakhB?=
 =?utf-8?B?eDdrWUFMNG5KQmRkdjkwQmlHRlg3d3lVUlh3MTlqSGpCSjNYeXJYWEwwS3Fk?=
 =?utf-8?B?MHdrR3lVdE5tM2lJWFVDM3l5MGV2UzhURCtiM2hHRkxUbUllQ3paanRhME81?=
 =?utf-8?B?MEFMcjNiUVFQQTY3ckw4K2tNK3ptbW1ucW9SYTRaTHBISVpnU3h3dnBVU0g5?=
 =?utf-8?B?b1Q4SklPZ3dKcjh0OUxLcEkrU001ejFGWStldHYybXk3Q2phdkpQSUkvakZ2?=
 =?utf-8?B?TjkyaE9aOFJ3ZjNWaHpEYjJkMzhRaytVSDdJdTA3MzNnSlFNbHUwL25FTXhL?=
 =?utf-8?B?VVhTMjR2Und0THJEYklJaVNoUkpwa3BYYlJGQzFmTmJoRHlnOTg0WUcveDll?=
 =?utf-8?B?aVBDZVhuMW9oWlY2WEYxa1VJY0Y0ZXRMV0xOUzJZU0FVS3I2M3Z6RUVyNVNj?=
 =?utf-8?B?aG5CQUR5ZmlVSGlMeUdxK2MrWFEzNGllcVBCNktpSkgybG1PSVlXTzRuUkFk?=
 =?utf-8?B?Zm8yaFhia0I1Um9CQmNJd3JlaDlnTklHOUZ6RU9vL2dIaUY0REZnS1E4VkRw?=
 =?utf-8?B?OXVjRXpaczVya1dySk9zYUVOM3Jiai8xNzZLS2FKWXZZUVlxbjJMOTNVQXBH?=
 =?utf-8?B?WUJNL00vV3VBZlFsbFV6cHkvd3BtVkRqRkFQSFlzdnlPWVZmT3RwR1VHMG5t?=
 =?utf-8?B?cThlZWFITXlRVUh4bDdOWHNodU1PU1g1RmlGb0habUo2SWJURmFrS1VBQlVi?=
 =?utf-8?B?MTlIeW1aa2JvMWQyWlFNTFVkbkRtWVAxYWVjNmE4eU1kUjd3TjAxcThzbGpv?=
 =?utf-8?B?Rno5R1A5MUFqWE1vZ2dqSFhSZDByUG5kLzVwR00zV3FBU3JpbWFOYmZML2ZR?=
 =?utf-8?B?dHdlMW92L0U2RzNmV1p4eXJ5QkVsTCtRa09obENuOVgyandkWDIrREhCd0xQ?=
 =?utf-8?B?RFdCUEg1K2VzZlJxZzdCZllDZWZiZUl1akZydmtjbXZ1cGJqU1RWSzRteHNQ?=
 =?utf-8?B?UGVmZVV6aGVOeVVyNGxUUm1JVXdycGNCcnhQRU1yc0dnYnR6NksyY0luUHUw?=
 =?utf-8?B?blFKVCttSFh5NFVOUVJjSGNRdWovbngyOHV2eFVoaWdCWkZocW9QSmRjMFg1?=
 =?utf-8?B?MXp1d29jVzBtN3pUbHdXSnc3VTRyT01EbTdEaGFTRFl3UWhOcDJTMytvbndD?=
 =?utf-8?B?M1Rvd3ZHeVh5SWU2VEpKbHpwbEdOeWIwM1BjN1VkRGhOeU1aVno2OFdWSGJT?=
 =?utf-8?B?MnFmNVg1TWRFYXVmdmRZTXNsb0VpNlFzM1ZWZURJbnhrWW81SkdXdTJvNjVM?=
 =?utf-8?B?c0Yxc0xic1FOVUpUQ3ZrQW14SjhxL2VDa2lmc2l2dUxWWnYzTGtkdHdKVEkr?=
 =?utf-8?B?VVdzeHAxOU1COFRYdTdyNks0YUxVRXRRd0RYb1RDbXlvZEhGeXA5SnBXdk5s?=
 =?utf-8?Q?KNUSDTsEIILfKw0z0aQBz8nqUjPZ5E=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?c3NVN1dVejJqVktSNGZUQjJUOTNWVFdPV3VOaEFyN1U0MVkzNXlVSFNTdWlV?=
 =?utf-8?B?K3VVUGxFTEtneUk5NjRhZHFSUHc5WjhYb2h4akdNL0pLcE9jdFpNWXJwVWt2?=
 =?utf-8?B?YlplRUxZVStaWERhOVlmT1pMK3pHL2pzL1hyR2R3QlpuT3E2VDB3M1pvbkhV?=
 =?utf-8?B?elVxWEUzUmxrRFdIa24vWWxrbHdhaXVXWGtNbUlld3Y4bVFHTHFtTklTS0VL?=
 =?utf-8?B?SHZIZHNSUkhqQnpyVGJYTWxDdUxVdlgxZncvM2UreFEyejhLWUJDb21VODZp?=
 =?utf-8?B?NGIwUWZMZDB0RWhFeGRjc096THhJN3NkWGRKbVkxR2hLQm1xRTBOcFJSZzF6?=
 =?utf-8?B?Uk5mMm5TWTZ4R3JmYTE1RW8yOUdJQi9kYWNRTS82ejcyNmIxSEkrdlpuUDlQ?=
 =?utf-8?B?ZWVnaklPV1BoUVNHRHBXdlp0TlNpeUtUc1dZR1Y1V05zdWEranJhNE0zK2hw?=
 =?utf-8?B?NEl4SWtidHVENDlGMmtkc0VRYnQ3SVE0UFFFMTREbkR4MWVCV0ZzRXg5YUZY?=
 =?utf-8?B?Y2RqZ2lQSXVVdFFwV2NQQytCSDNOWUdnaUl3a0ZXRjl0L1A0cit2Mm5helFU?=
 =?utf-8?B?M0d5YmVYMTBDRDk5ZXZ0NkdrZG9Gamx2WVNKS1MzT3BOTFBLTFpqZUpOdmxH?=
 =?utf-8?B?QkNBbzAraTdlM0JiZDhrWktSOWIrMk5xUWdKNEx4SktCZ29CYzdyRHJQSkNo?=
 =?utf-8?B?eHlyNSt4aDJEQ1ZjSG1pbEwyM25aSmFrQUlJTm9jM0NGSWZOYlVUbEZhdURS?=
 =?utf-8?B?MTBmMk56dEkwUDRlWTBWcFFjNlBiclBWMjNZZVpZUE9jcjgxbmROL21vcnhF?=
 =?utf-8?B?NkpwOEhST20xZHBWOEwrN3hXWDZZd1ppcVh6Q0JlYXNKRUZCT01YRmwxdHJK?=
 =?utf-8?B?YXNmL1J2ME1sQzZVQWY2b3JvYUM5amFVV29WSnlKSWR4eHV6K0FQdDQ5Zys3?=
 =?utf-8?B?bENncmw5a080cWVFdUZTb0J2bmxMQ2FKajlhLytDZVk1cEdyOXBuOWVsUFpJ?=
 =?utf-8?B?R1dUVERvRUZBR2RTcFRaY2lYVC9Wbk5Ea0pvSkN2SmFlcmd3Tkt3c01RbDZL?=
 =?utf-8?B?V1ova1QvUGRGUWRuRWNiV29KdFgxMHZJaHRJeCtQWDluSzJwS3FlVk94d09h?=
 =?utf-8?B?c1BCazFac3BDZktGTWVxelovNkV6M0xWYVBRYXErNm1zc2xkcndxV0puZFhx?=
 =?utf-8?B?d3NpUkt2UkpPTHV6eG1yV3U1cnJHem16QVJRaUw1QWFmbVpMWlV0eGhraVp6?=
 =?utf-8?B?TEo4QW1OUDg5MG1tZjFBSnBrRExId1k0R2pnK0p6SThwbWpVR3Zsd2tkcnZo?=
 =?utf-8?B?Z0ZWTG5sTzVtR0ljSmQwbnhzTHVKci9HMi90UjRqWkkzTWt6N1lKV1FXVFlV?=
 =?utf-8?B?dFN6TUk3ZEt1Tk5WQmlFNW9FdnVCR1hTTXlWNm9KM3hsVGJ6bm9panhsNWlH?=
 =?utf-8?B?dm1GRWNUKzlGWGRiVnRRTEVxR2Y2VVJLNHhmS3JjckJSOWdib2k5SHFIWTRZ?=
 =?utf-8?B?dFhRaEEyWnd1dWEySlB2YndlbllZcTh0MDI3N2VTNlFLNk5qengxSTZBNmdp?=
 =?utf-8?B?TnFSWFNZR3ZGTnFrekFBMVFCVHg3NmFkL0ZJSmhpTWlOcUhnd2dESDNCYTI3?=
 =?utf-8?B?ZDRrb2Fzd05GQjZ4d2EraWxTUVhlSHdjOTM3OTJDUzBBOWNIRkp4dkE4Qkpi?=
 =?utf-8?B?OGIwL05QSnFUNmVacS9BS2dEL2V1NUU4Nnl1Zkp6Y25ZQ0s3TmF1N25FSzRp?=
 =?utf-8?B?cnlrdHZKdTF5cUIzcVlsRG8rUDA0U2hMK0RnSi9SdjY2VTdIamdzVG5hVGFr?=
 =?utf-8?B?OEtieEZIOTdIVERoUm9NNHBkZmJjcGJ2VFZRU3FJV0lyWWQ0UXV6K2JBWkZv?=
 =?utf-8?B?WmJZUlFYbXEvZDBjYlRSODJwSUVyODJwTTM1UCtXN0R0Zm1YMFRTMTZMb3NC?=
 =?utf-8?B?bE1UZzhacFlUT1dCWnlyWG1ybWdCTUl3U0JnL3ArNUFQWUc4RjJod2xQRitr?=
 =?utf-8?B?S3M3U1EwWlozZHJEd0xneXdaK1lxMHR4UG1hV1M5ejZDMXgzdFQ1RmlJTFlN?=
 =?utf-8?B?L1ppQmFzazViL3JlS28wU0hBTitIUXE0c2hDd2NpSDhCeCtGNmUyallPemd0?=
 =?utf-8?Q?6q+h66EEW/4K0ezi7ntCTA+hA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 620c0873-bc89-4354-520f-08ddd6ccbfdf
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 22:41:43.9765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zEaF1XGUpu71yHxBj30yQibXp11KwSVAfQj0LN09bloBne7hwL0uzW5FCTS7LvEjp5ySJALsm5ngSEnCFWxX1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10528

Move dw MIPI CSI2 common part drivers/staging/media/imx/imx6-mipi-csi2.c
under synopsys to let more SoC can reuse it.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/synopsys/Kconfig                      | 12 ++++++++++++
 drivers/media/platform/synopsys/Makefile                     |  2 ++
 .../imx6-mipi-csi2.c => media/platform/synopsys/mipi-csi2.c} |  0
 drivers/staging/media/imx/Kconfig                            |  1 +
 drivers/staging/media/imx/Makefile                           |  2 +-
 5 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/synopsys/Kconfig b/drivers/media/platform/synopsys/Kconfig
index 4fd521f78425a96985fa3b6b017deef36631d1a9..e54dad835349d420dead6d5313c0623567c28c0b 100644
--- a/drivers/media/platform/synopsys/Kconfig
+++ b/drivers/media/platform/synopsys/Kconfig
@@ -1,3 +1,15 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+config VIDEO_SYNOPSYS_MIPI_CSI2
+        tristate "Synopsys DesignWare MIPI CSI2 Receiver common library"
+        depends on VIDEO_DEV
+        select MEDIA_CONTROLLER
+        select VIDEO_V4L2_SUBDEV_API
+        select VIDEOBUF2_DMA_CONTIG
+        help
+          Common library for MIPI CSI2 Controller.
+
+          To compile this driver as a module, choose M here. The module
+          will be called synopsys_hdmirx
+
 source "drivers/media/platform/synopsys/hdmirx/Kconfig"
diff --git a/drivers/media/platform/synopsys/Makefile b/drivers/media/platform/synopsys/Makefile
index 3b12c574dd67c072901108d88cad64ca3a723938..045ed3177738e6d28aa223804b79e6774e141dc8 100644
--- a/drivers/media/platform/synopsys/Makefile
+++ b/drivers/media/platform/synopsys/Makefile
@@ -1,2 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-y += hdmirx/
+
+obj-$(CONFIG_VIDEO_SYNOPSYS_MIPI_CSI2) += mipi-csi2.o
diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/media/platform/synopsys/mipi-csi2.c
similarity index 100%
rename from drivers/staging/media/imx/imx6-mipi-csi2.c
rename to drivers/media/platform/synopsys/mipi-csi2.c
diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/imx/Kconfig
index 1cd48028b6416ae16ed69c68186281b6c6bcbec8..53e5c1546ac53e4942974a9acdcf078de1cb6073 100644
--- a/drivers/staging/media/imx/Kconfig
+++ b/drivers/staging/media/imx/Kconfig
@@ -10,6 +10,7 @@ config VIDEO_IMX_MEDIA
 	select V4L2_MEM2MEM_DEV
 	select VIDEOBUF2_DMA_CONTIG
 	select VIDEO_V4L2_SUBDEV_API
+	select VIDEO_SYNOPSYS_MIPI_CSI2
 	help
 	  Say yes here to enable support for video4linux media controller
 	  drivers for the i.MX5/6 SOC.
diff --git a/drivers/staging/media/imx/Makefile b/drivers/staging/media/imx/Makefile
index 064a6c6c069aa440c72a483080cbedf89d370193..1978b82fd1876566acbb952a4d14cf9aca35e996 100644
--- a/drivers/staging/media/imx/Makefile
+++ b/drivers/staging/media/imx/Makefile
@@ -11,4 +11,4 @@ imx6-media-csi-objs := imx-media-csi.o imx-media-fim.o
 obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx-media-common.o
 obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx6-media.o
 obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx6-media-csi.o
-obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx6-mipi-csi2.o imx6-csi2.o
+obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx6-csi2.o

-- 
2.34.1


