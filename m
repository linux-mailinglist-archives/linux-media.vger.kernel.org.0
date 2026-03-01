Return-Path: <linux-media+bounces-54001-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PsLKAvfo2mGQgUAu9opvQ
	(envelope-from <linux-media+bounces-54001-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 07:39:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0601CEA6C
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 07:39:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6A6A03018C17
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 06:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3504317166;
	Sun,  1 Mar 2026 06:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="jf9IHZck"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063383148B4;
	Sun,  1 Mar 2026 06:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772347138; cv=fail; b=N+eQ7HacyMm7mBvhkwR9mexo5m5iGtNflOM45mn2xTMTRNSUDx8zdH+Nlezq8GollVjyqzn2GJI7M7z2mi4b3QtCtRuGQp3KfBBZe8J2uPPBGIA7xolM+0vQFGHz0n8wlYS12e9PCxmDwEwUJxj/yoS303nNktR0wEq/0EWMmnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772347138; c=relaxed/simple;
	bh=oE/cYSadSvyl8PVzlDdo03mpEV9vrhJfhVZghi/QZwA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=p9kYlRsKnaYAGu29OMmNnevdn3aZDGMTB0vstv6IKDmSjS/obeonrMsG1Uhtz7ki9M9WHtIqO1OK7n27+0myJMFAFogsKuvehl1pan3kvKFKABIHFWmUKghmxVcHI1fsIzZymkPW/EtjysGHPDEk50ylngoRa2ZF8qSmwrM5faY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=jf9IHZck; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6216I0VN3177336;
	Sun, 1 Mar 2026 06:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=gXEj2k6i2eFNtzRDRsy83YBBpE+BQGHvl7CskyRzLpo=; b=
	jf9IHZcknP4uS2NTrn65Memde3e0WwpqVaXZaGLL6TQK1Y7JFVf3+yemnUvSbb28
	NUnhMo623XO64XtNTm6zYyL130+NKq2WzAF1KOIiR8+ypyYvZhM5hBBBe9IDB7Hp
	0ZJWFrZmSkN7Dnw2dDrSzz64WX5Gk28aEtNvwhD298McWiwHhMEjpciuXvWsxxDs
	mXJpTDLS1QUvqfALHYmYPW1+nkQI3FWbx72YRFgqu6VgyU1JvkbGaKmwo8eSZ1YL
	Wtf7koysVOScgTBcJkLjVZ9rtYqlGJcyHABKJu4/XakXwyJNKzIa43Nis9ermXdx
	tGmo5FvAryNF8tcTTYKN9g==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011018.outbound.protection.outlook.com [52.101.62.18])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cknjvha90-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 01 Mar 2026 06:38:06 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I8IukLPpvBko3fhXDNv56DfUM2hnH8tjOdYmxGxEprl0zhyZqc3XvLHveKoM+StypPmUYrrky9lB7seQwzpLjgFAnJcJxT/Hrr4m2w+LNqdXJcQfOgtJzDmCcHRyWrkxRe0D84QkPLgUupu1wpolC/65tiRPN8V1+VqMIJEwz7NOr7S/Jz9ivZKT7eKtL/DLQQkx8ahB4QBEp9QqJ469Ovg/v8P3QZL29tQiSo6RYbvCxBMjs2B4ljGbteb1oKtWZVUstgVtDuzvLyf9T2B4k4gS5FIxHwn8LEiAZCqYFqyhhU8oYeuZVXVUZ+XfzloVtaKmMbSzGDv18i5MzsI/Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gXEj2k6i2eFNtzRDRsy83YBBpE+BQGHvl7CskyRzLpo=;
 b=jT7z4/+hcMeryeWfwndGKVHyufKjRLqCG9WusoKviU9rg+UkmcyhZdCABA5VYjtzjV7Ua93XABUKoTEz3WXe6360Jy+HDjqMMJGNfQ0FPfYtirwlIYjijy+8qt8w8jU6WBZRJ9GhG2z0GWjEW6eRILhDuoMOiH2hKH8bwIlZcX77riIjlMwXDdwkrB9geJutqMYXOghcwFTQTgjx5H4L3V9ZM5vomr8dnsdFGvkPmOXuwBwOYhNoDlPT9a7jFgADql7FTtezsPIXLGLmVOi7QpOl8zjuDgxVjS5+G5CLlIvmlX8Fex1gsAGxeMeAs8+8mP9LcBQxCA2DAUtoHQ2Nig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by DS4PPF07B018B9F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Sun, 1 Mar
 2026 06:38:05 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669%2]) with mapi id 15.20.9654.014; Sun, 1 Mar 2026
 06:38:05 +0000
