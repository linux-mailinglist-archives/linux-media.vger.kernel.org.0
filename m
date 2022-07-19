Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2376579392
	for <lists+linux-media@lfdr.de>; Tue, 19 Jul 2022 08:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232167AbiGSGzl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jul 2022 02:55:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232255AbiGSGzh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jul 2022 02:55:37 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2134.outbound.protection.outlook.com [40.107.114.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 658F512774;
        Mon, 18 Jul 2022 23:55:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hdk/UhNOu7j8Gyj5qE7lYkHPFrkEnXHl4XMUzylSf6YoQ0UQNGw2jGb2wZbnR0JLXKU03qCYDktWn8LaJaMIylFiuCQjIydReHDbOFc48GrS3F0XEdRn5JXDn0TDYJre0IVbO8Gxq6aOPxTk0zP8rQ/IF+ule4XNmFBkicxMSougb6EZ3fWT6RXuTu9gWYKZRAspyl5mBK1JOoRMlMCNvJGv7uHLfXqU+OGgTWfglGg4GKtyqHrhhKj0SN1o6UORISCKH6fXcd0Hy/KgxwMGWWXTtq9qw8YLf2l/6B+5sygimiG15FHRU3s68XB23TT3Sou4OJi8pQ7K0ep4VaZeUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T0FoU39jsyjoTWgCFdaeqxxWoJ2U4XawuN2+rsB7gK0=;
 b=N3xdJTF8xMcBwqKVFnkx9M/usX1VH71NtciCGII6orxq+4ELlMJdxky4ncnP73MVdICz2omrqpj8r0hq4X8BDirLGIYwdkvpcnjjnukC4N/JcS4otpS7+6bXCLxnp+LSLuvNFPhJHBHO1BIf9DT0sXA5HmpEYBxYZGaihZ3HLDZ25+SXrjmHaqlGfGvzC+xY9VynNwBc2ntlQ54tLAnIDAOhI3R0Vfi1+TwbBJJwoq9dOToYWXGu0/2uNa8e9GR/m4h2aUp+xJrfotH6Zmb/ThQ68h3MvZY4as/pRpYx8zQq0sniQD9XJqJlNZL0Dl/w4i1CnKYs7HtAJFA6/N7ABA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0FoU39jsyjoTWgCFdaeqxxWoJ2U4XawuN2+rsB7gK0=;
 b=B/lQOCHjCmk65ZClybyYrwxUnRh6Y5R9j6WjUgZ+h8yZ64JPLAh4aorGXDRXCUaDtNOgFPuH9aIY8Um1Dn/jOZP1CKd0afgzuS7lQ7+COqF5hDI/LYonMu/q/+6443zkOEhx7GqC5jX48XBbQFnGR7vwKO6qtvItJkF8ZrWCbig=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB2948.jpnprd01.prod.outlook.com (2603:1096:604:4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.19; Tue, 19 Jul
 2022 06:55:32 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b046:d8a3:ac9c:75b5]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b046:d8a3:ac9c:75b5%4]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 06:55:32 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v11 2/5] media: renesas: vsp1: Add support to
 deassert/assert reset line
Thread-Topic: [PATCH v11 2/5] media: renesas: vsp1: Add support to
 deassert/assert reset line
Thread-Index: AQHYdPmLaH3LWDeTz0+X1dy9H4VIWa18OHAAgAAKlXCAAAizAIAAEfkAgAAGnICAB8d6EIAABR+AgAABhGCAAK4ogIAApnlg
Date:   Tue, 19 Jul 2022 06:55:32 +0000
Message-ID: <OS0PR01MB59221E2ACA52ACE89AD928D9868F9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220531141958.575616-1-biju.das.jz@bp.renesas.com>
 <20220531141958.575616-3-biju.das.jz@bp.renesas.com>
 <20220713081856.GA14683@pengutronix.de>
 <OS0PR01MB59225D5ACA3BC7BAB2F47D1D86899@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdXe6P+qg07wFCryqQt7EhTpKw8ZgSN6UjqxYy16eghXdw@mail.gmail.com>
 <20220713103216.GA10829@pengutronix.de>
 <CAMuHMdX9ULJVzxsBqkZvg2_XoxJPGqmduhjM9j_PCJDk-PdmqQ@mail.gmail.com>
 <OS0PR01MB5922AEA08C8DD71390E51A97868C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <f3d19a38e59e73b91601b7a34aaf1c2ea41ff915.camel@pengutronix.de>
 <OS0PR01MB5922B692CA3784F4C481118F868C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdXJ0=J6ZG4BJEdG21ks3NVpm6nbBgz7UySeQ8xdLj159g@mail.gmail.com>
