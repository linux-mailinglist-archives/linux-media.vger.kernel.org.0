Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60E4C505E8E
	for <lists+linux-media@lfdr.de>; Mon, 18 Apr 2022 21:34:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234951AbiDRThF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Apr 2022 15:37:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbiDRThE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Apr 2022 15:37:04 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2093.outbound.protection.outlook.com [40.107.113.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 288B660DC;
        Mon, 18 Apr 2022 12:34:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uo4IjAPzA0jI1XAiMxW0KnA6eT7/jj92nl11L5TmKkK9rlgwjj8fT1sorzRxwmGn+XNrQmHTHFkVQ4FCOQgAynSNjaZ4gIRaYz11zOJrK6bE/jneT8XoyOwv9Vw44TquPhwQfa9u8piakEQJpnjUZsVUxUIiUVOvsfcLjFwHhl9/o9MqQUkKH4yr4NAecEdeZb2D1+idvERcRMosZeXuiekXAMsszWKFC00iBZAJe1WtrvhGEQcU7m9TjOO1HrPAu7XINMhn4JPiQoGIrGXGePhIjnLWnVylPqIDfDq9nL8e/Z5UBaP5xV0hm+gNAAxEFInifeFJxGb2bcfN51uhkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZ22mIsqDZSZAmeWAjJ7tg8X08zQ1KX3CioyNVLy7kM=;
 b=ZDFNHauDl9qN8d4gywwXo8cy4hR5gxSqCRqAJQSyCmeigoLZ3TrJEj/Pj5HD12y6LRIXsS8Gb0unoQtvtSyyowU/jvomsQ/uKoyoBGjG+OhrkLYX42lMfcz6Co1ZcSzrIAQ7V56nCQ4AW7swgZCrn1KneOV7kkQEZAEwWXTCb4XLUsYi8rQxzEREHq4dOJMrp7FwZGtKu8eEI9hieOtlX+SLbqynUKeHSwyMJ9Rf28r15gjCYwZovKGrBVYEU2sDoIDUNgMe47sN5PGWjnSB1NeEuk736ezyYak2eCC45rcDFJZmed+vQBjFhhr3MH6ZCjX3nE/yZmKU8p1HXUh7xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZ22mIsqDZSZAmeWAjJ7tg8X08zQ1KX3CioyNVLy7kM=;
 b=BxpKzHHjpyna7jxBf+OFP5gdnUgV1zt1clHnmd+woY+hoAI2/z1npNUv2eaaN9bUQZlApwrBMD3YXtewvCM43rEZEF6YIDk05j+GWtWZVir2v2sqXySW3IcMLcntzBrCDLB9+qCIsob29TAuBuLDbOUncIczuTPW3azQImO55Xo=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB10402.jpnprd01.prod.outlook.com (2603:1096:400:253::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 19:34:20 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db%4]) with mapi id 15.20.5164.025; Mon, 18 Apr 2022
 19:34:19 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: RE: [PATCH v7 1/3] media: dt-bindings: media: renesas,vsp1: Document
 RZ/{G2L,V2L} VSPD bindings To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Thread-Topic: [PATCH v7 1/3] media: dt-bindings: media: renesas,vsp1: Document
 RZ/{G2L,V2L} VSPD bindings To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Thread-Index: AQHYUAubtCG5Dt2t90GJ+fB9Qxz61azwtekAgAVe/XA=
Date:   Mon, 18 Apr 2022 19:34:19 +0000
Message-ID: <OS0PR01MB5922A9C796546784737639B386F39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220414142605.26235-1-biju.das.jz@bp.renesas.com>
 <20220414142605.26235-2-biju.das.jz@bp.renesas.com>
 <Ylk6dp6TiuwbJqkn@pendragon.ideasonboard.com>
