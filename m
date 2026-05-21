Return-Path: <linux-media+bounces-62499-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMOuGtQQD2qSEgYAu9opvQ
	(envelope-from <linux-media+bounces-62499-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 16:04:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 341F45A6BF7
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 16:04:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3282B32C1617
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 13:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E83C4284693;
	Thu, 21 May 2026 13:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4m0jxaQI"
X-Original-To: linux-media@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010011.outbound.protection.outlook.com [52.101.61.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7E62D7DC8;
	Thu, 21 May 2026 13:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779369305; cv=fail; b=jkGfA4FihL0WcBRj1wb8hVotA3dtrRqv9Mx6pgIlHkwcGYUb8ZwZlkH+KPkgCAfsBKmRxNyNuOWfZS0m2NaYDoFECuNJPTdgoswPkXbPDnFviuTUVisaYx3PCO73esrNQUbZ4afVuy5/+7UUzdF40Mwn4otvjgDeCxmxv02Tu8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779369305; c=relaxed/simple;
	bh=sch0nJwjvZt8qkdfz9mkSwYtvb8yvli5rZC76DUd+Ko=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CInyTCLxBM2J7FCHHLQ6aY5Ba3F7sjQRWeLoLTXPbsCbYvhoJ8wpGzY+DBB9+lbjhy/3BewOCvoAfebvjUzcU6vlLAcphWGJTv7gYPwDt3qO7DLyBAH2k6O9X3motgPGn5PxlrGAWVJ4nZMn05NknyCXUq4yxBHRUID88rQromo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4m0jxaQI; arc=fail smtp.client-ip=52.101.61.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VEFhM1U6htEYqlf/4N8kLEupZ86XIZ8A+w/7VWkLPQvMcfk8fR5aAM4raZ7jpWHXLCECeFZuE5doWRfc0gexR2bi+YbtlSy/iiYeoHzqatKosn/eisDnsGFROCVdlB0/j03azi0nf5X46LFAXpwdLiCT1s/gs221wi7nev/bm2GmlmBFF/rtU4goKilOu07+zXwxebanUIk9g2d+05mmwe4zHp4ZQKJsDDLeDtzUNtR2GjMbpIhHC8KJHDl/ZZC/utt4+1VCnzmgcUUmRFojfg/ddr/lCQQek8S1rV38LnuAuob99OfmETYMrHNf5cnQFtdanoY0ZXcKc4kvYiMIqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y0eUWRO1OC1fxvLh1MsspTmWYN3L2CPXYktb1HDGFbw=;
 b=L1Bhvg2e8cE6e/RK1XVdBMH14SBao15xhbzzRrfyCkItCmQgSLuLdXc0+GYOYtMfpfUH5tVIWg2tBHj6y5KeszAXcCw7mmmeT/02nQr/FnGiAYSySnwl0BS9nDYxb42hhxKtchAxVdb7pAPjEkzK+B3gGPyYr9nSRWZ0+p4TX/v5WdoZUHdBb+vdXAGYZHj/oGNc1z3P9G83AlkG9mqXqkDj954Egedl/QVl71tto2f6/gWDPV1cttzWGS5Cpz6nI8i+9TgdY6hnqLeC8LCjIwRwWw2/pbUN8IVchKHBC9nfyIXkWS57JOfombuscZiKD2cB0WaYwCqmfDJ4wJTrkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y0eUWRO1OC1fxvLh1MsspTmWYN3L2CPXYktb1HDGFbw=;
 b=4m0jxaQI8QivcNu2g+nTOkJGOAM8/7Jtj/0CvTSFd1Q/VoqIfyjclxohlqQ+dNxPnh2jf6h22cGAR2pk2VOr8hhANYBtFM9GVktj8ZYhJ2WVwBef5Itjf1Ocmiu8ywpBP6UBbLW25gODIB3X+Rx+hDRd/C/eEHsxWbF9p+6OeKE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB8884.namprd12.prod.outlook.com (2603:10b6:a03:547::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 13:14:58 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0025.022; Thu, 21 May 2026
 13:14:58 +0000
Message-ID: <e4fe1485-3b66-4f99-ae8d-18db140d3fa6@amd.com>
Date: Thu, 21 May 2026 15:14:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] dma-buf: add DMA_BUF_IOCTL_DERIVE for
 reduced-permission aliases
To: Albert Esteve <aesteve@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>, Shuah Khan <shuah@kernel.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, mripard@kernel.org
References: <20260521-dmabuf-limit-access-v1-0-26c01e27365a@redhat.com>
 <7b662fcd-3bcd-40a2-b014-d9ce36f6425b@amd.com>
 <CADSE00J1+V4=qFZPOL8Cr8hYw6d=hf_XcDPezjYGkcxAwLYGyw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CADSE00J1+V4=qFZPOL8Cr8hYw6d=hf_XcDPezjYGkcxAwLYGyw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN0PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:208:52f::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB8884:EE_
X-MS-Office365-Filtering-Correlation-Id: b38c75c3-73f7-49cf-9089-08deb73af4db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|6133799003|18002099003|22082099003|56012099003|3023799007|11063799006|5023799004|4143699003;
X-Microsoft-Antispam-Message-Info:
	cg7RC4wL3qS3mp0K5O8yCrJ7m2TmCy0fWakN77RaDswniE9GOUg9PaMzCeoa5CY6TSlXZWwwiUiAzgOvDbgXZW6P80KzsbQ1aIDjygPpLh+3EzoOFA713nlobrCYHOeuegvduRsqCJtwMtVUD4ZdCLWh+r9cCvvcxjeHdA9R7isJxHMOW2ksVZV3q0MuwDsX4psYPTEUy8+s3oJ7EscgVFgLOLNTq46aW8KuCyCEEmCOuB7+I3CxziSqPB6wSVYFRIhkgpD1bzyYafizxXJHFFgBPHRBQgLghZujBrepVqHijxHxB9FdcXb3XidBm1GBH7GvD7TE9bgYOq4bFhv0N5FQcnX58yiLQJoRKmhtKjMYYkRJLeSZHfqNYChwyOd19qT5V8kXwla/a6tuhczGARi5Bb8ePuJ5tpwsChDyGLTL4DRc2YJaLl3n6/3MKHHBGoUzDBi4EBR6qavaftYNN/WGvxjktLK7opppl1MWQbIqRA708cixJqvSTz1oEhQt4gVcdMutTmBqzZ+ov59n6+8aS0cZtaf1pQchTX1g4zLsV2wTg0B/SuzD3Mt6At7RXQbBOSQn4YsbRgfTKYJyIEqWSMhYxkmhv85M+K2f1alMxWv2Hq+j8H+p+B8urXm931EvaGAOQQ3O7MEpTRv2eVeclAS5/Jh1/O97mvi4LjFB1j2upi+XQvrsutjGJ/X5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(6133799003)(18002099003)(22082099003)(56012099003)(3023799007)(11063799006)(5023799004)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzRRTXFqVDd3dE9NY25qRUl5cWtnK1ZVSWdZZ1E3WXpsc0xKT2xJU0tDRldn?=
 =?utf-8?B?K0ZGVkRaQ0doNHJqYTVOTGlDbnRXdEh5NDNpM2V0UEpnS1V1Y1J2eEpadXJS?=
 =?utf-8?B?VFc4VjNsbElyTnJUb3VybjFYYzliVkJUL05mZjhXcXREbHU1a3FtNlc5QXRh?=
 =?utf-8?B?YXNPWWpBSEJhWUNkN1VuR1RxN3puUnFldjl5ZmZzZzQzL2d2NG54aVRFTDNy?=
 =?utf-8?B?ZzFHbGszd2Y5VmY2MEkweHp2TjVSb3VmUUhONDI1ZzNETTZ5ekQ0MVlVVks2?=
 =?utf-8?B?MzBoejNnbmM4aHoyNXdySGlZQjQ5amRyZkxMcWVGZU5oNHdUWUdXRkZUYzNq?=
 =?utf-8?B?Y0pjUTlQblhDemF4VGptbmpyQklnNkI4d20yaUdQNFIrYkZ5S2ZvcDNDL1Jo?=
 =?utf-8?B?NWc4Njc3eDhMclI3dzVDRW05U1R4Vm12d3ZmZ29DTE9qTTllRzFtTS9UWlkw?=
 =?utf-8?B?VC8wUFJpUzdzSFJ5TGljRy82bFBIdTFsRnFSOG5uOVVaY1Ivb2xzSVlzcXpo?=
 =?utf-8?B?QWZWNkpWK0FEU1AzZDNuS21yTUVBZnlzcEEvbk1CYk4vNEpLcTNHbUwvajl5?=
 =?utf-8?B?STlVcVorMGVRYitkaHpPZXpMV1Z1KzVJUjJLcThBVytKckxnRjBSamVIS0hY?=
 =?utf-8?B?dFplblp0QjBKY2JsVll0SXRwWVY3cFpwMkF2YkltaUFYVm1MbTh3dTlaZ0ZP?=
 =?utf-8?B?UUdmay9PbXdOUzQzWnE1bGpySnhJNk5jeGFBSWxFNnpMbHprZkN1SENnMWow?=
 =?utf-8?B?akMxSlhLMzc3SjlFTjVPSGFOUisvZER1ZG5MSnRPdDEwa3dtOXU5UHoxa2lm?=
 =?utf-8?B?TTdRR0poSU51eXpCVWRLci90SHNvWWNSYlpPQW5NZVJsZmw2U0dHVFltN3gy?=
 =?utf-8?B?d1lRVGFPS2JCOVcxejVjRHN3Tk13QzhZMDNDM2g0ZU9ONlVvMmVTUGFjOFRz?=
 =?utf-8?B?c25uM3pzY1lKZkVlL2tnY0ZjeHJSOTcrZFlhc0w5SGdxUlJhejFocnBNellC?=
 =?utf-8?B?ODhTNWxDbFNiVHFoUDRlSlVsYzh3VDduNnZDNE1sOHRWc3J3VktzZ214NW9i?=
 =?utf-8?B?a0w0Znc3eXZkUlJQaGZUNzZIaXBlMlQyL0M4Q3ZjZ0dDSmhBOFRhdXZrZ3kz?=
 =?utf-8?B?dnlsMElycC9VTVlRcmlobmttQ1A0VkpFY24wTjEzT20wVnE0OUdOUVlybkZa?=
 =?utf-8?B?V09KWE40aThzbUhwNDZLOFUvWkZia0dDcXIvODEyQWZma0xYUWtMVkVTNEJl?=
 =?utf-8?B?WW05UmdhdWgzSFBSajY0NFROa1RWQXd4TFZkSVFGM2NMdnY5VSs1VXVjMG13?=
 =?utf-8?B?QWpmQ292K2FtRjNML0hOdTFPZnEzTnk3VmpsV0RCaU9UbGhDQ2ZZRjBJNkpC?=
 =?utf-8?B?Y1FHdWFlZXdSK2NvTkR5VWFhZ3QvZ2ozWGY3eEpmWk1iSnR5dGhtVXU2eWlI?=
 =?utf-8?B?MnRoMzdUVGdMeGFIMjVJRUlPNUhhRVJmM2VXY0RtUC9vWElBQThXaDVwRXFX?=
 =?utf-8?B?aTVDMnBQZjQ4NEFMTXkzL01UOE1xMTlaRVhVNVBnL3ovMmJOY0g2aHBIU2Nq?=
 =?utf-8?B?UE9BeTFUTHJ1OXExZ1NXYTdETGdUaHFhYTJRUk0zV1VHaFcyWkpnNEw1dHkz?=
 =?utf-8?B?QjlJcndBT0NVcE01QXdLK2NwWlBidFhQR1ZJa21DK2dGVkZrOXlGRU0xNVlX?=
 =?utf-8?B?NUF5MFZtQ3hwS25iVG5qeVkveVROYVJkYWtyODF6WFZZcVlSZnIvK1orVlFW?=
 =?utf-8?B?eUNuTkdvMU5yMXBhdHlwSnpoN09oNWR1TEU4MW5pZFhIbUJyc3Fic3hDVlE4?=
 =?utf-8?B?V2Nmc1lBV3JvWjhtcDZzeUNySVdaaGVvN2l5L01uYzl2elI2NWpLb2Y4YnJH?=
 =?utf-8?B?bHdHNTV6Ukc3aDNHOUhGcXQwbWdoYnYra0lybUJRa2NjZnJZcU1LQ3E5SnhL?=
 =?utf-8?B?VWVMK0V6MTFUMjczaDVIaVYycW9rYXVXdGRka0Y0Qzl1enEyR1d4bUp6ZXJX?=
 =?utf-8?B?VVJzZDVmb21qa3BWTTJ6N2t2MUIxN1NnYTRjczhJRFNqcTZEU0JGQjNCaFVn?=
 =?utf-8?B?S3J5NTFpamljMTA2V3pRREZhc2JVVmpHNXVDQ0VkWXlyY3BVUnZOeVhCWWJK?=
 =?utf-8?B?ZFF2WXNCdEVLdEsxZkwzMFJQNjNIRmw2KzFPNEMxYkQ2bkZOcTgwclhoeGtJ?=
 =?utf-8?B?RU9pZGZjWFZ6T2xjZE9tR0pVTXBHQ1ZZZUtRLzBvVWZhU0Y3K2hNb01jZFAr?=
 =?utf-8?B?b0xiMTYwTSsyZzMyaTlvOFBqc1M0dWRFak1za00xNTBXZGtXWi9wdExZYzF1?=
 =?utf-8?Q?WLoY2Pc4locIDoc8o1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b38c75c3-73f7-49cf-9089-08deb73af4db
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 13:14:57.9852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qRVK0i5/+7meDousmD2jW5Z1hyyIK0k1XH9+QIrTuDUXpGxDaQbNqozPKgNZayyv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8884
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62499-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,amd.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 341F45A6BF7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/21/26 15:01, Albert Esteve wrote:
> Hi Christian,
> 
> On Thu, May 21, 2026 at 2:28 PM Christian König
> <christian.koenig@amd.com> wrote:
>>
>> On 5/21/26 11:10, Albert Esteve wrote:
>>> When sharing a dma-buf between components of different trust levels, the
>>> allocator may need to hand a consumer a read-only view of a buffer it
>>> holds with read-write access. An example is a camera pipeline where the
>>> capture component writes frames into a buffer and needs to pass a
>>> read-only handle to a downstream processing component that should not be
>>> able to modify the data.
>>>
>>> However, no such mechanism exists today. The access mode of a dma-buf
>>> file descriptor is fixed at export time, and the standard POSIX
>>> interfaces for duplicating or changing file descriptors (i.e., dup(2),
>>> dup3(2), and fcntl(F_SETFL)) cannot alter the read/write access mode of
>>> the copy.
>>>
>>> One natural candidate would be reopening via /proc/self/fd/<N> with
>>> O_RDONLY, which works for regular files. For dma-buf this would fail
>>> (that is, if we were to add a new handler for open f_op) with ENXIO
>>> because the dmabuf pseudo-filesystem carries SB_NOUSER, which prevents
>>> the VFS from opening its files through path-based resolution from
>>> userspace.
>>
>> OH MY GOD! This is the like the sixth time I had to clarify that in the last few weeks, I'm really wondering where that is suddenly coming from.
> 
> Sorry! I do not know where others came from. But my interest comes
> from automotive, safety, and mixed criticality scenarios. I kind of
> hinted at that in the opening when referring to "different trust
> levels".

AH! Yeah, automotive is most likely the common topic in all those requests.

>>
>> Creating the DMA-buf with O_RDONLY does *NOT* make the DMA-buf itself read only!
>>
>> That's a really common misconception. The flag only controls if mmap() can be done read/write or read-only to handle cache coherency issues.
>>
>> It is still perfectly possible for a device to write into a DMA-buf created with O_RDONLY with DMA!
>>
>> So long story short there is not such feature as a read only DMA-buf, and putting read-only pages into a DMA-buf and then expecting that nobody can write to them is an absolutely clear No-Go.
>>
>> If we would want to implement a read-only DMA-buf feature we would need to go over all the different DMA-buf importers in the kernel and add security checks.
> 
> This clarifies a lot. Too bad, but it makes sense. I will abandon the
> series then.
> 
> Thanks for the review and the explanation!

No problem, I was just really surprised that this came up once more.

Just for completeness: What some exporters do is to reject read/write mmap calls with O_RDONLY and map_dma_buf() callbacks with DMA_BIDIRECTIONAL or DMA_TO_DEVICE.

But as I said this is just to catch cache coherency issues and not access control.

If I'm not completely mistaken some HW actually can't even guarantee read only mappings, in other words even if you say don't write to that buffer in the kernel you could submit shader or DMA commands from userspace which does exactly that and it works.

So I don't really see a chance for that feature to fly as general DMA-buf thing. Maybe between two specific exporters/importers could work, but yeah...

Regards,
Christian.


> 
> BR,
> Albert
> 
>>
>> Regards,
>> Christian.
>>
>>
>>>
>>> Alternatively, exporting the buffer twice would produce two independent
>>> dma_buf instances, which breaks fence synchronization.
>>>
>>> Therefore we add a new DMA_BUF_IOCTL_DERIVE ioctl, which produces a new
>>> file descriptor for an existing dma-buf with a caller-specified subset
>>> of the original permissions:
>>>
>>> ```
>>>   struct dma_buf_derive { __u32 flags; __s32 fd; };
>>>
>>>   struct dma_buf_derive req = { .flags = O_RDONLY | O_CLOEXEC };
>>>   ioctl(rw_fd, DMA_BUF_IOCTL_DERIVE, &req);
>>>   /* req.fd is now a read-only alias of the same buffer */
>>> ```
>>>
>>> Permission escalation is rejected with -EACCES. The new fd aliases the
>>> same struct dma_buf as the original, same dma_resv, same exporter ops,
>>> same underlying memory; so importers attaching to either fd see the same
>>> fence timeline and operate on the same object. Access control for which
>>> components may receive or pass on restricted descriptors can be layered on
>>> top via SELinux file:read and file:write permissions.
>>>
>>> A shared writable mapping (PROT_WRITE | MAP_SHARED) on the read-only fd is
>>> rejected with -EACCES in dma_buf_mmap_internal().
>>>
>>> Two small internal adjustments accompany the ioctl:
>>> - __dma_buf_list_del() is moved to dma_buf_release() so it fires exactly
>>>   once on dentry destruction rather than on every file close.
>>> - dma_buf_file_release() is updated to call dma_buf_put() only for
>>>   files that are not the primary dma-buf file.
>>>
>>> This may not be the best approach, but after considering different
>>> options and alternatives (as described above), we decided to raise the
>>> discussion upstream. Thus, we welcome any alternative proposal or ideas.
>>>
>>> The series is structured as:
>>> - Patch 1 adds the new ioctl implementation.
>>> - Patch 2 adds selftests covering the new ioctl.
>>>
>>> Signed-off-by: Albert Esteve <aesteve@redhat.com>
>>> ---
>>> Albert Esteve (2):
>>>       dma-buf: add DMA_BUF_IOCTL_DERIVE for reduced-permission aliases
>>>       selftests: dma-buf: add DERIVE ioctl tests
>>>
>>>  drivers/dma-buf/dma-buf.c                          |  58 ++++++++++-
>>>  include/uapi/linux/dma-buf.h                       |  28 +++++
>>>  tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c | 114 ++++++++++++++++++++-
>>>  3 files changed, 198 insertions(+), 2 deletions(-)
>>> ---
>>> base-commit: ab5fce87a778cb780a05984a2ca448f2b41aafbf
>>> change-id: 20260520-dmabuf-limit-access-73261353841a
>>>
>>> Best regards,
>>
> 


