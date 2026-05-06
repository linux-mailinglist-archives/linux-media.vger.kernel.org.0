Return-Path: <linux-media+bounces-60507-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sC3qNxTH+mnhSgMAu9opvQ
	(envelope-from <linux-media+bounces-60507-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 06:44:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 467624D626D
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 06:44:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 37F1C3040C81
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 04:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B85D40DFDE;
	Wed,  6 May 2026 04:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="GL+Vx7FS"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021099.outbound.protection.outlook.com [40.107.57.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A639E2DCF52;
	Wed,  6 May 2026 04:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778042633; cv=fail; b=Ugvnph9940/VAqSirZ66FbKw4VnzvzL5pRHrOlLulqIFE8qL4JaKJrvy9H4ALG4q8zve+bKRQbiII1LAqNt29h3EmjNLPGK+WKUS9gaHQxYmfuP7Qbf4mEDpCMT0faTMcIY8B2CCUChsu3xk91K9YkP8r7vDwajdKVfIIdCw7DM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778042633; c=relaxed/simple;
	bh=owLkfXEDUXTtf92/IZTKw5HBXr4FNcdoPaTnvcwG7+E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CjoV1chBRNcQH1oWgyqZd6dX0zrmZbgC9x6AAG31S5eleS2yY1VW6I/oe2kvAZV3GdjH+aqhCVJLF0BjXVYHF3uqkJz/Yfv6k6EolxhJr3fQA/xqKL5Huf5WJmtHi6/NLtoZGZIfTXhQjsKbgHTzJ1mgYhY7Kd+KTK7RAO+lvm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=GL+Vx7FS; arc=fail smtp.client-ip=40.107.57.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BJAfSpOSZwSigMQwl56YTsRe7A9XNwLmj+pM2JayT003oPe6Ju4/N1POLbkEvB2e6hBMX5r4KNhL51xYQ1YaN3em3LJ/1VYhiymtRSJNRNRzLLigvD5bwxtgcXTenNNP48l7DtfFrPh/s3e8qm0D4ys915NJDB6gU2SIJSS7Xlug9vupla2gdkVpOmozCCxdBSmLdE80UspcDxDsyqGAo6tZzxuosp4dM7pd9WTZcqcJEKyIA8foRxTfptYoX3qP2lCjihS93KAi+0HgK3Xun3WcRGGJcQUa50F3qkPDicMEmjRcTKj0ppSZy04tq7Wu0UzdcawcW/UxVbf9F/jaeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=luS+rUWE6LzwFMzodTIZ42WJs47OrHdW8wGUz1xQ5mg=;
 b=m3eEaPIsVl8tTf6KPme4B0r3JI865m3CYj9RTJ5/szypDWGBjYSU0nufOifvmnfnl7Z9i4wydEr60QmepYRFfxTTGfnxpT6ce978nrSTIqTPUnUbSLqo16LKnIRH2XgZiUjJy0ZARcFn3+UNIJH3OG8bPf3bFXfD2lM7fXXOYjWqxIDyleiDwL/IVNOZ/pzXrA6pFc7gn4gIkFCD1WF5GusdNAVOp0b3s8wp/svFZdQUEnniSjSfJBqzjktc0U6aM9RKid4z72ztvoQl9PvS+122+9C9PGW/l+qYvIVRg+SVkGpHsDubUYGFxCseiy4DG0/3Pla6MIZiv6FxTgfepQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=luS+rUWE6LzwFMzodTIZ42WJs47OrHdW8wGUz1xQ5mg=;
 b=GL+Vx7FSMsDpke+1QVZvakKCGHmVigJ15tgDo1Q2zdOFAouHsHlMRWK40A18ufgDZDLbLx231691gPV9e5Bu7XfzNSClJc6u40YVnEto2le17FFsxPTl6ap0mqlkR9BDlvaa3HiVpGICGqJvk9rx1iQtzu+fsj1Ycz27MymeQAlbugrDHWwh8ibk8YF9ZUSuFq1dpehNPeDeStTObvWGyUIc8henFx7KvYgnkqiZuLsfYs8VWa3Yo8B0F+0iuv7gwV17VqpUIoK69ENI1vvwUJgJIq9nlHdrp2p568u5ZjSh92RiAb2+ikm3pO5ApCunTePCb+i0hy0upsgrIPMO8g==
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11e::14)
 by PN0P287MB2035.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1bd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 04:43:44 +0000
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167]) by MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167%6]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 04:43:43 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Tarang Raval <tarang.raval@siliconsignals.io>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans
 Verkuil <hverkuil+cisco@kernel.org>, Hans de Goede
	<johannes.goede@oss.qualcomm.com>, Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>, Mehdi Djait <mehdi.djait@linux.intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot
	<sylvain.petinot@foss.st.com>, Hardevsinh Palaniya
	<hardevsinh.palaniya@siliconsignals.io>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] media: i2c: add os02g10 image sensor driver
