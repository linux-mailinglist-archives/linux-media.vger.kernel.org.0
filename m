Return-Path: <linux-media+bounces-65560-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cRdrCiPVO2qwdwgAu9opvQ
	(envelope-from <linux-media+bounces-65560-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 15:01:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FDA6BE5F4
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 15:01:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b="Tt/QJyM2";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65560-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65560-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A2E6C3078734
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 12:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FF533B1022;
	Wed, 24 Jun 2026 12:59:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010039.outbound.protection.outlook.com [52.101.85.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472ED3B0AC8;
	Wed, 24 Jun 2026 12:59:07 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782305948; cv=fail; b=pSWEZO0rejHvhuF8afxKnVDNg9NY3rihTPLudZl991+podoYpYbd4UV3b59x5KS9GaHvF9bXg8Itww+s+gmYmzijdAMF2pck092YXlzywjg2g40cHR1FivTD7dZoS+UlwVEtOiXehiolsGEWuq1fFVVcshDwLCr0byVvWJD4ZsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782305948; c=relaxed/simple;
	bh=2R8GMObmae7avGJyU2eiX30kC4SX/YKfICsUWZLyQFQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ikIMb4CF7sa4+Qkonyv1tAM1j73i8hTBMGoyFRafdXM1Zuf7asmyneR7TGqt5HB1m7Wnlxov4VOPmw42qwGEDqvUc8raMKjN2sHeNRr+VW4uQcm2E8neT6EsEqcaqWUeRBpXDZkEVWZHdAyAQ32lq5ltgEFDm3TTlBwetn2sRsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Tt/QJyM2; arc=fail smtp.client-ip=52.101.85.39
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kdESwiy6jHovJDZXuGDhYfNGdcnGjUtxilBXh047D45TMQf/v9+rJQ7rFHBkdpNHsZYCiZJnQvZsqNf0gKB3JlGSiJ8zm1TwHxl4UTvXE3mJdozER1vJaIKfcFbZucxzx4JQkcGE4tnYHGCOQD0sREhAOR8AhJOV0Rp9T5DJFKY/W+z7WJz3XrtDE1V+BdQiwDy5eHch093dDol3ut75npRM4HhrVryYhmz71H/qGk6xZ/UuUSRB0QteVnjl7r5Cb0sgMTGX5uV5pmvNjGpjRWieqiz4DNPz5uNoXmjRk479UvM/JoGV65LmOMsReRYrDrSSHfZSkeb4CztGPz6RcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJppoXQAoYTUP4HMyRsm+2YDBAuqmMjmNvjTl1FddU4=;
 b=L9c6GAg1kY8VxZ04cyR/NY+1DpoIvJwAWSXtBkM2zRbcGzmOZqc+MAu0kCFrCqJeKoEO7TAbERXJ4URXF7RKb7G7LCGkFNLH3qbW9xsZv+O8tB0Nzx381kTbuyXaCLwAjCCFevCkiYx4lwf59ZBzwucmIcdWtiiotVLoz7ldJzMF9vr+pLQ6b2iYTwE8AXvBIUGINmoDRtxOO54OQaZ4OnyDzd2Rj6rQwmtcjQyPWdKQG/QLjrXHyu1kRvsXOTLRCXc815f12tJlp0dJXi4rdaQvrIl1jA5rAF3Hw/N72HMpYMGU4ES/scRyB/CYwZECwNgmdMk+dEaCdBp2g5eLKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJppoXQAoYTUP4HMyRsm+2YDBAuqmMjmNvjTl1FddU4=;
 b=Tt/QJyM2I9hN6yhF3HhC56hX+aHTIFxZYkjjbqmF39MahVcnln7U2fFKsQ+xHA5fellpR5Or0nOiFyLsHMRS2V3T0mPF3+M7zdGOPvbqHVjo7lCZicmJy9zTp+XGUwWE3RlP36BmGx/Ldr1KMwX8UcWKvv/b05+BM2B/QP2NKMw=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA0PR12MB7505.namprd12.prod.outlook.com (2603:10b6:208:443::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.15; Wed, 24 Jun
 2026 12:59:04 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 12:59:04 +0000
Message-ID: <06bddfca-d868-4043-ac6f-28ca103fff02@amd.com>
Date: Wed, 24 Jun 2026 14:58:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: udmabuf: avoid list copy size overflow
To: Yousef Alhouseen <alhouseenyousef@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20260624125242.11232-1-alhouseenyousef@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260624125242.11232-1-alhouseenyousef@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0154.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA0PR12MB7505:EE_
X-MS-Office365-Filtering-Correlation-Id: 246ac506-51dc-4139-0274-08ded1f05e4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|22082099003|56012099006|11063799006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Oxsh6Kv1vfm9AzD5BbeCL9Q8xnE7OET/buWFJ0cn//NoEwSFZBELy1wtDzfm/A2x/w9sfT9tSvO5R2tQYS4COL+KBUcddxVo8DbaINq4V7C5kPe09tj39icKvaih1RIJ45Db8shyQMXSNrLy+uH9QBHew378mMznJzo6HkQ1vKlmctGw0tV15YL/Zh1XpAN/RV/aGCqD1hWQ6vsWN+A/4WRvD4W0hLFNSdO98/dYBoizvoaUSBqQCSgCMJTvW46ebZsk20gnw4d8zi8KVxWsy2tzXsiGTxcDzJj5D+DuqxqnkLV3x0HS8ezJOlDF1hscGfVENRa+nnCluEmebNI8dyVqCrTvPDuXQ3a/GaOYw884HIJRGY5YsllEhQKllDSZFLXcHcH3jWIsdhs7GDQqn/p/VB9MXWyCJNPVDE4kTNLIsuDE0svA3bRMRE0YfkOpUQDWIfW0uTTWvyvU1UeydmuokWAfVpMatgJiWOa1Eh3WXS4ttvKCQKjtFu1wNfgnmGArydMrkpvN4Jymegk8eRgP4CIDUDzsOFcCVVQM11idH0qoVEuJP1tFDZLEknC+UpnVkFD2OGTTpQUd6auIfDRXxnyoTpgcJSq6gBdRX5a226X0UEBAVEqI/WVkrKFVokrZ+ENiXJJYzQUfemZo9fYPIqzdjTe0WtifrbyC1JE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(56012099006)(11063799006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTAyMXZldG5JNURvU1VVMm54NlkyZHZUUFZqbnVoWmE5a2RRUzRNdmtjMytu?=
 =?utf-8?B?K1hIYy9JOGlzMDNCMFJUdUxPbWtpdE5jeEVUOEVSQjBEbzZxVEt5bS9BV0g0?=
 =?utf-8?B?NUU0ZlFzNE01Mkh4cHFzU1ZqYTRQS3JGRVY4S00vaVY2SldaYkVDUmdEOVQ3?=
 =?utf-8?B?UjBnaDNYUmtpa0JyWUdxVWU5TGdsbi9NV2pTMzBOYjVxNHpCamRaV0xVQWU5?=
 =?utf-8?B?L3JCNE9Rajk3cUpsR3hKelc5K3BPVVBoRnMwQllFMVhnMTZITlFoWTFLUGIw?=
 =?utf-8?B?U1VzYmRRUzBlSG53L1FVZnFWa2dYK2FpZWgrNEwrOUphZ3RsbFMwRHFLdlRp?=
 =?utf-8?B?K2hVYndwaFRSMXNKKzBRSEVIMUNCU00wVFJZbjBaMi9aMHVGWldaMW81UFVP?=
 =?utf-8?B?c1dhV0QyZ0RGeUNidHpROGN3OTlYd05oeVdpMTNGWE0xVVBTUHlKWHQwSDJK?=
 =?utf-8?B?Q1VVWjBFSGhTRHhyRG4xdHdhemtwV2pPMW5mMytWbm9wS2V0NWNCVjNnYmJF?=
 =?utf-8?B?Ym85ZGxkMjFPdVdoY0xSVDlBOVZwUHVTUm1YSExNSTFPMkJFSmRZakZGbFcw?=
 =?utf-8?B?Rlp3WDhpWCtlVXEvbktmVy9sTi9JS1lSWTIwREdNU3hldnpOOHU1c3hCbDFS?=
 =?utf-8?B?dGIwVklla04vSTB0T0FlY3FzTjk2RnpQL1hVd0lSNzhuSUlhUTVhWk52N29z?=
 =?utf-8?B?endiL0RuVTVIWVAwWFI3N0pJRnVaS0tDVjByanJibGtnenJ1U1ZRZDlOa3ZC?=
 =?utf-8?B?Mm1nS1E2SHpGMU4wS3hwTHo5WEl2YUpmV2RUV3VBMGVxdlg2OTZPVmcvUmdt?=
 =?utf-8?B?RklFbUNuMVM1cWw0NS96WDdmazcxeEt4OWZzZHBUdHlUTlI0N0I3UnJnMVdP?=
 =?utf-8?B?M3VkZmN3UVpBdFdIWkRUNnA2VWxvWTIxSTFkejFJbFdpUEozV1NHUWdVTGFN?=
 =?utf-8?B?Mk9mMUN3c3htVjYxNHljb3dRSXlPQWdoUkVJcDlsTGxnd1NoOWVyWlB3MWVR?=
 =?utf-8?B?akxFRGdodDRZY0RBWHlpVzlrMjRlREtFZ3dhME9NT0pxMTdmVW0vVXdvb2Yx?=
 =?utf-8?B?RVYvaGJlelBJYTJza0hqNkhxNWM4QjJ1N1hTZjNQV1F4SzFUTTFqRnZmeDJs?=
 =?utf-8?B?ekxnS3pnS0QwMG4rYnJ6aktGV0ZETVAwZndySXE0UHRiUTVsVlRpS2lwWFRO?=
 =?utf-8?B?Q0IzL0VrQkV0WDhZWGR0SHBqamc5S2svMnpiTVQ0TnJPOVZQQlVONWZxRTAr?=
 =?utf-8?B?cEt6UUNFOENVNnFxNjl2VmxDQW00V0JIUm1iMytFRGYvRHZUTXZHZE5iZnhS?=
 =?utf-8?B?cm4vb0FMWnF1YU1FazNqUzMvYXYvaG5LOXkyNnlNT0hzU0FMVXJEM1kybkt5?=
 =?utf-8?B?RTd0R3Vrdm9tRDd6dS85MDg2akZuNm4rRnpPbHc0bGdWSVdaendxcjU4S1pL?=
 =?utf-8?B?V0FWRmZDODBSSUd4Yi8vUktlSUZ3UndiTi9aNVpnNW9QYTV2NW9Nai9WWWlF?=
 =?utf-8?B?WFNhdXRDVVNVRFJBNWwzcjhWVnRzTFQxdjZOQjY4ckJZZkVlb09XUVhnVFV5?=
 =?utf-8?B?b2JKVG9IWGMrY1Q3Q1F3Wlc1NStoVk1SaUJJcGw2U0VCMjQ1MUU3UXF4Y293?=
 =?utf-8?B?dEM3dHB4eW9jT2R0RGI0S2lRbXkzRHBwOHZyMkw0R0UyQnpueFk2VXlsNnJZ?=
 =?utf-8?B?M2ZVVnpUQ3pMcmE3VjNLUU45NXBkd3JCd2tTUDZ0TjRLWjVCaE5lbklXeVBY?=
 =?utf-8?B?b2hwZm83eld2bkY3bW1mMm5vTy9RemNJVWhVR2VxWEZKdVRJT1JCWGVzU3lu?=
 =?utf-8?B?d1oxYnJOcEpmYlJBWHpITlVnampCdktwMmtpMlRNSjVhQmpmMHVWbjVZY3RQ?=
 =?utf-8?B?SEhCcW1kZEVmNXZnbkQxZ3FSanJCS2hNMUQzQTcxYjk1UmtHWGpxaTdSWlNk?=
 =?utf-8?B?MW1iaXc1VzJjYVExZW5Takpsc2tuY3dTK3pBTXlzck1pM083WW91WTdtNjFF?=
 =?utf-8?B?bUVlSERzNDd3M0RNWGc2aHlYL0hSaG4vQ21Xc2FGSVNZVVNsVkIzS2FVcG9M?=
 =?utf-8?B?ZTNSNkcxem5vOW9NR0xkTGlvNVdjam5xU2FheTQ3VysxNWNIUGt3R09JUGZn?=
 =?utf-8?B?clp3bWRna0djYTg5RWMwK1VDK3VUOHMwSXV0SVFOYitRaEN0bTEzUjcvZ0FH?=
 =?utf-8?B?VC9zMEp2TTdjQy9UWDRodGtBa3VURHlGUkFLZ2g4Ly8rU3RwRzdraTlJeFFR?=
 =?utf-8?B?VU9pWndOTXV3KzNKUFl5cTBXUVBESVZqZjVRcHdjQ1JGWldQWlJWZHlNZ29H?=
 =?utf-8?Q?pyS/Kej2C1HCL5nV6C?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 246ac506-51dc-4139-0274-08ded1f05e4b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 12:59:03.9760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pUoU3wAIU1igigouK+hcWpqFqraIP0eOkxW40TZloKmWAqLpvCMnqb8tOhbqVQlX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7505
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65560-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:alhouseenyousef@gmail.com,m:kraxel@redhat.com,m:vivek.kasireddy@intel.com,m:sumit.semwal@linaro.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,redhat.com,intel.com,linaro.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,amd.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 10FDA6BE5F4

On 6/24/26 14:52, Yousef Alhouseen wrote:
> UDMABUF_CREATE_LIST copies an array whose element count comes from
> userspace. The count is compared against list_limit, but list_limit is a
> signed module parameter while the count is u32.

We should probably just drop the sign from the module parameter instead.

I don't see an use case for negative values here.

Regards,
Christian.

> 
> If the limit is raised too far or made negative, that comparison no
> longer bounds the count to a range where sizeof(*list) * count fits in
> the u32 temporary used for the copy length. A wrapped copy length lets
> memdup_user() copy fewer entries than udmabuf_create() subsequently
> walks, leading to out-of-bounds reads from the copied list.
> 
> Take a positive snapshot of the module limit and use memdup_array_user()
> so the multiplication is checked before copying.
> 
> Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
> ---
>  drivers/dma-buf/udmabuf.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index bced421c0..b4078ec84 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -469,14 +469,15 @@ static long udmabuf_ioctl_create_list(struct file *filp, unsigned long arg)
>         struct udmabuf_create_list head;
>         struct udmabuf_create_item *list;
>         int ret = -EINVAL;
> -       u32 lsize;
> +       int limit;
> 
>         if (copy_from_user(&head, (void __user *)arg, sizeof(head)))
>                 return -EFAULT;
> -       if (head.count > list_limit)
> +       limit = READ_ONCE(list_limit);
> +       if (!head.count || limit <= 0 || head.count > limit)
>                 return -EINVAL;
> -       lsize = sizeof(struct udmabuf_create_item) * head.count;
> -       list = memdup_user((void __user *)(arg + sizeof(head)), lsize);
> +       list = memdup_array_user((void __user *)(arg + sizeof(head)),
> +                                head.count, sizeof(*list));
>         if (IS_ERR(list))
>                 return PTR_ERR(list);
> 
> --
> 2.54.0
> 


