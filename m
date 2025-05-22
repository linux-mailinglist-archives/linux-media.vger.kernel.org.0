Return-Path: <linux-media+bounces-33177-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DBBAC12BF
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 19:57:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C05E4178655
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 17:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A39CD19E7D0;
	Thu, 22 May 2025 17:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="d29qgDwX"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2051.outbound.protection.outlook.com [40.107.21.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE2219ABD8;
	Thu, 22 May 2025 17:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747936621; cv=fail; b=q1RDbr/z0E3hmMGa4VfAcbBkQ/8lMOVhAd2L1L8TrIBEQRPTEEgIXZY/b1iWUNHlhHRhx4g5z5+WrnqQ6dqc5f5HloI97oKuwS3Z49koebf3zotrtxKUrJsiMrRXyFM1N6HIe0+DsCde+1VNwctIn1fREiWYKlRILD/SwkBkSuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747936621; c=relaxed/simple;
	bh=dD2KQWuPaVCrNB7+5BVyFjRJBcohzXtTch7OtKX+4eA=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Qt3TiBxaZdna4WVrRn6gtP231Tmc8S8I29HKkobmBWvjwt+t5aleuD66twE96i4Q+W7fy4TX/8FoM0QNATqdgI2mkfq/lYxic1nog1TQoBkTrU/PV4EyWEm6FQ2ctYxxNkBaBWb09AfTJj/qK3CLB9/p3bGGj+/s0ik5oErWW28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=d29qgDwX; arc=fail smtp.client-ip=40.107.21.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HhgDS0HnlAUo0TxdgBakKa8kUkTPn3pCrEMppJcgeFegqbxFfoB9kcVz/zutnxLg2EOko1JWvr6itUNcNKFzrQmkHjYoJL1KGyfjLQHOQpkAkJUwiosLxXSYzjDxeTkDEE2AuG6cqI7baJOUzdpqGU4/0e0lAd6ROkLsBNPEtOBFvMfsplwanGVz19dE/wfx2z9oMvp63s42r8QsT4jAy+mWMq0qS/ljvVXqK/mCV40rAjfojfGS965U+wZREfGSb08fM7Y12l9oaV4UUf71g2n/vSn5fpBJVQ2Bgoj+FVRBoLngItUzQ2P4Qy7fA1cjPPIWrZDdvU4HU6MeoDqAwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jztlcGIbdq//yU7Vdp7p/NRbg03K4OtFhNb9HmDTKCk=;
 b=i0LBVxsPwUvR2cFU/QzGgCouGSvS+aFYncFbgLwhAsImNsSw6yf/FDuWZKmQd8fHnikGnyHdg7a3BCrBdD5n2fbK6xK33Fxmr81gNVVf2w5wxOXn7jQMae9rtIv6vUqz7ETgdLHIVqxXYjFHIZIvWVPcRtZHp29PoxywX7YFCsqGQAGpppV2dLY3eskUkzUIE9D2OHsF3rzOh7vrxaJzl6u/Xd4RIN/vM/0NHlL27Brq01cBxJMAjGLCaXwPkLJjFuQhZHbKPBnraVD7Dg5AW5gK6N2Y4oVxS+Sgphl9Xasr7SgVvAJhV/jxLDovhB3Ta4kCGFH4SouhzDUFde9CDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jztlcGIbdq//yU7Vdp7p/NRbg03K4OtFhNb9HmDTKCk=;
 b=d29qgDwXsgvxsT1yBR0CXBDouZH/Pc9mT2V4rT6mwqS9TWDLrGtec/1isFMrDchtCxaJbs3Ygr4JIUsZTOAJXHFOX2hvlGkAKj3cajaB1akiSVQjXaMxve6ylRrwVL15Fvf9vb0qO33Q8WoUAOnyeRCWFja/PJDV++5LS3QKnCHUqJl2HA8OMavNqDWP+MHMu9mlthX44ILIwEt9t8JVu0y1kw4Mz5m95he85vOgMty3ZB1Utfg3xfNbkfXVpufhwJ72E8ePC7Lopylfp3CSvDRtHGn4Hmdnj37EnRVWpdaVI5YZGHr771LKzVmn7penRpvnfwyWKDvYRss0KYlWOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8779.eurprd04.prod.outlook.com (2603:10a6:20b:40a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.19; Thu, 22 May
 2025 17:56:56 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 17:56:56 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v5 00/13] media: imx8: add camera support
Date: Thu, 22 May 2025 13:56:38 -0400
Message-Id: <20250522-8qxp_camera-v5-0-d4be869fdb7e@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFdlL2gC/1XNTQ6CMBCG4auYrq2Zaaf8uPIexphSWulCwGIIh
 nB3CzHBLr9JnndmNtjg7cDOh5kFO/rBd20c6nhgptHtw3Jfx80ECAWIxIvX1N+NftqguUHtVE5
 lLYFYFH2wzk9b7XqLu/HDuwufLT7iev11JCadETlwiSWB0FUGmb60U38y3ZOtlVHsUoBKpYgyl
 6ilrZ3IiVIp/yRCKuX6U5BTCEobY1JJuyQoUklRWpeVymFFufn7uSzLF3+OwsBSAQAA
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Robert Chiras <robert.chiras@nxp.com>, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747936611; l=3962;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=dD2KQWuPaVCrNB7+5BVyFjRJBcohzXtTch7OtKX+4eA=;
 b=9TYFXJ0xiQ+HPZ6TYlnd/MNo82FN1bipVBYmR9x7uBSoCTus+6BIMmSUKSEe46I7jSOH0e2rh
 Ld+DHm9iBNVAkh+YnmcovkaDuuPX/4yBSuDrKOwQq+aesnYhIJkWOoU
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY5PR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::16) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8779:EE_
X-MS-Office365-Filtering-Correlation-Id: d0eb8a6b-0a1a-4a33-bfbc-08dd995a0a80
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?aERkaTRLZ1RkTzIxbWt0ZU0xSC9ZcEt1Q3FYM2lCU1FLd3E0b1p3T3h5RGp1?=
 =?utf-8?B?cmpERHV5VkUvUzJRejdjSlgwVHo2ME9hUnAzNGhCSzRUa0dWR21kQmI3SHhu?=
 =?utf-8?B?UERVQTNVVFhYaGd5cWdseU9oV2ZZdkxQSlZWaEhnQklpRVRMT24wc2RIazZD?=
 =?utf-8?B?bVF2bFUyN3FxYTllcVUxeVFvUStaMDlnbk1KZnJuZlcyUG9UN3lLeFp6ZExH?=
 =?utf-8?B?UkthZFBIemQ4UjRRbXR0VkZIYVhQYXIzM1ZXd2FjdTZrOWJZN3hlWEhRRTBS?=
 =?utf-8?B?VXZ1STdkbjFZNUQ0VjNvODJsTnplTFZZajJPalVSbElSSWxWVVZDTG5xRnpC?=
 =?utf-8?B?YmdYOEhDcDgyeE1rTUtOK2FHL3kxMWxqQlAwb3BJRC93YjNCM1NUZUprWlhW?=
 =?utf-8?B?ZWx6c0U0STg0dWlFM1RiZlk0SkNFTTVOakJDbFZTbERQais5bXkzOTBPK3hE?=
 =?utf-8?B?MU1mZ0ZNYlY1OVNVMUE0N0FTaVlBd3d2eE1jVVlEQ2RJbUJEQlVtQ1UzT3Fy?=
 =?utf-8?B?d09rdFlZQVJ3YW5vbmIvcmx2M0xqdUNtTlJLUEZhczNtOFBuTjYvQ21RUlZn?=
 =?utf-8?B?OUVMNHFoLzJ4b2l4TUVsM3ZBTzgwUXRoYmErNEhhdGRIbHJWMmZIeHJDOHEw?=
 =?utf-8?B?cmo4ajVjcHQvWE9FeTdGa2V4TFFpVVhOUHI4OEFCZnpRZWNRbEwxMU9HV05Q?=
 =?utf-8?B?clJpU3czczFxdGFLV0g4Y0w3UElzb0hXNVRtZ0l4OTBSREYwVTdJaVVRYmJs?=
 =?utf-8?B?NXQxSkJEQlBPcG0xMjZnb2xkRkUyclFkblVWTTBaVlVIeU5KMVpsM2QyL09x?=
 =?utf-8?B?YWxHbmdtdjVZSXN1Z09TRjBySi9GaDVzRkFvZVVYYi85OFM0aEFRbDdBWmkw?=
 =?utf-8?B?QXdhditycmZwSHNJL0U0MFZEQ0w1eFc2bXRwdldzZE9aSzFLajlsVE9LdzFq?=
 =?utf-8?B?blMza2lJbnJpRVhkYnVUUjZwOXBnV2dpR21WSG1VS0wyZ0kvOXpPL1d3Sy9r?=
 =?utf-8?B?a05weDMybmg2eUpFa1VxY1JLT1JUblBodGpOam1MMWZHVUJFK2cxM0Y5aktF?=
 =?utf-8?B?QXRQY1ZUalNlSFMvUWZEd09JTGkzd3dsbzBOaE04WVNsRnNDRHJUVlRPVFZJ?=
 =?utf-8?B?ZUVPZWRDY0NoQVJUeHExTXUyVy8ycEdhSVNhbTJwNUhPWjh6cU5BL215ckxM?=
 =?utf-8?B?UlN3QW5yUkQ4bUhhWmJWYk5VOWZudUtWeVpqN1k2RlZyaXZoL2FrL2trbStO?=
 =?utf-8?B?RnM2TmUyVVc5VkxoYXhpcUR2QTEvc1pUcEpvZ3hpb1YzTUNJS0NwU1dBenhZ?=
 =?utf-8?B?dDlSbWlYRzRSWVNZOURhRWpsa3luUDFtdWtBbm9KYlpDUm9RNVpmV3RFSk9W?=
 =?utf-8?B?M2h6ZnZRVGh6and3aHd1cTRodnh3VVdNZ1VicHRQZDFVV0xaVzJBZmk5ckM2?=
 =?utf-8?B?OHBnK2FTQTR0ZzN4REJia3UwNmpLL1JRQzZnTzVnajdnRkFZb0lMcDhtOFNR?=
 =?utf-8?B?c05aMUtEQ0R1dllUeUpSbmZCWVR5Nk1pUFYvcjFWdWU1d004R2RCZDRTc042?=
 =?utf-8?B?WmxtU2RvclBpTHRKekVGa1V2UXF6YVVXT2VSZzd5TlZGRVRDRHByOURzczg1?=
 =?utf-8?B?R2RpdHE5NXJMcG5aSDNTdVo0b0Uzak9pdWJGVnIzRDdiNlVoV1NMNUNMckFv?=
 =?utf-8?B?QWhUeHB6amlod3dEckx5RnluU1FYb3QwTGdxR1lJSVk0TThKZGNHeHh1NFFj?=
 =?utf-8?B?ejUrb2drSk1DcjZzSkpCTkpHVkRCU3lvN2ZEVTZLK0VaNmxrU1VhLy83VVp0?=
 =?utf-8?B?d1NTYTFTdjI0SkJCSEdmcEM0M21ZektpQ3VkdTRmNjVteVFkaWd6NmZ6WHFX?=
 =?utf-8?B?STdncGN3cG9nSTE1SnFKU09RSTZWblVIdjByVjZwWlgzbVI1aEIzUlY0MDUv?=
 =?utf-8?B?ZzI4TnRVVVdramVYRFpoemwzVGFsOXNpUXlXSDllVXkzQWtraHFCbGpkVkJB?=
 =?utf-8?B?YVliSDZSRUhnPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UDJkZkU1U3ZNUlZLZmVJL0RiODgwb3YzYTFQUHI3dHE4UzJVNXpjUHplRTlQ?=
 =?utf-8?B?d014Y3czY0w2U2Q4WitmNy94c283VVBUOU1NQVJ1TmQ3VGpuVWhMUzlMRUtJ?=
 =?utf-8?B?ZUNYTlRXaEwrazZERXBYWEJyZWVLY2c1b3lBSi9xaG1nYzVFdFRmZXhLb0xI?=
 =?utf-8?B?emxteEdOSFVYWXMxTmUxV00wUDdReXJGZGNFVkorTm0xcStMVzlnWWVWc1Az?=
 =?utf-8?B?WDVES0ZiZmVIWU9sWWo2TnZoNXFjdHliUWpGTXh3NkNkMXdTVFlNcHRRcXkv?=
 =?utf-8?B?WWR6MEZiQlhYRGxjRXJQTjUxMlBUc2s3TSs0TXA1ckFJcGU5UVhKSHhEdGpy?=
 =?utf-8?B?SnZONlRRU0RjYWJ0SUxMMmUyY0lwSk1saUdlSnhqTVJOTXNPNHBXWTlpeURJ?=
 =?utf-8?B?MkY3VkdIbXFIYlowVUlJM0M1czEvdVo1eTNudVVyQjF1c2JwZEJZL3QvQWFI?=
 =?utf-8?B?NnZPM28vRGRIQU12dFdOSk1wZHYrWnp2QjN3eDlyZytpcjExR29SM2FPV3lT?=
 =?utf-8?B?TlUxdnJrTmc4RmZVT2RyekF3TXB3V2ZWN1F1UCsvald4WXpiUUJiMDlYRVJO?=
 =?utf-8?B?MGhDV1UrbGwrNytXdndLSklHb29jWldlSW1MOS8vQ09aZis4UXZISUd1V2JH?=
 =?utf-8?B?aHo0SnBJY3AvSmtOT3VDYUEzY2ZZazNRQUNiTnUxeTlNYU4zRkI1Wmo1QlZF?=
 =?utf-8?B?clMzZmJLS3BqSlYzY1VrZXFGeFRxUW5ueC85VEh5MHBlOGJjaTlsOFVmVGJs?=
 =?utf-8?B?R1RKeU93TXVmalplQXlzN2oyYTZvYXMwY2tkYngwNUdjaU5tQmcrbzcybEZ1?=
 =?utf-8?B?NkowYnB6ZnJjb3RwQzVxRll4Umx1ekJreTU3Z2wxTWJnY21XY2xGbXh0QVlS?=
 =?utf-8?B?MjNoTDJvbXRBSVlaTElPMjQxaXpWM3F0Q1FuU1cyTFNzYlF2c2R0YVd4Y3RI?=
 =?utf-8?B?Q3NEVXNwVEhYNzR5ZFFrS1p4Q2ZvWW45RVd6YW1ZbndEU25tNURWVkVURWtK?=
 =?utf-8?B?dkJ0YkFYMGdRaWhuRTVNNmdPYWw0TlBYVmRwaHVuQnNvMFhpbWVaT3J0MG1x?=
 =?utf-8?B?bzIvNmEzSVh0cForSFRlT0pNVk9YZXlFMk9WUjVMN2doOW1uR0pidjcwZWxU?=
 =?utf-8?B?ekd5SE1NZFNrUndxa25UdTZIREdMOHN2bXdVV0pqcDFuL1BxWWZrRVlpakl4?=
 =?utf-8?B?aXQxS1BuR3VUeGtFZURtYWhzSCtwWE1QU1pnd2kyeElGdWN4Y0JXcTN2bTBl?=
 =?utf-8?B?Z0pGblZNRGFiZUpmMlBXZWNoQm5BRm9YYit0ZWYrN0tEMnJTMFpvcGZXd2h5?=
 =?utf-8?B?ZEU5YzJDaWVSb3hYZFlPNDlNd2xPQ01OQ1kySzhOM2MwR3JmQ0lSN0ttYko0?=
 =?utf-8?B?NmNVRHFwcXZPZlhOcWZGZFJFZlRkdlkveWJZam8xOHo1SGxPSHBZNGo5Q1dL?=
 =?utf-8?B?dDlhOWtlK3VGbEFaZW44QU5yTHpZUkx0VzJqcGowZ3lqblUrMU1HemFWM3ZF?=
 =?utf-8?B?RnV0TW5sWFFHSVdRUE9XYUlhT2Noc1BObU83M2tYM2hJd1NvelViT1FIV01t?=
 =?utf-8?B?d1NKWi9aS0FRcFgwb2xqUDVIVnd5cnU5TzR6eTB3R0JUY056WnNwbmI0SHhC?=
 =?utf-8?B?UUJtTlAwUTJFNU1BSGxXMS9JdFlXemhZS2lNa3o5SWt3b24zYnVNWVFCeEhn?=
 =?utf-8?B?NjZ4MlQzRlNkSHZOdnBMQ2RLMTZpRmpIMnFHTmlZWEJLenlxa3Q2ZGdJTjlD?=
 =?utf-8?B?MFhWV2xkNmJ6d1pHQ0lmR29zY2VuWlZwYW83ZElmVjYyYVpWTXJ6VjFXeXIv?=
 =?utf-8?B?OWp0ejZ1ejRtVkNDNHFPN1hHZFVhbFRVaXFHVG9iUXJkU2tad3hvVnY4VEVp?=
 =?utf-8?B?UmppRjd4M0cwTmFtakZPcGorWXpqQUQ0dFdaVEV2VTgyKzVVV0tMN01KLzdl?=
 =?utf-8?B?SkdQUlRMZGk1KzYyUFhSUlFrQWREZ1Fyb1N5L1NuWVljd2FFc2dubmx1MTVJ?=
 =?utf-8?B?cC94di9tZENYME95amFuazV5djdXY1RqUkNrVEgxZjVMNkNHZzJTMHVNcFh4?=
 =?utf-8?B?dnhkcCs0cVV4Z0Zjemo1VDl4clE0ZEpYRkoxSGF3YnFNYzMzdk5xZ1MvTzVV?=
 =?utf-8?Q?bWViKPrz6SkywEYiF5cLlC6Po?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0eb8a6b-0a1a-4a33-bfbc-08dd995a0a80
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 17:56:56.0878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: srsovBvvVKt03+1cdiv8IU3lemtbTzFXPwBdTxQfg0fUhgRKZRTvbeQhTsZu9ZqKYbmuoP5UcMkT+BDo2NHDOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8779

