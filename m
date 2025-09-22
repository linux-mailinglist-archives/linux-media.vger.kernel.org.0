Return-Path: <linux-media+bounces-42862-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3F5B8ED2F
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 04:50:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66FC97A59CC
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 02:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20B632D1F69;
	Mon, 22 Sep 2025 02:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QcvjjzVi"
X-Original-To: linux-media@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013066.outbound.protection.outlook.com [40.107.201.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8C3EEBA;
	Mon, 22 Sep 2025 02:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758509442; cv=fail; b=eQA5ghF/l2aYB+YxE6ZUm1aDR+Kl5nii9ROBVUyqL+55jEoRZKtF92+R5DrKX2LFMP/VHiErPHRBYSsWuzvrYOo6y0zZ626dYX74lfAG8ATpiA3UUIGlwD8i4kWN5dTAcCevG/YWeASXSfgFenpzaSiGaXYrg3GBPMvvZbLCEfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758509442; c=relaxed/simple;
	bh=nBiFy/t0ujRhaJs9mjtTV1l+PY6M4dwNRxJKm4sYpYY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hsOmFy6+TXkqSe3dauu9uvoRa5mvMZmfOG8t28wgeb76ZHLJWyb2kVnysKaa+txG8PdfEzFkJqwz/5CPq7q5+9kGmplGML5IGdEF4E6MCIbQfEGgaP/nW3MMT7M3KPl8G9oiU55WVyQKHdisEuCiXA/21sj3CFyZkWA/JBfqdss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QcvjjzVi; arc=fail smtp.client-ip=40.107.201.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q308IvmcKGEeusH/BBMhaT4d1PLtMYBjVZtYEhmXfwnWUcoxuGv6vDGyalCKlIGG+tMBZu4xOATwq47xDgrDkreunLVW9sX4BzP7FaNDB/bbQ24E0hBnmX1Rcfu+eQvARP1P2jRsD0lioOxZnqRsBl71cKWSgtxJJX4wixkkwDgp7UgEC+KwrcUfSHkpi6F7OlUYlpNVg19NfDeCN/7ZCLiCt6LggC1IIUJXk317bAdcbV5GXRsZBLS7hVCY8Oquk/uuIdoJW/EX8GZ5hNWh2ZzMDZ51HhoNeWFeQ9tNGZClUYZ4l1DCz+5wws52/ZVxZW7dCtCHb76GiBTps4LpmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8oa7tMhi1LjnOibyKixdVA6RTuAHahwhDd+YYGE7SU=;
 b=vOQv+0H/V4JKf9/PVEH4r2xoF3SAAhKrgjz7ebUYwYBkbNQnJgby9CQHbV6GHBxI8do57skMbzqUKpXrmsFKL1/ujZ3jDHrN3SOgtEgve6WD4Q4RqqadRdbuZoVAgTyre+yjAzoaAE6vcX/RN8VUGGKFAs5CDImX8z+nvn8AxcP/VrOhwCstIC0jjJ5eQ/pGR++pyfyMrYM+dDK1wQmEkxtii81S5n2KPoEtz1qDLl0PeyPHEHdBxyS4r4JWjCa7CKXnR634a+F0Ev0epXg7QZC8TCvb9QnNsoz339TCtruNKw77AzR3AMzicBCEh3/EB6t04CMlNgGX93vxg9idSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8oa7tMhi1LjnOibyKixdVA6RTuAHahwhDd+YYGE7SU=;
 b=QcvjjzVi8masJgTQA7QrpUV1p6/RBo47cvT79Xv7NkPhX0ZHU6E2QfQVL31s1VYvpsrLhiPhdyhIPkjJ826rIPk9owVIr3CPNCV1+rzTIkd0MRf4d5+GvWRggLC+MOgrHM74KIPRv0yirC9/UYyGPQXrhS00pJKwifdtwUtGZTM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by LV5PR12MB9754.namprd12.prod.outlook.com (2603:10b6:408:305::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 02:50:37 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%6]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 02:50:37 +0000
Message-ID: <9f65c049-8369-470b-bf60-0dd14376d5a5@amd.com>
Date: Mon, 22 Sep 2025 10:50:27 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] Add AMD ISP4 driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 sultan@kerneltoast.com, pratap.nirujogi@amd.com, benjamin.chan@amd.com,
 king.li@amd.com, gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
 Dominic.Antony@amd.com, mario.limonciello@amd.com, richard.gong@amd.com,
 anson.tsao@amd.com
