Return-Path: <linux-media+bounces-54100-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFj/NmCkpWngCwAAu9opvQ
	(envelope-from <linux-media+bounces-54100-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 15:53:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CFE1DB352
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 15:53:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 38DFD3064CC1
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 14:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A157740148A;
	Mon,  2 Mar 2026 14:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="M++vS1NQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502B63FB050;
	Mon,  2 Mar 2026 14:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772462715; cv=fail; b=LLBgyLU2fGCJ74KzVNBME8nnJQDZT6TAYIFdHkaVZvEhwN7APc0fPMzZd/WWaYvr2fKnfjRCA25VQzvVyUMbTScKz3rDJbmLL3WTsw5wTRCdIl1bXy4BAcOhd+VfWnjYgDopa1VUr3udQrCjwHIfOSWAfK+JvglZOxl6hoa//2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772462715; c=relaxed/simple;
	bh=i0WKR/+StE1prlGRuaiuZ4JFjm1xexHtuuOIicCy708=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qMLqdwzGDE+N17DJDqAlyr9fTYvRse/FNGpu6mqVawIxzBrcqAU7sD1wWXOOnsoAXpWe7IwuskOA00kCqcw17j1M8g8zeJR6sAsTxrQvdA3Tfz1eYcqHuBB6MptIa7oYDsgPdj0gbhUZ9NLHyykHKhx0k/4FGglx9NRl4w1KF9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=M++vS1NQ; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6224hIN81460743;
	Mon, 2 Mar 2026 06:44:42 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=34ry04AAllJocmTux+pmvQeW7ls754Wwmrrn+IHYz+w=; b=
	M++vS1NQX3miWPNdbZRJOl+ymiHihW5uK+RpslZcvYwxbFy7iQiY2Y9G0t1u02fG
	ztlmnVU2+cUWkMbMODAAjjUWUzzis/ciioPQC//dPdbBGTfUCaPi0O+uxDjZ6G0C
	lGmNQTVrYMxhlIf1uZHeDSomZU0F+f1Zq9k524nNNZqsslvcXJ8kqVMAp20/pzGX
	icXH0dKoNsJFSvPg1sVIBbVAPfPZ6etndhH9uZmz11BuVddHntRJQCafo+jKXSxZ
	Y4OZBU0Z+TwS92Imo/WWESDdvl4wU1n7CNSh5bf7ZkizK0ku5KyOdm6HdDP42BCj
	rhDC5lDSn2M+jBY2HSKbPg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011053.outbound.protection.outlook.com [52.101.62.53])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cm0rghxyn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Mar 2026 06:44:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uAKF5H7a4XJUYiSLCOxQt1ssxfyzdKe7VNEfLyARoJDQGVFmkXeQqI8TLpub1P7qWce+rW3ndeJ25rXL3wutI9Fd3zhZ0CiDYaG374xWLE4gvgZpLlkGBGdN65y+5Hx7NoBaAAEhTBAbatFuN4sdGTMi071sdAreZJtGLto56a9OgxsAnQi8zsx90Jol9LofG0o0g+NVom5DKCHtCA1OCZvlVEqEE+J9Al6qyVpp/JYf4iYg+s3ZwwOCWr1LR8VkMuFiq5F/eTOJ7O6INvWrC6Pkx9nvOdVMrbRLYTky1SCnChBPeDDf2IquUpKPCLbiCt/r/7piBIEdACqKw0gCag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=34ry04AAllJocmTux+pmvQeW7ls754Wwmrrn+IHYz+w=;
 b=HggJc+ZuHEXpw0bCwudIK7bDUXDGfFyuf0A6+t9tITbLqG5gV8AxJndM452uNWBi65M/LTquQNjyAqcSvhchdBCR74/Pyfm4XeLgC425iUrV2EEDpvNN9euMIlbtFmyiobeHTRGN/l8y5UKilxqmu50kU/GR3+uSxvJDDzimOvp6/O9eB0ZX4ODXYiS+lnQYLCgNHj5lD8ym9YS2ZNSatM6Vff+LrocTbW2YQY0tB5otQrJdg0zpLSO49q5D8KjLycf156uDdFGePvC+SVDWO+Be8yNkB11rZj8T14fQxPpZsNHQWqH60gzOg8A4P9uiiQqp/90BeckjqPHQP8bcyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by MW4PR11MB5774.namprd11.prod.outlook.com
 (2603:10b6:303:182::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Mon, 2 Mar
 2026 14:44:39 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669%2]) with mapi id 15.20.9654.014; Mon, 2 Mar 2026
 14:44:39 +0000
