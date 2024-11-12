Return-Path: <linux-media+bounces-21280-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA0D9C4C68
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 03:18:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C55528927A
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 02:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D606B20822E;
	Tue, 12 Nov 2024 02:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="bu14Lbxz"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022128.outbound.protection.outlook.com [40.107.43.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3F9209F4F;
	Tue, 12 Nov 2024 02:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731377738; cv=fail; b=ejjWqZ4Hw3g+4gapLC7p6ncNyNE+MwrfVi0QCDm4LykopHZQ891H6FvcgS1n4MxToJKFkOLUZswkPnxgSus1fDMzSj0q41TL7nCHdfgJZW4LJ+SZhVzJMYfiVysZsqKElQYSxQqUqG0OsPjkIiJokipPEZDRCTiFPanpe6u98PE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731377738; c=relaxed/simple;
	bh=N3Yj0iMNtUNAZAJAfr3z41w7AjWsEfTQFPQ7kX4I1NU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KFSc9Ijo6Agv7g1RmV1joMCU4WSwhaZlasExHmXTRuEwQdiv0SDQg/oSLynIL7xtFkO+uTgDTh81frImMbH2p85EzEc6PyBpAksB0G5an3RY+iZuyCOkFRqupy8zEsw6E/Sp6lij6988azZIaAQxn31cif5R/rjK2LW71aA4TtA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=bu14Lbxz; arc=fail smtp.client-ip=40.107.43.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tzSEiqPxt0/GrmnAropgh7YmPPUZ0Y8UP2w5cHUgGWmorVI+/CSZzS2iVQpp7vC0DTVmcv8a8pZ4u2fWwVkwL13i67CxcNIpsCE+k3xtjQLzAH5TLpztnSVJupZIJOWYCgHZT9Er9dt9YlYdL+PdKt4S4M/0cHSo3pWdaq2soiVVpItecYOEAL4T/bRBpsCYfUr+ZKG9cC5izGXSrODniO/V5sIecxUMj37I6Aj95wLU1MKlFsAN7I94upeevvkAX4jZCe33jCRXtbsTglZOEu9UZfVNXF9PyEGJ6LnvJH2xENDdQgpIqoZ3nf29BkddNmNj8vhKiCn+1wT0mB+lYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A6MkY9YRYaVg2Xr1l6/qILMXCx7qImi+hmeMOU4PNH4=;
 b=xAVQMwGU1wLNbr/wmFuZYTXLswRUfAtD+MPVXBnl+wmMX1Zqa5vnmGz8NSuK7eeaEfwu8ns932EbA4k5S1x5P+BmoszEzSPvzqrF1/shnORkBfxkc08ZsOn3B070L7Bjm+R9nuinCMZoPraADGFqe+GV3xyConWJmbt6h2fglV5wADkwMKdVBQmJ5Et9tphZe67XXowCNqpubBt77IJF7jOgPrajcu915ZqVqtYxtlFlvezsB9pOSznrhJcsb6wNT9CftxJl9xRveULLYlG+Hf3LNfm15G/Zou/KnyfP91ulf8Cg2mhm4tZUNEE+zE33XUyBMRiBC29sTULYfmC5dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6MkY9YRYaVg2Xr1l6/qILMXCx7qImi+hmeMOU4PNH4=;
 b=bu14Lbxzlrt0W8phnpud91Bys5hSfH2ZGAsPM2L3XCdE+JHQD9sOCDofEWPOod/Fu526+A+eEeXxEoi3lHtlD1Tl+6to0fZBHcQjEf6UNSltv/CpndqTMnG1fnp2Fp/pfTrtiDuiA4rO2T6hVp9KoW2UmdyUuf30dSVlMbIE4hs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SE2P216MB1900.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f8::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.29; Tue, 12 Nov 2024 02:15:26 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%6]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 02:15:26 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	jackson.lee@chipsnmedia.com
