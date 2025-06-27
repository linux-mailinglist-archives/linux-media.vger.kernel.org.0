Return-Path: <linux-media+bounces-36086-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC97EAEB42C
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 12:18:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0870E641550
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 10:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D675F29A32A;
	Fri, 27 Jun 2025 10:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Aaz6i9js"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010029.outbound.protection.outlook.com [52.101.84.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45562989B6;
	Fri, 27 Jun 2025 10:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751019437; cv=fail; b=BwP4zCYcIFj01IZJlka4etx8RJkxJ6vuz+CHgqi7ebzHa0NddqXENQnvMv5h6hX1oM/t6i+M02Q8eLaTh7NQOA4CqErulmcNVHcpz/2Ss+BGO5SnKwL42tWCOeP3Pz7JkZMb3LkvbousAlfyK9mXMCr6L5UHmDNgjcjVY1zwf20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751019437; c=relaxed/simple;
	bh=uCQV1ZzY44MUGfU5k50VsmiF5xITDrrldybEM4OcbJc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p32d/4tNy/+wrbUK2+v0NDRUKIIePL5hBBi0F4CX8L5qNkT7U8D1rpJhi+ZcGuxl4SPBOXlcUU3GFpuXgnSVoyuxfWqoPPIIb9ZIlSqhM1hTZ4oVyWd1ydNQE9hGZh/mfwWXLlEPMlNM4Fc6KpM897nU98XXFPBUr2yXB2yAgxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Aaz6i9js; arc=fail smtp.client-ip=52.101.84.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SYn8ux07RDmr1WcrF2l6kVqYp8XTg6CemJ6bFcbPntYTl5oJIWLJd1zDpiHuJNqjxRvZI4ZlG5qc2ZUrQ8DFsUiqpEbMRMhsON08lhTS8lcn9srSqpppuq0IbLiiy9t3bOAbYABaFQYVNi31+Pyp9mL1UTuiWyPaK+oquszzPP6HM0pSjgGE8o1ez7UrghIfX/B2IYK663z+FMlmYZoAVH9MewjE227JqmDkvF+YUFC7u0HSuV/fG1uz+p0gJRVjWonZp206hagV71vmtd8cHA49oPsdiXuj6i3KhiL4tf4rACPd3OiM/W1ZR6RPOyytDxHG9Uf42Flj7aqJWQi0ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wn0lAgH8VH+KhspbNufB0Kv20qFGEJ0OjMvutXTSJiE=;
 b=dncUhUAfj5zrpOIT2I1nWsKBIXLRAUVeZ4lUFlV149QIV5oJDqQe5Mk0NZbiJkoWgMkr6cjvryPweDpXhZ47/z/J9TNfOfJ0EKq3fpTKhkfbtRSDORoldP2zTEk+PNK0C87eBKWwYxXuaaQgFQCEJnD5B9vvf6OQwbWdN4fWPMmagagzI0QFCEQ58HEOXGwh/jerFSxx5LWWoMmWMIeqOdPkgg6g9RXPNK5iPJtksKmEeoZGzOJQ6XMyJPQbEyUn/hKLhJAztGN+vEePrtr7ZGTg9F7aEE3FzcWvBBvFgQMZWGOLZM9gcpbtBHUOmrfflE2Kd0oQA+6WPyODXi08CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wn0lAgH8VH+KhspbNufB0Kv20qFGEJ0OjMvutXTSJiE=;
 b=Aaz6i9jsfimeMSLdK5q9HckIXugFu3U9jMpx3+kdIwrY0EE2TeWdIqpJ7B5BwxnqqtHkBEHzqmliRwTWPMRIz70HseAMiUp901ETUz1s/RYedSyF0wJ9ML7IGaRcJo9rrMdaWseEyrK28H0LzJNLa2N8F0VG+APAIC3vNPEssQLhHCtr1dIuKutn4a/8zBzr+FNZPXQLIShKsBJDMyuEyucFn3/iWTlh9tVkKb4RkE2hdfMVEJO0eRlZtNQzVUqKYyn863fsXx0mAuayJDyYgkMVxAMOg3F3b2X+VaJpia1UYRPxpcR/WkqjtxWz03TwReN8vPz4oBeiBhqUZKIPMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by PA4PR04MB9461.eurprd04.prod.outlook.com (2603:10a6:102:2a9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Fri, 27 Jun
 2025 10:17:12 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%6]) with mapi id 15.20.8857.026; Fri, 27 Jun 2025
 10:17:12 +0000
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
Subject: [PATCH v2 1/3] usb: core: add dma-noncoherent buffer alloc and free API
Date: Fri, 27 Jun 2025 18:19:37 +0800
Message-Id: <20250627101939.3649295-2-xu.yang_2@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8b712419-c776-42d5-a6fb-08ddb563c804
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?QZn1KIefjpnMPcw6K21Da3IpG/dK/cONazQd+zl6RWWUtGJLVRMkSd5WoiK6?=
 =?us-ascii?Q?BdshlaBqc7Yv8Jeu+uVj1hnllbRbg+qWXq+hu5Y45u6l1J4Zj1VEyWVPm5fr?=
 =?us-ascii?Q?das4N+swQE0ZfJ9odPl0B2XJPJflXVqkz9pvbk4Ymj1DWS/BqM9jnfDDoIwG?=
 =?us-ascii?Q?J2427lJm2f3ziSV0TW9uTn9D7pC2is1JaPShgUL/aIlE/WrjjcwkXT4eKC27?=
 =?us-ascii?Q?6BfjOwXTqDkNDXTvGY4ldqa/togxJxlFVKdDRcTBH/YlMVGK6JSQkmD+i+1+?=
 =?us-ascii?Q?31nVb19Rr0afSp3+HaHHhefuPKdrkjpPspcCb3FX867JtEMe21Lcj+JYZPJv?=
 =?us-ascii?Q?ylHQQQn+jBZzEEWKSHqCGNfrB32czESdINtSp/+pTLscIIz0UvoZTIFHsEAd?=
 =?us-ascii?Q?RF9ahkI3GyvquXFZJ/53I9pwpJlopR3FmLGNQybtoou88TkmH23yER0M8sCm?=
 =?us-ascii?Q?bn7C3IUJHQ/8B7m0bMgj5q6l3cW9CJBIBmLU+aHZZxjB+Fh4ZVJBYQsUVCNp?=
 =?us-ascii?Q?9uBLM/vd6EguJclkzCY5asqTnRCoqXCAMmyJN5VmNC3VExzNoHUzCcJbGP55?=
 =?us-ascii?Q?BgjQ10ZP0uok95lhRuJvyW8mxt1JZC0SRPKPd2r9pR5ok5z9mD+ypZq5EJu4?=
 =?us-ascii?Q?lzsHNnbp8Hmvy0u2OlO9OeNHyJ3I9a0rmJ5ta7y6fYkGBsbRTIBKA0wSYcce?=
 =?us-ascii?Q?Yjw9sGFMTn4xVysPVbAR1NjwkNkl4D2c1rw6xiamjuVJwIMBLb1C/Jbgp+eX?=
 =?us-ascii?Q?H9qf8eENMSVk48u1qaM8qCsdqPMLuNRE50zLbLrT1kONWgovV9KlsC79IZyx?=
 =?us-ascii?Q?1KOGcvwSAyNTZJycjIguGI+Qoyls+v7HnV6+CzvUCJwTJTh24EBboMWLvtUF?=
 =?us-ascii?Q?vSsx4rt8JCBEMJjEsKa9++iOfLh9GRZt6ROwmfL0SK7v1IPFCP+T5zCD0ZKa?=
 =?us-ascii?Q?mTfO30LeV8DnFDgcWWH1jbyANa+Ja7mYcuPaVIeKNbCW7zts77HNU36iCJw7?=
 =?us-ascii?Q?VQUmqLwGMwxoQhMm/BHifmrtVdo5L/SHSQ64TFCwCZdK1dVcCORaepL2glRy?=
 =?us-ascii?Q?1tCCHkbMS4CQcIHIOFZzi8rv0fF9WSsq/63AabGRvXnha4J+ow4b7iDmPLC4?=
 =?us-ascii?Q?rspuTMsZsRmeKFPsKKs+sUfoogdmLFg5ApNGcRSPvxt5ZjHqIFXz3Bz9/dlD?=
 =?us-ascii?Q?AqWOFryZJlFRapAppVyN9LbVbnehKrLw2LzCAJvCMT1JAM77NmNfvi2EAW4q?=
 =?us-ascii?Q?rKN5BMIRvzQdS2ccXUC1akGGU+5yr+PRBlC/zgTJ6srtS4UtzC+XFgQ3TJVu?=
 =?us-ascii?Q?a/gRri6OjNdxd3jZMirDAR02XN6O1onD6R1Tubqc5rv3wGuB+fxT3+hA2xuR?=
 =?us-ascii?Q?p3pQ4r/Jq18ukBU8z3acPvssR4GqAKzcKwY5NuVZOLVatOF2mBvlauvEtBOh?=
 =?us-ascii?Q?TmSZhNfCubJ7Ats5dn/cnjhSogZKvkGXq6wwJ5pLyIjmlszIDO+WaRIKAbpe?=
 =?us-ascii?Q?/gVFjVnNEjIhXSo=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?ub2KjiYled8/ZGV+GUX8K/la4kWNEIhl/NX4GJu8ZWSFEplzq19UITLGSOE+?=
 =?us-ascii?Q?ODknZgyjtXAcwiF7k+syuUN/aygg1jJs4oNU/UaE2Qw7z6mkOUcjOL3VNaJu?=
 =?us-ascii?Q?Oz16ZDxLSQNiOcuu0aN5IQbZ2WjptFTApMc4sitQMQylNV5edvMetSsUHtNt?=
 =?us-ascii?Q?ozk/X+0XiHfLGI8sKiOqc0ZwX9lM1ZJL47Y84PCMc+/ZaxJBkPLBKrqaquh6?=
 =?us-ascii?Q?0K8Min2y3fr7tEizM0Dv1F/N4cxnwTVRSUmo1F3GitVeITJ/1Mp7fpDs2Y0b?=
 =?us-ascii?Q?GnEd1DYiiZNodafv5LiZmXYK9cCNZUvkaojkJ3KBn3Xy5NUTl4TgE98U+FFJ?=
 =?us-ascii?Q?d0OaZkMcg0uC5Ekq/JzzMZYEXc3s3J0DHA33UPSxRybiy033T4C1xoyI6MTE?=
 =?us-ascii?Q?AURTf/cd5QoCznEXRRekV0SdLm7Dwv5HfBigJIX9qzua5KEtwb/pYM5UlsQa?=
 =?us-ascii?Q?X0ssnaSScy/agDcJEZV6uTq/169w5k+pvsttX2WEdexkVZFrYey92MunxUgn?=
 =?us-ascii?Q?Wn/48K/fT50kaXRMoeyGYt0Xm+B3EZ8x3xhWs5jE2uC8VKO6DpdBJudndqMo?=
 =?us-ascii?Q?wKishTuGA3HRwz+IU1G16rB9TIgvJ1xejJJhnJXdA5Ax9VtnPUhTKAnRlEh+?=
 =?us-ascii?Q?trlLbMvGkm0PW3cEud+oHAoo2i974BH2XXUWywotYOzvl6YA0zHx1VWFKOlM?=
 =?us-ascii?Q?EojFTR86ypmSuI16sTRRzJZwDu6sniVb8hxXF1HV+fkl9pfY0IEVS6DS1STR?=
 =?us-ascii?Q?GpOv1rBDBxFIefkO4wefqRyZ8XOF1oFBuSwLZmCscwT7adGB1OR8LqCTUcB/?=
 =?us-ascii?Q?haCLF5Wz/xtvrz9pXwqgOTL/97v/RApGRILaMvWuNmSDPAMHr/RJjIFwf18s?=
 =?us-ascii?Q?T9hrw/pjlGyec49Mz+2U2PoOzgGrgwXEsCKHtV9cYf7+n11QBmyXRT8LSYQd?=
 =?us-ascii?Q?Td8akwTkMDDePASH22ALQXNKkVjC4c62C+K4yQK9D8+vDTfQKcleOFJ2j9wL?=
 =?us-ascii?Q?LHfoKPQ61qximumer0i68R0gisFimbOQaucQrvH+fZ0PLdGqfLGXGpuU9M5r?=
 =?us-ascii?Q?29gX3LsIHGhC6/OB2pmDVf7RB1cQRdhXPdGWBtNABB8GTjEPJgn1AdrMbEgw?=
 =?us-ascii?Q?BEBwcFaDsMFwhY6vHK42hsOQh5i/EhDKYTEosSWgWDh+cRrGAPI+TlRXegL4?=
 =?us-ascii?Q?vjt6PtTsqUO3kuYyllP9omaU2r8TLImReXbHGRG/iQRM14GyVaqNyVRDUR7a?=
 =?us-ascii?Q?TyoNe+OgM3QDLY2kdCxOv+iYAYjft+NBd0n/knlOrxqyicIvgqbLY/46jI/K?=
 =?us-ascii?Q?pWqn4v6RU/ce5Cx51vI27bwwsaPG30jf1IpYe5OZrhJhOLsASLbQRfpUu1BA?=
 =?us-ascii?Q?EYrLqVLnUzp6sdDUYVHWONYNrJPbAl631xufdUNEYxFAjVtnrWY1PBx+d8E4?=
 =?us-ascii?Q?VtpTkbQb3mixhFcKP178tTCHt+Aw4WyYs4ZkdiDFbuD9+ns8VYxhPkKnlKKM?=
 =?us-ascii?Q?zVOK187G8aJxG45gXwS8TTAptZ2g18oV4Pq7HvbaoVSg3wQjPXS82DrGvQ+R?=
 =?us-ascii?Q?mEPi2JAFArAnty2yWtLEDYx4sbxQOTqwZGPxrFxL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b712419-c776-42d5-a6fb-08ddb563c804
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 10:17:12.1432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fycQch4dDRBX09l7SMyVlRbMRuMWIdpi8t8rPvZ91IYcZn5saSKUry8Pv1VRQ2oLKsIHBDc8JAINXKLNIB9g9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9461

