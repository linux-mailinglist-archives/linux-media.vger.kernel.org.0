Return-Path: <linux-media+bounces-38532-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FD1B137A2
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 11:39:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B832D17A133
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 09:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C18325333F;
	Mon, 28 Jul 2025 09:38:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021081.outbound.protection.outlook.com [40.107.57.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2A170825;
	Mon, 28 Jul 2025 09:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753695535; cv=fail; b=F/DqTvFY5IjJM5QNYZCVp1kL2NuA2wPvtfnjiEin6UeeinL/ijBZ8osp18ki1aNRQATf6AElmxmagwt69fddLQErlzCz3yA9WCsDkqkd358yJgCcdsHEX2dn9Nd8OyHVE5dxW5zNUHVVsderSmvZIGYVofFJlKvy6hzX4AqIqsw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753695535; c=relaxed/simple;
	bh=23NJopx8xGgCXFiQh94NNpjF4j6i8srJBCu0h6qImYQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KNHTwaF82VM0atHDrsdtc1ZS4glFBc+sCpv/liFFx//M7mtAOXQBXsFiPdBOUcJ4a6oO/RIXSy6Gwnb74feUEtVm8uUBqPMxO44NDrC+n/5W1tL5kcZAVwhk6FdKEMlPn8h9Jj5axfsxDW7c0t/8AdWSSkV22jkjNpSh7VGA4H8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.57.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j9cBbRy5cxQwvQmoV9wKmEzY3cebpbqTo9dUgtZgcyHuwpHIveFWsma8Svc4GOtfFoOQKRTFE+NmSG3PnMFdWoDi18MLmpN6QUkdtBNofnuwXU6qLenkB8PSn55Qoh9vnDyHB7qjgklKWkx4JAlksQQdQ0nZNYYDmC44lJ1y8FR3nSwTqpMDHJLxsaxyncXVrNYVBC7CB5tBnBc9eNAcdQK+7Npj4RUigmfECpKZ7/DgTkStz5RV0FdjbPAt9FG1JmWVVn4ynhnS1NFSSHLPw5Il9LZ+lZqi0soQJF5QLQ/PP/knowvPXZNlxJntb+LtW14YWyunM/fDXNabiJ/Cag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=23NJopx8xGgCXFiQh94NNpjF4j6i8srJBCu0h6qImYQ=;
 b=HzrxXpWe5X6gMvQ+N/rOnlRvaUJXRvgtsyXeWEM4H1Gdr97W2Z1884Yd+E9IyIYScKadu+4+DPvkZ4RUlje5Mz/+vhqZgMY1tTIoSherlssuSSzuR59WF9cHVG0uygBtglAwzRkhylgJyEKtcxJ9oatVw764SmZhJPGX8q7RmKukeW0FW2YhcVhrZ4I+TsFqMHXvANCSIzwGpcNzABQSmmdMsfGX0JyDpEYRmm8StWY2x8hU3Tmx8KVTDmOVI816JlZc+TAbN/LSIFL7fU/We5wUqyatUozaJxa+Zp8BQU94WAaZBqypyMsOEJH6voE43Jfp8Y6QH/a3/ic05jvOvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN3P287MB1617.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:192::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 09:38:44 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%5]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 09:38:44 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Darshan R. <rathod.darshan.0896@gmail.com>
CC: "mchehab@kernel.org" <mchehab@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "jogidishank503@gmail.com"
	<jogidishank503@gmail.com>, "hansg@kernel.org" <hansg@kernel.org>
Subject: Re: [PATCH v2] staging: media: atomisp: Fix indentation and styling
 in output kernel code
Thread-Topic: [PATCH v2] staging: media: atomisp: Fix indentation and styling
 in output kernel code
Thread-Index: AQHb/5slSnzPJ9sSsUGi/SkPMddEdrRHP9a0
Date: Mon, 28 Jul 2025 09:38:44 +0000
Message-ID:
 <PN3P287MB182997CF622BC072140E4C398B5AA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20250728083943.10851-1-rathod.darshan.0896@gmail.com>
