Return-Path: <linux-media+bounces-47793-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3E7C8CE81
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 07:16:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68E883B0E45
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 06:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE1672D9488;
	Thu, 27 Nov 2025 06:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vD+KulhZ"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011038.outbound.protection.outlook.com [40.93.194.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931372773D3;
	Thu, 27 Nov 2025 06:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764224184; cv=fail; b=T9+kHEEqBzY3JrLuosuhfK9spfS3fTTletR7TYZ1pwE78lcnvQXthEejJ7gLZ2Y/CKVa3zwzy1gwWbsfR21osyin9tafb1O7C7WwY25CU50LcPt75xduBRDJ1M5tZYfREZtL+ogKFmUKR0dOpUuSXT9Aa0+QzH5FnEW/POlKZxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764224184; c=relaxed/simple;
	bh=81JLt2/ogi5zlWgVN2jYv3F2G2uNijkbJZEw19y+OzM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=douulrWUBVnB3yH3txGcH/MGw/49e/3NJvHeKnjeVEYlZ60gXYlQIqIEXUUWJJnK8cJc47Jgk//EqZsZRcXpPq1MEdBQy8YT9i8lcdsL2hrhhZRK8phAY1lpxub17bYijsY7TPkeUbY4Jrd80oswBzbu875aHPSS40IlvC++x2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vD+KulhZ; arc=fail smtp.client-ip=40.93.194.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yo6a5XIubKZoWaZejnXMYSq+rgsShqbXdblxFWmPSy86zADqOs7/MDFymb34rWAqaq6DwqhSvTaa+lTVFRFKdCBuB5jNJHcyruOQdl4pCEnk27PyIjkvbn86eChP6i1A5Jq9e4ub0WxV9DCPOsL01UxrP0inPFtlyfbMP1PEyCMe0x3lM1R0kad2fkbBO6tyC7I2LLHSNUndu8eINma/CxnzONL8uOd3S7QnCR3QMLQh5z6hNQ0nauq2RpinkyccYt2vmtUzS6Yq6zHFH5zkXgI2PR8k4ItEJjPK7vi5/KpGoBCQkIk8vNw3dsUCZBVA+y7p8dbcxPxxz6eaWwI95A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/p2IgnZ5IQkh9Kfocgi4gNzsHiOGoRdnaUKaTgY+7Zc=;
 b=E/Oq8Pt2L0miF/xphg7GOWilPg71wSslVxfig5hOIfVvhMDzoiVP5Xb0KDxscM4gt4pSQ/agtV8/BwwpgoxNXYN2wtqqn6LdIMUfIQPWzcqLjly9rPcyC1dbisMAe1mMFEJZ8adA3RrJGMDX+/AjrDMjADC9FbGI0pTHgJp4qpegI+25BrWRhEbcTx6GNeA3eNixqsv1+7ntpeIPBwJgHDThR7PCe2y4osxZhG7ExnUndYF845L6gcxx7bzzVMvruVeYETjNg+IJvi6+PFeWcsqQ2lOc+okhvq4ccoQ790Yo9bHSSdoHcIDgnd0N+Xbjt1BmsXtqGHW9pnYwDJPLFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/p2IgnZ5IQkh9Kfocgi4gNzsHiOGoRdnaUKaTgY+7Zc=;
 b=vD+KulhZVPquhVRq7objTusyguy2E22cR795YE+EVnHH1CD9Fb6lKsWXSWJY4lRrogtd9KxE4ZLJtqr0Dkl0wM4cvMOPj7/HKAy8qDpiZ5C5svCbE8jxChY3O/J1+6b+doAsS5qi7yBorOZEM6sC1aP2ezL3el47YQya4AhAP9I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by MN0PR12MB6367.namprd12.prod.outlook.com (2603:10b6:208:3d3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Thu, 27 Nov
 2025 06:16:16 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::c47f:251d:7b84:e6b4]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::c47f:251d:7b84:e6b4%6]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 06:16:16 +0000
