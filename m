Return-Path: <linux-media+bounces-58800-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sF2dBNdY32n1RwAAu9opvQ
	(envelope-from <linux-media+bounces-58800-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 11:22:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EE11940283B
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 11:22:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 778043042E0D
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 09:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BAE6335091;
	Wed, 15 Apr 2026 09:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="chGELXGG"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011070.outbound.protection.outlook.com [40.107.130.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704583264F6;
	Wed, 15 Apr 2026 09:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776244911; cv=fail; b=uBGF1zsZ2x05wdKoMweaY7bD7Tz9/xGH0EdYoHd9nmrMO+tvV9QLjZqYpwVnUi1vaJGrHm2z38ZHYwMPxLwrI1Ezpy42/L20YVLI2Tovd07oyECbuANiPYdC4BQqrDE/DcKbswRJYQFdSCgaMZmr4fq3vBX+vCsSD3Xb7iCJcrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776244911; c=relaxed/simple;
	bh=DiZWMewKGk3E6eySD3Ob0SxXFPu6yGdRa9Bcu8TWwTQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sHEqbvheuEqr1+Ep9FLB535z3P50Fcz/2PRiCMXmsluRuFnpfRZkVnC3odYopkX1vpphhtR1MVtSc5VnG5eBqtMWEGwglwH1NoZ1HZr2reaeaKjeGwY66ugKH0A4338AfMOTwppA7EjKHLByoAV/VXbE5G41HUjti/vgKBUxs9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=chGELXGG; arc=fail smtp.client-ip=40.107.130.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JPRYD++rH2GEsY/bVR1SDnDA/9s0HCC8elgBCUBh3r2PB/OLiwvwEfeMO0YUMLGQWv5XRrseceykAqNYV5LTz93fWKztGz7vbVM2U7ojH/g+qwmzrIbMu5X4PUxs0PW3cj55+BGGP3phNPPGyRVke5AWPjiwCW4rQdq1unXxPr5bcyI32xMn1wfvvnzXxgEp/tIKlMAn2beBZ/fYbMSg4lYOBATFZVGPyPPSxu7OtrnWCN/mKC6l3tV9ejp4yD0o5L56/YzafaEmhcs+/kQWV+FAxzXbp+NYEJFhxNkRhElejEnrwb53ZnwnezpzchlDIb6ura4dMXek+orUD6/XIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DiZWMewKGk3E6eySD3Ob0SxXFPu6yGdRa9Bcu8TWwTQ=;
 b=bIr73QPq19IZReaqluYwnIwCJdnkdP2wJA6DfQvWLUBA8bQr89ACCkJq5n+B4jTRHXJWUIGJ9VDsSspf7ck1vKacU0o00mkguSQUStdhTTZaFY+VPjzBHdASusjgfnnXLImZ6bIqnQaIDuGJE1AoYtooJ14ajJbHOPQrP4d6AKYUXqP9fWlmWgvs3wzftJfZboag/E5B3X5NmBr/V2tIcIqRxrAsy2vpCJZKMB/mULG+LwWZJZA6nOZabMjBZS4qnW5wVi5801lcB12Ii+pidC2blu2KD3BP05tSGYKBa+CvC8Tj0x2HLGYblMANfbXwgzHUyPC9KRNSzZ9j8m0GhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DiZWMewKGk3E6eySD3Ob0SxXFPu6yGdRa9Bcu8TWwTQ=;
 b=chGELXGGMbw0lhXDwumEPes1RmHedTH4eQDFc3xw3FNzf9eSAnRl4PdAa6ZiVRejDO7cwJokn6xyLLmK+aVOMOvqfdnAsYe3k15FyEj2JkKn7UsvT1V5Nqbxt6jYlgGJYNFemxuMPQHGjh6gUQu2X+6XJL33iccZeEZMP8wztSoPaZKWWEWURgZN6Kcq9WXut1Of+0BgCQKcCQ6xsWOBzLp7bMG10AMWAyX9tRJk319DbztAjU+aBM3LA0OSAovJfMLAz2GG5n7fchNqTBNyVMsZJlp18fvSU+MCyJrfzxzTfrv/Nf6L/gYNdmGNhSLdyDWkt8KD9wh8oqDwBx0bIA==
Received: from DU2PR04MB9081.eurprd04.prod.outlook.com (2603:10a6:10:2f0::13)
 by PA4PR04MB9438.eurprd04.prod.outlook.com (2603:10a6:102:2aa::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 09:21:44 +0000
Received: from DU2PR04MB9081.eurprd04.prod.outlook.com
 ([fe80::b025:f7ce:2cc:9e5e]) by DU2PR04MB9081.eurprd04.prod.outlook.com
 ([fe80::b025:f7ce:2cc:9e5e%5]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 09:21:44 +0000
From: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "G.N. Zhou (OSS)"
	<guoniu.zhou@oss.nxp.com>
CC: Michael Riesch <michael.riesch@collabora.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner
	<heiko@sntech.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <frank.li@nxp.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>
Subject: RE: [PATCH 4/5] media: dt-bindings: add NXP i.MX95 compatible string
Thread-Topic: [PATCH 4/5] media: dt-bindings: add NXP i.MX95 compatible string
Thread-Index: AQHczIo7yqSdwt1jm0+Tq4wQSiYCi7XfxYEAgAASMWA=
Date: Wed, 15 Apr 2026 09:21:44 +0000
Message-ID:
 <DU2PR04MB9081CE0130B8924A2B3C9E14FA222@DU2PR04MB9081.eurprd04.prod.outlook.com>
References: <20260415-csi2_imx95-v1-0-7d63f3508719@oss.nxp.com>
 <20260415-csi2_imx95-v1-4-7d63f3508719@oss.nxp.com>
 <20260415-glaring-premium-nuthatch-ce00fc@quoll>
In-Reply-To: <20260415-glaring-premium-nuthatch-ce00fc@quoll>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR04MB9081:EE_|PA4PR04MB9438:EE_
x-ms-office365-filtering-correlation-id: ecf7765a-8668-49ab-cfeb-08de9ad06967
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|366016|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 Mw9XkK+Zg/RINL6AORcMAFMYowJ11dvcqX2FewvlL0OhsRgpRwQ6dgHTpF3GGcMrBI5VYY4H0p2bf/qUQ8Z/zkaQ7FAQg2Mfl8v+SjAslXBKf3Yg99kPAWd1b2ruVEJIXc8pfkRwHkNlRQLx5H3CWUsQnz7BDnzOK6ErsfsOpBZjdrGT9jLw5yI0nj7uzMc70sPar7CSMTYpVtTIOF/vT/lgfkrB/aO67btkYu7O3LJ7Gik2PkFrkX9zgZj/Ybtl4+swpy5Djso5GPtzS1K+dXdnW82T7xY62OkjtdtWvVTP3NSL7X81haxLzGEQm0G6xk/lpHK+BPQO/1rIWmhBjiwalPzuUHc+sc42jDBPJcR53iY0PzmrZLV2XSs0g7t15c+SILoPOxfnfPDVHq0wxdUBEAO2WXvaVF90p0NjflHSE0ylLdg80mf7E0K6Bx444NRwMqGAjV22qd1AGXKngpAcNLweMaqjR3t/3DTwypBlTJZN+tK/IaBHxzZfT4mC6Vgn5vdirGBFm5eoUHYL4QJ5xrXK3Ab19OmRUyNd4SjlB/Qt17SoyjzM9dZuM9M4iIxr758UNyDT54mYLzQJhbjXxdKl9WGzUpStwwUcZ+Il8ZDE92IdyX8w+6qJgcYlS13Ay/+zci7v+Vc/jdmjho+V0QdwVUgKNniIK1QE+nvgxRllWsgwaiU8FxZGvJIbhq9fqFXCRo/CUNb8jSDzgIstfV6JLP9t4GV35ttX2TOc5C0eMRvCFmwzce+t2rykRZm2dypXu2+kNBxpjEsX64PEhLZtG/W/Cv5HYUpw6+s=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9081.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(366016)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?LzRmc3NhZHlZdUVMYm8wTWlwTVhIY004UytjTC84QnZra2ZhVHl1QVFyMkM5?=
 =?utf-8?B?YXJXaDk4WWFmVkI3S3ZoemJNa1VkK3F1Z0xLeEVXVXB6S0VNaGdZUDJMNTNZ?=
 =?utf-8?B?SGQ2MVhQY3NKVWxqZVNCSGdwK2gyTmtjMG03b2VjR1JZUURXVUNFd2h1YS9P?=
 =?utf-8?B?cCtqd3kxRXkvMTFrOHR0Z0N6UDJSZEdpdnFaeCtFVEtVWHgzdzRwY3p3aytH?=
 =?utf-8?B?UUdOSGNhWEJIRGFkMUR0alJCeDFObndLUkk4ZlB3WEV2cExaMnpEVFJnRkxM?=
 =?utf-8?B?RkEyeTJDbmw5RTM3ZkJSY0g4MjBzQjE5U2VLYklILzZNVXp0ZjVyMjN0RjZo?=
 =?utf-8?B?d1lsMzl1ZXdENXhwMnVVRGdtTjJmMWUrWXlnSE1rZUcvbUJROGVkT2NwL3JX?=
 =?utf-8?B?V29YRHVMZ0lwYnNhNStTQTBGL1NFb09wZU1EZkc5TTROcElKME4rUmlzcnZU?=
 =?utf-8?B?bXRabndmdVBXY3gzMWFTZ2dCYWVwN1hyNGhtdEJDd21uKzN3VnIwcEh4RXho?=
 =?utf-8?B?SU5EaytiejVQckl0c05WT0w5YWNPRUlPYllWb2x5Sk5lVEFWd3Z0MWFiN2ZJ?=
 =?utf-8?B?Yk5OTG9mM2M5OU14b3hOOElGc21xeG5IQ1QrcFJxNHBoWmdsTUFFSkxCUWRK?=
 =?utf-8?B?ZGtFZlVEdzZjTHVnNDc5NWRnQTlETVk4VmhsamlaYlBTVURWRTFFaGFHdTA2?=
 =?utf-8?B?OHorc2JJNTNrU29DeFloUVVhYjlCcVB2YmhabEVBL281TjcvdkR3eTdwMFIw?=
 =?utf-8?B?cCtrNDRrUGUzdDJ5UkE1ajU5SU1rZGxCNkpPdXVsbFRhc0VnSTVYTXdyNFIw?=
 =?utf-8?B?WWEwMFZxczl5Q0d1dm1vV0h5QWFSbDV2MTl3VU5TUjl1ZFhvakNoT2Jsc1Ba?=
 =?utf-8?B?enBXLzVGZzR1bVFNWXdaaEdjSkdGQy9xdkpQUGxLWmg1VkVuTDg0QTBmOVpq?=
 =?utf-8?B?alowUkJ3aEVzQ2JEWWc3YUJUa1BSUzR5MEhjWGw5eXcrL2ErYmRUeUloOTE0?=
 =?utf-8?B?RFJNWWl1dW12OVh6NktSMmxiWGJibGgrak0ySVhZL0lzeURMN2tIeUxabndT?=
 =?utf-8?B?SExwblRzNzBNeU9iMkVQb0l4cGpQRUtuM0Y5UkU5STFaVzRyWGt6S2o4SzJi?=
 =?utf-8?B?Uk5QcnFucnVpL2MzLzNoQ1FhQTAzd0pWRjd6N0M5ck9hQ3BWUUZUQnlpbmRs?=
 =?utf-8?B?ZWYyTzk2NVdTaXB1ZWJpMFNUUkhRa1IvTTJheDVLZkh5Wi9HSlN2UTEvbW9R?=
 =?utf-8?B?UmQ4QytjZjJXMHJ5QjJ1ZUZyUEliOSt2QVRiMlB5TDhGZW51ek5FYm1OcVk2?=
 =?utf-8?B?MStGNWh2SkVDeTZMTU9yYTA0eTNHY1A5RHhTaG1tS1RoSk5rLzJlWEY3eDY1?=
 =?utf-8?B?emQwalVDa1RCbXFKUmF6QXlLYWpPczF2dEZ1bzNVZmJDSFFodXpNYnhnbDJQ?=
 =?utf-8?B?NFUxREhEcTJWUWREVUJjTjRhRDV6WkdiOFlRTDZMNEhWUy80V3I1NkZ5cHBY?=
 =?utf-8?B?T0V3a0l3bzVvSTErTjVwQTZYOGpuVW1IYjNCcW5pS3ZzWmt5TTVIYWczY1h3?=
 =?utf-8?B?Q0Y4amRZUUVIMWR6djNwT2RsL1JrOUZHQmF3aFlFNzJhcUlHcWszNHRjbVY2?=
 =?utf-8?B?T1J3RUJkZnd2MFNGSVV0NzZORjJRSUE3cmZyWHdLWTg3ZkRnZlBzMVlhSGJY?=
 =?utf-8?B?dFJNUzVoQ0ZiTGZwME43b2lCYm05dDNPeGJoS2xFSEgzOGtZVVhUakhqQjVk?=
 =?utf-8?B?UTFIaE94cnZ6eVpLVGxNaVVLOFZoaGtkSVM1b04yc3lURXRMOTFLUFpUWE1Q?=
 =?utf-8?B?eDBKSjJwUGFQdWt5OUhmdVE0WkdsMm9hUmpDZEZWbnVNOHJaTmJjSUxtUCsr?=
 =?utf-8?B?b1plT3NQZGtRWDVjNENWVFl4eEllV0xuSEZkbVNId0oraWJuRDlwWWVvT1NT?=
 =?utf-8?B?RmRZQk5oZ0QvalU5amFBZXpTODRRNTUvUlQ4OHF3R1RleUV1SVVHUW96bDJ3?=
 =?utf-8?B?VkkxSFBZZmcreGwyM1ZPVmNOYkxEeTVPMWhZVGs1VUoyZ3BYeVZOck8zOW14?=
 =?utf-8?B?ZFJIK0pLY0hPZktYem9pQ1NzbU9XeGZDTTIvWGpONGRNMTBJZGhaWERkNkJ6?=
 =?utf-8?B?bzhyVDNsNDRpcEk5R2pNZUMrR3VXNEtWMGxsbE5TbXExQi9pRE1kYm16czYz?=
 =?utf-8?B?QStYc3g0alhaVlVlR1FDUUR6VFYwRnY5bDhXS0E2Nng1L1puVDM1QUlXZWw5?=
 =?utf-8?B?THBJbnNVbTdIVGUvTjdoTXc3ZXpYVDNySGJIa3NpcUZodmlZQkNpVjNtNXRJ?=
 =?utf-8?B?TkordDZEWGRqTUYwZWFkNHU1aEViejNrWG4wZjEyMk9XT0h3QmF2Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9081.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecf7765a-8668-49ab-cfeb-08de9ad06967
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2026 09:21:44.4888
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P/0MdPc8jkhsG8qUTy4GZJRLgdh4376akA7QAfN75poiQAhyP3z5maH2isxgf4QCunDR/16ahlSZOmoh/wamxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9438
X-Spamd-Result: default: False [3.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58800-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sntech.de:email,ideasonboard.com:email,infradead.org:email,linux.dev:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nxp.com:email]
X-Rspamd-Queue-Id: EE11940283B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgS3J6eXN6dG9mIEtvemxvd3NraQ0KDQpUaGFua3MgZm9yIHlvdXIgcmV2aWV3Lg0KDQo+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEtyenlzenRvZiBLb3psb3dza2kgPGty
emtAa2VybmVsLm9yZz4NCj4gU2VudDogV2VkbmVzZGF5LCBBcHJpbCAxNSwgMjAyNiA0OjEwIFBN
DQo+IFRvOiBHLk4uIFpob3UgKE9TUykgPGd1b25pdS56aG91QG9zcy5ueHAuY29tPg0KPiBDYzog
TWljaGFlbCBSaWVzY2ggPG1pY2hhZWwucmllc2NoQGNvbGxhYm9yYS5jb20+OyBNYXVybyBDYXJ2
YWxobyBDaGVoYWINCj4gPG1jaGVoYWJAa2VybmVsLm9yZz47IFJvYiBIZXJyaW5nIDxyb2JoQGtl
cm5lbC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tpDQo+IDxrcnprK2R0QGtlcm5lbC5vcmc+OyBD
b25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBIZWlrbyBTdHVlYm5lcg0KPiA8aGVp
a29Ac250ZWNoLmRlPjsgTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29u
Ym9hcmQuY29tPjsNCj4gRnJhbmsgTGkgPGZyYW5rLmxpQG54cC5jb20+OyBsaW51eC1tZWRpYUB2
Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBkZXZpY2V0
cmVlQHZnZXIua2VybmVsLm9yZzsgaW14QGxpc3RzLmxpbnV4LmRldjsgbGludXgtDQo+IGFybS1r
ZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtcm9ja2NoaXBAbGlzdHMuaW5mcmFkZWFk
Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDQvNV0gbWVkaWE6IGR0LWJpbmRpbmdzOiBhZGQg
TlhQIGkuTVg5NSBjb21wYXRpYmxlIHN0cmluZw0KPiANCj4gT24gV2VkLCBBcHIgMTUsIDIwMjYg
YXQgMTE6NDY6NTVBTSArMDgwMCwgR3Vvbml1IFpob3Ugd3JvdGU6DQo+ID4gVGhlIGkuTVg5NSBD
U0ktMiBjb250cm9sbGVyIGlzIG5lYXJseSBpZGVudGljYWwgdG8gaS5NWDkzLCB3aXRoIHRoZQ0K
PiA+IG9ubHkgZGlmZmVyZW5jZSBiZWluZyB0aGUgdXNlIG9mIElESSAoSW1hZ2UgRGF0YSBJbnRl
cmZhY2UpIGluc3RlYWQgb2YNCj4gPiBJUEkgKEltYWdlIFBpeGVsIEludGVyZmFjZSkuIFRoZSBi
aW5kaW5nIGNvbnN0cmFpbnRzIGFyZSBvdGhlcndpc2UgdGhlDQo+ID4gc2FtZS4NCj4gDQo+IE5l
YXJseSBpZGVudGljYWwgd2l0aCBzb21lIGRpZmZlcmVuY2UgcmVhbGx5LCByZWFsbHkgc3VnZ2Vz
dHMgdGhleSBhcmUNCj4gY29tcGF0aWJsZS4gRXhwcmVzcyBjb21wYXRpYmlsaXR5IG9yIGV4cGxh
aW4gd2h5IHRoZXkgYXJlIG5vdCBjb21wYXRpYmxlDQo+IChkaWZmZXJlbmNlIGJldHdlZW4gSURJ
IGFuZCBJUEkgdW5mb3J0dW5hdGVseSBkb2VzIG5vdCBoZWxwIG1lKS4NCg0KWW91J3JlIHJpZ2h0
IHRoYXQgdGhleSBhcmUgdmVyeSBzaW1pbGFyLiBUaGUga2V5IGRpZmZlcmVuY2UgYmV0d2VlbiBJ
REkgYW5kIElQSQ0KaXMgaW4gdGhlIHNvZnR3YXJlIGludGVyZmFjZToNCg0KLSBJUEkgKEltYWdl
IFBpeGVsIEludGVyZmFjZSkgb24gaS5NWDkzIHJlcXVpcmVzIHNvZnR3YXJlIGNvbmZpZ3VyYXRp
b24gdGhyb3VnaA0KICBhIHNldCBvZiByZWdpc3RlcnMgdG8gZW5hYmxlIHRoZSBpbnRlcmZhY2Ug
YW5kIGNvbmZpZ3VyZSBkYXRhIHJvdXRpbmcuDQoNCi0gSURJIChJbWFnZSBEYXRhIEludGVyZmFj
ZSkgb24gaS5NWDk1IGlzIHNvZnR3YXJlIHRyYW5zcGFyZW50IC0gaXQgcmVxdWlyZXMgbm8NCiAg
cmVnaXN0ZXIgY29uZmlndXJhdGlvbiBhbmQgdGhlIGRhdGEgcm91dGluZyBpcyBoYW5kbGVkIGF1
dG9tYXRpY2FsbHkgYnkgaGFyZHdhcmUuDQoNCkJlY2F1c2Ugb2YgdGhpcyBkaWZmZXJlbmNlIGlu
IHJlZ2lzdGVyIGxheW91dCBhbmQgaW5pdGlhbGl6YXRpb24gcmVxdWlyZW1lbnRzLA0KdGhleSBj
YW5ub3Qgc2hhcmUgdGhlIHNhbWUgY29tcGF0aWJsZSBzdHJpbmcuIFRoZSBkcml2ZXIgbmVlZHMg
dG8ga25vdyB3aGljaA0KaW50ZXJmYWNlIGlzIHByZXNlbnQNCg0KPiANCj4gQmVzdCByZWdhcmRz
LA0KPiBLcnp5c3p0b2YNCg0K

