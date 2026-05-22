Return-Path: <linux-media+bounces-62596-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHAnJ9k9EGrzVAYAu9opvQ
	(envelope-from <linux-media+bounces-62596-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 13:28:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 527865B2FE7
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 13:28:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0FFDC3076B04
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 11:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 235C72C028F;
	Fri, 22 May 2026 11:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="DpK/pXwh"
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020078.outbound.protection.outlook.com [52.101.225.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18963D4117;
	Fri, 22 May 2026 11:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779448382; cv=fail; b=NucOP8BYzJ5UpeeMWIAZjMm+yN0bDRBVl2uE8oHWARkmsWnbKih4aD26//EMGsbfcOKRWVnG7/RVipe7el2i1TFcT1jaD4Z4tWhpNXrVa/Kp1hF0h8yCleKsevQHPNQqu06NH6JsbM7v2gxb6N1tQ85E97Mm06XXfIpmitkPUbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779448382; c=relaxed/simple;
	bh=M+pcG/IOfo2eODAFqVdzSryXAYXo9P5cUKS7RvWKQGo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jlvnRAPDJJvcZiKMQa4sxcmfCg3n0PZ6UTd/9AK1GzJVOCkldaLsgRwP1Mj5qLbJmIqTNMX6jzF5zYlWOM1jf09iXUAHUibSwhdbZuIsw32Il84PuEBO1NiDLAMeN6FfSEffXjohnA2BVwRbaXZCf2+RzxDX3W+gbxIcVJM+PoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=DpK/pXwh; arc=fail smtp.client-ip=52.101.225.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XwBnfnhuQHBFR60IL8OFS7Cbpnajng8v71qQFKLYn5Xh4fob+/cELBuv5J8kFVQpXR+LqheR8I5K/aPG2gDzJGiM4hz0eRN7KBhNPf8WuHoEXfqChvfsLCUE0lflt+0dVKZlMEJ6OQB9zBEQZX2QrJmCZZtPt8SaKztQ9OmEkGE3FXa4GPRXv8dfIDECAKD5pOWvnMtjIdYheyMVqcowjsn6W1aISff2IkudxTzUuDTW5T2RKT25CpNZlTVYJW7hiySNEsgI6SDlg5bZtRGiIoS23f9qfXrz+8JhjlKLVu7rXE2kKvMtJmLDY3RHE+hL8iNSdPSO5Vwpm+wPWKQtew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=14sTe+VIzYoBTTOX/YhgznUl6lQX7ePUSBUWv42Wu2o=;
 b=Lrwu3O8ZlXJM7yul1nAsb+ZdMCLx7eSBiGOzB6jyCMetaqePBzm9IPFNYLMP16zuHbhrV9o+prIe/YJEipthdF4vgntfiakRg6TX5nIlpxPb6S1I/jjADnzN4sVLbhfrpkk+cS87OLlSnLNuXqn7qyRYWEsM4cvUlz+V5dUy2/qR4okdn4gVKpgPwl8kpMgIc9rT5ozgirzbjN+7RTM7p1k40zPfMj0Go0rvLsz/yrHIiaDnXbMLC6w/dCHoo3vCVbAoOmYO1xPjTaMtfO7qA0Z2eARVD9gnYTm9roRnuxOhXAi6ENmBw0Alp75/+dgxH4rTFlvUzOda5E1IYul/Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=14sTe+VIzYoBTTOX/YhgznUl6lQX7ePUSBUWv42Wu2o=;
 b=DpK/pXwhRqbQ7AMPFlOyy4baadhuF15ZDi+IbooiNK7GE2GjWESckTsCFfQcxAt6mQfo6mXCx/PZf66guoG+OZkrAiZMifsGnFi3lhzqniOu6tf+Qo4vCq7BdjUUU29F/GCQHWXS7SdCnOKsf+BJZBWb+sgJbMc7GTbTMT8JZVbNw6i5ZLxjHbJSUnNOiBpeKTg46I65PFn3xXZD6nMFzjy8qRd4iVJ/GCOUZiObefgTLGx8c/p1Rlh1Vi1sy9AdLYS+0HO77re+Nh9IqCVSG4QTid9boYhHDyce/B3LF7Go3DZFVCEZ6UvGrYkYI39AXWaL/P9DtgGDDnLOT1Gkww==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MAZP287MB0639.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:111::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 11:12:53 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 11:12:53 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Kate Hsuan <hpa@redhat.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans
 de Goede <johannes.goede@oss.qualcomm.com>, Serin Yeh <serin.yeh@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v3 2/3] media: i2c: imx471: Add Sony IMX471 image sensor
 driver
Thread-Topic: [PATCH v3 2/3] media: i2c: imx471: Add Sony IMX471 image sensor
 driver
Thread-Index: AQHc6ZnV8EzqZpFcuUOHpM8Iev0rOrYZ4qOn
Date: Fri, 22 May 2026 11:12:53 +0000
Message-ID:
 <PN3P287MB182919EBD2C36CBBC0A8D8598B0F2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260522031121.11968-1-hpa@redhat.com>
 <20260522031121.11968-3-hpa@redhat.com>
In-Reply-To: <20260522031121.11968-3-hpa@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MAZP287MB0639:EE_
x-ms-office365-filtering-correlation-id: f0f5d850-11f2-4f6a-b937-08deb7f31190
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|4022899009|1800799024|376014|13003099007|3023799007|4143699003|56012099003|18092099006|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 95WRwO1vmRE9WS3NGih+Dz+c87tDJmw7ehryv2OIlkmbxsxSADx+AMAsrY7rbZmT/xnpLh0D7XG6CsIpnVwx665W96767MJMhIvfyl/DyfPNz6IOZlU3D3aTqm2III3ZbWl6SG3GEJDykzzcJVK3OC7e+lYJmY9sFBm9BJZOc1PbVyzv35GFfTpofGWkDh5l6o06SBtXns0xWLXdMtWsL9plFnszXAbeJDpZsOpbs70DoEpr5FcKVIJRPciNg1Fl94xdBYCJlYUhs8NqGxy/jjIcI0vKNz+V7WMhZ1Lq1LWDwGX6oO9mHLBp8s9WhDpxhF9LKr8DYhFsV9YAi1Vu7lMn/OS8jFxzFRu5n5SF74h25WkltL2vQwxWMrwiPbuxp3enti/Fm2UFIXGojmtI2fumMaw79NwphOmjjd7bxWHyDXHravKURtONrDC8ZdTAbx8JV7r2v+NcsHSdBkIf3X8fgvbGV34nDzTlTgvvmN+PW2QhRnj3G2NCTO/Kpg/bgsuBWggD/Ifo1JJo1Qz5x6Ke70eMI0WRzGG+P6wp9Mup8CLwuDqqM81WS0IGbm3NkyVNPMr+bIye8jCLwsCjXMK0fsIqnsIcDPEjGNmlMFb14V10nxkODE+AVVEFfsIjcBRaSavDtffA0F0zHk8ysejvAzDKgR7zks7qTeo11XNlgzJMSleDJgP9fm3mPYr3na2QQr2hupmliqr0v+XwCTTFQBY06YsIkuJbQGMvw8510o9juectg4+BxaGyj7Cd
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(1800799024)(376014)(13003099007)(3023799007)(4143699003)(56012099003)(18092099006)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?fBJ4hGzfwiYtNRUPvIuXgvKp/t5zRDvOKlP85fvYzF0tzp2HXe346T0Oua?=
 =?iso-8859-1?Q?wmNRWJ3pagX4UbTcH5yAenfWlEMi1moPLsC5iFKXBT1ezjxQ7imfWLxe2V?=
 =?iso-8859-1?Q?DdIJJbuljk0q+oz7JKUUO0+mJIZXF6vP8L/35ELSe8Ux1H5DNgZQHxqI/2?=
 =?iso-8859-1?Q?MJEHl+ahD19Ca1SNAq5qyKWN5qwqRDj90ViwMd88xGCoKXMPxlEqJ5w7JS?=
 =?iso-8859-1?Q?Fq0VXz7duJB5vfWkoApMH0KRD0sy9YM7amJmwHOOkQcwim0no1AxR9/Wa+?=
 =?iso-8859-1?Q?uorEKD8Inq8DxSQ/1Cv5jsOXtXhSEbg7jqvcDNuy4JInNG6xuTVzQS8inl?=
 =?iso-8859-1?Q?9uAbfc4rGFoaMy0j/ipyKXlQ701hEXNinuoXytRJgkJPndO/gkYoFJogu6?=
 =?iso-8859-1?Q?kY3TlsISxuK6hj9wVpgTRfo7+5cXW4OP0wLvzvQUn0uXtXrHVdPpKhylR/?=
 =?iso-8859-1?Q?95pFgC3VyN3dYXJPA0P64EEI+lpf5IRoWqVDGzoTlmwjG8APERjFhX5FlA?=
 =?iso-8859-1?Q?ZS6qOkW2ca5Ex0Oa7/msD3imXDBlVTUj5JvlrSO8odG9H986PKyKU9rYmT?=
 =?iso-8859-1?Q?Ld40te7PMotQhy6YsK8H9PJ02RRsKnYZqy/bSn2KcQHn+SD4jL9I3DvP3f?=
 =?iso-8859-1?Q?W+ODef62DV33Fwh3OCrfFY3jUk/gRCPObvvLLJCU97KtSn9Q6Sw5WXb6iU?=
 =?iso-8859-1?Q?9qqbEyXusAQYjgMhxm2ufXYROoRadCcdQMpbwxUZOIxGmhuYyRhXtqgXm5?=
 =?iso-8859-1?Q?rewyeGH108lvqQ6b2F4HMppJjsmTXyRPx6oC064+LC6kBPXBZcM7mM/C64?=
 =?iso-8859-1?Q?vDn7btpre4V6XDX5ZaKSlrabX52HPP7pRp9hS3WRKURENrJFCE3UQvTM1u?=
 =?iso-8859-1?Q?CBXuYAJEevs6X/wLKnU6mUF+f+DXhK9+w137Fd2eOjuR02SSeHCxvLhmYD?=
 =?iso-8859-1?Q?XPqD9LbeSprXlewWzA7QjSJYFcygdXWTW2D5cxLYT86zzEgtHWYcd5jCAD?=
 =?iso-8859-1?Q?7mT95Nf6eoHttB5daa3h+GiUjNhyELfIQNIBY82zZzXSBkqzalo4wz9sCP?=
 =?iso-8859-1?Q?7bzRUn7y/ZgoKN2V7nLhdTtYn8qZyvOwpYj57oU5FXReug6y82A3q39cJp?=
 =?iso-8859-1?Q?oLLvqdjCVzQzYLUFz1yHyCGtH1R95wv7wA4in/yxEpOz8E4mRekRxavb9t?=
 =?iso-8859-1?Q?lZEQdTNAj3i9Y1lc0uCU/kKIH+Tn6Q8RrLAER0RQnVS8WUOrbF/3fsTIlw?=
 =?iso-8859-1?Q?M4tmziNiGpcT/YCZb6NQJXWzAXjsZrXoGbIQvO4ta5H/ozUsabcit+uPhn?=
 =?iso-8859-1?Q?fKscVWNXOed7779J4vgWFFrAzdEl0V2TtW+Vp4MdxlgT6cmLzUCkX/QveW?=
 =?iso-8859-1?Q?Vn3Fmgg+rweaapFx+btgG6QgR5iB1pW36vUAsiyA+grdiD7uzx4kmvKDxR?=
 =?iso-8859-1?Q?nLDQri7VsRI3tr2aUEFQw0ALdFboTNHGM2k8mLQPQIAy1v2ee0qLVc/fZy?=
 =?iso-8859-1?Q?OeTsCAuvI9TraPukO6V8rbrJxjX6JVsxdJ/552FMjmmhytTjR9v70jEbMy?=
 =?iso-8859-1?Q?lfY6VleB9LUij47YH/SJrIM2qJ3JdOgSxip2lBRnzhuCuTvYr6C6QSPj7I?=
 =?iso-8859-1?Q?LOMY1dbZPZmUiOBWOPaXOBmIEULoh/6Zzo/E3gQhrIF+8ml9dbaqd4C+Ut?=
 =?iso-8859-1?Q?WNnm78WV3pHFGECT6SdoOFUi776kIKevI/uVO02sU2tV0GtP+t6PgKhpYt?=
 =?iso-8859-1?Q?MY4kVPK0O9LwkmWxsxpeJH4Lqxpuql+Y4PLiaLEb/axsM2wDelbKI2mEGc?=
 =?iso-8859-1?Q?IrO+c20vag=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f0f5d850-11f2-4f6a-b937-08deb7f31190
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2026 11:12:53.2461
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5wxHP0GuPWtzDLfRxrFeZcC3Uy+hfobQ/E15rh6hAXHQD4bfwWskLtAcSGhuQzCBGadxXpvJqnyeb9f2qHsDPCe6U43I0XqZ/dJekEuJQMc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZP287MB0639
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62596-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,PN3P287MB1829.INDP287.PROD.OUTLOOK.COM:mid,siliconsignals.io:dkim]
X-Rspamd-Queue-Id: 527865B2FE7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Kate,=0A=
=0A=
I noticed a few issues. Please check the comments below.=0A=
=0A=
> Add a new driver for Sony imx471 camera sensor. It is based on=0A=
> Jimmy Su <jimmy.su@intel.com> implementation and the driver can be found=
=0A=
> in the following URL.=0A=
> https://github.com/intel/ipu6-drivers/commits/master/drivers/media/i2c/im=
x471.c=0A=
>=0A=
> This sensor can be found on Lenovo X9-14 and X9-15 laptop and it is a par=
t=0A=
> of IPU7 solution. The driver was tested on Lenovo X9-14 and X9-15 laptops=
.=0A=
>=0A=
> Signed-off-by: Kate Hsuan <hpa@redhat.com>=0A=
> ---=0A=
>  MAINTAINERS                |    6 +=0A=
>  drivers/media/i2c/Kconfig  |   10 +=0A=
>  drivers/media/i2c/Makefile |    1 +=0A=
>  drivers/media/i2c/imx471.c | 1006 ++++++++++++++++++++++++++++++++++++=
=0A=
>  4 files changed, 1023 insertions(+)=0A=
>  create mode 100644 drivers/media/i2c/imx471.c=0A=
>=0A=
> diff --git a/MAINTAINERS b/MAINTAINERS=0A=
> index 1126fdd639ad..d597337e7c24 100644=0A=
> --- a/MAINTAINERS=0A=
> +++ b/MAINTAINERS=0A=
> @@ -24735,6 +24735,12 @@ T:     git git://linuxtv.org/media.git=0A=
>  F:     Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml=0A=
>  F:     drivers/media/i2c/imx415.c=0A=
>=0A=
> +SONY IMX471 SENSOR DRIVER=0A=
> +M:     Kate Hsuan <hpa@redhat.com>=0A=
> +L:     linux-media@vger.kernel.org=0A=
> +S:     Maintained=0A=
> +F:     drivers/media/i2c/imx471.c=0A=
> +=0A=
>  SONY MEMORYSTICK SUBSYSTEM=0A=
>  M:     Maxim Levitsky <maximlevitsky@gmail.com>=0A=
>  M:     Alex Dubov <oakad@yahoo.com>=0A=
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig=0A=
> index 5eb1e0e0a87a..1c28c498a9f1 100644=0A=
> --- a/drivers/media/i2c/Kconfig=0A=
> +++ b/drivers/media/i2c/Kconfig=0A=
> @@ -287,6 +287,16 @@ config VIDEO_IMX415=0A=
> 	  To compile this driver as a module, choose M here: the=0A=
> 	  module will be called imx415.=0A=
>=0A=
> +config VIDEO_IMX471=0A=
> +               tristate "Sony IMX471 sensor support"=0A=
> +               select V4L2_CCI_I2C=0A=
> +               help=0A=
> +                 This is a Video4Linux2 sensor driver for the Sony=0A=
> +                 IMX471 camera.=0A=
> +=0A=
> +                 To compile this driver as a module, choose M here: the=
=0A=
> +                 module will be called imx471.=0A=
> +=0A=
=0A=
The indentation is wrong here. Please fix it.=0A=
=0A=
>  config VIDEO_MAX9271_LIB=0A=
> 	tristate=0A=
>=0A=
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile=0A=
> index a3a6396df3c4..0539e9171030 100644=0A=
> --- a/drivers/media/i2c/Makefile=0A=
> +++ b/drivers/media/i2c/Makefile=0A=
> @@ -61,6 +61,7 @@ obj-$(CONFIG_VIDEO_IMX335) +=3D imx335.o=0A=
>  obj-$(CONFIG_VIDEO_IMX355) +=3D imx355.o=0A=
>  obj-$(CONFIG_VIDEO_IMX412) +=3D imx412.o=0A=
>  obj-$(CONFIG_VIDEO_IMX415) +=3D imx415.o=0A=
> +obj-$(CONFIG_VIDEO_IMX471) +=3D imx471.o=0A=
>  obj-$(CONFIG_VIDEO_IR_I2C) +=3D ir-kbd-i2c.o=0A=
>  obj-$(CONFIG_VIDEO_ISL7998X) +=3D isl7998x.o=0A=
>  obj-$(CONFIG_VIDEO_KS0127) +=3D ks0127.o=0A=
> diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c=0A=
> new file mode 100644=0A=
> index 000000000000..f3c7fdce2d50=0A=
> --- /dev/null=0A=
> +++ b/drivers/media/i2c/imx471.c=0A=
> @@ -0,0 +1,1006 @@=0A=
> +// SPDX-License-Identifier: GPL-2.0=0A=
> +/*=0A=
> + * imx471.c - imx471 sensor driver=0A=
> + *=0A=
> + * Copyright (C) 2025 Intel Corporation=0A=
> + * Copyright (C) 2026 Kate Hsuan <hpa@redhat.com>=0A=
> + */=0A=
> +=0A=
> +#include <linux/clk.h>=0A=
> +#include <linux/delay.h>=0A=
> +#include <linux/i2c.h>=0A=
> +#include <linux/module.h>=0A=
> +#include <linux/pm_runtime.h>=0A=
> +#include <linux/regulator/consumer.h>=0A=
> +#include <linux/unaligned.h>=0A=
> +#include <media/v4l2-cci.h>=0A=
> +#include <media/v4l2-ctrls.h>=0A=
> +#include <media/v4l2-device.h>=0A=
> +#include <media/v4l2-event.h>=0A=
> +#include <media/v4l2-fwnode.h>=0A=
> +=0A=
> +#define IMX471_REG_MODE_SELECT                 CCI_REG8(0x0100)=0A=
> +#define IMX471_MODE_STANDBY                    0x00=0A=
> +#define IMX471_MODE_STREAMING                  0x01=0A=
> +=0A=
> +/* Chip ID */=0A=
> +#define IMX471_REG_CHIP_ID                     CCI_REG16(0x0016)=0A=
> +#define IMX471_CHIP_ID                         0x0471=0A=
> +=0A=
> +/* V_TIMING internal */=0A=
> +#define IMX471_REG_FLL                         CCI_REG16(0x0340)=0A=
> +#define IMX471_FLL_MAX                         0xffff=0A=
> +=0A=
> +/* Exposure control */=0A=
> +#define IMX471_REG_EXPOSURE                    CCI_REG16(0x0202)=0A=
> +#define IMX471_EXPOSURE_MIN                    1=0A=
> +#define IMX471_EXPOSURE_STEP                   1=0A=
> +#define IMX471_EXPOSURE_DEFAULT                        0x04f6=0A=
=0A=
Better to use a decimal value here.=0A=
=0A=
> +=0A=
> +/*=0A=
> + *  the digital control register for all color control looks like:=0A=
> + *  +-----------------+------------------+=0A=
> + *  |      [7:0]      |       [15:8]     |=0A=
> + *  +-----------------+------------------+=0A=
> + *  |    0x020f      |       0x020e     |=0A=
> + *  --------------------------------------=0A=
> + *  it is used to calculate the digital gain times value(integral + frac=
tional)=0A=
> + *  the [15:8] bits is the fractional part and [7:0] bits is the integra=
l=0A=
> + *  calculation equation is:=0A=
> + *      gain value (unit: times) =3D REG[15:8] + REG[7:0]/0x100=0A=
> + *  Only value in 0x0100 ~ 0x0FFF range is allowed.=0A=
> + *  Analog gain use 10 bits in the registers and allowed range is 0 ~ 96=
0=0A=
> + */=0A=
> +/* Analog gain control */=0A=
> +#define IMX471_REG_ANALOG_GAIN                 CCI_REG16(0x0204)=0A=
> +#define IMX471_ANA_GAIN_MIN                    0=0A=
> +#define IMX471_ANA_GAIN_MAX                    960=0A=
> +#define IMX471_ANA_GAIN_STEP                   1=0A=
> +#define IMX471_ANA_GAIN_DEFAULT                        0=0A=
> +=0A=
> +/* Digital gain control */=0A=
> +#define IMX471_REG_DPGA_USE_GLOBAL_GAIN                CCI_REG16(0x3ff9)=
=0A=
> +#define IMX471_REG_DIG_GAIN_GLOBAL             CCI_REG16(0x020e)=0A=
> +#define IMX471_DGTL_GAIN_MIN                   256=0A=
> +#define IMX471_DGTL_GAIN_MAX                   4095=0A=
> +#define IMX471_DGTL_GAIN_STEP                  1=0A=
> +#define IMX471_DGTL_GAIN_DEFAULT               256=0A=
> +=0A=
> +#define IMX471_VALUE_08BIT                     1=0A=
=0A=
Unused macro, please remove it.=0A=
=0A=
> +=0A=
> +/* HFLIP and VFLIP control */=0A=
> +#define IMX471_REG_ORIENTATION                 CCI_REG8(0x0101)=0A=
> +#define IMX471_HFLIP_BIT                       BIT(0)=0A=
> +#define IMX471_VFLIP_BIT                       BIT(1)=0A=
> +=0A=
> +/* Default exposure margin */=0A=
> +#define IMX471_EXPOSURE_MARGIN                 18=0A=
=0A=
Please move this macro to the exposure block above.=0A=
=0A=
> +=0A=
> +/* Horizontal crop window offset */=0A=
> +#define IMX471_REG_H_WIN_OFFSET                        CCI_REG8(0x0409)=
=0A=
> +=0A=
> +/* Vertical crop window offset */=0A=
> +#define IMX471_REG_V_WIN_OFFSET                        CCI_REG8(0x034b)=
=0A=
> +=0A=
> +/* Test Pattern Control */=0A=
> +#define IMX471_REG_TEST_PATTERN                        CCI_REG8(0x0600)=
=0A=
> +#define IMX471_TEST_PATTERN_DISABLED           0=0A=
> +#define IMX471_TEST_PATTERN_SOLID_COLOR                1=0A=
> +#define IMX471_TEST_PATTERN_COLOR_BARS         2=0A=
> +#define IMX471_TEST_PATTERN_GRAY_COLOR_BARS    3=0A=
> +#define IMX471_TEST_PATTERN_PN9                        4=0A=
> +=0A=
> +/* default link frequency and external clock */=0A=
> +#define IMX471_LINK_FREQ_DEFAULT               200000000LL=0A=
> +#define IMX471_EXT_CLK                         19200000=0A=
> +#define IMX471_LINK_FREQ_INDEX                 0=0A=
> +=0A=
> +/* IMX471 native and active pixel array size */=0A=
> +#define IMX471_NATIVE_WIDTH                    4672=0A=
> +#define IMX471_NATIVE_HEIGHT                   3512=0A=
> +#define IMX471_PIXEL_ARRAY_LEFT                        8=0A=
> +#define IMX471_PIXEL_ARRAY_TOP                 8=0A=
> +#define IMX471_PIXEL_ARRAY_WIDTH               4656=0A=
> +#define IMX471_PIXEL_ARRAY_HEIGHT              3496=0A=
> +=0A=
> +#define to_imx471(_sd) container_of_const(_sd, struct imx471, sd)=0A=
> +=0A=
> +static const char * const imx471_supply_name[] =3D {=0A=
> +       "avdd",=0A=
> +};=0A=
> +=0A=
> +#define IMX471_NUM_SUPPLIES                    ARRAY_SIZE(imx471_supply_=
name)=0A=
> +=0A=
> +/* Mode : resolution and related config&values */=0A=
> +struct imx471_mode {=0A=
> +       /* Frame width */=0A=
> +       u32 width;=0A=
> +       /* Frame height */=0A=
> +       u32 height;=0A=
> +=0A=
> +       /* V-timing */=0A=
> +       u32 fll_def;=0A=
> +       u32 fll_min;=0A=
> +=0A=
> +       /* H-timing */=0A=
> +       u32 llp;=0A=
> +=0A=
> +       /* index of link frequency */=0A=
> +       u32 link_freq_index;=0A=
> +=0A=
> +       /* Default register values */=0A=
> +       const struct cci_reg_sequence *default_mode_regs;=0A=
> +       const int default_mode_regs_length;=0A=
> +};=0A=
> +=0A=
> +struct imx471 {=0A=
> +       struct v4l2_subdev sd;=0A=
> +       struct media_pad pad;=0A=
> +=0A=
> +       struct v4l2_ctrl_handler ctrl_handler;=0A=
> +       /* V4L2 Controls */=0A=
> +       struct v4l2_ctrl *link_freq;=0A=
> +       struct v4l2_ctrl *pixel_rate;=0A=
> +       struct v4l2_ctrl *vblank;=0A=
> +       struct v4l2_ctrl *hblank;=0A=
> +       struct v4l2_ctrl *vflip;=0A=
> +       struct v4l2_ctrl *hflip;=0A=
> +       struct v4l2_ctrl *exposure;=0A=
> +=0A=
> +       struct gpio_desc *reset_gpio;=0A=
> +       struct regulator_bulk_data supplies[IMX471_NUM_SUPPLIES];=0A=
> +       struct clk *img_clk;=0A=
> +=0A=
> +       struct device *dev;=0A=
> +       struct regmap *regmap;=0A=
> +};=0A=
> +=0A=
> +static const struct cci_reg_sequence imx471_global_regs[] =3D {=0A=
> +       { CCI_REG8(0x0136), 0x13 },=0A=
> +       { CCI_REG8(0x0137), 0x33 },=0A=
> +       { CCI_REG8(0x3c7e), 0x08 },=0A=
> +       { CCI_REG8(0x3c7f), 0x05 },=0A=
> +       { CCI_REG8(0x3e35), 0x00 },=0A=
> +       { CCI_REG8(0x3e36), 0x00 },=0A=
> +       { CCI_REG8(0x3e37), 0x00 },=0A=
> +       { CCI_REG8(0x3f7f), 0x01 },=0A=
> +       { CCI_REG8(0x4431), 0x04 },=0A=
> +       { CCI_REG8(0x531c), 0x01 },=0A=
> +       { CCI_REG8(0x531d), 0x02 },=0A=
> +       { CCI_REG8(0x531e), 0x04 },=0A=
> +       { CCI_REG8(0x5928), 0x00 },=0A=
> +       { CCI_REG8(0x5929), 0x2f },=0A=
> +       { CCI_REG8(0x592a), 0x00 },=0A=
> +       { CCI_REG8(0x592b), 0x85 },=0A=
> +       { CCI_REG8(0x592c), 0x00 },=0A=
> +       { CCI_REG8(0x592d), 0x32 },=0A=
> +       { CCI_REG8(0x592e), 0x00 },=0A=
> +       { CCI_REG8(0x592f), 0x88 },=0A=
> +       { CCI_REG8(0x5930), 0x00 },=0A=
> +       { CCI_REG8(0x5931), 0x3d },=0A=
> +       { CCI_REG8(0x5932), 0x00 },=0A=
> +       { CCI_REG8(0x5933), 0x93 },=0A=
> +       { CCI_REG8(0x5938), 0x00 },=0A=
> +       { CCI_REG8(0x5939), 0x24 },=0A=
> +       { CCI_REG8(0x593a), 0x00 },=0A=
> +       { CCI_REG8(0x593b), 0x7a },=0A=
> +       { CCI_REG8(0x593c), 0x00 },=0A=
> +       { CCI_REG8(0x593d), 0x24 },=0A=
> +       { CCI_REG8(0x593e), 0x00 },=0A=
> +       { CCI_REG8(0x593f), 0x7a },=0A=
> +       { CCI_REG8(0x5940), 0x00 },=0A=
> +       { CCI_REG8(0x5941), 0x2f },=0A=
> +       { CCI_REG8(0x5942), 0x00 },=0A=
> +       { CCI_REG8(0x5943), 0x85 },=0A=
> +       { CCI_REG8(0x5f0e), 0x6e },=0A=
> +       { CCI_REG8(0x5f11), 0xc6 },=0A=
> +       { CCI_REG8(0x5f17), 0x5e },=0A=
> +       { CCI_REG8(0x7990), 0x01 },=0A=
> +       { CCI_REG8(0x7993), 0x5d },=0A=
> +       { CCI_REG8(0x7994), 0x5d },=0A=
> +       { CCI_REG8(0x7995), 0xa1 },=0A=
> +       { CCI_REG8(0x799a), 0x01 },=0A=
> +       { CCI_REG8(0x799d), 0x00 },=0A=
> +       { CCI_REG8(0x8169), 0x01 },=0A=
> +       { CCI_REG8(0x8359), 0x01 },=0A=
> +       { CCI_REG8(0x9302), 0x1e },=0A=
> +       { CCI_REG8(0x9306), 0x1f },=0A=
> +       { CCI_REG8(0x930a), 0x26 },=0A=
> +       { CCI_REG8(0x930e), 0x23 },=0A=
> +       { CCI_REG8(0x9312), 0x23 },=0A=
> +       { CCI_REG8(0x9316), 0x2c },=0A=
> +       { CCI_REG8(0x9317), 0x19 },=0A=
> +       { CCI_REG8(0xb046), 0x01 },=0A=
> +       { CCI_REG8(0xb048), 0x01 },=0A=
> +};=0A=
> +=0A=
> +static const struct cci_reg_sequence mode_1928x1088_regs[] =3D {=0A=
> +       { CCI_REG8(0x0101), 0x00 },=0A=
> +       { CCI_REG8(0x0112), 0x0a },=0A=
> +       { CCI_REG8(0x0113), 0x0a },=0A=
> +       { CCI_REG8(0x0114), 0x03 },=0A=
> +       { CCI_REG8(0x0342), 0x0a },=0A=
> +       { CCI_REG8(0x0343), 0x00 },=0A=
> +       { CCI_REG8(0x0340), 0x13 },=0A=
> +       { CCI_REG8(0x0341), 0xb0 },=0A=
=0A=
These are V-timing settings. You can drop them since they are already=0A=
being set from the control handler.=0A=
=0A=
> +       { CCI_REG8(0x0344), 0x00 },=0A=
> +       { CCI_REG8(0x0345), 0x00 },=0A=
> +       { CCI_REG8(0x0346), 0x01 },=0A=
> +       { CCI_REG8(0x0347), 0xbc },=0A=
> +       { CCI_REG8(0x0348), 0x12 },=0A=
> +       { CCI_REG8(0x0349), 0x2f },=0A=
> +       { CCI_REG8(0x034a), 0x0b },=0A=
> +       { CCI_REG8(0x034b), 0xeb },=0A=
> +       { CCI_REG8(0x0381), 0x01 },=0A=
> +       { CCI_REG8(0x0383), 0x01 },=0A=
> +       { CCI_REG8(0x0385), 0x01 },=0A=
> +       { CCI_REG8(0x0387), 0x01 },=0A=
> +       { CCI_REG8(0x0900), 0x01 },=0A=
> +       { CCI_REG8(0x0901), 0x22 },=0A=
> +       { CCI_REG8(0x0902), 0x08 },=0A=
> +       { CCI_REG8(0x3f4c), 0x81 },=0A=
> +       { CCI_REG8(0x3f4d), 0x81 },=0A=
> +       { CCI_REG8(0x0408), 0x00 },=0A=
> +       { CCI_REG8(0x0409), 0xc8 },=0A=
> +       { CCI_REG8(0x040a), 0x00 },=0A=
> +       { CCI_REG8(0x040b), 0x6c },=0A=
> +       { CCI_REG8(0x040c), 0x07 },=0A=
> +       { CCI_REG8(0x040d), 0x88 },=0A=
> +       { CCI_REG8(0x040e), 0x04 },=0A=
> +       { CCI_REG8(0x040f), 0x40 },=0A=
> +       { CCI_REG8(0x034c), 0x07 },=0A=
> +       { CCI_REG8(0x034d), 0x88 },=0A=
> +       { CCI_REG8(0x034e), 0x04 },=0A=
> +       { CCI_REG8(0x034f), 0x40 },=0A=
> +       { CCI_REG8(0x0301), 0x06 },=0A=
> +       { CCI_REG8(0x0303), 0x02 },=0A=
> +       { CCI_REG8(0x0305), 0x02 },=0A=
> +       { CCI_REG8(0x0306), 0x00 },=0A=
> +       { CCI_REG8(0x0307), 0x79 },=0A=
> +       { CCI_REG8(0x030b), 0x01 },=0A=
> +       { CCI_REG8(0x030d), 0x02 },=0A=
> +       { CCI_REG8(0x030e), 0x00 },=0A=
> +       { CCI_REG8(0x030f), 0x53 },=0A=
> +       { CCI_REG8(0x0310), 0x01 },=0A=
> +       { CCI_REG8(0x0202), 0x13 },=0A=
> +       { CCI_REG8(0x0203), 0x9e },=0A=
=0A=
Similarly, these are exposure settings. You can drop.=0A=
=0A=
> +       { CCI_REG8(0x0204), 0x00 },=0A=
> +       { CCI_REG8(0x0205), 0x00 },=0A=
=0A=
These are digital gain settings. You can drop.=0A=
=0A=
> +       { CCI_REG8(0x020e), 0x01 },=0A=
> +       { CCI_REG8(0x020f), 0x00 },=0A=
=0A=
These are analog gain settings. You can drop.=0A=
=0A=
> +       { CCI_REG8(0x3f78), 0x01 },=0A=
> +       { CCI_REG8(0x3f79), 0x31 },=0A=
> +       { CCI_REG8(0x3ffe), 0x00 },=0A=
> +       { CCI_REG8(0x3fff), 0x8a },=0A=
> +       { CCI_REG8(0x5f0a), 0xb6 },=0A=
> +};=0A=
> +=0A=
> +static const char * const imx471_test_pattern_menu[] =3D {=0A=
> +       "Disabled",=0A=
> +       "Solid Colour",=0A=
> +       "Eight Vertical Colour Bars",=0A=
> +       "Colour Bars With Fade to Grey",=0A=
> +       "Pseudorandom Sequence (PN9)",=0A=
> +};=0A=
> +=0A=
> +/*=0A=
> + * When adding more than the one below, make sure the disallowed ones wi=
ll=0A=
> + * actually be disabled in the LINK_FREQ control.=0A=
> + */=0A=
> +static const s64 link_freq_menu_items[] =3D {=0A=
> +       IMX471_LINK_FREQ_DEFAULT,=0A=
> +};=0A=
> +=0A=
> +/*=0A=
> + * The Bayer formats for the flipping.=0A=
> + * - no flip=0A=
> + * - h flip=0A=
> + * - v flip=0A=
> + * - h and v flips=0A=
> + */=0A=
> +static const u32 imx471_hv_flips_bayer_order[] =3D {=0A=
> +       MEDIA_BUS_FMT_SRGGB10_1X10,=0A=
> +       MEDIA_BUS_FMT_SGRBG10_1X10,=0A=
> +       MEDIA_BUS_FMT_SGBRG10_1X10,=0A=
> +       MEDIA_BUS_FMT_SBGGR10_1X10,=0A=
> +};=0A=
> +=0A=
> +/* Mode configs */=0A=
> +static const struct imx471_mode imx471_modes[] =3D {=0A=
> +       {=0A=
> +               .width =3D 1928,=0A=
> +               .height =3D 1088,=0A=
> +               .fll_def =3D 1308,=0A=
> +               .fll_min =3D 1308,=0A=
> +               .llp =3D 2328,=0A=
> +               .link_freq_index =3D IMX471_LINK_FREQ_INDEX,=0A=
> +               .default_mode_regs =3D mode_1928x1088_regs,=0A=
> +               .default_mode_regs_length =3D ARRAY_SIZE(mode_1928x1088_r=
egs),=0A=
> +       },=0A=
> +};=0A=
> +=0A=
> +static int imx471_get_regulators(struct device *dev, struct imx471 *sens=
or)=0A=
> +{=0A=
> +       for (unsigned int  i =3D 0; i < IMX471_NUM_SUPPLIES; i++)=0A=
> +               sensor->supplies[i].supply =3D imx471_supply_name[i];=0A=
> +=0A=
> +       return devm_regulator_bulk_get(dev, IMX471_NUM_SUPPLIES,=0A=
> +                                      sensor->supplies);=0A=
> +}=0A=
> +=0A=
> +static int imx471_set_ctrl(struct v4l2_ctrl *ctrl)=0A=
> +{=0A=
> +       struct imx471 *sensor =3D container_of(ctrl->handler,=0A=
> +                                                 struct imx471,=0A=
> +                                                 ctrl_handler);=0A=
=0A=
Use container_of_const.=0A=
=0A=
> +       struct v4l2_subdev_state *state =3D=0A=
> +                       v4l2_subdev_get_locked_active_state(&sensor->sd);=
=0A=
> +       const struct v4l2_mbus_framefmt *format =3D=0A=
> +                       v4l2_subdev_state_get_format(state, 0);=0A=
> +       s64 exposure_max;=0A=
> +       int ret;=0A=
=0A=
ret =3D 0;=0A=
=0A=
> +=0A=
> +       /* Propagate change of current control to all related controls */=
=0A=
> +       if (ctrl->id =3D=3D V4L2_CID_VBLANK) {=0A=
> +               /* Update max exposure while meeting expected vblanking *=
/=0A=
> +               exposure_max =3D=0A=
> +                       format->height + ctrl->val - IMX471_EXPOSURE_MARG=
IN;=0A=
> +               __v4l2_ctrl_modify_range(sensor->exposure,=0A=
> +                                        sensor->exposure->minimum,=0A=
> +                                        exposure_max,=0A=
> +                                        sensor->exposure->step,=0A=
> +                                        exposure_max);=0A=
=0A=
This control operation can fail. Please check the return value.=0A=
=0A=
> +       }=0A=
> +=0A=
> +       /* V4L2 controls values will be applied only when power is alread=
y up */=0A=
> +       if (!pm_runtime_get_if_in_use(sensor->dev))=0A=
> +               return 0;=0A=
> +=0A=
> +       switch (ctrl->id) {=0A=
> +       case V4L2_CID_ANALOGUE_GAIN:=0A=
> +               cci_write(sensor->regmap, IMX471_REG_ANALOG_GAIN,=0A=
> +                         ctrl->val, &ret);=0A=
=0A=
You are using ret for the first time here, Please initialize ret with 0 whe=
n=0A=
declaring it.=0A=
=0A=
cci_write() uses the value pointed by &ret to determine whether a previous=
=0A=
error has already occurred, and an uninitialized ret may contain a garbage=
=0A=
value, causing the write operation to fail unexpectedly.=0A=
=0A=
> +               break;=0A=
> +       case V4L2_CID_DIGITAL_GAIN:=0A=
> +               cci_write(sensor->regmap, IMX471_REG_DIG_GAIN_GLOBAL,=0A=
> +                         ctrl->val, &ret);=0A=
> +               break;=0A=
> +       case V4L2_CID_EXPOSURE:=0A=
> +               cci_write(sensor->regmap, IMX471_REG_EXPOSURE,=0A=
> +                         ctrl->val, &ret);=0A=
> +               break;=0A=
> +       case V4L2_CID_VBLANK:=0A=
> +               /* Update FLL that meets expected vertical blanking */=0A=
> +               cci_write(sensor->regmap, IMX471_REG_FLL,=0A=
> +                         format->height + ctrl->val, &ret);=0A=
> +               break;=0A=
> +       case V4L2_CID_TEST_PATTERN:=0A=
> +               cci_write(sensor->regmap, IMX471_REG_TEST_PATTERN,=0A=
> +                         ctrl->val, &ret);=0A=
> +               break;=0A=
> +       case V4L2_CID_HFLIP:=0A=
> +       case V4L2_CID_VFLIP:=0A=
> +               cci_write(sensor->regmap, IMX471_REG_ORIENTATION,=0A=
> +                         sensor->hflip->val | sensor->vflip->val << 1, &=
ret);=0A=
> +               break;=0A=
> +       default:=0A=
> +               ret =3D -EINVAL;=0A=
> +               dev_info(sensor->dev, "ctrl(id:0x%x,val:0x%x) is not hand=
led",=0A=
> +                        ctrl->id, ctrl->val);=0A=
> +               break;=0A=
> +       }=0A=
> +=0A=
> +       pm_runtime_put(sensor->dev);=0A=
> +=0A=
> +       return ret;=0A=
> +}=0A=
> +=0A=
> +static const struct v4l2_ctrl_ops imx471_ctrl_ops =3D {=0A=
> +       .s_ctrl =3D imx471_set_ctrl,=0A=
> +};=0A=
> +=0A=
> +static u32 imx471_get_format_code(struct imx471 *sensor)=0A=
> +{=0A=
> +       unsigned int i;=0A=
> +=0A=
> +       i =3D (sensor->vflip->val ? 2 : 0) | (sensor->hflip->val ? 1 : 0)=
;=0A=
> +=0A=
> +       return imx471_hv_flips_bayer_order[i];=0A=
> +}=0A=
> +=0A=
> +static int imx471_enum_mbus_code(struct v4l2_subdev *sd,=0A=
> +                                struct v4l2_subdev_state *sd_state,=0A=
> +                                struct v4l2_subdev_mbus_code_enum *code)=
=0A=
> +{=0A=
> +       struct imx471 *sensor =3D to_imx471(sd);=0A=
> +=0A=
> +       if (code->index >=3D (ARRAY_SIZE(imx471_hv_flips_bayer_order) / 4=
))=0A=
> +               return -EINVAL;=0A=
> +=0A=
> +       code->code =3D imx471_get_format_code(sensor);=0A=
> +=0A=
> +       return 0;=0A=
> +}=0A=
=0A=
Please add one extra blank line after this line.=0A=
=0A=
> +static int imx471_enum_frame_size(struct v4l2_subdev *sd,=0A=
> +                                 struct v4l2_subdev_state *sd_state,=0A=
> +                                 struct v4l2_subdev_frame_size_enum *fse=
)=0A=
> +{=0A=
> +       if (fse->index >=3D ARRAY_SIZE(imx471_modes))=0A=
> +               return -EINVAL;=0A=
> +=0A=
> +       fse->min_width =3D imx471_modes[fse->index].width;=0A=
> +       fse->max_width =3D fse->min_width;=0A=
> +       fse->min_height =3D imx471_modes[fse->index].height;=0A=
> +       fse->max_height =3D fse->min_height;=0A=
> +=0A=
> +       return 0;=0A=
> +}=0A=
> +=0A=
> +static void imx471_update_pad_format(struct imx471 *sensor,=0A=
> +                                    const struct imx471_mode *mode,=0A=
> +                                    struct v4l2_subdev_format *fmt)=0A=
> +{=0A=
> +       fmt->format.code =3D imx471_get_format_code(sensor);=0A=
> +       fmt->format.width =3D mode->width;=0A=
> +       fmt->format.height =3D mode->height;=0A=
> +       fmt->format.field =3D V4L2_FIELD_NONE;=0A=
> +}=0A=
> +=0A=
> +static int imx471_set_pad_format(struct v4l2_subdev *sd,=0A=
> +                                struct v4l2_subdev_state *sd_state,=0A=
> +                                struct v4l2_subdev_format *fmt)=0A=
> +{=0A=
> +       struct imx471 *sensor =3D to_imx471(sd);=0A=
> +       const struct imx471_mode *mode;=0A=
> +       int h_blank;=0A=
> +       u64 pixel_rate;=0A=
> +=0A=
> +       mode =3D v4l2_find_nearest_size(imx471_modes,=0A=
> +                                     ARRAY_SIZE(imx471_modes),=0A=
> +                                     width, height,=0A=
> +                                     fmt->format.width, fmt->format.heig=
ht);=0A=
> +=0A=
> +       imx471_update_pad_format(sensor, mode, fmt);=0A=
> +=0A=
> +       *v4l2_subdev_state_get_format(sd_state, fmt->pad) =3D fmt->format=
;=0A=
> +=0A=
> +       if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)=0A=
> +               return 0;=0A=
> +=0A=
> +       if (media_entity_is_streaming(&sensor->sd.entity))=0A=
> +               return -EBUSY;=0A=
> +=0A=
> +       pixel_rate =3D IMX471_LINK_FREQ_DEFAULT * 2 * 4;=0A=
> +       div_u64(pixel_rate, 10);=0A=
=0A=
You need to store the return value, as the above operation does not update=
=0A=
pixel_rate.=0A=
=0A=
Please use:=0A=
pixel_rate =3D div_u64(IMX471_LINK_FREQ_DEFAULT * 2 * 4, 10);=0A=
=0A=
> +       __v4l2_ctrl_modify_range(sensor->pixel_rate,=0A=
> +                                V4L2_CID_PIXEL_RATE,=0A=
> +                                pixel_rate, 1, pixel_rate);=0A=
> +=0A=
> +       __v4l2_ctrl_modify_range(sensor->vblank,=0A=
> +                                mode->fll_min - mode->height,=0A=
> +                                IMX471_FLL_MAX - mode->height,=0A=
> +                                1,=0A=
> +                                mode->fll_def - mode->height);=0A=
> +=0A=
> +       h_blank =3D mode->llp - mode->width;=0A=
> +       /*=0A=
> +        * Currently hblank is not changeable.=0A=
> +        * So FPS control is done only by vblank.=0A=
> +        */=0A=
> +       __v4l2_ctrl_modify_range(sensor->hblank, h_blank,=0A=
> +                                h_blank, 1, h_blank);=0A=
=0A=
All the above control operations can fail. Please add proper error checks f=
or them.=0A=
=0A=
> +=0A=
> +       return 0;=0A=
> +}=0A=
> +=0A=
> +static int imx471_get_selection(struct v4l2_subdev *sd,=0A=
> +                               struct v4l2_subdev_state *sd_state,=0A=
> +                               struct v4l2_subdev_selection *sel)=0A=
> +{=0A=
> +       switch (sel->target) {=0A=
> +       case V4L2_SEL_TGT_CROP:=0A=
> +               sel->r =3D *v4l2_subdev_state_get_crop(sd_state, sel->pad=
);=0A=
> +               break;=0A=
> +=0A=
> +       case V4L2_SEL_TGT_NATIVE_SIZE:=0A=
> +               sel->r.top =3D 0;=0A=
> +               sel->r.left =3D 0;=0A=
> +               sel->r.width =3D IMX471_NATIVE_WIDTH;=0A=
> +               sel->r.height =3D IMX471_NATIVE_HEIGHT;=0A=
> +               return 0;=0A=
> +=0A=
> +       case V4L2_SEL_TGT_CROP_DEFAULT:=0A=
> +       case V4L2_SEL_TGT_CROP_BOUNDS:=0A=
> +               sel->r.top =3D IMX471_PIXEL_ARRAY_TOP;=0A=
> +               sel->r.left =3D IMX471_PIXEL_ARRAY_LEFT;=0A=
> +               sel->r.width =3D IMX471_PIXEL_ARRAY_WIDTH;=0A=
> +               sel->r.height =3D IMX471_PIXEL_ARRAY_HEIGHT;=0A=
> +               return 0;=0A=
> +       }=0A=
> +=0A=
> +       return -EINVAL;=0A=
> +}=0A=
> +=0A=
> +static int imx471_init_state(struct v4l2_subdev *sd,=0A=
> +                            struct v4l2_subdev_state *sd_state)=0A=
> +{=0A=
> +       struct v4l2_subdev_format fmt =3D {=0A=
> +               .which =3D V4L2_SUBDEV_FORMAT_ACTIVE,=0A=
> +               .format =3D {=0A=
> +                       .code =3D MEDIA_BUS_FMT_SRGGB10_1X10,=0A=
> +                       .width =3D imx471_modes[0].width,=0A=
> +                       .height =3D imx471_modes[0].height,=0A=
> +               },=0A=
> +       };=0A=
> +=0A=
> +       imx471_set_pad_format(sd, sd_state, &fmt);=0A=
> +=0A=
> +       return 0;=0A=
=0A=
imx471_set_pad_format() can fail.=0A=
=0A=
Please use:=0A=
return imx471_set_pad_format(sd, sd_state, &fmt);=0A=
=0A=
> +}=0A=
> +=0A=
> +static int imx471_identify_module(struct imx471 *sensor)=0A=
> +{=0A=
> +       int ret;=0A=
> +       u64 val;=0A=
> +=0A=
> +       ret =3D cci_read(sensor->regmap, IMX471_REG_CHIP_ID, &val, NULL);=
=0A=
> +       if (ret)=0A=
> +               return dev_err_probe(sensor->dev, ret,=0A=
> +                                    "failed to read chip id\n");=0A=
> +=0A=
> +       if (val !=3D IMX471_CHIP_ID)=0A=
> +               return dev_err_probe(sensor->dev, -EIO,=0A=
> +                                    "chip id mismatch: %x!=3D%llx\n",=0A=
> +                                    IMX471_CHIP_ID, val);=0A=
> +=0A=
> +       return 0;=0A=
> +}=0A=
> +=0A=
> +static int imx471_power_off(struct device *dev)=0A=
> +{=0A=
> +       struct v4l2_subdev *sd =3D dev_get_drvdata(dev);=0A=
> +       struct imx471 *sensor =3D to_imx471(sd);=0A=
> +=0A=
> +       clk_disable_unprepare(sensor->img_clk);=0A=
> +       gpiod_set_value_cansleep(sensor->reset_gpio, 1);=0A=
> +=0A=
> +       regulator_bulk_disable(IMX471_NUM_SUPPLIES, sensor->supplies);=0A=
> +=0A=
> +       return 0;=0A=
> +}=0A=
> +=0A=
> +static int imx471_power_on(struct device *dev)=0A=
> +{=0A=
> +       struct v4l2_subdev *sd =3D dev_get_drvdata(dev);=0A=
> +       struct imx471 *sensor =3D to_imx471(sd);=0A=
> +       int ret;=0A=
> +=0A=
> +       ret =3D regulator_bulk_enable(IMX471_NUM_SUPPLIES, sensor->suppli=
es);=0A=
> +       if (ret < 0) {=0A=
> +               dev_err(dev, "failed to enable regulators: %d\n", ret);=
=0A=
> +               return ret;=0A=
> +       }=0A=
> +=0A=
> +       ret =3D clk_prepare_enable(sensor->img_clk);=0A=
> +       if (ret < 0) {=0A=
> +               regulator_bulk_disable(IMX471_NUM_SUPPLIES, sensor->suppl=
ies);=0A=
> +               dev_err(dev, "failed to enable imaging clock: %d", ret);=
=0A=
> +               return ret;=0A=
> +       }=0A=
> +=0A=
> +       gpiod_set_value_cansleep(sensor->reset_gpio, 0);=0A=
> +=0A=
> +       usleep_range(10000, 15000);=0A=
> +=0A=
> +       return 0;=0A=
> +}=0A=
> +=0A=
> +/* Start streaming */=0A=
> +static int imx471_enable_stream(struct v4l2_subdev *sd,=0A=
> +                               struct v4l2_subdev_state *state,=0A=
> +                               u32 pad, u64 streams_mask)=0A=
> +{=0A=
> +       struct imx471 *sensor =3D to_imx471(sd);=0A=
> +       const struct imx471_mode *mode;=0A=
> +       struct v4l2_mbus_framefmt *fmt;=0A=
> +       int ret;=0A=
> +=0A=
> +       ret =3D pm_runtime_resume_and_get(sensor->dev);=0A=
> +       if (ret)=0A=
> +               goto error_powerdown;=0A=
> +=0A=
> +       ret =3D imx471_identify_module(sensor);=0A=
> +       if (ret)=0A=
> +               return ret;=0A=
> +=0A=
> +       /* Global Setting */=0A=
> +       cci_multi_reg_write(sensor->regmap, imx471_global_regs,=0A=
> +                           ARRAY_SIZE(imx471_global_regs), &ret);=0A=
> +       if (ret) {=0A=
> +               dev_err(sensor->dev, "failed to set global settings");=0A=
> +               goto error_powerdown;=0A=
> +       }=0A=
> +=0A=
> +       state =3D v4l2_subdev_get_locked_active_state(&sensor->sd);=0A=
> +       fmt =3D v4l2_subdev_state_get_format(state, 0);=0A=
> +       mode =3D v4l2_find_nearest_size(imx471_modes, ARRAY_SIZE(imx471_m=
odes),=0A=
> +                                     width, height, fmt->width, fmt->hei=
ght);=0A=
> +=0A=
> +       /* Apply default values of current mode */=0A=
> +       cci_multi_reg_write(sensor->regmap, mode->default_mode_regs,=0A=
> +                           mode->default_mode_regs_length, &ret);=0A=
> +       if (ret) {=0A=
> +               dev_err(sensor->dev, "failed to set mode");=0A=
> +               goto error_powerdown;=0A=
> +       }=0A=
> +=0A=
> +       /* set digital gain control to all color mode */=0A=
> +       cci_write(sensor->regmap, IMX471_REG_DPGA_USE_GLOBAL_GAIN, 1, &re=
t);=0A=
> +       if (ret)=0A=
> +               goto error_powerdown;=0A=
> +=0A=
> +       /* Apply customized values from user */=0A=
> +       ret =3D  __v4l2_ctrl_handler_setup(&sensor->ctrl_handler);=0A=
> +       if (ret)=0A=
> +               goto error_powerdown;=0A=
> +=0A=
> +       cci_write(sensor->regmap, IMX471_REG_MODE_SELECT,=0A=
> +                 IMX471_MODE_STREAMING, &ret);=0A=
> +       if (ret)=0A=
> +               goto error_powerdown;=0A=
> +=0A=
> +       __v4l2_ctrl_grab(sensor->vflip, true);=0A=
> +       __v4l2_ctrl_grab(sensor->hflip, true);=0A=
> +=0A=
> +       return ret;=0A=
> +=0A=
> +error_powerdown:=0A=
> +       pm_runtime_put(sensor->dev);=0A=
> +=0A=
> +       return ret;=0A=
> +}=0A=
> +=0A=
> +/* Stop streaming */=0A=
> +static int imx471_disable_stream(struct v4l2_subdev *sd,=0A=
> +                                struct v4l2_subdev_state *state,=0A=
> +                                u32 pad, u64 streams_mask)=0A=
> +{=0A=
> +       struct imx471 *sensor =3D to_imx471(sd);=0A=
> +       int ret;=0A=
> +=0A=
> +       cci_write(sensor->regmap, IMX471_REG_MODE_SELECT,=0A=
> +                 IMX471_MODE_STANDBY, &ret);=0A=
=0A=
If you use ret for the cci_write() error path, it must be initialized.=0A=
=0A=
Here, you can directly get the error by using:=0A=
ret =3D cci_write(sensor->regmap, IMX471_REG_MODE_SELECT, IMX471_MODE_STAND=
BY, NULL);=0A=
=0A=
> +       pm_runtime_put(sensor->dev);=0A=
> +=0A=
> +       if (ret)=0A=
> +               dev_err(sensor->dev,=0A=
> +                       "failed to disable stream with return value: %d\n=
",=0A=
> +                       ret);=0A=
> +       __v4l2_ctrl_grab(sensor->vflip, false);=0A=
> +       __v4l2_ctrl_grab(sensor->hflip, false);=0A=
> +=0A=
> +       return 0;=0A=
> +}=0A=
> +=0A=
> +static const struct v4l2_subdev_core_ops imx471_subdev_core_ops =3D {=0A=
> +       .subscribe_event =3D v4l2_ctrl_subdev_subscribe_event,=0A=
> +       .unsubscribe_event =3D v4l2_event_subdev_unsubscribe,=0A=
> +};=0A=
=0A=
Drop this=0A=
=0A=
See: https://lore.kernel.org/linux-media/20241029162106.3005800-1-tomm.merc=
iai@gmail.com/=0A=
=0A=
> +=0A=
> +static const struct v4l2_subdev_video_ops imx471_video_ops =3D {=0A=
> +       .s_stream =3D v4l2_subdev_s_stream_helper,=0A=
> +};=0A=
> +=0A=
> +static const struct v4l2_subdev_pad_ops imx471_pad_ops =3D {=0A=
> +       .enum_mbus_code =3D imx471_enum_mbus_code,=0A=
> +       .get_fmt =3D v4l2_subdev_get_fmt,=0A=
> +       .set_fmt =3D imx471_set_pad_format,=0A=
> +       .get_selection =3D imx471_get_selection,=0A=
> +       .enum_frame_size =3D imx471_enum_frame_size,=0A=
> +       .enable_streams =3D imx471_enable_stream,=0A=
> +       .disable_streams =3D imx471_disable_stream,=0A=
> +};=0A=
> +=0A=
> +static const struct v4l2_subdev_ops imx471_subdev_ops =3D {=0A=
> +       .core =3D &imx471_subdev_core_ops,=0A=
> +       .video =3D &imx471_video_ops,=0A=
> +       .pad =3D &imx471_pad_ops,=0A=
> +};=0A=
> +=0A=
> +static const struct v4l2_subdev_internal_ops imx471_internal_ops =3D {=
=0A=
> +       .init_state =3D imx471_init_state,=0A=
> +};=0A=
> +=0A=
> +/* Initialize control handlers */=0A=
> +static int imx471_init_controls(struct imx471 *sensor)=0A=
> +{=0A=
> +       const struct imx471_mode *mode =3D &imx471_modes[0];=0A=
> +       struct v4l2_ctrl_handler *ctrl_hdlr;=0A=
> +       struct v4l2_fwnode_device_properties props;=0A=
> +       s64 exposure_max, hblank;=0A=
> +       u64 pixel_rate;=0A=
> +       int ret;=0A=
> +=0A=
> +       ctrl_hdlr =3D &sensor->ctrl_handler;=0A=
> +       ret =3D v4l2_ctrl_handler_init(ctrl_hdlr, 10);=0A=
> +       if (ret)=0A=
> +               return ret;=0A=
=0A=
You can skip this error check.=0A=
=0A=
Also, there are 12 controls here, 10 controls + 2 orientation controls.=0A=
=0A=
> +=0A=
> +       ret =3D v4l2_fwnode_device_parse(sensor->dev, &props);=0A=
> +       if (ret) {=0A=
> +               dev_err(sensor->dev, "failed to parse fwnode: %d", ret);=
=0A=
> +               return ret;=0A=
> +       }=0A=
> +=0A=
> +       v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &imx471_ctrl_ops, &pro=
ps);=0A=
> +=0A=
> +       sensor->link_freq =3D v4l2_ctrl_new_int_menu(ctrl_hdlr,=0A=
> +                                                  &imx471_ctrl_ops,=0A=
> +                                                  V4L2_CID_LINK_FREQ,=0A=
> +                                                  ARRAY_SIZE(link_freq_m=
enu_items) - 1,=0A=
> +                                                  0,=0A=
> +                                                  link_freq_menu_items);=
=0A=
> +       if (sensor->link_freq)=0A=
> +               sensor->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;=
=0A=
> +=0A=
> +       /* pixel_rate =3D link_freq * 2 * nr_of_lanes / bits_per_sample *=
/=0A=
> +       pixel_rate =3D IMX471_LINK_FREQ_DEFAULT * 2 * 4;=0A=
> +       div_u64(pixel_rate, 10);=0A=
=0A=
As I mentioned above, please store the return value of div_u64():=0A=
=0A=
pixel_rate =3D div_u64(IMX471_LINK_FREQ_DEFAULT * 2 * 4, 10);=0A=
=0A=
> +       /* By default, PIXEL_RATE is read only */=0A=
> +       sensor->pixel_rate =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_=
ops,=0A=
> +                                              V4L2_CID_PIXEL_RATE, pixel=
_rate,=0A=
> +                                              pixel_rate, 1, pixel_rate)=
;=0A=
> +=0A=
> +       /* Initial vblank/hblank/exposure parameters based on current mod=
e */=0A=
> +       sensor->vblank =3D v4l2_ctrl_new_std(ctrl_hdlr,=0A=
> +                                          &imx471_ctrl_ops,=0A=
> +                                          V4L2_CID_VBLANK,=0A=
> +                                          mode->fll_min - mode->height,=
=0A=
> +                                          IMX471_FLL_MAX - mode->height,=
=0A=
> +                                          1,=0A=
> +                                          mode->fll_def - mode->height);=
=0A=
> +=0A=
> +       hblank =3D mode->llp - mode->width;=0A=
> +       sensor->hblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops,=
=0A=
> +                                          V4L2_CID_HBLANK, hblank, hblan=
k,=0A=
> +                                          1, hblank);=0A=
> +       if (sensor->hblank)=0A=
> +               sensor->hblank->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;=0A=
> +=0A=
> +       /* fll >=3D exposure time + adjust parameter (default value is 18=
) */=0A=
> +       exposure_max =3D mode->fll_def - IMX471_EXPOSURE_MARGIN;=0A=
> +       sensor->exposure =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_op=
s,=0A=
> +                                            V4L2_CID_EXPOSURE,=0A=
> +                                            IMX471_EXPOSURE_MIN, exposur=
e_max,=0A=
> +                                            IMX471_EXPOSURE_STEP,=0A=
> +                                            IMX471_EXPOSURE_DEFAULT);=0A=
> +=0A=
> +       v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops, V4L2_CID_ANALOGUE_=
GAIN,=0A=
> +                         IMX471_ANA_GAIN_MIN, IMX471_ANA_GAIN_MAX,=0A=
> +                         IMX471_ANA_GAIN_STEP, IMX471_ANA_GAIN_DEFAULT);=
=0A=
> +=0A=
> +       /* Digital gain */=0A=
> +       v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops, V4L2_CID_DIGITAL_G=
AIN,=0A=
> +                         IMX471_DGTL_GAIN_MIN, IMX471_DGTL_GAIN_MAX,=0A=
> +                         IMX471_DGTL_GAIN_STEP, IMX471_DGTL_GAIN_DEFAULT=
);=0A=
> +=0A=
> +       v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &imx471_ctrl_ops,=0A=
> +                                    V4L2_CID_TEST_PATTERN,=0A=
> +                                    ARRAY_SIZE(imx471_test_pattern_menu)=
 - 1,=0A=