Message-ID: <6458d922-a75c-43f5-9f06-29df6cad1b34@windriver.com>
Date: Mon, 2 Mar 2026 22:44:27 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] media: i2c: ov9282: Switch to using the sub-device
 state lock
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: tarang.raval@siliconsignals.io, laurent.pinchart@ideasonboard.com,
        dave.stevenson@raspberrypi.com, jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260301104809.3505257-1-xiaolei.wang@windriver.com>
 <20260301104809.3505257-3-xiaolei.wang@windriver.com>
 <aaWHP2x4QydooVM3@kekkonen.localdomain>
Content-Language: en-US
From: xiaolei wang <xiaolei.wang@windriver.com>
In-Reply-To: <aaWHP2x4QydooVM3@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0009.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::18) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|MW4PR11MB5774:EE_
X-MS-Office365-Filtering-Correlation-Id: d7527180-bb8c-47f9-e5b5-08de786a3b7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003|19052099003;
X-Microsoft-Antispam-Message-Info:
	vAWApzzoCC/06pHpVorQqczleCHdGCw0fn+5QY6DxWul00ObNqx4Fhm9usBbeO7BMSbrPhbBzyUNid7XlaiPybFyqPFzaRMCEXfEYNkGc8rOekj1zRVoFWu3vah/TYWjG6pRuLSSN6TcIpO2uoV4HrAg1EFfJP2VqwlPURvJXEo05jJbPY8Aj15FK4yxuZ6koTjHkXSRS/2zqnulgOt83+8OKY9SRvO4KpgEzTZb3lsRDC6aTREb1s5k0SWEL0iSJeICHWKnN4MsehN7Re+VsSnq162qgJVKDPvyzTlqIrl5NnuXS6ZFikyz60E5Wc6dOXUmsUC0nHYPtyjMXFsRKDwl3V1CHO4bUZpDHU6akEa4BoGA/NqsS94RU/+uyhCntQ3ClZQ+bV1/pLjKcQ+/Ui9wB0/z2owwOLfj8yndoKWfAm/cl8GlwUox9k3myzojPxl0psVQmJd1ynCwnd/qVBEJzNTQksE96qGc1W+4g2XKJw5szz2fKQ4O/dnefL/387wOnIzSGlHljWN5Yw73b5Z5sa9Jjlz2+7EOKXQxEWFABSwrPRBtWmuZRkFamfO7eOvuF2ZhQbNZvCD9F04Zgpb5N/EWenjQygiIwXL44gmqv5W2XVjHQCnqKqvGBVxBruN6ojpBcXFXuT1jMfI1bvullneny2gqnW//Z19AJqo9sERDWPUUe/UGaP6WL6pJXJER0v/tRnQJmpiE1WYy99O8kPrbXMqOnRHEDuxmtjU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003)(19052099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXFoUHJsQSt6bGN1L0NmdlArTHpxYy9QeStoangwVm9ENmVoS2sycXQxK2JF?=
 =?utf-8?B?TlhOeUU0UkQyS05KMlE1U1Nnc3RsbHRCbENxSFBJM09jc0p4RUFxVloyWGdt?=
 =?utf-8?B?a1Y3Nloza3psUVo5TUxMNU15Z1Y1dUZiV1g1T09icDBVM0VIM0E3bWNGMVc1?=
 =?utf-8?B?WmhBdE1odlpVYlloUDBKaU1lRjd5Ty9nZ29LdW4vai9aZXdEL1NDSkI3RUx2?=
 =?utf-8?B?aGhZN2lPYWRsNjFvTXVNcnZsZk9aZG92NXNlQXhTLzEzOHZVMStwZHVZQ2Zv?=
 =?utf-8?B?VDBQQTFhY1N3V254SXJ4bzhqbXk5RUVacG5VRjlwMTZweXdHenNyQjZPcFh0?=
 =?utf-8?B?TzlDT3J3WCsrV0NUOTdaY2o1M2RnQmtqR01TeGJLR2FWN3QvT2xDaVB1ejly?=
 =?utf-8?B?TU9BcHpackxob21qMFB5ekJZaHNoYmJURlh4MVVMQzNVWnVpY004ZTNHTjVu?=
 =?utf-8?B?dmVicUNpenhaeTVsRUw0bGs3TXA1TlRBVE96TVFZK2tYQ1NiQzVjMDJ6WkFs?=
 =?utf-8?B?MktPdHRxZXBVMWx4WDA5SUlFN0Fwek15WnZRcGFQaVpVS2FYMVRWMDdVcjRv?=
 =?utf-8?B?UXNINzFBTGhkRXhldlpJZ3ZRZ0ZQZmI3N1F6UjhMcmQ3OUlqcm02R3NUUXFm?=
 =?utf-8?B?d3pXaFdLSjBGKzJZODgvcm85ZnNCT2Z6WGJqNzZEVTV2aXFVb09NOXZxbjRi?=
 =?utf-8?B?NCtSYnhQZ0FtSXppb294YjB2UWw3YmFWMTZRWmFobDRYdk1adUU3RWxKT2NP?=
 =?utf-8?B?NldnN0wzRk1PYzV4NzlUWThsUEU1OGFqMzQwM3ZXUUY1L1pCUUc3M1FoTXdD?=
 =?utf-8?B?VnNpZmxKb2xSYXF6dWI2d0Z1VEVBa25RWVNFUzZQeFo0T2RWS210UlJZSU1F?=
 =?utf-8?B?V0x4dVVzai9HZmkrZmJDS2NDVXRpMkhEbkJhUGYyYlo4L01OVGczR255eFNk?=
 =?utf-8?B?b0puS2dpdjRnU0tCYzNhTDVRcWE5eExkUXVuMEVGZWZtYVJDV0gya1ZmZ2lV?=
 =?utf-8?B?N2lPNU11OWtqdzl0NGNBb25vM0E0SXdiYlU1RTdka0lmajAvNERXV0FvcGVG?=
 =?utf-8?B?bDh4TVZ0NnhGYkpKVXZIanlJY0Y2QkNBb0xCWXRxdVRHMml4cmVvemdFRmpZ?=
 =?utf-8?B?Rm5ZbUlGV1BvNUxad0RxNktnMVU5UHZnSkZPem9mdDBDdTR5OXg4bFlZSllD?=
 =?utf-8?B?aWhyclhqbzJ0eGpXdFVFSkU3cDJPbGc2WER5c2dmczQvdVIzdmdUM3JVek1P?=
 =?utf-8?B?Q1pybk0zUmxqYlNHU2liUmU2dkNwQ2dPb0h4bUxhQWJBNVdBUStlRFFRdVp2?=
 =?utf-8?B?UDBXem9PY0J5OEhPcDg5SXJFTWcxM0l5MVJHaUVBUlNKbGZ0MDdRYTZISmk1?=
 =?utf-8?B?SURjbEhTNGg5bWdzZzlZZWU0RzZhcHVPR0ZEWTYrTlhmNXp4dWlHakwxQlo1?=
 =?utf-8?B?cjZDdnluRjFXa0Rib0U5dnE4elN2M1B6VDAydnljTGZBS1N0ZWViUW42U0Z1?=
 =?utf-8?B?amUwdWtnS0x2OFQ5UG1KTEhKdWx1LzBNdkowN1NSbGl6VWdQSm5VSW9YR1da?=
 =?utf-8?B?dXFVS0xDSDlvTUxaZzVOTC9zbklCUGxwdXVtT0JQWjFaSFpQOVp2ZTI2VWZH?=
 =?utf-8?B?TmZSVld5NkN0OGVwQTlFOGwwOW9USW1mcVFjTVNETFBheC9wNGRCQ0NjK0FX?=
 =?utf-8?B?dWZWRUtyVm9pTkNLL29XVzdaYkZkUkZubFg0YWVYdGtZM3ZwY1ZNMUFoSEFC?=
 =?utf-8?B?dy81UEZ5aEp4Mk5sdUpyeU45cmh3S1hBbSttMUhHNDFveWFmem1BdWg2a0lx?=
 =?utf-8?B?UHpJcjZva3hkZjZjOFBYK3VUTUJLV3dMZ24yZ3BHNXBRakl2TjRkOSs5Vlln?=
 =?utf-8?B?WDdMTFoxcU5zeUhYQ3YrSjhubFJyMU55V25rQ21NVGlLQ1ZWVTBkaVRHSzhH?=
 =?utf-8?B?OHBqNllhSXZPd0dVVUgxK0lUUVhqUnRRcGtzUExzVzdEdWlnT0FuS3J2WGtQ?=
 =?utf-8?B?bHA1ZnFVMWx4eHphM3h4K3l0bk02UndsRTV0Zk4vaW9NL3RZV1laZlFsOE85?=
 =?utf-8?B?Ujd6TGZHSDVOUEZacnljMUdXdndWZ0hxYnhKU2tkbHY4MnRqOGJtOU1yTDZo?=
 =?utf-8?B?dEtuK3kraXdabHBGeDVWOGlCaW1yby9nMVg1dWVLTWtsQzl5UHUyeFFYd3JZ?=
 =?utf-8?B?U3ZyZkh2UmY0SnFpdEkzWkRhYXlndGluQmdTRXpzR1U4eFJQS1pMVFdnckh5?=
 =?utf-8?B?c3dXSGpVS3JkbWIzM0svb2JPbnJKR3RwOHBaVmswc2RqWnVWRmFBSXgvOXVN?=
 =?utf-8?B?cDAwWWVwMXpYUmVLQ1AzM0Z2TFFkeXd6M09rOXFxMFQ4MEMzdDNOcy9vNE4r?=
 =?utf-8?Q?HrH1WlfzCDsZdIK3qkPmvKr3O6Tv1Nfwya9Clfn02JEPA?=
