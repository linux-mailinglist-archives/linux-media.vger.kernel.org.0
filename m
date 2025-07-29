Return-Path: <linux-media+bounces-38606-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DCAB146E7
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 05:32:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEE2E4E09F9
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 03:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34E7D2163B2;
	Tue, 29 Jul 2025 03:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="33PyYzSS"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2084.outbound.protection.outlook.com [40.107.102.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD97EDDAD;
	Tue, 29 Jul 2025 03:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753759957; cv=fail; b=XkIN8v482c3B5HTuzACk15waEP9du34CYpWQW00lfUzbOHV0ShFIxlaxbNSBrZi943cA9umFlwwglxx/nROZDXRPW11kEsZvU7R4JZ047Vx/bAr0evjC9WHZtwMy4rF2uoY0obZVNofq+q82vFhxfpsyE1pBp+WqL8IrfBtQD6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753759957; c=relaxed/simple;
	bh=bf1Txt4gfOeTZp9PLbDOW1MpM+prKT0fhqA9Mn/DI1U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PHldyZZXyTiGdzXcp7HSi2S4YhNprf5101F9gclKY3b5Y1USwEPUxbbjg3vKBDaiCD+aIXqMORFtshobix5ZldUvJ9bPbsIhE1qgudQ1cvbUPvp4eCQpmveqE2lW61OQP/mq+5DDxddY+EezCWcy6VchWQdZDQpvvgeLp1EH7b0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=33PyYzSS; arc=fail smtp.client-ip=40.107.102.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QTy9UgMmPmy4T81dFlh8ElXWt73IBCMT4zx+bAgzsXR6r7lfwn5KbOzRTrMgu63AtP5M8OShzp2tKvEM7V4cVligryO1UD43Kxk5KiwnVBE5qg3TvRI1VWebRflGW0Yp7ZhfG8SPUslOHYUQKUT++DIZo2IFPgxLTZSApDZwj9OaRc1hbJ/K/icx9FDWLAldTbct2Pe/LTSTw6Ihq8fisNKh/ctSKvSFsK5WQCbq+CN0JFQvG+yIJNPV4w4lBUOjty4p3m+RI3T/bmG6njTlUoDNt3jQ1/3RseaAUvLlBN0Jw78dlO2D2dvP3wX/RUF1CvVJr+u6OFh0YsIGNEZztQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQ9XJenCG+Fl1Qlyzhjny/sjsPqhiMVBNGh5sBpEHl4=;
 b=DkD9ZnuTtZ/ivZc/0Dr6Hleh8j2wBqdwawHmT3DWhZxE3y4e/r2o2q2Ewhju9+VUV7cbq9w8Kk6bn/5mNE13MUM9BMS+O3FgrKY/gmT+/Bt/rcW40uCEGScHatADIsdQk0UyoEzZo8Pitb2VKAj83n/g9+qQZYgX7Vzs8FnnHHbINDxle0Nk+j5u+5U3EClq9ChA4BTfY7YxUYEoF/gWZkSnsmGNG3FcsGjHuA2WEN400HrprL4k8hc0ILBmJoaJ7UI5DruqS6TGAnpSUyC6Vld79z1QXZ9QqxnPpVTtf8BmWl3D6hQf4o/9gobc18gW46EdmWsWGQnqOIrDYkKd9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQ9XJenCG+Fl1Qlyzhjny/sjsPqhiMVBNGh5sBpEHl4=;
 b=33PyYzSS3fd5ldEQOIr3eqKUD77c+39si6lYaCkJT5e43aedOeVK4tx5bemhJt/78CF5heRWjKxeZnDlm7IFm8lsNOnM/jhqfAqne7oExmc9u8tLVXiqTetg9SBGv9ISozyvem/mNiySEGMmkldJSar1OpYnnsxwUkqyQHUUh7s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by DS2PR12MB9661.namprd12.prod.outlook.com (2603:10b6:8:27b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Tue, 29 Jul
 2025 03:32:31 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%3]) with mapi id 15.20.8964.026; Tue, 29 Jul 2025
 03:32:31 +0000
