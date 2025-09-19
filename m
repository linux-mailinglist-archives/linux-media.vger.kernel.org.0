Return-Path: <linux-media+bounces-42738-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 634A3B87CAB
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 05:24:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14A77581353
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 03:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 619E9244671;
	Fri, 19 Sep 2025 03:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="d3vOGjzz"
X-Original-To: linux-media@vger.kernel.org
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011058.outbound.protection.outlook.com [52.101.57.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69F834BA2B;
	Fri, 19 Sep 2025 03:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758252288; cv=fail; b=nGf7BVxIDmkQYiYTUhFQyeZvqqHsL0+V1nz5vD/RQRtom/Ma6ASI2B/kUqcOIbCx4HhuQ6N4gLoAtyfMESECZsVP4mW09GQa497uZjSBt1PoS/WOiM5oEYlNSGhIlvO3dUXqwK7SLlfzkPZe/AcPlxsGoNxUYsSZpiySDFfTM9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758252288; c=relaxed/simple;
	bh=C0yGRTbKBMx3/V+U9lbshxPD1Hkgp3swprMFDpZxW3w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GxST50UNIqXvupwJxMk5VhxTD0RY0XQ6myTHrpz9T3p8uqBge8O9ae6nzlyztSErJT8nGGDB3fsRNEw1mSVzojl5EDkYefyavH1O/SQun9U8OfDXY8Jor0SGw1lTgo8JpFAh8L+8ztKnw8u9M8vhXz5rMuNnVerCben02H4B8vk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=d3vOGjzz; arc=fail smtp.client-ip=52.101.57.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IGnVsbWCr5/emRTl6+V45FISVvNIMqEhYdhiQmRAswtbePzqPzVdZcwhmTl9z6Y/38ZsFp67jRX6h8nUCUliNKXiS1zFoSfY0LRofgdeQn41EUyzHZdhvmTDqs2EBq7jo4kF/6Ivt8QWy8E/S7bnM4X4UjIAIz9tQdK7oO+E3kcOjPleNKPCc+s6nQNOSosXNUsgdDRIPgSlOKZhnNoHylG/dRDstNROU4ibjwSqRb+ULyU2mj6CzDp0MqlMipryccFbzmxjI47kEz+JD02axQZMvT5qZPidndo8KJwX90tlr4ApKKYd7HPwq7vRvSBWmJPvFWB678MNoXnL4dIEmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jMXZUsl1FxvUfiCop+VXWrrymzclfBsduSAH04pTrCw=;
 b=qlmkmRuZOFqODIrjcbsNDgplTu7npDm1J6GWDXcCDNMswccMd83vbh8IeXODf8tTmmqW8571nRewlcwQDqZNzBHF3bNzsHVn6Sf0uLMqo4GGQ3eGUdbkvTcoPS4DvtlThYosisGCKVBUK7q5FbWTpnm5+cPNKYEWrD6BI/L1GJq/kZ9IWiNrxM/WooBnVIpMYFzcaop9wuDNsCCsfpVC1E6KSdB/oFfkhRRBuFvd6wcVZxBMVSRRul0KMMQhr8LVWmvhK2v10oYVp9U8Eew0vbxbp6Unsd+Z7JmGrx3eXCWQ9bJ7rhbU7p7kVb3ohKtpNazFjImRBY2AThVw6ilcXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jMXZUsl1FxvUfiCop+VXWrrymzclfBsduSAH04pTrCw=;
 b=d3vOGjzzrbfyLy55eOy9MW6HnSXdNmpqA33vxigCEyCZAJ8EdXMHJkaSk8MFHxbwHEciTAYttUKWSoSx6ZB0rUpPd72x0unpK7EW9yGaqh5jy9E8WEMQY4oqyuWHsvut3+MMveLhTKPzHfKVLAfQuUuUjLwnWyp9sosUcjv05FQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by DS7PR12MB6005.namprd12.prod.outlook.com (2603:10b6:8:7c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Fri, 19 Sep
 2025 03:24:42 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%4]) with mapi id 15.20.9115.020; Fri, 19 Sep 2025
 03:24:42 +0000
