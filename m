Return-Path: <linux-media+bounces-40522-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7D2B2EEDC
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 08:57:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC4DAA20030
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 06:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB3F12E88AB;
	Thu, 21 Aug 2025 06:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="mto9IMnd"
X-Original-To: linux-media@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013009.outbound.protection.outlook.com [40.107.44.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6621F57C9F;
	Thu, 21 Aug 2025 06:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755759284; cv=fail; b=XPjjdk9E7AOdrq1pTilZvKID4WHTy5ZvtRtGTW5FPFxFs57vVfi5VQln5OQvPu7Os/bDIfWWAMs6bcZXsBnHhKzU0byOsLYuR+RCrYsKr5ZiZGuIwkzeptljl5V6FSJpddIJ/1Y2jIllSD1xvxhOVAhYBy0JirWyNfa5XQiqu9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755759284; c=relaxed/simple;
	bh=K1Bu8+raN+NHS+LJ1a1t4c4u+JAZGYij8BEc3BNLUdQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dN4OSrHXAyAY16HIdUhNgPhJTX5wWWEaXFojHjbt39J1z+0mhS0PyjRaxR3dmly6BI1FuCZaWKQUfSTafDi6BAOPrXwrUJ3Sm5qWg/w7mlSLWND3NWZtbiG7mOayC8Cv/G3mp4qT84gYRwNhR0NyLGaAtGqp7tXs1GKvxgZNAOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=mto9IMnd; arc=fail smtp.client-ip=40.107.44.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d+4dsyx549ONrI4BiGoIXg+nMAMaR2t3y6UrBkCYB/gD6snA6JwCbZ4kocRK4xfNEpWxbW9XblkkN2lvt9MmVFwz5vL4X6vOKI1e6nwWrFjI0N+ahL3R3bgBb7mW0lsuL57Dx/T+NyswFtvnDWtLKDN9irW/9dwafjlRuCFiKK8xC387smLuh+YcCbLscpBxWTZ8s4oMcsMBifvlDWeat5McQe2qJmS70VHVvjsovlldRyTn1JeTThJHDSGRSH6f2hDkI3EIL7ONkQFtqObMudZGOcq4KkYD4+P6T44Dnrodh6PEqQYuczSSv/DWR0NfnsKAyqWEMbwDaLkD7qCdsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FjeyCpcviHQ6TUYk+Zf7BLewdxsihzb9N1gAJK10ufk=;
 b=FCCcTOkWzt0e9PwH7Jf50NysCY8uz5GwKnx49tP578NAN08tVG6fLmXOSQdF58h9Os0XcRcO/jtJSDLlz9iURWvB1Gp5axhqe+ciAZojAJD1cR+wNn6JMJE17fzE0n8I8wwsKnjbMbIEDYPsfdfb57CzzciRfnXl6UCremciFATIsfegSMLmSEu7FfaIHF6twgWSkMuN9P0aLAR+Eq6V2rZoJUX/nafJEvTJnpo+XJjdakJDlIS6MhU1qttGpJk4TsPkh7VtuZlAiSpFxX4xcn/wpXZmjGURiafVdHB65a2ZDvt2LqC+B2b+R9DMT2al9+G4IZHH6NDF1dRIPlW+uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FjeyCpcviHQ6TUYk+Zf7BLewdxsihzb9N1gAJK10ufk=;
 b=mto9IMndrXNGPlNJbaJtOWN20DCf/iiU0Xti3uZKIylDibg1+7xuupwq8qQZfgLS8OWkth/JEUpRgCeG/kdh3BiC1vYcYS6QLGaVyVZ7h59pWRdKhIkw+wa5L1zWhyPVVQIi5LKApdmIK3cntfQMDsjjPIS2sWejvbCptRSIGN2WTDSC7acrcDVfWP/ICMug5LGPVsshxqDD7iWIKQ74Dy6ZB3h3Jh7LbSTkT4Z1Bq1m4bT5d1X/LtNUv9NmMxwdz5I+mpdNj2yeaZDk0K1VCK3kPqzkFkJWzGQzS8UhJ9J0AcXSzrwPEFjVQjFwHfqxl2eUDSSqahHhhF2oVXpmmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 KL1PR06MB6518.apcprd06.prod.outlook.com (2603:1096:820:fa::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.13; Thu, 21 Aug 2025 06:54:37 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 06:54:37 +0000
Message-ID: <fc8504b8-d8a9-4232-9d80-3681551a6de0@vivo.com>
Date: Thu, 21 Aug 2025 14:54:32 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: atomisp: use kmalloc_array() for array space
 allocation
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Colin Ian King <colin.i.king@gmail.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20250817092942.95053-1-rongqianfeng@vivo.com>
 <aKXkQ0WXaG-hMgEW@smile.fi.intel.com>
 <9a289ccf-47b1-4e24-b317-53aaa166bb83@vivo.com>
 <CAHp75Vd_fEVssDjQqn6SJWZ-W4=hpvgQ_fyS_KE3jfbaB0ZijQ@mail.gmail.com>
From: Qianfeng Rong <rongqianfeng@vivo.com>
In-Reply-To: <CAHp75Vd_fEVssDjQqn6SJWZ-W4=hpvgQ_fyS_KE3jfbaB0ZijQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYAPR03CA0013.apcprd03.prod.outlook.com
 (2603:1096:404:14::25) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|KL1PR06MB6518:EE_
X-MS-Office365-Filtering-Correlation-Id: 37630af7-ee62-4d6f-8d8f-08dde07f981f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aUloT2Fwb0kyV0FkUFNseXNmbnVWejRsdHJ3NDB2RmxDS0lCU0NQT09mZlpL?=
 =?utf-8?B?dC9tRGtSaXlSRFh5QVNPNEVPNG5jSHJTRi8wY0JLOUtJTm8zVmpFeU80MkVn?=
 =?utf-8?B?a3VVeUQ4Tlc5VUtOeDJlRFI4cW1la3B3RG9IQXhCdzdKa1d2bVNVTVRpRHp5?=
 =?utf-8?B?UjcyYlFKeGYyaDVUUHo1NkovR1VEbGU2V21HRmhTUWZxZXBaM3c1RnRFMzN6?=
 =?utf-8?B?dlcvTUpZbXArcHU4L0FPRGQrTUROaHE0OVpNc2hWSmlRLzd3MjlkNWxOWlBS?=
 =?utf-8?B?RWk3d2dUZFF1NnVvcU5ZWjdGc2FBWUx4V0tLbUxOTDVtNDJpelVOWDlQZFN4?=
 =?utf-8?B?OGN5Y3VSeXJxeVg1cG4rYy9udERsOTE5UUxsTmYrbXZHTWZZUzVobWdTZFZV?=
 =?utf-8?B?azVwYjdCR29NTUYwUGRxOFJZUDhwU1lHV3NWZGNtb0JOdEFlN3o1RzZCRFht?=
 =?utf-8?B?empTY2RKVGFhS2NvU1Z3SkZXL3FhcTR3aWwyWVU0V0FHc3IxaWVFQjhqNDZv?=
 =?utf-8?B?L2NwQUt0WHZRTFhDNnhieDNsOHNIeWsxWGNIdDRJN0RTZFFGeUJNYnZKTGwz?=
 =?utf-8?B?M1dwZThoK0ozQ2paaGFCbm1xRUpJd0xKNThyd0haVnE3bU1jNVFRQXRVZGlw?=
 =?utf-8?B?YjZDNnhOakhIR2hlWlg4WHdDV0h6cUU1ZldXOHYvWktTOWdJaXR1MHA2TEtO?=
 =?utf-8?B?S3FORE1xbEdEbW9CaGw1Ty81aEhlMHhNWFdkdVRIZjF5azRCSWppTEpXQlhw?=
 =?utf-8?B?TGxEQ09nOTJYWVo2VGcwaDJoWHVNY2hkZThTWFVUeE9SQ2pha01sTWJlbitB?=
 =?utf-8?B?bWtvVjBHUDk4QklmNGdhRHcrbEU0VENUNWtYeHhiVGpYQzJMSDJzM1hETG9H?=
 =?utf-8?B?U3QxMWdIRjlONDhHQnNvdUJyVmdTTzRhUHhsS2lGdlErMC9ZOWJZYXRJaGxx?=
 =?utf-8?B?MDBZZUJ0K3k1T1M0eWlYb2xuRm5SWnZaZCs0ZTRQdExqTU52LzFLTWwvTEpk?=
 =?utf-8?B?dlIrVlk5bFVYNFV6TzRTc250R1pDRG9TUTUrYzRhZmZyRTdZK0xRZ1lnNG9t?=
 =?utf-8?B?a3RSZ1UrRGNjWStmRzYrQk9xVkkwS3NTajhFeFlIb3NxeGdTOUd4WWRBek43?=
 =?utf-8?B?YVZySXpwSXJGVWxBMGpWRjdZb0FkWHJ3STlMMFdQck43ZFpTSi9PMjRIdDZF?=
 =?utf-8?B?NlQxblB0bitpWDFTeTNJZW54SExveGJZNzRmVFBHZFA2Mm10dUJwSEJGdnd4?=
 =?utf-8?B?N3phWnk0RG5xckc2Y2o0Y1FDdGIzVUhDUmx6VkNnQTM1aHcxMHFQbTIvNzBk?=
 =?utf-8?B?b3gvaElGSDFkdE1TN0VkMXdDRVdYMGl0RGJJOXo2UDMzR1lmc2dZbTFtM0Fr?=
 =?utf-8?B?cUFZSDczU2hlRVk4M28xVERGQ2JJZHRRdnZJNjh3TFhyd2lSeSsvL2dEWGg2?=
 =?utf-8?B?c2laVTh4bWxNSDBnb0VPRlVUNlRkeEYvZWY5elVuWkZneEFJTlRyVElwaEta?=
 =?utf-8?B?dWJGcVBVcEd5Y1N4R1ZhTDA1b1dha0RxZXZUYlYzRDB3SmhlbkZpL3ROQURH?=
 =?utf-8?B?VitqS0FGREppbjhtemgrOGVPOUZHbGF4MjgyYkJHYm5aa0ZCY01nSksyR0tS?=
 =?utf-8?B?OUFHVnRSSGpya1lKeGM3K0N6NjFsczkvbTh6UWVNVk5GbzUvaERUazJmTG9H?=
 =?utf-8?B?c2tJdmJMcG4xZUh6bnN0cEZtemsvRXZoRTJ2eWN2Z3VFVVhxa1hHcjJ4Y2xH?=
 =?utf-8?B?bGdwd21tcmErUHF0RTVOQnpwY25tY1dNZ0VvOTlvTStXbzBMb0NicXJaVUx6?=
 =?utf-8?B?aEJycG5aYmI0aUZEdjZnTVp5R0xVMEVPTTZEaUhES2ZQbUFwV05Mb0JtUlFZ?=
 =?utf-8?B?RXRQRUtEZUZVdUpGRGVuQmJ6ejdQdEJGZmxwcjNLVUgwUTVJbGlNWURVejdx?=
 =?utf-8?Q?+O9qT4H8e7w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFl5WGFBNFRUOTUrTW1PODJUNnFScDVyK0xHN2FVdEp1UG43RXZGUm54MHJZ?=
 =?utf-8?B?cGJ1UC8zN1dFRFZRcFpkNWRjd1djdWZIdUp6Q1FFWE4weVVZczJVRDRvcWlS?=
 =?utf-8?B?Nnl2OFdqUkVlcCtSSUdOT1ArdkdpSE85ajF4TjZXbTQ0YWRyeFZyL2t2aHJT?=
 =?utf-8?B?T3JEbnVMbXFTZU1zZk9WbDFaSXpTNFJUblBLbWRvUEJWRXkxTXRsSVI1VThr?=
 =?utf-8?B?RzFMenA0dnY3Zk0zU2hsaFIyQWtVREk3WnVzQjNRU3ZTZGJ3ZjRsd3JVL3Bx?=
 =?utf-8?B?ZHhDWjc0ZUtTU1g0aDltMEdUOS9idC9MS1YwOS9nZXRKK0R4bXpKM1dMK2dZ?=
 =?utf-8?B?SkdxWFBzNVZWbURCdS9NaDdxSmJUZ2VEYUE2TUNsUG5JT0J1Ty9RejduVkJj?=
 =?utf-8?B?RC9ETTFrT3JCcUxYK3pmS3pDbEhXeWFlcUxhYUxRTWFvd0VHT1FYc0R2d2M4?=
 =?utf-8?B?aHBIYndqVVl2aFRMS3NaRG5ZVkp5L3VvZ3A1Vi9mRERJQ2ttdDNZR0tId2Vn?=
 =?utf-8?B?NWRpMjg4NjU2allNTVVxM0M3cFB0TFhoRERWTHlGb3U5T3JiTkxPOGQrUnNY?=
 =?utf-8?B?RllsamxVMzhxRVczRk1EdnZZSE9qQ1BINW5PMVF4bm5La0szLzJsUmdwV3My?=
 =?utf-8?B?N1ErMFZzMXVhbkJEZm5aSVMyL3NoVXZLeHJHK2JPaUZVcFoxVWQvN3FOMEJa?=
 =?utf-8?B?QkZEcHZtYi8wbGNKNUVDRTN3RHJYWW15MDhuWktjdWRTUDhrYS9UNENHNjZM?=
 =?utf-8?B?N09sak50T3oyWDJ3cEdwRUgyZnFQTjU2UEwySDBpN2NxWUZxNDluQmJoNkJN?=
 =?utf-8?B?MDBmQjQ4TzNkZEk2YzdJOFNaM2VHaVRvRk1Pa1FlM3AveFBlMTJVa1EzTnVV?=
 =?utf-8?B?aEthK202RXZkWncrelJmTFd5SDM3MFJzU01KL3REWWhLTGJHbUZuYmdML0FW?=
 =?utf-8?B?eHdyRlpLWUZVdnA3L2RYVURRWHQ4NzJUOGVoWGNjZ1dNc2JkK2Y4VlE4UldY?=
 =?utf-8?B?aHpIR0N1ZGJ6dmhSUDc2NEZuZTdmb1drTU9kSzZSQkdiQ2NiOFhETnhjUkJQ?=
 =?utf-8?B?N2pwT0Z2RlFVLzZubnQySXVWUHhJRkl4aE44bnRrNkY1LzV3K1VCdDNUandP?=
 =?utf-8?B?Y0FCUzBoaWkxeGl2MjRVMndCOVBvSklZZXIzSERodlJxMkhoYWpmSWNMUU1l?=
 =?utf-8?B?eFAxVjc4Mjc4SUlxT2dYMmNpMWtQVkxGQ2IrYldFSUVzQVNyRVhQMHI0L05z?=
 =?utf-8?B?SUtPRUdMRGU1bktxMWUrNnhHa0RXRFJxQSthczVCTHAwL2hPT1VneFp5RVRP?=
 =?utf-8?B?WnVGWDBLUzN0YWJxcE4wU1ZWTDNYL3p5dm0zbm05KzA3d0MyMS9jNDJaMjhx?=
 =?utf-8?B?TFRMNkZ4V1JnM2lmOVJkS1ZnZDlWY05Mc05vR0hnYjZOUURKVHk3ZzNlbnZD?=
 =?utf-8?B?aTdUSTNCVm9WSWFhckdtNnVUdmVaa3Q5QVJyVGJSZFYxRDNjNEVFcmNxTDBv?=
 =?utf-8?B?bFozQ25INE1IbGdpTEUycHFXVDloZVc2NEJHMWk3Uld0UnNqK0ZLVlYxSHl3?=
 =?utf-8?B?Y2dRaktZR3JSTVltVTFWZVlGMWZwdWJ4V2NBY3NyODhzWnA3NFFhQmdHZ0hI?=
 =?utf-8?B?TkVxMkdxV2xvRnZRY041QllEanJyVmFRUE96Y0lJSEMxb3RwMWQvSlB3SHRp?=
 =?utf-8?B?dWp0MktjY21wSzNIaC82QnZQQWtrNktSZzZFbncvWVR3NU9pUE9NVFhUZHEy?=
 =?utf-8?B?ZHM5Vys3UzRjMTJOYzNQMmwvUHIzdzZ2bC92MUxZYmNicTFpQXdTOTUyUVdG?=
 =?utf-8?B?SGZoUzl4YmhNRWUwZHphb1RIajZGeGd0RHhFTEVhbFMwa1d0SlBIa2VLajM4?=
 =?utf-8?B?akpqZzFOazJSRTlFU2hDMHNIZG5EZW0vajl0QTF4MGZTWEJqd0NnWktOU2xQ?=
 =?utf-8?B?WEl0WkZpRTczZ2pUcGNNTVhGeTFFNGMycTBrbEZKZmRXNFNIRlc2VEN1Nkgy?=
 =?utf-8?B?TnYwRkZLTEo5bHhWdjJmUGpWN3dIQWoyTmtmdDZjWEl0THNCdHo5SGE4Y2dU?=
 =?utf-8?B?Z0Q3V05KdUNuNFdDUmUvbmZaUGY5bE1mN21MK2g3c3JpbEFPTGtOOXI2ZmFx?=
 =?utf-8?Q?lNDpbKH9TGyzm08ai2JMPrXDz?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37630af7-ee62-4d6f-8d8f-08dde07f981f
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 06:54:37.5859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9yghDxSpWHUGZbzbBOSzjGp9xPnEPLZky1VhMpoiv6UUstXMDJ+6Uw/vq3N//C0fn0W7sRoBki8/TYERsZkowQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6518


在 2025/8/21 12:39, Andy Shevchenko 写道:
> On Thu, Aug 21, 2025 at 6:27 AM Qianfeng Rong <rongqianfeng@vivo.com> wrote:
>> 在 2025/8/20 23:05, Andy Shevchenko 写道:
>>> On Sun, Aug 17, 2025 at 05:29:39PM +0800, Qianfeng Rong wrote:
> ...
>
>>>> -    descr->in_info = kmalloc(descr->num_stage *
>>>> -                             sizeof(struct ia_css_frame_info),
>>>> -                             GFP_KERNEL);
>>>> +    descr->in_info = kmalloc_array(descr->num_stage,
>>>> +                                   sizeof(struct ia_css_frame_info),
>>>> +                                   GFP_KERNEL);
>>> At the same time it would be nice to use sizeof(*...) variants instead of using
>>> type-based.
>> I prefer sizeof(type),
> Preference for sizeof(*...) is for a reason, and main one is the
> robustness against type changes. The shortened line is a bonus.
After checking some references, I confirm that what you said is correct.
I will send version 2. Thank you very much.
>
>> but using sizeof(*ptr) here shortens the line and
>> is indeed better.
>>
Best regards,
Qianfeng

