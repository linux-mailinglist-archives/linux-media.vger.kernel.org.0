Return-Path: <linux-media+bounces-38609-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A492B14801
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 08:08:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF5CE7A50C9
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 06:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A51F42571C3;
	Tue, 29 Jul 2025 06:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="twLvNaSu"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2068.outbound.protection.outlook.com [40.107.220.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBEC1A76BB;
	Tue, 29 Jul 2025 06:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753769299; cv=fail; b=EdOsyXr2akR8J61HD02WPD2EjsrR6D+/BPEaidkhgwjLxPc2Vxe3VMFbfBMylqMti+/AB4ojH28NVd4t0iUyYY4DnX4lhApf5JKE7QLxAMFJPafLNnCXzHsnI229s9UrDGXn3mnhjKIZMnRWOVdIY/CIQ14U8c7WkMnq0vqZ5a0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753769299; c=relaxed/simple;
	bh=RdsLJrEZmMqYz+hrjkLmt56KzgFHoYtTxbT7h20oxAA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=b08RR0LH1a/eQevpKa2S2YwchvTtJTjR7TCi18UJuCWtZjDB1xASWOSKIMdHewsK47ng11CkpNuEhaSNdvt34apdGqeMsJDm6o7F/Kj66YRwVWvDMt+vNSvbxro2thErG4XsxczpXBTYCvn9jo+r1r6hp2Y0VDM8IIXTMZXRgPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=twLvNaSu; arc=fail smtp.client-ip=40.107.220.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KSwROaTBKxex+vQATCq+iGZ4l6vCqOCILPGBt7WZZMLO8g7ri5oUdbEJ6l0IpD+969Z4oXhfuPbLq/9BbsjyYf2xVfGSKHsq6tV+6iyl0c/nUJch/8TaxBnxaI0vBkrLt3I7BJFXlF/V1wmnvSFVFR18Miym0fRzCxb4F5UVuCB+aMc7U8kJiT/dHQpdV/+Do3Yytz6g229EU3fjg/aYq0NLgbDTO2j8WSqXBFNKn+FR1C+hMRnvJl173V7qBqI8PdDNOQTzfMJ213iIt6LLpzoEKYjuBmND1tPGgRJNc/1H3velPvwhw+52QHh1iPPUJ1mJu4jMhE1rE+3ukDX3PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VxYTsi2onbCkN26JUrozyjTC1Yhw7piYnCqkYMuQVn0=;
 b=PORdbTKAUXFZDqTBjz/KnCQchgpZumyzmkaze5R4adj3cmEuiW2RyH0kzhrG5FLoL7LHsFMAHGGpphPvQMpQxnt1hyoLT+NozYjA3R5RUhzuGQWs4JiI1i7eF0i7u5v79NXT9Vty0U0dTu2xoPfVhQnSVo0oMkyNIvJThvYoOmD/5I4oXHbDrgl7PnYF70HvEex1+8ZUcqXNs8mQwS66kshzf/vFmNZ5x3MvYAfam6N1B2N5SO2IIXDbdWFOxi11fMt23WPHboEJEWY3l5fyj7nWBlNfcjHz7tDXaAyzcEl74ALxTsl3TfCyr7NJqUgHf/ueP32Xcdp3/9mteYD4IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VxYTsi2onbCkN26JUrozyjTC1Yhw7piYnCqkYMuQVn0=;
 b=twLvNaSuZPzgJGlYIT46aeSxi4AGCRViTGVU1OSUEZE1IGNgLdf7x/A9wSMJE6JVfPpwY8BY6P8S4lqoRNzHfD/OGiOsAUMTj5QE4c0AaCpEOUTjMlGEXutOrGs3lGHKTKwNQhGoDQ1maV5E/f9fnX64H8zQGL++RDCjdy5NkTY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by MN2PR12MB4189.namprd12.prod.outlook.com (2603:10b6:208:1d8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Tue, 29 Jul
 2025 06:08:14 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%3]) with mapi id 15.20.8964.026; Tue, 29 Jul 2025
 06:08:13 +0000
Message-ID: <b5cd1017-56c8-4d09-bc1d-203774827827@amd.com>
Date: Tue, 29 Jul 2025 14:08:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] media: platform: amd: isp4 video node and buffers
 handling added