In-Reply-To: <20250728083943.10851-1-rathod.darshan.0896@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN3P287MB1617:EE_
x-ms-office365-filtering-correlation-id: 1baf60a0-a460-4111-5b6f-08ddcdba8b4a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZVBpYlA3VGNDeUpCcGx3WlFuU3JMVC8rTHM5MjZUcDVMeHRLNm5GRHRVdWxU?=
 =?utf-8?B?VUp5bjBEZW9neXlPTHdRMUcycWN5d3M2MVpUK1I3ck92aU1DVC9oU2hQNlVy?=
 =?utf-8?B?T3Ftc1JzZ0VaOGFoUWcrQmJ3dWlHeFZzd2IySmlZaEhGRlQ1d3MwdlJSRHhi?=
 =?utf-8?B?OUQwTXBXL1c0RGJackRrREp3Z291a3VTZFdTYTNwNDVMSENNNmx0T3JvQWh4?=
 =?utf-8?B?OW9ZT1o0aktnMHdPS0c1dTVSSURhaGlVL0tCbDJPYlhHRWRIRisyUEkvbjRo?=
 =?utf-8?B?VFAwOVE4dzBwYzlHVzdhSzNnQkdSazBjellYYm1ON0hvM3ZJQ3hDUDEyVWU2?=
 =?utf-8?B?SUQrVzBXR0dHOXJYZDNoT3ErMnp2YXJzUWZvNXJ3R2JDOUFaQm1KRmkxWmVZ?=
 =?utf-8?B?ZW5DNnl3RlZWb2Vra3pPZkk5UWVONSs0OWthclJFd0FaRTZyZnp1TzdKdnFv?=
 =?utf-8?B?SGRGSVc3M29jaDhTQ0xwakhFaWRhT2huUW1JUmx4MlpZQ3lyUFZkU0pyNzZJ?=
 =?utf-8?B?WUw1TjREUFUya293MWh3Z01IbFpPMUNZUWZLZDRwcHlDRkdZcUgzaklmbWZC?=
 =?utf-8?B?d1BJbk1JQ2c2d29JQ3VMZDZLbzZUSXZzV1Rvb01XTVF3Z21MRjVWSGV2VWM4?=
 =?utf-8?B?Sk1WRmVDT3FjSFI0MmM0WnVNeEF6T3dYWG1FSDY5V2ZiaW9yS1BCWEFyTTJo?=
 =?utf-8?B?MjBjNlVhTWZmN1hpRGROZEMzOXllS0JMbWlaL0F4TXRIUlA0d2pxckNLUVUy?=
 =?utf-8?B?TzFuRkhTWUR3VThmMmRsdXdQcDhIVG5PWFAxNGpLWmZxeGdCVzU3Nm9OdTBN?=
 =?utf-8?B?dWRsSW5VNnJGd2M4MnZTNnFKWnlPenJqaHVDeVQ1MndRWjFMTW1KVTZOb2lJ?=
 =?utf-8?B?S0NOdytFMDdJRGpGNVZ3NXZBMEFUbVJoVlJ5Unc5N0g1eEJ0dCsvRWh4N2Fp?=
 =?utf-8?B?THhWNFN4SldmK1lpMU04ckEyWkxlLzBYUHg5SE5VeTdIM2dIM1BPbFJLb3hO?=
 =?utf-8?B?Z0dnWmpWdFBBVXNBdVhyZlk4WlZrdE1YaHBwak5nbGNTR0xUL3p6UE1zMW5Q?=
 =?utf-8?B?eXJrMitZQWFaOFB5RFhkSmU2MWFSTzU0bVZEam9OOXJFd0IvZHYxUlpSZWNm?=
 =?utf-8?B?ZGtHRUVtbWNRRlhTTW9sS1N4blF6RDB5UDAzZnBLcTNzNUlHS0g1aXJBTFF2?=
 =?utf-8?B?OW5kR3AvZlcrR24xbWFSUmNrdUg2dW9FbHJIVW9DejVTVGtoRUpNR2FvclVZ?=
 =?utf-8?B?Y1NraFl1MlY2dTdLSUhIck8vMU9Cc2lVRldQZzV3QWZlMWFYeVhETzA0bVRx?=
 =?utf-8?B?ZTVsTnhCc01LR3llNmZQcXIwbVNhY2xuenZWUHdXNXkxT1BvS2I0ZktlNDBk?=
 =?utf-8?B?Um5od05KZlAyalZXYmlnT3VBYnhES0piT1M5VFptWDZQVTBFQ3ZVSGVOdlJW?=
 =?utf-8?B?TXdZbnRQNWRDdFVvN2duT2RsOGd5elJ3WDlRTzA4SGZmcGMvbVBZRlRRMkZL?=
 =?utf-8?B?NTk3ZDhxYzFxS1JoTkp6SXJTZk1VbW9Ya3VPZGppR3htVGxVRXh1bnJqeSti?=
 =?utf-8?B?bG5yNWI1U1FabkdIVnhtMjJZTGlQK1pWbkJ6UHFJVk1CMm9Ca2ZBblZHaUVD?=
 =?utf-8?B?UFBsUGF2M1NydG9kRkd0S21QOFowaXNjb213dFUvcXJkVTZ3RzJTMm42bmZQ?=
 =?utf-8?B?TkhseTlXblMrZzlINlhZUjNIV1ZrUFYrem5aWENiS0lhblZrcDdBVHVvYUNv?=
 =?utf-8?B?VWdPOUdMeEEvOUprUm9wNy82M1NENFViOFFyNnRxRzd1MXAzQmllL3I4b3JR?=
 =?utf-8?B?WGtrb0lQak50S0tXUGJ5R2Y1SnZPZ3MrS3d6QjVEYmtDNkplcGVhdnc1MTc5?=
 =?utf-8?B?MG1xVUFQUVl3UmU1MkR3dWZYQ3ZzQ2hiVGlweVRzRjNiWHRqY3ZCL0tMZlJ4?=
 =?utf-8?B?UGttUUlOdWNzNDFKaGZBdGUxRmMydE9TTjR1ZVBpZm1PM0FzWGZDVDdUZmZ6?=
 =?utf-8?Q?rQKn8+hHl7Qxh3UkkBeiHFgmp1ClLE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bXBIeTR6ZXYvaFZnMU9yaEYzdUhCenIxS0tpOTh6ZVdpMFl5QUlLaStnaDdr?=
 =?utf-8?B?SXR2RFI4a0NFZk1oMnlWUnpJc0VFejNZdTB3NVZOVGd4OUhITk5OMWtUQkNj?=
 =?utf-8?B?c3UzWFhVdmdLcCtlSG5NczY0NmRQY3prdHNPT2pTVCtzTStYUExHaFdZOGg0?=
 =?utf-8?B?V2E3bnVHVDc3VE45c2NLS1RQTzFxdlVpVWQ3TEZnUFhpVjZ2c1hWZ3FLYlNZ?=
 =?utf-8?B?TDRLcEtGMUJIQnpGN3lHMXRnblo1eFFKRWxvM1U3QUFWUmc0eDNoakdvVEhR?=
 =?utf-8?B?akNWWjNzT1hIbVErc0FwcnIxL05rL0RiMUdnRGdtenNuaW9aQWVsU0dveHVR?=
 =?utf-8?B?WTlDaWV3dlR3RnMxL012YnUwcThTdkhqeDRqbVBOV21lNi9JUTVPRVU0dzdU?=
 =?utf-8?B?eXliVDRkRkwyZDhDWkUvT21MU0E1WW9rUzFuYURlSDhsd1FYS0E5UnhxZUpY?=
 =?utf-8?B?eTFMSUlqUE55WlQxcUpxSjkzWmpRODJqeGRMUVQ5TUc2SndJRTZZWUlscDZM?=
 =?utf-8?B?anVlL0RhNVRKc0tvZEdwQjFaOENnUzYxOHhsQm0wbVhoeUdrdDUwY1JYYk5Z?=
 =?utf-8?B?b1lHbmRmcDdJYVNJWHlyOHhVT2UzQm5zamZtOXEwYmxWRkhCVytOUTI5Q1J3?=
 =?utf-8?B?WlZkVlBlK3hiVVd0alVwcWxBZ1Fha29oeDAvR2FCUW1hMXB0Zi9VU2EvNXhC?=
 =?utf-8?B?N0djNVp5MDV3UXlTYXV1TXBydEdnT2dBOWtiWDZ5VEk0aG5xYkVUTk5LWTJZ?=
 =?utf-8?B?bk8zVFRQK1Iyd3FDKy9ZRmVWcUlKbHdKOGdmb2ZiQS96Z2NlaUl2cGlxVGth?=
 =?utf-8?B?VjE4bXhoVjBpcXR4a3dCMWg4dVYxK3Bac0I3WDlVZ0I0c0psVE1sZGFLTnJO?=
 =?utf-8?B?d2ZPamRzQlA0TDZnYitjaXZ1TVV5eFpqeU1CM0NZcVpoa0lOK0RxL3NEbjcv?=
 =?utf-8?B?VSt4b01INzRKSE55WmxzNy9XRnhidjhCY0xGcmRLUjRFUDI0Y1M2NEJPTFFN?=
 =?utf-8?B?aGh4UzZnb0RUQXBybFAvRmNQalhrOVMydHc4eElSVjNxYjRRYlRCTXdlVEUr?=
 =?utf-8?B?WEN0OE5WY09rR2JiWWUrYmZnQ29jYzNINmQvM21VZCs1bFNNYXk2QktBTjlx?=
 =?utf-8?B?anhrbVh2NS9vcDhtbFhYcXc2STl3aEFsb0p6NWxCcndSY0NHVzJ4RDA5bmpW?=
 =?utf-8?B?SnBLOHF3Rmw4RVhzYWU3T0U4ZEU1UTRxU3hPN09LSVA3ajVNTWYrMnBZU0R4?=
 =?utf-8?B?ZnA2MkNOc0JlamdIc3Z1R3lUM1FKQzRKdy9pM0xrNXk4WUJRdGJNNjd3OU5P?=
 =?utf-8?B?RFkzVUEvSFJ0UmlYb3Jrb2RGL2NBdVEvSnhsK056NTZNbkNHVUN3bmU3QkNM?=
 =?utf-8?B?djZLSXZJTXFaY0RwWVpQUWhmYjA4TU9qYnU2VXltMDVZK3R2SUx2RGcxQXc0?=
 =?utf-8?B?Y3FTTlBWZW1sSmMrYkhtaXdOekEvTk83emdkeFhmNkN0cVBCcWJsSUw5WjNp?=
 =?utf-8?B?amtQZ29FanBsMzhmcWFiSXRIM0lzblpyQ1N3V2Nmak1MN2FkVWdia1BRd0tE?=
 =?utf-8?B?TDJCZlRTdWprZGMxRnhkaUp6SFppbGl6WWV6cEdLb1RKZUlMSVJXWDRKV20y?=
 =?utf-8?B?SFRjdWtEdVdiRklhdmwxZDAxN01DVGFyN29vRjZxSVBGK0k4TkJLeFRrbi90?=
 =?utf-8?B?eHB4ZUZ2bENlRy9adldqdFQ5WUFtRjBvcmIwd3cyZ1pzZittb0lEYXA2T2c2?=
 =?utf-8?B?UVJjWnF4b2ZQMG1oVGo1VjcwS2x5WU5DMXVQMmdaZmh1NDRHQndLc0pCeXBt?=
 =?utf-8?B?T1RCUHVHZDlHdEZIdFIzWkwzRUltU2x2U0VDQ3Q5QXZFRlI2TkI4M252MzNN?=
 =?utf-8?B?U0J6ZGJRem80cnJJdFFrK3dIdE94RTlVVUxvbWtHUmcrWDFNZWhVTzEvQUF2?=
 =?utf-8?B?SHIrMndYemMzU0dUNUdoK0xrR0Q0VTJpMjU5ZTkzOVg0QkFEeXlRc2dzbDlF?=
 =?utf-8?B?cWxPWmtjdDZBOE1sQW54VDNDZEE4VVFaL0xrVTRGWVpTTDRzKzNUdHpKcGRl?=
 =?utf-8?B?N3ZvMGN5Ui9mdG8xS3I0Z2t2a1AyVC9RSUZPWi9YdVl6MTZhOVJ0eGxTdjJp?=
 =?utf-8?Q?aer+GFzB7aS5/FbUUEqBqlg8g?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1baf60a0-a460-4111-5b6f-08ddcdba8b4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2025 09:38:44.0490
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UKo/3zANq1yhRwQc1Vgy7Fnk3vQy2KYuVAvNzESNEChbwstn/SdcsCeSQK2yEN0O2mfWLZ7BD5qhyxSydWqaWE06ag8P6UhcAV1kYDko7qk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1617

