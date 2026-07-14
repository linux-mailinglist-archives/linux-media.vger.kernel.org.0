Return-Path: <linux-media+bounces-67544-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tgKcGW3lVWr8uwAAu9opvQ
	(envelope-from <linux-media+bounces-67544-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 09:29:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0073B751DD3
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 09:29:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=aoCQ7Wcz;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67544-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67544-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D0347300E28E
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 07:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53D043EDE7E;
	Tue, 14 Jul 2026 07:29:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from SY5PR01CU010.outbound.protection.outlook.com (mail-australiaeastazolkn19012008.outbound.protection.outlook.com [52.103.72.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7793EDE40;
	Tue, 14 Jul 2026 07:29:41 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784014182; cv=fail; b=eLyFn4H1owpprxRTg01dzmrrc4rXtTChq2QYgBj6ztDUZu18IQ1XbTabkhyoGYYWW4EIRY5MZQnAZ8Lv1CtR3LEXd/8M4/MlycSJ3JOVPHxghe1Mn1MHMYYPp5E2cueOBRJ5p2F6Mq4PdNCQj44/FVSAP5iZWYZvSgzjahcmQv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784014182; c=relaxed/simple;
	bh=cgTQTxHS7H2qOnAqj2jhrMoaU7wVsZWwZYmtH9R7aeE=;
	h=From:Date:Subject:Content-Type:Message-ID:To:Cc:In-Reply-To:
	 MIME-Version; b=fHnqTNNb4dv7BvJeZhKOSPgkshHaecRrv9tD8t0+KAbBUQP82qiQtFIyPJNETxOsgPqJ2ZBV9izm+NeEBLNdHPa2BwRS7KMFyXjhq1n8NIOEXiXsLQEdliFv8Ur/pZKayoFK1coWDA67xorBgl1clWPQTKflT/Vlt8aIdvLrQtg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=aoCQ7Wcz; arc=fail smtp.client-ip=52.103.72.8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PfHcjl/RRF51hvhoHUV9nG3WQ3+sL/zdOrNQCV4D5G87xxVVzYaitbvpIz6jvI+QMDsaKcOZBjmTouKm0Pe1UKe0s5JpffqJuJxR+KF6ycTeTenwNIq8nBpugk97Srm7N64rY4y41ge13Lqb1Jcd5puli+OIzExF+FpIHe8ysQvjFO3rXJAS3UcOJH0CZgsPtF2/dSrUBErVq2v4ETHS9C893so7hilu7V5m4EDuGlwP0NcqGf6ZGo5MeNfs8VFEN+O0vumjq15hBt0qzlzTr5uRvBcAgFKWxS0HunJkmwVNeB7NSRGGHe6z8bSsbi7nZwowzZfV+4ox4Kby176OkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQyLat03eNzE8DI/SZXmhAyLLc0YSEZx8NUWRZCFV70=;
 b=BJd8M+kcOoPDAXD2Vy0khGjicSsXAh2mVtWTX9yvMd+ma6M2LgnmBKHn0fi+epXtSPcVQVgfQgXXYQkiSg6AFhYpiQFbR5sn1AvZDfV1xKh9DIfr+z0W36BmkEV+N/tUjVGApoy5ULxbjPbSyWJSHKQmDTDGHeqzFt46MCudXQJAy7spMsW8eEAISTZaqKAdaCYMhuizCu1d4fJE42SP4sTBMmQsaTIH4ZnHKUuDBoc3oftdHpGzJTRF+dT09pi1yxnbQu/L/kVvUNeLvT9OpbVKLvBcfruwNbdKKpJPJRJCpb0dZvUBoZFqpmhyshdpxZX0kprglYU1ET8ypXoETw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQyLat03eNzE8DI/SZXmhAyLLc0YSEZx8NUWRZCFV70=;
 b=aoCQ7WczitKiFtIONBxyOhxAAxC6DJTwBZDMe/BLesTpM63hnRGBD31PZWYHBw4dnE4YnKxt7m+krDcQDLu1cpFwnD7QtmWNCqDMDqaz5CllhHlgUlgxY0eK3IW9AZgol9CztYLNAPD/oETocsSdCG/X3dD7YtId0GmPuH11yvnGhE7ox3JuWS19JbA11QL4duqGcZ5PZdd9fW8EujzwN8xfN3CsgaFvFOSoK2tX6NGLKEDSIRrsWsnqkwkSq2HXqpIg0UwYcfuh3nouTdbhS0ap4lpxu4TWpsX78OnlgI6irKk7ui2Y/jPdQfPCRhkZTJyAZCXH2H/6S4+orqwZlg==
Received: from SYBPR01MB7881.ausprd01.prod.outlook.com (2603:10c6:10:1b0::5)
 by SY0PR01MB9296.ausprd01.prod.outlook.com (2603:10c6:10:224::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.20; Tue, 14 Jul
 2026 07:29:31 +0000
Received: from SYBPR01MB7881.ausprd01.prod.outlook.com
 ([fe80::7cd2:d6e8:3fa0:5f0c]) by SYBPR01MB7881.ausprd01.prod.outlook.com
 ([fe80::7cd2:d6e8:3fa0:5f0c%3]) with mapi id 15.21.0202.018; Tue, 14 Jul 2026
 07:29:31 +0000
From: Junrui Luo <moonafterrain@outlook.com>
Date: Tue, 14 Jul 2026 15:24:37 +0800
Subject: [PATCH v2] media: vicodec: fix out-of-bounds write in FWHT encoder
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID:
 <SYBPR01MB78815326E01E5C8E903A1822AFF92@SYBPR01MB7881.ausprd01.prod.outlook.com>
X-B4-Tracking: v=1; b=H4sIADTkVWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDc0MT3bTMitRi3cREi+Q0M+OktBRLUyWg2oKiVLAEUGl0bG0tAIGtN4J
 XAAAA
X-Change-ID: 20260714-fixes-aa8cf63bfd95
To: Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dafna Hirschfeld <dafna3@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yuhao Jiang <danisjiang@gmail.com>, stable@vger.kernel.org, 
 Junrui Luo <moonafterrain@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2221;
 i=moonafterrain@outlook.com; h=from:subject:message-id;
 bh=cgTQTxHS7H2qOnAqj2jhrMoaU7wVsZWwZYmtH9R7aeE=;
 b=owJ4nJvAy8zAJVb4wiKgu++DA+NptSSGrNAnJoJZNxu9Vt16xVSy7u++m48zjWVe5Cr4vv395
 M8hEbPb4Ys6SlkYxLgYZMUUWY4XXPpm4btFd4vPlmSYOaxMIEMYuDgFYCIKLowM9/bPNZ+Tpidx
 7sClVoNan9xT1048Tg3aG1RXWiRe9eTYYYZ/1rOv6UaXiR5QzGC6xfDjCveCtvpQ49OqnGrVLPe
 E1otwAQDx2EvI
X-Developer-Key: i=moonafterrain@outlook.com; a=openpgp;
 fpr=C770D2F6384DB42DB44CB46371E838508B8EF040
In-Reply-To: <SYBPR01MB7881C44480F77338B6A93C61AF152@SYBPR01MB7881.ausprd01.prod.outlook.com>
X-ClientProxiedBy: TYCP286CA0098.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::19) To SYBPR01MB7881.ausprd01.prod.outlook.com
 (2603:10c6:10:1b0::5)
X-Microsoft-Original-Message-ID:
 <20260714-fixes-v2-1-c9c3307713de@outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SYBPR01MB7881:EE_|SY0PR01MB9296:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f3e9b32-f9b9-4745-8698-08dee179a523
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|13031999006|22141099003|6090799003|39105399006|24021099003|19110799012|8060799015|22091999003|24121999003|23021999003|25010399006|4140399003|5072599009|15080799012|40105399003|26121999007|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YnZ3Q25oT1VXNDVqMmpqTTcvMnJRRVI4c2JFL0Q2SG9ZUjB3cmY1cDNhdExl?=
 =?utf-8?B?cE84UStKdlF6UStLUUdZWWVJWnJwOUFsSnR5U3pZamFOSGYvb3dTMzh1Nmkw?=
 =?utf-8?B?M0xna1ZNMHFVazRLZWkxb2QwMldPc2hLOGxKYStuajdWZjlVNmVwajVBcVBQ?=
 =?utf-8?B?ams4UjVncGd1djRIQTZtSGx4bkhGOEVRWnFsMDdXQXdvSmc3RVU0S2dXR2sw?=
 =?utf-8?B?aVdPalh5TEI0SmFCTVhzM3ErTCtqMmJJRzVUWFJQdjZoZ2RpVnZML3UwcHBa?=
 =?utf-8?B?WU9xYWQwQzd6cys3TFd2RE5PVXZKNFdML01HSTRTTnlDYkVkUnMwZFptOXA4?=
 =?utf-8?B?dkFZbVRCa1huazFtL01BNVJzSEhVTm1PMEw2VUliWDFjc2lPSGdudjBDMkt2?=
 =?utf-8?B?MEdzdHMxQ0RJNnZCUmhLbzJBaG12T0R3SFUvaUg4Yit2a0JCemlTU3RGWk5s?=
 =?utf-8?B?alZqKzdFL3VrVGdJdEYxbHVKaHRQOThOV3ZEU2o4VTZYNWxRYUNwUzh2dXhQ?=
 =?utf-8?B?aUluWHd0VUJyTG1meHM2Um91dVVhU3Q2T2g1RUZDUXVCbXlTdjZUcHhrT0N1?=
 =?utf-8?B?QlN0ME55MnU1ei9FYUd4WWtySnpaY2xJQzRORjhXT0tUd1ZBZGFsaDJ3d0hB?=
 =?utf-8?B?ckxjeEx1RXZJLzF1NVJ6SE0zL2dINDRJY0VXdlNyZjBpaVlNMjFkWGhtUVhw?=
 =?utf-8?B?MWYwaWNTM0kzc1lud1kyTjFrcyt6eEd3cUJjN3lrTE8ycFE5dmdoM3FmcTdt?=
 =?utf-8?B?andmNHE1MEdlNGtTVFJhempncjhwRStCNzk0SGY2SytwSVFRemNpRkFPeTBv?=
 =?utf-8?B?MDhuU3gyRk91TUFRcUV3VEdVb3RGcjFmL1FaLzhQSUl5MUNkR3BrMC9Sa0dx?=
 =?utf-8?B?Q29HaTkzc0lSdXNPZEtodlk5eXRybW0wZEdqUE1POVA4K0l2ZTB3OVFSaDgv?=
 =?utf-8?B?bUJtbTdCak41QUNiV1hIbEY4VEtFNG40TExzeUFGTUJyNXhpckZHN0lWdW85?=
 =?utf-8?B?a1RiOUxtQ3MrR29aaVBlUXowN3IyWVNXTFIrdFJiMnUzT2hndm1JR0NOK05E?=
 =?utf-8?B?VzQ1TVd4RG14SW4zc1NZcnEvN3d3ZWtuNG1LZEQ4NG9pSy8xQXpHZFFSaW1w?=
 =?utf-8?B?cldUNWlYNURubkZLbXY2SUltMGFqMFVaTFFkaXBNQnVCYUxCQkRMWjByRHpi?=
 =?utf-8?B?UU84QTE4S1lTbk10WnBYVk42cjRWZGN1TEtTOWlEc1VoL09SVU1oVGFjU2VG?=
 =?utf-8?B?NXkweUJRR2R0bGoyZTlUbFhZYnhoekh0akRzakNtVzRJL1d3aVhzR0JBbDg5?=
 =?utf-8?B?YnNaelBHeVFrMXAwdEViV2prczZnRjJnVEphOTl3REZ0dmtrdG1QNTVibUJP?=
 =?utf-8?B?dC9YclEvRUR2bzEzUTUvOHp1T3E1MDFUbEJvNlZnWVo5dTJ1SklUQXR0eGND?=
 =?utf-8?B?SXl5ck0wMWdwOHhvVWoybVJXNnBqNHBDZFdkSVFXcGw2b3JzaEliNnpub2ta?=
 =?utf-8?B?cTN2bVUwek1EM3p3MjBzVEl0ekc0TC9RN1BpUzQvS1VBaXBmUlhuUWVJWTh6?=
 =?utf-8?B?Mi9UZz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWJta2lCd0NlTCt6NCtVYnBScmFnQVN5UFFTeEZkdHY0MXE5VisrOHo3NDUz?=
 =?utf-8?B?RGJvN2ZjSTRWOGN1WHRJcWpjQ3duSEs0bk9JcGg1UTNnaHNraXI4K3BVK2sz?=
 =?utf-8?B?OWVGNTFVMzYxbkN0VjFpaUFpUG9wZWJ2WVQ2S3ZtN01yd0JKU3lZeXdwK25x?=
 =?utf-8?B?alhJNng2LzBzUGhWYkJHQ3I3Y1YwUlZ5OE5UQkVDSjhJZENPbis3QUhKRjM1?=
 =?utf-8?B?aFFaSnFPc2pKdlJEd1lIZTREQ3JySGY3RHF3Q0FlVUc4UWZhczFRS0V5b3ZY?=
 =?utf-8?B?Q2JpYTA5bXBqbGkyOERINk82TzdLRWQxNXU5Vm5UREZCck5DMFRsZ1BJMFNX?=
 =?utf-8?B?emRDZjhQTVIxM1hWYlplOW9EbjBsdE5uY09leTdVNmM4ZUF1ZHIvTEZVMDBB?=
 =?utf-8?B?MmlhVVFXZGVMTXNtNXFxc1lEN3ltcmhDZngvY20reHMzYmtzVzB5aU9YT3Nk?=
 =?utf-8?B?QmVJd2lWR2I0STZJZElNVEUyTkRiWnZXY0w0a0hEYXNvMzJYSFJyVmpiUXFB?=
 =?utf-8?B?SVRIRXpYazFuaUtmVXZ5N2tRWFRDUHd0dlFsRk0vUEFBUlpRTCtSM3BBb0dX?=
 =?utf-8?B?NDIxM252YzNLR25MV2ltRzhDbE5GeHlScnprVjYzcmgxWEdKem9MTVRYdXl1?=
 =?utf-8?B?NUdLZndGMGZmYWdSMG5Za082NTdmUlEvM29aMTloNk5pbTljN0lwcENBdHVK?=
 =?utf-8?B?WCtCZEU0Ty9VeGg0dU9MSkZIVndyWUZwaldoSVRiVG5jNG1GajRWNlFldUNI?=
 =?utf-8?B?cDZDQzY1eU1NZi9iTWUzNDJUWldtdlN5MXJOQkY2VkdTWHBwOElrZUVkV0Vv?=
 =?utf-8?B?RHFodlBsdjdTOFdJZXAzbkt0ODYwb0VaMk5PQjZxQ2NUam4zVStldjY5Z09K?=
 =?utf-8?B?a0VJbVVySm4xaGNsL1RTY1oxZTZRYnFCWFdtcXgrVGlvWUVoaStDNldIeHVP?=
 =?utf-8?B?UFBaZUxMOFFjZi9wQ0lmWk5FL09nWlhxSFlUdEN3eXVGTDFZUHJFVGthV0tS?=
 =?utf-8?B?WFVnWVZtVHltUHA0OHROTk1neVdSV0ZFb045MHUxbTBxQnJsS29pLy9NQTZv?=
 =?utf-8?B?NHhOZlgwKzhxbzJXeU8wRURWUmxuZThhdkdrbGV1RVF0c1BOcDN2N1pabnhs?=
 =?utf-8?B?S2liejJVVS9DVkZaOVRpb3lFYnNqbTNEUmhMQ3dBdzNGaG9wejN0TStNZWJD?=
 =?utf-8?B?Z1ZxWUczNE9pbDdoa0t4K1czUThYZjRReURIWVExbjdMVEZXdWJtcHR4RnJ3?=
 =?utf-8?B?R1V0bnpPVzh0S3poMTNzRXllR015UXk1ZHdoaEZJRTNOOHFSazV4WlRpeko0?=
 =?utf-8?B?VmwvaDhlNTlBQUFMeG1ST1RKYzJqN0lBSFc5d2J4eHl2b0tQYk56VkQyaG95?=
 =?utf-8?B?S3liMk1oaWYyUDdpL0xhekVLQnIwWWFQQnBydXk5SUN4d3FlZnpEQTJ0Rm1a?=
 =?utf-8?B?U1FmaCtpYTcyRWVPZEJIVklEOURxVlRrQXg2Y0lTbERKdmFsSDl2MW5pTHZC?=
 =?utf-8?B?eHlpSk1NOXpScEdxMmwzbVVoNW5tbkdCd0VjSFZpWWQwVGdmVWRCeXlLWC9D?=
 =?utf-8?B?Rm1oekN2Y09MOGwrTWZIeHdNV2JMeHhha2U5bjJ3Y1VBVDU1Y1FYVWZtSjdE?=
 =?utf-8?B?dnVQeUhYZGw5RGNaV1VrMGtPVXc5dHZpZ0xWM2VhUjNZeWQ0MFYzSk4xdHJG?=
 =?utf-8?B?M3ZSMzBJeFpSS2ZIOHA3NkhKanJsWXpxNkFNaFB0OGJtdnZhOW5QdHorL1ZZ?=
 =?utf-8?B?RFl4MVUzSU1adnF6N29zUlpIYWFTQ2VBaWI5aUZDQ1gyWGIrSUtQYWZnUXRx?=
 =?utf-8?B?YVBDOSt0WjR3Z1duSUt6OVd5MXo4cnlac1A5MWJQaXZBUE5OVUIxUkIxa0lu?=
 =?utf-8?B?ZlR3czd3UlJqWFk0ZUNqOGkxNFc4STlwZVVnRXIyZVBWSHc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f3e9b32-f9b9-4745-8698-08dee179a523
X-MS-Exchange-CrossTenant-AuthSource: SYBPR01MB7881.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 07:29:31.6441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY0PR01MB9296
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67544-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER(0.00)[moonafterrain@outlook.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hverkuil@kernel.org,m:mchehab@kernel.org,m:dafna3@gmail.com,m:mchehab+samsung@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:danisjiang@gmail.com,m:stable@vger.kernel.org,m:moonafterrain@outlook.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,outlook.com];
	DKIM_TRACE(0.00)[outlook.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[moonafterrain@outlook.com,linux-media@vger.kernel.org];
	FREEMAIL_FROM(0.00)[outlook.com];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,samsung];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,outlook.com:from_mime,outlook.com:email,outlook.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0073B751DD3

vidioc_s_fmt_vid_out() sizes the encoder CAPTURE buffer from the
compressed descriptor pixfmt_fwht, whose sizeimage_mult is 3:
coded_w * coded_h * 3 + sizeof(struct fwht_cframe_hdr). fwht_encode_frame()
encodes one plane per component, and an incompressible plane takes the
FWHT_FRAME_UNENCODED path in encode_plane(), copying the plane verbatim.

For a 4-component pixel format all four planes are full resolution
(width_div == height_div == 1), so a frame that forces every plane
through the unencoded fallback writes
sizeof(struct fwht_cframe_hdr) + 4 * coded_w * coded_h bytes, overrunning
the plane by coded_w * coded_h, which can result in corruption
of adjacent kernel heap memory.

Bump pixfmt_fwht.sizeimage_mult from 3 to 4, matching the largest
components_num among the supported raw formats, so the capture buffer is
always large enough for the unencoded fallback.

Fixes: 16ecf6dff97c ("media: vicodec: Add support for 4 planes formats")
Reported-by: Yuhao Jiang <danisjiang@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
---
Changes in v2:
- Correct the Fixes tag.
- Set pixfmt_stateless_fwht.sizeimage_mult to 4 as well.
---
 drivers/media/test-drivers/vicodec/vicodec-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
index 318e8330f16a..ff9d50fb05fd 100644
--- a/drivers/media/test-drivers/vicodec/vicodec-core.c
+++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
@@ -63,11 +63,11 @@ struct pixfmt_info {
 };
 
 static const struct v4l2_fwht_pixfmt_info pixfmt_fwht = {
-	V4L2_PIX_FMT_FWHT, 0, 3, 1, 1, 1, 1, 1, 0, 1
+	V4L2_PIX_FMT_FWHT, 0, 4, 1, 1, 1, 1, 1, 0, 1
 };
 
 static const struct v4l2_fwht_pixfmt_info pixfmt_stateless_fwht = {
-	V4L2_PIX_FMT_FWHT_STATELESS, 0, 3, 1, 1, 1, 1, 1, 0, 1
+	V4L2_PIX_FMT_FWHT_STATELESS, 0, 4, 1, 1, 1, 1, 1, 0, 1
 };
 
 static void vicodec_dev_release(struct device *dev)

---
base-commit: 9716c086c8e8b141d35aa61f2e96a2e83de212a7
change-id: 20260714-fixes-aa8cf63bfd95

Best regards,
-- 
Junrui Luo <moonafterrain@outlook.com>


