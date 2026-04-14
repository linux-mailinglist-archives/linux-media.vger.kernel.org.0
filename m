Return-Path: <linux-media+bounces-58726-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKy8DjoN3mnRmQkAu9opvQ
	(envelope-from <linux-media+bounces-58726-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 11:47:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7A73F82CC
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 11:47:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D25793026C0A
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 09:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAA693C944A;
	Tue, 14 Apr 2026 09:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="QkLnOTrR"
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020130.outbound.protection.outlook.com [52.101.225.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8416395256;
	Tue, 14 Apr 2026 09:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776159818; cv=fail; b=ZaJvLexND1KaEb2uZJy99s/JcTF6TNvqB0MXVOjCkOweTIELdAEaye0enT1tL4l5g+STFVqWzdTx3J4ZleOgDHrYezv8sIJRXbALmO05ba7Kseq7Qy12X6jtX6NPakgL4MmrA0C+Hmjlt6qkcwtqbVP8vki/lNDEm5jpAtSkpHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776159818; c=relaxed/simple;
	bh=0exKNxx6+IpE6k39rUiQpM9g3sHGpIexAqUC/Rsh7gk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=S/OpyZPbhgnMqYW+unAugPOqfiN+4ZqE04MNmzfUfG6/2syDJOXf60hgfn4o0Q4XYYcnRJu7qTF4bxBiwyUS74CR2Pry1JjQaKnSF5JwuALNc47mDVPPlkpdVyxQb00ortG47Ne1vb7OQHyJ7uO+XRyGwEdmFQajxB0eKmEf4vU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=QkLnOTrR; arc=fail smtp.client-ip=52.101.225.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NRfahQ7DHH3n1LogB9m8R+xvNSNp+YxUXcMm/gcbB6o+2qZxxFWe3I4vXP/PdrmfLP0SsMswxbGEZT0b+h0MarfW94x9QU/gcRkcHTPLwncBCYeWDhY4dwNuXqk65WsJto7tKo2N2ulfnrc/Pvt/LIUkLPDZIVk3QFZRFFfAR7mDc5EddaFqpZ6C0extdmeuLAtD0wYVz9gUUSlBmsR7a9UC9DQsL6fNvB1WOC1yUyNVM2Uk1o85jQMcp68PT4mIdk+JsrzzPC33wFezREjrJIEp21AFjUzw2m4L4DXE9zu48U+XHDsUQbYfA14JbYm0N7TB2KX6P3jR6L79GZPqDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rng5zESysxBT3hdATeXB2HsaFNu9/EMS+84q9yPJJAQ=;
 b=JZmNgxbN0W6YX3D+0/uQaMiTZlc/RK8edsyxmCJ2vRncm5Sk4XEv3MnXmORlsqjOglvKN+hXzilxhMrSy7nZbRqO6p6gc9sXiy4h90WBdLpNXvG094IRbbitYvRn1E2DauzU2/aHxgLaUpaQJNJp8DzIb74ycCLJK+LAl3ZkmODhTrcw6TrbcP/ch/8lflv3sTA1saU7FN0uG3GLNlgCTDty9ofs8Ndz9PRo0lwnPpvK2Zau4lVtW4TnqXdGlSFkqLTKIosjYga6Rpm3IlAWggDeNoMZex0Uic0/V0mTD/I3SfRIXdwgcKjVroIfS9qQamw9sGa1eF19Q4UppsM2Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rng5zESysxBT3hdATeXB2HsaFNu9/EMS+84q9yPJJAQ=;
 b=QkLnOTrRuHh2ZtCH6EC1idnt4S1d97EK9/Pu5SRg+qGI/jeok28gID/GhIHnV/sdauQLi6Us0oauTug1z5Jp+t8FdDQHgZ2DaQCsAPHnOjArGrd5y8jGeAV4ZVRVTojNsvWtO52pXblRHauZ6IIxf8s1TmBk0AxgDe/lFNW8RDuobGNECqlHKDrshV94HTLqp3Jcdsvo1rh4YoHRPWM778JllL+fllbtRqUrdQSMhoDGZykszIEHHKp2xII/Ay8Tx8FmpfvU9z9NnWQK9fN0+1FASOxckReLUvVeLZFI2zQ9kbKmOPf8gEAntfdBPldzHbyVBu2c+uoeLilrFze9ag==
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11e::14)
 by PN6P287MB5103.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:300::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 09:43:33 +0000
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167]) by MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167%3]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 09:43:32 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, Tarang
 Raval <tarang.raval@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mehdi Djait
	<mehdi.djait@linux.intel.com>, Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>, Sylvain Petinot
	<sylvain.petinot@foss.st.com>, Hardevsinh Palaniya
	<hardevsinh.palaniya@siliconsignals.io>, Jingjing Xiong
	<jingjing.xiong@intel.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] media: i2c: add os02g10 image sensor driver
