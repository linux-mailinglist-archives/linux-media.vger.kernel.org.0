Return-Path: <linux-media+bounces-36822-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D873AF8F3F
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 11:55:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33A4F4A2926
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 09:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0940A2EF9B9;
	Fri,  4 Jul 2025 09:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lFwrgw4x"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010015.outbound.protection.outlook.com [52.101.69.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CF82EE61F;
	Fri,  4 Jul 2025 09:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751622925; cv=fail; b=dZpHp2SDgVKxj316zOkTGpcIZBV2jos/zWC8MUM7Otyse6ofmeIIyg5S7l2N4D90t+dg4asfK1/MnsbD1S1maqOwQ0i0+K2AWYIXbMOeb8B6mZRwhAGelnVebD2iItwpcuX3Q5XsrlH+3Uq2u1sA4hpStJZ/WiwbUAMdb7tNo7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751622925; c=relaxed/simple;
	bh=mr2aTDMCFKcMG+iRWL95UySDpx33eFW+nID+zrQ8zAo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eAmMrPHvndlbraVlAFj1wVeRnyYLu1S0xWq7gevlN97lmA4dnLHuh8hNw0b8FeTe2+UvfMm5i/uRL3qP4sgWkFHgkowvi+smIPRw8NqxV0rd3zxHirxHH0hOKkj3oj0AhbvZ8sQrUAAW24fada9xITcE6bqVBwJCcYeJj9Fkw8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lFwrgw4x; arc=fail smtp.client-ip=52.101.69.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QYrPXk6aLCfXBMpE8e80ns15TWWrw/dqoBJwS+M3+Uu13C23WySSkjUk8QMlV6yg6KXtEItGp19BgXCL5Xspb38GJrdZESQ271/1xUkIv3asl9oWqxeg0d/Xon5ET6HeqfGWWm/efL/E4QR9rYssZJPrS9soLNiKGecFyMs/edPOGH9rPLnMYuJBW8dYiwUU5eSSBy0dF7ct6cV/5xCh3ffXXg+0YxOyBKaLMVQpJ+9hKUXkrvOOlgqjiNJt+2P9KNKT+jM+v5B2Lk08nFPqOolV0Df+aO1QDB+/Rtm0j9iJxbZKSf/BNv3vdyDH3e5jdDqc/dmRlh3Sz6/5+deTAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KfOGAiq5ABsb74WbSLYr5fvjtfvJu0RZD8u+eWBtPnE=;
 b=Btdt+b4Qipjazp8Hcrg/rfEmNmAmNCTlY1HBxLka02MKzD1RraB2I45yuZz+qhXTaKd8tRJ69ujUgb14fZ7ljUUe866ehVDuU87BMAFENfxki+tHJAgP8FZqvK0xckUTwjlsaOa3z+xVwZT5mXdV1YKLXD5AU32mirF8kSCEGEA9k1rgxkgSUpCuuJqxy0Py+Hs8WLW8oRbZoTOse6PCLp3vJzZbdbAc1nPpRPOMb0IepSpgzbFQdfnA5VC2Sg59VNk9FumDImxmCzXyda2gzuN1udCFUCvLFrI3YbuNhHUFtYXgEG5rZIzb326ka+wEKhcb3DniM1HwpNfsgTCy8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KfOGAiq5ABsb74WbSLYr5fvjtfvJu0RZD8u+eWBtPnE=;
 b=lFwrgw4xMZSvA29VIuVdUFIX5brhvgxgPPvC7OrT3QXBWYHsk2iPNGNL43MVs3Mv/J5y5HJxY0BBoCHSG+TN4FCFxjzATWzEGU1EJHdmKZ2yShCc7XnOVXz/0Svos7He2lhWWgeg8bdrUfn2CQvQPTsJXgyO2H9MaEiW1OnM/F4KvuDDRJpXwxznDH7HNiywc8EMZkbGYXn1MY1uRP3vR3YjjF6ioKyg/l3Z7V4EVD9deAJb0dRc/Hobxf+BURK1O6bkgvdytEKu9RGblZjorSMOOXodAJQL2O373pE4g9aSrIafaePmYLDT9y8JZ4BB1afXoyoeqolrOHnobAMrQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DBBPR04MB7834.eurprd04.prod.outlook.com (2603:10a6:10:1ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Fri, 4 Jul
 2025 09:55:21 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 09:55:21 +0000
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
Subject: [PATCH v5 1/3] usb: core: add dma-noncoherent buffer alloc and free API
Date: Fri,  4 Jul 2025 17:57:49 +0800
Message-Id: <20250704095751.73765-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704095751.73765-1-xu.yang_2@nxp.com>
References: <20250704095751.73765-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0064.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::6) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DBBPR04MB7834:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ed8de2d-57ba-4eb4-1280-08ddbae0e3d0
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|19092799006|1800799024|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?7XKk0V4QqWELuuf/4otf1uuysI3skBIyCBjon81v3+wslg+QZJLxP0oYpnCe?=
 =?us-ascii?Q?KkTvT0vm0LdH7YIA9fncyo9/E9FmTYB1h2D6qp4JUh+e4rAOxv5Ioe5zEuV0?=
 =?us-ascii?Q?Z6lr00HunwZGVlh+iHhxbHFm/Fa1RltYwuZKxbqhRRWtQy/N3isibdzllFJj?=
 =?us-ascii?Q?qlqtTja8G0Tpk3MlKSEBJtxVu3cBViLpL3VPraGFi6RfTnvri17wfPDakEq9?=
 =?us-ascii?Q?ciye4y62lQsM75rVzFQ7yX6lTpp66eBuMIJMdd5YTbMy3lh3Xda5Uphur2xZ?=
 =?us-ascii?Q?Cwe0XynOTFkhUe1ug32IlT0HBhEFazzfAYsFD0SM8kx/synSPTRY6WFlRKYt?=
 =?us-ascii?Q?5DKN+3jNsUUH7PlyxcM1qKjTGpKLHHuWzf/qkfPs64eYG58m0ki989wGOdUo?=
 =?us-ascii?Q?zS2kr5gi1RaUoIQVbCSF1YzoVhgHxvMZtfERAKr18rG9xZxL+4OG2vjHeGlf?=
 =?us-ascii?Q?yTtBomZJCJPEV4bST+9rV0y+xuyQDp7AAkB2gwvvd+e80GQWF8FSAxQRWu+i?=
 =?us-ascii?Q?NQUPJRy3HVxiWldS0Xu8v94yXBEYqNWfeae586VFrJn6lgTdOvsc6Hrg5u/B?=
 =?us-ascii?Q?kWHxC4Rj/fSQQq7cclrtxXUS0QN/myt/ZDxPgaHxIeHLOIKwt6XTxHHJSSRK?=
 =?us-ascii?Q?NE2iOi2nGYkIybRCMS4KlyHp4YUId4f4y+Fd0CNfjcv85XmBo1Dwx9GMoPyd?=
 =?us-ascii?Q?kvcNxy3utCFR+cUj9vSPjBIdvMhWN8H76p1+aJldJBtqjMEzr+sN2rvAEWNL?=
 =?us-ascii?Q?DCXJJ/8c80fS6G36HJYsH/WeU+VcgsiIJJ9sL+pkDm9S/9MVQ3510almqSrZ?=
 =?us-ascii?Q?eH44WqsebJvL8VCEL7G8JG8xnaJQ9qjdCBwJLHU8XsD7MTFkzoqFtAFRHhLB?=
 =?us-ascii?Q?zSlDXMLxmHKEg8hpwYOj/X27f4ohA8z2yZ+ROUdfR8402/hKaK+d9JVJpbvV?=
 =?us-ascii?Q?POIb12nZ/3VNssQdFz6QKlLnvXYT0bH/HOrX41t2v3g7kSWnniIGpKBV+GDu?=
 =?us-ascii?Q?358A7Q6yE0KGhI7MJ9DCoTS17YPQvq++fidxPzQs3j7owGeioXJ1DbFgrDuE?=
 =?us-ascii?Q?OBGzpxbQ2U4sEtU8TvmyVeWwSR0o5fXydNQ1rpHc654YuBYm/io7YGfIMQEy?=
 =?us-ascii?Q?Ds15oF7TZ8Vg/q84cmQePQe3bhGroclqTBCVhJhOTt2+rK6miUL3mvhasK5c?=
 =?us-ascii?Q?QGOeSo8//3xj4GoCDDI5alLXobUKe/cQHrvn1kgzo0ev/wPOAnuhbsBfGq3M?=
 =?us-ascii?Q?yCtRULdpfILNSG0C03YN30t123ZyBZ7Dj3zA2wGG3JUOy0YNxTglCtlA09OR?=
 =?us-ascii?Q?e1FwR1cqjSOFMCst+VI2AJU1FVA7k2JDWrHR6OLpCWBPuWLb5ba+bNZzemnI?=
 =?us-ascii?Q?WA/6MuRBH8gM0Lp6OFLLHNV5Nid9dTJGuA1asy/MIBSTNilH0Df9EhwT2VDw?=
 =?us-ascii?Q?JfIiaqaBAOelIeGj0qysrtUyi1d/3zg9D5P6BuRUTv+5M6bEDam14WjVoCUe?=
 =?us-ascii?Q?Ac1rsa+msj81qaE=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?VAY/LswPTANhr4KLm6wlOxcwmClK0CHtCcbERhvZl36VbSi6bDgkO5K0/lhv?=
 =?us-ascii?Q?Ga5eSkqxt5BxH9BUKWNI6sVKXrjlDY2hCq102nolhI8wwm9D52Ne5AY8LHkd?=
 =?us-ascii?Q?4u0wmoaHlVVwQwX6xkFAIz3+fuZpcycXsp6LpEAypq9L6CzB8MqZVJzkxN3P?=
 =?us-ascii?Q?uzQhwgdbli2g3ohSLAp2Ahr/Rog1QbZvISu6VhddqadWtLZALEe44zjAMqQ+?=
 =?us-ascii?Q?41rFPJZZOvJMJ/i2NsN1BnsVYxfc1vR04IZTxiR7cEVjS1PQQxcW9/tM5ZNV?=
 =?us-ascii?Q?o/ybpxvQaHbewzuQc3YmVu/KT25JIwJQb4Cig87Le66GIJJcBrY7SkPCExou?=
 =?us-ascii?Q?4adMD6lDYPMpuht/dYybnIKqKfw5lz5PrzR11QVhwgu1qgVJ7bB0c4MBYudN?=
 =?us-ascii?Q?QLSNoTff1WJ5oX7WRqTdX1Pn0RYo3YsqV1ggRfUOi/mLpr/HvNVABykSYxDX?=
 =?us-ascii?Q?nPdv9guWm5VIBB/7LyY3+C4LzZpI9SugC3D4NjQpWw1rWx88/eVVacylKKoa?=
 =?us-ascii?Q?QwhBbGpehvYpfnY2bpgn/9J8QY2wxcgiP64E/T19VH89YgM8raP3me4zgOal?=
 =?us-ascii?Q?GoBOPFFK1dwp5si1kf1Tc2FIcTaZa+NwZyF6Mw3GLov8Q87IQuceuRaxqEPy?=
 =?us-ascii?Q?yBoSOi/TyqzHtswFwPbQ/sIYwvQ2tfshQvuJ8JHy9xbDJY1rI+kmOQuGC3Mg?=
 =?us-ascii?Q?7Hh5rRgv5FdiEDtOkdzetVk2iDG0YG/cKa6csxZgPejM4uuVoKipZ8H1TosC?=
 =?us-ascii?Q?6dKIm51rWdLufXjZcI8UDHkHG7C9/IEsUGYk4ThF/fzj4JBBY0Qb7AFM7CjA?=
 =?us-ascii?Q?yi0qvSO5ubsHHzB1yrYYlD/UIxu2eOR9BsIb+WCzM6Kl1pT+R5RyzLGU8GrE?=
 =?us-ascii?Q?B5q9WyXI/FuwEjWpVagcfKhI0MXZBoM58UCkZ58AXsZsa77j1ljylzJcfT/k?=
 =?us-ascii?Q?oueXGOQiPr0ogc88oVnWxU3WZAY+PPrAf8H+rpVO2IpLx3psl7o7wCWKYnFy?=
 =?us-ascii?Q?K8ThfA0EI71o6Wa4gB7BX5+IXLDupJGTOMWDY6Q6BegBcFOS/Xl4AQdIlkvt?=
 =?us-ascii?Q?SA3MdO/SyAVP03f/Uz1E5M7iA9UooetJSi+4Y3fvm/LLYQWRZ3Mf6bU0zWpK?=
 =?us-ascii?Q?L6ESFAszUb/uYQXvW9P/071+nUWc6JsHn5F+LK+8h0dxg7nvARyw2Eno3aEX?=
 =?us-ascii?Q?LXD7jmJtoi2y2DBnUpWTgUHdJvddAoOfSuS3vZIcXWmuyeboT0Jg1e/citKe?=
 =?us-ascii?Q?i0HQkATD2TrnPL2Ow1vTJ0XE6wCbLDJERFL2oh3VnqfsmJ6t4kQToQaN9Bl4?=
 =?us-ascii?Q?IwBTssGmI6N7w3eGwv5d4keCRT7CUaRPjY0VmH1CuBz6yGEP3LFS9NIYBNy8?=
 =?us-ascii?Q?iYwm4Xy+9nmkDgP96ANTeWbWFsJxZXB64CZjc4FiuEvaBp422coq7eU+Hwtw?=
 =?us-ascii?Q?MRJ98dkwOvUWjjY4r8jgHFm7vOjbVkAczec2XK0ncq4h/l4/tgK++0yWg6cl?=
 =?us-ascii?Q?RnhqajRUnAKmCKHzGBu45w50u0WJ+RjQUTNl5NWSx+wDsPwYZRnx0JYtecpB?=
 =?us-ascii?Q?Ovb9cnlgvD2q4Lp4oljnEFEDLmNeQTpB5nVPm/0a?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ed8de2d-57ba-4eb4-1280-08ddbae0e3d0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:55:21.5946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jTTor6Ti3DRVPTotV94YUF6zZqhkh8gtFJhiE19IGakwCG0sm42e1DObliyJNefH9vIaOdVuMTpDJ0uLbVIeTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7834

