Return-Path: <linux-media+bounces-58619-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCzzGf9d3Gn0PwkAu9opvQ
	(envelope-from <linux-media+bounces-58619-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 05:07:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF3D3E6E14
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 05:07:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 640ED3014C22
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 03:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 872EB23C4F2;
	Mon, 13 Apr 2026 03:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DXGWiN8F"
X-Original-To: linux-media@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010049.outbound.protection.outlook.com [52.101.61.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D261340DFAC;
	Mon, 13 Apr 2026 03:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776049638; cv=fail; b=ib/Gx2UC3qNThZirNRNvPY+sVrOB4saR3YCVffFFmrgjkmaB+7eNJAMH2NhTvcMIRBR45NFolp632GbYdcdCTzlD1+ytPqQwHP6UTyc1a3H8MLnAj398mIPYG+vNRqKsSZzEzzQqPlKsSWCe/FqFLP8Xy1S4bDsWFpCFG5Np6GQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776049638; c=relaxed/simple;
	bh=xSW03ZOIoMebvJFpiHhQKzHHZiuDxivVStwWztjQKoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Hl7lMsKbNxV04/zRpttZT6aeV2rydVX5tawifmgqpNXoPHZa+n04lLr+1e7gEdNrbhp9EJdKotxTjgX59CPLwfKJJui2S38FhMRLOVdxf/6OPJEVFvW1lcXK5VG/rBdthwy19u3ri613KfOQTl4K/el2THvp+EBNc5wOAt7/+7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DXGWiN8F; arc=fail smtp.client-ip=52.101.61.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZCIYZqZ8056ZwZnqj8yaDIhbUBC57q3cnyHoVNK4vH4bvvBrfy6f5rZhIrq35+H7LsF4wObW/hRQ/FxuU8okMHBklOHbThKj+xd/ixg9H+00O6tLrI9RN1yoHb3lTvo3JJfvq2jrjkqaeKILowj8nyZj1KQp20nlCyKa5ek/djtaVYyNDqP3IlUEBP5J9Q98J6pAtHcW785TNYJQ1O2pri0PXUsjdgEXKXGMUTQQzr1WFfWBJIAtDQMZlCC0kvwB52/PuhAbjF7ieq5QJwBvLPaZDNh4d1PU3YFsyXZUFEtXCuzYlMmLvYAu6D0XYieEhai1r7xs6Wg2OYgknfzfUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OCYWU5l9SKAPERPdB/e8bVdQaCHxW1eRCG1T971uBQs=;
 b=cw9S2C2a4tht/vMTopnqJiCpcKyd9vV1yTwQRGLKsFak6CQdRjohCYTXgKIqn/3T5hdvZ4KIpjYpmCbgp0pRrSLHo3ZYSJDViJOxAZ2PYHbQjtAe8SmF9wvJK5Xeh3xW+N33tOeT+l0axkkPkUfRVhMuKgfk4FWFFSZHu0wNGmQJIEenZ04pownNcK4MPVKA5Aee5oOcr/vauMiB81Y29Ey/lvrTf699cxmIJGKeQT63v4+7Gp7FEoNcpCwajOK2uDTrGOwdnuAYcrleOZwRfZmCB8MQNbjJ16BMfS4czWb90whDAND5NOmKuV0FfpxiBmwOKgIM+0HpPrB15voq9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OCYWU5l9SKAPERPdB/e8bVdQaCHxW1eRCG1T971uBQs=;
 b=DXGWiN8FmzlYHWUlHx4E3EHI7RCu3V8zL5DdfFGAyb7riokuycp1DmZIGfge4Ca7tD0SKRJDoAUQEF+VWZWi6e0SRCmSWbm7yeKBq1jzBM1Czukkbg+TwCuFGG+PQY7fPU0fTSmVAhrUkF/MKTlNICIUlIxLbC2izrp3KOg/UT0vMVglZc9Ja3t7hRl4AqLhtUaR9ZgtChI7NWZtpa9Ct0f9yj3N9Un76fYg2TKsBGC+Fak7PyPOYH+mIyh/naM9bUp/N5A6T/n+Jo6XGt7DvR7TWpTY+KMBBQiwn9tyEzQAuq9D3Lrj828pXS4AL+pDU1FhQZbjvgngdBsbtrQV8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by DS0PR12MB8815.namprd12.prod.outlook.com (2603:10b6:8:14f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.35; Mon, 13 Apr
 2026 03:07:12 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9769.044; Mon, 13 Apr 2026
 03:07:11 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, skomatineni@nvidia.com,
 luca.ceresoli@bootlin.com, mchehab@kernel.org, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alexandru Hossu <hossu.alexandru@gmail.com>
Subject:
 Re: [PATCH 1/5] staging: media: tegra-video: add NULL checks for
 of_device_get_match_data()
Date: Mon, 13 Apr 2026 12:07:01 +0900
Message-ID: <546FSeECSqm-ORhiEUYCVw@nvidia.com>
In-Reply-To: <20260412205057.386856-1-hossu.alexandru@gmail.com>
References: <20260412205057.386856-1-hossu.alexandru@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY4P301CA0006.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::10) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|DS0PR12MB8815:EE_
X-MS-Office365-Filtering-Correlation-Id: 8241dd82-bbc6-4672-4abe-08de9909c18b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	sxrhAP+ubU9cPPlKXwG7VbmG/Qa9Cf/qMvV59lzYc43NU9Z+Yfpwd4zgdd7lUDdSjE3xBB0irhm8yqsQEt3vNI8moccWSKoeZqVmDszz84OTI2WQCToFlWbAmgsczlH4buwpPKf7fKq7KfTjRhVSZ/vmqs/X0CihYeQpfefWcPikmm+pigbHdbBX1TeERWBIBuDJNwznXxLc2ALCxg54VeJ2mJ7mMq7RlA9uE6pM4UjBrwxas5/aw/A+Ym0oE8sFHYpmUTBdGBC2k8hiI53wosxTn0U0nYRS1xlX7RTbzbC0nnJWCrdVsDwZ9l+Opw3Ds2nVtPFE0uBHJePoUGNvwvpKo4OkZHS5JaxhL4+lQTbwdUVaN6SNZeOk0uddy/wLYnCHTcEdHSZcSVlb89Ybpwso9xRh9FydMlClUkVIUP9Fr56uxrOGAokeTQSoMY3fxBnsPLe1JqOiYo6Mb/oh2ozKIZ95gt3d7IxUQFVnn5VHDQZ1viSeet1KUPEXz+ypLgabxmFQQhi2jb/vtEQRkmY+0ThvA1Mjx1e/4EKEhPAHTtIZ6aj4UUjN1/JL5v+zQGeN5UBWsgzfG8ep4zTyM/z6KhDWBjB/NaXn0bm1WVDS+yzC4h4vSyRIDT5rKuxJXyzDNHeBQUOITJHR6j0w9h+bDmJTOz2XFj5b6arkZEmPzA+I/khsQfFIfh1tiwvHUtYgzzK8ihh3KEMl0kbDy9hxqGgdJyMWP8vG+x/jMLU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnkvMzBLTzMrcG1VOW8yVlZYS2dCNndVL2MyQUdOazJrVWxUMEVUN3JuTlVn?=
 =?utf-8?B?K2ttT1NPS2crenRoRWs5bkp2dS9GMXd0ZlQrWW5mbGRnSXVDUEgrS3RYbGNG?=
 =?utf-8?B?eUttVm9qb0dVWHFJUUg0U2FRVE95NkwzTGVESW9pbHc4OXJzcmEyU0lLYmkw?=
 =?utf-8?B?REdtZklZMzhiL3VBMmVFRkFzaGRhakFybm5IbnExdE5xQkJ3R2dHek54YmJK?=
 =?utf-8?B?bHdGbjJQMXpLcGNxNjFoOXYzMW5UNDhvL0Z3ZllnM1VNQnc1RjdQWnVGcktK?=
 =?utf-8?B?NG9mMmVaRytUYXRRZkpWOWVNMTh5SlJ1MEJaa3FFc0ZrNS8xYi93NHBtWDZZ?=
 =?utf-8?B?TnhQc2tONDY4RWpXTjR5TisvRy9RL2YxdncxUlMzLzI1d2NkTE5OUXNyWEtp?=
 =?utf-8?B?WllhSlNteEVuUVZ0d3FBZVQ0Z2VBYnppM1IwLzNqL2pJZ3phRXFXR2VMdVlX?=
 =?utf-8?B?RStlZmpKNFQ2QmUzcTJiZ2E3WlMwQXYvQkxJR0lzS04vbGVxSDJVR1k1Qzlz?=
 =?utf-8?B?dTJEM0NjK1U5VjJqYnh5UmRZV29sd3RVKy9aaVVHM2JMUlhZbkUzMG8yQWpy?=
 =?utf-8?B?S3VYOGlaWUV4UnRmeVNOV3JzWjRtTzVMOTUwamR3UFJaSjJoK2c5c0s5UHRT?=
 =?utf-8?B?b1JJelBhaW5zTzJkTDJzTUl1SlNCYmtrWm5WOU10VnRSMm5wQ3QxWTE1Zm45?=
 =?utf-8?B?KzQ4NUFhRm9XNWU5U3U4WXVhMXErb0VzUHRKNUx5TFdrYVg4TVkvTVlpcWJB?=
 =?utf-8?B?MTI0WldwdEZ4MXRBU1Zud2RoVWloeVpLakNlU1V1aEtraFF2SnNjUkRadytC?=
 =?utf-8?B?ZE9YNTgzWEl6eEdubGVwc0NYVG4yQmdURERsakM2Tm9uK29hRWlUMzRyWGN6?=
 =?utf-8?B?MFN2dm14NnN0dlY2T3ZudEFob2ZRR2lqaWZISkR0T296eUpoSkxSWGRzWUF6?=
 =?utf-8?B?d0hTRmYzcWw1WWNucmJRdUszYU5LRUZ1SjNFeUNiOVRnZzUvMHhxZzV3UzRk?=
 =?utf-8?B?aG5Ja1doVlFtWmFxQmw3ZUlkY2V1UzlxdXoxVmlWWWhyM2NXdGVPaGwvZjZU?=
 =?utf-8?B?WFZaRG9sWjk3bG02ZG92NThZNzI0R1hKblhpSGdJVlpORGF6NmkwWWxtOFdO?=
 =?utf-8?B?NS9TbFJoUkNncjV6RTYxRStMVnZOeGw5ek1neTd3QUN4cW1jdVg0YW5xREk5?=
 =?utf-8?B?bEZydTZjR243bERnS2JKYWJCWjJlOGtrSTdXNnVVdG81ZS8yWWpRZ3hxbVhK?=
 =?utf-8?B?ckZKRHBuOU13Z0tWZ2FWT0wwRGVjYVZCdWUyY0JsNzNKd29WZGovR254SzFF?=
 =?utf-8?B?ektodlpkWUpvU1NBdFIyYzRVbnpTWm5OdFZUY2pIZDZvWVV5WUkvT2VLbk1D?=
 =?utf-8?B?M01zdHNONkQ4UW9WdDFFOEtDVGJrSDVRQ3poeWcybVFSMDg1Z0oweEQ0M3NJ?=
 =?utf-8?B?ZjVoeEhEdC80V1c5S002UmNWOFl2M2dsRHI4U1VYd1ZaK0tsU3BQT3d3YVNV?=
 =?utf-8?B?S3pmZzcrSGhtajZYSlVNd0NUbzFkbm83N2Y3Ti94VnBRM2dRR3RVSWJDT2xh?=
 =?utf-8?B?SmNPRlVKSW9qcEtnR0hrQUtEb21jYnpKV1g1b01LWm5xdUI0SFVDTEVCREw1?=
 =?utf-8?B?MVIrTC9pMkM2NGZQVTlHN0xXWnNQRjJjMVg0MDJtc3cxOFhuQVhtZHhicGV0?=
 =?utf-8?B?Wlgwc0dCaXllU0loYVBIYUdYVkduZEpabCtlTDRWVklQVm9GRGp0VUEyMmw2?=
 =?utf-8?B?M255UUU3azUwT1AwK3duUmt5azBrMmlpNmRRaVgyQkEyZUtUQk93dUhvcFIz?=
 =?utf-8?B?UEFJblFkU016RkhZQTl6Yk1JTlBPTStVTTlTVkJ4ZWpHMnJuWWFscTliYnhh?=
 =?utf-8?B?ckJNOEkreHpBTnowWmdUVUpaYVpaSVYvQmpoKzd6eTFVdjMxTW1YQjlYWXFo?=
 =?utf-8?B?b0ptQ0VoYUN5TEovT3BubGV5VjBoVjZjM3FUUlRNdTk3amM5YmVDa0pLbG9W?=
 =?utf-8?B?TlhyQk1aMUtqTHNqUkxEdjNLU3B4TDVxVHd3Sk5FbUFVYjN4eWdmTE5WbHR5?=
 =?utf-8?B?Um5ET0xiWndxTFFhYmZNVjhjS3VFNkY4TWI4UzJ4NFFSRU5JZjdTZ3IxQUVQ?=
 =?utf-8?B?b1U2amJDbmVGY3J0QzU5N0RJVS9sRGxMcGRTNlhOMXlMcWRHK2FIbnJmYkVs?=
 =?utf-8?B?enVGY3ptSUhjSkpYdnM4RDZld2JEeWYyWWErL0RXVi9qT3FnaEFUT2tUVmRT?=
 =?utf-8?B?NHFQdXMwL2lBWXJaa2E5cXc3UlVuaXBrekt0bWJ1RENJR3hxcTIwRUxhdXlD?=
 =?utf-8?B?VDBSM3QvSk02WTgrT1Jqa1ZuaEh2dWwyREdhai9aL2YyQWNqYUhPdU5SQVdS?=
 =?utf-8?Q?nbIppWBsxZx+M0RfVqv6y9SP+THafVFxLZYxE0jl5YGh4?=
X-MS-Exchange-AntiSpam-MessageData-1: J3tAn6sLBJVKRw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8241dd82-bbc6-4672-4abe-08de9909c18b
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 03:07:11.7036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JRhEfFGiZsWsofz6bk7Ug1nU8rnUsYSamvBw+Gtg1V7E3QS2e+7DyHQ4FZcOtiM+nvaSjGDhdZ38d9AeWnsfMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8815
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58619-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,nvidia.com,bootlin.com,kernel.org,linuxfoundation.org,lists.linux.dev,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
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
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,Nvidia.com:dkim,nvidia.com:mid]
X-Rspamd-Queue-Id: CBF3D3E6E14
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Monday, April 13, 2026 5:50=E2=80=AFAM Alexandru Hossu wrote:
> tegra_csi_probe(), tegra_vi_probe(), and tegra_vip_probe() all call
> of_device_get_match_data() to retrieve SoC-specific data from the device
> tree match table, but none of them check the return value for NULL before
> eventually dereferencing it.
>=20
> In tegra_csi_probe(), the pointer is dereferenced on the very next
> statement via csi->soc->num_clks. In tegra_vi_probe(), it is dereferenced
> later via vi->soc->ops. In tegra_vip_probe(), vip->soc is stored and then
> dereferenced at runtime via vip->soc->ops->vip_start_streaming(). A NULL
> return would cause a kernel NULL pointer dereference in each case.
>=20
> Add a NULL check returning -ENODEV in all three probe functions, consiste=
nt
> with the defensive pattern already used in similar staging drivers such a=
s
> drivers/staging/media/sunxi/cedrus/cedrus_hw.c.
>=20
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
> ---
>  drivers/staging/media/tegra-video/csi.c | 2 ++
>  drivers/staging/media/tegra-video/vi.c  | 2 ++
>  drivers/staging/media/tegra-video/vip.c | 2 ++
>  3 files changed, 6 insertions(+)
>=20
> diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/me=
dia/tegra-video/csi.c
> index 7842104ca933..33369a8c803a 100644
> --- a/drivers/staging/media/tegra-video/csi.c
> +++ b/drivers/staging/media/tegra-video/csi.c
> @@ -781,6 +781,8 @@ static int tegra_csi_probe(struct platform_device *pd=
ev)
>  		return PTR_ERR(csi->iomem);
> =20
>  	csi->soc =3D of_device_get_match_data(&pdev->dev);
> +	if (!csi->soc)
> +		return -ENODEV;
> =20
>  	csi->clks =3D devm_kcalloc(&pdev->dev, csi->soc->num_clks,
>  				 sizeof(*csi->clks), GFP_KERNEL);
> diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/med=
ia/tegra-video/vi.c
> index d1d934e361f7..f3b749f059f8 100644
> --- a/drivers/staging/media/tegra-video/vi.c
> +++ b/drivers/staging/media/tegra-video/vi.c
> @@ -1907,6 +1907,8 @@ static int tegra_vi_probe(struct platform_device *p=
dev)
>  		return PTR_ERR(vi->iomem);
> =20
>  	vi->soc =3D of_device_get_match_data(&pdev->dev);
> +	if (!vi->soc)
> +		return -ENODEV;
> =20
>  	vi->clk =3D devm_clk_get(&pdev->dev, NULL);
>  	if (IS_ERR(vi->clk)) {
> diff --git a/drivers/staging/media/tegra-video/vip.c b/drivers/staging/me=
dia/tegra-video/vip.c
> index 80cd3b113125..148c68ceb605 100644
> --- a/drivers/staging/media/tegra-video/vip.c
> +++ b/drivers/staging/media/tegra-video/vip.c
> @@ -236,6 +236,8 @@ static int tegra_vip_probe(struct platform_device *pd=
ev)
>  		return -ENOMEM;
> =20
>  	vip->soc =3D of_device_get_match_data(&pdev->dev);
> +	if (!vip->soc)
> +		return -ENODEV;
> =20
>  	vip->dev =3D &pdev->dev;
>  	platform_set_drvdata(pdev, vip);
> --=20
> 2.53.0
>=20
>=20

These devices are only probed through device tree, so we know the=20
returned pointer is always non-NULL. Typically we don't check in such=20
cases.

Thanks
Mikko



