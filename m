Return-Path: <linux-media+bounces-29084-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DE8A76D71
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 21:17:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE820188C879
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 19:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A16BA215067;
	Mon, 31 Mar 2025 19:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="g9VNNHzU"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2054.outbound.protection.outlook.com [40.107.96.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A8C189906;
	Mon, 31 Mar 2025 19:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743448652; cv=fail; b=df+rlJ1NK4PllBuY2arFm4aECcshMWcknhr4uRC0PRLQ4vq+J+Lbr+P1G54Au+dP2ic1Zb4Qy35MBvPvT9MJfBEohlIAKd2Fwv0WMxPVzWq3/aEfRAAE2i+wyv/IM7wnnH7ipI4xd1BRFkjAuQ26xmAZgep5lO7S+yfAkHb4vBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743448652; c=relaxed/simple;
	bh=U6AHXB8NwsS8KeyMoILa5R4JiBFBW9tvxYvXARcb1tw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KHJeBK9Uzs20c2gzMD8JfOTZ6lMlpgD9B+0uwI1AiEVmDNZNGc3OL89bb9t4wSZ2+c3Dxw0W/S36t21vxRBFXXATpaZb3KO7Sivzy86x8+flkdpS+/kCYH4kIQrZg7mrd0JfbCpRhxoYZzHceQyqayG1wM9DAfL2AyP8r0HuGss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=g9VNNHzU; arc=fail smtp.client-ip=40.107.96.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Is0cckvo8V20B3Vsomta9GvA50UuwverDsdk0ROsz5H4WRZluTze6xVJpOscw5fpkYHLZ5E9Tt1tGqXLGq5ndUtCa56nVuIIeTtvJt1qpKSGHP9jVZ6LFloofd4Ih+IsApICMv4h5hTmZpeFJSU1hGyXGpBSY8GMM4CvRfb9UIgRLfSb7DGGgXFoY3UM7Y73zqs0CHI1mr0ysdHxw3v5KzR7OsDsswtBWWHd6OyHBFbH2GI+LCIY3ujzfcsHjyN8qEpgJFeNTQpGiL+0GI+iswsbt1O4LHFUtkijeSF0oPwfpxDsxe4DSd+BGrX4E91GAv43sCWOf0t7nKwxCIoUbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yhCeS1XLaxk0oLnAgI16Mh0KzRGWlUal5RhrdRrirSk=;
 b=ZRzdHMQednzdfEjnS7OIVIAUPGQzzUC5tJbBZtFxidn/Zl7zRAF6EmEt3RPKhXiEF6G6KirHjYOLSjBx8mO0gcQ8cJvZ0yqw3Y7HQjfgLITRJskUiBC846xQaofugYeFE0m3CzoL9vs/4kGrmPuRZyhbzkOTp2dV9xMmwW/QyZKxgDHh/2a4hhp/frZx6E/Eszdx4a26dg6yV2rI11Mr4yUyiDO13/7GFrp+WK/3zhyH7qk5VRFvjbBUsGs8cJjOn3JsrsODow/FzIsaa/+ht0sXOz4Cky44+yDZNhr8tTeJ0YzvyTA6C39ViF9R4Qsy68h5z6mwlgkvGzj9fUkVAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yhCeS1XLaxk0oLnAgI16Mh0KzRGWlUal5RhrdRrirSk=;
 b=g9VNNHzUThN4by8kBgKcFEU2Kta5Q5PIZbYaONKkAkjiRp7UOh8KYuvf9fBnqie5oHimvjxekWYXB1EjD/S9hHlTe9Fug1t7N/Hy+n27lo4zkjqw6tQAIQwZAPtRhRJaVmNbslkpFHGqYxjXjy4Vr+FhL0K3hUvQOL4q5GwkQ5M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by DM4PR12MB5868.namprd12.prod.outlook.com (2603:10b6:8:67::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.47; Mon, 31 Mar
 2025 19:17:27 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%4]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 19:17:25 +0000
Message-ID: <6ba024ef-4757-4db0-b12a-d56622329bb0@amd.com>
Date: Mon, 31 Mar 2025 15:17:22 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: i2c: Add OV05C10 camera sensor driver
Content-Language: en-GB
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
 laurent.pinchart@ideasonboard.com, dave.stevenson@raspberrypi.com,
 krzk@kernel.org, dan.carpenter@linaro.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, grosikop@amd.com, king.li@amd.com,
 dantony@amd.com, Venkata Narendra Kumar Gutta <vengutta@amd.com>
References: <MhUYQD7uWnfZQAPq7VslFWPHOmx2B2UfAIpbMhLq1-7GC_i5bI2hhns_-ov_AAVpEH_VmDDFYkS5aOKBwnY61g==@protonmail.internalid>
 <20250328214706.1516566-1-pratap.nirujogi@amd.com>
 <fef11ce6-b3b6-4677-9387-13332b9a9d43@linaro.org>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <fef11ce6-b3b6-4677-9387-13332b9a9d43@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0287.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6d::13) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|DM4PR12MB5868:EE_
