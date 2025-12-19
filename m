Return-Path: <linux-media+bounces-49139-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3012BCCF04A
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 09:46:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7F9833010E38
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 08:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C60A92D8399;
	Fri, 19 Dec 2025 08:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="YxK1r4IN"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020099.outbound.protection.outlook.com [52.101.227.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB7F272E63;
	Fri, 19 Dec 2025 08:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766133957; cv=fail; b=CVX78IAtwwJsJsbEKuY3UL7gkwP7SGNo8WUpb3JQV6tZ0aFt4B0s6AVDyRvSgxAKrcukql8uITXitknfnNueRawtApouwvjSJHKdfm7ZKcgsZ0R4Vorfm3LAi/d9Ra2q6KiUovM6GNQo0gtnFTvhOlhnhrWx1DYorVrW2uU4cFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766133957; c=relaxed/simple;
	bh=t6dFzvw9k7TEsJ4E45A2M+L0vKk65OFjeOLHyku25YE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TUD5CEJ4l4sAMsMlk4DmwrVOJmZSk9MOigPdlRYZ0voLr4zIqpsWvAlKKhb6HmYYIib/yFwa2xnoicpERSBLRTo1GrQlslDKA8DNMMtuL2WuV2cgJVVciMFU1BE9lCBwIZ863jYQaG4pCbnbcOSOPcSRddjesklaIi/sx2MEAig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=YxK1r4IN; arc=fail smtp.client-ip=52.101.227.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WICK2G1VYZG8+mRbK8jlCuEjp5omuHmne4NbLqRWIqdYxJqjMhn5b9BOGABdkrvB2QKwsPtAgty9rRggTViWLut91bqnN1YqW+N2PpcL5ejo3lf36RL2B2XI33F4cb+wqTmOmYRZT3LrkYKw+eQxEeg68t3c8Pe+1P1sFd5pS5xsAnquFnZo3ZWas8m7RFrYf+qojQetvfOs8gzmlInlgGL7WUrSphyEZT/1tD1nOKjNErk2dHM1VvSXnM/XToXqjYOCUtNjJPhafv0XgRfxduFL6warFD5BCfJAVzbooskj5XWL6Fp/uQFK8bnWAduKjqEOWTgbJAQOKC87G35BJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Py12aDljtRViByS9P7aIEKRxR5LhoWwzF1FHridyJTg=;
 b=QghRGDQrmulEqw0IBC/jGswny0xb2UKkfwtqVpeEHu1Akd7VyKpiWOAYJ9q6xeGmU8HhlMcBtyCQh4tnXUVtK+1I8JZyUYNnYOy3SPniuPFvTYE8chNDKbXHzC8olGFlAVsqTiMnaopsw2puYbdDhM021cPQLe/jbYnDcbLRbk3s/T1F8D0fFHEd+mj2nqPq7SO1TaV/lVpPUIDDLGXz51MwRgw8p/QmDVmFPDCdr9QErUMkf3fu/WiejGL4McZIjkdQdbFUflWeoLbHTjlF65M/ULP7trI5Qqda2FlCZrhYVwob2OL2v9/EmBHLw20d2KvDwumLGbwJUeTfypMUeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Py12aDljtRViByS9P7aIEKRxR5LhoWwzF1FHridyJTg=;
 b=YxK1r4INgG81of/X7c+5T0AOOOsCefVf/qQZICPo6GzjJGsLNvRK95suK88JaH8dwLrvrRWaenmENMl3axcfDEu5yjakn7z9DyWwX296Z7ktWnV529hfhDlz/t91F8WQSmu2W84SCo5c5l8NMcADLC+sMdlK3/y93SYBp75HZOw+rctZC76CCfjU30StbL54FOAQO8NdUmt/zIG3HlivyET2gGWObH0J+maFP2Vn8y3iAgIUagAWHcjnhmekuXeWTgv6ZoR9c8ewurHMEnIskVUgqhLX3CMx1p2ivafyMvabQKdFL3Gp9dAIveA+GnXhQZvy18/5VAmUbfmArPjt0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by MA0P287MB1066.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:e6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 08:45:52 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%7]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 08:45:52 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	sakari.ailus@linux.intel.com
