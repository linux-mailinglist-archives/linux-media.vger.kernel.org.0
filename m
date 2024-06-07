Return-Path: <linux-media+bounces-12718-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1882900166
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 13:01:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DABB1F25A4A
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 11:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A89421862A1;
	Fri,  7 Jun 2024 11:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="eIKyYZ5H"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020095.outbound.protection.outlook.com [52.101.156.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E581915B560;
	Fri,  7 Jun 2024 11:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717758070; cv=fail; b=GU9EAduPeuucDRePakPDoqqsdTxvv9tuDn3gJpqQdtsRPd3hvbkrpP4CKOvYcKy/nny7PwkB89qImTob+9L1J2gPIjTfiNVczaGGjUFnXqg0P3IuwuRIXlbBhY5XBrHA56jFHyUfkk/hoKArsUmm9Wvx32Grd+VrHWGInd2JqPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717758070; c=relaxed/simple;
	bh=YzFroe5L9GRsvNvCFH48hjT0EEMwx3IlYJlLlBgWQ1I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BnmTGQY3b7HO6yDAZjTgrTyd3axBHK+ABu0c11ii9zpxx++IsF06pb5K99HHi4hREVpGmY3TKOvV9cZ5xLJ2+dJb/6vnko9QX1034DAFwnG8ljCJBfAc+FpWv0SBBG5NbI0OCv9VQyiqNfbb5drJ+0p2wvm8ChOxJrnEPNsWOeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=eIKyYZ5H; arc=fail smtp.client-ip=52.101.156.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IV05c4K9MGdZFny/LztVVK6t7rErnSkHPf8DsibhgIz5smR/RhC0h+ZAazaDlBPW/Nz2+zb/YhvQiJGdQ53nc2XGMKqg99hJGDpbzAQ0gHXJV1V+K+BDaLoNC47qFVNgYTDl41VQ0es++mmDFQOXef7Y+X/E53vPH2z1mGJMt0PRJAgaCC+wQcovyhMJuTrO1sxipSQyLeCN6utaK93ZAnWnAXBikhz1f87yV5SSneXKAIP33ECJVvts4XX7tlMp35GCboHf+OS6PQkccNpweXkyvPo0dx0FjDLMHNuV84QgWTHdF4dRNJYMSu4UsSG/zo8gsLIkMmhIoJ2uQWKWEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YzFroe5L9GRsvNvCFH48hjT0EEMwx3IlYJlLlBgWQ1I=;
 b=l7081G50xQAY+NSjZ81ahc19YXLvLxDfnTBu9ovYcAKWOF+6z5a/V/YPJuvp7X8trGZG04HE4OTZVvlU8f4yfq0wL7qrZnht44Lm9GD6h+jl44EXrCiJRXyqHE+0nS+r0XVhtuvGK8ZURi//Vqvfu1rVA5yhOeujaYJeWExuo66+WJF+wwFP6PLPrZ1DS5HEhSCkzBsGzrnc/9X5QhS35TWJkb1JVLLxFT7AQi82J6FIVpbGTpwJ8J/Fe3s7/vmSq/FPYtXsgop//WaxNLB5A87ui7K5OztFVvioJUdAA3bH7zVRuQkp6t2k0FwPiUG1P7rw1ZYVuLM221GBb4dcuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YzFroe5L9GRsvNvCFH48hjT0EEMwx3IlYJlLlBgWQ1I=;
 b=eIKyYZ5H0EXptUUmxdPWd+z4yyJeWvLY+fcIvhdhebrLBTB3LFQVxZmj1BV3q/LzYBjjs9KGSsEA3qBwK9f6T+vmn81IZaaIcvxI8hSNvg9jzot4WiWGvlOCAWsngFU/UGxu1W0bwBgaswOt2ubhImmdU3b6ZxmWD24QINZ/4Vk=
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SL2P216MB3099.KORP216.PROD.OUTLOOK.COM (2603:1096:101:282::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.34; Fri, 7 Jun 2024 11:01:04 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%4]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 11:01:04 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: "sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>
CC: "mchehab@kernel.org" <mchehab@kernel.org>, "nicolas@ndufresne.ca"
	<nicolas@ndufresne.ca>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	Nas Chung <nas.chung@chipsnmedia.com>, lafley.kim
	<lafley.kim@chipsnmedia.com>, "b-brnich@ti.com" <b-brnich@ti.com>
Subject: RE: [RESEND PATCH v4 0/4] Add features to an existing driver
Thread-Topic: [RESEND PATCH v4 0/4] Add features to an existing driver
Thread-Index: AQHaosxrJnIsmYodQEuWO9RJve6Fu7GfaNLQgBtv5ICAAXVdMA==
Date: Fri, 7 Jun 2024 11:01:03 +0000
Message-ID:
 <SE1P216MB130381665976C2B194FEB553EDFB2@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
References: <20240510112252.800-1-jackson.lee@chipsnmedia.com>
 <SE1P216MB13031A560625CE8C7614D5F6EDE92@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
 <20240606124339.i5l25wwo6fca2ne2@basti-XPS-13-9310>
In-Reply-To: <20240606124339.i5l25wwo6fca2ne2@basti-XPS-13-9310>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE1P216MB1303:EE_|SL2P216MB3099:EE_
x-ms-office365-filtering-correlation-id: 1cdde3c7-ec7f-42e5-05b5-08dc86e11fdc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?T1VZZk9kdkIrUnFLKzJaSklLblpwamxEUVpNdGVVNEtZY2ZWWVpqam9vcnJN?=
 =?utf-8?B?cEJ3bHB3aEpBMlRITTJHK3FLTTY3SmlFWFlYdzN6cXRIaC9ZeG5HcG1lUVRy?=
 =?utf-8?B?cVRhSjBBaUJ1MDN5eUwzc2szZzlEdzhOeDdGYjg4dTFzSkZCVlAvdzhEK2Rh?=
 =?utf-8?B?ZldLWlUzOWJFVmVkSVhpQTh6QTBZKzdjcUxvdENUaERCcFhhMzFBVEc3a0h2?=
 =?utf-8?B?aVhYQ1lsR1RjRlQ4UUlaVTlJQ09tSXlObE1XdncrVkMyYUdEeTU3dnQ5dkNp?=
 =?utf-8?B?OFNVL0laRkJoNmt2eXFnRVFoY25mazZaRE9tMG0xYjFFRG4yYnNsRWpydHJJ?=
 =?utf-8?B?eTRHUjF2RnFTc0pVbFlsbkNHYU1SZjhTWHdhODFqZkxqTHpmaFpXa2pzS1F1?=
 =?utf-8?B?Z0ppS1VCWlpFcHYrZUFWd3dPT0g0THpzVFNXRXZGOWlVZkoxODFlNDg1d2Rs?=
 =?utf-8?B?c1Q1cG44dXpSY1ovbXVDY1g3S0d2MWxvMXZiWTBUcnArSk9vNSszbG82ekJ5?=
 =?utf-8?B?TkJZMldGamJ5ZjJUYU05WHFXTEdBZ2lNaVlxeXJrK2V2eUZHQTBRSjdwUURE?=
 =?utf-8?B?ekxseklNWGp1SFZoaGdKYTlHNDVoeHUyMi9qRkhWOE1FMGFFcVBBUHhjQzh1?=
 =?utf-8?B?WDVIM1IzN3U2SDNRaVhtQUJ2RHNTOVh1ZVdXOTEzNHhQMndSRmd0NEc3TnpM?=
 =?utf-8?B?dmxxOVNGNzRoUWlXRTlsMFNTOHVqSlY3NThKRS90VjhOVTcvWkNvdmJVSmhB?=
 =?utf-8?B?czBBYkFBYlBwODh1NTRwZU5iSVQxU3E5VFlqQ1BHUS95cE5jZmV2K1NYVFFD?=
 =?utf-8?B?OWlma3NtTHVSTmJkL3FPUzFtWWRKUStpRDd6RDczWHZodjRxUnJGY01vOTNv?=
 =?utf-8?B?QVJvb2RBL3BKMkF5TWNpdlpjN2RSUmFkc3hLMGgyWHlBYnJUVlVNSXJaQ3No?=
 =?utf-8?B?dm9JaVc1K1RNTjRlZmFBVncxRVFBcmM5TVVZRWJHUmZwZHdyQmxUSDVrOGoz?=
 =?utf-8?B?ME1OWE9XWEdNRDg1MVRYbEMxd2NoU0lMV0swKzVkNjBxOWFIZGtwNENmUUFX?=
 =?utf-8?B?R3pZM0hONE1LSWZJMnlCajB4ZjNDa3U4TEdSREpVT3Joa2JyRUliRExiSzdP?=
 =?utf-8?B?KzRZcnc5bmtNUzhGK2U4blJDalpDbDJaTk50QTQxb01SZXdIRmpicUtLYnJs?=
 =?utf-8?B?VDJPY0RIbW1GSDVpa1BMUUJlMXVUQ2hENmdCb3pwUUhSTWlQN0F3cmRZbmxD?=
 =?utf-8?B?RXZlR3NOK0NVZmVHMUFrMHdCbU96d3BMaWM5NVQzMCs3bk9ZRjI2L3VxUk9z?=
 =?utf-8?B?OWs0YndCa05lbW1UcVFPZmY3cUh2dTIwU2loNzlEYVRwSkNyMlA2RExzT0k2?=
 =?utf-8?B?bmRZeTUrb0ZoaHpWamcrTmRQNzlKazV4Y01xSkVGeXVrUE03ZjVQbzh4Q0s4?=
 =?utf-8?B?N09NRGtlMHV3SXN3YVlQWnZNdFZCYVVXc2tGbXpBSlFRbHplcmc0cnZ2ekZ3?=
 =?utf-8?B?cDNoa2xlNHVxeGFYYTUzd3BHWU1RRVlXNUlDUThsWjJ5N3pHazFGM00rM2Js?=
 =?utf-8?B?SzVzOGhPcTRnKzNOaXFFM1VESXMxM3VDekRQV2lCZnJSckc0YjNVTENkbExR?=
 =?utf-8?B?TGJPcGw5YzNid3hTeU9XOHhTaHBoMDk3aG9xRkYwTTBodjYza3lobXdPRVM5?=
 =?utf-8?B?SVI2ak5Hb3paRUIzb3pWYXZrUkRDaC9rRGJ4ejMxWXZaUFFCbEtUQUdZc2FX?=
 =?utf-8?Q?qE34lojZSy7vGPFfAHDgH7btBmbho5yvg5CJ/R0?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cFgvMjh3YzJxbklKVkh0Yy9HaSt5cG04b2FjenZYMmZ4L2VuRW1ZNC9yU3lE?=
 =?utf-8?B?ejd5cDQ1VXlrMFR4WHV2d2NuVnp2SWM2Q09zZHlDaXYya0JjdE9MOXRxS3Ry?=
 =?utf-8?B?emdTWktvZXgvelFMTDNBMnVuVzh3QytsemZROWlPTG9GbjFEZmNLdHFWQmZq?=
 =?utf-8?B?REMrT2kyazRUMkJpY0NQTDBiUFQ1OVpLV0dZMjFGSTEwNkJBTitwOThJbUNP?=
 =?utf-8?B?bFlzRVVBT1JCQTFweFBtZktLdFMrVlI5TWhoNW01SFF3TEpOdHg2dlhyKzVh?=
 =?utf-8?B?ckhhb3hqMlBqOWJCYXN5UHl4UkJpbDU0RDZGc1RLUytyTTNqS2lFZys0WWRr?=
 =?utf-8?B?RUJEVkxhbXVhcFhwcGl1NTRPRUVYbTYxYlVLWkgzYmthOHJ3OThWdWpGcFU0?=
 =?utf-8?B?SnEwWTRuQ1Bwem14Q3cza0Y4dTcwUGIvYThvY1NCSDlYNWlod1VRczZJU0Fu?=
 =?utf-8?B?QW1ySUcrVHV2bCtMMTJhb2xIUDBseS8wdlNoM2xmbURuZzZhNVl6MkRQSGtY?=
 =?utf-8?B?R1ladzhvTzZyR0NRVXRNN1c0KzFXdmRibmFodTM4c2NGekg2NnZHZkwrcXJk?=
 =?utf-8?B?SkJuVDJqR3g2UnFqUjNuaDFQUDBRMVFsZHdQejJYbXd0c1ZzWWFTZiswN3Zn?=
 =?utf-8?B?cTdXaTAyUk95MVYxdm04MW9pb1UrVm1xZEhZNXFkUjhkaHpOSTNBWmNsd0FL?=
 =?utf-8?B?Y1NTS3lEZ2FXS1crMGIydGlPcForOWJqOHBGMm5DYWpSMGRLazFmN3J2Nmxq?=
 =?utf-8?B?Q1NzbDcvT2FxYnRtT2RTcTIzblc1Y1N0MGlRdVFmeDl1YStSeXBHNkYvYnhC?=
 =?utf-8?B?K1VIVTlqVjM2VndpRG1ocmhUSGlaVXpTeUhZNXl2dWFXRnMyQ2d5MHRTWmVz?=
 =?utf-8?B?OFR5MkRWZWxsYnRYcmlQQlJPQlpxMXdwVTJFVjV1a25WbVlXWi90TWNQa1dP?=
 =?utf-8?B?RDhqNWZGSHVvZU9yZ0dZODBweVJWaGhKSiszNXA1ZjF6Y2s0ank1ZEU1SEtO?=
 =?utf-8?B?b0Z4MWtteDVpQ1FYOHZUMHBjMGhpUG1NY20vdmdXUFFLS1dsUEFNNXRya29n?=
 =?utf-8?B?a2JhUFZkMzQwMk4rOElqSnVuV3p5REF2ZHJGdnNQUmdSS3ROWHNULzdDUnhm?=
 =?utf-8?B?TlBXSkVJN0JFbW9xdmp4eTZETzFQREljcU53eFY1M2tON0c0QUFOc2NaWTV5?=
 =?utf-8?B?eTZGQkRCZERpN0xNNWJmZFhnMm1HT3c4OHJuZ0VQbkFjaldPUDB2eHZoS2RU?=
 =?utf-8?B?Q0g3cWVlZk9NT1RJS1M3RWVYNUFiVTllemYzL09NZzdQM0F5LzlhQzNSSngv?=
 =?utf-8?B?Njc5TFFJeDJMeStNTkpjeEZjV1BibkVyeU9wbEFOVjVvNFVMTk5wQzc3d1po?=
 =?utf-8?B?Unk3emY2U0ZGN1dKYUpFR3lhSzJHamUyUVZYWUNMQU9zdSt0NzRzTE9xd1px?=
 =?utf-8?B?MVFqRkFaS1BzZHhLR1hSeUgyZitXdU00d2ZXU0ZmRmwra3hScG9FNW1zcS8r?=
 =?utf-8?B?L2kxOVlIbzNEZUlEcUJpQzR5RjFLbUV2N0c0ak5rUmVxdlRqY2IrZmU2ZXE0?=
 =?utf-8?B?LzRkalJOenZZMnJzSWxCbFZ4c3lUb1NZVlhwdUNCbzdDL1FXUC84RUtxbDdN?=
 =?utf-8?B?ZHdKTXV5OFZWMlVsYldoYUlnVmtXclVBdzQvVmFpT25nQWtzdi9mczZtenUr?=
 =?utf-8?B?VUd2RURZMmgvWjdHSzd5Yk9Pc2s2cElXRDNRQ2NCWjMzeWlnZlRNb2t4Zis5?=
 =?utf-8?B?b1pIeE0xb3dBRHM4bFZNUGh2OUVsckx3ejJVcEhYbWNLaVpRK2IvNWFDZDQy?=
 =?utf-8?B?dEtQeXVYQ0N3Mm5HL2lrLzFYd01SY0tWYy9DRFJLNXRqU1dqSjdycHdJVEtS?=
 =?utf-8?B?Nk5SdzVhcjVTU3k4a2tCem5kSjFZZHBUOWtRMXZoMGVLdlRuQk5HSWpYUVBp?=
 =?utf-8?B?N2I5VDhlMDZDNG5IbnhhQUdYcGJMYmhNM09OdUVuMEFFS1pnTklVbHoyeE5o?=
 =?utf-8?B?NGc3ZlV4blBPTlg3M3cxNGpPUHNqRVF0ekpmay8rWHBXVTg2Z1R3YW4zSDhG?=
 =?utf-8?B?U0wvM2dvSjkvN29RZmNjUkNDWWRYeFFnQUlmVXdtWXhCYnRwVnppZTlDNVdS?=
 =?utf-8?B?RnE5Y0RtMW9uUUFDU2tKU2NVYjZUVmVrSG9JelkwWG54VmV3Z0E2T3I3RHM3?=
 =?utf-8?B?TVE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cdde3c7-ec7f-42e5-05b5-08dc86e11fdc
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2024 11:01:03.9818
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eBEXLywAYWqQSCIVv+V0BnBs8KN/K48u8AfZl8iBuSGJ0dPbkd3LakUN+zaaayL09N6ycj8qKer/21R3M7KmuxMHfY3fgmtj5Q2c3ZVoB/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB3099

SGkgU2ViYXN0aWFuDQoNClNob3VsZCB3ZSBzZW5kIHRoZSB2NSBwYXRjaCBhZnRlciBmaXhpbmcg
dGhlIHdhcm5pbmcgbWVzc2FnZXM/DQoNClRoYW5rcw0KSmFja3Nvbg0KDQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogc2ViYXN0aWFuLmZyaWNrZUBjb2xsYWJvcmEuY29t
IDxzZWJhc3RpYW4uZnJpY2tlQGNvbGxhYm9yYS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBKdW5l
IDYsIDIwMjQgOTo0NCBQTQ0KPiBUbzogamFja3Nvbi5sZWUgPGphY2tzb24ubGVlQGNoaXBzbm1l
ZGlhLmNvbT4NCj4gQ2M6IG1jaGVoYWJAa2VybmVsLm9yZzsgbmljb2xhc0BuZHVmcmVzbmUuY2E7
IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZzsgaHZlcmt1aWxAeHM0YWxsLm5sOyBOYXMgQ2h1bmcNCj4gPG5hcy5jaHVuZ0BjaGlwc25t
ZWRpYS5jb20+OyBsYWZsZXkua2ltIDxsYWZsZXkua2ltQGNoaXBzbm1lZGlhLmNvbT47IGItDQo+
IGJybmljaEB0aS5jb20NCj4gU3ViamVjdDogUmU6IFtSRVNFTkQgUEFUQ0ggdjQgMC80XSBBZGQg
ZmVhdHVyZXMgdG8gYW4gZXhpc3RpbmcgZHJpdmVyDQo+IA0KPiBIZXkgSmFja3NvbiwNCj4gDQo+
IE9uIDIwLjA1LjIwMjQgMDE6NDUsIGphY2tzb24ubGVlIHdyb3RlOg0KPiA+SGkgc2ViYXN0aWFu
IGFuZCBOaWNvbGFzDQo+ID4NCj4gPkkgc2VudCB0aGUgdjQgcGF0Y2guIENhbiB5b3UgcGxlYXNl
IHJldmlldyB0aGVtID8NCj4gDQo+IHNvIG92ZXJhbGwgdGhpcyBsb29rcyBnb29kIG5vdywgYnV0
IHRoZXJlIGFyZSBzdGlsbCBhIGZldyB3YXJuaW5nczoNCj4gaHR0cHM6Ly9saW51eC1tZWRpYS5w
YWdlcy5mcmVlZGVza3RvcC5vcmcvLS91c2Vycy9zZWJhc3RpYW5mcmlja2UvLQ0KPiAvam9icy81
OTU1OTk2My9hcnRpZmFjdHMvcmVwb3J0Lmh0bQ0KPiANCj4gQ291bGQgeW91IHBsZWFzZSBsb29r
IGludG8gdGhvc2U/IChQbGVhc2UgdGVsbCBtZSBpZiB5b3UgY2FuJ3QgYWNjZXNzIHRoZQ0KPiBs
aW5rKQ0KPiANCj4gPg0KPiA+aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbWVkaWEvMjAy
NDA1MTAxMTIyNTIuODAwLTEtamFja3Nvbi5sZWVAY2gNCj4gPmlwc25tZWRpYS5jb20vDQo+ID4N
Cj4gPg0KPiA+dGhhbmtzDQo+ID5KYWNrc29uDQo+IA0KPiBSZWdhcmRzLA0KPiBTZWJhc3RpYW4N
Cj4gDQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogamFj
a3Nvbi5sZWUgPGphY2tzb24ubGVlQGNoaXBzbm1lZGlhLmNvbT4NCj4gPj4gU2VudDogRnJpZGF5
LCBNYXkgMTAsIDIwMjQgODoyMyBQTQ0KPiA+PiBUbzogbWNoZWhhYkBrZXJuZWwub3JnOyBuaWNv
bGFzQG5kdWZyZXNuZS5jYTsNCj4gPj4gc2ViYXN0aWFuLmZyaWNrZUBjb2xsYWJvcmEuY29tDQo+
ID4+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmc7DQo+ID4+IGh2ZXJrdWlsQHhzNGFsbC5ubDsgTmFzIENodW5nIDxuYXMuY2h1bmdA
Y2hpcHNubWVkaWEuY29tPjsgbGFmbGV5LmtpbQ0KPiA+PiA8bGFmbGV5LmtpbUBjaGlwc25tZWRp
YS5jb20+OyBiLWJybmljaEB0aS5jb207IGphY2tzb24ubGVlDQo+ID4+IDxqYWNrc29uLmxlZUBj
aGlwc25tZWRpYS5jb20+DQo+ID4+IFN1YmplY3Q6IFtSRVNFTkQgUEFUQ0ggdjQgMC80XSBBZGQg
ZmVhdHVyZXMgdG8gYW4gZXhpc3RpbmcgZHJpdmVyDQo+ID4+DQo+ID4+IEZyb206ICJKYWNrc29u
LmxlZSIgPGphY2tzb24ubGVlQGNoaXBzbm1lZGlhLmNvbT4NCj4gPj4NCj4gPj4gVGhlIHdhdmU1
IGNvZGVjIGRyaXZlciBpcyBhIHN0YXRlZnVsIGVuY29kZXIvZGVjb2Rlci4NCj4gPj4gVGhlIGZv
bGxvd2luZyBwYXRjaGVzIGlzIGZvciBzdXBwb3J0aW5nIHl1djQyMiBpbnB1eSBmb3JtYXQsDQo+
ID4+IHN1cHBvcnRpbmcgcnVudGltZSBzdXNwZW5kL3Jlc3VtZSBmZWF0dXJlIGFuZCBleHRyYSB0
aGluZ3MuDQo+ID4+DQo+ID4+IHY0bDItY29tcGxpYW5jZSByZXN1bHRzOg0KPiA+PiA9PT09PT09
PT09PT09PT09PT09PT09PT0NCj4gPj4NCj4gPj4gdjRsMi1jb21wbGlhbmNlIDEuMjQuMSwgNjQg
Yml0cywgNjQtYml0IHRpbWVfdA0KPiA+Pg0KPiA+PiBCdWZmZXIgaW9jdGxzOg0KPiA+PiAgICAg
ICAgICAgICB3YXJuOiB2NGwyLXRlc3QtYnVmZmVycy5jcHAoNjkzKTogVklESU9DX0NSRUFURV9C
VUZTIG5vdA0KPiBzdXBwb3J0ZWQNCj4gPj4gICAgICAgICAgICAgd2FybjogdjRsMi10ZXN0LWJ1
ZmZlcnMuY3BwKDY5Myk6IFZJRElPQ19DUkVBVEVfQlVGUyBub3QNCj4gc3VwcG9ydGVkDQo+ID4+
ICAgICB0ZXN0IFZJRElPQ19SRVFCVUZTL0NSRUFURV9CVUZTL1FVRVJZQlVGOiBPSw0KPiA+PiAg
ICAgdGVzdCBWSURJT0NfRVhQQlVGOiBPSw0KPiA+PiAgICAgdGVzdCBSZXF1ZXN0czogT0sgKE5v
dCBTdXBwb3J0ZWQpDQo+ID4+DQo+ID4+IFRvdGFsIGZvciB3YXZlNS1kZWMgZGV2aWNlIC9kZXYv
dmlkZW8wOiA0NSwgU3VjY2VlZGVkOiA0NSwgRmFpbGVkOiAwLA0KPiA+PiBXYXJuaW5nczogMiBU
b3RhbCBmb3Igd2F2ZTUtZW5jIGRldmljZSAvZGV2L3ZpZGVvMTogNDUsIFN1Y2NlZWRlZDogNDUs
DQo+IEZhaWxlZDoNCj4gPj4gMCwgV2FybmluZ3M6IDANCj4gPj4NCj4gPj4gRmx1c3RlciB0ZXN0
IHJlc3VsdHM6DQo+ID4+ID09PT09PT09PT09PT09PT09PT09PQ0KPiA+Pg0KPiA+PiBSdW5uaW5n
IHRlc3Qgc3VpdGUgSkNULVZDLUhFVkNfVjEgd2l0aCBkZWNvZGVyDQo+ID4+IEdTdHJlYW1lci1I
LjI2NS1WNEwyLUdzdDEuMCBVc2luZyAxIHBhcmFsbGVsIGpvYihzKQ0KPiA+PiBSYW4gMTMyLzE0
NyB0ZXN0cyBzdWNjZXNzZnVsbHkgICAgICAgICAgICAgICBpbiA5Ny40MjEgc2Vjcw0KPiA+Pg0K
PiA+PiAoMSB0ZXN0IGZhaWxzIGJlY2F1c2Ugb2Ygbm90IHN1cHBvcnRpbmcgdG8gcGFyc2UgbXVs
dGkgZnJhbWVzLCAxIHRlc3QNCj4gPj4gZmFpbHMgYmVjYXVzZSBvZiBhIG1pc3NpbmcgZnJhbWUg
YW5kIHNsaWdodCBjb3JydXB0aW9uLA0KPiA+PiAgMiB0ZXN0cyBmYWlsIGJlY2F1c2Ugb2Ygc2l6
ZXMgd2hpY2ggYXJlIGluY29tcGF0aWJsZSB3aXRoIHRoZSBJUCwgMTENCj4gPj4gdGVzdHMgZmFp
bCBiZWNhdXNlIG9mIHVuc3VwcG9ydGVkIDEwIGJpdCBmb3JtYXQpDQo+ID4+DQo+ID4+IFJ1bm5p
bmcgdGVzdCBzdWl0ZSBKVlQtQVZDX1YxIHdpdGggZGVjb2Rlcg0KPiA+PiBHU3RyZWFtZXItSC4y
NjQtVjRMMi1Hc3QxLjAgVXNpbmcNCj4gPj4gMSBwYXJhbGxlbCBqb2IocykNCj4gPj4gUmFuIDc3
LzEzNSB0ZXN0cyBzdWNjZXNzZnVsbHkgICAgICAgICAgICAgICBpbiAzNy4yMzMgc2Vjcw0KPiA+
Pg0KPiA+PiAoNTggZmFpbCBiZWNhdXNlIHRoZSBoYXJkd2FyZSBpcyB1bmFibGUgdG8gZGVjb2Rl
ICBNQkFGRiAvIEZNTyAvDQo+ID4+IEZpZWxkIC8gRXh0ZW5kZWQgcHJvZmlsZSBzdHJlYW1zLikN
Cj4gPj4NCj4gPj4gQ2hhbmdlIHNpbmNlIHYzOg0KPiA+PiA9PT09PT09PT09PT09PT09PQ0KPiA+
Pg0KPiA+PiAqIEZvciBbUEFUQ0ggdjQgMS80XSBtZWRpYTogY2hpcHMtbWVkaWE6IHdhdmU1OiBT
dXBwb3J0IFNQUy9QUFMNCj4gPj4gZ2VuZXJhdGlvbiBmb3IgZWFjaCBJRFINCj4gPj4gIC0gYWRk
IFJldmlld2VkLUJ5IHRhZw0KPiA+Pg0KPiA+PiAqIEZvciBbUEFUQ0ggdjQgMi80XSBtZWRpYTog
Y2hpcHMtbWVkaWE6IHdhdmU1OiBTdXBwb3J0IHJ1bnRpbWUNCj4gPj4gc3VzcGVuZC9yZXN1bWUN
Cj4gPj4gIC0gYWRkIFJldmlld2VkLUJ5IHRhZw0KPiA+Pg0KPiA+PiAqIEZvciBbUEFUQ0ggdjQg
My80XSBtZWRpYTogY2hpcHMtbWVkaWE6IHdhdmU1OiBVc2UgaGVscGVycyB0bw0KPiA+PiBjYWxj
dWxhdGUgYnl0ZXNwZXJsaW5lIGFuZCBzaXplaW1hZ2UuDQo+ID4+ICAtIG1vZGlmeSB0aGUgY29t
bWl0IG1lc3NhZ2UNCj4gPj4gIC0gZGVmaW5lIHRocmVlIGZyYW1lc2l6ZSBzdHJ1Y3R1cmVzIGZv
ciBkZWNvZGVyDQo+ID4+DQo+ID4+ICogRm9yIFtQQVRDSCB2NCA0LzRdIG1lZGlhOiBjaGlwcy1t
ZWRpYTogd2F2ZTU6IFN1cHBvcnQgWVVWNDIyIHJhdw0KPiA+PiBwaXhlbC0gZm9ybWF0cyBvbiB0
aGUgZW5jb2Rlcg0KPiA+PiAgLSBtb2RpZnkgdGhlIGNvbW1pdCBtZXNzYWdlDQo+ID4+ICAtIHVz
ZSB0aGUgdjRsMl9mb3JtYXRfaW5mbyB0byBjYWxjdWxhdGUgbHVtYSwgY2hyb21hIHNpemUNCj4g
Pj4NCj4gPj4gQ2hhbmdlIHNpbmNlIHYyOg0KPiA+PiA9PT09PT09PT09PT09PT09PQ0KPiA+Pg0K
PiA+PiAqIEZvciBbUEFUQ0ggdjMgMC80XSBtZWRpYTogY2hpcHMtbWVkaWE6IHdhdmU1OiBTdXBw
b3J0IFNQUy9QUFMNCj4gPj4gZ2VuZXJhdGlvbiBmb3IgZWFjaCBJRFINCj4gPj4gIC0gYWRkIHRo
ZSBzdWdnZXN0ZWQgX1NISUZUIHN1ZmZpeA0KPiA+Pg0KPiA+PiAqIEZvciBbUEFUQ0ggdjMgMS80
XSBtZWRpYTogY2hpcHMtbWVkaWE6IHdhdmU1OiBTdXBwb3J0IHJ1bnRpbWUNCj4gPj4gc3VzcGVu
ZC9yZXN1bWUNCj4gPj4gIC0gY2hhbmdlIGEgY29tbWl0IG1lc3NhZ2UNCj4gPj4NCj4gPj4gKiBG
b3IgW1BBVENIIHYzIDIvNF0gbWVkaWE6IGNoaXBzLW1lZGlhOiB3YXZlNTogVXNlIGhlbHBlcnMg
dG8NCj4gPj4gY2FsY3VsYXRlIGJ5dGVzcGVybGluZSBhbmQgc2l6ZWltYWdlDQo+ID4+ICAtIGFk
ZCBwaXhfZm10X3R5cGUgcGFyYW1ldGVyIGludG8gd2F2ZTVfdXBkYXRlX3BpeF9mbXQgZnVuY3Rp
b24NCj4gPj4gIC0gYWRkIG1pbi9tYXggd2lkdGgvaGVpZ2h0IHZhbHVlcyBpbnRvIGRlY19mbXRf
bGlzdA0KPiA+Pg0KPiA+PiBDaGFuZ2Ugc2luY2UgdjE6DQo+ID4+ID09PT09PT09PT09PT09PT09
DQo+ID4+DQo+ID4+ICogRm9yIFtQQVRDSCB2MiAwLzRdIG1lZGlhOiBjaGlwcy1tZWRpYTogd2F2
ZTU6IFN1cHBvcnQgU1BTL1BQUw0KPiA+PiBnZW5lcmF0aW9uIGZvciBlYWNoIElEUg0KPiA+PiAg
LSBkZWZpbmUgYSBtYWNybyBmb3IgcmVnaXN0ZXIgYWRkcmVzc2VzDQo+ID4+DQo+ID4+ICogRm9y
IFtQQVRDSCB2MiAxLzRdIG1lZGlhOiBjaGlwcy1tZWRpYTogd2F2ZTU6IFN1cHBvcnQgcnVudGlt
ZQ0KPiA+PiBzdXNwZW5kL3Jlc3VtZQ0KPiA+PiAgLSBhZGQgYXV0byBzdXNwZW5kL3Jlc3VtZQ0K
PiA+Pg0KPiA+PiAqIEZvciBbUEFUQ0ggdjIgMi80XSBtZWRpYTogY2hpcHMtbWVkaWE6IHdhdmU1
OiBVc2UgaGVscGVycyB0bw0KPiA+PiBjYWxjdWxhdGUgYnl0ZXNwZXJsaW5lIGFuZCBzaXplaW1h
Z2UNCj4gPj4gIC0gdXNlIGhlbHBlciBmdW5jdGlvbnMgdG8gY2FsY3VsYXRlIGJ5dGVzcGVybGlu
ZSBhbmQgc2l6ZWltYWdlDQo+ID4+DQo+ID4+ICogRm9yIFtQQVRDSCB2MiAzLzRdIG1lZGlhOiBj
aGlwcy1tZWRpYTogd2F2ZTU6IFN1cHBvcnQgWVVWNDIyIHJhdw0KPiA+PiBwaXhlbC0gZm9ybWF0
cyBvbiB0aGUgZW5jb2Rlcg0KPiA+PiAgLSByZW1vdmUgdW5uZWNlc3NhcnkgY29kZXMNCj4gPj4N
Cj4gPj4gQ2hhbmdlIHNpbmNlIHYwOg0KPiA+PiA9PT09PT09PT09PT09PT09PQ0KPiA+PiBUaGUg
REVGQVVMVF9TUkNfU0laRSBtYWNybyB3YXMgZGVmaW5lZCB1c2luZyBtdWx0aXBsZSBsaW5lcywg
VG8gbWFrZQ0KPiA+PiBhIHNpbXBsZSBkZWZpbmUsIHRhYiBhbmQgbXVsdGlwbGUgbGluZXMgaGFz
IGJlZW4gcmVtb3ZlZCwgVGhlIG1hY3JvDQo+ID4+IGlzIGRlZmluZWQgdXNpbmcgb25lIGxpbmUu
DQo+ID4+DQo+ID4+IEphY2tzb24ubGVlICg0KToNCj4gPj4gICBtZWRpYTogY2hpcHMtbWVkaWE6
IHdhdmU1OiBTdXBwb3J0IFNQUy9QUFMgZ2VuZXJhdGlvbiBmb3IgZWFjaCBJRFINCj4gPj4gICBt
ZWRpYTogY2hpcHMtbWVkaWE6IHdhdmU1OiBTdXBwb3J0IHJ1bnRpbWUgc3VzcGVuZC9yZXN1bWUN
Cj4gPj4gICBtZWRpYTogY2hpcHMtbWVkaWE6IHdhdmU1OiBVc2UgaGVscGVycyB0byBjYWxjdWxh
dGUgYnl0ZXNwZXJsaW5lIGFuZA0KPiA+PiAgICAgc2l6ZWltYWdlLg0KPiA+PiAgIG1lZGlhOiBj
aGlwcy1tZWRpYTogd2F2ZTU6IFN1cHBvcnQgWVVWNDIyIHJhdyBwaXhlbC1mb3JtYXRzIG9uIHRo
ZQ0KPiA+PiAgICAgZW5jb2Rlci4NCj4gPj4NCj4gPj4gIC4uLi9wbGF0Zm9ybS9jaGlwcy1tZWRp
YS93YXZlNS93YXZlNS1oZWxwZXIuYyB8ICAyNCArKw0KPiA+PiAgLi4uL3BsYXRmb3JtL2NoaXBz
LW1lZGlhL3dhdmU1L3dhdmU1LWhlbHBlci5oIHwgICA1ICsNCj4gPj4gIC4uLi9wbGF0Zm9ybS9j
aGlwcy1tZWRpYS93YXZlNS93YXZlNS1ody5jICAgICB8ICAyMyArLQ0KPiA+PiAgLi4uL2NoaXBz
LW1lZGlhL3dhdmU1L3dhdmU1LXZwdS1kZWMuYyAgICAgICAgIHwgMzEyICsrKysrKystLS0tLS0t
LS0tLQ0KPiA+PiAgLi4uL2NoaXBzLW1lZGlhL3dhdmU1L3dhdmU1LXZwdS1lbmMuYyAgICAgICAg
IHwgMzAwICsrKysrKysrKy0tLS0tLS0tDQo+ID4+ICAuLi4vcGxhdGZvcm0vY2hpcHMtbWVkaWEv
d2F2ZTUvd2F2ZTUtdnB1LmMgICAgfCAgNDMgKysrDQo+ID4+ICAuLi4vcGxhdGZvcm0vY2hpcHMt
bWVkaWEvd2F2ZTUvd2F2ZTUtdnB1LmggICAgfCAgIDUgKy0NCj4gPj4gIC4uLi9wbGF0Zm9ybS9j
aGlwcy1tZWRpYS93YXZlNS93YXZlNS12cHVhcGkuYyB8ICAxNCArLQ0KPiA+PiAgLi4uL3BsYXRm
b3JtL2NoaXBzLW1lZGlhL3dhdmU1L3dhdmU1LXZwdWFwaS5oIHwgICAxICsNCj4gPj4gIC4uLi9j
aGlwcy1tZWRpYS93YXZlNS93YXZlNS12cHVjb25maWcuaCAgICAgICB8ICAyNyArLQ0KPiA+PiAg
Li4uL21lZGlhL3BsYXRmb3JtL2NoaXBzLW1lZGlhL3dhdmU1L3dhdmU1LmggIHwgICAzICsNCj4g
Pj4gIDExIGZpbGVzIGNoYW5nZWQsIDQxNCBpbnNlcnRpb25zKCspLCAzNDMgZGVsZXRpb25zKC0p
DQo+ID4+DQo+ID4+IC0tDQo+ID4+IDIuNDMuMA0KPiA+DQo=

