Return-Path: <linux-media+bounces-66054-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f516EfCKQ2qEawoAu9opvQ
	(envelope-from <linux-media+bounces-66054-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 11:22:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 923C16E2175
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 11:22:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=siliconsignals.io header.s=selector1 header.b=MbnUUAWK;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66054-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66054-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=siliconsignals.io (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BD20313603A
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 09:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 441353E8C56;
	Tue, 30 Jun 2026 09:12:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021085.outbound.protection.outlook.com [40.107.57.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596DF3E6389;
	Tue, 30 Jun 2026 09:12:24 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782810745; cv=fail; b=XE81GIPHeG0kqpFhjQqTCEbPuJeuecimY6lpljDeqpgg0drYefZVZXMni3NOdgAhfhLWfZU9KxAgiK8pUXvCnOKWlTVCcL9if/LVH8GTzsqXGM0zb6pxP4pOoSU9edQkchBxIDLjeRlapl/kiSDMFibZH7q2nIEr2uMlHO6XSuc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782810745; c=relaxed/simple;
	bh=K5Eav/acyo1/EGcDdj6OlyaESWhHDH6bRYzdvFnAU4s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ho77ttidsHtnPxe3nfCxVNHtcfVqPF4MxhhZKBYljX+5mjWoc4g8GM/9nWEnxkIHk+QuW4Z5087W475znxsWT3IWFonaIC/xfVwY1oph+Ea/22MAscQvc4S+BDfJcRwKuhSy04PbFzGCW0rrYpobb0ztAtqnPvWsME9HDBmuoWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=MbnUUAWK reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.57.85
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r4/G3uu1yysMUcSvwZohZISttRmSJZv05sDtznnb2T+3Dtvsi9rlLREb4y/wEIOuBn3dzGTRgXD2LO7F/4svYY8ad7f5Io5e0tLu8tWw+gfBngR9nVwbD/IzFYQrffks4NLFmfBpimTA/rxm3bhSJcUZCm6p0aooAoU05K6GVLoxkeQ2D1rll8Ty+wFsG5dkO/xv8VVUbMdZK2H+ts7c42fmvTezuALAuoI7CJ6kHzW1zye7yQ73wUDEtLO4Ce6JkZvJ/Slam1oiNB7OeUfkrqbvkb8Fo9bJs+wvqw1+j/IjDrPfveu/ee49FXpV3sXLL49CpuB3SORE/etiYrXz0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K5Eav/acyo1/EGcDdj6OlyaESWhHDH6bRYzdvFnAU4s=;
 b=au4E7QOF9i+YGi1PcPfxUZM6HKNObHBSiE0jz3VAKz1EJhrHsVM0OSpWtEj3Cdt3RtESIu0buy18vYYkUvvy+a3JCxSsFaP/qiq6pj1/SmMuvqKtCZ4Dk/Fj8RGb3kesnAMVTipF85BILPR4wNr7MojRzet7hknYARk72iFyqgkWU7ssvXdFm7XZwu3ioLbpv/nlujCFzzWGzu5yoYFMJOeHRmXk2d1UYdPxVrmlBpEj+nh3+A3nuMEMcqftGl77vPYU67HMEykoQyAYNp2jHKsRMdOLDf6bcq2h9rnQxIwL/39fvEM7TbO3zS4xzytodb0krljDyywAZXMY1ON9ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5Eav/acyo1/EGcDdj6OlyaESWhHDH6bRYzdvFnAU4s=;
 b=MbnUUAWKDi5yGRmDf+odmwp16Fl3PJ+JCeTNCHIlWhV1JWcyXWnyim0dL9bNxUDYbBbdPG0ISxLWsY/U158gRLVkLA/4HMf37jYBXeIOF6Luh6yryoqlznjCvZcYWIlojD2FUeVlYE1Cc45wNhRPYHy0QMFHBN250aCBko3XDPKDtZvd7XDCX+MH0dHXvrB4vNbm4KC/dDHhvCwUhkRO5B2kW9Tc8/WqUBPlAbKkev1pEI0rbJqFo4fPt+U5Y6sKUL7lGTNR/qC1AhygsJ25mt+k3uLTQdGahQPtroMBVjTcQTlMEytXBrMoEHkEWj6iGNNtI+wgrOIZS4eYJ90exw==
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11e::14)
 by PN2P287MB0692.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:15f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 09:12:19 +0000
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167]) by MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167%6]) with mapi id 15.21.0181.008; Tue, 30 Jun 2026
 09:12:19 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>
