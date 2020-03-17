Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71F0E187ACA
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2020 09:04:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725794AbgCQID5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Mar 2020 04:03:57 -0400
Received: from mail-eopbgr1410113.outbound.protection.outlook.com ([40.107.141.113]:11776
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726121AbgCQID5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Mar 2020 04:03:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b6/LNlwQPTB5MiBZ40esL6YtDiGLbeFpArFPTQkKgrF8fY5REjAkodSld3eEHD0Up5XjrAIc9+1UQX6KlfVspQjkCxa/d3cT9sZizVPHy/st8sFWnh07dcOivU03znDK8DPNARLU8DaKZO1XIkD/fkge9tyYT39whsC6lOjPPXzRbUic+0zfIaIaBAUVanDVieN7S2ehHRJlyrdxy7Xlnknpgt0dZ1BfvlbUJN3F6LjLymMOb+c5M6NbvaZc8FwpaNeTGSlRzeCRZph69/HjMxiXNp0reTudXDgb6GUo4s0ytkE5sQwAM97BIbxJtCeiPEhn5Tji6ZHM/ipflZF5AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VYWMct26Jx5G2s14URg+T6fiQYzqRH2yf6xxKVOYijg=;
 b=ViORCb0+8ym4FPqJIwlKAVAHV+3bitwJ0qxNxmtaxHBmawGss8LNzYdMIx+vJDS8S6nEFzNmdfbaJ7i8jRd1egNycxzbrlnaY9dv8c477pCzTAoUelEQJaySShQPBdkZLOpHXrSUWX2GO2G4uKPyb0DpUErRFEk1H6kiylmKPX8SVNQ43FrQUZhs5scqogavV1XGHNgWKR6fO62vrdODjYMKa4kN4qqKFGAxlFMVXULyJovgJbTE2ddkXTf0mocrJTjW+hJCuVZj+peWmSkav1UKvKoYFPzl38kypJXVienVm4ovuAaDbrHPBS7QaFZxQhXja98eAyXPY72sHBxJBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VYWMct26Jx5G2s14URg+T6fiQYzqRH2yf6xxKVOYijg=;
 b=CpUdMnfutBzHpg2l+p0AqcHA+Ur7D2mxAPD86dLnU26b+WWIpD9hRTyROl+sn3r/vS7bgwOAy1eMwUf0EwNr7hjUZ5r0e7y7SrcQs/mf9bLGErSHmvXG5zvjQaKiF82bWiSWR1GXZNSWvRedu5i3p/exhGzkNx4c8IqAk+IPyao=
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com (20.178.97.80) by
 OSBPR01MB3496.jpnprd01.prod.outlook.com (20.178.97.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.22; Tue, 17 Mar 2020 08:03:49 +0000
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::490:aa83:2d09:3a0b]) by OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::490:aa83:2d09:3a0b%5]) with mapi id 15.20.2814.021; Tue, 17 Mar 2020
 08:03:49 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Marcus Folkesson <marcus.folkesson@gmail.com>