Message-ID: <b02d0749-6ecb-4e69-818a-6268f894464d@amd.com>
Date: Tue, 29 Jul 2025 11:32:23 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] Add AMD ISP4 driver
To: Sultan Alsawaf <sultan@kerneltoast.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 bin.du@amd.com
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <aIEmJXNpNN0QF233@sultan-box> <12fb4d09-6b94-4f54-86b8-8a3ac0949151@amd.com>
 <aIVXVpg_9XxRXUAH@sultan-box>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aIVXVpg_9XxRXUAH@sultan-box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0204.apcprd06.prod.outlook.com (2603:1096:4:1::36)
 To PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|DS2PR12MB9661:EE_
X-MS-Office365-Filtering-Correlation-Id: e5b214d0-790c-469c-8dbb-08ddce508cc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VnJ5VUxVdzJGU2ttRU9xN0dHQVlRTGdvSHRIT3BlT3g3bk9waS9OdXlSbDlT?=
 =?utf-8?B?c09rb3FVYTFwRVd1MVZiWlNGbGY1aGUzWGNjbkRNZVVSZnp1bGlVY3J2Ymt1?=
 =?utf-8?B?WkdQazYxU2JkdDZzNHVsNFFUTkE2dE0vTXpUNUZoUzZTN2lZSDZ3NWMreHk4?=
 =?utf-8?B?eGwvSUVtRnBzaVFIQ2cwS1BNeHhjY0lTbHNZVzBHOHdiREV1d2NTM0E3Vyty?=
 =?utf-8?B?TFdkZ1h2eHZwbTBEU3dSbFZNQmZkb2FTR2JHekJ0bEpFL1VXK0dNN01oYnlr?=
 =?utf-8?B?eWFTOFcxb1AyYnBaOGZOUFdDNG8xbkxRdmxjRVd6cDJGSFBHQVlyZGNxRld4?=
 =?utf-8?B?ZU0yTnlkWjVZMFZZdWMzZEZwbXQrNEs4SStKVitWYzZXdHQrdnFicWpxc3Ba?=
 =?utf-8?B?c3BPbGFtYlNTbFRnZy9LeWVzZUlSVGExWUNqQmxsenc1NWlBNEpNbTNzelRE?=
 =?utf-8?B?L0w1aXJwM1kxNEJhbVBZNzlpdVNWUHh4SENFenhYQzkxcVdYaG9WaHZBbHlu?=
 =?utf-8?B?a0tGcUNBUWVNRFgvS2lMRjh5aExlZmtrdzdTOFR6c1huY0xKZFpDTkhTalpO?=
 =?utf-8?B?R2dNTC9hQzRpam0vaUpPMkdwejRIN3gwYjA3dU9qSnlrT2tNSE9mVmRLT1dN?=
 =?utf-8?B?TEx1WmYxOGd2M3pOL3ZSRWJyRllka2ZDSWgrdGhzdHRsazQvS0dqWERYZm1V?=
 =?utf-8?B?alRMYkNOQis4c3FXMFc1RDJDay9lWUtxT1owVVB3aWFFLzF2eEdoaDJWSXZ4?=
 =?utf-8?B?Rk1SZEtjWEtNa0U3SUJUM2ZXaTY0cnFJNml4dWtpM3VncXREeStpQ3ZKamRj?=
 =?utf-8?B?cUpKbWZjcXg3Yk5vcVhwMTRuVDQxcFRwM2hldjdNMHdBVTVDOFBWdllXYUwx?=
 =?utf-8?B?TnJ1Qmdvc0RtRzIySzlzMit1eVFiRTQ2Tk8vMDIzaHYxaGt6SjJZQlpwbnlJ?=
 =?utf-8?B?ZVhkVlNVZ3FTM25McWpQZjdTYjlNSHFCbWQzWm5pVzJ5N2VwSW5kWjNEZ2pE?=
 =?utf-8?B?YjhLOWZtYm0raHJTWlJUMHJQMWIzdWtwZmZzcC9TQ1hRNTVtYjNMbHE5em9l?=
 =?utf-8?B?RlFocXh0cEtFQnhBMlh1Tlg1dU82K3ZIQXAzRFN4ZTc5S3gvRldTTE84WDFN?=
 =?utf-8?B?UUpIa2dTNzA1a2hHMUJ6dVFCdm5TL09NcDcwSWFONXFNUnNZb0JaY2UvYmVO?=
 =?utf-8?B?NWU0alB5UCtabldhUEdzUVhVMDRUMGdDeDM1eExySk9yNjRvQ0ZDVk1rVDBl?=
 =?utf-8?B?YlptRjd6VDNXTyt4MkZSMUoydlhDNnFTM2lCZllpMm9SR1BRS0JpUzFlZnBD?=
 =?utf-8?B?MnI0ZDBoZXVzQktzTW9MUFRRQnFkSWlpMXBaclJsc1lSUWZadVpnVmNsY05j?=
 =?utf-8?B?WGxCbThLYSt5TDQvcTJNNjkzVklIQldmNVRDWTRBbVA5TytGTnBiSlNpOE5T?=
 =?utf-8?B?S2pGdlRrSElIK0J5cXU5aFV0MTljODAyUmkzZWcxOWxEN1g3NWtZQmx0TTZp?=
 =?utf-8?B?YjJSK2IwdUdvTGlPMkhQUTFmbWpmSkRIR25hcWNiOXhPTUVxcXNLUGdSbW9u?=
 =?utf-8?B?LzRhVFN0bGw5aTRMQWtjTmU0cEtaL0pkYTF0c0oyckVxS2hxL1hNRVM1WC93?=
 =?utf-8?B?cDRNRzB2TllvKzE4SUNsNTcwenEzWGNwdHZOTkd6cUFaeDVieUVVcUJjTW5x?=
 =?utf-8?B?SytHS3QvK1hxWFo5N1dDbkErYUFPamFEbDl5d3hIZWIrN2NXUDB4aW0wZmly?=
 =?utf-8?B?dGxjT0VyZkxJaVgzakE4M2ZRK2dRaTE5U1FyOFB1eis2SHp4clNHaHJIY1RR?=
 =?utf-8?B?UkdwWjNKZXJtc2JvNjN3KzhZUC9HNFNBNUoyZlRIWFo4TURIeUhMZEs1bFB0?=
 =?utf-8?B?Znh6Z0M2bklZRllidFJnZVhtaFVxL0l4ZlQrOWJieE5MNnhIZnM0Z3ZGMUJE?=
 =?utf-8?Q?PXT9H7fLsLQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2drWG80d1BYcU4wQ0F1Q1o4aEVoT3RXQlBEYjdnbmN1eStRdERyVm9Nbytl?=
 =?utf-8?B?VFBpZEFueUsvSWtiT2VJU2VkblNONldBa3dUejVXSklsY1luNUFoZGZIbFN2?=
 =?utf-8?B?R01TMlNkSlNUWFFYYURzRG9LUVRkd3dKQkw5bzhuek9lVVdtaitDZy9wUUV4?=
 =?utf-8?B?RWl4d1NYWUtmSFlEQ25tVkhIRnNQdlZhQWcyQTRoekhIbWlmRU01YzVXYlBu?=
 =?utf-8?B?SjhnZnBOajRrTkZFZGNLTEF4VkRpNnE4b1AxUlRDUGk2bmNwM0tZSWVwYXY5?=
 =?utf-8?B?VFdXYVBmRTc2OXV2ZnZUQkNkYUE2QWFuVGpLRzE0MHFFb3RpdEpIQm1DU2JX?=
 =?utf-8?B?bkpETTZXOVlEK04vV09oY1VWZjdwaHV6MHFQTWtWVVZkWmFhVCtoMUNDTFFW?=
 =?utf-8?B?UHZaS0JjUFhYcCtsQ21KekxqOGNKWUlhOXFudkJ6L08zdnRpNjl3R2Nhb05Z?=
 =?utf-8?B?Tnk1RGxBQ2VoZUdRVXhQKzM3Yk5FSDVVOTBEaThsd2Q4U2xEM1VRRDVHeEhF?=
 =?utf-8?B?eE9JeDI1THU5bkRyYWp5ZSszTE0yYk10WjN1eTZHUS94ZnBUZjJaNzZXdnc3?=
 =?utf-8?B?V1k4dC9JMTVkTnZNSHhEdmtpVmNzSHIxYng3Q2VRU1R2dlNNQkZtOUtGL2p0?=
 =?utf-8?B?eTAvTzl6RzhRWFBhcmpYY2NveFo5dG9MYmF4cTluRTFadzZIM3d5bjBYYlBT?=
 =?utf-8?B?eTZmcTQwaFN0SXlrWUNRMDJSZ0FsMUpJS1ZvQ3NzMFk4bnpLWGh0WXh0d2xw?=
 =?utf-8?B?eHhKbWFLL3VPS2dWS0ptc2RDQkV0bU1iQ3I4NGhlaXY4UWs1MnpFNG5XUnVj?=
 =?utf-8?B?TXVzcWNza1FMZXp2cUdtcWl3NFpkSmx3d2xhOUl2cEdHdkVZSTd4MThkeHdl?=
 =?utf-8?B?blRxVFJaRy9kVVVKL1Irb1BPQTU0VWd1UGgwZlVVaS95WmZiQVlWb1k4QUJB?=
 =?utf-8?B?NXloMHpncFJlSHNUN3d2Q1YxSUxMQnBoU2NGQlA4cnlmVUFuR1NqY0R4WVpH?=
 =?utf-8?B?TXhLc3ptdGJCNXJ3bmdkZk1vZmkxaXdTZnRjcklrUFBoTis5aUhpWWsxamY5?=
 =?utf-8?B?ZWczUVJiY2pTRkxHWkZ0SExRTVRuTVo3elBabkdQbUg1bVZJVytkdlRPYmdM?=
 =?utf-8?B?NDRxZXExbnVhNkpLWmxvL2lBb0J1QzkrRVRiNmdtOXhHQkNLdCtlQVhHY3FY?=
 =?utf-8?B?b3NHMXFTSjFmbHB5Z2MrMWJnbDdLcWpQbWZKenBBdi9FNVRGTVEyOHNxWGtO?=
 =?utf-8?B?TDlPTWdHaGsyWDNlSTJGNng0dFJjamlwbC82cFRBK0V5VFEyRHBEb0lHeHpS?=
 =?utf-8?B?UzB6b0JUK08vUGRWamhBdHgwbnI4OThhRmI0Wk5JZ1liR29MZXNmVVhKY1Vh?=
 =?utf-8?B?YVlpVXdhQ2NOZU5UWVFUcEE3cmt5OS9DSC84aHJBeVl0Qm9RaExpeDhBOU9W?=
 =?utf-8?B?UmVmbVBCcU1HSDQvb1UrZ2R3REZHU3F6VXZ5MmgxdUdQZVB4ZmplZEdXb0pN?=
 =?utf-8?B?c0R6emdPbHZpU3dEOGZWaGUyOU5PU3VQUzhQVWwxd3hCY1MvRlBQWlRNS1Bk?=
 =?utf-8?B?N1RLSVBmb3E3WVVaN2QrbnhJdXpWdW1hcWpoT1RFZU9aZUk2dGNZVk9FRnVC?=
 =?utf-8?B?Q3hMaEJRaTZsWWpRYTE0VWp3QjRLZnQwczhST3kxc296QnVHVHhWdVhOUThC?=
 =?utf-8?B?RzF4emZOemx5N0NlQ0VJT2s5NHgrTkVINS9UeUxxcXB2dVJHL1VCWDM2VVlp?=
 =?utf-8?B?Y1AyaHpRNWFzYlovWnVnQ2hRa0NmZDd4enRMTU1hREN4S2kyRitmY2ZKYy9S?=
 =?utf-8?B?UFpDL2dDdWNqVkZaaHFXdnRXQUg5eG1uVXU5ZTBMUDFzazB0aDNXalp6SE1v?=
 =?utf-8?B?T1QrUmJxWThqYWRZNU1MeUpDV0IwdFVMdnNLcSsvbWtVSytqQ3dnOVFSckh4?=
 =?utf-8?B?WmVqMlhMamRxYS9lMXNsdjZsSXBzdnZUaDBQOWpqVmc5SlpMeUM1NmlHVlQ0?=
 =?utf-8?B?MFBuSS96UDhHaXlDQ3YwanMvOFVKVHJpREpLaHU4K1dLVThSVzlsYkFIWXNV?=
 =?utf-8?B?dExpVStnalFUK3RTNWUxblE4TmFqQkJBWkM0NEVYMTd0ajhKNmlUeDcyZlR0?=
 =?utf-8?Q?ijuw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5b214d0-790c-469c-8dbb-08ddce508cc1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 03:32:31.4468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sIWl3okXBRKCesZ2JtSAxhHs2JQTE80vP7w0LBVSUVLQfPGsfWF5pm872APdAK6A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9661