Thread-Topic: [PATCH v2 2/2] media: i2c: add os02g10 image sensor driver
Thread-Index:
 AQHcy+vUWjhtsErO5ki07Rsg8wgvDrXeSh4AgAAEK/CAAAQSgIAABiGAgAAD4ICAIUQssIAAYfyAgACLVJw=
Date: Wed, 6 May 2026 04:43:43 +0000
Message-ID:
 <MA0P287MB2178057CA1FE276F715DE664883F2@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
References: <20260414084952.217215-1-elgin.perumbilly@siliconsignals.io>
 <20260414084952.217215-3-elgin.perumbilly@siliconsignals.io>
 <20260414092758.GE4061@killaraus.ideasonboard.com>
 <MA0P287MB2178FAA81D07B561FA68014988252@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
 <20260414095727.GF4061@killaraus.ideasonboard.com>
 <PN3P287MB1829155B216E557C7DF7B6778B252@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20260414103315.GA1023076@killaraus.ideasonboard.com>
 <MA0P287MB217836B81A73F23289CCF190883E2@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
 <20260505202431.GA1598374@killaraus.ideasonboard.com>
In-Reply-To: <20260505202431.GA1598374@killaraus.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB2178:EE_|PN0P287MB2035:EE_
x-ms-office365-filtering-correlation-id: 8f1ec1d0-b716-4fa2-8c44-08deab2a0d93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|366016|7416014|376014|1800799024|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 qZ/F6oss/YvOGLe+dTq118R3JVm2Ojw+9kSEFnKdky4WBMXqRh+NHhFn96WerGdI16OtAbVVCpGiRDbspcFVPMey4FBmSv/MOHKUA9n1uWwRrPbnBk8VnK3v00h7EWJJ5wiNhjWyVwz9nB2fcHgtx23AvjaQ41qGg10lYn61kHRz7wgoRBQJjUwfdlDN6gTaEXdtn/CDQkORK5zdKZTt4+5nwlhm/+DGU5NuFP8eoRGhqrfWEyf39L0MWzon8BM0oeRYqkP9CbTuyCL6hrC8QYVzpG5V1gDr0jDop/k3d7vZGTTAGTk77dcB63LnC0/Qh7oIltsOjYkVVcpHOfNsR8nvBDdUvqN6SYoroAnPZepwyFZvP5YvC9EutRDsQIkGx8kjFPP8/lXNnxUjU9HMdM1aAkF94LRixuiereBjhGjyAugKKpKyh9Hyhuj2m8kqMIrrpmeOlzqnw3zr1F8Ewrt+v7ItdfCSkPl1KWeIWakYWZf2vov5YGiyeHKZJ52wjn2SC+xZ06iljxyzXDL6ucWMIpulVMDvtC6Llg5wWPn4RrpZ80kuoyr/7/XnbZrxBCBHO24gQDipTUtojvPJz2dBNE/pZn/CEpOgLZ6yQISPdW0yU6x/pktDPigvwujZESFL6CpbLd3McENzmm7YojBSNlRWOe5Gt2y5Cj948ATW0NOOFQKeEZqP3i7OGSG7WUGAyjcXb/VrmBTEk6A8MMcGP6FgSThN2p9JREJsjsCqUO4yoai1an2NzvK6n4wv
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB2178.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(7416014)(376014)(1800799024)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?jYJ2Ay2vujUQleoEmKKlyJPU7DkW0r1GV9jCanXqlEMqEOWrWXqqtXr4AT?=
 =?iso-8859-1?Q?ru5SeBN3cblmiJyWb7LUFNrNT5mURA4DdW/l49OpcO/Pz1rCRsBqIf9qac?=
 =?iso-8859-1?Q?kqh01+gcQf5WF9wGvUs2BpOPf87M+1Utzx4BDb+Fi/wlOxf4CUhpkqXwvL?=
 =?iso-8859-1?Q?xcVgDsv3ZVMEhpJ1sNXiDBGB1TtwN00hCLIVvAGbSZRoulrDhsBrI67bt0?=
 =?iso-8859-1?Q?GiOtkaSDRH1p6CVX4FnSAQ7Ikg2DFumiF14antPriAgGKE7zZddAGDhPRg?=
 =?iso-8859-1?Q?pa/GUVhanaFOGr8bNgIS3f5oh2k4ufDwOc0ktPttvbCn8T3x7fCe4LVBt9?=
 =?iso-8859-1?Q?JJmDjfEA5jFG0ZcUoPBVrzhYhdNixNmbHL06TXoIkGWTFuogogGk7E1zoI?=
 =?iso-8859-1?Q?cH1xtiJADLfxr6tldSu9a0k5XNhQ3nLNf04VgAiPvWbh1u1TdKGxkCzDZu?=
 =?iso-8859-1?Q?XCHoug5k2KwxxSxIL+gtzuh3qJTF0R1NFj+zPXKzWNKosc6q6Z/bGyS9U5?=
 =?iso-8859-1?Q?/79jZsSn3k37515FsYCEb0u3j0T6UYLRuUgzrADfdlC0FB+wzWvFXWireA?=
 =?iso-8859-1?Q?EDnAFtaGGLg3tQDLcP+aFfrzn9Dil3Fi953yn1fqCdMDStUN5sr50vA8NY?=
 =?iso-8859-1?Q?DSpVAVodus7OFer348XT5h9nkdEFkknpQwci0dGq5dteHqgyA9WhNV/wy1?=
 =?iso-8859-1?Q?VyZ025OQC+JzQRAp6WXrUXKPaiB7tg+Du4uzMLPlHmFdC3r1ygZmS5W/KB?=
 =?iso-8859-1?Q?xOGPNl0bgc4h/7QcQqmESG0+qLdoEfxWYIJawuiNvWzWy4Y03RGY8i1BR1?=
 =?iso-8859-1?Q?YlooM+RrSr+XsZbM3zhGuu66DFmzu0y3tq3PgDc/pXnLRSs0LrIrY64ztK?=
 =?iso-8859-1?Q?yuZI0jSEhpMyL4uxcEBf9oHHqKWKeIDfGos+qXusASi2BiXx8aNFUWgUlB?=
 =?iso-8859-1?Q?61PkSfx1NpkoNpkzsZQd+bFxN28/LQmp5wG4Zf3dKLNdgRMjKnRZ/jW5pl?=
 =?iso-8859-1?Q?bnJmcyQjAgYIfXKBEbEudQ3xKwqppvHqOKZW1pbG/RntpPz/+q60/fluz2?=
 =?iso-8859-1?Q?Vc6NOIfyv3hjHydGsHyio+VR7sadQSfs7e9+xmrXBUHFfjpX/pEKZBL89f?=
 =?iso-8859-1?Q?/o1Ri4SWqdQ2INsCtz6RFb1cO54jhCX/OA9OlKS7FPeEjL/RjgnJHID7a5?=
 =?iso-8859-1?Q?DKRohW6AcI2GemE317sKiFL45uxWj1VefmlvA7YLhmHMZw2m2VB7Byw+1q?=
 =?iso-8859-1?Q?lrgCh76HcyMYLqpdM9Dno52nPKsPzhc5D3HWDA/SWjw1TuHJawMBHvk5GU?=
 =?iso-8859-1?Q?CU5jMVogjSJKJ/m0eh2/+zYs3s4djfqoIMNh9fWHn0RidJWLcU4xvqkQVf?=
 =?iso-8859-1?Q?YxEInxiZt4KEkeEyTRc87Q7M/4X47WORRmtfBwnC06SWJNQ+fA0Aub87EK?=
 =?iso-8859-1?Q?qSQFds3SF+CElPg4kZJlczhODjmL/LBMiiRWory4DN8QlAw//6jKqOI34q?=
 =?iso-8859-1?Q?l5TfKyPrX2igysCTsHtHx67Fkbe1tmRU3x6G3WG8R3AmAkW35GMcRlSDYw?=
 =?iso-8859-1?Q?tUaWbrZRuiq2NhLUYy1RuIVOq49wCYq2W+apqI5h1r2606wayIrXY5Yxj6?=
 =?iso-8859-1?Q?qsHA2RXU2JAQLjjGT1GVLIQImlawVYeOEPE6TYjr8imwQ8scp/qJacEsbc?=
 =?iso-8859-1?Q?DPA+WrtDu+VLtJqc1UEiZVlaKBMs412wB9p9Z1p4HRd3ORcrE3P6X6Fb3u?=
 =?iso-8859-1?Q?Fz9PEIrMosi5qZm//VzGypcPWEwsd6fHDrOICQ0lC7bsHQTd4VD/e5UHab?=
 =?iso-8859-1?Q?DC/r+8Lprh2ca9VbVhCeE0OJ933eyFUqSwsh00U+KlsC2MWUjwBb7F+RmG?=
 =?iso-8859-1?Q?9X?=
