Return-Path: <linux-media+bounces-20553-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C689B5A10
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 03:44:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3636C1F24164
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 02:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E95419923C;
	Wed, 30 Oct 2024 02:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="c74/vL2T"
X-Original-To: linux-media@vger.Kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2084.outbound.protection.outlook.com [40.107.21.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39781991AE
	for <linux-media@vger.Kernel.org>; Wed, 30 Oct 2024 02:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730256267; cv=fail; b=BOM+Acpc76rotqk7mqioARZ7HravYCxIgXdJIpThRHRsgnlwQ+uso4DJOIIIJaTEgV/y2xcA2cufaRZcCXIWBVpq6sXXK+M2fXRD53yBtbwhtonp0mfFGeS7zlds0uO04Y/7Fr02AkpWTRWKoCvd8ms+8hsmXtReN2BwOQ/Ry+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730256267; c=relaxed/simple;
	bh=Rwln1HEyBNWvq1CS0srpuVZ/7dvqmRRGR41ArEIL9ZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tvjeB+OzGnfAGSUS9ShHI1tAaUw+mB3foH9fts52lZ2xQrYEOc5H5v2MqXh3aWD7tR3gh31OnGoBrtDIwn+MVPtYpHbOyywg+jnvyoCUyI8YyogOmMyTXzjWoALLzLFW2G5NlLUhn42gkLT/GC7s/xkiaL7w4/f7lgHL/Vri63k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=c74/vL2T; arc=fail smtp.client-ip=40.107.21.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l6rPQlV4YncgMdTAJV8zuf9hxE7x32ABo+iopXVgRdrjL9NoYR9fOAP4tjDxS5GgKitVir7gPgNzJRzebPTbEJz+UENfWCGQgdzb2xOsKR4RD2vRlhl9D0b26pKlr1SzMdNKxTYOpFk7OU8hGtfhInNoqa6bM2l28CNVOnrC708uJ4qbl27WcSmy+fG7aQqJm+LcKfi9e4k6q0zc78mCRJhHD+v0o+s6cSJNK4Z4N/tBAKSNOPitflRo7ibDCS2aCLozYTwZDrODzfkdkcUY2QIAgCDFZAYd/7rxzEI9JPXkowDEQac/OX5BHcEB2FsL17ewsuZYLj3GjdZuMou6tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jv6y5GQDvDTJGcfnEvAvkb8bjRoxPGRDy+KtEsu9/n4=;
 b=Q23dXa3/1BDcvOJCaPn1BiMhd/xeUSzvhQF1cmRdR50vXDjkYkI0g4Tt6P+nGWJ6jxvgEFjWokSKi7wyYGh8aNmuIRO+BfH4uHBPDwQDgDXj35hjjnWFPbT1v11UNJETdfj9Td3bUPz256sD4YbAIunag67l8BHJOf+QkYQ4dn4x0xGXk1AFGEhNCDqbFLOSOZN7SjqhO/M7dcQw0F6HQUyHh8jPmwfdqDGEM/CJLJ7UISeuREhwhxFXWK/molVMYB5ZVPYrRAhJAcw/OxDorXOsu07SAHesvi3YoGGq4ZhvdaV0uDco9+vPd1/atDqAzU+JZtDXaL0EPZ2RlYdGdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jv6y5GQDvDTJGcfnEvAvkb8bjRoxPGRDy+KtEsu9/n4=;
 b=c74/vL2TijjfON+IdDofeU9EK1Js8uxWpjC121trQWoHFtSXgLz0i0i/BSXRyYSAyOmeiDIPBePTpQuU6qwOJC9UvN2mWDfmlXOp0AkiTYGesE/sEzQLuPkPfdBli7GCcgZiU+CYivbmej1Ts1iI3IfXTuvPZIUfg231FALhWk6Zv3AgaXxzngpu6VsXcFh8WugJD8Er5ORZ8nGLwuHBBwTlBrpPdSQXSqw8y49sgax5M7CppSQ/FhkoM49bvjmKE0OGt7PSGSZzQ6KRP+X6Lfp3B/1veVTIHgXE20xNcby/WYKy5a/3EWeARHPRhrWsopAQlWDuvuNsSkSH/G5DUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by GVXPR04MB10729.eurprd04.prod.outlook.com (2603:10a6:150:226::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 02:44:22 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%3]) with mapi id 15.20.8093.027; Wed, 30 Oct 2024
 02:44:22 +0000
