Return-Path: <linux-media+bounces-40674-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25901B305E7
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 22:38:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76251603599
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 20:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E00436208B;
	Thu, 21 Aug 2025 20:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="awMmoe3r"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013037.outbound.protection.outlook.com [52.101.72.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E7135FC20;
	Thu, 21 Aug 2025 20:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755807481; cv=fail; b=dIsvjLZkQDhMp+Q7FL59uSitG58AYKM8xksi6L+BZod0be7SvnSEj2ILGkad0EFFrBgmEZzt/yEGp3QOTGPKTVflHja6Y9iqcDbxdY5tSVIe/3f3m5KLZcIl/F7+WPezh+VC8j7WLvBLcGPXPh9+T6pZFw7i9qTjjvnJ1g5p5GU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755807481; c=relaxed/simple;
	bh=S37Bf1KZBfE8dF5MUGPi/zF/YObDJGNoXWg6MjoaFzQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=gSw07WGPM7xQuxXYKtHrg8qioiJaLSVu8+zCg/J2znbI+ScDRYSgXTL/n8oEAU8TfYn++GS+4Oc/VN6ViFfTAXWubEyI4yiCx2cLUQMtSLJXTr7Co7A5bF5zTRmG+5gJsxKoemzW6yWbXmlru0tNg168NXSRq4GWmM/xSzSyHyM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=awMmoe3r; arc=fail smtp.client-ip=52.101.72.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tk0amaQZyoYxfG3v6GQKHwT8jUKNVcI25rcjY7eW0poa2roXY78tOt+7TE2M5oWW4s0reHYTHZpACzU4Mk4FBrjWDIiXxI73DBPXQKD4TM+w+5MtgO/n4zQ7MpMwgbRcBdH7ylDhr9J8aqNhMETjW102g1LhZKFFDdOrMOmhblOfiFACry0bzkLwIDimh3lJkWOOqQmoh/BnkaMVSaxa0VSoSbm4gTJjcj1dOUJYWmTaxrz1ATSarxkIp4K6eWnHSG0KdRN++cfanN4IRUTrJZRAn7jP0OlLbrHzzVgGxFdo8XD3sIep6CL90mBIgydv6sa8EmUwVYwW+2AzNu2lEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JwCXkMMYMtGtf/YAT9fCxB/d8zsUxX3DACZ6s1GR+cU=;
 b=XUbQIDx+9U5LwyjDfW+ZF1cEqhUUcuff0yGyPKCF8/c+f+XKsP5iRhr6gVOlPT5Xh2UtjNCL9OT77z4c0UY9+avQt1ciIHObEy1SebzH53aWTNaKflzu0FqTmCVvQ7pRLNnTu8dncsqZBANQFxi29kJU5UQOp/x1mUwtAueBYBtR4/V0SeJNsNgieGOoXyVB53YyEUaxS48c/wxxup04Du0UX7Nm3henQlc9OLF42hKP/WcVS/oI3vYKUnkgVeTPnxp7Be+ODUXtq1ozXE0UtHNt6vfQD0969VSHFsM24OeqDA6eclI2Xx/BbDP8mTPioaknC4ZkIrFLduAG9taMvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JwCXkMMYMtGtf/YAT9fCxB/d8zsUxX3DACZ6s1GR+cU=;
 b=awMmoe3rAjBvITemPCtNebJJdvziPB44etu7lCfPXyn6jXLNd3NTnRdPvYl1xEpSndexeDtgoNkj4/Rcwdx9nGHHstOOM58fPQJFeoVyJhhlA6GN5+NoVDchl0D0e/4IWXs5EifuAyTwRaQD07OtOm3spQf47qa/ONXgks0qN+BB5oau6XNw7Jcws7Z+PycfiSIJ70yvH8Ie8+br6EvZgvL5o4C7Rj9E5VQxFLjtuytqDLQ8wv+Amj4ogdJ9sWVtsOkrEyt5BICR8isGJIYHOHHVPh4XEwxoNzpVVDpxzCC5C4nf5812aufdBh0j7y6K0E44AfXLH4o4lUKSauwNKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM9PR04MB8438.eurprd04.prod.outlook.com (2603:10a6:20b:411::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Thu, 21 Aug
 2025 20:17:55 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 20:17:55 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 21 Aug 2025 16:15:52 -0400
Subject: [PATCH v3 17/31] media: synopsys: move imx6-mipi-csi2.c to
 synopsys/mipi-csi2.c
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-95_cam-v3-17-c9286fbb34b9@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755807362; l=3262;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=S37Bf1KZBfE8dF5MUGPi/zF/YObDJGNoXWg6MjoaFzQ=;
 b=CfLeJ4qr7lxu+9b6qcf/U+frF3XFIdCwHm64PXFMyUUJu84LgRiNZhgv0N1xZggF7VjDGNuCh
 RzEX2vGYkViCeFy2g9/Us2n1e/O4kxojjXp7fP4AFDVeaMJyR63k1sv
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
X-MS-Office365-Filtering-Correlation-Id: 7582a270-986a-4952-7a66-08dde0efd04d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|19092799006|52116014|7416014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?Z3dvUWwxUWFLb3VkRFNCUGtvcWpIWVVNT2x5NlowQVpZR2Y0VGJFM3ZTaGZS?=
 =?utf-8?B?UTc2ekFQZjNUa2VjaTJIUEoyTThMcW81VWlGK3VwNzYybEpObkdSdEFNeWk4?=
 =?utf-8?B?Wmh0UXJ3OG84NGJkZkorc3VvSVZOWWxHQXBQODNWWEhnVFJTZjB0ZUxqaWFR?=
 =?utf-8?B?VW9TbUhONkJrLzE3MHpRbzF2YU9ESDBvdUN1YVIwRXE5MHZ6cE1GaVNOd0lt?=
 =?utf-8?B?aklEVXZpNitxQnhYeC8zQVFRRjJiSDdUSi9rSHhLVHA3Vi9PQmVGWEc2ZlZD?=
 =?utf-8?B?dlJucVc5VXJFL0dNSDZiaEk2VkpCWXdNK053aWcwd3ZPNVh5eUdtUXl2a0ZJ?=
 =?utf-8?B?aGp2MGlqYzFOS2lrQWlhTEMyTFIwa0pzeTVDWXVSOC9JM1didVVDTWNZWE40?=
 =?utf-8?B?WjBBZm5sT28wbVlRby90NjlidUx5TTQycUpJSWM2alB4MlpJamFKR21tUlR1?=
 =?utf-8?B?N2V0L1FnZUtoT1hLK1FrMWIrV2szbGdMekR3SDlzSlo2ekgzWU4xbEg4TnZo?=
 =?utf-8?B?cmlWNS83cDh2dklHdUJFdm5sWWozSFlnQU9QUVI3bnkveC9aM0dRYTNoajBY?=
 =?utf-8?B?NkRKUUxMaVRsRmlZd0JHWjNhVHRtWFZXZGp0bW9YZmdpUmk4NnQvUW1GNUwy?=
 =?utf-8?B?ZVlPMk93WGJ5c0lrY2JHbmFlS0R6c0Q5MDdEUzRXaU5QY1JzQlNTZjlobEVB?=
 =?utf-8?B?M1ZBRW1yQml1aGpiODRlazFOWi9TdmI0U09CdFBKcUVaVGFRQ1c2b2syRzVj?=
 =?utf-8?B?c1NyL1ZSd3VER2JYZFhOZlcvbDNhK0RTcHdSREp0QWFvdy9icGJWR2lReDVp?=
 =?utf-8?B?MVRjYzhaT1JDZlJocS9tZCtkaTF1U3JmL29tK2RrMk9rbUlXSUdyb3RHVTlT?=
 =?utf-8?B?YTRLQmlFRWxIN3k4TDI2ODdRM1YwTXpDRDIyVXVodkhWQmVNRk9oUWZaVXY3?=
 =?utf-8?B?WFcrQ1Jmbnl0c2hPc1hPTXZ0ZmljZUxyZThBTnRZYzl4TjdvL0llOEZPZ0oz?=
 =?utf-8?B?Ykk4RkIzL0Z5UTJSek9qMHZPcDRibUNKcmdPdFJEcEx5WnJJbFEydGh5Ykts?=
 =?utf-8?B?ZS82QXRkMG9sUnZvMlFLcWlBUWVHVnB0TlBiN3B1VHI2ampDYkNHNmxSNEls?=
 =?utf-8?B?aEc2WHN4QnFQVFQ1cU9VWHpsQXNRcmtvSjNFeHJtbzhualpPWWIwRFlpS1RR?=
 =?utf-8?B?QmlyWk5GOURlT0NMbjJMU01EYUtTVU9wSlV4eWEyUEV4a2liOWNleVRyVWlV?=
 =?utf-8?B?RTluWm5QSlkvWGswWXNZRC9LemxMdFNzczFKdGlGRjhVUlpHaGxoOWJmc3NY?=
 =?utf-8?B?S25FZ1laMTZSNWFyNU15UVhhd25mMGNVSVVtMXM2YXNhNHkxelBKMnREWGpE?=
 =?utf-8?B?TlcxRU12QVl2bFhoa1VnUlFuc01JS1RKdTdMNmVCK2hLV1k1Ry9FYVJxbmJz?=
 =?utf-8?B?N2IxUXhtWDhNL0JUMHRBREszVmg2a0pSS25ZTWsvTWRoQ0lVQ2M4WFQ0d2FX?=
 =?utf-8?B?OVlpN2M0aFkyTFdFTElCMEFpbndpUk1SVlJvN3M4bkowbDAyaW9uVnlXRXd4?=
 =?utf-8?B?ZWlNTC9PTmx3Q29ObFpIcmcvVlJlQzFISDdJbGZLUW93QnlqNzZFVE9rSkNt?=
 =?utf-8?B?ZXI4cFFvVFVEWEFFWmFEb29md0JMUGRRNktJRndNV0oyWkdycGhtSnpBQzRz?=
 =?utf-8?B?ZlcweVo3eisxNjNnMTFCcnlhUEQyWVBRVXl6STRHYTRuMWMvd0MzalFWRW5n?=
 =?utf-8?B?Qmt1WFVneGx2eVMyYUlPMmtqa09ueVpDYWtNUnBRaDY4TU04OGxVUXJQRlFK?=
 =?utf-8?B?T3JhbmRZbVYrSDIyN0NCa0Z0THhpNlpiU0tSb250RjFVaHFaZHY0ZldFM3NS?=
 =?utf-8?B?akV3MmpMV1JzVUhvUXJCRXFZeWVva09xTVR3ZTlHK2NQVUYzemxoMXFKejNa?=
 =?utf-8?B?RmQ4WDc1SzlJUVF3Z1FWOFBnR3RXOG54aU9SWDJHMUJjKzh0YU05ZHBZS2sx?=
 =?utf-8?Q?VEpd28dybhm9f0FlJSr0ukWB/+mrfQ=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(52116014)(7416014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ZVV2NjAzU2ZVa1U0aTZTYXRMR2o2am5nNHlIQ2dEMHJOcE80d3c3dlMySzJ6?=
 =?utf-8?B?VGtSMGxGTm9KejdraDN3ckxIV0kyTmV2SHE5cGE4bmQ1V1RKWGVPV0ZOdzZk?=
 =?utf-8?B?VVJ0ODkvcFgraFArdlFUTDNYa0tpQzdlbHBzMHRLc3dHNldtQTRPZElEV00w?=
 =?utf-8?B?RHQ5UjlpTk9BSElrTS94MkRJek5YaUtNOGczLzJ6WkdJeHBqUmluNFVNdVFM?=
 =?utf-8?B?ekpsNU1ydzdTanU4TEZ4dFg5NmtBaTRHOHpHSVF0TWFxQnpmOUxnb1JlRHVY?=
 =?utf-8?B?SWNPWmRUQVA4ZXFEV1pZUzFKejhpU0ZycXZmNEtUNWZhaFJQNjRBU1VjQWNI?=
 =?utf-8?B?bzZEblVjV1RZMkFaeXNTUHFGRVNoMjBBZkF4cVhJNjdQYWxyZGt2SVI5Szdo?=
 =?utf-8?B?aEk2RnJWV3ptL0ltUGNkS2FvWmplb0x3cGdja0lLczdJdXoybGJYSUtvSmx1?=
 =?utf-8?B?NnZUbndES21XVkJIRE9tZzV2UnRnVjYwRldhc1g1eFpBQjhSRmRiUE1PMW5N?=
 =?utf-8?B?TVM3VFFoUEJWYkN4UmJSeGc4alNTWUhVdVU5QW5sTklPZTI1RnlTeVVUUUdn?=
 =?utf-8?B?bXhIdjd3eU4zWkE3VXB2Sm1BczFDSWR1UFFQMmxtVmZlTEJFdjlMcjdzaXdI?=
 =?utf-8?B?eW1zMllPR2JiOTFFOFY4R2lBVWQzV2FST0hMS1ZieGhiUll3ZFBKNzFFa3k5?=
 =?utf-8?B?TmplandKb2FBMzBxOC9VVmtweDdjSFdtNU5FRk0zeWJWV042VU4rVnlWejJq?=
 =?utf-8?B?WFY1TzBVQUZlR2J0cDM2T3oyTktrNU4wcFJLd295RTdGTFRzVThpeHhnazJ2?=
 =?utf-8?B?R1NZQ1luaDhudDZBM3BFNnNWa05nV1NaUkFTa0lRa1EzQnllZG9ybDRBd2R0?=
 =?utf-8?B?Y25tdE1KNkVnK1hWTThTS0lNYUhPZ2lmbllKZlgyZFAxL3VoNjZRQzV5Z2JJ?=
 =?utf-8?B?NGQrZGxtWE9XNDhtQlRwakE2YWo1WG9MZHU3c3RPYjhjZGY3WjZEaE9URVl4?=
 =?utf-8?B?am1ha1JhOUhUakJTOW9EZkwrajZpNksxK0ordkdlUEl0dUZVK3J5cE1HalpF?=
 =?utf-8?B?aVZYY0NKRUh5ZEJLWmNmK1RGcTRUK3NOZ0J0dFRwTUFLSWhFcEdQUmppRTNN?=
 =?utf-8?B?UHZGdlNPNEpZcWEwOW0yZmo3M3NiQnBJREZod0l0eGpWZlBPbW43VmRQbzRz?=
 =?utf-8?B?aXBjVEYyTFg1M2xhMzRDR053dnhsZVpuWTZJdzY3bitLcUFQR0JsRUJIOHM5?=
 =?utf-8?B?TlpKb1BhOGxWdGtJSnVRTGt4aFRldE0rVlhoSWxwTXh5OFgvM1ZwY09iSE9O?=
 =?utf-8?B?SXJ4RDFzSWNtOHRKUzVWNlU5TE95d2tvY2lTeDNRcmR3QThDWWdRb3hlOFAx?=
 =?utf-8?B?L29hS3hjWjlrTkhsb2lVUURVNUcrc25pWXhab0pkWllBT0JtUUVXOGsvNG1i?=
 =?utf-8?B?bXhlWGVaeDBNZDVPSURZVFpxaGMrQ1NadjZkcHU2RnhMVXFicXhrTmluNXY5?=
 =?utf-8?B?czlOaU5NeU1mK3NMcTlaUkxyQ1dzUFovMlVNODNHdGxTVlBNakNDaXVEb09Z?=
 =?utf-8?B?UC9NallOcUpDdG0zQ0JaWCtMTGI0a3psODY0dDhTM00zSkZXQXN5dStUVTQw?=
 =?utf-8?B?TEdRVXAvZ2gvSXlwV3ZmUlZWczk1MWdodWdkbStmQmgyZXNveHMxY09aeEh2?=
 =?utf-8?B?NXprajh5c01YODB2dE16Uk04YXQ1MEIrbjhobm1JRDBCV014Z2ErTkFYUWhj?=
 =?utf-8?B?Zkgza0ZZRjNDNEJ6c3N0L3oyM1lUeDVTL09kSXhrUlJCT3BzOHBJUGhvNTh6?=
 =?utf-8?B?RWF1MVVPa2tCTXl6Y041YVIyQXBkN04va0VPUE16YlFyNWt4RTgrRWpwMEx6?=
 =?utf-8?B?MHEzczRiSGRGZDd2VkpwRHJyZzZTamhzUjV0OGZBSzZiS2lzcDQzVWxWMEk0?=
 =?utf-8?B?NHFOMDVXMHhSRU1wT09FMlpOTk1Wd3NkclNlVEZ4dVdMUTR1QlAxWGpkdU9q?=
 =?utf-8?B?Ny96dEl6czBSbDZQL1RlYnZHbVZIU1ZxSmp3czF2SEZRR21xbE04QU9jZkhD?=
 =?utf-8?B?eXBMMXpoZXZ6VGlyNHYrUjh3UmN5SUhRaWdzNWhsa05kWXpnUlZON292d2cy?=
 =?utf-8?Q?gjLo=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7582a270-986a-4952-7a66-08dde0efd04d
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 20:17:55.4419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jxj1/JQ5Syc1bLLqoIDVonG4+pzmVxYgCgFQ8ikZEUdwHjwnlHxKgZCgoa6bde8lmCB16YKB0X/S4xglvL+b9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8438

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


