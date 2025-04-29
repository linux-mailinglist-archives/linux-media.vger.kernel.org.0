Return-Path: <linux-media+bounces-31253-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC3FAA0227
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 08:00:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B333841B43
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 05:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B7CB270ECE;
	Tue, 29 Apr 2025 05:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="AEaW+Y01"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021142.outbound.protection.outlook.com [40.107.42.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F7D12C544;
	Tue, 29 Apr 2025 05:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.142
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745906394; cv=fail; b=i4liig/MhfxZ1QwvLaYI+wk6kQVrqoFIWY3GDp0VlF4H9tdEkshhBk7rrJ5kYLWpiWx74C9WqNkDj0810n2Wji1L5n1Y8X/UHCyJuyMd5K2ItDIFUHzh1sn0vsXwcyF83Ej1QJwnQGrgN/NQ4poInqgw1Co2uEgd1JQrWyVlof8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745906394; c=relaxed/simple;
	bh=sYm046HAkM3Zxle2hJNELN5S7MZcnlc9dH9xxfGjbMk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JUXm4JICfV4AqMGhs7+KZcNjWMfe/Exp+PYrVD2eDcJT051UP+rFi7RL/Kyp4zTuNDwx5xdDlbvSGoPh380egJdIrc3qiSIiLn/w3bGjE7ID06W0/WVPvHbrDr1J+cF2/U+r29DOKwS8Yb/uIylZXHauZAm8wmlb0o7N0Pq2VTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=AEaW+Y01; arc=fail smtp.client-ip=40.107.42.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v9F4SFui2JWRWOSDWBciGg9bhwi7d/gQR0kuaLh1ix62QZkWQ2ZjyxDx7o/9EhGImP5QkXjErSmMRY9AlkZr4guTIpcYoXKVjGcFKDLcVD9ig4bFfALd731K2RPAQ3qR4mYw1HHD7lzIvh5jHtsnzempXgDvSCOLrn2vj3WDSicfr/TTPRcgy+dGewOuAVYQk58wVKQG1v/g9abkwp4HoDkKJ4PC9egxYDed3o3MsLoGNzAHA2OQdLPS8jcDccQymkLKolvMLNze2KxDN4/o5SvaNHa1iSR9NqsswLiRc7KZ3AUOxcAXRMxfDXRBNnDeTO8X0dXPwnyQbP08AhyPYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sYm046HAkM3Zxle2hJNELN5S7MZcnlc9dH9xxfGjbMk=;
 b=u0CvzforZcQNe0ywRzRbvXNtXU0q0XjcBhY42u4UIkNTpzqw6dpbQw8PHf2BS6uN3wh0o6LNxeKTpCUZhcl1mY2aG3+ZcYCULAVy6WVzaSxugGYroMZxptZCHX0nMP75cqCQGwkrAwJvflpgl4PcNrio17V3IQKkOIDa3mi/5n0LEDDMsH3+drXhpp3iXJkw3bceOrVXunIiG0YdG9/ewWoAfPImdRJ4OGkpV+KhU6wb6lo+LXmJlYv69HGJQVnYNDA3Ix90WcIEkt+TwjVMFCsG8aIM9vGAMngyYPhOFpq9OZBIw3TpMkTelSqRVDrnDG1+vgVXEbrbs6b+HwgVWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sYm046HAkM3Zxle2hJNELN5S7MZcnlc9dH9xxfGjbMk=;
 b=AEaW+Y018mhB9JIQfQXBPR565OEVl9UmufKrA+mtRCHEs+VggN0rkgh6f26yR54HAWjbuSrvixkRKeryTyM/Rr9Tjl2mapqpBTWuQxXQq+UhK4Gw8b6fbqGsHd31U5UdPF2IybJnEtjJqLzQV9s1UtJkrXk7YtTRbOUh8y0B/iI=
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 PU4P216MB1421.KORP216.PROD.OUTLOOK.COM (2603:1096:301:cc::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.31; Tue, 29 Apr 2025 05:59:48 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%4]) with mapi id 15.20.8678.033; Tue, 29 Apr 2025
 05:59:48 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"bob.beckett@collabora.com" <bob.beckett@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, lafley.kim
	<lafley.kim@chipsnmedia.com>, "b-brnich@ti.com" <b-brnich@ti.com>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, Nas Chung
	<nas.chung@chipsnmedia.com>
