Return-Path: <linux-media+bounces-25500-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 059A9A244B8
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 22:34:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EFF8164615
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 21:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65CD01F3FFA;
	Fri, 31 Jan 2025 21:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KDzwKRYW"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013069.outbound.protection.outlook.com [40.107.162.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB061F3FD1;
	Fri, 31 Jan 2025 21:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738359258; cv=fail; b=f6EX4/pMjfEIR5AU1vp6QtsRczXvl0ZM4CIio3CctaCzFPuTpJYc6v6BTa+kyz9fH/lDQA2FLGdDUDqMRmxqBHVNIqLvQBELv9cgtoJ2vRWfwDb7rhGWD/geHAcBVrn8vpUvvjUwZx8j+W0VUehl7nLMd740fW8VKQgkB4Uks10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738359258; c=relaxed/simple;
	bh=+BgABT5JD6se100o47vkNG0fbS5GR0FL8Pokmor2dOA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Rl7hBJVTF/9Tq/Tbbrn4lcpyTner9ZzxnRJhTYhHKjAzPHOmzwqTmkzUdXyE44dwYku0l47qPu1nnlY7W192egwE4tzsCaif29z5BpEzqaTUdgt2bxlM/bpPECiDEtkFTfM5GpHK18Dfh9VWA4NiItQJd/Yub9NvL/Tl18cgIEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KDzwKRYW; arc=fail smtp.client-ip=40.107.162.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V53kcnMbPDHsA+NO/1o7aXf/UE8G5xLMCZYijstXz/Dp840ZPnmS39FxA+dZraidCFobUAIff9aIo3h0Irpj9znfd7bLhzI4QvALVQRT9csR/qucNFcj2RSuiHlHJgJEZU46NDd58bGMdsu85GOT1MYwW+KtWxP1nharEewanVykrKzx6PsKpdZLt+bkPBueKvhuM2fLnMkEG/u6sPxbZPJnjs6Ma9+aC4NclpffjBLxKuEZiJJp6dtuuNz/Jb5fMaHG35P1w6cVhbcEa1enoIdl5d/KcVKgcm92Nqlv3o5uNBODevgyq60MZKJWFIbDYxeLk1xMMU2iBDtV63FsPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SYGMufDbyyPYD5KZ53Pip7wlOJ+1f4P12+/SG/z8hhs=;
 b=sn5/XhmTJvA4dnXW0yYkPgPCjICB9qnaqdB4KW1DrXwqp2PFj3V2NdzPWJ4+cLUzdh+8P+yyJDU52U2v6nXC7y2hhWUamHGPYWG77GCCb28f2LCHq5yORIJX6Hk8p31Hx3t7uRHv6J5V8csilUNcgg1b7FHz+LZB74BnU8v+wWzum7EBRkdvJzD5/Cmgqf9uo5Ont2oL51NYbsa4noxiGs/4k1mwQYBdfwtBdhhYYIKtCUGx3u+zLlqlASxQ0cC05j1o5wmzwPEFUydcliwCmive5kqI0wjPyTtDBWNNfPxVcdHPHETN4Kwvgk8OOAE40Edkclr68I77qpOais2OHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SYGMufDbyyPYD5KZ53Pip7wlOJ+1f4P12+/SG/z8hhs=;
 b=KDzwKRYW1fGGb/nkHpEHmDr61cPlvVLQspuz/C0CZvFp8QW4v/snn0/AvoeAMnOF/VSWIc4naPiDWQ7aJVctRdpT1PkI+RmcHTFP62DwfnUbZTYyWHj989GJISac3lyCPY3QAwW6gL2MPdtAYuVVaAqs57pHlZy06Mg4eqnHc3zi+PmBtjhJfcRxIm2dwkihXprBrBevrADBZOiwsI6Ek2k15lxdwa9k/2MWNx3Do9pV7AtJz++KCzu84AoCcZ/4S58NakpzlEF/iDJeWw1TvGmkf/eF+Ja82Id0cRoyinXvmq6H2wFH6jY3Kx8kAl9BYcT1brqOm8HNj2FbyFl0GQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB10980.eurprd04.prod.outlook.com (2603:10a6:800:274::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Fri, 31 Jan
 2025 21:34:13 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 21:34:12 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 31 Jan 2025 16:33:47 -0500
Subject: [PATCH 02/14] phy: freescale: Add MIPI CSI PHY driver for i.MX8Q
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-8qxp_camera-v1-2-319402ab606a@nxp.com>
References: <20250131-8qxp_camera-v1-0-319402ab606a@nxp.com>
In-Reply-To: <20250131-8qxp_camera-v1-0-319402ab606a@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>, Robby Cai <robby.cai@nxp.com>, 
 Robert Chiras <robert.chiras@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738359234; l=10265;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=+BgABT5JD6se100o47vkNG0fbS5GR0FL8Pokmor2dOA=;
 b=Am1gLfOJ7I57mr7o3CjV2+LttO+h0zYGVcZn9d+GP5VXGMQEDmC0Bs8oOVM0GlidmSh4y8wuv
 n+5sdIrT/dJD9RRcqJW1DN5MUoSWYddlvwK+vuKn56pVYFeKbByNd40
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY5PR04CA0007.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::17) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI2PR04MB10980:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d349738-8a30-4028-1838-08dd423f00cc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?VlV0YnFVMGY3aWJXcXBSR0VldGZrdHptSHJmT0U0amNCbWhYa0M3OHJMdDZB?=
 =?utf-8?B?RVZGNGNVVUNZM3pyMlY1b3lXVzV1MlBGQlpSWU93cjFlQm1Xd2t3UVdGaU5T?=
 =?utf-8?B?LzJqb09TYVQwNWJkVHJCK3Q1Rk5LVmQ5OUsrQ0FVa2VLdVo0TnVBWVRRcjho?=
 =?utf-8?B?Yyt2NHUyQW44VXExWWdEdkZsR3dERXJEUkkzN3loelFkQkZTRm8wb0I2eU5M?=
 =?utf-8?B?TDJiVitad0pvVTd0UVlGSlNqeEh5d3NVSU44UEtuZlRPSkpvT3FieTk3aUZU?=
 =?utf-8?B?WjIrT1MydlRiYUJ5OEJoY2hNV1dJWTVYMngzMS9WZHRGL3lvTlUrTDhOZ3Fk?=
 =?utf-8?B?MTBFTDFmTWxRTE9zeUpPdWEwNjJZamtYTW1XaHkzWGxMSWx3bmpPQlVsM2VU?=
 =?utf-8?B?bGx5bGxFRXlXdEt1Y3B3aERHWVg4WEI5ZXUxK2o1dVZQR2tXbnJyTnlMZHFz?=
 =?utf-8?B?UDk0b3BvaXN4Ykx3MGdZeVVEemp0cWpJbU9NdndWNmxaM3dNVTJxRDJyTWQ5?=
 =?utf-8?B?M2xJcjZJaXFBQUNnWmladWwxdVRsakRYVlRKeDhVWFhaL1BYSW96bzFZRXVs?=
 =?utf-8?B?VHRlTmZHb2M0Y2NVUjRlcHNDVEFlWlN3R24rbTlBbWc2ZWpmTm1XRGFDc0JL?=
 =?utf-8?B?K2o0VVNUV0hMYTRHVzA5WnhCbzl1QUFYY0xHMWk2YTJaU21ZbnBjVkhjUG82?=
 =?utf-8?B?d05TZEplcVRWdEYxZVFLeGk3MHIyYWRYWnpOWDlQVUFXallxNVJLM1RaT1pW?=
 =?utf-8?B?b3lKK3JqYkl4L3JUbFBIK0tEd0J4a2k5dEdSYWlwU1kyR0c2dmZDMzFFbzJq?=
 =?utf-8?B?TFBDNW5tMk9OSVpGQzJqOEVYaDB1M0tEWXVMWkpFRVpNVk1OVS9KVHdveTh5?=
 =?utf-8?B?SVZaemNLSWhobEdwUm5sVndxY3ZYd3F1UDZPK2MzOG11dTFIRzIzSWJlWDhK?=
 =?utf-8?B?WkxnWkkrWHRsaXVDMndHdzZ6WTJRZVJKNWVqbkxtbEhUNjhmRGd3L3ZKbnZK?=
 =?utf-8?B?Qk1pNVFxM294ZVlqV1BZcG5jTWRKVGVCeE5LOGpmNFQ3eXpoVS9KMzB5VnlX?=
 =?utf-8?B?VWNJblhpYnVLa09ORTdoWmZXYmxubERIaVFwdEx5RWlCOHNSWGNIdFVjYjlx?=
 =?utf-8?B?TnJvZWJZOVo3TWFnaVY1N1NTekw3R2ZoQmZHZGZVQldpS0V0WkVubFVKUHpp?=
 =?utf-8?B?NG1iM1RYOHVKWnljNXd4cEdRZkMybjRxNUpwRDlmWlF6TDNIR0tGbEZNdjJk?=
 =?utf-8?B?Mjc4ajExdGQ0cEhHSjN0S2ltNUx6VzBpSEI3K0l5RG9oWEFBRFhDZS9VWEZ3?=
 =?utf-8?B?emUyeTdKeHEvQ1dCOEhudmsyN3NSdk9CLzdSdHNwYUtuQlRKZUFXSGFYWk9B?=
 =?utf-8?B?OFJBM0x3WE5reGU0T2NzN3c1ZzZCMGtoWVBUZkJLNkxJVTFSQXlaWlZ1WDF3?=
 =?utf-8?B?aTdza1BzV3ZEZUdWTUpaYnMzZ1gzSFFEU2ZManNQaDRsQncvK21pQ1BZbEFE?=
 =?utf-8?B?MmY5NjVLQlFWKzBFeUY5Q2JpcmZWWWxvSTAyQzVOWFpoRkVRNm9kZGlDSnBH?=
 =?utf-8?B?MXJRMXczT2FrYmJESERzZGVtTUd1d1d1UGZQc2FrcUNFU1h1bS9PVGdNM1gx?=
 =?utf-8?B?WGg2WXV3cWlTZE5sdkw5Ky9OOS9NckRmRDVja050WFZ2ZzNGQkJLZG1ERzMv?=
 =?utf-8?B?ZDVSTnZmRzJwOWVYM2d3MitYbFNvVHc1czFHVzBSbkxOSVE3TnhmWTQ0Nm9T?=
 =?utf-8?B?RUJubUJHUmJXSHlRY2JwUmNuTHFzeVgzUitMNzVIU1ZTTWhINGxMNyt1bzQw?=
 =?utf-8?B?Q3gxWG1DK3pDTmxqd0wrSnNNME9qK3kzZWNmUFlhbFB3WGcwR09CMW9lV21G?=
 =?utf-8?B?WjhuZjFIRklYMzJSSWUrYWo3NC9SRlMvRUF2MUZ5bll0UFFmN0JLS3NsdlNu?=
 =?utf-8?B?MnI1QWxoMkJDZExlN0ozbWsxd3pVYkgwU29BdTV1YWQ0TXFuanNTVjk1WjhQ?=
 =?utf-8?B?Y1pSVlN3Y0hnPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?b3JUMFo5b1pDa1NWanN6bExQV1h4bHdnVmY3U05tNXJ5TEpiMGtkRE5Kclh4?=
 =?utf-8?B?OTZIcnEydlVnU1VTMGNnV3U1dVVIWTcrN2VvTERieC8wbU9URmV0N3BCeXRE?=
 =?utf-8?B?TGxoUGV6QlJ0bGNoY1hqSlVXL1ZsNzYvUmZoTWRBQURNTVNiU1J2MlFOTWg2?=
 =?utf-8?B?dmhISkhFUGZKYnZSaEhmbkF0Wjdzak9IWUl4bjlnQVZBVnZoZlJydWEzbHpa?=
 =?utf-8?B?WWQ4K3VDQS83TGVOekxNYTV5YVM4QzlMMWU4U29vdkViM1ZpRWRabjJEbjhw?=
 =?utf-8?B?ek0zdTlUWWhvTUxxNHNwWnJQeDYrOWE1bzZUNnNGOWltTEdJd2tBZHIxOG9q?=
 =?utf-8?B?RDlQRVJnckd5SklhSEV5ZmpUTXBKZ3NlMWxqNXZqdGdjT3dQbzREVlc2b2RJ?=
 =?utf-8?B?ZVhUNnZyenZvTlpnei9tR1Fpcm9UNEJVcVJaN1VCUkRIMTlNV29HYzFlZDhG?=
 =?utf-8?B?cGxsWC9yc1J6V0UvTDZQN2ZUTm00TzI3ZlU5YkFyWWdlUy9LVUVFZTZTclUr?=
 =?utf-8?B?aVpwZ0FhTldWdURFU25aYVRLUUpvT1Fhcm5iaEtqQzREaEZvM3VsMWlCbW02?=
 =?utf-8?B?OUp4T3dEU01HaVpRbWkvOVN2cUUwM1BjdmRZdDdFY1o3bGFqcGpEcVA2aGtM?=
 =?utf-8?B?QTZHeVRPQkhkcFVnaGZuRldGQmxjUis1eHVubGZmL0lSaUpSUVJIVkNVVS85?=
 =?utf-8?B?SzVZTkIydzBiSDhRejJVelJWcTZFamRwRDZEdENtTFR1UHRzMkQ4L1EvOVBy?=
 =?utf-8?B?bjB2NWlQbDV5c1VaOHR0dkorMnhZMWNoMENPc2MxOTJjM1k2UlVVRTdSZjdy?=
 =?utf-8?B?K3VUajEvQ2NkQmhSWFlIZTB1YVRDQ3RaRXI1WEJyRmpTQnlNZUhmSkIxL2JU?=
 =?utf-8?B?ZGJxbVZrYkZGMTB4Z1FoZHZlT0kxVXB3dTVmUHZuaE1TNFdzbzA2QUpXSDli?=
 =?utf-8?B?RmEwbUhMWkpGNWtkWVpkOUd3dU5zMTB0SlJLSi9IUDM4MXRHM1FFdm5BWVJr?=
 =?utf-8?B?MzlJbXlVekttMENQVzFaRzBVY0VCSDh6MlBJdFkxd0x0Y1owcW8zMGVCZjJs?=
 =?utf-8?B?TlhxZXJjektHemt2cG5jc3dhK3VGcWg3WmZOVXZ5NG5kdE8rRjNhZmpUM2RO?=
 =?utf-8?B?NldGZVZlOEpuZ3htZmtnK3hZcnFObmhLaVZJdS9LY044TTlHYWlEdkE0L2sz?=
 =?utf-8?B?WUlFbmFGdTBUUXlvODI2NjNpZXAva1NJWXYrZ2g1VkNDZ0dZTGNOenJUbnkx?=
 =?utf-8?B?Q1pkN2NWMmFOQTRHK1N6WTFzVVorVHRxeTFCaTlVTkFZdTJyVjJ4M0pYQ1ZT?=
 =?utf-8?B?aW5wcVpXLzdZS25vbnV1d3RpaHJBaE96Sm1jWGEyTDdZVzE1emlBdDNmbm9r?=
 =?utf-8?B?WVFrOXErRklSWVdZYXFrdGppVjdLcFAraGxqSEtZRnBVenBnOS9KZk94QXU5?=
 =?utf-8?B?aE5pV0duMUNXbDZsdkZ3OE03aCtLR1d1ejhnR2tMQjZuSmFpV2E0MzdTYW1l?=
 =?utf-8?B?aUxtRjMvbzJFK3R5NDNQNHlXSnE3aFkraFJvYUx1bjRuKzdEdCtEVjZmM0Rx?=
 =?utf-8?B?RG1JNDhlWmtXUUpSeHBVUDBJbHhwWFlPNGk4aVBIVkxjYUMzUXpQQ0owZHNL?=
 =?utf-8?B?bnkzY3JNS3BJd1ZpdkRFTTJDa21DZGZmd2FUUXc3WFdoWGJkbnNGeHoxUzZD?=
 =?utf-8?B?WWRKek9YeCtFT2lJTE0rbkNVYlpxUWgvNDJSWGhsYTF4N0ZwLzZDT0hZQXdP?=
 =?utf-8?B?YzIvdFB4Ui9zWnBRY01nbSswTmVkZEdzRzl0TDFCbUlrTjZJVk1QYUFsK2gw?=
 =?utf-8?B?T0VOQlMrQnQ4NWF5K2ZIVk5zRTB1bExBdXdwNVhZYTBFT1o1UGhKcWpRaHFi?=
 =?utf-8?B?aGZETXJ0eEV3V3lmaTBCN09laTNULzlBNWVudGgzSldpbnJHTjh6NWRscFpB?=
 =?utf-8?B?dmNUZ0d3Y0RQREdPVVU4TlRTRzBDeG9kdC9WejlOYnl1Ky9TeURCYVFCdmJX?=
 =?utf-8?B?MmVNY0h0WTNPeWFBMzRzMTRMcW9WejVNa3RucnpzdWhEc0EwTEFKQ1VuSGtV?=
 =?utf-8?B?K0xSbHBXaDFqN28rUXczU2Q1cTVmTjJZOGhMbFNGOWlHVUZjZkV5WFZ1T0Z3?=
 =?utf-8?Q?B9ik=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d349738-8a30-4028-1838-08dd423f00cc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 21:34:12.1582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ZohEb+UL3zJ7QYhyYvgGa9cAkwptU52U/b5DVZmIVh7MGVv0owgSrW7dYqaUrTCUj12k53QBY3fuAm8PKlRXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10980

