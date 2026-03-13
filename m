Return-Path: <linux-media+bounces-55628-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGSOAZjXs2mzbgAAu9opvQ
	(envelope-from <linux-media+bounces-55628-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:23:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBEC2806A3
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:23:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 196893073AB6
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 09:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AAFB285056;
	Fri, 13 Mar 2026 09:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="eEaREBnM"
X-Original-To: linux-media@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010017.outbound.protection.outlook.com [52.101.85.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF7E375F98;
	Fri, 13 Mar 2026 09:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773393732; cv=fail; b=fFCZLuYJdjf4mamHi46iMmuJSeoLLR0DG+UHLfNQUrWR1+70alN6Bk9/8W4+o9OV2p0MDngX7WArpmMqGXtysQryD9oZ568qkKARx8wzu61PoyqwVhKEtRh+r5VouDtHuXj1S/lu3jaE0i8Q7u8TYCMGhdI5iFxZndcwyCCpqro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773393732; c=relaxed/simple;
	bh=ZPcKAxwWWPbLOFXxwZeAPSrC7Ull+wuxs87VpnWfWQA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=i9bL5GSWsyQi38elnPBAeO7bKJhAxfCD49LMb5+QOJFzmKL+VXo/RzLdBQahhmPb+XCUq15jEwWtnONAMLjZkBerohzMOnBJUzuVKkqJU76dKY40vTklnj5aAu59shG96l/zpTg8IC2Zu1UeoEvna/yigj4VCzM5SX1JguN32uk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=eEaREBnM; arc=fail smtp.client-ip=52.101.85.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K/ZX0+ZE3/w/87sf5ymPD4yLdKEN/ITuZviHlVJb3WRf6Qah+oa7ZAMdMxUMZ73AVqTxY35BZVNMsdTf61qQ8JkTYw3lCmlWa9mi0tE24F/nWjvjmMQlfvcThM2wqFV18JGyuUdnaK00NkLb0RehwH+BMqpI0547rcnT3n9TVVFqKW/Ncvo1AmU72YotD7MK6HOTTYzczCrty+AmjranjKB0+VFsrE8+D9xWNA9Gu/NW/eX14Avo/GGNGT6VZc62aXEJm0+aU2l0DZImyJleKgjz7H5Cp7rxzqlKLzDYGYztoTebCQSwB4YGZ781u2Rq1sBiTYJ18jLZqfs3auiO2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f89RTfJP5cCZR2sArNfVJu8Ab8L4isAAMD+WHsWsNo8=;
 b=f1x/L019beUAWQuxBySdE+ZbPCLGiSD38NQmFfj5qW6YbkJtPKVMmkOLS4X0oJOixOIUMmCNHdHUQ92v3eItUseQOJ2zepjPvSaupofYfxpkgZhaAUtmGB7y1m6qGuhDr9TKPX16P8jSmNUEliACRgHFIQvf0sQm7j+iNRx+QVjTcx5pSj3Vwk32f+CX4q5U+LgGWCxqE/qjaha0rkGfMZSDrbePqB7OetFLZE3+CnnN9KA8Nl1bDfjMYPBAnuRfCsyRGdmuGLKwZjDwi1aEuPnc/rKfH8gH8D22AdytFsptaxs8umbgJyDv+80nKDofm31XbOjFMUfePEyyC6kGdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f89RTfJP5cCZR2sArNfVJu8Ab8L4isAAMD+WHsWsNo8=;
 b=eEaREBnM3tp3ZfT1r1Eow2h2e+JX2pY/1Y4YdTr4TFzBhjC5OAOIX7qnJUCIFCHApuqeDV5rwzw4zZ4QOblbOZLGIaWiQRYnMENJI1dT6JXyZ21jj9nRLclNYJazNf4dspkTDSuK1P/tWx/rhO97zqpQVHnMpo2K41+g8fjk9Ls=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV8PR12MB9358.namprd12.prod.outlook.com (2603:10b6:408:201::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Fri, 13 Mar
 2026 09:22:07 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9723.004; Fri, 13 Mar 2026
 09:22:07 +0000
Message-ID: <22eaf986-3fa5-4904-a7ad-dc7316aa1165@amd.com>
Date: Fri, 13 Mar 2026 10:21:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 PATCH 00/10] vfio/pci: Add mmap() for DMABUFs
To: Matt Evans <mattev@meta.com>, Alex Williamson <alex@shazbot.org>,
 Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Alex Mastro <amastro@fb.com>, Mahmoud Adam <mngyadam@amazon.de>,
 David Matlack <dmatlack@google.com>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Kevin Tian <kevin.tian@intel.com>,
 Ankit Agrawal <ankita@nvidia.com>, Pranjal Shrivastava <praan@google.com>,
 Alistair Popple <apopple@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org
References: <20260312184613.3710705-1-mattev@meta.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260312184613.3710705-1-mattev@meta.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV8PR12MB9358:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aa62212-6538-4048-d235-08de80e1ff5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|56012099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	WXapiiH0tsjh+DZJUD6yhG2OzxVI8m0DXa6boU494uh+4JWPSoqw5vKIGcOYRaMqrScYXwtAGaCvSYUons5MX0DhvtkOyk6J2AIXzgjdJdhlB3a0CmrGKlBejLv9W8oLd0WwSA0UPj15KXTRorb0F0fttpT4S0LWJ8v0iRwsVlKxY4osWKf3R13sygpjv5Yw4M49x0CsCN++QTiAd062yladVgDS8dEIoNBBeaytTIBw+ntOzX7HCvdyq2vCqGMODqXFViDxPbvCURYaa9Fs9zCRYWc9JHSWCXFsPb1QbAnyBL2uJTsT5B0hFmXiMj3M/crT7oVn+aT7+VfCXsmrJtMcipN+iGqGffmZb+cF2a+nACe2ZEWK70DxAmrkR9jQCUVJiT6FyXjVKGElhwKIYA43muqZc39wB5rT6exMjlI4Nl9E2HuMgLxiGYRjkK8W2Ezq8AxUU8NwVZbfMl0O5pE4vTvreHLnKajrATBIW3bpwCOg7JLTpqkpCc6Tk17Z4GHWdbGsMOHGiVXi/S4qrXpm9gOXSrsluoC03qDM78eRos2A5rZyiIwVmybhU4nFA8FhHQ/HP7QnlQyfHtQrDMNvIplxcT5UpLucF52F1HwA1aePP4NjzZKBUI42i/9WlZnctuTYMTAIl04Hd7wszAEFovEGLiGsRoW/vuyPv/6jjYPwzWI8tEXizMOG4DxzPCYoXc1FnlPaXjDMUNQKeg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXVtNTdTQUpLZW15dFZHYkhvNDZ1Si96UjlUaUFuRDJTY2JTUTNEQ1BiVmx0?=
 =?utf-8?B?QmdEV1dsWUNLTzRjK2hMODVOQlVTSEpnSmxveE5FOG8zQ3p5aWMxbStBa2tw?=
 =?utf-8?B?TWcvckdtWE0yRmNJUjF0TEp3RTJoVUt4a3laVUNybFlrOEMvMUNManNMVWNl?=
 =?utf-8?B?R25DZFk3UnFobjY5L01VYUpmR1RCTUc3WW9jNHJWVHEvRkgxTEI0aEJuNjhX?=
 =?utf-8?B?bFJLZ3N5ckd3bXhydmtPWjV6U2NNSmdNWUJPWkhGVjU2ZWlHQlFlcW5hT2c5?=
 =?utf-8?B?anNEN1dwRDR5bDFXYnNsKzNJUGtsQVdNQStHS2c2SkJTVG9SamcybXhHNDhN?=
 =?utf-8?B?ZHNiZ1pKQUdQNWNXZVlLY2dLczNZWHoyaGl6VEJGT01VSURoNUJyNCtyRk5L?=
 =?utf-8?B?TGlnTGxoZEswaDRiMUVWWEJHVlROSXdHODFDcUhwU1B0WWNBcThuVnhlakZa?=
 =?utf-8?B?Ymc0MzNtR0NXeE01SDJmajVsV0pXL2lDRjVSZGlxVmQwckJNNk9zVngrZmRr?=
 =?utf-8?B?L3AzRmh4dzFZTWp2Wm9LQ0hBNFpwWXo2cm94Z0ZYTFNHaDlabDJ2b3BOcVR6?=
 =?utf-8?B?TWEzYXVWVCtoU3FJWW5OM2xJOWY1L2J4RXh2VWYwY0RZaVBhK1UxSG5OdlZi?=
 =?utf-8?B?OWpNTVN3dFZlcjBrVisyT2FFSWlHRmtjK2tZbWFpS0xkU2I3aXNEeUJpaHdu?=
 =?utf-8?B?OFZ2NGo4K3lsWmNBYTZQamxqUlJnbG80MzNaODJOUEd3dWhseEpDeUFGWVR5?=
 =?utf-8?B?ckZYeVh5dkF4WGUwUW9hRy94dTQ5TTcxOVVmelBSdjN2bzZ1aEIwOXRtMytt?=
 =?utf-8?B?aXU0NTIwT2pCL0JnVlNXVldTTWpuRTZIbk5PV2pVSjJyc2c1VkNxNDFvSFIz?=
 =?utf-8?B?TXBBbXkwWGJoZHVPV2JkTkxUdDJBMjVJUFU3SGZ5bTR6N2YrSkwraWZXQWtC?=
 =?utf-8?B?OUlFRHpIT1JoNmxqVjd2UWxueVZLZTZ5UGVWc1VxcEhxeU1ZbTNPUnFZYS91?=
 =?utf-8?B?L1JUbzJJMlRFMi9HSHlJTXVZNWpyTkhObko5d09CMEk3UlNlaUFlRkRzMjFv?=
 =?utf-8?B?RUROeFAzN2JWRUJmSS9DWmx4VHJSK0xBcVVYV2pTZkhpMzZJM0czU1RMMTl0?=
 =?utf-8?B?MXprdjc3U0RSM243c2hteFFERVZwQlFhY3crQkF3RUZFTEtBS1BMK1F3amhr?=
 =?utf-8?B?WDNZVTFUWnVuWmVSeWNPNE5kT0R6dzZiUVFHK3J2YlA4UVVUT0lIVDhyYXRG?=
 =?utf-8?B?cVlsQUdTSFd1RUtRcTBuazBiSk9ha0JjMEEwNjZFYWt2SWV5RnIxSzJOMHJZ?=
 =?utf-8?B?SHNoWmNMeHlGQTRXRHRNckJqL055VlBTWEorK1dhYUx1cnpKNE9wd0RidjZu?=
 =?utf-8?B?NFhYSkFYZSs1dkIxdlkvTHB2WTBKZkZSZWtmeHArQ3ZrUjQ3Z3ErOTBMYVRh?=
 =?utf-8?B?TG0vdm9UTUpEbnV3NlVaVE50c1BNbmdzUlJqUno3cmEwWlRua0dVV1liZWl3?=
 =?utf-8?B?L0JGNzRsNHdiYzd2OTE4c2hMSmMwMEJKUEFiV093YWowQjhoT1pVOFRoTGVG?=
 =?utf-8?B?VzJueVRmYkd3RHA0RE9zcTBLRWc4RFJ5M3BpZ1NkVnpiY2RQL242THVYTk54?=
 =?utf-8?B?MElhQnl0Q2F4ak96cEg2aTV1SDdsNGtxQ09RZFZDS0hNSTBFVGhRQ1hEdWYr?=
 =?utf-8?B?VDRRczdmUkkwSmhteFZyemlsM0dmRmVpcGVYN3FmSGJreVNSSG1RSEJ3dHNO?=
 =?utf-8?B?d1BSbGpCWTFzUHBGQ1lYS1h2RkFsZ0FzaXNITzBHZ2V3NzAvRy9sOWJRaTZO?=
 =?utf-8?B?ZU01MVI0ZEkxL1VTUVdvV0IzS1JnVE1MaTA2WHpRS3R6N2NZcTZlZjZUcDdj?=
 =?utf-8?B?SXJpL25rRjNMa3JEZFNLQ0x5U3B4MGpiQ0pkVDcwandxZDg1ZHl2ZDBFY0dP?=
 =?utf-8?B?M3U5dUtzVlNtUFlzSnVtUjdXcDlQWk42K1JkdWlRODJPalNBQUxSM0IxRmYx?=
 =?utf-8?B?eWg2Q3VqdW1jZm9KLzIxMXVETjl3Tk1McmRHUE4xUEt3NHVucGU0dEgzejh0?=
 =?utf-8?B?YXRPdHBSd1lzcTR1dkhxZllqRk9pSE5TVi9rakZtSWxCdDFzZGNSV3RTNHBE?=
 =?utf-8?B?WGhkRnVPWkZUdm9wUFROZUNJWDgyRWh4Y2dobDNyTFZSeGdDUU9HcHg5UFdh?=
 =?utf-8?B?ZDg4ZG9iU3JsTzZ5QkRCNU8xY3lLT2s1N2xTdi9SMkRpZ1ZJbldzUXJ1d2dF?=
 =?utf-8?B?UnhySm5ldXMwekpzWUpLYlZVSHpOQ0pDRzFWQjNLZTI2TCtLU3lrb2hvSVFt?=
 =?utf-8?Q?3KIE5TU+Ztd7d+7m9L?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aa62212-6538-4048-d235-08de80e1ff5f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 09:22:07.4617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uXo4JGRcB91/gb8TxYxYjTo2nUPFU5kAwZO+umZdc3oCG2vY4spDYCctLqSyp/qO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9358
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55628-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: 6FBEC2806A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/12/26 19:45, Matt Evans wrote:
> Hi all,
> 
> 
> There were various suggestions in the September 2025 thread "[TECH
> TOPIC] vfio, iommufd: Enabling user space drivers to vend more
> granular access to client processes" [0], and LPC discussions, around
> improving the situation for multi-process userspace driver designs.
> This RFC series implements some of these ideas.
> 
> (Thanks for feedback on v1!  Revised series, with changes noted
> inline.)
> 
> Background: Multi-process USDs
> ==============================
> 
> The userspace driver scenario discussed in that thread involves a
> primary process driving a PCIe function through VFIO/iommufd, which
> manages the function-wide ownership/lifecycle.  The function is
> designed to provide multiple distinct programming interfaces (for
> example, several independent MMIO register frames in one function),
> and the primary process delegates control of these interfaces to
> multiple independent client processes (which do the actual work).
> This scenario clearly relies on a HW design that provides appropriate
> isolation between the programming interfaces.
> 
> The two key needs are:
> 
>  1.  Mechanisms to safely delegate a subset of the device MMIO
>      resources to a client process without over-sharing wider access
>      (or influence over whole-device activities, such as reset).
> 
>  2.  Mechanisms to allow a client process to do its own iommufd
>      management w.r.t. its address space, in a way that's isolated
>      from DMA relating to other clients.
> 
> 
> mmap() of VFIO DMABUFs
> ======================
> 
> This RFC addresses #1 in "vfio/pci: Support mmap() of a VFIO DMABUF",
> implementing the proposals in [0] to add mmap() support to the
> existing VFIO DMABUF exporter.
> 
> This enables a userspace driver to define DMABUF ranges corresponding
> to sub-ranges of a BAR, and grant a given client (via a shared fd)
> the capability to access (only) those sub-ranges.  The VFIO device fds
> would be kept private to the primary process.  All the client can do
> with that fd is map (or iomap via iommufd) that specific subset of
> resources, and the impact of bugs/malice is contained.
> 
>  (We'll follow up on #2 separately, as a related-but-distinct problem.
>   PASIDs are one way to achieve per-client isolation of DMA; another
>   could be sharing of a single IOVA space via 'constrained' iommufds.)
> 
> 
> New in v2: To achieve this, the existing VFIO BAR mmap() path is
> converted to use DMABUFs behind the scenes, in "vfio/pci: Convert BAR
> mmap() to use a DMABUF" plus new helper functions, as Jason/Christian
> suggested in the v1 discussion [3].
> 
> This means:
> 
>  - Both regular and new DMABUF BAR mappings share the same vm_ops,
>    i.e.  mmap()ing DMABUFs is a smaller change on top of the existing
>    mmap().
> 
>  - The zapping of mappings occurs via vfio_pci_dma_buf_move(), and the
>    vfio_pci_zap_bars() originally paired with the _move()s can go
>    away.  Each DMABUF has a unique address_space.
> 
>  - It's a step towards future iommufd VFIO Type1 emulation
>    implementing P2P, since iommufd can now get a DMABUF from a VA that
>    it's mapping for IO; the VMAs' vm_file is that of the backing
>    DMABUF.
> 
> 
> Revocation/reclaim
> ==================
> 
> Mapping a BAR subset is useful, but the lifetime of access granted to
> a client needs to be managed well.  For example, a protocol between
> the primary process and the client can indicate when the client is
> done, and when it's safe to reuse the resources elsewhere, but cleanup
> can't practically be cooperative.
> 
> For robustness, we enable the driver to make the resources
> guaranteed-inaccessible when it chooses, so that it can re-assign them
> to other uses in future.
> 
> "vfio/pci: Permanently revoke a DMABUF on request" adds a new VFIO
> device fd ioctl, VFIO_DEVICE_PCI_DMABUF_REVOKE.  This takes a DMABUF
> fd parameter previously exported (from that device!) and permanently
> revokes the DMABUF.  This notifies/detaches importers, zaps PTEs for
> any mappings, and guarantees no future attachment/import/map/access is
> possible by any means.
> 
> A primary driver process would use this operation when the client's
> tenure ends to reclaim "loaned-out" MMIO interfaces, at which point
> the interfaces could be safely re-used.
> 
> New in v2: ioctl() on VFIO driver fd, rather than DMABUF fd.  A DMABUF
> is revoked using code common to vfio_pci_dma_buf_move(), selectively
> zapping mappings (after waiting for completion on the
> dma_buf_invalidate_mappings() request).
> 
> 
> BAR mapping access attributes
> =============================
> 
> Inspired by Alex [Mastro] and Jason's comments in [0] and Mahmoud's
> work in [1] with the goal of controlling CPU access attributes for
> VFIO BAR mappings (e.g. WC), we can decorate DMABUFs with access
> attributes that are then used by a mapping's PTEs.
> 
> I've proposed reserving a field in struct
> vfio_device_feature_dma_buf's flags to specify an attribute for its
> ranges.  Although that keeps the (UAPI) struct unchanged, it means all
> ranges in a DMABUF share the same attribute.  I feel a single
> attribute-to-mmap() relation is logical/reasonable.  An application
> can also create multiple DMABUFs to describe any BAR layout and mix of
> attributes.
> 
> 
> Tests
> =====
> 
> (Still sharing the [RFC ONLY] userspace test/demo program for context,
> not for merge.)
> 
> It illustrates & tests various map/revoke cases, but doesn't use the
> existing VFIO selftests and relies on a (tweaked) QEMU EDU function.
> I'm (still) working on integrating the scenarios into the existing
> VFIO selftests.
> 
> This code has been tested in mapping DMABUFs of single/multiple
> ranges, aliasing mmap()s, aliasing ranges across DMABUFs, vm_pgoff >
> 0, revocation, shutdown/cleanup scenarios, and hugepage mappings seem
> to work correctly.  I've lightly tested WC mappings also (by observing
> resulting PTEs as having the correct attributes...).
> 
> 
> Fin
> ===
> 
> v2 is based on next-20260310 (to build on Leon's recent series
> "vfio: Wait for dma-buf invalidation to complete" [2]).
> 
> 
> Please share your thoughts!  I'd like to de-RFC if we feel this
> approach is now fair.