Cc: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/2] dt-bindings: media: i2c: Add os05b10 sensor
Date: Fri, 19 Dec 2025 14:15:18 +0530
Message-Id: <20251219084526.22841-2-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251219084526.22841-1-himanshu.bhavani@siliconsignals.io>
References: <20251219084526.22841-1-himanshu.bhavani@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4PR01CA0047.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:279::9) To PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1b8::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2019:EE_|MA0P287MB1066:EE_
X-MS-Office365-Filtering-Correlation-Id: 730d4d38-ed1b-4e8a-ed40-08de3edb03ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?162OwnhwgkgxONcVXlsZ2wFVUARLmNXzFr46d2WZeYlRfAuZrEb8QKwLonog?=
 =?us-ascii?Q?We60/5pbbCioKv0Wmb3HXcFfFcFVIQ0NHDHHi2/2oguT8YiAsAUN4qXZO+zi?=
 =?us-ascii?Q?Zt90oeK9Ag1x39E+ClVau6ZriSNNIYdsvW3ytlWF7LXwVS0PDh0x4+7Q/q4Q?=
 =?us-ascii?Q?XCNTGQTsnRB3ti3mAmssmD4jBtHOoM/kAh7HJRqaAYLZqfiZGJY4NBJStIq4?=
 =?us-ascii?Q?SN7Smghc2Li/a0MAI5IuwuauFcoyNMjgP4RS07YUnuGWrDhZWq80uuuCC39r?=
 =?us-ascii?Q?3zHZVvwySY1Bvd8+NevilxFXf8kbxnBWIqa5f6QwWDHv7BYEtDrpwIK0dm5i?=
 =?us-ascii?Q?ISKtp5zroDngNuTojaJY3Ovk4Sai3vnM+vSwakDEvvC8d12F9PjeJh9/tSG7?=
 =?us-ascii?Q?n95T2hjqsVG5rbZ8n4FufsuqYjB6yoIoo+qYYqQPwm0n6EzEFu4bEQM0tdQi?=
 =?us-ascii?Q?KT5cHh8jz0RcccJbuYr4xGRgU8VkTscp70DWGv6Kce5dQxDmQzZoxzDz1Sku?=
 =?us-ascii?Q?6fRThgowx4FXi5XT+iJNoPj7YIo1M3Wmktpo+p/szWPGKFdcNKB1390DmDAI?=
 =?us-ascii?Q?VgK2AIdZhBycdLZ6Oy/6nTkpIFIJO6hkOXTSRE5Jizi2y6mEf6uAOaW+MmqA?=
 =?us-ascii?Q?G6W30NjpUxlwGblFBTTVMAA0rNLpE0/eBnXlVzLQYpu2OLjN9Yu09pzKDM8P?=
 =?us-ascii?Q?jr+Q1ijOCqo2P2qrFIpF2t/a42yiSeqVfQjw8UMYiUi+LvNpS/axTjE4hJAC?=
 =?us-ascii?Q?aJVouV+Oczyu73jj+fx9HzwS5MOYQH7O0uFuFL3hbH2RoYFfRS1t7f1FqXdD?=
 =?us-ascii?Q?W9hpDjOvNbLnjgRwG9hwHwm5UnkGl/Zy4ufSoDIAN8MFPVGcucsPanWcxExR?=
 =?us-ascii?Q?XHNATdz974iKHthz6N7FNYIQRc4qKX/oeC6ijWK1YaDRFHKbIxEvm5+K+loS?=
 =?us-ascii?Q?DKhf6ToYAWsCWlTd8FfOsngdL/logN67L6w6I93/yNNHKipNd6ouTUWor0oG?=
 =?us-ascii?Q?b5Fv2gGZIC+rWWLNcIlmHXY8Ff57A0C1fmy18wZKtta0mosjBtp3spDgwpSf?=
 =?us-ascii?Q?N0fUNtkK3/iDONnMAGCk8shCp2Jw2HHhmW/WHZ3EgAO6W36aEklnektq3Li7?=
 =?us-ascii?Q?/QG3GTopnrfEmytDr+uRnDMZqTs3zfhyNq3rKhheeqZWShDuK7dojwarJOPr?=
 =?us-ascii?Q?PpxcK/dt2/g9ypfjhQjhYFhwVa8nNs+t53ynkyyF/wM1ZBBWCOunppBjCgkW?=
 =?us-ascii?Q?t+GPmPtFMf42HSjL+8g9qAt3/gKKaJnxus9gcOTYsdvYEoWmdPIZq0PlW4Ug?=
 =?us-ascii?Q?rPPpJCjmWuoY+24cBhZerKLzVP4Zocin1dC8F8wa5YUyYCogiDKSmCDVQDe9?=
 =?us-ascii?Q?VyOH2KQJ/nD311H7LDjzjOAmCINMF2fawQOTd8vHBz1nZqIfEbHpU/FqOSZb?=
 =?us-ascii?Q?iIIcgBw/OvluxrUIhS1jnz6f25XIyWUt4zUtSWpPwtWJStqn6zKl6A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7boWKe0UBd3OOZEjo04jNB5+M5nPiIhr+8depliUmGlUolCfEFHRGPVMCM8s?=
 =?us-ascii?Q?pwypt5XALU+8crYhRDbnPiyr4QrmkfwbhkqwMVWsH30V+dhEyM8UWH5zSwwq?=
 =?us-ascii?Q?LFEyluiH/zcTLzMCSCmqufIfJbHhtYh9asnW/vbAiiXPP3eQePKNLUOeeGMe?=
 =?us-ascii?Q?mJAqshMndu4qLmP9P7XJ9O1vEAvrnW8YjNU8FCWWXa6a3ZhmHv23seFbqOjd?=
 =?us-ascii?Q?/h/OJhMHm+wrj0bmDmfJy/Efl2HqYME59CwEZNtovXyoE8wrcyWrBUBJckK+?=
 =?us-ascii?Q?kk0tOkvWaDspniNDKbNG9t/9zLRS7kgC34L/G3/+5nxjixg5LjK6zeMcJ1RE?=
 =?us-ascii?Q?fWN5P2MEVgozDWqcbEJ7LrousleYW2sXNaOknPPNrIdece1pt7YlB0e2PbTZ?=
 =?us-ascii?Q?mu1N6CYkVypSBb9pSTpx5KjfUHEEu92etLAbeSQ7e0nl+XTk87Hmw7Hix2fm?=
 =?us-ascii?Q?/fX1FNjNXq71ABinGtGZWFV8TleqMMRU8bHtf8jc+y5DmsKKMo8k8Jnfjg3p?=
 =?us-ascii?Q?M9wCQHkfFkJxdwzQLY8qUsDqkS8KX9rWkdUGI12omwWqjWvqjCwLwoEHxFct?=
 =?us-ascii?Q?AdUgfh0b/MoaoHYeVvG7Zf7XMfC/VEnkzAmYR6zTyrNF/oMB6fWErQU+0gi2?=
 =?us-ascii?Q?R2BkVWTEWewh6WkJxl8xY908PHD+rKMSunn23/ONfNG+Dv+BZr92kUbsHKMe?=
 =?us-ascii?Q?+qnA/iLeeprUs2iEGEUsYA/aVt6JC5f8VfSl+RX1uZD1X1cspsyNLnfCzCdL?=
 =?us-ascii?Q?iC4qGLClQjvTEmtL+hxeRywHY5RJsf63gcr0D47eWyJVCfKHzTLuV9ex6Rj1?=
 =?us-ascii?Q?Ii29x9Li+AFhh0EexQKubpiaPsnEOoITqr/feCPlpE3vCFcyGP0X3L/PDKv2?=
 =?us-ascii?Q?c2fi8RRQ+lIk3Nl5AWtevYRCBeguWKG3lGl8mbglkCnm7y9DqsT8SWc1DXNB?=
 =?us-ascii?Q?ur+cbzwVSrj3QCg+PQGNTOuUM1FU3GrdEoP/6J9Pu60GKkv/me9qfriKlUZx?=
 =?us-ascii?Q?GnwR31wPypRsP9DEZrI9MmaPZcKTqEt9VE/wBMYOoFg4ecmqDQxWR1FNnIMu?=
 =?us-ascii?Q?xy1oRqyHO8mRm9Rda/nnl+16fw21XQoWvS0Big/DiqxPKgcneqznZcQLCPY6?=
 =?us-ascii?Q?xO6UJEMF3h6iiWIQTIX7jUW1tWy9IBBYYNZOasgSuAaKHSe5oC442vG8DJbR?=
 =?us-ascii?Q?K6B2fUVRu3HX7sqzINDKEisL3hL4OmJFdOtCi+bVEHegWilGuHiI6tSJzE5L?=
 =?us-ascii?Q?C2oUYZ8fQmdzr7tOv2v32uKLNvqGQ/nwdw+AmO0XbPIZf/0INLym6ULY694I?=
 =?us-ascii?Q?dbG22EumNc87zrc3jWPqz5PU8JD5keXm6eCCkO0kZ7rrOiilNoD0Wqsk5yry?=
 =?us-ascii?Q?LSaQ46j9BjiIn3iXlbJBnvQb6wTCmbvh1qUKURUknTOlYTrY7w5LwffCeOmX?=
 =?us-ascii?Q?75RmHZ2fLBJ3vltRInYeycfmVyyoGKIbak7ngI9EK0xp1mWfTkfSIMAhS00I?=
 =?us-ascii?Q?jtCWraVo0B5UGrYqteSxTvz2IyuPfLyQI0GYPQnRE4obuWDqDJMnmVURjsGx?=
 =?us-ascii?Q?cEV/qjoVsLlc3wlqFAO0pkwRQc5wO6znisWWXDTB+NKrieVXsmFgWxFTx1e2?=
 =?us-ascii?Q?F3ijEja8MFAGnTrvziJz41Y=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 730d4d38-ed1b-4e8a-ed40-08de3edb03ff
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 08:45:52.0040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t7BXO2tpHMrjNQLiR1e75pIwohzTYba7JpvpDEIXpIRw9OfwuieOBOeNJ1S2JUWOXBTCgRF3PNLzn17W/7set2K9g9LQITTLxfqCpoH2qHhW8pUg2iG89ftf4nCmzchL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1066

