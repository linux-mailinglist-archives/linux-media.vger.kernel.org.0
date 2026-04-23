Return-Path: <linux-media+bounces-59437-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LW6Fk1p6mkHzAIAu9opvQ
	(envelope-from <linux-media+bounces-59437-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 20:47:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8161A45632F
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 20:47:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 33549300B9A0
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 18:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA9043A7F4E;
	Thu, 23 Apr 2026 18:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seagate.com header.i=@seagate.com header.b="diPOua0D";
	dkim=pass (1024-bit key) header.d=seagate.com header.i=@seagate.com header.b="hX1XNajs"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.hc4959-67.iphmx.com (esa.hc4959-67.iphmx.com [139.138.35.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD9A3314AE;
	Thu, 23 Apr 2026 18:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.138.35.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776970054; cv=fail; b=jNFiGfHXpg4iQAdMmRN2t7PhfZu1kZcUOGcAHIAuA72xSD8cHi+/S985FXTruUYRe8GDI8k7Y3kERgyXR6nv55gU1ncbAOnbV+VbsLE2p8Hd7Aff3UVnyT+c8CJ95QKSJqt1yjgspBJAtiSDCJaqHZrKJ9r5iKBJcR1lkVYpB3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776970054; c=relaxed/simple;
	bh=1lmFyQjnSLUrr9ROvR51RwCa67C27F9oVuo5ZqVfTBE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YmVHcCHOgWPKgYlG6bd8b5H0rILNu06Z7AfjW+8ubz8l3MQXxOcIIGq7iCFWH2aDnrT36zGGYEdSgGH2vnjZr8lETqgQeY0LneAue6Ifz8Qbfut9WlGKxfEEYShTCr9o6ypB3q8jQlOFg6t8PkC/FldyAIdny4+ogQM8/H/RkcU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seagate.com; spf=pass smtp.mailfrom=seagate.com; dkim=pass (1024-bit key) header.d=seagate.com header.i=@seagate.com header.b=diPOua0D; dkim=pass (1024-bit key) header.d=seagate.com header.i=@seagate.com header.b=hX1XNajs; arc=fail smtp.client-ip=139.138.35.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seagate.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seagate.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=seagate.com; i=@seagate.com; q=dns/txt; s=stxiport;
  t=1776970051; x=1808506051;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Y93pSLYZHlF9mASAxp/yzKptSC+SikTPvD+o+8GquDE=;
  b=diPOua0DJauuaEGou4YTVsuphYXxUPYZf4l/8Ckuh3FGueeezEoitidr
   4tr1LH+hSzV4Kgs4vAOQU8OOzim8r2MqAHAshSw3oxE9CH/QlA8YNgbyR
   ng4rKyDzQw8YEaFl4qVbW8n7ky+jsWGa3HdI539hyHNx/ccnHD6V6CbMp
   c=;
X-CSE-ConnectionGUID: jFEmzA+7RxeIparFK2x3Eg==
X-CSE-MsgGUID: po3RjwBSTeuBTxcnWlnseg==
Received: from mail-ds2pr08cu00106.outbound.protection.outlook.com (HELO DS2PR08CU001.outbound.protection.outlook.com) ([40.93.13.54])
  by ob1.hc4959-67.iphmx.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Apr 2026 11:46:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S+P2VfMJ62x1TC+nvLub/68d2edMagMBRPz2x0XInngs+2dm+5ZW0hThZgrzjSqkE6mge5DhtT3vB9zW/qR3chZrkeiIfx9QYFotzcK/OToARRgQG0GNBXv8H8HmJ4Jka7I66EzyR4WkQ81J0QLY12A2VR6vg8nyFygCfj2AnKycOQWW/7cnZZaRN+Hqgx9YLpALERoJXV5Svdf+sRynuxRlbHP7EoeFWcmnSBAQx2CO2uTMv/piD7JCqKjjWo7pgthv+b5zWw+HmW/LpuufjKyhCewRb7lpZCCDb6UgVVh+I3HbxEfqBDYwVq11ZrmZQqRcEIc7gjJrt66NNe/RYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y93pSLYZHlF9mASAxp/yzKptSC+SikTPvD+o+8GquDE=;
 b=cYnyxmdcKVbV+ysGiXids9Nv9YCsetNdp/5KpzC1DEIUEJmKT1WK74ZvaHOll6v7WN9baTZkxkHXO23XaxyipPY2x2FoSAUZGxfWWM/mWP0mpbbXCVVmIBTZpEbc/KrtVM19r9EH31hag2FRX6/rHiE1GP1CaYACyMKmueU95hI7cCOtVrIamVYnOWG3a7nDv/9pcFgswlTHtV4XBoCxpzOJlOni2SwO4A36UFL6eL088YhSEUYSRqeqc2dnYVvB/AfPSQpwTr438g2l63u7bucSHT8iHTKs1bJiCK0m7Sv0jOlCBQdGMbnNeUcEI64ZZk+5mz9845hLZGuzHgerww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 134.204.222.52) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=seagate.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=seagate.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seagate.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y93pSLYZHlF9mASAxp/yzKptSC+SikTPvD+o+8GquDE=;
 b=hX1XNajsK1r+6ZapZqGXq8L5tDls6c9OO7Vu94+2aCdqRhQEyoZ72rkc0r1RN2i+9XcA8kuxumAmiyKpmNf/YC24uRWZ+0JVj6azY0TnvEi85f+14zH7j96w/f1IKKicZCMQbDDjsLVFSkDgVbSMbFBr6FMdb2ZxyF85BdRgxvc=
Received: from BN1PR13CA0017.namprd13.prod.outlook.com (2603:10b6:408:e2::22)
 by IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Thu, 23 Apr
 2026 18:46:17 +0000
Received: from BN3PEPF0000B373.namprd21.prod.outlook.com
 (2603:10b6:408:e2:cafe::21) by BN1PR13CA0017.outlook.office365.com
 (2603:10b6:408:e2::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.22 via Frontend Transport; Thu,
 23 Apr 2026 18:46:17 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 134.204.222.52) smtp.mailfrom=seagate.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=seagate.com;
Received: from lcopzesaa001.seagate.com (134.204.222.52) by
 BN3PEPF0000B373.mail.protection.outlook.com (10.167.243.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.4 via Frontend Transport; Thu, 23 Apr 2026 18:46:17 +0000
X-CSE-ConnectionGUID: EPgmUJkwT6WBh3GnVrinSg==
X-CSE-MsgGUID: vKCp0GlSRJ6KGidVDBR/Nw==
Received: from lcopiesaa01a.seagate.com ([10.230.120.56])
  by lcopzesaa001.seagate.com with ESMTP; 23 Apr 2026 11:50:04 -0700
X-CSE-ConnectionGUID: V9fGJ8IwQOKEPZVXY7UWAw==
X-CSE-MsgGUID: nmCnqCmvTO2VoZ0vwNBBpA==
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="737398"
STX-Internal-Secure-Mailhost: TRUE
Received: from nick-desk-ubuntu24.colo.seagate.com ([10.230.88.139])
  by lcopiesaa01a.seagate.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 11:46:16 -0700
From: Nick Spooner <nicholas.spooner@seagate.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Nick Spooner <nicholas.spooner@seagate.com>
Subject: [PATCH] staging: atomisp: Use str_on_off() to fix Coccinelle warning
Date: Thu, 23 Apr 2026 12:46:12 -0600
Message-ID: <20260423184612.3199324-1-nicholas.spooner@seagate.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B373:EE_|IA1PR20MB4953:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 562574fb-b632-4b72-3314-08dea1689a78
STX-Hosted-IronPort-Oubound: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	fLqshieDWBAkwMd0m7W1279LiAW2X/IvRqV/gorxshHKK+gGDRL+c2NVtUtf/dG98169LsVLLdkEHmDdZYgLJlXNWFLrqbGbh9m82OPvfCoiCeZuhnLMNbJR/syH1OSD1bz8OWd5qGAVrPE5CWLGMbumcvpO5IdJOJ9WHoOHQPndDOa+VLaUEQctI0/YBXVV6RwXo37sd9/08kT3LRSSpaBd+s6DXZyjEVT7dmfus7uc09sN2JR9gN2d4xo5N66Kd4Yw626T4mxPUESKVh1J4fO8Ocs2AzQxSGFZE67Bxyti3zOnZbdFig+Ns4N8ZxwOEA0WPH8qO2E3ybdueh/oz+qZko2HwRHSjOg9htaC4iQXND79AttdU/yD9m0ph1owGL0Hblp3w3re7kuceiWOlpiWDWTLBGy8pXVEPH2gofbj39EkjK3g5ZzlvA9wq2xEROLTjlWxRLOosVfq9TTfHu79lYVjG7BwC77UOmhbNisn+BK/b5SfpyvbT/Kq4pf6SgQ91mTS7dbH82cLp0FLTvK4EwEWFwAcYUSfPli3VO2m/7vceeWf/UOKOP9lF32OeYIcmVKz7gEq2c3whNQE1bMnzbEqEme+Mf10AjlE0uzurVw3OympCwOdSNcFzg/kqzixsRyGZIEIIuNnsLFUAy3iSkW7nO9HAOFsVt48/o+9nsHR0bkShVgjFik3nr1W78K0Td3nB8LkAkCgIBcy7K3WhB41GanOMUGMsvxCmycw8/NZ/UZ0Y4X5y9B9t8wm39+kDbQmVS0rYd8R4MlS7w==
X-Forefront-Antispam-Report:
	CIP:134.204.222.52;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:lcopzesaa001.seagate.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iu6Adme9PVSTqGYgeCeGW4eIoebGMfI3uBy4kRnASmiI4T9TZPTUeQoxfEXEcyI2hiLAZtKV5Qx5+6IEqVqRAvFsGErjITcT4M/v3GMr6sIIO6zDrmYZAFNU0u9ysflR5+nLho1ZN3DJkfq1i12QzsjWWAXAaugPSgMzKw3uQajQY84sWcjcIKf3EPk5gmz4wjfP/bC4j2g3cXnZsBR5t1tKLnV/rOsEBqScO8nlM9l53h+6YzkN8L8OHbEytVPqLmOYBFi3AXdRXV2YPWvrl6nXklgSRZmFyiSSJS+BdAwtbRUrbKX4VakD0WUsOERAXo+wH9YfwjMDIzuOYsNgV0BwcXjT7o7nzhLdZWdGEMdQtSgWTDhFU6TxFgBJOMTuP8NEvNQ5FM5g4ZC3p6Dk2TPnd7EM4ZvOlXKbc9oUCHxaqsrESHvbtV4hPgj3w1SY
X-Exchange-RoutingPolicyChecked:
	RzDr3kel/H5cD4kvC+d2uY/ZkBCUrVQNgJb2JulAJkPkPBpMZSMAQl9OSCtZqxoh4R+ABm9H7vSNxXNxaluZq7AFAJHmh3O5OfPnMUDtLRroMj3kBRJwGFjlkQtGgBe3lusudGEoMzd6rhxGX1d9LIIekRN0wXQ2ko7MZXJLaI0MN7HPJsv6EThBDGkK14oGZLHrwCFJwL6RgwmqPrchKWvXQbQhhJpCx7OiG4mVZbTflAboL9mzcq1uV47e3Pzh7TYKVmQW9V6CnqM7T476BnaLxo9YYteLg8HAMEZMG+SuDp/Sbr1obeLEgaX4yEyGCZDPEc4Adn2BmdUrxgsJaA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+YyhmFqqs4JI4DC2t8k9Qr3aBg6siO7Xgfm1c0P3Ca3Foh9lJaxFXMeLIpqBtRVncsDG9U2t8S1VF/+QWk4bSe3+qTwseKlO8YyyiiBErspQ+cjpBsA0tIjJ8vhPxGguQcbgKRFZ13yXXRbC3DJ18aUMiERCSla3yq3JoobbMmBNxn5LAwSw3/pSI8RiYmvjtymUw2syuPAAGhRdFf26kYhZbLV0gV9HG0MA87iTTNjk657wFD/trCaXUbKcP8/Hrz2JESTi4NyYMsT2ita4arAGg5dLX69EjrNifBbaZmiXvjoYYOwmp2kRAESTRMVlICe/owekwjIiyY5GKwAiAl7lpNeV8yNXyA4eesrdmQky4ZXoF5PpGxeNuR/LT5/cIMzrC9d4jfQd54Du/6QN+OA5qdbOexDWGy/rtmx2XnCkDo6ESyKObaS3YWEIGCv8+LgbKD0ksT4B0EgqMo8W9HyY0R076xDRAjwq+Yj4GABf39+JGVIygz4h9H02VUZ8Aw7bdqxXyxH2wDXBVx10ONDvhrWNs3LOYtJ2R03LZo6IufYyLZnxc2BT1VKnUuykG4bPXgW/xNsU3ok9B0YgvelsTGxpblxLBM0jkrMEEP/kpc79BPVrrwlHLu0y/El/
X-OriginatorOrg: seagate.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 18:46:17.1106
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 562574fb-b632-4b72-3314-08dea1689a78
X-MS-Exchange-CrossTenant-Id: d466216a-c643-434a-9c2e-057448c17cbe
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d466216a-c643-434a-9c2e-057448c17cbe;Ip=[134.204.222.52];Helo=[lcopzesaa001.seagate.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B373.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR20MB4953
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[seagate.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[seagate.com:s=stxiport,seagate.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-59437-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[seagate.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicholas.spooner@seagate.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,seagate.com:email,seagate.com:dkim,seagate.com:mid];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 8161A45632F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fixes the following Coccinelle warning reported by string_choices.cocci:

	opportunity for str_on_off(on)

Signed-off-by: Nick Spooner <nicholas.spooner@seagate.com>
---
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 4026e98c5845..322eca4a3755 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -13,6 +13,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/gpio.h>
 #include <linux/platform_device.h>
+#include <linux/string_choices.h>
 #include "../../include/linux/atomisp_platform.h"
 #include "../../include/linux/atomisp_gmin_platform.h"
 
@@ -917,7 +918,7 @@ static int gmin_acpi_pm_ctrl(struct v4l2_subdev *subdev, int on)
 		return 0;
 
 	dev_dbg(subdev->dev, "Setting power state to %s\n",
-		on ? "on" : "off");
+		str_on_off(on));
 
 	if (on)
 		ret = acpi_device_set_power(adev,
@@ -930,7 +931,7 @@ static int gmin_acpi_pm_ctrl(struct v4l2_subdev *subdev, int on)
 		gs->clock_on = on;
 	else
 		dev_err(subdev->dev, "Couldn't set power state to %s\n",
-			on ? "on" : "off");
+			str_on_off(on));
 
 	return ret;
 }
-- 
2.53.0


