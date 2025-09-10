Return-Path: <linux-media+bounces-42145-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3FDB50B1A
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 04:35:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AB9C4672DA
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 02:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B46324166E;
	Wed, 10 Sep 2025 02:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HpFbB0ll"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B60D18E1F;
	Wed, 10 Sep 2025 02:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757471711; cv=fail; b=AzYtc9H7Yc4uBHyA4xxKTgcKG5FFyBWRrEJ5bgvPtgXX77Brq3+o0CNAMuEFdzpSmFh05ruFTzDIUWVlSHZrGW19MX2u/eCxusFMMKz0RTkmNspvsmskyb52lKjAn4RyoTIS6vwzxrcjhiXcwsDOsymOTXCXvnXZee2TQ9VGU/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757471711; c=relaxed/simple;
	bh=hkO5JduytKRtBLUqty39843BfzAqytiYCJcWMvvzVHY=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=enyjdBgL3VAycrCRHuyJonjWEMjUfMuCcnbfeIOddgYziHYjKp09ZIe320lmWcCb5m7FKNtZGGPstP7v47QmVsv6HZ94ZLuZ8MmHVwGPPCZuSxDmQ3HfoyUsLkwC/Sb7SvLpVdXEvZBTpyA0e/jazyzu1iXFY539pY7VkxHb4uo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HpFbB0ll; arc=fail smtp.client-ip=40.107.243.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EU8MfULqXOcjyqH5WdyBmY6VfeoeKHIO2cQmO9Av96o9lVyIzN0qkL+v7ZYO2EwhWIyv7+TL3ATVBaUSqbMvSNgaPErb/P3GQPcmC/+2/ZwpMMEc792Ya4/fBwIgXZsGiT1ukqS3482ftM7UD4HlavpCCW+UwbMysQ1S0Xsdb4YH6W6h3Z1+tC4vQXWYoxEOH9MPrXh+BUJa/YZW4YeHmXsgpbeoymq8taqR1BSdjr07WzYt5A1yhgpcCgKWrLhhV4lTL6i4SaRQqHbx3ja3Wo/ZYoM0FDESJkDHGHU+T7Xsd7EhSMVhl+CWYlqVao+quknXh48fYT7JMuq+Hb6/Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RjOg7nUfTydUNnHNw0iRRMwLs5Uu10b8yWhiLvpHxNY=;
 b=ZT3s/u5HOopg5PWbP1M8yAApB8ZKYUm60xPHxniVI4hBbuWCevd/8vK1xZ2iExnY5MEfdx1mxpCS3ErF5H4ujrc0lKm25SgCTWKBqWlkwqfMKbKVHLjWFJClofzG1dbUvp3NHNqNv6Z8jfMADxSvgkicB6HF+rAQ+i10inuStS0k1lCSGNYNp47TcuIJW0a3BMQZNJSb6YXDhs42p9M4QNiVHA71m81e8/TdhT4DEpiBuYHLJpq/zrnLFtZyCqK0Sd0PQa2MUUGZF0xuefVi3bPTuZLOggg08eCo6VRHfsea2cJEht4V4XfjF6MP9rXPWEtOV7lzof1/mYeGmOFOww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RjOg7nUfTydUNnHNw0iRRMwLs5Uu10b8yWhiLvpHxNY=;
 b=HpFbB0llGE+6u+6ojpkOCQ8vE9APD6+x2FsBLC84TzxWoL3ljWJwCfrTQVrjpCNPux4qVAQnmHanttk7+BR9lO3LkzhlNQ+NPdIaNrswJjJo5TnB86aBtzb1+fVJwUASJBQlz8Iet5jbPa+BsOO+VGmuM2AHABhFq0qqm1+H/pM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by PH0PR12MB7906.namprd12.prod.outlook.com (2603:10b6:510:26c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 02:35:04 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%4]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 02:35:04 +0000