Message-ID: <2325fe6e-f17e-44f2-9c3c-495466b40e4b@amd.com>
Date: Fri, 19 Sep 2025 11:24:36 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] Add AMD ISP4 driver
To: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 sultan@kerneltoast.com
Cc: pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com
References: <20250911100847.277408-1-Bin.Du@amd.com>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <20250911100847.277408-1-Bin.Du@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY4P286CA0054.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::11) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|DS7PR12MB6005:EE_
X-MS-Office365-Filtering-Correlation-Id: 957ff1c1-4e0c-4e4d-000d-08ddf72c12c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?czAyZlFtNFlmbGVOODAzRW55RmtOV3JtWS9UYjdmc1YyYVdXNzBOM2FJUVRj?=
 =?utf-8?B?bDFQeURtLzR1WU53dVdKbnd6ZmFhRFdYZGw5dkZzeitxYitmMkpoTGdFRnlK?=
 =?utf-8?B?S0RyR1YwZXRVZExjeXptdTJTQ0dJSWJWaHIxMXdDR0ExNUswVTZpY3JLbTJH?=
 =?utf-8?B?Z3N5NDZaRU5RdFl4RURMK1JCbkpjV1p5K0ZoNXQ1anU5b0xjYzJTbVFrbnYr?=
 =?utf-8?B?ak5mbW1jckZRY01qRm9kaHJEOHZtYXM0QW5VNUVSNzVvTWtYSTBQeTBEVG03?=
 =?utf-8?B?bG5zckJDNWZ3Qk9BTW42cHRPcDg0emNDMkwrOXEyUEtqZzltWDhrS3pxQ1BR?=
 =?utf-8?B?WnBXWDF2SDJnOE5DS2FGdFZ2Zkt0QkpsTEd2UHBTS3RVbE1HWnQ2R3lXaWhE?=
 =?utf-8?B?VlFQY3BwVzRzdlJkZUUxUEZEbkhWS2Nwa2lsVlRpR2MxT3pBd0tWQ3BYMHFG?=
 =?utf-8?B?WTV0NGJnNnhPcFBtM1NFKzc4TkZsL1pVeWJqRWhVT0xHOHRHWE92MGNPTStp?=
 =?utf-8?B?S1NWTmJxNDFXaW45Tm9RSkdNNmlieVE0RHZ1aGxKTFJOODBCRmJiNlpRNDNK?=
 =?utf-8?B?bG0wMDU3RmJlbG8wbmErcFFzaDYxQVhjaHJ3Sjdod0EwRk1GS1ZkbStDZmVL?=
 =?utf-8?B?M2dHUlV6WnFvNDdPNFBWL3Jyb2YwTmdaTFExbmpvcmVBYUZSa0E1cGViQ0hB?=
 =?utf-8?B?SFB0SC8wK0ZDQmNzSXdVRjhROEJrOUJ4OGhlM3FmUGdrMHV4VjNSWEpLUDRN?=
 =?utf-8?B?Q0p1c2FMZkY1elNyYXRYN0hXdzVCY0huS3VaSUlrTzRnQ3l3U0RiL3g0TjNk?=
 =?utf-8?B?d293dEJWaWhLQnhCZjcra2tBNTBTZUJhWnpDVXdMZHQyc2gwT0tCUnVacVAx?=
 =?utf-8?B?YzZvaFBMRE1RZjh5dUt6MXpkak1WSVpLcjFHSllPL0NaUVE3NXNZTElhZk5W?=
 =?utf-8?B?dnM1YUU1ay9WeDVVWml1bjBXZGRMWjVETk15anMwaXpUUERQWUh3bEwrMGIw?=
 =?utf-8?B?dFBUbXR2enFxeHpEcTBSaWxjQzk0Y2NDaVhaa2c5TzVtZFlzWHZvcWtobjBp?=
 =?utf-8?B?NDIzU2w5dWt1dzZmNzdwUmkyUDBkeFJia1dBNE1vUTBJdTE1UjlGVWJtUmdH?=
 =?utf-8?B?RG0rdlptKzVEK2Y2MFdYUlY0aTg3YWtrUjdyMDFGRTFHZkFKTnNwYUdueURq?=
 =?utf-8?B?Nkl2SXAwU1Vsc3VsVSs3RWs5MjRLZzZsYVhPVjdhS281NTRXQUt0YWc1VnhG?=
 =?utf-8?B?RjdpYTE4cTdTcklCMzR2MFpxUGc3dHlCdkpiNjRUN3VqdDJIcEpKd3dobi9U?=
 =?utf-8?B?aXg4VFV0WTlTRU9Vd1p1SGZkUUJ4bzh3QWZpWC93WkRWOWIybzc3OXhJUlZJ?=
 =?utf-8?B?Mzk0K0UwL0tjTWpGUzlFZEM5dFVKOU4rZjNUeDhSQnRqendpT2VrNy9qQjIv?=
 =?utf-8?B?eU9NeHBGNlVQRlJrb2ZJTHdkd2o3RUJOSDZibU90bjJFbzlHRXc2UllRMzJi?=
 =?utf-8?B?VTJaUGNOVEQ5MXg5WDZhNUlpZVpyZkt2WWxhdnRHZjlhNkNoRnk4NnYxL05C?=
 =?utf-8?B?ekZDcFVMK2w3d2lnOEV4bzZRR2xwb1pQd1VuK1NTeUxVK2xDdnFGTFV0Zm5E?=
 =?utf-8?B?YkptLzZMdllCMlVjRlppL1daaldnbGM5RWUvLzJLVDJQNE03Q05oS2IwOGtq?=
 =?utf-8?B?aFdoWmR2YmJnNUNNU0Vod1NtV2pBZXFsbU05YUdNNGZRK2tjNmlockxBdHZr?=
 =?utf-8?B?V051REQzUXdub0MxMTBjVnVGVDJoS2pDRGE4amhwR1JRQlJRQVdKMlFLNGFo?=
 =?utf-8?B?UmdHNHQzOHFVR2g5T1prbzBqdWlzaE9OTWJqVitvcjlkTlZlenpxUTB6RGEw?=
 =?utf-8?Q?+uta4x0AvUGo7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmNRZmN2NUJKM3NDUTdIeW5HZVloTmo3b1dyeGphU0V6NG9EVSt4a0xIUmlZ?=
 =?utf-8?B?a1hpeE5kcEZLQS92Q0NSSXhjY3BLdDhKeGoxcnI4U04rT2lVaWZLSVRDMW1C?=
 =?utf-8?B?eFMyaW9NMGlCdUFlZXVXbzRLMkJLTko3YmVFNmdnQkEwc1VxNVN1N083ZWo1?=
 =?utf-8?B?WTl0V2EvcGtudE5Eck5xcVgvRUFUWmpFWHpYSVNUdXphbmY1dTFPcmRuN1pm?=
 =?utf-8?B?cmtpUnowYnJZemo2TWdvK2Z1SUdXUUJHUUg4SkhWeHRPRTdsQkFKak44c3pv?=
 =?utf-8?B?czBjbGVWOXJxZXB5MHhSK2JjT1ErOFNxS2F6R1FrTGtUa3ZrZjFKTTJFUjlz?=
 =?utf-8?B?ckJubEdtZVkvOXFtTEtNYzlDM3FaSjRjdUpIVE83UWx0MFdIWEJuUm42bnBH?=
 =?utf-8?B?cFNkRTdxTzQ2WlJUandmRVFLMjNWdjNZTy96cTF1by9EZnNoaWs5WnE3M3lX?=
 =?utf-8?B?RkhSSkFXeitkbmdOU1RkYmI1VXZYOTFIcnozNEdtc1Bnb2c1aGZnZGdCMkZ6?=
 =?utf-8?B?RVd6VEFXTDBzQkt2SklWSVRvNlArbDhCa2E4ZHNhMTVyUXcrMnF6OGFMT1Rv?=
 =?utf-8?B?OU80QndLOWZXS2NQQi9DTUoxcUFVeEF4LzFFN2xDRDZSQjBVRzZjWkpPY1Az?=
 =?utf-8?B?bkt1aFJVMTlCQ0hrRExWYWR5Q0ptUWZ2UEhYUGtNTjNaWktjbG55bWxGYkh0?=
 =?utf-8?B?eVNmVnVEL3M0WmRpQWFNeExEa3hmLzlud3hoTEl3aUwray9DWjhWR0lvTVN4?=
 =?utf-8?B?TlA3SEhWVWVWL3EwZ1lvUGxZaWhhWkltUWtQSExqQ2FvUTIyVnR3R0xhL29y?=
 =?utf-8?B?WkxkRWVVMjNlcnZrSnlYQllNaUl2NHppdVlQa1ZORkFELzFiNExwK2lBQkZW?=
 =?utf-8?B?cUNaYlpYRXNLNVkxc2ZaMEoveE5UeE5YTTdmaW9JOVoyYTBQR3Z1TFZhZ0hP?=
 =?utf-8?B?RERXVWNOdjZNdVlaQzBmSXZXL0NoUjYrM214NitYNWxwNlkybUtuTUNZTEgw?=
 =?utf-8?B?T3lZUGpsZlJrM214MmNYSlJDWmM3RUZ0c0QyRmxKQ0RXYis2aWh5YjdvK3JE?=
 =?utf-8?B?V3QzRWR1U29CckIyQWJTK25acUtIREJCUllxREhFT3pMUkxkTW1ySnFLRFlt?=
 =?utf-8?B?U0FoeVZhSnlTLzRuWXVIVkdycVlEY1JBL1Z5QjF5cnJMaDFtZyt2blppZW9V?=
 =?utf-8?B?TVd1OUppSjdVRnJCZDcyN1podkpxTEdNMWZaKzJCSlVkN1ptWlRFbS9yVWd4?=
 =?utf-8?B?YjJoOG5xM0IzcEJyaGc2aUl2N0xTOHVjSDRIWGN0K0FyZGNaZHZiMjI0SmlW?=
 =?utf-8?B?R3p1NUN3bDJRRjJOaUwrUzdmcFZFQlQzUVJ6eGdybDRDVDBZNzhjVHdZb3Rr?=
 =?utf-8?B?OFNqbENTNlZxRDkxWnk3SHZjYU9qSWxWVnJlT2x3UU9wc3dXWkJZQm1qazd3?=
 =?utf-8?B?OUhJTVNUaGRaRWJsdmcwQnpnd2Z1QW50bGhBMndZZ2NtU0IwcWtNZG1oaS93?=
 =?utf-8?B?YUFBMjJ6ck11UWlHSHNQZUFKak9aRlI3RGZJOFg1dk5seS9PS3JVYWpiT2Vl?=
 =?utf-8?B?SWN2YURDQ3dnbERSRElEeHJTZTk1dC9UNEh1VVpoRm1UQVJYRmp4S2tVNVlZ?=
 =?utf-8?B?b01mZFdmWnJreS9RWTlmbGNjWm9FdzY4UWl1WHkxMkNpQWEwOS9KbmZXNTZh?=
 =?utf-8?B?ck9lM2FHKy9QMlMzWWhUUkRubTM1SEFvSUlqdGVSaWNNL3NpK1IxNGtzRWVw?=
 =?utf-8?B?dmRPeThvNGIyblV1bEdvdGI0S3BSRTMwRnNDbXBLSG5mSTVyUE5XQXBuaHdK?=
 =?utf-8?B?TS90d2szU3ltUUNvcDlCQXkxTDdGZi9BN0g1bUUxY3dYQ1hTb2k0MnBsNUhJ?=
 =?utf-8?B?bGtqZTQwUHoxbmVVNHM2VUxJUGtCRm54eFc4SVE4SzNEczFmRzZWbS9jQ08w?=
 =?utf-8?B?UVVseDJWMStveSt3bEZXN2lFMXVicEJtNzE1L1VwclEvK1NreGNKYXJwaWRO?=
 =?utf-8?B?QUFoUHJtV1daSDFIRnk2b3ZzeG1yVzJuSlZzWGdXQnRkakYxNU9aY2w0K0ZS?=
 =?utf-8?B?RFl0WUVGaDFKNVVRRXBqRitzZUlvd1FrR0w4b3JMMTZiY3o0MThiSHlkZ1Y4?=
 =?utf-8?Q?4gts=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 957ff1c1-4e0c-4e4d-000d-08ddf72c12c2
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 03:24:42.4558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /iQmBlSebgRvnTcJCJ0boV6lhj1KYP+omKBrfFSnejwYbGD27pS3k16bn3rdlm4s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6005