Add MIPI CSI PHY driver for i.MX8QM, i.MX8QXP and i.MX8ULP.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/phy/freescale/Kconfig                   |   9 +
 drivers/phy/freescale/Makefile                  |   1 +
 drivers/phy/freescale/phy-fsl-imx8q-mipi-cphy.c | 254 ++++++++++++++++++++++++
 3 files changed, 264 insertions(+)

diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
index dcd9acff6d01a..f412fa405b9b6 100644
--- a/drivers/phy/freescale/Kconfig
+++ b/drivers/phy/freescale/Kconfig
@@ -35,6 +35,15 @@ config PHY_FSL_IMX8M_PCIE
 	  Enable this to add support for the PCIE PHY as found on
 	  i.MX8M family of SOCs.
 
+config PHY_FSL_IMX8Q_MIPI_CPHY
+        tristate "Freescale MIPI CSI PHY support"
+        depends on OF && HAS_IOMEM
+        select GENERIC_PHY
+        select REGMAP_MMIO
+        help
+          Enable this to add support for the MIPI CSI PHY as found
+          on NXP's i.MX8 family of SOCs.
+
 config PHY_FSL_IMX8QM_HSIO
 	tristate "Freescale i.MX8QM HSIO PHY"
 	depends on OF && HAS_IOMEM