This will add usb_alloc_noncoherent() and usb_free_noncoherent()
functions to support alloc and free buffer in a dma-noncoherent way.

To explicit manage the memory ownership for the kernel and device,
this will also add usb_dma_noncoherent_sync_for_cpu/device() functions
and call it at proper time.  The management requires the user save
sg_table returned by usb_alloc_noncoherent() to urb->sgt.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/core/hcd.c | 30 ++++++++++++++++
 drivers/usb/core/usb.c | 80 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/usb.h    |  9 +++++
 3 files changed, 119 insertions(+)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index c22de97432a0..5fa00d32afb8 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -1496,6 +1496,34 @@ int usb_hcd_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
 }
 EXPORT_SYMBOL_GPL(usb_hcd_map_urb_for_dma);
 
+static void usb_dma_noncoherent_sync_for_cpu(struct usb_hcd *hcd,
+					     struct urb *urb)
+{
+	enum dma_data_direction dir;
+
+	if (!urb->sgt)
+		return;
+
+	dir = usb_urb_dir_in(urb) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
+	invalidate_kernel_vmap_range(urb->transfer_buffer,
+				     urb->transfer_buffer_length);
+	dma_sync_sgtable_for_cpu(hcd->self.sysdev, urb->sgt, dir);
+}
+
+static void usb_dma_noncoherent_sync_for_device(struct usb_hcd *hcd,
+						struct urb *urb)
+{
+	enum dma_data_direction dir;
+
+	if (!urb->sgt)
+		return;
+
+	dir = usb_urb_dir_in(urb) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
+	flush_kernel_vmap_range(urb->transfer_buffer,
+				urb->transfer_buffer_length);
+	dma_sync_sgtable_for_device(hcd->self.sysdev, urb->sgt, dir);
+}
+
 /*-------------------------------------------------------------------------*/
 
 /* may be called in any context with a valid urb->dev usecount
@@ -1516,6 +1544,7 @@ int usb_hcd_submit_urb (struct urb *urb, gfp_t mem_flags)
 	atomic_inc(&urb->use_count);
 	atomic_inc(&urb->dev->urbnum);
 	usbmon_urb_submit(&hcd->self, urb);
+	usb_dma_noncoherent_sync_for_device(hcd, urb);
 
 	/* NOTE requirements on root-hub callers (usbfs and the hub
 	 * driver, for now):  URBs' urb->transfer_buffer must be
@@ -1632,6 +1661,7 @@ static void __usb_hcd_giveback_urb(struct urb *urb)
 		status = -EREMOTEIO;
 
 	unmap_urb_for_dma(hcd, urb);
+	usb_dma_noncoherent_sync_for_cpu(hcd, urb);
 	usbmon_urb_complete(&hcd->self, urb, status);
 	usb_anchor_suspend_wakeups(anchor);
 	usb_unanchor_urb(urb);
diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
index 118fa4c93a79..b78e61f38d0b 100644
--- a/drivers/usb/core/usb.c
+++ b/drivers/usb/core/usb.c
@@ -1030,6 +1030,86 @@ void usb_free_coherent(struct usb_device *dev, size_t size, void *addr,
 }
 EXPORT_SYMBOL_GPL(usb_free_coherent);
 
+/**
+ * usb_alloc_noncoherent - allocate dma-noncoherent buffer for URB_NO_xxx_DMA_MAP
+ * @dev: device the buffer will be used with
+ * @size: requested buffer size
+ * @mem_flags: affect whether allocation may block
+ * @dma: used to return DMA address of buffer
+ * @dir: dma transfer direction
+ * @table: used to return sg_table of allocated memory
+ *
+ * Return: Either null (indicating no buffer could be allocated), or the
+ * cpu-space pointer to a buffer that may be used to perform DMA to the
+ * specified device.  Such cpu-space buffers are returned along with the DMA
+ * address (through the pointer provided).
+ *
+ * To explicit manage the memory ownership for the kernel vs the device by
+ * usb core, the user needs save sg_table to urb->sgt. Then usb core will
+ * do dma sync for cpu and device properly.
+ *
+ * When the buffer is no longer used, free it with usb_free_noncoherent().
+ */
+void *usb_alloc_noncoherent(struct usb_device *dev, size_t size,
+			    gfp_t mem_flags, dma_addr_t *dma,
+			    enum dma_data_direction dir,
+			    struct sg_table **table)
+{
+	struct device *dmadev;
+	struct sg_table *sgt;
+	void *buffer;
+
+	if (!dev || !dev->bus)
+		return NULL;
+
+	dmadev = bus_to_hcd(dev->bus)->self.sysdev;
+
+	sgt = dma_alloc_noncontiguous(dmadev, size, dir, mem_flags, 0);
+	if (!sgt)
+		return NULL;
+
+	buffer = dma_vmap_noncontiguous(dmadev, size, sgt);
+	if (!buffer) {
+		dma_free_noncontiguous(dmadev, size, sgt, dir);
+		return NULL;
+	}
+
+	*table = sgt;
+	*dma = sg_dma_address(sgt->sgl);
+
+	return buffer;
+}
+EXPORT_SYMBOL_GPL(usb_alloc_noncoherent);
+
+/**
+ * usb_free_noncoherent - free memory allocated with usb_alloc_noncoherent()
+ * @dev: device the buffer was used with
+ * @size: requested buffer size
+ * @addr: CPU address of buffer
+ * @dir: dma transfer direction
+ * @table: describe the allocated and DMA mapped memory,
+ *
+ * This reclaims an I/O buffer, letting it be reused.  The memory must have
+ * been allocated using usb_alloc_noncoherent(), and the parameters must match
+ * those provided in that allocation request.
+ */
+void usb_free_noncoherent(struct usb_device *dev, size_t size,
+			  void *addr, enum dma_data_direction dir,
+			  struct sg_table *table)
+{
+	struct device *dmadev;
+
+	if (!dev || !dev->bus)
+		return;
+	if (!addr)
+		return;
+
+	dmadev = bus_to_hcd(dev->bus)->self.sysdev;
+	dma_vunmap_noncontiguous(dmadev, addr);
+	dma_free_noncontiguous(dmadev, size, table, dir);
+}
+EXPORT_SYMBOL_GPL(usb_free_noncoherent);
+
 /*
  * Notifications of device and interface registration
  */