Message-ID: <c89e8dda-ae05-46bc-bf3e-9e95a20538a4@amd.com>
Date: Wed, 10 Sep 2025 10:34:53 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Add AMD ISP4 driver
From: "Du, Bin" <bin.du@amd.com>
To: Shengyu Qu <wiagn233@outlook.com>, mchehab@kernel.org,
 hverkuil@xs4all.nl, laurent.pinchart+renesas@ideasonboard.com,
 bryan.odonoghue@linaro.org, sakari.ailus@linux.intel.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, sultan@kerneltoast.com
Cc: pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com,
 bin.du@amd.com
References: <20250828084507.94552-1-Bin.Du@amd.com>
 <TY4PR01MB1443251944E84D91018CFE8DE9802A@TY4PR01MB14432.jpnprd01.prod.outlook.com>
 <485f202e-de42-48c0-bdae-52d6290fd7d3@amd.com>
Content-Language: en-US
In-Reply-To: <485f202e-de42-48c0-bdae-52d6290fd7d3@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: KU2P306CA0020.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:3b::8) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|PH0PR12MB7906:EE_
X-MS-Office365-Filtering-Correlation-Id: b06d1199-dbca-474d-0214-08ddf012a612
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y2dmMU1ZU3U3NGJsaDgrRHNJODV2cTBZM3hCaEFRVmtWNWhGd3QzSlZPSWJV?=
 =?utf-8?B?NzgzVWFWcUVNUUpZK0JvMmFBUWhHbWN2Q0lLbEs3aVZLV1d2MmRZWlU0Nys2?=
 =?utf-8?B?V0pBMUI1OWwyT3dzb20zQ2xRZXdzZWFXZFhjUHQ3TDJFQ05zdVQrZUZIemZZ?=
 =?utf-8?B?WXNsZ1BOSENRYXMzWUs5SXNscVRGOStPRzV1UWF1NzAwUHFaOWJyRk8veXRS?=
 =?utf-8?B?Umx5MmhTVUs4V3ljbUFVWWpaZkRyMlBLMkhZYnhhWVgrVWRqTWpYcE9sMndN?=
 =?utf-8?B?ZkdldUNJMi9GbHpiNnk2NnhwYTE5SDFqV05UZ2lwaFNiSlRQeDFNd3oxc3Vu?=
 =?utf-8?B?UTFCMFk0aHlrK1pFWk9zQk1xZC9uOUluMWtiVUhqVUN3Yi9iRzBWVE1oRlBy?=
 =?utf-8?B?MHhxZjcxUjVzTHRTQmMyU3UxSmtQNlkwZDNVajIxU2ZYYjRrTkVEdDZyand1?=
 =?utf-8?B?VHNLUzNvVUVMNDNLMzZNSlpiRnl5TmdtN3RBT0gxMHFWa3I2ejJYMWdtMFFK?=
 =?utf-8?B?R2FiUHFTK2ZyZHRlcFhpSVlFQ2ZQZmwrcGl5aS9vN3RJbFdkK1IwWUYzWG1z?=
 =?utf-8?B?ZEVOODMzWnk4SlhPYjVmVXpEYng5WDJHRFNadVpLNFlrcUdobkl6QzBqVEVz?=
 =?utf-8?B?WWhXcm1IbVJxWk9lSWhxa1lBRndZNEsvSmxkbkhhMlVIY01zVGc2RWhPSG9o?=
 =?utf-8?B?S2tvUFZ0Vk12RjVvUUxsbHdVelY5YXplN2FjQWhDeHdkUWdMUEoyNmc1VnA2?=
 =?utf-8?B?b05lanNhQ3U0UC9qcVlqSE5PQlZxWWJtd1pEcHZrWExJdzhFTEppQ0NUWC9L?=
 =?utf-8?B?TkJsMWtIT1gxMlJUbldRUzd0dTJIWnpJdHpndTVMT3ZZcWUyc1JWYllGUFhy?=
 =?utf-8?B?VjV2Z2o5VkdaMjBtM2R1UHRxRVFRazZ2YlBlTXdDK244dnl2amtIeUw1Y1FD?=
 =?utf-8?B?QlRFSGNhK3ptVHFtRDh3a3UrM21MRjVqTjNXb083ZGF3NXRMc3BrY3ZWZGIy?=
 =?utf-8?B?cnM0MUVuYWcrNGhxeTZScGdnNjJraWRKQVZZVG1MYUZHcmt0ZFNQSTgzYTN4?=
 =?utf-8?B?K2EzN1JNdm1BK1ovOFc4b3c0cUtmMmU3NWVIaThmR2tIbUc4Z2dMTkRRMm8y?=
 =?utf-8?B?NTFCdFRSUk1QT2Z0SWpibHF1c1hvQnM5eWNEK09Lb3FYY0UzWUF0UzNrU2xF?=
 =?utf-8?B?a0o5OUlHM1g3TklyYTRvNDNQdzg0d0h6SHVzK0pWMzA0YzZxR2NjYzNpMWxz?=
 =?utf-8?B?YXFsZmVaUjhraFhKcmwzZzJXczZjd1BJSTc3NEx6ZDFiSEVrUGhPNjdyN1RJ?=
 =?utf-8?B?WG1LS3g1Nk1STkczeHpuajFxZ1BqY2x1YWFqMUM1QlRSRjRic05Yb2tMTlM2?=
 =?utf-8?B?YmpURlFKKzJCQUZWT2IvTjJ6TFptR3BWaW02by9OaFE5V3c5T0Z6bkFNa0c2?=
 =?utf-8?B?NzlnZWNGNXJ2MlVEWHp0VVplbnVOTnE1QUJGQUVFSE5uQ0w0d0tDeEh5UUU1?=
 =?utf-8?B?UldHNy9icm1NNGRyNjl3ODgyU2NOK3V1YlBxMGNqNUR0NGxtc0NXcXowR0NY?=
 =?utf-8?B?dmpkbGt0dHkzdVBzcTZIVUFNRjkwc243TUZNWnl1WEw5Si9WMzVpQ21COXlE?=
 =?utf-8?B?QWxnck5ySkJ4RGY5RExvSGRVOWRNdFQrdVJrZHBVTk9sOGZGU09RQ0JXQzdO?=
 =?utf-8?B?TU13dVZodTNBdndORU4zZVdvUTlEOHd2REQyTUZrUVRFKzlvVlp2Y25aNlVO?=
 =?utf-8?B?cXJNVW1ubnRKZHRSc2tFaGdjSHFSRnBzNGsxNDZtMUIxcnRQQjJjTVVLZkl0?=
 =?utf-8?B?WXIzVzVjejllNThrZ3NWaU9hUTJkRUdMMjZtSjNwUVZ2MFlsQVNFMjJpRjdr?=
 =?utf-8?B?aG4zVUFnVVdYSGk5eHo1ZEdCWFg0a0lpNStNWE9mcEZkWndyTy9seWIvTXVm?=
 =?utf-8?Q?ZPFZeKQESbI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWNPUjhXTzg0VjYvU3JCOVFTR2xBT3phUGEwc0hya1lvSDZHV3M0b0FpRm1X?=
 =?utf-8?B?bVRIRTh2aXozNU1wWlFkdi9xWVdwMXVreXlOVlRvR3djVDUzQnlGNEViN0R3?=
 =?utf-8?B?V0tzOVM0dmlUS29BY3Brbm5rOUJZV0s4a3JnLzR5RUxnNGNvN2MrbDBKY0Q2?=
 =?utf-8?B?RWhJN2JYOCtGdFJmbzJxSytvaFBPWTlBSXd0Tzlkcy9QNVcxaDUxQ1BNZmY1?=
 =?utf-8?B?M3ZlWEtNQzNuUTVHa1M4a09OVEZ2Y1FaeGdUS28vdjl0bDJCZW1ackJHVWZH?=
 =?utf-8?B?L1pqM0pyL0dTRURZMFBCL1JiN3ltZjJVeGxuQXB4NGVxNjkwWS8wK2Q3eSt1?=
 =?utf-8?B?YlVFUFZVd0hPOCthQTNXU21PWEZEYW9BZUhlMHpNSGJvM3RBTWlkMlVXVHdx?=
 =?utf-8?B?dGs2MzUvZVpWRXR1bkpzNmdGNnltRzFtQmoyZWNScVhydlE0OWVJUnBFbDZo?=
 =?utf-8?B?aTlVVHVQNmt0ZE51MTM2Z25oeHdoRUk5Q1BVMUhvaVAwOHRORDZuakFXWDRU?=
 =?utf-8?B?TFkwMXlOdVdkVDM4Z1E2MVh3dmtFOEg4Y2QrMlJhTnFveE80REpvZVJoTm1I?=
 =?utf-8?B?ZC9NRlUwdmtqSGJUbkM2ZDJncEZldFdGUmZqcHFON01xUUFYYWpnTVlWZ00v?=
 =?utf-8?B?MnBhOXdlUmZNbEhwb2xOL3Z5blpJTGdjcFF2RWNvc2NDUmxRR0ZrMmdFSkpH?=
 =?utf-8?B?TG9RK3pMV2pEeG9QbFBBeFh3RTJ4LzhmUUgxQ3hnR245NlBoODAyaThjdVp3?=
 =?utf-8?B?eUhKUVBSc01yR2c3VFY2akhWOG5MZkhyVUluNzF2dXhNSDU4Z1J3Yzl1ZHB0?=
 =?utf-8?B?UVVkZ3lFTzB4czA5UERGYm5zODlPNnNieFp5N0dMWElHdXpkQ0VxazVtdnU2?=
 =?utf-8?B?NlZueUhJMlBLb2grU1dXR1lJbjFwYjVPMkxPWnBGNTRaVWRwZTV0blhBSXVz?=
 =?utf-8?B?YmZZVUxacGZwRmlOWWgxcnlhU3drMzgxSWxZN1NPNjBXaHF5SWNGdWYwV3dN?=
 =?utf-8?B?RXUyRnJmMWUzRnRVMjNiY0RQUVdJNVlvRUJoODJleDRDWjZxWVE3WXBLci9G?=
 =?utf-8?B?dUtET2N1UUNWTzlaOEsxOG1tOHlTbXk5VXd6eFUzZVY5ekR1NXZRVk85ZVFj?=
 =?utf-8?B?MlhuQk5SVzdqZTM2VElUTlBJcFdPQzlpaTU1ZDJWc0V3V09EM3B1VVkwcTZv?=
 =?utf-8?B?OXhrMTBiVXZiajNRcGJKTExvTHdUQjd6T3UxY0hMWndXd3NFbC9hWTRMdms4?=
 =?utf-8?B?NWRaUWZETGJGcVptblFVdHZPanV2YjdHSG8wa0tJRjN3clFYSFd3T1NmbFpL?=
 =?utf-8?B?SEE0dE1qZHVyclB3VmQ2QWF4b3JnQUZWeVNtdkhicHRBajdBZGhFYkhmSmZl?=
 =?utf-8?B?MnpjSTNjTUJCZExCb0NSMzRWODgyMlMzckZYRExIL2E3TUovZXVlck83SzQ1?=
 =?utf-8?B?OEUzeEN4bHlvWXBCK2VFZit6Y0d4OUFhcW45S0FmMW9sRlk2V1RiTThJNDNk?=
 =?utf-8?B?Q2E4SXpQZi9MNnpUZGJqZWpNVnV6Q2FkSkVjb09BLzdLUjhsaVFac2Nhc280?=
 =?utf-8?B?NGlNWnIrWEdYZUVCLzNrZmFpMW5rcTRGWktoQUdtbzdXZFdzK00zQm1pdzMx?=
 =?utf-8?B?eWFxVFJlTW01L2xRL2taY2xXMGJwUHlzeVB0REYwZXlNMmhkN3VmVEtxcnBT?=
 =?utf-8?B?QUoxOG1QdVNXS04renE2VUpVOFJYc2NLaWYwaDhsaHhVK29VNFFrdkVVS2RS?=
 =?utf-8?B?MHMzRlR4UDgyamxOLytPUnZndnVJaURqVGE1SytFdTJUMndlSDAzOWErM2J1?=
 =?utf-8?B?ZmJmdnZINi9zek5BdlU3aytoblQ1L0MvLzlPWm9tUGtEQnE5ZndlNGVSeDdP?=
 =?utf-8?B?TlJ4UjdMVk9veEJabGlGMTF2WUExQ25MdjYrcHBXc0xwNUFvb1p1YzUrVHRH?=
 =?utf-8?B?NjROTkNjenBKUVF0bXpON3VjVkpQamFzaXFYV01LYzBDZzMrUytNaEdEQ0lF?=
 =?utf-8?B?SE9qbS9Jb0ZsamhjQ2VGM2krNytraFc2MkdjcWJqKzNTSVBUY0l1TWtIN2hS?=
 =?utf-8?B?K0VqMWpIWTVsV1hCR3NPdGFzMU5uWHA0UU9HZ1Z3TmVTUlVnNG1FN3pEUlhP?=
 =?utf-8?Q?ZaMI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b06d1199-dbca-474d-0214-08ddf012a612
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 02:35:04.6141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: choB7HBiMj5PS5TgTMt9gCVzOJjDy1QvGQ5a8UcntA/gNEJTWMy3Nwx4fVlcXtvm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7906

