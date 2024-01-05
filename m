Return-Path: <linux-media+bounces-3231-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 475B5825083
	for <lists+linux-media@lfdr.de>; Fri,  5 Jan 2024 10:03:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D39E1C22DC9
	for <lists+linux-media@lfdr.de>; Fri,  5 Jan 2024 09:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C6A522EF0;
	Fri,  5 Jan 2024 09:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="cvfZf42a"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2118.outbound.protection.outlook.com [40.107.114.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D19A225D1;
	Fri,  5 Jan 2024 09:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NTs6mziIKYzGjZKnZrBeD/R5h0m0pArgt6cFvXJvHdJDW8QHJhxMwwOHYtvuyE0+AJX+nzqDLmUc8/3CTm53MBWar/UWsDC/JATX+ih+ww8mYt2HNlEHeVj7KXAUR9acaXnDeeP/jvV9d5nZXoqkTAH0pDFOymkRTjFPFgep+ZDv/Vh+steOTXFfgGzljjSmwbm+c3IlYPfQ3sKksnlfMeeh9n3083r/fgw0RCV13bQP1RmKopAQfe5++y5FgOnjWmcxWrER+bBFvnUXme0P8g0ZOO+FjUhVAbe5oVzwEqQ1saFj3Bm8k/2Iqef8eL9AOioeTpPnb8MFjHKczeIzhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZqY2FdSqRu4Orn2c4Ak3KRWDe3fiSOT4o9KiNbkQjQE=;
 b=XDJQ6FXSEiVJIRKem5pQFO7ITMONi3XcGtEBf9ed+RJVXbrjG3dBqVY0sHIjc5uUMrIKvYEvWef2S4/KHQ/V/Ccrm81on8BVyP9AAxSqj9Uy+Vkopbnzyh6xMcOrSoaaCPy6y62+5c+ggUoqeWV/00ZgguNRvb4WMKzcCfIkvguvgWOTItth9nGyOzu0OsbITyscQBFxJD0VvcwNKnCBgG2Vi4GVraWJDY1gpjo5KU6Q7wLoG1jgM4cFh3t2tcXahZolgzQIDi1vjjRyYySgtxyKAorgKLLnZjxS2+ZDhmfypHQ8cKu6usjeydTiINAPMXqhpadvTsP928eQalpwKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZqY2FdSqRu4Orn2c4Ak3KRWDe3fiSOT4o9KiNbkQjQE=;
 b=cvfZf42aUdujFIaSFhPdGXs0zUQwW5gIfzN4+LQOkh7id1gLQzFtDasA6Nwn92OvvsVGFf05EmSSQeWLy4t2Jwejb/CjO0AvxIhX0vko86d+4Fmu2dolFMcNB4kEaJLAxsspnaKVAh/hVLKDS5doKhc4pzSLExIyOvmZXME41Qs=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OS3PR01MB8368.jpnprd01.prod.outlook.com
 (2603:1096:604:193::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.9; Fri, 5 Jan
 2024 09:03:40 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78%5]) with mapi id 15.20.7181.009; Fri, 5 Jan 2024
 09:03:40 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] media: v4l: async: Fix double pointer free on
 v4l2_async_unregister_subdev()
Thread-Topic: [PATCH] media: v4l: async: Fix double pointer free on
 v4l2_async_unregister_subdev()
Thread-Index: AQHaI7M5bfzjfA5nV0+qnOeAaLyhXLCkYgIwgCVSXpCAAWb9gIAACBsQ
Date: Fri, 5 Jan 2024 09:03:40 +0000
Message-ID:
 <TYCPR01MB112690FE9F6D299A14584420186662@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231130173232.130731-1-biju.das.jz@bp.renesas.com>
 <TYCPR01MB11269FCC5199547299AFDAAF3868FA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <TYCPR01MB112699751EF10B9BEF3B7511B86672@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <ZZe-DeImcJLVm7Vd@kekkonen.localdomain>