Thread-Topic: [PATCH v2 2/2] media: i2c: add os02g10 image sensor driver
Thread-Index: AQHcy+vUWjhtsErO5ki07Rsg8wgvDrXeSh4AgAAEK/A=
Date: Tue, 14 Apr 2026 09:43:32 +0000
Message-ID:
 <MA0P287MB2178FAA81D07B561FA68014988252@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
References: <20260414084952.217215-1-elgin.perumbilly@siliconsignals.io>
 <20260414084952.217215-3-elgin.perumbilly@siliconsignals.io>
 <20260414092758.GE4061@killaraus.ideasonboard.com>
In-Reply-To: <20260414092758.GE4061@killaraus.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB2178:EE_|PN6P287MB5103:EE_
x-ms-office365-filtering-correlation-id: b3c2ed31-24f1-416f-c90d-08de9a0a4ad9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 vof9qeQm60S1LKAQwxPc4ECARj1mY8Wg1UJXmI+hIX5fnLYMooLZzETJljNiJEkIAdhWsJgf89JhMVVhEVmcmjGD7MQMA6CcH6OyTSPXw2MOx147kH7y1HISrtHdCU70JO1eBtAeuJ8J2v94/AuEv/mxyFHQUOVEtkxmsHVlEFRa31CwmxcUNhi7TRm1RsRtVvuMdip6Cr7WY4gJFiEYVnlBE72clRo2ONJucaxs7uPBEnuWf0q6gB8aBXZ6WZGOZ0g0yoZkoR7IM1rOKt77Eu/p/KXLfmLvjLbmUjoqUqu33Mlg/3DJa6mn27F+xdNDUjO1aXQha52QsUkRhdKoiX+w1/Y224fTkYmkLdk+oGMOjMfMwjk5Ev9Dm+50y8C3cNH3gZS7ikqnNGzcRCSTvf2kC587PLcJyxH0dQWEDaetlro/sMKi4nol+QFhhjpjVo59gpZus63r+cvASMihsWRG3aisifTo60Exz/VlQLpOAn9Ck7RgJUCvSZoRhaKxXyvIHY5VXwLu63hftzuRsiRyf5WfDgtMlZgdwCpLdzvIHC5SK7Hy0X8Hw2qjbUQIrBsk86Wa6KchwUqWiC+ewKSLFUuOY8GSN0Nicy3lVIq8OhVnY5z8Z60n/3jLI+R0RAjs9mNDdueJwMnqWpgjahTs0I0xKWTBcragd2/k6FK82AVKuweLKUe9Wba3nLSUfj+ZDqKvnKY+/A3bpTcpQmlaZpUA5J+Sf9StzEBSsZEKWEJV9GLYWpRj1cIbbogvX0KPNiHfNu1aP3Q2qA4OtxoY6Y8cwiDT9Gy0gIB9gAE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB2178.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?hpecqu53wfyMLutsgxXb8T3sWXNm1+PO8uhX5dZ8myAIQVSDQp11auuuU8?=
 =?iso-8859-1?Q?ccIqbELiUd1qPEsg/o19TQ8diaqkrgS3eo2jRkxvGJUduLB/2B37qHcMA8?=
 =?iso-8859-1?Q?QeW6lQFHP/0mj90y5sGVMBksxDAEq1T8qCxwc0fcH7rYagMoRHKwmlb7rU?=
 =?iso-8859-1?Q?WfC1b8EYtD8Pj9N/ep7y+11NDTcghJJOkpPb76OUdjalFiLfalmImY82ah?=
 =?iso-8859-1?Q?rjcBGe4gbC6Fk+YO1Cy3Z7LHMCGgnhSyRtIU77YAbIAs2wcZ9v/DyqFTXG?=
 =?iso-8859-1?Q?SU5Cl5I21Vsh4Efy6cn2N/fPC1dRBX3Oo3GRQRaVUqlHDPdB07uVTJzKtx?=
 =?iso-8859-1?Q?4oNCHze3gviG2ainlr4mYjbLo06YziaLn8/zNjN3BLlTB4iMSfmS9/b92s?=
 =?iso-8859-1?Q?pAxVlPk91kVY82Lq/voJmm/ohOSjxHgp5V+qS7iBdUxWZsBwjbLbtmQFgM?=
 =?iso-8859-1?Q?/Zx5Q0SLBvj+DDbDDrHkLVKH7n8BQzhfYxNZ3/RgJl2GtkuJZzw4lHNApa?=
 =?iso-8859-1?Q?SLyJ8mrRmFT6eu1vP6Qy71PTkoGKXDxf7ZrH9POrGTFDX4ZDjfqLNko6Gc?=
 =?iso-8859-1?Q?7wxKFvSqAxBM58W2hl9K9AlWZpq9sjzjg93fQJH+Gu/43Hp4q3jws85VbS?=
 =?iso-8859-1?Q?50a0Xd7wlvzMXvc394VaKCQJc25Nj4ettn8FcnFnHVcyK1IdZJN6iQWbn/?=
 =?iso-8859-1?Q?XgAaSu4JExkKWJahsr1Q1GXe18rMAqpZlKUV+ve83/4RmcYdggQfVcFCq9?=
 =?iso-8859-1?Q?9TFAHfyVLnR8FjGABm/tT3M6IQ+d13qLXkcwZddiCTFC5q2ji/pMRDEXkm?=
 =?iso-8859-1?Q?2Ddt6CNpxlLqVoUlgBIzdZ5Vx6kBsOabw4ksoVEw5Sk/9pUCbOwGr3RK6C?=
 =?iso-8859-1?Q?XN04uLRlRyVdFOlxkrXTwCYeg+/7s4SzLrUltoCuVl7xhmwOl2tEcntxi2?=
 =?iso-8859-1?Q?jhtzpcMj2ISCRSXmO7C4hvuhnJz4leqs4uV/8Lk0BJMgJyc0Ndg37NCC4q?=
 =?iso-8859-1?Q?UaTnhy5IVjOBRS1xTp5shrDEN69vGE1tbv+PA9oChl4JdOaW+hDyi1hKao?=
 =?iso-8859-1?Q?SdabITYXpOPuV4i34FLZdyWR5BNr2frK4x1gFSBw30jADOPJoesCDL/+xY?=
 =?iso-8859-1?Q?RgXlb/00kcnAn/ePsfTbEFA3tGLab1H3ez1/DVSZD4ciJ8MZZyUtZ/HvJE?=
 =?iso-8859-1?Q?9qaYUlr8gtzVyPz7trTvq+q1bMvJPy4xkXFzvs8XOwZDkpDCCtp4DuF77z?=
 =?iso-8859-1?Q?p9OT0p3PhwxZ+q8KD95LaHWfJMw/0dn/itxyGmv16RZCLvjS15s4Yd4biR?=
 =?iso-8859-1?Q?JsVj33i3i6MqjlV5c+vXkh3GgujX3TebMxUggKskhuNz+GigFRd2qS+NaN?=
 =?iso-8859-1?Q?r/QOPvdan1EzP8B49Zo2pmtu1lYSgo5Hw7cUXfnuQbIAa7MrTcYq59kaCl?=
 =?iso-8859-1?Q?sfwfbYYUAnbNVUBab4YcapHBjA9SLcf5mnoT07+xv8uMXbPPQdJn1Hp3eR?=
 =?iso-8859-1?Q?vCbdFc21M0dLvXt3+eQFsJsLLI3c2gxG0ZskXrtEnPmqisPyzTgnBVrQ5x?=
 =?iso-8859-1?Q?4mP05pnM9ag8k/gzbkbwQhe7CH+h7DkErEpKdv4e5dOHd3MQeINDRaDHtC?=
 =?iso-8859-1?Q?7A++LoF//npi3kZ04ZzQB0vchJLrVqI3/1ltCHwI7qawuuGqAL1GUfv9C+?=
 =?iso-8859-1?Q?/Ec6H6v1+mZx7/eYrUF9BTSYESaobKXi+1OHhVeZll2YLuIBn7CHe69+N5?=
 =?iso-8859-1?Q?QewGLLwENbPk95eA63owN4eT//jvBr0qOZ5XXWRytikft/w9jMiHt2pv9K?=
 =?iso-8859-1?Q?YKzuaBtiDp79ldwCpvF9YffxiNLEKX4=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b3c2ed31-24f1-416f-c90d-08de9a0a4ad9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2026 09:43:32.8889
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9JrQypanxJkznXt8IWMAaCt9qMEDBHfUY2zJQcjLsODpF0uhEy457K6uH2E2oTJVkTkIw7ej2TY86TzJ8s7PyBpGzzX/kvv/4lSs3G6qI9r9z7tiQKOd+wo0N/ruJhYj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN6P287MB5103
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58726-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elgin.perumbilly@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[siliconsignals.io:dkim,siliconsignals.io:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,MA0P287MB2178.INDP287.PROD.OUTLOOK.COM:mid]
X-Rspamd-Queue-Id: 8C7A73F82CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent,=0A=
 =0A=
