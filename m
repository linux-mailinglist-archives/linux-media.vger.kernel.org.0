Return-Path: <linux-media+bounces-53852-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +E9hFWFJo2nW/AQAu9opvQ
	(envelope-from <linux-media+bounces-53852-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 21:00:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFB01C7BB2
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 21:00:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94748343D152
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 19:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61D5E36C9F5;
	Sat, 28 Feb 2026 18:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="ZKMsTTei"
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021131.outbound.protection.outlook.com [40.107.51.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D57336C9EE;
	Sat, 28 Feb 2026 18:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772302380; cv=fail; b=fA2qvJzI2n6pEybhPFJ559/p1siG07ZLBTBvch+aGWP4releGm51lW95/fMO2aPjzqfWyBFDjNOurU0os33Gyt4gF+XeMXRK/ahnwsZ6w09YaiVdChUOccwtXPAFxpXlvhQcPaPBjGMX0XvyV28Kzlc7uhYdlyPIUKXWYC6P6t4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772302380; c=relaxed/simple;
	bh=5DkKTDoWy/7eZK6fh2yP0ocBldJ3mEC9dBB7ELOU8Mw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FkAtBUIFbdqghblXG8niHqH1NfZvQXHnICcKgZJzrqTNMjfuUAbPuSGPdVex3dGRf2KGh701Vj3gStc3GnXm3rJRD34heYxl31j6Sa29BJZfjcgDwSc7LSXMOr1UNRHN66ULtSvzdqoviN/14zy0caC/D9xQVSZlNUYjJVuJNhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=ZKMsTTei; arc=fail smtp.client-ip=40.107.51.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k9lmRoxeSEvmLboM5ApoWu83wrvI4PAw6G8FcnGuFOSz3TnXjEwex2ImN0mZb03pJG9YikN6DXZalpyoO1XRxdUydIH4LEULwyuZ5xuHjv/4CtpajAiMjY7XrXzfAcCeQ4YSvv1xmP0F9Tl4yQvyepOvsrv9Y7cT/exYd4WdvVi7cKACSN3qvtD6D5WLNvKh72PJfuQOGftT4ET8kaSKvQ9IzgAI+pDAqiL1rE4gtMaXmj0tXZjykPSz0eggx+Pbq1sNyMyE1XGBeQK0silKTOzGLOCvBCTiR8qLBSJOUsqOtLQhd6xbp8B/lpNBW0lBkWWxvoPBd3TQrrh7cr7+xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5DkKTDoWy/7eZK6fh2yP0ocBldJ3mEC9dBB7ELOU8Mw=;
 b=zKEuOx6TSruNbRcm2aek/Nh8zm+BIM4qfc2uAdlSQ+bU/ocqkjggw4ySpAOCqxgIcZjnHFkNsydrlhyiiP+hmmCFiRpOqK95YIlUGQobDvXgYNypBadPD/dgqUkGpwpSOMHiLmhsFN39AljYrKraHTyEAVJHany5OphievG4Fv3ZuMI1ha6muXyHu1fLzKLPxdNTvrf4JPMn1S1kmY59Ghgawu6IujAfcug2LjcslYDzYbmkJjYXvN39uG0r7fFAyPJTP0Oe0rGS430KcRsBumvVdLgSCi72KQFUk9+x5A1iuDd/EWROTqXhiddARxmWH1ZRCZXIzkhvcg1f9mj/9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5DkKTDoWy/7eZK6fh2yP0ocBldJ3mEC9dBB7ELOU8Mw=;
 b=ZKMsTTeilfFq++FRUJud6qNQuHpQIkKJsewf356xkkNkVr0g8PVo8r5xVlkuZHQbq45qsrfMp81RlrxCnab2k+P/lB8K5WmSw0G3eE3o5xo7/1qfxF/E/AS816OQ/qMHvycftbLMoAvFDS+Ti5uV04W16ETWeWv0Mis8cG4N6scP7/SGaRg6JBmOX3yt9/R5FQVA+xzboCb9rJxyghUkgOe2HQikHW7VF8BniwhogPOiLTfgQZ4FNYDsE7kjOkkDBHys2YtEg4Cu73lL+AUz/y0YPPqDdjcr18FaNRPsDYxRlOXKp+QFPC+iYdYZQA3LEi06N9oVSDb6TWAQKumOIw==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA0P287MB1993.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:123::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.12; Sat, 28 Feb
 2026 18:12:53 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9678.011; Sat, 28 Feb 2026
 18:12:52 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Xiaolei Wang <xiaolei.wang@windriver.com>, "sakari.ailus@linux.intel.com"
	<sakari.ailus@linux.intel.com>, "laurent.pinchart@ideasonboard.com"
	<laurent.pinchart@ideasonboard.com>, "dave.stevenson@raspberrypi.com"
	<dave.stevenson@raspberrypi.com>, "jacopo@jmondi.org" <jacopo@jmondi.org>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"prabhakar.mahadev-lad.rj@bp.renesas.com"
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "hverkuil+cisco@kernel.org"
	<hverkuil+cisco@kernel.org>, "johannes.goede@oss.qualcomm.com"
	<johannes.goede@oss.qualcomm.com>, "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>, "jai.luthra@ideasonboard.com"
	<jai.luthra@ideasonboard.com>, "richard.leitner@linux.dev"
	<richard.leitner@linux.dev>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] media: i2c: ov9282: Convert to CCI register access
 helpers
Thread-Topic: [PATCH 1/3] media: i2c: ov9282: Convert to CCI register access
 helpers
Thread-Index: AQHcqI06TPzLSm8MTkKBF2gmNt3zTbWYZNP0
Date: Sat, 28 Feb 2026 18:12:52 +0000
Message-ID:
 <PN3P287MB18290DAB4344D5671227E6CD8B70A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260228083401.1007434-1-xiaolei.wang@windriver.com>
 <20260228083401.1007434-2-xiaolei.wang@windriver.com>
In-Reply-To: <20260228083401.1007434-2-xiaolei.wang@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MA0P287MB1993:EE_
x-ms-office365-filtering-correlation-id: 11348ee6-1a80-4ebf-0f3e-08de76f4fd51
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|10070799003|921020|38070700021;
x-microsoft-antispam-message-info:
 peG7E7GmdojEtJdXOjAa9J9ClkAYFL8ealUVRO3tQgfeD6/12KPjyzP9eLugGfruxUSQxbJ4eXQO8wJjXSFcbipSMaqeySBZQLsHy2WqLdcgeq70QGnpTYSd8wF3MQrdru0/3E/27iQRasNrC6MAhLIhLxuAFq9HirGO2Nrf596KbM/BrsQG9K3/03ptOauVVdFNPBJYtqTZ8v9ek9nHAOJLxQXJxSH1R4LHIulD0O2XPIQUd78+giGnpOXpHI80JHov8dBlHfyrAEDs+SY1W5cQ9csdgepD7Z7LFltL6U/vphhMeCOvMNHSj11DhwA43CO1pVyOvvAmOsCVYhVy7T1zJE4g21ZFDK7RrgtQRlx2Ib/5iQ7cNeycSlcHfd/STQgFOc0/3qVeMLyJMGRR6MV/PFkC20wQJH3Ad7XUp5tTv2i+7GI/FECgWL8c5J420xg+vSAMEX1YjOFNqRNZ5REnwSzdGcQ5Pby2PLfrbGtYaFdWvvb8GzQ/ayq3s36JGkN1BhnBs8B218ld4NZ+GSmuJoTC8tqWUrf+e1LIXhvKA0xPqEJk/cW/ir1vcXLowVLhlORIXEipvFEb7mBVwBlooQRDOuEmCExE2xrKyhMlyef6kf4i1rPOqRQXt2qQrc/HSnSrG/PdSXwwwJYnQkIkTzCqceVTM17Os1M5lKTfx5L5IX3YYPdU8b5ZhA9PlzGodj37DKwfJZUp6GoRUyiBx1MA6jNvtRlTGgkvtEd4kLgPwwaEy6nC5xmLlH5i3hMf6p+Cmk5/jBLVHe+Cp8AMlk5fbT926+f4WqoM1wvRBVM6jItBYgUpdX1n0BDP
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(10070799003)(921020)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NURibUJ4dDNZanhOZDRLaG1DZUF0dHNXVUErVmlvVGNmSzQ4TTN0dU81UFVt?=
 =?utf-8?B?VnBtVENTaEJ1b3NEYkt3bnJWWUN4cEY5NTZtVTZ2aXZxZWxrc2RsblNsd2RS?=
 =?utf-8?B?cmRQSXdHRTJFSU1wZWhRVlp3dkt1NHBqVWpkK0FPcXpiZVlQNDRFaXExOFVy?=
 =?utf-8?B?dE42VThYR3NML3MxRzBLcVRJYmZ2dDJ0RDRhdjI0cGNjT3VId251bG04UVFO?=
 =?utf-8?B?YlpwaFVrZjVsK2VONXZjRUJ6VS9MMWZwR0ZZNG9TYmlXYUQvaXpiVDEvcmYy?=
 =?utf-8?B?bjJwYmVMaGxHNUkrdGliMkNCdm9VVVhuK2ozRm1sRmZMc21wTldUUjY4bHdk?=
 =?utf-8?B?dEJLRzJablRHSjJJMlBwNU1UK3l5UVhwWFEwK2ppNHhzU1MrU1Y2OGFnMWZR?=
 =?utf-8?B?b0FML204dnJzNS8rQ0xhejM4KzlxU0ZkMkVyR3Zlai9naXdUcVRNb1NiNkhJ?=
 =?utf-8?B?djlkTVMzeTlNTTlsMnRyNkVZck4zSDBVUFpxbFFoTDBOSmRUUzg1dWJ2NmJz?=
 =?utf-8?B?MlRCU3RMOXNXem51djVJN3NsNm5TU1dYc25pcncrb09zL3dWNkhsYlVxQm1W?=
 =?utf-8?B?OUNNTTljUndoRHBjVFdMdTlwc21hY2p5ajludUVZNlhKRERXbVp2RHcwTEI5?=
 =?utf-8?B?OS9OTDIyMHJENjcyazJSOEcrZk1kUVhMQlgxWjJveW1Ndy9aWFZtYWhNQ01Z?=
 =?utf-8?B?OUxpQWc3akRGZ2ppemMrTjU1OTE1ZGNvbDJ3bzJjWVF4WUJsRlh5OHhTVXZ6?=
 =?utf-8?B?bEJTKyt0TjBHZ2tXcm5KL002aFM4V0JBc3o2Si8rVHRQdDM4RGJqSU00MHlu?=
 =?utf-8?B?MGVBcGdtaCsrNytqMERiTmJtaVk4TU93c0J6Nm1FaW1ZZnhBMjVaTytsUldp?=
 =?utf-8?B?aGFhemU4S29YdDFGNzBPNzBFUE9RcElMV2xvdk9CSjcrSEpLZFhOengySDN4?=
 =?utf-8?B?aC9mRWJSM2hHR1pwVDFGdWJYckNQOXBic2Q2TXFBVVVrbGlLMlhRQmFqZ3lJ?=
 =?utf-8?B?aUFacDA2bHdVeXlIVmQ3OGxsMWIzaTU5SldPWlZDSFBJMWVZNVJJR2pCM3Rz?=
 =?utf-8?B?VEFVR2xwRFBCaURtMTRERG9LOFMrQlJYdXFQU1dvYkZMUVRhc1FmSmJiZk1T?=
 =?utf-8?B?UlVFdFA0YXllS0M1Z2dZYVhYQjBHOVQ4N3VJM1Q1enJDWG5DdXJ2dVM1aVJW?=
 =?utf-8?B?akJsQjZjS2tIL3VvM083d21ob3FST1oxMDFIbjdJczRJTXViMzJraXkyZ0dX?=
 =?utf-8?B?cHVSaUhyUXdnaS85NElTOGdMQnJ0LzdoWXVGNHVQcXhwQ2p4UFpXZlZ6R2dx?=
 =?utf-8?B?Zkc0Z3dCYmFZdDZMcnN5OU5qNW10M2d0R1VPWm00ZjRFU3dzTHd0QllSNlVM?=
 =?utf-8?B?eU9CaXVKcGNMeEtUMXNrTHZoK2tVUkxya0lXV3FkYTNxWFBkcGswSTVObkt5?=
 =?utf-8?B?VENoVmF0K0x0Q25ycGhpdWtiR1BKQXdXejZnOG1zRE0xN041MjNDOU5SY0d5?=
 =?utf-8?B?b0NNdDVjanEyWElQeXVRODRxVEc5Vlk4OHlPVUovUUZ3RU8xV2JPb09tV1lS?=
 =?utf-8?B?MDdHOWtOUHBqajBYUVRPdmdMd0I5S3hPQVNJeXBQbHVXUE1WbW9ja3kya05z?=
 =?utf-8?B?ZkVUR0FzdEhPZm1LbXRLRGFoa0d0VWQySXlBWEo5RytwTzdmaDl4dW5yOHg2?=
 =?utf-8?B?VnhzTkxGTnptc1hQVHhUM1RZSGdRRTZtM04rRFdrdzJXalFGVWU1TmxINGtr?=
 =?utf-8?B?am1UTkhSeE1YcG5iMXZ1RXdaOU1VQit5R1pJWWc2NVhScVFmN2poVFlNWVBJ?=
 =?utf-8?B?WXNSeldkWnM2eElnU2xIUUUwM0YzRTlpRHJKeWJBUkJJY1hjNWJraEljbUhX?=
 =?utf-8?B?Y3lwT1o2dnhBS244OHVuZ3QwSU9yRmQrMGVCdUwvR3FiYWVKUjVaNFQzM1VV?=
 =?utf-8?B?dURVWjVwU0J4WGR1bmtUelU3UlhZV0k5blZISkJKNk5oeGR2cUQ5elM5S01O?=
 =?utf-8?B?RHRpbGJ6TTJ6Yy91bjEzaUdDT09HOThXZzFwanRBT3NWMEhwNEFEK2VNMUtw?=
 =?utf-8?B?bkhTSWdHbG83Um1MaDJQTDVtcy9ERzhwWUVDaFUvWTR3QXlxRWJkY2xRUVNI?=
 =?utf-8?B?aDJMcHQwV1hOOTc0aFk0NVQ4Q1hCLzhUcEU2cW1UT09MZHQ5NUp1UFB3emp6?=
 =?utf-8?B?Q2YxckJlRHYwMGJnekpXejRMNnBXbWVkb0VsVkd5MFJybzZEaG5ZSFFBSUMz?=
 =?utf-8?B?WnZudWVWVklZZzdTMks1R0wzd0ZXMjdKVmpLc1NqdXkzL29pdDR0cjg4YlJF?=
 =?utf-8?B?anI2SnBNU21CVHFGLzFRYVFGaUhmWGo4OXBVZFA0SUhGSWdINjROTzIzaHlZ?=
 =?utf-8?Q?TaCr2NTPNQhx+S16q6/DZFeY/60jG/HdJ5tjqYpx1fMVF?=
x-ms-exchange-antispam-messagedata-1: Hhw8Ivn+i1cuX+2/X6+3YeH/d/zunwB8FiU=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 11348ee6-1a80-4ebf-0f3e-08de76f4fd51
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2026 18:12:52.6845
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LaHhKZ+6YKltVtIfZA2J3wKRfHhUxzB24ZzJIpAA8AexYmXhboZqUmgkLVyIof0Aa01F1T1OdmZSQljQ9pScaxDiPnbgRvNMQLGYbS9wMNI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1993
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-53852-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[windriver.com,linux.intel.com,ideasonboard.com,raspberrypi.com,jmondi.org,kernel.org,bp.renesas.com,oss.qualcomm.com,xs4all.nl,linux.dev];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	NEURAL_HAM(-0.00)[-0.997];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,windriver.com:email,siliconsignals.io:email,siliconsignals.io:dkim,PN3P287MB1829.INDP287.PROD.OUTLOOK.COM:mid]
X-Rspamd-Queue-Id: AEFB01C7BB2
X-Rspamd-Action: no action