Subject: [PATCH v0 3/6] media: chips-media: wave5: Improve performance of decoder
Date: Tue, 12 Nov 2024 11:15:14 +0900
Message-Id: <20241112021517.121-4-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112021517.121-1-jackson.lee@chipsnmedia.com>
References: <20241112021517.121-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0042.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:116::7) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|SE2P216MB1900:EE_
X-MS-Office365-Filtering-Correlation-Id: 6269aab7-27a3-43fd-7c9c-08dd02bfdf46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yl7WMXVlYIeG1cUPWu3UANPIfmx14dG6Q0GGVWZ/uvHpQTJoUjGnkMOFla9i?=
 =?us-ascii?Q?Tp34pZsquy0xT6rvMkZVCpXXSS6AvCpFVrfvBBuXdFfjck2+C5yXUJf4V0Dc?=
 =?us-ascii?Q?ZSDYyhK275RpI5KvH59KIsoOiQhtWkXCd+DxwHa1dm0+rFlrAlywr63RZ6N7?=
 =?us-ascii?Q?Mhi4/KciRYVgYSFBMEMmkbWltnFF/kNeuMvOIQq6+A+OZXv4SobLzmqaDXJG?=
 =?us-ascii?Q?VcK3A5NEvEEy9crZwn2HW61F3JzeAH9KDy9+aeUtA6Wp0AlcfSM6htzcNJjO?=
 =?us-ascii?Q?sxJLpzfbi3aJnfC4H+wa96rbzu8AwLe/gK/zNaT28nLjwzNLe+X+T3YNhKKq?=
 =?us-ascii?Q?ssDDkmFm+BB2ysHj+IGXFeDZazCD93QU/ba1x6ivhB8x6J8m2IeuJxWmHveD?=
 =?us-ascii?Q?X9TfSyfnZjmHWF5XH3sR/56C0GT1IBI7pDFHfL1Q862K+Slgv0uU27aaKN6m?=
 =?us-ascii?Q?S0bRPbvo+iRDO5GtRJ1hqXZdwWjGlwANDvW4WGCYb4RN8Sy13whgspoA7o8E?=
 =?us-ascii?Q?r/K/xynv8IKUlmqBJhC7aq8kqg1mdR+jeUZiC4GBLkk/fktU35uuFBl4y6vH?=
 =?us-ascii?Q?IV8ulKeit1rJWzJRQSBnxTt/ZKMzfrtA48OHCHYCUlAld554OEaOVdyUF1Gn?=
 =?us-ascii?Q?Jeeu5kWTqBehqRQ7T3AjriagEn5nzWa/lwK6AFCWAj3Rav7leIVFVIovHR/G?=
 =?us-ascii?Q?fWAd6DBJjYDa+22QGay1MLAwOdl3ACJtarEIAmCCfB/6BokGPGkLPdTQ91hI?=
 =?us-ascii?Q?HvKDUdAvbh85FqpzFgeZikYmG/g/7XaziY3XhGqPep8YTl1OGQPURweca0m3?=
 =?us-ascii?Q?os8w9h0ZxuebdI4lm2h8I2GmHUh8ur70OpU5hqfDoY7FGyEtUn+0yOzvVJEZ?=
 =?us-ascii?Q?thrxRXdqrQLmK4A/GGD2piHzVVl8zk/tyd4iy8qn/CqKH6Usp3VpKm1JX9dM?=
 =?us-ascii?Q?IiK0teTvDx1u4PdRHUzHmq4FENmv6eZSK+8fiWZC5npfGxprXRf/IZj1OpIW?=
 =?us-ascii?Q?uGKylEIsrzmiL+EqeKjG4z0dE7pKbMpHo2H2Ebdul6y29hEWXCg+Wfc2eab6?=
 =?us-ascii?Q?7a24CuQ3JbmeWdBmYSGcXXbsWqDAPcH0PkE9v5bVR/MN2RqOnv5Em3/jSth1?=
 =?us-ascii?Q?3xWYg3OHiyT6jW789zZObisGRy8umNgFAcg05GEfToWq/fHzZ7BgCIx53Nwx?=
 =?us-ascii?Q?d1DnPAv8KLYSgpGY+SGpdfEUpgtaFKyeg0eUg+ApaInwW88qiCuZY6nu5xBh?=
 =?us-ascii?Q?kwnsv8KnP08xeGVXC/d/DbwOaVLvI/YQNoBMBXA1DRBDgeUpP0Dr5lWLOtdP?=
 =?us-ascii?Q?rtlfcy/KRT3OR9VKH3mGBP6AFgVrvDszpVFUY30BfgibmIHysyXSvzcRZ++s?=
 =?us-ascii?Q?loe7HuY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OPnV+slbNGd1+LovkQ7UJqWnHS/8Xi5hcSUqAWUC77WLAFnU3PLygGxN0Pbv?=
 =?us-ascii?Q?cIMYeAgU/nLVCTxw8RjcFcLz8+c/8sASM5nXkL88WxQ8ib19fp55DKvoy93K?=
 =?us-ascii?Q?jTxGfAzGa1907PgYwGLekbLtTHFSDgYtc2YjduZKKIHQeuIbwoPr/SA5iUJx?=
 =?us-ascii?Q?2B5MIRN/q4AgpxrDQGdojOt467k7JZvrxc6nhmxfWJMLu1Goi+wgv10FLW6y?=
 =?us-ascii?Q?/6fsMMDRCFI+d9SZbOlBN9p5Byh6AF5n3qPI26+wEer20ltQpon8mXb0uR42?=
 =?us-ascii?Q?WVd4IyJV0dZMCDpSN5Itd8HX6mshzDYWHSvqP0ybIHL/IHnjQjfqdeZDeLS/?=
 =?us-ascii?Q?D5pT9p0yihaZOWC/mlz0UWoN1ITDrl6voRXG7Rrx+yyrKD7KbjwqNRmPH65J?=
 =?us-ascii?Q?UZ8BocntXyRoZGhC19LZYSJt+W6GwT9sIg7pXWxEeCAAk2W9lZPzfAIWd0Bp?=
 =?us-ascii?Q?o8qd+r+ZV9SIh8FacTIHMm6qIoALisAXf/lJnqUJAWhjP4wyLaw0aFiGHkB9?=
 =?us-ascii?Q?0hwlWNcMXCKv89kJH715nE8JdBtDSTIJlYOQ0lF7bAeHYGyH/dMSNBpY+m8B?=
 =?us-ascii?Q?rH/XNueg6TcH1KiVCFDHSgo+t2Talu7rH+qWtLh4/c8IYFFU1a1FywSL7hhw?=
 =?us-ascii?Q?GOid3d66RaHDCbtFSwUkK2MTReAthXd8j14t2rjVBOlWgf1sc+cKyL4Xhfly?=
 =?us-ascii?Q?T9LL8vKVS++8aEtRmPuJb/5XRZpVNXEenc9KKQ6FNkwkgSVGUBnBaxngXqjG?=
 =?us-ascii?Q?dYHGU/awA32o0tqWBZu6MIpJ5joDY0MdmQmDInDJdh4q2ye27VeUX/X7dOWF?=
 =?us-ascii?Q?fr1WXsvQnopk5K+WcyFpMa5sG0GMqhEFV+aj7as5+fjSGl/Nx2XztJZIj6lf?=
 =?us-ascii?Q?1/1cSNNw2UKj7oxJAfRgG8bNhi2mV6WJUdbgWi09gsD3krcuXosODzI6MZKO?=
 =?us-ascii?Q?YaQavgKdgYL6zbcCl+7vFsKIajp3WozVALIwbYSiz+cAYSxYUWSsDW4AYnah?=
 =?us-ascii?Q?f9zSPMs8cYoyKhZpi3gjQ10EZLyKJ9Nwe6AWVui4ILBIAM9wT6mSaic8rnDp?=
 =?us-ascii?Q?bT+ESoMEr4BfIBQKR7WLVfrkgwxUnGqMkDkUb0xm15+oY24UF/6DD4oqdiQH?=
 =?us-ascii?Q?Pryf7OSvsugGFFmYpsGfitiPkF5JfWnK67JeodCjczlaL9L/zi/DHkztKq6O?=
 =?us-ascii?Q?q4NNn7ebmjSpbjYhS6uGC1ZiRjD7T1j+I67EJM4X+ZTaL2y3fg+Eg/Foy2uJ?=
 =?us-ascii?Q?OHoKI1wbACKywuiMZkOWrWZGwTUEaoDpVY6hEw2guDGUwRc77vgACpR5+W/r?=
 =?us-ascii?Q?Gh53p9CDbnyoNcp352OlMI43cUVh9gxxAXdGqrUovEKvzYyGqdQd4PU/DO10?=
 =?us-ascii?Q?f2IYqDEhEN3qUTlB0IdQNgZ3r7RYBilbCfd5a3F+BIy+LYaHSJnwmL94bkNk?=
 =?us-ascii?Q?UVBprBEdZ/pQr2iD25lzr8QMSh7uYF/piVf0w7Sp+kgNlRSEZASqIBzmL9LG?=
 =?us-ascii?Q?GyaMezhCUknX/q7KhZJoPhZIlw/sWBNOvSGaWRmyJgCrKzKxLOXdzOBKcMbl?=
 =?us-ascii?Q?/H3Mu4nN/e1HjAKxaplsfKdglyQTG0ApAO+zw+1jWfHx4ii4lCIYcEd3E5jN?=
 =?us-ascii?Q?zg=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6269aab7-27a3-43fd-7c9c-08dd02bfdf46
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 02:15:26.5762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lVHAAp8ZI3wR+dR4qglw2+o/U+zaHDOAl+mD7OXVgSP/k2ThKIJNdxk3DwyeScChLb/npAYiQ3TUf32tUu/3wZ86U4m6xRARXgXZhSOFLpE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB1900

