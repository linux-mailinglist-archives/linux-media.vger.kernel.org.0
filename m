Return-Path: <linux-media+bounces-55989-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNeBLZzPuGlfjgEAu9opvQ
	(envelope-from <linux-media+bounces-55989-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 04:50:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4EA2A35E1
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 04:50:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9388630470A9
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 03:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9266534DB4C;
	Tue, 17 Mar 2026 03:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="oUqJA5jy"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B5E31F992;
	Tue, 17 Mar 2026 03:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773719417; cv=fail; b=OW8IIrkYZuxJlIRw1nGtzCmko8cNL3Is2FMbieJeLTDenzm9YhSfaAYh/TicyF3ikHvYM/ZMCF4eD14pCkS0sWEswsvZ+9SrFd66wWCjMhBFDp4Sveg7gLZDR5IqiM6piqK1wtaHK2pZg3BRsS/FNmaoD3LgbovFz8XripghWd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773719417; c=relaxed/simple;
	bh=ZglJ5/SAe8nA1aUh3b1NFiZgqdLEJxl+wpDXJhPHE4k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=W6f+zpWefdOK7oIQXG2fAjUIR6eEAHxgBhJnPGyZ902NgcYEoSeQQik1undNJwk7V1xmd2uZSi6p7Twerf8yRfpbKqgfMoexmJt1HEzYsP7tAMjHe1prC2IUPmGnSXpuwad7Ib3ziRSdjrKXLQdATtmxVukwJY+SSm+erWlFsJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=fail smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=oUqJA5jy; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H2mLWl1027735;
	Mon, 16 Mar 2026 20:49:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=rqQ6prR8FMeeed6Vg9zr8NfG9SudfX6XfwhFmSHoZSE=; b=
	oUqJA5jyclJCz0yEzgVIbz1xRFMi0KOyqx+8XFAasdlwuQB717NoCtEK0yeihjU3
	7w0joaLXMd3kCw3aKtWncrsTlvCfAqgnfEcXIUXsYhbarpB+/a8oTdZF5CQP36uK
	4iqqdFzJzDg6mau8/n/olIFYXhag/mn/ZFbliABpQTgmoYwTUNlyjWJkQ6ze335v
	7q0BJaEybeW8QUCn+X24sx2zcjigTv9VmK7ezf42w3vU7pSS8/SYPv+vSdPuByF2
	s6rzu8+8MH44YcsxwlgBBYaeHyXRiqptJZjWB+HXWs66If7lmgQQQczL2mF7MJVZ
	56d1szL9xbeQ5+Mq/73SmQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012052.outbound.protection.outlook.com [40.107.200.52])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cw2y12p1a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Mar 2026 20:49:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ciFhxb6Q9Qsq8EP1g+GhOD04dpHqd3XRBBZY+kIG+91Q1i54mXO/3VcfDM3ylP00s5hhvJJpRiBhzPTd3qJNv4V6CgEV/aMk1SypZJ8vb1f2E0T6Mhxcm3A/7KFQKJJK6WsI5MAujQUrCJTp4f6cjcTgXCfSSWDABTwFwmmCTp7W7OmQL+IJ87flip+Ir9x0kFUM+JxOCnsFjxq6lkVH+KyHKDo7lDjBZbKFyMjGv4lH23ijl9X/scT63Q9qvsclyEItX2eBJZ58Z1KP9wHtplYQwy4EjvVtnMW4/pp0spIBVajwNOALh1AEMZKxk9JkHcCLSF0iJWZ6SRM5XjCkkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rqQ6prR8FMeeed6Vg9zr8NfG9SudfX6XfwhFmSHoZSE=;
 b=QF26Me2K7+ij/1BERpuyPfzsNXJI8CpcxTW/69yj4iDXhAPQBTdyp2Tz+/a/qbVtxiJnzlZiKNtvxjBsAmH/+2fX8ybwiirkQFqj7UPikBl+DC8XUxmmdxIkBJSwQ5GyRsMfuhtPsG1wRogrZ3y0Lxl7aLrDRwEwPNr3JbWd95Z9F2n4Q5SdMpwOJ7oJ8WCQSvFTWzJrCx3VGkAELOatZwt4zIPjnQjtZE43dHglaGr4STh+AEgSKKMc74lEglmvwxX+u3VjCoTqEsH/tqKb4cwyyst9UR/1XkR1fCV2poN3FVka4HoIITNIMbBu1J3pr3ff+DhXztjXPuevK0lCoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by PH8PR11MB6901.namprd11.prod.outlook.com
 (2603:10b6:510:22a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Tue, 17 Mar
 2026 03:49:12 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669%8]) with mapi id 15.20.9723.008; Tue, 17 Mar 2026
 03:49:12 +0000