References: <20250911100847.277408-1-Bin.Du@amd.com>
 <2325fe6e-f17e-44f2-9c3c-495466b40e4b@amd.com>
 <20250919122321.GD10985@pendragon.ideasonboard.com>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <20250919122321.GD10985@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0038.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::7)
 To PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|LV5PR12MB9754:EE_
X-MS-Office365-Filtering-Correlation-Id: 35f51490-2970-4941-ce4a-08ddf982cf13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RE52U04zZmNtaURmRjducCtrZ1lkMjRCMk9aNlZuSU1haXpXOFUxSTRKaHNC?=
 =?utf-8?B?L1A2QlREZkdueTdHK0pwYXFnWUk3WUtXbmxuS1kyNHR5cFNXVXRqeGQ2NnhS?=
 =?utf-8?B?YTJSck1DVWFwaGdEOTc3Si9uM3dtbUlGMnJyMkdscUxXOWhKRWtvWStqOUNW?=
 =?utf-8?B?dVUxVWE5T1F1a0dGTHBWdHEzNDJzTHBxbTZQLzJjc2ZxMGtTMFJrWjJhQnJO?=
 =?utf-8?B?UjJiZ1NhRFdQSzM3YWNWZXg1TkFsbmZGU2Y0d2xudFZFRG5DSDhTNHhnRkd5?=
 =?utf-8?B?WWx2bnQzNlhYelZLdkphTDVWZVN4clRCZ3lJZE90a3pJT0F4ZGZYeTJWVUhE?=
 =?utf-8?B?eHlmWmd4Sjd5Z1BOTXB5enpCZVFRYkxCNDNUaktRRFFyOWJnVllZeXAwZFp3?=
 =?utf-8?B?K0FTYzYwWnlpWFdWanF1dkx6cVQ3NkhmSjVyVzRDbG9XY3NEZ2lhSzhFVCtG?=
 =?utf-8?B?R1B3cnVPRENVZndOeXc1UkZXTENrMVM5NGl6NjR3cGY2WDVSeWlFN05Wc3Jq?=
 =?utf-8?B?L0V0NTFEbnBkekNadjhTYkRwMlNYNWJ5eEVuTEVyWE94dG1uY2dORkYwQzB3?=
 =?utf-8?B?SHhUeTVxbDMyOVVOYU5MK0RJYzdrenZLaElVNXRBek82bWIyT3FOTUVNUzBU?=
 =?utf-8?B?WUlRb2FhYUE4UEVpTkF6K1lXQmk1SFFxS2xueW1KTWFseVhpQTI1V2MyWVBI?=
 =?utf-8?B?QTN1WGU5YUc4QnRPZVFNK2g3b01EOU1hOTY3VGpEbTRPMnVRcC9CU0hHUlI1?=
 =?utf-8?B?WWwxSmFJTUN5OXRwZ2pERS8vSS95L3JvaXhOd3RJeWMxSWF4MnlrSWVBd3ZF?=
 =?utf-8?B?WDFHZE9aYlFPU0pFOXZZNXhHelRRUWdMc29RZ3Nya0FIWGMzVWdsMElRdDVV?=
 =?utf-8?B?UDdkdlpQTlZsRXhHajI5cDhNZXlGMitVKzVHSDRrQXlicWdyZDVLYTd1bnFQ?=
 =?utf-8?B?MUtvaUZ2aGtsZVNrVW1KWDBIaW1pSExpNzFZeFpLZVlzRWh5NEw5RDVuaWRE?=
 =?utf-8?B?ZDVjNmF6TGFsUWR2aEJzWW9mREN5ZGNWUnE0bEV0S1RIVWxRWXJTbk1ON0RZ?=
 =?utf-8?B?dmJ5Z0xzajRGekVrRVR0UHgya3FsTWZHdlVwMXJ6ZWZHQmFpNTZPMEVlbUlJ?=
 =?utf-8?B?elVRV3RQWmlHelJnZHc2Rm1xd2NmcnphZEJMOHdENFRxYkhDWmM2MUNQTXlk?=
 =?utf-8?B?VkljSUFDcTVxck5xUzNZaUJjOW9FaldFRXN4ektzRVFvZnIvZExTL3ZObkFW?=
 =?utf-8?B?bkx3UHpTYytKYW52RXUrdkphN2lQQllhd2wwbnVuSFZ0VU92aFI0TGM2Rll0?=
 =?utf-8?B?VVBxckVKcVZ4RzdLbzhFcmtENXpEVW5maEFXVktpcVY0Y1duK2dIVE1Jcm9S?=
 =?utf-8?B?V2o4Z2tpNzVIUWpWK0JkQ0QyV0tvMGpFeWJQN1pwRHlIeFkvNHlLaFNCajBW?=
 =?utf-8?B?UnFCbURxVzJxdmlTOUVMNWNjYVdkbExDeURDYWJMdGFiam1pekNQNENTSTY1?=
 =?utf-8?B?cTdYaDg1d2dZdFd5YWVaOXpPR1RZU2NmY2JiYTR5Q2JIS1MwNVRUODhWRVhh?=
 =?utf-8?B?czJMVC92S2YycS8wODhJQnA1YktCNFhkWW0yYUJucGRqRXl0UWNieEZLYk9y?=
 =?utf-8?B?UmY5VVQwcmZiSlFhaEo0L3N5VXY0TVVuTXVCbTV6NEczbVBXNTdLS0xXWERX?=
 =?utf-8?B?ZWFKSm1HdkNzWUFySUVLU0pGT3A5NGxlQUtaYWU1Y3I0aW5TVGZFMldZNHdx?=
 =?utf-8?B?a0ZnTVgxQktVd0FSM1BQN3ZrbVF5VjAyRlpKQVBObHU5M3UzVjNXbVFjeU5I?=
 =?utf-8?B?TndUQVhUVG5UNFRPOS9zd285WnczTHBkWk9aakNkd3ZBNW5KOUhqSFlJNTR5?=
 =?utf-8?Q?99IsuTTgUPJOz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmhkTTlsaG42VzVTZVpwRUdYdUJVYmFGR245b1ozWlRzZkN6MjRhS0pXOVhx?=
 =?utf-8?B?ZkE2OWxkNDN6bXZZUjlDeFAyaHh4WTNsblpmWU9CT1hVaXd2ZmN3OENVcnRu?=
 =?utf-8?B?eGJyRnNpeUJ3T29vRWViVndRS3BMYVBWWFphdU5Bc1owTmpHaEg1Rlk2eHhh?=
 =?utf-8?B?VHl5WWlSaGJ1SzRHZlFaTWdDZForYVFyZW13ZFZLVWVJVDBKZ2k3U1YwN2kw?=
 =?utf-8?B?bmpSU1ZKTFZvbm5xSWU4QzByV21zK0VSV2p2NThLUWVMOTV1L2xueVFvWkhs?=
 =?utf-8?B?UTB0QzhXa2xZTU5ZZWhsZDcrNUZjZWN1Qm1PWmlXRlpyS0czVmxIejJvREFi?=
 =?utf-8?B?Tk04UytERm5ZUVpzVnlDcUlGSzBITDI0MTd1VzBKVHRESExhT095VVhmU0pt?=
 =?utf-8?B?TERkQUxDZEExTFBCZWxnMGJRdDRWVStXV29rU1ROdHIyZmMyUXdZZWd2akRM?=
 =?utf-8?B?L3d1aWczekJvdkZwQlB3QkFrVEpQbC83VHJUaHhBWjZwRDM0VGJJS2QvaXo1?=
 =?utf-8?B?bktGNWJTbkVoTTR6TUVRMlVmaUNrZVNBUkNlalpEMncyeXhQRW5iR1NiT2ZB?=
 =?utf-8?B?Vzd3bysxVERXQnNYQ1V3K0NBNmp3MmlmYkU5bExHbmhzc1Zhb0FLb3Z5OWxx?=
 =?utf-8?B?Znl6dzhJMWVlMXQvWFZNR0Y1QmhUejQyeWJpa056aHFKSVVSQ3FEQlEvc0RI?=
 =?utf-8?B?eENza0lLaGNqcEt3MlltS1h5RUFnV1hoWnVsanlLZk4vdk5CMGdsRENtc3JS?=
 =?utf-8?B?Lytwb2djaTdJeDhZKzBUdGUraE1NMWVrbnVvT0crSjk4UzFNYmFZajNQREd2?=
 =?utf-8?B?a3pCam14dTdGekJaWC9jem9kZitWRzZ6OVVHUG5yMVFsSzJJTFZZck5lNnlm?=
 =?utf-8?B?N2FyZmJ2Q0szd0hWVUN6c3dwT1VoODQxSVBuWGFtWitNQmlWbjdoeU5KNGVo?=
 =?utf-8?B?Mjg1eFBxalNrYW9nVzJrR3N6M3lTNzRYMXA2WnhUL005TmdVenhqSjdvczh0?=
 =?utf-8?B?RG8vak0vZlo1UlhGdTR6SXBzRElxK0M0azNZQnZFYUZTRkU4Wis3Y0JUTEh2?=
 =?utf-8?B?ZUgzQWRsbHN6eFRzQndDenBZYXhicW5YaDRjSWdtQ0xmVkV2NTVnVk5mZ1U1?=
 =?utf-8?B?a2tjS0tqUXVHUzJ0dUtGTTg4ckIvMTBqbkR1OERNRCtVV05WaE84eDdMZFFy?=
 =?utf-8?B?TmIwK2lMcVlUVFZ0OTJzZThlSWFrN2Z4T0J2Qk51M2t1UVE1ckgzZ0pKdWh4?=
 =?utf-8?B?ZldoODVqUjdhOHZTeHo4NEV1STdNRGJWWG5WZ2ViM1BHYnBiSU81dHB3L3Vv?=
 =?utf-8?B?L3ZPaXREQlR4YzUxcWhzaStNRWx0RGpxdmIxUGhYMmRFaHFQMTJncDVCcmF6?=
 =?utf-8?B?OU5MeldJTmhRc3N2K21QMjE5Ulh2VDhKS3FId1pIUzB0Y3BOSTNjQzRyWFV5?=
 =?utf-8?B?OHhmcjlDamxBcStvdXVhdWtrNU8yTHVPK0F1cEtFY3pOandqYVA3RFhEKzlR?=
 =?utf-8?B?MGFLQzhWQmVCaG5sTElIQkpzTG1wSFNvYUl1dnRkRWZYb2FMSWc3REFPVlE0?=
 =?utf-8?B?MjdiQnN1S09hM2tEZUdlUVhUQXBjVHB5TmJLNzg1aVFyZlZ6Mm5FclhnaTRQ?=
 =?utf-8?B?MU9sc1BiSDRrUjI3KzlRbEVRbzQvT1JYQWl5bEFBWXN0L3kwWkQ0YTY3Zkxs?=
 =?utf-8?B?aWNZUnE5SFFrdk9vWEs0YkEvRmR3K1REMjBaa3ZGcDdpWDFWcnN5VEdVRzFo?=
 =?utf-8?B?akFoaDB6U2V2a3VnM0NDeWtsVG9GM1FpMUVlbWxvRlU0L0tzMnZQdHo3dXR1?=
 =?utf-8?B?UXl5U3g1dXJWTDZLdHVXYTd1aytjSy9hckZmQ3pCSk9ETlowRjhZY2dwY3ZP?=
 =?utf-8?B?VFRpZW53c1lNdDRRR00rWWlEZ001ZnNiMVRQdGdUZEtwUlUvU2Z2a0hSaS8w?=
 =?utf-8?B?QmFuQ1lMR1N5amMxRzhOOVBZVStTamFqRGQreUtOSDdGUVh0aWtVNHNJNnZu?=
 =?utf-8?B?dmI3clFHaGVSL1kzbmZVMmpxQ2pxdUZnbml1bmpySko1QlRwbUxteEd0Skpx?=
 =?utf-8?B?MDU0MDc5cm9FbXlISTJDOHNWWlBubENmTmRwT1UydHZTMjNNYko0blVTYW1m?=
 =?utf-8?Q?sdB0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35f51490-2970-4941-ce4a-08ddf982cf13
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 02:50:37.5547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NHf8u8CdELk/nImhvvMfE9iDhSmzNpdjb9r+KbwxsB8am+12gWDKpmZVAa6EScws
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9754