The existing way for decoding frames was to wait until each frame was
decoded after feeding a bitstream. As a result, performance was low
and Wave5 could not achieve max pixel processing rate.

Update driver to use an asynchronous approach for decoding and feeding a
bitstream in order to achieve full capabilities of the device.

Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../platform/chips-media/wave5/wave5-helper.c |   6 +
 .../chips-media/wave5/wave5-vpu-dec.c         | 380 +++++++++++-------
 .../platform/chips-media/wave5/wave5-vpu.c    |   5 +-
 .../platform/chips-media/wave5/wave5-vpuapi.c |   1 +
 .../platform/chips-media/wave5/wave5-vpuapi.h |   6 +
 5 files changed, 251 insertions(+), 147 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.c b/drivers/media/platform/chips-media/wave5/wave5-helper.c
index 2c9d8cbca6e4..2412de290eca 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-helper.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-helper.c
@@ -62,6 +62,12 @@ int wave5_vpu_release_device(struct file *filp,
 	struct vpu_instance *inst = wave5_to_vpu_inst(filp->private_data);
 	int ret = 0;
 
+	if (inst->run_thread) {
+		kthread_stop(inst->run_thread);
+		up(&inst->run_sem);
+		inst->run_thread = NULL;
+	}
+
 	v4l2_m2m_ctx_release(inst->v4l2_fh.m2m_ctx);
 	if (inst->state != VPU_INST_STATE_NONE) {
 		u32 fail_res;
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index d3ff420c52ce..f0db531247ac 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -6,6 +6,9 @@
  */
 
 #include <linux/pm_runtime.h>
+#include <linux/delay.h>
+#include <linux/timer.h>
+#include <linux/atomic.h>
 #include "wave5-helper.h"
 
 #define VPU_DEC_DEV_NAME "C&M Wave5 VPU decoder"
@@ -101,6 +104,24 @@ static const struct vpu_format dec_fmt_list[FMT_TYPES][MAX_FMTS] = {
 	}
 };
 
+static int run_thread(void *data)
+{
+	struct vpu_instance *inst = (struct vpu_instance *)data;
+	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
+
+	while (!kthread_should_stop()) {
+		if (down_interruptible(&inst->run_sem))
+			continue;
+
+		if (kthread_should_stop())
+			break;
+
+		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
+	}
+
+	return 0;
+}
+
 /*
  * Make sure that the state switch is allowed and add logging for debugging
  * purposes
@@ -230,7 +251,6 @@ static int start_decode(struct vpu_instance *inst, u32 *fail_res)
 		switch_state(inst, VPU_INST_STATE_STOP);
 
 		dev_dbg(inst->dev->dev, "%s: pic run failed / finish job", __func__);
-		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
 	}
 
 	return ret;
@@ -347,7 +367,6 @@ static void wave5_vpu_dec_finish_decode(struct vpu_instance *inst)
 	struct vb2_v4l2_buffer *dec_buf = NULL;
 	struct vb2_v4l2_buffer *disp_buf = NULL;
 	struct vb2_queue *dst_vq = v4l2_m2m_get_dst_vq(m2m_ctx);
-	struct queue_status_info q_status;
 
 	dev_dbg(inst->dev->dev, "%s: Fetch output info from firmware.", __func__);
 
@@ -360,11 +379,22 @@ static void wave5_vpu_dec_finish_decode(struct vpu_instance *inst)
 
 	dev_dbg(inst->dev->dev, "%s: rd_ptr %pad wr_ptr %pad", __func__, &dec_info.rd_ptr,
 		&dec_info.wr_ptr);
-	wave5_handle_src_buffer(inst, dec_info.rd_ptr);
 
 	dev_dbg(inst->dev->dev, "%s: dec_info dec_idx %i disp_idx %i", __func__,
 		dec_info.index_frame_decoded, dec_info.index_frame_display);
 
+	if (inst->std == W_AVC_DEC &&
+	    dec_info.index_frame_decoded == DECODED_IDX_FLAG_SKIP &&
+	    dec_info.index_frame_display == DISPLAY_IDX_FLAG_NO_FB) {
+		struct vb2_v4l2_buffer *src_buf = v4l2_m2m_src_buf_remove(m2m_ctx);
+
+		if (src_buf)
+			v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
+		return;
+	}
+
+	wave5_handle_src_buffer(inst, dec_info.rd_ptr);
+
 	if (!vb2_is_streaming(dst_vq)) {
 		dev_dbg(inst->dev->dev, "%s: capture is not streaming..", __func__);
 		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
@@ -441,20 +471,6 @@ static void wave5_vpu_dec_finish_decode(struct vpu_instance *inst)
 		}
 		spin_unlock_irqrestore(&inst->state_spinlock, flags);
 	}
-
-	/*
-	 * During a resolution change and while draining, the firmware may flush
-	 * the reorder queue regardless of having a matching decoding operation
-	 * pending. Only terminate the job if there are no more IRQ coming.
-	 */
-	wave5_vpu_dec_give_command(inst, DEC_GET_QUEUE_STATUS, &q_status);
-	if (q_status.report_queue_count == 0 &&
-	    (q_status.instance_queue_count == 0 || dec_info.sequence_changed)) {
-		dev_dbg(inst->dev->dev, "%s: finishing job.\n", __func__);
-		pm_runtime_mark_last_busy(inst->dev->dev);
-		pm_runtime_put_autosuspend(inst->dev->dev);
-		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
-	}
 }
 
 static int wave5_vpu_dec_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