Message-ID: <27fcad2a-89d7-4861-89d0-67825888bcf7@windriver.com>
Date: Sun, 1 Mar 2026 14:37:57 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: i2c: ov9282: Switch to using the sub-device
 state lock
To: Tarang Raval <tarang.raval@siliconsignals.io>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
        "dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>,
        "jacopo@jmondi.org" <jacopo@jmondi.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "prabhakar.mahadev-lad.rj@bp.renesas.com"
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "hverkuil+cisco@kernel.org" <hverkuil+cisco@kernel.org>,
        "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "jai.luthra@ideasonboard.com" <jai.luthra@ideasonboard.com>,
        "richard.leitner@linux.dev" <richard.leitner@linux.dev>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260228083401.1007434-1-xiaolei.wang@windriver.com>
 <20260228083401.1007434-3-xiaolei.wang@windriver.com>
 <PN3P287MB1829CA4A49FEFE8E9A35061B8B70A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Content-Language: en-US
From: xiaolei wang <xiaolei.wang@windriver.com>
In-Reply-To: <PN3P287MB1829CA4A49FEFE8E9A35061B8B70A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SEWP216CA0136.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c0::11) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|DS4PPF07B018B9F:EE_
X-MS-Office365-Filtering-Correlation-Id: 102bc5c4-3b70-41c5-86a0-08de775d17ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	KKGzQ6oNXa2QCd3T3+20QWOM/25NLHTVq9s0GmnzbHkyKbx7QGd/WYQeZh3zAABRxg0Zprq5kF/RJ9IjWI8RlToUY3owD0QpqJiF+9gSZ9Zi4eWRoQSqui44ChrBq/lI3GvLSL8J8a4b+nrGxpvLzvNx5b/smKis0kutTBne5NGFzep+4dOmuborGBphZ/FsfF6Pm5/ICI786MfFcBjcC8cZ9xsPcHCooYCAQViI1UIVUPQTVgwwxX2iDs+ZejndvSiAU4d0GEF0+zDQQ8toJtdsGb+3+CgYBgkKp1Yqo44m3GSfpvFfKRSzcpAdxrZ6aCD1ZR2O2ZBdlvqY0D9SkuAtnkXqLvEK3vz01u+ti2WIGT7qKvqOgW2FGBHThopjkaAsUMK8oGHnTFYrEz1Zl6NfTbDpurq7pQHCkEfLJOSnXeArpmjERfw3oXntImCADUhpG7woocUSylcR6DU6PWIl/kVHbZPHNKMZ6nQFyEdSzKEVBvJwkdS+F8D01HODDKzuiplZCRQFeHW5IvXKcfCFj68ZXgZHn+OkT+oyZTdYhwzEY4RdiSM4x/dCBh6r9jdDMm7iqhrGxukjCQBQlC6p02aGclS19MWDOWL+SzqVHdYDfpmvxeCmJkMr95Q+I4k+2rX0i/Ie47vsc7YYncCF51D/nxpwvlkmDUcKV3qaxJGfBjLTSHDsf+8cq9bffYE7Kwnmq2v4WMRttuXoTpc5+SKimZDERoSlybMzcno4z8Lgti8VtQiRR9FiFSjxENcIClQlApQtcBQxTcqueA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUNuZlVmUkpjQkdnb3VmQ3VsSjM5Vm1oTzRxRVNXVGg1dUFnckFHbng0MnJP?=
 =?utf-8?B?aUJrM1RyUGd0aTRocXZFTDJYb1hmYTcyVEc0eldxdVhZSEZpbW1UOU1vNC9D?=
 =?utf-8?B?UmJmK3ZPd1dPczdtUHVlMjVISlFFWXRIcGo5MEZVdUExaG1pNXkwYW5JUXVF?=
 =?utf-8?B?WnNRdDBlNXd6aHpqbkdHc2xNSnZPMmZ3cUdCZEZ0UFlNNEdxZEJNaUp6UnFy?=
 =?utf-8?B?eHIxVFA4eUZnaU9OR2pvbU4rTmVGTU5mRE1wdTNjc0pmeVlRRFFhdmlLY3Bx?=
 =?utf-8?B?VEF6TlMrNFRFOEppVTBJMnFYYTU5TnhjK3JoL25nUFlvQkdUVzcxWXIyaytw?=
 =?utf-8?B?M2hoWnFIa1B5Qm1CemJHQmkzbWVkbmJ2cGRDTWJSa09oWjJMbEI1WWJsd1F6?=
 =?utf-8?B?b2pmbERCcjh2MSs2MlFFWnFiMFpjL0F4NkZ4bStNVmV5b3BuenhLcHJpSlpR?=
 =?utf-8?B?bXBTOEJONlViVTBhSzFwZ1pqQUx3dUdIZHoxUEsydk5CVlFNY3VVd1c1dXgw?=
 =?utf-8?B?TU1lbFlUMkVQQUsxa3UwU0FpUGRxNFo2N3pXMWV6SkcyMTY1MmNoaGNXRWxh?=
 =?utf-8?B?TlEyR0hXZkh4OE1WdlJHRE9vSTM1Z2plazZjSXlmYW83QUVvQWY4MytnVE8v?=
 =?utf-8?B?cUxHa1pFRTF0MkhzQ3FTZUZFd3FUWjVKM2FIaU9HcytXZHljaVNrSFh4Ykk3?=
 =?utf-8?B?czNZYVd0MTN3VVl5ck9RaklMejdkQVhaaWtabHNqWlAvZURlZ3dtVnZjTEdO?=
 =?utf-8?B?bVFXZnVnR0V2ZHJIajFXUU9FUHdmVzNTeG1NV2lSeVYwOXRkWXorMmdMNWov?=
 =?utf-8?B?SG5tWXZVdU5qUnQ4OHNtT2hnUHdaYUwzREs0OXhLaDRyT0NoMVAxK1VvMG9W?=
 =?utf-8?B?RjNQdVRrYitpSms2N241WFpCNmNEZVZWdG9wSDZQUi8zakx1czdyRittRmdq?=
 =?utf-8?B?N0tjVnZVR1VoQzlzVjRVWHFSU0Q1OGJXbHZmV0RqR2pYK1daVHY0NkNnSnZH?=
 =?utf-8?B?dGRVOUdPaFpHeExiQkJsZmFqcHloNy93NVBYVTNXR0lQa3lVSk9rb0dHcEta?=
 =?utf-8?B?aEhMTVNTYlk2MmdXQkRlYUsra1V3VGt0R2xLVHlqYVBIcFZ1T2hXeUFwUHRa?=
 =?utf-8?B?dnpvandXZEJKV29oSmkrZzIvSVM0c0FGTTN3OU1ieWtXbWVaMURxV2pxN0d6?=
 =?utf-8?B?bmUwdG56NW1XeUlMbTlVdnRpQnM0RUwrODlSYmNqTWxwY3BDKzJHWjV5MlBy?=
 =?utf-8?B?Q3pyZHgvbC9INjlFZDRkZ2hmR3NwakZqTFgva3pVOTZMOG4xc2hVTGE1NURF?=
 =?utf-8?B?amVKZ2RKYXhXT3JQc2pyUHdnQVJOOVpnZUlXSkRTZkxOWXVTQ25LaC9GcjZV?=
 =?utf-8?B?amsyNm0vc2xYL3plSnlqOTVTMjk4dDFoaWp1STUzZ3VZcUxHclpJYkl4aUF1?=
 =?utf-8?B?YTRoc3BoZDJlOGZmU3ZSMTJzdmFBU2IxODhRMGNOd2NyamlIcE43K0RGZk1u?=
 =?utf-8?B?clduM3B4WEFlODJNNWs4QWcyOEpmVXAxcC91TUpWWXlNbDRBaUFlY1BoRm1p?=
 =?utf-8?B?VmtzV1BPMTNvQzdXSWQ4TjJWUDh3Tm9aYTlRd2ZzdlZ4VFpCVDQyYmxRa1BB?=
 =?utf-8?B?OFc4aDBuSjlEVFVBZklnV1hibTZsam5xUjdZT2pWek5LcUNvRlREMnV1TkQx?=
 =?utf-8?B?cm0xeXRvV2lWb0lzYWZITUNzSWNBQ3lRT0k4SmVGc0FqbW5ONElsZGwzT0hu?=
 =?utf-8?B?cWE1NWt6bFZmVWVPbjZPTUdwMmdwSmgzWDZDeXkwNnVQb2hMZG01YWtWUlZE?=
 =?utf-8?B?NUlLdmhTMXlhWW9lTkR4ODVrSHVZMmIyWnpDUEdBQTlBV2lpUStlZGlzK2Uy?=
 =?utf-8?B?T3FWQ3l6azBkOHdXdGJ2eWhSbjZsVjRGV0xtei8rNmNkUDVkQVZicVk5L3Zw?=
 =?utf-8?B?UEFqSHhwM1F0SFBzV2tpeGpLK0Nid1A1N2RheCtoRjV6M3dJWVZ6L2hxZXEv?=
 =?utf-8?B?NHNER081YkVPUVJWYXhUUVhBWVRoMkprcjk4UFg3OUpDS0NOdVlvSzFmMHhJ?=
 =?utf-8?B?Snl3eWN6TkMyS1owTkxBeWliN3JqQ09XNlpSMGl2ZWZFWlVzUDBrY01GTTdv?=
 =?utf-8?B?ZkpIdUNaM2phWm82VDVtcWdQY1FsNjBtUjJYdzhkQnEvb2hUenhncitETDF1?=
 =?utf-8?B?dnkyTWtDNDVqVTh1RTRPS3dlaTB6SG8rOVZheURqU2FjbFdqdjFFcEJFbEI4?=
 =?utf-8?B?NCtvRkxmL0pyR09BZkhQcU5QOHVtNUNmUU1YeXZsdGpnbnVMTTFFUmxJNVZ4?=
 =?utf-8?B?UGx5cUNiZWF0RjNmRHJHS25FQTY4dkFqcmRMc0RjdmswblorRldlNmR2SmJJ?=
 =?utf-8?Q?qPAczGKeo8E9f2FIAn3ULU8rfTaZEDd9T9wUEmG9FCnAL?=
