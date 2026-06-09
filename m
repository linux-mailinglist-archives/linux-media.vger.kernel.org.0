Return-Path: <linux-media+bounces-64289-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2ZzlF+LtJ2oz5gIAu9opvQ
	(envelope-from <linux-media+bounces-64289-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 12:41:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AC665F105
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 12:41:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=vDRM08Fp;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64289-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64289-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9383C3134A0A
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 10:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CE303F4DF6;
	Tue,  9 Jun 2026 10:26:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010067.outbound.protection.outlook.com [52.101.46.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5276A3F824A;
	Tue,  9 Jun 2026 10:26:19 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781000780; cv=fail; b=EPdBSfO0CtP7wWDV/KhcngsUrngPcp8duzmkxZnZ9dbAIe3yZueeXN61CYP9CsFTCMi9gZD1XVZYuYEsBNVk7L00H8J/NVPkJNmaYSfoMEXe75THuawuu+MtP8LeOsxo3k1E1EW9rk9asQPTCg4uzmx2NoD8G7x4f7PnVB2yZRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781000780; c=relaxed/simple;
	bh=XRVfu4j89JUXyQEU8HjJ1C6vfMegXS7L2mBq5MUFO/E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jt87Gh8DDtrOqok4RTxthEUXxri72zdA/hDl9Dl8i1om/Z6J0VF34WKF8Ocfyx3UHr8IMdwiWmR5jRtFklAQz9QXU8yGjRmyNyjpEAsEd0Yww2/DjPrbfdY1fU6KjaNII750HMuue2bfqcVcVnI9j1ZvZ0mU+t8A1p5Evd/fyKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vDRM08Fp; arc=fail smtp.client-ip=52.101.46.67
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tZhBn834SNJ4CUE/w200kv/qW0clz6eDEePhS8vubbZwOL5hAjZcozySw17r5XVf/rUahAnNRK5uouc0vt1oQKhjPCVETAaVE8/rC4vk8cOEyeqkfOCy8PC6YfM9ekkq+VRBU+cUzpTpIifmCftFcogmqscRO/jHScQCrr+mHPr6H0RkvQqWtVev+skpqKCmt67fV0WQtIL/8rf02euprL4Szq0GsamBwUe8B/j+hZj6/OwdZ2l0BJqF+LH1ZxO1fU5Qk1lAu3y/KhL3xmq5IKnDln72eXoDd8kWJ+BkeBTzLHfzKB2kVqMxDYtXBnyBHX/OgWOTBeyko8/5/ZJF4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZnUEoQ73pgk5BbOGxsX5QorhqCI+mdxnQv1iaAoUilM=;
 b=jymQYr+1eJXEmG5prHNs+clYsbdZePxqbnxvXybwtGs4fdrAkXDaQR/cNPu7Hvq0JOM6cFhirs1r3xXiVWwM/WZasx3B3HEKLJHPjds+s32UCsnfJGMU8e6kkkkVVFYrHBHSeQdiO4I8oxeJvwf0huF+TAL6Ix28gPUf2Aomp1C1fF8XeiF0y1V65yKkWuxVyxR8CVzxYvlxi11L+hy0ED/wNHlWeLl8mNkCzsgiXMN0BeqW4yQCcH0Psa/Yp/DlEUh3Gk9dl5a3P/8lsNUor7g6+NfLQT1NkggK42Da0bSDhiVzFZ8L6ScCf6kk6iBEFWXegnKKa1nUX4HMaNxYPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZnUEoQ73pgk5BbOGxsX5QorhqCI+mdxnQv1iaAoUilM=;
 b=vDRM08FplMBQjmLQWZeaB0NagEvss+KTddo3U5V9I+6Od3WCuClE5CA3SfW5zbQjMJgUUsKXqrJUTItziXbZgFwJUk9HU0Y/CuvKKYxjpAVb//pT+8Wxqm/rBIF8mDBjgpD+52AU6eBflVt9XMooogpuFikyPpL4LWiG1kKgaEY=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB7347.namprd12.prod.outlook.com (2603:10b6:806:29a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 9 Jun 2026
 10:26:14 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0092.006; Tue, 9 Jun 2026
 10:26:12 +0000
Message-ID: <66349a9f-d9dd-498b-b118-1c79d3aa3cca@amd.com>
Date: Tue, 9 Jun 2026 12:26:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] dma-fence: Fix races of fence callbacks versus
 destructors by locking
To: phasta@kernel.org, Danilo Krummrich <dakr@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <dwlsalmeida@gmail.com>,
 Gary Guo <gary@garyguo.net>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260608142436.265820-2-phasta@kernel.org>
 <95f4ae6b-9dec-4122-84e0-fbb0cdee9cb5@amd.com>
 <fa9a335196525adbc03ec21b2e05bb526e4fc174.camel@mailbox.org>
 <9d49c901-fcdf-487a-a733-0320d0bdf94c@amd.com>
 <DJ3V3OCLIK2K.3CYKWYNHYU6JQ@kernel.org>
 <ea4e0541-3702-4014-b8f6-0746a148df86@amd.com>
 <DJ3VYD71HDQ2.3C8GG983Z2YCM@kernel.org>
 <c8564ea0-8ff4-4049-996d-bd978c478372@amd.com>
 <74bd33a06b75c291c3e2eda19e0250fbd280c49b.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <74bd33a06b75c291c3e2eda19e0250fbd280c49b.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: IA1P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:464::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB7347:EE_
X-MS-Office365-Filtering-Correlation-Id: be7eef10-27c8-40e4-ab35-08dec611873c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	SG4FVm3YWHpdnEsFWfeug/tzmv3wnyv1TwXrtfYjWp+HOZsZJ19l3IKzcx8V5YNQ9Gp/1jcf9xxcsN57nYy2VgoUV5QhtiJ1Pwavf8m4qzcPaBlwQr64YI5e4SBSXNpX09Su1diWBIHCLOhZ4v1H50bbaykpGmgvO+j8zD8hf1JnttLPcNjoKoSZlGVO9T477+07n4M9/BdZgb5Grc/Pc8DrbZWx9KBHw+0qBkjtXqowG+wzgjJhkHaox42MCkwPqbu9c6AnZhjPN49pJaOiAtIsCI+NKEi+IA0W6FblESfn5Eefedn5Whue7YdQ7yll1J6stDIcAiEHak56+pcSTqMvyRmXLD88vz1UUhH1IefkRmTAiIVNE7mVaCS7H3CJYKnTZIqAh632QqdOIaQYUCs83Tq5t9eCi8Uq0VK5zfMXZjrcXpoT7iv5V0eS2ZKDNdGTu4C9FLmip9cCaLsY1HiC92LTJmq//vkJOW2Vr9v/8BNQLGqxBEqYscm9f9eLkTRx+rn9Y9AHP7xFXhNx7m6m2CgYROGh8iIvZ2mVpjcjjdxw8M/qj/unQj0sB4pLFKdmFxZEpEG2f9OV7Df+oyK5gtCFtvVr9ZLxrq/qld47whhbMYF1dtkqrBTplGl1jOUgFIhEf85a7nEvPR7aYa068eyB/YpYRjEGrxO9MQAswjTHNyRRkr5Uc175pUyP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YURvaWJUR1RUeWxtZTN0Y1RWK1FtY2RCTFdsUytYc2k0L2ZDelVPK3l2MXRk?=
 =?utf-8?B?R1JMQlJLMERpbWZxY1pkZDlQSmtSa3kyenhwbGNnSHRDNEFRdmNlNUhvQW54?=
 =?utf-8?B?MW1GVnUxcEJLMDUvU29HaWpXNzV3NGxxZHB4V3J0eE5vWlhJaENmSEx0RUZj?=
 =?utf-8?B?TnNqaDlVbkhNN3RZR3hub2ppVEthR1VWK2xrSDBzV2ZLSzluYmVxeXpOZkND?=
 =?utf-8?B?bzVrRTgvam5pSDNyVWNrb0ljMTJEamVMdXpJQ1BkcmNUK3pxZXpOTHc4M0tE?=
 =?utf-8?B?V1hTc25pZ21oQ0pxeDJlUFRxdSsvVGFZQ1owM2NhaGgzUmN6MEo5M0lQSURv?=
 =?utf-8?B?eG03UGprWEZvaHVmOWMrRFM4R1JobXVvNlRUVmNjRVZ6WDdYL1I5dmcvWW1C?=
 =?utf-8?B?WlRzTXJIZFk5b1Rhd2tQcnJoSFhEWXFsa3o5NHQzaUhMYzZGS1BScFBRSzVq?=
 =?utf-8?B?TElibWpta0UwNWt5RDNNK243dElaVnBueXRFdFVYVWhUTlVxK0dUSTdORDcx?=
 =?utf-8?B?Q0lhTjI4bHVqNnhuQzNvR2xwYUF2WTB3K3BNTENKb1ZQaTMxaXZ1OGl3Nlps?=
 =?utf-8?B?amp0eGdqMG9QRlpxWUJUUWFrV01NSHBIVjU1eDEzd2JsWGc2WXRVUzNzMko5?=
 =?utf-8?B?aDhoVWFqUHE4QXlrU0hSU3FCMEpWMEVCS1lkWStQQ21LN1RSR0hGLytleGlx?=
 =?utf-8?B?aUg3SmVPMXBjdys3OTBzNm1zbS9JNk1KNDRpNGZBRVFPeXRlbWFtWGZGY1NI?=
 =?utf-8?B?dUtBT1JER1dIUHhYeldHMWdHR3lmcVFmRUNzVmVPL1FKdXVUV0lRTE9oWHNt?=
 =?utf-8?B?SUVJWkZSVzlEcEpNNDBqbTJmYWtTcFVZemc5amw4RjBkOCs1dVZDd29ORWQw?=
 =?utf-8?B?QmhVWTlESmtWdWxXeEwrblNFTGwzck95M01oUmR1YUtaRmFZdEp5ZHNKR0JB?=
 =?utf-8?B?TWNXNENyTlV4bEVicEVPcE5lRXBQL3lhUmRLcnV6OWp2bFhDMTRvWURKZTZ2?=
 =?utf-8?B?Sk5TNWJLU2lhQnNtTVpwa2tuNmZOTFM5NWw3REt5YkM1b1FnSE1OSVFjWVZF?=
 =?utf-8?B?SWdvbktaS3VTU3hCV0tFVDY5RGNXbVgzV1R0NzZmQjZuT3drV2xrMkIrcFd1?=
 =?utf-8?B?Z0Z4VktYL2tyOW4rSmpVeGJuU2daN015aFJES1pxRE85UkZaaEJNaEc3czZI?=
 =?utf-8?B?VmszMVNCKzlvdHN6UkhkU1hqVzNNUHpyQXhyZkVsWUpMVUVvSXVnYUlBUHRz?=
 =?utf-8?B?Z3V1ekY3WDBxczRCblE3aXpXMWNPR2pZaWJSckdVN3pxTFZ3dkozL05mRlFs?=
 =?utf-8?B?UEtOY0IrUWNOSmxnUURzY3QwZjZKYVFGVEtPQ2UydUhnNERqTUFhWDBhZi9J?=
 =?utf-8?B?VGJ1QzhxODhwMlB3b1dJSURhTDA4c1RZNlE1ZHhoT2RNMXhLY3hRQmh2WFdI?=
 =?utf-8?B?eEwyZGNqYnkvS2JmRWY5OEVjS0piVmRPQ0lDNzNtY0hkMmhPdy9OOGxJUWw0?=
 =?utf-8?B?bHlVcWNVbVpCT21CMURJUHpWc2tzelNRRXRyTzBTd001ZUlsdUxiTXh6dktE?=
 =?utf-8?B?bUFwdDM2N0F0WDg0bWxrZDRlRU9rOFEwNFZzVXFnejJKcDE1M0N6UWRlY2l5?=
 =?utf-8?B?bnc3OVZoREVpdFp1c1psaFg3dUlKbjVDZFlQZkVyTTFHL0ZJYU52YlU4QTQ3?=
 =?utf-8?B?bXYwOWVPMEcxOFBIY1JMY083WTNpa1VPSmo0OTU5MlNTcFVIU3VYTXViNGd1?=
 =?utf-8?B?QVpLVG54WVBjamp0RDZzTk1IWmJDRERIM2V5Qjg4S1pWNlp1K3pQK0ZkV280?=
 =?utf-8?B?dUdEWU5UT0FjSjhNOExNMHRJRGVWbGpoZzU2TUVCZVFwb2hpWTdyb1czNlRE?=
 =?utf-8?B?M2s0RTZaZWp0a1VicTlQcjFDaGxGNGNWOG5wSU1iNUs4YWxmbENvNWdVcHFV?=
 =?utf-8?B?bWcrQXpaUk5VOVNTZk8wTXZLMDlhNisxQU5RL3g5MWZlRnk1bWlmR0tCWDg3?=
 =?utf-8?B?OWd6V3Ewd0c1RUZhdzIyUzg2L1hhR2EzMzhyenQvMDE5K0M4S2RYR0kxbFRo?=
 =?utf-8?B?MTR3Ym4wUVZEMlRIVlhIcFMvZm05VC9PYW0xd0ZnTlBOS0dJT0R5cXZNSFpw?=
 =?utf-8?B?a0V2NFZmN2NNV0JoVW9iUzBHdGVIb0V4UTczV0NRdGlCM2QxWWdja20wM042?=
 =?utf-8?B?S0pPejg3SW9tUzNaQkVGS2lISDdITnQ0RTIvZHkvRmxFY3NJb3k5bmhTaFVG?=
 =?utf-8?B?eFo0OUovQmhHeGM3YmR2QlUwMXNqcGM2OW9YVFZCZVU3ZzErRUNycWNsOU1Q?=
 =?utf-8?Q?zQYFl1qDCdl/MhR2/w?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be7eef10-27c8-40e4-ab35-08dec611873c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 10:26:12.0261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OtuU6STFMhc9scsi/Fawt1cHYtA742cRj7RgxZX28GlNPfDujicBOMuynDuGX0T0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7347
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,collabora.com,google.com,gmail.com,garyguo.net,igalia.com,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64289-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:dakr@kernel.org,m:sumit.semwal@linaro.org,m:boris.brezillon@collabora.com,m:aliceryhl@google.com,m:dwlsalmeida@gmail.com,m:gary@garyguo.net,m:tvrtko.ursulin@igalia.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,amd.com:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 59AC665F105

On 6/9/26 07:52, Philipp Stanner wrote:
...
>>
>> In detail calling the callbacks without holding locks allows all implementations who need it to explicitly take locks in the order they want.
> 
> Didn't you say a few mails above that the implementation should not use
> the fence lock for its own purposes?

The usual use case the drivers have is this here:

dma_fence_lock_irqsave(fence, flags);
was_signaled = dma_fence_test_signaled(fence);
if (!was_signaled)
	dma_fence_signal(fence);
dma_fence_unlock_irqrestore(fence, flags);

if (!was_signaled)
	cleanup();

This is actually what you and me came up with for the KFD when we removed the return code for dma_fence_signal().

Taking the lock around the enable_signaling() callback has the exact same reason, preventing the fence from signaling between testing and calling dma_fence_signal(). The problem with that approach is that cleanup() now suddenly runs under the fence lock as well.

So you are left with few options: Either the fence lock is external, which we don't want because that make the fence non-independent, or cleanup() defers work to irq_work or work_structs, which creates numerous lifetime issues.

When enable_signaling would be independent of the fence lock we could avoid all of this and just use a normal spin_lock() for the cleanup.

Regards,
Christian.

> 
> 
> P.
> 
>>
>> If you call it with the lock held you enforce the fence lock the be the outermost lock.
>>
>> Regards,
>> Christian.


