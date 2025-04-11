Return-Path: <linux-media+bounces-29993-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 747F0A850C0
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 02:49:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B53E3BD6F7
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 00:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9552926F462;
	Fri, 11 Apr 2025 00:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="C4Hqh2V1"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020086.outbound.protection.outlook.com [52.101.156.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE412D7BF;
	Fri, 11 Apr 2025 00:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744332580; cv=fail; b=VVEpTX9t1DpyeoSJaJKCt2ATarDAg03CEVJMrVvoJUk8V9xhGX1DGfWhPGxMWvGrQ3d0LWNre1hQiPB34VwFtGJBDkYh4B3hUe3+RgObxqjkPsii4I1wAHINS/Jr8LdqUzJgvEh4oPuTHqlzMHLYBJoyns6kKVMHsLUCJcRXaC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744332580; c=relaxed/simple;
	bh=WOLnwbnrfze2cTYqW8ugkzc2Bm1Lkf3C94C7L37tGQU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=D3ZiLar8ptF6RaVsXgF0I3ASHzAbRnHfC0O6jonkzplZpxB/VX27CplqACaPB3fH7YTmarLxITVDPTzHrErpK1xEQ28tUfJvgVgzkV+wY+DpIUHv8YKKvqG/Z8IaeEPojsEQzTL0jQPPSZUkMjy/Zue9GD+FIt83NrzbgpDCEVI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=C4Hqh2V1; arc=fail smtp.client-ip=52.101.156.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QkDJyHzx1ql54gRI1Ttth58ifpTvsnbbVhi96O/rj69uoGO+BqJ5Y8USWzfcEYU+EyJza2qHcxTDsYppojxIo2a3Kle1eGopv8yxYfvFm+t7ua3XJWwTIHrWOuUrMmsdfrC1GWD00OwWdu7pqGZHTExSI2AG2u107CqQ6wTE5qDdT/CIdl65EhKmbbuKiTIuD+ydBYTAIEtscjTe/acgl794V3EUe945HZ/NzNAmNp0Mo6jlpSlBcCO0wZNH6z/XPx7uMgj2DXGVeND/IUw59kjakSfvDWMhevcRAmRpd2tUwAFYQ/rw1xvRMICyx9sjzHetOoWRVVyevFSpYMbxmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WOLnwbnrfze2cTYqW8ugkzc2Bm1Lkf3C94C7L37tGQU=;
 b=gxIqeTGiGc1nZPvR2AFmFtKpMRHdFixCFEbGv5Knx2gubKjPwxgRfHXr87U6t2vXSX5EujG1ikWnkn5WIkND8IpQsEEZ9FkiutpXQXCGWJE/oyPbdQFt0bEFWQNnmw8YSqWUiSb5R5/zittxQJm6RpDqfX8goa0Nz4G7+TSbtFvMoAePJghBxK2EyvuD2p79JoyOeNe6WheY/IaYqYbP67OqGCHF/+tGSOb6u0p3gHiY3bpTt+vWdNkNXKKPmq+vZ5qBb1ZdpJj7RSa0uAj+OnkUraMbLPDgJYn+BQf5BltNOcwlOQ/oWkXDr7S49FKmuTydo18H7hk8TlEEiUi6jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOLnwbnrfze2cTYqW8ugkzc2Bm1Lkf3C94C7L37tGQU=;
 b=C4Hqh2V1uXtwPn0sJweHKgamAhCDwqLTyWYgHLRhRl17zyBjTtGDx9GnreQpRkeFB0721vCblYSWr+XFGOJ62m8PYrPw+l3UX7VkI00a4mZCSRMEKgIwIGBXjcRhDFgQ83RbFIk3LftII95wcBy1juRJpt4bxchKhT+Fqd1ie0Y=
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SL2P216MB2867.KORP216.PROD.OUTLOOK.COM (2603:1096:101:284::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.24; Fri, 11 Apr 2025 00:49:34 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%6]) with mapi id 15.20.8632.024; Fri, 11 Apr 2025
 00:49:34 +0000
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
Subject: RE: [RESEND PATCH v1 0/7] Performance improvement of decoder
Thread-Topic: [RESEND PATCH v1 0/7] Performance improvement of decoder
Thread-Index: AQHbqcpCFfWvMwZkREeF+06Z+PoGIbOc15QAgADKI0A=
Date: Fri, 11 Apr 2025 00:49:34 +0000
Message-ID:
 <SE1P216MB130319B98B3A33A22CA8CFF4EDB62@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
References: <20250410034002.88-1-jackson.lee@chipsnmedia.com>
 <cb2266a3ff0cf9d57bdfdf3e88dc82c211d18e83.camel@collabora.com>