> I sent a review comment on v1.=0A=
>=0A=
> On Tue, Apr 14, 2026 at 02:19:45PM +0530, Elgin Perumbilly wrote:=0A=
> > Add a v4l2 subdevice driver for the Omnivision os02g10 sensor.=0A=
> >=0A=
> > The Omnivision os02g10 is a CMOS image sensor with an active array size=
 of=0A=
> > 1920 x 1080.=0A=
> >=0A=
> > The following features are supported:=0A=
> > - Manual exposure an gain control support=0A=
> > - vblank/hblank control support=0A=
> > - vflip/hflip control support=0A=
> > - Test pattern control support=0A=
> > - Supported resolution: 1920 x 1080 @ 30fps (SBGGR10)=0A=
> >=0A=
> > Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>=0A=
> > Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
> > ---=0A=
> >  MAINTAINERS                 |    1 +=0A=
> >  drivers/media/i2c/Kconfig   |   10 +=0A=
> >  drivers/media/i2c/Makefile  |    1 +=0A=
> >  drivers/media/i2c/os02g10.c | 1039 +++++++++++++++++++++++++++++++++++=
=0A=
> >  4 files changed, 1051 insertions(+)=0A=
> >  create mode 100644 drivers/media/i2c/os02g10.c=0A=
 =0A=
I have added a new function, os02g10_set_framefmt, which dynamically sets=
=0A=
the mode register.=0A=
 =0A=
Please let me know if I have missed anything or if further changes are=0A=
needed.=0A=
 =0A=
Best regards,=0A=
Elgin=

