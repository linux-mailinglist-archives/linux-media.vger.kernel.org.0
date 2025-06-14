Return-Path: <linux-media+bounces-34793-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F19AD9CD8
	for <lists+linux-media@lfdr.de>; Sat, 14 Jun 2025 15:22:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0EE947A882A
	for <lists+linux-media@lfdr.de>; Sat, 14 Jun 2025 13:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BAE62D12E5;
	Sat, 14 Jun 2025 13:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="U4YQmnMV"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011054.outbound.protection.outlook.com [52.101.65.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3991C32;
	Sat, 14 Jun 2025 13:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749907362; cv=fail; b=QcLhFjuEAXwhYMHjsVVnZAbEi5cnWQR2wVOMSdTUYTOsSZzVRuBKYJRZCbU0WwwJ48Hi1nCEKJO6700XZPLi81sIpt/qUYXHJj1oCIWkdB2bgjMZXJMJ3Kvc2r3qobcSSbfo2Uys0ddiPhRp+zJ/2IgsQuTK7nh14jcgisKUpUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749907362; c=relaxed/simple;
	bh=4zSiSODvs87yNFLGSpSXm6eATyAyyF9iB2OAN4LYsvY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=jeM4D0fLERr/0tEDVgaGbRJg4Et2SiUIIaU7TJi+ftSAfmPBaIl/iMww/ZjMgjjCXhhh2VofN/9QE+WDurMAZOolgP3pylulRoYj6Iw0Y5Y2sryzpeva19m0eKdc9hxA//i/IJrO7a4itP8ZtmPnk1/Dpg6+UuergkflvWiVqYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=U4YQmnMV; arc=fail smtp.client-ip=52.101.65.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KkJGRi5p78zwIe8aaRARNOaNtXi5hU+GnDk4GeH/dYfANyGmZC5nFMqndZyk9J5Z7AIWtwOcLkq05KK3QramRKSSQkhHULhsRjG/0Yi1A38XYzhZC7Phoid2bzTycJ9wNUgiYsZw/LjrJFT5+hjCjN1lMwMKBYtRMhLdM9X1z1OqAtG7MxU8bGEXszGuW99P8sEhzjWLs/VlSgf7waQ7VM1+w8UtcK60oxm/rhrVu6FAWZ/KJpKcaMeu5zfpXvW+PV2+oYnsrSqqv8iCE1F+o/PxwYfvE0UOwbaaKD03rPeUgzpZc+iC2S+f1Nf5jWollQ2ojKJ3MKV34UxmjdgaWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I41p0mI9y5cnHQWFBuhVaGhqkHrW7TIml5ZRf2HZbDI=;
 b=PaL04GvajF6OAA99Pgb9/8DnYdsCMJafr5zGnJ8fPL1xr4Iv2Gf1rwFm4BBONw09ReyV9fp2SFwjGGIss7dQfUN3EfJEHG9mxnT7xdk3rEH0lK/k4EO2BuX7XTLvaTd2cw7T89tHJw7ceaLlx8lZseCJj7RgnM811ekRECcTvazAYgXNA0lV8gKqG4Vr07/9hfrNKXSsQnWP25P70EoTa8fH0fJ2e4Kho3Y/2ChQ2DuX/+NqUug5fg/cnX0/gLcTqWAwDBBIiUiaNzCRxc+36ZZD0FEuriN50G0EQfyeybGlLk+Hi6VihPFTAWPDcR3DTwtP2Yt22jP7J3MUuzJuHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I41p0mI9y5cnHQWFBuhVaGhqkHrW7TIml5ZRf2HZbDI=;
 b=U4YQmnMV81s+1bjP91H4NplKcktFDM0Gc++vUwhEPOwmbeMeQ50rmE725issUZ1bW9k0afKKZvM9veFQKi5AcCEl4xByHNO7tGRkqClpZOVxpBlNyD2FyeOi9FmPe3GmjUgt8dJRfgAB6POcd7hlCgFgIgKFAn6gU0g+QLOS+NxALhHg5ISPbBgFE7yNplIrFg7/V3TrnGU7No6AV+StOf3N6nITLHwy+XdtSE0GCSCWbXFF5LYvysnZNAPi4X2ZVaR21ol+PPLSMuWnmbVlLbyNHDeCQ3V6niBPQXIsmYtPj0Y1aXsAO7wlc2KCYNnOnEe6WN+8orQKFFAu+Q8KxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DBAPR04MB7255.eurprd04.prod.outlook.com (2603:10a6:10:1a9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Sat, 14 Jun
 2025 13:22:36 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8835.026; Sat, 14 Jun 2025
 13:22:35 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	stern@rowland.harvard.edu,
	laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com,
	mchehab@kernel.org,
	jeff.johnson@oss.qualcomm.com
Cc: linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	jun.li@nxp.com,
	imx@lists.linux.dev
Subject: [PATCH 1/2] usbmon: do dma sync for cpu read if the buffer is not dma coherent
Date: Sat, 14 Jun 2025 21:24:45 +0800
Message-Id: <20250614132446.251218-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0003.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::15)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DBAPR04MB7255:EE_
X-MS-Office365-Filtering-Correlation-Id: cd51df0b-cfd4-47e7-c8fa-08ddab4686ba
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?0fhyum9Bceyg+OWIuzaDptUlTiwkCL4GOks87jtvhyU4Wg7ABBYfCJAJ3Z7L?=
 =?us-ascii?Q?Kef7Ms3nTcx1q60vamV65c3fK6iTA4S657EPDHVIpmYCCUUkXch70qIcxq8d?=
 =?us-ascii?Q?I4JD+vRDyGqHvgnfxPYETqwDFScMkGIi3ODGkSMOm9hQj07FpF3BNf5Z64ex?=
 =?us-ascii?Q?0V0UMMNC5//lfmAQp99QDaf7RQE/oiSJFS7cD9nLV0/oPlafwmmd8mfkbQlr?=
 =?us-ascii?Q?juRNTYib23WTh+sZSiNvt0rIhH+oXxzpUqI3TNWjCxsaFNluQgHHIl94wcJw?=
 =?us-ascii?Q?VbbxPoMQha4N76jX9oKGTzaPaMJBtcTPo9Man2dDOBIshTPiDudNkzZEzSdm?=
 =?us-ascii?Q?eUgVA4uaR5js2BNsKWaFuN9mNzIuPmo6dZwU7T4yl3ZecuFvZ2uEhF1vztr2?=
 =?us-ascii?Q?QGy3HqLbt8FvAAJjzz+S6F1v2fs1cOg2Y23cUNeUHrSiSKS8KQa38w5dlNeI?=
 =?us-ascii?Q?OM3u6u8ZpZeSlAvz0HLn0v4zWU9/4uQoKKd7moDTIfT1wN9lvtYZD1+OQG8i?=
 =?us-ascii?Q?6OTK+G64rkVT+pzC1CbcRiBPXbIDddihrI7s+uoYeWpyFBPWkgZIyXOGpOgw?=
 =?us-ascii?Q?4JCVNo+ezf4KNQW5gSUc8juvk1FRU/Fcji818N4Mx9aYnwDE/G2wWyg0yDYZ?=
 =?us-ascii?Q?7tONCScCM6CIWtJybQi4wEXxKJCBYI4iqq4rmbbveID4ddMoc79rh2OOo5mN?=
 =?us-ascii?Q?VoMPc93i9tzQoM3rrQickHQyT+GLaolC6uNZnep8f/+gr+8+VFSwOHd+YVda?=
 =?us-ascii?Q?X9ybPCo6NmXnoruHz1JMpvClHBvabyU3O80FqXYcsggLNRHQsHwD+o0tSFwM?=
 =?us-ascii?Q?P9x4go7rwVezgWz/wZQvAZSu5aL+veroeILyP0gaaT7xAHin+DNr6+1vgguo?=
 =?us-ascii?Q?T/gIs1TQIgleNnsWewJvLFs751/A0F+fl5CkTAzivR1Cd/O4NdBakrNJjF8Z?=
 =?us-ascii?Q?VUPeYyVrEOFTLiR5jsB8iSq4sOM51q/Z98CQEFPYqYOc4QAX2zBizWGc1NEq?=
 =?us-ascii?Q?qXAc5cS3B9vyPCnJ05Dvh4qsaWTELcrJlBth9Otxw60GcYWyKw5Y8ooRaPAv?=
 =?us-ascii?Q?jRkDABf1pRCUJCwIamF2FQSx+cr+wO2IqrTF7YpFj8STNzxkL5uI8yUQFhKi?=
 =?us-ascii?Q?spIru4aP43Pq4UII7gv1uQqnkxfQaqcmokZ8q9Ei/ynyH8LBo7M48bONLXCI?=
 =?us-ascii?Q?lXUCRuJIb/Zv9XNgz2NrsnYHxt6l+verVMgRhXjutxxSNdCLzqQONybnXswz?=
 =?us-ascii?Q?0srxu5cUAO3czpdYdMfggS7quPE4138J7I9VNsPEvfxB1vd6wQ6mgjME2ivL?=
 =?us-ascii?Q?aYB/zJFmS0E+poXoERJYxaD9x8gYWG+FdX798lHmeUFO31RWwlgY70pMuqBO?=
 =?us-ascii?Q?OXqYuh/DlYJQlfnZNg0u/NVOK4h+FZRJdrFHCIcwGI4hjxNnH0KEHPX/mY/W?=
 =?us-ascii?Q?PN80CkplyNmtxl+wIk2FD4yTY+x2gCqQBchZEC94rUfR8R84yne6fA=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?NSOFusLc0RMxzsVP0ihYozx6tzEULeKgJTDg8YgMhXuHw9i3/K2ZyHbjgTHV?=
 =?us-ascii?Q?90GBM7u7vod+V8IYsdr1KKiZLVj3BvHNJwKowo8Wx7ZNU8rPkNTrl4liVToB?=
 =?us-ascii?Q?I7xjo5Dd/LWWFpZamCOeNmawqeGAwl8SU+ooor66ne4AYYwmH0XMWqnuvc3g?=
 =?us-ascii?Q?JZh0JpfeGKaiz12Sm3RPxG6cCSmhVm30em8oC0sEempWavL7iIh0GI9klW1X?=
 =?us-ascii?Q?XDh/X/XMexGTsKvjhnTvANTsUpexkuzOqy/l6r9KjCue4rAJLK7SGM7xknBL?=
 =?us-ascii?Q?jqQ6DIynXcFZ4h+Mbg1Pvp7AUpB5jDzwDL0e967lfZIFxcd2QEvfJ2ymUM6q?=
 =?us-ascii?Q?m3ncnKdOxviLyOxJGpLPIKu92eCJkdgRZZQuxru32cRMTHbRHtf7ymYPzeSA?=
 =?us-ascii?Q?Mo+i1UCGCENoyn4Kp4f42gUTRs7GhzvMfVrR2YNOTAuM+LbDJjip+W2QQeSy?=
 =?us-ascii?Q?o4tnjPUXEtpyD+Wr+u8EycoOnQnn8vqJJ16JuR1aIE/SYUGP+ABgYOlnj22k?=
 =?us-ascii?Q?kLdyMbxR0/lzHBd4+CpiQfrQBp1Ee3md7tf8L1Hw1lfqJ3XLZFYe913kljVP?=
 =?us-ascii?Q?IFWjk0iwPFXo3R5wlxQ0IwnftFb6QXvcCenm+CePYx2Nw1CQVHOX1b/42M1v?=
 =?us-ascii?Q?yISnLU9HrKV7amuItU2B3L+PdekWRKf14JHrncPrwKfrpfVV/lHlohfDFtO4?=
 =?us-ascii?Q?mtPdIFTKjj91D0akRcpVEUrwZ99DRqnilizjOtf894AaPE627DHKTUy+UGdP?=
 =?us-ascii?Q?LSMauAGVqDqtiGNuKF2SbUoDvBcUDceLXap/fN2Tcv7oNsimAedybrGeAhA9?=
 =?us-ascii?Q?bx/i5Gq+72VSNUN6pPaN3VxLwXnH6mvuoGQnoTfizrkn9r+6SlX31mF3nFCL?=
 =?us-ascii?Q?bcXNusrndFSvRkXGIbyZXQnobB7nUhhuHwB/b2xiQMu5UNytWT4mkwMZn0wP?=
 =?us-ascii?Q?mMhLWby9Sf8wE8n2kq528TGvjP1ghVtRYQeAxWavh6fZ9r0ORxN3ueq92azT?=
 =?us-ascii?Q?zsIv9YLFZbK3UKLIRwWkE+7Lb7CpoCtW9eALn3dS9dTXWy+vPkTS14oM2dBv?=
 =?us-ascii?Q?kc3fuCg3iBH8Y2CXA5e9/0O7MmuDMVpkf5NWyHj417vIPdOuGspi+0ed12nC?=
 =?us-ascii?Q?sMC9JRxPxGOna3xKL4v0j+zwnzrqDSs/WMu3eeR5/SgKUI98PHNsmVK0khCw?=
 =?us-ascii?Q?OY2C5bcVH89FPyK3dOgbq2lKEt85oHJWc2Xja68AJOOpipFYnGuQZJaDU83c?=
 =?us-ascii?Q?dLfl9qCbWCDwPu88/ULsx3Ge+40iBk0zXLXkcUWocnGbiogEt7B+682oVMHD?=
 =?us-ascii?Q?v3u7MQNsg4rmIS+ccOLsvIlY1dMSA1Z43DmMkMOieI1jXINwu/ctjE+L84iV?=
 =?us-ascii?Q?nMx+aPAyv/S/KvZMLPPm8Uvtobzvfir/244JJjwC5c4PwQnnZiogfZ1cqaQR?=
 =?us-ascii?Q?smNVWjAcBbKKHGyLpGbrWmZbkPV37sBeu2avmh14WIivXR1/Q9viYAzOP/D8?=
 =?us-ascii?Q?qleN1w+QfjGNahezajrZ52Euk5JMqTanjsWxeOF55nUzL34e2/MAYl11aYzY?=
 =?us-ascii?Q?CDVjHDjafAP11AtHBLJ0ciQmyw+OX6xlJ2KGhyIg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd51df0b-cfd4-47e7-c8fa-08ddab4686ba
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2025 13:22:35.4999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5TzL5ihukOD2Xv/YYuO7D9/8g0K3mvGklCQaXpjygXZDHZpoPmRcN+lLFFrb8v4fsjyuhZ0KT26rvhX7KJ6Qrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7255

The urb->transfer_dma may not be dma coherent, in this case usb monitor
may get old data. For example, commit "20e1dbf2bbe2 media: uvcvideo:
Use dma_alloc_noncontiguous API" is allocating non-coherent buffer.

To make usbmon result more reliable, this will add a flag
URB_USBMON_NEED_SYNC to indicate that usb monitor need do dma sync
before reading buffer data.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/mon/mon_main.c | 7 +++++++
 include/linux/usb.h        | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/usb/mon/mon_main.c b/drivers/usb/mon/mon_main.c
index af852d53aac6..b9d5c1b46b85 100644
--- a/drivers/usb/mon/mon_main.c
+++ b/drivers/usb/mon/mon_main.c
@@ -14,6 +14,7 @@
 #include <linux/slab.h>
 #include <linux/notifier.h>
 #include <linux/mutex.h>
+#include <linux/dma-mapping.h>
 
 #include "usb_mon.h"
 
@@ -142,6 +143,12 @@ static void mon_complete(struct usb_bus *ubus, struct urb *urb, int status)
 {
 	struct mon_bus *mbus;
 
+	if (urb->transfer_flags & URB_USBMON_NEED_SYNC)
+		dma_sync_single_for_cpu(ubus->sysdev,
+					urb->transfer_dma,
+					urb->transfer_buffer_length,
+					DMA_FROM_DEVICE);
+
 	mbus = ubus->mon_bus;
 	if (mbus != NULL)
 		mon_bus_complete(mbus, urb, status);
diff --git a/include/linux/usb.h b/include/linux/usb.h
index 1b2545b4363b..d31baee4ffa6 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1368,6 +1368,7 @@ extern int usb_disabled(void);
 #define URB_ISO_ASAP		0x0002	/* iso-only; use the first unexpired
 					 * slot in the schedule */
 #define URB_NO_TRANSFER_DMA_MAP	0x0004	/* urb->transfer_dma valid on submit */
+#define URB_USBMON_NEED_SYNC	0x0008	/* usb monitor need do dma sync for cpu read */
 #define URB_ZERO_PACKET		0x0040	/* Finish bulk OUT with short packet */
 #define URB_NO_INTERRUPT	0x0080	/* HINT: no non-error interrupt
 					 * needed */
-- 
2.34.1


