Return-Path: <linux-media+bounces-49890-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BCDCF2C89
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 10:34:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D51A9300D674
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 09:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3930A324B33;
	Mon,  5 Jan 2026 09:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="koZ+HCOO"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021096.outbound.protection.outlook.com [40.107.57.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09B432AACD;
	Mon,  5 Jan 2026 09:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767605686; cv=fail; b=o3swhrQ/WvFiMII81Lu4ND9wFm5CilC6hlS+CJgkV3YU6JvYaBdWiQMzi333lj5XaaiI6sEMD909KuTG7o+UQ5DT7tiWp2NG4yIZblVR1vz0XwGg0QZdMCJNNhgJ+IQA7jkoHiVevWzsjnIGgFoPfeVQwXOP/QSv2c4CIrXrM3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767605686; c=relaxed/simple;
	bh=7pEnfuHFhYOGQOUuFf3qmylx0L8FU3T/KEem0Zy3GpA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=l8U3fVZS6r82lKyshYTexq7J5Xz095a67HJBHtnOGT2HfXy1XJAO1JTnIXidB7lFJb5HRsZZIuoBRUlRka47klLMqHCDqZZEa7ltTxn9cNV81f+87GiAQ6kkPIfyCFGKyPx4mq3OAjbwzF5qYQqgT9SeDG7fHrFM7CHDtFgKdhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=koZ+HCOO; arc=fail smtp.client-ip=40.107.57.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HG/YrJFlETqvmF3JEg2oWMn6OJ9VnJZLmPlVnalcQqLasH//EQm5oxX2LDHbsJ7aypmd5Ht4AyqZrLkYfcfySNVrGUSE+oM1NcoPRhWnThpcEK0xNSUzCe15hJzMtgDFAyh2qJhc6e7pEF6tFRZAtGGcTn0Ms8aPOd45bpX71DnCdE6ECNC9gdpQBPF6qRMjtJdE0t33vgHcDpyo1Qh6ZafUToey5K6GiON8fTsFbRoZ8rgbs/o1pyReVWXFZycqBrdBN+P+Fhn6oFbMu0dNFEGOJQPpnqnaJc6Pf2Sr36Fq3HHdkOPVTTyc2ZVBm6TUDLAxUNAfu7mij36LORO6GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p0tA8WdOHf4xSBjyRebLhM2is8UgUoiZRBwNB3OtW2k=;
 b=f6D2cnTvDFFWjXAWuhAZFS4C2428Jt8R/z7MQhePIWBPrxnw8z1oVwPX9DkHnwKDc9KgCErTwPjnAjNn1MrKfs4jI10ygplXZMi9zz/eiWJ9HtOl2rT4Hr0UiH3/tlkAufbVGqQSfe4XEt30TnXVdH3NNoNTW9eRrC5yjZejJlWJk1+fEp2Muk56Bso5SqT01Fmm8F9rfQLsr7M3SSfqYF/NdWGTMYGNVUBqbZWWPWCYZQxUH/8MQyjqZAnUk6Ub7bAXxA1DRxsRJvfXDXFYSPozh/YeC/+rWuS3u+CLzZOfTwbRK7JhPg6Kn9/TAVkIV4YxCA/VjfCoZ8vsJr3Q3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p0tA8WdOHf4xSBjyRebLhM2is8UgUoiZRBwNB3OtW2k=;
 b=koZ+HCOO+zbJsuxwv3rVFpHKNmy0hBMGC8iSOjcvWHd/ZX3jd2ADYNvTSrJgPbN3a5iReWu3kv1APhbQIno0MsmMt9xGyz8JUrK8mVeA4IncoqqGaIRODFmvqX9GKyKLAVovuFMGXx2ZEDFu10nuABaL2k595q9FpaH0UOqVT+5cuv0LA8f4G6OHhyrZtn30dzGnChne4U+YgA2KKaZHkLwrria3OVdsAdo3cdaC36KPxzMkIOTpJbcsxMyMfycdIeT/zmT/KwKkMV3x5oHwTn9QiYxReUcaZZ6/WlJZyI7ux725GHNLLWHJd1YQyzJ8GP5YJA0AlYQJ9qTD6eiwFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by PNZP287MB4122.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:282::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 09:34:38 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%7]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 09:34:37 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	sakari.ailus@linux.intel.com
