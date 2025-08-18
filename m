Return-Path: <linux-media+bounces-40181-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D97E6B2AD95
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 17:59:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C0CC18A2C57
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 15:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 998493376AC;
	Mon, 18 Aug 2025 15:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fr/qI3AJ"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013033.outbound.protection.outlook.com [40.107.159.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0908B337689;
	Mon, 18 Aug 2025 15:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755532717; cv=fail; b=IzwcYRsomo0YlpDQB/iqaO7ub1Z2ga+JvsQaTjhGURgsu48H4W2nq99Y8PjiZmk9DBl98+Me3d3o7BemPuhWmDkPswGL46WJrG+UGjDCTypTaCpo1iaFXWog164P/mOEWtkWL+cW4kyJx+D0pwt+wZ7UfcjoQLztl2B2rmVZ9zs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755532717; c=relaxed/simple;
	bh=gJup2OenG6Gv9wXPeaUJiGNFkcdorynAXof2X9TbYlI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T1wVNdqHIkIfMBAsgitle+ExkXhjDluwDEz7cfG8ufRqpayZtoq+5GxnXWYMKhnTuPBzTN5N3n5dcTzqjGncJednQBoZrervbtdCdlwfOD96lnOoP4/RFktgrO0cGzaswcv++ZI+BSmUWNzkgGUdnJOlokLiaYNkEMPVzAHvBio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fr/qI3AJ; arc=fail smtp.client-ip=40.107.159.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sdRMuSKVmCDHp97IQ0f/lhCBZOK5r/sH+aJmvVAXyUpR6rteikMRLDbt6+VXnMshc6D1sdacZyx1qe8v55oRG5Is6k1WXAPCej26kcbpAs6hOw5gY/hJNeGKHJkE04o2b6HDPqVgzFGeJDgXLJI/ihrPcq43jhEspXS0GDE6jKwvkQPRDRhHgyPxgZz5aaUJKYhsjMVFI/bvfwsZ/qSIhcpYFJDFe5pYzvu/V1LZdu0XRhAh9b+I3FwrMFEco1WFwvoNw1TXJhUcmPmZDAfOThnLwboNY3Aiq9nApjNiYYKdzpSBOh293/8sJm6U6K3xipKor4Qr+jaUskRYW+OvrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BABxXEwJ6FJBh8G4gori2MttkrlFKhA96Zn12fgt0aA=;
 b=FlgIHxWEE95gUSnodg4uFrh3o+4Au06Rc4izcsVYg3W34HL/qLB+KtMpEZ59ndm8rEJUGWlMqEA1VQ+EBunxpUAW2NhW8s4luqaCyr5P1tQzALm/sNmBvg8HmGMtsaw1POh4/BI8TVaHT1NZ+cI1xvq2CG/a9FFNYIBYaZ0JA+oimJ93tcwv4NZ0pkX+XZc4VSKi8Yv+pwh2g/VaDchX4S/dW8D7PNqp6RuzxRQlm+LD4hCwWT+eqanaLnWmtqZ7XeQvVGvNdA/9YBXLuOcH1Alon34BsYgUnxgFcc3e+K9TXEU7l44VQbZyoQU12SXGO+Yf8VnSCdMZ7oWau3LvWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BABxXEwJ6FJBh8G4gori2MttkrlFKhA96Zn12fgt0aA=;
 b=fr/qI3AJz6n1Rgn/MPR+C1GxdPA+aXMo+zBTsYF38LVb9PAjv5+v60dMPTcFT2Xio46cDGsxOJxJzUyN0/hmTpsbQvd9Bjce8ZmYrcimGG8C8GQ6b/RnLcG/aV4P2XJXxKpp/mlRNgGSYZDgdcjaIGKCb6/+uXevGax4Bccntyy2RUqOidlv8zuePout17OKx5X2HOYIWghGXH+WfnHAIKs+rFj3fNc1jW2z+MpK3q7o16XfElPuu1ZxEYipNVt+bGuHM0gQFQdu4f/Sx/tRU5b4PpPgMHrNc8Nd18Q/5zXszoghPrh1Am14bCvoJoJ0JxEuoBvRcHSuRVA/IIVA9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by GV4PR04MB11305.eurprd04.prod.outlook.com (2603:10a6:150:297::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Mon, 18 Aug
 2025 15:58:28 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%5]) with mapi id 15.20.9052.011; Mon, 18 Aug 2025
 15:58:28 +0000
