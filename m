Return-Path: <linux-media+bounces-36648-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D969CAF707D
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 12:36:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E24061881EEC
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 10:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B32FD2E1743;
	Thu,  3 Jul 2025 10:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Ww3b3Vf4"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011027.outbound.protection.outlook.com [52.101.65.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83691B95B;
	Thu,  3 Jul 2025 10:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751538945; cv=fail; b=HjNhvh7ca1COw0+FqJEYOs/qaXa9FLyjfpKeIZbqkY/N2rXG1QFbl+AnPKE2Mij+XxZPffktBRYSC8Dvsa5CS4IY4DwgVX5Ud4C0v4vYK9zybASXVqM/lZJVKMxXYWLhyNibo77d19Lo1nvhLnT886xAr6C0IbLDmqPsVB26L2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751538945; c=relaxed/simple;
	bh=lYF3WUZFH5RO05e/y2sND3Ohr4TBZLENWgaNMSFcTVk=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=S/CgQBjtaCTAIVLSiluAZXItu4OVu8+3nAPmwCxt0fPZpfbemCDtyJVloBPTOwfE6D/68ZQFxiKBm28qercVnhxOlY9LEOafIW03kYNYK2SKtsTJNXrMhl7fVIngmjGke9rG+Ez2c5PxauuIKLY6mbHDBXNgu+UxojLhkNxiuiE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Ww3b3Vf4; arc=fail smtp.client-ip=52.101.65.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VZmYrk4aIwG51hfs4T/vXc+83WBNAmkfLVrr5v0ptfPeC+0KV4mxk0Mq0B/E+PXVPNJ89lNAOJDSV4TM95HpBH5jIo1r/NutePbCn0GYuZbKgKbH54d56iaIdcsf67447W//wASf57gMBEW58ZlrMI3pAaLJCWQZKPYz7DFGfFKzcFPD5fn4lq++Ln4nvybJfg6oKhFt7xvypkyf/3ugTpcu2Jc9d9vVwbA7Voc82G2zFBWHRTBnfc2LXB028LBf+ZSY3TkrL2u1xa5eLoKEwPAxB8hQ3cBQXOUGENOW7u3OIFOy6BR8CMIXa9TrUvBfs6JqpaSK9ncPUiiFXqVXeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GpwR/d/rFAKgl1qato5iMAyoUqvgHGOTxvDlcz4P/+A=;
 b=RYM78aNJ50fzvdJyl9YMz27kQ36dznZwQR9qh9a0n3UPGpgE2lUJ3ftQkLcP6qoRwslEYlfJxNZcdbaNroSmOw1+58okRwk5CT1Pi9rWAoNCHLBPsUrjfZvHz6rpfZFS4RRqB2pOtGXZ3FDAld5CY3Re+KNS5she8giPVAIGaUPLU3wlI0eNsdKgP1+4rVc9aVrrTZ9LNIgxGG14Y8n3/Og1Ux4hmUcvLguE9c2PyqSEvIROTVTf4NuClteChYrDKuLxq7vhVIvDpqPDKFdW441Jma192SwRmp8q6H83L6v0+l8vbg7E2d+hih0v+l9Gz9pH5sxzAt/Ezq/hqDB86g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GpwR/d/rFAKgl1qato5iMAyoUqvgHGOTxvDlcz4P/+A=;
 b=Ww3b3Vf4oDbs0R9BjlMoGhOiKop8xHgk9TAegQtPaLBjL+gL13kNRG++CGZPDK7oJ5JdxL4+rNl9VNFA+ZpZKRQOa8n183HIIslKLO3o2ss/z2ZhiQm2kbex8QBqsF5vUJ8iuVQkt3TGvXx9bXMAC8QkNdscUAr/Kwpbc5sAJMPYcvdvSmFLPLw5MdqAlx3B0UM8LqSiED0XrufoPE8PsnWlkJ+qkG+BQAulvTUzuYsrqc4les6O3OkUak36AN7ln2Vz9dI8q6rwkQ1TEXEzsr7EGQSZRmn205Qy6f8dYPhmy7rzjQqNIy9GOgzjLUX8Nqydc+ZFzSO+HKw7V+f3+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB10928.eurprd04.prod.outlook.com (2603:10a6:800:261::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 10:35:38 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 10:35:38 +0000
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
Subject: [PATCH v4 0/3] add dma noncoherent API
Date: Thu,  3 Jul 2025 18:38:08 +0800
Message-Id: <20250703103811.4048542-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-Office365-Filtering-Correlation-Id: 42c97dbf-b5ba-4130-9c78-08ddba1d59a8
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|376014|52116014|7416014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?fXCQ+slKnK35NMgUciriEHXDW1k9Q8La2zNDxdPSyuTWLM9HiDsScVuFJncc?=
 =?us-ascii?Q?FHc5ftMCLr0pXlVBMwOIHm5jPLUhcIl0Wnxbr41TVwgIS6rwDTeG0t06WzVC?=
 =?us-ascii?Q?bqQskjc0zGd55/KMeMVycXSnRIX6Ef2NTlGDLEqwdnFCh9Ep8zCRdoT7v1QZ?=
 =?us-ascii?Q?NoVKRWyEq1/5Qj3GjhAUsYAvn0nHL0dNWbtOhO+ppWhQC/itoH/eSTAUK5zg?=
 =?us-ascii?Q?AHlGrnRhXSm28mYr3RYvZG6sKNf065MUWFHloUwbzLP2BZRl5FVOrEfI+DQM?=
 =?us-ascii?Q?pVVMQkZG5uYtBrmPo0/uWe5FCpgmp/XDJmCE4dm1e5QyzMmclsgCeklwGmOh?=
 =?us-ascii?Q?teH6Z08olinh9pAn8pa9byuifvJAtH7bL9/ym0GteQ84Tkr7L/Tc+6hntVyR?=
 =?us-ascii?Q?XMh7EkCNM5+REIOqB/DztBuw6aCM/5FwqyfI13T+ub2yqIWXgdbOzOWcZral?=
 =?us-ascii?Q?QPXFYfeCyofHoSgOVXS1pZ6Ikfv3usPZ9N1byECZBnbZOxRXXe+1BXkUJEVg?=
 =?us-ascii?Q?FXarehdnXwAq1u/Ku4sXUL/FshleiXRxc+WWDHv3xDpHC/l4T1AlRyRaLQZ+?=
 =?us-ascii?Q?nx2EDS+JbEadP9RaJeHUST4TyHGQ2ggMLThh0h1np0EQQDeIQ4+3J4O92zBq?=
 =?us-ascii?Q?zXtEc+traJ3fKW8k9qXZ8DBP+ghNHAALdU+kej3YyaNf5coR9NZ0jhcow1ii?=
 =?us-ascii?Q?BtaPXvliGbG7OLelkEPlpAY3ADfrv/U0CmPCqugZFxu5WA4pjCtem28cJ1vR?=
 =?us-ascii?Q?kVd8TmNEOdzfsurPO5c9Wy2q5B1SgQ7Gj5ikBW5qWEBw/skWsCot2GIVJHO1?=
 =?us-ascii?Q?Y/8/PMDBOF8+jbfodqlb18weQVlqn0G5acokyvTPPIr7XvxD9Mc0RzocOXp/?=
 =?us-ascii?Q?q+1+bNBV7HTAMORDnZgrZMdcyITUpi4zWgLY0HIW1vmMV+cwLYXKsDfDxoJF?=
 =?us-ascii?Q?j4SibxY/+PNWx9QYrc2Uj208W41Et+HX5uzDuV/pjukSUaf57YXX2m+8/fXd?=
 =?us-ascii?Q?xUoVMjE5NZyjJZHb8dlyGcWZT05lq/36vlyZoaf53D++vT5vm1wgsTDiFp1U?=
 =?us-ascii?Q?hyI186+E5Hq8zmQINi/iBIddPXoRgFEliPKqNXJb2IUBuaKRwr+RKOjTTAWy?=
 =?us-ascii?Q?rLPAn9aXbzinFszKY9Hkvw6lyHQQyX7W6h6+KKsDTkZXpaBRtUbEZWHstPfY?=
 =?us-ascii?Q?1jM5adUMv9OkFH5u6m65g478tZ+7fRdXdq/WFf75nprxJNWfizOqX2AVBGYp?=
 =?us-ascii?Q?mZj8naYHeqVzeSrhSuyWyvmOwXpxtp77YbQZWENLn34040ZAmy0T7fo4jFqT?=
 =?us-ascii?Q?5Vnm0grQ4F1f67rRNTDXf+EH9+wrkcmZ/pHCGrAeT8BtanXH5f6zvYjbDT+k?=
 =?us-ascii?Q?LyvJ8q3OpJJJNXG2KoMk8lBQxf76I0mKwmQ5XYovDeXPIxi9+ItD+RFklpZu?=
 =?us-ascii?Q?bKAABN5SgYHA2qeL9tzOerjHomy/nIfuJ4fYzmJA4FCp//fMQ+pWjLFQ3oVa?=
 =?us-ascii?Q?6P8gcOUL3cDcRD+nep1h2YUiNOPmUH5JTC5f?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(52116014)(7416014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?SsiKbEvt/Nhm2fKj0+gnIAS3G44O22kV3dmOtYZjFFE3WnxN+sKnYEvhNegN?=
 =?us-ascii?Q?TrkciPEaQEc8jXKJcT4wNzznVLpscO8FwHqzpI2/ZzRKKtnObWVgShXyt+JQ?=
 =?us-ascii?Q?dBonyYf/elEBp2FkNqBkLd1UOjuBNWjnZwWbX5z1Zqc+JMj1AHPQcgS03fi4?=
 =?us-ascii?Q?+p/fbV47G6DrLTv/shq1k7nVgcaUI0P6luJouc0iZ9f8sjvs6C/O48bS9kix?=
 =?us-ascii?Q?MLS0Ttx+ZBcw76HOEA5CylerRiqur2tQMJ8aT5xg2YkqMq4WMEDIDjvO8Ecg?=
 =?us-ascii?Q?vv5a6s3Phkj0nb7YcK04lAL1gAfxngLlbR+dv771SNt4QNNOthWYTNvHH09Z?=
 =?us-ascii?Q?L8FMHFZz4jRzdge+wj/eCEMP6zVrzY+kzl/X/0XtXjbt9BmVShSQVpDkRemL?=
 =?us-ascii?Q?fN74fubVjOp8ci1vofP1nz40qb0r4puE7slopZTIlLDgMJpql9At1+luKG9F?=
 =?us-ascii?Q?p3wIxbUM1Ry9hoQ01mBBVjNY8/iRaRWPqcJpZP2L5jg26pwXwyHXUJ+MOyDK?=
 =?us-ascii?Q?h1dIoD7Ge1Mi3gTHPX26I4lEtGZoDmdnhzxnxEApKQun2eVT61jDR0hI0dfa?=
 =?us-ascii?Q?TSrrNGtemyt5ZSwBpJxviIuV4a7EXuLpZ5UkR/cysGn2yrFJU977ecKvnm9o?=
 =?us-ascii?Q?OxhuMTE5Q+qQex7gGFuB2Tn7i1hgDuVl+rBO2eUcTsgS2LRNfsaqb3bLXRf5?=
 =?us-ascii?Q?W09NK89b4WT1N7s1SozgVlFfYfbJxsMwpH9wcKWTfQGg8H1sEBocg279pfYd?=
 =?us-ascii?Q?naWaEly3RdMAOxC+CJ1VEnOWm40lvwpTDYhVcpnI4+AvZ+UQ9csyUEXc3nx0?=
 =?us-ascii?Q?TlqSseoyxgLbKogEVcLLwAUptI/pOUYrDD9pKsqnsth6JXWdu0qIOZjukFjS?=
 =?us-ascii?Q?Sxq3dxpKPQWY7SIr+Oi3oTiP9+OhUJr1HDkVvse756JApM4lgmIm4NkTMtC2?=
 =?us-ascii?Q?/DtqXEeapS40VfjoVEHtRBuvgiPYnGBMPN56+OmYYpnnVGzu1yFrlM1XC6Cy?=
 =?us-ascii?Q?ktTQoxsfsshpbuOXfvkAGvXBc9g4xkTsneDtDuyNXEo+4/DFyrGTSOvmc2K/?=
 =?us-ascii?Q?6ny9WsePRE61OjaD+ujNhTD0d7dXfM41iQvIOKukdaFHO3CVRNKB9dh7c3Hm?=
 =?us-ascii?Q?hb601R98TEEKCffJ1EzbSpOA7CHfXKKNxHsDRdrSDP2vAlEd/IJUvh71Wv8m?=
 =?us-ascii?Q?tJ2FKFmhLr2lSK8MIOyPrxJNuXMDqEgIPdPFKHf6WtLl6n2AKIiPAhmRVAxh?=
 =?us-ascii?Q?FEKzi4gLndWblIGQUoCYr5NP2RDxEp+qhay2UJ1neKYPPaz5CF1LHj7/uliC?=
 =?us-ascii?Q?w6EuACddDwZyzPDf4R/mp0Rzk4PNI6VhnVM37kQ6LxJou1ffhkbAxY6FNp6I?=
 =?us-ascii?Q?Ebr25caxxoZp1qKT9UAnjBmjBCTRAKHht/B4WRduwXmReFENvsS958frlsDj?=
 =?us-ascii?Q?wgE41v0ejRJRfNPvF6CBmao9LwAYaIRV3iGpH8DMuq5OJz3bUOfSko/XahVi?=
 =?us-ascii?Q?A0oLjam/In9ZcX6t6McR0pEjYK4l+4tLecsiVjgnh3xyjL+pqgPmN+kiUkR4?=
 =?us-ascii?Q?m6yuwUxwvB68g9s3XHFVZBSPf4GAg5NGV9FMj2ik?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42c97dbf-b5ba-4130-9c78-08ddba1d59a8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 10:35:37.9870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SQEyLDTOKLKECoWxAVC3X9VJebMtosm9oZxVEa5hr0JkbykAnLZoB8s56R1qadP3MqIbJQyK+lAFBlYQHikhyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10928

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

Changes in v4:
 - improve if-else logic
 - remove uvc_stream_to_dmadev()

Changes in v3:
 - https://lore.kernel.org/all/20250702110222.3926355-1-xu.yang_2@nxp.com/
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
 drivers/media/usb/uvc/uvc_video.c         | 61 ++++-------------
 drivers/usb/core/hcd.c                    | 33 +++++++---
 drivers/usb/core/usb.c                    | 80 +++++++++++++++++++++++
 include/linux/usb.h                       | 11 ++++
 7 files changed, 141 insertions(+), 98 deletions(-)

-- 
2.34.1


