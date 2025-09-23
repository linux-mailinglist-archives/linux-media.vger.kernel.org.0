Return-Path: <linux-media+bounces-42981-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A7CB94EB1
	for <lists+linux-media@lfdr.de>; Tue, 23 Sep 2025 10:06:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E981483637
	for <lists+linux-media@lfdr.de>; Tue, 23 Sep 2025 08:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76D3C30FC3D;
	Tue, 23 Sep 2025 08:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kL1hEk+2"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011069.outbound.protection.outlook.com [40.93.194.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EED3002DC;
	Tue, 23 Sep 2025 08:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758614749; cv=fail; b=UYxs/GvYvQnU9JTWIEOZe6eRYoDojdf17M2iIvBYHIvqbqy304Qrk7PrgRv1ZREkqNDlA5oj+SPCjqleDblCLR039rb91XN8L5A4W8RjvanIc6IlL18KBRI8YGyIg/m2pCtGBtFlg8vwh8h2HJiJwu5SB0Xm0wAjUvZIAEYKA8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758614749; c=relaxed/simple;
	bh=y3dAJRdjwzk7nhAFkCCh1LIAGrV4SqZlVOIURcjgYwQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qkkFMSz9XhBu7FXzWIV1WbRGStOQUQ/Z3q1mgO2oFCVTcm7ypkCjtNuELI/if95xKUAIWX288w7UeBARyHpcSxow6HSyokYpfaVvRz/2ayEMldyOh6YfTrpzvX48BWAD27IXZmJkEd3XTQ6E92qh7f56AInGkJafDbej3rI487U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kL1hEk+2; arc=fail smtp.client-ip=40.93.194.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ndn6oAGTVrQg1hq4cH0V2GuWToOyNOM9YMPthX4fNlzxdVoKTtpWpxNuCWo/9kJMJNZl5laCICAe5MYUgIUanDLiwhlYJ/1wIT+Qw3scB6jz2MEnysZ9c/o3J8GHeU9gSrqRcK/jdnCYyXsVlAJbL9qYSQiUY7kzTIWyN39pomZBeWJjpls7rZ7wSUpSBnw5LaUYB/HusiwfZ9kskLQHQFjifcp6KUmmwberbp5fQ9fVwr7kzpzJqabTkvqdcgQnp1Dj/HnfPJcPpJbFQobjuSDZ9TSjqnShpUv99WtLGuDhw6atYwILexB42I+TG//PR/MBrDJFZrYLCYBwf6+JFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JwIUikPGN5IlKD3gzOUe7L8Ali7A1jaa/vvIJw4gkg=;
 b=R0VXmbPZzxHDjBbyQb3m1DBWM78Or6vmIfBRh6RjT5nou8pTJ5NFhEr5hciJRKVmEIEw5hi2qZ0nScE+J239akPeNcxO5LTIOmLIqeMYEcQ5n1waqz7MutaM3ddeFJj8d5zxvbKvyD7+FL2s7tZ679FNE6X8TXZmFpSOFSscbAsgxVQSz7zhDIf74JJZ5RpQbUOsLUcgDR5XDjm9sxYmg352D8Y4sOTrpsESt637OmUvvVyuWXBSwDgptZNIlfd6wIGNg/tSZq+akFvFe9ZiuzHiqi70Y2eEuaInDIO8l4l3O3Vwl2lYz6dPiTXjk4IE3TZHr3txnc437Hocnx4Nyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8JwIUikPGN5IlKD3gzOUe7L8Ali7A1jaa/vvIJw4gkg=;
 b=kL1hEk+2pDOkGBZqp+uFVZ5QM9v+DpaPzaYU2TutRyh2cE59qo+M8txe2RduhdBVN3VVli54+guTb/VUV5rL5sCHgyZfATQnB3Jj+7CjVzlNVtmM75JfrwrvcQivTuxMHhEv7C1J16iqhV7dz2bzmJaofoKRD31orVGDX2yQ518=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by CY8PR12MB7562.namprd12.prod.outlook.com (2603:10b6:930:95::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 08:05:45 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%6]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 08:05:45 +0000
Message-ID: <25baac78-8aab-4d14-b3dd-1f88ded047aa@amd.com>
Date: Tue, 23 Sep 2025 16:05:39 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] media: platform: amd: low level support for isp4
 firmware
To: Sultan Alsawaf <sultan@kerneltoast.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com,
 Alexey Zagorodnikov <xglooom@gmail.com>
References: <20250911100847.277408-1-Bin.Du@amd.com>
 <20250911100847.277408-3-Bin.Du@amd.com> <aNBgk71V1rvYqiN7@sultan-box>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aNBgk71V1rvYqiN7@sultan-box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCPR01CA0124.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::10) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|CY8PR12MB7562:EE_
