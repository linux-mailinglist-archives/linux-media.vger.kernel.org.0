Return-Path: <linux-media+bounces-56533-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BEZAEpUvWlr8gIAu9opvQ
	(envelope-from <linux-media+bounces-56533-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 15:06:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D7E2DB918
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 15:06:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A63C5310340D
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 14:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 456F53C13E8;
	Fri, 20 Mar 2026 14:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="B+Ja7qX/"
X-Original-To: linux-media@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012033.outbound.protection.outlook.com [40.107.200.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B61A39B4A0;
	Fri, 20 Mar 2026 14:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774015300; cv=fail; b=QYieQilIR2jIHaO9f6blt6oL88t54OInnl3Qz807Gwf3GnKcrAyRmgbGDo0xSsvVFHtxCkcz+zCCct5PX/IH2AwWuLRH6KQuXjhHcI6AZIH9CNlUS/UNINGZbDMl1h4MohBu0R0uSgDBiFDneLm4cQtCaHrD3sgaXJpUfY4PLiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774015300; c=relaxed/simple;
	bh=oqv6dR+QpOMld9+sexeD+TIxVUykPHmwJG6fS0BRj/Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=X3zY9meycHkLxFZPF0Z6aPxyRkXxAOlN8tugBk/+yRugmahU3tzHycwcxmdZzWHpsZ2LMcJ3gLlwFzLca9SlGrD/Pr6tgRt3z8hmAnkz8wD7S/jDr9Le+vYO4SO8Ib2we7ekFwJFavegL/RxyV/JHwapuvSmWPbD91kOmnosozQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=B+Ja7qX/; arc=fail smtp.client-ip=40.107.200.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lQ5RAQPNKwEaJayr9ikvvVR82cmhCf5F8wwiMK7GxN5ZbSzRhVOfzqQkvY/si9S75iFQXwsyBRq0BG+RA8ahmGZ/aY9/laVXBW5UKDz6i0t6rYlsJUrxksis5EFc6wC6MpvnTB3hdU/UAUb46K8w1XOREIhYuRZtTdOzYHnUPPampSp0kNRjr3s4F5t9f4s4AeHZlQdxdS5+E5Um+Rbc6nS4PycOgxXIjNWPTzD5buVj2nfXh8c2szroAYhDtquUJPiPVgqkWozUmsc1ZvInJzEqhOAjoHOdZoTOplVAAI4mOFGG8sFwCatJywoi0MFU05qgmpQrt1GvcR8BWFQBvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rrLpy+H6PjSuZdB4FmVmorLDOG8QV3isHzzuBU5HqOk=;
 b=B+oWL6RH2/7kMxuKnfaNoYpqO+D0yBSFTXZ508WzRP0mbHS/7BvZt8F2INcjQpFFYLXzs0mfjRpvYp0Hs0KNf4SXzNXHNlnmOgSWe+L4WoU+SjrNuwO8qLfCggZ9nhF9nhnDAr4odafC/EGUm0WhqkmmhmRj7Gvv7enP8SdZw63Ba3tE+owRGq8kS2XH/RgJJr0M+f2T2Zrp9f+QW2vAV2KQgqHy5JbbZEe3WlM6vwgRpclt71ut5bk/sWpSOGxcOzd/8CTZHuTT0nun+dCVUbMwKk8Zm8ttHOaX9/zNp15QufD1GkhjgNP2jadw3LdwZHTDm4ipybB8xKs4ojrjnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rrLpy+H6PjSuZdB4FmVmorLDOG8QV3isHzzuBU5HqOk=;
 b=B+Ja7qX/SmvVO5B9VLL3g27OgY3L3yLP556KcUyInEBlUYdwtx7x8gq7KNaXD9wZXojJ3kwnJUjAmwauhgmsoq/ySyQQzx6fT/IxsIytsNDZ6ws0r9RQl1yAC5MVOw8YtP+I+WlxfTfNRza8ahEQhpJbaqsPE2mlu03enzSVkpA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by BY1PR12MB8445.namprd12.prod.outlook.com (2603:10b6:a03:523::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Fri, 20 Mar
 2026 14:01:21 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9745.007; Fri, 20 Mar 2026
 14:01:21 +0000
Message-ID: <470a9fbc-c4c2-4bde-a91d-a22f1c730b31@amd.com>
Date: Fri, 20 Mar 2026 09:01:17 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/7] Add AMD ISP4 driver
To: "Du, Bin" <bin.du@amd.com>, mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 sultan@kerneltoast.com
Cc: pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 richard.gong@amd.com, anson.tsao@amd.com
References: <20260320084146.200988-1-Bin.Du@amd.com>
 <7d5d52bf-b0dc-47d4-8cb8-d6099fd05c57@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <7d5d52bf-b0dc-47d4-8cb8-d6099fd05c57@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR06CA0011.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::24) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|BY1PR12MB8445:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e5d450b-abbd-4dee-e856-08de86892a26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	gaC33d5YNaxzzB5Oz49gyAh/4yUlP4j+uoIoDE0v+5ki/2yONifsH80I6ap3xynhj98uesHd2ZnbbogvwW+PApyP3P6daJOk0U3kyPuC2nR5n/TM4VBDPG3fbdjLQuf2cCiqdr/PLnfKzEByX3MjBpxTuTx+FFXDqYCto+iP0OHOCD3mbmJ8b7wBdnPQYGBSH87WyiqVgUfJIonAtB5Hyf44qNGv/KLTSl9ruyBG0OXaAGZk3IEQEOCNbAWWpbRD/8IeTEH9wfMjgzNvCt6Oe7IwQwNPI5E9iETPEzfBRYH8GrllJVRXHJUV4GB0h22b/7BdTo31CgGdPfaSe97HriVvmgVm9GEM0uNi3/i534JOmjQeLnDmLJiLGXRwHdYAgZWKLOWAGShrPiGwTXFFwfajYgLpfu9Gs9sY4Jad0OnUIxfDoUg7W57/RMS9AiGp0mH0mKTc1G/7hQ2BrTt1iCqimgS95mzbehdrHNDzNopM1f0BsX3wfgzpOSd99cxmYeVALl6uiZTmFMyovmkOy3YXkB6552gk18F2ZxDiYcbO/b/VXkoJEKzVfXksvZm+8gXH+4YbiOvJeUcGl7LZWoWOp+JCP1qFHY5csXR22wX5lyzsBkuH6a9dDbGn7X8P0u4XF4wwlqaxBW7+r732h0EGavPRFHnZqFgIptM+LTdkq4X6pPNmBQm6p7fYn2qYrmTN6Kl9WMdlvSse3crO+0xEn3NGTNcg46YdEaGZajPXkntAxCiXuats7B6KsCTd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWYwMzByY21DNWE3U0tjS3Z4LzRqQmRGenVCM2NuWjZ2T0xRc3k3SDMrWENl?=
 =?utf-8?B?cFFXQjhLelc4MUtIT0U5ZmhFQWc2dkVDVjM5ZXJYMDhua0NwYUo3Y1l6Ykxi?=
 =?utf-8?B?bkxnN2Q0Wjl3ODEwTEVBajc1dm0xY1JhaXFzQ0tvemY1RkFaaldJV2pnaUNm?=
 =?utf-8?B?Q0haaDhwRit0a2ZaelpVRmNhNFhxUzlyZE9PVGR3aytFRVpKOFk5L0ExbHp5?=
 =?utf-8?B?SXBvRU54NjBKcXB4eHV0cXVOL1Y3TVJpamZ6VThXR2RObjByTUt3VDJSakpV?=
 =?utf-8?B?OWNnZys1a0lZUUxlOXpsUnlVZTZncnRzUnJ3Sk5kZ2tETTNlWFcrYlk1S2M3?=
 =?utf-8?B?MVFhSWJXejAvTnV0bWlvN3lTbytrLzRKTExvTnpiZnk3S3pxRGFEOWRiVlBi?=
 =?utf-8?B?dXplLzBkZDEvc1FoemQyKzRTODFlb0Q0RjkyQnJMQkl0NStxMEpuT1pzdFY2?=
 =?utf-8?B?SU1kek9LWmdGYllLRjh0ZTJlSG9hTXFlVlNjeWxLcHFpRlhTQVk2b21tcXVa?=
 =?utf-8?B?ZXhGYUlrUmlzcEtlcUlCejFZMVphQ29UYkkzRjBNVjEvS3FlL1NOV0crNDR4?=
 =?utf-8?B?RmRCdVdNblczWEw5RDJiUWtBaTBxQTN6a1NvRE12ZWd4aDVzT1lrd3RTZzE3?=
 =?utf-8?B?VFdMaUtKSWdveHU4ZjJTWXdiTlJRa1YrZWxQM0pGT3p6bkViUmVIbG04R2Nz?=
 =?utf-8?B?WFhjZ0RUWmEzMEZEZnNRajg4Y0l6VkxaSEROdlR5SDdzYmRnek9VZ1NSNlpi?=
 =?utf-8?B?ZDI4UG1yRFZqTDRSMU5TSTgwRFA4YjZLR0lsK2RxaDBNaEVtb2E1b1RaWUFj?=
 =?utf-8?B?ZnUwZENtOEpkb3dtbmtrNGNqUmJUZmRXdTBqVWhXMFBBYVVjdmZVV1Q4MUpJ?=
 =?utf-8?B?UW5lSkFYaFlkVHVtSUFYSW5kbUJzb1lraVJCWUprSHlCM2pRbDhMQ2owZVZD?=
 =?utf-8?B?MXE3aEZSVFdlT3FPK0wvQWRFM0RHektsRlgrY0xtYVRsUGJBaGV1a1ZPVTVI?=
 =?utf-8?B?QWl0b3F4RzdjOGlvMWtZRlVaK05zeHRrcVFRVGtLRmIwRkdwZmFxWVA4cnFn?=
 =?utf-8?B?bWxPeGIxcTkxckVvZ2Uvb2J4ZmJHNGFDVGtOTXNwS3VHa0JEazBZbFBTb0xo?=
 =?utf-8?B?c2h2M1BUWnh1Z0p0UDB5WUVOTU1ZQ0NCNkhqM2lwVTkrdVJwYSs5cmp4WHFq?=
 =?utf-8?B?QnByN2FuUmZjY20xMzExeWlJbVpLVVFZWjVwclNrSHJwK2RyaUNmeU8veW1K?=
 =?utf-8?B?TkMwWnJGWmVncEZ6Q2g5NW5VM1J1ai9oNThHaGV4USttdm8ySVVpVG00UllC?=
 =?utf-8?B?YlRqY2lMaTJYNU5hK2MzeEtGYVh0eHA1SllXakl2eXo5b2YxNzF2dnBnNGJ5?=
 =?utf-8?B?Wi91cUZmd3JOZVU4R1hSMGtqZ1ZBY2xLY05ORkJQYnZ6NklYZEZqQlduZEZB?=
 =?utf-8?B?TUJ0RlJVWFRrR0duYXNnVEZmZWtOOVVxNmNxOXR5T1RBczEySEk1ajM3ZGd6?=
 =?utf-8?B?aWRuNFpSS3ZLQ1hyL1lKSHhDVFF6SVlDVWpKQXlyQ2JjclRPajdBT3BMOWJq?=
 =?utf-8?B?bEhFbnROdlhoRWNocmRwSlFOT0dWK2JkOUFFTGFKRkR2Y1RRY1FJVzcrMThN?=
 =?utf-8?B?eG1VMmhhbWM5d0tZcXdyTW0xRHJSVG9WanRieG5TeFNsTnlwWnlwdUZ0R05h?=
 =?utf-8?B?T1BqeUMrd3BJSkRKZ0lBWStZUlJVbVBmdDJIWTh4MlF6Rk5UZXFRWWx0QmJz?=
 =?utf-8?B?VE9kRk1kVmJnak9sL2dCSWRjMjJsSFlPQzZxN0E5MjVxOTFHcE9MRmNTcmJp?=
 =?utf-8?B?RGMvNC9PMVg4WGF5ckdGZEMvUytTeTlqKzJHUmpWZ2o1OFFjRmhoSVRuVnUw?=
 =?utf-8?B?T2lJMmVCOWR1b2tMenViMWkrdExiWUVXbDVIQytuOVppR0tsNGpOTTBRcXAr?=
 =?utf-8?B?N1RObm5TOVU2R0xHZXZYeEtxSnlETVlNOSswWmVzVUFuYXE4QVpXU3dHVHZv?=
 =?utf-8?B?Tmx6Uy9TclIwRUErMndZV2swd0orNWJFaGdicmRrTkh3aTlVTis4TUt0bGlP?=
 =?utf-8?B?eU1CS2JkZEhXdFVYQXJOWXJiSE9TS2RpdFBoSFR1SXlIY1lHUFBIcXdQcU1V?=
 =?utf-8?B?YTJlOExxVm1naGFUQWtETW5sTEliVXdoYmFsZnRhZktnTndycTJTT0U5SDhU?=
 =?utf-8?B?VElpa1kzU2FLS3lydkFudW9MNUJYSTJpZytrTUM1QWZROWtQcTJXWDZqUFQ4?=
 =?utf-8?B?RE1xNitqalhsak04QUhYc3JwcDBENkN6ZTVXVFFJcFFKZmZNM0xVOVZDLzhY?=
 =?utf-8?B?bUNBZS9QWEdLUk5vL2xvNUxpNWFyMUlUMGVLRXRJci81WUl6Mk9WUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e5d450b-abbd-4dee-e856-08de86892a26
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 14:01:21.1546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nu7ELKGiqdfNiohReIxcsuLwUPWhkr6u3imejff8rW1I7Jv8VSM7/oewtpYf1J5+yiiaff4rFFq6BlT37GVd2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR12MB8445
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56533-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,kernel.org,xs4all.nl,ideasonboard.com,linaro.org,linux.intel.com,bp.renesas.com,vger.kernel.org,kerneltoast.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ubuntu.com:url,gitlab.com:url,amd.com:dkim,amd.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 51D7E2DB918
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/20/2026 5:26 AM, Du, Bin wrote:
> Hi Laurent Pinchart and Sakari,
> 
> Would you please review the updated version at your convenience? This 
> revision resolves all previously identified issues, incorporates 
> feedback from earlier iterations, includes numerous improvements, and 
> has been verified on Linux kernel 7.0. Your feedback would be greatly 
> appreciated.
> 
> 
> On 3/20/2026 4:41 PM, Bin Du wrote:
>> Hello,
>>
>> AMD ISP4 is the AMD image processing gen 4 which can be found in HP 
>> ZBook Ultra G1a 14 inch Mobile Workstation PC (Ryzen AI Max 300 Series)
>> (https://ubuntu.com/certified/202411-36043)
>> This patch series introduces the initial driver support for the AMD ISP4.
>>
>> Patch summary:
>> - Powers up/off and initializes ISP HW
>> - Configures and kicks off ISP FW
>> - Interacts with APP using standard V4l2 interface by video node
>> - Controls ISP HW and interacts with ISP FW to do image processing
>> - Supports enum/set output image format and resolution
>> - Supports queueing buffer from app and dequeuing ISP filled buffer to 
>> App
>> - It is verified on qv4l2, cheese and qcam
>> - It is verified on Linux kernel 7.0 together with following patches
>>     ACPI: video: Switch over to auxiliary bus type (https:// 
>> lore.kernel.org/all/5986516.DvuYhMxLoT@rafael.j.wysocki/)
>>     drm/amdgpu: Fix ISP segfault issue in kernel v7.0 (https:// 
>> lore.kernel.org/all/20260311174251.3121654-1-pratap.nirujogi@amd.com/)
>>     ACPI: bus: Fix MFD child automatic modprobe issue (https:// 
>> lore.kernel.org/all/20260318034842.1216536-1-pratap.nirujogi@amd.com/)

Just to make it extra clear to anyone following along on the sidelines 
there was a lot of feedback sent on v9 of problems on 7.0 that weren't 
rooted in this series itself but rather these other Linux kernel 
changes.  They are all landing in subsystem 7.0-rc releases, and thus 
these other subsystems should be in good shape for when this series is 
eventually accepted for linux-next.

>>
>> AMD ISP4 Key features:
>> - Processes bayer raw data from the connected sensor and output them 
>> to different YUV formats
>> - Downscale input image to different output image resolution
>> - Pipeline to do image processing on the input image including 
>> demosaic, denoise, 3A, etc.
>>
>> ----------
>>
>> Changes v9 -> v10:
>>
>> - Fixed build error on specific Clang/LLVM version (defining a macro 
>> as an array element is not allowed)
>>
>>
>> Changes v8 -> v9:
>>
>> - Dropped wait_prepare/wait_finish vb2 callbacks (handled by framework 
>> via q->lock since v7.0-rc1).
>> - Minor comment, typo and formatting fixes.
>>
>>
>> Changes v7 -> v8:
>>
>> - Replaced ISP subdevice callbacks with direct function calls and 
>> deleted subdevice link validation functions and variables.
>> - Removed unnecessary media pipeline operations, redundant media bus 
>> initialization, and omitted non-essential video format checks.
>> - Applied code style improvements, including the 80-character line 
>> limit, standardizing macro variable naming from "v4l2_sdev" to "sd", and
>>    declaring loop variables inside for loops as unsigned where possible.
>> - Added the ISP4FW_ prefix to all firmware interface definitions (such 
>> as command, image format, stream, buffer type), and corrected the typo 
>> "steam" to "stream".
>> - Switched to common vb2 queue memory operations (vb2_vmalloc_memops) 
>> and updated Kconfig to add HAS_DMA dependency and VIDEOBUF2_VMALLOC 
>> selection.
>> - Changed the order of header includes in several files, eliminated 
>> unused header inclusions, and reviewed grammar and spelling in comments.
>> - Updated Kconfig and Makefile to change module names for ISP4, and 
>> modified the debugfs directory from amd_isp to amd_isp4.
>> - Removed deprecated v4l2_pipeline_pm_put() and v4l2_pipeline_pm_get() 
>> calls, and replaced obsolete s_power() with runtime PM for power 
>> management.
>>
>>
>> Changes v6 -> v7:
>>
>> - Added missed blank line after some if statements.
>> - Changed the pm_runtime_disable() order in isp4_capture_remove() to 
>> align with initialization.
>> - Reset buf_sent_cnt and start_stream_cmd_sent on stream stop.
>> - Removed duplicate buf_sent_cnt and start_stream_cmd_sent reset in 
>> isp4sd_pwron_and_init().
>> - Combined isp4sd_reset_stream_info() and isp4sd_reset_camera_info() 
>> into isp4sd_uninit_stream() to eliminate redundant stream info reset.
>> - Removed always-false status check in isp4sd_uninit_stream().
>> - Minor style improvements.
>>
>>
>> Changes v5 -> v6:
>>
>> - Lowered FW mempool buffer size from 200M to 100M (actual usage).
>> - Added an irq_enabled member to the ISP subdev for proper IRQ disable 
>> handling in both normal and error cases.
>> - Removed unnecessary .owner assignment from isp4_capture_drv definition
>> - Updated IRQ handling to enable and disable interrupts via the ISP 
>> register for improved performance.
>> - Revised ring buffer management in isp4if_f2h_resp(), addressing 
>> safety checks to ensure the read pointer is validated before memcpy 
>> operations, reducing the risk of out-of-bounds access. The ring buffer 
>> logic was also streamlined significantly.
>> - Modified ring buffer handling in isp4if_is_cmdq_rb_full(), 
>> correcting an off-by-one error in safety checks that previously 
>> allowed rd_ptr to equal wr_ptr when the buffer was full.
>> - Refactored ring buffer handling in isp4if_insert_isp_fw_cmd(), 
>> simplifying overall logic.
>> - Resolved a regression from v4 to v5 where isp4if_dequeue_buffer() 
>> did not protect list_del with bufq_lock.
>> - Addressed a subtle use-after-free issue that could occur if a 
>> timeout on a synchronous command coincided with completion.
>> - Added missing pm_runtime_disable() calls to isp4_capture_remove() 
>> and to the error path in isp4_capture_probe().
>> - Removed stray semicolons following closing curly braces.
>> - Improved and clarified macro definitions in isp4_interface.h.
>> - Eliminated unnecessary (u8 *) casts.
>> - Added missing memset for firmware command structures in 
>> isp4sd_stop_stream().
>> - Excluded streams 2 and 3 from ISP4IF_FW_RESP_RB_IRQ_EN_MASK, 
>> preventing their activation in the interrupt enable register.
>> - Enhanced error handling to clean up kthreads in the event of startup 
>> failure.
>> - Corrected a race condition during kthread creation where waitqueue 
>> head initialization could be delayed, as it was performed by the 
>> kthread itself.
>> - Removed status checks in isp4sd_pwroff_and_deinit() that were always 
>> false.
>> - Ensured isp4sd_init_stream() is only invoked once per stream start 
>> and reordered corresponding status checks in isp4sd_start_stream().
>> - Improved error handling in isp4sd_start_stream() to propagate errors 
>> from failed functions.
>> - Relocated debugging messages in isp4sd_stop_stream() to execute 
>> under lock protection due to access to output_info->start_status.
>> - Eliminated redundant GET_REG_BASE() macros.
>> - Removed isp4sd_is_stream_running() function.
>> - Corrected error message in isp4sd_init_stream() caused by copy/paste.
>> - Refined struct isp4_interface to remove firmware ring buffer 
>> configurations.
>> - Removed obsolete isp4sd_is_stream_running function.
>> - Removed pdev member from struct isp4_device, as it is unnecessary.
>> - Fixed typo in 'isp_mmip' parameter name within isp4if_init().
>> - Removed gap in struct isp4_subdev definition.
>> - Performed extensive dead code removal and minor style improvements 
>> throughout the codebase.
>>
>>
>> Changes v4 -> v5:
>>
>> - Transitioned VIDEOBUF2_V4L2 from 'depends' to 'select' within Kconfig.
>> - Standardized object file naming conventions in the Makefile and 
>> sorted entries alphabetically.
>> - Removed the unused macro definition to_isp4_device.
>> - Eliminated unused members mem_domain and mem_align from struct 
>> isp4if_gpu_mem_info.
>> - Deleted unused fields mc_addr and gpu_pkg from struct 
>> isp4if_cmd_element.
>> - Removed obsolete pltf_data, i2c_nb, and notifier elements from 
>> struct isp4_device.
>> - Updated platform_get_irq failure handling to return its actual 
>> result rather than -ENODEV.
>> - Refined inclusion of header files for clarity and efficiency.
>> - Appended comments following #endif statements in header files.
>> - Improved implementation of isp4if_gpu_mem_free and 
>> isp4if_dealloc_fw_gpumem.
>> - Removed isp4if_append_cmd_2_cmdq and revised isp4if_send_fw_cmd 
>> accordingly.
>> - Enhanced isp4if_clear_cmdq and isp4if_clear_bufq by eliminating 
>> unnecessary list_del operations.
>> - Adopted completion mechanism instead of wait queue and condition for 
>> command completion notifications.
>> - Employed memset to ensure proper zeroing of padding bits in 
>> structures shared between ISP driver and firmware.
>> - Streamlined IRQs, reducing total from four to two, retaining only 
>> essential ones.
>> - Optimized IRQ handler logic using a while loop for greater efficiency.
>> - Introduced dynamic IRQ enable/disable functionality based on camera 
>> status (open/close).
>> - Applied distinct identifiers to differentiate multiple threads and 
>> IRQs.
>> - Removed unnecessary initialization of local variables.
>> - Refined camera start/stop workflow to mitigate potential 
>> synchronization concerns.
>> - Replaced all remaining mutex with guard mutex.
>> - Enhanced command and buffer queue performance by substituting 
>> mutexes with spinlocks.
>> - Removed redundant isp4sd_init_meta_buf function and its references.
>> - Limited firmware logging activities to the stream1 thread.
>> - Relocated v4l2_device_unregister_subdev() and media_entity_cleanup() 
>> calls from isp4_capture_remove to isp4sd_deinit.
>> - Resolved media device registration sequence issues.
>> - Modified stream processing thread behavior to await IRQ without a 
>> timeout.
>> - Addressed cleanup procedures in video device initialization and 
>> deinitialization routines.
>> - Corrected typos and made other cosmetic improvements.
>>
>>
>> Changes v3 -> v4:
>>
>> - Replace one mutex with guard mutex.
>> - Remove unnecessary bus_info initialization of v4l2_capability.
>> - Drop V4L2_CAP_IO_MC from capabilities of v4l2_capability.
>> - Modify document with better SOC description.
>> - Fix Test x86 failure in Media CI test https://linux- 
>> media.pages.freedesktop.org/-/users/patchwork/-/jobs/83470456/ 
>> artifacts/report.htm
>> - Modify some commit messages by describing changes in imperative mood.
>> - Add media-ctl output in cover letter.
>> - Create separated dedicated amdgpu patch to add declaration 
>> MODULE_FIRMWARE("amdgpu/isp_4_1_1.bin");
>> - Fix typo errors and other cosmetic issues.
>> - Add DRM_AMD_ISP dependency in Kconfig.
>>
>>
>> Changes v2 -> v3:
>>
>> - All the dependent patches in other modules (drm/amd/amdgpu, 
>> platform/x86, pinctrl/amd) merged on upstream mainline kernel 
>> (https://github.com/torvalds/linux) v6.17.
>> - Removed usage of amdgpu structs in ISP driver. Added helper 
>> functions in amdgpu accepting opaque params from ISP driver to 
>> allocate and release ISP GART buffers.
>> - Moved sensor and MIPI phy control entirely into ISP FW instead of 
>> the previous hybrid approach controlling sensor from both FW and x86 
>> (sensor driver).
>> - Removed phy configuration and sensor binding as x86 (sensor driver) 
>> had relinquished the sensor control for ISP FW. With this approach the 
>> driver will be exposed as web camera like interface.
>> - New FW with built-in sensor driver is submitted on upstream linux- 
>> firmware repo (https://gitlab.com/kernel-firmware/linux-firmware/).
>> - Please note the new FW submitted is not directly compatible with OEM 
>> Kernel ISP4.0 (https://github.com/amd/Linux_ISP_Kernel/tree/4.0) and 
>> the previous ISP V2 patch series.
>> - If intend to use the new FW, please rebuild OEM ISP4.0 Kernel with 
>> CONFIG_VIDEO_OV05C10=N and CONFIG_PINCTRL_AMDISP=Y.
>> - Included critical fixes from Sultan Alsawaf branch (https:// 
>> github.com/kerneltoast/kernel_x86_laptop.git) related to managing 
>> lifetime of isp buffers.
>>        media: amd: isp4: Add missing refcount tracking to mmap memop
>>        media: amd: isp4: Don't put or unmap the dmabuf when detaching
>>        media: amd: isp4: Don't increment refcount when dmabuf export 
>> fails
>>        media: amd: isp4: Fix possible use-after-free in isp4vid_vb2_put()
>>        media: amd: isp4: Always export a new dmabuf from get_dmabuf memop
>>        media: amd: isp4: Fix implicit dmabuf lifetime tracking
>>        media: amd: isp4: Fix possible use-after-free when putting 
>> implicit dmabuf
>>        media: amd: isp4: Simplify isp4vid_get_dmabuf() arguments
>>        media: amd: isp4: Move up buf->vaddr check in isp4vid_get_dmabuf()
>>        media: amd: isp4: Remove unused userptr memops
>>        media: amd: isp4: Add missing cleanup on error in 
>> isp4vid_vb2_alloc()
>>        media: amd: isp4: Release queued buffers on error in 
>> start_streaming
>> - Addressed all code related upstream comments
>> - Fix typo errors and other cosmetic issues.
>>
>>
>> Changes v1 -> v2:
>>
>> - Fix media CI test errors and valid warnings
>> - Reduce patch number in the series from 9 to 8 by merging MAINTAINERS 
>> adding patch to the first patch
>> - In patch 5
>>     - do modification to use remote endpoint instead of local endpoint
>>     - use link frequency and port number as start phy parameter 
>> instead of extra added phy-id and phy-bit-rate property of endpoint
>>
>> ----------
>>
>> It passes v4l2 compliance test, the test reports for:
>>
>> (a) amd_isp_capture device /dev/video0
>>
>> Compliance test for amd_isp_capture device /dev/video0:
>> -------------------------------------------------------
>>
>> atg@atg-HP-PV:~/bin$ ./v4l2-compliance -d /dev/video0
>> v4l2-compliance 1.29.0-5348, 64 bits, 64-bit time_t
>> v4l2-compliance SHA: 75e3f0e2c2cb 2025-03-17 18:12:17
>>
>> Compliance test for amd_isp_capture device /dev/video0:
>>
>> Driver Info:
>>          Driver name      : amd_isp_capture
>>          Card type        : amd_isp_capture
>>          Bus info         : platform:amd_isp_capture
>>          Driver version   : 6.14.0
>>          Capabilities     : 0xa4200001
>>                  Video Capture
>>                  I/O MC
>>                  Streaming
>>                  Extended Pix Format
>>                  Device Capabilities
>>          Device Caps      : 0x24200001
>>                  Video Capture
>>                  I/O MC
>>                  Streaming
>>                  Extended Pix Format
>> Media Driver Info:
>>          Driver name      : amd_isp_capture
>>          Model            : amd_isp41_mdev
>>          Serial           :
>>          Bus info         : platform:amd_isp_capture
>>          Media version    : 6.14.0
>>          Hardware revision: 0x00000000 (0)
>>          Driver version   : 6.14.0
>> Interface Info:
>>          ID               : 0x03000005
>>          Type             : V4L Video
>> Entity Info:
>>          ID               : 0x00000003 (3)
>>          Name             : Preview
>>          Function         : V4L2 I/O
>>          Pad 0x01000004   : 0: Sink
>>            Link 0x02000007: from remote pad 0x1000002 of entity 'amd 
>> isp4' (Image Signal Processor): Data, Enabled, Immutable
>>
>> Required ioctls:
>>          test MC information (see 'Media Driver Info' above): OK
>>          test VIDIOC_QUERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/video0 open: OK
>>          test VIDIOC_QUERYCAP: OK
>>          test VIDIOC_G/S_PRIORITY: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 1 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls (Input 0):
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>          Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls (Input 0):
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>          test VIDIOC_G/S_PARM: OK
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK
>>          test VIDIOC_TRY_FMT: OK
>>          test VIDIOC_S_FMT: OK
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK (Not Supported)
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK (Not Supported)
>>
>> Codec ioctls (Input 0):
>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls (Input 0):
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>          test CREATE_BUFS maximum buffers: OK
>>          test VIDIOC_REMOVE_BUFS: OK
>>          test VIDIOC_EXPBUF: OK
>>          test Requests: OK (Not Supported)
>>          test blocking wait: OK
>>
>> Total for amd_isp_capture device /dev/video0: 49, Succeeded: 49, 
>> Failed: 0, Warnings: 0
>>
>> The media-ctl output of media device /dev/media0:
>> -------------------------------------------------------
>>
>> atg@atg-HP-PV:~$ media-ctl -p -d /dev/media0
>> Media controller API version 6.17.0
>>
>> Media device information
>> ------------------------
>> driver          amd_isp_capture
>> model           amd_isp41_mdev
>> serial
>> bus info        platform:amd_isp_capture
>> hw revision     0x0
>> driver version  6.17.0
>>
>> Device topology
>> - entity 1: amd isp4 (1 pad, 1 link, 0 routes)
>>              type V4L2 subdev subtype Unknown flags 0
>>          pad0: Source
>>                  -> "Preview":0 [ENABLED,IMMUTABLE]
>>
>> - entity 3: Preview (1 pad, 1 link)
>>              type Node subtype V4L flags 0
>>              device node name /dev/video0
>>          pad0: Sink
>>                  <- "amd isp4":0 [ENABLED,IMMUTABLE]
>>
>> Please review and provide feedback.
>>
>> Many thanks,
>>
>> Bin Du (7):
>>    media: platform: amd: Introduce amd isp4 capture driver
>>    media: platform: amd: low level support for isp4 firmware
>>    media: platform: amd: Add isp4 fw and hw interface
>>    media: platform: amd: isp4 subdev and firmware loading handling added
>>    media: platform: amd: isp4 video node and buffers handling added
>>    media: platform: amd: isp4 debug fs logging and  more descriptive
>>      errors
>>    Documentation: add documentation of AMD isp 4 driver
>>
>>   Documentation/admin-guide/media/amdisp4-1.rst |   63 +
>>   Documentation/admin-guide/media/amdisp4.dot   |    6 +
>>   .../admin-guide/media/v4l-drivers.rst         |    1 +
>>   MAINTAINERS                                   |   25 +
>>   drivers/media/platform/Kconfig                |    1 +
>>   drivers/media/platform/Makefile               |    1 +
>>   drivers/media/platform/amd/Kconfig            |    3 +
>>   drivers/media/platform/amd/Makefile           |    3 +
>>   drivers/media/platform/amd/isp4/Kconfig       |   15 +
>>   drivers/media/platform/amd/isp4/Makefile      |   10 +
>>   drivers/media/platform/amd/isp4/isp4.c        |  240 ++++
>>   drivers/media/platform/amd/isp4/isp4.h        |   20 +
>>   drivers/media/platform/amd/isp4/isp4_debug.c  |  271 +++++
>>   drivers/media/platform/amd/isp4/isp4_debug.h  |   41 +
>>   .../platform/amd/isp4/isp4_fw_cmd_resp.h      |  318 +++++
>>   drivers/media/platform/amd/isp4/isp4_hw_reg.h |  124 ++
>>   .../media/platform/amd/isp4/isp4_interface.c  |  832 +++++++++++++
>>   .../media/platform/amd/isp4/isp4_interface.h  |  144 +++
>>   drivers/media/platform/amd/isp4/isp4_subdev.c | 1047 +++++++++++++++++
>>   drivers/media/platform/amd/isp4/isp4_subdev.h |  127 ++
>>   drivers/media/platform/amd/isp4/isp4_video.c  |  797 +++++++++++++
>>   drivers/media/platform/amd/isp4/isp4_video.h  |   57 +
>>   22 files changed, 4146 insertions(+)
>>   create mode 100644 Documentation/admin-guide/media/amdisp4-1.rst
>>   create mode 100644 Documentation/admin-guide/media/amdisp4.dot
>>   create mode 100644 drivers/media/platform/amd/Kconfig
>>   create mode 100644 drivers/media/platform/amd/Makefile
>>   create mode 100644 drivers/media/platform/amd/isp4/Kconfig
>>   create mode 100644 drivers/media/platform/amd/isp4/Makefile
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4.c
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4.h
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.c
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.h
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_hw_reg.h
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.c
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.h
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.c
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.h
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_video.c
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_video.h
>>
> 


