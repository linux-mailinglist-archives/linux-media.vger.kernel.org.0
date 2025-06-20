Return-Path: <linux-media+bounces-35477-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1DCAE178C
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 11:31:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFE46189AA12
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 09:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BB78280A5A;
	Fri, 20 Jun 2025 09:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="43GPy3hY"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE7F218AAB;
	Fri, 20 Jun 2025 09:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750411909; cv=fail; b=turuZdM2i/95cf5sQ5Vb81xmVB05qOO22pG5E5uCM42VduRz+ZoLPug6OI9ETTeyPx0tNu8wPceV/ogj5wW1/20ueMrRNxIMcarY1GC/rGk3Z4rONWb8uAgrJkiwk5qaK0OO3MgrEBW5ftPIBVmdLlHmhjPuYMVB/kf7s5qvKvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750411909; c=relaxed/simple;
	bh=TXjqAWmcd1VDmcHI1Tg1m0sPeoWhsUFG7avkNs6KYXc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fGblcAsc05CXVIyCLQlZKYFcMH3NxLqiCaDt9QuEqjtwhpC2a+l/c7eTbsfGAn35sgbBH9lKf8x5B/7C8YUD4TEvBRkrxBEXKkYgTw4pxVkzWPfNAKTUPvB+AqBAQ5gJaEsnvK6r+4MyRD7X9IYgGAwSWj5gX8jCXM78LXNjV7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=43GPy3hY; arc=fail smtp.client-ip=40.107.93.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Srb/5BaQDWrlwKM7LIb2NJnsWGLsyliWI0f6i+h+3eQLdq+YOE0J1TB8fHdZJ/tYxvNr9C2VGUSyyz/jS0JMhtzMO26+4EV1gMU27prcpfFXBMLA20zV5yNkY1qjPEDZpg/V0uGFdK8FBAc3wi5ISqJ5kOSV+ISn199JasfO7cEYktFCV/yIeaJp0Ce9hYarxkQ4IuEy1aEl+UozBPWk7MSCDB1tzfowhAJ293Cq+NAf3SNkmVvoqVPznBBaeGchXLG429zZzvOyOgzBOgqbxy7edNI4Sq0irHWNISrnkFFg7b0WM/8zxfvhVkYTCYXqEx2lj+asMXlgyhCxhGcxag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j1PfGwDKwh+q2O+WR1Lxni7YSpVLYh515bWH+dfUG+E=;
 b=hxJo/TCLMgbLdoS123TtMmiKe1c2CzIyezn2/HX6EMVsjgdfERUGjgbjEAa1HUKQfgjX62o7dL3qvlU018bYtJVFu3a+SOvsjhJlpDjrYE1cMAi9y0KsoMBQY4TbxDhwxSGXy2hdMDKhbjwZAixxjnKxueUJCTP+QiIB2M9iaLyhbv1iXsp5nuqffdrxSWSSel3zkV7fCvBVZVjlrqTWM8lNWBiewsUGYl45Iv8BuXvW++J+7tIxFKcHo61MfJqm/28yFoRssi8Q496yup4mZFJPlLf0JewEAW8uWhX5lrh8O5lCxNC95/jWGc7zdAv/H75J53n9EZqlcl8vgJKCbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j1PfGwDKwh+q2O+WR1Lxni7YSpVLYh515bWH+dfUG+E=;
 b=43GPy3hYcO3XLIFwapHFOhoxKlUcIOC1NIz5Ju/LS2F5b1JSA6qwQHurQ+WiVFIUXx4VOMU37aOd/N7/VXCJ+f7es1CBsRMJCf8MgCUJ7t7kvahS5xwCCDi0LH4iIhS/JOHOAbaptv/X6bvqx+9Uapb+fAXdPTTR68UEU23JlvA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW5PR12MB5683.namprd12.prod.outlook.com (2603:10b6:303:1a0::10)
 by DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 20 Jun
 2025 09:31:41 +0000
Received: from MW5PR12MB5683.namprd12.prod.outlook.com
 ([fe80::3366:15a2:2179:2137]) by MW5PR12MB5683.namprd12.prod.outlook.com
 ([fe80::3366:15a2:2179:2137%7]) with mapi id 15.20.8792.040; Fri, 20 Jun 2025
 09:31:41 +0000
Message-ID: <c6fa17fe-a334-4296-bce5-d0b8851b69fc@amd.com>
Date: Fri, 20 Jun 2025 17:31:33 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] media: platform: amd: isp4 subdev and firmware
 loading handling added