X-MS-Office365-Filtering-Correlation-Id: caddf8ce-f536-45cf-c274-08dd7088ab65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WTBqS0g2Q0NaK05iOU5pbXZJT1pQMjQvbGlhUW05Q21wSGVhWE9VUjFDalFz?=
 =?utf-8?B?MGJzWjhvSmxpZUlsSWVOOFljYzlsNkpITkVtQjQ2V1poa0M2TktZUVM5cVRs?=
 =?utf-8?B?TEdsSFBLQUxhWFZjTExTaFZ0aFc2OFN5eVFxaDEzNllqODhwZUtjQkhiYUNy?=
 =?utf-8?B?b2RqdGw4TWJlVkhqTWI2REMxNXFHUmtEc0pWdG9va0EydThOK3IrbXV4RVBo?=
 =?utf-8?B?Zmd5VUZOVDdUcm1pYU9rQnRVM2J2UHUxYmk1a3U5MTk5SUpQV2h0ZEtpQmpB?=
 =?utf-8?B?M2YwT3lDNEN5VkhKQkhFRllkVWxwdDB6OFFvcnZHS29JaVZtRlhneUxLODE5?=
 =?utf-8?B?b3NSK1cwa0hSZU9jZGNobW9lSnM4aFJXeENYQ0JXTmIvWnlrRFlXVXBoWHF4?=
 =?utf-8?B?WkpEQStjNVRmeUx6VERLN3Iwd0laME05NlFSZGJ1ZjBXLzNJZnRSUU5yVWJL?=
 =?utf-8?B?S0VaRnBXeHA1ZE9UT2tpL3k5anVzSThmUWYzczJaSlY3VVBxbGhmOEt4QzlZ?=
 =?utf-8?B?Zy9FeDZxUWdCNHBkU0pxbzBwbGJVYWtBWHRKV3VXVk1EeVdBeUZXV1VZcGpz?=
 =?utf-8?B?eTl1eEFHSnVCK3ltT0RLaEkwemFHdjRVZnkyWE9pUHZUQVBLa1g1V281WkNl?=
 =?utf-8?B?M2dyem5rejlIZmNJZE02UFpkL0lqcWFPa01BcHdmQUR1ZEtKWk5HL05zZmFK?=
 =?utf-8?B?bDlwOUZNcnJHbnV5a2srU2M0amt2WmFVc0NYN2VUcEYwQnpKeTNvS2o0Nkh3?=
 =?utf-8?B?ZWtyVE11cG1McFpJYXhIR2NJdXJTVnRCMksva0xoczRFenlNWldaWjh6ZmFx?=
 =?utf-8?B?aTlUQm01N2pzUThQOWxyb2hMbFdWcTdMS3hETlN5bFl2S0ZwbWJaODRqb0Rn?=
 =?utf-8?B?TXBqQ1FNWWgrVm5WaXU0UjlyamVTdVgya2ZrRTFJOTBlT21Ob3lNSWxpMjEw?=
 =?utf-8?B?MWw1RlNveTlxVThWZHFqU2NZM0lTcjg2cjN4ZkRVS3RpY2MvdGIxTE1UQzNt?=
 =?utf-8?B?NURFZGplSHp4bTNNWldCTzA4YmF6YloyQTROelZ6b1o3WUhPVEIrTGZvN3Nl?=
 =?utf-8?B?VHlreWFKTFpVR2MrajFhbnZxbVl6Z211aTdIVmdXenFUek55bW01a0lYYWto?=
 =?utf-8?B?aHl4amFlUlQydU5rc1ZGWGxHR2ZhYVRSQjBBS21vNE9aTkpudmMxTG0raXN2?=
 =?utf-8?B?WkZETG1WemZac3U1eVlFVjNtaHR4YVQwY3F6NENmUHIyS0g4MzdzV0pueHdS?=
 =?utf-8?B?RUFhQnhkOWZhQ1F6S0MwcDNGNzBTaWltVm5BQmlXZExENW5OM0YzcVI3aHdM?=
 =?utf-8?B?anZEMENqQTA1NS9JTEVBQStUUTRuOElZR3h2R3JsZXBkQjVPT2l2aDZpMGJ0?=
 =?utf-8?B?NitUOVY5V1kwcGFieHhBS09iNjU1YzQ1NE0rNWxLWHhDeDc0TE5mU09RRWgz?=
 =?utf-8?B?cldnNHltVGhjeEJuMm9vdTkvSHVkSytXR04rVExaVG40QWdwVHVYbERBY2sw?=
 =?utf-8?B?RmQ2Y0xmMkFsdzNoR3lQK2Y3WnVia2c0dGd3YXdXQ256MG9kakdibEMzdTV1?=
 =?utf-8?B?bHBEV0J6TzRDUTRzOE8xL3krK09qc2taYnZEVjVoQlA3VUR1SFpWZDRHNkxx?=
 =?utf-8?B?SXFYRUF0ZVp1YXFadjJCb2dRYmpDNGRpbEJNMjdpS2J1M1orS1hqVnN5Sk9y?=
 =?utf-8?B?MVEzYjFtQXJFVXpRQk9OL1AwN0VuYktxYytRQUdQdkRwR1FzZnhBcUdoOElE?=
 =?utf-8?B?NVJFUnF0Y292Z1c2ZUl2QXFSMzEzRDBnUWZ2cXpEZUovSGlGVUM4VGRTa09V?=
 =?utf-8?B?YjZ2M0xlYXlzdlR5cXkxUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejU4azVTdTlZSGltT3ZMeFU5K3RDSjlqWHdwTVkzd0p0VjdSY1BZUlAxY0dq?=
 =?utf-8?B?KzJidXRFTUZCYmZwNnI3cjhDNWIzOUR3cFlmS3MzdCtTSFhqWFdlSW5IVlFi?=
 =?utf-8?B?c1hzNDRNa1J3M0g3TUJiTmVkUnQ3R0d5U3orSS9mOW5xUEZib1Q3Uy9Fakcr?=
 =?utf-8?B?cFJSV0d6Nk0wOFVFSVpGaFR2VGFPWnc3by9JM2htY3krL1c1cXFHdWM4ZHNC?=
 =?utf-8?B?QW5XcmVWZkoway82UEJ0UjliSnpNUG5EbXFCcStSMWJiOU9ueTFxbnU0cWxj?=
 =?utf-8?B?UG1MclBpd1M2aVlZWHcxeG94RTdPNXlWQ2Y4NHhJV2ZsbVVqNjdQWnZsdUZt?=
 =?utf-8?B?ckFsRUJxNUJkZktKRHRLV0VDaXR0MFJDNHpJajFRUHBQMWhVVjJYdUszSEU2?=
 =?utf-8?B?Q1N1MkovaVZTM2NKcWhmZHNLdy80cHE0VkpOYmJMTVQ1UEI0VTBHZGVLU2lY?=
 =?utf-8?B?QTRMbm8yOFVNbGZDdDBVR2FscUNDaDhDL1RsTStLWHUzUHo2U0VpYmtYaE5N?=
 =?utf-8?B?V1dIclBkN1loOVBacWlmdjhqSkJ6VFpkS0lGbXp1eDQ3b0QyUEJFZVJaY1dT?=
 =?utf-8?B?aG42MXplbWVIM281SzBoU2c4ZDVmUjRFWFdUT3NQZjcrWkxLZXRrOEFCbjN3?=
 =?utf-8?B?VXQ1R3p2UU8yckNWS3dTak1QNm8vUFRHbUY5VW5rWmVmeDdLUjJJL2pzZDJl?=
 =?utf-8?B?eVB1S1Z4MkhudXlWc2NoN1lqVFV3eWlXRlNHdTRab05zbFEyUmJXQWZXYmpu?=
 =?utf-8?B?QUJyKysyNWVad3I0MFBwODFuaTgwQmJIT3QxN0FxdC9UUk5QRGdMWFIyYnlO?=
 =?utf-8?B?a01ibVJwaWdhV1FaNm5JRjBrcVlxS0ZyaHcxdG1yc0tUYnZ5WDlISjJFeVRZ?=
 =?utf-8?B?Q3BTL3FrMm9EdGJoUFpQZytBdTdETWRvWHRwVldrZ0ZXaUF5MzZjc0h6d1FW?=
 =?utf-8?B?b1RJUCtzOWJIdGNORCtnWmFWMTh6ZldrOXdQdG1QQUFNUnRnT09ZVlEycEd0?=
 =?utf-8?B?MHdPTjJIVk1xN09PN0xHbWthdjRiN25oM2J6aDhtNWFYWUR4K2xMYmI4VVVW?=
 =?utf-8?B?bFg5ZE9jL2hHcWQ3Ly9Ya1RqM1M4QUpDbjdEd3owaENmd0FjSkxaOTlMVFBI?=
 =?utf-8?B?VEtiZFVJMW44aDVpcWx5Q1J3UmhmMHkyUTI5c09YQUxnTmo5NEhpKy93YU9p?=
 =?utf-8?B?SFVmWXZTMXFSR213MFlUU3lSSXRHWms2Yk44bmhBekdDSmZRdGtmS1FwdHhI?=
 =?utf-8?B?VisvQ3FxL29DNmF1U1JNeDJNdWJpM1NYNnJaSHEreVZXMkRMbDZaZElWK2NM?=
 =?utf-8?B?ZUpQQVNrZE1FMVVNeXh5dzhBTzE3ZXlkT3hZKzVPS1VacjZrSWM0NDgrd3Jr?=
 =?utf-8?B?OXVhbyszYjRTKzZUbU0yU1RvWWJkYk4vSFc4bm5JKzRnYThHMUJFTTNQRUNW?=
 =?utf-8?B?Y1FxUjRadzg5T2NKS2RlNG9yM2FTbWgzT2JpbGxBQW1OTVN4OVFkRzhuOEpB?=
 =?utf-8?B?SmpyaXpTMmxvYnFjWEloSGViYjlnVGVwbFJkWVppNS9OMjYxUk16SEJwNlEx?=
 =?utf-8?B?d3MyTHFBUmgydGZ6SU5jays2Y2ZPZGN5NzBQVDN2clU3SEFGOHVYc0xMWU9i?=
 =?utf-8?B?bXpwRUNxT1E5VVpXUkpjdmJIbDFGc3dpa0FOYnBTbG8ydHRNR0ZFUG80ZGM5?=
 =?utf-8?B?K3JQQklUWS90Z2ZXdHJ5eWR0aW1aTFBZenFFN3N3T2xTaENGY091V0ZmSy9T?=
 =?utf-8?B?Q0dFc1ArbjUxRkpRZ3NuUXBtbFAxZ09TSWVXRW00ZVZFVk1KM3VJcEZXVkJz?=
 =?utf-8?B?R1FiT3RCb2Fpc2h5OGRtcTgyTmhKck1nSzIvd1BoQTQyUDUrRXR6Wjc4QTJL?=
 =?utf-8?B?Qjl4S0Fkd1QxWXVUMnFtQm9jVDVtZEo1a0oxSUtYYmxKWHp0WTRDL1FlQ3dT?=
 =?utf-8?B?REF2M3FVR0N0cUQ2QjRHbjNmSkNpbGxVWGNCV2FRNzFneVkwOW9ObUx1Q0pM?=
 =?utf-8?B?L2w4OTJrS3l0dHNOMHViS1VpbWh1eS9TR1RHUmg5UHJFb2tIYUxZa1M4M0dB?=
 =?utf-8?B?S1VrbXZBb1hOQWdmYitjaGtSSGlZaTJZTVBIU1hBOGhLbUpIWWE0NlBJaGZ3?=
 =?utf-8?Q?zwJ5d+6IsweRHPppZj9DQZNS3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caddf8ce-f536-45cf-c274-08dd7088ab65
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 19:17:25.1710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R7YoTbFVNJFZkvQg92QU4VG1Krfflk88hXkv+d95aKAG+X0gkR7cjiynVr87tVbhxW1su8Lkz8ueTOk+veG85Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5868

