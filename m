Return-Path: <linux-media+bounces-61985-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOVlIToKC2o0/gQAu9opvQ
	(envelope-from <linux-media+bounces-61985-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 14:46:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2594E56CF36
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 14:46:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 915943024A22
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 12:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F01421EEC;
	Mon, 18 May 2026 12:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3fTYU7+w"
X-Original-To: linux-media@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011067.outbound.protection.outlook.com [52.101.62.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA6A4048A2;
	Mon, 18 May 2026 12:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779108104; cv=fail; b=Kw/ZarqRZ1imlZxQ4m1yC3TNLJLV1RjEhZpbxXQZ0Tz7BvN62lPvAoK+kd6CLfo2yWoVr3MSdSw8V4KcwVUaXR2kLmX8JJ9bfG/djxMH1iEP7M7S1VN9DiV3XKlgNpVta2P72wcQVZhLtQaqAsazrtmWPML6EP9PRs6+5dJAUCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779108104; c=relaxed/simple;
	bh=8c3r6VcQvRteerZHwV5Cy/YWo6fgcB2wS8kgXCprJIY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=e5Y+DiHIerleHPxgHngNlYzoW+YpJfUZo0tV9pxCXbCUAD7XuZyWWG0Rk5MXJNR4WJyFOpK79DL8vtluSYyr2SHxThdrGgj2yx9qPhsKFj5uEY2VesiFjAcWKlQNC9CAdUtmO9iHdq0dndBCYq/VJa6y7uNkVgvE2iOD/YTVwOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3fTYU7+w; arc=fail smtp.client-ip=52.101.62.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TTxIXDxN+MJYm7v7sgkcCLtrEAp+DKo1B1MwwTxnsjluO/JwR6806skKpiVSMK/EbbNMBS1rwmVgQK4hr/5gArvVU717XUnKVFEZDKNqkfFlx8dTXLoaCuZgIkgxu2klMiAYprU5XqcVGT8MXAxHkO+vygWLrOLJ7PgP71qzrP3Dfm3qgz3P9K+nFbd37EJjU8hrXcjBFf4OPDRnEjRzwUE21FRxJIHRFsTFLZO0S3LtXOG/Yzc4OW0SzPq409Jg8K1/yaAFre6jXLdPloLggENIZs6EDlXDMnS/6cVfU3JTJ7h6+fwnUwSJVaogARZzwXk2lG43i982LWaQqddUig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q/Z/E2hFjFFAbzsL9ceWcozmjH4Mqz0lGgryK33A4zI=;
 b=PcjnrXf5mVESC6ajMWCdssjISSDR8E4rukNTcqYauGpi+La/Td6ReVHaCkxEmZY2oALMebAOozPRcwVc6q5wtR9S/c2tkT7MvjA/Z1mdeBlyA64B9kR1AjQ0i8NQxAyNVqBB3F8ZanZXcbx6eyhZswUjQ1UqIUL1RmQyDAeOh3ryDCFEZSsrBS74bag3T7Yd+MWnI7z9HigsdPMQQSd2JLhnVOoqgwIB9sy+QJnFmz0UhSLaU6vXWNTuQQO50Qzs8bEOHxr180yqDVwlf6Ajqjkx0ejPLaX8LH5eChvzmRTMGnuK+QAdsY+KsYtX36ptw4IQA2NT90NBGi3KGOKNiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q/Z/E2hFjFFAbzsL9ceWcozmjH4Mqz0lGgryK33A4zI=;
 b=3fTYU7+wUcwRoua9ZOK2ckVwRv6Fq/eKT26JA5rKjTBibXxsZmHsRFjWzmtTwFAwAnHU3ydTYGMc/UW0fFdSORp8qJ8xfeepCOqNFy2JnnWXuvDYNmyxr9S8jNxYaO80z+ARaoPwMillGuv2tOn0NhX+7RVDbYu/skHcoaRkmYg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB8193.namprd12.prod.outlook.com (2603:10b6:930:71::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Mon, 18 May
 2026 12:41:38 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 12:41:38 +0000
Message-ID: <69dcbcc1-da58-4d34-bfb0-5c8d33b75d59@amd.com>
Date: Mon, 18 May 2026 14:41:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] misc/syncobj: add /dev/syncobj device
To: Julian Orth <ju.orth@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-doc@vger.kernel.org, wayland-devel@lists.freedesktop.org,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
References: <20260516-jorth-syncobj-v1-0-88ede9d98a81@gmail.com>
 <c6c91de9-a34b-4b50-a3c1-d42bf7631f8e@amd.com>
 <CAHijbEUzWZC4GAMU6YGV42gOYkrQaMZZPiwS4Erb4H1J-fh_8Q@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAHijbEUzWZC4GAMU6YGV42gOYkrQaMZZPiwS4Erb4H1J-fh_8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0379.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::24) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB8193:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f45624a-3473-4923-5efc-08deb4dace05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|56012099003|22082099003|18002099003|3023799003|11063799003|4143699003;
X-Microsoft-Antispam-Message-Info:
	wdEsQJ24qQ6Xc+YMHcsMhJ5WOpolYX9OUcxBvOT0O3N8OcoyQ53gY8W/Jpeub1ebrAFkn5+45FjGhpYdahkNTN74mJwv1vjQvfuAVxQ31VnntSfnQfxOBuOGhu9lamGlpgm5ha19NbcmCVMS13vzeBgW/52o9NeeVDiVatU5tmrQz3tTBeXmcz2kob0GNaETAaYi4LHXIKn/IovNt9RuJftEYgL6stFW8LSSeizDV2v4zj/o46Y1/68DBugNx8HfCc06XZ5IyZ5UH3ypr3s2sHEkc0fPGLvPopMv0X2QFgo9j84IgrjGjisMbMRMxTvN1fLW7nyk56j0Xvt1HK6tgS+SNqmVMvBYJtf49RrU+aN3g46xpCzVk7f+yTq4zXDoE46SNv311QbDftU2t6BpKf0jUU2WqnFqrD7kwCPROnSjof5Cr06/Gq0nBceYtj4ZL7GFwenqPT4T/eyrPErBKKgym8/rudz+RMq5VGyntqtlDfqJyJtgpNaLi7DKUZ3uPaux4hrV/SI91W6xSofjV9bsGHNZRd4sapJLFka4uPsF4cuUWWopUntuw15hbaHkIYz2cVKFQ5OU1tWkBDrxC9TnXWq7AvUpe8Bx4R1/PxT4VUTU+TT7Km3Vw9E6ZCNz9YUBBu1nW48urjs6eS7EndyUeUhu4oMh1ywgnfIsLxkklVQzlkpEoOHw3hZiIYpm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(56012099003)(22082099003)(18002099003)(3023799003)(11063799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1ZGNkZ1UGlGdThOaGdwaU5EcWhueHpZMjZyN09lV052aCtNUHpvNVYwcnZt?=
 =?utf-8?B?Zis0SjN1dU00enJySHk2dW9nYWljTktlOHdST2NJWk1xcGZ2V20yUlVBdnVS?=
 =?utf-8?B?M25haHRUNTE1eUJnWTJ4aXhlWUpnOCt6RCtaMEVDSzFqZXdWcDRSaTMvUVRa?=
 =?utf-8?B?Sm52cUljcDBhZEJNL3NUbmZ4cTdrajc0VWNEVHVCeTYvTnV6TWsyZSsyb0Nv?=
 =?utf-8?B?Qlo4L1oxVzVkYXdZWmgwMk5YdGV6Rzl2eVF5bHJMOURvZkxhTGV5UjBjRTJo?=
 =?utf-8?B?VHQxMWNVc3NyWjhvZFc1ZE41MWgyMFFUSnVsWVh1WmI0VjZkcytGTHNMUktR?=
 =?utf-8?B?eVFWT2F4bXAwSHBWK0g0Q21ITjFJZVI5NUh2VEFaVjlNQTFNNy8xbCtKQ0x6?=
 =?utf-8?B?SituRjJvN2p4YStLUEw1Y2VmTHVabDBjT05CV3NBKzN6ZmkvU3NSczZ4aUZE?=
 =?utf-8?B?akNQVUxQQlF6SENKM2lTWTlSMTFDVXFmdTBpSW9LbUJyZ29pZXdnZ1pNenIr?=
 =?utf-8?B?ZFg0K0tVQ0ErUDJXVmtmMzBRQUlGRzMwMWVJY3FKUDl4c1RVUzM0eVBPeHp5?=
 =?utf-8?B?U1U5RmFZSnhmV2xuUTFac0dTWlBhT0pKbFhndkpQMGM4aGlxU3g3a0xqV2My?=
 =?utf-8?B?VWU0Ym9zdWNXNEZsRmJUMzIwYlB5cjZwZWZBWWUzVTFON29xQjNpZi85QlFQ?=
 =?utf-8?B?WmFtUUdnVlJMYzJtVGpyWC9VV1lndlhWdjZ4Mmd3SEwvWnA0SUdqK25ZUldO?=
 =?utf-8?B?NWVscUJ4Y1RrcHdRWXRsTlBjTUFIVE1ONC9xN2prNkNzbzEwbmhLbmhmNHM1?=
 =?utf-8?B?SUNTeGE4THZuSUk3NlkzV0MwTzFyc1IycHJNRzAxZHFUTTF6OHJlVDJyNTMz?=
 =?utf-8?B?MVJSaTRjZUhLejg1QVIyWlhYbGVvMUZLMmZrd3I1ekpPWnBJVTdnU2srOVpC?=
 =?utf-8?B?Zm9pQk8rOHdiT09YcnZyNUhtdkpyLzBLMkxURGE0RUdvdGROVVJTNXV2dUpk?=
 =?utf-8?B?L1hnVjRiTWhTc2FQSjFGZzZkcTJQYWNGdmtJYzBpb2M4SnJEOXVsZU9uZ1Q5?=
 =?utf-8?B?YTZSWDVlQm9lYkRhYUJ6a3REMnNCUzRoQVBLN0xCbU9UM0l0N29lQkhJMXVX?=
 =?utf-8?B?VkJMV3FYMmVFOHFEYWY3RVBaZnJMK0dyQW1CWmNoTjY5UU1lbGJkaC9KSlBr?=
 =?utf-8?B?QWIwYUpMYjVmMk1rYXJjcUxsanB3bFJuQ1ZYRGZWREZrM2FBd25oL0dYT3NJ?=
 =?utf-8?B?cFRUQVdtaE0vcm1DUGJYdkV6Z3dwblZhcS8yUzlRek1SbDllSnJRUWRNbmU1?=
 =?utf-8?B?Kzd2YjByTkFHWDhkMDJwLzhoSitnRVROM1g3RmZoTFowdU01WWN6VTRWdlRE?=
 =?utf-8?B?UnlnQmZRRUxtNENzaEZ4WC9SYitSL1h0c0tVVGwyZndiekFDOG9FZFBUN1BJ?=
 =?utf-8?B?YmFic1c4eURsWHRROVdObFlTSFExMERLZ2FtQVltK2VCdklRdHVEOEJWeUh0?=
 =?utf-8?B?VHM1QWUwNCtRODNsU2R0SUs0aUpudC8wV1hZUktuMUVFRGRQOTRpcWkwOTdv?=
 =?utf-8?B?N2lrM3BoZHAxU3hSSldESlp3WHROQ1loMEkzRkpPOXErdC9RMUVUOVg1cnQz?=
 =?utf-8?B?cFNnOHVNV3QvTnRPV2htYyt1VHM4ZFE5ZEdNS25wRGtVMk1IbzAxZERSOVhC?=
 =?utf-8?B?Rzg2K2g2UXZBWHJtejVqVDJ0d3FBVjZzNDhPeDZidSt2cDBnM3ZkcGJHRkVv?=
 =?utf-8?B?ZlI5dHMzT0s4NXpUQmZveDVBVEx4VFdsclhaVE54WmhBUnFFTUxvOEJzNEFJ?=
 =?utf-8?B?c21iSm5BMk5MemFYdzczQ1ZzVEpyZ1ZoOVpYZnlZODZpWWlkOHgrTGxvdUsw?=
 =?utf-8?B?UDlSL3BmWUt5QVBTTEVSSW9qV2ZuektxNHNDRE1HbkJoWWFZVHdYU2ZsRllE?=
 =?utf-8?B?S1JyQWpjbkl6YXMzdE5SeFlEQU9UUzFadlRPbWVYZzJZWTE1R3RDVDlhdlpQ?=
 =?utf-8?B?SktndHc0dE1FbE9jci9tRks3dmltdWFiTGk2TFR6anlQVXhLQjdRVUZYbzNT?=
 =?utf-8?B?UnRYYzNua0JuSTJrNEdlNW52djllN28yZnlmMGlJM1R2YldYTklTa0pkSFEr?=
 =?utf-8?B?TzM3alhLeHcxT3JVblk3TUcvRTkvZG5zeGVCYUlGN3FmazUxZkJCM3RCVDRQ?=
 =?utf-8?B?dmVGNTdIN2NIYi9XbTkrSTJzdXN1TUZVUzNMS2tGV2YwMnkxdFRyaFVCZ2ZP?=
 =?utf-8?B?bkY5ZWhqNGVNRnA0a2dOcS81NFN3UUkvaVFHZ0ROTlp2L0k0TjBveHM3bHov?=
 =?utf-8?Q?7cO3qlggzgpuZUSnRA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f45624a-3473-4923-5efc-08deb4dace05
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 12:41:38.6721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LRL49hsLdY1w0S4PO+fSQ0SbN+4/+/VOAXuPIUx6PTTny9VIHur4zCxwZrM/XC2/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8193
X-Rspamd-Queue-Id: 2594E56CF36
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-61985-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linaro.org,lwn.net,linuxfoundation.org,arndb.de,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,mailbox.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On 5/18/26 14:02, Julian Orth wrote:
> On Mon, May 18, 2026 at 1:58 PM Christian König
> <christian.koenig@amd.com> wrote:
>>
>> On 5/16/26 13:06, Julian Orth wrote:
>>> This series adds a new device /dev/syncobj that can be used to create
>>> and manipulate DRM syncobjs. Previously, these operations required the
>>> use of a DRM device and the device needed to support the DRIVER_SYNCOBJ
>>> and DRIVER_SYNCOBJ_TIMELINE features.
>>>
>>> There are several issues with the existing API:
>>>
>>> - Syncobjs are the only explicit sync mechanism available on wayland.
>>>   Most compositors do not use GPU waits. Instead, they use the
>>>   DRM_IOCTL_SYNCOBJ_EVENTFD ioctl to perform a CPU wait. Being tied to
>>>   DRM devices means that compositors cannot consistently offer this
>>>   feature even though no device-specific logic is involved.
>>
>> Well the drm_syncobj is a container for device specific dma fences.
> 
> Not necessarily. The DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL ioctl attaches
> some kind of dummy fence that is already signaled. I don't believe
> this is device specific. That is also the path that llvmpipe would
> use.

Yeah I feared that.

This is the wait before signal path and if I'm not completely mistaken that one is not supported by a lot of compositors.

The last time I looked for GPU support the compositor needs to spawn a separate thread for each client to support this approach.

It could be that we have eventfd integration for that as well now, but in that case you could give the compositor an eventfd instead of a drm_syncobj fd in the first place.

So as far as I can see using drm_syncobj for software rendering really doesn't make sense, eventfd is a much better fit for that use case.

Regards,
Christian.

> 
>>
>> What could be possible instead is to pass an eventfd into Wayland, but that is something userspace needs to decide.
>>
>>> - llvmpipe currently cannot offer syncobj interop because it does not
>>>   have access to a DRM device. This means that applications using
>>>   llvmpipe cannot present images before they have finished rendering,
>>>   despite llvmpipe using threaded rendering.
>>
>> Yeah, but that is completely intentional. You *CAN'T* use a dma_fence as completion event for llvmpipe rendering. See the kernel documentation on that.
>>
>> What could be possible is to use the drm_syncobjs functionality to wait before signal, but that has different semantics.
>>
>> Regards,
>> Christian.
>>
>>> - Clients that do not use the Vulkan WSI need to manually probe /dev/dri
>>>   for devices that support the syncobj ioctls in order to use the
>>>   wayland syncobj protocol.
>>> - Similarly, clients that want to use screen capture have no equivalent
>>>   to the WSI and are therefore forced into that path.
>>> - Having to keep a DRM device open has potentially negative interactions
>>>   with GPU hotplug.
>>> - Having to translate between syncobj FDs and handles is troublesome in
>>>   the compositor usecase since syncobjs come and go frequently and need
>>>   to be cleaned up when clients disconnect.
>>>
>>> /dev/syncobj solves these issues by providing all syncobj ioctls under a
>>> consistent path that is not tied to any DRM device. It also operates
>>> directly on file descriptors instead of syncobj handles.
>>>
>>> The series starts with a number of small refactorings in drm_syncobj.c
>>> to make its functionality available outside of the file and without the
>>> need for drm_file/handle pairs.
>>>
>>> The last commit adds the /dev/syncobj module. I've added it as a misc
>>> device but maybe this should instead live somewhere under gpu/drm.
>>>
>>> An application using the new interface can be found at [1].
>>>
>>> [1]: https://github.com/mahkoh/jay/pull/947
>>>
>>> ---
>>> Julian Orth (12):
>>>       drm/syncobj: add drm_syncobj_from_fd
>>>       drm/syncobj: add drm_syncobj_fence_lookup
>>>       drm/syncobj: make drm_syncobj_array_wait_timeout public
>>>       drm/syncobj: add drm_syncobj_register_eventfd
>>>       drm/syncobj: have transfer functions accept drm_syncobj directly
>>>       drm/syncobj: add drm_syncobj_transfer
>>>       drm/syncobj: add drm_syncobj_timeline_signal
>>>       drm/syncobj: add drm_syncobj_query
>>>       drm/syncobj: fix resource leak in drm_syncobj_import_sync_file_fence
>>>       drm/syncobj: add drm_syncobj_import_sync_file
>>>       drm/syncobj: add drm_syncobj_export_sync_file
>>>       misc/syncobj: add new device
>>>
>>>  Documentation/userspace-api/ioctl/ioctl-number.rst |   1 +
>>>  drivers/gpu/drm/drm_syncobj.c                      | 374 ++++++++++++++-----
>>>  drivers/misc/Kconfig                               |  10 +
>>>  drivers/misc/Makefile                              |   1 +
>>>  drivers/misc/syncobj.c                             | 404 +++++++++++++++++++++
>>>  include/drm/drm_syncobj.h                          |  21 ++
>>>  include/uapi/linux/syncobj.h                       |  75 ++++
>>>  7 files changed, 795 insertions(+), 91 deletions(-)
>>> ---
>>> base-commit: 6916d5703ddf9a38f1f6c2cc793381a24ee914c6
>>> change-id: 20260516-jorth-syncobj-d4d374c8c61b
>>>
>>> Best regards,
>>> --
>>> Julian Orth <ju.orth@gmail.com>
>>>
>>


