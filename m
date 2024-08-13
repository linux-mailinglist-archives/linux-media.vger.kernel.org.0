Return-Path: <linux-media+bounces-16218-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FBF9505CE
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 15:01:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 612C11F264CA
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 13:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BAAB18A94E;
	Tue, 13 Aug 2024 13:00:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2109.outbound.protection.partner.outlook.cn [139.219.17.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166921993B7;
	Tue, 13 Aug 2024 13:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723554055; cv=fail; b=XA39P6z93Xpk4oOkltZMbLfL0cv2BKeoFHd1XW46XS6UzJe6JIVpv5XNHQXUTzzUzWyS+iu5tW4rmERwXY0Z8sXxLMzbyJagUSt50psT/DJ+p0VwKOdlhav0d9ZPocqxW6PrmqT1w95uWdvVkYLYXFGMXxyhnbaNRVU3vzzMkwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723554055; c=relaxed/simple;
	bh=gNrF6zlKQ22CeOr3+dx9MaYkDq7a1YFti/CguJ0sc9E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G1FcZ1yE1TFBKLXO7lHrH+3dhbTGf3G22H8w3RkvSKzlAOcJikJ8T3n+ssYNeTgAGEj5ETLBegexB23H9vZg4Zme3KGCCPHDW7gtScH2Z5StfXVogEYupEZaZ7+OAHDW/pDTQus9X2U/mksUO1BfG5mfnge0uAp/vwns8g6FOMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CHInLaSlGHIBoZw8UDEP8zuycg3ubqRn8o5DVcO5Y4OCfoQ6AKVubDpGLv2VzPMd6Bq1QgKjhi9l33OdGKmGcIqgJWwH7CGVdpEDCcuaHMCbHzjvBVGyp7IoKaWLlRdAo1O/Imgbpznc/ISY92t2iFTC2e8+FnV5h00NncHf8almkoI3QF6ftRxi23kK21CpGqz18afqpq4mgQHVJ2fCDUNt8cekTz3kgLjYoM6EbSvHxCxL139/4V5xOZ4gJFz0Xnfx3dfCYJnFI28lSNkPj3GSfzifMNLEV5Ol/ZxTVMFoRTPe1G1V4dtEB2EB9ucfztXDALwGq8w5TO75+Kqs9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iYBjPgtoSa2UyIeiJ6ux9B8wMPWjIfLhCqh+PLDTAqI=;
 b=H2v3df+5hwo0gKpJGOV2iuFZmEWdioA1nk+F+l0TtM65zFQ8l7/ALZ/3/M1F3L3uLPhwsjg0qbI/NOwDOzbnzn3UI+4L0CL0i5Dnyjoyb69i46O7uuoDscfqqHsodQyy3QpioYaXN9ZTtQB+P+4d7GUJG6TnWATKSpKiclcrr21/0lvro0Eyv58KsA17zVMBTPNayUuMaRRe96Cvujzmmtq81v4JUljhbn0WcJE3UWBXrj+1Ssv8n9HUWcQrrzcuXAzmrFEKM5b9V+o4fI98h0r7RysrhdK19AcXRm5URuGpWDCFaZy/zbily9tcT3WKl2ExGtAHrJwx3LWk3iHLFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1254.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Tue, 13 Aug
 2024 12:44:49 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%3])
 with mapi id 15.20.7828.031; Tue, 13 Aug 2024 12:44:49 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: mike.rudenko@gmail.com
Cc: christophe.jaillet@wanadoo.fr,
	dave.stevenson@raspberrypi.com,
	jacopo@jmondi.org,
	laurent.pinchart@ideasonboard.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	tomm.merciai@gmail.com,
	changhuang.liang@starfivetech.com
