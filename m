Return-Path: <linux-media+bounces-50912-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B6BD33764
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 17:21:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03D6E311543F
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 16:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 555023933ED;
	Fri, 16 Jan 2026 16:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HiXbtbAI"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011000.outbound.protection.outlook.com [52.101.65.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A4933B6D4;
	Fri, 16 Jan 2026 16:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768580356; cv=fail; b=Xax5SJJuUMTHqZZHevdCkmYimTxW3quRkqlaAg+Ru4EL+yunwLyZUyoZ6NLl9apPE4c4sX3BYHU26qLrVWhGbxTUONZ8jnVXp1oYNMJeuBIeWa1F7ZQAw++5GiZEuNN9OA2L6z/wK8MSQL+4a26UhKh38G3MyFHC5nJTpBbeZZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768580356; c=relaxed/simple;
	bh=EPx4lzmvmCsye4Te4aDiO3xOTYXdELRvhCxugrYXaNU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Jl1SnHH7I6K/o96kDzr1aZ4Y37n0OHhwRoM8SECjHEnt/Tqat8ascloTnfbks5XyQh2ULiEZm4Wd2K8s6dZSMHYchzVeTgUsoq6ECnxYifYbR4InGH3Vj0V2gOOra3xVeHXsNbb1uBdhbtPmM4fJmGb5hs9tU4OZ3kpwHlYNbeg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HiXbtbAI; arc=fail smtp.client-ip=52.101.65.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GOGIiOgpj4HD1SSSKixQ9fLrWXPV3TDrV3h9UfvDdqB6bCV0Ve/cEMvIkuSv5Pm0Rpd24tac01zs2r+ZZ9WuWFj14AoQhdn1xpU2GJi4WY/PpZH0t+UZqVlSPswvh0wKS5mM1Hyxn4MQUSatywsuYTHJ81pH6rG4Se25Zi26czghJa5pXktrPe+DHjPoXkIhCBpjDd8Q+XzB/jwNrddoPyPEVLzUjXrjlJUKF8xcBzA90bZE4jlCxVUuE37Ai7wqJncpRqRdFBl6iYKzuR/Jpg3EGFN0dsb/1TNVRTK5yvrxJJT+8chxaT/+Ejgb+IwTRy3vN0/yRCfENYdeVxS9Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IdzeSUnntxMRKssrfMEMSBkLMcm7aXbn8sbMuQKG9zE=;
 b=Lr3tuhEq/s5+J5MlzG2OVcueLig2YldMKPmt9QsVyhbT4uzwYysibW/EtSfg4cuMAQ222Aj4barywhM8+QJPNQMtX2XhgbdopWdXUEtplevUnKqw3qqhekXxrmL7ibICpbUQB+3Yt2zbeUXl2RefT7UiTbEoGBqebuaGdex8ZEH5DWtbDFKO3JUFtVNHvMft8ZUlP/DqD1cjfgoay9nIpIDZe+oB2zNYIit7iq2OciODK68Xt2o1ofm21AuaF57yiItumBrM6Ljl6TQq2vOCPlYEFh5dzwHsvcaBxQDZhaKgWTgc81SfLYoQDP12rl/AnrH7SW2gB3WkAjXBASGzig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdzeSUnntxMRKssrfMEMSBkLMcm7aXbn8sbMuQKG9zE=;
 b=HiXbtbAIuidKpwVnU+4K/SIsyEA9S6ubMFGDV3YWR5yu86ANp7/XDlmu6ss7CLQQW0evyaoBF1aISSjCr35sxs/9zbBfrLpjxJsqKH5iQAILM2FX8Awpq90qQUb2N+4C91q1B7nLlP1DZPAH7IkAH5Kh+ordZGLV2mwNzehH2przyYOiSI/qXM1/QGHF2uA6VfhvRyD59ud2lmfe59b7y0mM0x5msIk+1HI6yFqXEdL2WRl305SNKRENgJoMGR6gVHHcV8Pjy6L7XSA9frUz5edb23ZKwpEcXQqPWEg8dMjaTyVB2hE5m3CowVjZNEz39jGNfFaUcix/A37eajHH2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GVXPR04MB9733.eurprd04.prod.outlook.com (2603:10a6:150:119::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 16:18:44 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Fri, 16 Jan 2026
 16:18:44 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 16 Jan 2026 11:18:00 -0500
Subject: [PATCH RESEND v2 5/5] media: staging: media: imx6-mipi-csi2: use
 devm_platform_ioremap_resource() simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-stage-csi2-cleanup-v2-5-a56e9cb25196@nxp.com>
References: <20260116-stage-csi2-cleanup-v2-0-a56e9cb25196@nxp.com>
In-Reply-To: <20260116-stage-csi2-cleanup-v2-0-a56e9cb25196@nxp.com>
To: Steve Longerbeam <slongerbeam@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768580309; l=1642;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=EPx4lzmvmCsye4Te4aDiO3xOTYXdELRvhCxugrYXaNU=;
 b=KPhwIPfwLnrAurDZTVgjGcQTqqmznW+6/bCjWI2/jYK88o3aUMR/cI+jqYlPQ1tBbpn6UW9ev
 URVrVrMEi3vBmXFaPxDp3akjOu73EAVvuuXZsETIMdnq2hja1W8thdw
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA1P222CA0002.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::9) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GVXPR04MB9733:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b30cc9d-60f9-45b5-9956-08de551aeb5e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|1800799024|52116014|366016|7416014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?R0RCZkM5VUFhUmpTZ3JXSmE1TFRkN2l6RnM0ZFNTL0k2UGJSV3NjdTZSTnVQ?=
 =?utf-8?B?TE9pRlZZeGs2Qzh5dFN6NytPYW9tQXBLNDdGSXRmS0pjS0h4YWhGZWRIZnBU?=
 =?utf-8?B?SVA1dENtUjlrSVFja2V2MTJBVnowMVFvSVNKU3ZMaU1obDZYZ2psWGFIM2RZ?=
 =?utf-8?B?Uk1veVVLUzA1V3ZibHVsQW1mSklhVk5vODZ6YUNvcjlYMkM4aGFreS9NdmtY?=
 =?utf-8?B?bnoyZXAranFQd1kvdmFNS3RBeFdSVWpyTWFUNGs1T3QvYzgydHJiMVdLWjVK?=
 =?utf-8?B?N1BJcjM4eXlmQ2o1YXhKSnVZTnZYOUJhVmdRU1JMQWZndk16cFJRYzVjSi9i?=
 =?utf-8?B?K1VmVW1KdFpZYk11VHJjV1lYbFp0VzV0Wm5ha0ozYmVBNkIzUnl0cEZJRldT?=
 =?utf-8?B?bXg4MXFPZFZoUTJMWXNLSHBmK3ZERm1aRHNlaUR3am9STWZHeXJpTVkwODZU?=
 =?utf-8?B?RW9vN3ZYNjh4ckFPNTNXVWEyMmN0V3hBZk1iVnNUNlJJRXV1Y2o0YWdMWUxv?=
 =?utf-8?B?WVNjb0dHS3pkdEVWLzg0VmlFbUZnMTRheXI3Zzl2ZWhXTGdNYmxvaTQwcVgv?=
 =?utf-8?B?ZDZYOFJwWHRjdHNJSXlRVGhza3RESGZHenhyaW9ObGxRSEJQMW1WTG1FNWFO?=
 =?utf-8?B?VkpHYWxFT0htMEVPZzhEbFZ2V215T0VTdGpyTUNMaUdtbWFTL2szOG95ZEJm?=
 =?utf-8?B?cElUVTBuelVyYXNzb3I5b1B3akFvVFJIR3JpdklhL1FGckNGd051M1VJRGVi?=
 =?utf-8?B?NXMrQW4xTFdEQ2txcXdKbi9PR0tWbm0zVnZnN1ZMeVg5dThIQmEvR01uWHoy?=
 =?utf-8?B?Mk5LWHdTcStkTUhLUDVUSGhIeEpQcHd2UU0waGpRV0RGQjVIVTVIZFlRVjdJ?=
 =?utf-8?B?ODZiQUpnV2pLY3pmUnMvd1pZanY1ZldzQnNRL0pjOHFqKzU0UlRpSHowRzll?=
 =?utf-8?B?NDBOcTBTNjJuQmNDSkxIbjVGeUd0T0VSRVRjdTJIblJlSG9IczMyU0l1Vmty?=
 =?utf-8?B?cHZOMmpKR2xlamF6VUNyQXV0bHBpNWhxQVBYVGVpZGd6eGZEdjd4U0JzOXlr?=
 =?utf-8?B?d01ROWJlU3dUejlJZWFHMDQ1K1VzUGtmeEhuRWVZeUdVazF6eGtkTnhGS1la?=
 =?utf-8?B?Z2lXc2JaWlhMclhGQ2N6VVhvc0c1NVBDMFI1Wmh4TDdWZ0hmdkJnVnpIUUZr?=
 =?utf-8?B?M1loRHlpbEZFVFlDdk50Y0xrdmxaRXlRZWFUWHVPMTROeFVyMTU0bU5LZW9J?=
 =?utf-8?B?MVBGb1ZsYnh0aEF0ZXVsNzJYUHR4a0taODJ0QVduemxkNk1QeEZkeXI0bExs?=
 =?utf-8?B?Y0NkMjJ4ck01VC9jdk9UdlpSL1RhWXpadVZWaTRrOS9xTHo4NGRPOVhTZm1F?=
 =?utf-8?B?LzNwNm9nb3Z3M3I1c3FjdkIzOUk4NVBTc0NiQVUzSmtKOWQ3TTQ2N2FvRlI2?=
 =?utf-8?B?dTFpbXJoWG9vUG1McVpyOWpWVTJ2M3U4b2FTRVkzVDgyM2FFckFLcVozTDJo?=
 =?utf-8?B?aktuQmlralV2Ylc4Nm9iNXBUc2JvWE94Q1Fhb2VtTVUycm9jL0hOT3dLQVli?=
 =?utf-8?B?MTBNV1VJd2VKQVNsaGlLTDhqTERyK1RXbC96ZWJBRFZMamhFZS9BZ0lVVS9t?=
 =?utf-8?B?SWpvQm1FV29kaXc4VEczLzlDZHdhbVJFZ2ZVcEFIRE1Cb2ZPMkp3VEE0SU9x?=
 =?utf-8?B?bWNDQmgxZ1l1aUU2Vm5JSStuaTJEWW5NcnlkZ0lRcW4yYjJvR1JWRjJzclBU?=
 =?utf-8?B?UW9RY2hQMDloOTBNbDNWZmZ1bGJHZ01zeHRNRU4vZktoQ0ZIWjJabmNxYlZN?=
 =?utf-8?B?YmxWcXZtdFIxeDZZdng1M2hwVTB1dERXcXZhVStWODhXWEJ0TmtJWUJ2Zy9W?=
 =?utf-8?B?b25WRENWNmQxTUpUaFdiakdXY0gyb3BZUGNEcVpacVNVazdwdmxaVEI4dEhp?=
 =?utf-8?B?eW9vNnlydlRXV0diNTNZVEFhR0l2V1drWEFPdGJ1a0NlL3RjcndFajNrNnpu?=
 =?utf-8?B?NUV5VXFsaG4zakhuNGZLRnIvRjU4VGdYVjZlTCtBdFEwalpwS1VUYzdNVGN5?=
 =?utf-8?B?Nk4vSWUrK3pVSDdDTHlXSnc0YjNETFdSbXQ1YThEdk1KR3dESnV6TDdrZWov?=
 =?utf-8?B?eXgxbDBVZGlyNkNMeTh4c1RlS1l1TEcxcW9JN2k0R1ltY1hkSDJqZktEVHY1?=
 =?utf-8?Q?crJMiA6aQC8zv5o+LrVjn8c=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(7416014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?RlVOZ05EVmFnQjNicFpXUnpVNkVRS1dTZDZxTXNMUHFFQlRkektDNzVkeUJY?=
 =?utf-8?B?YWhRNHVUbTJkMFJSemJUcHQvYjJDM2xlUEVBQzFGMXJrR2VubzBwWXNOanNj?=
 =?utf-8?B?eHROWGp5VlR5SGdnQlNmV3ZmbG80a1haRVdVL3F4WFl0VUduMGc4Uks0VXg3?=
 =?utf-8?B?RFZwcW1hTnk3ZjZHS0FZdGo1ZUFsa1lEcnVIelNsSmQwRm9uMjU3ZkpLREZC?=
 =?utf-8?B?eGppWStIUG1YeDYxR29nYzluRXJaNTVsd0g3cTdSaFJIdE05M3ZOVnZHbFRm?=
 =?utf-8?B?OXlWc0ZCd0haeFlqV0ljYVEyd2FTM1RGSCtqcWV3WU1JclhIanZFZjc1Z3pC?=
 =?utf-8?B?T084a053MVZGZHFPSnJXR240bm1WRTNSelY1QjRSOFhoV1kxaGoxMHNYb2s1?=
 =?utf-8?B?REI4Ly9LRzZtanFCQSs4UjZvUHFISFYzTmwzM21zMGxtZkZsSjVyQTh4aHIw?=
 =?utf-8?B?SENWTVNlZ2EweiswRmFPS084NG0zOHhHaFVreGE1UFVGWXpzeDRiZGhtYnR6?=
 =?utf-8?B?eGNDZ0krUVY0bnczTk0rU25qTEZXYjhBYThaR0dRckU2aTFZN2lsUWVQdzdO?=
 =?utf-8?B?TEJtSlhhdU1kWG5qU2JaMkVEcXNkUStYN2N6dDFUaW9oT0s5RXBYdmtoUVZj?=
 =?utf-8?B?WWxiVzBIUUorWVczcll2SEVLb2tubm9yTStFUzVZeHJKSVFFQlk2ekttMDNQ?=
 =?utf-8?B?aStZcWhDREJQcnhXS01xQWJndjk4UFNUZzYxWG9xL2hsL0hJd05pNWFFSnZI?=
 =?utf-8?B?TFIzQnpxQ2RUOWI1VlNqODVJcjVpdXVxdk85SzR4Mi9YbGFzU2tZWlVPMmxW?=
 =?utf-8?B?SDZlbG5qcVdrZjlzcDhLTG9HWmVWZnlRRUVrZDU0NmUvc1k2QVdVUzVDbGUz?=
 =?utf-8?B?Wkx5a2lEdjg4aUxQV09GaklQV3ZoUzdWQ0I5NWdHeHhqTktrcnk4ckR4aXJr?=
 =?utf-8?B?VjFxU3l1QURsMnJMZG5BTlk1YndiU3lQU0s3TndGaFZlUnIya0oyczdjVzdh?=
 =?utf-8?B?eUxNZkt2MHdCQ1dPeTk4NitRaTlsVjNCOFkvZVo5L3ZnNlVjMmlsbE1DNXNq?=
 =?utf-8?B?YUZkbXJnYmNtcVVINUtiRjVvZzVmRGRuUkZQSnFjWDJZd2ZqNmNnQmhPTmFu?=
 =?utf-8?B?RWYvMFF5ODE1WXNWdjkzWEZpK3RBdmViUlhvQVJCQnBsRkMzM29GekpRc3E5?=
 =?utf-8?B?RlZyWEZPeXBtNVN5UWRXbGIvekE5OURJcFVtZWdWUDZ6elUwN292amdsNnQ4?=
 =?utf-8?B?WnJqYVhCY29uQ3U5ZFhPbkkrYllsZkdMdGtnSE1oRzlweCtUUkh5elJ3RVZh?=
 =?utf-8?B?KzRWZTREd1NOdzRhd25qd0d5UWl0SE9FQUVIcFdCUzhlbkdGL21OUVF3dzgr?=
 =?utf-8?B?azk5QXdRTHpMU0ljN1hjRGFNdG5odWI3VU5UNzZaVzl2b1hpVzRhdHY0MlV1?=
 =?utf-8?B?YzZjNXdaNHNlaS9mOGM1UXQyVlRWSlp0RGYzQ0JPZFhoOTZSM3dVcVpDVmhW?=
 =?utf-8?B?YTJWSzJ6RUFnSmFaTnNKdHVmdSthYnFTRFZjL3NCT1VSbkNEL2EwaVRtMjgr?=
 =?utf-8?B?Z2R3S0VpNXBjNXhCSFV0MDlkbWk1OUdBMk5BOEppNVhZVThFNXNvQy9CUFVF?=
 =?utf-8?B?TUpjb2lUTWRQcmZubU1xY2FBaUtTU0licmwxOUd5TktucE5sRjdkeFgzd0ll?=
 =?utf-8?B?UnNpZkZlSjNHeXViR2szbEtDQ28rdXcxR0tQMVNlVTVReWFBaUpIdDlqY3U2?=
 =?utf-8?B?bXp0MUg1SURqb1czTUI4VjJZamNDUmhjWHMzNXRTY2NZYW84dHZPdUpnUVBL?=
 =?utf-8?B?aEtrRUdZbXZ1Z1UxQ3BvSkJrT3BjdW9vMDhhVVFpcHZUQWR0eXZNeHVEZnhJ?=
 =?utf-8?B?ck4yWlp3aExvYmRGYXpkWGRNb0dQOWk4YkN0STQ4MGY0cmwvYVdkWkV4S0Za?=
 =?utf-8?B?UVRsUjJJSG51c3VoYS91YzUySEJ1dnZ4b2liRjg5bmNEN2YrMXM2MEVFQXhu?=
 =?utf-8?B?SE9iTXNnSGRhQTRMK2VOU3RBUkxDUmRReDc3b2xmMjduU3hPWkI0S2lZUlVJ?=
 =?utf-8?B?NG5CZkUyNjJvZGV4T2F6Ni94d2MvQ0Y3K3g1bzNoZWh2QkVMYXdJZlcwR3Qz?=
 =?utf-8?B?aFA0UFArUktTQlkyUDRveWFNdkREMmlKcVBqZ1hKZTFieklKbEdaY1gvUWRu?=
 =?utf-8?B?NGVaYzhFdGJxeXN5ZXYvYS9WckJ6eE04WGl5WVNjd1BKcnF4UXJLVklBcW1p?=
 =?utf-8?B?aEZYQXk0ZnhoRkpXUStLUHgxN1lhV2dtRFV0ZkNjNFNEcGorQkt4em9ZOFZ3?=
 =?utf-8?Q?SZl7U6Hxog2xpV8evg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b30cc9d-60f9-45b5-9956-08de551aeb5e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 16:18:44.1420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5uuzAJWYkP5Kl0PfEz4k82Y35qz++T5isg9hXdRm7Ed2SdYTCymDAEzv+ylNiKBe5OMnL6yhvd1utYupMFTkZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9733

Use devm_platform_ioremap_resource() simplify code. No functional change.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v4 (reset verson v2 because split to small serise)
- add Laurent Pinchart's review tags
- return PTR_ERR(csi2->base) directly.
---
 drivers/staging/media/imx/imx6-mipi-csi2.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index 762f19ffd0858c952027afa8e0f36fc87246e1ea..3d8995dcc9132c1b92c36a65e55476e3ca2703ac 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -709,7 +709,6 @@ static int csi2_async_register(struct csi2_dev *csi2)
 static int csi2_probe(struct platform_device *pdev)
 {
 	struct csi2_dev *csi2;
-	struct resource *res;
 	int i, ret;
 
 	csi2 = devm_kzalloc(&pdev->dev, sizeof(*csi2), GFP_KERNEL);
@@ -739,15 +738,9 @@ static int csi2_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		v4l2_err(&csi2->sd, "failed to get platform resources\n");
-		return -ENODEV;
-	}
-
-	csi2->base = devm_ioremap(&pdev->dev, res->start, PAGE_SIZE);
-	if (!csi2->base)
-		return -ENOMEM;
+	csi2->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(csi2->base))
+		return PTR_ERR(csi2->base);
 
 	ret = devm_mutex_init(&pdev->dev, &csi2->lock);
 	if (ret)

-- 
2.34.1


