Return-Path: <linux-media+bounces-24021-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A0F9FB8B5
	for <lists+linux-media@lfdr.de>; Tue, 24 Dec 2024 03:35:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB595164E8C
	for <lists+linux-media@lfdr.de>; Tue, 24 Dec 2024 02:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE8EC13C9A6;
	Tue, 24 Dec 2024 02:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b="gVROzlGy"
X-Original-To: linux-media@vger.kernel.org
Received: from mo-csw-fb.securemx.jp (mo-csw-fb1801.securemx.jp [210.130.202.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22D0EBE;
	Tue, 24 Dec 2024 02:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.130.202.160
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735007699; cv=fail; b=Wk956BCDBraSvsJUSDhJ/QOhFNRf7pEmdUYYWq7pkmfEvtZX/0OU8qceIvhioDCdfbiK5Yt+oJ+VvxnQ3P+h6HV0BI1g4BaPV2N1HjrF/uQZPew09v4bcR/6G3WtBhfS27FPvoI6P9YOeMZ83/ysB10gN/IQIFLrqIknU8C61dw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735007699; c=relaxed/simple;
	bh=U1JgK9QN8ip22rPDC2qjbh1DG3ywdwu8uYS9qMDSwhY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KTotjDN7/NRzY7EdZwYsH10+EFh87pEe2ZD8hLpueaox/ECicX58CRLbqAwBnTKq5xNf/AvX8e+Yt2u6xHBgWtQ18nyJp2l7g4UMY7GchpSUmTdjbAspsx1ksYuOopkJ76phw7a/KLkPgYJZosL1Nc6sM+3iPdrzswRvHbkEMvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b=gVROzlGy; arc=fail smtp.client-ip=210.130.202.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1801) id 4BO0NOGQ3692259; Tue, 24 Dec 2024 09:23:24 +0900
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:CC
	:Subject:Date:Message-ID:References:In-Reply-To:Content-Type:
	Content-Transfer-Encoding:MIME-Version;i=yuji2.ishikawa@toshiba.co.jp;s=
	key2.smx;t=1734999764;x=1736209364;bh=U1JgK9QN8ip22rPDC2qjbh1DG3ywdwu8uYS9qMD
	SwhY=;b=gVROzlGylb6G4eVAWhJAdN42jRgb0zRh3MxfGrfufATtau4en7ESZNCASjOP6auQxbEeC
	LpVnFmv4PDw93FB/DKElzBGdgVOsC1cXW9o9J5Wnpyce49H6TIoHZnVNn34NW5TqmOiGc0UgzWCxd
	5ezDeeF6N7y/5RPOeZV+Jk+fn2GalwS/PLULn5rQKMOp0f3MXhbMz6mPELcUNlS0k4mnrFAe4jp8v
	XCyeDdasJFPzr9sg9RsieM1jwVygfoaE8vyJ+nYKMeblrwiqbwKvdTvaViL3bqFN8IypvKa1QkGIk
	s+S4rNtPc9AwEMD5Jrxzu95GSBDj8g5UXl1eiE9m9Q==;
Received: by mo-csw.securemx.jp (mx-mo-csw1800) id 4BO0MhIO001417; Tue, 24 Dec 2024 09:22:44 +0900
X-Iguazu-Qid: 2yAb5TJldYp5G8v4pa
X-Iguazu-QSIG: v=2; s=0; t=1734999763; q=2yAb5TJldYp5G8v4pa; m=yg7UWWkjGn4kATG2J7Jkspg0fMbmu9CIYt0pB7byHGw=
Received: from imx12-a.toshiba.co.jp ([38.106.60.135])
	by relay.securemx.jp (mx-mr1801) id 4BO0Me182830163
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 09:22:41 +0900
X-SA-MID: 34640860
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gRFqKKTDja9SbAPe/82eCmhTlzaNEIRsTvnjKSPg8Ie3YhTEIcRczshzH2LVkcoTkF4RIcLFzOPFHyUmlk3YCvGxJw3VNo6ocL+DETkUWzf2UR0kikte9OkyDKyJrURe2OFLSRQx25P/gOoysXBvbfn9JU0dJ4WhD0zRsJP6PbT/gES5X3ezi+gYnT8Z+0bTLHZfLlMSOnFwVscpgebl9eaV/b30g7E4R/7WdXOgzygpTqYVi1MPS+LQKm06H8VhiLSagBdAxIQh1vPng/qf+N00ak0yxGuwJI6XPFCOuh7Ryo3q4ucJeupgoPcTarJlBdgJJtQ6XUuUDYHCduityw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U1JgK9QN8ip22rPDC2qjbh1DG3ywdwu8uYS9qMDSwhY=;
 b=PaQoo76gc5gO0yTGgEI5fZVvNRD7K1eA7yaITSobg9AjoMCYtp1we0Ie5N5dWUr6qVOCNiMJCHFNKvQwLW3LIYqmOwnn91iO1k+XzPaDN+r3rzNOW7NT0TzEqoDAh3Pj/wpMpLEL8weaCnNZldgo8E+mkYVXUqxBHXjmObzC7hbR8z6FFHpMHN5/t9E3Ys6hIy0z3vRPziGECtNhiDqXR2Ue2LsM1WFkMEF36rr/w0Of1JJoXIlSZmvrmBAplTl+A8/YlX4DUSqNBodZHzu1cE1FTBZYyNtVUBLklBTa5B+5CFGp/8Ox1W6yyfOXOoE4e7tpdj0d/9ZuCpPlAKOX0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toshiba.co.jp; dmarc=pass action=none
 header.from=toshiba.co.jp; dkim=pass header.d=toshiba.co.jp; arc=none
From: <yuji2.ishikawa@toshiba.co.jp>
To: <krzk@kernel.org>, <laurent.pinchart@ideasonboard.com>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <sakari.ailus@linux.intel.com>,
        <hverkuil-cisco@xs4all.nl>, <nobuhiro1.iwamatsu@toshiba.co.jp>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: RE: [PATCH v12 1/8] dt-bindings: media: platform: visconti: Add
 Toshiba Visconti MIPI CSI-2 Receiver
Thread-Topic: [PATCH v12 1/8] dt-bindings: media: platform: visconti: Add
 Toshiba Visconti MIPI CSI-2 Receiver
Thread-Index: AQHbPxt+FWsXAxpsxEuP88pN+FIWP7LHxoSAgCHmlTCAAGJNAIAKo6Rg
Date: Tue, 24 Dec 2024 00:17:33 +0000
X-TSB-HOP2: ON
Message-ID: 
 <TY3PR01MB9982587EA795975D38C631A292032@TY3PR01MB9982.jpnprd01.prod.outlook.com>
References: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
 <20241125092146.1561901-2-yuji2.ishikawa@toshiba.co.jp>
 <07e0cc97-c0c4-42fd-b51d-87b0eaed4e4a@kernel.org>
 <TY3PR01MB9982FE7739FABB2275C79C0B923B2@TY3PR01MB9982.jpnprd01.prod.outlook.com>
 <cb6be804-1649-4d17-839c-fe58a39baa1d@kernel.org>
In-Reply-To: <cb6be804-1649-4d17-839c-fe58a39baa1d@kernel.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toshiba.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB9982:EE_|OSYPR01MB5400:EE_
x-ms-office365-filtering-correlation-id: 9da033a3-1171-48fa-691d-08dd23b05cfc
x-ld-processed: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?WS9PNmYvSFBvUmw3czArTFJnSmk0LzZEeTNmb0xBT3pPLzEyZ005NDAzQXMz?=
 =?utf-8?B?dDBZcUorRlhQTjAzbGFUWWxIK2hZSDdXUENYcHFqZ0JZaXFtVEFTS0dTY1p3?=
 =?utf-8?B?a2cxeGpEMjBoeUxmbGNJNFBMekFKTmhrWVR4Yk9xSmNDUVBpN2hUWE5RWEpx?=
 =?utf-8?B?eUtwSWNFKzlnQjFWL3daaE43azh5dzI5L1Q5L1R5SHVyMWdYeEFIeDNMYnY5?=
 =?utf-8?B?V2o1R284R2ZZTnBlMDlIcjhRMGVKV29TNjl5MHRvam5TeWdUbk5PSmgwZlZC?=
 =?utf-8?B?VSs0Vks4cjBNRGZ4QVFtYTIzWHFHV2FwTTRtc0dtOFYreWpjb0oyOEVUdk04?=
 =?utf-8?B?TVNvakUybkcwenNQR3hWMHJxSnlUSzZNVEQ5eEhxYjYxYTVFaUErdzR2anBh?=
 =?utf-8?B?NHIwMzR4ZFpTMjl2djRDdzNTcFNmK1g3d1hSOHBFM2dXSnk5cEhxMUFNeHdG?=
 =?utf-8?B?MTVtbUpyQTZ3bWFZYW5wblVZcCtYb2lWV2UxZWtMQ2Z3clBVbytGUGcrV1U2?=
 =?utf-8?B?OHJVTTdKdzREaUQzOW5XN005bmdXaXIvVWJoWk03cE1NVnFPL2U1YW8wK01K?=
 =?utf-8?B?QTVkWEZaS3hTLzZoOUF6SGFCMmZKM2hjNXIxdFU2R05xSE5kMm5Od0psZ0tp?=
 =?utf-8?B?eEVyRW5WK0JJZ0U1NkRFbTRQTmZCa1cvcG8vTlB1bS9TNHltSi9vd29MQjlZ?=
 =?utf-8?B?ZVZwUXdub3RsOVc3Z1laL0M3TlRZSkdSU1ltWUtnSFBzdDBiZ3dKVDQ3UUVn?=
 =?utf-8?B?V2JjbnRmSk5Od25ER1NHWHVYSDAxcThYbTNhMEhNbDFoWGpHMzYwWk56b2Nw?=
 =?utf-8?B?VTdkVk9ZS3k4bmtoS0FSbVpyRnJhVEVWci9nUXJCNXJDL0xzSXV6VWErQXNk?=
 =?utf-8?B?eVAvM2J1UGd4dGJ1emMzZUtLYjl6aGlZTlNkMFcwcDY0WGNYKzFMU0FSZHY1?=
 =?utf-8?B?elkvZ3QyVEZ3ajIwcEQ2ZS9GdU4yNkRLUzhsR2J2akFFWTVoOFF3bFpvbUVa?=
 =?utf-8?B?cFJnenJxTTBFY2lGTW4yVHU4azBSejBqVWE0Q3ZhL0NqMm0wbUFzVlp3U3Yw?=
 =?utf-8?B?QVhDR3JuOERIRHpxN1hDS3ZUaHZpWklQRGlwRTNIamF5emxCeTlaaDJxWC9E?=
 =?utf-8?B?Z1RYVlV6OVJDdXRmdFBuc01TdGpmT3NBalBMY0N5bmRlV2xlTEhFMmQ2Q1p2?=
 =?utf-8?B?Z3VxVVZCZ2FhNS9IWXBoWEVvOHFjek5md0krK29OREZ2dHZVTmVyNlp6SWR4?=
 =?utf-8?B?UTN4djNzUlYxSDNIUVozbGhxMjhKUURiWngrRDZMc2cyd0huZTlvUXpRaTA3?=
 =?utf-8?B?c2RpU0pnM1hyQmx6Ymc0UHRPK0RxQzkreFVFcmR1UjVPaXlsM2tRQXJrNWtt?=
 =?utf-8?B?TnRVMWZjdWhtRGw3aFVNWXRYYXgycmxKcWtaUzVHSzR3WGZPN3QwcVA3VlBR?=
 =?utf-8?B?TStjeGYyZS9RN0ZzdGJqVTdnWmtJako2clVJbXk3SE92clp4OWpNVUlTSzE0?=
 =?utf-8?B?MFYvUnNUUHBTdVczSXhxU01qeUtkY3N4UFdNd0Rkd2txQWYwdnZMS3lQME00?=
 =?utf-8?B?d25uSXhKWTAyV2xhNnFQVHYxUnBFUEZycmNpTzNSK3drTVRhWG0vMGRkSCtK?=
 =?utf-8?B?ZU9pRmplWWNpNStaZUZGS2ROWGY0dk5IOHJsd3lrckhreFVScWlYTUZtUlFL?=
 =?utf-8?B?ZFV6S3ptN0ZxQVdHZ05qdjBrR2daZUJ6dTNwNy9zejREZ3k4TW45U1gwR29a?=
 =?utf-8?B?QVFuazhBMkt3YWFiaTBzQjlsYm55WlVjZ1BicXhhSVlkSm1GUkFrWGh0bDdy?=
 =?utf-8?B?NW83ekNsZ0VXM3MwbzVmOXFleWhWbGcwK3dadW9UU1dsTEV3dXpxNkRaTmI0?=
 =?utf-8?Q?YOfY8bCvEUfUM?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB9982.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MEFTYTNBVEJqTmJVKzBOcUpXdmZkK293SkNzcVdMY3UrNUdmMGduSWFmWDd5?=
 =?utf-8?B?aFp3eVpLNFhINUdGd2Mrc2k5QTA3RW0wdzJiMmdCSkpaWHZtQ2hscjJhdDNU?=
 =?utf-8?B?QnpNWVVsVlFRak1wNHF4VjBMRnJOWjJ6TkNRNUhrOU8vdStBUGF4d3JjWHBk?=
 =?utf-8?B?U1B0Qyt1b3daYUlSZHVuTFZjbnZIT0RiOXJpbk9lMFNXMHU1OStWb28rN2Qz?=
 =?utf-8?B?MjFWVzNxdENXZXZ2bldodlVIOWhaazQwK1dnV29DSjlNaDlOcWF6d1BhL0ds?=
 =?utf-8?B?SlVVQ2xIVmZXNUtDVXVCMmJPM0pUVlFZTnhIY2dBRmVGODZMTkRZWjBYK2RF?=
 =?utf-8?B?WVhYMzh0MkUvYmg5K1BtZHZnWldweFRDL25YbTl2MWpkMk1NTUdCbUw3RFRo?=
 =?utf-8?B?dXBJRkhwR2lHRU1sTHBPRThEVXQ5OEhack1kVzVOOE9zd2RKaDBZR2RXd3Fq?=
 =?utf-8?B?RklsSEtORlI1dGlpeWt0bVZKZUFJMnY0T1pDSVIzUElFRWxubmdZajl6QmZq?=
 =?utf-8?B?cHdsR0pjVFNwYVlDejl2VE9KVnVNbUJpMlJGSmF2R2gxbUxCTWVudjBraTlu?=
 =?utf-8?B?ZjByNDZKRTUwMjFraDZEQklJanBCdEMrN1pkYncvRlRud2l4VFpmZWJsRFNS?=
 =?utf-8?B?N1ptMkxQZGJHNGFmNjhSZFNIS0YzN1ZWZ1VLa0x4QUc5akhFeFpUNVVJNU9k?=
 =?utf-8?B?TER1RVhMQnVSUVRod1F0bnBia1M5dTNKZitVaDdZY0I1ejJSV0dHR0Y5NDFU?=
 =?utf-8?B?YWNUbDNmNUdyeXRHODZMVGhEWlJmYzV1WVowNFAwVHVhTmhseXJIOVd4ejN1?=
 =?utf-8?B?cjdDa21NbnJIZFo2SEZtdHNYUWs1eWlXdkxYSElVQndKSTRVQ244VFB1VEsy?=
 =?utf-8?B?b09UWDRSNFBmNGo2WVZZYjNhK1hOYXJmZ3Y4NjRqaDJuam1CSExHcGVnZmd5?=
 =?utf-8?B?OVc3S3Ezbkc4c1NTZW5yWndjWFJjdHozeHhkcHdSTVFabzYxQWYxMVpabTJX?=
 =?utf-8?B?R2VCTXUwMU5UYkM1b25rY1BDc2VZQnBMeFVXbEJ4UXJIU2oyckRSTVVCR3pl?=
 =?utf-8?B?WkdTeDdDeE1Ma3kybWExcWdiT25MQldYeHArU3l4cGpWS0Fsb25tQVlHY0Mv?=
 =?utf-8?B?NFJUQjRnQXpMU2kxZGpIYzd0TFVwcncva29FMGxkaElYK09XNUdsUEt3UDh2?=
 =?utf-8?B?R21ZVXNiRGhiZ1VYeU9vdGhuenFpTFQ2c05vOFR1ZGpEWGhZYUpLMXhQTzEw?=
 =?utf-8?B?T2NGcENIdGZGOEJLbUQ2SUxtN0tMN3dFYVJpQUc4T1BGVmtIMTlzc0wyaksx?=
 =?utf-8?B?eERsa1NtVXc0T3hCUXBVUThMSGdLOHB5WDNNRGdEa2tvSG51THRqeEVwZ0lH?=
 =?utf-8?B?Qm9mS01uL0IyUW40Z05BM0hiNTNDejV2Mm5FdGFxbVJKelQzRnBrYjFnaUhr?=
 =?utf-8?B?YkUzaEZTWHUzSEFLczRNVm8zTDY0VmJIeHBqZzN1WjFRS0cyUDZiT2R3ZlJt?=
 =?utf-8?B?QjlKY3ZpRzhXVGtRcTRrKzJpWTFqUGFTTXFwSE5raG4yYkFkWWFxTjhlOUVy?=
 =?utf-8?B?TGZUVDlDT3dHUEZzdTZaVnltOE41akg3VWs0WTdsWDJyKytaSHhBbGtzMzEy?=
 =?utf-8?B?VWFRQlRzbVlKZXNabUJPeHNDSkVHOVlySUdtNHJzdmlmVFZpNVEyTTRWL2Nv?=
 =?utf-8?B?dzZnbGdvb2EvWUpocWEydXRaMVROR3FJdk1aTGVrcFN3NTNDNC9ZdWJsemRY?=
 =?utf-8?B?QlNWcVliTXhpSWtwZVJ5SzFQWGRGVUI3NEdNRWc2S3dSVUg4M2NnRHZnU1h1?=
 =?utf-8?B?MjllUVFSTDFGVzRKdmlrc0g2V3RVbTB5eUdZeTJTOHFVbFN1cC9BQy85bHB3?=
 =?utf-8?B?VzFuVGtubTdjbS9saFJnUGlxRE92dzFEVm5Zb0lpWjBSRGkxdm54M2grdFFv?=
 =?utf-8?B?UXkza3ZvWlVrWEJldUcrMG9TdUl4ajI4MDJjY0pIZ0lTSXhwQzErY0hTbHZH?=
 =?utf-8?B?bDFRNmNZZVh6LzRHbUdYOEtaUWYyM0FiYlBpdmhkOS9yV1J3WGxPQVMvdlhJ?=
 =?utf-8?B?MUhVSzhnK2RocUZ5cjVKRllhY01objJ1T1FPRmFmajR0TUNQRzZIenZZc3lG?=
 =?utf-8?B?WTJQSy82Z1lwQmVDNlJXd2hGcmh6UmFDdTE5bFYxZkxTaEhaQzhHMEk2amo4?=
 =?utf-8?B?dFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: toshiba.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB9982.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9da033a3-1171-48fa-691d-08dd23b05cfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2024 00:17:33.7240
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vKEX0QhLfYVu83iBmmSANS47FiADv9bdlu3FsWcn4bPQa720E8NarnWWx+FTlOIetHe8UukYHj74yrseFY2quhU+BnFXwuBOLM6/An7MyCo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5400

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiBUdWVzZGF5LCBEZWNlbWJlciAxNywgMjAy
NCAyOjQ1IFBNDQo+IFRvOiBpc2hpa2F3YSB5dWppKOefs+W3nSDmgqDlj7gg4peL77yy77yk77yj
4pah77yh77yp77y077yj4peL77yl77yh6ZaLKQ0KPiA8eXVqaTIuaXNoaWthd2FAdG9zaGliYS5j
by5qcD47IGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbTsNCj4gbWNoZWhhYkBrZXJu
ZWwub3JnOyByb2JoQGtlcm5lbC5vcmc7IGtyemsrZHRAa2VybmVsLm9yZzsNCj4gY29ub3IrZHRA
a2VybmVsLm9yZzsgc2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNvbTsgaHZlcmt1aWwtY2lzY29A
eHM0YWxsLm5sOw0KPiBpd2FtYXRzdSBub2J1aGlybyjlsqnmnb4g5L+h5rSLIOKXi++8pO+8qe+8
tO+8o+KWoe+8pO+8qe+8tOKXi++8r++8s++8tCkNCj4gPG5vYnVoaXJvMS5pd2FtYXRzdUB0b3No
aWJhLmNvLmpwPg0KPiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnOw0KPiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5v
cmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjEy
IDEvOF0gZHQtYmluZGluZ3M6IG1lZGlhOiBwbGF0Zm9ybTogdmlzY29udGk6IEFkZA0KPiBUb3No
aWJhIFZpc2NvbnRpIE1JUEkgQ1NJLTIgUmVjZWl2ZXINCj4gDQo+IE9uIDE3LzEyLzIwMjQgMDA6
NTcsIHl1amkyLmlzaGlrYXdhQHRvc2hpYmEuY28uanAgd3JvdGU6DQo+ID4+IE9uIDI1LzExLzIw
MjQgMTA6MjEsIFl1amkgSXNoaWthd2Egd3JvdGU6DQo+ID4+PiBBZGRzIHRoZSBEZXZpY2UgVHJl
ZSBiaW5kaW5nIGRvY3VtZW50YXRpb24gdGhhdCBhbGxvd3MgdG8gZGVzY3JpYmUNCj4gPj4+IHRo
ZSBNSVBJIENTSS0yIFJlY2VpdmVyIGZvdW5kIGluIFRvc2hpYmEgVmlzY29udGkgU29Dcy4NCj4g
Pj4+DQo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBZdWppIElzaGlrYXdhIDx5dWppMi5pc2hpa2F3YUB0
b3NoaWJhLmNvLmpwPg0KPiA+Pj4gUmV2aWV3ZWQtYnk6IE5vYnVoaXJvIEl3YW1hdHN1IDxub2J1
aGlybzEuaXdhbWF0c3VAdG9zaGliYS5jby5qcD4NCj4gPj4NCj4gPj4NCj4gPj4gSG93IG5ld2x5
IGFkZGVkIHBhdGNoIGNhbiBoYXZlIGFscmVhZHkgUmIgdGFnPyBXYXMgdGhpcyByZXZpZXcNCj4g
Pj4gcmVhbGx5LCByZWFsbHkgcGVyZm9ybWVkIGludGVybmFsbHkgb3IgeW91IGp1c3Qgc2F0aXNm
eSBzb21lIGludGVybmFsDQo+ID4+IG1hbmFnZXJzIHJlcXVpcmVtZW50cyBhbmQgZmFrZSB0aGUg
c3RhdHM/DQo+ID4+DQo+ID4NCj4gPiBJIGFkZGVkIHRoaXMgUmV2aWV3ZWQtYnkgdGFnIGJlY2F1
c2UgdGhlIHBhdGNoIHdhcyByZXZpZXdlZCBpbnRlcm5hbGx5Lg0KPiANCj4gDQo+IFdoYXQgaXNz
dWVzIHdlcmUgaWRlbnRpZmllZCBieSBpbnRlcm5hbCByZXZpZXcsIGVzcGVjaWFsbHkgaW4gdGhl
IGNvbnRleHQgb2YNCj4gYmluZGluZ3M/DQo+IA0KDQpUaGUgcmV2aWV3IHdhcyBpbnN1ZmZpY2ll
bnQuIFdlIGRpc2N1c3NlZCB0aGUgc3BsaXR0aW5nIG9mIGRyaXZlcnMsIGJ1dCBvdmVybG9va2Vk
IHRoZSBzY2hlbWEuDQpJIHNob3VsZCBoYXZlIGJlZW4gbW9yZSBjYXJlZnVsIG5vdCB0byBhZGQg
YW4gaW5hcHByb3ByaWF0ZSB0YWcuDQpJIGFwb2xvZ2l6ZSBmb3Igbm90IHVuZGVyc3RhbmRpbmcg
dGhlIGF0dGVudGlvbiBhbmQgcmVzcGVjdCB0aGF0IHNob3VsZCBiZSBnaXZlbiB0byB0aGUgUmV2
aWV3ZWQtYnkgdGFnLg0KRnJvbSBub3cgb24sIEkgd2lsbCBhZGQgdGhlIHRhZyB0byByZXZpZXdz
IGRpc2N1c3NlZCBpbiB0aGUgb3BlbiBtYWlsaW5nIGxpc3QuDQoNCj4gPg0KPiA+Pj4gLS0tDQo+
ID4+Pg0KPiA+Pj4gQ2hhbmdlbG9nIHYxMjoNCj4gPj4+IC0gTmV3bHkgYWRkIGJpbmRpbmdzIGZv
ciBDU0kyUlggZHJpdmVyDQo+ID4+Pg0KPiA+Pj4gIC4uLi9tZWRpYS90b3NoaWJhLHZpc2NvbnRp
NS1jc2kycngueWFtbCAgICAgICB8IDEwNA0KPiA+PiArKysrKysrKysrKysrKysrKysNCj4gPj4+
ICAxIGZpbGUgY2hhbmdlZCwgMTA0IGluc2VydGlvbnMoKykNCj4gPj4+ICBjcmVhdGUgbW9kZSAx
MDA2NDQNCj4gPj4+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS90b3No
aWJhLHZpc2NvbnRpNS1jc2kycngueWFtDQo+ID4+PiBsDQo+ID4+Pg0KPiA+Pj4gZGlmZiAtLWdp
dA0KPiA+Pj4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvdG9zaGli
YSx2aXNjb250aTUtY3NpMnJ4LnkNCj4gPj4+IGFtDQo+ID4+PiBsDQo+ID4+PiBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS90b3NoaWJhLHZpc2NvbnRpNS1jc2kycngu
eQ0KPiA+Pj4gYW0NCj4gPj4+IGwNCj4gPj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4+PiBp
bmRleCAwMDAwMDAwMDAwMDAuLjU0ODgwNzJiYzgyYQ0KPiA+Pj4gLS0tIC9kZXYvbnVsbA0KPiA+
Pj4gKysrDQo+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3Rvc2hp
YmEsdmlzY29udGk1LWNzaTINCj4gPj4+ICsrKyByeA0KPiA+Pj4gKysrIC55YW1sDQo+ID4+PiBA
QCAtMCwwICsxLDEwNCBAQA0KPiA+Pj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwt
Mi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKSAlWUFNTA0KPiAxLjINCj4gPj4+ICstLS0NCj4gPj4+
ICskaWQ6DQo+ID4+PiAraHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbWVkaWEvdG9zaGli
YSx2aXNjb250aTUtY3NpMnJ4LnlhbWwjDQo+ID4+PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRy
ZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+ID4+PiArDQo+ID4+PiArdGl0bGU6IFRv
c2hpYmEgVmlzY29udGk1IFNvQyBNSVBJIENTSS0yIHJlY2VpdmVyDQo+ID4+PiArDQo+ID4+PiAr
bWFpbnRhaW5lcnM6DQo+ID4+PiArICAtIE5vYnVoaXJvIEl3YW1hdHN1IDxub2J1aGlybzEuaXdh
bWF0c3VAdG9zaGliYS5jby5qcD4NCj4gPj4+ICsNCj4gPj4+ICtkZXNjcmlwdGlvbjogfC0NCj4g
Pj4NCj4gPj4gRHJvcCB8LQ0KPiA+Pg0KPiA+DQo+ID4gSSdsbCBkcm9wICJ8LSINCj4gPg0KPiA+
Pj4gKyAgVG9zaGliYSBWaXNjb250aTUgU29DIE1JUEkgQ1NJLTIgcmVjZWl2ZXIgZGV2aWNlIHJl
Y2VpdmVzIE1JUEkNCj4gPj4+ICsgQ1NJLTIgdmlkZW8gIHN0cmVhbS4gVXNlIHdpdGggVklJRiBk
ZXZpY2UuIFQuQi5EDQo+ID4+PiArDQo+ID4+PiArcHJvcGVydGllczoNCj4gPj4+ICsgIGNvbXBh
dGlibGU6DQo+ID4+PiArICAgIGNvbnN0OiB0b3NoaWJhLHZpc2NvbnRpNS1jc2kycngNCj4gPj4N
Cj4gPj4gV2h5IHRoaXMgaXMgY2FsbGVkICJSWCI/IENhbiB5b3UgaGF2ZSBhIFRYPyBJIGhhZCBp
bXByZXNzaW9uIHRoYXQgb25lDQo+IGNhbm5vdC4NCj4gPj4NCj4gPg0KPiA+IFZJSUYgaGFzIG9u
bHkgTUlQSSBDU0kyIHJlY2VpdmVyIChDU0kyUlgpLiBUaGVyZSdzIG5vIFRYIGZvciBpdC4NCj4g
DQo+IFNvIHRoaXMgZGV2aWNlIGNhbm5vdCBiZSBhbnl0aGluZyBlbHNlPyBUaGVuIGRyb3Agcngu
DQo+IA0KDQpJJ2xsIGRyb3AgInJ4Ii4gVGhlIG5ldyBjb21wYXRpYmxlIHN0cmluZyB3aWxsIGJl
ICJ0b3NoaWJhLHZpc2NvbnRpNS1jc2kyIi4NCkknbGwgYWxzbyB1cGRhdGUgdGhlIG5hbWUgb2Yg
YmluZGluZ3MgZG9jdW1lbnQgZmlsZS4NCg0KPiA+IFZpc2NvbnRpIGFsc28gaGFzIFZPSUYgKFZp
ZGVvIE91dHB1dCBJbnRlcmZhY2UpIGhhcmR3YXJlIHdoaWNoIGhhcyBNSVBJDQo+IENTSTIgKG5v
dCBEU0kpIHRyYW5zbWl0dGVyIChDU0kyVFgpLg0KPiANCj4gT3IgdGhpcyBjYW4gYmUgc29tZXRo
aW5nIGVsc2U/IENvbmZ1c2luZy4NCj4gDQoNClZPSUYgaGFzIG9ubHkgVFguIFRoZXJlJ3Mgbm8g
UlggZm9yIGl0Lg0KSSBqdXN0IHdhbnRlZCB0byBpbmZvcm0geW91IHRoYXQgdGhlcmUgaXMgYSBu
b2RlIHdpdGggc2ltaWxhciBuYW1lIGFuZCBmdW5jdGlvbi4NClBsZWFzZSBmb3JnZXQgYWJvdXQg
aXQuDQoNCj4gDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KDQpCZXN0IHJlZ2Fy
ZHMsDQpZdWppIElzaGlrYXdhDQo=


