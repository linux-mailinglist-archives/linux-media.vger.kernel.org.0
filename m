Return-Path: <linux-media+bounces-45999-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9145FC1FA3D
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 11:50:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7E8254E41DC
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 10:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 538E52206AC;
	Thu, 30 Oct 2025 10:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ykqm67Z4"
X-Original-To: linux-media@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010024.outbound.protection.outlook.com [52.101.193.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D3C313552
	for <linux-media@vger.kernel.org>; Thu, 30 Oct 2025 10:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761821415; cv=fail; b=t8fd40uJ3j2FfIPkNcAr782JsOrgSiYF0fKdJZtlKj+BJzXongck0WeLuiekTAB4b6QquBh6G0tCbnNiFs7l01zFfeOLdB2S13/kRoVcJwp5K6deIMoMZ/PQ4gNVrin7TXiqo8ntjf57wn7U6Q+BwM858ybDkd8NUUwJBTmDY6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761821415; c=relaxed/simple;
	bh=2bmq8S4RTC50wRSx2qXBJQQqGWjNMaChRKq+LF5bUP0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XnyajxErDV4ojXSlIoQK5LvHBytWhnikOHLaLcztjhYqleGQeNHPp/OW+Dsv8L/GGlx3J/pUAVyFH5pmNrkyr6aPBGeG+sreGx9wtJU2+qo1vlQV6GbzN3XbTJppIc1RGlRF6LTVVag7mfRwAaY7vxKDgBPaTqMk3icAgQ7O6u4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ykqm67Z4; arc=fail smtp.client-ip=52.101.193.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b4QuMxDCWq9GcJvNCeR+NYFsjnWAhSJgjvtismspHN5GO1gA3VUhDE2s19ePWT5McSDwrRbnRWXqXp1Wokx38XPp3ptZQCoTfqU6ha3xovoVYL/UL4QQIbEf8I69qUbxGEccsixV3mHz7hZnqzH1tQrgFa0nJpa/NmIPNxChQmDovKn3Ou19C/O22vO0IAZYGSXoKp2bsY3zrdDpQxiRLUkCmdYveDmdWaZk2t/nUOtVCcV9yKJ3wejDtc6QH+elefISrd3ljt/BZiIqfCqZ+vjhgJpjqIGMf/1XgmFNgzpF9FlFWhptv6JmjyYceD9SaV0Cikyo2t9x+QgArFGdPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JjXgIqJUOyinh78ykMwMpNtOFIeeoUi7o4PRSF6meaM=;
 b=Cjuljpb7y3ixOh737wbqfnhqYOP4E5WbkIT03vg/TgKGXuYBkWBENxms/4UMT0T1Cor6jqRJ+1ypQaRXcIdYpHJzrOwCVRlvmKHI5+jTG1Uwyu0WGkvnE2bWn02BrYW2UpwGSdG6UL2gMZoWcoI8w8X9TJW5ogLnvT71iSZxk+dQG3VXHCPDTis22ZGFrcRrqkoQu5W2bX36MFpSQF9qtHVucrkx5Ig1ZTNFFWkb4/3p2FOp1yC9MlvnTbXzjEO0UrTqGTKWFafzNKIAo82UIrZf10/LxoNqG4D2eRQS0cO+CPi9G5o8P2mCGm3N3npHK8MSATqQNZOCI3Nw2B79ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JjXgIqJUOyinh78ykMwMpNtOFIeeoUi7o4PRSF6meaM=;
 b=ykqm67Z4iMajYOaapZQQMGm8EMsFz3h6fjoxGTLAqGZcMTwOM38GQR8PSuwolVnMPSaiVu9V7cMXat3hzG5aPiqTPppeYT7qwgHn6NrUIgtZniR1dC6cZdI74CKXliF+A884C1YtnbfBVVLyRPPiRbXi2fTPkpK24+aaX+7PWQw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA0PR12MB7649.namprd12.prod.outlook.com (2603:10b6:208:437::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 10:50:09 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 10:50:09 +0000
Message-ID: <2d8f4e8c-10b5-4783-855f-c7f0f7343ea2@amd.com>
Date: Thu, 30 Oct 2025 11:50:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: Take a breath during dma-fence-chain subtests
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Nitin Gote
 <nitin.r.gote@intel.com>, intel-gfx@lists.freedesktop.org,
 chris.p.wilson@intel.com, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250226155534.1099538-1-nitin.r.gote@intel.com>
 <2153999.KlZ2vcFHjT@jkrzyszt-mobl2.ger.corp.intel.com>
 <7a96d06d-54a9-42b4-84c7-0c262104ea5b@amd.com>
 <7836906.EvYhyI6sBW@jkrzyszt-mobl2.ger.corp.intel.com>
 <cf5d530e-6952-4e76-93e2-5c72b31b5c62@amd.com> <aQJ2YMGxh-foBCvx@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aQJ2YMGxh-foBCvx@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4P288CA0085.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d0::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA0PR12MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: 8121c92a-7c50-4833-7588-08de17a21832
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M2ZIanpLRzdlaEtjQ0lNcTNhVjVYTUdURTducnZOVGdaQk5STFNSNkNvbUNU?=
 =?utf-8?B?Mnhoa25GZVh5UFZuNlpWWFpPNkpMcXJtc2pVUno0aUdhbGt0U2l1dzNDeEI0?=
 =?utf-8?B?UlhyeGx2bGlSOXdFci9CVzlHcmdSQXk2ZUNPSmppb1Y3NkgvbURhV0RDMnBF?=
 =?utf-8?B?Vk5YNDlZR3Jzc0JxWXdtZVVSZDFrMnBkeUtXVVI0SEgreFJmeUpINHFlaEZZ?=
 =?utf-8?B?V2NCbnZEbnBScTVCb3VHaHN1S0ZpcGpZUFdnQWJIWG1ITmcwR083MFA3VWtK?=
 =?utf-8?B?Q3FnZWdPNUkvbzJPR2JaLzVpL0VrYkgwMzJJcEU4SWYxUG9VK0FkTFBPaEZp?=
 =?utf-8?B?R1VxTFRaQ1pBeU1kdGV4dmtCVzlFcWluR0x5Y243RnJHdlpwU0xYKzB3YUdT?=
 =?utf-8?B?R2F0c2wvT3BhNytiU096ZFNBU2l2SU1kM2dlZUR5Sm1pUHFCVFhWN3ZmbWsw?=
 =?utf-8?B?WFZXTVV4c0VFeEh0bTVTRVdHdFlwT2VWTmh5Y1MrcWI1NUFvaW1SMGFVZ1lC?=
 =?utf-8?B?UHQvQ094ZTN0QzhMWXFRTVRVVEU4TWNjRHp0THlrcWVYeklSYjRnV1JGVFhT?=
 =?utf-8?B?MFJRL3NWNWhFZVN5OGlsNWRkVm5DaG80cVFzUERNeEVJZFFDdCtuM3FtLy9N?=
 =?utf-8?B?TWFzdGd3RmRUWlhxaldiNmxoWWN4ckxWbjZDc0x6aGMrZ3laRjE0ZFVxTFFp?=
 =?utf-8?B?MjMwVTVPOVpVdkpqd0xXM1BiM0E2VDAzaDZ5VHlEWHNzcHo2L1pNalRILzBW?=
 =?utf-8?B?T1pUQzNtRDhPRGd5amxIV01KNXJIeEJIZVNyUUl0eGY2RDdxS3R5RTJ4RzBO?=
 =?utf-8?B?c0pnSUtxdUk1VFR0N1pxRFMxL0UwNUY5MWlmeEZzb3AvWGt4aG9QU3ZzMVBR?=
 =?utf-8?B?OXlJREt3TWJiRDR0VnBKR3VQNHVPOGNsYWJkN2pOa2QweXNMSHFINm1hRFZI?=
 =?utf-8?B?K3NVTkRidjFrYTEzYkYySU1pdGJiM0hVZHFZTDBUQzFCWXdqUDg5M3AxekpX?=
 =?utf-8?B?bGFCalNmTXJ5Z1QwK0JkZ3AvUGgzdXl2TWxBREE2NWgza2k2VVFXeHhqR01h?=
 =?utf-8?B?akFRWHJ5NUYrTUo1M25FYXNvdlc3QUFLc0pJdXI1WDlkRUxYaFNjMmdFeis3?=
 =?utf-8?B?ampMNGFsdktpSCt4SlRYaE95dzZVVkNLclM3Z3g0M3pEbWZxN1hkNUdZRUlI?=
 =?utf-8?B?U3JWaVh2VVVFMjIreGJ5S0h0ZlNlaVovME5GSTJBMEkzeVo1RU83NEN1Rkxp?=
 =?utf-8?B?UTFpTWMyNTRxYnJIL2RGdkp3TlFlcUhwWVVhcFUvcmlXZWhqdGZlY3MzMTFv?=
 =?utf-8?B?THJtdy9jcmZiMkZYQmNrRDYzdWMzUkJJTGlqRkVTdUhIR3I2MGxzTE1zTEFU?=
 =?utf-8?B?MlVUbkM5OUVQUklPYWYrYkdjQ0QxTEwrSTcyT293YmdEVEd1YUUwRVJMSHJX?=
 =?utf-8?B?SHJtOS8wOGZNeVp1YS96WGlrbVBFSkZ4TnNLZXJLWEh1eHMwNEZrcFoxL1N1?=
 =?utf-8?B?cWY5ZkpOQWlyekRQVXY3RkU0UTZTZC82L3JHcXRhTFU3cjVVa3BXbEJka05o?=
 =?utf-8?B?ZUJlb1dRTHY2ckk2OWZ1VCtzYzRQQ05UaGp6M05ZZWowang1RjBXdUkxcjhD?=
 =?utf-8?B?YlZUalVna1lYNVY0TkRsTXpSVFMvSWx5Mlc3R0R2emcrV2lZZGZlT2lqVUpo?=
 =?utf-8?B?THJkRE4zZGowcGlwMUYxalltTFdIVjNTWUNzbFZSZ1ZPRjF4Y2NjOTV2bU5E?=
 =?utf-8?B?QTNheldQb3hlVWRWSHVrMDl6alBKRVBRakpWYVNBcmozdG50TUg1bTZUSE9S?=
 =?utf-8?B?eTIyWlllR2RzSi8vT0ZwQXBOVGVJM0NiTmt0Q0pFcnZVVGFqeE4wTkt3UDNY?=
 =?utf-8?B?SnpQSHBadHNFU1pXNy9RQ2hUbUNadjluT2RlNXlmRHRPcVlXY0NvRmsvaW00?=
 =?utf-8?Q?FuD6izbaCnpbr1Em9rDyHu/45k01RTRh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3FXR096bXZJWWhsUHFOSDJGaGtrT2thZ1hNdnNPOTV3VGo3OVZyZ0xERXBP?=
 =?utf-8?B?dUpIOGtBRnBBT00xWW5FcEFTSXpCekhOL3o0RzV1NndRc3JGNHVvS2MvZjNr?=
 =?utf-8?B?SXhpRjdRUnp5SmhSYWIzbitBWi9aZ3E2QWVERUJWZnhNMmFMVlVEdU9nV2NZ?=
 =?utf-8?B?QllVcWNGbEpqKzFZb2crUmFIU0UyWVdDWjlQN1BZK2ExbnhUV0JybXBXN3pM?=
 =?utf-8?B?cXRBa0FMNTVyNWdWWE9Fb0VkRlUwL0VCU3JYcG9Gb0lSdUJSa3NGWkxRbDRn?=
 =?utf-8?B?MlpXYlZ5Zy9DMDZzZWRCazdkU21BRDR3OXhkMFhxcjFNK0pqSUVPSWxrdEhn?=
 =?utf-8?B?VDY1V05Lckh2QWZ0d2ZCQXowdHJBY08rcmZ1LzNVV2Q0K3pLb3NESmpYMVhW?=
 =?utf-8?B?YUQzZWppSWVoSEd3Vk85b0w4K2YrQWZxQ0hnNThQdTh1M0NoMVdSYTloSTBL?=
 =?utf-8?B?TjJ6S2ZDZitHVHo0QWJoTTFPa2kvN05JVGV2d3hBRjlNRnV2dWNjRnRyRDQz?=
 =?utf-8?B?U1ZzejAxUEF1QzF2c09jSlZBN2c2dG5mQVFFcmh4cGZFaXFtaWxhL1RiZWdW?=
 =?utf-8?B?WithWWgxYXdwemZwY0ZFMUQwSkZpZHM3TENNbG5JbWRXVDY2eXBFRGdhZFMv?=
 =?utf-8?B?cElueStiSnlMK3R2bWJhTXBBTTZvYjNPdkcreVFYR0lHTjZ1bCswV0ZDakRC?=
 =?utf-8?B?c055NkoxMldOdDlyZ3kyTEhNeHZIOU9BUkk0RlMyb050WCtwbXNOaFRFdXpz?=
 =?utf-8?B?TE9TTTIyUzM3SVJHajhmc1lYRFNqdUhVb3NVRmxzSFFUMUYzWmszVVZkQ3dj?=
 =?utf-8?B?SFA1cGJ2R1NsRmdYWmVsVFlNNjNIM2E1Umx6dDIwWlppdXMvc2lOZnM3OFRG?=
 =?utf-8?B?bW5XM01kSERDcXJFUWRTbUtVcDdnZnpxeUVrM0twL2o5dVY5Q2JPU3B3VFA0?=
 =?utf-8?B?RE1LUUNXTm8wU3YzNjJSbnVJejVzNXJhQ05qMzgwaUVmVm92RDF6c3lmZS9H?=
 =?utf-8?B?Y1dQbUNrQW1obVdVU3ZtdGp0NWxTUmh4OFBVY0MrR016bHBveGNsM0Y3MTVh?=
 =?utf-8?B?dXdhckgyVHJ2MGNQNDFJY0EwSUh5M01mRXNvUzNEZ0d1QTZCSmRMOGVsZVhE?=
 =?utf-8?B?VzNGSEo4QWNMWE9rT1Y1OWZQbjVlWUM2OXRxOTg2eUNWNDdwL2V6ZmdaNEpS?=
 =?utf-8?B?ckxoYUltVE53bmV5dVgxUGo5RkdQUzRjYTFhK2FiTDlac05ZVmNlV0JERHdY?=
 =?utf-8?B?UWdqMmVDWXU3Ky91MkxrVmsxNUlrSDNoWEFPVTNxMlZkVWJiYVZLYWFZTDBB?=
 =?utf-8?B?bUF2S0NSRHZwVThlaFVOeUNzWGlmSHl1UkpmSnNUeGY3Y0tWcHlaT3RaTHJ1?=
 =?utf-8?B?NW0velQ2MUdEYTl5bHNvY0gzS2lQdkZiMkpMcmRZVHhock9BWVNMUTJOVVZG?=
 =?utf-8?B?dnk3M0ttR0hiUGRDZFlmU2gydCt1Slg5Qmx5MVZSVWIvY1ZnY1NhSzY5NE1X?=
 =?utf-8?B?R1VYYnpxQmdLSVNaZWpoRDFPUWF0NEtRNURGRTRhSEIwNnBpS0FIdjV4U1J2?=
 =?utf-8?B?ekRwM1JvMm9NbFNFV1BNdDUxTFhwOUFRQlluZW9McHhNV3gySHh3akxyYUNx?=
 =?utf-8?B?MW5CNW1HQkZEKzFoWHlDQks4ZjFHcy9SenNXamxtWG5Kb3R3WFVrS2FqWjlz?=
 =?utf-8?B?QXB5OFV2a21ldkZGUU44aStxVTBiYnNySlJZc1JEZHkxY0dMajF5VTQ1bThr?=
 =?utf-8?B?V1VJRkhPWjRPUnZrQmZ0MUIrbnJJRUwyeTF6K0dIMmN0YWlBdUpuZU9KeVVp?=
 =?utf-8?B?OHZMM2tBbnA4SnhMVHM4M3A1Wm9hOVVjanpWV3REd080ZUpnemRjNkhHV2RV?=
 =?utf-8?B?UExpZWw5Qkh1dE8rRWwvYUxpK1A2a0h4UVVWVlhoRlF3WnRkemRUSTNPamxJ?=
 =?utf-8?B?MTh6ZDgwakVhc0FoR0l6VmRLVlZoZmdlcVV2eWRCbmdBSFpIM25GajNqNE5Z?=
 =?utf-8?B?YzVNc0NaejRBZTRBVGgxNFQ2YTMyOXJnOFBRb1FYTytHYkptS3lNVXYxUnpX?=
 =?utf-8?B?YTNqUFNqOEVDdVFkNkVJbEZXa29iUS90S0IwcTZwMnJuQytIRkk1NVY0cGp1?=
 =?utf-8?Q?kd+U+q/D9HzC67Y5IrV1RiKsh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8121c92a-7c50-4833-7588-08de17a21832
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 10:50:09.3897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8xLQ20GxBFqSXybS6aetizB9ygCamwOxz02XpRIe+Y/1ma87zz3biayS4fBXl6Nb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7649

On 10/29/25 21:17, Rodrigo Vivi wrote:
> On Wed, Aug 13, 2025 at 03:29:39PM +0200, Christian König wrote:
>> On 13.08.25 14:43, Janusz Krzysztofik wrote:
>>> Hi Christian,
>>>
>>> On Tuesday, 8 July 2025 12:09:58 CEST Christian König wrote:
>>>> On 08.07.25 10:56, Janusz Krzysztofik wrote:
>>>>>>
>>>>>> There is no reason to test enabling signaling each of the element in a loop. So there should be something like 4096 calls to the dma_fence_chain_cb function each jumping to the next unsignaled fence and re-installing the callback.
>>>>>
>>>>> So how building a chain should look like in real use cases?  When a user 
>>>>> builds a chained link of her fence with another fence then may she enable 
>>>>> signaling on the new chain link?  If that other fence occurs a chain link then 
>>>>> who should take care of disabling signaling on it so signaling is enabled only 
>>>>> on the last link of the chain, not leading to a situation similar to what we 
>>>>> have now in the test case?  IOW, what's a correct use pattern of 
>>>>> dma_fence_chain?  I can't find that documented anywhere, neither in inline 
>>>>> docs nor in commit descriptions.
>>>>
>>>> The dma_fence_chain container is basically a single linked list which allows to "chain" together multiple dma_fence objects.
>>>>
>>>> The use cases is to keep only a single fence even when multiple asynchronous operations have been started.
>>>>
>>>> So you usually keep only the most recently created dma_fence_chain and eventually ask that one to signal when you need to wait for all fences inside the container.
>>>>
>>>> The tricky part is that since the chain can get very long the implementation can't use recursion or otherwise we would potentially overflow the kernel stack. And that needs to be tested and made sure we don't accidentally break the implementation somehow.
>>>>
>>>> Keeping all elements of a dma_fence_chain in an array and asking all of them to signal individually makes no sense, for this use case we have the dma_fence_array in the first place.
>>>
>>> I'm going to submit a patch that drops enabling of signaling on each link of 
>>> the tested chain, as you suggested.  Don't you mind if I add your Suggested-
>>> by:?
>>
>> Sure.
>>
>> Thanks for looking into that,
> 
> 
> Hi Christian,
> 
> Okay, so the take is that that IGT case is non-realistic and that that kernel
> change is not needed. We still have a problem with this patch here take so
> long to complete in a few platforms in a way that the watchdogs gets triggered
> and test case is marked as failure. While if we do the reschedule waiting a bit
> longer it end up completing successfully as expected.
> 
> Since the goal here is not performance but compliance, can we go with this
> cond_reschedule here? Or do you have any other suggestion here on how
> to handle this test case and make it pass on those old platforms?
> 
> Or should we simply disable the tests for those platforms?

I think for this particular case we should just completely remove the test.

HW can have some parallelism and out of order execution, but it is just unrealistic that 1k of submission made in the order A..Z signal in the order Z..A.

What we should test is that in no possible combination the kernel runs into a stack overflow because of recursion in the release handler (for example) of 1k submissions.

What we should also test from userspace is that we can't overload the callback functions of a fence. E.g. something make a submission and spawn thousands of threads who want to wait for this single submission.

Regards,
Christian.

> 
> Thanks,
> Rodrigo.
> 
>> Christian.
>>
>>>
>>> Thanks,
>>> Janusz
>>>
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>> Thanks,
>>>>> Janusz
>>>>
>>>
>>>
>>>
>>>
>>


