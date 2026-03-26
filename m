Return-Path: <linux-media+bounces-57172-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEF3Fd13xWnw+QQAu9opvQ
	(envelope-from <linux-media+bounces-57172-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 19:15:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 93931339E1F
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 19:15:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7469D3055619
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 18:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F4A736E48D;
	Thu, 26 Mar 2026 18:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="vErkB6dm"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazolkn19011030.outbound.protection.outlook.com [52.103.39.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4108F3537F7
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 18:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.39.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774548288; cv=fail; b=AM1Xy+Ouq/hswmZetYp5rOSr2beM7yxrrIcNO/c8B0AgY1SczqBcdQ+uK1B1jDtEBF5YGez/7sOIhEjJkIRYxkmgof+uCiU8a1q0dnl51/WAAQWz4+vwJzLmZpiADy85itGRVdZPwcOm9ctvm3GO6M3BDIW7uWssYgMpj5JZ18Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774548288; c=relaxed/simple;
	bh=+UO/2QxMhO8v1Zrh7oIZZlingfyC8EUYuO0F3YbUxhM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RJszdJjzBskJqpzUaxhC2Viuw1pZ+Iw0YezyFt9gBdukC/JRpNRzaqKggWmjBN3TZBYtq98IKI39tgaK20OE5LBAMDzo7ELTEyEXdPLvsgI5Q9LarPKv5KnyWToDTi/IELZyrhC0E2nIwPpv32zcMOL8594EbitfvCQu4jGgKfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=vErkB6dm; arc=fail smtp.client-ip=52.103.39.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k4TvIxnCx6vSqNt6UQJzkKE7YB/kqS+xJE9cGjI4eQPQwCgwXdE+jEbRjZ8yJEoyEloJ8KwZzGyTT7IksutxCAO1p4gPTreAjAZY6OTIEc1+tF4UcXrb2hn5W2Qs516kclFTmt1QlunT9HI8reOE2qK0vbK9pUe1zum3ml3ulaAy3iVYzAzyje1iWn6GfijVTApmQOITr8eWHrsMMyAOltYoXxqhWVucBz7mG1PdjYLX1yzcDhGAfq3nwKdRQvEa3vRG6iBqAcdFgZasRIxlxp41uT/HuHTuoeX6YuVKi+ZoWJoDnFCeb4M8g8DC+cnTnytTr0evgzxHV1dcAHK7kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ycQsJI/xVjLGKWLfx+l5cV9I/jXwv/AScfWJ8Yp9P4=;
 b=eQsaGqOTeRxVwQr1JcHp2JtFE/uBtAZvVGoha8TRG58g/U7BSigHxPui8ZzQ+4F/iolxesoRFFkPhsK+4/Lnv2vyjJKU+E7wLzZZAvcmuidzPEmYO4iDDgX4uHRY2AEBSRls5uchH0NoXIWRjHAdZ/fxsfgEFtW+UGl8ihfDQCffUdlY37NhcB/geR1uZ2Mmo6vEUMmOCOk9jhL8G682QCz5LSyrWAujb4AUjr4wJ28X8xgAxD39bw7J05/cROcnCPR0iNxphWx3q6QlDj6Q+fni//ywCx8vEwRUmJiy8rpr5TsJ+8dIvtAf4x537HiTcsGP2JykHH/x2U+L4wKACQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ycQsJI/xVjLGKWLfx+l5cV9I/jXwv/AScfWJ8Yp9P4=;
 b=vErkB6dmnRXDPINYPl1mS+hS/NKllRAQGKjF8WtVd5uxxVjzAKLJAWHbno5QSWf0apJ/D+vw9lk9SkEEVQGs5hlfqIGzAlOxbbfanrMfU9qSLu8u+vVwbVAxtXFX/rsu1YjtNFG+qqI6bJRMQiX1UvafNO1Hfq/12OoaQ2XchXqGHZckXhJf1FH6MR8+RnAKbSyKXPr6NIcHLcCQVZhxanhqw4VisclMp/CEeif2gdgWUjtwc5OnXV7a/aj2oK5GiqrU41385pVI7ZLKpY8LIVtYHf4RCLLGiWD3L8/ie6YpkIGM/LF3S8kdAY9fs4ZFr6SZN2J6LKw3uLDgVWue+Q==
Received: from AMBP190MB2678.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:736::6)
 by AMBP190MB2444.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:6a7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Thu, 26 Mar
 2026 18:04:43 +0000
Received: from AMBP190MB2678.EURP190.PROD.OUTLOOK.COM
 ([fe80::a7fe:adaa:34d:6e13]) by AMBP190MB2678.EURP190.PROD.OUTLOOK.COM
 ([fe80::a7fe:adaa:34d:6e13%6]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 18:04:43 +0000
From: Michael Anthony <manthony.nw@outlook.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>
CC: Kieran Bingham <kieran.bingham@ideasonboard.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>
Subject:
 =?iso-8859-1?Q?Re:_[PATCH_1/1]_media:_dw9719:_Add_back_the_I=B2C_device_i?=
 =?iso-8859-1?Q?d_table?=
Thread-Topic:
 =?iso-8859-1?Q?[PATCH_1/1]_media:_dw9719:_Add_back_the_I=B2C_device_id_ta?=
 =?iso-8859-1?Q?ble?=
Thread-Index: AQHcvUjdLa+AMeRY8kGsnrfFFkF2PbXBGJgP
Date: Thu, 26 Mar 2026 18:04:43 +0000
Message-ID:
 <AMBP190MB2678B1B58D91EE699BC5D9DDED56A@AMBP190MB2678.EURP190.PROD.OUTLOOK.COM>
References:
 <AMBP190MB2678CBCD19A1B6416481EBB7ED4BA@AMBP190MB2678.EURP190.PROD.OUTLOOK.COM>
 <20260326174909.2746696-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20260326174909.2746696-1-sakari.ailus@linux.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AMBP190MB2678:EE_|AMBP190MB2444:EE_
x-ms-office365-filtering-correlation-id: fa1964dd-53e0-49e1-d509-08de8b62285a
x-ms-exchange-slblob-mailprops:
 0HFyhoHfXaQJbh6QH/+5hshXhBTPPviFvqs1U+ao0yrofa3nX6xo0Ix++oVNRocCCIB7nxozEeWXxMN4QqWQHJrV52blSW+KaPq5+W4DZ2GgnHC7m1cTAiFbHMm3qAyWjka3+IBUUQlTqc861Y4DocNmnP2KSXNjuHz6nHqa9n6EMt0+Z8+lkvqeHdV3lr8BC+8PA0Xc5W81UM3g7QXv+tT335cd3mauZW9dl1cTG+KZTMhbIDEbyywojUX1COIVwwHzSnddCZBGbvxYUDMegpEbSO79nrBt3keRlG1w16BMJSaKeHrTty+XfBA3S71LEXraKJTWoAQmsmJ608SuWvcNE9gdsQrN4xXHR8YSGpbXYDrBIaSHzEOcVVRf5f8R1NbVltwYxlxLaTpwa9gJUoI9/a6AOBByVyjm0u0gghgdbLRlktHrHh1wI/u1Ko26oiphcS9ahVUwA6dzET6Kr7U4n5ayD7pj/VucAkA+xMMDxJPR/M0IGEBTyDctovwBH6QKMI5XqYC0+0yFJitV2zfOVMyGd1Z+GOq1R82EqW+ykDIXDTltorDmDN/MEeGk9RakF86kS04fx4J48nC4Ui0yCl0YZVwaL1BBoTRKeKAk0b1TJ29S0Kqnb6kOVySLaY+t9t/VjZAFA5TSIaWfnFouRg01OQASHnMPfI7fe/v/iwPP5Arr4novieEr4To2FRGUXXsZm2BCT2E/1W1yZlubiPSpCCDX/PAAMeRWnbCS2h/DAeH0L6RVuEQXZSkEXuC+PWLPzBQQYuGe/plAlPGaltMQtXtnkuhRfzwbd2lQhAOmlHnV5KnczcwD8gyXmtgO8+61ujGvPw5eYj6zlYqC9eHpgyID/DBYnYNlHbO9lHRUg3+bPMR8ZdATLtMZCHv02VscJBM=
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799012|15030799006|461199028|19110799012|31061999003|8060799015|8062599012|37011999003|51005399006|25031999004|10035399007|440099028|4302099013|3412199025|102099032|1602099012|40105399003;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?57kPzfCuDpadm8upBRLeyh71R/i5+9+9L3riNio2em0bLNRC3gF4iFcU7X?=
 =?iso-8859-1?Q?NeTr74XoqP4XbfrU6HNHF4uLpTwrz5lXza5+M+V60QiXTAHgRn59PxXTyt?=
 =?iso-8859-1?Q?zI5AxzS7+f9Gj86823hnoUAmzG7wpckYwyn7NGq6mbLmlvbIagfNnS4Lhb?=
 =?iso-8859-1?Q?MGaZ3imxHXwAfxlv2uWV1PiMLf5+LnsXmPicp94rCdyO5zwqOCJANt2YzR?=
 =?iso-8859-1?Q?ZBTsM4Jeck9Cuiu42zUY9Gqe7NAE2r9sq21fGTZPgBKC7MhE6udq5KmLlv?=
 =?iso-8859-1?Q?r+TANHSu6ZR7PypDA+2qZHP9o4UqKscYWYPk7FBpuelL8lmafged8lAIOj?=
 =?iso-8859-1?Q?1Y2N7TuDVEPnM0MJe1/ucv/89eD1UOYg0RvPz9xE3lZneV64de0KqFLsro?=
 =?iso-8859-1?Q?+xWwqu7la5PZF1Kd2qm6KotfCO70m1aVUHBEUODjLRyNx89qNzIjytv6eJ?=
 =?iso-8859-1?Q?o0j3/a5R37dGt3Q4oj810R6FTXgojLSrmGILCQpgRXrMdJkNW1Pep4kWF6?=
 =?iso-8859-1?Q?I8XQkwyKslLAzkgblO+1nKSGJ+U4TXGtiwCqzzSEeS9pw8T9QQ+p7T6W0Q?=
 =?iso-8859-1?Q?xiAUNdm4jcriEPBt+7uBedhPQybF1fitFT2RsLZYOSnU7//8OQh5NgihSe?=
 =?iso-8859-1?Q?pxTNitFUqLazJM3d9ectZT+lamhdQjUo9QUCynkcbv4FI5sUnD0HSnD6YW?=
 =?iso-8859-1?Q?6UhMj0W92iqhg8tHu3t9KzQ39wiS5xuddbUnidEDUDtJg+boWXv+4koa/T?=
 =?iso-8859-1?Q?TwANnGkMmH+DodjMQ6uivc9TJfG8mH7GeCEKEFuEh4Ii/bVcx3mj4YEQ4U?=
 =?iso-8859-1?Q?MI3IIdC9s32AaOXvh5pJbiinzSkHfn0sjSDtJsuzJq/uWQzfiY9S8Y9k1B?=
 =?iso-8859-1?Q?2M2uE21+/qisnohzGrohbsV+WZFrMhKs4q5G5WEhe7yI2BUYSLkHx/+icr?=
 =?iso-8859-1?Q?pWtmd4IFnpFUAanHix8a4bAzRw+WA5EYcyywj9uS8jMaFwNvmTp1SG8QV1?=
 =?iso-8859-1?Q?Dq/y6R6IHZDMFDYO9hvj7Xi+cLE5t/FpL4k2kRxJNWpEJleGRyHyZ5iOeP?=
 =?iso-8859-1?Q?3kx9+ZIdXcn6qxEbraJ8hf+jZaOAGIBt/TeWHCyE/nU4c8gG+7xs7qI1Lg?=
 =?iso-8859-1?Q?NxKtlaXigo+XBIovUPOK1lIJCiFRghINXpfJLqz7IxGCty/KYd?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Bo8mEElW9JuJ8Za/UFRODwvfFxk+i0OpGu1FxYs/WcEK3LWmVSWMCfbaKZ?=
 =?iso-8859-1?Q?Q/4oBDI/yXVKv7zWD72KshRNxAnKtluRmNKtenIAYLDurVZZavXplN8xxV?=
 =?iso-8859-1?Q?aL+TMUFD1ltQ9zx94szDny9Gfz6mDl1mH7+edsY9hFK1H0QLJ/frrVTjle?=
 =?iso-8859-1?Q?52gE5kvZG5m7+1q902fDkhFQcWKhSo+gJ7+9KjvSD71A2mSKBsE3R/OXJz?=
 =?iso-8859-1?Q?XBeyduCkAtjluRzQX7ybixD0mypPKsyPtU2gqlvEXIIvxPIX5qq6uk5Il8?=
 =?iso-8859-1?Q?8vUjQIyQ9aGFvEP7UNB3Df7/+xEH9CyeiimG/SuUtWWbLOK7X3X5Os8NvE?=
 =?iso-8859-1?Q?3bapoHTX0Hj0ZOUavUuYoHDoCt6Wnfip6AM1VJA45Zk8s0vKjKNE79Trd/?=
 =?iso-8859-1?Q?dPn3BM4bPe/a48ojVKcwFi9gZV/IdOceMd1qeKLqtE3p+itfcUMT4VEwkP?=
 =?iso-8859-1?Q?Ax6U9E1/o3iFaNW3vKfPkmB0XiklteoNX9Cy/mzBRbENGrHSuwIkO6D70d?=
 =?iso-8859-1?Q?/r+qOKC7pC5Sj9Nw6i5oGRw3edQsYZkchxQ37Axrtebe3Kp19JLSN/P/96?=
 =?iso-8859-1?Q?/aP75LxBmRlBpEb5iLVlrZgMFHYas5uAvTLUR79fvHftA/e3dU7DywXu+x?=
 =?iso-8859-1?Q?MtR+Fq6rgPKdPtsLHCZQvx8ia93QaSON+otW8oPp4BeoZaAVxCZDlSpugL?=
 =?iso-8859-1?Q?TfEXV40WT/oQzgl0n3HXWRQuCar39AajV5KBdTbK7qpFqpclLAxnuBAHUt?=
 =?iso-8859-1?Q?rZces9OwUMh0WsJM0yFJBAQUC/TvKRwLyObzRhXwEMDx8FydvBWH7e95D5?=
 =?iso-8859-1?Q?t/TwbA/z4Axs8g6e/bYPu/+OBTPFA5wtKkOuQxW6Dw+YAi5x/ru2Z95+Yg?=
 =?iso-8859-1?Q?yr3+I3/wU38oifg+4VzXE80Yh2VFOR0Lcd5M78ZywTaUpRmPUlwaHI5/rG?=
 =?iso-8859-1?Q?kI0QG+bs8lRvA3IhVqsrvNdX/HIAq3tj3lNo/PNksLK0EO4LpjVvz9bLqi?=
 =?iso-8859-1?Q?y/hfngMrvIyIX8WLSKBGxv4TESbLGuujcDb4mkuzuaaqWbas4QEAWkI5Bc?=
 =?iso-8859-1?Q?k3kg1h2IaquU366nSwmmRsTcrL7GuIv8RVB3GlPrasI8f4aIxMjj6aSTLJ?=
 =?iso-8859-1?Q?8k3cpF3e2tcYwV8xMWV6fT2Mxf08FJKTzbGTDpGl1YxorAKThPSe0gABOQ?=
 =?iso-8859-1?Q?q/pJ0IrkY9UM8Cclyu2WsH/n2dEiugOAKP7bsE6tHQK9xJDdd4K4Ut4bNY?=
 =?iso-8859-1?Q?5e351INCk23lSwMQmt12nuMC1dGq9BHzM0xcrQgKYxxkhJMv0TMOYFDSju?=
 =?iso-8859-1?Q?95nZQOO0MAVzGcPmNVxrs1lXHl3CN/lTFgB1yUC1+ClJuMG2TFibUrodKG?=
 =?iso-8859-1?Q?2f4kSQurw+02FU/iMG1fANMiJMBHismgrjeS4YckwfNe+TM7cL6VfqOGQr?=
 =?iso-8859-1?Q?eZXzjZvpMNM9XjfwMC6w5uCztc+ZipJqF7McMgVfHVL7wm7kR+3GMp1qaO?=
 =?iso-8859-1?Q?E=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AMBP190MB2678.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: fa1964dd-53e0-49e1-d509-08de8b62285a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2026 18:04:43.2196
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP190MB2444
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57172-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,xs4all.nl];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manthony.nw@outlook.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[outlook.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:dkim,outlook.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,AMBP190MB2678.EURP190.PROD.OUTLOOK.COM:mid]
X-Rspamd-Queue-Id: 93931339E1F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari,

Thanks for replying to me.  I am new to linux and not sure how to test whet=
her this fixes the issue.

My report was based on this being the only relevant change that I could ide=
ntify between the working Fedora Kernel 6.18 series and the Fedore Kernel 6=
.19 series that stopped working by searching through the history on the ker=
nel.org website.

I have reported the bug to Fedora as suggested .

https://bugzilla.redhat.com/show_bug.cgi?id=3D2447694

If I can provide any information from my current working or not-working ker=
nels, please let me know.

Michael





________________________________________
From: Sakari Ailus <sakari.ailus@linux.intel.com>
Sent: Thursday, March 26, 2026 17:49
To: linux-media@vger.kernel.org <linux-media@vger.kernel.org>
Cc: Michael Anthony <manthony.nw@outlook.com>; Kieran Bingham <kieran.bingh=
am@ideasonboard.com>; mchehab@kernel.org <mchehab@kernel.org>; hverkuil-cis=
co@xs4all.nl <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/1] media: dw9719: Add back the I=B2C device id table


