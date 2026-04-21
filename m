Return-Path: <linux-media+bounces-59190-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOAXL/r35mnr2AEAu9opvQ
	(envelope-from <linux-media+bounces-59190-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 06:07:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4CA43636C
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 06:07:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 456AD3026768
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 04:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73AED1FE471;
	Tue, 21 Apr 2026 04:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AHGilf6b"
X-Original-To: linux-media@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013053.outbound.protection.outlook.com [40.93.196.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736FB284682;
	Tue, 21 Apr 2026 04:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776744243; cv=fail; b=BGmq9gSOmuMgRMN1noKXbHXG4/GVW0f3+fX8yBfNytU4EYGWghnjmBT0XKRlyi7g3xqctfbPqKRS04eYypAfcawJpOkb28z8AfwWYQCPFLMc94DrP3AESAAHZHh6tkcUsvZ1vwaChhPnKIZgSNIhAIWHxE6/Tr02DnLj8ZqQ3u8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776744243; c=relaxed/simple;
	bh=/cCyBR0NIK2AItOcM8v+BDGRwh7PhPf5r+u4lM5dG4o=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=U3EB18CK57i+Pj/tajyF9MiHUCvYWov0EzOY/vdrs1IcWEM/51zMyL+WjFDyq6jW5cEopDqtcjzBMMknbTImqim1HJa3R6nlrMNOOjtgCmpSEU2MeGdpgqIsmNDquti6sAn4X+IRXXN2YXY05ojz2IUJ1NNsGtu/YUdA7oykpu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AHGilf6b; arc=fail smtp.client-ip=40.93.196.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kus0sjzvXS8VZWap2LTo5n0uurOD4lxFwh3IO9pCiAPeC090n62IfToh/HsfKDjpQA8P+joTm5wtwUEYUpXMajMpSxw18Wcq/JfzcYfa0vP+CTOAcgjWEAMGYRIBBNX7j35plniafvFki2YKVHZz8Gvw1FCLPOEhjoM2J3LZslusL4GaM3FtNe1oaoh2Z9tsbofOqybUtVR8fgL8AK/sihBQI7gbG6CHCPQHc954IalznjH+uv0Ez8f8vOVBD6Om9wSnaRmaR5XISV0DgJrlCLCRKCWdm4LfTB87R0tRwYBAWksQPHIJ6m/JtiKS6VOWkwjO/2YYvyPMjT1cYxOrEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sqBcVdJMakuT8noCXfaWDRdIuh3sO/nrVZcPlwUnK0g=;
 b=H0jQWUr4JMoUG/145Z+LKyMtNW9s2Hs/3SG/Em63gffwoAugjWtkGc2hqRs/yG/E54bZ5RwrpYfu5wXFQp+rgrfb3hH5UO05LQcBm2NCrneSXL1foPbf+GJP2TvmpTcByB1rw4YQ5y6cuMkFbiZeJhgOt4mtT824ypqERPAd6Mkqb2rKEZmiXMtqzPvYpZ99xIYiPy4oOWSSpNJ9DNKpkUooN3bDAiP+k2vLF5Bl5Tg2hOjoCJaZeNeYMUtm59Ow4Fvd41sK0czThxwLOiXmNiyVc90BaZ0gWK2YsOMvr6Guy2pP4f1AOrUG3hHaCEMTmO6Ks8bh0nxPZGYGUmrVAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sqBcVdJMakuT8noCXfaWDRdIuh3sO/nrVZcPlwUnK0g=;
 b=AHGilf6bvfwVxHtyji18lpBKYlaluqEPEWeViR1FE63TCLOlSW6+hYuErGrWflGj4cv6q97tuyqgzev1GzGLMKRTF/POi2vYQrohDlmHH8z7WMSC+30tSX5dbDrmOPqJgIqt8WrJirwk051p8Zjemkgxx0XJZoWTL1+/yEeq5t5SyFoh6BsVotnjLHlwKnMdpVKdUTtUHoJN7mPulge8fZM7GhAwfu9NNsC+HC0VFSHT647+5739fFC8WKGMTw36iWZSULE6DL2Ec2TfT0qIlm5ErgEShUvp4VMH97YhD7tLXy1sHug1UilFx3GJSEx7ph/6kmPJRs8ZYbfHIGc4hA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by PH7PR12MB7985.namprd12.prod.outlook.com (2603:10b6:510:27b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Tue, 21 Apr
 2026 04:03:59 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9846.014; Tue, 21 Apr 2026
 04:03:59 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
Date: Tue, 21 Apr 2026 13:02:38 +0900
Subject: [PATCH 3/4] drm/msm: Fix iommu_map_sgtable() return value check
 and avoid WARN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-iommu_map_sgtable-return-v1-3-fb484c07d2a1@nvidia.com>
References: <20260421-iommu_map_sgtable-return-v1-0-fb484c07d2a1@nvidia.com>
In-Reply-To: <20260421-iommu_map_sgtable-return-v1-0-fb484c07d2a1@nvidia.com>
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
X-ClientProxiedBy: TY4P286CA0114.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::12) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|PH7PR12MB7985:EE_
X-MS-Office365-Filtering-Correlation-Id: 295e1fda-fb65-435d-26b5-08de9f5b03f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|10070799003|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Ay37eBPsT/c2cizWONx10Hy0fI7hN3oyidIsuwF99AKdosM16/bnpolpPrb6+pgIcjxfnucZhLdoaUar5T4dU1/0RTgorb6Qx0gdNNlPXCRYj++b+6XY02/fzqG+7fiPMptbzt98dSfpOeN/gcQn300s/bvxZZH64lii5dskN86LKnHUQQXWIT4YSKLuj9a8UTmyuByOeQ6xWkxoyBpQPYcneBU4SzenwfNHPTjGfyaV8LaN2qAqpbnTP0HJhwqIwJlh+aCX2L7opj2BSdu/wFUPJ/puxBoAtzj/PoltFz9xM5Tl9N8DTiU4ma1wCptTxtq4eFZaXXyUPyoxRa5Y6gMqSvtJqhYVmBz/cbekK7kYwsuG/fjxizZ+itMfDST6wcFSFF0qchoQrv3VxBxEvAiY0GRGbbe8naAUl0AH8SsqBn0xgZnAaWzoznZgaZtn0SBT7ETugdi97MZNQG5I1oOqHh0v0B4POgw6ZqFhWMvWe8MohetVKfQZVtb21fT/b2vIbBfYKggmB9F6X8YSWw0uz5cibXTbfKAmAoBHTM8oQ2cT7dC7kVhiF9F68zaBGY8pB2aAGFd5UpOMCm+VDz+TJLLjUX75h9WUBATkive3Z6no376rCHWIbGkBTC2ttYhNd6oKWzml/bg3BJELx08SMkFhsq3pnsG4addR+mdghCkdwFUTf7P1TW3GPs+giKl7hUHoNZ5MYxiIahnuMMgFyXsL/Z8X7lIiQqEP+r3tJRFsXqFCQOVHErYvt0yWY1uKlesJp8puvMCYeokF1g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(10070799003)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFVyazBKVGlVczlaaUQ0dDBVQnYwaEo5NmRxdm5mb1FZRDVaWXZ6MTIraldt?=
 =?utf-8?B?cm5sa2RGa0hiczI0NUdEN1M1Y1hRa1dUVWwwWkMzMmkrV2lNMkZSdjN0dDNN?=
 =?utf-8?B?KzJ1UTdOemJ6bzlMcHd2NGNkcUF5RmtMTy9kS1BBSXhsWWg5dUtUdUp0elZB?=
 =?utf-8?B?eEJlYWZ3b0tURGRyb2c2Z3VYNjZQVmdlQWVROFp6YjdDLytWTkFjUCtjRm1F?=
 =?utf-8?B?OElBMmc2MDAvYy96S0pjc2Fnb0lHL0IyanQyRXQzNzErcnFhSGhCNVY3L2kx?=
 =?utf-8?B?R3R4Z2JTUytqK1JOUlVUSFByeGN0M2pYMFJsZHlvdEQ5WXZxaVM5NUFjRjdT?=
 =?utf-8?B?Mm1WSWVJUG9YdmpKczhEOFkxSUtvM1VxVE1pcS84c29MaHVtaThaVnl3ZExK?=
 =?utf-8?B?cnpyTzdnQ05ZM3Ewa3p2cVJwOWtoZ0I5NXcxMEx2WldhcWRYbFVjRHNnQnhH?=
 =?utf-8?B?Rk16dlBQOHprK2RhR0t2Q3pYbDJtYzZIRjJmWGxhK1BYd3JIWjNVVkxYaS80?=
 =?utf-8?B?K1VnY2l3Sjg5MkNCRXJRZGtiUmFNTm9PbkY0cDFRWkw2OTlzMEtoM0NjVGVr?=
 =?utf-8?B?VUtpRkVPWWlpcDV6ajczTlA0RFcxbUpzYmh2ODh3b0MwT0lKZzZpV09zSk9y?=
 =?utf-8?B?OGt6N3pKN3BNZjVhQ0VUVWxpZzA5N3laTFNSRTdHT2QzMDRIVXFuZVhYV0My?=
 =?utf-8?B?a3dldmlIRUtlRGhESnNCZS9pSVNlOVR5V3dua3BERmROc2c5N3hvbnN6ejNz?=
 =?utf-8?B?eEtzUy9XNlh2Wk53L25qZm1mM0hJd2FGdjlBRW5tQzJhZk96S0VkTkViTzFZ?=
 =?utf-8?B?c1NSRzZPeHRZNWdWSFZ6bStGSzI2NVBiZlZXVDVPQms3WlAwWHgvVERvZWdI?=
 =?utf-8?B?YjlRaDBQaW44bEJ3aHk5N3ZTN3NjOFNlMVRnTGZmdENpb3ZCWk9iOVpMNmVv?=
 =?utf-8?B?a2FZTUhvV2JEZ0FlVEhRdEZoblJLYW9FWDdtVkZNQ09lVjdVellna2ZXY1Vu?=
 =?utf-8?B?V3liYU1zNzQycGpsZ0wzcEtVbllNZWJqaVVmbUZoZkJ5dTNFd1NJcXJsLy8w?=
 =?utf-8?B?aWova0VrOUl6eldua3BoZE10QXoyMkJsTlpJSVhJaDcydXhra05UZkhrWE9J?=
 =?utf-8?B?NkhvOGdDNGNuY2JaZjRtSGNhL2tqTk4vVTVWWk5aWnlBQ1VYWFV5ZjhGMnN3?=
 =?utf-8?B?MGM1bGFraHlaQmtucXE1RjFtVFdxVnpzbWxaNmNDWm9ydUhYK1A1bUh1SnVV?=
 =?utf-8?B?SFJpWUdZdUJKQVZDcnFvbHFRZktkSW5scFZjb09lYVdPWUh4a1grUWdSTmZs?=
 =?utf-8?B?Vmpldmp6dThlQUlxZFFQM0ZJRWhNWHVZeERDT3UxQmxaV2NMUEp3eHcwVWdz?=
 =?utf-8?B?bVIycGZFaW1GMTBoemRqZFU4RjBSYWtRc3NkanBLMGt5aEhEYjFaZnRzZUlF?=
 =?utf-8?B?UHE0VUx1c3lZc0tGbXpsYlJ2R0V6ZDdtUDVVSEJvSmkvZnhjZUZYK2lOeTND?=
 =?utf-8?B?YXAzQU1RYncwdjZEWjFkTENva216Y0lFdnVNRUkycHJnNDJwc1JaTXhzMElv?=
 =?utf-8?B?bCsxUUVEVUh2bCtrRXJEbVdtRWttS3VWbkI1WlJrcjM2Mkt0WG9WemtFbHhi?=
 =?utf-8?B?VWpXWnIwcG1HQkRRZzNKOGtMZ3JhRlZXdXR3TFRaWDZhdFZpSU9aa3RrRFFT?=
 =?utf-8?B?dnJpOWxEMndML2paNFoxRFM3aWtZaDlVOC9USG1wZHB0QjkyMjVScFE0T0lp?=
 =?utf-8?B?UlgrZXI2QXluTC9JYlYwYThINjViSGcrUmxEYzR0WitFMVBVYnk5WWthUFA1?=
 =?utf-8?B?aWpzemNlVnA4SitQb2xoQzRLV1M2YUd5aG5GbG5neW1XZVVKNWxFREEvR0NH?=
 =?utf-8?B?Q0NxVHBMYU9udlRidzdhZUVWZUpSS3Rqdkc5YTZnWTV5N0lFZDZHRVRqR1VZ?=
 =?utf-8?B?bE53YXZvVDliU3pZZ25NUnkwdk9VZkJNeUNnVGk5RXdPWFM3c1dqdFAySmkz?=
 =?utf-8?B?Z3VCMGtTRFkwZ2FTOHYxQWFXMUtLZVMwV0NKbEhEcmhmcDZtL3BwTC9yVUxR?=
 =?utf-8?B?dFN0NjdRcGxhVXJYYWZhU1QvMEtKKzRSZkEzU1hLcElEUm50NGg0U3ZGYmFn?=
 =?utf-8?B?WTBxdnZkaXU1ZSt4WndDMGVHYlRScVVVYTZWOHU2RVpOMDJ3ekpJUTNtSlJM?=
 =?utf-8?B?UUl3VkU4MWtZZVNDTDIrTm9rQ0xDV0J2SXc0THRUanRRaWlHbStrOEtqWW9S?=
 =?utf-8?B?WmNoRU1RWmJETENrN3JlN3orQlduQ01qVzRQdUxQUzEwTGZzRjd1SzBzak9h?=
 =?utf-8?B?R3ZsOFEyRGtNTy8vdDZ0SC9YRWJFQjRoS2FjbXIvNFlhZnRDYlFPNG9uWXJN?=
 =?utf-8?Q?O/QqYLKS4W6P7GAoGfHJvvpzM+emJwN9DuizxZdTE3ImB?=
X-MS-Exchange-AntiSpam-MessageData-1: DK9LBH/rD6HoRg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 295e1fda-fb65-435d-26b5-08de9f5b03f5
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 04:03:59.1759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 04ZnpuNriuolhL+xGN/8kjJJXAhxc2pm/LHWtbDQ67lttgerxAFXsKu0y8ObPxFygT8eByKzXDHUGeuEk0n9MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7985
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59190-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 2A4CA43636C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit "iommu: return full error code from iommu_map_sg[_atomic]()"
changed iommu_map_sgtable() to return an ssize_t and negative values
in error cases, rather than a size_t and a zero.

Store the return value in the appropriate type and in case of error,
return it rather than WARNing.

Fixes: ad8f36e4b6b1 ("iommu: return full error code from iommu_map_sg[_atomic]()")
Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/msm/msm_iommu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 7d449e5202c5..058c71c82cf5 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -677,7 +677,7 @@ static int msm_iommu_map(struct msm_mmu *mmu, uint64_t iova,
 			 int prot)
 {
 	struct msm_iommu *iommu = to_msm_iommu(mmu);
-	size_t ret;
+	ssize_t ret;
 
 	WARN_ON(off != 0);
 
@@ -686,7 +686,8 @@ static int msm_iommu_map(struct msm_mmu *mmu, uint64_t iova,
 		iova |= GENMASK_ULL(63, 49);
 
 	ret = iommu_map_sgtable(iommu->domain, iova, sgt, prot);
-	WARN_ON(!ret);
+	if (ret < 0)
+		return ret;
 
 	return (ret == len) ? 0 : -EINVAL;
 }

-- 
2.53.0