Cc: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v9 0/2] media: i2c: Add os05b10 camera sensor driver
Date: Mon,  5 Jan 2026 15:04:12 +0530
Message-Id: <20260105093420.110973-1-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4P287CA0006.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26a::12) To PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1b8::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2019:EE_|PNZP287MB4122:EE_
X-MS-Office365-Filtering-Correlation-Id: 80f79315-0d56-42bb-d47d-08de4c3da4ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Cds9O7wBDl9bU6AmlPXa7Fzft1vD5fTamPWscwTBErtMFax/BqzlMBYyHfyz?=
 =?us-ascii?Q?ICwEXu17VFASvK+vVxwbavacFDTcvy7EwYbSq4DZoqq/J/lqfh0FOKpV+Bx0?=
 =?us-ascii?Q?jYPOC1v+AAAxC54iiyuqb8/ZF8bmIiycf+5m7t4hR4b95KlzApdX7IXywLLV?=
 =?us-ascii?Q?fOPddkwTmLq5n8iZ1SdbAntRAyJDS9qJKsW3BJ2lpEnnZPImXp3OF4AGuFl/?=
 =?us-ascii?Q?gwA8qPlEatasy3zXyobLUAU3oYNrYJUcsU1NbblAY0jD5XzP32tS2X6NAaPE?=
 =?us-ascii?Q?0MNxzQfcEmOhw1BovALC6DmovY1OJPPMlLoK+rRSG0OOIGgcw76VMpp/CbAE?=
 =?us-ascii?Q?jsgKnXmHQs9iRXjqyULI2BV1mU5YAW2VEn9DcBYCkMb0/vQMlbLlm2kzZuQ4?=
 =?us-ascii?Q?KhQxu+wIHUpsXUdk1de3gm8nVCj+Q+0sd7BVesj79szSj/xV9GGDX4HalwxA?=
 =?us-ascii?Q?AglDyWDuy0cLlX1e4uZKI0m0PQi0xyq/U1E6INlOehRf6fbNC1BKw5HE0Sl0?=
 =?us-ascii?Q?5KgyVBAp5eJMqIapVS9a+6deoA+9mVGAp1QKk3Z0Gsrv1n4s3aG0rF24MAIp?=
 =?us-ascii?Q?u0n2ZLCYHsojQKWveN1pLDJg0Qw4jCFvgn4Bm1Ay6TjdgKTZOe0E0fR49baw?=
 =?us-ascii?Q?jM/LnyIYww/JKkbInqg+Sde0pyspkdJzO+uFFU6DfKomMKDuxS2yTFlSKJPs?=
 =?us-ascii?Q?8PUPLicxnKItts6Nq9yKsFfwnJheyWus5+xfCWmOCzYfxK+MZ5mhzWeYUiZd?=
 =?us-ascii?Q?Skofe1aKzc9yJX580yu+AjEAD0umfOpyKmk1qWXFWC0VBlzDsgJEgynXggGd?=
 =?us-ascii?Q?WYVsAnfwfG7/Nxy4hUVTqi8ytJxIYXLv758PH+Go4YUCi7TZGBLgPFOhVvzx?=
 =?us-ascii?Q?O8i409dbYvwebd8LAsDAjwV2rk/tNNCh33wVa5nYcv82EcqeJa15FDzBbS3f?=
 =?us-ascii?Q?VJGwsds/Fed2qjHKWEZlne0fKqUVfC2BxrGC/GSFfDf5u9d3grWhFUQ9XhUi?=
 =?us-ascii?Q?xbl07b/k/cV4+2wpji/eYr5p9af8xVsShzIzjSOjxswKGcC4/ldgOAU/Lzyh?=
 =?us-ascii?Q?5sUriQ2RL4BhFx6hv/iaWM15jvS7r+YYNUUDsGZeSLwBJSJOpIl5zBfAJp7B?=
 =?us-ascii?Q?CkNsxhClz1VLa4Gz5OwjayF9meD9aKfRYOsl8sZv09N4DRnkep3dMAcFYmX+?=
 =?us-ascii?Q?Q/kX+R8UpZrevmfm0EidKDdllPOumxsE6Rri0iGxe2ZG/jUAt701FAQScpeK?=
 =?us-ascii?Q?wdTvW/ZCYQLBk59ZM3hb6aHaQTADWWWTT2incL7gmzS1zRvCCnk5SLWscOHf?=
 =?us-ascii?Q?yMIcEhkhVXUvealcoWJ6sxWizTw2km+XjMrwyam/eqa/JVShkSibzN91fSgb?=
 =?us-ascii?Q?sC81HSwlKz7rrwakHyVmOxrDQL3DjFrm7zrZB9G724yQN6WyqJ3Y0QFQI6CC?=
 =?us-ascii?Q?HcN44uE0W+wzgfB2r26hkNDJ5BFwQEERrC4ayLjt26bOQyVY2xaDQV53h3GJ?=
 =?us-ascii?Q?8LvoB1broAIh32NBdRB6B7gHXURAfz/+3D2V?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7WUwz69GUhxvEH6eJ2K0W98L0qgyNIFqui6JBGRRc5lj/xrJCBzXbDxvMEdb?=
 =?us-ascii?Q?uUHtjv6WRDqavWlILB4+POxVybx/hu9gj5TXJf2QHVqyIcqRPZH1/FE927VA?=
 =?us-ascii?Q?Y9wX4pE8keHUkZPyE+KEIC4Z4jcJa/C10v6BHnQ3Zw2oYFLVtQHl7GXq3bxC?=
 =?us-ascii?Q?0sVhwa5x0aUF83dSFCqc6AubSWjvJ9SrjKnAp5MK1SAf3vbyCmAVwkgS3DCo?=
 =?us-ascii?Q?jv3Jwrmd+rBRXUl9Ve4SS+7TtV0iqrsQx1v6HBq3SVISvaYOGx601ObmslKr?=
 =?us-ascii?Q?w4I5dXilELYp3T+TjtZ/fjFC6wlOpeT5HPMp+8kn6ttStMxj67McxIjPH26O?=
 =?us-ascii?Q?fEHVgARUozMwV1yjVSgH8nQZaGWLCFSC1y/4PKJRcUY5oFt/l5NyzxNIudeV?=
 =?us-ascii?Q?sUkEavuSlK5ocHuflxPyYyGsOrxb6I5+scLsHcm8U8K2rSxgy2CgdokemvcX?=
 =?us-ascii?Q?qn9f0l4CN7rs/hEYhNdm/r+lPZNzINqMnvh4ke9483OaU41VKpq3BhftR600?=
 =?us-ascii?Q?Va3znR/bumNo5wl/2HPMo9u3pSVMkMneN/5xq4c1PoZIHbAFx67rOlqJ21CA?=
 =?us-ascii?Q?aZynS/vcWYY9E7zRTaOHKuBWIFE5hgF8lVCPhQ958yD65tZa+IChroXDQB+d?=
 =?us-ascii?Q?Kv3WR9MXMjBWaf7BDfl0VM9LKod2BEOpbP3LRAO9jXV9NnCGReqBlLIpLm7u?=
 =?us-ascii?Q?L/O+YjhlYS/3ypdrpTljUVr9BT5JcA0ERgf4zzY11w/4Qfiyzv7WqdBi+8/T?=
 =?us-ascii?Q?Bmnz2Mx6IjGs4uZE1QsQV4FwxBJLSE54qyr0BiICDI1u2PlFVoPLkbMlAsm2?=
 =?us-ascii?Q?aG4S7dUXtm5iIJRTN7AXR7I4xzIhBLN7L7P4eMcHsSK2xTytQDTnnBIV+Plb?=
 =?us-ascii?Q?6NeHf4ykCNh9+f9jniC8F8UpZB9iizcPOduHBHZ6dQSHzw40NomLzH2cuHWX?=
 =?us-ascii?Q?yTgYUH8ENZbVA3BGfE2hxNIhyEjmvTYQi3KrOprrW6c9KQPw/ynr/PBpeBWf?=
 =?us-ascii?Q?YbpwIIkMbfi4n84rTf6qTONWG8SRbyU5HDgR/YKkd7CJjOdb7BMBzleNZbl/?=
 =?us-ascii?Q?VmhUh8tkfGQaByImyhhUQQTbVsP8P3J6nXlbfn3EzAAJspqKZNoLHT90YGfz?=
 =?us-ascii?Q?3GeI90Wm/vNQL2+KFxgf2UL25J1LYg+47dONTV4W/UcCkEbYbA5Wj2XaF1nM?=
 =?us-ascii?Q?lWOysl9kMYDKzk/PU1AoRtNlYCXdxgo4/LNlLU5YaIiv9BGcZo4SltOu+1zg?=
 =?us-ascii?Q?XDHtdxDETH0H6sOES5E0H+46KEMLTuKtsAyintDo1tc51yU7kkZmOtyyprJD?=
 =?us-ascii?Q?3STdqi8CqESLI1wG4JbTDmZ3N8NVgNNQvR/ndfe1P0GwPErnOj0kE0YSXWg7?=
 =?us-ascii?Q?H0182E1IiQUPEXkRdxqQRhWfCITWq32DpKHW7/GzZUlKbX17Wdaek7AdIG6Q?=
 =?us-ascii?Q?of/yNq6E/Vw2XiwoiXtKmtrUDAW5YmokBvUDIeCjs7q7Nz2N5z/5YbPKWNOk?=
 =?us-ascii?Q?BY94Kk1OwRa1r9OwV0uS6owLaGSKOyPfjIARiwiA9HNSNZ5lG925W2UIKlPu?=
 =?us-ascii?Q?qxDej4sZGYTeF7TFcpRtxGKDauks2c18KJTq7zcpr+lMS22g4QsYxmepzjmV?=
 =?us-ascii?Q?/g8ncT2t0v3lfhk0dmPHGnMdV1M5ytlLGpVV4MVwcDnCYk5f8FUpF5CzdERJ?=
 =?us-ascii?Q?vcbCJPZz9CCFaQrz4w9CSEXkdnWzujbL3LRfDumm9wYKI6b61MKSrF1hkpX5?=
 =?us-ascii?Q?ME2Gip6wwmcpSXxPfvEoU56j/Gle7+hv7KVoWGFsCheXHo7qxaGR?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f79315-0d56-42bb-d47d-08de4c3da4ff
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 09:34:37.9138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V7/bsC5uv52+79GvUI0d3/lRTsC92+GlZJb9MlU0H4S6UwsxcvbHl0s/CRy1R6TKAsBwPrkZJ8bfTa8XnFVLr4HT18MmayydgqFkMFKKQZZLLNICZvcP3V1MNG6bUMgq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZP287MB4122

