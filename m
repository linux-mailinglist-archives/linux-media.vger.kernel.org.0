Return-Path: <linux-media+bounces-56801-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gP/6DLIbwmlvZgQAu9opvQ
	(envelope-from <linux-media+bounces-56801-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 06:05:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FDF302205
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 06:05:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5169930ACF80
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 05:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B747C299A8F;
	Tue, 24 Mar 2026 05:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="SaLq8Lz7"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021134.outbound.protection.outlook.com [40.107.42.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A45245020;
	Tue, 24 Mar 2026 05:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774328656; cv=fail; b=E7q7HX9rBOmR+5EmeYQ8mYQ4nuV3S1ECobfWXlbIehH4rFglWCd4A16nnZxyc30R6cnD9LQ7TJDKevYfWMRm55oCSqo8zLcxG9BgYRsQU02FJOwV7h5YLwULVQdF5zhPps8GmpiRIZFeFfKrzXJj2bcvSUABTN1HuKqmt9Z1tJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774328656; c=relaxed/simple;
	bh=GMwpfAdfcddi93QPZGTfDV+njD2BUZxx8/1+Ap6WgqA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J2o+S5ojFhYWyS4k1zaAEhbb7y9tW5bnR1nxFVps30X3qbmOJxl5rfGvYKGfLKNeqrbNqoRzfPKshiNPJ0DGdvOJccihgRNKUavJhxXSL1LV/gjHMB4TvE5utRucuJj/ZJ8dT8ihs1HPIkcNjh6SPY3/UWDZxC3DsA5+xQVc7QA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=SaLq8Lz7; arc=fail smtp.client-ip=40.107.42.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=okBDu0iNC8VtQPE2gYESR+n+4yvp47sBZ2ONh8EgIjEUsJcNnA7rW2iPzMR0hEFjfD4i9jv4/N6gEbT9xMubRzwMv3Y0fgcao+/Bw00oO7tetr8/wRoqLB5Z+aN5pAFgFelIuC/hI73ekocwRiFEBF1fG8aO5qg8L2umcYvv6HpyF0gjiDZVurfcyCEK8mY85liox5dmLhcmhaUzPjM3p8kqVE3h1MI58XHNWl7FSVq8YsdGm0An4hduZxKldhwNweRCTdSQ2Qz12iSoWmpgSKQApu0zgWs4QaRuON1fPfw7hHbj4/wmBN142xO0Y8kqXPZJW9jzqWhpZT6x9wDFTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6T9V7PNV6KqyJBWD/c3+lOu1DEMsG2wF7mqIN9xSryQ=;
 b=yG5TNvLxB4js3L7suX+cu9KsKLRuMDFl/zgfdKqFGTPng4Jo/FhLWBQIULYL2BRF80c1JXKe79m5s+b/Hd7LJrGRWdU561KM9DNqIRjPFoYDr8xwmD0paFfiaX5Th5cagTdXjsd0lfv4m2nRw+q5JFCe/nLeMrK6ta1yyhdpJ9l/eJT6HWW2yhuuZ3ri8/7tQdYv5BfO3oL831WHRDYB0KtscjQjrPH/ONc6wDsXCNgWYqangPasHMIE4X3OVBHzgkj0acB55MmiN8eXqKhMQIs++66L1iQciLV1X71sLkOWAYSEGnq8GpI+ML5hcart0tRD2MOAIw1Qx/TN84bFmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6T9V7PNV6KqyJBWD/c3+lOu1DEMsG2wF7mqIN9xSryQ=;
 b=SaLq8Lz7I8bCStLfbpDnl6WNBPPsQ9BOMTkkYUeUOMmMCnGiEsc8AnUMjotcpUgnAXE5drhv/MPodUGMCReF56cWJ6T5io3ibZVPVA6CL1/cM5bhP1zB9A0On2heQp2EQDhAtnokN5c5uZWlMyoNwYvMxUlHzUkc2R6wpkIRDZE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 SE5P216MB3232.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2fb::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.31; Tue, 24 Mar 2026 05:04:08 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be%3]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 05:04:08 +0000
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
Subject: [PATCH v1 1/4] media: v4l2-controls: Add control for background detection
Date: Tue, 24 Mar 2026 14:03:57 +0900
Message-Id: <20260324050400.218-2-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260324050400.218-1-jackson.lee@chipsnmedia.com>
References: <20260324050400.218-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0003.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b4::6) To SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:f::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB1148:EE_|SE5P216MB3232:EE_
X-MS-Office365-Filtering-Correlation-Id: 803d4ffd-56ed-4898-5203-08de8962c7b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	oFbYtCBsNPjCrHA0E+rO8ehGXlHKhVTuugtMA3EgO/TMJK2zwhvYdNci2e64KKG2/+4W+4j+erEPdQMA1KGb1RrAhHKnU3/az541pnnQz5ElW/jMzzqcrvJ6lozCy2So390x8l20JtwnYjYWqvWj86CEBGqZktBPlxTGqLWZU8WaPDHJ5ZSC+OYixpAKMcdBUq+bxOBiFF3iB52LdizwI41SKV39HPeDS0s41kszE+2xbJWIrQzjouGOXkR0IbgOAns12H2b+fBhP2Kx+/WAn4rFdAthVPaKcBb48qI72oTUxbQ5Ogo2m2q8YFN2/IC9vD3bTho69vG3d7csQZUek//RGCkfvpnoDPS7u51hasr45+zrOZShKS3bqV0yqKpwUjFn+t+GxEMt2LvMVhVDJxGl8uCvzQ5py0y3n28nsmqoDk8Dr1Mmb645oOfIas5U+OLjMgtX7L4HklLx8Xk/xoSh3IPlLjSq/CXUJE1L83If5pdOUe1Vxvio9NgTX+aItH+nbThzbs9+mdQd4UBau27DQwP1wFHvUAxXzcCWriZ8idbDrcbc+Rb2U+7ER9cmFdG3jdGlwNScbxkYY8WbyJAQc+ggiijapf/0qS5DNjYpjl8q+Ar+TMmZzmo/DmIUEY1qq8cYiChG/0GE7GYetLNlrEZrr2ZXkc+0BGmTheADuv0MQJHmOopTc58CUdekQ5vFBKNja3LS54DMQt1U/MnhGafYmTQ0xsmxohFHADSNv1OJncw6lu/dbqayks57QQRoVFyX6pZEZms7nuUPyMo82BY1unq4eaJ13zJ7xhY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+nSOvHKkJb3bEKSz1oR8aW/VbM7P6FGkBGzCfXUGep8JEr/FxjoGQ2YPgAtn?=
 =?us-ascii?Q?Djcl/4MY2wsqvF/Sm11J5w2UEomnpRvA/DEutCFYFT7TH46Sn/qdGp0MorCT?=
 =?us-ascii?Q?pS0KBDai/d4+qDKh48DdOrXQQFG1n9XXRFOMumwUh2g1WQgutkmEISejeCU1?=
 =?us-ascii?Q?Lpx4dEaHU4phoQb0ZrP0DPYSWX/tLsspbjXLsx2l6ZfhY2M4P7a7ogtXbOqL?=
 =?us-ascii?Q?6psyye/ouibsH6V2VxDD2gm0M7t9PrZwEN1V6XklHbhNpoxl1CC0Lzwa1DDW?=
 =?us-ascii?Q?8Qhjt3CQ701Gzm1sSVpq1H0TbSL3p6EjWZchPcwsW9fCZ+nyJPNPDdxpR63R?=
 =?us-ascii?Q?WMG7s0uozgVKonAzn/LpniGRw8ylQ3gbDLGykED/pJz9h3XPLd7Tf1hfRfK9?=
 =?us-ascii?Q?wNUTDYM4H0QjzSSOd9NoSbYlNldP38Ieh3cVFZpDZOmkpnB0l7NL6L8CwK1r?=
 =?us-ascii?Q?c7vMsLRqClRyLfU0yCcscckH9Xle+HUR4AdgBQze/ZjmkVAUvruP/4SJ433I?=
 =?us-ascii?Q?LeC2cpaM2MKS+cObcB6V//SBXKxE5gfGMoGz5bRcgURIfuIUBoQhgEUJeSW9?=
 =?us-ascii?Q?b/AOHCCZdANghomCxi3WFUz2P0AtsW3QcCKpXDMfHfvDunEOIUEePU/xuMGi?=
 =?us-ascii?Q?I//SqdCxjuaUTEHnIx2opNlnJaaGgRX6hlGz1xIVS00r6W6dxTFRHj0hymh7?=
 =?us-ascii?Q?CGmbKQqm2CB2njjDAwQufhhXT1AQWu0YAYMe5jMfHoQ8lqQOGsfCKU1+LI+j?=
 =?us-ascii?Q?x/FNPXqnYxlOOAb4uVFTetqYm+vRYsOGSeiOWRE7NvuicN4qyT9tFoNUIb2L?=
 =?us-ascii?Q?oe+8xbU8NXfFL5RKaBe8Qt4WsmyRyogHfSxeBp78o66eT5UiB2sh6jWmd8yy?=
 =?us-ascii?Q?y6CwCWF6WcVO2vJqM8K7dleBQD5hDdfGbFMVk9EzZ9Je8oqPcsIdt4f3ucuH?=
 =?us-ascii?Q?wcSZBQFnSKJTTVzT/3lsQPmS801UsANE5Z+DoJjUG93q9RkfrjQ4wIgRXfAJ?=
 =?us-ascii?Q?niFwHqBS3pk+02bTsxythNGZfpaBw7s1AmoK7xsAb7t4NwSwVK6zcdo+oyUV?=
 =?us-ascii?Q?XEH6yOVpn0hxjVOUEBzw0Ax88NMSjg5JScHUr2kwI9gHJjo289AgRT4Yz/iC?=
 =?us-ascii?Q?LZTQ7IKSuxASLHMOAKYyQW8BcgmylIF2FhrgjXvrl/kizEs8/TOWLvcYyR98?=
 =?us-ascii?Q?kr3LwS2Byt4cJXtrfp0BdxKQWgC5exyg49tfePC6ekJbslWJDY2I7V9B/tBi?=
 =?us-ascii?Q?A6QwJ3ioFSy09I1rhcSlD7yL6sJaOmB/YiUxjifRVsQdfw5s9SlQwvrfm5SE?=
 =?us-ascii?Q?HskJI8tc4qftL7cPHpgbOXlikwH/dcyXlPFq9w+V4W4U8L5xa3Esr/LjtHzc?=
 =?us-ascii?Q?2km+0CLp2qBmjOZgz3bx66hptrXvlaewdfWGClzEF+SUKk9sEY0bD1nl7I0x?=
 =?us-ascii?Q?13G4EAME9U9uA+nT5dvHxI4jr38+SaSXc0vn4XYqn6xTpm/oIwRzc/7Tc1UZ?=
 =?us-ascii?Q?Xb+wvj3VtORuV9nhwmUVgJgpKGhcI9AbnwzyLzMoTirRs5CKt6VA7aDGY2Ac?=
 =?us-ascii?Q?gP84LO8ZlMH3Czx4/bnV5pi3RzxyIgYoILuo28P0DoRPt8SmiE1Ing1bANip?=
 =?us-ascii?Q?6vFHx/5JD9+F03kRaR++G03/bpFRb5KbBFB+RrgvkXXauziUAz16343XWjWa?=
 =?us-ascii?Q?4hWB98KRWRZnHWSHUZQP/GdbM3fJEPk19DwY47QKicbL1vIoQJHYmP/dliHG?=
 =?us-ascii?Q?BUdpITunVaEFpjNughWpTMPK4iXt+9U=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 803d4ffd-56ed-4898-5203-08de8962c7b5
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 05:04:08.4276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8eVPaEPbeX3fuHZYqRXUsJOtWWgTmxhgv10ORO/5vxhZjGGfzx6WEUl7l7bkR2xGw6BjCeVRhNgdXHCyNOWpPgj79jmjhXukZSSqPD3lhYs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE5P216MB3232
X-Spamd-Result: default: False [1.84 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[jackson.lee@chipsnmedia.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-56801-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[chipsnmedia.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,xs4all.nl,chipsnmedia.com,ti.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[chipsnmedia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chipsnmedia.com:dkim,chipsnmedia.com:email,chipsnmedia.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A3FDF302205
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jackson Lee <jackson.lee@chipsnmedia.com>

Add a generic V4L2 boolean control V4L2_CID_MPEG_VIDEO_BACKGROUND_DETECTION
that allows encoders to detect background regions in a frame and use fewer
bits or skip mode to encode them, potentially reducing bitrate for streams
with stationary scenes.

Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 6 ++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c                 | 2 ++
 include/uapi/linux/v4l2-controls.h                        | 2 ++
 3 files changed, 10 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index c8890cb5e00a..ab865a1a6ba9 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -737,6 +737,12 @@ enum v4l2_mpeg_video_frame_skip_mode -
     Enable writing sample aspect ratio in the Video Usability
     Information. Applicable to the H264 encoder.
 
+``V4L2_CID_MPEG_VIDEO_BACKGROUND_DETECTION (boolean)``
+    If enabled, the encoder detect a background region in frame and
+    use low bits or skip mode to encode the background region.
+    If a lot of scenes are stationary or background, It may help to
+    reduce the video bitrate. Applicable to the encoder.
+
 .. _v4l2-mpeg-video-h264-vui-sar-idc:
 
 ``V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_IDC``
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 551426c4cd01..e062f2088490 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -889,6 +889,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY:		return "Display Delay";
 	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE:	return "Display Delay Enable";
 	case V4L2_CID_MPEG_VIDEO_AU_DELIMITER:			return "Generate Access Unit Delimiters";
+	case V4L2_CID_MPEG_VIDEO_BACKGROUND_DETECTION:		return "Background Detection";
 	case V4L2_CID_MPEG_VIDEO_H263_I_FRAME_QP:		return "H263 I-Frame QP Value";
 	case V4L2_CID_MPEG_VIDEO_H263_P_FRAME_QP:		return "H263 P-Frame QP Value";
 	case V4L2_CID_MPEG_VIDEO_H263_B_FRAME_QP:		return "H263 B-Frame QP Value";
@@ -1296,6 +1297,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_MPEG_VIDEO_MPEG4_QPEL:
 	case V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER:
 	case V4L2_CID_MPEG_VIDEO_AU_DELIMITER:
+	case V4L2_CID_MPEG_VIDEO_BACKGROUND_DETECTION:
 	case V4L2_CID_WIDE_DYNAMIC_RANGE:
 	case V4L2_CID_IMAGE_STABILIZATION:
 	case V4L2_CID_RDS_RECEPTION:
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 68dd0c4e47b2..affec0ab4781 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -464,6 +464,8 @@ enum v4l2_mpeg_video_intra_refresh_period_type {
 	V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC	= 1,
 };
 
+#define V4L2_CID_MPEG_VIDEO_BACKGROUND_DETECTION	(V4L2_CID_CODEC_BASE + 238)
+
 /* CIDs for the MPEG-2 Part 2 (H.262) codec */
 #define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_CODEC_BASE+270)
 enum v4l2_mpeg_video_mpeg2_level {
-- 
2.43.0