Subject: RE: [RESEND PATCH v1 0/7] Performance improvement of decoder
Thread-Topic: [RESEND PATCH v1 0/7] Performance improvement of decoder
Thread-Index: AQHbqcpCFfWvMwZkREeF+06Z+PoGIbOesiwAgAO7f6CAAMEOAIAXEJJg
Date: Tue, 29 Apr 2025 05:59:48 +0000
Message-ID:
 <SE1P216MB13033133B562E91A23CE6DBAED802@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
References: <20250410034002.88-1-jackson.lee@chipsnmedia.com>
	 <b11f2cd9706c409775a44db06dd8399193be3758.camel@collabora.com>
	 <SE1P216MB130320F62126A2F02BDB7FB3EDB32@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
 <296144dec19f3aee958dcdae7700e7a7ed38b8ff.camel@collabora.com>
In-Reply-To: <296144dec19f3aee958dcdae7700e7a7ed38b8ff.camel@collabora.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE1P216MB1303:EE_|PU4P216MB1421:EE_
x-ms-office365-filtering-correlation-id: 03e46878-5801-4c5d-6f41-08dd86e30c9f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?THVyakdpUFUxMmVYWDUyQnZPRlpTR0d4R216d2tadEtYTVJnUW8vR2t0eHVL?=
 =?utf-8?B?T0VwaURORkFGWUpDRmU3U3l1L2N6V3orWnZTZmFjcHduWWM5RUlwa1lUTStY?=
 =?utf-8?B?N2NiRFB0VXlsYmU4VVU3czQ1c3lFL1N4K25uSXgwaEdmSHJGYVRJSWtrcGlO?=
 =?utf-8?B?WDVUbjNDamRyb055Wk1ETWdCbW9JYVJhRlVMbWZlK0VjTGRJVUdkeFR4dXNL?=
 =?utf-8?B?VUNuTTBFUW9nYjEwMjBDNGpOUUlNa29oNWd2Rnl4NUtvcHpDdTUzWFhObjVh?=
 =?utf-8?B?OWxRMkhRZzFDUGhQQ1NlK1ZPck9ad3FLM1dmUFFKbVhFenhhR1hlNkRZMUNW?=
 =?utf-8?B?aHhaRFc4SDVCKzlHZzFOSTRIalJITC9zcmRjY1VRZG1FcmRnb012dzdncVNY?=
 =?utf-8?B?Wk5BZzZ2VnVDbHJGMFA4M1hzMk8yRGp4QTdxc3E0SS9nNUIzR2Nodmgva2tF?=
 =?utf-8?B?dlhhVG4yVW5WaDk5MEtzdW9Wellwc3NTR3lZeE14VTdxRXRPeVRJOFFpNlN6?=
 =?utf-8?B?U015cTBYYzZ0ajVnZVI2eEpzN2ZDbW5UMk5kNDVnNy9oUWlLNkJ4U2pwWDg4?=
 =?utf-8?B?bHZvbmRjMms1d0wxZUs1a1ZoUWFqT2JOTVNYRUZIVUFPeHd3RjdyenFLWDZY?=
 =?utf-8?B?SnlJb3BhNzgxVVNuNG9NQk5uMHNHL0tWbkZGaE5sSmFwMGk3ZndtWUR2bGkw?=
 =?utf-8?B?bUdLS3hIVlcyU0o2M29yZzZtWCt3VnZOR1ZGUGpPZUl4dXdvRFJHejNiZDVV?=
 =?utf-8?B?RUZKK3ZJbUZVNnhrcFh5WitsVmJMcnU0ZkJ6SERvTkgrNGVsN0VDY0sxV2lh?=
 =?utf-8?B?MmpUMDVTRnVxYUhZeG5QM2U5NXRZdXBNNFFJVGROTG5aNnFDTnE0WmJIOCs3?=
 =?utf-8?B?S2pLbHdVTUxWTDEvS2c4cVU4NWIzSzBjbEdCMTZMcFlXSDEwMElydGJaTUR5?=
 =?utf-8?B?b0R6Y212cXpHTWxKa2o5VGlKbUNjSituTVpaY2plUTVmOXk4b1RUSTZrWGc1?=
 =?utf-8?B?OW1pWmZDUEpadkVzekI5dnFBQlZ4SzJjY3Q1NTNEQ3E2alQvam9oeWtPazVl?=
 =?utf-8?B?cTBhVlNtVnJPaEVXRXp2T3hxYk5sNEJvN2gzZzc0RnpaaENpVUZuY2pmemo1?=
 =?utf-8?B?Z0tiUElRUENOSG9rREpkZUZOd0c3VVRiS1RRUVJYSzFsRDJLVzBvaTVFcmxl?=
 =?utf-8?B?U0Jlcm90QTE3VjJGTDczNXBxMy9FcmVTSzdVWUgvRDJsTmh3eVBPdHhMOGVO?=
 =?utf-8?B?ckxacmZuV3ZET1dqL1hrdGI5Qm96Y0paQXZmclVWbGN4YnA5UzdGbUlMZmZt?=
 =?utf-8?B?eW9Xak5ub1ZqNWpSQ2hqN1lYMGlzQ2VPZ3owNHdIVVZnY3pPbkY1bzJIL29r?=
 =?utf-8?B?VHhMK3hCaWU3U2tBeTQwQ21oTXNTVk1IdVB4d1VtUWdmNVN0MTg1SFFyd0NH?=
 =?utf-8?B?MHF3UkhIaWtmaFRuSjZYWGpUd2FUVGVLYlQwazVxemw3QnRDeDVySHNXUnJF?=
 =?utf-8?B?MTF6VE1KNjhra1ZWcUNnVjd6WExGVjhnb1FHSDExeGJZeVNRYzJVU04wOG1j?=
 =?utf-8?B?MERIUDdYemRpdWVZL3NLQ01WV2xCVFkveTFLV1JTV0RYZ2c5amVmdW4wV2FM?=
 =?utf-8?B?ZWpJT1JnZHNHdk9HM291Y1hMTGZPbkFrV010Tit0K2UwT3o5QUtnTnBrNnFq?=
 =?utf-8?B?UmNVQ2wwYi93eTVyZjdzRFdmYVErWjZJcXhIejUwTmhFMkpHcTJ4WnVZSWxS?=
 =?utf-8?B?eWRwTTVKc21LTy9ma3BlSCsyZTdaV3I5TnlxNWl1M1dZSEJMS3lGNUZ3cUtw?=
 =?utf-8?B?TEtLTDZFc1R0SW9haVdIWVAyalhzeW9lSWREVUhucndQVHVXOUNOdklRVExn?=
 =?utf-8?B?SHA4dWIvNUJ1TDc5NUExWHM2cjdDSVBKeWU4Tkt2ZVkrajAyc2dVQVN6VVZC?=
 =?utf-8?B?NVUxVUQ1c014clZhR0N2OG9DVjR1cGVMYUJ3VURkOWVHQzY0a1B0WFArb3ZZ?=
 =?utf-8?B?dk5aeWwrMWp3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a1c4MTFYVEs3MUlGZXhSc2tEYXpyNW9tb3ltTFdJVE5xVTdvS1hodnFDTEJq?=
 =?utf-8?B?WHA0UG1tbytzSzRBdnlIWWpVTjJZQktzSURndU1ZWnlIaFBKZzdJZkhxYWVt?=
 =?utf-8?B?YkRCRjR0UWdEK05CdHg3bXpWWWlITzdUMUowZ3VDV2F1UXBKQzlmemtFd1l2?=
 =?utf-8?B?SG9LWE9MSENDQUErRFlZMGszc1I1Szc3NFBmdm9ZRjZWZTVVZTJMZ3BCckVL?=
 =?utf-8?B?U0c1ZlF4SUd3aVdVNTI5VW1Wby9FZmhhT3BtN1FZYkZaOVZuemMzVjI4NjRp?=
 =?utf-8?B?NXg5S0pEZWVQWHNzYndqZVpXWW1jWGxGejhMbXF1ZGdBdzBSa1RFekwrdWJv?=
 =?utf-8?B?eElxV2hYQ2R2MHBtRU5uMHpjbk1XVFh4WFFackFITlBOQ0U5QVF1RWNEbVNq?=
 =?utf-8?B?bytSdlpRMHNLcEIvSEdUZ2pqaStlbDdab2xGMXZQbTZQbzlzNE8wUWJTUVZG?=
 =?utf-8?B?QXNMY3ZTWW9JaWRwN2E4Z29SWVRGZDBKZCtxeEYxUjE0Mys4OGx2Yy9iTHdG?=
 =?utf-8?B?VW9mK2UrRnlaZTZoZ01yb3U3aEZtNUt3MlZHVmJaSVFVL2Z1M2VzMUhwMFlx?=
 =?utf-8?B?VGpyS3RNdXBENmRCL3BMdit4aXFlcWhoMmJzekFqZ0NHWlpSOFdjR2lNWDRT?=
 =?utf-8?B?WGxiQVhhRi81MVpRUlF0K2MyOVlKWk82SmQvYWE2bkNCL3pSZGw2MkNySjgr?=
 =?utf-8?B?N2FyTzNzYmJkb1c5L01DQ3NyRUUrOFdVNGx2Wk5MdCtUR0hUSS9pMkZPQ0xK?=
 =?utf-8?B?bmk4cmp2TmFhVmxUZUF6U3VCUnlEMk5UNmdaZWJSbGZYQTc3ZkxkVXpqSldy?=
 =?utf-8?B?U1ArNUhNWEMzQXZteWN2RFhOUlVlTkV6djgxbXp2VW0wUE1odnhBZXFST1Bz?=
 =?utf-8?B?eHhBRExGaWZBeWdpdUxFaXkvUXZ3Z2tMUThLcHozQUZIVGNQbkwyQ3QrWGxU?=
 =?utf-8?B?UHY3dngrTkJYQzE2KzNYWnlsa1M5MzZiTlVFRGZRM3A4M210NG9sZzdEZ0d6?=
 =?utf-8?B?L016bDRQMHFjakp4a1Aremx1c3RhN1JYem5ESklFdTBqOEhiRjN3NnYxUnZu?=
 =?utf-8?B?b2t5aWhvWTBLVXUyK0ZZdWFibzFkTkpuZ05pc3pZYkt3MGdlaWRlbSthNTBJ?=
 =?utf-8?B?MEN0TllEMUxjOU9GN0VQZjh5aG9LWDljV1hTaEVJUEtFT210MkxvWUo1UnJV?=
 =?utf-8?B?MjlFQnJUODV5SWVKalpUSW9KdUZHZFlhQ29MR3ZickViSUsrVTRBeHpsK2RI?=
 =?utf-8?B?djUvNHYxZXhNdDFOYXlKZkYrOGM2NkROdUFyNTNhZUQvME9qbGN1eFhhWnpO?=
 =?utf-8?B?YmdBdWM1d2VjOGhoeXM4NEh4K2NoRDVTRFk3TEJFVlBScjZ5QUR2b0FGcVpn?=
 =?utf-8?B?Nk1ody84RW9sc0F0bGRYQXRmQk9vWjNXalVQeEtSelpMczFJUXh3bzNsaGxj?=
 =?utf-8?B?dDcxczhrWnZkbzhMMGNCb0s2R2luZTFPbWdCVWkxZVRwK2J0eVVSM1h5dDRk?=
 =?utf-8?B?ejZmTWFlcjhXYnhrYW9raTZLZCs4Q0NIWTVUaTN3clpRd0UwYmU4TU1NU1da?=
 =?utf-8?B?STQyR2l3SWdXYzVrSDJ5WVhiTzFYRXlBeUpFc3JObjFaaWFXTmtSYkJFaGhG?=
 =?utf-8?B?a2dBaS82NkxDUHZEWnYwUlo3QWFtTXdhekZUc1Z2T3hVWGJVcjJQSkZOaWYx?=
 =?utf-8?B?VURtcitDb2tHZGRiSTNkQ2Z1clBrQzNadXBpcG1VbzNXTzV4WXVQUWNwdUtm?=
 =?utf-8?B?UTZucVA1VGZrOC96dEtzcWFMWnU0RDRWWW9UTmFMM0pRL3kwUmlIQm1MQUNq?=
 =?utf-8?B?akFlQnNVWTJhU1RONUpWQXBsN0FtYWtqd3ZLMG1TbG9Cd0haV21keG56WThh?=
 =?utf-8?B?Qm5IemV0cmV5dStuYXFZUnpQTHUzUFJFM2MvbllNUFdTMFE1cHRRSkpzRXg0?=
 =?utf-8?B?TVpMc0VHWUt1UndYdHVxUm5VdzNVV1R2b0pVeXAvOGJ6TERrOWZXazAwQkZK?=
 =?utf-8?B?Znp0OFhnUFhWcFZ5NFFDT3ZxVUtoQ1JMZzY3elBvT1hmQ015M3poemkrZDFE?=
 =?utf-8?B?dXk1T2pQWTRaaXRKRGE5eW9sckJXUStBeHplcE1NVXdORVBuWUdNR1lLSE01?=
 =?utf-8?B?YUdvUlAyOFpRMGxQVUtLcmhXN1pxUjRaSjNrMGpzQTA0bTVoOHJ0anlsT1ls?=
 =?utf-8?B?MEE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 03e46878-5801-4c5d-6f41-08dd86e30c9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2025 05:59:48.3490
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PasMnr8Prb9FMBjyGnpVa799YzyrqcwQwCPtV/eT/jZeG3teoF7eWsoP6X3XCKvB/LbGJceWFnzJnzU/irOU54dVHxIQAaPYmnLajdhKLO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1421

