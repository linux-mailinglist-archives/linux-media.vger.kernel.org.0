Return-Path: <linux-media+bounces-38021-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5F9B08DE5
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 15:12:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 637593BA537
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 13:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 358DD2D8386;
	Thu, 17 Jul 2025 13:12:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021100.outbound.protection.outlook.com [40.107.51.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25CA2D6639;
	Thu, 17 Jul 2025 13:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752757920; cv=fail; b=GH03OyScsg6fjXMMs9f4Lvm0PNXZiEU6w4ndGzomDKDqjNsJYhS4vj1tEe8X0Z2pGr8AE6sKo9eIfi7KdJiRin2PPCP7xzzhZu0XvArN6OFGctLdF1Hna4/ExCyQAnlj2lrbxbnmdj14sEGaAhjNWwB+M2rt8jqGvvx1f+tvyNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752757920; c=relaxed/simple;
	bh=gqk1/da2jMuZDDh7taKlDxrAuc1qFKno6BNccgyiIPc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=d24GJZUwgOSmT3SJ6KPA0SMWcvXujEU3/o9z7O8/9ooSD735JVVJaXtI/jCprVGOhMOSYEbkwl8N3S+veLkmWuP5JMd9pCpZskGaKWOU4t/DUR+IpSKcOH5KD2/aksWm5Tnx9Zbr3WJra9yDwOmEHoa6KZivSU9IDGbovABaFcU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.51.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k8noROlfXh+exgNTc6ac9Mk3IiTMuFlIPRm7v2GJmBHWb/Hia6UB7+uXoC/PYB4d/eRaHOCNwGj7Aso9f1jp9lplk/bJiVAOrcbVGobxk7KAm84ihuWe+zAujnyPJiiTtk/pzo4QqiTalFigcCMY/FBz6FQHSBoaSFIdIbDg0uVx0aCMJZasloabYFBnzfjp+OF4xg60nfEKzsguYVYDhIkbNd0cIkqtCo4tkZKfemo0PVlkiASEtA55EAgXViFAHVIpm1/TdHj5r8mLNRM/vAsqOj+XUk+ar5p13KtieKDYbAY5PM3VgkQf/yvgzZfrWRVeiJMOJu3FHa7jYaRClA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gqk1/da2jMuZDDh7taKlDxrAuc1qFKno6BNccgyiIPc=;
 b=wyYk3rSr5QuEYNK2AG7NUspPY1hAYppKNNcz/j36SgtSwpAftFZwJ/MXh52gfDMsBMzPs8nA1zMLs+CqnFwoV7XgA/w3LtZOkAtWIHV1XrKIVwXtG5/WY3uvHYiCDx4p/FkfdHU5J6N27iUzsN1gk3HKlw72sJrFBik1a8nDCrJMJPJpMWkVpfRwRF9lNFeZZg7p0GgtNFYXpwb5zlln7XvzMkQ69rhz5BdqGbdkSbm1EyMM/coEQ78E3SLdP/ZiB9mAowkRNdVbFnDj8771TCZTWpildqWUqpERhpBUMTW4YRAeSwwPeFHPSn/fmO5El2iVB3EkyGkvQDyqHpcFSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:229::21)
 by PN3P287MB1086.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:17c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 13:11:53 +0000
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418]) by PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418%6]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 13:11:53 +0000
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, Himanshu Bhavani
	<himanshu.bhavani@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Ricardo Ribalda
	<ribalda@chromium.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Hans
 de Goede <hansg@kernel.org>, =?iso-8859-1?Q?Andr=E9_Apitzsch?=
	<git@apitzsch.eu>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Matthias
 Fend <matthias.fend@emfend.at>, Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Heimir Thor Sverrisson
	<heimir.sverrisson@gmail.com>, Jingjing Xiong <jingjing.xiong@intel.com>,
	Arnd Bergmann <arnd@arndb.de>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] media: i2c: add ov2735 image sensor driver
Thread-Topic: [PATCH v4 2/2] media: i2c: add ov2735 image sensor driver
Thread-Index: AQHb9lfjBPY0RYptTkKs/yE+zJH3MrQ01A8AgAEXEFyAAFctgIAACIG7
Date: Thu, 17 Jul 2025 13:11:53 +0000
Message-ID:
 <PN3P287MB35199EB9309448F3EDD43402FF51A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
References: <20250716134426.8348-1-hardevsinh.palaniya@siliconsignals.io>
 <20250716134426.8348-3-hardevsinh.palaniya@siliconsignals.io>
 <aHe7NFJz6aCUqZXL@smile.fi.intel.com>
 <PN3P287MB351951A3DBA4FA85404DA410FF51A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
 <aHjubei5Aex9n-HI@smile.fi.intel.com>
