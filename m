Return-Path: <linux-media+bounces-25480-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA07A240AD
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 17:37:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C287A7A144B
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 16:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F273B1F3FC6;
	Fri, 31 Jan 2025 16:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="oypUF9h/"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013016.outbound.protection.outlook.com [40.107.159.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72A41F3D24;
	Fri, 31 Jan 2025 16:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738341279; cv=fail; b=fef9mDyfhJoubQgOKqRex4hPN+3HDqworz3UvTL6/GPjil1MbiJB/gGPWp9dAb7/LcL0q+v3MnO8mlBYH1sd+ApwoxL64ZWTgzMOAzpkyVXHJ3n8hAexOLuA4YmvgXHznrJw+3CzaTQ6jsbBdSaHr1mHlyXrheG1tJfPLSzs0nA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738341279; c=relaxed/simple;
	bh=0L6AP5OqHs7iZtlI4niQM+FgMvW1e4iphoVJbXOUXUI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XHNyD3L8foZpfxU96LhOkJDruWpIdQwTLxg/2UrYkp9n6vLqaLYijsdEMFwAl8Oaq+XrZ9WnPGwoxRtC/OrTOzz1pXHS+1rtgghFm8676+6VUOXnpeO6GtDa9jn16hIHfWdljVROpzgid45dKDwvqHrZHlkePbtTVylJOpGqhzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=oypUF9h/; arc=fail smtp.client-ip=40.107.159.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MaZ/gnNj/nYIgwbe1rnDipxwZwl5Oo1EOHAXfwmHUA1UX3WxPp5d6SwOCIoQJJkvBX/g3GZM26F1O58PgJDhMtOeWyxtYO5UCeTZ4zZ56hG43tgj970C4CV/vC/CbMPnEB/YV8XQ2jQ/YZAysV+ZYQT9sYPuYc6LaBn5bBrpsVm1v3zGV0V5JhCgxCMa9cpVqRIdUzyfShKL6N7/7c/cQLStNobO0V7tlTETzxEITw6nKwm8HAmmYV14Ij9AH7PZ4hTu8g8lg0pWklUDxU4Pk3/NkUz9zZFhUaq0CskXZQ7uysyVQZSdH8Q/9S5bYOuGPE2U6fYyCfer2v13s2y6Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HWU5/XBDyTBVXhHWFqQtcuSVFXOSDkAyN/L7zhGL4JU=;
 b=p+sOMJeA83aiL7fwoRW+Z40VCuNSKAuVlKDMHGJoWL3C+qKK2lnsimuKPzTRcIPNTqZrBDO7M6Yc4xmgEeVn99ZpJteG4t4tnCIL9DLIU2Qw8iBM67HfdknxZsnqriJVg7OGezOuRqqEASAo5/Lr3z6TxpG5aQj1viWnsV9qbrIoNE8IMnQafNLjYa0t74E3ExaYW9CNu9Zbw5hVaR5F4LCZC7ncVKWtMsoMpZrVZx6s7AwjPFaQXNa7T5986mLmXrviSTPdj1AsrZU+urPxlu2GbvdhdySGuItao3wL56jp486g20kmpYarpnQeVoKX3dliOFSgY2Rh/d0IAOw7wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HWU5/XBDyTBVXhHWFqQtcuSVFXOSDkAyN/L7zhGL4JU=;
 b=oypUF9h/I0f/p0dj98m+dseb97fQZDgSQctdF2UApZmqPRgQ5Btp0jpd+b4gjaBdlouM+OYbDltKFLr8GgOa5sNYC/4xhd+Sb7Ykl+09fNGTgsPS/xkekRAuBfEtOaCQ0mI0i2xaDhTjjwRkPM9lb2qstW+QUCL51wUScBfbHdbl4m7orCnEVxysgnIChXll1F3GwT/BqBF1bj0rIbGsXd9xlpGsHGSfUkQfADQ2qjnUhn1l+xmK5xaHVxOIscBFYTRJzqJdTzkTUlKhZuia/wKkJZ6WaLh8TNPUeRCBE9qp+mAW6T6X3Y4qFp+/5urtRdabnXh8gr2HFrulA07uIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by AS8PR04MB8529.eurprd04.prod.outlook.com (2603:10a6:20b:420::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 16:34:33 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%6]) with mapi id 15.20.8398.017; Fri, 31 Jan 2025
 16:34:33 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [RFC 03/12] staging: media: max96712: convert to using CCI register access helpers
