Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22EC53340B8
	for <lists+linux-media@lfdr.de>; Wed, 10 Mar 2021 15:51:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231867AbhCJOuf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 09:50:35 -0500
Received: from mail-eopbgr1410121.outbound.protection.outlook.com ([40.107.141.121]:25363
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231282AbhCJOuc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 09:50:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKr3z1j5wTCIDzicC1rEx0MPxy8meVsqSYG10jeetuCrO3pDFkAbOGAP5jnks7ho++SzZAnJz9msirgzxaWeNdgUo4ETfK6yKi8i/uBJ203UrH/HbldUNmHQHBF4D/XD9lM+rA5GXlR4Szpf4GuyieUK3gDWdXMXEG4X8acpGUjy0cgg2wYTEGGIUEWGvFmqnaXA/QP/ZPkwrAGH1ImlXiB3e9NE4EdaLj+fpmztFSma2c36tTUc4mWSONTM8FJ9tJiOkNus6PYMX2C+eyxopOw28fyZuapUfznUpZNClsUEipKKb4JAlIUS9Nk7X9XnjNMXhWvye0IS3WIfG7kmPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YatUW/oyhzJoGrM1QJAOsFXas9FDHf6NhRM3a14Cxzo=;
 b=neYY0nTc7rodXZel5moBVfleFBSOOGoJltUQ9aPdpWB37sK7Hn5JiZvSC12cuhf2gIyxCnAe9w/OoecEiPtTAtQrBvuQSZhQTeR9jMvP8+aS9bJUNTT8vmgeI50VD6h2IDbOHCzMtbIjwW8lbqx5oEq13dZH6KSlZnWIyqRF1qf183EQvao4tCx47mzMsb2/Nt3YxBjdL/6x51KW1kenXyFyW8ApYHfTwJ42CLRIQ1rw+kPnkQQbIbyBx7rn4tF/IR2nKiXcAPEMX6fa/xiNU0OQ/ZBuRHif/OQDVSvw0FbPsIE2EA05bWesd0PzjWI+UVnt5E1M2JhNmJVfGJHdag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YatUW/oyhzJoGrM1QJAOsFXas9FDHf6NhRM3a14Cxzo=;
 b=El8e7HdQXsJd0aglAcG2VLJVRLU4Y6j8gBiwrpgBNMctLw6QSIFwISFH+f9X6mALJJM97WVxdtsptmS9D3uXDQ2NiarK36RtlTU+wG6CIX85RAXNrrDwyuQelI7ST9hjcVaJmrdlsVHbpYmqXV135KuLoEQjrYYSeWYlpgQanUI=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS0PR01MB5409.jpnprd01.prod.outlook.com (2603:1096:604:ab::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Wed, 10 Mar
 2021 14:50:23 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::a1c6:97eb:7268:c2b3]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::a1c6:97eb:7268:c2b3%4]) with mapi id 15.20.3912.029; Wed, 10 Mar 2021
 14:50:23 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     "kieran.bingham+renesas@ideasonboard.com" 
        <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: RE: [PATCH 2/2] media: v4l: vsp1: Fix uif null pointer access
Thread-Topic: [PATCH 2/2] media: v4l: vsp1: Fix uif null pointer access
Thread-Index: AQHXDpOdmMw2sSB0m0arhJWcvCVJPKp6wHQAgAKKpxCAAA4OgIAAAK+A
Date:   Wed, 10 Mar 2021 14:50:23 +0000
Message-ID: <OS0PR01MB5922ABCA7A782950B63DCA6686919@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210301120828.6945-1-biju.das.jz@bp.renesas.com>
 <20210301120828.6945-3-biju.das.jz@bp.renesas.com>
 <133f8b63-3b84-c60a-725d-30b8d6df35dd@ideasonboard.com>
 <OS0PR01MB5922BE9F9D151623773CF53286919@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <56c2d53e-8d1f-5b84-1480-5965ae9cbae2@ideasonboard.com>
