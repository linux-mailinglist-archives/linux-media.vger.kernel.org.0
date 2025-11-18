Return-Path: <linux-media+bounces-47329-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 826C4C6BD39
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 23:09:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0592A367099
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 22:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA7372F99BC;
	Tue, 18 Nov 2025 22:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="guacJS7U"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013029.outbound.protection.outlook.com [40.107.159.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFE32F7AA3;
	Tue, 18 Nov 2025 22:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763503744; cv=fail; b=K0llrLe1PW/SMZgaiUjUfMojDdBY/YgEKb206mi3+6YcF92boGNEtsV+yHaK1mx1OCp8u6D9DecbpkCGm9UBitUsxcdk4u0vVkIeIV/sIaQ8PIyBva0MX3gGCvsYTrtzEXaz67kVi+Nkpi3gUMDw5nUSOvVI5nk3bP7fz1f5dh4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763503744; c=relaxed/simple;
	bh=BGmergjSowYr4KYszoKQbUNddWJ+6/zaeowFy8YpW/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RGeQ9EAf8E7LOSiYna8HAb6IdCwIBnPUpMm3dnhDBScyI8QA/yCWKU0V6wbyFkuEtbu3MS4Whju2lnJGFSzs4in4nh+a8sv5NmQeiV3InBY2iMOyQCYgZVfYyI+hClc4ico+Og/j1BBMgH4nV8qjTR+ksptfkh0ZX/9ygaa95N4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=guacJS7U; arc=fail smtp.client-ip=40.107.159.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dkBDDl9X/JfOCRNPFQaONcebd5RPfsfIoon3OTznprANeC/IBNE8PKH48TXNIPYzHtCv1ypLsRcF4l4HlfURnpiR6n6uBNL4QPZMJ0w0cHcOO/H4JtD0Bc+Z7/sG8RmC+u8gzY79xxk7tBaILgc54lRHayFZgq0KxK8qO+qtyXUdXpU/4esm+tFca+g93W88i00qAF+Zx5M5rX+AMS2gk78tYrhQHhSerDr54QiRm3DsAGANfaC8KVUCY4Fb3ZyzqgrC3ai5bJNFQnYKqhTskp1GDGaaWZKymCAQrk8WYhqcPtUMQxNfgmDoaBgRgR1OTpu1RJnxiPYJQDSZ8yxeTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X6mUgZ4ZevdFG3JLNBAo7BMj6krIfrMfU26sB0nVN5o=;
 b=wkoHBG1SWhsubysZaJJCrABRHuqvwcg6i4gSnsCFgmEzJVShGbEcPdsd670whBbcAPdK/WIcWKXJs9gFsgApzE6lYF+bLTB2NmEMql0JQvLwKUooySeU61ak3VO+R/VembFKyAdgwTAl2mV7b13FGTPYIutyBId2jGzRgJarjEHW3NTyyifHzYkvZJPQMehbR+cPHJrorHiqTf588XESGwqZgEmuXD8qN49ReGOHQjIV6ar/2BOxgWPUNpbyBX8tl8M0JloawdIkzxoGBqKpFTGRIk9VCXwHNihlIFfi8prVJjZuPqMqnsDtk/JXPLw6XIbgD+cKzy769IfuL6+adA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X6mUgZ4ZevdFG3JLNBAo7BMj6krIfrMfU26sB0nVN5o=;
 b=guacJS7U2g/k9fRG4xYlAHqp4ZUitFD66fmGZ1pL4EzSldKaNdPAwYiwiUzUJQ1Y+z49OuJUz7FHmBH38DG14fNaRE5hxX9jMzqAcLqG0l38qz1mTWrxlErgbB2C9jfuyW+P+8j9hlFpjxJNtUWP8jXSjD5vm/2Mgyi4eC9MgmYzfvRNjylfu2JFSpuAOA8PJXuRActC5sXBY9uTmO/Aw4WyFm8bw32lCbc4A7fQBF1ryKGW6kuAIq/a8ZuiZvdCxHsE1mHzQp4auaml9wrQ24JO2xoYOAAO4SKLADyRarsArADDEzQjhwVUsuDCoStELuprxohwFmxl7MpJHICNww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by MRWPR04MB11998.eurprd04.prod.outlook.com (2603:10a6:501:96::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 22:08:56 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 22:08:56 +0000
Date: Tue, 18 Nov 2025 17:08:47 -0500
From: Frank Li <Frank.li@nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
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
Subject: Re: [PATCH v2 2/3] media: rockchip: add driver for the rockchip mipi
 csi-2 receiver
Message-ID: <aRzub5Ak6DZpO5f/@lizhi-Precision-Tower-5810>
References: <20251114-rockchip-mipi-receiver-v2-0-eb9b43377fc4@collabora.com>
 <20251114-rockchip-mipi-receiver-v2-2-eb9b43377fc4@collabora.com>
 <aRyplYZOrGsSxSlp@lizhi-Precision-Tower-5810>
 <554971e1-6fde-4b2c-a2de-fe178358a4e3@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <554971e1-6fde-4b2c-a2de-fe178358a4e3@collabora.com>
X-ClientProxiedBy: BY3PR10CA0017.namprd10.prod.outlook.com
 (2603:10b6:a03:255::22) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|MRWPR04MB11998:EE_
X-MS-Office365-Filtering-Correlation-Id: 6859689e-1d42-49d6-f6e1-08de26ef114d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|52116014|19092799006|7416014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?7i0iB2zuOgtkoEihNVxR2gSFhB0eaTBjVdrb+S6eExC9TNMudUbUg8IOsMl2?=
 =?us-ascii?Q?5psbeN/gU04GoshmFimKPvxYYzdmKUqpXK/HmsI3DBFIiB41vp8ttMKh3ZhF?=
 =?us-ascii?Q?KqhHyVXbn/svAmS8geNm2YJi4CDgF83o+/HSHglwyePUBlGe91EdGAO0RvRm?=
 =?us-ascii?Q?C2B8u8CFL/G+DRjrZwB+bUvin9NlZGctM+7HdeoOzWNXNGKmANcJF/zE/dTb?=
 =?us-ascii?Q?BoGAv0tYNFL5emH5vgPWpmHCFrIBOn0JLinBA+C4zafNzX0EpRoCQCwNa8Jr?=
 =?us-ascii?Q?xbrn3gnuX48hbs1zLfNy+vbOMDMTUGUzfo9O68M5x5LMNtvzkfTB0UWLdSTE?=
 =?us-ascii?Q?00xvIv8LXVsk8Ry/yz9I3qAnooh/2NsyeLm6vVln0/1JL2/HqvCQVJA01ICd?=
 =?us-ascii?Q?yHu3nQFXPaQ44hKvekGdRflj+nYP9CfirtVlTE6aW9nPyLT4AjHfBDTG27rN?=
 =?us-ascii?Q?+qC3P1srlEDR3lwN+SYrHpfr9qb4AQGRw+zvaRhBi20237scuP2Wvlpg2yty?=
 =?us-ascii?Q?fTwQWuLMHgcmVfiMDBH2LJsiZDxonCJi01y2LnkvAx/fe9XlaPlKI4+SLp1P?=
 =?us-ascii?Q?21ZpMoc5H6y1pBdjAD+R2U85q6XP7WFcKWZXrRkbmsctwEqBJd9w1gy4koM7?=
 =?us-ascii?Q?JtR2a85XW/jZ6YAQyUijKb4FapEETtkvqI0EP+ngrNL+//6xlmM+RG90Np0L?=
 =?us-ascii?Q?T7dFnWNVSuylPlGW76RE/QtyYGJCK+v3JJrHYV0ienyv1gvESSMeDdc/bSjj?=
 =?us-ascii?Q?P4AK1QYSSFkCL5MeeW/UM56QSEQRxx2Ks9lAhWfrOtuqYIb3KT6wz/+q772n?=
 =?us-ascii?Q?8UEppJ7pGXBs9DvG6IMvv23U0JJCB8HvCuu9T6+XTDpgA6y71iflUCTthCd8?=
 =?us-ascii?Q?TlVTd7X5M82U7bMsVguQ/tEp1eqYxMScw8Lt+JK3yyClR72fk8FwXqtrmR/9?=
 =?us-ascii?Q?pReBzDDZYh57Vu/SxaxhY7tjY/kUqj1F03tgWGzJoctLIGoCd0y+iOgXOgA/?=
 =?us-ascii?Q?tWrSl/WiExUsICx3sun42Gxmxt7vwzTEfqdfrUHI2zCyJmZO26GIPWrFvCJT?=
 =?us-ascii?Q?MC8tu+MvQJ42e/4vPTFqQrYHXOUV5/NbJlsbUKzkLi28Nej5tyvVXZgVlToD?=
 =?us-ascii?Q?SShifq00AnAazwNo9wsKdpsukdQ3LkHhrhALNJ7Eu6xY8ykGw/llrZYOg0xt?=
 =?us-ascii?Q?Vk9MrsVnZq+IyDlh9qqsGD3W1MV4UX9PnJU7RoRiYkpPNVIKyiE2kwGh+pN7?=
 =?us-ascii?Q?Ddc0SIhmPpRezM+wd9tfHfmzSFX4twlKVTgLM2IWqkjQEKrGOh8TX8qN4NBl?=
 =?us-ascii?Q?Ke8mUmTeO9ot29uAfX0TVIQvnYmYHAmIS8rjZinpud5ArJw2XCcaJMdBv7tA?=
 =?us-ascii?Q?uCE5APeQYxwLokqepP9RC4exLj7Zk1nmb/drz6+F4HfM9AofPk4j7mR91b0U?=
 =?us-ascii?Q?Ul2wzj18AaUE5dwwe1daSZpBIc5wvzzCxtYiP5i64LBQRoS1OpMZbMH95zt8?=
 =?us-ascii?Q?QZYKQExZA4oEYaeXCxrCgOawLsYL0Ih25uWpA/3NP0F40/xDcGLaGFT4Lg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(19092799006)(7416014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?5HwP99tZNpecWHMJfzv+EOTQE1llK8edy+OcXyhXFaDyf2k6ZiISBzXqSl8u?=
 =?us-ascii?Q?z/b/GS4dQDOWGqc1NKpzbcbdgLochDESOvuUUScOLm12ATk1mKLIsK2ozmBg?=
 =?us-ascii?Q?rxD5ytTCLTTiVTnsxYKRbvOyaLUcTeVXGKTCBjSluRY/aZq7Hyh+ZvViDaMB?=
 =?us-ascii?Q?tOCAFV0tSAMS4ItOqFrtZKUz0CnGaFSVREAEKVk+CHI8OotHfn2Ho2YaMkLv?=
 =?us-ascii?Q?hYDU+DLYcvZOmCCCxekhKh1Z5EWkqVwwzW89EVykgO6CAC2O7+CqKan4YwAp?=
 =?us-ascii?Q?7wIoSrK+HCcEivSUnKXjAfCKpTDd8yXBrIt8pE7QZagrG0XJdhf53z0Xv6In?=
 =?us-ascii?Q?zjnD6F4lsrkWTf2JxM4g2YeD3PsbZ2Fbx6XACpKCXtji7wL0EuFxNdmgVylZ?=
 =?us-ascii?Q?NhnJZwQtEYq8RB8/BGhichbI7PfCUHLYHXDbwvdQJTzF1IDn7s9uxADAPSuK?=
 =?us-ascii?Q?+bNMSbcIrWNpod34zUqmell1jsggracvXDrRg1ZxMz178LBS859EsH1KDNBk?=
 =?us-ascii?Q?rxXxQFT10kA4JZjTaxC3wRI6P84cPJ+9xQAYe5iCooLDbslEftg2FHA0tDZg?=
 =?us-ascii?Q?lOysKU2IJNTPn2HJkqUgpj8iji53XhSPgFDonn/0+4G6DI5hJxP31Fn9Ogw8?=
 =?us-ascii?Q?RRoFxVurCDeNxA3qRSQgUG6Ov2xKmocQPwJCdBZ9XRkD9Ng93vPGKk25bW3y?=
 =?us-ascii?Q?G48akEPWS3hqc8N1TMar7qGK33dYJXjgh1q+wrwzzFX+EuWhVthd+B/3/lpd?=
 =?us-ascii?Q?jF1C9+B/CXopPHN4hFPpFW+dhUoIWNZF0rvEFzxzmWmhC/xyrPByJDFwvm1w?=
 =?us-ascii?Q?/2Jz8oqkLMOxVOGVSuY9VfslSBy0+bSnEekHnflSv5yinNaYxBDjQ3LykdxW?=
 =?us-ascii?Q?gYsHeV8bZz2WObCwxDBSZHT+yxordJJnQikciNsfCVxM33S0DOPHn4Vd6GPu?=
 =?us-ascii?Q?3w3T57bw5gGvYWJ3R3wNgyR/4a3gbLdptBK3EW8RJ2XIhlcJf0GNodCrDDLa?=
 =?us-ascii?Q?D1QR0JbTUxTyzMvAuJQFEcKhWFarpAa0Nd5nXYf4Iza+em8Bzooji1l9hgEd?=
 =?us-ascii?Q?t8+F0zx/TcqrB98OiNeR47FRNUWJq6+z9XqEPWZyiqXFOiIWyQ+FHfblDIWY?=
 =?us-ascii?Q?iyw8s/sqHSmSueOqcF6f+Vnb2iJGIpivhnlS0GQH8uuHdTNIOYBw0GzLYwnM?=
 =?us-ascii?Q?DxzTYajqwFuIb+wL+Pn0nVWtlfpzyW5mNkvmUcyg4nZ+KdCf1YJCrOO9whEv?=
 =?us-ascii?Q?V33xVjkyw/ZQ4/6eN2nGA9JNN5T9o2Xv4OHlJaLnI6J6sP+jN7gIKsrs3lHD?=
 =?us-ascii?Q?wRZDPJxYhdW3Mjuico74zbGDE8onlI8YkLJax0gHLISylys0XtYv3+kGKOyp?=
 =?us-ascii?Q?Bi6GyZJu7mDh+l7F623oZdtuHpPTQM5omo7PHzQiYuQ+qBxwraHrQVbwbCxB?=
 =?us-ascii?Q?bFd5FeEax3/Y+TpUB5Y2yH2sNEv8FdjIByolmbdW/epjZPTTP1SJh2bvUd9B?=
 =?us-ascii?Q?/N3zUsbwERC5RMT68l6TpuuYiAy9r12e2MXCpr2yjebq02Uetkx6HnhnfS4Q?=
 =?us-ascii?Q?pccNoVLjG3swi61oFrY=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6859689e-1d42-49d6-f6e1-08de26ef114d
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 22:08:56.5770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VKgsgrZINSNLlQPERyrIQd9Z62jQyST6neb1cMDx6Q0Ms5beOq2HUweCSXgDCiWf8/pdXIyDJ2nH2VgC2OHihA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB11998

On Tue, Nov 18, 2025 at 07:59:14PM +0100, Michael Riesch wrote:
> Hi Frank,
>
> On 11/18/25 18:15, Frank Li wrote:
> > On Tue, Nov 18, 2025 at 12:12:26PM +0100, Michael Riesch via B4 Relay wrote:
> >> From: Michael Riesch <michael.riesch@collabora.com>
> >>
> >>[...]
> >> +#define CSI2HOST_N_LANES     0x04
> >> +#define CSI2HOST_CSI2_RESETN 0x10
> >> +#define CSI2HOST_PHY_STATE   0x14
> >> +#define CSI2HOST_ERR1	     0x20
> >> +#define CSI2HOST_ERR2	     0x24
> >> +#define CSI2HOST_MSK1	     0x28
> >> +#define CSI2HOST_MSK2	     0x2c
> >> +#define CSI2HOST_CONTROL     0x40
> >
> > Look like that is designware CSI2 controller, can we build common library
> > for all dwc csi2 controller, instead of every vendor create individual one.
> >
> > First try at
> > https://lore.kernel.org/linux-media/20250821-95_cam-v3-21-c9286fbb34b9@nxp.com/
> >
> > Toshiba have similar patch
> > https://lore.kernel.org/linux-media/aPZd39riAxqfw3mT@lizhi-Precision-Tower-5810/
> >
> > Frank
>
> This has been discussed already a while ago:
> https://lore.kernel.org/all/20250507083837.GA11152@pendragon.ideasonboard.com/

https://lore.kernel.org/all/20250702093806.GF16835@pendragon.ideasonboard.com/

Laurent Pinchart prevent imx93 DWC CSI2 driver at Jul, your discussion at
May, I think Laurent Pinchart change the mind.

We can choose not base on imx6, but we should create a standard dwc2 under
drivers/media/platform/synopsys/

Laurent Pinchart:

	Can you provide direction?

Frank

>
> Bottom line from Laurent:
>
> "Let's keep this driver Rockchip-specific then. Thanks for checking."
>
> >  [...]
> Best regards,
> Michael

