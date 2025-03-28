Return-Path: <linux-media+bounces-28906-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF858A74203
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 02:23:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3B66189F71C
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 01:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE12A1C5D6A;
	Fri, 28 Mar 2025 01:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Cnh64ikE"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013032.outbound.protection.outlook.com [52.101.72.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F43482EF;
	Fri, 28 Mar 2025 01:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743124985; cv=fail; b=FLwNKJ6iDxOlnV2VcXZuvIjiD1GWX7zEFfoJzFT9WOPMAbbblnkHYXnbgZSPcQLonBDRZank7HKyQfItTA/oxqakB9PZNLRm5DL6c2PphPkfu6dyZdLzSbdwA05ydyLMCl/glvsCb6+26lEhAKOsi1j/fKvggZQs/tCLprqH93o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743124985; c=relaxed/simple;
	bh=3k0d/HwSTdLsjvd7oxS9+vArd4Hpks+2QpLPCcq10XE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GezKL6o3N2acYp/oZnl1jNm1vWEQqVW4bOY9cHe1wfHLL0f32FIC3sz6F0ZWA0lsmPhIY2DF+FIB2zdgJ4mQ8iDDWzMuxHgxsajBZsHELCHOV+UU6R2vwEEL6AIst+V82BVygdgG7or9NX+1ddlcpe0gSduC/TS0ShalWNjiUiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Cnh64ikE; arc=fail smtp.client-ip=52.101.72.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JXOcQlzxj2/HAkycaWZS7rzEdj697PCGAe7LsHZeW3kJabCg9DBlv5oJiXUP44OSwOTIN9+2GAeBua7C7ZESDqColecyp7kRI0w4bXgAtz/NyJMY1niEzXUJgCsl6/+fL9cbfjAW3hed2U2suYHi+aZOBsphtkNuqac7ZkNWcq3e1oLbIPEww1HaI+9VvX1oQTQ1y94sdl5yiPjvHxzz7QP5KjyHqxYV/c1xhRn3yOuQFLstxh6hH0DtmfKrvFL0Xncqh7dy43GglCbPjwXET3/ae02GumQr0kd8bdWPEkK50u1WxudevcujerHybs5LWWVFMUWDu+hxHQXgAvDsRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o3C1ZwkX1oOzU1VSBoxArlPkk7o8cUB81Zo7Hjlo9AI=;
 b=WO0aTp/lruevlYUtYHTrWSeIodPTdc+6BmIDNTFKVtMxprrvgX/BahpSIWy2xYqXVkiwU3rgMYxXdgtvwtacCPtIPhbtjEnD/HIIaZffga81yAjqP1gAuQBtnnuoEzI4t6d7HFOgdz1J5j5ZGb+2GFs7IQ6IIAJPUxyeVuNnLV70eLqC9XdBoLVfKpgUd0bGX7r4P6t2NxFu7peg6uAY4s+Zld5fPHZU0VsK3/C+IAOU8LVcPQQxv5deBV7hasfGOM02Wsj9GHUzZ4HpUh2KYjuP8ge7Rw1xef6HzdpEGuxDxygyUTaxbcgdXseDZ33UO8CUhxM93D9SDg0nYJtxKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3C1ZwkX1oOzU1VSBoxArlPkk7o8cUB81Zo7Hjlo9AI=;
 b=Cnh64ikE25TaANuTBOQz92r2MGjy5d/F/tnRL13VrzWnJqi++ZvtEVIfj8VJKxan06rM94zdr2xcNr9ekoTLt7B50IlawA+jTR5zCMhVPhlI7RG031GGoOcrj0eKNTTeO28trIt/ytSNqU4wgUvpcuevf8HFpOChq+ILj/0J4EYA+A8BM8T2iB41WrZCwcjNyyohTJ+Ps9cM0fIIVAUBODfS8o6SzAh69Nsl5nXJBuoxO+3YdfFfT46WVZ37sEmNzEHN3EpFidCGGP0+jCkw2xq+zgwsih+7NALmo5TqISDh1t/IyJo3eOKhLREBp6pCd5k4R/KU3H3mVqS7hrq1xw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by VI1PR04MB6894.eurprd04.prod.outlook.com (2603:10a6:803:13a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 01:22:58 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 01:22:58 +0000
Message-ID: <6aae465e-e41b-4144-a105-6424bfe1d11e@oss.nxp.com>
Date: Fri, 28 Mar 2025 09:22:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: imx-jpeg: Enhance error handling in buffer
 allocation
To: Frank Li <Frank.li@nxp.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, mirela.rabulea@oss.nxp.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 linux-imx@nxp.com, imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250327023710.549-1-ming.qian@oss.nxp.com>
 <20250327023710.549-2-ming.qian@oss.nxp.com>
 <Z+ViNIB7WqgmouYE@lizhi-Precision-Tower-5810>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <Z+ViNIB7WqgmouYE@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGBP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::31)
 To PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|VI1PR04MB6894:EE_