The I=B2C device id table is necessary as the device may be, besides throug=
h

system firmware, also instantiated in the IPU bridge so matching takes

place using the I=B2C device id table. Add back the table, with ids for all

supported devices.



Reported-by: Michael Anthony <manthony.nw@outlook.com>

Closes: https://lore.kernel.org/linux-media/AMBP190MB2678E7DC048409068260DC=
E8ED4AA@AMBP190MB2678.EURP190.PROD.OUTLOOK.COM/

Fixes: 15faf0fa1472 ("media: i2c: dw9719: Remove unused i2c device id table=
")

Cc: stable@vger.kernel.org # for v6.19 and later

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

---

Hi Michael,



Could you confirm whether this fixes your issue?



- Sakari



 drivers/media/i2c/dw9719.c | 10 ++++++++++

 1 file changed, 10 insertions(+)



diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c

index 59558335989e..3b7ba88fd67c 100644

--- a/drivers/media/i2c/dw9719.c

+++ b/drivers/media/i2c/dw9719.c

@@ -439,6 +439,15 @@ static void dw9719_remove(struct i2c_client *client)

         pm_runtime_set_suspended(&client->dev);

 }



+static const struct i2c_device_id dw9719_id_table[] =3D {

+       { .name =3D "dw9718s", .driver_data =3D (kernel_ulong_t)DW9718S },

+       { .name =3D "dw9719", .driver_data =3D (kernel_ulong_t)DW9719 },

+       { .name =3D "dw9761", .driver_data =3D (kernel_ulong_t)DW9761 },

+       { .name =3D "dw9800k", .driver_data =3D (kernel_ulong_t)DW9800K },

+       { }

+};

+MODULE_DEVICE_TABLE(i2c, dw9719_id_table);

+

 static const struct of_device_id dw9719_of_table[] =3D {

         { .compatible =3D "dongwoon,dw9718s", .data =3D (const void *)DW97=
18S },

         { .compatible =3D "dongwoon,dw9719", .data =3D (const void *)DW971=
9 },

@@ -459,6 +468,7 @@ static struct i2c_driver dw9719_i2c_driver =3D {

         },

         .probe =3D dw9719_probe,

         .remove =3D dw9719_remove,

+       .id_table =3D dw9719_id_table,

 };

 module_i2c_driver(dw9719_i2c_driver);



--

2.47.3