In-Reply-To: <aHjubei5Aex9n-HI@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB3519:EE_|PN3P287MB1086:EE_
x-ms-office365-filtering-correlation-id: 333b70d1-09b2-4e57-73dc-08ddc5337f89
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?QcqtUQZA3j/m9/YBO/P3tmaWYZsXLIHWHRiS5Cs8vDxk37J0xE/5+N8tp2?=
 =?iso-8859-1?Q?rk21KkqTIZ27RcOCd371uQhB9up0rdexIJWWD8wskcT36k1KVArJhn8bT4?=
 =?iso-8859-1?Q?OlyIkEhYZW4/z3pcVT2jBrGV7ykYpjML1rOGBWQP8vrLtPz2MK+qYP8eUa?=
 =?iso-8859-1?Q?V3c3Y6fJCbFgzGhz7GbjXCfRWbkR28QpzNP1gpt/jl6Y674qAVB9HI2B07?=
 =?iso-8859-1?Q?z0D08YzZFcYiAOAEtDlIX3tOPBDFDyGZXpVDVYYmH9oG+ST7b/Wk5Oyx6f?=
 =?iso-8859-1?Q?i731hbh+rk50T0myVDPU9kpAC3rA5Pny8uwLp4SRHjYcAH7A3BaLPso+oF?=
 =?iso-8859-1?Q?uE7DcX+IRCnxm81R6Q2K+AjVrXND4tG5rYu2kb1Af9dvqanF8+RpDzTe5V?=
 =?iso-8859-1?Q?fZqwDjfa5u0a0/XBGX/VtLrJ5AJqkLa1I+uLy8wkUsMzZJPYFRN31eVo7s?=
 =?iso-8859-1?Q?HdiqFjsZ+IotZRa+6vMVHhvjqE8nNXojJultDf2d9Fkmmz02zBj5nQnEOE?=
 =?iso-8859-1?Q?jIHV+3dUX39vQkVqmajTUv8cAfHa+OeXpHbgRtifbCuf+eW2e5wirTNEi0?=
 =?iso-8859-1?Q?VcrjAv8XYRREYhMHnjtrUILtdntEiX0DQRr5YudC8S9ET6jMNNrMUEGrXM?=
 =?iso-8859-1?Q?HjDj13gtysO0sjNLruRSV0iGGHx3HO0zS7HGVUEgMW0fgpiM/RjGMG7GbV?=
 =?iso-8859-1?Q?sr7Hnjk47f8cGDoPMWJGxM3P/b17k/cKkGG8jxq8TzuTLUec3PKpXu8KzE?=
 =?iso-8859-1?Q?Q/eJKK0UdWCxMwfqJA+nICDSGbqPGcfkAobqcsLK8Hdrlu6LLfl8JNmJoO?=
 =?iso-8859-1?Q?OK8BpDnhkZ4WL6sEM10bD3icIIoVq2VZp+ds4PLmMISnhvkDF5CcRQJ5fn?=
 =?iso-8859-1?Q?TNAtm1wwdyPJ5q8/lI/WQtZ6o8lRQmpgKbZIg4jQJ2vc6cU48XivN6iQ8f?=
 =?iso-8859-1?Q?yUlnpqxITaUjeTOGTd3dmTc+WG5W3MMZBDcMTTKoLPdDwJT/RJvkoXbadY?=
 =?iso-8859-1?Q?+DlaPWGaGKBzj4CYdi5oFYJ8Y1EncOn17nMtNnjdEFCGcU32Yjl4Wt5h/D?=
 =?iso-8859-1?Q?+WmYqRA6Lerz1UBdyqu1onOEGEd8mtq2G3ctqi/JIQlEH+oLnxitFTLAge?=
 =?iso-8859-1?Q?MmLs+gVUtCST+nzPRq7YUfUnKc+xWKlfoOowYHAKkIyhBFRmD8vFvGUnCg?=
 =?iso-8859-1?Q?yQaxi5OqVbuG95o67ZtZkjH8r/XZw1QMVMBScuh+vX+Jq72P4oP8qr6UoQ?=
 =?iso-8859-1?Q?eLWu+IMjdC/Vg6pqFQgwWfBzh7cN2UsBN0aTlBR26wxRCMXg/SXxg3TBge?=
 =?iso-8859-1?Q?3o2K3zsbitesPJXWvT0ocFsaEYB2ChLw8Eo+kAMqZjbegTgJ3U7jqhuth+?=
 =?iso-8859-1?Q?kOpYdc25A3Skwe0sbArT/J+IS8oyJwDcBbW8bzFze3Bsyc+ufDINN3I6kP?=
 =?iso-8859-1?Q?kaV8cqmN6ehyyvtT+UpwkLN5vmnDqLBWusnwu4Nn+DVpzClPgNYBKYE45k?=
 =?iso-8859-1?Q?6bgprUPrQxndhvUs4RpZmj9NYmKA+Br7DNHcQ35Po95g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB3519.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?q/JcsBL7m89E+LvERbbnJF49tu0KeuQBWa1EQOUgs2Pv0jVJFWXV8143xP?=
 =?iso-8859-1?Q?xsKe+ouLtAd+rxvvMJ6MwYKv8jCOwkC7HjuofrJ6gCtcC8Mrq4ejcPf847?=
 =?iso-8859-1?Q?b8WRSIjiVTgjkbDq0U7S9HrFn02MBX73DTKPG4QPPyo83/K3TJjET+FpWt?=
 =?iso-8859-1?Q?rXo5Uk7nl+8iHE+eiMhYgHnOHPCeGqpRu7JmjOzDHAYiosQttDg37NzzB4?=
 =?iso-8859-1?Q?48H/zqZffaO6Iv5ymANmcCch5Sq9kNAwjMdjSYILbqSWT3YIzg1gnAFNtW?=
 =?iso-8859-1?Q?R5z11xz9dLe+MxaW1/8OoNubaIi4QEV5QX5dbmDxuSEtG4t9RIy6JuIBbx?=
 =?iso-8859-1?Q?RQRhDAWHE4CJTyKzMd49KzaZuE6gH+4xy3xUbjA0Ly4jU4exXMFiEklaY3?=
 =?iso-8859-1?Q?Iiu1aWgU9z7l9IQV6MuDUrUn3LHBBPc8l//AftlF0zwKXmnCttv2MXYwqb?=
 =?iso-8859-1?Q?KRAyPMwc2IQ8HKHsOuZ1HI1+neU65yz0ir/7jhiJggqHKMuU4xxajKYnN5?=
 =?iso-8859-1?Q?NvEDDGNu0e08qyp/sHJOrVQBaelhPlEOQ2q8IvWkGXzpi8qo6Y/e4aWmbC?=
 =?iso-8859-1?Q?gUl5UU+11rAnLZC3AbqdVVj5+A87JUOxI45Xp0CIurJG6J4h884On+uU8y?=
 =?iso-8859-1?Q?6RK5siVOuARFm2PBP4jS6gsCfFzINOnB6ATHICfXLe4c1yNXm7PBZ5Z/6W?=
 =?iso-8859-1?Q?Sqr4U9+is9e/Yk9z4AsMd9Wmp8Fq0pX8Ldp/l4g68BFtfrOuqA/trgOKck?=
 =?iso-8859-1?Q?+l9Nj4Hj4erZnxSuAvjvKhpGoEPpYvi6h+3xcWWL3fxoIO7WyyI98GGRpq?=
 =?iso-8859-1?Q?8M+CxjDL3d2gsbuJht2DAffulKg67VhUsUioSLq4kWiEkoP9Peguzr4Wgp?=
 =?iso-8859-1?Q?Ow8AUW8JYWIBidrwByGE/DDTCpg9wYbQxz7FdECP1D8KQcdt38UQW8l85H?=
 =?iso-8859-1?Q?XgsJeCniiJVlah2JjqRWa/kHcQ5v9QADd47OsopcqyjZh+YCsG0KvgKAwV?=
 =?iso-8859-1?Q?fYUHdcCyxXawHZr5+QnD+cxm267G8fT0Y+S/bmkiQ0dWSZ05Gn68vur3YC?=
 =?iso-8859-1?Q?7lc2+xzJro/ilheFHLqNJs1pqd4UZiH4DTGmc/NMXKm6hJCS3UIEMUQOi9?=
 =?iso-8859-1?Q?161fuIJKywSBW4Lk/VU6iXfdUMJWqdK1WxGAf532JvWdcc0nHo5KxQaB7i?=
 =?iso-8859-1?Q?zKp5Bjth3kxLsFZu5UHsgP5Bq2Va34Ex0vcAUep7kMhgyAVSEe/rsbAHGS?=
 =?iso-8859-1?Q?o/deNTwXDDWzckL8izFfSNbT2uU3nyOMwJpcLLybB/V8N2gw2lNYtkDOcZ?=
 =?iso-8859-1?Q?l8CBsUm3Mth39s37y5KQXZGrdeuRoZNuJgINoEM11qlaA9Y2jS8+Sr67p6?=
 =?iso-8859-1?Q?XGTH7n8b37UjclXERkpH+fuwCYzgUWEfKtE1KBEdnZUE3buVRQeva/vRmA?=
 =?iso-8859-1?Q?VbHfoQQq6Xl80+7Sp/VE8mpCGOxSz5JrbtzBQbNQieOLMoweI8ZG8CVl0Z?=
 =?iso-8859-1?Q?lSWtz138wo7ih/vTMa3AZQQzr2Dtxt+KnZy9GLLBiXAMP9oJiTMF40pfxi?=
 =?iso-8859-1?Q?qh457K9dmt3G2K1mv1btvRXUrFI4F3jLR8sCp+YEnQ1cjwsL6IYdTrzB6K?=
 =?iso-8859-1?Q?M/dP1vJMDdx/XA6Bo9+ALj9RJmRtHj++CPf5AGIMr9Eb1Y4uHpKlFo9yL6?=
 =?iso-8859-1?Q?eiPXMvuEaL/DsYZaCL0=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 333b70d1-09b2-4e57-73dc-08ddc5337f89
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2025 13:11:53.0119
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W4bRaecBNT0nz7Zz1VFnoOUrVdJTvh3MDpiRdzB2/Nc2cRCq5A02EvQidX8waUUPHFB3pYcZbuKIALws5utM7K521Eqx1ZkKlx6gVofEzzDNFsgykj+nfTVMD+nasx4m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1086

