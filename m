Return-Path: <linux-media+bounces-28260-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0DCA616FC
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 18:01:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37C141B605CD
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 17:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9F1620409D;
	Fri, 14 Mar 2025 17:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vWkR1hLi"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2043.outbound.protection.outlook.com [40.107.212.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C347603F;
	Fri, 14 Mar 2025 17:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741971691; cv=fail; b=aa34rwyNnRlHzVWYOEgiw/1fyKcANtS4ieH3wBejAkSMgOh15trXtxWN/OLY3OLuCljKSA4WCgmZJtR0kFWjkueoaQqhHeLsSWNfYCG+fpv7pbrLxSAioegm/1JpOYsQ0wnCZe5RhCgsF/iudU+Wtc5ZCVBST123Vp+fns4WxOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741971691; c=relaxed/simple;
	bh=xdtFwx3ut5sXgd8gA/1ZTLuRm7lquWKcWHKGEBAfXxM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NX0VuOIPQkxojDQZzVV8LHWri2SMTaLxV+gt7NuL3oNbv/lTVt6tQQd+6NmiLStqVatD1UTw8KNrs/Ie5NRxwqoqMkTE44gcfFLQDNxaJaKsyv5DLW181kuymr1+KrkiTY/eQV3GQMY30d+xO1xQ24sM9v1vfSADCTE1A4sFmMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vWkR1hLi; arc=fail smtp.client-ip=40.107.212.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pFsB55R/98/Uy1gVE1dtki4lk1LvaJDUk/isBF5r0RnSdPC2HeYA2py2O1uCsqVfD69qkwIgso7EJuRKcqGc+CK14QfJwkR57KLyg9SAvpsOO19jsWJF6Ak9OWFpcXLgdvmdtRw1EHA7YqVVMkgfqtUjPkNblllT1j0uOVlGCuNQyKP9EVHFi0WguTAOPHTXRxtqddQBrNlRUIuWeYtJsRn9X0c7zjBsg2LpUYFRlrQVGBCttjelKqsvnh0ytsiuyFbWU1zOvGPTH6jdqL6qewTtpeHT2pTRJ04dP80XypTr4B5Gd7txHNpfr2+EqrIm9o1vWG1kypC5dN3dSs3rmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5yXcasMbUD7k+fpoajx1WU7uoQHRLjeKCwIhP9/JNE=;
 b=m/+L98WC7rH+Y8hhfRuau6dTKlwMoJE5iA40U4zxdUT/7gK7AGjiMlDXuwMPSfG9d+C0wGGFZ+6hcNCi6syb9RuFC7eoHx4RLxgGyEq3hFgU9X2j1F+IsUjxaHh5FPVwQmshFsebdDVwvmz97UWb6UUzgshSZffxRuP5iT0cwSED9xe1RdHYnwoDN4EkwQOJNY1jrYWmJZf1BS5F0utWwlKr99zjKy+OCIRGjkWxvikhOk7RwLcxQZDCvLD0t+i2zOQwMCtCUGMouoq9+JTngJWIuXZJ9p/11PF8due6drxmiorbseQnzUcPpXOM1hFgH9SV9bNmHVUlRb1DbAqRUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m5yXcasMbUD7k+fpoajx1WU7uoQHRLjeKCwIhP9/JNE=;
 b=vWkR1hLigCw+WT6uW4dOUW5/QHGT0itP3DLv9Ss1EHIduCFG3U1x31WsURrYTn8bDtnCSk08x2/J9lVj84pYrBx2VpuWtZLGmDDHIpCGuzZ7QRGbTG2QqVBUfsThVxjwi/oIlXH6T/Mz47TShwXvHt3fR0jHD7UPsTYLM0hGAEQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by LV8PR12MB9110.namprd12.prod.outlook.com (2603:10b6:408:18b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Fri, 14 Mar
 2025 17:01:25 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%4]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 17:01:25 +0000
Message-ID: <ef0fea13-1bc0-4661-8d20-079445086f14@amd.com>
Date: Fri, 14 Mar 2025 13:01:22 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: Add OV05C camera sensor driver
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
 Pratap Nirujogi <pratap.nirujogi@amd.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
 laurent.pinchart@ideasonboard.com, dave.stevenson@raspberrypi.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dominic.antony@amd.com
