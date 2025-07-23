Return-Path: <linux-media+bounces-38245-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02504B0EFC5
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 12:27:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 111A13BEE40
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 10:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6147128DB5B;
	Wed, 23 Jul 2025 10:26:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020123.outbound.protection.outlook.com [52.101.227.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B4F28C2BE;
	Wed, 23 Jul 2025 10:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753266405; cv=fail; b=Xto7HjprnW0qeZrdoJYBAbqB2rPphuWSph/CZ93QzBE2lr4w+1jSgr8nAiQvtjyAvXsgwwgfJCNJCu3A8Ud17JUxQDtH2izOSnAssi4PZ5klPdcS4gw4K6dl30o1NSDcYGQGPk+a88UqswhJnhK+Kg6TJA8alsBliC3ZzTD60ug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753266405; c=relaxed/simple;
	bh=0XCyCZDZY3oz1MxGB/VIvBTzXTm9VERDEb4nY5aBR2s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FBBOdDXeWQyKqBkXx57X09lAbWYo9wQuaxTpHk9VE6ooaHK8yMT9F1k8MG4jzBhewcbJyiw32GynjUhr2dblfEO4QDFeO1WD1sswyK84YIYZLG3RvcIa1yzIMXFyHxEk3mRsxFvtWXzKmiXRRI4MyPLCtFpW7JX3BDPkZ/nGLQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.227.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c93oxmQGx9TtUxWH1PK2PB9YL+GTsnyQEVIuGjqPjWBcIpK7PO1WwDC1/X6pcH5LuTbByR3ajMFx5TPLRfjXo8Yu1Z/9xBxQgOWsL5ygIJEYAnN933Gdm+xa/oWk2z/uw3XUo4gLTUbxO8Zd/7zfxvg6podmxbyCXbHsESOkiXlcuerqeymVozw8x9WHH1LOM3q+fedorG5Q7z4EL4y/fQ9xDopBol8iWbzWixWAVVK3Kd5cC/P7/1dScgudFaSr3Xj+oJKL49sJe/jZNZEUmLCrGhD5f8OqpD/AYz8v6B6E4FoNhcofK/rqi5KXKJxAfsuAi88O9BRinkJHbC8lIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JeU/x8ON6+gem/qNqZrMnJ+95syTqeJk2P1tVYy6/f0=;
 b=agOzjEOKc+K45GOLjiNxykrB6S9uK3zzXwKaMPxOaF52VoNAZJ7gc4fGqAetpql1KEN0TPq0LR9tHiN9s6zgMu3bJgMyy61tYCaLxM28wdy97oS7V/W7fMK3QlKRzRWM7R73EWDu3Vdodb0de+jkbRWulD27Z77JDCYpLgE3e6W9JJAG4A5avbHsSHKP2EmGvk5v2VnSpyL1ZTIVaoVTK26Hp0yuCVG5wsYui+Rn24UlrfQgaXopNhdA0ITTeaoY0oHw3LfDQI+9ZdPRtY++zLQqZNIwFiyHXkEH27oN7I+Ii0vlf+0/PfUbWBBCyvxSO9EvOiA/cUpY35tQHws1NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA5P287MB4064.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:165::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 10:26:38 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%5]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 10:26:38 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hansg@kernel.org>,
	Yunke Cao <yunkec@google.com>,
	James Cowgill <james.cowgill@blaize.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] media: v4l2-ctrls: Add devm_v4l2_ctrl_handler_init() helper
