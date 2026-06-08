Return-Path: <linux-media+bounces-64231-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 04UgE/EFJ2oQqQIAu9opvQ
	(envelope-from <linux-media+bounces-64231-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 20:12:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D02659925
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 20:12:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=1xQzXrQI;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64231-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64231-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 481DD306B7F9
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 17:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB1F134EEF7;
	Mon,  8 Jun 2026 17:34:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013029.outbound.protection.outlook.com [40.93.201.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF4C2DF12F;
	Mon,  8 Jun 2026 17:34:21 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780940063; cv=fail; b=ultRHAIOUJOXXSeRMN9C1+bCQJgVfmc9qUnEQywqTjQQGPxtQHEk/KfzPRRDtr3k6sowgX/grnLGP6xkGMl7R2y1Zc+fPOWcFKRnfr2kciiYJfnCLxoJZLAzFvumHgBXk7Voo/XCP2Se8OLZbJ19qXtIkmF1JK9u659HdYYWk3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780940063; c=relaxed/simple;
	bh=EljxGQQBMHlufOFjvbGzYErsFIyF7Qx0XMyKYKMGQjM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=b5ty2TbDgnkTT9zh1uhHfKnWqxIi70UDQ3eazqxhdCcM0feCOr2eB8u7hMjXBUhY05sqypS52E8Q0SLv54WDD/ruJx6E/R77l8khFP9vYm+FOAYphLqt2WbRgr7jobhjNf+nN8u2UV9kVAYMGsZwTq/pGmRPRbbyVH7jzcrSvl0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1xQzXrQI; arc=fail smtp.client-ip=40.93.201.29
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WzNLzgzu+bFRKd/zR2LfyyLn5JGYwbPFOVaQw3EIXGOpWOoI6xX2BQg9ipcfh4QKIp2qRGpqdnqtWl/o7dx8tmu197F+4C6BeR4KzefZuUyWUkwW9kY4Y0u3gEUiXW4dpH3mkCSFP8j5Q1bHxtNJ88rCq21fJRd+FstmayfHpZfqAuALzWMmba+Y0YUx4Yg00Rn36u4mIyAp0m+hMwgW41O8npGb+saNIvXDRZNz3W/CuxbHSA39x5vWOzwNw2JGUCxfDoJINuXB9ec48Rom9a7hb2KwFjlIqDv4+RCf7Jmw0g206zz6Gxhp4bvwtI4t32CMg9dPKIqHrjnDOPdCjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g7k4Eb0ZC0M9tFMkGLPJJ3npYgh6gHb2n7YcRQ6Ahro=;
 b=fG8OrUxqEwQNWkLoYghfHyMbAFIxOEE7uotcqlv4LJPclnNTzH5XirL/GifrK/eT5iz6Tk5/cQaqTrXp6yoOQ2+dGZdiZhzo6Xs9L3JU9WuYjmjEfzOWA6TS8r38tZFumiWXHPrOomYVWJq3BX1wxiKPlPjmS0c4c9INh9S/3Sd+/cG37vVyPweD/AY0p/A9RMi5eTBntWyO95wrCx35afz+Xj9sWHszRc1AGnCiJ60dIhcx2B+5P31PNl6lQGn/uAiFWyltsikGCjQBfGX3ocF4ZX9oxZxhHhYxxiVf9nsSEu43nZJoghXk2R82GcPPQ5JyiDvhPOOaQFQEcy/2yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g7k4Eb0ZC0M9tFMkGLPJJ3npYgh6gHb2n7YcRQ6Ahro=;
 b=1xQzXrQI/0cLTMwKyYWJhAjNhnYh8F8q1CpNlxpMpgnbRpNQ85Suaj3k89/92ESF5J8+3490kaQ+01f0oeD/yx4GNPGljHYLQkfqiOoDMWQx9KfnVW2dU0HIPHAjCr8tH91TXuj6kyvDNBQHVis7WJRYyURKmNsfYrEpILf/Alg=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB8955.namprd12.prod.outlook.com (2603:10b6:a03:542::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 17:34:18 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0092.006; Mon, 8 Jun 2026
 17:34:18 +0000
Message-ID: <9d49c901-fcdf-487a-a733-0320d0bdf94c@amd.com>
Date: Mon, 8 Jun 2026 19:34:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] dma-fence: Fix races of fence callbacks versus
 destructors by locking
To: phasta@kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <dwlsalmeida@gmail.com>,
 Gary Guo <gary@garyguo.net>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
References: <20260608142436.265820-2-phasta@kernel.org>
 <95f4ae6b-9dec-4122-84e0-fbb0cdee9cb5@amd.com>
 <fa9a335196525adbc03ec21b2e05bb526e4fc174.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <fa9a335196525adbc03ec21b2e05bb526e4fc174.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:408:e6::32) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB8955:EE_
X-MS-Office365-Filtering-Correlation-Id: 3926f9da-1193-44e6-8dd4-08dec5842aec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	PxkY2Uyjgl0phGknamgUeILg59d1lI5Kz6VVKSFuTd3VY76QKNfCP4BgpRFs02ApS1CRM5CQoDvyzmQN2KunU/CZnnF/t9X2uOBLEkos0Qz7AIxKpzE+R6zUmzwsLIP0yQjpN8NbilbHgzjqBbHioiJlIbLQxpvsjkd0Bem0ug1T6uMKGRA9CGTkoa8VsUxX9IvxTPqKWg6cMarLk0yhNLeSkIdj8bFeBoxdCUN1M6E5+A73g8z370TTNroAqU5K95u73wYaTDPIWZ+fCn7FCzRfebjgQbtvi2mfYqeM0M1iwGqSzz1+XATWPmVtBG96xK8ylVoRUCix3WSvG+hxgEGXsXu3J2g34+Wd2sG+v3hUHAi0SxZ5t1ANbyYjMJuU4uM6lN1yC6nSsD0q29Zu0xxSmT941KxR1hOrjVgGM6szBwRi7CJHvwNNeDX0odq9TiQLFwZzLUOTLe1Xux1J/RHlnjW+uBCcTO7tex9tgmwmJALwpDvHyPnML/DtSSgJtPDRqJViSs7pHo9vvUrs4D+CVQpcQ0A8wWoKEJ6VWn3Bh0oqNp5tvTaw13e1HcHGpd2uJdU5KgrD7zEBfc+OY06noR6J5G4nBk/pLj40j5BB7RiEEEj8l4oQ5qlnz7mEekPgNpQxnoO0rpgfojD1nFIdAfvlSvYWhDqHtfEPgZqJyvjqeuzBvqR7q63ezDvA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWN2REswUzJjWS9iRXAwNWFVNzdFV2NNWGl3VlFrdTBHdWJMLzdKa1JQdUhh?=
 =?utf-8?B?L210bzRWNGNzemFsU3pDOElVSks0TGRJTFVGRzE4dUZ0RUt5MmFPSDZlaVdq?=
 =?utf-8?B?RU9nNnFPS1lXM1VKclg2VWNtYTY4eWcxT3RvejNrd3RxVUl4T0daMElGNGdU?=
 =?utf-8?B?Y3FCVVJJY0drWElqNHhVKzd6cUlqRG1wVXBEZ3NYNlp6S2VreVcrYS8xaTQ3?=
 =?utf-8?B?dmpnVFQ5cjY5VXBIenRiTUthNjU2YTkvWjJnbjRETTM3UEJPQStxbFVoUFBT?=
 =?utf-8?B?bTJhcXFnTW1XODVaT0VtaXRFY1dZeFhHTVgzbFZFUUMzWHFyMm5ldzBraVcv?=
 =?utf-8?B?bWV3QXRzemZqYk92ZVVnUE1hcU81OGlPMEk2TUU1V0JpUldEYVJOVTVDM1dt?=
 =?utf-8?B?bHh2VzFrRmFNaFpBMTVUZm5BT3NIUkhlSExmUnpPZHpHam9CMmtSaGh6cDBu?=
 =?utf-8?B?RG9xblRhalFnNnRtNFRnWVRHV1UrU3VicldQZUZvOTQraTRWN0JXMlkxZEtY?=
 =?utf-8?B?d2hINTdna0VCZWZTWmdmMEFZNGQxbzYrU1BsL1dKZFdQcDlEUHMzMmQ5akky?=
 =?utf-8?B?MmFWWjBUUVU5QWpVYTF5bGhkRUM2UUJwM3RCK0NaWE1DYlBocjRISnc2Y3dm?=
 =?utf-8?B?N0JMVSs2dGFIS1htYUw3SUFLWDBXQWVjQmFicExZRlVmMkMxQkxHNUJJWG45?=
 =?utf-8?B?RUNocEltcmRjbElIZXVIdDFISzhMYThpRDNxWFBtYUdSdzhEUTJzVXZWT3l2?=
 =?utf-8?B?U05ubGZtN0tBdytlN2xHWDZoTmx6eFU3NzZEV3FTVi9ocytkZ3ZtbmRyMytS?=
 =?utf-8?B?c0xGNDF1ay9XUlRkVFdUdjUzV2J1a20zU1hPczFXZ1hLVVhlRDM3UEJkd3l5?=
 =?utf-8?B?MGRGQ1N6SXNRQlI2ZVhRYmRXd0RoMkpURkhXN25vbFBJTVhPM05ia3FrSjNV?=
 =?utf-8?B?NE03QmtOai9BMG92c0NCU25TRGc5ZXhNY1BmOU80OHNUSXlhdVBzazFjYUpZ?=
 =?utf-8?B?bERRUDZRQW9ubmFOeXVwREtQR1lTSEUrR2JESWFPR2xJRnR0czVvM0VJOUlV?=
 =?utf-8?B?NlZRanVJMWVDcWRldEtpdlNnQXVyNjVTUG42ZzlHNzdacVl3UE9WNjRlcWdE?=
 =?utf-8?B?aU9oTE1SZE1JU3BFM0RiZHJxNzJ5cW14T245aEhPVS9JNDhsM0t6T3Y3czVH?=
 =?utf-8?B?ZGRIeWZjekhtR0YxQitVUHhTTVg2ZzBaMFBqZHdkRUMxUUxvOFVJNE13WGZl?=
 =?utf-8?B?UzZtMUYyNlNBaEZpZ2dtbzJZdVJQRHQzMjQyT2xPSExOL3lBOW9YN0pISlZM?=
 =?utf-8?B?cW8zMWVadVlRQ2RXcHJXb3NxUWhiSm9HV3o2N3dIRW5ycjRNMXdzWWZLOWM1?=
 =?utf-8?B?TG5VdS94dkxMeXFSSEhtYmJXd1lGVitzUmtrOEZCT29iVWM4alpZTnE4R3RQ?=
 =?utf-8?B?Rkh6VVlVWEdZR3NOVnVSUVhudGhJN0hLL281MnMvZXNjbktsdE9nNUR5eGVX?=
 =?utf-8?B?NHBJK09jU2NHUmFmdzdiZHBia1dIOWNpTnhldDNNT1dxRzRSWEhWWFBWVitQ?=
 =?utf-8?B?Z3BGV0gvNWRnWW9pM293dE4wc095N3dMQUdOZnlwaXRxRmNxbllzRnBELzVK?=
 =?utf-8?B?Y1VLczJzVE80SndsTXF2Q2xnalAyc1VRREZ5NmlWdlJnc0t0UFBvRVBaanY1?=
 =?utf-8?B?bDhkUTVOU3c3QzRVMElEdExCejk5QUlBSWZmcEppZkd6SXBoZE53MldjQW5r?=
 =?utf-8?B?MC80MVNIMzEzR1JKalY4cVBiQTEwMXRETmlwbUxNZkZWVWVvWHRJQU1lcnls?=
 =?utf-8?B?d3oyMFcvekZQb3k5c2UrS2k3UURYNWtHNkZCbVNjMEEzWWZ5K1lWWDNWQTNm?=
 =?utf-8?B?b2hoMytlcWU4Qy9jSzdvSVRxeDloTEF5NmM5Ull0Ty9NUXNLdEtBcVVjNng1?=
 =?utf-8?B?OEJXWHRrTkVHZnNDSWNUNlNUMC9xaHpqTUFQTGFMb21NUUJMSktrY2ZiTHZQ?=
 =?utf-8?B?NFpMRFV5eWt4dXh1eWd5bGViWlF5bjAyZCtNaU80aXExOWNKeGlqTldPS21D?=
 =?utf-8?B?LzV2Q0lPNjdJejU2Q1BUVTUwaFpkWGsxYi9lSXdVMHVWZnZRdVVzd2ZhS2Q4?=
 =?utf-8?B?V0pMSWZwMDRRQjcvOU9ZQ2o2WXJpT1dNR0xpYUJQS201ZC9jWk1QTllUM2Er?=
 =?utf-8?B?Y2NsNUhJZXY2MitKeG9xVlhMdjRoUW5zeUFzR3p6SExIM2NHU2pqMkw5R0Y0?=
 =?utf-8?B?TWI1R2plSkNZN21MVlBhK0ExOGp4YXpVTzNoSlpiRGxqWlRoVHhISVFyK2lU?=
 =?utf-8?Q?UwP8rJezi7Zdy1lTl9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3926f9da-1193-44e6-8dd4-08dec5842aec
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 17:34:18.2982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U0mqDXIGoRV+2QpjMX+a7qGVxwKuZe30glbCtqqXZdmA2aCXkwM+3HXpC1zZ39yA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8955
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64231-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:sumit.semwal@linaro.org,m:boris.brezillon@collabora.com,m:aliceryhl@google.com,m:dwlsalmeida@gmail.com,m:gary@garyguo.net,m:tvrtko.ursulin@igalia.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:dakr@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,collabora.com,google.com,gmail.com,garyguo.net,igalia.com];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,amd.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 94D02659925

