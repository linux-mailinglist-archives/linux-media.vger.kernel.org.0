Return-Path: <linux-media+bounces-25910-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFC1A2EBF5
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 12:56:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7EFE3A5DB3
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 11:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0321F63F3;
	Mon, 10 Feb 2025 11:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="cqBQsPJH"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010028.outbound.protection.outlook.com [52.101.229.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442611AF4EA;
	Mon, 10 Feb 2025 11:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739188551; cv=fail; b=BA7WDWtSfw+KE7TjwiKPVUstrNUfh7QEqjeeNThxjuZCsUMuKNXT6ygy36hRIWN+6YpDM5jDjlfIPr6BYK8SCirqm9GN8qatArzpx4aTgaGfKEOekxWVCZ1JT7mOYPjlV+sqoSiXtuCzGdNgLSF1Z1rmmyJa0ldjdjZuHfxsQbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739188551; c=relaxed/simple;
	bh=PyFChtN1DW+YzER5c0FkUCw2BgLTUP97bs2khpClmKQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=icETNAnkSU7JSehQzhxvWPJjWhyFlZUomMzA/HrGlyIha4C/OHah9xvILRqQ4Rk+wMUJeM214FsH0rfMEtQ9c36KI1CKLmqVVQriJUda7Bv+sXWa3LVH66CoiriG8cbO58rJj4kw6cm3pj0LeaUhO1BrdPffukmqkSKAk4M8fGc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=cqBQsPJH; arc=fail smtp.client-ip=52.101.229.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W1Gw+FwD7MN5Yrdlkun1WDrRSvaQiudBbQsC1Ijapl079S1HmecCG7mPkhmdfCIRTYtbPhsNq8RircH8ytE5h7mN56xd1uFPKjz5C5IhGhSt+jFLRyPhM6wHDQK+iB/K8H3muyOJ9cJtTX7cy40j4zz4xUF0MPOO1+oKeOLpFnS5T8fk1/8slc6okyCg740zTiLy/dz74Xan7viLhqn4FyClhCmXDYdkcFaMAknDbw1vm/KQ80DLMjWpTXI0PkmFAmU42JNAAWMSnBHgadasJpJRL9LFLrjtKLhW4oKHcVUlUvp5Ku7NH3oSkZVz1QcRjwvJRacMsQzeRQo+NDAnfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kAwiorbBgdnVv1lKGyWdxNsAfawDChJdxcR9c2SP7ww=;
 b=SfGy7PS8rwjhzd0OpAEj1LhsIwx1Hw+/NR6sclsrYJM5MN4/tRx05j0Tz2PdormZV2HuVR8ynWQ9Fx805Yx7sOMLaKB/5zn9ltKFC3QqHcY4fv6UVg8Q9tMXKR9oHrlZYHGtiCjqZ9wCOmkrQdmopBC4hIiMlhiUGKJz2l9egsRcnKFF/pjvJeKcIZE273OWDNXacgUZe81mZpFJSMVRaNk7VoNwfeGyH1FJIcl4agEmJ04ScTSFXFgtGh9ZrFi8ciajhIECQo2NOg36Q+W3lysCodFi6luT2tXUzhelQdjG4UbmFR/Z68APN+m5SZd5zA5UDYaaC65Wwct1UNNeLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kAwiorbBgdnVv1lKGyWdxNsAfawDChJdxcR9c2SP7ww=;
 b=cqBQsPJHoHFuf1jhKQupPvidGuckFLJiVCYkfzokHombvaQGw8DPIiKMWTZSY9XtVfMqCkVwnZqGg8VBKmJr51Bq22wZMcBnyR+Np4ua+CCe2j6pPZ9BX/8RP6JcdS9zUaDnfPH70JnMZMyyHvsJ7S/T+7oKsWqtmnraqn4xJBM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB14590.jpnprd01.prod.outlook.com (2603:1096:405:23d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 11:55:47 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 11:55:47 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tommaso Merciai <tomm.merciai@gmail.com>, Tommaso Merciai
	<tomm.merciai@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Tommaso Merciai
	<tommaso.merciai.xr@bp.renesas.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>, Hans Verkuil
	<hverkuil@xs4all.nl>, =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?=
	<u.kleine-koenig@baylibre.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 5/8] media: rzg2l-cru: csi2: Use temporary variable for
 struct device in rzg2l_csi2_probe()
Thread-Topic: [PATCH 5/8] media: rzg2l-cru: csi2: Use temporary variable for
 struct device in rzg2l_csi2_probe()
Thread-Index: AQHbe7FwMHJakMJ3/kGcsFgqZouyvrNAbbPw
Date: Mon, 10 Feb 2025 11:55:47 +0000
Message-ID:
 <TY3PR01MB113468D351D5985DE8F9C4B5586F22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250210114540.524790-1-tommaso.merciai.xr@bp.renesas.com>
 <20250210114540.524790-6-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20250210114540.524790-6-tommaso.merciai.xr@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB14590:EE_
x-ms-office365-filtering-correlation-id: 146038b5-0ad0-4b70-70b3-08dd49c9db4f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?jh9fMAvzm+NJyg598ONI1lAHy+h3+hbfuhS3TJKX75ye8KBt4px5bHi+dO?=
 =?iso-8859-1?Q?z7r+hotKo9ZUUG0JnqzP2w1cQX8gLvJKv9ZSYOykrZ9pXxKYaNjbGDjHFk?=
 =?iso-8859-1?Q?NrTqFyXbF4DZE9r/6TEk8cPMnafeUWFwitYoh8f897wjR93lC859TQ41TY?=
 =?iso-8859-1?Q?08wKL5bNNwxeP2KVX0ZDEIaPDJNYHjNQdsQORJuBA5JUlGNdspIOVSwJCc?=
 =?iso-8859-1?Q?58Zu39ofQhwYcEKe0+Vb51pSJ8kJqqYAuIBzPJsMudXGo4HAqv9r5Doez/?=
 =?iso-8859-1?Q?ylFrgFSbTGROlukZRBlHmOXMF5Agu3wlqm6YAwJMoIoRYkDMheZBBM06Db?=
 =?iso-8859-1?Q?1NjRkSpEUCyhvkkAY4k1VLarPggSl0l9dYAlFYGSgtSduQxTiC7FSWjMw2?=
 =?iso-8859-1?Q?UsZKyD+GDihqf2Rj7/zpCZUp7/6k5slvC+k2ZmdeV1VuqnmoS9anX2Vldp?=
 =?iso-8859-1?Q?BK1S0Y/PBHUuwi1dzv7zw/Nk0NsWY0YA2mPpCaldylcHy2lJpdSnMkfd2Z?=
 =?iso-8859-1?Q?F4RGywdUKz4WVjh0rWuOANIgC4CkYctLN8iaUqZLO8k3kTmBSJK9/y3Ycx?=
 =?iso-8859-1?Q?Vlnj1v9Ws1nXcXSNatnL/LmazPSsyVqWDZvwGBG/OnrzHCEpGcCGjo2rK1?=
 =?iso-8859-1?Q?6dSLNdLqN2wqIYioz7xSmVTlo/oavgaLFhYRDmW7wHgZc1gW+SaliZOI98?=
 =?iso-8859-1?Q?EQ5H46Z6ZY5FDqmRAbBYNfsfvYHMVC7y+YQGxqvqw8tX5wI4A3QKlhY7RN?=
 =?iso-8859-1?Q?KDWwYIFBe7P3h1a4lkfqMhFMqYumirAnUxDag7vFHyLQt04lkVMWG5psv8?=
 =?iso-8859-1?Q?Ckkp5HWREs6ghb7RaIsVZC3cX+F1w2YaLxxfGI76iIXxIXWH/dmptY5jkp?=
 =?iso-8859-1?Q?wlLM58QHE4gMD5MCURV17UnaR7CHTwSbnldByjXnsao3wzu0fNfhQWcdI4?=
 =?iso-8859-1?Q?DjU6k/en3D0lo4hwq37PHQUdTi3mwE9kh8qmNzujFrDS+Vaosf9bL2raKj?=
 =?iso-8859-1?Q?WF4EgyekB9ih/7Gua+gq5UPcI+9IoxuMjp08v0ZyIO1ZohXz6kx3GX2IOL?=
 =?iso-8859-1?Q?3DBjny/4a9ZPBbSgS73CUCQOfM25w/FloQMlUY+1soBdB3LBvn30gbJ6Z/?=
 =?iso-8859-1?Q?XTsR2ej3aAntgmmTf5JhJR+yV2Ol1qg2B2atjxAiJNBLDGcexKZS3+bWlQ?=
 =?iso-8859-1?Q?LkkdcqxWYw0qU5UqAIZGhJ4DdqLZQLp6ggqrFHde+rXzrJcR/GuOXWfZMw?=
 =?iso-8859-1?Q?pVu/fe/0N9kl0E6L4kf2XoXayDG4sWOm92QoKmBTU+PJFIQuQqReN3MiI5?=
 =?iso-8859-1?Q?ZNUl2rtXg8nWcW8os6W1rRdgV0LA/ksjQQAeqzM6GKds++KDghc2T0jQ5s?=
 =?iso-8859-1?Q?2+HOV5canmpJ9yFb4CMDc0k0GujDdn8pumoVxzuqgn7KNiJZ53XogqAl/5?=
 =?iso-8859-1?Q?Zket7y4Np/wUSWBmbNgjS1TguLQfL/Y6230ZXuGlLq2NJ7DqCDLfpB/9kq?=
 =?iso-8859-1?Q?vdMW4URJSVPzwazuvGAn3T?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?u6z4v/PIneWXmEY4Oncv1LEMadzkfG2V/vJH0ENOpM4ZSHEGDVhgFjQ2EZ?=
 =?iso-8859-1?Q?p3AyaeOi/UFIlw2fbv+rtkUkIL0ioAaoMCQxmWHmgyyl9jhYKuddgkFSZ5?=
 =?iso-8859-1?Q?34hrLvXJ84CntOVx6jeCUUkBqLL+QX9YPA2tHQSMf2rT9sFGv852TKeFJ2?=
 =?iso-8859-1?Q?VlvggEbiv7uD70/rJ4aOCSrWwIkORmE8Ef7gn0Umksvd0PQ83GNKapNA0E?=
 =?iso-8859-1?Q?vhw9oKHe1gKa05n4MtLml1NQjgQz3RMwlXpG6mCx+vFZkw2LS/bn1wlI7e?=
 =?iso-8859-1?Q?0g9Kbh39DSQ2vC6YtwuMMWJ5IdKB0/kVrvcXtrhBFm6AvCmTND2q+pn6WW?=
 =?iso-8859-1?Q?ss1MxHFtjzs69X0DbyaQ+970yjZu/2C5CyN2um1HTu9djjOHEhQDDPhvfl?=
 =?iso-8859-1?Q?+3AQvqrumZye3ixpfjVlRHtXiYK5y9Pkz/ydw9f/bm/8GlB5Dhljv6eKH1?=
 =?iso-8859-1?Q?s+MEqXmX9iuRWzW3xgwaRKVOzM+jFMPS3YJYDQSYu2YEgbQ+IiB7qjANay?=
 =?iso-8859-1?Q?tHKsJYPJb5DENXAr+0v8LXOlsMgDOPqBu2sQq2YjPgYDuR74vuZoZQaSr2?=
 =?iso-8859-1?Q?iuLrNtElzYnB4ut+ai6JtNR66p34XHFhHX2fZhB6lgbAWD9QfXov1MQo41?=
 =?iso-8859-1?Q?/eXqxI2h0Qh0/Wm6OkrAQkeYhzAjXj+ww8iwOwnA1d0UN4hzvK0ST2FA/4?=
 =?iso-8859-1?Q?LG6hHnEfea7siKOjDzI5t9ujjYFA4Owugy59aeUolg6xHFb/RVOJiWsPwy?=
 =?iso-8859-1?Q?rK2naiwiXxBqPXltDVYqXjPGtjhhIKPQNNDMb3JbhCFqDsRJJ0z1g2aRrL?=
 =?iso-8859-1?Q?Nyb7aGM5Tapp5pn/cyp83GOyj7uVtFJNfnYybLVyv5r3d7rF5DJgg1DiVy?=
 =?iso-8859-1?Q?5yYviTk7a0zh/ElsRrUeSDh2bZfDPvdmIc9DZQe6TddIUYbGOsRk9eZQZZ?=
 =?iso-8859-1?Q?dcGuPqWes7P7HybEco5u4WAMjgOCm2sqnEksLNiR3YeHmU3yNA14jn8u+2?=
 =?iso-8859-1?Q?RKkUYiH1uqL4Ep2WUSxXLYbFAOTdKaHAqM4qnOraTqEGF6u74NhdNctUx4?=
 =?iso-8859-1?Q?218fDWLZbvTtaafV/kKohay7Iy9thLGtmGg4CDYESoClaWu/gLppWCBudk?=
 =?iso-8859-1?Q?mLuLaUAxlFbDco0oxPwONjhOYYsRIZ+tITi+MTVScaILXbmo3fHISnvZiC?=
 =?iso-8859-1?Q?zWnFYqy2V11m2Xv5IOUrn3KIVkUifjbmb6D0SFsAfli5TFT22GUDCvC3mU?=
 =?iso-8859-1?Q?WPcw6TDKcxRH+wlJSbYG+JnLbSqmPoVyljlVFzLthg9s42+81WMeJKFH9p?=
 =?iso-8859-1?Q?Swtnqt7BPEZuo0cqVVuCsYBXmqhyeg8CzNKqrhTSns1YJ+G3iwcST43T94?=
 =?iso-8859-1?Q?FRi/UNN7uxaQ/b02k2NtzLCXcRKEUlQZ6W0coYr6AGzFlfXYeVBP2p9UKL?=
 =?iso-8859-1?Q?UlMrHebulWP0xGFmOuIuL61jVnHLMTQvqdeMd+M4NU4ginAmGQ781F8a8K?=
 =?iso-8859-1?Q?OTkho2hA38LQpJeCzgp44qHC0amxdoElZWvtjFSJSkXOIfPt98DDDaZj7x?=
 =?iso-8859-1?Q?e7NcIube9ds7BJKoPdNwtzR+8irNiqKJpjixtLki3vRoPR2Z1w9Xk8xERI?=
 =?iso-8859-1?Q?Xlh7HiVgRvRYJSNHkDMZdT8UuUA3XzQANBHMT5jt0kDoFSueOzU4hn4Q?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 146038b5-0ad0-4b70-70b3-08dd49c9db4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 11:55:47.3058
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mKne7ZgDlv5NrOaVulGGGghIY541X8/z1v8KHY+TMbR4Je9Kagrc+ghbc+rhouHZlHsi2qzRRnnGj4zWpjjEpZ31gy8M4jAfCaX39t9H9GQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14590

Hi Tommaso Merciai,

> -----Original Message-----
> From: Tommaso Merciai <tomm.merciai@gmail.com>
> Sent: 10 February 2025 11:46
> Subject: [PATCH 5/8] media: rzg2l-cru: csi2: Use temporary variable for s=
truct device in
> rzg2l_csi2_probe()
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Use a temporary variable for the struct device pointers to avoid derefere=
ncing.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
>  .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 31 ++++++++++---------
>  1 file changed, 16 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> index 881e910dce02..948f1917b830 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> @@ -764,10 +764,11 @@ static const struct media_entity_operations rzg2l_c=
si2_entity_ops =3D {
>=20
>  static int rzg2l_csi2_probe(struct platform_device *pdev)  {
> +	struct device *dev =3D &pdev->dev;
>  	struct rzg2l_csi2 *csi2;
>  	int ret;
>=20
> -	csi2 =3D devm_kzalloc(&pdev->dev, sizeof(*csi2), GFP_KERNEL);
> +	csi2 =3D devm_kzalloc(dev, sizeof(*csi2), GFP_KERNEL);
>  	if (!csi2)
>  		return -ENOMEM;
>=20
> @@ -775,28 +776,28 @@ static int rzg2l_csi2_probe(struct platform_device =
*pdev)
>  	if (IS_ERR(csi2->base))
>  		return PTR_ERR(csi2->base);
>=20
> -	csi2->cmn_rstb =3D devm_reset_control_get_exclusive(&pdev->dev, "cmn-rs=
tb");
> +	csi2->cmn_rstb =3D devm_reset_control_get_exclusive(dev, "cmn-rstb");
>  	if (IS_ERR(csi2->cmn_rstb))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(csi2->cmn_rstb),
> +		return dev_err_probe(dev, PTR_ERR(csi2->cmn_rstb),
>  				     "Failed to get cpg cmn-rstb\n");
>=20
> -	csi2->presetn =3D devm_reset_control_get_shared(&pdev->dev, "presetn");
> +	csi2->presetn =3D devm_reset_control_get_shared(dev, "presetn");
>  	if (IS_ERR(csi2->presetn))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(csi2->presetn),
> +		return dev_err_probe(dev, PTR_ERR(csi2->presetn),
>  				     "Failed to get cpg presetn\n");
>=20
> -	csi2->sysclk =3D devm_clk_get(&pdev->dev, "system");
> +	csi2->sysclk =3D devm_clk_get(dev, "system");
>  	if (IS_ERR(csi2->sysclk))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(csi2->sysclk),
> +		return dev_err_probe(dev, PTR_ERR(csi2->sysclk),
>  				     "Failed to get system clk\n");
>=20
> -	csi2->vclk =3D devm_clk_get(&pdev->dev, "video");
> +	csi2->vclk =3D devm_clk_get(dev, "video");
>  	if (IS_ERR(csi2->vclk))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(csi2->vclk),
> +		return dev_err_probe(dev, PTR_ERR(csi2->vclk),
>  				     "Failed to get video clock\n");
>  	csi2->vclk_rate =3D clk_get_rate(csi2->vclk);
>=20
> -	csi2->dev =3D &pdev->dev;
> +	csi2->dev =3D dev;
>=20
>  	platform_set_drvdata(pdev, csi2);
>=20
> @@ -804,18 +805,18 @@ static int rzg2l_csi2_probe(struct platform_device =
*pdev)
>  	if (ret)
>  		return ret;
>=20
> -	pm_runtime_enable(&pdev->dev);
> +	pm_runtime_enable(dev);
>=20
>  	ret =3D rzg2l_validate_csi2_lanes(csi2);
>  	if (ret)
>  		goto error_pm;
>=20
> -	csi2->subdev.dev =3D &pdev->dev;
> +	csi2->subdev.dev =3D dev;
>  	v4l2_subdev_init(&csi2->subdev, &rzg2l_csi2_subdev_ops);
>  	csi2->subdev.internal_ops =3D &rzg2l_csi2_internal_ops;
> -	v4l2_set_subdevdata(&csi2->subdev, &pdev->dev);
> +	v4l2_set_subdevdata(&csi2->subdev, dev);
>  	snprintf(csi2->subdev.name, sizeof(csi2->subdev.name),
> -		 "csi-%s", dev_name(&pdev->dev));
> +		 "csi-%s", dev_name(dev));
>  	csi2->subdev.flags =3D V4L2_SUBDEV_FL_HAS_DEVNODE;
>=20
>  	csi2->subdev.entity.function =3D MEDIA_ENT_F_VID_IF_BRIDGE; @@ -852,7 +=
853,7 @@ static int
> rzg2l_csi2_probe(struct platform_device *pdev)
>  	v4l2_async_nf_cleanup(&csi2->notifier);
>  	media_entity_cleanup(&csi2->subdev.entity);
>  error_pm:
> -	pm_runtime_disable(&pdev->dev);
> +	pm_runtime_disable(dev);
>=20
>  	return ret;
>  }
> --
> 2.34.1