@@ -465,6 +481,142 @@ static int wave5_vpu_dec_querycap(struct file *file, void *fh, struct v4l2_capab
 	return 0;
 }
 
+static int write_to_ringbuffer(struct vpu_instance *inst, void *buffer, size_t buffer_size,
+			       struct vpu_buf *ring_buffer, dma_addr_t wr_ptr)
+{
+	size_t size;
+	size_t offset = wr_ptr - ring_buffer->daddr;
+	int ret;
+
+	if (wr_ptr + buffer_size > ring_buffer->daddr + ring_buffer->size) {
+		size = ring_buffer->daddr + ring_buffer->size - wr_ptr;
+		ret = wave5_vdi_write_memory(inst->dev, ring_buffer, offset, (u8 *)buffer, size);
+		if (ret < 0)
+			return ret;
+
+		ret = wave5_vdi_write_memory(inst->dev, ring_buffer, 0, (u8 *)buffer + size,
+					     buffer_size - size);
+		if (ret < 0)
+			return ret;
+	} else {
+		ret = wave5_vdi_write_memory(inst->dev, ring_buffer, offset, (u8 *)buffer,
+					     buffer_size);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int fill_ringbuffer(struct vpu_instance *inst)
+{
+	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
+	struct vpu_src_buffer *vpu_buf;
+	int ret = 0;
+
+	if (m2m_ctx->last_src_buf)  {
+		struct vpu_src_buffer *vpu_buf = wave5_to_vpu_src_buf(m2m_ctx->last_src_buf);
+
+		if (vpu_buf->consumed) {
+			dev_dbg(inst->dev->dev, "last src buffer already written\n");
+			return 0;
+		}
+	}
+
+	list_for_each_entry(vpu_buf, &inst->avail_src_bufs, list) {
+		struct vb2_v4l2_buffer *vbuf = &vpu_buf->v4l2_m2m_buf.vb;
+		struct vpu_buf *ring_buffer = &inst->bitstream_vbuf;
+		size_t src_size = vb2_get_plane_payload(&vbuf->vb2_buf, 0);
+		void *src_buf = vb2_plane_vaddr(&vbuf->vb2_buf, 0);
+		dma_addr_t rd_ptr = 0;
+		dma_addr_t wr_ptr = 0;
+		size_t remain_size = 0;
+
+		if (vpu_buf->consumed) {
+			dev_dbg(inst->dev->dev, "already copied src buf (%u) to the ring buffer\n",
+				vbuf->vb2_buf.index);
+			continue;
+		}
+
+		if (!src_buf) {
+			dev_dbg(inst->dev->dev,
+				"%s: Acquiring kernel pointer to src buf (%u), fail\n",
+				__func__, vbuf->vb2_buf.index);
+			break;
+		}
+
+		ret = wave5_vpu_dec_get_bitstream_buffer(inst, &rd_ptr, &wr_ptr, &remain_size);
+		if (ret) {
+			/* Unable to acquire the mutex */
+			dev_err(inst->dev->dev, "Getting the bitstream buffer, fail: %d\n",
+				ret);
+			return ret;
+		}
+
+		dev_dbg(inst->dev->dev, "%s: rd_ptr %pad wr_ptr %pad", __func__, &rd_ptr, &wr_ptr);
+
+		if (remain_size < src_size) {
+			dev_dbg(inst->dev->dev,
+				"%s: remaining size: %zu < source size: %zu for src buf (%u)\n",
+				__func__, remain_size, src_size, vbuf->vb2_buf.index);
+			break;
+		}
+
+		ret = write_to_ringbuffer(inst, src_buf, src_size, ring_buffer, wr_ptr);
+		if (ret) {
+			dev_err(inst->dev->dev, "Write src buf (%u) to ring buffer, fail: %d\n",
+				vbuf->vb2_buf.index, ret);
+			return ret;
+		}
+
+		ret = wave5_vpu_dec_update_bitstream_buffer(inst, src_size);
+		if (ret) {
+			dev_dbg(inst->dev->dev,
+				"update_bitstream_buffer fail: %d for src buf (%u)\n",
+				ret, vbuf->vb2_buf.index);
+			break;
+		}
+
+		vpu_buf->consumed = true;
+
+		/* Don't write buffers passed the last one while draining. */
+		if (v4l2_m2m_is_last_draining_src_buf(m2m_ctx, vbuf)) {
+			dev_dbg(inst->dev->dev, "last src buffer written to the ring buffer\n");
+			break;
+		}
+
+		inst->queuing_num++;
+		list_del_init(&vpu_buf->list);
+		break;
+	}
+
+	return ret;
+}
+
+static void wave5_vpu_dec_feed_remaining(struct vpu_instance *inst)
+{
+	int ret = 0;
+	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
+	u32 fail_res = 0;
+
+	mutex_lock(&inst->feed_lock);
+	ret = fill_ringbuffer(inst);
+	mutex_unlock(&inst->feed_lock);
+	if (ret) {
+		dev_warn(inst->dev->dev, "Filling ring buffer failed\n");
+		return;
+	}
+
+	ret = start_decode(inst, &fail_res);
+	if (ret) {
+		dev_err(inst->dev->dev,
+			"Frame decoding on m2m context (%p), fail: %d (result: %d)\n",
+			m2m_ctx, ret, fail_res);
+	}
+
+	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
+}
+
 static int wave5_vpu_dec_enum_framesizes(struct file *f, void *fh, struct v4l2_frmsizeenum *fsize)
 {
 	const struct vpu_format *vpu_fmt;
@@ -794,11 +946,21 @@ static int wave5_vpu_dec_stop(struct vpu_instance *inst)
 	}
 
 	if (inst->state != VPU_INST_STATE_NONE) {
+		struct vb2_v4l2_buffer *vbuf;
+		struct vpu_src_buffer *vpu_buf;
+
 		/*
 		 * Temporarily release the state_spinlock so that subsequent
 		 * calls do not block on a mutex while inside this spinlock.
 		 */
 		spin_unlock_irqrestore(&inst->state_spinlock, flags);
+		vbuf = v4l2_m2m_last_src_buf(m2m_ctx);
+		if (vbuf) {
+			vpu_buf = wave5_to_vpu_src_buf(vbuf);
+			if (!vpu_buf->consumed)
+				wave5_vpu_dec_feed_remaining(inst);
+		}
+
 		ret = wave5_vpu_dec_set_eos_on_firmware(inst);
 		if (ret)
 			return ret;
@@ -1116,115 +1278,6 @@ static int wave5_prepare_fb(struct vpu_instance *inst)
 	return 0;
 }
 
-static int write_to_ringbuffer(struct vpu_instance *inst, void *buffer, size_t buffer_size,
-			       struct vpu_buf *ring_buffer, dma_addr_t wr_ptr)
-{
-	size_t size;
-	size_t offset = wr_ptr - ring_buffer->daddr;
-	int ret;
-
-	if (wr_ptr + buffer_size > ring_buffer->daddr + ring_buffer->size) {
-		size = ring_buffer->daddr + ring_buffer->size - wr_ptr;
-		ret = wave5_vdi_write_memory(inst->dev, ring_buffer, offset, (u8 *)buffer, size);
-		if (ret < 0)
-			return ret;
-
-		ret = wave5_vdi_write_memory(inst->dev, ring_buffer, 0, (u8 *)buffer + size,
-					     buffer_size - size);
-		if (ret < 0)
-			return ret;
-	} else {
-		ret = wave5_vdi_write_memory(inst->dev, ring_buffer, offset, (u8 *)buffer,
-					     buffer_size);
-		if (ret < 0)
-			return ret;
-	}
-
-	return 0;
-}
-
-static int fill_ringbuffer(struct vpu_instance *inst)
-{
-	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
-	struct v4l2_m2m_buffer *buf, *n;
-	int ret;
-
-	if (m2m_ctx->last_src_buf)  {
-		struct vpu_src_buffer *vpu_buf = wave5_to_vpu_src_buf(m2m_ctx->last_src_buf);
-
-		if (vpu_buf->consumed) {
-			dev_dbg(inst->dev->dev, "last src buffer already written\n");
-			return 0;
-		}
-	}
-
-	v4l2_m2m_for_each_src_buf_safe(m2m_ctx, buf, n) {
-		struct vb2_v4l2_buffer *vbuf = &buf->vb;
-		struct vpu_src_buffer *vpu_buf = wave5_to_vpu_src_buf(vbuf);
-		struct vpu_buf *ring_buffer = &inst->bitstream_vbuf;
-		size_t src_size = vb2_get_plane_payload(&vbuf->vb2_buf, 0);
-		void *src_buf = vb2_plane_vaddr(&vbuf->vb2_buf, 0);
-		dma_addr_t rd_ptr = 0;
-		dma_addr_t wr_ptr = 0;
-		size_t remain_size = 0;
-
-		if (vpu_buf->consumed) {
-			dev_dbg(inst->dev->dev, "already copied src buf (%u) to the ring buffer\n",
-				vbuf->vb2_buf.index);
-			continue;
-		}
-
-		if (!src_buf) {
-			dev_dbg(inst->dev->dev,
-				"%s: Acquiring kernel pointer to src buf (%u), fail\n",
-				__func__, vbuf->vb2_buf.index);
-			break;
-		}
-
-		ret = wave5_vpu_dec_get_bitstream_buffer(inst, &rd_ptr, &wr_ptr, &remain_size);
-		if (ret) {
-			/* Unable to acquire the mutex */
-			dev_err(inst->dev->dev, "Getting the bitstream buffer, fail: %d\n",
-				ret);
-			return ret;
-		}
-
-		dev_dbg(inst->dev->dev, "%s: rd_ptr %pad wr_ptr %pad", __func__, &rd_ptr, &wr_ptr);
-
-		if (remain_size < src_size) {
-			dev_dbg(inst->dev->dev,
-				"%s: remaining size: %zu < source size: %zu for src buf (%u)\n",
-				__func__, remain_size, src_size, vbuf->vb2_buf.index);
-			break;
-		}
-
-		ret = write_to_ringbuffer(inst, src_buf, src_size, ring_buffer, wr_ptr);
-		if (ret) {
-			dev_err(inst->dev->dev, "Write src buf (%u) to ring buffer, fail: %d\n",
-				vbuf->vb2_buf.index, ret);
-			return ret;
-		}
-
-		ret = wave5_vpu_dec_update_bitstream_buffer(inst, src_size);
-		if (ret) {
-			dev_dbg(inst->dev->dev,
-				"update_bitstream_buffer fail: %d for src buf (%u)\n",
-				ret, vbuf->vb2_buf.index);
-			break;
-		}
-
-		vpu_buf->consumed = true;
-
-		/* Don't write buffers passed the last one while draining. */
-		if (v4l2_m2m_is_last_draining_src_buf(m2m_ctx, vbuf)) {
-			dev_dbg(inst->dev->dev, "last src buffer written to the ring buffer\n");
-			break;
-		}
-	}
-
-	return 0;
-}
-
 static void wave5_vpu_dec_buf_queue_src(struct vb2_buffer *vb)
 {
 	struct vpu_instance *inst = vb2_get_drv_priv(vb->vb2_queue);
@@ -1236,6 +1289,11 @@ static void wave5_vpu_dec_buf_queue_src(struct vb2_buffer *vb)
 	vbuf->sequence = inst->queued_src_buf_num++;
 
 	v4l2_m2m_buf_queue(m2m_ctx, vbuf);
+
+	INIT_LIST_HEAD(&vpu_buf->list);
+	mutex_lock(&inst->feed_lock);
+	list_add_tail(&vpu_buf->list, &inst->avail_src_bufs);
+	mutex_unlock(&inst->feed_lock);
 }
 
 static void wave5_vpu_dec_buf_queue_dst(struct vb2_buffer *vb)
@@ -1287,10 +1345,13 @@ static void wave5_vpu_dec_buf_queue(struct vb2_buffer *vb)
 		__func__, vb->type, vb->index, vb2_plane_size(&vbuf->vb2_buf, 0),
 		vb2_plane_size(&vbuf->vb2_buf, 1), vb2_plane_size(&vbuf->vb2_buf, 2));
 
-	if (vb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+	if (vb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		if (inst->empty_queue)
+			inst->empty_queue = false;
 		wave5_vpu_dec_buf_queue_src(vb);
-	else if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+	} else if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
 		wave5_vpu_dec_buf_queue_dst(vb);
+	}
 }
 
 static int wave5_vpu_dec_allocate_ring_buffer(struct vpu_instance *inst)
