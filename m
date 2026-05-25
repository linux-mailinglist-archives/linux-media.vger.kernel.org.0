Return-Path: <linux-media+bounces-62693-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WF9GKrOnE2opEgcAu9opvQ
	(envelope-from <linux-media+bounces-62693-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 03:36:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A3D5C52E8
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 03:36:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 347983008206
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 01:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBEB51F4611;
	Mon, 25 May 2026 01:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="gukvHxdh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87DA1991D4
	for <linux-media@vger.kernel.org>; Mon, 25 May 2026 01:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779673003; cv=fail; b=J3rpTTx3G73AMLylqQXD/UDycwu85yGsaUsF4+AOCWjF5kpPtj0/43eu3uvZtNFiEPtGQ/6U1lDz6auZTLW/5uG23j93E0JYm3uOeICTesdCVsYLpOXuC6Dhq57uTnnX4dSbVupsTWh8ZEqQ7olpCBaPAFbaA8nu60pD2UczqOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779673003; c=relaxed/simple;
	bh=N1h5LT20Qal3ve+kqOqm3keyIP2xicB+kkDrYULjtPo=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IZVOgecZVeIy7XUabgKwqegkKONi6d8sbzP9leZbBoBwOVxOQuOxw2KAgCQXnzVw5TEIFBFAVqInx2pJMDLepmsJ7XUu3P1F6FPzCbDfOiUXu9J7bTxYgWRo6FPB5P946VQmTCkxDubLCj0+pADr3qOfC2MRRtTKWk+OwmJ1VEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=gukvHxdh; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P1WVtP1088199
	for <linux-media@vger.kernel.org>; Mon, 25 May 2026 01:36:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=N1h5LT20Qal3ve+kqOqm3keyIP2xicB+kkDrYULjtPo=; b=gukvHxdhT9p4
	ZLCIQU2IYdwweyx66skFXW/rKM6RIac6tKDlSDThzTVKY9PsrptBtCjXwizlLyKJ
	miAMZVGgpwdqfBgFJN2qUzC+/9+nji5Ch3Lz2NjlcL838bgRkVAnezGpCek8xEn4
	qGwwV5VxRbP6gIhZwpBq1ckukj2LA76B45D94ceG/D5MJl95hpwEl8DK6QsTc5Fh
	0VUeXS+d80HstS0Rflak7tTJcE8NKrTr5MGI1P+5Gu/a0melep3MiXypV8VvmVP2
	eetAb3PyCNXZU2TfDvZMGvwSj1zjDkN+mRHmNDn07HP/R06WztvS9mNF2XCZ6MRx
	fy1fG8ubRA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012004.outbound.protection.outlook.com [40.107.200.4])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eb3769v1d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 25 May 2026 01:36:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b/Zj9PhJ1gp+m7tgu4/EJK8vU0TLeyc0rhU8CMeTTaJY6ZEnW/TXBfIFUcfZh23R6ih12Jtb8ZH7s1F8jdwyKQfEW3rPDqdsBdc1EhCZEu+pQdKaL8Fk+EzswdeKfAqzEmJPVZfUTtvaHtS+u6RTDlD5dvDYuY3yupB7fBnsbSQG8Y7eUMgLrcUTRzbadZBTbmxHMc4BJfmfYjUyktNk5e0jsP+tZszkY519bKfbSCREtgY0gEu5e3eOJIiWsfZku9XSEVrcW/TLYaVESssQj/2N2WDwYSommx6BPBlIM6FqaTpqc4tuVDyIbdHXrbPt57ShtC62faRCyZr7J7I9dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N1h5LT20Qal3ve+kqOqm3keyIP2xicB+kkDrYULjtPo=;
 b=HazlrBoRaKw8senGZt/GNUPWdl1A8J7WOSkMT0fuYX4Oisu9OLUEmn10RWS4B12MyQMF+QYAa8Aw3M2dSSDb1nvz3xkzy7dCQWZqgXeHq0WsZ+VCHKz3ZNdy18LfdYi8V64M14AjJjPwVHZJM3V05i85t5/Ni/90Pb4pwsaboumnF/gdGwMhCW6E6UyHf2VsG/PFOZnUpE6cUUUouGdOM/RBpZHwoM7mjsYBEssS8N9XF95ZSO9PoJI/+Gjs7R8+25+jnEX3HSt+nPQgHO/ZWXzDG5lpmualXI2Kqs6TvC+wGfXjgjm+jQQsXaWrEQobpfc7hkEDMmAH9FKGNqEgwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB5332.namprd11.prod.outlook.com (2603:10b6:610:bf::17)
 by PH3PPFB6E746C59.namprd11.prod.outlook.com (2603:10b6:518:1::d43) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Mon, 25 May
 2026 01:35:29 +0000
