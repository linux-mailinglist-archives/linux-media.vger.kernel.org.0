Return-Path: <linux-media+bounces-50906-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C95E8D33670
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 17:09:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BABE7304A8EF
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 16:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A321A357724;
	Fri, 16 Jan 2026 16:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ceG0Ceby"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011059.outbound.protection.outlook.com [52.101.70.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E00133DEE7;
	Fri, 16 Jan 2026 16:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768579754; cv=fail; b=CpolKrK69qoUgvUh2yU8MjiozRfyQPQcWZfVJldKnSaapyhq9iqYmuCfYGYOSiHxAjtieBZ9IClA3ayCZ3Vi598jC1IhY/YXOBuVAd8iABcCdx3upkDpTh7nGubD2qoZIjA8a621sUGH4vuffJinFJiUoLNyCfqV8ak6JhaX5sY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768579754; c=relaxed/simple;
	bh=M4Tqipn95aImdPZZ3LzHc0M7EuGw90Y+fMgn62yCl/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Dw+2ON/gpLlurSgNYxFsAjVWgPHI30w+S/hpISm2957RBW8HPNC3i/ubPImqgehtYawbyt7lPsuyEG6aiUdFEG8uiIi9tKmjf4KMtcH3cRlvHnL8UdpJG9IUVSitgNQSPl6kT3xijIIfmUCVyC2cq1EYqTko+iQR2c26LjO9x8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ceG0Ceby; arc=fail smtp.client-ip=52.101.70.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S1kcbcYIobenJzw7PlXNFWFH795jslnTxRK5Q7dEh2e9coYFbY+Tuyqs6fEldX4zFGsAXB7lIYAdeTM+CZxomNYtOTyWdu8+DGqECLejc4ZWvDuWlU2ZSDVeC2wq15/CYFAO/YZ+5iD6cHGNkYS5DPblsVte+E9rD01AjrkV1PKPIqF2iss6DK1CK3Uak8fDUOTGwnjcAJnbRFlhLhVqJwy9KzxESUW8liNDv9q7Oo7FGFG1qivp4m9hq8os7m1K2sdIkCLPFUcq/oVhsCxui/lHy0QQ0XZmi767V/v0snzx+T0KBQFP2X7QcX8cqAnMuZBni+c6fpobvZCvvnDJ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Oecf8M7GO/uIJapRTguyUJlODoeuUrwBF+f4GP9vEg=;
 b=pZQhx6/hrv7I1Xa1qdHWCztHJ+tKzRd78mhyFvvomF2BhoyvCfXnin7JWHun56Zk1xXrcP+T9TPPbh8fzm+Tlxm3KV8HHNNLYFdL8JvTrCgFFl8MommHeCLeWtyFwXisJzpGFp3S6KCAlEwGOf0FnZVT3gSgXuggg2nTZal3+DONAzyioH9RvWkJpmfpo+yxHKzTH0veFdkzA8MktuS0sCm+vc1GI2uHbgP4/i5pM/ziSP7mVHQYGS/EtgVszFlWrK3Ru8SAHcVy9wXIyjFyEZEIKJXCZi0w00G4hJy5Tc+/2XUq2oG4nkU8kkll99WQ+IwoSe4W6f67quFqQk6lWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Oecf8M7GO/uIJapRTguyUJlODoeuUrwBF+f4GP9vEg=;
 b=ceG0CebyANq6VAq+CcqxYRrQkR7/aQMC9Bs47K/DL4U8t1JjBOoijFTR3VEUKjrxasrWBhEtvEevV37tjL2h6D4ZMrcJG4bSIR3uYS/Gt2SdA9hBeALguR0urfu6uOSDsnUzm69iGUk4qwScpbWiaiKgzo7ntZr2fjLFIkpoPY3nj+4hhTHw3Si/DOf0XqUnIii2ndCFnwHXNSu1VF4801H3M+9Upml2z3J7BQgCS4B1j2jZZueYBLoRjnl3Zef3VuObJ/pnYn2MNHBWqEmtbYAWv8XlYSRsgkxgwJsM8BGfQIaUlInEa3RBQvwlAhFYvuqb6LJ1XxTpifN7PAaegA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GVXPR04MB10945.eurprd04.prod.outlook.com (2603:10a6:150:21e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 16:09:06 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Fri, 16 Jan 2026
 16:09:06 +0000
Date: Fri, 16 Jan 2026 11:08:55 -0500
From: Frank Li <Frank.li@nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] media: synopsys: add driver for the designware
 mipi csi-2 receiver