X-MS-Exchange-AntiSpam-MessageData-1: PmOOJ3dflyTK30hfUlwn83Z9tNnWOidmRE4=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 102bc5c4-3b70-41c5-86a0-08de775d17ed
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 06:38:05.1424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ZcgXavBpGdpTCTWr6V8Ikvusgg9AedhKr+xl4fJCBna5OtZQMl5P2it8Ge6gjQRt6SPvdIkObvBaGI01Zu3kmY53pDR5RtqDnpfctCLwxM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF07B018B9F
X-Proofpoint-GUID: QcnF7xPz0GwESRAxR7cNq0iOTlcH8BRD
X-Proofpoint-ORIG-GUID: QcnF7xPz0GwESRAxR7cNq0iOTlcH8BRD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDA1NiBTYWx0ZWRfXzsZLTEP5Vi2J
 RM4VL1+5ny6TwIo5LVFClUchah6ol8Dq9n7AAsCdfUC3FragRqj4yttXIstszB0TEn69YCbGRN4
 rYkt0z/6A18FIwTbCB44enWLxfOkjDgcTUlBt/o0PUvwGr+Rn4bykOFR6VOySuR3TgQaB3ORojt
 92lmY0emORSTpQNWTyYWUQI0L5GlxTTQri+HnSSNjyZou/DGGnoGKj/D6rxlP+ZC9lcci0dZZZJ
 ABH2rNNdFtn4siU6tzr/Me/3Xdg2P2prdm78ofcacdSOD+zEd3nHfR9qfpCdJye7GIc0J/tpfO8
 ffJ7Ma0qPEyZyOzkG3noZtARA6hliuEagf/Hi87+moaZPue6URo07cMPLAQ4TBYMrHy0tSs0gC3
 GOSPwcME9u6R/UFPlbNwSADj4ocH1KRotjNBfbqDsF6Ue0WzFmh/CFbqrO21DesnEPy+ApB/14a
 wqK04l3rcoDtAIXyatg==
