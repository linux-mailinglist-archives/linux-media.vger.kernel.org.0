Return-Path: <linux-media+bounces-35226-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A5CADFF13
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 09:47:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A4323A5D40
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 07:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F94421767D;
	Thu, 19 Jun 2025 07:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="A/ncKg7I"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2061.outbound.protection.outlook.com [40.107.220.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABD6207669;
	Thu, 19 Jun 2025 07:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750319228; cv=fail; b=K1muGPt1UQvxmgHObc0SyBe19TNPW9aieDHEn67IupmnT6ExURrmYF7tO7Bg8DIqlRJoDP3VeTsaZRgrEmOGZXXUp0nVElZ2iTifR5xM+QRweIn3QV7gRXZbqx8ldGczK5veEyDPAQtUUsZ+2/ajy86joRUcEGrWSS32dtpHgmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750319228; c=relaxed/simple;
	bh=P5VAK7G/NTrBb4dnh0H+DuPbDnz344T7gKpeqGBoLeQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=q/BbA3dUa3x5t7W/hElQTWHi+d1SgKF/wrYCwNmELDJJYPVEkYIa1omzfAYZt39ODyeuj7EdEyyw0LUVzRolfYDd2fFjw3cZy2fHu+jNzd9ttoL/+DbEPiQkJYKbAlKZ+AufzP6Bavy6gANTEJuN2qnve64gl4e1PefseULBru4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=A/ncKg7I; arc=fail smtp.client-ip=40.107.220.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uhM7Jq3CHOk02l6ytzN0LToJixbAy5oVnFlV5rPIJ1v/QKKH9FmcrsPr+MNH79bsQVfOyiIMQ9RzT0+/VS43txGPY1qD4/gAP7Hr+nD7JxGmhpy76zZ661aHNVSZ8lJtis4a/cGXuml03zJ8e4EUSpcT1PHgep05ILVyzjQOtAj5W5zcKMel3DYEyVLf1gt7dSvgMVpbxwjzFfQAA7J0g0yKjqSdA00FqaRjLkAJR5xNuzUOqcMeaojM4fwhbhUzEOdhpVYECWND2OsXNcccmHh75VIczbOEqlseRbXwk5TeaNYYL9nqLG34DiaLSu4rXcNVkhqrHpNnd2GS66cx0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7JyednOUksCByfy/xGnrVWETiILUkoPX/a+ZxPVOfIQ=;
 b=McAajxSYxLwSUrcRA7nAsXKt/+cqnvLTqxZELjl4jwYCcwnCO9R9pl7qiKyKS5ek/7A0wI18vk9RCbmTFT9YaXOwxQo42X8Z0tYGFyypFHU1SIvI+0Vih6Yl54gw/ZRIHx47gYpCzNrRLsUYNR7Yg/gAgVe65ZrivQ4cl9gw+qK4r/Vxb53ERO7k9RY1I5JMNNbBwQ+R0grk1RM3+cqauTV9/SKv+XbnjSUQgF0HtLbrbekO0l4c2qRKCGGR3DNedics5NbcxoOrO94egn1uFX9xFheoI+rS737SQuODjENzahnaF+/TJj/zGkM3oNa+ji0WxtADrb0eV2ogoT1uLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7JyednOUksCByfy/xGnrVWETiILUkoPX/a+ZxPVOfIQ=;
 b=A/ncKg7IqRIR8JMNPOziEOy4KHC0HdTaUjksD3s3RH0AA9kHRTNF+eDvY/PRp67YTzUI4l/FpAggw0pcg9Hx6pTQf90d0zWlKzXLM5eKOwofsFfkp1Nsy8BP9uy+nkIJ+0MclEq9sW+Uz9BA+hAY4jHSG9aFTrIdicPGeb+NILE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW5PR12MB5683.namprd12.prod.outlook.com (2603:10b6:303:1a0::10)
 by IA1PR12MB8190.namprd12.prod.outlook.com (2603:10b6:208:3f2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 07:47:02 +0000
Received: from MW5PR12MB5683.namprd12.prod.outlook.com
 ([fe80::3366:15a2:2179:2137]) by MW5PR12MB5683.namprd12.prod.outlook.com
 ([fe80::3366:15a2:2179:2137%7]) with mapi id 15.20.8792.040; Thu, 19 Jun 2025
 07:47:02 +0000
Message-ID: <68f481ff-3b99-4c21-964d-edb81b34452e@amd.com>
Date: Thu, 19 Jun 2025 15:46:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] media: platform: amd: Introduce amd isp4 capture
 driver
To: Mario Limonciello <mario.limonciello@amd.com>, mchehab@kernel.org,
 hverkuil@xs4all.nl, laurent.pinchart+renesas@ideasonboard.com,
 bryan.odonoghue@linaro.org, sakari.ailus@linux.intel.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 Svetoslav.Stoilov@amd.com
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-2-Bin.Du@amd.com>
 <0c4240bd-4918-48b3-aa8c-3860fa62db00@amd.com>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <0c4240bd-4918-48b3-aa8c-3860fa62db00@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0009.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::18) To MW5PR12MB5683.namprd12.prod.outlook.com
 (2603:10b6:303:1a0::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR12MB5683:EE_|IA1PR12MB8190:EE_
X-MS-Office365-Filtering-Correlation-Id: c132bb79-13ef-4086-55ee-08ddaf057aa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UFlUM2w3NWNLdVFsYjJLRWFNMXpha05mRkZXcU9iYzVPSXJZSFlNWFZrK2tG?=
 =?utf-8?B?d1ZZOW1DbzlDQU85N0phcGlNcFhKQklzOUtNaTVpQ0tsTFNjSUxnRk9YMUpL?=
 =?utf-8?B?U2VGM3R6T1ZRRmNweFBoYzZxUW5MVUVuQjJReDV3YmFJRDBzcG9UQWsrVTR2?=
 =?utf-8?B?RWJGK3hMT0pkWUFaeDNsYmpGRkkwOC9KRkg4SnJVL084NmM5RXl1M0tUdmdW?=
 =?utf-8?B?UEF0YlZUeG1leGdXeE9ZdUthb0d1S0lEK1htMXZVM2pIMVFod1Q1VlBKaHJo?=
 =?utf-8?B?T1ZaQWpvbFFyL0ZEbGdNdmVUVG5sNGdIQkZJOU0vWlpPKzlyTGVDelNTaFJk?=
 =?utf-8?B?Qkw3YzBjaEwvUTB4MXJXR0duTHk2RVJyUGhHY0xGMTRFdUZsK1BDVWJwcU96?=
 =?utf-8?B?QWhOSExrUVltem1ucXNkZW9CR0lEN01MMzZWVksvL3N4MzBYd2VtbnBZcVdo?=
 =?utf-8?B?TC85amx4YmhWbFBPeGM0cG9VM2JXVmNIY2wybDVFVlZZaEpvLzBEMGtsMjBr?=
 =?utf-8?B?ekZDVGtkTXlmM1lFN2JEZGJKMmhJenpSVXIwSUluNkNqOVBGZ0E1bHBheDdu?=
 =?utf-8?B?aHc4aW8xU3BDWW91WWlWNFYydFBwYnQ1UUJvSlRzRXc5dVhmdnYrRUkzSGNU?=
 =?utf-8?B?azY1VkRkUnB0cXFyK2tPSFVuMVFZVzBKWUl1a3VmRTNnZnlzUVdoRU80U2VD?=
 =?utf-8?B?bEczU3lhV0pPK1hSajQrd2h5VVlIcitScVh1VzdPZ1Azcmk1N1preUl4OG5L?=
 =?utf-8?B?VEFPZW4yR1pHbEJHQkFNeG5nVWQwWGxZWjhJRU1MQmtDeE1OWG9sc3BsSlZk?=
 =?utf-8?B?N3haclU4RHBHMWZKM09lNkZkeVh3OENFV0Uvcm5YeTRQNVdZUyswL2xDbWo0?=
 =?utf-8?B?N2k0cSt2cnlLVm04ZDlZZjZsQ2xZVGpWYXMwdVBNUitmbGt1SkdJMXhUeHor?=
 =?utf-8?B?NlVrVHd4QUNFM3A0MzBVTnRyUm1uK2x4YkVZYjVrVm1EeGgyWVllMWQ1NitQ?=
 =?utf-8?B?czhEVVhqTzMxQTFhd2RxQlFhRVdVY25iZ0krNEhpWkhQVHFEQkhJNEJlczJD?=
 =?utf-8?B?RDhxRzBadTJpWjhDd2t3d0dQNjZHK2tuWnZZSTNCYS85ZUppcS9mQUtjblJY?=
 =?utf-8?B?OFlrVjlodHQ1WGNrdjVmR1BFNXZQTUFHYlAyend0YllidS9oRUxIdUlaMVI5?=
 =?utf-8?B?ajJrMFpjcHozSkFHY3FDOXBOZXMyUHNsZExUb0tSNnFsMXV2bStISjJGQXBo?=
 =?utf-8?B?Ty9pQTUxcUU1YnMrOXNpeHBFcVNHL1M2TGU1NkFBTDBLdm5XTDZSUEtYd2sz?=
 =?utf-8?B?T0hWRWNSSlIycmlXYW5nNWhvbm5BN3BkSE5yWnJtRWdGNTJWL2k0Mks3Zzdi?=
 =?utf-8?B?VEtCMytqU1c1WTg1NWlJTVFVTnQ3enNWYXYrTFp1djNyR3gyZEVMRlJpTkx5?=
 =?utf-8?B?Z1BFdDhjNWlxRmVXOW8rSEVnQm1jTDA5b0dpNnFiOGIvaUtrbUprWWJ5MEI5?=
 =?utf-8?B?a3JMNmFxNTRJbkpjdmdCN3ZGbmJQSnB3eTVZeTMvRUpYOERWR1RNNEtycnkr?=
 =?utf-8?B?ZE50aUM5MUNkd1JmUkZPVkl0ZG9CZDJES3FhUVdvL1ZLME91NXNhcGhvTmdt?=
 =?utf-8?B?RW05U0duSHFnVVdJNWE3K1RqYVVFdTFZVmRJeENPWXZqV0FOZXFjMld4VHpF?=
 =?utf-8?B?OGFTMEw0YXB4cFhSaDRpeGRtQk91TnFlSVBFT0dUZ1poZTlha3dCeG9xdEVN?=
 =?utf-8?B?L1ZHRjZPZkN4YytaV0xjMUJvYUZnLytUbnA4Wk1EeEU5Yzk3dE5sdjRVMkFO?=
 =?utf-8?B?VXlhM01HV3ZzZytwRkpQVUpCY2NKVUI5Q0tjUGxjQmw1Q2NCSTdESjV2bGYz?=
 =?utf-8?B?dUNrbXFCMFIwRG5XZUhTT1lzTlp2b2p2RzVDWXViYTlvdkcxZS8xQ3QzVnUw?=
 =?utf-8?Q?/Rtg3oHXnpA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR12MB5683.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWx2V1dVK2M5V3NnQlVicE8wTlRGM2FlUDc2amJmOEFxU1NrejI0SFZEYjU3?=
 =?utf-8?B?b3Q3Y3NwNURYd3hLWUE4Nks1bkFpZU9MWnlLR2RRcURQTlZDZTQwVzI2TEU3?=
 =?utf-8?B?UnFEYW9KUzFHQ2NzVDNoY295KzdrcWlIZlhyK3R0T0ZtL0grOXRLazBxSmZj?=
 =?utf-8?B?czByT1dmNG1BZnh2TmhYY3hiWGtIOW9wSkpuZnNIMXcreUR0cWZMamFaVEV5?=
 =?utf-8?B?NExkdkFocnUvTmVEWGE3Yy9zdVlGY0FHclh3eUY3UjZWWHpWT3dEbjhEa09V?=
 =?utf-8?B?SEtmUUNwSVBzQjFMTGw2enN5djlMZjZQMWozNXBjNHcyckhrd0kyRkx1K080?=
 =?utf-8?B?blEyK3MwTDNrNUtnbzAzUDZmbUllTDM4N0RSdnVrVDJQdmxZTVFBZENSa1FU?=
 =?utf-8?B?aDNHTWIzaTNTd0g5Q0xPSnlxc01KeldsVDc5MTRFM293RXBRVnJpTWRMSDdF?=
 =?utf-8?B?WkVFK25Gd09oZ1dQMTdhMnAvb2lUQnNKbmZ5MHkvQ0F3Vzhka3g1VWNacW5u?=
 =?utf-8?B?NGdETEpLYjFZUDVxL1RSN0V3S1BBNStFcEZJbHEwYkY2Tm5qRkVzUitNKzVK?=
 =?utf-8?B?ZFI4U1ZIL2F3UityNG1rRWQ5eThRMXVwaFo1bDl3R2NFRThKa0FjbWEyclli?=
 =?utf-8?B?aU05dGNXd2FiVkxhY1JsWHowY21oc09xS1I1aWhpek1hTkNOdzZObEltaTI3?=
 =?utf-8?B?NHNJRDVGdkdDZlRka2Vib3FKckwyZjNXejNrZGtjSVNGVk5nKzVMazRGY1Bt?=
 =?utf-8?B?Tjh4TUFhYkdIZ2ZkbzlyS0dEemVVNktnKzJQQ2s4WVUwR1pOaHN0MG5SS0Fp?=
 =?utf-8?B?YTRJeW9HRHBpSE1sQ1Z6Z1ZnQ1hMZTNOQkdYVjF4bGdzWUxIT0lVZjNWRUw4?=
 =?utf-8?B?Q09adm9wNU93V3ltdXhVSFF0SzBLSXFYRVBpL09ySm0vUEhaeWc1b3ZlZ1J4?=
 =?utf-8?B?V05wWlpyZ291YVNGbFZ4TVJuMTBhZGZoU0lYRkFieTdsVWxEU1gvWDZTcGgr?=
 =?utf-8?B?V2ZsQVYyYS9IdTZiT21rUFVDVkpNTVZLWVh5aEJJZFlMMGFaS3dpanlmT1RZ?=
 =?utf-8?B?TmpWY29UcU1VUU9ZWmdTV3pTQXAycm9USU5YUUsrWnpvYjFrOWRpSER6aUE0?=
 =?utf-8?B?Vm9XczdJUnh4TjMxZ0l6SGNyRnFtZVdkaXV2dUg1ZEg1ZE1zajdkY2R5R0FV?=
 =?utf-8?B?eUlIcTNDUEsxa1dFNTdhd2Q4dGgvYnhRaXFQbGQ3VDNqY3hvS1dldy9scHhZ?=
 =?utf-8?B?Q0FzVi95OFpuUFM1WXpTdUZWTGxpVWRLbm4yckY1alprNzhvVEpoczNLRy81?=
 =?utf-8?B?VjQwTXdIUHpjWElLWWl3bnRwY0xSa1l0OUhscUthdUg5clg3ekNLUUcxNCsz?=
 =?utf-8?B?d3E0NEh0YWdpNndsU2tzR3NqZEYyVDk5OUFaTmVxQnBpcC9WU1ZDYm50Y1hS?=
 =?utf-8?B?ZUR6akdLazdXU3BoaUMyVGRPSzVFTnk3K05sMERhb1R6VTdyUzUvaDdIS1F4?=
 =?utf-8?B?ck4xZFVuRjlkeWYwbFZMRWtTNkk1b2pDa3RBN1p4bWdOWngyUW9uYUU3cVBV?=
 =?utf-8?B?UVdyekFBZVhqQkE3aG4vT0NxM3N0VytYMFlZUGdvMmtTcElLMDBuTGVNdjBM?=
 =?utf-8?B?cTJmbjNlWE15MERXeUxSMERMSFdCMlJ0UFd6cTZ3QnBXdUpVQlhNaDlCL3VU?=
 =?utf-8?B?N0FHRjMwajY3b2FqZ3JSOE05UExrbExaM3JzYUFtSWVqU0RJRUdkNmhFY01Q?=
 =?utf-8?B?M095Kzd0dGh3aVNncThlVGVoTzh5aEpCL2hqSWU3RndiQ3lwcjQ1RElaZWdS?=
 =?utf-8?B?Y3c0RVFNVmtTRk9VVXExVmJMblhYK1dZVko4WnM3ODFJRVlOUDVKQnVNdTVk?=
 =?utf-8?B?M0Z5ZFViQURjSjlQcUlZQ0tuMFhNQ0t0aEpQZFo4d1JwZzNKNFBtYWJpeito?=
 =?utf-8?B?SkFMOER2WExTRGtSbHIzYXF0Mm1oRG9YQmxLTHI2ZkJrTFNTWGR5Umt3eXV5?=
 =?utf-8?B?WHBsNG5lTHNyUFhUS3ZNV3hSbm1qQnVRVnkzeE5vdVg0UWUybTBSelpXdExk?=
 =?utf-8?B?THl4UlFIUnJTc2tWSjdPeEIwZjZBTVcxYWdZdFZ3aEdwc1pma0dVMG84eUJB?=
 =?utf-8?Q?sHDw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c132bb79-13ef-4086-55ee-08ddaf057aa7
X-MS-Exchange-CrossTenant-AuthSource: MW5PR12MB5683.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 07:47:02.7205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TnW9gL0khVeFaV/75h3Zkn++Y1jt8QiSIqyzcp5DPG3MVA4V/fcGEEqvZqRPxR6Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8190

Many thx Mario for your comments, really helpful, will address all of 
them in the next patch.
Add inline for some of your comments, pls check

On 6/18/2025 11:58 PM, Mario Limonciello wrote:
> On 6/18/2025 4:19 AM, Bin Du wrote:
>> Amd isp4 capture is a v4l2 media device which implements media controller
> 
> AMD
> 
>> interface.
>> It has one sub-device (amd ISP4 sub-device) endpoint which can be 
>> connected
> 
> AMD
> 
>> to a remote CSI2 TX endpoint. It supports only one physical interface for
>> now.
>> Also add ISP4 driver related entry info into the MAINAINERS file
> 
> MAINTAINERS
> 
>>
>> Signed-off-by: Bin Du <Bin.Du@amd.com>
>> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> 
> Who actually developed?  If both are developers there should be a Co- 
> developed-by tag.
> 
>> ---
>>   MAINTAINERS                              |  10 ++
>>   drivers/media/platform/Kconfig           |   1 +
>>   drivers/media/platform/Makefile          |   1 +
>>   drivers/media/platform/amd/Kconfig       |  17 +++
>>   drivers/media/platform/amd/Makefile      |   5 +
>>   drivers/media/platform/amd/isp4/Makefile |  21 ++++
>>   drivers/media/platform/amd/isp4/isp4.c   | 139 +++++++++++++++++++++++
>>   drivers/media/platform/amd/isp4/isp4.h   |  35 ++++++
>>   8 files changed, 229 insertions(+)
>>   create mode 100644 drivers/media/platform/amd/Kconfig
>>   create mode 100644 drivers/media/platform/amd/Makefile
>>   create mode 100644 drivers/media/platform/amd/isp4/Makefile
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4.c
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 10893c91b1c1..15070afb14b5 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1107,6 +1107,16 @@ T:    git git://git.kernel.org/pub/scm/linux/ 
>> kernel/git/iommu/linux.git
>>   F:    drivers/iommu/amd/
>>   F:    include/linux/amd-iommu.h
>> +AMD ISP4 DRIVER
>> +M:    Bin Du <bin.du@amd.com>
>> +M:    Nirujogi Pratap <pratap.nirujogi@amd.com>
>> +L:    linux-media@vger.kernel.org
>> +S:    Maintained
>> +T:    git git://linuxtv.org/media.git
>> +F:    drivers/media/platform/amd/Kconfig
>> +F:    drivers/media/platform/amd/Makefile
>> +F:    drivers/media/platform/amd/isp4/*
>> +
>>   AMD KFD
>>   M:    Felix Kuehling <Felix.Kuehling@amd.com>
>>   L:    amd-gfx@lists.freedesktop.org
>> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/ 
>> Kconfig
>> index 85d2627776b6..d525c2262a7d 100644
>> --- a/drivers/media/platform/Kconfig
>> +++ b/drivers/media/platform/Kconfig
>> @@ -89,5 +89,6 @@ source "drivers/media/platform/ti/Kconfig"
>>   source "drivers/media/platform/verisilicon/Kconfig"
>>   source "drivers/media/platform/via/Kconfig"
>>   source "drivers/media/platform/xilinx/Kconfig"
>> +source "drivers/media/platform/amd/Kconfig"
>>   endif # MEDIA_PLATFORM_DRIVERS
>> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/ 
>> Makefile
>> index ace4e34483dd..9f3d1693868d 100644
>> --- a/drivers/media/platform/Makefile
>> +++ b/drivers/media/platform/Makefile
>> @@ -32,6 +32,7 @@ obj-y += ti/
>>   obj-y += verisilicon/
>>   obj-y += via/
>>   obj-y += xilinx/
>> +obj-y += amd/
> 
> Is this whole file alphabetical?  If so this is the wrong place.
> 
>>   # Please place here only ancillary drivers that aren't SoC-specific
>>   # Please keep it alphabetically sorted by Kconfig name
>> diff --git a/drivers/media/platform/amd/Kconfig b/drivers/media/ 
>> platform/amd/Kconfig
>> new file mode 100644
>> index 000000000000..3b1dba0400a0
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/Kconfig
>> @@ -0,0 +1,17 @@
>> +# SPDX-License-Identifier: MIT
>> +
>> +config AMD_ISP4
>> +    tristate "AMD ISP4 and camera driver"
>> +    default y
> 
> I don't believe this should default 'y'.  Normally drivers need to be 
> opt in.
> 
>> +    depends on VIDEO_DEV && VIDEO_V4L2_SUBDEV_API
>> +    select VIDEOBUF2_CORE
>> +    select VIDEOBUF2_V4L2
>> +    select VIDEOBUF2_MEMOPS
>> +    select VIDEOBUF2_VMALLOC
>> +    select VIDEOBUF2_DMA_CONTIG
>> +    select VIDEOBUF2_DMA_SG
>> +    help
>> +      This is support for AMD ISP4 and camera subsystem driver.
>> +      Say Y here to enable the ISP4 and camera device for video capture.
>> +      To compile this driver as a module, choose M here. The module will
>> +      be called amd_capture.
>> diff --git a/drivers/media/platform/amd/Makefile b/drivers/media/ 
>> platform/amd/Makefile
>> new file mode 100644
>> index 000000000000..76146efcd2bf
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/Makefile
>> @@ -0,0 +1,5 @@
>> +# Copyright 2024 Advanced Micro Devices, Inc.
> 
> 2025
> 
>> +# add isp block
>> +ifneq ($(CONFIG_AMD_ISP4),)
>> +obj-y += isp4/
>> +endif
>> diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/ 
>> platform/amd/isp4/Makefile
>> new file mode 100644
>> index 000000000000..e9e84160517d
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/isp4/Makefile
>> @@ -0,0 +1,21 @@
>> +# SPDX-License-Identifier: GPL-2.0+
>> +#
>> +# Copyright (C) 2025 Advanced Micro Devices, Inc.
>> +
>> +obj-$(CONFIG_AMD_ISP4) += amd_capture.o
> 
> As the directory is already conditional on CONFIG_AMD_ISP4 is this obj- 
> $() needed?  Or should it really be obj-y?
>
Yes, it is needed, because AMD_ISP4 is trisate in Kconfig, it can be y or m

>> +amd_capture-objs := isp4.o
>> +
>> +ccflags-y += -I$(srctree)/drivers/media/platform/amd/isp4
>> +ccflags-y += -I$(srctree)/include
>> +
>> +ifneq ($(call cc-option, -mpreferred-stack-boundary=4),)
>> +    cc_stack_align := -mpreferred-stack-boundary=4
>> +endif
>> +
>> +ccflags-y += $(cc_stack_align)
>> +ccflags-y += -DCONFIG_COMPAT
>> +ccflags-y += -Wunused-but-set-variable
>> +ccflags-y += -Wmissing-include-dirs
>> +ccflags-y += -Wunused-const-variable
>> +ccflags-y += -Wmaybe-uninitialized
>> +ccflags-y += -Wunused-value
> 
> Do you really need to enforce all these flags just for this driver?
> 
> Was this just for development to avoid having to remember to call the 
> build with W=1 or CONFIG_WERROR?
> 
We found after patch submission, Media CI robot test will be triggered, 
when it builds the patch it will set these flags, so adding these flags 
to align with Media CI robot test to discover potential issue before 
submission.

>> diff --git a/drivers/media/platform/amd/isp4/isp4.c b/drivers/media/ 
>> platform/amd/isp4/isp4.c
>> new file mode 100644
>> index 000000000000..d0be90c5ec3b
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/isp4/isp4.c
>> @@ -0,0 +1,139 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#include <linux/pm_runtime.h>
>> +#include <linux/vmalloc.h>
>> +#include <media/v4l2-ioctl.h>
>> +
>> +#include "isp4.h"
>> +
>> +#define VIDEO_BUF_NUM 5
>> +
>> +#define ISP4_DRV_NAME "amd_isp_capture"
>> +
>> +/* interrupt num */
>> +static const u32 isp4_ringbuf_interrupt_num[] = {
>> +    0, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT9 */
>> +    1, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT10 */
>> +    3, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT11 */
>> +    4, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT12 */
>> +};
>> +
>> +#define to_isp4_device(dev) \
>> +    ((struct isp4_device *)container_of(dev, struct isp4_device, 
>> v4l2_dev))
>> +
>> +static irqreturn_t isp4_irq_handler(int irq, void *arg)
>> +{
>> +    struct isp4_device *isp_dev = dev_get_drvdata((struct device *)arg);
>> +
>> +    if (!isp_dev)
>> +        goto error_drv_data;
>> +
>> +error_drv_data:
>> +    return IRQ_HANDLED;
> 
> In patch 5 you change this function, including dropping the goto and label.
> 
> So I suggest that for patch 1 you KISS:
> 
> static irqreturn_t isp4_irq_handler(int irq, void *arg)
> {
>      return IRQ_HANDLED;
> }
> 
> Then in patch 5 add the extra conditional code and real handling.
> 
>> +}
>> +
>> +/*
>> + * amd capture module
>> + */
> 
> Pointless comment, no?
> 
>> +static int isp4_capture_probe(struct platform_device *pdev)
>> +{
>> +    struct device *dev = &pdev->dev;
>> +    struct isp4_device *isp_dev;
>> +
> 
> Why newline here?
> 
>> +    int i, irq, ret;
>> +
>> +    isp_dev = devm_kzalloc(&pdev->dev, sizeof(*isp_dev), GFP_KERNEL);
>> +    if (!isp_dev)
>> +        return -ENOMEM;
>> +
>> +    isp_dev->pdev = pdev;
>> +    dev->init_name = ISP4_DRV_NAME;
>> +
>> +    for (i = 0; i < ARRAY_SIZE(isp4_ringbuf_interrupt_num); i++) {
>> +        irq = platform_get_irq(pdev, isp4_ringbuf_interrupt_num[i]);
>> +        if (irq < 0)
>> +            return dev_err_probe(dev, -ENODEV,
>> +                         "fail to get irq %d\n",
>> +                         isp4_ringbuf_interrupt_num[i]);
>> +        ret = devm_request_irq(&pdev->dev, irq, isp4_irq_handler, 0,
>> +                       "ISP_IRQ", &pdev->dev);
>> +        if (ret)
>> +            return dev_err_probe(dev, ret, "fail to req irq %d\n",
>> +                         irq);
>> +    }
>> +
>> +    isp_dev->pltf_data = pdev->dev.platform_data;
>> +
>> +    dev_dbg(dev, "isp irq registration successful\n");
> 
> As you have error handling in place with dev_err_probe() I think the 
> lack of an error implies this message.  I'd say drop it.
> 
>> +
>> +    /* Link the media device within the v4l2_device */
>> +    isp_dev->v4l2_dev.mdev = &isp_dev->mdev;
>> +
>> +    /* Initialize media device */
>> +    strscpy(isp_dev->mdev.model, "amd_isp41_mdev",
>> +        sizeof(isp_dev->mdev.model));
>> +    snprintf(isp_dev->mdev.bus_info, sizeof(isp_dev->mdev.bus_info),
>> +         "platform:%s", ISP4_DRV_NAME);
>> +    isp_dev->mdev.dev = &pdev->dev;
>> +    media_device_init(&isp_dev->mdev);
>> +
>> +    /* register v4l2 device */
>> +    snprintf(isp_dev->v4l2_dev.name, sizeof(isp_dev->v4l2_dev.name),
>> +         "AMD-V4L2-ROOT");
>> +    ret = v4l2_device_register(&pdev->dev, &isp_dev->v4l2_dev);
>> +    if (ret)
>> +        return dev_err_probe(dev, ret,
>> +                     "fail register v4l2 device\n");
>> +
>> +    dev_dbg(dev, "AMD ISP v4l2 device registered\n");
> 
> As you have error handling in place with dev_err_probe() I think the 
> lack of an error implies this message.  I'd say drop it.
> 
>> +
>> +    ret = media_device_register(&isp_dev->mdev);
>> +    if (ret) {
>> +        dev_err(dev, "fail to register media device %d\n", ret);
>> +        goto err_unreg_v4l2;
>> +    }
>> +
>> +    platform_set_drvdata(pdev, isp_dev);
>> +
>> +    pm_runtime_set_suspended(dev);
>> +    pm_runtime_enable(dev);
>> +
>> +    return 0;
>> +
>> +err_unreg_v4l2:
>> +    v4l2_device_unregister(&isp_dev->v4l2_dev);
>> +
>> +    return dev_err_probe(dev, ret, "isp probe fail\n");
>> +}
>> +
>> +static void isp4_capture_remove(struct platform_device *pdev)
>> +{
>> +    struct isp4_device *isp_dev = platform_get_drvdata(pdev);
>> +    struct device *dev = &pdev->dev;
>> +
>> +    media_device_unregister(&isp_dev->mdev);
>> +    v4l2_device_unregister(&isp_dev->v4l2_dev);
>> +    dev_dbg(dev, "AMD ISP v4l2 device unregistered\n");
> 
> Probably not needed message anymore, right?
> 
>> +}
>> +
>> +static struct platform_driver isp4_capture_drv = {
>> +    .probe = isp4_capture_probe,
>> +    .remove = isp4_capture_remove,
>> +    .driver = {
>> +        .name = ISP4_DRV_NAME,
>> +        .owner = THIS_MODULE,
>> +    }
>> +};
>> +
>> +module_platform_driver(isp4_capture_drv);
>> +
>> +MODULE_ALIAS("platform:" ISP4_DRV_NAME);
>> +MODULE_IMPORT_NS("DMA_BUF");
>> +
>> +MODULE_DESCRIPTION("AMD ISP4 Driver");
>> +MODULE_AUTHOR("Bin Du <bin.du@amd.com>");
>> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/media/platform/amd/isp4/isp4.h b/drivers/media/ 
>> platform/amd/isp4/isp4.h
>> new file mode 100644
>> index 000000000000..27a7362ce6f9
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/isp4/isp4.h
>> @@ -0,0 +1,35 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +/*
>> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#ifndef _ISP4_H_
>> +#define _ISP4_H_
>> +
>> +#include <linux/mutex.h>
>> +#include <media/v4l2-device.h>
>> +#include <media/videobuf2-memops.h>
>> +#include <media/videobuf2-vmalloc.h>
>> +
>> +#define ISP4_GET_ISP_REG_BASE(isp4sd) (((isp4sd))->mmio)
>> +
>> +struct isp4_platform_data {
>> +    void *adev;
>> +    void *bo;
>> +    void *cpu_ptr;
> 
> Will touch more on these in later patches, but I would say don't 
> introduce them until the patch they're needed.
> 
>> +    u64 gpu_addr;
>> +    u32 size;
>> +    u32 asic_type;
>> +    resource_size_t base_rmmio_size;
>> +};
>> +
>> +struct isp4_device {
>> +    struct v4l2_device v4l2_dev;
>> +    struct media_device mdev;
>> +
>> +    struct isp4_platform_data *pltf_data;
>> +    struct platform_device *pdev;
>> +    struct notifier_block i2c_nb;
>> +};
>> +
>> +#endif /* isp4.h */
> 
> /* ISP4_H */
> 


