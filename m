Return-Path: <linux-media+bounces-65886-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v7GRAtlCQmrb2wkAu9opvQ
	(envelope-from <linux-media+bounces-65886-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 12:03:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C24E6D8997
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 12:03:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=bPETxYt4;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65886-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65886-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BFB7314DEB4
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 09:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C3A03F9298;
	Mon, 29 Jun 2026 09:52:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013040.outbound.protection.outlook.com [40.93.196.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31D2374A02;
	Mon, 29 Jun 2026 09:52:10 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782726732; cv=fail; b=m2jyXfPowfkjjU0Btv8viuffijHaLVy/fkXzYCpeJiLJcNMLCHr6/irhYFtigWp5TWFFA4/5bx3JvvVvYVk4YgOvK0zIRl4AM+yf7m6+9/kL5ytz3UlPz1rAZne4ZS38myiRmkUIFG5niGWkQaf4QIFdUOQNZyxPgzeVtgAggAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782726732; c=relaxed/simple;
	bh=SoAnNawoD9OyXT2cAL2Hp1v0//K/vG1P2db8I3p2e/A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rAmeLrWE5Xsd9TLvkNYlnHCi1G576gHCbWEwpyAVOH1glZSjFpEssxmckcxrElDUaN8TIkBBUzI6SryKCLWrGHIb52zcusnyvpd/6ajMfQErZWsab2/eZfZPbn5AwhgSjkM1iAt6OKFJ2WN0F0dgN/CbN6R1FOQPmg14hgpIDJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bPETxYt4; arc=fail smtp.client-ip=40.93.196.40
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rg9XRbBSbftOASUoAhys+pzatDJzjvSbCf7wEFMjDGoM+eyV29JVZe6tMKGyX9FRffR8E+Q7gphC/h2W5q4JICBSydGUnzUhBOKlTdmjF/WeBQ5gO/Cw6OIixNH2Ndanx/wWpiHEyIgAwwXYo/uXwQOkfaTBp1YMaUJDyWjQCUDn0ex6iVQmwLKMYzJ5No47SQ2xXJ1lrajw8UqW+zNDliMOSXOzOzjWF0susSPrptPCTDUTh9Tu5EKy8szmkJWEhDynsjmCYbKCW1LntdIkIViIMkbsNutJQPSi4TKhAhOIxUfmZZP+26gJ0WZP3/lfAZouy8TnG2S3Fk6uIfgXVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ff4+wMCnhJZStZXc1KtF/zH7gL4Z3N7SOuVbLPJ7Hs0=;
 b=V4JLBCPvfRHmvM1ZEg7Vpvm767eom0O0r54l3ZiIlklD/kdqFt0A8SefN4MUKbpZ+FvQ0zivnQoxCGYDrhBjVCrZQt5XxxuPzv9fOEFCCj+Xt/XDIordghCQpM738XZJvW4bsYT1FicasHJ30VmqPru80Hif+Kaxmcy0cP4zLiqQYtwUKGF7sGPE/sydwhQ8EjJFlpglbDf1CmgYvKVz9iaGJIHfF3ljLQ7FhNAHY4FRlGdWfJdzQ9hdF4Vo/jsTmWQjodIIL1aSwkoY8ix5syjwmP0h4A+tE1W6GYULbaP1+vYU2oXi3dc/LvGCbe30VSZMxtJGoVYMhXq1Fab4QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ff4+wMCnhJZStZXc1KtF/zH7gL4Z3N7SOuVbLPJ7Hs0=;
 b=bPETxYt4xSxxRU/Ufh2PO1L50fRgKKCih6DKQAa0TFlKeKd4y9sh988/Hve15HmdmHJxvZBWOt9VFYzQ1F+Yct0gV7cdZKlhledTJr7eILelT88fI1Y7e7yvebbpdh3TlvdVB+CiL/P12utnw/ZhgDQeRFzG4hI+50Edh3e2SuM=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CYYPR12MB8730.namprd12.prod.outlook.com (2603:10b6:930:c1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 09:52:08 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 09:52:08 +0000
Message-ID: <349ada65-c788-4c5e-9992-0278cf1382dd@amd.com>
Date: Mon, 29 Jun 2026 11:52:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-fence: Make dma_fence_dedup_array() robust against
 0-count input
To: phasta@kernel.org, Baineng Shou <shoubaineng@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>, Akash Goel <akash.goel@arm.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260629031346.3875683-1-shoubaineng@gmail.com>
 <becd29b5-9e40-4104-b6c9-3d91e2ddddff@amd.com>
 <058f4bb261e408cf17deca9ff7354460675eacbf.camel@mailbox.org>
 <66344c20-ea97-4dfa-ac42-c9d6e061eb95@amd.com>
 <7dc78d8ae9903c215ec492ee39b27cc504da8307.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <7dc78d8ae9903c215ec492ee39b27cc504da8307.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0366.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CYYPR12MB8730:EE_
X-MS-Office365-Filtering-Correlation-Id: 445fa15c-25e2-40d0-ad25-08ded5c41534
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|7416014|4143699003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	54tqqNH+USogJWUkxwKsnzZPdq/Qfuxw4L0yJO9FM8f5k7Ed9gWImoGTc1r0nxjOvLp5m8aPaB051cc2EXZgLDgITw7Mrw1R9U1V5eCYkq0V4eeYU2D1gyNN/451qPJjn+Ov06i5OM6K/rKfkY3x9owg8ysooXAbbbv5K4G1QHYPNA3OuwESQ8Zy07nNB3yGZNfW0idcy0UdqiT658RAIrH6CGD++XRSDvg2wW0spM2JfP0Mi+iLOQgmDVZuuqTCxJ+d2x/TeZJiVndE58nNd0P8P4P4Z5ZhsEsW//chCy/kZmmza0PkIHiXS5oOfO1aWRbv+5Mu7/ZPuLowV2kgOjqTrKxuWFoekEqR8iZs9S10JJ4WxzKy2FLBFHWKV0uFKViJObx7mLKrCWJmOzV5PiT4zm3t0D6GkvsuP5sEiBU90olj/08yPQ+HEv04AGCXPYr7HQ06m+udcpPUYApv8N8kARx2TLoHzVO43bf14wXhaEAvm/wmu7gE2k9inzhyqawJ1YERN2Pl6CzMiGKswpc82pcvqA6zJmAJzFqIUMOPcBN9sV9Fj8OlBb7w5yqrIcQLbncNBLc8shJrdgnNLkPJ6Hn6jJXnNlUJhs2FiT9O3yk4JtTMFCG71aevVfgn44NKUqEZC/Cot9kdB+17LjjEbVpn/K4YUUkg+NrMWHs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(7416014)(4143699003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVhlbWh5SExWNlNaRGhGREh0MEg2Sjg0V3pMWW0rMkZtSk5Lb0JnbWE5ejBh?=
 =?utf-8?B?VUYvODNkTEVQd05aTk9KSGowV3ZJemhXSThwSTBaQ1ZVdllhWDlDRGFXU2Fm?=
 =?utf-8?B?Ymo4QWRQNlBhVk5HQ2ZTV2Y5dTZ6dE5IaEp2d2dzamZELzNLblJGdm9rYmMx?=
 =?utf-8?B?Y3dYMm11NUNMSExlZGM0Mm40REw1b3laUEw5MWlsMnM4UWFpSTFieVE0UmZ0?=
 =?utf-8?B?YmpCQ0NzR2RucHN0RUhId3AzVGVwcEd4UDRxVWlkRERrUTUvamQxRjVQRFNy?=
 =?utf-8?B?RWtoS1V2QXBDNmQrV3pkeVI5VXYxQ3RHaUtPQ3JMS1JFclNsc2l1NEZTVFZo?=
 =?utf-8?B?TW5TZUpvZkxOUFg3M1NYcXg1Z2VtcjhYYmVLRG5KYXhsTnF0aXV0TmR5WXZX?=
 =?utf-8?B?V2g3MkF3d3Q3MVltUERaTmdXSzRzbHJyejh1d1ZMdjRjYys5OVJDQjVzaVhl?=
 =?utf-8?B?L0E0MXpMQTZnOGc5aS93WGwzMi9lZUNQTHRhY2w3N1hlQUtwc3h0YXpLM3dX?=
 =?utf-8?B?U3lTM2lrWUJkQWx1WjhPcFFNSGVGQkVPbUhuUjRiNWVSSXdod082VWZVV0xw?=
 =?utf-8?B?ZjFFaXdNTUlRZy9sTFZ5VmlQN2tyMi95YUEyMmkwSmtwbElQeUwybVh0czhx?=
 =?utf-8?B?MkJtWTVyNkZHbi82Zm9qa0I0aWplQ2MvYWJOZFhHeDcvOEJFWEVraDBlbXhH?=
 =?utf-8?B?VFM1N0pmK09CeXVPUStHQXh3V2c5OW9hQ0NCaWsxV3hXVEFtV2pOOE5zdTFI?=
 =?utf-8?B?bXN5WlZKVmdZVWRVMnJkdFlKdHVHTUE2c0dpSTZjaHVYQUNiTi9ZSk9QbW5n?=
 =?utf-8?B?LzR6bTVjYklhdzc3SjhIUk5oNEF3ekJrY2pVOEY5dkMyQWlNcmlXNnhQRVNJ?=
 =?utf-8?B?TkFwWkZMMGVhMTJoMGZnZk1sVTJnQVFDem85eFUwSmdiTzY5elF0b1VDUFNh?=
 =?utf-8?B?QU1aUXVDeEhlZFEySnNrNHhZNVhwbDN4VDVaVCtUMHpDdjdXN0lJQjE3eTEw?=
 =?utf-8?B?dlZVVUg3SUN2dmE3WlFOQ0RZbElmWlVBZ0pUMmF3bUduWkovK1RzcWZKVnh2?=
 =?utf-8?B?THlGWGRSb25DMHVBTFRHTHd0VndvM09JYnFqY1pjbzJpRUExQWJJNGFyVTNJ?=
 =?utf-8?B?M05WN1NsZmxLVmdBNHR6bTE5RGMzM2paT1hxS3luN3V0Yit1bHJjM0YzOWh3?=
 =?utf-8?B?TGhLQWRJQU9OVUlSdGVETnhzVHhMcjFKQ1VxZUNpUnZWZ1V0NldPakUxUllZ?=
 =?utf-8?B?QnVLclNrTVFETm56Y1NabTcrZEFSR3Y3REZhdU5obURjOHI1UUNtYnpHelFS?=
 =?utf-8?B?dXVyRXNxcFNFa3pzTjYxYVdJcXNabndZU1pYbllBbCsyWVVNbEhtZVRXdllI?=
 =?utf-8?B?TER5M3lLVlM1emVvbzhQaVphck5hbFJlZ0FVcVo1amtaSi9QL1JQa0RzNkV2?=
 =?utf-8?B?cHM4ME0rWVRmS3NHampyYUI4Sjk4K1hiM3creTVpMjE5amlyd00xVUkzdFJZ?=
 =?utf-8?B?S2kwb3k5QlFzcXRaaGd5RWhyT2pqeFFaTENTam5OUTYyRTJlM1ZGdnJRMmlJ?=
 =?utf-8?B?ampqRnp2MG9IdEYxcUR5ZFU1ZnU3VHZNa2tEUUs1cllveHZVNzMvQmdxSSts?=
 =?utf-8?B?WUppT1oweitvdTZybkdORGR5SzcwSy9QUTJmV1p0dE1BMjNHVWkzeU51ZkJk?=
 =?utf-8?B?akRnZFc1UFEwWnJ6VzI0VFpTc3h0ZHZhMlBwY3Z5dVZjSXZwOW43QS96NXY5?=
 =?utf-8?B?ZlFGdzd2THcycDJLd2E2cnErZUFrWUJvUEw0b1Y3TUYxMVhjMWNYK2luRjhH?=
 =?utf-8?B?NkJBMjFscjdicjdCNjY1UTZKZTBNMW4rSDhHMFpQMDBIaDhkdUhwbzdhWFV3?=
 =?utf-8?B?TU5rZ2hSeUVtTklQNVMwclhlVlV6VVNaSElrUVdsUlloc21iUW4xWTQ3N3o0?=
 =?utf-8?B?dkdtME5DVTQ3WlBpZUpia21LWUlSTXZramdjaXpFSGRIV2JON0JDZE5ZK3Jx?=
 =?utf-8?B?Ty9QNjY2YnBYTEJXZXJKbnZBcklFbnNSbElzWjEwZnBCRjBFNXVhclU1K1F4?=
 =?utf-8?B?Um1hbGxrR2RCaitIenB2eVBlRmNmRXpHTHFtdlR0aFA3b2xScFJ5cVptYmRu?=
 =?utf-8?B?dkdsRGVTNnlEUUxodGJaUlRraU4xVDR4NW9lVGFUOWt3VFZ4dXE0c2JvdkRy?=
 =?utf-8?B?UnN0N2QxN0JjUjBhak9pYkV6b3hVMlZiRmdZTDY2T1BaT0JqSFhEYjMvMjg0?=
 =?utf-8?B?WlVlK2lBWnRDR3l0V1VZbk1qdG5FRHo5VXU1ZThyVElQZWFUSXVjQ3FvaUFD?=
 =?utf-8?Q?KiQVSCjXSVRrTpU7Mq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 445fa15c-25e2-40d0-ad25-08ded5c41534
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 09:52:08.1698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yCccjJSRH7X/ts4CJKsrsxUEMCv/LpSEw5mRS0Y9Cq1FNfChoqLDY3Gr94Eu7Taq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8730
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
	TAGGED_FROM(0.00)[bounces-65886-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:shoubaineng@gmail.com,m:sumit.semwal@linaro.org,m:tursulin@ursulin.net,m:akash.goel@arm.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,amd.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5C24E6D8997

On 6/29/26 11:06, Philipp Stanner wrote:
> On Mon, 2026-06-29 at 10:52 +0200, Christian König wrote:
>> On 6/29/26 10:49, Philipp Stanner wrote:
>>>>
>>>> I will add a CC stable before pushing to drm-misc-fixes.
>>>
>>> No offense intended or taken, but don't the DRM rules say that things
>>> do not get merged while there are outstanding concerns or significant
>>> points in review feedback?
>>
>> I haven't seen that before writing the response.
>>
>> I usually go over my mails till the end and wait a couple of hours before pushing anything.
>>
>>> What about my comments?
>>
>> Looks valid to me as well, but I think that is a separate issue.
> 
> But if we keep it an integer for now, and if that check is added, and
> it most certainly should also catch negative integers, shouldn't it?

Maybe with a WARN_ON(), but not as regular code path.

The thing is I think we need to backport this fix to stable kernels, but switching from signed to unsigned is only a minor cleanup when no real users are currently affected.

Christian.

> 
> P.


