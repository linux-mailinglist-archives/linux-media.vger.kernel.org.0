Return-Path: <linux-media+bounces-3206-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA96582403F
	for <lists+linux-media@lfdr.de>; Thu,  4 Jan 2024 12:06:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 594562864C8
	for <lists+linux-media@lfdr.de>; Thu,  4 Jan 2024 11:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 048D3210E3;
	Thu,  4 Jan 2024 11:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="oXLIgZOX"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2102.outbound.protection.outlook.com [40.107.114.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BFF2136B;
	Thu,  4 Jan 2024 11:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I3xjkB5gAQFF8+jID9KpjsYB9onZzl50MWT9xq2afU5lx+sU1M6CvTnQkQHAYgkVAYr/YscrdT/8PIo6/IKAYAjbfv7+IR4xLh5UnGbdVoQFfzDSPBkZxVE/Izeth+Pjt8c7Sz0n/2WRIn4cDgk9NmQI2eqBZ/RCXMdp2OyuiM5695vchU5X9qrsYAALCqS5Df54+Q1za2heBXZYkOegFjsCCjxOYtF1ltf5r2H69Ok9PbQESjg7m+54L3i+UdwKbBtfnVcoCtk/5axtpqbqhntUdZk0IatY6d4zBm6nArbFDIuocS0Z+1+vrELQw40sG0HjLQbjryLmtmrYuSOymg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZgHArS1RqCmm92eB5JQSOzpqfn01Ks4kY1+5fRKc0Qg=;
 b=eTbjvGQPThkASD2LLnZYsoEbzZE/OMyu2SELB+b0X+PAQEKkXnuerjWFVCftbeTvqhWIiQ194udFNFNdYDSR/M2kTSqjWJaT5aQFmZ24/i3gdvERj18qNQDGbzss+S0NdFwv0wQZNRsTFM1ZECb+/v8DEekyhBqu2kSA/flHluFVGvzG3TFfGm7g43LxSUHklSq/qwyJez9qmwof10+2m4/PfALp4xy1vBCpoMOV8FCuAPnkxdCufU5nX+YaFyzFycn4TyS/0BxM8mfahAhYCe8S2RauwUW64rUqY9OsMvSJi78RPKZrLJVBFUsD29/y8AYkqRfnbqwVlg7pk0cAnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZgHArS1RqCmm92eB5JQSOzpqfn01Ks4kY1+5fRKc0Qg=;
 b=oXLIgZOXzoSqIWCdByQoN5YLp13i5h/Fkr248+6vvrkyMx4Gr2QRMAaHTwAACT4SpwP5fVjW/xzFh9q1dN5Mh8gYhISWVSQgi3yU5/uLMhf8LrFARtAYOPeJrTG9L6KvVWQhwl++A60IXwDYWijPL2uqo9QWGYMjQ4XEGfhluDk=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYAPR01MB5530.jpnprd01.prod.outlook.com
 (2603:1096:404:803b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.14; Thu, 4 Jan
 2024 11:05:46 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78%5]) with mapi id 15.20.7181.009; Thu, 4 Jan 2024
 11:05:46 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] media: v4l: async: Fix double pointer free on
 v4l2_async_unregister_subdev()
Thread-Topic: [PATCH] media: v4l: async: Fix double pointer free on
 v4l2_async_unregister_subdev()
Thread-Index: AQHaI7M5bfzjfA5nV0+qnOeAaLyhXLCkYgIwgCVSXpA=
Date: Thu, 4 Jan 2024 11:05:46 +0000
Message-ID:
 <TYCPR01MB112699751EF10B9BEF3B7511B86672@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231130173232.130731-1-biju.das.jz@bp.renesas.com>
 <TYCPR01MB11269FCC5199547299AFDAAF3868FA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TYCPR01MB11269FCC5199547299AFDAAF3868FA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYAPR01MB5530:EE_