Date: Fri, 31 Jan 2025 18:33:57 +0200
Message-Id: <20250131163408.2019144-4-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131163408.2019144-1-laurentiu.palcu@oss.nxp.com>
References: <20250131163408.2019144-1-laurentiu.palcu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR05CA0086.eurprd05.prod.outlook.com
 (2603:10a6:208:136::26) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|AS8PR04MB8529:EE_
X-MS-Office365-Filtering-Correlation-Id: 99f744b2-bb31-40c7-5e79-08dd4215246b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Nwsbwbvse/IJqDoZgsLYQqiSbuo9Rp1hHZtDXvdf4s0/h/7gt036pd2N5GU6?=
 =?us-ascii?Q?kH8kCDOjLEeiyq1SRaYu6SzBjVLT/y1ORScve+kZZ0suInlP94CEI0nC7/4Y?=
 =?us-ascii?Q?ZTr2t/bJxq+sQFp1j4iFNvGmzIpGFGkPPBAn3s3ON7RldGY5BN2aev55Ud5Y?=
 =?us-ascii?Q?m4mVHW8IsfnoKKowGrFOT1ygzwyNwkJk8RyB7t7pqI7yu1b0JBHqRjDSkHqA?=
 =?us-ascii?Q?qS1LYRfN4cC4nvscIHLYsRYybAHrFpRU0zwCabbgfS/G76Fkgp0YdWM12onz?=
 =?us-ascii?Q?xBTV/eVjDQ1mdO9Nr7bWXJ8Dz2/3e0Guuljc+wvzhIAXAWlgH+gbVUNXgR28?=
 =?us-ascii?Q?2oqyayx7OvQVG64Koftw/WkWk4LTtqBY8HSr8JC1/le/BKY6fqpKW+4flHWc?=
 =?us-ascii?Q?rB3a3QZNPcZy0ObGLaatWxWz/ifnxwf9bgiG4LyEa5fs/IS7axBzd69KVIqF?=
 =?us-ascii?Q?0JiQRni4TCgp5Cx70bm3wBcsbT+i2ExzRph2eJQF+AXErJykDbUWm9fd7oAm?=
 =?us-ascii?Q?08ivQ4Hf5yQzH5OvtwtobOjWbQuSYL1kXHm6tuWJc9C4//7Ku473O9i3jAMs?=
 =?us-ascii?Q?PiOl8ekfgpi07RtvGM4T0c4GHIFcxiAc3MUoOhaJGDtsGQwgUPH9m8anI9G5?=
 =?us-ascii?Q?9UW5gV9TLgMDYmmPQjfZk9O/ZVin3XQHNHpBlErd6Hz4sDwiki/1WPVgjiSY?=
 =?us-ascii?Q?K+QfBTIjcDRuKiq5h0CrxSLlc+jMbMiZZrK3N5odXZLemR7ao9nhDORbeblU?=
 =?us-ascii?Q?v4hz9gEzerr9m5QlpyQnGRcs9Zb73MVX0Yib+dTFKttW3tjZKgA8TN5LHMVW?=
 =?us-ascii?Q?ShwFD0ZBto+imSILx8B0VP30opKRLla2KZggEEMk0E8hu5QT2TrUvTDzdr/w?=
 =?us-ascii?Q?jHBpGlsI0VJMquvchirsbtQKCbbewPrOEE9IcQsw/8Xozvyn5tzCFWM7uiTm?=
 =?us-ascii?Q?o9WPmS9I96lmopXnpj68t7BxpRqG69a5U005Ia/ulfrm97eNoUIdlCU5a+Gu?=
 =?us-ascii?Q?vt8pb4XMdef50FR60VxxLWis7nhQVmmNYGY3sCZNsqyy104Y7fUope39sfU5?=
 =?us-ascii?Q?FgIbTWuWLUhNlh38uA8eUI6TQADXJcH13Z+NB7VFJEO29TrueBMVJAQ3+wyV?=
 =?us-ascii?Q?QgSfG4+zaW97qJnapmy2VZ9TFQeFYavVG97ZHEE/C5fY6Z2CFWA4AiSHUSqh?=
 =?us-ascii?Q?WzhhCuIrRgweVDdSjFX3XjHfFgzK4iN37Ep4Rsv1mray9cn9qn70tMxRLRxA?=
 =?us-ascii?Q?0RjEl/lG9B+WhDMXyu7g7pjM2/zsTgLKUjEClcZQWW0zJim1C4FxKxeTpSRu?=
 =?us-ascii?Q?2i8AHXbQNisbibIE1u0D+GoFlmbluhxGuOChapwNCCXI3xy0xSV3ohuNDWSA?=
 =?us-ascii?Q?dGkwwMkVXD9gFK32acisXE/6U500?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RnN0WZ3PafGOMZE3jKfzJc6Zz9JmZcHSBkihv8QON1iRcI2TVQ8aZ1OwYOg3?=
 =?us-ascii?Q?YT61hkk2xbqU7XqleuL3QRhWc+72bMevQQ5CsWTAa5IJXx5lFO5gWIkSmaOG?=
 =?us-ascii?Q?GrDwQZ0SpSQsofncOUf2Mms0G3KU+uDWy9rlud3asU6nZ5lALlLy9kp076zO?=
 =?us-ascii?Q?D3vSkPxF8BtMdV0HYIu5TaI12fyxe8P0I+a6dy+3V34+Td2gpIo5xYMCzObc?=
 =?us-ascii?Q?l2UVbiZgeF1Y9lLVS9QYKg37mezUY82FxaqviLgeiob+hGzV4SKHBYDvbOw5?=
 =?us-ascii?Q?KVbJN6AieQQMiJFYrix1hyA2TDiHlpbZWCBRbX44EkXN+8BisWwI9Y0FLhuq?=
 =?us-ascii?Q?NDnwYWu+fMUZF3drkdsxfSIBKrDugg7PYoHtHLY/EvBj9M8tfaqxylU11EBK?=
 =?us-ascii?Q?aMB04VSaZdJLXjul5gMcIV3g77f39vVOYTS+KMot8kKltDZdtFL2gehlKKLR?=
 =?us-ascii?Q?sGTprhXrN1SANvtlquuCfOyK2ENy7y+YVQJMysY9zBqMIqbGbmOlaTRMLD2x?=
 =?us-ascii?Q?/VXtopMOWpIBG3JKEbGFkzEkufyfDFtuPY0/rk57t/SrrON0BNkn9qEHlsrr?=
 =?us-ascii?Q?+JGlGzFDj0Ha+44pUc4DYTAf+ZEtYzOn9WVkuG6y9FZxqhPMldR+4wY/gNIX?=
 =?us-ascii?Q?RWtMGnahvmVGNZp8aWiUkw7W64CY3hsRo4Eiq4+Cx0sNXA4nHglk9xdPeMr8?=
 =?us-ascii?Q?GPwGhr/G7TFH7cpgMUrNabpTPIy1eNOnJAYMNoNMSFEyKBLmr2oQUmYnlotA?=
 =?us-ascii?Q?YCqIQ1z+s18CJJT6wvPqxN8a0D8IzJ0+bx3ni95PM26RbyuIUuRPOApivbwA?=
 =?us-ascii?Q?VTR8RzdPZ89K1dqCqlFVWZDgAV8UCt9yrLQ10IyzqcBPwR4gSbrN+8997lar?=
 =?us-ascii?Q?AjPIC09QH1qgcHzCPns6H3MurmZAf9+s5y+Qt68I0f/oq2CSB0thY5B7XasT?=
 =?us-ascii?Q?L/m/0zNpXl/j8EoseM5c+sgCqM4L+jCHjup2KP2mKqwgBYcwM6HviqeKPS7s?=
 =?us-ascii?Q?H5cbEUPaWO2ADhZrXaG3HqIOBtkjlLqpf+Kn8P5dSyf0q5hdqXV56dGYHqpN?=
 =?us-ascii?Q?PkoAxDVb2GIJc8Xrm1mTXIRikEraQPEzrBFlrp3ibSaijq0pRmykv7VBN8rs?=
 =?us-ascii?Q?/Eli5od0veixEGDE9UfpGuHIxQpt+0//9amHwdxCD9Z334loqJVnkZKR9N0m?=
 =?us-ascii?Q?CNwB9USVDc/+wdntd7KYJ9Ln75fYIcmKi15aWrpcP3VsOiZOPlbv6Re2paaV?=
 =?us-ascii?Q?1IPQ338ev595jmfDJ4zbePp/aKi/cFh5lFf2wcsn/7+qIyWUDVQZHKiRS0P1?=
 =?us-ascii?Q?8Bt3fBgLkRF1IVfT2OJOfThen7MOZxlySIX38QynD4b0wikyjhE5zfotec9k?=
 =?us-ascii?Q?GiKw5cVs+kKw2skHoRxBpTsf/8V0tiU4AEl0VU/jbqnyN1sVtDQgb2BE9/mA?=
 =?us-ascii?Q?Oraljg5Blj6U0AOzphz5vAFSk8L2I7pfVAeU1PJO1Ub8Oba7c8hlF74UWh8Y?=
 =?us-ascii?Q?NgztgoEfYgpHUn8IJLPvpveXTnHrhJjIkL413ZUWAiq1Khma+yJmJlZ7/HZ0?=
 =?us-ascii?Q?Tsvxyn8BNz07xOb2ybOQl6X1PAgAOeMmsHNDkYOaG35ywuL16+yYfjsVdrtv?=
 =?us-ascii?Q?2g=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99f744b2-bb31-40c7-5e79-08dd4215246b
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 16:34:33.1015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MUc/eycoRbx8eafFr4n/g7O8NXQn5u/m4q7IZ0kJ/Gac1YiUYoRITRLinq5IE+zRASQEfiVhXAVMjc+mfmOAZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8529

