Return-Path: <linux-media+bounces-29055-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E2FA7662F
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 14:38:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65973188D189
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 12:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C33F1F8758;
	Mon, 31 Mar 2025 12:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Bm9mJNoj"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010033.outbound.protection.outlook.com [52.101.228.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108BE35966;
	Mon, 31 Mar 2025 12:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743424720; cv=fail; b=b+x4C+RmGXBUlYRn6EYWXc8Su1dqvsrr856CwzB0Q2nge8amIl92vj/FjBm4HKclKXUu4yvntcO5y35hHGrKEswC7GKUXOG++7HVuXChj/q4tKcCs4AI2nK+M/ifTpIlqq/uhR3jNSUpotGS7G3LncrED5OImNXgG+YrHHbB3bU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743424720; c=relaxed/simple;
	bh=2rv9BOuxYXgnALzKw8fMxWAVtaYDScOlV8seHGZJyBU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SFBvtdejJTbxOAhvQQLjuqcTGF9gZe5BUwmoIxZIUuunhNX2ZJdSxj+2+Sy6WRgO7tBPhPGH/5rPYOqzmD5FQKxMLZuXXtJq/FYNPThv86DMOQ/UWXazFW9iu30ddfmBuw5VGeLrQOgb1EhvdWMhNiH9tjKCwzVva24zjWnP9Bc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Bm9mJNoj; arc=fail smtp.client-ip=52.101.228.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tBvZGnpXQQYy64IKjI3ZXCfQ15yvH+JLGW4+LZMxoPK9lLqshox7auBHq99O7iwf4zoORbnXBU+A5+TsA8uQl5NmXwRPgcRKboX94b+KgT6rDPXLKYnyJczgil2IiAVxNOa/QIN/x46AvjlqoGoFFGeYm1huUIiTv1D//Ls/NFkYCm+mv+T3HZ/1XATQQOPiOqpQuCSTR1I/NOXbgYAJ+/oXGv2hnRXpWvoUfVJtEQoHgbNsf5u5I1mpzINiAfsBJIeMb7CEEOsVVNWMVvbwl15XrB2Dl3kmKsvFgqpsqULegDh3ggf6BCSnyXxiug7dRRLUpJlLhOYXnfU99msKvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZlnZmZSoL3tiXZ/ceJ5K1Vd+Uqd2XZ01hp4x1stJ3wM=;
 b=yCnruW13J6RlFPwzFq1EFAo/9bEWyiH6EEH3gt2WVmHyd5zNlVEf4GeB2AjXxCGN98A/IQrOZqNwxSntnYvCVWFPxodJTfZg7bysz4cfrcnaZUZxnuUKRmmF4NYN638WZThU/dPT4LhzkkI4Fv7lbejDGC8hM7hU/t2I1bVZ1u5hGJ57p5zy4eSlYdsUxHfQnatQUf9g8ejHQBXLGevHWsxMqzmbaMZfE9DrRbsmt8BZVY8q/pCn999Wfwi4CiC+6EKnnVIq0oEIPiOfDcBJAPSaBH7hxzqKGpk/71K2f7vXkEt/d8Rzcgb5x6PhE28PxhMC1N1dtXByFL1+Txfa8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZlnZmZSoL3tiXZ/ceJ5K1Vd+Uqd2XZ01hp4x1stJ3wM=;
 b=Bm9mJNojHHNMjXjurcGDHap6nNR0R96GhkBtpEWuk6OQ/You+A3NVlBW+ImPm19RzEPM29PXOp0rxbdZn5ftfdl+Ckj0RhnH87Zt6AL8rsI3mMhNkL+xNs0OoQJVjEL5jF7tVPP3N3edagCJV6js3e5yNvfV8UAwpEUHaf37nJo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB15620.jpnprd01.prod.outlook.com (2603:1096:604:3bd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 12:38:33 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8583.036; Mon, 31 Mar 2025
 12:38:32 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
	laurent.pinchart <laurent.pinchart@ideasonboard.com>, Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Kieran Bingham
	<kieran.bingham+renesas@ideasonboard.com>, Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 11/17] drm: renesas: rz-du: mipi_dsi: Add OF data support