In-Reply-To: <ZZe-DeImcJLVm7Vd@kekkonen.localdomain>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OS3PR01MB8368:EE_
x-ms-office365-filtering-correlation-id: da1b270c-30f8-4de8-c0ff-08dc0dcd35d1
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 mEshRTYxZKUvgVf9E891YY6INfstT4geaBSne8j/oHZZgaDnyPXbuLwJPxTaobTxxeOc+/yhonGpT2Y81kH/8fSi05f7xT5jN3AXwzeaNm4BnTUGK4phk6Z3yFtjxy1uX2tk87oI6p9fWntWn4fwvN91f6AaGz7DLQ8F5K2cOMdcyd9cZMKiwzU3tx54EgrHygo3djt0EaX3VGBWy0iJ1qxPyZPcVJz1J/eHSD4HTNqEpk4qb3rV/tDSUQ7fTpZgmbiSgwS7v2LVRzkL96I6ZMgcaE+nszrUaGO7TtL7JMOmCX02tT9zeUu962FOpxUZ+1oIEAKFugo3mtlX5ON5w6htlC+h86Q68WJYQcNRfGbJOs/xXSGDGlyf1Kob9GAKvYEkrYitxriMFJB1P3wSR0YfU+9ZEafC7S1H2LYkoErZNmxg2voPTV/y91yhWRaNhNTNIfMmpcF7gi3p1a6zDlapiK4l8LtFjyjgrOQK/+0Lxu9/8Pr+Cl5/aCST9nO7iR+Fb2/ary9BUOT8RdtdIWl2w4OqnseEyNj9lsTnm8Ql5gnsr6Bi8/BzAKuf/M7Dbw2vA6Iw0yZ942SL6FLTE7VqJtXEaCNwwwmI9OPdxDzVejCkXIm2H0za7J4okYqE
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(136003)(346002)(396003)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(33656002)(38070700009)(2906002)(76116006)(5660300002)(83380400001)(4744005)(66556008)(66946007)(66476007)(6506007)(54906003)(53546011)(9686003)(316002)(55236004)(55016003)(6916009)(64756008)(7696005)(26005)(66446008)(8936002)(8676002)(71200400001)(478600001)(4326008)(52536014)(86362001)(41300700001)(38100700002)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?KIqCLkosiybMpbEAi9jZMYlcOW8agyVDcysOmEo/Y989ty3YaJ8WloPiArpc?=
 =?us-ascii?Q?JSfbmoakxLyswISa3uPvagFux1Pog+9Fm/SrHtJ1GcCvvOiN6nl09Aphpcwo?=
 =?us-ascii?Q?EjEDI86WEbWo/4Ob3KQ7v19ZD1OZtmbeZT4Zb5T1oAJPaVnXR8V9Sn8XCxCn?=
 =?us-ascii?Q?yxCCV2vdEm8P8tXvyzGlg3tEsggooDF9P5El1InbPwAfHWx4sqs1ozMNk6Kl?=
 =?us-ascii?Q?H6Sb+s5X22OAONh+A/7UMI+75bwRs6x4146rdA1S3f+Z9EEhzSQZ/GEQ7f5O?=
 =?us-ascii?Q?VyzC8DSN4wRJmhKfSSe6RnSMGHed/OLTDaEj2NOBeX1oGf6520feJkE/YFsw?=
 =?us-ascii?Q?5ntlOKIIYxgyXM5powi++N0prqU9rjdQcuma8D1WyHJ2iDZlZ7bx4dkLb2/7?=
 =?us-ascii?Q?uQkYMi2JKpGBjTTbZEH05K6l33yuk8vt7PtOXixcCCC7xkZXhtsc6Np/dddS?=
 =?us-ascii?Q?dqwEQWMUWb9ezoPdHD3XTr4kgjEWshO72bpSp99bD3DftcI8tv0GJq1BszAS?=
 =?us-ascii?Q?6WbR/MpTeX5S8K6Thsg8KsDsKv4Z5xDwCftwxGBs6WfBYU0dgXNcj2SV/cGr?=
 =?us-ascii?Q?m4LTE+drYLjjoJRVzrlPFGd7oydlFV5/cR4lnjSL0toet8yvr7mzdm39pkTB?=
 =?us-ascii?Q?55Usa6PEPrOCroWrB/xQG2HnOAm9qBMzwwtZuC4052AupsICYaHpP6yhb84t?=
 =?us-ascii?Q?j1So+9xD/ZbJ2zRyoYa3eL5vjjw/UMpTSNzpf8DdzHmEIPWNoVThYZjU9Qzd?=
 =?us-ascii?Q?zu4EDa2tJRLH/Fv5fLJaFyy6cBnAvP2usOCDv+aFHD2OBDj0xxmtwlMBrVbv?=
 =?us-ascii?Q?+4wqDUlyrHZHWG4aSy0QYrhuydsP/egUpLleB4BzOklpzE0FwWv15Jna6q1x?=
 =?us-ascii?Q?ewiqr0mZiPcDdoVNtUH7vXlk2cChlCpcZOEFxpzZ8JtgperSHJHKyAI3exJ+?=
 =?us-ascii?Q?Cen4/3oWiPK18d2Er1vX71pqS2o0aIuUgCY29sA2XCN745OdBDuXcmNLgNlx?=
 =?us-ascii?Q?HEsJULyppBXpwiR0ZbqqbgnDer9d7FRgDBNEcLuEdZWaSbpgh3Jcp2GTsnrv?=
 =?us-ascii?Q?VAOQ2eXZf1oN+pOMcOQIok8+eGlubSHAKkl6BljivMD6nKZFmUvj+SuuAtTY?=
 =?us-ascii?Q?ba1n615EEnatqsZGTKynVAda99uhjc8lJK5esjY0tnFm6IA1ruOKw0VMIWId?=
 =?us-ascii?Q?BE0M0t7IDHoQXV4DPFf9brdytfixi08ZOdZp+gmZRoL9PCUdgun5kkahJtaO?=
 =?us-ascii?Q?o+/85XyHiZyVEHygyXeR34qk+4F4VjiDdltd4Z+m2HDTYmHpoUmyNgJs9pr2?=
 =?us-ascii?Q?THGeP1QU3jh3AmG/sO6Ph/0b/a86OHsR1g3g3pP5DieTQRjoxepOTSHFBYbN?=
 =?us-ascii?Q?oZDpPEW5b6xwSIbCa3+qaFAjeml1ilHj0xEVIuoTmWbmXjoBe0w8/ofDyHfF?=
 =?us-ascii?Q?Xa1E3uBTaRS09v2Y8BH/xuNLGbbPekDi64X5BXrOEVmtaHA1UI2pV4BeTzHz?=
 =?us-ascii?Q?lIgUZ3lHT4MdPq6uWR3rbY7Fr+AkI3gEKxS97VSm6LswfudtSCFEDdmzFOkf?=
 =?us-ascii?Q?ZVO+BeO5Nnh4lrz6GYrngVvJdSg09EXbu/1thCLa?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da1b270c-30f8-4de8-c0ff-08dc0dcd35d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2024 09:03:40.2072
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0snmlxilkiM+N2V8GpvjLextM080fcqcwWL6QW2fBEMiU/l5Ma9LRVmAc4AoWEOQnn0P0Gzmzo+fHbQP51+uhOpXJaMJCsZN/eh9d8cIBDI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8368

Hi Sakari Ailus,

Thanks for the feedback.

> -----Original Message-----
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> Sent: Friday, January 5, 2024 8:30 AM
> Subject: Re: [PATCH] media: v4l: async: Fix double pointer free on
> v4l2_async_unregister_subdev()
>=20
> Hi Biju,
>=20
> On Thu, Jan 04, 2024 at 11:05:46AM +0000, Biju Das wrote:
> > Hi All,
> >
> > Gentle ping. Are we happy with this fix? Please let me know.
>=20
> Thanks for the patch.
>=20
> The issue has been fixed by Sebastian's patch (commit
> 3de6ee94aae701fa949cd3b5df6b6a440ddfb8f2 in media tree master).

OK, I will drop this patch.

I got new info using CONFIG_DEBUG_LIST for list_del corruption issues.
For me, the issue hits with unbinding the driver.

Cheers,
Biju

