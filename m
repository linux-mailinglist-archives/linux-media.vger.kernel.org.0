Return-Path: <linux-media+bounces-27059-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C395CA46483
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 16:25:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78BCC3B35AB
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 15:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 580EC2253BD;
	Wed, 26 Feb 2025 15:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="jx63RnqJ"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011058.outbound.protection.outlook.com [40.107.74.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30AE21D3E7;
	Wed, 26 Feb 2025 15:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740583514; cv=fail; b=SaCj0vlHzYLrpTU9Aas7zPhQJWQ2+ti5Rb2tSUR5zNS+eI1ggBo98b/Yen2IlwS6Vd6zTXPt4edHY7PCsMcsoMMiSHQxym9nqcx/bfeY+rZKRr72NhP2o3ddLwx/BJ39EvXa3mZadAHlivsAdSMdBZLsrn1+81vfE8PZyw1/vKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740583514; c=relaxed/simple;
	bh=7I2uPy2WOC43lR2eM2+dr+4Cz9Ff29Y4JQSbEsargKw=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Y4JrlDZILcOsJAYlLmwXnkGDqU+aapzsM5wln0zArk9Zj76la7T+BBEv93eeQulLaKETInjvjbxEjgbgwm/BjyYir2zMBDX66+tmLMx7DqpcNTR0kc4LoJ9bUKkTrEg9S0p04mE29gwXOuxapN5m26yaeM7XhHKgTNLCK38X+pk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=jx63RnqJ; arc=fail smtp.client-ip=40.107.74.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i7J6oX3wKUAa6cuW/cVY4b+Rbqh1nHDYe9VG+gOjMXTPY2weccAIBrXAtnQgrtmkCwm8BdVQUwkcJf6uJ5IhLaD1xyWIpiaRRlNZFqV0HRmGUNVmpGtDblUv8q+TziKGub7l9HlMgB66kc1lnpW/TP4FUWdRtFl+B9ThgUkTU2tLLb5uOS1nJpf/qEe8uopWVqDvdMZ0KxNoYkwT97J+ROFMdnwDLHPozXw9nYddV8NkcV1L8wADmEyMiPevLavTncPUaRzfeEu/10iNQoMXoePbvTHNfWNvQvOLwLx85tGQQYVXTSNmJ8378jAuzPYsJIYMrUEHasTMVLQUNeGvhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mCV3402AoDzGV36eNgfgWlNFpkxr1MyIKbxGYXJ9vl0=;
 b=i8KD+YkhGIxs8PkOThUACDgCAd35VSrtQ7yDootsenJttXv0RCjBU8DmTlNmWJ/UTtx5s20XtIj+0LKSO+XYcvPVou8dq1ShoqlXTwZl7d+wJS4cSR4DCL2NXddXLk4FOJcuA5t/ANiDe9q9OH8U7plrC3jnQnAJOqM5OabT2RvfHqHb+5z/LBBjke0stkuG1b1BuMarzhVm0OppNI4WFUICNmogVQSBikef+jBDsNsmB5tOST0F+TkE//qcIzQJZJHYvg4eUaZgU//1x9L5TA210HLRGvk78r+PzEvw9LdyWNaaPqE+u4hhfC2XLRjV333J33t/G4TdtQMgvImNoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mCV3402AoDzGV36eNgfgWlNFpkxr1MyIKbxGYXJ9vl0=;
 b=jx63RnqJl0A+WvDnpjFICcNlm1tJC2ccjbMpTFlGcKyeKpi66WMUPlhZJpZQ1XHIFBqIGgHR8k2fUCblwRoaAFYSsazN6u9YlmHKnk3oYBZkTT5FZoFCkVwU5zvkaHEIn+Y6IDz8ty9K8kXzrOrGiXk1KuehbzAIIGOvgCZUr08=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB10248.jpnprd01.prod.outlook.com (2603:1096:604:1e4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.22; Wed, 26 Feb
 2025 15:25:07 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 15:25:07 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 00/17] media: rzg2l-cru: Add support for RZ/G3E (CSI2, CRU)
Date: Wed, 26 Feb 2025 16:23:24 +0100
Message-ID: <20250226152418.1132337-1-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::13) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS3PR01MB10248:EE_
X-MS-Office365-Filtering-Correlation-Id: 15cab83b-c796-427d-32fa-08dd5679c002
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nOGiuKFqWnU4tRP92RA+6Ip1DqNhfMc2j1fxi/0HCQYgwMd/21afJi31Sv2S?=
 =?us-ascii?Q?cFkLzTapvN8U/BlgTD5bhSDXluzW5S4LeoOy7fdMJ8TOC5wf1qxmxjPjMTMv?=
 =?us-ascii?Q?r2RtBWr+lkDfPcLD66lGPjUN8irlR0a+JbMVlWz5JWHJTfbpIsLpjzoG2BO8?=
 =?us-ascii?Q?FAblPNZRRWky1mq5QEE79LDorHpuxx7GUXvBybe1vu42OA/CzgK+VKX8B5TN?=
 =?us-ascii?Q?8YUuIfk4XPCfi2APcxUvHtrzCNSPi9RT6hA4lvWmx8Z0mkglY4DK/sfJHo+Y?=
 =?us-ascii?Q?I82MJ8QXbXnt2zqw26uEDOviWnG6ewQNrLW6RCVy2rj+Pibs0B+DDXugdmwu?=
 =?us-ascii?Q?VEykZ7Qo8sHp+zXwcD71AtRVcgE+rfiVe8+G85ssVQrlUkPbwNg6crnvhtKZ?=
 =?us-ascii?Q?Ybrg0gjcbSZet7bLtFDDchHooghc6fk2tu7jCrddEeAow3DqyMifXnE9zuWc?=
 =?us-ascii?Q?SidFxCi7aMMedc3rckv1dNOfllcxx6CEZw+y6RSCaRLm43AA4lI9/F2TfXPv?=
 =?us-ascii?Q?FJHevqcJMwTSUa1QbqmzQRpT0AGfAykeMeAJWJYCTj6uFz1XiZudd5dposCp?=
 =?us-ascii?Q?ooeUIfFVP9xhcQiwGGu/3ZjL9V9vrxBedBP4jOSvqSF8kmutgTN0vva/ZgNX?=
 =?us-ascii?Q?rQOGF3Y4koenxuB8Yyo9YWz4idzop19W/+8PnWIx2H6K1KCCNUcS9s8r/BNb?=
 =?us-ascii?Q?TY5UvdRQVet3x9021BQCvUyiI9zAsOlDShNKuqnbWiZoju/edWUJlSrQK5Jn?=
 =?us-ascii?Q?QE6V1c0JzM5xLhgzNGKF+vyEZpX3YQ8lp4TCdwDkz0pZBSs5D6BuM7bWw8ya?=
 =?us-ascii?Q?nGSiJkJR+KggIGovPY+inKFzcX+mix9Kdshs4dnZgldugI9z9ZakWPmBe8PN?=
 =?us-ascii?Q?DIlCr7VHFqWzEz4idbM5tVNvTIpqy01SPWZPQpT6xA28E49EfImP7pc9Eu1B?=
 =?us-ascii?Q?LHrtH2pJxh6cLXRRDWLliyMADZvFymQ09+81gH1HlBMj5vMwZzn1eG34aZFb?=
 =?us-ascii?Q?Rrmt0bsLpB7zhYfiUDiCddOIJvPkOc3BE/XSK6oYgyiRTqTLvWApmmjyESNe?=
 =?us-ascii?Q?eajz/Plww5E/Ej84YMzUK3CtfmctmXwC56/8+rMgQOML0kTGLdUz9OrZtjSP?=
 =?us-ascii?Q?NNE32vGUn9X5lussVF75vkvYE7ewDF13dRFoCa2+CTmfcrx0VgzUoBSTiOqQ?=
 =?us-ascii?Q?9ibiIB14pYwKa0FMGti6S9iLSqpc1IuRR3bPoVu7VlIG2MXACxVwUmw8gX94?=
 =?us-ascii?Q?yU7zI+pi2EL8dsQWY2oZEbKfv6R8bA4DONlMihEJ9PPdwID+WLJb3LpGFB8j?=
 =?us-ascii?Q?gPBg1DmoPoiKHUt3ueq5xHKxl2BuvmyOVARlacm6aL9SCqtSndYApDMZQOmB?=
 =?us-ascii?Q?55K9r/O38DFYh13ieHlnRXg2DMFYockc9G4q3TPXeEf1lR+vkZzJFJ08YKzu?=
 =?us-ascii?Q?IdnGo/yXUMCsAbwlSXpTvQdQbYHrLKaa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lRawCl4lnL6WEm1Jx1Rz1eKGvUK8aDnL4SRKeAfq+g2X6Qnr7YEoB94tOE9L?=
 =?us-ascii?Q?Jo2jaSQZWMDB2MzgBIqqZTdOuiQeVCcAPcK6B74NoXlQ1MTZWNgX99Tocfrv?=
 =?us-ascii?Q?WsI8JT9wd3B+SUAhdwBt9LBdOg7G6Hao2AGWmK1+REhawTE1kT9D072Gtm37?=
 =?us-ascii?Q?x0AW+1F5HF576rVMLUxvXcV+rVdRU2Zu50gpjNknS86E3tIf1NS8Qb8Y9Kwt?=
 =?us-ascii?Q?d5u5eVwf3aBF+MyrflS70ktn50oNtKr3HnmPXYD17C6O+B89iAKMzw8DowUp?=
 =?us-ascii?Q?+u26e6KprvqpeiXem2Jzv5HCLW32X5nYboG/1q4LeYjarmDTeP8DxbWcCTTH?=
 =?us-ascii?Q?Sh3NAz7aJtKVcfzo6nHyqQImaGmT/xEFI8kGkTAijk7vKU6BVCTwDECX4ZxN?=
 =?us-ascii?Q?E/1+mkSkcEw7gBbsTkqlx+rkoKuduhU+NJGK5rHaBRAX6HCWVHzKcm/NT8H+?=
 =?us-ascii?Q?BcmaPKnB2lJY2uw7CXtTuM/D/evJYRAgPduqfhhn3mOXAIYzkEnDCxF62M0k?=
 =?us-ascii?Q?JkmWwdeGUdHKgsX9aTUY7B6FsEt9mWwyBW1OB8e7xrPM9nzao0s4xL/5sCMq?=
 =?us-ascii?Q?IL9lC/DPsOKdxxxZIXop7VNleNDQDzbYo/KUfwQF7qLGuQDZEOQlV6u6GcLp?=
 =?us-ascii?Q?TBOcyjreypTxTAJ6xQq46l5yDxZ7WCYkhKy6lCnDPnyxnw3f2JUxdGZnH8Xr?=
 =?us-ascii?Q?2gXbiu6ROKBaOaxB/HrYK1iehd35M46C5FcJIspVCxXGorZ7gRiAr2/y6zzd?=
 =?us-ascii?Q?NjY9UBzLDY9XV8Fb5iyLK0YlWb34hjNACvezTK2iTLcY1Rx8RuKZ7q0/c8D9?=
 =?us-ascii?Q?R/D4nTGWoi/zAejYH0sOQyiq1OhzfBqF7hcUpR0nQ2K9uU8yOW4XYC2Eep/i?=
 =?us-ascii?Q?TK1Kr997ZBhHYrEqg54gRZxuDeNrImTibiApo/Ys5rMLfjgG2BCgOVFueaca?=
 =?us-ascii?Q?i/ieI7l775bZEhvHVPMm7f164nMoyFHAj2ddxqSNG7e0PCxhNnBJgXi2yJX/?=
 =?us-ascii?Q?iRE5kwUxzOOCaOJd8KKE+aXkr8vcF+iiIJXARh+PIEBbomDN21zfrSm5CT2h?=
 =?us-ascii?Q?nmNFpec8v0XFbMRnPFIJsBRjzFnaYGdo0I+hl4bxaEjxK22HzELwtj7HBYAC?=
 =?us-ascii?Q?OSCv9sj6fWWwfHFN+GSge75EFAA7X7hMxfG7MF7VB0E6OQVpMQsClsVPcxGQ?=
 =?us-ascii?Q?itPealbRuN6eLPOg60NrdZcebjEZmaYV8IXhJLI1nsoQLFHdoHsLOb6JReu5?=
 =?us-ascii?Q?h0aufclnpqkjry3FOnceLwLJNZnLN2ksta2wM1erD9YxHc9ZewtAkzY8XiAZ?=
 =?us-ascii?Q?b0nEU3LmQcjwt6CmLnzf+h8+vaQH/mEFjaLEWFYCFjmfF67pbnXFy0vwmC4q?=
 =?us-ascii?Q?Yx601YQsiCbN+xDn9oW/fxV3Jry5W1CEUY7iU1MjZnOzQWXZ4Kpgz1Ot9LSv?=
 =?us-ascii?Q?wpokgnrAQvOCNSBUXFVCN5vINfxSBVz4ij/MhSVaJT6Lb3yYxpWm+0pugBMe?=
 =?us-ascii?Q?N1t/eo+hK4q9QDJKgfQLTN0StTkbTV/IaJkusTWzvj/jc+y5sTU2eCr59BO9?=
 =?us-ascii?Q?JeKSkydUk7GYfd68imZNXTItB5v3Fghz7MwT+Vd44D7KGEMAlteU4TY/5JjG?=
 =?us-ascii?Q?KNZMbYE8cvyfHkTAyBtM9vA=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15cab83b-c796-427d-32fa-08dd5679c002
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 15:25:07.0814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u/dXFULV3QIaViy/kRiYKCWuWZiWlPLlPQyK1735TSsjdtfMZa8XKO+WDff9xJ6s5rmJmDdlYhY1tYaCLONYtkOpa5uMEriCxqP25B/TG6mW1BsvibQs96NUSNveGk8m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10248