X-MS-Office365-Filtering-Correlation-Id: 5252414f-a88a-472a-ef60-08ddfa77ff8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c2x0VnJ1RDhSTk8wZUdoVU5UWko5K0lHTW5oamxoN3A1bmdDOFpTb0U0WmU4?=
 =?utf-8?B?RmdsTU8ra1FyMTFKdEVCZE8xbFlsTVk4aVF1NzBSeGFMQUZZYUtFSjRIV3RW?=
 =?utf-8?B?SzRhZmZ5QUxLcTJNMHR4QWd3VkJSMWg4VnlyYkxibzk4cjhhTzA4cnVra1hE?=
 =?utf-8?B?VDd3TDRFUzZYSmpEbkJxd2J4eFVQOFkzbnlWUjgzSnlYbFlxdzZtQUVHVVZu?=
 =?utf-8?B?VWo3ZGVIVzJ4dHBUNE1uSC9TZFc4NUdvRGR5Y0xENkdzTVdUUWErandSMml4?=
 =?utf-8?B?U0JMaEhydWVtb3NaVjZycS9BQnhRNFlqWjJ1akhZNjVoaElFSkdPRGIvbEFX?=
 =?utf-8?B?dlhxaWpFZUtGZWJqOUhoNTBKSzdJblhZNDhuM2NCcXoxZ2Z3U1JvMlVrSW93?=
 =?utf-8?B?MExjeXFjVytLODkzTGJEV1RtbjQwT1l6QlNSbmVGUis5ck1lRXM3Lzh6YzRO?=
 =?utf-8?B?SnJGMndvcmhOM3FmQW5pWld0RHphZkwxYnlDSVZnWGxSK2MvUzIyd1RDdExK?=
 =?utf-8?B?NkdweE84WmZ1bVJnRExLZFRPSGdXRVplTHFoOUMrN3NsVzJmSjNiSTR1TzE0?=
 =?utf-8?B?VUtsTjlQSnJZNDQxZ1I5VTMrRHJldmcrZW5waUtrWENVR0xrMmM2eml5aWda?=
 =?utf-8?B?SkNxR3NUWStKdUtjSnZLSENBNnJmS2J4K2hQcDdPMGJNQWdKZFhBRXoxcnpz?=
 =?utf-8?B?VmF6UUtsbGJlbmtmU2Y2T0ZQNHkyQ0dydHhEUS9YZUJzR0RjakVpOWMzbmRT?=
 =?utf-8?B?dmtBTkFYeXlWYUVPZ252Wm5JSmNMSVFkZnp3TXkydURVUVVtS29hSUVTeWMw?=
 =?utf-8?B?S1ZwbFp0cnZRTlBHdFBwTEFybDdWRFc1TDhINSt6WkkvNUVkM2NGOGxOYnk1?=
 =?utf-8?B?YkRPa1Z2dGsvMDltR2NJYTl0NWlNUmdjVFlZUWRYMGZ5VE92OWgrNldqZ0Jp?=
 =?utf-8?B?MzRBaEppbndwYmkvL0c4UlNaL0NWV25rQTNhbVMreWpsejRlSEtHa251NUNY?=
 =?utf-8?B?UXB1b0VxYTlrbDNKdFFzVUE0RVd5NGY0VDRMRThQYUwwQTYwNnc5N1ovSUNW?=
 =?utf-8?B?anUvbGFxN25sc0RBb3hFbDQ2elVxM1VqdWFKZXdHTHIzVlR4cDNVNVV5VWNW?=
 =?utf-8?B?d1I3d256RE1FTVhQK1NCRzdIVTF4VnhmSzVDd0ZPM0pYenRrTi82aWdrRkNH?=
 =?utf-8?B?UnI3ck5LYmJkbEE5T2pwUGovNHlWdjROZE8veUNRSzBrQisrbGN3TFhJRXd3?=
 =?utf-8?B?OXpLYkVIZklVV3N4aDl5eHR4Q20zZDJuV2xmNk51RGpYenVCM1BRQzZvUXJG?=
 =?utf-8?B?YlU5TkpVVUpMbjVIQmlCTUI4bEhTdnYwZ0s0VG1GOFdwemw5bm56UEF3UERr?=
 =?utf-8?B?T2NLNk94bldXY25nWk1vcnM1aVovWmV6bmljTkFYSUpJMWxxeWNldU1lbmxm?=
 =?utf-8?B?YTAvYkRWajZGd00xaG00OGI5M0pnQWszVm5QaU0yNDltS0taUnIzRHFmZEgy?=
 =?utf-8?B?OU1VeWM5NlovazRETUN2aW8vOW5JZU5aL2QycXkrVitNRkFCdCtSV0V1aTMx?=
 =?utf-8?B?RFlkT0oxeWMzcXU5WC9COHJvUlVrWklPQTNkbFptYkpwZ3NKdThkWm1WTzdl?=
 =?utf-8?B?dUpkSGJRUmFHQXBTa2pwQktTcUFZZld4bkUwWG5oMDdkMUdmU2k0OUtsUEI5?=
 =?utf-8?B?Y1pCcnRaRForeEFrN1ZtVUxwVWRVU254YzBEdVlCVXAwUVpzaFFsbW0zYVFv?=
 =?utf-8?B?d0dkQk54UEw1b2RWak9UZU00VzhFYUNBTWpBNm9Sd1RPMVZVK25ISllvWkFw?=
 =?utf-8?B?NHJyekVZdnZoMnl4NWRyOW5NaVRoUFFaaTU1SGN6dDFrcldaajdESGQrUGcx?=
 =?utf-8?B?cHhGT2JKZ0pGemdmM3lJc3VpWDdYdEorb0dzQVpZZ2JYTXdMQldEVmZOaDNI?=
 =?utf-8?Q?+MMV1TBPqrk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDhlMG1zcVdyNUQ5cnpxSXRKRFlBT2NzWFJKeXhnZEg2NnM5MVhpMEEzUmhQ?=
 =?utf-8?B?SDBIc1h1WldhMUNQOWVkdjl3VmtxY1hoVm5wR3o0YmZBa2F0THBFSTJwSElE?=
 =?utf-8?B?M0ZhTWlLZXVhMU9YQjVFWXVWYUh4TmN2cXF5M0ltYlQ3SVJQSWdVU0syM2I5?=
 =?utf-8?B?TDFzM0I4TmY0elBqT1B0dWx0K0R0S3h1ZVNqUjN1U1JWK2NZZXhLTFdBYmkz?=
 =?utf-8?B?enpuUWZ6ZWxkOTd1cTJRRDYrNXEya3FJZ010LzdsZ1ozY21ENjcxZzhqRTdD?=
 =?utf-8?B?RnJldXB4QVg1SlVXSGVMa1paUWdVV2szNEFKQ0NLaGM5MVM2MjU1eEJqcURP?=
 =?utf-8?B?emxEbEJsS3kvRjRGZ0tpU2Z0WlVNemt0MW9wSzI3SDdLMXNsaFVFeXBrbkQ0?=
 =?utf-8?B?UmNpSlRsMVRGOVMyMWJlbExXSW0xZi9KaG9qRTduaDFpRGVpWVhmcVdwZVd0?=
 =?utf-8?B?MGdLOUxGbEdPUFN0Ui9IWGRIRE1DRUlySXV6Z3YwMTJLZ0Jtd3FqTGhUeHZB?=
 =?utf-8?B?Qk5aLzZ4MmxHZzB6VFdvRUVaVjE3MU1NZWd2d3ZrYkhjazl6V2hUbkx0eVVu?=
 =?utf-8?B?LzJvWlhkdEQ2WjJsTkxrTW03NWw3eTdWVExVR0tmUG5TMk1YaTQyOGUvUnhJ?=
 =?utf-8?B?QnM1UEFwRjBlL0p3bGxUWDRWR1RqbUJWb1BMZ3RSeFdHRG9ONXlhVlhXNDBt?=
 =?utf-8?B?MWNadEtkWnJ3YXdCVGI0a2d4K3FBUTBqdC9GUTduTUxSZzNVNTFLL3FISU5J?=
 =?utf-8?B?SXJhSnNPT1FSbFBHSkNFUVpEZXU4c3BDdVhrK0hCaXBNeGFzT0lHOTlxd1Nr?=
 =?utf-8?B?TXl0dzRFZVFtb3FpMkozRG5UemQrSDdLa2hXcXYwVWtxbk05UkRYeEZjYlVW?=
 =?utf-8?B?ajQ4ODFWeVBkalF4ckYvQmxLcHN6UC9jbmtXcjcxWXhNa3lSd0NtYlhBVU4x?=
 =?utf-8?B?UUd2SEIyUEVIN0NucUMreXJFK0RsVFN4cDBJL2wzZjlDUm00MHpyZExXeVJq?=
 =?utf-8?B?Yk5ONVh5Sm1JMTlFV1JubkRJa0xueE1DRS82U3p2QzJzeTJtSE1pWjZZZmlk?=
 =?utf-8?B?aWlKNlp4OUpUQndDY0w1c0tlNyttUmt5YnJmNWZkc1FkeDFiSEQzNDdUQVlr?=
 =?utf-8?B?TGswaytxR3VnTFIxU3NpS1ZvYWRNYTZOL2IxRnhmSmNJWTNHTEdaU2FMcVp5?=
 =?utf-8?B?SDdnaWJVWTl0T1ZsTitqSVc4Q0JINmNaUmQ3ZlpYbkVKWVZPT2lKdlQwNWYr?=
 =?utf-8?B?ZVFnQlpoZktLeDRWUlZwMnFmSzAxZmRkTHpGTklyZzhFZnIxUlZjdm53c0dY?=
 =?utf-8?B?aUM4ZWxyTGUrQWJmOXdyaU5mVUQySEVCUnNsckVqY0hNUHFkOS9TT3YvclB2?=
 =?utf-8?B?N2JUYnJaY3YyT1psSjFwcDlza2xuZ0RJbzRrYzFsTWpQWUJpY1JyajJxOThO?=
 =?utf-8?B?RlM2bG9XM0I2akdJUm9UK1NqNnVSbmJoT21MaFl4Q3l6M1owV3k1bjErRUF4?=
 =?utf-8?B?b0FHckQxN1ZJeGxwNUpTeFc0YWs5NXVXSHBMcFRRb08vUldqNlFrVjZBRmZs?=
 =?utf-8?B?eGxaRi9mQldqdGZ1YnVJcWpLYWlsVkwzK1FtQUo5UGFmeTJIdml2OFlKS0dL?=
 =?utf-8?B?RTdHTFYwcXhZK0hUQnFUYXdZbjNQbzkzb1lHbmhFN0VhT0dvVFpWcEtDTEtt?=
 =?utf-8?B?SCsrajRMQlNwc1JyQzNEUDNGYWxWaEE1Sjd6NmtDRGZVa3g3WmFUZXJObXhG?=
 =?utf-8?B?TkZ5SDhEZmxBSHRGVFk2ekhuZnBVNXNKMmRHVW43R200THVOZUlyRXpOT0p3?=
 =?utf-8?B?eHFFWWVOcGd2WExlMEdMYXNzWEtUUjJsZTRjczBVaEFha3ZUMENGWWVpRGJw?=
 =?utf-8?B?R2NYMHV3TnpKYUVlbXgwTXJPY3l5S3QzeHY5YkF3SmdmY3YyMFozQTA1YnVZ?=
 =?utf-8?B?TUVVUnJpZHg2YUhoeDJJOU02VmFJckRCaURKNCs5VUZvcXpxTUI3QTg1ZitL?=
 =?utf-8?B?NGlNS0pJaXMyT3M3UkpmRGk5d2xXRU1zRWdEaEJwUVRHcWRZdVNiT2hQb3Qv?=
 =?utf-8?B?TllUazlveXVzb2RSL05VSnBIdGVscDRKWTBWL0tXZzVDbkpIQ2VhckRlVHdq?=
 =?utf-8?Q?KX7s=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5252414f-a88a-472a-ef60-08ddfa77ff8c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 08:05:45.5115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JvWMXZmRq2mup+swrzEKUvYbmNjGprvXkauGIlKg9YOvc9E6B+/A3CD2G/R2eIhA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7562