Received: from CH0PR11MB5332.namprd11.prod.outlook.com
 ([fe80::8f86:8d08:45bf:ec13]) by CH0PR11MB5332.namprd11.prod.outlook.com
 ([fe80::8f86:8d08:45bf:ec13%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 01:35:29 +0000
Message-ID: <c88eed2c-c795-4d48-ae74-66f4864acf2b@windriver.com>
Date: Mon, 25 May 2026 09:35:23 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [v3] media: dvb-core: fix use-after-free in dvb_frontend_open()
To: linux-media@vger.kernel.org
References: <20260522030223.1457871-1-yun.zhou@windriver.com>
 <6a0ff1f1.4a93182d.31550a.b9ed@mx.google.com>
Content-Language: en-US
From: "Zhou, Yun" <yun.zhou@windriver.com>
In-Reply-To: <6a0ff1f1.4a93182d.31550a.b9ed@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0030.apcprd02.prod.outlook.com
 (2603:1096:4:195::17) To CH0PR11MB5332.namprd11.prod.outlook.com
 (2603:10b6:610:bf::17)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5332:EE_|PH3PPFB6E746C59:EE_
X-MS-Office365-Filtering-Correlation-Id: a4ec1837-7a7e-4ce4-c127-08deb9fde734
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|56012099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	oV4Md4GLEPjBKKzbEn9JYUrgJvLv5mU6dwh23BQGdXXmXNjxjIZXEEiGn1XksMUbiUVjqdU5e6YvcTm5DmQNJC011aIDl5VZB3dWmlyesicTgXTPoTMYVmGadXyynvlyVY4j8EK9SR0Eza1iojLo/FzUiS4OZrZa9X/mvCKx71PL2b3zHMIdNgr6ow8UM2dnH9TTa0+O83Jwx0D0V46xClSQ06q/3V51jRLeGnnnhDin4jCCqTLaZsk/numTT5QzdFJ7fhPXjYU0xdsLa7DoiYkVaY/dkAopYEQ1mYBF1wlONv30U/G8w6nwNsHAx6VmC+IvtJRrWwL5pAtCkFpOCE+YhoQtRjXUzUQhbayoLfGssLZQsGs7mmQrPZuoMP3O31sxEyhsMiabS8c+9kcAZMGB8xA4uCtJQYUdEs4AqPFC1X6ohv7dRW4RjDP8nzRwV5cSPmey3VZgJ42SgaYdhPmEnwBtgcZpUPWJVX5beGXUT42MYYtopxgmAA4cxi+RdDvXuAqeJFKs61noILV47VOLDUmQguE9HdlaTcOaNupDeNAf0WRhokXOuDlva3ELX43hpy7UwspZKkCCoMkT8Om2x8q2JGmOSdl5UF80SyQSHGL/Da3YVO5Orp/ZzH+rIDdQ3BP7dJ/6Nrknd3pL7g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5332.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003)(22082099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MTQ3blhhZGNyWXl2UjJjOGVtT3RIT0d2aEhvRnFDa2ZaaVp6eVN4Rm91S1pK?=
 =?utf-8?B?MnlsOE9Xckc1UDZEakx4blE5VERPTHpObm1qdU1DVytCeE5JcDMycnovSlpX?=
 =?utf-8?B?TUNOTTBNUnh0OTVENDNlcVJHVkZpc05hbkVMcHRKa0k5ZnZZNGh1YWtrd0NB?=
 =?utf-8?B?aTlFVkxjbythYjdaZVRaUTY4MnZ1UlJwM2E1dUJvbmVTWGN4TWlUREJDcGR6?=
 =?utf-8?B?Vmp4K0E5bm0vdDh3c0ZBd1RxNzBzdHAyOFNwWUxmUG95UnNpWkp2SGJpU3dl?=
 =?utf-8?B?Mm90YlFhKzJOSGM0Q3RyQXNhM3dPUFhvbVZHSE9weFo2cm9NMkpHemM5UHFP?=
 =?utf-8?B?Z3hrQmw3VlNEd2ttL0FlcWxsZ1ZpRG4vTy9VU1Y5d25NNFZ1bGxJK2FqMkcr?=
 =?utf-8?B?SUV4NUYxY09xZVVwblVHRm1FSjFhNFZwK0FDdGwxQmJ0RjdnMU9QaDNYUk13?=
 =?utf-8?B?ZWVyVE1lS0ZWQWhIQktDZi9mRVlDU3BCVVdRcU5FQTRERURhVlRPaHlZU0lt?=
 =?utf-8?B?UFlZaVRNRXFMUzcyT2lvQzI1ZURjN3VYNkpnUmdqK0xCTmpjcGF3MzNNM3Qy?=
 =?utf-8?B?TlRjWXBNbllCMitIenJYZnRncTVRUllpSlhGc3JvOVRQQjh0Tlo1TXdMVXZB?=
 =?utf-8?B?SEJIWDhvNlNZSml5d3hrSDhFV1pBVFZpcjB2bU40Yk5kK0doRG5zeVBDa05J?=
 =?utf-8?B?ZFM5WjAyNG9BWUQ3b0o4cGFXMGN5d1FzSm0xM2orSmNUb21sZEhTeEdLQ012?=
 =?utf-8?B?TTNZb05pS1d2RWlLaWd3QzRNZmhXY3RnWjZuelptQWZPeFNBcCtJMVNua095?=
 =?utf-8?B?MDl6SWc3VHEvSC9HQkFmaWIyQkRDd1huMlVDdU9zdndVbDVNTmpveXVlanVi?=
 =?utf-8?B?THljQ3NhY01MTTNRdDViN0EvMy83ZCtQanZWMHZtS3pLd1JVSmFURHVTK1Yy?=
 =?utf-8?B?VXpCelIyKzcyOWhkVVdGalc5Rm9YLytIMWZwdlJ4QWlPM3VyMi9WdEVsdFNn?=
 =?utf-8?B?WjlQZDF5WVp4U3Y4UnBLb0JITXFlMmkrR2hEK1Z3RUMzZ05MUGN5bnVhZTgz?=
 =?utf-8?B?VmFIOUg5a2sySncvWjlkNTlMVWpjazhtNi9aRTdCRWUzaGNpOHVJa2tRditI?=
 =?utf-8?B?UldJbGpCV0NiR000R3FjUzV6ZzBwYXZWZFd1SklNNFlaMXlyZDFBVTM2WWdX?=
 =?utf-8?B?MGZIY0JlZkZ0d2g1NndibDVLK3RCck43VWJ1d2NLZ3l4Yy9QWWZ6dUFkdHBk?=
 =?utf-8?B?Y2poOHdlamRqd0xob1ZTQ3p6NjU2SGg3MFE0R1ptYUQwRStvaERuZmFEcS9E?=
 =?utf-8?B?aFh5c3RiZmo5V3NCOStLcDQySG82cDAyM2tZbittb2s3aE9hZ1FIS2dzdlZU?=
 =?utf-8?B?bDUvMUcxendEeUJpeGtSOWYzUGRZM0JVTWZaTS9nM05IOFg3bTlkOUJMQ1Fo?=
 =?utf-8?B?R1RsYlJmdm1jMi90ZFY0VzI3WjlEamhaK2hLNWFoWkt3blN5T0FONWlnbTNx?=
 =?utf-8?B?QTd1K3hnY2kyYVdoY0RUMDhNSmRqTHUvU2JBZjg0NUIvSUUxRDRzZ2NIOHg3?=
 =?utf-8?B?VVR3bEU5QWg4Z0Y2eWJ5Z09GRnFURWU1S1lSNGtQUksvWC9QM0VGTkt4ekRu?=
 =?utf-8?B?azlxOWpUOFB5RXpWd25hMzNSS2F5dms4NXFlblhlZ0E4a0hBQm1hek9FaWVq?=
 =?utf-8?B?cEJOTERqTVVRZmxQMGI3M0lvTnM2c1RsR1lseitxM1l5b1FTSUFtQWlUdGJN?=
 =?utf-8?B?QzVyMU5lc2EwdUEvU3RHNXQ5Qkg2YXVvQVp2VlJaWFhrU3Iwbzlqbzlhek5a?=
 =?utf-8?B?dzFXTVcvNngyTUlKZW5MK2ZTZGh5WW1peVB4Q3BDWUFYeXFsdkEvaDh6bzYz?=
 =?utf-8?B?Y3V6SS9MSG9iVDdIQ2RGYWpVTWUvN0NNbVkvTVlja25teEJkQTcvdlB5TEJx?=
 =?utf-8?B?YXM1VjR0dW9jYkZMNXIxVjFxdjE4TWJGS3hTN09tTVFaRDNRUGdwc3dYeGFP?=
 =?utf-8?B?YUp4Y1IyS0VYdDdvRG5IVVhWaVBHaURsa1U3dFRROWdCalhQaGprRk9kREZK?=
 =?utf-8?B?bWYzbHFlcVBlbytyeDRLM0JidEdiZ2tKV3ZkcXFhNDJ3dlVMOU94d0ZmZEVU?=
 =?utf-8?B?eHIyR0EweUJsSFhHMnVqcFNSbVdUNUo0S1V3ZGE3QWxPWlhPZzRKSTArdVFz?=
 =?utf-8?B?RjY4R2lXUWVZMjEzOUhseGFPRmtuQVkxNEZjNW4wS0VQek4vUVdzeGwxOXpF?=
 =?utf-8?B?SjM3bjRZdjZHTThTSnU5dC9wcUZJU2ovMVllYkhKYllISUxPVEpGaUVwejgy?=
 =?utf-8?B?ZS9Cc2hoa1BtRnhRc2tUVHBvMVp2Vm1YUUZ0b3ZROEREZEFucmNOUT09?=
X-Exchange-RoutingPolicyChecked:
	NpC9i0vjYE+S/zytREIKBXZTK9HWuzaLsQpY9Q78V/WzlrglaT9HLuWYU1pyBwLa3yin4jfMumFpJ13PlWmzR1zzulPsN516BuzXM2UPo2mXyHCDLwuHht4LzgKEbBFw6gQWPgkV42O3xkmzZFjIRwjSx51a9BVwv9/cED76QJNTpHc3LjMDRN6WXanjJ19Hsv+ZJgH4tkSNdKHCqOrMruQUWVcHK1hYFaWu4wqqzy6S28KlQJw3RUWRPnOWuk/5sgEWYy8IYM3BcfS/Nnvjd6nAdBHX5hNipU5YX8KlOipB0vFGxylJYL2mUGZIaQjddce0fD3pTt1QnignspRr5w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4ec1837-7a7e-4ce4-c127-08deb9fde734
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5332.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 01:35:29.3246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6fNd3JytQkhvIANeumgDa3g3Db2wmsyM9gsnrmNpPTRiNYdW9JnCsn0YfJsTcUsDxs4+aDgtgM0Dr00slwgR+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFB6E746C59
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDAxMiBTYWx0ZWRfX+z0GPlLqxzQE
 tNYt/Ihj2akFiacTKMC/AYnYorwdTkoXHhlCnbgqSZDd8uACYyevHmNi2DteODtpCP34RkBjFcM
 NbDHnG95MaPRRVeRyk0wKkz1YlJdJqaIU2Cun0X4gx5SRrgfuBF5OmEO5BFm6hA4bGkrWiTM/8o
 DYtCZsC3kHN+bT66/jmMCaOEY9iA8NVUBB/EB/w7qYaEbRIn6+FayBG29KO4QbcFIoU6e3+OF5M
 y1VnIDiORKkfOpTnYBtNPUGNNDL5tR21T7b2TW5vmUzmtQjJt3YZDaeQyMkRlrG8RtcocjSEEUr
 7X1uy0pPJOkDv1WEhyrdDCASDw1dOF9bvtlbCJc6+jXIQz3HHNa0h4eZ5KHYdK75ti50j/wICz2
 miuBMnQaMgESXy0HMuIIESDm44Z8YcD26/UDtZRKllrpd1QhgK37RIQGQdL4W2CiYKyNifqzUov
 hkbRvnDove7pMG1FVpw==
X-Authority-Analysis: v=2.4 cv=M5B97Sws c=1 sm=1 tr=0 ts=6a13a7a2 cx=c_pps
 a=QZ+jOWKMuognynx/2ZkwyQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=hxVMCeiuTPmSdeBHQAUA:9 a=QEXdDO2ut3YA:10
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: PxYi1Eup-Qh8z0G6WGn9L-jo_6WETzLh
X-Proofpoint-ORIG-GUID: PxYi1Eup-Qh8z0G6WGn9L-jo_6WETzLh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_07,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250012
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[windriver.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62693-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,gitlab.freedesktop.org:url,windriver.com:mid,windriver.com:dkim];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yun.zhou@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B9A3D5C52E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

It seems that these two failed test cases are unrelated to my patch.

On 5/22/26 14:04, Patchwork Integration wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Dear Yun Zhou:
>
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
>
> # Test virtme32:test-virtme
> Error running test. Final Summary not found
>
>
>
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
>
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/100505107/artifacts/report.htm .
>
>
>
> Best regards, and Happy Hacking!
> Media CI robot on behalf of the linux-media community.
>
> ---
> Check the latest rules for contributing your patches at:
> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
>
> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> to this message.
>


