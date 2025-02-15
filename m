Return-Path: <linux-media+bounces-26175-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0AEA36F66
	for <lists+linux-media@lfdr.de>; Sat, 15 Feb 2025 17:21:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62AA01894C1B
	for <lists+linux-media@lfdr.de>; Sat, 15 Feb 2025 16:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7582F1E5B69;
	Sat, 15 Feb 2025 16:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="gxreROLM"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11olkn2109.outbound.protection.outlook.com [40.92.18.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418391AAA1B;
	Sat, 15 Feb 2025 16:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.18.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739636328; cv=fail; b=Gwlk+Kv2qLGDit1NiLBqlVsA40nrWJdK6gncSSEqr0z7MS3AmbBOXfzqKhFWUlFqk2w/ZRCQHtnJ2XI4J4LXzAQjGh+dB6rCgs2P61lGv7gUvHjZgtk+Yk2YRhCvxme0smR47N6FOsC0P9d6aP0y2gkoydFWQfawT8ZWNW/Ye9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739636328; c=relaxed/simple;
	bh=tpMGt5Jhg/K4HYz5YhnQsBVxWwqqJSPSsRYv2iBQexQ=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=DrMgSVdh3qDaEpF1yZSBSdIkRKFPyeHmweJTLnvPRC1NslcQvrrzYF3/2s6y6vJH0kQEP7DbBY3w6YSHub9V0g7EGm7bLHj/H+CCCC041HQuzYfsqHHynd2fuATyJqnLcphd+h2x5TmTDEcpdbM5E3wmXGGoE2NOnkmElfjLqkQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=gxreROLM; arc=fail smtp.client-ip=40.92.18.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yPiN5wWyJIlOBd06kuc/Wg+W75PO7+XeI0rtA6zLzjecTS/DYsPKGGoGpshL1H0otUQkIpIVfrEiM9i/y9TVUMRsd9Y/b125pLL75smtppaKffVRB6mceBGDzEBL29vuRyHbhvs+kj7vkyV14ozvcAMQU2yGVgt1siIlDpTwzxw73wbVmklgyhRzF1aH81s0cBhyURMZl2m+v77FUkc23hIXxt0zG0bTlL0ekW9t45GHQn9rsj3d3fOq24vtGPLPs+qh43vFi6iMlEI9nnFghMfTNSZ/kAK9eY4USF6qtJlv/HmTUXUrx0Neje4jzG7fegelSlEVdZ3o3DHrM/y9aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MOCxqX0krUUVGP/ZLtgEfnMcUuW14HVjORRy/smTwHo=;
 b=hp1/rLLxrs2t9jD4uXyihVk7tptlzdv1DNyvLSEAy0p0nEHmR5jUTipAvY5s89ciHBmSRMinbuhDS8d9DxFXhTzh0R1b9ZLkbL1zr8e5aexXOhTGTZXxJFLTPwJ6jwhK2bQNTGlMvkZfwfNraMyc3pEyUPnBOHVKJWDZITUURHCzN4zf44M7zPTGyzULlQkarjoypFRoIoxcl0e+RA4PFyLAds74BPYbO80F8IjlTtaU9+PAlIVER/EziQ49dvcznmVhX8SpVY3a7LIn8H1tS4ImsaMZmcd/tMSthi+EeVGDzcMP4WE0pOwQ8Atm7J0JJ0mIeMa8qC0xifDO0NOV0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MOCxqX0krUUVGP/ZLtgEfnMcUuW14HVjORRy/smTwHo=;
 b=gxreROLMJPbbiexZeVBlXDbPwfJQSyZEjGQ4fW2c3vGwWsrsUMLFhs6UvPIqYTbMMR5C5kEyAcTvKHhm8U1FcwvpmCzBCl1G0u+r82TnZbEPxrhJ/msXW7LjBBYOF49+ZAKj2Xc2OHO93sP2Up61sNTvET7WzWgiYhWvdwX9iqNmkO/pxEAsGK98XOzWL8Z2may2Lt2eKJvRFdc47oQGpVme0X6liVkcGoQ6uJFj5wOkbqvNygdkDy5bBbwcrX2nDOKR3q/nWaVEgVkVJkAsjeoSlav8mVLWa1oXgvPgEqhBVGF/qsaCFdeC8fSGeNtIcsLwTrX5TcySmtNWWelCVA==
Received: from PH8PR12MB7112.namprd12.prod.outlook.com (2603:10b6:510:22c::15)
 by DS7PR12MB8249.namprd12.prod.outlook.com (2603:10b6:8:ea::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Sat, 15 Feb
 2025 16:18:45 +0000
Received: from PH8PR12MB7112.namprd12.prod.outlook.com
 ([fe80::527b:a523:24c6:a1d4]) by PH8PR12MB7112.namprd12.prod.outlook.com
 ([fe80::527b:a523:24c6:a1d4%4]) with mapi id 15.20.8445.013; Sat, 15 Feb 2025
 16:18:44 +0000
From: Randy Kimmett <linuxish@outlook.com>
To: "mchehab@kernel.org" <mchehab@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Avermedia DVD EZMaker 7 video distortion on capture
Thread-Topic: Avermedia DVD EZMaker 7 video distortion on capture
Thread-Index: AQHbf8INwEPoo7S73E2nqZFDyQuDRw==
Date: Sat, 15 Feb 2025 16:18:44 +0000
Message-ID:
 <PH8PR12MB71128FAC43D4FF7BC3D64050EAF92@PH8PR12MB7112.namprd12.prod.outlook.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR12MB7112:EE_|DS7PR12MB8249:EE_
x-ms-office365-filtering-correlation-id: 6a8a58bb-e4d9-4e3c-0e47-08dd4ddc6b6e
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799006|8062599003|7092599003|461199028|15030799003|8060799006|19110799003|10035399004|3430499032|4302099013|3412199025|440099028|102099032|1602099012;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?0hywhNaWn382zRChOZvvWoHQJ/2Pz+SUqIJGIZgEKGAMXKsl9wfbk4tp8c?=
 =?iso-8859-1?Q?mYCnxkfEBEy1FIg2z0jjIvJnb6NlgDBronRpYvMrlhrPEafQMQiGnuQZZP?=
 =?iso-8859-1?Q?syvjJQ2+H4jrxQ0/VgATWJXXcrw/M6s87ELeq5fIVNu9bLDBCmSVse6+8/?=
 =?iso-8859-1?Q?ZuK2Ne7qkl4ozaCSnkSEJW8jabTS7NJKia1Tkos62aQchguCAZCZHGII8W?=
 =?iso-8859-1?Q?eyy16L/kOwGw8yNEPSbgxuoISV9tZS0lueLRVoHcvKnHYg9HdGs4BXPlBT?=
 =?iso-8859-1?Q?sEZFaW4dUF8PeNhF/kSCFkQAFOmbMFvHJjZdZD7VQjBaylounFPjsXHYNj?=
 =?iso-8859-1?Q?cgl79vIyfaHJCopWRct99pZV3OYGBlosr9AILuFLLGZShWFIA52rQmWdbH?=
 =?iso-8859-1?Q?QXjMHhz4q3VO7+YFN44XkJVb8j1++2iFY6WoYBIHqfO8Jh8PkPB6RQbnf4?=
 =?iso-8859-1?Q?AnHCmeSxplF9zFD5H+ElYL5j3+wvuLNCVl4mmwJfvMN1EGIPMx2pmpW5wn?=
 =?iso-8859-1?Q?ALfOx/JHeCbftqp4XuD6YxGTecbkBbhHDSNYAd1unS1FmD0R23doAPOAqn?=
 =?iso-8859-1?Q?iXXiO0wPsKQtSP3y3jcPqO3RDwhPCIQTOy6biF7nSi7tGhagqZydYJTvPE?=
 =?iso-8859-1?Q?Sgf/22P7v2OKZ8Nc9nWwEF8QW8lIYG1MA4hx8EeUVDzbHziwplJH5MTuUi?=
 =?iso-8859-1?Q?Y/MQ6UwKLk0rQGZxSn6YNfRmu2kTLYVfjeezl9jW4V20Cyh9mMSmMJj1kq?=
 =?iso-8859-1?Q?qQBlJrFY9lVWT/2sqH/xX4J/1oijFlOD+2hkKtFIYpAAqpzp/HL2oEw3xw?=
 =?iso-8859-1?Q?BtSnG8GYbytESoBcE+CLQZOTlty/p+GUi+aQ4lyAeBXZsdzo8pT4a2g6uP?=
 =?iso-8859-1?Q?FVvan1unxgACAkQK85FWWcb9wR5eTNfHUsG6czUY1oDgR65K8ubjaQlmRf?=
 =?iso-8859-1?Q?yc0GBnMsZtcL0+P3KjabK8Vq758nPFzqo2SpjyBlQNuwOa9p+8R0moBinR?=
 =?iso-8859-1?Q?nUMy4y1fGGU7yMTJiDsXHNb8I9MAqGylWhnarTXSjUo9dDCgjsIrGeCsyo?=
 =?iso-8859-1?Q?aakHE/ie39vLEqyBgwChfhwzyveGay0DWGvyhlKiZYVYryh8Qs63H/zxsX?=
 =?iso-8859-1?Q?gmgcyhzlPKcdVNmQufP8OXcKOLsdtxjjTV/ZpdOtEg1wfZZx+WhYGKgHQ7?=
 =?iso-8859-1?Q?B2sesnNKy1JdoVgC9pjIK3quBuKBUtqdNf18lvk78X++7lT1tL/JoJ1Lvi?=
 =?iso-8859-1?Q?edtq+YnuK8S+ISvh9V8vNeY6u/O3WoQZbBVcNrZHM=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?s4A33g7gtQeFriphCvhbFWMW4NyUNQTcB2ngVWBEzE1FOX8ILMKsWBEvfQ?=
 =?iso-8859-1?Q?XyLnqyQtFSK7Fd81JF+shcmKJzk6XOZVO+ExrYKXQlJmN9H+gMoibtdxTo?=
 =?iso-8859-1?Q?zJXzC3Jb1b8c2ABFoNZeNQbPdKYmqwIXorniAUSMmcyQyUPPRwoHAxT+gt?=
 =?iso-8859-1?Q?brqOxaQIBhqPf0SLTGlVhI2qUMjwB8RhyVYmw8CTwqlJhAf/StRgsHtePL?=
 =?iso-8859-1?Q?MnKi+237DhuL7vJCPBNoZs4ddnQ3xkqauuJx0Ht1DYU/ZtZb6e8G9iTUOf?=
 =?iso-8859-1?Q?cF+uIDnu9BdoWJTMFzD3E76Yg9TKv79jZMSNf/27k3EbTztSeGYmec8ogI?=
 =?iso-8859-1?Q?iiNNbQhfTUU+vqGBdz/X4hEqP96zEISAKIcUQyiOR9DX5wQ3dOXdJoMybK?=
 =?iso-8859-1?Q?oqDRAzDYY/oKmGt7+ORDMkUG9pDHv03v1+svx3WN/mU9G4QQUBrKcOE8k0?=
 =?iso-8859-1?Q?9yNax7pqXafN1rrVPqS3Q10AwvSOsgk3y73M9FXMG3WQ/WK3MiWG+mw9YO?=
 =?iso-8859-1?Q?0Kklrwc7zFL5qk+RFx/TFH1XuBKgnCaZtx0JvdWtnebaECV+9aZwOG0Wjt?=
 =?iso-8859-1?Q?z40/Aq4n+NDaRyfj6AbPtgZOD47WeP+x7EdGHGJc4aSf9tzAOFM+eIwIOD?=
 =?iso-8859-1?Q?k2ELRA22FGbjEujdzvdnLTaV6iCMUXIeApYJ0/Oc27P+zr025NrqoSTVcE?=
 =?iso-8859-1?Q?x0JNwZfWECDU23cKdpoxWkamdeIIh2/zsT+3CPUD+ZaRUb1lmeI5yZrJh0?=
 =?iso-8859-1?Q?UlvjcmT3dYuh4BH60Eipiwx4wvNK8AXpgXREr2YKk+0MvC3PR/otnsJ3LW?=
 =?iso-8859-1?Q?6jpm1OCTSFTZNR+XiN1wkXY5l60rK6TEirMNhoHw5/nzzAMz3PYG3DMa8M?=
 =?iso-8859-1?Q?HUYFUnG9Xn8jr7EkmC1V7u1WbMpX8gzaEFofnpoPtliMsKFimAFTAVBnD6?=
 =?iso-8859-1?Q?MtcZygZkNTj9aEavYHKtJum0TDzv0hTJGqUR6HoG0cCWZ6itpC/AX4Fkt6?=
 =?iso-8859-1?Q?t6Rvy7CvB5ZH+nRKUW982c6JTIDMuX3hSiKCkA29ArdB1ThaM56z53wfz0?=
 =?iso-8859-1?Q?ZsCWliIcP5GtOslJv98uUAIT8JNo+Jk94romQaCjD85RWYGqsrcauWfbw8?=
 =?iso-8859-1?Q?0lRtyxZIYhOihn04RpKSbmxi5kmBmKb0Wxy4FDXUZyr7I185Bb/tM80/CM?=
 =?iso-8859-1?Q?IgGiyagys92EzHcu+AgHWilaDVUDOwzxedTHyXtiykis5uteudT73roHKM?=
 =?iso-8859-1?Q?6aNWbD42vyJ9jmKVqFFsflebeMGG6ikAVXXfibA4erg+TSE4oJjU9+x623?=
 =?iso-8859-1?Q?9V/3bnG5XBL01QBvI3Hvgdu/pw=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7112.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a8a58bb-e4d9-4e3c-0e47-08dd4ddc6b6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2025 16:18:44.6448
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8249

Avermedia DVD EZMaker 7=0A=
Model: C039=0A=
VID:07CA PID:C039=0A=
Module used: cx231xx=0A=
Distro: Manjaro=0A=
Kernel version: 6.13.0-1=0A=
Components used: Conexant CX23012-11Z (according to https://www.linuxtv.org=
/wiki/index.php/AVerMedia_DVD_EZMaker_7_(C039))=0A=
=0A=
When capturing analog video from my old Hi8 video camera (NTSC M), the capt=
ured video has banding and is grainy, it doesn't matter if I capture from t=
he S-Video or Composite, the results are the same.  On my windows PC the ca=
pture is perfect.=0A=
=0A=
dmesg output:=0A=
=0A=
[31173.105709] cx231xx 3-1:1.1: New device AVerMedia TECHNOLOGIES, Inc. AVe=
rMedia C039 USB Pure Capture @ 480 Mbps (07ca:c039) with 7 interfaces=0A=
[31173.106062] cx231xx 3-1:1.1: can't change interface 4 alt no. to 3: Max.=
 Pkt size =3D 0=0A=
[31173.106065] cx231xx 3-1:1.1: Identified as Conexant VIDEO GRABBER (card=
=3D5)=0A=
[31173.106649] i2c i2c-13: Added multiplexed i2c bus 15=0A=
[31173.106704] i2c i2c-13: Added multiplexed i2c bus 16=0A=
[31173.214440] cx25840 12-0044: cx23102 A/V decoder found @ 0x88 (cx231xx #=
0-0)=0A=
[31175.444434] cx25840 12-0044: loaded v4l-cx231xx-avcore-01.fw firmware (1=
6382 bytes)=0A=
[31175.493936] cx231xx 3-1:1.1: v4l2 driver version 0.0.3=0A=
[31175.620281] cx231xx 3-1:1.1: Registered video device video2 [v4l2]=0A=
[31175.620318] cx231xx 3-1:1.1: Registered VBI device vbi0=0A=
[31175.620423] cx231xx 3-1:1.1: audio EndPoint Addr 0x83, Alternate setting=
s: 3=0A=
[31175.620426] cx231xx 3-1:1.1: video EndPoint Addr 0x84, Alternate setting=
s: 5=0A=
[31175.620429] cx231xx 3-1:1.1: VBI EndPoint Addr 0x85, Alternate settings:=
 2=0A=
[31175.620431] cx231xx 3-1:1.1: sliced CC EndPoint Addr 0x86, Alternate set=
tings: 2=0A=
[31175.620433] cx231xx 3-1:1.1: TS EndPoint Addr 0x81, Alternate settings: =
6=0A=
=0A=
https://bugzilla.kernel.org/show_bug.cgi?id=3D219764 (also contains a sampl=
e video clip of the issue)=0A=
https://www.linuxtv.org/wiki/index.php/AVerMedia_DVD_EZMaker_7_(C039)=0A=
=0A=
=0A=
Any help and/or suggestions would be greatly appreciated. :)=