The Omnivision OS05B10 is a 1/2.78-Inch CMOS image sensor with an
active array size of 2592 x 1944.

The following features are supported:
- Manual exposure an gain control support.
- vblank/hblank control support.
- Supported resolution: 2592 x 1944 @ 60fps (SBGGR10).

The driver is tested on mainline branch v6.17 on IMX8MP Verdin Toradex.

v4l2-compliance 1.26.1-5142, 64 bits, 64-bit time_t
v4l2-compliance SHA: 4aee01a02792 2023-12-12 21:40:38

Compliance test for device /dev/v4l-subdev3:

Driver Info:
        Driver version   : 6.17.0
        Capabilities     : 0x00000000

Required ioctls:
        test VIDIOC_SUDBEV_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev3 open: OK
        test VIDIOC_SUBDEV_QUERYCAP: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 9 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK (Not Supported)
        test VIDIOC_TRY_FMT: OK (Not Supported)
        test VIDIOC_S_FMT: OK (Not Supported)
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_EXPBUF: OK (Not Supported)
        test Requests: OK (Not Supported)

Total for device /dev/v4l-subdev3: 44, Succeeded: 44, Failed: 0, Warnings: 0

v8 -> v9

In Patch 2/2:
- Fixed pixel rate computed in runtime
- Fixed indentation issues

