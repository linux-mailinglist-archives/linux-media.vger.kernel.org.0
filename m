Return-Path: <linux-media+bounces-51610-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAe5M715eGnBqAEAu9opvQ
	(envelope-from <linux-media+bounces-51610-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 09:39:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 09329912B0
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 09:39:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D501E300C7F7
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 08:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CEF429E116;
	Tue, 27 Jan 2026 08:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BdTPLD9E"
X-Original-To: linux-media@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011049.outbound.protection.outlook.com [40.107.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325322BDC2F;
	Tue, 27 Jan 2026 08:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769503154; cv=fail; b=V1CLIfhiCUVOVAi7KTgoecPmTPotrMnjFgRdVe3KmGN8uq5JD6zLaoWK7veIXdbErseOUf+EXG4GNGE27ZcLJHvXLb0f+Era4iJKoD3BEf7S9PWMmEk94s1gxdAbUz+o5f1xARRoj0+TrmyejdKJnJrL3T0YoSIE5iJcaz84w6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769503154; c=relaxed/simple;
	bh=kL1tf5sdBSnkGtHgi56+A+rVE5nnQI7sJflExr3juSk=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=F38opQuknpmM2mxiMikZYpyrc2AMV9G5NObJehMIzGDhxO8zCkfNzTOq1jdnWMDKUYTGp0c7/2yAvP3AGD88T//LRgZ8mnl8DfgO88r2NrI1U4eXKZeXKCGkgfRl04eTQjxgOrhlemHCVllc1LJAylsijHqI+vOK0fEQQ2Zosd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BdTPLD9E; arc=fail smtp.client-ip=40.107.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ULz9whKnLTa8HGgVecd/9CojvHTOOvFHJBTDkleKeYgCoAHwsRPkmKGWO6SiNym9R38K0FVFTIodBcFCN4GRFhXOnB34jWKAiKUXMbvVplyZ4kpK7JCg3YF7xy59a3FZC9Q45dsoEK0lrwwfUmTbmoAWeerhyzmNKqH75k54lGr6A4nGjinwUPaPo/TwMLLWJSNIAiYuX0jasoZDAnToUvFZmsv6V3ME17SENHorsJNIcIoiPS3lepold0Jnu97yUyiratb5zvYH8vgoZYStUhkXT2fe6qkq3XIc5zS4NKnECMPQndzmT7sYzYP/9ZA1cdSiK0oZ2dt+Szg/lXdZtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jHvEwWEpIB4agxGVMtSVeM859vSWnWg2SzrXAe70B3g=;
 b=f6YKDfQxnm4hdoCb6NUcX1YY86uDDmoKPV5U5OP82dEgevRzpAVX/Otys5vmJ5+PFJt9pn5zCQdzp+KGpD7Zn496/sp6Tk52vlwviOW5+ZTy54unG5ZgUDbvqr63/CeWP40CTMzjSdi0UDHaHcISfORrr0TpLtCX/z/N8XvMLkD5EbCcShOG74TRIfg9O2G9J+aJjRTPq2kBrHckdbPsX6K8PyEw3cZsRcDBYMRl0DGqQUICN3T5QEutCscMm4jOxUvm0NRAVhlDUrpzvlces5EzZVr5nw3dch6LyBz6aJPoK5H1Z6XS+75S1tVByHgFE+bX/pVCDUCk/T3xuMDp+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jHvEwWEpIB4agxGVMtSVeM859vSWnWg2SzrXAe70B3g=;
 b=BdTPLD9ES/HnmDplzgTFGT948wOZEthxwFsJ09rP5TbE/APl7REcwTIPlQ15U91j6zRdgKkjTKOGAi/Qx061iu9cCrGWcpQ35rJQyLUL+xZPPu6lNv5nUB1S4x/Yp7eC3uDtOZ0SdtOFWAvidTP+gWYjxE7Q8v/JM5dNP0+gY2E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by CH3PR12MB7739.namprd12.prod.outlook.com (2603:10b6:610:151::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 08:39:05 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32%7]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 08:39:04 +0000
Message-ID: <61906018-a06b-4854-a80f-ed30911725ae@amd.com>
Date: Tue, 27 Jan 2026 16:38:53 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/7] media: platform: amd: Add isp4 fw and hw interface
From: "Du, Bin" <bin.du@amd.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, sultan@kerneltoast.com,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com,
 Alexey Zagorodnikov <xglooom@gmail.com>
References: <20251216091326.111977-1-Bin.Du@amd.com>
 <20251216091326.111977-4-Bin.Du@amd.com>
 <aUkRQEeAWDeQknP6@kekkonen.localdomain>
 <92ccb38a-5c62-4730-8a41-fa80d2f523a7@amd.com>
 <b95118d9-7186-4ec8-8760-ecf6345ce875@amd.com>
Content-Language: en-US
In-Reply-To: <b95118d9-7186-4ec8-8760-ecf6345ce875@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KU2P306CA0029.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:3b::11) To LV9PR12MB9829.namprd12.prod.outlook.com
 (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|CH3PR12MB7739:EE_
X-MS-Office365-Filtering-Correlation-Id: e22d3a69-ea62-4d54-b285-08de5d7f86c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SVNua2N5cDBPTDdLUkxaL1J2RGt3bmg4aTBVL2VmcUlMQnFGVVhwMGFySi9X?=
 =?utf-8?B?OHE3Y0VCVDlYMGJ2VGNWaVY0Z0gxM3FWdHNjOXUxRS9EVWl5aElSZWxnUlpS?=
 =?utf-8?B?OGhkc1pvb1UyZk1YbHR5MUlLaS9iRXhnMUhpamg5SzlkK0NyYmRWKzg5eko2?=
 =?utf-8?B?SzcySTkxV0IybWdYWUkrUktFS3NPTzMyU0d5VDM1YWdtbzlVT3dUSzBvL0Z3?=
 =?utf-8?B?bHpxckhhNEFTTEpJUWN2QWNYTWV5dElacVpRQTNLaUVUZEN5S0tEbUxFY1JJ?=
 =?utf-8?B?dFNNZDI3SG5mY2JCMTZIZXF5Q1hvYy9Mb3l5OWVjd3BYc1lwWUNPaUVDMFdP?=
 =?utf-8?B?MXNTVmcvNnFNT2FwNmpoRXh0dlB4UjdLWlg3NGpsNThPUlBhNkt2WlpTcDYw?=
 =?utf-8?B?QitYVVlPQ05FY3pDZkJmZlpQeDlya2toM3UyMHBXMkNibWRxdUFGMzFQVitT?=
 =?utf-8?B?RVZNL0VUU25YRUdvR29Eajdsckh1bXdGcDV4UlJkWlNHeU9YODdab3lJc0Rm?=
 =?utf-8?B?RVpjejNOWUZZY0FJRlZXMGs5M1ZXMU8vdlRJT29qZkgzOFUwNzVFdFBhTVl0?=
 =?utf-8?B?SmY5WUk3K1JhTVh0bFV5eVJzOXlvY2VNNjRGNGpETXBXMU03R1FVRGQ1TWxM?=
 =?utf-8?B?Y3JCTlFCSVpobkI5VGwrOHFTSHp4RWwxMk4xOTZwTG1xanVMbnFKTjNTSi80?=
 =?utf-8?B?TC9wME1NNUZjMXM5cWV3elVwK1ZueUVSZ1pwU2VFSEU4MzlMbkZmbGxkS0VN?=
 =?utf-8?B?WnR3TGJWZFU5MW4zcTVOTzZ2dnV4NmtaRkppbEgyTVArTDlNWnJZQlFzeWFT?=
 =?utf-8?B?WjRhRzVLYTRFRUk5dlNqb0tiTVlXbW9uU2JndFc5Y1N3MzFHcGhUVm5pd0Fy?=
 =?utf-8?B?QTFGK1hWdVhSTTFwYzkvUGlIbDZiaDA4VUJrNjAvTktKNFhLdWQ3cEdyZDVZ?=
 =?utf-8?B?dDgweUFhLy9IVmkrSEswdTVieUh6QUVFWE9GZVlRMldsbTFJTDJzZEYvenBm?=
 =?utf-8?B?WFhjcW1PYWhLVGFsRm56dzBaZzVrUE9CSEVJd2VQRWNKbmtTN2VPelFKWGlN?=
 =?utf-8?B?WVBoZzlMajdmQmRLR0pXeW5YdklYNXNZeUdXenZ2NzQ0U1kyQzNPR3B0Q3ls?=
 =?utf-8?B?WkhjdG5TankzUEh6emYxUWxjdkwvS3NJU1dOZ3ZpNnN0VExJRzF2VlU2Y29V?=
 =?utf-8?B?azlwYnZPWE1uVXRpNFl4bElYOEZGZWtRTVAwb0FJcHJhU1drOFBFeDJaWldk?=
 =?utf-8?B?bXVWOXBIdE50eWw1OVE1Y1Vha0NzUUlrZUJJQnRtZnBsRndXRTJYZkRwNkg1?=
 =?utf-8?B?NEhsMEJHeCsxVllQamlFY0VsditZc3I1R3laUzlFRTlrL3BkZDFYRDFGM1RR?=
 =?utf-8?B?S1lTYm84SGxvN2N1VU1HVVlUZnR0WHpNejJWSi94ckUvYTNkUFZla0dVdmw4?=
 =?utf-8?B?YWQ3Z3pJT2hnVXd2cEhDZ0pMb1lsVTVINGMrd0RtMDlLcU15WlR5WG5nTTZv?=
 =?utf-8?B?azBEWTVzTDIxWDJoRlJNK2IvNVp1RnNnUTk1Y3VlN25kUDNsNUsrS1VGNktD?=
 =?utf-8?B?NFMvTURCaWFwNm4wck1WeFZrcVVIZ0VTbGc2NEZZOE9qRElmWWltQ3VISkNz?=
 =?utf-8?B?SEhHYStBdmxTNVQ5ZmRUbWl3L2VuU3VtMzRSZHFSZ0FCblQ5YWJTaUZRV1M0?=
 =?utf-8?B?eGlSMlZLYldzaXJ2T0JYdlJZdzBaV2FpNm1aVU1aWmlDdnpIS3VPb05Fb2Jn?=
 =?utf-8?B?TmtxQnkyRWo0Rk5YK0JhclBDWlAvVDNNKyt1RTJHd0pSSVVmQ0dOUTIwakdt?=
 =?utf-8?B?ZzJvVmMwUEZ2SFpWamhlRm5pV05rK0c4enArWHpTNUtqT3VaVUhSY0xYWTJH?=
 =?utf-8?B?ajU0MnowenJLRHNCQldJTGNoSy8xdndsRm8vOFlqRFZBZzBXRHpYMVIyTGNF?=
 =?utf-8?B?Sm56cGljL0tBRXE4cnpGUG50VXEyTmxKUjIxYWowZ1J0Z0owVkx4U0s5LzU4?=
 =?utf-8?B?NWMzdnByTUhZZFlpSFV2a1QwbkY1aStuaFRNQW1DK1BOcmVlaW1NZ3RwZStR?=
 =?utf-8?B?QWY3WWd5Mmo2bFUrUzhsazVTNnZXd09LL3QycTBFd2dDZTNoclE3VW1LK1Vx?=
 =?utf-8?Q?bfUc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzA4ejNTenVzRHF6NDVBcnJXODdHQWZ5TFcvV1pFU2FmWVArbEhBZnpxNlJF?=
 =?utf-8?B?ZEgrVFI2T0VBVGYvZW5ZU2NmTlNvWVN0MFNOQkk0RXhiZnE5VkZBVlZVemhu?=
 =?utf-8?B?YUNjaHd1UytmVCtHSk81dHN4ZWtCZzBFNHk2VE5IWXBoc3pvdFVKLzduMHE4?=
 =?utf-8?B?TS8rSm1jdXJaZGIwUnZhUWhvVDZ0aE5iS25nUE1tempXNWNZRDZjbFJxSFVq?=
 =?utf-8?B?NWVmOXRBUWFTbFNiZWhJTU0vLzd3VHFQRWRTTjJSUW42bVdZMGJMUWRqRFRM?=
 =?utf-8?B?ekIzb01RcjUvQjhoV1h3MGJkc0paOUYwMFB0Szh3NTlxY2JFZktrWTR3QWJZ?=
 =?utf-8?B?cFNrY1JKZTV1KzdTRlRldDc3R3FDNjJucjVqdUFCdmVLTHhXd0tucW5yanFZ?=
 =?utf-8?B?cE1SSnZYbTFQbzMxYXJWV3VSUDFUbXlseFU4VlNobTQ5bnJjVGV5Q0IwTWxw?=
 =?utf-8?B?a1ZwUXJBRjJkMU8xY0NjeDlYc2RkTmdvUjM3eUNmQ1VqNzlwQ3p5dkpVOTJa?=
 =?utf-8?B?emtrYnpLU0E5WlhsRlZBTWdEL25CWU5rcVhzR0VNZzdTWHh6cDgvVEJrT2Vp?=
 =?utf-8?B?dFUrMDh0TVljTTQ2R3k5eVp1MlJKOU5RQWdKWk5KeEoyY2RqcWZuKzZYeG1E?=
 =?utf-8?B?RnRqTERxRXJLK3dTL3FEQnBMT2I2cWtoMXZ1RHg1T2FlRWtwVjBFZ3FkbnQ5?=
 =?utf-8?B?QzdBNmlQWGlBc2JvQmMwK1hlV2N5azN3WnViSXhRMXhTM0Rjc0lUd3FDMTVX?=
 =?utf-8?B?eGg5OURVaDF2TlZ4ZzVFSUZPZ04vSFhzbk5oMkVybW1ycm9Va2xaWTYrSU5q?=
 =?utf-8?B?VWF1QzQvVFBQenNxb3kyVEt0VVZLeGRFUFJaODVKM2VoYm1FbEljQ1h6RUE1?=
 =?utf-8?B?Rkx6ZXdEWXpreUVxdGpUYURkZEJQZUZwdXRWVnFLSFpSRWtQeVFrWDQ3R3U0?=
 =?utf-8?B?N0RucUUzS3Y4V0Nlc2R3WWhGVjN6aTVxTmxiMk1INFVWUCtYMjN1OGRwNzN2?=
 =?utf-8?B?WFlSQnlaNTRsUkhLdEphRE5DMUo3OG5LdjhsOThoS3JHUU4wd2tMaWtabDBj?=
 =?utf-8?B?VkowVlMzSHI4ZThPNFhvUWo2cUVWRkpKQ0pMYlNhQ1o5bmlaUFl6b0wxK2Qv?=
 =?utf-8?B?V0VpSU50cmdjUFQwTEdhcGxxT3B4eis3djljcFpLNzlGaEFPbkdiM0ZyUEJ0?=
 =?utf-8?B?dDJrNHVKRklDS01nRmdjZFROYnRIU2tidnltTlFHV1A1aW5xUXhBVThldU16?=
 =?utf-8?B?bWhTejUrR3ovWWNJTzJRWnM0Kzh3NmFIZVN3K0ZIeDBuK2hyK0h6NDFwakMz?=
 =?utf-8?B?VXpYdGVhR01WNnVHMHRlcTdDenVxMHoxbENIRlFLNTI4M3ZJd25EMEtzcU8x?=
 =?utf-8?B?VjRaYXM5V1FGVGQxeGxmNUVNdThSWVo2alhPa1Blb2VrKzVVUURrZm02dERj?=
 =?utf-8?B?SFFKSGJZRWwxQW0vRFc2NElCSW5Qb2psZ0dKd0VIa0t3WGhMb1FHU1E2S2Ju?=
 =?utf-8?B?aHpDUHozdStKTkhsRFlOOXRUYTBKU3RIL0t2SXg2VnUwSmVOVDJ5ZWxFdUxZ?=
 =?utf-8?B?dkdMV2ZscFdmMHRjNW9Lc3RqdG1iS01JSXdOS1VCOXhVK2ZuTHUra3BCcnQ3?=
 =?utf-8?B?YWdiNkhUOVlJUS9MNFIxbGFwNUhHVGhGSDhKTCtVTzZ2cm1meTEwVkQ2WkFt?=
 =?utf-8?B?N2lkbWpaRXVZekkyYVpLSndnSGZ4WmgyNVBwRDZ0bW82MVdBVTVOQ000NFIr?=
 =?utf-8?B?SFp0RUYyOThhaWJIbitTcDk0QkVrc0lhR0p3bTFMYWkrdUYyajNVeVVyN2xQ?=
 =?utf-8?B?cVJZbDVxdTFxbHZzcWpYZ0psalNiRXAxeU9IdE1YS21LeHhZS0Y5dmJmd2lh?=
 =?utf-8?B?ZEdYekFRL0JQQWxCZ0pncmZYOUN1UUhwNnJ5MXZIM0dmVHNScHBaektSRDVk?=
 =?utf-8?B?UVRzdEFYTE5YUk5id0ZSWVVhaXJwSmJJOU9Vb3ZjZFptYlozS0d5blAwdVQz?=
 =?utf-8?B?dTJJKy80SFRrVS8zMjhkY3RxZjNkRDdHNnFtMytpbUpvRm50K0Jmc2lKU1ZY?=
 =?utf-8?B?RmVnYmpCanBHYnRNNjRCeENHVFI4NzVsTFdieFQwUHNpY2Vjbk1wRkE5VHNV?=
 =?utf-8?B?bGZxZkhpMjEwcWsvdmVQYjM1dTRyMmdSTjk0L2lXSkhBZ0pBalExZVRYd0FE?=
 =?utf-8?B?RVltZWduY09lZDFhT1hybkFtNEhGT1JQQTJkd2VUM2ZUY1kwZ2hoKytlZjg1?=
 =?utf-8?B?bHR0ZXRxMktVTXJrRkdndnNjWXlVYWR6M3pKbnpXMUlCSzBLd0tld3R1SzE2?=
 =?utf-8?Q?p/UCMeAEOgFq0KW6T6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e22d3a69-ea62-4d54-b285-08de5d7f86c3
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 08:39:04.6689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gW6QEEXZUY0+lw9aQMBFUCkXSe/1x4xF7cj/nl2DaOblezg+F4rSKJRlG1Vc+cU6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7739
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51610-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,xs4all.nl,ideasonboard.com,linaro.org,bp.renesas.com,vger.kernel.org,kerneltoast.com,amd.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bin.du@amd.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 09329912B0
X-Rspamd-Action: no action

Hi Sakari, apologies for any inconvenience this may cause. Would you 
please confirm the following remaining one item in the patch at your 
earliest convenience, so that we can ensure its inclusion in version 8?

On 1/20/2026 5:22 PM, Du, Bin wrote:
> Hi Sakari, there's still one left. Could you please help check it?
> 
> On 1/7/2026 4:44 PM, Du, Bin wrote:
>> Thank you, Sakari for the feedback.
>>
>> On 12/22/2025 5:37 PM, Sakari Ailus wrote:
>>> Hi Bin,
>>>
>>> On Tue, Dec 16, 2025 at 05:13:22PM +0800, Bin Du wrote:
> 
> [snip]
> 
>>>> +enum isp4fw_buffer_source {
>>>> +    /* The buffer is from the stream buffer queue */
>>>> +    BUFFER_SOURCE_STREAM,
>>>> +};
>>>
>>> Could you also use the ISP4 (or ISP4IF) prefix for these, please? 
>>> Many look
>>> rather generic.
>>>
>>
>> Thank you for highlighting this matter, since these definitions are 
>> located in isp4_fw_cmd_resp.h, ISP4_FW may be a more appropriate 
>> prefix. Just to confirm: are you suggesting that we should add this 
>> prefix to all macros and enums? For example, changing 
>> CMD_ID_SET_STREAM_CONFIG to ISP4_FW_CMD_ID_SET_STREAM_CONFIG, and 
>> BUFFER_SOURCE_STREAM to ISP4_FW _BUFFER_SOURCE_STREAM? Our initial 
>> thought was that these would only be used within ISP and shouldn't 
>> lead to any confusion.
>>
> 
> Hi Sakari, would you please help to confirm so we can decide if further 
> modification is needed.
> 
> [snip]
> 

-- 
Regards,
Bin