Use the CCI register access helpers instead of regmap's.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 drivers/staging/media/max96712/max96712.c | 126 +++++++++-------------
 1 file changed, 51 insertions(+), 75 deletions(-)

diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
index 47842facec125..cf39f5243cd6d 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -12,24 +12,25 @@
 #include <linux/of_graph.h>
 #include <linux/regmap.h>
 
+#include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
 /* TOP_CTRL */
-#define MAX96712_DEBUG_EXTRA_REG			0x0009
+#define MAX96712_DEBUG_EXTRA_REG			CCI_REG8(0x0009)
 #define   DEBUG_EXTRA_PCLK_25MHZ			0x00
 #define   DEBUG_EXTRA_PCLK_75MHZ			0x01
-#define MAX96724_TOP_CTRL_PWR1				0x0013
+#define MAX96724_TOP_CTRL_PWR1				CCI_REG8(0x0013)
 #define   RESET_ALL					BIT(6)
 
 /* BACKTOP0 */
-#define MAX96712_BACKTOP0_12				0x040b
+#define MAX96712_BACKTOP0_12				CCI_REG8(0x040b)
 #define   CSI_OUT_EN					BIT(1)
 #define   SOFT_BPP_0_MASK				GENMASK(7, 3)
 #define   SOFT_BPP_0_SHIFT				3