> +                                    0, 0, imx471_test_pattern_menu);=0A=
> +=0A=
> +       /* HFLIP & VFLIP */=0A=
=0A=
I can see many comments in your code that are not very important.=0A=
You can remove them if you want, it's up to you.=0A=
=0A=
> +       sensor->hflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops,=
=0A=
> +                                         V4L2_CID_HFLIP, 0, 1, 1, 0);=0A=
> +=0A=
> +       sensor->vflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx471_ctrl_ops,=
=0A=
> +                                         V4L2_CID_VFLIP, 0, 1, 1, 0);=0A=
> +=0A=
> +       if (ctrl_hdlr->error) {=0A=
> +               dev_err(sensor->dev, "%s control init failed: %d",=0A=
> +                       __func__, ctrl_hdlr->error);=0A=
> +               goto error;=0A=
> +       }=0A=
> +=0A=
> +       sensor->hflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;=0A=
> +       sensor->vflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;=0A=
> +=0A=
> +       sensor->sd.ctrl_handler =3D ctrl_hdlr;=0A=
> +=0A=
> +       return 0;=0A=
> +=0A=
> +error:=0A=
> +       v4l2_ctrl_handler_free(ctrl_hdlr);=0A=
> +=0A=
> +       return ctrl_hdlr->error;=0A=
> +}=0A=
> +=0A=
> +static int imx471_check_hwcfg(struct imx471 *sensor)=0A=
> +{=0A=
> +       struct v4l2_fwnode_endpoint bus_cfg =3D {=0A=
> +               .bus_type =3D V4L2_MBUS_CSI2_DPHY,=0A=
> +       };=0A=
> +       struct fwnode_handle *ep, *fwnode =3D dev_fwnode(sensor->dev);=0A=
> +       struct clk *clk;=0A=
> +       unsigned long link_freq_bitmap;=0A=
> +       int ret;=0A=
=0A=
If you want, you can sort the variable declarations throughout the code, wh=
ere=0A=
appropriate, by length to make them more readable.=0A=
=0A=
> +=0A=
> +       clk =3D devm_v4l2_sensor_clk_get(sensor->dev, NULL);=0A=
> +       if (IS_ERR(clk))=0A=
> +               return dev_err_probe(sensor->dev, PTR_ERR(clk),=0A=
> +                                    "can't get clock frequency\n");=0A=
> +=0A=
> +       if (clk_get_rate(clk) !=3D IMX471_EXT_CLK)=0A=
> +               return dev_err_probe(sensor->dev, -EINVAL,=0A=
> +                                    "external clock %lu is not supported=
\n",=0A=
> +                                    clk_get_rate(clk));=0A=
> +=0A=
> +       ep =3D fwnode_graph_get_endpoint_by_id(fwnode, 0, 0, 0);=0A=
> +       ret =3D v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);=0A=
> +       fwnode_handle_put(ep);=0A=
> +       if (ret)=0A=
> +               return dev_err_probe(sensor->dev, ret,=0A=
> +                                    "parsing endpoint failed");=0A=
> +=0A=
> +       ret =3D v4l2_link_freq_to_bitmap(sensor->dev, bus_cfg.link_freque=
ncies,=0A=
> +                                      bus_cfg.nr_of_link_frequencies,=0A=
> +                                      link_freq_menu_items,=0A=
> +                                      ARRAY_SIZE(link_freq_menu_items),=
=0A=
> +                                      &link_freq_bitmap);=0A=
=0A=
This can fail silently. Please add an error message before returning the fa=
ilure.=0A=
=0A=
> +=0A=
> +       v4l2_fwnode_endpoint_free(&bus_cfg);=0A=
> +=0A=
> +       return ret;=0A=
> +}=0A=
> +=0A=
> +static int imx471_probe(struct i2c_client *client)=0A=
> +{=0A=
> +       struct imx471 *sensor;=0A=
> +       int ret;=0A=
> +=0A=
> +       sensor =3D devm_kzalloc(&client->dev, sizeof(*sensor), GFP_KERNEL=
);=0A=
> +       if (!sensor)=0A=
> +               return dev_err_probe(&client->dev, -ENOMEM,=0A=
> +                                    "failed to allocate memory\n");=0A=
> +=0A=
> +       sensor->dev =3D &client->dev;=0A=
> +=0A=
> +       /* Check HW config */=0A=
> +       ret =3D imx471_check_hwcfg(sensor);=0A=
> +       if (ret)=0A=
> +               return dev_err_probe(sensor->dev, ret,=0A=
> +                                    "failed to check hwcfg: %d\n", ret);=
=0A=
> +=0A=
> +       ret =3D imx471_get_regulators(sensor->dev, sensor);=0A=
> +       if (ret)=0A=
> +               return dev_err_probe(sensor->dev, ret,=0A=
> +                                    "failed to get regulators\n");=0A=
> +=0A=
> +       sensor->reset_gpio =3D devm_gpiod_get_optional(sensor->dev, "rese=
t",=0A=
> +                                                    GPIOD_OUT_HIGH);=0A=
> +       if (IS_ERR(sensor->reset_gpio))=0A=
> +               return dev_err_probe(sensor->dev, PTR_ERR(sensor->reset_g=
pio),=0A=
> +                                    "failed to get reset gpio\n");=0A=
> +=0A=
> +       sensor->img_clk =3D devm_clk_get_optional(sensor->dev, NULL);=0A=
> +       if (IS_ERR(sensor->img_clk))=0A=
> +               return dev_err_probe(sensor->dev, PTR_ERR(sensor->img_clk=
),=0A=
> +                                    "failed to get imaging clock\n");=0A=
> +=0A=
> +       /* Initialize subdev */=0A=
> +       v4l2_i2c_subdev_init(&sensor->sd, client, &imx471_subdev_ops);=0A=
> +=0A=
> +       /* Initialize regmap */=0A=
> +       sensor->regmap =3D devm_cci_regmap_init_i2c(client, 16);=0A=
> +       if (IS_ERR(sensor->regmap))=0A=
> +               return PTR_ERR(sensor->regmap);=0A=
=0A=
Please add an error message before returning the failure.=0A=
=0A=
> +=0A=
> +       ret =3D imx471_power_on(sensor->dev);=0A=
> +       if (ret)=0A=
> +               return dev_err_probe(sensor->dev, ret,=0A=
> +                                    "failed to power on\n");=0A=
> +=0A=
> +       /* Check module identity */=0A=
> +       ret =3D imx471_identify_module(sensor);=0A=
> +       if (ret) {=0A=
> +               dev_err(&client->dev, "failed to find sensor: %d", ret);=
=0A=
=0A=
Use dev_err_probe();=0A=
=0A=
Also, add a newline character at the end of the print statement.=0A=
=0A=
> +               goto error_power_off;=0A=
> +       }=0A=
> +=0A=
> +       ret =3D imx471_init_controls(sensor);=0A=
> +       if (ret) {=0A=
> +               dev_err(sensor->dev, "failed to init controls: %d", ret);=
=0A=
=0A=
Same here.=0A=
=0A=
> +               goto error_power_off;=0A=
> +       }=0A=
> +=0A=
> +       /* Initialize subdev */=0A=
> +       sensor->sd.internal_ops =3D &imx471_internal_ops;=0A=
> +       sensor->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE |=0A=
> +                           V4L2_SUBDEV_FL_HAS_EVENTS;=0A=
=0A=
See: https://lore.kernel.org/linux-media/20241029162106.3005800-1-tomm.merc=
iai@gmail.com/=0A=
=0A=
> +       sensor->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;=0A=
> +=0A=
> +       /* Initialize source pad */=0A=
> +       sensor->pad.flags =3D MEDIA_PAD_FL_SOURCE;=0A=
> +       ret =3D media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pa=
d);=0A=
> +       if (ret) {=0A=
> +               dev_err(&client->dev, "failed to init entity pads: %d", r=
et);=0A=
=0A=
Use dev_err_probe.=0A=
=0A=
> +               goto error_v4l2_ctrl_handler_free;=0A=
> +       }=0A=
> +=0A=
> +       sensor->sd.state_lock =3D sensor->ctrl_handler.lock;=0A=
> +       ret =3D v4l2_subdev_init_finalize(&sensor->sd);=0A=
> +       if (ret < 0) {=0A=
> +               dev_err(&client->dev, "failed to init subdev: %d", ret);=
=0A=
=0A=
Same here.=0A=
=0A=
> +               goto error_media_entity_pm;=0A=
> +       }=0A=
> +=0A=
> +       pm_runtime_set_active(sensor->dev);=0A=
> +       pm_runtime_enable(sensor->dev);=0A=
> +       pm_runtime_idle(sensor->dev);=0A=
> +=0A=
> +       ret =3D v4l2_async_register_subdev_sensor(&sensor->sd);=0A=
> +       if (ret < 0)=0A=
> +               goto error_v4l2_subdev_cleanup;=0A=
> +=0A=
> +       return 0;=0A=
> +=0A=
> +error_v4l2_subdev_cleanup:=0A=
> +       pm_runtime_disable(sensor->dev);=0A=
> +       pm_runtime_set_suspended(sensor->dev);=0A=
> +       v4l2_subdev_cleanup(&sensor->sd);=0A=
> +=0A=
> +error_media_entity_pm:=0A=
> +       media_entity_cleanup(&sensor->sd.entity);=0A=
> +=0A=
> +error_v4l2_ctrl_handler_free:=0A=
> +       v4l2_ctrl_handler_free(sensor->sd.ctrl_handler);=0A=
> +=0A=
> +error_power_off:=0A=
> +       imx471_power_off(sensor->dev);=0A=
> +=0A=
> +       return ret;=0A=
> +}=0A=
> +=0A=
> +static void imx471_remove(struct i2c_client *client)=0A=
> +{=0A=
> +       struct v4l2_subdev *sd =3D i2c_get_clientdata(client);=0A=
> +       struct imx471 *sensor =3D to_imx471(sd);=0A=
> +=0A=
> +       v4l2_async_unregister_subdev(sd);=0A=
> +       v4l2_subdev_cleanup(sd);=0A=
> +       media_entity_cleanup(&sd->entity);=0A=
> +       v4l2_ctrl_handler_free(sd->ctrl_handler);=0A=
> +=0A=
> +       pm_runtime_disable(&client->dev);=0A=
> +=0A=
> +       if (!pm_runtime_status_suspended(sensor->dev)) {=0A=
> +               imx471_power_off(sensor->dev);=0A=
> +               pm_runtime_set_suspended(sensor->dev);=0A=
=0A=
You can use client->dev here and drop the struct imx471 *sensor =3D to_imx4=
71(sd); line.=0A=
=0A=
> +       }=0A=
> +}=0A=
> +=0A=
> +static DEFINE_RUNTIME_DEV_PM_OPS(imx471_pm_ops, imx471_power_off,=0A=
> +                                imx471_power_on, NULL);=0A=
> +=0A=
> +static const struct acpi_device_id imx471_acpi_ids[] __maybe_unused =3D =
{=0A=
> +       { "SONY471A" },=0A=
> +       { /* sentinel */ }=0A=
> +};=0A=
> +MODULE_DEVICE_TABLE(acpi, imx471_acpi_ids);=0A=
> +=0A=
> +static struct i2c_driver imx471_i2c_driver =3D {=0A=
> +       .driver =3D {=0A=
> +               .name =3D "imx471",=0A=
> +               .acpi_match_table =3D ACPI_PTR(imx471_acpi_ids),=0A=
> +               .pm =3D pm_sleep_ptr(&imx471_pm_ops),=0A=
> +       },=0A=
> +       .probe =3D imx471_probe,=0A=
> +       .remove =3D imx471_remove,=0A=
> +};=0A=
> +module_i2c_driver(imx471_i2c_driver);=0A=
> +=0A=
> +MODULE_AUTHOR("Jimmy Su <jimmy.su@intel.com>");=0A=
> +MODULE_AUTHOR("Serin Yeh <serin.yeh@intel.com>");=0A=
> +MODULE_AUTHOR("Kate Hsuan <hpa@redhat.com>");=0A=
> +MODULE_DESCRIPTION("Sony imx471 sensor driver");=0A=
> +MODULE_LICENSE("GPL");=0A=
> --=0A=
> 2.54.0=0A=
=0A=
Best Regards,=0A=
Tarang=

