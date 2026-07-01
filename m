Return-Path: <linux-media+bounces-66228-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BHP3OVghRWoc7goAu9opvQ
	(envelope-from <linux-media+bounces-66228-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 16:16:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7876EE98B
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 16:16:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=foss.st.com header.s=selector2 header.b="Gz1/oTUa";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66228-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66228-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=foss.st.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4806B3029633
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 14:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 830962E54AA;
	Wed,  1 Jul 2026 14:10:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013004.outbound.protection.outlook.com [52.101.72.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B502517A5;
	Wed,  1 Jul 2026 14:10:33 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915035; cv=fail; b=RQZdgfwon2IC3fMEIHzD2w8tddyJh+SADT+ugGY5wT8Cnvx49DaS13OJgmsDN8JIMAmy/DAuFu4Ck1lGFST54r29xoJ3dsiHFVcscZN/0UVaNDWvib2Lq8IJ1fvPMNqVdi330ruTZYCH56tK8z7bZRfMDNjRhYLRKVYFH+Un7Ok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915035; c=relaxed/simple;
	bh=y80EamY9y2zWQZhvveI9CQuZ/13bV5EWS6Q8gcZwY4k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=ojfYLbZIZs2d/csyQq4zgmas4k2YNRc1ftSYdvwHlOPpFtnQvs4EW4+56wBQBfIQogt7B3GAPU3TTwdKU/+qO/iEg4xoHoPz9tCbXMrcUkmDC6JDw3eXTIv6ZS+j1nUjFu+qWlOl/TJk5x1bEplMeZ+Oy/8Kzv7qWfNaCk68D2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Gz1/oTUa; arc=fail smtp.client-ip=52.101.72.4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KhWItqUTgm5gnTeiUgESvnVf+T1Lw9q3+Zcc4w8qfyvtmPiDK2d8P+HFneygtzuNSvKEzQs43t5asCO9ka/P/qNN9aga05iJx/B78UIOjkg8TeEvpJOFDrnCm4z/8pYIuSoSGJMvHRxKSvUyedvjZ7fbAW4ZIvsqbEqB8hflfYvSpKqhU/PVH1V8QZ1BkywghLOUpkRgd78JmPt1URDwNvz+S8wHe6f2amdyG79lnN7HFjRiBGP4D9EyouoDchvjRZkYWcWTigQE6jYo++VG/8Z3I6scXCFvtRHc/6tZCR0VsuCjrAITsMJW635+NXEBRhvmqhCJ8q6zm9b/nWD4xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9J6btTzUT1zxq6Rncc+jOW2GocyyUV0WqVOciQHLwCw=;
 b=quBP+CivugF0yDV7INcky/DUpxXQbq+OVPPoFe/0sIw/+u2ZTRbkkUr+Ax74jZk6Ukm20/y3xEptAahQMspfODdLLIL7b33RV5W+XmTUwLDwA08rVqoP0Jjb5Nh6XgW3EYs29/9PFtdRQk9H+omtLigrwMv6FMSUg++L3+XFOGoA1bK2m2N4K4vBhaZjXBS2WvPmQLfpIYboith0CcuNUfrJm0JNTeTDRTA4boaYExKzMS0Z0aZ193lOY+w+MzxEwjr41Hb/cxWLbZWdZJPzwEPkXxQWVp+KCvNToeykr8xumTmelMrl9+dYpQ6xtZGDEKfWUZJJyzMhR/WvTuF3bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=raspberrypi.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9J6btTzUT1zxq6Rncc+jOW2GocyyUV0WqVOciQHLwCw=;
 b=Gz1/oTUasaHE9rordYWaTD+4D173TdeyUWoiZDWOAtxek1ybMZ0Mu7xOh5G4NpumipeJNcgQhX6MYtJ1vitg2dOWvKIIpJT+7v/JOJp5qKNyPoSMR85fKksZ+34f621KhZEPA30KN0800Dk0cwCv9OINUAoOZQ4AYhgY5ujnYrOzw2bETUThGgEvrn0ORHbXpgVHwuObYIN8ecqV13enxJ/a2YZLYCcv6+SEWGV27bxMwil+9Gf5/uoVCWLCPCCSo8i5u03iuRxGxYE9iytJNOtzRVB2AupqmNdBTITqb7T+VmDuoO+jAN8RqJy3+AyxBgcDV9tijFpm+Ncyoopmkw==
Received: from DU2PR04CA0223.eurprd04.prod.outlook.com (2603:10a6:10:2b1::18)
 by AS8PR10MB6948.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:57f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 14:10:27 +0000
Received: from DB5PEPF00014B95.eurprd02.prod.outlook.com
 (2603:10a6:10:2b1:cafe::2c) by DU2PR04CA0223.outlook.office365.com
 (2603:10a6:10:2b1::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Wed, 1
 Jul 2026 14:10:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB5PEPF00014B95.mail.protection.outlook.com (10.167.8.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 1 Jul 2026 14:10:27 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 1 Jul
 2026 16:14:39 +0200
Received: from localhost (10.130.78.67) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 1 Jul
 2026 16:10:22 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Date: Wed, 1 Jul 2026 16:10:27 +0200
Subject: [PATCH] media: i2c: vd55g1: Fix wrong output FPS value
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260701-fix_vd55g1_fps-v1-1-fa865b7582cb@foss.st.com>
X-B4-Tracking: v=1; b=H4sIANIfRWoC/yXM3QpAQBCG4VvRHNua9VtuRRJmMA7QDlJy7xaHT
 33fe4GyE1YoggscH6KyzB42DKAbm3lgI+QNEUYZ5mhNL2d9UJoOtu5XNRRT0iJSnsUI/rQ69os
 vWFa/dW8n7ra3Avf9AOzLtn9yAAAA
X-Change-ID: 20260701-fix_vd55g1_fps-d3d4b00d7630
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Sylvain Petinot
	<sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B95:EE_|AS8PR10MB6948:EE_
X-MS-Office365-Filtering-Correlation-Id: 35ffdfad-190c-4406-bd72-08ded77a8069
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	aLCfe6XrPB+lOOWSq9B8jQw3xraNpFSVPjk924kPSMlsjFHuLPMzLQEob2OieuY2lakta1kqruL+kdPid/qZX+LrSi/4nG7vyZbg4b/8n7XiyIaE1NHd6V8X/wCROWxbReUbu9yTrQCcS2Z7TranB+NDfZoofnWxRtxUx3Ok6SN/PGo0oyruemy1GOwcBqkiPlfOPK3/USNGkFdlqLLjC8dE7ZPZOqdknr5AFChz7gvqHq8LBrLvULecE1loZXKjjPPGulcjBQ4l1nDZgps4s7VTykLWTSaKgLtyrggif83TXMjEwDYjcKNiCxgymf1Tc2HxzY5AZEleNJLmTREAc5vkCk1sYd3kOrr3tFYyz/K/XaV9DYuvTb4c7rA9ihaRLmrTRbfxFqFLNhyswnQqmNKUO2r/NKScscNFzKoLBx6Wt9VVPeNffXum+I0tWihpQCsruv/KknMI36rJ569meeB2ZP/JeD0Y+HrndXd0xyMMNTNxxzAd0Ukuh0yaCNS9Dg54zYttv/Q5e51HRplSU0kVudjQ0fynU2G0J8adnGOZhg4gyMx1BbywVdrELl+jhxZwH00IbUXOKsMcum27fYOQXjPDJVcZPrblSoVXPNSDcYQpXIxvqZOwl110VACeHy4tg1RUg14jSGlHEnX8pXDbeMTCBzG1sBrxU/R1Hb+gS9/oT+YnPoYicuwDL0ORLBCFgjwCnM+kfAXyPVjOjQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IfZDMAPX992PsJ29bY2IGiLxBOMuZQtZL+mg74tDa8L1Qh7f55NQmGJEQjYU+8M4rSVQKT+SK1MxlBKfPOM5fpK54Hetd/M/s6X8Kghj96MJSPpESHLLCwIy7nM0RMAr5X5WhXsL1CjOlPxIg6s6PAw7mcElY0JOQ8X4vSqFS74+s6CS7KBfnMXpRWMq8UJsHsEdMw2cYJisYcKtQBVWhePa6kCUOOqpzowCylMz/dsM7S1PYucU55Y4g9+BpqvDtYT2bnQoP1c315mlOx9N/SFF+KscGhwHrUgW1SbNeIxAw9/dlu/YSlrmMwPembpWJzbTXC97RKgNFcqiWVtxznSXjxk7R06TdCw5u+/kMVowkAlDc9g3vLf+2kSHgrAJvUnsv0XbZ6lfYVrUJBHgD5G3W5jczisvyuiI2Eyp7+7X4H6F52cQceeutnGw6Y0+
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 14:10:27.2442
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35ffdfad-190c-4406-bd72-08ded77a8069
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B95.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6948
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66228-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,raspberrypi.com:email,st.com:email,foss.st.com:dkim,foss.st.com:mid,foss.st.com:from_mime];
	FORGED_SENDER(0.00)[benjamin.mugnier@foss.st.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:sylvain.petinot@foss.st.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:benjamin.mugnier@foss.st.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benjamin.mugnier@foss.st.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6F7876EE98B

Running the sensor on 10 bits mode resulted in FPS being 25% faster than
it should be. This issue did not appear in 8 bits mode. This is mostly
noticeable with libcamera as it can set a target FPS value directly.

This is caused by the V4L2_CID_PIXEL_RATE control being dynamically
changed according to the media bus code, while it should be the same
regardless of the code.

Since we already compute the pixel_clock, use it directly for
V4L2_CID_PIXEL_RATE instead.

Suggested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 drivers/media/i2c/vd55g1.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index 78d18c028154..bb11394ed3e5 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -649,12 +649,6 @@ static u32 vd55g1_get_fmt_code(struct vd55g1 *sensor, u32 code)
 	return vd55g1_mbus_formats_bayer[i][j];
 }
 
-static s32 vd55g1_get_pixel_rate(struct vd55g1 *sensor,
-				 struct v4l2_mbus_framefmt *format)
-{
-	return sensor->mipi_rate / vd55g1_get_fmt_bpp(format->code);
-}
-
 static unsigned int vd55g1_get_hblank_min(struct vd55g1 *sensor,
 					  struct v4l2_mbus_framefmt *format,
 					  struct v4l2_rect *crop)
@@ -1285,12 +1279,6 @@ static int vd55g1_new_format_change_controls(struct vd55g1 *sensor,
 	if (ret)
 		return ret;
 
-	/* Update pixel rate to reflect new bpp */
-	ret = __v4l2_ctrl_s_ctrl_int64(sensor->pixel_rate_ctrl,
-				       vd55g1_get_pixel_rate(sensor, format));
-	if (ret)
-		return ret;
-
 	/* Update hblank according to new width */
 	hblank = vd55g1_get_hblank_min(sensor, format, crop);
 	ret = __v4l2_ctrl_modify_range(sensor->hblank_ctrl, hblank, hblank, 1,
@@ -1549,7 +1537,6 @@ static int vd55g1_init_ctrls(struct vd55g1 *sensor)
 		v4l2_subdev_state_get_crop(state, 0);
 	struct v4l2_mbus_framefmt *format =
 		v4l2_subdev_state_get_format(state, 0);
-	s32 pixel_rate = vd55g1_get_pixel_rate(sensor, format);
 	int ret;
 
 	v4l2_ctrl_handler_init(hdl, 16);
@@ -1591,7 +1578,7 @@ static int vd55g1_init_ctrls(struct vd55g1 *sensor)
 	sensor->pixel_rate_ctrl = v4l2_ctrl_new_std(hdl, ops,
 						    V4L2_CID_PIXEL_RATE, 1,
 						    INT_MAX, 1,
-						    pixel_rate);
+						    sensor->pixel_clock);
 	if (sensor->pixel_rate_ctrl)
 		sensor->pixel_rate_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 	sensor->ae_lock_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_3A_LOCK,

---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260701-fix_vd55g1_fps-d3d4b00d7630

Best regards,
--  
Benjamin Mugnier <benjamin.mugnier@foss.st.com>