X-Authority-Analysis: v=2.4 cv=P/g3RyAu c=1 sm=1 tr=0 ts=69a3dece cx=c_pps
 a=QW6cWtaKxEx5aDBFEJsq+w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=t7CeM3EgAAAA:8 a=omoQCDqPDwlbDjSzWQ4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603010056
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-54001-lists,linux-media=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[siliconsignals.io,linux.intel.com,ideasonboard.com,raspberrypi.com,jmondi.org,kernel.org,bp.renesas.com,oss.qualcomm.com,xs4all.nl,linux.dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,windriver.com:mid,windriver.com:dkim,windriver.com:email,siliconsignals.io:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1B0601CEA6C
X-Rspamd-Action: no action


On 3/1/26 02:27, Tarang Raval wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Hi Xiaolei,
>
>> Switch to using the sub-device state lock and properly call
>> v4l2_subdev_init_finalize() / v4l2_subdev_cleanup() on probe() /
>> remove().
>>
>> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> ...
>
>> @@ -1458,16 +1442,20 @@ static int ov9282_probe(struct i2c_client *client)
>>          pm_runtime_enable(ov9282->dev);
>>          pm_runtime_idle(ov9282->dev);
>>
>> +       ret = v4l2_async_register_subdev_sensor(&ov9282->sd);
>> +       if (ret < 0)
>> +               goto v4l2_subdev_cleanup;
>> +
>>          return 0;
>>
>> +v4l2_subdev_cleanup:
>> +       v4l2_subdev_cleanup(&ov9282->sd);
>
> If v4l2_async_register_subdev_sensor() fails, runtime PM remains enabled.
> Can you please disable runtime PM (and set suspended state) on that error path?
Hi Tarang,

Thank you for the review!

You're right, I missed the runtime PM cleanup in the error path.
I'll fix it in v2:

v4l2_subdev_cleanup:
     v4l2_subdev_cleanup(&ov9282->sd);
     pm_runtime_disable(ov9282->dev);
     pm_runtime_set_suspended(ov9282->dev);
     goto error_media_entity;

This ensures runtime PM is properly disabled if subdev registration fails.

Best Regards,
Xiaolei
>
>
>>   error_media_entity:
>>          media_entity_cleanup(&ov9282->sd.entity);
>>   error_handler_free:
>>          v4l2_ctrl_handler_free(ov9282->sd.ctrl_handler);
>>   error_power_off:
>>          ov9282_power_off(ov9282->dev);
>> -error_mutex_destroy:
>> -       mutex_destroy(&ov9282->mutex);
>>
>>          return ret;
>>   }
>> @@ -1481,9 +1469,9 @@ static int ov9282_probe(struct i2c_client *client)
>>   static void ov9282_remove(struct i2c_client *client)
>>   {
>>          struct v4l2_subdev *sd = i2c_get_clientdata(client);
>> -       struct ov9282 *ov9282 = to_ov9282(sd);
>>
>>          v4l2_async_unregister_subdev(sd);
>> +       v4l2_subdev_cleanup(sd);
>>          media_entity_cleanup(&sd->entity);
>>          v4l2_ctrl_handler_free(sd->ctrl_handler);
>>
>> @@ -1491,8 +1479,6 @@ static void ov9282_remove(struct i2c_client *client)
>>          if (!pm_runtime_status_suspended(&client->dev))
>>                  ov9282_power_off(&client->dev);
>>          pm_runtime_set_suspended(&client->dev);
>> -
>> -       mutex_destroy(&ov9282->mutex);
>>   }
>>
>>   static const struct dev_pm_ops ov9282_pm_ops = {
>> --
>> 2.43.0
> with above change
>
> Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
>
> Best Regards,
> Tarang

