Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE46617FE04
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 14:32:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728915AbgCJNcG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 09:32:06 -0400
Received: from mail-eopbgr1410101.outbound.protection.outlook.com ([40.107.141.101]:33513
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728218AbgCJNcG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 09:32:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lgCkZmy26pUqI/3EoyysuCzSCIVjsB1fNPypMc+fj8f0pfqeTi2+C5Bc9IUYWa8sYhYoHMHPccd0h8Tkv7pcL2Asa0LN2WEk+ipETGmZDxME4Sa5t71dhgeY2+Vrnr0PnfjTEtL6cZtJ7SSIon5W/BMGsPhD0KTVB7rEe1G4Qx+de8fEzQUCIsZGEtER/7SCKZgkRj6XTLZKLhmPiYvwGbJWR7uU7NmPNfrpDCaCbPey5KRBZU0BdxVTQxzp8j5mk3/toyKiF8tdfKI211cSb7XdZK5XL2Cnf4A6gv1mJ6ktfBkMhW7+5Qr3HAIjKHvNmMMuunkVzDTsuDra2j4odA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4NY/WWErLq5lZkjl2MizQht6hx1KXOP1yGn0Kwd/DE=;
 b=OkshEY/zPHLab2K0obFn7Ar1GSoh/FWj3i/QlT38c76Jz2RZ/C91kRsmrKXBc/PGwDVYcjUBCdZuum3Q69rX/fqtCx6SABoLg/lC8Yrp2TtNKp/avHrPFZKwkdPSjtMzGqbTvqDb4X23H9xJ2WGi6L3HZGRumguD2v9bz9V29B00H3Q6TuzsL+4yD0XdhV9umzCeBpID6uQwTztHq6dqHgxAmLv6NdGgbbsz6w665/3SdUFqCmBiQx+r8lCns7J9mfW8Cs+lCFoFN+2UvVF1QkiAvD+1sDCN4JNlFiLDg1Q22av6rfXPdbtCzijRhVh00UqpvjuIKIQB4Qc3SzpR9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4NY/WWErLq5lZkjl2MizQht6hx1KXOP1yGn0Kwd/DE=;
 b=Dqk65sEmNhDRsF0qqqhaFJSWdDuC8Yu1ZggYn4lx458XJjbxuS5CfYHs9CD6J/cSNxFrE3NM0svLqg4ZGaJx9BuoWJNJE0GC1HD/6ZlS8pQokraHqscs1SPNbs8tlgw1pW4HW+x3bnGvxCc7XH0TNk3F9S6wZRf+D0caKdbvF6I=
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com (20.178.97.80) by
 OSBPR01MB3318.jpnprd01.prod.outlook.com (20.178.5.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.14; Tue, 10 Mar 2020 13:32:01 +0000
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::6df0:eb47:a259:b94b]) by OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::6df0:eb47:a259:b94b%7]) with mapi id 15.20.2793.018; Tue, 10 Mar 2020
 13:32:00 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Niklas <niklas.soderlund@ragnatech.se>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: RE: [PATCH v2 3/3] media: rcar-vin: rcar-csi2: Add support for
 MEDIA_BUS_FMT_SRGGB8_1X8 format
Thread-Topic: [PATCH v2 3/3] media: rcar-vin: rcar-csi2: Add support for
 MEDIA_BUS_FMT_SRGGB8_1X8 format