CC: Tarang Raval <tarang.raval@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mehdi Djait
	<mehdi.djait@linux.intel.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>, Heimir Thor Sverrisson
	<heimir.sverrisson@gmail.com>, Hardevsinh Palaniya
	<hardevsinh.palaniya@siliconsignals.io>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] media: i2c: os02g10: implement crop handling with
 set_selection
Thread-Topic: [PATCH v3 3/3] media: i2c: os02g10: implement crop handling with
 set_selection
Thread-Index: AQHc08x/lu7PSsqrQUacwrxnrX9oirZEiNqAgAAVGICAAAlSAIAChdmXgBAMKUk=
Date: Tue, 30 Jun 2026 09:12:19 +0000
Message-ID:
 <MA0P287MB21783CB9735EE4B7F8F0AA9F88F72@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
References: <20260424092554.26130-1-elgin.perumbilly@siliconsignals.io>
 <20260424092554.26130-4-elgin.perumbilly@siliconsignals.io>
 <ajPay8NJ233yuCLJ@kekkonen.localdomain>
 <20260618130253.GF3345533@killaraus.ideasonboard.com>
 <ajP0TtXuQhx40pbU@kekkonen.localdomain>
 <MA0P287MB2178623ABA2F59869EE5538888E12@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
In-Reply-To:
 <MA0P287MB2178623ABA2F59869EE5538888E12@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB2178:EE_|PN2P287MB0692:EE_
