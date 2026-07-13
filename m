Return-Path: <linux-media+bounces-67448-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FmZBCvGsVGoBpQMAu9opvQ
	(envelope-from <linux-media+bounces-67448-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 11:16:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7664D74930D
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 11:16:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=39SMAjIU;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67448-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67448-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CCA7306E888
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 09:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0B983DE424;
	Mon, 13 Jul 2026 09:12:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012066.outbound.protection.outlook.com [52.101.48.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF7A3DE448;
	Mon, 13 Jul 2026 09:12:16 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783933939; cv=fail; b=FPwKGkKQSceTjwchT4arXpklicrcWUeu1YCeAOGnSgythxyqnuKb9OO7YeHXn7lNmt9lUwIr0l95OH6kaM9RunHAzYwvKw0n6JzVpHa6VKjJAXiPt4n1gY3eAvws88VoV4Dc0OirtYAJJV6YaXKjT+g5MStoZ0cpzwNZ3yuHcHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783933939; c=relaxed/simple;
	bh=S4igBiFk1w4m7IdsR0CzsbzVLOtg2Sduezn0iL3OmMk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SNwaiMPvcqvchtFmfJdEDBhSVgnfzuWnuAyHZI/NRuY0tzJCgVAuJOE/ikVk2c5PonOqBcWPU0frgNle10zyxEY8v6W/UYz/X+ERPZJTDEmhO0mwEjn61+ESGYxwlsanzDyAWu3Vil0KiGSczq7r4VlWIWU4Ow/iUNQ5Ksz2avs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=39SMAjIU; arc=fail smtp.client-ip=52.101.48.66
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kQoOX0UvQB6pOeBRuoHbeoEXckxhFXn7zaHNZy6ZcJR9sfGhytOvXIgpDv1A4Mfahmn5yBV2dGWUswbAN37VhXBwo2keQVswl1z6cA7hS+CuVExzNxf/kemHaDqDvc6ISVbWqkkr4BSqV8sDPRnXy7QoPZUT67IeaABwQ86QuPB8/12h4bnBLf6D/3DYSAtMM+cx7YgloGsJ1WBdFqZMosNDNT/SkcqdZc18m0x3jfQPNp49J12RDZzZmw9dCmpzm0mHUlo1AflpPSeokZ78IUB1Zgt8XSt+qsUOjdLvD9Nqg3P02qWujoqah6e+rpHkXMWmvn4RU05DFxUBsdT5AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a5OisKXZ8skwK+ZctJW0bpqhS4WBrLYsv4F2aMyf15Y=;
 b=xLLJoqFZewUTuvhRH+OawOLm+omX9ghi7GD2ZktRZZB1oyChHJY/QlHIdRQRNbOh7RIYIBy99h7DSh6BbAsOCSmeGsJ0IvJB40FKlh5FHKOdvx5m9kkIKVpg5uYEfn37d6hqU5qSclX8DJZJmgjkCoosAUwYdoh0sD4pGxqJL7aVhZH4LqLR6H8OTr34HA/EGaFx+jP64WklHHxobYVr4o/GwGbgfLfRU3ksOq6gvQOliMrtaJBqIZSmC7uLbeZB9yzHliQvJZrjaTktlGxoboNMvhwFp0DHwoCKIJOqEQxEPhlAYMUvUFYxnKP5yFszHfJBBn2DXSijBHwIjkE4BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a5OisKXZ8skwK+ZctJW0bpqhS4WBrLYsv4F2aMyf15Y=;
 b=39SMAjIUBm9F/4ijyBpS2pkFlC35Vjug9TtYCl5jyuvcNUvKcagFbur6mFpdmLsaE9UnstbKZByKOEb+rng5k8WSZTNe9JzsnBV1U7NLIIOM3u8MAR1Odcb3hd/H3StG3+USUtqytNvDhf110IHFvTHY/zW+QJxNbPlQ2my3Gps=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB6973.namprd12.prod.outlook.com (2603:10b6:303:20a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Mon, 13 Jul
 2026 09:12:13 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 09:12:13 +0000
Message-ID: <6764ca6f-b4d8-4baa-9d27-2ca867ac2d41@amd.com>
Date: Mon, 13 Jul 2026 11:12:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] dma-buf/udmabuf: Introduce
 CONFIG_UDMABUF_SIZE_LIMIT_MBYTES
To: Robert Mader <robert.mader@collabora.com>, dri-devel@lists.freedesktop.org
Cc: Sumit Semwal <sumit.semwal@linaro.org>, Gerd Hoffmann
 <kraxel@redhat.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
References: <20260711144814.8205-1-robert.mader@collabora.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260711144814.8205-1-robert.mader@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB6973:EE_
X-MS-Office365-Filtering-Correlation-Id: 79504d0f-27b5-4d7c-81e2-08dee0bed357
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|18002099003|22082099003|56012099006|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	NS2gbIw4Y3OoeeCmPgTxsSlTP6HMcbMX2/2BQ8DEqX11VRoZ6DWLbk/To+BOKyMat8tMHd0TIfZcCV73qlzGBWzeAAttvPW77A+/nUvFT/gHgRv4GLUqtCsmNcip+EGXG5Eq2JKBeStnCp4a2mrgVBHVmyWlUeZ9jHAoA8H6iMGHK2J8ESgr7Fy0Pki/n7Gee/mQOuKf81zq/MP3YFPhssHWi3Ap/mxWnrwt9dPrczhUJv15zA1GoKJ91IAlvTRD4nt3Xc3su8gjjcW2P3Whqao9VIRxv1Tlzt9JSXB7I81th+Ka2yi1DJlp8tRUXEndkpYfGfAee2b/Rcj/CrMBM7punOxJAd45Of/Q8xSzJD3yF01gmYEgfJP1PmWNLfGq2bkBcuysV4KcyKGw6E1Q3ZCPVO478qaGXFeq5NrEEsEa2zhLhtlFgvjjfiuLuYM3/4V31xq/QrR0AwHN3yktxmT/OZsX++1nMR/HdC1TUHAnYprhHlRkvno/ALVOnMzv28RIVi2Id0Q5jU501voIhl9EGOg63bwI0abpaoQp5+XlIBO2sNtWNlyfc3JGTc+Esu6VjY5HVsehfEhVKOal162xhVM1scg3op1rmNfNH7kdL4duPmFxdIVwksH5VkLSWVpYZiy94bZmssfik4LroUy8y+vuqUJMgvPsrnxS42Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(18002099003)(22082099003)(56012099006)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWxGNWZtUU9FSmtEM05wUXIvTGdPaGdaa3NlSk9OUWswYk5GN05NRE02djZj?=
 =?utf-8?B?bXdhQmRudjA4Um5LNXROZHkwVEEwMUcwcEVLcGNXMTk0ajRQZEdkYUZQZFh3?=
 =?utf-8?B?YnZBNFg5UHdQcTZ2SkVHZDlQUEdrdlV0a05KMjkyb21oOXpmeVZ3OXcvVHhw?=
 =?utf-8?B?ZjFkWmpaRWJIZG5DSTNIbWE5SXJIenUyK0dMclVjV09VWnJaOG4xRE55YVFr?=
 =?utf-8?B?am93SjBOMjROYzZaUG9BY0poZmJKM0Q1c1YwbG4xR1AzdU80Qk9rMUVhMTZH?=
 =?utf-8?B?enVvQjliN3dCbFBGV0RtcUFxUEZVUEsrUjArbVV4TWV4b2xRYk5IN3dJdURO?=
 =?utf-8?B?Z2orVDI2eGt3Z2tiZEtoOHRYWm9PUzRlc2pUaGlIcCs4TVNGUkt4MHFHYWJH?=
 =?utf-8?B?VGo0QkFFWTNOY3FORDBjV2hNS281VTF6RGFTWHVqMndVdVkwclIzNjgzZUZQ?=
 =?utf-8?B?NDRRTUFWbkFmTVVmSnl0OWMwS2NkN2Y4K2FXZkgxSFZkWXczejJDYnRNVUpY?=
 =?utf-8?B?SmdSSGIxaVM1dGNxUHd5dERPTzVGaStNWnBYcDgrek9rN3ZUclNmQ09IUFJq?=
 =?utf-8?B?QUxkckdCR2ZhcEZVbUh3V0didGZDQkVHWi9FRnV5QnNPelVBR1UxMUlJaGhn?=
 =?utf-8?B?ekFhM3JmWDNhTG5CU0N5bkx2Q2RKcWVseG8rSFhTNnJaMVYvTWtTVDJsalds?=
 =?utf-8?B?S3M5aitFU09KclAzS09kYllURmU0bEp6VHg5YjlhbGtodk1LbUx4NGZsTzdy?=
 =?utf-8?B?SEk2ak9seWdZRVNPVkVubFVMb1ZOam12U3FaRzE3WlEyVk1EV3VkTkFlQlYx?=
 =?utf-8?B?MWhHWnpNMlIyWm9FajlqWmtlRmtIOW9MeUdzSXcyeURUTHBxaTJPaTF4WjU3?=
 =?utf-8?B?SXptQ0ovUHlTN1doV3VFWUhJalVtKzNURkVkRnNtNEl4UElIWTlaTFVwTy82?=
 =?utf-8?B?MithaXJvSm9ubUJTblBrMVZpL2tKanVaa2tJMklYQ2hqU3JmaThyaFlHbVRy?=
 =?utf-8?B?YVlzaWJFMUs1QWVhSWxBN1AyMStoSHBlTEFkSXhud2NMRG1IMmw5dVMxS3Ir?=
 =?utf-8?B?NjJhaUIxb05DSWVtQTJZTVRSeWthSGtYOWsvMUxDU05vMENvVGtxQjBSVXZq?=
 =?utf-8?B?bVR3Rzc4d1p3ZWlzKzZFb2FoOStDOW1CRExQU1plbWhIZ2NSSm5lVC8ycmJ1?=
 =?utf-8?B?NElPdzB1YUhNYmV0R2pPYkNFVVFvWkhUWU9ETHd1VWJKbUg2c2tpUXpTa2lw?=
 =?utf-8?B?YXJPdXN2TkszVmQ2Q2VIZ2lKQ2Q2cWtReEcwN2Q1OXgrd2IxOHlWVGp3N04z?=
 =?utf-8?B?WVBkdWwvZkJPeWtZMFRtQUdyZk1ESmtzNW91T3MvdnBxbUxIdS80aXdLRDVy?=
 =?utf-8?B?bFpSSUJxa2hjM0hFYXpFNmRwcmFhSy9mNEtFallkeDBMVEQzczVCZzdzL0kz?=
 =?utf-8?B?YWtBczZDbHh5bURTb3RxZUFPU1I4RWJMREpqc25XNlg5WTBDd0R6dmZlbnlh?=
 =?utf-8?B?d3lNTzVJZmdiZGR1MjJvQ0RDVHZiVFpMUHFwc0RnRjRVdzlKWUdMWHIwRm1k?=
 =?utf-8?B?RXlnT3pRQnRWc09FaEdRMkdCOW5wWGJUeUdQZFRYZFhZb2NKem45MFEvOGpz?=
 =?utf-8?B?YVFpWTBxNXVDRGdwVVVleFRwamRZZVZxemJURmtzTzE0MGpzZ1JmWVNGWTdE?=
 =?utf-8?B?ZFp1QlI4Mmk4K1R2RnlDci9LSlFpR2ozbE52UnUrYm1Ib2o4MnlmNE5hUlR5?=
 =?utf-8?B?bDZUOWN6TGZ6VTNneFZXcXFVSkpmaXg5OFhtYlhab21HYkEramQvNS9obnEx?=
 =?utf-8?B?QXRnSGI1MHJidFh1MnVsZS81QStQZHhVTFcrSHlIQzNUOXRTL3JkVTVYOEYy?=
 =?utf-8?B?dzVDVUM0QzVBV3liVzZKdUNQa2x0WDFjaENoYitxa1lxbGswWXhCSVQ3WVlO?=
 =?utf-8?B?QXNXdnliZVoyb0JLNHZPdXI3WlY3MkduWEhrRkVmcmJqRlpWdVpZMVhHL09z?=
 =?utf-8?B?aFI4U0RXSUk3Q2pNQXM1TGE2ZjlQaCt3dGVOaGphYkJXY203Ums3WEVOczE0?=
 =?utf-8?B?LzFqSm8xQ2RvU2J0RlRLc1RZbi9pUTd5T1B5OXAzN3BwV0s4SFB5TlJSNEdj?=
 =?utf-8?B?N0xraFpCMnlwcittMERERit4K3BGUnpxY0pqdXlIQkFLdUZQTUMrYlh3QWpI?=
 =?utf-8?B?aUZjN3pDTXBNcytwa3QwN0xNNEVsVTJTamh5UlhzQzJkby9XUjE2VGFkSVNo?=
 =?utf-8?B?S3FQVzJPUFFUMVQvSGh2UjJHR0NFSmY5NFNhL013dVVNR2NSWnByalRyRGEy?=
 =?utf-8?Q?jXdyzrHXkBDAgWtBt6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79504d0f-27b5-4d7c-81e2-08dee0bed357
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 09:12:12.9252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OSLc2dq1VJxodvlZaWsCQKaYZvQKb7Zlzwa5PiJH8G6jeY0hBjk30hXyl/fuHGY+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6973
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67448-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robert.mader@collabora.com,m:dri-devel@lists.freedesktop.org,m:sumit.semwal@linaro.org,m:kraxel@redhat.com,m:vivek.kasireddy@intel.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amd.com:from_mime,amd.com:dkim,amd.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7664D74930D

On 7/11/26 16:48, Robert Mader wrote:
> As udmabuf increasingly enjoys popularity - being used in projects like
> libcamera, Gstreamer, Mesa and KWin - users more frequently encounter
> cases where the current default size limit of 64MB is too low. Examples
> include allocating video buffers at a 8K resolution - and even 4K is
> affected when using non-subsampled video formats or high bit depths.
> 
> While the limit can already be changed via the kernel command line,
> exposing it as a kernel config makes that easier and more discoverable
> for distros. Thus let's do that.

Well config options are usually only useful if the value can't be changed on runtime through a module parameter, but that is clearly not the case here.

On the other hand I do see your problem. I would just vote to disable the limit by default, there is nothing preventing userspace from allocating multiple uDMA-bufs so it doesn't seem to prevent any security issue or similar.

Regards,
Christian.


> 
> Signed-off-by: Robert Mader <robert.mader@collabora.com>
> ---
>  drivers/dma-buf/Kconfig   | 6 ++++++
>  drivers/dma-buf/udmabuf.c | 4 ++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> index 7efc0f0d0712..35f0779cdc80 100644
> --- a/drivers/dma-buf/Kconfig
> +++ b/drivers/dma-buf/Kconfig
> @@ -40,6 +40,12 @@ config UDMABUF
>           A driver to let userspace turn memfd regions into dma-bufs.
>           Qemu can use this to create host dmabufs for guest framebuffers.
> 
> +config UDMABUF_SIZE_LIMIT_MBYTES
> +       int "Size limit in Mega Bytes"
> +       default 64
> +       help
> +         Maximum size of a udmabuf, in megabytes. Default is 64.
> +
>  config DMABUF_DEBUG
>         bool "DMA-BUF debug checks"
>         depends on DMA_SHARED_BUFFER
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index bced421c0d65..a83153326362 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -20,7 +20,11 @@ static int list_limit = 1024;
>  module_param(list_limit, int, 0644);
>  MODULE_PARM_DESC(list_limit, "udmabuf_create_list->count limit. Default is 1024.");
> 
> +#ifdef CONFIG_UDMABUF_SIZE_LIMIT_MBYTES
> +static int size_limit_mb = CONFIG_UDMABUF_SIZE_LIMIT_MBYTES;
> +#else
>  static int size_limit_mb = 64;
> +#endif
>  module_param(size_limit_mb, int, 0644);
>  MODULE_PARM_DESC(size_limit_mb, "Max size of a dmabuf, in megabytes. Default is 64.");
> 
> --
> 2.55.0
> 


