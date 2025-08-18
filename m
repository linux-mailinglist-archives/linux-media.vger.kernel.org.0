Return-Path: <linux-media+bounces-40183-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A41E0B2ADB0
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 18:05:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E103D683FE7
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 15:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3BBC33A022;
	Mon, 18 Aug 2025 15:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="L8BFccHk"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013033.outbound.protection.outlook.com [40.107.159.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4FE3376B8;
	Mon, 18 Aug 2025 15:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755532721; cv=fail; b=gMtl7FkmmofkSTwevHP0e9Qq7UXkVDzxZ+FVKBkKbpojnRiE2xydyBGyPk6bT/sGE/Hr/yRdS22TCFiEpcQuRiUi9bksVR3LViOvB2i+6Nlw/IgNvwhWIwLHFNEAZRYX4NI80BkOA2ijrDaE04zC8TE+RcDiKtRzPJhSr33rRM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755532721; c=relaxed/simple;
	bh=PUURog6llueML+dCSIbpfv65rK4Lyo/Azu3/VhTYRas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s8GE1zxWON3tdDSnYf+GNi47wtAK/06vE+inYwwU7/csyVIB0NJbzomeNqZ1ssQlgLueUpkrVmTxhOpabWSdMI3j7LG71lHL5H6qyZZUaOqibZ1LhPemTzJdADDEYgD8yelcyNJNxLzrtFM+IZ+Gxlz0QBuwGtXI4nrfCuQ42QA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=L8BFccHk; arc=fail smtp.client-ip=40.107.159.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QQU3oBGAXdEFS+9We0oVKZZhzHuz72gXfUoNJXbRkkhaBgpTeQ9EIlH6f8F4s03PjbjAoD/cAQ+XjL2NpVMwwiKoOcDsu8PpPZuD4xV9OszHI3WgsjZxqeuFoJqSDTuJC/AQriPPl+kocwBWkQt5DFE7d4faZnPwYgwXGRx+KKSHEZmU4HFvq6m1b7Jxn5Yhe1wReGWvQgHDDzD/pvZpZxV40deDDSp0gca5/QBSxZSwY82MXmLkFCY/e/Y/MzdGC2p9ZKI+pm/GitIxriayb1g5tgs3cAS7ar23DjUR1+I0JmdB2dT0W7mfD/zYLxHbsgDXQ93q0HLcDjkoSh3KCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3UdjBB/XMxRalbAO3NVlpLboKYQUx3jlyvs7SB47MM=;
 b=EVVdtB5CsNrX8+e6ldjCBJZkYykjHGqNqaybebdAge9sp5+u011sbLqHumtRA2LFl/aWQkVvUJx7dqg9oVuvzR/wIN04qbVhULMosLTbbGiU2EFI4RT6ccQ3vkP+rNzUIWYaL+np+7sIytlqk5ZuwGRsgKgUBkLeTCXilJvqEMHrvhTBRYRQzrAEpTYpo3KdPIwL1AtMFQBT8Ezbb2tYqZTXBGn6I3afWqo6RDX1QdYB6xYgF9W/f2b1crXeRETGF0VuuFLnflrbF8Cx3TzSda1mykNcbmSaN8iArHRJKFcG3Fkf0p0YPsLfS86+r1yiLvObYgg6uqo/CeTuhSfdDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3UdjBB/XMxRalbAO3NVlpLboKYQUx3jlyvs7SB47MM=;
 b=L8BFccHkPSPg5kEx4URdevL8DqC5BgYeSEG4MrpA8/lgpB6xh2pFq3FBwg2ACJ3TlIDTjMChyJEPZQNADrTQ2UvMSFied6YI/pa0mKMX1ykrPoR4hax+L8UpuV0sALc2tjA+dfv8ITgBMotAlonIQzHeuOP1X18ZYQhHBL1lmeWrDo5lcAxaldnKPPCzXhjzlMOCjCNwKv94Qi4m3j+EuubeASWBW6M70BbrAlw4VrnN9tYLbtAATr/0g33H0GyMiDPxEy8yi6LLSA9Jio1LDKw/ZllvWcIx4wFA+/DQn6uGt6TjiBqlzHyTrkR+ccbpr3WBIM0MMpPEusL2IP9xEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by GV4PR04MB11305.eurprd04.prod.outlook.com (2603:10a6:150:297::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Mon, 18 Aug
 2025 15:58:32 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%5]) with mapi id 15.20.9052.011; Mon, 18 Aug 2025
 15:58:32 +0000
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
Subject: [RFC v2 5/5] media: v4l2-ctrls: Add __v4l2_s_ctrl_single_to_multi helper function
Date: Mon, 18 Aug 2025 18:58:09 +0300
Message-ID: <20250818155809.469479-6-mirela.rabulea@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 66e14593-f6c9-4312-94c5-08ddde701492
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|19092799006|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kyf6OOknCnVEUIL04AdE+N3RA7SdZSipe6BlY0+f6VgXiB4TE/hBzECaiCxO?=
 =?us-ascii?Q?pWk+yPJaiSqRDyPS6Dq2sm7C5ulmljq0pNQzZoOzHl4AFMU/WbxBjeGXEK9X?=
 =?us-ascii?Q?15m5CJXP1BZNR/QL1vxRh+mUDqy1ysAAr3sJV898ahjF9d/M1pZUofj+4xyM?=
 =?us-ascii?Q?wj2kJmQ+OAP7zvvYFsqM8vouqrUuQGtuce/6FfJXdAcQqDPydnb2wscW7E9f?=
 =?us-ascii?Q?w8+QpwnZyxQGy2RHZQl7er54DhI4VKkkC2wAiWfxydg6ExNsC6CQ14lBPWNz?=
 =?us-ascii?Q?GYRaj1XUl1y3HfoZIlUfbser3ix0zBCtDnTbekUUiUZxWTprFYI/9S9oguHd?=
 =?us-ascii?Q?fOeK0Ncst9LI3RX+uYkY4b+L+JyikQVOeJ3B+2Or6z0qgNYhvBpP+J8L2+aV?=
 =?us-ascii?Q?PzAOp1J6bvmniVkrbSTL8r8rXZWeWUXT7Rob4N2WJwAHELlctoOOVh/nvGoR?=
 =?us-ascii?Q?l25iakiOkFjo2Byv9dNAW2BgSYYOpnk5Z0QRNXsTnJSD/ZkXb7yV5bhVZ2eI?=
 =?us-ascii?Q?ABcg6cYyl2fjQ5rwMwrW+sjqydlXcLeR9rU3xyaqnwIUMOQ3k5zY6NZMzCT7?=
 =?us-ascii?Q?UTxCzOJZah+3M2n9nlvjFqBvjBZY6q952JBf6lUWFkI3+0cAnRjfR0f0AqRG?=
 =?us-ascii?Q?omj5V6ZyXTB1FDWNSU7MMm6QqeBIj9Wg/wgyWGoHmgjfEPdwm7z3gdKihUaP?=
 =?us-ascii?Q?6WW9NRVkTzf+TQBEav0anWpmTbpWgIrItjg3FcGOwY0dJD+BBeaMKujGlKyQ?=
 =?us-ascii?Q?MQMeCDTFl7UrXs+ptFGjHyywAiUYVXBUGdjEEnBfyV2cfBdlCYyLLY2Yyw1y?=
 =?us-ascii?Q?Ds63CitXB58P6YyoQ9dOkIT5tIpQTNvi1FGUYrPrmtwNrDZSQUUlvbz3eZus?=
 =?us-ascii?Q?E5b2XzQCt9lD12cn/qxFnFmZW/1WnlLsRXItBKAbtnTDvnEZ9ri3Jci2FdDk?=
 =?us-ascii?Q?/5/OFCKZeVCQUDbKO1Fda8nIZlQmwGxJ6NmkjG35PWR4/CHDMKqiuCnIR3q2?=
 =?us-ascii?Q?rTRepiWnJs6rMxLgJw8UK3RFFWuW8iKVKzTsHtCfnCijMVfWAHfYSReYBrz8?=
 =?us-ascii?Q?/poAAm8Za4uBEvD2gX135+sJ99u8H6w8ohHGMBzZQC3LWPkzYCEnY8EEIlPU?=
 =?us-ascii?Q?0pklIySZjfvWEPJ3ueQSS47Q8+m6Kf3RoRNt5Z3CIq5S9++sR21AlNIALf79?=
 =?us-ascii?Q?7PFLYsA8gIWtq25F/VNbnID5V7uPc4rDKVB/VvFt2Kje4jiBR1M7Y7xqATi5?=
 =?us-ascii?Q?GY4EXy7I/3on41zvVnLOXmjxqtv4RsXr/unylcZwGdSSZDlPRp/6hGc17lDw?=
 =?us-ascii?Q?IA2DyYPy/c4zxTVF/e6D3VVmd2iB+h5RMff/qAyhL/NYBplAGWd6puSUKRVv?=
 =?us-ascii?Q?JFLvBxDBHYHlplsE4TjSfxPz9fgJ5ny8Uv1vUE8VaSgiDZ9yCO343Ai/8tL8?=
 =?us-ascii?Q?ihfcJpD971FBaPZjH7eC+lALVF2Rw0qKGW8Hn+ebFYE9RRigldZS/g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MCmwUocif3imXOsUfYI3UZunOqvPBSAOomG8R6O7Np5tWXp45xi1Djux9wMj?=
 =?us-ascii?Q?P6d27LkoieueerwwEPVX/YDl4iR/YsYI+IRWw4Mc861ON97b1OSmCfdchKzL?=
 =?us-ascii?Q?hJ3MucsmZoMntoXRLkkIq/dh9gpbiBmbcQRz4VJrpWJcZ9sCbxN0ZOks0XrW?=
 =?us-ascii?Q?WwTNrKajqlwrRw3kviKcH3t7q3s/fiIk+E5+qdJPJzQU43Vwaj6ooW4ngkMk?=
 =?us-ascii?Q?HoRFBqIPh20EuThcG8lrxZWXPPGuA0/87MuwXHXDBJIZcuNM+VWXxlr0tWzl?=
 =?us-ascii?Q?tIWN9+3CHWN0Pc3n1IzOul6KfEIEE1TounSdtHsQgtMmE+6zKezny1xNtXya?=
 =?us-ascii?Q?Mz0rPUlb85kXLvmiw/dRKnH0MxSzlipy2CLewOff9iHKvuq/+KPZTz/2tnrb?=
 =?us-ascii?Q?1QrzI0KymDD67WHdnUahz4S+XOT29r52HfIP+lIMLQmkKCNDpS0Z4SNAFE4D?=
 =?us-ascii?Q?eFdVY89BMI9C+VoYeUW04TCs7tdWiuzsI8zWsj8zrEMKWnAml6x0AdHlEHD8?=
 =?us-ascii?Q?wPKyFfWGQoVKHooB6ZWN93ixFTXqQCD/a7BUDMlSobK+HrdHHovReocTllt3?=
 =?us-ascii?Q?MDue0myX9/50rK+UuMpRhC1A1oiy2KckEvKwAeT6kqqb/wTEFJ/Ub6wU3b9P?=
 =?us-ascii?Q?DsHIPLfuE2LKveTwcUNvFO2eFdFJtPiYLy3ez6Kjq4NqREBEweITCySfdXXu?=
 =?us-ascii?Q?utawSfKLWQEMNynRSkdLYlxwbEM9c5ye2uDIRunQswcHT3WiJzzazPuq6h/A?=
 =?us-ascii?Q?zzbmzSzepPo4J9m6nN1WGNlHH+1j/WyrSYjaabzc7n7K1MYFte0MPXLA+SAI?=
 =?us-ascii?Q?KC6js2x8O8pzQCXDwNoofvbZ3SSco6dfADaBUlGwCjYyTaQPFKU8mxgdcGkG?=
 =?us-ascii?Q?rogUNGl75iDCGVGaa6VgVvFvEOnnGsj1vtGim0+GRDvgIqFbjzkRF5ZJxNWF?=
 =?us-ascii?Q?Ost5NKYCRkfQx33HzLucjBrzNASJmUC2Z5p+XC8edeIn8H2BxxSYB1kIZjaL?=
 =?us-ascii?Q?9sVXciqBCvJfTVzSbSB83HCxCJIsVfIA4vTYJTw6ldK5/IaFF3+Pa3tASBZz?=
 =?us-ascii?Q?RshL9bQnfxqR1gJoZSg5eT/ZyuuiBW6p7yas5fJY2V1y9gawZ9O0tHzsrKjz?=
 =?us-ascii?Q?mKIHuq8oyzs4BGZkKQLlwJqGL5Be2wcuHRiwdozyTgc7WkcXhTwV9crmfo8d?=
 =?us-ascii?Q?SPMAt7WO6dLiwMRx5NP59WZ3IyKFzbV31F5zzpdJU4JCeCuV/YbhMfeK8jMT?=
 =?us-ascii?Q?uKCTClu1c7TA/RL52K1BW28keG4utC9CElqF5rIur7e1RBnZJqtAJTCScsJJ?=
 =?us-ascii?Q?81tDLUfWBGB8h6klQzCoAYsqVN4sJohzIlDXpjYpFLqv3QZ3OxOB6KM+Hz5S?=
 =?us-ascii?Q?Ah+Rj9jvCcgELWhAf7PjhHMg/HjSu1F4Ybt5BKV1BRBqqHqwZxekSkQDnANk?=
 =?us-ascii?Q?E0nU7YVTMTafBLa2lfuK27YZwA5umV1ObNDJfgu94RdnlPZ9PIppHL6r8Qk7?=
 =?us-ascii?Q?jxFnWcYEgZVeUCNhaksWVbvuIYq+Rr5UnjuYbd60s9MoeI9ui2kOK7BicDEa?=
 =?us-ascii?Q?n63FBYlxDR1m3LjALIyMQs8PvJ0SI7oo78xDjKfGMqqFWRsIWQDooMz9SzGz?=
 =?us-ascii?Q?wQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66e14593-f6c9-4312-94c5-08ddde701492
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 15:58:32.1895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NCW2W1ikaQ1kLbd3Q3sDHlRNT2u7+qNgKIy3dQRq1FS88pvZ+BccgqQLn58gwK6B7Lk3TnWH6dCGJGPuBVlNhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11305

