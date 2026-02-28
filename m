Return-Path: <linux-media+bounces-53854-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANV0BhxKo2kF/QQAu9opvQ
	(envelope-from <linux-media+bounces-53854-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 21:03:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B588E1C7D8F
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 21:03:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8664730BDEE0
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 19:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0230B3BA245;
	Sat, 28 Feb 2026 18:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="UnnHmvHA"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020141.outbound.protection.outlook.com [52.101.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F67B37525C;
	Sat, 28 Feb 2026 18:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772304366; cv=fail; b=lOTFVd3hI9DksoWDXPDzVDMEJLD2+ZObjTj0NyFyE64NPEBvVw4zka4y7nVTcEfuG5Iu+z3kb0AEY/5jOwVBWRvyq4GVe+gnZRQ4oxFBKkp7OZ8HNTsz6bGFXEgOq+SJHxlmaAfeQgiMzz5A9DDjIcCDGMMNa/b7BijGpx9A7Tg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772304366; c=relaxed/simple;
	bh=FJ2YDWlIJoTNhYaf+cHghLMcasIvYGzBBS8xfouomz4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UAbqXrIVLPrXcXlcCruKxoZ9ycwFrc/HbShdOo8/cCNXr/0T+lJdKiS3FgBUXx+9vNgGT14UmFYqnPoHPDIa+2v/Estbg3KDjQSh5wEtRnVyMLpREg1aHUu+CCe4GVZIkD1Fy4DPS5jokkqCJInp/YYPoWL32Abofa2g+kLKLiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=UnnHmvHA; arc=fail smtp.client-ip=52.101.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j4e+CmVsb6TzV+zSXo9Bm9BbPQNOKiDBnIZtTRirhRhLU5f7Uf5H82lZUv3A8boxJpAX94poiMFXGZv3Ei4FRlpCfEYH+PiEylRNhM11bKH1dbqDrlisv0i6kh0RqN9gBRtK1H5aVmZZTP+VypDWO75P8Nr9MJwDayRMRm9zQilKojsE1Nb1V7zZ8AYUxOYPc0ViGJ+UDD97h7lFYyJxLHV9CCcYnx8LwoSuS0yocL6U1oeYRFOA0OzLaxdEyrm9ppGD8I7u3qmZFoXi4619tTprOiSsgnVxvKLZtr3SppJnn/G6S35DX3CdMhUg0usZNHoKXEGau93nKlXl8ZaHxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FJ2YDWlIJoTNhYaf+cHghLMcasIvYGzBBS8xfouomz4=;
 b=waUQL6V/ioXQmhyPFN/u/6ZD5nZzBTGyXdjSLUVkVYj821ja0zszv+rhjKtCXRiH6q6FNdODi8OvPIzcjflRfDlSe2Epq7Qv9Rt1TTUzty2Z4XSpjIsKT0dCi1U7aX0y4u+Ii9BtjTcTzDHX9CctYa68ELBjJPm80VK4rtXizlavsh7O0imW3ae69kUKkOikPd0vQ+PQVtcveKbyJ0bqlt6fbgQveamuxzl9PaPh585hQoJ93x7p/l7xQnYE+ylDQohFhpwyBIXvU5B6dRUlzgE2DIYTIaGW3MbsXNl39BkHIfXisZPdUT6JqvbN1Ynz3KIxJR6C4LYJtZ2uDVYaLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJ2YDWlIJoTNhYaf+cHghLMcasIvYGzBBS8xfouomz4=;
 b=UnnHmvHAeN2j43/7xSeP0PkQfyzOl4bSNO2maowuyb077IAuBTcpJ+yr7cgF3bRLcdKvnpTfTN0JISAVNCd/uyfMx9U9f13z9rU21bVNUwBSyQHpKZNNf9j+pxr+/pas/TYNxU3PXgBJD6IV3cp0T1OjJjqdPR/ZFKRL+h55ktxhQWmHaAS3C55orLmX9g4sV8nD8H6acW13DiCSD+idRm+FonICglebw1G/ggY4d5VSJNP05WLyGX7VqB32K3aS3f4P7h/HK+gjjyxIq9cUmkJOCDqe/8oDmpltwSQJQxxvKQIlBrI99X5Lp1yR5T7Ky5llADCDFOtiwRnVANTbZQ==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN4P287MB4656.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2db::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.13; Sat, 28 Feb
 2026 18:45:59 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9678.011; Sat, 28 Feb 2026
 18:45:59 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Xiaolei Wang <xiaolei.wang@windriver.com>, "sakari.ailus@linux.intel.com"
	<sakari.ailus@linux.intel.com>, "laurent.pinchart@ideasonboard.com"
	<laurent.pinchart@ideasonboard.com>, "dave.stevenson@raspberrypi.com"
	<dave.stevenson@raspberrypi.com>, "jacopo@jmondi.org" <jacopo@jmondi.org>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"prabhakar.mahadev-lad.rj@bp.renesas.com"
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "hverkuil+cisco@kernel.org"
	<hverkuil+cisco@kernel.org>, "johannes.goede@oss.qualcomm.com"
	<johannes.goede@oss.qualcomm.com>, "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>, "jai.luthra@ideasonboard.com"
	<jai.luthra@ideasonboard.com>, "richard.leitner@linux.dev"
	<richard.leitner@linux.dev>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] media: i2c: ov9282: switch to
 {enable,disable}_streams
Thread-Topic: [PATCH 3/3] media: i2c: ov9282: switch to
 {enable,disable}_streams
Thread-Index: AQHcqI06+W+zXx3U7UKKB6d25Ps+W7WYcPPo
Date: Sat, 28 Feb 2026 18:45:59 +0000
Message-ID:
 <PN3P287MB18298EA8C75E3E5C03F3D4F08B70A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260228083401.1007434-1-xiaolei.wang@windriver.com>
 <20260228083401.1007434-4-xiaolei.wang@windriver.com>
In-Reply-To: <20260228083401.1007434-4-xiaolei.wang@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN4P287MB4656:EE_
x-ms-office365-filtering-correlation-id: 1f261343-de32-4b33-ace3-08de76f99d70
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|10070799003|921020|38070700021;
x-microsoft-antispam-message-info:
 feHaLJl9cPwPUF9BrqY9yjENJOBiVte1AJPSVs8JgHrEjUowNLm16mp9y1dbnh8tXVn8u22LIsazwidH9eCWyT+9puK9mSdDFmADNG0GlZW2F1hmiyQt2+5vO88xJYGbUFedYJhqNh3HItJ+ThQhzB1pmGWax9W/iX6ynFMepEdTROYT+fAosecV9pDXk4TkJRhk9UIpX/1joQNuUXC/du8R5Ft1n2WgghmCyuDbmwz78ViAmTkadvBylLxkcqdp1MiTGGXuqXNfHIf6RM7OfugSyuQx+DKdOqLRf3Q0LWIoKHTNlaB3yDSGlL2NKSa+66D2BekThGGBd6qHLILueurCRCscYNWsRHO2t3LIuh3kQrH5OpiEzZLDY3LGD4bxB21WKzhJdjBb83wQZaYpQr+X9N9IET8TXwQ30rCAEeut54zEXa0Z4aE/k2GjlgMh33HGVJUiz86/PiD71MO1kBoEyYnHjwbTLkkdIVv2UO5Kd+6tQaykdm9SGxhA7nkk/At1KjPKYAWdxJ8UpvwQjoAxtlRzZgawB65E3a9eY9CeYxanpCyHyDDpu80G7h6xF7/PS5Zl06T4t7bknD+7FxI9zfiqVc8ujW/1Fi177rO72xZfy2xrL2TRRtlsqTQdzSnPOgLoe8240bQ6gv/2VhXZ02ZNdlFRpMeRHPfPOo1LpBQB7nSGRStTszOXAIRQBqV0jSvau8/IzUno6qhOGwPG7IuR3LSfUaTTA1He6wbnulO077cUPCDVz1YksgIgqY3jcsiat0E+6c8QGuPryw7jMs46MUkmEKKNMR1TGCm3s9cdvjvlgD9eJBJDTn4F
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(10070799003)(921020)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UmZyeGF3MVovdUFpTnhmb2pidGdDbGdpT2ZORm9yWUJVOVFVSHFGWWVlZmVa?=
 =?utf-8?B?Vzk2R2VwZHJReG85cDNHOGxEQktJUTZPNkdYU2llUk45bFBtVDdGcnVCVGdo?=
 =?utf-8?B?a3hpenUzaHdtZVppbGswNGdqcEw4NkpsOVhZc0FHdFltR0pxSTR3Yk5kUW5O?=
 =?utf-8?B?bERIOW5BM3NObGtLc1lUak05bS9JRW5UdTZueVFXQUJ6bFd3a0dNVFgwL2Nm?=
 =?utf-8?B?MVRzWU5uTlZpUjlKMUV0TmpqdFNSekg4K2hEZ0lrRFI4WnE1a0ljZ2UrQTRi?=
 =?utf-8?B?bm5wUUtEYmFNVU5UaDA1UWxxbkNSdUJQY3JRa3BSRlp5V2hwYzZlSXpZbmRq?=
 =?utf-8?B?Z1pjcXVmME1mblZQMXcxeTFuWXpEL0d4Qm5iYUQ1MXllbXV1Mm95M0JYS2N2?=
 =?utf-8?B?S2lYOU5WUDZkMWg4NG1VTVYrTFpkU3FrclZTNWYyakRCcGtwbER4VEQrTm5V?=
 =?utf-8?B?ck92UWdlcWwvUHFHZ0Z2ZVh4TlBPUTNadTU3clhQbXRteC9NUUNPRFZObUd5?=
 =?utf-8?B?YXNlNFA0VXlReDY4WklPc0ZkRno0eEh3K092T0daSnZ2REdsdmgzbTJmVGtm?=
 =?utf-8?B?NjZjRjdkZm4rR3FVK3hndnJITDB2blVBTzlFWWR5eXk1QjhLL2Q5STRnOS9V?=
 =?utf-8?B?dW1jWDlKTjZhcDNDZU82Z0NyYVlPQzJ0REI5NmNHb1VEZTJPVkFGUThOVEsv?=
 =?utf-8?B?YzEzbVNrYUtQYWFxdlJEWFF2R2hMTDY3SWtBVmtrczlDWkpNcWJvUUN1a0dY?=
 =?utf-8?B?Z3dlRlZFWFA0Rkx4aHBHYWZjZHF2RnMxT3dOUTNNM0xkWFJtK2Q0OS93NVdP?=
 =?utf-8?B?dEVSc0NBM3ZRQmZEaGpVVXJnUWRPdHVpZ0Q1R1JDOG5yS1EvTzJQVGRCN0d0?=
 =?utf-8?B?ZFhzcE5yb2dLRVpHbkVscHY3ZW52MHBFMDFleFF2VDJoZXhjZ2daZ0VsTEpm?=
 =?utf-8?B?QTFmNnRtekFvd1hPOEVITnZsUTRwZ0ZkblpRM29TdVhKdEJBclZFUGo5NlRo?=
 =?utf-8?B?QytYSEVWbFB5VDJSRTY4MDlNb1B2a3RPYTlqNmpTZzZ5MlJiTi9aTkhtd2VM?=
 =?utf-8?B?bFNWRXp2VmxvWlZWQStlTklYZDBmM3dDOVArSDFxdTlxOVNxeTVncU1GcGZ1?=
 =?utf-8?B?VjZBNTBkUm1yd0k5dHAzZVc0TWVqWkhOcit2Rnh4d2psZXJvSCtNTGZYSHNQ?=
 =?utf-8?B?emg5MGQxNzdkZFB6eHVma1IrT3BQNWNHNkYwUTNJRkpENU9SOE5uNHdqUFJ0?=
 =?utf-8?B?Qm04Y0wzL1VTSnkrV3BsV2tscEw4ZHBPRXVrNGUvRW1lTmV3S0N2SlkzV011?=
 =?utf-8?B?bnJRMU9ITWNGYVhmRkU0U3hIS1RjWWJqRWhYMXVhRENCdllkcjlwU0dmc1Bz?=
 =?utf-8?B?dlVscXVLRTJ5bnhYalRrOTNLd0FOdVNrS3FTejB6U2h6Q3BVazhiMHI4UHVZ?=
 =?utf-8?B?MnM1ZlBHdm5aYWFJZndKUVF4dHZtdVgwak51Q3I2eDUyait3MUk5a29RNDdF?=
 =?utf-8?B?b2N6VXg2MG85M1RDMTI1UXJoN0hxUVc1a1d0R1ZxMnlkOXRsVzNUQ3h4eTE0?=
 =?utf-8?B?YUc5YmNaR2ZZT05vdEtVVmEydHNCY2VCQk9GR0ZCZzU4dFY1SThYMjFLUFR6?=
 =?utf-8?B?QzlRZEh4bnBYVmd3WUQ2L2hwZGw3TFQweExDZ1FtdWRLMk1NR2M4UkFaY2tH?=
 =?utf-8?B?Y1oxeXZTY2lGdFNGaVBpd3huZjJ4T1dXU3VhZ2k4c0dBU3JjbVlJY2xObEJT?=
 =?utf-8?B?aVlnbnBLQzc4WWc3Ukc0UHFwUjBteDg0QXVBWCtIQnhMZUo2ZWZTSXpxR3Rj?=
 =?utf-8?B?VE82L2oycVpmcHRYeFdRdmJ4SndUS1ZWVFlkaHlOT3hjakZZMzZVd2wvU2gz?=
 =?utf-8?B?WWhtTmNlbkN6dkFtc2pzK3d6ajdEOTRndUZVWkYxMHozWWdIcnZ3ekVnS3Nm?=
 =?utf-8?B?VGZGTnd1S2U3RHVSZDZRKzloazREdEVxZmxlSnA3Nm9QWnMxZGxYS2pIc0lo?=
 =?utf-8?B?aTdMWjNpM2dCMjdXY25YTXJPWWtFejRrNVBHRy8yQjBXMlVrNFJhM015a0lB?=
 =?utf-8?B?aHZJbWxYOUdnYlN2TUFQWnA3WTNPVElCTkpoTnozUmkvTzBTSW8zUVIvNmU3?=
 =?utf-8?B?bFVab3AwNmk4VFVpOUtLcjdkNU90NHdReUdPeWNiSHB6OXRNRFlsNWRFYkl0?=
 =?utf-8?B?Wi9weVVMS1paTk9wOVdNL2VIMTFvNHB2aVkvbExUVW03S0VtUWxOcVNhQlpK?=
 =?utf-8?B?MWRyZ2JYeUM1UTFKTGRmcklQc3RPcUN5UFF6cGVJNlltQ0t0UFRQcFViY2lq?=
 =?utf-8?B?U3hYQUVCa2MrT1ZUaXZxOGd6b25UeE9BWmpmR2trWFAvbVkxUlcveEVuY2VS?=
 =?utf-8?Q?CFBgVoJepHqLyZAFCt+H/oSD3lTFweqLkN4vFPRnwyNK5?=
x-ms-exchange-antispam-messagedata-1: CbiAtJggOFhox9gRtRAwIa1FAahdfYtRgzY=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f261343-de32-4b33-ace3-08de76f99d70
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2026 18:45:59.3422
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nNpcx2OlGUb8bjjnRuEJxKoMI+xMG9sI7L7NydVB5xHdXhoGaC06zNcJ7rSBfxDreVXpBBgkJ2tBcS8L/B9EYro9TEKhKMyoKg2EzgMzHUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN4P287MB4656
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-53854-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[windriver.com,linux.intel.com,ideasonboard.com,raspberrypi.com,jmondi.org,kernel.org,bp.renesas.com,oss.qualcomm.com,xs4all.nl,linux.dev];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	NEURAL_HAM(-0.00)[-0.998];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[siliconsignals.io:email,siliconsignals.io:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,windriver.com:email,PN3P287MB1829.INDP287.PROD.OUTLOOK.COM:mid]
X-Rspamd-Queue-Id: B588E1C7D8F
X-Rspamd-Action: no action

SGkgWGlhb2xlaSwKCj4gU3dpdGNoIGZyb20gc19zdHJlYW0gdG8gZW5hYmxlX3N0cmVhbXMgYW5k
IGRpc2FibGVfc3RyZWFtcyBjYWxsYmFja3MuCj4KPiBTaWduZWQtb2ZmLWJ5OiBYaWFvbGVpIFdh
bmcgPHhpYW9sZWkud2FuZ0B3aW5kcml2ZXIuY29tPgo+IC0tLQo+IMKgZHJpdmVycy9tZWRpYS9p
MmMvb3Y5MjgyLmMgfCA4MiArKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+
IMKgMSBmaWxlIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDU3IGRlbGV0aW9ucygtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvaTJjL292OTI4Mi5jIGIvZHJpdmVycy9tZWRpYS9p
MmMvb3Y5MjgyLmMKPiBpbmRleCBhYTVhMTA1MTM2YmYuLmIwODBhNTZkODNhOSAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL21lZGlhL2kyYy9vdjkyODIuYwo+ICsrKyBiL2RyaXZlcnMvbWVkaWEvaTJj
L292OTI4Mi5jCj4gQEAgLTkyMSwxMyArOTIxLDkgQEAgc3RhdGljIGludCBvdjkyODJfZ2V0X3Nl
bGVjdGlvbihzdHJ1Y3QgdjRsMl9zdWJkZXYgKnNkLAo+IMKgwqDCoMKgwqDCoMKgIHJldHVybiAt
RUlOVkFMOwo+IMKgfQo+Cj4gLS8qKgo+IC0gKiBvdjkyODJfc3RhcnRfc3RyZWFtaW5nKCkgLSBT
dGFydCBzZW5zb3Igc3RyZWFtCj4gLSAqIEBvdjkyODI6IHBvaW50ZXIgdG8gb3Y5MjgyIGRldmlj
ZQo+IC0gKgo+IC0gKiBSZXR1cm46IDAgaWYgc3VjY2Vzc2Z1bCwgZXJyb3IgY29kZSBvdGhlcndp
c2UuCj4gLSAqLwo+IC1zdGF0aWMgaW50IG92OTI4Ml9zdGFydF9zdHJlYW1pbmcoc3RydWN0IG92
OTI4MiAqb3Y5MjgyKQo+ICtzdGF0aWMgaW50IG92OTI4Ml9lbmFibGVfc3RyZWFtcyhzdHJ1Y3Qg
djRsMl9zdWJkZXYgKnNkLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgdjRsMl9zdWJkZXZfc3RhdGUgKnN0YXRl
LCB1MzIgcGFkLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB1NjQgc3RyZWFtc19tYXNrKQo+IMKgewo+IMKgwqDCoMKgwqDC
oMKgIGNvbnN0IHN0cnVjdCByZWdfc2VxdWVuY2UgYml0ZGVwdGhfcmVnc1syXVsyXSA9IHsKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgewo+IEBAIC05MzgsMTYgKzkzNCwyMSBAQCBz
dGF0aWMgaW50IG92OTI4Ml9zdGFydF9zdHJlYW1pbmcoc3RydWN0IG92OTI4MiAqb3Y5MjgyKQo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAge09WOTI4Ml9S
RUdfQU5BX0NPUkVfMiwgT1Y5MjgyX0FOQV9DT1JFMl9SQVc4fSwKPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfQo+IMKgwqDCoMKgwqDCoMKgIH07Cj4gK8KgwqDCoMKgwqDCoCBzdHJ1
Y3Qgb3Y5MjgyICpvdjkyODIgPSB0b19vdjkyODIoc2QpOwo+IMKgwqDCoMKgwqDCoMKgIGNvbnN0
IHN0cnVjdCBvdjkyODJfcmVnX2xpc3QgKnJlZ19saXN0Owo+IMKgwqDCoMKgwqDCoMKgIGludCBi
aXRkZXB0aF9pbmRleDsKPiDCoMKgwqDCoMKgwqDCoCBpbnQgcmV0Owo+Cj4gK8KgwqDCoMKgwqDC
oCByZXQgPSBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KG92OTI4Mi0+ZGV2KTsKPiArwqDCoMKg
wqDCoMKgIGlmIChyZXQpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJl
dDsKPiArCj4gwqDCoMKgwqDCoMKgwqAgLyogV3JpdGUgY29tbW9uIHJlZ2lzdGVycyAqLwo+IMKg
wqDCoMKgwqDCoMKgIHJldCA9IHJlZ21hcF9tdWx0aV9yZWdfd3JpdGUob3Y5MjgyLT5yZWdtYXAs
IGNvbW1vbl9yZWdzLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBBUlJBWV9TSVpFKGNvbW1vbl9y
ZWdzKSk7Cj4gwqDCoMKgwqDCoMKgwqAgaWYgKHJldCkgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBkZXZfZXJyKG92OTI4Mi0+ZGV2LCAiZmFpbCB0byB3cml0ZSBjb21tb24gcmVn
aXN0ZXJzIik7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGRvbmU7Cj4gwqDCoMKgwqDCoMKgwqAg
fQo+Cj4gwqDCoMKgwqDCoMKgwqAgYml0ZGVwdGhfaW5kZXggPSBvdjkyODItPmNvZGUgPT0gTUVE
SUFfQlVTX0ZNVF9ZMTBfMVgxMCA/IDAgOiAxOwo+IEBAIC05NTUsNyArOTU2LDcgQEAgc3RhdGlj
IGludCBvdjkyODJfc3RhcnRfc3RyZWFtaW5nKHN0cnVjdCBvdjkyODIgKm92OTI4MikKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgYml0ZGVwdGhfcmVnc1tiaXRkZXB0aF9pbmRleF0sIDIpOwo+IMKgwqDCoMKg
wqDCoMKgIGlmIChyZXQpIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2Vy
cihvdjkyODItPmRldiwgImZhaWwgdG8gd3JpdGUgYml0ZGVwdGggcmVncyIpOwo+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZ290byBkb25lOwo+IMKgwqDCoMKgwqDCoMKgIH0KPgo+IMKgwqDCoMKgwqDCoMKg
IC8qIFdyaXRlIHNlbnNvciBtb2RlIHJlZ2lzdGVycyAqLwo+IEBAIC05NjQsNzUgKzk2NSw0MCBA
QCBzdGF0aWMgaW50IG92OTI4Ml9zdGFydF9zdHJlYW1pbmcoc3RydWN0IG92OTI4MiAqb3Y5Mjgy
KQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByZWdfbGlzdC0+bnVtX29mX3JlZ3MpOwo+IMKgwqDCoMKgwqDC
oMKgIGlmIChyZXQpIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2Vycihv
djkyODItPmRldiwgImZhaWwgdG8gd3JpdGUgaW5pdGlhbCByZWdpc3RlcnMiKTsKPiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGdvdG8gZG9uZTsKPiDCoMKgwqDCoMKgwqDCoCB9Cj4KPiDCoMKgwqDCoMKgwqDC
oCAvKiBTZXR1cCBoYW5kbGVyIHdpbGwgd3JpdGUgYWN0dWFsIGV4cG9zdXJlIGFuZCBnYWluICov
Cj4gwqDCoMKgwqDCoMKgwqAgcmV0ID3CoCBfX3Y0bDJfY3RybF9oYW5kbGVyX3NldHVwKG92OTI4
Mi0+c2QuY3RybF9oYW5kbGVyKTsKPiDCoMKgwqDCoMKgwqDCoCBpZiAocmV0KSB7Cj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9lcnIob3Y5MjgyLT5kZXYsICJmYWlsIHRvIHNl
dHVwIGhhbmRsZXIiKTsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0
Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gZG9uZTsKPiDCoMKgwqDCoMKg
wqDCoCB9Cj4KPiDCoMKgwqDCoMKgwqDCoCAvKiBTdGFydCBzdHJlYW1pbmcgKi8KPiDCoMKgwqDC
oMKgwqDCoCByZXQgPSBjY2lfd3JpdGUob3Y5MjgyLT5yZWdtYXAsIE9WOTI4Ml9SRUdfTU9ERV9T
RUxFQ1QsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBP
VjkyODJfTU9ERV9TVFJFQU1JTkcsIE5VTEwpOwo+IC3CoMKgwqDCoMKgwqAgaWYgKHJldCkgewo+
ICvCoMKgwqDCoMKgwqAgaWYgKHJldCkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
ZGV2X2VycihvdjkyODItPmRldiwgImZhaWwgdG8gc3RhcnQgc3RyZWFtaW5nIik7Cj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPiAtwqDCoMKgwqDCoMKgIH0KPgo+
IC3CoMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4gLX0KPiArZG9uZToKPiArwqDCoMKgwqDCoMKgIGlm
IChyZXQpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcG1fcnVudGltZV9wdXQob3Y5
MjgyLT5kZXYpOwoKClRoZSBjdXJyZW50IGZsb3cgbG9va3Mgb2RkOyBjYW4gd2UgdXNlIGEgY29u
dmVudGlvbmFsIGVycm9yIHBhdGggd2l0aCBhIGNsZWFyCmxhYmVsIGxpa2UgZXJyX3BtX3B1dDoK
CuKAguKAguKAguKAguKAguKAgi8qIFN0YXJ0IHN0cmVhbWluZyAqLwrigILigILigILigILigILi
gIJyZXQgPSBjY2lfd3JpdGUob3Y5MjgyLT5yZWdtYXAsIE9WOTI4Ml9SRUdfTU9ERV9TRUxFQ1Qs
CuKAguKAguKAguKAguKAguKAgsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBPVjkyODJf
TU9ERV9TVFJFQU1JTkcsIE5VTEwpOwrigILigILigILigILigILigIJpZiAocmV0KQrigILigILi
gILigILigILigILCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKG92OTI4Mi0+ZGV2LCAiZmFpbCB0byBz
dGFydCBzdHJlYW1pbmciKTsK4oCC4oCC4oCC4oCC4oCC4oCCwqDCoMKgwqDCoMKgwqAgZ290byBl
cnJfcG1fcHV0OwrigILigILigILigILigILigIJ9CgrigILigILigILigILigILigIJyZXR1cm4g
MDsKCmVycl9wbV9wdXQ6CuKAguKAguKAguKAguKAguKAgnBtX3J1bnRpbWVfcHV0KG92OTI4Mi0+
ZGV2KTsK4oCC4oCC4oCC4oCC4oCC4oCCcmV0dXJuIHJldDsKCj4KPiAtLyoqCj4gLSAqIG92OTI4
Ml9zdG9wX3N0cmVhbWluZygpIC0gU3RvcCBzZW5zb3Igc3RyZWFtCj4gLSAqIEBvdjkyODI6IHBv
aW50ZXIgdG8gb3Y5MjgyIGRldmljZQo+IC0gKgo+IC0gKiBSZXR1cm46IDAgaWYgc3VjY2Vzc2Z1
bCwgZXJyb3IgY29kZSBvdGhlcndpc2UuCj4gLSAqLwo+IC1zdGF0aWMgaW50IG92OTI4Ml9zdG9w
X3N0cmVhbWluZyhzdHJ1Y3Qgb3Y5MjgyICpvdjkyODIpCj4gLXsKPiAtwqDCoMKgwqDCoMKgIHJl
dHVybiBjY2lfd3JpdGUob3Y5MjgyLT5yZWdtYXAsIE9WOTI4Ml9SRUdfTU9ERV9TRUxFQ1QsCj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgT1Y5MjgyX01P
REVfU1RBTkRCWSwgTlVMTCk7Cj4gK8KgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+IMKgfQo+Cj4g
LS8qKgo+IC0gKiBvdjkyODJfc2V0X3N0cmVhbSgpIC0gRW5hYmxlIHNlbnNvciBzdHJlYW1pbmcK
PiAtICogQHNkOiBwb2ludGVyIHRvIG92OTI4MiBzdWJkZXZpY2UKPiAtICogQGVuYWJsZTogc2V0
IHRvIGVuYWJsZSBzZW5zb3Igc3RyZWFtaW5nCj4gLSAqCj4gLSAqIFJldHVybjogMCBpZiBzdWNj
ZXNzZnVsLCBlcnJvciBjb2RlIG90aGVyd2lzZS4KPiAtICovCj4gLXN0YXRpYyBpbnQgb3Y5Mjgy
X3NldF9zdHJlYW0oc3RydWN0IHY0bDJfc3ViZGV2ICpzZCwgaW50IGVuYWJsZSkKPiArc3RhdGlj
IGludCBvdjkyODJfZGlzYWJsZV9zdHJlYW1zKHN0cnVjdCB2NGwyX3N1YmRldiAqc2QsCj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc3RydWN0IHY0bDJfc3ViZGV2X3N0YXRlICpzdGF0ZSwgdTMyIHBhZCwKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB1NjQgc3RyZWFtc19tYXNrKQo+IMKgewo+IMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBvdjkyODIg
Km92OTI4MiA9IHRvX292OTI4MihzZCk7Cj4gLcKgwqDCoMKgwqDCoCBzdHJ1Y3QgdjRsMl9zdWJk
ZXZfc3RhdGUgKnN0YXRlOwo+IMKgwqDCoMKgwqDCoMKgIGludCByZXQ7Cj4KPiAtwqDCoMKgwqDC
oMKgIHN0YXRlID0gdjRsMl9zdWJkZXZfbG9ja19hbmRfZ2V0X2FjdGl2ZV9zdGF0ZShzZCk7Cj4g
LQo+IC3CoMKgwqDCoMKgwqAgaWYgKGVuYWJsZSkgewo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJldCA9IHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQob3Y5MjgyLT5kZXYpOwo+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyZXQpCj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gZXJyb3JfdW5sb2NrOwo+IC0KPiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSBvdjkyODJfc3RhcnRfc3RyZWFtaW5nKG92
OTI4Mik7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHJldCkKPiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBlcnJvcl9wb3dlcl9v
ZmY7Cj4gLcKgwqDCoMKgwqDCoCB9IGVsc2Ugewo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIG92OTI4Ml9zdG9wX3N0cmVhbWluZyhvdjkyODIpOwo+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHBtX3J1bnRpbWVfcHV0KG92OTI4Mi0+ZGV2KTsKPiAtwqDCoMKgwqDCoMKgIH0K
PiAtCj4gLcKgwqDCoMKgwqDCoCB2NGwyX3N1YmRldl91bmxvY2tfc3RhdGUoc3RhdGUpOwo+IC0K
PiAtwqDCoMKgwqDCoMKgIHJldHVybiAwOwo+ICvCoMKgwqDCoMKgwqAgcmV0ID0gY2NpX3dyaXRl
KG92OTI4Mi0+cmVnbWFwLCBPVjkyODJfUkVHX01PREVfU0VMRUNULAo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE9WOTI4Ml9NT0RFX1NUQU5EQlksIE5V
TEwpOwo+Cj4gLWVycm9yX3Bvd2VyX29mZjoKPiDCoMKgwqDCoMKgwqDCoCBwbV9ydW50aW1lX3B1
dChvdjkyODItPmRldik7Cj4gLWVycm9yX3VubG9jazoKPiAtwqDCoMKgwqDCoMKgIHY0bDJfc3Vi
ZGV2X3VubG9ja19zdGF0ZShzdGF0ZSk7Cj4KPiDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+
IMKgfQo+IEBAIC0xMTY0LDcgKzExMzAsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHY0bDJfc3Vi
ZGV2X2NvcmVfb3BzIG92OTI4Ml9jb3JlX29wcyA9IHsKPiDCoH07Cj4KPiDCoHN0YXRpYyBjb25z
dCBzdHJ1Y3QgdjRsMl9zdWJkZXZfdmlkZW9fb3BzIG92OTI4Ml92aWRlb19vcHMgPSB7Cj4gLcKg
wqDCoMKgwqDCoCAuc19zdHJlYW0gPSBvdjkyODJfc2V0X3N0cmVhbSwKPiArwqDCoMKgwqDCoMKg
IC5zX3N0cmVhbSA9IHY0bDJfc3ViZGV2X3Nfc3RyZWFtX2hlbHBlciwKPiDCoH07Cj4KPiDCoHN0
YXRpYyBjb25zdCBzdHJ1Y3QgdjRsMl9zdWJkZXZfcGFkX29wcyBvdjkyODJfcGFkX29wcyA9IHsK
PiBAQCAtMTE3Myw2ICsxMTM5LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB2NGwyX3N1YmRldl9w
YWRfb3BzIG92OTI4Ml9wYWRfb3BzID0gewo+IMKgwqDCoMKgwqDCoMKgIC5nZXRfZm10ID0gb3Y5
MjgyX2dldF9wYWRfZm9ybWF0LAo+IMKgwqDCoMKgwqDCoMKgIC5zZXRfZm10ID0gb3Y5MjgyX3Nl
dF9wYWRfZm9ybWF0LAo+IMKgwqDCoMKgwqDCoMKgIC5nZXRfc2VsZWN0aW9uID0gb3Y5MjgyX2dl
dF9zZWxlY3Rpb24sCj4gK8KgwqDCoMKgwqDCoCAuZW5hYmxlX3N0cmVhbXMgPSBvdjkyODJfZW5h
YmxlX3N0cmVhbXMsCj4gK8KgwqDCoMKgwqDCoCAuZGlzYWJsZV9zdHJlYW1zID0gb3Y5MjgyX2Rp
c2FibGVfc3RyZWFtcywKPiDCoH07Cj4KPiDCoHN0YXRpYyBjb25zdCBzdHJ1Y3QgdjRsMl9zdWJk
ZXZfb3BzIG92OTI4Ml9zdWJkZXZfb3BzID0gewo+IC0tCj4gMi40My4wCgpSZXZpZXdlZC1ieTog
VGFyYW5nIFJhdmFsIDx0YXJhbmcucmF2YWxAc2lsaWNvbnNpZ25hbHMuaW8+CgpCZXN0IFJlZ2Fy
ZHMsClRhcmFuZw==

