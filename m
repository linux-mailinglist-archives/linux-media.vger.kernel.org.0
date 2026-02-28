Return-Path: <linux-media+bounces-53829-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id xAOYEsGsomln4wQAu9opvQ
	(envelope-from <linux-media+bounces-53829-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 09:52:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7211C180B
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 09:52:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6EB433048133
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 08:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A02036D50C;
	Sat, 28 Feb 2026 08:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4T3z3gK0"
X-Original-To: linux-media@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010022.outbound.protection.outlook.com [52.101.61.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DFB346AE5;
	Sat, 28 Feb 2026 08:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772268730; cv=fail; b=qx6yQrFsGXEzxVp8caHTHyM0nBgmUCce3ZW13F2hSyq55lUSY8t3L5r0fCsmt9cDjJcv/SqbO15B/K5kE0rjDS8F0VxXZzT8EeDWmeyuvy8RbhUY35Cn/NvTIUMfbiZFz/NLEeaifeVO5UdLwxO6dfgZv3G5ATEkYUmAeELlby4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772268730; c=relaxed/simple;
	bh=qglTPIUR9HadvXSzw8URzACsnZfS1vJ//ZuyBbL3i7Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YH0elHZDQ88UJl/AYAzb9PklyPnsWFbjP0SMeeiSVOKCV7XLkYZKe+7hujnM1CYzVwJNZ4Z5FWV3s2rKgrEf8vyqjBUWM5GqSXG/TMU+s53V+GNV4Zc4unrluH/okCgmQK1E4kKCpf4EjE4HtBy7It08ar4ca/Mm00i4OmcrGAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4T3z3gK0; arc=fail smtp.client-ip=52.101.61.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PscoGeozR9xwn5CkuBZYgqCUcBkkULN/Fwt55A4JHYMULOHCrMbMUqAoyw+ttVnduq5UKcyNIepTEVa4yLfbG8Er6X/GS8yMto/xgHsqvu57LYV5UOxHJ2rVn9XFJq7VrKMVg+aO2+DQdwQ5scF25RAG2WGVv4iCC0TOMiMZJ5Jrwq+Kr35uworNBVctMUXmxfFpEt1KKxBXYrvepMQP9sNTxz9aNf++7j7NfYrOlyZ3PPjnn5o0CfQYYFrMga/ASDRF1Dunkr9VnXdDb5ZlOV4yy1ccnycLuyAEoEs6NbCbebXdITIPERGpsMfcZTV3SEqkPAJ+EM1dGeoy2KzyJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wmsycvD5DTAuz166W5uu4JzkxXKrlc96/YZ1HnoCPDc=;
 b=uROo48u4JxMF5o3TKSyKqGm8ynyYwJlQir3RRAL7HYVkygrc3ztzLdi5ugRorBe6nH+2hRVyxTZ/T89dHiv5JVdKBE3oNH9S0cKGjjxuJ8zq+pZ1Z5f0Z1cklT/YZwdP12ywosCYCDw3BXeXBlk4XPV91x6+88VZ7igrfcQ5T4/SgbQQaN/VpPHNosSPVNCgnbZISkNBysxNVLv9PSeoZgPm7Y/Oz7oE/NKiI+k9ob3LGUuruUvzF16ofriaYl/GWrF/AUBMjjHP5+x5ekgHATX2tPTbAF706nhSh6kLKsM7Ix5/XN4jiJGEJx8gPfof0hqv0IpB+IX7tO5xtvXwQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wmsycvD5DTAuz166W5uu4JzkxXKrlc96/YZ1HnoCPDc=;
 b=4T3z3gK0RQ+RTzYWFrnl/KR6AULhKzJhO2mxGFKvhH0eC4DEF9Qi/Gj9dYueiy2U2T6IPlD1Ws8FDns/Sbz2QTuQXstF3+PHb3Nvo4/u5vzLcM3At3tmKQcBI6YiLnesDtpu6Whp7TUa7cAtA1ZchXAh4YZ8hLw1CXZx+iz3uKA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by MN2PR12MB4047.namprd12.prod.outlook.com (2603:10b6:208:1de::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Sat, 28 Feb
 2026 08:52:04 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32%7]) with mapi id 15.20.9654.015; Sat, 28 Feb 2026
 08:52:04 +0000
Message-ID: <a97eb423-1791-4097-9f7c-cde82a9ea2af@amd.com>
Date: Sat, 28 Feb 2026 16:52:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/7] media: platform: amd: Add isp4 fw and hw interface
To: Hans Anda <hansa@airmail.cc>, mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 sultan@kerneltoast.com
Cc: pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 mario.limonciello@amd.com
References: <20260212083426.216430-1-Bin.Du@amd.com>
 <20260212083426.216430-4-Bin.Du@amd.com>
 <4555b8c8f174b5953d5b24a3a101127f9858d910.camel@airmail.cc>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <4555b8c8f174b5953d5b24a3a101127f9858d910.camel@airmail.cc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KL1PR01CA0101.apcprd01.prod.exchangelabs.com
 (2603:1096:820:3::17) To LV9PR12MB9829.namprd12.prod.outlook.com
 (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|MN2PR12MB4047:EE_
X-MS-Office365-Filtering-Correlation-Id: 364ceb04-c302-4215-be4d-08de76a6a52d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	vxprdFMX6KXEvqG71nffNLz1jx0zvrxQu8MCLe5zE1VXtHnMDxw0G0N9cpV+pJN1X0OSnzP8V3VUbpjSBdtevc7KOvFJ2SbpLAgOzC1qLmozFdv6q3xvnoL8eXWcRbGhJygftHpWFGUeHzWRikw3YI3QFWi/AoUJ73epDAamJDKUiVnYVtrAgOP019CKOShjXxt27nqNhpmQsFmAXMLmFr3feLF9l6N9h5FcVUzwSDVnDKVcYWqiX+OJZ4DJDhQPVWYGJKPGxuRE77+e5te+hpC1+humLysT03iuad2xRrMVayoYVlcxATGfSkF1Z6V0q533bImFIjvIXrt7bRjYCx7XBY9nrKZdbEqex8tHBFK2VOOBvN5UqeNtzPMLrLIMW965RuEmJ0iD2PQjgygRz560KBuzgmqWvI2zkfguaaU7bXtD4FLDXYgderlXddXgAbc9cCcNSe+uEhYya/z0Vx3/IqyrFKaCyNvtEyTfy3z7pcyF/CZKo1bGMfQ3ZCT5JVabUHbAfn/YvbcA8DHLVhfO2vC7yj3QIuf5ilRtmMFV/dAzzXs1eEmveq93o9tyVMA+yfRbFr9/E27utjO+xV4brA/3aCNv6O5tdVzM04cyrZIxRMnbyMLN4b7FLglo1H3SGIojWgdC7DmmkVrkg+Axm0enuUDt212dEVotg3NdkUfBK+4P/2F6AjlitoY1zqxWZ0IrXOKFqGnOd/SroG2QDP7kX2b8UwCO1ZxmcNk0hxsi0bTKM/vLqFYLunHfYNkDu2buV4UIRC80Z3IIwQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmsrYmJyTnFPdnl6SEJpdmRkU1BXY2h4Nnd6Mi9janM0S2U2Qytyek1Hc2M5?=
 =?utf-8?B?YXEwOUpZM1lOWURXYXMvSjJQaDFYUXNjZU43UWlTZlA0cDRZenRoZVRTSlZq?=
 =?utf-8?B?RC9BRFFWbkNoRVZGZnp5MVl0b1N5VCtIZ0YwV05OUkpqYnZlTnQvN3JLeU82?=
 =?utf-8?B?ZFo4NjRxZlRuU1ZiK1dKVkNPS2tnWnMvQjczL0t5S3c2S3I0dTMxYUZ1aFRo?=
 =?utf-8?B?QjVLbnRRSm1FMFJscmtObU5YWGwvRHdnYjUwRXdJTVdJRUFtYUlBNVhYOWp3?=
 =?utf-8?B?bGNzWnMvY2VQVHZIbkM0QTVDcEN4UjJ4YThnQnMxR1h4RjdaVU9Sb1NYQzd0?=
 =?utf-8?B?L292dHRmU3BYTHhQcjRUYUJxM3NaRnl6Ynl6LzFVeVFmVUZTWk92eGg5TWhw?=
 =?utf-8?B?dDhrSG1iMnY3bDJ2MENvTERjeTFwMStQSk1jWCs0WURWM1pEWGsrclgwMTVV?=
 =?utf-8?B?VTVQaytoZG90YlAxa3hLYlJEQUQ3b3VRbThtU0grOHdLYURwYWQ3ZHZxYzhz?=
 =?utf-8?B?b21MellKamJtUzZVeWZSYmpUWkVFaEZINjYxS3BkMHpQUHRmZXZmYVZEM1VC?=
 =?utf-8?B?R2dQaGpTcS9FQjR3NUtPa0laRlV3M0F2ZnF2YXlmWmFnc254d2Y3NkxMRGpY?=
 =?utf-8?B?bjh4Y1FzZEgveWdXR1J4RVJwUGVvYlRLQzZMTmxqbkxUa1hPcGhhbnhELzBD?=
 =?utf-8?B?S2xkMjZTM2FERm52bWdCYWpiTThkRVNVeUNiZmxESnBqN1RKMWs5Q1BhVlhY?=
 =?utf-8?B?Vm1ZY0RJVkFCTDVFbUFKOW9JWjdRRGE0cS9valFsZDVqU0NQSHFMSGNYc0Rp?=
 =?utf-8?B?ZFQyRnRzYWJDazBnbk5NbElleTFyamxFRDVRaWZEYm4zYnJ4WWJuOHdIMGVY?=
 =?utf-8?B?ZzBRWEsvbDJWSEJJYlMxaUNQSVhwT2xCUERPZ2ZrN1FDVWtSM1hFRXl4ZTBy?=
 =?utf-8?B?SUc4NVg5QVdpSllLV0cxSGtESXRjMldueUhKSmtGV1hMMHpNb1hmdFJoRWtS?=
 =?utf-8?B?YjNzYkNOcXNNQm12UGFqWnQ3SHpOQ0g4QTlYbXppQU1WV3lNTzNzYlNTL01W?=
 =?utf-8?B?YXAxSW9WR1M1cCtNeGF3aEF1RHREc2FPUXMydUJMNHBvRGpsR3RwZXp5Nlo0?=
 =?utf-8?B?cXBpRzVDUGdRajU4L3J1eDcrSXhpUzBIUFdvci8rSGp1L21XbmQ4UFBzSDFt?=
 =?utf-8?B?bDcrNzRaeURMU3B6Zi9VQU9JMTRWeTI1bTRzWFUyL1JDMHpWaExTbkhMZkYz?=
 =?utf-8?B?N2M3eERXWGIwMzVwcjBFQm15dHNjU09TNkdSb2ZQUE9MdXVsVTViTlAzeTlW?=
 =?utf-8?B?cU9LSjZzTWpRUERxb2R4cDlPMUFzNUtoOVNuWWs0RGJMRlFrMlZ2VGZVWDdT?=
 =?utf-8?B?MjRKRXZ5RE5WSWtrYlhtNGNRajhLRVJ4NUw5QllYOUltVnh5VnpHOG4wMGJy?=
 =?utf-8?B?Nys5Tm1uN05FVXFVL1ZNRFl6R0hSazQxODYvc0R3MjQyeDBYRDJRdVpvNUVk?=
 =?utf-8?B?VGN5M3MxUDgveWVNbDYxVlU1MTRsd29RbTBTZWF5NjhobzVPQ2xsM1RCZ1Ra?=
 =?utf-8?B?WTNUcGFrNENteFh0YTVJSFRuNmgrQ0xXcG5FZHlEZTQ2aDVROGZzdU5penQ2?=
 =?utf-8?B?TlJtMFVLUzN6NnM1eDhhd25SK3dua3NlbkswNEM4Um9obE9xZUxrbWs4UERV?=
 =?utf-8?B?R0UvM3JtU052VTRTRzFoYUtJQ1RHZkhZNm9NMWtkVlFFUkowblprQmNhSC9C?=
 =?utf-8?B?RDFPTk5nREViaG1JbEIraUcwOWh3bXZMSnZ5VUwwT0FMSGVUSThHOURxVW1C?=
 =?utf-8?B?N3NwZkxXY0JQNUN3Mks4K2l5OEpWNWR2blgrbms0bWhGc2JpMHJIZFdjaTNL?=
 =?utf-8?B?bmxkYTBMM0NzTU16aW10N0FSenVzb2c5QTQzQit0WHBlNkZxMm52S0padzcw?=
 =?utf-8?B?ek5EbUZMdUJLc0tXNm43amVxN2NxeUdOTEpqZzRGbWQ1U0s4T3Bab05qN3VC?=
 =?utf-8?B?bzdJQVU5K1dsUStYNEdKdFI1ZjNLbkpWMllRYW1EKzFta3h6aEJwMHhWeXRR?=
 =?utf-8?B?MERyMWc4RHM1Zk90M3lHMzlwTWgrQlBCZTBYSTFaWFdZS3daQmo5VStIV3Zn?=
 =?utf-8?B?ZllRQ3ZOZmRMMmUwZXJUWkFCcnFSTkIxRTFNdExBRFBHZ1JaWlc1TXZpMmRp?=
 =?utf-8?B?amZwQWlkVitzcitPVlhlVTFBRVZkUWJwc2FWQzhaV3FpMTZjT3pycTJubHdr?=
 =?utf-8?B?Y2MzNzNlZEJTdndsVC9MMFpDMVB4cjFOUVJiL3JoRVNkTWZzMmVoK1dRKzZa?=
 =?utf-8?Q?hKQHXv7QIkEHwCCt8Y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 364ceb04-c302-4215-be4d-08de76a6a52d
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 08:52:04.4358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iZT3EAaeo8i4FNYUkTRgIRkSi7NB8iBB3Rb8biLj6XNsrvXWYjtr86dCg8BgCZPL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4047
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53829-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[airmail.cc,kernel.org,xs4all.nl,ideasonboard.com,linaro.org,linux.intel.com,bp.renesas.com,vger.kernel.org,kerneltoast.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bin.du@amd.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9A7211C180B
X-Rspamd-Action: no action

Thanks, Hans, for your comments.

On 2/24/2026 8:21 PM, Hans Anda wrote:
> Hi Bin,
> 
> I have just read your patch and have a minor issues and a few style suggestions.
> 
>> ISP firmware controls ISP HW pipeline using dedicated embedded processor
>> called ccpu. The communication between ISP FW and driver is using commands
>> and response messages sent through the ring buffer. Command buffers support
>> either global setting that is not specific to the steam and support stream
> 
> One last typo of steam -> stream
> 
> 

Thanks for catching that. Will correct it.

>> +/* [...]
>> + * @brief Host and Firmware command & response channel.
>> + *        Two types of command/response channel.
>> + *          Type Global Command has one command/response channel.
>> + *          Type Stream Command has one command/response channel.
>> + *-----------                                        ------------
>> + *|         |       ---------------------------      |          |
>> + *|         |  ---->|  Global Command         |----> |          |
>> + *|         |       ---------------------------      |          |
>> + *|         |                                        |          |
>> + *|         |                                        |          |
>> + *|         |       ---------------------------      |          |
>> + *|         |  ---->|   Stream Command        |----> |          |
>> + *|         |       ---------------------------      |          |
>> + *|         |                                        |          |
>> + *|         |                                        |          |
>> + *|         |                                        |          |
>> + *|  HOST   |                                        | Firmware |
>> + *|         |                                        |          |
>> + *|         |                                        |          |
>> + *|         |       --------------------------       |          |
>> + *|         |  <----|  Global Response       |<----  |          |
>> + *|         |       --------------------------       |          |
>> + *|         |                                        |          |
>> + *|         |                                        |          |
>> + *|         |       --------------------------       |          |
>> + *|         |  <----|  Stream Response       |<----  |          |
>> + *|         |       --------------------------       |          |
>> + *|         |                                        |          |
>> + *|         |                                        |          |
>> + *-----------                                        ------------
>> + */
> 
> + *        Two types of command/response channel.
> + *          Type Global Command has one command/response channel.
> + *          Type Stream Command has one command/response channel.
> + *-----------                                        ------------
> + *|         |                                        |          |
> + *|         |       ---------------------------      |          |
> + *|         |  ---->|     Global Command      |----> |          |
> + *|         |       ---------------------------      |          |
> + *|         |       ---------------------------      |          |
> + *|         |  <----|     Global Response     |<---- |          |
> + *|         |       ---------------------------      |          |
> + *|         |                                        |          |
> + *|         |                                        |          |
> + *|         |                                        |          |
> + *|  HOST   |                                        | Firmware |
> + *|         |                                        |          |
> + *|         |                                        |          |
> + *|         |       ---------------------------      |          |
> + *|         |  ---->|     Stream Command      |----> |          |
> + *|         |       ---------------------------      |          |
> + *|         |       ---------------------------      |          |
> + *|         |  <----|     Stream Response     |<---- |          |
> + *|         |       ---------------------------      |          |
> + *|         |                                        |          |
> + *|         |                                        |          |
> + *-----------                                        ------------
> + */
> 
> This way the order of the text comment is structured the same as the visual
> comment. i made some adjustments for symmetry.  It's no error, it's a style
> suggestion.	
> 
> 

I think both are acceptable, my original order has been structured in 
accordance with the register definition from an engineering standpoint, 
all command registers first, then followed by all response registers.

>> +/*
>> + * @brief command ID format
>> + *        cmd_id is in the format of following type:
>> + *        type: indicate command type, global/stream commands.
>> + *        group: indicate the command group.
>> + *        id: A unique command identification in one type and group.
>> + *        |<-Bit31 ~ Bit24->|<-Bit23 ~ Bit16->|<-Bit15 ~ Bit0->|
>> + *        |      type       |      group      |       id       |
> 
> + *        id: A unique command identification in one type and group.
> + *        |<-Bit31~24->|<-Bit23~16->|<-  Bit15   ~   Bit0  ->|
> + *        |    type    |   group    |           id           |
> 
> So the width of the parts would co relate to the number of bits (8,8,16).
> Again, a suggestion
> 

Since this is about the bits layout, matching width with bit count isn't 
mandatory.

> + *        id: A unique command identification in one type and group.
> + *        |<-  Bit0   ~   Bit15  ->|<-Bit16~23->|<-Bit24~31->|
> + *        |           id           |   group    |    type    |
> + */
> 
> If there is no technical reason for numbering Right to Left you could flip it.
> Left to Right is simpler to read.
> I guess there is a technical reason for your way.
> 

I believe my original style is more common to describe bits layout, 
e.g., drivers/gpu/drm/imagination/pvr_device.h at line 466
It matches how:
- Humans read: left to right = most significant to least significant
- Hex values are written: 0x02010001, type=0x02, group=0x01, id=0x0001
- Register documentation from hardware vendors is formatted

>> +	/*
>> +	 * A check num for debug usage, host can set the buf_tags
>> +	 * to different number
> 
> +	 * to different numbers
> or
> +	 * to a different number
> 
> Both versions work grammatically.
> 
> 

Yes, will fix it.

>> + [...]
>> +};
>> +
>> +/* FW cmd ring buffer configuration */
> 
>> + [...]
>> +};
>> +
>> +/* FW resp ring buffer configuration */
>> +static struct isp4if_rb_config isp4if_resp_rb_config[ISP4IF_STREAM_ID_MAX] = {
>>   [...]
>> +/* FW log ring buffer configuration */
>> +static struct isp4if_rb_config isp4if_log_rb_config = {
>> +	.name = "LOG_RB",
>>
>> +
>> +	rd_ptr = isp4hw_rreg(ispif->mmio, rreg);
>> +	wr_ptr = isp4hw_rreg(ispif->mmio, wreg);
>> +
>> +	/* Read and write pointers are equal, indicating the ringbuf is empty
>> */
> 
>>   [...]
>> +	/*
>> +	 * Ignore one byte from the bytes free to prevent rd_ptr from equaling
>> +	 * wr_ptr when the ringbuf is full, because rd_ptr == wr_ptr is
>> +	 * supposed to indicate that the ringbuf is empty.
> 
> ringbuf -> ringbuffer or ring buffer, it's best to stick to one.
> just in case someone greps for. That is a suggestion as well.
> 

Yes, will change it to ring buffer.

> Good Work.
> I'm just getting to know c - That's why I only found grammar/ style issues.
> But maybe this way i will get into programming
> 

Welcome to this field.

> Greeting Hans

-- 
Regards,
Bin