X-MS-Office365-Filtering-Correlation-Id: cc93b93a-2732-492a-55f7-08dd6d9712c9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QTVRekFOMnEvR0ZvU1pBU2lzSm9YVkNFRVBkQ2dZOVpUWU5jc1I4aUlFcTZR?=
 =?utf-8?B?WGJNMmZHTkkvUVpkbWFBbnVNNGNOdEJNc0h1M3loazg5cy83dFp5V1hzWlRy?=
 =?utf-8?B?UEorMDI5TXhqZzRoc0tnV2R4aWk2akh1eXFHM2dzY0JWdzFKVjUxMWRTbG5i?=
 =?utf-8?B?RUptUTJhZGc4bzFyd0RHOWQvU1VRdlR5YkNieHRTSkdPMzhaclBUelVKVWM1?=
 =?utf-8?B?TjdSREhncDZtSGJnS3c2WGN3eDhkb0t2TG5mZmN0NHBLdEZxZXpzUVh6d29P?=
 =?utf-8?B?amcyVFJSY3dzdEpiTFZiSUtOKzJ1UFhVMTFSclVnYXI2dHpqL2dici9nNzZo?=
 =?utf-8?B?OVNNeDhUUzZ1M3F5RjBieDlvT3dLMktPQVlsa2YzdjZsQTUzOXFIdlRwa2hv?=
 =?utf-8?B?ejB4N1dUM3d3ak1SOTlxai9Jc3liRzVmdnA1bVYxbEZVcjdCcUE0ZDRpSGc5?=
 =?utf-8?B?dGhsOWZmUlltcW9hKzBxUDgveXZCNVA3RlFJTEdXckpPNG1zYzlKUG85UEIx?=
 =?utf-8?B?a2FlUGZwTGxFaW5DTE1UMnFBZ3MrUHRxWE5ER2dhdEUvQzZOaGZsbnJvLytj?=
 =?utf-8?B?ajNaVWphcDZrUjBYR3VzdGJ5OFFmckk0dmt0bkxYMWgxL2Q0bktxTGFQWm1V?=
 =?utf-8?B?ZWtKaGRnMVFQOUZTb3RkcXR1M0kyZEM2aG90dC9oaTdiVWx5OStZdjhkcURp?=
 =?utf-8?B?eWZUZjRKUTRXM3c0SzduOVN6aTBFSVhRZVoyajg3Y2Zzbm5GSndHRld1YkNl?=
 =?utf-8?B?V3c2VFlHYWpmOXA2TExlSmQ0OGMrZkkvQ0pxcjRlRDM2U0tzcDhRT1l4SFJW?=
 =?utf-8?B?T0E1cGpiVm85Smc0VGVhME5jYjRrL1o5ZWdrVHp0dVY2eU01Yjd2bnZ5TnBh?=
 =?utf-8?B?YmhseERWRTNJSklOM00weHdiVFlESDNoU094dExabVhoSGRmanlaZHVkTm5D?=
 =?utf-8?B?Vyt4RWF1aGI5anphSEJEdzNYVFVGcnJ5MU5OK1oxZ3BhZEhGeVhpRzFzVUJw?=
 =?utf-8?B?M3A4akkrejBXNUd5UzNBbU1vNHVKRzlYbGd1VGk1eGxnMHhsV25jQVpwZVdP?=
 =?utf-8?B?UzZrN1ZtT3NYNU9BM09CM0V6YWRjY2VkTVhZRzFDdVpDcll4dFNzVUZTZzJw?=
 =?utf-8?B?cTlGVmVwdjRkaUM4SWdSeFdJSGhxU3RQS1dtcGxROWNYcTVSM3R3SGxscVUr?=
 =?utf-8?B?Mk0yc1JPdklTUTVmVytVbVFOUWVCYUUyR0htTEVzOWdHZUVNRWdKSkF5ZSt1?=
 =?utf-8?B?VFluTHFnYkRLeGJIL3loRDdXd0Y1Nmc3bUh2cnd0ZnFBOXFlOTV0b2llVXE2?=
 =?utf-8?B?U0tXR25hejlkUncxYmdmQmNVRkI5UGtyTXlITmhESEpFVFBVamVLWE0zNk1o?=
 =?utf-8?B?c25hQ21aejlPbXNZN1VVdlVERE5nSjlvMTBmUXQzVHpHbFFWK3FHSHNNanQv?=
 =?utf-8?B?K2s2QUFKQzUxUmpMdWtMYzNFRmtPZWlRdVJDU0UxMGJNekF0NUhNOGVObDNW?=
 =?utf-8?B?cEV2b1NtUlBnc1kxTGprRGhKbGVTQjNWd0EwSFFRelNINTE2RjZ4dXhFYVoz?=
 =?utf-8?B?TWdtcWFRWWtxeG1naWlSUUZibWdRRDR3ZHR2WGtpbW9HeWpEQWZIaXAyRzNT?=
 =?utf-8?B?amUrU3BqSWpMbHZGOHZsdTZFZDRzdmV6aE54V3BMUG1wQXhsMStGbnBXb1Bs?=
 =?utf-8?B?RXlXZDR0VW42NFdtMEpJQ3FZUFVxMHgvb2NMMjZIZEFOYm94SDBVd25GdklU?=
 =?utf-8?B?Und0aElRWnZ4NFJGellXVkpuamF3aEFsMkdaM0VTeXhjbkVtYmV5SG80YVR5?=
 =?utf-8?B?NllGRVpWbDhMQVpMMmFBajh0QkljYnhIcFlscWQ0bUY3RW13RVMvdFUzZFhn?=
 =?utf-8?Q?ViG0wu5ZxrZsV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVpZQ0JNVjBxUVdPYkxDU3gxcjlqcHpSWHdGeG9XSnlLYm0va0JETi9SRVIv?=
 =?utf-8?B?eHpucUgwanFzdFhXOEYrNm1EYlBiZ3dRaUs5WWd1L09aZXpNT09JNW4zQ2FF?=
 =?utf-8?B?Z3NkdWtMS2pLdUpoYXF2cy9pTzJPK25zWDljY0t2RnFIa3FudzB0NFZrUnJm?=
 =?utf-8?B?bDZxRXYwRU9mV3dlUmE4VDNDdm8wcTZKS2wzM0J2WHhmSEVvMk5nc2ZOdlZK?=
 =?utf-8?B?VjhOR3lyRlFQS1I2ZHdUelI5dnRtbWg1U3cyR3dDRjhMVVMrTTR5Uk9ES3VZ?=
 =?utf-8?B?MnBJcStXRURuQTFscER1a0grVTh0U25JNmsxaU1YNEJLemR6Y2VJbERpclVP?=
 =?utf-8?B?WC8zTSt2ZFJLZ1ZWSWM5b1JzL2ZaWkMwOFRyRmljQXVEUXE2ek1yVFhrcXRn?=
 =?utf-8?B?ek1mazlnb3hXWEtMQ0pFTndFUjVnbHhrQ0VvdVZEYVEwaGNQM21hTm83R1Ar?=
 =?utf-8?B?MUVVV3duY1FDalFpa2pxWUs4bVZveHg1bHplVGJGNUtvS1UvK3dZRmwwU2FU?=
 =?utf-8?B?Z1l1ekpyZ1VWL2pXU085RlNhaU9MbitIRkpUVWN6clBDK211SUNCcXc2azZ3?=
 =?utf-8?B?dUdKektyUlkvZkZReGdESURYcXFuYWRENVlKTm04VjNBVU84b3ltMFJsWkt2?=
 =?utf-8?B?dkd6MStFbzJXNVJOSHovbzV4dUw1MnV3WC9IUDFQd2JveHNIK3BnaGhhZWI2?=
 =?utf-8?B?VEpvcWFrYzJLUkFIRFBYUGhZQkxkSGdjL3JUcFpuQjcxd3BSVzNzOUJwdzR2?=
 =?utf-8?B?QXQyeVFGb2h0VjZBVWRxaUxpaXZMWGFRZ21KM3JVV1B3WXp6V203TUhWSFor?=
 =?utf-8?B?ZGhJQk01QkJHV3h6LzNCaVpFYWVjeHFqRGRDQkRsaG1DVkRWYVUwY1VJZGxj?=
 =?utf-8?B?WUJwT1UzUFRQNjUwWnlGaW9nbTl0SkxiRXMxeER2Ky9seDc3Ujl3UUFZZTBj?=
 =?utf-8?B?d252bkd6SURrWXJwdUtQVktselJkT05uSTRmaHN0Tkp1YVZsSEc3R3ZBVEdQ?=
 =?utf-8?B?aXVOZW9rNSt4S3AvTm1uZzVHZ0lnZi83VVhONTFUR2JWWHkvRlV0SFdTRzFV?=
 =?utf-8?B?RDA2Q0dZRFVwT1FDSjA0VFUzRW10Wi9RUk5YeXRYSnBYZjIySHRjK1lHZjVT?=
 =?utf-8?B?SUxPNkw0TVNQdGUzTXNaZXdTWWNDSzRSTVBrREkvWHh5QTRtdis0T0hlN1F4?=
 =?utf-8?B?bE02NFpJVlQ0ZGx5VzZndlZsMURkOWFMUHkxbVUzcm5FMFJ5ODNTNXFlbUZm?=
 =?utf-8?B?UW5jRTVZMER6SWZmQ2VyVXRQMTVUcGU0RlVSWUh0eUkyYUpvdjIrOG5TS2pu?=
 =?utf-8?B?djltYVdiem9EMTA3RURkVUZBaXVEQ2tsN2puUi91aXZFRlNaYmNoUlJFeFpB?=
 =?utf-8?B?YWRIRzlzVlJBMUVUcVJlRjQzSkIxemdJc0xuYnVubGdkQm85T3hBcWFWSTFH?=
 =?utf-8?B?bVlaUWFET1c1Z2gvYy9HcVpHL3MxTUQ3MU00Um5KeEJLaFM4ZUZrejlCU1ZP?=
 =?utf-8?B?VnFMNzBuUEhhamc1NWlVa0lOei9uVlA0NzYzelNleitITXlpcUUxTzh2WmRJ?=
 =?utf-8?B?WXFGWkw1eEZYRDIzdjdwN0pNYWw2WUhHUGx4WkxldmlTU3RTWWgwenY0aWhS?=
 =?utf-8?B?K1RSbWs3b2lpaTRJWkdtUTgrdHptSm9UT3RWK3pBUGhMaDZSdzQ4LzBOT0U4?=
 =?utf-8?B?N3Nrc0pKcmc4OUZLckNTckx1S0RZem5VUVlSTVhhNGVQRGZYL2plUGZmcFdF?=
 =?utf-8?B?UHlNcUNPb1Z3RTJYNjZISnYwd29QQnZrOHBGaVpJcTUrZ0ZHZUpQRHUrRlc1?=
 =?utf-8?B?L3llQjlpSEdFMURqb0JBU0txdlAzMmxLL3RxU1lWbHhTS2Z5N1ViTXQ0NFYx?=
 =?utf-8?B?Z1lHM1V1MzFRTmdjNFNpalkzWkp4Vm8xbGxsQmdFcHZVMWUyVTFrZStuVnBT?=
 =?utf-8?B?SzJQTGppandqNERwQjBCR29QY284T0FPMlU5SVcyS2xWd0NoNGVNYTRPdTVB?=
 =?utf-8?B?QU5ka0JpV3RSNVNPcTdOYXBkQ1AxZm4rQjh3SkduSW1xQWtKOXRyWVNqSDhz?=
 =?utf-8?B?Vys0aG9MaTgvRmRrSytKa0Z2bm9kdHBNWFNWaE5xVEUrY0xjc2lvam05ZzVt?=
 =?utf-8?Q?ff9netF4BKx9Qr5y5n2g492yI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc93b93a-2732-492a-55f7-08dd6d9712c9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 01:22:58.5500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0FakNrvnvIIOZKZk1jz03BgQnOJrnE4rTBuG/oe8PjD2wxaown54mmoVjwK9TwqqKdk403+m7uFnS4DoS424IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6894