Hi Andy,=0A=
=0A=
> On Thu, Jul 17, 2025 at 07:26:49AM +0000, Hardevsinh Palaniya wrote:=0A=
> > > On Wed, Jul 16, 2025 at 07:14:17PM +0530, Hardevsinh Palaniya wrote:=
=0A=
>=A0=0A=
> ...=0A=
>=A0=0A=
> > > > +static int ov2735_page_access(struct ov2735 *ov2735,=0A=
> > > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 u32 reg, void=
 *val, int *err, bool is_read)=0A=
> > > > +{=0A=
> > > > + =A0 =A0 u8 page =3D (reg >> CCI_REG_PRIVATE_SHIFT) & 0xff;=0A=
> > > > + =A0 =A0 u32 addr =3D reg & ~CCI_REG_PRIVATE_MASK;=0A=
> > > > + =A0 =A0 int ret =3D 0;=0A=
> > > > +=0A=
> > > > + =A0 =A0 if (err && *err)=0A=
> > > > + =A0 =A0 =A0 =A0 =A0 =A0 return *err;=0A=
> > > > +=0A=
> > > > + =A0 =A0 mutex_lock(&ov2735->page_lock);=0A=
> > > > +=0A=
> > > > + =A0 =A0 /* Perform page access before read/write */=0A=
> > > > + =A0 =A0 if (ov2735->current_page !=3D page) {=0A=
> > > > + =A0 =A0 =A0 =A0 =A0 =A0 ret =3D cci_write(ov2735->cci, OV2735_REG=
_PAGE_SELECT, page, &ret);=0A=
> > > > + =A0 =A0 =A0 =A0 =A0 =A0 if (ret)=0A=
> > > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_mutex_unlock;=0A=
> > > > + =A0 =A0 =A0 =A0 =A0 =A0 ov2735->current_page =3D page;=0A=
> > > > + =A0 =A0 }=0A=
> > > > +=0A=
> > > > + =A0 =A0 if (is_read)=0A=
> > > > + =A0 =A0 =A0 =A0 =A0 =A0 ret =3D cci_read(ov2735->cci, addr, (u64 =
*)val, err);=0A=
> > > > + =A0 =A0 else=0A=
> > > > + =A0 =A0 =A0 =A0 =A0 =A0 ret =3D cci_write(ov2735->cci, addr, *(u6=
4 *)val, err);=0A=
> > > > +=0A=
> > > > +err_mutex_unlock:=0A=
> > >=0A=
> > > > + =A0 =A0 if (ret && err)=0A=
> > >=0A=
> > > Why do you need to check for ret !=3D 0?=0A=
> >=0A=
> > To prevents overwriting *err with 0 on successful operations, which cou=
ld=0A=
> > obscure previous errors.=0A=
>=A0=0A=
> Can you elaborate a bit how the *err is not 0 at this point=0A=
> (assuming err !=3D NULL)?=0A=
=0A=
A previous operation have already failed and stored a=A0non-=0A=
zero error code in *err.=0A=
=0A=
Assuming this function is used in a sequence of write (or read) =0A=
operations. If the current operation succeeds (i.e., ret =3D=3D 0) and we=
=A0=0A=
unconditionally write *err =3D ret, we would overwrite the=A0=0A=
existing error with 0, falsely indicating that all operations=A0=0A=
were successful.=0A=
=0A=
Therefore, the condition if (ret && err) ensures that we only=A0=0A=
update *err when there's a new error, preserving any previously=A0=0A=
recorded failures.=0A=
=0A=
Let me know if you have a different suggestion for how this should=A0=0A=
be handled.=0A=
=0A=
Best Regards,=0A=
Hardev=