To: Mario Limonciello <mario.limonciello@amd.com>, mchehab@kernel.org,
 hverkuil@xs4all.nl, laurent.pinchart+renesas@ideasonboard.com,
 bryan.odonoghue@linaro.org, sakari.ailus@linux.intel.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 Svetoslav.Stoilov@amd.com
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-6-Bin.Du@amd.com>
 <6825c4cd-611b-4efe-a988-3ca7dd1f876d@amd.com>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <6825c4cd-611b-4efe-a988-3ca7dd1f876d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:194::9) To MW5PR12MB5683.namprd12.prod.outlook.com
 (2603:10b6:303:1a0::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR12MB5683:EE_|DM4PR12MB6374:EE_
X-MS-Office365-Filtering-Correlation-Id: 4559fde8-e51c-4ed3-3a8b-08ddafdd4306
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NkpFZFVWZmYyNGtKcjU4dzUxQ25GL0J4OHFXQ2VlS0I4TU5kRW5ES21yRWZW?=
 =?utf-8?B?ZDRLanlBOTg4U3pnSy8zMXhYYkwyTVNleEwyOEZCUG1lUVdhc2N0VDNJNVJi?=
 =?utf-8?B?dTZ5RGR0NjhpQXp3OWNXQWNFckN6R1U2TU9SVW8vcndBNlZ6Q3UwKzRQSmdM?=
 =?utf-8?B?OHJJUFBsU1VVSDJmaVNiY09PUkFDT0dUU1lPNkFGN1QyaGg0VEU4b2ZHekpF?=
 =?utf-8?B?N0Z6bGNnRlB0azMyckRCSzVrYXZkcDJSRWpLOUJSWFVmTGI5VmlxeXl5dkxY?=
 =?utf-8?B?NUo4SEFsVG14M2EreGpqTGJ5dlcxQ1Q3MXlGZVhVZlk1MUFYOTk0RFBlVVVP?=
 =?utf-8?B?NFZYN0lObnFON0p1UGlDT2ljeEFxbHY1ZnBtdHRyazRSS0puZmlmTm5KMnB4?=
 =?utf-8?B?MlpCSXg4V2pxK3FwbWdjMXBrUnduTjJNeDhUYyttaGNNZGhLYlJydGZZVnZ4?=
 =?utf-8?B?a0hPMjFOUkpJWDJ0S3JKc0NSUlFqajRqenpSWmZrd25ObmhqeVVxN0JrZGNL?=
 =?utf-8?B?M0p0S0Y4a0Y4YnFNekwwTUhpR3lwVFZ0V20wemF5RjB5QXVPdE9OQysvUk1D?=
 =?utf-8?B?R0pTc1FUSXprK2FmNmJQNjM4L0RyK1lMekV2enN4YzN0cGVvRWx6UElpNFNu?=
 =?utf-8?B?OHZFajFGbWxuWS9vTnpCcGNLWDJreHVzZjBEK0I2YmVHM2ErM0diMm0wSzdU?=
 =?utf-8?B?WjZOYTgvbVZmUDVweFZpT0kraWhxVWNvVEdFbEJBRlc0aXVFQis3UUtYN1M3?=
 =?utf-8?B?blBTV2hGQlRCWHpaaHZqWSttZ09uTEVKMVBoME1NR2ROUjBVZWhKVm13bStC?=
 =?utf-8?B?VFBrb2F4Y2RBbzQ2K0xjK3FiMTlkelhoRjVTbzBNN3lpTnVpYzhpZ0E4RGM0?=
 =?utf-8?B?Tkk0bjJ5bVVKL05Lc2hPYjhaNy9wTHNoUjkvZkJIM29IbFNpbE00a3ZxN2U4?=
 =?utf-8?B?ZWZLT2xFL1BtK2tUWGY4WU8rYnlsQlVnQTJ1UnV1eHMxK092NzMwMjlnK2tV?=
 =?utf-8?B?TnlYN2g5cXpwam14WWNxRmpiRjdkVCt6ZktuRHNEZ1grVWNyRE1Eb05jM1hG?=
 =?utf-8?B?eENWV01OUWlkZVo0L0ljSUR2S20wbmpWb0E3UjdPcUgxQWkwU0Uzano1dGZE?=
 =?utf-8?B?aWZaY0R3c2ovUVMyNCtObkVYeHp2S0Ywd3NOeFJjMDdYbWltNEhSWGx3dXpH?=
 =?utf-8?B?M3p6NUxmSUNROWpQeDFJSmN4YjUxK084WDVQSCtaMkdYeDd0NllyOUVNdHh0?=
 =?utf-8?B?RFB2Y1hqVjlNU3Zhb0M1RjNCNXZhM1JzZnBDTFcxMVMxSmIyRy9Fb2hTZjha?=
 =?utf-8?B?WndQUTZ2YW5vaUt1bXorcXhXUXVYeUdlQ3FVS1M0U2t5SFBZSVpxd2xhMmw4?=
 =?utf-8?B?L3Z3K0pVOXMyYXRWRXo3a3h3bnhaN0JXcUw4bkc4a2pGaW04UjlmVnpRa1lu?=
 =?utf-8?B?cWxUN2kvOVQrSmFyc0dTZndWSGhFbHFsc1hZdnZINlpMeXA3UHlYUUgxVlRV?=
 =?utf-8?B?U3NQNEQrWXhleWdaTThkSmpKVTI5Ry85WUlzRDlUOElkaS9pTzhrZ0Rzem9p?=
 =?utf-8?B?VGdmVGl3SEpHa2c0RFRGdDBsMzFxdWZKTGFib2V2M3BhazduTmhkYkV2OEds?=
 =?utf-8?B?eDh3L09VbkdGR216UFdnMDFxSlhUdFZFQVo0UFdLSUM1dVpxQU5STUtaWVBP?=
 =?utf-8?B?NU9TNDJHdnIveGN2NFRVREU5Q0haNkhmbVFOVWlhWitYbElRUmxUemEvMUF2?=
 =?utf-8?B?SDNlK1FnOG5EZWRHL3NTQzA2ZUhhMzhpbC9YWDB0dkJraENJTVQ5K0ZDSGdO?=
 =?utf-8?B?d1VVRmU4QlZ3bmNUSDlGMWFXMDY3VHlpNDNTZENQWkhIeHZWYzIzRU9Lb1hE?=
 =?utf-8?B?VmtuQlFqWW9LUVA2SG8wV2svRCtaSDI2S1dWRjV1cVFRVS8wOXFUbU9DTEtL?=
 =?utf-8?Q?+TPUH4VoNy0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR12MB5683.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emJrQ3NuTy9GTW9KM3lWbDNLei9nRTg4ajMzZmlIclZnb3AyMnRjbll1U251?=
 =?utf-8?B?cHkyM0ViUkJyYVladmpwN3F0VWhHdXovdjN2UldodDZBakNTeWxxa0xITi9W?=
 =?utf-8?B?YzR5bExKdmlKY2tJQjdQalZ3UVhGb2xZZjdwenVrVnZHOU5wQWUya2FtRVo5?=
 =?utf-8?B?S0gwYkVkZC9Tbk92a2R1RUUyRWJyMCtaVE5zZGJYRzJBS1RMaU5pUm96TWxn?=
 =?utf-8?B?WEZJai9rV1EvVVhGelBwQXhTc2VrVlpDQ1FpM3NZVzlkTkpScVg0SGxpc0tl?=
 =?utf-8?B?VWtna3p4eWVvMzRDRVJlRFBkUGtLbTQwdlR0OWdRT0ZrSGRzb0lWd1ozc2lm?=
 =?utf-8?B?aFJnS0RtVTFna1lRV3RheFY5cjlTUXFndjFRK1BOWTNUbFF0QWlqMkN2WTNR?=
 =?utf-8?B?bk5WaHk2MitiaURRSU9seTBNZ3h2NlNZRHlFdlh0aloxNWl4WWtUalNzV3RI?=
 =?utf-8?B?b2lwa3RtQ00wUHFoeHpSK0RBTUtzM2ZNc2QrQWFwV1I4bUdWSWdPNHF2R284?=
 =?utf-8?B?bHRGL0E0Smd0aDRPY1VnUDFPMk04UFhUNDZUam4zNzBGK0ZjMUpxaTZ5SFpo?=
 =?utf-8?B?UWZXUThYb3ppVDJhQk1pMWNRdjJVNlVOSmU5RXVRQ3V6dm5ISWZlbjYrcm5C?=
 =?utf-8?B?K0ZpakRDK0JTWmhlUkk5UFNOMHdVTGhYUm1WWUhCajlFWlJKc2tBcVgwRGx0?=
 =?utf-8?B?Mk1DRjVzT0IrNVZoSVRITnhGVEZkaEo0SGMxRThZOTdvSmQ5RTZJTjZXSmxk?=
 =?utf-8?B?R3NjN3ZQaGZZZ2cwUTRRL2RDQmM1dnVScmUzWTB2eDV3SjhmZk45WnZoSkVF?=
 =?utf-8?B?RjR3MkdiNUNMTHN3YnRMcm9KTElGQ2xFUlRBa1pVQ0JlU0V4ZmEvNzd1ZCs3?=
 =?utf-8?B?YWEwcCtNR0EvRDM4YTdFOWQyWEhOcFB4aW4zWnhMUzZFaGM4ekpmMmpEVEww?=
 =?utf-8?B?OWhMWi9XL28zUTdQRTNwa2pMVzQ2a1FkTEVxZC9iVlE4ZFNWbzMzUnlWcVpR?=
 =?utf-8?B?YU53SG80VVliV28xNUo4SEFmY0RwSk9ZMW1ONzJHV0xXa3Rmd2NsWDRVTy9D?=
 =?utf-8?B?VFMvQ2Zjb0ZWdWJDSUhUcGc5ZHlTUjI2eUI0WVQrZXdiOUtsNFlKa1UxVFZY?=
 =?utf-8?B?dkNnTEZCRktZZVJtMWYvSTBhTlVBVFB3WjdLbEVpYW54ZGlxYlc1b2hXR1NU?=
 =?utf-8?B?T1crTkVFWmczRHJUREVhRjA2TXhHMmZvQzFoN3JmR2JCaTR1SjBFVHhoMDhq?=
 =?utf-8?B?MHZ6bGE1aUZ1Tk1qNUg0cm0wNW5PMkYyWm5zWGZwUy8zLzZPOFZrekczWEIy?=
 =?utf-8?B?K0tXNWRpRmhscGthUEV3SkRmcmdCY01NTVhvQWYrTnowdGNQNzliVkhLcFlP?=
 =?utf-8?B?OExGc0NUWWM4VkJkZmZYR0IwL3I5Tk9KTVE4TGNBREFqQWc2emFKM2JEWUpu?=
 =?utf-8?B?VytXME9YLzZoaTNIYW0vV2VwR0VPNHR0Qm1KSUJ4azNhV1N0Mml4dVI0eVZ6?=
 =?utf-8?B?ZndqczR2cG5oRmY2MlFLUWN3NmZ1TS84YmJFbFpkZHhQWCt1Q3RDcHQwYlF4?=
 =?utf-8?B?anpHdFZ0MDFzWE9YTTVXb3lvS2Exd1czMDZBaUR5SzlBa2pwejRzbXJBdm94?=
 =?utf-8?B?Y0dOQnl6Qzh6Z1JtVzB6eExVT3cyMFYwb21VTHA5cUI1MHJSUHZWejBzZVlr?=
 =?utf-8?B?V2ovS0tMQThQUXVzNFZWaXRybDZyOU9nYzZvMEZqNm4zM1dxdDhKYmZkL2hF?=
 =?utf-8?B?S2ZnNnFFVWMzRlMvenl5TEhNeHErMnNvSW1wK3ozQm8zWEI4dUMrcGx6RnYx?=
 =?utf-8?B?YkdCZXJBbSs2UFZBaE9iM3lwTDJoSEg5RHZIaHVSODIvT0VadENvTGlrODRN?=
 =?utf-8?B?U25PaUdrQ2xhNUlZSWdIcDAvNllPSDJLY1o0VmFqakJ3azBIRlNwYUdnODJ1?=
 =?utf-8?B?bWZ1VmRMU0NkK1R6S2FDN2VNc05YSTl3anRkaEd6SitjeGhJeWhMN3hNUWho?=
 =?utf-8?B?bXY3RFJtSXluREtxMVluVkhyQVpKWXZzeUN1amhFSjdTbzNDb0FGeVhOUnZr?=
 =?utf-8?B?aG94T2tyV1VLU2VnUFoyQmhrREo4MjM3WFlBMlovRFpmVTZuZmJGNzkyOWRQ?=
 =?utf-8?Q?uBE0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4559fde8-e51c-4ed3-3a8b-08ddafdd4306
X-MS-Exchange-CrossTenant-AuthSource: MW5PR12MB5683.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 09:31:40.9685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x3+9uRo9vpG108i1ZU9V91yFW/eA5pMqPEBqprjks0/jeI0ozLa5U6dmKpNdpfb6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6374

Thanks Mario, add some comments

On 6/19/2025 12:35 AM, Mario Limonciello wrote:
> On 6/18/2025 4:19 AM, Bin Du wrote:
>> Isp4 sub-device is implementing v4l2 sub-device interface. It has one
>> capture video node, and supports only preview stream. It manages
>> firmware states, stream configuration and mipi phy configuration.
>> This change also adds interrupt handling and notification for isp
>> firmware to isp-subdevice.
>>
>> Signed-off-by: Bin Du <Bin.Du@amd.com>
>> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>> ---
>>   drivers/media/platform/amd/isp4/Makefile      |    3 +-
>>   drivers/media/platform/amd/isp4/isp4.c        |  267 +++-
>>   drivers/media/platform/amd/isp4/isp4.h        |    4 +-
>>   drivers/media/platform/amd/isp4/isp4_subdev.c | 1192 +++++++++++++++++
>>   drivers/media/platform/amd/isp4/isp4_subdev.h |  145 ++
>>   5 files changed, 1601 insertions(+), 10 deletions(-)
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.c
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.h
>>
>> diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/ 
>> platform/amd/isp4/Makefile
>> index c0166f954516..52defc06189e 100644
>> --- a/drivers/media/platform/amd/isp4/Makefile
>> +++ b/drivers/media/platform/amd/isp4/Makefile
>> @@ -3,9 +3,10 @@
>>   # Copyright (C) 2025 Advanced Micro Devices, Inc.
>>   obj-$(CONFIG_AMD_ISP4) += amd_capture.o
>> -amd_capture-objs := isp4.o    \
>> +amd_capture-objs := isp4_subdev.o \
>>               isp4_phy.o \
>>               isp4_interface.o \
>> +            isp4.o    \
>>               isp4_hw.o    \
>>   ccflags-y += -I$(srctree)/drivers/media/platform/amd/isp4
>> diff --git a/drivers/media/platform/amd/isp4/isp4.c b/drivers/media/ 
>> platform/amd/isp4/isp4.c
>> index d0be90c5ec3b..c1aca2bd35e3 100644
>> --- a/drivers/media/platform/amd/isp4/isp4.c
>> +++ b/drivers/media/platform/amd/isp4/isp4.c
>> @@ -5,13 +5,20 @@
>>   #include <linux/pm_runtime.h>
>>   #include <linux/vmalloc.h>
>> +#include <media/v4l2-fwnode.h>
>>   #include <media/v4l2-ioctl.h>
>> -#include "isp4.h"
>> +#include "amdgpu_object.h"
>> -#define VIDEO_BUF_NUM 5
>> +#include "isp4.h"
>> +#include "isp4_hw.h"
>>   #define ISP4_DRV_NAME "amd_isp_capture"
>> +#define ISP4_FW_RESP_RB_IRQ_STATUS_MASK \
>> +    (ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT9_INT_MASK  | \
>> +     ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT10_INT_MASK | \
>> +     ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT11_INT_MASK | \
>> +     ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT12_INT_MASK)
>>   /* interrupt num */
>>   static const u32 isp4_ringbuf_interrupt_num[] = {
>> @@ -24,23 +31,233 @@ static const u32 isp4_ringbuf_interrupt_num[] = {
>>   #define to_isp4_device(dev) \
>>       ((struct isp4_device *)container_of(dev, struct isp4_device, 
>> v4l2_dev))
>> +static int isp4_create_links(struct isp4_device *isp4_dev,
>> +                 struct v4l2_subdev *sensor_sdev)
>> +{
>> +    struct v4l2_subdev *isp4_sdev = &isp4_dev->isp_sdev.sdev;
>> +    struct device *dev = &isp4_dev->pdev->dev;
>> +    int ret;
>> +
>> +    ret = media_create_pad_link(&sensor_sdev->entity,
>> +                    0, &isp4_sdev->entity, 0,
>> +                    MEDIA_LNK_FL_ENABLED |
>> +                    MEDIA_LNK_FL_IMMUTABLE);
>> +    if (ret)
>> +        dev_err(dev, "create sensor to isp link fail:%d\n", ret);
>> +
>> +    return ret;
>> +}
>> +
>> +static int isp4_register_subdev_and_create_links(struct isp4_device 
>> *isp_dev,
>> +                         struct v4l2_subdev *sdev)
>> +{
>> +    struct device *dev = &isp_dev->pdev->dev;
>> +    int ret;
>> +
>> +    ret = isp4_create_links(isp_dev, sdev);
>> +    if (ret)
>> +        dev_err(dev, "fail create isp link:%d\n", ret);
> 
> You're discarding ret here.  Shouldn't you return ret in the failure path?
Even if it fails, some Apps which doesn't depend on the media link can 
still work, so just print error message and ignore it so at least these 
Apps can still work, do you think it acceptible?>
>> +
>> +    ret = v4l2_device_register_subdev_nodes(&isp_dev->v4l2_dev);
>> +    if (ret != 0) {
>> +        dev_warn(dev, "register subdev as nodes fail:%d\n", ret);
>> +        ret = 0;
> 
> This isn't fatal?
> 
This call is just expose subdev node to user space, even if it fails, 
some Apps can still work, so just print error message and ignore it so 
at least these Apps can still work, do you think it acceptible?>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +static int isp4_camera_sensor_bound(struct v4l2_async_notifier 
>> *notifier,
>> +                    struct v4l2_subdev *sensor_sdev,
>> +                    struct v4l2_async_connection *asd)
>> +{
>> +    struct isp4_device *isp_dev = to_isp4_device(notifier->v4l2_dev);
>> +    struct device *dev = &isp_dev->pdev->dev;
>> +    int ret;
>> +
>> +    ret = isp4_register_subdev_and_create_links(isp_dev, sensor_sdev);
>> +    if (ret)
>> +        dev_err(dev, "register sensor subdev fail:%d\n",
>> +            ret);
>> +    else
>> +        dev_dbg(dev, "register sensor subdev suc\n");
> 
> Probably can drop this now
> 
I'd prefer to keeping this for quickly identifying possible camera open 
issue, do you think it acceptible?

>> +    return ret;
>> +}
>> +
>> +static void isp4_camera_sensor_unbind(struct v4l2_async_notifier 
>> *notifier,
>> +                      struct v4l2_subdev *sensor_sdev,
>> +                      struct v4l2_async_connection *asd)
>> +{
>> +}
>> +
>> +static const struct v4l2_async_notifier_operations 
>> isp4_camera_sensor_ops = {
>> +    .bound = isp4_camera_sensor_bound,
>> +    .unbind = isp4_camera_sensor_unbind,
>> +};
>> +
>> +static void isp4_wake_up_resp_thread(struct isp4_subdev *isp, u32 index)
>> +{
>> +    if (isp && index < ISP4SD_MAX_FW_RESP_STREAM_NUM) {
>> +        struct isp4sd_thread_handler *thread_ctx =
>> +                &isp->fw_resp_thread[index];
>> +
>> +        thread_ctx->wq_cond = 1;
>> +        wake_up_interruptible(&thread_ctx->waitq);
>> +    }
>> +}
>> +
>> +static void isp4_resp_interrupt_notify(struct isp4_subdev *isp, u32 
>> intr_status)
>> +{
>> +    bool wake = (isp->ispif.status == ISP4IF_STATUS_FW_RUNNING);
>> +
>> +    u32 intr_ack = 0;
>> +
>> +    /* global response */
>> +    if (intr_status &
>> +        ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT12_INT_MASK) {
>> +        if (wake)
>> +            isp4_wake_up_resp_thread(isp, 0);
>> +
>> +        intr_ack |= ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT12_ACK_MASK;
>> +    }
>> +
>> +    /* stream 1 response */
>> +    if (intr_status &
>> +        ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT9_INT_MASK) {
>> +        if (wake)
>> +            isp4_wake_up_resp_thread(isp, 1);
>> +
>> +        intr_ack |= ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT9_ACK_MASK;
>> +    }
>> +
>> +    /* stream 2 response */
>> +    if (intr_status &
>> +        ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT10_INT_MASK) {
>> +        if (wake)
>> +            isp4_wake_up_resp_thread(isp, 2);
>> +
>> +        intr_ack |= ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT10_ACK_MASK;
>> +    }
>> +
>> +    /* stream 3 response */
>> +    if (intr_status &
>> +        ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT11_INT_MASK) {
>> +        if (wake)
>> +            isp4_wake_up_resp_thread(isp, 3);
>> +
>> +        intr_ack |= ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT11_ACK_MASK;
>> +    }
>> +
>> +    /* clear ISP_SYS interrupts */
>> +    isp4hw_wreg(ISP4_GET_ISP_REG_BASE(isp), ISP_SYS_INT0_ACK, intr_ack);
>> +}
>> +
>>   static irqreturn_t isp4_irq_handler(int irq, void *arg)
>>   {
>> -    struct isp4_device *isp_dev = dev_get_drvdata((struct device *)arg);
>> +    struct isp4_device *isp_dev = dev_get_drvdata(arg);
>> +    struct isp4_subdev *isp = NULL;
>> +    u32 isp_sys_irq_status = 0x0;
>> +    u32 r1;
>>       if (!isp_dev)
>> -        goto error_drv_data;
>> +        return IRQ_HANDLED;
> 
> As mentioned in the first patch, avoid ping ponging the code.
>
Thanks, will remove the code ping ponging in next patch>> +
>> +    isp = &isp_dev->isp_sdev;
>> +    /* check ISP_SYS interrupts status */
>> +    r1 = isp4hw_rreg(ISP4_GET_ISP_REG_BASE(isp), ISP_SYS_INT0_STATUS);
>> +
>> +    isp_sys_irq_status = r1 & ISP4_FW_RESP_RB_IRQ_STATUS_MASK;
>> +
>> +    isp4_resp_interrupt_notify(isp, isp_sys_irq_status);
>> -error_drv_data:
> As mentioned in the first patch, avoid ping ponging the code.
Thanks, will remove the code ping ponging in next patch>>       return 
IRQ_HANDLED;
>>   }
>> +static int isp4_parse_fwnode_init_async_nf(struct isp4_device *isp_dev)
>> +{
>> +    struct isp4_subdev *isp_sdev = &isp_dev->isp_sdev;
>> +    struct device *dev = &isp_dev->pdev->dev;
>> +    struct v4l2_fwnode_endpoint bus_cfg = {
>> +        .bus_type = V4L2_MBUS_CSI2_DPHY
>> +    };
>> +    struct fwnode_handle *remote_ep = NULL;
>> +    struct fwnode_handle *local_ep = NULL;
>> +    struct v4l2_async_connection *asd;
>> +    struct fwnode_handle *fwnode;
>> +    struct fwnode_endpoint fwep;
>> +    int ret;
>> +
>> +    fwnode = dev_fwnode(dev);
>> +
>> +    local_ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
>> +    if (!local_ep) {
>> +        ret = -ENXIO;
>> +        goto err_fwnode;
>> +    }
>> +
>> +    remote_ep = fwnode_graph_get_remote_endpoint(local_ep);
>> +    if (!remote_ep) {
>> +        ret = -ENXIO;
>> +        goto err_fwnode;
>> +    }
>> +
>> +    ret = fwnode_graph_parse_endpoint(remote_ep, &fwep);
>> +    if (ret)
>> +        goto err_fwnode;
>> +    isp_sdev->phy_id = fwep.port;
>> +
>> +    ret = v4l2_fwnode_endpoint_alloc_parse(remote_ep, &bus_cfg);
>> +    if (ret)
>> +        goto err_fwnode;
>> +
>> +    if (!bus_cfg.nr_of_link_frequencies) {
>> +        ret = -EINVAL;
>> +        dev_err(dev, "fail invalid link freq number %u\n", 
>> bus_cfg.nr_of_link_frequencies);
>> +        v4l2_fwnode_endpoint_free(&bus_cfg);
>> +        goto err_fwnode;
>> +    }
>> +    isp_sdev->phy_link_freq = *bus_cfg.link_frequencies;
>> +    v4l2_fwnode_endpoint_free(&bus_cfg);
>> +
>> +    isp_sdev->phy_num_data_lanes =
>> +        fwnode_property_count_u32(remote_ep, "data-lanes");
>> +
>> +    v4l2_async_nf_init(&isp_dev->notifier, &isp_dev->v4l2_dev);
>> +
>> +    asd = v4l2_async_nf_add_fwnode(&isp_dev->notifier, remote_ep,
>> +                       struct v4l2_async_connection);
>> +    if (IS_ERR(asd)) {
>> +        ret = PTR_ERR(asd);
>> +        goto err_async_nf_cleanup;
>> +    }
>> +
>> +    isp_dev->notifier.ops = &isp4_camera_sensor_ops;
>> +    ret = v4l2_async_nf_register(&isp_dev->notifier);
>> +    if (ret) {
>> +        dev_err(dev, "v4l2_async_nf_register fail:%d", ret);
>> +        goto err_async_nf_cleanup;
>> +    }
>> +
>> +    return 0;
>> +
>> +err_async_nf_cleanup:
>> +    v4l2_async_nf_cleanup(&isp_dev->notifier);
>> +err_fwnode:
>> +    if (remote_ep)
>> +        fwnode_handle_put(remote_ep);
>> +    if (local_ep)
>> +        fwnode_handle_put(remote_ep);
>> +
>> +    return ret;
>> +}
>> +
>>   /*
>>    * amd capture module
>>    */
>>   static int isp4_capture_probe(struct platform_device *pdev)
>>   {
>>       struct device *dev = &pdev->dev;
>> +    struct isp4_subdev *isp_sdev;
>>       struct isp4_device *isp_dev;
>>       int i, irq, ret;
>> @@ -52,6 +269,17 @@ static int isp4_capture_probe(struct 
>> platform_device *pdev)
>>       isp_dev->pdev = pdev;
>>       dev->init_name = ISP4_DRV_NAME;
>> +    isp_sdev = &isp_dev->isp_sdev;
>> +    isp_sdev->mmio = devm_platform_ioremap_resource(pdev, 0);
>> +    if (IS_ERR(isp_sdev->mmio))
>> +        return dev_err_probe(dev, PTR_ERR(isp_sdev->mmio),
>> +                     "isp ioremap fail\n");
>> +
>> +    isp_sdev->isp_phy_mmio = devm_platform_ioremap_resource(pdev, 1);
>> +    if (IS_ERR(isp_sdev->isp_phy_mmio))
>> +        return dev_err_probe(dev, PTR_ERR(isp_sdev->isp_phy_mmio),
>> +                     "isp phy mmio ioremap fail\n");
>> +
>>       for (i = 0; i < ARRAY_SIZE(isp4_ringbuf_interrupt_num); i++) {
>>           irq = platform_get_irq(pdev, isp4_ringbuf_interrupt_num[i]);
>>           if (irq < 0)
>> @@ -90,10 +318,23 @@ static int isp4_capture_probe(struct 
>> platform_device *pdev)
>>       dev_dbg(dev, "AMD ISP v4l2 device registered\n");
>> +    ret = isp4sd_init(&isp_dev->isp_sdev, &isp_dev->v4l2_dev,
>> +              isp_dev->pltf_data->adev);
>> +    if (ret) {
>> +        dev_err(dev, "fail init isp4 sub dev %d\n", ret);
>> +        goto err_unreg_v4l2;
>> +    }
>> +
>> +    ret = isp4_parse_fwnode_init_async_nf(isp_dev);
>> +    if (ret) {
>> +        dev_err(dev, "fail to parse fwnode %d\n", ret);
>> +        goto err_unreg_v4l2;
>> +    }
>> +
>>       ret = media_device_register(&isp_dev->mdev);
>>       if (ret) {
>>           dev_err(dev, "fail to register media device %d\n", ret);
>> -        goto err_unreg_v4l2;
>> +        goto err_isp4_deinit;
>>       }
>>       platform_set_drvdata(pdev, isp_dev);
>> @@ -103,6 +344,10 @@ static int isp4_capture_probe(struct 
>> platform_device *pdev)
>>       return 0;
>> +err_isp4_deinit:
>> +    v4l2_async_nf_unregister(&isp_dev->notifier);
>> +    v4l2_async_nf_cleanup(&isp_dev->notifier);
>> +    isp4sd_deinit(&isp_dev->isp_sdev);
>>   err_unreg_v4l2:
>>       v4l2_device_unregister(&isp_dev->v4l2_dev);
>> @@ -112,11 +357,17 @@ static int isp4_capture_probe(struct 
>> platform_device *pdev)
>>   static void isp4_capture_remove(struct platform_device *pdev)
>>   {
>>       struct isp4_device *isp_dev = platform_get_drvdata(pdev);
>> -    struct device *dev = &pdev->dev;
>> +
>> +    v4l2_async_nf_unregister(&isp_dev->notifier);
>> +    v4l2_async_nf_cleanup(&isp_dev->notifier);
>> +    v4l2_device_unregister_subdev(&isp_dev->isp_sdev.sdev);
>>       media_device_unregister(&isp_dev->mdev);
>> +    media_entity_cleanup(&isp_dev->isp_sdev.sdev.entity);
>>       v4l2_device_unregister(&isp_dev->v4l2_dev);
>> -    dev_dbg(dev, "AMD ISP v4l2 device unregistered\n");
>> +    dev_dbg(&pdev->dev, "AMD ISP v4l2 device unregistered\n");
> 
> Don't ping pong this
> 
This log will be removed in next patch as you suggested in other comment
>> +
>> +    isp4sd_deinit(&isp_dev->isp_sdev);
>>   }
>>   static struct platform_driver isp4_capture_drv = {
>> diff --git a/drivers/media/platform/amd/isp4/isp4.h b/drivers/media/ 
>> platform/amd/isp4/isp4.h
>> index 27a7362ce6f9..596431b4a5c2 100644
>> --- a/drivers/media/platform/amd/isp4/isp4.h
>> +++ b/drivers/media/platform/amd/isp4/isp4.h
>> @@ -7,9 +7,9 @@
>>   #define _ISP4_H_
>>   #include <linux/mutex.h>
>> -#include <media/v4l2-device.h>
>>   #include <media/videobuf2-memops.h>
>>   #include <media/videobuf2-vmalloc.h>
>> +#include "isp4_subdev.h"
>>   #define ISP4_GET_ISP_REG_BASE(isp4sd) (((isp4sd))->mmio)
>> @@ -25,11 +25,13 @@ struct isp4_platform_data {
>>   struct isp4_device {
>>       struct v4l2_device v4l2_dev;
>> +    struct isp4_subdev isp_sdev;
>>       struct media_device mdev;
>>       struct isp4_platform_data *pltf_data;
>>       struct platform_device *pdev;
>>       struct notifier_block i2c_nb;
>> +    struct v4l2_async_notifier notifier;
>>   };
>>   #endif /* isp4.h */
>> diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/ 
>> media/platform/amd/isp4/isp4_subdev.c
>> new file mode 100644
>> index 000000000000..978164031067
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
>> @@ -0,0 +1,1192 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#include <linux/mutex.h>
>> +#include <linux/pm_domain.h>
>> +#include <linux/pm_runtime.h>
>> +
>> +#include "isp4_fw_cmd_resp.h"
>> +#include "isp4_hw.h"
>> +#include "isp4_interface.h"
>> +#include "isp4_phy.h"
>> +#include "isp4_subdev.h"
>> +#include <linux/units.h>
>> +
>> +#define ISP4SD_MAX_CMD_RESP_BUF_SIZE (4 * 1024)
>> +#define ISP4SD_MIN_BUF_CNT_BEF_START_STREAM 4
>> +
>> +#define ISP4SD_PERFORMANCE_STATE_LOW 0
>> +#define ISP4SD_PERFORMANCE_STATE_HIGH 1
>> +
>> +#define ISP4SD_FW_CMD_TIMEOUT_IN_MS  500
>> +#define ISP4SD_WAIT_RESP_IRQ_TIMEOUT  5 /* ms */
>> +/* align 32KB */
>> +#define ISP4SD_META_BUF_SIZE ALIGN(sizeof(struct isp4fw_meta_info), 
>> 0x8000)
>> +
>> +#define to_isp4_subdev(v4l2_sdev)  \
>> +    container_of(v4l2_sdev, struct isp4_subdev, sdev)
>> +
>> +#define to_isp4_vdev(isp4_vid)  \
>> +    container_of(isp4_vid, struct isp4_subdev, isp_vdev)
>> +
>> +static const char *isp4sd_entity_name = "amd isp4";
>> +
>> +struct isp4sd_mbus_image_format_remap {
>> +    u32                mbus_code;
>> +    enum isp4fw_image_format    image_format;
>> +};
>> +
>> +static const struct isp4sd_mbus_image_format_remap
>> +    isp4sd_image_formats[] = {
>> +    {
>> +        .mbus_code    = MEDIA_BUS_FMT_YUYV8_1_5X8,
>> +        .image_format    = IMAGE_FORMAT_NV12,
>> +    },
>> +    {
>> +        .mbus_code    = MEDIA_BUS_FMT_YUYV8_1X16,
>> +        .image_format    = IMAGE_FORMAT_YUV422INTERLEAVED,
>> +    },
>> +};
>> +
>> +static void isp4sd_module_enable(struct isp4_subdev *isp_subdev, bool 
>> enable)
>> +{
>> +    if (isp_subdev->enable_gpio) {
>> +        gpiod_set_value(isp_subdev->enable_gpio, enable ? 1 : 0);
>> +        dev_dbg(isp_subdev->dev, "%s isp_subdev module\n",
>> +            enable ? "enable" : "disable");
>> +    }
>> +}
>> +
>> +static int isp4sd_setup_fw_mem_pool(struct isp4_subdev *isp_subdev)
>> +{
>> +    struct isp4_interface *ispif = &isp_subdev->ispif;
>> +    struct isp4fw_cmd_send_buffer buf_type;
>> +    struct device *dev = isp_subdev->dev;
>> +    int ret;
>> +
>> +    if (!ispif->fw_mem_pool) {
>> +        dev_err(dev, "fail to alloc mem pool\n");
>> +        return -ENOMEM;
>> +    }
>> +
>> +    memset(&buf_type, 0, sizeof(buf_type));
>> +    buf_type.buffer_type = BUFFER_TYPE_MEM_POOL;
>> +    buf_type.buffer.buf_tags = 0;
>> +    buf_type.buffer.vmid_space.bit.vmid = 0;
>> +    buf_type.buffer.vmid_space.bit.space = ADDR_SPACE_TYPE_GPU_VA;
>> +    isp4if_split_addr64(ispif->fw_mem_pool->gpu_mc_addr,
>> +                &buf_type.buffer.buf_base_a_lo,
>> +                &buf_type.buffer.buf_base_a_hi);
>> +    buf_type.buffer.buf_size_a = (u32)ispif->fw_mem_pool->mem_size;
>> +
>> +    ret = isp4if_send_command(ispif, CMD_ID_SEND_BUFFER,
>> +                  &buf_type, sizeof(buf_type));
>> +    if (ret) {
>> +        dev_err(dev, "send fw mem pool 0x%llx(%u) fail %d\n",
>> +            ispif->fw_mem_pool->gpu_mc_addr,
>> +            buf_type.buffer.buf_size_a,
>> +            ret);
>> +        return ret;
>> +    }
>> +
>> +    dev_dbg(dev, "send fw mem pool 0x%llx(%u) suc\n",
>> +        ispif->fw_mem_pool->gpu_mc_addr,
>> +        buf_type.buffer.buf_size_a);
>> +
>> +    return 0;
>> +};
>> +
>> +static int isp4sd_set_stream_path(struct isp4_subdev *isp_subdev)
>> +{
>> +    struct isp4_interface *ispif = &isp_subdev->ispif;
>> +    struct isp4fw_cmd_set_stream_cfg cmd = {0};
>> +    struct device *dev = isp_subdev->dev;
>> +
>> +    cmd.stream_cfg.mipi_pipe_path_cfg.isp4fw_sensor_id = 
>> SENSOR_ID_ON_MIPI0;
>> +    cmd.stream_cfg.mipi_pipe_path_cfg.b_enable = true;
>> +    cmd.stream_cfg.isp_pipe_path_cfg.isp_pipe_id = 
>> MIPI0_ISP_PIPELINE_ID;
>> +
>> +    cmd.stream_cfg.b_enable_tnr = true;
>> +    dev_dbg(dev, "isp4fw_sensor_id %d, pipeId 0x%x EnableTnr %u\n",
>> +        cmd.stream_cfg.mipi_pipe_path_cfg.isp4fw_sensor_id,
>> +        cmd.stream_cfg.isp_pipe_path_cfg.isp_pipe_id,
>> +        cmd.stream_cfg.b_enable_tnr);
>> +
>> +    return isp4if_send_command(ispif, CMD_ID_SET_STREAM_CONFIG,
>> +                   &cmd, sizeof(cmd));
>> +}
>> +
>> +static int isp4sd_send_meta_buf(struct isp4_subdev *isp_subdev)
>> +{
>> +    struct isp4_interface *ispif = &isp_subdev->ispif;
>> +    struct isp4fw_cmd_send_buffer buf_type = { 0 };
>> +    struct isp4sd_sensor_info *sensor_info;
>> +    struct device *dev = isp_subdev->dev;
>> +    u32 i;
>> +
>> +    sensor_info = &isp_subdev->sensor_info;
>> +    for (i = 0; i < ISP4IF_MAX_STREAM_META_BUF_COUNT; i++) {
>> +        int ret;
>> +
>> +        if (!sensor_info->meta_info_buf[i]) {
>> +            dev_err(dev, "fail for no meta info buf(%u)\n", i);
>> +            return -ENOMEM;
>> +        }
>> +        buf_type.buffer_type = BUFFER_TYPE_META_INFO;
>> +        buf_type.buffer.buf_tags = 0;
>> +        buf_type.buffer.vmid_space.bit.vmid = 0;
>> +        buf_type.buffer.vmid_space.bit.space = ADDR_SPACE_TYPE_GPU_VA;
>> +        isp4if_split_addr64(sensor_info->meta_info_buf[i]->gpu_mc_addr,
>> +                    &buf_type.buffer.buf_base_a_lo,
>> +                    &buf_type.buffer.buf_base_a_hi);
>> +        buf_type.buffer.buf_size_a =
>> +            (u32)sensor_info->meta_info_buf[i]->mem_size;
>> +        ret = isp4if_send_command(ispif, CMD_ID_SEND_BUFFER,
>> +                      &buf_type,
>> +                      sizeof(buf_type));
>> +        if (ret) {
>> +            dev_err(dev, "send meta info(%u) fail\n", i);
>> +            return ret;
>> +        }
>> +    }
>> +
>> +    dev_dbg(dev, "send meta info suc\n");
>> +    return 0;
>> +}
>> +
>> +static int isp4sd_enum_mbus_code(struct v4l2_subdev *isp_subdev,
>> +                 struct v4l2_subdev_state *state,
>> +                 struct v4l2_subdev_mbus_code_enum *code_enum)
>> +{
>> +    if (code_enum->index >= ARRAY_SIZE(isp4sd_image_formats))
>> +        return -EINVAL;
>> +
>> +    code_enum->code = isp4sd_image_formats[code_enum->index].mbus_code;
>> +
>> +    return 0;
>> +}
>> +
>> +static bool isp4sd_get_str_out_prop(struct isp4_subdev *isp_subdev,
>> +                    struct isp4fw_image_prop *out_prop,
>> +                    struct v4l2_subdev_state *state, u32 pad)
>> +{
>> +    struct v4l2_mbus_framefmt *format = NULL;
>> +    struct device *dev = isp_subdev->dev;
>> +    bool ret;
>> +
>> +    format = v4l2_subdev_state_get_format(state, pad, 0);
>> +    if (!format) {
>> +        dev_err(dev, "fail get subdev state format\n");
>> +        return false;
>> +    }
>> +
>> +    switch (format->code) {
>> +    case MEDIA_BUS_FMT_YUYV8_1_5X8:
>> +        out_prop->image_format = IMAGE_FORMAT_NV12;
>> +        out_prop->width = format->width;
>> +        out_prop->height = format->height;
>> +        out_prop->luma_pitch = format->width;
>> +        out_prop->chroma_pitch = out_prop->width;
>> +        ret = true;
>> +        break;
>> +    case MEDIA_BUS_FMT_YUYV8_1X16:
>> +        out_prop->image_format = IMAGE_FORMAT_YUV422INTERLEAVED;
>> +        out_prop->width = format->width;
>> +        out_prop->height = format->height;
>> +        out_prop->luma_pitch = format->width * 2;
>> +        out_prop->chroma_pitch = 0;
>> +        ret = true;
>> +        break;
>> +    default:
>> +        dev_err(dev, "fail for bad image format:0x%x\n",
>> +            format->code);
>> +        ret = false;
>> +        break;
>> +    }
>> +
>> +    if (!out_prop->width || !out_prop->height)
>> +        ret = false;
>> +    return ret;
>> +}
>> +
>> +static int isp4sd_kickoff_stream(struct isp4_subdev *isp_subdev, u32 
>> w, u32 h)
>> +{
>> +    struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
>> +    struct isp4_interface *ispif = &isp_subdev->ispif;
>> +    struct device *dev = isp_subdev->dev;
>> +
>> +    if (sensor_info->status == ISP4SD_START_STATUS_STARTED) {
>> +        return 0;
>> +    } else if (sensor_info->status == ISP4SD_START_STATUS_START_FAIL) {
>> +        dev_err(dev, "fail for previous start fail\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    dev_dbg(dev, "w:%u,h:%u\n", w, h);
>> +
>> +    sensor_info->status = ISP4SD_START_STATUS_START_FAIL;
>> +
>> +    if (isp4sd_send_meta_buf(isp_subdev)) {
>> +        dev_err(dev, "fail to send meta buf\n");
>> +        return -EINVAL;
>> +    };
>> +
>> +    sensor_info->status = ISP4SD_START_STATUS_NOT_START;
>> +
>> +    if (!sensor_info->start_stream_cmd_sent &&
>> +        sensor_info->buf_sent_cnt >=
>> +        ISP4SD_MIN_BUF_CNT_BEF_START_STREAM) {
>> +        int ret = isp4if_send_command(ispif, CMD_ID_START_STREAM,
>> +                          NULL, 0);
>> +        if (ret) {
>> +            dev_err(dev, "fail to start stream\n");
>> +            return ret;
>> +        }
>> +
>> +        sensor_info->start_stream_cmd_sent = true;
>> +    } else {
>> +        dev_dbg(dev,
>> +            "no send START_STREAM, start_sent %u, buf_sent %u\n",
>> +            sensor_info->start_stream_cmd_sent,
>> +            sensor_info->buf_sent_cnt);
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int isp4sd_setup_output(struct isp4_subdev *isp_subdev,
>> +                   struct v4l2_subdev_state *state, u32 pad)
>> +{
>> +    struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
>> +    struct isp4sd_output_info *output_info =
>> +            &isp_subdev->sensor_info.output_info;
>> +    struct isp4fw_cmd_set_out_ch_prop cmd_ch_prop = {0};
>> +    struct isp4_interface *ispif = &isp_subdev->ispif;
>> +    struct isp4fw_cmd_enable_out_ch cmd_ch_en = {0};
>> +    struct device *dev = isp_subdev->dev;
>> +    struct isp4fw_image_prop *out_prop;
>> +    int ret;
>> +
>> +    if (output_info->start_status == ISP4SD_START_STATUS_STARTED)
>> +        return 0;
>> +
>> +    if (output_info->start_status == ISP4SD_START_STATUS_START_FAIL) {
>> +        dev_err(dev, "fail for previous start fail\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    out_prop = &cmd_ch_prop.image_prop;
>> +    cmd_ch_prop.ch = ISP_PIPE_OUT_CH_PREVIEW;
>> +    cmd_ch_en.ch = ISP_PIPE_OUT_CH_PREVIEW;
>> +    cmd_ch_en.is_enable = true;
>> +
>> +    if (!isp4sd_get_str_out_prop(isp_subdev, out_prop, state, pad)) {
>> +        dev_err(dev, "fail to get out prop\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    dev_dbg(dev, "channel: w:h=%u:%u,lp:%u,cp%u\n",
>> +        cmd_ch_prop.image_prop.width, cmd_ch_prop.image_prop.height,
>> +        cmd_ch_prop.image_prop.luma_pitch,
>> +        cmd_ch_prop.image_prop.chroma_pitch);
>> +
>> +    ret = isp4if_send_command(ispif, CMD_ID_SET_OUT_CHAN_PROP,
>> +                  &cmd_ch_prop,
>> +                  sizeof(cmd_ch_prop));
>> +    if (ret) {
>> +        output_info->start_status = ISP4SD_START_STATUS_START_FAIL;
>> +        dev_err(dev, "fail to set out prop\n");
>> +        return ret;
>> +    };
>> +
>> +    ret = isp4if_send_command(ispif, CMD_ID_ENABLE_OUT_CHAN,
>> +                  &cmd_ch_en, sizeof(cmd_ch_en));
>> +
>> +    if (ret) {
>> +        output_info->start_status = ISP4SD_START_STATUS_START_FAIL;
>> +        dev_err(dev, "fail to enable channel\n");
>> +        return ret;
>> +    }
>> +
>> +    if (!sensor_info->start_stream_cmd_sent) {
>> +        ret = isp4sd_kickoff_stream(isp_subdev, out_prop->width,
>> +                        out_prop->height);
>> +        if (ret) {
>> +            dev_err(dev, "kickoff stream fail %d\n", ret);
>> +            return ret;
>> +        }
>> +        /* sensor_info->start_stream_cmd_sent will be set to true
>> +         * 1. in isp4sd_kickoff_stream, if app first send buffer then
>> +         * start stream
>> +         * 2. in isp_set_stream_buf, if app first start stream, then
>> +         * send buffer
>> +         * because ISP FW has the requirement, host needs to send buffer
>> +         * before send start stream cmd
>> +         */
>> +        if (sensor_info->start_stream_cmd_sent) {
>> +            sensor_info->status = ISP4SD_START_STATUS_STARTED;
>> +            output_info->start_status = ISP4SD_START_STATUS_STARTED;
>> +            dev_dbg(dev, "kickoff stream suc,start cmd sent\n");
>> +        } else {
>> +            dev_dbg(dev, "kickoff stream suc,start cmd not sent\n");
>> +        }
>> +    } else {
>> +        dev_dbg(dev, "stream running, no need kickoff\n");
>> +        output_info->start_status = ISP4SD_START_STATUS_STARTED;
>> +    }
>> +
>> +    dev_dbg(dev, "setup output suc\n");
>> +    return 0;
>> +}
>> +
>> +static int isp4sd_alloc_meta_buf(struct isp4_subdev *isp_subdev)
>> +{
>> +    struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
>> +    struct isp4_interface *ispif = &isp_subdev->ispif;
>> +    struct device *dev = isp_subdev->dev;
>> +    u32 i;
>> +
>> +    /* TODO: check alloc method */
>> +    for (i = 0; i < ISP4IF_MAX_STREAM_META_BUF_COUNT; i++) {
>> +        if (!sensor_info->meta_info_buf[i]) {
>> +            sensor_info->meta_info_buf[i] =
>> +                ispif->metainfo_buf_pool[i];
>> +            if (sensor_info->meta_info_buf[i]) {
>> +                dev_dbg(dev, "valid %u meta_info_buf ok\n", i);
>> +            } else {
>> +                dev_err(dev,
>> +                    "invalid %u meta_info_buf fail\n", i);
>> +                return -ENOMEM;
>> +            }
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int isp4sd_init_stream(struct isp4_subdev *isp_subdev)
>> +{
>> +    struct device *dev = isp_subdev->dev;
>> +    int ret;
>> +
>> +    ret  = isp4sd_setup_fw_mem_pool(isp_subdev);
>> +    if (ret) {
>> +        dev_err(dev, "fail to  setup fw mem pool\n");
>> +        return ret;
>> +    }
>> +
>> +    ret  = isp4sd_alloc_meta_buf(isp_subdev);
>> +    if (ret) {
>> +        dev_err(dev, "fail to alloc fw driver shared buf\n");
>> +        return ret;
>> +    }
>> +
>> +    ret = isp4sd_set_stream_path(isp_subdev);
>> +    if (ret) {
>> +        dev_err(dev, "fail to setup stream path\n");
>> +        return ret;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static void isp4sd_reset_stream_info(struct isp4_subdev *isp_subdev,
>> +                     struct v4l2_subdev_state *state, u32 pad)
>> +{
>> +    struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
>> +    struct v4l2_mbus_framefmt *format = NULL;
>> +    struct isp4sd_output_info *str_info;
>> +    int i;
>> +
>> +    format = v4l2_subdev_state_get_format(state,
>> +                          pad,
>> +                          0);
>> +
>> +    if (!format) {
>> +        pr_err("fail reset stream info for not get format\n");
>> +
>> +    } else {
>> +        memset(format, 0, sizeof(*format));
>> +        format->code = MEDIA_BUS_FMT_YUYV8_1_5X8;
>> +    }
>> +
>> +    for (i = 0; i < ISP4IF_MAX_STREAM_META_BUF_COUNT; i++)
>> +        sensor_info->meta_info_buf[i] = NULL;
>> +
>> +    str_info = &sensor_info->output_info;
>> +    str_info->start_status = ISP4SD_START_STATUS_NOT_START;
>> +}
>> +
>> +static bool isp4sd_is_stream_running(struct isp4_subdev *isp_subdev)
>> +{
>> +    struct isp4sd_sensor_info *sif;
>> +    enum isp4sd_start_status stat;
>> +
>> +    sif = &isp_subdev->sensor_info;
>> +    stat = sif->output_info.start_status;
>> +    if (stat == ISP4SD_START_STATUS_STARTED)
>> +        return true;
>> +
>> +    return false;
>> +}
>> +
>> +static void isp4sd_reset_camera_info(struct isp4_subdev *isp_subdev,
>> +                     struct v4l2_subdev_state *state, u32 pad)
>> +{
>> +    struct isp4sd_sensor_info *info  = &isp_subdev->sensor_info;
>> +
>> +    info->status = ISP4SD_START_STATUS_NOT_START;
>> +    isp4sd_reset_stream_info(isp_subdev, state, pad);
>> +
>> +    info->start_stream_cmd_sent = false;
>> +}
>> +
>> +static int isp4sd_uninit_stream(struct isp4_subdev *isp_subdev,
>> +                struct v4l2_subdev_state *state, u32 pad)
>> +{
>> +    struct isp4_interface *ispif = &isp_subdev->ispif;
>> +    struct device *dev = isp_subdev->dev;
>> +    bool running;
>> +
>> +    running = isp4sd_is_stream_running(isp_subdev);
>> +
>> +    if (running) {
>> +        dev_dbg(dev, "fail for stream is still running\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    isp4sd_reset_camera_info(isp_subdev, state, pad);
>> +
>> +    isp4if_clear_cmdq(ispif);
>> +    return 0;
>> +}
>> +
>> +static void isp4sd_fw_resp_cmd_done(struct isp4_subdev *isp_subdev,
>> +                    enum isp4if_stream_id stream_id,
>> +                    struct isp4fw_resp_cmd_done *para)
>> +{
>> +    struct isp4_interface *ispif = &isp_subdev->ispif;
>> +    struct isp4if_cmd_element *ele =
>> +        isp4if_rm_cmd_from_cmdq(ispif, para->cmd_seq_num, para->cmd_id);
>> +    struct device *dev = isp_subdev->dev;
>> +
>> +    dev_dbg(dev, "stream %d,cmd (0x%08x)(%d),seq %u, ele %p\n",
>> +        stream_id,
>> +        para->cmd_id, para->cmd_status, para->cmd_seq_num,
>> +        ele);
>> +
>> +    if (!ele)
>> +        return;
>> +
>> +    if (ele->wq) {
>> +        dev_dbg(dev, "signal event %p\n", ele->wq);
>> +        if (ele->wq_cond)
>> +            *ele->wq_cond = 1;
>> +        wake_up(ele->wq);
>> +    }
>> +
>> +    kfree(ele);
>> +}
>> +
>> +static struct isp4fw_meta_info *
>> +isp4sd_get_meta_by_mc(struct isp4_subdev *isp_subdev,
>> +              u64 mc)
>> +{
>> +    u32 i;
>> +
>> +    for (i = 0; i < ISP4IF_MAX_STREAM_META_BUF_COUNT; i++) {
>> +        struct isp4if_gpu_mem_info *meta_info_buf =
>> +                isp_subdev->sensor_info.meta_info_buf[i];
>> +
>> +        if (meta_info_buf) {
>> +            if (mc == meta_info_buf->gpu_mc_addr)
>> +                return meta_info_buf->sys_addr;
>> +        }
>> +    }
>> +    return NULL;
>> +};
>> +
>> +static struct isp4if_img_buf_node *
>> +isp4sd_preview_done(struct isp4_subdev *isp_subdev,
>> +            struct isp4fw_meta_info *meta)
>> +{
>> +    struct isp4_interface *ispif = &isp_subdev->ispif;
>> +    struct isp4if_img_buf_node *prev = NULL;
>> +    struct device *dev = isp_subdev->dev;
>> +
>> +    if (!meta) {
>> +        dev_err(dev, "fail bad param for preview done\n");
>> +        return prev;
>> +    }
>> +
>> +    if (meta->preview.enabled &&
>> +        (meta->preview.status == BUFFER_STATUS_SKIPPED ||
>> +         meta->preview.status == BUFFER_STATUS_DONE ||
>> +         meta->preview.status == BUFFER_STATUS_DIRTY)) {
>> +        prev = isp4if_dequeue_buffer(ispif);
>> +        if (!prev)
>> +            dev_err(dev, "fail null prev buf\n");
>> +
>> +    } else if (meta->preview.enabled) {
>> +        dev_err(dev, "fail bad preview status %u\n",
>> +            meta->preview.status);
>> +    }
>> +
>> +    return prev;
>> +}
>> +
>> +static void isp4sd_send_meta_info(struct isp4_subdev *isp_subdev,
>> +                  u64 meta_info_mc)
>> +{
>> +    struct isp4_interface *ispif = &isp_subdev->ispif;
>> +    struct isp4fw_cmd_send_buffer buf_type;
>> +    struct device *dev = isp_subdev->dev;
>> +
>> +    if (isp_subdev->sensor_info.status != ISP4SD_START_STATUS_STARTED) {
>> +        dev_warn(dev, "not working status %i, meta_info 0x%llx\n",
>> +             isp_subdev->sensor_info.status, meta_info_mc);
>> +        return;
>> +    }
>> +
>> +    if (meta_info_mc) {
>> +        memset(&buf_type, 0, sizeof(buf_type));
>> +        buf_type.buffer_type = BUFFER_TYPE_META_INFO;
>> +        buf_type.buffer.buf_tags = 0;
>> +        buf_type.buffer.vmid_space.bit.vmid = 0;
>> +        buf_type.buffer.vmid_space.bit.space = ADDR_SPACE_TYPE_GPU_VA;
>> +        isp4if_split_addr64(meta_info_mc,
>> +                    &buf_type.buffer.buf_base_a_lo,
>> +                    &buf_type.buffer.buf_base_a_hi);
>> +
>> +        buf_type.buffer.buf_size_a = ISP4SD_META_BUF_SIZE;
>> +        if (isp4if_send_command(ispif, CMD_ID_SEND_BUFFER,
>> +                    &buf_type, sizeof(buf_type))) {
>> +            dev_err(dev, "fail send meta_info 0x%llx\n",
>> +                meta_info_mc);
>> +        } else {
>> +            dev_dbg(dev, "resend meta_info 0x%llx\n", meta_info_mc);
>> +        }
>> +    }
>> +}
>> +
>> +static void isp4sd_fw_resp_frame_done(struct isp4_subdev *isp_subdev,
>> +                      enum isp4if_stream_id stream_id,
>> +                      struct isp4fw_resp_param_package *para)
>> +{
>> +    struct isp4if_img_buf_node *prev = NULL;
>> +    struct device *dev = isp_subdev->dev;
>> +    struct isp4fw_meta_info *meta;
>> +    u64 mc = 0;
>> +
>> +    mc = isp4if_join_addr64(para->package_addr_lo, para- 
>> >package_addr_hi);
>> +    meta = isp4sd_get_meta_by_mc(isp_subdev, mc);
>> +    if (mc == 0 || !meta) {
>> +        dev_err(dev, "fail to get meta from mc %llx\n", mc);
>> +        return;
>> +    }
>> +
>> +    dev_dbg(dev, "ts:%llu,streamId:%d,poc:%u,preview_en:%u,(%i)\n",
>> +        ktime_get_ns(), stream_id, meta->poc,
>> +        meta->preview.enabled,
>> +        meta->preview.status);
>> +
>> +    prev = isp4sd_preview_done(isp_subdev, meta);
>> +
>> +    isp4if_dealloc_buffer_node(prev);
>> +
>> +    if (isp_subdev->sensor_info.status == ISP4SD_START_STATUS_STARTED)
>> +        isp4sd_send_meta_info(isp_subdev, mc);
>> +
>> +    dev_dbg(dev, "stream_id:%d, status:%d\n", stream_id,
>> +        isp_subdev->sensor_info.status);
>> +}
>> +
>> +static void isp4sd_fw_resp_func(struct isp4_subdev *isp_subdev,
>> +                enum isp4if_stream_id stream_id)
>> +{
>> +    struct isp4_interface *ispif = &isp_subdev->ispif;
>> +    struct device *dev = isp_subdev->dev;
>> +    struct isp4fw_resp resp;
>> +
>> +    if (ispif->status < ISP4IF_STATUS_FW_RUNNING)
>> +        return;
>> +
>> +    while (true) {
>> +        s32 ret;
>> +
>> +        ret = isp4if_f2h_resp(ispif, stream_id, &resp);
>> +        if (ret)
>> +            break;
>> +
>> +        switch (resp.resp_id) {
>> +        case RESP_ID_CMD_DONE:
>> +            isp4sd_fw_resp_cmd_done(isp_subdev, stream_id,
>> +                        &resp.param.cmd_done);
>> +            break;
>> +        case RESP_ID_NOTI_FRAME_DONE:
>> +            isp4sd_fw_resp_frame_done(isp_subdev, stream_id,
>> +                          &resp.param.frame_done);
>> +            break;
>> +        default:
>> +            dev_err(dev, "-><- fail respid (0x%x)\n",
>> +                resp.resp_id);
>> +            break;
>> +        }
>> +    }
>> +}
>> +
>> +static s32 isp4sd_fw_resp_thread_wrapper(void *context)
>> +{
>> +    struct isp4_subdev_thread_param *para = context;
>> +    struct isp4sd_thread_handler *thread_ctx;
>> +    enum isp4if_stream_id stream_id;
>> +
>> +    struct isp4_subdev *isp_subdev;
>> +    struct device *dev;
>> +    u64 timeout;
>> +
>> +    if (!para)
>> +        return -EINVAL;
>> +
>> +    isp_subdev = para->isp_subdev;
>> +    dev = isp_subdev->dev;
>> +
>> +    switch (para->idx) {
>> +    case 0:
>> +        stream_id = ISP4IF_STREAM_ID_GLOBAL;
>> +        break;
>> +    case 1:
>> +        stream_id = ISP4IF_STREAM_ID_1;
>> +        break;
>> +    default:
>> +        dev_err(dev, "fail invalid %d\n", para->idx);
>> +        return -EINVAL;
>> +    }
>> +
>> +    thread_ctx = &isp_subdev->fw_resp_thread[para->idx];
>> +
>> +    thread_ctx->wq_cond = 0;
>> +    mutex_init(&thread_ctx->mutex);
>> +    init_waitqueue_head(&thread_ctx->waitq);
>> +    timeout = msecs_to_jiffies(ISP4SD_WAIT_RESP_IRQ_TIMEOUT);
>> +
>> +    dev_dbg(dev, "[%u] started\n", para->idx);
>> +
>> +    while (true) {
>> +        wait_event_interruptible_timeout(thread_ctx->waitq,
>> +                         thread_ctx->wq_cond != 0,
>> +                         timeout);
>> +        thread_ctx->wq_cond = 0;
>> +
>> +        if (kthread_should_stop()) {
>> +            dev_dbg(dev, "[%u] quit\n", para->idx);
>> +            break;
>> +        }
>> +
>> +        mutex_lock(&thread_ctx->mutex);
>> +        isp4sd_fw_resp_func(isp_subdev, stream_id);
>> +        mutex_unlock(&thread_ctx->mutex);
>> +    }
>> +
>> +    mutex_destroy(&thread_ctx->mutex);
>> +
>> +    return 0;
>> +}
>> +
>> +static int isp4sd_start_resp_proc_threads(struct isp4_subdev 
>> *isp_subdev)
>> +{
>> +    struct device *dev = isp_subdev->dev;
>> +    int i;
>> +
>> +    for (i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++) {
>> +        struct isp4sd_thread_handler *thread_ctx =
>> +                &isp_subdev->fw_resp_thread[i];
>> +
>> +        isp_subdev->isp_resp_para[i].idx = i;
>> +        isp_subdev->isp_resp_para[i].isp_subdev = isp_subdev;
>> +
>> +        thread_ctx->thread = kthread_run(isp4sd_fw_resp_thread_wrapper,
>> +                         &isp_subdev->isp_resp_para[i],
>> +                         "amd_isp4_thread");
>> +        if (IS_ERR(thread_ctx->thread)) {
>> +            dev_err(dev, "create thread [%d] fail\n", i);
>> +            return -EINVAL;
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int isp4sd_stop_resp_proc_threads(struct isp4_subdev *isp_subdev)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++) {
>> +        struct isp4sd_thread_handler *thread_ctx =
>> +                &isp_subdev->fw_resp_thread[i];
>> +
>> +        if (thread_ctx->thread) {
>> +            kthread_stop(thread_ctx->thread);
>> +            thread_ctx->thread = NULL;
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static u32 isp4sd_get_started_stream_count(struct isp4_subdev 
>> *isp_subdev)
>> +{
>> +    u32 cnt = 0;
>> +
>> +    if (isp_subdev->sensor_info.status == ISP4SD_START_STATUS_STARTED)
>> +        cnt++;
>> +    return cnt;
>> +}
>> +
>> +static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev)
>> +{
>> +    struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
>> +    unsigned int perf_state = ISP4SD_PERFORMANCE_STATE_LOW;
>> +    struct isp4_interface *ispif = &isp_subdev->ispif;
>> +
>> +    struct device *dev = isp_subdev->dev;
>> +    u32 cnt;
>> +    int ret;
>> +
>> +    mutex_lock(&isp_subdev->ops_mutex);
>> +
>> +    if (sensor_info->status == ISP4SD_START_STATUS_STARTED) {
>> +        dev_err(dev, "fail for stream still running\n");
>> +        mutex_unlock(&isp_subdev->ops_mutex);
>> +        return -EINVAL;
>> +    }
>> +
>> +    sensor_info->status = ISP4SD_START_STATUS_NOT_START;
>> +    cnt = isp4sd_get_started_stream_count(isp_subdev);
>> +    if (cnt > 0) {
>> +        dev_dbg(dev, "no need power off isp_subdev\n");
>> +        mutex_unlock(&isp_subdev->ops_mutex);
>> +        return 0;
>> +    }
>> +
>> +    isp4if_stop(ispif);
>> +
>> +    ret = dev_pm_genpd_set_performance_state(dev, perf_state);
>> +    if (ret)
>> +        dev_err(dev,
>> +            "fail to set isp_subdev performance state %u,ret %d\n",
>> +            perf_state, ret);
>> +    isp4sd_stop_resp_proc_threads(isp_subdev);
>> +    dev_dbg(dev, "isp_subdev stop resp proc streads suc");
>> +    /* hold ccpu reset */
>> +    isp4hw_wreg(isp_subdev->mmio, ISP_SOFT_RESET, 0x0);
>> +    isp4hw_wreg(isp_subdev->mmio, ISP_POWER_STATUS, 0);
>> +    ret = pm_runtime_put_sync(dev);
>> +    if (ret)
>> +        dev_err(dev, "power off isp_subdev fail %d\n", ret);
>> +    else
>> +        dev_dbg(dev, "power off isp_subdev suc\n");
>> +
>> +    ispif->status = ISP4IF_STATUS_PWR_OFF;
>> +    isp4if_clear_cmdq(ispif);
>> +    isp4sd_module_enable(isp_subdev, false);
>> +
>> +    msleep(20);
>> +
>> +    mutex_unlock(&isp_subdev->ops_mutex);
>> +
>> +    return 0;
>> +}
>> +
>> +static int isp4sd_pwron_and_init(struct isp4_subdev *isp_subdev)
>> +{
>> +    struct isp4_interface *ispif = &isp_subdev->ispif;
>> +    struct device *dev = isp_subdev->dev;
>> +    int ret;
>> +
>> +    if (ispif->status == ISP4IF_STATUS_FW_RUNNING) {
>> +        dev_dbg(dev, "camera already opened, do nothing\n");
>> +        return 0;
>> +    }
>> +
>> +    mutex_lock(&isp_subdev->ops_mutex);
>> +
>> +    isp4sd_module_enable(isp_subdev, true);
>> +
>> +    isp_subdev->sensor_info.start_stream_cmd_sent = false;
>> +    isp_subdev->sensor_info.buf_sent_cnt = 0;
>> +
>> +    if (ispif->status < ISP4IF_STATUS_PWR_ON) {
>> +        unsigned int perf_state = ISP4SD_PERFORMANCE_STATE_HIGH;
>> +
>> +        ret = pm_runtime_resume_and_get(dev);
>> +        if (ret) {
>> +            dev_err(dev, "fail to power on isp_subdev ret %d\n",
>> +                ret);
>> +            goto err_unlock_and_close;
>> +        }
>> +
>> +        /* ISPPG ISP Power Status */
>> +        isp4hw_wreg(isp_subdev->mmio, ISP_POWER_STATUS, 0x7FF);
>> +        ret = dev_pm_genpd_set_performance_state(dev, perf_state);
>> +        if (ret) {
>> +            dev_err(dev,
>> +                "fail to set performance state %u, ret %d\n",
>> +                perf_state, ret);
>> +            goto err_unlock_and_close;
>> +        }
>> +
>> +        ispif->status = ISP4IF_STATUS_PWR_ON;
>> +
>> +        if (isp4sd_start_resp_proc_threads(isp_subdev)) {
>> +            dev_err(dev, "isp_start_resp_proc_threads fail");
>> +            goto err_unlock_and_close;
>> +        } else {
>> +            dev_dbg(dev, "create resp threads ok");
>> +        }
>> +    }
>> +
>> +    isp_subdev->sensor_info.start_stream_cmd_sent = false;
>> +    isp_subdev->sensor_info.buf_sent_cnt = 0;
>> +
>> +    ret = isp4if_start(ispif);
>> +    if (ret) {
>> +        dev_err(dev, "fail to start isp_subdev interface\n");
>> +        goto err_unlock_and_close;
>> +    }
>> +
>> +    mutex_unlock(&isp_subdev->ops_mutex);
>> +    return 0;
>> +err_unlock_and_close:
>> +    mutex_unlock(&isp_subdev->ops_mutex);
>> +    isp4sd_pwroff_and_deinit(isp_subdev);
>> +    return -EINVAL;
>> +}
>> +
>> +static int isp4sd_stop_stream(struct isp4_subdev *isp_subdev,
>> +                  struct v4l2_subdev_state *state, u32 pad)
>> +{
>> +    struct isp4sd_output_info *output_info =
>> +            &isp_subdev->sensor_info.output_info;
>> +    struct isp4_interface *ispif = &isp_subdev->ispif;
>> +    struct device *dev = isp_subdev->dev;
>> +    int ret = 0;
>> +
>> +    dev_dbg(dev, "status %i\n", output_info->start_status);
>> +    mutex_lock(&isp_subdev->ops_mutex);
>> +
>> +    if (output_info->start_status == ISP4SD_START_STATUS_STARTED) {
>> +        struct isp4fw_cmd_enable_out_ch cmd_ch_disable;
>> +
>> +        cmd_ch_disable.ch = ISP_PIPE_OUT_CH_PREVIEW;
>> +        cmd_ch_disable.is_enable = false;
>> +        ret = isp4if_send_command_sync(ispif,
>> +                           CMD_ID_ENABLE_OUT_CHAN,
>> +                           &cmd_ch_disable,
>> +                           sizeof(cmd_ch_disable),
>> +                           ISP4SD_FW_CMD_TIMEOUT_IN_MS);
>> +        if (ret)
>> +            dev_err(dev, "fail to disable stream\n");
>> +        else
>> +            dev_dbg(dev, "wait disable stream suc\n");
>> +
>> +        ret = isp4if_send_command_sync(ispif, CMD_ID_STOP_STREAM,
>> +                           NULL,
>> +                           0,
>> +                           ISP4SD_FW_CMD_TIMEOUT_IN_MS);
>> +        if (ret)
>> +            dev_err(dev, "fail to stop steam\n");
>> +        else
>> +            dev_dbg(dev, "wait stop stream suc\n");
>> +    }
>> +
>> +    isp4if_clear_bufq(ispif);
>> +
>> +    output_info->start_status = ISP4SD_START_STATUS_NOT_START;
>> +    isp4sd_reset_stream_info(isp_subdev, state, pad);
>> +
>> +    mutex_unlock(&isp_subdev->ops_mutex);
>> +
>> +    isp4sd_uninit_stream(isp_subdev, state, pad);
>> +
>> +    return ret;
>> +}
>> +
>> +static int isp4sd_start_stream(struct isp4_subdev *isp_subdev,
>> +                   struct v4l2_subdev_state *state, u32 pad)
>> +{
>> +    struct isp4sd_output_info *output_info =
>> +            &isp_subdev->sensor_info.output_info;
>> +    struct isp4_interface *ispif = &isp_subdev->ispif;
>> +    struct device *dev = isp_subdev->dev;
>> +    int ret;
>> +
>> +    mutex_lock(&isp_subdev->ops_mutex);
>> +
>> +    if (ispif->status != ISP4IF_STATUS_FW_RUNNING) {
>> +        mutex_unlock(&isp_subdev->ops_mutex);
>> +        dev_err(dev, "fail, bad fsm %d", ispif->status);
>> +        return -EINVAL;
>> +    }
>> +
>> +    ret = isp4sd_init_stream(isp_subdev);
>> +
>> +    if (ret) {
>> +        dev_err(dev, "fail to init isp_subdev stream\n");
>> +        ret = -EINVAL;
>> +        goto unlock_and_check_ret;
>> +    }
>> +
>> +    if (output_info->start_status == ISP4SD_START_STATUS_STARTED) {
>> +        ret = 0;
>> +        dev_dbg(dev, "stream started, do nothing\n");
>> +        goto unlock_and_check_ret;
>> +    } else if (output_info->start_status ==
>> +           ISP4SD_START_STATUS_START_FAIL) {
>> +        ret = -EINVAL;
>> +        dev_err(dev, "stream  fail to start before\n");
>> +        goto unlock_and_check_ret;
>> +    }
>> +
>> +    if (isp4sd_setup_output(isp_subdev, state, pad)) {
>> +        dev_err(dev, "fail to setup output\n");
>> +        ret = -EINVAL;
>> +    } else {
>> +        ret = 0;
>> +        dev_dbg(dev, "suc to setup out\n");
>> +    }
>> +unlock_and_check_ret:
>> +    mutex_unlock(&isp_subdev->ops_mutex);
>> +    if (ret) {
>> +        isp4sd_stop_stream(isp_subdev, state, pad);
>> +        dev_err(dev, "start stream fail\n");
>> +    } else {
>> +        dev_dbg(dev, "start stream suc\n");
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +static int isp4sd_subdev_pre_streamon(struct v4l2_subdev *sd, u32 flags)
>> +{
>> +    struct isp4_subdev *isp_subdev = to_isp4_subdev(sd);
>> +    u64 phy_bit_rate = isp_subdev->phy_link_freq * isp_subdev- 
>> >phy_num_data_lanes / HZ_PER_MHZ;
>> +    u32 num_data_lanes = isp_subdev->phy_num_data_lanes;
>> +    u32 phy_id = isp_subdev->phy_id;
>> +    int ret;
>> +
>> +    ret = isp4phy_start(isp_subdev->dev,
>> +                isp_subdev->isp_phy_mmio, phy_id,
>> +                phy_bit_rate, num_data_lanes);
>> +    if (ret) {
>> +        dev_err(isp_subdev->dev,
>> +            "fail start phy,lane %d id %u bitrate %llu, %d\n",
>> +            num_data_lanes, phy_id, phy_bit_rate, ret);
>> +        return ret;
>> +    }
>> +
>> +    dev_dbg(isp_subdev->dev, "start phy suc,lane %d id %u bit_rate 
>> %llu\n",
>> +        num_data_lanes, phy_id, phy_bit_rate);
>> +
>> +    return ret;
>> +}
>> +
>> +static int isp4sd_subdev_post_streamoff(struct v4l2_subdev *sd)
>> +{
>> +    struct isp4_subdev *isp_subdev = to_isp4_subdev(sd);
>> +    int ret;
>> +
>> +    dev_dbg(isp_subdev->dev, "stopping phy %u\n", isp_subdev->phy_id);
>> +    ret = isp4phy_stop(isp_subdev->isp_phy_mmio,
>> +               isp_subdev->phy_id);
>> +    if (ret)
>> +        dev_err(isp_subdev->dev, "fail to stop the Phy:%d", ret);
>> +
>> +    return ret;
>> +}
>> +
>> +static int isp4sd_set_power(struct v4l2_subdev *sd, int on)
>> +{
>> +    struct isp4_subdev *ispsd = to_isp4_subdev(sd);
>> +
>> +    if (on)
>> +        return isp4sd_pwron_and_init(ispsd);
>> +    else
>> +        return isp4sd_pwroff_and_deinit(ispsd);
>> +};
>> +
>> +static const struct v4l2_subdev_core_ops isp4sd_core_ops = {
>> +    .s_power = isp4sd_set_power,
>> +};
>> +
>> +static const struct v4l2_subdev_video_ops isp4sd_video_ops = {
>> +    .s_stream = v4l2_subdev_s_stream_helper,
>> +    .pre_streamon = isp4sd_subdev_pre_streamon,
>> +    .post_streamoff = isp4sd_subdev_post_streamoff,
>> +};
>> +
>> +static int isp4sd_set_pad_format(struct v4l2_subdev *sd,
>> +                 struct v4l2_subdev_state *sd_state,
>> +                 struct v4l2_subdev_format *fmt)
>> +{
>> +    struct isp4sd_output_info *steam_info =
>> +        &(to_isp4_subdev(sd)->sensor_info.output_info);
>> +    struct v4l2_mbus_framefmt *format;
>> +
>> +    format = v4l2_subdev_state_get_format(sd_state, fmt->pad);
>> +
>> +    if (!format) {
>> +        dev_err(sd->dev, "fail to get state format\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    *format = fmt->format;
>> +    switch (format->code) {
>> +    case MEDIA_BUS_FMT_YUYV8_1_5X8:
>> +        steam_info->image_size = format->width * format->height * 3 / 2;
>> +        break;
>> +    case MEDIA_BUS_FMT_YUYV8_1X16:
>> +        steam_info->image_size = format->width * format->height * 2;
>> +        break;
>> +    default:
>> +        steam_info->image_size = 0;
>> +        break;
>> +    }
>> +    if (!steam_info->image_size) {
>> +        dev_err(sd->dev,
>> +            "fail set pad format,code 0x%x,width %u, height %u\n",
>> +            format->code, format->width, format->height);
>> +        return -EINVAL;
>> +    }
>> +    dev_dbg(sd->dev,
>> +        "set pad format suc, code:%x w:%u h:%u size:%u\n", format->code,
>> +        format->width, format->height, steam_info->image_size);
>> +
>> +    return 0;
>> +}
>> +
>> +static int isp4sd_enable_streams(struct v4l2_subdev *sd,
>> +                 struct v4l2_subdev_state *state, u32 pad,
>> +                 u64 streams_mask)
>> +{
>> +    struct isp4_subdev *ispsd = to_isp4_subdev(sd);
>> +
>> +    return isp4sd_start_stream(ispsd, state, pad);
>> +}
>> +
>> +static int isp4sd_disable_streams(struct v4l2_subdev *sd,
>> +                  struct v4l2_subdev_state *state, u32 pad,
>> +                  u64 streams_mask)
>> +{
>> +    struct isp4_subdev *ispsd = to_isp4_subdev(sd);
>> +
>> +    return isp4sd_stop_stream(ispsd, state, pad);
>> +}
>> +
>> +static const struct v4l2_subdev_pad_ops isp4sd_pad_ops = {
>> +    .enum_mbus_code    = isp4sd_enum_mbus_code,
>> +    .get_fmt = v4l2_subdev_get_fmt,
>> +    .set_fmt = isp4sd_set_pad_format,
>> +    .enable_streams = isp4sd_enable_streams,
>> +    .disable_streams = isp4sd_disable_streams,
>> +};
>> +
>> +static const struct v4l2_subdev_ops isp4sd_subdev_ops = {
>> +    .core = &isp4sd_core_ops,
>> +    .video = &isp4sd_video_ops,
>> +    .pad = &isp4sd_pad_ops,
>> +};
>> +
>> +static int isp4sd_sdev_link_validate(struct media_link *link)
>> +{
>> +    return 0;
>> +}
>> +
>> +static const struct media_entity_operations isp4sd_sdev_ent_ops = {
>> +    .link_validate = isp4sd_sdev_link_validate,
>> +};
>> +
>> +int isp4sd_init(struct isp4_subdev *isp_subdev,
>> +        struct v4l2_device *v4l2_dev,
>> +        void *amdgpu_dev)
>> +{
>> +    struct isp4_interface *ispif = &isp_subdev->ispif;
>> +    struct isp4sd_sensor_info *sensor_info;
>> +    struct device *dev = v4l2_dev->dev;
>> +    int ret;
>> +
>> +    isp_subdev->dev = dev;
>> +    isp_subdev->amdgpu_dev = amdgpu_dev;
>> +    v4l2_subdev_init(&isp_subdev->sdev, &isp4sd_subdev_ops);
>> +    isp_subdev->sdev.owner = THIS_MODULE;
>> +    isp_subdev->sdev.dev = dev;
>> +    snprintf(isp_subdev->sdev.name, sizeof(isp_subdev->sdev.name), "%s",
>> +         dev_name(dev));
>> +
>> +    isp_subdev->sdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
>> +    isp_subdev->sdev.entity.name = isp4sd_entity_name;
>> +    isp_subdev->sdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_ISP;
>> +    isp_subdev->sdev.entity.ops = &isp4sd_sdev_ent_ops;
>> +    isp_subdev->sdev_pad[0].flags = MEDIA_PAD_FL_SINK;
>> +    isp_subdev->sdev_pad[1].flags = MEDIA_PAD_FL_SOURCE;
>> +    ret = media_entity_pads_init(&isp_subdev->sdev.entity, 2,
>> +                     isp_subdev->sdev_pad);
>> +    if (ret) {
>> +        dev_err(dev, "fail to init isp4 subdev entity pad %d\n", ret);
>> +        return ret;
>> +    }
>> +    ret = v4l2_subdev_init_finalize(&isp_subdev->sdev);
>> +    if (ret < 0) {
>> +        dev_err(dev, "fail to init finalize isp4 subdev %d\n",
>> +            ret);
>> +        return ret;
>> +    }
>> +    ret = v4l2_device_register_subdev(v4l2_dev, &isp_subdev->sdev);
>> +    if (ret) {
>> +        dev_err(dev, "fail to register isp4 subdev to V4L2 device %d\n",
>> +            ret);
>> +        goto err_media_clean_up;
>> +    }
>> +
>> +    sensor_info = &isp_subdev->sensor_info;
>> +
>> +    isp4if_init(ispif, dev, amdgpu_dev, isp_subdev->mmio);
>> +
>> +    mutex_init(&isp_subdev->ops_mutex);
>> +    sensor_info->start_stream_cmd_sent = false;
>> +    sensor_info->status = ISP4SD_START_STATUS_NOT_START;
>> +
>> +    /* create ISP enable gpio control */
>> +    isp_subdev->enable_gpio = devm_gpiod_get(isp_subdev->dev,
>> +                         "enable_isp",
>> +                         GPIOD_OUT_LOW);
>> +    if (IS_ERR(isp_subdev->enable_gpio)) {
>> +        dev_err(dev, "fail to get gpiod %d\n", ret);
>> +        media_entity_cleanup(&isp_subdev->sdev.entity);
>> +        return PTR_ERR(isp_subdev->enable_gpio);
>> +    }
>> +
>> +    isp_subdev->host2fw_seq_num = 1;
>> +    ispif->status = ISP4IF_STATUS_PWR_OFF;
>> +
>> +    if (ret)
>> +        goto err_media_clean_up;
>> +    return ret;
>> +
>> +err_media_clean_up:
>> +    media_entity_cleanup(&isp_subdev->sdev.entity);
>> +    return ret;
>> +}
>> +
>> +void isp4sd_deinit(struct isp4_subdev *isp_subdev)
>> +{
>> +    struct isp4_interface *ispif = &isp_subdev->ispif;
>> +
>> +    media_entity_cleanup(&isp_subdev->sdev.entity);
>> +    isp4if_deinit(ispif);
>> +    isp4sd_module_enable(isp_subdev, false);
>> +
>> +    ispif->status = ISP4IF_STATUS_PWR_OFF;
>> +}
>> diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.h b/drivers/ 
>> media/platform/amd/isp4/isp4_subdev.h
>> new file mode 100644
>> index 000000000000..bcbb93dce18f
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/isp4/isp4_subdev.h
>> @@ -0,0 +1,145 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +/*
>> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#ifndef _ISP4_CONTEXT_H_
>> +#define _ISP4_CONTEXT_H_
>> +
>> +#include <linux/delay.h>
>> +#include <linux/firmware.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/uaccess.h>
>> +#include <linux/types.h>
>> +#include <linux/debugfs.h>
>> +#include <media/v4l2-device.h>
>> +#include <media/videobuf2-vmalloc.h>
>> +
>> +#include "isp4_fw_cmd_resp.h"
>> +#include "isp4_hw_reg.h"
>> +#include "isp4_interface.h"
>> +
>> +/*
>> + * one is for none sesnor specefic response which is not used now
>> + * another is for sensor specific response
>> + */
>> +#define ISP4SD_MAX_FW_RESP_STREAM_NUM 2
>> +
>> +/*
>> + * cmd used to register frame done callback, parameter is
>> + * struct isp4sd_register_framedone_cb_param *
>> + * when a image buffer is filled by ISP, ISP will call the registered 
>> callback.
>> + * callback func prototype is isp4sd_framedone_cb, cb_ctx can be 
>> anything
>> + * provided by caller which will be provided back as the first 
>> parameter of the
>> + * callback function.
>> + * both cb_func and cb_ctx are provide by caller, set cb_func to NULL to
>> + * unregister the callback
>> + */
>> +
>> +/* used to indicate the ISP status*/
>> +enum isp4sd_status {
>> +    ISP4SD_STATUS_PWR_OFF,
>> +    ISP4SD_STATUS_PWR_ON,
>> +    ISP4SD_STATUS_FW_RUNNING,
>> +    ISP4SD_STATUS_MAX
>> +};
>> +
>> +/*used to indicate the status of sensor, output stream */
>> +enum isp4sd_start_status {
>> +    ISP4SD_START_STATUS_NOT_START,
>> +    ISP4SD_START_STATUS_STARTED,
>> +    ISP4SD_START_STATUS_START_FAIL,
>> +};
>> +
>> +struct isp4sd_img_buf_node {
>> +    struct list_head node;
>> +    struct isp4if_img_buf_info buf_info;
>> +};
>> +
>> +/* this is isp output after processing bayer raw input from sensor */
>> +struct isp4sd_output_info {
>> +    enum isp4sd_start_status start_status;
>> +    u32 image_size;
>> +};
>> +
>> +/* This struct represents the sensor info which is input or source of 
>> ISP,
>> + * meta_info_buf is the buffer store the fw to driver metainfo response
>> + * status is the sensor status
>> + * output_info is the isp output info after ISP processing the sensor 
>> input,
>> + * start_stream_cmd_sent mean if CMD_ID_START_STREAM has sent to fw.
>> + * buf_sent_cnt is buffer count app has sent to receive the images
>> + */
>> +struct isp4sd_sensor_info {
>> +    struct isp4if_gpu_mem_info *
>> +        meta_info_buf[ISP4IF_MAX_STREAM_META_BUF_COUNT];
>> +    struct isp4sd_output_info output_info;
>> +    enum isp4sd_start_status status;
>> +    bool start_stream_cmd_sent;
>> +    u32 buf_sent_cnt;
>> +};
>> +
>> +/*
>> + * Thread created by driver to receive fw response
>> + * thread will be wakeup by fw to driver response interrupt
>> + */
>> +struct isp4sd_thread_handler {
>> +    struct task_struct *thread;
>> +    struct mutex mutex; /* mutex */
>> +    wait_queue_head_t waitq;
>> +    int wq_cond;
>> +};
>> +
>> +struct isp4_subdev_thread_param {
>> +    u32 idx;
>> +    struct isp4_subdev *isp_subdev;
>> +};
>> +
>> +struct isp4_subdev {
>> +    struct v4l2_subdev sdev;
>> +    struct isp4_interface ispif;
>> +
>> +    /*
>> +     * sdev_pad[0] is sink pad connected to sensor
>> +     * sdev_pad[0] is sink pad connected to sensor
>> +     * sdev_pad[1] is sourc pad connected v4l2 video device
>> +     */
>> +    struct media_pad sdev_pad[2];
>> +
>> +    enum isp4sd_status isp_status;
>> +    struct mutex ops_mutex; /* ops_mutex */
>> +
>> +    /* Used to store fw cmds sent to FW whose response driver needs
>> +     * to wait for
>> +     */
>> +    struct isp4sd_thread_handler
>> +        fw_resp_thread[ISP4SD_MAX_FW_RESP_STREAM_NUM];
>> +
>> +    u32 host2fw_seq_num;
>> +
>> +    struct isp4sd_sensor_info sensor_info;
>> +
>> +    /* gpio descriptor */
>> +    struct gpio_desc *enable_gpio;
>> +    struct device *dev;
>> +    void *amdgpu_dev;
>> +    void __iomem *mmio;
>> +    struct isp4_subdev_thread_param
>> +        isp_resp_para[ISP4SD_MAX_FW_RESP_STREAM_NUM];
>> +#ifdef CONFIG_DEBUG_FS
>> +    struct dentry *debugfs_dir;
>> +    bool enable_fw_log;
>> +    char *fw_log_output;
>> +#endif
>> +    u32 phy_num_data_lanes;
>> +    u32 phy_id;
>> +    u64 phy_link_freq;
>> +
>> +    void __iomem *isp_phy_mmio;
>> +};
>> +
>> +int isp4sd_init(struct isp4_subdev *isp_subdev,
>> +        struct v4l2_device *v4l2_dev,
>> +        void *amdgpu_dev);
>> +void isp4sd_deinit(struct isp4_subdev *isp_subdev);
>> +
>> +#endif
> 


