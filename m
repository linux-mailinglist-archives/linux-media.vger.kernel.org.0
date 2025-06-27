Return-Path: <linux-media+bounces-36087-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC873AEB42B
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 12:18:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 626B016F549
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 10:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7369F29B22A;
	Fri, 27 Jun 2025 10:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="O7YjBj/2"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011036.outbound.protection.outlook.com [52.101.70.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D48299957;
	Fri, 27 Jun 2025 10:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751019443; cv=fail; b=t9Fg7jLVYroefvXlkPapgvLjw8VCnQNiYpKwU8k+LleMr7fGrRCyhyK2fi6tM/UMhkn+QdjpaSC35WLaHzvuvW0Hi8fE6G1XDh86qUxh0oBVhcP90fxJv/X/oWbr1W8iBJ+SdakGfHK6IzounYmy/BpnJeFuAGmtMuCSbTjyQoc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751019443; c=relaxed/simple;
	bh=ARAyjCrrWSfYRsF2YmOhRKfqOSuXoEX6+tepEafWaOI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uojfTB68gXbCRQvgYA2F2SELUKBYG73sg7hs1HEEldu10oXisHpurIuxdHSy0bBet92rGhLjTcPFOi4RqwfqIT4FdQUqge4IHz63KGDJv5zNjiZjF5k+XfzWLNyVCQKCCYKZi3WSDljSvPbElU14TdYrjcMsNv8o3mHjYeGkvbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=O7YjBj/2; arc=fail smtp.client-ip=52.101.70.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GFTIRcdR/TE4MoSOeoI3kIF1T9KM0pZXUvMXVF/9l7NawbNk6/gsaHRB0aHbdDKPZy6QpqPu92iD7309sgFj7tZAyjb/s2Bp+p0efLczFV2ycsJrpeNymkBCM5W56WkY9kVkOLxuMxlKh7pD5Z2Vcd4SmAqM94eB8QaDBng0OKi3lXCiUcuzgeP8lHtkLDqy569Xwd04RVLsjKCEbRXLTgibLmcf01+Z5kLxLuqmPR9X1v5nizzWaWwsnEJLFwpE1uHGEc+4RLgHalX6itraBQQfkQqxk4jIu2yNpVMdH2a+5/61lenfcUgBCn8fCC5D8Q5w2y3TMKF9zJ5isGZHEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOkuHoBpxCKcojuUtvVqmdWDwy3TrVHt+/8FcSLZPH0=;
 b=JOJZizhSmaozBR24mLo9Jy+dvP+BQVpNhN/Hi73QMF72JPq2eENR/4W+dQm+BljQuETpmBZqnGFWrntJ6yBL+RjoiRYwLlQ0T/VHmb6mRhXLUCDoerpU+F7URqqkbQel9b6T+cmByZva54+31XGQzGsg7nvX2dj5y7sgafX6e0TwChPEwhQzo6bmZz+P2M0c9oUGd4Hr2oFdtKJS6OVwEmKnRn3aSKdfUahEJvVeVhTdUHodH/95rV9EQml4S9lv77+IaQBN6U6PbG6hhuxIWzxn2sSIX4VXKobQHFYdGWxqYAYsHCNqwmFF11+14SgFatdmEOOqHo72bZbvPW5k9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOkuHoBpxCKcojuUtvVqmdWDwy3TrVHt+/8FcSLZPH0=;
 b=O7YjBj/2BPFe7rdk5aQTwG9PlgaQfBjQd01HeALZcAg7grjOulgfBWyMG7P93AdwazXSuKbZ4l1q2rtgzcf/ewqJdWe/g1+fMiQITeitjFjdpugOmJfgt9NsVql1DXft0rW9ja8tBqqMcOcRhzPnqCysTP60sTOxKgQnX+6h14DMc+ChdCKx06I26uS6+vQBRQF4k9vO2lnDaT/3mOIgvNSwjZm/udCauPa5ljg+UNN/zrlwY/HMZ9GDK6d7EHxwv5VK/dNLaBd3JZlzgW7gPh+YfN+kRnFI9wYm++RBOdnVHtrprR3c2IYEe3rm3g5PRDvC8JUNtIcy3j2hs0xY0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by PA4PR04MB9461.eurprd04.prod.outlook.com (2603:10a6:102:2a9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Fri, 27 Jun
 2025 10:17:17 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%6]) with mapi id 15.20.8857.026; Fri, 27 Jun 2025
 10:17:17 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: ezequiel@vanguardiasur.com.ar,
	mchehab@kernel.org,
	laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com,
	gregkh@linuxfoundation.org,
	xu.yang_2@nxp.com,
	mingo@kernel.org,
	tglx@linutronix.de,
	andriy.shevchenko@linux.intel.com,
	viro@zeniv.linux.org.uk,
	thomas.weissschuh@linutronix.de
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v2 2/3] media: uvcvideo: use usb_alloc_noncoherent/usb_free_noncoherent()
Date: Fri, 27 Jun 2025 18:19:38 +0800
Message-Id: <20250627101939.3649295-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250627101939.3649295-1-xu.yang_2@nxp.com>
References: <20250627101939.3649295-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0112.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::15) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|PA4PR04MB9461:EE_
X-MS-Office365-Filtering-Correlation-Id: adab98bf-d493-4824-dcab-08ddb563cb05
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?EqOTOheHVBb4fXk8p7pD+LStgUmQ/PnkrRvZ+NK3Fcp9xF+Mtg34A/Wyau/j?=
 =?us-ascii?Q?NdFnYRX4OfXlWuqH8iO+Gijqk8SCclN+lHZHITp90FwZFufVlQ6DB9SUr+YH?=
 =?us-ascii?Q?Z2OB/rBK7wMi4Db6+WLYT4Pj2Mm8v11E7H2clEMkxQXzQJ9yWGUqAJNt9cBv?=
 =?us-ascii?Q?PTU5hcvDLsElN5hZkoT4e7WQbstVWLU6VH6QdNd02r2VL947uloANV6bk1Ty?=
 =?us-ascii?Q?9pzcamrAHgeRpBFaLViRtLZU2NCbQ/7xTnP65vOQA3/Yz0/9ylefvq5bfhRZ?=
 =?us-ascii?Q?c9VKUdohznCMKJfJ/R8bfEUHw7VYnCCKiqZtm0iU5Ho/ybTy1iW4OJPONdgF?=
 =?us-ascii?Q?osnsAaUpqPEkB3X0hZQ7+0/miqMHcRqG1EJunas6znKSsCy6VG9X7gH73RCA?=
 =?us-ascii?Q?fXLdZcfSWATdqSCDasxxxS640jpBUOdinbc64ewFysvkR1wxhchpuyd7RQ3J?=
 =?us-ascii?Q?C+q1L18S83QAwMv57kXoSicZhYQ4uhXRfLXu/CvGmcO9WAGVfGG0zFRRdDlM?=
 =?us-ascii?Q?tYGwgqrT5ctiwmW7zCytyGWFh0IVAyAT5OkmzMAql5lNdbNLkUztNWq2LxP/?=
 =?us-ascii?Q?ubQQn90m36aNVmCPVMJrvBRSIjq6LggC46sGb570IdAO0CIjDigYgLxDD0ln?=
 =?us-ascii?Q?h1+XyEXIZJJHfGMXqk7nU0DOkvKx8lEFI4oNBnfak6MMDdEmCGrUfUi7wqZY?=
 =?us-ascii?Q?a9ugKRECa9PB1YgY3rX2atLGK7dUTKNvjqlEvgZDuMHizz4c4JOuW8207lwp?=
 =?us-ascii?Q?+GPO2gwacsg0PXD446pFVt987qnkFgBDshxqWB1lEphZV62eeXBvwk1NtjQx?=
 =?us-ascii?Q?r6t0kyEkhSTp6g+f9z6WSTu0xJQK6Mqxje+evdrBFmjk56HqAO00rHqbau6L?=
 =?us-ascii?Q?NtAgLQlgwQRPZMet/NIGWnj0sWtybTP3ik6m73LwizvmzCWLvjv/rgc/pwRX?=
 =?us-ascii?Q?sgtN9GFl48jQgwmAfOKx93zZCmWPC2IrYbeeys9JmN19/qw+MZ+rziSpAVQS?=
 =?us-ascii?Q?0euT1WLldr39r3LxZzq6nTAVR0U/ska2fd8faSrEzbsGyelZpA3J8BARM+bf?=
 =?us-ascii?Q?df4B964tpLyv91g/DkdDDqjbaZ9MDdK3kLpkdNAx4qYaNolwQMQwDjtOcGBG?=
 =?us-ascii?Q?ElMUIsLO4B4yIJ2zQyZUrcVx39e2gvEvxX2ZcFc1hOQ9AvdGTjcI+RkqunEN?=
 =?us-ascii?Q?1w9AAlxkZKQydwk2vx/1QWV6HnORraMUsBwm73BSr6Yo+ovwZNw3Bx0mIhbX?=
 =?us-ascii?Q?To5r11cc6fDEgC8o7qKlg/4LeMAvcF07govgf2WboliFHtSOoguwpNz5nTjm?=
 =?us-ascii?Q?U//HSGciQlSGPT+t1qdNoFqS3bhznVxjALfv8Ng1n/6yr1TWlLqkFYXXLH9k?=
 =?us-ascii?Q?EUcICFKyKryob0yQ565VPIXn/hTuRH1Rqgd/Q/ZTp3FuwehSeSbTJByAPKmP?=
 =?us-ascii?Q?aVwR/ZhP7mfxomwRcllcNmNusslGmDERSoTPF7eElUnLmG2SdyIcyN26v873?=
 =?us-ascii?Q?8NZWGuvk07ifB2M=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?MDJxYpjtgJPQmdQiEHHFCTw7hmZ3Fe2keySv3o1HfL13rjDwPWorbY2PJAV8?=
 =?us-ascii?Q?XjC5F9DfWEWeQq9B5pPDONN8HqxB1Eg5zHnCEuBSr2I3oqiE5l164HRx6oc7?=
 =?us-ascii?Q?4FwH1jyi6rCdiSPqjAKSGRfeDFw4qaSZnYeual+Vd9C9axeVOhD2uR9HFyXU?=
 =?us-ascii?Q?73Cy+2gEmKufWpq4RiwEpcwkZstwvHUFqG13e9qGVYXEpIqtA57Pf7i/TBf2?=
 =?us-ascii?Q?3n8IGaPjuuo9r7nosC7crDUrne2anucRMDpCcRtZghv52CCME+0ZS0HZ5HIT?=
 =?us-ascii?Q?BU09UN/9rgXyDJCeShf6Z62nkXZCVZGR+fXhp2vM6VskPOMMU4Awz4uK5C/P?=
 =?us-ascii?Q?P03S4um10ppKeNvvlBJNbhB8o1NLE+ay75rIWun3n3oUgxznfRSp1APlf7ZH?=
 =?us-ascii?Q?NZ9fZ6VjXMP9IYQv2tfW9CxD8W9SvN3+A7UNnPx7piOZTp6oxXn5Ay8E3Xwc?=
 =?us-ascii?Q?J1B/Lt70J2ysWlTFZDdHj7cRcLsFi4zsyT8vkrzz5chk8aEGtPF7dlte+n0B?=
 =?us-ascii?Q?2/6FWBTvPZkznhGusoQ8BDW4wFauTAxzoa879ADnf8L+/r1cyr/ARMEfLST0?=
 =?us-ascii?Q?Igbyz5bQsxzgOAlueN5lq2ld4l/mRNJWV4IMjLTEHOHwOsoFKdZjNGNRVT5M?=
 =?us-ascii?Q?sfplAiVpvkpzOJMXepW+V1GwndpUdaPOJFzaZ1Al8FF93sXsxSAVpzHmPiQC?=
 =?us-ascii?Q?3oQnTO5ttz6fweJoYQZED2YZcSp9nAu+ajN+Knaw9fqLKczUgB8JBPRrS4+5?=
 =?us-ascii?Q?HVKg7lRJ3Ou5TLsIsA6hVhIVynM+XgAS+dm0nygFPeC+gpWz0yzl8NVYtyKF?=
 =?us-ascii?Q?aPYW3t3DP3GXUiBZACjj0slkZm2+2GCmGcaLsRjxMYc5w+E5eDWEJlPZr19O?=
 =?us-ascii?Q?fLgz7mqjAVs1t1Q9CH/utNfjljKCy43L8hYm+u3ow3SlgDruA/PvpnT14ALk?=
 =?us-ascii?Q?n/Q43orlPhTRPyg63n11nD5ehkU/4FCnDUYAlDxpC9r7RbROlKVoEXGmRBuZ?=
 =?us-ascii?Q?Wm3AVVJOsZsi25rP6I+olB+kJEGGWBIHRkDEt4SnHPv/eKzg4paWMabkUHs7?=
 =?us-ascii?Q?sP8iP4m6Xyp/5Z42grXlM2buXze+Ll8x3d7YEDg9PCleZP9+ZmxqltwvOS8m?=
 =?us-ascii?Q?RSFzSeTKEoJbowitu8Bfew0DIUrK1hqOSWsDz48ewcxcSERrjtIlF5RVtlBP?=
 =?us-ascii?Q?mmjQkchXXVuFBsbK/G1hGyR0K4owCIdHyUmrlsUcBcPKQpErol15deEZipe9?=
 =?us-ascii?Q?0CjbKYYVTS9fq93c+sqUQLa9Y5sKZ7hCJx3eGTWY26b3BKVmXQ/GQ762rIhs?=
 =?us-ascii?Q?dnE5Ic8moGzs/DtBkgLFoLTGSFccyTAayPt16fvah5YL3hZc7XkpeaoJnTB2?=
 =?us-ascii?Q?polFMzLNgKrkr+NdJOjYOkSszrxwwukkVI2ZESiRyjYRqLqEN7wEP+R1+rLX?=
 =?us-ascii?Q?6zSyEcL7CCk7HUcCqPtH5pNlV7DyId3wgj4YYvXAL0ZJ37Fb0zW3h8fYqqVE?=
 =?us-ascii?Q?w8xFUUYQqUSfRGghkrG2bGojy+x8n1oo1s+o+VEM8a2cLBigTIKnN/DKOW1W?=
 =?us-ascii?Q?UVe7K6VQ34vXw3ok6XI/aYuGtyW5AoGi5tp3uXxA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adab98bf-d493-4824-dcab-08ddb563cb05
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 10:17:17.1339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hg2ugfSM61F9pNZKMoz8qdZGdVBqLJRtEShgwOgr62EGlLjy9KANB79DXwrvcJDtlQSQVnyC+qNGXrNIesAF0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9461