To: Sultan Alsawaf <sultan@kerneltoast.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 bin.du@amd.com
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-7-Bin.Du@amd.com> <aIEiJL83pOYO8lUJ@sultan-box>
 <ff2f17c6-c5e4-4b7b-b897-8abb4cb79c35@amd.com> <aIVLlZvTQFoBL70r@sultan-box>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aIVLlZvTQFoBL70r@sultan-box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:3:17::30) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|MN2PR12MB4189:EE_
X-MS-Office365-Filtering-Correlation-Id: 563fa2dd-ec1b-4d1d-ee0e-08ddce664d36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SUV0LzgvOUtiZXNMTTgxLzlvMTdreko1LzRqL1R4ektFZDBQa1FTM2NSZWhZ?=
 =?utf-8?B?bm9uV0tLeHlJczhWZEFIb0FFVFhWcTdSenhZQjRUSk5INnZZR3ZFM2xXUXov?=
 =?utf-8?B?L1ZJcVBqdGhDbWlDaytlVkNUaWdvTXR5VURIVXpFcjgrVmVES08xdUVwbzhr?=
 =?utf-8?B?THhvaXN0enIxKzFYRVhwVGhRWGxScW1pSTEwczRzZklCUmcxL2Ryb2xXOGEz?=
 =?utf-8?B?VHlBc0ttUkdoZzBkNjRPd2t1YTRMWkJkeWNOTWQ0R1hwdk5DQmdJQ3J1a3l6?=
 =?utf-8?B?ajYxenZvRC82cFpkQ2dTUVhzanlPRHlUWTdEcXZsSjB3UEpFaHVoUmMyekR6?=
 =?utf-8?B?Z3A3ZTN4d28vNElOaUJQelV1SlV4OGUvMjBLMmI1QmlLdXNWR1N5L3RIb085?=
 =?utf-8?B?bUdHMkYyaVRCVGttZzhvU0FzSDZYOHE4bVpVbnE1UFdTMzRrNE9INmhjU05T?=
 =?utf-8?B?NnlvbzRmYXJuTTQwSy9ySTZrb2t3dms1NHFsNEEreVpvMnlCM2NBMElZYkFO?=
 =?utf-8?B?RHY5bTBZd3lEb2ZsSWIvcFgzMG95UDZjWFdCNHY0cFFRdnBOZVY3SEJ1dEpk?=
 =?utf-8?B?dzlTYndENm8vczJzMndsT0w2L2RGR2t1NXdRWWQyU2lIQVdrM0lkL21VSHNU?=
 =?utf-8?B?RzRWR3NVeFR4V1pYcVVxTzZBOXNZaCtTV3NWMzk5S1R1RDZHNG5xaWlYdkhH?=
 =?utf-8?B?RU9Ga21ockp0K0dFV0txeldLK1hiRkNhNG9hcTc0TlJJWXdkRWR6bFVTa1NW?=
 =?utf-8?B?OGdQcW9ub2xxSDdsQUQ1ZVpkQUlnMmxXRXdZQ2V4NDBqRFdWYlgvOVV6V2pR?=
 =?utf-8?B?ODl5cENBODlYN0daMFFUQ3ZsZCsxK1J5WWdIVHVqSmhmai8xc25kVjNkOVFO?=
 =?utf-8?B?TmkzaUR5SFN0OUNKaHZ3ejg2R0I2aFI2dXNRbHdNTVZ6c01HZy8yemVkeTJF?=
 =?utf-8?B?U3JEaTdYV1A2ditheVJOb2hjaTBuaGoxZHZsVWgrTmpQWjVIcm5KMXhBNVhp?=
 =?utf-8?B?T2JNQXBUVXdlaUFTWjJjeXpFTjVZM2tJRm1DT0JBYXJaWUg0MDBGUzR0SElC?=
 =?utf-8?B?NEVwKzRCY3B5dTZjUVk4bENIN0RCWHdab2xZL0JMU2JndktVSWtlbDVheVdL?=
 =?utf-8?B?djN2bTh2OWVMNW5paStUNUNRbkQ3OXJPUjNBVUdyYTkxVGR6dXBTZXZsR0NT?=
 =?utf-8?B?TUpNU3JVY2hnY2l2ckNLUDcxZXFjaWFhdEF4cE9EWC9VdGdoekw2cndqZkt1?=
 =?utf-8?B?VEF3M2pmNjVOVENLNkU5NytMOTU5ZG40aWVza1hvSXBqa3pWYWRvRlNQd3Fo?=
 =?utf-8?B?SDJzcGZJZWpsS28xUkZyTm9TeUlKSHFHRSt3bHVCNGVMNnlNRi9FNCtvT3Uy?=
 =?utf-8?B?ajY1dlYwOFFER1dwemZUb1RVN1JqY1pSekd0cUg3cHMvT0tsZ05hOUlVRDdk?=
 =?utf-8?B?RGhrWGRvYlNyYkJLcFdLVTF0QW9rWVYvYUpuODFiNVNZY2lMR3QyZlhtaktG?=
 =?utf-8?B?MzRPT1lDY1dUTVUyQkFFeXJQbG5Vd3VTK1Mxdm1OczhMa2NUdkR6aVpwZjla?=
 =?utf-8?B?YUptTDBRVmhibnRlYnFQM1R0TjkyUDdOM3M4L1lOblFLQjZzV1ZWQWlISGc3?=
 =?utf-8?B?MXAxVkk0dHhjb1lmTndKdE10RmE1cHl6QXQyRjlvS0F3QmkrVzFabEUyWHlJ?=
 =?utf-8?B?K1dvOE1lSW12R1VZbDc4bEd5cGw3Zld4N2ZGWld1MXlCbFBCeEVqZnJPTWMw?=
 =?utf-8?B?VVBTeHF3TndyRHJ6T0U5SmV0QkprbkkrRFFhaHJ5S0NteGNlajFDSElibHVv?=
 =?utf-8?B?L3FMZDV4djEwQWJrSnR3TlNjSWNtdk00SThEOElHSjMvWU9iQloxUytiSW0y?=
 =?utf-8?B?cTUxNGpCU0N6bFN4T1pwSGNwUHVTZVNaTzBOYlBWL1ovNFE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGlxekpraFVaNkhtcEhmMzJQNG4zZ0hlOG1XNWlpeE4yVVBiWmhZNU9iTkdX?=
 =?utf-8?B?OG11NGNNbHJSTlh3dHBlMHpJQlh5RzZTbksvNGdaM21wcjQ0Uy9CNkhWdGdr?=
 =?utf-8?B?dk1aaEJNRzNReDg0STQvd0ZSZW0rMGYwS3RjRFZhQmdSYk95VFg0aFBveEl1?=
 =?utf-8?B?bmpNdlkranU0czUwbmpWVm04dGZmOTkrZzdyS0lCd2szY1BKbW5zM3M2Mitx?=
 =?utf-8?B?TjZLWlUrbFB1aFJIYTRzWTBkQll3WjNNZFNwbSszbDJ4dEx5YTZsS0x0QUtZ?=
 =?utf-8?B?bHBLbEFJSXdTOXZuSmhOUVBvNDZZQlBQWGhXVll4emxtdFhkUHJCc1NEY0tF?=
 =?utf-8?B?VGt0N2VuTE90MnBjNG0vVlNqajJRYlh0K1JxK2Nkc2NFbEJKNHhlakpyZEow?=
 =?utf-8?B?c0U4R1Z2cmpTYUFObCs4UDFMMzVGS2NqbXFQL2JTMEp2R3A5eTQwTVlkNjFX?=
 =?utf-8?B?dkN5Nk1KNC83Sm9TVWNaODN2VGVnUnpFdHJOS1hpVWx3aytSYWxLdGxYdW4y?=
 =?utf-8?B?TE9ZeWV5NjUySVFJKzJVSkNldkFMZzVOQjdQNVBUdm5hcUp1QVcwMlJCWDJV?=
 =?utf-8?B?TWxaSnR4Zmo2SDl3MXY1WUFQc3UvVXMzb29mb0QwRTB1RE5za09sQkplSGNM?=
 =?utf-8?B?QVF5OE9qZitsWStaemg4VHhPRElKcHVDQWxxdTR1OUhkbVBwdStTK2hXMUha?=
 =?utf-8?B?NzZkSk9tVUN0RGxTOTJsa3h5ZU5lMjdhVlhJaHp0Z1J3RGhxOWNGSmdJRUNy?=
 =?utf-8?B?Si8wRk51VFJOSWt1WDhnUWNubUhwcGc2cnJ2dk9pS0ZSb1A3NHo2MWJwQTly?=
 =?utf-8?B?YVJlWStWMGsxNlpHalJWRTAydDhqb3RJMEZ6ZmIxVFlwTVNuUDM3U1NoeWNQ?=
 =?utf-8?B?Q01sd1M2bVNYejRSMUhBeDE2MXZtUitXU1ZYT2Vnb1JOZDVIVnZWaVlmZ09t?=
 =?utf-8?B?YmF1WWZQeitXZ09WVFdXNnRXMEgwbXl2bGpsR0NZYmpBTnJVWkVPOGJUOVhI?=
 =?utf-8?B?dThaK2E4eFhDM1pFaWY2YnJFQk5NaXpuRTJxZHFxUktCUHVnd0dZc3l3elZq?=
 =?utf-8?B?VENsbFVsQi9FckJvTEttWTlCOG9KeXp5d2x2L0hqay9kWi9sOWpGZ2lmU25Z?=
 =?utf-8?B?RnBnUG96c1JIa1RpNUhKcHRoM01DU0NzL25wazJhZm5WQTFYZjRSVVhBZ0Y0?=
 =?utf-8?B?RkF3U3Z4MS8vUmZjRkhHNysvR3V2TGNVQjE1K0l2NC9XclE4cENXVnA3am5J?=
 =?utf-8?B?aW1ESU01aURlb3N0eFgzMWVyY2pKSTJja2oxV2RPbjN0cnNnTUNKQWlONlFq?=
 =?utf-8?B?OE5DSlFyWWVrcXRrc1VObEdVclY5bXR0TzYrbkEwZTdaV2x5Wlo3cTNnWXE0?=
 =?utf-8?B?RG9hSEtWYXpEQlZ5VHltMUlPczlBWVNCT05yeTJsTEwwcjhJMWY5b1ZISEZo?=
 =?utf-8?B?Q3MwY3dlRnJDWnVEcHdFTy9CZkJUbittTnQ1WjFBTytwSnNxVDZIUjZqWmlL?=
 =?utf-8?B?RjNtKzEzZmNTV2RJSTdhUm84M0NoY3NOTVBCb0Z4MFo4V0VLT2xGd2g1SzlD?=
 =?utf-8?B?bm4vY1hqZTJ5Z202MGdZSDJjYVNCbEFOd2llNkNHQ2c4MXowZTBKOTFjQzRy?=
 =?utf-8?B?QndFaU5vb3hWWlNGV210YS9GMURZY2tRdC9BOVliSWhKSWtvL2lXK3kxOGNh?=
 =?utf-8?B?bnpvK3VDUHMzcFNkVGY0Q3Q3MUFRMURNQ0RQdmlSNEtFRzZUSk41QlU4RG96?=
 =?utf-8?B?UHhHSEtNVEhtZklkZHlmR3hZZU4wTlJSdlE1Q096NGhJYlNXWjhKY3MzNGNQ?=
 =?utf-8?B?SnA1ZjZveXo3REJuVjhmNURXUDdKVWJtQnplMTRhRVFtdXpQQ0pQWWNFY2tH?=
 =?utf-8?B?dHprVHptWFE2RU85VkhXbmdoQkRCWmFURGJ5ZndWQVB0QUhPUldjclJuNVpl?=
 =?utf-8?B?eFFzRVNBczM2ZHRCd2pleEx5YklEMHlkMG01S0JGMnNlbythUEdWM0V6ckxT?=
 =?utf-8?B?cklSMzFOSFR4YmxCNndQeCtJMzVGSEF3SzhpN0RTb0dsRUl5S0FBbGh1VFlv?=
 =?utf-8?B?NERieVdHZ3Y0V1VoTldDVWNXemNLWTlaRGkwZzE1Mk5nSGFISlNYR1dVaFBu?=
 =?utf-8?Q?0xXc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 563fa2dd-ec1b-4d1d-ee0e-08ddce664d36
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 06:08:13.7716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EW+7Cs870tHxtLczI9Lxz1obMyr1wC0VOfV3nHxHX4oZWqY3gU6tet/2hxdDmGzf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4189