Date: Wed, 23 Jul 2025 15:55:08 +0530
Message-Id: <20250723102515.64585-5-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250723102515.64585-1-tarang.raval@siliconsignals.io>
References: <20250723102515.64585-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BM1PR01CA0152.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::22) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|MA5P287MB4064:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bb5d647-7dca-4c7a-676c-08ddc9d367fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Exj+6RmDeKtlIKLBbPscatpfleB4FmrWES3QgnIHyWjS4cZObQwSazZLrALo?=
 =?us-ascii?Q?NmxQRq6NmAnT4Kc7tM3WryPUnnHKwZenCx00wWOWG2ZUKvKxvXQYs+YiyYhJ?=
 =?us-ascii?Q?ZLkfGX7ctoIcbt4j/PCEVJYZt8XxBLTf1K8+iQ33o4X6IkDwBNLYkkdzUxXd?=
 =?us-ascii?Q?Jx5jCuORe6uZ2IOVPNgHxMQbDAGQDHssTvJtGY09BAd01vxNayhJFnsGDV+Y?=
 =?us-ascii?Q?4kdZttjCm22wbrSiiqk9u7l32J3EaFhHPBIyd4QsbTgQZe+Z/TpFCobFDvnX?=
 =?us-ascii?Q?WmEprYskyyEOtbEYs8tHnSvhqGuMsHRm4RKjhl+jfUFxfy2igbVDUKj3lwb8?=
 =?us-ascii?Q?NmRNnQqmmQqT2/zx8TM9+eXLmmQSrx8N9xgVXb+M8W7VIO2kFjdVPZDtp2ge?=
 =?us-ascii?Q?V4QbDE4znKu/pW0ZN1YE2oCqU+LObmZ8coccLvRzzOv8bpmZXZPVZYM0D4rY?=
 =?us-ascii?Q?xGshL5IqHvDXueRe+mFT5s0PwowveZjgKcJ+Be0rMSIsur1KkMAwdRnO55qd?=
 =?us-ascii?Q?ISHzfBf+Q4W/dBjUKs+Ucjrh42iDRa2fM8XVJ8DOiVHz/HTnSO9iGEiKoIAv?=
 =?us-ascii?Q?p27f03QtX6+ae6gZkRHyZ2Kp3S/PVDDtSKL6Wato8l9Yd43/hvZmSn+6hdmq?=
 =?us-ascii?Q?dzBPibk8LhDiaD4jcjDjrGMOWUJV6Xg0uy2FBkXdHwMYWwH/qa8o8z1kvMax?=
 =?us-ascii?Q?NkBn5N3oROx4RZ1P2XgsxQwbKbDWOrfCF254vIkUKjqjnGA4jMjm28MjZTLd?=
 =?us-ascii?Q?e93rx2W3lHIh40ibEnJS5ItaUzpG2ZB7oTjoUkDMYr5bNC/v1yildzKQ8aq1?=
 =?us-ascii?Q?7/iEdEFKuzWKUPq6bjSMgGfxA+8GhpCqM8Ma7uvbh+8KYictSK9gmV6tUUsB?=
 =?us-ascii?Q?c6rPxG59SP+diCnP9E0eBL7BWnIzxsYDzdug47VT0f8pFwqTkd0s0jblNMHR?=
 =?us-ascii?Q?azlddLAN6gIHjjlovRL+nbdrI8kX93Rw6ArfJeE03sN2FAU6Non2C0p5Y8dR?=
 =?us-ascii?Q?K0vUWINyOCF6KzJbAnKsRzFXVWwwhhB9h5JBU8QjUFUuWva0pF/s38FDGAUm?=
 =?us-ascii?Q?Mt0Te5VozbjijETpfmFyPn44cCHUEzyaaS0tsCpaDbEN1sTVoXh/5DLxOago?=
 =?us-ascii?Q?6y7Go+PzYsf/+GLL44+ky8Q24w45MrE8A9XxZ1HzOaB0tU6epIg24Eio5dsp?=
 =?us-ascii?Q?84J71EK4WhbR2ef7YR78FGL6afiXO7ykTTDeLDTTO4GMA+Dpzv9bf4ixZzyi?=
 =?us-ascii?Q?rm69Ej6/MPewqNwMQWBrB3W66Xe8GyKgcvz5nptm6n2ZrfVpRhDrsRaYZP1v?=
 =?us-ascii?Q?Vs0QwCHMAWOFCqfp35BKZe6zjGnvcCRHg9C67+YU25JPB1gDj2zLi2BtqWEZ?=
 =?us-ascii?Q?UWRnNBjWFJxX8ljDwfTwVAScI3k6IZM9s4uMrCLWYYGfmI2BdbMSFCM36+vR?=
 =?us-ascii?Q?ChuuDsVFgTL9tXve9lxibH4WkPuVDbEyrYWXDZXREwuf0d71iP3nkw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pYxhIzIZaPf7MUnjphJEdT8KJSXT5IHNXjT+9GQe9cF+NBqOwohNth94BQ7C?=
 =?us-ascii?Q?PrBTN0LP7zcwIGnwfi06mc3/usGplKNJen3FqQGT0cgXQXBhlkUTjMnwrulE?=
 =?us-ascii?Q?mK09QosSnPGtRrgR/7pTDvZ2/QhsYkPIsaqMtE8oKUSqPA1gjkJ/lKWCoFZB?=
 =?us-ascii?Q?SrUbjTnrjNtLn4Ru18GbG577QlgNBExEVB5UxSvVKdwmkn+RxC9SYPy6H9aZ?=
 =?us-ascii?Q?ucKOVV56E1XnRth5VCFhD1/AhhNq674+K6fTIN6cMb73KNAe75J5WuMOrZFD?=
 =?us-ascii?Q?ORV03iXHdg4NEvbvgeEfOOHlqirWJ/IRC/2KUKk63vP5/XUQ2/oE42FNAleO?=
 =?us-ascii?Q?wiLHzofECW6+Hl4PTzrHdrCr1VuMHQZQU2petn9qtqRsuCiroViDdsiUFUeF?=
 =?us-ascii?Q?VDwjBBfmsdJPLPHjFBLAMZpSvNkU3l8yVkgyR2u6GBpEpdc8HtFX5wofboDu?=
 =?us-ascii?Q?0Boz+9SPHh3B/QT2hNZRaG6lqK3pqJ2fWMIEJ2TACQyPcyaRMy2UNBbrd2a3?=
 =?us-ascii?Q?CJUIod07PmL36WsgilIacRUBKOEYyDprsUSY0dEQr8uLbaYwSRn8MdxtDOTS?=
 =?us-ascii?Q?MGDqwBnXVedNH7Ed4Ij+nD0ZGhZm29eMCBPLeoKOBQHn8M4/HH3c6cimNJtd?=
 =?us-ascii?Q?GSnEcCRO3kM+mUX80kEwQTSpliq5F01cHWh2HTLLTPRxWAYOm+i9cvw3Ckqq?=
 =?us-ascii?Q?ZQDOZbyr8BytA5GKqNF+Ut8yUQWs36DwjUHc+hluOzf5zhvPgHv0CES50ppv?=
 =?us-ascii?Q?0uaCAKqX9Sr0faXzD38nOHq4dgpoUXPgwa7DvSlDtqlwE8GoinyiaOou6mnO?=
 =?us-ascii?Q?ZQC2v/7NowOBpak10L91FQParZQmgCiFmM0wZ9fNnUM9gJ1BFZNW+eENf/wd?=
 =?us-ascii?Q?Pned+6fRVprnfjAA3OYNY+QzD5eKrQmKGVpMOJjdMtx47+9NInKRi7lmIVu+?=
 =?us-ascii?Q?dCNykb/N7B6MHgZ1wHHqv9Ue4bBge/2328F+79U2AMRLHEeERcAalMpF8Vmj?=
 =?us-ascii?Q?nKHr5iTKz6lCgr9c38Sa9UstSIYANZz8n7otv4wOG+kIMCtrXCn6NaFUVhD3?=
 =?us-ascii?Q?0fnei/VRfIP1n6ByjeXwCf6+NmP65rorrZgnfiWd8/bfyMBuit27oUX6iAn+?=
 =?us-ascii?Q?BF+jAylhgwEJbhjMfXnhnZwQxhqlmA79bpDXaYZhnojKxZhc6krhE41ZVv2f?=
 =?us-ascii?Q?eKIBPpto175MTqwLNQJFqp4yRI32EA7XwB1qSr+fEaMlsDBjgkhCAhvDUANi?=
 =?us-ascii?Q?PteAWWprBK6QGCOMhHTNSPxKc/qjfe8M8nr8RWhyzNv4bi8qNjBo6TgbrKE4?=
 =?us-ascii?Q?euWlFBXrGWUieC/m5umxQa6oCzPKfJKBL14LUAv1w5u6vIaD650O++rdOMI4?=
 =?us-ascii?Q?4yQXRKA8il5gEiAIg84isG3Dmxn+Hq5It2riThx6eSVyRbNEaEqj0238WD3s?=
 =?us-ascii?Q?MYli17sNSkooDUIFlwS3VDc01yoeRN7CzaRyiBaVcdAT/1mN6oI9pT/JUwA4?=
 =?us-ascii?Q?zpCBs2e5yvdV1D7CghjhpGvjA6ihasTMOmVN98l44RPvzJmI37aXMCEsh1ya?=
 =?us-ascii?Q?WgSZPgg0N3HDXv3iTD3J+sg4sWZ6JwUfJz2Hc5P7qq3KCL6fJbgkk7aiNg7C?=
 =?us-ascii?Q?eg=3D=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bb5d647-7dca-4c7a-676c-08ddc9d367fd
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 10:26:38.0310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: //oeyFPKKDcVcsbQqBd14GfTODvd1/9KfXo0b858iJvBY8wymiVT/RnE14YCk/qs72lKE4s9L93zPr98uJV5TsrGa5kHqLXcEpGhMTeTW74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB4064

