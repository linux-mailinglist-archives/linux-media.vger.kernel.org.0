Return-Path: <linux-media+bounces-26752-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 696F0A41463
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 05:09:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9698B3B5365
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 04:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A6241A9B39;
	Mon, 24 Feb 2025 04:09:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2104.outbound.protection.partner.outlook.cn [139.219.17.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DE41C32EA;
	Mon, 24 Feb 2025 04:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740370162; cv=fail; b=K2uT0xPliZRGwpCu82+z9sL4YqHy9RTTrRq0zvswzKWLb6UdvtCa6olVPFE3f/1awAQ0lN3wv9qRFbYyyK/EmbjHUdexOB24qdMs6n2lJn0bnTcQcU+DjR1+0dBAycDy/PaHpFOmpw7rDeLwbADJqtNDhpDook6C4P/wWB4OdMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740370162; c=relaxed/simple;
	bh=2jzPwIPD5lggOyll4nVtqP/TFXODcKJCXFfSMW55E7Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LbcXquWYsero0ZTDctDvrHxOI6VjDEiVlQOxujF3Zigr6Yd9FvIbn/AekbUMKLQ3j8g/xkTD5JPMFQ7qogqO+sA06DnH5UleaiTLNfD03kc7Zj9hQo9t70K39dtcqLmYSgtYDUy/Gl17UfbILpqlz/9PIMuHKZeB009M65mUDqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PpjRTMislZe7Xx7UrlRBinT8sPPhuRBGLvqlqzf3NCXoTpKMmY3hHetcrOXW7MwfN4dsgE76ogtwqQ0ZJ2M7rtMIsfZIqPTzAWpWUOOKjvJgFvtmXqcocGuuzGjaYIqBBRoU5CkcFn1h3UvkuwaVRembc0sslfSxF2Xl08Df0z17xFHjhsymBwoYOsYgNKlV6O1jBmBZNcGsy40Ao9T9Y7z8xLfDonDHTPAdhQLwO7A0a6o7cGVfsI8h2qw5+gk2m8Kmi2dm4YUu+sHxeoUcbP0zIxZERerH5G/rtQKMhhqjtMOVcDDHUMNsOjicxLees7ZPTSdw++znroQrABXVTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2f7wHfzpLLOdm4iZ1WvZBiif+Dif0VI7N8Qz2YUD0c=;
 b=QFVnCXKQFYjXTLpfvbqNB+77O2nQvBdF5v6Vnww+3Z1kDtegDaRZTZtXLHkWC4SWXc9q1IIReND6C/R8vhyflpfh5PeP8dTmqV1CPitScgU5jRLL8PfReS9j7hMfXvr72DNlLvIcXs9QRxUqs4VwD39J88DY/Kc4TfNVB8RVimIFDkN4RrZocNAaNx6FeQkt5l7in+bK6+FFDmMvcM/SdNqJBjSd7g58kF5TQ8H+egXrqb3KDmAz4W9gI91M28OsBXMHqWS/QddbVu85aZwUCx5zd1hcToA9FS4wGlqa5PqFJmpFICNaWy2sr6PB2Nz6F0FmPABs8eQt0kzmjiOVEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1031.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.11; Mon, 24 Feb
 2025 02:34:51 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%3])
 with mapi id 15.20.8466.009; Mon, 24 Feb 2025 02:34:51 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: y-abhilashchandra@ti.com
Cc: conor+dt@kernel.org,
	devarsht@ti.com,
	devicetree@vger.kernel.org,
	jai.luthra@linux.dev,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	mripard@kernel.org,
	r-donadkar@ti.com,
	robh@kernel.org,
	u-kumar1@ti.com,
	vaishnav.a@ti.com,
	changhuang.liang@starfivetech.com