diff --git a/drivers/phy/freescale/Makefile b/drivers/phy/freescale/Makefile
index 658eac7d0a622..8ff72dfdcf654 100644
--- a/drivers/phy/freescale/Makefile
+++ b/drivers/phy/freescale/Makefile
@@ -3,6 +3,7 @@ obj-$(CONFIG_PHY_FSL_IMX8MQ_USB)	+= phy-fsl-imx8mq-usb.o
 obj-$(CONFIG_PHY_MIXEL_LVDS_PHY)	+= phy-fsl-imx8qm-lvds-phy.o
 obj-$(CONFIG_PHY_MIXEL_MIPI_DPHY)	+= phy-fsl-imx8-mipi-dphy.o
 obj-$(CONFIG_PHY_FSL_IMX8M_PCIE)	+= phy-fsl-imx8m-pcie.o
+obj-$(CONFIG_PHY_FSL_IMX8Q_MIPI_CPHY)	+= phy-fsl-imx8q-mipi-cphy.o
 obj-$(CONFIG_PHY_FSL_IMX8QM_HSIO)	+= phy-fsl-imx8qm-hsio.o
 obj-$(CONFIG_PHY_FSL_LYNX_28G)		+= phy-fsl-lynx-28g.o
 obj-$(CONFIG_PHY_FSL_SAMSUNG_HDMI_PHY)	+= phy-fsl-samsung-hdmi.o
