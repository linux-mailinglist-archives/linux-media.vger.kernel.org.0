Return-Path: <linux-media+bounces-65897-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C/VNJhdQQmp44gkAu9opvQ
	(envelope-from <linux-media+bounces-65897-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 12:59:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAA06D9224
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 12:59:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=foss.st.com header.s=selector2 header.b=Pf1Sn194;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65897-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65897-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=foss.st.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD60C308C30A
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 10:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BD5336CDF2;
	Mon, 29 Jun 2026 10:55:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013018.outbound.protection.outlook.com [40.107.159.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DE1346E40;
	Mon, 29 Jun 2026 10:55:03 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782730505; cv=fail; b=GVy248TxPgZsCBSdOPWvwT5xqBnLohq3dd5dQ6m3/xGy8M2TNlkLvP96OBdHlQC/RzejnK64fG5QFsN2PThNqlgrcwS+fj8+nEu7A65DLU8AwPUxjV1ZzdrBW4kjjCJ8YarX6aL8XWEAEMLxC6Mb0jB9+Mu9CUBTJcZqRygDaK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782730505; c=relaxed/simple;
	bh=TfykWEkIVha7oZam1euWLjZnzq33e8FfWYPli2lsBvI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=kzBvuBuK9DwXYNQvvc8uhfNFb4ppVVaVpbf8rO0SaG4YKXYv3VEbNM/ciPMnChqD0TPP/ROAMYOPLgubodIuxftkIJzDKBTo6PJdt4gm2lohdK2qSiWybI7qgJNWLVHX55Pco8n7E505IVn84zzDr7Ohn+ub8xv89KyIv6YFtzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Pf1Sn194; arc=fail smtp.client-ip=40.107.159.18
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HLEmt/c40ACLXiEC4WvxPBfCLZORvE29GMiu/L3vkoMwaSX2LDiqINsLImKMbuOyuoX/tF6NFfm9sm22wr7vtVs2r/PbGCG+kT+b9FLQe0K7+XuvNyedoyUiXNaFH4+By20r5DiHAMriA8UaeEZW0CbI6Mu0njDuNbvcDyowYoaW3MzkXqH94t39apxu0SeYTe/Ud7tVw3SJO99oNuxZRnWGVVT+dhGvgCnFNcTGaM5pBFvshkHTVoHNirF82lZ9SFjlcK775i2fENRA3tP9wmnIkOEdH76yCoNLUfPjTKiLXiz30PjacaMkJNOlQSw7u2MjyozPli96Y98f8pe/8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYrmmwbyNYYxUPLdIm0ivmbDVZVeY6s915qwi4wrOk8=;
 b=KUgEa/tDn1zq32qcx0S7pbUBeDCr6c+f33lU7QXWnpgzsLTTwgf8jjGhULaQ1CK1N01NtOFlN3pvrdEtBo/VavTIHKik5NK2SMxmNgHm+YFCWVtmfVNxnK+SaxvYp7FZ3Y92zgHDa3Rcc0ZtJBcqI2V4JVDE+KswKRQo5Jd2FT+lzAy6LtfPnEiraNMk5/d5Ze8dSaSNpcQJlFIjRZaWrtb+5x+7923YRVEEsDPLZtid9JJHDuDmOYdVJRVXqAJZ2/f86BerPfweTri/CiFdTo421vP42L24eG1rvwNJKYVTW/sSRt5RTmdRTFJ01VuPHRRqlbH7D2z9uikFicaKhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYrmmwbyNYYxUPLdIm0ivmbDVZVeY6s915qwi4wrOk8=;
 b=Pf1Sn194E8qBITAF7jclGKWIh1QRLSBT4pgyOmVYlzfO/1vbvgcEbUCoOORLi6s9KZVf0f8vSx7hUpdZK5EaMy0QxiiKq2fG5ku7liTPJOLinOqQmjtPg3rU+WoJcIpp6hzXB0VfslLRBJ8Iz/drhbmh0zyDKJxMB7keVEmVXiWI9kGkCbNiaWUvjPRadGlX6yGyY2l2vT6DrYBTHu7dYA9YPYnFhl/1IaR149lZY54tH7xOkjQnLq7uWkso8J/QZ4kqGYDkR1i3zI1aBnkHHeKWmqyNdJkFZHtrWEnVRuhnK+SdcBHeYDQ4v9lQCZqUgIIDXy3Oj9U/aUz/m9jTEQ==
Received: from AS9PR05CA0279.eurprd05.prod.outlook.com (2603:10a6:20b:492::11)
 by DB9PR10MB7196.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:451::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Mon, 29 Jun
 2026 10:54:58 +0000
Received: from AMS1EPF00000047.eurprd04.prod.outlook.com
 (2603:10a6:20b:492:cafe::32) by AS9PR05CA0279.outlook.office365.com
 (2603:10a6:20b:492::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 10:54:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000047.mail.protection.outlook.com (10.167.16.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 10:54:57 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Mon, 29 Jun
 2026 12:59:12 +0200
Received: from localhost (10.130.78.67) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Mon, 29 Jun
 2026 12:54:57 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Date: Mon, 29 Jun 2026 12:51:47 +0200
Subject: [PATCH v2 2/5] media: i2c: vd55g1: Remove spurious pad format
 update on init_state()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260629-vd55g4_and_fixes-v2-2-ea0a7cf3cd66@foss.st.com>
References: <20260629-vd55g4_and_fixes-v2-0-ea0a7cf3cd66@foss.st.com>
In-Reply-To: <20260629-vd55g4_and_fixes-v2-0-ea0a7cf3cd66@foss.st.com>
To: Sylvain Petinot <sylvain.petinot@foss.st.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000047:EE_|DB9PR10MB7196:EE_
X-MS-Office365-Filtering-Correlation-Id: d77f39eb-d74c-4a65-7155-08ded5ccdc51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|82310400026|36860700016|376014|1800799024|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	iQQXw0gd0AanITdFzN58eHImQ6BaCj+Bfi3o4Tno0y+1Pxr6OSM5e+xLjNh5OmnT45T5/0kGKL3HEHwLafq0GfMtRFGICAD7FyEe7qDiZa2YJ2myFb7msjhvjLNEHK6MFFQTIeSq4m0STF6fWj6NlmhAC1nm1Vwr86SIwC+jBOu+9l+0rH219L44to6Xx8dAb0jnatb5e0vu4yuKBWxVXbwlqsFK8shlVDpK5B+WAZxamIj1a1flc2gpIq5drRLLRIjVXKMF7n8HTDMUafqFBu9KMBlu7a2LmOHSe6NUf1rxIfXVpL82Pe2R+QYcpyEz7T4exldh/hqIFOvPOG3qtMs3fQh0ojBoKo1bMHyL/inRyuq/rr7tvS/EeMpktCHeRh0FYTy/PANNbmBd6/uLNKtWE12O4yibrnCDZMxY0qGA2GOBNvUXqanSlkkXKT1SbSgaygj0Ws4dMRh5/pnG1paac1hD4gv93fsUxISABYRDh4wOIE8S0bhZ6s8my+fmlAG1hTeKUzIGyolWoaDlOzfvGih+CwT14FBMc8pOaJHi91sn98TGroj0nU1da5GtgBFBRHeKvT8q2LsBToAQ7ZgtiYbD9h+SrSzflh3tj1CK7VIx+/4tmpFyD5okFY93fjJiHJjTo63qUbICY/hrYhx/eSkQlA2uU3VrcRA67TksxTwtQs5LVAqRys3umfhzfXyX4wiefJfGCF4IhaRbeg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6Ua9LyQxhdjaze9mNCzYE877Jmex7ijKKFJoTEb5DkL5LeJdbpqEkHKIyLH06qEDQcojx66ESBgsgSOJbfQA8Vp+Ffo6EYfcLpmjyXHw4thaqb67ZsZvk2j3tBu7OaLsMUAwdehGIffXZTAQrJf8xmtfsOVY+kDG3lHCNUyXwQ0jsQuLEDQKOZPYSg9ipaPrAKMR04dy0XPHg/2a4xeHwKkfdYWC8w6XnLU0mYQv2JX4sOWWcF4O6oAuqPewruQuvm6MCj7fRInGjwjU5M5hdsYJtujw0KXTnqVFAtBN88xmbis+6LnI7qWGAFIJ/icCICFRUKMEq+Gvpl7N/qXJ/6wlzj1ipX2nszFYM2ZIXHomIPIwfdwCv/vqTHjcjmd/s3i0uXgnzacBpbU73+OvpvITpZyyz26h+Kvr4ybfbFhasO1azZ4E49etOCakDnOL
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 10:54:57.8634
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d77f39eb-d74c-4a65-7155-08ded5ccdc51
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7196
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65897-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sylvain.petinot@foss.st.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:jacopo.mondi@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:benjamin.mugnier@foss.st.com,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[benjamin.mugnier@foss.st.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,foss.st.com:dkim,foss.st.com:mid,foss.st.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ideasonboard.com:email,vger.kernel.org:from_smtp];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0FAA06D9224

vd55g1_update_pad_fmt() is called in vd55g1_init_state(). But
vd55g1_set_pad_fmt(), called at the end of vd55g1_init_state(), also
calls vd55g1_update_pad_fmt() itself.

Enhance readability and clear confusion by only preparing the format in
vd55g1_init_state() and let vd55g1_set_pad_fmt() update it instead,
effectively calling it only 1 time instead of 2.

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 drivers/media/i2c/vd55g1.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index fceb437e19be..22464fe31562 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -1365,9 +1365,9 @@ static int vd55g1_init_state(struct v4l2_subdev *sd,
 		code = vd55g1_mbus_formats_mono[0];
 	else
 		code = vd55g1_mbus_formats_bayer[0][0];
-	vd55g1_update_pad_fmt(sensor,
-			      &vd55g1_supported_modes[VD55G1_MODE_IDX_DEF],
-			      vd55g1_get_fmt_code(sensor, code), &fmt.format);
+	fmt.format.code = vd55g1_get_fmt_code(sensor, code);
+	fmt.format.width = vd55g1_supported_modes[VD55G1_MODE_IDX_DEF].width;
+	fmt.format.height = vd55g1_supported_modes[VD55G1_MODE_IDX_DEF].height;
 
 	return vd55g1_set_pad_fmt(sd, sd_state, &fmt);
 }

-- 
2.43.0


