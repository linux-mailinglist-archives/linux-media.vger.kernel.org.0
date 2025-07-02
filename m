Return-Path: <linux-media+bounces-36529-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D61AF12E9
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 13:00:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E851418917AF
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 11:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC5F8264606;
	Wed,  2 Jul 2025 10:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Scr0g2AC"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011052.outbound.protection.outlook.com [52.101.70.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC776246781;
	Wed,  2 Jul 2025 10:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751453997; cv=fail; b=ZLEmV8yK3j/WZ9ex+pocwVYvyXjXf1z9rVOYYkkkQt5Ocm3PWWobcBcBSsD9Co2+1/mV6Zj+7Lk1ALrPpPLfC5X1IF+f4im4wKl9VuLBlFDQmKFl6kvL3IIMuvS7cJEh5/CA+DdOQLUw74ptIPtn1i10OnH625RlYyrZrj1QtXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751453997; c=relaxed/simple;
	bh=5hNZ2gRtiBK80k6IkJd33BgRbGSLsrAUl/6BrgUuD/A=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=T2ByYxzTRMahJxmw+qF3kr57Wk6gOATXGr7QV+3QVI2PtPpKidDrByn96I3hnWgAIamC1/YbPzXHqusXP+YaSV0RnftlqjE1qz4vHyGxFD4yl7ZpC9062m27Rahxgplx2uS47CAOsLN+bYYYh6WJVzbhvagZdbvTLWkOMJ+5Z6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Scr0g2AC; arc=fail smtp.client-ip=52.101.70.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dz28O3B+wh0ye/FveQLr0c49NN37iuWsUZMPdNI/qaOJpMsDgTolwyeWoXx+SgRf7JD+Tx4/ZMVz11/VIrfPjcpvDAn4rfsj4sHT5UsXPf3kkHBpYb5MpLPRIKqwGt2y6yovLF+BvwKiNKvxUSbYPL9l2oHY23iJQW/F4hrrVTacgVp9NPwgeERfyG5pcNlHTO0NQNJGhZF+MD6kDHd5RNLB+p6WfKWvS6b1hWgLS5LkKfr5lpYWydGIj/w1mEFTCwRdo4heTnf0cE+12G5IZ0cnlOLqyczv9+ViIqImJEaHeRMTXH2i8o5/KMsfxTT4LridaHkYz/aPV0eJpvKTrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PioYGM7XvuEOwSKgGyM49uZtGkyKPKmJwsrFHTWH3Ic=;
 b=f4I43zDfmE0emHn4/pRksuQzf3WJqGj6nPxYiq3baYaJrdzH75dL8yTdjRw73YpBx085t6ZH/vqLDrqxSLXLG/n6T7iqcna6RfQwfKHguFb50/2o3JgMdDSsGq4PKnAQP0K7XaiECWEcRJLRG+QLsQmblFCY2eg2jpIsMI7slbWMt60MUmC88WrQIX1L9looM5ulqUN6ny+lMCXgQHICaJE9yoJZT9uGpeZawfhEU1oEUsiWWW7yQFoDDCpqKrAh6hO+l4HxKnm2rEDHqQk5Oig/XjpMo8Zn9vcTqZcnSoANc2UnTyTlJTQB9nmBmG/439HXcImK6EZCRHDftkJ8Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PioYGM7XvuEOwSKgGyM49uZtGkyKPKmJwsrFHTWH3Ic=;
 b=Scr0g2ACOHICW2M/EsjUU2nkxYo3Rd2jFB1mZB+ZIHJKOONFJv9kVtcBmLcl8YDu5acDzOsAXyTbfOaPN9CD2L2PrvbCMTzxqiH/voD9cNgVyQu38LMd2uX6SUXPdto/MDweoxpuXA/VzGRVM/z9bPjh4/RKBTWSqF012nGS2GRWDkveOv589jsvLL91CluDaHiSvUUw9QKvPUfy45gZ257xZNFln5bsmQPYJbbwZe70Q6FW4k52f/z004BjFulGY/FT9esyDCFolf/+B24FIw8cdtKEjGU7Ey013Rsn7auIXmI/VD2nYHilcCtnp1sUsOX8YophksMTs+GgsXTgXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PAXPR04MB8639.eurprd04.prod.outlook.com (2603:10a6:102:21e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Wed, 2 Jul
 2025 10:59:51 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 10:59:51 +0000
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
	thomas.weissschuh@linutronix.de,
	dafna.hirschfeld@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v3 0/3] add dma noncoherent API