Helper function to be used in new sensor drivers to implement s_ctrl
for single controls for backward compatibility.

This function finds the corresponding multi-capture control for a given
single-capture control, and updates only the value corresponding to the
first capture with the same value as the single-capture control value.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---

Changes in v2:
	New patch
	We need to choose either this patch or patch #4

 drivers/media/v4l2-core/v4l2-ctrls-core.c | 12 ++++++++++++
 include/media/v4l2-ctrls.h                | 17 +++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 8d706070c041..f16809a04c29 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -2823,3 +2823,15 @@ int __v4l2_s_ctrl_multi_to_single(struct v4l2_ctrl *ctrl_multi)
 }
 EXPORT_SYMBOL(__v4l2_s_ctrl_multi_to_single);
 
+int __v4l2_s_ctrl_single_to_multi(struct v4l2_ctrl *ctrl_single)
+{
+	struct v4l2_ctrl *ctrl_multi = __v4l2_get_multi_ctrl(ctrl_single);
+
+	if (!ctrl_multi || !ctrl_single)
+		return -EINVAL;
+
+	ctrl_multi->p_cur.p_u32[0] = ctrl_single->val;
+	return __v4l2_ctrl_s_ctrl_compound(ctrl_multi, V4L2_CTRL_TYPE_U32,
+					  ctrl_multi->p_cur.p_u32);
+}
+EXPORT_SYMBOL(__v4l2_s_ctrl_single_to_multi);
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index d3a9dde47349..ea9973178556 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -1663,6 +1663,23 @@ struct v4l2_ctrl *__v4l2_get_single_ctrl(struct v4l2_ctrl *ctrl_multi);
  */
 int __v4l2_s_ctrl_multi_to_single(struct v4l2_ctrl *ctrl_multi);
 
+/**
+ * __v4l2_s_ctrl_single_to_multi() - Set the multi-capture control for a
+ *				     given single-capture control
+ *
+ * @ctrl_single: pointer to &struct v4l2_ctrl for the single-capture control
+ *
+ * This function finds the corresponding multi-capture control for a given
+ * single-capture control, and updates only the value corresponding to the
+ * first capture with the same value as the single-capture control value.
+ *
+ * This function assumes the control's handler is already locked,
+ * allowing it to be used from within the &v4l2_ctrl_ops functions.
+ *
+ * Return: 0 on success, a negative error code on failure.
+ */
+int __v4l2_s_ctrl_single_to_multi(struct v4l2_ctrl *ctrl_single);
+
 /**
  * v4l2_ctrl_type_op_equal - Default v4l2_ctrl_type_ops equal callback.
  *
-- 
2.43.0