x-ms-exchange-antispam-messagedata-1: GT588lThF//zPmb5dgxhPyPtkHluG9wayss=
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
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f1ec1d0-b716-4fa2-8c44-08deab2a0d93
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2026 04:43:43.7771
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4QdbQRusr+SyT4StK3MQV8A9ZwOBp7S045lrcTylLx/YpNet50c63oOXhNGKseYv0CxWJGIniouakofkdBpmO61JYSJLqyWvu6u2OUdn0mt0HBwqMGU1u1/uH9kNo29q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB2035
X-Rspamd-Queue-Id: 467624D626D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60507-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elgin.perumbilly@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,MA0P287MB2178.INDP287.PROD.OUTLOOK.COM:mid]

Hi Laurent,                                                                =
     =0A=
                                                                           =
     =0A=
>On Tue, May 05, 2026 at 02:42:21PM +0000, Elgin Perumbilly wrote:         =
     =0A=
>> > On Tue, Apr 14, 2026 at 10:19:23AM +0000, Tarang Raval wrote:         =
     =0A=
>> >> > On Tue, Apr 14, 2026 at 09:43:32AM +0000, Elgin Perumbilly wrote:  =
     =0A=
>> >> > > > On Tue, Apr 14, 2026 at 02:19:45PM +0530, Elgin Perumbilly wrot=
e:   =0A=
>> >> > > > > Add a v4l2 subdevice driver for the Omnivision os02g10 sensor=
.    =0A=
>> >> > > > >                                                              =
     =0A=