Dear All,

In preparation of supporting the CRU/CSI2 IPs found into the Renesas RZ/G3E
SoC, this series adds driver/dt-bindings support.
This adds also some minor fixes into rzg2l-csi2 and rzg2l-core drivers.

The series was tested in an out of tree branch with the following hw pipeline:

ov5645 image sensor (Coral Camera) -> rzg3e CSI2 -> rzg3e CRU
imx219 image sensor (Pi PiNoir Camera Module V2.1) -> rzg3e CSI2 -> rzg3e CRU

base commit: 0226d0ce98a4 (tag: next-20250225, linux-next/master)

------
Some logs:

root@smarc-rzg3e:~# media-ctl -p
Media controller API version 6.14.0

Media device information
------------------------
driver          rzg2l_cru
model           renesas,r9a09g047-cru
serial
bus info        platform:16000000.video
hw revision     0x0
driver version  6.14.0

Device topology
- entity 1: csi-16000400.csi2 (2 pads, 2 links, 0 routes)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev0
        pad0: Sink
                [stream:0 fmt:UYVY8_1X16/320x240 field:none colorspace:srgb]
                <- "ov5645 0-003c":0 [ENABLED,IMMUTABLE]
        pad1: Source
                [stream:0 fmt:UYVY8_1X16/320x240 field:none colorspace:srgb]
                -> "cru-ip-16000000.video":0 [ENABLED,IMMUTABLE]