Many thanks Sultan for the careful review.

On 9/22/2025 4:31 AM, Sultan Alsawaf wrote:
> Hi Bin,
> 
> On Thu, Sep 11, 2025 at 06:08:42PM +0800, Bin Du wrote:
>> Low level functions for accessing the registers and mapping to their
>> ranges. This change also includes register definitions for ring buffer
>> used to communicate with ISP Firmware. Ring buffer is the communication
>> interface between driver and ISP Firmware. Command and responses are
>> exchanged through the ring buffer.
>>
>> Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>> Signed-off-by: Bin Du <Bin.Du@amd.com>
>> Tested-by: Alexey Zagorodnikov <xglooom@gmail.com>
> 
> [snip]
> 
>> +++ b/drivers/media/platform/amd/isp4/Makefile
>> @@ -3,4 +3,4 @@
>>   # Copyright (C) 2025 Advanced Micro Devices, Inc.
>>   
>>   obj-$(CONFIG_AMD_ISP4) += amd_capture.o
>> -amd_capture-objs := isp4.o
>> +amd_capture-objs := isp4.o	\
> 
> Remove this hunk since there are no new objects added in this patch.
> 

Yes, you are correct, will remove it in the next version

>> +++ b/drivers/media/platform/amd/isp4/isp4_hw_reg.h
>> @@ -0,0 +1,125 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +/*
>> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#ifndef _ISP4_HW_REG_H_
>> +#define _ISP4_HW_REG_H_
>> +
>> +#include <linux/io.h>
>> +#include <linux/types.h>
> 
> Remove redundant linux/types.h include, as it is included by linux/io.h.
> 

Sure, will remove it in the next version

>> +
>> +#define ISP_SOFT_RESET			0x62000
> 
> [snip]
> 
>> +
>> +#endif
> 
> Add /* _ISP4_HW_REG_H_ */
> 

Sure, will add it in the next version and also check all other header files.

>> -- 
>> 2.34.1
>>
> 
> Sultan

-- 
Regards,
Bin