Message-ID: <e2ebea0d-4f63-42d3-a6dc-596905b41d93@windriver.com>
Date: Tue, 17 Mar 2026 11:49:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: ov9282: Add test pattern control
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        tarang.raval@siliconsignals.io, jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260316090558.1537823-1-xiaolei.wang@windriver.com>
 <CAPY8ntAmtXVwi0B8QXtzDKf0RrEc8fDOhVf662=dnT3h2oZ+iw@mail.gmail.com>
Content-Language: en-US
From: Xiaolei Wang <xiaolei.wang@windriver.com>
In-Reply-To: <CAPY8ntAmtXVwi0B8QXtzDKf0RrEc8fDOhVf662=dnT3h2oZ+iw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR06CA0188.apcprd06.prod.outlook.com (2603:1096:4:1::20)
 To DS4PPFD667CEBB6.namprd11.prod.outlook.com (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|PH8PR11MB6901:EE_
X-MS-Office365-Filtering-Correlation-Id: 89a83651-70e4-49f7-3f4a-08de83d82699
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Md9krkuvuVyXw5Y+g55gv19rxZSx624J9pbmMYksUBrheU+E0JMYI+fOu517Jdc9GHFQE61Xl/HGnBvur15uDrexQJCGIVg5Xp3EWYdQ5aGrUpNBJ9Ra5yOBj2RURce0ZyD02/r3lbWnFJIESSNNtM8ofs2ynw4Gq9EGqv1DkP4kzIfUDrrdd8cv4S05lNLHeAI+VgKt8wLO+HVgIYXQk/+kGvOTawM+DCsF9OzNsc626CkW1z4muTMbuV98uikQpwgBW1iizSNGvBUZ8fU1KgFEUAX9nMn90d/m6jzqlx3hNBWMCIFWEyGC3yAewSKgKmz3GrQZd0IHMJ6QAieheJhUHIUbwiShPpoau3+K2cUrwslekIhD5g7NlPywWKsi6dtK/boq21JgMveeGMmHxiBBUX50An63XckrYCf0e2ZHWgYCYLzrCNhCsGXhaIOhyNfiYyg+rLKBQi1BkdAzp49HFUg+1TMQwop7y0qTXtIIZMsgvJcHB20yPw0z1/rYwSHcWlvJgsRShoMzN04T4ZdiFXWXyQTj8kJOidt6qo4rvU1s/0S4tv1+/ed69znj7ZyG/k4N4VwvvSo6E8p5hRD1E+E6jBUPwgI+sxVM1VxUSSHxl8A9RGcqf3bvy41PSn6tNDHKDPTZmVgeJ3lDVtswR31t36uOVcKvuUlroxEpz6SBZzvCY5Z602ODj5dEzAMycX3L8bNFgrWAYZJYnEOuz8XlA75A/JYJRNjgIt0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlhQRVJPdGpsc24xOGMxNyt2MjExRHNldTltYnZoV2QrUmJjcDRTMFJTVGhp?=
 =?utf-8?B?SjhBL0xMcmo5Um45Z2duSWR4OXRHNWhpTzU1R1RLTlkxUzNFNEhlS0tZakZ1?=
 =?utf-8?B?Rkp1RnBORjZESk1iNDJWYzNnSEpsOHFDT3B5N2oxSzczUXYzd0Y1Z2M4di9F?=
 =?utf-8?B?K0tHNTBEY0VYQ3l0Wng3QWVqczJ1RWQ2UzUxKy9HS2JnSWpzSVdWL2lDRXVw?=
 =?utf-8?B?bCtjeWtNOVBROXpEb3k0TW1Ud3JRbzMzQnVJWklOaWMrOFM3cXlGLzJUVytL?=
 =?utf-8?B?cm91K0NRYmdJTzI5eUtiRGw2cFhMa2VBOFpMd24zcWloUUh2Z0lMaXl0OThU?=
 =?utf-8?B?dldJWGtwaytUdmR6TUNjekdPeEw0RytkWC9CRzR5THV2UTd6Qm4vUk1ZZ2c2?=
 =?utf-8?B?M0QrdFZJN2ZBK2dOeE1iQ0EzUUwxUzg2WkM3aG9FT1o5Nlk0TE14TDB2Vllh?=
 =?utf-8?B?d3V4VUdVaXN5SGtvT2lVcHNQK2ZxWHB6RWJ2eWJtK296Mzl1TmwvdmxNMnJh?=
 =?utf-8?B?TzdIWU5RUFRTUlpiNzUrczFjUitsWmtlWjRNSEg3Z3hKU2NNVXNlemVSZnNx?=
 =?utf-8?B?YTdxQVlDOTlqOVQ4bWNmNTNsNEtTQzhhVGUxc0ZzSEt0SlQrL0pCcFVITU5Q?=
 =?utf-8?B?L3JnQWVLSnE5Nmw2dVRhY1J6bk1zeXRGaWFjS2hMYjBjWm9WYTVTYmZRZU5T?=
 =?utf-8?B?U1JGUjRIUTZqUnJyQURxL1BHWXp6ZWZnWXBvK0NkUWFMRk5iOHc4NXBESldY?=
 =?utf-8?B?eHY5UGQraHZhOHg0dnh4Ry9uRkhDUXFxVlJyZWFvNUtyQXFObmNMTFE3czZh?=
 =?utf-8?B?V21aekRuMmluWHBpZ0ptYUNpejB4K3FwUFM4bm9jL1RjelRGcjVHQnpIMnlR?=
 =?utf-8?B?WlpnbXFPV3FxSHZpVEZtQU5GYXdlaS9wUnJ5Nnc5eG9ySjJRazl4Q0YvRjMx?=
 =?utf-8?B?ME52ZVpDNEdwY2dWWlRPeXNjQXlURjlWdnA4S3lnK2VLWmlhcEpYNXFKNGFl?=
 =?utf-8?B?Z29YOXRvOWF1WTRJak11VEFDaGoyVzRQbjJqaU1PL1RpK3cvU3R1bzhqMTlP?=
 =?utf-8?B?aXZJTjBja040VWREVnhKSVRhVnJObWw2TjI1OVNXMGNoZlpJb2UzSVVYekdF?=
 =?utf-8?B?VU9RUjl2bFJuMnI3RkZ2RkVTUlM4U3ZCTHBOY3hscTZjcHJjRkRxdk5qYXZs?=
 =?utf-8?B?R25QYS9FRjdpSVo1NVZ2bzNSQitTYXFRUDFraXBqN2lHYVE2a3ZBU2YwcWlP?=
 =?utf-8?B?SStJM3Zha0VJb3FJNzVKMTcwTVNQMU1rUTdUSU01enBZMjZFOWpkWDg0RUQz?=
 =?utf-8?B?S2x5ZzAxMTJnTHMwd2RIbURIWGx4UkdBWUY4WVhPVEtveURwelhETmxpZXVl?=
 =?utf-8?B?Z1N2ZEgxRVhhaGpKNDQ0c2N4SkRXNzFoRTV1OGZ6Y1g2clM2UVE4L2ZBKzRz?=
 =?utf-8?B?RkpnSm1iNHRudVYwRHhKM2Z6K2w1UE5paGZneEpsSHhQbVVNaUJFRWFNQUlB?=
 =?utf-8?B?ek5xbFdseVM0UlhnV2dLWXZHVklyTGlLc2Z1WUM4WjJrZDJHL0FvOXloYWRj?=
 =?utf-8?B?bG5EVEFDdkg5UlJiYVMzYUVySUE0RHk3ZHdEOTFvSHRUT3M4UGpQSEFxQWdU?=
 =?utf-8?B?REIyS0xDUmZIOHdUQVpuR2l6cnIvWTk3bU1FMHVpeldiWkUwYkFqSUdvbmFo?=
 =?utf-8?B?cU1Qc1RLelExYmFNUGloWWRpWjBaZFUrSE1xbXlqQVBVeDJnLzF1UXZmOS9y?=
 =?utf-8?B?VndVR1ZKZ3BTeFdBNElCQkFtbzZlbW84Sm9xODdEOEZ1aElqcmR0VHpBMUU0?=
 =?utf-8?B?T0NzVEx5QXlkbGhOdkxrem1UVjdtanNYT3dhbjlsUDdRK0F5d29rVk9qaXlN?=
 =?utf-8?B?MG1lcEtQMXhhdmMyMEplQWszZlFhWEt1N3pISkUrNVA0Y215dnJ5L0crNTRV?=
 =?utf-8?B?cURvUnUxazdWdmkvQTJldXdXSjlQN1hWWWZ3ejdNanB2anBzd0NmNWdIUmNp?=
 =?utf-8?B?NmtHWFllazhDRHZoSmo4Q1RDMGZSM0c4bG5NeFFrQ3pIdnpDU2FINTIwbHdr?=
 =?utf-8?B?VFN4azNwTlBIOGxqbUtxM1lNNUhKT1k5OGtWMXB3Z05xMmVkdTNzWDdZalZn?=
 =?utf-8?B?bHdNOWloUmZBdmsxRVFnV3pGYkg0M2sxM0NaUnA4WDVwMnlydUk5WkJwNHhD?=
 =?utf-8?B?UzA0Vkw5SkowbXo0RVQycFh1MStOLy9wbk9pVURqdm1OTmF3aEFVOExVUFJM?=
 =?utf-8?B?eTFnS2djQ1ZRdDdiV1hLSHJtWVlCMW5uVHRnZndGQVh3cVlRK2w0T050d2Zq?=
 =?utf-8?B?ZGwybnA4ODcrK3pZbTVxdzdHNU12QWVMaVBRaS90MDQ1UDNGWlU3NVpwZ2Vq?=
 =?utf-8?Q?zlNjHyy/RvFf8V7s=3D?=
X-Exchange-RoutingPolicyChecked:
	YPG7eNcAvPYNCM5iIP3ztQyZ+JY8v+kLgQLcaJ7hYIFuxzQnjE1lBYb3sKyy/v70vyDCkNLfBV9XQB1GgeCmoQU/OM9hOLSLAEP1URQrFFLsJ6+SKsBgyAnZHbxaYblGHQtdJ+l9PrEWorQpN2fTnxkQ8x7GvSXDly/ungBnBV6GP5WPADDgKchPIqnHr10YoEnDXq9Pg5zy4D6VcK+TTpAvU9Tm11+0a/1MT9Ky3fen7PX+/AXBRJvWEaEOnVmP+n+DAiwCt0xm7FzoVFI/NAIsw3di/AOfphuwJ7fiL+3vEtiSKtwS1WStHCkZSK7TXhIfxClr7tFBB2xjRQzzsQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89a83651-70e4-49f7-3f4a-08de83d82699
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 03:49:12.0438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hiw0/iT2YIZCgsYavq3HxPl08aFQPb+5HDBbuZ6OK0lPNwx2sShKvxu1jwumf+0U4GOYn1vDsiU1bVyqUVxg/QOZEeC8dJORVO8q9MPgPjk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6901
X-Authority-Analysis: v=2.4 cv=CekFJbrl c=1 sm=1 tr=0 ts=69b8cf3a cx=c_pps
 a=57vGMAxBKyli4KBmgVngpg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=t7CeM3EgAAAA:8 a=JPZjYV8iPeyskTDeuOoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDAyOSBTYWx0ZWRfXygBrjPyc6n5j
 2GxCo0XkjUSM6NhtJkqdB/5VmAWFilhsKK9kdFfE3P6W7VjLys+kggVhzDiSJOHNOZEN//ZWnE9
 DBtBJJvvUSd6qbRtXnwyyZbqEAfjxi7YIJVOz8asQMD8Biwd3yTisHi1t3e6mahN4ckZET9lv0h
 Yw8Mdjt6LomAVj/sfVace6nk+JRC3cKNay3HlIbtTf8xR8NwM3hTqLc9PpQiJ0yYZ2ymN2R0nRM
 qZjvcjOdNPUK5bUTQ+mi6jIVSTqnm1zRmyo7n5wTWa5cJfm7P4HKQvINe+jT4znjM9fMbKgBnGn
 i4BTsdcux+6EXI+qEWscoBIOFGbQaUbNHpcuAVUZj2ooiNAS9PvGzeaohZNdvs9n6mu9r+N540S
 kUGDkaZFjvrNK5VJXmFugK3lxQeX1kQCEWzFTWJ+CfH1b0D/wTS/9L1oLXKkeIB1iD0F2J75Kyv
 3o1aLTWXg+cnEeiXn2Q==
X-Proofpoint-GUID: lc6QZU_5WL9RFTRvY-cm5N_MHswtfjTf
X-Proofpoint-ORIG-GUID: lc6QZU_5WL9RFTRvY-cm5N_MHswtfjTf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170029
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55989-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,ideasonboard.com,siliconsignals.io,jmondi.org,kernel.org,bp.renesas.com,oss.qualcomm.com,xs4all.nl,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4A4EA2A35E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dave,

Thanks for the review.

On 3/17/26 00:38, Dave Stevenson wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Hi Xiaolei
>
> On Mon, 16 Mar 2026 at 09:06, Xiaolei Wang <xiaolei.wang@windriver.com> wrote:
>> This adds V4L2_CID_TEST_PATTERN control support.
>>
>> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
>> ---
>>   drivers/media/i2c/ov9282.c | 47 +++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 46 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
>> index 2167fb73ea41..f64b2084b8e7 100644
>> --- a/drivers/media/i2c/ov9282.c
>> +++ b/drivers/media/i2c/ov9282.c
>> @@ -104,6 +104,12 @@
>>   #define OV9282_REG_STROBE_FRAME_SPAN           CCI_REG32(0x3925)
>>   #define OV9282_STROBE_FRAME_SPAN_DEFAULT       0x0000001a
>>
>> +/* Test Pattern registers */
>> +#define OV9282_REG_TEST_PATTERN_BAR    CCI_REG8(0x5e00)
>> +#define OV9282_TEST_PATTERN_BAR_EN     BIT(7)
>> +#define OV9282_REG_TEST_PATTERN_SOLID  CCI_REG8(0x4320)
>> +#define OV9282_TEST_PATTERN_SOLID_EN   BIT(1)
>> +
>>   /* Input clock rate */
>>   #define OV9282_INCLK_RATE      24000000
>>
>> @@ -462,6 +468,18 @@ static const struct ov9282_mode supported_modes[] = {
>>          },
>>   };
>>
>> +enum {
>> +       OV9282_TEST_PATTERN_DISABLED,
>> +       OV9282_TEST_PATTERN_COLOR_BAR,
> This feels like an odd name to choose seeing as it is only a
> monochrome sensor so there is no color.

My mistake, I will correct it to:

enum {
     OV9282_TEST_PATTERN_DISABLED,
     OV9282_TEST_PATTERN_BAR,
     OV9282_TEST_PATTERN_SOLID_WHITE,
};

>
>> +       OV9282_TEST_PATTERN_SOLID_COLOR,
>> +};
>> +
>> +static const char * const ov9282_test_pattern_menu[] = {
>> +       "Disabled",
>> +       "Color Bar",
>> +       "Solid Color",
>> +};
>> +
>>   /**
>>    * to_ov9282() - ov9282 V4L2 sub-device to ov9282 device.
>>    * @subdev: pointer to ov9282 V4L2 sub-device
>> @@ -586,6 +604,23 @@ static u32 ov9282_flash_duration_to_us(struct ov9282 *ov9282, u32 value)
>>          return DIV_ROUND_UP(value * frame_width, OV9282_STROBE_SPAN_FACTOR);
>>   }
>>
>> +static int ov9282_set_ctrl_test_pattern(struct ov9282 *ov9282, int pattern)
>> +{
>> +       int ret;
>> +
>> +       ret = cci_update_bits(ov9282->regmap, OV9282_REG_TEST_PATTERN_BAR,
>> +                             OV9282_TEST_PATTERN_BAR_EN,
>> +                             pattern == OV9282_TEST_PATTERN_COLOR_BAR ?
>> +                             OV9282_TEST_PATTERN_BAR_EN : 0, NULL);
> This register is never written from anywhere else, and all the bits
> are related to the test pattern, so is there any reason not to set
> them all?
Agreed
>
>> +       if (ret)
>> +               return ret;
>> +
>> +       return cci_update_bits(ov9282->regmap, OV9282_REG_TEST_PATTERN_SOLID,
>> +                              OV9282_TEST_PATTERN_SOLID_EN,
>> +                              pattern == OV9282_TEST_PATTERN_SOLID_COLOR ?
>> +                              OV9282_TEST_PATTERN_SOLID_EN : 0, NULL);
> Again no need to use cci_update_bits as all the bits relate to the test pattern.
Agreed, will switch to cci_write for both registers.
>
> If you're adding black, then you could add white as well.
> Registers 0x4322-0x4329 set the 4 pixel values that would equate to
> V4L2_CID_TEST_PATTERN_RED, etc, so writing them all as
> CCI_REG16(0x4322, 0x3ff) and repeating for 0x4324, 0x4326, and 0x4328
> would give you white.
> Then again the only mechanism for implementing that is to use
> V4L2_CID_TEST_PATTERN_RED etc, which is rather quirky on a monochrome
> sensor. I am thinking that white is more useful than black if you only
> implement one.

That makes sense. I will implement white. If there are no other comments,

I will define these three as you suggested:


enum {
     OV9282_TEST_PATTERN_DISABLED,
     OV9282_TEST_PATTERN_BAR,
     OV9282_TEST_PATTERN_SOLID_WHITE,
};

static const char * const ov9282_test_pattern_menu[] = {
     "Disabled",
     "Bar",
     "Solid White",

};

thanks

xiaolei

>
>    Dave
>
>> +}
>> +
>>   /**
>>    * ov9282_set_ctrl() - Set subdevice control
>>    * @ctrl: pointer to v4l2_ctrl structure
>> @@ -662,6 +697,11 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>>          case V4L2_CID_FLASH_DURATION:
>>                  ret = cci_write(ov9282->regmap, OV9282_REG_STROBE_FRAME_SPAN, ctrl->val, NULL);
>>                  break;
>> +
>> +       case V4L2_CID_TEST_PATTERN:
>> +               ret = ov9282_set_ctrl_test_pattern(ov9282, ctrl->val);
>> +               break;
>> +
>>          default:
>>                  dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
>>                  ret = -EINVAL;
>> @@ -1242,7 +1282,7 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>>          u32 lpfr;
>>          int ret;
>>
>> -       ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
>> +       ret = v4l2_ctrl_handler_init(ctrl_hdlr, 13);
>>          if (ret)
>>                  return ret;
>>
>> @@ -1314,6 +1354,11 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>>                                    V4L2_CID_FLASH_DURATION, 0, exposure_us, 1,
>>                                    OV9282_STROBE_FRAME_SPAN_DEFAULT);
>>
>> +       v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &ov9282_ctrl_ops,
>> +                                    V4L2_CID_TEST_PATTERN,
>> +                                    ARRAY_SIZE(ov9282_test_pattern_menu) - 1,
>> +                                    0, 0, ov9282_test_pattern_menu);
>> +
>>          ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
>>          if (!ret) {
>>                  /* Failure sets ctrl_hdlr->error, which we check afterwards anyway */
>> --
>> 2.43.0
>>