diff --git a/include/linux/usb.h b/include/linux/usb.h
index e8662843e68c..fee0e3cfad4e 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1619,6 +1619,7 @@ struct urb {
 	void *transfer_buffer;		/* (in) associated data buffer */
 	dma_addr_t transfer_dma;	/* (in) dma addr for transfer_buffer */
 	struct scatterlist *sg;		/* (in) scatter gather buffer list */
+	struct sg_table *sgt;		/* (in) scatter gather table for noncoherent buffer */
 	int num_mapped_sgs;		/* (internal) mapped sg entries */
 	int num_sgs;			/* (in) number of entries in the sg list */
 	u32 transfer_buffer_length;	/* (in) data buffer length */
@@ -1824,6 +1825,14 @@ void *usb_alloc_coherent(struct usb_device *dev, size_t size,
 void usb_free_coherent(struct usb_device *dev, size_t size,
 	void *addr, dma_addr_t dma);
 
+enum dma_data_direction;
+
+void *usb_alloc_noncoherent(struct usb_device *dev, size_t size,
+	gfp_t mem_flags, dma_addr_t *dma, enum dma_data_direction dir,
+	struct sg_table **table);
+void usb_free_noncoherent(struct usb_device *dev, size_t size, void *addr,
+	enum dma_data_direction dir, struct sg_table *table);
+
 /*-------------------------------------------------------------------*
  *                         SYNCHRONOUS CALL SUPPORT                  *
  *-------------------------------------------------------------------*/
-- 
2.34.1


