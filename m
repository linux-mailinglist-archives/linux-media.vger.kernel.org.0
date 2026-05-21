Return-Path: <linux-media+bounces-62548-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNtkJkyND2oyNQYAu9opvQ
	(envelope-from <linux-media+bounces-62548-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 00:55:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1174E5AC7BA
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 00:55:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B787E3010B9F
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 22:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9BC9368946;
	Thu, 21 May 2026 22:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="J6mznSbG"
X-Original-To: linux-media@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010005.outbound.protection.outlook.com [52.101.193.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5E636604F;
	Thu, 21 May 2026 22:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779404089; cv=fail; b=OYpG/WmT44YPCibd747MD94JK6RC3XWId8Bzvl0t93wDmgY1fT0/VoVwrJARdDpW33+P+aU7ESR2lssMrZpnb+rXm9csgghgB2cfzUm8kmj21r6/gP/bXZ+KmFPxpj+XiME+BuoEEai0NTLUKnDyBuj1miomO32jEGfjaxjc6YE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779404089; c=relaxed/simple;
	bh=jACKmYVhaWffEqJAZpYWGeb1ZNr2dkF+uF9XipsIgQo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rC62nM8FknjNMTKmbcYV2KMqagxjrsFJABXCkXtQWUXjPT6TApk/vyzenc7vG3QTdWD4YSDnMOGMQxA08cvlRMXYKeczYcfnaV++TlX7Bssu5uhZ0KqBbFeFPhxXb3zm9suYhatWUgerET/KPgr7VGgzehL9iwdk+n05NEdN3Io=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=J6mznSbG; arc=fail smtp.client-ip=52.101.193.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Svv+/v+Qtycecahp8jQXccFXPlHSKdWM6OZz/TOeChhQyvn17OE26iXRhYnASrDpuTH8TQO8Ea0wfXr4RVgXEchsZymQGFnLvKhLXtSgZaDSLNbqn++/65EjkaWNFOzSnbG9bAzYTfMYHpHyYf1GExqHuO06fTdkh52+PY0fugUwnv9qhuNDyhhOggHrrEro6e4pNuH+bm5m8yItAOYY71C5sL476UL0mOou6mv+DB2KtuPP8LhMI71EJ51SdXJS2ACmcq5U16wSkwUkOu72UEYK0C+hW1oA2+RWXjTGbgc/9iMmRvz1jgf3euOMLkjq/CgT7WJvDvIfjXoN1Rc0YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bPFMtd43LHKf0SYSrgWJ6l3TJd2XxCN+4G7FsV1yXlg=;
 b=aT8q+I6kcBi03E7tUzbuDEPsqlFUMfDzMgNFq1eUsMtrpb6O+9qxvRRCLtfWd00FmmN7SNrrEtxCBE9Iybt2jLrpx5moJpHgkrFdFdaj1Pzo+RLQAxlaS9lMA7Wx04u82MM1w8KN1a6Kwg9rDZVdrpROJ91UYTSf6s6Q77b3QdDviFI3pZNUPcO7Y3I2Y67xQAYYNracoLN5buRZM5zGb+j+ZPULz3yTWKALasQHCUIZaS9ZAl3wrcBBgqBSKtTimna+/JdJlf+QMFOyJIHJfCOhZqU019NXLzRfI3E6LiWOxYWzCc6VqA8ZhRGreBZkoI6sCIG2aISo+KbPf0pIYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bPFMtd43LHKf0SYSrgWJ6l3TJd2XxCN+4G7FsV1yXlg=;
 b=J6mznSbGgYCK1sHFIj3NWC4iz+WtaXeEX5kl9d/XnjxgoNqpNIT6xW//xnxyHuBt4vElPR6UjOD35fZl4NZWZOeYRONjYto3Lk0pGHNMFYfP70L8JeGb3aoxoVo0CDK6ZQCTfigdMTdYGzoaAuD3vShN11z3DMWeHAt6/RJW2HgdQYPqe8UzDRbNqERtcBaPLQ/GErKca+uDY2Z/51Oz+4zOBtee9KXWuom5VE3/YFC/+Xjv23Pm8I5R9Eaq75E7gEGYytixljkygmLufH5oVgUwvcFMd/S36ynlSmwvbhEDqY0QNiZaC38g6dMofZUZ/xHKFTWBqsxvltQoVKuUDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB7102.namprd12.prod.outlook.com (2603:10b6:806:29f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 22:54:43 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9913.012; Thu, 21 May 2026
 22:54:43 +0000
Message-ID: <59658f51-f6d4-41e1-bb3d-dc0f1637f6a5@nvidia.com>
Date: Thu, 21 May 2026 15:54:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: set SB_I_NOEXEC on the pseudo filesystem
To: Christian Brauner <brauner@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jens Axboe <axboe@kernel.dk>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
References: <20260520214350.168689-1-jhubbard@nvidia.com>
 <20260521-dilettanten-klarzukommen-9351cba40c06@brauner>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260521-dilettanten-klarzukommen-9351cba40c06@brauner>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0120.namprd05.prod.outlook.com
 (2603:10b6:a03:334::35) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB7102:EE_
X-MS-Office365-Filtering-Correlation-Id: 78f5df30-9178-4c0e-54da-08deb78bf266
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|11063799006|6133799003|18002099003|56012099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	RVvPgVNU3uXW0zqIGB1nWGlrNeuG+yH4w+racYokKREWpUrCHPUm8Mll9Av5b9U+op6S5Jqh7C9yPnW4euu0ZJk5fiFVdZ1FutSeSCmzzaRH8FOVOXLB8kPw1OW7hTy871s9Nvzqldo5/kLWhHGPCOLoZRCRDHJhzjEexxwB5gt6uGdefCl8yR0HNkV0NLnW+zYAVxKr4dq0WaSD+aeC5MAQavUab1soxl/JM0i007hTBZlRGELjXBqooPUDILOE31nCSwJiVgcdzh1E33PvOnNp3EaysnKH+6/cVycLM5dD6IS7VOb4AhKin7Z8QD1sKESvhi1ewu2plfQ8kZFqsyD8A8/k/q/iuq5oiSl26ctBII5BTOlTdFjUx5V6QMJz16CDSkqWXEbT+4gAKiNMQPF/eh2GrE53m8FCei268aSdmJW6DTAt29p9ViJgscrhpM0cAWOtTd7Sm9n1APg1Rgwftt1U3P7vT54cRlLcR9JFGY2SJjtYe50GYsCyts+Vb/lVUrMOyMpNHfVZthLHyjLeQzPG2DvLPx9nelQMNcKlU6Qad82cPbJ1Q/P5qXLClr4XLbQROE/liTacBSAksXmMbDrX+WzvOfblFITp45tBUCdiMsVhyvH0S4ixnLvNlmhXFtbS6el9DX6VWdmOLwyCjb4ZlRhFybMDMuemFJWB7DTAv+eb9ud2TiQZGnSH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(11063799006)(6133799003)(18002099003)(56012099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YW5BY0pVaEpkRkh2UkpFaE1lMkN1K0M2c3d2SEx6MnBnaE5SUXlJQjB0ejJu?=
 =?utf-8?B?RWdrTjVNeWc1dWEwM0hCQnljMTBiQVUwaUtaVlJkZDM4a0Z5Y0s3VnVocmRS?=
 =?utf-8?B?c0pxeVdnbXV2cStVdEZMRDdaRk01cStBSE9SSG0xWGQ1aUlVY3k4SjNnRDAy?=
 =?utf-8?B?SDNFb2QvaC9QNUt0MFhTcFMyaEZST2dEYkVVUDhMVXZyT051SmZqUUVkdGZM?=
 =?utf-8?B?MlJ0WEpvbEVzaUtzTjFCS2h3YzhOVk5LdkdpLzI2bEtNMm5VLzZ1Q1BFMjdN?=
 =?utf-8?B?MFk0SUNHQ21sYVNpRXlhRWROSjgzM0s1TFFSTGtRQSt4UlgrWUlFZDMrdEVV?=
 =?utf-8?B?SFU3WGJkZ25oOEpLTWFBR21DeTFZTTFkWTd6SUt3MW9OSUNLdnBWaUNnNlJV?=
 =?utf-8?B?MFJlWXFicnB4ODB4VmNWa2xKd0VXbi9PZjZTSmhpRG1YNmVFRU1mRWl0SnVB?=
 =?utf-8?B?c3lrWHJkUFdWWnZmeWVlcnJaQi9aaUlsT2pvWFpxVDNFN1BKMEQ0dmUyMGpt?=
 =?utf-8?B?RmRNVjl3TUMwVE1leXVpWFcrWXFKWS93SE1uWjhLL2xVRTBEY3JiRVJxdmww?=
 =?utf-8?B?b0NVb21HaE44R1dzZ3ZWWWtxaitmZTQvV2tIUWNkMlFWTGdXNlZYcitwRU12?=
 =?utf-8?B?YVNvblZOMTRUUXUxNExJZ1B4NTloOGw5ZWFRdkk1MWt6RVNpNW9iMGRQdVAy?=
 =?utf-8?B?WnQyWUJ3VHNXeGVKNWRuOHZNUTNZYW50RWxNNVJkMndrZnpoY1ZUeWdVdDU3?=
 =?utf-8?B?cDEzYnM5NWJrM25QcXI4SnVIQVVubU1iY21mOTNNdzRnNnB1OHB5SXp5Vm5V?=
 =?utf-8?B?N2xQbHAwMEozRlNmUFc2UklDMjhrSEVFc2IrSDJZb0ZHZW1NWmdobTdUVnk3?=
 =?utf-8?B?ckQ4UGFROWNrMHd2RnI3TGwwSTFrY2M5YlZKQ3IxMVdzQ1pGZkhpZHdiYVha?=
 =?utf-8?B?ZUU0Rm9BYU1WTzV2a2xRSHhaaGxsamNBdUUrSzJESnBkUnlEWWZpZ294VHdE?=
 =?utf-8?B?d0N6a1BHbzlKbmQ4bXdrejdXYVlHTU1MUFQ4TU9OQlFUajZ0SVZNQmE1aXV4?=
 =?utf-8?B?a0pxSEY4OFluMVdLU3RYQnpUZGVuQXlTQkVRaDNDTlZsTzlOS0FtMEV3czRB?=
 =?utf-8?B?bDQ1TGVPN01tNVdjMmh4LzJaSnJGV3NTeEtRNE1tZm1SVXZ2TFBUdXpSb3kz?=
 =?utf-8?B?elhrU0dySTVzMFJFZlZveXozL3ZUbVo5NXllMU1UNlJjalAybVNRRlc1bm11?=
 =?utf-8?B?VCtXRDhNbXE3WEdlY2FlWnBSVnI0WFFmalZuT2RZdWZrWm1LRHh5WWYyeW9S?=
 =?utf-8?B?ekVBSy96U0tzM1dwOFZINXZWNFBOZ0Ribks1bE8zZGFncE5sOStjK2R6ZlF4?=
 =?utf-8?B?SzU4YWpOZ3V5MWF1dnFlRWNsRTNZdmlVWHFFODQ0MmdPcWJPZFI2U1JpZGE3?=
 =?utf-8?B?aXlRc2Y1d2I2Rk1MNHZ5MUhxSGprNmFBT1F4OEg4VnJmNXJnc01wQ0NRdlpu?=
 =?utf-8?B?UnJUcytPT2tpbFY4NnQwZGZ5MTNMUTQzZGpFaDRLbVk0QURLbk5hRU4zTllO?=
 =?utf-8?B?MEo4aEJhZy9INlBkZ2hnRVVRZ3psVFh2UCtpM096emR3RzNjVnRrejJQczdu?=
 =?utf-8?B?VlI0RTFoTVJHdjF5eUQvSzlSUnY5MmljZk1ZamlRa3k1RURPeWwxbS9ydUFl?=
 =?utf-8?B?Q3hEbFRKV3BsMzJFMnB0NjR1MFBxWFpQSUxWbE94ZG8vc1o3ZnVyeXNmS1lY?=
 =?utf-8?B?VE1xMTJmM241SWdZb3BoV0Q4UUhOd0tJaG1UcytvSTErR0V2T0VNQVIxRXBa?=
 =?utf-8?B?NUJUSUw3Wkl2K0RZNzNEVFliNzVXYVE3TEYyWmU5bXlmUnhSZjYvUzRjZ0tI?=
 =?utf-8?B?amVaNjllNE9mZEx2ZVl0dDBqRzRMRzRoYU8wV0haU0JCMGlWeDlha2ZCSHg0?=
 =?utf-8?B?bFUxSWgyOENFaU5xbUFyTlkrKzBaUzgwNkJwclBiSzFLWFc4NCtwNTlIdFVY?=
 =?utf-8?B?VFF1L3ZVTENLL1JhQVYraGhta2NuTTdBdFhaSmxXaEIzY2VXZi92ZDY2OHE0?=
 =?utf-8?B?V0cvVllIVEVVcWR1NElSN21IeHdDM1Jqa3J2RVBKUDFDblhERXB3VXAzbXRx?=
 =?utf-8?B?MmN2MzJhb2J0czhod2orMlhHeUhMZE42OVhsdXF3eTdNTndtLzdTQnIxZm1V?=
 =?utf-8?B?OTdmekFoWDdKYkcxNkVTek9uMGdUanB2SXpWNXlncmMzbFU5QUFKdklBMnhE?=
 =?utf-8?B?N1g1clJZVG1jNitTK0JvSUNEc2xsdWFoR3JRNHZjUmhQQWxvVEdrOWl2dGhz?=
 =?utf-8?B?bzVLeVBMd0NkNEI4UDVkNnJIb3BIeFRlWTE1V2x5V2hHZndibkZzQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78f5df30-9178-4c0e-54da-08deb78bf266
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 22:54:43.0329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V88K1jQmLEphZa5n3YfU3VWiN35yE4ZKnMKh4jNUrW4kRUWPEyZQWxExmKyDP8K6Qrf+rx0vI5nJ42YB5KK9VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7102
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62548-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jhubbard@nvidia.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 1174E5AC7BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/21/26 4:54 AM, Christian Brauner wrote:
> On Wed, May 20, 2026 at 02:43:50PM -0700, John Hubbard wrote:
>> The dma-buf pseudo filesystem dispenses S_ANON_INODE inodes via
>> alloc_anon_inode() but never sets SB_I_NOEXEC on its superblock.
>> Since commit 1e7ab6f67824 ("anon_inode: rework assertions") in 6.17,
>> path_noexec() warns on exactly that combination, so an mmap() on any
>> dma-buf fd trips the warning:
>>
>>   WARNING: CPU: 11 PID: 121813 at fs/exec.c:118 path_noexec+0x47/0x50
>>    do_mmap+0x2b5/0x680
>>    vm_mmap_pgoff+0x129/0x210
>>    ksys_mmap_pgoff+0x177/0x240
>>    __x64_sys_mmap+0x33/0x70
>>
>> dma-bufs have no business being executable, which is the invariant
>> that the new assertion is enforcing. Set SB_I_NOEXEC on the dmabuf
>> superblock.
>>
>> Reproducer on a CONFIG_DEBUG_VFS=y kernel:
>>
>>   make -C tools/testing/selftests/dmabuf-heaps
>>   sudo ./tools/testing/selftests/dmabuf-heaps/dmabuf-heap -t system
>>
>> The selftest allocates from /dev/dma_heap/system and mmaps the
>> returned fd, which trips the warning without this patch.
>>
>> Fixes: 1e7ab6f67824 ("anon_inode: rework assertions")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> ---
> 
> Perfect, the asserts are paying off. Thanks!
> Reviewed-by: Christian Brauner (Amutable) <brauner@kernel.org>

Thanks for the review!

> 
>>  drivers/dma-buf/dma-buf.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>> index 71f37544a5c6..d86a99d7b8dc 100644
>> --- a/drivers/dma-buf/dma-buf.c
>> +++ b/drivers/dma-buf/dma-buf.c
>> @@ -216,6 +216,7 @@ static int dma_buf_fs_init_context(struct fs_context *fc)
>>  	if (!ctx)
>>  		return -ENOMEM;
>>  	ctx->dops = &dma_buf_dentry_ops;
>> +	fc->s_iflags |= SB_I_NOEXEC;
> 
> While you're at it, also raise SB_I_NODEV. You're not creating any
> device nodes and this is additional hardening.

OK, I'll add that and send out a v2, after collecting any other
feedback on this one.

thanks,
-- 
John Hubbard


