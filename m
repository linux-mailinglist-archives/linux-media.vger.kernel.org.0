Return-Path: <linux-media+bounces-29923-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A941A843E0
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 14:59:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B28B1B852E9
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 12:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12DA928C5A1;
	Thu, 10 Apr 2025 12:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tdIvTZsr"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27CE2857D4;
	Thu, 10 Apr 2025 12:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744289907; cv=fail; b=AT92zLCdlI7q7tslG1ve58//b7MloHcIrDTEZfqNK4R669dG9B7KuhWa0mJH5FTRs/nqZ9TDRAsNGmgzsum1Z1/DBLAYS0LHw7gvr+HS9i74iSc99X1qj9BG5x72FVkbzjJ11rqFtps0fj0UToBNbPpeJoo34CxQ/7gj4Nfl1Lg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744289907; c=relaxed/simple;
	bh=0AXeYaqocxy5QXWATgDdhRWeZLRLvs8pDVX31CFQiPE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Gl9NwJdYE0nIn/jZ2TKfWHNc09foMKVKh/9gYfjhR8ILXsFHi3wMWA20LbAMAzPnzLuhFHEtHekKbZQ7Z3xtCNtimllVt1tvpEQa4c3ogCOZm9+6eGCE5uyJG7tkKOjr+rUszS307uhgV6zAx+o09S/Wvcmnq4pYx4otu2Y1LEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tdIvTZsr; arc=fail smtp.client-ip=40.107.237.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UWd1B3wUVNrQ3Z6uyKPtZje9/GPwTgexeodY5vG48zbMIYz4wREDyBfFplKbig0LkjDHVIvbbt5G2CrBBHpNgROi/XjYxB93wY6hIUloOwk7s4owdZJbQKpfPnaY85O66vMn5WAwxL99b/I9Y/f+CZZ/Dqw7lUj/4H/9sN/hdE1ad83KSyZXC9t9bZlvjOt85WiEQxc0z+/H7iMw9MzsbCVJSqXPIXvCbGMXFmVARs+ID/5VFYaegzS7OzesUkOiGQGSsk823EkYgQ7n5D0VugD0YRD6B6q9XWdIxIW6qh6hZcZyF1u91uyNeelC0i4Cr3Xw1MdruKD5n6SooaAxiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o1PeelSQw3yt4qU5C3C40WP6T8g8WFj2RpNDhJUWCws=;
 b=dbzCmtmUJCY2bgv2Q3duna4v7yerrLfrXAXbdw37Fwp8I3zuox5iaZ9qVB6ibJnMLn/7BrAk9mlpyOIOzvPEhtqgTa41VFFStixdayJ2e+kpyTeYuPAf7AdI7Ka7raZR2FbrNXKP+YpMzh+U/WqdOB1/Agg0xOuMPp4FkAAoq0ygTZTj3OWCZCxCA0646Q66liNhLrHv6iDizI146NzUfhfGvb9WXrC7xrH31JItoXcSn0YzHurWNx2LvZ1PzT/RUSsE5ZWgSzqLFD5hL5NhVS0Ka514Vg0WWUXOonOrL2XJy/XYeyPpapmYI/CDcdZZT0YyLtmkO0/t6R+1jCKpzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1PeelSQw3yt4qU5C3C40WP6T8g8WFj2RpNDhJUWCws=;
 b=tdIvTZsr7MsypI8oyMyOfJ67QKvyS6euAeA1sDUWvw/yqvIzAR4vTNWtZYs5DEQSZ3OlR8g51IDLKLDg+3EOowIx7UCQo1ERgG+jq6dYvsCzF8GLnpiY+rRB2+YHsxyqwa1m/oo1/b6DzjIl8Uzg72MXkFwThhdptYREkypaTeI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB9491.namprd12.prod.outlook.com (2603:10b6:806:458::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Thu, 10 Apr
 2025 12:58:23 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 12:58:23 +0000
Message-ID: <8583665a-6886-4245-be49-fd8839cfe212@amd.com>
Date: Thu, 10 Apr 2025 14:58:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/nouveau: Prevent signaled fences in pending list
To: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sabrina Dubroca <sd@queasysnail.net>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 stable@vger.kernel.org
References: <20250410092418.135258-2-phasta@kernel.org>
 <20250410092418.135258-3-phasta@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250410092418.135258-3-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB9491:EE_
X-MS-Office365-Filtering-Correlation-Id: 88fb70e4-58ea-423e-5d79-08dd782f6038
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cHFFeHp1V01TVER6NmF5WVlVV2QreEI4T2RabDZ4VWpCRW15cFl6eHEzVCsw?=
 =?utf-8?B?WkZFRUVPSzlxZVVzNEcvdnRBU0k5bi91Qm9nb3JBMWdvUVV4RWdOWHlzTWZL?=
 =?utf-8?B?dXppUG40NDVSNy9Lc1cwTlpXSEJjRUJiREZaa2ZZL2UxejlVZ1c0SHcxTGpa?=
 =?utf-8?B?Z0FOWnFudkQ4dkxWdkEwTzJjSzNZWnZ6WUZ5Vzg5UzFSLy92M2RmOW1KV3BJ?=
 =?utf-8?B?QUo5Z0lpVkdDbG1hZEpMaUluelpLalEyQUJXQUE2T3dzZGg5L2h0c1MvWUFG?=
 =?utf-8?B?bXBCckpRUEVrZHpqU2pWNVlLdjduaEFyR3Q1dE9TaU8reFFtVStCUkZBRWx2?=
 =?utf-8?B?Qm9nSWQ5ZzZ6eENGdU1LbGJ3VWhBQnNqcWhIdzNNWm9vdDh1Zjl4RGoyYm0r?=
 =?utf-8?B?eXlqTGRtK2M3dzBFdXJmUW1oWU4xb2FaNWF1c2JxRDJvY3VXajExSGdIaW43?=
 =?utf-8?B?Vys0NjU1UlJDKy8xc3NNdmxmbkx2NlJDeFNWTTJXYkNnU3U4NjQ3UDZ4T09K?=
 =?utf-8?B?L0IweWdLTTdNTlNHNVFjTkxZNjExZEZXM2QyMy9tU1ZHWnRJdUI1VThxdkxE?=
 =?utf-8?B?UENWcnA2ZVpaQmVzdG91Q2p1cXVBZDVSb2FJNnFvU2RXcUIxdlQ4M0JZbXY4?=
 =?utf-8?B?cFZiR0tFWmpyYmc1dzhTb0FxWi9mZ1lrbURyelJ1Vitvd0R1UGYzeHJZM0xK?=
 =?utf-8?B?ckNGc25SVGlXaTBPMVlRM1dMa0ZrdmhDSVNvaHFWS3gvd0JhQmIxYW1sNktw?=
 =?utf-8?B?OXFpRDBDTUY0OFd4ZmVUYTRLRU1WMlVYUzE4Q3BvTUlhMzFRaWV0WDhRZlBi?=
 =?utf-8?B?QnBkYlVEMVEya3lFZDQ5aGNCb0V0c0RjZzdzTGo1NkRGS3hBVFlRVnJIM3Mw?=
 =?utf-8?B?NzVuRWpnQWR5OWZUNnV6WUJ2aWp5V2dLSVhzSFluSXRMWEVnVlVodXV0RFlN?=
 =?utf-8?B?amt6bVR0bytaT3RZM3hiT0JTRzQ3eWE3bHYxdlQwbzJWbEVZNnpjemhYOSt1?=
 =?utf-8?B?V21HT0ZiWURxWjNHTVIveTB0TnRSd0VWZndya0RCSFBNb0tDK1JFaTlnazNX?=
 =?utf-8?B?QzJ5bUdOOW03K3plenh5aHIzNlU5M0x3U1MzWk16RjB5ckVXSEM0bzYxTlZM?=
 =?utf-8?B?bXBGRXBTWkV5YTBNYUlVbXlDbXkvZytwMWZQVXhRZDdyV2p0STlzQ1J0U2cx?=
 =?utf-8?B?eWZicmo1RUgwR00xZEMzNFpsZmYwTkNWMXFTcmE0R0FnZkFnZ3pFa2wxYk1h?=
 =?utf-8?B?LzlxbmxkUVIwdG13aHpqWXk5WkpPTEFCU1NXQXA2RFBoQjh5MndKVFIwUmQw?=
 =?utf-8?B?V0ZaYUxINW1JN1NldENnbzNOU1hmb0dIa0ZlM0RVRURtMm5oSStNbEdFTlpT?=
 =?utf-8?B?MWRVZTRDYTl6RVVZcVdyOEcyS3VIbmpybDd1TERrbXU5aGYzQmRYOUVBM3NI?=
 =?utf-8?B?enpma2pMVEsxN3RIZEg0SmpPeDJoZkRVM1lJTGVkRWRhcmdzczQza25maElV?=
 =?utf-8?B?VXBKU0dCKzZEVldtTmtWSTVxWWtqeEdxR2lQWXE5VjVmL3JmNUp0MjBaN2M1?=
 =?utf-8?B?VFJ0RmZmaWlXWXB3ME51UlEzRHRIa3dCNkZKRWl4OVVuNDBJbmdYN29tZ2d3?=
 =?utf-8?B?Ym0xcUN5bVVGcThpZlBCNi9pN1EwTTVNWG5FakViS3VvVWRtazN2YVU4ZE9n?=
 =?utf-8?B?TE0rUE5nMWEwc2EvSEJleGFxN2s0S3BPdjA2cWtmcHdQOVhqQzdKdnUxczZV?=
 =?utf-8?B?SFl6ZGxXNUk5ZTZsYk9sS1JJUUlTdEp5VEszZmNiNUhNdnZhWkhEa3BwQUtV?=
 =?utf-8?B?L0xLdDdhajY2dVF5QktQbzVaQWNnUlBoS2piOTBTMytXSUNYdjBwWlRnT0Q4?=
 =?utf-8?B?QkU1b0Jrb1FGc3pOTGhPSldHTm52SCt2WjBIa1o4T0VEQUoweWR2aGVFWXJI?=
 =?utf-8?Q?eT34H0W8b+0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0xUMk5CcUhubzU2RjlVWFBmWlhraGlIR1BwbTVDRTFEcGNKZEdseGJCaWIr?=
 =?utf-8?B?RkRhYW1iN01mOW01cS9TWHZJZWV1bHBLL2lHUktkeldtVTRsVkEvYk9NbUQz?=
 =?utf-8?B?eE9WaFBlcm5uREU0QStBeHVOZWRSTHNGOFR0R05Zdk9rcENpZWFLek5JcUQr?=
 =?utf-8?B?bTVDT2xlWlE0c2xnQzdVQkF5YkF0c2E2YlRDbVFkQkdXMUJHd052QlhhTnJL?=
 =?utf-8?B?ZHRRTUpWczFMK1pIeUhNRHJnVDVOakFublVWSC9ETWpQNk0vMElnK3BUOWZO?=
 =?utf-8?B?WTBGNStuakg4RkxyOXh3NzNXUGY4aGhvd3dma09kcmVDamxOd0xmTGtadlo0?=
 =?utf-8?B?Y1pPWHBtU0JJVGtVL1d2aVFvTVU5Rkc0Q1pmMVlBYjR6Y3hoaWVpWFZVa2R2?=
 =?utf-8?B?Q2QwRkMvTUk4cDJLRG9wL2ZiejZDanozUlk0U0tDczZkUUpTRWxzUkR1NkVx?=
 =?utf-8?B?MGdUQjBLSkdEWkFmb2FxbDBRMkhiN1lQT0QzaDgvcDFoTVYzTXZ1TGRBVXM5?=
 =?utf-8?B?ZmE5R2psQm5PRmNGeU1tbjdqME9pZzBTand3dlJvM3orYmQ2RTlGbkppcEYx?=
 =?utf-8?B?STlEd0lpaTFXZUh0Q2YxWGh4V3RxQ3I3NGhRbm82Y1VzUjhnRTZISmVBajkr?=
 =?utf-8?B?eVF1dDNFTmxCUzZIZTJRRWlEby8xU01Jb0I4dU5td0JtQ0g1NmxUVUtuNmtE?=
 =?utf-8?B?dnZtMVNYT0MxeVVSVGZJb3Y2ZFJLOUU4SklCZ284cFp0SWxoc1UxVWJsVXJa?=
 =?utf-8?B?QjlvaHh4eXkxaUhLTC9sMTRXTlFyWnd5U2VlMHEyck9QNW9uc2ZrV3BaTnFu?=
 =?utf-8?B?NG83UXc4eGdiQ0N5RHFpU0VZRUloN09EWTJ4dmRKVjlnUG5qdkhyQkI1bWxO?=
 =?utf-8?B?Ky90Q2VJclVrNHczZU4zamZZUVZ5OC9PMHJqY28wWG5Zb1EzaGdKSkg4b1B4?=
 =?utf-8?B?VFh4S2s2aCtabWgxL0VCcTNuK1ZWZ0JRSTVMdHpEcU5lTkFZZm12cEdWbmR0?=
 =?utf-8?B?T1BkNkZnVUlQMzZPbzZESzdrOGhZeWgzaE1hN0RiczRuY0dXUU5BTTFkRTc3?=
 =?utf-8?B?NGpxRTY0OGV4eTk0SVhxMDVjeG90aisxeXNsUERjUVdacm5DcHJ4QzM4Y1lV?=
 =?utf-8?B?am1Mckx5aUlBODF3T21vVWE5WkI1ajRNUXEybjA4OTcyUnpBT1Z1S3dXQnZo?=
 =?utf-8?B?ejZ5dGM3Uk1kZXd6cFBQemVselFIeDRvVC9rc1R2ZzNEdVlQcS9JNHJBZEVt?=
 =?utf-8?B?TW13a0RqcFFtNFo2USsvd1ZDSTdYazJ2S1VjNTI4Y01GYjh6a3gyR2dhMnVv?=
 =?utf-8?B?dnF4M3FOQ3FsQ202NkRueVZLSytBRVBwUjRqU0hSUnFIb255WEloZTFoQjRi?=
 =?utf-8?B?c3RHRGYrNU1IQ0pDa3Bjc3ZoOWgrWGtjc1V1M1FVbmwrT1JNWUZyRG8yMjZS?=
 =?utf-8?B?b21sSXVXYVFPM3hyTndZR1AxNjd0cisvWlljUGRjSGQ0cWVwVEdmcWl0Mnda?=
 =?utf-8?B?VHBoOWs1b1FKRWxxQUorZmIwMWprMTV0UkQrT0pyY0liYlRpd0VZOWJoTGFl?=
 =?utf-8?B?RUxsYU1ZWEEvbmFmRWNsMnVGa3ZIbjJUVkdlTzJQN2JQamtSRW5IVGdyWlJz?=
 =?utf-8?B?ZEZ3SDNYWEU2M3VFRzkvK3dBZjdmckcvRjR3SmxiUy9pOVhlWTVtUHdmYWIx?=
 =?utf-8?B?b0JPNWRJN0VkTnNzK1N6QW5pcWJVSmhnTkZZZVRmOFRYVW1ieGZmUDVZc01S?=
 =?utf-8?B?MGczS1pEaHRiV0ViejFKbnQ1c1U5TzBsYTBDZW5LVnVwaUlFUCtuNHRoMG1M?=
 =?utf-8?B?b0JkWU00N0VsUU1YZTk3amxyaGVGZy9uMlFSVkNBbm5vT2dMK1kwS3NOSGxp?=
 =?utf-8?B?MTE4MDlIdG4rNUQ4OCs4ZGQ1YnFrekZzQWdmMnB3cFVOVVYvUEp0TXZrQUhn?=
 =?utf-8?B?Q3Y2MFByN3R4d3hHeFUrOElJRit2TmEyamdET21ITXlVQmhJS1h1NXFuakZq?=
 =?utf-8?B?QklTMCt5LzJLeTJrTG5KdHIvOEVuVFR3Y1hxYTBvN2RrcTU4ZEJyclRKemNo?=
 =?utf-8?B?Rm1oaHBFSCtEKzBPMnZnNHB0S0crSS9wV3BNYjZ0QlNaOHEwSWxnM3hNdk12?=
 =?utf-8?Q?5MQ+LSwFF075MwxpXtejN/vPo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88fb70e4-58ea-423e-5d79-08dd782f6038
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 12:58:23.2168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4XUGAjSiyDnkSwX9RaV5sxIk8CzI6Jzvbhh+xN4z11KhckZZfJo06YR26L21FhGP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9491

Am 10.04.25 um 11:24 schrieb Philipp Stanner:
> Nouveau currently relies on the assumption that dma_fences will only
> ever get signaled through nouveau_fence_signal(), which takes care of
> removing a signaled fence from the list nouveau_fence_chan.pending.
>
> This self-imposed rule is violated in nouveau_fence_done(), where
> dma_fence_is_signaled() (somewhat surprisingly, considering its name)
> can signal the fence without removing it from the list. This enables
> accesses to already signaled fences through the list, which is a bug.
>
> In particular, it can race with nouveau_fence_context_kill(), which
> would then attempt to set an error code on an already signaled fence,
> which is illegal.
>
> In nouveau_fence_done(), the call to nouveau_fence_update() already
> ensures to signal all ready fences. Thus, the signaling potentially
> performed by dma_fence_is_signaled() is actually not necessary.

Ah, I now got what you are trying to do here! But that won't help.

The problem is it is perfectly valid for somebody external (e.g. other driver, TTM etc...) to call dma_fence_is_signaled() on a nouveau fence.

This will then in turn still signal the fence and leave it on the pending list and creating the problem you have.

Regards,
Christian.

>
> Replace the call to dma_fence_is_signaled() with
> nouveau_fence_base_is_signaled().
>
> Cc: <stable@vger.kernel.org> # 4.10+, precise commit not to be determined
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> index 7cc84472cece..33535987d8ed 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -274,7 +274,7 @@ nouveau_fence_done(struct nouveau_fence *fence)
>  			nvif_event_block(&fctx->event);
>  		spin_unlock_irqrestore(&fctx->lock, flags);
>  	}
> -	return dma_fence_is_signaled(&fence->base);
> +	return test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->base.flags);
>  }
>  
>  static long


