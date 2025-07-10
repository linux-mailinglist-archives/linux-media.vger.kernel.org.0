Return-Path: <linux-media+bounces-37280-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C7FB00042
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 13:13:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BB7517E6CF
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 11:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 009C22DBF45;
	Thu, 10 Jul 2025 11:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="LVnWwhBP"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010050.outbound.protection.outlook.com [52.101.228.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B74288C22;
	Thu, 10 Jul 2025 11:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752146014; cv=fail; b=sDtQlWw99IAil64Rf3VHUrbWpM2SGo3jHYgSwfX69sMeKhr3geln6gxSeEIFrlYn3WYQq8RGyNqcTQU1vi0c103lALP/TjS9cjgKZP6d+//2paVjlIRNPJnJ5SRUHSrDanrAbsuT4+gS43wte7aeU27yzm91FhgZqQMkva9RK4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752146014; c=relaxed/simple;
	bh=UgW4TdGLCisQmYYovt21Rl+mQ1M+ANtWyI/u+f96QIM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=X4h94fqd16IdMzwD1lAjjHJAhn5TtppXwqsHrwVNE1jNhmoNP9NXC+a3COAr2J6JvL5yDOjIOqXIwA0uF1AULdI0ZOjd5pHJ5KXVGv8tn8UDSPwHWtxXN7ke4CrBwiw5iNevWqAHm6U0U78szQ9eWnkVaYJAxag9/Bx1yA2IGZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=LVnWwhBP; arc=fail smtp.client-ip=52.101.228.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZaUUhV8Yzrxg1ae1nicRXSZkRMyNkEl1OvoAlewFF8RtyeULaKLCWzxURjvO74H9km6x+FcabrCDkI1ppJjhLYIU+JMQP9CcVsL5ljbHmfYF+/8gyDVTSqJD5uBT+VZHEHNlCqUBX0/8nc2z5dbUpZcGeAUkXy00Hj8kaR3xsdYkF7eJ+byfA4RFdJyK6hVwpxbVuMm6TLArVRKg+yK6FnacC4l534dVXR9+1bRyWYaV6+qIhXiklyS7rGyFM0nuTsLOz6Qt97Vw6d/d5+mUYf45MdtcFq9lEvpfMFOAwyzPyWDcggVnCkOMMehb2nS+8rplqpCugdfkx0mjRGmsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d8wTxgwLvTZFZXKjNJww9H80nqXVT2r5rYPpo68Spug=;
 b=m0UdYuPQYSRTOxW6AsQvnn7elUC6M+2TdMEuhSfVfNPxTWFQ+IiPY8RLkPQ4VGqrQRjkVDVSwnXOVDwaSuWjpoXAKY+MFJApIMY/AJzt0/Ze40v8k13ULcovTMKAwpztDVQovp3q531lKYOT7y/pGaZBFr+fXk6kt6LxVCcUGVyEC+AG6A6L4Hd9L/GEzS8bevPFNEbt41NoRfRsSrjJoJVu5+X0Q8/UUZ+2kH1b8lcnnTsbtUh0VJm014CLFEc2B5SKeAztR3nn3IOX6zAIgYNJfT/Mc5WMU0355HvBq0XSz08UZE2GPhet6cmO32/FwNnIpTntx5lVlsHir5qfRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d8wTxgwLvTZFZXKjNJww9H80nqXVT2r5rYPpo68Spug=;
 b=LVnWwhBPe60SwR6CoAaj2johrQXYxLKfJqpbUOH3t7rq2+tj8zI+9kb2NW+06NS2WonSjD+eC9qmKD3i6AsgZ/214TtvTOygSBYUE8TYtbeVOO7snrQ53yXJspvHsNZtT+9Y+7v9aLWlHFtBAbGZkUVcqZCP81UP6UqHe9Baz+Y=
Received: from TY3PR01MB12089.jpnprd01.prod.outlook.com (2603:1096:400:3cf::5)
 by TY4PR01MB15503.jpnprd01.prod.outlook.com (2603:1096:405:270::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Thu, 10 Jul
 2025 11:13:29 +0000
Received: from TY3PR01MB12089.jpnprd01.prod.outlook.com
 ([fe80::2ac2:8829:306b:5772]) by TY3PR01MB12089.jpnprd01.prod.outlook.com
 ([fe80::2ac2:8829:306b:5772%6]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 11:13:29 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	=?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Kieran Bingham
	<kieran.bingham+renesas@ideasonboard.com>, Jacopo Mondi <jacopo@jmondi.org>,
	laurent.pinchart <laurent.pinchart@ideasonboard.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/5] media: renesas: rcar_drif: Convert to
 DEFINE_SIMPLE_DEV_PM_OPS()
Thread-Topic: [PATCH 1/5] media: renesas: rcar_drif: Convert to
 DEFINE_SIMPLE_DEV_PM_OPS()
Thread-Index: AQHb8QX6DoVtuA1tUU+FEXme6nT8CrQrNTlg
Date: Thu, 10 Jul 2025 11:13:28 +0000
Message-ID:
 <TY3PR01MB120897F1CED61F7853B487D73C248A@TY3PR01MB12089.jpnprd01.prod.outlook.com>
References: <cover.1752088108.git.geert+renesas@glider.be>
 <ad032c66fc32dddf3a5590a5939792c1139a554c.1752088108.git.geert+renesas@glider.be>
In-Reply-To:
 <ad032c66fc32dddf3a5590a5939792c1139a554c.1752088108.git.geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB12089:EE_|TY4PR01MB15503:EE_
x-ms-office365-filtering-correlation-id: d1392226-7b3e-48af-fc55-08ddbfa2cc4d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?e7i81XEBTm2OhPgMJh9veVBYleaTY1vY5oN7beoGESIHRY5D7+1G65tUrE?=
 =?iso-8859-1?Q?DktcHdWPVYaOZ0uR7cMmQ4o34HjS4DPW2G1i/3exKl06sPivQZ19QZOZSH?=
 =?iso-8859-1?Q?2lgx1Yy8YpFC60i8QG5udveUIIoBDhPYyAOSFk3w1caYoGDLD156hjtGnQ?=
 =?iso-8859-1?Q?u9ETXOdS61H1yLmZDY6C5n9xUMEM+EIZsvsCMNWX6tYyZt0K76AaDuhTc1?=
 =?iso-8859-1?Q?mTkmkAW3rA+abY0ZQqpcSYTuwbxfqv5df4pujHHDbHV1YzA5YqQcOPEZMo?=
 =?iso-8859-1?Q?oRDkQiZol3lNlnqC3X2KJBbQVSuAR4xNoHABkZE0KEvbe7TLp3/5yOAbwb?=
 =?iso-8859-1?Q?zTIA3RGqkql7In9+KwRSLGGw/4Lx71+Iq+B5tkJ3gdNsIvGEuab1MiZvT9?=
 =?iso-8859-1?Q?dcambqNUxEOssmXff1/Fkc7sQewSJP1UD+H2SJP6vC9gSUg2l5r1lJN91g?=
 =?iso-8859-1?Q?ArY9mnfTbtcJHYw9qx0H3nf7GDCM0A4cjskxUyj4cpLX1wL4nE3gzIOUE6?=
 =?iso-8859-1?Q?zJzM2XiL5JkIIZS+OPWfCseRfUSfnjYMrwhixvxKW2UTLkEqQKoTZ8Mz6Q?=
 =?iso-8859-1?Q?ZcJcl02ZL99cFp81VdFsL4HVqT/yzFyai9VmgY6MBPTPMQYzkrxx218YAl?=
 =?iso-8859-1?Q?1lh1+qCY3MPG8GhDSDBWvA5KZRFX/st2s/RAf1vimtwipgB2/k8pR/Brb+?=
 =?iso-8859-1?Q?K1hJp5W/rh4PGR7gpI2E7lOPOYJHdgSVyQz6JUHfh6TcActApcZMp7G1Lx?=
 =?iso-8859-1?Q?HJWUZDb7Sy98LvkZoqkBcQH5PxB9L0on0x5bXFfu6Pa7EC2NHBQJR6rxBw?=
 =?iso-8859-1?Q?fszx5GkN1aMUtT3wOmvPPMYMYGSC/ULs7IFk42/7/hQbA7kPuZgTLnlAzZ?=
 =?iso-8859-1?Q?CEBVdbDYv8+Yrh293tlsrxaU7FpUlj46Nyx7Zdh2s9OvLhc2ivG48y/pCO?=
 =?iso-8859-1?Q?i9EvMHBTn03hd8LW5QKGUcE/rotEnEWLvCKHwhxW5PCfVIPerSVlU6wsZQ?=
 =?iso-8859-1?Q?6fOQ0CNcV1SlmWEfhADSrSA/EY7gblMjOtCN1OPMFoHkCbVk9mb/Vo5Miq?=
 =?iso-8859-1?Q?R7isFJaySBYQnWdi+x50jNVRr97ENV+ns4UDSetqmWSW4ICwdXy9muWnqt?=
 =?iso-8859-1?Q?8bJW84M8O9/usqELQerSnQrKvtNMX3Eewz/8W58msIasmzDvnkEICaE4xD?=
 =?iso-8859-1?Q?QAAEKIW1eRIdSkwt5ofReenOHuvYMq2M7etxtcqy2d3KTZfnzK/eZHcIVl?=
 =?iso-8859-1?Q?jAkbassxJMZa+z569eu6RmWGdH8s4bJiqcvhtQKxLQ1WsVTF9X5szoHOq+?=
 =?iso-8859-1?Q?AgQksgj5g1mBxzN9aczxGMjdlw8NybNBdePRImI0El+zMbxglRRcuEJHJu?=
 =?iso-8859-1?Q?5kz02WNigFacICQYrE8maTXYRJK1VVLmrPm+oVoLQZq2dSXHUbtoMt/Uvb?=
 =?iso-8859-1?Q?q6PXqceRlx6kWgol1oj8nMEz5At1pq6GsYOssCgfrIaeeMCNrQpisu+53l?=
 =?iso-8859-1?Q?eY5o4GAvd14xo4S7bFQwJsiCploWfoyzr/ClXJdC2ISVuEk8XvNzs8DjbX?=
 =?iso-8859-1?Q?fgU3N/Y=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB12089.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?G2uG3rsR6WU0wbViQg47gBb6ypwG5wZaorWfWDCBVrmwQ3x8riKWJzm+Or?=
 =?iso-8859-1?Q?uidDP3Ur+4Zo2aab/Q/yWUCJ9pi/W7LCPNyUSMMxbMbBz77dDkD9jf0Tos?=
 =?iso-8859-1?Q?6dqEJooeR2KWXcLK3nStFHYJhl4JrFlzSLzj7JDYthd38Lf+npG8Sjihyu?=
 =?iso-8859-1?Q?H0pfEhXhgrtPM/Y0lY5qazkrG1SvQ3l5/99vEg8ntLcGBi66FXKtkp69vg?=
 =?iso-8859-1?Q?6ipABRvGRay2vWwdL7kkrEeoaDe+OMnKi2hU7oSMYVNE882MZtGZWSjRup?=
 =?iso-8859-1?Q?4UPfsT5tkS10n001C+2tSxIcJYQpYcdfwfU//N8Ou7Nonpmiz8VnbtEZfV?=
 =?iso-8859-1?Q?t/x2owS9sdhEBx5JGoYtDZH0TjVwflPfvB7m1q2b1vrgQ79brHrc604bFA?=
 =?iso-8859-1?Q?V7HGPFVnXF6mLuKzqLiAC3Y7+U3dj97VQsAmKE/ytk3xkbnho39X0XymH5?=
 =?iso-8859-1?Q?54akbbgcZlSaCfKeSyDIjaIetRFIEA5sdAAPS93anYyCe9Jx+gD/NDnsiP?=
 =?iso-8859-1?Q?++BJOnF/631Sq7QRy7OlGan0CcA7F5DzSGrvOQ+5h0t3VoDwFWvz5W9J5R?=
 =?iso-8859-1?Q?619DWIIoja879InAhf98ZmJpA4HRiuEwXpadf5crpVt3L21ZbOvu3DsI6Q?=
 =?iso-8859-1?Q?sIZqMGbGdR4n9i7OAQXzHXTXtsH2DsMAbyOPaCZItLYBU/XIdGJSoY4YEv?=
 =?iso-8859-1?Q?f21qJLwgBMU61gC+50iGH3s9FlCy2HjgLEd1jpYMNhZtfOKDj6J7EvoYwC?=
 =?iso-8859-1?Q?BFe7si/rJmQs2FKY+iXI3izGY158rDLTNkZ1FNTEroEz87qmoMo4PjDIiZ?=
 =?iso-8859-1?Q?N0ewXAkNN2RxC79bdkoEtUeZeCiTiShwhSfeeRqoZVZvA+28o7zQMmejru?=
 =?iso-8859-1?Q?RAuGEiCwjq93Vs3o1N5v4Ta8qEzfW26GJXxug/ITVJGa741Uy27B5jbzPL?=
 =?iso-8859-1?Q?Un1oPjXsbqKUD6woCm2OzqyQEbrm8Gzl4jXxxFvkOdzcwbbcSapkjRUFcP?=
 =?iso-8859-1?Q?Af98cg6B/TS645LtwUKhaou3P7egGTSojTLnhN8vUwbCLzO/gtbgrnemRX?=
 =?iso-8859-1?Q?sFA4SmT77a3AnRE55P3ov2IG3z2uXqOeylgSNGVac7Afl2g0Od+mPu1ri7?=
 =?iso-8859-1?Q?qYQ/+Kwz3sqyQGSLFMEJ024S/QkdtSZ/cqoW8rcaDXLuKS0vVRUajbpEeP?=
 =?iso-8859-1?Q?YeEFVlKevz19hFcJFQ5OeL4j4tVaB7PZ+QqZiyV2tuYW+dhV4RjlEUdSIV?=
 =?iso-8859-1?Q?zU9R72MpP9JtVqspPOnWpjEwmdctR0Fuf0+4WyQyDBG7pKs9YNsQEHf9Wg?=
 =?iso-8859-1?Q?yoCqPR0AGTNF28osm5boxEsCV/kx1024fDWBSsn/UWiiZby8nVY7yVUBR7?=
 =?iso-8859-1?Q?RQrpJwpSpYzSvS3LpZOC07D7kAqFDD/iQEJ1QUmmSJJ269dKhMhasrt7wO?=
 =?iso-8859-1?Q?9Px+T5j+ls6GQm9qsmfjTkkjrrCgM6KeHFai6j5fyZAOzK8mYOhprJDssw?=
 =?iso-8859-1?Q?BrljBNNIlxxX2w/hcmuQoLq5CzqfMrqV3mtSriUTfZELP88m78Qsi9Tc6p?=
 =?iso-8859-1?Q?DR6HZbraxisG/mC7U3SxStmgO8gRiVDTrWfUuWAMQImb0ADYj+Zfok9QQz?=
 =?iso-8859-1?Q?pecUsTSrlzYh7hGdMrcSibssPi61ghMM5DANr96/OtanSyoiqKBz36zw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB12089.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1392226-7b3e-48af-fc55-08ddbfa2cc4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2025 11:13:28.9626
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /7cKXZc6dfBbS9hAVMbKLs+r+EAHewnTj5NwpjDU6C8wbP/heKhnt2+4HvC6UxocnhAh7Ve3kv6GL56HfR3UJ/P2r4mk9PnhJ8b/KR+fTbg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15503

> From: Geert Uytterhoeven <geert+renesas@glider.be>
> Sent: 09 July 2025 20:16
> To: Niklas S=F6derlund <niklas.soderlund@ragnatech.se>; Mauro Carvalho Ch=
ehab <mchehab@kernel.org>;
> Fabrizio Castro <fabrizio.castro.jz@renesas.com>; Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com>; Jacopo Mondi <jacopo@jmondi.or=
g>; laurent.pinchart
> <laurent.pinchart@ideasonboard.com>
> Cc: linux-media@vger.kernel.org; linux-renesas-soc@vger.kernel.org; Geert=
 Uytterhoeven
> <geert+renesas@glider.be>
> Subject: [PATCH 1/5] media: renesas: rcar_drif: Convert to DEFINE_SIMPLE_=
DEV_PM_OPS()
>=20
> Convert the Renesas Digital Radio Interface driver from
> SIMPLE_DEV_PM_OPS() to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr().
> This lets us drop the __maybe_unused annotations from its suspend and
> resume callbacks, and reduces kernel size in case CONFIG_PM or
> CONFIG_PM_SLEEP is disabled.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

> ---
>  drivers/media/platform/renesas/rcar_drif.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/media/platform/renesas/rcar_drif.c b/drivers/media/p=
latform/renesas/rcar_drif.c
> index fc8b6bbef793c64e..0f0c5844e22ea86c 100644
> --- a/drivers/media/platform/renesas/rcar_drif.c
> +++ b/drivers/media/platform/renesas/rcar_drif.c
> @@ -1446,18 +1446,18 @@ static void rcar_drif_remove(struct platform_devi=
ce *pdev)
>  }
>=20
>  /* FIXME: Implement suspend/resume support */
> -static int __maybe_unused rcar_drif_suspend(struct device *dev)
> +static int rcar_drif_suspend(struct device *dev)
>  {
>  	return 0;
>  }
>=20
> -static int __maybe_unused rcar_drif_resume(struct device *dev)
> +static int rcar_drif_resume(struct device *dev)
>  {
>  	return 0;
>  }
>=20
> -static SIMPLE_DEV_PM_OPS(rcar_drif_pm_ops, rcar_drif_suspend,
> -			 rcar_drif_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(rcar_drif_pm_ops, rcar_drif_suspend,
> +				rcar_drif_resume);
>=20
>  static const struct of_device_id rcar_drif_of_table[] =3D {
>  	{ .compatible =3D "renesas,rcar-gen3-drif" },
> @@ -1470,7 +1470,7 @@ static struct platform_driver rcar_drif_driver =3D =
{
>  	.driver =3D {
>  		.name =3D RCAR_DRIF_DRV_NAME,
>  		.of_match_table =3D rcar_drif_of_table,
> -		.pm =3D &rcar_drif_pm_ops,
> +		.pm =3D pm_sleep_ptr(&rcar_drif_pm_ops),
>  		},
>  	.probe =3D rcar_drif_probe,
>  	.remove =3D rcar_drif_remove,
> --
> 2.43.0
>=20