Hi Bryan,

Thanks for the review.

Thanks,
Pratap

On 3/28/2025 9:18 PM, Bryan O'Donoghue wrote:
> Caution: This message originated from an External Source. Use proper 
> caution when opening attachments, clicking links, or responding.
> 
> 
> On 28/03/2025 21:42, Pratap Nirujogi wrote:
>> From: Bin Du <Bin.Du@amd.com>
> 
>> +static const struct i2c_device_id ov05c10_id[] = {
>> +     {"ov05c10", 0 },
>> +     { }
>> +};
> 
> There's an IPU6/IPU7 version of this driver.
> 
> https://github.com/intel/ipu6-drivers/blob/master/drivers/media/i2c/ 
> ov05c10.c
> 
> Perhaps you could import the Intel ACPI name contained in there too.
> 
sure, will add Intel ACPI names too in V3. To be specific, I'm going to 
add the below table in addition to the existing "struct i2c_device_id 
ov05c10_id[]" table:

static const struct acpi_device_id ov05c10_acpi_ids[] = {
	{ "OVTI05C1" },
	{}
};

>> +
>> +MODULE_DEVICE_TABLE(i2c, ov05c10_id);
>> +
>> +static struct i2c_driver ov05c10_i2c_driver = {
>> +     .driver = {
>> +             .name = DRV_NAME,
>> +             .pm = pm_ptr(&ov05c10_pm_ops),
>> +     },
>> +     .id_table = ov05c10_id,
>> +     .probe = ov05c10_probe,
>> +     .remove = ov05c10_remove,
>> +};
>> +
>> +module_i2c_driver(ov05c10_i2c_driver);
>> +
>> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
>> +MODULE_AUTHOR("Venkata Narendra Kumar Gutta <vengutta@amd.com>");
>> +MODULE_AUTHOR("Bin Du <bin.du@amd.com>");
>> +MODULE_DESCRIPTION("OmniVision OV05C1010 sensor driver");
>> +MODULE_LICENSE("GPL v2");
> 
> Why v2 ? Checkpatch will complain about v2 and BTW the IPU6 driver above
> is GPL not GPL v2.
> 
sure, will replace "GPL v2" with "GPL" in V3.

> ---
> bod