X-MS-Exchange-AntiSpam-MessageData-1: T7nJ8wJMURip4LoUBJ+oGM2rH4hGhorOjAs=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7527180-bb8c-47f9-e5b5-08de786a3b7d
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 14:44:39.5323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B87Y+6irH1yses23QEqkkhsRWNL09A3NUocyWZjiOiLw6ENyTKDiuTa+2SML3B6aFh3SJ3/X67lQHl92OJmV8pum8GgbAMQMk4pKPO3UoVk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5774
X-Proofpoint-GUID: 8EnA417wNBanLcSlEYKluTO1DCNJGg-z
X-Authority-Analysis: v=2.4 cv=Of+VzxTY c=1 sm=1 tr=0 ts=69a5a25a cx=c_pps
 a=9V9/KAGQR/RGwytZTnC4xw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=t7CeM3EgAAAA:8 a=VhtbuDprmMaTn-JcT_IA:9 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 8EnA417wNBanLcSlEYKluTO1DCNJGg-z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEyMyBTYWx0ZWRfX27Kln79yW4VT
 6RIz5S+8jKoGLrT1ZRIrBvswfmY69SEH6mBGYjA3WPI2iL7fvji2Dd1kIlrF8sobu5rSKU34DOf
 E6q45Zb29cMPbKG4vKQ2d4PFdenBsuMjsKLWiGemeNYf2FywudfMvPNCuK9GkwqYv9rS9C6u7KU
 08ioklb4lL7nLTHw3Gt+yQbFlVA/UqzwJ/dCVZHFXeQafw1pme89vhHnX4l1OXtE5uagPmwGcGf
 lpRYJjZgovjGyoUVpNJ2ckfOuc5t4ja4/0eMYwmH5vcXgxRmKqpegGghP46zXvzaJVSQpppolAA
 eyfoS8yrBPTxu5fn+ldqeQqlhteE8pfMH7Yz+PU86GH+tprqdvWmwMPO+hP43f7L7lpGiUPEWZL
 SbmqjKAj8E0I4QjdqNHof5VO9+qHamssr7CqiSu3pu78fkdMMbgctJjbi8jRDe89ys0OaL9OHY5
 LBZUQGzu1VNZ5p/C2wA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020123