In-Reply-To: <56c2d53e-8d1f-5b84-1480-5965ae9cbae2@ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9cbac09f-e2c1-4c9d-94d0-08d8e3d3d5a2
x-ms-traffictypediagnostic: OS0PR01MB5409:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OS0PR01MB540944E4799BF449CCA0E4AE86919@OS0PR01MB5409.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wZRgtF16+LpqXh8OG3uypX+LhXz7nK8KUBLdhmWhahqutUhaactIyJiKG2p5i1VEoi78bhmWktVsCOev/eOcv1m5XzGJnZYf+SYOek7SZAy66Goge3zttZaNGfNVO73mtmTCQht80cU+ld1HDnU7k9a+YnlOndCajiHWO/6KN8+puS6lvJaME++omwQJiDVHi9LArMT5V1/U/4WBabyH2eNf7iIspSKXVdylZqtnoMVgU4NEllDi66Hd1ngxyn2E5f7F5zkxZx7Y3unyfJxw3wlnljEmhOL2aHCoGGx7VKWzKR9iqsG7EyHv37UIQ6H9jHuYSpVD2ZC2MZ8VSfM5JWFXykpI+7rtdgxIjUj0RMVPctZhW4mJYrTrS9xZ0/4j8EIiZ3nTi5oXsRPijv8iiVyO4aUcoaAYjNl6yIadNQs+FZ40C9ThCl3ZfW6ncYdY1Et1U4uHMdHlqWiTzqfK72zRPAJD6lXjbk/lQoyjIuesK/xyHdnK2jTWJzWyHUn8Oe5zao+ccUW0e/Q3rzO44Sy/LOWH++QK6Elun5YWVOuREr1wU8xUGJGhIa5sW0c0pmYa8F+P3CgIATTmhWk0cJObAc0VkEcrV/5DS3bQE6M=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(136003)(366004)(396003)(8936002)(52536014)(186003)(478600001)(54906003)(110136005)(8676002)(45080400002)(83380400001)(71200400001)(316002)(26005)(7696005)(86362001)(2906002)(33656002)(6506007)(53546011)(66946007)(5660300002)(76116006)(66476007)(55016002)(66556008)(64756008)(66446008)(9686003)(4326008)(966005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?kwH8cu+M4ccluMc/BRDTXbqT7svXT3a/u7x7leju9PnAFItWMoM21Df1V6q7?=
 =?us-ascii?Q?1mTRuNuIROWlgynz+Aqd4G6Nulx9ZXTlJ9vq9pCbI3lZsmxIpIyV4BXCEM3N?=
 =?us-ascii?Q?m5brUq9eNJUp98Cx8rE8q9r+sx6UtGNV35Gd+dXt762CeRZLSM7DetxB8HgJ?=
 =?us-ascii?Q?RZidt5ofoTQdhF8QxNasf66Me5VBbD6oj0OKCzmgfCrtR8LHgdf0N13wDYOe?=
 =?us-ascii?Q?pG55bR4Fvrg7xHAmQor2Xgf/cNtaDs8HN/D51j1u7RZ+1+I1qEUeiGM8R1nD?=
 =?us-ascii?Q?kWNGJq2ZhCNv8n/PT0VKw17NUXNJc2P0tR8ciVwNc0HjIRLNKdIV7jlmYY4F?=
 =?us-ascii?Q?ftQl4YPlEEyR50SJdxKe5oTb/K//ERBeu4F8UaSLoiYdY33JPOAUEC+ZRIYq?=
 =?us-ascii?Q?e/D5m7bTdqHB7bDH7ZDVcp43+ZjG9KtTUj77xd2DoZfmM+wGu2gTjltCkDvv?=
 =?us-ascii?Q?ULhBURYn8RAERIYAqE8v3TGWSQLro6lpszXp2SLyp3OrbzN4/L+T3Bto1HHV?=
 =?us-ascii?Q?0fGCeIzyJUvpdlmZpHCKzr/gh/TTRBVq/UDv7S/8pbGehaxtrTKFnuz252Hj?=
 =?us-ascii?Q?2OPXdTSCn3Q5S4y460isqPcyxIvwrZBHfu/zruJbqUc1Vcn1Ouq/X/1lwqaS?=
 =?us-ascii?Q?3vsC6PYo0fO6rTAfUobuRqPiSoNCMHDWaoh1wcLYuyc7WR930MGQU79+Gigp?=
 =?us-ascii?Q?2ZhlS7TJy6vnWHHdsiGMJZco3xFz/G5ikzpe+/w6Di43LtDh+rfFh0w9rNHj?=
 =?us-ascii?Q?F6j0aj+UhezY+mtm580Hk7OyxnaT+QDqcWp61gsECWnrdNURPa9yl2c0XSxj?=
 =?us-ascii?Q?FSvHr/kRYiHDaOKc4ht+MncMs7k/iXQxEG7SmVYm9yckEvOGJXN8+YzRHm3t?=
 =?us-ascii?Q?FoG8SZ5+BTZLSRW8couVL5EEL4ARsERJ5O6O9WskkxzLqL4ciJXi6EwE2g/R?=
 =?us-ascii?Q?s/n9TuJ9rIGzISK1HFN3t8/Ps5v1E/HutyYiNAmtm5jpYq+eME+w1D7PinUB?=
 =?us-ascii?Q?HV19RnIs0miOnEtFrfNqD1O14+L7o8j5HU3J7PvW751TdIQhwPyxvN8nwJmz?=
 =?us-ascii?Q?2fzoBMBaUFziZxzz9H8tGbRhwG1Jvx+AbfhOx06RxCp/xW/7RmtHkykQFQ9I?=
 =?us-ascii?Q?qZx+zWpsaeTDIjQSFED+oXRK1hs5OhkOg3fuLshgY/hjsu3hHot8IVRrNL8X?=
 =?us-ascii?Q?Ukzqh2aRfCYvXxwnt0BIPDUkbWSvq6sAXJo5pcT/Po/5lAXwhFhWPNR/Fbt5?=
 =?us-ascii?Q?wcBAJR91+qHrhJ+/rkHy2TfPnqpXmc1ZlufJcy2nwbL/EvK4YZyl/gcvEp0C?=
 =?us-ascii?Q?jiqIOuQ9XavOhjaxcIseFWao?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cbac09f-e2c1-4c9d-94d0-08d8e3d3d5a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2021 14:50:23.0360
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 28kXZCar2v/+bG1dnBv6UJ7ixCH+il+D7moeqVeImMzPMgMrPDrTQyyNGz2DGpvUv8QQpxg6g4V2//xkrpuLxHSnl4l50Bp0rnKd4+8Tq3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5409
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

> Subject: Re: [PATCH 2/2] media: v4l: vsp1: Fix uif null pointer access
>=20
> Hi Biju,
>=20
> On 10/03/2021 13:56, Biju Das wrote:
> > Hi Kieran,
> >
> > Thanks for the feedback.
> >> Subject: Re: [PATCH 2/2] media: v4l: vsp1: Fix uif null pointer
> >> access
> >>
> >> Hi Biju,
> >>
> >> On 01/03/2021 12:08, Biju Das wrote:
> >>> RZ/G2L SoC has no UIF. This patch fixes null pointer access, when
> >>> UIF module is not used.
> >>>
> >>> Fixes: 5e824f989e6e8("media: v4l: vsp1: Integrate DISCOM in display
> >>> pipeline")
> >>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >>> ---
> >>>  drivers/media/platform/vsp1/vsp1_drm.c | 4 ++--
> >>>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/media/platform/vsp1/vsp1_drm.c
> >>> b/drivers/media/platform/vsp1/vsp1_drm.c
> >>> index f6d2f47a4058..06f74d410973 100644
> >>> --- a/drivers/media/platform/vsp1/vsp1_drm.c
> >>> +++ b/drivers/media/platform/vsp1/vsp1_drm.c
> >>> @@ -462,9 +462,9 @@ static int vsp1_du_pipeline_setup_inputs(struct
> >>> vsp1_device *vsp1,
> >>
> >>
> >> This looks like it complicates these conditionals more than we
> >> perhaps need to.
> >>
> >> What do you think about adding something above the block comment here?=
:
> >
> > It is much better.
> >
> > This patch is accepted in media tree[1]. So not sure, should I send a
> > follow up patch as optimization or drop this patch and send new one.
>=20
> Oh, I didn't realise these were in already. Sorry, I didn't see any revie=
w
> on the list, and it was the earliest I had got to them.
>=20
> > Please suggest.
>=20
> Up to you, I don't think this would get dropped now it's integrated.
> It's in, so if you want to update on top I believe that's fine.

OK, Will send follow up patch as optimization.

Cheers,
Biju

> --
> Kieran
>=20
>=20
> > [1]
> > https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
.
> > linuxtv.org%2Fmedia_tree.git%2Fcommit%2F%3Fh%3Dfixes%26id%3Dc4f27003ec
> > 3d84ef0c333c74ae2aff326537e583&amp;data=3D04%7C01%7Cbiju.das.jz%40bp.re=
n
> > esas.com%7Cad7bafadc61345db66e908d8e3d24f3c%7C53d82571da1947e49cb4625a
> > 166a4a2a%7C0%7C0%7C637509839726919053%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi
> > MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;
> > sdata=3Djb%2BzwAJD6%2FxBKsQEryhDeKnJbgI%2F3RNZCIXfYU4EBCw%3D&amp;reserv=
e
> > d=3D0
> >
> > Cheers,
> > Biju
> >
> >> 	if (!drm_pipe->uif)
> >> 		return 0;
> >>
> >>
> >>>  	 * make sure it is present in the pipeline's list of entities if it
> >>>  	 * wasn't already.
> >>>  	 */
> >>> -	if (!use_uif) {
> >>> +	if (drm_pipe->uif && !use_uif) {
> >>>  		drm_pipe->uif->pipe =3D NULL;
> >>> -	} else if (!drm_pipe->uif->pipe) {
> >>> +	} else if (drm_pipe->uif && !drm_pipe->uif->pipe) {>
> >> 	drm_pipe->uif->pipe =3D pipe;
> >>>  		list_add_tail(&drm_pipe->uif->list_pipe, &pipe->entities);
> >>>  	}
> >>>
> >