Subject: [PATCH v3 2/2] media: cadence: csi2rx: Enable csi2rx_err_irq interrupt and add support for VIDIOC_LOG_STATUS
Date: Sun, 23 Feb 2025 18:34:40 -0800
Message-Id: <20250224023440.558827-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250221120337.3920874-3-y-abhilashchandra@ti.com>
References: <20250221120337.3920874-3-y-abhilashchandra@ti.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0017.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::26) To ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1031:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fc2a299-a913-41c7-43bc-08dd547bd07e
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|1800799024|366016|41320700013|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	64mTJPYFzpVObeMJXVCtdGD/AkkJ48dQ4EqSz/6H5vxanqxPpvr36q5dudy9WAh4tXDdI/t8c3K3EuyzZdMfZHeP6brD5kDpvKI7zgjLP9/ZYtI/g31r0daHwOkE5UGG/Vs0Lvpu3bHlB3cVi6y5rCiSoXjzuv6bMGimj0c4TwF8ckIj3a06lulbgf1tm4IGHa7Lw49mYuDz2rjAKPMWE+9zGzaUtnrY1seaMmv6HDQFpc/OYKkr9d3nQUh2Dpmwkr5UsIYzarjA8AMlVes0FndJqCGVdKO9yocgKJwDObpNTupj+gTtJgJvJKaeb1T/GNi6tGJA49VbpsWOiPSxObYqQd55zmKTCOGDEOTqU35t7gMnuufQj8xAKNgu/92t/tY+E5owKBaL1pzw/BkrAyTA10Sn9SIe4ccS469V/eFAgrPAqvErQDeKhRHK7AVVDkOlxPPn3wsVIEfNGiOpdU9m5tgXjc9b8NmE9uiNE3iHxcHoSRI3L0SylOL7XBZYs4kaYTOltC20rLOqPVXsS7RbivxpE2QO38ySxZgdhZtMquZliHMgx0Jm04TKTAtjyLP+U94AScl78tXnhrXW+Rb4JrjQ16XLgz0jelbCCMI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(1800799024)(366016)(41320700013)(7053199007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QT6QEjm9nudmHy4Eq3/wMbYqFruoWXSiJ0/7R9cies/jgEQnWih8Udd/QNV6?=
 =?us-ascii?Q?7rJ6FDJluStmvoHUBs+/nPoxxQlsZ5jqQI8P9wDzh2fxuz8LSBIAqMTEt7sN?=
 =?us-ascii?Q?qcT07d/kIa4yxeeRn7RA4+cIn6kT+T9np+UnBMQcHJdGNr31tzw7HnPB/Tzi?=
 =?us-ascii?Q?T4JwDT0SuffF8ENGZqdUPuVH3HPhO4lMFvTAi4rTCCeTYN7b1aRoep/TgqKb?=
 =?us-ascii?Q?VNi460hSpHvmKw9KzO66yodI4Hmzuc/HOXd+zORFxEa/XZasSunxJmJZbf0J?=
 =?us-ascii?Q?0Sfy5Bzj5hjCBRtHQc2JnzSftqg1ERDVkOMqn6Mho62yfiA/kIm062MgmSD4?=
 =?us-ascii?Q?S5yLG8nZV032AQGaQ4TGY4dedLR1Kp1UVv/QVWnSO4HPJPpLbVmnl8RK0KHq?=
 =?us-ascii?Q?RDS2otUudUA8aBm8g73YZyFYVn2TzdT4muwYmCGkFgoMkTg1t3Sqnx5zSXhq?=
 =?us-ascii?Q?/g0DgAScyQdyir01FcLU+EUxg5Y+JA7Zo7YY7xehXXopdW85Er/JcMRQaJLl?=
 =?us-ascii?Q?YANtgHYvqNo65tbesgVUhGvAAbgNUZ6fd61oiKePAKfCBEOWrdAUFoNugqPN?=
 =?us-ascii?Q?ET7TKHXzPGmNY4L3ad/VH148DQGzRPFbdgJlBIY3YVE7BhljeieN7HrZ7cnd?=
 =?us-ascii?Q?Ltp5A2P3YbuNtIhujcVkDYouF7+o2VW45oVqcgeTgWbRqPfVkznKHxFRVacw?=
 =?us-ascii?Q?MbkwDxrCdq/LMrt8099Bu2vH29RjqZP1r6CKizQtPPGDjHhKDMHw6BjYEUdd?=
 =?us-ascii?Q?f8SOX9O05AKPgA+7qOFYvjc2GPpHH8WsG6oTO1XzQTJHue0ifByCixUbAzj2?=
 =?us-ascii?Q?N/nNGIP3awa1CZG1c8DtOgnvUeJA2eipWvpei/fzm1BhaSvyTtodBM2WDm89?=
 =?us-ascii?Q?Q6v52t2Y4La0rh+r6gK82i5Xs/lnv4Ld+KzbY4mC75IupsZjTAGM95KuU2ch?=
 =?us-ascii?Q?f68UMmsFqs5ZwZonsVd7tRDm7CZzIBy7Q2xzPm8p1TgXVUxCoooi6sMNM3NF?=
 =?us-ascii?Q?lvlgVFZoRpbLIQ5qVNwqt4RivBPSaw5YclDsikzDjhhLIXvovgW6oCf3RL/r?=
 =?us-ascii?Q?rDtHJQVjX8gSaYlvytcdPOIXqc0uVoIsECKWNQMSe1tqzPH9WudzIWB4iq5R?=
 =?us-ascii?Q?J/A6Kzepjs/kPxsHf+4Rg+EY93TKEX0G64bBxYc/w8GqCrhZ2mNH+dnzs4xC?=
 =?us-ascii?Q?s+rkT4UEqOVHTgQG2RBYTUWG3rdBKO4vgPeopA69RF9JploJmcRfRmQYZhBC?=
 =?us-ascii?Q?D91zVqI4aH1/K3rAM/DpkNELlZuuPQvGJ4uiD7T/eoaOSnLxrabMl1DsXFJF?=
 =?us-ascii?Q?tvRq4q/h5yntAuuaDWkkq456HWyuH53xxngqsbwOX5ZXEtiQ5hbFFUKCwc+K?=
 =?us-ascii?Q?S6yWK7qOIYMFTYpxWIM35umHLoIH/978hiNcP6rzUiz9qdXd1QWd8kgRU2mZ?=
 =?us-ascii?Q?GZ3gVikzLWl9uCzU0oe+m/dOcgx9wgNRNnmgwJEyzFgQv7CmDyjve00So8u8?=
 =?us-ascii?Q?MQ7rhJhUt2KjYmPxFC3ynsY/ngcJCQAgxERaV1S9lNxnzaN/fuxnRZCK/tyR?=
 =?us-ascii?Q?bo79YmuQkYFzKCQ0oog6WDbLaC7ZClUxOAxMuzeldV9sxwcVSVZWT8ISfZso?=
 =?us-ascii?Q?PCG0r77VEUInc3+BmxvAbvg=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fc2a299-a913-41c7-43bc-08dd547bd07e
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 02:34:51.3635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2wytqm+c5woxkLSJqXPW863b6KOznOuI6jYTg2s/dCNBjrDbhzS5ahZy+NB48AMCrNkYGJoCHJNob7bEaz8WURB8Tg76AHWbK6FWsJjtL6PoSOEg6HvO+wdJO0n8iQae
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1031

Hi,  Abhilash

Thanks for the patch.

> Enable the csi2rx_err_irq interrupt to record any errors during streaming
> and also add support for VIDIOC_LOG_STATUS ioctl. The VIDIOC_LOG_STATUS
> ioctl can be invoked from user space to retrieve the device status,
> including details about any errors.
>
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>

Looks ok to me!
Reviewed-by: Changhuang Liang <changhuang.liang@starfivetech.com>

> ---
>
> Changes in v3:
> - Address Jai's review comment to enable FIFO overflow bits in the mask
>   only for the source pads that have an active remote.
> - Drop TI-specific interrupt and have support for only two interrupts
>   that are common across all vendors.
> - Address Changhuang's review to use pdev directly to get the interrupt.
> - Set the interrupt mask register only if the interrupt is defined in the DT.
>
>
>  drivers/media/platform/cadence/cdns-csi2rx.c | 125 +++++++++++++++++++
>  1 file changed, 125 insertions(+)

Best Regards,
Changhuang

