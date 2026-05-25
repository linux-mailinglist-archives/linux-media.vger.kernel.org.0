Return-Path: <linux-media+bounces-62730-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAotAa2TFGowOgcAu9opvQ
	(envelope-from <linux-media+bounces-62730-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 20:23:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A21C5CD9E3
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 20:23:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 234E5303A101
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 18:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B198315793;
	Mon, 25 May 2026 18:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="E6yVtZNA"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012049.outbound.protection.outlook.com [40.93.195.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0938F2DA762;
	Mon, 25 May 2026 18:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779733317; cv=fail; b=FY5ZALdkvtepuVkysqwhmLFugXWxbRinY+QKT3l+I33EqKEjJvJaEWgaHH+z8kOKNhAQByRspkNqTz2uw0mKB0Pb7eOFCj1AD4G24twXsUMCF+dnZYep8sAZVatKjYIHuGOmhof7ux29EZ8+QtMKMh3t1dO20zRlePHeqSH8INY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779733317; c=relaxed/simple;
	bh=KVEgnAT73+RjT64KbfUrcTfnKqVYCD3NNUilcBQiepA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NECyQwEltarvys6t6Z1jqNggOgoGDYHXk/suT43MIy81AFOz1zWU+L1KezpnNZqTGdEN+yPigtKz3bR2icRPD0oO1dNhndLpSrKH6ikE34ga1OR7G9jJvNcpsWRFRuaanJblMkXlKUjnQ28eayNkK1OpR1AJ3yJRx1/Yoxl+nxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=E6yVtZNA; arc=fail smtp.client-ip=40.93.195.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=griKpSRMlu6+6Kw6uMIYnig8Sp5VjH9msjbTmFQDQipFWfGhHvNJnhpG2O/BxKXo7RLBFcvQMGsf/CZp/LfwIgtIaxMq1dqvS0FIA8guO4RW9ywk72Zd/WwbvMFA6h6T3DMFj8/2ZofAENqYxIHFon1B6/lkE8UrWx4XsBzGGVZT8jsGNgH5YWNrUuOkQRAGn0nailOXARA4n7SO17Mh6+RmsXXAlUuAncIbXXqT6Js3j4v+eXhgtnu0pNIDaJSm4WDmaeXoJ1QsyCcwTlxUF5uiZAQETs/2RRJEnPvEyEb0upFKUyCp/UzvuIBghW2z3Xpxq+yTQeZEjGPqROk+dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fX5g9WBdcbCC25TpAgHev/NbGGmC6MUdcQ5GRO3JTb0=;
 b=RffygzXr/Yz8VcyzCuJDN1LPY2QvOarUTxVwDxA3e4/LfKkZ9bBuGgfoGWHSI/8jL1r/fAEHi5+tY7BlFe8n/lk9icnqeIXWrXyb27nCCMZQJN34YH+tPviEQATEU1TPNP9sRYTnS8v8tYtQf9rACDs2NfQocBFM/SZ5l30ANkuE/nbc2VTrjMZNB5yXjdd98xGtHM6+NpENDjLkNVd3JN0kipGv3JzyD2VoJUdLweOutpPgQcl1NW/CO1GwShBWgiZAt1UGA3WrS7zTPqE0ZCe6aj8YtnxuMNAmmwwxk06FE2gqrLJZoF36Xdxs4eAKUcl7MsjRT1UmxOLwYc5/Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fX5g9WBdcbCC25TpAgHev/NbGGmC6MUdcQ5GRO3JTb0=;
 b=E6yVtZNAah1BK67EvTYXdvG1jyHxHkX3h/ab73MpGlBvMoPfuHcLFfCKFIocQYbCX0nXib0h9MusASkzQORUdphezXVc0hgnAV/ynfOtu7ocdhgwo62VEu54PHwyURLB/qxZMW7ikF5xNU2vEpQdtCpGajUNaY6cLe0IcGOsXnJC683+DN9W+MBfjQn6VIkEkIrLgGbLJXhSO6/0uAdu2GI1DCzxVcqyF9mDMh3c586cVzhbbrh0svYuyBAH0rXG+8ofxJcXDIA2W8NLg5Mgkf2B/uLZ8B1F85EDLvo5xfSG5zSuRxC8At2gHixOaPxfo/vwZ6cVsbE+eg2dtsqgPw==
Received: from SJ0PR05CA0115.namprd05.prod.outlook.com (2603:10b6:a03:334::30)
 by SN7PR12MB7300.namprd12.prod.outlook.com (2603:10b6:806:298::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 18:21:48 +0000
Received: from MWH0EPF000C618B.namprd02.prod.outlook.com
 (2603:10b6:a03:334:cafe::61) by SJ0PR05CA0115.outlook.office365.com
 (2603:10b6:a03:334::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.10 via Frontend Transport; Mon, 25
 May 2026 18:21:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MWH0EPF000C618B.mail.protection.outlook.com (10.167.249.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Mon, 25 May 2026 18:21:48 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 25 May
 2026 11:21:33 -0700
Received: from build-henryl-noble-20260506.internal (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 25 May 2026 11:21:32 -0700
From: Henry Lin <henryl@nvidia.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "Mauro Carvalho
 Chehab" <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-usb@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Henry Lin <henryl@nvidia.com>
Subject: [RFC PATCH 1/1] media: uvcvideo: reset interface on bulk stream stop
Date: Mon, 25 May 2026 18:20:28 +0000
Message-ID: <20260525182028.2148267-2-henryl@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260525182028.2148267-1-henryl@nvidia.com>
References: <20260525182028.2148267-1-henryl@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618B:EE_|SN7PR12MB7300:EE_
X-MS-Office365-Filtering-Correlation-Id: 9287ba4a-ab20-4d5f-bea7-08deba8a7bff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|56012099003|22082099003|18002099003|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info:
	gUCiFEgGkiqLze0XtpMQ6inkmIJiDn61v7cNH3Tov8Ik07OSkwCeqT+JdupelSh0tGqh9wPkphFBAApzNrD5j2MmRlLbP1S1erzXqnNDc8t0r77ZMXKMmrEKnFXX9NWQRghbO3fUM/ABkAYN5VHwfAd7qK6Gu/BxT4XhSMiVWrmLWfHQ/A2kvpIx9bXovvSQVNxPEZjnbl8UEQDQZ2GJ0tDBQLIxXLiudYDeq4vcqDSWfUrR1bG7DZXUpnEVd+ysO9v6tw2aeOqna95TST5s5vN7X6W7MGho30BOu2w/rp2+9gbm+WNyWHR3rLBHA/AL4d0k3lkcvxdlGpjqkLixiaumGFppe/uSZx42a9RLD4gaMfxPHUmMFYcPgBZ7b7X76+YKqOsd73UU57HxnvmOAXb2MsjjLjk25lYgtfR0+C+5+DSZV4nUYG53RxLEIFFX5UpPzO9JGd4dRrEbSfQhz1Ncjrgip9kyQb4LXBwlzFaTWp9K9q+qN0La66kyEyaWjf6pxrInKn53Q/S2fsRpncMyCn1wfyAwIcYjiHai8mQLX1afqP7ve6a9DmlphDDnQfBCrxYqAp6EcWa805cSMpPFWSmQGAPr0Nou6h1uBKlyDxbHStW1DUJAsWN/mInoKLva+j5I7dw97S8R+eqGZnPHUlw7f5s2V2MV3hu16MtCtLn2N222JV5vW1yB6baoK+AywTMkgA7nRzBH4VOC1tp86EpKS20H5Y1hWykpc70=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(56012099003)(22082099003)(18002099003)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	v0nt7BC/y0KcWNdISM/l9MWnOgJxgi+nj1R5GoTH9HVRAxI+nFihvyplvMvOPG/+ULTFkFw1iEzPtBW+ws/ZGohiX0XrElIsSuNUy6cz+9zHfSYyh44e8P3ZmtewUJpsV8n1k9BiekJ4uf93x3Pp8YBiGbfRb6vITQJeaXZn74C9gtnB3B7cY7uMZ9yRkDBvHcfGhcS/QShSfem6B6K5FyTP6l2k1Kt4ZvXn0sYq1pMzq2H3Kzk60l767gBcUSlx1geoyXRzoju9BvJgZCrKjKKXvZGtflWlNwJCVc4jlfoI/MlCgoHO3vBj9cBKSHPOUG/jfVj+62qFj/2Vy/s+8phZDmciBnFpken275WByRgFz+y28P8Q3hbSsCq4lyiT1WwdSfRev8E5mtNTkTQEgL65AXJutChGY4gMpG8u2zt9NqzpnKwIIQumZ3qmBGiO
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 18:21:48.0428
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9287ba4a-ab20-4d5f-bea7-08deba8a7bff
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C618B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7300
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62730-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[henryl@nvidia.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9A21C5CD9E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Hans Yang <hansy@nvidia.com>

Some bulk-based UVC devices expect the stream sequence number to be
reset when the video stream is stopped. The driver currently issues
CLEAR_FEATURE(ENDPOINT_HALT) for bulk endpoints, but does not reset the
streaming interface alternate setting to 0 in that path.

When streaming is started again, the device may expect packets to
start from sequence number 0 while the host continues from the
previous transaction, leading to transfer errors such as:

  uvcvideo: Non-zero status (-71) in video completion handler.

Reset the streaming interface alternate setting to 0 before clearing
halt, matching the stop path used for isochronous endpoints.

Signed-off-by: Hans Yang <hansy@nvidia.com>
Signed-off-by: Henry Lin <henryl@nvidia.com>
---
 drivers/media/usb/uvc/uvc_video.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 2094e059d7d3..20cae606f463 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -2319,9 +2319,8 @@ void uvc_video_stop_streaming(struct uvc_streaming *stream)
 {
 	uvc_video_stop_transfer(stream, 1);
 
-	if (stream->intf->num_altsetting > 1) {
-		usb_set_interface(stream->dev->udev, stream->intfnum, 0);
-	} else {
+	usb_set_interface(stream->dev->udev, stream->intfnum, 0);
+	if (stream->intf->num_altsetting == 1) {
 		/*
 		 * UVC doesn't specify how to inform a bulk-based device
 		 * when the video stream is stopped. Windows sends a
-- 
2.43.0

