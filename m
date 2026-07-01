Return-Path: <linux-media+bounces-66156-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i6dgMma1RGo8zQoAu9opvQ
	(envelope-from <linux-media+bounces-66156-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 08:36:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DEC6EA448
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 08:36:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=siliconsignals.io header.s=selector1 header.b=jjDo1uRj;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66156-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66156-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=siliconsignals.io (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 76BEE303EB9B
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 06:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E8813B14C7;
	Wed,  1 Jul 2026 06:35:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021075.outbound.protection.outlook.com [40.107.57.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B078C36F8E8;
	Wed,  1 Jul 2026 06:35:21 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782887723; cv=fail; b=KDvd2PgaxF5PDEXUnwjpUxL3PRXeFAnghbKYm1audmI9Lbu6iyP/MCMYWCpemJ0QkrYhc5M7PQb9U26X4ZEGhfFJbi3Xl3oQ4J0qbs0pVgDEKtyFMZCSC+tvep9hd+hXdyk/QkSigd+5J+eesWNzH3bHE8rKzH2WaaIVa3K6YGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782887723; c=relaxed/simple;
	bh=iNAwifXfx6LLw0JTFf7tN8xKTViEfeCaGavr+X1uZlY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tUoSQgnPRkKKhGPr5OeO8wxko9RA1elKyDPQxnPamKi4KcP2hLFwo1qLzviMZ7tHB8BbytBeqhfk7cxfDZ57a31zJ4D3jsG+FtoLtciw0Wg3SBtnnrOWVjiwJkSCZuKjljTUCmfemWnGv/frh3LbIy7+0mVRQYu2gQeMb0V2Kv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=jjDo1uRj reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.57.75
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P6LhTXsqBS2AsU4f51I8Rv5ziSikitX/XDWbD8InTTj4VL0BxJYxxRbGARRearGn3TJJftUytbYPHhEcEY9FJ4mpcsYthK2UggQ4Tr1gyypcIOW9O/tuxcEKgvaNguFs9Tsa/Fe7ckllp5iY0FJ3oYS9Gx7GFUjnWVe8acgYtsbEWJCcoZXxdXE4zS1UgbtMpAsrDFAsenaiQCGZKJ3+2FcOXsbZb5c47ZAD3e7NrBuqy/nHXQFbeuW8nF0OkzM0MhwGGp939ycKII6P47F1PntSNk1FP1AMxJSVhvPZhg/fa/jHfZvIebljwjtRSiuaSk/oF6c8IewRA78RAWbvtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SzcCxuH9OTc1mkF4O9gvYqf8N24AewHCgzDlMU9p3bI=;
 b=IGSVoPZlNWeq/U80v6Mwjqsq4ZbvwF2vxtjo4pa4VaKpde+b9sRhjlOK/4xlWGsgpy5mJwcnoTMjLiJFdNB3AmIWYAJ40Wo8jWjQ4fkY5vI/J0p5qrr2KjUR8RuCrDy2MFNkzKEYTtb15j7w1lhE/EPRIa6KTt8f7/2fz5UKjvNQdqnWNi3cj2/Gw5M2wFfTM6mvBO4KM6drsoo8p8Z4mFuTLXyXx5E3dxekC7ki3u7z6/gLNUzPA6SVqvxSwCefAi+jGIDctsO4x2EVaaakENGKWahbgqhMB2j+W+BNYRmrEkbhu4WO/jjkh79gWYCoQ2rR0NH+pnVFw/Y/iPFFbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SzcCxuH9OTc1mkF4O9gvYqf8N24AewHCgzDlMU9p3bI=;
 b=jjDo1uRjS6kzZgoxry/oK9SGLsGkzyfqH0oNiIuI3HBwEI27tl/Xx2SNQLvsyaMZPq3RLBVoVn18aUL27A19rmA+bZy2WymFN/D7wdhoDzmo9AT+QOgrYT7mpncpTnX//3ATHPV+Smlvv+v+eqeqBe0tikg/Moq/VVjvWeX+CbJf9Oqk6FGTRrYti2oaDyr75S12QzgP2UsDXQnfbU9S6Dc7AlUlW+hIfoRPGk9rBqcogEgSGojmHjytfU4nOi7Fqcf1ORXnSz2RopFwv/xGZ2v821dvmiCBh1mAo/MpZQrlaco6Z8HxJJBVqg/lvvgO2CRrc5I2oexDDvpoGCS/Uw==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA0P287MB1770.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 06:35:16 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 06:35:16 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>, Himanshu Bhavani
	<himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly
	<elgin.perumbilly@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, Vladimir
 Zapolskiy <vladimir.zapolskiy@linaro.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 04/15] media: i2c: os05b10: split common and
 mode-specific init registers
Thread-Topic: [PATCH v2 04/15] media: i2c: os05b10: split common and
 mode-specific init registers
Thread-Index: AQHcvE0jvqC2c9ZnxUC3N39jwaGJv7ZXzpgAgAD80pA=
Date: Wed, 1 Jul 2026 06:35:16 +0000
Message-ID:
 <PN3P287MB1829724EEFC602D6A63428E88BF62@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260325114404.95188-1-tarang.raval@siliconsignals.io>
 <20260325114404.95188-5-tarang.raval@siliconsignals.io>
 <akPJvSDdbSo00584@mdjait-mobl>
In-Reply-To: <akPJvSDdbSo00584@mdjait-mobl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MA0P287MB1770:EE_
x-ms-office365-filtering-correlation-id: 365a482e-8586-40b5-4283-08ded73ae9dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|38070700021|4143699003|56012099006|6133799003;
x-microsoft-antispam-message-info:
 ThUZOdE19ZZgVCxnkGVuUqCKoRpz+G6iPPP6NXmjunzhTE9mnGrBD42clHcXdKf5G7YastYVLl8GKUhVwdrdp9y3NWiqQP9XXHmpqFxu0CZYkt/GwFvP2LhkeiV6/g0aq9Ji2CLO3zSvJHgkoF5ObUEvGN5r8WHVcmJr0E+B5VLLiQzZ20+ht6IUJRaZ/pMUIRAZgWzOB5QtTg38Aggk4s35ACspPRmQRjKPGhVkw412k5L3zlcz7Lyox7dZ3DDV43AlwT1OwCuPeRYmjFlAv95+nWd13XMcSXDVMGje/MS+LZKHEdV8E9/ozcX+dtMtwghQnS7So9MJxg+TbwSCt81O1BaiI9ShIlpuIpLnSdbCHSDsOimAuP6RkcOv29Tgq8616Eg0iA2SmPvGkO0EuoGAlysG2milbFI0G34xb0ehppnrwPIvfZAhLUdETeaNY+OBCs6l4UAzJYt++3qMl+RK7uZgnIq+IS9J41fYrJydf1HyjjZqV/aUvdanN21J9w+GOU8OgHj7JOCsZRfT6aSh43abguG15u/DXbaYg4d+gv+b4+GjTm20pxAyvCTADFFfdI+4QvQQpwRQ9d05FZ6OMqDVRbgNbqGSnQupm6In6X+5vmjfGZDZgD44bRu9vkJjLfhQr+DuNpL67b+Khh0O50A3r7FuIhShabihBi7wxPTK2rl3o+nD/DdamKmxvxJXmc0MqC0jfkkR7sdwzQo6iO9WheQloFka+s+0eDw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(38070700021)(4143699003)(56012099006)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?b1/FtP26YwK9+a12GRUHL+0Q0cM3Awt16MBhbi7NlnBXZbIk1vGbk4maln?=
 =?iso-8859-1?Q?zU3CspPSiIcVIcWSNltLbyZlm5gsGu2lu16WZUYBENH7Alfl191z+TNug6?=
 =?iso-8859-1?Q?uRAicfot2ML8rRJZHWjgqiT8i7RpcYpA5k3CuaZSCFPk+tmo9IKA1S8MLO?=
 =?iso-8859-1?Q?E08fOTNVGgjRSpJngRH9diE+KWLhN/DhW9zm7HUzVeAnYOYkV1r8zmxTXr?=
 =?iso-8859-1?Q?InRvte1NGtZjM4P55hipAmTCdObFSD3S+W/Di6chHc0Uyst9Amwe4N32P5?=
 =?iso-8859-1?Q?oG29GrBzIylzQP3FOgazFaRQ5Uy92cPQogPaFZ1YcIxXF6uBPVarvPEJDZ?=
 =?iso-8859-1?Q?Rs98DT18o1/9QEITYUIpdYt53/Abp5+gqCJ+zzEPu+Z04c8CNhFynIJ6Ga?=
 =?iso-8859-1?Q?qS+MNfXsSNTqJem/lf4emDDK174EIPf4YSvFnkMmpUFZF6vbOIzdZCWKHm?=
 =?iso-8859-1?Q?uZ8nyIKKDklWEezbCLgQljER05dsEWVKit4EFKHPVPUkQWbYKXAcQQlvK/?=
 =?iso-8859-1?Q?Y9m30e0fl8AKDqXKfuorsw2wzwatih8bUkC7ag0VKZROIFninlybQeUUac?=
 =?iso-8859-1?Q?bLDLQljsn4ve8nwtQGA652tN27Sj+ZPGpZt6l1rOPMHWPREwpO33PBp7/k?=
 =?iso-8859-1?Q?XOCeEYiXtnohPPlL2eJtTo9/jx1Y9TMmPEGiOpsoGXIVXl1JEin2LcS2Rk?=
 =?iso-8859-1?Q?L26sCDDPU6Hv3xdb5qmF35cypPEhIk851MvgAHAl7QOTWVSTv28gpcRBUq?=
 =?iso-8859-1?Q?3dopGjgOI7BzaP6J6XdceZcEODLMm4fWROoLh06ZGh14PI6MO7mPmvWe3R?=
 =?iso-8859-1?Q?KyrYvyOFiOdJV+2qrPfBI68fPW87KkoMHlk1Call3omDJh+LoR/B77faeC?=
 =?iso-8859-1?Q?T0Kyq9uHIB9is/5nwrzLhVHCXWX5phbzJ7dwq3KOgT/CCzMaKq1Oy/9JPv?=
 =?iso-8859-1?Q?mep30epj5262naK0kU7Me2iFR62RXL1scudiF2BTMeOl8CTeoq/PQvYabS?=
 =?iso-8859-1?Q?g2Fur7rPYESwfTXDA0gGP5C2JqHMXRZgLbr7+ujlmLlOWJ/ABuAgmyFKz8?=
 =?iso-8859-1?Q?yuz1ElyEfg88sC/akYl+6Av++g8ZN1xqWFYsEXqIb38o+u+ppvPFygtJvr?=
 =?iso-8859-1?Q?fO16EWYJ5aw4NE65axdeU35YTELiVLgPcVnVOQHi2rmHe4RDr4d3/vhzkd?=
 =?iso-8859-1?Q?6Utq+SJb3UKHzmHAC7f9i5qDEFJJLFNsVOYcqVErv3qpzQotVdmupRYtbX?=
 =?iso-8859-1?Q?8+eSQHT/o8H4Iso9lNaT5C9smxTIr6E4I4rXrQLc4TbRBJL+O/F/dC2TzC?=
 =?iso-8859-1?Q?SLvBAITLWm+ktGnV15/I4d1ewvzDCNkU/t/XoBnauihAyQYJDQy3O6gTeS?=
 =?iso-8859-1?Q?/vkRU6I0ONYcq8mj7+bqalRk0DF4nLkrRi9nergUqUJZ9YeJPZ+e1AmPRJ?=
 =?iso-8859-1?Q?TWx+yyM5l/6oWRcaupgGzQtpT+gEl0tobAXRfpe5OoOicoWDFsa5OBECBg?=
 =?iso-8859-1?Q?VY4RcyLiVnR+VoBKk5HdQAXCiG2Qy6Tcg8dd9Mj0zPTjQkzic1HWfdh2DM?=
 =?iso-8859-1?Q?C2u3GaIt2BmrGvO5gP0969+lfr4l3X5+y00rdibD/BpDTb3MZWpQJ6YRVd?=
 =?iso-8859-1?Q?WbsKAyc+/JhObKSQeIgt//KlyfGipW36lMvjSc7qslxlat+nFVoGaypBCF?=
 =?iso-8859-1?Q?0LbHhLB9xWSFDHfzDnjN9CvhFq+l59LeTwP2uq/ZywgY1h1FWIvsPi84sH?=
 =?iso-8859-1?Q?AXto9lMcTnvHJ74Xo+6S16cFEBbmZBXJBZ7/gNX0sr4ytMqs7RsDNZ38Bl?=
 =?iso-8859-1?Q?ERqhwsG8+g=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 365a482e-8586-40b5-4283-08ded73ae9dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2026 06:35:16.4220
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xrhMzwnpT53uPRYqcY+8IBWsYe4+i+/FgLg7LUZiXXN4ypqmaBu68B4IUhtn0A5xQhwpcHDe62JSy2BngzyB8lj0JVCAkbpebTp0gDVeKrM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1770
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[siliconsignals.io : SPF not aligned (relaxed),quarantine];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[siliconsignals.io:~];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66156-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mehdi.djait@linux.intel.com,m:sakari.ailus@linux.intel.com,m:himanshu.bhavani@siliconsignals.io,m:elgin.perumbilly@siliconsignals.io,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:vladimir.zapolskiy@linaro.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	R_DKIM_PERMFAIL(0.00)[siliconsignals.io:s=selector1];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,siliconsignals.io:from_mime,siliconsignals.io:email,vger.kernel.org:from_smtp,PN3P287MB1829.INDP287.PROD.OUTLOOK.COM:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 35DEC6EA448

Hi Mehdi,=0A=
=0A=
> On Wed, Mar 25, 2026 at 05:13:50PM +0530, Tarang Raval wrote:=0A=
> > Separate common initialization registers from mode-specific settings.=
=0A=
> > Move resolution-dependent registers into a per-mode register list and=
=0A=
> > program them during stream enable.=0A=
> >=0A=
> > Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
> > ---=0A=
> >  drivers/media/i2c/os05b10.c | 118 ++++++++++++++++++++++--------------=
=0A=
> >  1 file changed, 74 insertions(+), 44 deletions(-)=0A=
> >=0A=
> > diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c=
=0A=
> > index 751494fdba6d..9499867ad40e 100644=0A=
> > --- a/drivers/media/i2c/os05b10.c=0A=
> > +++ b/drivers/media/i2c/os05b10.c=0A=
> > @@ -122,37 +122,34 @@ static const char * const os05b10_supply_name[] =
=3D {=0A=
> >  };=0A=
> >=0A=
> >  static const struct cci_reg_sequence os05b10_common_regs[] =3D {=0A=
> > -     { OS05B10_REG_PLL_CTRL_01, 0x44 },=0A=
> > -     { OS05B10_REG_PLL_CTRL_03, 0x02 },=0A=
> > -     { OS05B10_REG_PLL_CTRL_05, 0x32 },=0A=
> > -     { OS05B10_REG_PLL_CTRL_06, 0x00 },=0A=
> > -     { OS05B10_REG_PLL_CTRL_25, 0x3b },=0A=
> > +     { OS05B10_REG_PLL_CTRL_01,              0x44 },=0A=
> > +     { OS05B10_REG_PLL_CTRL_03,              0x02 },=0A=
> > +     { OS05B10_REG_PLL_CTRL_05,              0x32 },=0A=
> > +     { OS05B10_REG_PLL_CTRL_06,              0x00 },=0A=
> > +     { OS05B10_REG_PLL_CTRL_25,              0x3b },=0A=
> > +     { OS05B10_REG_MIPI_SC_CTRL,             0x72 },=0A=
> > +     { OS05B10_REG_MIPI_SC_CTRL_1,           0x01 },=0A=
> > +     { OS05B10_REG_DIGITAL_GAIN,             0x0400 },=0A=
> > +     { OS05B10_REG_ANALOG_GAIN_SHORT,        0x0080 },=0A=
> > +     { OS05B10_REG_DIGITAL_GAIN_SHORT,       0x0400 },=0A=
> > +     { OS05B10_REG_EXPOSURE_SHORT,           0x000020 },=0A=
>=0A=
> The changes above seem to be more cosmetic and are not part of this=0A=
> patch. the register values are also tab aligned not like the others=0A=
> below=0A=
=0A=
I was just trying to group the known and unknown registers to improve=0A=
readability. If you don't think that belongs in this patch, I will limit=0A=
the changes to only what's required for the functional change.=0A=
=0A=
Best Regards,=0A=
Tarang=0A=
=0A=
> >       { CCI_REG8(0x3002), 0x21 },=0A=
> > -     { OS05B10_REG_MIPI_SC_CTRL, 0x72 },=0A=
> >       { CCI_REG8(0x301e), 0xb4 },=0A=
> >       { CCI_REG8(0x301f), 0xd0 },=0A=
> >       { CCI_REG8(0x3021), 0x03 },=0A=
> > -     { OS05B10_REG_MIPI_SC_CTRL_1, 0x01 },=0A=
> >       { CCI_REG8(0x3107), 0xa1 },=0A=
> >       { CCI_REG8(0x3108), 0x7d },=0A=
> >       { CCI_REG8(0x3109), 0xfc },=0A=
> >       { CCI_REG8(0x3503), 0x88 },=0A=
> > -     { OS05B10_REG_DIGITAL_GAIN, 0x0400 },=0A=
> > -     { OS05B10_REG_ANALOG_GAIN_SHORT, 0x0080 },=0A=
> > -     { OS05B10_REG_DIGITAL_GAIN_SHORT, 0x0400 },=0A=
> > -     { OS05B10_REG_EXPOSURE_SHORT, 0x000020 },=0A=
> >       { CCI_REG8(0x3600), 0x4d },=0A=
> >       { CCI_REG8(0x3601), 0x08 },=0A=
> > -     { CCI_REG8(0x3610), 0x87 },=0A=
> >       { CCI_REG8(0x3611), 0x24 },=0A=
> >       { CCI_REG8(0x3614), 0x4c },=0A=
> > -     { CCI_REG8(0x3620), 0x0c },=0A=
> >       { CCI_REG8(0x3632), 0x80 },=0A=
> >       { CCI_REG8(0x3633), 0x00 },=0A=
>=0A=
> --=0A=
> Kind Regards=0A=
> Mehdi Djait=