SGkgWGlhb2xlaSwKCj4gVXNlIHRoZSBuZXcgY29tbW9uIENDSSByZWdpc3RlciBhY2Nlc3MgaGVs
cGVycyB0byByZXBsYWNlIHRoZSBwcml2YXRlCj4gcmVnaXN0ZXIgYWNjZXNzIGhlbHBlcnMgaW4g
dGhlIG92OTI4MiBkcml2ZXIuIFRoaXMgc2ltcGxpZmllcyB0aGUgZHJpdmVyCj4gYnkgcmVkdWNp
bmcgdGhlIGFtb3VudCBvZiBjb2RlLgo+Cj4gU2lnbmVkLW9mZi1ieTogWGlhb2xlaSBXYW5nIDx4
aWFvbGVpLndhbmdAd2luZHJpdmVyLmNvbT4KCi4uLgoKPiDCoC8qKgo+IMKgICogb3Y5MjgyX3Vw
ZGF0ZV9jb250cm9scygpIC0gVXBkYXRlIGNvbnRyb2wgcmFuZ2VzIGJhc2VkIG9uIHN0cmVhbWlu
ZyBtb2RlCj4gwqAgKiBAb3Y5MjgyOiBwb2ludGVyIHRvIG92OTI4MiBkZXZpY2UKPiBAQCAtNjM5
LDE1ICs1MzYsMTUgQEAgc3RhdGljIGludCBvdjkyODJfdXBkYXRlX2V4cF9nYWluKHN0cnVjdCBv
djkyODIgKm92OTI4MiwgdTMyIGV4cG9zdXJlLCB1MzIgZ2FpbikKPiDCoMKgwqDCoMKgwqDCoCBk
ZXZfZGJnKG92OTI4Mi0+ZGV2LCAiU2V0IGV4cCAldSAofiV1IHVzKSwgYW5hbG9nIGdhaW4gJXUi
LAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBleHBvc3VyZSwgZXhwb3N1cmVfdXMs
IGdhaW4pOwo+Cj4gLcKgwqDCoMKgwqDCoCByZXQgPSBvdjkyODJfd3JpdGVfcmVnKG92OTI4Miwg
T1Y5MjgyX1JFR19IT0xELCAxLCAxKTsKPiArwqDCoMKgwqDCoMKgIHJldCA9IGNjaV93cml0ZShv
djkyODItPnJlZ21hcCwgT1Y5MjgyX1JFR19IT0xELCAweDAxLCBOVUxMKTsKPiDCoMKgwqDCoMKg
wqDCoCBpZiAocmV0KQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0
Owo+Cj4gLcKgwqDCoMKgwqDCoCByZXQgPSBvdjkyODJfd3JpdGVfcmVnKG92OTI4MiwgT1Y5Mjgy
X1JFR19FWFBPU1VSRSwgMywgZXhwb3N1cmUgPDwgNCk7Cj4gK8KgwqDCoMKgwqDCoCByZXQgPSBj
Y2lfd3JpdGUob3Y5MjgyLT5yZWdtYXAsIE9WOTI4Ml9SRUdfRVhQT1NVUkUsIGV4cG9zdXJlIDw8
IDQsIE5VTEwpOwo+IMKgwqDCoMKgwqDCoMKgIGlmIChyZXQpCj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGdvdG8gZXJyb3JfcmVsZWFzZV9ncm91cF9ob2xkOwo+Cj4gLcKgwqDCoMKg
wqDCoCByZXQgPSBvdjkyODJfd3JpdGVfcmVnKG92OTI4MiwgT1Y5MjgyX1JFR19BR0FJTiwgMSwg
Z2Fpbik7Cj4gK8KgwqDCoMKgwqDCoCByZXQgPSBjY2lfd3JpdGUob3Y5MjgyLT5yZWdtYXAsIE9W
OTI4Ml9SRUdfQUdBSU4sIGdhaW4sIE5VTEwpOwo+IMKgwqDCoMKgwqDCoMKgIGlmIChyZXQpCj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gZXJyb3JfcmVsZWFzZV9ncm91cF9o
b2xkOwo+Cj4gQEAgLTY1Niw2MiArNTUzLDExIEBAIHN0YXRpYyBpbnQgb3Y5MjgyX3VwZGF0ZV9l
eHBfZ2FpbihzdHJ1Y3Qgb3Y5MjgyICpvdjkyODIsIHUzMiBleHBvc3VyZSwgdTMyIGdhaW4pCj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBPVjkyODJfU1RST0JFX0ZSQU1FX1NQQU5fREVGQVVMVCk7Cj4K
PiDCoGVycm9yX3JlbGVhc2VfZ3JvdXBfaG9sZDoKPiAtwqDCoMKgwqDCoMKgIG92OTI4Ml93cml0
ZV9yZWcob3Y5MjgyLCBPVjkyODJfUkVHX0hPTEQsIDEsIDApOwo+ICvCoMKgwqDCoMKgwqAgY2Np
X3dyaXRlKG92OTI4Mi0+cmVnbWFwLCBPVjkyODJfUkVHX0hPTEQsIDAsIE5VTEwpOwoKSWYgYWxs
IHRoZSBvcGVyYXRpb25zIGFib3ZlIHN1Y2NlZWQgYnV0IHJlbGVhc2luZyB0aGUgZ3JvdXAgaG9s
ZCBmYWlscywKeW91IHN0aWxsIHJldHVybiBzdWNjZXNzLCB3aGljaCBpcyB3cm9uZy4KClRoaXMg
Y2FzZSBpcyByYXJlLCBidXQgaXTigJlzIGJldHRlciB0byBmaXggdGhlIGVycm9yIHBhdGguCgpJ
IHRoaW5rIHdlIHNob3VsZCBkbyBzb21ldGhpbmcgbGlrZSB0aGlzOgoKZXJyb3JfcmVsZWFzZV9n
cm91cF9ob2xkOgrigILigILigILigILigILigIJpbnQgcmV0X2hvbGQgPSBjY2lfd3JpdGUob3Y5
MjgyLT5yZWdtYXAsIE9WOTI4Ml9SRUdfSE9MRCwgMCwgTlVMTCk7CgrigILigILigILigILigILi
gIJyZXR1cm4gcmV0ID8gcmV0IDogcmV0X2hvbGQ7Cgo+Cj4gwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IHJldDsKPiDCoH0KCk90aGVyIHRoYW4gdGhpcyBpc3N1ZSwgdGhlIHBhdGNoIGxvb2tzIGdvb2Qg
dG8gbWUuCgpSZXZpZXdlZC1ieTogVGFyYW5nIFJhdmFsIDx0YXJhbmcucmF2YWxAc2lsaWNvbnNp
Z25hbHMuaW8+CgpCZXN0IFJlZ2FyZHMsClRhcmFuZw==

