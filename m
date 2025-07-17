Return-Path: <linux-media+bounces-37950-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEB1B08695
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 09:27:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 391C6163047
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 07:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42EA8225A5B;
	Thu, 17 Jul 2025 07:26:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021097.outbound.protection.outlook.com [40.107.51.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A90B21E08A;
	Thu, 17 Jul 2025 07:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752737217; cv=fail; b=EIiSmqSBaSfzTiW5KLrFstzfCJ3rfO2IOMeBIoAtIL5C5r6xcGJigxIQbWUERL1PDfhuUqAI5Hq+lKQOqMhoJHBt6mZ9ZGwlqM21V2VRn9ilKIfO0cZktIsm/ac9vvm11usLuQHRBbljDTC56Miad22H5VOUUkr/2ctVWXpYmm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752737217; c=relaxed/simple;
	bh=uOMPG4rciJVxWmUp1HH54vyV1osJz6ZJcdxq3fN1UYQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jprdwNwysfKFTr8ADonJ4NXHmj1lETXOn072R7SkpuoN4m0IuLtNuLeHCNifBPhHuiCdmwF82griImu06PTAhe3rNYM0o74lJknGFAlrVNeojf07HLVq+VJMp1QSiDH4C/r9x4/wssvQ5fXRQQCwil+RSaszI5QoJouQKulbJFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.51.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IDeUO32o4Bv7m3CH+cmDmCjZJ786L9DsI4pKEbF592aiWzEuy3zPSkGxEMk8heAvCOrZ2TzSSSOxK8/jtVWDAUjF9yGNIK9wC+mmCPg1LfU5Na5T+kq9mmNZ3cuxHWTZOysnyR7ZpsEfSEvPpI1qxgU8KRvYqhmAlU8ofYfuxbOKeP52Hys43kfEzNS70g+Wyml1LlE3waC5GrJQepAp8QWWl7bgFwOczx+q3x3A2bHVfF2AD92czWSl1qqWTjKpfBV/IPXJuqD5RmV6O9rv8MkToWoVZ8WOc8ZUYB0XkSkI/C6OaHxc88ygILV5UFFeF/aMQvIr7CmqCapCw2eeQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uOMPG4rciJVxWmUp1HH54vyV1osJz6ZJcdxq3fN1UYQ=;
 b=FddDa+2D5mjoU1iqSi/MSDpyqEQGICJewOydzYksYqL5ytyxMoDaAzMp1VQIl7vq7vKmmpoTmrCUhX/8PJaX1z9ZOVPT3AoTeXon6xdJrKSiU3sjvVMThwFeTQjAa7w87rLQdZ5HFsBuuMWpiWsDC1q/OvN4MPzK5ZtLWaM+dsHy6UF6/1FzBQqj4ZQIV4gcMDHUaUynj1IWxZSQy0D9Q2imBZ7uDAPb5Pd2TpAi8Gau22g0BRHp0AH1+5viy9oOILFmWSSMW+VJtZ9GH2tBLB6k1z3j+s3scPBrc4Mv0JGP5JhM0WaZSXdbnNtvKCAt1+MRyiWinirrZKAKWg6pvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:229::21)
 by PN5P287MB4241.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2bd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.36; Thu, 17 Jul
 2025 07:26:50 +0000
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418]) by PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418%6]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 07:26:49 +0000
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
Thread-Index: AQHb9lfjBPY0RYptTkKs/yE+zJH3MrQ01A8AgAEXEFw=
Date: Thu, 17 Jul 2025 07:26:49 +0000
Message-ID:
 <PN3P287MB351951A3DBA4FA85404DA410FF51A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
References: <20250716134426.8348-1-hardevsinh.palaniya@siliconsignals.io>
 <20250716134426.8348-3-hardevsinh.palaniya@siliconsignals.io>
 <aHe7NFJz6aCUqZXL@smile.fi.intel.com>
