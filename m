Return-Path: <linux-media+bounces-35822-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E527EAE6EE4
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 20:49:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C40C17E6D1
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 18:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C9D2E6D0F;
	Tue, 24 Jun 2025 18:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Xrc/rStg"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2058.outbound.protection.outlook.com [40.107.96.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8597619DF4A;
	Tue, 24 Jun 2025 18:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750790984; cv=fail; b=rmgVT4A1/IeSNVSISep9ceJYJDwKIcEApJteD27woMK2KpRrwB8Z25zoIw5HiWvWxLVBiTWDPYNt9RT8NEWd7xKTQaF8FRXDqMTQ7dAYHIakus/s2+uT/kCFRvEeDJPbVAjFo8KgxR+TPxvIOhGAzLTIJFVIIurJYA2jK5NsUq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750790984; c=relaxed/simple;
	bh=EyGFPF70dU58x92dMMzQGWI8/0mxPGW7IlZRCIcWO88=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CJ2J1+blxt0XrCyzL5bx1z8qd21H/HLRE/RDLH1nzisOriexY+PGzkon1PXa8hq00PowJKCFUOJAEBqVIdkbpQil4kDknKIV/ajQntKVRjAENX3JSUFdLW5/M4YQleGVCL5S97bjeLO0lQR+Gd1mOgHOk04426sW9hCC3XzNaN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Xrc/rStg; arc=fail smtp.client-ip=40.107.96.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZQ8feioHzHIat6YI2jVRY4gvdWT8bJc0clZPzgVOrJud1Ku2X9IsQLksMcR0pZ7zZ0fuPYuNjYawIiwzmDugPh6VjvEuth94bHbJ9FcogXMSEG83EZPQDnQG7oqLx7R3e4Rb8fSXC4NV+nfGdf0dodZUsAn4DqXRaTCnSRBLJVypi3wuX7FI7HM37aEU8S4N6O1WPN8FRV+3dbk7x30C+dRMwmM6FdTuMl68+0zfmkXISOGPRgHBeZKrttZrG99RJpNWyNpWylYkkWB2jnJz3Vm550IbKKD7Oqpib9eEzUDzkUIUaKNC+Ai0vxeze56G81LSaJSIAIaMp/i9CelwfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W1syZvmHi/vw9owohYFm8DyeKLouWX1fbinl8xVTGug=;
 b=j2sROPquWt/jY33J3rgeMFtqPbzt7HjVsRFZI0G1nITuIc6Oc47JYN+F2OFEEjyYTgosLuwLKrSbGDr0P0iBP06FEIeAC1J/DheqDEfFKnKZcZt/HXBUXbS0i/2/OIfdGb1C55a/JlT4oPm5lUIRaNODhG3qNegCwOJIQkHiZlPUvg6ZfnVfz4rV98pzBY6uAJRoJq8ObnokViY4cve37BBw4bzeHJXUtIIBncym/DnZfwpoK3yrGUkeu2sVxztJGQctzPn57PPAsEtjh5afsDYT9YVi132vTQZc39AW3mBiDNWkMhbApYiM2Tn8kUABIS833szXvFHMTNxX2CGkEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W1syZvmHi/vw9owohYFm8DyeKLouWX1fbinl8xVTGug=;
 b=Xrc/rStgFuWA41hmQ//sShxzGZkEvP7zRqovd6BDjPP8rbavSQ65TfJLJU3cmZybYpglVrtMH3PM9hEn16VsLDHLmu709jk//m4jjddbwkzYqoojByUAQgowxxbGGq0oJWw+lHHFqGo/Nh7gylNZsDu6r6NiHmBRX9wiFJb7k4g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by CYYPR12MB8872.namprd12.prod.outlook.com (2603:10b6:930:c8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 18:49:38 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 18:49:38 +0000
Message-ID: <d2a1d937-9db2-46e4-bc73-f810a3e86f20@amd.com>
Date: Tue, 24 Jun 2025 14:49:36 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND] media: i2c: Add OV05C10 camera sensor driver
Content-Language: en-GB
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Pratap Nirujogi <pratap.nirujogi@amd.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
 bryan.odonoghue@linaro.org, krzk@kernel.org, dave.stevenson@raspberrypi.com,
 hdegoede@redhat.com, jai.luthra@ideasonboard.com,
 tomi.valkeinen@ideasonboard.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.chan@amd.com, bin.du@amd.com,
 grosikop@amd.com, king.li@amd.com, dantony@amd.com, vengutta@amd.com,
 Svetoslav.Stoilov@amd.com, Yana.Zheleva@amd.com,
 Mehdi Djait <mehdi.djait@linux.intel.com>