-#define MAX96712_BACKTOP0_22				0x0415
-#define MAX96712_BACKTOP0_25				0x0418
+#define MAX96712_BACKTOP0_22				CCI_REG8(0x0415)
+#define MAX96712_BACKTOP0_25				CCI_REG8(0x0418)
 #define   PHY_CSI_TX_DPLL_PREDEF_FREQ_MASK		GENMASK(4, 0)
 #define   PHY_CSI_TX_DPLL_PREDEF_FREQ_SHIFT		0
 #define   PHY_CSI_TX_DPLL_FB_FRACTION_PREDEF_EN		BIT(5)
@@ -37,7 +38,7 @@
 #define   OVERRIDE_BPP_VC_DT_1_3			BIT(7)
 
 /* MIPI_PHY */
-#define MAX96712_MIPI_PHY_0				0x08a0
+#define MAX96712_MIPI_PHY_0				CCI_REG8(0x08a0)
 #define   PHY_4X2					BIT(0)
 #define   PHY_2X4					BIT(2)
 #define   PHY_1X4A_22					BIT(3)
@@ -45,7 +46,7 @@
 #define   FORCE_CLK0_EN					BIT(5)
 #define   FORCE_CLK3_EN					BIT(6)
 #define   FORCE_CSI_OUT_EN				BIT(7)
