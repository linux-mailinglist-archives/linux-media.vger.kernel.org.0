Return-Path: <linux-media+bounces-41799-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA82B44E67
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 08:57:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93A203BF3B8
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 06:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDF4B2D7380;
	Fri,  5 Sep 2025 06:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KkTfKTMu"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011011.outbound.protection.outlook.com [40.107.130.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACC12D7DDB;
	Fri,  5 Sep 2025 06:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757055398; cv=fail; b=Clq+sGMPsK2X+vFgDccF9T+RjaGjfckJjWncNn5IZ1Ak/qdUZFPSpowzKmmMi7SpPy2qZdtIQOwBj3MSbO74Sk9yhPvLHDGhX956BkJPxE2TD3Gr74QerOE0EDZr2ZLsWMISmNIdcDzqikgCfO+CUhJGNFIqtIOJBKcclRECGL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757055398; c=relaxed/simple;
	bh=Zf9VGtPJqRhs1GN8yAUimcBv1zYg87WgwpqNx191lvQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=oWRn5ZYFWRbgDhc0BjvUMOikiXGGu4NYuF2NpvRMNriWgqmbJCxSaIhuzBbrH4lteKdMgb1Cy+fISxZ6MrJYfeYXE5JCBCNYhXrws00CnN5OF6eOE6DY1RTgwmb0kqPdZPHjdFSnHCz6OYH8HniMmpzSA+044bfJl3VH9PebSeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KkTfKTMu; arc=fail smtp.client-ip=40.107.130.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N1wQVoL95cMDdDgNYugyj78Pwwk302pZLzujq9jP2Pko1mAZHIFx3N9gqbsZ4GmT/llTbZwCKcjAWsiL83gAz1ToP9cV1PQypJvaGRE7v0c/z+hlckWgI+QWd5ifo2id7RZt6Nw6sAgce+su9B+ICuQh6H3QiGqfemd8xSODO3TD8mbGg3qsy6DVlgga4oNKvRwUCn3Bk255bPSfjy4l26ug4eBYnDRYIWlmQImFLvrEzUDOINFpWdsfsL0KdILra7Hd/C/2DnyOWj7i67T45hk9LSd2M/xslp4mwwnGK4t7E2YYPV9HFMp50IF95oD9QD855j8ThviTNxp+Zmh7FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MHgxj7+c59C0gVPUao/lk0+eqJOfu/sCbdY/rGkgIIY=;
 b=NfjsLFpbP/6xfLuH+iUfI5AmjPLeZJOEsEVorgO3N4eE9P3UfBLrvJdFl7YjuA57B5ZwuR3qEobhEu1gTFOe9BKDAK7tit+VRm9azAm3YDwbAxPCyO8aFOtzhleG8IzQ1mkRONd/wUMnitnc2RDfH2zPir01Q6DDhIZwFIIZyIyVuMnxhAFhmP/UXnjSQFH96zWVwupezJqPNkx1U6qNrLG0EZQuS8LpvNqx0Eex7xiQEyZzQ8HQan14PYkCn8ogyHs5nRg18Y5rnIwEsjR1dxTG8FYmK3opI5QwydSbzvCvWCj+dhhiJKmUJLTbvFA4wSy6A/UfSZP2LQPGyxa0Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHgxj7+c59C0gVPUao/lk0+eqJOfu/sCbdY/rGkgIIY=;
 b=KkTfKTMuke5uu696uJtjTtINb4X5JB254HztP1izX857senQptg5SgVLef+8UoopW+3xHTZwome5X7exXoTHiXEyIYdH+dDFqz8AhxEhO7j9GPLzizNGdryF5VgUh8w1LpundADLsadKa6dHRgcA5zjZilgBxQxwTAwePPG+gDSXlv5HCC59U6SGQNvwDPKXbtc5V/4nXO1JXa08JtgF7JdCHiKIuVW6L9dg7+MhBl8Jz4F4UiafwcjJdvPPOruc0j9bWdZjzsefcuGJqBLZ5vM3ZtfoNze0ABaJuohf6GalehF2sk9+BXRjBViyksx6CMwinMMuF8sAD1YY1df0ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AM9PR04MB8889.eurprd04.prod.outlook.com (2603:10a6:20b:408::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Fri, 5 Sep
 2025 06:56:33 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9094.017; Fri, 5 Sep 2025
 06:56:33 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Fri, 05 Sep 2025 14:56:00 +0800
Subject: [PATCH v2 3/5] media: nxp: imx8-isi: Add parallel camera input
 support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-isi_imx93-v2-3-37db5f768c57@nxp.com>
References: <20250905-isi_imx93-v2-0-37db5f768c57@nxp.com>
In-Reply-To: <20250905-isi_imx93-v2-0-37db5f768c57@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 Alice Yuan <alice.yuan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757055383; l=1750;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=gAJk4hbc2JNVmkgaaZpDUkJv+VIkB2+qzmy8xtbHY7E=;
 b=mNljpSZBrySybQIoV7IxYe71KUD4Sq/NU2gswj+UoFjnrUMg4yT/UxuZO4xvbJQIK56ft1BGx
 RiyAdmQrga3Dy5QA625ZTHsnAZ3X+z+HAfW3LY9b2no3GnVN+RNlc2d
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:54::13) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AM9PR04MB8889:EE_
X-MS-Office365-Filtering-Correlation-Id: fcc92887-2215-4634-058e-08ddec495936
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|366016|52116014|376014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?UnFxSEJaODd2MDc5dE1MV0hUR1IzTUk4Y0Nyd2FqYWRUc3dvcTNNNXBvUSs2?=
 =?utf-8?B?ZERhWkt6Y3ZSQ1c4Y3ZiNzhiREdqUmx4VXlucXdEZ1R3RG1JOWR6a2Uwem9y?=
 =?utf-8?B?WjRpWGl5dW85NjBjcDZyYURtRDFETldUeTIrTjFqYUtzOGtMS1QzZXdlVlda?=
 =?utf-8?B?aGlHVnl2OVVXN0kySTZZVkFvZHFIZTdDb2RCQ0J2U0xtL2tXYVJIdFJnRWJp?=
 =?utf-8?B?U3czbFpsbE9TTWhUSW1jdTF1UXJINGVaL2ZDelMrbktLeFdNVXFlclhFRzJp?=
 =?utf-8?B?QXU3eTBBK3ZsL2x3OE1RNGFSRDh6dVJDNUVjVCtqRHpnd0IzRTZRNi9HdmRl?=
 =?utf-8?B?RnZTNVRaeTRESzBybnB2Mjh3V0N4YzYrRkFsdWhZZzJXNnpjeG0zSndYQWtR?=
 =?utf-8?B?QmFxUU9BMXBpVWZKS09GcmFmVHJ4OHJmYUpFZHdXMTRadGZZNnpMRFg0ZDAv?=
 =?utf-8?B?ZzdKUVdBeXdoN3VkRHNqN1E0MVh3VndqQmhScy9hdmRtaVZUYTBiQ0I2dTha?=
 =?utf-8?B?QUlnTkVWM1p2NG94Z0NuS3paRXd6d2RZVHArUUlxMUNRQmZGZlVDSzJMUWRm?=
 =?utf-8?B?Y2JSZUN6dnhtZEp1WElpY1JTckFnUW00eG9yQzYyNFZCckszS1ZKc0dZakUx?=
 =?utf-8?B?dlBlMWcyUGNnOWUwZTZiaDRWcVNvMTdwUmtNdkVWZkZLUjg1dWVHOGFKZExF?=
 =?utf-8?B?SEc2RjhkdHp1L1NRc3kzMHM2TDFBVW1xTG80bDhHc1VxLy92TFJFNzcrTkYy?=
 =?utf-8?B?aWZJdlR5T3hoTlNkZVZlR05pZXkxVEJHdkwzcGFJbWJoSjA1cVBvQ05YZzFZ?=
 =?utf-8?B?MTViRFFWRnRsdmJkdk9meUZkZjV5bEpxdktkTjlUNDd1aXlWMGM5czJZOE5V?=
 =?utf-8?B?K3N4K3J4UUxuYmdrZlpEc2k5aWRyN1hDRzRZcGpERS9VUlQvUkViamlCZXNx?=
 =?utf-8?B?ZWRlYjFSdElGWGhkRVh2K1JtMXovalJLU21Bb1RiNHhKMGc2cFk2MytvZFJ4?=
 =?utf-8?B?Z2lLZXJvRjh4YXljY0ZkK2dGSzk2TlppSUY1WWp0UUFHcGwrRzdKNDFkR3RX?=
 =?utf-8?B?SW5QbDFsbmpoTkdLVnYzNENiWHJ2Y09NVm8vak5RYm0rVUIwNU8rOVpObjFu?=
 =?utf-8?B?c09JUlY5alhhMGRib0tIUnZCZlZkSTZST1E4WG5LNkJmc0tCWmlUVlhEclNm?=
 =?utf-8?B?RHRacEJDS2NYTzNLQm9YU2N1Yk9NbmNxSmZ2MlAzUTFNbUhrYWkxSHdiVWdp?=
 =?utf-8?B?aGtLTEprK0s1enVOekl6ZGQ0cEp5dHN5NzhKVEhVUk5mNS9BVTNQWnIxMGtP?=
 =?utf-8?B?TkEvUEFzelptdnkzQnpTdDRQTkF2ZXZYSVR3SnVCckNRaDR5bFliK29OOHpF?=
 =?utf-8?B?WEdTWlF3Rm5CZXRQR1ZYWElDK1Fscms0TTR0eklQaC9ka0hzNjdjWUVmcW9X?=
 =?utf-8?B?cHdqUDZ5TFN1Mk5kN2VreXJqSjhQM05VQ25KMko3clRScmNwT1F2eCtxQUJ2?=
 =?utf-8?B?aEdURnNRNWxGV2p1ZVlHSmZ5UkhZUU9LYjA4Rk1CQjFKNHpSdDY1N3pjdGYz?=
 =?utf-8?B?NkZ3WjNQcU9yMXEvemQ2Rzd4azd6Y0h0b25vS0cxTHNPckJ2Q0xia1NHVXVF?=
 =?utf-8?B?N2lFQVAwWnQzbUNHS1F5WVp6ZUJVS2dueEpBNzV0M3I1eVhZdVdER3RDOG41?=
 =?utf-8?B?dVNBaE9jWnRzSzJVT0RSdks3bnpHcEVtWjBzbS9QeSt4bHh2TzROV2JCcEJM?=
 =?utf-8?B?YzdiZ1JIdXp5TStjTUVnZTE5dDhYU1lsOG4vZjRsTUF6OGYrUXZTWkpiMkJu?=
 =?utf-8?B?RjNGckZJcHVNZXV3MloxeWJJaFg4ZnpRTGxVT1FSZk5nVlpqOExlVXdNWHVL?=
 =?utf-8?B?RzB6WVdZNWxNeEY0QkFha004VURHS21WQXVPUWdCMUJSa0RVejExNlpUWmJK?=
 =?utf-8?B?T1MvZGNRS0twajhlOU9kRXUxalZHSHArdlNqQnhNOTJKQzZnM3NneEMwem5R?=
 =?utf-8?Q?8e3rGIiZ9cBjLk2n0stlcEUUJk+jQ8=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(52116014)(376014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?bnVRRFZUcUVsZEtuQ3B4azRhWmYweVdXNEtGRDhWaFh2cWhIY01HeHlQM3FK?=
 =?utf-8?B?L1JtVWNxOUdZUmFoc2ptQmpZaGJSODZRd1hJZHdTd0pHRGdYY2Rub1pMelhJ?=
 =?utf-8?B?NWJRRVU3eC9qcGpCWGtBa1dmd1ZKbnc1UTZQaitBdEV6eUVZV1dCTGhLTkQ4?=
 =?utf-8?B?NEhhUFFpWjF4TVBkRVZMZ1o2Zmk2U01jSXp6cXdiNmVpOUtTcTZ0Q1Y0TFEv?=
 =?utf-8?B?ekJ2akhSZy8xZWNSejdaWTBvdzdjNzZBNjAxOFdxRXV5ZzFKZmt3Sk5Sb1Ar?=
 =?utf-8?B?bkZmb2dZTG5KTURENEJJSmZpZGJ2eUgvbEV3UVUrMXBEYlBvZENqTlRoTmhC?=
 =?utf-8?B?Nzh5bnNxRU9BODVtNm1vUmlWcjdDRlJQY05JdW9rdEFCK1dpRmxiODVyenla?=
 =?utf-8?B?VjNvM1lEWFlPVEl1a2lQdUkycFl3TlZQNTNyUGV5T1l6eGpTdXZtdFRxRkty?=
 =?utf-8?B?TmIzZ3ExdjZjNVlabDJMaVhSSVBNR2huVTc4SW1pWEFvTXV0Z2NwYTFzZU8z?=
 =?utf-8?B?dDN0eFFLVlVBbUgyQ3RNVE5TV29KaVM5YTJxcHpoV2NpTE9vdHY1SzhSbDJZ?=
 =?utf-8?B?d2FsM1Z2YVp4dHJWMzNKNWJ4ZUtTbFZNd1lTbGdGcElROUx2WGNMak9abXFw?=
 =?utf-8?B?NXBHRnJ2c0dxczZKMzFnUXhzUHp5RGF6T1kwZGJqOEZBbEFnQTBxS2UveHNz?=
 =?utf-8?B?RFAwa29PZFJaNk5ld3JsTWQ5Q2ZjdVJaMDNEWkZTZmdhdDRvQXhtNDA1VlhL?=
 =?utf-8?B?WXljRXBCTFdiZ2wzZ280ZFo1V1V3bS9WOXJnTUJ4bzNTRFBTNTc5VlFQT2Nj?=
 =?utf-8?B?amlBanFGVTRGQUNDQ21URmNxYWZFdHUzeFdtZXZRTjRqYmo3MmRqSllEWDg3?=
 =?utf-8?B?SjFrcy9TSkVFQzI1NGhFU0ozODl1WENGQkFwQTc1Z29pT1k4RHNCajE3QnlC?=
 =?utf-8?B?c2kzaFJLaVpzUlAxUEk2UVZ4RmpiSlFZM1ZkUFl3bm1XajJFazRkZ21vdTlL?=
 =?utf-8?B?MXNpYmRuU25JQnZsVkpkTlBrUXJ6empoZUJhOUMwRGEvYVRJTnhub2NBdVBm?=
 =?utf-8?B?amphTzVvMzJRbmJMYVd5VllMR3lVR2lNWTZEbGNhOGE4T3FRR0hJMHljYXRW?=
 =?utf-8?B?bWcvc1hlQXFrbVBaM0FlbllmRk1IdUJlRkd4c2V4ZDNQL3pqUEVOWWViRzVv?=
 =?utf-8?B?RTluOTg2N3cyakxYaEZUbzVFcktiWGhWRHk1a0VXSnZOVlgwaUIrTFhXZVpB?=
 =?utf-8?B?ZXkvc0tqQnlXcThtNnRPWVV1UVpvZHlRZGhTS04vYWEzMGIvSC9rLzRBU0Ir?=
 =?utf-8?B?Tm1JRXU3ZllZRlJOTzhjZTc5bUFXUEdhNi95QUpoUGRqQzJmdVZhYXRNWlBQ?=
 =?utf-8?B?VkZnU3BaeHU4NTR5SnRabXJTZVkybEoyVXhoTndDV3Rad2hOWU9vbGovTHdv?=
 =?utf-8?B?d1hIcXRMcERNQTA2S2UyS05wU29CNDkzTzRiQWo3UUxqSGZIRDJkS2lReDRy?=
 =?utf-8?B?RlFGeDM3NVJ2ZGRidFRJamJIeG9JQlNQdHJYTWloR2R4M0xQZldaWUovZ2lD?=
 =?utf-8?B?cXVabzZIbVpTV3JpZnJyRWtvWW9ITGRmeGZnUW9tSWtUOVRVWmhrSDBBb01k?=
 =?utf-8?B?SlY4dUJsUGxHc21ESnlHVHlCaHZ5YjN6MTRtZnVEUHIyOHd5WEViUEJMdjJJ?=
 =?utf-8?B?Y1lHS1FvYlFoaWdaNlN5TjVFT0JCbTcrZzQwN3dqNGVzeC9HNUpjUHlvSHJW?=
 =?utf-8?B?NDRBeGhWYW5Ga3BrelNZZmdjM241NDd5R28vWWh1WkRwSWluRDV1VUdGZFpD?=
 =?utf-8?B?dEc0Nm90d1Nxa3JYUUJscGRZcTZNb25tc2NLZDd6Q20vd0szcW9pQ25HWE9P?=
 =?utf-8?B?V0wzSTFaM2JhUmdQMlArWWx6NFZ3VkNZVmFjaVVsd1FmaE9HTGkwTHEzQjFq?=
 =?utf-8?B?STRiUFhMQjQ0d0FScEtJMjU0RWpQd1dnTkVhTklIeWo5K0VtdjFpaFJjb0Er?=
 =?utf-8?B?YiswYnl2UnRxRmllWllhSTJLdXhmV0tOUU5ESnpUU2ZzeDRycXRlZDNZQVJk?=
 =?utf-8?B?ZFJYWmRDOTZNaWtjWVpKWEZTMFpWNnNrUE9KQkx6WWxqMHpKem1raVdLYXFZ?=
 =?utf-8?Q?o/haY+sZtAoA3F8HPsf1kSWqb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcc92887-2215-4634-058e-08ddec495936
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 06:56:33.1896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iBI3+z/HJAc/b2eOP59qBJ0XX0+SKE5n78ZNgV+ZPgKze6hYK12ssTlDhw3HKhfwSzehKP5KDHX1sHT9sVLH3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8889

From: Alice Yuan <alice.yuan@nxp.com>

The ISI module on i.MX93 implements one camera input which can be
connected to either of MIPI CSI-2 or parallel camera. The source
type can be selected by setting camera mux control register.

Signed-off-by: Alice Yuan <alice.yuan@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
index 2f5e7299b537d612fb1fe6688c1b75bfd2d6049b..42b2ed2bbdf7259bc83d0678256343a3b606568a 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
@@ -61,6 +61,7 @@ const struct mxc_gasket_ops mxc_imx8_gasket_ops = {
 #define DISP_MIX_CAMERA_MUX                     0x30
 #define DISP_MIX_CAMERA_MUX_DATA_TYPE(x)        FIELD_PREP(GENMASK(8, 3), (x))
 #define DISP_MIX_CAMERA_MUX_GASKET_ENABLE       BIT(16)
+#define DISP_MIX_CAMERA_MUX_GASKET_SRC          BIT(17)
 
 static void mxc_imx93_gasket_enable(struct mxc_isi_dev *isi,
 				    const struct v4l2_mbus_frame_desc *fd,
@@ -71,6 +72,16 @@ static void mxc_imx93_gasket_enable(struct mxc_isi_dev *isi,
 
 	val = DISP_MIX_CAMERA_MUX_DATA_TYPE(fd->entry[0].bus.csi2.dt);
 	val |= DISP_MIX_CAMERA_MUX_GASKET_ENABLE;
+
+	/*
+	 * CAMERA MUX
+	 * - [17]:	Selects source input to gasket
+	 *		0: Data from MIPI CSI
+	 *		1: Data from parallel camera
+	 */
+	if (fd->type == V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL)
+		val |= DISP_MIX_CAMERA_MUX_GASKET_SRC;
+
 	regmap_write(isi->gasket, DISP_MIX_CAMERA_MUX, val);
 }
 

-- 
2.34.1


