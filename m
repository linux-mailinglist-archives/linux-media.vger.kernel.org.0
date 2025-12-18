Return-Path: <linux-media+bounces-49056-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E916CCAE51
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 09:32:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D81E9302A947
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 08:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E68D2E9ED8;
	Thu, 18 Dec 2025 08:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="AjhfcV9n"
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021123.outbound.protection.outlook.com [40.107.51.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50522286D63
	for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 08:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766046507; cv=fail; b=IE9pyWgouHBwipXmQ3FgeSsE3lsxCqwdTI/+S7EBjBaH+ZwiaH8MZAiw/c8nVBXm/aakEip9B/iKG+BSgxSziag+UM004yf5klZq5KHPDrxLB0Ef7dsKhVdqxs1UvEy/cNVL29xgEKrgQHYU1W2wuJiB21g1z68N8rbab5bUn8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766046507; c=relaxed/simple;
	bh=F3WAVYmV475YsAL+H5jI3p1evz2FyszaLyiuxJKbCf8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RTeKwK6MLSYUkUXF/RAidSjD2ZRwFrYIrddFbErDLcnx9GoCvfCTzSup/fAjbK6vWvavYrhClwClSO8oIc9QKZRX1eDHFnCXBvgdumgSXBHfHIuWhZDtLS/qtb4ukACFAwBK5sXUbVEFfbOgr/D6BWnx9VuiPkmtIxMDJiebpSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=AjhfcV9n; arc=fail smtp.client-ip=40.107.51.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U1Dcb+nD25qQZbro62JqUmQJdXQOKm0YwsrANn0ZrSio7s9RI+UbdXpyG7aBDdhPAUu410D1/pGUsbv6iQB2Cp1zKvAGhpsvv4Ssi7P3TR1sfWxvM8Nnqe1+9+MGuM1DrAIAppll12qfAEk/P/69o2fjUucMOF4oKNvpez+JXKladK+Um7Mqbvw9i0C8Tvwi3W6zqo9xSHjEvlaxQk0k3CWM8ArXaKROgNnRdzDGKXTzyJuzXx6BaKtm/zdzD2mNzPwx6jBjmrjSGU8pDZPSUiX/NWb/byoVd4hOXTSGFsMCwBn7juUFzs1TBlgJ1NvZmKV1POl3h7MAGksqmuSk4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F3WAVYmV475YsAL+H5jI3p1evz2FyszaLyiuxJKbCf8=;
 b=ye16BKmRSzEJrUAgOlzoMuaOGh/yckekkbdROtai+Lo93d/H4ts+K2c2JNN0LQ2iG5fsG1wSmtCJIckDOnuSTIwuKz4OkpQcBvqXGXwLpr8eTaJHM5+W3ynmYtZ0YZX54a7EuQDAfOPeVvlk5IluKde1IQjlltCr4diR+/Ws50k50voyRakMTa3pJKSOJvjt595jb/8G87d2Deu7rXzAADbymXJxKN6V5gXCjWZD3+AN8u5IGSRJP/fSb45hDrIaGCYStqmW/TCHdw8wdGUZ6QKJoGfosn1OYTSnf4AeaNpAUQXlG2v9v2cmXh4PnxxLCdXy7gouXTKyT/Yq5bHWbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3WAVYmV475YsAL+H5jI3p1evz2FyszaLyiuxJKbCf8=;
 b=AjhfcV9nPRZt9JYnicymG0rqy1p2Ywk6jPmdPlLTPsu+MTqJl7IvzPz6cLH4Kbdt0of/SfBC+qPXz71NFU7AVWZp34Mp5Rw1dyiKYX/meVHmHZV4CAUsvnVw1eM8FvkXNyuISYgLZ8bhGHBgpQZHbqZRq0VL2hOrnlqBTHQY1oha5MxMjM0BplwDEsUjzd61qw5eI8fHNiD1ftCwACM+IAtt9Me3By0av/4Kq5DAmQ0HqmINYXAyfOvd0JxgtGZWM/AkbAmLXu3m+uwG/aa+5xIYS3cIrhvfTbBqpD3FSUYPxBIh5YyDsSojkfXlpJOsr2Kpv6R+SEtw4CsQb/NmFw==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PNYP287MB4608.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2cd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 05:53:30 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 05:53:30 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [PATCH 2/2] media: i2c: og0ve1b: make configurable vblank control
 of the sensor
Thread-Topic: [PATCH 2/2] media: i2c: og0ve1b: make configurable vblank
 control of the sensor
Thread-Index: AQHcb7+Ml/xeNcf51EyJ01O4gtE82LUm5NqP
Date: Thu, 18 Dec 2025 05:53:30 +0000
Message-ID:
 <PN3P287MB1829F6BB4DB0A994D5C90D8C8BA8A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20251218014155.3265999-1-vladimir.zapolskiy@linaro.org>
 <20251218014155.3265999-3-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251218014155.3265999-3-vladimir.zapolskiy@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PNYP287MB4608:EE_
x-ms-office365-filtering-correlation-id: a094a5de-1537-47a2-24f6-08de3df9c5a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?eNdArLucVnB1ihw7QwpqUVRWYepv/eyqk0ubrfzOd12xGaESS399TP3YEc?=
 =?iso-8859-1?Q?kAQvePVY1CItf+YqMAa9lt/Ay7hx8jYlenSSYd+/N1CkgFd92QFeZJqWET?=
 =?iso-8859-1?Q?SpNYzP/uBoE34NFjESBsgdQnEJqwrUckAQr7YZfyok9VFqVZtQlgTAQTCy?=
 =?iso-8859-1?Q?Q4A1yBTJL84PKyhQ+utsK109vCBsBS/y5+9XPFk0covaI6nnQ2pZr3GR8q?=
 =?iso-8859-1?Q?efmKNGYTgcpRP6Jb/PP0wYIQ6yeHgdedV8mf0BX2WcYEpZqoCViUkadY6j?=
 =?iso-8859-1?Q?CSJv+waSBcs72d2B/3q/wNXJC118AWSE48RvXPm53dKz88QxiIGB9l4GYx?=
 =?iso-8859-1?Q?YV4MW81E3v/9qxWLfPbLB/YcaReYml+f5S75Ybu3ymCs6A4SdQMCN6auPj?=
 =?iso-8859-1?Q?fCKkwqqvhYn7HgVY0DJoDM3ugSK3RO7W5ZpcAbKg01sQDkQXnbiwp7ydmz?=
 =?iso-8859-1?Q?Z1vp/LkQfvdSzpH2Y9+R8FY9Wltoa7Z2TCEcLLwki9C4V75oi3axF4gf6E?=
 =?iso-8859-1?Q?dGw8qttLFgG2pE39zAIhhmBnWS1Wr4bvi2KvHSVM9MMGAV5iAZNUcs9FYb?=
 =?iso-8859-1?Q?zp0EzpBeiQLwJbMFv5h/VcPkgsHfObmy1HXILbsZzupfKpoRcL+k+qm+vZ?=
 =?iso-8859-1?Q?uaJs1Q1wnp/0MSuO0YmTLAOwV78lbgGhicIrWcLK8rVRwAOy/cNA67B+az?=
 =?iso-8859-1?Q?xIHoLD751mxhF3RDufAzJakwSj8e0EK6npNih8Uosgqk9NlCfF74pzmcEG?=
 =?iso-8859-1?Q?c/5/+MEbd4QAJSF5FyjJCuz4pf4wdE/dIe6U/96wOv3009+D9DvF+rZNtW?=
 =?iso-8859-1?Q?7GpGZ61n8ph0biBjCpQYI+CCjdE7VbQY0KSRkhuUDDInVoJGXOaRgdvSdX?=
 =?iso-8859-1?Q?5vRsztNgRwUHEEOsdH8D3WnygLYlAyhe8xG7DK2Z0UydDXeaHi12SkcPga?=
 =?iso-8859-1?Q?k3Xk92FIk7chPZHyDsklbZopdi5ZG1zUFUf1uHwjvyvlx4RIawk+VCTakm?=
 =?iso-8859-1?Q?ixg1CxV+1fbjly/o0iLjyEa6PZDCXkIwplbTTM6ZuQj1c2fgDadYp0L2bL?=
 =?iso-8859-1?Q?fGerKhv543+aJihPhdplEwo2k9aZdW2vHOdpFJJPndibUGOdBcTjUhEYha?=
 =?iso-8859-1?Q?VfkaZp69YbImAJ6RJ14XhIK7UQ4a+OPb9zzpBnLGwjO0D/VLyXMWFGsDk2?=
 =?iso-8859-1?Q?fbR2ukhy9ecKKrAwwijm3f9McI6g7WeYF8rmgYmFtRxqN9QfLz2SGnqwkm?=
 =?iso-8859-1?Q?c0zuk9lTlpZrLISK74kUAhR+uTaZQutcHR3RlMHeEoNyPCwY2XJ+GP51OA?=
 =?iso-8859-1?Q?Jb4D5GBLFnwg6Y5XnzTYkHZAFNhr/UUSsHMnpOzxEMxHTwqNa1zVuYwHcl?=
 =?iso-8859-1?Q?qpHLHyQR5LNZhIQ8qKAKv1mkMJvM6h2H+LUlLjPDWfgu0FJM/waDQWBn3i?=
 =?iso-8859-1?Q?WCuxXxwb1zyerFfxr9gy4IebKDOQVQpv0Qh8YARacOhdsHpeovElpCWVrr?=
 =?iso-8859-1?Q?st+9Z9ypnwSSZRrfdE9cv9Qaqj/TYXdEHrFxHCkdaANK0j9EgIQ+Nb0ivT?=
 =?iso-8859-1?Q?XSpR0lOwFcoaoZyYIig9gastRPEj?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?BHqqkfnJJ6NtzBcH+bX1tQ7nKoLsVPUMR/5OoeiYWjktuW+TXHpZCUZfpw?=
 =?iso-8859-1?Q?vlD/iTcd8KiE+9YMGPUq20TWtIZGqYNAw9d4zPsVTYXU1AIXpIZ1aXvRNE?=
 =?iso-8859-1?Q?NHpQw9vUUJUIpVEav69shLYFxs2NsxHpgZ14aK1TMKUKK8BWod/W64maKu?=
 =?iso-8859-1?Q?YNNLUlLmOrKnu/dCZyNLyUUwP2KtHQ/FjrLdqtwf5JJis21m5ugIap5RbI?=
 =?iso-8859-1?Q?69zDU+fKSYlvik3o0XITZq9X7nVIwWfbg21yzpSwhw/xOer8GM7ma7O6VF?=
 =?iso-8859-1?Q?l2GnQ1EuhnenP9pxW1C5rGGi4bBTxH9JfHu/Hd+DEEnbV5z9OaMHQFOZlM?=
 =?iso-8859-1?Q?FiDlEC2GJqiPlaFx7LFDzmYYIHHQMOs7Qlum/j/tlEQqcrl1qyuZDwNqVP?=
 =?iso-8859-1?Q?jeGLFsFPEhnXIo3RVQPMpAonatnNzCZZqLzNxrbbteR9oTF09lQsSrEbCg?=
 =?iso-8859-1?Q?0D2/yO3Q4lP797ha+IdGh5hwK7mn9ZIcN07ExVC5RCt2/KZboLf0qj/+js?=
 =?iso-8859-1?Q?t0Mo8aZ+jYKNqzBn2SYpsXB6UOaTh7JWvQ+pQ7XT/qffwPx0IRdcv5G1Pz?=
 =?iso-8859-1?Q?DEbxLgoj8LE37SrzUj/EmZ/RfRXnEZV+xnfBsPNiyb6sOXZVR6D2/Vdqou?=
 =?iso-8859-1?Q?jYAFq2NVayUa8wEFlFMu4W9+JTjBZBX/vWIULjPNoupGuZVh4oyWBdqM2z?=
 =?iso-8859-1?Q?iznHBKTjMeFZvTgUIShnk9YN6jFdjH1NXlaUpUumoZweaEOMBx4ZFxfgFV?=
 =?iso-8859-1?Q?4LSFStUYf6s+Up8/youPei3WV7prSylVSN90gdR2Gd7VTO6QSjXnOaPmBM?=
 =?iso-8859-1?Q?MMf+EjTtQNjyWZR3MvvHD4NfILlegeZT0QZaXPhCrNB3lLg48FXtRdRxc3?=
 =?iso-8859-1?Q?2g3D+3W5rQJLqrlJSoxtgpXOF/4ZF68qxX1WNlx9LddjcA3I2il0zqJaNa?=
 =?iso-8859-1?Q?iBsrb4ffrDwmkZcI0Juih/4r1zzRiE7qiaVOniN3ir61eIAy5ty2wpDQDv?=
 =?iso-8859-1?Q?EfgXlChNaVr+BEWvsv3aZTWH2/B4ALZYkDBrUSLrHsIFD7Yn7ViwXzA6RC?=
 =?iso-8859-1?Q?qLSBa0t2PURqm/NuF6Sn3G/A4pK6vqmz0hcWcsD5n445cGxgXjJ/3sztD5?=
 =?iso-8859-1?Q?gt9eEq+9XAEKd1ZnjKQk6Ebj856C0zE/YE6qVQOxamgM0KYM3z7Az6c5xg?=
 =?iso-8859-1?Q?HAGF0sJNcInw/gYfGOHMeQYU6rsaj3OwxBAGHlkQz2LJenMpk7FnMgN2yU?=
 =?iso-8859-1?Q?v02riSbAzWMqBpqDjeXfv6SdRSPMuUNE7iWEbS3tKv1sAcPhy2oWy14I7c?=
 =?iso-8859-1?Q?w5mUFz8ADe5SH7nn02M9pQIOgmTOnuMVlnWeIUz0U5ET5JbzHfnmMPSJr8?=
 =?iso-8859-1?Q?20k3MXXiuMaGD4UU/nfoBpnBR05cyC5rZQMME5Pc57Y8UM6M+voUm5W5Nd?=
 =?iso-8859-1?Q?JHXaMX59CHdXv4nMODk+ron5sPUF5Hf+8KjZ30O/HoygE0vNkq4jef4IwJ?=
 =?iso-8859-1?Q?TIdfO6/u1X9olJt0QcUk8Ov1Dno/CEXr+uO/ekYmznchFV19gF8kswvFme?=
 =?iso-8859-1?Q?UnqulJprkGdLdeTSGPc/fN23IeoPlneQKPYMsnZQZDJ3VyUFye9CMrMsy3?=
 =?iso-8859-1?Q?RT0jcWQuFnuj1xsxufILNKsQhgmLE18L0Tl7GM1c/skPhKDFhdGkLAzA?=
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
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a094a5de-1537-47a2-24f6-08de3df9c5a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2025 05:53:30.5025
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EpcID8MVXCsqrkNBAgZZCeoY6RjMc6cbqsKrrtoKbBOO+B/oGvM/MEtqIigNmvz/IQmr0jeTUY5OJaicsE9OdvsGEz/wycyhWXNcJqiohAw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYP287MB4608

Hi Vladimir,=0A=
=0A=
> Configurable vertical blanking size control allows users to set a wanted=
=0A=
> image frame rate.=0A=
>=A0=0A=
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>=0A=
> ---=0A=
> =A0drivers/media/i2c/og0ve1b.c | 54 ++++++++++++++++++++++++++-----------=
=0A=
> =A01 file changed, 39 insertions(+), 15 deletions(-)=0A=
>=A0=0A=
> diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c=0A=
> index 262d9df766fe..64bde90a2069 100644=0A=
> --- a/drivers/media/i2c/og0ve1b.c=0A=
> +++ b/drivers/media/i2c/og0ve1b.c=0A=
> @@ -41,6 +41,10 @@=0A=
> =A0#define OG0VE1B_ANALOGUE_GAIN_STEP=A0=A0=A0=A0 1=0A=
> =A0#define OG0VE1B_ANALOGUE_GAIN_DEFAULT=A0 16=0A=
>=A0=0A=
> +/* Vertical timing size */=0A=
> +#define OG0VE1B_REG_VTS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 CCI_REG16(0x380e)=0A=
> +#define OG0VE1B_VTS_MAX=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 0xffff=0A=
> +=0A=
> =A0/* Test pattern */=0A=
> =A0#define OG0VE1B_REG_PRE_ISP=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG8(=
0x5e00)=0A=
> =A0#define OG0VE1B_TEST_PATTERN_ENABLE=A0=A0=A0 BIT(7)=0A=
> @@ -89,6 +93,8 @@ struct og0ve1b {=0A=
> =A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev sd;=0A=
> =A0=A0=A0=A0=A0=A0=A0 struct media_pad pad;=0A=
>=A0=0A=
> +=A0=A0=A0=A0=A0=A0 struct v4l2_ctrl *vblank;=0A=
> +=A0=A0=A0=A0=A0=A0 struct v4l2_ctrl *exposure;=0A=
> =A0=A0=A0=A0=A0=A0=A0 struct v4l2_ctrl_handler ctrl_handler;=0A=
>=A0=0A=
> =A0=A0=A0=A0=A0=A0=A0 /* Saved register value */=0A=
> @@ -140,8 +146,6 @@ static const struct cci_reg_sequence og0ve1b_640x480_=
120fps_mode[] =3D {=0A=
> =A0=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x380b), 0xe0 },=0A=
> =A0=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x380c), 0x03 },=A0=A0=A0=A0 /* horizont=
al timing size */=0A=
> =A0=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x380d), 0x18 },=0A=
> -=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x380e), 0x02 },=A0=A0=A0=A0 /* vertical t=
iming size */=0A=
> -=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x380f), 0x38 },=0A=
> =A0=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3811), 0x04 },=0A=
> =A0=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3813), 0x04 },=0A=
> =A0=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3814), 0x11 },=0A=
> @@ -273,8 +277,24 @@ static int og0ve1b_set_ctrl(struct v4l2_ctrl *ctrl)=
=0A=
> =A0{=0A=
> =A0=A0=A0=A0=A0=A0=A0 struct og0ve1b *og0ve1b =3D container_of(ctrl->hand=
ler, struct og0ve1b,=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ctrl_han=
dler);=0A=
> +=A0=A0=A0=A0=A0=A0 const struct og0ve1b_mode *mode =3D &supported_modes[=
0];=0A=
> +=A0=A0=A0=A0=A0=A0 s64 exposure_max;=0A=
> =A0=A0=A0=A0=A0=A0=A0 int ret;=0A=
>=A0=0A=
> +=A0=A0=A0=A0=A0=A0 /* Propagate change of current control to all related=
 controls */=0A=
> +=A0=A0=A0=A0=A0=A0 switch (ctrl->id) {=0A=
> +=A0=A0=A0=A0=A0=A0 case V4L2_CID_VBLANK:=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* Update max exposure while =
meeting expected vblanking */=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 exposure_max =3D ctrl->val + =
mode->height -=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OG0VE=
1B_EXPOSURE_MAX_MARGIN;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 __v4l2_ctrl_modify_range(og0v=
e1b->exposure,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 og0ve1b->exposure->minimum,=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 exposure_max,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 og0ve1b->exposure->step,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 og0ve1b->exposure->default_va=
lue);=0A=
=0A=
Please add error checking.=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> =A0=A0=A0=A0=A0=A0=A0 /* V4L2 controls are applied, when sensor is powere=
d up for streaming */=0A=
> =A0=A0=A0=A0=A0=A0=A0 if (!pm_runtime_get_if_active(og0ve1b->dev))=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
> @@ -288,6 +308,10 @@ static int og0ve1b_set_ctrl(struct v4l2_ctrl *ctrl)=
=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D cci_write(og0ve1b->=
regmap, OG0VE1B_REG_EXPOSURE,=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 ctrl->val << 4, NULL);=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> +=A0=A0=A0=A0=A0=A0 case V4L2_CID_VBLANK:=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D cci_write(og0ve1b->re=
gmap, OG0VE1B_REG_VTS,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 ctrl->val + mode->height, NULL);=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> =A0=A0=A0=A0=A0=A0=A0 case V4L2_CID_TEST_PATTERN:=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D og0ve1b_enable_test=
_pattern(og0ve1b, ctrl->val);=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> @@ -309,8 +333,8 @@ static int og0ve1b_init_controls(struct og0ve1b *og0v=
e1b)=0A=
> =A0{=0A=
> =A0=A0=A0=A0=A0=A0=A0 struct v4l2_ctrl_handler *ctrl_hdlr =3D &og0ve1b->c=
trl_handler;=0A=
> =A0=A0=A0=A0=A0=A0=A0 const struct og0ve1b_mode *mode =3D &supported_mode=
s[0];=0A=
> +=A0=A0=A0=A0=A0=A0 s64 exposure_max, pixel_rate, h_blank, v_blank;=0A=
> =A0=A0=A0=A0=A0=A0=A0 struct v4l2_fwnode_device_properties props;=0A=
> -=A0=A0=A0=A0=A0=A0 s64 exposure_max, pixel_rate, h_blank;=0A=
> =A0=A0=A0=A0=A0=A0=A0 struct v4l2_ctrl *ctrl;=0A=
> =A0=A0=A0=A0=A0=A0=A0 int ret;=0A=
>=A0=0A=
> @@ -333,24 +357,24 @@ static int og0ve1b_init_controls(struct og0ve1b *og=
0ve1b)=0A=
> =A0=A0=A0=A0=A0=A0=A0 if (ctrl)=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ctrl->flags |=3D V4L2_CTRL_=
FLAG_READ_ONLY;=0A=
>=A0=0A=
> -=A0=A0=A0=A0=A0=A0 ctrl =3D v4l2_ctrl_new_std(ctrl_hdlr, &og0ve1b_ctrl_o=
ps, V4L2_CID_VBLANK,=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 mode->vts - mode->height,=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 mode->vts - mode->height, 1,=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 mode->vts - mode->height);=0A=
> -=A0=A0=A0=A0=A0=A0 if (ctrl)=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ctrl->flags |=3D V4L2_CTRL_FL=
AG_READ_ONLY;=0A=
> +=A0=A0=A0=A0=A0=A0 v_blank =3D mode->vts - mode->height;=0A=
> +=A0=A0=A0=A0=A0=A0 og0ve1b->vblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &og0=
ve1b_ctrl_ops,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 V4L2_CID_VBLANK, v_b=
lank,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OG0VE1B_VTS_MAX - mo=
de->height, 1,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 v_blank);=0A=
>=A0=0A=
> =A0=A0=A0=A0=A0=A0=A0 v4l2_ctrl_new_std(ctrl_hdlr, &og0ve1b_ctrl_ops, V4L=
2_CID_ANALOGUE_GAIN,=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 OG0VE1B_ANALOGUE_GAIN_MIN, OG0VE1B_ANALOGUE_GAIN_MAX,=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 OG0VE1B_ANALOGUE_GAIN_STEP,=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 OG0VE1B_ANALOGUE_GAIN_DEFAULT);=0A=
>=A0=0A=
> -=A0=A0=A0=A0=A0=A0 exposure_max =3D (mode->vts - OG0VE1B_EXPOSURE_MAX_MA=
RGIN);=0A=
> -=A0=A0=A0=A0=A0=A0 v4l2_ctrl_new_std(ctrl_hdlr, &og0ve1b_ctrl_ops,=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 V4L2_CID_EXPOSURE,=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 OG0VE1B_EXPOSURE_MIN, exposure_max,=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 OG0VE1B_EXPOSURE_STEP,=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 OG0VE1B_EXPOSURE_DEFAULT);=0A=
> +=A0=A0=A0=A0=A0=A0 exposure_max =3D mode->vts - OG0VE1B_EXPOSURE_MAX_MAR=
GIN;=0A=
> +=A0=A0=A0=A0=A0=A0 og0ve1b->exposure =3D v4l2_ctrl_new_std(ctrl_hdlr, &o=
g0ve1b_ctrl_ops,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 V4L2_CID_EXPOS=
URE,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OG0VE1B_EXPOSU=
RE_MIN,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 exposure_max,=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OG0VE1B_EXPOSU=
RE_STEP,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OG0VE1B_EXPOSU=
RE_DEFAULT);=0A=
>=A0=0A=
> =A0=A0=A0=A0=A0=A0=A0 v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &og0ve1b_ct=
rl_ops,=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 V4L2_CID_TEST_PATTERN,=0A=
> --=0A=
> 2.49.0=0A=
=0A=
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
=0A=
Best Regards,=0A=
Tarang=