References: <20250609194321.1611419-1-pratap.nirujogi@amd.com>
 <20250615000915.GQ10542@pendragon.ideasonboard.com>
 <53674c5f-6b68-49e7-bbb0-fd06fff344c3@amd.com>
 <8b16675a-c6ac-4619-aabe-ad2a4be6c964@amd.com>
 <20250623220503.GA15951@pendragon.ideasonboard.com>
 <163655af-2a3d-4489-ac7a-4ee31d3980e2@amd.com>
 <20250624001942.GF15951@pendragon.ideasonboard.com>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <20250624001942.GF15951@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0162.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ac::28) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|CYYPR12MB8872:EE_
X-MS-Office365-Filtering-Correlation-Id: 81bda39a-9c5b-44c0-e3f0-08ddb34fdf2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UmpyZlpaMVJGazhLZmwyRWxMWnVGbWpZb0NUZUtCYVkraFd0V2lQdWZnQnh2?=
 =?utf-8?B?d2V4OWQwRkJBRW42d0huSFZzc25FWWdTMXVjUGRtNE9IbGJHMnNCZ2hlYStU?=
 =?utf-8?B?VmpZejBCMndlckk4cHRwM3UyQ0JHb2dGYjVzZUxUWER4U1QxRFY1RzhxUTI1?=
 =?utf-8?B?bDFoeWlsQkxIOGV3YXczeFIxdXNiUnI4ZS9RZVArandhbHdnZmJHVmhSbVRF?=
 =?utf-8?B?STdrTWo0WVNUNS9yZDBCRUZxRXBhVzBmeC82eko0UUt1cTl4M0lmZEQ0S1Ax?=
 =?utf-8?B?TGNwZW1aNzhlNDlTVEd4V2d4bE0zWEkrZjcvbXRCa3R4S2pOZDQ3OGxjSDlv?=
 =?utf-8?B?ZzByOWtPSmVwTitjUkU3Qk1lQzl4MUg0aUV3T3BHZFNOS01qZEZpaW5XM0E4?=
 =?utf-8?B?UXNnUHRSYk5WbUE2MGcySjcxaWFjbGovdW16YkVGNk5kaXZRcjY5UGFQS3By?=
 =?utf-8?B?aU5keGFHZGdUNkZiYzRDb0pFL0ZqcEY0SHFjNFdIZVVyS3V6d2U5Wjd4M3lU?=
 =?utf-8?B?aVd0NUZGazhNMlRnb2JLSlFZZEZ2YUpTYXdIbzF0M1lodWFDZjRUWlF5RHhp?=
 =?utf-8?B?WXVqRW9odGhZdjBvSjQwaVZadjQxV3dqa3pjc0JzY0Fsd1hqZWhCY3J5bGVQ?=
 =?utf-8?B?U0wrSm9rVVZlR1pldEVGTVBsWUtNMjNYOUZwdUtZbjlLeDBoNGJ6dVBmZHlL?=
 =?utf-8?B?YmdJZHhnSkV1eVpESHZjcHFtN1BpY1NTb1lDZllCZXJqWUFVckRidUFRMHBG?=
 =?utf-8?B?VloySDdHOCtJSFVwdHIyYUVhdldmSkpySUhrNTl3b2sydjFscDZpT1hJVy9Y?=
 =?utf-8?B?Umh4RjRwWUtuUStLMTdXZ3dQVzlOK25wVUtaTmlkLzVQQUswSllkb3FJd2p0?=
 =?utf-8?B?V2hzTThBM2NYVFB5RUV4ZllBVGV5Tmoxc0QxVkw3VG8ya2wvVFZSRWFNQjR6?=
 =?utf-8?B?REh5VHliUy9HNHE4d1Y0eWkwVXJtSmlONllPZUlVS1dXYmNGNHFVTmdVU0ZR?=
 =?utf-8?B?aFJIMGhlbkwybXBxMHFKdjA4Y1BSWjhwSGZsZm9ieWRMRW0wcktnZ1JrMDRC?=
 =?utf-8?B?bjJvK09HaGJvTDhjODF3Wjd3Szc3N0JhMEJxaEpydUJYT2Fvb0JjY0lYRG5I?=
 =?utf-8?B?dFZETnhXc3JpbkpkdUNnQjZtTnNZSHhpY056NGg1bDVNN216bmVJMnVEQkVl?=
 =?utf-8?B?SW5LNFNVM0xJeG5WeGFVZXZWcysrb2RIays4cW8vSWVIa3RnajJrSklyTEpB?=
 =?utf-8?B?ZStncUd0eXVtTFpUaUIyUFNSdGxwZWdvOStzMDJsb2tCcXd6b0liMVp3RmZk?=
 =?utf-8?B?ZGlXY001YXY0bUtUcGFJdXNlcFJDdGxlQnJPNkxHazNNZ1NjMFBhcUFaMXRu?=
 =?utf-8?B?U0V5SUdSY0dTeGpHa0Z0ZEp6a2o4SjhZTGJ1MjgrN1JSZGYxNnhkQWZvWERv?=
 =?utf-8?B?ZE1DNTFjM29ObDlxd2NVZW5qOVJ2WC9oUDJ1TFp5N29Yc0tlTWZ5YWlPb3Nu?=
 =?utf-8?B?R1VKQ3I0aU9aem1uUXdrQmhKV3l1VHRZemRIRnlKRWRqczV0THRCd2lKRTVH?=
 =?utf-8?B?OGk1aXNONXYxcDg4a2RUVDIvMTBScExnUlZDRVQ1TG5oc2dvRjBOMmphcHFT?=
 =?utf-8?B?eE1OS0N3ZHBqTjJGN3RpOHc5WnBlQThUZExMdW4vS1VseFBRTkFDK1dVeVkw?=
 =?utf-8?B?NGhRSlZOTEp2Yis4dnMvQUx3NjhMOExKaFBSa0xhSnNKN0F0UUZiUUp3akVM?=
 =?utf-8?B?amh0RGRsUmZFYkVPV3lQa242T3FZeUJnTC9ub2FpSGZKRDFFdk5ncTNBODVZ?=
 =?utf-8?B?NXpRY0FCNWNxUFpMZDlLWkNLMlVZY0Y3M0FyOEUvNVlXOGo5Uk9XV1FXUWlm?=
 =?utf-8?Q?ijiuRbiwaeLjg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tmp2ampXS0ttMDE0dWoxR2pLbnR3RWRMZFE1ME9sd0JoM05WVXpSRWt2ZTAr?=
 =?utf-8?B?RHd1c2hjTFBNdGJZb0xvR3BDamttemhsbU1FK09PazN4aUFEZllqOXVqeVM0?=
 =?utf-8?B?L1BPUFJXNGcyRXh1VlppWGR6eTd1cnJ3bmhwck8xUDlIejBsWTlQaUhuSElV?=
 =?utf-8?B?TWxpWU5OR0QvSEViYkkwVjkzSlBNOWkxbEUweEl3UTdpY0VmVE1ZTVN2SjBs?=
 =?utf-8?B?dTJMNjlXVVFVdlZqZEdzaWpMbmZ3M1U0bytxdVNvSUhqRitQQ2p4aVA2cEds?=
 =?utf-8?B?ZUwxVUQwUzlGVVZxYWNPTDVvbUYybG92dGgwOTd5aSt5Vk1HWnpXRnFrRmNs?=
 =?utf-8?B?YjYrTm5JRDlSRUlIQ2p2ZFlmblhUSEUraVNzQlNmdU5sbGVjUkswSnhjNVo0?=
 =?utf-8?B?S2w5N0k5YTl3elMrY2VPRHF2UGEzYUJCMWF5QTRyVHRQU1QwdnJITnpqaVB4?=
 =?utf-8?B?ekpWbUdCVllKVU5kczRncHFYbjkwdnAxU2dGYW1pQk9nZHJPNzdjMEtwMHpD?=
 =?utf-8?B?VVdqZzdGaUUySkZSbUtucVNwQ3hFTmxBbStmUWZ0U3prbm5PZlQrQkhPOUNm?=
 =?utf-8?B?ZXNEMkVBcWp6RUpHOHdkdVM4TmxleUxmVjN2dVkyNVVQZm5xOUVremtFVUF1?=
 =?utf-8?B?R3JUTHdrMHMrWnZ5MFliVnZyT1lBWE9wMXA2aG9mMDZnT2RRdEFjandVWnJY?=
 =?utf-8?B?YndaQUN0MmtFQW5VbzJxcEZWbVptWElON2I2NURQbjRiSVZtNTlIdWZWNGpi?=
 =?utf-8?B?dStJV2hoUzNOYkJFdUQ4d0dEYTZJeHNZc2MwdlRTNU4vR3Rmc1ZBWW5XUDhh?=
 =?utf-8?B?aFdrNzVjaGlELzJsV3JYSkpuMVlENGh4QWdLWjNWYmJZL0U0MC9qbE5paFAz?=
 =?utf-8?B?T1dwQzdrNDVsaDB4TnhaV1hwV3kzRTFBQURwZUJKcEVJU0w5NnV0NUxEczY4?=
 =?utf-8?B?TmFTRTF4dWNQMTE0QmpPR2FGZklPRlJzYlptZGNYeXdIMFJDREpMVGdYbVE5?=
 =?utf-8?B?VjI1bENvdG1ET1dYTjVUeDMyMGxjVWZBRitaMVg5NFJUQXpxQ1JHVVFYRTIr?=
 =?utf-8?B?UUhTRFhUcmJmYnZJSldrd1RIWXVBenh4T01yR3lQNk9GRHNJVDNteDdCemJL?=
 =?utf-8?B?UU9YanI3YjQvZ3FVVDZnUFNwRHNrYzBiRm0wUUYybzNpSHcwcy81aU5RcVVK?=
 =?utf-8?B?K00rSk4ySEIvUEVzSEdFelVicUtrQXN4VDVwTXkvbkNoUzFwZ05Ic0FmU1ZS?=
 =?utf-8?B?bi9rd01ZdGxEVVBEQU1YZlQ5T0FZZEhJci9uRVB5dG0rQVJjWG1NcEp5Y21k?=
 =?utf-8?B?dVovUm5oVTd3R0tORGVvT0tITk9Sc3JuenB5OE9NVjJrYnNQSzhnMzJlMjlh?=
 =?utf-8?B?ZGw2c0tUZVYyWkdUTWZLckxjZDNBMXR3TEF0ZWxEaGFUNmNWOHJMdy9NbzBl?=
 =?utf-8?B?ZUUyQ1VoNFBQdlFITDBPNGl4dWo4OXJmZ01kWndZaWR6TlEzdDRWUmFPQXl2?=
 =?utf-8?B?NlNya3N0MVF5S1prcVpKZG1HRm5DcHBjSkYydkFwZ05GZ3E1SUE4czNEek5j?=
 =?utf-8?B?Vy9aeURFRWRtekUwakRWc0R0WlNjVnBIUFJwaUhrZkFTa3k0K29QMmdoc1BO?=
 =?utf-8?B?V1E3UXl4dG9ZYlkrc0FjM2dUc2FiM3daQ2JDMVNzZkFHdXpieTNlQldaM2Mz?=
 =?utf-8?B?Qk5FNlcveGR6TDBzYW16bEZuV0llSFZGN3M5MDdrdVNnZm93Zml0b0pjWHBi?=
 =?utf-8?B?MEU1Rys0YVUyeTdwa2J0TDk3NlgzWlhIMHkwd3A5QWZkS0RYeFhwc0QweEZp?=
 =?utf-8?B?eERoanNJUVQ1V2dqMjUwSXlRWDZVcE96VGJtSmhzcHdsTHRSU2YxbDltSmtG?=
 =?utf-8?B?K0VONkNYYmNDYnQvLzFuOWYxNTdVdGJzK2hoSDZ1VE05aHZCZkFldVpLOGRp?=
 =?utf-8?B?S2hMT290OVNNTmZvOGJkWmFYWTU5Ym1PcWtreGxhYTcvSWJRR1d3akkrVWda?=
 =?utf-8?B?Z0drdXJhdFRrUEM4M1BHVmZHNEhGZVh6QURoUlpEamVIdnFrbTYyUGdUbGN6?=
 =?utf-8?B?RHBIdnRqbjZJNjNOMi9lUENJdytyZWZnb2tYcnBUVldYR091eGdSYis4YjFl?=
 =?utf-8?Q?lYi2HfHPIvoscsM25boxjIznz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81bda39a-9c5b-44c0-e3f0-08ddb34fdf2a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 18:49:38.6167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LZT0fSCzwao2AJNxRExj5aF5F52nGjj8wYBWN4qVF89O/JKPuPdcf3N7w8+59jbA7XsRYck8KIGfmhOcK/+uwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8872