Message-ID: <aWpil6jI1Ad0DcEI@lizhi-Precision-Tower-5810>
References: <20251114-rockchip-mipi-receiver-v5-0-45aa117f190a@collabora.com>
 <20251114-rockchip-mipi-receiver-v5-2-45aa117f190a@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114-rockchip-mipi-receiver-v5-2-45aa117f190a@collabora.com>
X-ClientProxiedBy: SJ0PR03CA0191.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::16) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GVXPR04MB10945:EE_
X-MS-Office365-Filtering-Correlation-Id: c2cdf9d6-24c6-4eae-0f7b-08de551992b4
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|366016|19092799006|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?ug7usz8zRxxrkbdtDWAuUwDwxd28xRUY8XfMMxza/5mVsa4TLnJjdJIvMJ4C?=
 =?us-ascii?Q?oWOUfkW2ZY3MZdCThO3czc5kNqsTRzm1e31SCRJsbJfmpIPVt7G5YSxWXT2n?=
 =?us-ascii?Q?CAkkGe9JbX/FAYFN2GLGCP3VNzZLMsUx3ykLFXGdihE0EDgTDRMb0+yRbhMQ?=
 =?us-ascii?Q?fgcfUBYzhGqv+w0Gc79iV1gJJKfZquh+o0KWNuOQHgprixgorxl5qXGYyTog?=
 =?us-ascii?Q?78mwWV36p+ISiemj5gE1Pwn8kWN8CJuvgo1HCwDRx6ZFF4QVoZlzPWnCpJBN?=
 =?us-ascii?Q?kIedH7whKZdO4bNmdSuvyUagN+uWbauZU2wrSIbHdTVGIK1BQ+c/g7vwBwS5?=
 =?us-ascii?Q?9qDoFLopmXConh/UZhn93P+7Ec2F/3NPlc17aynnfVZVrlfShnZ9o0c0T9Xz?=
 =?us-ascii?Q?zBdudA9NwJGNjCMA2RxHgKv7CTNz6crJVKocQ4PXVfAdxk8kS4erxP5YQopb?=
 =?us-ascii?Q?UJbqd4NwFI3PgyMOxoODpQLC4psTG8scNeHJ6d6rFO/6FiMHlDheib0UXeoO?=
 =?us-ascii?Q?nxfzjIs8T4KxDLkSM8l4Ibdal+J1Mx9+yNqy6poNju13VR+2aF3gxpeZP7gg?=
 =?us-ascii?Q?E7p+jgvQ57Hd1L0LUkJ20UnzUMNFyhMKw8gSf1z5uAH6kHMmORdsXMbtiAVL?=
 =?us-ascii?Q?m8tVi9CQaSzhrgKYUMjf1x+F0alJ6OYTb9Tftme5F9bdbUigXqdZVVbjz2l0?=
 =?us-ascii?Q?OHzcUPaQYOhxWpBWuQ5c5y7zAvS4VFoL2UmjF8sFmlO8WUZzdZs6uCRZGgBS?=
 =?us-ascii?Q?901J3m7x7a7IIIsGRnM9MkuNGyiIra2WA2eyPn+SQMGBH5rKqnrG6BlC0sCo?=
 =?us-ascii?Q?jUFF4tx+d3adAbLwa1viNoCMpEfm8aXStQQiTG/rnU9wvZxoVjzqC3zvl924?=
 =?us-ascii?Q?jZuK4qyyu2COK/amjlsPDjO7TbXHBH7vN2gRzwGWUTttmpUVCP9aig4jHfpr?=
 =?us-ascii?Q?3tac2b40s+Sw1N4ZCKl8UqiKyftliJvq4upHBdpCryPp0BYvKZbYc0KsnA2E?=
 =?us-ascii?Q?hMC80mwTGL47L3hBBtvNAJ273vavX6Z/hrnJiR5vgJfvaDvIpnKplFavMJ5J?=
 =?us-ascii?Q?ak/LguJlFlV41UwhlI27Pkn+lSNOs2SpEc5NRSRaUHUcziXEkXv/C4F+XK6k?=
 =?us-ascii?Q?rnE7ydX9gVxhpJ0vVIS0czbXSHJDzjoBetleGF/HMjcvE9fO/IRN8cinA6F3?=
 =?us-ascii?Q?10FErI0/LLFB0mBmq1vBLChxNLvBlhp/BiX4u2mVN5VpaVoPJ+yUhFiFjinr?=
 =?us-ascii?Q?YpvMVguFUvpWMipJ0BV6dgOkdfI9HFL86M+m4/jfqtsXaIPifAgChzlxq0f1?=
 =?us-ascii?Q?sbcDlxg7FY9fkW82ZOFp33Unv8VPvcLZzJ9xuSNXPBYyKgWYqOi1qpH6KLYq?=
 =?us-ascii?Q?cxs3Ahi26+4ToYu41BBUEhQU/o6suMZ2JMAxABZbP4UeGwowWY/fKuGVpk7X?=
 =?us-ascii?Q?CvJ6985WRZDfOb75mdFS4MWI0ImT2hBXPaaWBBBXOrO5Qd8FytgpBJjhGP4l?=
 =?us-ascii?Q?74YzQyygD2C7yCM8a9ULlFjcxazA6Lk0CH+oUXuuD43ogW0kqndtxAIjohUy?=
 =?us-ascii?Q?Bys+BzgwYxuUjzpzpIeEc5MhW3JxJb4u0fEpj1U1frzxhxlmzlToZsRcy4zD?=
 =?us-ascii?Q?rQ6XXsPsbY1eQWr2w2hXkDw=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(19092799006)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?V9xjxnq9F+GC4Lr+p6jHGj/IwNE84FDFyDgvUsn6poBRH0xuduBSxoWqEhW0?=
 =?us-ascii?Q?VxckHmHVTlZMtgn639xXoyEYQFhSflwPez5SZlO+8b4cutl8iQhjavTqdf1u?=
 =?us-ascii?Q?J3WCLLqK3VGo5193glAyKsPyoBz4b1fK0/9RSkQBTau7WBlwMQXyZ8txDJ9V?=
 =?us-ascii?Q?yn7cUdHaP3vJqV/G2JX/BJHFNDrv5/TnCgHuQkIU3JTKuQTvF86Tvl+LmUcc?=
 =?us-ascii?Q?ebN5AvY9Z8kFklAQGwbj/z4ekMF62RbCXehs6Ea+YCAqP5SBKO+fiPFpLoyP?=
 =?us-ascii?Q?9ZRftvyh0T3FVKcMWEFkNIeL77ySqP4ljMXOYcXNjltHsFCB3MQicA+cEgBV?=
 =?us-ascii?Q?xbPmjdYm6upli3lzPvtLgSXKSgcb/GxjLqIlerJ7YV/nCRXdhcEVeU+Aa7EW?=
 =?us-ascii?Q?1SeeADhx0QrlxPwBSFycQKNRemP/3HREwb7Clmydsw8KbkueHXy1us8dkap9?=
 =?us-ascii?Q?WLVOYqbQZhd8iEgxy5SbsWh0t/q3avI0U6nhw6E9kFrFbVudPs3hDNylZN5z?=
 =?us-ascii?Q?x+4WrqaLw9rhL3ZULyu/0y3uvIXmJvSQtHD67BEf0LeXzfEd0+HGPZoS3n5h?=
 =?us-ascii?Q?xQ0cvPJ2A0TKbR6NQPNsAFy5bVLiqCtQqzvYyvl7rCyGDSMXMSXT9YdhX4Fb?=
 =?us-ascii?Q?Vr2aHbnS8TN+dF8hiPcXfzRQVxHuMgrqU6e48ZwoYRFJGfKNm25npkBwEfTo?=
 =?us-ascii?Q?HYjmnEkLM+anPehNWDhEI0dGMfDu43yCnHotVIleKtU5sIk83nvZ41MjjQRx?=
 =?us-ascii?Q?ED9+ZDlA6hH0S0GVwPbWfeL3lHGM+8XXB2P4TemqG+RBpgR7GTmvz/CmpAvF?=
 =?us-ascii?Q?OnLSJkHpyPFdU3Sv0AG/6hlB89iTYdVt4feLo4mzfZzq7sbz+y+1c+tpt+I8?=
 =?us-ascii?Q?4jI1Qrb4UoNPR2EQekLenB4yhL7CUCVF2AUvFuYBY6fN+R24SgHIJ6cx8sUM?=
 =?us-ascii?Q?zO6QG+yRhXW529cLkhf7qkrLGYoKaMeICGlqKMeQFlOWmO8otjiyYSI0rPYx?=
 =?us-ascii?Q?guqJdgtBlY+NMEn72VLQpZtzfiNq95h2YHpqwGKxseX4rtsAZRahmciXkXjq?=
 =?us-ascii?Q?TeM5uGnjzQoaswXQEOYJnV4lRjHOs9M5cJeNa+FEpZGmH6iRb1sNJWLzEbRV?=
 =?us-ascii?Q?O4l2QaM9uWRjLA56BbnsJwvrK6k7K6sqN4zRh/+8RIeHLyR4EHhldVNRgfXT?=
 =?us-ascii?Q?PQq1OUXq3wVSMoAqwinxcgXtwgDelCPQMsFIlUvLaAooBdtseNcZ3gV5Ybzu?=
 =?us-ascii?Q?L7DM80NOMZFX3IkHRA1YsycGfRYQz3K1r+LQDCoOHES7KFumNyWSp2S8NPD0?=
 =?us-ascii?Q?CZa78D+2Aw4m4Gz+b/I5Z7jBnugSLnaNWcnhfvOIA4Y09/Jz013XtJjVS9bb?=
 =?us-ascii?Q?Am3b7F+Y5gTtg5FGglYPws4AjccgNbMwTY2NrK3iNx+77x4qXkxpCi/KDSmm?=
 =?us-ascii?Q?c+9ZpCUBhdoVCldxaTDWqJ51E1C6YjcOW3XabQm9Weoh2xDx/MpmKUs6P7y+?=
 =?us-ascii?Q?RjP6RyI9vjNYQ2Ezb++6aWUGA4QhpYODylNym2g+aoF6WyHvtMt+YqPmqHNC?=
 =?us-ascii?Q?MPlNf/zcWWvXyY94sSTGXUJK7EfHjelO4yynGbp0vkwps0/Nxs+yzYU2yEmx?=
 =?us-ascii?Q?GAIra0ben++OW/y8eIBwFCdCYmD9B9daQmlLUVmhEAVwIw3Jzm7LjWgELiII?=
 =?us-ascii?Q?B88OiAtQavY5/hy+angYsl9hpdZ8HkO8DWXuaqiVSdl+dKUMWutLNLzefMyE?=
 =?us-ascii?Q?b/ytfHOYJA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2cdf9d6-24c6-4eae-0f7b-08de551992b4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 16:09:05.9583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JayZHEzGKUvGY02uYZdXeJoZFnXAoEclzUB+1lpMDzp4VaZxpOiMSRJbcgv3SrXIon2LTUG6V4wEGcSzY4YsKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10945