diff --git a/drivers/phy/freescale/phy-fsl-imx8q-mipi-cphy.c b/drivers/phy/freescale/phy-fsl-imx8q-mipi-cphy.c
new file mode 100644
index 0000000000000..eff3c9554b95e
--- /dev/null
+++ b/drivers/phy/freescale/phy-fsl-imx8q-mipi-cphy.c
@@ -0,0 +1,254 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+struct imx8_mipi_drvdata {
+	int offset;
+	bool bsyscon : 1;
+};
+
+struct imx8_mipi_phy {
+	struct phy *phy;
+	struct device *dev;
+	struct regmap *phy_gpr;
+	int phy_gpr_reg;
+	int speed;
+	const struct imx8_mipi_drvdata *drvdata;
+};
+
+#define CSI2SS_PL_CLK_INTERVAL_US		10000
+#define CSI2SS_PL_CLK_TIMEOUT_US		100000
+
+#define CSI2SS_BASE_OFFSET			0x0
+
+#define CSI2SS_PLM_CTRL				(CSI2SS_BASE_OFFSET + 0x0)
+#define CSI2SS_PLM_CTRL_PL_CLK_RUN		BIT(31)
+#define CSI2SS_PLM_CTRL_VSYNC_OVERRIDE		BIT(9)
+#define CSI2SS_PLM_CTRL_HSYNC_OVERRIDE		BIT(10)
+#define CSI2SS_PLM_CTRL_VALID_OVERRIDE		BIT(11)
+#define CSI2SS_PLM_CTRL_POLARITY_MASK		BIT(12)
+#define CSI2SS_PLM_CTRL_ENABLE_PL		BIT(0)
+
+#define CSI2SS_PHY_CTRL				(CSI2SS_BASE_OFFSET + 0x4)
+#define CSI2SS_PHY_CTRL_PD			BIT(22)
+#define CSI2SS_PHY_CTRL_RTERM_SEL		BIT(21)
+#define CSI2SS_PLM_CTRL_POLARITY		BIT(12)
+#define CSI2SS_PHY_CTRL_RX_HS_SETTLE(x)		FIELD_PREP(GENMASK(9, 4), (x))
+#define CSI2SS_PHY_CTRL_CONT_CLK_MODE		BIT(3)
+#define CSI2SS_PHY_CTRL_DDRCLK_EN		BIT(2)
+#define CSI2SS_PHY_CTRL_AUTO_PD_EN		BIT(1)
+#define CSI2SS_PHY_CTRL_RX_ENABLE		BIT(0)
+
+#define CSI2SS_PHY_STATUS			(CSI2SS_BASE_OFFSET + 0x8)
+#define CSI2SS_PHY_TEST_STATUS			(CSI2SS_BASE_OFFSET + 0x10)
+#define CSI2SS_PHY_TEST_STATUS_D0		(CSI2SS_BASE_OFFSET + 0x14)
+#define CSI2SS_PHY_TEST_STATUS_D1		(CSI2SS_BASE_OFFSET + 0x18)
+#define CSI2SS_PHY_TEST_STATUS_D2		(CSI2SS_BASE_OFFSET + 0x1C)
+#define CSI2SS_PHY_TEST_STATUS_D3		(CSI2SS_BASE_OFFSET + 0x20)
+
+#define CSI2SS_VC_INTERLACED			(CSI2SS_BASE_OFFSET + 0x30)
+#define CSI2SS_VC_INTERLACED_VC3		BIT(3)
+#define CSI2SS_VC_INTERLACED_VC2		BIT(2)
+#define CSI2SS_VC_INTERLACED_VC1		BIT(1)
+#define CSI2SS_VC_INTERLACED_VC0		BIT(0)
+#define CSI2SS_VC_INTERLACED_MASK		GENMASK(3, 0)
+
+#define CSI2SS_DATA_TYPE			(CSI2SS_BASE_OFFSET + 0x38)
+#define CSI2SS_DATA_TYPE_LEGACY_YUV420_8BIT	BIT(2)
+#define CSI2SS_DATA_TYPE_YUV422_8BIT		BIT(6)
+#define CSI2SS_DATA_TYPE_YUV422_10BIT		BIT(7)
+#define CSI2SS_DATA_TYPE_RGB444			BIT(8)
+#define CSI2SS_DATA_TYPE_RGB555			BIT(9)
+#define CSI2SS_DATA_TYPE_RGB565			BIT(10)
+#define CSI2SS_DATA_TYPE_RGB666			BIT(11)
+#define CSI2SS_DATA_TYPE_RGB888			BIT(12)
+#define CSI2SS_DATA_TYPE_RAW6			BIT(16)
+#define CSI2SS_DATA_TYPE_RAW8			BIT(18)
+#define CSI2SS_DATA_TYPE_RAW10			BIT(19)
+
+#define CSI2SS_YUV420_1ST_LINE_DATA_TYPE	(CSI2SS_BASE_OFFSET + 0x40)
+#define CSI2SS_YUV420_1ST_LINE_DATA_TYPE_ODD	0
+#define CSI2SS_YUV420_1ST_LINE_DATA_TYPE_EVEN	1
+
+#define CSI2SS_CTRL_CLK_RESET			(CSI2SS_BASE_OFFSET + 0x44)
+#define CSI2SS_CTRL_CLK_RESET_EN		BIT(0)
+
+#define CSI2SS_STREAM_FENCE_CTRL		(CSI2SS_BASE_OFFSET + 0x48)
+#define CSI2SS_STREAM_FENCE_VC3			BIT(3)
+#define CSI2SS_STREAM_FENCE_VC2			BIT(2)
+#define CSI2SS_STREAM_FENCE_VC1			BIT(1)
+#define CSI2SS_STREAM_FENCE_VC0			BIT(0)
+#define CSI2SS_STREAM_FENCE_CTRL_MASK		GENMASK(3, 0)
+
+#define CSI2SS_STREAM_FENCE_STATUS		(CSI2SS_BASE_OFFSET + 0x4C)
+
+static int imx8_mipi_phy_power_on(struct phy *phy)
+{
+	struct imx8_mipi_phy *imx8_phy = phy_get_drvdata(phy);
+	int ret;
+	u32 val;
+
+	/* clear format */
+	regmap_clear_bits(imx8_phy->phy_gpr,
+			  imx8_phy->phy_gpr_reg + CSI2SS_DATA_TYPE, 0xffffff);
+
+	/* clear polarity */
+	regmap_clear_bits(imx8_phy->phy_gpr,
+			  imx8_phy->phy_gpr_reg + CSI2SS_PLM_CTRL,
+			  CSI2SS_PLM_CTRL_VSYNC_OVERRIDE |
+			  CSI2SS_PLM_CTRL_HSYNC_OVERRIDE |
+			  CSI2SS_PLM_CTRL_VALID_OVERRIDE |
+			  CSI2SS_PLM_CTRL_POLARITY_MASK);
+
+	val = CSI2SS_PHY_CTRL_RX_ENABLE | CSI2SS_PHY_CTRL_DDRCLK_EN |
+	      CSI2SS_PHY_CTRL_CONT_CLK_MODE |
+	      CSI2SS_PHY_CTRL_RX_HS_SETTLE(imx8_phy->speed) |
+	      CSI2SS_PHY_CTRL_PD | CSI2SS_PHY_CTRL_RTERM_SEL |
+	      CSI2SS_PHY_CTRL_AUTO_PD_EN;
+
+	regmap_update_bits(imx8_phy->phy_gpr,
+			   imx8_phy->phy_gpr_reg + CSI2SS_PHY_CTRL, 0xffffff,
+			   val);
+
+	ret = regmap_read_poll_timeout(imx8_phy->phy_gpr,
+				       imx8_phy->phy_gpr_reg + CSI2SS_PLM_CTRL,
+				       val, !(val & CSI2SS_PLM_CTRL_PL_CLK_RUN),
+				       CSI2SS_PL_CLK_INTERVAL_US,
+				       CSI2SS_PL_CLK_TIMEOUT_US);
+
+	if (ret) {
+		dev_err(imx8_phy->dev, "Timeout waiting for Pixel-Link clock");
+		return ret;
+	}
+
+	/* Enable Pixel link Master*/
+	regmap_set_bits(imx8_phy->phy_gpr, imx8_phy->phy_gpr_reg + CSI2SS_PLM_CTRL,
+			CSI2SS_PLM_CTRL_ENABLE_PL | CSI2SS_PLM_CTRL_VALID_OVERRIDE);
+
+	/* PHY Enable */
+	regmap_update_bits(imx8_phy->phy_gpr, imx8_phy->phy_gpr_reg + CSI2SS_PHY_CTRL,
+			   CSI2SS_PHY_CTRL_PD | CSI2SS_PLM_CTRL_POLARITY, 0x0);
+
+	/* Release Reset */
+	regmap_set_bits(imx8_phy->phy_gpr, imx8_phy->phy_gpr_reg + CSI2SS_CTRL_CLK_RESET,
+			CSI2SS_CTRL_CLK_RESET_EN);
+
+	return ret;
+}
+
+static int imx8_mipi_phy_power_off(struct phy *phy)
+{
+	struct imx8_mipi_phy *imx8_phy = phy_get_drvdata(phy);
+
+	/* Disable Pixel Link */
+	regmap_write(imx8_phy->phy_gpr, imx8_phy->phy_gpr_reg + CSI2SS_PLM_CTRL, 0x0);
+
+	/* Disable  PHY */
+	regmap_write(imx8_phy->phy_gpr, imx8_phy->phy_gpr_reg + CSI2SS_PHY_CTRL, 0x0);
+
+	return 0;
+};
+
+static int imx8_mipi_phy_set_speed(struct phy *phy, int speed)
+{
+	struct imx8_mipi_phy *imx8_phy = phy_get_drvdata(phy);
+
+	imx8_phy->speed = speed;
+
+	return 0;
+}
+
+static const struct phy_ops imx8_mipi_phy_ops = {
+	.power_on = imx8_mipi_phy_power_on,
+	.power_off = imx8_mipi_phy_power_off,
+	.set_speed = imx8_mipi_phy_set_speed,
+	.owner = THIS_MODULE,
+};
+
+const struct imx8_mipi_drvdata imx8qxp_mipi_drvdata = {
+};
+
+const struct imx8_mipi_drvdata imx8ulp_mipi_drvdata = {
+	.offset = 0,
+	.bsyscon = true,
+};
+
+static const struct of_device_id imx8_mipi_phy_of_match[] = {
+	{ .compatible = "fsl,imx8qxp-mipi-cphy", &imx8qxp_mipi_drvdata },
+	{ .compatible = "fsl,imx8ulp-mipi-cphy", &imx8ulp_mipi_drvdata },
+	{},
+};
+MODULE_DEVICE_TABLE(of, imx8_mipi_phy_of_match);
+
+static const struct regmap_config regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
+static int imx8_mipi_phy_probe(struct platform_device *pdev)
+{
+	struct phy_provider *phy_provider;
+	struct device *dev = &pdev->dev;
+	struct imx8_mipi_phy *imx8_phy;
+	void __iomem *base;
+
+	imx8_phy = devm_kzalloc(dev, sizeof(*imx8_phy), GFP_KERNEL);
+	if (!imx8_phy)
+		return -ENOMEM;
+
+	imx8_phy->dev = dev;
+	imx8_phy->drvdata = of_device_get_match_data(dev);
+	imx8_phy->phy_gpr_reg = imx8_phy->drvdata->offset;
+
+	if (imx8_phy->drvdata->bsyscon) {
+		imx8_phy->phy_gpr = syscon_node_to_regmap(dev->of_node->parent);
+		return dev_err_probe(dev, PTR_ERR(imx8_phy->phy_gpr),
+				     "failed to get regmap\n");
+	} else {
+		base = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(base))
+			return dev_err_probe(dev, IS_ERR(base),
+					     "missed phy base register\n");
+
+		imx8_phy->phy_gpr = devm_regmap_init_mmio(dev, base, &regmap_config);
+		if (IS_ERR(imx8_phy->phy_gpr))
+			return dev_err_probe(dev, PTR_ERR(imx8_phy->phy_gpr),
+					     "unable to find iomuxc registers\n");
+	}
+
+	imx8_phy->phy = devm_phy_create(dev, NULL, &imx8_mipi_phy_ops);
+	if (IS_ERR(imx8_phy->phy))
+		return PTR_ERR(imx8_phy->phy);
+
+	phy_set_drvdata(imx8_phy->phy, imx8_phy);
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static struct platform_driver imx8_mipi_phy_driver = {
+	.probe = imx8_mipi_phy_probe,
+	.driver = {
+		.name = "imx8-mipi-cphy",
+		.of_match_table = imx8_mipi_phy_of_match,
+	}
+};
+module_platform_driver(imx8_mipi_phy_driver);
+
+MODULE_DESCRIPTION("FSL IMX8 MIPI CSI PHY driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


