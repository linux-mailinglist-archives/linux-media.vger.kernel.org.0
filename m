Return-Path: <linux-media+bounces-37431-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A34A3B00E7B
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 00:07:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7356348554B
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 22:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5AE229B8E6;
	Thu, 10 Jul 2025 22:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XyJRsdKO"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011067.outbound.protection.outlook.com [52.101.65.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0460A2949ED;
	Thu, 10 Jul 2025 22:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752185243; cv=fail; b=dsH/SXJARGcmwjYch5h32ES0jsGKBffq3LoAR2o5hljvULHkXvEjPEnanVYG9+ifDPQhHah2Q3oHZqcwN6spAREVq5p9KWfjXBSJcbIetfKwozicr1n7EVVz7gzjjT4t8C/zLYuQGuhDPg4HKAYitXf4I3zp7NECl0VZ2Tk9dAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752185243; c=relaxed/simple;
	bh=aLpjuEOQpCQG/JYfr5U0MWwaYUwmtE1rduLBGEhCkB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qJ70h+BOUVuFhI00Gzp0+L91FbhvScF39fN2AqbqX4H7mR2mx0laLJa6kqDWyvrYhUcc3tUAq8Nv233L2q26SQFLkKIo0dZqU8T+0suvyC36XCyufRCwxe/p1oxUZiBE4lVUJpQ6dG8YUiUZRsSoXXaHKrBva3BnfZYcK2yN810=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XyJRsdKO; arc=fail smtp.client-ip=52.101.65.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BN9YO3BsO3vBguR810lTB0c0Cw9bG3Xd7esoacCnHY2FcJbE5zK5zHcq0csCm/dygGIxK/izPlQtpbwqVk9MNf0JZgggnvJGJSO8CpjxaT1DbJ07VqPrFQmntc8k3CooAKYWbSTYydWorxSyzGGC7lmsNggauW6sat7/hwPfBSA81vypNJ9ZJpT4gLpuq2xgqvs+EKPmOtk6rjTW6X2ohuq0VIG0BLPS8WO44uD3vhJiN4BPujdzkJDDz5UVWOeX1OT8KmO4PfJu01ar5BL9dpwam+sh+KF/8l4mDq53N2Agqku/ZhSiLk14LhHe6f1AuHSqdK13dNWdlgLQgEMaKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iyq4kOppg77wJsbppMB3xHb9pzFXSgcefCPSopoGhk0=;
 b=Ue7eggh0mEbcOJoRwmzIcVBzsAiOMHiBhcFulQzs5wBQ93ZWr3uoDgbftd94LJqbeVuHgw2MJQ3VOSBkow9/uCDCxICLdhRq/mQVp6sHWz8/AgNQU/2ppr6uJmQsRkqlZk542gL71j7NIwcxhsBzY+cuUGJfQO2WDNd+hSjYElZpcJP7LMp7oJvCe5ThzLhpvGwihug/PO0eBEUzBPGWPeOQNIWRvwwF6xJL5ZAEMIhjq4kfEtppIUMKopmvu0q+ciiyxcPp5TMUt9CRShsdT6+nnC9ZRS0AgsQ1EHjO6R1HcYhTSTDZORS2Q99ypm+HUzj/2SEAXr5/xzotcAvDJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iyq4kOppg77wJsbppMB3xHb9pzFXSgcefCPSopoGhk0=;
 b=XyJRsdKOeOTDZgcPeWPgChCUPHH/lbsnQJFXe+y9z1HyW24vp+WTFLccAQlbY89CQDrtolNiAJwwpUTz6vz3wD2lzdZksjRY+0lX2KyJKpVk6dLM36pfo6iVpDbn361ZEoYGoJLAhYkqMjADyTUaXSvAmsYedgEtcutgf5UOMTQjcTiW8bGACeLtLRAdJTQILwofCec+lk0LlJkXA92d3quKHWOC/Mx52CZ0fPsXAqevsa/2JFCTUe7UIvnXZ04S0Johf7tmKVXOhydjYha9RX0GtmzeMIA4n61kuKK3vuklEK1zIo34r4qOwmy0b8pc6rt6LVvqXxGdGLpmrzjf8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by AS1PR04MB9582.eurprd04.prod.outlook.com (2603:10a6:20b:471::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Thu, 10 Jul
 2025 22:07:15 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 22:07:15 +0000
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
Subject: [RFC 1/2] media: Add exposure and gain controls for multiple captures
Date: Fri, 11 Jul 2025 01:05:43 +0300
Message-ID: <20250710220544.89066-2-mirela.rabulea@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250710220544.89066-1-mirela.rabulea@nxp.com>
References: <20250710220544.89066-1-mirela.rabulea@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0211.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::7) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|AS1PR04MB9582:EE_
X-MS-Office365-Filtering-Correlation-Id: 87207365-e89d-49b5-039c-08ddbffe2125
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CWTkWD3kIFBYwORf28487vkQwCAWyFNtOzCUqdW/KITVeVM+uw8fEteth00e?=
 =?us-ascii?Q?vGebEXSbWlaCVIWt9oQL4GucZrzNW+s/YLxrQ8j0AmZaaL1D4Eid5u1VppEG?=
 =?us-ascii?Q?R12dRPJPppb8DrjU1+GrP0JSCV7FoXIL+tRdNL2v4k3SqvbN+gxdOaV0N+Um?=
 =?us-ascii?Q?ftwcplXKIgbvLC8kbDv9vEu1sHzwr4SIhjBZQI0v8sn68rfiaQeacosTM9EO?=
 =?us-ascii?Q?FFiJ2KjnV6kqTyMVtjd0PW8fnuXcipe7UxHITS+y2J9XyKEUT+65gnIBqYWx?=
 =?us-ascii?Q?sw40+EfOTErlRzQbD8lSqQTD9z+pQ4ZeGhYttMFvRhCtH2kYz2cwdgBjxxsJ?=
 =?us-ascii?Q?4m4fIKlIWgIBIInW4E3pArPMmVY9nuEzYzoKM6sgbr2lutmLkHDe2HHaBaR3?=
 =?us-ascii?Q?qNF+tYcuFFLTvDty2eSYApMR3Fh8+6KdUzkjOwu0+TKXUrvlc2GmSfwKAt9v?=
 =?us-ascii?Q?Ud4LLv2yH+V+vZHsDDGD7IRGbcS4DL8feErrz82BLZFOsyVrXuqU8CDeYdaq?=
 =?us-ascii?Q?viGMJ7yNGJksV8z6iynWh+mOB/AmTv+FWYbSRj4/g8NFQzTbqrWbPQIw512q?=
 =?us-ascii?Q?EvevT7Tdr1TPSEDFUdJ9oCAhCeeDNx8mU0RDG+qXP9vmPyYu3n7iFItTaYag?=
 =?us-ascii?Q?sD2qYx9nYzKnKxUxSvaaUxfCt6CQJqMjqkboRXoq0QQ3MUiFZooP7u8VWkS4?=
 =?us-ascii?Q?cqh0Pwa5iK8YQrrGXwgEu8BFFBNZ9vBZ4WJmO1Rvh+PPmaJL6+KFC8EqbO5G?=
 =?us-ascii?Q?zkjPIji6gh/O6vJSAtqgRE/ohT/0OlmIt/lMVfxbHLKuc4gaNHAooM7yYEWi?=
 =?us-ascii?Q?VpLD//iJZzCUiiv7X783MDIr3OoRTniOmNtl0yoHy3s3EJ1FjW3O14KJncOS?=
 =?us-ascii?Q?prJEnUFf2hQd77mqIXCCQEiYQxqm8vSTXnaCDjtzVcFs5lSWPLW3S9ZcuvLL?=
 =?us-ascii?Q?JRyKS4uDABuFv74kj1KemtgGRgyycpi6Hy3OXuVnD5sXSUb8X/8O+FIerp9P?=
 =?us-ascii?Q?lAxYqf0qYI4KPD8t7K1Lnl2nhmJa6o3w2UiEKxMjebOmOxBkOFRPbJzghdlo?=
 =?us-ascii?Q?Dvc6090L6Xm1rIjDiZKBmjHJRGEHvBUKgGOCHzKb7Cvyb4xRWS0LkzPhwLmW?=
 =?us-ascii?Q?hFxSgZsiXj4aKFD6o3yzn0M1eRqQeaWh/qV/7/w9weszDhc5DMbBYQfv3LEy?=
 =?us-ascii?Q?ilefjWgh6WeR5LI6sCYAroYtHrvEk5JVqFjqj7Z+iKhcvlRm2wDaJS2EUnXD?=
 =?us-ascii?Q?wRcbvEoWc8zjQTtkjxrzqE1MwMZ2uhh13AUM/2WiB3gq9KvWH23y73Nuy1iO?=
 =?us-ascii?Q?LkEzvkNS6AJY/rWylE12mSkQRVVhNlheO8upjizLXfjTs5jW4Pv166S7tAYE?=
 =?us-ascii?Q?MqAXs/aKgKdqkPWRk0+5wO+xx7IcSd8rpxgLRJyi3bhh0h+qr42KP7s+YqCE?=
 =?us-ascii?Q?APmFSm6IMZ4f9L2FX7O0xOPFQcZ1xBGhv/lDPOV9WsruA8o3DiYXXQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1nEmDM7jT08jmBHIu8HlKeojpaVRDNhcI/cImX9zTC3Cn6oe39w3CRp2z0MP?=
 =?us-ascii?Q?jwJ63Eqfw6ZUUO8rjuxR+NJ5Iowdd3AGGSWRHNcyLXOkHAwwPBOxjb11sx1I?=
 =?us-ascii?Q?TO0SLypUPqegxBvnFl1ZpbAJjVZdN3l+WXOLY7IHs2txuRPdmri+izU77cQT?=
 =?us-ascii?Q?sEkKMYJlXJo5nj0oZrO3vsCAMTaOCVnz7bq2zJBu4gS+IsaVC8cL7cdYFqJx?=
 =?us-ascii?Q?XiYYNaE/wim9nqe/eTKlg1FvUmB5b5UcY2ktkK2+7beTGGJYBZfk2OOjsiu9?=
 =?us-ascii?Q?GSwr9kQWEsOqlfsv5zaU4rXkX0CL5HAc6+VmR9uA8plq8bgt2JdkfiV6j4R0?=
 =?us-ascii?Q?9S5r3OeevjpkvVSRMY9jOgX/T8b900iFX4IFTuxdGH6z6cZmLBWxeYXRUO+Y?=
 =?us-ascii?Q?gvWa1VY5qr3A0Iv447wob2PE7k8USmfCkS/LIyE1STdpvgqDbnwXKMCwnECb?=
 =?us-ascii?Q?ek9BNOGYPNtucMwNYXr0C44C6TIZfXkQvZHHBvvgSyeyImi5Dybl01hCjX8I?=
 =?us-ascii?Q?U57V7xr/SsTKYgSUGeybdWocy17A92sMzsJe6IiO/q5PUCtF6sLBWw/0Vs9D?=
 =?us-ascii?Q?EN1MzpXLZRAjdWGIs7PRmK7nrJ2skq6fWofKAuKuCfQ5nm8Q6RlZH9ZLvvSp?=
 =?us-ascii?Q?7JQTty9Q7ptKuhswpJ5lcqb3lTCKuXuB/YGDGPNjc1oeWXiBko6TXU5as8pi?=
 =?us-ascii?Q?POciwVB1QQsOyAwp3IkI8HfVPBc0NDmRtnS9OeR91P/tk5oauNcv24Bm65B9?=
 =?us-ascii?Q?gqiRYUzshw1wOD9ElCAehZGUizmdotqP1lreufREl2ovs09efPMelDOreKI7?=
 =?us-ascii?Q?XbqeiDnYTgZLphw4D1l+T16SUr25d9aPz/U5yBOpVff7iWwtC+P2nTVO/Cf0?=
 =?us-ascii?Q?0BR1CJ+As1SYq5MmDgIGtkyjbbl+a/a6tOog6SYdRQNWVLZQkNAJdyXTSRy0?=
 =?us-ascii?Q?L61IZrhOhiwyhnCx4rDDh12xe0AMJAbVP78eXY7OFYPjjf6bquJa3wXNY0hh?=
 =?us-ascii?Q?vu9wwMu+16p3k2r3QPyPjMukZCzbrQgfg6Sqluew+NaReweTCeGZeWxi9J6I?=
 =?us-ascii?Q?WtDIklUpdiotyfcVeocL00rbECSlAWJt8xr4Nu+bbHukL+0Gi96ubzAq3K0F?=
 =?us-ascii?Q?/bFWq9f66IYDpwt/O7TMR0k7pP3sUJcC9y7sy557w6Ukonk12DhHh1MRXJQk?=
 =?us-ascii?Q?IwuUoURis9MGz42wnDj3tse4ON1AiT9MykJnHu+ytTU69bJV+2stbz1i07bA?=
 =?us-ascii?Q?BoVA34qv73iwuwc5biGTPV6gEY5nyxIXWLXI2CcRLWpyEqAA5Esr7lHCMyqe?=
 =?us-ascii?Q?1myOSjxML83u5xMvrXPjQddusGd3gGS2U/oGU/RX8x3BPR1DNpH5I9OjbdvC?=
 =?us-ascii?Q?bBHgdl/BKlA5wSb89uhc1g8dzGJtKvhxzvUoTNSRyeAhWog7AB3gtIF3A3l0?=
 =?us-ascii?Q?qwy3tPRpz4ML7dK2qhjw4j9bHFMSXjBJs4hVJOE1gYg6GXulCq1yGWFk83iv?=
 =?us-ascii?Q?sfs40fNunM1MlsaiGpsIgKRASip64xLJMGfTMZfjFLUi+JHojpxFtJ5Cl/uj?=
 =?us-ascii?Q?PskZplDgJHbpHvKNHpyx7MBmm2ZWVs7VERGMnkye?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87207365-e89d-49b5-039c-08ddbffe2125
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 22:07:15.7097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xt+KWhMzsiOjZb/xrs8d/Z4Weed47e0h9K5DG0A/hWqZrA04b/ab6w1nsmQ/MAEHmpvijMmWmw4ZSHM/Vkw9bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9582