From: ming.qian@oss.nxp.com
To: linux-media@vger.Kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: laurent.pinchart@ideasonboard.com,
	tfiga@chromium.org,
	ribalda@chromium.org,
	yunkec@google.com,
	xiahong.bao@nxp.com,
	ming.zhou@nxp.com,
	eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com,
	ming.qian@nxp.com
Subject: [PATCH v2 2/3] v4l2-ctl: Support V4L2_CTRL_TYPE_RECT
Date: Wed, 30 Oct 2024 11:43:06 +0900
Message-ID: <20241030024307.1114787-3-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
In-Reply-To: <20241030024307.1114787-1-ming.qian@oss.nxp.com>
References: <20241030024307.1114787-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0172.apcprd04.prod.outlook.com (2603:1096:4::34)
 To PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|GVXPR04MB10729:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f3116fe-e9c0-47fb-a36b-08dcf88cc25f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?x9uMiTWnUPnL/Vln+R1HfTINbTsh6EBi0MJ7QLDiabwejPyYYwokvx8QTSa+?=
 =?us-ascii?Q?+uREhr6bkwd8M9/lkLHQ9DcO4ctjV8AM90g9LyvoLzPv7L690Opgp/2sVp7z?=
 =?us-ascii?Q?ShW92B2RJUiM8soj/pVvN8JnTNZKPsp7uvk2iPdqhrMgsvhKYtnAUYJO3JvM?=
 =?us-ascii?Q?JZ7y0xWVfHQxTohFgZYqRtJQBEZD+fE+vlUfDnC2nbqfMkYfN16GcZRAC81h?=
 =?us-ascii?Q?Y8a+Bt86mV+fvXwiHl4Lz+RzSDoMBcysrRTVDuZKVhYu1JvWUZWBj9M0/pWv?=
 =?us-ascii?Q?F7ztt5s5195ez6E1dhRSyMXk427hGkGRtT+LSnkAdY3/C2zdObSANt9zctzF?=
 =?us-ascii?Q?7OYjUVitGdQoXDXP7S3B+2CSBFt5CnH/CdQ2ZNAgNRjPWacNJjTE3aCjcoiM?=
 =?us-ascii?Q?uhbB6pXSWLZAPeTOgx2RFJCkbwECL5ZDgl0o7RttOZLQGHM5hEDr3tpUuzGP?=
 =?us-ascii?Q?QfjEUGJUprZeALZ3db1TxNg/WceDmLjjwN4+8BpDQPZQCaNkjhAZbTKeJ2bX?=
 =?us-ascii?Q?Q3bgFqdIRElMdNmCkcBEo0iUrLBW83IDKXzTk4E7uxl8bSKC19ITbdCAW/v4?=
 =?us-ascii?Q?LjvGSMynLO1DRwFY7LwssbRIL9RuZofTX3RETC9vo8K7NwhVPc0WBzmQeaI9?=
 =?us-ascii?Q?h6cnl2yY8NFLBTpD5qfiEkyODS4of0i3WxSUUbrM+PuNDhBta+8Aeauy66Bh?=
 =?us-ascii?Q?xYVY5wPYPiMuFbunthDq1zMP13SIS1m0kczf6wV2n+HffzTp5qHFFU5Fiwu2?=
 =?us-ascii?Q?76aUZj3LHnK2QSNZ3OY4O/DPDrbCkb8AvnpTKWV9008jJcP/7yFHhCRgHNzC?=
 =?us-ascii?Q?9Qcn4k7oslJ6Rw1KHfCeA/JRAUNTgvZIvQ/4XlxaRZJrDz/N9uxUGP/4o8h9?=
 =?us-ascii?Q?rrHt4ovgNrXkrGg6Wy/NJbRnQ1z5HOBCPcc6DlMJnubPk2BS9jlPQqNYxir7?=
 =?us-ascii?Q?nHKpq1U4XIuCH761TAXS+gS3m2PZdnm8EK74M0z0onhDyCLcESbCySkzVnwa?=
 =?us-ascii?Q?uOaVMcsg07sgip/fwy61LUDLfn1VRK8SANbC5Lp/yxAP28/mIMx6GAa3W8kC?=
 =?us-ascii?Q?+/9lv/nWk+NwOlPDFOgdGcZzavW8/70V9gxuaFQHKmq2NgkJqRLlTY3jvyHh?=
 =?us-ascii?Q?InyQEkh7ofetxNpJ7UOW2rYCxcSMLQDu8K2dtXySX7L05q/AmvmHxgLTHe5a?=
 =?us-ascii?Q?Tatvbb7CZukvk1njRiO/ssIOfNORyewA1fQNQybOB7lHoJrKa7lYNU196etx?=
 =?us-ascii?Q?L3Cs0IOI5kG2THIyYDp5p80xnqGLtSRa5Nn+3IUkaj//AOHRvsp+IjfVXLwq?=
 =?us-ascii?Q?yUOgIHIJX7vyj4o+u18m8TfVBzuZmUCXjh/H5a+cLRPsD8/Vw9bgTSvj1M8o?=
 =?us-ascii?Q?UynFbqA=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?ffwY+pXaClL6J3nDKb5bDY+SpVyBb4loDDSHg/l1PjmzrPLRIh6+shxRx1UL?=
 =?us-ascii?Q?TDTyM/SSMYzo8YioNjDpNN6sb+kx0vRGgBOETokqS6qJQw2qKAU+mMHk+Ov8?=
 =?us-ascii?Q?K7HpzrUU9KbIt+iDca7gWcp9ajwMJY1t338Mhyw5GTDlzuy63r9L1XR2HLXj?=
 =?us-ascii?Q?bh99n82N3YMR+Yyx2LWYNyi9f2WoPCj6tgk6p1Kyx+GDwC0m/B9T5axH1LBu?=
 =?us-ascii?Q?0yESRxVjhLSoNKhLQfYzv9anAd9c6GqUSAIgVNhoYNqUVicyDk8mksuN8RQO?=
 =?us-ascii?Q?1T3O6TOCceJdHaExI3CzkwWncX4a7mxdVOEboJ2ANk/qOFS8FB6JzS0zB1+L?=
 =?us-ascii?Q?/nmNfyUVC/bULqTyP57ROWlVtQZsSv2tNppeQVayMBuWVnWb4YmZRV13zizE?=
 =?us-ascii?Q?EwKBQEizlA9V+yPxeSAlOddjz1RykXdGZaeoPNh3D5vjnzM5pifGxOuS7l9b?=
 =?us-ascii?Q?fQ6E9lI8j/7uOuFYlX2F7b9RTXsgeW+aInBEBSqNNJxStoX0V1UvxuO5NkJQ?=
 =?us-ascii?Q?LEbqTfgPnL2sQ25X/WhuHXxK3BUUdkUoGXxOYXoWw771USySQat3sYLLeRTN?=
 =?us-ascii?Q?Y0T8g8kuYfi7IaJI2kG4Htig71peXXQN41on9E5lMb/2BvV8djXjn65BbpUS?=
 =?us-ascii?Q?+7+13f3EAQKPLsJOe4cJlv6cF8rQqvHDfbn0ATVaOXodT8Ge2mmecFdUVSYB?=
 =?us-ascii?Q?0hgyy6pHYjD5F47XCByOwHKz9TVoCtIcJLTpLtKjOOxsM/s969iIuIG95NrW?=
 =?us-ascii?Q?3yOC5pu4/rgDYBJItbbdIMhsxF+0Egff0bukz0K+5UfXwP2rqGmE8f5bNNDp?=
 =?us-ascii?Q?YKm1/Jqoj1c1NeiJ51f0FdYUvJMQg2fQ9X2QNglvGJoxhnNHN7dQ69YkJUQk?=
 =?us-ascii?Q?Ix20hnD7WgoqUMh6HG43b9cqhpz4E/dnqUcIoRW5fQWC6qgoRgPr4FOC6V54?=
 =?us-ascii?Q?0wYA61RFASLiZnSdUI0iAhYsyPln4PJg/cvjBdlQVcb/0/lvpGKHxJ7YoDni?=
 =?us-ascii?Q?VBfzfeXI+c7LoK7/adxcokLagpfiih2kXfTwgqPSBcDcRL5AssZcSwS7jVZw?=
 =?us-ascii?Q?E3lK8a91ByMK6Dqhp814PE/TlnjQjQ0vcmzSbPr49VtgzOlb3fvhxMw+8+Wo?=
 =?us-ascii?Q?ynv9fRbocmndPIGcCN9tDxj/AMGur+pje7OlRPJCoMwSuJGMtnaGVJmwVxlN?=
 =?us-ascii?Q?Ck2w4vVetldljPm4IXs8FnVwcU/tfhglBoQVu2nM2X9AZzb3rQgx/WRlPDSp?=
 =?us-ascii?Q?icl5O1IsPr/UCXeSanzm36PtFK6N+mXQvr+l3PdTOGmZRyoTVozpNTQUjcVE?=
 =?us-ascii?Q?jDv+fsRvimzwQaHIORuStpfjHJ7wVyki1e+rlLdYMLQm0ZRBNJGtjaJPFY45?=
 =?us-ascii?Q?rq7Joe9ho7bM6ymws8vyKHqYoiBe4A70pZU9Xv3gXJTijtpwoxTyX0nzWvbp?=
 =?us-ascii?Q?QhsEsA+W0x56JmLZqAXuVejcbhwF5yZlyVa54O8mIXPjRQ2cXjYOuYSkfNVk?=
 =?us-ascii?Q?2qlt08JSpUtiAKlUEPtQMF314EFgv1EkVjEHaRFLgJq7+TwXSyppYv+7v8B5?=
 =?us-ascii?Q?wuyniEB5c1uLFZcc0GXNPIlmRvKC+Mqw/7TPVdqU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f3116fe-e9c0-47fb-a36b-08dcf88cc25f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 02:44:22.1695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: loUpigqeekJnqqo7a/Uf3exZyofyoYXVIcNJHW30AE6qVuVaXS0fdmJsI0KvPanS6aSeUnAtB4A89z+F6ffOKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10729