v7 -> v8

In Patch 2/2:
- Reordered registers by address
- Removed redundant control registers
- Fix HTS mismatch with CCI setting
- Set reset GPIO to HIGH to keep sensor in standby at probe.

v6 -> v7

In Patch 2/2:
- dropped __func__ from print statements
- Switch to fwnode_graph_get_endpoint_by_id().

v5 -> v6

In Patch 2/2:
- removed the unnecessary header includes
- Misc cleanups as per review feedback
- fixed reset gpios to devm_gpiod_get_optional()

v4 -> v5

In Patch 2/2:
- removed the unused link_freq_index

v3 -> v4

In Patch 1/2:
- Move supply voltage information from driver comments to DT binding descriptions.

In Patch 2/2:
- removed pixel_rate pointer as control is fixed.
- fixed default statement in os05b10_set_ctrl() to "ret = -EINVAL"
- sort the list in "reverse Chrismas tree"
- remove redundant check from os05b10_enum_frame_size()
- add a check for number of data-lanes

v2 -> v3

In Patch 1/2:
- Fixed space symbol is missing before 'optical'
- Changed the reset pin control to "active low"

In Patch 2/2:
- Correct the module name in Kconfig
- Fixed use of dev_err_probe() on endpoint parse failure
- used devm_v4l2_sensor_clk_get() instead of devm_clk_get()

v1 -> v2

In Patch 1/2:
- Fixed indentation.

In Patch 2/2:
- Fixed bug in probe() removed unused variable "ret"

Elgin Perumbilly (1):
  dt-bindings: media: i2c: Add os05b10 sensor

Himanshu Bhavani (1):
  media: i2c: add os05b10 image sensor driver

 .../bindings/media/i2c/ovti,os05b10.yaml      |  103 ++
 MAINTAINERS                                   |    8 +
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/os05b10.c                   | 1139 +++++++++++++++++
 5 files changed, 1261 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
 create mode 100644 drivers/media/i2c/os05b10.c

--
2.34.1


