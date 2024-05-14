Return-Path: <linux-media+bounces-11435-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 635738C4F05
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2024 12:29:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8706D1C20C6C
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2024 10:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 771A51350FD;
	Tue, 14 May 2024 09:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HHfghEzC";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HKCAz5zG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4460013329B;
	Tue, 14 May 2024 09:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715680031; cv=fail; b=d1bdzLHL/zH8v8GlAFHrFSSN9lkb+3NCj/rsGGF9e598VFqjQU4IRqB0CQTMXci2RBFEzZiPFl7ezeo0lF8aDqQmBiUekTIjBo8fuRTpc6UfGBLTSzEAWMbHce2iL+QYD7RdnpnHv4QQ+c02Lyc3RMrBi/BXdwJHLOlPF+4JWJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715680031; c=relaxed/simple;
	bh=m5WST1Kbg32LHgtOsRF22H/1uQRqzdOKlq2JGRRrXrc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Q0oyWI9LUACfD5yWTCqmyv7aXvRL3nNAd/BKj9Ifetr8kMZUW27HtJbiRzNKiHNoPot4LHBIdcbdGsFoFb3YkuaDLl1JRe4qA+rIqjq41Z/wBbAzABOH6cF1F0QbDMXkUU9uMJDEr2IHW89BYRb+9g+qDVolQwgERmYbfdqNouk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HHfghEzC; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=HKCAz5zG; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44DNi1O0009231;
	Tue, 14 May 2024 09:46:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=hANbnUVNnAKKPHMFeLweBOB3WWEEP8cXKnuoTO+HqnQ=;
 b=HHfghEzCZNhCGv2cHESRlEL9AMYc4uKYq1IrF8j+saZQkjKRx7SbiMCrxnpp2QkUqmbX
 +MUAxzy7vevlQDiBoHUiChKMmQt5ir1yeSYfyZCdiZ6YwHaNPrHjOd3a4MzJpT1vkzvT
 GwoOAGDH0XlftdOULensz43sxdNoiIrcI1QLOHSK+Lbpapag56Vh9g3bv3ZtQfIKBmEV
 uJ+NSkdj9C3JDsDXSXl/YAJinHxKCVCiQSW3IV6xo/usbe8lLF4DCkgbO1+6XtnUYese
 DbOiYMx8jVWU8hD+S11XnbWxBl3HFasPhH6E+jdO0ZvTzdpPpv1LTvmJLQaSGdDh32xF VA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3y3rh799xf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 May 2024 09:46:56 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44E9UpBG038335;
	Tue, 14 May 2024 09:46:55 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2041.outbound.protection.outlook.com [104.47.73.41])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3y24pvt7jy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 May 2024 09:46:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TKimr4pCiz87YertPbmHs0sMcN6PBQvBIZroY8PUO3Y6WU+q8GqCGKi4mDwy9Q2XfaVYuz8IKl/DmNPgIIOfOa76psqQ2Z+Zy5LRT+KOaa5+N3lem9TDq5JPMZoroSVy5LVieK17uxPjrvjfC2AQarAwYQz/k5a2FNpGT8y1GQhPZqSHBY7y7opeb6Ys37xIulkQf8ZHCaIT7V6zUFS+ieDCdLlsBlJsxmMzLZk73aFrtJuk9yuBPpiCOkQFPoUhaUnVdKDPy6PnKTdXmoSlwgpqeaZ8YbJko501k3FYcCTvDNgK8HwZ+/hjGWCC0xRqIxcp4LrR4GGu/5hFS5TpOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hANbnUVNnAKKPHMFeLweBOB3WWEEP8cXKnuoTO+HqnQ=;
 b=IRLykwHfogl89kaCw4LVDMkDOqrR/7u5nuGS5qvYj8hjyHNQIk79O0tpMBPZ38PRpgwif+BREpgO8cYqNk3UHOvp1gEMBLiCjtro/yKLPBW1YvwL7KN5+CORmam9h5s2SXUc2+dSoKPIjleAmuKVUODWqrhiJ8gzYtb2ErcX97ezgngOq4GFxVj3rnFgI/dMa5pDvYG/Mi6XSUa1mIXyzVmptas66htzea+9OFZLL9QcjK4sY0p8sLT1/JR22EsXkH0BFXCjix2EqCkx/IpsKRuX1bo9nPPBgw+mLYmQfWDhHlbZfXjNH+knRku4pn3TMwrJJBPztkNW7VTKoXnK+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hANbnUVNnAKKPHMFeLweBOB3WWEEP8cXKnuoTO+HqnQ=;
 b=HKCAz5zGaWxoOU3y7UZ0r+OmNv70EudYheLJDb2tmZGv+NpaoNqAM0HVJKuZtMvFb4lcnFvNIeBSUJSr2K2B1Ab/KEsATfI5PA6HUNkK9E0e7lbCRaafKDiJmrBrFv2UNoizCySOLRxyQM0+BWpzfm69Eq/hi84uaDuKpTjiVmA=