@@ -1369,6 +1430,13 @@ static int streamoff_output(struct vb2_queue *q)
 	struct vb2_v4l2_buffer *buf;
 	int ret;
 	dma_addr_t new_rd_ptr;
+	struct vpu_src_buffer *vpu_buf, *tmp;
+
+	inst->retry = false;
+	inst->queuing_num = 0;
+
+	list_for_each_entry_safe(vpu_buf, tmp, &inst->avail_src_bufs, list)
+		list_del_init(&vpu_buf->list);
 
 	while ((buf = v4l2_m2m_src_buf_remove(m2m_ctx))) {
 		dev_dbg(inst->dev->dev, "%s: (Multiplanar) buf type %4u | index %4u\n",
@@ -1445,6 +1513,7 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
 
 	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
 	pm_runtime_resume_and_get(inst->dev->dev);
+	inst->empty_queue = false;
 
 	while (check_cmd) {
 		struct queue_status_info q_status;
@@ -1452,10 +1521,8 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
 
 		wave5_vpu_dec_give_command(inst, DEC_GET_QUEUE_STATUS, &q_status);
 
-		if (q_status.report_queue_count == 0)
-			break;
-
-		if (wave5_vpu_wait_interrupt(inst, VPU_DEC_TIMEOUT) < 0)
+		if ((inst->state == VPU_INST_STATE_STOP || q_status.instance_queue_count == 0) &&
+		    q_status.report_queue_count == 0)
 			break;
 
 		if (wave5_vpu_dec_get_output_info(inst, &dec_output_info))
@@ -1548,13 +1615,24 @@ static void wave5_vpu_dec_device_run(void *priv)
 	struct queue_status_info q_status;
 	u32 fail_res = 0;
 	int ret = 0;
+	unsigned long flags;
 
 	dev_dbg(inst->dev->dev, "%s: Fill the ring buffer with new bitstream data", __func__);
 	pm_runtime_resume_and_get(inst->dev->dev);
-	ret = fill_ringbuffer(inst);
-	if (ret) {
-		dev_warn(inst->dev->dev, "Filling ring buffer failed\n");
-		goto finish_job_and_return;
+	if (!inst->retry) {
+		mutex_lock(&inst->feed_lock);
+		ret = fill_ringbuffer(inst);
+		mutex_unlock(&inst->feed_lock);
+		if (ret < 0) {
+			dev_warn(inst->dev->dev, "Filling ring buffer failed\n");
+			goto finish_job_and_return;
+		} else if (!inst->eos &&
+			   inst->queuing_num == 0 &&
+			   inst->state == VPU_INST_STATE_PIC_RUN) {
+			dev_dbg(inst->dev->dev, "%s: no bitstream for feeding, so skip ", __func__);
+			inst->empty_queue = true;
+			goto finish_job_and_return;
+		}
 	}
 
 	switch (inst->state) {
@@ -1590,7 +1668,9 @@ static void wave5_vpu_dec_device_run(void *priv)
 		 * we had a chance to switch, which leads to an invalid state
 		 * change.
 		 */
+		spin_lock_irqsave(&inst->state_spinlock, flags);
 		switch_state(inst, VPU_INST_STATE_PIC_RUN);
+		spin_unlock_irqrestore(&inst->state_spinlock, flags);
 
 		/*
 		 * During DRC, the picture decoding remains pending, so just leave the job
@@ -1605,12 +1685,14 @@ static void wave5_vpu_dec_device_run(void *priv)
 		ret = wave5_prepare_fb(inst);
 		if (ret) {
 			dev_warn(inst->dev->dev, "Framebuffer preparation, fail: %d\n", ret);
+			spin_lock_irqsave(&inst->state_spinlock, flags);
 			switch_state(inst, VPU_INST_STATE_STOP);
+			spin_unlock_irqrestore(&inst->state_spinlock, flags);
 			break;
 		}
 
 		if (q_status.instance_queue_count) {
-			dev_dbg(inst->dev->dev, "%s: leave with active job", __func__);
+			v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
 			return;
 		}
 
@@ -1621,11 +1703,17 @@ static void wave5_vpu_dec_device_run(void *priv)
 			dev_err(inst->dev->dev,
 				"Frame decoding on m2m context (%p), fail: %d (result: %d)\n",
 				m2m_ctx, ret, fail_res);
-			break;
+			goto finish_job_and_return;
 		}
 		/* Return so that we leave this job active */
-		dev_dbg(inst->dev->dev, "%s: leave with active job", __func__);
-		return;
+		if (fail_res == WAVE5_SYSERR_QUEUEING_FAIL) {
+			inst->retry = true;
+		} else {
+			inst->retry = false;
+			if (!inst->eos)
+				inst->queuing_num--;
+		}
+		break;
 	default:
 		WARN(1, "Execution of a job in state %s illegal.\n", state_to_str(inst->state));
 		break;
@@ -1633,9 +1721,7 @@ static void wave5_vpu_dec_device_run(void *priv)
 
 finish_job_and_return:
 	dev_dbg(inst->dev->dev, "%s: leave and finish job", __func__);
-	pm_runtime_mark_last_busy(inst->dev->dev);
-	pm_runtime_put_autosuspend(inst->dev->dev);
-	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
+	up(&inst->run_sem);
 }
 
 static void wave5_vpu_dec_job_abort(void *priv)
@@ -1686,7 +1772,8 @@ static int wave5_vpu_dec_job_ready(void *priv)
 				"No capture buffer ready to decode!\n");
 			break;
 		} else if (!wave5_is_draining_or_eos(inst) &&
-			   !v4l2_m2m_num_src_bufs_ready(m2m_ctx)) {
+			   (!v4l2_m2m_num_src_bufs_ready(m2m_ctx) ||
+			    inst->empty_queue)) {
 			dev_dbg(inst->dev->dev,
 				"No bitstream data to decode!\n");
 			break;
@@ -1726,6 +1813,8 @@ static int wave5_vpu_open_dec(struct file *filp)
 	inst->ops = &wave5_vpu_dec_inst_ops;
 
 	spin_lock_init(&inst->state_spinlock);
+	mutex_init(&inst->feed_lock);
+	INIT_LIST_HEAD(&inst->avail_src_bufs);
 
 	inst->codec_info = kzalloc(sizeof(*inst->codec_info), GFP_KERNEL);
 	if (!inst->codec_info)
@@ -1797,6 +1886,9 @@ static int wave5_vpu_open_dec(struct file *filp)
 	if (inst->dev->product_code != WAVE515_CODE)
 		wave5_vdi_allocate_sram(inst->dev);
 
+	sema_init(&inst->run_sem, 1);
+	inst->run_thread = kthread_run(run_thread, inst, "run thread");
+
 	ret = mutex_lock_interruptible(&dev->dev_lock);
 	if (ret)
 		goto cleanup_inst;
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
index 63a607d10433..a9bd96cbf9ac 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
@@ -51,7 +51,7 @@ static void wave5_vpu_handle_irq(void *dev_id)
 	u32 seq_done;
 	u32 cmd_done;
 	u32 irq_reason;
-	struct vpu_instance *inst;
+	struct vpu_instance *inst, *tmp;
 	struct vpu_device *dev = dev_id;
 
 	irq_reason = wave5_vdi_read_register(dev, W5_VPU_VINT_REASON);
@@ -60,8 +60,7 @@ static void wave5_vpu_handle_irq(void *dev_id)
 	wave5_vdi_write_register(dev, W5_VPU_VINT_REASON_CLR, irq_reason);
 	wave5_vdi_write_register(dev, W5_VPU_VINT_CLEAR, 0x1);
 
-	list_for_each_entry(inst, &dev->instances, list) {
-
+	list_for_each_entry_safe(inst, tmp, &dev->instances, list) {
 		if (irq_reason & BIT(INT_WAVE5_INIT_SEQ) ||
 		    irq_reason & BIT(INT_WAVE5_ENC_SET_PARAM)) {
 			if (dev->product_code == WAVE515_CODE &&
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
index e16b990041c2..a5b1966530c0 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
@@ -247,6 +247,7 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 
 unlock_and_return:
 	mutex_unlock(&vpu_dev->hw_lock);
+	mutex_destroy(&inst->feed_lock);
 	pm_runtime_put_sync(inst->dev->dev);
 	return ret;
 }
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
index 45615c15beca..7cdb5b5fe3e4 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
@@ -812,11 +812,17 @@ struct vpu_instance {
 	bool cbcr_interleave;
 	bool nv21;
 	bool eos;
+	bool retry;
+	bool empty_queue;
+	int queuing_num;
+	struct mutex feed_lock; /* lock for feeding bitstream buffers */
 	struct vpu_buf bitstream_vbuf;
 	dma_addr_t last_rd_ptr;
 	size_t remaining_consumed_bytes;
 	bool needs_reallocation;
 
+	struct semaphore run_sem;
+	struct task_struct *run_thread;
 	unsigned int min_src_buf_count;
 	unsigned int rot_angle;
 	unsigned int mirror_direction;
-- 
2.43.0