- entity 4: ov5645 0-003c (1 pad, 1 link, 0 routes)
            type V4L2 subdev subtype Sensor flags 0
            device node name /dev/v4l-subdev1
        pad0: Source
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:srgb
                 crop:(0,0)/1920x1080]
                -> "csi-16000400.csi2":0 [ENABLED,IMMUTABLE]

- entity 8: cru-ip-16000000.video (2 pads, 2 links, 0 routes)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev2
        pad0: Sink
                [stream:0 fmt:UYVY8_1X16/320x240 field:none colorspace:srgb]
                <- "csi-16000400.csi2":1 [ENABLED,IMMUTABLE]
        pad1: Source
                [stream:0 fmt:UYVY8_1X16/320x240 field:none colorspace:srgb]
                -> "CRU output":0 [ENABLED,IMMUTABLE]

- entity 17: CRU output (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video0
        pad0: Sink
                <- "cru-ip-16000000.video":1 [ENABLED,IMMUTABLE]

root@smarc-rzg3e:~# v4l2-compliance -d /dev/v4l-subdev0
v4l2-compliance 1.26.1-5142, 64 bits, 64-bit time_t
v4l2-compliance SHA: 4aee01a02792 2023-12-12 21:40:38

Compliance test for device /dev/v4l-subdev0:

Driver Info:
        Driver version   : 6.14.0
        Capabil[  101.574758] csi-16000400.csi2: =================  START STATUS  =================
ities     : 0x00[  101.583166] csi-16000400.csi2: ==================  END STATUS  ==================
000000

Required ioctls:
        test VIDIOC_SUDBEV_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev0 open: OK
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
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
        test VIDIOC_QUERYCTRL: OK (Not Supported)
        test VIDIOC_G/S_CTRL: OK (Not Supported)
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 0 Private Controls: 0

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

Total for device /dev/v4l-subdev0: 44, Succeeded: 44, Failed: 0, Warnings: 0

root@smarc-rzg3e:~# v4l2-compliance -d /dev/v4l-subdev1
v4l2-compliance 1.26.1-5142, 64 [  125.542264] ov5645 0-003c: =================  START STATUS  =================
bits, 64-bit tim[  125.550585] ov5645 0-003c: ==================  END STATUS  ==================
e_t
v4l2-compliance SHA: 4aee01a02792 2023-12-12 21:40:38

Compliance test for device /dev/v4l-subdev1:

Driver Info:
        Driver version   : 6.14.0
        Capabilities     : 0x00000000

Required ioctls:
        test VIDIOC_SUDBEV_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev1 open: OK
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
        Standard Controls: 12 Private Controls: 0

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

Total for device /dev/v4l-subdev1: 44, Succeeded: 44, Failed: 0, Warnings: 0

root@smarc-rzg3e:~# v4l2-compliance -d /dev/v4l-subdev2
v4l2-compliance 1.26.1-5142, 64 [  139.054132] cru-ip-16000000.video: =================  START STATUS  =================
bits, 64-bit tim[  139.062922] cru-ip-16000000.video: ==================  END STATUS  ==================
e_t
v4l2-compliance SHA: 4aee01a02792 2023-12-12 21:40:38

Compliance test for rzg2l_cru device /dev/v4l-subdev2:

Driver Info:
        Driver version   : 6.14.0
        Capabilities     : 0x00000000
Media Driver Info:
        Driver name      : rzg2l_cru
        Model            : renesas,r9a09g047-cru
        Serial           :
        Bus info         : platform:16000000.video
        Media version    : 6.14.0
        Hardware revision: 0x00000000 (0)
        Driver version   : 6.14.0
Interface Info:
        ID               : 0x0300000f
        Type             : V4L Sub-Device
Entity Info:
        ID               : 0x00000008 (8)
        Name             : cru-ip-16000000.video
        Function         : Video Pixel Formatter
        Pad 0x01000009   : 0: Sink, Must Connect
          Link 0x02000015: from remote pad 0x1000003 of entity 'csi-16000400.csi2' (Video Interface Bridge): Data, Enabled, Immutable
        Pad 0x0100000a   : 1: Source, Must Connect
          Link 0x02000017: to remote pad 0x1000012 of entity 'CRU output' (V4L2 I/O): Data, Enabled, Immutable

Required ioctls:
        test MC information (see 'Media Driver Info' above): OK
        test VIDIOC_SUDBEV_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev2 open: OK
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

Sub-Device ioctls (Sink Pad 0):
        Try Stream 0
        test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
        test Try VIDIOC_SUBDEV_G/S_FMT: OK
        test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
        Active Stream 0
        test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
        test Active VIDIOC_SUBDEV_G/S_FMT: OK
        test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
        test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 1):
        Try Stream 0
        test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
        test Try VIDIOC_SUBDEV_G/S_FMT: OK
        test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
        Active Stream 0
        test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
        test Active VIDIOC_SUBDEV_G/S_FMT: OK
        test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
        test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
        test VIDIOC_QUERYCTRL: OK (Not Supported)
        test VIDIOC_G/S_CTRL: OK (Not Supported)
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 0 Private Controls: 0

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