On 6/8/26 17:41, Philipp Stanner wrote:
> On Mon, 2026-06-08 at 17:35 +0200, Christian König wrote:
>> On 6/8/26 16:24, Philipp Stanner wrote:
>>> The dma_fence backend_ops can access a fence. Hereby, a driver callback
>>> will be running which likely will access driver specific data through
>>> container_of(). If now, simultaneously, a driver signals the fence and
>>> afterwards expects to run a driver specific destructor (using the same
>>> data accessed through container_of()), there can be a race.
>>>
>>> A driver very likely trusts that once it has signaled a fence, no one
>>> will be accessing it anymore. Moreover, it might already want to free up
>>> resources, making UAF bugs possible.
>>>
>>> The race occurs because there are only pragmatic checks for the signaled
>>> flag of a fence, without taking the fence lock. RCU guards exist, but
>>> their purpose is to guard accesses through the backend_ops callbacks
>>> against the driver (which implements the TEXT segment these callbacks
>>> live in) from unloading.
>>>
>>> Proper synchronization can be ensured by taking the fence lock. RCU is
>>> still simultaneously required to guard against the unload.
>>>
>>> Fix the races by taking the lock for all non-deprecated backend_ops
>>> callbacks.
>>
>> That sounds like the fundamentally wrong approach to me.
>>
>> The lock protects the dma_fence signaling state and *NOT* any driver
>> state, so it should not be used to protect any driver state.
>>
>> Drivers need to make sure that they protect their driver state with
>> separate lock and don't rely on the dma_fence lock for this. This is
>> actually the core of why we want to deprecate the shared dma_fence
>> spinlock.
> 
> It's not so much about protecting data, it's about correctness:
> 
> A driver that calls
> 
> dma_fence_signal(f)
> 
> expects that after signalling, no callback will be running into the
> driver again.

