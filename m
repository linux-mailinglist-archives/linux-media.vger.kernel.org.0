Return-Path: <linux-media+bounces-62559-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCs+MUXzD2o2RwYAu9opvQ
	(envelope-from <linux-media+bounces-62559-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 08:10:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB4E5AF623
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 08:10:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 110D2303ACCD
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 06:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 517143A5E85;
	Fri, 22 May 2026 06:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="TxPsBVL1"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021114.outbound.protection.outlook.com [40.107.57.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830BA330D34;
	Fri, 22 May 2026 06:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779430209; cv=fail; b=S8BrrKixL/aI5dXYMbGyJS5VUG0WdAK408xYQSMZI7NhcTkP5dRVYUUmgiON6YRm7wfBKmuk3Fxfyg5955Xk4N3I1M6h8+0yTTPfmMLnAKCCOVjyZV8M8CWiaL5jf59ijjZcHY3d/YLLzMcI50pzEUF5ktyQaI/liK7pdWt1IpQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779430209; c=relaxed/simple;
	bh=XLrNgc55IRNiwHBZBqOnXitncesqGzSrPGx4esZsYS8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BnckL9FhDr6+XBTkADwBIhsjkL/J6uocNBfaNnVXa+SnXbbiUOR8+eMBWy0Iwe1pbtezL7J3fas+vPrH85lH6keaxQp5wjGhulEB3nUJsOdH8k1OrqXGUpYCOpSEFOf7w990UNh0OAE68tkKxG8AXBwTrcdYyKQuM7Pu2/3/zlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=TxPsBVL1; arc=fail smtp.client-ip=40.107.57.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cyGw5rMRrIli7a/XRam6zQQyJIiiBYbDkY2VnAn5/EpZf3HmgKWucrB4+p4JatvMf1tS+pMm1D4Hi/thCMyvWxcr3kspRKU789GT/1726IzA2qZtAkzaLTxjZMu0zzK8CxjTO6vVx/l+xeJEfcyVL36PkjJN6KtZtjGe+HfOMUXY8r60z5B6lWQG4hswBHJGlUlhNxg9XywNAydUjKZfn5qgXD9Pr/qPm2qMwmOqHZPAwYUcoyNok5jmZ5zrOiuL8xUgaKL4KBPAaW76tXhgyWS+aTsNpRGli9N2cIXarCZLwmzDzoTiBdT7o+/jiC8TTjvLIazSqXvynUBPsd/J/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uT+sgCfj4KqAZqfI2f1FBsJQ15z4medhxIi4ILqQXQA=;
 b=J1gItDyn5xvxSAh61evNIgfb6Zi0Ab5wtotTtRRfTno08YEW5zBt7lwm8HHKwvFwO8yLDSiNLVjRuTgLhjg4dLQFHToHM500bxxtzA3hpZXcuvuMgGINJ9rqdG4tzUD3BteW5hXj/gyWj+Lk24TrLypy4cdrIv+d4z/A/9FXFz7Z56EIyjC/uPH8HIrqGymaho2le8jfb4ZKR1R/GG334X4ALeQY0QXQpxEPjQgWPiSFF2w2MVoZN22GPHRoq5R+jTDxklO/0fp4d1IQ3p6dusgSYOIgExRlj1AIeMOyPSaW6AHbXbConJe1ZulE2Bud+hjI5YzoN9d5cthC5RELIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uT+sgCfj4KqAZqfI2f1FBsJQ15z4medhxIi4ILqQXQA=;
 b=TxPsBVL1huhTW2nmpoSA6POs4c3GrJwkg7p1bfMzjL4IxIM3r3ldFu8QwPE3zS9pSWDj/AR/nhY1TzLFukztmhe7xA392yPKYkhaA1dcNW6D7aOjAqpi3Uyb8lhM3K7+iaaYbpIBgcHYNBREwFt+FfU+bJZSlzIPGtyW9tqdhCzOX54+pUJnHF2EqCmcDNmgUy+cWCeqYgWjZ15LPw4A6JKc0U7PgDD+pke37zHeEXfa0Gz5Gm0HNAATPAAPvgkWseDlC0iuJoG+bVrRHRydKBb/wgJnHrfHIF2fVe4LVcujANSNza4KK01D36Sh16pr288FkVfNQVZXNdT8NHsGTA==
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by MA0P287MB1065.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:e6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 06:10:03 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%6]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 06:10:02 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, Hardevsinh
 Palaniya <hardevsinh.palaniya@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson
	<andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mehdi Djait
	<mehdi.djait@linux.intel.com>, Elgin Perumbilly
	<elgin.perumbilly@siliconsignals.io>, Xiaolei Wang
	<xiaolei.wang@windriver.com>, Walter Werner Schneider
	<contact@schnwalter.eu>, Kate Hsuan <hpa@redhat.com>, Svyatoslav Ryhel
	<clamor95@gmail.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 2/3] media: i2c: add imx576 image sensor driver