In-Reply-To: <cb2266a3ff0cf9d57bdfdf3e88dc82c211d18e83.camel@collabora.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE1P216MB1303:EE_|SL2P216MB2867:EE_
x-ms-office365-filtering-correlation-id: f243cb2f-10f0-4477-9a20-08dd7892ba7e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?OWprSUc2NDRySElYeDk4VDZDamN0RUlJQUtORkFnR3kvV0NTc3V6SDdod3BC?=
 =?utf-8?B?S2lDYUdiQWgwY21zbFZRYU5pRVBHbnA1SkFxRnNWVFhoKzJmQUI4d2UzdUNO?=
 =?utf-8?B?Y2tHOWh0bExoYk5QNmRsUzEwNFk1dGhaeVN0YVVYUmhZVjVKMmt2Sk9BeGdt?=
 =?utf-8?B?VElDUWE5ZjlLZklFOVN6eFJnT2Y0cVNERXFLYTZwd3FpalBjTzY2ZjBnaHND?=
 =?utf-8?B?MW1xV05rR1BNZHVmSHZsQno1bEgwWVVwSXpKSnVHb2p5U01HeXVZVUR3WEJz?=
 =?utf-8?B?NTg5OHpJcXozMnd2d3I4YmJDeGJJdi9PcEppTVdkcXFvTEVKQzU4YTJzanF2?=
 =?utf-8?B?aDlxQ052bG9ST0tWZWk5Ykh3aTFjbnVQNTZBTVAxWVRROFhsTGFnL3dIcUlV?=
 =?utf-8?B?d283L1ovZHcxejVGZVdYc0RCZy9HNUg1YWFVUW01RytnaVNQUGx3djRJalh6?=
 =?utf-8?B?SVRhNW81aUpld09pQzRpdEI5U1oxMkZnN3lBbnZuZS93ajc0R3lEUGVsbi9o?=
 =?utf-8?B?MmlsUGpDZ3NOeis4TTlRcXRBRXJYY1VYSUx6UzNINmRPb1RkYkkxZitlaDRI?=
 =?utf-8?B?SDI0RHQzUS94eTh0dkx6dlZXU3hWQ3UzWjErZHB6K0hlSi9iVWt1SE1KRXNv?=
 =?utf-8?B?TmMwa0ZtcnFnYzVPNi9ySkZERVNCY0h4UVBpZHZDZndjLzBSN3phR2N6WTE1?=
 =?utf-8?B?RmR1aUl6azNVbnoyRlQxSmVwNU5VTDJSVlFpVStrSmhRNTk4NlBaMEsva3du?=
 =?utf-8?B?UHdpOG9ud0FtaUxIRkRHUEZsbzZzV0t0ZHZYM1Vkc2w3U1JWM3Q4cDdnMWIw?=
 =?utf-8?B?Zmlnek1zdDhzMWhVeG1DOVhRSHozeHoxcnZUYnZHZTQzendqbi8rNjBOejBE?=
 =?utf-8?B?dk43eFliemZDVFpjT1VoVnpxK2pyOWlpNE9uQUh4V3R4SE5jckJIQmp5WHcv?=
 =?utf-8?B?SWF4Rk8zMkJkL0tnRHU4SjRuZktBN1prL0YyUjdscVlicWF5SUFQZFVXMkZQ?=
 =?utf-8?B?NGtXMEVOS0IxaUtzdXpuVHBVNmM4RllWY3l4dnhqNHZkNkpkRlN6QS96SUdw?=
 =?utf-8?B?RXZabUZBb2tIREZVMjM1Tkx4cHRKSFlrNUg2bFdHSHhoT09wMElwcU4xSHB2?=
 =?utf-8?B?TnpSNnJadTc4N0tHMUFFdTVoMFI0ZWxTei9lcFZmUmxKMEVzTzRaaEdVbGM4?=
 =?utf-8?B?WWZFRGhIbWZ3SkV0SnMzU1FSQU0yNHVXNUhGNldmL0VMUlJTZC9JTVRPeGtG?=
 =?utf-8?B?ckVRaXZBNmw5ZXVGQjRwL0RrSWEzK3h6MnBaLzBWTjBscUxodFExRmxJUyts?=
 =?utf-8?B?M3pHbitwelJtTFUrR005M2hxQzRJREdESFdzZVpyQ0kwVTRxK1FlMzlYYjlx?=
 =?utf-8?B?TXZldmsvcHlmcFhlbDVJRXR1SHI3MXFpcGxpNlFzYnBraU5WQmJCWnNWRjds?=
 =?utf-8?B?SDlaR0w1Tys5c0IxZlRPWXJOanluU2JvL05rMjhxekdrcHJ2a1BZaHVMVllZ?=
 =?utf-8?B?N0M0eXlKbnN0L01FT2I2RG5VN2dvbU1mUTFuTVAvL243ODNIRUtuYmJ1ZmIx?=
 =?utf-8?B?TWtZZm1SYkdRTlRuOEJobEVUeHI2ZGkrSUhQd01mZFI0MTNxWUpoSkJxMEN2?=
 =?utf-8?B?ei9yRGE4YlNManN3ZVpzS1pSb0FDSElrYmdWekZ3blhoOVB0YmVqSUp5YXBm?=
 =?utf-8?B?R1BkZXJlMzlHbHFRdWt1cTVpS3lBQkFjcDRTQTZsZkN6VkV2YUxCVkNidVAw?=
 =?utf-8?B?c0hiRU1teWhZNDhQc2sybzVSalN5U2dJb2NjbjlCSWNNb0tEMDVVYzYxZ1Rl?=
 =?utf-8?B?NTlBYTBKWTRGazl4VlhkYTN0NzVEOGZUcGk0UVVpbUs5VGt6alhvVS94ejJF?=
 =?utf-8?B?S0hqTFh0TlBXRGNRSmZoelFEMFpzS1NERytFeWdjUWhiZGkwOStpNEMvZExT?=
 =?utf-8?B?OWxWTXRhN1ZXazAweVFqc3UyNDBmMlRBdzU1WjR0WEZueFF6aU5yRFU5bzBU?=
 =?utf-8?B?VnZUR3l3Mnd3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bDY0ckZXa0JiakJ1MTlHNktHYkNvRlRqUm00YW9YT3QvTkxMRUpCOThUbGxT?=
 =?utf-8?B?akhDMCs4SmJqb3FuNGdQUmlaL24zVFJad0ZlZ2hGdWwwcmc5eVprVHVpZEQr?=
 =?utf-8?B?bWxERTRsWWZQVmxGOEhabW9Sd3EyVnUya2sxanUycGdKSmdVeWRXNVdZelEw?=
 =?utf-8?B?WmlKUmNaL1VVL1lrOUxLVXdFampienM0U2R5emRWcWsvZ2F0WjRhZ0xJa1Bw?=
 =?utf-8?B?VmxFM0U4MlAvWDA1Z1pOWVYyenVvYjlQd3YxdndMQWVYdHFENHhxdnEwcVdm?=
 =?utf-8?B?S2RHQWF2NDZ5NHlZNitOV1pleVgrYmE5UnR5OFN4RUVkbjkvR1piOHpLL0hQ?=
 =?utf-8?B?aTF2ZER4V1NmajlIU3FJUEFIZkYxT2R5dGkwUENQMUxmVDdLRllEcUVnYXp3?=
 =?utf-8?B?VEF3MXRCOVpwclF2b3J2b204SGNJc0YyeEtqYXRQeXdOWEo1dnVvd0R3YlFl?=
 =?utf-8?B?T21TRENjdm9aWlRoM3JoUVJSR0YyZk1QRENBNnpoMGxOOS8vNUtlZS9Ham9x?=
 =?utf-8?B?YnlSeWZEdGdxZld3ZEViOXlIZ005R1ptcFgyUlJLd0lHWmdlWHNmZkpEbWgw?=
 =?utf-8?B?VkhZdHQzUytJb3VmbjdNaG9EZ3BmTWVWNG1CdmtvUGt1OXhTUStVUCtWTko0?=
 =?utf-8?B?dlloWVJPYm8zdEREcGpJeGtWeUFxTnB0OTI3RDZlNzgrbmlKVW0zU0FSelFD?=
 =?utf-8?B?SlAxeWQyc2FsMWNZL2FXbVZKck9wVTBDaTZkdzRVQTkrTDk1T0lHZmtoaFVq?=
 =?utf-8?B?ZHRORVBZTFQxNjl0bU1ZSE5URzNLM2NEL1phTWhmRXQzNmVubEwzYXhVclJr?=
 =?utf-8?B?ZUtQNVUwUFk4VWZER0pFNURGWW1tbFlQZXI0cSt1MCtVRWV4LzUzcHNvM28r?=
 =?utf-8?B?am92dE8wZHJFRXlTZWQyN2tNdjhpY2NxZFRETkFHTTcya2N4MGFwYm1QT28r?=
 =?utf-8?B?Zml5cm1VeWVDVkE5bk1naFFyYkRJNzV3K1U3dGVmVTBob1YxYzY2eHZiRDZO?=
 =?utf-8?B?aHlpS2h3UTZrOGxhVXZHdzFuWUZlMllLaHdhU3o2Z1dyNTFwUGs2bFdST3Zn?=
 =?utf-8?B?MWN1b29vT254eHNURkdMdGpRMkltN2x3cHlaZWVRWkxiZGh3ZkF4eHAvVVox?=
 =?utf-8?B?bk9HajdlcWl2d3ZuRGpFQnl0am92UUplaWY0aFpEdXdSaElrYjJjc0VheHIv?=
 =?utf-8?B?Vkd1cmFRRkx3aGlXS3JReFRTQmF0YWNCaW0zYUlxaEw1TnhmNVVPT2Q1REQv?=
 =?utf-8?B?Vy9aT0pWRmw3cDVHdXI3eHhpdE50cUhtaDhCR0lFSzl0c0h1VjBleUJxZ2dO?=
 =?utf-8?B?cFFnWXRSR1hGZENQR0VhZVNoS0RSNzQ2ekhQczZHTnQxMzB3ZTczUHlZcGxW?=
 =?utf-8?B?L1ExZXZKWFh1SnNGemFRVWF2M1dXdWFGKzZGdFhSWGxjUHVMdk5UeExvUFhN?=
 =?utf-8?B?MlU1d2NabzUyQ28xejljQldOcTF1SDFxODljMTVwaTA0SlVsY0VZZ3pScjc2?=
 =?utf-8?B?YmdrNmNmNnB4eFdrejBkQzl1dmVrUFRrZjNVWW9ld1luR1VrQTZqZFRUV3k4?=
 =?utf-8?B?NCttY085cEtwV2tCMGorWkY3aXFJRFVKL0VwVk1RZHRpK0RaM0VLQ2szZlk4?=
 =?utf-8?B?MEtmbXJHZ05zNDVpc0JNb1MrN0Q2TkRzTjhrdldIbDJPQlFiOGRGTXNEdDhJ?=
 =?utf-8?B?Rzh1L2pjNUQvNFVQaUw0c1drcFcwRkZYcTloNy9ZK3lqQ3ZVaXljSy93UTQv?=
 =?utf-8?B?OEkzbzVuc1hZNXdndzhaWjE3MDJnMC9YemdJc0VKSXZaZkZ1TUQ3dnUxb1Rn?=
 =?utf-8?B?cVZzY2FWeGpOZXp0dklLWDZ6cG5FOTdVU3pUQ2E3aDhZWURxcXBKWWJGQUE0?=
 =?utf-8?B?SnVqWEYzR21hSTMvNEtweEJTazNsY0gxZnhwYmo3UFFHQ09rWjgvRGV1RVFG?=
 =?utf-8?B?M2VTTmdwQzdjbW9JV1J3UHFKSnd2QkxSMHk5STB6aUg4N094cWxaK3QveEsr?=
 =?utf-8?B?TVZaZmtwQ01RS0lxNXo2TS9jRkdMNU4xUFRWR0JGMnNKY2F1Y29JZHlHRjdv?=
 =?utf-8?B?a0p0RTlGdExSWHRsWGpJR3JqVU9obW5PakRncFZMSStvM0FNWmNLZzRtZDhz?=
 =?utf-8?B?emZpUTluUHkzY1RJd1BIQVZjUWtRd0lHUFNBUDBWcG9pcU50bGhFaWxFbUQ2?=
 =?utf-8?B?NFE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f243cb2f-10f0-4477-9a20-08dd7892ba7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2025 00:49:34.5774
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: grwr8XsgF3CDsyU9i6NX+RhQZdf7gSZy1h8s6WFjJ9Z78NRGiZgun1gD+klRSU7tNaZy75B3NWxAuq4Ncc9DvItg7JPeZOdWKJghr+oCILg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB2867