Subject: [PATCH 4/4] media: i2c: ov4689: Implement 2x2 binning
Date: Tue, 13 Aug 2024 05:44:43 -0700
Message-Id: <20240813124443.446703-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240616202433.227895-5-mike.rudenko@gmail.com>
References: <20240616202433.227895-5-mike.rudenko@gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0007.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::21) To ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1254:EE_
X-MS-Office365-Filtering-Correlation-Id: f1c60397-61d2-461b-0cb2-08dcbb95b852
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|41320700013|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	TDbE3PmZM/0enA80zQOUlTlqNh+51n9dHXReVA3zGFMKDByc5x794ndSdsc/lDaNbXvqmenn8jI6maF0w72HXqVQ26WXhUuqd68QpL5EbCBSHgL46jMwQGEY+Dnvn+mU1Be7nuzial5gfQTxT1KKSPqbEcOkceTZgcSDCLemLw9rqhsiKNWywJOf8NnELmVAs9lnXbhWakJ+75qilrpwIMphaRfUlOlePwcMx6NJh+ypvM/pWeLMH6MZjhCGQg9jF+rZBDWqJb6yq8kop30Tt+d8PkdJ7Mv5XznIb3O/Ggx6KPgISg1cl7o1LDU21cSzw1uRHX4V3mZtqatUxN0wqNYlUzJVgwkEAeqlRxO2+OEG+ksL8zGltXifgkIoplehOR1CXwOcz0mfcHy+l2tbVxaf4GDRe0u9OjXdyviM/00HxE/BEoEkyFKr41hQ+JgHChIXsDZkr/+nEuphgsWB8gfM2NbYPUhZfwGBQmqXYjVtgE7VUnnjLxwQDNK73/6PhFKf3AZNywXFj80Vaph0AFnf/NByh8in1j+udUqZhs/Z/ZoVZJ7eawdfNNylZn6q9cZxnWZg5Yx+8B+dn4px8BXSske/abxqdwlDqO/hJWQfMP6naWzqge9hc3H7wJnU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(41320700013)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aRU163Pc92+k3I2FemoTdsEgHH8MZrkr2w3wqqUfn3S/g6Lo2uwX5v4zev+n?=
 =?us-ascii?Q?HkyFZ56gRqxFIDak0GuR5M7jPf264zZhvFYZUHmOWVDhNP2MslGy2axnWu/1?=
 =?us-ascii?Q?H1iLaHOfvzfzpMLIUrzyrz1z+V9yakyNwV6eXHbrzlRCyfbzYYxzZZtDW6rD?=
 =?us-ascii?Q?cU2SRYdH2GBReRmZJ1DLgs06EB5eanSYHHn+q2AMFt6n5xk6lihkt6K057jg?=
 =?us-ascii?Q?BSibNIXg/P3hompXeXFc54Whj0ng8d2SKpWCiCa/pG6WpT07Rk0KdifNFAhh?=
 =?us-ascii?Q?f0wDhrx8RqBFKhpDz582yR1sIni2x8rh6+CN8i8rVTQvjAEyex6l+/tvoItm?=
 =?us-ascii?Q?1xhImfu0dlix1jARvxjO/4vJOb0MgO8oNtelp8rnmS8/IMgezJl7p0DZG5mK?=
 =?us-ascii?Q?MEDeCjAl6sbMGEKsXBk+voyHPl/JAh06ya4r4Ed1i/9u1zs+vnDmNH3kjYjA?=
 =?us-ascii?Q?dF0fHQhxQYlP6ddDnB6j6HySJe86b84qaikBSf2kxDAVeCw7ysb5NBMQ7kPA?=
 =?us-ascii?Q?+rsHlVIgmf3RrPB0civwaEpcMpkqdnLAgh1vfV2cSWfQAYaasxQr3iy88gpI?=
 =?us-ascii?Q?C/hji+rAcfY7HseyPLFZRax4+ArWzK+ApYjPvSazJiQZq7Sc/bUZFD+hfY5P?=
 =?us-ascii?Q?mKqaBfMzd6lJsBv9FbVqQtUFoEJ9PN9b1CrVMaDEbFGmlwnRwKGhoyE3xOZ2?=
 =?us-ascii?Q?vML1zhgsDYiJKN/wZPuLGJeEImbYtMU47f/NFe/OfG8z9NRTB6WjxvSehcf2?=
 =?us-ascii?Q?3bugfg6UsGdC0zdTqIDaMYy89PhCgIFwhTD8ScV3Y95zVlkWN4Vfzrk1CsSj?=
 =?us-ascii?Q?5KycWpG5tL/LJlBIgrSH1eciQSVgYwRLkmMoIygqkutmC/MhDLvbyX2gqVIK?=
 =?us-ascii?Q?qJXrHVj94sdPLr1u4yPbh9OFSXGwLEjVOogwT20UoLuSg8am4+H/yYk/5Rtm?=
 =?us-ascii?Q?pO/rIl/3OaSOobG5p1eRSaXjL6cLsgF1U1rRTyA9vZ0TqPVDreK7zr8iMHWQ?=
 =?us-ascii?Q?ZGs4u8kcPpBLpjlu/cjjgyOUw94GdujwQdTUHS0S3YO2BYktKe7t0eNMzC62?=
 =?us-ascii?Q?dJPjGxBy5KCJkItDCtvHPJBFvG1NYGWYPOHjRdnt9ths5FvCEaRIwJZc6VML?=
 =?us-ascii?Q?UI+jhyRMLtJd17F3Xgk9MNwKKRZE9qEmZ6PIwsXhZ2FDWBZCbyPtaxAyVLNQ?=
 =?us-ascii?Q?emUxZnfMQNhzxuS+E71d07Yazu1gHqd0vEUn6yHln62tM2Jl/KhRhQ5COOy6?=
 =?us-ascii?Q?75kd7ltABIsqHGQ7lw3ulruWuoSWbFZPdmBorBekVQPbumIq0fU/nK9ro3mx?=
 =?us-ascii?Q?EhdUxl43KSDmEnurMhOCCIy3A2ZRFXTSXCxwSntATcvuxlFvuvt3VEHkCgzq?=
 =?us-ascii?Q?HgOOMF5InC8NWScOsYrcVts2qjxBa3tWaILE0QXXgkQshMzW/xBoXoEKWXni?=
 =?us-ascii?Q?1TZbU5weygu++8gEm/Ng3rFjBlUlzH5iRCup01znHx7g+AUwW0cN9IK5vc4I?=
 =?us-ascii?Q?QzWmbJCHHB5eVrvOMYuBxV55fbccMDYVaJCF6uZaz1Vz/n0DVQUFFab0dK9E?=
 =?us-ascii?Q?P/l0QxK9f9dqD4j2YtY5K8DK6TD/M9lawPwUOOhOlgySK4yQSVgrzlmONUXZ?=
 =?us-ascii?Q?7jWIO6zHaIup5GJ+oTc81Yo=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1c60397-61d2-461b-0cb2-08dcbb95b852
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 12:44:49.7753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SxdGbJvPPux7GK9qap9A+H0jrHdmDdZ1EJ6cVToh/Vr1K66B+k6ofSteAK5sGTejTbGdqPu6+i7MfYW4mUxiqDLjft9/imYU01tnWPNwxOrOrpoIaRHQ92LCDQspBWdp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1254