This will use USB noncoherent API to alloc/free urb buffers, then
uvc driver needn't to do dma sync operations by itself.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/media/usb/uvc/uvc_video.c | 56 ++++++++-----------------------
 1 file changed, 14 insertions(+), 42 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index e3567aeb0007..614cf4781221 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1280,15 +1280,6 @@ static inline struct device *uvc_stream_to_dmadev(struct uvc_streaming *stream)
 	return bus_to_hcd(stream->dev->udev->bus)->self.sysdev;
 }
 
-static int uvc_submit_urb(struct uvc_urb *uvc_urb, gfp_t mem_flags)
-{
-	/* Sync DMA. */
-	dma_sync_sgtable_for_device(uvc_stream_to_dmadev(uvc_urb->stream),
-				    uvc_urb->sgt,
-				    uvc_stream_dir(uvc_urb->stream));
-	return usb_submit_urb(uvc_urb->urb, mem_flags);
-}
-
 /*
  * uvc_video_decode_data_work: Asynchronous memcpy processing
  *
@@ -1310,7 +1301,7 @@ static void uvc_video_copy_data_work(struct work_struct *work)
 		uvc_queue_buffer_release(op->buf);
 	}
 
-	ret = uvc_submit_urb(uvc_urb, GFP_KERNEL);
+	ret = usb_submit_urb(uvc_urb->urb, GFP_KERNEL);
 	if (ret < 0)
 		dev_err(&uvc_urb->stream->intf->dev,
 			"Failed to resubmit video URB (%d).\n", ret);
@@ -1736,12 +1727,6 @@ static void uvc_video_complete(struct urb *urb)
 	/* Re-initialise the URB async work. */
 	uvc_urb->async_operations = 0;
 