Thread-Topic: [PATCH 11/17] drm: renesas: rz-du: mipi_dsi: Add OF data support
Thread-Index: AQHbobffKVZaNpzzt0OUbkVl0xBRjrONLy9w
Date: Mon, 31 Mar 2025 12:38:32 +0000
Message-ID:
 <TY3PR01MB113463B37FE6B1AAE8CF0F51F86AD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250330210717.46080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250330210717.46080-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250330210717.46080-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB15620:EE_
x-ms-office365-filtering-correlation-id: 29e16292-b24d-4246-b953-08dd7050f2bf
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?+V7NRJOx7gomZNyP7NT91qmHvBYNg08YDETrws+sM8bwRmgsaT4PIMUazB1+?=
 =?us-ascii?Q?3c4i5aAKhAI1IKkA7gjO8COJW9ylgX1EpouaHcQ/f8lO5LBIjrqFM0NoFdVu?=
 =?us-ascii?Q?DXTJkG2MQGNEoAeEfk8VjA7UTxQ5UqIK2sQiuWlZSciYsMh8YCajkwvO0zE9?=
 =?us-ascii?Q?+7zTwAMg2/CrXqC9dIdGzv6val3sHx3VPFLl2D0NPVLCnnpvtigRfPIBSQXI?=
 =?us-ascii?Q?hjeF7nOMOR+zDj+1D7pHB3m6loKhwS6xD27+4hB4thqmxQJVm7QzsBfP9VYH?=
 =?us-ascii?Q?T0KCuPp2mXIA+uf1JDviJ0rfq0XaCCxgCFAvKgv3qrhMgtm2ng3FLpHUeltE?=
 =?us-ascii?Q?mH4qkEGu/sLWEE1+LCNq14ScDq/eFrlhKiGiGNhfXgw6+kPGdn+5TPvEAzpj?=
 =?us-ascii?Q?A/14anuD1oRUOThDJtpIT3supkG6+MNOTXEHJKDrZqKSiEzSofXm9GVGCO5y?=
 =?us-ascii?Q?w34wCqcRzCMbzBHk1CaUvo+HyKc+/4LCXUES98TEmOg/iFhRH6qoFS8E5dtE?=
 =?us-ascii?Q?7TL/mHcoymfsQ/ITHr9Yr78ms1mu/Xyb61OeKofWFgDiCHjTbyP49e3KlrDd?=
 =?us-ascii?Q?djduua5fVfyzAdzIiRzgXrICvNsoVLLD8p1bjG0JBQNgAhwVL+bq4jwxbqXw?=
 =?us-ascii?Q?smoToQnXfBymw616S2TmxH35gSSh+BgmPnRHpOhNtSagnXNRZUOJe6o9gJJk?=
 =?us-ascii?Q?xqiySuzlK4hjVUX4aEA5JRzIk+mrB2VoSbxj3fHl02MdTelfhvfAh0Kg5tYh?=
 =?us-ascii?Q?3vGLgEPH7rqt+t7fcjevXZGkieKDL1g+yng4pfRgS1A/j3e0uOVsO97n5rXE?=
 =?us-ascii?Q?LM7Vi833Vw2jydc3maJ8wf6/gr3zz+99p50xzTYxN2FaeKcVKdW2ypFa9j22?=
 =?us-ascii?Q?Bm19oa08Gz7Zl0W0LUqpI8CT6HoNH/ZsIlL8Bla8bQpylGY1g7+p6dKanCzD?=
 =?us-ascii?Q?0sr2x3ATvW364lz4rhtpyLrGpbQXGvmdN7s3DXanwLZzhMr5VAJQL8VsDP5T?=
 =?us-ascii?Q?G2nPsTn3ohnQv//2mIkmK9WKkglMnVyeQE37CD45c69TIYnfaYsY6/rtAXj5?=
 =?us-ascii?Q?GEjV+/CdDv+m34axM0iDrhNd485GsE8L8f1cpYeYoe8o30Ymye95Jf2dxa7y?=
 =?us-ascii?Q?j9VNDekwR2XRSR2VKCUZtHNbQAcqb6vV2AYthSFl39j4z6HzAsk46c41+XF4?=
 =?us-ascii?Q?+koV3b1DtMM/6Z1MGY+X/Deo5Hkt0uaAD3Ysp/NbXr1V+4XgroVSJbVvdneb?=
 =?us-ascii?Q?OCSekmw5FPDxrki1Nt1PUDEiPejaKh4BoClPvwIeWWftVmA4YWqFqpM3W7M7?=
 =?us-ascii?Q?MlUP+KWkfHMP0aMSlg+wTxJWAdXOgLYXDZmwmszjFjCc/dbTLFMEEZoAlnw7?=
 =?us-ascii?Q?t1Oea3HDghVoOtR53/X4E7Fs0xtRnzfylmLvTcrE0tMn8SVAplTr6O5s7l7L?=
 =?us-ascii?Q?IywMkU1QIQZcIDAgfzZumXuszyy+1+2VOtbC310jRaKs+uOVvzDLNw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?RiY5VRx7SgmCKfJk4F4MlErUzaOnGbAygWzOV4wBZvNe/ZAiaCtgmUWs2WmX?=
 =?us-ascii?Q?HNPOVMbSmziGBCxK/xf9/NvQizgIV76J6BVu6dBy+xhgy3wuGej3DC1RWKzs?=
 =?us-ascii?Q?V4odMRcHSAEPmzdQRkRl/L4mlnwp23r1Xf84z20qoWb99+5pNI6KzTQoXGk8?=
 =?us-ascii?Q?PVpK+3fUwUNqtgm4HmhFW/XGlLZvEbQzP2ZUpWzIDyeC53smqPWRqG9zSz5H?=
 =?us-ascii?Q?HfCLIpBwBaf2vCyrXSkuvm0UgDXsJSgkrEE+f/83JxSUcxcYRamKIj5U6mW7?=
 =?us-ascii?Q?ClFYtvOfCXbiFvJd+vMKO7dBGfYRkc8Nhtig/WD/XMGswwYjwaZMLkIlhH3y?=
 =?us-ascii?Q?YR691LOkHrwJgkoy/0OUU+nRCWnkDoPBxst9qjxN0iTvCksdDHqVSIKJl3+W?=
 =?us-ascii?Q?X9WC6DZbtbAASitBPuu5lj6JcwdjT8gZIL9gmCUjb0poXV9icXi9NQRcQTEI?=
 =?us-ascii?Q?FOVf5KtLaAB57iiURmlqLWOekYTk2U66GZjHhqoo2XFQM9ohRJFyJDOnqL8s?=
 =?us-ascii?Q?bufZenqoAOb3YJWzgH0CbzYAdJKm/Vetz+8YPyMryNwkhU223Eyk/0AzJ//X?=
 =?us-ascii?Q?1vFxcCsDB5GjGSlABKdytzVSTsrZSVsT/MFP1+fMGY89qAu3ZYXwyx/Wb/QS?=
 =?us-ascii?Q?9T6yr77Jfgz7l2a9Q5yIeLITCrxnt9GonDYV5AMlA4oh6LWShc7/7YfIY+0K?=
 =?us-ascii?Q?4cspdOR74aNXuwVZvUm3vBLpGVijN5DT+IC/GJEf3ZAeM6zKBKgz8Y0milSK?=
 =?us-ascii?Q?GS2Km2mAaqQawGu9hk1LEXoX8K62mg4m/tucJQPNPZDOyf/Fdbb8mgVqdGxt?=
 =?us-ascii?Q?sB3rVEaF5QwcKdskS6l0+8oT1ENEBcTQVxEcwgVoIBpJf+imvwr0X+tO/7Ni?=
 =?us-ascii?Q?RWGmMvwFjTw/5ZqZvEz5OV9lKsrAxhvhTgY+5sV4ELM5RiNGL69lWxW0HXaQ?=
 =?us-ascii?Q?5stvO7iRfpLlsPNotTaYr7L2o6D0HLD9lD9FJbi15Cq/UpPwAtSNnI/DhjJs?=
 =?us-ascii?Q?Nu3sO68SlLqTyMJclOoETg8oOcL03XmXqNOWVJv64TIsc7RiQkPqGEujEVEc?=
 =?us-ascii?Q?RGIjXDgXnEbDJlwOolHCqdwQ/GbP6Qo+bzY3pfsq1wBj1jmWtCnNRMvpClUZ?=
 =?us-ascii?Q?LNIapSbVZ6xZlU5YhnXDUx4gyFaOt6frPVNiOFI2aHKx+6ymA0pdtlMqZacN?=
 =?us-ascii?Q?R5eaQqAO4QC6luIrtZwI2b/w6i0TOeGo+GImtmhte2vQrj6xi/tKJLA26lnk?=
 =?us-ascii?Q?1ialPP/NCMkbQJRz1cKCcwrhTdCQqLz27fylIS9ExD7aoUwYRbzDH6okTLwN?=
 =?us-ascii?Q?S1uXqOcGhTPVgRtxzWTPkWiNpFSUs8DhTIEo5gbDF4U1lnK7MC1wuru+ek9A?=
 =?us-ascii?Q?L1WOje+J9bjICHVpcJRYlqI0XBH+hLBuBK9c3F10uWap+sDf6CU8mU14yV3L?=
 =?us-ascii?Q?9dZckrlLsdM3F8+IMm6tL944Eid31YVTjJfKQ3mWEDcK1t+eBEBcX3pNDa4g?=
 =?us-ascii?Q?iApmoz4yhlGlo90fvJR3QK8W7VRxpoiP+ghl63bz3cWMCsFUjnCSSrnnm1pS?=
 =?us-ascii?Q?D+zivbL1w8NsM2oTwGmR1VlYtcvQFDPg7EjOBCtxCle7FLAFuUO920GXYbEU?=
 =?us-ascii?Q?hQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 29e16292-b24d-4246-b953-08dd7050f2bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 12:38:32.8731
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FbDQZNM8p/dWcYZzLf+IKuGzn3kF93J3krtZ77XOeupOj33wqjZ1paw5TVkM+qqE52lSKtYWjGcKvafO/pC7XWomq89bVKQv95K1CMGQHuQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15620