Total for rzg2l_cru device /dev/v4l-subdev2: 59, Succeeded: 59, Failed: 0, Warnings: 0

Thanks & Regards,
Tommaso

Lad Prabhakar (12):
  media: dt-bindings: renesas,rzg2l-csi2: Document Renesas RZ/V2H(P) SoC
  media: rzg2l-cru: csi2: Use local variable for struct device in
    rzg2l_csi2_probe()
  media: rzg2l-cru: rzg2l-core: Use local variable for struct device in
    rzg2l_cru_probe()
  media: rzg2l-cru: csi2: Introduce SoC-specific D-PHY handling
  media: rzg2l-cru: csi2: Add support for RZ/V2H(P) SoC
  media: rzg2l-cru: Add register mapping support
  media: rzg2l-cru: Pass resolution limits via OF data
  media: rzg2l-cru: Add image_conv offset to OF data
  media: rzg2l-cru: Add IRQ handler to OF data
  media: rzg2l-cru: Add function pointer to check if FIFO is empty
  media: rzg2l-cru: Add function pointer to configure CSI
  media: rzg2l-cru: Add support for RZ/G3E SoC

Tommaso Merciai (5):
  media: dt-bindings: renesas,rzg2l-csi2: Document Renesas RZ/G3E CSI-2
    block
  media: dt-bindings: renesas,rzg2l-cru: Document Renesas RZ/G3E SoC
  media: rzg2l-cru: csi2: Use devm_pm_runtime_enable()
  media: rzg2l-cru: rzg2l-core: Use devm_pm_runtime_enable()
  media: rzg2l-cru: csi2: Skip system clock for RZ/V2H(P) SoC

 .../bindings/media/renesas,rzg2l-cru.yaml     |  65 +++-
 .../bindings/media/renesas,rzg2l-csi2.yaml    |  65 +++-
 .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 148 ++++++++-
 .../renesas/rzg2l-cru/rzg2l-cru-regs.h        |  91 ++++--
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  39 ++-
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 165 ++++++++--
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     |  13 +-
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 298 ++++++++++++++++--
 8 files changed, 751 insertions(+), 133 deletions(-)

-- 
2.43.0


