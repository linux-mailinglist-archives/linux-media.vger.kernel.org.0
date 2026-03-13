Return-Path: <linux-media+bounces-55791-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2M3kONJ5tGmOogAAu9opvQ
	(envelope-from <linux-media+bounces-55791-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 21:55:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85540289EEC
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 21:55:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E8F823021970
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 20:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8606C3806CA;
	Fri, 13 Mar 2026 20:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wf8SchmG"
X-Original-To: linux-media@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010011.outbound.protection.outlook.com [40.93.198.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDBE363088;
	Fri, 13 Mar 2026 20:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773435341; cv=fail; b=uCR6Cm9VAL0gh85mSWlV/1vLqCxZcWzZq7x08BS6RfxrqvNMiC8jdMKAJk98IdHzFFh0synhHO46PI3wAZo8xW64hbsJG8Jq4uxvogevBoSYjixno/wkpexUIZUCRQhekQV7RorGoxJjbewbT1t+/ST8mKy763XXmWJMx8L96oQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773435341; c=relaxed/simple;
	bh=qSb3K5N4Aaref9+jhAtoIFHArB0EzGMBRQz+XXkc4P4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sGlLnKMA0dsPYHtBpxFXpYrhU5LwaIGnJx6EmE1pNoyPTeWiVi/76QmySOcweQ01imVq9oLzXkxaeAQco4ZE+Qgtn0pYc5PEZhj4TAj6XSp75MjWXHSY2cE6VWe9Qf7knsDE/TMZ9DGa/QTFaKqQOluBsug5Sr2Vn7RILsaBWrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wf8SchmG; arc=fail smtp.client-ip=40.93.198.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CfE1C9OyiyrNnHrBv9P6HZF3Rf8ZTYwTkeP3XdPrpJQdoHDfmWI2CA63skb+0HbI9aoZC0ZwW42chQEcFPIZ7koSs6hwM3T2wQmJe0lUYrEN1jnErr9a7KGv/2XA8uzzuw6RRAMmbNy7E2zI/auEIre0QWpXxMQoOExVFCistQ1BXiWtJa/peCgaBYQkkaOyWPnVECGlXrGRBk/z6+usu9VySyb4R/4Dril//OvdL1WUzOOBo0Ng75drygmNe2B35IP74zgb5M4wRn+UIry9X8ZGjbQhtbty2rCdzsNt7/2v1T28ExoQZsgMMpIPPleW9zaHBTrEJPkCVQ+2NYXM1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S2GDRsrm4/IAO67Zf2zoBktP3tXVm8zPnfX5TiqbFhA=;
 b=d58HNy+IkbR+mwfpRAKREuDskbir9ZgxIDzVdPN/Xty9nM32GLmD/uPlvBwqKf21OMC+xzuiLBcVKvXV8ODThYRP4dCXNah95A7g6aI6wQQlt/XrRdK5NflC7/3ONQEJOzqdnxWesSS3tRnFkMb3i9HH8vxyVwe/6ZQfV/8acfZBPbJodNcF29pdocJOv+rUGd5bOu4ADE10xZIoinLKg4QRbRYa9NcNr58Sv0nIRfDgo4XYaDguvatlpj1OGEFGpCgp++nMrgudOQ8Ty8fde7kv8G4QdOyEEKigNk5wo/onYLr5pvdwSTWWQKBXnoehwbPyFMVQ7FgDITeX3Qjhww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S2GDRsrm4/IAO67Zf2zoBktP3tXVm8zPnfX5TiqbFhA=;
 b=wf8SchmGqmtZIS6+CeddDgARJ8xqGUz8SFAhYBfl4Ojwit/iSSK3Yk/KIBoeE0K0efeF2LwEnmvWMI4/YdqF8WwJBsRR+kaAk0vdoOq3I92UJr4q04dYe3pZFZ77LBIz+wmeA/iE5MF39IoN11vKLafwcjxFBNZWStzmbIJkdtM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by MN0PR12MB6149.namprd12.prod.outlook.com (2603:10b6:208:3c7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Fri, 13 Mar
 2026 20:55:37 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9723.000; Fri, 13 Mar 2026
 20:55:37 +0000
Message-ID: <d938e829-2b46-4e48-ac53-520c615fad55@amd.com>
Date: Fri, 13 Mar 2026 15:55:34 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: amd: isp4: add system suspend/resume support
To: =?UTF-8?Q?Kinn_Juli=C3=A3o?= <kinncj@gmail.com>,
 "Nirujogi, Pratap" <pnirujog@amd.com>
Cc: pratap.nirujogi@amd.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bin.Du@amd.com, sultan@kerneltoast.com,
 benjamin.chan@amd.com, king.li@amd.com
References: <bb892e59-8fc9-4d1b-94aa-996a66392405@amd.com>
 <20260304002811.95497-1-kinncj@gmail.com>
 <bb32d3a9-51c1-4c56-9452-753c993c5316@amd.com>
 <CAF+u_BwY9CSbM2r9Yirzaj4GwwdJOzsEBxHPXfmYHzav9K9Cag@mail.gmail.com>
 <1ebc8e29-fa43-4265-80a2-a41e3276f904@amd.com>
 <CAF+u_Bza2FStVhZEVzuVJjexteRkcK7OCAgTmEmyKDhrMCbBPg@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAF+u_Bza2FStVhZEVzuVJjexteRkcK7OCAgTmEmyKDhrMCbBPg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::15) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|MN0PR12MB6149:EE_
X-MS-Office365-Filtering-Correlation-Id: 833530a5-40b4-4a25-ed80-08de8142e097
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|13003099007|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	3Gmc/ZW4kn+SXS2GKs6/kjUF1EO87u/ucTS+lGaFy0FsiHQAVzMVvIfoylCjIMYfJ4F1FeTKxlbzUSr2VNOkkWXHHev5x5mserKTtc0t847lM1DCvb/623vOuLrvFY9sfKtHEWwvRaPg5ESkZMUhO5V2ikgH8ACm9/F5UAhdXp0vcDYi9foitF+yLm5XMLDmjf3SnrAEkYJNws5IQmFGdq7FIS8gLC4Z4HJT7t6oHS1hV2tMGJMCDL2F7+R+eNWgT8iBrngSsJ+TUId7F35HEmUrx7X1FxLqVLUzMi1sklPRCTVKWShTfDOBsa83L6PN1bFc9/EpPT33DyAnFh8D8KaYNypnUsTSbC9WooVVv18VZxeFQmx1ICn88kHlv6xUGFuuvHYPtUbUbbqBgCDa1aNJ9mQBvglJ9S8dhO6lN9Tj6uqGS84B1gLpwXhIcSHuvxNFUImQ3g8WgcwM/8XfGtUq/dMJawQLyvYLJHd5DBnwkqhauHuq8VV7/RIhQW9NYZoMaXAtlx/vD6/D155jLh3aGQ25aX0MGpu5umGafIH/Tsuw+fqBFKZARJ3uhHMKKIK+Ialpx0NKJ6mY3gryDatnroP3Hjoyq4tZwlhqj0OcDp3cbDsgcBet+G+5VON2BKkNTNEN2yXC9FuBRIsfpJreKirQKt6lp/nXpdXrYVA8ewP/blHUOtWJNF2unmVilawQi4MTcOWfHREJ5bEcNxEuXWlA37WIxlxpl7SfPBheKBER/pM/BJmQy9GS1PmQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjRpdE9BeGErTTM2V0V4THFUbU9rd1k2ZWIwK1dqVXBETUoyUFpSR01WK3ZU?=
 =?utf-8?B?Q2llTHNJSWVpTURVMEFJYmxBOXgrWW9HWkpEQmNKWUhxT3BIclh3WWRHeVBt?=
 =?utf-8?B?TUNHSWhnRzBTRG5IWW1tU3RNMG44cFdFNzJSazRKMk5mMUdkMUlGVHdGQmlo?=
 =?utf-8?B?T2lneTN2M1ZwUlhWR3kxTjg0UEtHbHJMYlgvellGZ2dQSXdHR1BrUnk3cDlZ?=
 =?utf-8?B?UkNWc3kwUFAvc3dyTWVCQmRQOEZBNUxYUzlaRGU5d1BpVm85OWpOc3pTLzNj?=
 =?utf-8?B?eXRmOUplNi90MTZqU3BnSEs4ZFNkVG95b0UwdDBrbmpwKzRZcGpFUWs1YjBp?=
 =?utf-8?B?bjFxZENJQkJ3cU5oN1FqSzRPR2xTbDVUaUs0bEpaN0I4ei9yUjZJWjBiTldW?=
 =?utf-8?B?RDB4NVEvVTEyVktoUVVOQXdqalpsYWdiUFYvN3h5L3NHUHpxOWE0V0FJUEFi?=
 =?utf-8?B?YVBmQVErYWJtbXV5SWFuWjF4Y3p2MDcycGdORm1CY20wRkhSQy9BOXg2QTho?=
 =?utf-8?B?aGd2alMvcUdONzVVUHpyYWRrTCsrRWZUOGJyeGdwVGlBUElhSC9XOFpKSEFN?=
 =?utf-8?B?ajlQY3RxeDJ3Z3Q2clhPN0hJa1BOaDBCODcvZzZ0cHlNMk1iTVpsVDFnT3Er?=
 =?utf-8?B?YTlwelZzQk1YTkpaWVphZTl4Qm1xWERLajNCZlMrTVFlaGxaTHdIZ0NZMGNl?=
 =?utf-8?B?Zno4ampvakJ5UXZyelJ1UlZYZlUrTnozOStNaGZKUEQ4NVFFZzJ4NzBGa3JK?=
 =?utf-8?B?TTc3L3lVR1RTa0Y4Y0hBMzROaWsyWDN6VW5mb0VBWFFOY0FFTy9pZ082bnd4?=
 =?utf-8?B?end1bXgreTNJMHR4Zm5XcmdpeGo3aDM5UmphUFY5d1R1bmFaTmJyL1ArR2ZP?=
 =?utf-8?B?bWlreklyUjNhTDFlaThGUjN5OThJQ1dSdmpXdTgxVmhtbmhJU3Fuc2Q1MEhi?=
 =?utf-8?B?aW9yTGtVdWMrU0VtWE40c05vcGVrZW1MU1JFS3g2OHhXemxVVWNETVo3VVJx?=
 =?utf-8?B?WkhKbkdrRFhUTmZSV0dCUTBqeDFaUEpGbnhQRHh1eXNXTXhUNmk4SmxTOVZl?=
 =?utf-8?B?L0h0emhPVktFdXRrQjlESUU0WUh3SWZGdTBzazNQNWZnZmJGS1RvcGdFUEJH?=
 =?utf-8?B?RjFyUStnK1VoT0dTZjhDZ0ZzUjNVSyt6N1hMZ0FKQ0tHeW1iNHY3cUxQS21z?=
 =?utf-8?B?MkFGOXVSR3UzWUJNVnlXMVlqTmdUMUlpd2M2cnc0eUhERkNRdE9ScWlkNWdQ?=
 =?utf-8?B?eTNQMktCQjA5VWpTT0YvZmlMcThrVEVRTFp0UDJXRHN2QXluTlphNEFZYkpG?=
 =?utf-8?B?aC93QWd3OEczb3BKVEpWUzg1R3R1Vlg1SkI5NEMvQWdKdUVrNDVCTExrdm9u?=
 =?utf-8?B?VHdzdVJ6NU9DNWgyYVpjSFJsRFYzSnRLbUovYVJzNWI1YWtsS0ZUd2s3TU56?=
 =?utf-8?B?TjNTc0FKQ2FBZksydksrTmdCQnNIaVprbTJwWndiNEpjNklFMnFLTXJCVFJw?=
 =?utf-8?B?cll6OUN4UldGMTV6MlpLTFdpeEZJQlFsTGpZSEE2ZXdSQjNoSzgwUTNoUDZS?=
 =?utf-8?B?L2tPeGdSOEZzSnk1cFYrWkoyeGp1d0dxcENYUXFJTzdKcHg1MzJ4WDkrQ1Ar?=
 =?utf-8?B?YWFyblcrVXo0RUoydm83MVd2ZkFGMzc0WkRBY3E5VzFWQTZyUEVFTmlXWlpz?=
 =?utf-8?B?alZaTGRpb2NGVU04S2ZlY2ZRMmczM1c0VlM5SGl3aW8yT3NBaWNhdUNVWEh5?=
 =?utf-8?B?MTNSSTZOaXpPQ3VnVmV6THBaclJtVlBRZk1ISEluRjlqcmp2L21IQ1RJaHF2?=
 =?utf-8?B?ZWc4TFFOa3NURkczUFVNeXJ5cUloUE85TGlCQjZxSzN0cUoxdHNWaW9vOHpL?=
 =?utf-8?B?WHBlR3EwYnhNcG5HODlsZTM3elc3RWxjVmZJTTdMa0dVVWtsa1FUbnhUaXI5?=
 =?utf-8?B?Sng4anRka0dDa2F1eitvUHBiNVlnWnhMRUF0YkFoR3VxdmM2V2VYZ1lrbjFY?=
 =?utf-8?B?eVhsYXlyb25HQkFoR1ZBRCs2UjBqeWluYVpaei9qd0pjd3pabGlmUUZrUVpH?=
 =?utf-8?B?ZEQ0UUhiU3FUT1RZTkNObU83dW1EWGcxdWRDTVNvYURlajNvT2k5RUUxbE5P?=
 =?utf-8?B?LzRmOU92UzVTbUhkcEU0UVBZNUY5U3dMdE1WdmVPaDA3QkFBS3VscFJUZW9r?=
 =?utf-8?B?eUNvOGhaT3Q5eDM4VXprQ3BWamVoWjlZekR0VkJ3aXArNFFZeHZibUNYQnd3?=
 =?utf-8?B?MXdFSEV0dnVBcE16WENTa1FWVFAxeEF4bW1GbmpvazA5L0Nwd3JDTE56dEcy?=
 =?utf-8?B?ZHI4RW9PMm5XVVdRZURMc0l2VTA4dDhBZFVjRzdoUVJjZXBMQ2R0Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 833530a5-40b4-4a25-ed80-08de8142e097
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 20:55:37.1937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QyzSy2VcC+as03Ltt6n+38MlDgVxTAPWMPyXhpSZ5g1FR7DY21vLUx7aKuHjMmNDPo11Cex5fnS2AmHgO3kotQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6149
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55791-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[amd.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 85540289EEC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/13/2026 11:48 AM, Kinn Julião wrote:
> Sorry,
> I did not forget about you, just didn't have the time to gather all the 
> info yet.
> I just installed this patch on my cachyos (6.19.7-1)
> https://github.com/idovitz/amdisp4 <https://github.com/idovitz/ 
> amdisp4> and it won't resume.
> the main difference I can point is that I had implemented the hooks for 
> capture resume and suspend (
> https://github.com/kinncj/amdisp4 <https://github.com/kinncj/amdisp4>).
> 
> haven't attempted anything on 7.0-rc3 as that completely hangs... only 
> boots with nomodeset.
> 
> *--*
> *Kinn Coelho Juliao*
> *Ottawa- ON/Canada*

Pick this up:

https://lore.kernel.org/amd-gfx/20260311174251.3121654-1-pratap.nirujogi@amd.com/

I expect we'll pick it up in Alex' -fixes PR next week and we should get 
it in for -rc5.