References: <237cb63f-6cfa-4a66-8bc7-21cf48c8e760@stanley.mountain>
Content-Language: en-GB
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <237cb63f-6cfa-4a66-8bc7-21cf48c8e760@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0066.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::38) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|LV8PR12MB9110:EE_
X-MS-Office365-Filtering-Correlation-Id: d6c2699f-5c3b-4f6c-9802-08dd6319dac5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T1NoUGRNM1RHY3pXZ3J2U0JiQWt1K3VnVTliY3hIK242bkI3SUMwNU85WW5v?=
 =?utf-8?B?SUFEUGJIMWM4dVJBak9GRFVyb0QyK2xtZXpnU3NSV0swdU5VcEVSaG44NG5G?=
 =?utf-8?B?emE5Snh0TlNEVmJXMEdMZmphNk5ROUNleXRXM2x4YlhqYXRBbVl2K1N3RXpz?=
 =?utf-8?B?R0htRUhyOFFyZGt1clNZR1BEVmwvQ2RJaEl6VThPbWc1N3h4QTVVb2VReVJM?=
 =?utf-8?B?MjMwTnA2d1BERlFMV2pBRkt1NElrTDJwdjczbXFOZi95NjErRjJhOTBFZ1ZJ?=
 =?utf-8?B?OEphVm9sZFJzQmtmT2JaNFlPWVpUSzhDcWhZZ3dIODYrbUR5eWEzUWdicTJQ?=
 =?utf-8?B?NDZ4T3ZMaTFIcHN3UnBPOStEcWxLRXVMdXY1MU9FZC9CN1FyYTQwdHExa3Yr?=
 =?utf-8?B?UTlCZHFmNEhLdDdYaVMxdlV5NTRZRWhOUlNRQy9Bc0tNWGVBTTdGaVVJMEtV?=
 =?utf-8?B?SmdQOVFzYitRQUF1WmlaR2M3ejdJRG1EbExnVmVhc3hrNUZNVHpnc0ZmY3lm?=
 =?utf-8?B?VktheXQ3bDZMdzlpWk9DdXYyR1FuZ2p4SGIzMkJVUzVLdVN1L0YzSnYyZ2RX?=
 =?utf-8?B?b2VIY29KK05mYmRmVUxQVlBteEVMb2NRSno3VmJ3WWc5UVhMRDNFSFNMZ0d1?=
 =?utf-8?B?bk1RSGhLM1dpbXNocExQNzdNUElTOHFqc2hVK3cyZ0tVZnpVZGh5SVkzUkNX?=
 =?utf-8?B?OGFZUnVSOTlMTTVQbzF4dGp3b1IzVkRjYVJVOXBCUWJBRHhrRUl0MFE3ZGtq?=
 =?utf-8?B?WU01Z3FHLzQ0SFRFV2tWNkdqcmJVSmtUTXdhNUl3RGVDTnVNaWRRZ280TkNK?=
 =?utf-8?B?czhjZ2ZjV1dYRks2L1QzTmxRSEk4aU9WRzRLK0xiS0VOZmd4WnIzZitWK0ZO?=
 =?utf-8?B?MzI5T3RRekdEQitIQVlMRGxjTUwrUDYwSy9jdDViT2E0cHdtbXVCYm9WU2kr?=
 =?utf-8?B?ZXgyVElmUkh4c2xmYWhseCt0RXd4SkZ4UC9HdW5zOTRvNTE3R05odW55ZTlm?=
 =?utf-8?B?YmJ3RERTN1MvU0VmQkd6ZHNvK2s2ZjRCWE1FelNvaUV1THE5Umc5TTlPMUNZ?=
 =?utf-8?B?RE9MQjF0Q1J3MnRGazV5c2lyT3ROWERXZEpCbnNYNkpKalBmQytxbENtQmRW?=
 =?utf-8?B?UTNKSkZNbURLdnk0aGRqSFBMSHl4OEJGekZVTTFuSkVDZVlDV1BYMFNoTys2?=
 =?utf-8?B?Z0ZYdmV3UDdKKzdZdVJ2UElGR1hURXpsRkl1SE9YSlJLWHVBSkJXZkpNZmJW?=
 =?utf-8?B?RmhXM2RwSnNRYzQzZmVSQUxpYXFNb2pKekFGWnMrVS9DZk1VaGJmc3hpd0FT?=
 =?utf-8?B?b2UrbnNwVXhuRm83ZXJNK2tad28rcG5ObWtaU1ZMeUIvd0txTktMQlYzOTR4?=
 =?utf-8?B?U05tTE5PR0ExeXdPWW5lSkpXTDBKYjRzNkNFbkppRWdXUkdvTUdodlNENHB2?=
 =?utf-8?B?QTVOOHhqNnhNU0VFTHlkV3ZyVEc2YjBBWkpYM0pLNTcwbVpmTi9WMjMxUEcx?=
 =?utf-8?B?d0pZeUd4ajRvRTAyTVdkdW1BSmFlR3QwSEpuaWEzSlhBb3BVUmVIR0xqaGlQ?=
 =?utf-8?B?SVhMS2Q5MVdad2ZZMWRSc2FPYUtVeGVyQzVFUThDekhwVFd3ckZDRzZoOHZN?=
 =?utf-8?B?L1lpUWNXc3N6aXNrblY2VUpkOGo0RWRMZzlwR0FjZEg4ZmI4TitvOVBwWVJZ?=
 =?utf-8?B?UGVXd2tQNlFkVlpqbmI5TzhWSDE4cVZoY2VtS2ZKR3ZFQ3lxVTBiZWZvUk9q?=
 =?utf-8?B?ZzE1RTB6Ym8ySUVnaU5OUlR6QnUwMUhZemUvUWkxb285UGQxVTFHYlJleTlN?=
 =?utf-8?B?YlF5bWl1VkJNTDlLaUZoZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajlzN2dVbDlVMmtCc3U5Ti9MME1VdGxyOXh1akhiQjN2Tzl3QzZ1Wlo5ME43?=
 =?utf-8?B?ckpTYjJPcXQvRWp4Yitkd0hpcWFhbW1wRkwrRGdpaEZYWWVCVm5xcTk2Z2Za?=
 =?utf-8?B?VkhyaTU5RDhSVk9yMGkyaVVabEtZWmtNWkZuQ0NaTWJCRU90Tm5GUWJhUHJZ?=
 =?utf-8?B?dE4vK3Jjemdod1dhUlhqZnN5cnh4WFdjTXhkQ2poMWJyY21WUVNVZ0U3TmlE?=
 =?utf-8?B?T2s1Y1g0OVFPQnM5R3ZUc0xldmVURURhOGc5eWdTY1pCUjhWN3dORExVNGIr?=
 =?utf-8?B?VDhzME1wemNxYlNxd3B3aFhsSG1nL1RpTWI1d2tuTHpXK1RzUG5vN2lpcmd1?=
 =?utf-8?B?ZWtMc3B6Q01IYytxZVJHKzhZSGVzcUs5NTJjalVBckFUa29JOHpCREJCNTZt?=
 =?utf-8?B?WVFvc0QyVXRTSmhzUmJneHFwbURUbjFKQmk2YS9mSHVDdm5va1V3SVkvNUtB?=
 =?utf-8?B?Q3BieGtkQWl6TkdkN3NtTHVrVnNOVDNTS0loQVFwZC9SenhlbW9zTWhDR1pP?=
 =?utf-8?B?bzlMd1AwL0lqUlJleXI0dXNEN0M5MCtIVVpsbE5ucnJJeHdHYUxUdzdJQnhD?=
 =?utf-8?B?QzhUSkN3N0NDS0NjZHNJTDIrWjQxbUZNcytianVVR1RuRUtQVkVyZUlwclFu?=
 =?utf-8?B?RGNqQjl5VzhVbGlyd2doRDlNQVROKzFRQjA2M2I4cnlSYVVOOUh0YVY3U2Vx?=
 =?utf-8?B?NDlYczVoVlJZYldNM1BPTUVTQys4T2I0a0ZHZEdCUXJDR0FlQ28rUHA1dHRy?=
 =?utf-8?B?YzdPMmY2dkdFVVJEcFcrV2k1WkZlQWJLR3pEREJvdTVMbndLTzM3SjM3MWxV?=
 =?utf-8?B?OFNOaVhFdFlJc1JWNHpyNWRkSEpRc1RtYU5qbDcraUorcDZxc1NaTUcyRWMv?=
 =?utf-8?B?ZXJFVXdSYTd4N3lUMWJYZGVXcS9kTEk3clk4Z3prVDFPWUpuTWlhMjhPSGZC?=
 =?utf-8?B?Z3BkWUxHcTlmOW5wRUVWNFlDM2Evb2d4aUd6a0tIYUxHME1VWmNQWnozaHlV?=
 =?utf-8?B?VU9oRGRxMUxmOXlocGxIK3JETUVMc0pTMjZ2Q0JaekJDTTdKcUNDN0NMU0tY?=
 =?utf-8?B?MStIYTY3VE9Gcm9BUnNWbTQzcmxSTEJwOXJPckNFWlErZTIxQUI5OEdyVkxn?=
 =?utf-8?B?WE56TDJOMTQwb0N1d1d6UENrQW1pWm9Lbms1RytDVU5SWmRNMGR4U3pwdzc3?=
 =?utf-8?B?dkR0K2lUWWg1Q3lSZTJoU09hdjBWdjE4UkMrbFMyYWIvalM2aEdVeHNHemdJ?=
 =?utf-8?B?aFhzaXdHcjZnd2R5b1NxdGQwd0YyVWtzK0c3OGRmMjl6V1NCVFJ4c1lUakRh?=
 =?utf-8?B?RXlZMkNnTkJyNzc3NzFHdWRQa1NxWXFXWWVzdXgvWHpzcEw4Q0dVSm9SeEkx?=
 =?utf-8?B?d25xem1ZMTd4dmJ5d0tQcXVpOXBwQmVxdWd6dFZnTmdJOExITlA1dnZEWCtQ?=
 =?utf-8?B?QzhpSzhhU0xFdVJ1dnlveVo4eVRHdUhCYzVvSUJ3SUNHQnlzQU1BM2VlTXNV?=
 =?utf-8?B?aVo4enNlRW5nNVdWOTRLN21semxtZk9SUmMzdVZ1b3JGQW45UW5nd2wyaWhX?=
 =?utf-8?B?WDdieHBFdVRQRmk1QkhCd3pnMCtBZllDUmpDSVMxMlZjRzhWdnR0a1V6Wkpw?=
 =?utf-8?B?YXZPTHlpc1ZBMFNDaFFwVHhIK2ZnN2hSUmM0bDRKRzU1SHdlcElFTEtUY2lu?=
 =?utf-8?B?ZnUvRHdNVXY4WEtWaHRTdjgyQmIwQTE5OW9QNEJQZ3ZPVGQrZGdva001WHpY?=
 =?utf-8?B?N0t2S25zcmNJRnlOMkxTYkk5QmYrL3BrbWhRczNRT2tkS3M0Q1Q0TUJVdEpB?=
 =?utf-8?B?TDZ1dE9UZXFLSHc4VVNBSnRUSTJDT0NjV3ZxMEFTUkJYZklmMnF1a3duTm5z?=
 =?utf-8?B?eTNRV2dhU1JkdzB6d0lzWFlCWDJWUk5RajlxSVFyWXlOcXBPYm5vUnRYdTNI?=
 =?utf-8?B?OE5pc2djV1ZFTGdscGlYZW1wSUhScm5ac1VjYW9xUVYvV2tEcFl5Q0luR1Az?=
 =?utf-8?B?QmdnQ1lOUklnaUpuUG1YVXJ2TFI1ekxxOTcxaFgyUSt4UHQvY0RmcUMyaGFI?=
 =?utf-8?B?c2E2STJkWjNFZXZKMURydVdlbzVIamR1ckVLZjBsdEltNHhyQXIzVHAyRDB0?=
 =?utf-8?Q?41sjw6QGllvlg3F0YMUlNatVf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6c2699f-5c3b-4f6c-9802-08dd6319dac5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 17:01:25.4074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oqoY+g4mzJAAdgaQrAJwiUDxE4qkzDNM3n8sLdeXiW0dWlBoeysWQgakxUclDtQST7VhssClP+jeXONARLQuCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9110

