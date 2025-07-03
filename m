Return-Path: <linux-media+bounces-36649-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F202AF7085
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 12:37:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAA5F3BBDCE
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 10:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22E942E2F0B;
	Thu,  3 Jul 2025 10:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NkmcMyl/"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011027.outbound.protection.outlook.com [52.101.65.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5A7244675;
	Thu,  3 Jul 2025 10:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751538947; cv=fail; b=V4saVuyGwVHDHTRZi8qLzOyEyBMjPQ7ekga5KYHp/tLXSCx24sf6qd++8fzg9EUEtPr2+vUVVe8xXaFMOQh0OifYv8tStpWX5lgpJZeKE3Tft91SwWZ2GRaHeSh/OavLiMvaSvywD35tSbQQrFfAgcd9tUpqRzO6VXRhlATRT2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751538947; c=relaxed/simple;
	bh=3nE/zCAKmOalcbbXjRHX6DK6N8JwDPxCmvndHR4X648=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tWQi9AhawNGZs9HqRrPA8GbZyN5+8LFc7nEJEkISEnqtnGjzNJx5PnWAJOd507bjS9Y9Jft0L1f8/+iAwaJsxzIwQghbkgMCYTHzYiz6ZbFEo1XmutWekQv0JUOaHOZSrHQVtjNk2SEg/DjbV0nArVLbXcgGLHvBEJNuy9y5eeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NkmcMyl/; arc=fail smtp.client-ip=52.101.65.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a8psQ0C1N1zI4a7qSEskMqZu16Vny74SxxH3sDokA1HcAV99CnoqbOhZg+KhfA1SmSto9dS2Yz5T61VGJOk5QR/jejgHGj8YFh7rAjI6ug+mo9K/MkRLDu/mDYlfpQ6AMvAhq9NiflwcGgCcL7UOLNSvJWy+fMtGjgZ5Jfxet0obIFRu1DYTZwR/I5jnB6/sAmHLEKVl4n/b6qI/nboCIgTSMgu1Uia05CnANgiFnQkTkNL5tIDvqUFhijM/OnSGTurVynMczQ+5Rrzpir7BaxYnqwPgtELnEeVZuAwUSQtS9EzC6aB7lXfKYS9hDlSZxMpXj2lukBBrAa1vB80X0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g2HAYuVl7aFZMyJ1eE+eaT8o7A5QEBCSTZOr1EoZ6f4=;
 b=JFw0zn6NnzfloyzzTqKMuC38dvcDB4MWg7CcAIem/VFI0T2hGN2hPwDRlKnQd3yHQF7QcrjnoDSusHTaqA39LYZCAaDf1JMZeMKUaWZ5HzbAEmQLrG13Lr9WqnvEQh7K2vjgwDnMzJXUM1+/6s04j1Ub0YyJGkaZicqnFVdmZ6VvBwA6tdPCDP/UvephFfP4Zb2Rgbullko+Zqjflh1N7Ga+LIrU+J5O6NBV7FMmQs5ly2K8IRIuWGZIMiiaSlf4ZZ53BnVJ20RBTX9ZIUpK1lzDNIHzz8PVeUmHnSVTU8imNMcyQYL9uVCIgFMwUrSyu8d2+lK7JR8ojh/2sarBsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2HAYuVl7aFZMyJ1eE+eaT8o7A5QEBCSTZOr1EoZ6f4=;
 b=NkmcMyl/rQx4hkFWP4hfz3fuMzGPI9TJqazhhUTnoogt9mZfdorMuixFqIxdJBnd+pyqTAAL3lCZaXVheQjJZbc4NtG4QCTu7AIiD0RrbJWBuXYpMVpBhTBO2IB+DiLSBXJdj4F+1Puy97rEH13PjnT1xdk24zjByJlh7inoJ7FO+Uwpi5H6l6xEjQ/ofNbcNkf83qJ6NXyHkWfOYWPQW7VcOzvQRbzWQ9WxKNEV+U96doeGnMQGWla28bDr1SQGTHz3nugLI89PBcT9f2r3Zw/MVOw/18pEIGkSC5ldPgabMHkFHFskgUWkmPk3oumbug6z2lMmXLYWaOilKUBSwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB10928.eurprd04.prod.outlook.com (2603:10a6:800:261::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 10:35:43 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 10:35:43 +0000
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
Subject: [PATCH v4 1/3] usb: core: add dma-noncoherent buffer alloc and free API
Date: Thu,  3 Jul 2025 18:38:09 +0800
Message-Id: <20250703103811.4048542-2-xu.yang_2@nxp.com>
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
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI0PR04MB10928:EE_
X-MS-Office365-Filtering-Correlation-Id: ad9b8112-a3e3-44aa-d68f-08ddba1d5cc3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|376014|52116014|7416014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?JqV1leL3ObDTuH9Ky01Jy0eucgdzGzfCegTOdHUgKfibSZkPACD1DlovC3dH?=
 =?us-ascii?Q?avAZpiWTaR8paY56Wqm2hBKekqSJeDjNNC4fUX1T4i88Q0XAvLNM0iDAk+uC?=
 =?us-ascii?Q?weaoJIl1OZBpzSxk3QGVh+roxTy9QDFiTIVsdJMHIQTGYs7+Q3mz/KlMd9FW?=
 =?us-ascii?Q?a8NxUOKF1scNn4Sm8MPej5XqaL3RSdrP0ffBS/9loOfDeRjnyPTOc7yBw6T1?=
 =?us-ascii?Q?MNOeNCXrJjwHJ6LGv036QXNZ3X1GiQyRZO5jrnvYe7WmD5ZMjoW+AlQBuKpL?=
 =?us-ascii?Q?DXyuc8fv/wJwoGSpuiElv+5w5G+l3AcS1jfVlElRPHPzYqxtElN2LD3KJVNW?=
 =?us-ascii?Q?ckGcRSfFxq8l0kxXHOWUty80PDazvoPfMtBlepGYLxMwDZUg+A+dPeeMhWHk?=
 =?us-ascii?Q?UCJormI5bI7Mk774nqwAGi6BGPE67EHreEZdKZQOxVo8B3Lqlx3ZcxJTTP51?=
 =?us-ascii?Q?xy9PnNFnuEtUowCTMLlJhVYOsE4gZjC1SHBLoaAqKhCFMJ8Pqqm/rRWFn4Y1?=
 =?us-ascii?Q?hBvobCsnwy+ZiFqrigYR+cKl633/ZkV8Mombqt946AYq1AWtlpmzz5XTYwic?=
 =?us-ascii?Q?JhjpRXlRjD9Gkf0MYwugJ6ads+U2vHU9QD+Odn/tpPFEGY4KHXQmj3SV19kv?=
 =?us-ascii?Q?Ri/y2E+IkiSkH+GKG9gSE9PX/E0NDIFdNL1tvGspkVsmstYdOqrs5fmByp4C?=
 =?us-ascii?Q?57izniZYB8sOdyTPoxcRNhn8Ge84kPb/MMMFd/DkxkceGhiX2/JC3OHF+QMQ?=
 =?us-ascii?Q?Oe6WoJTALpfVeX5tcc8V6QQR/P8A5ZS1UNjClorFTeDrb3PAHxhThGWx5BBr?=
 =?us-ascii?Q?o79BIt2BqWN5izEK9ko7U4TstM0sV3KAyNnUD+cVLG0K0CYfALUOpSQRseLn?=
 =?us-ascii?Q?8nR1hpBGghT4ll465eg5O5ZbEKOYj4wNvk0Znqo2h2de1hEohZRFjr1ZHihf?=
 =?us-ascii?Q?evcMJzU10qdwVUKI7odXTKibJLbws2J9gKBAy9tRVU1UStVS59xPC2IxPbch?=
 =?us-ascii?Q?CVULFklbekrYLtR5IlRRubtbeQ2SR6F25AOe0et3xDweMHgtLmCvnVT8gI1R?=
 =?us-ascii?Q?RoKDjmbDLZrwc9QcsQkiNzXxoouZnJLF6QDHec0/FQUj2DH9KjJ5o69Rh9kb?=
 =?us-ascii?Q?B+EFXSutbFvioYXJcbN1cNks40il5L4zo1R2E+Fpta5Ywi39tmNJGjw1DtlY?=
 =?us-ascii?Q?HI2sqkFr32y4/ibL2q2zO5ygIj30vb8EITqC3+5sZY3eydG12BH7jVKVSdC/?=
 =?us-ascii?Q?LGuOyj+c7tpF+ztoZcGZQx1K85Un1b2QQjMRvITc8Dxm3eJj9rjZ1QwZuM1D?=
 =?us-ascii?Q?e40MLcES25POI/O4Z7Sd74PfpJm9gI8wURspPTPcA9TmgNmzgm+I0SveQDTv?=
 =?us-ascii?Q?SYCU1XzpVgfouA6SOcEiMExxv+XARf/W8oWldakIbhDdoC8z/jMgl0l6zc6G?=
 =?us-ascii?Q?eHjc5EqmKLRNolJGgrhLY+BUrzNCu9v5cCb3z1NNvBaTZmkG+vjZecVEdUy1?=
 =?us-ascii?Q?5fQeJOUSKMzMV9U=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(52116014)(7416014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?CxAi9MmodOcGRIvJa3OD3tyV5zAvd+aXNEI2pZcLUJTrTqA7o77vEmW7r5AF?=
 =?us-ascii?Q?XJ0DciM0mQaohHzD3VmpjPGr1JRAdEV1nmnoLbyAG+AJsTK916uvSwyDW1DQ?=
 =?us-ascii?Q?hnd21+6hBKWSjmuXGVhUPaOB0T/FlPIcYcnuR3kP1OHJvIeySM0lXiWRXFzy?=
 =?us-ascii?Q?P3avRimhXPZ8DGrY1oLTWVJc/lLqHNyOB3z7yniQai3V1O+Fp9tClKLlv6lB?=
 =?us-ascii?Q?FhOz/Stgr6ZNbHZdxaIq9/gQbljyo7hL7D9rh562vTqFhYfFQx9ZnheqSyEP?=
 =?us-ascii?Q?fNHORgLQVHrWW7aJqvM81R1vVMkX2cbY3nuXGe05S5sQ9ZkJ8pJ//rBMjmbM?=
 =?us-ascii?Q?Cjw0ZuHdIf/qDGijALcbFtwDlkP7ntS2EAnKc26ljs7Xz4tXTchQ3naHkxBS?=
 =?us-ascii?Q?ipvbpWPtEtQVfRPtjxe7hhuqp1EBa0v6XfbsKNQkfmmq91bw0V++WdBg9wLx?=
 =?us-ascii?Q?z4jGAdW4jyx2Do5ZssQfFBB6JEokCGT01euX/eKr2pl4K6usTxdE++jxo9fn?=
 =?us-ascii?Q?m31HRZa6I8IQo9ZnE+VmHX5vKsbnpoM3kUPiy17OXt0H4uvdTz6URHdAsAil?=
 =?us-ascii?Q?Edj3sGyb59dXmGKruSHNFXKorA0hIhQ4dAcy3+a5AhpdPRb8QEg7y60QmFLZ?=
 =?us-ascii?Q?Ub7tXEv47zWmroGnhR5Y7kjBgSsPKwkBVCKewFtIBikg9eGgpiGeIBpB6uug?=
 =?us-ascii?Q?mYvPZSjO2QMB6T1NYGOaotmy79XqJ9hcDjWAucFBsu3JRjZIzIHiUujpfMMV?=
 =?us-ascii?Q?7DRzP6qu2aAt2Hf7F1bI8Er4HlhbcB+yIEeueKdQh23zFDc8/kRCnuUIuCWS?=
 =?us-ascii?Q?YWAiYaEvJ7IUBtlAvjvRZygiHgxkqzszNc62+n8BqwhkYUz4NAj1POcGOCTp?=
 =?us-ascii?Q?peI4rgdnHoU/9GSr9BNum7kJSdztRK1QYm2D+00cfTMLBgC/C6fNKVKlHKfY?=
 =?us-ascii?Q?64et1IHeALLIvaMWOv6CZXWt6FfHAlDARgo4jsnqRfA4zUC2Q+nE3gPocyqh?=
 =?us-ascii?Q?KHw0caLVIQt5wk7n9+nmVEfEp0swZg1bUOKzdG5Zna/QJv5MiRSfMGG686Qx?=
 =?us-ascii?Q?G0eAq0eAVqss2RVEf+tgHottwYic+moDfrsfkW1Zlj+KRazrq3gTrBo0Lhej?=
 =?us-ascii?Q?XrgN/+/OoKy5F981nwzznMRjz93ORdxyt/JkTOEc4sj6hEXxYSb9eIz6HLYT?=
 =?us-ascii?Q?DSZ8OmR5pbLByquiT/CK5CqHOAAVAjE95QS1zYa20F4osHwOAs+MsRJ09oo8?=
 =?us-ascii?Q?cPVoOuWMpH00DRPenwX7o7xWk2SEhNxDzi1FxwY7C4JrHivFFggxeFMZVAi1?=
 =?us-ascii?Q?ZzecILQHMsPw+BQfhYfqc9vxMsvh03lhd0tEYAfyIpFI19fxCUChDjuFXBoT?=
 =?us-ascii?Q?8qTRqCCnrYRDO1oA9M1I7td8XNH9oQWknBlHdsK987V20Hfzx+RJft1zW4ZM?=
 =?us-ascii?Q?boo3aEdFH2/bgdSihoWwq2Xrt2tquQlMk41f29qcTSAJHjaqwMg055ubbMIy?=
 =?us-ascii?Q?oCkAaz5VHJFJtFokW9RNMvQUAYEzTcjN+Y1vzOMe+h5QCf9EgrDZAvU0vR4l?=
 =?us-ascii?Q?OI+9GZhMDA35fh0YlTOlICmzyzhlC+kBWiAwdi5T?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad9b8112-a3e3-44aa-d68f-08ddba1d5cc3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 10:35:43.2345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wefPhQnY3E0gfYvVet5Ss697UPoWt2SjHlnT0cysx5wTAKZ+8E34sLqfeQ18xvNiPbIzPVq4CKGRr2nc425Kxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10928

This will add usb_alloc_noncoherent() and usb_free_noncoherent()
functions to support alloc and free buffer in a dma-noncoherent way.

To explicit manage the memory ownership for the kernel and device,
this will also add usb_dma_noncoherent_sync_for_cpu/device() functions
and call it at proper time.  The management requires the user save
sg_table returned by usb_alloc_noncoherent() to urb->sgt.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v4:
 - improve if-else logic

Changes in v3:
 - put Return section at the end of description
 - correct some abbreviations
 - remove usb_dma_noncoherent_sync_for_cpu() and
   usb_dma_noncoherent_sync_for_device()
 - do DMA sync in usb_hcd_map_urb_for_dma() and
   usb_hcd_unmap_urb_for_dma()
 - call flush_kernel_vmap_range() for OUT transfers
   and invalidate_kernel_vmap_range() for IN transfers
---
 drivers/usb/core/hcd.c | 33 ++++++++++++-----
 drivers/usb/core/usb.c | 80 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/usb.h    | 11 ++++++
 3 files changed, 116 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index c22de97432a0..42d9d8db0968 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -1342,29 +1342,35 @@ void usb_hcd_unmap_urb_for_dma(struct usb_hcd *hcd, struct urb *urb)
 
 	dir = usb_urb_dir_in(urb) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
 	if (IS_ENABLED(CONFIG_HAS_DMA) &&
-	    (urb->transfer_flags & URB_DMA_MAP_SG))
+	    (urb->transfer_flags & URB_DMA_MAP_SG)) {
 		dma_unmap_sg(hcd->self.sysdev,
 				urb->sg,
 				urb->num_sgs,
 				dir);
-	else if (IS_ENABLED(CONFIG_HAS_DMA) &&
-		 (urb->transfer_flags & URB_DMA_MAP_PAGE))
+	} else if (IS_ENABLED(CONFIG_HAS_DMA) &&
+		 (urb->transfer_flags & URB_DMA_MAP_PAGE)) {
 		dma_unmap_page(hcd->self.sysdev,
 				urb->transfer_dma,
 				urb->transfer_buffer_length,
 				dir);
-	else if (IS_ENABLED(CONFIG_HAS_DMA) &&
-		 (urb->transfer_flags & URB_DMA_MAP_SINGLE))
+	} else if (IS_ENABLED(CONFIG_HAS_DMA) &&
+		 (urb->transfer_flags & URB_DMA_MAP_SINGLE)) {
 		dma_unmap_single(hcd->self.sysdev,
 				urb->transfer_dma,
 				urb->transfer_buffer_length,
 				dir);
-	else if (urb->transfer_flags & URB_MAP_LOCAL)
+	} else if (urb->transfer_flags & URB_MAP_LOCAL) {
 		hcd_free_coherent(urb->dev->bus,
 				&urb->transfer_dma,
 				&urb->transfer_buffer,
 				urb->transfer_buffer_length,
 				dir);
+	} else if ((urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP) && urb->sgt) {
+		dma_sync_sgtable_for_cpu(hcd->self.sysdev, urb->sgt, dir);
+		if (dir == DMA_FROM_DEVICE)
+			invalidate_kernel_vmap_range(urb->transfer_buffer,
+						     urb->transfer_buffer_length);
+	}
 
 	/* Make it safe to call this routine more than once */
 	urb->transfer_flags &= ~(URB_DMA_MAP_SG | URB_DMA_MAP_PAGE |
@@ -1425,8 +1431,10 @@ int usb_hcd_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
 	}
 
 	dir = usb_urb_dir_in(urb) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
-	if (urb->transfer_buffer_length != 0
-	    && !(urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP)) {
+	if (!(urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP)) {
+		if (!urb->transfer_buffer_length)
+			return ret;
+
 		if (hcd->localmem_pool) {
 			ret = hcd_alloc_coherent(
 					urb->dev->bus, mem_flags,
@@ -1491,7 +1499,16 @@ int usb_hcd_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
 		if (ret && (urb->transfer_flags & (URB_SETUP_MAP_SINGLE |
 				URB_SETUP_MAP_LOCAL)))
 			usb_hcd_unmap_urb_for_dma(hcd, urb);
+	} else {
+		if (!urb->sgt)
+			return ret;
+
+		if (dir == DMA_TO_DEVICE)
+			flush_kernel_vmap_range(urb->transfer_buffer,
+						urb->transfer_buffer_length);
+		dma_sync_sgtable_for_device(hcd->self.sysdev, urb->sgt, dir);
 	}
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(usb_hcd_map_urb_for_dma);
diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
index 118fa4c93a79..fca7735fc660 100644
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
+ * @dir: DMA transfer direction
+ * @table: used to return sg_table of allocated memory
+ *
+ * To explicit manage the memory ownership for the kernel vs the device by
+ * USB core, the user needs save sg_table to urb->sgt. Then USB core will
+ * do DMA sync for CPU and device properly.
+ *
+ * When the buffer is no longer used, free it with usb_free_noncoherent().
+ *
+ * Return: Either null (indicating no buffer could be allocated), or the
+ * cpu-space pointer to a buffer that may be used to perform DMA to the
+ * specified device.  Such cpu-space buffers are returned along with the DMA
+ * address (through the pointer provided).
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
+ * @dir: DMA transfer direction
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
index e8662843e68c..9ade441ab4c8 100644
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
@@ -1824,6 +1825,16 @@ void *usb_alloc_coherent(struct usb_device *dev, size_t size,
 void usb_free_coherent(struct usb_device *dev, size_t size,
 	void *addr, dma_addr_t dma);
 
+enum dma_data_direction;
+
+void *usb_alloc_noncoherent(struct usb_device *dev, size_t size,
+			    gfp_t mem_flags, dma_addr_t *dma,
+			    enum dma_data_direction dir,
+			    struct sg_table **table);
+void usb_free_noncoherent(struct usb_device *dev, size_t size,
+			  void *addr, enum dma_data_direction dir,
+			  struct sg_table *table);
+
 /*-------------------------------------------------------------------*
  *                         SYNCHRONOUS CALL SUPPORT                  *
  *-------------------------------------------------------------------*/
-- 
2.34.1