Date: Wed,  2 Jul 2025 19:02:19 +0800
Message-Id: <20250702110222.3926355-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0073.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::12) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PAXPR04MB8639:EE_
X-MS-Office365-Filtering-Correlation-Id: 57917d06-5f77-4b82-7439-08ddb957918a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?dCHx8m96nvnHqEGXUrEOkwakNzUB86Zvj2bdASxSRRUam8cq7b79m0aJydCp?=
 =?us-ascii?Q?ppplQS/X6/WuC0CeMB+YRkKpO4QL/92dv9i7q7OPbNwW8hLO52GE7u4uSh04?=
 =?us-ascii?Q?VZKD6Zu7KSZYNMloczoFGV1Fn+xQ8DGy0SmviZy3jO+mKhIrRfDdJq6Dh7WT?=
 =?us-ascii?Q?zuy0O1fBnn5yxXzsIZMbSwagU10Uqyf9c61+Yylvu1g2m+SKssbc85/F1cB6?=
 =?us-ascii?Q?O6bARL0FW21BQ9TSdEbb+6w2J0C4fiT3kk3R+wGyZTR2eo73+9DnJqGBosXa?=
 =?us-ascii?Q?de3dqHEAhvo6Jv5GiUhWxqyV+QYfL7qnl8YCvvaif38H28zn/UcbPBcJUQT3?=
 =?us-ascii?Q?5cXpDlazUGKIas9Bqoa0QPP/X0REVyoDoWN8q2vuubKYfImDyGk0RTyu7NvY?=
 =?us-ascii?Q?FuM9Col4YRZInzQibZl6NUvURe0EpgRBJ+lxudMQLqE0WHC9aWvespi7gUpZ?=
 =?us-ascii?Q?w8wme6Fa/0Ktl+L1JerFr2d9YHnfWLT9jQt7mgaZZRqhQVMwWDTgdMgkvjT6?=
 =?us-ascii?Q?CMzMFxpvKjtliq5aT15hK4o8YuCky5jH2RB5lTHde3ZwTFNHFAo8cEDDLCg6?=
 =?us-ascii?Q?hzeoMtVO2jfCPkDqdipyuyBWOjoWZ47jXTA8rELEtGs8kIJ8aayAZrQF56BX?=
 =?us-ascii?Q?GJmlyFjB+U5+tom1CSBjBEo9GWwcKprWg266NBrHiuv9HUxM2h1lCd+ww4Gc?=
 =?us-ascii?Q?K1QSGisrLsvHGDe8the0YbNzRqo1RksCRTlcQKrRm4/Ua9N9B4g/QElBKeuL?=
 =?us-ascii?Q?byjRW+w7DEnnBRcLutUAN+K68D6Awf74VivZRXccyR4sczHY6ycx7C2WUMtv?=
 =?us-ascii?Q?y/kCwfkyxQ0q6N3d6n6xB/QYRhTAVW4zbjhWUByPG09ArBwWTb8b01mk068r?=
 =?us-ascii?Q?NeNgHIA1j8BwVPVxSF5S+NMK1MYVsTO+L08B6wUh0kJq2mN2/Mlxl/cyzX02?=
 =?us-ascii?Q?sHTMElh1os4MngoA+Y5NRW313zYZ1FV1Fbk58VJbeXtX9lx+7TKzE8kxqSk4?=
 =?us-ascii?Q?egBM67TMFR4EsswQxB3nMhbBMULBPOtW5Nav1eyYoNAoYQ2nGdDBuKIK4EAX?=
 =?us-ascii?Q?x7JFYWHFymUATvppm/V5/OwAaeyaYeOHfIJ950VOHhQpq2wNhxUa2PdyqBA6?=
 =?us-ascii?Q?9SeB3cUnwbTIJtpTSrv9n28Dok73+qDUInruDf9FlL7cOfwF1BgcGQfl63+q?=
 =?us-ascii?Q?W2qWToAbaIQxbhg3W8rBdOu7VOSOJro7YCzqkIqX6zfmRgm1kHGCYDgjGH2q?=
 =?us-ascii?Q?WVJ0hUJjHM9CmfQ3SNnOsi/E9OxaSAAVxj6Cy7EDWnn5GzqUhMVBAPbh/B5v?=
 =?us-ascii?Q?ByHy0n2J2Q02vreD6A9yRCKZDLCyIvVdSkDUDyxIDvOptcogyqCUQhj1e5a6?=
 =?us-ascii?Q?VwXQ7hCsmNTl22kqjw8Nb73IxtpYG8+8Aqsq0TUqUWhohXIUk+Gi5sioLpun?=
 =?us-ascii?Q?PGb3/fgXGeFYRBPxoZDXBRILlfk6xuI1KrWbU2Wk8gnmS6BviQspSLPgZq6o?=
 =?us-ascii?Q?y6gqAl6OZa3pUQ8WGABatS6y3DHapHxaRwAS?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?ojoQOkS4cY+EYO30C+rDhwjAguyh8pCq39krkfOxJn/Vd/eIrIZHoSi9Ke23?=
 =?us-ascii?Q?Xsd/xDQ235EnTORL/ulf5gwJXuvfc087pELVixua4Ko4zU043uknNZHbevCM?=
 =?us-ascii?Q?+FphkJSnzg/6ai3yKo/VrJPLfqeXoPi83i1D8nt5YgdgUVYbSp1OW+uK0Gcp?=
 =?us-ascii?Q?rlRG1aFpgMT2STaWrD4azKtb+H6VOGZEhwqjy8d4dDw2A+d45SedsGPAaDdj?=
 =?us-ascii?Q?bPlDIqG5Zd1ys94zAR0N+RmrweduglucfC+skSr8QOxsaQuLLPbuciQTKOMl?=
 =?us-ascii?Q?gE6VUMSldv0SnE8ogURrP0X4S48NYetWFgKly3DqsDD82Z8g3+19BwH0rTMg?=
 =?us-ascii?Q?cFulu/2VSKLLRIF/IlBYz6QMyJMuM84Z5ml5fNWz6ng5PFhJMTyLxJZXT3wE?=
 =?us-ascii?Q?kqD/mKPp03dYcPPfkp4w8j3Gw3Z0k5Ho2Imld3ErF7ZvDNvF8hQWMl2d4bav?=
 =?us-ascii?Q?/YeHbuYF07p9SJ6qAck239leyHuPpkHE5j5qNoxPdwR3FNKIoDe2qBfSwbgA?=
 =?us-ascii?Q?6KBidzSS1TfHIPHwEdwAB62KTp12ghCOXgm/VX48M8jGN+ZtBcMbvPDU7GPw?=
 =?us-ascii?Q?MpZ1o/eg/dOK6e9lQVS4yxHELZ86tggmtMto69qrehjyr7z9GH0qLhevlKF3?=
 =?us-ascii?Q?1RuEkfEG/UmOtJt6K2YNwUs7bQeZEEdAPVbTskBYGUJaLGQ3k/NmXMWYBG7B?=
 =?us-ascii?Q?QuXv6XIC4iR96dtcO5mgwJ25XoIwrY/1BfzDGMQSEQ1nMBFwDzqUDdlTF4kk?=
 =?us-ascii?Q?3FxQkyq7Vy4adr+iXip2u8yIOdE+8k4eD102KzJndz2SVqKOOHl/Ae/zaNJj?=
 =?us-ascii?Q?z9uVOLT75o5Z19oJzRGQYKLjnx/nB38f9fWa+n75+Od1TtI7glkrIpBZPmww?=
 =?us-ascii?Q?wBVOvDA38u7YgKsGOwUngslykENSY4J1RVhtHY2nN0TsbDNijWxtzn+Yf729?=
 =?us-ascii?Q?lrZnbIF1lEBx+Xh2R1d/0FXPR/Q/emxRrTG3xx8asd+wRqSk2SYptejVz4/0?=
 =?us-ascii?Q?IPnkNfz3Xht1pNDgvTtjwuC5juUk7NgnX07JeOL0am+vl2YQr+aVV6N7BiAK?=
 =?us-ascii?Q?c9RXPDLPTQZINNITyuvpCcVC7tpplRR5w0NUMMAmCkvfAbljybND+QsKuVk0?=
 =?us-ascii?Q?vpSJT4VbO0g3et0UHOQpqCyIVvjEKMhAwjL0XsKPyijny2IaA/PpwAnv9Cwu?=
 =?us-ascii?Q?Tjjbt6ZO0iQeb3wvFdm+OL5vbJyVqAITniKVGq+nLjAKovn/zj63b8lbjIvA?=
 =?us-ascii?Q?wfYohd9GAwkS9DgtjZGOTWIzReGK8LYfZbEeHBAAlH03XULy4cKQx74lwUbr?=
 =?us-ascii?Q?e/kUIHTIx93MR7UAAer9BNwOyOp3V1rxax9eBEp97Sv6uuQ22UUbeCLDAUX1?=
 =?us-ascii?Q?YzLqCyPYVWVegKQ2UZvfKkte8w7r1HIp4mSm53qLqbfjBNiqjhF9nGgLTQ5X?=
 =?us-ascii?Q?F7HulNnj9OtudfajdLP4VfCqwUZJuPNwVrzG3z88f2OoeeLU1yGjrkI+tBxC?=
 =?us-ascii?Q?aJjF6RcVHEHQm0j/degmVhkoj2aKCZgw2b5BxMulRLmJjo1ZNUdH8hqd28xW?=
 =?us-ascii?Q?B9gkpkhCGWj5/wFXf/UhPFGv5fw93K6gmU0EGShy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57917d06-5f77-4b82-7439-08ddb957918a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 10:59:51.4285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pj+9zODZPopUwyZjyuozBN78OAsF+De5yivK3CNrRc/trbakycprXERXNNiFCgXzgmNP4vr5pgYUsTas+YIkeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8639