Hi Laurent, Sakari,

Thank you for your previous review feedback, we have addressed all 
comments and listed the detailed changes in this cover letter below. 
Would you mind taking a look at the v4 series if you have time. Any 
feedback would be greatly appreciated.

Regards,
Bin

On 9/11/2025 6:08 PM, Bin Du wrote:
> Hello,
> 
> AMD ISP4 is the AMD image processing gen 4 which can be found in HP ZBook Ultra G1a 14 inch Mobile Workstation PC (Ryzen AI Max 300 Series)
> (https://ubuntu.com/certified/202411-36043)
> This patch series introduces the initial driver support for the AMD ISP4.
> 
> Patch summary:
> - Powers up/off and initializes ISP HW
> - Configures and kicks off ISP FW
> - Interacts with APP using standard V4l2 interface by video node
> - Controls ISP HW and interacts with ISP FW to do image processing
> - Supports enum/set output image format and resolution
> - Supports queueing buffer from app and dequeuing ISP filled buffer to App
> - It is verified on qv4l2, cheese and qcam
> - It is verified together with following patches
> 	platform/x86: Add AMD ISP platform config (https://lore.kernel.org/all/20250514215623.522746-1-pratap.nirujogi@amd.com/)
> 	pinctrl: amd: isp411: Add amdisp GPIO pinctrl (https://github.com/torvalds/linux/commit/e97435ab09f3ad7b6a588dd7c4e45a96699bbb4a)
> 	drm/amd/amdgpu: Add GPIO resources required for amdisp (https://gitlab.freedesktop.org/agd5f/linux/-/commit/ad0f5966ed8297aa47b3184192b00b7379ae0758)
> 	drm/amd/amdgpu: Declare isp firmware binary file (https://gitlab.freedesktop.org/agd5f/linux/-/commit/35345917bc9f7c86152b270d9d93c220230b667f)
> 
> AMD ISP4 Key features:
> - Processes bayer raw data from the connected sensor and output them to different YUV formats
> - Downscale input image to different output image resolution
> - Pipeline to do image processing on the input image including demosaic, denoise, 3A, etc.
> 
> ----------
> 
> Changes v3 -> v4:
> 
> - Replace one mutex with guard mutex.
> - Remove unnecessary bus_info initialization of v4l2_capability.
> - Drop V4L2_CAP_IO_MC from capabilities of v4l2_capability.
> - Modify document with better SOC description.
> - Fix Test x86 failure in Media CI test https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/83470456/artifacts/report.htm
> - Modify some commit messages by describing changes in imperative mood.
> - Add media-ctl output in cover letter.
> - Create separated dedicated amdgpu patch to add declaration MODULE_FIRMWARE("amdgpu/isp_4_1_1.bin");
> - Fix typo errors and other cosmetic issues.
> - Add DRM_AMD_ISP dependency in Kconfig.
> 
> 
> Changes v2 -> v3:
> 
> - All the dependent patches in other modules (drm/amd/amdgpu, platform/x86, pinctrl/amd) merged on upstream mainline kernel (https://github.com/torvalds/linux) v6.17.
> - Removed usage of amdgpu structs in ISP driver. Added helper functions in amdgpu accepting opaque params from ISP driver to allocate and release ISP GART buffers.
> - Moved sensor and MIPI phy control entirely into ISP FW instead of the previous hybrid approach controlling sensor from both FW and x86 (sensor driver).
> - Removed phy configuration and sensor binding as x86 (sensor driver) had relinquished the sensor control for ISP FW. With this approach the driver will be exposed as web camera like interface.
> - New FW with built-in sensor driver is submitted on upstream linux-firmware repo (https://gitlab.com/kernel-firmware/linux-firmware/).
> - Please note the new FW submitted is not directly compatible with OEM Kernel ISP4.0 (https://github.com/amd/Linux_ISP_Kernel/tree/4.0) and the previous ISP V2 patch series.
> - If intend to use the new FW, please rebuild OEM ISP4.0 Kernel with CONFIG_VIDEO_OV05C10=N and CONFIG_PINCTRL_AMDISP=Y.
> - Included critical fixes from Sultan Alsawaf branch (https://github.com/kerneltoast/kernel_x86_laptop.git) related to managing lifetime of isp buffers.
>        media: amd: isp4: Add missing refcount tracking to mmap memop
>        media: amd: isp4: Don't put or unmap the dmabuf when detaching
>        media: amd: isp4: Don't increment refcount when dmabuf export fails
>        media: amd: isp4: Fix possible use-after-free in isp4vid_vb2_put()
>        media: amd: isp4: Always export a new dmabuf from get_dmabuf memop
>        media: amd: isp4: Fix implicit dmabuf lifetime tracking
>        media: amd: isp4: Fix possible use-after-free when putting implicit dmabuf
>        media: amd: isp4: Simplify isp4vid_get_dmabuf() arguments
>        media: amd: isp4: Move up buf->vaddr check in isp4vid_get_dmabuf()
>        media: amd: isp4: Remove unused userptr memops
>        media: amd: isp4: Add missing cleanup on error in isp4vid_vb2_alloc()
>        media: amd: isp4: Release queued buffers on error in start_streaming
> - Addressed all code related upstream comments
> - Fix typo errors and other cosmetic issues.
> 
> 
> Changes v1 -> v2:
> 
> - Fix media CI test errors and valid warnings
> - Reduce patch number in the series from 9 to 8 by merging MAINTAINERS adding patch to the first patch
> - In patch 5
> 	- do modification to use remote endpoint instead of local endpoint
> 	- use link frequency and port number as start phy parameter instead of extra added phy-id and phy-bit-rate property of endpoint
> 
> ----------
> 
> It passes v4l2 compliance test, the test reports for:
> 
> (a) amd_isp_capture device /dev/video0
> 
> Compliance test for amd_isp_capture device /dev/video0:
> -------------------------------------------------------
> 
> atg@atg-HP-PV:~/bin$ ./v4l2-compliance -d /dev/video0
> v4l2-compliance 1.29.0-5348, 64 bits, 64-bit time_t
> v4l2-compliance SHA: 75e3f0e2c2cb 2025-03-17 18:12:17
> 
> Compliance test for amd_isp_capture device /dev/video0:
> 
> Driver Info:
>          Driver name      : amd_isp_capture
>          Card type        : amd_isp_capture
>          Bus info         : platform:amd_isp_capture
>          Driver version   : 6.14.0
>          Capabilities     : 0xa4200001
>                  Video Capture
>                  I/O MC
>                  Streaming
>                  Extended Pix Format
>                  Device Capabilities
>          Device Caps      : 0x24200001
>                  Video Capture
>                  I/O MC
>                  Streaming
>                  Extended Pix Format
> Media Driver Info:
>          Driver name      : amd_isp_capture
>          Model            : amd_isp41_mdev
>          Serial           :
>          Bus info         : platform:amd_isp_capture
>          Media version    : 6.14.0
>          Hardware revision: 0x00000000 (0)
>          Driver version   : 6.14.0
> Interface Info:
>          ID               : 0x03000005
>          Type             : V4L Video
> Entity Info:
>          ID               : 0x00000003 (3)
>          Name             : Preview
>          Function         : V4L2 I/O
>          Pad 0x01000004   : 0: Sink
>            Link 0x02000007: from remote pad 0x1000002 of entity 'amd isp4' (Image Signal Processor): Data, Enabled, Immutable
> 
> Required ioctls:
>          test MC information (see 'Media Driver Info' above): OK
>          test VIDIOC_QUERYCAP: OK
>          test invalid ioctls: OK
> 
> Allow for multiple opens:
>          test second /dev/video0 open: OK
>          test VIDIOC_QUERYCAP: OK
>          test VIDIOC_G/S_PRIORITY: OK
>          test for unlimited opens: OK
> 
> Debug ioctls:
>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>          test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>          test VIDIOC_G/S/ENUMINPUT: OK
>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>          Inputs: 1 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>          Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>          test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls (Input 0):
>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>          Standard Controls: 0 Private Controls: 0
> 
> Format ioctls (Input 0):
>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>          test VIDIOC_G/S_PARM: OK
>          test VIDIOC_G_FBUF: OK (Not Supported)
>          test VIDIOC_G_FMT: OK
>          test VIDIOC_TRY_FMT: OK
>          test VIDIOC_S_FMT: OK
>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>          test Cropping: OK (Not Supported)
>          test Composing: OK (Not Supported)
>          test Scaling: OK (Not Supported)
> 
> Codec ioctls (Input 0):
>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls (Input 0):
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>          test CREATE_BUFS maximum buffers: OK
>          test VIDIOC_REMOVE_BUFS: OK
>          test VIDIOC_EXPBUF: OK
>          test Requests: OK (Not Supported)
>          test blocking wait: OK
> 
> Total for amd_isp_capture device /dev/video0: 49, Succeeded: 49, Failed: 0, Warnings: 0
> 
> The media-ctl output of media device /dev/media0:
> -------------------------------------------------------
> 
> atg@atg-HP-PV:~$ media-ctl -p -d /dev/media0
> Media controller API version 6.17.0
> 
> Media device information
> ------------------------
> driver          amd_isp_capture
> model           amd_isp41_mdev
> serial
> bus info        platform:amd_isp_capture
> hw revision     0x0
> driver version  6.17.0
> 
> Device topology
> - entity 1: amd isp4 (1 pad, 1 link, 0 routes)
>              type V4L2 subdev subtype Unknown flags 0
>          pad0: Source
>                  -> "Preview":0 [ENABLED,IMMUTABLE]
> 
> - entity 3: Preview (1 pad, 1 link)
>              type Node subtype V4L flags 0
>              device node name /dev/video0
>          pad0: Sink
>                  <- "amd isp4":0 [ENABLED,IMMUTABLE]
> 
> Please review and provide feedback.
> 
> Many thanks,
> 
> Bin Du (7):
>    media: platform: amd: Introduce amd isp4 capture driver
>    media: platform: amd: low level support for isp4 firmware
>    media: platform: amd: Add isp4 fw and hw interface
>    media: platform: amd: isp4 subdev and firmware loading handling added
>    media: platform: amd: isp4 video node and buffers handling added
>    media: platform: amd: isp4 debug fs logging and  more descriptive
>      errors
>    Documentation: add documentation of AMD isp 4 driver
> 
>   Documentation/admin-guide/media/amdisp4-1.rst |   63 +
>   Documentation/admin-guide/media/amdisp4.dot   |    6 +
>   .../admin-guide/media/v4l-drivers.rst         |    1 +
>   MAINTAINERS                                   |   25 +
>   drivers/media/platform/Kconfig                |    1 +
>   drivers/media/platform/Makefile               |    1 +
>   drivers/media/platform/amd/Kconfig            |    3 +
>   drivers/media/platform/amd/Makefile           |    3 +
>   drivers/media/platform/amd/isp4/Kconfig       |   13 +
>   drivers/media/platform/amd/isp4/Makefile      |   10 +
>   drivers/media/platform/amd/isp4/isp4.c        |  237 ++++
>   drivers/media/platform/amd/isp4/isp4.h        |   26 +
>   drivers/media/platform/amd/isp4/isp4_debug.c  |  272 ++++
>   drivers/media/platform/amd/isp4/isp4_debug.h  |   41 +
>   .../platform/amd/isp4/isp4_fw_cmd_resp.h      |  314 +++++
>   drivers/media/platform/amd/isp4/isp4_hw_reg.h |  125 ++
>   .../media/platform/amd/isp4/isp4_interface.c  |  966 +++++++++++++
>   .../media/platform/amd/isp4/isp4_interface.h  |  149 ++
>   drivers/media/platform/amd/isp4/isp4_subdev.c | 1197 ++++++++++++++++
>   drivers/media/platform/amd/isp4/isp4_subdev.h |  133 ++
>   drivers/media/platform/amd/isp4/isp4_video.c  | 1207 +++++++++++++++++
>   drivers/media/platform/amd/isp4/isp4_video.h  |   87 ++
>   22 files changed, 4880 insertions(+)
>   create mode 100644 Documentation/admin-guide/media/amdisp4-1.rst
>   create mode 100644 Documentation/admin-guide/media/amdisp4.dot
>   create mode 100644 drivers/media/platform/amd/Kconfig
>   create mode 100644 drivers/media/platform/amd/Makefile
>   create mode 100644 drivers/media/platform/amd/isp4/Kconfig
>   create mode 100644 drivers/media/platform/amd/isp4/Makefile
>   create mode 100644 drivers/media/platform/amd/isp4/isp4.c
>   create mode 100644 drivers/media/platform/amd/isp4/isp4.h
>   create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.c
>   create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.h
>   create mode 100644 drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>   create mode 100644 drivers/media/platform/amd/isp4/isp4_hw_reg.h
>   create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.c
>   create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.h
>   create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.c
>   create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.h
>   create mode 100644 drivers/media/platform/amd/isp4/isp4_video.c
>   create mode 100644 drivers/media/platform/amd/isp4/isp4_video.h
> 

-- 
Regards,
Bin