Hi, Mikhail

Thanks for your patch.

>
> Implement 2x2 binning support. Compute best binning mode (none or 2x2)
> from pad crop and pad format in ov4689_set_fmt. Use output frame size
> instead of analogue crop to compute control ranges and BLC anchors.
>
> Also move ov4689_hts_min and ov4689_update_ctrl_ranges, since they are
> now also called from ov4689_set_fmt. Update frame timings to
> accommodate the requirements of binning mode and avoid visual
> artefacts. Additionally, report 2x2 binned mode in addition to
> non-binned one in ov4689_enum_frame_sizes.
>
> Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>

Tested-by: Changhuang Liang <changhuang.liang@starfivetech.com>

> ---
>  drivers/media/i2c/ov4689.c | 179 ++++++++++++++++++++++++-------------
>  1 file changed, 117 insertions(+), 62 deletions(-)
>
> diff --git a/drivers/media/i2c/ov4689.c b/drivers/media/i2c/ov4689.c
> index c4c7c462672a..1499fbe88b76 100644
> --- a/drivers/media/i2c/ov4689.c
> +++ b/drivers/media/i2c/ov4689.c
> @@ -114,7 +114,7 @@
>   * Minimum working vertical blanking value. Found experimentally at
>   * minimum HTS values.
>   */

Regards,
Changhuang