Add SCU reset driver for i.MX8QM/i.MX8QXP.
Update binding doc.
Update driver for imx8qxp and imx8qm.
Add dts files for it.

Signed-off-by: Frank Li <Frank.Li@nxp.com>

Changes in v5:
- collect Laurent Pinchart's review tags
- remove empty endpoint in dts

Changes in v4:
- Add 4 clean up patches
	media: nxp: imx8-isi: Remove unused offset in mxc_isi_reg and use BIT() macro for mask
	media: nxp: imx8-isi: Use dev_err_probe() simplify code
	media: nxp: imx8-isi: Remove redundant check for dma_set_mask_and_coherent()
	media: nxp: imx8-isi: Use devm_clk_bulk_get_all() to fetch clocks
- rebase to v6.15-rc1.
- Remove scu reset patches, which already in linux-next
- Remove patch
	 Add fixed clock node clock-xtal24m to prepare to add camera support.
- other detail change log see each patch's change log
- Link to v3: https://lore.kernel.org/r/20250210-8qxp_camera-v3-0-324f5105accc@nxp.com

Changes in v3:
- Remove phy driver parts.
- csr is dedicate for mipi csi2, so add it as second register space. csr is
mixed with PHY and link control with csi2.
- Link to v2: https://lore.kernel.org/r/20250205-8qxp_camera-v2-0-731a3edf2744@nxp.com

