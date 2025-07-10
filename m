Return-Path: <linux-media+bounces-37281-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 341DEB0004A
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 13:14:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 316D3580349
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 11:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B4322E0934;
	Thu, 10 Jul 2025 11:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="BD0qeLV5"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011059.outbound.protection.outlook.com [52.101.125.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D905288C22;
	Thu, 10 Jul 2025 11:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752146049; cv=fail; b=SEk8KCwGBj9DBTWGqtVCfe0jW+VVdnHmdmGBsk6amGIshTAu9LXCQCoS0Gip2oxJHhFeoPMMAOvWTBBJV6eZAf9n2rqVMqDwH6vqsMGu5ncoT0wx4A9Yn+H/hSDsLPZbXi3SGFiQ9x3UBLPcFuUj+AcSdEndtMqXCKX0yW69pns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752146049; c=relaxed/simple;
	bh=5bdzH49nUDqnPLEOrG5OQZEllBVSUmEJlIB55tfYbzk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HnK4wA/rbyFATtZfl4Oqjcc1XmeQyBsMSRKbADsoM5mcouTAuDZZ/xXnyxlq+NreiGIG8Dp2u/wG3n20gDD8e9dQCoUz1QEQkCQXtLgM7oSvwzJ7ypcOjdB43sPjJoaiTUXmyOoD7DXIsu1uwmROzEX0eHiSFt573ABcmiYBe/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=BD0qeLV5; arc=fail smtp.client-ip=52.101.125.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jlB2Yb3To6tYwou2Nw3YxadRo70OLPRBPEWWDXjVdfI2jpBSamAkiav8Ev1e5tlRIH0fTUT6NzTsqPpK6K3OxW8fxTA3HMzre+16CTksnJlOzZ+wPt0yq3ln8bifRGrT+UtYqfQMX11iN639tp98QtsHVtVpdJ+XJFd4Ei8pbKnum22jcRy238Tup+H1HDMGg/9Bwz9MPbyAC73JPEiof7mTEaXrFryO+pDcNj2DZ41PFwyuPo5BOzI8BPrRCOxSJ//smNcgzCX2f1jybZma/KMn0BdvMpPPOuKAckEvKJ/6aNYWemN5BDNHaTDDKLAcaiHFvQEEN95IXBg7Z1b5+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZkI/nMnnp6p6mEVbJKqXOzyNURM/NVMYkJDdgnLzoI=;
 b=YDO1vnb7FCrWJUYsF/YAyyQSJLW8EtGLeAYfSDnVdngzaqCQ49vNANwRcTuncVoPbRzNi5Nr4EW5KV67vxH8dCn/CjcEV44tA1XVzxIDGzQJVWq7zHYgM89/AJFKAAa3HE1GjpwM/5JEWs0t2IZOIlS/BW2TgQM6wW9a+9BuWW9nnT+7JdYSBpMdTdEem4y1bN4YkQMNHuxaKVv0UMZ9+wjkWjUj1arFh/vJQuf0kg+yTKnS0kCfGmlEjEVx/TubIVo8VZ2Cx3jLT2mICCEnJJPBpoxKF098G1dMZRC6q1axKfs5R9StMaNFeWFH1oEQ/IVNy9YbTIu9/fS1Ct2YpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZkI/nMnnp6p6mEVbJKqXOzyNURM/NVMYkJDdgnLzoI=;
 b=BD0qeLV5t7Ol/t0Zx9k5Cy/pZBsocC4ldJ5aP8kXmNUtH0rNvTj894mjWCz4PYYPvHHm71gE+nuqJE+WFAlsXxC5GZgxTiHkRsWwckcOVP/u4jS0PfVqpSQbh6TxzaxnI7hjssOAMEBY1jQrAw919UKf1oakZwHJUN4Jgji4xSU=
Received: from TY3PR01MB12089.jpnprd01.prod.outlook.com (2603:1096:400:3cf::5)
 by TY4PR01MB15503.jpnprd01.prod.outlook.com (2603:1096:405:270::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Thu, 10 Jul
 2025 11:14:04 +0000
Received: from TY3PR01MB12089.jpnprd01.prod.outlook.com
 ([fe80::2ac2:8829:306b:5772]) by TY3PR01MB12089.jpnprd01.prod.outlook.com
 ([fe80::2ac2:8829:306b:5772%6]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 11:14:04 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	=?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Kieran Bingham
	<kieran.bingham+renesas@ideasonboard.com>, Jacopo Mondi <jacopo@jmondi.org>,
	laurent.pinchart <laurent.pinchart@ideasonboard.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 3/5] media: renesas: fdp1: Convert to RUNTIME_PM_OPS()
Thread-Topic: [PATCH 3/5] media: renesas: fdp1: Convert to RUNTIME_PM_OPS()
Thread-Index: AQHb8QX90awjhNR0DUGaq8hGiayKJLQrNWLg
Date: Thu, 10 Jul 2025 11:14:04 +0000
Message-ID:
 <TY3PR01MB12089DE3A3AD4C5DB9E2BCE43C248A@TY3PR01MB12089.jpnprd01.prod.outlook.com>
References: <cover.1752088108.git.geert+renesas@glider.be>
 <4402553df11f87a53cd70c95e35966963a4132df.1752088108.git.geert+renesas@glider.be>
In-Reply-To:
 <4402553df11f87a53cd70c95e35966963a4132df.1752088108.git.geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB12089:EE_|TY4PR01MB15503:EE_
x-ms-office365-filtering-correlation-id: 0606c394-71bc-4d5a-d4d0-08ddbfa2e166
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?rICTXqmdz3JQDR7R6lm9L0iefplGeruUp4wl/7+CgYHtoutJBxL7QIlQKY?=
 =?iso-8859-1?Q?27To4aQneu/CwO9hGMxBzsd1tKZSUtf90ZZK3UgN4gOmnw+XWJ4mOtGryB?=
 =?iso-8859-1?Q?UYo9fxQvzMZdI/welFzlKsgjnJP0RrQb4i2DHs8k4Zim7DNQ500G+8QX2v?=
 =?iso-8859-1?Q?6OvuTHE77KGgiRahSGJBtl6Q095sGCzLz8rK0+05VTGB07I3QvRYIeeg4E?=
 =?iso-8859-1?Q?KbkCGCQhW/bQ5l+3hirh19o/EclzDmIeTlOQowkfQF/fRIU9A/D+rqm78l?=
 =?iso-8859-1?Q?2REnoQdXMBG1rw5eAoz3pAdc+AprOLMDsCjPNqligFZG7WEHJVGMhI9O80?=
 =?iso-8859-1?Q?kHj801DmTvfN6vMROxhdGcCWpEfOh8N7Ncdliij4EkmLU97TUCj9PEX6mm?=
 =?iso-8859-1?Q?6TfRLMztrN6YNo509QsMV6QtHbHAaRNEccbP95/XbQqlemSxBLmhZfF6F/?=
 =?iso-8859-1?Q?mKpiGoP3WugXcYVmNpaWF6SeYYY822/jXiqgQnEW4xbC9bh65pfbeCe5RJ?=
 =?iso-8859-1?Q?FR3qajUJ6GeO4ZtFZCqkzr/tTLlhagb14/c3Zh2Bc9mAJvXKpYt6miOP6/?=
 =?iso-8859-1?Q?gANGLrH6KDzSyg8XbqvzXuEbQgEgqJ5dCWekfu8KX5WBVDbcexlCI0L48J?=
 =?iso-8859-1?Q?cHFU+vgeMIJgHA6x4qvV5TqzWbN9Px0wYgyONMyIpCqIymeS+VBY94o/fi?=
 =?iso-8859-1?Q?gvx2Px+HIF+lO8xEEAVQju0E6RKBHShcs6tFTAytBuxDqoOVW81JCL2D6k?=
 =?iso-8859-1?Q?JK4kmhmhi/b7p7/CwmNpPHgHfG2PSRXoDLKap/VQhZh382GEn16t3LSWJc?=
 =?iso-8859-1?Q?DcV1xPXu71E9GZHPJ6x48SlvAkTS1maaeRKkRS9acFulBhjIDUuN1gzUr8?=
 =?iso-8859-1?Q?6bmNFtWNJrKQG0xuS6ssrr7oN9pi/5TjugTEcRjNrYs1uSmclRg2hJH4Zb?=
 =?iso-8859-1?Q?cyXdhLQBq99sdIs1cDeR7XTUfOl6LGljRX0RJGtkfjRQqmFA4ZLmm11u+W?=
 =?iso-8859-1?Q?U5Zb50TCYruYaUdw/Lg9E2oIZMRnVSVYduFvPG+MBkDT+LQelZvF2HjbI2?=
 =?iso-8859-1?Q?hTrsYKvkpIdVEMhGjyRp6aqEE8+KTrNrLFVkUvZv2gXzZuLDYJij3PXrJL?=
 =?iso-8859-1?Q?CAdXrlmbJkLYLSVbyzva2wW9LF4w8n0HWZVH47x/jBHd9B4BxkPPqFVijJ?=
 =?iso-8859-1?Q?GYaJIEjNj8iPEvwmfoG8o2pJ5MZ4kqsxVgLv4KOSOLu3RarfdjfTtGnO9F?=
 =?iso-8859-1?Q?gouTkQoFdGXgnCDoEByayXepvqC4YrP3j3Bpw8GG0A7VZ3e4RkGo4hf19L?=
 =?iso-8859-1?Q?qQvrD9Prc/aYAHVj6gMgntgBgYJZfASfmCSRwdxwYCuM2SwlkRSXA+11DW?=
 =?iso-8859-1?Q?byVOAg1I65SRRLZPsydFYZQ8jFbfJbuy6kDYe3/IHHQwj3iDzIGvkvGtkN?=
 =?iso-8859-1?Q?B1DXavI5sxkgUl0FJMFaBnW1qVmYJeFHVKz6eDBy2ujVYneThXHto08DQm?=
 =?iso-8859-1?Q?cmp+jXmbtTTjS2Koqe6edc/lgqM77MSk3gk50fQHDlfw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB12089.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?mwROUpBlddvcoIIEscfXbo/SEuGsAnxWQWIlGgya3gIRnkuMqrUel42H15?=
 =?iso-8859-1?Q?13b0AwB9RSYKBfdhaio6cRTDKR/79MtoRiqTYn+QNK2YZDpQVB0fwrSEHm?=
 =?iso-8859-1?Q?ZtL3dvcqvpGIiGYlFqcJz/dovwGwA5JOpMedfe3oVqVBqHCueeJBF4g85y?=
 =?iso-8859-1?Q?nA+/0EgHanze7IBfYvSlw9qkDlpjkML5Jdd5TNZqnOky5oBoZwthbQrcQf?=
 =?iso-8859-1?Q?3lrQ7MLaa4htlMTRbn4NXjYs1A3WgWw52pkOfw9LZkKZPR9chaWO6JN+DD?=
 =?iso-8859-1?Q?DgfUxaM//ImZxVXbpUCNmgfc3koQPoSIDLEN5SXClbfUKRKSbkAq/2v9oH?=
 =?iso-8859-1?Q?Rec5fUTTCBr3vb23e5XYa+cmzqgExmhYJvBm/Y/bR7vPCp2mrJldkUgAg+?=
 =?iso-8859-1?Q?Y9fnz2JyWrHieAS0DXZkjtXM1Tm911v2NUW52l82HhFQp/oeqxhcpLSTNY?=
 =?iso-8859-1?Q?RJBppjAglUP8f93Bd84vd16l6ZNbYsLU82JmTo2Q9d7O/r2FJq+0DgXGoC?=
 =?iso-8859-1?Q?P/w2CR+/2W/KJhXEruDDuNH26i77is0CpNFcQ//P1OFu1nrOE1OMC+K7rk?=
 =?iso-8859-1?Q?2fIObyVomOiefFgTcLyhpwUIaLAPedme1wglKE7ifNtdBcLrV1YHoDJuo7?=
 =?iso-8859-1?Q?ipE8w6GYu9vBrraI3I5/UW+66eX2wT3I11QUhrUYOUssC0wz7nA18C36ap?=
 =?iso-8859-1?Q?OWbZnuBosH4bHndKqUgo3wU4tTnHR+jvT5OVOX6pNWkMj4XcIlLrokhE0o?=
 =?iso-8859-1?Q?AGldi9qn8bR7/TgRqTkM40N14nfMEHm4c0HQZPxziBtENnKO/p05+LIOIC?=
 =?iso-8859-1?Q?II7FREJgI1X7E+VdQ0Cs1TzhoiI4Q9JBoX1cSXuvn5VE37ifKAkBM4O6D0?=
 =?iso-8859-1?Q?PG3tDvaonCeImpeFvBAmHX3dzRORQzgqO2cTowqOoL1efbLfsSjsOmXgHW?=
 =?iso-8859-1?Q?4P3ls65KI2j1Qo5idEMCFQa0ByE66BHT9pqIH2S1jYSLydJsBH1DvkiTsp?=
 =?iso-8859-1?Q?Ras6pyCZjCDDC1KgVaDsaH/k8qZIJFMX+AcTk+CL0fqR900maM4bL01q3S?=
 =?iso-8859-1?Q?gZmR/rW33LFmZV0mbfYEMvRg9c+GdA9/+lbrmbIjzCBBjQ0KvoFEtMGk4z?=
 =?iso-8859-1?Q?J8EWGcK5GXTi8wutP/tqzW6s2H/kwNq+haozvFwt1VL5mTv2O+su/x99Fw?=
 =?iso-8859-1?Q?zpFrsxM98gfzLSpMcR87htgqUeu8plN8IeVn1MDrxI1S4fiCzac93w738w?=
 =?iso-8859-1?Q?L5ARXdbppvHa5eKqasXgMctDXvLf2RqJH6iE0CZXt/Oi4SI9TxpYAiErLE?=
 =?iso-8859-1?Q?5uJ9dSaAbOD8whA4cAVs+onOyAipj5tJFkk/9la5NxZuizESdohEuFWD0O?=
 =?iso-8859-1?Q?PfJV2aYBtunw7s5pZYEYbT0efMIZoTlb43un87H0C0vqO7z0XMcOxTHKXE?=
 =?iso-8859-1?Q?90SvfZim1mraDY3xLQCM4Oye1jK7KgD37h1aVRP8zi4aPvgGPGfPdP58XU?=
 =?iso-8859-1?Q?M4jkPCHdl96XPSLaoLGMbVYs/+Y/92NWrjD38lXBMXQ9H0hDeQeto1sEbq?=
 =?iso-8859-1?Q?Z5IZZs9PZgYnIpiKsijTf+UJpQvnID3KkkNFNF2uRAqzBV/UhHnPe4XK63?=
 =?iso-8859-1?Q?e31v8LIopetH3AHJFqwlXWnakFX22hlvg4RZZgkt5CLx4wlN3mFQwSXw?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0606c394-71bc-4d5a-d4d0-08ddbfa2e166
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2025 11:14:04.3439
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lfu3CvorShRDIbMOea+QEcOdoxEnD5+5kT1ImeN8utEZTQK5IGOKouGrbs+XedS5lS194rx2ul9/5aJYym6CMNc2ZsTRkSzw9i1l31tdS40=
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
> Subject: [PATCH 3/5] media: renesas: fdp1: Convert to RUNTIME_PM_OPS()
>=20
> Convert the Renesas Fine Display Processor driver from
> SET_RUNTIME_PM_OPS() to RUNTIME_PM_OPS() and pm_ptr().  This lets us
> drop the __maybe_unused annotations from its runtime suspend and resume
> callbacks, and reduces kernel size in case CONFIG_PM is disabled.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

> ---
>  drivers/media/platform/renesas/rcar_fdp1.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/media/platform/renesas/rcar_fdp1.c b/drivers/media/p=
latform/renesas/rcar_fdp1.c
> index 5d453a7a89889fa3..a40e48a7078f11b6 100644
> --- a/drivers/media/platform/renesas/rcar_fdp1.c
> +++ b/drivers/media/platform/renesas/rcar_fdp1.c
> @@ -2409,7 +2409,7 @@ static void fdp1_remove(struct platform_device *pde=
v)
>  	rcar_fcp_put(fdp1->fcp);
>  }
>=20
> -static int __maybe_unused fdp1_pm_runtime_suspend(struct device *dev)
> +static int fdp1_pm_runtime_suspend(struct device *dev)
>  {
>  	struct fdp1_dev *fdp1 =3D dev_get_drvdata(dev);
>=20
> @@ -2418,7 +2418,7 @@ static int __maybe_unused fdp1_pm_runtime_suspend(s=
truct device *dev)
>  	return 0;
>  }
>=20
> -static int __maybe_unused fdp1_pm_runtime_resume(struct device *dev)
> +static int fdp1_pm_runtime_resume(struct device *dev)
>  {
>  	struct fdp1_dev *fdp1 =3D dev_get_drvdata(dev);
>=20
> @@ -2429,9 +2429,7 @@ static int __maybe_unused fdp1_pm_runtime_resume(st=
ruct device *dev)
>  }
>=20
>  static const struct dev_pm_ops fdp1_pm_ops =3D {
> -	SET_RUNTIME_PM_OPS(fdp1_pm_runtime_suspend,
> -			   fdp1_pm_runtime_resume,
> -			   NULL)
> +	RUNTIME_PM_OPS(fdp1_pm_runtime_suspend, fdp1_pm_runtime_resume, NULL)
>  };
>=20
>  static const struct of_device_id fdp1_dt_ids[] =3D {
> @@ -2446,7 +2444,7 @@ static struct platform_driver fdp1_pdrv =3D {
>  	.driver		=3D {
>  		.name	=3D DRIVER_NAME,
>  		.of_match_table =3D fdp1_dt_ids,
> -		.pm	=3D &fdp1_pm_ops,
> +		.pm	=3D pm_ptr(&fdp1_pm_ops),
>  	},
>  };
>=20
> --
> 2.43.0


