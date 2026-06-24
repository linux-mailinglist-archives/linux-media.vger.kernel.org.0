Return-Path: <linux-media+bounces-65562-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UBvwBM7kO2rbewgAu9opvQ
	(envelope-from <linux-media+bounces-65562-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 16:08:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8F56BEF3F
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 16:08:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=siliconsignals.io header.s=selector1 header.b=YMfOkxkH;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65562-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-65562-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=siliconsignals.io (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5A73E3039DCB
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 14:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78C063BBFA0;
	Wed, 24 Jun 2026 14:07:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020073.outbound.protection.outlook.com [52.101.227.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966873B583B;
	Wed, 24 Jun 2026 14:07:00 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782310021; cv=fail; b=th960owXW9pKHnfNJXL4vcnciglZnSrFbnoAuDdw7Irr26N9RklZuAT/GqdskPnZPqpTJM7RGvV3L9Oeg+mT9iXsEEtgLFF96AyrJ0VswH5srJUe27eggwd1mmZT20L1sH/N8DPEVgb8gI/z0MGpoU2X19ejwIEjJmyz/IkU/XQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782310021; c=relaxed/simple;
	bh=//VcpcDKnrcD2YYqcioKMekxiR/jav29Ah1Cabgboc4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=orXBPwZTX4sCl7KV15xoI/cvj4SJpIVMK/J/ggU2HWP3YAbNPlOjhRMQNmlKReoWx9oy0IQTqHR7USQcOz1nI45DNnMQCeIHr+Lif+KGRu0Pb4kGu5M4jfaFV6j2wQjaPQDH2jwpqVkeL5wON6KpeGkEy0dp8AykpOUmW3X6DPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=YMfOkxkH reason="key not found in DNS"; arc=fail smtp.client-ip=52.101.227.73
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D0lNWYtGlKGHxJpCqBj3wY4psbYkey2kAFmPKT5k3Wlr5a2VApnBNnX3dwqAApbsni+2CgcMCZZoOqYPBQ3v3LrGoQ5tZIFsSTlhqG6Q2TRsEgZ1Q7jmtp8SWlrV8eL+2lAVN/yvbpBX4diQiwaqUfC/3n3CrKLeLhw99bsHtVOtPnFY97fE5qYxxXsYQTUd4pYPMxcqinIsf+s0pIO3dm3HtED8kdklFJ55eHFTg8IjyCaZbvWGIO7806DkC/4DOvadPS7KnJDu1ABH0Bs/fciZ61DVM5KECnhVbUVUahROOyFxiWJVeQ3Yb5QCFs2nFQlReEpcsIOAAflcsKH3cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pThXQ5/xLxETJUyUuH7Fr/4fJP+thhjl13by3kfwkJg=;
 b=fxicrtv1bAF1A4w4h938vGbQTC7KS5IwtS6pKT+amFoOgveUcPGCjUwZvDQlkHCKkcWsgz6KkywJZ0biEOmJVIKmTYfBUvMw0h8XiKIii9Xza6EhZU0j6Z5yQUKodP80IspSXF8ADU+oVjT/00MHMrylZKzTGUpmnswOygOwKJKfbew/Vg2q74YY+v7DywjLcNlHrt0IDB6r6jwu/a5nzGcX/Z7PIWwg4aLNA+840BUSrbr9DmlIaQjeE7q0SFQRk81wfOgetHiRONaptJVPczWHWFEKWdCWTH7681yUK96/DPoEKkM5CNlfDJZkv3Yu6UETPHUtvhZZf8jn3GoVxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pThXQ5/xLxETJUyUuH7Fr/4fJP+thhjl13by3kfwkJg=;
 b=YMfOkxkHBsCHkyEveab0vh4wrYOCDR9lcbET+yLH3A/D+DI714ewkdEVXW+LztGUGdZeh8AmA0nQw1sAYeQkb0SWOiQb6cVdVtmm+QkcovsQvcFAIOsEAdIyL/IfHqO6P5lVoKlzr3LCs4XY1RnGup6nqY4t89nAr3CC0Iwr+J37dAmURwi0FpiAkmRCCGmapWm6zxkr3lsVYdTi2Udzn8x5iVeSub4X8whyf+WzNeHRRyszeuMtJEZmwl3uRf307IH04PbMVbTrT+Ek2ucdmp9IiOujuvvSECGXah90aX3JwxsywYKPvvNZwd2S3y+mdIz+ds+lQhtJJHRIZMLj/Q==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN3P287MB0195.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:d4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Wed, 24 Jun
 2026 14:06:56 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.21.0159.012; Wed, 24 Jun 2026
 14:06:55 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
CC: Hans Verkuil <hverkuil+cisco@kernel.org>, Hans de Goede
	<johannes.goede@oss.qualcomm.com>, Kate Hsuan <hpa@redhat.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Serin Yeh <serin.yeh@intel.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Damjan
 Georgievski <gdamjan@gmail.com>
Subject: Re: [PATCH v5 3/3] media: i2c: imx471: Add Sony IMX471 image sensor
 driver
Thread-Topic: [PATCH v5 3/3] media: i2c: imx471: Add Sony IMX471 image sensor
 driver
Thread-Index: AQHdA4qWGFy8lHm+wkeMR2iQvDfKqrZNrhEAgAAJd9o=
Date: Wed, 24 Jun 2026 14:06:55 +0000
Message-ID:
 <PN3P287MB18292427E6E41029373E9B1D8BED2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260624033508.27391-1-hpa@redhat.com>
 <20260624033508.27391-4-hpa@redhat.com>
 <178230652068.3075020.18062205400239666843@ping.linuxembedded.co.uk>
In-Reply-To:
 <178230652068.3075020.18062205400239666843@ping.linuxembedded.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN3P287MB0195:EE_
x-ms-office365-filtering-correlation-id: 2f79f616-3145-4ae4-07eb-08ded1f9d979
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|10070799003|1800799024|376014|7416014|38070700021|6133799003|3023799007|18002099003|22082099003|56012099006|4143699003;
x-microsoft-antispam-message-info:
 xNtxA4J/Hqw9QkjaXtFAY/H2Rb8CuK+AJAGtR7yNRmJOqxnAwtJX6IP/Ey3lQt2bXOktD6xsP0PyW8D/TbbzlvU0xbQFTFJJK7q3g59gcUygGcM5LBGc2HdnNl/mftcKJwUOTAXIaNKVrqKKSnzFeV46NLG1yetZb/oySSySj2HyQbPWcAWhvoOI/oP9LjpiCmufytAyerQ7sp0u/5DdoJFXE2FeuBQ4ChPACnaH0u7uugrqhISk58sjPya80iEheJNLZ8LDXzExBH/TsrXa8Js8sXaqjICm2HYtNMJ8ICFGtklMCDLlGbEke+f0MyLC2MTlUIaR9IS2hrE07OOEu9/nASyM5dCK6FJtLkf/g3ok4uFe1E35m+Q4NjwynHv1p2I9ELd6zXm1pgWT/N5dstKTPYbCAC/5NPFclrqXhqHT3cpNk1SVMM9DZcrBkcauaiCHeuUEjM3pcHPhByvdIJOe8b9gn84Rduha9nIBKsWWs8kPCKRMXo8pdRwDP4S32B4NGaLMdKVrPTtdgWHOp6RP49bZmjtWSlSQGX6qII/SsJyhHgaUoQf2lOdSbVGvU2xahPbiSHg5VewcBF6/gJJRTQ+dMivWfz0ZfYpmGjXOzR1YMuWK3kP7kzAg0J86zOaRY3leNAh80iTxEwTZna94GtPAKs1WlofTyiMrT581k1Yd5sXQBn6VB6Zjk1pcG0HhgQc4CtwXoSYKOnVS0LWqZ4dNbQq2i5k+crnNg4w=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(10070799003)(1800799024)(376014)(7416014)(38070700021)(6133799003)(3023799007)(18002099003)(22082099003)(56012099006)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?4Q5DrFYSJYnnylVPOqi+F4vRldvv2HN+lnZPhJVo/Bn54cCFfTtwoNRNrb?=
 =?iso-8859-1?Q?01rZ1KBwdR4j0q/54W4HsAM4OBG2sYJrM8tsAhdkKEZosnglaI7PwY0stQ?=
 =?iso-8859-1?Q?yr1yCO6AvutqVnYNQoB8RK2AO+4ezsTbOU2rd7d7rll9OCKUyYTl0QmPBo?=
 =?iso-8859-1?Q?aOZZRz9BDPvhxnvjJWUq4B+P/XhQ4enhK3ZvnBvaRC1sSTGvRVE2bxnd3U?=
 =?iso-8859-1?Q?HCsNt4vK6L/z1a8h1GihSJF8DjsTeeKnJXlG5xJcqzjx5lZQEZJxIcc4d0?=
 =?iso-8859-1?Q?9+5v3hLBR4mMoz8qoSlSKbxLfneGX8zLQNiouJllWggbiIHQboZuPl/ygY?=
 =?iso-8859-1?Q?9tr1QZdGBtcmPIuB9xpaUQacBeAhm+7Qn31Vzx/fiacGoGXsAISURHy4ex?=
 =?iso-8859-1?Q?BQV9cQJVC0hmWLtNoi9OJT/F0Ik/rK3VDDQfigt88GxUBJfa5ZElWmxilu?=
 =?iso-8859-1?Q?wt41uMBFzeBdtPis6AIjLHUfqBt7pM+tBdjlX4Dw2BijVmqVGzEM2PlaY1?=
 =?iso-8859-1?Q?V4LxRjbl9SfTMCbPz+658lyoRY7HRfHKkGMlevdYUod8+ZJdYnXh+N1AOv?=
 =?iso-8859-1?Q?sZqt+jg/V8TSaFoTaJj0+gffhs6RrknQfLy0BrBesPdbVkobO4G4VGViCU?=
 =?iso-8859-1?Q?yfvCN9EfI56rWWPNgR8RNdnA7mik/znlmXspNsv4yq9mcPVKYS65yZGXY6?=
 =?iso-8859-1?Q?qrhJXrB7XZWVq9LLMjCG6PkREM3EWUs1EbMKIIoGr/STIYj993aetK60ff?=
 =?iso-8859-1?Q?UDYeFJL2kmE3hq8qtTfRs80Py1b0SYCxU6uEkqDdK/bJPuZc34vtXdGOym?=
 =?iso-8859-1?Q?S0zxtDIbzfsBkGaPm5cPVtEZqzwvTYvMoMKVSYcASBzGVe3kOh8aFT9vur?=
 =?iso-8859-1?Q?CKL17dQrBL8h563ubcctryah56BhJERyPoInn1lkdd5ZjblNCh91zUD5N6?=
 =?iso-8859-1?Q?Fxo5S2NWC2zo9Z5UW/McjCufoVpEVp1xjEvd+DG9AwOchZqQH66OiuMVfG?=
 =?iso-8859-1?Q?a8fLVQfQ3PQ9mrxmvholrXZ7rCN4uKSykWG9bw7ltjcsLsOc+WacAcLVm8?=
 =?iso-8859-1?Q?9whSktSAgqpyUdC+5Uns1uiR1Ikk6iPcd0TTNcrMW7crO1lo/3Z/KebOgb?=
 =?iso-8859-1?Q?rfnuEPKKWywhsbyFqwRrmCBd6cgsteuD3IaIvw4i7d2U8Y4uIl4hseQP4X?=
 =?iso-8859-1?Q?QgvR4+HMrE+Iso8ABhI6NTn6SDm8WXpb/TmVhCmktZxPVG/uE9dJZmCFE4?=
 =?iso-8859-1?Q?mhT0CJ19sW6ool7baThL5i4phoNRp/612/fScIvjPnb5RE2YtUsnr7uXvl?=
 =?iso-8859-1?Q?AJfb4q0kZ/fIvC4+iQJPQY0wrrEGi5Bs+Qa6VKPRHc6ozc1hsfc37F13oe?=
 =?iso-8859-1?Q?ED0UXhzemUPM47Kjsb+lpmJAZf1ixitgECwgt5V31txAqMaRW7fmKvQ06W?=
 =?iso-8859-1?Q?CZcb3ukf/8JrAXZUQcgNIheuybNp8AFizGnMck4cNeRDXg4Rhub4TV9uE4?=
 =?iso-8859-1?Q?xTw3QaYj5BjmoN53zTiaEO6UZpoV/C67Nzhm/rtOwuHXS15+veyiFN2735?=
 =?iso-8859-1?Q?bSPBN+8g3XxwpW/6CjprnYi/HeyY+vmcFE266ibfn891M3JTjqSd3hSFNL?=
 =?iso-8859-1?Q?4YvrWEKObV3NQMUzA6H4owKw9jUH3/l8kXr0S02PKFWmldOK4u6GTs/yrb?=
 =?iso-8859-1?Q?YKI3zjLT7nctTp9JsGgvgkkvcDyVaZGULM+C86ZBihkOHyBbo0NZkVqhf7?=
 =?iso-8859-1?Q?hh8I26Oxw5knN2QGlmZwVYpZx3dK1mkQizx7E3qF55mBqkIglaxuPJnive?=
 =?iso-8859-1?Q?lgX4YCiO1DGbRrBeer4zwnNjUWyq/ZNSlOs7WH6obAzRBBVLnDsUYELWzD?=
 =?iso-8859-1?Q?lr?=
x-ms-exchange-antispam-messagedata-1: fxGUiIOXwSHkpikMZZNr4aMsz5KoXCLN5Mo=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f79f616-3145-4ae4-07eb-08ded1f9d979
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2026 14:06:55.8478
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jcTtTS0kuoDk0DVK9sg2NT3+FDbWWbyK7csXd2iJktzMMNArURse78H/P5Y5ONoAJkG4uUWyfjq6Eo8RSQdoYnO14f+GNeKcWetvVh2LeZo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0195
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[siliconsignals.io : SPF not aligned (relaxed),quarantine];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65562-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,redhat.com,linux.intel.com,intel.com,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kieran.bingham@ideasonboard.com,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:hpa@redhat.com,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:serin.yeh@intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gdamjan@gmail.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	R_DKIM_PERMFAIL(0.00)[siliconsignals.io:s=selector1];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[siliconsignals.io:~];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,siliconsignals.io:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF8F56BEF3F

Hi Kieran,=0A=
=0A=
> Quoting Kate Hsuan (2026-06-24 04:35:08)                                 =
     =0A=
> > Add a new driver for Sony imx471 camera sensor. It is based on         =
     =0A=
> > Jimmy Su <jimmy.su@intel.com> implementation and the driver can be foun=
d    =0A=
> > in the following URL.                                                  =
     =0A=
> > https://github.com/intel/ipu6-drivers/commits/master/drivers/media/i2c/=
imx471.c=0A=
> >                                                                        =
     =0A=
> > This sensor can be found on Lenovo X1 Carbon G14, X9-14 and X9-15 lapto=
ps   =0A=
> > and it is a part of IPU7 solution. The driver was tested on Lenovo X1  =
     =0A=
> > Carbon G14, X9-14 and X9-15 laptops.                                   =
     =0A=
> >                                                                        =
     =0A=
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>                             =
     =0A=
> > ---                                                                    =
     =0A=
>                                                                          =
     =0A=
> ... <snip>                                                               =
     =0A=
>                                                                          =
     =0A=
> > +#define IMX471_REG_EXCK_FREQ                   CCI_REG16(0x0136)      =
     =0A=
> > +#define IMX471_EXCK_FREQ(n)                    ((n) * 256)     /* n in=
 MHz */=0A=
> >                                                                        =
     =0A=
>                                                                          =
     =0A=
> <snip>                                                                   =
     =0A=
>                                                                          =
     =0A=
> > +                                                                      =
     =0A=
> > +static const struct cci_reg_sequence imx471_global_regs[] =3D {       =
       =0A=
> > +       { IMX471_REG_EXCK_FREQ, IMX471_EXCK_FREQ(19.2) },              =
     =0A=
>                                                                          =
     =0A=
>                                                                          =
     =0A=
> Does this work? Is this a compile time constant multiplying floating     =
     =0A=
> point with the compiler, or something happening in the kernel?           =
     =0A=
>                                                                          =
     =0A=
> I'll be happy if it does, but it catches my attention as something I     =
     =0A=
> thought we couldn't do.                                                  =
     =0A=
                                                                           =
     =0A=
I tested this with GCC. It evaluates the expression at compile time and=0A=
folds it into the integer constant 4915. The generated assembly/object=0A=
file contains .quad 4915 in the initialized data and no floating-point =0A=
instructions are emitted, so the kernel only ever sees the integer value.  =
                                                                        =0A=
                                                                           =
     =0A=
Best Regards,                                                              =
     =0A=
Tarang=