In-Reply-To: <aHe7NFJz6aCUqZXL@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB3519:EE_|PN5P287MB4241:EE_
x-ms-office365-filtering-correlation-id: b26001dd-c0c4-4cef-5eeb-08ddc5034b79
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?CBJt50lzPAj0CWbLbYj9NBFPzFYxRLVIltJJveRPvXxbaa0svSI2f/gslW?=
 =?iso-8859-1?Q?AGyH8//CInxAUmPdYyxh/URNg2TMFAuBsq+lBtrFzeKS1Y4TtlDRaXd1FG?=
 =?iso-8859-1?Q?T0nO9zZxAA1e7NaJDoOUiq+57yOrp90Evdjz+3dwzyY+J/ty6kaM7IWPEy?=
 =?iso-8859-1?Q?8Bz6ccYcvJ621gwhMdcG+7fujfXRserJNzQMkX4gzkk7WD4zM1WZmP9Agj?=
 =?iso-8859-1?Q?OuAlaDgLMQn0dwr8p0KlqrjnnRE8kuFcx2GtLKmIlDQINoQVZES+J3HEFg?=
 =?iso-8859-1?Q?y1mi1O0+NN0exbX58cNbN1B+yUT64zdp9rNhcy/zjzUQrQ2ZjCek12wMb+?=
 =?iso-8859-1?Q?sChAhuAeZ7xj8QRDk6xPVAS0Q1uXxS8M5+vXzQ8z7BIKT3BCUCE6yG1H+A?=
 =?iso-8859-1?Q?NYzo3UwFgYx0ktdY8pEAmAK2hxENtriAsAQ2Et0as/8e3RaNn7ECTIDutj?=
 =?iso-8859-1?Q?J4jR+sYCZebUeHhZMukms3v/RvC+E91EYnK7Y182MYk4fmQTNYhCkq3KWP?=
 =?iso-8859-1?Q?aa0V8HEDHGPTd16WlZoTEt2M8D9YGxvrLAyyjjf5q1M2Yu3kSZ+TgOkAmB?=
 =?iso-8859-1?Q?Zwt55gXdO12LfaqHiK77pTyEVNt9pZrMu9mabX5GyjxahPop8/HgGLnQ+L?=
 =?iso-8859-1?Q?qvUHd71ng/LTnnPKTGmeONOZ9Age2oHyxisBl9gWaIHdLDDuFFbawbOoeD?=
 =?iso-8859-1?Q?xT61xG8f03JtsTUfgt4EXkTzK6ARmA4kqv4L7MFRVY6YiUOzMPSAbfay28?=
 =?iso-8859-1?Q?jFNGo7paZS1m2MH8Ow4Po2pUnUhUt35fwRFwH5ed4lmWe1m8Cyq3+Jzd1E?=
 =?iso-8859-1?Q?62S+1ocQajtUnJYo6hBomOvNpeviki/23cW05vwh+idRuQw40131/FSWok?=
 =?iso-8859-1?Q?5MDq98dBa1+KFu7vxhIHS9EchQodOstumv/RuFB1u/EgsQQzs4ysFrpr8H?=
 =?iso-8859-1?Q?t7n5l0H+oyQC3OTayecwyBoaLWJ1ljN8N2Lgcdn7JZCp0vtupwIixrZ1GR?=
 =?iso-8859-1?Q?//+3oDsYjHcblTHxwnqf58+RAxw3jaXVWBdd/wIh9eEVa3+hhEdta3fNZ4?=
 =?iso-8859-1?Q?/Wx8Gu6dtL5csQuI4wnP2R7mSGdCy6h38A9v1rmoaOAUGIgSBIbZynBVci?=
 =?iso-8859-1?Q?BG46XK7IJuRNK9dXsLq8fHR+NiA4BGN348eaoQ5eYxoBfWoSJAo2tqIUrS?=
 =?iso-8859-1?Q?fhUxHa3uAqfEJR8tb1XCFRFjHnnisRILdvBci2mH3K77GksIrJxik6DdXG?=
 =?iso-8859-1?Q?i+Oca/gs3xrrsMTngMd+tR4ZR3Jkpl4R4eJeEaz+8MIca2h1JTx5XNvh/4?=
 =?iso-8859-1?Q?QnOrFge2PklH2g01ijcu+4g3w5NAHHMBfmgp0j8Xpeba/q3EpISAemW/Cx?=
 =?iso-8859-1?Q?dMXm3hYqr3gcigPZA3IC2JcGucoSJeOsBVy5M1rqX0NA3w3aYXVamFq9ab?=
 =?iso-8859-1?Q?L41ETax6NxkVtX+j3Qsg+/eWMQsviolSTJOUtir+LMdxT0pG4u017hNOaj?=
 =?iso-8859-1?Q?uNvE8ESnejl3TLWKDqevv/XX+tZodFcVpsIM+bRHsKGw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB3519.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?cW1ycfztMleEdrI3b+2lc9e8E9Df8/qaGUUS4UDhMGXPh0LDjsyUrcNdCV?=
 =?iso-8859-1?Q?+fwxrTmGfDD7DfHXIlduAlaMVwgbGCSrb9E8lF1YCPrELTXovh5TrcJDfj?=
 =?iso-8859-1?Q?b7xzb+silvS1ngZB1J+SpvcD3pFgKN24HCG8O99j9zwskDLdPGkT28adt5?=
 =?iso-8859-1?Q?Go+34+slXoDfoGFvGbrEQoSdeqk/nqKd1ofN3FnT4y6c1W2tRAdhQHjq+g?=
 =?iso-8859-1?Q?n9xIdH+Z08fKfyGy/Oht3VIZSD8aApe9tj6caIPOqCG/r7lnlR34uPNMV9?=
 =?iso-8859-1?Q?ZKKqa75CkOtHpm+RNw6XS9nRYqes6YauznFIrYq00D9konlwhaDssL32uF?=
 =?iso-8859-1?Q?3N8JJyMeHj6XGJFeLdcXY5wpbc/EWkdEdlRRl6aGo7qTio2jPpzbVmxOpt?=
 =?iso-8859-1?Q?UKFiaV8BiCj6tybPOUPYggRSPEmpPeuELskdM+zCp6h9lWAvVTo1VlrK+G?=
 =?iso-8859-1?Q?9Lz7KsB7HM5xhpJcTWbC+ToVdhZczt0IwpHZYozluv/9oJGkG3KzzHwCI0?=
 =?iso-8859-1?Q?mD+Z/AIl/6PgBMFXqsCzg8yHnQ9DlSSp+iYcnVag8NhGGSaSh4+cuTnxMr?=
 =?iso-8859-1?Q?gDijzd4lba+N8UIlZ4tB39k81kFU5jMyWMjVbwxXJncuo5we7mNkU4ZUYn?=
 =?iso-8859-1?Q?phknidqYYG0s1IoWjJBTi8o3oUq56ipBNCJdOxqpjIW5fcC3XaxTb7TW6l?=
 =?iso-8859-1?Q?Vtlr1SV4fQpIpSZgc2b1jk2eUJ56nMgEHLdOqJvZT6Ge/b7ySTHeOU4wqN?=
 =?iso-8859-1?Q?k5j/Ki17Drx81dKR9RldbdtZoqhpWYN2CtFtWraWajfoQgE8E9xws22GQr?=
 =?iso-8859-1?Q?rs5gvpSxOPVRY3vVPUR872DzbmICGS+m9YMSJZs8J0F6DJFdhx0HXTy6IJ?=
 =?iso-8859-1?Q?GWAVqDlyESlH/v0NVPmVBmexQQGBc8YV3P/G5myMXhnoPCBC5YZTYkOVAW?=
 =?iso-8859-1?Q?qcq5vaBtuhSh8Izxq2cBeGjuQnqm3agEkEdzI0gvsAXPhkf75pDlKqZ6jp?=
 =?iso-8859-1?Q?+D7UKgEBECqhW9jjBBsrJr+9rujFS/uOgv3QRB+4gJMWvCuqyhivSV3NpW?=
 =?iso-8859-1?Q?5bEHUCK0puZiR57DoB1Ls1m1iVmwPFLZhQBocwiZJiuK2Vt0jkz7th5v3c?=
 =?iso-8859-1?Q?BrhU38Vg0Aiuyw5IKK/WxMRXp3ATKH58rFQMfUR79WeRmsd4S6xjmmKWpc?=
 =?iso-8859-1?Q?1mHsWQE17r+aKv6v2TRGb/3xLnrecBjHGoee0YcO58wuyQO6eNB+ahgTi7?=
 =?iso-8859-1?Q?e1M6M7RFsNr3ZQTsV8bS2Z7zKSUPvXr3w2d/Mare0XsBMQ+AOqvljSX3hY?=
 =?iso-8859-1?Q?tlg3ObfR8NdIs3aRptbipWxF8+t04s5N6DAYlvU5JD+llctuDpZlXWy+6i?=
 =?iso-8859-1?Q?ljmJYC+ezzB9ZYv2LDjtT26ZQDDgk+WgfBucB7iZv2FqihhE+e26pD5pMU?=
 =?iso-8859-1?Q?8iWOf2Tt82pQ/Y/VWPi1g2qp81wEGSaq/fBKj5YdGmukNZiOicgoaCC6mX?=
 =?iso-8859-1?Q?k2OJk3ZdBKHUiyJO7PE9zCV3evwpQmOr2OwhI0O8N//z8XfVHDqe0k49S2?=
 =?iso-8859-1?Q?LuPzIfbhF9/Pc2gdEGKmBh6aF27YtWTfAlz3fptDpITGcE2RQq+xqFqh/d?=
 =?iso-8859-1?Q?ChWrAsovuFARAE/mxQMCLYAWB601OzhntMMH9dKlvpeAd9snI7+JF8mA?=
 =?iso-8859-1?Q?=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b26001dd-c0c4-4cef-5eeb-08ddc5034b79
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2025 07:26:49.7878
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vHq9NsdwEvf4TVzdY0rz0BdXQSNlij+nUU30pM8VFPjGMU8trIRZsKQIG6KEIP9Ynzfj+Ql8Kht4Vc5/VwiN6KSHZH80dYKqtSvrykJ+SVZxUg9OZr895op96xWmGzTN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN5P287MB4241

