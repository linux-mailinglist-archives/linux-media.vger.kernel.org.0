Return-Path: <linux-media+bounces-59189-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIWdCOX35mnr2AEAu9opvQ
	(envelope-from <linux-media+bounces-59189-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 06:07:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9357F436357
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 06:07:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7F5A303FDFF
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 04:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00103273F9;
	Tue, 21 Apr 2026 04:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HgpL/kYp"
X-Original-To: linux-media@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013053.outbound.protection.outlook.com [40.93.196.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087E419F11B;
	Tue, 21 Apr 2026 04:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776744242; cv=fail; b=be/mF9F+MAkMnOp0t6ZRoNF7tZdMLHp0nyWV1Jqy4RrKVDYIQGlCzrFr7Xt9pKCUP6nQM5JBbYGifq7rMA2ZwhIYrESwLnGcot4r6SQjhcMnPnOXEDp2atMBuJ18sNfrMxL0p5DUje4DC+Rxu0kx/Izabraac4m+kiyiAUQ4uTc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776744242; c=relaxed/simple;
	bh=3pzQFaVSppJEqpE9xwVXo80T3RNVACIubw+BVFWuOQI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=FWnoJGvQEotLsXZ/jyXmVd+9/xtG/KN9YAi5T7I60H3/kJuBeIWErUmuZdavU4CHSXRi3ZVUv8LVmpEs3SE+kMMwmrh3o0qIhNT2NgSzYhlW0Yzh423+UoIB/8qyoSVxsr9cynj7TnOGSpwlDaAn4wcf3pU/g6ZsFacuy3BJevY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HgpL/kYp; arc=fail smtp.client-ip=40.93.196.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vaPrmNaEbwdPF3NobB6eUg8njrxNtoVoXkMJgbMrSChdRUHDLnyOeMQ+2TYOfyR+KodAxDhO6MiInds2ceaWwr6z+9za9E3jJ+n2xofZDloaYFzZTw0m/T8BSbR99Vx1yv8K/SSZycbtxcDYbdraESLKkQhfiomBI6Nc3BmpOAUHR7c9ZNef/vbIA96ZPbUkFpOASpCiTAwiuXeGGLeuxogPPZexXLk+GTGEElzFcaWVSKee9SK5H0SXhnOz821LbZZnQ90jttc6fIP8lp22j24ciP7TJc//sfHQKKMFSDmsrxpxihtx0lhv04uHUeowANSi3msSZhatbg+gqcPOog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i27U44oYLObeLFsnA1A4t71XhBrmVCjPjCtIh6I8m6M=;
 b=tp0kKtGDbiRloGK4NZ4i/z4I8kdusRgS7bPrYQrE0lgJamBlpC+r/gkiQWq3iOnIIz6QXUJTvjS6rIERkEa/DnZa9UZ+6+bjM2j3kx9Z4XkcBqJY3xl+uAbDy/i3CaJMMKL8//67GZa1tHwsdDHBHJGfDhjtAjWv1FqzRAW9YZfdmEWIOm8AobQY8wRs9p204hlRJlFuOajv/WDxLeV0uV+tunMrEbhQopnn3veeTUHDAxy6iM7EllPI95rZ99t9R8ZepjKa/iNTS98r7sAdpOm1rVhAZimVymjiT6rMhMB6Bra4yTF5fNSVT8HwW6TXBfQsGttSD3/KXuZCN0xT5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i27U44oYLObeLFsnA1A4t71XhBrmVCjPjCtIh6I8m6M=;
 b=HgpL/kYpCjPs2vPwoGtvOQfSLEtCHb5S73NUUahWEVoJEyfyqizzy1bY5CKSdln0pYGtVybIBwxQ0h3rtIgRUuKFyAfY01TWgQ7FjOQW4t6T3jI+mxScA0L0jafmy1cuzmyy8hX4MqFmUDrPp4iA/JACHCOY6DHXL7jB0BX0fVdtV5lL1SwzEqlBtnaQgAGLpHLOtEN5Z2Iii9bjX01bvZRJTvPI9nCbZjrUVHtd6K3U8aBhMXd8eZzigltkg3fTRL5tuDOzfOwFu3cFTN0YEhANL5kkv/OveTLMbyaCA0gV7nitzPaTdcPBW3GXOq27AYnfuR3VFT9zNWbchN2UPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by PH7PR12MB7985.namprd12.prod.outlook.com (2603:10b6:510:27b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Tue, 21 Apr
 2026 04:03:55 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9846.014; Tue, 21 Apr 2026
 04:03:55 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
Date: Tue, 21 Apr 2026 13:02:37 +0900
Subject: [PATCH 2/4] drm/tegra: Fix iommu_map_sgtable() return value check
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-iommu_map_sgtable-return-v1-2-fb484c07d2a1@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0278.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::19) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|PH7PR12MB7985:EE_
X-MS-Office365-Filtering-Correlation-Id: c704152f-e0e0-4fdc-522e-08de9f5b01d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|10070799003|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	dGwR7frBHazL1k3SsuyaEvRJ9GOdrt+ORnkQZ6tjZRvaBGBAX7O0k8pHqKl0CHgox6idl7vVAR7S4woZUpsVFeMuMm2WxsCsx5CS5jGr8pFBJAvszm1BpnlaP019ZlEM4sXQLCmf/5I27BlKLAen9OiDlPcTsvQ3uh8lqq5ELefZQ2P0Vl8MnJERjZuhnEL0+ALw7vtyXNl/IAd6yYEbxO9/Ez74Y/DmS/gx4uMU/L8leMV9DRC9iVjQmIEYBFyfWK9vOMWJk5JF8oVNUyKvXUEHEnkvG17OwlDjiX4nhfAZ73Oxadc73cVuARh7jcM1vg0uQH7kMKMjo0a5pS6+Q0VCYpLwKhq6ipvD0ZNuW+CfrLbwRTOo5pdXk4lyaWhWTV1OkuGc+ziAl9vnNI1ceIguV0SHfB2boykIYmCCTeyDWOzIvOnbarpKPU2jDGNiZ3Rm3hJLEz0stvkLBB84N8OIUiWO2RjJDSLzWLpKqB/j57A738hqfrJdlguPR2dP+IoCeJuT8gFAC7OpJRQK+4Uh6mAgzwiiu+maHLQUDD+0XcB5qogfODtRNbgFYqNar1woEwj7DgmNwMP5UNGdAcjCr+rQdM0/PHpBUhKhkccjagOVh4v6kV6QItp8A7V1aTdT7FTyBFHHmcNJVTKrFkEWGrA/QHzxiNG17yUwiS2i/AyVLJjxCG+jluGaokjJjP683clyilwhryksJx5RS23VhM9VWzEQtAL8dqI3iR3tLvtVac9bX+q1dZPrTEB45hPiWCZKR6megoqia365vg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(10070799003)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXdFazQ3NUdNWmpSNTBGNW9XeFcxbzVMRUhwYzlGTUpWT1hBTnR4dTJLRVdO?=
 =?utf-8?B?bzZiQzg0blBEa1F3YzBEK01DOHhqUTJBc1hlSi9GazFuTE8yWmZNTk05NXVH?=
 =?utf-8?B?NDlVVFNQOUIzQXE5dm1obHF0WlkxUjh0Q3VyOUJrKzdma2F0K2F5T2ZoTHA5?=
 =?utf-8?B?SjdNK2lYem9OcUZza2N5S2lSd0NteEZjL2NNc1ZmeFZKK0E0bzYvRGpoSWpD?=
 =?utf-8?B?MUJYZnVIV2FYdEFETHlMYitPZGE2NmpiaUkvZlZsSVFnaW5rV2R1bVVXODcv?=
 =?utf-8?B?ZVgzT21qZTRDalR2SWF1RHZBd3lNZ281UTVIL0ZNOC83eFp4QjdNbG43a3Zl?=
 =?utf-8?B?dFZIMUtzQ2t6T1hoa3VrdkoyZEZvcGYwR2M5RTNhUjlacnY4SytaUGJxUExF?=
 =?utf-8?B?NENobmgxRk1uVWVWdTVzY2tUK0dPSmlEbW1zdFBjeFZqaGFzTUFGZC9pNERK?=
 =?utf-8?B?R0xMMEU4Q01jcWJQaDFwSzJaVEpQc0NVdXdzR0huYTJzTlFwbWRsellkZmZT?=
 =?utf-8?B?YlRqNXBVU3IrNmdXaE84SzM0bEZkZDZJN1ZhODJxZVNSRU55Sm50Q2QvdVJF?=
 =?utf-8?B?K3pzN1hBbllPU09MT0hmdFNEWFQrMjlwaTdCdXFQOGZOeGpEMXp1S2lkN0xD?=
 =?utf-8?B?Mi9EQ2V3R0NqRklGdThvbXYzbmpqV0p5RHZlc2VQRnErZ0ZyN0lkKy84bUtG?=
 =?utf-8?B?bVlLYjZNQWlVb2NmYWY4U2dDZjc5L3NlR2QvUEFLUXFsaVpOc2ZFNTVJWS95?=
 =?utf-8?B?N1UwU3lXeTFaV0FhVU1FSnI2TC9BRTlaaXBPaUVqR0w2UjFOUzNQNWdtS2xl?=
 =?utf-8?B?c1dZNUMxTVpPRTBoTVUxZ3FBZWZ3RzRFLzI1SGhFMlFUaUFtV095MDIxdjZH?=
 =?utf-8?B?NEdnSktKTnZyVThFczV3V2tlUDc2ZXM4NytNbGRTVjZoMEVkQ3BJMHNpektq?=
 =?utf-8?B?N0s0cmxoWjJpcjM0MXN6UXVyb2l6NzJvcjYrOUxyMFI4UHkwTXU1WHpVQlFa?=
 =?utf-8?B?aDZXUjk0RXVvcXpoSXdHNUdnMDk3bGtCbFNMV3BTRXlLV0lLb09TVThWSGl1?=
 =?utf-8?B?enNna1ZEVTQ0dzZYdVRWbXdjVW5HSXBqZ1Jsbms0WVl3UU00SWwzd3FjQk9X?=
 =?utf-8?B?YXZ2bnNCY3dzMlBObEFYK3F1Wmx6ckEvZkNTOVF0UW94VC9tbGhtSnRwaFdw?=
 =?utf-8?B?UDA1Y0ROTnR5VFRuUEdOUlluWVNCd2Q4SjBnd3NCT1ZjMlJ2Y0Q1MlMvQ1NS?=
 =?utf-8?B?VEJlYVNiY3MxRk9JWTN3aWtmcmt6dHFtS0J1dzhRSXR2ZDR1TlltK0ZHdHMv?=
 =?utf-8?B?Nm5jcm8xR1ExY2pDWG9WdUNGWnRNcUppZ2JYZU4rSnRHeUNDR0JqTy9pVUZl?=
 =?utf-8?B?N2FGVFR1NDQ4MVBCWnZtbFIzOFRtRW1jWDZqR2xCdThONVJ6TllMdVVkU3g1?=
 =?utf-8?B?MDRKRWRsaFNOWnpnMGJ4eTVDa0JNMVJ5eEtYWjZSM0tqQUxjS0lYRjVQQzZu?=
 =?utf-8?B?U2VtQ1VmWk9BMTRuNDcxRUd1RHBjZ3JTNHJYOUp2dXpqYzNucDZ1d1dveGdD?=
 =?utf-8?B?c0lMK1UxOW4xRHNOaENvMUdoRVRCY3lydUdYK0lXcE1xSXJoV1czZHpqUGR1?=
 =?utf-8?B?S3JyQ3VwUVpURkVPUW4rS2pSa3N5Vm5sVGI3YTVwU1hQakRZaEU3bFRWWTFD?=
 =?utf-8?B?c1cvQ2NRWW53c3RFMThhRTYxMy81LzVER1FtR0xja1lpY0FWc0pkRWNHZTYv?=
 =?utf-8?B?WjBKdnJRYjM3NDkyak9USzdEWUcrZXdIQWx2MzZOK0xFWThqVDdtNC9xT0Ja?=
 =?utf-8?B?Z2xuZEdqU2FGUjJ3U1B5aUUyTENTK29IbWM1QzFQaEhNcFVBTEc0UVZzb3Q2?=
 =?utf-8?B?TUZPWW96RGcyUXU1dU10MDNtRUFUT3FsRFJSaW54VWptVFp4ZEpibXo4bWow?=
 =?utf-8?B?K0lYZ3A2aDZhZmd0LzdIYUo1akpYYTQzNHBvQ2E5RENic1NiekZDa3NVaFVi?=
 =?utf-8?B?L0VFekFJNnVzOFM1S3dKdFpRc09vd2UvNDk0MzBxeHA5eGpUOXA5VnhVbDJv?=
 =?utf-8?B?UUZCUjlMZVIzbkZyRWYvMEMxUlVxckVtRDdRb2JoMGRjeTVUTEZTZ3h6VW5u?=
 =?utf-8?B?bW83Sk1sdVYwQXNZTzB1Y0V2eVhxdm9ESUhPTHp2ekRPM2ZzbDRRRlBHaHNr?=
 =?utf-8?B?Rm9JM3YyUlc0azVabVJVR0twSEdsRS9vOXJxVzhzOVYzVmM5M25EczlVd0Jh?=
 =?utf-8?B?TmplMXoyRWNvVjVJc3h2RGVIRnByWkFJNHBQbE4wNVVIQ2FTS2dyV29aZWJE?=
 =?utf-8?B?RTA2UllhbWhjdjNWWW5DZVR6L1hnV3JWZU0xZ1FQa1R6dUtkdk9lbGkzM1lk?=
 =?utf-8?Q?SIWS0t4gfxIp2TmYhmxBePtYRS5stWHCY7PL/pW3dU//F?=
X-MS-Exchange-AntiSpam-MessageData-1: NFFeY1ims3HJ5w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c704152f-e0e0-4fdc-522e-08de9f5b01d2
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 04:03:55.6047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TpNcJFlciXr5Y7ja22/Fuf6ipoC4Mms2Dp5MWa2jeHHZmn4jRgqXoucB2KtyEekXsCjAX1/xS4LPDy5+LDmuzA==
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
	TAGGED_FROM(0.00)[bounces-59189-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 9357F436357
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit "iommu: return full error code from iommu_map_sg[_atomic]()"
changed iommu_map_sgtable() to return an ssize_t and negative values
in error cases, rather than a size_t and a zero.

Update tegra_bo_iommu_map() to correctly check for errors from
iommu_map_sgtable.

Fixes: ad8f36e4b6b1 ("iommu: return full error code from iommu_map_sg[_atomic]()")
Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/gem.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index d2bae88ad545..684a16be2c0f 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -235,6 +235,7 @@ static const struct host1x_bo_ops tegra_bo_ops = {
 static int tegra_bo_iommu_map(struct tegra_drm *tegra, struct tegra_bo *bo)
 {
 	int prot = IOMMU_READ | IOMMU_WRITE;
+	ssize_t size;
 	int err;
 
 	if (bo->mm)
@@ -256,13 +257,15 @@ static int tegra_bo_iommu_map(struct tegra_drm *tegra, struct tegra_bo *bo)
 
 	bo->iova = bo->mm->start;
 
-	bo->size = iommu_map_sgtable(tegra->domain, bo->iova, bo->sgt, prot);
-	if (!bo->size) {
+	size = iommu_map_sgtable(tegra->domain, bo->iova, bo->sgt, prot);
+	if (size < 0) {
 		dev_err(tegra->drm->dev, "failed to map buffer\n");
-		err = -ENOMEM;
+		err = size;
 		goto remove;
 	}
 
+	bo->size = size;
+
 	mutex_unlock(&tegra->mm_lock);
 
 	return 0;

-- 
2.53.0