In-Reply-To: <Ylk6dp6TiuwbJqkn@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 612be0d8-f473-4dbc-a858-08da21726ed2
x-ms-traffictypediagnostic: TY3PR01MB10402:EE_
x-microsoft-antispam-prvs: <TY3PR01MB10402D2628C9CA21CEB7E330A86F39@TY3PR01MB10402.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9MRlf3wzq+gRGkwqw3rawllRnieg7RU21yIeKVIdcxx2CsisJf6xqGIAiihTKhiTW+GG+hPffzYf8QHqGjc4NyA6l3I9+ebgW/QL/7xcGThSCGSr7+PacGa8rrNsWdz1UBXy/3HR1iJKiPe+dVkQfobuMGD9knzzh6osKOh2pvFSkQlTmxLK7iAo4dyVUlihH+czZigmuKTkdGOWOojQX8XwYU7sIc1YXnQ5if5G5Hd9MCZ0zhAv57dzDBbS8DpksRtZXNSz9F8AE8j2BkkO1vCA6qj5jXemlx/hyIs9Iydm8oP6kmD8W1sph5pDJvdUHKiXPeiQG6O9xC0osh927P9uk+eiNm9VAMT5cYSa+6d7o8FinggrUcQasN6h3oc6IkLRvXFUQNwJpufrDf73zMSj4V87VEa2orOxGrGLzvpFtYNWr+HNDXW14gvazL8BOauwUkgEByc42xlTHgh6LFIyI7qMiA/5BvdmJ1JSHLTINaPiV4ouKYMMlxZa2+yw9gTKcFuHuzkrlfsw0oLGvYUo+YjGCyKMvPNNuPahpzqs0PBNsZDRuJYH+WUOUIGdrpEsVLgdOM3oFBj3F0Miuv3P3dxvB7u8CP2M5fxyqy7HG+fqxs5aPr/SCx+E2COxCZwxjJEweyGcig1vSjlLHNeZ7d1ZAuba2CVQCPd/G7c402D+kXVJdSbBXMBiJXAaR00CIuBrFvEMXejmrKXXnA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(9686003)(508600001)(6506007)(4326008)(66556008)(7696005)(26005)(122000001)(76116006)(5660300002)(52536014)(8936002)(2906002)(86362001)(54906003)(316002)(6916009)(55016003)(66446008)(8676002)(66946007)(64756008)(83380400001)(186003)(33656002)(71200400001)(38100700002)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ziN/KrPMiWMf+ncBZqP5p2KCu+LYKB78pePe8yHSvBzehisSO2xzt2iM2qF0?=
 =?us-ascii?Q?rRWEWHDZuvePYLB0IlqYb7IB9Ppch3S3W0Yl88Yf1+HYO3WfTGrzivu6gKus?=
 =?us-ascii?Q?ig1YyooCSOVhDu6bwc/Kc69/+pIb10qpxsctrirzJwDjX9VxQgFG1tlbokCS?=
 =?us-ascii?Q?qrEGFXs/Ibl1eAMjz8owP38BBOQ2qqsONtxq4k3H8VCX984R4CO0cK0/74vo?=
 =?us-ascii?Q?QEqLZE5gbvYtTpz5265U0oI9j9n9eBJsqrb1OfLJ5XObzYp03bPWM/fb8Jur?=
 =?us-ascii?Q?wHxAuzDIPCCFsaH8Mo90cdW92w9qdgQZOG8QPZAtoHqcieEnfUDHTEcIfihO?=
 =?us-ascii?Q?d3UGEMXY4fwYZ6rLcASIQDWMUVrbBeKKAOtelo5LvbrIo5y8kYTLzO3yrRIM?=
 =?us-ascii?Q?Xf0rzq5tAwKoiC5LVhRKGkzJXyJvMPNbAtu7KNMh1g1/dqj8NllUt8RT0GWl?=
 =?us-ascii?Q?SZyxOzhvC+tUp2Rr8WnYlH/opIDFdTBbJlcY8g1hPPnLH343YNdy1dfwitJS?=
 =?us-ascii?Q?wcCpwb7Diod+DCWI4tjOYT4PK52Ex32SC9zDxF/fn2Rz9kb6FuHHgm89pyas?=
 =?us-ascii?Q?enkR4ArezE0ay3JCHM/AUfd5VtjhbwbTN0yc/fbPCKttuUCIrwVwMxiIfM5l?=
 =?us-ascii?Q?gCPznzJ2NUVTKuBqcRnq3wjgdkFldK6g8k/XAmZ8CVMpZ4elLC9tegIbLszU?=
 =?us-ascii?Q?7SalZNEoQEuY3vncZfByxs3vZLnCaNbiKsPUGfU+lNMb2ZebTI+LzlqdL/Il?=
 =?us-ascii?Q?LHepvCnwBYXrnTJQWhrHnWUiLr6VvCfWF+Ja2S+TK+f8n3wGlnitE9DbawPs?=
 =?us-ascii?Q?DFKhs2iFcajiEAWg/XLTC7xdX28JEe6f2yf9rFygiEw/O75hEPSwrrO6/Nkz?=
 =?us-ascii?Q?gmsveNqbDTepPsRN3gVO17kur0Je3BOlfevVsGrYcWlXC+5Nb8Qm0YI+A5II?=
 =?us-ascii?Q?J7E3Y9WzhMduq/f1JLz3l3MjniNgEm64AYyF9uDznsrNMBYltbZjX8XDxNb1?=
 =?us-ascii?Q?QnhvvuGJLSS4zCiUxcVX78G/suaTTty/YC58CfNTjhCemP3MBqBqm1sefaNc?=
 =?us-ascii?Q?oqytKW6rYbaXlwoRZb513EQuyAeVhnmo8/C/BcY8UEraZ92G6rgzX/4Orjmp?=
 =?us-ascii?Q?nDuf0lM4rzf3KLtQousVr/qSxHSRWStN8pVkoxEsS2i/BHuALOzs/AkVv8QE?=
 =?us-ascii?Q?GUp3TMJTSAuvDHxHHfi243IqZcovySJ3GFmK8KLSxxx05aj95nZptUMx5of2?=
 =?us-ascii?Q?GdipBG6t5g5QXERlFcBnwQkjHIRY1lXoczzPHVU5oA3MwG+SntRCmm+V/WEB?=
 =?us-ascii?Q?jtqLNiFbjDwef0cn5FDwuJW8oPAiKlfZfheKMQFETmyRxvgLAd4rpJ8tQfJI?=
 =?us-ascii?Q?Z255U74iyNxnPjodk8tQi/JSjs++7Mc84vGcjPyS8bhuO5dr1zRvTJWMe1+h?=
 =?us-ascii?Q?Mc6SFtGn7l626cCoylQlKMnytlDfX7IPMHTtK4LPxbTF5/hyYiQyDraB+SAB?=
 =?us-ascii?Q?14s5lAMTPR9PEQA2XW943zcnD9GxZ8dZzkLtvVtRm+wxQfaqzIKPwgJ6TDUz?=
 =?us-ascii?Q?6pakOtUDwqUusHO3CbE/0xUiZ1oPWI3woeEFjk8pkKsNtkmQdDpZkuG2pPN2?=
 =?us-ascii?Q?A1vIT9K6DPn9oeGfNLeWcQjLL6J7aRukIO081dulN6EFY22jJE+N9kaDgGla?=
 =?us-ascii?Q?w1IhM99IMH55u+O1AowPVNweiHJOEAjyhIV1DuDsuePKT7P/rphB5b5mElxQ?=
 =?us-ascii?Q?YAcjvaNAhHHStSybgbqk05w5/gWTBdU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 612be0d8-f473-4dbc-a858-08da21726ed2
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2022 19:34:19.4540
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tp/WHq7oMMhVgd8yk/S6CLpRfb4iqoaEqoA2ATV8UBW+I5iNJWKmVKTSXmyf2vdPURr4MlS1Ue0tnMW2oxxYAwi0VNrUPKw+rBncscHZTtw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10402
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for the feedback.

