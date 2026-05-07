Return-Path: <linux-media+bounces-60781-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOjRLCp5/GkQQgAAu9opvQ
	(envelope-from <linux-media+bounces-60781-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 13:36:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 584DB4E78CD
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 13:36:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 981163024A17
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 11:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9513B3E866D;
	Thu,  7 May 2026 11:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="eZgwNX7W"
X-Original-To: linux-media@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010064.outbound.protection.outlook.com [52.101.201.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD173DCD88;
	Thu,  7 May 2026 11:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778153756; cv=fail; b=UdqmZ8DQiAIa3HTsLtWzsl6ca5EsjGVJrbfmwRNgNWkxF0lHdnsdOV7d9VmN3q9fYxrmqcUXwnv/x+GpxQsp5jYWAj4WJf8Rsv2uft1AFwi8dravT3Hv6YPrH1YY5NjG5EtSscrM4HdShMGKWo3mQcXSI5+/+7/ws9joVw9DZvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778153756; c=relaxed/simple;
	bh=9xUUXI9or4CYy3J4FtjJOd6IG1/4viHpa7PprGt99m0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Nt2QcFSSXLfDHmGTSkXF9YBFGUK+1a19y3PNfFCtpddJK/z7o2wfne6Xwkue4nuFIpkwP0X24wdWZK1XJ3vNr1VyagT8O4EQ208Pw5H/Rt4gKuueBxi9nQHB3skXydr6jibKCoYoXxdvvmeobFiME5b4oAqTHfnm9O5K4o/3bfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=eZgwNX7W; arc=fail smtp.client-ip=52.101.201.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cCV76/VbIpeabubopHgNT5KmDt/N0e1pLQihRJsumL1QE5tiSq3BjHle2fhE0ZpxezsLdB5Xlg3J2BYxphn3o57gIek2GcrefcBKDES60Lw2ev2wm02QQ3x7b5NR0bXFOUlCNdRaFXwH7Ku7wvTJKxj1iHQe6UvCU/pKNs85jqkpJa2fkHxAtElWaXLDGBmYg8IcDTvKtbsII0O2l1opcB+ZSL+0t2fL1hHdcdlpTDFPoVshL+e9QGGWfydDk8r7+YvuV1k7vx7cq95Q5sBFf+CgJ7BrihAEtQe6x1FP6TlmhO2eZ+K5VR1CoQxl7xTX+ngHKBAErIxeH84Fkm6xiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3tZ9Df+6xyGXnbdwce84lyz3ti1TvdAdikpWhLyEGoM=;
 b=UUWC69Mvo5Ikab51eHRKkySwZ90Ip+Q7C6aQW9jtBfNg5sjIzJVwO1JoYskeNFaeCmjUy4H8uu6Yonef54SytoARJVtdKVS2ia737ZLAeK1pUUS16y4S+w0Y6oEx/KYWe25jkuGdAW/Md23ex1LCfMLunKhQG/MKVTDAfFiqc/w5yCEkIWCXjrjqaZFhE7ONPjNsv9/PrzhboVetaZuTnoEogoAsH2SC7lggX4GpZyuhJss0cNjEYaxkXuheEKpqjEzradTYz4kxiYHS/vqMqHj/Cd5HnnDGow8skG1LtTKTfJqpHXhrHvYU9Sdc1dF5OIJjrnMUc5T9xliIppCqjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3tZ9Df+6xyGXnbdwce84lyz3ti1TvdAdikpWhLyEGoM=;
 b=eZgwNX7W9Dkxu39b+Fd8VTZjllf5vKg1bQpN2eJBi7ZOviYqI2d5kuhG5NB/Zx9+e74+NXTEWRO+CoabCK2wYvM9hRwYVZjNutiw9XT9uOsLwLZ9raIPHTycbRDrArC2VVplshrdbSE++Gp+pEFh1IW8wA5dtHJYOQEm++lpLVs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB6949.namprd12.prod.outlook.com (2603:10b6:303:208::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.18; Thu, 7 May
 2026 11:35:51 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9870.023; Thu, 7 May 2026
 11:35:50 +0000
Message-ID: <b9c1b7a3-12a8-4104-b98f-a1e57b343046@amd.com>
Date: Thu, 7 May 2026 13:35:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Regression due to /sys/kernel/dmabuf/buffers removal
To: "T.J. Mercier" <tjmercier@google.com>, Julian Orth <ju.orth@gmail.com>
Cc: corbet@lwn.net, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>
References: <CAHijbEXhuVRgkkPA2dAC=njGBU7vpAbxAbsSmxvvPznO-ckVRA@mail.gmail.com>
 <cf945dda-f526-4544-bc43-22f70acb28f5@amd.com>
 <CAHijbEXQfm4QDDfo1yiVBV9mVvogGqt_BAu2ipnhqa-EDOKteg@mail.gmail.com>
 <CABdmKX1pDc7wpLVQzM0ihH6AfW+=KWdyaZuorMqWCbC80Y7-Bw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CABdmKX1pDc7wpLVQzM0ihH6AfW+=KWdyaZuorMqWCbC80Y7-Bw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB6949:EE_
X-MS-Office365-Filtering-Correlation-Id: 648388ac-2848-439f-f835-08deac2cca35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	A2yBIx8ZtxB/sBvYr1/X/VX+dqZNMZLQOdY4TTCowSAuh6ZVSwB987KEASY378E29NtOr0F2H5mlIvdBJw2L0x8scYu/5wzXcfeua+4Wzh5DOgBYCVNQQugzKbD/7koX6EO0K1ZZpBSqaH2R2LBwfK6Dilwz8CC/gEgvbmdK8HAHxO0TTOwZv4cAVHnObcMdRqAKuuDvdoXxY1E5pqGm3At4xTyoq4q6a/SXbTRv6XYQg/imXuJVQVkDzbkgTNnxKr2LLfbTwDKN1n2PN/I/YSikRyXo4HU8ehMrjw6fW/t9iCff4Vpd/SYx7/NTiSyMKwDT8L7qDCaXC+J8skMRQiKS5vVbfLM5OgRIFK7hNeC17hdhuYv5Ts1HzznuuZzz2QXxrYvwdBFdAYpgQb+0T77FXRuIYP1JCiIxi7D/qqGbLzn06wNzlx3yT0KEQVeW22huepLOwVgqA6aziMu8YBzrD5/UFf/lpn7iLvPbupHbUureEih1YzQa9s9ie/dDNjZ5OwW9H1hI7LyTJNMNXCWseIZRKo9FyF4yuHCwyvrS+yikcxGKWGtZFBZD9Um76Do3uPkzHfuA4w9A3ZakXazGUZfmqTBIzId5bQA4G4l4ZndlJpue11rL8O7Hc8dZDrKt13TUq1kaBXlbnD4vREQhI8nCjUyBfAtP2Ppf1w4C68ZZ/T392wAWcIcPDW9qiciPqHkxUDCBDKcWj4cIpQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TU4vTnhBUzlsSEQ0NXdROWZ6WWRQeW5aZnMyaUZYaFA0NDUxdXJNY2RKWW13?=
 =?utf-8?B?T3kwbDJJNkRYRzNNMmtMa1Y3ZWcyL1p2L3FVWEpHSjh1SWllakk1b0orOW9R?=
 =?utf-8?B?cnFLOTc1ZFVjVTk4VFVkc3hpV2x5TWVRSm84cVhKQmc4amtMa2NzL0NCSi9p?=
 =?utf-8?B?cWx1ZkZCNGZtMkFuOHhKTGtwbitYenhSZmhqS2dFNC9JYWU3enMveGVKSDg5?=
 =?utf-8?B?cmFZNm9DdHZRczhGLzVCdzBoYWx5YksyUHJkNkxvZjRwdE5wS2llNFFEQ3Z4?=
 =?utf-8?B?SVd6cHFoNXU3Q0k2T1lYWVBleGYyYjEvdGcwRjljUlBRUXdXNllJYjdpcTBx?=
 =?utf-8?B?a1EvLzZHSXdmbmc5M3h2VTU0aUdXTlhsVkVtQzdHUVJ3Z21JdFd2bGtLcGIw?=
 =?utf-8?B?NnVFckpuU242MGxnTXZVL3l6VGhTS2JuSVJuSU8zM0Zkci8vMzlGWGVFY0Ro?=
 =?utf-8?B?UUNaMWpIZjZyZXdQVDJrNUROOXFQbVBUNVRha0dVWlB5NG9EemF2NzdoT3Yw?=
 =?utf-8?B?cEpydjRNaVdSZDlNMGlWY0hodW1nWWU1dHlMTUFIRVNuYVUvaGxGZlFaRk54?=
 =?utf-8?B?RTA4dzhoU3AwclRxMDFxckhkOEZyYURQRTQ1YmgyYUpiZkozQlpqbmp3cmtP?=
 =?utf-8?B?bSt2bkRTa2NIcUZVdGdSKzBHOTRVbmJKNWZqeHloaklpQVdFNEpnSnphOVE4?=
 =?utf-8?B?bHlaUWxkMzhnQ0hud3gxZ3FNRE9HQktHN0pvanZxaWNuWVZVT3JHMGdzOHBv?=
 =?utf-8?B?cEI5MG45MXcwYUZqK0FWUGdtMWNpUThPZXhnRHM0WU05ZzZmc1BlSmxEY2I0?=
 =?utf-8?B?VWlzRldXL3FiRGRPMFFmQWRJWDZNdUluNlJUNXdJS3Evb0ZwV3ZhTUtCRXly?=
 =?utf-8?B?TFlWczdXZXpPVGE3OUtQTStKSjVnNzNEajNySURKSHU2dUJ5UUc3ODdWbm41?=
 =?utf-8?B?L29nMmliQUxYOUp4UmR3aVIxcXZIK3lJd1Y0R3Ywa2xob2NadWNNRjdPUXg4?=
 =?utf-8?B?NkU4UXdaRDVybWZZdWRDT1E2dTlmVUlxVFo0STFTZEFSajRuRHdKeDFyRGFS?=
 =?utf-8?B?aU5RYVczTXVzR01wK0lMOEJRdjhxZ3BGdml2cXlhR0lUTk5YaU5CYWpuaFFy?=
 =?utf-8?B?ZjVuNE16K1dObGJ2Z3NjTzR6RTN6eTdBM0FjSkFjVGFmRHVEODAzaVYwTkV5?=
 =?utf-8?B?aGNkaE5aS3JxNmxMR0g4dHhsWjRkcHYyeUk3M3g1ZEhLWk4zcUpyc0tpRE9L?=
 =?utf-8?B?MFM2QmYrcVJwblV0a0J6RXZ1NUx0aUtPVitJSmI5OXBBeGpJcmRsbTFuQUNi?=
 =?utf-8?B?NFBSYm01UjFvYS9JSVZLQjE2STlVZ0lhS1lZZlM5ZUdTancwdXZZa1huWE5T?=
 =?utf-8?B?cm0rVTRvQnN4QWdXQk9wL0pSTjQzTmZBUDRhcW9BYy8rdjZ6emFoYkhpeTlv?=
 =?utf-8?B?ZGNnc3dQYUNrZzNIVG5LN3g5Vk56TzZVVk9qN3JHdkZJSVFrR2xsK0xQN2Nw?=
 =?utf-8?B?S2poSzZpNDdvZjVpT0ZKUDZVQ0M2cFR4c0NwU0FWaXQybk5PK3ZQa1BEbWJF?=
 =?utf-8?B?S1BwUk12UTA2ODhENnI2RGo4YmNvWmdxT1FvYVNkN21VOWJkeGRWMGxzYnpa?=
 =?utf-8?B?dG1yREJlc0ZKWnhHZDhZdStvUUVzbUV0cUxDUSt4OFIrYWlYOHdJNGJKcTdW?=
 =?utf-8?B?cDBYRG85STRTdHhnN1lFTmE1cFhTSysrYzNVWVFnYzhDVkp6OVNmYWp2SEd6?=
 =?utf-8?B?ajJHRm5RVGJJOXBPS1J5b0FaNW1HL0FuR2tvN2VrYXdEdVgwMkVzaE1ybWRJ?=
 =?utf-8?B?Z0Q0WlhCTVFJRWg0bk9xOVFwc3lKZmZaYXNyY3ZhNGowTGRBbjJiSVYyZ1BK?=
 =?utf-8?B?OGtJK3JkU3doNktPcmF5QU9LVHpDNWNSNGIzOEVIS082aWJFYUYvWVo4RXpL?=
 =?utf-8?B?dTRwTEtjbkszcXNLRjJGS0tpc1E2dUQ2Z1pUalJsZUJveEFudEdEVndVUDlJ?=
 =?utf-8?B?NC9USC9GSDBkaVdGZFFBMU0reTdnMzdUK2ZNUk5HOXI0VitGWUg1eitUcE14?=
 =?utf-8?B?b0NSYzdseWxBMUYwMGdGVUxjQVN1Y3VGY0FsdTl5aGd5NnV2MXJZQ1JicVc3?=
 =?utf-8?B?c21zbVg0TkNhZlZhOVFTaVNnZlEvdHBSUlhwQnBMUkR2S29HcEF5WDVYa2xM?=
 =?utf-8?B?RExadm42S2ZMWVF1VnJUZjBabnFuc1Y0RmI0NWhkT1NNQTlDdmRSaVFvYWtt?=
 =?utf-8?B?UmtpaFJtWE5OaVRVejlubkU5aXFIam5SSVZpdTlXdWYwekFZOHk5S0h5N3FQ?=
 =?utf-8?Q?qsp8PVuzb6K3iI51Tn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 648388ac-2848-439f-f835-08deac2cca35
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 11:35:50.7876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vQZM9jgkvd0DN+xErr6aDyLCjjVz2BqssdPKbKEJBrzgcJ33eOzxTYKXRdiXBSRY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6949
X-Rspamd-Queue-Id: 584DB4E78CD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60781-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[google.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 5/5/26 16:32, T.J. Mercier wrote:
> On Tue, May 5, 2026 at 6:00 AM Julian Orth <ju.orth@gmail.com> wrote:
>>
>> On Tue, May 5, 2026 at 2:41 PM Christian König <christian.koenig@amd.com> wrote:
>>>
>>> Hi Julian,
>>>
>>> On 5/5/26 14:25, Julian Orth wrote:
>>>> In ab4c3dcf9a71582503b4fb25aeab884c696cab25 ("dma-buf: Remove DMA-BUF
>>>> sysfs stats") the /sys/kernel/dmabuf/buffer directory was removed.
>>>>
>>>> I've been using this interface, specifically the exporter_name file,
>>>> to detect dmabufs created via udmabuf. Such dmabufs show "udmabuf" in
>>>> exporter_name. I've been doing this for two reasons: 1) to detect that
>>>> mmap on such buffers will be fast and 2) to detect that GPU access to
>>>> such buffers will be slow.
>>>
>>> Crap, I really hoped that Android was the only user of that sysfs interface since that approach turned out to be quite broken.
>>>
>>> It's number one rule on Linux that we don't break userspace. So I hope that you don't insist on bringing that interface back, but if you do I will just revert the removal until we found a better solution.
>>
>> Bringing it back shouldn't be necessary.
>>
>>>
>>>> With the removal of that file, that detection mechanism no longer works.
>>>>
>>>> I'm not particularly fond of that mechanism but it was the only one
>>>> providing that functionality that I could find at the time. If there
>>>> is another one, ideally an ioctl on the dmabuf, please let me know.
>>>
>>> The virtual fdinfo file you can find under /proc/$pid/fdinfo/$fd also contains the exporter name for the DMA-buf.
>>>
>>> You can find the full documentation here: https://docs.kernel.org/filesystems/proc.html#dma-buffer-files
>>>
>>> Is that sufficient?
>>
>> I think that is sufficient. I probably didn't use fdinfo initially
>> because 1) it's a lot more work to parse and 2) I wasn't sure if it
>> was intended to be machine-readable or if there could sometimes be
>> newlines in the values and such.
>>
>>>
>>> Additional to that the debugfs for DMA-buf also contains that information and I'm open to the suggestion with the IOCTL.
>>
>> My application runs as a regular user so it cannot access /sys/kernel/debug.
>>
>> Having an IOCTL would be ideal if it is not too much work. I'll fall
>> back to fdinfo for now.
>>
>> Thanks, Julian
> 
> Phew, I'm glad fdinfo suits your needs.

Yeah, exactly my thinking as well :)

A college questioned me this week how to find DMA-buf stats for debugging and it turned out that Google points to the outdated DMA-buf sysfs documentation instead of the debugfs one.

No idea why, maybe we need to improve the documentation here a bit.

> Adding an ioctl would introduce new UAPI so I think we'd want to avoid
> that unless absolutely necessary.

CRIU has some similar requirements, e.g. they need to know the exporting driver of a DMA-buf.

Not sure if the fdinfo file will be sufficient for that case or not. But yeah I agree that we only need this if actually necessary.

Regards,
Christian.

> 
> Thanks,
> T.J.
> 
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> Shipping an entire BPF compiler in my application, which the original
>>>> patch suggests as the replacement, is not an option when the removed
>>>> alternative was simply reading a file.
>>>>
>>>> Thanks, Julian
>>>