From: Mirela Rabulea <mirela.rabulea@nxp.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	hverkuil-cisco@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	ribalda@chromium.org,
	jai.luthra@ideasonboard.com,
	laurentiu.palcu@nxp.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	LnxRevLi@nxp.com,
	julien.vuillaumier@nxp.com,
	celine.laurencin@nxp.com
Subject: [RFC v2 3/5] media: v4l2-ctrls: Add v4l2 helper functions for single-capture controls
Date: Mon, 18 Aug 2025 18:58:07 +0300
Message-ID: <20250818155809.469479-4-mirela.rabulea@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818155809.469479-1-mirela.rabulea@nxp.com>
References: <20250818155809.469479-1-mirela.rabulea@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0256.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::19) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|GV4PR04MB11305:EE_
X-MS-Office365-Filtering-Correlation-Id: 1330cb71-8f3c-4f5a-7d32-08ddde70127d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|19092799006|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?y0S700zuwDSRsXWTsK6z0QcSZJrfqgTdGs7t9Q/Y2rnQg5lx3NiffzF0FXTo?=
 =?us-ascii?Q?YQKNboSO8vo9IgdFEJc8uJb6w2ZfwJ3o/u/C9Ex1SRavS/Om4BwFvREJKpt/?=
 =?us-ascii?Q?KdRbZf6ppF7wR+kyMGm7o+xy+dhN4VZQb+gGuumf2FZmquXRdGsPOt/4A6l9?=
 =?us-ascii?Q?uvfQbwLSB868/X/HCwaqWttfQTDBwrhe2fbGTcRP9lC9U6XxqUGAllChcC4q?=
 =?us-ascii?Q?7ILNZOr7QlRid5GXxCRA1Vk6/cTG+VR1iL+S0hmcwLmJ7+GMolDoiuwZzeZx?=
 =?us-ascii?Q?7oLOK5yb29vQj7p2Tsb7Z7NuSgaOlw15kiphIeRXnwHGY+RIHMFk9R4MW0FI?=
 =?us-ascii?Q?uyVz37B+ZHZNTjDLujV4Pjbidysl0NWCYevHwoYggRm0OVU9NCmGe9IILSyx?=
 =?us-ascii?Q?ym1JHMPZnVGzq+bhcpZJHHFMOnf9fZ7JWfoLWPfeo+ni4Z/SUODT/+Yaw0AJ?=
 =?us-ascii?Q?xMr6ah2RYPQFRePavYDuysuzYzD/IUqBx5V6rEK2SbmUh4bc40SBGl9iAYNN?=
 =?us-ascii?Q?dvT+P5MiTtz2tRnVODj3QRB3jw7L+c6CvxUiHMzrjtC/2S/WRUnBWsnEBeOQ?=
 =?us-ascii?Q?XXGfpK10gAvQvTVETIcR2K3Y8MncOzLdARQ9BjM76Gh1NLOrEwfPtk5g25m+?=
 =?us-ascii?Q?4RoVWQxj1vk3KkrcAhvzNSN0cjnVaubcOOaHEjyGmXKtkSbcHpHUQAYRjQM5?=
 =?us-ascii?Q?hBltZp9pUlCM2C0c6zB1k4p+7pyIjSp5HqnTpPkdTomdBw4vVDGz2pOC7avy?=
 =?us-ascii?Q?K/i3GLJpZFg6Y5Ddb1wywwVIFduGbZyFuQl+rTI/dIPBbT6zIunFoGTyYbjM?=
 =?us-ascii?Q?hRp87o3c34knyfz+ROvmmpy5OXrvPh7YoEI4SwWse56mCCXeU/LT2to6C92G?=
 =?us-ascii?Q?kv9z+OWhSYMVaQWRhcS6bCthSNY/aZXBAuk/COYqS6aqjj5vicXpazTeYXnD?=
 =?us-ascii?Q?n+iKiwD0y1Bx0X9k/ShElD1liEUrvU01HgfZ+GR8Id92aj7WRsFrUnJbzgnJ?=
 =?us-ascii?Q?Qbw/GyDbe9OnSJbFEqnlLkbfiQkeD4xBfZxnAMiJOt1R1CSN2KTzlQOPtF6M?=
 =?us-ascii?Q?dFOCkY/zpjh0pXrBvod9ma0stDf+wYlzdzUL49Ty5CXUEWrb4FYT6Dw1P7js?=
 =?us-ascii?Q?FEemdtRGmvczoj9az5ocC1lsG54Tsptg1L8ErpGZeqwxzH8F3ivqbJeah0iq?=
 =?us-ascii?Q?kl01EsetN/rOam3zu9IMhmh8sLwPqBPRLF6o6z0igBOzHcnsmTKEu6ZxvR5g?=
 =?us-ascii?Q?3gBX8ol6iDKnFLE+Bfzl9ZCxIRQOfqy0rY/5ZDOociXWZra3/VISUosFfY6x?=
 =?us-ascii?Q?O3j94+t6Ffcxi6cHGrnyxkpNiF+S+MeAQ/azuxy5vxD0eytIpBbNpUFo6nEM?=
 =?us-ascii?Q?bgkLaCcfdb73g5X3PsgTvkIEMVLMDT59iPVkjnEkR1iZXZvlvlDWQXiwu/gu?=
 =?us-ascii?Q?WwawOOXP1pNbYaqG7n6lr/eJmX+yf4bHbHYlPHzbl3uC6MQxlVA7Wg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Nu9RyCQzzn4+OhHO8U+vAwppa4U6KV+81SkbnRK/A2Ud3ZkY9ZxTmRZcy8RC?=
 =?us-ascii?Q?uwiPmVVtislDQrnZQcg+tb2bxdCP1kRHS/2mSCZSvBzPI32UplNabDwbA8hS?=
 =?us-ascii?Q?3/C699UUo4ca/gAoTsn1UFlbUTUExQloakHzL2i1KVbRTM59lwC8Bn1Gu8Dz?=
 =?us-ascii?Q?rXOmT2UoPKnFieYyWLMvSDrY+ul0hD6/2+/6kuP287j1odl0lNDhlhg1/+Gf?=
 =?us-ascii?Q?xkWJUTrbMNuCYsHUgStEllSskYis1kC3r7ErId0ZhniX/fZyuZ/tR0C0KCw2?=
 =?us-ascii?Q?iFf7O6uqZETVeMEA32aAQWZudX3kNa6X66/ocpXD3lwJdX0qdetb6Gk9n4ar?=
 =?us-ascii?Q?GKYApyFEXZAT09Gr/CCcwc96p6O1fDlVh/JgKN5Dl6xVedFRPOwGZ9Mr0CLB?=
 =?us-ascii?Q?pyNEQjOfBkPPlvqQt7S9Hl2nhTQipHjQtmnVvU6xx/Dax5AdYLohIijbEBgQ?=
 =?us-ascii?Q?RdqidgxjxkFEEPe3qzKk7vIIGYu1mO/R1Dx4atYIf6zC0nu71Ghh0EowsCh7?=
 =?us-ascii?Q?n4ZcLsx5Q1KQ9ZOfItnPFhfbV1IBV6WikH+OQWn84vIKXIIcDqMuB7j39/IL?=
 =?us-ascii?Q?PIahMyeUrRBmpxpNUsF9uUer58vZ4YrXsQIE7QzPXo9v6Yiv+CJoB6Iuh6py?=
 =?us-ascii?Q?aTYRqe3Ao8krrRwQ1yPToZdNdMK2Vbg/6TuMAZBlxYcHRuWBDdbbg2inWjvE?=
 =?us-ascii?Q?1Qv17MXfLTtUg8MlUBf1izrmFaCoR4Y9f+YD6Bzs+v/rljHyLdmGD9sgVYOO?=
 =?us-ascii?Q?oogF3sVeNJAwD5hks1UNUqxZWz2pR77sdL9dlmWMqdcp69tKD+rk1Le2f7+0?=
 =?us-ascii?Q?+Bme0klGwzBr9T/VWJXFe0Su7OKVEiFSmsN1b8qUEJk+NObrxbRlWYvXFbjV?=
 =?us-ascii?Q?38uCeyYzerEGXqzt7im7UhqEtzqhUrqNu7oVCzsukyPLN6UoROaLVzJjexID?=
 =?us-ascii?Q?DfvsfmT6z6FE5r1UcmziBJ2Bv6Tz0+6aV1pLcYU6HblckM3q/VjSUXTnsvcB?=
 =?us-ascii?Q?TB/x6xW41sDohYqIJnMi+8/6uHKyLu8nXIeqlGqCKMt8bHPuN+ObV/0rXi4n?=
 =?us-ascii?Q?LRXlAMazEIbq5T7CbgUbkYH+MEKax8OMUeT1+PxoRzlgTZYqvvWXtLEA8dFD?=
 =?us-ascii?Q?98AdNuTn3g1z03ZOloZbq5AboSBsvgCzkD4c9E7hAen6r0rI0RjsiWpGqTwt?=
 =?us-ascii?Q?pkV04T8QHwWIfEVRKFR6TinnpybBbn4yUlAOpw8WjfTi/jJ1sqtANCKDISNk?=
 =?us-ascii?Q?Jm3agcmNpbWUJ8a4v+cS8nlGpRdKXL5wPe82vXnL6qrAK4GJkEWFpQ1YmdEz?=
 =?us-ascii?Q?T0jN6KQzGGQl7m1VXY6WwnruSA5tB6JubTP+Me9c7UMK6nEMn9eAUqSCJGVI?=
 =?us-ascii?Q?BKbuk9lvzFRfQRSP6cMsnXl2GnKfx1PLwFNUZUN8PxZuB/WSZ/QHadtraCCT?=
 =?us-ascii?Q?cpjGf18VpimCBy6ZHFVZxL7FGCXhzf3teX++aopgR9To1DpXsGKbidA+gqDN?=
 =?us-ascii?Q?sGgocJZPC1XWXCU2PbeHle1RXGCnlbIpO48/xzbyhukIHMkC3ps94duUAF6e?=
 =?us-ascii?Q?aOI3kHogVbeNkT3b7XgtrgosOfCU7z6NpU/lWCzQz9E5Kl/j5l6X2ppaGovN?=
 =?us-ascii?Q?Vg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1330cb71-8f3c-4f5a-7d32-08ddde70127d
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 15:58:28.6863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LhA/bN3jiQyQGOm2NaVQjfH8syDd7T6LgBFLUOfUIbcz+vuXwwRCmGgEFrD3FiqsmuPaktyAALs2a5RUjKpDvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11305