No, that is not even remotely correct.

That's why we need the RCU grace period to make sure that nobody is referencing the driver stuff any more.

DMA fence destruction has to wait for an RCU grace period for exactly the same reason as well.

If we want to cleanup I would start there. And then eventually stop calling callbacks with the fence lock held and only hold the RCU read side.

Regards,
Christian.

> It's a fix synchronization point.
> 
> Only the fence lock can grant such synchronization.
> 
> Positive effects would be:
> 
> 1. Drivers can do their cleanup immediately, without having to wait for
> a grace period
> 
> 2. Drivers could be sure that their driver_fence data, allocated
> together with fence and accessed through container_of(fence), is not
> being accessed anymore.
> 
> 
> I see only advantages. Safer, faster. :)
> 
> P.
> 
>>
>> Regards,
>> Christian.
>>
>>>
>>> Conveniently, this also fixes a race where backend_ops->set_deadline()
>>> might try to set a deadline for an already signaled fence.
>>>
>>> Suggested-by: Danilo Krummrich <dakr@kernel.org>
>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>> ---
>>> We discovered this problem through our Rust abstractions, but it can
>>> also occur in C.
>>>
>>> The by far cleanest solution seems to be to use the fence lock. This RFC
>>> serves to discuss whether there is anything preventing that.
>>>
>>> (Patch so far just compile tested, to have some groundlayer for the
>>> rough idea, to discuss it first)
>>> ---
>>>  drivers/dma-buf/dma-fence.c | 39 ++++++++++++++++++++++++++++---------
>>>  include/linux/dma-fence.h   | 17 ++++++++++++----
>>>  2 files changed, 43 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>>> index c7ea1e75d38a..b74f02f3cca8 100644
>>> --- a/drivers/dma-buf/dma-fence.c
>>> +++ b/drivers/dma-buf/dma-fence.c
>>> @@ -629,7 +629,8 @@ EXPORT_SYMBOL(dma_fence_free);
>>>  static bool __dma_fence_enable_signaling(struct dma_fence *fence)
>>>  {
>>>  	const struct dma_fence_ops *ops;
>>> -	bool was_set;
>>> +	bool was_set, success;
>>> +	unsigned long flags;
>>>  
>>>  	dma_fence_assert_held(fence);
>>>  
>>> @@ -644,7 +645,10 @@ static bool __dma_fence_enable_signaling(struct dma_fence *fence)
>>>  	if (!was_set && ops && ops->enable_signaling) {
>>>  		trace_dma_fence_enable_signal(fence);
>>>  
>>> -		if (!ops->enable_signaling(fence)) {
>>> +		dma_fence_lock_irqsave(fence, flags);
>>> +		success = ops->enable_signaling(fence);
>>> +		dma_fence_unlock_irqrestore(fence, flags);
>>> +		if (!success) {
>>>  			rcu_read_unlock();
>>>  			dma_fence_signal_locked(fence);
>>>  			return false;
>>> @@ -1020,11 +1024,20 @@ EXPORT_SYMBOL(dma_fence_wait_any_timeout);
>>>  void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
>>>  {
>>>  	const struct dma_fence_ops *ops;
>>> +	unsigned long flags;
>>>  
>>>  	rcu_read_lock();
>>>  	ops = rcu_dereference(fence->ops);
>>> -	if (ops && ops->set_deadline && !dma_fence_is_signaled(fence))
>>> +	if (!ops || !ops->set_deadline) {
>>> +		rcu_read_unlock();
>>> +		return;
>>> +	}
>>> +
>>> +	dma_fence_lock_irqsave(fence, flags);
>>> +	if (!dma_fence_is_signaled_locked(fence))
>>>  		ops->set_deadline(fence, deadline);
>>> +
>>> +	dma_fence_unlock_irqrestore(fence, flags);
>>>  	rcu_read_unlock();
>>>  }
>>>  EXPORT_SYMBOL(dma_fence_set_deadline);
>>> @@ -1166,14 +1179,18 @@ EXPORT_SYMBOL(dma_fence_init64);
>>>   */
>>>  const char __rcu *dma_fence_driver_name(struct dma_fence *fence)
>>>  {
>>> +	const char __rcu *name = "detached-driver";
>>>  	const struct dma_fence_ops *ops;
>>> +	unsigned long flags;
>>>  
>>>  	/* RCU protection is required for safe access to returned string */
>>>  	ops = rcu_dereference(fence->ops);
>>> +	dma_fence_lock_irqsave(fence, flags);
>>>  	if (!dma_fence_test_signaled_flag(fence))
>>> -		return (const char __rcu *)ops->get_driver_name(fence);
>>> -	else
>>> -		return (const char __rcu *)"detached-driver";
>>> +		name = ops->get_driver_name(fence);
>>> +	dma_fence_unlock_irqrestore(fence, flags);
>>> +
>>> +	return name;
>>>  }
>>>  EXPORT_SYMBOL(dma_fence_driver_name);
>>>  
>>> @@ -1199,13 +1216,17 @@ EXPORT_SYMBOL(dma_fence_driver_name);
>>>   */
>>>  const char __rcu *dma_fence_timeline_name(struct dma_fence *fence)
>>>  {
>>> +	const char __rcu *name = "signaled-timeline";
>>>  	const struct dma_fence_ops *ops;
>>> +	unsigned long flags;
>>>  
>>>  	/* RCU protection is required for safe access to returned string */
>>>  	ops = rcu_dereference(fence->ops);
>>> +	dma_fence_lock_irqsave(fence, flags);
>>>  	if (!dma_fence_test_signaled_flag(fence))
>>> -		return (const char __rcu *)ops->get_driver_name(fence);
>>> -	else
>>> -		return (const char __rcu *)"signaled-timeline";
>>> +		name = ops->get_driver_name(fence);
>>> +	dma_fence_unlock_irqrestore(fence, flags);
>>> +
>>> +	return name;
>>>  }
>>>  EXPORT_SYMBOL(dma_fence_timeline_name);
>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>>> index b52ab692b22e..b93c3f7f69fb 100644
>>> --- a/include/linux/dma-fence.h
>>> +++ b/include/linux/dma-fence.h
>>> @@ -547,20 +547,29 @@ static inline bool
>>>  dma_fence_is_signaled(struct dma_fence *fence)
>>>  {
>>>  	const struct dma_fence_ops *ops;
>>> +	unsigned long flags;
>>> +	bool signaled;
>>>  
>>>  	if (dma_fence_test_signaled_flag(fence))
>>>  		return true;
>>>  
>>>  	rcu_read_lock();
>>>  	ops = rcu_dereference(fence->ops);
>>> -	if (ops && ops->signaled && ops->signaled(fence)) {
>>> +	if (!ops || !ops->signaled) {
>>>  		rcu_read_unlock();
>>> -		dma_fence_signal(fence);
>>> -		return true;
>>> +		return false;
>>>  	}
>>> +
>>> +	dma_fence_lock_irqsave(fence, flags);
>>> +	signaled = ops->signaled(fence);
>>> +
>>> +	if (signaled)
>>> +		dma_fence_signal_locked(fence);
>>> +
>>> +	dma_fence_unlock_irqrestore(fence, flags);
>>>  	rcu_read_unlock();
>>>  
>>> -	return false;
>>> +	return signaled;
>>>  }
>>>  
>>>  /**