SGkgTmljb2xhcw0KDQpUaGVyZSB3YXMgd2FybmluZyBtZXNzYWdlIG9mIHBhdGNoIHdvcmsuDQpI
YXNoIHZhbHVlIG9mICJJbXByb3ZlIHBlcmZvcm1hbmNlIG9mIGRlY29kZXIiIGluIHRoZSBwYXRj
aCBzZXJpZXMgd2VyZSB1c2VkIGZvciBGSVhTIHRhZywgSSByZW1vdmVkIHRoZSBGSVhTIHRhZ3Mg
aW4gdGhlIGNvbW1pdCBtZXNzYWdlLg0KDQp0aGFua3MNCg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBj
b2xsYWJvcmEuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgQXByaWwgMTAsIDIwMjUgOTozOSBQTQ0K
PiBUbzogamFja3Nvbi5sZWUgPGphY2tzb24ubGVlQGNoaXBzbm1lZGlhLmNvbT47IG1jaGVoYWJA
a2VybmVsLm9yZzsNCj4gaHZlcmt1aWwtY2lzY29AeHM0YWxsLm5sOyBzZWJhc3RpYW4uZnJpY2tl
QGNvbGxhYm9yYS5jb207DQo+IGJvYi5iZWNrZXR0QGNvbGxhYm9yYS5jb207IGRhZm5hLmhpcnNj
aGZlbGRAY29sbGFib3JhLmNvbQ0KPiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOyBs
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsYWZsZXkua2ltDQo+IDxsYWZsZXkua2ltQGNo
aXBzbm1lZGlhLmNvbT47IGItYnJuaWNoQHRpLmNvbTsgaHZlcmt1aWxAeHM0YWxsLm5sOyBOYXMN
Cj4gQ2h1bmcgPG5hcy5jaHVuZ0BjaGlwc25tZWRpYS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUkVT
RU5EIFBBVENIIHYxIDAvN10gUGVyZm9ybWFuY2UgaW1wcm92ZW1lbnQgb2YgZGVjb2Rlcg0KPiAN
Cj4gSGksDQo+IA0KPiBMZSBqZXVkaSAxMCBhdnJpbCAyMDI1IMOgIDEyOjM5ICswOTAwLCBKYWNr
c29uLmxlZSBhIMOpY3JpdMKgOg0KPiA+IEZyb206IEphY2tzb24gTGVlIDxqYWNrc29uLmxlZUBj
aGlwc25tZWRpYS5jb20+DQo+ID4NCj4gPiB2NGwyLWNvbXBsaWFuY2UgcmVzdWx0czoNCj4gPiA9
PT09PT09PT09PT09PT09PT09PT09PT0NCj4gDQo+IFdoYXQgdGhlcmUgcmVhc29uIGZvciBhIHJl
c2VuZCB3aXRoaW4gM2ggPw0KPiANCj4gTmljb2xhcw0KPiANCj4gPg0KPiA+IHY0bDItY29tcGxp
YW5jZSAxLjI4LjEtNTIzMywgNjQgYml0cywgNjQtYml0IHRpbWVfdA0KPiA+DQo+ID4gQnVmZmVy
IGlvY3RsczoNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgd2FybjogdjRsMi10
ZXN0LWJ1ZmZlcnMuY3BwKDY5Myk6IFZJRElPQ19DUkVBVEVfQlVGUw0KPiA+IG5vdCBzdXBwb3J0
ZWQNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgd2FybjogdjRsMi10ZXN0LWJ1
ZmZlcnMuY3BwKDY5Myk6IFZJRElPQ19DUkVBVEVfQlVGUw0KPiA+IG5vdCBzdXBwb3J0ZWQNCj4g
PiDCoMKgwqDCoMKgwqDCoCB0ZXN0IFZJRElPQ19SRVFCVUZTL0NSRUFURV9CVUZTL1FVRVJZQlVG
OiBPSw0KPiA+IMKgwqDCoMKgwqDCoMKgIHRlc3QgQ1JFQVRFX0JVRlMgbWF4aW11bSBidWZmZXJz
OiBPSw0KPiA+IMKgwqDCoMKgwqDCoMKgIHRlc3QgVklESU9DX0VYUEJVRjogT0sNCj4gPiDCoMKg
wqDCoMKgwqDCoCB0ZXN0IFJlcXVlc3RzOiBPSyAoTm90IFN1cHBvcnRlZCkNCj4gPg0KPiA+IFRv
dGFsIGZvciB3YXZlNS1kZWMgZGV2aWNlIC9kZXYvdmlkZW8wOiA0NiwgU3VjY2VlZGVkOiA0Niwg
RmFpbGVkOiAwLA0KPiA+IFdhcm5pbmdzOiAyDQo+ID4gVG90YWwgZm9yIHdhdmU1LWVuYyBkZXZp
Y2UgL2Rldi92aWRlbzE6IDQ2LCBTdWNjZWVkZWQ6IDQ2LCBGYWlsZWQ6IDAsDQo+ID4gV2Fybmlu
Z3M6IDANCj4gPg0KPiA+IEZsdXN0ZXIgdGVzdCByZXN1bHRzOg0KPiA+ID09PT09PT09PT09PT09
PT09PT09PQ0KPiA+DQo+ID4gUnVubmluZyB0ZXN0IHN1aXRlIEpDVC1WQy1IRVZDX1YxIHdpdGgg
ZGVjb2RlciBHU3RyZWFtZXItSC4yNjUtVjRMMi0NCj4gPiBHc3QxLjANCj4gPiBVc2luZyAzIHBh
cmFsbGVsIGpvYihzKQ0KPiA+IFJhbiAxMzMvMTQ3IHRlc3RzIHN1Y2Nlc3NmdWxsecKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgaW4gNDEuNjI5IHNlY3MNCj4gPg0KPiA+ICgxIHRlc3QgZmFp
bHMgYmVjYXVzZSBvZiBub3Qgc3VwcG9ydGluZyB0byBwYXJzZSBtdWx0aSBmcmFtZXMsIDEgdGVz
dA0KPiA+IGZhaWxzIGJlY2F1c2Ugb2YgYSBtaXNzaW5nIGZyYW1lIGFuZCBzbGlnaHQgY29ycnVw
dGlvbiwNCj4gPiDCoDIgdGVzdHMgZmFpbCBiZWNhdXNlIG9mIHNpemVzIHdoaWNoIGFyZSBpbmNv
bXBhdGlibGUgd2l0aCB0aGUgSVAsIDExDQo+ID4gdGVzdHMgZmFpbCBiZWNhdXNlIG9mIHVuc3Vw
cG9ydGVkIDEwIGJpdCBmb3JtYXQpDQo+ID4NCj4gPg0KPiA+IFJ1bm5pbmcgdGVzdCBzdWl0ZSBK
VlQtQVZDX1YxIHdpdGggZGVjb2RlciBHU3RyZWFtZXItSC4yNjQtVjRMMi0NCj4gPiBHc3QxLjAN
Cj4gPiBVc2luZyAzIHBhcmFsbGVsIGpvYihzKQ0KPiA+IFJhbiA3OC8xMzUgdGVzdHMgc3VjY2Vz
c2Z1bGx5wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbiA0NC41Nzggc2Vjcw0KPiA+DQo+
ID4gKDU3IGZhaWwgYmVjYXVzZSB0aGUgaGFyZHdhcmUgaXMgdW5hYmxlIHRvIGRlY29kZcKgIE1C
QUZGIC8gRk1PIC8gRmllbGQNCj4gPiAvIEV4dGVuZGVkIHByb2ZpbGUgc3RyZWFtcy4pDQo+ID4N
Cj4gPiBTZWVrIHRlc3QNCj4gPiA9PT09PT09PT09PT09PT09PT09PT0NCj4gPiAxLiBnc3QtcGxh
eS0xLjAgc2Vlay4yNjQNCj4gPiAyLiB0aGlzIHdpbGwgdXNlIHdheWxhbmRzaW5rIHNpbmNlIGdz
dC1wbGF5LTEuMCB1c2VzIHBsYXliaW4uDQo+ID4gwqDCoCBpZiB5b3UgZG9uJ3Qgd2FudCB0byBo
b29rIHVwIGRpc3BsYXksDQo+ID4gwqDCoCB5b3UgY2FuIHJ1biBnc3QtcGxheS0xLjAgc2Vlay4y
NjQgLS12aWRlb3Npbms9ZmFrZXZpZGVvc2luayBpbnN0ZWFkDQo+ID4gMy4gTGV0IHBpcGVsaW5l
IHJ1biBmb3IgMi0zIHNlY29uZHMgNC4gcHJlc3MgU1BBQ0Uga2V5IHRvIHBhdXNlIDUuDQo+ID4g
cHJlc3MgMCB0byByZXNldCBwcmVzcyBTUEFDRSB0byBzdGFydCBhZ2Fpbg0KPiA+DQo+ID4gZ3N0
LXBsYXktMS4wIHNlZWsuMjY0IC0tdmlkZW9zaW5rPWZha2V2aWRlb3NpbmsgUHJlc3MgJ2snIHRv
IHNlZSBhDQo+ID4gbGlzdCBvZiBrZXlib2FyZCBzaG9ydGN1dHMuDQo+ID4gTm93IHBsYXlpbmcg
L3Jvb3Qvc2Vlay4yNjQNCj4gPiBSZWRpc3RyaWJ1dGUgbGF0ZW5jeS4uLg0KPiA+IFJlZGlzdHJp
YnV0ZSBsYXRlbmN5Li4uDQo+ID4gUmVkaXN0cmlidXRlIGxhdGVuY3kuLi4NCj4gPiBSZWRpc3Ry
aWJ1dGUgbGF0ZW5jeS4uLg0KPiA+IFJlZGlzdHJpYnV0ZSBsYXRlbmN5Li4uYXVzZWQNCj4gPiAw
OjAwOjA5LjkgLyAwOjAwOjA5LjcNCj4gPiBSZWFjaGVkIGVuZCBvZiBwbGF5IGxpc3QuDQo+ID4N
Cj4gPiBTZXF1ZW5jZSBDaGFuZ2UgdGVzdA0KPiA+ID09PT09PT09PT09PT09PT09PT09PQ0KPiA+
IGdzdC1sYXVuY2gtMS4wIGZpbGVzcmMgbG9jYXRpb249Li9zd2l0Y2hfMTA4MHBfNzIwcF8yNDBm
cmFtZXMuaDI2NCAhDQo+ID4gaDI2NHBhcnNlICEgdjRsMmgyNjRkZWMgISBmaWxlc2luayBsb2Nh
dGlvbj0uL2gyNjRfb3V0cHV0XzQyMC55dXYNCj4gPiBTZXR0aW5nIHBpcGVsaW5lIHRvIFBBVVNF
RCAuLi4NCj4gPiBQaXBlbGluZSBpcyBQUkVST0xMSU5HIC4uLg0KPiA+IFJlZGlzdHJpYnV0ZSBs
YXRlbmN5Li4uDQo+ID4gUmVkaXN0cmlidXRlIGxhdGVuY3kuLi4NCj4gPiBQaXBlbGluZSBpcyBQ
UkVST0xMRUQgLi4uDQo+ID4gU2V0dGluZyBwaXBlbGluZSB0byBQTEFZSU5HIC4uLg0KPiA+IFJl
ZGlzdHJpYnV0ZSBsYXRlbmN5Li4uDQo+ID4gTmV3IGNsb2NrOiBHc3RTeXN0ZW1DbG9jaw0KPiA+
IEdvdCBFT1MgZnJvbSBlbGVtZW50ICJwaXBlbGluZTAiLg0KPiA+IEV4ZWN1dGlvbiBlbmRlZCBh
ZnRlciAwOjAwOjA1Ljc3MjQxNDQwMCBTZXR0aW5nIHBpcGVsaW5lIHRvIE5VTEwgLi4uDQo+ID4g
RnJlZWluZyBwaXBlbGluZSAuLi4NCj4gPg0KPiA+IENoYW5nZSBzaW5jZSB2MDoNCj4gPiA9PT09
PT09PT09PT09PT09PT09DQo+ID4gKiBGb3IgW1BBVENIIHYxIDIvN10gbWVkaWE6IGNoaXBzLW1l
ZGlhOiB3YXZlNTogSW1wcm92ZSBwZXJmb3JtYW5jZSBvZg0KPiA+IGRlY29kZXINCj4gPiDCoC0g
c2VwYXJhdGVzIHRoZSBwcmV2aW91cyBwYXRjaCB0byBhIGZldyBwYXRjaGVzDQo+ID4NCj4gPiAq
IEZvciBbUEFUQ0ggdjEgMy83XSBtZWRpYTogY2hpcHMtbWVkaWE6IHdhdmU1OiBGaXggbm90IHRv
IGJlIGNsb3NlZA0KPiA+IMKgLSBzZXBhcmF0ZWQgZnJvbSB0aGUgcHJldmlvdXMgcGF0Y2ggb2Yg
cGVyZm9ybWFuY2UgaW1wcm92ZW1lbnQgb2YNCj4gPiDCoMKgIGRlY29kZXINCj4gPg0KPiA+ICog
Rm9yIFtQQVRDSCB2MSA0LzddIG1lZGlhOiBjaGlwcy1tZWRpYTogd2F2ZTU6IFVzZSBzcGlubG9j
ayB3aGVuZXZlcg0KPiA+IHN0YXRlIGlzIGNoYW5nZWQNCj4gPiDCoC0gc2VwYXJhdGVkIGZyb20g
dGhlIHByZXZpb3VzIHBhdGNoIG9mIHBlcmZvcm1hbmNlIGltcHJvdmVtZW50IG9mDQo+ID4gwqDC
oCBkZWNvZGVyDQo+ID4NCj4gPiAqIEZvciBbUEFUQ0ggdjEgNS83XSBtZWRpYTogY2hpcHMtbWVk
aWE6IHdhdmU1OiBGaXggbm90IHRvIGZyZWUNCj4gPiByZXNvdXJjZXMgbm9ybWFsbHkgd2hlbg0K
PiA+IMKgwqDCoCBpbnN0YW5jZSB3YXMgZGVzdHJveWVkDQo+ID4gwqAtIHNlcGFyYXRlZCBmcm9t
IHRoZSBwcmV2aW91cyBwYXRjaCBvZiBwZXJmb3JtYW5jZSBpbXByb3ZlbWVudCBvZg0KPiA+IMKg
wqAgZGVjb2Rlcg0KPiA+DQo+ID4gKiBGb3IgW1BBVENIIHYxIDcvN10gbWVkaWE6IGNoaXBzLW1l
ZGlhOiB3YXZlNTogRml4IFNFcnJvciBvZiBrZXJuZWwNCj4gPiBwYW5pYyB3aGVuIGNsb3NlZA0K
PiA+IMKgLSBzZXBhcmF0ZWQgZnJvbSB0aGUgcHJldmlvdXMgcGF0Y2ggb2YgcGVyZm9ybWFuY2Ug
aW1wcm92ZW1lbnQgb2YNCj4gPiDCoMKgIGRlY29kZXINCj4gPg0KPiA+IEphY2tzb24gTGVlICg3
KToNCj4gPiDCoCBtZWRpYTogY2hpcHMtbWVkaWE6IHdhdmU1OiBGaXggTnVsbCByZWZlcmVuY2Ug
d2hpbGUgdGVzdGluZyBmbHVzdGVyDQo+ID4gwqAgbWVkaWE6IGNoaXBzLW1lZGlhOiB3YXZlNTog
SW1wcm92ZSBwZXJmb3JtYW5jZSBvZiBkZWNvZGVyDQo+ID4gwqAgbWVkaWE6IGNoaXBzLW1lZGlh
OiB3YXZlNTogRml4IG5vdCB0byBiZSBjbG9zZWQNCj4gPiDCoCBtZWRpYTogY2hpcHMtbWVkaWE6
IHdhdmU1OiBVc2Ugc3BpbmxvY2sgd2hlbmV2ZXIgc3RhdGUgaXMgY2hhbmdlZA0KPiA+IMKgIG1l
ZGlhOiBjaGlwcy1tZWRpYTogd2F2ZTU6IEZpeCBub3QgdG8gZnJlZSByZXNvdXJjZXMgbm9ybWFs
bHkgd2hlbg0KPiA+IMKgwqDCoCBpbnN0YW5jZSB3YXMgZGVzdHJveWVkDQo+ID4gwqAgbWVkaWE6
IGNoaXBzLW1lZGlhOiB3YXZlNTogUmVkdWNlIGhpZ2ggQ1BVIGxvYWQNCj4gPiDCoCBtZWRpYTog
Y2hpcHMtbWVkaWE6IHdhdmU1OiBGaXggU0Vycm9yIG9mIGtlcm5lbCBwYW5pYyB3aGVuIGNsb3Nl
ZA0KPiA+DQo+ID4gwqAuLi4vcGxhdGZvcm0vY2hpcHMtbWVkaWEvd2F2ZTUvd2F2ZTUtaGVscGVy
LmMgfMKgIDEwICstDQo+ID4gwqAuLi4vY2hpcHMtbWVkaWEvd2F2ZTUvd2F2ZTUtdnB1LWRlYy5j
wqDCoMKgwqDCoMKgwqDCoCB8IDExNiArKysrKysrKysrKy0tLS0tDQo+ID4gLS0NCj4gPiDCoC4u
Li9jaGlwcy1tZWRpYS93YXZlNS93YXZlNS12cHUtZW5jLmPCoMKgwqDCoMKgwqDCoMKgIHzCoMKg
IDggKy0NCj4gPiDCoC4uLi9wbGF0Zm9ybS9jaGlwcy1tZWRpYS93YXZlNS93YXZlNS12cHUuY8Kg
wqDCoCB8wqAgNzAgKysrKysrKysrLS0NCj4gPiDCoC4uLi9wbGF0Zm9ybS9jaGlwcy1tZWRpYS93
YXZlNS93YXZlNS12cHVhcGkuYyB8wqAgMzYgKysrLS0tDQo+ID4gwqAuLi4vcGxhdGZvcm0vY2hp
cHMtbWVkaWEvd2F2ZTUvd2F2ZTUtdnB1YXBpLmggfMKgIDEwICsrDQo+ID4gwqAuLi4vY2hpcHMt
bWVkaWEvd2F2ZTUvd2F2ZTUtdnB1Y29uZmlnLmjCoMKgwqDCoMKgwqAgfMKgwqAgMSArDQo+ID4g
wqA3IGZpbGVzIGNoYW5nZWQsIDE3OSBpbnNlcnRpb25zKCspLCA3MiBkZWxldGlvbnMoLSkNCj4g
DQo+IC0tDQo+IE5pY29sYXMgRHVmcmVzbmUNCj4gUHJpbmNpcGFsIEVuZ2luZWVyIGF0IENvbGxh
Ym9yYQ0K

