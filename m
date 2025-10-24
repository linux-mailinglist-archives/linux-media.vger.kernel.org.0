Return-Path: <linux-media+bounces-45525-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A083C068C6
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 15:42:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0147E5022FD
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 13:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9DA831D759;
	Fri, 24 Oct 2025 13:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QES+ZAI8"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013008.outbound.protection.outlook.com [40.107.162.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5401F2E1C4E;
	Fri, 24 Oct 2025 13:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761313323; cv=fail; b=Fa965Gb349jlFFuAIe8KHYT9eWX/+sUcZIoMeTFSitBAMDal9SHKCXgDcKX51pFgAzsNGgGGR7sI6GP+htpEXNwK9ZCGxTazDWlz9UPSD2MENifthVpFfqRWTQCtXdCNHYlV1nr47N9qi3aQ9Q+P0l2f1MzKcrRn+6qgHFCGkZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761313323; c=relaxed/simple;
	bh=OzvYoB41el5TCAnPOzC8yjWKTLGekHuP+pLgW2b9ZXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=a3cdFQw9VDA2CVli3OmaFBZha9VwkOUkHtEWI4i84hq53EpNH6gzT83nFHt8bX6igR0BfI6oZXVvpO6XQdCI5+3EgbzNrUHTosBhtKN2Cq588XNGYJaRIZy+WIwFyIeFI6DZyy5en80HFn+O0Tgle3i1WydHrAHe/rncz5xElmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QES+ZAI8; arc=fail smtp.client-ip=40.107.162.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OdGh0MzlbiRNN60TSzxFikRTZNUi/zxOSGTU2NpuBf5f4hgCyyhCSXfq644P/t4Ic5Oh/E9A/RWvq0Sg81ZYNrUbKWGGg832xVmNWa5IJIPtLcZT8cbU2vN2I9nbYH3EZvLVVvG274o0mjnrcZNMXPBwMGDZN2jq6AvJi6pIzpD+fnzQWitX2Z3uMC1v2afhzEmjZK2xAZTncQ6re6YL3C+tfkSNsG2iIWeyKMBoKPW5pqscJBc4SJMpHYwJoTjUFJqfCjIofThWBjbTpHLG42DdbGMfVgkhCvXwdM82T8audbFTj7SJztkvVGwZRoEmcG8b6pdG7SoSs7GLtwN3iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WFYF6wvp6vvlzuXOhTIaa29nXPDBT3vubb0gODlLDbU=;
 b=DGW2CnpoGgHEjMCUERHmI4UN1Xq9tjFD32bgVlL0lnpOqOt5WTs+BAP23CV5T9cxKwpbD6qIbgqpJk/E4SmXwzvujQjUZNswj5lom+WVAypxKAZQWs2HiFGgets1iy/cCUM8TR4tCtyQwlf+3MVhAByEMPRxVNTrT5NcCQp3mJfDdlW4BdEkGCsCpgVIhsJXdicPyttyka4J4upQvyVMj0VOxwQnZZUkJdFSxe/N5yJ3i179u1Ll2q3G9mW956yrtlMi09oR96ESQejrinfv3DiQx138Wc/hwGbxl1I2nY/gCcMufqC+Pp8YA7sor5NowLCbWaSXGB3CbzDTU0/wEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WFYF6wvp6vvlzuXOhTIaa29nXPDBT3vubb0gODlLDbU=;
 b=QES+ZAI8XtlabNNpCOZrIthVuTgcLatfZTEVgLc47wF/f2WfZXvnq41p4zO2ttzGoAnK25jtFfYP0d7myY+26hEqqp+p3/bYqouXo8ZKNT3J2on8x87GJsQ/FV5/8YKnDC1qTlh0VhXtCYdOHj9j2+WmORljpmSZb2ROhWLNMXhRDPEhC4ZJ1lzyZ1SIUqiKuDNV9in/KyIvvlVAHpu5Z+dcXolEGmy+e2+Ogcoyw1MaXetkzfZ/XdqYzNxlhOA+zL2V1NzJwHJnF0r2Pcvu18n6LXqTb3nHu5xZ/JeWZ0qUO3PXP/GNiRh8fmZbf8BBkMBg3rQAdBCm/bXT+Mm+9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM0PR04MB6771.eurprd04.prod.outlook.com (2603:10a6:208:18d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 13:41:58 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 13:41:58 +0000
Date: Fri, 24 Oct 2025 09:41:50 -0400
From: Frank Li <Frank.li@nxp.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH 2/3] media: nxp: imx8-isi: Keep the default value for
 BLANK_PXL field