>> >> > > > > The Omnivision os02g10 is a CMOS image sensor with an active =
array size of=0A=
>> >> > > > > 1920 x 1080.                                                 =
     =0A=
>> >> > > > >                                                              =
     =0A=
>> >> > > > > The following features are supported:                        =
     =0A=
>> >> > > > > - Manual exposure an gain control support                    =
     =0A=
>> >> > > > > - vblank/hblank control support                              =
     =0A=
>> >> > > > > - vflip/hflip control support                                =
     =0A=
>> >> > > > > - Test pattern control support                               =
     =0A=
>> >> > > > > - Supported resolution: 1920 x 1080 @ 30fps (SBGGR10)        =
     =0A=
>> >> > > > >                                                              =
     =0A=
>> >> > > > > Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsign=
als.io>=0A=
>> >> > > > > Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>   =
     =0A=
>> >> > > > > ---                                                          =
     =0A=
>> >> > > > >  MAINTAINERS                 |    1 +                        =
     =0A=
>> >> > > > >  drivers/media/i2c/Kconfig   |   10 +                        =
     =0A=
>> >> > > > >  drivers/media/i2c/Makefile  |    1 +                        =
     =0A=
>> >> > > > >  drivers/media/i2c/os02g10.c | 1039 +++++++++++++++++++++++++=
++++++++++=0A=
>> >> > > > >  4 files changed, 1051 insertions(+)                         =
     =0A=
