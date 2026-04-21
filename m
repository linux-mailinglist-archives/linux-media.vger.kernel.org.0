Return-Path: <linux-media+bounces-59187-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDMlLi735mnr2AEAu9opvQ
	(envelope-from <linux-media+bounces-59187-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 06:03:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7550F4362AB
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 06:03:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C904A30185B0
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 04:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD74B63CB;
	Tue, 21 Apr 2026 04:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="i9XtfMCf"
X-Original-To: linux-media@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010033.outbound.protection.outlook.com [52.101.193.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC40288B1;
	Tue, 21 Apr 2026 04:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776744234; cv=fail; b=mmgUN/86lh31kI6oYv9xeMuFpW2fquRWH8dmqgSH8tSTT9M6hQsbcf7Pfge8X6Z/G2O4M0qq5jre3oXbcmHdJ+uaS6VsY8Ehfo5bkD4VCJ49yYHRjLWCv1rpnfnUJ4IXbiejSwQm7V3EuXg+JXiKmxQw3erCP0j2i2ufQpQuRxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776744234; c=relaxed/simple;
	bh=vFAUsOwXttIR6ZCNmtBRoOZ2tyfYWargfPnPVLXUijI=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Hbdt2P72IVXNuyXvw+Z/nlFYJ/6fqygd4Gsi8MypH9D2k0z2W3DK60lzaC/5IE1+Ru3s0LPqNW6sr8uFw4BjqQ0P0+TKXlIX9P2bwaspYE3N8xfhu52X2MRwatWwyfKYi3SAaUWzzuOzjnMEAD21szTU2tIXBWOJvUAa1VsNq5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=i9XtfMCf; arc=fail smtp.client-ip=52.101.193.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r1Xt5oCubhtk9wVKuZxCuTNcE/EbULA+HOjFyDFdHRlWaJOpiOap6v1BliqABa59R5AdCN3HseIhiqcIXZBeZdoONIVqoKkaMgvzxFqKk0NR/5oZd88335JgoCyx0zEwdrzqQNXXGHgcvFRXwWGVa6yu1j0T+YfORNMULNQ/dPyEjqInvI46Fe3yBaCoVsXb797Jc9Pu1pZWqm4OjB8lznOcG8A5wyCmWOb8Yb8NnePEnAImpf8s4Pn85+trmO6bTTSfVKgzWC602uiFN9pQ4zlpnpAqMO5CO6+8e1Rn18f405JG/vkzhep5WxxifY9NuAAozU5ulRHlEG7fCpgfYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BHVGEK6xKo9ZtRQh4hkttTK0QrpNwByN9EfHCj7+im8=;
 b=FtYI8VM/xFcGyVZ+Do6noqBabhgqgoF8mDEnUtg/ehnkMBy/I6mAseTfebWGQl5TkGVHXC6xiPPNvE7FmgsQfdvP7MFlR0gLL0lGOQ2kHMtbPJfu4riP6Egm0OqwxA/YiQx1Pyn0mPe6lFsnsC+lrATbVFw3kyIMXulUrKumvGwcHaW2+hkt3AGgRCuXbwwh2An+SZ9v1xLWe6EeKyfgK+eRN3oQpjCLoHUIYyYA0SV6CPouN3DRce/VB7FmbCCUn0f+fonePXOiI99DAeK93zvKfFQEv/WD91HC8ng9/vOmwVgCg53BJV+TUQhBq6cvkkv3KdC8FWQRsxXm1liQ2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BHVGEK6xKo9ZtRQh4hkttTK0QrpNwByN9EfHCj7+im8=;
 b=i9XtfMCfEGy3j9XCBZBARTFecNK57gwDhgQ9fBbt5rfmCYoNISQmL6W5vuO1DfBjWFBWZszWTjDvvC563M/m3hTVPxD/2Fsov3pgG66HfCCEIiufZD4LtK7EMmbenHxka6Q7/gN4tu8DqgDQjALDSQcjGiLLWLYBvXHxh/m3RUvlYJAxTgKAZLvYhGLEU3LMm4hNksJEjNpEFRa9j5mnURh7kvC7kUsFb+rmuCV1M4hPBmXLqqcBL/FiAc6NFEXUWkdG45symMbU5qIS9DbW3uw80MFI8Nq388MJx0cb51mmDE1idRaXP/FJNgWclDQJLbS2h09U59yMFobkWlOoHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by PH7PR12MB7985.namprd12.prod.outlook.com (2603:10b6:510:27b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Tue, 21 Apr
 2026 04:03:48 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9846.014; Tue, 21 Apr 2026
 04:03:48 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH 0/4] Fix checking of iommu_map_sgtable return value
Date: Tue, 21 Apr 2026 13:02:35 +0900
Message-Id: <20260421-iommu_map_sgtable-return-v1-0-fb484c07d2a1@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw6CMBBA0V8hs7YJBcXHrxhD+hhwjC1kpiUmh
 H+3yvIs7l1BkAkFbtUKjAsJTbFAHypwTxNHVOSLoambrj7qs6IphNwHM/cyJmPfqBhT5qjMxbf
 On656sA5KPjMO9Pmv74/dku0LXfr9YNu+JLLM4HwAAAA=
X-Change-ID: 20260417-iommu_map_sgtable-return-a8d3cd591fbc
To: Thierry Reding <thierry.reding@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Mikko Perttunen <mperttunen@nvidia.com>
X-Mailer: b4 0.16-dev
X-ClientProxiedBy: TY4PR01CA0002.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::19) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|PH7PR12MB7985:EE_
X-MS-Office365-Filtering-Correlation-Id: 849f7c6d-ded3-4f77-1994-08de9f5afd6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|10070799003|921020|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	qwPUqK3OA7MCIJYM79G2yAUrJq49RYhNy90xmyP+rFLurwyicRsW3ZkEZMuTlsuwSm0fZmK1ZYFmphxsjVy4+r7kNpd0VEZ9NleEGImREt18kyYILkyx8niWb0l6zQBOtLnJ+qA9Vj6qOqNtXGFFwObnKaFTHWiT1da1pmF6f0xfqEz0WrCEXNjh06CLzVwogFX/AqwFs4btVNxwfEdr401cByHqGiyQU4v0lC2Gfg3zmF+Bhrdo10WvuGJZKq/XPOUxpSFOlsTDy2FVUmd1PF2x0DdHOfhAe1jwVmcRUWyr/oCArF2cnb0sGCV4TagsCCCRLXtpmrEsfGadUsakV0qEQ7D2KrdY2oHWxD7sM18GDc0QZPtzgFH1IMYl2hEMCLgZ4isA+TylfOzavmWS8RT0uNFumpAvxeG9giXpRfLD5D+DJrkvpjI70a/yGnF1yKLmubVhpmNAnxatXlcrTLlbrsVmSnxZcagzs/hjfGqQbWPXUxYRfEXobMHiLhWdEsfRsHMpVmqRc93KuXr5FtZL86AfxVCY6jNzbMJAurnzsDIClI5OP7n5falDl2Z+TntZHL9WLnLFSksq+NpjVLBKiV8ijZtqrKTMrl2y4stZSQUXcOkzD0kuBmc9Q2dj13LYXmfS+6lscht9v+25n1aso9flAjsXp/gDnb1R3ADxh4w/XtRCXEoWC2rAH6fflxpCqZTFeLhbc1aidJfm1xtJMKBA+0FmniEkXjYGyEyNnaJNRu8VZbtNj3A8ACvxaxL/uWjEVAbhb1VyfUUquQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(10070799003)(921020)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFJNNEt6NzRGSThIdk5QdENXNUFTSGtPVC9keUpmNVArUUJ6V0ZWbWFEN29Y?=
 =?utf-8?B?VG55NzhobURSL1FtT2ZmZUJqWTlYekcyM1RTY1A3Tzl4WEZ5dVlwZkVsaW5F?=
 =?utf-8?B?QnF3ZXRNVnkwL3ZTMUNNdHVxU1VEeTV3cXRwcVorcjhNNXU5clJrR0FyTU9U?=
 =?utf-8?B?aHVGWmM4QWZjWXM2b0xoTWpKUEduK2VaYXlXQ0w0eUc0OEl3bUdOaDlCdElR?=
 =?utf-8?B?MWVJUUlQMXF1UmY4K2xSd2IxdDlERVJ2Z1VlckwvQkE2L01LbEptSlNBT2My?=
 =?utf-8?B?ZnVRR2RHQ3pHNE9xZWNaV2p4cXBJWkEyZE83ZU5XS3JObGdkV3MxNy82ajhI?=
 =?utf-8?B?Q2FPS3Bod1ZQRy93cCt4R2ZUbllYZDVhT0lPODN4SlZzQ2Y1eUhBWDZuQUlP?=
 =?utf-8?B?TFErTnhLc3VMQndMR2MyRXdMTDZXMU5Hb2g4cTFlS3FCeDdFUTZlVk43MThn?=
 =?utf-8?B?MXNNYU5DdHhRWUsxcU4xS1FhTTROYVNqVmw2QmllbHV5Y1h0dk95c2w0S1B6?=
 =?utf-8?B?M3h2b2xtUTgrMTJBTFhXNFZCbFZpZ05ucmJjUkc3R2lZY1lUQjNaa0hLanJG?=
 =?utf-8?B?V1RzS1AvdHZQU1BxSGl1aTlrYXlIWEFMemFzaW9CWDZDYm45U3M1RmJMUzdI?=
 =?utf-8?B?UE1GeG5uZmNFZXpGZzByemxjeHhTWE9ic2R0dzFyZWwxUHRtQTVGSzBCU2Ri?=
 =?utf-8?B?Q2t5RGNjZ3d0QXE0bm5BMWFPTkpuTEJiL3BxeVpiM3NjMi9Ob1RvRlZ2VzBV?=
 =?utf-8?B?QVE3aHRZQUE1dlpJejZPT0FqeWJQT3p6ZktBRWgvSUFOWnJ3dkRHdHptNmlB?=
 =?utf-8?B?dnJ4b0hLeElSNGU4NlVIWHZ3VjBvTXJzbk5Ua0dVVDl5Ui83S3crbVpJNnpO?=
 =?utf-8?B?YVFFYy93ZGVLdE1EeFU5eTBLQmsyMzRnamZrZGQ5RVg5VGhVWVFzYTAxdWs5?=
 =?utf-8?B?VW4rcGJJQjkwZllPTm0rYk1WazZtMytiTFo1SWkxcTJ1dmszYWY0b0J4OEIz?=
 =?utf-8?B?S0wzOG9UNHV6RHQ1NUxLVlpmVVZOOGxGV245ajE1SmNOSCs0VVZaSDZ0UTNw?=
 =?utf-8?B?Y2ZNU01uOCtMRHpzUVJ2Rnl2T3dPUzVjTnVtaGJmWVNhcUkxSDVFSVhlWDBS?=
 =?utf-8?B?QWlzTXlnZS9UaGRRRysvdVRGaDdnako0L2dqR2UvVkNrZDRVY0NjbDM0d3JY?=
 =?utf-8?B?TVFtZHM2NDJIdTNZSzg4RHFuNHNhVk52SC9TMVJ0QXRPVW1JdityazlweWND?=
 =?utf-8?B?aFBORndicWZUT2lsMExOZjJEMnFBN3gwTWkrN0cwc1JEWGVTV3dYclBHelYx?=
 =?utf-8?B?UExVc1dPU09ZeWZydUtWSndocGlQckRoWC9aa3c0T28raVpyVldDYUJaaDE5?=
 =?utf-8?B?VXBGVGY3azRqd0QySjVqVGVQRURTVGQzVlEwUmU4N1RSZExzb080U3B0OU1o?=
 =?utf-8?B?RUcraE9rMkU2ZTR6TGxELzhMK1dOQkQrS3VqSkRrNUZ3VGFCWURhQ0h1dGZG?=
 =?utf-8?B?OE5xRXhnSkFGWDhpWnkvQWNLTzVOczhNMC92Q25ja2RZT0ppcmN2MmJMNzBO?=
 =?utf-8?B?ZkVST2NPVG1uWDFFSVpacldiQkhPMmJxdU1CRXhKZ0xZamh0a3dQT3pVZWFq?=
 =?utf-8?B?Z2tsMmdRWXJteGswbFpsZmtXR3VtYTZJeE5VNHdQdHRqY3llblV4c084NWly?=
 =?utf-8?B?Ym1JNnhGRGp1MlI5cW5zV2EvS0o2VVJGdTRNWFNiSGRVanpZSVdmRFVURysz?=
 =?utf-8?B?eVFoYVZWcEFhWWRQQ29RNkl2c1FWRitvTkZpdWh4VzdPVHFRaHQrdFVDMnpX?=
 =?utf-8?B?TXZlUFJQNjI1YVJJcWFlc0hLRlNaQk0xQnlwWlQ1OXdFV2dUOWtxQ05jTThH?=
 =?utf-8?B?UUlrRFNYRHczSlRnM1YrN1o3ZTlzNGVCOUxFRHZoczlVdnZ3aGtVOFJtNEF2?=
 =?utf-8?B?YTJYY3Q5MG5vc3A3UWZ5aFVzVm5uSW8xaHBjMDBSR1FiNzJqNldaZkFtTjhJ?=
 =?utf-8?B?dmcvcE1CazVQWGpGaVJDUlNXanUzbkd5Y2F3ekRPTWZuVmNidktKTHpLcFBr?=
 =?utf-8?B?Mm1Hb25CK2VXK1hQdFdOMk1vTitta2dxN3VIT3VMa2UvWHgvdjNzK1Q5Tm53?=
 =?utf-8?B?RnZmRE9FRjlxbWo3ZzdUbWE2SG10U2xrTWpWT0R1MTluKzdmbFNYNmRtaDND?=
 =?utf-8?B?Q0xBRTd5c1FOR2VxYnVvUGVGRlZEMDB3aklHaFpNSU9HbVFRTWJ5WmRXRW51?=
 =?utf-8?B?QzlHanRxZnYwR3pTNW00RkgrVmVQYURtSko4Vmp1NVdYaWF0bysyMWtUUUtl?=
 =?utf-8?B?cmI1VWhXaDdtcEhuWW9KTGw0cDBwaDQ2VnhaaEUzSmcwU2k1d1JuY0VTM1dr?=
 =?utf-8?Q?kKLHEBF3x+8RrVL5o6xu57MjVKiE9eF9tDQvLJ1ybv2Bv?=
X-MS-Exchange-AntiSpam-MessageData-1: TCyML+/XH3Bm+A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 849f7c6d-ded3-4f77-1994-08de9f5afd6a
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 04:03:48.2649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KKuWQ1ih74FRM09X35OW5p502zB4XX+lughaE4Y7/wEKCX87uW9aZtnG2gEx1bWIZMDlpHo7RYXpeeywPa3s3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7985
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59187-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,nvidia.com,kernel.org,oss.qualcomm.com,linux.dev,poorly.run,somainline.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mperttunen@nvidia.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7550F4362AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The return value of iommu_map_sgtable changed from unsigned to signed
quite a while ago, but not all callers were updated. Do that.

Each patch is independent of each other. The drm/msm patch additionally
changes from WARNing in case of mapping error to returning the error
code now available.

Best regards
Mikko

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
Mikko Perttunen (4):
      gpu: host1x: Fix iommu_map_sgtable() return value check
      drm/tegra: Fix iommu_map_sgtable() return value check
      drm/msm: Fix iommu_map_sgtable() return value check and avoid WARN
      media: nvidia: tegra-vde: Fix iommu_map_sgtable() return value check

 drivers/gpu/drm/msm/msm_iommu.c                 |  5 +++--
 drivers/gpu/drm/tegra/gem.c                     |  9 ++++++---
 drivers/gpu/host1x/job.c                        | 10 ++++++----
 drivers/media/platform/nvidia/tegra-vde/iommu.c |  9 +++++----
 4 files changed, 20 insertions(+), 13 deletions(-)
---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260417-iommu_map_sgtable-return-a8d3cd591fbc


