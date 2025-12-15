Return-Path: <linux-media+bounces-48827-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2759FCC0222
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 23:50:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1F193027DBE
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 22:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B523314B84;
	Mon, 15 Dec 2025 22:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="a/iNkz7s"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010053.outbound.protection.outlook.com [52.101.84.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844C730C613;
	Mon, 15 Dec 2025 22:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765839022; cv=fail; b=aE1neLSjiFl1IVul/P5yR3gySvqOm3bEhmzCPg4sLXl5RfTEc4EkUj5Hgfc8M8tO5tSW4GNkuEFzgGo6PmlTdNLaaqTU4eMSeRC2jw84QlPVlJcK+Uzn4oxSf24djNuvknp2Ts8p/q4QCUyiyb/HoyZKu1f14xHZb/Nzv2kdnlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765839022; c=relaxed/simple;
	bh=ARPVaqVAWLk1VA6S3ScOC7ebUNYLCY1YIOO8jKmKuaQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=NSKAwTfy1NZSJCHU61rtWhpnsDP6+GYQ593NHvZmGQMbfl2G5r+joWFDgc88vxEjBMFe4ij7sFWVNOKZfpF9DuVXQecRlzgk3Jp858sVNeki/17gjQPqlylXXdHoijpkjdUeohpcJbFUstEniIHobcOL01X7AMuTj/79mQKvf2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=a/iNkz7s; arc=fail smtp.client-ip=52.101.84.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u5g29gaYQ0HZCo0OBB1vysp5YwBYsLgxgmrTi68duAuTBkrQKzcAHgfL/NIzcpvA1NOiMjpBd6UzreB7zKC0wI9XW+R1tGy4vGxW2cOe3/7CJ7JEt4/Z5A9NyDoLG02P/yZbLTiMTliiAVArq1zsNOIISQFO/eBWpbR3zCBeEaA2nt0EUD1nCxWtQcAcMmjzKtbpwY6adljxGhqsKaL5mZ/mUIYzHJ1NGsSLc2MCWu1baCngFnpMOFFfDsnRxuNPGTNwtGXHgBUxAprYJjsrGZnVGQ8aQ2755cnNbIjDgksCxRC8yDlqskVq1f3I15jLpWyHETVImygw5UTfFXS5XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CE3W5LA1JyM4wuWE9oEPumUOCTK4fL3rPZoBerNt4s8=;
 b=q0N+DGZkLabHozQw+ikaHfBI4FXBjaUFdgCWXllisYWvLSGiWcg4i6dK5vBVkWjLdVpVJ9c4FohXsuUo7GpB8wx813JgotKyHdoEVImkl9Dr2HYEEeN/otns9ylMzPwE8DGrkAMQ394SJP+yohxjAYCpwzAnp+JcnwLI7LyGJAqvVxUPd70vjSGkvFyUyyy+cEjdoaG6MDWwqzXTIo7DA4tvtwaGLm0tO/88yqJNOTxnUfq87Sl0GkS/jMtW1etmwRwN+4jDthHeFjqEZb3u7ux4WANdPfPTUfF87oAwLRUD+PuUBrnCv1OI3BreKkUQWfgfdOTfVn9/C1Tpdhv2Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CE3W5LA1JyM4wuWE9oEPumUOCTK4fL3rPZoBerNt4s8=;
 b=a/iNkz7sY8u6o0GBuGzv6vhizQeyXUEG+lzXWeRKNvIRp/jFfRgSbK9Kx4LiFsGY4m4FoFzLq2+qG1cPcpshQ+ZlL7dyVWI5tQ6w9/E7W/N8deHKj8TPhUmJBPB4fJQsQ5nubLl81ion1yWDU3TFfvrrXfRW8KXXcBw/4b5hnRv2I9prekp4D31kKSyFEufYHV88CpctEv3oSI04tmlUfqM2c2Ssio4Je6aw0Rz4G02Z5KylmU4601oo20ARXB9KalkREUcl+lRB2nuqk7srOSutPsWCucLOvtosTN2AQmWKM8nE4PBkukO/mQ0OU86IeiQ9jTYmidNNvD7b9+FDaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PA1PR04MB10794.eurprd04.prod.outlook.com (2603:10a6:102:482::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 22:50:16 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 22:50:16 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 15 Dec 2025 17:49:52 -0500
Subject: [PATCH v3 1/5] media: nxp: use devm_mutex_init() simple code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-cam_cleanup-v3-1-a61995068f38@nxp.com>
References: <20251215-cam_cleanup-v3-0-a61995068f38@nxp.com>
In-Reply-To: <20251215-cam_cleanup-v3-0-a61995068f38@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger-Novakovic <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765839009; l=3593;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=ARPVaqVAWLk1VA6S3ScOC7ebUNYLCY1YIOO8jKmKuaQ=;
 b=1gWFoUZBEs5bYt//IN/CN8Fm2sL4mMzZqJJsf0or0zwShKEIu1bUTwkvHl6s4knV00uM28mtx
 OYjyyC2ouRQBUMjYhZA1cxHBx4bgktAgjvQ6m3zdhJyIac/wt7ouUsS
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR20CA0015.namprd20.prod.outlook.com
 (2603:10b6:510:23c::8) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PA1PR04MB10794:EE_
X-MS-Office365-Filtering-Correlation-Id: 42a68a17-7cfb-4d10-b322-08de3c2c5079
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|19092799006|7416014|366016|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?T0ZEMDZmTWlZdUpDNnlrZHI2eUduMFc5R1lUcGticUpoSmlVdVZQcTVVWEFy?=
 =?utf-8?B?U0diWFNUd0xZdVBPWkxIYUhYcUh6Z0FHdlpLd093YzQyQktETERlc01vTU4v?=
 =?utf-8?B?QkxmQWRpcUdvbUlZNWlzMmtLbXF4MFdkOTcxWngvL2tKaUxITDZZSGFMQkhz?=
 =?utf-8?B?UEVvVnp1cnhLYXlDdGJWZ3Jyemp0T3JyR2JDcmxxWWdTc1V0ZUM4eE82RWE3?=
 =?utf-8?B?MzFDQkwzakIyaE9JMXZoaWdpcWRDVFFDcG43MTZmMTUxNGNQUE5qOGxTY1Mv?=
 =?utf-8?B?c0pRMFRmeXpianA1R0hDejc4Rm4vTlUyeXlicVdqa2FXa2RuN0diNVVoYVZr?=
 =?utf-8?B?TDhZeUZlRitLUU5MS2VCeVRiZUZSL29STEExN2pBbXpJWEtocmxMK3Z1NG9Q?=
 =?utf-8?B?b3lKc3RPVXBGMC9VNGVuamhHRVpGUHovU0VOZ05UQTkwUTBod0ZWcDhsK3hK?=
 =?utf-8?B?NDZ1UjNWZFFVSytSakhsMVJLZmN4c25mMmFGY0MySVNrd0c4Lzc2dHpVbkVG?=
 =?utf-8?B?RlNLUEk3ajYrbmFYVXRGbysvcE9LazlucHRpR083eEJDcDBsR3p6b2Q1VzBz?=
 =?utf-8?B?UHVwd2UwSUx2bUw0Z1FTYWdyejMwamUzMS9scEhNYjNJZC85R25sMHBMTURJ?=
 =?utf-8?B?L0kyaEc1dnFZaUhJd0lNa1E2N0hYZCs1MVZOQi84ZllKTFNHQnFVZE94SVhI?=
 =?utf-8?B?QWNGVFp6QjlCWXFIT2xsdWdVb1hCTG4wWS84eDFXVldoZSs0TVdDeEFuK2lW?=
 =?utf-8?B?bXIyZHRETjdFdzZxWGxjaTdLV2RrWm5nYmQxMjVyRHd2ZThvZ1dHamFTMzZC?=
 =?utf-8?B?SXQ1ZnZzdVVzMFB3cGxzT0xOVnZNT3JGU1JEell1cVRUemtHOVQ5NzNta000?=
 =?utf-8?B?Nk5lRFJDWmZiWHdXMDFzR0RrbUJTZW1hVlVlZjNCVlRLSzk2bTl6N3VMSGR3?=
 =?utf-8?B?RTFuaEtBQ3NScXdCUXVNMnRLcEw0N015eDQ0YUxBK1hIWXpWNmllOU4vUFJ2?=
 =?utf-8?B?d1JEWVNuRVFWMHhROGtMSVVjVXlPMXIvN3lZL0RMQ00vQlQ3TnNNeDFBLzda?=
 =?utf-8?B?SWljdDRReDVacmczRkxKN2hHVDNFL04xaEIrK3M0NFYvVmh0Z2dxdDV3SE1G?=
 =?utf-8?B?YzFCUC9YNUxsOWxGMTdvRFRReVp4enVKcC94S3Y1aU5ZMTJabzB4WnV2Qk9t?=
 =?utf-8?B?TGlxdzAzTnRtK2FrZU52b05KYjFFUmxRTEhwR28zWVUzQWpzNmtXTmVzR3RM?=
 =?utf-8?B?OGMxQXRMeDFnTWs5SVNVTm1EOWxZNDMxRUFkMy90YkExM0lHL3VQcEUyOURK?=
 =?utf-8?B?NzBqY1NZSWFlUzVuMVZrbGhseExvVFQ4RmpKTkFzMFlZc1N0cDRuZys1SHpu?=
 =?utf-8?B?djNMT2RHLzdZVHdsWDRqRmNkcW0yZVM0OC9yZFl1U3I0MDNIbkpIWFhsZ0wr?=
 =?utf-8?B?YlBkV3MwOFI3ZlBRSUF2U0IyRE9mVjkvUS8ydzFkTElTSFhZbkdRaGZ1YWcv?=
 =?utf-8?B?dDhKSVZoSkt6dWJ5ZFhEa3R4OHNXTGZGblpaOG9PYkYvQ3VLUzMvNzF2ZUMw?=
 =?utf-8?B?UGhTcFJIeHl5cEI0Q2ZhRXZZZGxkWEhMYzl5bjE5RklaNnQ2SGV5THptSTRn?=
 =?utf-8?B?ZnMxbmRNM2srdkdEZEIySGJNYmJwQ3dSUzljT2daNzdxUmZCaTAwRHA5blIy?=
 =?utf-8?B?QkxsRFQ1cTJkbDdqbDBuVFhQZTgvMmV5dFI2ODAzakdKZExMQ2pjTk1RbmhB?=
 =?utf-8?B?a3hlU1ZoVkJuOHdmbU1LV1RVWUFQNUY1K0RnQytXSWZ4L2hLdUNadFJiMS9G?=
 =?utf-8?B?WXNuNW5sWnQ3VFFSaEdjRWd5bnhmdDh6VEFVS1hlRGdFZDl4S0hMb2M2MC9o?=
 =?utf-8?B?bDVEdE5sRE10eEN5YTFycDBHM1dTSDEvdVZFRkNYeFNncjZKRWVQK3NxTHBl?=
 =?utf-8?B?UHBCeTZTMndBaHVLdWhLUHlIRmdYV0FYeWlHdTk1V1M4a0RadmZ1UWk3TXJ6?=
 =?utf-8?B?UXIrWHJRT2RPR04zdFVzQUM2ZEYxVXMzRzhlOEwxc1Bhc0w4djE3b1pqclRL?=
 =?utf-8?B?aGJzUWhMeFNoZ2ovbTdyR2UvZEpnR0lnZUVmUT09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(7416014)(366016)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?WjgzK21WOExWdnRxd2pzSGI1V0FFaEJZNVVTRkprTU1LeVVXYklOYlpyNXUv?=
 =?utf-8?B?TTRHd0hZM0NvaTJoLytxWFBWQTk4Zk9pR0htOFA4d0dTdTRPbDNDQU90WUlX?=
 =?utf-8?B?c0pBNzlzYlNNZ1Nvb25FV2pDYlBuTmVDLzFvcVorU0VxYTFnRWF2eVJWd3RE?=
 =?utf-8?B?UHRUUEViN0JncE56MUp5bkxOVkU4elc5OE96S2lBdk1adzN6OFlzYXpQSG9N?=
 =?utf-8?B?RWIyTWZHYzBzZ0diSTl5T24wYS94V1BKcE0wUFRiZ1h4cmh3aW9PZmdBUTdP?=
 =?utf-8?B?Q3lHdFRYdkdaNllZMmtCa29BaWV0cG9Ga2F1OWMyZVgxTHpHZkZlUkRrMVY2?=
 =?utf-8?B?NC9PRTg0RjJoYjJIZDVVME43NTZoTkF5bWtoempXT09SL2JuTHV4MTZLZHk4?=
 =?utf-8?B?YU0rVXlYcThGTUFjMVhVb29JWmZFWG9Idng1cThhOXFNQSt4T0JJa1pobVR0?=
 =?utf-8?B?alQrN0JhSnhtaDgzN2hXNzF6aUdCbVpXQWhUeTRKOUZFQWRraWx1MVpLSmt1?=
 =?utf-8?B?NWVCSytSeDJxUEpqRG9QSEswbmZXQ1ZnZnhNdEhmRU0vS3Awem5TWVc0K1FO?=
 =?utf-8?B?RU5pVTBFUmNrc2lYU0I4b0JZMGg4MGNOOUJrdWpNNEF4bDBFVkd2QUVPcVQ2?=
 =?utf-8?B?dUhqZkMraERRWGx3S0hiYXppSWcrYjVUMjRkc1E2aEdPeGo2YVRpWjZnQ01L?=
 =?utf-8?B?MEtBNWdnalptWlNvdHJBK2NkUHBDVUhqRjZEeHlnTE1QbDhRQ255bDBIRTh0?=
 =?utf-8?B?bFlpTGFvU25VOWNkM2kvbzc2dHA4S21ZV1IxZFJFblc5cysrOXFsUXp2MkNY?=
 =?utf-8?B?UUdVaVhsQUpCQWJVbW8xbHpHQUFhOTlqUWRmby9rak9jUTlOZk41REp4M0tG?=
 =?utf-8?B?SzZRQzZJUllLS1psYjNWd2N2YTZBcVBMblFuQi9kY2hQT2tyNnhMZjlKayt1?=
 =?utf-8?B?WW5IMmdFT0RQeHIyd2dKbG9wMnlITVVtN25SZGMzK1dJcnNoOW9EZkw2d2JP?=
 =?utf-8?B?eWFydFNkRVNTN3gwclU4WjNaTEhsQ1NXVzNRNERFMnRiem44VG9jdFg4aEtj?=
 =?utf-8?B?R0NhTTZpQ3ZWZStwTVJHaWFJQ3F3T0ErSDA1NzdacHBWWkJKOE8yT2FHNDVD?=
 =?utf-8?B?dk0zVnl2cmFNa1E5YzNXcVg4VWJBb1NvRjZRU05HYS8xS1MycFgzNkZJN2N4?=
 =?utf-8?B?QUNyWkFaM1hkQ2hVV2lpcU9zeGxFQ00vc2pTL29jVHUyb0o5N01qMmZnK2M2?=
 =?utf-8?B?SW1jbmZHNThuYzNqRXNsTFlJNzMxODhNNjZMWk5qKzBIeDBuVG00S3dDeUpr?=
 =?utf-8?B?VldpOHo2Q0tnV2dzRG5veHZFazh2aGJjbW1wVjVobzhZdXcwL3JWK3lJRDJK?=
 =?utf-8?B?VmYzeEwyOHUvZ2FFR2NaQXV6eVN1MlBPYk1QamJsbERXeU5HdkM3N3ZQTW90?=
 =?utf-8?B?RDc2a1Njd0tCMTYrNU04QUdxTzJtVDMvZld6aElBNTAyYzRRQno3WHpmbGhW?=
 =?utf-8?B?WUEzV2xYZ2trRTIwWnU4ZkprYTJBeWJvRVFEd200bkt0NXM1YlVQY1h2YnFm?=
 =?utf-8?B?VHVCN3ZmNXpJM2FoNDF5NCtZRE9Hdk4rQ01NM3hlUUhVZ0RQNFlpK3cyZHhq?=
 =?utf-8?B?N3I0aS9udFZUTEp4MFlUMm01aDJkNVlBRlVhZ2pEYlUxU09MaUFxSGRrK2ha?=
 =?utf-8?B?eTdHc25JNTdaa2J5bGRRYzQrQVgycWQwOEZ0RTk2WlhFQUtQL1Vlbm5sMG9F?=
 =?utf-8?B?N1YwN0hHczhjUlVreklqNEh6RzFTNU1CKzhrTW1hQmZyUHgzY1NIZDh2VmlM?=
 =?utf-8?B?N1dia3NuUEljYXJSb3BUVU9XdGluZjFQWG83UzkzYUQxa2pNTWQvd1NmWTVw?=
 =?utf-8?B?SU50RGUyOW41TnhHckdTNlJrakVYNjkxK2JhSnZRaS9SdGlzYmZRV09YT0NL?=
 =?utf-8?B?Yk5abkpCeHR6TjMzejJHUkFvSmFTNFJnLzVZL3NISWhDeTNuWDUveVFVa2Iw?=
 =?utf-8?B?UEEwblBMSzlrcFJvS0lhUG1BT3V0d2w0OUhsMXErRGhmVU80ek1GdTIxTUJK?=
 =?utf-8?B?WlhIV29DbjJhem05b0xIRmNkYTFlelM1YlFVVlREMW1ZNUkvVTl2TC9RTTZr?=
 =?utf-8?Q?3FjWgMajEBDsi12KWzR10bTNc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42a68a17-7cfb-4d10-b322-08de3c2c5079
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 22:50:16.0685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LDC7x/8RQXLmbPq/RPsoPJnPe2H96YYdYMrQzmj3cZxiX4fAPHO5ROgtAfF8LQ6+RS350sXeVxBoOPcxBpM8MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10794

Use devm_mutex_init() simple code. No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/nxp/imx-pxp.c          |  5 ++++-
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 11 +++++------
 drivers/media/platform/nxp/mx2_emmaprp.c      |  7 +++----
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
index 3f9a67a6bd4d268841f85f9b69af03138300d188..32d39c8013c7eef1f9629f971cc74afecd463ac7 100644
--- a/drivers/media/platform/nxp/imx-pxp.c
+++ b/drivers/media/platform/nxp/imx-pxp.c
@@ -1805,6 +1805,10 @@ static int pxp_probe(struct platform_device *pdev)
 
 	spin_lock_init(&dev->irqlock);
 
+	ret = devm_mutex_init(&pdev->dev, &dev->dev_mutex);
+	if (ret)
+		return ret;
+
 	ret = devm_request_irq(&pdev->dev, irq, pxp_irq_handler, 0,
 			       dev_name(&pdev->dev), dev);
 	if (ret < 0) {
@@ -1831,7 +1835,6 @@ static int pxp_probe(struct platform_device *pdev)
 		goto err_clk;
 
 	atomic_set(&dev->num_inst, 0);
-	mutex_init(&dev->dev_mutex);
 
 	dev->vfd = pxp_videodev;
 	vfd = &dev->vfd;
diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 371b4e81328c107269f89da23818ab0abd0179da..0851f4a9ae52d3096f454da643cfdc5017e000b1 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -1033,15 +1033,17 @@ static int imx8mq_mipi_csi_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, &state->sd);
 
-	mutex_init(&state->lock);
+	ret = devm_mutex_init(dev, &state->lock);
+	if (ret)
+		return ret;
 
 	ret = imx8mq_mipi_csi_subdev_init(state);
 	if (ret < 0)
-		goto mutex;
+		return ret;
 
 	ret = imx8mq_mipi_csi_init_icc(pdev);
 	if (ret)
-		goto mutex;
+		return ret;
 
 	/* Enable runtime PM. */
 	pm_runtime_enable(dev);
@@ -1068,8 +1070,6 @@ static int imx8mq_mipi_csi_probe(struct platform_device *pdev)
 	v4l2_async_unregister_subdev(&state->sd);
 icc:
 	imx8mq_mipi_csi_release_icc(pdev);
-mutex:
-	mutex_destroy(&state->lock);
 
 	return ret;
 }
@@ -1087,7 +1087,6 @@ static void imx8mq_mipi_csi_remove(struct platform_device *pdev)
 	imx8mq_mipi_csi_runtime_suspend(&pdev->dev);
 	media_entity_cleanup(&state->sd.entity);
 	v4l2_subdev_cleanup(&state->sd);
-	mutex_destroy(&state->lock);
 	pm_runtime_set_suspended(&pdev->dev);
 	imx8mq_mipi_csi_release_icc(pdev);
 }
