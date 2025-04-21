Return-Path: <linux-media+bounces-30567-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B67AA94BA3
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 05:29:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5931D3B050E
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 03:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D8802571CC;
	Mon, 21 Apr 2025 03:29:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2134.outbound.protection.partner.outlook.cn [139.219.146.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEED1EB1BA;
	Mon, 21 Apr 2025 03:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745206174; cv=fail; b=Ajbwrsc+u3oppUes8dT88euMAndQsCMGKgJ/OoaN2hrEGgizY5vwhyzZEnLz2zQuaNXg+Hzu11osGwNM6AzwfQw48xI30YUzJ02Py3fReMF3VZu9IySRGuOAFVsvWbJ6OuOuGFuz3kSa2Z4nUAPjsUZyYvkGSnpj3urHTpPtlYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745206174; c=relaxed/simple;
	bh=m7zSr++p/K1LZKQjqPs9FXCJ0530VPsRkd/Q9Dvr3W0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SFqZdOzgwdO2QWC4UdcAb2dbJsWIbjoymFUcF3qCkB1WkmhhD63YdYyvQqy2Ww2+lqjHozmOuUXicFvVb3m7kDYhwNxDdkYmEvT0wV/a9Kdm3diDyIv3AJYbMqfGXmeTS/WyhMB1U+XPVefHvuvVp+qZNfKqgMHt3bzBLyCP2ZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JF7A50HK34pMdu1wYsH3HZR3LLnUwQ4MXjF4Z94N9A9SCk66xlsu11I0uzgNKos26Md5oroK0p+oe9BVYEn+93nHRdfUPE3RxdeLpCQj/mnGM4npGkQ9mAB/8FWed+P7tbMV2OLw5x1IAlx7DDXn7J8dShq6rESKTMCdXh9pwDPD1TrvJ3EGjokD/JnLiUmsQpSNbloWjBcOPkUZyw+zyTGRBkXlmItlukPPAlPy4OS/EZpiKnWIt7lh7HlDaOW/tE0rD6ZpuKjUkjO7tacGzxHHhNg4iiWNVolVt/QVeWonmQ0GOpSVkMVVsrqLP+knlTI5jcq6JIwfNvAURNmEKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sESeRFmd+/vde2FbmYt5/7JPn8mt5njyU7DiuJqm2GM=;
 b=epUQkXCGbjLyjmopK0A4vqWbDih+8kQA+NCnpYxQu4Kd2Ta1SVLmn9L+T2SJtz83J+7KQN/MM1raMfWXANyHrZeF6ORyiJ02I08oPvevwsDABMVwkHQ1PyOwhLTDWWspoxEBcuK3VbapyEMv1k7O6RdEgdPGQbIOWBAVwAfWzlBLw7DYd2cXu2CEVjYMJGhZ0zibP3fcZdwHskFN32QKYCkojErUFHgRjXEyeZy1Fpk9Cr35oS65rKqgCI2O8SjcXROdewL4NB4cC2x9OHm4E4thOKEDKhfQbCYmm5Aonkzki286eRZ48EBjMsqTQ8tqxwuGjver8BPV1keC1/lQ2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 03:29:18 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%5])
 with mapi id 15.20.8655.033; Mon, 21 Apr 2025 03:29:18 +0000
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
Subject: [PATCH v6 2/2] media: cadence: csi2rx: Enable csi2rx_err_irq interrupt and add support for VIDIOC_LOG_STATUS
Date: Sun, 20 Apr 2025 20:29:10 -0700
Message-Id: <20250421032910.41146-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250416121938.346435-3-y-abhilashchandra@ti.com>
References: <20250416121938.346435-3-y-abhilashchandra@ti.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0017.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::18) To ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1302:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c035892-4cef-4e97-9864-08dd8084b2e3
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|41320700013|1800799024|7416014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	qLS5jqp57gTvV2JIyWjwCwpgGPoKJQUKppYoTEyZdH5fiFKL/NJbowEd+xIkJE82PqaIXOHPX3mbHpRX6yOkWBpa8R2YF46kvxHmO2AV3v7GfzJbmjI6EQB11iWMCmRXxeV1bM1H4QxsMO7L2Yq4rPIz1kisn/ldWs2UUb2ASyqBA0u3zRZ9OyL3molf3Xmg0wNIbrAMRKlVe1oRhNT1GSdx7ca2hC17LvETlYqgUS/ticP2E59Z7rw8cRXyOB51/zHTqF9wR8U40yvoUlPep1s8AndENTHhz8Ak4CzJw+koQv/DDFNgKtTIUOmHOA+QRkVbI1FH7BM253+jtXAHQ/OkypSjy9pZWHdK7qfF9goW3XGJVH8ql/MNltjIMBQaxwxErJ0oX8ctHJTF9C27kcMmO3NW49MLNdGvWKjddf1I8+Ff5LJFRLWPcqfCGqiKsCyR284jNKmpEgbX28OhnryinXvFX6DJ2EBnvwwxN737F6UnFvUwWmUX02YsvQI8q/SZ3y0fGfrFQK4LG8hF4moNDfFyJ/fBsqRKo1/lEWwj5CTqKLnbFNMQYsT8y94kWHbyOn3BAUKtarUpyPxgB7Zkpyie2av+IZJWCFXhXYQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(41320700013)(1800799024)(7416014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KK9pI7VjYoZuFwOfbggsI4DGB4EAtriBCUTpex9bFtY88trYRd3T7ngExQAN?=
 =?us-ascii?Q?2GtTczwfu1gvWyfaCBGML8Db+oxSGWMUP7DVu4YcedJ5u16ZWzrJDeW/tcJO?=
 =?us-ascii?Q?1zC6n1w32wdwhihN9+UEiqfoMx/Pu7YrMW4WbapDlYbughI2UGWHcYPK5cyU?=
 =?us-ascii?Q?rA7uz042iXsbR/XGMO3eFHluvHffV6Ryal40TJaBsVPVFXlXw2ZUlYjDmd69?=
 =?us-ascii?Q?Bbo7+OR3eo+Y4dh68ENhqNCYMPmPbzKUMm3ZyWRrqKlbXk1v12pCNmpZp/r/?=
 =?us-ascii?Q?+T54ki3fYRza6oNyckVB6O2Gii7p7KNgcci4E+o5nuD0NbEf9SEsejaitqr/?=
 =?us-ascii?Q?bRGIMa8o+56rhu5IaJhgE/Achk3x8wp4CIh3/3wT0n8BxS7dahqsqMr4SlKV?=
 =?us-ascii?Q?FQqhAk+/2aZshXzSgc0krqQDhFWuq39KBSK2tGzz/bVjzub7TH3z1JFBP6nO?=
 =?us-ascii?Q?1xE49DWZragHSN2G/+3vhiS090/ZuETbTQ4EmBV1kerek6dvb+3FF0WWP+7a?=
 =?us-ascii?Q?wIEYt1kK39HeVGMda5i5GiSRkZvYX8UAM3mn8z56F74YygWEjKqt8Or0KNBE?=
 =?us-ascii?Q?QxusPDpqA+dIoTM/4Zey6eLLCKC1/Pqo0GoiPSQ70zMko6EmEA6ttQEVtULO?=
 =?us-ascii?Q?Y5PjDMZ/dI30n9j6GDaRfGcCcnmpdWLHf7agMNwHDBYoGHyziv63YBzCngFo?=
 =?us-ascii?Q?HQOWI7hBrzFQV9972FT3zHaw7xHCZSHGoSyacCiEagTBwTP+cu0aL1l8tCJO?=
 =?us-ascii?Q?zn/dqld8qgBqW+jcuJAYdmHFdrCYKz6jMv4kEUJFEk3iHZiP+gRiykfDb2ox?=
 =?us-ascii?Q?jKVGp0O7kSYkHBYvOm+kFHfscH81tS4UdTJyJY5GL5Rc63hyPyCM+3CAxnUV?=
 =?us-ascii?Q?o+5keRDsCB2F5tEi3KbN4Mk9PRerVXQqEbtM9pXvvYTJii1v+1nzIQ8jM0Hk?=
 =?us-ascii?Q?2evPxzclmEH19f5gTP8RaXfk0KpnEeZBj/3W9p3Lb3vjejvo1RVX9+ZHoc+C?=
 =?us-ascii?Q?SpJdibJr88ingcA46wvYsV+PCzOKW6EWgDodczaai3DSxVG/8OBPG5K9x72D?=
 =?us-ascii?Q?rWYahERukTjjZr6ZJy7m/wL9tvANQ0rpov0w02YvIYxW92V/BV0eSdaBhGiR?=
 =?us-ascii?Q?1MM4qSCK2I6Sm8AGmX7wX0G2VT0M5Yhk1cHmijcCkyOdlOJC8NQklMlVGOVf?=
 =?us-ascii?Q?AAQsUkzkBGFCbLb/rQRYvpG7MDciO6NMKnVsekUszPtrs5LK6osEEABEtSo/?=
 =?us-ascii?Q?7wTGZeAJ+sTYnpTv3VYS6wMGaNGey9sIFNaj3ZosJBzzwS5iDsIdwKc0CzEI?=
 =?us-ascii?Q?3DrPlX1hvlBXPY6u0rSyLXBSrerY9M3FiR/ihunMGLS5FMwIyG3XDoFc2SSo?=
 =?us-ascii?Q?ONIuJ29WUJ1qlfgkJum4rmlMoJqByLAFE5boFn7q1SQty4AhhY+UHL5eQlyD?=
 =?us-ascii?Q?ov0RA318CLY7Wchv4WC5Lk+K/6qz0RN85AFvrLAIJFyoccZj+aOq6V9tL3Wt?=
 =?us-ascii?Q?W2QtW0NjBSadUN4ZvZpnLfB9MDaN4Gqf+I0rMmwviqB8YX4hrPq3jiyM69+Q?=
 =?us-ascii?Q?ZjMnCJPkTC9X3B4fhEvJAz/2E/LETbFgZvWTnkxioT9IdNNLgW9fhzoUc20X?=
 =?us-ascii?Q?R09KgUd75TaEZoy436m03vc=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c035892-4cef-4e97-9864-08dd8084b2e3
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 03:29:18.3896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WAZZ9kSRVZ8C7YZm8wyGaK6OlAR4crtAOVeL6ruxtfIchRjXpnKvFTBCl3eqbMZUuJHaI/cbvSLDZNJRKWlb9mdEWipASPqAlTvCSbJDUXCVro5tq35282iwNzxIoQBX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1302

> Enable the csi2rx_err_irq interrupt to record any errors during streaming
> and also add support for VIDIOC_LOG_STATUS ioctl. This allows users to
> retrieve detailed error information during streaming, including FIFO
> overflow, packet errors, and ECC errors.
>
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>

Reviewed-by: Changhuang Liang <changhuang.liang@starfivetech.com>

> ---
>  drivers/media/platform/cadence/cdns-csi2rx.c | 131 +++++++++++++++++++
>  1 file changed, 131 insertions(+)

