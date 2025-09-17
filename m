Return-Path: <linux-media+bounces-42667-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFD5B7C88D
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 14:05:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BA56588101
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 11:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E6B372895;
	Wed, 17 Sep 2025 11:59:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020143.outbound.protection.outlook.com [52.101.227.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17958306B06;
	Wed, 17 Sep 2025 11:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758110366; cv=fail; b=DV1EnwTkA5x8qnOqkfLXNDp6UeDgiGgAxeSydnL9Kp91xAtCe4B780C8oavKmJ43jmp8jisRR1T2zb4O5aLe1PxsWTseZaw52+BBr0oBAkQmiGs9lpAI5cIRUk7+0DGJVhc/ujxfibHD2FRsJdLXrgeWgHRQIrOs3MTPGng9QA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758110366; c=relaxed/simple;
	bh=G0t4ULF9+yfLmEfB+V1JUwTeIcSApr2c1HQpe33B9hI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=V44LvWb198Tyu65a11ytIM0nnL9kvLKJI9BSIn2E8Dm9z5RtpjgPoNmksz/X2y0TTl3u6PHCkmf1mF5R2KJKlhJobRBzjP/O0DrAfPwm1JtwQwGBtmGEJO0ORuu/dsrOKnZqEnbC6SLyJUVJFJWkNTcKftNpQC0xdup3OENLOT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.227.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xO6hu+RnCdIQjsPgiio/f1WV5VZF8iBvStjMNNwoVY5heHtUbpKlO9FMpU7NMseYtnFs3XWfGbk+A1uANz0WCRQ8SgjTfFEKsp9r5a33HCP40CJWyhU73KKmau6QM9R49EaRceSWCtYAf+o++D1EkW3z2y81u7Ud3qS+oXzZNx7H831baEJM6jdfgVVUZvadErCjNAkYWljxgzX2CfTQkx83rhWp/ozAxNKYGHB1M7ByAx3C4hZokIo6DTWAHujcfgDU3IduDIAir1Az5meHU16JSMzPqP93j3Tt62cho2ehOf5RqaQ4ydyT5QRWijJKDbwCfwqRZ5gDcXYxgVp8ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bq2yMKHWEuSws+JkMwbdDgX35EFrSqCJm98Vnrx8utk=;
 b=iXAaf75bYFUSzQ6BngoTXePW5X2hPljfhzyQ6TJM8Z3kQ5WQGz5fLPtWJM6+wl4neJAfBZqI6TSOVYzzbAKw5J3LT0nUoDHkvBF9DVhJxJRPgyOfUinQF6+jhSsk+TSro+chengvNzOAYuImapGCDZpC4pzVIZLj4THCp//88Vm8i4SV5JVercd9vjBkzXbxl0CTaBbXMAdf+WT/2hQhIV4ETdTZbUhn7lj2xAgiBD3SwFTpchgTItRZH89UH7hvPxJz0fHjsY58LbgqKkqMCypPzQDpved3dZ+9zbdfxX80cOylTmlYQhWdmfSkR+0ePTYKG5lLsxAdZRPjwaVKRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN3P287MB0212.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:d5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 11:59:18 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%4]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 11:59:18 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Matthias Fend <matthias.fend@emfend.at>, Sakari Ailus
	<sakari.ailus@linux.intel.com>
CC: Hans Verkuil <hverkuil@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>, Jingjing Xiong <jingjing.xiong@intel.com>, Alan
 Stern <stern@rowland.harvard.edu>, Dongcheng Yan <dongcheng.yan@intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, =?Windows-1252?Q?Andr=E9_Apitzsch?=
	<git@apitzsch.eu>, Ricardo Ribalda <ribalda@chromium.org>, Conor Dooley
	<conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring
	<robh@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Hao Yao <hao.yao@intel.com>,
	"bsp-development.geo@leica-geosystems.com"
	<bsp-development.geo@leica-geosystems.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
Subject: Re: [PATCH v3 2/2] media: i2c: add Himax HM1246 image sensor driver
Thread-Topic: [PATCH v3 2/2] media: i2c: add Himax HM1246 image sensor driver
Thread-Index: AQHcI7gdKhBm3ur8gEeLLZE98I8rULSQw4FngAN20ICAAqy+XQ==
Date: Wed, 17 Sep 2025 11:59:18 +0000
Message-ID:
 <PN3P287MB1829CC08F12404531C640DB98B17A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20250912-hm1246-v3-0-3b89f47dfa43@emfend.at>
 <20250912-hm1246-v3-2-3b89f47dfa43@emfend.at>
 <PN3P287MB18290018941BE6A227431C818B0BA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <2b8b3ff9-43c8-44ba-b5b9-586409448de0@emfend.at>
In-Reply-To: <2b8b3ff9-43c8-44ba-b5b9-586409448de0@emfend.at>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN3P287MB0212:EE_
x-ms-office365-filtering-correlation-id: 0d42c63c-1497-4aba-111e-08ddf5e1a1d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?dN5cJKJ2MGCXfM/7UYtYhwdrNAzE+S84XAX+H03NgxiAM45v7eOPGS+K?=
 =?Windows-1252?Q?o1HGd/3J3jnimn83vnc4vZQQ58hdcrqWPO355676zbHF5DLgs986+YYy?=
 =?Windows-1252?Q?yxBOy7gvr3XPC1tuFJiZO3eJ81NFL93J0gXArm/1LJaWxkpxe//NKgx9?=
 =?Windows-1252?Q?VRP88JnKEa7eGL6/v7rsnY9dkmH5StZhhYCU/MeTd2IdKH/V6LHcfetx?=
 =?Windows-1252?Q?8eq0PLWxGWBQY0sxHsnSh7b8c94cCvCrDmJBvzQQhpsCVpf6FDz41Ift?=
 =?Windows-1252?Q?3O3WSbfOpyrjurZu7xmZVsKGNJ4oMg7b3lnejwvJ6DgvQhG2SM8VrXeB?=
 =?Windows-1252?Q?D5sXLrlcjm/Dzu2+hACEIYvuYZpIfptijziVvIMW55tzYawv0nczt33c?=
 =?Windows-1252?Q?6ubSZuHGrciTNW7PeTKRTPoUxVol2GXHoh1Op1c+U/Ts7vNYZRidjZaO?=
 =?Windows-1252?Q?DgQTG3l8WYgMlHgR7qI7wJD1wysanCdzetqbXofgwJF6OLPttZz6JGNI?=
 =?Windows-1252?Q?oXBr6hvsxP9SN4Uyj79xvLbN/R88usHfiLnih83sIhGo8aD2jlQN6u8k?=
 =?Windows-1252?Q?lxg5d3MAHGeO0kZeGOR83fmiJt78zu5WtKI4WaLmokATYU/A0mESecT2?=
 =?Windows-1252?Q?5eWNAeMi8D70e01QFnbgnl1z4wuJdviKe3V5C7NFeWg679jZWJNJQwT4?=
 =?Windows-1252?Q?5cNyujLQT0e1SWHrzR3Op4zTR7zJwv3iGlUqNHhH6Kn27bV02jgdmnJO?=
 =?Windows-1252?Q?TsgLXBxQcA9++7NX2itX1s6VMggiYNAg9dralvEjI/V9wLO2XV6JI6/w?=
 =?Windows-1252?Q?jzB2SDxXeC0/19USDbKFOTGh32z6sK0SA5ewNENuNMuylpSatFbbGqJd?=
 =?Windows-1252?Q?++VKIzNUmCIZA1/D1weghOOaaQRtkCZuxT8fQTHAwfvucngBRDpgZB6j?=
 =?Windows-1252?Q?nyZ/khaZqbm5wN2hWseYyG3/T7mEh1t8xaVQHGNKSKW7kcWdyByhNE7C?=
 =?Windows-1252?Q?SPUQzGof1YTh4KMSrYOyBQVeYW6rXdF6yKETtnrTJKF2ujwlvU6DK/Hx?=
 =?Windows-1252?Q?kycmlKqG5/EmPK5app0xstNjY/WMGfJoV+wL50h5ZwVSDKM6oBf+o0Il?=
 =?Windows-1252?Q?J9XaQJUp7GYJo8jzJtrrCUTauMOl5UxfpLDp8mWtmCVv8T2AspPwQx0w?=
 =?Windows-1252?Q?zIwlDmOPTntOaZz47KOoAuwcHIcdpnEa9N8LGRYYHLia//s1X609SmCT?=
 =?Windows-1252?Q?9VN5mmTuold0tTrRcvtF6eZdQeVjHz3PVKs5fyk3KRBKVzBCFnnyF8B7?=
 =?Windows-1252?Q?jq5bdT1iRK1XP+QAZgKrS7TkCx7/s/LgoNZi8cgbU7mWfMXMTiVLO7Od?=
 =?Windows-1252?Q?TLJwMyzLA4DoEFQwgU/OEUOgsB8TOWgZqO7e9Zg2UPUvZH4NofN/wEOB?=
 =?Windows-1252?Q?AUWE2r2F4ZWyDzC2arlYgA9XJVvsdY+NaVqDZJjyyEmaiZlij8YYF3Pc?=
 =?Windows-1252?Q?rBjwWcoBOU5SsutfpfjiD8imGzYf48EjDnmWnBb6JGUOLUmrsmTeS3jP?=
 =?Windows-1252?Q?uoDzhop4eKm/4OQaCZ9Ujli/uDVqv6SOibNyqQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?IVpKabNqIkwcqztQIG9JSPMGT+QveXSVFvWoHS2FF2JYfoAqYsUrf++C?=
 =?Windows-1252?Q?RQ3KKjdAWDoiXI/fmmx+jjN3H+l6DKi24BV8+y/1C6dQAhs8VttImvJT?=
 =?Windows-1252?Q?YiV01nI4R+zGSiJlo+isGWS0+XHHEbSkVRUDl1A11xHU1JU0wiFtIUbl?=
 =?Windows-1252?Q?2ent02QwsBx+2ixWg8BextXMxERUM3cylfl2OArf43LUH+icDqd5ngrf?=
 =?Windows-1252?Q?s+OPPP3Coda4VPwePQwdNxO6ex8XM5FZI/oirP9TmUzEs5xKgQH2Rxs+?=
 =?Windows-1252?Q?StgkMCq0Y34oOxHG62TWL6JjGDBzy4S5AVWM4R3mj3NTLXUgrkKxA1vb?=
 =?Windows-1252?Q?56Ye5BwbHwiLR/43HMhwvK7CJFWp2aclz3p7eSx6lFkwZnBLqU4NwIN5?=
 =?Windows-1252?Q?i9Q5MMrXs9OdnURa599hFD+D30GHE8CEHgmAS5DgSNR+dA8Vf3GG6mMw?=
 =?Windows-1252?Q?kkIdHmg4HwLr3B178c5QRo6ERwGADU0YnhremNpezsEd48XFx6VWETwq?=
 =?Windows-1252?Q?/R7J5giU2yMQ1IzOFjDxrmVPWxzvrY5JQsB8nJ7Vytr9/n/Wkce+f/p1?=
 =?Windows-1252?Q?DYfpjuYfr5lza6D9DWyT+yB3Ms00EhkSaLBu3q4Rlq4ytjMkbLop07e1?=
 =?Windows-1252?Q?0C+qwJS5ESG4Nn6PUxgAErEOQ6txei0uNonsWvXivRZxwz0PI1Uml4Vz?=
 =?Windows-1252?Q?wB3g2lIFNRYtTcX05axs7IRg6q3PYRNz+3AwYP39yEcUJrDnwHVIpW7j?=
 =?Windows-1252?Q?5ngQ6c2eoDs9+dt+SE6t6V+QqDSGmFn/WzNkPCiXapEM2/iDFwQ8ywii?=
 =?Windows-1252?Q?y68Fyhvix549HaGlQWUuP+qqZTYl2gnqHKPD0xjv18Gm33ceoyaV0Grh?=
 =?Windows-1252?Q?dewHI47o0LStKqKgrva44sucm2VeYDDZ/gjdIez7vsmsDAtrYNmdZ8eZ?=
 =?Windows-1252?Q?1xfOWNKr5JhdXqU7rxu345LITmackLe0DY5BH0Ye1fgr/UhFIw9MTWgE?=
 =?Windows-1252?Q?53MwKAS3eA2E5+nIwdqQrIUs1inMrytCmuVPFYHcvfE2CNy0N38aSrZ4?=
 =?Windows-1252?Q?1gHKgT0mGbYaBR48DVGEBIq8BGQLa+2DYx3Bgw3GwCNl0IP7xuUiz+sk?=
 =?Windows-1252?Q?jfiML1uzrxSyd3TjHI+5o8yhrO9iuP0nQaK5wnfx6hVpa4HfFFzkPOIL?=
 =?Windows-1252?Q?md6NYvVyUTiNMCwIikR4CJiuhIXrB8TT74GTqfh3ojlcdWINUBMTmUDI?=
 =?Windows-1252?Q?N1ZII48VnhHir1zdXInvoYrTkGp/CncfZvKUEmY5bZqi/t91Ty/WNGlR?=
 =?Windows-1252?Q?t5WvsUEbuia+z6M7uc/51QxIcvPT1TYg48p6/h8CPkVmBfNzdvZE4PQ/?=
 =?Windows-1252?Q?jXD0SMMRgntbsxUL2k/hSga+ja+LXPGupy35eZ8xVlRPSEDkgisjRmzS?=
 =?Windows-1252?Q?WwXZm2CpsyumAzcA3z/XTnzBIBBH8uMNFsP0hCMpmLW7ag5Uy7yloZdp?=
 =?Windows-1252?Q?ILCsW9YkjxIIeCwG/yFzPRqZMMJMOp66egrAcHpGZxveRayBFntfHlNZ?=
 =?Windows-1252?Q?fjHBZ87Cz+TyUfyUKM3mCoUo1AJOFsMgNh7QHwxRMwjCk1B1rN3vZmUs?=
 =?Windows-1252?Q?OdrXwl49AP28RvEuKyVJIWy3jao8Nv5MRO3ggi6bV3Kl6hs7rQSsWHCr?=
 =?Windows-1252?Q?k7E+LBf9GLWmd7qR5kHXb/cxUy51w2v40QVPHwGZXF1t3qDhZXEKPQ?=
 =?Windows-1252?Q?=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d42c63c-1497-4aba-111e-08ddf5e1a1d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2025 11:59:18.7543
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: luhkP1twfoecEn3yNdD3MYAvqRSsYrzHq801f185Syx6z1YHiRklrUj03DgrL3sQrvBo2ahj+UFU3c2lnQuKusYIdrtqigB5ziUjAwD9St8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0212

Hi Matthias,=0A=
=0A=
> Am 13.09.2025 um 11:11 schrieb Tarang Raval:=0A=
> > Hi Matthias,=0A=
> >=0A=
> > > Add a V4L2 sub-device driver for Himax HM1246 image sensor.=0A=
> > >=0A=
> > > The Himax HM1246-AWD is a 1/3.7-Inch CMOS image sensor SoC with an ac=
tive=0A=
> > > array size of 1296 x 976. It is programmable through an I2C interface=
 and=0A=
> > > connected via parallel bus.=0A=
> > >=0A=
> > > The sensor has an internal ISP with a complete image processing pipel=
ine=0A=
> > > including control loops. However, this driver uses the sensor in raw =
mode=0A=
> > > and the entire ISP is bypassed.=0A=
> > >=0A=
> > > Signed-off-by: Matthias Fend <matthias.fend@emfend.at>=0A=
> > > ---=0A=
> > >=A0=A0 MAINTAINERS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=
=A0=A0 8 +=0A=
> > >=A0=A0 drivers/media/i2c/Kconfig=A0 |=A0=A0 10 +=0A=
> > >=A0=A0 drivers/media/i2c/Makefile |=A0=A0=A0 1 +=0A=
> > >=A0=A0 drivers/media/i2c/hm1246.c | 1427 +++++++++++++++++++++++++++++=
+++++++++++++++=0A=
> > >=A0=A0 4 files changed, 1446 insertions(+)=0A=
> > >=0A=
> >=0A=
> > ...=0A=
> >=0A=
> > > +#define FLIP_FORMAT_INDEX(v, h) ((v ? 2 : 0) | (h ? 1 : 0))=0A=
> > > +=0A=
> > > +/* Get the format code of the mode considering current flip setting.=
 */=0A=
> > > +static u32 hm1246_get_format_code(struct hm1246 *hm1246,=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 const struct hm1246_mode *hm1246_mode)=0A=
> > > +{=0A=
> > > +=A0=A0=A0=A0=A0=A0 return hm1246_mode->codes[FLIP_FORMAT_INDEX(hm124=
6->vflip_ctrl->val,=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 hm1246->hflip_ctrl->val)];=0A=
> > > +}=0A=
> > > +=0A=
> > > +static const struct hm1246_mode hm1246_modes[] =3D {=0A=
> > > +=A0=A0=A0=A0=A0=A0 {=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .codes =3D {=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 [=
FLIP_FORMAT_INDEX(0, 0)] =3D MEDIA_BUS_FMT_SBGGR10_1X10,=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 [=
FLIP_FORMAT_INDEX(0, 1)] =3D MEDIA_BUS_FMT_SGBRG10_1X10,=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 [=
FLIP_FORMAT_INDEX(1, 0)] =3D MEDIA_BUS_FMT_SGRBG10_1X10,=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 [=
FLIP_FORMAT_INDEX(1, 1)] =3D MEDIA_BUS_FMT_SRGGB10_1X10,=0A=
> >=0A=
> > Instead of defining four mbus codes per mode, you can keep a single=0A=
> > global Bayer-format table and derive the active code based on the=0A=
> > H/V flip controls. This makes the code simpler and easier to maintain.=
=0A=
> >=0A=
> > You can refer to the imx319 or imx219=A0 driver for implementation.=0A=
> =0A=
> I copied it from there at first.=0A=
> But since I didn't like the implied assignment (calculated index but=0A=
> required order is only a comment), I decided on this explicit=0A=
> implementation. So that is at least the intention behind the current=0A=
> code. Do you seed that as an issue?=0A=
 =0A=
I didn=92t find any issues with the current implementation.=0A=
=0A=
However, if additional modes are added later, we would need to define =0A=
four mbus codes for each, which leads to some repetition and slightly =0A=
longer code.=0A=
=0A=
Sakari, what would you consider the preferred approach in this case?=0A=
=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 },=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .link_freq_index =3D 0,=
=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .clocks_per_pixel =3D 1,=
=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .top =3D 0,=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .left =3D 0,=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .width =3D 1296,=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .height =3D 976,=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .hts =3D 1420,=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .vts_min =3D 990,=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .reg_list =3D {=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .=
num_of_regs =3D ARRAY_SIZE(mode_1296x976_raw),=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .=
regs =3D mode_1296x976_raw,=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 },=0A=
> > > +=A0=A0=A0=A0=A0=A0 },=0A=
> > > +};=0A=
> > =0A=
> > ...=0A=
> > =0A=
> > > +static int hm1246_update_controls(struct hm1246 *hm1246,=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 const struct hm1246_mode *mode)=0A=
> > > +{=0A=
> > > +=A0=A0=A0=A0=A0=A0 s64 pixel_rate, exposure_max, vblank, hblank;=0A=
> > > +=A0=A0=A0=A0=A0=A0 int ret;=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0 ret =3D __v4l2_ctrl_s_ctrl(hm1246->link_freq_ctrl=
, mode->link_freq_index);=0A=
> > > +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(hm1246->dev, "lin=
k_freq ctrl range update failed\n");=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> > > +=A0=A0=A0=A0=A0=A0 }=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0 pixel_rate =3D div_u64(hm1246_link_freqs[mode->li=
nk_freq_index],=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 mode->clocks_per_pixel);=0A=
> > > +=A0=A0=A0=A0=A0=A0 ret =3D __v4l2_ctrl_modify_range(hm1246->pixel_ra=
te_ctrl, pixel_rate,=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pixel_rate, 1, pixel_rate);=
=0A=
> > > +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(hm1246->dev, "pix=
el_rate ctrl range update failed\n");=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> > > +=A0=A0=A0=A0=A0=A0 }=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0 vblank =3D mode->vts_min - mode->height,=0A=
> >=0A=
> > With the comma, the driver won=92t compile.=0A=
> =0A=
> Huh. That actually compiles without errors. But you're right, of course,=
=0A=
> that it's not intended to be that way.=0A=
> =0A=
> >=0A=
> > > +=A0=A0=A0=A0=A0=A0 ret =3D __v4l2_ctrl_modify_range(hm1246->vblank_c=
trl, vblank,=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HM1246_VTS_MAX - mode->height=
, 1,=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 vblank);=0A=
> > > +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(hm1246->dev, "vbl=
ank ctrl range update failed\n");=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> > > +=A0=A0=A0=A0=A0=A0 }=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0 hblank =3D mode->hts - mode->width;=0A=
> > > +=A0=A0=A0=A0=A0=A0 ret =3D __v4l2_ctrl_modify_range(hm1246->hblank_c=
trl, hblank, hblank, 1,=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 hblank);=0A=
> > > +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(hm1246->dev, "hbl=
ank ctrl range update failed\n");=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> > > +=A0=A0=A0=A0=A0=A0 }=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0 exposure_max =3D mode->vts_min - HM1246_COARSE_IN=
TG_MARGIN;=0A=
> > > +=A0=A0=A0=A0=A0=A0 ret =3D __v4l2_ctrl_modify_range(hm1246->exposure=
_ctrl,=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HM1246_COARSE_INTG_MIN, expos=
ure_max,=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HM1246_COARSE_INTG_STEP, expo=
sure_max);=0A=
> > > +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(hm1246->dev, "exp=
osure ctrl range update failed\n");=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> > > +=A0=A0=A0=A0=A0=A0 }=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0 return 0;=0A=
> > > +}=0A=
> > =0A=
> >  ...=0A=
> > =0A=
> > > +static int hm1246_calc_pll(struct hm1246 *hm1246, u32 xclk, u32 link=
_freq,=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 u32 clocks_per_pixel, u8 *pll1, u8 *pll2, u8 *pll3)=0A=
> > > +{=0A=
> > > +=A0=A0=A0=A0=A0=A0 const u8 pclk_div_table[] =3D { 4, 5, 6, 7, 8, 12=
, 14, 16 };=0A=
> > > +=A0=A0=A0=A0=A0=A0 const u8 sysclk_div_table[] =3D { 1, 2, 3, 4 };=
=0A=
> > > +=A0=A0=A0=A0=A0=A0 const u8 post_div_table[] =3D { 1, 2, 4, 8 };=0A=
> > > +=A0=A0=A0=A0=A0=A0 const int sysclk_pclk_ratio =3D 3; /* Recommended=
 value */=0A=
> > > +=A0=A0=A0=A0=A0=A0 u32 pclk, vco_out, best_vco_diff;=0A=
> > > +=A0=A0=A0=A0=A0=A0 int pclk_div_index, sysclk_div_index, post_div_in=
dex;=0A=
> > > +=A0=A0=A0=A0=A0=A0 u8 pre_div =3D 0, multiplier_h =3D 0, multiplier_=
l =3D 0;=0A=
> > > +=A0=A0=A0=A0=A0=A0 bool sysclk_pclk_ratio_found =3D false;=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0 if (link_freq < HM1246_PCLK_MIN || link_freq > HM=
1246_PCLK_MAX)=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0 /*=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0 * In raw mode (1 pixel per clock) the pixel cl=
ock is internally=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0 * divided by two.=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0 */=0A=
> > > +=A0=A0=A0=A0=A0=A0 pclk =3D (2 * link_freq) / clocks_per_pixel;=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0 /* Find suitable PCLK and SYSCLK dividers. */=0A=
> > > +=A0=A0=A0=A0=A0=A0 for (pclk_div_index =3D 0; pclk_div_index < ARRAY=
_SIZE(pclk_div_table);=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pclk_div_index++) {=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 for (sysclk_div_index =3D=
 0;=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sysclk_div=
_index < ARRAY_SIZE(sysclk_div_table);=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sysclk_div=
_index++) {=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 i=
f (sysclk_div_table[sysclk_div_index] *=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sysclk_pclk_ratio =3D=3D=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 pclk_div_table[pclk_div_index]) {=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 sysclk_pclk_ratio_found =3D true;=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=
=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (sysclk_pclk_ratio_fou=
nd)=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 b=
reak;=0A=
> > > +=A0=A0=A0=A0=A0=A0 }=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0 if (!sysclk_pclk_ratio_found)=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0 /* Determine an appropriate post divider. */=0A=
> > > +=A0=A0=A0=A0=A0=A0 for (post_div_index =3D 0; post_div_index < ARRAY=
_SIZE(post_div_table);=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 post_div_index++) {=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 vco_out =3D pclk * (pclk_=
div_table[pclk_div_index] *=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 post_div_table[post_div_index]);=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (vco_out >=3D HM1246_P=
LL_VCO_MIN &&=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 vco_out <=3D =
HM1246_PLL_VCO_MAX)=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 b=
reak;=0A=
> > > +=A0=A0=A0=A0=A0=A0 }=0A=
> > > +=A0=A0=A0=A0=A0=A0 if (post_div_index >=3D ARRAY_SIZE(post_div_table=
))=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0 /* Find best pre-divider and multiplier values. *=
/=0A=
> > > +=A0=A0=A0=A0=A0=A0 best_vco_diff =3D U32_MAX;=0A=
> > > +=A0=A0=A0=A0=A0=A0 for (u32 div =3D DIV_ROUND_UP(xclk, HM1246_PLL_IN=
CLK_MAX);=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 div <=3D (xclk / HM1246_PLL_INCLK_=
MIN); div++) {=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 u32 multi, multi_h, multi=
_l, vco, diff;=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 multi =3D DIV_ROUND_CLOSE=
ST_ULL((u64)vco_out * div, xclk);=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (multi < HM1246_PLL_MU=
LTI_MIN ||=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 multi > HM124=
6_PLL_MULTI_MAX)=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 c=
ontinue;=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 multi_h =3D multi / (HM12=
46_PLL_MULTI_H_MIN *=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HM1246_PLL_MULTI_L_MAX) +=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 2;=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 multi_l =3D multi / multi=
_h;=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 vco =3D div_u64((u64)xclk=
 * multi_h * multi_l, div);=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 diff =3D abs(vco_out - vc=
o);=0A=
> >=0A=
> > Here vco_out is always higher than vco??=0A=
> >=0A=
> > because vco_out & vco are u32.=0A=
> >=0A=
> > abs is for signed int so if vco is higher than vco_out abs()=0A=
> > can misbehave on wrap.=0A=
> =0A=
> No, the difference can also be negative.=0A=
> Although this works on my test system at least, it is of course better=0A=
> to replace abs() with abs_diff() here.=0A=
> =0A=
> >=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (diff < best_vco_diff)=
 {=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 b=
est_vco_diff =3D diff;=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 p=
re_div =3D div;=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 m=
ultiplier_h =3D multi_h;=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 m=
ultiplier_l =3D multi_l;=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (!diff)=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 b=
reak;=0A=
> > > +=A0=A0=A0=A0=A0=A0 }=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0 if (best_vco_diff =3D=3D U32_MAX)=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0 *pll1 =3D HM1246_PLL1CFG_MULTIPLIER(multiplier_l =
- 1);=0A=
> > > +=A0=A0=A0=A0=A0=A0 *pll2 =3D HM1246_PLL2CFG_PRE_DIV(pre_div - 1) |=
=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HM1246_PLL2CFG_MULTIPLIER=
(multiplier_h - 2);=0A=
> > > +=A0=A0=A0=A0=A0=A0 *pll3 =3D HM1246_PLL3CFG_POST_DIV(post_div_index)=
 |=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HM1246_PLL3CFG_SYSCLK_DIV=
(sysclk_div_index) |=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HM1246_PLL3CFG_PCLK_DIV(p=
clk_div_index);=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0 return 0;=0A=
> > > +}=0A=
> > =0A=
> >  ...=0A=
> > =0A=
> > > +static int hm1246_set_ctrl(struct v4l2_ctrl *ctrl)=0A=
> > > +{=0A=
> > > +=A0=A0=A0=A0=A0=A0 struct hm1246 *hm1246 =3D container_of_const(ctrl=
->handler, struct hm1246,=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 ctrls);=0A=
> > > +=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_state *state;=0A=
> > > +=A0=A0=A0=A0=A0=A0 const struct v4l2_mbus_framefmt *format;=0A=
> > > +=A0=A0=A0=A0=A0=A0 const struct hm1246_mode *mode;=0A=
> > > +=A0=A0=A0=A0=A0=A0 u32 val;=0A=
> > > +=A0=A0=A0=A0=A0=A0 bool needs_cmu_update =3D false;=0A=
> >=0A=
> > I think you missed my last response here.=0A=
> =0A=
> Yes, I missed that. I will invert the logic accordingly.=0A=
> =0A=
> >=0A=
> > > +=A0=A0=A0=A0=A0=A0 int ret =3D 0;=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0 state =3D v4l2_subdev_get_locked_active_state(&hm=
1246->sd);=0A=
> > > +=A0=A0=A0=A0=A0=A0 format =3D v4l2_subdev_state_get_format(state, 0)=
;=0A=
> > > +=A0=A0=A0=A0=A0=A0 mode =3D v4l2_find_nearest_size(hm1246_modes, ARR=
AY_SIZE(hm1246_modes),=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 width, height, format->width,=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 format->height);=0A=
> >=0A=
> > No need for mode. In vblank you can directly use format->height.=0A=
> >=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0 if (ctrl->id =3D=3D V4L2_CID_VBLANK) {=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 s64 exposure_max;=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 exposure_max =3D=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 f=
ormat->height + ctrl->val - HM1246_COARSE_INTG_MARGIN;=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D __v4l2_ctrl_modif=
y_range(hm1246->exposure_ctrl,=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 hm124=
6->exposure_ctrl->minimum,=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 expos=
ure_max,=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 hm124=
6->exposure_ctrl->step,=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 expos=
ure_max);=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 d=
ev_err(hm1246->dev, "exposure ctrl range update failed\n");=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 r=
eturn ret;=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
> > > +=A0=A0=A0=A0=A0=A0 }=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0 if (!pm_runtime_get_if_active(hm1246->dev))=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0 switch (ctrl->id) {=0A=
> > > +=A0=A0=A0=A0=A0=A0 case V4L2_CID_EXPOSURE:=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cci_write(hm1246->regmap,=
 HM1246_COARSE_INTG_REG, ctrl->val,=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 &ret);=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 needs_cmu_update =3D true=
;=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0 case V4L2_CID_ANALOGUE_GAIN:=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cci_write(hm1246->regmap,=
 HM1246_ANALOG_GLOBAL_GAIN_REG,=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 ctrl->val, &ret);=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 needs_cmu_update =3D true=
;=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0 case V4L2_CID_VBLANK:=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 val =3D mode->height + ct=
rl->val;=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cci_write(hm1246->regmap,=
 HM1246_FRAME_LENGTH_LINES_REG, val,=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 &ret);=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 needs_cmu_update =3D true=
;=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0 case V4L2_CID_HFLIP:=0A=
> > > +=A0=A0=A0=A0=A0=A0 case V4L2_CID_VFLIP:=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 val =3D 0;=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (hm1246->hflip_ctrl->v=
al)=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 v=
al |=3D HM1246_IMAGE_ORIENTATION_HFLIP;=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (hm1246->vflip_ctrl->v=
al)=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 v=
al |=3D HM1246_IMAGE_ORIENTATION_VFLIP;=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cci_write(hm1246->regmap,=
 HM1246_IMAGE_ORIENTATION_REG, val,=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 &ret);=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 needs_cmu_update =3D true=
;=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0 case V4L2_CID_TEST_PATTERN:=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D hm1246_test_patte=
rn(hm1246, ctrl->val);=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0 default:=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D -EINVAL;=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> > > +=A0=A0=A0=A0=A0=A0 }=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0 if (needs_cmu_update)=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cci_write(hm1246->regmap,=
 HM1246_CMU_UPDATE_REG, 0, &ret);=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0 pm_runtime_put(hm1246->dev);=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0 return ret;=0A=
> > > +}=0A=
> > =0A=
> >  ...=0A=
> > =0A=
> > > +static int __maybe_unused hm1246_g_register(struct v4l2_subdev *sd,=
=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct v4l2_db=
g_register *reg)=0A=
> > > +{=0A=
> > > +=A0=A0=A0=A0=A0=A0 struct hm1246 *hm1246 =3D to_hm1246(sd);=0A=
> > > +=A0=A0=A0=A0=A0=A0 u64 val;=0A=
> > > +=A0=A0=A0=A0=A0=A0 int ret;=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0 if (!pm_runtime_get_if_in_use(hm1246->dev))=0A=
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
> > > +=0A=
> > > +=A0=A0=A0=A0=A0=A0 ret =3D cci_read(hm1246->regmap, CCI_REG8(reg->re=
g), &val, NULL);=0A=
> >=0A=
> > Many of your registers are 16-bit, so is it fine to use CCI_REG8?=0A=
> > I think you should use simple regmap_read.=0A=
> =0A=
> Yes, that's fine. Even if values are distributed across multiple 8-bit=0A=
> registers, they can be addressed individually.=0A=
=0A=
Agreed. Even when using regmap_read, we would still be accessing the =0A=
individual 8-bit registers separately, so the current approach is =0A=
valid. You're right.=0A=
=0A=
Best Regards,=0A=
Tarang=