This will add usb_alloc_noncoherent() and usb_free_noncoherent()
functions to support alloc and free buffer in a dma-noncoherent way.

To explicit manage the memory ownership for the kernel and device,
this will also add usb_dma_noncoherent_sync_for_cpu/device() functions
and call it at proper time.  The management requires the user save
sg_table returned by usb_alloc_noncoherent() to urb->sgt.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v5:
 - improve if-else logic again

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
 drivers/usb/core/hcd.c | 29 ++++++++++-----
 drivers/usb/core/usb.c | 80 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/usb.h    | 11 ++++++
 3 files changed, 112 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index c22de97432a0..03771bbc6c01 100644
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
@@ -1425,8 +1431,15 @@ int usb_hcd_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
 	}
 
 	dir = usb_urb_dir_in(urb) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
-	if (urb->transfer_buffer_length != 0
-	    && !(urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP)) {
+	if (urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP) {
+		if (!urb->sgt)
+			return 0;
+
+		if (dir == DMA_TO_DEVICE)
+			flush_kernel_vmap_range(urb->transfer_buffer,
+						urb->transfer_buffer_length);
+		dma_sync_sgtable_for_device(hcd->self.sysdev, urb->sgt, dir);
+	} else if (urb->transfer_buffer_length != 0) {
 		if (hcd->localmem_pool) {
 			ret = hcd_alloc_coherent(
 					urb->dev->bus, mem_flags,
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