x-ms-office365-filtering-correlation-id: 1128eec7-f6aa-4f51-3a64-08ded687afee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|22082099003|18002099003|3023799007|38070700021|4143699003|56012099006;
x-microsoft-antispam-message-info:
 fimFWjJwhjYHkUXLniA173YEu32gJB5/tFjLn+c5Hi2Kd0I+9FmyBFjFci5ePkLZ4FmxE+NgT8ZJDg5cGQqCBG03Sv2KmcTHrbl2Ih3+fyyAkW+F5+uA4FmM33PMCWXKR+kQcvRBgaZL88wWwiU6/vR2UCNiDZlTAQyAy7O9c1LGpfBFu9VF9JNLKAK3TdHOrVLQD8d5X8y+QXKibe0P1oOKEKuag6OFciNOTNmKfS2uJuXT/4/iUaoJ/apWQbY6wyae+Q04cRzykEqJ+3ed71uJgNPOYgTleMdjCB5kgZSK+SUGnHhGMhUxiYkurjwphG8Utq49dsZ+0MKVvO+n4DTkR/CW7l16XXBXSMlwajWkgAeE82BjQmpYKFnJ/ZdV+Ehz+NsgJSgaJox7VZ8M8gwB6jEMTzHOYqKlyS0r/UNtwMnbNE8B79rmG4oAlPu82idBKL/qZPAHbG7YmQbHyM3Zvt2stuqH0gntA2SV6iDYX5x3ZPIO3iSeIL2JlH+t5cmQ8jR2tAZRWNtK0hqvU5SX9fVPpQyHRRqQy1g3rsgrjg4uXR4XvtPawX/lPMUVjv4Lgbvk+SzRKGg03Qr4e+DY/jZ/HJcn4buYMUl31DpqzqdcEkBQW7jLpn8AlSJCnNAbVPnU32uIlbbrq1eKFTSHd+Oz/Gmi/iqL+A1TQn/twNjnHBihctK5qMQZz27dP0wuHUDXEtLJNj2/+9WB3jy7VC15FIeZ52+/he1qjhs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB2178.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(22082099003)(18002099003)(3023799007)(38070700021)(4143699003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?bxfn4C1GcqL8r2Int41lIiP8jdCT8FqeY8UTojKeneB0MX+AiXZoIPKX5q?=
 =?iso-8859-1?Q?WKamOpOI4u6//bP8wxemqQ2Twcnr4Sttsa3rKaOL/jYBz3pIZcya7F6KLw?=
 =?iso-8859-1?Q?Un2Vv2IeAMz3GdpTlJeZeFlwtkiDBq6A+qMU9QjFcMSkXLSBrkVn5ISVDy?=
 =?iso-8859-1?Q?WPTA348JDH5lqSPplfuibaNUqzuxYkgDqepplbqrN9AQJAK4oZkYNzTeRW?=
 =?iso-8859-1?Q?GiHuJ5XQof9PeaJZnGDujMF99nqGyorAdEIJlSHdZ4yt2u1V8ZEBRffrsG?=
 =?iso-8859-1?Q?kC2oH3LN/qcV2wvmiZ8UMW7I2m0GySLoeht6jjTt2MvhnfsSdAI6BryEj3?=
 =?iso-8859-1?Q?gVOj2akPscZk1Kcur1L8eWQp5+b1bTQsJvu5IleJtTr47C/kGtc91vnRUK?=
 =?iso-8859-1?Q?Vqbe5dTEyS9HYx+0C8Hs6djaEfN7daHSqs9DB8FGd6nMdHcXqMk5snRpqQ?=
 =?iso-8859-1?Q?EFIN0AX10Wae7N86Em9Ylop/A/Q3jGZdijQhCpaiyQ1CKzM8ifdzcl1j3l?=
 =?iso-8859-1?Q?+szUMv9W72RHVpGCugRXqXOEoJPd+NMLBziHSj0U9Qj9LMiq49yHBM1jE3?=
 =?iso-8859-1?Q?CKnsOUq2RuIczqiKYjHMZtSKDFij3bUQoH55hI0Uq+bE+DUeMRv8ghXlm6?=
 =?iso-8859-1?Q?OCkB25tZ4LlsKK/MVU6uSvG7AUGAMn9sE85cQqrdsakNa3ZkS3KKY62Rz1?=
 =?iso-8859-1?Q?N9CDtU0RlNHaTbliAmbDoIXrQScPADpe3qehoB9C1etulYYgHNVm8+2ka0?=
 =?iso-8859-1?Q?B/4d8OY5Qv83r0x7dPURrEfRgr7GsXDjGO9x4Xl6Xrjt0bgUax9CN29ttO?=
 =?iso-8859-1?Q?UE50WCtUwBDrKAc2Z5O2KwCUm799LyeXaAqTHgHnv/rayEZi7gTbmc3FEg?=
 =?iso-8859-1?Q?NunVFFNLZgXI2gy5bs/IXLKzSkPGneIM8QfhuFXHO2sHUeJ4JHQdZVbAbI?=
 =?iso-8859-1?Q?Kq/lb6NadqafCUNEeC3tzgliMCIw9RqDV8oSZLI1SqerUtB4xPrtU6zaov?=
 =?iso-8859-1?Q?sZ9yvvyRDa9lAaFTugmXavEspSh//hCtbcmgQZC/13SlPIObn0/iCVOH64?=
 =?iso-8859-1?Q?y/e2K0pRtaxRSxWLxu3ay1KIg/7ZYKGuJQ/PWLKys8saV70gqhdM3Q+CVG?=
 =?iso-8859-1?Q?tT76me65anfah1CKfXJY9h79zyOJhqsCSvFEq9cyjqb0KcBokFGrTCtNbD?=
 =?iso-8859-1?Q?zQFhAaXL62LVOhVJDqiQi9OPn9OeaBlVwNh9SMsyFXWGpcKzvxan65XnpG?=
 =?iso-8859-1?Q?vTeQTTxTXFRvPRLDEfyzRvqyLWqjCcAioWNabZDGu8otMAXz8zsfjT2vbJ?=
 =?iso-8859-1?Q?/6MOp8d38EgFjkMSSUvvYzmZG8rcrydTsos5lkRJd+YUv2KnFOtcmIpFTB?=
 =?iso-8859-1?Q?jKxF3fSzss+CLCQRRe5anh/w/LKvwIMjGH81LuR4bUE0N4Zw5XGWvT+uLP?=
 =?iso-8859-1?Q?7hKwFMlxSJ+Fh2fnpUJrJY0zMDe5xMWaEqEpflv9VTmFRcrdKYk96RhwEI?=
 =?iso-8859-1?Q?TPVmm10MLuDiOKwwp9Xx1m9WbtizEJ3GqI884yLJrh7SnKQtVugFJiEJpw?=
 =?iso-8859-1?Q?ZDwehhWOk6T+Cx1BwQJONm5yWTxeZcDb91OKYLoK5uCYGePI+RaUK+cwQ6?=
 =?iso-8859-1?Q?DtQEM3rFoBMeQrF3OdlIp4PHpSD/A6ub7DHCTH+sLwKJBoTQVgDrwQ8Sll?=
 =?iso-8859-1?Q?j5Tg0/m1YjPilWM13hCXJvFqDktr1vH7SxnglBAdKgZ8Ai+C9tcuyduBtm?=
 =?iso-8859-1?Q?gWO0uXXlVwqNEEWDuYVHdFIk1AxcFZmOCcRHJddEcYQ617jUhrMutztvqI?=
 =?iso-8859-1?Q?ZSq57SdZ1Mwr3Cv1vdVzLhDk0I9lbPo=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1128eec7-f6aa-4f51-3a64-08ded687afee
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2026 09:12:19.3392
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gxvg1bKAySEq3TLF1GIRz28kf6GLl8XHd6M4N+CqJiYh41nF/Wokypeti3eX/E2rOgKFUwDHNfS8oQkMw9NcYfM4QuMd4B1kJorlskJ9YwzrrxJPdFxeF0s9FM4pdJ7I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0692
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[siliconsignals.io : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66054-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:tarang.raval@siliconsignals.io,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:mehdi.djait@linux.intel.com,m:sylvain.petinot@foss.st.com,m:benjamin.mugnier@foss.st.com,m:bryan.odonoghue@linaro.org,m:heimir.sverrisson@gmail.com,m:hardevsinh.palaniya@siliconsignals.io,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[elgin.perumbilly@siliconsignals.io,linux-media@vger.kernel.org];
	R_DKIM_PERMFAIL(0.00)[siliconsignals.io:s=selector1];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,linux.intel.com,foss.st.com,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elgin.perumbilly@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,MA0P287MB2178.INDP287.PROD.OUTLOOK.COM:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 923C16E2175

Hi Sakari, Laurent=0A=
=0A=
>Hi Sakari, Laurent=0A=
>=0A=
>> On Thu, Jun 18, 2026 at 04:02:53PM +0300, Laurent Pinchart wrote:=0A=
>> > On Thu, Jun 18, 2026 at 02:47:23PM +0300, Sakari Ailus wrote:=0A=
>> > > Hi Elgin,=0A=
>> > >=0A=
>> > > On Fri, Apr 24, 2026 at 02:55:47PM +0530, Elgin Perumbilly wrote:=0A=
>> > > > From: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
>> > > >=0A=
>> > > > Add crop support to os02g10 by implementing .set_selection() and=
=0A=
>> > > > storing the crop rectangle in subdev state.=0A=
>> > > >=0A=
>> > > > Initialize the default crop to the active area, make set_fmt() use=
 the=0A=
>> > > > current crop, and update the output format when the crop size chan=
ges.=0A=
>> > > > Also program the sensor window from the active crop/format state i=
nstead=0A=
>> > > > of using the fixed supported_modes entry.=0A=
>> > > >=0A=
>> > > > This allows userspace to configure the sensor crop window explicit=
ly.=0A=
>> > >=0A=
>> > > Please wait for the Common Raw Sensor Model patches to be merged bef=
ore=0A=
>> > > adding this -- we don't have an established way to configure croppin=
g=0A=
>> > > before that. Some drivers might do something but it's all a bit haph=
azard.=0A=
>> >=0A=
>> > Does it mean we should wait for the raw sensor model to merge this=0A=
>> > driver ?=0A=
>>=0A=
>> I only suggested this for the 3rd patch.=0A=
>=0A=
>What is the conclusion?=0A=
>=0A=
>Should I drop the 3rd patch for the time being, or include it in=0A=
>the next revision?=0A=
>=0A=
>Best Regards,=0A=
>Elgin=0A=
=0A=
Just a gentle reminder, Should I drop the 3rd patch for now or include it i=
n the next revision?=0A=
=0A=
Best regards,=0A=
Elgin=0A=

