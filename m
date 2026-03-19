Return-Path: <linux-media+bounces-56285-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFATCqWKu2nHlQIAu9opvQ
	(envelope-from <linux-media+bounces-56285-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 06:33:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA4C2C63EF
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 06:33:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AD8EE3035884
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 05:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7E2339BFF1;
	Thu, 19 Mar 2026 05:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="hgJi5/Jb"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021139.outbound.protection.outlook.com [40.107.42.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AD3399366;
	Thu, 19 Mar 2026 05:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773898349; cv=fail; b=decfwOL/md830/el24kdIuk8GsyBjjlqYbIL/FWbdbqeOubTKauuiwQCpVEMaZXuCM2lsSExrSFxOTtbjkU3GLFWqDZC9tKa1G8g5Matx8Mnhf1+88Dxmr6BQcIaWIQCI7bwflNrtTYGMLXPZhOHqL6kDf/qGXoE7xi1CTwPT9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773898349; c=relaxed/simple;
	bh=grtaeZ7YIt9nOaj65ctLJctCPNkf8AS46O8ny6HyZBA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=olaH8axkP0Nv9G9JdEnSHY6BIYfAd3K1fEyfDzxJmAjWeipKB12ITtMg96QMRloemtj7rv4CQKZPUW7fGIgFHE+xQcG8IW0t/1exaANhbjFpdYpzVT4u9jRkV5BC2whcMl30YYJ+luuK6R32svMqKIiGk15rDEYpGy9E60QBg0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=hgJi5/Jb; arc=fail smtp.client-ip=40.107.42.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H8VaQYWs0B1661ngWjKSMtT+UPFAPSL6MFmtGZ/aVjV4ivqLShfwKu72JEley/heZo+avo0KkqjBWIZniuLjrDxJph7XUGhvBDDuDLS2EftH+cbWTEZVNlAwTOINV/ikAQTKcI/WxR07/dn9oEw62Kac+pNRrT47EbOIOs8+oNRmsciZCvVCwVzLnHwoOhE2SRFGQfeEk64EYn/YJiK+bxoDKDkOPeZPfarK1xzI0mf7tnrL+N3TRlEEjjN8ByuDdom//BBgg0x2e6oxd6OHqfQrfiz3bURN5rAguQx+Jwgozdgfl0pftJCxvYn1+jqxEHkUHsxZFHkwzmXqHy36UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Ig2kF6vzqSshDUQXnVXJcIYKP+ouE4NIwgW79Zn8aQ=;
 b=TxQCeZXlI3PkN7wnIlNX8SGOrIMkV7tl4cvu/p+g9SAUSGul/qXM1lEsxNn64B78nU0Ku7OoH4iQOWBmQegbkp3lz8RGry03gqj2TiIE6HWcqAMmsKQABZO1Dw52FGM171VkwgHCQJkE7YLDI3/ihqpCe2mGFpU/uA3FPSx5I5aV8oWoUPeCOTp6w6OmxQaluEHsqYy9njahMU1lZmbilwDLc/5mRl18KFLdsGh4hboO6lzflexKxwHyT2OBmHW2IKgw9e41b1erTcCxyYH3k5Qakx7Ny2XIKNzwWBhxWp/QA0VEZZFeZeS3GovIpmoS5BV/aZBghbtJDiTFI1j9Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Ig2kF6vzqSshDUQXnVXJcIYKP+ouE4NIwgW79Zn8aQ=;
 b=hgJi5/JblOt+lroDDJsgYLh2sCoRrbH0JgJyoWpHvFIrfdsQEPvIqOWKEZEiZq8qEOma+jb5BziL2BLbsBJA9gxE0LMNbdC2GOKvqhVjN/CYvogqhNCY2A7BK3mFY5Vew4oBDO6/MpgXxrbDWKNT1Vu4BURcYVd1dSkIxrHGH2k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 PS2P216MB1345.KORP216.PROD.OUTLOOK.COM (2603:1096:301:73::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19; Thu, 19 Mar 2026 05:32:19 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be%3]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 05:32:19 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com,
	bob.beckett@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com
Subject: [PATCH v0 2/3] media: chips-media: wave5: Support CBP profile
Date: Thu, 19 Mar 2026 14:32:09 +0900
Message-Id: <20260319053210.90-3-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260319053210.90-1-jackson.lee@chipsnmedia.com>
References: <20260319053210.90-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0036.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b5::9) To SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:f::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB1148:EE_|PS2P216MB1345:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c0851cb-d6e5-4018-0c25-08de8578e37a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	e/Xn+0gKW+3cFkBrfhpekk/2xjFRe/GbAf21TAq0h49phWtevkg2LNAxrxGn0si2e7bZzrwwOaqM6tYYpqtjdguGIOEzlfCR6LcKC8DEUc83Rs09VeWYLaa65FZ35rVu78yUBOGvu47VRTuQl2nLcdu4jGXQxyqKKcECjsBZdYK3ihDndu6eI7gumrLmB96/Q//FjxOyZwVxZHVoUI41NGTtgTrT0QrY8Sp15p/yptF9sMPDLhw5xN28VuJXh0aAMx71bwllvpP7gEnuNB80zUI+e+GRDPtAvm23LtaYkWRrThqfOgT/ftBDls+NPc4Ub8r5Edc8/Dh7vpaYqRJKLAM11i7ywj+c2hZrpMl1eFi9sYk02meW8MudMQNH3SB3Rs6bwMrgsHFP7zcsjULiaWDAT70Lflrq0yIbBwWEetl6yhLgZ8SP0amj+AnQDpk3Dg2HsADcAgdzFvzvRQ8mjIyaG3x8myQppYl8e0MlgOFgMIvFN/RkkJnE14t6ckLnquDYj03Y4XQ6HZxowW8bPPUo9NSXYR33iEAy7zgWst8UyGkwSs+znZcTtdkKZulMupVTdCFDx+C1epyNXXJN3oIQifoyrbwxnn9Ng1U2Ag2qzMiIrwGhfRnGrOgAurrnEcPnjprCYMGSTIA8Cfxp1QcuMUA/640KWDTbVsDtxILFlmijUoeq26WjZremTWrNu0XnFF7k4b5s77sKVCxiw/RKOc/mB0ZBgnCHgctz9sxnfq4+Rg+hTKCLN10yrBuQY2XsQpO5dHknc62B+8rkUppXCh5HnEIXV9v/rvJNR2s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wtI5hgL8I58FTQIpryLlwavAhqP76+hywT+lAHSe8dqke62JNI74qi1ZPVcL?=
 =?us-ascii?Q?WcH+hlFVeRDXa2hnP1NQkNCcc5DgbfOkxPd8weBH3dfnZBSQZZsNzIPEkKiD?=
 =?us-ascii?Q?Ms2aPMXNP7CnAwzbV++4smAAXni+DZm5LSRn3yFZXwN/SDqp142L/yf9bTxg?=
 =?us-ascii?Q?cPE2Z35qHUw5waMxGvkfsJKGbpC3+GklbBnkoveYTGuQY5Gm1c7deG8iLvJJ?=
 =?us-ascii?Q?/kUkUJz1NxzHJahZoxbsGBVxDZ7xjD92j0paiQoe5tqR9m+1ITw9C5yr5B4G?=
 =?us-ascii?Q?dh3VuaGpRAcE3gQSN2wAGEos7bVLp2PzcVT3xPDvRXKbwEGIxYQhFCBy2lYG?=
 =?us-ascii?Q?AFHrfuOx5cFkFX/KA/LUOTtEu3prznY3gZ7dPqptZeETGPK1L3a+Rg1CtziZ?=
 =?us-ascii?Q?b0ebO60hGWbhRPw+Kpr2w/iqntHzyNbFhNZ8VVjUKUGrR4NV28vcYnx0w42S?=
 =?us-ascii?Q?Hid1QrvoIELtdt8r8LM9/oso+2Pj0GygelxTaqVQmriDs1GEZAQOqksCb564?=
 =?us-ascii?Q?rsaP8WsoLaHuf92vgfEMb8O/5y/unUkIW44fAHAUXSpsBUzlXZCSBBkP0Tsc?=
 =?us-ascii?Q?UTe3YwyI6+Ve+Z/wuUSFeURJ+aYJ1y4rIBY2mmaMUVp05+Y1iTaLjZNQ6zzr?=
 =?us-ascii?Q?mET5afAR7lXYAFxIA28iDVcjdyBg4uei9NKGVHTS+zjSmYZFNRatonX1ltfb?=
 =?us-ascii?Q?xMc6XaK7BMlMKn/xwq1V+owNnWHk9y5a3LYEt3uFzmwjFs/RRr3+JOA1HHEY?=
 =?us-ascii?Q?XlqSmPSYw3SefgzoG9cDENIhpKpzIt4jEV/RmY6O9FDT0QBq1KV3eQPwX9tG?=
 =?us-ascii?Q?YhvUiJVQ1kcyq7clZKIWK0gCe7uiVLFlOPq8tEmoMCP0ARJ4wlmQE2yBh4WC?=
 =?us-ascii?Q?pHVXxsMR8kaxOJujzkwwxdaWh5gIcoOBWfq8DaHLZxntPHsk4k549LgRTK8+?=
 =?us-ascii?Q?tZ2Jw51sTE7QDNctIr29CjAbASDR9wVHE47G9CidQiy6h1fZcQSeQXCDHDw2?=
 =?us-ascii?Q?8pjEbKDWLpIb0lFnHk7sN204gynUz32rHlNHf0fLfF7Qq1rpydx4M/3MJTuz?=
 =?us-ascii?Q?Xqc220xvndKL5f7GhMqKo/x4lW+hWZz7AiMh+4nQ5KcMdSrtoK5V0zCOXdFv?=
 =?us-ascii?Q?M0ot8/ekgySBpkDERPinOyEzD4L6Y4Nars9EnKWo2XA0ydQGJ1zWpxbW2VBT?=
 =?us-ascii?Q?XCQdF14+yFBERdhZG7OAGFJl6W53x5dNvcauyf//ktvsPTMRzXJLWeX3NhsJ?=
 =?us-ascii?Q?/f9gO/uSH05vb/EkM+KFSKuiFhp5cYBgxz3L6TPOXQWH2evWRw5b085FW8++?=
 =?us-ascii?Q?z2hBW00fml99/AcTxV1J4D8M3+rU9ehfmDdyVoL+F/+iTBkxGSa4VGGSEshW?=
 =?us-ascii?Q?weJ1X0DcLppqyOIAm22KOZNlZbLFkv+AHPmEpKLNqakSZsp3SD6b9cHU+Qr2?=
 =?us-ascii?Q?tgh+qgO5LErMd/Os/3moF/FIdmNQSk3Z65k0ZIwFkovEJ0nMz1weMgmbrxUN?=
 =?us-ascii?Q?BC2eXUK4kfb3HmyCX8Ww1uqwghQQlSm/EkFZHBNDTZGFx5XF1dyvWb4vcOme?=
 =?us-ascii?Q?ilyCGyUXnEkEJYnym8MQD+9oGsaqPEkrbSsEDtWJwBj5/Lj9ciqLtZkLBVog?=
 =?us-ascii?Q?1ayoe4A0Z7QpXtdUwp3DkWzqVfHQI67+5Cgkejt9yK292+CjRYNt/5mHIMTs?=
 =?us-ascii?Q?JFKsgS5ZcBiw4rTvzi5hbVUj6p22FiNywOMjT9Rrnw4ZEWMgoMeEV9K1WHRJ?=
 =?us-ascii?Q?b462pyOO+QvjhLqA3ZfKP2pHG93Bnrw=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c0851cb-d6e5-4018-0c25-08de8578e37a
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 05:32:19.3016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OR3FDOYw8wFJaIq0qdlaCKy7uiGo1r3DbtjuA4rXpK/+ydsO9CaCi9moppgUmWtNXJsSW5l2cSHArOly8V1tclO7QfvHXo6a78Ec6Aorpj8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2P216MB1345
X-Spamd-Result: default: False [1.84 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,chipsnmedia.com,ti.com,xs4all.nl];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,collabora.com];
	DMARC_NA(0.00)[chipsnmedia.com];
	TAGGED_FROM(0.00)[bounces-56285-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[chipsnmedia.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jackson.lee@chipsnmedia.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.987];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,chipsnmedia.com:dkim,chipsnmedia.com:email,chipsnmedia.com:mid]