Thread-Index: AQHV9swB6r3pn+oA/0Oe+3GvBSYM56hBxt8AgAAL0eA=
Date:   Tue, 10 Mar 2020 13:32:00 +0000
Message-ID: <OSBPR01MB3590DD80FE95AEFC8CAAB32DAAFF0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
References: <1583838364-12932-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1583838364-12932-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200310124844.GP2975348@oden.dyn.berto.se>
In-Reply-To: <20200310124844.GP2975348@oden.dyn.berto.se>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=prabhakar.mahadev-lad.rj@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e905f176-60be-44e1-0056-08d7c4f769c9
x-ms-traffictypediagnostic: OSBPR01MB3318:
x-microsoft-antispam-prvs: <OSBPR01MB33188A819E5BA3609D676725AAFF0@OSBPR01MB3318.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 033857D0BD
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(39860400002)(136003)(376002)(396003)(366004)(189003)(199004)(54906003)(71200400001)(6916009)(9686003)(55016002)(478600001)(5660300002)(66476007)(81166006)(7696005)(52536014)(66556008)(4326008)(8936002)(86362001)(186003)(66446008)(26005)(64756008)(53546011)(316002)(6506007)(66574012)(66946007)(76116006)(8676002)(2906002)(33656002)(81156014);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3318;H:OSBPR01MB3590.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f/8ILCJhjUv0qC7yQ2tcfkZafN2wSDSDPxvZvu5JZ52oDXpYUTTm1HjjSvlW4vWke5wV8DyKUl+b4JM+RBmp8uSL+J8mhO3Aqp2IGpoM6ts+GIpixIN4wL3vCftBhRSU64fF5u69srb+dlpDlJKUvyZpge/bdAlqu9G7NyzD1Za5mQQ1M/mJYFp5vlP2Uf5ykkkfsVjuAiu8PxvpVqSbeSk9zs3L2XY0cmi7/0tKMRFLr/8hdtHySCy3SIMJFZsOfFQ72Mrdcy6tOCh2hzNMuPdxCTkWKlP1PVjNYUlEWtd0jStxBUhNJ5yUwaryQM7iIQTf9y0cMX9GB5jiwNAQNmlrPfLe7GYoEjdDV1QUaYP3o4RP2IQ6lZQRTaC+/2ZhAA9Eirs35jb+ZltrBN1pCLep31f8qfdKYVPppnlIiU+q+PRTIkHjnDqbfjQXRNzV
x-ms-exchange-antispam-messagedata: w3D9WLHRTlLnp9RgRkgALCgdbMhGqoYfMPdRC6TUQuZGpPruDq/8302EdO/3Shx1vqlNVOnPdFUX008WYYfD+zMNgR0FLNac+69bEjCfbfIvbP3+I6ZENl38F2TKbzglJATpyz+FbQmYskoD+9P7Jg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e905f176-60be-44e1-0056-08d7c4f769c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2020 13:32:00.2543
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: unsPvuuOGE7CVgpisryLuIAz5w7NHssDHWHkzXSnxz6QiFG6S7WAvP1Mgw5xYTUsq0Xk9+PyWrwtlT9oGVNaxr/e/KRvGtL+XQl7DVPVIfwcZmyPkrmyw0QlnsqUj+Wi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3318
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Thank you for the review.

> -----Original Message-----
> From: Niklas <niklas.soderlund@ragnatech.se>
> Sent: 10 March 2020 12:49
> To: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>; linux-
> media@vger.kernel.org; linux-renesas-soc@vger.kernel.org; linux-
> kernel@vger.kernel.org; Lad Prabhakar <prabhakar.csengg@gmail.com>
> Subject: Re: [PATCH v2 3/3] media: rcar-vin: rcar-csi2: Add support for
> MEDIA_BUS_FMT_SRGGB8_1X8 format
>
> Hi Lad,
>
> Thanks for your work.
>
> On 2020-03-10 11:06:04 +0000, Lad Prabhakar wrote:
> > This patch adds support for MEDIA_BUS_FMT_SRGGB8_1X8 format for
> CSI2
> > input.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-
> lad.rj@bp.renesas.com>
>
> Small nit, you can drop rcar-vin from the subject as this patch is for th=
e rcar-
> csi2 driver. With this fixed,
>
Sure will update it for next iteration.

Cheers,
--Prabhakar

> Reviewed-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>
>
> > ---
> >  drivers/media/platform/rcar-vin/rcar-csi2.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c
> > b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > index 39e1639..b030ef6 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > @@ -320,6 +320,7 @@ static const struct rcar_csi2_format
> rcar_csi2_formats[] =3D {
> >  { .code =3D MEDIA_BUS_FMT_YUYV8_1X16,.datatype =3D 0x1e,
> .bpp =3D 16 },
> >  { .code =3D MEDIA_BUS_FMT_UYVY8_2X8,.datatype =3D 0x1e,
> .bpp =3D 16 },
> >  { .code =3D MEDIA_BUS_FMT_YUYV10_2X10,.datatype =3D 0x1e,
> .bpp =3D 20 },
> > +{ .code =3D MEDIA_BUS_FMT_SRGGB8_1X8,     .datatype =3D 0x2a, .bpp =3D
> 8 },
> >  };
> >
> >  static const struct rcar_csi2_format *rcsi2_code_to_fmt(unsigned int
> > code)
> > --
> > 2.7.4
> >
>
> --
> Regards,
> Niklas S=F6derlund


Renesas Electronics Europe GmbH, Geschaeftsfuehrer/President: Carsten Jauch=
, Sitz der Gesellschaft/Registered office: Duesseldorf, Arcadiastrasse 10, =
40472 Duesseldorf, Germany, Handelsregister/Commercial Register: Duesseldor=
f, HRB 3708 USt-IDNr./Tax identification no.: DE 119353406 WEEE-Reg.-Nr./WE=
EE reg. no.: DE 14978647
