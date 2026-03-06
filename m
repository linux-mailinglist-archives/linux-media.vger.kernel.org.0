Return-Path: <linux-media+bounces-54688-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CB7ZAOlQqmlNPQEAu9opvQ
	(envelope-from <linux-media+bounces-54688-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 04:58:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC5221B55F
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 04:58:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A927F3024A63
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 03:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B59F836C9C7;
	Fri,  6 Mar 2026 03:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qbZm+rwl"
X-Original-To: linux-media@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010041.outbound.protection.outlook.com [52.101.193.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C885B7262A;
	Fri,  6 Mar 2026 03:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772769503; cv=fail; b=kiU6/r0OST4+iYsOGqzkvnjPCEaucRvZJ2qbDWAl83XPWwLsre/pG8RduHOH7qV7OmUJadfBo9lTBQGLOFWi5QP2Yj/GhYV8WD2oMKHECUChPue8AkluK0UQIVUELUSA3O5SXTYTtVezWge/L2fyGlOKDqM/35AY5TZjzoFPvKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772769503; c=relaxed/simple;
	bh=vF2WFM/+eWIbi2WKTHRb9qzrHoArY806X8LnHJgVFlU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=k/WIPQjxAFnBcnHY8iNLntpOSJJwrwnQnGNLe6EMt4OcjduJ7hJuByWdnIM/I2ARWp5C5Og5p8suJhc05h0oRJg79t0AtCcJRDNnOCDqEawJVAZ16YwzjCVEp7wKFTB5fr+BdOqpekOuWUGHoCYRs29FTOjHpfWl0Qr5nuflHdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qbZm+rwl; arc=fail smtp.client-ip=52.101.193.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OvSX/1J1rphiiKgiTe/eEzj7x4shYiE1YT580rnhLVXTPANhluN7xmXEoFLvQEkz1h+VgFbyYwSz+orQ4cPOiy1cgY7PS/WT6XlQ6QSBMDP01RvRa5OEjuVfEByVBkNY9QIVuB9b6xOXOCMVHDA3w4bIUEsD/Ls9U6e4C1CD5MgOuAT4oTQjZJ1iUeUrJY1L6KFCuyhy0Jpg5zatblMbIZ4pJFmSeFNhBE6cVzFHqDGftMYHHRNimOgy8vongy9aMDb8ShOe5QRUGM6xHNOBTkR7JrEUbL4eocmpkkhh3oCUATK9v7bKNeYVvcDqN9g0RByrtVK4PUWCrujjEWPNPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2pXChl13265Uta87Cc/Ew1+dXImAZBT+PyvJauzOfQ=;
 b=D0wVuXphVXDja5J7KhCxsntHc9z1bELQ16BGhveix3CqYioaU1f5TqnKm54deK4yxr3NvQRTJedroOgny3xv9wh9bXUA34heMw8ViO4EtuuaYYQTWlNyAdB5JdR/I0XquHlLP27x8+VGsfpVkswrJkuvDs/KCrATAkjYHv7Fv+SfIjSxFXQC1bDXW3w4eNzQRce9+BvTisnmX/Ah5pa9OY4O2BzgrmbVNHLuNRJjCwQ0EFpzfbN17uQedMwQkGuqOsRcL4eoIG4VuMA9mh5APSErBnxf7GoIj/X/DxDeE9dmdqnGFpem2vvwmBN0ThkFdcMmuCz1PiQ9OzFn4eI2hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2pXChl13265Uta87Cc/Ew1+dXImAZBT+PyvJauzOfQ=;
 b=qbZm+rwlNOzd24kKIc20/IQmSUFtkv/Ukvf7ludr35s5w32/+HFb+K8u/glz4cevYI/6dSWZbEgkFBqZKmo99Ax0GmHnpYhHxC2iBjg3RuBjaehcz7oV4MvCBOyEg8NkV7k1ViVRgkVc47bk3mbF9hzAtsbnbRPizLhiJAIOfkk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB9501.namprd12.prod.outlook.com (2603:10b6:8:250::17)
 by CH1PPF0316D269B.namprd12.prod.outlook.com (2603:10b6:61f:fc00::604) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Fri, 6 Mar
 2026 03:58:16 +0000
Received: from DS7PR12MB9501.namprd12.prod.outlook.com
 ([fe80::4564:457c:524b:6b96]) by DS7PR12MB9501.namprd12.prod.outlook.com
 ([fe80::4564:457c:524b:6b96%4]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 03:58:16 +0000
Message-ID: <1ebc8e29-fa43-4265-80a2-a41e3276f904@amd.com>
Date: Thu, 5 Mar 2026 22:58:13 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: amd: isp4: add system suspend/resume support
Content-Language: en-GB
To: =?UTF-8?Q?Kinn_Juli=C3=A3o?= <kinncj@gmail.com>
Cc: pratap.nirujogi@amd.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bin.Du@amd.com, mario.limonciello@amd.com,
 sultan@kerneltoast.com, benjamin.chan@amd.com, king.li@amd.com
References: <bb892e59-8fc9-4d1b-94aa-996a66392405@amd.com>
 <20260304002811.95497-1-kinncj@gmail.com>
 <bb32d3a9-51c1-4c56-9452-753c993c5316@amd.com>
 <CAF+u_BwY9CSbM2r9Yirzaj4GwwdJOzsEBxHPXfmYHzav9K9Cag@mail.gmail.com>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <CAF+u_BwY9CSbM2r9Yirzaj4GwwdJOzsEBxHPXfmYHzav9K9Cag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY3P220CA0006.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:fb::8) To DS7PR12MB9501.namprd12.prod.outlook.com
 (2603:10b6:8:250::17)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9501:EE_|CH1PPF0316D269B:EE_
X-MS-Office365-Filtering-Correlation-Id: 63a85fa0-2171-43cc-20a8-08de7b349881
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
	w3u+xdRzihDRHf1NinShmW9rOuUeV694QLQYFMgd9ZLNhDMp7up5vVMn1gKLmmoFpWEKsUOMdqM7nkqOaps6B05uPSbWM2LkvXWE+TLGDjvKHYHpxcIHPrHcU4Xlg+wh96794hT4IuFgo+aI38ibzZi11s/0eCXv5KRmEeLYbYjBgwzoxpgnNnlJLF60rjj6Phv1/4SFl5xvggbjdmRphLbtnB0TlD5dyMY9UXALuO4e1bMlupfgHRVlSZl/jqoYo3JgPnUfF9nkweXutdy0uAyWxY7L+VZ2HkK6jt/ryox5QlwV8lXAiW5KSYTxhJ6m1G/kEHsMrjwAlUvNCSy/q6wBXPoe9Jwk/A6w9LO1aPETbI8pmIZa0R5e1+SessPT8arWaDLNh+iq/JuKtKzhDYygUFt7hKSJmm2O5sl8QP5KV6I4OaIwr9LFnqYuc1FFuREGqhCKO2Xavs1UkKfFMUDXSLm07JyDLwVcYOH2Hjbgrq/WDJ/cx9ugRPqoxpRiUXYBj6IRz9H+HlU8zYqxFwHmUb1jrOk14t8n7LtfjoMl5p5Fk/Pf30SE7U6JwNQXUOBGkdV3aU9nyp9EKqkftbA/9tmCzU+5nqzFJtliUnJ0XdSnbuH7LQEcuOdQRl9Ms3qM13zo6wTLoMeUKl9VYyqQBjfDMCLqaDg/Ot+V1sSAvtkDgFDG9JZBcNpQlRel
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9501.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDZ6SC8rZHpwc0lBM0pPRzBXbWxwUlBLcHU4UGJhQXZBZDV6RGw5ODF2enNw?=
 =?utf-8?B?V1FNbWVLcUJlYitsR2FaY0ZtTXp2OGp0N3Q5RWVwNHk2dXVYUTRtY2NmWmRj?=
 =?utf-8?B?MFM1RG9UYlVxVDZvVG5kVjdFekZnZ1BxYVhXVGZldXVxZzIxUnYyMkt2bW9L?=
 =?utf-8?B?ZUY2c0NaZUM5WmxiUFc3dTNnQ21JVGNTVTYzZVorWTJKT3VONDZzcjJJWGNT?=
 =?utf-8?B?dWVIUC9RWlJOUWJZeE4wbTJXU3c5VUVVcXBqN0pQV2hJbXJROHZGVnFkS1RM?=
 =?utf-8?B?R3VoWjNGNDd1ZXJ4YXY1YnNzOVpwdmovUEI0cTMzdEZmdnl6QWFaWitGSnVG?=
 =?utf-8?B?akNjazg4ako5KzlrWW5YTE56L1JvenMzQXYrQllXMzVBN3R0Sko3aGk2b2tv?=
 =?utf-8?B?eDV6bzJFR2tHakNrYmJuYzMxT2xiWWh0cW45UDNMMUQ5VEFFaWhNZEJiY2dw?=
 =?utf-8?B?eE9oUTRpK25XazFWbDZFNGE1UU9rb3RlTENJWDZ6RmZtdHVSNTRoTHVNNkFo?=
 =?utf-8?B?TU9XL3ZkZHVmakZGY3RpMWllcXVTeFduTGdDdGNJbEtzZ3FFOGErazRaY0hi?=
 =?utf-8?B?UUFTWDV5dmQ5NWp1RUpQR0dGRjJEMEcrMHBtMjNpdG5qZE5TZGllbW0yS0Ru?=
 =?utf-8?B?RzlLbzEvdENIUjk2VTlVeDNyYnBVenNzNU5yMW5KendkeEtZNDZaREFvQ2J3?=
 =?utf-8?B?OVl1YTMvTENabWJGeXdlU0FVSnlsK0dQVG9kVkUvVnNtSjFnSGNUd0pUSFZl?=
 =?utf-8?B?dnl6SVpiY0xFVjVOTmdSSG9mME1YNjBWUU0xd2preUNQMVdMRzF1SGw5Qmtv?=
 =?utf-8?B?ajhiZENLTHN0QTBkSDFBYjF6dFpOTXI5dS94cnNoOU9HUE94bmluckRJaGNv?=
 =?utf-8?B?SHoybGtEMDN5blZmejE3UXgrNUFKNG5LNlZtV1dLUGp1SG1xK3ZGNG1sQXcw?=
 =?utf-8?B?UUdmUWYwMTd2ajRQcGtmN3VmeTd4UXlzb3BOWERNQXlkaTUrMWw0M2h6Rk9y?=
 =?utf-8?B?Rk1SNlZGYk1CNE9xWWJWNXhJMHJsM01wWUtPUWFvVDhjbHI2TXdpT1RwZk93?=
 =?utf-8?B?K254b09nMml0amR4MHNEbjBCM0liNjFjOC91Y2h3VXNnRTFXUUw2WEY1bnJE?=
 =?utf-8?B?c2c4WnpsbVZUUm0xRWkyakFYQ1Y1WklTb1hZdEZINUdkL045V3hsb2hBQXV5?=
 =?utf-8?B?ZXVDcDlQYmNLT0FTR0pCZWJjN05YQStBNm9Zc0NURzgxZjNkeFNLS2RqOTd4?=
 =?utf-8?B?bFkvaXYvb3piQjhwWHRUV2t0RDdKYTdtZDZMQS9zRzdmNFNRUGFacXZlOGVP?=
 =?utf-8?B?Nk1xeEJKcW10M3VIMDhhR0pnY051QTJka09MNXB0d1Z1bHV2emd6aitUK3N6?=
 =?utf-8?B?K1NoNURKd1lOT1paT0IwaEpicEphYWZjQ0lQSzdQMUpxUW1yc1dRejdnQWE0?=
 =?utf-8?B?ZVNmR1l1cERWaFF1aVBRUVRvTmU3cGNBbkJXYzdWSnlJN3A3TFlzMEZZZHc2?=
 =?utf-8?B?MmYrSmJzMjAwaUU2cjA5R2pRTVZZRllUYVhjYjlXWndBTjJrVUZyWHhTblFp?=
 =?utf-8?B?cmtBV2NxNGlsbnFhN1BYN3preTFjT3paeFBTU3JTUjI2eDF3T0s1OXNXdkRk?=
 =?utf-8?B?cUZJd29TZ3ducDRxczBCYjM0U3hBV1p5SHM3d3U2a1luRG5UMXgyT2Y5dFFp?=
 =?utf-8?B?NGJLdzFyY0M4VW93VG1kcGxtZDE0RGtEbnNtMjdjUVRKVVRDV003NkpHZFBh?=
 =?utf-8?B?enZMQ3JaelVBYVRnK1dkRHZNd2Jvb3NTbGtGZHE1c0NHRmhvaThPRHErcXUz?=
 =?utf-8?B?OFVKTnVvVDJyR09NNS82VDd4SlJkMVZaMG94QjVNL2p4ZzJ6WTRuVXA1dXVp?=
 =?utf-8?B?OFBXK3M3SE9Yc004TXhiYisxMGhNRm9oTDZVN0V3TnNYc25kNU1uaS9IV2x0?=
 =?utf-8?B?WXd5UlhrK2MzUTc2blo1ZWx1MHVyRG54QTgxRGF2ZGM3amh4cHhQOVhWOGpW?=
 =?utf-8?B?K1hPbXR2ZW9UejYrVFhGdVpTRVdwODZveGp5NGM0ZU90dXo3bDVkeVg3Tjlh?=
 =?utf-8?B?RGJDd2ZPOHRVdnN0Ym96c0hrTVJjQzlkZDVSdEx1ck9ZZFZ0QzNFYjdka2xu?=
 =?utf-8?B?MjhOWHdiaXRaTWRVMUpnM2UyeldpcDdnTnlsc0dpeDg4ZmF5Wk1MUWxySVV0?=
 =?utf-8?B?S1JlOS9ZMEFFdkJUOXpCdzRGbnViZXdwa0lRcGFudnVmcFlQNzdsa042R1RH?=
 =?utf-8?B?bXR2b21ZZUVpNEptWGRRVmVpM0l5Sks5cWgxN2ZkREEzZlBRVXg5bFg5Tm9X?=
 =?utf-8?B?OFZKRHhUaVp1UFZ1NEwzSDJJZFZJaFY4dE1ZUkMzWmt4bkZzVFFmUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63a85fa0-2171-43cc-20a8-08de7b349881
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9501.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 03:58:16.1580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PMuzKObtqsU6H3/FYkOffoT4VIjDaKaQSmPXB7rgcZGJ0utNbsCCF9HoVJmA2bes2C0uEhJT9AoV+dQwoLFMIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF0316D269B
X-Rspamd-Queue-Id: 5EC5221B55F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54688-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pnirujog@amd.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Thanks Kinn. I'm checking the regression issue with amd isp device probe 
in 7.0-rc2, will share updates as soon as I find anything useful.

For the corruption issue reported in 6.19.6, please share the steps and 
configuration details (BIOS / isp patch series version / isp fw binary 
/etc.) to reproduce it at my end. So far, our internal testing has not 
revealed any corruption issues on Ubuntu 24.04 with 6.19‑rc6 kernel 
using the Cheese camera application.

Thanks,
Pratap

On 3/5/2026 9:20 PM, Kinn Julião wrote:
> 	
> Caution: This message originated from an External Source. Use proper 
> caution when opening attachments, clicking links, or responding.
> 
> 
> will download the kernel again tonight. I've downloaded the rc2 and it's 
> not booting anymore. will nomodeset later and check the logs.
> 
> That said, I just realized the driver in 6.19.6 is kinda flaky too 
> (Kamoso screenshot attached).
> 
> On Thu, Mar 5, 2026 at 5:22 PM Nirujogi, Pratap <pnirujog@amd.com 
> <mailto:pnirujog@amd.com>> wrote:
> 
>     __
> 
>     Hi Kinn,
> 
>     Thanks for reporting this issue.
> 
>     I tried reproducing it on kernel v7.0‑rc1 but ran into other
>     problems, where the amdisp device does not probe during boot.
> 
>     Have you modified isp_genpd_add_device() [1] to avoid the kernel
>     panic and boot the system successfully? And then explicitly loaded
>     amd_isp4_capture device using modprobe? If so, this may bring up the
>     camera, but suspend-resume may still not work, as the amdisp device
>     registration with genpd may not be completing correctly.
> 
>     Can you please share the exact steps you are using to reproduce
>     suspend-resume issue on v7.0‑rc1.
> 
>     [1] https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/
>     amd/amdgpu/isp_v4_1_1.c#L132 <https://github.com/torvalds/linux/
>     blob/master/drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c#L132>
> 
>     Thanks,
> 
>     Pratap
> 
>     On 3/3/2026 7:28 PM, Kinn Coelho Juliao wrote:
>>     [You don't often get email fromkinncj@gmail.com <mailto:kinncj@gmail.com>. Learn why this is important athttps://aka.ms/LearnAboutSenderIdentification <https://aka.ms/LearnAboutSenderIdentification> ]
>>
>>     Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>>
>>
>>     Thanks Pratap, Mario.
>>
>>     I reviewed commit 0288a345f19b ("drm/amdgpu/isp: fix SMU warning
>>     during ISP suspend-resume"). I understand it marks ISP MFD children as
>>     syscore devices and manages their suspend/resume from the amdgpu parent
>>     via pm_runtime_force_suspend/resume.
>>
>>     I'm curious about one thing though; on my current system (7.0-rc1),
>>     s2idle resume still hangs with the in-tree V4L2 module loaded. My
>>     out-of-tree module, which adds dev_pm_ops that call
>>     isp4sd_pwroff_and_deinit() before suspend, resolves the hang.
>>
>>     pm_runtime_force_suspend() manages the power domain but doesn't tear
>>     down firmware ring buffers or V4L2 streaming state. If the camera was
>>     active at any point during the session when suspend occurs, the driver
>>     would have stale state on resume. That seems to be what's causing the
>>     hang on my hardware (HP ZBook Ultra G1a, Strix Halo).
>>
>>     Is the firmware/streaming state teardown handled elsewhere that I'm
>>     missing, or does the V4L2 driver still need its own suspend path?
>>
>>     Thanks,
>>     Kinn
> 
> 
> 
> -- 
> *--*
> *Kinn Coelho Juliao*
> *Ottawa- ON/Canada*