Thanks Sultan, please see my comments

On 7/27/2025 6:31 AM, Sultan Alsawaf wrote:
> On Fri, Jul 25, 2025 at 06:22:03PM +0800, Du, Bin wrote:
>>> I have the Ryzen AI MAX+ 395 SKU of the HP ZBook Ultra G1a 14.
>>>
>>> I cannot for the life of me get the webcam working under Linux. The webcam works
>>> under Windows so it's not a hardware issue.
>>>
>>> With this patchset and all of the patches you link here applied to 6.15, I get
>>> the following errors:
>>>     [   11.970038] amd_isp_i2c_designware amd_isp_i2c_designware: Unknown Synopsys component type: 0xffffffff
>>>     [   11.973162] amd_isp_i2c_designware amd_isp_i2c_designware: error -19: i2c_dw_probe failed
>>>
>>> With the old ispkernel code from February [1] applied on 6.15, the webcam
>>> indicator LED lights up but there's no image. I see these messages at boot:
>>>     [    9.449005] amd_isp_capture amd_isp_capture.1.auto: amdgpu: AMD ISP v4l2 device registered
>>>     [    9.489005] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: The OV05 sensor device is added to the ISP I2C bus
>>>     [    9.529012] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: timeout while trying to abort current transfer
>>>     [    9.554046] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: timeout in disabling adapter
>>>     [    9.554174] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: timeout while trying to abort current transfer
>>>     [    9.580022] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: timeout in disabling adapter
>>>
>>> And then the kernel crashes due to the same use-after-free issues I pointed out
>>> in my other email [2].
>>>
>>> Any idea what's going on?
>>>
>>> [1] https://github.com/amd/Linux_ISP_Kernel/commit/c6d42584fbd0aa42cc91ecf16dc5c4f3dfea0bb4
>>> [2] https://lore.kernel.org/r/aIEiJL83pOYO8lUJ@sultan-box
>> Hi Sultan,
>>
>> [1] is for kernel 6.8, believe it can't be applied to 6.15. We didn't verify
>> on 6.15 but we are really glad to help, would you please provide some info,
>> 1. Suppose you are using Ubuntu, right? What's the version?
>> 2. 6.15, do you mean https://github.com/torvalds/linux/tree/v6.15 ?
>>
>> After your confirmation, we'll see what we can do to enable your camera
>> quickly and easily
>>
>> Regards,
>> Bin
> 
> Thank you, Bin!
> 
> 1. I'm using Arch Linux with the ISP4-patched libcamera [1].
> 2. Yes, here is my kernel source [2].
> 
> I have some more findings:
> 
> Currently, the first blocking issue is that the I2C adapter fails to initialize.
> This is because the ISP tile isn't powered on.
> 
> I noticed that in the old version of amd_isp_i2c_designware [3], there were
> calls to isp_power_set(), which is available in the old ISP4 sources [4].
> Without isp_power_set(), the I2C adapter always fails to initialize for me.
> 
> How is the ISP tile supposed to get powered on in the current ISP4 code?
> 
You are correct, yes, i believe the I2C adapter failure is caused by ISP 
not being powered up. Currently in latest code, isp_power_set is no 
longer available, instead, we implemented genPD for ISP in amdgpu
https://lore.kernel.org/all/20250618221923.3944751-1-pratap.nirujogi@amd.com/
Both amd_isp_i2c and amd_isp_capture are in the power domain and use the 
standard runtime PM API to do the power control

