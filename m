Return-Path: <linux-media+bounces-66154-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kBLZCFeoRGozygoAu9opvQ
	(envelope-from <linux-media+bounces-66154-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 07:40:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8386E9E35
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 07:40:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chipsnmedia.com header.s=selector1 header.b=E5A3lLSe;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66154-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66154-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 300293041A62
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 05:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B733F391E4C;
	Wed,  1 Jul 2026 05:40:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022088.outbound.protection.outlook.com [40.107.43.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12A2379C21;
	Wed,  1 Jul 2026 05:39:55 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782884399; cv=fail; b=BgqroWiic+2heWEQbabm6COdDVXkpQoxxXHTq2LKAsBzb9V8t22ss9huesI1vhpQcoLBmQB6l245FcNQyQfLVIl35Jd9d01qZjcH1wuN26s+O4AmuIw7IYieLtsBtyorE42EYc8RWpwnlGVc+EOp4TwneuDCzOacUCOtPMkWmaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782884399; c=relaxed/simple;
	bh=bgmJFkxwvWS33R+f69LewkBG+UWu7bEXTVDnSq4R714=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tJ8Da73QrAxgWoqwk2RNtABcWdp5jtCjdJxOathMPNRqOaiFUMu/MY8VL85f5dVCsjPgJhQUM4jVPyLMOLphFG5k6ufFrZWkQo/V5M6za9RvryKewzpZrOdcSMenR6sVf1bmDMpEWYFGH4k9yPWKPcDj0g0HbXQzYF9LnnlBslA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=E5A3lLSe; arc=fail smtp.client-ip=40.107.43.88
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wO8GaSwq6BQlVIREuB/eQb8nYdb1y08JWNjbcFayRKUViIiEyG4ohlGjbav2XMvuV75gxrLOXfUQNYviOzu88AtvsXnlIttUHzsx+cDoaSYqLOwfUN3j3O1AWozyy5yJdiZQsBuy2IKAoHq0aJhmFBFg5wUJk0rWAZe2wMQiPLWW3KcZyjzTIFFCYLZ11wvmsdz1AwHhkUGVO1LS48AJopAKX/JEqfdLqgKJnhBGdK+vvKEKyfYym+40QNONTsfTzs72Xs++EgOtJyfI2MfYYwiJNo5eOiXLa8k2ZRsIFwHc5h1mPDWsDxqu2Oo0Bex6EshSyM0a0+rIhuLp7z2cEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T1t8ASZT93gzfU5pdTAOTA4V2VHb9WMJJjSO4xw/5mE=;
 b=J2lpyXE/pDcBfWfeEmWxKdnUYJ8KZTW0m4WfQkbBFq8sNs1bU9btdpR/WnL7v8IiLPcnZ3ZU+b9iDlfBueirbLblOnt9KKD+bB+5aiFc6jq+4xGUtnOx3kKfBEv+twLGR2e9xqb8VKAEHkS5h1GrCzFlaOzxD0nIkJOFqYNzXJ5xiX9Mknd/MqJr0YLD7fHT8K2ka3Ix0jx4tz3kbv4l78iOChzbTV2kBiiFjXjqf6VVSb50gEWiSNDe9oFMpu4b2ZlUSVdD36gee+1J5EhE/2wndc4bj79PSZwlnOlPwXl/GnMBSt0JYjYbhSMJzPSq0BsMiTvh/RDL61VZndgrMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1t8ASZT93gzfU5pdTAOTA4V2VHb9WMJJjSO4xw/5mE=;
 b=E5A3lLSeBELTmq1lGjZJiZpQGBATMuk5p/VhU4W3UCsckPJgTF2zxXWkhrIcsHIDOVLqQmfUo5Ct6IvHzJOEObAuFwGIgWGIbZNkfEXrcDN2t2v9Tralqt6cF28Kt6tdPlFcC0ALidwXubuBoCD/drKXzOjMhQLILrxMNcamsTU=
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by SE5P216MB3149.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2fe::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Wed, 1 Jul
 2026 05:39:52 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%6]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 05:39:52 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-imx@nxp.com" <linux-imx@nxp.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, jackson.lee
	<jackson.lee@chipsnmedia.com>, lafley.kim <lafley.kim@chipsnmedia.com>,
	"marek.vasut@mailbox.org" <marek.vasut@mailbox.org>
Subject: RE: [PATCH v6 2/9] dt-bindings: media: nxp: Add Wave6 video codec
 device
Thread-Topic: [PATCH v6 2/9] dt-bindings: media: nxp: Add Wave6 video codec
 device
Thread-Index: AQHdA6oA4dFGLrgtZ0GgpOtEiXsOgLZN6VwAgACMHsCAAFr0AIAJXZjA
Date: Wed, 1 Jul 2026 05:39:52 +0000
Message-ID:
 <SL2P216MB24415FC199917CAD64F62F27FBF62@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
References: <20260624072043.238-1-nas.chung@chipsnmedia.com>
 <20260624072043.238-3-nas.chung@chipsnmedia.com>
 <20260624-junkyard-sensuous-fcd43189b593@spud>
 <SL2P216MB2441BB9DC91CCBE494F2B45BFBEC2@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
 <20260625-artificial-coot-of-climate-efbecd@quoll>
In-Reply-To: <20260625-artificial-coot-of-climate-efbecd@quoll>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2441:EE_|SE5P216MB3149:EE_
x-ms-office365-filtering-correlation-id: 3666f691-d98c-4b6e-c732-08ded7332c97
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|38070700021|3023799007|4143699003|18002099003|22082099003|56012099006;
x-microsoft-antispam-message-info:
 NdVSpDz4N2VCEe83C/NPslHO2nYgp6xvT4ZqyUvFFGCLvQDjA6JCtTa1mhxwXVSQyHusS4AXl0xh3DqyC0OxEeB/UHpuKO+GJPkOg24hcXQo/sbtYNcUka8DcWqz5Go8F7KLOzxSGx2Ug95cadNj2QlzRyPnwtT24bK3U+x8BHHV57XEBFecj9MxHzu/HB9bI5iCFSHvtoO3yri/Q6HSxkUZfukoKSCo5IPZSlolOAZJ3i3gLjQTU8mWqGzV+8tOaHiq+Ni6hGsFaa8YXb6bJY9fdvcYew19fQukWk1U0BcTPVpEFaFZnjjykejINN20MEaOTcjNjKE75ZqTWCmha0ZFTqH9OD8Ks1u7Oy1eir5d4qDzimhxq8fJavs3pmQhvNeH6k4QK9O4ti2cpcyGxfVWvUWrDYgVMV4GDq2ihLC8osXKGXAuqWdyZ6Mf0BWDOOk5vA3gJ3C+gjDRaUxaT2WHkTnjKcKhOVzLQamLRQoM3tvWWxxK6cezig7evyUBB+KzBCZ4XafUTKYbMlT4RWVSSZfi5q0aCx9xbWXzZUn9U6NwNQhAzAnAVVa5etQzuYfWU9/0s7BLB3jAZ862aPEHiSy5XVGpX15Q876EcjPc1k2Lz4mlOmn7TpshmDEqu9UUk9pEZ+CKQklyE7C0OJ5hMpjqA4TDWQZt127mntPgUYLUM7+G9DvzxW+br65TKew7K74pN82onoMMczlVarsBlr/lIEC2RJ7nOdgJm5k=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(38070700021)(3023799007)(4143699003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?H+QB3udHGwvi8TwtA6pB4pgrGtujR9/Ze3DFda8Sb42v8wheXzs0v4bXBIaG?=
 =?us-ascii?Q?5nMb2G+AACy3aB27+hp4MUWV7/QI8DmoGlARkGstxipdS/Zbmi1pOVzS2tXf?=
 =?us-ascii?Q?bL7O+++ApHprt2hQzliRks7vZsA4b7Sgh0XTeuvrcvsKP+VwzofHbSSs08g8?=
 =?us-ascii?Q?bwAuZ+S8w27H5XKO4tcyuyOP5SzkLao6ncStno6iRvrrryxRG3Uv+yOL8g/f?=
 =?us-ascii?Q?cQ9QyZKyOPe/21hxWMN+rJX9zapltRlIIzOLN7HnSJD6fPcV0G7CfFq14i1q?=
 =?us-ascii?Q?rbMaXOT+rgjd3qMif0v4WvhyzWR4DRCHZURXmSF3aE9iAr+sWUDD4aPdmylL?=
 =?us-ascii?Q?xzCbhK/Oif+HZ06EIdTj/TPd1shquhr8otmBzpOKdvFbcGMK1TchCHYfZard?=
 =?us-ascii?Q?JwQzOMIVqHo0nwRAgWPrbxH7zu8Ztub4f51vGVoydjkD60bAlLYzRwz2QY13?=
 =?us-ascii?Q?vGR4o4eTh8pfoZEbQI4ELu7sj1IWgiaMnbFIZYcc4Ap7i3XnxSSO5xgEqo6d?=
 =?us-ascii?Q?X1/4tgnXtv7D1Xu3z4HjWcGCcy9fiiSBOy8hFrIl107hiziCOoQblaqpOeKR?=
 =?us-ascii?Q?jMdkP0ZlsrmcWSrmJ91mhgS2CaRW4MC0gB0RpC2ICcHYky5PiXBpub9860Za?=
 =?us-ascii?Q?wh51VicQHrEvjcdSdpaq/DFMqORopoOwtszioHQ+yoOd8FU+sREuxA0zuqZv?=
 =?us-ascii?Q?uPXIKIvVJOzr4aawdDBgnABaHSOHgh9SFtBH26ayADf1XRQYVjBEbr7NbaEw?=
 =?us-ascii?Q?VzTxcR3qIL/myPTOkzw4hMmJFKfIc241ZHl9QYrMRguz5+JDM17Q/icYbPxt?=
 =?us-ascii?Q?nlIcyaIpI/pyrG+0ThyBDHcXpYk7p2WCCM4KVmVj5JO9I1zVRuqCJqwxiV/G?=
 =?us-ascii?Q?tupBpty6TZhbVtANnzv5LJGdVJNtQAGh3+MvZmo4P9LZnqMtTb1dFHmbdjyL?=
 =?us-ascii?Q?Ao8bLQfcaJluqNscJg0DEAZ/ck4rFI/E5NEG26cjs4mzwaD9awPRzrpcWomS?=
 =?us-ascii?Q?RiRKIRBQv+0bxkmdsjsLmr3NVdPCawjcWr006pssAw/JrfltBpleOedRuUDA?=
 =?us-ascii?Q?jjbdHnUur7cGAF+lShU7r6DsgV9zgzigEJ82Be610GJNWf16Z2sSj4RYOF8q?=
 =?us-ascii?Q?fj8P5IW2rsKnO1DROV4GfvTEuJBkVgc9FYvEFy/jFhOIKNaXSDpTekmyHqiu?=
 =?us-ascii?Q?qKxmBa44o6x8JMR2m84GTXbmx+4HGq37oQiQnmVdOFQ+Yh5ZFnHMUtfF1OqP?=
 =?us-ascii?Q?D0XS2PN4U453fUp3uaWbhekBjJuflOxM8o7KLHLEZb1XrSFQHHOjsHPMDvFW?=
 =?us-ascii?Q?YJ4xK9r/t6EsV/UzI8Gx1ElCZKB7+9XDtQBzmtciek3OcVwv7oi0X4YwerQx?=
 =?us-ascii?Q?nSFwJCfamtPPYcQ2URv53Pd5iN19CT/SZ7+Ze7xqtSUNj+Tm5WNzcYwkowPv?=
 =?us-ascii?Q?/9QUDlCkiEHtmfDBOTjKMb+u0GtJBX9JvAWppGwZTBdBN9KHKWgkxYekdmqg?=
 =?us-ascii?Q?4UEYuLclTnnKqyFJZ4fPsWUHSYVtBKYELLPvCix4giZjrGfj7fmb/YkNgV4m?=
 =?us-ascii?Q?sx5gj1vt0vzVbsknYo2h3+4UpvAUpbLfE3W7stF7IyOyuuiSHqDslrjtZO2c?=
 =?us-ascii?Q?iAK5TB0V3Ll0zTTKbiL2HhZQWSVIHPH6c65VmVqLwkAeZQpcTTn1Bd/xrFR4?=
 =?us-ascii?Q?z3gC0r3oNk8opgdSNcXRmpBZS2OfQ0uWeoLh7VFfPHlC3j0Fr88pVEVN9juv?=
 =?us-ascii?Q?Z4cQc1FF2g=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3666f691-d98c-4b6e-c732-08ded7332c97
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2026 05:39:52.4495
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gZlAEB/LCqbDi8zpKaelaohxaeK/W8QZT/GjdcT47Rj5wkw7aPj9ZhFaiLUYK384054sQTU4KXMOtejq/CHcE3sxcIQ/iwMwH/NwVdkcV6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE5P216MB3149
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66154-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:conor@kernel.org,m:mchehab@kernel.org,m:hverkuil@xs4all.nl,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-imx@nxp.com,m:linux-arm-kernel@lists.infradead.org,m:jackson.lee@chipsnmedia.com,m:lafley.kim@chipsnmedia.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[chipsnmedia.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[nas.chung@chipsnmedia.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,xs4all.nl,pengutronix.de,vger.kernel.org,nxp.com,lists.infradead.org,chipsnmedia.com,mailbox.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nas.chung@chipsnmedia.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chipsnmedia.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,chipsnmedia.com:dkim,chipsnmedia.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C8386E9E35

Hi, Krzysztof.

>-----Original Message-----
>From: Krzysztof Kozlowski <krzk@kernel.org>
>Sent: Thursday, June 25, 2026 3:29 PM
>
>On Thu, Jun 25, 2026 at 01:43:33AM +0000, Nas Chung wrote:
>> >> +  sram:
>> >> +    $ref: /schemas/types.yaml#/definitions/phandle
>> >> +    description:
>> >> +      phandle to the SRAM node used to store reference data, reducin=
g
>DMA
>> >> +      memory bandwidth.
>> >> +
>> >> +  iommus:
>> >> +    maxItems: 1
>> >> +
>> >> +  "#cooling-cells":
>> >> +    const: 2
>> >> +
>> >> +  "#address-cells":
>> >> +    const: 2
>> >> +
>> >> +  "#size-cells":
>> >> +    const: 2
>> >> +
>> >> +  ranges: true
>> >> +
>> >> +patternProperties:
>> >> +  "^interface@[0-9a-f]+$":
>> >
>> >I have to wonder if this interface business is required at all.
>> >Why can this not go into the parent, with each region fetchable via
>> >reg-names, interrupt-names and iommu-names?
>>
>> Thanks for your feedback.
>>
>> I did try the flat model, but the blocker is the IOMMU.
>>
>> The control region and four interface regions are independent DMA
>requesters
>> with distinct stream IDs, and each interface can be assigned to a
>different VM,
>> driving the video core with its own isolated memory.
>>
>> If all stream IDs are listed under the parent's iommus, they bind to a
>> single device and share one domain, so the isolation is lost.
>> This is the main reason I added the interface nodes.
>
>Feels similar to issue Qualcomm has. I rejected such subnodes and
>Qualcomm came with a solution in DMA IOMMU code, but that solution was
>rejected by DMA folks:
>https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-
>5d08f5cd2ca1@kernel.org/
>
>I don't have proper arguments to convince DMA folks, thus I agree for
>Qualcomm for the subnodes. It should be fine here as well, in such case.

Thanks for sharing this.

I'll keep the subnodes and note this rationale in the v7 cover letter.

Thanks.
Nas.

>
>Best regards,
>Krzysztof