Received: from PH8PR10MB6290.namprd10.prod.outlook.com (2603:10b6:510:1c1::7)
 by SJ0PR10MB4799.namprd10.prod.outlook.com (2603:10b6:a03:2ac::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.25; Tue, 14 May
 2024 09:46:53 +0000
Received: from PH8PR10MB6290.namprd10.prod.outlook.com
 ([fe80::309b:26bb:11d5:cc76]) by PH8PR10MB6290.namprd10.prod.outlook.com
 ([fe80::309b:26bb:11d5:cc76%7]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 09:46:53 +0000
Message-ID: <f07e6b92-e133-4515-bfc9-24b24ad178d1@oracle.com>
Date: Tue, 14 May 2024 15:16:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: imx-pxp: fix ERR_PTR dereference in pxp_probe()
To: Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
        error27@gmail.com
References: <20240514094458.3463408-1-harshit.m.mogalapalli@oracle.com>
Content-Language: en-US
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
In-Reply-To: <20240514094458.3463408-1-harshit.m.mogalapalli@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: KL1PR01CA0064.apcprd01.prod.exchangelabs.com
 (2603:1096:820:5::28) To PH8PR10MB6290.namprd10.prod.outlook.com
 (2603:10b6:510:1c1::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6290:EE_|SJ0PR10MB4799:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f0d1c96-5907-4ffa-8d45-08dc73fac8d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|1800799015|366007|7416005|921011;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cFZZYlI4Y3owS1FaRWlQMzkxWVZLQXZuUUdnamR6STJzQm1rRUpOZFVRMnJ4?=
 =?utf-8?B?TGp6bEVJRkx2Z1NIQnRpYUdib1BmdDUwZitEQk8wSVFscGYrcG5sMEhVcmFz?=
 =?utf-8?B?Uzk5MGJtSWxUUUl0aU9YZksvaW52aURlY2w4STVJWGVZN3ZrcCtxc1FRM0dl?=
 =?utf-8?B?Yy80Q3MwdldQUnpqUTVRZEdRejRScjhYY0sxbGhmRXY1d1g2ZEx4aUd5VUdT?=
 =?utf-8?B?RXFGb1o0aEZPbnZ5WklDVU1jaSs3bVFBZ2hoL1R4bzZZN1g5dVVCSXl3cExv?=
 =?utf-8?B?RHFFUEhRUGVKNVNyNXAra3FqN2NaaG5EU1dmajBscjBrRlFRYWU1UnlBNkZo?=
 =?utf-8?B?TTljVGFodmY3ME0zZ0hhcWpMSmxzdXpKYmRwbE5NeTBMeGNGMjUyRTlkdWRU?=
 =?utf-8?B?ZjFOYWpjR3JMUVE0U2RuY2NNK2VnMnN3a2tQSmZzSW02MWp0Z3p2U3BPeitH?=
 =?utf-8?B?S3ZnNjJYTGVkVTBPUDA5SnRHdnZqczA2QWpjeWRheG1pL1lycldoNmVKM3Ry?=
 =?utf-8?B?V3Vsb1FkcEU4UnlFWHpNTllpUjR3NDNkT2VkeVdNeFFkMmxhV2NCSlJYcWNV?=
 =?utf-8?B?Z3F1YklQbGp2bHcyNmMzanlxSWswS0J3TGg5eU55bFhVVU9ZZjVuQXF0SHRW?=
 =?utf-8?B?NXF3Rk0vS1p3YWY3QWRIY0U1ZUl2MEgyc3dXUlZFUVV5SXVaTGpQdEFKbUZj?=
 =?utf-8?B?MENpWXBubTF0bC9oeXgrTkVVcEtqd0hlMjRMODJzUW9YL2hNWlp2U0JVVUZx?=
 =?utf-8?B?azNxMFZZU1k3Skl5ZG5IV1V0d1JTa3EvaTE0M3ppWUtnQnI2N1o3T2RFeUVp?=
 =?utf-8?B?Q0lWWGFaSmV0b3BUK0ZJbmV0LzY5ZlFWS3hKMlZZbEYxZXo3TjUwZWxnbHdN?=
 =?utf-8?B?RFRkdmM5YlVlVVEzUTZWN2xkQlVnNzZxamdzMEJuMk11VzlTRWVDN2w0dmlr?=
 =?utf-8?B?TmlvQTcvM3JJdmlWVVpZWlZKc3NqbS9ia2ZabFlQMEdPUkZvNHdDUldmaExP?=
 =?utf-8?B?eXl1UTR1NXdnMTd5TDBKQVJQUitmK3p6OCtGOEM4UWFaNEtQWmNEY2lzak05?=
 =?utf-8?B?SklURHA3TExhOENYbUd5WGswcHc4Y09sWnVta0VzYUVlOHlhazlocDAyYUpo?=
 =?utf-8?B?dzVnUlhpZ1k5eFJmdVd0ZXZISWlxVnArZUdkc3pGb1BwRlJobnd1bkw3UENT?=
 =?utf-8?B?Y002TDVBdEJ3TGhOc2JVKzcvVFdra3AraWl4U242YW05VURhL3BtcnFjemhk?=
 =?utf-8?B?cVRrdE9KcGQxQ1dMYmJWM3RsUUt0UlZteGNuNWZDWTFpYXhLS0lmWWt4b3pL?=
 =?utf-8?B?ckl6NzRrMUtZNi9MYjBJV3RvQU9iQVJwci9YRXN4c1JqdWgwTUtKTGVVSnlC?=
 =?utf-8?B?YU5DVStha1BoSzFLYXptWGNYS2NvbkZPN2ZjZ2NYU09VNmd0R1g5YTRUbU9y?=
 =?utf-8?B?ZFZoaDBsY3ErQmxTUDd2eDM4R09EWXgxNzhacVNHY1pnVUk1OWFpaCtXLzNK?=
 =?utf-8?B?dUIzdm81UGJxTUF4dzI1clFvT2ZEaXZuWnJ6a0J6NE1uVTZIb0Y0dHJmcmR1?=
 =?utf-8?B?aWx1ZlloWGhKcTZYZURaZndCQzh3Tlk4MkRhVVh4K1hvUWozT2tRcmZXZ2ZE?=
 =?utf-8?B?S1M2VDIzMFNpczRlZ0pIMmhHLytMc3NCcWxzS3FDRVVMNEpZWTRDOVo4WXhB?=
 =?utf-8?B?NEZRaFhMeVFkdUNWZ2lyb3NCbDZnUnFxWHZ5dzFUVkVnVURlTk1FblpjclZ5?=
 =?utf-8?Q?sq5ddncJTBhWK0Z4A9edvoM9vUhMZlWZ+3yoT0H?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6290.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(7416005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WkY1T2FrditzVXl3eGJsZ1YzaElSZloyZGV1Z3FrVDFqOXJVUDRjU2JGV1hp?=
 =?utf-8?B?OGpLaWplNitFU2VSTWpJSU9XaWRrWVQwMzl4eElXOXpyOGNxUDV5RG84KzBn?=
 =?utf-8?B?WHZUUEtUcm9jYm9vd2dnVnBFYWkyYWtEcHRiT3RacjhubG83QldUMFRpdWZF?=
 =?utf-8?B?TFNzeDJwMDZzckR1Qkg0cjhsSktXSzhPTnpvYWwzeGRLMUNmczRNcVdwVFJD?=
 =?utf-8?B?akhxYlFVNHFpbCtvRUlvYktES1pkRTVrUUFhNWVzUlFSOU0rb1hUSWlzU2F6?=
 =?utf-8?B?ZlhWUWorUmdEZUpSNU9KblBrNEplTmpQQkVKRlp4cmlZZmlEeTdtd25RYmpD?=
 =?utf-8?B?dUk3Qmo5eDY0dW45cS9OMk9PU2E5bDl3MTJkTU4wZ2FXbXVLbktSZkNZVSsr?=
 =?utf-8?B?a2RnU1FjYzBIOFR3QksycHYwVTRFSlFpM3F2eFhlbERRaC9xZTFzcGRzbUdj?=
 =?utf-8?B?eGk3Y3hUK1VqL1ZCOEVBMk1hR0haQm9HZC9QTndEcXVPU0RvaTNuYW1menNr?=
 =?utf-8?B?aU1tYUs3WEN1TmMrWFpweldVcHdyU0t1cGQ2SWMzbmpRYkRBeUlBYVNUVTZ2?=
 =?utf-8?B?K3FNdkhXZlBkQU1vYTA3Z2Q4MFEwY01jUGF6RkQ1dUJGSzhuOVBnaUVhcGx0?=
 =?utf-8?B?TzBoRnRIcGE0Tmh3Wlo5ODlOSXR0SHVncWVZenUxdkdxRmtBV0VaNnpzZ3lT?=
 =?utf-8?B?NUV2Q1VNUnllckpieGU5QnhWU0kzVHYxMFdIYVVqdVE2L1JsTE9SQUV2S3BL?=
 =?utf-8?B?ZjcvVitxZDNlWUlQRy9JZHBQODJJcEx4MHhiMWJrN0ZtYkZYeTNmTmhURTVM?=
 =?utf-8?B?a0FMRGNzZkp4MnRHUTFENEk1amNhRGpJc2lvcEFHVjh3YTZvellLVTdLZDV4?=
 =?utf-8?B?cnNuSGs3RGFjemRyZktCbXBJMzRxZFptSk5kWXpPSkdKZTc0dmZMTTFPNUVK?=
 =?utf-8?B?THRQRXMrajFsdFpUaTBVbkF2MWkwOGVpY21xbjJra3RFTXptdWZqVHFqaGF3?=
 =?utf-8?B?K3gyOTBBamtxSnFFR2pQdjY3L0E3UHpkd3IwUFhReDN5U0xpSHB5bnFkaFdv?=
 =?utf-8?B?Y3hKUXVLRUVoMEtBYjY1UkRHQlRlOFFWb1pqQnVrZyt6NW9Hc3V6ZkVST0tz?=
 =?utf-8?B?ZUVUd2praUNMWGNLMDhxSWJ6dDRGRmFMVlhPSVhIY0o4VExYUlJ4KzBuMTZK?=
 =?utf-8?B?NVp2bXFUSENqS1hwRlRBZ0Zpb0prRDVubWhWK2lJQ05INnFtUUd5c29zNmxC?=
 =?utf-8?B?RnMwa2IvZW5SMTVqUUUzK20xU0ljKy9TQUwzZUV5cExwQTg4eXlXWlllV09j?=
 =?utf-8?B?UXNwN1p4WTg1WXlNdU1iTkIwVlB4WDBGemdGTkhrTFlobktZSDV2dkxvMFZi?=
 =?utf-8?B?M1dpYVhORnIyelRDRU1qYU9BdnJIZXVFTGZjZ0JkVmppSUd4Ly95bXpjZCs5?=
 =?utf-8?B?eVdYR0NKVlpXdkd2SkZaSmw4YWJOb2FaMzk3aVpMUmwwNlJpMWRSY1RLZXVP?=
 =?utf-8?B?VFduWXdWWTlwb2NueHEwNjlMT3VYUDJVWGViNGJFWVpEbm0rYzIvQ2FHTUQw?=
 =?utf-8?B?YjlUTTN4TEx3Q0dtL3E1VmJ3T1BYZ1hwT0V6NUcwVEVDbWt1T3FCc21zSzNF?=
 =?utf-8?B?UE1NcFZRK0ZkSEd4cWp4a0Z4czkwTjIyaHl3cGh5aG9aNEgyYjZwZ0k5SlE1?=
 =?utf-8?B?SU9MejZUMVNKMmgvenFBbjNOMEc1Z3ZieFdvNDNDOEpDbVRyU3I5eXVxcHdW?=
 =?utf-8?B?WEtPWnNpYys5NnIyL3hJRFJQMkVMVkxWQjlMM2pLOUZsUWxYVmhrNnVJbnFX?=
 =?utf-8?B?STNtY2FRSHZUTHY4RFpUc2EwM2FqTWtNeFgrVlZpVlQrZ2d2RGVJSE9GbWZu?=
 =?utf-8?B?QnFxa3J1bDR5UFh0OWdSd092aXIrL2poUHM5YjhueC9GeUkzZE1uc2Z0NEFa?=
 =?utf-8?B?TlR4MERvZE9JbjBDaW1Ia3JPT1RXa1FpTWVYSU1wSEZ3SFVkUXd4dllXbHJE?=
 =?utf-8?B?ZDRVN3BDQk5wQjFsZXZ0eW1VdDFOZjNFNzlpYnFPZmZYbzdYSmZuWFdURkdh?=
 =?utf-8?B?cHdqYnVpSEMwV2VrUkUxSmIwMm4yUStPN0VRdXExaDJuR2pzanhFMkRRbm5B?=
 =?utf-8?B?bHRFaW1IZnhpNVRaRVZSb2lCZXNtbzZnSmUrZG0wUXpjQ051Z1gvUm0xWGt3?=
 =?utf-8?Q?vGYjOfpUrcgZuW6QTXNG79c=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	rdro3pOmh0P9n3tkbOzCKSp1qAYLrGeRAPVub642U9pV66NwN/qs4k7Ol+rRF+FRhbLZMsMP2rwmbNr/zCGmW+P6bSYYxHGEXtpc+NRv3lsxhFX2Z6+pyDkmhe4FHKOigsiX8YRc8ZpWubYWUBUWVyRd5V824oa0/SNXbLj+Bc90GwuL/fHzLY7TTTZD/eZMxWawAkOd8kA1YiS2N35XryixR/oy7rvwTALvw7vUZJ7RtNQsHx21k0QRmL8NUWOZ2Pyw+2WT7m3zxiqkvIi4c5clAXDEe7lCtUCPUCmQPAh9v6VTJT7xaNwnOAXZIi9ER6TSZseqg/tCRvxqBLFaT4a81THulAP2GRmmWirKVHA1vmSvcNhO8mOU2nzIPv3W1dq1TeXBaSTG/Tacoiu+4BkhXsk2hcazOys5PdWsTrR8chXF/81GGj76b41mSvn/ap2iKEaTy1qopA79X2nAToPBbbaqi8YiAAG4VfaHwl0I0O07vPhqPHpSa8bdwE9B12Ldo1mCXX7/OQIKkaBElqe//JhsoGbujts0/Qbtf/OkQBYIqo4d3PkGbDwDe/+bqj1FrQWkZQlAxE+eDKdluH9Nd2JUYblB9Z9Jc0VnAh0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f0d1c96-5907-4ffa-8d45-08dc73fac8d1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6290.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 09:46:53.0758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uqhk6Dy9aKlYBz8WpkRDyb3e/H0FyVw2YGCnjuTj2rFARALCuMDREl4X/1o417RuWim7DARyEF++tk+T6dsWeQsUL/rnCke7KnbAihl1FyVqwsnzykfMq6f5Pw3wsvOs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4799
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-14_04,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 mlxscore=0
 spamscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405140068
X-Proofpoint-ORIG-GUID: rBTOZiJModipkoVUVi8VLUKTn8nHIIqw
X-Proofpoint-GUID: rBTOZiJModipkoVUVi8VLUKTn8nHIIqw

Hi,
On 14/05/24 15:14, Harshit Mogalapalli wrote:
> devm_regmap_init_mmio() can fail, add a check and bail out in case of
> error.
> 

Please ignore this patch, I will send a V2.(v1->v2, I have to remove %d 
in error message)

Thanks,
Harshit
> Fixes: 4e5bd3fdbeb3 ("media: imx-pxp: convert to regmap")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---
>   drivers/media/platform/nxp/imx-pxp.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
> index e62dc5c1a4ae..58c10156c7a4 100644
> --- a/drivers/media/platform/nxp/imx-pxp.c
> +++ b/drivers/media/platform/nxp/imx-pxp.c
> @@ -1805,6 +1805,9 @@ static int pxp_probe(struct platform_device *pdev)
>   		return PTR_ERR(mmio);
>   	dev->regmap = devm_regmap_init_mmio(&pdev->dev, mmio,
>   					    &pxp_regmap_config);
> +	if (IS_ERR(dev->regmap))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(dev->regmap),
> +				     "Failed to init regmap: %d\n");
>   
>   	irq = platform_get_irq(pdev, 0);
>   	if (irq < 0)