From: Yunke Cao <yunkec@google.com>

Tested with VIVID

 ./v4l2-ctl -C rect -d 0
rect: 300x400@200x100

 ./v4l2-ctl -c rect=1000x2000@0x0
 ./v4l2-ctl -C rect -d 0
rect: 1000x2000@0x0

Signed-off-by: Yunke Cao <yunkec@google.com>
Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 utils/v4l2-ctl/v4l2-ctl-common.cpp | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
index 40667575fcc7..538e1951cf81 100644
--- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
@@ -614,6 +614,10 @@ static void print_value(int fd, const v4l2_query_ext_ctrl &qc, const v4l2_ext_co
 		case V4L2_CTRL_TYPE_AREA:
 			printf("%dx%d", ctrl.p_area->width, ctrl.p_area->height);
 			break;
+		case V4L2_CTRL_TYPE_RECT:
+			printf("%ux%u@%dx%d", ctrl.p_rect->width, ctrl.p_rect->height,
+			       ctrl.p_rect->left, ctrl.p_rect->top);
+			break;
 		default:
 			printf("unsupported payload type");
 			break;
@@ -702,6 +706,9 @@ static void print_qctrl(int fd, const v4l2_query_ext_ctrl &qc,
 	case V4L2_CTRL_TYPE_AREA:
 		printf("%31s %#8.8x (area)   :", s.c_str(), qc.id);
 		break;
+	case V4L2_CTRL_TYPE_RECT:
+		printf("%31s %#8.8x (rect)   :", s.c_str(), qc.id);
+		break;
 	case V4L2_CTRL_TYPE_HDR10_CLL_INFO:
 		printf("%31s %#8.8x (hdr10-cll-info):", s.c_str(), qc.id);
 		break;
@@ -1279,6 +1286,11 @@ void common_set(cv4l_fd &_fd)
 					sscanf(set_ctrl.second.c_str(), "%ux%u",
 					       &ctrl.p_area->width, &ctrl.p_area->height);
 					break;
+				case V4L2_CTRL_TYPE_RECT:
+					sscanf(set_ctrl.second.c_str(), "%ux%u@%dx%d",
+					       &ctrl.p_rect->width, &ctrl.p_rect->height,
+					       &ctrl.p_rect->left, &ctrl.p_rect->top);
+					break;
 				default:
 					fprintf(stderr, "%s: unsupported payload type\n",
 							qc.name);
-- 
2.43.0-rc1