-#define MAX96712_MIPI_PHY_2				0x08a2
+#define MAX96712_MIPI_PHY_2				CCI_REG8(0x08a2)
 #define   T_HS_TRAIL_MASK				GENMASK(1, 0)
 #define   T_HS_TRAIL_SHIFT				0
 #define   T_LPX_MASK					GENMASK(3, 2)
@@ -56,22 +57,22 @@
 #define   PHY1_EN					BIT(5)
 #define   PHY2_EN					BIT(6)
 #define   PHY3_EN					BIT(7)
-#define MAX96712_MIPI_PHY_3				0x08a3
+#define MAX96712_MIPI_PHY_3				CCI_REG8(0x08a3)
 #define   PHY0_LANE_MAP_MASK				GENMASK(3, 0)
 #define   PHY0_LANE_MAP_SHIFT				0
 #define   PHY1_LANE_MAP_MASK				GENMASK(7, 4)
 #define   PHY1_LANE_MAP_SHIFT				4
-#define MAX96712_MIPI_PHY_5				0x08a5
+#define MAX96712_MIPI_PHY_5				CCI_REG8(0x08a5)
 #define   PHY0_POL_MAP_MASK				GENMASK(2, 0)
 #define   PHY0_POL_MAP_SHIFT				0
 #define   PHY1_POL_MAP_MASK				GENMASK(5, 3)
 #define   PHY1_POL_MAP_SHIFT				3
 #define   T_CLK_PREP_MASK				GENMASK(7, 6)
 #define   T_CLK_PREP_SHIFT				6
-#define MAX96712_MIPI_PHY_13				0x08ad
+#define MAX96712_MIPI_PHY_13				CCI_REG8(0x08ad)
 #define   T_T3_PREBEGIN_MASK				GENMASK(5, 0)
 #define   T_T3_PREBEGIN_SHIFT				0
-#define MAX96712_MIPI_PHY_14				0x08ae
+#define MAX96712_MIPI_PHY_14				CCI_REG8(0x08ae)
 #define   T_T3_PREP_MASK				GENMASK(1, 0)
 #define   T_T3_PREP_SHIFT				0
 #define   T_T3_PREP_40NS				0
@@ -82,7 +83,7 @@
 #define   T_T3_POST_SHIFT				2
 
 /* MIPI_TX: 0 <= phy < 4 */
-#define MAX96712_MIPI_TX_10(phy)			(0x090a + (phy) * 0x40)
+#define MAX96712_MIPI_TX_10(phy)			CCI_REG8(0x090a + (phy) * 0x40)
 #define   CSI2_TWAKEUP_H_MASK				GENMASK(2, 0)
 #define   CSI2_TWAKEUP_H_SHIFT				0
 #define   CSI2_VCX_EN					BIT(4)
@@ -91,7 +92,7 @@
 #define   CSI2_LANE_CNT_SHIFT				6
 
 /* VRX_PATGEN */
-#define MAX96712_VRX_PATGEN_0				0x1050
+#define MAX96712_VRX_PATGEN_0				CCI_REG8(0x1050)
 #define   VTG_MODE_MASK					GENMASK(1, 0)
 #define   VTG_MODE_SHIFT				0
 #define   VTG_MODE_VS_TRACKING				0
@@ -104,30 +105,30 @@
 #define   GEN_DE					BIT(5)
 #define   GEN_HS					BIT(6)
 #define   GEN_VS					BIT(7)
-#define MAX96712_VRX_PATGEN_1				0x1051
+#define MAX96712_VRX_PATGEN_1				CCI_REG8(0x1051)
 #define   VS_TRIG					BIT(0)
 #define   PATGEN_MODE_MASK				GENMASK(5, 4)
 #define   PATGEN_MODE_SHIFT				4
 #define   PATGEN_MODE_CHECKERBOARD			(1 << PATGEN_MODE_SHIFT)
 #define   PATGEN_MODE_GRADIENT				(2 << PATGEN_MODE_SHIFT)
 #define   GRAD_MODE					BIT(7)
