Return-Path: <linux-media+bounces-27088-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD1EA467AB
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 18:15:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DD04165FD1
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 17:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1471A258CC0;
	Wed, 26 Feb 2025 17:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=d3engineering.onmicrosoft.com header.i=@d3engineering.onmicrosoft.com header.b="RoUgJWPi"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2125.outbound.protection.outlook.com [40.107.102.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19572206B6;
	Wed, 26 Feb 2025 17:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740589512; cv=fail; b=iZuf+GAnuMiw1s/8VHQQOfvX5JlljsMlkX5ZxMh1v3mBRz1WCjNt/2GP91XUukaYxHJ024ROL25QuZ5Nurjoc8ho9Ac9niBEjhKdGRdFTjHYEGnXFNsm9w745rFwpPm0y+4h+soajIwsiFbeSrEBhWN8p7GKtPWLglY7ANl/ZBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740589512; c=relaxed/simple;
	bh=SErncZ/T6DzGWPoTn19XFzlzqNSovqmkyIeo7fJ98CU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Cr8BuVLXhHSU+KVLwlmBE8e1Jy0895dVvKxekjJlkffJKe0YbiLDZyLprwDibWZyoqHPlTJRdb6zPLwpXu9/be6fwyD6gtEf+1w52mRhA1/hbqy4r6cC07+RFLqCHFcHFRgqjB7Kl9cbEtPElf87bAg7GJZEy5USH60r84LG/u0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3embedded.com; spf=pass smtp.mailfrom=d3embedded.com; dkim=pass (1024-bit key) header.d=d3engineering.onmicrosoft.com header.i=@d3engineering.onmicrosoft.com header.b=RoUgJWPi; arc=fail smtp.client-ip=40.107.102.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d3embedded.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iRcv5apkYqVYrTV6LqaDdLeqmdiv9RD5+LYOk8VLzROVFHlt4V6XKC6hteXcjF6rXEbQ222ZN2hgNBt6uwW4jpArCZnXdrgghys2YwcC6m3YdxglNT/33T1mqOo3yFLxurOZ6Q7koQj04nAPww14fg7/URaBR4oqbkxehrhIZI/FNhB0s3CmktZLhPcDquKShL1MzL901VfKudmYmpJpDbGH1roS3LuFWcogdiMkypAk/digQcQEUmxDUsIIx4P8OvaWXRSq07J4Ujb2mnBbtxR+XKvjURgh50LXbLN9L+LINlD7BLelL7q70SgxeKMKLW+tzKfCTSKq6GecJUftmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SErncZ/T6DzGWPoTn19XFzlzqNSovqmkyIeo7fJ98CU=;
 b=geTBT1gHCFXdAHIqD42jzbNY6foBOWm6eJZjxFjAYESPmN4A39/WFPKO9O2qQnIOrpKD+eyXrqkqYC6T3cvwLOwHZaD0M71z5vmW9hKqmP2GNTNNDhL4fAZOjR66jmV9kyK4nAphBvVri0apTUQvrZRR8QREqtmVtgcgHAFx5Hn322QlTrZ7EfVIxAApo9QdAsHssyePpM8oJd0X37iB5jOFdx5kglVyP0E1GLa6jDcndPcCZFr86SRsUoCFwH0N9XCs4K/TVkZYTUSJpPKdyyAaeNIOL1mmdtdcbbi3Mn2XIipoaGgo5aU3n1OA7UN/9yyq1TNT9p4t92sNx7dRew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=d3embedded.com; dmarc=pass action=none
 header.from=d3embedded.com; dkim=pass header.d=d3embedded.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=d3engineering.onmicrosoft.com; s=selector2-d3engineering-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SErncZ/T6DzGWPoTn19XFzlzqNSovqmkyIeo7fJ98CU=;
 b=RoUgJWPiPBIZuzDoTXxXoelnENbz3nghrWOOwhzYfeOjY5fYDeHTWtc9OhBm59I7QOqlKW0W1Q4xllmk5R/IWcAG+GWt93Y3CNXBdxN+Ld5vkOWLsUyHnjwmIiBo3zFoeRZTEEv9lyD6Xflu1JwAcNf5aOl4zSL9BkcQ8hPwUx4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=d3embedded.com;
Received: from MN2PR14MB4207.namprd14.prod.outlook.com (2603:10b6:208:1d6::13)
 by IA1PR14MB5707.namprd14.prod.outlook.com (2603:10b6:208:3a1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Wed, 26 Feb
 2025 17:05:06 +0000
Received: from MN2PR14MB4207.namprd14.prod.outlook.com
 ([fe80::1232:fdf5:3cae:d9d7]) by MN2PR14MB4207.namprd14.prod.outlook.com
 ([fe80::1232:fdf5:3cae:d9d7%3]) with mapi id 15.20.8466.020; Wed, 26 Feb 2025
 17:05:06 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Feb 2025 12:05:03 -0500
Message-Id: <D82JHF158VJA.3Q1T2ZHM2XNEN@d3embedded.com>
Cc: =?utf-8?b?TsOtY29sYXMgRi5SLkEuUHJhZG8=?= <nfraprado@collabora.com>,
 "Abel Vesa" <abel.vesa@linaro.org>, "Achath Vaishnav" <vaishnav.a@ti.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Ard Biesheuvel" <ardb@kernel.org>, "Benjamin Mugnier"
 <benjamin.mugnier@foss.st.com>, "Biju Das" <biju.das.jz@bp.renesas.com>,
 "Bjorn Andersson" <quic_bjorande@quicinc.com>, "Catalin Marinas"
 <catalin.marinas@arm.com>, "Conor Dooley" <conor+dt@kernel.org>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, "Elinor Montmasson"
 <elinor.montmasson@savoirfairelinux.com>, "Fabio Estevam"
 <festevam@gmail.com>, "Geert Uytterhoeven" <geert+renesas@glider.be>, "Hans
 Verkuil" <hverkuil@xs4all.nl>, "Javier Carrasco"
 <javier.carrasco@wolfvision.net>, "Jianzhong Xu" <xuj@ti.com>, "Julien
 Massot" <julien.massot@collabora.com>, "Kory Maincent"
 <kory.maincent@bootlin.com>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Mikhail Rudenko" <mike.rudenko@gmail.com>, "Nishanth
 Menon" <nm@ti.com>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Rob
 Herring" <robh@kernel.org>, "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>,
 "Stuart Burtner" <sburtner@d3embedded.com>, "Tero Kristo"
 <kristo@kernel.org>, "Thakkar Devarsh" <devarsht@ti.com>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Umang Jain"
 <umang.jain@ideasonboard.com>, "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Will Deacon" <will@kernel.org>, "Zhi Mao" <zhi.mao@mediatek.com>
Subject: Re: [PATCH 0/4] media: i2c: Add driver for Sony IMX728
From: "Sebastian LaVine" <slavine@d3embedded.com>
To: "Kieran Bingham" <kieran.bingham@ideasonboard.com>,
 <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20250212195656.69528-1-slavine@d3embedded.com>
 <173944323591.1238111.8582110055649651187@ping.linuxembedded.co.uk>
In-Reply-To: <173944323591.1238111.8582110055649651187@ping.linuxembedded.co.uk>
X-ClientProxiedBy: CH0PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:610:b0::24) To MN2PR14MB4207.namprd14.prod.outlook.com
 (2603:10b6:208:1d6::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR14MB4207:EE_|IA1PR14MB5707:EE_
X-MS-Office365-Filtering-Correlation-Id: 237ef6d4-1131-4860-7e91-08dd5687b7f8
X-LD-Processed: b7153db5-3376-478b-b601-92ce9bc0d3bc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?NE4rbERrcW5QQ3ZKVkU4bDBweEJxQzR3SzhseXBTeG12RCtRRm9XUHB0T3pS?=
 =?utf-8?B?bjAzUmtnSlpVT2pxcEx5M0t3ZmZnd3FRVUg5aEdvTEthallrY2EwOE91ZGE2?=
 =?utf-8?B?blVJdnBoU016WW1KcHhrYWIxdldNRlFKZEdFRE5kRXVMY0E5YlBHWW5oQ05l?=
 =?utf-8?B?Q0dlQVl4b0RWUDd4bGJSWU1DblNnNzFzbFhJcEpNYVA5Skh0K0NDVEkzZUdk?=
 =?utf-8?B?aSs3U0gxY1lnSmJKU2E3aVBCMzJ6eVFyWnNZYzNRZXBwNkdqRStBNS8rRlZ2?=
 =?utf-8?B?TVJJNll3d3dxei9aRUxTcEFYT2hvWmJxeVhLSUdSWS96VDRFUlgwbm44ZEVC?=
 =?utf-8?B?ZnMrWkxMM0Q0YlB3SUlDOE4yajd3NmpvMy9SU0NIbTNhQjZaem9DSHJSS1ZQ?=
 =?utf-8?B?WXd1SXdWblJxYk1CZ2dhYTJTSHluRFJpMXRyMGZ4TVFMTW5uVi80K1dyN3dK?=
 =?utf-8?B?RFQ0Z0N5YmFBMDBtMFV6djR4U0IwYVZxalBjTW5rMXhocHM0S3ZCNXFUVldh?=
 =?utf-8?B?MmtITGlqN0M0YlRBYkVRY2tEZG5BVmhMQ1BwZFQ4VmYxUEJidk5DL2h3bUF6?=
 =?utf-8?B?UlN1WHBqOVFhWU9mclRQeFdvMWRoVnQzOWhNaUYrZDJabk5wNVBaRzludG5D?=
 =?utf-8?B?NXI1NkZkcGdCVmFvTnRGWE5RNmNlNzBUckFIajhldnNUaFd5eGRSUTZkek5X?=
 =?utf-8?B?d0NsR05tV3I0UHVPdURlSkplRWdKRms2cS9tUHpWZk85M1RTaURnNXdPYmtU?=
 =?utf-8?B?NUZZMFFSdnZVWVZKRVVNUHFid0kwSnZYRW9QQ3MyVHY5RFBTc1pGVm40QW9x?=
 =?utf-8?B?UEhBVXVMd2dCQk1xbWFhWWZYYmhUWXZ6S2oxYTZzcjJyR3dEZ3BML2pNS0Mx?=
 =?utf-8?B?OUdlYUhJYlp2T3JSL0RBOVRWeEJVZkJlR1RLNjEvSnl6OGg0c3FXM20xc3FK?=
 =?utf-8?B?VW1MODhISnBZcGtKTy9IbE04M0pSdndQU2FmcWFvbjRrTHllMkVsT1ZFbUdS?=
 =?utf-8?B?QXhSeXQrS1puaHRhVHhscU1rbFd0MlY3Q0lvVk96L1duRW5KdmtKdG51UXAw?=
 =?utf-8?B?TWRkaGt5MEptNnpUNklZK3FCNVlXMXgxbitMbHBOZHdoNVFDMG1UWEF6ZjEr?=
 =?utf-8?B?aXU2aDY0T1o2UXBnTVJtYk51UHpVVkF5QXpOclc2ekthV3cvUGFkUjk2TzBD?=
 =?utf-8?B?NWRTZmJXRTNjeHhXd2ZDaDd6TW5iNHU4ZWFQdUFSQ3VKcjhsb2pNeGc4R21Q?=
 =?utf-8?B?WEdZVHE3Sm1Gd3diZGZsbldleUZXMXZpcVhYYTRTQVlHWFNiRWZlc3JlQ1Fl?=
 =?utf-8?B?YWpCUjZDVFRFeXM2b1NTb2hCNjlWMk5GbGQzR2M1YXJpVDFsK25WVnI5L0Vx?=
 =?utf-8?B?OW9VZWk1SHBIdzRjYWZpNFFoWVlYVXUrcHFPT2p1RVpoUW9IalBRMmlXWHky?=
 =?utf-8?B?d2VubFhETWpOOStzT2ZtRVp3dGNqdzBQbUxncnllWTdzMlRKYit3WFpDcVF6?=
 =?utf-8?B?b0RtSWdOcDRKZFhaakR1cHpSRG9wSWVOSHk1NWdnT2NQY1dTZDBsYnVnVjk5?=
 =?utf-8?B?RFRuU25CTWdyc1VMVktYOUFFUmNjN0NLVmFDc2srUUNlUzAvUi9jdDJXUlZV?=
 =?utf-8?B?bW5kZUZaN08rdW1qamxVdFhXWk5vanFNRVB6ZFBlNWpWZ3FRQkttbk5YQk5o?=
 =?utf-8?B?TXlGSDRmN2RnSVJHVG5sWG9NRCt0ZFRuYTBBMlYvbE5VRXFjeU5OakdaTk1D?=
 =?utf-8?B?MG9ILzUxQ1g0Q25LaFVjVWI1c2pSUnd6eEJJSitMTyt2aWs0RDZyemQ5cVI0?=
 =?utf-8?B?UEVrRWkvdnNUbW5pOVlkY0lpM3FEWEFCODFoamV6V1JGb1lUT2pMMHZOZmtS?=
 =?utf-8?Q?Zq8MIrc4NNrRE?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR14MB4207.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TndWU0IxTGVLVzdBcUNXOHJ4R1lmU2trcGVNOUZQamtEbDJQNGMwQ2VlL3lU?=
 =?utf-8?B?YU5Md0RpRGhuU2JJSVBxYzRQL1dWTmplYmRkaUNwa2JHZXFuclFjcXBKVjhy?=
 =?utf-8?B?YnA2dk9XU2hPNCtlSlM1OXFWQWkvbE9rR2t2SEZBNldWTFRLUW5uYXZZL280?=
 =?utf-8?B?VlZWTFBEUlppRzJVT05xR1dQQmxZSFpNL3hFRWNhbmJMRmsxaDdRV3p3WDY1?=
 =?utf-8?B?TE4wemhVMUNoTngyMHo5M3VuTkE1VU9EYUlDS2pBTGsyOFBqbjJHdUdFblhT?=
 =?utf-8?B?akYzUG1KY2tEM0o4TEVzN1FlaWhxenJBaVdIQWVYS2JwbEhZV05YN2VBMFhw?=
 =?utf-8?B?TDNvdTV1UWo4MXVVUWJ4MGxSUjFaWFRJcjZMM2pOVmFTUElWWmJzY280M1Bx?=
 =?utf-8?B?U0Q3OXNlUjluSGFVRXZud1cvNndwelZ4cUZiaXJjbGF2VVRuSVhEa29WR2pu?=
 =?utf-8?B?eUQwcDRtbkpNcHhPOUNYY1luT0FkZmZUcUswNFdjS085Y2ZkdXR2c2haUUFG?=
 =?utf-8?B?NmpieGZnUVBOV3E1Yk85NE1hcFJiWDRFRkNIYmlsOS94ZC9FMk0zRVNsVWpR?=
 =?utf-8?B?RHpaK1ptd0FPcjM4b2dZQkM2c0Rjb0U0N2hrT085NGVaZUwrcTBYL1FYaDI3?=
 =?utf-8?B?b0N2RDcyYkUwbVdDUW85eS9kbm9na3F1MjVOQmRtQXZDSHFIb0pKYlJaTUpQ?=
 =?utf-8?B?bVdyc3ZweG95bE9RU0ZFYVdjVWtPMTNBSmtGQnI5RG5uRHlVM0NsNUhUN2pz?=
 =?utf-8?B?VzBMS21mamNKd3BtcHpVVzFRdXg1dUlpcyszZHo4cG5SbnBBTzlNa3FEOU9p?=
 =?utf-8?B?NmdmUldacCtLZ0k4b1BZL1Q3aXJBcVdLbkxUMWhEMm42cGFtWU5ycEpPUlNl?=
 =?utf-8?B?eGhIWE1pZ2NMUGM4dVgwb0dlZ3M3WXgyUHhvNFVuSkswbkxQVHluK2d0MmRH?=
 =?utf-8?B?VjNtQWFES0MrMlV3ZFk4d3NIaUx2Yjl4ZTQ4S05KeEQ0SU4rRUdlbkpkekxp?=
 =?utf-8?B?aTRGME5WME9jRkNOeU5CeXVLZ3NPbWlMQ1Vya1ZiWXM0OGVTK2p0eTlLdHFV?=
 =?utf-8?B?TkZ3QTNLcGJ2dEJHN096UTJzL09OQThISWErRFFhdldPVXMyY1B3ZnltYzNZ?=
 =?utf-8?B?UkoreE4xeTFIcnNMcnJHSkVQWnRqZE1mM3d5eWtEZUpQRStZMGFtdkRjclFS?=
 =?utf-8?B?TzFYcnVORnVEaFpDU3lRMTRXc0dmNzJiUTkwQXUvSlhLSFJReklQb3pFSUwr?=
 =?utf-8?B?cEtsZnRRSnJneERkcllPVjVPZERheTRWZk55V3lWYWJQNGRVRkhqbHl6NUNV?=
 =?utf-8?B?bDIvbGRNMnBCTGlNOXNNME9oTVRCMlZHRWdqRXFSNlMxRWM5VGdDMWhXZHBl?=
 =?utf-8?B?RVdneTlRU1gzWHYwOHFFM3gxL1BncTBXWDl2SmFhdFpXV1E4QmxUOVJIbGhu?=
 =?utf-8?B?M1RpZjVXaTA2ckxjbDVEaThpWHNRRGlQbW1yUHk1L1R5dTJzZ1FoT2dsUnpk?=
 =?utf-8?B?VkRzZXBuVTdubXJlY1F4aEl1b0VXRDYwaXdYQmh4OWtNdkhmOGwxRVByRnNn?=
 =?utf-8?B?bytDd0tsaElLZVNuczIxUlkxWkJzWXBybEtJZHRPM1pReXh4ZGFRSXU2Z2hh?=
 =?utf-8?B?L1laRGlJODhBT3VpOGlEdG0vRk8rRkhScTlZTGVpa0Z1c0dSNWR6TWNjRVRh?=
 =?utf-8?B?ZXFicGErbkdKaFpmRFVLYWlwM1U3VS95M2N3aWU4MklaMjRpT3JZSHQ3ejRz?=
 =?utf-8?B?WGZnd1QyWUJ1WmRXT05yWk5HUWhhazFsSmE5UVJqM3h3c3RGWCszZkpmMnZ0?=
 =?utf-8?B?R1o0eHR6WGtnajcwZFBGSlQ2OThGTnhFcFdnNjhlMVUyd3RkSTZ3UmJwaFZs?=
 =?utf-8?B?MW9WWXdrOHRJaVhxcExBQ1N6RTF2dXJiTTk0YTN6N3QzbXdiR0FoNThFNmF0?=
 =?utf-8?B?WFl2ZlhLdUNmM1RPN3E4SWlzKzBuM2taNlVETVdYRXdzeWthR0tneUFacEpq?=
 =?utf-8?B?c0ZuUlRlelhXdjFyOGZhbk9ld1RUNXA4VkhoUE4zY3NhSzF3VTQxWW1oUDlv?=
 =?utf-8?B?aTdxRlBaYk1DMlBqM25nc0czQ1UxN3Q5d1RsVEx6TmVBaVp1dUdadWxBUmJC?=
 =?utf-8?Q?XQTLzUmpsqrj5EvRlMJt48Fm6?=
X-OriginatorOrg: d3embedded.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 237ef6d4-1131-4860-7e91-08dd5687b7f8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR14MB4207.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 17:05:06.5002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b7153db5-3376-478b-b601-92ce9bc0d3bc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e/yBQaWmvffZ/lXONwQfjiBaw+gs6exw+hXuOuLHQQA/k7yW3R9HMHUDAdbqeZrbldgGwFm3oexfi7ZWX/OzxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR14MB5707

Hello Kieran,

On Thu Feb 13, 2025 at 5:40 AM EST, Kieran Bingham wrote:
> Hi Sebastian,
>
> Quoting Sebastian LaVine (2025-02-12 19:56:52)
> <snip>
>>
>> Total for device /dev/v4l-subdev4: 44, Succeeded: 44, Failed: 0, Warning=
s: 0
>>
>>
>> This is a v3 of a series that was originally sent last summer[0].
>>
>> [0]: https://lore.kernel.org/r/linux-media/20240628-imx728-driver-v2-0-8=
0efa6774286@d3engineering.com/
>
> This version of the driver was authored by "Spencer Hill
> <shill@d3engineering.com>" who seems to no longer be credited. Is this
> intentional?
>
> Does his original Signed-off-by: tag need to be kept at least ? Or
> perhaps Co-Authored-by: ?
>

Yes, the original patch series was authored by Spencer -- I removed his
name as he is no longer with our company and therefore his email address
is no longer a valid way to contact him. I am not sure what the
convention is for this. I would be happy to re-add his name and former
email address to the Git trailers if this is desired.

Thank you,

--
Sebastian

Please be aware that this email includes email addresses outside of the org=
anization.