Changes in v2:
- move scu reset binding doc to top scu doc.
- isi use seperate binding doc for imx8qxp and imx8qm.
- phy and csi2, compatible string 8qm fallback to qxp
- remove internal review tags
- Link to v1: https://lore.kernel.org/r/20250131-8qxp_camera-v1-0-319402ab606a@nxp.com

---
Frank Li (10):
      media: dt-bindings: Add binding doc for i.MX8QXP and i.MX8QM ISI
      media: nxp: imx8-isi: Allow num_sources to be greater than num_sink
      media: nxp: imx8-isi: Remove unused offset in mxc_isi_reg and use BIT() macro for mask
      media: nxp: imx8-isi: Use devm_clk_bulk_get_all() to fetch clocks
      media: nxp: imx8-isi: Remove redundant check for dma_set_mask_and_coherent()
      media: nxp: imx8-isi: Use dev_err_probe() to simplify code
      media: imx8mq-mipi-csi2: Add support for i.MX8QXP
      arm64: dts: imx8: add capture controller for i.MX8's img subsystem
      arm64: dts: imx8q: add linux,cma node for imx8qm-mek and imx8qxp-mek
      arm64: dts: imx8q: add camera ov5640 support for imx8qm-mek and imx8qxp-mek

Guoniu.zhou (1):
      media: imx8mq-mipi-csi2: Add imx8mq_plat_data for different compatible strings