On architectures where there is no coherent caching such as ARM it's
proved that using dma_alloc_noncontiguous API and handling manually
the cache flushing will significantly improve performance.

Refer to:
commit 20e1dbf2bbe2 ("media: uvcvideo: Use dma_alloc_noncontiguous API")
commit 68d0c3311ec1 ("media: stk1160: use dma_alloc_noncontiguous API")

However, it's obvious that there is significant code duplication between
these two commits. Besides, a potential user USB Monitor may read outdated
data before the driver do DMA sync for CPU which will make the data
unreliable.

To reduce code duplication and avoid USB Monitor result unreliable, this
series will introduce DMA noncoherent API to USB core. And the USB core
layer will manage synchronization itself.

Then the last 2 patches have used the API.

I have tested uvcvideo driver. But I haven't tested stk1160 driver as I
don't have such boards. @Ezequiel Garcia, @Dafna Hirschfeld do you have
time to test it? Your support on this would be greatly appreciated.

Changes in v3:
 - put Return section at the end of description
 - correct some abbreviations
 - remove usb_dma_noncoherent_sync_for_cpu() and
   usb_dma_noncoherent_sync_for_device()
 - do DMA sync in usb_hcd_map_urb_for_dma() and
   usb_hcd_unmap_urb_for_dma()
 - call flush_kernel_vmap_range() for OUT transfers
   and invalidate_kernel_vmap_range() for IN transfers 

Changes in v2:
 - https://lore.kernel.org/all/20250627101939.3649295-1-xu.yang_2@nxp.com/
 - handle it in USB core

v1:
 - https://lore.kernel.org/linux-usb/20250614132446.251218-1-xu.yang_2@nxp.com/

Xu Yang (3):
  usb: core: add dma-noncoherent buffer alloc and free API
  media: uvcvideo: use usb_alloc_noncoherent/usb_free_noncoherent()
  media: stk1160: use usb_alloc_noncoherent/usb_free_noncoherent()

 drivers/media/usb/stk1160/stk1160-v4l.c   |  4 --
 drivers/media/usb/stk1160/stk1160-video.c | 43 ++++--------
 drivers/media/usb/stk1160/stk1160.h       |  7 --
 drivers/media/usb/uvc/uvc_video.c         | 56 ++++------------
 drivers/usb/core/hcd.c                    | 19 ++++++
 drivers/usb/core/usb.c                    | 80 +++++++++++++++++++++++
 include/linux/usb.h                       | 11 ++++
 7 files changed, 135 insertions(+), 85 deletions(-)

-- 
2.34.1