From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>

Add bindings for Omnivision OS05B10 sensor.

Add MAINTAINERS entry for Omnivision OS05B10 binding documentation

Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../bindings/media/i2c/ovti,os05b10.yaml      | 103 ++++++++++++++++++
 MAINTAINERS                                   |   7 ++
 2 files changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
new file mode 100644
index 000000000000..b76771d81851
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,os05b10.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OS05B10 Image Sensor
+
+maintainers:
+  - Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
+
+description:
+  The OmniVision OS05B10 is a 5MP (2592x1944) color CMOS image sensor controlled
+  through an I2C-compatible SCCB bus. it outputs RAW10/RAW12 format and uses a
+  1/2.78" optical format.
+
+properties:
+  compatible:
+    const: ovti,os05b10
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XCLK clock
+
+  avdd-supply:
+    description: Analog Domain Power Supply (2.8v)
+
+  dovdd-supply:
+    description: I/O Domain Power Supply (1.8v)
+
+  dvdd-supply:
+    description: Digital Domain Power Supply (1.2v)
+
+  reset-gpios:
+    maxItems: 1
+    description: Reset Pin GPIO Control (active low)
+
+  port:
+    description: MIPI CSI-2 transmitter port
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            oneOf:
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+              - items:
+                  - const: 1
+                  - const: 2
+        required:
+          - data-lanes
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - avdd-supply
+  - dovdd-supply
+  - dvdd-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera-sensor@36 {
+            compatible = "ovti,os05b10";
+            reg = <0x36>;
+            clocks = <&os05b10_clk>;
+            reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
+
+            avdd-supply = <&os05b10_avdd_2v8>;
+            dvdd-supply = <&os05b10_dvdd_1v2>;
+            dovdd-supply = <&os05b10_dovdd_1v8>;
+
+            port {
+                cam_out: endpoint {
+                    remote-endpoint = <&mipi_in_cam>;
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <600000000>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 663e86eb9ff1..c85915d5d20e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19234,6 +19234,13 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
 F:	drivers/media/i2c/og0ve1b.c

+OMNIVISION OS05B10 SENSOR DRIVER
+M:	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
+M:	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
+
 OMNIVISION OV01A10 SENSOR DRIVER
 M:	Bingbu Cao <bingbu.cao@intel.com>
 L:	linux-media@vger.kernel.org
--
2.34.1


