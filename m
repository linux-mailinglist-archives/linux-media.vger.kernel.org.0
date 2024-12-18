Return-Path: <linux-media+bounces-23683-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 333B99F5D35
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 04:07:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B79F5188832D
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 03:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 578F214A62A;
	Wed, 18 Dec 2024 03:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="dAK1E3uN"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020078.outbound.protection.outlook.com [52.101.156.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB9314A4F3;
	Wed, 18 Dec 2024 03:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734491183; cv=fail; b=XqEyQ1zGpXBXoSGoQeFbZm4OjvfVosmSDQPbDMEdqzI8467FQYhO5CSn7jiwKv0tJD5yVcTbNpHE3LcRsEbkIGlqMuA+zhoovcR/KKFZxyS1LMkpLyGZGovhq+w4xQ1KgWEfND2f+3vaOnSmcM5CLemxmAtyBvl+6vhC6pEE6Fs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734491183; c=relaxed/simple;
	bh=DVvtRO91VZgZPMRkxvA7Pcrn3PR88M5evqwUMn7zF9s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gvQRE1uwxs5GM5QSzYrq7uCMEN9nZJeVvJUCKj77R/r7l3o/3Tpu0v8XDlcfOpS5NaG61oc/dgb1RYVPlleM3fI2I3uOMUYFT4FBRlX1b+VjA6fq7hDbJx+77fFSQHH9D79X1flLVBFVIMJpTaryT01nJFb9miybZ95qgsJNn4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=dAK1E3uN; arc=fail smtp.client-ip=52.101.156.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b5STLB9h2xE2R3T9hBDWH/maJyTvoF/uZXZ+TVpGWkud/EIcls+z2epUro7OVqTBwgQTzRS9fHu1ZuOh1huxY29MWYQTYgx0E0Xyx/gcAEKVwzvUuAkBpKneWGDxF9MNvQHxAYP0ejdNLRS4s4SztCEAxZQ8XpypbjyzIiW8iYFjdNdFLfwHmg4HIXwISOZ5iyHYAzekX8QDCdHq4BohKI+b/DfsFj6Me1FBRguh7HJ8evUfTcHkPc52VXj+eaz+NOBpTWvwep/typoCG3LQDLb3K0h8EuawiHJFDOYuP5Wl0DtSRdzGur4aFbW9UEj6FI9mBDmdZakkzzo5ErrV7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DVvtRO91VZgZPMRkxvA7Pcrn3PR88M5evqwUMn7zF9s=;
 b=dEMjAa9QiIbEyGvN4MUil+cuaWVeNRJqzNWfFhh1NRMu6guKqZQxkv54XyJs6o10g4G2qLoOrEiX+hTYgJwxEjmypRMbOvhk0UVbuinEF4BKVk1IlKQiO+P1/C97/jSdNnAE87UV34XPGe9VU/1IoTLTjfOnq2MZd8jl/IgEDbKDUUJirTSOBFkuraUtZzns+syQMdtSHeVi1BRhqjEiM4GToyStcU+b95CQluroHOTZO4PY3btlJ629ymsN+tTg+cp8WWA9AUtMaxmZGOOx0dj1+Ij4tcI1G1yyZ83W2U48QeNQIrgR1pRXhW5TBHQZLN12MLApCV517tK3EhjOyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DVvtRO91VZgZPMRkxvA7Pcrn3PR88M5evqwUMn7zF9s=;
 b=dAK1E3uNF8insOQ4p56pV9kGpT9L96TwEtP9MOqWvu24Gk1o7miYZlCjfGTVH0k7Ky1hh5cmAQuDq5eGfzGLVAB87LH7rkQzQS/HaA9ADsHnnRFsoognzui1LDDPE5np42IV2VG3Fvz8HQRS20FmKKDUcCz9vi/FOxqU5M9tj+w=
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SL2P216MB2271.KORP216.PROD.OUTLOOK.COM (2603:1096:101:150::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.22; Wed, 18 Dec 2024 03:06:19 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%3]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 03:06:19 +0000
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
Subject: RE: [PATCH v2 3/4] media: chips-media: wave5: Fix hang after seeking
Thread-Topic: [PATCH v2 3/4] media: chips-media: wave5: Fix hang after seeking
Thread-Index: AQHbUD9a8h/0l8+p4UKDr3Yjmxqfk7LqeNMAgADaMFA=
Date: Wed, 18 Dec 2024 03:06:18 +0000
Message-ID:
 <SE1P216MB130351C7E0B35C4A51F0C23FED052@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
References: <20241217045125.58-1-jackson.lee@chipsnmedia.com>
	 <20241217045125.58-4-jackson.lee@chipsnmedia.com>
 <8d39ca4fd9dee36bd5ee1b8184018e8867195bd8.camel@collabora.com>
In-Reply-To: <8d39ca4fd9dee36bd5ee1b8184018e8867195bd8.camel@collabora.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE1P216MB1303:EE_|SL2P216MB2271:EE_
x-ms-office365-filtering-correlation-id: 62cdb3fc-28e6-44c0-a4ea-08dd1f10f196
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?OWs4dk45VDNMY1pHWFM0NmlsOGVweHlKdFBjYS9LczM2cjRFclNmRWVvZXNj?=
 =?utf-8?B?R2J0Z0dRM0QyMHB3TUZDbVN6R0FmdjdsYm1IZ0R0R3hRN0c2Q2k5TTlMeWFQ?=
 =?utf-8?B?MjdkZzNYQTk1ZHZNYnpvNktyaG52MnlhYmRrSmM4c2l3d0ZvbFNwRmVINTcw?=
 =?utf-8?B?bDRQOEZIQVQ2aHZlQ2xlbTIzSVFiQ2QzVXVXOFJqSHFEN1hCUStXMnVpTzRN?=
 =?utf-8?B?T0V5eXZ0VElEVVhuYm9FNGtvaVVrbWlFenh1aUx1MzJjTGN1ak55MkxlTnRq?=
 =?utf-8?B?WjkvaXNwVjd5SHBkOWt0bkJNY3RJbGFZMElLVHE4cS93RnN3NGRMdTJPOWlT?=
 =?utf-8?B?Zk8zdjVXZy9lNHVUMjRwL3dvWXJaSy9Oc1k1Q3VSVTl5N05jc1NhNlFOcUIy?=
 =?utf-8?B?VVhFS0Y2aVlTTFlmUWZud0ZHT1NINUxxNldUT05IelNSRS9UZjh1SWQyNnZ6?=
 =?utf-8?B?bkhGSFN5c3RVM1FHWFAra0kwMlVVWG1NNmRGUk0yd3NPcWVpNGVBMjE1Z001?=
 =?utf-8?B?WjVQNHZLMzJ5Vi9hazdyeko5ajdHaFJVdGk2aFlUTHVVTUt1K2JXVFUrVitH?=
 =?utf-8?B?TlVjS3BKcWs2NE01M0JrVHRSRDl6clAwajRRQTg1eXp5S0xOZ0VqaFRSaXp4?=
 =?utf-8?B?b1FsbmxPcXdRRnEwT0NMUldtQlp0NEhMQ1BFRFc2M2ptdWo5bWVUclFJcGpT?=
 =?utf-8?B?NzFPYWdReWU5ZGRYbmN5bC9yWHN2NDFsWnFUQmppMGdPOWlkZDNWQWlTT0J0?=
 =?utf-8?B?MmJ0eHZ1a2J2SFJCMXlKaExmQTd4NHU3WHp6Zis1VkdxY0dnRnRzS0N5dlc3?=
 =?utf-8?B?WnErVWl3bEJQTXZweHhNNS83ZVlNNUNCNm9obEVhU0hJV0RuazJrUjZxU1B0?=
 =?utf-8?B?a1pFOFB2ZDhqY3ZhbWpPaHlyNytQQWsxUTlndEdpWVZPbEtWV2Raa1huWEtB?=
 =?utf-8?B?UjBPZkRqckFYZmJDTE1SVDBWRit4dkFJeHdpZmRGRXhScVFMNWluUEJkMlI4?=
 =?utf-8?B?U2xLdEFDVDl3V05KdWhSdXdBck41WVg3QXljbk9rcVJldkc0VnJBL1ZxNWo1?=
 =?utf-8?B?K0t5MW94VjY3UHcwTG12RzNJdC9BZmN4MmlCbkdWM01pcSt3bHg0c3NydEJv?=
 =?utf-8?B?TUVLVS85eCt1MCtocnR2S0FlRC9tellWRjQyVG9BV1R0RGFlWmMzYkhwck1Y?=
 =?utf-8?B?Q3YyQ0lNejMzTi8ybDcwM05vaXp3bFZhamkwV2lNdFBRRGl5N3FPVHpVa1Vy?=
 =?utf-8?B?WlRiNUNXWldqbHNjZURZaEZ1OUp4QThXSW10Y1pRbk01Nm1OeDN5THd0NURG?=
 =?utf-8?B?QjVhTllYSG9LTjZoRStsSEFyMFJHUjJzT2RmWTIxWGFPandoV3p3ckJRRk9v?=
 =?utf-8?B?OEZWT2VWaXVlR202M1pNY2pRZkUvYW9VSHBSRHRMWXVkbExHYTg0TVRtWmpF?=
 =?utf-8?B?L01OOWcyNXVrdlNFUWphRnczaWswbUVMSXp6YWRoWjd1cmJSNzRiR2VObkJ0?=
 =?utf-8?B?OHlSVGg0N1FSWjI5Snh3amIrd1NZampjbnQxN2xUVE9UYUdQRTZkVXNXT1Ay?=
 =?utf-8?B?dGtHTWQ0cWl0VHhmTXMwbkxtLzNvNW1SMmZ4TXdxeGFZcks2alYxMEd0T1ZL?=
 =?utf-8?B?ekJySGtKMHRDaTRPeUNOMGNQS1NoV1pUbHl6U2lYYUc4MjZhcWJ4V3hQUmNM?=
 =?utf-8?B?aENaWUh4SHdmZXRZa3MyOVJ5VXB1VHpnd2FqMnBVK2xDdWdOdWhBTXdhQlJi?=
 =?utf-8?B?MWVUeGpZZFNQR1JDTk9oWk5nVEt5d1g4b2ZUL3JNUHJ5MTByNXlhVkFWWk5n?=
 =?utf-8?B?ZUNPRzZQQU1maDR5czRWRGJ1blY3N0EvbGVKU3JrcE9nZEUxSWhoNXdwZ0wx?=
 =?utf-8?B?YUpRTzR3QkxvQkxyNkI2alFsOVI1OFMzYVgrTklFU1Q5M0N0aXNEV0ltU1RF?=
 =?utf-8?Q?TBHJnPUqfvljcxXcAXuoDdd7kV0ZaINY?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QTdDbVdxbG1SZXJoM0l1aStDN3BpQ2hvOW1RZFY5RlExajg3b1VzUStSS2hI?=
 =?utf-8?B?ME9WSnZURldxWExnc2tCcWhpbjBiL2FHakhtdE1PcTM4UG55VytNZ29nSHc2?=
 =?utf-8?B?R3pDQndpa3RlMlRvT2VRVVkrY1ZOaTcxaUpPeHdjMER2WS9PZEhBMlQ3TW83?=
 =?utf-8?B?MVVaRzhSZCtTQUZvMEhyek1MWTFIZFhUNkFuNjRYVTRNd0xXTm9LaTJXdXJl?=
 =?utf-8?B?ZHdjdjltL0ZialZvdmlGY1dQOHhsZTlaRW52WkRNSDcwVHlrbFN1c3lNK3ph?=
 =?utf-8?B?cjVGN1VkUEQ3aWI1Tml3Ym1UeUtlaCtaU2VTaFNJY0RoZlVyZ0ZLb2N4ZE1y?=
 =?utf-8?B?TnppdmdGR1p2Mjh3OWRjbkFqNzdJdWVRUnpXbUJHVnZZU0ZoSGhGbUtGWitl?=
 =?utf-8?B?L3VpWTY5VUlpeFJGL2ZBbkhUYm0ydFFqWFpsc3pnNUpUNExrakdjMCtaWUcw?=
 =?utf-8?B?K2l6MFhEbmlnaGJOWEw5Qk5YaUxzM1VkNG5YV2FnMWZzMStpS0Y5c0I2Um5h?=
 =?utf-8?B?N3VJMk5aMHljSTVyM0hvc0NPMEVjYnJDNGl4eVBQNXppY2NKL2QvSHpyRlFY?=
 =?utf-8?B?UUxRMmtONXprZEdlMzZGUjdSejJhNjc1eEgrVFpSVW9nMHUraTNnRkR2Qyth?=
 =?utf-8?B?ejcwQ2ppcmpodnpsb24yUmRvYXh3ek4wZlpvWjZGVHUvY05GTUpDWEFadWRI?=
 =?utf-8?B?TmVFVndHY25nTlR6ZHhONGc3TThrR0NxQzFqQzlMM3g3OFZGbWpFVTRIVVBv?=
 =?utf-8?B?dlgwYUJRb2ZEOE5HMDF0WTFqYXYwTVhRSXJmWWxIWU5FWDVMWDNZa0pzRWFQ?=
 =?utf-8?B?c0ZZNmJYNDRxaHNoZ3d3bDUvRTFrK0JtTzdzdmQ5Q3RoWVpwcGpabXhDTXNH?=
 =?utf-8?B?RXhGKzJTTGtzaWNsS3RNRU9MeWhtcmI0WitoZWxoL1BSV0xqdXEzVkxZeVc1?=
 =?utf-8?B?N0wrWGUyS21xOFN4TWgweVZaSW9rV2xDcGdxSHFXZW1PRG9ZZVFGYzA0dGNt?=
 =?utf-8?B?S3YzZlN5cmVpN2psUmYrZVp1cEtyK0ZqRTdKSEp6TGZQVk50TTF0NDNSRWVD?=
 =?utf-8?B?YU1WUTI4dzVuSjdjaHRhY3lJRmlOSlVJWURoSHRNam1KdlJqc1E3ZGZ6Zm9E?=
 =?utf-8?B?RmxZV2RTc3NuSDlFeXZZL3J4TE1wVmZkQmRPU1RaTXFVVWg0ZWZiNFdraVdW?=
 =?utf-8?B?OE9Tc1FBOW5wLzdxWjRZcXM2WGhPZzMvN2pvd1ZlMmNMNmpxazZtVm9JaVhN?=
 =?utf-8?B?NkJjNUc2UndoK21EOEdodWx1SXVrN2J6eG9DdFEwWUdaSUh2YTJyZFNhcGp4?=
 =?utf-8?B?T053QUwvanBHSDIyRVZSNDVMbHNiczV2bjV6UTBkU09hS2dSakN1OVdxcEtZ?=
 =?utf-8?B?aVVVMEZ1UmtwNk52ZW9NQjE0ZjJWM21wYXdBbU9OY3FTY2lHRU80NVl5eXo5?=
 =?utf-8?B?N0R2MkNqK3B4Nk9tZjRjT2svN01Bc3E3c1lLZWJ0MnRWV09NcGNKUVZ1c1Bu?=
 =?utf-8?B?akRwVy9sdG8wbC9WZSs1SUs2T3d1KzZ5N3BYMWFMODk2eTErQzVVZ3BWbW9s?=
 =?utf-8?B?b2Nqd1hyd016ZlJvVmQ0VXFDREUxM1NKcWlCSnNVQ05mOFZTZ2luNUN6Q3Fz?=
 =?utf-8?B?Q3ZBTkJwQzNZeVZFcWtHRVJnMUZncFhpRjBLaHFldHRFYlo1Rnd4YU5iVFlS?=
 =?utf-8?B?Nk5lQzhiWERZbThUdHh0emp6dUgrWUwzc2lrM0g4Y25JK29yWTBWMzlIREFj?=
 =?utf-8?B?a1VyOFMvWmY3YWVpcTRpUndNZlZBOURtSitSc1lHK09WOWZuZGNPM3RmM0l2?=
 =?utf-8?B?ZXBJSTc4Z0NROFI4OTVTUVA3VFdGWGRETmxiSXJtUnZ1U2l2M2ZkaGlEUTcr?=
 =?utf-8?B?MGtOYTZyMThVWGZkV1YxUHFUWjVEZkVBcGhSV1JPb0Y2UFczSWFtQ3o1Q3Zx?=
 =?utf-8?B?MGVWQ0dRbmtvZnZuS1o3RXFJSEl5ZVhkalNzdVNQMnc5WVZVQlBvY1kwa3Zv?=
 =?utf-8?B?SmVmUDVLMXNZQmQ2VHN2VWV4aFVWM3J3Z1VWazZwMTBwR3dybXpWaG1kTmFx?=
 =?utf-8?B?cVplQ25vdVhMU2YrQm1la09SenV0QlREWmhoQ2pvUjdjTkhYV2d0NUdzSDlj?=
 =?utf-8?B?bThPRXRQeGFxa0dNdTMvLzRMMll2V3JvY1c3RmhYK1ZOTTVtSzFaRDd3OHpq?=
 =?utf-8?B?SXc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 62cdb3fc-28e6-44c0-a4ea-08dd1f10f196
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2024 03:06:18.9006
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HDt0HTwDun/Y6sEMCOT42heXWIiEsZKwilXckSPj4XHD3tqTwr4AYPQRTrIDSZ0vtUcQmtNG3b/bE2bplE5KU58bt51NmbGpHJZccRbIS6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB2271

SGkgTmljb2xhcw0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTmlj
b2xhcyBEdWZyZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPg0KPiBTZW50OiBU
dWVzZGF5LCBEZWNlbWJlciAxNywgMjAyNCAxMTowNSBQTQ0KPiBUbzogamFja3Nvbi5sZWUgPGph
Y2tzb24ubGVlQGNoaXBzbm1lZGlhLmNvbT47IG1jaGVoYWJAa2VybmVsLm9yZzsNCj4gaHZlcmt1
aWwtY2lzY29AeHM0YWxsLm5sOyBzZWJhc3RpYW4uZnJpY2tlQGNvbGxhYm9yYS5jb207DQo+IGJv
Yi5iZWNrZXR0QGNvbGxhYm9yYS5jb207IGRhZm5hLmhpcnNjaGZlbGRAY29sbGFib3JhLmNvbQ0K
PiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnOyBsYWZsZXkua2ltDQo+IDxsYWZsZXkua2ltQGNoaXBzbm1lZGlhLmNvbT47IGItYnJu
aWNoQHRpLmNvbTsgaHZlcmt1aWxAeHM0YWxsLm5sOyBOYXMNCj4gQ2h1bmcgPG5hcy5jaHVuZ0Bj
aGlwc25tZWRpYS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMy80XSBtZWRpYTogY2hp
cHMtbWVkaWE6IHdhdmU1OiBGaXggaGFuZyBhZnRlcg0KPiBzZWVraW5nDQo+IA0KPiBMZSBtYXJk
aSAxNyBkw6ljZW1icmUgMjAyNCDDoCAxMzo1MSArMDkwMCwgSmFja3Nvbi5sZWUgYSDDqWNyaXTC
oDoNCj4gPiBXaGlsZSBzZWVraW5nLCBkcml2ZXIgY2FsbHMgZmx1c2ggY29tbWFuZC4gQmVmb3Jl
IGZsdXNoIGNvbW1hbmQgaXMNCj4gPiBzZW50IHRvIFZQVSwgZHJpdmVyIHNob3VsZCBoYW5kbGUg
ZGlzcGxheSBidWZmZXIgZmxhZ3MgYW5kIHNob3VsZCBnZXQNCj4gPiBhbGwgZGVjb2RlZCBpbmZv
cm1hdGlvbiBmcm9tIFZQVSBpZiBWQ09SRSBpcyBydW5uaW5nLg0KPiA+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogSmFja3Nvbi5sZWUgPGphY2tzb24ubGVlQGNoaXBzbm1lZGlhLmNvbT4NCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBOYXMgQ2h1bmcgPG5hcy5jaHVuZ0BjaGlwc25tZWRpYS5jb20+DQo+ID4gUmV2
aWV3ZWQtYnk6IE5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAY29sbGFib3JhLmNv
bT4NCj4gDQo+IFRoaXMgb25lIHRvbyBwbGVhc2UuDQoNCg0KRml4ZXM6IDk3MDdhNjI1NGE4YSAo
Im1lZGlhOiBjaGlwcy1tZWRpYTogd2F2ZTU6IEFkZCB0aGUgdjRsMiBsYXllciIpDQoNCnRoYW5r
cw0KDQoNCj4gDQo+ID4gLS0tDQo+ID4gIC4uLi9wbGF0Zm9ybS9jaGlwcy1tZWRpYS93YXZlNS93
YXZlNS12cHUtZGVjLmMgIHwgMTcgKysrKysrKysrKysrKysrKy0NCj4gPiAgLi4uL3BsYXRmb3Jt
L2NoaXBzLW1lZGlhL3dhdmU1L3dhdmU1LXZwdWFwaS5jICAgfCAxMCArKysrKysrKysrDQo+ID4g
IDIgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vY2hpcHMtbWVkaWEvd2F2ZTUv
d2F2ZTUtdnB1LWRlYy5jDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2NoaXBzLW1lZGlh
L3dhdmU1L3dhdmU1LXZwdS1kZWMuYw0KPiA+IGluZGV4IGQzZmY0MjBjNTJjZS4uODgyZDU1Mzk2
MzBmIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vY2hpcHMtbWVkaWEv
d2F2ZTUvd2F2ZTUtdnB1LWRlYy5jDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9j
aGlwcy1tZWRpYS93YXZlNS93YXZlNS12cHUtZGVjLmMNCj4gPiBAQCAtMTM2OSw2ICsxMzY5LDE2
IEBAIHN0YXRpYyBpbnQgc3RyZWFtb2ZmX291dHB1dChzdHJ1Y3QgdmIyX3F1ZXVlICpxKQ0KPiA+
ICAJc3RydWN0IHZiMl92NGwyX2J1ZmZlciAqYnVmOw0KPiA+ICAJaW50IHJldDsNCj4gPiAgCWRt
YV9hZGRyX3QgbmV3X3JkX3B0cjsNCj4gPiArCXN0cnVjdCBkZWNfb3V0cHV0X2luZm8gZGVjX2lu
Zm87DQo+ID4gKwl1bnNpZ25lZCBpbnQgaTsNCj4gPiArDQo+ID4gKwlmb3IgKGkgPSAwOyBpIDwg
djRsMl9tMm1fbnVtX2RzdF9idWZzX3JlYWR5KG0ybV9jdHgpOyBpKyspIHsNCj4gPiArCQlyZXQg
PSB3YXZlNV92cHVfZGVjX3NldF9kaXNwX2ZsYWcoaW5zdCwgaSk7DQo+ID4gKwkJaWYgKHJldCkN
Cj4gPiArCQkJZGV2X2RiZyhpbnN0LT5kZXYtPmRldiwNCj4gPiArCQkJCSIlczogU2V0dGluZyBk
aXNwbGF5IGZsYWcgb2YgYnVmIGluZGV4OiAldSwNCj4gZmFpbDogJWRcbiIsDQo+ID4gKwkJCQlf
X2Z1bmNfXywgaSwgcmV0KTsNCj4gPiArCX0NCj4gPg0KPiA+ICAJd2hpbGUgKChidWYgPSB2NGwy
X20ybV9zcmNfYnVmX3JlbW92ZShtMm1fY3R4KSkpIHsNCj4gPiAgCQlkZXZfZGJnKGluc3QtPmRl
di0+ZGV2LCAiJXM6IChNdWx0aXBsYW5hcikgYnVmIHR5cGUgJTR1IHwNCj4gaW5kZXgNCj4gPiAl
NHVcbiIsIEBAIC0xMzc2LDYgKzEzODYsMTEgQEAgc3RhdGljIGludCBzdHJlYW1vZmZfb3V0cHV0
KHN0cnVjdA0KPiB2YjJfcXVldWUgKnEpDQo+ID4gIAkJdjRsMl9tMm1fYnVmX2RvbmUoYnVmLCBW
QjJfQlVGX1NUQVRFX0VSUk9SKTsNCj4gPiAgCX0NCj4gPg0KPiA+ICsJd2hpbGUgKHdhdmU1X3Zw
dV9kZWNfZ2V0X291dHB1dF9pbmZvKGluc3QsICZkZWNfaW5mbykgPT0gMCkgew0KPiA+ICsJCWlm
IChkZWNfaW5mby5pbmRleF9mcmFtZV9kaXNwbGF5ID49IDApDQo+ID4gKwkJCXdhdmU1X3ZwdV9k
ZWNfc2V0X2Rpc3BfZmxhZyhpbnN0LA0KPiBkZWNfaW5mby5pbmRleF9mcmFtZV9kaXNwbGF5KTsN
Cj4gPiArCX0NCj4gPiArDQo+ID4gIAlyZXQgPSB3YXZlNV92cHVfZmx1c2hfaW5zdGFuY2UoaW5z
dCk7DQo+ID4gIAlpZiAocmV0KQ0KPiA+ICAJCXJldHVybiByZXQ7DQo+ID4gQEAgLTE0NTksNyAr
MTQ3NCw3IEBAIHN0YXRpYyB2b2lkIHdhdmU1X3ZwdV9kZWNfc3RvcF9zdHJlYW1pbmcoc3RydWN0
DQo+IHZiMl9xdWV1ZSAqcSkNCj4gPiAgCQkJYnJlYWs7DQo+ID4NCj4gPiAgCQlpZiAod2F2ZTVf
dnB1X2RlY19nZXRfb3V0cHV0X2luZm8oaW5zdCwgJmRlY19vdXRwdXRfaW5mbykpDQo+ID4gLQkJ
CWRldl9kYmcoaW5zdC0+ZGV2LT5kZXYsICJHZXR0aW5nIGRlY29kaW5nIHJlc3VsdHMgZnJvbQ0K
PiBmdywgZmFpbFxuIik7DQo+ID4gKwkJCWRldl9kYmcoaW5zdC0+ZGV2LT5kZXYsICJ0aGVyZSBp
cyBubyBvdXRwdXQgaW5mb1xuIik7DQo+ID4gIAl9DQo+ID4NCj4gPiAgCXY0bDJfbTJtX3VwZGF0
ZV9zdG9wX3N0cmVhbWluZ19zdGF0ZShtMm1fY3R4LCBxKTsgZGlmZiAtLWdpdA0KPiA+IGEvZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9jaGlwcy1tZWRpYS93YXZlNS93YXZlNS12cHVhcGkuYw0KPiA+
IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9jaGlwcy1tZWRpYS93YXZlNS93YXZlNS12cHVhcGku
Yw0KPiA+IGluZGV4IGUxNmI5OTAwNDFjMi4uZTVlODc5YTEzZThiIDEwMDY0NA0KPiA+IC0tLSBh
L2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vY2hpcHMtbWVkaWEvd2F2ZTUvd2F2ZTUtdnB1YXBpLmMN
Cj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2NoaXBzLW1lZGlhL3dhdmU1L3dhdmU1
LXZwdWFwaS5jDQo+ID4gQEAgLTc1LDYgKzc1LDE2IEBAIGludCB3YXZlNV92cHVfZmx1c2hfaW5z
dGFuY2Uoc3RydWN0IHZwdV9pbnN0YW5jZQ0KPiAqaW5zdCkNCj4gPiAgCQkJCSBpbnN0LT50eXBl
ID09IFZQVV9JTlNUX1RZUEVfREVDID8gIkRFQ09ERVIiIDoNCj4gIkVOQ09ERVIiLCBpbnN0LT5p
ZCk7DQo+ID4gIAkJCW11dGV4X3VubG9jaygmaW5zdC0+ZGV2LT5od19sb2NrKTsNCj4gPiAgCQkJ
cmV0dXJuIC1FVElNRURPVVQ7DQo+ID4gKwkJfSBlbHNlIGlmIChyZXQgPT0gLUVCVVNZKSB7DQo+
ID4gKwkJCXN0cnVjdCBkZWNfb3V0cHV0X2luZm8gZGVjX2luZm87DQo+ID4gKw0KPiA+ICsJCQlt
dXRleF91bmxvY2soJmluc3QtPmRldi0+aHdfbG9jayk7DQo+ID4gKwkJCXdhdmU1X3ZwdV9kZWNf
Z2V0X291dHB1dF9pbmZvKGluc3QsICZkZWNfaW5mbyk7DQo+ID4gKwkJCXJldCA9IG11dGV4X2xv
Y2tfaW50ZXJydXB0aWJsZSgmaW5zdC0+ZGV2LT5od19sb2NrKTsNCj4gPiArCQkJaWYgKHJldCkN
Cj4gPiArCQkJCXJldHVybiByZXQ7DQo+ID4gKwkJCWlmIChkZWNfaW5mby5pbmRleF9mcmFtZV9k
aXNwbGF5ID4gMCkNCj4gPiArCQkJCXdhdmU1X3ZwdV9kZWNfc2V0X2Rpc3BfZmxhZyhpbnN0LA0K
PiBkZWNfaW5mby5pbmRleF9mcmFtZV9kaXNwbGF5KTsNCj4gPiAgCQl9DQo+ID4gIAl9IHdoaWxl
IChyZXQgIT0gMCk7DQo+ID4gIAltdXRleF91bmxvY2soJmluc3QtPmRldi0+aHdfbG9jayk7DQoN
Cg==

