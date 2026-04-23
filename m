Return-Path: <linux-media+bounces-59439-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJkyF4536mnTzgIAu9opvQ
	(envelope-from <linux-media+bounces-59439-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 21:48:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B637D456E76
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 21:48:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2EDDF3058166
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 19:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 194AE351C3B;
	Thu, 23 Apr 2026 19:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seagate.com header.i=@seagate.com header.b="HmbqTUv6";
	dkim=pass (1024-bit key) header.d=seagate.com header.i=@seagate.com header.b="iRhToZYb"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.hc4959-67.iphmx.com (esa.hc4959-67.iphmx.com [216.71.153.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3D32DE6FF;
	Thu, 23 Apr 2026 19:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=216.71.153.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776973668; cv=fail; b=NA5ck8HomeZWhRseiICXzHozg6HmjYNQIoi+D3KbkhPfdBbKG/QJddSeRtIjpXOIsDmq1TWGsCn78bjBInFBgXTRMyQP99I2D9Tlz+aMkda2SxLuHI60BJVXNhiheNHVBHt4w3pSV5MZZFFqao9dI+wfsEZQ8sEatgWjifQH5ag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776973668; c=relaxed/simple;
	bh=IjFxFnaLjOKsDSUOcGaDN6r5PXmhqhza7GnyvEhCjW8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rqsBsc14F+FVQ4zrMqdqbx5mfKBJsg3nY1fisTaJJY50a9ALGe4Loaw9LpYXaiWQVNXOTa6eo/9MzzeMJCkntfkaUM4C+rB67cK2LCeezFhzq9AAOQn2BFjUEKExkktu8+upe0WG9kaIbsRqEousHJIAkvIzncoA8K4ORtv2MwY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seagate.com; spf=pass smtp.mailfrom=seagate.com; dkim=pass (1024-bit key) header.d=seagate.com header.i=@seagate.com header.b=HmbqTUv6; dkim=pass (1024-bit key) header.d=seagate.com header.i=@seagate.com header.b=iRhToZYb; arc=fail smtp.client-ip=216.71.153.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seagate.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seagate.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=seagate.com; i=@seagate.com; q=dns/txt; s=stxiport;
  t=1776973666; x=1808509666;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tTCFrlTKACkxm/RZ1ByxWrACgSApsM0syp2Zjhk+MIk=;
  b=HmbqTUv6B1iN/EZwUwXiKR8x9EHQMqUuZnqTGw3iIe3Au6YvWfHY+8d3
   REdSx2GFjTUHsiD5tM0EM+4Q++n8QsIpApcSDbLLgqb2kwsUT8uNj4Mqy
   XH7mO9A09y/ps0SnUw5lJSf6NLkut+hcuehOcXlkAnnuik2b57bMyIfrJ
   U=;
X-CSE-ConnectionGUID: eqNuzYHdS8Wlgwp6dEt1hw==
X-CSE-MsgGUID: eFVIpgg3TweFESjsSjV1uw==
Received: from mail-ph0pr07cu00601.outbound.protection.outlook.com (HELO PH0PR07CU006.outbound.protection.outlook.com) ([40.93.23.89])
  by ob1.hc4959-67.iphmx.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Apr 2026 12:47:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MSxebQd6co3N7xOEJl5gD6+tnxR8sM97cHo5+MzdQDdBlJKNOJ2YYWsyREk84vTCezrMkdbs8C2V1/tncKr+Ygp7Dd5cFq6mxx4j0tVyMDsE0dbWYvIi05h8RXnVE9+Hwjo1TwMal9aKd9jjyN4jfW64J2BzhvcAdEzysOelicA7nRFuMNRVGVBq3a2DgSlcXnUnbFbxN80VhUJcyPcPkhoLghRGMEtofNCQ81aMKHI+xkbJ8N3UXlGV9lPcWj2IcQHJO058NwV1eEhP8Ic9Lv4YkGOF4aEJCKVCTtn7VNJu9zo5dAJmQ48Pg57vpzZAG66ma9dLWHmKiDTnju7pJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tTCFrlTKACkxm/RZ1ByxWrACgSApsM0syp2Zjhk+MIk=;
 b=mzzwReiLIpkJyRYlzguQewF7DCZef7t2/rxvptyYZb3cdhKZUaEMfxPBL3GuLlQVW/E9AYpO7G2rHlC4KlMjWAb1cxqgWN+0re8y7uJ2XxGEKuz8mHUWlpZoTRsawcnoWmDcX7VBVjQjVI9tfaealYv0+jFIu/36oUz5OF7rtdCNPu8Zwz/IQfbjd1IZmoyw05cj6B3QjLTqEckqL5ukX13QH8CKnohDzjBg7guad09efZF1w+RroksxW5oElj5watRmIclrwHdh94Rip9LClw0pWe5KdbpPr3VMWuEwMMTBi0npD2PgQS1Ry2BQb5UTi5JGxswmZenSIxdeQO2KsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 134.204.222.52) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=seagate.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=seagate.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seagate.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tTCFrlTKACkxm/RZ1ByxWrACgSApsM0syp2Zjhk+MIk=;
 b=iRhToZYbjMA+l1e1HrtHTIO/20LVcTWar5Zpo6txgwPNRKDYvf5Etc9NGFX/ESrFrh6ZO5Pw/b7Pjtb6W4aILJgLDWz3Hnz8RSQXjXJtZmxZy9hICD2fvYHN4NgVxgAm7zHT1zz7ehWx7gtOM/WvCINVBQTFftcQa1YxsrvMZZ8=
Received: from PH8P220CA0033.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:348::11)
 by MW4PR20MB5589.namprd20.prod.outlook.com (2603:10b6:303:21a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Thu, 23 Apr
 2026 19:47:43 +0000
Received: from SA2PEPF000015C8.namprd03.prod.outlook.com
 (2603:10b6:510:348:cafe::c8) by PH8P220CA0033.outlook.office365.com
 (2603:10b6:510:348::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.22 via Frontend Transport; Thu,
 23 Apr 2026 19:47:43 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 134.204.222.52) smtp.mailfrom=seagate.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=seagate.com;
Received: from lcopzesaa001.seagate.com (134.204.222.52) by
 SA2PEPF000015C8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 23 Apr 2026 19:47:41 +0000
X-CSE-ConnectionGUID: vo7CGamWTI+jfr8W9FcO5A==
X-CSE-MsgGUID: f9MQ0uutTwmd0AVubaEKvg==
Received: from lcopiesaa01a.seagate.com ([10.230.120.56])
  by lcopzesaa001.seagate.com with ESMTP; 23 Apr 2026 12:51:29 -0700
X-CSE-ConnectionGUID: PXJRirQxTSqCApNjQ9nIfA==
X-CSE-MsgGUID: jxnz/+3qSr+mQLyKGroODQ==
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; 
   d="scan'208";a="737434"
STX-Internal-Secure-Mailhost: TRUE
Received: from nick-desk-ubuntu24.colo.seagate.com ([10.230.88.139])
  by lcopiesaa01a.seagate.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 12:47:40 -0700
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
Subject: [PATCH v2] staging: media: atomisp: Use str_on_off() to fix Coccinelle warning
Date: Thu, 23 Apr 2026 13:47:27 -0600
Message-ID: <20260423194727.3200344-1-nicholas.spooner@seagate.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C8:EE_|MW4PR20MB5589:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ca291b1c-2955-46b0-51c9-08dea1712ec3
STX-Hosted-IronPort-Oubound: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	y2AMi7AmKZ7Ua2LWcyS90poC3ErdySlB5Uqo8vRIgtIwVpjxVdpgrZZa1G8cwQcpbP7LSZc/PrVoFC3JY5Mt9UGb7LGe2/nTyewLUigRYkWwmIjg1JG/95aJWxNzve51jq4ZG6NtBdWpIFc8SX4vqxL3GMJIJ33HbbNZkLhXCBM9wYzJFCCEMAr6pMvlMkP4p8xTqy+MQ/USzPmKjsZkHXDpxw1V3nN7ByKuqYdBCSCbCGe0SW58jgLi2XYEyRZQu1MqK+ug2hBWvlfAYWXVf4ZzJimJQRwZvnqFbXyckOdQmGDEGFz7uMwHKwJ8Zo1Js3Uk6Rl1/Fp75mZlIKqizas/4hY2tWVgnGQCaosS8exawGqJC+sD+hgxH0naoIJzLQHM9e7jt9faMS8NSoYVn8Ih/yIBQygVserA+5+7gvlgbWQeK1mUvRcwZeblUpovVHmn8ECA512jICkNVMmMHTv7DMAM6MFSzBGQXRRXWHGKNN3ghpXyv1uGivPZcJAFQ5XHRAZnRGFcpvAfhOYYUz9PkPAIJHwJErjZeTGxhXa+/iTvh6GSljD0BQfAHSVQ0yB3wHlc1O0gXGMpBUwC+fW89B6ZOOCUeNcrlJziH2eCgu/cQeobm9MZEJgMOvbYNTu8qyeqNwxVbpq8ikZ3y2RYg+b64S/XHajamsYrglP63u2eCwRb67ZU638ueGOL2w0KmKyPfyzD9G47KqT+wAeyTfoabEXvJri0OnKfx7t0Fiu+/Np5/60BEXhpGJ/D8VNfV7SkFgk4GTCw/SHPjQ==
X-Forefront-Antispam-Report:
	CIP:134.204.222.52;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:lcopzesaa001.seagate.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OJysjNFHRKmA6gqCrUG5rJcWclpp9m+gx2F/ewgRcRiKs0DlGiZj+JP/bQB4banYCB9AjUXvov0/thSozQy577EAuI2l4k5l8RE1ZYA7Mv9z3Qvx1wXrbBSNjXGoHcpgh2fLPcLgueDFo+FNzfZS1TIq4enIyAFcnvEOqB33ZwBrfTSg50N2HZBcOAHiY/qmVoelfouaa2Wh587uTksAH94YFlUm11nqpTKR6//gWioOiVeV0I7lhbJKw2Ctqygf4gSLg+7Jaz7kgSFAOt/4o/HmszabzGYUNr+nUCfbqYgHy5HcCwtOe9pFgDDkKiww3iMzSNrgeEu85BFxx0QRPP8YziwWvRqMYo7KruMFtlI0PE4eV+ZeQHr0BMzUN8S4wFLRjmMWbK/BHXDvSjf9zyvaVwOHK4JuPUrOgAGL3QRAMcx5ZYp8P1uXmJItXWlW
X-Exchange-RoutingPolicyChecked:
	lov4osORUWizXhNMs0UyFjeg/8Nl1M6Ygk84/QmQ5qr2OvCs8u/dW8stU07TTj0wHMo56Ij8EOM2/i2FGcRL0tB70cC0t0l2VHpX5EJXfiUKreHJoATTZageVWZIvZXcXlBXsvIdXWOYxL8OhJP7HVuUlDgx868QIU94smICfw52Vf9oz7TnALRYu17JM+45MvAQvQx4p+YcQOVc6Tvh/HdaotiWqQi8sfnoHHkL1X6W4hTb5Rz9iG+quYYwjkTHTfhkYWyBIQcqzE4iYC4MF25RqzY/HcwlzBwFGQXzkjBvBSAuv4SbosGt/3WaHgAn2cQel8Qg+hVj2mpjC9/1Fg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kGTyN8tkZv++yTEC501fqmSTNBZxuNiLq+ho9djS3fGbvdE7CUoRbPWzYjirUB6yq+05jmo7l6nu1AsrdqjA+NQIu0XTIgVInrwjpt3q/8XSB4Zi/KdAb7tz1poMKL6fsj5etQ/xEqhBGNdqxHJy9KRSVGB1bUxWzlJN7RS2tm4QI04pYJ3p8qdXIXly2UV/1juweRrrVhDs0i8YX2FeaKokD42mCbtNygD6GGI4qoPrc7yu1PeD5k010s/scrJMoNdYKhNQvz30KURqKdrnBIkO/6Q9lluOG7MJR2YBmqVdg/hN/WTazIoO2bgfj+Pk1Rpxf+26Veht3Uwh2rJjvXaYyt64GUkI9EVk1d5DUHa+tYhsWVJElA2RoptuVxMaMqhiczqSagP24KFHCemNivQzBHFNK3Py4zpuzT5mOsMfPGhBqTTcbjYKkKsmll9P62vUO9FdQDqfoPpYmOvXpCi/srDZVlSYaBIA7X/GPMeHMtyNWQXJTOxzdcSQFGLMU9wTttRSf8biud0C2cPCVSHf5xcWTTyGmoZyxrH8RbAVUH6KDUP+iMMMNxZtlF6UcExp0HTI9uoQiEimH0rQaAqcRbbUTikn9140k7WZfhjurY0VeAjoc1p8BzHvPBdP
X-OriginatorOrg: seagate.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 19:47:41.8130
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca291b1c-2955-46b0-51c9-08dea1712ec3
X-MS-Exchange-CrossTenant-Id: d466216a-c643-434a-9c2e-057448c17cbe
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d466216a-c643-434a-9c2e-057448c17cbe;Ip=[134.204.222.52];Helo=[lcopzesaa001.seagate.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR20MB5589
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[seagate.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[seagate.com:s=stxiport,seagate.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-59439-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[seagate.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicholas.spooner@seagate.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,seagate.com:email,seagate.com:dkim,seagate.com:mid];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: B637D456E76
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fixes the following Coccinelle warning reported by string_choices.cocci:

	opportunity for str_on_off(on)

Signed-off-by: Nick Spooner <nicholas.spooner@seagate.com>
---
Changes in v2:
  - Include "media" in the subject line.

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