> Also, I noticed that the driver init ordering matters between all of the drivers
> needed for the ISP4 camera. In particular, amd_isp_i2c_designware and amd_isp4
> must be initialized before amd_capture, otherwise amd_capture will fail to find
> the fwnode properties for the OV05C10 device attached to the I2C bus.
> 
> But there is no driver init ordering enforced, which also caused some issues for
> me until I figured it out. Maybe probe deferral (-EPROBE_DEFER) should be used
> to ensure each driver waits for its dependencies to init first?
> 
amd_isp_capture only has dependency on amd_isp4 which is the ACPI 
platform driver, it is init before amd_isp_catpure.
Do you see in your side the amd_capture probe failure caused by failing 
to read fwnode properties? If that's the case please help to check if 
amd_isp4 is loaded successfully

> [1] https://github.com/amd/Linux_ISP_libcamera/tree/3.0
> [2] https://github.com/kerneltoast/kernel_x86_laptop/tree/v6.15-sultan-isp4
> [3] https://lore.kernel.org/all/20250228164519.3453927-1-pratap.nirujogi@amd.com
> [4] https://github.com/amd/Linux_ISP_Kernel/blob/c6d42584fbd0aa42cc91ecf16dc5c4f3dfea0bb4/drivers/media/platform/amd/isp4/isp_hwa.c#L378-L385
> 
> Sultan