Message-ID: <aPuCHltyz9Ed7wcF@lizhi-Precision-Tower-5810>
References: <20251024-isi_imx95-v1-0-3ad1af7c3d61@nxp.com>
 <20251024-isi_imx95-v1-2-3ad1af7c3d61@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024-isi_imx95-v1-2-3ad1af7c3d61@nxp.com>
X-ClientProxiedBy: PH7PR10CA0015.namprd10.prod.outlook.com
 (2603:10b6:510:23d::17) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM0PR04MB6771:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fdb3348-20b0-456d-37bc-08de13031a62
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?5aHXtxvMAkTYFXsrd9PX0BVMvAbXtL4i/D+LBpNICCMsNjz9tOfEMaiXQF1v?=
 =?us-ascii?Q?Aqpt0xNmMww6P8ywSAVO8soC1Rgj1JSaxy97c9hZvlItv6XnI0xbfaJwBL4o?=
 =?us-ascii?Q?Ns2xb087RzHylZwwyYa6X/vPUdYkforw4FfSfRaeoe+PrMRsw+ajx3VmxSXx?=
 =?us-ascii?Q?KAExWfHDCIu0F+CaXEASydNeHXMTgvSawvRafhRWMl8YK4Whwe5MHLTmr8/U?=
 =?us-ascii?Q?0FTjR/xx3WYLU9UHvU03m2LSvCxXlIAitxE7S8XokFnAS1odtYBUdnXbbwET?=
 =?us-ascii?Q?iaNgEt/jlp3sHdU93iVAMDZqztY42ztinJEsIg9OAKS2c8WsyISAVqBGyMOj?=
 =?us-ascii?Q?PWmO0efA0hDUxFmEcWPGOMwm0TOKy3wiO37P8nzhM/aTFvZBCpMAwqNrE9YP?=
 =?us-ascii?Q?sgfQkHroTjgtRIOK3lYLdDnOOt5Ds52rD2r6P7kOsdfG/v6rrZ8FvltCJOsm?=
 =?us-ascii?Q?k6rEQVQLNvnEf9s/MSH8V//gyBYK+k3CUkihOR28mJHY6mDLY1cYAyOJoi0m?=
 =?us-ascii?Q?5/KUknxPg6fw6ueApUdlnTt7KRPRX3QBO3BJBtr2U3F6GVknJqvaoGzLcEsN?=
 =?us-ascii?Q?E7RSSf4tkLBbFfOW7Vm7EkDwuCpaZulzrqNkoBEpgWnnCDz+iJHsqsbtQ0ns?=
 =?us-ascii?Q?H1XBvb1d10Y/FMmRhiOQ4X69sP890Yh46+40CfQqLqXkpUPsK2eTqK5eziim?=
 =?us-ascii?Q?R+nOXrU/XTAC1ztNAEiu/RYlPZ5h3r7OzY+/5jCWvcG5yW3ycQZ87qX+ccie?=
 =?us-ascii?Q?J6OyfyQ7mIMxUJbO/lbvWl0+rVujbFUCJx9h6S34FSzj65sSHOFUVfEUcnnR?=
 =?us-ascii?Q?seby4pUAwupEiaI28E38WnYhbsIOTS1184KSPfjId7Xr+mJhI/mL9pCNEkiP?=
 =?us-ascii?Q?dvcVe8maIBcFF1k/eog4wUT/WrEX2pwMu/EGPx+lrfBUhhVBl+I4TjZPEaBE?=
 =?us-ascii?Q?S9NXZ1RU/GbXKYpes8YSmY0dQ6cwrmRddESO8jza70+pi3Azck9Q344PXAvt?=
 =?us-ascii?Q?gGaXJQFOFT7INh1mdqYbTmulLAeVSVHpV6S6gc/IElJLYvfcUzYqxbvntWh9?=
 =?us-ascii?Q?s+l+T7RosQO/S3Ocb3Mg+lmmEAZDbCgrrfLuSNhwgK/SWSnDO9cmix8uj32B?=
 =?us-ascii?Q?d2JZsB+1fVUIK0devn3JXj2KRJUzusfspDsECLIGXkKRehvVrY+03+GjNXSM?=
 =?us-ascii?Q?xG/rzxLbf7srNJcDu3yd8OcWlpmX1NOrjApDVXYVi3JGztvOMxU17GOYHB+5?=
 =?us-ascii?Q?emhqPm4GyGD46qFvp9PluOuW6UQOXZ8bfWOHIRUZEbbBVxFvB9whCPo+VwP8?=
 =?us-ascii?Q?RIQlPobnfSMoEsRRJ03v3SUXDS7c2mrPQuIJeTBPTRyjHReMx+w/tOxcEgyj?=
 =?us-ascii?Q?YBCwu9nhqSm5BwG0DNehogRdv7/0ZsPuev2F/HyJm7yYbeCulE9wfFT0o/20?=
 =?us-ascii?Q?SxL2U3q4fxfEdIQgT9IFvxFIQH9Nx/L6I+JxCYGtNIcr3dKUc+bVBVt1i0eO?=
 =?us-ascii?Q?B65MN7Dulju765oMSiaTo73SNm3X/PW74NOu?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?zFdkoL2eBGBG+n8EjGQ4rYpQkDv7IocFSuDzFsFiD5TvIhNEyopKLRcDmeT1?=
 =?us-ascii?Q?S7vJs39zWR/mJXQAmd1wr0XE6GjQugU80seHwlseA04ioDcJfp5zT4HFZRFZ?=
 =?us-ascii?Q?ghuFdbhvYrSEzt7dXNZs6DWykWjGXSR2xCeXW5qA+3yEsPA69RWZyPDJuG6/?=
 =?us-ascii?Q?yO6rX7uqsHfdGMzy6f0a+WV7TZHa/R9KyXIb3gQRs+2CckHMiDTvuO6pgmpj?=
 =?us-ascii?Q?TAVhvIY3qF26suK3DXIdNqOdGPcV2/jz3u+09FZrLXYFJZskBae6aba1fs2p?=
 =?us-ascii?Q?QUwFrptbtsgSE83mk2/ROJSe/joLNeosG6fnrw5NssoSnCnWhD489922qElb?=
 =?us-ascii?Q?vhgueD+npLiv3Rk1xS4XvsyDyOQjl2pwzkTTi8uobpX6ctEanj3AxRIuxqeV?=
 =?us-ascii?Q?baqJmJU8tkX0ucW974H9kN+uNDW8uhTIA6j4qEBFYAfFrfJk7hUPGTsoaGfY?=
 =?us-ascii?Q?o7LuKprk+CTaPpEvdng8Hw0xwbmvJvJ+1aprbiZ04gGhJ26mTWSqZRAsKr8M?=
 =?us-ascii?Q?tMXajSPacBkX4y9hfrw9Md4lDnbkXgtxilwMvkzlHU7sNE/Da7yUnwqWyS7C?=
 =?us-ascii?Q?UbmzNqoMfAD6wKzmReFujFlirekHOsZ3k6YYfGbjwmTvKsF8yYXoaevlUoi9?=
 =?us-ascii?Q?4cMQCB8fTRLyyPH+3454dXfPeNgT4muwT1UEbf+hndL7h05FO4s8j85jVhlO?=
 =?us-ascii?Q?A+Jjn4egu7E+/sTibHO492a/1j383N+ufT7pjKdHSWdyTQsJbaa308cJuw0i?=
 =?us-ascii?Q?QsvuMnl815OPbFpQPWZF0W4wSghathdcTL2wrHd1CvIU/uGr42TLZ2sJT50b?=
 =?us-ascii?Q?sfTb9Ln4M+iLxxEB1e6uD4oQInxKWTg+g/D5IZsCvE0zNdS6CyEUb0218TTU?=
 =?us-ascii?Q?RFv6QVUMSCz+FJexKQrRNM00PusZwsEfrE8ycyAkRYmk4SJxbFkBDvoZeydV?=
 =?us-ascii?Q?C/kGP7th7pEcnc/VEosTssUTMwhHHTJK4NdaKs51BCJed4R/GhF73p+V27sM?=
 =?us-ascii?Q?403RKT+7zstuOHIRJBXQY/5AQ7iX30rW5xBB9c0CXBtqbljPoXdcooaX1PE5?=
 =?us-ascii?Q?DIPnbgBW4EbJJEWIG2aTpl3euvWzSLsXXS7HVh2mKA6tAv3X2UWtt4pRNiN5?=
 =?us-ascii?Q?+cd3rNuO7yBSnkYN9ygzcjJm1057Iaimsdl3ucXvWzd3gV4oiivFk/KzmBIe?=
 =?us-ascii?Q?ViQZ6xcY3dqglk08N90/WI2MYFfUV5srI0B949ZsFyg++qh9+2kSOZuvS4ew?=
 =?us-ascii?Q?BnLS/NasxijSzD77Ttps/SEuZaGYGX5VuMzBlgUM7uVNDUNlUz/rbX6L5lu0?=
 =?us-ascii?Q?Epl5LrnSF6zKzz+momUYCCa6t4BMn2YSU7jolWloa1JmZp8BEC8ldnUiAOFq?=
 =?us-ascii?Q?LJ418QVyNGkdhq3eLq5oPMJ1VfkywEO9ppEpOmsx94C9MXgVo0iGM4pEH+sp?=
 =?us-ascii?Q?C8kQL5IzROFCAQCTYVoJzp7r1jyNe8BNmR2nH9+3pRLkfaX4uI1J//GaDkZm?=
 =?us-ascii?Q?TjpvPAYXnN2ZEGzgluI/74gaZhFUU7u2TXZyK/dok6ueuDWnwKa/bRb5urMc?=
 =?us-ascii?Q?sbQwQZoeliqX9z3nE3UXGv3iDPLHcJG4PuzRZThT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fdb3348-20b0-456d-37bc-08de13031a62
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 13:41:58.3235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5+sEomGMSD4DmPpSthyJdWkAv0Tv48ge+U499tqvXf4BK+ouWENwhIy5sojngvGMPbXQHtVr0u9GInoh4HAVyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6771