>> >> > > > >  create mode 100644 drivers/media/i2c/os02g10.c              =
     =0A=
>> >> > >                                                                  =
     =0A=
>> >> > > I have added a new function, os02g10_set_framefmt, which dynamica=
lly sets=0A=
>> >> > > the mode register.                                               =
     =0A=
>> >> > >                                                                  =
     =0A=
>> >> > > Please let me know if I have missed anything or if further change=
s are=0A=
>> >> > > needed.                                                          =
     =0A=
>> >> >                                                                    =
     =0A=
>> >> > You also need to drop the supported_modes array, and implement supp=
ort  =0A=
>> >> > for .set_selection().                                              =
     =0A=
>> >>                                                                      =
     =0A=
>> >> Are you suggesting that we should drop the array below?              =
     =0A=
>> >                                                                       =
     =0A=
>> > Correct.                                                              =
     =0A=
>> >                                                                       =
     =0A=
>> >> static const struct os02g10_mode supported_modes[] =3D {             =
       =0A=
>> >>     {                                                                =
     =0A=
>> >>         .width =3D 1920,                                             =
       =0A=
>> >>         .height =3D 1080,                                            =
       =0A=
>> >>         .vts_def =3D 1246,                                           =
       =0A=
>> >>         .hts_def =3D 1082,                                           =
       =0A=
>> >>         .exp_def =3D 1100,                                           =
       =0A=
>> >>         .x_start =3D 2,                                              =
       =0A=
>> >>         .y_start =3D 6,                                              =
       =0A=
>> >>     },                                                               =
     =0A=
>> >> };                                                                   =
     =0A=
>> >>                                                                      =
     =0A=
>> >> If we remove this, how would we provide mode-specific parameters such=
 as VTS?=0A=
>> >                                                                       =
     =0A=
>> > Those should be computed by the driver based on the format and crop   =
     =0A=
>> > rectangle configured by userspace.                                    =
     =0A=
>>                                                                         =
     =0A=
>> Could you please take a look at the latest v3 patch?                    =
     =0A=
>                                                                          =
     =0A=
>I'm short on time at the moment, but v3 is still in my inbox, I haven't   =
     =0A=
>dropped it.                                                               =
     =0A=
>                                                                          =
     =0A=
>--                                                                        =
     =0A=
>Regards,                                                                  =
     =0A=
>                                                                          =
     =0A=
>Laurent Pinchart                                                          =
     =0A=
                                                                           =
     =0A=
Thanks for the update, no worries.                                         =
     =0A=
                                                                           =
     =0A=
Best Regards,                                                              =
     =0A=
Elgin      =