Add V4L2_CID_EXPOSURE_MULTI, V4L2_CID_AGAIN_MULTI and
V4L2_CID_DGAIN_MULTI for exposure and gain control for
multiple exposure sensors.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-defs.c | 8 ++++++++
 include/uapi/linux/v4l2-controls.h        | 3 +++
 2 files changed, 11 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 1ea52011247a..65c468a3b01c 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1155,6 +1155,9 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_TEST_PATTERN_BLUE:	return "Blue Pixel Value";
 	case V4L2_CID_TEST_PATTERN_GREENB:	return "Green (Blue) Pixel Value";
 	case V4L2_CID_NOTIFY_GAINS:		return "Notify Gains";
+	case V4L2_CID_EXPOSURE_MULTI:		return "Exposure, Multiple Captures";
+	case V4L2_CID_AGAIN_MULTI:		return "Analog Gain, Multiple Captures";
+	case V4L2_CID_DGAIN_MULTI:		return "Digital Gain, Multiple Captures";
 
 	/* Image processing controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1607,6 +1610,11 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
 		*type = V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
 		break;
+	case V4L2_CID_EXPOSURE_MULTI:
+	case V4L2_CID_AGAIN_MULTI:
+	case V4L2_CID_DGAIN_MULTI:
+		*type = V4L2_CTRL_TYPE_U32;
+		break;
 	default:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		break;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 974fd254e573..0d5a34a6578e 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1213,6 +1213,9 @@ enum v4l2_jpeg_chroma_subsampling {
 #define V4L2_CID_TEST_PATTERN_GREENB		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 7)
 #define V4L2_CID_UNIT_CELL_SIZE			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 8)
 #define V4L2_CID_NOTIFY_GAINS			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 9)
+#define V4L2_CID_EXPOSURE_MULTI			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 10)
+#define V4L2_CID_AGAIN_MULTI			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 11)
+#define V4L2_CID_DGAIN_MULTI			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 12)
 
 
 /* Image processing controls */
-- 
2.43.0


