Return-Path: <linux-media+bounces-51261-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AF18CLTocGk+awAAu9opvQ
	(envelope-from <linux-media+bounces-51261-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:54:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id AEED358CE6
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:54:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CC4EA6CB549
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 14:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7CB4A2E22;
	Wed, 21 Jan 2026 13:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="R6WiQV7l"
X-Original-To: linux-media@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012063.outbound.protection.outlook.com [40.107.200.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDAB4A2E07;
	Wed, 21 Jan 2026 13:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769003774; cv=fail; b=NVXMozMEO7NM6rTW21LrabnO75+iv3bCB6SpOGC9wkCsXl99yDB18YcKtYWkilvF70IlV4cy1r+o/qbQR3rtnpybSSyLt3Eg4hrTBJV1nV5rwAlfcowb6vvSFIaHvusP+kU7GX3db19Qewc+Yh7BpTujCcwoYXriuqDGWMhDkYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769003774; c=relaxed/simple;
	bh=H++gB9Yab98NyINbB4j8/KdMdNNqoU88eqNkR74do6E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NYMQrpbUB/Q/h2yrj0oy3VY19C6Ds+dUoasAFs5J9zs0dYtKP43G5QQXYlcNj8mA8fgbfyS0SuUVvkMwD0GWDhy2A4PwrYj43VCHbvwjfVKx1z6eZRpdtE5MN1ZVu/2APC1Dlz0CFSigJjJfAX0YGilaDMs2FQrYzpXfNeofGD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=R6WiQV7l; arc=fail smtp.client-ip=40.107.200.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JeNmCrc1pwvGqfOyuVTeNQzN4J6DeozjBYD8gnGhEUeuEhZrkTjpIhO3DFIdKB/NtvzDtAVSeaETm8dq4PBg8crk64Hr9jLpaate4enZdGpU5/9Xm11zMty/VVAjB38vtbJsEhu6ft+qLVii28xHUOL+vnhZQ6BETJuubIA19tx2WxlTe3DTR4FF2YNaNoWS8krLrgjyF2QzdhmXEKiaZloDQLBfIFzX3IVnpLaTWszeobAOiMkS6kvo7J2301wqbHfzE+nQ/0WpUcJmqyblKI/tV30Jm5RNxJSESS8BZTkPYFjY/+NugpetBVYtM5l2pnhrwz2gDG4IA+hdhYBLfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0TvQMR08VYf7melrPVVIO8QEqf21n3qx5yu/5XtDoHg=;
 b=HqzTk3XjywQXS9NNQvVqET0zQbk/lCWOm1/YUdK6dVSdv5l9r2TRiH9k88kLHG+r8APZesRzr7WG1IqD2FboAlok0GDIH1lLZA/BfAQRkT+oF/4WEj99EK2OOhXJ06u2UJMUpswdaQ7AqPEBnR11Z/vAFk4ILbQFOtLNGNdqyib+/wvRvwDyDmRj/cGf4GQ6k81KsYLeYxtKm1TJiXk7AEaUnR7r2C68JnA31YbkBMy5bdmJ6IBaK3Dl1zYYqKr+5MWNcYfrcEhb0DIZeyCl0Hqlx0Zs3EPO94ceVd6PiX5K/sEuLxQnteHOcOpXG4cR/9jPzomVjpoU5z9VpkuRtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0TvQMR08VYf7melrPVVIO8QEqf21n3qx5yu/5XtDoHg=;
 b=R6WiQV7lsWv89RIWHO6s23a/yBQSk6iToL/punZRCga59dj48pNJjulf3Z8KkJQhk5/2Q/DdEFoemE7cc8hLoni5nq83mDP5WH0uY6JkHpUc7PgaIo4QDBS4v2I8aPB8DOmsatPtLB+ohZjmu4sZ8ZFW65ThbPSDcyA4o85HT/E=
Received: from SA9PR13CA0154.namprd13.prod.outlook.com (2603:10b6:806:28::9)
 by PH7PR10MB5724.namprd10.prod.outlook.com (2603:10b6:510:125::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 13:56:07 +0000
Received: from SA2PEPF000015C9.namprd03.prod.outlook.com
 (2603:10b6:806:28:cafe::dc) by SA9PR13CA0154.outlook.office365.com
 (2603:10b6:806:28::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.7 via Frontend Transport; Wed,
 21 Jan 2026 13:56:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SA2PEPF000015C9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 13:56:05 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:56:05 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:56:04 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 07:56:04 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60LDsPIJ3104105;
	Wed, 21 Jan 2026 07:55:58 -0600
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <jai.luthra@linux.dev>, <laurent.pinchart@ideasonboard.com>,
	<mripard@kernel.org>
CC: <r-donadkar@ti.com>, <y-abhilashchandra@ti.com>, <devarsht@ti.com>,
	<s-jain1@ti.com>, <vigneshr@ti.com>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <p.zabel@pengutronix.de>, <conor+dt@kernel.org>,
	<sakari.ailus@linux.intel.com>, <hverkuil-cisco@xs4all.nl>,
	<tomi.valkeinen@ideasonboard.com>, <jai.luthra@ideasonboard.com>,
	<changhuang.liang@starfivetech.com>, <jack.zhu@starfivetech.com>,
	<sjoerd@collabora.com>, <dan.carpenter@linaro.org>,
	<hverkuil+cisco@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v10 13/18] media: ti: j721e-csi2rx: add multistream support
Date: Wed, 21 Jan 2026 19:24:19 +0530
Message-ID: <20260121135424.1185710-14-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260121135424.1185710-1-r-donadkar@ti.com>
References: <20260121135424.1185710-1-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C9:EE_|PH7PR10MB5724:EE_
X-MS-Office365-Filtering-Correlation-Id: 061726f9-3cb6-475f-7ca2-08de58f4d231
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zqZQjv5//bYilEfpG/+4LgmM6VBLE5EowqzAruC0UPEJeq1ljnEiWYe0y9I3?=
 =?us-ascii?Q?iUoi4akKQmDiA8UWsVU8mXfhJyv2PSq+LjEFLHcBml0Ln/yYG6n6r061LeyB?=
 =?us-ascii?Q?Y4HS2237okIHwugOK0Mwr2f2yt3FiTxzu9+PDOJyQ3W+PE8XCZhuX7+aUXQH?=
 =?us-ascii?Q?JANE/lWWM4bHkcSyWzM1V/zWUZSVBJmHsHTSnFkQh8cfAUxUrltGg7R7sbwq?=
 =?us-ascii?Q?D7Aa1Ej1Guzz7pzJiOdDbzLbDijJ4p7AXtfu2o7g0ywEvJiyt37RUVRI4Tr/?=
 =?us-ascii?Q?Xj3HKXb0XSDSeohvpM7jVc/jUY6hCzKBTCfsN6CVkD/xffTXDTF/maaLqc+y?=
 =?us-ascii?Q?hiAJMqskzIjiv5uPJ8rgIhNzloW8v+JRH+LpyuUErHLpkV2/aFlUCTZHGvmD?=
 =?us-ascii?Q?ljivScTTW7i1fi8v5HrfCpJYPJmH2/RnPzfUfqdijTNbWtgjP2bUevAzkSzc?=
 =?us-ascii?Q?fUQRExD7Oq9IvlpedX8526jdsnHiFY+pfGs0Xg21L2bEzD5f5lURhLXcmZxI?=
 =?us-ascii?Q?6Vd51gvLD/6/UEao8nIXtNoYstx7gvxIJtWBUcsyaoucVZkcX7xYAhUP7JOb?=
 =?us-ascii?Q?2tXKcwuyIy3O9Zbegm842AlPlJdeJGH1qKrFCeeSHWe/RQDFqVzFynrbpAAy?=
 =?us-ascii?Q?oNnPQVlVVEwiJwI/mbKb29XHjPatULAN7gUMx+uzJVGTUFu1k18HREC5hjgf?=
 =?us-ascii?Q?LqVfrXYAhYcNx5VG2IP+FzpM6trzkxAjN9p3IHzSiq1Xa4wSF+r5cmiM7yuu?=
 =?us-ascii?Q?8oqmtJMnohOOwFl0ypJl10LMu+lOzbt8eDv5ICr1kfVMJfa3t1cQZRxKlvBk?=
 =?us-ascii?Q?BUZFNvOXEYlK044UfDyadJcXjKRuf76BfIKtHYD4yZnBFq802xRa84BqwPQK?=
 =?us-ascii?Q?4cvKGDv1Ca2QUdzKNNK0u7d9h1SmynHKNOBY8dSooFB17fYtJzvIVU8iifB/?=
 =?us-ascii?Q?NGQtDX7dQ8Yf/iH+1YMTscquow2dTK7lIOQa4oPep/YHxfqDGPRXsq6Glwmj?=
 =?us-ascii?Q?VXFP3ivd1sAcSp5bmuW0h8qWDyqwiJIZbTOb6W6t2oA7Lse1XhquSVsQPA51?=
 =?us-ascii?Q?5RWAJsiwOWPcFiRWzCVcoZcJ5PdHkERST1pAr/aKJOPCxt+xt03yEA7Codyv?=
 =?us-ascii?Q?EooTA8YwyCzlWWcbwexSTsUlJzRB1py/oTcPOBpk+3uyRLWUiodmHN/NIq+b?=
 =?us-ascii?Q?WDat8NBNgTS13r7U6QQyW+LTiCxq7j0IFXMLagivVj1oOo6urvV3zjusrYbj?=
 =?us-ascii?Q?tqdQ+JzQHsKboLUxgyIxLx8bLTPbAAFS94fK9NotKm1LSvKW6ccN80c0TtBn?=
 =?us-ascii?Q?RXIri+sEHZV5kGJIMwctY22C3uLPyMkO1M8El0PZvKfPTYpBEzujfHn0ywTL?=
 =?us-ascii?Q?KBxw4rNUf8sy6CW1dojArgiezDDOrM4CCk1myY6vec+HZavNHBSBcK2uW2/r?=
 =?us-ascii?Q?Odf5hlN5EUB6sJ2PNC36UcDbw4365pWTbA0ktEYbdCabfYidf8pgMG18eJPl?=
 =?us-ascii?Q?jQtStQq0JfD2P1yHD9ZWohRM6H4NKOGPXheZK9kxfbUOVvFU2SgFxqHhoYMc?=
 =?us-ascii?Q?0v6WN30t9gWug8LRBoX2/cXXMtZWK1Mr3prSSrlSZ7walmv0l8ALzil277LD?=
 =?us-ascii?Q?RgAK76OrB7vCLJCU9So4riIr9XsmBgFiP+IfD6jqbVf6u5O6vx+LqsVklHAb?=
 =?us-ascii?Q?RmCE4A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 13:56:05.4025
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 061726f9-3cb6-475f-7ca2-08de58f4d231
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5724
X-Spamd-Result: default: False [3.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,pengutronix.de,linux.intel.com,xs4all.nl,ideasonboard.com,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-51261-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[ti.com,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:email,ti.com:dkim,ti.com:mid,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo];
	TO_DN_NONE(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: AEED358CE6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jai Luthra <j-luthra@ti.com>

Each CSI2 stream can be multiplexed into 32 independent streams, each
identified by its virtual channel number and data type. The incoming
data from these streams can be filtered on the basis of either the
virtual channel or the data type.

To capture this multiplexed stream, the application needs to tell
the driver how it wants to route the data. It needs to specify
which context should process which stream. This is done via the
new routing APIs.

Add ioctls to accept routing information from the application and save
that in the driver. This can be used when starting streaming on a
context to determine which route and consequently which virtual channel
it should process.

De-assert the pixel interface reset on first start_streaming() and assert
it on the last stop_streaming().

Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 271 ++++++++++++------
 1 file changed, 191 insertions(+), 80 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 81c86e2cc4a50..4dabb99792d44 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -143,17 +143,6 @@ static inline struct ti_csi2rx_dev *to_csi2rx_dev(struct v4l2_subdev *sd)
 	return container_of(sd, struct ti_csi2rx_dev, subdev);
 }
 
-static const struct v4l2_mbus_framefmt ti_csi2rx_default_fmt = {
-	.width = 640,
-	.height = 480,
-	.code = MEDIA_BUS_FMT_UYVY8_1X16,
-	.field = V4L2_FIELD_NONE,
-	.colorspace = V4L2_COLORSPACE_SRGB,
-	.ycbcr_enc = V4L2_YCBCR_ENC_601,
-	.quantization = V4L2_QUANTIZATION_LIM_RANGE,
-	.xfer_func = V4L2_XFER_FUNC_SRGB,
-};
-
 static const struct ti_csi2rx_fmt ti_csi2rx_formats[] = {
 	{
 		.fourcc			= V4L2_PIX_FMT_YUYV,
@@ -565,10 +554,6 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
 
 	fmt = find_format_by_fourcc(ctx->v_fmt.fmt.pix.pixelformat);
 
-	/* De-assert the pixel interface reset. */
-	reg = SHIM_CNTL_PIX_RST;
-	writel(reg, csi->shim + SHIM_CNTL);
-
 	/* Negotiate pixel count from the source */
 	ti_csi2rx_request_max_ppc(csi);
 
@@ -888,34 +873,75 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
 	}
 }
 
+static int ti_csi2rx_get_stream(struct ti_csi2rx_ctx *ctx)
+{
+	struct ti_csi2rx_dev *csi = ctx->csi;
+	struct media_pad *pad;
+	struct v4l2_subdev_state *state;
+	struct v4l2_subdev_route *r;
+
+	/* Get the source pad connected to this ctx */
+	pad = media_entity_remote_source_pad_unique(ctx->pad.entity);
+	if (!pad) {
+		dev_err(csi->dev, "No pad connected to ctx %d\n", ctx->idx);
+		return -ENODEV;
+	}
+
+	state = v4l2_subdev_get_locked_active_state(&csi->subdev);
+
+	for_each_active_route(&state->routing, r) {
+		if (r->source_pad == pad->index) {
+			ctx->stream = r->sink_stream;
+			return 0;
+		}
+	}
+
+	/* No route found for this ctx */
+	return -ENODEV;
+}
+
 static int ti_csi2rx_get_vc_and_dt(struct ti_csi2rx_ctx *ctx)
 {
 	struct ti_csi2rx_dev *csi = ctx->csi;
+	struct ti_csi2rx_ctx *curr_ctx;
 	struct v4l2_mbus_frame_desc fd;
-	struct media_pad *pad;
-	int ret, i;
+	struct media_pad *source_pad;
+	int ret;
+	unsigned int i, j;
 
-	pad = media_entity_remote_pad_unique(&csi->subdev.entity, MEDIA_PAD_FL_SOURCE);
-	if (!pad)
+	/* Get the frame desc form source */
+	source_pad = media_entity_remote_pad_unique(&csi->subdev.entity, MEDIA_PAD_FL_SOURCE);
+	if (!source_pad)
 		return -ENODEV;
 
-	ret = v4l2_subdev_call(csi->source, pad, get_frame_desc, pad->index, &fd);
+	ret = v4l2_subdev_call(csi->source, pad, get_frame_desc, source_pad->index, &fd);
 	if (ret)
 		return ret;
 
 	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
 		return -EINVAL;
 
-	for (i = 0; i < fd.num_entries; i++) {
-		if (ctx->stream == fd.entry[i].stream) {
-			ctx->vc = fd.entry[i].bus.csi2.vc;
-			ctx->dt = fd.entry[i].bus.csi2.dt;
-			break;
-		}
+	for (i = 0; i < csi->num_ctx; i++) {
+		curr_ctx = &csi->ctx[i];
 
-		/* Return error if no matching stream found */
-		if (i == fd.num_entries)
-			return -EINVAL;
+		/* Capture VC 0 by default */
+		curr_ctx->vc = 0;
+
+		ret = ti_csi2rx_get_stream(curr_ctx);
+		if (ret)
+			continue;
+
+		for (j = 0; j < fd.num_entries; j++) {
+			if (curr_ctx->stream == fd.entry[j].stream) {
+				curr_ctx->vc = fd.entry[j].bus.csi2.vc;
+				curr_ctx->dt = fd.entry[j].bus.csi2.dt;
+				break;
+			}
+
+			/* Return error if no matching stream found */
+			if (j == fd.num_entries)
+				return -EINVAL;
+		}
 	}
 
 	return 0;
@@ -926,8 +952,6 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 	struct ti_csi2rx_ctx *ctx = vb2_get_drv_priv(vq);
 	struct ti_csi2rx_dev *csi = ctx->csi;
 	struct ti_csi2rx_dma *dma = &ctx->dma;
-	struct ti_csi2rx_buffer *buf;
-	const struct ti_csi2rx_fmt *fmt;
 	unsigned long flags;
 	int ret = 0;
 
@@ -942,35 +966,9 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 	if (ret)
 		goto err;
 
-	ret = ti_csi2rx_get_vc_and_dt(ctx);
-	if (ret == -ENOIOCTLCMD) {
-		ctx->vc = 0;
-		fmt = find_format_by_fourcc(ctx->v_fmt.fmt.pix.pixelformat);
-		ctx->dt = fmt->csi_dt;
-	} else if (ret < 0) {
-		goto err;
-	}
-
-	ti_csi2rx_setup_shim(ctx);
-
-	ctx->sequence = 0;
-
-	spin_lock_irqsave(&dma->lock, flags);
-	buf = list_entry(dma->queue.next, struct ti_csi2rx_buffer, list);
-
-	ret = ti_csi2rx_start_dma(ctx, buf);
-	if (ret) {
-		dev_err(csi->dev, "Failed to start DMA: %d\n", ret);
-		spin_unlock_irqrestore(&dma->lock, flags);
-		goto err_pipeline;
-	}
-
-	list_move_tail(&buf->list, &dma->submitted);
-	dma->state = TI_CSI2RX_DMA_ACTIVE;
-	spin_unlock_irqrestore(&dma->lock, flags);
-
+	/* Start stream 0, we don't allow multiple streams on the source pad */
 	ret = v4l2_subdev_enable_streams(&csi->subdev,
-					 TI_CSI2RX_PAD_FIRST_SOURCE,
+					 TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
 					 BIT_U64(0));
 	if (ret)
 		goto err_dma;
@@ -979,7 +977,6 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 err_dma:
 	ti_csi2rx_stop_dma(ctx);
-err_pipeline:
 	video_device_pipeline_stop(&ctx->vdev);
 	writel(0, csi->shim + SHIM_CNTL);
 	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
@@ -996,11 +993,8 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
 
 	video_device_pipeline_stop(&ctx->vdev);
 
-	writel(0, csi->shim + SHIM_CNTL);
-	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
-
 	ret = v4l2_subdev_disable_streams(&csi->subdev,
-					  TI_CSI2RX_PAD_FIRST_SOURCE,
+					  TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
 					  BIT_U64(0));
 	if (ret)
 		dev_err(csi->dev, "Failed to stop subdev stream\n");
@@ -1047,25 +1041,84 @@ static int ti_csi2rx_sd_set_fmt(struct v4l2_subdev *sd,
 	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
 	*fmt = format->format;
 
-	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_FIRST_SOURCE,
-					   format->stream);
+	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
+							   format->stream);
+	if (!fmt)
+		return -EINVAL;
+
 	*fmt = format->format;
 
 	return 0;
 }
 
-static int ti_csi2rx_sd_init_state(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_state *state)
+static int _ti_csi2rx_sd_set_routing(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *state,
+				     struct v4l2_subdev_krouting *routing)
 {
-	struct v4l2_mbus_framefmt *fmt;
+	int ret;
 
-	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_SINK);
-	*fmt = ti_csi2rx_default_fmt;
+	static const struct v4l2_mbus_framefmt format = {
+		.width = 640,
+		.height = 480,
+		.code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.field = V4L2_FIELD_NONE,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.ycbcr_enc = V4L2_YCBCR_ENC_601,
+		.quantization = V4L2_QUANTIZATION_LIM_RANGE,
+		.xfer_func = V4L2_XFER_FUNC_SRGB,
+	};
 
-	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_FIRST_SOURCE);
-	*fmt = ti_csi2rx_default_fmt;
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 |
+					   V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING);
 
-	return 0;
+	if (ret)
+		return ret;
+
+	/* Only stream ID 0 allowed on source pads */
+	for (unsigned int i = 0; i < routing->num_routes; ++i) {
+		const struct v4l2_subdev_route *route = &routing->routes[i];
+
+		if (route->source_stream != 0)
+			return -EINVAL;
+	}
+
+	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
+
+	return ret;
+}
+
+static int ti_csi2rx_sd_set_routing(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state,
+				    enum v4l2_subdev_format_whence which,
+				    struct v4l2_subdev_krouting *routing)
+{
+	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
+
+	if (csi->enable_count > 0)
+		return -EBUSY;
+
+	return _ti_csi2rx_sd_set_routing(sd, state, routing);
+}
+
+static int ti_csi2rx_sd_init_state(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state)
+{
+	struct v4l2_subdev_route routes[] = { {
+		.sink_pad = 0,
+		.sink_stream = 0,
+		.source_pad = TI_CSI2RX_PAD_FIRST_SOURCE,
+		.source_stream = 0,
+		.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+	} };
+
+	struct v4l2_subdev_krouting routing = {
+		.num_routes = 1,
+		.routes = routes,
+	};
+
+	/* Initialize routing to single route to the fist source pad */
+	return _ti_csi2rx_sd_set_routing(sd, state, &routing);
 }
 
 static int ti_csi2rx_sd_enable_streams(struct v4l2_subdev *sd,
@@ -1073,15 +1126,62 @@ static int ti_csi2rx_sd_enable_streams(struct v4l2_subdev *sd,
 				       u32 pad, u64 streams_mask)
 {
 	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
+	struct ti_csi2rx_ctx *ctx = &csi->ctx[pad - TI_CSI2RX_PAD_FIRST_SOURCE];
+	struct ti_csi2rx_dma *dma = &ctx->dma;
 	struct media_pad *remote_pad;
+	struct ti_csi2rx_buffer *buf;
+	const struct ti_csi2rx_fmt *fmt;
+	unsigned long flags;
+	u64 sink_streams;
 	int ret = 0;
+	unsigned int reg;
+
+	ret = ti_csi2rx_get_stream(ctx);
+	if (ret)
+		return ret;
+
+	/* Get the VC and DT for all enabled ctx on first stream start */
+	if (!csi->enable_count) {
+		ret = ti_csi2rx_get_vc_and_dt(ctx);
+		if (ret == -ENOIOCTLCMD) {
+			ctx->vc = 0;
+			fmt = find_format_by_fourcc(ctx->v_fmt.fmt.pix.pixelformat);
+			ctx->dt = fmt->csi_dt;
+		} else if (ret < 0) {
+			return ret;
+		}
+
+		/* De-assert the pixel interface reset. */
+		reg = SHIM_CNTL_PIX_RST;
+		writel(reg, csi->shim + SHIM_CNTL);
+	}
+
+	ti_csi2rx_setup_shim(ctx);
+	ctx->sequence = 0;
+
+	spin_lock_irqsave(&dma->lock, flags);
+	buf = list_entry(dma->queue.next, struct ti_csi2rx_buffer, list);
+
+	ret = ti_csi2rx_start_dma(ctx, buf);
+	if (ret) {
+		dev_err(csi->dev, "Failed to start DMA: %d\n", ret);
+		spin_unlock_irqrestore(&dma->lock, flags);
+		return ret;
+	}
+
+	list_move_tail(&buf->list, &dma->submitted);
+	dma->state = TI_CSI2RX_DMA_ACTIVE;
+	spin_unlock_irqrestore(&dma->lock, flags);
 
 	remote_pad = media_entity_remote_source_pad_unique(&csi->subdev.entity);
 	if (!remote_pad)
 		return -ENODEV;
+	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
+						       TI_CSI2RX_PAD_SINK,
+						       &streams_mask);
 
 	ret = v4l2_subdev_enable_streams(csi->source, remote_pad->index,
-					 BIT_U64(0));
+					 sink_streams);
 	if (ret)
 		return ret;
 
@@ -1095,18 +1195,28 @@ static int ti_csi2rx_sd_disable_streams(struct v4l2_subdev *sd,
 					u32 pad, u64 streams_mask)
 {
 	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
+	struct ti_csi2rx_ctx *ctx = &csi->ctx[pad - TI_CSI2RX_PAD_FIRST_SOURCE];
 	struct media_pad *remote_pad;
+	u64 sink_streams;
 	int ret = 0;
 
+	WARN_ON(csi->enable_count == 0);
+
+	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
+
+	/* assert pixel reset to prevent stale data */
+	if (csi->enable_count == 1)
+		writel(0, csi->shim + SHIM_CNTL);
+
 	remote_pad = media_entity_remote_source_pad_unique(&csi->subdev.entity);
 	if (!remote_pad)
 		return -ENODEV;
-
-	if (csi->enable_count == 0)
-		return -EINVAL;
+	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
+						       TI_CSI2RX_PAD_SINK,
+						       &streams_mask);
 
 	ret = v4l2_subdev_disable_streams(csi->source, remote_pad->index,
-					  BIT_U64(0));
+					  sink_streams);
 	if (!ret)
 		--csi->enable_count;
 
@@ -1115,6 +1225,7 @@ static int ti_csi2rx_sd_disable_streams(struct v4l2_subdev *sd,
 
 static const struct v4l2_subdev_pad_ops ti_csi2rx_subdev_pad_ops = {
 	.enum_mbus_code	= ti_csi2rx_enum_mbus_code,
+	.set_routing = ti_csi2rx_sd_set_routing,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = ti_csi2rx_sd_set_fmt,
 	.enable_streams = ti_csi2rx_sd_enable_streams,
@@ -1293,7 +1404,7 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
 	v4l2_subdev_init(sd, &ti_csi2rx_subdev_ops);
 	sd->internal_ops = &ti_csi2rx_internal_ops;
 	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
-	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
 	strscpy(sd->name, dev_name(csi->dev), sizeof(sd->name));
 	sd->dev = csi->dev;
 	sd->entity.ops = &ti_csi2rx_subdev_entity_ops;
-- 
2.34.1


