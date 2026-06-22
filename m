Return-Path: <linux-media+bounces-65380-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nJ46AsxIOWqppwcAu9opvQ
	(envelope-from <linux-media+bounces-65380-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 16:38:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3776B05FF
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 16:38:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=sDOaJ6Hu;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65380-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65380-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 75C453062C87
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 14:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4802274B3B;
	Mon, 22 Jun 2026 14:30:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013063.outbound.protection.outlook.com [52.101.83.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02752BDC05;
	Mon, 22 Jun 2026 14:30:47 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782138649; cv=fail; b=SueyPO1G5rNMATawfJ+O6zfpDbeYhbGraOB6Rq8TVRBhnropTo1geGZdqDIJAShXSrSPXWk2CvJYgZX4g2QQV0E9yDmsSs0Uzbrkux4e7pQ/tFGNgn81rHPO9vsunIe6glmIVQv8iuuVHNLnH+8psecpZDfLQryDrBtq1DPKea8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782138649; c=relaxed/simple;
	bh=wD+J0oJrUk/DgvDCuAojkdAmsVQLwCPIR/XZX6PRVMM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=pXl2XCiHff5AhfnwkrwqOyE/PfZH+gKGyQIIVXqe66rFucLDmrkfmHCe76tJ+9OJbF8kInEHoBXOuiTvjtzV/hRlfqWocWUXRQ9fD/xdr0JkWY7aDFIhbVIcjdA6GBEg/0IOpueFcrK5oZtS1+VFLeKaZzubBsJJkaPDgjnYErU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sDOaJ6Hu; arc=fail smtp.client-ip=52.101.83.63
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZSFKd9PLp6A/l9g/U6aUeMoDPbszfyuHiaAiSTIm+qPczHUmQijfQXnAwBI2gp7zbOyozkzpI6BcVUr/8Pld7zMCj2lD6xzFRohvhaPpXX/kgEI66CptKbxBUwgdlp/STwYAYx2Poi5gNwHXAN6CJlqmoHp4VyFWvKMz+LM0R18T0cWZBnG13g5fSzFRwVIN0uGEayPY8F+4BRt6uIZi471eGAmfQEso9518cP7FTto0/p05HM3Z9KuXUQp3mj/lurPDvfqizKV3BL5nri0DxgHzzfT8fiXzjHu5tpPqJ+FUSoLTuzxEiTxQi/YseA74FFX2T9/agVrYiZb4W0ePA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2AyS8AVdBmzU2aZhzB876b6+oR1bkRWyf2k6qwyBPaI=;
 b=dcECatIgQXCQFMDMASBY0sXmIUW7FsSNlERCooq2bKid7SaNlByH7/bJS1NbDeXAMDd/2BYqTc/e0u19U9QgWCp0tdys9CL6s9hTARXCbbyRO6/UWV8pG23jzoBoWeycYyLrCG6GvTZTAnMGtoq8weNDgcMy5Fs4xEvxIFWm1wuefoIBbMou7lcVTqSe8Mb8WS8pdI5JjXqa6MMZ7o0gzbbJjv+LaRwGdAG2FiDlKp3myJdSQ42EClF6EH3kphzJ9+Q3mx9j5QNrQwfDdrIDh4L+OcJ4IcotrQcF/09n7KJW1VjJ2rrEC99FhH7/rGyiHtv35Wpy32OUuYbzGANorQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2AyS8AVdBmzU2aZhzB876b6+oR1bkRWyf2k6qwyBPaI=;
 b=sDOaJ6HuO0giZ7WtijIyLNM3/YpVMVUEJjJICn0ZPM9D2Ag7+fF6u3lIv2K7p9Zak+cgEwEgTx5XYDmgE0C+4HOZeoGq+RQIRR/hITnDcFzmp+ldLmzp4Mry7RYrI+UDIBlxAI/i0a11oVcw8ONoyDAq6RRkuIMBDVCM15Jvrxcz1vuZhTRjINZkdpEalogfoMdROf+qQC7fMUoWwjXO/Ebu754MOm6XRqfzP2oAhygjSc1nfq+waPsnPPo2UQNFNE2p0xTmn/7g0WKEy+wONLnkbZAQ/fjBq253i+z7famQEH74yOs2+sKe3C+pxguNZybnw4K20Y0x6YjhdGkiIQ==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB12304.eurprd04.prod.outlook.com (2603:10a6:800:304::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Mon, 22 Jun
 2026 14:30:44 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 14:30:44 +0000
From: Frank.Li@oss.nxp.com
Date: Mon, 22 Jun 2026 10:30:12 -0400
Subject: [PATCH 2/4] media: mc: use fwnode_graph_for_each_endpoint_scoped()
 to simpilfy code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-fw_scoped-v1-2-a37d0aac0a68@nxp.com>
References: <20260622-fw_scoped-v1-0-a37d0aac0a68@nxp.com>
In-Reply-To: <20260622-fw_scoped-v1-0-a37d0aac0a68@nxp.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: driver-core@lists.linux.dev, linux-acpi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
 Guoniu Zhou <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782138630; l=1197;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=9mt0RV2tWpdMtooRWG3o0z+R51GFXNGFNzYBgXhnwu8=;
 b=vNzvmzixqR8kAEfK5IR5dB8DfZbcWnLQBeUfhpLbAVFUIGiklWjgNxXnrN7qllCNfC59zzRF2
 8LNUgEO7OxrCMybWO8H6y9rgc3Fmip6oOvvkSYLnsE+QGdC2lPhj+HX
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA0PR11CA0168.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB12304:EE_
X-MS-Office365-Filtering-Correlation-Id: bd3a8dbc-a079-4af0-e994-08ded06ad80f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|23010399003|1800799024|376014|7416014|921020|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 DzSKgmzOPqDvLJH1l3ZHx6XfPAwMt9AoDcS/p1fQjV4BCqh7GUUcBZNbCjYLRZZjmszoDnNy/GxWw5tfHyeST4k9WsLkZa1rsEPcIeH6C5D9cWQxI1J6sNCSVjEjPwXZO6/bARdoj+Xc62dWPzrzi+6eZWGejqJy+w3TAshD8gDy42MUKFVksNkggENbhwYEBeJRZP+sfxxSyUaRkPJslaRhKiBE0/imc59UvGb3TZxzkuJyBz+918M7ZIIN/bfxjxuqetDoi71alCpZSBxaGMm+PlyVvko670RC3xKpxPsNAkaB3ax4dOb8zUQCgzGidKvIsn0uKgcPXnCUt4St6KlrchsMDMx2zSwBL4lUsFol1eRT+p/2nbQhTN/5MKILASTVrFbeoaR3ll4QTN3Hpg8pS51sPE0XNnxzj1VxplUO2Uvx7ltzBJ5UmwmTJGWJtjbgU7LJT952VzRG4No9DVfclT6sYQe0XO+65Ejx1gr0Goo4pPjrTEbrYLmUK4WvqSBB5WARBlhv+AMqL8JEkVUXauRxlNs8fSADbdjdW9P9EbtPfwuDdCRB0kGYU04Dxogojr2kCOuMUOyOW/vWx5En6ig7d9NErYAAftQV1witJc043vRE9kU/O2aFTiVB7jLIoFlQEYIgR+TysoNcvIf5BVpTD9dSxQmJh1GxLzxsllTOoNzIIaypFQG9Fmx8swKfDCyydiasq1QgpW62KQ==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(1800799024)(376014)(7416014)(921020)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dDRHM3k2dGdqK3ZkK3VPaXhtY01ONDlsVi9QYzh1bjhFTSt6ZHF6ejRvSWlZ?=
 =?utf-8?B?UGNuTXBHZllpaGVSTTBSRVkvUTVOUVI4L3JEZit3QTNCU056bm8vUlBTdzI2?=
 =?utf-8?B?OTE1eDBYai8yMVR1cmI5ZG1RNTZvWDAyTGxqT0ZGMjVNK3Y0S0Q5VjFoVHZR?=
 =?utf-8?B?cjBYVWduNnRyWnovR04yMDZiRmtOTGFoVXJCVG5BSERrc3FZc2gwN1l2UUgr?=
 =?utf-8?B?VStNYzBrV1NUbGE1QmNVRy94UEZqcldSbVNZa3E2bFhZWEV6VlgyWlFEd3gz?=
 =?utf-8?B?aThpYmxMM3AzN0Y4bHVzRjZzWG1qUTlwS3p2VDZ1a0pFTkVuUmpMOXUvMUVV?=
 =?utf-8?B?SVhRSGNQNE5WWG4yZ09rdU42Vm81bSsvS1pLU2MrQTA4WWswR2srT2RoVlBH?=
 =?utf-8?B?ejhGQTFHUjhpU1hBZmhlM1RZc0tNVW4wdHZqaDBPUVBaSDZEU2UxaHErV0pq?=
 =?utf-8?B?VnRMdEx4Z1U5MmhIUXNCZlVSeWhuYW03NjdCK3JlYjQvek9neDRhcWVyazd1?=
 =?utf-8?B?cE5iOGkyTDJTMUdGajdoWFpkcjNkOVBSSE8xdlNZNk93cTlFaEVWWGxSc1Za?=
 =?utf-8?B?em9pVUowMUdzRXJuaEgwWkpVZkQ3TUIvcnBGWkJhQjR1ZUJBZmtHZFNsNEc2?=
 =?utf-8?B?TjJkZlp4d0dYaFM2TVRhaGx0U2k3MVAxeENoaElyeURrUVpQN2t6Wjd6MjhQ?=
 =?utf-8?B?M0diVFp1bDFqN0xEUkNTaWozQUI5ckNYTTlMK3NIQ3p4NUQ4UmlYTytSTlpl?=
 =?utf-8?B?Qkl4VjFFamtDNkoyVENsTVNqQ2xObWpUaGdCS0Q5MERiWnN3S1c2a3hUMGl3?=
 =?utf-8?B?Vy9kVUJZRCtBK1NrUFhiVzlvUW1yZUFReC9OREhWNXByVW9KVGlVcm4wbkpP?=
 =?utf-8?B?aFUxbFlwSjU0NzROVGJCeFE0VUhPdjZiVTg3ckROaUxLWWtqcHpGdW5YV2RE?=
 =?utf-8?B?c1dpUExDaDVyUE1JT2NyaDRrTnVvMERSWDR1N2hPS1dRb3pjOVc3UVRGb2lx?=
 =?utf-8?B?WHZOblZRL0ZZTXlocG9OcE5EV0w1RGFjYmcwQzVqVmxBdkNFRGRzamVyNS9O?=
 =?utf-8?B?VHdHUUw1SDFKdSt0b1JKQlQxaXEydUFBSUR3a1JQQmlud201ZTdhOG1zTTgv?=
 =?utf-8?B?T0V5S1J3elp3Z3hoSEdkZ2NiZS9rQjF5eGlGQ2JrczF6OUQ0OFVDKzdJcCs4?=
 =?utf-8?B?Ni9hQmtKU2JvS3VJRjRWQm9saUxkaHdRUUdRa2NDS0FLV21zMkZ6WXlockE4?=
 =?utf-8?B?MzVxb3RxWmRqd1h2a0pJSjJkblV4K1VwTnFXRTVmZkthSnFrUk82TG9LZ3o2?=
 =?utf-8?B?UFZHdWZYS3g1R0MvZXpRQ3pUa2RPbU5SYzR4ZVNZdDY4c2Z4OVl2NEhmVnZr?=
 =?utf-8?B?Q1dJNjdYalhEblNlbk0yVjBCTSswWWdIZlRwbjRLeFMrN20zT2NIYW84ZW42?=
 =?utf-8?B?M0VyTVpmYmU0OTZSYkJKMjFIZ1M2dWJVK1NzQ2h3eWgvNmc3OU9FckkxWlpo?=
 =?utf-8?B?TCtaNk5vRmwzMldrY3l5YVIrVDdHcHgwaGxvTHZOdEJxRnQwbENhRm1Ucmo3?=
 =?utf-8?B?a1d6R3J3U0RxYTVkMHdFckFtUHk0UytWem82OGZLQVM5MVppNmMrN0FpV3dC?=
 =?utf-8?B?REFDMTNXUlF4WnJucVhyT3YxdDl2cDN6RVhTV0ordnBJaEszNFIwZXNnV3E3?=
 =?utf-8?B?YTJCVGw4YldRdklNMG9Pd3c0RzI4SE5xWmlkZHhrOURjcDh5MXNwRVAxS1Vp?=
 =?utf-8?B?YUl5QTlBcC9xYlJWUUJhNXJQWG80bzNicDY2RlowTm0rcEtwRlZwZVRDaDFC?=
 =?utf-8?B?em9QcXZGQm1HR0RXOXJTRWQ1eVB3RW5YOWtYVGpidEhMS2Z1dE5BWHNlUnov?=
 =?utf-8?B?Nzh5clQrcitaWUZXMy9QcXVQclRscWJWM3dON3BNRzFNUDA4TE9EZURGby91?=
 =?utf-8?B?NEhCbUNoanhRdkxJVzRJSjh3b2NuMU5yM1lSblRwY01IbTVKYWRWM2VPY0o2?=
 =?utf-8?B?K3JzSk1vd0JVZnp4QmJ6SzlpTThqSFBQS3VBcDQ3a21BUVlKaDVnazZvMzRM?=
 =?utf-8?B?K0lWL3FXZDJrbllxNmh4SGRvQ2t1Qi9ScFJBdFNPMzZNMUdzMmxseStTVzkw?=
 =?utf-8?B?Q3VPVkFEL3hSMXJVdHhrZ0x5dGNUbDg4RVoxbnlCbkxpKzhGZ251TVM2SmJu?=
 =?utf-8?B?SEQ2TGNBQWlNRnptS2xMek1rTFhIM29ZblFUOWhaWXBINy9TUXM5aHNEeFBw?=
 =?utf-8?B?SkNwOXJteVhwVGNibXltL0tlRWZTcGptYTJJZkxCOEs2RTVWRVUvNWdlbktJ?=
 =?utf-8?B?N3dIeStSZENvM3dZaks2eXJHZVd5SnlVUFNoTjZuanJIWnc1Z01tNkE5cU5w?=
 =?utf-8?Q?NOt42GKUAP6XZF/E=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd3a8dbc-a079-4af0-e994-08ded06ad80f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 14:30:44.5348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0WJTgBDScc2Xo4m9zRElccXotmuIFr3LxDUHHA51h/xF74oVvqus/nAu8zIBNx5EDyJAYTFvSGD6ZdQwMRogpL/P9VdpxFcQ/Y4KOy9WonCVPErLcLxNC6ILdmYjFik5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12304
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:mchehab@kernel.org,m:dafna@fastmail.com,m:laurent.pinchart@ideasonboard.com,m:heiko@sntech.de,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:driver-core@lists.linux.dev,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:imx@lists.linux.dev,m:guoniu.zhou@nxp.com,m:Frank.Li@nxp.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,fastmail.com,ideasonboard.com,sntech.de,linaro.org,oss.qualcomm.com];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	TAGGED_FROM(0.00)[bounces-65380-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:email,oss.nxp.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B3776B05FF

From: Frank Li <Frank.Li@nxp.com>

Use cleanup helper fwnode_graph_for_each_endpoint_scoped() to simpilfy
code.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/v4l2-core/v4l2-mc.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mc.c b/drivers/media/v4l2-core/v4l2-mc.c
index 937d358697e19..5d7fcd67dc42e 100644
--- a/drivers/media/v4l2-core/v4l2-mc.c
+++ b/drivers/media/v4l2-core/v4l2-mc.c
@@ -324,12 +324,10 @@ EXPORT_SYMBOL_GPL(v4l_vb2q_enable_media_source);
 int v4l2_create_fwnode_links_to_pad(struct v4l2_subdev *src_sd,
 				    struct media_pad *sink, u32 flags)
 {
-	struct fwnode_handle *endpoint;
-
 	if (!(sink->flags & MEDIA_PAD_FL_SINK))
 		return -EINVAL;
 
-	fwnode_graph_for_each_endpoint(src_sd->fwnode, endpoint) {
+	fwnode_graph_for_each_endpoint_scoped(src_sd->fwnode, endpoint) {
 		struct fwnode_handle *remote_ep;
 		int src_idx, sink_idx, ret;
 		struct media_pad *src;
@@ -397,7 +395,6 @@ int v4l2_create_fwnode_links_to_pad(struct v4l2_subdev *src_sd,
 				src_sd->entity.name, src_idx,
 				sink->entity->name, sink_idx, ret);
 
-			fwnode_handle_put(endpoint);
 			return ret;
 		}
 	}

-- 
2.43.0


