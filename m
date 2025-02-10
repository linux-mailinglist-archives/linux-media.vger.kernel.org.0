Return-Path: <linux-media+bounces-25913-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D6922A2EC04
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 12:57:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F6B51888C91
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 11:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A2FB1F3D53;
	Mon, 10 Feb 2025 11:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="km/c3AvS"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010027.outbound.protection.outlook.com [52.101.228.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CAE1F3D57;
	Mon, 10 Feb 2025 11:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739188649; cv=fail; b=AKEeVuOJfd8NxiuQMmyN7DtQc7NlI02uxzQy8tkff5v7vzbc9n6qF1N9Ch+5sOJGNMMC9XYSJV839CAufzOpfwG1ceCfg5Qbur3cW6sJVNBF21wdtIfA1Bz2YvjF0tMVueQ376+Hb8w4m5MUOWlRYjPt5F4LG+x3j443edBlTbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739188649; c=relaxed/simple;
	bh=sjKtCvyb3fb5yDfx05wKdAjdShALVYO+5GnMCp3QHGA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qwheY0MU0uQUwNoEtbUdbCsjP/vT0t49xkl8PTYMuWYO0TyWmDdQdhyPluwY1POlrnbJ8vX3EWsFgkqQJ0WKUnS4+Zh1ypaTYiz3ViEEC68xov2imhSSoDaoGMp3X4s3gP4zPWMNV/i9pxoeIfHHT5obgaWOfJgpkcTZO0JFrnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=km/c3AvS; arc=fail smtp.client-ip=52.101.228.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I4F86NA7LEQSHdrsGpYQ+5gdWrN2pjFkoJK+bB8f9bkxgrtL6LeiryM12aY+rNoP7xogDM0JAw8mIb4KuPsazU+Kw5gdyax0Dlkhy5DdRfMXFFUagQd5+oT8oyVTK4S8v237uZ45QD5UUbqVAQoqsV49sqMEUEnUuGRTC9rMlUas5AJ8etQ1GQQ7s3z5qXJAaCjutWJBy/HmfYUmOL9626w9/34P6TOg1wSy5VtR9tOZgMJ0Dxap5cAm9nsWAjCMTjIZs0OUrFTPA7RiK3/hUrH16bLbloPqS/0ZnNrhw0Fakp8v0Y5GG8VQfh959MM8Wxvl/ygedh9tudSjT4Ltbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5MYkLWj8gbiCPXeDW0uzxiVpU0DC11KMMdJ/USAQH8=;
 b=wxg1uv0lGhY1Yk8ycwzVuDTVkarxGZzDPpBtRuV09Pk/zoQ6QN8563T0dFoabYVt+04bo4AljRHimeufautVRf5O1DlISW50B+yDa3+TOEau2hg0lGJwaoAyyV2uZc0XNvo9YPNlbHzweqGN08kcsxjj5qDpu5JTQL1jMcQAvdC1eqnBj7+MVuludwLAy2z0IZxMpxZv+Nk6yVZ4zm6y62W2Eq7CZX+i5phf6FSf4vKfBrhFq4nlI5/OFi8g1kwOzIChw+6Gli2LjQFcoXrHwq4c+mcdJejq4ZrXWT/8OV+H/xEIi50aY4dZ+/pva1bw9sIK5pbhpBDr/0/OYbMhtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h5MYkLWj8gbiCPXeDW0uzxiVpU0DC11KMMdJ/USAQH8=;
 b=km/c3AvSR3nCwutSL8ZbLaKzuR2wmR3ZvChsAeNwfioYG9GR0uQrB8lIaVVew8aOgsIgqvOzqmW5l+vRrTXE8tfO+lSRRwZ86rE0amd3nT87pvEEzLluRToxUInJWXpp4qnrs0NEUs2PdmKXEvvOFSSvZTLa9CqITXpZZzVilB0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB14590.jpnprd01.prod.outlook.com (2603:1096:405:23d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 11:57:24 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 11:57:24 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tommaso Merciai <tomm.merciai@gmail.com>, Tommaso Merciai
	<tomm.merciai@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Tommaso Merciai
	<tommaso.merciai.xr@bp.renesas.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Laurent
 Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Hans Verkuil
	<hverkuil@xs4all.nl>, =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?=
	<u.kleine-koenig@baylibre.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 8/8] media: rzg2l-cru: rzg2l-core: Use
 devm_pm_runtime_enable()
Thread-Topic: [PATCH 8/8] media: rzg2l-cru: rzg2l-core: Use
 devm_pm_runtime_enable()
Thread-Index: AQHbe7F30dLCRgxzQUOlsbHvYJCv1rNAbmbA
Date: Mon, 10 Feb 2025 11:57:24 +0000
Message-ID:
 <TY3PR01MB113462B62C51C75B2DDE7B4C386F22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250210114540.524790-1-tommaso.merciai.xr@bp.renesas.com>
 <20250210114540.524790-9-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250210114540.524790-9-tommaso.merciai.xr@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB14590:EE_
x-ms-office365-filtering-correlation-id: 6293d8fd-b1eb-4c62-53ee-08dd49ca1555
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?lKzlOrzGaG1BCcNAnvGZc03R7tOqvfv+I2za464Fses/S3EI0s3oZK6Nmd?=
 =?iso-8859-1?Q?XNy2hZvVrxlVDXJWDOWlOWjSjFp2UaENDFngPrDZ++zO86K4M8W7WCFU/B?=
 =?iso-8859-1?Q?Y3MhvCUl+DY5HtidmJNcp03ad+pqnrHYEq4FocfBDpXPja7AyvAvujtGle?=
 =?iso-8859-1?Q?xMTR5a5WNL/tMKhl4S7RtzyYlLDo8oW8vTNtiwOQM4Z7cbt10VJAMDITjS?=
 =?iso-8859-1?Q?YCqvcXfHv4xhie3BEDLlMF3Xc20HdyKlfTTT8xIe1VBwUZQRu6jg12O4GE?=
 =?iso-8859-1?Q?ikL+6fpR0fcOdqDAbMly52yKa1+kcegoGc5aYHAMhEyWGeQF1Ask06CAuK?=
 =?iso-8859-1?Q?bcPTRH083I99fR/3Kdy/1CMWLYgs8IY37iQcd/CVgOVY+Al3c8Ay2pc7x9?=
 =?iso-8859-1?Q?332kjHTUl7er7lpbhJcV0ICFgzJp1LHwNxblxGPfgTtcFs37vybfXaTJzz?=
 =?iso-8859-1?Q?rHH85ouJE7fPTIxbARxC8EdY6WF68cZ4w+RENxnM741s7SzS7yuwUJkoqY?=
 =?iso-8859-1?Q?98ag6vqd3SQKf1WVqNZzljeLB0fadA4NhD7ps1W1INAGwAoNjdFbYNblwR?=
 =?iso-8859-1?Q?BZ2jfB8uBrA3rcUSWZ9XkeifoA8it4+RGWSe4BzzjqSHYkSvsBNqYtmeaa?=
 =?iso-8859-1?Q?bZyWP9crdr4CICR6DEcec3X8G+R+5PbmMlMtkQY7FVnE3N+3nyUnlwcI6Y?=
 =?iso-8859-1?Q?ylxPshFSz/RSc0Qn7+bKlHOACIo9rky3Vh7dWhM/O1JRFEBRAYfS54Z9yu?=
 =?iso-8859-1?Q?AzDPhYoDJMjRTD+rWwBnZx9r5lMkik2fe8YbQWh4LqevR9V0UsuFnT9Gh6?=
 =?iso-8859-1?Q?f4TB2bl5q4TxYpfHW8RaLvB3K320VBMVviERl/xYJgr4TNkjbN/O5160TV?=
 =?iso-8859-1?Q?ftXvOdYzZlF/fJ7eNqCvCO2n28t+t+5C7yd2QHPd9jYHHwvt0V0Ky9zh6s?=
 =?iso-8859-1?Q?6BBOjrwNdVs6jgMMZwC2wVjX4QRhlx8xvhwUZzNvYlHUhuFaB9zTQZ3+Pj?=
 =?iso-8859-1?Q?ybImBmpfxgJLZlSMqHmPnFIb9xJn5EQojwTzYihvAZ/3RcIJODutBdweTw?=
 =?iso-8859-1?Q?Lirpr8yBKaethLJ00pViSICiV0SiQs6iIRE6uv5GypUlFhzGVswrlJfiyU?=
 =?iso-8859-1?Q?ATgXjeRHdoUdQqd7xu37JWdelh55HX0oo8gQRvpEuGZK+o0hLbDmu/J/YV?=
 =?iso-8859-1?Q?b2JAcE4USrszsVBLQ0ehaoTEsAGtbD+iiQbUTCaJKN3Dc1moeiYq9RfxyY?=
 =?iso-8859-1?Q?HBGNC1glWz4aFvLVlxlJUhVzcnvBe9U9dNEQrXDTqoxPcj7HQk66WbDpHR?=
 =?iso-8859-1?Q?G+Ga7RqG88Ly/SC+hYz7fqhCaJneTtvLsHmmUFsVOO6B3TaUSGfdAChUxz?=
 =?iso-8859-1?Q?OzPtjBIR0V2jNq2SGF+gczkp/d3Cb/N7+keihfWMTF1yDeLtnPlrTkhVR7?=
 =?iso-8859-1?Q?5y8/nMoeIW7A5g8SSknZsGm983e072of8L4wM6R0hQHcWsrMM38HA+2lR/?=
 =?iso-8859-1?Q?I0EVwfe+r3MWhMPcwDdLe0?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?hjQmvqzzBNMJRiZB7sOZPm/NMiszHtLywAqjrliGc2a/+pwqJGjStgs5JT?=
 =?iso-8859-1?Q?kBsjCuxj/P8+Fk8wrlnK5lf7PpYImOqAiwfA1fHhI2tYUJ4SNvOD+Ga22A?=
 =?iso-8859-1?Q?LJliop3/0HOC32c9fMGmSL1EBcr766HTtIMpSDa9vZyRbQxWbd/87gtdjR?=
 =?iso-8859-1?Q?avIVBzihXSepqdZq6W2ytHJpQecTAoVgtAtE9Ucjh1sOSPGV1B5Sfv6+eg?=
 =?iso-8859-1?Q?sY6DX58Gbv8yiaJfmI6mkxhCnMvWYcFBEm9nQavu9kAGPo8sNxlVeW3LpT?=
 =?iso-8859-1?Q?uI0UuPvmDb3bJlusXixl6b7iN0TkoEb8l/Fvupg4IGB4Shb/Ki60atahgO?=
 =?iso-8859-1?Q?JZHtZTIqGx6lzvvd93p6+ZVEotX1ZmTqLiab2aUGZ4dVxoRlVcrzkgvfOX?=
 =?iso-8859-1?Q?Dgu2WD3+x+X80WEfUjbHiDkIhn7FHouNz8O8ZNiqBlKa0Y9PpB3+LT3NSm?=
 =?iso-8859-1?Q?MVaYDMlc9IjvbFUfocnSjiZtsGbNw9CABL7PayQ7bHgh3zAOeWI8+ryOxG?=
 =?iso-8859-1?Q?d9XKNsdUZNeYRxyBHCzpIc9bCCd8Be+Kv/ezdkyZUhzmqSDdsDjyXwBafx?=
 =?iso-8859-1?Q?hCvUKwadaXggnUhuVoIr34itsvlAT/KJhwaJ5QppfA9C4/wVsprw4BX4Cc?=
 =?iso-8859-1?Q?VWzegcV2Iy3xilu+0iOEu+WzIwxuNkzi1BN/8eqkQv2fLiQzLYz+2gBREj?=
 =?iso-8859-1?Q?PtmBX/uR7dBO8BAkx4xKXwfg9uUZzXbKI8hxuo0hMhpyvwWfiyigsxXIuu?=
 =?iso-8859-1?Q?wt9nX5shLNINO1C/e4aoY8QR3wIFahi2+/E4xY6P0j8sCwgFPkJlrksNw/?=
 =?iso-8859-1?Q?UWIn7aOg9DdqxzB0wHwemDMwbSqhDfHokvXMBnZZXTUdoPKW0alZgKRoqQ?=
 =?iso-8859-1?Q?ilkKc5qDHi24JY9YsB8WG1qXdYw76oDH5qixkFrEyEbwCW8u3CFWDNH5I2?=
 =?iso-8859-1?Q?joM2eX+bb5kTHdQ7KkNB27Y5DLrQehdOUSIHxB2XJ0s3l1ws2j7VLqkOh7?=
 =?iso-8859-1?Q?f64o9cPH5UHlod3dDT2sTnfyxmrxON1RYqdibgmRoymsjQKfdJ0y9NKcnb?=
 =?iso-8859-1?Q?rtnSAJqNXeof5nQ3LSMb0HwAecL/xSOOmdw2Z+kHUw7mVfgQhZ0k4PfaNu?=
 =?iso-8859-1?Q?lLVEkmgBgV0fvRg+gw3SjF4qvd0ZPy6Rzw93ziLGeKTYNYCZQIBx0FI56A?=
 =?iso-8859-1?Q?uAaepkc7PkISeKZXXJhTHYC8+A/hJ7tDgRLGpY+3QeO+0NJfHH/9rfkfdE?=
 =?iso-8859-1?Q?tgF0/3UNyfkW1PQxZb2qf/nc1TgZHD2PBoAbkngraz7Co4H3YsCZtUaCXX?=
 =?iso-8859-1?Q?DkT/DEAy+bhGC6j72WNht2wUOPSGgCzlcqncJLm/6wEZnGZFqZ8VwNCPVD?=
 =?iso-8859-1?Q?+PnVncpxFdFIkYGTiKqspEC/SbMsFwwuEdhkiatQmaM7/vOsa7OctJQBdg?=
 =?iso-8859-1?Q?OFBPoDi7q47Ty6KvOoXiW/ASwH55gB8GFXJBe7Fs2oyf1UAWKffbSXa3P8?=
 =?iso-8859-1?Q?1QSRlsIpRcuzOa/rbuhDZpUVPavkbJn/vEPf1ZeZYykNSJVLzcGOgu76WE?=
 =?iso-8859-1?Q?zAmss3cAqcF75fI8ka61j052Q1jH+6HxKot61WWm7IiA0Ymf6FWdEs3a2X?=
 =?iso-8859-1?Q?rOtbs0tauv56WmnHVzwysszCP97Ldz+ScQ8vmP9gPQm70jmDZ5A+r4UQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6293d8fd-b1eb-4c62-53ee-08dd49ca1555
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 11:57:24.6496
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nTbA+7pwhfQ99rDmynYx+RAkfztMinnSQ2fJL280ERzO0ex5tNlYDi6sudsYCYMSha3fGLHHFciDMTtQs4RzPImmkXmfpgYNLagFx09GWyQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14590

Hi Tommaso Merciai,

> -----Original Message-----
> From: Tommaso Merciai <tomm.merciai@gmail.com>
> Sent: 10 February 2025 11:46
> Subject: [PATCH 8/8] media: rzg2l-cru: rzg2l-core: Use devm_pm_runtime_en=
able()
>=20
> Use newly added devm_pm_runtime_enable() into rzg2l_cru_probe() and drop =
unnecessary
> pm_runtime_disable() from rzg2l_cru_probe() and rzg2l_csi2_remove().
>=20
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> index 70fed0ce45ea..5548b328d970 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> @@ -287,7 +287,9 @@ static int rzg2l_cru_probe(struct platform_device *pd=
ev)
>=20
>  	cru->num_buf =3D RZG2L_CRU_HW_BUFFER_DEFAULT;
>  	pm_suspend_ignore_children(dev, true);
> -	pm_runtime_enable(dev);
> +	ret =3D devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return ret;
>=20
>  	ret =3D rzg2l_cru_media_init(cru);
>  	if (ret)
> @@ -297,7 +299,6 @@ static int rzg2l_cru_probe(struct platform_device *pd=
ev)
>=20
>  error_dma_unregister:
>  	rzg2l_cru_dma_unregister(cru);
> -	pm_runtime_disable(dev);
>=20
>  	return ret;
>  }
> @@ -306,8 +307,6 @@ static void rzg2l_cru_remove(struct platform_device *=
pdev)  {
>  	struct rzg2l_cru_dev *cru =3D platform_get_drvdata(pdev);
>=20
> -	pm_runtime_disable(&pdev->dev);
> -
>  	v4l2_async_nf_unregister(&cru->notifier);
>  	v4l2_async_nf_cleanup(&cru->notifier);
>=20
> --
> 2.34.1


