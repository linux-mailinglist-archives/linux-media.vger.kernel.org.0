Return-Path: <linux-media+bounces-61119-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIhKNT7ZAWrPlQEAu9opvQ
	(envelope-from <linux-media+bounces-61119-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 15:27:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D8550EDEC
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 15:27:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D20C53014FF2
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 13:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A1A43EF0DD;
	Mon, 11 May 2026 13:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aMX1Ld1g"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010002.outbound.protection.outlook.com [52.101.84.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A393EC2C4;
	Mon, 11 May 2026 13:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778506019; cv=fail; b=qCm86yZxjD+X/2kuhKsoMx2n9yzxdi3LgnuI80xzCOMjPYEp8OZB8RI9xcVrCdQpMowJEm56Uwzgtv5D2mWuXV/cdEA5FM5+XEh2tkmfjBYCjnv/F8ygwmlZsSjdyCnywTQHLK3FBW6btZqcU1FrBk6Ba6XvbcldzIo0ftQcOes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778506019; c=relaxed/simple;
	bh=ZblxMF3XO0r735LHe2Qfj3yBqap3VC+TDPhm9m3z5UM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jB3EzcHhx8wQvvf6VB3OKU86rDqvDRAZ66A9l62TQRZ/Flhnw1ugLgkbZdvlVvspLOsANOdZG5iZqwo3QmSQzf3MOcX3EQLzkdi9HKbf9RjU/9rQxxiXQKYsR81K1lM9PZT3fbPfB7ZHfSSpVP0RyNPWZuZrGtblOMl9FWukovU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aMX1Ld1g; arc=fail smtp.client-ip=52.101.84.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x9POOlZdr1mQ4ZnqUGk2CGrN3AF0nHEQkB04HOKhO3al/QBsBgaFPPucND24tHShRENNUn3DL4hk90SocMCiEcEIciu2rmkGJEDLyjQvF+A5vkUfi7M9m6/AL3k6xBe6OQCRohTWJRiqjP+tY2lurCPF8g+uwqqnfDPFT5/qhyqJmbM3zL28bMFZqklCYYEKo/RCQLml90vLdqNWDKJDxArKLYkP0+6ZSrQwwqMRVbUJ8fkddEHh357OItjPgt1J/dKDfeBypaYxLqX05jzUK8ksRhE0zU4s2MV4VGxk1aVNqhHYZwGG+A+wXW2DR0BlecbM6acAYh/uG7Gm0UJ0CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=szOGATBoG6c0ElDtzSEhGSVABu4lxGMFTG6K6Mij/eM=;
 b=gefCQmXI4AZqrI93FGx3kbn59XhYVBFq80b7+XhpxhkRh885Swy1A0ASimBn6jX+8WqqtVPURc7mcKxbHV4KPG049JxczDIEimJX2osHI0/J+RS2l/fzwu5nGiBFlClDazpPEEbnXAp+h2rnLw9GQvUR9lNUEEnTk0MKWg89Z1W4276zt5DjENCHHJMuH+MHiCTstcGwNU3QGgdW516EMCViPDXQ7PfSrqJ9kUCEs5JY54Aoypvrc5wEGa3NwmQUk+e83wQGeRIb6eU/lE/LklQ3oSN1EEBxuVRtgpYLhWTI1Su0Zz9eIKbpB5BevM5tF6xgDkiN1OmQWmu5QSapJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=szOGATBoG6c0ElDtzSEhGSVABu4lxGMFTG6K6Mij/eM=;
 b=aMX1Ld1g/Zg5azq3UfXPYSKHZyU78iVHUXHodzUjZ7pMoW2f63XdnvcKqUD8d8jvPgOOW78zUYp/tVh3WCJouB1eIA1kmdG/ftVowjahtGz8Sru4et/n0QAKhjGrhs/NmtUWSLEqPkq+WMjs0iJPWppsInOoYkbGFBYPUmtB3F4xyecwOhQcm3YvK1MtlajaWfLBCAyI4aH4ssoMi3qaU6WieYOlomUr0N6UQxvAyHXgAzzbK6b3RKt3q75wImcXXLDDzkfdc3pGdaI5e/yWX1YiN6ORHG+z/U9SClKLiw+PR8oE9xuQbIGHdx2Te5ibJ4w6fyIVvlbBunBd98QLyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by AM9PR04MB8131.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ed::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 13:26:54 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 13:26:54 +0000
From: Antoine Bouyer <antoine.bouyer@nxp.com>
To: julien.vuillaumier@nxp.com,
	alexi.birlinger@nxp.com,
	daniel.baluta@nxp.com,
	peng.fan@nxp.com,
	frank.li@nxp.com,
	jacopo.mondi@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	michael.riesch@collabora.com,
	anthony.mcgivern@arm.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	ai.luthra@ideasonboard.com,
	paul.elder@ideasonboard.com,
	geert@linux-m68k.org,
	Antoine Bouyer <antoine.bouyer@nxp.com>
Subject: [PATCH v2 2/8] media: v4l2-ctrls: Add user control base for NXP neoisp controls
Date: Mon, 11 May 2026 15:26:22 +0200
Message-ID: <20260511132629.1300868-3-antoine.bouyer@nxp.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260511132629.1300868-1-antoine.bouyer@nxp.com>
References: <20260511132629.1300868-1-antoine.bouyer@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::19) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|AM9PR04MB8131:EE_
X-MS-Office365-Filtering-Correlation-Id: 754f6cc7-cb9e-4f18-2d7c-08deaf60f7e3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|19092799006|22082099003|56012099003|18002099003|11063799003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 wdq9xaVkuPuHX5ZkPCISb6EVFU5uTAO51hLRE2UAwQ326ySmZDseRiZ2YP2klsANKSgP3Q0uEA0Z75Y/BoXmHvWXN+RoXLe3qWjxYsuTudr6gPLuhGPr4r82tTUUJnj6YG8WdcjRvsjVnpRb4ErS1bvb0CVFeIvDtTuHbhb9+YOZXcMjkMeQA3ZQWKNTtr31N7M/KjfSL0PEi1uExXL29tH8kc/lQ6WItLBBAFfEIUVSpR7HzeRYqAPjADqzxLdzWzOlKNwbf7UbZQfW7dQDbOACt3AwsgsFeoRWdYDNaeek/XQ5m7dSOXlTPRsa0Vbj11ns6zvWwPRUS68cKrhenrLl4cdfc3QLYM/9e8kORCqGkAYu8upjurcGQzDvhVGOmn97a9NduMWRmn0hy+Z59Q2SLGCKvFtOMKTnAVh5J9Qj5e7g42KFThezdolBBBn9RitbJkluAF2xz9TBkYAh93kEz6YoMqMFEcqYkp2UyBl4e0cvMA4YM3wec7jsHaR05jegPJdx58b2W2FuHmJNh2hJO4TCRRH8w/6y7CITcokhNufqWPjNPIQnlnjCXmdfqUXRM/dDdbpu7DO/OvNhOKwI86/DrKoWMsLn4AAKz2WcY5zsvoxlEpUCMTcuFUzl0d4oWVGK5RkYAs2EClKomb4mGmBNwuYj8np9u/t+vpvWRLhngXCCbIce22jYMGPaQEYOa2ti58xe8u4DjPZsh7QP+TzYbL24OqCModwRXXUS9iTGAgupU9LvaqIgB+ZEDVFHO5sN8Uk5oek4ehQcIQ==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(19092799006)(22082099003)(56012099003)(18002099003)(11063799003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Q4WwmD1xJXfdp8hxh2xyt1jiC80bXYALy+2NMqIAm8mFufo19GLgpjpDNl+A?=
 =?us-ascii?Q?qeR9f6Umb8SBDC16EyAo2qqW5ZgV+MUzt8VvV51MzdSLqzrvb+pajs/7E0MU?=
 =?us-ascii?Q?4pzY/1L97A0Wc/K62wFNBoSJ9/QxPZD7GBDY0FBRf9x0Woc41nVwmGhQGR2q?=
 =?us-ascii?Q?pVzeqcIzlyL1xvAPnBCkCphLkPjUfq+9medHSHhtHGMTXTaRqZm+ewN6jaSM?=
 =?us-ascii?Q?frh1V3Y+JDgbKGQ3tnShLA7X/EEO2bZOwojAyUdk/2+GmZPkjJHMxug/PsRB?=
 =?us-ascii?Q?215AeE85+GNDRD0eoEMZss5zNprz/5RQCLs5pbu/SzHxhcncCGp3pJZbbNfy?=
 =?us-ascii?Q?QQNKiiR/B3IJWTQ25ux8SOnvXl9bjS343NASq6/ohsEnOz7vG61dEiFrrFzx?=
 =?us-ascii?Q?9i2+gbf9rknUzfqSPJx4++2K+wpUezsus6ZwZzfSsfZRLIkBe1H1rHmQI3wy?=
 =?us-ascii?Q?Rn5VxrMR9+OVslCgiGuv8DgYacy3gF/pxPCUk5SS7lxRL0rAs5uDQSF5SoIX?=
 =?us-ascii?Q?aGC6XKGCakbdbXrr32mEcPw19QM421XFO0et9jMSDYUfv427xw1KN0nr99gT?=
 =?us-ascii?Q?gWxGi1L169o7Aj/aCjvTZ+Hhi/C4WNKZvIIg5UlnrbmxTkLKHFQW5lGTX+Yt?=
 =?us-ascii?Q?VWianW29p0iDOEW8AmHOWzzrSTQZ3ajGUrzbdFSCUNMLpPrarwCaQIzUCxcN?=
 =?us-ascii?Q?Pzs9j7CX1m+H6SO26eN3Rh+SDJf3tRhrh+k1OC5mfvAypP84qVglvj8kWDhB?=
 =?us-ascii?Q?6sTwp68FVy8bQYpzy9shoINPqa1MNm40ec40tOfs2+pB5tHWg0JysnlMEziB?=
 =?us-ascii?Q?B7fAT7+9ul2TVnukuINgfctdnnF26vgtaFHKr8jsckh4+mUHm2NfRZ0BCba6?=
 =?us-ascii?Q?vEqmFtF60kMAZva8Z63Nqnbg7auNgKMUQtRTffdBhin8tKHsV4n6ys5m3hBs?=
 =?us-ascii?Q?19qbZqgOOf2UlsjJuoMlxQ6hnzpO67lKJ09Ccr1AdbV0eeCl1Cd9ErhaYVE4?=
 =?us-ascii?Q?a9rbhBY8e9VYpZ6TKVdk4jk6AbEbixoPd9JLB2kUdLBvLYWiLFNuM68I67ym?=
 =?us-ascii?Q?oyJDeiCXvNekjd3KPKQ+5oq2u/pQc2CHbcYl+oEaaKCBA8iUVEmuAzVGnhG6?=
 =?us-ascii?Q?o4Ti0cxo1HRcq4RojbAVhAh+oIMLb38j2lO4k0IIdG4tqHepxbhzdv+EZqy2?=
 =?us-ascii?Q?bpUk0FBTsMnZymPQSU78OZltxZwAS6TZuj6SgB4rKqw8SXoOAoJQukJ06LEA?=
 =?us-ascii?Q?diaBFFnA89EsdEQXqwJWl4hQCAda8wRCeSC8k3T54KkotXXZwEzWJMOcRmyg?=
 =?us-ascii?Q?4Rl3WBMGH8KQLLqRDtddcwBJ9yEbymQRLg9b0wHFNsCNZ/d4es3iWbHlSuvI?=
 =?us-ascii?Q?7aScHs/Z00pLE/zwkj2KF7TrlMlkn1X9Fxbc9JcpJW5hQgOdPBILWQG0t0TI?=
 =?us-ascii?Q?hRXpkqeASLG1pUhoWu1M8sxyCTmxf1A4amkD6uVd42t8ujnrYK2HFHHe1wZo?=
 =?us-ascii?Q?mBkNd/c9f5vdXose8wPd9KP3JkjgLuxfKVUdIIw9wJL9ow3WzoQtvsN2H0NH?=
 =?us-ascii?Q?poJeGjyBBjqKTI5H57jfrAtQeSEHtWG8nPYwCRTDUn+KYP9JbFiblBAQeH/s?=
 =?us-ascii?Q?cQUNH61UYtPOJQCbTvUnw4w1m/agGtXgYuHjk786xjBPCrZo/bpY+zCWJXEE?=
 =?us-ascii?Q?3xoqF+xtZ25wCE6npZQSerkinlqj6l0mACTUgQv8bJuyjUr1OkwHLOS9IG9c?=
 =?us-ascii?Q?vfCEFLypeA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 754f6cc7-cb9e-4f18-2d7c-08deaf60f7e3
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 13:26:54.5421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RMxA5hnYUDv3SD3ouMqBzqr8ueWcxaBHSv4QAJl8O9Dv17vsrRIBJPGu5aCcigsVZ7X0utz8fbkGM5sBD+WwqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8131
X-Rspamd-Queue-Id: 97D8550EDEC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-61119-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nxp.com:email,nxp.com:mid,nxp.com:dkim]
X-Rspamd-Action: no action

Add a control base for the NXP neoisp driver controls, and reserve up to
16 controls.

Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
---
 include/uapi/linux/v4l2-controls.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index affec0ab4781..1c44229d349d 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -234,6 +234,12 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_MALI_C55_BASE		(V4L2_CID_USER_BASE + 0x1230)
 
+/*
+ * The base for NEOISP driver controls.
+ * We reserve 16 controls for this driver.
+ */
+#define V4L2_CID_USER_NEOISP_BASE		(V4L2_CID_USER_BASE + 0x1240)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */
-- 
2.51.0