Thread-Topic: [PATCH 2/3] media: i2c: add imx576 image sensor driver
Thread-Index: AQHc6E/PlSTyRCcRPE68B2vvph78QLYW2RUAgAEfyKqAADqZAIABXwDr
Date: Fri, 22 May 2026 06:10:02 +0000
Message-ID:
 <PN0P287MB2019AFCBDF0E24BFEF8E0E399A0F2@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
References: <20260520115641.11729-1-himanshu.bhavani@siliconsignals.io>
 <20260520115641.11729-3-himanshu.bhavani@siliconsignals.io>
 <20260520123326.GC215344@killaraus.ideasonboard.com>
 <PN0P287MB20196A26D90DF65CF551FD359A0E2@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
 <20260521091310.GB4511@killaraus.ideasonboard.com>
In-Reply-To: <20260521091310.GB4511@killaraus.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0P287MB2019:EE_|MA0P287MB1065:EE_
x-ms-office365-filtering-correlation-id: a6579382-049a-4008-fa0f-08deb7c8c2d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|22082099003|56012099003|18002099003|3023799007|38070700021|4143699003|6133799003;
x-microsoft-antispam-message-info:
 9Cu7VwHBzEDnTftCmo9F8+VAcxKQI1xpmPTfd+TLJX74hYhffoP/tYl/GqvsTlzRKL85fr6h7vySYX5w92gX+fNaomTFGCpayYvE4+N51mq13LnPDOSHFEB6ts3nAOrEBz0Jacv1tIR5+8zz1XoC07FsnBwO64xoUR/ysonNN8mtIVSi+IXA3ANJqzQGyHMUs8QGQY/RffDPqeBFJA2G/NtrgTcDk0AiiPikN8utrlTsZtcyAUpQk+7+Cxj+pqW6pXzhbTVp0ggt0X7p80qXSu6t+U3q/GXGFs+f/YBOiVLqgyRpO3xRpWcDJZ5lTeGQKjoEHtbgRYz0AGyYog1vx/51OVEOQpsDWhLixXfypA2DuVfxOvMkXtAKSHHnULzPoWn2A0yDOVXSp33a2Uto6wa8+ddK3047PwwGXbeMkhxyC6Nq4t2UoRz101cL68UeSXU6CY73pkkZf6vzSnsYqS0wWlZKs6EJxKUqAsEfGYLadQ7sTi8X1tqHaQDNj6pk1LI6mjevfQJeZaqs52XNrZzvxC3RC4eUAzluaYz1VeWH3LtNVdMsFcDfszaYUBwRfe2evFK176qR/XIA9Xbi1MR9LMpnsk1RuksGAxvkBPnAqBJ8vwYRswJzyKTXEJUVPPLvw3aK1XteMbIiIM8QPO2pyRG7rMQhcfDrFO5HfNn15xl/q8qpNmbhR2WizFtRz/7Sql0XkRHbAkb4FJ4cavsJXhpzjV3AGvi2G3aCfkfg4YxyPdAPibhnob7DMHLj
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(22082099003)(56012099003)(18002099003)(3023799007)(38070700021)(4143699003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?T5xRyVidRue0KlaPKkuyNWexbJr8+sBzIL5x2bcvjAvcKf/AwhfxJujiN6?=
 =?iso-8859-1?Q?6Fca3w0lAiFbjqbEDY473UHCnXAgfXAKyXtEC5HYo9tu87FC0k4BFLvHLx?=
 =?iso-8859-1?Q?N2y68970KUBF69vIKnhGvJlHzUwRd34+R5oMNYOzHN2itXagT3+wgI9BCz?=
 =?iso-8859-1?Q?1F700rd6nKcAZwc8XY19UL7bbcQCj3rXnGgONIbie1uVXNvOs7/BZmvsxm?=
 =?iso-8859-1?Q?GEmOT87hKKunaldcjtWgGRFExULmkxgHtr1nvfgLZM3kqprYCHUQ7aloWT?=
 =?iso-8859-1?Q?J6S7f589EZNk4ZZDi+kvN0BFjWIP/ZeeGi2vGpS1x4ZPVsRzbv68O5ZD8I?=
 =?iso-8859-1?Q?kk7oEIWECc+1ywc3H5JYWboUPfH24i+x9Aw3Hx2RzvFJKQ/idszgnn3y9R?=
 =?iso-8859-1?Q?VsLtKa/exz+pkiSE21R3Ee7Si+CrcsA8qGlYO9M6++LoRDGCaubgibiclp?=
 =?iso-8859-1?Q?YTlg7KOxDxRIkSbGzDaGWOitoNb2ISbIez6snEKg32LJgF55i7URS+LAKR?=
 =?iso-8859-1?Q?qxGU1HuDAhWlxeRxdf+HEbIEQbnAtjG1NvkFBpG/VkNYN1+I9u1uxRiW/7?=
 =?iso-8859-1?Q?50XHSp/baAJlnCIl/P9Ck311zpRGDRytsvRfKVZMfia2XV+m8cxG9FP/US?=
 =?iso-8859-1?Q?1LQlV6dfgMJQQlRsOTHrXOfqVQJ37JN9t6JA7PhoXraz/L70mBBnamOLJ9?=
 =?iso-8859-1?Q?la6LeVE4idpQnqpujV8V9QnSWBlO7Kklb8zkdVEkPx3BEkLN6EsqCt2WGT?=
 =?iso-8859-1?Q?pojq/n1I/2dABlTvy6/ah4exGsbPOLLVMGLR2SCAiCQpBPJ/FDF7aOP8f4?=
 =?iso-8859-1?Q?cxjRRvTbLp+BOoEl3fdJ7istk6gCk5zXk4BFSOZLQo4zDNHnPVxTw8Uodf?=
 =?iso-8859-1?Q?EIhI6//2njsOR88NjE7mMFtHRmTb//f3S/ahoUfGbuomAU9adZvUC3S+6n?=
 =?iso-8859-1?Q?AgOIsptNl7BwzRzGilN32gcxy6EBf/yfQJjZwAGymf6cavuRKCZcDvcLRR?=
 =?iso-8859-1?Q?xcPwRrt3ZtgtXzb5upzSqzdJRAYWto4YzPPN3+BBchzeH151Cmb6RwUjee?=
 =?iso-8859-1?Q?ag5/4f6/zCJls9YtRVyWVCmXxQxHy8hlVNmiUl2y487RfBgXoCldyQnKor?=
 =?iso-8859-1?Q?tHRV6SsWRiAEwaJ1MoTQoYjpiM/4ufyrDb3RnY2MILZVVSNjlmPVJcenOn?=
 =?iso-8859-1?Q?3go1xiEANhQh/i95Ubs8ajTEcl1C2jMmYACF/U2w5jP1dCoQeeiW9kC/0X?=
 =?iso-8859-1?Q?Ccw6czCu1/0JUQgb8F7TP+4cl6gpRPtgfevqZvzXd1Byh08XR0R2qJ7O/U?=
 =?iso-8859-1?Q?zG1wEH0vagV8m58IeaX2Y/9A9dQxmV8yayRxZHrovZTACStQ1vctvsZxq6?=
 =?iso-8859-1?Q?QaTYXMt2H2wl55zLWxLFqOHhboAyvDtosx6JaCLGsgvH3ZVChLiUwYHL4P?=
 =?iso-8859-1?Q?FBcGmoa5gECwB9xAUPyQ5hhhv23iK0Ml0TxOZca7SwGjqfNp3FNjukCuhW?=
 =?iso-8859-1?Q?UMlwAPDJ16v39kYvd5QRQx85TgJljToMHqIaxb7NgB11NFYpf41WDvYrFH?=
 =?iso-8859-1?Q?onqB7I/5d6EDv5qyNuuG3+V/+2Yge8ER6YORHmxAaocDGuYcrbIDj6HI2z?=
 =?iso-8859-1?Q?dQIcSTM2Q6qeHFPkc/3feRMeaCkOFh3nyC3KhshDIoEveJdoxuIMhW0pqM?=
 =?iso-8859-1?Q?jstFIVqVZkilCz6rW1cSf7BAQAvNZxreMLc0nWdEAbcIk+Y8r2S7iCYzqx?=
 =?iso-8859-1?Q?mRWZAHPEO6nUFNb8hrtma6ubx7eDIb2eHjp7K4OQCJ7FeK27nQW1M9anM+?=
 =?iso-8859-1?Q?Aa3o+zryOMckFhMFIrcrdXWVv6Zghfs=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a6579382-049a-4008-fa0f-08deb7c8c2d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2026 06:10:02.3124
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HMiRPt4Px3Ugyc7v5dm/CmSBwxIf/oUoj1FeIq5/uLGFvahzVyUDoFmpOoBPZKbU+awQyskLrvOruXFWKU/S+cKzZjcfAteUn1+fA4hXz97ibpYfaT6jjPDBVyLzDqLo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1065
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62559-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,windriver.com,schnwalter.eu,redhat.com,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[himanshu.bhavani@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,siliconsignals.io:email,siliconsignals.io:dkim,PN0P287MB2019.INDP287.PROD.OUTLOOK.COM:mid]
X-Rspamd-Queue-Id: 3CB4E5AF623
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent,=0A=
=0A=
>On Thu, May 21, 2026 at 05:44:09AM +0000, Himanshu Bhavani wrote:=0A=
>> > On Wed, May 20, 2026 at 05:26:34PM +0530, Himanshu Bhavani wrote:=0A=
>> >> Add a v4l2 subdevice driver for the Sony imx576 sensor.=0A=
>> >>=0A=
>> >> The Sony IMX576 image sensor with an active=0A=
>> >> array size of 5760 x 4312=0A=
>> >>=0A=
>> >> The following features are supported:=0A=
>> >> - Manual exposure an gain control support=0A=
>> >> - vblank/hblank control support=0A=
>> >> - Supported resolution: 2880 x 2156 30fps (SRGGB10)=0A=
>> >>=0A=
>> >> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>=
=0A=
>> >> ---=0A=
>> >>  MAINTAINERS                |    1 +=0A=
>> >>  drivers/media/i2c/Kconfig  |   10 +=0A=
>> >>  drivers/media/i2c/Makefile |    1 +=0A=
>> >>  drivers/media/i2c/imx576.c | 1029 ++++++++++++++++++++++++++++++++++=
++=0A=
>> >>  4 files changed, 1041 insertions(+)=0A=
>> >>  create mode 100644 drivers/media/i2c/imx576.c=0A=
>=0A=
>[snip]=0A=
>=0A=
>> >> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile=
=0A=
>> >> index 90b276a7417a..e96c083e03d9 100644=0A=
>> >> --- a/drivers/media/i2c/Makefile=0A=
>> >> +++ b/drivers/media/i2c/Makefile=0A=
>> >> @@ -61,6 +61,7 @@ obj-$(CONFIG_VIDEO_IMX335) +=3D imx335.o=0A=
>> >>  obj-$(CONFIG_VIDEO_IMX355) +=3D imx355.o=0A=
>> >>  obj-$(CONFIG_VIDEO_IMX412) +=3D imx412.o=0A=
>> >>  obj-$(CONFIG_VIDEO_IMX415) +=3D imx415.o=0A=
>> >> +obj-$(CONFIG_VIDEO_IMX576) +=3D imx576.o=0A=
>> >>  obj-$(CONFIG_VIDEO_IR_I2C) +=3D ir-kbd-i2c.o=0A=
>> >>  obj-$(CONFIG_VIDEO_ISL7998X) +=3D isl7998x.o=0A=
>> >>  obj-$(CONFIG_VIDEO_KS0127) +=3D ks0127.o=0A=
>> >> diff --git a/drivers/media/i2c/imx576.c b/drivers/media/i2c/imx576.c=
=0A=
>> >> new file mode 100644=0A=
>> >> index 000000000000..910cbcfb6031=0A=
>> >> --- /dev/null=0A=
>> >> +++ b/drivers/media/i2c/imx576.c=0A=
>=0A=
>[snip]=0A=
>=0A=
>> >> +static const struct imx576_mode supported_modes_10bit[] =3D {=0A=
>> >> +	{=0A=
>> >> +		.width =3D 2880,=0A=
>> >> +		.height =3D 2156,=0A=
>> >> +		.hts =3D 3165,=0A=
>> >> +		.vts =3D 2172,=0A=
>> >> +		.reg_list =3D {=0A=
>> >> +			.num_of_regs =3D ARRAY_SIZE(mode_2880x2156_regs),=0A=
>> >> +			.regs =3D mode_2880x2156_regs,=0A=
>> >> +		},=0A=
>> >> +	},=0A=
>> >> +};=0A=
>> >=0A=
>> > No mode tables please. Control the analog crop and binning through the=
=0A=
>> > selection and format APIs.=0A=
>> >=0A=
>> >> +=0A=
>> >> +static const s64 link_freq[] =3D {=0A=
>> >> +	IMX576_LINK_FREQ_600MHZ,=0A=
>> >=0A=
>> > The link frequency should be selectable from DT, with PLL parameters (=
if=0A=
>> > any) computed by the driver.=0A=
>>=0A=
>> I don't have the full datasheet, so this cannot be implemented properly.=
=0A=
>=0A=
>Have you tried to work with your support channel to obtain the=0A=
>documentation?=0A=
>=0A=
>--=0A=
>Regards,=0A=
>=0A=
>Laurent Pinchart=0A=
=0A=
Yes, I tried but could not obtain the full datasheet.=0A=
=0A=
Best regards,=0A=
Himanshu=