-	/* Sync DMA and invalidate vmap range. */
-	dma_sync_sgtable_for_cpu(uvc_stream_to_dmadev(uvc_urb->stream),
-				 uvc_urb->sgt, uvc_stream_dir(stream));
-	invalidate_kernel_vmap_range(uvc_urb->buffer,
-				     uvc_urb->stream->urb_size);
-
 	/*
 	 * Process the URB headers, and optionally queue expensive memcpy tasks
 	 * to be deferred to a work queue.
@@ -1750,7 +1735,7 @@ static void uvc_video_complete(struct urb *urb)
 
 	/* If no async work is needed, resubmit the URB immediately. */
 	if (!uvc_urb->async_operations) {
-		ret = uvc_submit_urb(uvc_urb, GFP_ATOMIC);
+		ret = usb_submit_urb(uvc_urb->urb, GFP_ATOMIC);
 		if (ret < 0)
 			dev_err(&stream->intf->dev,
 				"Failed to resubmit video URB (%d).\n", ret);
@@ -1765,17 +1750,15 @@ static void uvc_video_complete(struct urb *urb)
  */
 static void uvc_free_urb_buffers(struct uvc_streaming *stream)
 {
-	struct device *dma_dev = uvc_stream_to_dmadev(stream);
+	struct usb_device *udev = stream->dev->udev;
 	struct uvc_urb *uvc_urb;
 
 	for_each_uvc_urb(uvc_urb, stream) {
 		if (!uvc_urb->buffer)
 			continue;
 
-		dma_vunmap_noncontiguous(dma_dev, uvc_urb->buffer);
-		dma_free_noncontiguous(dma_dev, stream->urb_size, uvc_urb->sgt,
-				       uvc_stream_dir(stream));
-
+		usb_free_noncoherent(udev, stream->urb_size, uvc_urb->buffer,
+				     uvc_stream_dir(stream), uvc_urb->sgt);
 		uvc_urb->buffer = NULL;
 		uvc_urb->sgt = NULL;
 	}
@@ -1786,26 +1769,13 @@ static void uvc_free_urb_buffers(struct uvc_streaming *stream)
 static bool uvc_alloc_urb_buffer(struct uvc_streaming *stream,
 				 struct uvc_urb *uvc_urb, gfp_t gfp_flags)
 {
-	struct device *dma_dev = uvc_stream_to_dmadev(stream);
-
-	uvc_urb->sgt = dma_alloc_noncontiguous(dma_dev, stream->urb_size,
-					       uvc_stream_dir(stream),
-					       gfp_flags, 0);
-	if (!uvc_urb->sgt)
-		return false;
-	uvc_urb->dma = uvc_urb->sgt->sgl->dma_address;
-
-	uvc_urb->buffer = dma_vmap_noncontiguous(dma_dev, stream->urb_size,
-						 uvc_urb->sgt);
-	if (!uvc_urb->buffer) {
-		dma_free_noncontiguous(dma_dev, stream->urb_size,
-				       uvc_urb->sgt,
-				       uvc_stream_dir(stream));
-		uvc_urb->sgt = NULL;
-		return false;
-	}
+	struct usb_device *udev = stream->dev->udev;
 
-	return true;
+	uvc_urb->buffer = usb_alloc_noncoherent(udev, stream->urb_size,
+						gfp_flags, &uvc_urb->dma,
+						uvc_stream_dir(stream),
+						&uvc_urb->sgt);
+	return !!uvc_urb->buffer;
 }
 
 /*
@@ -1953,6 +1923,7 @@ static int uvc_init_video_isoc(struct uvc_streaming *stream,
 		urb->complete = uvc_video_complete;
 		urb->number_of_packets = npackets;
 		urb->transfer_buffer_length = size;
+		urb->sgt = uvc_urb->sgt;
 
 		for (i = 0; i < npackets; ++i) {
 			urb->iso_frame_desc[i].offset = i * psize;
@@ -2009,6 +1980,7 @@ static int uvc_init_video_bulk(struct uvc_streaming *stream,
 				  size, uvc_video_complete, uvc_urb);
 		urb->transfer_flags = URB_NO_TRANSFER_DMA_MAP;
 		urb->transfer_dma = uvc_urb->dma;
+		urb->sgt = uvc_urb->sgt;
 
 		uvc_urb->urb = urb;
 	}
@@ -2120,7 +2092,7 @@ static int uvc_video_start_transfer(struct uvc_streaming *stream,
 
 	/* Submit the URBs. */
 	for_each_uvc_urb(uvc_urb, stream) {
-		ret = uvc_submit_urb(uvc_urb, gfp_flags);
+		ret = usb_submit_urb(uvc_urb->urb, gfp_flags);
 		if (ret < 0) {
 			dev_err(&stream->intf->dev,
 				"Failed to submit URB %u (%d).\n",
-- 
2.34.1