x-ms-office365-filtering-correlation-id: 4c706a97-72e9-485f-6a7e-08dc0d151a55
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 u7IKdjoxNztZT0Am1VAr/ou8hMtdZY/oJDhFODQAPcpnhAX1yHZXo1uX6lBl76gupwrrvspgeSwR4FpfRN/DNC6QAaG6TDB/wwtAMKCE/Ime9U2b1XVdpDoW388SrezELQnapm30c6jGUKwxF9XlEg2XRIvvJz65e0N/SWjTsplkAM+6Vi0hCtjeNGP1RPjqWM5uxex6P/5ULD9SoQNEu5NBcy0YEq4/Hr9z7+BmE3LYB9Lim1C2x7xkX7TUdg6ZF5EEs+smCfXdhEdbHb2yHq/FwBKAktG/Yk7P+WJ5d9gEpRzjpabLNM4boq6EQKp0eP6ralqTNC/ucihze8ZSNYg58m5b+VwazQ5QxpW+D0kPXsrt+enw5joSg6tmOZiRZcE/ZYZa20gUUIQ54pXTOLLRc3OftK6MqmGBniETSA8h77wsDr93x1jsr+kbZXxTMhX0oxk90V+EbOJSzPpkOZyq1yh2w7skFqzNSJeA6ZeQBVoPKw5KLN0QDZjKxpdwW/mrJpOsak4IlxY8eQFcr6ClNt9rNcPsz69AQIGhI0v/QGZW2yg4GREzQCEs9B1yMrqwKxOf9xgXzzKXxfwlOg9tiS4EDSjmd1ocUfFvF8dZJSOzpmK1bVwKXBAZcGnv
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(396003)(39860400002)(346002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(38100700002)(66899024)(122000001)(38070700009)(55016003)(86362001)(4326008)(53546011)(9686003)(6506007)(76116006)(66476007)(64756008)(66946007)(71200400001)(66446008)(66556008)(8676002)(478600001)(8936002)(52536014)(7696005)(316002)(110136005)(54906003)(33656002)(83380400001)(41300700001)(5660300002)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?frv1aaUC/a1uPqA9izswcCG9CuT4n2B4mCRmx6+v/gHskt3j6JUBGPH8AzwQ?=
 =?us-ascii?Q?CnVxTRarwN1opfWtcHHx/WFa3muXtomsHW9ohJd/k6iRnutTf/ZZQ5hqkPdp?=
 =?us-ascii?Q?wz2OzhcP/nVAp+/fCjspX8YM75fNLQfAoKOrpzOfv1VBn/bKtdisg4jL+yqq?=
 =?us-ascii?Q?4vtI1rjDI1AZQvwZW2FA+TL4nvWr3b3Ni7VSyhOC55Vz4RyMrof98cjhnn0w?=
 =?us-ascii?Q?//EksMXPqHOdZYVdkJCcIHiE+a9U4ZDNmRX4+O83d8/eVoCaWcsE0XwIBoOo?=
 =?us-ascii?Q?QddjfR7e4VwUmUGTz1TbzYzvzc84IZpnqXA1c7gj4j2iyTqi4YQhT0qd8TKN?=
 =?us-ascii?Q?49jS6xRqIipaKXuO93CMNuAgYi2jCBCU+ldNubw11Ht+ZSXvTTnEVoOQR0by?=
 =?us-ascii?Q?2Zr8ZTsoF5791qSpiHx29yGBIOUx2sM0r/6G0z84wwBkEFS9LE8c5rVgCbtz?=
 =?us-ascii?Q?odHv/bBmQX/vuhkaZtOEmizgyX8xSSywqbenDcYxfDKW4Oud78JsoimlVjSX?=
 =?us-ascii?Q?QvFCh1AUz4JCKalUoJByH6UCtfLZgnRq+5Ui1v2/mhkzRtM9cux9UU+iLsE1?=
 =?us-ascii?Q?L5LCs+Ubjg18KAiAKrx6yobynoHqkXHoigrE8KprhBWKy0Tdy2vGCHDYBjT4?=
 =?us-ascii?Q?4iExERN+rQLFust1iUujOq6DT84jBBlCp5Vv9ZuHN53ZAD1t2aKOsVqQIczg?=
 =?us-ascii?Q?GrlkUc+iJJXL92B7RiqdBYfnUL1NzOMjX58M+b/T13WsNnZIu0ZFRJovlph5?=
 =?us-ascii?Q?z7OvTovwg3uMtcw/JbRR1Cdrt6kHZyy9BuvhSqj+U3h3fDVQwwZevb0yIhrd?=
 =?us-ascii?Q?seHXOBGV29YHLMXmAAOQEnyVuXq8HJIlJvzy/DNqCeMLzteBmTG2XCiiRN0C?=
 =?us-ascii?Q?+6iinF7kpZbR94YtJib6OG5IgkHfODRr85X3DM22H32yc19Vs3e/X/eqo3+N?=
 =?us-ascii?Q?eZUq50icdn06g8ztM+oNNBrxbdBuyJ8TqzYJPt6/HjHE3MlkHpHt7Uz0MkRS?=
 =?us-ascii?Q?Y5VvAzW4c9fCjxAaM7utAfC4zHNS0/yJWB4IWPhAcWjuO36B2UsxI4CNhIAX?=
 =?us-ascii?Q?8UqM0JE32OJybHMZ02u5Hg63/vEpiqUi3wr34bN80ZzX+VbhdR/Gp7tV8Gb9?=
 =?us-ascii?Q?QnRd2GaXHpgey9xjFrVetUOrvmFjr7MQq4kDvoOx0AGyl7gvZ1IR9GXZ4ecL?=
 =?us-ascii?Q?EewMTMG/KH8DTzIMtuTtLphdiEG6BbmVdzUiBDuu/kiu6BGNaf45Wl8J9Eqk?=
 =?us-ascii?Q?aVs9zf+cu0ycX6pEEz9BZNqK1//TtcU3Jg3jlLm8xsmgoUdIjDeZ6ZZXxrL7?=
 =?us-ascii?Q?7T2PlTpJdmPTJsJALulLGYpIfYXFS8dmrq5pu9aSamFqjTmrdPH20PjS0nj+?=
 =?us-ascii?Q?SzjHaJiEVlzEWUPRprOisiprd+E/C1/pgr9FJ3hYHQIYrOIyWUdA1m/XD+Rl?=
 =?us-ascii?Q?u+I9pRdAHF3bEbtNGqfXRrReu+AGCuJBbs0kyVCPJOpka9DWzpE3Ef4eQPAC?=
 =?us-ascii?Q?ayGBIkqxvZJmKZroZX9RzVtsbUoyF1nHGU0CwhXi1z02ZasP7X31rBqMR8KV?=
 =?us-ascii?Q?nUraWEji6KV3YOSo274=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c706a97-72e9-485f-6a7e-08dc0d151a55
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2024 11:05:46.6512
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZGwnQbtPNIFxKgllP5q8JddXjx0jDESzMlUoekie0CKoe44pZ+PQiC+neNQhDhflfuvP/t9Lnu9Rv3V8kZvKJk9jer4nes4UnfFCPJOPq1s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5530

Hi All,=20

Gentle ping. Are we happy with this fix? Please let me know.

Cheers,
Biju


> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Monday, December 11, 2023 5:10 PM
> Subject: RE: [PATCH] media: v4l: async: Fix double pointer free on
> v4l2_async_unregister_subdev()
>=20
> Hi All,
>=20
> Gentle ping. Are we happy with this fix? Please let me know.
>=20
> This issue is reproducible on RZ/G2L SMARC EVK.
>=20
> Cheers,
> Biju
>=20
> > -----Original Message-----
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> > Sent: Thursday, November 30, 2023 5:33 PM
> > Subject: [PATCH] media: v4l: async: Fix double pointer free on
> > v4l2_async_unregister_subdev()
> >
> > The v4l2_async_unbind_subdev_one() deallocates the pointer &asc-
> > >asc_subdev_entry. The same pointer is again used to deallocate in
> > list_del() leading to the below kernel crash.
> >
> > Unable to handle kernel paging request at virtual address
> > dead000000000108
> > v4l2_async_unregister_subdev+0xf8/0x164
> > rzg2l_csi2_remove+0x30/0x5c
> > platform_remove+0x28/0x64
> > device_remove+0x48/0x74
> > device_release_driver_internal+0x1d8/0x234
> > device_driver_detach+0x14/0x1c
> > unbind_store+0xac/0xb0
> >
> > Fixes: 28a1295795d8 ("media: v4l: async: Allow multiple connections
> > between entities")
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-async.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-async.c
> > b/drivers/media/v4l2- core/v4l2-async.c index
> > 091e8cf4114b..8cfd593d293d 100644
> > --- a/drivers/media/v4l2-core/v4l2-async.c
> > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > @@ -880,7 +880,6 @@ void v4l2_async_unregister_subdev(struct
> > v4l2_subdev
> > *sd)
> >  				  &asc->notifier->waiting_list);
> >
> >  			v4l2_async_unbind_subdev_one(asc->notifier, asc);
> > -			list_del(&asc->asc_subdev_entry);
> >  		}
> >  	}
> >
> > --
> > 2.25.1