X-Rspamd-Queue-Id: 58CFE1DB352
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-54100-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[siliconsignals.io,ideasonboard.com,raspberrypi.com,jmondi.org,kernel.org,bp.renesas.com,oss.qualcomm.com,xs4all.nl,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,windriver.com:dkim,windriver.com:email,windriver.com:mid,siliconsignals.io:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi Sakari,

Thanks for the review!

On 3/2/26 20:49, Sakari Ailus wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Hi Xiaolei,
>
> Thanks for the update. A few comments below...
>
> On Sun, Mar 01, 2026 at 06:48:08PM +0800, Xiaolei Wang wrote:
>> Switch to using the sub-device state lock and properly call
>> v4l2_subdev_init_finalize() / v4l2_subdev_cleanup() on probe() /
>> remove().
>>
>> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
>> Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
>> ---
>>   drivers/media/i2c/ov9282.c | 50 +++++++++++++++-----------------------
>>   1 file changed, 19 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
>> index 8bfaa3ae4be5..8acbd43838d5 100644
>> --- a/drivers/media/i2c/ov9282.c
>> +++ b/drivers/media/i2c/ov9282.c
>> @@ -221,7 +221,6 @@ struct ov9282 {
>>        bool noncontinuous_clock;
>>        const struct ov9282_mode *cur_mode;
>>        u32 code;
>> -     struct mutex mutex;
>>   };
>>
>>   static const s64 link_freq[] = {
>> @@ -795,8 +794,6 @@ static int ov9282_get_pad_format(struct v4l2_subdev *sd,
>>   {
>>        struct ov9282 *ov9282 = to_ov9282(sd);
>>
>> -     mutex_lock(&ov9282->mutex);
>> -
>>        if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
>>                struct v4l2_mbus_framefmt *framefmt;
>>
>> @@ -807,8 +804,6 @@ static int ov9282_get_pad_format(struct v4l2_subdev *sd,
>>                                       fmt);
>>        }
>>
>> -     mutex_unlock(&ov9282->mutex);
>> -
>>        return 0;
>>   }
>>
>> @@ -829,8 +824,6 @@ static int ov9282_set_pad_format(struct v4l2_subdev *sd,
>>        u32 code;
>>        int ret = 0;
>>
>> -     mutex_lock(&ov9282->mutex);
>> -
>>        mode = v4l2_find_nearest_size(supported_modes,
>>                                      ARRAY_SIZE(supported_modes),
>>                                      width, height,
>> @@ -856,8 +849,6 @@ static int ov9282_set_pad_format(struct v4l2_subdev *sd,
>>                }
>>        }
>>
>> -     mutex_unlock(&ov9282->mutex);
>> -
>>        return ret;
>>   }
>>
>> @@ -904,10 +895,8 @@ static int ov9282_get_selection(struct v4l2_subdev *sd,
>>        case V4L2_SEL_TGT_CROP: {
>>                struct ov9282 *ov9282 = to_ov9282(sd);
>>
>> -             mutex_lock(&ov9282->mutex);
>>                sel->r = *__ov9282_get_pad_crop(ov9282, sd_state, sel->pad,
>>                                                sel->which);
>> -             mutex_unlock(&ov9282->mutex);
>>
>>                return 0;
>>        }
>> @@ -1019,9 +1008,10 @@ static int ov9282_stop_streaming(struct ov9282 *ov9282)
>>   static int ov9282_set_stream(struct v4l2_subdev *sd, int enable)
>>   {
>>        struct ov9282 *ov9282 = to_ov9282(sd);
>> +     struct v4l2_subdev_state *state;
>>        int ret;
>>
>> -     mutex_lock(&ov9282->mutex);
>> +     state = v4l2_subdev_lock_and_get_active_state(sd);
>>
>>        if (enable) {
>>                ret = pm_runtime_resume_and_get(ov9282->dev);
>> @@ -1036,14 +1026,14 @@ static int ov9282_set_stream(struct v4l2_subdev *sd, int enable)
>>                pm_runtime_put(ov9282->dev);
>>        }
>>
>> -     mutex_unlock(&ov9282->mutex);
>> +     v4l2_subdev_unlock_state(state);
>>
>>        return 0;
>>
>>   error_power_off:
>>        pm_runtime_put(ov9282->dev);
>>   error_unlock:
>> -     mutex_unlock(&ov9282->mutex);
>> +     v4l2_subdev_unlock_state(state);
>>
>>        return ret;
>>   }
>> @@ -1285,9 +1275,6 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>>        if (ret)
>>                return ret;
>>
>> -     /* Serialize controls with sensor device */
>> -     ctrl_hdlr->lock = &ov9282->mutex;
>> -
>>        /* Initialize exposure and gain */
>>        lpfr = mode->vblank + mode->height;
>>        ov9282->exp_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
>> @@ -1409,13 +1396,10 @@ static int ov9282_probe(struct i2c_client *client)
>>                return dev_err_probe(ov9282->dev, PTR_ERR(ov9282->regmap),
>>                                     "Failed to init CCI\n");
>>
>> -     mutex_init(&ov9282->mutex);
>> -
>>        ret = ov9282_power_on(ov9282->dev);
>> -     if (ret) {
>> -             dev_err(ov9282->dev, "failed to power-on the sensor");
>> -             goto error_mutex_destroy;
>> -     }
>> +     if (ret)
>> +             return dev_err_probe(ov9282->dev, ret,
>> +                                  "failed to power-on the sensor");
>>
>>        /* Check module identity */
>>        ret = ov9282_detect(ov9282);
>> @@ -1448,10 +1432,10 @@ static int ov9282_probe(struct i2c_client *client)
>>                goto error_handler_free;
>>        }
>>
>> -     ret = v4l2_async_register_subdev_sensor(&ov9282->sd);
>> +     ov9282->sd.state_lock = ov9282->ctrl_handler.lock;
>> +     ret = v4l2_subdev_init_finalize(&ov9282->sd);
>>        if (ret < 0) {
>> -             dev_err(ov9282->dev,
>> -                     "failed to register async subdev: %d", ret);
>> +             ret = dev_err_probe(ov9282->dev, ret, "failed to init subdev\n");
> Assigning ret here won't do anything, will it?
You're right. I'll remove the assignment and just call dev_err_probe() 
directly.
>
>>                goto error_media_entity;
>>        }
>>
>> @@ -1459,16 +1443,22 @@ static int ov9282_probe(struct i2c_client *client)
>>        pm_runtime_enable(ov9282->dev);
>>        pm_runtime_idle(ov9282->dev);
> The sensor may be powered down here...
>
>> +     ret = v4l2_async_register_subdev_sensor(&ov9282->sd);
>> +     if (ret < 0)
>> +             goto v4l2_subdev_cleanup;
>> +
>>        return 0;
>>
>> +v4l2_subdev_cleanup:
>> +     v4l2_subdev_cleanup(&ov9282->sd);
>> +     pm_runtime_disable(ov9282->dev);
>> +     pm_runtime_set_suspended(ov9282->dev);
>>   error_media_entity:
>>        media_entity_cleanup(&ov9282->sd.entity);
>>   error_handler_free:
>>        v4l2_ctrl_handler_free(ov9282->sd.ctrl_handler);
>>   error_power_off:
>>        ov9282_power_off(ov9282->dev);
> and again here.
>
> I'd suggest to call pm_runtime_idle() after registering the async
> sub-device to avoid doing this twice.
Thanks for catching this. I'll move pm_runtime_idle() after
v4l2_async_register_subdev_sensor() to avoid the potential double
power-off in the error path.

I'll send v2 with these fixes.

Best regards,
Xiaolei

>
>> -error_mutex_destroy:
>> -     mutex_destroy(&ov9282->mutex);
>>
>>        return ret;
>>   }
>> @@ -1482,9 +1472,9 @@ static int ov9282_probe(struct i2c_client *client)
>>   static void ov9282_remove(struct i2c_client *client)
>>   {
>>        struct v4l2_subdev *sd = i2c_get_clientdata(client);
>> -     struct ov9282 *ov9282 = to_ov9282(sd);
>>
>>        v4l2_async_unregister_subdev(sd);
>> +     v4l2_subdev_cleanup(sd);
>>        media_entity_cleanup(&sd->entity);
>>        v4l2_ctrl_handler_free(sd->ctrl_handler);
>>
>> @@ -1492,8 +1482,6 @@ static void ov9282_remove(struct i2c_client *client)
>>        if (!pm_runtime_status_suspended(&client->dev))
>>                ov9282_power_off(&client->dev);
>>        pm_runtime_set_suspended(&client->dev);
>> -
>> -     mutex_destroy(&ov9282->mutex);
>>   }
>>
>>   static const struct dev_pm_ops ov9282_pm_ops = {
> --
> Kind regards,
>
> Sakari Ailus

