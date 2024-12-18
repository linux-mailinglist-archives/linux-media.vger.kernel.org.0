Return-Path: <linux-media+bounces-23682-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C63C9F5D29
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 04:03:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3A7B1882EF8
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 03:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9497E12FB1B;
	Wed, 18 Dec 2024 03:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="Gny0g3pX"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021074.outbound.protection.outlook.com [40.107.42.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9ED42AA4;
	Wed, 18 Dec 2024 03:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734490978; cv=fail; b=QFdXUFL8kslmHBP2eIwY4jNX6atwDLxIYBmOEr+eJvC+lHmK2jnrX5C1D12iDg2JgizzduDNjrE9YxcDaVXxD0mEcwbwBR7RMrsqK+ezgYz+QGT0YkABJbrmuloUVYkznkr2OlMtRK02wb8FR8URD6uNIknoRafarTS/057/SJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734490978; c=relaxed/simple;
	bh=WUOmoXXZsd2NRW5Ip49DqMlVSV1Xw8lE2OMu57O6mXg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JWhs32xwy5m+B0FfxdiVcksLkZ4Ft8HVKJkmbpRru9X07HJkOmpU+xlbmuoKvV6eHv2bDmu6VENIFz48Ro3h6v5I9KNG7WKTOtCqXoeFLBacaJRri5sTeJA3cRvfaURiDFc1sQDY0GCSOJEx6nSugmQlGalc13LwN5aHbLuoNJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=Gny0g3pX; arc=fail smtp.client-ip=40.107.42.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DGeD6IRCrxZnpLhiEGN5+vaC5zPCVNjBdi4x7dz34NR7R3MwFYXMhqa5n1u3r/jz0ADtAV1QM7xxdxj4yudM2hZWrS9ktIpC8ia8t7IerinOni1VzWNSZBBtL5D4uUtyGyn9gU1wfECqIKH1t/c/Jq/Nyqee53YebVnpnt/J2SQ/WIV7vfvhtSX/SuFEBtVFF4Qkp+nKVcfCsRiNNNXIYFO6gSyY7mn+E3aWEzx1iijYRN+4iCfdV8VRWASfJzuRbjwKxVwk2sYCFJnTXqocxW8JaRab7Wem0lJGD4krOoSFw4+K8cKnFg/bFLNsGcTE8lpv1rgRRoMGIM1/KiFEKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WUOmoXXZsd2NRW5Ip49DqMlVSV1Xw8lE2OMu57O6mXg=;
 b=Q169djKLRfgA3TTxVjJAz+kgCaxJaHhK/YxKpgXbEatGeyt8Fs6BdQz0NcUWg5EnA8k1AoBhdl0isA+euOLTDnoK+xZQxcOc0jgBJG9AKaSMuC1BgWMmdNsO6kKvrEd7Dnrh5S2jodF9a4321ppdzlbFmovCvdosUTn+MSp3HWvchvl2aOYMvpm4or6Z3VV5yjJmoPwAPDkY7Cfko4gckLUH6UM4mh2HzbiZC7y7jTRJbXWx3T8R4l1RlnUyKBuCUbHON6OSdJdIXTEN27+VCx8lw5kCYNvG3bMq3C9eoRKwmjTdtTh/cLv/2a+7Xa3tTW3sx/NSFSFTQ+matLcFVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WUOmoXXZsd2NRW5Ip49DqMlVSV1Xw8lE2OMu57O6mXg=;
 b=Gny0g3pX/KJFBCm+G8G5y6iZl5GXovCENyfZgvLFZaeFdOkichaCSZaNu3Z49fmqmwjfVXDIcEgdcS8pZjvDJsrurCDXwzMriFVlV35RqdVpwM3MSrMbUFH+b0nKx0i4nCUoeK6AI1eXwlYMvQWY1EOhiqAtPD8iEj0XJqGiRRI=
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SL2P216MB2271.KORP216.PROD.OUTLOOK.COM (2603:1096:101:150::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.22; Wed, 18 Dec 2024 03:02:52 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%3]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 03:02:52 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>,
	"bob.beckett@collabora.com" <bob.beckett@collabora.com>,
	"dafna.hirschfeld@collabora.com" <dafna.hirschfeld@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, lafley.kim
	<lafley.kim@chipsnmedia.com>, "b-brnich@ti.com" <b-brnich@ti.com>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, Nas Chung
	<nas.chung@chipsnmedia.com>
Subject: RE: [PATCH v2 2/4] media: chips-media: wave5: Avoid race condition
 for interrupt handling
Thread-Topic: [PATCH v2 2/4] media: chips-media: wave5: Avoid race condition
 for interrupt handling
Thread-Index: AQHbUD9ae4YMo7qFtkSJfjjZCTr8ZLLqeKmAgADZUeA=
Date: Wed, 18 Dec 2024 03:02:52 +0000
Message-ID:
 <SE1P216MB130368329CEA2DF171FF656DED052@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
References: <20241217045125.58-1-jackson.lee@chipsnmedia.com>
	 <20241217045125.58-3-jackson.lee@chipsnmedia.com>
 <a50b3e0f6e1ce7cad421039abeb5574cf74410fe.camel@collabora.com>
In-Reply-To: <a50b3e0f6e1ce7cad421039abeb5574cf74410fe.camel@collabora.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE1P216MB1303:EE_|SL2P216MB2271:EE_
x-ms-office365-filtering-correlation-id: 8a38efb3-ef00-45c1-ece0-08dd1f10765c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?d1ZTWVdYSnVkVDB3aUFxaVRUUE4rQ21kWTlOa2c2SXV0WVRqeWk4ZlNFb2U4?=
 =?utf-8?B?TGptRjVZM1Rmdk9PV2R4bGJjcFRQRVEwVkxVRmdzQmtMMDExbmpEcXpkS3Jq?=
 =?utf-8?B?T0R5Z0MvK0VnQkVSakR2amlVZEJWRDMxd2pjQXduR0xtNlBWbnpVbU04TTEz?=
 =?utf-8?B?N05MZjZIZ0U3cE1lYi9XR3lSL0tJcVdRWXZQZXhURi9keStEWVVBdUdBNjdt?=
 =?utf-8?B?a2M5T1NrcURmVFBqV01TcXlaREo2UG9udkMrcEM0cG5pdXppOGpZTlV2eTNZ?=
 =?utf-8?B?Zlpic1FSMjZkMkU5a2pPdU9RZkZsOEFWUUMxMWsvRVJ6Z1JZWk54QTIyUHZH?=
 =?utf-8?B?a0hhRDZ6RXB4OWowTG1uQ0FzU1pDZ3h6Tkozbm95a1hLekZFcnRPR2pYcE1N?=
 =?utf-8?B?WFBSS1Z3V3N3UTRJb1BBYVUzaFVVQi9qUVhqdnhLL1Y3UzlmTkJRSFo3UTdj?=
 =?utf-8?B?ck84VkdBYkdTc1ZVS09rT3hMY0NFM3BVdFlHcldXSktoVzZpNTExSWlKN1Vv?=
 =?utf-8?B?Ulg3ZU9qUEJUY3BEemxTMytZVm05dkF4UkVUTUZmN3JMQWpFcHRnNUZMYUhT?=
 =?utf-8?B?aGZjQWxBc0swSExya25FV1ltLzNXTlZBR3pqZjVKTm1FbHRma3dnWmJzTmhS?=
 =?utf-8?B?RVRWNXJGQVp0aCtvWE5rUkh1c3Y2a3RERkJpQUUyc1RQNDNSVE1GUXRTd2hM?=
 =?utf-8?B?Q0xmS3lubmw0TEMzcHp3Z1ZmdzF0NTlsc2ZNR1RyMHZRZDJtcFF4UlVpMVY4?=
 =?utf-8?B?OWM5Q3VNWFRDMHBRMHZPYi9xcjRGLzQvSGJHRHU3L2MwSzUramQ0dUF0Q1Vi?=
 =?utf-8?B?RnNoczRWTUR5dTNPdUhyUjRHUG5nTWhWdXdFV1k5TStEOFptWldBdlNnVnlr?=
 =?utf-8?B?MnhKR1VxekZWSWJjbEM2L2xMZk9sRldsazh2bnQvaWd5OWpUQWhPMFR0cita?=
 =?utf-8?B?TVR2bzE4aGdRWU40L05XZWZiK3FsSGNJQkZtdlV2MnM5V29XLzE3SmhKNmJF?=
 =?utf-8?B?KzBZZmhETVhNTU8yOWFPWUNreDJFY1RQZkljUEFBYzkwcC9ITU5kTmxtRXIz?=
 =?utf-8?B?QllGeUpsVUxwQ0J6OFJOQU9GUFFUZGJkWFVaeDU1L1duRWZZeG56anVYYWlR?=
 =?utf-8?B?RzY0Q29BUVFOcU1WTUd4WVNGMHhoajYwbDlla2FrUkdVVlB1ZlNnZUwvUUxT?=
 =?utf-8?B?VEtVODFJOTFkZ3V3Qkl1QnZKVnVneWFzK3VYS3lCeldOQ2FTbDM0cUhPYSsy?=
 =?utf-8?B?U1hMRmM0VDBYRmo4b1dqT3labVYvSVZMSXBmbHNPeVBhYmc1eHJyREx5V1c5?=
 =?utf-8?B?UXJoUEQ4MDF4cmN5Nk1SZjhxMzg1Witxa2dnYWtZQU1LOUlnajF5UGFsNlRP?=
 =?utf-8?B?WUg0TVI4M0tGTjg0clpjNXBSWEFQVmpudzNmZnVKVXl3QkZBM0JHRlhCWWRQ?=
 =?utf-8?B?WWZsczFUdHNab1VpRVRkM0xBcm1EUng2RE1ScW14T08vdXN5YWdZZndOM0pO?=
 =?utf-8?B?UG5yRll1aTdiNHJRc0FyRnU3VVMzQ2ovUVJMbGg1ekNvZSt0MXRUNGJKY0ZP?=
 =?utf-8?B?Y0ROdmZjODRNR2FkaUdHTGlqUjI2SEpZb1VXUEJnd3JFZ3VCbDRkM3E4YnpC?=
 =?utf-8?B?ODFNQjZkcDBTcXpjQkIyK1dkd0tvdHdNbWFabGEwaTJ6OFhEN2hzU1ZqZCtT?=
 =?utf-8?B?UzZBQTF4VUp2Z1J2dnFrcnFJbjhDSVB3WmRiTkVackdyZ25nTEgyVVp2aGlG?=
 =?utf-8?B?Ris4TUZOUFkxSCtzTVVtU1JTYk1SdGp3YklIL0R0MysyazJkVFVidFB5ZDVX?=
 =?utf-8?B?VXZZby85bUJyLzZKQ1RiOFdZWHR1aXk1clNIczFLejdJdXlPWVFaaTRLa1g4?=
 =?utf-8?B?cXJwcERiN00zcHpFNTFpeVJCeUpiV3VtN0VnYk0zWk5IQTRNS0NqQjJMNWpx?=
 =?utf-8?Q?a80Xv3kavoAyn9644trmqzUFTq9W8KJF?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ejgyMWQ5L1RGYWV5cHQveWp6cDJTcjBhQ2pjQTM2dm5PamszSTJCdk9BNFlB?=
 =?utf-8?B?ZHlzdmpValFBcTJTRHlFS2dMbldORVpha3JLd0tRZHJHeUtldWxWTkJRbDZ3?=
 =?utf-8?B?WTJNMGU4enJER1AxWDhTOVFDUkcvaW9jNVFFb250dlBWTzBtejBPS0lDTW9X?=
 =?utf-8?B?MVcvL0dUSU4yS3dSMlBZL2lBdlVsT0YwR2d2WjJjSGhtUFdSNjcweTZRSmta?=
 =?utf-8?B?bXpTaGxVcWloZDRIRFNvNnBEbHFaUC94YXAvZGcyWURSZE1KenNRUlJLYlcz?=
 =?utf-8?B?VU9NY1I3L2dxYlAwNmdqd1hGZGplc053dXhTNitLc1dBYUhkZVpGanE4N2Vm?=
 =?utf-8?B?SUQ1L3dxMUVORi9YbWMzOXc2NHhCSnE5b2RuOUZ3Wk5yc3JuY0Z1ckZUeFc0?=
 =?utf-8?B?YmlSQzh3WUVqTXN4T29NWVBSTlRsL0lFNU91bCtQVXdmZ3E5cDRWcFYzKzFn?=
 =?utf-8?B?d2s2Vy9XLzdEMHZsNGUyZlRpLy9OWFNOL0t2L3BDcEtwY010dlgvbGlMQXlv?=
 =?utf-8?B?Yi92RERSZVJPZTNGMWd4eExQZ0YwSVRQZU1lcjhpRkxGL1U2Mm1HTy8rajJP?=
 =?utf-8?B?U2lSZ3FRNGQxbXcranFWQWZ4NHRqWHlPSFRPR1Y1T1VlUytKeG5odmlrTE9T?=
 =?utf-8?B?WnplblZvWkZWU0FkQ2RSZkcySTFpc05zMEx6ZmNjVHdXY25pTFh4U0hFVkRW?=
 =?utf-8?B?eGNESStwNzRjQkhtUzlxZXlickZQRGpScVkzaEQvMnRGV3ozM01SK1N6Mkt1?=
 =?utf-8?B?SkpLRHNuZ3JHVzBOZm1ZOGZuSHppR1NIM1VJQlpBcnVqc1I3dEQ4Vk9BSUxs?=
 =?utf-8?B?eE5UeGNIN05ISm5ONXZiNlNkVTRHSGh4bjk2OHY2RVNaRjRJUVJoUjdDQzM5?=
 =?utf-8?B?NWZVT2FqNlVhMHFOSHBKSk9pQWhxZ1ByYnY4bHpmUTcreU9XNlduWC8rd1pq?=
 =?utf-8?B?TUNIYTRnU0o3blRKTVVqQWhtUzMvNEtlRmxmSVNwWEJkM0drVk5RS1U1bFE1?=
 =?utf-8?B?YVB0eU1LcHcvUUVHdG83ZnFEbVJYUStNSGc5SlZheHVDMzQvVTRjZUU5a0JV?=
 =?utf-8?B?SUhadzB5YlM3MGp6R25hK1VyZWxpQnpNMGZnUHhhMEVGQzFEMEMrT240VGpu?=
 =?utf-8?B?Y1JacXpIaXZocGhhOTdxTFFKdThPQkh1dDZiWkFhbFFPdU1NOExIcHU4N2E4?=
 =?utf-8?B?LzVLcVJRK0RlRDB5b01oUDNZdkxNZ3V5bXZhS0tVb2g1c1prS3M2QU1SMGlV?=
 =?utf-8?B?UEtMWjViYVhUd2I0bWFwemxRNW9iLzBTNFFYQmlLOG9SQmN5WXppK2ZjZ3Rw?=
 =?utf-8?B?cnNlVHNCR0lkN25wNmZpcUZwMEw2NDhWdGVVSkM1UmZyL1R6bHdyckdMY1VO?=
 =?utf-8?B?OUdnMTBQYWxSSjRIalQ5Z21NUTBGQkFlbjgzUzd5UGdQaEJDVTJWUTZ0WjFW?=
 =?utf-8?B?UnZkNnU3MUwyYk1mcGFFM3NQTnFodmxhdnBISk1JbncyRWRHSnNHSno4L09k?=
 =?utf-8?B?cnVDR3kxcnRMN2NUTVpEc21ZTnBrZVM0VDdUSzUvZEYrM0FBRk5JWDVFM1dw?=
 =?utf-8?B?Ulh2RkNZbkZjbDhTU29Td1BtU2cwNVlGTENVS0Juc2YxL2hsN29IekJsVHhE?=
 =?utf-8?B?K2lScUZ1cFM2SkErMkRIUzdnS211MW92SHovWWx1dUZtTnhtUFpUb3hQa0NK?=
 =?utf-8?B?QVJtb1NlMjZUZTlTZUxpSjZPK3BiUWdOR2FmcE16c3RHSk8rbDZFVFMzWWZM?=
 =?utf-8?B?REltcmNFaWgyTUpidGpxOUNXUm1jRmpjTkNXYlNOdDNGTVhrOHg3MEprWXRL?=
 =?utf-8?B?S1FCTUp2THpDcFNyaG12aGNEbEFXVnBGdXJpM2FROTg5UkVYN0xTUmV0aGRV?=
 =?utf-8?B?QndLTDlzWUc0NzlZY1Zmc3FVODFlcEFuaWxKVU1hdGRyMkVidWhFM3N0SWE4?=
 =?utf-8?B?K2lIcFk0VVRwZXh0NGxnaGhXSFllMlBVdGl0aGQrSHlNazFuYThNM1pBcEpt?=
 =?utf-8?B?Ly9MbTBiaTVld3VHOWtYVC9TaTdYSjl4akwxMENJZDZGajN6bU5XRXdOVWhC?=
 =?utf-8?B?eEZRUThvL1VBeE5GRUJDUHorUnljUWN3WGxVOE9tNDdoTUdvQWYxVFQybFJ4?=
 =?utf-8?Q?DlnvtbEoDGzALB3yOzApKR9/w?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a38efb3-ef00-45c1-ece0-08dd1f10765c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2024 03:02:52.2072
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jun0ufy4F1Gc7bXy5eH3h8P/ZMRZH67t12LC3eDdrQm+dhvKiFnoOtUXHUpBVDin5KoWerxNZ9HFgoITI+f8E3VNwIm6/ee3HNOLv7UA/8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB2271

SGkgTmljb2xhcw0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTmlj
b2xhcyBEdWZyZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPg0KPiBTZW50OiBU
dWVzZGF5LCBEZWNlbWJlciAxNywgMjAyNCAxMTowNCBQTQ0KPiBUbzogamFja3Nvbi5sZWUgPGph
Y2tzb24ubGVlQGNoaXBzbm1lZGlhLmNvbT47IG1jaGVoYWJAa2VybmVsLm9yZzsNCj4gaHZlcmt1
aWwtY2lzY29AeHM0YWxsLm5sOyBzZWJhc3RpYW4uZnJpY2tlQGNvbGxhYm9yYS5jb207DQo+IGJv
Yi5iZWNrZXR0QGNvbGxhYm9yYS5jb207IGRhZm5hLmhpcnNjaGZlbGRAY29sbGFib3JhLmNvbQ0K
PiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnOyBsYWZsZXkua2ltDQo+IDxsYWZsZXkua2ltQGNoaXBzbm1lZGlhLmNvbT47IGItYnJu
aWNoQHRpLmNvbTsgaHZlcmt1aWxAeHM0YWxsLm5sOyBOYXMNCj4gQ2h1bmcgPG5hcy5jaHVuZ0Bj
aGlwc25tZWRpYS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMi80XSBtZWRpYTogY2hp
cHMtbWVkaWE6IHdhdmU1OiBBdm9pZCByYWNlDQo+IGNvbmRpdGlvbiBmb3IgaW50ZXJydXB0IGhh
bmRsaW5nDQo+IA0KPiBMZSBtYXJkaSAxNyBkw6ljZW1icmUgMjAyNCDDoCAxMzo1MSArMDkwMCwg
SmFja3Nvbi5sZWUgYSDDqWNyaXTCoDoNCj4gPiBJbiBjYXNlIG9mIG11bHRpIGluc3RhbmNlLCBp
bnRlcnJ1cHRzIGNhbiBvY2N1ciBmb3Igb3RoZXIgaW5zdGFuY2VzIGFzDQo+ID4gc29vbiBhcyBp
bnRlcnJ1cHQgaXMgY2xlYXJlZC4gSWYgZHJpdmVyIHJlYWRzIHRoZSBpbnN0YW5jZV9pbmZvIGFm
dGVyDQo+ID4gY2xlYXJpbmcgdGhlIGludGVycnVwdCwgaXQgaXMgbm90IGd1YXJhbnRlZWQgdGhh
dCB0aGUgaW5zdGFuY2VfaW5mbyBpcw0KPiA+IHZhbGlkIGZvciB0aGUgY3VycmVudCBpbnRlcnJ1
cHQuDQo+ID4NCj4gPiBSZWFkIHRoZSBpbnN0YW5jZV9pbmZvIHJlZ2lzdGVyIGZvciBlYWNoIGlu
dGVycnVwdCBiZWZvcmUgY2xlYXJpbmcgdGhlDQo+ID4gaW50ZXJydXB0Lg0KPiA+DQo+ID4gU2ln
bmVkLW9mZi1ieTogSmFja3Nvbi5sZWUgPGphY2tzb24ubGVlQGNoaXBzbm1lZGlhLmNvbT4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBOYXMgQ2h1bmcgPG5hcy5jaHVuZ0BjaGlwc25tZWRpYS5jb20+DQo+
ID4gUmV2aWV3ZWQtYnk6IE5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAY29sbGFi
b3JhLmNvbT4NCj4gDQo+IFNhbWUsIHdoYXQgaXMgdGhlIEZpeGVzIHRhZyA/DQoNCg0KRml4ZXM6
IGVkNzI3NmVkMmZkMCAoIm1lZGlhOiBjaGlwcy1tZWRpYTogd2F2ZTU6IEFkZCBocnRpbWVyIGJh
c2VkIHBvbGxpbmcgc3VwcG9ydCIpDQoNCnRoYW5rcw0KDQoNCj4gDQo+ID4gLS0tDQo+ID4gIGRy
aXZlcnMvbWVkaWEvcGxhdGZvcm0vY2hpcHMtbWVkaWEvd2F2ZTUvd2F2ZTUtdnB1LmMgfCA0ICsr
LS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkN
Cj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2NoaXBzLW1lZGlh
L3dhdmU1L3dhdmU1LXZwdS5jDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2NoaXBzLW1l
ZGlhL3dhdmU1L3dhdmU1LXZwdS5jDQo+ID4gaW5kZXggNmIyOTRhMmQ2NzE3Li42M2E2MDdkMTA0
MzMgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9jaGlwcy1tZWRpYS93
YXZlNS93YXZlNS12cHUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vY2hpcHMt
bWVkaWEvd2F2ZTUvd2F2ZTUtdnB1LmMNCj4gPiBAQCAtNTUsMTIgKzU1LDEyIEBAIHN0YXRpYyB2
b2lkIHdhdmU1X3ZwdV9oYW5kbGVfaXJxKHZvaWQgKmRldl9pZCkNCj4gPiAgCXN0cnVjdCB2cHVf
ZGV2aWNlICpkZXYgPSBkZXZfaWQ7DQo+ID4NCj4gPiAgCWlycV9yZWFzb24gPSB3YXZlNV92ZGlf
cmVhZF9yZWdpc3RlcihkZXYsIFc1X1ZQVV9WSU5UX1JFQVNPTik7DQo+ID4gKwlzZXFfZG9uZSA9
IHdhdmU1X3ZkaV9yZWFkX3JlZ2lzdGVyKGRldiwNCj4gVzVfUkVUX1NFUV9ET05FX0lOU1RBTkNF
X0lORk8pOw0KPiA+ICsJY21kX2RvbmUgPSB3YXZlNV92ZGlfcmVhZF9yZWdpc3RlcihkZXYsIFc1
X1JFVF9RVUVVRV9DTURfRE9ORV9JTlNUKTsNCj4gPiAgCXdhdmU1X3ZkaV93cml0ZV9yZWdpc3Rl
cihkZXYsIFc1X1ZQVV9WSU5UX1JFQVNPTl9DTFIsIGlycV9yZWFzb24pOw0KPiA+ICAJd2F2ZTVf
dmRpX3dyaXRlX3JlZ2lzdGVyKGRldiwgVzVfVlBVX1ZJTlRfQ0xFQVIsIDB4MSk7DQo+ID4NCj4g
PiAgCWxpc3RfZm9yX2VhY2hfZW50cnkoaW5zdCwgJmRldi0+aW5zdGFuY2VzLCBsaXN0KSB7DQo+
ID4gLQkJc2VxX2RvbmUgPSB3YXZlNV92ZGlfcmVhZF9yZWdpc3RlcihkZXYsDQo+IFc1X1JFVF9T
RVFfRE9ORV9JTlNUQU5DRV9JTkZPKTsNCj4gPiAtCQljbWRfZG9uZSA9IHdhdmU1X3ZkaV9yZWFk
X3JlZ2lzdGVyKGRldiwNCj4gVzVfUkVUX1FVRVVFX0NNRF9ET05FX0lOU1QpOw0KPiA+DQo+ID4g
IAkJaWYgKGlycV9yZWFzb24gJiBCSVQoSU5UX1dBVkU1X0lOSVRfU0VRKSB8fA0KPiA+ICAJCSAg
ICBpcnFfcmVhc29uICYgQklUKElOVF9XQVZFNV9FTkNfU0VUX1BBUkFNKSkgew0KDQo=