On Fri, Jan 16, 2026 at 02:02:47PM +0100, Michael Riesch wrote:
> The Synopsys DesignWare MIPI CSI-2 Receiver is a CSI-2 bridge with
> one input port and one output port. It receives the data with the
> help of an external MIPI PHY (C-PHY or D-PHY) and passes it to e.g.,
> the Rockchip Video Capture (VICAP) block on recent Rockchip SoCs.
>
> Add a V4L2 subdevice driver for this unit.
>
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
...
> +
> +static inline struct dw_mipi_csi2_device *to_csi2(struct v4l2_subdev *sd)
> +{
> +	return container_of(sd, struct dw_mipi_csi2_device, sd);
> +}
> +
> +static inline __maybe_unused void

why need '__maybe_unused', needn't inline. compiler can auto decide and
report unused function if no 'inline'.

> +dw_mipi_csi2_write(struct dw_mipi_csi2_device *csi2, unsigned int addr, u32 val)
> +{
> +	writel(val, csi2->base_addr + addr);
> +}
> +
> +static inline __maybe_unused u32
> +dw_mipi_csi2_read(struct dw_mipi_csi2_device *csi2, unsigned int addr)
> +{
> +	return readl(csi2->base_addr + addr);
> +}
> +
> +static const struct dw_mipi_csi2_format *
> +dw_mipi_csi2_find_format(struct dw_mipi_csi2_device *csi2, u32 mbus_code)
> +{
> +	WARN_ON(csi2->formats_num == 0);
> +
> +	for (unsigned int i = 0; i < csi2->formats_num; i++) {
> +		const struct dw_mipi_csi2_format *format = &csi2->formats[i];
> +
> +		if (format->code == mbus_code)
> +			return format;
> +	}
> +
> +	return NULL;
> +}
> +
> +static int dw_mipi_csi2_start(struct dw_mipi_csi2_device *csi2)
> +{
> +	struct media_pad *source_pad;
> +	union phy_configure_opts opts;
> +	s64 link_freq;
> +	u32 control = 0;
> +	u32 lanes = csi2->lanes_num;
> +	int ret;

try keep reverise christmas tree order.

> +
> +	if (lanes < 1 || lanes > 4)
> +		return -EINVAL;
> +
...
> +
> +static int dw_mipi_csi2_register_notifier(struct dw_mipi_csi2_device *csi2)
> +{
> +	struct v4l2_async_connection *asd;
> +	struct v4l2_async_notifier *ntf = &csi2->notifier;
> +	struct v4l2_fwnode_endpoint vep;
> +	struct v4l2_subdev *sd = &csi2->sd;
> +	struct device *dev = csi2->dev;
> +	struct fwnode_handle *ep;
> +	int ret;
> +
> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);

use  struct fwnode_handle *ep __free(fwnode_handle) can simplify err
handler.

> +	if (!ep)
> +		return dev_err_probe(dev, -ENODEV, "failed to get endpoint\n");
> +
...
> +{
> +	struct media_pad *pads = csi2->pads;
> +	struct v4l2_subdev *sd = &csi2->sd;
> +	int ret;
> +
> +	ret = dw_mipi_csi2_register_notifier(csi2);
> +	if (ret)
> +		goto err;
> +
> +	v4l2_subdev_init(sd, &dw_mipi_csi2_ops);
> +	sd->dev = csi2->dev;
> +	sd->entity.ops = &dw_mipi_csi2_media_ops;
> +	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
> +	sd->internal_ops = &dw_mipi_csi2_internal_ops;
> +	sd->owner = THIS_MODULE;

I remeber needn't set owner, v4l2_async_register_subdev() do it for you.

> +	snprintf(sd->name, sizeof(sd->name), "dw-mipi-csi2 %s",
> +		 dev_name(csi2->dev));
> +
...
> +
> +static int dw_mipi_csi2_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct dw_mipi_csi2_device *csi2;
> +	int ret;
> +
> +	csi2 = devm_kzalloc(dev, sizeof(*csi2), GFP_KERNEL);
> +	if (!csi2)
> +		return -ENOMEM;
> +	csi2->dev = dev;
> +	dev_set_drvdata(dev, csi2);
> +
> +	csi2->base_addr = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(csi2->base_addr))
> +		return PTR_ERR(csi2->base_addr);
> +
> +	ret = devm_clk_bulk_get_all(dev, &csi2->clks);
> +	if (ret != DW_MIPI_CSI2_CLKS_MAX)
> +		return dev_err_probe(dev, -ENODEV, "failed to get clocks\n");
> +	csi2->clks_num = ret;
> +
> +	csi2->phy = devm_phy_get(dev, NULL);
> +	if (IS_ERR(csi2->phy))
> +		return dev_err_probe(dev, PTR_ERR(csi2->phy),
> +				     "failed to get MIPI CSI-2 PHY\n");
> +
> +	csi2->reset = devm_reset_control_get_exclusive(dev, NULL);
> +	if (IS_ERR(csi2->reset))
> +		return dev_err_probe(dev, PTR_ERR(csi2->reset),
> +				     "failed to get reset\n");
> +
> +	csi2->formats = formats;
> +	csi2->formats_num = ARRAY_SIZE(formats);
> +
> +	pm_runtime_enable(dev);

devm_pm_runtime_enable() will simple error handle.

> +
> +	ret = phy_init(csi2->phy);
> +	if (ret) {
> +		ret = dev_err_probe(dev, ret,
> +				    "failed to initialize MIPI CSI-2 PHY\n");
> +		goto err_pm_runtime_disable;
> +	}
> +
...
> +
> +static int dw_mipi_csi2_runtime_resume(struct device *dev)
> +{
> +	struct dw_mipi_csi2_device *csi2 = dev_get_drvdata(dev);
> +	int ret;
> +
> +	reset_control_assert(csi2->reset);
> +	udelay(5);

Now prefer use fsleep(), which auto choose difference sleep function
according to delay number.

> +	reset_control_deassert(csi2->reset);
> +
> +	ret = clk_bulk_prepare_enable(csi2->clks_num, csi2->clks);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clocks\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(dw_mipi_csi2_pm_ops,
> +				 dw_mipi_csi2_runtime_suspend,
> +				 dw_mipi_csi2_runtime_resume, NULL);
> +
> +static struct platform_driver dw_mipi_csi2_drv = {
> +	.driver = {
> +		.name = "dw-mipi-csi2",
> +		.of_match_table = dw_mipi_csi2_of_match,
> +		.pm = &dw_mipi_csi2_pm_ops,

pm_ptr( &dw_mipi_csi2_pm_ops)

Frank
> +	},
> +	.probe = dw_mipi_csi2_probe,
> +	.remove = dw_mipi_csi2_remove,
> +};
> +module_platform_driver(dw_mipi_csi2_drv);
> +
> +MODULE_DESCRIPTION("Synopsys DesignWare MIPI CSI-2 Receiver platform driver");
> +MODULE_LICENSE("GPL");
>
> --
> 2.39.5
>