PiBVcGRhdGUgZm9ybWF0dGluZyBvZiBmdW5jdGlvbiBkZWZpbml0aW9ucyBhbmQgaWYgc3RhdGVt
ZW50cyB0byBtYXRjaCBrZXJuZWwKPiBjb2Rpbmcgc3RhbmRhcmRzLiBUaGlzIGltcHJvdmVzIHJl
YWRhYmlsaXR5IGFuZCBlbnN1cmVzIGNvbnNpc3RlbmN5IGFjcm9zcwo+IHRoZSBjb2RlYmFzZS4K
PsKgCj4gVGhlc2UgYXJlIG5vbi1mdW5jdGlvbmFsIGNoYW5nZXMgaW50ZW5kZWQgdG8gYWRkcmVz
cyBjb21tb24gY2hlY2twYXRjaAo+IHdhcm5pbmdzIGFuZCBwcmVwYXJlIHRoZSBkcml2ZXIgZm9y
IGV2ZW50dWFsIG1haW5saW5lIGluY2x1c2lvbi4KPsKgCj4gU2lnbmVkLW9mZi1ieTogRGFyc2hh
biBSLiA8cmF0aG9kLmRhcnNoYW4uMDg5NkBnbWFpbC5jb20+Cj4gLS0tCgpXaGVuZXZlciB5b3Ug
c2VuZCBhIG5ldyB2ZXJzaW9uIG9mIHRoZSBwYXRjaCwgeW91IHNob3VsZCBpbmNsdWRlIGEgY2hh
bmdlbG9nCmJlbG93IHRoZSAtLS0gbGluZS4gVGhpcyBoZWxwcyByZXZpZXdlcnMgZWFzaWx5IHNl
ZSB3aGF0IGhhcyBjaGFuZ2VkIGZyb20gdjEKdG8gdjIuCgpJIHRoaW5rIHRoZSBmb2xsb3dpbmcg
ZG9jdW1lbnQgd2lsbCBiZSB1c2VmdWwgZm9yIHlvdS4KTGluazogaHR0cHM6Ly93d3cua2VybmVs
Lm9yZy9kb2MvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3QKwqDC
oAo+IMKgLi4uL291dHB1dC9vdXRwdXRfMS4wL2lhX2Nzc19vdXRwdXQuaG9zdC5jwqDCoMKgIHwg
MjIgKysrKysrKysrKy0tLS0tLS0tLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMo
KyksIDEwIGRlbGV0aW9ucygtKQo+wqAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL21l
ZGlhL2F0b21pc3AvcGNpL2lzcC9rZXJuZWxzL291dHB1dC9vdXRwdXRfMS4wL2lhX2Nzc19vdXRw
dXQuaG9zdC5jIGIvZHJpdmVycy9zdGFnaW5nL21lZGlhL2F0b21pc3AvcGNpL2lzcC9rZXJuZWxz
L291dHB1dC9vdXRwdXRfMS4wL2lhX2Nzc19vdXRwdXQuaG9zdC5jCj4gaW5kZXggZDA5MzY1ZTBj
NDcxLi40Zjg0YzZkMzYyMmEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9zdGFnaW5nL21lZGlhL2F0
b21pc3AvcGNpL2lzcC9rZXJuZWxzL291dHB1dC9vdXRwdXRfMS4wL2lhX2Nzc19vdXRwdXQuaG9z
dC5jCj4gKysrIGIvZHJpdmVycy9zdGFnaW5nL21lZGlhL2F0b21pc3AvcGNpL2lzcC9rZXJuZWxz
L291dHB1dC9vdXRwdXRfMS4wL2lhX2Nzc19vdXRwdXQuaG9zdC5jCj4gQEAgLTM0LDkgKzM0LDkg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBpYV9jc3Nfb3V0cHV0MV9jb25maWd1cmF0aW9uIGRlZmF1
bHRfb3V0cHV0MV9jb25maWd1cmF0aW9uCj7CoAo+IMKgdm9pZAo+IMKgaWFfY3NzX291dHB1dF9l
bmNvZGUoCj4gLcKgwqDCoCBzdHJ1Y3Qgc2hfY3NzX2lzcF9vdXRwdXRfcGFyYW1zICp0bywKPiAt
wqDCoMKgIGNvbnN0IHN0cnVjdCBpYV9jc3Nfb3V0cHV0X2NvbmZpZyAqZnJvbSwKPiAtwqDCoMKg
IHVuc2lnbmVkIGludCBzaXplKQo+ICvCoMKgwqDCoMKgwqAgc3RydWN0IHNoX2Nzc19pc3Bfb3V0
cHV0X3BhcmFtcyAqdG8sCj4gK8KgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QgaWFfY3NzX291dHB1
dF9jb25maWcgKmZyb20sCj4gK8KgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgc2l6ZSkKCkl0IHdv
dWxkIGJlIGJldHRlciBmb3JtYXR0ZWQgbGlrZSB0aGlzOgoKdm9pZCBpYV9jc3Nfb3V0cHV0X2Vu
Y29kZShzdHJ1Y3Qgc2hfY3NzX2lzcF9vdXRwdXRfcGFyYW1zICp0bywK4oCC4oCC4oCC4oCC4oCC
4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCCIMKgY29uc3Qgc3RydWN0IGlh
X2Nzc19vdXRwdXRfY29uZmlnICpmcm9tLArigILigILigILigILigILigILigILigILigILigILi
gILigILigILigILigILigILigILigIIgwqB1bnNpZ25lZCBpbnQgc2l6ZSkKCj4gwqB7Cj4gwqDC
oMKgwqDCoMKgwqAgKHZvaWQpc2l6ZTsKPiDCoMKgwqDCoMKgwqDCoCB0by0+ZW5hYmxlX2hmbGlw
ID0gZnJvbS0+ZW5hYmxlX2hmbGlwOwo+IEBAIC03NCw3ICs3NCw3IEBAIGludCBpYV9jc3Nfb3V0
cHV0MF9jb25maWcoc3RydWN0IHNoX2Nzc19pc3Bfb3V0cHV0X2lzcF9jb25maWfCoMKgwqDCoMKg
wqAgKnRvLAo+IMKgfQo+wqAKPiDCoGludCBpYV9jc3Nfb3V0cHV0MV9jb25maWcoc3RydWN0IHNo
X2Nzc19pc3Bfb3V0cHV0X2lzcF9jb25maWfCoMKgwqDCoMKgwqAgKnRvLAo+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IGlhX2Nz
c19vdXRwdXQxX2NvbmZpZ3VyYXRpb24gKmZyb20sCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QgaWFfY3NzX291dHB1dDFfY29u
ZmlndXJhdGlvbiAqZnJvbSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgc2l6ZSkKPiDCoHsKPiDCoMKgwqDCoMKgwqDCoCBy
ZXR1cm4gaWFfY3NzX291dHB1dF9jb25maWcodG8sIChjb25zdCBzdHJ1Y3QgaWFfY3NzX291dHB1
dF9jb25maWd1cmF0aW9uICopZnJvbSwgc2l6ZSk7Cj4gQEAgLTk1LDcgKzk1LDcgQEAgaW50IGlh
X2Nzc19vdXRwdXRfY29uZmlndXJlKGNvbnN0IHN0cnVjdCBpYV9jc3NfYmluYXJ5wqDCoMKgwqAg
KmJpbmFyeSwKPiDCoH0KPsKgCj4gwqBpbnQgaWFfY3NzX291dHB1dDBfY29uZmlndXJlKGNvbnN0
IHN0cnVjdCBpYV9jc3NfYmluYXJ5wqDCoMKgICpiaW5hcnksCj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IGlhX2Nzc19m
cmFtZV9pbmZvICppbmZvKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IGlhX2Nzc19mcmFtZV9pbmZvICppbmZvKQo+
IMKgewo+IMKgwqDCoMKgwqDCoMKgIGlmIChpbmZvKSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHN0cnVjdCBpYV9jc3Nfb3V0cHV0MF9jb25maWd1cmF0aW9uIGNvbmZpZyA9Cj4g
QEAgLTEyNCwxMCArMTI0LDEyIEBAIGludCBpYV9jc3Nfb3V0cHV0MV9jb25maWd1cmUoY29uc3Qg
c3RydWN0IGlhX2Nzc19iaW5hcnnCoMKgwqDCoCAqYmluYXJ5LAo+wqAKPiDCoHZvaWQKPiDCoGlh
X2Nzc19vdXRwdXRfZHVtcCgKPiAtwqDCoMKgIGNvbnN0IHN0cnVjdCBzaF9jc3NfaXNwX291dHB1
dF9wYXJhbXMgKm91dHB1dCwKPiAtwqDCoMKgIHVuc2lnbmVkIGludCBsZXZlbCkKPiArwqDCoMKg
wqDCoMKgIGNvbnN0IHN0cnVjdCBzaF9jc3NfaXNwX291dHB1dF9wYXJhbXMgKm91dHB1dCwKPiAr
wqDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBsZXZlbCkKClNhbWUgd2F5IGhlcmUKCj4gwqB7Cj4g
LcKgwqDCoMKgwqDCoCBpZiAoIW91dHB1dCkgcmV0dXJuOwo+ICvCoMKgwqDCoMKgwqAgaWYgKCFv
dXRwdXQpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+ICsKPiDCoMKg
wqDCoMKgwqDCoCBpYV9jc3NfZGVidWdfZHRyYWNlKGxldmVsLCAiSG9yaXpvbnRhbCBPdXRwdXQg
RmxpcDpcbiIpOwo+IMKgwqDCoMKgwqDCoMKgIGlhX2Nzc19kZWJ1Z19kdHJhY2UobGV2ZWwsICJc
dCUtMzJzID0gJWRcbiIsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICJlbmFibGUiLCBvdXRwdXQtPmVuYWJsZV9oZmxpcCk7Cj4gQEAgLTEz
OCw4ICsxNDAsOCBAQCBpYV9jc3Nfb3V0cHV0X2R1bXAoCj7CoAo+IMKgdm9pZAo+IMKgaWFfY3Nz
X291dHB1dF9kZWJ1Z19kdHJhY2UoCj4gLcKgwqDCoCBjb25zdCBzdHJ1Y3QgaWFfY3NzX291dHB1
dF9jb25maWcgKmNvbmZpZywKPiAtwqDCoMKgIHVuc2lnbmVkIGludCBsZXZlbCkKPiArwqDCoMKg
wqDCoMKgIGNvbnN0IHN0cnVjdCBpYV9jc3Nfb3V0cHV0X2NvbmZpZyAqY29uZmlnLAo+ICvCoMKg
wqDCoMKgwqAgdW5zaWduZWQgaW50IGxldmVsKQoKU2FtZSB3YXkgaGVyZQoKQmVzdCBSZWdhcmRz
LApUYXJhbmc=