In-Reply-To: <CAMuHMdXJ0=J6ZG4BJEdG21ks3NVpm6nbBgz7UySeQ8xdLj159g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 386265d3-2a1b-4882-2542-08da6953ac7b
x-ms-traffictypediagnostic: OSAPR01MB2948:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MxSQt1IXWRm2V7y9USXkAxvTQsRUhH7OWPwDsbahZn6AI0EIek5Q3e48RmreM3OKVAKxMkwj+jxpuiQ6W+NW78xPDPbEo33fJhNMJH6IpgCkhaNHEK/AyNhCGYWG9ynhCDHEm3xz10rIDJEzekuowUraoN7qT7UxikJS3XSJsXjWOE2s7SBCygsLfaaJ2GKbBQyqMD+r24TmLOkaUAIFNZn8hOWHq4f99JUkKlv+bOonpFZWcVQTFxeUTsWENHMkUE7UK3cWheZfQEaWwKkTcfC33lrM4s7oQZuut++nIiUmFMK74AdDhdv+ZulaCbg79AN8bViYljeCm7rX41pTrLIwsqikmUrnhC5PK7WCs9Lgwc4TIuOOzAvF7VM+nU7CmHQ1+Rj9Rb6dfRlN3zrrwuajSREA9mLx9LV47eIKCk69y0ArK6kY6UqngGX1mbncA3UcBt2RbSZmXPI853YmdsbKm1ZdapxFRV6JtXVPv+9kxmOHOxg3nPU2uqxhWRRqskfUb7vYw10sv0jeUs6V64QdqQA7/A/Isl8KSkjdbFhK8+xi2wnA9U9gD+XJQAEvgfbmRCHANfv2y3IqpDFxM/3pKqy2LAK4ix6fR8ThJSlG3U2XpayghSd5/YKbqI5OTFUsb6wiEazF5kzU+is5ZQEaSbNVZZA0MhOOkujfiP8mG4s3JxSt6bqUC9LaF2cVIRj6jCLVOOulet66iHtsvlZkPJ1+KHSEua9MkCEVhe4HW8Dr9zS4xnCBVIePRGYzCjEGf4BgFwrnsEaj9SbKiKjEeqJM2TWyiYRamf30hXxl4GhQE1inUHoB9kHuPFSO
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(55016003)(64756008)(66946007)(38100700002)(8676002)(66446008)(4326008)(66476007)(5660300002)(52536014)(107886003)(76116006)(186003)(83380400001)(66556008)(53546011)(478600001)(8936002)(54906003)(6506007)(7696005)(122000001)(86362001)(110136005)(9686003)(316002)(41300700001)(26005)(33656002)(38070700005)(71200400001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ns3aqJ8HX/4dE1iaTvTkwF94koWtY1b7AmrNd6HPVrllt9qptpZNSVC/xJgt?=
 =?us-ascii?Q?8J0JVOJhr5IAVaxPjqmEvD1KDEBfmpDpaYoDquPWghfUkrUU1svlFIJWDZBQ?=
 =?us-ascii?Q?dutgBURUy+tRHemWffKqGYi+leSeCDvgANpL2hHf4RI6es7Ty8XV6JffBtdX?=
 =?us-ascii?Q?PyD7VNtDBywW8cnAXrD9NInmz2omXGEk58meHvvxy0ZDiOlo8ZPWNCSOHQ5d?=
 =?us-ascii?Q?g9RcmO2QQk/Mh0BSkIcUEPntLVkpm40dtOeQFcFQvtVhvvmcUSVz+ugA2R+s?=
 =?us-ascii?Q?ykUZABcXwSjdVZYL4tw+j7W3Qs/6smYcpvIB4ilna7a85bb3XR0lpfauDc5q?=
 =?us-ascii?Q?2PcrUqkj01ig3H8y1wssrdJaNc7+stYCx+apQUX0lv62LJMFMQO9IHWu6SeN?=
 =?us-ascii?Q?J42Paqr3kmJofAi/j8r3yP2VnxWKtsJwXkk6Ls+AGvqR1a9owUegbiPnHMX1?=
 =?us-ascii?Q?borPhku6jYG6jVClD0yuEeApVnrQo4RRGWAXSeEXn/ELcbecVe3xZeLlAWxs?=
 =?us-ascii?Q?vFA85FXN4iOcyUWH/2NeKM8LlQF25vlks7iAVPopd3/GBWKyGRjil3r8kxWq?=
 =?us-ascii?Q?fwiteyvuQ+PtsprB3DvALDUbli43H9BJmBESIy6UvwEBC+eT6MCuoXHwonJu?=
 =?us-ascii?Q?OSvW4N0JQueMsZagOsyEdhrvkTxKW5//NQ6RgIHCFGXqIfjU4YXnay0wR/KW?=
 =?us-ascii?Q?L5B1cDvc79IuN2USlEQI5wUBlMlw8igJh+xEFnApZtBAO6qErzvYbH2YGtHJ?=
 =?us-ascii?Q?MRkLu5Pi7wDa7pIYcSTVEQ7SJz5HSAfBTI9GFlS67motBGOwX91cWM3bwXmI?=
 =?us-ascii?Q?N1NgwWjOCZFkoqPhyWZv5Q4J2XbXKyZhW3hGVcXyLBiAiu21KBU/dQHllI8d?=
 =?us-ascii?Q?gOi7tPTjXLB+/Zt/GGzBzfhkNZKYfNlFJr0DqVzAMCF7EVRrLSXtmIvsf6PQ?=
 =?us-ascii?Q?WgPUuhuj3JAX/1sMyauPNP/RWWLsg5DLzb69OOoAsj1m9IlirRJqMOzcV+eQ?=
 =?us-ascii?Q?Wr/jsgXFrjk9NP45OZUMSW5Mxnc81XZGnc3WGAw+1JeIqf3cuup4dOAU+1iZ?=
 =?us-ascii?Q?7x2ZveFJDon3W2yoNhupk4OD6+R6iGw/KvFAkQ+v3tp/cHNrGH97j4b017wv?=
 =?us-ascii?Q?NYZRKwN7pwP0dqr9RAovTp44kiBLlYEz8Yf1vsgK6f//nfsW49SRH5RT+MQP?=
 =?us-ascii?Q?eTHtnw2X9gzm3LkzZZbMM0+H4b+3n7ywJDHHb/LMx5wlPabRL/CI9YiD17q+?=
 =?us-ascii?Q?O0iOnNockZoBSk7W9J7k/yX9AGSZ67JuP3R34vQGrlyxEDAQ2GlYu5f6AHv1?=
 =?us-ascii?Q?xdIx+S/4+KEgIbaHbgHgF+u5zeqKldYsH2m0gXaVm/TvtXuOYWb1clpP/5p3?=
 =?us-ascii?Q?crXxMX4JSG42NmWidhdgkgT3oFD0zTZNCCwe0Yj2BMiEIAvlLgvDNY0iaaAL?=
 =?us-ascii?Q?lGVKGFE6l0kHEp2LtMkyTd3cqUDH8CBUlgaksoCGLbH3Dh9T+2RDzxcNtVj4?=
 =?us-ascii?Q?hggwVfyTjEsNmTUhQPD2XO+FN54aZ7cp/7S69zSYDgkpJHOLxC+4koH0NZBf?=
 =?us-ascii?Q?6JGPyf+rMccrS0/WgU2wYUR8UOSYCnu62t8zbD3NeM4+cmYs050sLpRbnfkv?=
 =?us-ascii?Q?Bg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 386265d3-2a1b-4882-2542-08da6953ac7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2022 06:55:32.3143
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xTcU8ZXe8VfR/DFm58hm3ltZsZxg6pSXqVn4o8ESJLVaGse8aFRTPDl9yNtzescpuuYehAsIeClOc4ADQQxmCkeBhNpQZtm4KIE/hYtaEK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2948
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert and Philipp,

> Subject: Re: [PATCH v11 2/5] media: renesas: vsp1: Add support to
> deassert/assert reset line
>=20
> Hi Biju,
>=20
> On Mon, Jul 18, 2022 at 12:12 PM Biju Das <biju.das.jz@bp.renesas.com>
> wrote:
> > > Subject: Re: [PATCH v11 2/5] media: renesas: vsp1: Add support to
> > > deassert/assert reset line
> > >
> > > Hi,
> > >
> > > On Mo, 2022-07-18 at 09:46 +0000, Biju Das wrote:
> > > > Hi Philipp and Geert,
> > > >
> > > > > Subject: Re: [PATCH v11 2/5] media: renesas: vsp1: Add support
> > > > > to deassert/assert reset line
> > > > >
> > > > > Hi Philipp,
> > > > >
> > > > > On Wed, Jul 13, 2022 at 12:32 PM Philipp Zabel
> > > > > <p.zabel@pengutronix.de>
> > > > > wrote:
> > > > > > On Wed, Jul 13, 2022 at 11:27:56AM +0200, Geert Uytterhoeven
> wrote:
> > > > > > [...]
> > > > > > > Actually I suggested handling this in the VSP driver, as VSP
> > > > > > > seems to be "special".
> > > > > > >
> > > > > > > >
> > > > > > > > [1]
> > > > > >
> > > > > > So reset_control_status never actually returns 1 and the
> > > > > > polling loop is not necessary at all?
> > > > > >
> > > > > > If it's just the status register read that fixes things for
> > > > > > VSP, could it be that the deasserting register write to the
> > > > > > reset controller and the following register writes to VSP are
> > > > > > not ordered somewhere at the interconnect and the read issued
> > > > > > to the reset controller just guarantees that order?
> > > > >
> > > > > The udelay() also works.
> > > > >
> > > > > While the reset may be deasserted immediately (at the reset
> > > > > controller level), the VSP may need some additional time to
> > > > > settle/initialize (at the VSP level).
> > >
> > > ^ this feels to me like we are blindly applying a workaround for an
> > > unknown problem. Is there any way to find out what actually causes
> > > this delay (or status readback) to be necessary? Is there something
> > > documented, like a certain number of VSP clocks required to
> > > internally propagate the reset?
> >
> > OK.
> >
> > >
> > > > >
> > > > > Reset is known to work on other blocks on the same SoC, so
> > > > > that's why I suggested handling this in the VSP driver instead,
> > > > > like we already do for i2c.
> > > >
> > > > From the discussion, we agree that the current implementation is
> good.
> > > >
> > > > Please correct me if my understanding is wrong.
> > >
> > > From my understanding, not quite. At least the timeout poll is
> > > unnecessary and misleading. It suggests that reset_control_status()
> > > could return 0 at this point, which would be a bug in the reset
> driver.
> > >
> > > If reset_control_status() only ever returns 1 and the polling loop
> > > ends in the first iteration, you can drop the loop and just read
> status once.
> > > Or use udelay(), at this point I have not enough information to
> > > understand which would be more appropriate.
> >
> > For RZ/G1N SoC's like Geert mentioned in [1], calling
> > reset_control_status() only once fixes the issue. So strictly speaking
> polling is not required.
> >
> > @Geert Uytterhoeven, Please share your opinion on this.
>=20
> According to that thread, it also works without reading the register,
> when adding a small delay() (to the vsp driver)?

What about using the below logic?

If ((reset_control_status() =3D=3D 0) && udelay(x))
	dev_warn(dev, "Deassert failed");

This makes system wake up after STR faster compared to
udelay.

Currently with first status readback() is sufficient for fixing the issue.
But this logic is tested only on few boards.

Adding a warn message to this logic, to check if any of the boards is=20
returning reset_control_status() as "0".

Are we ok with this? Please share your views.

Cheers,
Biju