Add a devm-managed version of v4l2_ctrl_handler_init() to simplify control
handler initialization and cleanup using devres.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 20 ++++++++++++++++++++
 include/media/v4l2-ctrls.h                | 19 +++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 98b960775e87..2c8c46bc8d30 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2010-2021  Hans Verkuil <hverkuil-cisco@xs4all.nl>
  */
 
+#include <linux/device/devres.h>
 #include <linux/export.h>
 #include <linux/mm.h>
 #include <linux/slab.h>
@@ -1671,6 +1672,25 @@ int v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl)
 }
 EXPORT_SYMBOL(v4l2_ctrl_handler_free);
 
+static void devm_v4l2_ctrl_handler_free(void *data)
+{
+	v4l2_ctrl_handler_free(data);
+}
+
+int devm_v4l2_ctrl_handler_init(struct device *dev,
+				struct v4l2_ctrl_handler *hdl,
+				unsigned int nr_of_controls_hint)
+{
+	int err;
+
+	err = v4l2_ctrl_handler_init(hdl, nr_of_controls_hint);
+	if (err)
+		return err;
+
+	return devm_add_action_or_reset(dev, devm_v4l2_ctrl_handler_free, hdl);
+}
+EXPORT_SYMBOL(devm_v4l2_ctrl_handler_init);
+
 /* For backwards compatibility: V4L2_CID_PRIVATE_BASE should no longer
    be used except in G_CTRL, S_CTRL, QUERYCTRL and QUERYMENU when dealing
    with applications that do not use the NEXT_CTRL flag.
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index c32c46286441..dfb956a5ad9a 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -573,6 +573,25 @@ int v4l2_ctrl_handler_init_class(struct v4l2_ctrl_handler *hdl,
 	v4l2_ctrl_handler_init_class(hdl, nr_of_controls_hint, NULL, NULL)
 #endif
 
+/**
+ * devm_v4l2_ctrl_handler_init - Managed initialization of V4L2 control handler
+ *
+ * @dev:                  Device that manages the lifecycle of the control handler.
+ * @hdl:                  Pointer to the V4L2 control handler to initialize.
+ * @nr_of_controls_hint: Estimated number of controls to be added.
+ *
+ * This function initializes a V4L2 control handler and registers a managed
+ * cleanup action to be performed automatically when the device is detached or
+ * the driver is unloaded.
+ *
+ * This is a managed version of v4l2_ctrl_handler_init(), and simplifies resource
+ * management using devres.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int devm_v4l2_ctrl_handler_init(struct device *dev,
+				struct v4l2_ctrl_handler *hdl,
+				unsigned int nr_of_controls_hint);
 /**
  * v4l2_ctrl_handler_free() - Free all controls owned by the handler and free
  * the control list.
-- 
2.34.1


