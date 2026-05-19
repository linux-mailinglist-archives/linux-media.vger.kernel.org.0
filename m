Return-Path: <linux-media+bounces-62074-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBRKJgXJC2pSNQUAu9opvQ
	(envelope-from <linux-media+bounces-62074-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 04:20:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 507B757663A
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 04:20:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 409E73015D39
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 02:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3E35314D15;
	Tue, 19 May 2026 02:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KVI0uhMB"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011042.outbound.protection.outlook.com [52.101.70.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2500E3164B4;
	Tue, 19 May 2026 02:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779157224; cv=fail; b=tXcgpuy31ci+MHdx/Eubv4Y/pt5HM3VUE9FnbovO0ybjWiCWKeyWzQEMnm9coE7LCEjjfkAdx+0iLEfKp9cgl7BScuAsGsbyUO4d2oiIDrLh5OxrF6RiNrF4nwZckFL2jIEzPsMM8OQXJUqI2JaBHicyXcWvmXZfyE2hb2ySMOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779157224; c=relaxed/simple;
	bh=EpGK1nbZGPnhpUHRfm9n2tL3vIeotP1zYrXhaFXnqCw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kjWi0F+TdalmnkGYdseUCAjCRySR0DXctVyvysEOGwEEPuPy985q0I8V1m/SqdXvZCda2X7cQRIUWOn/pDwp8mH7Gl/KYx1vFQkacv1l5CHwLtgcL0UnHY6GX2UozKUzlFKmn/9eSoNIHauC+k/+Z/QDAjLPmvgYDW/HJjly4Pk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KVI0uhMB; arc=fail smtp.client-ip=52.101.70.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJSSQwCuZUNnWhREK8KPF2CwNA1UY4tP3qOtNqetlFx+APNI6GiqEyhojmAp4GdFITAmHCnFjcCJTZEQprHOQNNrZXyu5HoKhDHv5pI4JCou3YID3lrQyC/VcmmXjYKYU519Pjxg95jkOFUT8yHb6Rmg2+bQ/D7faW+X4xWjPZD5Ikf8K5rBGB6HJ3XaRsHJXNWb2THWjPY0fgzDnPd88BrzHU38/fWPJNRNX3JO+9hli6Z5/oMIs6rojiE9RvhkYaT3u46Jrzt5syTPduYHaiMHl+7YBvEefsKNIH8wMrPZhRbcAFi5yguhcVCM8PXPLWEuWHMtXn9csZ7yeuM2+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EpGK1nbZGPnhpUHRfm9n2tL3vIeotP1zYrXhaFXnqCw=;
 b=unjdvYoKJ7kKRIutr7qi6VYS/5yiGarWAGJLqsNYDCsa2tCgUgPV3nxu+knUNnvpYN4jQzUS9n4twviEXO52AbNgi2OpT/tDJZBPXVlvj4zDsMBxdvKHhyy27kwxTMEgpX8NWMdsTSe2ij4b+zh7DTj3QaO5abWgV4BnJsx6VEdTFRrQNlW0xBub9CpdmSPWrpTizAxybOQ7VMbuWYdTNEXqRemGFurECpvDjCwLNKU4aYLwjSKKDC3Ycrd3ETCIYkzGk+Jh929XFlLKomxc/Ts7O3IDsdW5TRokB/cOfGmeM8+FTvvbb94Z+b9quKyvtdTeJrKru+YdjoLsnZGV4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EpGK1nbZGPnhpUHRfm9n2tL3vIeotP1zYrXhaFXnqCw=;
 b=KVI0uhMBntiH37QjYjvpDxpc8222nH/1ADZegcD0U1chDtvmMOeujS/LLhP1fvRTy4xopIEw0tLe7qMetH2ub8xgv4p0aqjzXLkCHHo52PpOsvaJlKzRwFgZb07slY0Sxqna0+XQvbqKSsN6St6nEwf/QIeqtTB4ahYAY3gRrIfTSGKKfyshAbPPgpSCl6LbLuTTgjS3GwjFd5VW35LQSQxKUNX+/Z6wqk00SRxNPdMAcMG5XDxmzwtFe2OY9971ijuS6GaKM7ULdTHhgcjs9OBAbkcohCAUveCaygKJAFIgR0Wd3UgRiKa+Vh4wDBm4QapmA4U+QONCa8Um2p6J8A==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DU4PR04MB12129.eurprd04.prod.outlook.com (2603:10a6:10:643::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Tue, 19 May
 2026 02:20:17 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 02:20:17 +0000
From: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, "G.N. Zhou (OSS)"
	<guoniu.zhou@oss.nxp.com>
CC: Michael Riesch <michael.riesch@collabora.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner
	<heiko@sntech.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <frank.li@nxp.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
Subject: RE: [PATCH v3 0/7] media: synopsys: enhancements and i.MX95 support
Thread-Topic: [PATCH v3 0/7] media: synopsys: enhancements and i.MX95 support
Thread-Index: AQHc3TWPeAvGhgkyLU+6F1+1rfzOdbYUXx+AgABRJAA=
Date: Tue, 19 May 2026 02:20:17 +0000
Message-ID:
 <AS8PR04MB908026DC0DE479110FD13DC1FA002@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20260506-csi2_imx95-v3-0-953b6e1a80dd@oss.nxp.com>
 <aguDpxP4SIcJWdcc@kekkonen.localdomain>
In-Reply-To: <aguDpxP4SIcJWdcc@kekkonen.localdomain>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|DU4PR04MB12129:EE_
x-ms-office365-filtering-correlation-id: 9a6e9c3a-49b5-4e28-001e-08deb54d2b2d
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|366016|38070700021|4143699003|11063799003|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 6tprE1Vw+XaYl1xA/EPGIMDRDyOP5BU+ZtKUo0xS89u8J8eZlhg1ebquD2LdePlHvWSFa4AjyKRgqSPr1e0r4Kck5TsFCFUgG85Q24t/kUgKbFrGEdnBtLVFx4MxnvCKSM3MHft2flDTziAS4WyUFZxJoqEE1ncsWZTJ4JAaWHvYHsUevvbyw482zaVRYjffpobjbH/qPbeUVfQ7B1OewyTPpNRk0BBQEyx3Cq645FmZT6wWynlXHUcwa209axN55scDexdkR+mm3ItZ6z850FQ642py5fZGklRRCYDP9YswB6LQkgougQcSCVFwwBqpCxUB1tAymjDS8ajbma5v5FY/iYp00scPp2nMXnNHAAATSCumGq7uk18n8If9Rm4B9pPiNiV/LHQ8Se2NXJGsiiBLEE3N1j6VWGP3uL7PTFX+2EUIFa5xC9x0zE8IhEVhh3nRvtk4ZYRrqjBF0MM5FJ7gBe8hRZcBOq41yDhkzZX3J8w8KEoUksp0GhdM2jBKyxSJrHfto+76qAjb9AMvs/fUHlL56s/s1Z+xnL6vdC2Jr1EDQ+xdkVHPQ5ZueujIYKl0gPCIb3P7saCN3QA9beUP+21Ufa1dCO6hfU+H51KVhEW4uQ6FUOn6DbzT3c4zsQTBvkcLn7CfIrjJ/zA8BCUKZDd5Cp/QnzTfmA9nNXaViGmFv353OwJSLHyAgO6L4MRwrgpBWb1luQe49vCdO8GwUkFLdEzez9ukT5VOtqAeLIbAeqvxzNyAYqoD5o1d
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016)(38070700021)(4143699003)(11063799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?8xGcehPSOtP8og6pYtUG9cMEXfh/nu0+raKgPVcX+SzxVrVVP4sRbAAM6ie8?=
 =?us-ascii?Q?wNy/1IIWK6M0PrEHgMNn6yI4mL8rrYxGt3iy7ELalRdKvb1hTCO8ftkwmR88?=
 =?us-ascii?Q?srI7TabeJ9z2PUq29l6m0TyL23ZGoXsA6Yki5xPCAR2WBOCqdkbP9x3Ruric?=
 =?us-ascii?Q?x5v6EPW4+ToM+RqT8zCcpW+xe471YXC4EXKqTCJQqcshypvgWrH0hWqpGdQy?=
 =?us-ascii?Q?wLEAVNAHk1Ih5kMAcmtok3ofHvwRws6MJfF9PM4hkun8TJvRJOE0hyVuBnk6?=
 =?us-ascii?Q?3ciDiOPeTeJM2XLg1zHKFlsas9a14DlJFk9PPu8ZeyZASrDiaI5RSshefE2f?=
 =?us-ascii?Q?FoyTwBrcClMBGqG2cSJyjANM25MOWX+oYsRNj7UGcXJLMVkLvO187EDO0sBI?=
 =?us-ascii?Q?2GEVIFXnq+K53WStT6EFl0oBzgmrP49ON62hvn6N01JjF/pCvJyzJ3zRGUZx?=
 =?us-ascii?Q?6eom1W/kCbXlb/k0V9pX1xb3j3o7OhA3GOXaSWATW5V8Kxeo6n7XKk/LGHgm?=
 =?us-ascii?Q?EQa0lE8FKSLbTjxO1PqVyLJxlCeRLXi6BaApdfvQBPrpoVZiFnaTE9eo8wVe?=
 =?us-ascii?Q?5CC+bGM3opmC8DhdjupE6ZRWjid9xwG9qPpzM4KkVSNgb4EZp3pdIVmzxSgG?=
 =?us-ascii?Q?espYp/F8ZjO89cM1JOD5tsBDQLYKzgH8dz/irF3R8N0UngeT2qfzXG0kkkKa?=
 =?us-ascii?Q?dtuBgep861jktW7MgtK9862BiVwBnQKBWElLsO5P6Lcl4d2cpZTZcsNWIUSe?=
 =?us-ascii?Q?ntfxk2U2j3E1LX+4oGbr4KApM+06f3eqSJUTSMnF55aOVuU4ieU2+zbsf7Sm?=
 =?us-ascii?Q?+d6VBtBTH90puNyKQckX5xAxFc9eFFB56deGBx19Sdud2f/hSOUJENaOkvYj?=
 =?us-ascii?Q?3Dt2zSwKD4nfjb0RfhKWtoMB85F/WMygA6XhjczZIMW4yNBzzo01bmx/0m8X?=
 =?us-ascii?Q?bt2qhQ6ReCbfJPwbCdfFmnSg4iGADF/uV/D0362M1+Ok65On01b4NCeUtLK0?=
 =?us-ascii?Q?svH/UiNTlTNPPkdojvf5uBRKLix/dOmTbwhdjThSssNjQxZ2uzXbA4xe3WTv?=
 =?us-ascii?Q?kiZplcRWsc0r1S+4+kAoW5mLDk9wOIMnVQtsAWbctKzYn135/RPhL++rB04U?=
 =?us-ascii?Q?B/nSNrJvKLXzceeL0OJ6GIYRWb8efGZUc/vh0UI/DIy3VcCAhFbv2V6qrsPX?=
 =?us-ascii?Q?b8p1ZhFlJ62vwNdNw0hnYFvqfa7Q93JWbzdy75S6ZpBgNHGqmuyDLpG1QQ2l?=
 =?us-ascii?Q?toOkbCyhCjFG3CH7Ovh6l8PtHHKXtiGbd4hByobd2pTi8eNbg41UOrkC8ECP?=
 =?us-ascii?Q?OOfITWfarH4WrHDSinlUQEgDZgVyCTz1SL71hXhRQ/Gl9OJbywBSYC/0oGCR?=
 =?us-ascii?Q?LDbkItb6d+46QGeGWv0jB9OxsbZyTHl39JVTWsrrv0PxI2jvdwi/SKL6aDEe?=
 =?us-ascii?Q?0PGGukKc4VOwHvxX29f6yP8lTi8SzIu2V0BXwM8XQmj9rp8FRQ126BLaaN3J?=
 =?us-ascii?Q?M71GD+iUK9zE+JFmaaZUi6L018dEmSKbsr6fx+zwMYo8hw3U5RfVNuCIjDv5?=
 =?us-ascii?Q?oIR7q5EaonEVmH2tUiHD8f6wu3x1q6JZ26NCHZ+lsIcbHIuYmZawO2/yxnW1?=
 =?us-ascii?Q?ecDtfVpdzW94gCDwL8zexLUpI9ITOXisLdA2hdwFqNWO1m4lf/Xx1LLed9cZ?=
 =?us-ascii?Q?53HgqPg1TtSNMEHDEbD4JbUBddTAVoGuyy8Aqhdn3Z0jVYyfdmz96Up267JS?=
 =?us-ascii?Q?y/SVoc4oig=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a6e9c3a-49b5-4e28-001e-08deb54d2b2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2026 02:20:17.4400
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P4zS7xw4RhPRjBFpz9UdquGokrJdvUpYpVUeO5wOAzEojvsmyrUzcIlxsiOIcgSdyWjFHUYthqjcemLnnKPfGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12129
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62074-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 507B757663A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari,

Thanks for letting me know.

> -----Original Message-----
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> Sent: Tuesday, May 19, 2026 5:25 AM
> To: G.N. Zhou (OSS) <guoniu.zhou@oss.nxp.com>
> Cc: Michael Riesch <michael.riesch@collabora.com>; Mauro Carvalho Chehab
> <mchehab@kernel.org>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Heiko Stuebner
> <heiko@sntech.de>; Laurent Pinchart <laurent.pinchart@ideasonboard.com>;
> Frank Li <frank.li@nxp.com>; Bryan O'Donoghue
> <bryan.odonoghue@linaro.org>; Mehdi Djait <mehdi.djait@linux.intel.com>;
> Hans Verkuil <hverkuil+cisco@kernel.org>; linux-media@vger.kernel.org; li=
nux-
> kernel@vger.kernel.org; devicetree@vger.kernel.org; imx@lists.linux.dev; =
linux-
> arm-kernel@lists.infradead.org; linux-rockchip@lists.infradead.org; Krzys=
ztof
> Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Subject: Re: [PATCH v3 0/7] media: synopsys: enhancements and i.MX95
> support
>=20
> Hi Guoniu,
>=20
> Thanks for the set.
>=20
> On Wed, May 06, 2026 at 04:53:59PM +0800, Guoniu Zhou wrote:
> > This series enhances the Synopsys DesignWare MIPI CSI-2 receiver
> > driver with multiple stream support and adds i.MX95 platform support.
> >
> > The i.MX95 variant is similar to i.MX93 but uses IDI instead of IPI.
> > Since IDI is software transparent, only a different register map is nee=
ded.
> >
> > Tested on i.MX93 and i.MX95 platforms.
> >
> > Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
>=20
> This doesn't seem to apply to the media committers' tree anymore. Could y=
ou
> rebase it, please? (Or are there dependencies still out there?)

The conflict is caused by commit 658810422076 ("media: dt-bindings:
rockchip,rk3568-mipi-csi2: add rk3588 compatible") which touches the
same area as my patch. There are no other dependencies.

I have already rebased and addressed this in v4 of the series, which
has been sent to the list. Could you please check if v4 applies cleanly?

Best Regards
G.N Zhou

>=20
> --
> Kind regards,
>=20
> Sakari Ailus

