Return-Path: <linux-media+bounces-36821-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C59FAF8F3C
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 11:55:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7121D178BF1
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 09:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E382EE98C;
	Fri,  4 Jul 2025 09:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YR68eKxc"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010015.outbound.protection.outlook.com [52.101.69.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18C22ED159;
	Fri,  4 Jul 2025 09:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751622922; cv=fail; b=ft5CmlLPC4feQxQ9Olj9RwgEfWlfGt2d83edI34rHR+iFENzVtvY+nzp+oMn+3qA3hTeuc3jhhBjrOweJBvRu2P89MApLuILtvQgfxIehn5qaldDJEQmuGxTfmsCKbrGY7ytzQVw3fjPdvjAxD4CGrYg/lPiGKcIl5zTcX6MxnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751622922; c=relaxed/simple;
	bh=PmgS7YLnv5du584LfVsHtLUIDgEAmw1OpIyFTrwUHtw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=aOOfdk9wVHfNL74NfHl21fWhKidAdJT4Mobr1YGzHJJqv2p5UTrXCsNPDxMxZjg2qRdBYMJkG075k4b49LIeBgjb86f/ZErDMi4dGYbCO6md8lalh2htzP2gSVIwVk1pBTxOZIeJ8MYYoOAEAdmKEExvRZX/psvCSeVKB2W72zQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YR68eKxc; arc=fail smtp.client-ip=52.101.69.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E7jSeYOSc500cNXlBpylINew8lpVavqoUby05WKdK4l7bMOcrXpXLZytxmJe/LmfXBG7keEvrgkhBTv57OK4Q05ktu8teckk7HOivrdoYeDPA4t3Zp95Rvs0qAPvI10geJq2a8AN8n3/fvMHExT9etm8Fh6zHEkco7HBMGVWxiKVwx0GrzNlg0Yg1eFa5x+mR8ljsqE8fi2J5l3oyfyVIqkrXQJxNHQBZaM4Tj53aae6WMZG54GKa9NwYhsiMvwRx2P4Y39sQ6VsnjiyGJXHv6elOqhpjYUXHBJld2YYc+aFQjDRJh1+cjFF30SvMahGBrf+gcYEVSWRuuuVktdzmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mWOKONXwIgCxKk8BvqD6qoT6IoKYLCrnxJY40NZ8txI=;
 b=BYvy2PkelNPCUJ1H9PZN2z/P3v3e/b0JYv6Gbc+ryrn4xBYukgMIm+6D+IaFyUdxoZ+p+E8ePOagFu+MrPCkPyrW58S5ltDKVP4E8zbsNvaNU/nVr69HJ+oxhdkxf/aMVZIF+7VJNdMw520GV4yYv6rxD7dcDY3n49RMh5n/pSoCJfypVWTXM4SsIYj1wwC2fofl7JlNcH63FuygAiqf5JYKrToPqMnf+WU1wnRrOdj8KwcyNfUU2rQHwlrWpzR/eRvSQlxsmz2LzOsM8+gOCz+ZPTatS4jPawYpyaLceGNHoxV1nmpHmVE7iQBIAtmh3OJmSISOJaEfkoi+pCQQOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWOKONXwIgCxKk8BvqD6qoT6IoKYLCrnxJY40NZ8txI=;
 b=YR68eKxcvmGnvZRTgAuaoJ7OZJUXGgm3dqWbNuxhfhuieaQYTKirYuGEqx8hqWaIuv3uirRsqnJpZBpPAVjrtPiH6ja/Gd8alcxR2ItbMmHg2qTz6k5FcfPZ6Gqd2yZ55BcXtck4fcmABCsZb2kzTY6LW6VPVq6edZH802qHhp5/jcd2jFyFAOUSkKgVanep8iTJn4+Icd6mmpynLTM8a3Nuo7ji+iKhynmv+Q873+jpd/irCu7mkayZiZwtWP6MdvS5OU+2NByaSpU3x3FqNhO2cD+KBH692Dbxm6ovtMh9MKKui8Mq8c2eCZHF/lPBvBrlaEgUCLtjhoUhBixs2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DBBPR04MB7834.eurprd04.prod.outlook.com (2603:10a6:10:1ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Fri, 4 Jul
 2025 09:55:16 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 09:55:16 +0000
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
Subject: [PATCH v5 0/3] add dma noncoherent API
Date: Fri,  4 Jul 2025 17:57:48 +0800
Message-Id: <20250704095751.73765-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-Office365-Filtering-Correlation-Id: e8f883d6-90e7-4b7d-d11a-08ddbae0e0d5
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|19092799006|1800799024|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?h4w1H+siM8XovU9y81QvuY4HxUU5SmxiFzaFg61pNWE1lSx4YF9hWpnjKHsC?=
 =?us-ascii?Q?/xTHDhTa+AJ2lZHTcKBd/4bbMnG8myzRwSqn11pvOOB9Ifn4KA0EAW84z96Z?=
 =?us-ascii?Q?Ur7edaRlCXa9Togvaq+c97aESoqErxRHtfZ43FMsYPNqaBYHJ04RYsmw2BOC?=
 =?us-ascii?Q?dNdznB9aBFJQKXh+HLPt8+FeyzsVVnWsT9pP+qtM1yGv29oQ7bru+bLS8ns7?=
 =?us-ascii?Q?E9QhXJuPYK2GV02shKrds6FH7e094aoVFOF7qN4w3WjsztDIKoLT503vlzh8?=
 =?us-ascii?Q?UDW04xXantT3+J6RUZ9dAbIeEpCxNcW9HXIjZe92D7UT+8M944MC/zpIdG+q?=
 =?us-ascii?Q?sWKcWNIaIth2/hXX28NuJpPYk+t2uSLCiBg+TgvMOgMWMGs1dLqobC+1jVme?=
 =?us-ascii?Q?L2UKISNByewkPTbh6Ov/6PmQ+Qf+UU1RSWlCgOdpAWgi+yTlbg4ZcITO0bab?=
 =?us-ascii?Q?VnXAacnEuVi1VOq9l8YgOYitT53HhJlfV0bibbWDKXDMrh8AM/RxOcKPOX7u?=
 =?us-ascii?Q?r7SbRY4S4l3lViYqNjv/OxWvDR48CSnzuIQub8oZp+WJqBgFCon+k1jfDtO7?=
 =?us-ascii?Q?7yxKoF8VlZj9jb7jN2NgejJXkAz9hLVVeW9g7tZuUS0e6Tha8Ug0Mr0vN27/?=
 =?us-ascii?Q?IXM4QTgF2xm6XgaXHDweJ6xUljP69mC3zVknyLROpflyPYEj55ChWO/yAKHw?=
 =?us-ascii?Q?oC5bPFHzTOp54K0ykbkLDZUgua7uHCLBd1nGiBFNRhzy7EbcW5GwIDPvauuF?=
 =?us-ascii?Q?Qled1vdm21DquuCsSpP8jgsOrbCgZytpGbigXapt5awA+oTB2LA+26IBATkK?=
 =?us-ascii?Q?koX/GmlMzGlZERqp9F0iSuRnIFaA05Cxugs3u4aGUK6w/O8SXSL90B4dNGmX?=
 =?us-ascii?Q?/QLzcgGNljldj0d3h2RaMGm/xFa/TApiq6Gz37p6H8+k+RJM90KKSiF/6jXh?=
 =?us-ascii?Q?CosdtCTXJsxwU27S98T1s/SGq7myxVg3TeDg9WHhxA/1F5snxRLey22J5ICz?=
 =?us-ascii?Q?1N5lSnWFwy9BxNW18HqKmkCGE1obIb2C0211ayVEdQN+HJrY/IY785aqQKFA?=
 =?us-ascii?Q?VhytSvT98im6uZBF/A1UBXu8REp3KAPRtHgkZ6KrENg40sngxBHMKSGmEbOq?=
 =?us-ascii?Q?pjlpjnYlPQL1QB81RmRZTTKO2sTRTZju1SGeoHGW2IPA/+s8yi6Ksys++BnW?=
 =?us-ascii?Q?+rrNl5apEyZ+bBaMkyMQqCPGSHMjHHBMuL5DWDaSJiQY/WiRIAfaMA9aRHFl?=
 =?us-ascii?Q?z2d1TjQYHznhmPN0TcBcUUzK8s7H4tCX32Cv2hTPwIT3DwoQ1eKvdm6iSIAL?=
 =?us-ascii?Q?LaiUqAMqKCazQy56Y8Hp97JbL8w/42jAtty5HSImhD9QBHJfUakQ9XfOmKGH?=
 =?us-ascii?Q?7687jA5mYyzrM/dwtValZHs/bX6qgauUZQN/n9nqQlaQbILqeQ5tMZftGZYk?=
 =?us-ascii?Q?hEzzxcpv+zTzSWe3oHq9eQxwk/cnxmff1iaIFOR1qooJx6leVrhM6+uaO58h?=
 =?us-ascii?Q?dA8HFXegiii+oTZ7Njk450ddzsr67DxtVRJh?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?7wahgdrywNXDxC59taipQ5wwA1tG9MroEL/jSjSPEa+mt+Yh+gIzsdhW4kGE?=
 =?us-ascii?Q?9S9HbnaiDjvQ5AHtbFcx7WGTuK710r4fi0dC1qcindfxAlwo7gybzw11safB?=
 =?us-ascii?Q?Tiq4tsoyBB0uJYM9It8e6+zNp1+PiOdMNUzc/7p4hLJREaH/nMrE4oopffei?=
 =?us-ascii?Q?+twXnvGoU01RX9oewnGWqh0Nn0bbTByBnoWKBgZ3MBfXOZyp3X/yAypcQKzj?=
 =?us-ascii?Q?wqc6iW47JvsSNr3IZ2YWUKXbFHySLjzYXcMqtCbp0uevS2QJ/+DEiUCNW5Jd?=
 =?us-ascii?Q?nmCwnMjwEOxaCFsjL3RkfdYreP96W3VmI9euvY8Yl6ybcZAubUH/rvaOFzpH?=
 =?us-ascii?Q?2HmDYSAizYqHW2jXpp16L//sOxclE4Z6oxIcXiqrKCxZStCJetKDg+7xlFVg?=
 =?us-ascii?Q?NYB8/mlX1QrivySZglcCVz8cOcnfhXCGTJLAeNsbm/FoVxRpTypgw1Zm3VeT?=
 =?us-ascii?Q?AuYvRQCUMtY4A/62mr64YuKZpROiHFCjmyW8cC4PIL/QM4WpsrM38BZLuLEU?=
 =?us-ascii?Q?wqlKjLhUeb8hvot90+9Ta3BO6pPxY5dLMdIfxMkhgqTuC4xBrj86wH/zWUXx?=
 =?us-ascii?Q?ZoIr3p0gGwPUOLUdh5mc81v6ANp1pCGuKVd4tkGmjO/hizpkol3zy76G1a+L?=
 =?us-ascii?Q?g+xr1bemHzxN69MKAPfxEZb6GxToNq2o3GD1ahb7zGGQo5w3H0Q16ZQ++J9W?=
 =?us-ascii?Q?wo6RmvIVtWdfjlYueI/91OrxYMdXML8WECg7a+KYG2aKzexoDDQhJDTPM4Bs?=
 =?us-ascii?Q?rmAs46BgtsY9V1BbhntcG0Yzmw9c4P4Yea/QdTOQaFPll9nH+gyvn0cEE20M?=
 =?us-ascii?Q?JMEGzRrb8tuc+yPX9eNraoe1S2dhgM2WYfMf/JTsGiAtG9Rbx6846pTxivD/?=
 =?us-ascii?Q?VgWx8Ie7W/Rg2uzPH4SvS7d5iAnu56wMr978J4FYStxGiPCPvMY/lKzx1U9s?=
 =?us-ascii?Q?8MY7QYHpP8pQGcdK8yjHxlJrSg6kOfNPG2cq3MmV2aTF3alKIsiGy2x8Mo2b?=
 =?us-ascii?Q?FaTtfYwZbu9jcoWJrlQ5Hg4rx1psqy7GK57o4gZqeCe2nlq1rNDMF8QBSLFU?=
 =?us-ascii?Q?lvTkCJvoEuwj+9wagQNUr1uspVVqJQwiX1NndA4upUSo3VsXbzhLsk/jYiP/?=
 =?us-ascii?Q?lvVte1B5w1zdItDfvCvEGHl3OzLtILqsag1pVN6D+Z2Fq35O+NmzkMDdjtDX?=
 =?us-ascii?Q?ta7csp/is+41RwIfDmj76MfYo7aHSuIAp22Zmpm2LnyLELeWlu9vKXHwmSmE?=
 =?us-ascii?Q?IFwTOX72bWwGtyqMho1IDmBP0JzcpXogwqQTIVtsntyJOd90EzHAdKY77oTS?=
 =?us-ascii?Q?S5hYyN7Vu1KEU1qrAv+2GLy8uLk2jHICIYGlEtJQQxMYLlir4o2toBdOe8dr?=
 =?us-ascii?Q?XrCpI0I+P6GJr3D2qfTA7tgn1oa3K1Gs8i7cTan37ACgBP4mC8OuTc5wFejh?=
 =?us-ascii?Q?dwlwR7gmIxFequZrMRE1E4Xqb44H2QsHE3MGHFy4eYnmMNBCObcHWZCKRolE?=
 =?us-ascii?Q?pfxrQfDZvNWqepxd8EDqUcuS/CW9nIA0VsNma+hmhjb8KkfdKmTkZz0Uow2e?=
 =?us-ascii?Q?NFkSq/VcIWQzCMjKsqMk9AvtADXhML7ymhFIUvAx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8f883d6-90e7-4b7d-d11a-08ddbae0e0d5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:55:16.6166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ogeY5+XKHHzM5xq2GytYIkcLd3V21QOR4SFw3NtGUCzFsOS4HnNf1Y0IqXHE2+LarUd1RN7wqRXbaSgFrG203g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7834

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

Changes in v5:
 - improve if-else logic as suggested by Andy and Alan.
 - add Reviewed-by tag

Changes in v4:
 - https://lore.kernel.org/all/20250703103811.4048542-1-xu.yang_2@nxp.com/
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
 drivers/usb/core/hcd.c                    | 29 +++++---
 drivers/usb/core/usb.c                    | 80 +++++++++++++++++++++++
 include/linux/usb.h                       | 11 ++++
 7 files changed, 137 insertions(+), 98 deletions(-)

-- 
2.34.1


