Return-Path: <linux-media+bounces-56179-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAtVFQFbumnFUgIAu9opvQ
	(envelope-from <linux-media+bounces-56179-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 08:57:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA5A2B7590
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 08:57:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3223B3096EE1
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 07:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E2AB36CDEF;
	Wed, 18 Mar 2026 07:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="K0DXOYPP"
X-Original-To: linux-media@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012021.outbound.protection.outlook.com [40.107.209.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6449C33A704;
	Wed, 18 Mar 2026 07:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773820396; cv=fail; b=sb+8zw/6w5jrexNwC8D/RYj9tbWL6rIjOeRQogSuwE3z8Xqzod+3dD0JxvMhziaho/iMf5D5O0yqUqDzjFmy6hTe9bA+7Cp/671fL8p9uauQw0qqrgply9zlE0ESHtGYyAjZ/tI/syTLVmGas4p7slEtBke4uA1/E8QDJ/wYwi8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773820396; c=relaxed/simple;
	bh=3juMvzSfzwOQFlzWP4MKSFfYHtDLEWEKKjiupy5Ar5o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dpVMQDA4IY+nxN848dFHyJICdahNBVrZOUslJyli2Q6x583v7EZ9LkhC6f7qXHnRyJlN7fFYMX4/yzwRGjfyI8VudUCnJXBO7dR3ap72Q2/dtIt3cgEN2iBr9ahx8oTOxROtf58S2OA4cya54U7/OYcHsWqlxZUuWeTQe8ZqIyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=K0DXOYPP; arc=fail smtp.client-ip=40.107.209.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mralD4Vly6NqR5CCrPFdcVkEBee1xoXMAgyS4qFlLjH4xLBl3O6SgBbPkWGRcLi72meERWRFlO85qg4onza8zGwLbua96IQM4Ezsm7YmzhE0B9UBBcZswFOi3GeLw0qD1wSUkPO0ZpgyKfEYuFoA1x6PXqmKL1HdC1xpIiump5EZrr0QT3jpOYiIZ0kRw/5EdNYBAhYbl5pqX646pHyfBytBX8HDBqLcwNh8QozVPDlK4bR0mCa4VTD0JOTm2zyNxxZJ9O1fwl4hl7tarOpSs8SCvghV8vvjgsRC4XU+U004jijPj4SaZ03eTdqrFNmPD3C8a8B/kYpCPJNvr1wlTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D+whHc6i7J6dBaAzBUpCy6w6tTSb8DqE08BckLaVpII=;
 b=JmWNUhcLZwXlX7EoKcIbEaRndRjy7st9dlavxilurJbuhZawNKm52o078CEQwChEIU4KMalt2mPiGixqi5LU8kVaBecSbWBTK15l4hQ6W1WsKEnxL4/wlUnYkApWxM+kUatGSt124+Gq3f/yOjv3NDuLYZsjoLXfCBFmIYWKystXYj7VI7aAktHp0/kMseFInA300EYH0A7soHxdNpn0yHmAetnzCiA3FWTa2yt99EQXJB0mevS2O593H4WcoSerCnu15HLb3qtEGzXkCvPl0nuzBuVZC5npeVAbT5zA6XE/CaYX4YR5NcoZG7n+o/x5fY+IYlKbuPS2pyd5AuQ8jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+whHc6i7J6dBaAzBUpCy6w6tTSb8DqE08BckLaVpII=;
 b=K0DXOYPPsPwtc7VMVMeON9Yow6P+c+x6d4MYzgg3o7WG2BXBtHMVZASHHLF/hoXbV4ZZVZ067R1BHcDUbMDAluicPB1uLtpqD1tkvKP8PRXAtx8uTYzhy/UXb5tqYlRYXDDUEN0fou1ITdBXSlgBBgF3JWTY1lW3uDvPMguWKJI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB9169.namprd12.prod.outlook.com (2603:10b6:610:1a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.17; Wed, 18 Mar
 2026 07:53:10 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9723.016; Wed, 18 Mar 2026
 07:53:10 +0000
Message-ID: <b046cba4-665a-40bb-9932-fdf6684c4501@amd.com>
Date: Wed, 18 Mar 2026 08:53:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf/udmabuf: skip redundant cpu sync to fix cacheline
 EEXIST warning
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>
Cc: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20260317053653.28888-1-mikhail.v.gavrilov@gmail.com>
 <CH3PR11MB7177B163E8FBD9B6D812DE86F84EA@CH3PR11MB7177.namprd11.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CH3PR11MB7177B163E8FBD9B6D812DE86F84EA@CH3PR11MB7177.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0480.namprd03.prod.outlook.com
 (2603:10b6:408:139::35) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB9169:EE_
X-MS-Office365-Filtering-Correlation-Id: 40657b99-0453-4fa0-dfb6-08de84c36616
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	BMVBD3D37taK8acBYmUx+bF8A3usARtBTKNASZPn4u/8yaFChfaTZSkSnmvVtU62ZpGmBBIuN/+ijje/UNOUhgE0CwcEbJi2w24clBPAHcojuEVbORJlHySEqKfNIRvxYxHhSB4sW9bDxOeeqK8ELdYyNBZUNnzbHCH1lcvnOlIdyleFHzVbWEjhZHlEmIDIUVkdoKXgVbBiVKznY3hd7NRFhqZC9Y8rJ5mS8rREe+5JZ76uOnQa4zfIk8z3Y6Kb8ND40qxjivYCohWGoyNQ9rPpbnx3wHyiojCI4iyPin/YfgfGjF6/2gwW93V7R7d9yZR9L4jt7iec2hWANwaePSoGIcxiSqJPuDgjUO5YHaeQ092kALxcmsHMMrcX+vSeUCwhllcpnO77ZVyonBmpMBBs4OfiV/WaS1FOHfIqkj0s/GkRkm1N1Vf1DV3pNakFULBY/KM2ILmP48PIDxlYYl3RQqrW8qqAuFttG3uuCobIoeCzBJK6fC93iAKM0y90SJNiXjmEC9Deze9GhQfjqPstTSRkNRqPxjlppvMNFQHgtX0I6gAzxGkIP524YME5G/JbpYDtkst33bUpOLvADMSwnTZxORBTdHZVdSm5P8KtxLGqIzCet91HoCyil02zsWT5UrVwQ05kHxrt6KzuTN8lhMozvHfJz5l2s6+HfKWnn+Vh4+XsAe2JslMYIKbGtMoLpySxmi0/F0UaZgIvHkXcdWQ8trQ/E6BZdrvrlzY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDJVVE9nVjN5cllnS3JlamU5Y1JqbVp1VGxLQzZ1amtFS09oc1VnbVJ1Zzdp?=
 =?utf-8?B?ckFGQkVrTDF1VElOWkllQksxT08rajJqRWY2ajRlczRPSTBWSFkvdStVUXZq?=
 =?utf-8?B?YTVhSkdmY2hsaHNZZHZNMFBMQjQzVzl1ZElpbmZwaW1VT2NWMVR2UERGMlVz?=
 =?utf-8?B?ZFRaV1oyUVQrdEVWTTVNZ3ZMTytGNlNpTG5DYzUrUllQN25FS0VTOUt4b0Zt?=
 =?utf-8?B?Q1JZalVFd3c1ZGc2azM2NE9rcGhoY3VvUVdkSlVORXlZc2VISXdsYitaK1hL?=
 =?utf-8?B?alR4azNPS2R5ZzJZM2dadGpVSFYzeElxMWppMEdVdTdTVC9oWlhsOVp5V0Fn?=
 =?utf-8?B?Vll5UnlqZzhvck5td1FuYVVTaXlzdFFTTmEveDNHNHNYSmlSSGU4Nms2cUh1?=
 =?utf-8?B?OUJpNk1TL01FOGxHTHBtdE9hS1ZMSHg1Z2NSMmdWc29oTS93QUJPNnlSWHND?=
 =?utf-8?B?MFV6eTdlTHlDVHllMDBZUm16UkdLaXdUczh0SEtmMk1QUWJ2VDFlQ1J4K0t5?=
 =?utf-8?B?S3R6MFV0eTluTkdMMmhqSGw3ZG4rWU50UTFMY3MvaWtkVjVRYkJDN2RIZE90?=
 =?utf-8?B?SGJLN0RBK1BNU3RhTnFQOTFrYjZsM1l2NjZJWTBjZjV5UzZkeUduUW5SM1Jj?=
 =?utf-8?B?SEJKRVBvTjdvZzlJZmV0WmZXWTVlTUdQOXNyNStDSW9NZ0YwK1JKV1dRL3ZK?=
 =?utf-8?B?T3JjdTMxVG9BTHJZZDZDTlZjMG8xK1YySi9ZWW9UT1lyRkJCNEtUa3g1dml1?=
 =?utf-8?B?eGk3RXRRMnpMbWNoYW1oQXo0MHdjSEg5dkpoK0tnOStXTWhhMUZqcTNhN05x?=
 =?utf-8?B?T0xOaEloTW9RRnJQL0xTbEFRZzBMZEt5UTl2WjBiVGxGRnhqS1I2MmpiOERV?=
 =?utf-8?B?T1h2Yk1rQzB5b1ZWZTJRYXZ0UWxPUjdROEVSMXpqSDBmVkJkM01jYng2OVV1?=
 =?utf-8?B?QlBvaFpCdHYvUFNmSXJUZ0poTElaUXZ6ZUt4RXltdVkweTlCRERmSTNtYU9N?=
 =?utf-8?B?TERvNzBjVXM5YTNwNnFIUnMxdkNpaHBFRXFmdm9BVDQyRVcySEhBeXdyUFNW?=
 =?utf-8?B?RWxoYjhjTnFGS1psbjFwUno5MTQ0Sy9KZDl2SitIcWY5aEpXOHVlSm5DeWV1?=
 =?utf-8?B?MUdCOHpxbUpsWnFFWTFsNFI0aTJmN1hQWFZOTEllQ2M2cUFjSDRRcFMrbDJT?=
 =?utf-8?B?bUpqd0hnRElMRlZQRGtHNEkwUm5IemJQU2E0OEsxR3g3Ykl6Yk9rU01QK0xK?=
 =?utf-8?B?UysydDdCZFVqQ0EzOWNsZFdFOFpvZ3d4RWh1TS9lSnBTcVBMNWNCTUNRdXFE?=
 =?utf-8?B?KytpQmtMb0NLN2VTSHlEWC9qRGRiOXdTNU1yYyttNW9PT3NRdmtLT2NZUTJI?=
 =?utf-8?B?ZmNrNmVCcVdyYVJDSlh2UWtaUUtRYXZBTytxWTdKQ1JrK09RQXhRSmM3UXdI?=
 =?utf-8?B?Q3o5Wk5kWlZUbUNsZkM2QWlxTUFKcWNtMXBGa2w5UzJxcURpSXh4eGZsT1Jy?=
 =?utf-8?B?blM1czBlcTljV0tXSlpZQUcxZzVqdHI0ZmU3eE9wcWp5dEdEYmZqNndhTXhF?=
 =?utf-8?B?MmRiVjRQYWQvWUx1RG91bFZjUDdFU1VkbVY2ZHE3VkFKVXUvTG5xczFDajZX?=
 =?utf-8?B?WXpTWW43cG1nZzBSeDkvaThFb0Q5S0Jpa1dsQmFpb3NQL3lwVklTMWN1THFz?=
 =?utf-8?B?M3ZkblZCV3NlbGZoMkhFQmtNUmxSQTAvKytZZkswaFY3cEpYc2NKN3p2OXEx?=
 =?utf-8?B?OE1TYndkWndjUGJNKzBtNVVCTmtIK1A3aCtQbGRuUGg4NC9KZ2tsNVV5djBO?=
 =?utf-8?B?QjZHUnYxU0EvSTNtNXZiOVhXQTVzK3NJYy9RY3RLU1BTTHEzVDJuMlFRN1g3?=
 =?utf-8?B?U2NuN1Mvblg2dUJ5bmxzbi8wejdLWGtIL0pIVGZ0ZDU3eEhVU0s2VXdCYngv?=
 =?utf-8?B?QlV6T2RBRFVtUllYdkdubEU4NkVWM1NEL1VRazM1OGdEMUlRbEk3T3FKd0l0?=
 =?utf-8?B?R1NmaFNBMzBCVFdoUk1HZEFNd0NydUlTUVpEUVgzUzFVa2xDUm9LRFZZMGNC?=
 =?utf-8?B?LzVFcmpIRjZDNkRaNjUxOStjdWZkOFZnTHB6RllXWm5wTHA0YlBwNUtjNERS?=
 =?utf-8?B?NFBobENmTUtaMUtJWVVTeTlOM2gybTBrOHJYQXdRRzl5NkQrdU9PY2xtL1ow?=
 =?utf-8?B?ODF6NE45NVRuWkZlMDJaTS8xS01lSE5nUFBYYVgxQlFOeUZhVXczcDRHMmZB?=
 =?utf-8?B?RE95Ly8vWWdOejBGR2VkZGh5dmlZMXpyc2tsS2VTMzErNFlqaGdQekdmVTlX?=
 =?utf-8?Q?PdOwWzfLXJ1vx9iLD0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40657b99-0453-4fa0-dfb6-08de84c36616
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 07:53:10.1261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +iV5JdZBX8N0h7JJxoNKE59OYnnAdi9hT9XiVx683kRSE7w/CyzCTmBEJThnc1Xk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9169
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56179-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[intel.com,gmail.com,redhat.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AEA5A2B7590
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/18/26 06:40, Kasireddy, Vivek wrote:
> Hi Mikhail,
> 
>> Subject: [PATCH] dma-buf/udmabuf: skip redundant cpu sync to fix
>> cacheline EEXIST warning
>>
>> When CONFIG_DMA_API_DEBUG_SG is enabled, importing a udmabuf
>> into a DRM
>> driver (e.g. amdgpu for video playback in GNOME Videos / Showtime)
>> triggers a spurious warning:
>>
>>   DMA-API: amdgpu 0000:03:00.0: cacheline tracking EEXIST, \
>>       overlapping mappings aren't supported
>>   WARNING: kernel/dma/debug.c:619 at add_dma_entry+0x473/0x5f0
>>
>> The call chain is:
>>
>>   amdgpu_cs_ioctl
>>    -> amdgpu_ttm_backend_bind
>>     -> dma_buf_map_attachment
>>      -> [udmabuf] map_udmabuf -> get_sg_table
>>       -> dma_map_sgtable(dev, sg, direction, 0)  // attrs=0
>>        -> debug_dma_map_sg -> add_dma_entry -> EEXIST
>>
>> This happens because udmabuf builds a per-page scatter-gather list via
>> sg_set_folio().  When begin_cpu_udmabuf() has already created an sg
>> table mapped for the misc device, and an importer such as amdgpu
>> maps
>> the same pages for its own device via map_udmabuf(), the DMA debug
>> infrastructure sees two active mappings whose physical addresses share
>> cacheline boundaries and warns about the overlap.
>>
>> The DMA_ATTR_SKIP_CPU_SYNC flag suppresses this check in
>> add_dma_entry() because it signals that no CPU cache maintenance is
>> performed at map/unmap time, making the cacheline overlap harmless.
>>
>> All other major dma-buf exporters already pass this flag:
>>   - drm_gem_map_dma_buf() passes DMA_ATTR_SKIP_CPU_SYNC
>>   - amdgpu_dma_buf_map() passes DMA_ATTR_SKIP_CPU_SYNC
>>
>> The CPU sync at map/unmap time is also redundant for udmabuf:
>> begin_cpu_udmabuf() and end_cpu_udmabuf() already perform explicit
>> cache synchronization via dma_sync_sgtable_for_cpu/device() when
>> CPU
>> access is requested through the dma-buf interface.
>>
>> Pass DMA_ATTR_SKIP_CPU_SYNC to dma_map_sgtable() and
>> dma_unmap_sgtable() in udmabuf to suppress the spurious warning
>> and
>> skip the redundant sync.
>>
>> Fixes: 284562e1f348 ("udmabuf: implement
>> begin_cpu_access/end_cpu_access hooks")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
>> ---
>>  drivers/dma-buf/udmabuf.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
>> index 94b8ecb892bb..9c6f8785a28a 100644
>> --- a/drivers/dma-buf/udmabuf.c
>> +++ b/drivers/dma-buf/udmabuf.c
>> @@ -162,7 +162,7 @@ static struct sg_table *get_sg_table(struct device
>> *dev, struct dma_buf *buf,
>>  		sg_set_folio(sgl, ubuf->folios[i], PAGE_SIZE,
>>  			     ubuf->offsets[i]);
>>
>> -	ret = dma_map_sgtable(dev, sg, direction, 0);
>> +	ret = dma_map_sgtable(dev, sg, direction,
>> DMA_ATTR_SKIP_CPU_SYNC);
>>  	if (ret < 0)
>>  		goto err_map;
>>  	return sg;
>> @@ -177,7 +177,7 @@ static struct sg_table *get_sg_table(struct device
>> *dev, struct dma_buf *buf,
>>  static void put_sg_table(struct device *dev, struct sg_table *sg,
>>  			 enum dma_data_direction direction)
>>  {
>> -	dma_unmap_sgtable(dev, sg, direction, 0);
>> +	dma_unmap_sgtable(dev, sg, direction,
>> DMA_ATTR_SKIP_CPU_SYNC);
> Looks OK to me but it would be nice if Christian or someone else can
> provide an Ack for this patch.

The details of the udmabuf handling is absolutely not my field of expertise.

Feel free to add my Acked-by since it obviously seems to fix a bug, but it would be nice if somebody could do an in deep review as well.

Regards,
Christian.

> 
> Thanks,
> Vivek
> 
>>  	sg_free_table(sg);
>>  	kfree(sg);
>>  }
>> --
>> 2.53.0
> 


