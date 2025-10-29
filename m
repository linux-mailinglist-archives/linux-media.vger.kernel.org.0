Return-Path: <linux-media+bounces-45945-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 62177C1BE89
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 17:04:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 973F9666E28
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 15:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5417D2E8881;
	Wed, 29 Oct 2025 15:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="f8G+Bnj/"
X-Original-To: linux-media@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011061.outbound.protection.outlook.com [52.101.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C078A2E1C7A;
	Wed, 29 Oct 2025 15:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761750544; cv=fail; b=Jk745XHT3G8ZeM/A/gKo3079mx58oUfawKXywKgiSJw0JjQqPKSBHeZsX0RaWC3Y0fzhhffh1McDxSmvGZEPbN3n7eeRmYDIKwXpzCysd23JtrhS8ggAm6fRx1bYt1kBsaFMEUGbDlTMSGzY7a3759kmFZletNxQw2Ps3uh5pFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761750544; c=relaxed/simple;
	bh=TZKtFH+GKz2/KAOePQ8CJlDJT1lTM7mhaT8oS91WyAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=A8HiNIgtkosSwd4K7j+1gFKzVnyV6DoDz7ZkOtXm9iRA7ymtBI6ZihpfoRWKf/5HaH4DB7U0YUUUlyf54IUG6aPHfEmAfPMczKJE2Qi3hQ0gEKtvhN2wOzZL21CWtf6MF7mAXtOJ6HhrVqtJfl6wHRq5pEkv+l5l7ZpY1w5Z3PI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=f8G+Bnj/; arc=fail smtp.client-ip=52.101.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a5KzfjoVai5dZVbrrEmuk7Rzo1PSAelBz57nt+5JWX3wt+WBSZeHmNyIEssgjkLLBENxFSxs9vIK8do77vrA8rtLpB79RMSi0bTJA5JWoYEHlVBetzBdVehUyRVc9IRI71wuUMkHr6DSR1vWIn2lz1KUEDiuoDRjPt3Wu0C7awjugvcru25qGMtQnozpIDZg3PgJiKTfuAlUCVxcfVVHRbrXergwJjsedToiXajUeT43/BLQE6KxlQn7oodTkVFX6PtrRGDl4nKkz4le07/Z1UeZlDeONhTn72P6qHTSNB4znZc3KcDLhTXxuNr/2c4ZJPnhLgBRndlJ5HSEs/TgZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02Ft7G2kcdSoT2PFNxsHl466m/xqJ/yNmQW+10xJMEE=;
 b=Ci8rNiKo6BVsBBsp+NwPPPEyd77S56LbXjta20yMM1oFzgQfCJUeXVWf9/gFeYDI05BAQAI238HjEFC5UgEcd5qUFqibV3u/P0RCzoynVnkqfAHTI4AaUKsZJfxZ8mAKuDOvllR9bRUur4LWguke4Y1+mBHwAxfPtyyRxelOT/grg12oh901OYL4FJxSHaPBU1QnIN9Fp5z7aVxqfbPqMNhIhZJOva3153XZiXf8F1AxPTyP0NKnvCrAmY7IOfpq4UvAVw1wmZLcbcQRNy9krhMKllZWt77aLpKwx69UVmJ7jkRf2yC9y0dZ81Br+L0uCbeEZUVa0Gm3vO7Z9rpp9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02Ft7G2kcdSoT2PFNxsHl466m/xqJ/yNmQW+10xJMEE=;
 b=f8G+Bnj/oycyfUBUIzG8a9kLNaIrjYqzFHh/wOGQv6LdxO/0yot06frZipGd77eK0p2aGBZXUl2lK8bLmuhMFJvIHvVOj2+vFpsWHuFAZboDU+8zePOuPJb+TPcXx8OxvkPiUoqmrlgI8CmmwE0ab85qUw38YhZFYzoimSZFD9A=
Received: from MW4PR04CA0244.namprd04.prod.outlook.com (2603:10b6:303:88::9)
 by CO6PR10MB5570.namprd10.prod.outlook.com (2603:10b6:303:145::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 15:09:00 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:303:88:cafe::ce) by MW4PR04CA0244.outlook.office365.com
 (2603:10b6:303:88::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.19 via Frontend Transport; Wed,
 29 Oct 2025 15:08:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 15:08:57 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 10:08:43 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 10:08:43 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Oct 2025 10:08:43 -0500
Received: from [10.247.30.235] (lt5cg2132ltw.dhcp.ti.com [10.247.30.235])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59TF8hsx024198;
	Wed, 29 Oct 2025 10:08:43 -0500
Message-ID: <cfa3360c-1ad2-4e3b-a67b-259110d194e3@ti.com>
Date: Wed, 29 Oct 2025 10:08:43 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] media: chips-media: wave5: Fix conditional in
 start_streaming
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, Nas Chung
	<nas.chung@chipsnmedia.com>, Jackson Lee <jackson.lee@chipsnmedia.com>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Darren Etheridge <detheridge@ti.com>
References: <20251021204618.2441939-1-b-brnich@ti.com>
 <420ba3c838b7fe2a6f2414d09fe1226c581ca09d.camel@collabora.com>
Content-Language: en-US
From: Brandon Brnich <b-brnich@ti.com>
In-Reply-To: <420ba3c838b7fe2a6f2414d09fe1226c581ca09d.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|CO6PR10MB5570:EE_
X-MS-Office365-Filtering-Correlation-Id: 81dcdef3-9517-414a-81e3-08de16fd156d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|34020700016|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZTBJRHgwVTZmZmxDL1NOemRUMXNtWjJncC9ja05JSFlLcXgwampJMWVkU2t4?=
 =?utf-8?B?b09WWWFFMHpTMmNleU1zVkpJbldlclFwa251VUZxM0srN3ZDaTA4azFzdXBY?=
 =?utf-8?B?dFNaY1dzUEVLZnZ1Q1F6bkZtOUt5Z01SeTl5WXU1RjRTeTRnaGF6Z3VlU01Z?=
 =?utf-8?B?SG0yMGlXaWhqRHYvVHZSdUhLREd2dkxQM2VCZktITGNlc2hZYXRObTRDTUdB?=
 =?utf-8?B?MUIyZzNkcSt0N3ZmbWNDZFhJVHVYWnlnNytuVFNRYysvRDVVN0lKbUEzWXJQ?=
 =?utf-8?B?SFpNV3dYWVc2ZzUyU2JmSU5zRlpUL3lGSWhhWGhTOGE5S3VLbUlnTnVOL0sy?=
 =?utf-8?B?ejVsd1Vrc3JmL0IyWHRBZGhtcENDbTFkZUpQNXZaVVJpNFhPRmlYWHgrWWVM?=
 =?utf-8?B?L09vbjRQcC9sSUF4SjM2cGllNjVxM3JtT0JPTlNzQXVReXduS2d4SzdDcnJ2?=
 =?utf-8?B?OTlrTUllK3ZjLzFYTUlHUjVHYmJ5RVFwenNsQWN1c3ZETmtYR3dQeU0zNS9T?=
 =?utf-8?B?NVNueStFamJtaEVFL2ZSaERuRHJ4RmVTRXNnR0gxYjR0aVNwZGdTdU9WNmFN?=
 =?utf-8?B?MWJaaHNTNzBKbktpSzMxM0pxd092T2NrRWc2YVdmSm4yK2M4ZWZoam5iYWlF?=
 =?utf-8?B?aUVtY2hDQldwcDVoYzEvSkYwaHIwcTkxNVJVeXk2c2JVTWM2amxTbmhnU0hv?=
 =?utf-8?B?WGZkWUdicXlzL1dPaHFtYVlFak5lVzRzMjZMZTJPUTlqd0VuR0RQbW1jdjBH?=
 =?utf-8?B?ZlphY2JMWVRrQkdUYktnSWx3UVVCWU9ZbU9tOXNrbkU1YzdEV1VhVFI2cVpH?=
 =?utf-8?B?WXMzQS9MYjlKcENSZm9lYUF6TWlQNUFnc01EcW9nRVExcnlucnVVYTFIN3la?=
 =?utf-8?B?ajlaZURkeTM4N3NaenVWUVJpcnlDbGtuWGtwaTVGWkdvRFlKNXNDY2tFMUtz?=
 =?utf-8?B?VmRqUm9MWUlkZFlEdzl2V1lWNjdMcjJGTWVKbzFjT1JxcWRKZjBDWWdzUzVz?=
 =?utf-8?B?bXFORjFqeEVXb3JQa0E4Vkt1Vi93Z2pIVUI4M0UyNEhBbXZjckNaNkYzVkk1?=
 =?utf-8?B?OERpMVdaQUhKYWxsTFdHc0JZT0UvWWZxZUozTnlpRVFuV3B6Z20vT2VsT1o3?=
 =?utf-8?B?Y2J6OTQyWkF1K3BvNVFpMjcvaTYzNXZGZVlRdnEzeDB5V1RCVHJNeWpjak96?=
 =?utf-8?B?eXJpUUFkM2hHVVlaR2s1RkVLVlY0RXZLQWN6VU13QUJCZTMydDZ2S05RU2k2?=
 =?utf-8?B?ZDExNTNka25oekpWZm5IUlBhRjZtK0hmd29INWZ3NlQ5d1hTaVp3aDM2TTZu?=
 =?utf-8?B?ditaN05Nay9MQi9RQU5MSWsrYlp5WFl1WE13VVkveHhyRjV0WHhlU1RhMTJa?=
 =?utf-8?B?ZGgwODBCcndaSHBnRkJud0xpWXc3bzBOeDJEOHdKR29PdVYyZGI2RGNwQlpo?=
 =?utf-8?B?TUE0amdiUFNsSm5VMDI1dmV1RTEwY2dwdzEvWGREa1ZzQXlLY2F6UGZjVmxx?=
 =?utf-8?B?aHQzLzVjaDhzRVBlMWpEY3JsR2pMTHJpdHlYb0lDODEzZUx4YURMNS9BUTJ6?=
 =?utf-8?B?cTdHRzJzY0pjdndOOTRyVDl6dUVmbUg0dXdDY2hHMFZvSkdnVTFVUjd6c3Y1?=
 =?utf-8?B?bEUzZm0wdHRPR2x3aXNFNDZBSytLQmR5cVJHWDBBYTlSWkhEc0ZyeVZmb3FJ?=
 =?utf-8?B?YkdCSkZMNm9mYzNhdncwb0N3TUVsYTNaN0hVbUl6RDBSbld3b0krdUpjOHZa?=
 =?utf-8?B?T1JMZlMyekRtVjJ1a0VQS1NCMFJBWFViSDI4Nk1UOHllYXYzTFNLZ3lTUGZa?=
 =?utf-8?B?bFU4SUJpUU5XYUNmdFZpaS9RZ1RSWTArcGVkVTZ4VG9rQXduR09NOFBvZ0lo?=
 =?utf-8?B?bXM0d0tKdFhWeHNML25pdjl1Z2FoZldZb0RXRHRwZ215MEY2aWxFSXc5dnpO?=
 =?utf-8?B?TmtYZ3lnYXp6UmdQZjgva0NyK1h4c0F6cCs3eXMxMzdUK0ZCRkJISHNIVkV0?=
 =?utf-8?B?bkd1ZjVnOWZ3RGdYNnUvM2gzT05XelQ5OTZkQ2kwb3hlN0JlSFRCRVJsbEd6?=
 =?utf-8?B?cGtIR3prR2FLb2pRZG5hVFFIeDNwSkRmTG1JMnFoWkJhSjJZUzBwNFBhT3N3?=
 =?utf-8?Q?mrRY=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(34020700016)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 15:08:57.4551
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81dcdef3-9517-414a-81e3-08de16fd156d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5570

Hi Nicolas,

On 10/28/2025 11:42 AM, Nicolas Dufresne wrote:
> Le mardi 21 octobre 2025 à 15:46 -0500, Brandon Brnich a écrit :
>> When STREAMON(CAP) is called after STREAMON(OUT), the driver was failing to
>> switch states from VPU_INST_STATE_OPEN to VPU_INST_STATE_INIT_SEQ and
>> VPU_INST_STATE_PIC_RUN because the capture queue streaming boolean had not
>> yet been set to true. This led to a hang in the encoder since the state
>> was stuck in VPU_INST_STATE_OPEN. During the second call to
>> start_streaming, the sequence initialization and frame buffer allocation
>> should occur.
>>
>> Signed-off-by: Brandon Brnich <b-brnich@ti.com>
> 
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

I just saw I received a messaged from the CI bot on an alignment error 
on my conditional statement below. Would you like me to submit a v3 or 
will this be fixed up before being pulled to media tree? I can submit a 
new version today if required.

Best,
Brandon

> 
>> ---
>>   drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
>> b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
>> index 1978551a28fa..0a2eab372913 100644
>> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
>> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
>> @@ -1367,7 +1367,8 @@ static int wave5_vpu_enc_start_streaming(struct
>> vb2_queue *q, unsigned int count
>>   		if (ret)
>>   			goto return_buffers;
>>   	}
>> -	if (inst->state == VPU_INST_STATE_OPEN && m2m_ctx-
>>> cap_q_ctx.q.streaming) {
>> +	if (inst->state == VPU_INST_STATE_OPEN && (m2m_ctx-
>>> cap_q_ctx.q.streaming ||
>> +		q->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)) {
>>   		ret = initialize_sequence(inst);
>>   		if (ret) {
>>   			dev_warn(inst->dev->dev, "Sequence not found: %d\n",
>> ret);


