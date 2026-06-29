Return-Path: <linux-media+bounces-65896-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dI+1NhRPQmo74gkAu9opvQ
	(envelope-from <linux-media+bounces-65896-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 12:55:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 993976D9190
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 12:55:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=foss.st.com header.s=selector2 header.b="MHoB/wsy";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65896-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65896-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=foss.st.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ED0263020104
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 10:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF2636A37C;
	Mon, 29 Jun 2026 10:55:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013048.outbound.protection.outlook.com [40.107.162.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AC13644C1;
	Mon, 29 Jun 2026 10:55:02 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782730504; cv=fail; b=HicRzWTSLk75m08qEMnU3tEBAMWrrltnGO7WIvPuRbrZERavMWdXXPTR+Ju56LROlghakdbaiKzIPnNn5n9JCrCpUgaSP/XAYFqvutl8uDXmUubxkFO3ggw+aPv7lGvZm3nPNkDWAieUdK2teUc8z4r4lXxYp24tqB6tIS6mFxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782730504; c=relaxed/simple;
	bh=Ob2PJWaCgRBEs11rI5M6fb62iElTE3LHTVsg1DagNBg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Ra/g12QbTokB4zbu1kjpIKRXSIMSdI5bicVmj8EW/zSYGyCqvtJOE+jBMGoTLi4rxXJLJHuDDvdaw/LSN/RczXKOoiaLzonPgXPngC3iHxXV0e7Rni1Ak/CvKwX4YwW8r7T77LWdsZsXyIXMHOkjvu2dqSp0AulsnPZjqHodkRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=MHoB/wsy; arc=fail smtp.client-ip=40.107.162.48
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G9aN8XjXUkJLEQ1o93mCf3bSJApWbqJ9tB9K5Fr3uoQ31b+RBxNxvhOfunn16tj3Fl3L+9e82DB01wsoXBxvpgjYBOC2meda9DQEtuP7mXQCuMFb3CF8r4ABSr54zbPJuMpqPNEWqLPoNz1OgegAqbpGfJ3HwJDMcZ4msLOxxBvDEaD4Tq3IGrHrQ8e6h0aDkSr11D0try0OXUhJ/jYDYkH0yzTXv+hfX3KL6E3JQYmS+DJffZNvRWpMmUvhLFhEsXnvcmV+xyJ89Gl3EoUQQ5QtCEHOj1oyRK9st2GSetvFmVvwyWuvgub0zt6UkY1tEitskkglyVQHof7ysC4C+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sv7vxlethu/DOlbiDIZ5O537Kp1RI7eDu0nGGQWf91s=;
 b=Th/Lvut0QSgA276L+LCZlWISUgCCzeQ54dpcmTK0NB+um7OsyAuvI4ar4dF+vt6+gTo7VKcUn8TcLHP3HIs4f+8kmu5t7T3psVi6vjaiwne0pfT9o1ABexDWaLXDVzyp1ayDeWvB0G1r9kAZoJ/iHSllJ2LXElwKcJu6wYjf0d1Zs6GIey2TNfAc2h3kL6dx/W42L/jaLBlLWeaW0zXG6UEiPxDYBjf/mgBIsdk5LEAt4nh6CDcPbR4bAkiaw1GgX8T78WwVcJr8w9PnyC8BO7abEG4gnxS0otv6Dbkz8KucaB/vMw2gbE0CksoFiCOUnd2WQ8zAfaS48QTk4XBcIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sv7vxlethu/DOlbiDIZ5O537Kp1RI7eDu0nGGQWf91s=;
 b=MHoB/wsyTAiPLEYjwDahgUeINNeZAdeXqGvBlfl5/OVOBiCdbI2nAAxs/RmMV924+EcNEFO2ZyHGCdCIXs0oBtaaraD9i9Nc4VXxER8a48i3J3Sv+4EzPJFVKWoGxVS69VGL3IkiPOxpnDdivLL1dObmXnWvT9SH4OqJoKlT9TgRzu/IXMFnUcMLeaMkDSugi9PKpG+wP1Cj52GHaMHSQVgLFIRagsz1IbyRG5FB9o+vnQmwopsjMnKVgbnRTYiKxT7kDm87zH9XiqEFDGl6YveH58aB6jiftD3HkfMFyVGNnam2iOTlLlztjTCs3wazUHGvtuIB/ny51Sm7in6Pgw==
Received: from AM0PR10CA0051.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::31)
 by AM0PR10MB3521.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:159::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 10:54:57 +0000
Received: from AM3PEPF0000A78E.eurprd04.prod.outlook.com
 (2603:10a6:20b:150:cafe::6c) by AM0PR10CA0051.outlook.office365.com
 (2603:10a6:20b:150::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 10:54:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM3PEPF0000A78E.mail.protection.outlook.com (10.167.16.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 10:54:57 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Mon, 29 Jun
 2026 12:59:40 +0200
Received: from localhost (10.130.78.67) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Mon, 29 Jun
 2026 12:54:56 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Date: Mon, 29 Jun 2026 12:51:46 +0200
Subject: [PATCH v2 1/5] media: i2c: vd55g1: Fix media bus code
 initialization
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260629-vd55g4_and_fixes-v2-1-ea0a7cf3cd66@foss.st.com>
References: <20260629-vd55g4_and_fixes-v2-0-ea0a7cf3cd66@foss.st.com>
In-Reply-To: <20260629-vd55g4_and_fixes-v2-0-ea0a7cf3cd66@foss.st.com>
To: Sylvain Petinot <sylvain.petinot@foss.st.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>, <stable@vger.kernel.org>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A78E:EE_|AM0PR10MB3521:EE_
X-MS-Office365-Filtering-Correlation-Id: ee7902b4-435a-4f59-ed90-08ded5ccdbed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|23010399003|376014|1800799024|18002099003|22082099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	J7uiWK3FYNmZV549gxsHODRQcw4c7V7ze34zjs80IguQGfuDr/0HxA1EOzLtHtsJN/83wHRSPVKzOUNO7dc9aEMlONJWFNM0wFxCu7EFc0tpwJshxUfILAkPtOXiNoJuVotNzAryHgHr4cX+BuXKYnw+RQLBdd7ubjcMPfv//wo2YVM8KPX2SBSWVbpDQdEwOc3sn3V8PoAVwdigeTNrxvgIOm7lYHm8BIYbHOk5jbVyZe77qaDg4LQGIeUkjryD1/Kq1luuZCB9RdsyPB3sAX63ZSC9L2xgqtz3xkdNdpE9251/6gvZ/AUZ1wPVRY73mkjMIO94ondpQyAdCgw3m3p+WQZ+WFffxDjhxROlhSOu0hKpcZYGCEkKf0XZolRd7D05FvcIZS3DIga4500HxTyqDsbYc8n+1adm1T4LlFSq7i6qQ1lct1L6xpEn3kO9eTK+m+DQ8kY7CEY7KhVAjJmbn/nUsae6dFYbFx2tCzXdf4thooYaxmi5se6Ag9WuA3rfSMsr+wDRYwpmOzpb5kU0Q8bb4GHsEB1jX3+ikam8AWBq6QaPg5aiC+IHEAsQs58d90A7dFyKcJhy6mgANjt5OL69lFlcOqA3Jd7L8eVTd/bDO4FRUxIQUcocRHNo01imTklEIqV53y3hCC8B+a1dkUWvvI3O46UXsvkdkcVUV64Qr/ZC9JrM5zA32UW5dYY/t2Yb6om8Z7yT2iuMCg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NIOozFdD6WqEQAHYhHK6XcJAqK7sPBv2/HOfTLJGDmieFSVgi5CNqSN6YEHvpKVdTaQSP1SPtYkLaC5Ax0Xr98rEarzBAanK84vmAaklfc0J3Fc4caduK5uWzwLwIibX8c7Aocf+jiW9iDO7g9UMTQ9vXBRnUxJ6EeXocYrZ8dfuXtcFDBZ4L0Jp///TcPro64rB0GSKRCrJ4MzwWSVpAbmCUYQgk3PfzIMSFlWrvQeD/Xi9VPcgJiHjHMwqd9tFxE9w9CDGEXr34PNkRudW8kznxR93kAtazLBzwCZBBldaqKjc1JkEBoYaWBsZa2eCkmxou07D2hCFnbSUcQccBH6bxrJ8i673Y/n94ishE2SlnEMpPhyQmr7oKdsarwHF++L5Gc+k9GzNVO3ZSZmn0NRn6WyySWX3iT4K35aE2QfpiOF9h4fqLw3IlP625Gpt
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 10:54:57.2148
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee7902b4-435a-4f59-ed90-08ded5ccdbed
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3521
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65896-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sylvain.petinot@foss.st.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:jacopo.mondi@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:benjamin.mugnier@foss.st.com,m:stable@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[benjamin.mugnier@foss.st.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,st.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benjamin.mugnier@foss.st.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 993976D9190

In the driver initialization, the index of the default media bus code
from the supported media bus code array is passed directly to the
vd55g1_get_fmt_code() function instead of the proper media bus code.

This works correctly as a proper media bus code is set after
initialization but could not have been the case. This also resulted in
mutliple "Unsupported mbus format" error messages.

Retrieve the media bus code from the media bus code array, and pass this
media bus code to vd55g1_get_fmt_code() instead of the code index.

Rename VD55G1_MBUS_CODE_DEF to VD55G1_MBUS_CODE_IDX_DEF and
VD55G1_MODE_DEF to VD55G1_MODE_IDX_DEF while at it to avoid future
confusions. Display the guilty error code in warning message.

Cc: stable@vger.kernel.org
Fixes: e138e7f00042 ("media: i2c: vd55g1: Add support for vd65g4 RGB variant")
Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 drivers/media/i2c/vd55g1.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index 78d18c028154..fceb437e19be 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -114,9 +114,8 @@
 
 #define VD55G1_WIDTH					804
 #define VD55G1_HEIGHT					704
-#define VD55G1_MODE_DEF					0
+#define VD55G1_MODE_IDX_DEF				0
 #define VD55G1_NB_GPIOS					4
-#define VD55G1_MBUS_CODE_DEF				0
 #define VD55G1_DGAIN_DEF				256
 #define VD55G1_AGAIN_DEF				19
 #define VD55G1_EXPO_MAX_TERM				64
@@ -634,7 +633,7 @@ static u32 vd55g1_get_fmt_code(struct vd55g1 *sensor, u32 code)
 				goto adapt_bayer_pattern;
 		}
 	}
-	dev_warn(sensor->dev, "Unsupported mbus format\n");
+	dev_warn(sensor->dev, "Unsupported mbus format: 0x%x\n", code);
 
 	return code;
 
@@ -1347,6 +1346,7 @@ static int vd55g1_init_state(struct v4l2_subdev *sd,
 {
 	struct vd55g1 *sensor = to_vd55g1(sd);
 	struct v4l2_subdev_format fmt = { 0 };
+	int code;
 	struct v4l2_subdev_route routes[] = {
 		{ .flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE }
 	};
@@ -1361,9 +1361,13 @@ static int vd55g1_init_state(struct v4l2_subdev *sd,
 	if (ret)
 		return ret;
 
-	vd55g1_update_pad_fmt(sensor, &vd55g1_supported_modes[VD55G1_MODE_DEF],
-			      vd55g1_get_fmt_code(sensor, VD55G1_MBUS_CODE_DEF),
-			      &fmt.format);
+	if (sensor->id == VD55G1_MODEL_ID_VD55G1)
+		code = vd55g1_mbus_formats_mono[0];
+	else
+		code = vd55g1_mbus_formats_bayer[0][0];
+	vd55g1_update_pad_fmt(sensor,
+			      &vd55g1_supported_modes[VD55G1_MODE_IDX_DEF],
+			      vd55g1_get_fmt_code(sensor, code), &fmt.format);
 
 	return vd55g1_set_pad_fmt(sd, sd_state, &fmt);
 }

-- 
2.43.0