I only skimmed over it, but at least of hand I couldn't find anything fundamentally wrong.

The locking order seems to change in patch #6. In general I strongly recommend to enable lockdep while testing anyway but explicitly when I see such changes.

Additional to that it might also be a good idea to have a lockdep initcall function which defines the locking order in the way all the VFIO code should follow.

See function dma_resv_lockdep() for an example on how to do that. Especially with mmap support and all the locks involved with that it has proven to be a good practice to have something like that.

Regards,
Christian.

> 
> 
> Many thanks,
> 
> 
> Matt
> 
> 
> 
> References:
> 
> [0]: https://lore.kernel.org/linux-iommu/20250918214425.2677057-1-amastro@fb.com/
> [1]: https://lore.kernel.org/all/20250804104012.87915-1-mngyadam@amazon.de/
> [2]: https://lore.kernel.org/linux-iommu/20260205-nocturnal-poetic-chamois-f566ad@houat/T/#m310cd07011e3a1461b6fda45e3f9b886ba76571a
> [3]: https://lore.kernel.org/all/20260226202211.929005-1-mattev@meta.com/
> 
> --------------------------------------------------------------------------------
> Changelog:
> 
> v2:  Respin based on the feedback/suggestions:
> 
> - Transform the existing VFIO BAR mmap path to also use DMABUFs behind
>   the scenes, and then simply share that code for explicitly-mapped
>   DMABUFs.
> 
> - Refactors the export itself out of vfio_pci_core_feature_dma_buf,
>   and shared by a new vfio_pci_core_mmap_prep_dmabuf helper used by
>   the regular VFIO mmap to create a DMABUF.
> 
> - Revoke buffers using a VFIO device fd ioctl
> 
> v1: https://lore.kernel.org/all/20260226202211.929005-1-mattev@meta.com/
> 
> 
> Matt Evans (10):
>   vfio/pci: Set up VFIO barmap before creating a DMABUF
>   vfio/pci: Clean up DMABUFs before disabling function
>   vfio/pci: Add helper to look up PFNs for DMABUFs
>   vfio/pci: Add a helper to create a DMABUF for a BAR-map VMA
>   vfio/pci: Convert BAR mmap() to use a DMABUF
>   vfio/pci: Remove vfio_pci_zap_bars()
>   vfio/pci: Support mmap() of a VFIO DMABUF
>   vfio/pci: Permanently revoke a DMABUF on request
>   vfio/pci: Add mmap() attributes to DMABUF feature
>   [RFC ONLY] selftests: vfio: Add standalone vfio_dmabuf_mmap_test
> 
>  drivers/vfio/pci/Kconfig                      |   3 +-
>  drivers/vfio/pci/Makefile                     |   3 +-
>  drivers/vfio/pci/vfio_pci_config.c            |  18 +-
>  drivers/vfio/pci/vfio_pci_core.c              | 123 +--
>  drivers/vfio/pci/vfio_pci_dmabuf.c            | 425 +++++++--
>  drivers/vfio/pci/vfio_pci_priv.h              |  46 +-
>  include/uapi/linux/vfio.h                     |  42 +-
>  tools/testing/selftests/vfio/Makefile         |   1 +
>  .../vfio/standalone/vfio_dmabuf_mmap_test.c   | 837 ++++++++++++++++++
>  9 files changed, 1339 insertions(+), 159 deletions(-)
>  create mode 100644 tools/testing/selftests/vfio/standalone/vfio_dmabuf_mmap_test.c
> 