Hi Laurent,

On 6/23/2025 8:19 PM, Laurent Pinchart wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Mon, Jun 23, 2025 at 07:28:46PM -0400, Nirujogi, Pratap wrote:
>> On 6/23/2025 6:05 PM, Laurent Pinchart wrote:
>>> On Mon, Jun 23, 2025 at 05:51:48PM -0400, Nirujogi, Pratap wrote:
>>>> On 6/16/2025 6:49 PM, Nirujogi, Pratap wrote:
>>>>>>> +static int ov05c10_probe(struct i2c_client *client)
>>>>>>> +{
>>>>>>> +     struct ov05c10 *ov05c10;
>>>>>>> +     u32 clkfreq;
>>>>>>> +     int ret;
>>>>>>> +
>>>>>>> +     ov05c10 = devm_kzalloc(&client->dev, sizeof(*ov05c10),
>>>>>>> GFP_KERNEL);
>>>>>>> +     if (!ov05c10)
>>>>>>> +             return -ENOMEM;
>>>>>>> +
>>>>>>> +     struct fwnode_handle *fwnode = dev_fwnode(&client->dev);
>>>>>>> +
>>>>>>> +     ret = fwnode_property_read_u32(fwnode, "clock-frequency",
>>>>>>> &clkfreq);
>>>>>>> +     if (ret)
>>>>>>> +             return  dev_err_probe(&client->dev, -EINVAL,
>>>>>>> +                                   "fail to get clock freq\n");
>>>>>>
>>>>>> Let's try to land
>>>>>> https://lore.kernel.org/linux-media/20250521104115.176950-1-
>>>>>> mehdi.djait@linux.intel.com/
>>>>>> and replace the code above with devm_v4l2_sensor_clk_get().
>>>>>>
>>>>> Ok, we will verify on our side.
>>>>
>>>> We tried using devm_v4l2_sensor_clk_get() and found its required to add
>>>> support for software_node to make it work with this driver.
>>>
>>> Why is that ?
>>
>> Its because the i2c_client device is initialized with swnode in the
>> x86/platform driver.
>>
>> https://github.com/torvalds/linux/blob/master/drivers/platform/x86/amd/amd_isp4.c#L235
> 
> So there's no information provided in the _DSD for the sensor ?
> 
yes, camera device was not properly described in the current model, we 
are going to address this issue for future models following the MIPI 
DisCo Imaging spec.

> Looking at that platform driver, it matches the device based on the
> sensor ACPI HID only ("OMNI5C10"). That doesn't seem quite right, I
> think you need a DMI match as well. You can't assume that OMNI5C10,
> which identifies the sensor, will always map to specific platform
> integration data (connected to an AMD ISP, using a particular link
> frequency, ...), can you ?
> 
Initally we had dmi checks, but as the driver matured through review 
iterations, we switched to ACPI driver approach and felt the bus 
traversal to find the matching HID device and dmi checks are no longer 
required. The (_HID, "OMNI5C10") used is specific to this platform and 
shouldn't be impacting other platform even though the dmi checks are 
skipped. Please see [A].

Thanks,
Pratap

[A] 
https://lore.kernel.org/lkml/8d892845-e134-4553-a6af-55d785c1ae98@amd.com/

>>>> Please refer
>>>> the changes below and let us know if these should be submitted as a
>>>> separate patch.
>>>
>>> Mehdi, do you have any comment ?
>>>
>>>> ---
>>>> @@ -645,16 +645,16 @@ struct clk *devm_v4l2_sensor_clk_get(struct device
>>>> *dev, const char *id)
>>>>            const char *clk_id __free(kfree) = NULL;
>>>>            struct clk_hw *clk_hw;
>>>>            struct clk *clk;
>>>> -       bool acpi_node;
>>>> +       bool is_node;
>>>>            u32 rate;
>>>>            int ret;
>>>>
>>>>            clk = devm_clk_get_optional(dev, id);
>>>>            ret = device_property_read_u32(dev, "clock-frequency", &rate);
>>>> -       acpi_node = is_acpi_node(dev_fwnode(dev));
>>>> +       is_node = is_acpi_node(dev_fwnode(dev)) || is_software_node(dev_fwnode(dev));
>>>>
>>>>            if (clk) {
>>>> -               if (!ret && acpi_node) {
>>>> +               if (!ret && is_node) {
>>>>                            ret = clk_set_rate(clk, rate);
>>>>                            if (ret) {
>>>>                                    dev_err(dev, "Failed to set clock rate: %u\n",
>>>> @@ -668,7 +668,7 @@ struct clk *devm_v4l2_sensor_clk_get(struct device
>>>> *dev, const char *id)
>>>>            if (ret)
>>>>                    return ERR_PTR(ret);
>>>>
>>>> -       if (!IS_ENABLED(CONFIG_COMMON_CLK) || !acpi_node)
>>>> +       if (!IS_ENABLED(CONFIG_COMMON_CLK) || !is_node)
>>>>                    return ERR_PTR(-ENOENT);
>>>>
>>>>            if (!id) {
>>>> ----
> 
> --
> Regards,
> 
> Laurent Pinchart