-#define MAX96712_VRX_PATGEN_VS_DLY			0x1052
-#define MAX96712_VRX_PATGEN_VS_HIGH			0x1055
-#define MAX96712_VRX_PATGEN_VS_LOW			0x1058
-#define MAX96712_VRX_PATGEN_V2H				0x105b
-#define MAX96712_VRX_PATGEN_HS_HIGH			0x105e
-#define MAX96712_VRX_PATGEN_HS_LOW			0x1060
-#define MAX96712_VRX_PATGEN_HS_CNT			0x1062
-#define MAX96712_VRX_PATGEN_V2D				0x1064
-#define MAX96712_VRX_PATGEN_DE_HIGH			0x1067
-#define MAX96712_VRX_PATGEN_DE_LOW			0x1069
-#define MAX96712_VRX_PATGEN_DE_CNT			0x106b
-#define MAX96712_VRX_PATGEN_GRAD_INCR			0x106d
-#define MAX96712_VRX_PATGEN_CHKR_COLOR_A		0x106e
-#define MAX96712_VRX_PATGEN_CHKR_COLOR_B		0x1071
-#define MAX96712_VRX_PATGEN_CHKR_RPT_A			0x1074
-#define MAX96712_VRX_PATGEN_CHKR_RPT_B			0x1075
-#define MAX96712_VRX_PATGEN_CHKR_ALT			0x1076
+#define MAX96712_VRX_PATGEN_VS_DLY			CCI_REG24(0x1052)
+#define MAX96712_VRX_PATGEN_VS_HIGH			CCI_REG24(0x1055)
+#define MAX96712_VRX_PATGEN_VS_LOW			CCI_REG24(0x1058)
+#define MAX96712_VRX_PATGEN_V2H				CCI_REG16(0x105b)
+#define MAX96712_VRX_PATGEN_HS_HIGH			CCI_REG16(0x105e)
+#define MAX96712_VRX_PATGEN_HS_LOW			CCI_REG16(0x1060)
+#define MAX96712_VRX_PATGEN_HS_CNT			CCI_REG16(0x1062)
+#define MAX96712_VRX_PATGEN_V2D				CCI_REG24(0x1064)
+#define MAX96712_VRX_PATGEN_DE_HIGH			CCI_REG16(0x1067)
+#define MAX96712_VRX_PATGEN_DE_LOW			CCI_REG16(0x1069)
+#define MAX96712_VRX_PATGEN_DE_CNT			CCI_REG16(0x106b)
+#define MAX96712_VRX_PATGEN_GRAD_INCR			CCI_REG8(0x106d)
+#define MAX96712_VRX_PATGEN_CHKR_COLOR_A		CCI_REG24(0x106e)
+#define MAX96712_VRX_PATGEN_CHKR_COLOR_B		CCI_REG24(0x1071)
+#define MAX96712_VRX_PATGEN_CHKR_RPT_A			CCI_REG8(0x1074)
+#define MAX96712_VRX_PATGEN_CHKR_RPT_B			CCI_REG8(0x1075)
+#define MAX96712_VRX_PATGEN_CHKR_ALT			CCI_REG8(0x1076)
 
 enum max96712_pattern {
 	MAX96712_PATTERN_CHECKERBOARD = 0,
@@ -155,11 +156,11 @@ struct max96712_priv {
 	enum max96712_pattern pattern;
 };
 
-static int max96712_write(struct max96712_priv *priv, unsigned int reg, u8 val)
+static int max96712_write(struct max96712_priv *priv, unsigned int reg, u64 val)
 {
 	int ret;
 
-	ret = regmap_write(priv->regmap, reg, val);
+	ret = cci_write(priv->regmap, reg, val, NULL);
 	if (ret)
 		dev_err(&priv->client->dev, "write 0x%04x failed\n", reg);
 
@@ -167,42 +168,17 @@ static int max96712_write(struct max96712_priv *priv, unsigned int reg, u8 val)
 }
 
 static int max96712_update_bits(struct max96712_priv *priv, unsigned int reg,
-				u8 mask, u8 val)
+				u64 mask, u64 val)
 {
 	int ret;
 
-	ret = regmap_update_bits(priv->regmap, reg, mask, val);
+	ret = cci_update_bits(priv->regmap, reg, mask, val, NULL);
 	if (ret)
 		dev_err(&priv->client->dev, "update 0x%04x failed\n", reg);
 
 	return ret;
 }
 