Hi Prabhakar,

Thanks for the patch.

> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: 30 March 2025 22:07
> Subject: [PATCH 11/17] drm: renesas: rz-du: mipi_dsi: Add OF data support
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> In preparation for adding support for the Renesas RZ/V2H(P) SoC, this pat=
ch introduces a mechanism to
> pass SoC-specific information via OF data in the DSI driver. This enables=
 the driver to adapt
> dynamically to various SoC-specific requirements without hardcoding confi=
gurations.
>=20
> The MIPI DSI interface on the RZ/V2H(P) SoC is nearly identical to the on=
e on the RZ/G2L SoC. While
> the LINK registers are shared between the two SoCs, the D-PHY registers d=
iffer. Also the VCLK range
> differs on both these SoCs. To accommodate these differences `struct rzg2=
l_mipi_dsi_hw_info` is
> introduced and as now passed as OF data.
>=20
> These changes lay the groundwork for the upcoming RZ/V2H(P) SoC support b=
y allowing SoC-specific data
> to be passed through OF.
>=20
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 66 ++++++++++++++-----
>  .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  2 -
>  2 files changed, 49 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu=
/drm/renesas/rz-
> du/rzg2l_mipi_dsi.c
> index e0379f099659..44b95082b29c 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -28,10 +28,24 @@
>=20
>  #include "rzg2l_mipi_dsi_regs.h"
>=20
> +struct rzg2l_mipi_dsi;
> +
> +struct rzg2l_mipi_dsi_hw_info {
> +	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long hsfreq);
> +	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
> +	u32 phy_reg_offset;
> +	u32 link_reg_offset;
> +	unsigned long max_dclk;
> +	unsigned long min_dclk;
> +	bool has_dphy_rstc;
> +};
> +
>  struct rzg2l_mipi_dsi {
>  	struct device *dev;
>  	void __iomem *mmio;
>=20
> +	const struct rzg2l_mipi_dsi_hw_info *info;
> +
>  	struct reset_control *rstc;
>  	struct reset_control *arstc;
>  	struct reset_control *prstc;
> @@ -164,22 +178,22 @@ static const struct rzg2l_mipi_dsi_timings rzg2l_mi=
pi_dsi_global_timings[] =3D {
>=20
>  static void rzg2l_mipi_dsi_phy_write(struct rzg2l_mipi_dsi *dsi, u32 reg=
, u32 data)  {
> -	iowrite32(data, dsi->mmio + reg);
> +	iowrite32(data, dsi->mmio + dsi->info->phy_reg_offset + reg);
>  }
>=20
>  static void rzg2l_mipi_dsi_link_write(struct rzg2l_mipi_dsi *dsi, u32 re=
g, u32 data)  {
> -	iowrite32(data, dsi->mmio + LINK_REG_OFFSET + reg);
> +	iowrite32(data, dsi->mmio + dsi->info->link_reg_offset + reg);
>  }
>=20
>  static u32 rzg2l_mipi_dsi_phy_read(struct rzg2l_mipi_dsi *dsi, u32 reg) =
 {
> -	return ioread32(dsi->mmio + reg);
> +	return ioread32(dsi->mmio + dsi->info->phy_reg_offset + reg);
>  }
>=20
>  static u32 rzg2l_mipi_dsi_link_read(struct rzg2l_mipi_dsi *dsi, u32 reg)=
  {
> -	return ioread32(dsi->mmio + LINK_REG_OFFSET + reg);
> +	return ioread32(dsi->mmio + dsi->info->link_reg_offset + reg);
>  }
>=20
>  /* ---------------------------------------------------------------------=
--------
> @@ -291,7 +305,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_d=
si *dsi,
>  	vclk_rate =3D clk_get_rate(dsi->vclk);
>  	hsfreq =3D DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);
>=20
> -	ret =3D rzg2l_mipi_dsi_dphy_init(dsi, hsfreq);
> +	ret =3D dsi->info->dphy_init(dsi, hsfreq);
>  	if (ret < 0)
>  		goto err_phy;
>=20
> @@ -334,7 +348,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_d=
si *dsi,
>  	return 0;
>=20
>  err_phy:
> -	rzg2l_mipi_dsi_dphy_exit(dsi);
> +	dsi->info->dphy_exit(dsi);
>  	pm_runtime_put(dsi->dev);
>=20
>  	return ret;
> @@ -342,7 +356,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_d=
si *dsi,
>=20
>  static void rzg2l_mipi_dsi_stop(struct rzg2l_mipi_dsi *dsi)  {
> -	rzg2l_mipi_dsi_dphy_exit(dsi);
> +	dsi->info->dphy_exit(dsi);
>  	pm_runtime_put(dsi->dev);
>  }
>=20
> @@ -585,10 +599,12 @@ rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridge =
*bridge,
>  				 const struct drm_display_info *info,
>  				 const struct drm_display_mode *mode)  {
> -	if (mode->clock > 148500)
> +	struct rzg2l_mipi_dsi *dsi =3D bridge_to_rzg2l_mipi_dsi(bridge);
> +
> +	if (mode->clock > dsi->info->max_dclk)
>  		return MODE_CLOCK_HIGH;
>=20
> -	if (mode->clock < 5803)
> +	if (mode->clock < dsi->info->min_dclk)
>  		return MODE_CLOCK_LOW;
>=20
>  	return MODE_OK;
> @@ -714,6 +730,11 @@ static int rzg2l_mipi_dsi_probe(struct platform_devi=
ce *pdev)
>  	platform_set_drvdata(pdev, dsi);
>  	dsi->dev =3D &pdev->dev;
>=20
> +	dsi->info =3D of_device_get_match_data(&pdev->dev);
> +	if (!dsi->info)
> +		return dev_err_probe(dsi->dev, -ENODEV,
> +				     "missing data info\n");
> +
>  	ret =3D drm_of_get_data_lanes_count_ep(dsi->dev->of_node, 1, 0, 1, 4);
>  	if (ret < 0)
>  		return dev_err_probe(dsi->dev, ret,
> @@ -729,10 +750,12 @@ static int rzg2l_mipi_dsi_probe(struct platform_dev=
ice *pdev)
>  	if (IS_ERR(dsi->vclk))
>  		return PTR_ERR(dsi->vclk);
>=20
> -	dsi->rstc =3D devm_reset_control_get_exclusive(dsi->dev, "rst");
> -	if (IS_ERR(dsi->rstc))
> -		return dev_err_probe(dsi->dev, PTR_ERR(dsi->rstc),
> -				     "failed to get rst\n");
> +	if (dsi->info->has_dphy_rstc) {
> +		dsi->rstc =3D devm_reset_control_get_exclusive(dsi->dev, "rst");

Maybe use devm_reset_control_get_optional_exclusive by dropping has_dphy_rs=
tc.

Cheers,
Biju

> +		if (IS_ERR(dsi->rstc))
> +			return dev_err_probe(dsi->dev, PTR_ERR(dsi->rstc),
> +					     "failed to get rst\n");
> +	}
>=20
>  	dsi->arstc =3D devm_reset_control_get_exclusive(dsi->dev, "arst");
>  	if (IS_ERR(dsi->arstc))
> @@ -757,13 +780,13 @@ static int rzg2l_mipi_dsi_probe(struct platform_dev=
ice *pdev)
>  	 * mode->clock and format are not available. So initialize DPHY with
>  	 * timing parameters for 80Mbps.
>  	 */
> -	ret =3D rzg2l_mipi_dsi_dphy_init(dsi, 80000000);
> +	ret =3D dsi->info->dphy_init(dsi, 80000000);
>  	if (ret < 0)
>  		goto err_phy;
>=20
>  	txsetr =3D rzg2l_mipi_dsi_link_read(dsi, TXSETR);
>  	dsi->num_data_lanes =3D min(((txsetr >> 16) & 3) + 1, num_data_lanes);
> -	rzg2l_mipi_dsi_dphy_exit(dsi);
> +	dsi->info->dphy_exit(dsi);
>  	pm_runtime_put(dsi->dev);
>=20
>  	/* Initialize the DRM bridge. */
> @@ -780,7 +803,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_devic=
e *pdev)
>  	return 0;
>=20
>  err_phy:
> -	rzg2l_mipi_dsi_dphy_exit(dsi);
> +	dsi->info->dphy_exit(dsi);
>  	pm_runtime_put(dsi->dev);
>  err_pm_disable:
>  	pm_runtime_disable(dsi->dev);
> @@ -795,8 +818,17 @@ static void rzg2l_mipi_dsi_remove(struct platform_de=
vice *pdev)
>  	pm_runtime_disable(&pdev->dev);
>  }
>=20
> +static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info =3D {
> +	.dphy_init =3D rzg2l_mipi_dsi_dphy_init,
> +	.dphy_exit =3D rzg2l_mipi_dsi_dphy_exit,
> +	.has_dphy_rstc =3D true,
> +	.link_reg_offset =3D 0x10000,
> +	.max_dclk =3D 148500,
> +	.min_dclk =3D 5803,
> +};
> +
>  static const struct of_device_id rzg2l_mipi_dsi_of_table[] =3D {
> -	{ .compatible =3D "renesas,rzg2l-mipi-dsi" },
> +	{ .compatible =3D "renesas,rzg2l-mipi-dsi", .data =3D
> +&rzg2l_mipi_dsi_info, },
>  	{ /* sentinel */ }
>  };
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h b/driver=
s/gpu/drm/renesas/rz-
> du/rzg2l_mipi_dsi_regs.h
> index 1dbc16ec64a4..16efe4dc59f4 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> @@ -41,8 +41,6 @@
>  #define DSIDPHYTIM3_THS_ZERO(x)		((x) << 0)
>=20
>  /* --------------------------------------------------------*/
> -/* Link Registers */
> -#define LINK_REG_OFFSET			0x10000
>=20
>  /* Link Status Register */
>  #define LINKSR				0x10
> --
> 2.49.0


