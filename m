Return-Path: <linux-media+bounces-14958-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BF292F932
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2024 12:59:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 996C5284914
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2024 10:59:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AAEB158862;
	Fri, 12 Jul 2024 10:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Mfsd8FWT"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F927146D7A;
	Fri, 12 Jul 2024 10:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720781959; cv=fail; b=BoK9Zf/kYx1Xis/sEpAHWGEoeB67fid6+iXOfFW0ZfzK/S46EkuGc4lJDLfICnjsmnlqCospfhySg3eQ9R2qYe+NHYVlZ87gogIiIW6XMT6H658kwGcxlSbqza3LN8r6mszafC/NstAGJzYF99EQYPe4Hwz+LLcksJllNnNZYBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720781959; c=relaxed/simple;
	bh=Oc4e/gUdZ6R1BCcTIOlYm8dIVxBHdM3U7qc90SCGBWk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pDN+5Jzw4Gxjm1T22mgLLLyDCRRYa4CsRoULmu07bmkwWLrtNGUmxxUdHkE0U1O92z4YECHJwjTvo0Wa2zyJpES+TOTUZ0DpM5uIE8C/WX/driv947xT3StdtnsYfN4yfAJAFxJeTiMfOtin+mECTuG4/4PU2OaGM+bqct7Usfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Mfsd8FWT; arc=fail smtp.client-ip=40.107.93.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rude1vNoLIpcAJsxVJtHE3a6hThJuIn+1WX9AqE0/A7r8UlMfJfDjQsT9/MaxcdtYTCRenmu9dF1oox1Vjr+fAvbYpBxx49J2GepJYR0xD2licMaVIbio7li9fPL1b9ZO7ql/l0x1JFFAGCU1jM60HSpEkV+ShHcEqrhUGf+itXOTR5Rhwe5PNpHsAaVoPtGw/H0k+ooF90SjyVU0pZ2SHBku5+nhEooKp/34ykPYE66/K1Kp65AiJA96W+bfQ4OQkPivRDe9mghBQESHFE48x0GmlRfpUj8i+iJBjYD1gO7BlzCkn6cS0twJsS9yEX2H7tkQOVAeUIMVT/khcWQCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7cAKARd2OUuffIZw3hmTfLigX3g2glIjUC1Jv1JxgaA=;
 b=jRIFDS2R6VwTzFyE88XHHS1gLGCO8MMo00584zBT9WhWsCBCNTfkL4BXGIzxJY60bkGEOp2o7RhZ0jg2JNdJUiTqp9I5ed59wtrYnzkZjJtPjsoUBRlRzHwd7MLpoZ4941GHM782ft9K6r/9DXgHKeHdMltEXPRwmcvlzcHrWj2S0jf1wXDk1etsQf1WUaeTIAq4tJkBIdiekm5V1qZhTWja2y4FBzG3sfp9WpNuGYgNUZwY4ERPpbqxAQ0T1RE1/MA5Gk1DeQReJAl9uafL5QjlWq1/ebXcnmp671wfHHn4iblbRDG/txicVLfA92bEQ7STEScBLRBLqZumFaLnCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7cAKARd2OUuffIZw3hmTfLigX3g2glIjUC1Jv1JxgaA=;
 b=Mfsd8FWTtmj0lAXtPJg9SsDOLOOTY5ewfs7gnpQuKPbOoz1ihQNjPd2bVruYdV5XhalIRei0CmT6q05otL7emHkHcA+ph9sdQiU/B4Lx8r2cCHAd304R34VhIofz3XxCNi0m79Up01TcKsnGcaJijwWsc+jmA4N6DbWpnCcWn8A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA0PR12MB7674.namprd12.prod.outlook.com (2603:10b6:208:434::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Fri, 12 Jul
 2024 10:59:12 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 10:59:12 +0000
Message-ID: <9b70db2e-e562-4771-be6b-1fa8df19e356@amd.com>
Date: Fri, 12 Jul 2024 12:59:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dma-buf: heaps: DMA_HEAP_IOCTL_ALLOC_READ_FILE
 framework
To: Huan Yang <link@vivo.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
References: <20240711074221.459589-1-link@vivo.com>
 <20240711074221.459589-2-link@vivo.com>
 <5ccbe705-883c-4651-9e66-6b452c414c74@amd.com>
 <a95dece8-b530-4add-a664-ebab81f8b5d5@vivo.com>
 <63189ac3-7725-4ad7-966a-4ca679a25d12@amd.com>
 <72cfdad2-ba33-4b90-acfa-7e50b8d9ec51@vivo.com>
 <ea841c1c-fd7f-4958-add1-d3e96f68a11b@vivo.com>
 <df605c4a-56a4-44cb-9b7c-d466f9cc80ae@amd.com>
 <80426e64-d334-4e61-8870-a3da08705f9d@vivo.com>
 <6d18c552-37e0-4566-8b63-b0095239bad9@amd.com>
 <54d2d0c0-a620-450d-9d16-6d106ab62414@vivo.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <54d2d0c0-a620-450d-9d16-6d106ab62414@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0265.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA0PR12MB7674:EE_
X-MS-Office365-Filtering-Correlation-Id: d7b2693f-179e-41c1-5d7d-08dca261a9cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q0ovVktJVjE2QUVqTTI4djZ1WWo5RkZMcnk0OXM2Z3dtUWcyZ0Z1b2xyVkUv?=
 =?utf-8?B?VnRxM3h3ZS9UeDhhcUVLclpTWm9PZWxJNUsrUlcvbEh1Nkdpc2NlOXh6SUp6?=
 =?utf-8?B?QXZJcUQyNzZFN2FMMDBaaHZSRnBYTXExdmpNNVdOODhQdkM1cm15Qy9SR1p1?=
 =?utf-8?B?Y2dzM09pS0JSRDh2ZEsxQ1poN2Z3UjZOemN2QnpFaXFlQzNseGtZNDUrOGNG?=
 =?utf-8?B?NW1TOUExN3dQZ1Y1aFpjckViUTdlUG5yMEFyU3pYRnNtdldaZ2hENTMwVEdK?=
 =?utf-8?B?Z3dkdmtBU0V1emxsdDR0M1pBTGhSbFQ2S0RMV3dPMWhhaG5EL2cwSHlCeFJq?=
 =?utf-8?B?eC9rZUZyNjFnekovLzVENk9rTGpob3JyTFQwVUw0WjhQelZRVUhENlN1RjhX?=
 =?utf-8?B?QzlkYmZtT3JtMi8xaHF5Z0paU1diMzhQUy92aUJPbGczL2VBdUVEVVZsT2Jt?=
 =?utf-8?B?VlB3MUtOaUVYU1g5R2VBUWRGSkRSRk9CL1pBZVlOS2JzUkJWMXU0NDJTOWlW?=
 =?utf-8?B?QTZGb1JnV3hCNXZ1WXNCRHZ4QnplUHBFc0ZDY0Q1M053ZENPZ0lSK25rcnFF?=
 =?utf-8?B?SWUrbEIwQnp2UVJoYnJBSEQrdDcyYzhZeURBdDc3NjBZVWVZSXhLUm9hekRM?=
 =?utf-8?B?NHphUWZ2dllFYk1GVmFLZXJYQ2ZXVkZyeFhMYzYzbHVTdGFjY1VCd2NpQWtj?=
 =?utf-8?B?RFViT0JnT3dZbzQwWGRvemF0enplNytvWUhlM296VFBrQm5ta040T2tVUTFH?=
 =?utf-8?B?bnpqMllBYWJlVXIyamdXN1VVNnd6UENrZTl5RERjdjJ1WEFNaU5UbUszbDNS?=
 =?utf-8?B?cERkVCtuRTQyN2RzVHpaR1dyY0FycnIrenpZMTBrYnptdDlUR21XNUkxL3BR?=
 =?utf-8?B?ZHBaRjQ1eTBxbzN3YXZ4ZU9kcTlISjFhVWtxeUlRWDBjSkVwcFlxVzBCcTBS?=
 =?utf-8?B?RUJreTNYcFVXNGhQbFV0bzJENzMzV3l2b09NZUYwWU1oemhCZ1R4ckw4b2Uw?=
 =?utf-8?B?b1NMc05aSnI3VmRUNGQzTEdFSk1lekt2WGJqL1kvcE81cnppdFlKRDJLY1By?=
 =?utf-8?B?L0dzU1RlbjE1bnNscEdFMzZteklmd0VnVmcrYTZwQjNZeUxRUUpuNmVZWnZB?=
 =?utf-8?B?WDNmbTdLUll6WFdaSzBLWC9wbHVRYkVYdDZYbS8velRFcU8xOWdyZHMrS3ln?=
 =?utf-8?B?V08yV3dxa2dpcmJKK2t2eGtlZFVTWjRjTzFoVXgvc0FTYW8xM3AvUW1ua2xu?=
 =?utf-8?B?R0lMSlBYTVRQSUtGMmZoS25kUTR1ZDhDZW8xNmF1OFBNUitOYkswS0JnYnU0?=
 =?utf-8?B?TkhVeTV1LzBqalFPK3NuVHArUmJDS0ZLZGsxR1lOM3E5TmdLblFpMkxpQzlY?=
 =?utf-8?B?ekJ0ZDIreVEwbE8wQm5CWUdJbGZqUks4Z1Rsc3ltNjFnanFUV041YjUycWhW?=
 =?utf-8?B?RGpvTnRGSXJkdXh2NVlrbEFUVzhNOEFoUEIxWGtGMVR3OUw0VmxiNVg1c0JF?=
 =?utf-8?B?MEE5ZGppSzlrM0RwTkF3OTRaQzJDdnRRQUhQM3ptUll1ZDRQeXlycmZUMDRF?=
 =?utf-8?B?SWIrSXJ4QnhTY1F0YTV5Q05zeE92NUZ4Qnk0ZU9oK0VDT01tV3FmM2ExOUpl?=
 =?utf-8?B?SWR0T05BRUxIeUtyOXZsWHc0bURUanFXbFd4Ykg2WXQ3bVorZ3VoT2ZJRmF5?=
 =?utf-8?B?RWg3NlFJaDFQTVBkM0RzTUpGT3BRRHhkTCtiYnlYV2x6eVVvNVMvajIzRldC?=
 =?utf-8?B?NmZOWEVOc3cyTkE3WlNRQXcwdDY5TWdQQlN2TGsrSi8vQ1VhcjI3QW9Zdlli?=
 =?utf-8?B?SGxiWW1zVURMQTkvaGVWQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWJGbUVXMVR5WVMzazlVaUJ6SGJZTjc5SGJNY2RveWlJSTBSalA4RkdrVk03?=
 =?utf-8?B?SVBZTWFMQ0hUbVZqZVVWcmZ4eDdnWlhoSHJGYktBazh5Vk1GT2U4V0xNS1BY?=
 =?utf-8?B?alg3NFVHYkNOd0NPTlZVK0t2dGp4MUhMN2EyRHU5N1RzNFA2c21hWlNPaFc2?=
 =?utf-8?B?TmxQSjRKZjRZU3VyblkxQW5nK21qVHBOTGlCL1dlcGFKbSszMlg4aWlNOCsw?=
 =?utf-8?B?Rm5Jcmx3UU1GNHI3aWJhUytVb3ZmSDVyZVFMcFVDNVF5YjgyenFlRDFRYUJJ?=
 =?utf-8?B?TndQTXNnRXkzQlVEOGhVRzkvMk5ybWo0VW9SN3Z4SVZ0WnZtTjhQdVpYK2c5?=
 =?utf-8?B?dnUvMlU2Q1lzcFpSZ213L0tXSkNVTjVQOVJQV0NzVUo2UlplY1JLRXZuQWZ4?=
 =?utf-8?B?b0VGNzhabkhmOXc3Ymhjb2prbHVhWjVoaXI1TEFzVUJCSTZHWkIzUmRYeFpB?=
 =?utf-8?B?V0kvQ1pqRjc1c2JuZ1l2RjViZEtPUWVEZXFKbnVKa05FcUFjSk1WZEhoV2ho?=
 =?utf-8?B?SjNxVW9INzZSbEhZeGNNQ1pQbm1DOVNxeERmRDArd2ZTb05rQ2xaWG0wK20r?=
 =?utf-8?B?QVhHT2JQdUpyaml6MDhWUUYvU3FVcFFlcWQ3UjcvVTRxeC91bHNFM1h1M1Qr?=
 =?utf-8?B?ZVhhTy93elNGVFRVUzExV1NpOUNKS0ZoR0NjR1ViTUcxNi9McW1sUjJWRmVk?=
 =?utf-8?B?Rnc3eTE1N2k4cEdieHkxVCtlUGk0akU4M0s0OG9LMDUxdVBtSUQxZ1Z3U2tr?=
 =?utf-8?B?SDI4R3h4UWVtVWZ0R1FPTUxBd1B3T3lKbGxRRjVxN0hzVmQzL3IvN08xRlZw?=
 =?utf-8?B?YVFXS0tzL0N2ZDFVdVJlZ3F3TUJTdHZ1YThNWHpETVovQVZ2M0FPRGZVYkh6?=
 =?utf-8?B?L3ZVb095UGw3VVlSbGRhN0JiYXlTY3NtK291UTBUUmdGTkxRK0x3Wk9QbWw4?=
 =?utf-8?B?ellCWjJwQnRJT0Y3aHB1bUJsWXVUNWdJS1d0SWRBNy8vZWVhR1JxYURDVUJC?=
 =?utf-8?B?bGM2dGhxeW9zZ2lEK3F3ZnZrVUZoOVloYzA5cHZBVFFpWlFDQjJFYnJNNmVS?=
 =?utf-8?B?eWR0R2dKVlYzY1hqV1Frc0c1YWE0bGJ3NTZJQ21mRXZOODFpQ1FUSENaUlFh?=
 =?utf-8?B?N1FIa04xUFJLd1hEKzNKbVNEay8xN2l2MmZUdGxXQVpNcUJGS0ZzREVjaGNk?=
 =?utf-8?B?TlpNVTZWZEpncU52bUNUK2xtZ0NVS2JVeEFvOGp6VXVuRGFzY3lDMjJLNk9N?=
 =?utf-8?B?dGFHVzJmUFpockMvbURmMGwxdTFqOFduZERWTEh0c0tSN2JvTWhwV3B3V20w?=
 =?utf-8?B?SHI5ZWlxSk5qVmxReXdZenFFRGNjaSsxTTNPV1MwRjI1SW9EZDdLMnRsZXU5?=
 =?utf-8?B?ZUE4eFVFYmk4NTRDS2c1MDBCb2NrOHpFdmE0b2g4cDBDS0k2dTdwcmlPQmpV?=
 =?utf-8?B?WE15Q0JsS2xyTHpsUjBtaUdwNG1IWEorWHkxei9Yci9oQzM1bytyRHBkakJC?=
 =?utf-8?B?RHNhRGJPTENCbHJUSVJvTTJkQ0RqNCsraDNoendnVVd1RVRmK3N4YjNSclQ0?=
 =?utf-8?B?eU9SZ3JDTU5OY2x2ZnVpNE1uQ0NNYW5PMWE1WjBzK0VFWlBSMTlRSUZiUzk2?=
 =?utf-8?B?SmtKUnhNb0p6bWsrZ3lkbStvdTg3MGZzS3o2WkFRNFdvdnpodFBITXZWVnIv?=
 =?utf-8?B?Myt0UEFydXBjVFNEa3VyeDlpQlppOERGcENvWHRYU3kvcmE4eEFCY0dOQXlM?=
 =?utf-8?B?SXpQUnRrcUQrS1A5STBMZEJCNks0L1ZOWDlrcngyRFZMN2hrNXc5cEZOUHAr?=
 =?utf-8?B?ZGJLYXBJRlQ0ZWhMQ241VnlOY1JqZW5aVnRPYUMvZ3NwditJcVpHK2FoOGZX?=
 =?utf-8?B?NzFaUmJiL0pXOFRoYnE2amY3bzNTSWpkN2FvalVCdUIvYU1BK1JyOEEvYmwx?=
 =?utf-8?B?QkNDSTNLM2dUSWVyeGVudUh6bmJHcU9lV2I1d2JlMitaazI0OWp3ZjlYaFJi?=
 =?utf-8?B?RklxYlhsSWNUTHd3RXQ2ajVmTnRVcTRjYVBNRU5uUVdXUG9ycDlVaE1OQjY1?=
 =?utf-8?B?VXZzVFRHb3pxMzJLdzlhWUlIVzkvQWl3c3JtbWZGaUh0bHNLYXQyQmxlTHhQ?=
 =?utf-8?Q?MJ1rftN+0LstevMpQVxJnA66S?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7b2693f-179e-41c1-5d7d-08dca261a9cf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 10:59:12.6472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5RYuJS/ZLTFRiE7q+0OPHTCrT3CvEl7b20qaR0JSsnPQpV3LI6yCVl2/aI2J8Tbl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7674

Am 12.07.24 um 09:52 schrieb Huan Yang:
>
> 在 2024/7/12 15:41, Christian König 写道:
>> Am 12.07.24 um 09:29 schrieb Huan Yang:
>>> Hi Christian,
>>>
>>> 在 2024/7/12 15:10, Christian König 写道:
>>>> Am 12.07.24 um 04:14 schrieb Huan Yang:
>>>>> 在 2024/7/12 9:59, Huan Yang 写道:
>>>>>> Hi Christian,
>>>>>>
>>>>>> 在 2024/7/11 19:39, Christian König 写道:
>>>>>>> Am 11.07.24 um 11:18 schrieb Huan Yang:
>>>>>>>> Hi Christian,
>>>>>>>>
>>>>>>>> Thanks for your reply.
>>>>>>>>
>>>>>>>> 在 2024/7/11 17:00, Christian König 写道:
>>>>>>>>> Am 11.07.24 um 09:42 schrieb Huan Yang:
>>>>>>>>>> Some user may need load file into dma-buf, current
>>>>>>>>>> way is:
>>>>>>>>>>    1. allocate a dma-buf, get dma-buf fd
>>>>>>>>>>    2. mmap dma-buf fd into vaddr
>>>>>>>>>>    3. read(file_fd, vaddr, fsz)
>>>>>>>>>> This is too heavy if fsz reached to GB.
>>>>>>>>>
>>>>>>>>> You need to describe a bit more why that is to heavy. I can 
>>>>>>>>> only assume you need to save memory bandwidth and avoid the 
>>>>>>>>> extra copy with the CPU.
>>>>>>>>
>>>>>>>> Sorry for the oversimplified explanation. But, yes, you're 
>>>>>>>> right, we want to avoid this.
>>>>>>>>
>>>>>>>> As we are dealing with embedded devices, the available memory 
>>>>>>>> and computing power for users are usually limited.(The maximum 
>>>>>>>> available memory is currently
>>>>>>>>
>>>>>>>> 24GB, typically ranging from 8-12GB. )
>>>>>>>>
>>>>>>>> Also, the CPU computing power is also usually in short supply, 
>>>>>>>> due to limited battery capacity and limited heat dissipation 
>>>>>>>> capabilities.
>>>>>>>>
>>>>>>>> So, we hope to avoid ineffective paths as much as possible.
>>>>>>>>
>>>>>>>>>
>>>>>>>>>> This patch implement a feature called 
>>>>>>>>>> DMA_HEAP_IOCTL_ALLOC_READ_FILE.
>>>>>>>>>> User need to offer a file_fd which you want to load into 
>>>>>>>>>> dma-buf, then,
>>>>>>>>>> it promise if you got a dma-buf fd, it will contains the file 
>>>>>>>>>> content.
>>>>>>>>>
>>>>>>>>> Interesting idea, that has at least more potential than trying 
>>>>>>>>> to enable direct I/O on mmap()ed DMA-bufs.
>>>>>>>>>
>>>>>>>>> The approach with the new IOCTL might not work because it is a 
>>>>>>>>> very specialized use case.
>>>>>>>>
>>>>>>>> Thank you for your advice. maybe the "read file" behavior can 
>>>>>>>> be attached to an existing allocation?
>>>>>>>
>>>>>>> The point is there are already system calls to do something like 
>>>>>>> that.
>>>>>>>
>>>>>>> See copy_file_range() 
>>>>>>> (https://man7.org/linux/man-pages/man2/copy_file_range.2.html) 
>>>>>>> and send_file() 
>>>>>>> (https://man7.org/linux/man-pages/man2/sendfile.2.html).
>>>>>>
>>>>>> That's helpfull to learn it, thanks.
>>>>>>
>>>>>> In terms of only DMA-BUF supporting direct I/O, 
>>>>>> copy_file_range/send_file may help to achieve this functionality.
>>>>>>
>>>>>> However, my patchset also aims to achieve parallel copying of 
>>>>>> file contents while allocating the DMA-BUF, which is something 
>>>>>> that the current set of calls may not be able to accomplish.
>>>>
>>>> And exactly that is a no-go. Use the existing IOCTLs and system 
>>>> calls instead they should have similar performance when done right.
>>>
>>> Get it, but In my testing process, even without memory pressure, it 
>>> takes about 60ms to allocate a 3GB DMA-BUF. When there is 
>>> significant memory pressure, the allocation time for a 3GB
>>
>> Well exactly that doesn't make sense. Even if you read the content of 
>> the DMA-buf from a file you still need to allocate it first.
>
> Yes, need allocate first, but in kernelspace, no need to wait all 
> memory allocated done and then trigger file load.

That doesn't really make sense. Allocating a large bunch of memory is 
more efficient than allocating less multiple times because of cache 
locality for example.

You could of course hide latency caused by operations to reduce memory 
pressure when you have a specific use case, but you don't need to use an 
in kernel implementation for that.

Question is do you have clear on allocation or clear on free enabled?

> This patchset use `batch` to done(default 128MB), ever 128MB 
> allocated, vmap and get vaddr, then trigger this vaddr load file's 
> target pos content.

Again that sounds really not ideal to me. Creating the vmap alone is 
complete unnecessary overhead.

>> So the question is why should reading and allocating it at the same 
>> time be better in any way?
>
> Memory pressure will trigger reclaim, it must to wait.(ms) Asume I 
> already allocated 512MB(need 3G) without enter slowpath,
>
> Even I need to enter slowpath to allocated remain memory, the already 
> allocated memory is using load file content.(Save time compare to 
> allocated done and read)
>
> The time difference between them can be expressed by the formula:
>
> 1. Allocate dmabuf time + file load time -- for original
>
> 2. first prepare batch time + Max(file load time, allocate remain 
> dma-buf time) + latest batch prepare time -- for new
>
>  When the file reaches the gigabyte level, the significant difference 
> between the two can be clearly observed.

I have strong doubts about that. The method you describe above is 
actually really inefficient.

First of all you create a memory mapping just to load data, that is 
superfluous and TLB flushes are usually extremely costly. Both for 
userspace as well as kernel.

I strongly suggest to try to use copy_file_range() instead. But could be 
that copy_file_range() doesn't even work right now because of some 
restrictions, never tried that on a DMA-buf.

When that works as far as I can see what could still be saved on 
overhead is the following:

1. Clearing of memory on allocation. That could potentially be done with 
delayed allocation or clear on free instead.

2. CPU copy between the I/O target buffer and the DMA-buf backing pages. 
In theory it should be possible to avoid that by implementing the 
copy_file_range() callback, but I'm not 100% sure.

Regards,
Christian.

>
>>
>> Regards,
>> Christian.
>>
>>>
>>>
>>> DMA-BUF can increase to 300ms-1s. (The above test times can also 
>>> demonstrate the difference.)
>>>
>>> But, talk is cheap, I agree to research use existing way to 
>>> implements it and give a test.
>>>
>>> I'll show this if I done .
>>>
>>> Thanks for your suggestions.
>>>
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>> You can see cover-letter, here are the normal test and this 
>>>>> IOCTL's compare in memory pressure, even if buffered I/O in this 
>>>>> ioctl can have 50% improve by  parallel.
>>>>>
>>>>> dd a 3GB file for test, 12G RAM phone, UFS4.0, stressapptest 4G 
>>>>> memory pressure.
>>>>>
>>>>> 1. original
>>>>> ```shel
>>>>> # create a model file
>>>>> dd if=/dev/zero of=./model.txt bs=1M count=3072
>>>>> # drop page cache
>>>>> echo 3 > /proc/sys/vm/drop_caches
>>>>> ./dmabuf-heap-file-read mtk_mm-uncached normal
>>>>>
>>>>>> result is total cost 13087213847ns
>>>>>
>>>>> ```
>>>>>
>>>>> 2.DMA_HEAP_IOCTL_ALLOC_AND_READ O_DIRECT
>>>>> ```shel
>>>>> # create a model file
>>>>> dd if=/dev/zero of=./model.txt bs=1M count=3072
>>>>> # drop page cache
>>>>> echo 3 > /proc/sys/vm/drop_caches
>>>>> ./dmabuf-heap-file-read mtk_mm-uncached direct_io
>>>>>
>>>>>> result is total cost 2902386846ns
>>>>>
>>>>> # use direct_io_check can check the content if is same to file.
>>>>> ```
>>>>>
>>>>> 3. DMA_HEAP_IOCTL_ALLOC_AND_READ BUFFER I/O
>>>>> ```shel
>>>>> # create a model file
>>>>> dd if=/dev/zero of=./model.txt bs=1M count=3072
>>>>> # drop page cache
>>>>> echo 3 > /proc/sys/vm/drop_caches
>>>>> ./dmabuf-heap-file-read mtk_mm-uncached normal_io
>>>>>
>>>>>> result is total cost 5735579385ns
>>>>>
>>>>> ```
>>>>>
>>>>>>
>>>>>> Perhaps simply returning the DMA-BUF file descriptor and then 
>>>>>> implementing copy_file_range, while populating the memory and 
>>>>>> content during the copy process, could achieve this? At present, 
>>>>>> it seems that it will be quite complex - We need to ensure that 
>>>>>> only the returned DMA-BUF file descriptor will fail in case of 
>>>>>> memory not fill, like mmap, vmap, attach, and so on.
>>>>>>
>>>>>>>
>>>>>>> What we probably could do is to internally optimize those.
>>>>>>>
>>>>>>>> I am currently creating a new ioctl to remind the user that 
>>>>>>>> memory is being allocated and read, and I am also unsure
>>>>>>>>
>>>>>>>> whether it is appropriate to add additional parameters to the 
>>>>>>>> existing allocate behavior.
>>>>>>>>
>>>>>>>> Please, give me more suggestion. Thanks.
>>>>>>>>
>>>>>>>>>
>>>>>>>>> But IIRC there was a copy_file_range callback in the 
>>>>>>>>> file_operations structure you could use for that. I'm just not 
>>>>>>>>> sure when and how that's used with the copy_file_range() 
>>>>>>>>> system call.
>>>>>>>>
>>>>>>>> Sorry, I'm not familiar with this, but I will look into it. 
>>>>>>>> However, this type of callback function is not currently 
>>>>>>>> implemented when exporting
>>>>>>>>
>>>>>>>> the dma_buf file, which means that I need to implement the 
>>>>>>>> callback for it?
>>>>>>>
>>>>>>> If I'm not completely mistaken the copy_file_range, splice_read 
>>>>>>> and splice_write callbacks on the struct file_operations 
>>>>>>> (https://elixir.bootlin.com/linux/v6.10-rc7/source/include/linux/fs.h#L1999).
>>>>>>>
>>>>>>> Can be used to implement what you want to do.
>>>>>> Yes.
>>>>>>>
>>>>>>> Regards,
>>>>>>> Christian.
>>>>>>>
>>>>>>>>
>>>>>>>>>
>>>>>>>>> Regards,
>>>>>>>>> Christian.
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Notice, file_fd depends on user how to open this file. So, 
>>>>>>>>>> both buffer
>>>>>>>>>> I/O and Direct I/O is supported.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Huan Yang <link@vivo.com>
>>>>>>>>>> ---
>>>>>>>>>>   drivers/dma-buf/dma-heap.c    | 525 
>>>>>>>>>> +++++++++++++++++++++++++++++++++-
>>>>>>>>>>   include/linux/dma-heap.h      |  57 +++-
>>>>>>>>>>   include/uapi/linux/dma-heap.h |  32 +++
>>>>>>>>>>   3 files changed, 611 insertions(+), 3 deletions(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/dma-buf/dma-heap.c 
>>>>>>>>>> b/drivers/dma-buf/dma-heap.c
>>>>>>>>>> index 2298ca5e112e..abe17281adb8 100644
>>>>>>>>>> --- a/drivers/dma-buf/dma-heap.c
>>>>>>>>>> +++ b/drivers/dma-buf/dma-heap.c
>>>>>>>>>> @@ -15,9 +15,11 @@
>>>>>>>>>>   #include <linux/list.h>
>>>>>>>>>>   #include <linux/slab.h>
>>>>>>>>>>   #include <linux/nospec.h>
>>>>>>>>>> +#include <linux/highmem.h>
>>>>>>>>>>   #include <linux/uaccess.h>
>>>>>>>>>>   #include <linux/syscalls.h>
>>>>>>>>>>   #include <linux/dma-heap.h>
>>>>>>>>>> +#include <linux/vmalloc.h>
>>>>>>>>>>   #include <uapi/linux/dma-heap.h>
>>>>>>>>>>     #define DEVNAME "dma_heap"
>>>>>>>>>> @@ -43,12 +45,462 @@ struct dma_heap {
>>>>>>>>>>       struct cdev heap_cdev;
>>>>>>>>>>   };
>>>>>>>>>>   +/**
>>>>>>>>>> + * struct dma_heap_file - wrap the file, read task for 
>>>>>>>>>> dma_heap allocate use.
>>>>>>>>>> + * @file:        file to read from.
>>>>>>>>>> + *
>>>>>>>>>> + * @cred:        kthread use, user cred copy to use for the 
>>>>>>>>>> read.
>>>>>>>>>> + *
>>>>>>>>>> + * @max_batch:        maximum batch size to read, if collect 
>>>>>>>>>> match batch,
>>>>>>>>>> + *            trigger read, default 128MB, must below file 
>>>>>>>>>> size.
>>>>>>>>>> + *
>>>>>>>>>> + * @fsz:        file size.
>>>>>>>>>> + *
>>>>>>>>>> + * @direct:        use direct IO?
>>>>>>>>>> + */
>>>>>>>>>> +struct dma_heap_file {
>>>>>>>>>> +    struct file *file;
>>>>>>>>>> +    struct cred *cred;
>>>>>>>>>> +    size_t max_batch;
>>>>>>>>>> +    size_t fsz;
>>>>>>>>>> +    bool direct;
>>>>>>>>>> +};
>>>>>>>>>> +
>>>>>>>>>> +/**
>>>>>>>>>> + * struct dma_heap_file_work - represents a dma_heap file 
>>>>>>>>>> read real work.
>>>>>>>>>> + * @vaddr:        contigous virtual address alloc by vmap, 
>>>>>>>>>> file read need.
>>>>>>>>>> + *
>>>>>>>>>> + * @start_size:        file read start offset, same to 
>>>>>>>>>> @dma_heap_file_task->roffset.
>>>>>>>>>> + *
>>>>>>>>>> + * @need_size:        file read need size, same to 
>>>>>>>>>> @dma_heap_file_task->rsize.
>>>>>>>>>> + *
>>>>>>>>>> + * @heap_file:        file wrapper.
>>>>>>>>>> + *
>>>>>>>>>> + * @list:        child node of @dma_heap_file_control->works.
>>>>>>>>>> + *
>>>>>>>>>> + * @refp:        same @dma_heap_file_task->ref, if end of 
>>>>>>>>>> read, put ref.
>>>>>>>>>> + *
>>>>>>>>>> + * @failp:        if any work io failed, set it true, pointp 
>>>>>>>>>> @dma_heap_file_task->fail.
>>>>>>>>>> + */
>>>>>>>>>> +struct dma_heap_file_work {
>>>>>>>>>> +    void *vaddr;
>>>>>>>>>> +    ssize_t start_size;
>>>>>>>>>> +    ssize_t need_size;
>>>>>>>>>> +    struct dma_heap_file *heap_file;
>>>>>>>>>> +    struct list_head list;
>>>>>>>>>> +    atomic_t *refp;
>>>>>>>>>> +    bool *failp;
>>>>>>>>>> +};
>>>>>>>>>> +
>>>>>>>>>> +/**
>>>>>>>>>> + * struct dma_heap_file_task - represents a dma_heap file 
>>>>>>>>>> read process
>>>>>>>>>> + * @ref:        current file work counter, if zero, allocate 
>>>>>>>>>> and read
>>>>>>>>>> + *            done.
>>>>>>>>>> + *
>>>>>>>>>> + * @roffset:        last read offset, current prepared work' 
>>>>>>>>>> begin file
>>>>>>>>>> + *            start offset.
>>>>>>>>>> + *
>>>>>>>>>> + * @rsize:        current allocated page size use to read, 
>>>>>>>>>> if reach rbatch,
>>>>>>>>>> + *            trigger commit.
>>>>>>>>>> + *
>>>>>>>>>> + * @rbatch:        current prepared work's batch, below 
>>>>>>>>>> @dma_heap_file's
>>>>>>>>>> + *            batch.
>>>>>>>>>> + *
>>>>>>>>>> + * @heap_file:        current dma_heap_file
>>>>>>>>>> + *
>>>>>>>>>> + * @parray:        used for vmap, size is @dma_heap_file's 
>>>>>>>>>> batch's number
>>>>>>>>>> + *            pages.(this is maximum). Due to single thread 
>>>>>>>>>> file read,
>>>>>>>>>> + *            one page array reuse each work prepare is OK.
>>>>>>>>>> + *            Each index in parray is PAGE_SIZE.(vmap need)
>>>>>>>>>> + *
>>>>>>>>>> + * @pindex:        current allocated page filled in 
>>>>>>>>>> @parray's index.
>>>>>>>>>> + *
>>>>>>>>>> + * @fail:        any work failed when file read?
>>>>>>>>>> + *
>>>>>>>>>> + * dma_heap_file_task is the production of file read, will 
>>>>>>>>>> prepare each work
>>>>>>>>>> + * during allocate dma_buf pages, if match current batch, 
>>>>>>>>>> then trigger commit
>>>>>>>>>> + * and prepare next work. After all batch queued, user going 
>>>>>>>>>> on prepare dma_buf
>>>>>>>>>> + * and so on, but before return dma_buf fd, need to wait 
>>>>>>>>>> file read end and
>>>>>>>>>> + * check read result.
>>>>>>>>>> + */
>>>>>>>>>> +struct dma_heap_file_task {
>>>>>>>>>> +    atomic_t ref;
>>>>>>>>>> +    size_t roffset;
>>>>>>>>>> +    size_t rsize;
>>>>>>>>>> +    size_t rbatch;
>>>>>>>>>> +    struct dma_heap_file *heap_file;
>>>>>>>>>> +    struct page **parray;
>>>>>>>>>> +    unsigned int pindex;
>>>>>>>>>> +    bool fail;
>>>>>>>>>> +};
>>>>>>>>>> +
>>>>>>>>>> +/**
>>>>>>>>>> + * struct dma_heap_file_control - global control of dma_heap 
>>>>>>>>>> file read.
>>>>>>>>>> + * @works:        @dma_heap_file_work's list head.
>>>>>>>>>> + *
>>>>>>>>>> + * @lock:        only lock for @works.
>>>>>>>>>> + *
>>>>>>>>>> + * @threadwq:        wait queue for @work_thread, if commit 
>>>>>>>>>> work, @work_thread
>>>>>>>>>> + *            wakeup and read this work's file contains.
>>>>>>>>>> + *
>>>>>>>>>> + * @workwq:        used for main thread wait for file read 
>>>>>>>>>> end, if allocation
>>>>>>>>>> + *            end before file read. @dma_heap_file_task ref 
>>>>>>>>>> effect this.
>>>>>>>>>> + *
>>>>>>>>>> + * @work_thread:    file read kthread. the 
>>>>>>>>>> dma_heap_file_task work's consumer.
>>>>>>>>>> + *
>>>>>>>>>> + * @heap_fwork_cachep:    @dma_heap_file_work's cachep, it's 
>>>>>>>>>> alloc/free frequently.
>>>>>>>>>> + *
>>>>>>>>>> + * @nr_work:        global number of how many work committed.
>>>>>>>>>> + */
>>>>>>>>>> +struct dma_heap_file_control {
>>>>>>>>>> +    struct list_head works;
>>>>>>>>>> +    spinlock_t lock;
>>>>>>>>>> +    wait_queue_head_t threadwq;
>>>>>>>>>> +    wait_queue_head_t workwq;
>>>>>>>>>> +    struct task_struct *work_thread;
>>>>>>>>>> +    struct kmem_cache *heap_fwork_cachep;
>>>>>>>>>> +    atomic_t nr_work;
>>>>>>>>>> +};
>>>>>>>>>> +
>>>>>>>>>> +static struct dma_heap_file_control *heap_fctl;
>>>>>>>>>>   static LIST_HEAD(heap_list);
>>>>>>>>>>   static DEFINE_MUTEX(heap_list_lock);
>>>>>>>>>>   static dev_t dma_heap_devt;
>>>>>>>>>>   static struct class *dma_heap_class;
>>>>>>>>>>   static DEFINE_XARRAY_ALLOC(dma_heap_minors);
>>>>>>>>>>   +/**
>>>>>>>>>> + * map_pages_to_vaddr - map each scatter page into 
>>>>>>>>>> contiguous virtual address.
>>>>>>>>>> + * @heap_ftask:        prepared and need to commit's work.
>>>>>>>>>> + *
>>>>>>>>>> + * Cached pages need to trigger file read, this function map 
>>>>>>>>>> each scatter page
>>>>>>>>>> + * into contiguous virtual address, so that file read can 
>>>>>>>>>> easy use.
>>>>>>>>>> + * Now that we get vaddr page, cached pages can return to 
>>>>>>>>>> original user, so we
>>>>>>>>>> + * will not effect dma-buf export even if file read not end.
>>>>>>>>>> + */
>>>>>>>>>> +static void *map_pages_to_vaddr(struct dma_heap_file_task 
>>>>>>>>>> *heap_ftask)
>>>>>>>>>> +{
>>>>>>>>>> +    return vmap(heap_ftask->parray, heap_ftask->pindex, VM_MAP,
>>>>>>>>>> +            PAGE_KERNEL);
>>>>>>>>>> +}
>>>>>>>>>> +
>>>>>>>>>> +bool dma_heap_prepare_file_read(struct dma_heap_file_task 
>>>>>>>>>> *heap_ftask,
>>>>>>>>>> +                struct page *page)
>>>>>>>>>> +{
>>>>>>>>>> +    struct page **array = heap_ftask->parray;
>>>>>>>>>> +    int index = heap_ftask->pindex;
>>>>>>>>>> +    int num = compound_nr(page), i;
>>>>>>>>>> +    unsigned long sz = page_size(page);
>>>>>>>>>> +
>>>>>>>>>> +    heap_ftask->rsize += sz;
>>>>>>>>>> +    for (i = 0; i < num; ++i)
>>>>>>>>>> +        array[index++] = &page[i];
>>>>>>>>>> +    heap_ftask->pindex = index;
>>>>>>>>>> +
>>>>>>>>>> +    return heap_ftask->rsize >= heap_ftask->rbatch;
>>>>>>>>>> +}
>>>>>>>>>> +
>>>>>>>>>> +static struct dma_heap_file_work *
>>>>>>>>>> +init_file_work(struct dma_heap_file_task *heap_ftask)
>>>>>>>>>> +{
>>>>>>>>>> +    struct dma_heap_file_work *heap_fwork;
>>>>>>>>>> +    struct dma_heap_file *heap_file = heap_ftask->heap_file;
>>>>>>>>>> +
>>>>>>>>>> +    if (READ_ONCE(heap_ftask->fail))
>>>>>>>>>> +        return NULL;
>>>>>>>>>> +
>>>>>>>>>> +    heap_fwork = 
>>>>>>>>>> kmem_cache_alloc(heap_fctl->heap_fwork_cachep, GFP_KERNEL);
>>>>>>>>>> +    if (unlikely(!heap_fwork))
>>>>>>>>>> +        return NULL;
>>>>>>>>>> +
>>>>>>>>>> +    heap_fwork->vaddr = map_pages_to_vaddr(heap_ftask);
>>>>>>>>>> +    if (unlikely(!heap_fwork->vaddr)) {
>>>>>>>>>> + kmem_cache_free(heap_fctl->heap_fwork_cachep, heap_fwork);
>>>>>>>>>> +        return NULL;
>>>>>>>>>> +    }
>>>>>>>>>> +
>>>>>>>>>> +    heap_fwork->heap_file = heap_file;
>>>>>>>>>> +    heap_fwork->start_size = heap_ftask->roffset;
>>>>>>>>>> +    heap_fwork->need_size = heap_ftask->rsize;
>>>>>>>>>> +    heap_fwork->refp = &heap_ftask->ref;
>>>>>>>>>> +    heap_fwork->failp = &heap_ftask->fail;
>>>>>>>>>> +    atomic_inc(&heap_ftask->ref);
>>>>>>>>>> +    return heap_fwork;
>>>>>>>>>> +}
>>>>>>>>>> +
>>>>>>>>>> +static void destroy_file_work(struct dma_heap_file_work 
>>>>>>>>>> *heap_fwork)
>>>>>>>>>> +{
>>>>>>>>>> +    vunmap(heap_fwork->vaddr);
>>>>>>>>>> +    atomic_dec(heap_fwork->refp);
>>>>>>>>>> +    wake_up(&heap_fctl->workwq);
>>>>>>>>>> +
>>>>>>>>>> + kmem_cache_free(heap_fctl->heap_fwork_cachep, heap_fwork);
>>>>>>>>>> +}
>>>>>>>>>> +
>>>>>>>>>> +int dma_heap_submit_file_read(struct dma_heap_file_task 
>>>>>>>>>> *heap_ftask)
>>>>>>>>>> +{
>>>>>>>>>> +    struct dma_heap_file_work *heap_fwork = 
>>>>>>>>>> init_file_work(heap_ftask);
>>>>>>>>>> +    struct page *last = NULL;
>>>>>>>>>> +    struct dma_heap_file *heap_file = heap_ftask->heap_file;
>>>>>>>>>> +    size_t start = heap_ftask->roffset;
>>>>>>>>>> +    struct file *file = heap_file->file;
>>>>>>>>>> +    size_t fsz = heap_file->fsz;
>>>>>>>>>> +
>>>>>>>>>> +    if (unlikely(!heap_fwork))
>>>>>>>>>> +        return -ENOMEM;
>>>>>>>>>> +
>>>>>>>>>> +    /**
>>>>>>>>>> +     * If file size is not page aligned, direct io can't 
>>>>>>>>>> process the tail.
>>>>>>>>>> +     * So, if reach to tail, remain the last page use buffer 
>>>>>>>>>> read.
>>>>>>>>>> +     */
>>>>>>>>>> +    if (heap_file->direct && start + heap_ftask->rsize > fsz) {
>>>>>>>>>> +        heap_fwork->need_size -= PAGE_SIZE;
>>>>>>>>>> +        last = heap_ftask->parray[heap_ftask->pindex - 1];
>>>>>>>>>> +    }
>>>>>>>>>> +
>>>>>>>>>> +    spin_lock(&heap_fctl->lock);
>>>>>>>>>> +    list_add_tail(&heap_fwork->list, &heap_fctl->works);
>>>>>>>>>> +    spin_unlock(&heap_fctl->lock);
>>>>>>>>>> +    atomic_inc(&heap_fctl->nr_work);
>>>>>>>>>> +
>>>>>>>>>> +    wake_up(&heap_fctl->threadwq);
>>>>>>>>>> +
>>>>>>>>>> +    if (last) {
>>>>>>>>>> +        char *buf, *pathp;
>>>>>>>>>> +        ssize_t err;
>>>>>>>>>> +        void *buffer;
>>>>>>>>>> +
>>>>>>>>>> +        buf = kmalloc(PATH_MAX, GFP_KERNEL);
>>>>>>>>>> +        if (unlikely(!buf))
>>>>>>>>>> +            return -ENOMEM;
>>>>>>>>>> +
>>>>>>>>>> +        start = PAGE_ALIGN_DOWN(fsz);
>>>>>>>>>> +
>>>>>>>>>> +        pathp = file_path(file, buf, PATH_MAX);
>>>>>>>>>> +        if (IS_ERR(pathp)) {
>>>>>>>>>> +            kfree(buf);
>>>>>>>>>> +            return PTR_ERR(pathp);
>>>>>>>>>> +        }
>>>>>>>>>> +
>>>>>>>>>> +        buffer = kmap_local_page(last); // use page's kaddr.
>>>>>>>>>> +        err = kernel_read_file_from_path(pathp, start, &buffer,
>>>>>>>>>> +                         fsz - start, &fsz,
>>>>>>>>>> +                         READING_POLICY);
>>>>>>>>>> +        kunmap_local(buffer);
>>>>>>>>>> +        kfree(buf);
>>>>>>>>>> +        if (err < 0) {
>>>>>>>>>> +            pr_err("failed to use buffer kernel_read_file 
>>>>>>>>>> %s, err=%ld, [%ld, %ld], f_sz=%ld\n",
>>>>>>>>>> +                   pathp, err, start, fsz, fsz);
>>>>>>>>>> +
>>>>>>>>>> +            return err;
>>>>>>>>>> +        }
>>>>>>>>>> +    }
>>>>>>>>>> +
>>>>>>>>>> +    heap_ftask->roffset += heap_ftask->rsize;
>>>>>>>>>> +    heap_ftask->rsize = 0;
>>>>>>>>>> +    heap_ftask->pindex = 0;
>>>>>>>>>> +    heap_ftask->rbatch = min_t(size_t,
>>>>>>>>>> +                   PAGE_ALIGN(fsz) - heap_ftask->roffset,
>>>>>>>>>> +                   heap_ftask->rbatch);
>>>>>>>>>> +    return 0;
>>>>>>>>>> +}
>>>>>>>>>> +
>>>>>>>>>> +bool dma_heap_wait_for_file_read(struct dma_heap_file_task 
>>>>>>>>>> *heap_ftask)
>>>>>>>>>> +{
>>>>>>>>>> +    wait_event_freezable(heap_fctl->workwq,
>>>>>>>>>> + atomic_read(&heap_ftask->ref) == 0);
>>>>>>>>>> +    return heap_ftask->fail;
>>>>>>>>>> +}
>>>>>>>>>> +
>>>>>>>>>> +bool dma_heap_destroy_file_read(struct dma_heap_file_task 
>>>>>>>>>> *heap_ftask)
>>>>>>>>>> +{
>>>>>>>>>> +    bool fail;
>>>>>>>>>> +
>>>>>>>>>> +    dma_heap_wait_for_file_read(heap_ftask);
>>>>>>>>>> +    fail = heap_ftask->fail;
>>>>>>>>>> +    kvfree(heap_ftask->parray);
>>>>>>>>>> +    kfree(heap_ftask);
>>>>>>>>>> +    return fail;
>>>>>>>>>> +}
>>>>>>>>>> +
>>>>>>>>>> +struct dma_heap_file_task *
>>>>>>>>>> +dma_heap_declare_file_read(struct dma_heap_file *heap_file)
>>>>>>>>>> +{
>>>>>>>>>> +    struct dma_heap_file_task *heap_ftask =
>>>>>>>>>> +        kzalloc(sizeof(*heap_ftask), GFP_KERNEL);
>>>>>>>>>> +    if (unlikely(!heap_ftask))
>>>>>>>>>> +        return NULL;
>>>>>>>>>> +
>>>>>>>>>> +    /**
>>>>>>>>>> +     * Batch is the maximum size which we prepare work will 
>>>>>>>>>> meet.
>>>>>>>>>> +     * So, direct alloc this number's page array is OK.
>>>>>>>>>> +     */
>>>>>>>>>> +    heap_ftask->parray = kvmalloc_array(heap_file->max_batch 
>>>>>>>>>> >> PAGE_SHIFT,
>>>>>>>>>> +                        sizeof(struct page *), GFP_KERNEL);
>>>>>>>>>> +    if (unlikely(!heap_ftask->parray))
>>>>>>>>>> +        goto put;
>>>>>>>>>> +
>>>>>>>>>> +    heap_ftask->heap_file = heap_file;
>>>>>>>>>> +    heap_ftask->rbatch = heap_file->max_batch;
>>>>>>>>>> +    return heap_ftask;
>>>>>>>>>> +put:
>>>>>>>>>> +    kfree(heap_ftask);
>>>>>>>>>> +    return NULL;
>>>>>>>>>> +}
>>>>>>>>>> +
>>>>>>>>>> +static void __work_this_io(struct dma_heap_file_work 
>>>>>>>>>> *heap_fwork)
>>>>>>>>>> +{
>>>>>>>>>> +    struct dma_heap_file *heap_file = heap_fwork->heap_file;
>>>>>>>>>> +    struct file *file = heap_file->file;
>>>>>>>>>> +    ssize_t start = heap_fwork->start_size;
>>>>>>>>>> +    ssize_t size = heap_fwork->need_size;
>>>>>>>>>> +    void *buffer = heap_fwork->vaddr;
>>>>>>>>>> +    const struct cred *old_cred;
>>>>>>>>>> +    ssize_t err;
>>>>>>>>>> +
>>>>>>>>>> +    // use real task's cred to read this file.
>>>>>>>>>> +    old_cred = override_creds(heap_file->cred);
>>>>>>>>>> +    err = kernel_read_file(file, start, &buffer, size, 
>>>>>>>>>> &heap_file->fsz,
>>>>>>>>>> +                   READING_POLICY);
>>>>>>>>>> +    if (err < 0) {
>>>>>>>>>> +        pr_err("use kernel_read_file, err=%ld, [%ld, %ld], 
>>>>>>>>>> f_sz=%ld\n",
>>>>>>>>>> +               err, start, (start + size), heap_file->fsz);
>>>>>>>>>> +        WRITE_ONCE(*heap_fwork->failp, true);
>>>>>>>>>> +    }
>>>>>>>>>> +    // recovery to my cred.
>>>>>>>>>> +    revert_creds(old_cred);
>>>>>>>>>> +}
>>>>>>>>>> +
>>>>>>>>>> +static int dma_heap_file_control_thread(void *data)
>>>>>>>>>> +{
>>>>>>>>>> +    struct dma_heap_file_control *heap_fctl =
>>>>>>>>>> +        (struct dma_heap_file_control *)data;
>>>>>>>>>> +    struct dma_heap_file_work *worker, *tmp;
>>>>>>>>>> +    int nr_work;
>>>>>>>>>> +
>>>>>>>>>> +    LIST_HEAD(pages);
>>>>>>>>>> +    LIST_HEAD(workers);
>>>>>>>>>> +
>>>>>>>>>> +    while (true) {
>>>>>>>>>> + wait_event_freezable(heap_fctl->threadwq,
>>>>>>>>>> + atomic_read(&heap_fctl->nr_work) > 0);
>>>>>>>>>> +recheck:
>>>>>>>>>> +        spin_lock(&heap_fctl->lock);
>>>>>>>>>> + list_splice_init(&heap_fctl->works, &workers);
>>>>>>>>>> +        spin_unlock(&heap_fctl->lock);
>>>>>>>>>> +
>>>>>>>>>> +        if (unlikely(kthread_should_stop())) {
>>>>>>>>>> +            list_for_each_entry_safe(worker, tmp, &workers, 
>>>>>>>>>> list) {
>>>>>>>>>> +                list_del(&worker->list);
>>>>>>>>>> +                destroy_file_work(worker);
>>>>>>>>>> +            }
>>>>>>>>>> +            break;
>>>>>>>>>> +        }
>>>>>>>>>> +
>>>>>>>>>> +        nr_work = 0;
>>>>>>>>>> +        list_for_each_entry_safe(worker, tmp, &workers, list) {
>>>>>>>>>> +            ++nr_work;
>>>>>>>>>> +            list_del(&worker->list);
>>>>>>>>>> +            __work_this_io(worker);
>>>>>>>>>> +
>>>>>>>>>> +            destroy_file_work(worker);
>>>>>>>>>> +        }
>>>>>>>>>> +        atomic_sub(nr_work, &heap_fctl->nr_work);
>>>>>>>>>> +
>>>>>>>>>> +        if (atomic_read(&heap_fctl->nr_work) > 0)
>>>>>>>>>> +            goto recheck;
>>>>>>>>>> +    }
>>>>>>>>>> +    return 0;
>>>>>>>>>> +}
>>>>>>>>>> +
>>>>>>>>>> +size_t dma_heap_file_size(struct dma_heap_file *heap_file)
>>>>>>>>>> +{
>>>>>>>>>> +    return heap_file->fsz;
>>>>>>>>>> +}
>>>>>>>>>> +
>>>>>>>>>> +static int prepare_dma_heap_file(struct dma_heap_file 
>>>>>>>>>> *heap_file, int file_fd,
>>>>>>>>>> +                 size_t batch)
>>>>>>>>>> +{
>>>>>>>>>> +    struct file *file;
>>>>>>>>>> +    size_t fsz;
>>>>>>>>>> +    int ret;
>>>>>>>>>> +
>>>>>>>>>> +    file = fget(file_fd);
>>>>>>>>>> +    if (!file)
>>>>>>>>>> +        return -EINVAL;
>>>>>>>>>> +
>>>>>>>>>> +    fsz = i_size_read(file_inode(file));
>>>>>>>>>> +    if (fsz < batch) {
>>>>>>>>>> +        ret = -EINVAL;
>>>>>>>>>> +        goto err;
>>>>>>>>>> +    }
>>>>>>>>>> +
>>>>>>>>>> +    /**
>>>>>>>>>> +     * Selinux block our read, but actually we are reading 
>>>>>>>>>> the stand-in
>>>>>>>>>> +     * for this file.
>>>>>>>>>> +     * So save current's cred and when going to read, 
>>>>>>>>>> override mine, and
>>>>>>>>>> +     * end of read, revert.
>>>>>>>>>> +     */
>>>>>>>>>> +    heap_file->cred = prepare_kernel_cred(current);
>>>>>>>>>> +    if (unlikely(!heap_file->cred)) {
>>>>>>>>>> +        ret = -ENOMEM;
>>>>>>>>>> +        goto err;
>>>>>>>>>> +    }
>>>>>>>>>> +
>>>>>>>>>> +    heap_file->file = file;
>>>>>>>>>> +    heap_file->max_batch = batch;
>>>>>>>>>> +    heap_file->fsz = fsz;
>>>>>>>>>> +
>>>>>>>>>> +    heap_file->direct = file->f_flags & O_DIRECT;
>>>>>>>>>> +
>>>>>>>>>> +#define DMA_HEAP_SUGGEST_DIRECT_IO_SIZE (1UL << 30)
>>>>>>>>>> +    if (!heap_file->direct && fsz >= 
>>>>>>>>>> DMA_HEAP_SUGGEST_DIRECT_IO_SIZE)
>>>>>>>>>> +        pr_warn("alloc read file better to use O_DIRECT to 
>>>>>>>>>> read larget file\n");
>>>>>>>>>> +
>>>>>>>>>> +    return 0;
>>>>>>>>>> +
>>>>>>>>>> +err:
>>>>>>>>>> +    fput(file);
>>>>>>>>>> +    return ret;
>>>>>>>>>> +}
>>>>>>>>>> +
>>>>>>>>>> +static void destroy_dma_heap_file(struct dma_heap_file 
>>>>>>>>>> *heap_file)
>>>>>>>>>> +{
>>>>>>>>>> +    fput(heap_file->file);
>>>>>>>>>> +    put_cred(heap_file->cred);
>>>>>>>>>> +}
>>>>>>>>>> +
>>>>>>>>>> +static int dma_heap_buffer_alloc_read_file(struct dma_heap 
>>>>>>>>>> *heap, int file_fd,
>>>>>>>>>> +                       size_t batch, unsigned int fd_flags,
>>>>>>>>>> +                       unsigned int heap_flags)
>>>>>>>>>> +{
>>>>>>>>>> +    struct dma_buf *dmabuf;
>>>>>>>>>> +    int fd;
>>>>>>>>>> +    struct dma_heap_file heap_file;
>>>>>>>>>> +
>>>>>>>>>> +    fd = prepare_dma_heap_file(&heap_file, file_fd, batch);
>>>>>>>>>> +    if (fd)
>>>>>>>>>> +        goto error_file;
>>>>>>>>>> +
>>>>>>>>>> +    dmabuf = heap->ops->allocate_read_file(heap, &heap_file, 
>>>>>>>>>> fd_flags,
>>>>>>>>>> +                           heap_flags);
>>>>>>>>>> +    if (IS_ERR(dmabuf)) {
>>>>>>>>>> +        fd = PTR_ERR(dmabuf);
>>>>>>>>>> +        goto error;
>>>>>>>>>> +    }
>>>>>>>>>> +
>>>>>>>>>> +    fd = dma_buf_fd(dmabuf, fd_flags);
>>>>>>>>>> +    if (fd < 0) {
>>>>>>>>>> +        dma_buf_put(dmabuf);
>>>>>>>>>> +        /* just return, as put will call release and that 
>>>>>>>>>> will free */
>>>>>>>>>> +    }
>>>>>>>>>> +
>>>>>>>>>> +error:
>>>>>>>>>> +    destroy_dma_heap_file(&heap_file);
>>>>>>>>>> +error_file:
>>>>>>>>>> +    return fd;
>>>>>>>>>> +}
>>>>>>>>>> +
>>>>>>>>>>   static int dma_heap_buffer_alloc(struct dma_heap *heap, 
>>>>>>>>>> size_t len,
>>>>>>>>>>                    u32 fd_flags,
>>>>>>>>>>                    u64 heap_flags)
>>>>>>>>>> @@ -93,6 +545,38 @@ static int dma_heap_open(struct inode 
>>>>>>>>>> *inode, struct file *file)
>>>>>>>>>>       return 0;
>>>>>>>>>>   }
>>>>>>>>>>   +static long dma_heap_ioctl_allocate_read_file(struct file 
>>>>>>>>>> *file, void *data)
>>>>>>>>>> +{
>>>>>>>>>> +    struct dma_heap_allocation_file_data 
>>>>>>>>>> *heap_allocation_file = data;
>>>>>>>>>> +    struct dma_heap *heap = file->private_data;
>>>>>>>>>> +    int fd;
>>>>>>>>>> +
>>>>>>>>>> +    if (heap_allocation_file->fd || 
>>>>>>>>>> !heap_allocation_file->file_fd)
>>>>>>>>>> +        return -EINVAL;
>>>>>>>>>> +
>>>>>>>>>> +    if (heap_allocation_file->fd_flags & 
>>>>>>>>>> ~DMA_HEAP_VALID_FD_FLAGS)
>>>>>>>>>> +        return -EINVAL;
>>>>>>>>>> +
>>>>>>>>>> +    if (heap_allocation_file->heap_flags & 
>>>>>>>>>> ~DMA_HEAP_VALID_HEAP_FLAGS)
>>>>>>>>>> +        return -EINVAL;
>>>>>>>>>> +
>>>>>>>>>> +    if (!heap->ops->allocate_read_file)
>>>>>>>>>> +        return -EINVAL;
>>>>>>>>>> +
>>>>>>>>>> +    fd = dma_heap_buffer_alloc_read_file(
>>>>>>>>>> +        heap, heap_allocation_file->file_fd,
>>>>>>>>>> +        heap_allocation_file->batch ?
>>>>>>>>>> + PAGE_ALIGN(heap_allocation_file->batch) :
>>>>>>>>>> +            DEFAULT_ADI_BATCH,
>>>>>>>>>> +        heap_allocation_file->fd_flags,
>>>>>>>>>> +        heap_allocation_file->heap_flags);
>>>>>>>>>> +    if (fd < 0)
>>>>>>>>>> +        return fd;
>>>>>>>>>> +
>>>>>>>>>> +    heap_allocation_file->fd = fd;
>>>>>>>>>> +    return 0;
>>>>>>>>>> +}
>>>>>>>>>> +
>>>>>>>>>>   static long dma_heap_ioctl_allocate(struct file *file, void 
>>>>>>>>>> *data)
>>>>>>>>>>   {
>>>>>>>>>>       struct dma_heap_allocation_data *heap_allocation = data;
>>>>>>>>>> @@ -121,6 +605,7 @@ static long 
>>>>>>>>>> dma_heap_ioctl_allocate(struct file *file, void *data)
>>>>>>>>>>     static unsigned int dma_heap_ioctl_cmds[] = {
>>>>>>>>>>       DMA_HEAP_IOCTL_ALLOC,
>>>>>>>>>> +    DMA_HEAP_IOCTL_ALLOC_AND_READ,
>>>>>>>>>>   };
>>>>>>>>>>     static long dma_heap_ioctl(struct file *file, unsigned 
>>>>>>>>>> int ucmd,
>>>>>>>>>> @@ -170,6 +655,9 @@ static long dma_heap_ioctl(struct file 
>>>>>>>>>> *file, unsigned int ucmd,
>>>>>>>>>>       case DMA_HEAP_IOCTL_ALLOC:
>>>>>>>>>>           ret = dma_heap_ioctl_allocate(file, kdata);
>>>>>>>>>>           break;
>>>>>>>>>> +    case DMA_HEAP_IOCTL_ALLOC_AND_READ:
>>>>>>>>>> +        ret = dma_heap_ioctl_allocate_read_file(file, kdata);
>>>>>>>>>> +        break;
>>>>>>>>>>       default:
>>>>>>>>>>           ret = -ENOTTY;
>>>>>>>>>>           goto err;
>>>>>>>>>> @@ -316,11 +804,44 @@ static int dma_heap_init(void)
>>>>>>>>>>         dma_heap_class = class_create(DEVNAME);
>>>>>>>>>>       if (IS_ERR(dma_heap_class)) {
>>>>>>>>>> -        unregister_chrdev_region(dma_heap_devt, 
>>>>>>>>>> NUM_HEAP_MINORS);
>>>>>>>>>> -        return PTR_ERR(dma_heap_class);
>>>>>>>>>> +        ret = PTR_ERR(dma_heap_class);
>>>>>>>>>> +        goto fail_class;
>>>>>>>>>>       }
>>>>>>>>>>       dma_heap_class->devnode = dma_heap_devnode;
>>>>>>>>>>   +    heap_fctl = kzalloc(sizeof(*heap_fctl), GFP_KERNEL);
>>>>>>>>>> +    if (unlikely(!heap_fctl)) {
>>>>>>>>>> +        ret =  -ENOMEM;
>>>>>>>>>> +        goto fail_alloc;
>>>>>>>>>> +    }
>>>>>>>>>> +
>>>>>>>>>> +    INIT_LIST_HEAD(&heap_fctl->works);
>>>>>>>>>> + init_waitqueue_head(&heap_fctl->threadwq);
>>>>>>>>>> + init_waitqueue_head(&heap_fctl->workwq);
>>>>>>>>>> +
>>>>>>>>>> +    heap_fctl->work_thread = 
>>>>>>>>>> kthread_run(dma_heap_file_control_thread,
>>>>>>>>>> +                         heap_fctl, "heap_fwork_t");
>>>>>>>>>> +    if (IS_ERR(heap_fctl->work_thread)) {
>>>>>>>>>> +        ret = -ENOMEM;
>>>>>>>>>> +        goto fail_thread;
>>>>>>>>>> +    }
>>>>>>>>>> +
>>>>>>>>>> +    heap_fctl->heap_fwork_cachep = 
>>>>>>>>>> KMEM_CACHE(dma_heap_file_work, 0);
>>>>>>>>>> +    if (unlikely(!heap_fctl->heap_fwork_cachep)) {
>>>>>>>>>> +        ret = -ENOMEM;
>>>>>>>>>> +        goto fail_cache;
>>>>>>>>>> +    }
>>>>>>>>>> +
>>>>>>>>>>       return 0;
>>>>>>>>>> +
>>>>>>>>>> +fail_cache:
>>>>>>>>>> +    kthread_stop(heap_fctl->work_thread);
>>>>>>>>>> +fail_thread:
>>>>>>>>>> +    kfree(heap_fctl);
>>>>>>>>>> +fail_alloc:
>>>>>>>>>> +    class_destroy(dma_heap_class);
>>>>>>>>>> +fail_class:
>>>>>>>>>> +    unregister_chrdev_region(dma_heap_devt, NUM_HEAP_MINORS);
>>>>>>>>>> +    return ret;
>>>>>>>>>>   }
>>>>>>>>>>   subsys_initcall(dma_heap_init);
>>>>>>>>>> diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
>>>>>>>>>> index 064bad725061..9c25383f816c 100644
>>>>>>>>>> --- a/include/linux/dma-heap.h
>>>>>>>>>> +++ b/include/linux/dma-heap.h
>>>>>>>>>> @@ -12,12 +12,17 @@
>>>>>>>>>>   #include <linux/cdev.h>
>>>>>>>>>>   #include <linux/types.h>
>>>>>>>>>>   +#define DEFAULT_ADI_BATCH (128 << 20)
>>>>>>>>>> +
>>>>>>>>>>   struct dma_heap;
>>>>>>>>>> +struct dma_heap_file_task;
>>>>>>>>>> +struct dma_heap_file;
>>>>>>>>>>     /**
>>>>>>>>>>    * struct dma_heap_ops - ops to operate on a given heap
>>>>>>>>>>    * @allocate:        allocate dmabuf and return struct 
>>>>>>>>>> dma_buf ptr
>>>>>>>>>> - *
>>>>>>>>>> + * @allocate_read_file: allocate dmabuf and read file, then 
>>>>>>>>>> return struct
>>>>>>>>>> + * dma_buf ptr.
>>>>>>>>>>    * allocate returns dmabuf on success, ERR_PTR(-errno) on 
>>>>>>>>>> error.
>>>>>>>>>>    */
>>>>>>>>>>   struct dma_heap_ops {
>>>>>>>>>> @@ -25,6 +30,11 @@ struct dma_heap_ops {
>>>>>>>>>>                       unsigned long len,
>>>>>>>>>>                       u32 fd_flags,
>>>>>>>>>>                       u64 heap_flags);
>>>>>>>>>> +
>>>>>>>>>> +    struct dma_buf *(*allocate_read_file)(struct dma_heap 
>>>>>>>>>> *heap,
>>>>>>>>>> +                          struct dma_heap_file *heap_file,
>>>>>>>>>> +                          u32 fd_flags,
>>>>>>>>>> +                          u64 heap_flags);
>>>>>>>>>>   };
>>>>>>>>>>     /**
>>>>>>>>>> @@ -65,4 +75,49 @@ const char *dma_heap_get_name(struct 
>>>>>>>>>> dma_heap *heap);
>>>>>>>>>>    */
>>>>>>>>>>   struct dma_heap *dma_heap_add(const struct 
>>>>>>>>>> dma_heap_export_info *exp_info);
>>>>>>>>>>   +/**
>>>>>>>>>> + * dma_heap_destroy_file_read - waits for a file read to 
>>>>>>>>>> complete then destroy it
>>>>>>>>>> + * Returns: true if the file read failed, false otherwise
>>>>>>>>>> + */
>>>>>>>>>> +bool dma_heap_destroy_file_read(struct dma_heap_file_task 
>>>>>>>>>> *heap_ftask);
>>>>>>>>>> +
>>>>>>>>>> +/**
>>>>>>>>>> + * dma_heap_wait_for_file_read - waits for a file read to 
>>>>>>>>>> complete
>>>>>>>>>> + * Returns: true if the file read failed, false otherwise
>>>>>>>>>> + */
>>>>>>>>>> +bool dma_heap_wait_for_file_read(struct dma_heap_file_task 
>>>>>>>>>> *heap_ftask);
>>>>>>>>>> +
>>>>>>>>>> +/**
>>>>>>>>>> + * dma_heap_alloc_file_read - Declare a task to read file 
>>>>>>>>>> when allocate pages.
>>>>>>>>>> + * @heap_file:        target file to read
>>>>>>>>>> + *
>>>>>>>>>> + * Return NULL if failed, otherwise return a struct pointer.
>>>>>>>>>> + */
>>>>>>>>>> +struct dma_heap_file_task *
>>>>>>>>>> +dma_heap_declare_file_read(struct dma_heap_file *heap_file);
>>>>>>>>>> +
>>>>>>>>>> +/**
>>>>>>>>>> + * dma_heap_prepare_file_read - cache each allocated page 
>>>>>>>>>> until we meet this batch.
>>>>>>>>>> + * @heap_ftask:        prepared and need to commit's work.
>>>>>>>>>> + * @page:        current allocated page. don't care which 
>>>>>>>>>> order.
>>>>>>>>>> + *
>>>>>>>>>> + * Returns true if reach to batch, false so go on prepare.
>>>>>>>>>> + */
>>>>>>>>>> +bool dma_heap_prepare_file_read(struct dma_heap_file_task 
>>>>>>>>>> *heap_ftask,
>>>>>>>>>> +                struct page *page);
>>>>>>>>>> +
>>>>>>>>>> +/**
>>>>>>>>>> + * dma_heap_commit_file_read -  prepare collect enough 
>>>>>>>>>> memory, going to trigger IO
>>>>>>>>>> + * @heap_ftask:            info that current IO needs
>>>>>>>>>> + *
>>>>>>>>>> + * This commit will also check if reach to tail read.
>>>>>>>>>> + * For direct I/O submissions, it is necessary to pay 
>>>>>>>>>> attention to file reads
>>>>>>>>>> + * that are not page-aligned. For the unaligned portion of 
>>>>>>>>>> the read, buffer IO
>>>>>>>>>> + * needs to be triggered.
>>>>>>>>>> + * Returns:
>>>>>>>>>> + *   0 if all right, -errno if something wrong
>>>>>>>>>> + */
>>>>>>>>>> +int dma_heap_submit_file_read(struct dma_heap_file_task 
>>>>>>>>>> *heap_ftask);
>>>>>>>>>> +size_t dma_heap_file_size(struct dma_heap_file *heap_file);
>>>>>>>>>> +
>>>>>>>>>>   #endif /* _DMA_HEAPS_H */
>>>>>>>>>> diff --git a/include/uapi/linux/dma-heap.h 
>>>>>>>>>> b/include/uapi/linux/dma-heap.h
>>>>>>>>>> index a4cf716a49fa..8c20e8b74eed 100644
>>>>>>>>>> --- a/include/uapi/linux/dma-heap.h
>>>>>>>>>> +++ b/include/uapi/linux/dma-heap.h
>>>>>>>>>> @@ -39,6 +39,27 @@ struct dma_heap_allocation_data {
>>>>>>>>>>       __u64 heap_flags;
>>>>>>>>>>   };
>>>>>>>>>>   +/**
>>>>>>>>>> + * struct dma_heap_allocation_file_data - metadata passed 
>>>>>>>>>> from userspace for
>>>>>>>>>> + * allocations and read file
>>>>>>>>>> + * @fd:            will be populated with a fd which 
>>>>>>>>>> provides the
>>>>>>>>>> + *     ��      handle to the allocated dma-buf
>>>>>>>>>> + * @file_fd:        file descriptor to read from(suggested 
>>>>>>>>>> to use O_DIRECT open file)
>>>>>>>>>> + * @batch:        how many memory alloced then file 
>>>>>>>>>> read(bytes), default 128MB
>>>>>>>>>> + *            will auto aligned to PAGE_SIZE
>>>>>>>>>> + * @fd_flags:        file descriptor flags used when allocating
>>>>>>>>>> + * @heap_flags:        flags passed to heap
>>>>>>>>>> + *
>>>>>>>>>> + * Provided by userspace as an argument to the ioctl
>>>>>>>>>> + */
>>>>>>>>>> +struct dma_heap_allocation_file_data {
>>>>>>>>>> +    __u32 fd;
>>>>>>>>>> +    __u32 file_fd;
>>>>>>>>>> +    __u32 batch;
>>>>>>>>>> +    __u32 fd_flags;
>>>>>>>>>> +    __u64 heap_flags;
>>>>>>>>>> +};
>>>>>>>>>> +
>>>>>>>>>>   #define DMA_HEAP_IOC_MAGIC        'H'
>>>>>>>>>>     /**
>>>>>>>>>> @@ -50,4 +71,15 @@ struct dma_heap_allocation_data {
>>>>>>>>>>   #define DMA_HEAP_IOCTL_ALLOC _IOWR(DMA_HEAP_IOC_MAGIC, 0x0,\
>>>>>>>>>>                         struct dma_heap_allocation_data)
>>>>>>>>>>   +/**
>>>>>>>>>> + * DOC: DMA_HEAP_IOCTL_ALLOC_AND_READ - allocate memory from 
>>>>>>>>>> pool and both
>>>>>>>>>> + *                    read file when allocate memory.
>>>>>>>>>> + *
>>>>>>>>>> + * Takes a dma_heap_allocation_file_data struct and returns 
>>>>>>>>>> it with the fd field
>>>>>>>>>> + * populated with the dmabuf handle of the allocation. When 
>>>>>>>>>> return, the dma-buf
>>>>>>>>>> + * content is read from file.
>>>>>>>>>> + */
>>>>>>>>>> +#define DMA_HEAP_IOCTL_ALLOC_AND_READ \
>>>>>>>>>> +    _IOWR(DMA_HEAP_IOC_MAGIC, 0x1, struct 
>>>>>>>>>> dma_heap_allocation_file_data)
>>>>>>>>>> +
>>>>>>>>>>   #endif /* _UAPI_LINUX_DMABUF_POOL_H */
>>>>>>>>>
>>>>>>>
>>>>
>>