Add v4l2 helper functions to support backward compatibility
with older user-space applications that are still using the
single-capture exposure and gain controls.

After the addition of multi-capture exposure and gain controls,
the following scenarios are possible:
1. Old applications & old sensor drivers
   Both the application and the driver are using single-capture controls,
   no problem here.
2. Old applications & new sensor drivers
   The application is using single-capture controls and we want the drivers
   to implement only the new multi-capture controls. In this case the
   driver should use the v4l2_ctrl_new_single_cap_ctrls helper to create
   the old single-capture controls, for backward compatibility.
3. New application & old sensor drivers
   The new application can query if the driver supports multi-capture
   controls, if it doesn't, the application may fallback to single-capture
   controls.
4. New application & new sensor drivers
   Both the application and the driver are using multi-capture controls,
   again, no problem here.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---

Changes in v2:
	New patch

 drivers/media/v4l2-core/v4l2-ctrls-core.c | 85 +++++++++++++++++++++++
 include/media/v4l2-ctrls.h                | 76 ++++++++++++++++++++
 2 files changed, 161 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 98b960775e87..41f307e3afa6 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -2719,3 +2719,88 @@ int v4l2_ctrl_new_fwnode_properties(struct v4l2_ctrl_handler *hdl,
 	return hdl->error;
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_fwnode_properties);
+
+int v4l2_ctrl_new_single_cap_ctrls(struct v4l2_ctrl_handler *hdl,
+				   const struct v4l2_ctrl_ops *ctrl_ops)
+{
+	if (hdl->error)
+		return hdl->error;
+
+	v4l2_ctrl_new_std(hdl, ctrl_ops, V4L2_CID_EXPOSURE,
+			  0, 0, 1, 0);
+
+	v4l2_ctrl_new_std(hdl, ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
+			  0, 0, 1, 0);
+
+	v4l2_ctrl_new_std(hdl, ctrl_ops, V4L2_CID_DIGITAL_GAIN,
+			  0, 0, 1, 0);
+
+	return hdl->error;
+}
+EXPORT_SYMBOL(v4l2_ctrl_new_single_cap_ctrls);
+
+struct v4l2_ctrl *__v4l2_get_multi_ctrl(struct v4l2_ctrl *ctrl_single)
+{
+	struct v4l2_ctrl_handler *hdl = ctrl_single->handler;
+	struct v4l2_ctrl_ref *ref;
+
+	switch (ctrl_single->id) {
+	case V4L2_CID_EXPOSURE:
+		ref = find_ref(hdl, V4L2_CID_EXPOSURE_MULTI);
+		break;
+	case V4L2_CID_ANALOGUE_GAIN:
+		ref = find_ref(hdl, V4L2_CID_AGAIN_MULTI);
+		break;
+	case V4L2_CID_DIGITAL_GAIN:
+		ref = find_ref(hdl, V4L2_CID_DGAIN_MULTI);
+		break;
+	default:
+		return NULL;
+	}
+
+	return ref->ctrl;
+}
+EXPORT_SYMBOL(__v4l2_get_multi_ctrl);
+
+struct v4l2_ctrl *__v4l2_get_single_ctrl(struct v4l2_ctrl *ctrl_multi)
+{
+	struct v4l2_ctrl_handler *hdl = ctrl_multi->handler;
+	struct v4l2_ctrl_ref *ref;
+
+	switch (ctrl_multi->id) {
+	case V4L2_CID_EXPOSURE_MULTI:
+		ref = find_ref(hdl, V4L2_CID_EXPOSURE);
+		break;
+	case V4L2_CID_AGAIN_MULTI:
+		ref = find_ref(hdl, V4L2_CID_ANALOGUE_GAIN);
+		break;
+	case V4L2_CID_DGAIN_MULTI:
+		ref = find_ref(hdl, V4L2_CID_DIGITAL_GAIN);
+		break;
+	default:
+		return NULL;
+	}
+
+	return ref->ctrl;
+}
+EXPORT_SYMBOL(__v4l2_get_single_ctrl);
+
+int __v4l2_s_ctrl_multi_to_single(struct v4l2_ctrl *ctrl_multi)
+{
+	struct v4l2_ctrl *ctrl_single = NULL;
+
+	if (!ctrl_multi)
+		return -EINVAL;
+
+	ctrl_single = __v4l2_get_single_ctrl(ctrl_multi);
+	/* don't fail if no corresponding single control is found */
+	if (!ctrl_single)
+		return 0;
+
+	/* update the value of the single control, without calling s_ctrl */
+	ctrl_single->cur.val = ctrl_multi->p_cur.p_u32[0];
+
+	return 0;
+}
+EXPORT_SYMBOL(__v4l2_s_ctrl_multi_to_single);
+
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 4a294a5c7bdd..d3a9dde47349 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -1587,6 +1587,82 @@ int v4l2_ctrl_new_fwnode_properties(struct v4l2_ctrl_handler *hdl,
 				    const struct v4l2_ctrl_ops *ctrl_ops,
 				    const struct v4l2_fwnode_device_properties *p);
 
