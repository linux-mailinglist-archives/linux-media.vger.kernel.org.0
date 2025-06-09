Return-Path: <linux-media+bounces-34329-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C1AAD19FB
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 10:48:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 792623AACDB
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 08:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804071E8358;
	Mon,  9 Jun 2025 08:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="fFa0jeQp"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021124.outbound.protection.outlook.com [40.107.42.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52B31459F6;
	Mon,  9 Jun 2025 08:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749458879; cv=fail; b=sPhyB/sPAXT5C8LOiN1lqb5kRzfmimrTQM5++d5d5acBi0uTAxFv++0E7ipdTqpwwq8+lsz0t27i1rzakzmZzwJAy6eRhFuNTKyjCgG5FVAtLLEYqnFuBW6QL4NreCPfmCa8AaRGwGwLggOkpyoY3TbeWa5QFRu4KxH1wLhqVPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749458879; c=relaxed/simple;
	bh=fTFplFhNEB7UmTbJ1axJF305/QMCni3l82EgZztqlzM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oz1ACXyYBLu4C7KhJObuUoDNvGR1hjU9UHLjkYVdy8u2+JVHDld0L86PO0Il1PK6CExD5ryuiMi9U8FxMQiGLsc4f+4d2ul3xZjaUIQpEiSyUdvYBi5nCeOnj+OWNodyYBnKIGEChjEjVJQgqMO2K5S1BnJAIqKG/aU1Kx20ZBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=fFa0jeQp; arc=fail smtp.client-ip=40.107.42.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g50oL8+FEonjHg5pvWA+GtJnziuBHUz9FSkcevsFNxiP6NC64essua5SZGS1vxoXbFegehzxh9Bn+3GUd8GuF7Hakr6ZMcXO5sxV5Hgm/GDNGVuVdQAwiGPsD1siWuhejvga28EdJ13dURjXot041bW/SBfyZcyk1bIt7rennuuJ1MwqjGItZ1uwdBL1iikYeZxrgmC+z2AoDXptQB2Nonq3XjXwDZjyj4hSqNbyHePYCx4PNDPvoQEaRkBMSLA1eu2VuLgn+/JFBgWDjRJbdLvqQB5G8BH8o4WY+IW/vLUMjnFzwdtlRQk2z1F2nwatBN7mOK4fAMKQIoxjb3LBmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fTFplFhNEB7UmTbJ1axJF305/QMCni3l82EgZztqlzM=;
 b=B64PzSOvesAPKhuTMZj74BPDExgQ0fdPVIhpEsuYW0+ddaWLrfVGS4ycUzrzfC+fKqgUpGrq++fxc+0NHResjFnxeZwO6VlZIObUXs2IhvXXkDdaoweFRxmByS5LNw6pT0S3WmJAi2+mBlQ/M62J/sexdOqVqCksjQZofK9BFAkWy/6DrLd9SjdUHS2KRSjqLDqiOHXHxAeeGn5ArJteacfYmKZs8k2z5/vI7rrlAJIpMs8id9I7+hwKEDP5WqkCdWfbx2i3yA45szorlA3yUx72XnOsyCBAlWOoLDo90KLzxtrh0z9eo0IZd+0zzZfgrPdMn3r36maiwd7696R21w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fTFplFhNEB7UmTbJ1axJF305/QMCni3l82EgZztqlzM=;
 b=fFa0jeQpq4vY3aCoFy8ghGx8XFYwHWtJeM+ulqDyNuQKvGKcr4cvJWIcvNuaN6fxcp5BDHhiblEYiodYRQvFShLNoCtQACPyLSqBMO8HznCkh6DXfwLqit2vr5BZ0uAPrjQyrO+6xOz+wqHVfYqcg6jqvAgyJ3l0BBw8ZN4S0+0=
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SEWP216MB3009.KORP216.PROD.OUTLOOK.COM (2603:1096:101:293::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8813.30; Mon, 9 Jun 2025 08:47:53 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%5]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 08:47:53 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"bob.beckett@collabora.com" <bob.beckett@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, lafley.kim
	<lafley.kim@chipsnmedia.com>, "b-brnich@ti.com" <b-brnich@ti.com>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, Nas Chung
	<nas.chung@chipsnmedia.com>
Subject: RE: [PATCH v2 2/7] media: chips-media: wave5: Improve performance of
 decoder
Thread-Topic: [PATCH v2 2/7] media: chips-media: wave5: Improve performance of
 decoder
Thread-Index:
 AQHbyurOkmkh1DQff0CeTO0j+fdx8bPgfWOAgAVz/yCAAiaxgIAKXsPwgAChxwCAAPwu8IAAkNuAgAX6iRA=
Date: Mon, 9 Jun 2025 08:47:53 +0000
Message-ID:
 <SE1P216MB1303BED1AD4E7C782BA14E66ED6BA@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
References: <20250522072606.51-1-jackson.lee@chipsnmedia.com>
				 <20250522072606.51-3-jackson.lee@chipsnmedia.com>
			 <3afbd0253fabcf9f8795ab2231107e2e9da012cc.camel@collabora.com>
			 <SE1P216MB1303C1D1C2A9FA165A01B71AED64A@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
		 <03a87e1c9e8f77887c2457b9c3fcbf0c6a6cf287.camel@collabora.com>
		 <SE1P216MB13033207BDFE2A6BCC48999EED6CA@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
	 <1318bd68f2d60b9d44cb22bd90b92399311f0b00.camel@collabora.com>
	 <SE1P216MB1303F7ADAC83F6CE312C5CA3ED6FA@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
 <8c6316d2d00287e96bc2ad5d27c8de37f990b7e5.camel@collabora.com>
In-Reply-To: <8c6316d2d00287e96bc2ad5d27c8de37f990b7e5.camel@collabora.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE1P216MB1303:EE_|SEWP216MB3009:EE_
x-ms-office365-filtering-correlation-id: 7072c17f-dd25-4fd6-2874-08dda73252b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dldOamhSM1hmS1pISVkyRlphMmRRY0JNSWwvR09DV0VYWjgwdUQ2SkdiMkhD?=
 =?utf-8?B?ZERnUmxSNTl6OVFoT0I0cGRJN0RjOFdZOHdmMHFPUkFlK0hmdksrUXY3bjJK?=
 =?utf-8?B?WjlrT2FQVmpkeHhkNHVvNmZ5WkluSE1BV0RGNXVDWVZyYXFHYlMrVmRmdC9o?=
 =?utf-8?B?TUprOE8wZlhrMGVxTFYyMm5ZVThkM0t1SlhETmRvelhKaElEc2dLTDQwMEtq?=
 =?utf-8?B?cXRXZEpmU2ZTODdidDhZeVdqcUpHVjRlVjJKUFVOZjdPN1l3M0YzK053OHl5?=
 =?utf-8?B?RElLaklwUHhYSDUxUDNiOERCam1ZaDVnYTNRVzhWY1RLS3NScmpwUGJJbTFN?=
 =?utf-8?B?YVFBQmc5Vm9DRDdsSC83emZFM1pST013c1lRMXhNaVJKN1ZBM3E3TG44K3Jw?=
 =?utf-8?B?alg4K0wycWMxRDRpRmxwKzBmV0YwTjhkM0NOSWc4cUpEcG95Zm9ZNG83aVpZ?=
 =?utf-8?B?VFdGTTFBNVdSNTBOWm5hNzI3NEI0aGYwTkloUms5eVhabFByd0RmNW9GQVNk?=
 =?utf-8?B?MS9tZnVsOFhFb3hRcVh3MUMyTE1BblZCeTlnbWdUTlVmOU1uWGVxV1ZZT1JC?=
 =?utf-8?B?T2lrbVh2YnZFNmhiSnBnSERKRmx0a21ocm05Z1lhS0tTM1NZcU9EKzdwYW9N?=
 =?utf-8?B?UFRPMDNEK1ZTSTRtS1J2c09ZUHZnN0dBTS9zZzNWYmxEWEhQNCtLK1daRmxh?=
 =?utf-8?B?QWhUenZNMDN0TktKS0ZpSEtJMGFDaDlDTEJoUmtxL0UrOENxNjdRSnpsMC9Q?=
 =?utf-8?B?dG5xei9yVUt1U0tWd1lMaVRUbE5rVFBmMzNUemhxVER5SjdmWlJDZkJBejRB?=
 =?utf-8?B?bFo5L045dTl5c3czMDBiUXROZE5QeEtPMm0rWC96eXdMalJuWFMzYlRQQjJW?=
 =?utf-8?B?NTJGUkFORDIvZklycWl3V0x6dVI3dUxFMWk0dTZ5c2ZjeG5hcnlPcVpKL1JY?=
 =?utf-8?B?blZVWWttd2p3QU9pcEZMQWJGb2wyTVJ1aEVXbW5Xb2dOR2owQzhmNUExSjlj?=
 =?utf-8?B?MUNsRnN0YWFuYVV3eXFEMDlnVHRZMVBneUhkYXFFOEdiMjhwbStrb1dDbkNs?=
 =?utf-8?B?ejE1eTJpZ1NaWGdUNW5RTUJhblZhUFpFekJoOEZnb00zbEtLdlUrcWxUdTZ4?=
 =?utf-8?B?MTYzMjc0Z1QwcUVXNWZ2eXk0anZMYVA5dHA3WVdBUGw2cDhZUGxNbXFRclI0?=
 =?utf-8?B?RmV1WnRsUUh3bW16a3ZwMzNQQjcrTkVVQ3FIVWdOM1RwbFdZMmdQUzk0N3FP?=
 =?utf-8?B?bDVseTd1SitDVHkrSGI2MkYxalBRYThuWWE5WERRVjBpaGc1VHViYVpSWmhv?=
 =?utf-8?B?Zmo4RGVzd3hDNGRLM0VYUGkzakJQTHNCOGFpQnhyVzk0SWdMWDVmalF6RjFY?=
 =?utf-8?B?RW1GU1FsUEZXZFFBeUFLK0JZdWdmS0krMlFodVl3bVdOKzcwYmsyMkVBWUtK?=
 =?utf-8?B?cFJZNSt5TU94RHpzRXBNbllHcGNuV3JHZjVaT0piR2FRUSt5cDlvQ2JMTnBi?=
 =?utf-8?B?cTFsVjhKV2lLVVZZdGk4KzVqS1BEUk9JeTdBTm9EOFo2Qy9qSGorZFRKdGpo?=
 =?utf-8?B?K2JaVVJUUlBhQldvc0RhVVVsblFOejN4a1hoRFp6T0xsK2luYW1vNDJUWDlZ?=
 =?utf-8?B?N1RRa2lVby9KdHU0WWplUVBkSUN3VTgxcTdFTXlSa2FRYXh1RkJZT1hodzNv?=
 =?utf-8?B?M3ZuWkd4M3Nnc3NTQlY0eHQzOW5ob3NMS0lHdis1WFMwYXMzcFhNSDRTOU9I?=
 =?utf-8?B?ZFRuMEVrOUZheDRpb3hTTzMrRDYyTEsxNjhnaXNScWVoRi92OGpiNVZhS2Ro?=
 =?utf-8?B?NnRNZTMzRGpHSldZZGJ0VGdWaWhqK1ZSaXNIamFsRmdwazgwWUxQb1V6akhG?=
 =?utf-8?B?T3Z2VjVudXJvSEpMVDJJcFkrREtTa2ZJVmwwMkltVC85NEY4L25qZFErMmxO?=
 =?utf-8?B?R3BDOVpQWmNSNkxxUmVBb2JIS09ubFpIcXNybzI3TGdRZklTU3psUmNkajZD?=
 =?utf-8?B?TkFycGNkZWNnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eitxUkNIdElDdkpNaGJkTWpIMnU0TDJacVVLRDlxRnZYSUhJV21wV2hPUHhk?=
 =?utf-8?B?ZWlyZzM1WFliWENKZmZkQUYveXhScU1UQTlDenBMeEo3ZlJ5OHY0RGtrTkxO?=
 =?utf-8?B?WWRtUFR0RzJsU0pHNkovYTNzdVFtMHFTQjZyeGFHVTU0dEVoR3YvcWpzdStC?=
 =?utf-8?B?VG43dGNvSXNFelp0VTBvbS9zT2dTVnN5N1MxMnBwZUdHNW84VkNjMndXeFYv?=
 =?utf-8?B?bkY4aVU0bnk3Y2VJK1R0OHVyd1lBYkJBTDgyUklkSHkra0RocjZDZG5aZGlI?=
 =?utf-8?B?QmtQUUxxRWdvZ0NCVGZmRFVyZmp4RHNxTE1rdVpXMFlMSVVyVW41bkYzUVdD?=
 =?utf-8?B?ak9jOUZ2Zmx5TldtdHVRU2xsejNhRkwwb2RDOWswSVJmdkMyL3ZlOTdHRlBl?=
 =?utf-8?B?T1JCNG01SXFqamd5eTlvSUYvUExIemdNZ1Y2SEQzWXVjZHZYeGpVTGFOU2x0?=
 =?utf-8?B?SzJUZVUyMzZTMStxVnNjVkU0SVVwZzY0ZllnakhLUmdTdklsZGlHTU8vd09o?=
 =?utf-8?B?ZkdLMTJPUmVrMkxRZUYveEwrb3ZmaUFsVXg5V0o4S24xWUJxYXN1ZHJudFpX?=
 =?utf-8?B?S092aWVMekFVSmFuWlJNVEFZQUN5emdmaFNzeXpGbmlQYnBQUis1dmNnVmxS?=
 =?utf-8?B?Z3g2aWkxODZ0NDFDa2JGLzFaTU4vb2NnU3ZnWllqbGg5M3JuTGZOMGIyS1pK?=
 =?utf-8?B?SzNEYjFjbGlvb21lMXY0akRJL1N3ZzY5Ym8xRUs4YStVODd4ZHpBQkllZy9i?=
 =?utf-8?B?Z1F2VTFWbENuQjlTK0Y0amNELzlzSDhSV1dTR0xIalhXa1JGUm80UVYweVFt?=
 =?utf-8?B?dkNlVVM2YjBSR2FJZUw5K2E0dXNCM0g4TWtuTzlWQk85T21HcktqL3ZXZFhJ?=
 =?utf-8?B?RWZwbFA0UnVVdXlXelhWRmY0NEw0alYyckw5ejB2eUVVS2dIZHRKRk5UdFhO?=
 =?utf-8?B?TUd3QjVyRDYzcGtHL1FxbERTRGU0a3hITTRuall6NEY5bnJqbitHZnFOUnJu?=
 =?utf-8?B?RTFvUERQR2drNmdtK3hRamR2TDR1Q1NlanNaK05keHcrZHFRUDdkaWd3WFVE?=
 =?utf-8?B?OU1mUkJvNHllS0swSnlXWTc1VmNsMk56THhyWDRuMFQ1V2ZxMTZzM3AyNVUx?=
 =?utf-8?B?ODVFUjJVWTJpTEtQZVpGUGxHZk1EVkpsNTJQV0cxUUxLUVA0d3ErT2xMelJO?=
 =?utf-8?B?Y1FwOHZ5NFlQeVJPRkdnb3c1NVgweUE2OVFpRVQ5WnRPMUZYdzZlRFlPNnJI?=
 =?utf-8?B?TXpLcmtHRjRWaEoxUUJZTFpzdGpIVzJhc2dGS0lLUUh3OFphWXNEeFdFMUc5?=
 =?utf-8?B?TGZ6YlJsUGRVUURuSjlKeXAyeVBJemJHNFZWSS96OFBqUlJINEN6YTRmdTg1?=
 =?utf-8?B?NEt1eVBPaXpnaEFBTXdxcHppYkl6TExtVzlxS3laaURVMW1lY3ZGT0Y2c01j?=
 =?utf-8?B?OGU0QTRrRHJaTEgzUXYyN3docStFRTlVOERsZ2NJMkZUZi9VVkRuYURiZkxJ?=
 =?utf-8?B?c0JBZy9abFRES2wrWkV4akt4NWoxVW4zbW13REVkRFRnWStGWDc4TnBobDUy?=
 =?utf-8?B?S3Nwa0IxTmxIYUFRTDR4K1I3c3VLTmsxVHBEMEthVnVnZWpuMG9jRW81ajJ3?=
 =?utf-8?B?ZzhURGJBRE80d1lkdGlkL1d4dHlzRFh5TWlTUVZGL0JKWnNmRXlYeXpJTE03?=
 =?utf-8?B?L09FSzdDVGczTk53empQeDVXL3pQZjJ2bHJHcVdNcExFVm1wdXBLNDFnc3Vw?=
 =?utf-8?B?ZEp0MEN4YWlvVkNYeTAxMHFmSkw5emJ0SzA5b2gzclEwYVNmUjF5WXBONGhM?=
 =?utf-8?B?ZW9UNnRpeCtWZmxkcVhaaXRNZTh2VUEzblhuR3Y4RUNPQmY5RzdSUzIrMWF3?=
 =?utf-8?B?T0VYLzk3VXozRFN4cjl3QzdodkJpLzJDY0JhcFhhNE1VTElqbW40SEMxdVNF?=
 =?utf-8?B?c2JCQnZNTHVKTXByUm1VUnVIdEdNcnFBM2hDdE9FZjE4UEJGN2tFU01Pamx2?=
 =?utf-8?B?MHE1dnhFNVZmYUJ1SG9OU0lQcGdYWldMS2dyd1hJbVp2eWJOTGMyQ2RoaVlU?=
 =?utf-8?B?YzhxNVc2SCs2T2ZRVFFVVGdGaVJnVEovbndaMXVMTW42ZVE4L2ttY0d0eDBj?=
 =?utf-8?B?VVo0ZnMwT2src3QyNzBjOG9ZTjg4R0pWZVJLMmNuYUFqNkdQUVBZY2dhQlZS?=
 =?utf-8?B?aWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7072c17f-dd25-4fd6-2874-08dda73252b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2025 08:47:53.3503
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c7DtThFU1sZec3/DuR/lzPsItDx1xAaikMSpbFl/aJhPD90p41QZBQf/SM01ISqZNwSIwiaDjlsM1SZeTepXTH49xhviwrUFu+z4LrcTFI8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEWP216MB3009

SGkgTmljb2xhcw0KDQpJIHdpbGwgZmluZCB0aGUgd2F5IHRvIHJlZHVjZSBvdmVyaGVhZCBhZnRl
ciByZWNlaXZpbmcgdGhlIFNUT1BfQ01ELg0KDQp0aGFua3MNCg0KPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiBGcm9tOiBOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1ZnJlc25lQGNv
bGxhYm9yYS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBKdW5lIDUsIDIwMjUgMTA6MjkgUE0NCj4g
VG86IGphY2tzb24ubGVlIDxqYWNrc29uLmxlZUBjaGlwc25tZWRpYS5jb20+OyBtY2hlaGFiQGtl
cm5lbC5vcmc7DQo+IGh2ZXJrdWlsLWNpc2NvQHhzNGFsbC5ubDsgYm9iLmJlY2tldHRAY29sbGFi
b3JhLmNvbQ0KPiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnOyBsYWZsZXkua2ltDQo+IDxsYWZsZXkua2ltQGNoaXBzbm1lZGlhLmNv
bT47IGItYnJuaWNoQHRpLmNvbTsgaHZlcmt1aWxAeHM0YWxsLm5sOyBOYXMNCj4gQ2h1bmcgPG5h
cy5jaHVuZ0BjaGlwc25tZWRpYS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMi83XSBt
ZWRpYTogY2hpcHMtbWVkaWE6IHdhdmU1OiBJbXByb3ZlIHBlcmZvcm1hbmNlDQo+IG9mIGRlY29k
ZXINCj4gDQo+IEhpLA0KPiANCj4gTGUgamV1ZGkgMDUganVpbiAyMDI1IMOgIDA0OjUwICswMDAw
LCBqYWNrc29uLmxlZSBhIMOpY3JpdMKgOg0KPiA+ID4gU28gbXkgcXVlc3Rpb24gaXMsIGlzIHRo
ZXJlIGEgd2F5IHRvIGtub3csIGF0IENNRF9TVE9QIGNhbGwsIHRoYXQNCj4gPiA+IHRoZSBIVyBo
YXMgZ29uZSBpZGxlLCBhbmQgdGhhdCBubyBtb3JlIGV2ZW50cyB3aWxsIGFsbG93IGhhbmRsaW5n
IHRoZQ0KPiBFT1MgY2FzZT8NCj4gPiA+DQo+ID4gPiBOaWNvbGFzDQo+ID4NCj4gPg0KPiA+IFRo
YW5rcyBmb3IgeW91ciByZXBseS4NCj4gPg0KPiA+IE5vdyB0aGVyZSBpcyBvbmx5IG9uZSB0aGlu
ZyB0byBrbm93IGlmIHRoZXJlIGlzIG1vcmUgZXZlbnRzIG9yIG5vdCB0bw0KPiBoYW5kbGUgdGhl
IEVPUyBjYXNlLg0KPiA+IEl0IGlzIHRoYXQgZHJpdmVyIHNlbmRzIERFQ19QSUMgY29tbWFuZCB0
byBWUFUgY29udGludW91c2x5IHVudGlsDQo+IGRpc3BsYXkgaW5kZXggaXMgLTIoaXQgbWVhbnMg
RU9TKSBmcm9tIFZQVS4NCj4gPiBWUFUgc2hvdWxkIHRyaWdnZXIgaW50ZXJydXB0cyB0byBnZXQg
ZGlzcGxheSBpbmRleCBmcm9tIHRoZQ0KPiBmaW5pc2hfZGVjb2RlIGZ1bmN0aW9uLg0KPiA+IFNv
IHdlIGhhdmUgdG8gcnVuIGRldmljZV9ydW4gdG8gc2VuZCBERUNfUElDIGNvbW1hbmQuDQo+IA0K
PiBXaGF0IGRvbid0IHdhbnQgdG8gc2VlIGlzIGEgbG9vcCB3aGVyZSB3ZSBkbzoNCj4gDQo+IAlk
ZXZpY2VfcnVuKCkNCj4gCQlmaW5pc2hfam9iKCkNCj4gCQkJZGV2aWNlX3J1bigpDQo+IAkJCQlm
aW5pc2hfam9iKCkNCj4gCQkJCQkuLi4uDQo+IA0KPiBXaGF0IEkgc2VlIG5vdywgaXMgdGhhdCB3
ZSBzaW1wbHkgYmFuZyBvbiB0aGUgdHJpZ2dlciB1bnRpbCBpdCBjb21wbGV0ZXMsDQo+IHdoaWNo
IGlzIHZlcnkgd2FzdGVmdWwgaW4gcG93ZXIgYW5kIENQVSB0aW1lLiBJbiB5b3VyIG5leHQgdmVy
c2lvbiwgbWFrZQ0KPiBzdXJlIHRvIGZpbmQgYSBtaXRpZ2F0aW9uIHRvIHRoYXQgYWN0aXZlIGxv
b3AsIGFuZCBkb2N1bWVudCBpdCBwbGVhc2UuDQo+IA0KPiBOaWNvbGFzDQo=