Thanks Laurent, totally understood, no worries at all and please take 
your time.

On 9/19/2025 8:23 PM, Laurent Pinchart wrote:
> Hi Bin,
> 
> On Fri, Sep 19, 2025 at 11:24:36AM +0800, Du, Bin wrote:
>> Hi Laurent, Sakari,
>>
>> Thank you for your previous review feedback, we have addressed all
>> comments and listed the detailed changes in this cover letter below.
>> Would you mind taking a look at the v4 series if you have time. Any
>> feedback would be greatly appreciated.
> 
> I'm really overloaded at the moment, so I can't guarantee any review
> time frame. Sorry about that.
> 
>> On 9/11/2025 6:08 PM, Bin Du wrote:
>>> Hello,
>>>
>>> AMD ISP4 is the AMD image processing gen 4 which can be found in HP ZBook Ultra G1a 14 inch Mobile Workstation PC (Ryzen AI Max 300 Series)
>>> (https://ubuntu.com/certified/202411-36043)
>>> This patch series introduces the initial driver support for the AMD ISP4.
>>>
>>> Patch summary:
>>> - Powers up/off and initializes ISP HW
>>> - Configures and kicks off ISP FW
>>> - Interacts with APP using standard V4l2 interface by video node
>>> - Controls ISP HW and interacts with ISP FW to do image processing
>>> - Supports enum/set output image format and resolution
>>> - Supports queueing buffer from app and dequeuing ISP filled buffer to App
>>> - It is verified on qv4l2, cheese and qcam
>>> - It is verified together with following patches
>>> 	platform/x86: Add AMD ISP platform config (https://lore.kernel.org/all/20250514215623.522746-1-pratap.nirujogi@amd.com/)
>>> 	pinctrl: amd: isp411: Add amdisp GPIO pinctrl (https://github.com/torvalds/linux/commit/e97435ab09f3ad7b6a588dd7c4e45a96699bbb4a)
>>> 	drm/amd/amdgpu: Add GPIO resources required for amdisp (https://gitlab.freedesktop.org/agd5f/linux/-/commit/ad0f5966ed8297aa47b3184192b00b7379ae0758)
>>> 	drm/amd/amdgpu: Declare isp firmware binary file (https://gitlab.freedesktop.org/agd5f/linux/-/commit/35345917bc9f7c86152b270d9d93c220230b667f)
>>>
>>> AMD ISP4 Key features:
>>> - Processes bayer raw data from the connected sensor and output them to different YUV formats
>>> - Downscale input image to different output image resolution
>>> - Pipeline to do image processing on the input image including demosaic, denoise, 3A, etc.
>>>
>>> ----------
>>>
>>> Changes v3 -> v4:
>>>
>>> - Replace one mutex with guard mutex.
>>> - Remove unnecessary bus_info initialization of v4l2_capability.
>>> - Drop V4L2_CAP_IO_MC from capabilities of v4l2_capability.
>>> - Modify document with better SOC description.
>>> - Fix Test x86 failure in Media CI test https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/83470456/artifacts/report.htm
>>> - Modify some commit messages by describing changes in imperative mood.
>>> - Add media-ctl output in cover letter.
>>> - Create separated dedicated amdgpu patch to add declaration MODULE_FIRMWARE("amdgpu/isp_4_1_1.bin");
>>> - Fix typo errors and other cosmetic issues.
>>> - Add DRM_AMD_ISP dependency in Kconfig.
>>>
>>>
>>> Changes v2 -> v3:
>>>
>>> - All the dependent patches in other modules (drm/amd/amdgpu, platform/x86, pinctrl/amd) merged on upstream mainline kernel (https://github.com/torvalds/linux) v6.17.
>>> - Removed usage of amdgpu structs in ISP driver. Added helper functions in amdgpu accepting opaque params from ISP driver to allocate and release ISP GART buffers.
>>> - Moved sensor and MIPI phy control entirely into ISP FW instead of the previous hybrid approach controlling sensor from both FW and x86 (sensor driver).
>>> - Removed phy configuration and sensor binding as x86 (sensor driver) had relinquished the sensor control for ISP FW. With this approach the driver will be exposed as web camera like interface.
>>> - New FW with built-in sensor driver is submitted on upstream linux-firmware repo (https://gitlab.com/kernel-firmware/linux-firmware/).
>>> - Please note the new FW submitted is not directly compatible with OEM Kernel ISP4.0 (https://github.com/amd/Linux_ISP_Kernel/tree/4.0) and the previous ISP V2 patch series.
>>> - If intend to use the new FW, please rebuild OEM ISP4.0 Kernel with CONFIG_VIDEO_OV05C10=N and CONFIG_PINCTRL_AMDISP=Y.
>>> - Included critical fixes from Sultan Alsawaf branch (https://github.com/kerneltoast/kernel_x86_laptop.git) related to managing lifetime of isp buffers.
>>>         media: amd: isp4: Add missing refcount tracking to mmap memop
>>>         media: amd: isp4: Don't put or unmap the dmabuf when detaching
>>>         media: amd: isp4: Don't increment refcount when dmabuf export fails
>>>         media: amd: isp4: Fix possible use-after-free in isp4vid_vb2_put()
>>>         media: amd: isp4: Always export a new dmabuf from get_dmabuf memop
>>>         media: amd: isp4: Fix implicit dmabuf lifetime tracking
>>>         media: amd: isp4: Fix possible use-after-free when putting implicit dmabuf
>>>         media: amd: isp4: Simplify isp4vid_get_dmabuf() arguments
>>>         media: amd: isp4: Move up buf->vaddr check in isp4vid_get_dmabuf()
>>>         media: amd: isp4: Remove unused userptr memops
>>>         media: amd: isp4: Add missing cleanup on error in isp4vid_vb2_alloc()
>>>         media: amd: isp4: Release queued buffers on error in start_streaming
>>> - Addressed all code related upstream comments
>>> - Fix typo errors and other cosmetic issues.
>>>
>>>
>>> Changes v1 -> v2:
>>>
>>> - Fix media CI test errors and valid warnings
>>> - Reduce patch number in the series from 9 to 8 by merging MAINTAINERS adding patch to the first patch
>>> - In patch 5
>>> 	- do modification to use remote endpoint instead of local endpoint
>>> 	- use link frequency and port number as start phy parameter instead of extra added phy-id and phy-bit-rate property of endpoint
>>>
>>> ----------
>>>
>>> It passes v4l2 compliance test, the test reports for:
>>>
>>> (a) amd_isp_capture device /dev/video0
>>>
>>> Compliance test for amd_isp_capture device /dev/video0:
>>> -------------------------------------------------------
>>>
>>> atg@atg-HP-PV:~/bin$ ./v4l2-compliance -d /dev/video0
>>> v4l2-compliance 1.29.0-5348, 64 bits, 64-bit time_t
>>> v4l2-compliance SHA: 75e3f0e2c2cb 2025-03-17 18:12:17
>>>
>>> Compliance test for amd_isp_capture device /dev/video0:
>>>
>>> Driver Info:
>>>           Driver name      : amd_isp_capture
>>>           Card type        : amd_isp_capture
>>>           Bus info         : platform:amd_isp_capture
>>>           Driver version   : 6.14.0
>>>           Capabilities     : 0xa4200001
>>>                   Video Capture
>>>                   I/O MC
>>>                   Streaming
>>>                   Extended Pix Format
>>>                   Device Capabilities
>>>           Device Caps      : 0x24200001
>>>                   Video Capture
>>>                   I/O MC
>>>                   Streaming
>>>                   Extended Pix Format
>>> Media Driver Info:
>>>           Driver name      : amd_isp_capture
>>>           Model            : amd_isp41_mdev
>>>           Serial           :
>>>           Bus info         : platform:amd_isp_capture
>>>           Media version    : 6.14.0
>>>           Hardware revision: 0x00000000 (0)
>>>           Driver version   : 6.14.0
>>> Interface Info:
>>>           ID               : 0x03000005
>>>           Type             : V4L Video
>>> Entity Info:
>>>           ID               : 0x00000003 (3)
>>>           Name             : Preview
>>>           Function         : V4L2 I/O
>>>           Pad 0x01000004   : 0: Sink
>>>             Link 0x02000007: from remote pad 0x1000002 of entity 'amd isp4' (Image Signal Processor): Data, Enabled, Immutable
>>>
>>> Required ioctls:
>>>           test MC information (see 'Media Driver Info' above): OK
>>>           test VIDIOC_QUERYCAP: OK
>>>           test invalid ioctls: OK
>>>
>>> Allow for multiple opens:
>>>           test second /dev/video0 open: OK
>>>           test VIDIOC_QUERYCAP: OK
>>>           test VIDIOC_G/S_PRIORITY: OK
>>>           test for unlimited opens: OK
>>>
>>> Debug ioctls:
>>>           test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>           test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>
>>> Input ioctls:
>>>           test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>           test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>           test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>           test VIDIOC_G/S/ENUMINPUT: OK
>>>           test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>           Inputs: 1 Audio Inputs: 0 Tuners: 0
>>>
>>> Output ioctls:
>>>           test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>           test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>           test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>           test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>           Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>
>>> Input/Output configuration ioctls:
>>>           test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>           test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>           test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>           test VIDIOC_G/S_EDID: OK (Not Supported)
>>>
>>> Control ioctls (Input 0):
>>>           test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>>           test VIDIOC_QUERYCTRL: OK (Not Supported)
>>>           test VIDIOC_G/S_CTRL: OK (Not Supported)
>>>           test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>>           test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>>           test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>           Standard Controls: 0 Private Controls: 0
>>>
>>> Format ioctls (Input 0):
>>>           test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>           test VIDIOC_G/S_PARM: OK
>>>           test VIDIOC_G_FBUF: OK (Not Supported)
>>>           test VIDIOC_G_FMT: OK
>>>           test VIDIOC_TRY_FMT: OK
>>>           test VIDIOC_S_FMT: OK
>>>           test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>           test Cropping: OK (Not Supported)
>>>           test Composing: OK (Not Supported)
>>>           test Scaling: OK (Not Supported)
>>>
>>> Codec ioctls (Input 0):
>>>           test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>           test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>           test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>
>>> Buffer ioctls (Input 0):
>>>           test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>           test CREATE_BUFS maximum buffers: OK
>>>           test VIDIOC_REMOVE_BUFS: OK
>>>           test VIDIOC_EXPBUF: OK
>>>           test Requests: OK (Not Supported)
>>>           test blocking wait: OK
>>>
>>> Total for amd_isp_capture device /dev/video0: 49, Succeeded: 49, Failed: 0, Warnings: 0
>>>
>>> The media-ctl output of media device /dev/media0:
>>> -------------------------------------------------------
>>>
>>> atg@atg-HP-PV:~$ media-ctl -p -d /dev/media0
>>> Media controller API version 6.17.0
>>>
>>> Media device information
>>> ------------------------
>>> driver          amd_isp_capture
>>> model           amd_isp41_mdev
>>> serial
>>> bus info        platform:amd_isp_capture
>>> hw revision     0x0
>>> driver version  6.17.0
>>>
>>> Device topology
>>> - entity 1: amd isp4 (1 pad, 1 link, 0 routes)
>>>               type V4L2 subdev subtype Unknown flags 0
>>>           pad0: Source
>>>                   -> "Preview":0 [ENABLED,IMMUTABLE]
>>>
>>> - entity 3: Preview (1 pad, 1 link)
>>>               type Node subtype V4L flags 0
>>>               device node name /dev/video0
>>>           pad0: Sink
>>>                   <- "amd isp4":0 [ENABLED,IMMUTABLE]
>>>
>>> Please review and provide feedback.
>>>
>>> Many thanks,
>>>
>>> Bin Du (7):
>>>     media: platform: amd: Introduce amd isp4 capture driver
>>>     media: platform: amd: low level support for isp4 firmware
>>>     media: platform: amd: Add isp4 fw and hw interface
>>>     media: platform: amd: isp4 subdev and firmware loading handling added
>>>     media: platform: amd: isp4 video node and buffers handling added
>>>     media: platform: amd: isp4 debug fs logging and  more descriptive
>>>       errors
>>>     Documentation: add documentation of AMD isp 4 driver
>>>
>>>    Documentation/admin-guide/media/amdisp4-1.rst |   63 +
>>>    Documentation/admin-guide/media/amdisp4.dot   |    6 +
>>>    .../admin-guide/media/v4l-drivers.rst         |    1 +
>>>    MAINTAINERS                                   |   25 +
>>>    drivers/media/platform/Kconfig                |    1 +
>>>    drivers/media/platform/Makefile               |    1 +
>>>    drivers/media/platform/amd/Kconfig            |    3 +
>>>    drivers/media/platform/amd/Makefile           |    3 +
>>>    drivers/media/platform/amd/isp4/Kconfig       |   13 +
>>>    drivers/media/platform/amd/isp4/Makefile      |   10 +
>>>    drivers/media/platform/amd/isp4/isp4.c        |  237 ++++
>>>    drivers/media/platform/amd/isp4/isp4.h        |   26 +
>>>    drivers/media/platform/amd/isp4/isp4_debug.c  |  272 ++++
>>>    drivers/media/platform/amd/isp4/isp4_debug.h  |   41 +
>>>    .../platform/amd/isp4/isp4_fw_cmd_resp.h      |  314 +++++
>>>    drivers/media/platform/amd/isp4/isp4_hw_reg.h |  125 ++
>>>    .../media/platform/amd/isp4/isp4_interface.c  |  966 +++++++++++++
>>>    .../media/platform/amd/isp4/isp4_interface.h  |  149 ++
>>>    drivers/media/platform/amd/isp4/isp4_subdev.c | 1197 ++++++++++++++++
>>>    drivers/media/platform/amd/isp4/isp4_subdev.h |  133 ++
>>>    drivers/media/platform/amd/isp4/isp4_video.c  | 1207 +++++++++++++++++
>>>    drivers/media/platform/amd/isp4/isp4_video.h  |   87 ++
>>>    22 files changed, 4880 insertions(+)
>>>    create mode 100644 Documentation/admin-guide/media/amdisp4-1.rst
>>>    create mode 100644 Documentation/admin-guide/media/amdisp4.dot
>>>    create mode 100644 drivers/media/platform/amd/Kconfig
>>>    create mode 100644 drivers/media/platform/amd/Makefile
>>>    create mode 100644 drivers/media/platform/amd/isp4/Kconfig
>>>    create mode 100644 drivers/media/platform/amd/isp4/Makefile
>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4.c
>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4.h
>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.c
>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.h
>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_hw_reg.h
>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.c
>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.h
>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.c
>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.h
>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_video.c
>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_video.h
> 

-- 
Regards,
Bin