X-Rspamd-Queue-Id: AEA4C2C63EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jackson Lee <jackson.lee@chipsnmedia.com>

Constrained Baseline Profile (CBP) and Baseline Profile (BP) have been
treated as the same.
Introduce the ability to differentiate between the two.

Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 drivers/media/platform/chips-media/wave5/wave5-hw.c    |  3 +++
 .../media/platform/chips-media/wave5/wave5-vpu-enc.c   | 10 +++++++---
 .../media/platform/chips-media/wave5/wave5-vpuapi.h    |  1 +
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-hw.c b/drivers/media/platform/chips-media/wave5/wave5-hw.c
index c516d125f553..2392bce8d840 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-hw.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-hw.c
@@ -1763,6 +1763,9 @@ int wave5_vpu_enc_init_seq(struct vpu_instance *inst)
 			(p_param->skip_intra_trans << 25) |
 			(p_param->strong_intra_smooth_enable << 27) |
 			(p_param->en_still_picture << 30);
+	else if (inst->std == W_AVC_ENC)
+		reg_val |= (p_param->constraint_set1_flag << 29);
+
 	vpu_write_reg(inst->dev, W5_CMD_ENC_SEQ_SPS_PARAM, reg_val);
 
 	reg_val = (p_param->lossless_enable) |
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index 6fe01217233f..f315ed7243a7 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -939,6 +939,8 @@ static int wave5_vpu_enc_s_ctrl(struct v4l2_ctrl *ctrl)
 		case V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE:
 			inst->enc_param.profile = H264_PROFILE_BP;
 			inst->bit_depth = 8;
