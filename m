Return-Path: <linux-media+bounces-66711-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hXeFKC1pS2rpQwEAu9opvQ
	(envelope-from <linux-media+bounces-66711-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 10:37:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4388B70E2E4
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 10:37:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=siliconsignals.io header.s=selector1 header.b=c3slOcRW;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=siliconsignals.io (policy=quarantine);
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66711-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66711-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D8153304B3AE
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 08:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3470C3EF661;
	Mon,  6 Jul 2026 08:03:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020113.outbound.protection.outlook.com [52.101.225.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AF7395AF1;
	Mon,  6 Jul 2026 08:03:20 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783325006; cv=fail; b=c2SPA4uvPDq7L6OkF1heeErGkulI+qVE2mtzA8ozPufsHhMPTklmhlZVd5SSpbLD0D0/wpIwSjYYyMiB52qYGl1FtwSfOrMU3qDz9XZCwCXg/EPozJLrjMfSOPv37rCZqmv2W/+Bw6zrzKdJi5kwn2ftuYSZ+KC3j9Jim079nRM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783325006; c=relaxed/simple;
	bh=q24B2GVRGo6v7+xjIaBEqYZfJQAk86ZBz23lJfvtVQ8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BWIweH7z4Lrxlqg1andT2nU1z7ECP3SQ0GK32gBHZe04jKq4ZLd0TQOAwa9BQlbAoP0HgHuBFl2Iebmijnub7tOSh4WC9Kv+ijNf0GEdnt2NRgAPL6Jgi8FeXn8elJGJHfIRSaeRfkOhoxcfVTiiiJPvEE0boon+se6sVGHSj3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=c3slOcRW reason="key not found in DNS"; arc=fail smtp.client-ip=52.101.225.113
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=npzEvWbNHg13zhlYHTiKZOX7LgUwpzpD94JE9CwdiPrjmncXzShPtBqNp2yltw13q+1V06v54D9IheO0xzWpQnCJFyhYf5IdHmMBEvX3k0Kk8I1fyXQ2h1xMASdrVW2Ds3F54vOSJTN7Vs5cWPtfTM/24FR0M4oy4S/PuJ0dpF0ADPQTtmSC9EDtD3adCn0og/BloOAgTSC9KBJxI38PrtREIlMCjTNkGQ8pB7rFKrP3VP8H5jcDw1/Mfp+RSGxDH6gaZAUMT0/zEbVHaiedhn9qhyEuq3b13fCArWkuCpp3xHa3Y/ywSpjsA5J0tOV/jQZ9WzAG8LnwI6I4RU1zMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Qu9bHorpwN2n4lp0K+qPPj3VScX5HtD5xkrGAdLIq0=;
 b=i7wm7K/UdgbA/plX7lEoZl6ORAfWlPTdOxRkajttx9Bl7kS56ByzZ0yGJ/gb2nMlWVmqpeYQfvcps9CVYLdwA6mxbtGlHKJ+hvgRMWL+ClXDgPWVMeCBWOF5JDM5s82zaF1zJUEHWURiQ9oF1Z5YsqY12OelNkeGrsVlo6RlRkyONFurLivFZSvm5hWMKzm/nFxTD3VBN1yIRsjm0EoJBFWlg0IEXG0o1MH6rzTh4KK9n+mqyGMziiJdTm5iUmS8iG6aehOc2cj22jpyozUEpnhLI4AEoQ+yBxa4WaSp2pKLoJlhxP4NSqQicRBE0m1o/1rWlGwjq8Db9arShWMhkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Qu9bHorpwN2n4lp0K+qPPj3VScX5HtD5xkrGAdLIq0=;
 b=c3slOcRWpm4esDFZu3/b8JVCtophITIK1jmOKqFbI0aCa6/L3nZl77bBetgEW8+mxzKvyFPlss4eYoXMDap0GNUPHSHZ70uasihNGX7pacYFZDVmilWwivT+hsHV47TaMqFAzumRW6HIpY/Sxc58SsJwe4mo63thpU1xpko3FDZw7ThfPhr/LO43oZ288hITQfI7a8P6VDDYC+lhiO/LER3JxGpJs/IVNpa7ioHx8HsG0UjDBpF+aVSJCWARgSCqoMXE1FgRevCNVa44puXqGnZatbqNYz+YdhZ1W6yCP3Ze+LsugcCE1FmsH8UVaguo/29Ll1nPx9igJMXshjEQvw==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB1673.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1a6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Mon, 6 Jul
 2026 08:03:15 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.21.0181.010; Mon, 6 Jul 2026
 08:03:15 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Jai Luthra <jai.luthra@ideasonboard.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Lachlan Michael
	<Lachlan.Michael@sony.com>, Ryuichi Tadano <Ryuichi.Tadano@sony.com>, Kengo
 Hayasaka <Kengo.Hayasaka@sony.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v5 2/2] media: i2c: imx678: Add driver for Sony IMX678
Thread-Topic: [PATCH v5 2/2] media: i2c: imx678: Add driver for Sony IMX678
Thread-Index: AQHdCs1WXDQ70nvFAk2i/2FRf0va9rZgGoDF
Date: Mon, 6 Jul 2026 08:03:15 +0000
Message-ID:
 <PN3P287MB18294817970468A1498C4BAB8BF12@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260703-imx678-v5-0-0523dbed0dad@ideasonboard.com>
 <20260703-imx678-v5-2-0523dbed0dad@ideasonboard.com>
In-Reply-To: <20260703-imx678-v5-2-0523dbed0dad@ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN2P287MB1673:EE_
x-ms-office365-filtering-correlation-id: 6220c5f7-126a-4b74-6dad-08dedb35088b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|3023799007|4143699003|56012099006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 EZKsnRDie4/l57K99lZX7HN6hx9ATt58imIzHj/j8+v0lmYEk2/ju8MxtpDLT+YTCmPh7AaFDesCRrBAg/d+ACWTPW23H15/2OmYCXm8XtVHaTIYWUwXlTFJCva5g6VdgtBN+Z7UwNvrQ1SMJZopPaA7PHfceCiXWbJ1UZnV7HwYaNtPAeuWHoS+lVEfYmE2AiE7HcmSVnsNcxIBwV+3IlXafPXA1QRWXpU5lRsC6rKu3yLplM7Sx5gQDthAaq23EhAb3/A/5Oj1QRsEn6esSm1yV5YvHn3KuGyvsODjo42tlBisMcsCpTm94gQpmjziSRpoPf+vVtBQRFh8RMsvzQNixarPZqBQGMFTFi+S5BP9KpJXZQo4E3XxRI2SSV1jCcFq8AQ1rbpF0xh+vVl19w8VeLGcKQStd4Q9t10rutr7A7RH6pNBPfO9Q6pLFppcWnqZa4DK/0x0Ac7ieegRijHmPAAp4KHiRtfavYQQQ8vSE2FRFYf2Gh3Ti5QuxpLXhYX/Hxv/7wMDr8oP1ucK8eEl8xyXcQDnYBXUEivgLdBFJ0PK064B5hf5JtVb+mSRQ3wI8GSrcpPj7f+sUMgzYII1WBOcwnd7VveFoFZz9gqsfLpYWuFRvDzTHyYXn5SKc3fAXGeFW85UZO8L1wL19LuuO987U1K+iMLXsd+sgSUFLrP/u2+hgQZkaEaRuSKJxccunTV2SGOvkEH37soYb2huOp9bUSCuqWLjt439wys=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(3023799007)(4143699003)(56012099006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?b4bOtf1ANLU2zDBxAs/JlRIF7UwEfcr6nFyy1IWKMIn9h422JfJq6HonO2?=
 =?iso-8859-1?Q?CKJAAWklM7Q8Q9ItM/TYfPXV/YKKuHDVrCP+78Ggmf4fkiLpFDoG9FjuyJ?=
 =?iso-8859-1?Q?hg5bQdUGuG970WgGJfURvDWXcNNpah4L9xjBGOBO2WMCubJPP0L+14cqbC?=
 =?iso-8859-1?Q?3C1/M18vIJvdzhzAsuoTm6NE2TZ8S1xGwNoMmlQydlAqu1Gw88rMsheXJG?=
 =?iso-8859-1?Q?Gp/sd20sltNWep4A0KPLlmClG6LC4ZoCRepJT9qv/0dw1MRU/7y/dZ6SQA?=
 =?iso-8859-1?Q?IEFqpNEiTTK7cdidki+D+OtBlxNR/a0qGQYLYiAYE2uTjq7ctyZ5lJy6GX?=
 =?iso-8859-1?Q?W0J5Lvd4Jg0YX41JBaRguR3arFLk6xuCIbV7X8nYeyDjoV6VPzlOfT+Iae?=
 =?iso-8859-1?Q?EkfmWmojcj0AT0LSfw6ouzclARa4C/ZbjPYo3quny9TyainG4RShTRiHyl?=
 =?iso-8859-1?Q?/5ZRUcYno69CTvaWIG75ZbhoIUE1LyAutQDuGkhw6i7rNLhzV2DbO16GNZ?=
 =?iso-8859-1?Q?ynHnntC916NX8fNgBw7t4Gh1yaOMnZ4Uuh24KX33sy2Uj/BgW5s+LC3MPM?=
 =?iso-8859-1?Q?+o2z+Ijlfhufqf13uVjtl04C1u9d5eJw0DfkBhwOXAtCrKqEWgDLI431wA?=
 =?iso-8859-1?Q?1ujxRj4kXACcTcYvLXY/oxObevzQo0dfu0ftoDbxAhpizsNxCOurPcxEXD?=
 =?iso-8859-1?Q?GrTuA4COQnWbP/Uqx4/FeyPst1l9nCzdJ+Y3aEe+BbbwlCV8V/sDDGzFLf?=
 =?iso-8859-1?Q?ZUM7o5rGaZSxo8mv63nIJnx+CNcJLsWMzvTgNSWg2JPeUeejNL1+ggc6Uu?=
 =?iso-8859-1?Q?FP8zA1nBgj+fSHtZ0zTNBQfVEov/WH4tQ307y+LC0LtFKu8/OwS5qW5Cas?=
 =?iso-8859-1?Q?000B2R7H/oZGzzyi1qGLE8dLoIx+6sVhnE78Bm4QjPM9fAyhHzUC8PZtUF?=
 =?iso-8859-1?Q?X21gwOkdrh2/WtlfUBjF4LSIdiJ5SZibDYlsezxmTmwVa8ny0jjS+JuCkk?=
 =?iso-8859-1?Q?oRx868b1R0Q8pgMfjJV6gmbDVXBLH89+VRZfSkt4XcemsdK2M0fEV0+d21?=
 =?iso-8859-1?Q?mnFM29AwAW5Pa6Q8d4fzff3BumW0a3Vh7kxd13MZGEKOQ1Cc7gP8pu71Q3?=
 =?iso-8859-1?Q?sJOiWpyUD+mcybBv31fYBVYHaM6Y3jT5nRUVwj0vO0Rtkg7NizAxBKB/2w?=
 =?iso-8859-1?Q?5DJBLp0tDWybEDHi2ysivtg/HzStqsmsrZhzsE0aiDEG2DAV/2AURTUqeF?=
 =?iso-8859-1?Q?5a8yxx2r05zMTc5UcRKdoRqYg1x/CW6E3IT+MA8bNAmaLsC50R4VbhEfJr?=
 =?iso-8859-1?Q?SDn4uEoEkHD9rsfFT0uI9elARxaLuDi5SSxYNtrohOw98E4kmdmFFt2xv4?=
 =?iso-8859-1?Q?R95nXqqPeKVF5I0vS4WijJ8Rg6c7mISoUcBMYAOPtCtmoIUvsJIBv6kDZy?=
 =?iso-8859-1?Q?pUaU0VoWP4fnvccuG1tFiT6F563wycta7BSXpZFEHjJgXanBxs3ByNrP7p?=
 =?iso-8859-1?Q?t2RwuBkVroTNvcJ+LFukJD5o5efZK1ixwtlFrLsvuhi8FZLYQdn0YGQVQi?=
 =?iso-8859-1?Q?Zj5LP2JJmPgTMyGKPg5WI6bQizjk7TUcN7TbFlA/jz7Xle5gdVefyXqoNj?=
 =?iso-8859-1?Q?on1Q8s9dk+/jeL3gdQ9snRDTrQyxvLbZfH9+iKqOO7+lirS6sG4+s4B8xK?=
 =?iso-8859-1?Q?j3UjoyS/P8ZDNBMDNnWKVPbMJLzg8BVfQjbiHykWD2NntnwsAHyNTceK82?=
 =?iso-8859-1?Q?kaa+uSS16OF5q57c6Mg128NhAfVspLOzkpk6sU2p3RrOwxeSv0CkkutBck?=
 =?iso-8859-1?Q?GQG/dDhKBg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6220c5f7-126a-4b74-6dad-08dedb35088b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2026 08:03:15.5779
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: weBdFTa53VI8r2KzxtFPG1r94dZeLmKDzXnXuHNVdM8EJc2/mvvSeZsH0j5PShzs3hBN6GDLu57G0muYVETGojFpjogiY0qt/ozpX026Fmk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1673
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[siliconsignals.io : SPF not aligned (relaxed),quarantine];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[siliconsignals.io:~];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66711-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jai.luthra@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:Lachlan.Michael@sony.com,m:Ryuichi.Tadano@sony.com,m:Kengo.Hayasaka@sony.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mchehab@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	R_DKIM_PERMFAIL(0.00)[siliconsignals.io:s=selector1];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,siliconsignals.io:from_mime,siliconsignals.io:email,vger.kernel.org:from_smtp,ideasonboard.com:email,PN3P287MB1829.INDP287.PROD.OUTLOOK.COM:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4388B70E2E4

Hi Jai,                                                                    =
  =0A=
                                                                           =
  =0A=
> Add a V4L2 subdev driver for the Sony IMX678 image sensor.               =
  =0A=
>                                                                          =
  =0A=
> IMX678 is a diagonal 8.86 mm (Type 1/1.8) CMOS active pixel type         =
  =0A=
> solid-state image sensor with a square pixel array and 8.40 M effective  =
  =0A=
> pixels.                                                                  =
  =0A=
>                                                                          =
  =0A=
> The following features are supported by this driver:                     =
  =0A=
> - MIPI RAW12 output                                                      =
  =0A=
> - Monochrome and Color (Bayer filter) variants                           =
  =0A=
> - Multiple input clock frequencies                                       =
  =0A=
> - Multiple link frequencies                                              =
  =0A=
> - VBLANK and HBLANK control for variable framerate                       =
  =0A=
> - VFLIP and HFLIP control for flipping readout                           =
  =0A=
> - Exposure and analogue gain control                                     =
  =0A=
> - Test pattern control                                                   =
  =0A=
>                                                                          =
  =0A=
> Following features are not currently supported:                          =
  =0A=
> - MIPI RAW10 output                                                      =
  =0A=
> - Pixel-perfect crop reporting, accounting for the shift-by-1 when       =
  =0A=
>   doing HFLIP/VFLIP where the sensor maintains RGGB bayer ordering       =
  =0A=
>                                                                          =
  =0A=
> Along with the ones below which depend on the new raw sensor model:      =
  =0A=
> - Embedded data stream                                                   =
  =0A=
> - Freely configurable cropping                                           =
  =0A=
> - Increased framerate when cropping                                      =
  =0A=
> - 2x2 binning support                                                    =
  =0A=
>                                                                          =
  =0A=
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>                  =
  =0A=
> ---                                                                      =
  =0A=
                                                                           =
  =0A=
...                                                                        =
  =0A=
                                                                           =
  =0A=
> +static int imx678_enum_mbus_code(struct v4l2_subdev *sd,                =
  =0A=
> +                                struct v4l2_subdev_state *sd_state,     =
  =0A=
> +                                struct v4l2_subdev_mbus_code_enum *code)=
  =0A=
> +{                                                                       =
  =0A=
> +       struct imx678 *imx678 =3D to_imx678(sd);                         =
    =0A=
> +                                                                        =
  =0A=
> +       if (code->index >=3D imx678->info->num_codes)                    =
    =0A=
> +               return -EINVAL;                                          =
  =0A=
> +                                                                        =
  =0A=
> +       code->code =3D imx678->info->codes[code->index];                 =
    =0A=
                                                                           =
  =0A=
A blank line is needed before the return 0;                                =
  =0A=
                                                                           =
  =0A=
> +       return 0;                                                        =
  =0A=
> +}                                                                       =
  =0A=
                                                                           =
  =0A=
I think there is no need for a new revision for this minor style fix. =0A=
It can be addressed during the merge.=0A=
=0A=
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
=0A=
Best regards,=0A=
Tarang=