diff --git a/drivers/media/platform/nxp/mx2_emmaprp.c b/drivers/media/platform/nxp/mx2_emmaprp.c
index 02d57229b9b3a600303cc0429e102139385071d6..384a2672884e96d17cca542ef51fbef62328b66a 100644
--- a/drivers/media/platform/nxp/mx2_emmaprp.c
+++ b/drivers/media/platform/nxp/mx2_emmaprp.c
@@ -824,7 +824,9 @@ static int emmaprp_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	mutex_init(&pcdev->dev_mutex);
+	ret = devm_mutex_init(&pdev->dev, &pcdev->dev_mutex);
+	if (ret)
+		return ret;
 
 	vfd = video_device_alloc();
 	if (!vfd) {
@@ -878,8 +880,6 @@ static int emmaprp_probe(struct platform_device *pdev)
 unreg_dev:
 	v4l2_device_unregister(&pcdev->v4l2_dev);
 
-	mutex_destroy(&pcdev->dev_mutex);
-
 	return ret;
 }
 
@@ -892,7 +892,6 @@ static void emmaprp_remove(struct platform_device *pdev)
 	video_unregister_device(pcdev->vfd);
 	v4l2_m2m_release(pcdev->m2m_dev);
 	v4l2_device_unregister(&pcdev->v4l2_dev);
-	mutex_destroy(&pcdev->dev_mutex);
 }
 
 static struct platform_driver emmaprp_pdrv = {

-- 
2.34.1