Hi Frank,

On 2025/3/27 22:35, Frank Li wrote:
> On Thu, Mar 27, 2025 at 10:37:05AM +0800, ming.qian@oss.nxp.com wrote:
>> From: Ming Qian <ming.qian@oss.nxp.com>
>>
>> In function mxc_jpeg_alloc_slot_data, driver will allocate some dma
>> buffer, but only return error if certain allocation failed.
>>
>> Without cleanup the allocation failure, the next time it will return
>> success directly, but let some buffer be uninitialized.
>> It may result in accessing a null pointer.
>>
>> Clean up if error occurs in the allocation.
>>
>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> 
> Look like it is bug fix, add fixes tags

Yes, I missed it, I will add it in v2

Thanks,
Ming

> 
> Frank
>> ---
>>   .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 47 +++++++++++--------
>>   1 file changed, 27 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>> index 0e6ee997284b..12661c177f5a 100644
>> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>> @@ -752,6 +752,32 @@ static int mxc_get_free_slot(struct mxc_jpeg_slot_data *slot_data)
>>   	return -1;
>>   }
>>
>> +static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
>> +{
>> +	/* free descriptor for decoding/encoding phase */
>> +	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
>> +			  jpeg->slot_data.desc,
>> +			  jpeg->slot_data.desc_handle);
>> +	jpeg->slot_data.desc = NULL;
>> +	jpeg->slot_data.desc_handle = 0;
>> +
>> +	/* free descriptor for encoder configuration phase / decoder DHT */
>> +	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
>> +			  jpeg->slot_data.cfg_desc,
>> +			  jpeg->slot_data.cfg_desc_handle);
>> +	jpeg->slot_data.cfg_desc_handle = 0;
>> +	jpeg->slot_data.cfg_desc = NULL;
>> +
>> +	/* free configuration stream */
>> +	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
>> +			  jpeg->slot_data.cfg_stream_vaddr,
>> +			  jpeg->slot_data.cfg_stream_handle);
>> +	jpeg->slot_data.cfg_stream_vaddr = NULL;
>> +	jpeg->slot_data.cfg_stream_handle = 0;
>> +
>> +	jpeg->slot_data.used = false;
>> +}
>> +
>>   static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
>>   {
>>   	struct mxc_jpeg_desc *desc;
>> @@ -794,30 +820,11 @@ static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
>>   	return true;
>>   err:
>>   	dev_err(jpeg->dev, "Could not allocate descriptors for slot %d", jpeg->slot_data.slot);
>> +	mxc_jpeg_free_slot_data(jpeg);
>>
>>   	return false;
>>   }
>>
>> -static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
>> -{
>> -	/* free descriptor for decoding/encoding phase */
>> -	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
>> -			  jpeg->slot_data.desc,
>> -			  jpeg->slot_data.desc_handle);
>> -
>> -	/* free descriptor for encoder configuration phase / decoder DHT */
>> -	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
>> -			  jpeg->slot_data.cfg_desc,
>> -			  jpeg->slot_data.cfg_desc_handle);
>> -
>> -	/* free configuration stream */
>> -	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
>> -			  jpeg->slot_data.cfg_stream_vaddr,
>> -			  jpeg->slot_data.cfg_stream_handle);
>> -
>> -	jpeg->slot_data.used = false;
>> -}
>> -
>>   static void mxc_jpeg_check_and_set_last_buffer(struct mxc_jpeg_ctx *ctx,
>>   					       struct vb2_v4l2_buffer *src_buf,
>>   					       struct vb2_v4l2_buffer *dst_buf)
>> --
>> 2.43.0-rc1
>>

