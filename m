Return-Path: <linux-media+bounces-59644-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAYTHZos72mb8wAAu9opvQ
	(envelope-from <linux-media+bounces-59644-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 11:30:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E748E46FEEF
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 11:30:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A9D2C305388A
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 09:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 130EF3B2FD2;
	Mon, 27 Apr 2026 09:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="jwigWQ/a"
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020121.outbound.protection.outlook.com [52.101.225.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7043B27CC;
	Mon, 27 Apr 2026 09:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777281884; cv=fail; b=n8JVDqPMBo15jzEjtCIlufltCLdJkI9ymEp+egKm54Fc2uWlcLjEB0CvEQog8OtLvyu96lb0cJyv/s6L+1ObS9fdwFPDoigrek7bGAAd1wz65od1PKVTGRqadKeoqX4odltNhLkSuTlN5ia3kxApHVxOpSxi62LQmrwo45rTaTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777281884; c=relaxed/simple;
	bh=NLqpfPa42WlQkiTqKKMu2tGPZw1IJyRVDxliM3yqFds=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gDqlai5hEbs0ij9jzH3QYCd34l5ecVSDRkO4z0RPModwl97Dx3PrnGj4ksBnMtzuISLKdakmk0rRYGGEXY1jeOjxf07Hzjf9hX8WhgZ5N177Gm5toKi1YpeI4Klbo5h3GNbMdBaowuHps9iGYCiFV7cnfnaRCrNvcrTqAiRvvYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=jwigWQ/a; arc=fail smtp.client-ip=52.101.225.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZsjHbjBXKSULPKhDVxezMXwiSc/AcLGYO50I2RQhlBhYbuO7C57UNe+OSQm3Cup5YeZ5F1NKKVDqq76lKTgROp3fqqeEx4fyiXc4u2129DLXmCoQUP1JXBK/QpasyIzZCFcncrx6MwR2v4a6o48S0WUH3Bp9Z17IkJb+YtLfF0VCR1pGbG/56LHHOiGTocfudEvLkN44GnsgjafieW19YDTjw3Qj9blL6Th3+kXGzxpgMpSk1MZBh2Ze/BBTZ9QqsnfA+0qQuzj9Gg3vdPuDRdzdf4F0uRWJttX+9/fb49kXl6tNzRjJuyWrVAebIwX7IX7dA+V3tlTaEt8COOHOvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLqpfPa42WlQkiTqKKMu2tGPZw1IJyRVDxliM3yqFds=;
 b=bvPqK9/RbOuSL6Q6bSQFWmdSTMsXzo3oZ3mTA4OVtGhVrWj9MV+8R+w3PkQ9z7OdVsVFLVsgfzJG70OZeIh3vMyUhIp/b4YLBhbnSMym5IRU092xwvgWw/g6YD+V3poPnRifgAwFoDAX+acGEu/P50M9evnBk1Lrh6Ey2Yf/gOcVQotcCEq7beSCsSp4Zye0HUIeNnKeb/EmGwr1fm+EUsvCNp3dQtFLt6sNqKbQYjqxP4w41EjZ9KY2Fnr3E/muNdjl/c+FpINOUPvR9MBVT+AWpDKNxMMPx11szWfGlD44qkdunw8Uc0dB8f8YuvVedfYuPNUgg6WWMbG774SkoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLqpfPa42WlQkiTqKKMu2tGPZw1IJyRVDxliM3yqFds=;
 b=jwigWQ/aBvwbhjUw/avU7E9H3wC87Ha6ORFdsqhVBFwIUJzocefliKA58gnlJDDy6Ii/zDJjDFoY7hBx+hJYUck8+2Kz4n5Kj69UoT+8A+S5Cwk6IXluGdH8mP42elZWyDkh3uCehj8sEQwdzY7SVNGaUQEpNbRfsO365oCpmLRK00eV5j/BR67v31d24MKlksBFxr29Zn/jNws34QIFEnQRIeiQsSaWDbKoW95CEfByu/2PAIRJeykxthpdskK02KQGDoZMHqZHz9gf33Q7/UlqOqNG+4+PidNwVknhS27KAwJjbwY3e2BGs2VgbjLbRT00zpPfjilg2ExC4usYKw==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN3P287MB1103.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:179::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 09:24:38 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 09:24:38 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly
	<elgin.perumbilly@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 00/15] media: i2c: os05b10: Refactor driver and Add new
 features
Thread-Topic: [PATCH v2 00/15] media: i2c: os05b10: Refactor driver and Add
 new features
Thread-Index: AQHcvE0RwA1nT6Y23Eqs8Q7SF1wgrLXy1fCY
Date: Mon, 27 Apr 2026 09:24:38 +0000
Message-ID:
 <PN3P287MB18293C332106D4A13EAC07668B362@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260325114404.95188-1-tarang.raval@siliconsignals.io>
In-Reply-To: <20260325114404.95188-1-tarang.raval@siliconsignals.io>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN3P287MB1103:EE_
x-ms-office365-filtering-correlation-id: 91392935-95af-453d-e73f-08dea43ece28
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 2kUVEeDEpnKpE3kwqVGBa/auvUmZ7pyrOxdBrDw33bc99MtIb1FVfMDBySJq3crYVPOYXOnyYJVJvI/+dHzjCu4OyuSERT5co3AOLHClhHNPaDdmiFuu3ggsWCSUTdAtqiXrN5MuLkbHAkVwrOKtPEZ+OkHJWnZl0YRxPv12Lo8KxuzbkAwua/al/McAAb8uwGQrwThLLZn66rAcXHbIOler1vmK26Rdg//Whf2ijRPS5K9l+q0waMA5kE/tnFBCJXt3bk1RGA+uy4F85UlCXaC/DHdExy5Qn7N+owR/oNr5PKIJH+gUHgKiubbfYAsb0KK+eODSBy5mWqZar8Zp9tv9e4jdhPhfBOB2EmGCdwAhyQKfVn17JqPmpxQsFwNcyE2DljbD6rLFWjFNna4vmBIDgj0kyoTHoQ/b9jEvkdOsKeXNcLQ/W3WrfdKCFYY7QjUGguucfJ7SziwCJCNMYSbfX7LtCpA5GqEg5i26Db6IByKYNeZcnvKVMv5fCUT9ucvdh3ApAImmLpx2sS2dI/0VMawt2kzZs7tG7+jaoPKr3QWRZSfbhnlZKWMUp/oX39DBst5XEaucBH7qAVX1xSMmf2cTh+D21o+pULaUBbnji0Xd38qZ6ODC0T4p54tPqZPfpW3PgChPWQ487sqlyNAWGF2BVQhcUjL4NZBGpWdofKXIByNf0Y50/YDPnNcky2CwZr5+fb8O1WiTJiDBBHNbhJIpJXdF+l824RED09hycY6lktUrLZf8OCa2hv1chGxGUJ6zcpg+X244bY8+e1frrW6GzKWI39i9UvDTS1o=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?s9Kge4lgcg204DOF9xSuiorQzy80IKwGz5PR5AjkrAB6CY1qBDbIa1FQ?=
 =?Windows-1252?Q?LV6zzdDn6mAf3YJ5M/6/74jpLwmIqdKdGFmeGMA+p76bQZFXkETj7wN0?=
 =?Windows-1252?Q?OIVfkv6urp30hqoxkon4Kc4n0GZ6wzbTCRY+eFklgT4mt9Kmo0SLQIF8?=
 =?Windows-1252?Q?0F4IQQ39l/a73kSDDxyhTCM3niXiEJ6bZQafAZNdoLWPCYtA9xtzKNYM?=
 =?Windows-1252?Q?+5tOOoPUYUpETMX1ffl0cU5v1RLsKilcbEMagSo7PpfgPzXcpvgeB/K4?=
 =?Windows-1252?Q?La3XeudshNF25pSIDl5YOCBgUMa+OuqDBNelePbi5jrTHCo6oMkW/LLv?=
 =?Windows-1252?Q?vBLEacacFUUd3Fy59Y9nDc9N4k/9TWcaOa3JPzYaYJCDeTcUgJElicS8?=
 =?Windows-1252?Q?FHxT/YGa//54pJZkVOxjXePmVFIOkuX6xlKvJ4plbNKcqhWGKBpBd1sx?=
 =?Windows-1252?Q?B0E3jWZoiW10aypYw70XUPrT4fHR28wmrOaXF5VomNQ4/KX302PDPMFk?=
 =?Windows-1252?Q?+l+38REGA26pS4ALzr81M/6m5WxJav0Gbxab3fz8OIhIsmtHnt/0bcfW?=
 =?Windows-1252?Q?nNDKmsdS61ptGiAZr48qkopoi5/DVDd4w2SWfQtPp2BnsP/d0uMrwOPL?=
 =?Windows-1252?Q?E7/HJBNKEfj45kT4PKjHZnoERxk4qaDvQhoqXyC2/0QOqzUE8TRiek/2?=
 =?Windows-1252?Q?PQsQNp72CLdWj0cGS3FDzLZX5ahUceS4rQLihzneP0WxzylspGsCOlcW?=
 =?Windows-1252?Q?K8JC0eyMG2WpPlfGXFtI1ccgI1kwtH3PHViT6Udz+0+ZxYhZdynya+dL?=
 =?Windows-1252?Q?9UknvB7zApVAvvXgXiqjPG0/nf9RLtBvxgiMqE6RK05/h6vDdqnwB4G8?=
 =?Windows-1252?Q?qE17ZJ0AXuFiXaZ/P5g1dX3ZKJywogl5M1+ixwnA2qZ3ty1wx6kQMzgW?=
 =?Windows-1252?Q?pfak1AIQmFkO18IgHtv9PodtAXwDtAZabRU7PIN6JzM2d5gq3Tu6M1SR?=
 =?Windows-1252?Q?lqbYaxeXj39p26FunS9FtYtrPn2PTDqmo8jyEOqDxMBZeYwINppnwtbe?=
 =?Windows-1252?Q?YNADfl+5G7bgVTbPROPIoaIXO3IhUo/GJqvVTHO5/URgd12S4XUxAVi2?=
 =?Windows-1252?Q?X4Fu0vY5LgZEHtGoh3RbsYTVp9tykbyNDUoIS0w4v1fR0Y7euvx7N2s7?=
 =?Windows-1252?Q?3UmmVFwZxzE+35fEQTjBnnxtwG+yBLKaq88DwX6OjLquub0HY1uRJVjt?=
 =?Windows-1252?Q?t6hKTCzglWvGXOaM/Kw8wpWoxRwBsJkmvyx2wHK9Y0Omev0xqzzxMpBU?=
 =?Windows-1252?Q?T1TtvpB/DjnnX3vPNSNRsl/pKgS/N69POKrq2Ym4WmD1a+/UkyxlyD8C?=
 =?Windows-1252?Q?oFuJozQQjZmgosjXLk4TSv/v5pANgfwSIJQv9DuEMnutfcfRkq/BnEkr?=
 =?Windows-1252?Q?nrCGhPs+Kn4zEbmFzMs8XdGlUhfsZkFHLgLYjm3TvC+1urbTXeYDe8Ra?=
 =?Windows-1252?Q?zq3Ga4E+imxEa+omIP2ZiQ/gK7u1FFPyX5nIMs8E27aqUc6YkD3k1OXr?=
 =?Windows-1252?Q?5ob/cNBLE2WIcbd+bKr7xInNHqJ42KE+yA4q4oWrFaqsNxAmMY6Mg9OH?=
 =?Windows-1252?Q?kKyloZjKh//OEq/IIBWi+vedfyBjChjiS1goNDduWfCm2R9g6mShsCfK?=
 =?Windows-1252?Q?0xZ3wjsIrsGk2uqMm19aa5bbl3mgFpvm6GWuCbfUpu0/bU3qdwRbBxDr?=
 =?Windows-1252?Q?jdzWyDFK81hAcvOhyaDp9RTdaFVF6kPfBO9PPCwIaYWdDTrgjo6ppZ7i?=
 =?Windows-1252?Q?sUMvrCzRR3k5MywB0sYOBYJnesegMNBOQgOpm4kYuK/mBlJlRZJYFBow?=
 =?Windows-1252?Q?Y+OGfx9Q54YRHQ=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 91392935-95af-453d-e73f-08dea43ece28
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2026 09:24:38.6632
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MF+rFH7399aInxz5x6fXFetBYfGiHjCO5cC+TJcfH+aCIufgk4GItMDSNHSweuVqVzo26S6WofPa6zBuKHnMd4qhJkvZTEnsGiKUrmrTBAY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1103
X-Rspamd-Queue-Id: E748E46FEEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59644-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Hi Sakari,=0A=
=0A=
> This series improves the OS05B10 sensor driver with cleanup,=0A=
> refactoring, additional controls, and support for new modes.=0A=
>=0A=
> Patch 1 Use pm_runtime_get_if_active() when applying controls.=0A=
>=0A=
> Patches 2=963 perform initial cleanup and refactoring. Unused=0A=
> group-hold programming is removed, register definitions are=0A=
> introduced, and the initialization tables are reorganized by=0A=
> splitting common and mode-specific registers.=0A=
>=0A=
> Patches 5=967 add additional V4L2 controls including digital gain,=0A=
> horizontal/vertical flip, and test pattern support.=0A=
>=0A=
> Patches 8=9610 extend the driver with 12-bit RAW support, update=0A=
> pixel rate handling when switching between 10-bit and 12-bit=0A=
> modes, and add new operating modes including 1080p and 2x2=0A=
> binned 720p.=0A=
>=0A=
> Patches 11=9613 improve control handling and internal logic by=0A=
> keeping vblank and exposure in sync on mode changes, updating=0A=
> the active format before adjusting framing controls, and=0A=
> renaming the vmax variable used by the VBLANK control.=0A=
>=0A=
> Patch 14 adds support for 2-lane MIPI CSI-2 operation.=0A=
>=0A=
> Patch 15 fix negative hblank calculation.=0A=
>=0A=
> All patches were tested on the Debix Model A board running=0A=
> Linux kernel v7.0-rc2.=0A=
=0A=
Could you please review this series when you have time?=0A=
=0A=
Please let me know if any further changes are needed.=0A=
=0A=
Best Regards,=0A=
Tarang=

