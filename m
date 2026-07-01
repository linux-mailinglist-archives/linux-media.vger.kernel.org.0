Return-Path: <linux-media+bounces-66155-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GyrgJ3uxRGpczAoAu9opvQ
	(envelope-from <linux-media+bounces-66155-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 08:19:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2346A6EA279
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 08:19:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=siliconsignals.io header.s=selector1 header.b=XafdcHIF;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66155-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66155-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=siliconsignals.io (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9097C302FA8E
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 06:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A4C63A0B05;
	Wed,  1 Jul 2026 06:19:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020078.outbound.protection.outlook.com [52.101.227.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2690D224AF2;
	Wed,  1 Jul 2026 06:19:31 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782886773; cv=fail; b=X0ZQFK96CuHBilsNxL9cV+8fFMX/Aij5cooTldjXS6fWI4JT6CEZLO7AWY9Hm0OME2qQL6MfYTxhfX/r6JPWhvd6GEGp5b965fiqeBXJXat/e8I9YsbzbxCpcfpWyVJCNUEg0wrqvuai1jVV/jp1KuVeeYbh48PARNWt4Slxh4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782886773; c=relaxed/simple;
	bh=FTH5LbOO5M1Iuu+Z4kY3BbWF4UOFZFtSqTD7MkSLKfw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sZLp66HiIWVJF1jD46M3l0XIRIVyRQXCRpZo44v5NtnYVqQhZy1dgatXZnRHgpf0mAucInjEyWmnpryGMO4FmfTIlPJlch1yN299Vgihe10+M3zjSZWL5J1twHIHG9dhrQZ2jRgn9O1XriclelsE2QopHDttiIMyPco/d3qA4xA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=XafdcHIF reason="key not found in DNS"; arc=fail smtp.client-ip=52.101.227.78
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y4us50u9uoH8OMv44nk1L3s8JVZ/9LRyXw+DhgwKEi4iHAbtZ40drKyI+85NExLY2Ep3JHLE2D9mKwxVaA/ntF3/3qktSAUEyGlaOY1sxN6gNtjdHBy9eNPo52B5e6DbHu5DqyOLa/LZHpPbhR3pL9nCLAnWyJ2W9/vl4yAZfc0pqKximDHCIm4AEdp1apu/lTmEbR+DhnNgXJyTZ+FcGKWaCqiuYe7PnTxQJnI+E+0CvzADcu1WCb5FFImZBOf0LyfATsM4kaSwYFU7iC2uErHCdKfx3HVv+cx7oh3q1v9m3hq/XH0S8Mct2+uYPx5P5DdWBwpaQpwoA+tR4ohjuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hiYN1Cn7d1Pq6EPy4ouby34N2prEoQ9jV/pLxBCtQL4=;
 b=ucx6DRMuvlG5m8mGRRqZyIoDzkZJnczH2b+1U5T3Iyef7nLYG/ZuR7ga9I1UrIJL9GPOId9UnMU3RCdSeLuACjj7ru3FuqdjFwPxtAEmd4BWEfHeC19cIuFZY/wQX15Np1MUpWaMfUT8QfWzxbpCjElmDZ7L+7xlv6Yx0uMW1zOQiYueGmTkMTwp6GmANuxvHERBlLMqjnc1f9OtsE4mGvAZeV0aThRYEXuZiMrhRaZvSSJaEVpBTYk1kdxcFFV86g1asVo+OJIXoqRrPSrcVodJJ/wV0lwGg3aynFe5bg9xpxCr/GqYOiymv14/gyko71BMBY7PcTQEaai6HhnKog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hiYN1Cn7d1Pq6EPy4ouby34N2prEoQ9jV/pLxBCtQL4=;
 b=XafdcHIFht/77slXeZemWzJGgr+XkBIFKygM7wBVWMN/SgQBqogl5yYBhfW1Z9vqz09YXlwTb6KpElmKO65Fnozu5LdtfmZkECQywpg6CVwwNlu2sy7jpZa+W6zFbHXL2LocmVvttGXweRu9rnQS5t/U7feEQS4F7/HSw+UuI/8fud8l4RT+ZtQ/aEgC6tUfIt7MX+whPWIA4IeXiSDqrZgVIG5IRE+AmDVIEDVmMaesogNMFbJmwxDUT6HgXk861RTry1tdQUpghfC8Ins/zP+bNtMunUqX17d+4Dc1F5jorNzVDlSrbA/1xWqkkacFj9gSn9vM6K8oW3bPJX++PA==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MAYP287MB3915.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:14f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 06:19:27 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 06:19:27 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Hans de Goede <hansg@kernel.org>, Kate Hsuan <hpa@redhat.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
	Serin Yeh <serin.yeh@intel.com>, Damjan Georgievski <gdamjan@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
CC: computman <anis@talbi.fr>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Daniel Scally <dan.scally@ideasonboard.com>,
	=?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v6 3/4] platform: int3472: discrete: con_id vana for Sony
 IMX471 as power enable
Thread-Topic: [PATCH v6 3/4] platform: int3472: discrete: con_id vana for Sony
 IMX471 as power enable
Thread-Index: AQHdB5q8NQpQtUcMokeHZdb/BmiJ5bZWs7/NgABnEoCAARLcyw==
Date: Wed, 1 Jul 2026 06:19:27 +0000
Message-ID:
 <PN3P287MB182945B5747452110940BEA08BF62@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260629074026.35490-1-hpa@redhat.com>
 <20260629074026.35490-4-hpa@redhat.com>
 <PN3P287MB18292C819793395D643D426A8BF72@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <49257d09-a2fd-4a9d-9479-4d2b5e0fb8a6@kernel.org>
In-Reply-To: <49257d09-a2fd-4a9d-9479-4d2b5e0fb8a6@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MAYP287MB3915:EE_
x-ms-office365-filtering-correlation-id: af1b305d-2db3-4eaf-0c03-08ded738b469
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|38070700021|4143699003|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 NSU1upJvg0Ebw4C54IIMYS6y/Nm4gTsJejSIiHpHh/AWLfEFh99+y3GAcPg0aDp4xx6CvoD1VbjBeLj16OkkJPWgh8iE6INvRWES8x2RxQKhAS26YUbnFdjuVvqKZ0GMMp843ueo7W+WRE3Z4Veb+CXUaekCtsaJ2QLKyWUyaP8Ujg8KvvKPj+JQ707F+/sM6IOONntXaC1drgcjXsga6wJSOSYBs6cQZzAtaq97uo3JdkGwr9jniaclLh5pyucBLQBFA/DmM87G++nL0bzdByCDCWygcCOQZWbTiEl2a9mRk75uePrfoABU+3NpGwES41KkTcpnpLI1lAdIYdBW6khdKLt9yS1uoMkmxstAZFhAUTuNfiuXj8265ORY5mYlVQ2iF38Af+27fkL1p8mmmGQxDHH5jXTHVVTNAu5N6NzBzdNvgpFywM4C5SWQ4bGPp391fn8e1GGlLpFeT0G3F2b2OTpF319/i0B5lkC/v8k7Mf8Tasi+8f9vRgiTVBjpTOJAZZ++zAqXiRuyQhLscoCvEjytghPAY0aAg0SJHOaYFa7gAnw/GKvr7/dzgesC4ohu7TSs+mwvXXw8KAhGecSQTnm/ohsGMRSfSwJMUaymDrEReRPOcHl53/IttoqDLVA+HAKO0rSNauGwT1oYRmqm+E9KBTb2TvurCfId7vQTIEppiimJ+y1SWx7fJEEKXvYSZNKRVqUSLAXAWGOp8hK8hFzZ2m3y/xWUeOevmsE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(38070700021)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?u4IEhimZBfeC9x6YzuIo+GrZXW1wU1Eef8miDdb693/2pO606ZM53uvw6W?=
 =?iso-8859-1?Q?HWJHoUCkEJ2JHhSuFmN7V3zJ04W4xQaJxka5UcZOCfA+OdD0mlGJ6HJMmO?=
 =?iso-8859-1?Q?v3zF2aXH9zJ3ayQ21mRAsNXtzrqLIo8ePc7YOrhcXlcjjeobfYsmG9kilZ?=
 =?iso-8859-1?Q?qfLqr+l3C2hSwsExic8hYHWVbaKb4+rEfWvR6SG/s2O+tPN2gNC2MWin9c?=
 =?iso-8859-1?Q?ZYsiuaDBu01j5w1wK48L1PrURGQBphlbGrtampw97GA1yGeejDya47CIiD?=
 =?iso-8859-1?Q?jEGG6g4XwKS81MR2zJlj1AXH8HJJmISYtylc4XadeUkszkfKVooqkBvUVK?=
 =?iso-8859-1?Q?R3pVcphVg4DvXn9hO5sblka/xRjqAf7xaPXACVNuwd2A2RzzM+FC+mdc3f?=
 =?iso-8859-1?Q?ooMVwtg3+7axBM6fNThGbbW///Pi1ONnWPlej676Dm3CANxj1iLrLEOEFR?=
 =?iso-8859-1?Q?/vonRE0MlGZlbsP7v4Ctj5vbzYtg86BV+4fpS5R3pL08YzbriOCumjZmXZ?=
 =?iso-8859-1?Q?FM93QCqYec597EG056e38C+7GOD25xgj6TQR09/E2UxATS2kf0YJLIr4Wd?=
 =?iso-8859-1?Q?9FyznGQnQNzQXzGGq8lcFJssiVa9rcSLJBeHmKtME3AArdzMxpgsIc84tb?=
 =?iso-8859-1?Q?dIo/TJCuKQcL5lpToNfxL8WIXQahW4QBvmhl9Sq94ofV+oWbMa51DKjcLn?=
 =?iso-8859-1?Q?quK+FVVJz87gQi0YELgGXW9jOc09tl7scrM465aJ0FolOx0dAFqkIvOe+Q?=
 =?iso-8859-1?Q?bAz39MBAHYxWnK6BktcOXB/WBK+qGA/SAJL0uCjODHRkq3Bko9vFfcX9tj?=
 =?iso-8859-1?Q?eL4l3Gv1c+Vr4ToYxTAcI4lqJGOL7r9T8TXcwmliCMZdeE1AMKa7pg1XoY?=
 =?iso-8859-1?Q?vDNujAb8H9Xyfbt7o0NiWzbXir3PimJvWlsecFX+zoV1nHlGl3nULhKGvf?=
 =?iso-8859-1?Q?cyDpY9Qhc7kSZP/ozmnCZQfCk/YAI7W5yan8OQbwBrttF4Vu1Rx8VErnoP?=
 =?iso-8859-1?Q?fV8a+UcaV0eyn3V7fiUfyn86vZO280foUwwjPSS3Qh31CI9lbQZwckytM4?=
 =?iso-8859-1?Q?e7ZI+brcnOlWDWBGV8hJK/FHijSt0w5H+P9FEYT8LqH50lnkI280NGy5fz?=
 =?iso-8859-1?Q?rK7Z7TUj5Zl/lZOudLAkMjeaYgZ3LnbiSJ2PddD6uu2DUzUX6wongr71ow?=
 =?iso-8859-1?Q?5sRds+R8X0IhSr8JsxWdsrn9YhrbJkUOdzSHF9zdLyJun/+BFBKgNM32T1?=
 =?iso-8859-1?Q?m2K0xeqVZwZ54xdfuVTP1OC2NN/dzpG+4tm0mJPocNRRlIyLAZ+gZq6WKS?=
 =?iso-8859-1?Q?V+zlNNrtQdZCniBBHkQYhvDlaVQan44Ecml7GITqIy6STwVS5OKxgAFh7x?=
 =?iso-8859-1?Q?9yO6OTJlgmp3p8jZRJIQ2z46J1dc1A7qgLGnfTVygBkkUxlHHx2hVJ5jS2?=
 =?iso-8859-1?Q?u0vLdjROc6u/1cBmqRyOep9S/E+aDL8JMDDd8+TiD6iI0a1HLaiJQMXkp2?=
 =?iso-8859-1?Q?q90Jj6skrX4vLLzAjTJVflLhkZk4brk/OETUXj9y50OFJFkkBCBba1tmPv?=
 =?iso-8859-1?Q?FnFyACogtpVwGgzx9XMKedqp/rdUX2EB0EtCDYPSkQKh57nvI6GbZSIkxO?=
 =?iso-8859-1?Q?H36gyH4/iAGB4D6RH1/k3ZE6GZysxomqfkJByaUI1lMD4Gx1WSRdYeQPyJ?=
 =?iso-8859-1?Q?zSn1dhhX8aadegdNHner5iG1lU3ofmo1l7rRMxky90FACpuwoaEWMTf9co?=
 =?iso-8859-1?Q?FjFFdyfxXacSG7HP5X6caRYyouTuQx+wpDi9jJdlAjV+/ahKxmT1g/2ZtJ?=
 =?iso-8859-1?Q?lZN527Targ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: af1b305d-2db3-4eaf-0c03-08ded738b469
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2026 06:19:27.7552
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6HuN8LJAT7RpeUsX4xKdhb9gohBsSOQgtjvabPWbAFrwDmW3C5VT1JXEPKL25sPbQph2wjg7t9bYMnM/zXX9N+gQyNRcB4kGK5lxiY4ab14=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAYP287MB3915
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[siliconsignals.io : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_PERMFAIL(0.00)[siliconsignals.io:s=selector1];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66155-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:hansg@kernel.org,m:hpa@redhat.com,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:sakari.ailus@linux.intel.com,m:serin.yeh@intel.com,m:gdamjan@gmail.com,m:kieran.bingham@ideasonboard.com,m:anis@talbi.fr,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dan.scally@ideasonboard.com,m:ilpo.jarvinen@linux.intel.com,m:platform-driver-x86@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,redhat.com,linux.intel.com,intel.com,gmail.com,ideasonboard.com];
	FORGED_SENDER(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[siliconsignals.io:~];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2346A6EA279

Hi Hans,                                                                   =
    =0A=
                                                                           =
    =0A=
> On 30-Jun-26 09:32, Tarang Raval wrote:                                  =
    =0A=
> > Hi Kate,                                                               =
    =0A=
> >                                                                        =
    =0A=
> >> Update the con_id for the Sony IMX471 sensor to "vana" to serve as the=
    =0A=
> >> power enable. Additionally, the HID values SONY471A and TBE20A0, both =
    =0A=
> >> associated with the IMX471 image sensor, have been identified on Lenov=
o   =0A=
> >> laptops.                                                              =
    =0A=
> >>                                                                       =
    =0A=
> >> Signed-off-by: Kate Hsuan <hpa@redhat.com>                            =
    =0A=
> >                                                                        =
    =0A=
> > Thanks, looks good.                                                    =
    =0A=
> >                                                                        =
    =0A=
> > Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>             =
    =0A=
>                                                                          =
    =0A=
> Hmm, the imx471 driver is still pending upstream:                        =
    =0A=
>                                                                          =
    =0A=
> https://lore.kernel.org/linux-media/20260629074026.35490-5-hpa@redhat.com=
/   =0A=
>                                                                          =
    =0A=
> As part of this series.                                                  =
    =0A=
>                                                                          =
    =0A=
> Please just use the standardized "avdd" in that driver instead           =
    =0A=
> of "vana" (which also seems to refer to the analog supply vdd,           =
    =0A=
> which is what avdd stands for).                                          =
    =0A=
>                                                                          =
    =0A=
> Then this whole patch is unnecessary and can be dropped from             =
    =0A=
> this series.                                                             =
    =0A=
                                                                           =
    =0A=
The regulator name "vana" comes directly from the Sony IMX471 sensor       =
    =0A=
datasheet, which typically refers to the analog supply voltage. Using the  =
    =0A=
datasheet name helps keep the driver consistent with the hardware          =
    =0A=
documentation and makes it easier to cross-reference.                      =
    =0A=
                                                                           =
    =0A=
as per my understanding, the more standardized way is to use the regulator =
    =0A=
name as per the sensor datasheet. Therefore, I respectfully disagree with =
=0A=
your suggestion.                                                           =
=0A=
                                                                           =
    =0A=
Best Regards,                                                              =
    =0A=
Tarang                                                                     =
    =