Message-ID: <5305ecd5-7e7e-4ce6-b535-c04ee8a8a62f@amd.com>
Date: Thu, 27 Nov 2025 14:16:04 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] Add AMD ISP4 driver
To: Sultan Alsawaf <sultan@kerneltoast.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com
References: <aRPhMCwJjpMqAROG@sultan-box>
 <d9afc6db-fd8a-4069-a8a8-1e2d74c1db3a@amd.com> <aRQyAdyiQjhsC11h@sultan-box>
 <aRQ5aA4Gus4iCVLp@sultan-box> <591efd28-805a-4a13-b7e2-0f78a3ca3eac@amd.com>
 <aRwhuNmPRlPGxIia@sultan-box> <8288a5b3-6e56-4c9a-a772-99ca36bb7c52@amd.com>
 <aSAg1MUVZtDlCC96@sultan-box> <aSEmDlwKH6PT3i4y@sultan-box>
 <aSErtOOG5X5JG8Kl@sultan-box> <aSVg2C3mzc5DjIRi@sultan-box>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aSVg2C3mzc5DjIRi@sultan-box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGXP274CA0004.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::16)
 To LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|MN0PR12MB6367:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bcaffa6-160d-46de-cac2-08de2d7c78ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MnVUdkxxVU9kTkc3UmkrYXQxVnBxc21DUFUyYnd1THMrdU8xYTJTaUpaYmQz?=
 =?utf-8?B?V3VVZ0R5eC9sRTdZS1V4ZUJzb0cyZEVrWXVkNU5UeW1ESW5HdDRDQ04vWDBr?=
 =?utf-8?B?RUZVZGFIMkp4VXdNNzFtaHl0clJnNVBNR0k4YUxNVjB5emZxUmc3aVIzcEVs?=
 =?utf-8?B?MkdsS09OcUg4cGNsbDVPU29DZjV5cjVwUFl5WXdGdVZUZEhmQ01xWXBsQkty?=
 =?utf-8?B?NkR1Mjd5MWlxNGhEeng4Y2dVMFI4VEpqL2h1b0NLUVZIZXRRT0F0T0RwRHg2?=
 =?utf-8?B?ZnZVL1FtSi9pQTFwUnJlVndBbmsyY29QRklyUVRCY3dGaXFIZ3pHdThtd0xB?=
 =?utf-8?B?TVlZMmJNRzJXRmR2N1EyRndiTnlkVEFOMEZWVEl1Q20xb1pBQkdvM2pvYlV1?=
 =?utf-8?B?YW94Y1UvVGMvdzNzZndUMHlkOXV5OVhxOVpOY0p5UGFVazdub0J5cmpoRG5a?=
 =?utf-8?B?UFVnSlRndFdzc1NOd0czRjJOUFRTelVWZHlCUzVRMTJEbTdHa2g1WVZscVpy?=
 =?utf-8?B?cXl0VVpEQUJnV2k2K2pXbzVudVErOUlIVi9UWXdhUk1GUU1tTzRzUUVLWjlP?=
 =?utf-8?B?Rjc2THRtVGExbDloa0hqOEpKVUFtWUFIVG1ZQzhGcVlFKy9BMzZQZDlpTUVS?=
 =?utf-8?B?dlQ2V2dtOGNsVlkyamVOcnJib3hZZXl3amRsUTZvNG5hVi9MOU1mOFNOSmVP?=
 =?utf-8?B?ZWtNeU5MTVZjdisvdEpSN3liUWgyQnZWMXZ1UUdFWW00MkcyQThJY3NncTZ0?=
 =?utf-8?B?TkRrazVhTFAxMjQ4Z1NnV3FvVHlSM0wraDk0bTRUT2liUnZNUHJnRTZCZ1JL?=
 =?utf-8?B?OFZWTTJ3a1R4MEdVMjJ0Yk1OdzBiZTRJcmlmVlVpTG81YUFWdnJNSFpPVXBY?=
 =?utf-8?B?ZXhtZ1NoaGlJaVI2cG9sT2ZrdnByamE1QnN5cnB2Q1FUME44WWVPZ3J0VGhB?=
 =?utf-8?B?NTlSV2lKVXhKbVBXei9TRWNZVkhFSnlwQnk0a2FET3lmRy9MNzlFbTNRRHlC?=
 =?utf-8?B?UmpBamdsQndBLzVXT0JzODRVd0l1SGc0ZVUvSXVzK1FiWlV5Q1JuQjB3SktH?=
 =?utf-8?B?cmRHQjRpc1hvb1ZmYVBUK3ZmTHcwekhRM3Bkd3NudVBzbGRqbnIxMjlxVmE3?=
 =?utf-8?B?b2dPY0V2dnZNS0lYUXVES0xrZmRoVGY4NCs5K09RbGhkQi9JU2NnNFc2TTNY?=
 =?utf-8?B?SXNqQW5OLy9XL0xnK3NpbWU2Q2xMSUlXdjJXQ3VYbmM3WmlzQ1lSbjRhSi9u?=
 =?utf-8?B?RDB3ek4zNVo2VWNDZGI2Y1R3bVVaSGthZTBrSVlNYXZuV1lKWGs3S0lwUHl1?=
 =?utf-8?B?Z0FGUzJRNVFmaXRLRlpNaDZoZnRrczh2K09EMmlDNEJsVkN3TXprQitMZGkw?=
 =?utf-8?B?TFp3OFFzZnRoUVpoVFFpN0w2THR1V3hXLzB1SFdSaktLdHU4ajQwMWovaDdB?=
 =?utf-8?B?bjZlbldremJvaVFTWGQ1VUlOc2ZJQ2U1elAxYVFSaHc5QlI2M2JIdlZncFJV?=
 =?utf-8?B?Nk14d2NWNldLcFo1YVRjN3dTWVBHMkViOUhEZzBKNXBmN1I3SWRTTXRsdlU0?=
 =?utf-8?B?RTBhM01rUTZOZkdrK1ZxejFDMW9pQ3BxeStvQnkyRy9SWFcvdGYzZERPcEh0?=
 =?utf-8?B?VjlMaEZ5alN1YnZnT1hMREFvUkhwcGdXYjRTdnlndzByNFgwSk9jSWx3Rlo3?=
 =?utf-8?B?L3ROaGpWL1VRalk5V2dZajhoSG1FZDFSbjlicmJ4RFl2RS9zOWk1UFlHOHpB?=
 =?utf-8?B?OW1UdlkyS1pGdFJod2w1RkFoWjl0N0xnQzZpTC9rTzJQLzl2Zi9BRERvRHAv?=
 =?utf-8?B?YUl6RmRHV2tOYlNvNFFqY2REb1pqRlFlcmNiRlp3aDRwQzdaTmJJdmd6SURP?=
 =?utf-8?B?MTRTOFE5U3VIcmQ4a0QydU8zUGI1aGdJc09yTnZEd0Zxbmx4ZnIwZGdnWmx3?=
 =?utf-8?B?RkNINzlFd1ZKcjhuTXRwS2h4ZFJBbCtFMUtyVGV4Z3pOdlltc2I0QVArL0Ro?=
 =?utf-8?B?em9OR3o4NGxRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlhtemExTVd0OFVwU2JxYmhQa250c0RlZDBSYStxbjQxY0phczBhQTFDNXht?=
 =?utf-8?B?ZGxJbW1qVG5maHcrRGNLMHBTeG5OYzB2MnlCelFnNWJub01oZ1ZZQm9qWHJP?=
 =?utf-8?B?Zlh6UmxDU296K043WFYvblArM1lwcDVUSFVQTk03aElUbXlhMVlZTE9tcmg5?=
 =?utf-8?B?QjFqUXVzMW9PS05NM0ZZNG5PREdEb1BKTVA1UENmRXU2dVltdUNUSnZac3Z2?=
 =?utf-8?B?UzNXQVFCU3VBeFM0eE5XQWljdzJQTzVZR0hXS1hPcUhHMUQvblcxU2E1bjBO?=
 =?utf-8?B?dlM1YThJeERidjdkVG1wWmVpR0xzQmtqZG00bXZQS2pLWjZJOGR4VnZTU2Vh?=
 =?utf-8?B?SUxGOEFqWlpzNUc4UWlZRENzclVlM2JnM1BBSUJSd1k4OWcvekttVWtXK05Q?=
 =?utf-8?B?K1BMNmlTRWxVeDZJRW81SDArWDZuTkU1MkYybDVRMjJXc0I0M1d3NEhXZDky?=
 =?utf-8?B?Rm5sTmhMNmJYYzh5dmdIRkM5dWZzNkJLYUkxQ1MrdHVSdm5QSExQZzkrTDZE?=
 =?utf-8?B?MStJcjRKYmxqSDVZZ0llZE1KbElFdWIvamZGWFhaVjVkbGR3WXN5bkJqTmZM?=
 =?utf-8?B?czU1V1IrQi9rSGRNOGNBV3JWYUhwUjQ0WTdqQjhKUGV0NnZtTW11dHhhQStr?=
 =?utf-8?B?MllIKzRPSGs4Qng2WU1iVklyYTFTK05CbXdwdTBvVy9DVTBXdzZNaFNBWCtK?=
 =?utf-8?B?N2c2a3BmN1ZEcFVMdE42S3haS3NGamRQczRORVExY3NWeVdMeDlwS2kybTBG?=
 =?utf-8?B?RVpCdHljZ2tCMHFjejdMbEtPSzdXV2NpV3FSOEw5TTBGV09zM2ZQUGQ0NG1Q?=
 =?utf-8?B?QWdCeFEvSXFnL205QTlNeE9PMVNOcjZPZ3lmRWFRRzBFNFYyRzlsKzFFUFha?=
 =?utf-8?B?YXYweWhZSmtOaHlUQnpZeFg3OVFOOEdEK2I0c1Q4R1RqWHlVL0IreFlNeFZC?=
 =?utf-8?B?Z09UQWwzVEZUWlp1ZHE1N0J6ZzJGZUh3S2R2bWdSTUVkV1diNEtsZU9lbG5k?=
 =?utf-8?B?RkdTSkc1TU4vNm83WXRESGdCNU9TcmpnK21uZEsxbVBkdG5oWG0za2UvbnJO?=
 =?utf-8?B?amYxakZvNDFMM1hMbFBTVzY2cmdVci8reVJSMy9wQWJ5UVlmWFpiV3FxVlJs?=
 =?utf-8?B?ZmpVUThIa1FTcGRBVHJXQTFWTFdHR09WR0hlK0F4b012MUJpZXBYSlVOSS9S?=
 =?utf-8?B?Sy95NG9hZ2k0dzNsemNWMStZRXRDeklXc1VvRWNhUHZJY3J3Z1M1MmJFeS9x?=
 =?utf-8?B?T3FxZ2pVeWpRaXdIcGFMR0Jlc0xzN0dTVmwyeXJsbXBsQ1FPSFBiaWMvdjBE?=
 =?utf-8?B?Sk1NMXRXNmJwY2ZxMUFQQWRTN05HbjNpUEFRcUhBaS82MWNIN3BRUHdhTU56?=
 =?utf-8?B?Rm4vbkVNQmEwSWg0N29Rdmc2ZDRIR0kxcG1UdnZnU3dwVHBqMVpNWUdVR0RK?=
 =?utf-8?B?d3BWZUI2aGthcUtiZkJpRSs5aGdMUDFZWE5ydmlvTjA3K3RyK095Yjc1TWNZ?=
 =?utf-8?B?OE8yQUozNk5jT2dUTG5QZ3h2cTNXOXJGTi9SaE5STjhlZ2haZkdtZFAvcjQ5?=
 =?utf-8?B?ZmljRFFWdi9vUkNlb2lkM3pQYVlMTkg5dG1LTUROYTF6NzBPOEJvaDloMGZT?=
 =?utf-8?B?bnY3TDFSLzZ1TFk2TVVCcFFWa24va1dKVjVodGhDenc1US85VmVVRWFZN1pr?=
 =?utf-8?B?RGwrdVhraDI4dC9TZnB4S05KdEFOVVpRZFUxMUNHWW5EVUxMdFRoZHdSekdR?=
 =?utf-8?B?WG9ENURQN0dvRHpHbzlsZnlZM3VSOTBWeEpKZTAvdHc4MTlKUjZkYy9yQk5Z?=
 =?utf-8?B?U2tCZThGczB2ZUxuRmVWWEd4UjU2REtKSEF0Q1dBK1A5dzRBUGp2L0dYNjhm?=
 =?utf-8?B?aU1sQkJiNW1FN3F2VmkweXRFNzVnQXJWUHN3dUp6TEtJdjFRR3oyVXBTSmc0?=
 =?utf-8?B?dHBlYlc3anRIUGUzeEp1SWZ2REtpYXA2Y01UNnFQa3dnbGdnK0pHUUE1UEJq?=
 =?utf-8?B?dE9sTWcyWnZ5QXBIRm5ycDBlM3BVZ1FxYktCdFRSTStBYm9tdWswQUh5eW9K?=
 =?utf-8?B?MEtINWtNNE1RYlQvTTJFbnZjMy9idVlQLzJCWHBjdHNLbklZRGF5S0doQWps?=
 =?utf-8?Q?ELwM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bcaffa6-160d-46de-cac2-08de2d7c78ac
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 06:16:16.0294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6/2XLtLisOVoncxoc6yleMDSYgIvBt1eimT8YGljR8ydMA5ZCuqW+Ju92zWCbtB1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6367