Hi,

On 9/10/2025 10:15 AM, Du, Bin wrote:
> Hi Shengyu,
> 
> On 9/7/2025 2:40 AM, Shengyu Qu wrote:
>> Hi,
>>
>>
>>> Changes v2 -> v3:
>>>
>>> - All the dependent patches in other modules (drm/amd/amdgpu, 
>>> platform/x86, pinctrl/amd) merged on upstream mainline kernel 
>>> (https://github.com/torvalds/linux) v6.17.
>>> - Removed usage of amdgpu structs in ISP driver. Added helper 
>>> functions in amdgpu accepting opaque params from ISP driver to 
>>> allocate and release ISP GART buffers.
>>> - Moved sensor and MIPI phy control entirely into ISP FW instead of 
>>> the previous hybrid approach controlling sensor from both FW and x86 
>>> (sensor driver).
>>> - Removed phy configuration and sensor binding as x86 (sensor driver) 
>>> had relinquished the sensor control for ISP FW. With this approach 
>>> the driver will be exposed as web camera like interface.
>>> - New FW with built-in sensor driver is submitted on upstream linux- 
>>> firmware repo (https://gitlab.com/kernel-firmware/linux-firmware/).
>>
>>
>> The sensor is MIPI CSI and controlled by I2C, isn't it? Then why we 
>> put all control logic into FW rather than driver? Any existing CSI 
>> camera ISP support implementation are not doing this by FW.
>>
> 
> Yes, it's MIPI CSI sensor and controlled by I2C. In AMD ISP 3A algo 
> architecture, part of the sensor control resides in the FW and in 
> previous version, sensor init control is put in the sensor driver. With 
> discussion with the V4L2 maintainer, the current approach starting from 
> V3 is to move all sensor control into FW and remove the sensor driver 
> dependency. Please refer to https://lore.kernel.org/all/63949b3b- 
> ca2d-42aa-bc8d-43f2952d307a@amd.com/#t which provides the context and 
> background on how we arrived at the current architectural change in v3.
> 

Also quote the comments from Laurent Pinchart in 
https://lore.kernel.org/all/20250812134222.GN30054@pendragon.ideasonboard.com/ 
"Exposing the camera sensor to both the firmware and the host 
concurrently is asking for trouble. If you really want to abstract the 
camera behind a firmware and only expose a webcam-like API (or not even 
that in this version, as the driver exposes no control as far as I can 
see), then you should push the whole sensor handling to the firmware 
too. In my opinion that would not be a good solution compared to 
exposing the ISP to the host, but it would be better than this hybrid 
model." Many thanks Laurent Pinchart and Sakari Ailus for the arch 
change guide.

>> Cheers,
>> Shengyu
> 

-- 
Regards,
Bin