> Subject: Re: [PATCH v7 1/3] media: dt-bindings: media: renesas,vsp1:
> Document RZ/{G2L,V2L} VSPD bindings=20
>=20
> Hi Biju,
>=20
> Thank you for the patch.
>=20
> On Thu, Apr 14, 2022 at 03:26:03PM +0100, Biju Das wrote:
> > Document VSPD found in RZ/G2L and RZ/V2L family SoC's. VSPD block is
> > similar to VSP2-D found on R-Car SoC's, but it does not have a version
> > register and it has 3 clocks compared to 1 clock on vsp1 and vsp2.
> >
> > This patch introduces a new compatible 'renesas,rzg2l-vsp2' to handle
> > these differences.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> > ---
> > v6->v7:
> >  * No change
> > v5->v6:
> >  * Removed LCDC reference clock description
> >  * Changed the clock name from du.0->aclk
> > v4->v5:
> >  * No change
> > v3->v4:
> >  * No change
> > v2->v3:
> >  * Added Rb tag from Krzysztof.
> > v1->v2:
> >  * Changed compatible from vsp2-rzg2l->rzg2l-vsp2
> > RFC->v1:
> >  * Updated commit description
> >  * Changed compatible from vsp2-r9a07g044->vsp2-rzg2l
> >  * Defined the clocks
> >  * Clock max Items is based on SoC Compatible string
> > RFC:
> >  *
>=20
> > ---
> >  .../bindings/media/renesas,vsp1.yaml          | 52 ++++++++++++++-----
> >  1 file changed, 39 insertions(+), 13 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> > b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> > index 990e9c1dbc43..a236b266fa4b 100644
> > --- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> > +++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> > @@ -19,6 +19,7 @@ properties:
> >      enum:
> >        - renesas,vsp1 # R-Car Gen2 and RZ/G1
> >        - renesas,vsp2 # R-Car Gen3 and RZ/G2
> > +      - renesas,rzg2l-vsp2 # RZ/G2L and RZ/V2L
> >
> >    reg:
> >      maxItems: 1
> > @@ -26,8 +27,8 @@ properties:
> >    interrupts:
> >      maxItems: 1
> >
> > -  clocks:
> > -    maxItems: 1
> > +  clocks: true
> > +  clock-names: true
>=20
> clock-names shouldn't be true here, as it should only be set on rzg2l-vsp=
2.
> I think you can actually drop both clocks and clock-names here.