Hi Andy,=0A=
=0A=
> On Wed, Jul 16, 2025 at 07:14:17PM +0530, Hardevsinh Palaniya wrote:=0A=
> > Add a v4l2 subdevice driver for the Omnivision OV2735 sensor.=0A=
> >=0A=
> > The Omnivision OV2735 is a 1/2.7-Inch CMOS image sensor with an=0A=
> > active array size of 1920 x 1080.=0A=
> >=0A=
> > The following features are supported:=0A=
> > - Manual exposure an gain control support=0A=
> > - vblank/hblank control support=0A=
> > - Test pattern support control=0A=
> > - Supported resolution: 1920 x 1080 @ 30fps (SGRBG10)=0A=
> =0A=
> ...=0A=
> =0A=
> > +static int ov2735_page_access(struct ov2735 *ov2735,=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 u32 reg, void *val, int *err, bool is_read)=0A=
> > +{=0A=
> > +=A0=A0=A0=A0 u8 page =3D (reg >> CCI_REG_PRIVATE_SHIFT) & 0xff;=0A=
> > +=A0=A0=A0=A0 u32 addr =3D reg & ~CCI_REG_PRIVATE_MASK;=0A=
> > +=A0=A0=A0=A0 int ret =3D 0;=0A=
> > +=0A=
> > +=A0=A0=A0=A0 if (err && *err)=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return *err;=0A=
> > +=0A=
> > +=A0=A0=A0=A0 mutex_lock(&ov2735->page_lock);=0A=
> > +=0A=
> > +=A0=A0=A0=A0 /* Perform page access before read/write */=0A=
> > +=A0=A0=A0=A0 if (ov2735->current_page !=3D page) {=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D cci_write(ov2735->cci, OV=
2735_REG_PAGE_SELECT, page, &ret);=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto err_=
mutex_unlock;=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ov2735->current_page =3D page;=0A=
> > +=A0=A0=A0=A0 }=0A=
> > +=0A=
> > +=A0=A0=A0=A0 if (is_read)=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D cci_read(ov2735->cci, add=
r, (u64 *)val, err);=0A=
> > +=A0=A0=A0=A0 else=0A=
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D cci_write(ov2735->cci, ad=
dr, *(u64 *)val, err);=0A=
> > +=0A=
> > +err_mutex_unlock:=0A=
> =0A=
> > +=A0=A0=A0=A0 if (ret && err)=0A=
> =0A=
> Why do you need to check for ret !=3D 0?=0A=
=0A=
To prevents overwriting *err with 0 on successful operations, which could =
=0A=
obscure previous errors. =0A=
=0A=
Best Regards,=0A=
Hardev=

