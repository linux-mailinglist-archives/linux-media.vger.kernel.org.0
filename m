Return-Path: <linux-media+bounces-36651-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A000BAF7089
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 12:37:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD8ED1885B8D
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 10:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C64B12E4243;
	Thu,  3 Jul 2025 10:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZovBS5k5"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011050.outbound.protection.outlook.com [40.107.130.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1852E3B0A;
	Thu,  3 Jul 2025 10:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751538960; cv=fail; b=ZrbYqpYcEPBZgcVf1nWCKdxEZQSikqKSpVinb+rGEmarfuqtHBatZ7M+q6kJ4i4ef+THd+GuguwciiHbJK/unvo91GI1Yjm7O5fw78jw5rKAejQRAHer/Hy9A5IqO70R2zta7gkm4C+MblWJ+HSmvRImuECNgBbCha2nU8mLbeY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751538960; c=relaxed/simple;
	bh=X1r+fS34EO+oP6hvm2GwMZ6ZYVuh3L0ke5KSqG4aZbQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EGwF0fqM576kmXvP6PFFp1abKtz07zGIfzFgm4Q1Nkt8SeaXMM5b/IY0bDccvZOr+FSgn0r85GyJKmUX99LQeXfSB69J1/T0rjHzmFRUHGPCH7hpeJcK7vvu6nQ704P13pO2Re7JqqVC7qVu0QWh7wY1KK0ABmZbHxZrVRONilY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZovBS5k5; arc=fail smtp.client-ip=40.107.130.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lkbp4rh+NZHaMKf1TQu46Fdz3DeNvV7rj2GzVhHFdedrVDmO8By6UEUINSywradSXEMMxonqEFwZGgu+/AoCYXAcW8svmaBOudZomWOjbxb3AUzomlJ+mZZ85hc7HZO5CZswjYPX6gxf3v2Xv/SHfYXge4rUnXgapf+HiAR55lUJ4EMWm3q1s9LDlPthJOW8NPdN/iMF+OfIP+8HXeURP8g/4WEObeTblgm4UU7CEWKFAG3Ms4JvjnlbZ5A165b3xRl2QqdkzyTFJMkZrLucyE0+Lfhml5arGXPTfKNyqDwe4eaeaYUTH6zesPwKeEi+XmXoBZmTAOt67eg6ofADow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSKy1xmXRvzEA2tWhXJskNFy7c382nQM50HD36q4zLI=;
 b=MXSpTaU3vZbitORJ+jM5lZglFHUPBZnuFZvPOxoTr5i1vzL+7OwU46XKB4Y+bprXSIihDxOauAyUPxWiEaIktfSeBmfShG+q8GDU/6LjMjcC94b5212oFvZP2AEgxr3H9Td5thqm9xdCjit6wF8RoV2BH6Y6n9FrlxyOxgK5cOCjdyFPw5zTwy32mONxhSHkeUdd0tKT+TZXQ1jA2PgEZovHk570kZcBOG0LcmPMhLR+O0+44df6ClaJZyDntF6TufMCIja43Ej10OXB3C/3ckCfYW30Bl0nqZTXCM6RqLdWvsxuP4Qyq6vbVnwpcohHIOWBXojJUGSvOD36z2dG4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aSKy1xmXRvzEA2tWhXJskNFy7c382nQM50HD36q4zLI=;
 b=ZovBS5k56KmUue0sQ+yZCzRJBrXAPMu1r0X10/mArEQbB/qMQ2dwitNzPkC1x2k56a+cIigN/Lf0hODgl5driW02Nofof3pb7/0B64mCtbkprFhg/O7c7vxfvH2bqxxqzXIeCfDkpx9N3P6CmhGPl8hmKH+5cbYKI5jpucH6rGY3XvNBFITstfTtw+vvhB8ckZXqKrgYelJDZDUS5jnt+SoinvSggvWKo/MMDJpiYNRVd29ZbiqvhAsTDhvkHdWAZREfvKVBcejhfg09gtNIKZ3DtNpAAcFduSOBdGJ4mZEik9U00MbzBBVe3FT1ZdwObmTYxywtodeQ9j36PZfy+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM8PR04MB7826.eurprd04.prod.outlook.com (2603:10a6:20b:234::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 10:35:55 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 10:35:53 +0000
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
Subject: [PATCH v4 3/3] media: stk1160: use usb_alloc_noncoherent/usb_free_noncoherent()
Date: Thu,  3 Jul 2025 18:38:11 +0800
Message-Id: <20250703103811.4048542-4-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250703103811.4048542-1-xu.yang_2@nxp.com>
References: <20250703103811.4048542-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0050.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::7) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM8PR04MB7826:EE_
X-MS-Office365-Filtering-Correlation-Id: 78481ca1-c75e-42e1-6550-08ddba1d6322
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|52116014|19092799006|376014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?4CWgaBNi5NgkR+liz/zcLbMwk9nqBoHo4Dr3JvYO9J8nKMqSwEfjyT7hLgac?=
 =?us-ascii?Q?UYElwWBmpO36jS7n0d416NMvNYCqA36QFlGw+pkJTGr9dEcLoyJHjUApSvVt?=
 =?us-ascii?Q?A54v8fdAWX1koyBCnG0gtoN4LZLRm8O6og2jG8D3uk3xBDX2E5exFH6dVdgS?=
 =?us-ascii?Q?cPCTTou/Rj3avOG9WNga4MU6009Ok8Z24IVvCbSORiZJraUml0tsgU7yJfWY?=
 =?us-ascii?Q?ToDR6JYvvb9S/cHgJtnGo0pVaBzIev8NasoQiKgNbEr8nhM4A5Mtcr2sRFEj?=
 =?us-ascii?Q?g+43/WXs3swhSSgsjkn/T+MxEMH+5s0fmySAjVQ1BmSvqG/yF6bR4YUicjZm?=
 =?us-ascii?Q?DmDKrCBAzI9wIFPUkIzFeo29UCNaEPLpMJt7ywI0iZxCpbd2J8+CiOQuTZPU?=
 =?us-ascii?Q?/O0nkUfh6SUSmR6ILc0CyoTYXkgWiya49+Ziq2Jo+7vevhTm1ogk0rQtuXG6?=
 =?us-ascii?Q?fQG2owpeqaERcu/H9mahFwECFRyCBfh8IZlX1iH41epmnbO05By3ivWUKuRa?=
 =?us-ascii?Q?2qOpcy4JaW22yqVH9m7KkUq745Vc4MObKEnyC6BPORZDof+m5lH6heokC4T+?=
 =?us-ascii?Q?1gMiPLWi8nF/TwMhg6USwc82zB1hzZVIBvEmABhStSGCTAIE3fCxtNO8X1Qp?=
 =?us-ascii?Q?KTwYS6kn5OsO/lCU1Yqo9aEzfXQiBrfMfF9trHE/qo7VRtapJbTh0jOqKAq/?=
 =?us-ascii?Q?DivH73w2Qbc+tr7BK6Fu+fhP8WPxc0OJ2nX20YIEvGQh2J/BtLC2Q7vE7y08?=
 =?us-ascii?Q?1XQJ5xQxCD0fEMHsW6cPszEmCq5VCk/rSFG36gCqIkBNU7+xd2vIxNjV3iSQ?=
 =?us-ascii?Q?EQy0ZFhJFVKcnU8MCsAH3Wm0QBctuuHLIWYTlgZMTkTO7c63NfntkEv7lcgb?=
 =?us-ascii?Q?CjmQbJDptKmFfFnClzWuboVQPpO9EyuowGmv2kNz7J5z/RxvkK+H93FGl9xz?=
 =?us-ascii?Q?ZMlM9XVpZ5xzoC8N4SZf295HquoZm786HIfMflK/zBSHMWp3BMDQG2RSgvl4?=
 =?us-ascii?Q?GJ4TN6rtK2cRYcb6R/jtWoVOFY5N/TxHCxsYiieaXoZcFA9XD/PVcBE39MTl?=
 =?us-ascii?Q?GbV/hymuODqtR7hTnkn+2uLvp2gA3ivaQNmld70ERxkm48U4/JDttjAS5qF9?=
 =?us-ascii?Q?Xj8EbObz5lTKhWL4ujfkhofleTX/TnuBHU2SVgGOWah+3arbdxpwWV6Xn6ML?=
 =?us-ascii?Q?QOWawfccgL2DOdzCMUDGKcWGpkBA+BJ3LNmkNMJykPHTG/+UjP2wku1BTrgM?=
 =?us-ascii?Q?b8xRxXwR4z7sfrQBUllF9UzZRsyc0j8oSFg8R3o1Qo5r02KU8/C5fwJAtj1x?=
 =?us-ascii?Q?KaqsoWPZaoRre7DbiRZtLn9fp1MGFM+V5iD/Z5BcRh+APixHHD1jFzybmjtV?=
 =?us-ascii?Q?eCafn+B752auUURyGGzk1ZJiO1iC1p3QTAYgJApCesRjQSH689ZDztbS63O5?=
 =?us-ascii?Q?9h3KT3DY61gAxMbCPdoI07QJvXI3IPg0Ix9c2tmJ7ILEOvVq1rHtNrM56fNw?=
 =?us-ascii?Q?LgCpWjWSwX/Ka1Y=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(19092799006)(376014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?91/7lKicjMKvcdrbgqZhkbFMmRPex3przcSg1+15YZi/F/NtC97A9oN21Dfz?=
 =?us-ascii?Q?XFtU4oONl73nIqLMlSo8tH2nGVQh1KUejh/9i77KnCRQsFe8wIKyiabub8bQ?=
 =?us-ascii?Q?jRmPw0SFz1fS6Ykb6AbXyk3A4wmnBWC6ioLjKXNDplClEUcKxZN2vMKwFC3M?=
 =?us-ascii?Q?KjrQavVdBPMWTcdiPZRLqb7LvDpcn2CR0AuJhD6h7Jl+LGumNDQs+q0b4iA+?=
 =?us-ascii?Q?NBR1ZCIXG7S+g7TAMp2G/jaThvd4J/bFAjgHc/5R9qlTJIQRQKADzxJcUvW7?=
 =?us-ascii?Q?2CEZ3fWFKaxhVijixOMCaqTS9IcVmNKzQm6Oxe02oVhn/bcHXbsrAfHzO+Il?=
 =?us-ascii?Q?n6xp4cZEpcPo6kwKODIx+5uUj8sTmlGdy5gjUHsIKmgi6gV4lpicsEdOBdNa?=
 =?us-ascii?Q?lrdkwDZDtipv2RJ9B2BS+JchKu4M3Ucite3e485DlqvwIfBUGLgXAZa/40h0?=
 =?us-ascii?Q?BScHDB9G5NN1s16mJD1eMvh2oZQ+fsyRpWkAcfI9qMdSD34tbHoApfAGozoO?=
 =?us-ascii?Q?HysHDEFv8AWNIje6rfZ0U7xPlz+Y/r0SrblXtz5t3B2vrsou7NZg+fF30Zxx?=
 =?us-ascii?Q?sPwa9yr+WiKPrzFW1ndkHaz44471jZf9ZiBx1meIgN1qoAyhwl4a6VF4p80g?=
 =?us-ascii?Q?VtDTO927LHWPzCUYpVS65uedJEbvUeQITOIGbqlOeW+NFbIEe3h1cKpsUc+c?=
 =?us-ascii?Q?mR9wv8tEKYwKIb+qEP5GPkAVSSeB25yadAR+fml3tD/LrvlCsSeVVsveq4x1?=
 =?us-ascii?Q?rAC3UzbkNoO/BG8OfSq61z4pXDlj8znry5BtNaSIB9K1iZ+dR7e46wmA7oCK?=
 =?us-ascii?Q?9wwFwZH5WQKe9O3XyPODtrTmU0+2CNv2bVWowSJiVakbphJ/qYR5dQ9N78/e?=
 =?us-ascii?Q?ncRq2o0gNRNKqFLvBWbiKfI0NTd/CeHgnNcBqvngLfJkYNgDDuDDdKPPqKJF?=
 =?us-ascii?Q?o+y8T/gLp8352DPNK/4vBHRIfyy5HArnKStFTMSgpkCHhbYKtkvJB8FORGBQ?=
 =?us-ascii?Q?wBmqN+Pzetevwvd0oS0HJTvsGKAQWZgaEEwnqXToiivUspWIVscbRN8wshj+?=
 =?us-ascii?Q?9x2Wd8Uy9a/pVPJmhAmreiyn21aVIvgJup9J0z+P0kHBMnCTFR1qqER0YvTz?=
 =?us-ascii?Q?D7KExAm+vpepD9SdaPiZop8q7oZv8VQ5VcOzHAM+8x5gCZGWYzPl7shluQ0u?=
 =?us-ascii?Q?fqAqxix0GjdvjVJFSixC6b7f/2h0P3a4EhbJKetNz10fV+2VZImfXQsyJt8D?=
 =?us-ascii?Q?miGbqbjVD1a49FlrnBOka+TITcDpYWLoJ7dgTPXHFO7gvSYzZvirCjU8Ao8q?=
 =?us-ascii?Q?Z0QUy/qqLOsf4X+MZKAFemNbyh8Xl1WC9IKhYwb6UVk8dXjhhXLpXT/EtEKt?=
 =?us-ascii?Q?GdqFVUC1eA3uTjVFVy22osP88uGT4dThVasTQXt+5E3VU3AGqKAMNwUMb+DV?=
 =?us-ascii?Q?kOYqYLQo5XwN6EN7hokCvzfD3j8NfEa863iFvxnXYYaRzGgov2bXLtKp2cXc?=
 =?us-ascii?Q?o+F2/l3JiojW79fupDE/HNfXSqmrxHd4L4rOlS3/riAHl8kmsn56RLeB/qOC?=
 =?us-ascii?Q?dWZ99YcPMf9gCaRXvX7rSPAmQBaENTlJdQBQrntm?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78481ca1-c75e-42e1-6550-08ddba1d6322
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 10:35:53.8485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cgPJruMX09ikIIhpM/llUFuklRVxoBDQy7QzroWbTr/IrfFRpZVMiGPZ1RdjqvqEY5ONwjKORHZ7ZnA05+QoQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7826

This will use USB noncoherent API to alloc/free urb buffers, then
stk1160 driver needn't to do dma sync operations by itself.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v4:
 - no changes
Changes in v3:
 - no changes
---
 drivers/media/usb/stk1160/stk1160-v4l.c   |  4 ---
 drivers/media/usb/stk1160/stk1160-video.c | 43 ++++++-----------------
 drivers/media/usb/stk1160/stk1160.h       |  7 ----
 3 files changed, 11 insertions(+), 43 deletions(-)

diff --git a/drivers/media/usb/stk1160/stk1160-v4l.c b/drivers/media/usb/stk1160/stk1160-v4l.c
index 5ba3d9c4b3fb..715ce1dcb304 100644
--- a/drivers/media/usb/stk1160/stk1160-v4l.c
+++ b/drivers/media/usb/stk1160/stk1160-v4l.c
@@ -232,10 +232,6 @@ static int stk1160_start_streaming(struct stk1160 *dev)
 
 	/* submit urbs and enables IRQ */
 	for (i = 0; i < dev->isoc_ctl.num_bufs; i++) {
-		struct stk1160_urb *stk_urb = &dev->isoc_ctl.urb_ctl[i];
-
-		dma_sync_sgtable_for_device(stk1160_get_dmadev(dev), stk_urb->sgt,
-					    DMA_FROM_DEVICE);
 		rc = usb_submit_urb(dev->isoc_ctl.urb_ctl[i].urb, GFP_KERNEL);
 		if (rc) {
 			stk1160_err("cannot submit urb[%d] (%d)\n", i, rc);
diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
index 9cbd957ecc90..416cb74377eb 100644
--- a/drivers/media/usb/stk1160/stk1160-video.c
+++ b/drivers/media/usb/stk1160/stk1160-video.c
@@ -298,9 +298,7 @@ static void stk1160_process_isoc(struct stk1160 *dev, struct urb *urb)
 static void stk1160_isoc_irq(struct urb *urb)
 {
 	int i, rc;
-	struct stk1160_urb *stk_urb = urb->context;
-	struct stk1160 *dev = stk_urb->dev;
-	struct device *dma_dev = stk1160_get_dmadev(dev);
+	struct stk1160 *dev = urb->context;
 
 	switch (urb->status) {
 	case 0:
@@ -315,10 +313,6 @@ static void stk1160_isoc_irq(struct urb *urb)
 		return;
 	}
 
-	invalidate_kernel_vmap_range(stk_urb->transfer_buffer,
-				     urb->transfer_buffer_length);
-	dma_sync_sgtable_for_cpu(dma_dev, stk_urb->sgt, DMA_FROM_DEVICE);
-
 	stk1160_process_isoc(dev, urb);
 
 	/* Reset urb buffers */
@@ -327,7 +321,6 @@ static void stk1160_isoc_irq(struct urb *urb)
 		urb->iso_frame_desc[i].actual_length = 0;
 	}
 
-	dma_sync_sgtable_for_device(dma_dev, stk_urb->sgt, DMA_FROM_DEVICE);
 	rc = usb_submit_urb(urb, GFP_ATOMIC);
 	if (rc)
 		stk1160_err("urb re-submit failed (%d)\n", rc);
@@ -365,11 +358,9 @@ void stk1160_cancel_isoc(struct stk1160 *dev)
 
 static void stk_free_urb(struct stk1160 *dev, struct stk1160_urb *stk_urb)
 {
-	struct device *dma_dev = stk1160_get_dmadev(dev);
-
-	dma_vunmap_noncontiguous(dma_dev, stk_urb->transfer_buffer);
-	dma_free_noncontiguous(dma_dev, stk_urb->urb->transfer_buffer_length,
-			       stk_urb->sgt, DMA_FROM_DEVICE);
+	usb_free_noncoherent(dev->udev, stk_urb->urb->transfer_buffer_length,
+			     stk_urb->transfer_buffer, DMA_FROM_DEVICE,
+			     stk_urb->sgt);
 	usb_free_urb(stk_urb->urb);
 
 	stk_urb->transfer_buffer = NULL;
@@ -410,32 +401,19 @@ void stk1160_uninit_isoc(struct stk1160 *dev)
 static int stk1160_fill_urb(struct stk1160 *dev, struct stk1160_urb *stk_urb,
 			    int sb_size, int max_packets)
 {
-	struct device *dma_dev = stk1160_get_dmadev(dev);
-
 	stk_urb->urb = usb_alloc_urb(max_packets, GFP_KERNEL);
 	if (!stk_urb->urb)
 		return -ENOMEM;
-	stk_urb->sgt = dma_alloc_noncontiguous(dma_dev, sb_size,
-					       DMA_FROM_DEVICE, GFP_KERNEL, 0);
-
-	/*
-	 * If the buffer allocation failed, we exit but return 0 since
-	 * we allow the driver working with less buffers
-	 */
-	if (!stk_urb->sgt)
-		goto free_urb;
 
-	stk_urb->transfer_buffer = dma_vmap_noncontiguous(dma_dev, sb_size,
-							  stk_urb->sgt);
+	stk_urb->transfer_buffer = usb_alloc_noncoherent(dev->udev, sb_size,
+							 GFP_KERNEL, &stk_urb->dma,
+							 DMA_FROM_DEVICE, &stk_urb->sgt);
 	if (!stk_urb->transfer_buffer)
-		goto free_sgt;
+		goto free_urb;
 
-	stk_urb->dma = stk_urb->sgt->sgl->dma_address;
 	stk_urb->dev = dev;
 	return 0;
-free_sgt:
-	dma_free_noncontiguous(dma_dev, sb_size, stk_urb->sgt, DMA_FROM_DEVICE);
-	stk_urb->sgt = NULL;
+
 free_urb:
 	usb_free_urb(stk_urb->urb);
 	stk_urb->urb = NULL;
@@ -494,12 +472,13 @@ int stk1160_alloc_isoc(struct stk1160 *dev)
 		urb->transfer_buffer = dev->isoc_ctl.urb_ctl[i].transfer_buffer;
 		urb->transfer_buffer_length = sb_size;
 		urb->complete = stk1160_isoc_irq;
-		urb->context = &dev->isoc_ctl.urb_ctl[i];
+		urb->context = dev;
 		urb->interval = 1;
 		urb->start_frame = 0;
 		urb->number_of_packets = max_packets;
 		urb->transfer_flags = URB_ISO_ASAP | URB_NO_TRANSFER_DMA_MAP;
 		urb->transfer_dma = dev->isoc_ctl.urb_ctl[i].dma;
+		urb->sgt = dev->isoc_ctl.urb_ctl[i].sgt;
 
 		k = 0;
 		for (j = 0; j < max_packets; j++) {
diff --git a/drivers/media/usb/stk1160/stk1160.h b/drivers/media/usb/stk1160/stk1160.h
index 7b498d14ed7a..4cbcb0a03bab 100644
--- a/drivers/media/usb/stk1160/stk1160.h
+++ b/drivers/media/usb/stk1160/stk1160.h
@@ -16,8 +16,6 @@
 #include <media/videobuf2-v4l2.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ctrls.h>
-#include <linux/usb.h>
-#include <linux/usb/hcd.h>
 
 #define STK1160_VERSION		"0.9.5"
 #define STK1160_VERSION_NUM	0x000905
@@ -195,8 +193,3 @@ void stk1160_select_input(struct stk1160 *dev);
 
 /* Provided by stk1160-ac97.c */
 void stk1160_ac97_setup(struct stk1160 *dev);
-
-static inline struct device *stk1160_get_dmadev(struct stk1160 *dev)
-{
-	return bus_to_hcd(dev->udev->bus)->self.sysdev;
-}
-- 
2.34.1


