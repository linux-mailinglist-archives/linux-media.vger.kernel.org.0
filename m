Return-Path: <linux-media+bounces-55638-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLfUFCDfs2ktcQAAu9opvQ
	(envelope-from <linux-media+bounces-55638-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:55:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F25A280F32
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:55:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4C625303499A
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 09:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 226D82D8385;
	Fri, 13 Mar 2026 09:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="Yms4eO/5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A956F38B7D5;
	Fri, 13 Mar 2026 09:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773395739; cv=fail; b=L+GvIF/DkCQH7ywGE8FC4xdWiH0hk8hb2PmmoWDtbVC/+4I1lVbd6V6sfyubR8ieZPC2Qdlh7MoZv4teehLUDnaBqYx+6cpkuU55F7NmKxH6yuDyaFB2RhQzngyruV824G9aMiMjQ46xADtaDKioBuY90PKZ3edkonJLmSSNpDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773395739; c=relaxed/simple;
	bh=ntfKl3XMkCadjgjWb/LzNX8pwzAAYTyzIMF+AXxJtYc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mYG4GBBp+mr1lyF/g00uGOZS45wTOQAyTbdlXDQuMeHjg40ZZwauVbFEEp2gafhK/AiutQfS8q7poRQPeWW7LsWT4N+LLBrHqzs9cj2Qh4jVWgAfTndnmPzx2t8il2nuc19SNnOcahUfSYbF1jhRBoFHjodoQfRlUIguAiCpLC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=Yms4eO/5; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D8jQ56314659;
	Fri, 13 Mar 2026 02:54:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=vvpkfpDjx9q/sPQ1GUKeEXj63VxEYEraPyon3W0heUg=; b=
	Yms4eO/5vmqOUg8n5/vxyXLHWINmg8F0k6/gByaVGzdnGqxAFFgES81/6bciZvK3
	VO2VQSDVuRQlW5I3vqwOTBDlZHOf9LBojng2P4WiGVNEj/ISORQis97hpWzwHG2J
	DuKAf0qKM7J54yxYVGJygWS1opX4Iz/sJTngnvyMJODXgYPJ7dqjgxSYBqdrauIg
	Wf7jyGNpm+nrVePGwNpMweDbqpN7pyRN1qRmXPr/+NxY/aun/uSWHHzQxIVfhCqE
	vwCtMxVTRqVJHfwJ1fN87Biz/JpsTMGV7H6SuzhLSMEg4G8GuNpMkkHkUvcRBwLc
	gC6Jg4STsGZZk5x92ZGVAA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010021.outbound.protection.outlook.com [52.101.201.21])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cuh6psxpf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Mar 2026 02:54:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M+3ynRpTyJQUlA6fM/omEIfeVplpkw+DtZvWhhvzGHcRv+bh78OKEXGenEeYk4mSh/qeoFwY0F/CmlGImHJs+WOzkboiTCMjp200tuOkB6VeEKJjEo0iNv+KVDWhtQu4xFRucH88lXJ6y3pKl84cdCARRZfseBZ3EjrAJxm5lSMlEm0mI14OvNLGz4K/dB7bvG392pkkQNl1m4V7dWEu5n3JV+HilIhAZFhUl/9/qcUuQ88+53EKHI+jt43SAONSKqJvyUWzfktaAy8+XPFFG7WG8fw7qFE+J12NrxJCrLBiqFrcLFqmTZ518fzRrDsfslSFDyiimG2H0dGH3lcNHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vvpkfpDjx9q/sPQ1GUKeEXj63VxEYEraPyon3W0heUg=;
 b=mmGaXCVm9aIT55I1wWAMJ4oelxLa+O5e06R6QAM5ryjPFGG3rjbPZAZLADDuYvgNLWuCKvRSr3w1WU5sQ+Encu0gdFB1XMKv0bJD2JFQyABGlbcOe+GZgImk5EsjGcYtTZY8fMEanJjDYfqwVwYBuj5AGuO/wNebbztnttxzVrIw0p+/gOn0QmzRB6pQK4giqUCPKE6U4lfjeciUJ+ato7mLoSXyR1KvU8mTXXWhj1FXv2gdXP+Ng/x2udNrBbhgi6ejrv1bmVjPy1kIB4OhEaSlG9FVr7ztNm3m6+3W5hYVVkAT9oLEA3pyr/UhaJOUgNszaUkL9FKObQ6XJ4+gOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA4PR11MB9201.namprd11.prod.outlook.com (2603:10b6:208:561::16)
 by MW3PR11MB4620.namprd11.prod.outlook.com (2603:10b6:303:54::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Fri, 13 Mar
 2026 09:54:49 +0000
Received: from IA4PR11MB9201.namprd11.prod.outlook.com
 ([fe80::2561:13a:5b6e:7927]) by IA4PR11MB9201.namprd11.prod.outlook.com
 ([fe80::2561:13a:5b6e:7927%4]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 09:54:48 +0000
Message-ID: <f9c2542e-cb04-4109-920a-d7cea7f90d0e@windriver.com>
Date: Fri, 13 Mar 2026 17:54:39 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: rp1-cfe: Fix use-after-free and double
 initialization on sensor reload
To: laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
        kernel-list@raspberrypi.com, mchehab@kernel.org,
        florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        hverkuil@xs4all.nl, sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260212085526.1598770-1-xiaolei.wang@windriver.com>
Content-Language: en-US
From: xiaolei wang <xiaolei.wang@windriver.com>
In-Reply-To: <20260212085526.1598770-1-xiaolei.wang@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SE2P216CA0045.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:116::8) To IA4PR11MB9201.namprd11.prod.outlook.com
 (2603:10b6:208:561::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA4PR11MB9201:EE_|MW3PR11MB4620:EE_
X-MS-Office365-Filtering-Correlation-Id: 71fa52c1-3800-4cc8-cf28-08de80e68faa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|7416014|376014|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	VNGixr2zjLQ7LraB2qNio9nuEfA53JoGNj3i3yOkqdxxy5yISjd69TbKcVwwV5z55gAsBjUyWscXh41Di+bJEcPagLzWnB0948CmyW/dm4xZqHytaMGyOtbgSvN9xg4fL8QyjrO6IRZZmYbKW0WYksheVLrPwQEU5EeQwDZAlkewuG6ksZcOOOxLTREEZe+RIZIFB4poSwBA2SPEse5BgAZ+9snRx4Url6WoRF7CDuMFuZUioFSMVE07T+CcbmfLDvtP/ZOgSqMYsyDk4ILxVAYk2PLBJBPQiA/8VRqKiogdnpqhBIcZhBXG3lG4Ch8RbOML7/VCoiIxmVJoK3DjF8u0TE2nNpVAr0hqRI37tN/QakPQVHfTj974+BMAR/Fa3LTWHirOzz5NVsiN952wdVZP0Y9gXj/ucX9AiChFh1ZXsfr/JUhTttXtgtIaJ2MU9/OcHhixnNbOxQJr66VMgs2/0SadSyLzej62QZmnu0nYkcej4FY6x3/xqyKxuiFxYN0kwVzyejBbCMOz8u+oFfqrAmuTQWt9fauBOWcU8KOB49WX1uLmV5hWrEOt1+9Cx9lelciHk/zB11BsFcAMMkuZ/T6npB43kM3xfH4e+kgSzb0E2+lvjRE3RVhElEayVQJPBtC1BSCqLXM/ggLy57bGmnTDDT/iyyJ3MbQ//768hkGpnHYelOzapDYUZFv/J5rYpLUwjikRzqwELYJO7WzXuj1vgAOoL06IeUwRt4Phuxim883+lCcFFbLNxgNq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR11MB9201.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(7416014)(376014)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXJLV3ZqOVVhMk4vR0JWOG5CMjJuSjBMeVlvUXFUd0w4Z3YwVDVCVXIreUpL?=
 =?utf-8?B?YWNRT0MvTUJjTGJ6QStOVno3ckRRbjU5Nnd1bUwrQmV6bXoyRlc1T1plY05E?=
 =?utf-8?B?V09Pa25qaTBHWW13TWlDVFF0T09PNk9YM09FalBzV0V1eXN2d095OXkrRi9N?=
 =?utf-8?B?S09KYWVWdklQYWhFUDRScnpRektIV25lRG9qemt0aEo1NTU5VWxqWVpxWndm?=
 =?utf-8?B?UndjSzZpWThoVHFQQTkxQ255ZmdUdzFTYWFSUklXRVpDeHJEYm1KQURpZ2Js?=
 =?utf-8?B?TEYxMFpGZnB2cGljNFI1R2w4bWpZWEdlUGw2MUhmRlZzZ3VqOGhIQjNaTXRP?=
 =?utf-8?B?Uk1kdGNtbnlmM3ZrMi9peEZkUXBSQ2syTnIxQjh1Qis2NG5JRWc5K0ZQL1ll?=
 =?utf-8?B?VFJQS21wS3hrQU1Pb2MwaTJqR1VPb29KM0hFTk9zZnZPZWttQTBadFpBbTdI?=
 =?utf-8?B?aGRMblQrZTl0NnZURG51T3hDSE9USXFwOXQvMm9IOUVEek5sSHl6dHZIWWNM?=
 =?utf-8?B?ZUdRUGNkQmxvbGJnRTFSNUFyZExCcnBUdzJhTVVKYW5KaWNlUHlwNHdzNmxr?=
 =?utf-8?B?V1U0dG1Obk9TaVEyV3VST0ZvZCtvREpMUVNkOEo3TlNvVXQxOWtYMmVLWENj?=
 =?utf-8?B?SW90aW1pTCs1ZytVcU5NVExCTmN6cHZEb2RtZWMxODBCcUxjTDlwYUVhUFpE?=
 =?utf-8?B?YmlLQXZVb1o3VlpuaWtnWTJxaUlaUjhKUUZIRHlpWXFyNHJMeW12dlB6bjc0?=
 =?utf-8?B?Tllra3pSNHNxdXlIOUJSV1ZoQ1hBTHMvNTFVYjV2UTV4eStGQjYrRXBjdG5t?=
 =?utf-8?B?Qy9RR2JibzAwY0dMcm9VbVlVSm1wNTkvN0FIYmlDZUp4c3BLdWV2clhDQytZ?=
 =?utf-8?B?cEY0L0o3T01KbEZpQWJBZUxLN3E0OG96TE96VloySEJvT1MxOWJpdGVmSXVQ?=
 =?utf-8?B?aGF3T2Vvd01sZlZTdngyMksrd01SK1pDdEw5dzZaRFBIaW1IaTZHU0FxYit4?=
 =?utf-8?B?bW9KdUtmbjFnZEV5c3lsL2ZSRTFieVRIZXB0dHFsM2VXUVR3T2NrZUVoWHFI?=
 =?utf-8?B?TTNsYzNRQ2phQ2hLb1EydzFkSHhlS2dLZWhBa0tlTzZvYUkwTWhSOEJOamZo?=
 =?utf-8?B?bUxNZnVXR0hNUVIxbFhqS0RlOTk5SGw0RzdGRlhwb0dUR0NGV3BGZnk1RVZ4?=
 =?utf-8?B?ZElYcExMbk5tRWtqSXJjaGduV3J0d3ZoelhIaXNUUlhpYXZJSEdtY3cwTS9t?=
 =?utf-8?B?QlkrRnJHTkl2emZDZXBwdTVNY3lWZjZrT2RkMElGcjhjaGZWWEF1N2JZVTNX?=
 =?utf-8?B?SlFYSlh2bmIvajFMYStCa0t4bE51d3lma2drYkhQOW90anpNK3VZbkxvb1Np?=
 =?utf-8?B?ejJSRWRUVFA4NGdDM0Y3ME0zQnVDK25aMUliR29HUmJuR1JBTVdyZHRGWGty?=
 =?utf-8?B?TmVpdXZKdEJCc2w5RzlYRHhFTHlUR2dxdytReVFzTWpQeWJyZ2ozUk0zZDNk?=
 =?utf-8?B?K0hVZU05VHgveVpERjdCSGNqUW80NlpMSWx3dTlrb3pYOGZiVEVhS3UxeUta?=
 =?utf-8?B?MUdDOHp6OUo0eEYzbHJvVjdQR2Z0U3BLUkhoa01pSk83OFhGRElIQTdzMkx3?=
 =?utf-8?B?RTFJMWM5SVo2cHVtTm5GeDJ6M29TemMvWGhESGxESkw4QzBzNVlTSTF1dDli?=
 =?utf-8?B?S2trUzRWS01Xb3MvSndkbElSNGYza0ZaaVdoSzE1a0VtS0VFYjRnSFNiVys3?=
 =?utf-8?B?VGs1R1RiNFBCYVlLL0J1UTkxNWNIZll2dFc3VnZNUW8wQWZiNjM4bjZuQlor?=
 =?utf-8?B?Y3R4dFN3a21NVDRmc0QvTWhrR0ZCVzVncnhPNmZ1c1JWMjQyL0FNRVV4QlFF?=
 =?utf-8?B?SEYwWHdNN3RkWGoyeXFOSnFqdFV4NWd2eENaeWNNN2VpaCtWb3dQY0U4dmpr?=
 =?utf-8?B?YVhqRDZFWjFjZlljajlIWjFWNUFSaWVMMTNqOGk5QjNhbkQvWXRkMFI1UzFX?=
 =?utf-8?B?VjJBNXpJS1YrQnRVb2gxNzMzajU5UlpVanc0NDA0K2Y5RVVLN1ExQ1c1NWwx?=
 =?utf-8?B?bEZUS3pxa1hkOURyd2l5aTg4UnZydThoU0JZZWU5eVVhWnB3SkVsa1p1Y3hG?=
 =?utf-8?B?RG1zbTNEWGZhc2dEbDFwM2w1WTlua2NpYjJxUGhpeHlWdlZoVnVDdnprK1dt?=
 =?utf-8?B?SlhnSVNQNFFKdmtiSUFqRHJmRUhUOVBCSk1jcDZyV0ZyamYrSmMyaWcrWG1R?=
 =?utf-8?B?NW5VcHlSUjBKcGMrSnlpbWZuVk1UTDJDTVdxc2djOE9tQVd0R00rSWswQnhW?=
 =?utf-8?B?RWd0ZyszY0tESWltbU5CTVNidHZlV1NzLzdFSCs4Qm1BYjljd21VZmkzZ1ZG?=
 =?utf-8?Q?hDqn2XNm6Tj444bgVVaQ65iSgteKyBD6/BnmBeYXtPJO3?=
X-MS-Exchange-AntiSpam-MessageData-1: Sdg773eQrxajN7RMA7622eHeNF9Btiuh49o=
X-Exchange-RoutingPolicyChecked:
	iSGs4Geci1BxrjeDktDBM/kndsQGj+mE4mNLtUSLZbQHlSZsn4E46daIwe/UZx5yxPMcx2FZyv5wSeTC7fpvXMKG8MDyO+DUXZ/5uYNIOm6aWZOe3ADMrDUA8lrCDNudlgCyDn1qWRUm8IdgUwn+X2EnnP6gHOIBB2QPUFGtom++oG1FQdVo5ejDilNR35qDt3ZCbZcY3lGsiRslsNnoDjve/J5vyVmUyE6jfrE7EqRXzASsz0rSYRndWa/Z60ZG7+sV8YXhNrnCvgz3tIw08fQ5D1QLZke+uw7B2lJSswLt+m63OYtRumupSfsyp2SYTuxTBy+WzU4NUfyOctrNqQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71fa52c1-3800-4cc8-cf28-08de80e68faa
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9201.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 09:54:48.0225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8F35VdtEpOjEmMSuzTiU/+cSu8lqmPdWqxrBlItJG2J3s3E/PTtevv0MIf3RyKHxhO8Za17Ylmy35ACFc6rsx9u5XkxWiYRoOnQ7B/WWSH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4620
X-Authority-Analysis: v=2.4 cv=ePAeTXp1 c=1 sm=1 tr=0 ts=69b3deec cx=c_pps
 a=6AoXFOUR/bGkQ75sV68CBA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=xq3W2uTSAAAA:8 a=t7CeM3EgAAAA:8 a=vCu5_Bj6950hr_fNJdoA:9 a=QEXdDO2ut3YA:10
 a=P5L7wpMTXyg1GfFA3Gwx:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 1wooJmckVxdh5x80hn2TB9j-KnVga-ig
X-Proofpoint-GUID: 1wooJmckVxdh5x80hn2TB9j-KnVga-ig
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA3NiBTYWx0ZWRfX763JCBOHSDFW
 dkR+stX/HpgDQIT/xnIWri2aFBnHHEX6hcy8i11/Y5DIwJ2QSEvLgAaKjxqsKrx7BhjnkFj0EGZ
 s/1bvr81AoQxlasvtuoaWQ3Zj/hRoaCKtQN2UXz+N9Y9/ur3NPktRPTYdAhnnI4ELhVaZSfjJr9
 CtOGnsoTCmiDhfbLqE9Y4Vgr36Q+isHtRKcZ62NG27jVG0nS3GFL92L5PuvSoGRq10+n9UTbLup
 PsZx+MGbdlkynwWuOyL8xd1kXmt/9lyaWhPy8cpaQhId1QtTfZexWtLDrthTXRvLqcu8Tcv3lhT
 2drX15TpEWIDpv0NYSnLu3MQJnUfrpii9M2lgTnRvfvFDpc4kd4JF+yJRUif/6ngsLs7REufxxW
 7UU2A0FiKs3wPNoEvMxQEV4bL08l2NL7abEqhlN2gxj0M9cvsafZMCzUKYBP6Kg2H4EFBnrdfl6
 fG0ovrKUgDcQryuMd6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130076
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55638-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,raspberrypi.com,kernel.org,broadcom.com,xs4all.nl,linux.intel.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[windriver.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9F25A280F32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

Gentle ping on this patch. It fixes use-after-free and double
initialization issues when sensor drivers are reloaded.

Any feedback would be appreciated.

Thanks,
Xiaolei

On 2/12/26 16:55, Xiaolei Wang wrote:
> When a sensor driver is unloaded and reloaded (e.g., rmmod/insmod
> ov5647), the cfe_async_complete callback is invoked again, causing
> multiple issues:
>
> 1. KASAN use-after-free: The callback accesses the sensor subdevice
>     that was freed during driver removal, triggering a use-after-free
>     error
> 2. Double initialization: video_register_device() attempts to
>     re-initialize the video_device kobject that is still registered,
>     causing "tried to init an initialized object" warnings
>
> Fix this by:
> - Moving video node registration from cfe_async_complete() to
>    cfe_probe(), ensuring video devices are registered only once
>    during driver initialization
> - Implementing cfe_async_unbind() callback to clear the sensor
>    pointer when the subdevice is unbound, preventing access to
>    freed memory
>
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> ---
>
> Changes in V2:
>    Register video nodes at probe time. I've also updated the commit log; some
>    descriptions in version V1 were inaccurate. This patch resolves the following issues.
>
>    1. KASAN use-after-free: The callback accesses the sensor subdevice
>       that was freed during driver removal, triggering a use-after-free
>       error
>
>       KASAN: slab-use-after-free in cfe_async_complete+0x3a8/0x470 [rp1_cfe]
>       Read of size 2 at addr ffff0001182fa0b8 by task insmod/742
>
>       Call trace:
>        cfe_async_complete+0x3a8/0x470 [rp1_cfe]
>        v4l2_async_nf_try_complete+0xec/0x140 [v4l2_async]
>        __v4l2_async_register_subdev+0x13c/0x3d0 [v4l2_async]
>        v4l2_async_register_subdev_sensor+0x144/0x278 [v4l2_fwnode]
>        ov5647_probe+0xa28/0xd80 [ov5647]
>
>        Allocated by task 220:
>        ov5647_probe+0xc4/0xd80 [ov5647]
>
>        Freed by task 737:
>        i2c_device_remove+0x88/0x190
>        ov5647_driver_exit+0x18/0x48 [ov5647]
>
>    2. Double initialization: video_register_device() attempts to
>       re-initialize the video_device kobject that is still registered,
>       causing "tried to init an initialized object" warnings
>
> Link to V1: https://patchwork.linuxtv.org/project/linux-media/patch/20260211034501.1815035-1-xiaolei.wang@windriver.com/
>
>   .../media/platform/raspberrypi/rp1-cfe/cfe.c  | 39 ++++++++++++-------
>   1 file changed, 24 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> index 62dca76b468d..c6ba71d1f0d7 100644
> --- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> +++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> @@ -2151,31 +2151,19 @@ static int cfe_probe_complete(struct cfe_device *cfe)
>   
>   	cfe->v4l2_dev.notify = cfe_notify;
>   
> -	for (unsigned int i = 0; i < NUM_NODES; i++) {
> -		ret = cfe_register_node(cfe, i);
> -		if (ret) {
> -			cfe_err(cfe, "Unable to register video node %u.\n", i);
> -			goto unregister;
> -		}
> -	}
> -
>   	ret = cfe_link_node_pads(cfe);
>   	if (ret) {
>   		cfe_err(cfe, "Unable to link node pads.\n");
> -		goto unregister;
> +		return ret;
>   	}
>   
>   	ret = v4l2_device_register_subdev_nodes(&cfe->v4l2_dev);
>   	if (ret) {
>   		cfe_err(cfe, "Unable to register subdev nodes.\n");
> -		goto unregister;
> +		return ret;
>   	}
>   
>   	return 0;
> -
> -unregister:
> -	cfe_unregister_nodes(cfe);
> -	return ret;
>   }
>   
>   static int cfe_async_bound(struct v4l2_async_notifier *notifier,
> @@ -2204,8 +2192,19 @@ static int cfe_async_complete(struct v4l2_async_notifier *notifier)
>   	return cfe_probe_complete(cfe);
>   }
>   
> +static void cfe_async_unbind(struct v4l2_async_notifier *notifier,
> +			     struct v4l2_subdev *subdev,
> +			     struct v4l2_async_connection *asd)
> +{
> +	struct cfe_device *cfe = to_cfe_device(notifier->v4l2_dev);
> +
> +	cfe->source_sd = NULL;
> +	cfe_info(cfe, "Unbinding subdev %s\n", subdev->name);
> +}
> +
>   static const struct v4l2_async_notifier_operations cfe_async_ops = {
>   	.bound = cfe_async_bound,
> +	.unbind = cfe_async_unbind,
>   	.complete = cfe_async_complete,
>   };
>   
> @@ -2243,6 +2242,14 @@ static int cfe_register_async_nf(struct cfe_device *cfe)
>   	cfe->csi2.dphy.max_lanes = ep.bus.mipi_csi2.num_data_lanes;
>   	cfe->csi2.bus_flags = ep.bus.mipi_csi2.flags;
>   
> +	for (unsigned int i = 0; i < NUM_NODES; i++) {
> +		ret = cfe_register_node(cfe, i);
> +		if (ret) {
> +			cfe_err(cfe, "Unable to register video node %u.\n", i);
> +			goto err_unregister;
> +		}
> +	}
> +
>   	/* Initialize and register the async notifier. */
>   	v4l2_async_nf_init(&cfe->notifier, &cfe->v4l2_dev);
>   	cfe->notifier.ops = &cfe_async_ops;
> @@ -2252,7 +2259,7 @@ static int cfe_register_async_nf(struct cfe_device *cfe)
>   	if (IS_ERR(asd)) {
>   		ret = PTR_ERR(asd);
>   		cfe_err(cfe, "Error adding subdevice: %d\n", ret);
> -		goto err_put_local_fwnode;
> +		goto err_unregister;
>   	}
>   
>   	ret = v4l2_async_nf_register(&cfe->notifier);
> @@ -2267,6 +2274,8 @@ static int cfe_register_async_nf(struct cfe_device *cfe)
>   
>   err_nf_cleanup:
>   	v4l2_async_nf_cleanup(&cfe->notifier);
> +err_unregister:
> +	cfe_unregister_nodes(cfe);
>   err_put_local_fwnode:
>   	fwnode_handle_put(local_ep_fwnode);
>   