-static int max96712_write_bulk(struct max96712_priv *priv, unsigned int reg,
-			       const void *val, size_t val_count)
-{
-	int ret;
-
-	ret = regmap_bulk_write(priv->regmap, reg, val, val_count);
-	if (ret)
-		dev_err(&priv->client->dev, "bulk write 0x%04x failed\n", reg);
-
-	return ret;
-}
-
-static int max96712_write_bulk_value(struct max96712_priv *priv,
-				     unsigned int reg, unsigned int val,
-				     size_t val_count)
-{
-	unsigned int i;
-	u8 values[4];
-
-	for (i = 1; i <= val_count; i++)
-		values[i - 1] = (val >> ((val_count - i) * 8)) & 0xff;
-
-	return max96712_write_bulk(priv, reg, &values, val_count);
-}
-
 static void max96712_reset(struct max96712_priv *priv)
 {
 	max96712_update_bits(priv, MAX96724_TOP_CTRL_PWR1, RESET_ALL, RESET_ALL);
@@ -293,19 +269,19 @@ static void max96712_pattern_enable(struct max96712_priv *priv, bool enable)
 	max96712_write(priv, MAX96712_DEBUG_EXTRA_REG, DEBUG_EXTRA_PCLK_75MHZ);
 
 	/* Configure Video Timing Generator for 1920x1080 @ 30 fps. */
-	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_VS_DLY, 0, 3);
-	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_VS_HIGH, v_sw * h_tot, 3);
-	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_VS_LOW,
-				  (v_active + v_fp + v_bp) * h_tot, 3);
-	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_V2H, 0, 3);
-	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_HS_HIGH, h_sw, 2);
-	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_HS_LOW, h_active + h_fp + h_bp, 2);
-	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_HS_CNT, v_tot, 2);
-	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_V2D,
-				  h_tot * (v_sw + v_bp) + (h_sw + h_bp), 3);
-	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_DE_HIGH, h_active, 2);
-	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_DE_LOW, h_fp + h_sw + h_bp, 2);
-	max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_DE_CNT, v_active, 2);
+	max96712_write(priv, MAX96712_VRX_PATGEN_VS_DLY, 0);
+	max96712_write(priv, MAX96712_VRX_PATGEN_VS_HIGH, v_sw * h_tot);
+	max96712_write(priv, MAX96712_VRX_PATGEN_VS_LOW,
+		       (v_active + v_fp + v_bp) * h_tot);
+	max96712_write(priv, MAX96712_VRX_PATGEN_V2H, 0);
+	max96712_write(priv, MAX96712_VRX_PATGEN_HS_HIGH, h_sw);
+	max96712_write(priv, MAX96712_VRX_PATGEN_HS_LOW, h_active + h_fp + h_bp);
+	max96712_write(priv, MAX96712_VRX_PATGEN_HS_CNT, v_tot);
+	max96712_write(priv, MAX96712_VRX_PATGEN_V2D,
+		       h_tot * (v_sw + v_bp) + (h_sw + h_bp));
+	max96712_write(priv, MAX96712_VRX_PATGEN_DE_HIGH, h_active);
+	max96712_write(priv, MAX96712_VRX_PATGEN_DE_LOW, h_fp + h_sw + h_bp);
+	max96712_write(priv, MAX96712_VRX_PATGEN_DE_CNT, v_active);
 
 	/* Generate VS, HS and DE in free-running mode. */
 	max96712_write(priv, MAX96712_VRX_PATGEN_0,
@@ -320,8 +296,8 @@ static void max96712_pattern_enable(struct max96712_priv *priv, bool enable)
 		max96712_write(priv, MAX96712_VRX_PATGEN_CHKR_ALT, 0x3c);
 
 		/* Set checkerboard pattern colors. */
-		max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_CHKR_COLOR_A, 0xfecc00, 3);
-		max96712_write_bulk_value(priv, MAX96712_VRX_PATGEN_CHKR_COLOR_B, 0x006aa7, 3);
+		max96712_write(priv, MAX96712_VRX_PATGEN_CHKR_COLOR_A, 0xfecc00);
+		max96712_write(priv, MAX96712_VRX_PATGEN_CHKR_COLOR_B, 0x006aa7);
 
 		/* Generate checkerboard pattern. */
 		max96712_write(priv, MAX96712_VRX_PATGEN_1, PATGEN_MODE_CHECKERBOARD);
-- 
2.44.1