CC:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: RE: [PATCH v4 0/3] media: i2c: imx219: Feature enhancements
Thread-Topic: [PATCH v4 0/3] media: i2c: imx219: Feature enhancements
Thread-Index: AQHV9t5F6SQXMO4R7kmnzZgVQWgA4ahMdtGAgAAAF7A=
Date:   Tue, 17 Mar 2020 08:03:49 +0000
Message-ID: <OSBPR01MB359081F292B1F7E3D56242EFAAF60@OSBPR01MB3590.jpnprd01.prod.outlook.com>
References: <1583846229-6799-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200317080135.GA138007@gmail.com>
In-Reply-To: <20200317080135.GA138007@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=prabhakar.mahadev-lad.rj@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5072e62a-040d-44af-5644-08d7ca49ba0e
x-ms-traffictypediagnostic: OSBPR01MB3496:
x-microsoft-antispam-prvs: <OSBPR01MB34960193C35D1BCF4ABFBCA1AAF60@OSBPR01MB3496.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0345CFD558
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(39850400004)(136003)(346002)(376002)(366004)(199004)(4326008)(81166006)(55016002)(9686003)(81156014)(966005)(8676002)(76116006)(33656002)(64756008)(66446008)(66946007)(316002)(66476007)(478600001)(2906002)(66556008)(54906003)(26005)(7696005)(86362001)(186003)(8936002)(6506007)(53546011)(52536014)(5660300002)(71200400001)(6916009);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3496;H:OSBPR01MB3590.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R5sNn1Wz/i2ShgPlKw3N8Co0SJNHa6Xrt2bnWp3sA7Cc7V7N9wgLbEOauc2h6qszbOmS9AYKi6xZcMSWdRtxjw53EryclDaKDb5Zvfek/a6QTSVtl8Wtb2dZrXFQelVEf8po0zq+dcXfymFWYyohpxhLildaCJNDgamSMo/p5pcvR5yBwDIXKBp5JJvNabfWaJkHtI/u0++4bTMqX/dcYnexRLOVnpFvnQGH2Qu0j9/MmWV/WzzYfR7E1pMxzkamwjBb1sHOIx/XcO8QioO4q4hSM7sbNmxKd9FNbdmRWVEn62ik+Jw5kxv4WUFlYZWOt9tkMKEWDVCiKz9ErStqfO05aUvChVKQn/OSxlZ5JBE00AmUpAQ6W24v0IntREWUi2pJgFbQ7yX8Ml+1NT/VunKvdNvvissmzBbcOee1Ut17ULhkeh1YPASy3aYlbLGOTeBFDQY/36kL32ID4l509swKjsEtHZhalK+zKle91dC5fQV0rECibB4/Aztg22aFUThhlY/7XuvMr6iwbjeLHg==
x-ms-exchange-antispam-messagedata: jKY/pr08D/cay4IJEWkQgBt+cc++bUq7+B78ZEeFvjbIdDbbb82jp8QCJsmMYZtQPiqHU1RFX7fa3FEIJfZiJjdTNyq+ymgf5Eh19kbiJWzTBLysX24tQTqDH0ahAFIPaFk2xpyEO6F4H4kLEnyAIQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5072e62a-040d-44af-5644-08d7ca49ba0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2020 08:03:49.7780
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vw/xTb5FSzEH3ks7FEumZ0dSqSOjuXFZJHMXLsZqWnro8+Vtdx8e+4GP8ZWXXkXTLeoVugw6fIpT40C2RZXeiEE/ZRsAlo7XLtZjBBZfAlMq/k4HpUFnHELyNcHf3mLk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3496
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marcus,

> -----Original Message-----
> From: Marcus Folkesson <marcus.folkesson@gmail.com>
> Sent: 17 March 2020 08:02
> To: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>; Sakari Ailus
> <sakari.ailus@linux.intel.com>; Mauro Carvalho Chehab
> <mchehab@kernel.org>; linux-media@vger.kernel.org; linux-
> kernel@vger.kernel.org; Lad Prabhakar <prabhakar.csengg@gmail.com>
> Subject: Re: [PATCH v4 0/3] media: i2c: imx219: Feature enhancements
>
> Hi,
>
> To which tree does this patchset apply?
>
These patches apply to media_tree [1], btw v4 patches have been accepted an=
d  merged into master branch of media_tree.

[1] https://git.linuxtv.org//media_tree.git

Cheers,
--Prabhakar

> On Tue, Mar 10, 2020 at 01:17:06PM +0000, Lad Prabhakar wrote:
> > This patch series does the following:
> > 1: Makes sure the sensor is LP11 state on power up
> > 2: Adds support for RAW8
> > 3: Adds support for 640x480 resolution
> >
> > Changes for v4:
> > 1: Fixed review comments for patch 2/2 as request by Sakari.
> >
> > Changes for v3:
> > 1: Only patch 3/3 was posted for review.
> >
> > Changes for v2:
> > 1: Dropped setting the format in probe to coax the sensor to enter LP11
> >    state.
> > 2: Fixed switching between RAW8/RAW10 modes.
> > 3: Fixed fps setting for 640x480 and switched to auto mode.
> >
> > Lad Prabhakar (3):
> >   media: i2c: imx219: Fix power sequence
> >   media: i2c: imx219: Add support for RAW8 bit bayer format
> >   media: i2c: imx219: Add support for cropped 640x480 resolution
> >
> >  drivers/media/i2c/imx219.c | 235
> ++++++++++++++++++++++++++++++++++++++-------
> >  1 file changed, 202 insertions(+), 33 deletions(-)
> >
> > --
> > 2.7.4
> >
>
>
> Thanks,
> Marcus Folkesson


Renesas Electronics Europe GmbH, Geschaeftsfuehrer/President: Carsten Jauch=
, Sitz der Gesellschaft/Registered office: Duesseldorf, Arcadiastrasse 10, =
40472 Duesseldorf, Germany, Handelsregister/Commercial Register: Duesseldor=
f, HRB 3708 USt-IDNr./Tax identification no.: DE 119353406 WEEE-Reg.-Nr./WE=
EE reg. no.: DE 14978647