Robert Chiras (2):
      media: imx8-isi: Add support for i.MX8QM and i.MX8QXP
      media: dt-bindings: nxp,imx8mq-mipi-csi2: Add i.MX8QM(QXP) compatible strings

 .../devicetree/bindings/media/fsl,imx8qm-isi.yaml  | 117 +++++++
 .../devicetree/bindings/media/fsl,imx8qxp-isi.yaml | 106 ++++++
 .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       |  38 ++-
 MAINTAINERS                                        |   1 +
 arch/arm64/boot/dts/freescale/Makefile             |  11 +
 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi     | 362 +++++++++++++++++++++
 .../boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtso |  64 ++++
 .../boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtso |  64 ++++
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       |  67 ++++
 arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi   |  79 +++++
 arch/arm64/boot/dts/freescale/imx8qm.dtsi          |   5 +
 .../boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtso |  63 ++++
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      |  45 +++
 arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi  |  83 +++++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi         |   5 +
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 135 ++++----
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |   6 +-
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      |   8 +-
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c      | 169 +++++++++-
 19 files changed, 1334 insertions(+), 94 deletions(-)
---
base-commit: ae1fdcf4b210cd66ac7e97b24219c160e4bb7be5
change-id: 20250114-8qxp_camera-c1af5749d304

Best regards,
---
Frank Li <Frank.Li@nxp.com>


