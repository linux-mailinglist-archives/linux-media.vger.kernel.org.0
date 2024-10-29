Return-Path: <linux-media+bounces-20486-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7069B4328
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 08:33:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C4381F23461
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 07:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0044202F6B;
	Tue, 29 Oct 2024 07:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="djnurheo"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011024.outbound.protection.outlook.com [52.101.125.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6458478C6D;
	Tue, 29 Oct 2024 07:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730187189; cv=fail; b=lXcrWh3VdQGQLPtaawpWESmuUrb2JX3UNeAB27fEo8VH6kWmRlYpeQ0b7D1E+do9RPMv2c+iw82KqxFYUN80ZP3FFZCL0F3yYE/67M81JyXTOHewOSjdrwJVPsG9qN5DKosKX7wi026zaNqkFr67DPnW0q3ufQ5Ni3YAy9q84v4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730187189; c=relaxed/simple;
	bh=1domprBwpRncW+ScDhrPBBrAcv3zjioGJqUatJrCHZI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TvkaMunkdxIKWJtqDnIGGMqROl5HieICymu8D5evb5CHu7LLaO90zrc9r1JN3hvukJgrYFcaWDmPolBNdfYOqE5hOTb3V+zzxMM1pUt3NvqHNigh9ubH8iB/Wa3vB9i95nor0ClLqBLCfQgdek3GHlAunmdgMC3NBFCstqmMLF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=djnurheo; arc=fail smtp.client-ip=52.101.125.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qrGYYCHn5HCLLVHzVLlPUTSXPc3Ksp9fdryV6UXwLd1P34d6Lb7rDd4KQhh1Q+I5BEqnoprdq6gVbQtYIF2S/XqHNLMP2qcNNh0C7BtNHvgVhajHjqxMf0K7YBKb3zrlKFxLLIwtCXPyY5nnl8aFEHmcMfZSP8AczuxJccjyiUPYduBaKH6IEkAYS33qG/HHLUeKO7YWL19gt0pvHNVo4T7k20k57bzdc/C53pzdmdpVIqcwPwOKpmxsuMJEQnat5cz8hFEtJjJmBXr68mgywkkxpawSZQL8RnbSDyDOTUH8nHSNs0MQ5s7eK3bHe+XiSFwaL6mI9v1GFHwHY5YlMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vP/25vMSS/FqBQhOL7sM6GKLRD7KcunjE0SeZkjjgEY=;
 b=Ml8vkQbp9i9zBi0KViSPVtttmQQgGePeWQDpXNm/azHDUecJczdkSkYMcgrchsX9l86JTZe4j7MDp7cm9CR6BR2d6svLxDZeTM0hBC9FQ5IlLEKs/54iaKP24Jv/FGZongGl/ibhsmkztRiYMKRMZ2F/t9OyIVfEREVvjQEuxolP5X9Wmb+qTOGSqN2+FcSa1sba4+Ckoe5xS+xNczEzbq//isO8L+SSuySeSLM6DCYLw0+n2Br+jcUs7Qa0iYdtnmnSbjeoiGwbp6HQcria9W3UqE9AHGJ6kI0mvXJLsgbaKCs01zcHCtOCDwHQI06istJDTzE3/LYlroYiCOtnDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vP/25vMSS/FqBQhOL7sM6GKLRD7KcunjE0SeZkjjgEY=;
 b=djnurheoNtnj7peo8HTOTEfPieEyEsGcnWZEnvThb+/wlRRWKBSh9Svbdt1IY+o6ivxCCxvsqE/nbkKZq00eLXrl5AIzzHzVnTV4+k40C30HcjV0gm4XNjY+9JIjAj5UAYo8Zpv8/DlKMSfb1+fN8w9nCHfg34JOAYZeOFb3SGs=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB12060.jpnprd01.prod.outlook.com (2603:1096:400:443::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 07:33:00 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8093.025; Tue, 29 Oct 2024
 07:33:00 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Liu Ying <victor.liu@nxp.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
CC: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "rfoss@kernel.org"
	<rfoss@kernel.org>, laurent.pinchart <laurent.pinchart@ideasonboard.com>,
	"jonas@kwiboo.se" <jonas@kwiboo.se>, "jernej.skrabec@gmail.com"
	<jernej.skrabec@gmail.com>, "maarten.lankhorst@linux.intel.com"
	<maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
	<mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
	"airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"quic_jesszhan@quicinc.com" <quic_jesszhan@quicinc.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org"
	<will@kernel.org>, "sakari.ailus@linux.intel.com"
	<sakari.ailus@linux.intel.com>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
	"quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>,
	"dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "arnd@arndb.de"
	<arnd@arndb.de>, "nfraprado@collabora.com" <nfraprado@collabora.com>,
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "sam@ravnborg.org"
	<sam@ravnborg.org>, "marex@denx.de" <marex@denx.de>
Subject: RE: [PATCH v4 08/13] dt-bindings: display: Document dual-link LVDS
 display common properties
Thread-Topic: [PATCH v4 08/13] dt-bindings: display: Document dual-link LVDS
 display common properties
Thread-Index: AQHbKOKZPN4b66+xp0G7h8Y65TjgzbKdVYDg
Date: Tue, 29 Oct 2024 07:33:00 +0000
Message-ID:
 <TY3PR01MB11346FDF74840ADF7273A218D864B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241028023740.19732-1-victor.liu@nxp.com>
 <20241028023740.19732-9-victor.liu@nxp.com>
In-Reply-To: <20241028023740.19732-9-victor.liu@nxp.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB12060:EE_
x-ms-office365-filtering-correlation-id: be011ab7-5f73-4b05-d9e8-08dcf7ebeab4
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?93ZngSJnTI3GGMJnPa5vitW/yg8Q3OJQVhYZayT+0PDf/+ToFfPyXxa2PZ+l?=
 =?us-ascii?Q?j5HgZoyVBO22nEKgG80n+6gTWfe3iiuMAZYxH6ZkWNG5FfQbhaMChL9jqVsq?=
 =?us-ascii?Q?LLxlKFlGO/SKb2ZXVHCj/TRCVAnRclcSLwUe9V6fphjIy+rNrFXkAvbIBZ07?=
 =?us-ascii?Q?Vv57YahCkCV0TrBWWAtEjOqXEpxw5/cvpQ3Em/w+b1ZlGTrz882qUUDBXH2X?=
 =?us-ascii?Q?k9jH3OyHYihM1o4tqdaVd9Y7BNQJ9VYogkOxB8DpiPHbrbA127LZFarmXv3j?=
 =?us-ascii?Q?QX3g7FV+CYwGz4oye9X0af5usmIV9kUD6pD8huAhJGoiFOVZxuZaBjnMA5+Z?=
 =?us-ascii?Q?+wqgTVio9LKP7sNOTjejvH2WUW/eQx8KMIXHBgU9tkwepw5vS8qJ6YMymEHq?=
 =?us-ascii?Q?Tjbh0LEVOCPZi3dmtCO6HqlOTol9r2yDo3K2E/fNf82kXx28nm6brnGnKLjG?=
 =?us-ascii?Q?fSsgEG8cmjdtJw8Qj5VCu06tChS4YZSNMUoxAAyhhZHFcePNU+YLx1noyU1o?=
 =?us-ascii?Q?+ohna2AnPGJW47cSzTYh9GCzCPk6KQAL4lyOpddhC+6944oNj6QGsuwd8Bzk?=
 =?us-ascii?Q?nf4iefnWIF91jISDDrhAGRakjNnHfWtl/nPZwx5In0hsgqE9rLKE+43FTLRr?=
 =?us-ascii?Q?yxpSQ4tnqmmBAbe/GOseAJVZUuQ+A23xxiXv3XayVdYYLUv7f15J0OklSD/n?=
 =?us-ascii?Q?M4MTYfpqEK8iBhjzY7JFjvf5P0wXDgJh9q++LYqOcE5G6n4ZRpelezsUw0rj?=
 =?us-ascii?Q?48RhO0G8RF5FcsaK7IoKG1IOp4CNoZrOb8IY1oG3HgstZxd8ztgapc9l4uga?=
 =?us-ascii?Q?k0FNMdTW+B/rTfDsERIiMintslhpFx6bKe3Jqyh6ievW1DGWyZUPEcaMvCYo?=
 =?us-ascii?Q?lnnapwqQ/PRF71rV3NaBjcdYdYx4lnAp9i6haKZ6ZYHtW+W69gGNlg5o37AY?=
 =?us-ascii?Q?AZ4dsqBgD2vrXRCO1V0irzipg3F9I6HjaewaoXi4bLDS/0h2o0xbQDFGvfPA?=
 =?us-ascii?Q?abnzfdTpnAwnBLmRqIn5XYb4KmOEWEVt+zpX5P45txxbM7eGkyhw//OOWD4Q?=
 =?us-ascii?Q?jbnV/mSobLVma0EFP8hOQIPyjUr/x91oDqrx+xHgopF3+bBcCawl72cKrw2g?=
 =?us-ascii?Q?jiIZeFERQfDLJ8WBSnwPVdfjbl0xTQ0pXvcvPRCnnZCnX66ZiHPgXy7A4fJ7?=
 =?us-ascii?Q?OQeb/WfhTSE8lBT6wb59elaOzmIMCZopAcJyhmBaykikgo8qL+xpdJmV5DqI?=
 =?us-ascii?Q?6a2pKHwI0L08P5E83qGc1fjbY7D1wa0D3jXOgZ2dlaLqfiaIQdNq63Rw0KGA?=
 =?us-ascii?Q?4axkpTIwDwrbYBlaf7plW0bp?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ZDUphBYafA0lEmcJz//DdKxGo2PrkXwrYhyvkISleIGocAbXp2eSTA3aUPy/?=
 =?us-ascii?Q?39gTsFh79AI29WZKWxvWEJQd7ALuCmN+tlDNxHjBZZwW/E6kbRgMiFXWNZP3?=
 =?us-ascii?Q?4LCdfGlW9rbc5JCfJMhPiYY9kmCptr4h2FAFCdJOA98AiClY9ORr9XO2tHZ7?=
 =?us-ascii?Q?Nx+Cz2lf98FpzAN5FZr/7coiicijkrx6EyZTTrZVgH4gyPqCGeToLc6EGKWV?=
 =?us-ascii?Q?rpBBOpUbz6jB6Zm/zA9txDUVEcEMZxJIE3diNUXdZnsRYbunyMe2qCFYWdiQ?=
 =?us-ascii?Q?jYlBjDc5LnMw14N3FtbF117UZx5n95fWVigzGUYJ6+N4BDD2THOVgbz48/FR?=
 =?us-ascii?Q?as8QqwE1PZ0A/R4aBBY9wghIKGrAKwhXQR2cwUelkrxUUu84zZggAKAmmCV7?=
 =?us-ascii?Q?kYitJm1N3DBO/CL5J9MwH7AXAUTG6JRgA/GIzpE/XSLSbK76dAht/0qNB66s?=
 =?us-ascii?Q?gLxlviPcPHTS1DJitg+WbY7Kqtft5KepVwj4kLF1PM0ArBWxSUewV5fkq+bn?=
 =?us-ascii?Q?mYZ2Wmu9pPqPHHH6BqfGJJ4rO8rpBvyhpbPbyf454htTlLdqeOxe6sxSHt8z?=
 =?us-ascii?Q?h7fQQ7XsjJ/PyzfTJGAYTByZmHaPqGmZ3VI2VtnOX1d95BJip+5JQO1DfSn5?=
 =?us-ascii?Q?2EU291LPKGnc0KLNlHtygYj8ilgZreZlZk2+o6E6r7Bo00vXBXqJz+jTs/a4?=
 =?us-ascii?Q?QOerwpvyW3zhz41rM7RBfwXENqt8v+6jDPewQ2iWyTSX5unbsug8uhGVDpEa?=
 =?us-ascii?Q?ctw0EZHQ9KEcfngHKHmHSXerTnSvJNcFiHrTPaSL+i8+cx8Dw/oqb7p7sixh?=
 =?us-ascii?Q?tsoJMSHH8iVXbAs0vytc2Qb5lWME+ji7lpLRA/11T+Wv1fJGVMUsa9/APlkO?=
 =?us-ascii?Q?2ZtfCWu8K1MDC3gVz185ac5A4SptjC2BZ+WkyDDDtYKzESNrKhWtwmxT5msc?=
 =?us-ascii?Q?k1GQ24XdZLmghmfCy5u4jJ/0VmgoRpBNmVUvK2rq27p1rntZRwzBlTf9OK3n?=
 =?us-ascii?Q?znLQvtmpn/iUOYdZgTYX6yNfuiQeCoYF/7Xt4OQEExN4RxJT9XDWtQnkhVLq?=
 =?us-ascii?Q?omxZEaJAcUpBedADGTkGdY3Wmdx3vUhT/80zc6F32+HIRc5Rv2v0Cg3wheOB?=
 =?us-ascii?Q?nXkpilrW+FIGsMTQhYfvySIXiQiYzmBjXWj/f5X2fRsT+waCsmLqnq8tdGwT?=
 =?us-ascii?Q?wC2CxJNNdx44Wdy25DwXeeiXmOAzKb+mvwHrzvJdUGzkG5dcgmMGg6K2PxMO?=
 =?us-ascii?Q?PQNOwt0y6u7tlunR0P7mhchmQoR8BAatxki5MMI42CQIwm3PbNssJc81DhKc?=
 =?us-ascii?Q?r83GgQy9S9vUq1EZUBQzE0/RySeNckIehhXG/6ipelBmGad/cLoN4iD4Cd7B?=
 =?us-ascii?Q?MZoH5cdFQ/J4XJO7eIdMqDJq6rMX4to2gAVl1CbpUh4NzPP81V3gwqag7gIC?=
 =?us-ascii?Q?zxFauOJOJ9BTpjTFjuImmfoljPQX92Tq/2AlBsOtqzDwN1xX1WX4L0HAXi8X?=
 =?us-ascii?Q?ftzHQ3Qnr50qOR8O1v9nSG+xdR9YKH1QWusVsEnmw4plYvHKI59RJvfbUrLH?=
 =?us-ascii?Q?0iM2eJtXUNuCXKhoCF6etpZBKAzCKMmWZdu8iuwE?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: be011ab7-5f73-4b05-d9e8-08dcf7ebeab4
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2024 07:33:00.6270
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P74OpCIt8IXLsQv6ONK+34n9ggA/tBppeGouBSJBu1upee0aKUXh9TVvqUj6rCSpVncIHwXeY0lVj/Ah3xwDpx2Fem+1xKSXc8+mpcQpu7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB12060

Hi Liu Ying,

> -----Original Message-----
> From: Liu Ying <victor.liu@nxp.com>
> Sent: 28 October 2024 02:38
> Subject: [PATCH v4 08/13] dt-bindings: display: Document dual-link LVDS d=
isplay common properties
>=20
> Dual-link LVDS displays receive odd pixels and even pixels separately fro=
m dual LVDS links.  One link
> receives odd pixels and the other receives even pixels.  Some of those di=
splays may also use only one
> LVDS link to receive all pixels, being odd and even agnostic.  Document c=
ommon properties for those
> displays by extending LVDS display common properties defined in lvds.yaml=
.
>=20
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v4:
> * Squash change for advantech,idk-2121wr.yaml and
>   panel-simple-lvds-dual-ports.yaml with lvds-dual-ports.yaml.  (Rob)
> * Improve description in lvds-dual-ports.yaml.  (Krzysztof)
>=20
> v3:
> * New patch.  (Dmitry)
>=20
>  .../bindings/display/lvds-dual-ports.yaml     | 76 +++++++++++++++++++
>  .../display/panel/advantech,idk-2121wr.yaml   | 14 +---
>  .../panel/panel-simple-lvds-dual-ports.yaml   | 20 +----
>  3 files changed, 78 insertions(+), 32 deletions(-)  create mode 100644
> Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/display/lvds-dual-ports.ya=
ml
> b/Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
> new file mode 100644
> index 000000000000..5f7a30640404
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/lvds-dual-ports.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Dual-link LVDS Display Common Properties
> +
> +maintainers:
> +  - Liu Ying <victor.liu@nxp.com>
> +
> +description: |
> +  Common properties for LVDS displays with dual LVDS links. Extend LVDS
> +display
> +  common properties defined in lvds.yaml.
> +
> +  Dual-link LVDS displays receive odd pixels and even pixels separately
> + from  the dual LVDS links. One link receives odd pixels and the other
> + receives  even pixels. Some of those displays may also use only one
> + LVDS link to  receive all pixels, being odd and even agnostic.
> +
> +allOf:
> +  - $ref: lvds.yaml#
> +
> +properties:
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: the first LVDS input link
> +
> +        properties:
> +          dual-lvds-odd-pixels:
> +            type: boolean
> +            description: the first LVDS input link for odd pixels
> +
> +          dual-lvds-even-pixels:
> +            type: boolean
> +            description: the first LVDS input link for even pixels


port@0 we know it is first link
port@1 we know it is second link.
dual-lvds-odd-pixels: We know it is for odd pixels.
dual-lvds-even-pixels: We know it is for odd pixels.

Not sure, whether we can give common description and avoid the duplicate
from port@1 ??


> +
> +        oneOf:
> +          - required: [dual-lvds-odd-pixels]
> +          - required: [dual-lvds-even-pixels]
> +          - properties:
> +              dual-lvds-odd-pixels: false
> +              dual-lvds-even-pixels: false

Why this is false here? oneOf is not sufficient?

> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: the second LVDS input link
> +
> +        properties:
> +          dual-lvds-odd-pixels:
> +            type: boolean
> +            description: the second LVDS input link for odd pixels
> +
> +          dual-lvds-even-pixels:
> +            type: boolean
> +            description: the second LVDS input link for even pixels
> +
> +        oneOf:
> +          - required: [dual-lvds-odd-pixels]
> +          - required: [dual-lvds-even-pixels]
> +          - properties:
> +              dual-lvds-odd-pixels: false
> +              dual-lvds-even-pixels: false

Same as above??

Cheers,
Biju

> +
> +required:
> +  - ports
> +
> +additionalProperties: true
> +
> +...
> diff --git a/Documentation/devicetree/bindings/display/panel/advantech,id=
k-2121wr.yaml
> b/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.ya=
ml
> index 2e8dbdb5a3d5..05ca3b2385f8 100644
> --- a/Documentation/devicetree/bindings/display/panel/advantech,idk-2121w=
r.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/advantech,idk-2121
> +++ wr.yaml
> @@ -20,6 +20,7 @@ description: |
>    dual-lvds-odd-pixels or dual-lvds-even-pixels).
>=20
>  allOf:
> +  - $ref: /schemas/display/lvds-dual-ports.yaml#
>    - $ref: panel-common.yaml#
>=20
>  properties:
> @@ -44,22 +45,10 @@ properties:
>=20
>      properties:
>        port@0:
> -        $ref: /schemas/graph.yaml#/$defs/port-base
> -        unevaluatedProperties: false
> -        description: The sink for odd pixels.
> -        properties:
> -          dual-lvds-odd-pixels: true
> -
>          required:
>            - dual-lvds-odd-pixels
>=20
>        port@1:
> -        $ref: /schemas/graph.yaml#/$defs/port-base
> -        unevaluatedProperties: false
> -        description: The sink for even pixels.
> -        properties:
> -          dual-lvds-even-pixels: true
> -
>          required:
>            - dual-lvds-even-pixels
>=20
> @@ -75,7 +64,6 @@ required:
>    - height-mm
>    - data-mapping
>    - panel-timing
> -  - ports
>=20
>  examples:
>    - |+
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple=
-lvds-dual-ports.yaml
> b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-=
ports.yaml
> index 10ed4b57232b..e80fc7006984 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-d=
ual-ports.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-
> +++ dual-ports.yaml
> @@ -22,6 +22,7 @@ description: |
>    If the panel is more advanced a dedicated binding file is required.
>=20
>  allOf:
> +  - $ref: /schemas/display/lvds-dual-ports.yaml#
>    - $ref: panel-common.yaml#
>=20
>  properties:
> @@ -55,28 +56,10 @@ properties:
>=20
>      properties:
>        port@0:
> -        $ref: /schemas/graph.yaml#/$defs/port-base
> -        unevaluatedProperties: false
> -        description: The first sink port.
> -
> -        properties:
> -          dual-lvds-odd-pixels:
> -            type: boolean
> -            description: The first sink port for odd pixels.
> -
>          required:
>            - dual-lvds-odd-pixels
>=20
>        port@1:
> -        $ref: /schemas/graph.yaml#/$defs/port-base
> -        unevaluatedProperties: false
> -        description: The second sink port.
> -
> -        properties:
> -          dual-lvds-even-pixels:
> -            type: boolean
> -            description: The second sink port for even pixels.
> -
>          required:
>            - dual-lvds-even-pixels
>=20
> @@ -88,7 +71,6 @@ unevaluatedProperties: false
>=20
>  required:
>    - compatible
> -  - ports
>    - power-supply
>=20
>  examples:
> --
> 2.34.1