SGkgTmljb2xhcw0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTmlj
b2xhcyBEdWZyZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPg0KPiBTZW50OiBN
b25kYXksIEFwcmlsIDE0LCAyMDI1IDEwOjI5IFBNDQo+IFRvOiBqYWNrc29uLmxlZSA8amFja3Nv
bi5sZWVAY2hpcHNubWVkaWEuY29tPjsgbWNoZWhhYkBrZXJuZWwub3JnOw0KPiBodmVya3VpbC1j
aXNjb0B4czRhbGwubmw7IGJvYi5iZWNrZXR0QGNvbGxhYm9yYS5jb20NCj4gQ2M6IGxpbnV4LW1l
ZGlhQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGFmbGV5
LmtpbQ0KPiA8bGFmbGV5LmtpbUBjaGlwc25tZWRpYS5jb20+OyBiLWJybmljaEB0aS5jb207IGh2
ZXJrdWlsQHhzNGFsbC5ubDsgTmFzDQo+IENodW5nIDxuYXMuY2h1bmdAY2hpcHNubWVkaWEuY29t
Pg0KPiBTdWJqZWN0OiBSZTogW1JFU0VORCBQQVRDSCB2MSAwLzddIFBlcmZvcm1hbmNlIGltcHJv
dmVtZW50IG9mIGRlY29kZXINCj4gDQo+IEphY2tzb24sDQo+IA0KPiBMZSBsdW5kaSAxNCBhdnJp
bCAyMDI1IMOgIDAyOjA0ICswMDAwLCBqYWNrc29uLmxlZSBhIMOpY3JpdMKgOg0KPiA+ID4gPiBT
ZXF1ZW5jZSBDaGFuZ2UgdGVzdA0KPiA+ID4gPiA9PT09PT09PT09PT09PT09PT09PT0NCj4gPiA+
ID4gZ3N0LWxhdW5jaC0xLjAgZmlsZXNyYyBsb2NhdGlvbj0uL3N3aXRjaF8xMDgwcF83MjBwXzI0
MGZyYW1lcy5oMjY0ICENCj4gPiA+ID4gaDI2NHBhcnNlICEgdjRsMmgyNjRkZWMgISBmaWxlc2lu
ayBsb2NhdGlvbj0uL2gyNjRfb3V0cHV0XzQyMC55dXYNCj4gPiA+ID4gU2V0dGluZyBwaXBlbGlu
ZSB0byBQQVVTRUQgLi4uDQo+ID4gPiA+IFBpcGVsaW5lIGlzIFBSRVJPTExJTkcgLi4uDQo+ID4g
PiA+IFJlZGlzdHJpYnV0ZSBsYXRlbmN5Li4uDQo+ID4gPiA+IFJlZGlzdHJpYnV0ZSBsYXRlbmN5
Li4uDQo+ID4gPiA+IFBpcGVsaW5lIGlzIFBSRVJPTExFRCAuLi4NCj4gPiA+ID4gU2V0dGluZyBw
aXBlbGluZSB0byBQTEFZSU5HIC4uLg0KPiA+ID4gPiBSZWRpc3RyaWJ1dGUgbGF0ZW5jeS4uLg0K
PiA+ID4gPiBOZXcgY2xvY2s6IEdzdFN5c3RlbUNsb2NrDQo+ID4gPiA+IEdvdCBFT1MgZnJvbSBl
bGVtZW50ICJwaXBlbGluZTAiLg0KPiA+ID4gPiBFeGVjdXRpb24gZW5kZWQgYWZ0ZXIgMDowMDow
NS43NzI0MTQ0MDAgU2V0dGluZyBwaXBlbGluZSB0byBOVUxMIC4uLg0KPiA+ID4gPiBGcmVlaW5n
IHBpcGVsaW5lIC4uLg0KPiA+ID4NCj4gPiA+IEkgZGlkIGEgdGVzdCBvZiBteSBvd24gaGVyZSwg
YW5kIGRpZCBnZXQga2VybmVsIHNwbGF0LiBUaGUgd2FybmluZw0KPiA+ID4gaW5kaWNhdGUgdGhh
dCB0aGUgc3RhdGUgbWFjaGluZSBpcyBubyBsb25nZXIgcmVzcGVjdGVkLiBUaGlzIG5lZWRzDQo+
ID4gPiB0byBiZSBhZGRyZXNzIGluIHYyLCB3ZSBhZGRlZCB0aGVzZSBjaGVjaywgc2luY2UgdGhl
IGxvY2tpbmcgaXMNCj4gPiA+IGJvdW5kIHRvIGxlZ2FsIHVzZSBvZiB0aGUgc3RhdGUgbWFjaGlu
ZS4NCj4gPg0KPiA+DQo+ID4gU2luY2UgYXBwbHlpbmcgdGhlIHBlcmZvcm1hbmNlIHBhdGNoLCBk
ZXZpY2VfcnVuIGFuZA0KPiB3YXZlNV92cHVfZGVjX2ZpbmlzaF9kZWNvZGUgaXMgbm90IHN5bmNo
cm9uaXplZCBhbnkgbW9yZS4NCj4gPiBIb3cgYWJvdXQgcmVtb3ZpbmcgdGhpcyB3YXJuaW5nIG1l
c3NhZ2UgPw0KPiANCj4gSSB3b3VsZCBsaWtlIHRvIHVuZGVyc3RhbmQgaG93IGl0IG1ha2VzIHNl
bnNlIHRoZSB3ZSd2ZSByZWFjaGVkIFNUT1Agc3RhdGUNCj4gd2hpbGUgdGhlIEhXIGlzIHN0aWxs
IGFjdGl2ZWx5IGRlY29kaW5nLiBJdCBkb2VzIG5vdCBmZWVsIHJvYnVzdCB0byBtZSwNCj4gcGVy
aGFwcyB5b3Ugd2FudCB0byBpbnRyb2R1Y2UgYSBuZXcgc3RhdGUgPyBBbHNvLCBJJ20gY29uY2Vy
biB3aXRoIG92ZXJhbGwNCj4gdGhyZWFkLXNhZmV0eSBub3cuDQoNCg0KVGhlIGZpbmlzaF9kZWNv
ZGUgYW5kIGRldmljZV9ydW4gd2FzIHN5bmNocm9uaXplZCBlYWNoIG90aGVyLCBidXQgc2luY2Ug
YXBwbHlpbmcgdGhlIHBlcmZvcm1hbmNlIHBhdGNoLCBhcyB5b3Uga25vdywgdGhleSBhcmUgbm90
Lg0KU28gYXMgc29vbiBhcyBzZXR0aW5nIHRoZSBkZXZpY2Ugc3RhdHVlIHRvIFNUT1AgaW4gdGhl
IGZpbmlzaF9kZWNvZGUsIHRoZSBkZXZpY2VfcnVuIGNvdWxkIGJlIGNhbGxlZCBiZWZvcmUgcHJl
dmVudGluZyBkZXZpY2VfcnVuIGJlaW5nIGNhbGxlZCBieSB0aGUgam9iX3JlYWR5Lg0KDQpJIHRo
aW5rIHRoZXJlIGlzIG5vIHByb2JsZW0gYmVjYXVzZSBFT1MgaGFzIGFscmVhZHkgYmVlbiBzZW50
IGluIHRoZSBmaW5pc2hfZGVjb2RlIGFuZCBzdGF0dWUgaGFzIGJlZW4gY2hhbmdlZC4NCkkgZG9u
J3QgdGhpbmsgaXQgYnJlYWtzIG92ZXJhbGwgdGhyZWFkLXNhZmV0eS4NCg0KU08gSSBjYW4gcmVt
b3ZlIHRoZSB3YXJuaW5nIG1lc3NhZ2UuIEhvdyBhYm91dD8NCg0KDQo+IA0KPiByZWdhcmRzLA0K
PiANCj4gLS0NCj4gTmljb2xhcyBEdWZyZXNuZQ0KPiBQcmluY2lwYWwgRW5naW5lZXIgYXQgQ29s
bGFib3JhDQo=