On Fri, Oct 24, 2025 at 05:46:53PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
>
> The field provides the value of the blank pixel to be inserted in the

The field BLANK_PXL provides

> image in case an overflow error occurs in the output buffers of the
> channel. Its default value is 0xff, so no need to set again.
>
> Besides, the field only exist in i.MX8QM/XP ISI version. Other versions
> like mscale series, remove the field since it won't send data to AXI bus
> when overflow error occurs and set the field as reserved. i.MX9 series

mark BLANK_PXL as reserved. i.MX9 series use it for other purposes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> use the field as other purposes.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> index 9225a7ac1c3ee7e42e64983982eb4b6c27e356fe..0187d4ab97e8e28fca9013f6864a094e08f2c570 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> @@ -309,8 +309,8 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
>
>  	val = mxc_isi_read(pipe, CHNL_CTRL);
>  	val &= ~(CHNL_CTRL_CHNL_BYPASS | CHNL_CTRL_CHAIN_BUF_MASK |
> -		 CHNL_CTRL_BLANK_PXL_MASK | CHNL_CTRL_SRC_TYPE_MASK |
> -		 CHNL_CTRL_MIPI_VC_ID_MASK | CHNL_CTRL_SRC_INPUT_MASK);
> +		 CHNL_CTRL_SRC_TYPE_MASK | CHNL_CTRL_MIPI_VC_ID_MASK |
> +		 CHNL_CTRL_SRC_INPUT_MASK);
>
>  	/*
>  	 * If no scaling or color space conversion is needed, bypass the
> @@ -323,8 +323,6 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
>  	if (pipe->chained)
>  		val |= CHNL_CTRL_CHAIN_BUF(CHNL_CTRL_CHAIN_BUF_2_CHAIN);
>
> -	val |= CHNL_CTRL_BLANK_PXL(0xff);
> -
>  	/* Input source (including VC configuration for CSI-2) */
>  	if (input == MXC_ISI_INPUT_MEM) {
>  		/*
>
> --
> 2.34.1
>