+			if (ctrl->val == V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE)
+				inst->enc_param.constraint_set1_flag = 1;
 			break;
 		case V4L2_MPEG_VIDEO_H264_PROFILE_MAIN:
 			inst->enc_param.profile = H264_PROFILE_MP;
@@ -1214,9 +1216,11 @@ static int wave5_set_enc_openparam(struct enc_open_param *open_param,
 			open_param->wave_param.decoding_refresh_type = DEC_REFRESH_TYPE_IDR;
 			open_param->wave_param.intra_period = input.avc_idr_period;
 		}
-	} else {
+	} else if (inst->std == W_AVC_ENC)
+		open_param->wave_param.constraint_set1_flag = input.constraint_set1_flag;
+	else
 		open_param->wave_param.avc_idr_period = input.avc_idr_period;
-	}
+
 	open_param->wave_param.entropy_coding_mode = input.entropy_coding_mode;
 	open_param->wave_param.lossless_enable = input.lossless_enable;
 	open_param->wave_param.const_intra_pred_flag = input.const_intra_pred_flag;
@@ -1687,7 +1691,7 @@ static int wave5_vpu_open_enc(struct file *filp)
 			  -6, 6, 1, 0);
 	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops,
 			  V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM,
-			  0, 1, 1, 1);
+			  0, 1, 1, 0);
 	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops,
 			  V4L2_CID_MPEG_VIDEO_H264_CONSTRAINED_INTRA_PREDICTION,
 			  0, 1, 1, 0);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
index dc31689e0d27..7b08fef58217 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
@@ -570,6 +570,7 @@ struct enc_wave_param {
 	u32 transform8x8_enable: 1; /* enable 8x8 intra prediction and 8x8 transform */
 	u32 mb_level_rc_enable: 1; /* enable MB-level rate control */
 	u32 forced_idr_header_enable: 1; /* enable header encoding before IDR frame */
+	u32 constraint_set1_flag: 1; /* enable CBP */
 	u32 bg_detection: 1; /* enable background detection */
 };
 
-- 
2.43.0