Many thanks Sultan, will try your modifications in this and other mails 
together and let you know the result

On 7/27/2025 5:41 AM, Sultan Alsawaf wrote:
> On Fri, Jul 25, 2025 at 05:22:41PM +0800, Du, Bin wrote:
>>>> +static struct dma_buf *isp4vid_vb2_get_dmabuf(struct vb2_buffer *vb,
>>>> +					      void *buf_priv,
>>>> +					      unsigned long flags)
>>>> +{
>>>> +	struct isp4vid_vb2_buf *buf = buf_priv;
>>>> +	struct dma_buf *dbuf;
>>>> +
>>>> +	if (buf->dbuf) {
>>>> +		dev_dbg(buf->dev,
>>>> +			"dbuf already created, reuse implicit dbuf\n");
>>>> +		dbuf = buf->dbuf;
>>>
>>> The dmabuf is reused here without taking a reference to it. When the get_dmabuf
>>> memop is called by vb2_core_expbuf(), it assumes that a reference to the dmabuf
>>> is acquired. So you need to add `get_dma_buf(dbuf)` here.
>> After test, we found we can't add get_dma_buf(dbuf) here because it will
>> make cheese APP fail to open camera with following error:
>> amdgpu: [drm] *ERROR* failed to alloc gart kernel buffer (-28)
> 
> I see, it's because buf->is_expbuf is set to true even for the implicit dbuf, so
> the initial reference on the implicit dbuf is never put, causing a leak.
> 
> Also, the refcount increment in isp4vid_vb2_get_dmabuf() is done every time even
> when reusing the existing dbuf, but releasing the dbuf will only do a single
> refcount decrement. This also causes a leak.
> 
> And, isp4vid_get_dmabuf() may fail but isp4vid_vb2_get_dmabuf() doesn't check
> the return value, so there may be another leak when isp4vid_get_dmabuf() fails
> because of the refcount increment. The refcount increment and setting of
> buf->is_expbuf to true should only be done on success.
> 
> I have fixed all of these isp4vid_vb2_get_dmabuf() issues in the following diff,
> please try it:
> 
> --- a/drivers/media/platform/amd/isp4/isp4_video.c
> +++ b/drivers/media/platform/amd/isp4/isp4_video.c
> @@ -476,18 +476,22 @@ static struct dma_buf *isp4vid_vb2_get_dmabuf(struct vb2_buffer *vb,
>   					      unsigned long flags)
>   {
>   	struct isp4vid_vb2_buf *buf = buf_priv;
> -	struct dma_buf *dbuf;
> +	struct dma_buf *dbuf = buf->dbuf;
>   
> -	if (buf->dbuf) {
> +	if (dbuf) {
>   		dev_dbg(buf->dev,
> -			"dbuf already created, reuse implicit dbuf\n");
> -		dbuf = buf->dbuf;
> +			"dbuf already created, reuse %s dbuf\n",
> +			buf->is_expbuf ? "exported" : "implicit");
> +		get_dma_buf(dbuf);
>   	} else {
>   		dbuf = isp4vid_get_dmabuf(vb, buf_priv, flags);
> +		if (!dbuf)
> +			return NULL;
> +
>   		dev_dbg(buf->dev, "created new dbuf\n");
> +		buf->is_expbuf = true;
> +		refcount_inc(&buf->refcount);
>   	}
> -	buf->is_expbuf = true;
> -	refcount_inc(&buf->refcount);
>   
>   	dev_dbg(buf->dev, "buf exported, refcount %d\n",
>   		buf->refcount.refs.counter);
> --
> 
>>>> +		dev_warn(buf->dev, "ignore buffer free, refcount %u > 0",
>>>> +			 refcount_read(&buf->refcount));
>>>
>>> This refcount_read() is a possible use-after-free because `buf` is accessed
>>> after isp4vid_vb2_put() puts its reference to `buf`. So something else could put
>>> the last reference to `buf` and free it after this refcount dec but before the
>>> refcount_read(). Maybe just remove this dev_warn() entirely?
>>>
>> The warning is important to debug mem related issue, plan to keep it but
>> without accessing buf or buf->refcount here. Do you think it acceptible?
> 
> Yes, that sounds good. So something like this:
> `dev_warn(buf->dev, "ignore buffer free, refcount > 0");`
> 
> Sultan