Hi Dan,

Thanks for reporting this issue.

Thanks,
Pratap


On 3/14/2025 3:42 AM, Dan Carpenter wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> Hi Pratap,
> 
> kernel test robot noticed the following build warnings:
> 
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Pratap-Nirujogi/media-i2c-Add-OV05C-camera-sensor-driver/20250301-005638
> base:   https://git.linuxtv.org/media-ci/media-pending.git master
> patch link:    https://lore.kernel.org/r/20250228165317.3468075-1-pratap.nirujogi%40amd.com
> patch subject: [PATCH] media: i2c: Add OV05C camera sensor driver
> config: arm64-randconfig-r071-20250312 (https://download.01.org/0day-ci/archive/20250314/202503140559.3mp2n2oI-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 14.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202503140559.3mp2n2oI-lkp@intel.com/
> 
> smatch warnings:
> drivers/media/i2c/ov05c.c:936 ov05c_probe() warn: passing zero to 'PTR_ERR'
> 
> vim +/PTR_ERR +936 drivers/media/i2c/ov05c.c
> 
> 6da03431f4f1e18 Pratap Nirujogi 2025-02-28  922  static int ov05c_probe(struct i2c_client *client)
> 6da03431f4f1e18 Pratap Nirujogi 2025-02-28  923  {
> 6da03431f4f1e18 Pratap Nirujogi 2025-02-28  924         struct ov05c *ov05c;
> 6da03431f4f1e18 Pratap Nirujogi 2025-02-28  925         int i, ret;
> 6da03431f4f1e18 Pratap Nirujogi 2025-02-28  926
> 6da03431f4f1e18 Pratap Nirujogi 2025-02-28  927         ov05c = devm_kzalloc(&client->dev, sizeof(*ov05c), GFP_KERNEL);
> 6da03431f4f1e18 Pratap Nirujogi 2025-02-28  928         if (!ov05c)
> 6da03431f4f1e18 Pratap Nirujogi 2025-02-28  929                 return -ENOMEM;
> 6da03431f4f1e18 Pratap Nirujogi 2025-02-28  930
> 6da03431f4f1e18 Pratap Nirujogi 2025-02-28  931         client->dev.init_name = DRV_NAME;
> 6da03431f4f1e18 Pratap Nirujogi 2025-02-28  932
> 6da03431f4f1e18 Pratap Nirujogi 2025-02-28  933         /* create sensor enable gpio control */
> 6da03431f4f1e18 Pratap Nirujogi 2025-02-28  934         ov05c->enable_gpio = devm_gpiod_get(&client->dev, "sensor0_enable", GPIOD_OUT_LOW);
> 6da03431f4f1e18 Pratap Nirujogi 2025-02-28  935         if (IS_ERR_OR_NULL(ov05c->enable_gpio))
> 6da03431f4f1e18 Pratap Nirujogi 2025-02-28 @936                 return PTR_ERR(ov05c->enable_gpio);
> 
> If devm_gpiod_get() returns NULL then we'd return success, but actually
> devm_gpiod_get() can't return NULL.  Only error pointers.
> 

We are working on the feedback provided by reviewers on v1, we will take 
care of this issue too replacing IS_ERR_OR_NULL() with IS_ERR() while 
submitting the v2. Thank you!

> 6da03431f4f1e18 Pratap Nirujogi 2025-02-28  937
> 6da03431f4f1e18 Pratap Nirujogi 2025-02-28  938         /* Initialize subdev */
> 6da03431f4f1e18 Pratap Nirujogi 2025-02-28  939         v4l2_i2c_subdev_init(&ov05c->sd, client, &ov05c_subdev_ops);
> 6da03431f4f1e18 Pratap Nirujogi 2025-02-28  940
> 6da03431f4f1e18 Pratap Nirujogi 2025-02-28  941         /* Initialize CCI */
> 6da03431f4f1e18 Pratap Nirujogi 2025-02-28  942         ov05c->regmap = devm_cci_regmap_init_i2c(client, 8);
> 6da03431f4f1e18 Pratap Nirujogi 2025-02-28  943         if (IS_ERR(ov05c->regmap)) {
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 


