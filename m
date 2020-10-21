Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CBE0294DE5
	for <lists+linux-media@lfdr.de>; Wed, 21 Oct 2020 15:48:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2443043AbgJUNsb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Oct 2020 09:48:31 -0400
Received: from mail-eopbgr1400131.outbound.protection.outlook.com ([40.107.140.131]:16944
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2441947AbgJUNsb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Oct 2020 09:48:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kqtot8XWF3jLF83kNm2b2PaL2JH1YaumCSXReIfbbKaHiXNyepDzMycm+0h84uva7UTHWfWyJpg8Lq8teevJEvrVxHGrfQ3SCa2NI32+vSfrGcr0Cd0mXzVxCfkDSwOab6eAkLsuVePSPv+5LOt3duAO774zrW0yH4ZwfqNFNCnG2+0jaSLN4yCkIWPQEAumc4JIlfxDzoCDkBO9zhe7AwXVSkrx2PkjDJCqPzRc367h5HDUc9BFTBdR7hXU1RsxXzzMxC0AERxWvBsqZropyDER/DD2/xwT/y7JhaK7543uuc6AA81nkpqeuRVMVnum/Jrb7fEZGf6192o10amQyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1lF2ARTJqlzzUW87IGJihXfg4Lo+v0Cmwg7e20V92g=;
 b=drd9FGyU83n5AcYnhmn+439vlfXiwKCDLtZcU1lGh8T3mEM6vYqoCTRWap1FsWyGjXhnx0z4fEN+/NwjDkH1cxfodczyFi6q+FQs+vBv29xmKYSi3iiXXnNFRSEW03dM2XHKNOICsKpBaksAwZKIMnx2AySOOMst3hdZR/qxotbk91KfAem9RCuiCm9TSaIPnxa/n7FkV4s4GWn7DZP3TF69y2sxfKHczj8BSr6bpfbixyK0Uo8/fuQ1RYRbuN/tUk7rj1hUWjaSV+abV+trdoUVxC/LfwQEo08Mi8p4j9eFN4/wnT/WgKRbm9SddhF8s5r9ocyTUuboTImGcxKejg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1lF2ARTJqlzzUW87IGJihXfg4Lo+v0Cmwg7e20V92g=;
 b=ghv80drehKmc074L0qp6Ju30klPFVYGzDy1TKRjH92uKyYF7JJ5szLd8B9uQEuD477MY1xmB9gAlCcHXXpFsrVqfFTRtq/+SDl7I9qUPpYFzd9dAFkRQpD/MpQ0lkbrnyT4ZGD5lVBr5En1ZGxcz/mOIM33BbwzJf7WD73+4eiM=
Received: from OSAPR01MB2740.jpnprd01.prod.outlook.com (2603:1096:603:3a::20)
 by OSBPR01MB2520.jpnprd01.prod.outlook.com (2603:1096:604:1f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 21 Oct
 2020 13:48:24 +0000
Received: from OSAPR01MB2740.jpnprd01.prod.outlook.com
 ([fe80::8c77:606f:d812:ecd2]) by OSAPR01MB2740.jpnprd01.prod.outlook.com
 ([fe80::8c77:606f:d812:ecd2%7]) with mapi id 15.20.3477.028; Wed, 21 Oct 2020
 13:48:24 +0000
From:   Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To:     Rob Herring <robh@kernel.org>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v4 2/5] media: dt-bindings: media: renesas,drif: Convert
 to json-schema
Thread-Topic: [PATCH v4 2/5] media: dt-bindings: media: renesas,drif: Convert
 to json-schema
Thread-Index: AQHWokK6vjssIp7eK0+ltfL7vKiiqamaZRkAgAe11VA=
Date:   Wed, 21 Oct 2020 13:48:24 +0000
Message-ID: <OSAPR01MB27409519A86983F157EF4800C21C0@OSAPR01MB2740.jpnprd01.prod.outlook.com>
References: <20201014155719.15120-1-fabrizio.castro.jz@renesas.com>
 <20201014155719.15120-3-fabrizio.castro.jz@renesas.com>
 <20201016155546.GB1474949@bogus>
In-Reply-To: <20201016155546.GB1474949@bogus>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 627ad64d-72e9-459c-7ecf-08d875c7fb2c
x-ms-traffictypediagnostic: OSBPR01MB2520:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB25203D79F4336265A60161C9C21C0@OSBPR01MB2520.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LRnsAQOFCs8lf2fb5bIOaFIZhTSEK1ZRzxJDwwx+031J+53WwTyxpxVuHet862Y7As5YiP6NyLGSXjl5aLg3qR4m1wdvbQbznBJpgM0u5tOXsxvyYDglbn/Uyo/+xO97fJNDjUTNoRT2Y9VhR8cSBCTfvgpR/3l/YcXTIov/8UtAd6uDrIRl/+ocJsBFM7WSUH+uflpuvVmSJCl5ViNVJdUG3P2U+hyS3Nc/N8QwJxZThgyD5h9uNFvWPiYZXnC+UK8Svt3Ck4FtPanBbgIvVtI0rpPFegL9+BS1c8Dbu7w4kZDvFZgNZW8Ix4/2d1BkJ9Wfi/IcyjiRRzz+oqU7c2TdJeeiJDfiJ1ZoyfrmMIZzUrnyH5WMNIXCfzugk12fB1tXIiN/xkZ7mbLMzjqcmQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2740.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(366004)(346002)(396003)(376002)(76116006)(966005)(186003)(9686003)(83380400001)(26005)(8676002)(7696005)(2906002)(33656002)(71200400001)(8936002)(6506007)(53546011)(66556008)(66946007)(64756008)(66476007)(54906003)(4326008)(316002)(6916009)(66446008)(478600001)(86362001)(5660300002)(55016002)(30864003)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: l6qFGaQX2PDVgMBc+HPXqJYEey8tI1z3k2bIfWG5iBsmxiePwpHFA/gB7nZIDQEOgM9Gxs+/AKtrQtqZA3XnnbDoSNT66ffXzYQlYNd77RqU9dK4PnoA1tAA1U6w5yyq8vjycj2Oo2GXVe/G6/Ntso2RxTzMoG3+oO+6DX+IV/G6rCbOZo3yb34YLoqhLHirY51bAjzUylitYPWzrBE4u4WofBAGhF2xMaqBgCZvVZEBHv1m4Xfd0Dy+7q4TPhEdoZT+4nYusN3EZqSHUt8vlITsMAzXu8iP43wTQrC+MpkNAh5GjrNj7bz4mHQfdM7mn478TGIKnOU4IdhDalDLXKOCuxotdNGDjc553ATM7piHsK29MrnWObJEfHrdnFVTiFV7dlYbwU/E/mS9SxVA+qZ5RqNVKvcigvnYU0ToS6ZbZ9PmH6vyh97APdHk8mVo2QYEueuIEAP0i/SP2m7XB7rIKtNhSrM2/CM6wIOUWSp+zMCepxEMRY5cKtmB+VsmSZmCnyN5EafiU6HxTLVgyJZddwSdjThgngo3aZtIyrcO2ueJcGPX9U18o+OrGUAL8W/scxGSMXe/VklF3HSndvGCadsXuga0s8Bno/ysD5gvoURWGmsVv9aB7mAC5ZFgIQWUqPZfZWT7UL6WMB1QDA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2740.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 627ad64d-72e9-459c-7ecf-08d875c7fb2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2020 13:48:24.1896
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i25w+iE9Ot7tRovUam5g3xvnxA5HDQ06ahzVXxHEw+eQuajCOYyKMulZhqERBPhU0Rk6CvLgJCMSAht04XJIcD8oIkc0PnZ/v2BOwehXuYA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2520
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

Thank you for your feedback.

> From: Rob Herring <robh@kernel.org>
> Sent: 16 October 2020 16:56
> Subject: Re: [PATCH v4 2/5] media: dt-bindings: media: renesas,drif: Conv=
ert to
> json-schema
>=20
> On Wed, Oct 14, 2020 at 04:57:16PM +0100, Fabrizio Castro wrote:
> > Convert the Renesas DRIF bindings to DT schema and update
> > MAINTAINERS accordingly.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v3->v4:
> > * Replace "if" statement with "else" statement for the branch
> >   rejecting pinctrl-0 and pinctrl-names properties, as suggested
> >   by Geert
> > v2->v3:
> > * Removed the definition of pinctrl-0 and pinctrl-names, as
> >   suggested by Geert
> > * Added "power-domains" to the list of required properties,
> >   as suggested by Geert
> > v1->v2:
> > * s/controller/Controller/ in the title of renesas,drif.yaml
> >   as suggested by Laurent.
> >
> >  .../bindings/media/renesas,drif.txt           | 177 -----------
> >  .../bindings/media/renesas,drif.yaml          | 277 ++++++++++++++++++
> >  MAINTAINERS                                   |   2 +-
> >  3 files changed, 278 insertions(+), 178 deletions(-)
> >  delete mode 100644
> Documentation/devicetree/bindings/media/renesas,drif.txt
> >  create mode 100644
> Documentation/devicetree/bindings/media/renesas,drif.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/media/renesas,drif.txt
> b/Documentation/devicetree/bindings/media/renesas,drif.txt
> > deleted file mode 100644
> > index 0d8974aa8b38..000000000000
> > --- a/Documentation/devicetree/bindings/media/renesas,drif.txt
> > +++ /dev/null
> > @@ -1,177 +0,0 @@
> > -Renesas R-Car Gen3 Digital Radio Interface controller (DRIF)
> > -------------------------------------------------------------
> > -
> > -R-Car Gen3 DRIF is a SPI like receive only slave device. A general
> > -representation of DRIF interfacing with a master device is shown below=
.
> > -
> > -+---------------------+                +---------------------+
> > -|                     |-----SCK------->|CLK                  |
> > -|       Master        |-----SS-------->|SYNC  DRIFn (slave)  |
> > -|                     |-----SD0------->|D0                   |
> > -|                     |-----SD1------->|D1                   |
> > -+---------------------+                +---------------------+
> > -
> > -As per datasheet, each DRIF channel (drifn) is made up of two internal
> > -channels (drifn0 & drifn1). These two internal channels share the comm=
on
> > -CLK & SYNC. Each internal channel has its own dedicated resources like
> > -irq, dma channels, address space & clock. This internal split is not
> > -visible to the external master device.
> > -
> > -The device tree model represents each internal channel as a separate n=
ode.
> > -The internal channels sharing the CLK & SYNC are tied together by thei=
r
> > -phandles using a property called "renesas,bonding". For the rest of
> > -the documentation, unless explicitly stated, the word channel implies =
an
> > -internal channel.
> > -
> > -When both internal channels are enabled they need to be managed togeth=
er
> > -as one (i.e.) they cannot operate alone as independent devices. Out of=
 the
> > -two, one of them needs to act as a primary device that accepts common
> > -properties of both the internal channels. This channel is identified b=
y a
> > -property called "renesas,primary-bond".
> > -
> > -To summarize,
> > -   - When both the internal channels that are bonded together are enab=
led,
> > -     the zeroth channel is selected as primary-bond. This channels acc=
epts
> > -     properties common to all the members of the bond.
> > -   - When only one of the bonded channels need to be enabled, the prop=
erty
> > -     "renesas,bonding" or "renesas,primary-bond" will have no effect. =
That
> > -     enabled channel can act alone as any other independent device.
> > -
> > -Required properties of an internal channel:
> > --------------------------------------------
> > -- compatible:	"renesas,r8a7795-drif" if DRIF controller is a part of R=
8A7795
> SoC.
> > -		"renesas,r8a7796-drif" if DRIF controller is a part of R8A7796
> SoC.
> > -		"renesas,rcar-gen3-drif" for a generic R-Car Gen3 compatible
> device.
> > -
> > -		When compatible with the generic version, nodes must list the
> > -		SoC-specific version corresponding to the platform first
> > -		followed by the generic version.
> > -
> > -- reg: offset and length of that channel.
> > -- interrupts: associated with that channel.
> > -- clocks: phandle and clock specifier of that channel.
> > -- clock-names: clock input name string: "fck".
> > -- dmas: phandles to the DMA channels.
> > -- dma-names: names of the DMA channel: "rx".
> > -- renesas,bonding: phandle to the other channel.
> > -
> > -Optional properties of an internal channel:
> > --------------------------------------------
> > -- power-domains: phandle to the respective power domain.
> > -
> > -Required properties of an internal channel when:
> > -	- It is the only enabled channel of the bond (or)
> > -	- If it acts as primary among enabled bonds
> > ---------------------------------------------------------
> > -- pinctrl-0: pin control group to be used for this channel.
> > -- pinctrl-names: must be "default".
> > -- renesas,primary-bond: empty property indicating the channel acts as
> primary
> > -			among the bonded channels.
> > -- port: child port node corresponding to the data input, in accordance=
 with
> > -	the video interface bindings defined in
> > -	Documentation/devicetree/bindings/media/video-interfaces.txt. The
> port
> > -	node must contain at least one endpoint.
> > -
> > -Optional endpoint property:
> > ----------------------------
> > -- sync-active: Indicates sync signal polarity, 0/1 for low/high respec=
tively.
> > -	       This property maps to SYNCAC bit in the hardware manual. The
> > -	       default is 1 (active high).
> > -
> > -Example:
> > ---------
> > -
> > -(1) Both internal channels enabled:
> > ------------------------------------
> > -
> > -When interfacing with a third party tuner device with two data pins as=
 shown
> > -below.
> > -
> > -+---------------------+                +---------------------+
> > -|                     |-----SCK------->|CLK                  |
> > -|       Master        |-----SS-------->|SYNC  DRIFn (slave)  |
> > -|                     |-----SD0------->|D0                   |
> > -|                     |-----SD1------->|D1                   |
> > -+---------------------+                +---------------------+
> > -
> > -	drif00: rif@e6f40000 {
> > -		compatible =3D "renesas,r8a7795-drif",
> > -			     "renesas,rcar-gen3-drif";
> > -		reg =3D <0 0xe6f40000 0 0x64>;
> > -		interrupts =3D <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> > -		clocks =3D <&cpg CPG_MOD 515>;
> > -		clock-names =3D "fck";
> > -		dmas =3D <&dmac1 0x20>, <&dmac2 0x20>;
> > -		dma-names =3D "rx", "rx";
> > -		power-domains =3D <&sysc R8A7795_PD_ALWAYS_ON>;
> > -		renesas,bonding =3D <&drif01>;
> > -		renesas,primary-bond;
> > -		pinctrl-0 =3D <&drif0_pins>;
> > -		pinctrl-names =3D "default";
> > -		port {
> > -			drif0_ep: endpoint {
> > -			     remote-endpoint =3D <&tuner_ep>;
> > -			};
> > -		};
> > -	};
> > -
> > -	drif01: rif@e6f50000 {
> > -		compatible =3D "renesas,r8a7795-drif",
> > -			     "renesas,rcar-gen3-drif";
> > -		reg =3D <0 0xe6f50000 0 0x64>;
> > -		interrupts =3D <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> > -		clocks =3D <&cpg CPG_MOD 514>;
> > -		clock-names =3D "fck";
> > -		dmas =3D <&dmac1 0x22>, <&dmac2 0x22>;
> > -		dma-names =3D "rx", "rx";
> > -		power-domains =3D <&sysc R8A7795_PD_ALWAYS_ON>;
> > -		renesas,bonding =3D <&drif00>;
> > -	};
> > -
> > -
> > -(2) Internal channel 1 alone is enabled:
> > -----------------------------------------
> > -
> > -When interfacing with a third party tuner device with one data pin as =
shown
> > -below.
> > -
> > -+---------------------+                +---------------------+
> > -|                     |-----SCK------->|CLK                  |
> > -|       Master        |-----SS-------->|SYNC  DRIFn (slave)  |
> > -|                     |                |D0 (unused)          |
> > -|                     |-----SD-------->|D1                   |
> > -+---------------------+                +---------------------+
> > -
> > -	drif00: rif@e6f40000 {
> > -		compatible =3D "renesas,r8a7795-drif",
> > -			     "renesas,rcar-gen3-drif";
> > -		reg =3D <0 0xe6f40000 0 0x64>;
> > -		interrupts =3D <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> > -		clocks =3D <&cpg CPG_MOD 515>;
> > -		clock-names =3D "fck";
> > -		dmas =3D <&dmac1 0x20>, <&dmac2 0x20>;
> > -		dma-names =3D "rx", "rx";
> > -		power-domains =3D <&sysc R8A7795_PD_ALWAYS_ON>;
> > -		renesas,bonding =3D <&drif01>;
> > -	};
> > -
> > -	drif01: rif@e6f50000 {
> > -		compatible =3D "renesas,r8a7795-drif",
> > -			     "renesas,rcar-gen3-drif";
> > -		reg =3D <0 0xe6f50000 0 0x64>;
> > -		interrupts =3D <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> > -		clocks =3D <&cpg CPG_MOD 514>;
> > -		clock-names =3D "fck";
> > -		dmas =3D <&dmac1 0x22>, <&dmac2 0x22>;
> > -		dma-names =3D "rx", "rx";
> > -		power-domains =3D <&sysc R8A7795_PD_ALWAYS_ON>;
> > -		renesas,bonding =3D <&drif00>;
> > -		pinctrl-0 =3D <&drif0_pins>;
> > -		pinctrl-names =3D "default";
> > -		port {
> > -			drif0_ep: endpoint {
> > -			     remote-endpoint =3D <&tuner_ep>;
> > -			     sync-active =3D <0>;
> > -			};
> > -		};
> > -	};
> > diff --git a/Documentation/devicetree/bindings/media/renesas,drif.yaml
> b/Documentation/devicetree/bindings/media/renesas,drif.yaml
> > new file mode 100644
> > index 000000000000..3832ce837553
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/renesas,drif.yaml
> > @@ -0,0 +1,277 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/renesas,drif.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas R-Car Gen3 Digital Radio Interface Controller (DRIF)
> > +
> > +maintainers:
> > +  - Ramesh Shanmugasundaram <rashanmu@gmail.com>
> > +  - Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > +
> > +description: |
> > +  R-Car Gen3 DRIF is a SPI like receive only slave device. A general
> > +  representation of DRIF interfacing with a master device is shown bel=
ow.
> > +
> > +  +---------------------+                +---------------------+
> > +  |                     |-----SCK------->|CLK                  |
> > +  |       Master        |-----SS-------->|SYNC  DRIFn (slave)  |
> > +  |                     |-----SD0------->|D0                   |
> > +  |                     |-----SD1------->|D1                   |
> > +  +---------------------+                +---------------------+
> > +
> > +  As per datasheet, each DRIF channel (drifn) is made up of two intern=
al
> > +  channels (drifn0 & drifn1). These two internal channels share the co=
mmon
> > +  CLK & SYNC. Each internal channel has its own dedicated resources li=
ke
> > +  irq, dma channels, address space & clock. This internal split is not
> > +  visible to the external master device.
> > +
> > +  The device tree model represents each internal channel as a separate=
 node.
> > +  The internal channels sharing the CLK & SYNC are tied together by th=
eir
> > +  phandles using a property called "renesas,bonding". For the rest of
> > +  the documentation, unless explicitly stated, the word channel implie=
s an
> > +  internal channel.
> > +
> > +  When both internal channels are enabled they need to be managed toge=
ther
> > +  as one (i.e.) they cannot operate alone as independent devices. Out =
of the
> > +  two, one of them needs to act as a primary device that accepts commo=
n
> > +  properties of both the internal channels. This channel is identified=
 by a
> > +  property called "renesas,primary-bond".
> > +
> > +  To summarize,
> > +     * When both the internal channels that are bonded together are en=
abled,
> > +       the zeroth channel is selected as primary-bond. This channels a=
ccepts
> > +       properties common to all the members of the bond.
> > +     * When only one of the bonded channels need to be enabled, the pr=
operty
> > +       "renesas,bonding" or "renesas,primary-bond" will have no effect=
. That
> > +       enabled channel can act alone as any other independent device.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +        - renesas,r8a7795-drif        # R-Car H3
> > +        - renesas,r8a7796-drif        # R-Car M3-W
>=20
> Note the bot error is from yamllint which just got added to the checks.
> Need 2 more spaces indent here.

Thank you for reporting this. Unfortunately I wasn't personally able to rep=
roduce this,
but thankfully a colleague of mine (Prabhakar) was able to reproduce the wa=
rning on
his setup. I'll send a v5 to fix this.

Thanks,
Fab

>=20
> With that,
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>