+/**
+ * v4l2_ctrl_new_single_cap_ctrls() - Register single capture controls for
+ *				      backward compatibility
+ *
+ * @hdl: pointer to &struct v4l2_ctrl_handler to register controls on
+ * @ctrl_ops: pointer to &struct v4l2_ctrl_ops to register controls with
+ *
+ * This function registers the single capture controls for exposure
+ * and gains, for backward compatibility with userspace applications that
+ * do not use yet the new, multi-capture controls.
+ *
+ * Currently, the following v4l2 controls are parsed and registered:
+ * - V4L2_CID_EXPOSURE
+ * - V4L2_CID_ANALOGUE_GAIN
+ * - V4L2_CID_DIGITAL_GAIN;
+ *
+ * Controls already registered by the caller with the @hdl control handler are
+ * not overwritten. Callers should register the controls they want to handle
+ * themselves before calling this function.
+ *
+ * Return: 0 on success, a negative error code on failure.
+ */
+int v4l2_ctrl_new_single_cap_ctrls(struct v4l2_ctrl_handler *hdl,
+				   const struct v4l2_ctrl_ops *ctrl_ops);
+
+/**
+ * __v4l2_get_multi_ctrl() - Return the multi-capture controls for a given
+ *			     single-capture control
+ *
+ * @ctrl_single: pointer to &struct v4l2_ctrl for the single-capture control
+ *
+ * This function finds the corresponding multi-capture control for a given
+ * single-capture control.
+ *
+ * This function assumes the control's handler is already locked,
+ * allowing it to be used from within the &v4l2_ctrl_ops functions.
+ *
+ * Return: a pointer to the multi-capture control if found, NULL otherwise.
+ */
+struct v4l2_ctrl *__v4l2_get_multi_ctrl(struct v4l2_ctrl *ctrl_single);
+
+/**
+ * __v4l2_get_single_ctrl() - Return the single-capture controls for a given
+ *			      multi-capture control
+ *
+ * @ctrl_multi: pointer to &struct v4l2_ctrl for the multi-capture control
+ *
+ * This function finds the corresponding single-capture control for a given
+ * multi-capture control.
+ *
+ * This function assumes the control's handler is already locked,
+ * allowing it to be used from within the &v4l2_ctrl_ops functions.
+ *
+ * Return: a pointer to the single-capture control if found, NULL otherwise.
+ */
+struct v4l2_ctrl *__v4l2_get_single_ctrl(struct v4l2_ctrl *ctrl_multi);
+
+/**
+ * __v4l2_s_ctrl_multi_to_single() - Set the single-capture control for a
+ *				     given multi-capture control
+ *
+ * @ctrl_multi: pointer to &struct v4l2_ctrl for the multi-capture control
+ *
+ * This function finds the corresponding single-capture control for a given
+ * multi-capture control, and updates single-capture control with the value
+ * from the first element of the multie-capture control, to ensure
+ * backward compatibility with older user-space applications that still use
+ * the single-capture exposure and gain controls.
+ *
+ * This function assumes the control's handler is already locked,
+ * allowing it to be used from within the &v4l2_ctrl_ops functions.
+ *
+ * Return: 0 on success, a negative error code on failure.
+ */
+int __v4l2_s_ctrl_multi_to_single(struct v4l2_ctrl *ctrl_multi);
+
 /**
  * v4l2_ctrl_type_op_equal - Default v4l2_ctrl_type_ops equal callback.
  *
-- 
2.43.0


