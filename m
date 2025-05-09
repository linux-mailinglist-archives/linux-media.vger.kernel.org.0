Return-Path: <linux-media+bounces-32119-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 545A2AB0FB7
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 11:59:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A4C19C3D32
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 09:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D43EC28E56F;
	Fri,  9 May 2025 09:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="ccGMbTGA"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021116.outbound.protection.outlook.com [40.107.42.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DAA28E569;
	Fri,  9 May 2025 09:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746784783; cv=fail; b=p3MOdLAoId9GzyWDXeuLjiebkM3+s8ftCBDv0e0Kk1SgLt0igqb32ZdjOgnFyt1nfIAa3XKizSDMehC6UVM/gWSnYwA7k05A+o8b6q1QsntdyyrQambFuR8pJq3DSAUp32VcwdbND9qjeh3717qlfvMCe7lIz+4ZfcJbzv5TEA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746784783; c=relaxed/simple;
	bh=C4/xvFTkWsh9nGqw86Gi3Sv7ls17UfjDpicVzrnyUEE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=L8gMb2EdQnbxrYS3xQPwWEdLRdA+NNgkt1X8UjEynxDuHVKUUxs/9MEhMAeL6TetnZVmFKZtqris31KKgyCJs1VvqEN3Ru3F9nj1x9ZlLUxrutRNEQRDGs96NJ5E8RT9aa8uG7RgcgB01MRu/rEN5Il2jaTjkR5FCJel1vaYUJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=ccGMbTGA; arc=fail smtp.client-ip=40.107.42.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jQSK+JN3QOHK6Ftm8Q+99HMeHKL34CnDoHH6XKh0YT2d/l7gMZcYFv8puebBMsDxgh3p+koztXMmi5Tt+QT+v3h3t56Nwm5lhUyhQ9WaAgmZ/57AMLgFk62nDGTLuxhpBTDl+HWpoeaDpaj1KTx//W+Wxy6nZwG2b0PxPwRc7QKZoJzkYhTsFDsGlJefQNY9yC017vCDqjAuw7tfjmx/SWJqtxJ2NznTCnBAgQgyjhU9fM3ZqatlmxRaiEx7I2hvEvDMOlsa43WvZsEf551ze680JH3UG0tkUldso8qnOA09ubroHQPFFDzRJlC8KTCMLH9xpn6N0lvaa9TNQnxx8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RljT5MpZm3BdzcwfAjNobxBJQC+QWTcQLcFrQNSOVLc=;
 b=nl5aq8hbNNMlqH6ABoixQ8gNYGSxqPwWHV6QTqGkjxOoj5h88c0GbTWq49CmEhPySvgFQSjewc8ArjKjL2iTaFxnpe78SCCbvYYg798VqeHSvNtCnUhMkXQOgTrLHza8ZmOf0NukGewfgVDVLH9xdPYRU8WMLk+zBVuisYWoz1kLJiK6dHwQ+9OLTC8aO+ulz2592nQusna5VoMs2k9YJWe7lxxGr1n8I8087DYQ7pfKFrB+d1IHnqIU2A6eUgy53gonfT0CneN4FKD6IieoI0/S/Y93ZQCTzZ5pAOAJHlZWy5vCmUFlFwl5wN68kl9xoVMRUCPXRd79OdnKl6KPtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RljT5MpZm3BdzcwfAjNobxBJQC+QWTcQLcFrQNSOVLc=;
 b=ccGMbTGA0dYuCVOFfrU6/EIxntFo9ggAojV38EklN16GcaZSbLY+6Hb4Oyv9FDOxtkZsGpUNXdiKnl92jxSjz6Zc+HDnuFuTDVup6CZdIGUXRXSL+jN6yHAasI14zgqgmXqndELSuMgDbTqgRolx5Ne9EiC6yzf7pvfzPuQKnvk=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PU4P216MB2245.KORP216.PROD.OUTLOOK.COM (2603:1096:301:129::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.24; Fri, 9 May 2025 09:59:36 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%3]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 09:59:36 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "mchehab@kernel.org" <mchehab@kernel.org>, "hverkuil@xs4all.nl"
	<hverkuil@xs4all.nl>, "sebastian.fricke@collabora.com"
	<sebastian.fricke@collabora.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-imx@nxp.com" <linux-imx@nxp.com>,
	"marex@denx.de" <marex@denx.de>, jackson.lee <jackson.lee@chipsnmedia.com>,
	lafley.kim <lafley.kim@chipsnmedia.com>
Subject: RE: [PATCH v2 2/8] dt-bindings: media: nxp: Add Wave6 video codec
 device
Thread-Topic: [PATCH v2 2/8] dt-bindings: media: nxp: Add Wave6 video codec
 device
Thread-Index: AQHbs2lXzy1gLrNeZ0ijKXj6PUT3srO0NFSAgBWF9JA=
Date: Fri, 9 May 2025 09:59:35 +0000
Message-ID:
 <SL2P216MB124656A87931B153F815820BFB8AA@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
References: <20250422093119.595-1-nas.chung@chipsnmedia.com>
 <20250422093119.595-3-nas.chung@chipsnmedia.com>
 <20250425-romantic-truthful-dove-3ef949@kuoka>
In-Reply-To: <20250425-romantic-truthful-dove-3ef949@kuoka>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB1246:EE_|PU4P216MB2245:EE_
x-ms-office365-filtering-correlation-id: b79bb0bd-cbdb-4923-0b60-08dd8ee03473
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?z4x7ZJzj6VnAYrDkqI1qI7s1cDWePL9GqkwWLoE91tnKm2kEOT2qokXiAfrS?=
 =?us-ascii?Q?/5iiRy0mWqsY5VJ/B6n0+xBlSIshUuNGOt5o+1D/l+FcOj1tn+ow0ByPspYs?=
 =?us-ascii?Q?a/pkrteOe4wYAwk2jUkiQwv0Bvet7Ij3wt5g30bINsr7S6d9KXJCrB1rfngY?=
 =?us-ascii?Q?RQXF96TJitXd+v4gkDYSUuPiXOPmzOMZ8scthgVQHrcB7Np39EfoXG2YkS+Z?=
 =?us-ascii?Q?8NJj0L2/YlbpWKtP4b0lvEz5F/pjA4dJQ4D5mpO0Qj0m11HpiWn+XMn1ncjd?=
 =?us-ascii?Q?5dhntLnWMC/mWYo2rOeFufEOaXwcJrk+UaskHHupaO3ZbAq/7IDMZRc0uK0S?=
 =?us-ascii?Q?DB913G4n0cNq+VVQ+hX4QIR3kboejxHVF4N+j25p5IOmMk/XAAnd50zOkBU3?=
 =?us-ascii?Q?9fp6VrUWhjcnWS5nDFAVMPJqUuWhdcoWnFQ4QpvEm2aEbKNhQyls/nLU26yA?=
 =?us-ascii?Q?jYLjnc8HE/QyQjqKfukEoMr5MqCDKfz0IfrdmqfYaF/uP6ZTJ0/uQECtt0Y3?=
 =?us-ascii?Q?EgNB7vUHIo+gE7xhqVdbICf+iIxFJyuH2NLIhwAQdrmzGUkJB3OagdVD5RKA?=
 =?us-ascii?Q?xcFLp3xAtdP66E6l50+zz83f+FhBD7jQlCnrHNVKrHgYg/JAAVHKRk1kAH/4?=
 =?us-ascii?Q?8Uq7VEVmz1A++bvZDeNCrFzYee8z3ELXG+y7srUGBxqnxTig86lS9q6RRkqE?=
 =?us-ascii?Q?RAkYovMlcY4MX9hSW8lrD3VY579IKE3w+9/WqXBFB4zQvJl1UZFk6Z0mhNxR?=
 =?us-ascii?Q?o9aFrQyn74y3oCQFsY4Xn4FnhX0eja6XhUYhIXILPDZv4DajsUjhJ7jCCgwX?=
 =?us-ascii?Q?yLDk6gq1rsiBFIO7zIGwts10mTOvezWABMmEBw4vCP7VEROOXlmHDMUw2ic5?=
 =?us-ascii?Q?TnYHK3dYQIB9zHFVnWWOtpcTxpbwwT5eXW/4dmQgIOaqea7XmifcbrWv8cIb?=
 =?us-ascii?Q?ZzIEhRNg5D5UkL+2LJL1rxYG4/lQGbBSt4Ifrw/VYM25tzw2jQYLmbiBUSRN?=
 =?us-ascii?Q?dTzH0hay15f7Dt3mOFrlTOJoxtwXNEKzp6swTkTlBFygMnJDeqTDztFcR6Ti?=
 =?us-ascii?Q?+KR5TrA7/BcLQO0vaeVOO6zPnaZdC2FeOQXJnIWYwe+cb+J8aseZgcAZ0KRR?=
 =?us-ascii?Q?qQlFiCTKWFKHnEhNXBn70th+kJKGaRfhunDLDUMG4xq5bygwIjztMLKZzSHk?=
 =?us-ascii?Q?ew4mimsZt7aJHdDTZbBNLfVEDbS6+xRf0aZKfBonqQBejY09YieBWjBY17XS?=
 =?us-ascii?Q?mF5Xd9UBDhtVYWa/nR3ujNrB7f+yLlMl9QUbyDIWWpykv8dyexh4Y2u6nJWq?=
 =?us-ascii?Q?9O3XLTTi+T6kX3SoYyfAlvyrEqkJFbst/oGCaCoLoSGNcmqcYZb9sjowVLoh?=
 =?us-ascii?Q?6zgN03DHFxwROf6/DeKstWL29+a7nrJ485NaVxhJZyqlTV8SAcu50VwwyrH2?=
 =?us-ascii?Q?kXouBWMLa5c=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?OLzlRedpHZTXSOlVeid0qqH4T65hQ1LvEM8Pe1N0c2ohMeQjolvuJWzV6zGd?=
 =?us-ascii?Q?3BSdBzM5E1DVQ+G/LcyEDzdoeqi0s8i9kjm+VI65A74WNSzXRGyRUXEOrKn/?=
 =?us-ascii?Q?bt4oCoDJgtHJLUDgElcUXNRB8FZQM+zRvwxdkZPcR3BH9q96j3N1Is5VB7dU?=
 =?us-ascii?Q?0JbTIMXq6F9QtJGTnTuLR/NnY7FQ36pTufrE1XHvudrYXncUp+HXNiKbUnUY?=
 =?us-ascii?Q?Si+EF+LGYKwiQlzSyG6NyqppZ53+VNkpx1ct7bgBlFgDTMFFb5fjc7ieOib+?=
 =?us-ascii?Q?Cb/T96clPALQpb/Qg8j6w4y2KlFZMzctDetF8QxtMBviqUJLo/Z0lw718x6y?=
 =?us-ascii?Q?5NtC0ALsgfvzSYfyZugpYiZ3NLgphYkk7Scz5T6iFYye3ti8bvCM7q2dEUXp?=
 =?us-ascii?Q?0yxu2IWvdS19CpqMWmagmwXMc6smD2cKn/SESw2bEZ8Vl9XitaiLlckcYkJD?=
 =?us-ascii?Q?042IeM1smBaxhcmojZv/exOc904y+btognjED0pVHGqO/JvRoeATFbtcEZI9?=
 =?us-ascii?Q?o68ABAN3TeJzSOpCKLW2fibLAIV75RgPFA7cfdNqu+iXDXc7c7oXPZnylAFh?=
 =?us-ascii?Q?PUuoLIpiSIA0ZnMaqNtlCSlnMR0hzaxXeKR1KIRfKp+SbxQxcnjL63ure1Su?=
 =?us-ascii?Q?3vj3NuilmHkQrW9fO1JgkXgUXVMi04MDk0zAOWV2SFAMdf+1e8RusqdFHFjN?=
 =?us-ascii?Q?fz40TNvHmzArGAstJxeH6lZ6lw5Dz8J8b34py1yzIuk6ZnXAtCuzfWLjcZ3N?=
 =?us-ascii?Q?oGnfUeTpskYRaU2gJ6FsCXCL3YsFri4mxaHX+xKNnXrEaWlK1+CpD2nUqgx5?=
 =?us-ascii?Q?U+3k+K0AiL6fheCh0LM5jQNX07sYcNNXvP7uXG0Hjze0aDC2weKJLdPL+/gH?=
 =?us-ascii?Q?pERPn7Ui9rllu91ps/dYCzOGfJEHd6kGs/B9KpRdeU0gECSngrn7e2Zgzuri?=
 =?us-ascii?Q?Mtw9t02aSXh2E6W4rTdwglksDf98huccuOPCfsUobkceugaEeza4wbD6UMpU?=
 =?us-ascii?Q?DCeJU0VwJsydaDMGRqNGNuVJ8HPuvgQ35CIAGfiGLIUqF2Sv8FfAco2u999E?=
 =?us-ascii?Q?usytK2pLhtABJ6Xm4cSj9vXWLzYQZcP6bYKIrfPbgoxS5vp+kpwruxv/jg0z?=
 =?us-ascii?Q?xnr7dYNuy1SFzBGlaV+xGhJTCvy4cj4dDabpgb37Gc8rgFQemkqIfUvcQ79B?=
 =?us-ascii?Q?rpu007h9TGZiIrfvZSKei4KiqLIKIRXEuuxLEW2HxLLbOpqY5F4au+sfJNEj?=
 =?us-ascii?Q?fdJbdWY3cr0NzdY/Hy47j54K0It3EdZM5X99N0qpc14mddZ/o9K7xKbaXgAf?=
 =?us-ascii?Q?NNN89CPwOox+RokeanCX+n2J0B0mmoO/FsGS/2benmr97i/qO++gi8GwBS2Y?=
 =?us-ascii?Q?fR0MgbfOc9+tlZZKBAmvZGBTnKT6bmU2VuEqWyowhGOQ/WF+6Bs7Q4KxR91h?=
 =?us-ascii?Q?zOivZmzIYsSy3CfOICiyek1iacBvaqYUbjeVn340M7J3qXYdRYhIHJOhNtQm?=
 =?us-ascii?Q?OZMumh12A9XcW0/p69GCL8pudmAS28O8V4hKtAm1dfs9SZ1fODTycISdkMl1?=
 =?us-ascii?Q?GUISpjgnX7PuU9JpWI1yQLWBCcvFIaz5Nydlm8y0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b79bb0bd-cbdb-4923-0b60-08dd8ee03473
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2025 09:59:36.0212
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ySeyP/Gd8ZGPM4kkv83+Vhvpj1KPwCwOsVvr9PmLFTf9N4DAT3czITUNduQ1sXwFFbffDP6xcGd2porWkexIkgJgAsdtf6Jp/1p+xS0oPuY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB2245

Hi, Krzysztof.

Thanks for your feedback.

>-----Original Message-----
>From: Krzysztof Kozlowski <krzk@kernel.org>
>Sent: Friday, April 25, 2025 7:34 PM
>To: Nas Chung <nas.chung@chipsnmedia.com>
>Cc: mchehab@kernel.org; hverkuil@xs4all.nl; sebastian.fricke@collabora.com=
;
>robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org; linux-
>media@vger.kernel.org; devicetree@vger.kernel.org; linux-
>kernel@vger.kernel.org; linux-imx@nxp.com; marex@denx.de; jackson.lee
><jackson.lee@chipsnmedia.com>; lafley.kim <lafley.kim@chipsnmedia.com>
>Subject: Re: [PATCH v2 2/8] dt-bindings: media: nxp: Add Wave6 video codec
>device
>
>On Tue, Apr 22, 2025 at 06:31:13PM GMT, Nas Chung wrote:
>> Add documents for the Wave6 video codec on NXP i.MX SoCs.
>>
>> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
>> ---
>>  .../bindings/media/cnm,wave633c.yaml          | 165 ++++++++++++++++++
>>  MAINTAINERS                                   |   7 +
>>  2 files changed, 172 insertions(+)
>>  create mode 100644
>Documentation/devicetree/bindings/media/cnm,wave633c.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/media/cnm,wave633c.yaml
>b/Documentation/devicetree/bindings/media/cnm,wave633c.yaml
>> new file mode 100644
>> index 000000000000..5bb572e8ca18
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/cnm,wave633c.yaml
>> @@ -0,0 +1,165 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/cnm,wave633c.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Chips&Media Wave6 Series multi-standard codec IP.
>
>Drop full stop

I see, I will remove it.

>
>> +
>> +maintainers:
>> +  - Nas Chung <nas.chung@chipsnmedia.com>
>> +  - Jackson Lee <jackson.lee@chipsnmedia.com>
>> +
>> +description:
>> +  The Chips&Media Wave6 codec IP is a multi-standard video
>encoder/decoder.
>> +  On NXP i.MX SoCs, Wave6 codec IP functionality is split between
>
>... this and ...
>
>> +  the VPU control region and the VPU core region.
>> +  The VPU control region manages shared resources such as firmware
>memory,
>> +  while the VPU core region provides encoding and decoding
>> +  capabilities. The VPU core cannot operate independently without
>> +  the VPU control region.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - nxp,imx95-vpu
>> +      - const: cnm,wave633c
>
>... your drivers seem to use soc specific compatible, so I do not see
>value in generic compatible. It would have to be good enough alone for
>drivers, but it is not.

I agree with you. I will drop the generic compatible name and
change the yaml file name to nxp,imx95-vpu.yaml.

>
>> +
>> +  clocks:
>> +    items:
>> +      - description: VPU clock
>> +      - description: VPU associated block clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: vpu
>> +      - const: vpublk_wave
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +    description: Main VPU power domain
>
>Drop description

Okay. I will remove the description for power-domains.

>
>> +
>> +  "#address-cells": true
>
>instead const
>
>> +
>> +  "#size-cells": true
>
>const

I see, I will change "#address-cells" and "#size-cells" to use const.

>
>> +
>> +  ranges: true
>> +
>> +patternProperties:
>> +  "^video-core@[0-9a-f]+$":
>> +    type: object
>> +
>> +    properties:
>> +      compatible:
>> +        items:
>
>Drop items and keep just enum

Okay, I will use enum directly.

>
>> +          - enum:
>> +              - nxp,imx95-vpu-core
>
>So this is another proof that cnm,wave633c is wrong. How cnm,wave633c
>can come with nxp,imx95-vpu-core child?

I understand your point.
I will address this in my previous comment. Thanks for pointing it out.

>
>> +
>> +      reg:
>> +        maxItems: 1
>> +
>> +      interrupts:
>> +        maxItems: 1
>> +
>> +    required:
>> +      - compatible
>> +      - reg
>> +      - interrupts
>> +
>> +    additionalProperties: false
>
>Put this immediately after type:object

Okay.

>
>> +
>> +  "^video-controller@[0-9a-f]+$":
>> +    type: object
>
>Same here goes additionalProps.

Okay.

>
>> +
>> +    properties:
>> +      compatible:
>> +        items:
>> +          - enum:
>> +              - nxp,imx95-vpu-ctrl
>> +
>> +      reg:
>> +        maxItems: 1
>> +
>> +      memory-region:
>> +        maxItems: 1
>> +
>> +      power-domains:
>> +        maxItems: 1
>> +        description: Performance power domain
>> +
>> +      '#cooling-cells':
>
>Keep consistent quotes, either ' or "

I see, I will use consistent quoting.

>
>> +        const: 2
>> +
>> +      sram:
>> +        $ref: /schemas/types.yaml#/definitions/phandle
>> +        description: phandle of the SRAM memory region node.
>> +
>> +    required:
>> +      - compatible
>> +      - reg
>> +      - memory-region
>> +      - power-domains
>> +
>> +    additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - clocks
>> +  - power-domains
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/nxp,imx95-clock.h>
>> +
>> +    soc {
>> +      #address-cells =3D <2>;
>> +      #size-cells =3D <2>;
>> +
>> +      vpu: video-codec {
>
>Why this device does not have MMIO? Sorry, but makes little sense and if
>you posted and tested your entire DTS you would see why.

I initially thought that if the reg property is declared in the child,
it would not need to be declared in the parent node.
I based this approach on the mediatek,mt8195-jpegenc.yaml binding,
where the parent node does not include MMIO.

But, if this structure is problematic, I will address it in patch v3.

>
>Can we see the entire DTS?

Sure !
Below is the cnm.wave633c.example.dts file created from dt_binding_check.

/dts-v1/;
/plugin/; // silence any missing phandle references

/{
    compatible =3D "foo";
    model =3D "foo";
    #address-cells =3D <1>;
    #size-cells =3D <1>;


    example-0 {
        #address-cells =3D <1>;
        #size-cells =3D <1>;

       =20
        interrupt-parent =3D <&fake_intc0>;
        fake_intc0: fake-interrupt-controller {
            interrupt-controller;
            #interrupt-cells =3D < 3 >;
        };


        #include <dt-bindings/interrupt-controller/arm-gic.h>
        #include <dt-bindings/clock/nxp,imx95-clock.h>
       =20
        soc {
          #address-cells =3D <2>;
          #size-cells =3D <2>;
       =20
          vpu: video-codec {
            compatible =3D "nxp,imx95-vpu", "cnm,wave633c";
            clocks =3D <&scmi_clk 115>,
                     <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
            clock-names =3D "vpu", "vpublk_wave";
            power-domains =3D <&scmi_devpd 21>;
            #address-cells =3D <2>;
            #size-cells =3D <2>;
            ranges;
       =20
            vpucore0: video-core@4c480000 {
              compatible =3D "nxp,imx95-vpu-core";
              reg =3D <0x0 0x4c480000 0x0 0x10000>;
              interrupts =3D <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
            };
       =20
            vpucore1: video-core@4c490000 {
              compatible =3D "nxp,imx95-vpu-core";
              reg =3D <0x0 0x4c490000 0x0 0x10000>;
              interrupts =3D <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
            };
       =20
            vpucore2: video-core@4c4a0000 {
              compatible =3D "nxp,imx95-vpu-core";
              reg =3D <0x0 0x4c4a0000 0x0 0x10000>;
              interrupts =3D <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>;
            };
       =20
            vpucore3: video-core@4c4b0000 {
              compatible =3D "nxp,imx95-vpu-core";
              reg =3D <0x0 0x4c4b0000 0x0 0x10000>;
              interrupts =3D <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
            };
       =20
            vpuctrl: video-controller@4c4c0000 {
              compatible =3D "nxp,imx95-vpu-ctrl";
              reg =3D <0x0 0x4c4c0000 0x0 0x10000>;
              memory-region =3D <&vpu_boot>;
              power-domains =3D <&scmi_perf 10>;
              #cooling-cells =3D <2>;
              sram =3D <&sram1>;
            };
          };
        };

    };
};

>
>Best regards,
>Krzysztof