If I drop clocks, then I get below dt_binding_check error

biju@biju-VirtualBox:~/rzg2l-linux$ make ARCH=3Darm64 DT_CHECKER_FLAGS=3D-m=
 DT_SCHEMA_FILES=3DDocumentation/devicetree/bindings/media/renesas,vsp1.yam=
l CROSS_COMPILE=3D~/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/bin/=
aarch64-none-linux-gnu- dt_binding_check -j8
  LINT    Documentation/devicetree/bindings
  DTEX    Documentation/devicetree/bindings/media/renesas,vsp1.example.dts
  CHKDT   Documentation/devicetree/bindings/processed-schema.json
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
  DTC     Documentation/devicetree/bindings/media/renesas,vsp1.example.dtb
  CHECK   Documentation/devicetree/bindings/media/renesas,vsp1.example.dtb
/home/biju/rzg2l-linux/Documentation/devicetree/bindings/media/renesas,vsp1=
.example.dtb: vsp@fe928000: 'clocks' does not match any of the regexes: 'pi=
nctrl-[0-9]+'
	From schema: /home/biju/rzg2l-linux/Documentation/devicetree/bindings/medi=
a/renesas,vsp1.yaml
/home/biju/rzg2l-linux/Documentation/devicetree/bindings/media/renesas,vsp1=
.example.dtb: vsp@fe920000: 'clocks' does not match any of the regexes: 'pi=
nctrl-[0-9]+'
	From schema: /home/biju/rzg2l-linux/Documentation/devicetree/bindings/medi=
a/renesas,vsp1.yaml

If I drop clock-names, I get dtbs-check error for RZ/G2{L,LC},

make ARCH=3Darm64 DT_SCHEMA_FILES=3DDocumentation/devicetree/bindings/media=
/renesas,vsp1.yaml CROSS_COMPILE=3D~/gcc-arm-10.3-2021.07-x86_64-aarch64-no=
ne-linux-gnu/bin/aarch64-none-linux-gnu- dtbs_check -j8

/home/biju/rzg2l-linux/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: v=
sp@10870000: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9=
]+'
	From schema: /home/biju/rzg2l-linux/Documentation/devicetree/bindings/medi=
a/renesas,vsp1.yaml
/home/biju/rzg2l-linux/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: v=
sp@10870000: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9=
]+'
	From schema: /home/biju/rzg2l-linux/Documentation/devicetree/bindings/medi=
a/renesas,vsp1.yaml

So looks like both are required.

Please correct me, If I am missing anything here.

Cheers,
Biju

>=20
> With this addressed,
>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>=20
> >
> >    power-domains:
> >      maxItems: 1
> > @@ -50,17 +51,42 @@ required:
> >
> >  additionalProperties: false
> >
> > -if:
> > -  properties:
> > -    compatible:
> > -      items:
> > -        - const: renesas,vsp1
> > -then:
> > -  properties:
> > -    renesas,fcp: false
> > -else:
> > -  required:
> > -    - renesas,fcp
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: renesas,vsp1
> > +    then:
> > +      properties:
> > +        renesas,fcp: false
> > +    else:
> > +      required:
> > +        - renesas,fcp
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: renesas,rzg2l-vsp2
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: Main clock
> > +            - description: Register access clock
> > +            - description: Video clock
> > +        clock-names:
> > +          items:
> > +            - const: aclk
> > +            - const: pclk
> > +            - const: vclk
> > +      required:
> > +        - clock-names
> > +    else:
> > +      properties:
> > +        clocks:
> > +          maxItems: 1
> >
> >  examples:
> >    # R8A7790 (R-Car H2) VSP1-S
>=20
> --
> Regards,
>=20
> Laurent Pinchart
