Return-Path: <linux-media+bounces-66331-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id O0QdBnk7Rmq9MQsAu9opvQ
	(envelope-from <linux-media+bounces-66331-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 12:20:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A52DA6F5CD0
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 12:20:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=windriver.com header.s=PPS06212021 header.b=hTM+Ckx5;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66331-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66331-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=windriver.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C28C8312778A
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 10:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF89247DFBB;
	Thu,  2 Jul 2026 10:01:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B54F358384;
	Thu,  2 Jul 2026 10:01:46 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782986510; cv=fail; b=fRXS6AgB4o+DE7mso6DQygsAcvpk8sE4uCfF2e3yT/DoqqIfF0VwMf54mk4d0TyhczMR49qiHdsw++zNGY9LLlnZWWYXCqurfTdnSgH902fc+Ytrx2UT2SNDYEX+QXgIzrXSmA1haIXyc2/15dZvWzFsqg6l8Xweax5hDFCTVz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782986510; c=relaxed/simple;
	bh=WvnPYEzbbLh+UNj/sxZmvIpPN/M6NsyI97zqwbpNGR4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FPa7DQ6ozS7PzpvUuppJw9uBkwx7VzU8YsieQIR/HiMuqrdabEm70Ver8zkjAhRopyuKsi6E5gHh6HEg3kmMTW+jHL9IIh54ul4hynr17rqVdZecifq+YLODOW8nPKynid2OCQ2LKhEoRJCumPBqJfuyylh+SVFG3jPF+a735F0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=hTM+Ckx5; arc=fail smtp.client-ip=205.220.166.238
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6623FxSe882573;
	Thu, 2 Jul 2026 03:01:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Lw4nyABKJXmcL9T4hTKTgHrQUbEbI2HqKePEPCPJPbE=; b=
	hTM+Ckx5Q068gD8qaqZlqxtvVPtdvUcx/TZNkVKMNlxjerxnpjT5XXEUNjUNl1j9
	6pmR571jfakNhTssvu0RzvOW/iVFBDQDPB5L7nYl9K9ovN36ZNiiDNi3bkAB8HPo
	c8HW3XyrFCAWGxhBdMBoL/wQlMTvV7BafbyUnQISdvxNOSm4fpKO0Zv7t+pbuMJa
	Q8Z6LNmXvzFnsKnpUdS1xMp+rBq+qJYopCzBO8h7Bh1vLczjDt/QKOT2TkwUWeQa
	0UAC7vwDxoLd5E5eXMgs+uMzqJxcIk/7A/zQYrUmubCB79MNJMRTM1QgwXRAODEZ
	8JLAmnvyZNl9/veHk0vRnQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011056.outbound.protection.outlook.com [52.101.57.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f2e1gy587-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 03:01:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xcUoHigWFglzE6HR1W5kVTxnZd7+i/WxtJoP8IKSrrgs90kSbnOxq/u7E8r2ilCN65ZbK9QBIzlE4AFGK3XtqoNjTWfD2Z7AI3mR4b5sjXX75l/IpHfiM3M3Bv5MtmFi56D9kikPBev5oJq8Ayz5RALxSsQyXXMrc/7PFY7j2OWZurKrWYniinqQR0W9hwT3g9yz1TvAAu6VFBj9rOrX/Ck9dkfx0wbwlqkvkDQLdvG5qA5gyKJWpWpdGKx3o6LNBPiqlvg2icF8i5djRw8DTXkJAxto0fXNhF18D15aIOqm15mtQAcQuMKKwd84k518i4Zi0K43UlH3sz9aRi8tJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lw4nyABKJXmcL9T4hTKTgHrQUbEbI2HqKePEPCPJPbE=;
 b=Al7Bq6xTQ6rpOCsrjwR7q1UNn7BNMh0SUmQaI4ZHotqAE8ROnmkxK567Lb4hE3ToQsHm7aEolHdVgKkgb39bafAHdFu881lJCoowRnkPUMgAGbRzcxGvK/9iuZLYMekI/CXkN6ZXHHgh3D+WE9VJlBhSYYGlZUvzOGXI71w4Ce1xu2yPmtgSg+uTGHr8kvEtQKQuy/P9PEju35Fot++82lNeQ7jWYxA+DBa8oY31Ydjybvp/Rhsvi8jWEon1kudk1G0w6nAZ2aWTU9UhtWiel7Zd3fDZrhZJ+qd+dfBRZhYPAW7cIlaUkEOIUe0SzSPb4mFgxphk3jar+/RuEbs5zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB5332.namprd11.prod.outlook.com (2603:10b6:610:bf::17)
 by CO1PR11MB4963.namprd11.prod.outlook.com (2603:10b6:303:91::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 10:01:34 +0000
Received: from CH0PR11MB5332.namprd11.prod.outlook.com
 ([fe80::8f86:8d08:45bf:ec13]) by CH0PR11MB5332.namprd11.prod.outlook.com
 ([fe80::8f86:8d08:45bf:ec13%6]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 10:01:34 +0000
Message-ID: <de72c571-b06c-45cd-a475-bcf077b6c91c@windriver.com>
Date: Thu, 2 Jul 2026 18:01:25 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: dvb-core: fix use-after-free in
 dvb_frontend_open()
To: mchehab@kernel.org, kees@kernel.org, linma@zju.edu.cn
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260610083055.3976083-1-yun.zhou@windriver.com>
 <53782a92-ca2a-4e48-b9d8-b420741e952a@windriver.com>
Content-Language: en-US
From: "Zhou, Yun" <yun.zhou@windriver.com>
In-Reply-To: <53782a92-ca2a-4e48-b9d8-b420741e952a@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SE2P216CA0164.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2cb::16) To CH0PR11MB5332.namprd11.prod.outlook.com
 (2603:10b6:610:bf::17)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5332:EE_|CO1PR11MB4963:EE_
X-MS-Office365-Filtering-Correlation-Id: 15b5d60e-b275-4486-8468-08ded820e591
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|6133799003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	sZa5BnIeyVpgF2g1HmyuxmMoxo4NkU2HerObf/6IvCZMyBR6dtlObnOh1qGlGFlIVjtNBMO31hBILc+oSVVtrgt75voXy0uNa1M8T7dJfLAA2Hr/oIh1sZaqIEUML8YGU/w0l0gAaMvQWn+ckDE7o7rd//MprdWhoY1CcOuVQnuVaLQmHtKiSS6yyyHYDKNRY2i648YvMZSFOCSANjsODj1+7Ywnc2UQYEAImE71bKmNl4AY8QOOiighHHMhzKVUHePISSy1u65G/XCWRWMZjDMeKCMlZsaoQMRj9XKzlF2l/qL5CeEZt1ql0fTDGh0A+hpnytoQHo5+Czuv5bH/2KjXdO24Hj3wf4snlwzRM/gTXAvUh3BUG4keCCY9vQkeLC5lN/CHriTKL6fVPRDk/wMOJdYb1oCY/YIX77SSg2EMobiG8quzXpnb+LfxxfuQ5x2xFLIGCAjpxd/xa77BIMkIt72U+ye7XQI3+nTwZOoZtJycqCbZwPaGM84qcYvApa5dVfN4MwfoT1nHPznyN7TZkqW3hcK+Tc7/Qh+FWaPacGDAbZ3Fqtq4oZbZHabdd4nCfUU6eWUz4gpW/+3/HXHl82NqHg+d9CXzrdpwNgGM5JQoN1cs26TkOfW4Py2g
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5332.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajZUZEE2TDlCMFV4VEJPdzJlKytnSEc0bHE5clhRYzRpa2srSkkrV3dmSG5X?=
 =?utf-8?B?QktCNHpiVjNvSmNTdDViVzBKMEhPbUU3WHZ4N1B1RjdMRExKVXBZUDdGK1Rr?=
 =?utf-8?B?UkRWVHIzcGJZR0VUREw2SU52YmxpQnR4WVBmbjY2bjJQSy9pY0NZeDVpS3Y2?=
 =?utf-8?B?NmpiaUp0aTA1RDRSZ3oxWlZXZHFTN1hTTCtrb1FxMGdGaU5UeVd5WHZiQkVX?=
 =?utf-8?B?MEJDQi9pMHZpRk9sNkhXdnFFeTVEYk5pRE5adUNOeWdKeWVrVG9TRW1zdisr?=
 =?utf-8?B?UDNHNXhLK1RpcDRrT1YvRU12NDYzWEdmNGhXY1pDQkgwUjNibzdvTlhGcEV5?=
 =?utf-8?B?R1E4NU43bUF3bkFSeThldE9JZDFlZGFWenlMSGtybkJNUmI4a280VmIrVFhW?=
 =?utf-8?B?NGc4MmNwVXpydnpJQ3F1NytIZFowUUpwU3hZdEY4Mk00MzRUaThyODNkSlpl?=
 =?utf-8?B?NnBzSnpRS2poeWdWZEdkVnVTNmRtWThmYnNwMmx3TWZwYnJ2UDVqUW1tRXdv?=
 =?utf-8?B?ZWc4VEFXQUs5elg0R0lUL3ROb1lqQVBWTWxHY2VuTFgxaC9SNHltSllsTEZt?=
 =?utf-8?B?TUlrdHF2NG1SeXVzT2ZreEg1TmxYcitSS3JXZ29sU1Y3bFFaSXA0RU5jeDd2?=
 =?utf-8?B?dFFTMzd4dFpDT2JxNnRhMHp0aDVWSXZacDlwRnl0cDAzSFFocTh2RTNnakNx?=
 =?utf-8?B?VUl1b1d5bnFLNnFTcVlhTWY5citWS0dMTElaMkMxaGtxVGZGWUlxL3lyTmJM?=
 =?utf-8?B?dHhBN2tSTlh2b01NYjVCRWlCd2hiZk1sa2s2Y3dmT0hQS3ZXS0YxL3Jmd1FR?=
 =?utf-8?B?NnV0cDgzdXdRWWpCZC90MWFqQ1dCWGZycGhoem5kazdpVkx6cnN2WG9kZGxt?=
 =?utf-8?B?bXE5a3p1eEhpT0FycTYrUi9TVVZrcXFRL3llQWQ0Y3V3MHF4cU11WjF4eWRD?=
 =?utf-8?B?a0ZWdUV3QXBOSnBkakllT0oydXlHUmRmZGNSRmw5YkxpdThOb1FzN3J0eEx4?=
 =?utf-8?B?MFZ3NWs0TmFFTFpWOVlFa0hWZkt2VDNGRDAwdmRQc3BhN2tEVjJpZktxTGI1?=
 =?utf-8?B?UFBLa2t0eEZjUks0b0w2QnJGNUNmaEtGY0NyS2Q0T2ZwUjNtN00rcXNFdFZV?=
 =?utf-8?B?Vy9XWlcvemRDOGlFb20xTmFKWW1qRHJsNVJsdVZWVGtPQ0dUOXMyNit4T0RN?=
 =?utf-8?B?UWprVWdaVTk1TGNTZ3BCZkcrV3ZQaEFkVm5vTDZsY0JoMGNwVStxZEd6RVhV?=
 =?utf-8?B?cEI2OFBES1ppUlRaaW40RHgweUhzdStncTcrQmhsQmlyN2JuZTB1SE1GNDVR?=
 =?utf-8?B?bFRHbktpOElFUTZyb3A5TmxkdVQ4c2s2UzF4RmZ0ajZ3dnZ4T3UwanB6cDBX?=
 =?utf-8?B?WTVmSW9jUVRFQ3F4bStPU0dPV3cwSHliLzRKeHVUN2pLL2grL3AzclB1aGdX?=
 =?utf-8?B?NWFqbkd2bW5LeEZVNC9VbTQrS2YreEtraGtlbVpDUUdDSlRLbWZ2OGJmUVd6?=
 =?utf-8?B?akZQR2x6UUM4ejJHWDJIVU41dGF0YW9XMnB3MnN0dmFDTURMZEtjSDJMdmdF?=
 =?utf-8?B?TmZwSVgzODNaQU9WTmJUNEZEWFVPd256ZlBDVWltRzhOTUhwbXMwUVZMdldX?=
 =?utf-8?B?NjVvQ01tMndQV0tacEZ6dVVSVWxQTGxYV0l3Z1FqS2k0YnpWMFNwbTVuQ1kw?=
 =?utf-8?B?L3c2NlpxWHBBelBlSkZCd25xenpEMVdRQmZ5V2tqdnBESDZnYmZEaXlOdW1L?=
 =?utf-8?B?LzR5dUJTd1ZDb1lwb3FKZjdFTjl3bTRYYTRIbGFvdFBkYUxjMlhpNHpEOVBH?=
 =?utf-8?B?Y0pJeHE0SnY1N1ZqUWdINGxQVVFlWGtoNGpvcUFxZFVEWnBjT2R3NkFBSS9K?=
 =?utf-8?B?ZXdNUklSNk94Ym1pdkRhL2c1aEh3dTBhaGdlNHNEa1ZSL0Y4NWU1b3Fha21E?=
 =?utf-8?B?dXpIRmthelhxWnVzM1hqYzlQd1VicDBsUGJseFlITmt1Q2xieFNLTHIyODht?=
 =?utf-8?B?ZFpIVkxtRVR5dFFYb2Y4UDQzQStsbkZpT20yVSthWm1wZUhBL2tjaW9kRGVS?=
 =?utf-8?B?dzZ6a1Z4UXd4U3kyTVJidzJxdUNmNUFBYW1LVTNiTDFHL0tPcFFEUDNOS2Zq?=
 =?utf-8?B?b251V2lGM20xZmNvalk4eDZob1JRS2ZEK09scGR1aGFDbFNGZDlmOURaVkx5?=
 =?utf-8?B?NEVDNHkwb0c0OE1kSGIxMmQveHRtZUFCUE1xY3NDUVdRR2ZzVFR2MTlEMDIx?=
 =?utf-8?B?eFNGVENVWWFORHNmTEx5VFZMdFhRZ01rNVJIL21xWnQvSzluTUVZMnlocExC?=
 =?utf-8?B?TjU3T0J0L1pMNC9TenV6NVFLNWRCeTdyc2F1VThRVWdaaWVUZWlRZz09?=
X-Exchange-RoutingPolicyChecked:
	UXIE6VgTZZPQhCu/GyZOXhdp9KPaq+gRlQWdFIurRLiQfSDdhonjusVXuOkLOiu5RcfSD8vNoYWGYBuzMJtIf2QW6gnha8ELEKKNBNSeSyP4HfoGzT/1irBmd9dqi2gTKtwy8pDD7ASHAlqL6y3U5YckiozfBCOTFlsd0z9thmn02jO4NVIdMwUNeXXmoW0izCaPujO2kAEaH28b1Zs2/35tVLsgQ7MiLM9VxXXkzRe6dhzJS1KcgVQ/IIiAjnvQOx8RNi0nK8vbcdGozpxydwqBzSqhgCj65qtVi86BmDF/fo3JA67rOVNefLRTxtnLuFk+nS6WXL9E8FYMd0SjmQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15b5d60e-b275-4486-8468-08ded820e591
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5332.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 10:01:33.9111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QyRoDkMggHVs6v47SeMOVV2u9TCxh/aOXhupBOXZWw0igbqn7SRaimVs4FH7b5gP2GzjRK9oKji5GA8/HTFbpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4963
X-Proofpoint-ORIG-GUID: YQZqezNggeegi-ucCgWgpFBRYIlmHDjq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEwMiBTYWx0ZWRfX11zZ0rifZPeC
 eMMdlwOR1xXYLraPoP3jW66Xox7vbaqYfIX8Oe+J5wlJDkP69dX+MuKgBItRkYLsBu2PeSfX8b1
 /J8usB8XAgKHE84A7WmCM8OoI/7iOs760UMQLAxnxfMHik9qb2P/
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEwMiBTYWx0ZWRfXyuc3DOLHx74M
 7nqogRCQdoXHVDO/7lzbc8z8Qvz0cxSTgLl2Rkw4p1DMj/Jyqc6S9JNAmfT4EKBqgMTaN5fMea6
 0cbe+U6+4lKXEuEM8DSHwXWOkKB/TYKA6yN4tPwWJiGMHkvnJsG3HthA6nrR2kq+W08VnX8BEIE
 yPhylvPNhhrqfwGM/pMuGUEFCAZEyNNknbq45yP7oCGRB3V1z3IhIK6TulUPRDg7JGkeLucKKvK
 j090eqnD2YY97PfBzLgoVGsMoH++elIVORDk4db61Y45J78MebjkrsZ8/VRjewxGYuMMz7mAKgs
 ENIEsikTtra5ckRa5TP8UW+fdIbhfwsNgn4EMqxLczQvWWWJLIBqU2PtWs/zlwcr+Ac8seMfSi1
 LotM7Syuy/XKlIPvRRhcG3SoCMmKXZgaHVqXp4zeo5i+6VPPIUKIhEUyeAuedaW9gHxJ3mV4oSq
 mJoxC5ciJ1Tgxj7bIEw==
X-Proofpoint-GUID: YQZqezNggeegi-ucCgWgpFBRYIlmHDjq
X-Authority-Analysis: v=2.4 cv=GsByPE1C c=1 sm=1 tr=0 ts=6a463701 cx=c_pps
 a=P8hJoqhRnqo/cwUvmyxmUw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=edf1wS77AAAA:8 a=hSkVLCK3AAAA:8 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8
 a=skCnc3lsXe1PmKgtqsAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=DcSpbTIhAlouE1Uv7lRv:22 a=cQPPKAXgyycSBL8etih5:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020102
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66331-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,windriver.com:dkim,windriver.com:email,windriver.com:mid,windriver.com:from_mime];
	FORGED_SENDER(0.00)[yun.zhou@windriver.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:kees@kernel.org,m:linma@zju.edu.cn,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yun.zhou@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A52DA6F5CD0

Friendly ping again

On 6/25/26 19:24, Zhou, Yun wrote:
> Friendly ping
> 
> On 6/10/26 16:30, Yun Zhou wrote:
>> dvb_frontend_open() calls dvb_generic_release() in its error path after
>> dvb_generic_open() succeeds. dvb_generic_release() drops the device
>> reference via dvb_device_put(), and then dvb_device_open() drops it again
>> in its error handling, causing a use-after-free and refcount underflow.
>>
>> Fix this by incrementing the refcount before dvb_generic_release() in the
>> error path, so that the put inside dvb_generic_release() is balanced and
>> dvb_device_open() remains the sole effective put on open failure.
>>
>> Reported-by: syzbot+40339ea82afa8184ad5d@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=40339ea82afa8184ad5d
>> Cc: stable@vger.kernel.org
>> Fixes: 0fc044b2b5e2 ("media: dvbdev: adopts refcnt to avoid UAF")
>> Signed-off-by: Yun Zhou <yun.zhou@windriver.com>
>> ---
>> v3:
>>   - Simplify fix: increment refcount before dvb_generic_release() instead
>>     of introducing __dvb_generic_release()
>>
>> v2:
>>   - Fix Fixes tag commit title
>>   - Add Closes: link after Reported-by
>>   - Cc stable@vger.kernel.org
>>
>>   drivers/media/dvb-core/dvb_frontend.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/ 
>> dvb-core/dvb_frontend.c
>> index d082b6c57c76..608525d08277 100644
>> --- a/drivers/media/dvb-core/dvb_frontend.c
>> +++ b/drivers/media/dvb-core/dvb_frontend.c
>> @@ -2887,6 +2887,7 @@ static int dvb_frontend_open(struct inode 
>> *inode, struct file *file)
>>       mutex_unlock(&fe->dvb->mdev_lock);
>>   err2:
>>   #endif
>> +    dvb_device_get(dvbdev);
>>       dvb_generic_release(inode, file);
>>   err1:
>>       if (dvbdev->users == -1 && fe->ops.ts_bus_ctrl)
> 