On 11/25/2025 3:55 PM, Sultan Alsawaf wrote:
> On Fri, Nov 21, 2025 at 07:19:16PM -0800, Sultan Alsawaf wrote:
>> On Fri, Nov 21, 2025 at 06:55:10PM -0800, Sultan Alsawaf wrote:
>>> On Fri, Nov 21, 2025 at 12:20:36AM -0800, Sultan Alsawaf wrote:
>>>> On Wed, Nov 19, 2025 at 06:14:17PM +0800, Du, Bin wrote:
>>>>>
>>>>>
>>>>> On 11/18/2025 3:35 PM, Sultan Alsawaf wrote:
>>>>>> On Wed, Nov 12, 2025 at 06:21:33PM +0800, Du, Bin wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 11/12/2025 3:38 PM, Sultan Alsawaf wrote:
>>>>>>>> On Tue, Nov 11, 2025 at 11:06:41PM -0800, Sultan Alsawaf wrote:
>>>>>>>>> On Wed, Nov 12, 2025 at 02:32:51PM +0800, Du, Bin wrote:
>>>>>>>>>> Thanks Sultan for your information.
>>>>>>>>>>
>>>>>>>>>> On 11/12/2025 9:21 AM, Sultan Alsawaf wrote:
>>>>>>>>>>> On Tue, Nov 11, 2025 at 03:33:42PM -0800, Sultan Alsawaf wrote:
>>>>>>>>>>>> On Tue, Nov 11, 2025 at 05:58:10PM +0800, Du, Bin wrote:
>>>>>>>>>>>>>
>>>>>>>>>>>>> On 11/11/2025 5:05 PM, Sultan Alsawaf wrote:
>>>>>>>>>>>>>
>>>>>>>>>>>>>> On Mon, Nov 10, 2025 at 05:46:28PM +0800, Du, Bin wrote:
>>>>>>>>>>>>>>> Thank you, Sultan, for your time, big effort, and constant support.
>>>>>>>>>>>>>>> Apologies for my delayed reply for being occupied a little with other
>>>>>>>>>>>>>>> matters.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> On 11/10/2025 4:33 PM, Sultan Alsawaf wrote:
>>>>>>>>>>>>>>>> Hi Bin,
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> On Wed, Nov 05, 2025 at 01:25:58AM -0800, Sultan Alsawaf wrote:
>>>>>>>>>>>>>>>>> Hi Bin,
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> To expedite review, I've attached a patch containing a bunch of fixes I've made
>>>>>>>>>>>>>>>>> on top of v5. Most of my changes should be self-explanatory; feel free to ask
>>>>>>>>>>>>>>>>> further about specific changes if you have any questions.
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> I haven't had a chance to review all of the v4 -> v5 changes yet, but I figured
>>>>>>>>>>>>>>>>> I should send what I've got so far.
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> FYI, there is a regression in isp4if_dequeue_buffer() where the bufq lock isn't
>>>>>>>>>>>>>>>>> protecting the list_del() anymore. I also checked the compiler output when using
>>>>>>>>>>>>>>>>> guard() versus scoped_guard() in that function and there is no difference:
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>         sha1sum:
>>>>>>>>>>>>>>>>>         5652a0306da22ea741d80a9e03a787d0f71758a8  isp4_interface.o // guard()
>>>>>>>>>>>>>>>>>         5652a0306da22ea741d80a9e03a787d0f71758a8  isp4_interface.o // scoped_guard()
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> So guard() should be used there again, which I've done in my patch.
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> I also have a few questions:
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> 1. Does ISP FW provide a register interface to disable the IRQ? If so, it is
>>>>>>>>>>>>>>>>>          faster to use that than using disable_irq_nosync() to disable the IRQ from
>>>>>>>>>>>>>>>>>          the CPU's side.
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> 2. When the IRQ is re-enabled in isp4sd_fw_resp_func(), is there anything
>>>>>>>>>>>>>>>>>          beforehand to mask all pending interrupts from the ISP so that there isn't a
>>>>>>>>>>>>>>>>>          bunch of stale interrupts firing as soon the IRQ is re-enabled?
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> 3. Is there any risk of deadlock due to the stream kthread racing with the ISP
>>>>>>>>>>>>>>>>>          when the ISP posts a new response _after_ the kthread determines there are no
>>>>>>>>>>>>>>>>>          more new responses but _before_ the enable_irq() in isp4sd_fw_resp_func()?
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> 4. Why are some lines much longer than before? It seems inconsistent that now
>>>>>>>>>>>>>>>>>          there is a mix of several lines wrapped to 80 cols and many lines going
>>>>>>>>>>>>>>>>>          beyond 80 cols. And there are multiple places where code is wrapped before
>>>>>>>>>>>>>>>>>          reaching 80 cols even with lots of room left, specifically for cases where it
>>>>>>>>>>>>>>>>>          wouldn't hurt readability to put more characters onto each line.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> I've attached a new, complete patch of changes to apply on top of v5. You may
>>>>>>>>>>>>>>>> ignore the incomplete patch from my previous email and use the new one instead.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> I made many changes and also answered questions 1-3 myself.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Please apply this on top of v5 and let me know if you have any questions.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Sure, will review, apply and test your patch accordingly. Your contribution
>>>>>>>>>>>>>>> is greatly appreciated, will let you know if there is any question or
>>>>>>>>>>>>>>> problem.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> BTW, I noticed a strange regression in v5 even without any of my changes: every
>>>>>>>>>>>>>>>> time you use cheese after using it one time, the video will freeze after 30-60
>>>>>>>>>>>>>>>> seconds with this message printed to dmesg:
>>>>>>>>>>>>>>>>         [ 2032.716559] amd_isp_capture amd_isp_capture: -><- fail respid unknown respid(0x30002)
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> And the video never unfreezes. I haven't found the cause for the regression yet;
>>>>>>>>>>>>>>>> can you try to reproduce it?
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Really weird, we don't see this issue either in dev or QA test. Is it 100%
>>>>>>>>>>>>>>> reproducible and any other fail or err in the log?
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Yes, it's 100% reproducible. There's no other message in dmesg, only that one.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Sometimes there is a stop stream error when I close cheese after it froze:
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>        [  656.540307] amd_isp_capture amd_isp_capture: fail to disable stream
>>>>>>>>>>>>>>        [  657.046633] amd_isp_capture amd_isp_capture: fail to stop steam
>>>>>>>>>>>>>>        [  657.047224] amd_isp_capture amd_isp_capture: disabling streaming failed (-110)
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> When I revert to v4 I cannot reproduce it at all. It seems to be something in
>>>>>>>>>>>>>> v4 -> v5 that is not fixed by any of my changes.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> Hi Sultan, could you please try following modifications on top of v5 to see
>>>>>>>>>>>>> if it helps?
>>>>>>>>>>>>>
>>>>>>>>>>>>> diff --git a/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>>>>>>>>>>>>> b/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>>>>>>>>>>>>> index 39c2265121f9..d571b3873edb 100644
>>>>>>>>>>>>> --- a/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>>>>>>>>>>>>> +++ b/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>>>>>>>>>>>>> @@ -97,7 +97,7 @@
>>>>>>>>>>>>>
>>>>>>>>>>>>> #define ADDR_SPACE_TYPE_GPU_VA          4
>>>>>>>>>>>>>
>>>>>>>>>>>>> -#define FW_MEMORY_POOL_SIZE             (200 * 1024 * 1024)
>>>>>>>>>>>>> +#define FW_MEMORY_POOL_SIZE             (100 * 1024 * 1024)
>>>>>>>>>>>>>
>>>>>>>>>>>>> /*
>>>>>>>>>>>>>       * standard ISP mipicsi=>isp
>>>>>>>>>>>>> diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c
>>>>>>>>>>>>> b/drivers/media/platform/amd/isp4/isp4_subdev.c
>>>>>>>>>>>>> index 248d10076ae8..acbc80aa709e 100644
>>>>>>>>>>>>> --- a/drivers/media/platform/amd/isp4/isp4_subdev.c
>>>>>>>>>>>>> +++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
>>>>>>>>>>>>> @@ -697,7 +697,7 @@ static int isp4sd_stop_resp_proc_threads(struct
>>>>>>>>>>>>> isp4_subdev *isp_subdev)
>>>>>>>>>>>>>             return 0;
>>>>>>>>>>>>> }
>>>>>>>>>>>>>
>>>>>>>>>>>>> -static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev)
>>>>>>>>>>>>> +static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev, bool
>>>>>>>>>>>>> irq_enabled)
>>>>>>>>>>>>> {
>>>>>>>>>>>>>             struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
>>>>>>>>>>>>>             unsigned int perf_state = ISP4SD_PERFORMANCE_STATE_LOW;
>>>>>>>>>>>>> @@ -716,8 +716,9 @@ static int isp4sd_pwroff_and_deinit(struct isp4_subdev
>>>>>>>>>>>>> *isp_subdev)
>>>>>>>>>>>>>                     return 0;
>>>>>>>>>>>>>             }
>>>>>>>>>>>>>
>>>>>>>>>>>>> -       for (int i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++)
>>>>>>>>>>>>> -               disable_irq(isp_subdev->irq[i]);
>>>>>>>>>>>>> +       if (irq_enabled)
>>>>>>>>>>>>> +               for (int i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++)
>>>>>>>>>>>>> +                       disable_irq(isp_subdev->irq[i]);
>>>>>>>>>>>>>
>>>>>>>>>>>>>             isp4sd_stop_resp_proc_threads(isp_subdev);
>>>>>>>>>>>>>             dev_dbg(dev, "isp_subdev stop resp proc streads suc");
>>>>>>>>>>>>> @@ -813,7 +814,7 @@ static int isp4sd_pwron_and_init(struct isp4_subdev
>>>>>>>>>>>>> *isp_subdev)
>>>>>>>>>>>>>
>>>>>>>>>>>>>             return 0;
>>>>>>>>>>>>> err_unlock_and_close:
>>>>>>>>>>>>> -       isp4sd_pwroff_and_deinit(isp_subdev);
>>>>>>>>>>>>> +       isp4sd_pwroff_and_deinit(isp_subdev, false);
>>>>>>>>>>>>>             return -EINVAL;
>>>>>>>>>>>>> }
>>>>>>>>>>>>>
>>>>>>>>>>>>> @@ -985,7 +986,7 @@ static int isp4sd_set_power(struct v4l2_subdev *sd, int
>>>>>>>>>>>>> on)
>>>>>>>>>>>>>             if (on)
>>>>>>>>>>>>>                     return isp4sd_pwron_and_init(isp_subdev);
>>>>>>>>>>>>>             else
>>>>>>>>>>>>> -               return isp4sd_pwroff_and_deinit(isp_subdev);
>>>>>>>>>>>>> +               return isp4sd_pwroff_and_deinit(isp_subdev, true);
>>>>>>>>>>>>> }
>>>>>>>>>>>>>
>>>>>>>>>>>>> static const struct v4l2_subdev_core_ops isp4sd_core_ops = {
>>>>>>>>>>>>
>>>>>>>>>>>> No difference sadly; same symptoms as before. FYI, your email client broke the
>>>>>>>>>>>> patch formatting so I couldn't apply it; it hard wrapped some lines to 80 cols,
>>>>>>>>>>>> replaced tabs with spaces, and removed leading spaces on each context line, so I
>>>>>>>>>>>> had to apply it manually. To confirm I applied it correctly, here is my diff:
>>>>>>>>>>>>
>>>>>>>>>>>> diff --git a/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h b/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>>>>>>>>>>>> index 39c2265121f9..d571b3873edb 100644
>>>>>>>>>>>> --- a/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>>>>>>>>>>>> +++ b/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>>>>>>>>>>>> @@ -97,7 +97,7 @@
>>>>>>>>>>>>      #define ADDR_SPACE_TYPE_GPU_VA          4
>>>>>>>>>>>> -#define FW_MEMORY_POOL_SIZE             (200 * 1024 * 1024)
>>>>>>>>>>>> +#define FW_MEMORY_POOL_SIZE             (100 * 1024 * 1024)
>>>>>>>>>>>>      /*
>>>>>>>>>>>>       * standard ISP mipicsi=>isp
>>>>>>>>>>>> diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
>>>>>>>>>>>> index 4bd2ebf0f694..500ef0af8a41 100644
>>>>>>>>>>>> --- a/drivers/media/platform/amd/isp4/isp4_subdev.c
>>>>>>>>>>>> +++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
>>>>>>>>>>>> @@ -669,7 +669,7 @@ static int isp4sd_stop_resp_proc_threads(struct isp4_subdev *isp_subdev)
>>>>>>>>>>>>      	return 0;
>>>>>>>>>>>>      }
>>>>>>>>>>>> -static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev)
>>>>>>>>>>>> +static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev, bool irq_enabled)
>>>>>>>>>>>>      {
>>>>>>>>>>>>      	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
>>>>>>>>>>>>      	unsigned int perf_state = ISP4SD_PERFORMANCE_STATE_LOW;
>>>>>>>>>>>> @@ -688,8 +688,9 @@ static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev)
>>>>>>>>>>>>      		return 0;
>>>>>>>>>>>>      	}
>>>>>>>>>>>> -	for (int i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++)
>>>>>>>>>>>> -		disable_irq(isp_subdev->irq[i]);
>>>>>>>>>>>> +	if (irq_enabled)
>>>>>>>>>>>> +		for (int i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++)
>>>>>>>>>>>> +			disable_irq(isp_subdev->irq[i]);
>>>>>>>>>>>>      	isp4sd_stop_resp_proc_threads(isp_subdev);
>>>>>>>>>>>>      	dev_dbg(dev, "isp_subdev stop resp proc streads suc");
>>>>>>>>>>>> @@ -785,7 +786,7 @@ static int isp4sd_pwron_and_init(struct isp4_subdev *isp_subdev)
>>>>>>>>>>>>      	return 0;
>>>>>>>>>>>>      err_unlock_and_close:
>>>>>>>>>>>> -	isp4sd_pwroff_and_deinit(isp_subdev);
>>>>>>>>>>>> +	isp4sd_pwroff_and_deinit(isp_subdev, false);
>>>>>>>>>>>>      	return -EINVAL;
>>>>>>>>>>>>      }
>>>>>>>>>>>> @@ -957,7 +958,7 @@ static int isp4sd_set_power(struct v4l2_subdev *sd, int on)
>>>>>>>>>>>>      	if (on)
>>>>>>>>>>>>      		return isp4sd_pwron_and_init(isp_subdev);
>>>>>>>>>>>>      	else
>>>>>>>>>>>> -		return isp4sd_pwroff_and_deinit(isp_subdev);
>>>>>>>>>>>> +		return isp4sd_pwroff_and_deinit(isp_subdev, true);
>>>>>>>>>>>>      }
>>>>>>>>>>>>      static const struct v4l2_subdev_core_ops isp4sd_core_ops = {
>>>>>>>>>>>>
>>>>>>>>>>>>> On the other hand, please also add the patch in amdgpu which sets *bo to
>>>>>>>>>>>>> NULL in isp_kernel_buffer_alloc() which you mentioned in another thread.
>>>>>>>>>>>>
>>>>>>>>>>>> Yep, I have been doing all v5 testing with that patch applied.
>>>>>>>>>>>>
>>>>>>>>>>>> BTW, I have verified the IRQ changes are not the cause for the regression; I
>>>>>>>>>>>> tested with IRQs kept enabled all the time and the issue still occurs.
>>>>>>>>>>>>
>>>>>>>>>>>> I did observe that ISP stops sending interrupts when the video stream freezes.
>>>>>>>>>>>> And, if I replicate the bug enough times, it seems to permanently break FW until
>>>>>>>>>>>> a full machine reboot. Reloading amd_capture with the v4 driver doesn't recover
>>>>>>>>>>>> the ISP when this happens.
>>>>>>>>>>>>
>>>>>>>>>>>> As an improvement to the driver, can we do a hard reset of ISP on driver probe?
>>>>>>>>>>>> I am assuming hardware doesn't need too long to settle after hard reset, maybe
>>>>>>>>>>>> a few hundred milliseconds? This would ensure ISP FW is always in a working
>>>>>>>>>>>> state when the driver is loaded.
>>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Actually, each time the camera is activated, the ISP driver powers on the
>>>>>>>>>> ISP and initiates its firmware from the beginning; when the camera is
>>>>>>>>>> closed, the ISP is powered off..
>>>>>>>>>
>>>>>>>>> Hmm, well I am able to put the ISP in a completely unusable state that doesn't
>>>>>>>>> recover when I unload and reload amd_capture. Or maybe it is the sensor that is
>>>>>>>>> stuck in a broken state?
>>>>>>>>
>>>>>>>> Here is the log output when I try to start cheese after unloading and reloading
>>>>>>>> amd_capture, where the ISP is in the broken state that requires rebooting the
>>>>>>>> laptop (annotated with notes of what I saw/did at each point in time):
>>>>>>>>
>>>>>>>> ==> opened cheese
>>>>>>>> ==> cheese froze after a few seconds
>>>>>>>> ==> closed cheese
>>>>>>>>      [   34.570823] amd_isp_capture amd_isp_capture: fail to disable stream
>>>>>>>>      [   35.077503] amd_isp_capture amd_isp_capture: fail to stop steam
>>>>>>>>      [   35.077525] amd_isp_capture amd_isp_capture: disabling streaming failed (-110)
>>>>>>>> ==> unloaded amd_capture
>>>>>>>> ==> loaded amd_capture
>>>>>>>> ==> opened cheese
>>>>>>>>      [  308.039721] amd_isp_capture amd_isp_capture: ISP CCPU FW boot failed
>>>>>>>>      [  308.043961] amd_isp_capture amd_isp_capture: fail to start isp_subdev interface
>>>>>>>>      [  308.044188] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>>      [  308.044194] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>>      [  308.044196] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>>      [  308.044197] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>>      [  308.044198] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>>      [  308.044198] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>>      [  308.044199] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>>      [  308.044200] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>>      [  308.044200] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>>      [  308.044201] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>>      [  308.044202] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>>      [  308.065226] amd_isp_capture amd_isp_capture: power up isp fail -22
>>>>>>>>      [  308.174814] amd_isp_capture amd_isp_capture: ISP CCPU FW boot failed
>>>>>>>>      [  308.177807] amd_isp_capture amd_isp_capture: fail to start isp_subdev interface
>>>>>>>>      [  308.178036] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>>      [  308.178043] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>>      [  308.178044] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>>      [  308.178045] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>>      [  308.178046] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>>      [  308.178047] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>>      [  308.178048] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>>      [  308.178048] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>>      [  308.178049] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>>      [  308.178050] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>>      [  308.178050] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>>      [  308.198776] amd_isp_capture amd_isp_capture: power up isp fail -22
>>>>>>>>      [  308.306835] amd_isp_capture amd_isp_capture: ISP CCPU FW boot failed
>>>>>>>>      [  308.311533] amd_isp_capture amd_isp_capture: fail to start isp_subdev interface
>>>>>>>>      [  308.311723] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>>      [  308.311723] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>>      [  308.311724] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>>      [  308.311725] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>>      [  308.311725] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>>      [  308.311726] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>>      [  308.311726] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>>      [  308.311726] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>>      [  308.311727] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>>      [  308.311727] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>>      [  308.311727] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>>      [  308.335281] amd_isp_capture amd_isp_capture: power up isp fail -22
>>>>>>>>
>>>>>>>
>>>>>>> Thanks Sultan for the detailed info, I agree with you, tend to believe it
>>>>>>> may related to the sensor, I will follow up with the FW team to investigate
>>>>>>> further.
>>>>>>>
>>>>>>>>>>>> Thanks,
>>>>>>>>>>>> Sultan
>>>>>>>>>>>
>>>>>>>>>>> A small update: I reproduced the issue on v4, but it took several more cycles of
>>>>>>>>>>> closing/opening cheese and waiting 30s compared to v5.
>>>>>>>>>>>
>>>>>>>>>>> Right now my best guess is that this is a timing issue with respect to FW that
>>>>>>>>>>> was exposed by the v5 changes. v5 introduced slight changes in code timing, like
>>>>>>>>>>> with the mutex locks getting replaced by spin locks.
>>>>>>>>>>>
>>>>>>>>>>> I'll try to insert mdelays to see if I can expose the issue that way on v4.
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Could you kindly provide the FW used?
>>>>>>>>>
>>>>>>>>>      commit a89515d3ff79f12099f7a51b0f4932b881b7720e
>>>>>>>>>      Author: Pratap Nirujogi <pratap.nirujogi@amd.com>
>>>>>>>>>      Date:   Thu Aug 21 15:40:45 2025 -0400
>>>>>>>>>
>>>>>>>>>          amdgpu: Update ISP FW for isp v4.1.1
>>>>>>>>>          From internal git commit:
>>>>>>>>>          24557b7326e539183b3bc44cf8e1496c74d383d6
>>>>>>>>>          Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>>>>>>>>>
>>>>>>>>> Sultan
>>>>>>>>
>>>>>>>> Sultan
>>>>>>>
>>>>>>> -- 
>>>>>>> Regards,
>>>>>>> Bin
>>>>>>>
>>>>>>
>>>>>> Thanks, Bin. I looked deeper at the code and didn't find any reason the issue
>>>>>> could be due to the driver. Also, the problem happens outside of cheese for me
>>>>>> (like in Chromium with Zoom meetings), so v5 of the driver is pretty much
>>>>>> unusable for me until this issue is fixed. :(
>>>>>>
>>>>>
>>>>> Oh, really sad to hear that :(, there must be some difference between our
>>>>> platforms because we still can't reproduce the issue you mentioned, to help
>>>>> on this, would you share more info like your Ubuntu version, Kernel
>>>>> version/source, ISP driver version, BIOS version, .config used to build the
>>>>> kernel, FW: commit a89515d3ff79f12099f7a51b0f4932b881b7720e.
>>>>> Just wondering, if possible, could you provide the kernel image either so we
>>>>> can directly test on it. Also, the HW is not broken, right?
>>>>
>>>> I figured out why you cannot reproduce the issue. You need to pass amd_iommu=off
>>>> on the kernel command line to trigger the issue.
>>>>
>>>> The reason I am using amd_iommu=off is because this laptop otherwise doesn't
>>>> ever wake from suspend under Linux once it reaches the S0i3 state. The keyboard,
>>>> power button, and lid do not respond to wake up the laptop from suspend. This
>>>> happens 100% of the time once S0i3 is reached, and occurs on the OEM Ubuntu
>>>> image from HP as well. The only fix I have found is to pass amd_iommu=off, which
>>>> other owners of this laptop also found fixes the issue.
>>>>
>>>>>
>>>>>> I've attached a v2 of my big patch, which includes more improvements and another
>>>>>> ringbuffer bug fix. Please check the ringbuffer logic on the FW side to make
>>>>>> sure FW doesn't have the same bug, where it may let rd_ptr == wr_ptr upon
>>>>>> filling the ringbuffer, even though rd_ptr == wr_ptr is supposed to indicate the
>>>>>> ringbuffer is empty.
>>>>>>
>>>>>
>>>>> Thank you for your huge contribution. We'll review, verify, and merge as
>>>>> much as possible into v6 and hope this marks the final significant update.
>>>>> We typically avoid large changes to reduce regression risks and minimize
>>>>> additional debugging, testing, and schedule impact.
>>>>
>>>> I understand. Don't worry, that is indeed the final significant update. Please
>>>> let me know which changes you don't merge in, since it could be an important
>>>> change. And thank you for considering my changes! :)
>>>>
>>>> And please be sure to check the ringbuffer code in FW to see if it has the same
>>>> bug I found in the driver.
>>>>
>>>>>> Also, I have a suggestion for a FW change to improve IRQ handling in the driver:
>>>>>>
>>>>>> 1. Change ISP_SYS_INT0_ACK behavior so that it also clears the acked interrupts
>>>>>>      from ISP_SYS_INT0_EN.
>>>>>>
>>>>>
>>>>> Based on my understanding, this pertains to the hardware design and cannot
>>>>> be modified.
>>>>>
>>>>>> 2. Change ISP_SYS_INT0_EN behavior so that it only enables the interrupts in the
>>>>>>      provided mask, so RMW of ISP_SYS_INT0_EN in the driver won't be necessary to
>>>>>>      re-enable interrupts for a stream.
>>>>>>
>>>>>
>>>>> I'm not sure I understand your point. Are you saying that ISP_SYS_INT0_EN
>>>>> only considers '1' in the mask and ignores '0'? If that's the case, I'm
>>>>> curious about how to disable an interrupt. Also, this is also determined by
>>>>> the hardware design.
>>>>
>>>> No worries, it's not a big deal. Just a small optimization I thought of.
>>>>
>>>> My idea was:
>>>>
>>>> 1. Current behavior of ISP_SYS_INT0_ACK:
>>>>       isp4hw_wreg(mmio, ISP_SYS_INT0_ACK, intr_ack) results in:
>>>>
>>>>           regmap[ISP_SYS_INT0_STATUS] &= ~intr_ack;
>>>>
>>>>     Proposed behavior of ISP_SYS_INT0_ACK:
>>>>       isp4hw_wreg(mmio, ISP_SYS_INT0_ACK, intr_ack) results in:
>>>>
>>>>           regmap[ISP_SYS_INT0_STATUS] &= ~intr_ack;
>>>>           regmap[ISP_SYS_INT0_EN] &= ~intr_ack;
>>>>
>>>> 2. Current behavior of ISP_SYS_INT0_EN:
>>>>       isp4hw_wreg(mmio, ISP_SYS_INT0_EN, intr_en) results in:
>>>>
>>>>           regmap[ISP_SYS_INT0_EN] = intr_en;
>>>>
>>>>     Proposed behavior of ISP_SYS_INT0_EN:
>>>>       isp4hw_wreg(mmio, ISP_SYS_INT0_EN, intr_en) results in:
>>>>
>>>>           regmap[ISP_SYS_INT0_EN] |= intr_en;
>>>>
>>>>
>>>> And to disable an interrupt with this design, you can write to ISP_SYS_INT0_ACK.
>>>>
>>>> Sultan
>>>
>>> Hi Bin,
>>>
>>> Thanks to Mario's help, I'm running with the IOMMU enabled now and as a result,
>>> I'm able to use the v5 driver without issue. No more freezes!
>>>
>>> Since I'm able to use v5 now, I was able to perform more testing on my big
>>> v2-media-platform-amd-Big-squash-of-fixes-cleanup-on.patch I sent before.
>>>
>>> I found a regression in my big patch where stopping the stream would fail 100%
>>> of the time, tested by opening and then closing cheese. I've attached a small
>>> fix for this.
>>>
>>> Please apply media-platform-amd-Don-t-wait-for-cmd_done-under-isp.patch on top
>>> of v2-media-platform-amd-Big-squash-of-fixes-cleanup-on.patch.
>>>
>>> With these two patches applied on top of v5, everything works well for me. :)
>>>
>>> FYI, I think there is an issue in the FW's error handling, because that bug in
>>> my big patch breaks the ISP until I reboot the laptop, with the same symptoms as
>>> what I reported before when I was testing v5 with IOMMU disabled (and _without_
>>> any of my changes to the driver).
>>>
>>> Maybe you can take advantage of the bug I caused, and use it to find why the ISP
>>> or sensor never recovers after the driver fails to disable the stream.
>>>
>>> Cheers,
>>> Sultan
>>
>> Oops, I based media-platform-amd-Don-t-wait-for-cmd_done-under-isp.patch on top
>> of v1 of my big patch on accident, so it doesn't apply cleanly on v2 big patch.
>>
>> I've attached a corrected version that is based on top of _v2_ of my big patch.
>>
>> Sorry for the churn!
>>
>> Sultan
> 
> Hi Bin,
> 
> I have attached another fix for a regression caused by my big patch.
> 
> To summarize, apply the following patches on top of the v5 driver in this order:
> 
> 1. v2-media-platform-amd-Big-squash-of-fixes-cleanup-on.patch [1]
> 2. v2-media-platform-amd-Don-t-wait-for-cmd_done-under-.patch [2]
> 3. media-platform-amd-Fix-inverted-logic-typo-in-isp4if.patch [attached]
> 
> [1] https://lore.kernel.org/all/aRwhuNmPRlPGxIia@sultan-box/2-v2-media-platform-amd-Big-squash-of-fixes-cleanup-on.patch
> [2] https://lore.kernel.org/all/aSErtOOG5X5JG8Kl@sultan-box/2-v2-media-platform-amd-Don-t-wait-for-cmd_done-under-.patch
> 

Thank you very much, Sultan, for your outstanding contributions. We 
truly value your patches, testing efforts, debugging, and fixes. We 
intend to adopt most of your suggestions, but we will retain the 
definitions of struct isp4fw_resp_param_package and struct 
isp4fw_buffer, along with their related implementations. These are 
shared with ISP FW, so keeping them helps us prevent potential issues 
from misalignment.

On the other hand, if you are agreeable, we would be pleased to add you 
as a co-developer.

> Thanks,
> Sultan

-- 
Regards,
Bin


