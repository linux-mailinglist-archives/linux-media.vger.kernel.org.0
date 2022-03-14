Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A43B4D7DBF
	for <lists+linux-media@lfdr.de>; Mon, 14 Mar 2022 09:44:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237162AbiCNIph (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Mar 2022 04:45:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231392AbiCNIpg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Mar 2022 04:45:36 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2132.outbound.protection.outlook.com [40.107.114.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6A8C39810;
        Mon, 14 Mar 2022 01:44:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QlsbvYoNHBwONIoNcVH/XOmvwi2zN2UN5+Jc1dknImc5fo+dEc0mezMSqex3492xf0EFEjzF9SkvhbQ0U9TpGeDSljew18xJR+e9i8duaV8ZKAzemXM7ObdFopbjcpbgT63VA8GIwhgcXk1owIgHIul70SDeH/HKCCp8uCHc6OrnevooEcJrEhiv+6DlgJQgoZwOke6jpolBhI4Z/8di375rK2jl37fzW/JHJzU6+JmY7C8iYdTzM1j4arANsD554wRcClnLAwQP6BYm0MdFnv8AtXSQkuJETwCea/1R3c5EtDBDh04lWENdvB3czrIua7hOv5quWVN28tAAPifSpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oZnaNXYc142wlHAiTcZu3P0CG3V3Y2RHSyJe5GEFAp8=;
 b=Z1aygPCte1IIb293rcbewrOU4x6d1F7pQD8eEYdqBRDvQQAZRmUM78SSe2GxGbIqGyYP1MJaDSkyVHSpVOezGkIG6WWKPunzhJHWSVRigtCfx1DNshuYUBiOrtQ6V8HDE3mbcugptXZhZpV1FIGqZhj3XDye5ihyAmu2WuqJ1scDxIjHtguA/wzt1iz54qkRfSkzMnov+fP0HGr06qaacuo4cXQQxb/Uqt2eMSJkZ7jgK6y6OxQEsNin6npmRtZK/WhevpwKC306Q/FY3HxBO3uzyA6vIt0iCQSbQGtt8cimho6E3sBqM1kd7zkjG3SHhrjs1jIhzhtdc1Sy2EeQRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZnaNXYc142wlHAiTcZu3P0CG3V3Y2RHSyJe5GEFAp8=;
 b=HHfkojLwwmME9AkZZ/8fNx2tVic7o0i4UrCRQ9NiElDR2m7CpIZ3JLtkVi1KX+5Gg/1nIVuMM0HYZ0Bwj9HjcIXjoQOti+p0ujJkjC9G+Zb3U6mB8fq4lM3UCgZNcqIFkVyudXpNF08PdJjNaQDOHx9/4jPDgfNpuleOPoHvKjU=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB4038.jpnprd01.prod.outlook.com (2603:1096:604:40::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Mon, 14 Mar
 2022 08:44:24 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::cc77:910b:66c1:524b]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::cc77:910b:66c1:524b%5]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 08:44:24 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v5 1/3] media: dt-bindings: media: renesas,vsp1: Document
 RZ/{G2L,V2L} VSPD bindings
Thread-Topic: [PATCH v5 1/3] media: dt-bindings: media: renesas,vsp1: Document
 RZ/{G2L,V2L} VSPD bindings
Thread-Index: AQHYNe0T57itYmyO506UcYfwSM1OkKy9XuYAgAEuykA=
Date:   Mon, 14 Mar 2022 08:44:23 +0000
Message-ID: <OS0PR01MB592293BC9493DC1DAD1DA0C0860F9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220312084205.31462-1-biju.das.jz@bp.renesas.com>
 <20220312084205.31462-2-biju.das.jz@bp.renesas.com>
 <Yi39fGVE0f9LgN/1@pendragon.ideasonboard.com>
In-Reply-To: <Yi39fGVE0f9LgN/1@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a91d9a5e-957a-440a-5e50-08da0596d742
x-ms-traffictypediagnostic: OSBPR01MB4038:EE_
x-microsoft-antispam-prvs: <OSBPR01MB4038797FF907E2A621CCA123860F9@OSBPR01MB4038.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xNVBvVnZpM80rM3TZpI07VN28kFjYRdsOXyPY99dXaq8O4jgRmAsSqyVthDZ4ftcKuHjZkRFTOT+i//VLeDakFXHmM+JizQdQKefVcFBxQK855dNPlDyLGuPu9HqI3/NaPqOhwCsUEpaHq95r68wrrMtyV483rFL8mIlB54onItLWW6NLX9241j4xaiEAGYbx01q9k/b63Yu4djMsnpLW7MYJMojwH2aUuzMEtaEJBi4NziGNVdKS0ixLHQPwumhGlcEuhiaK7jiz1LLk8QD9RH9d6fWbOgXceE15JPQRMv+FJ5EthlcRUmSFg6qfc0Avc3lM/kCtnRAmAEWb0X2G9X07tODNPwN8RqzxFXTLIuCRHV40jU1T+Ux1e+bQdbEQk2RbCnTWe5Nuf7PjqinzuBLgDcBA5DyTguJ7tuGcJ3wL6cyE06pf+KPKGFByPjFthnnAf5sJxf3QDMVeRqaeD1qiz0qAIM4mT5VaHX89ggxjivt8uuhgQnFTFJaiBJWJiYXMGaJ72sRTSouNloP6bEhLBU2SkmdL/PzlJEGWJp0JArVFPO5GJWFEGQxgLkAOy1OkhvpbciELfeIjiIpIp5NL9Xjohgb2h7AgGuzvXErt+J3AgbPx2GibeV0LvHcSAHc5EqYRlESfpGDrQrWbNN4piIbz7thPLD/ZknvnFuAplXWVkgVKdkU8vN9IMxGwqkAdjBikYNaDfzfCZLuMA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(107886003)(2906002)(38070700005)(55016003)(5660300002)(52536014)(83380400001)(26005)(122000001)(186003)(38100700002)(86362001)(33656002)(54906003)(4326008)(9686003)(6506007)(7696005)(71200400001)(66946007)(508600001)(64756008)(66446008)(66476007)(8676002)(66556008)(316002)(6916009)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-7?Q?D6aqf5dGZLxgjwCRgticQpq5ffAMJtzJ1njiNKS5I9tal+q+EGBFn3ba9q?=
 =?iso-8859-7?Q?EHUKs2PJOuoEAY94cFlSm2+b2mPWBXd2C2IVak+Xqx6+ipRsAGhzr3Hs6f?=
 =?iso-8859-7?Q?/wiVTwjTxGei2TRyKWGco3gv2TiiitGinz1C5fl/qhryKU1iKbd9yzfR66?=
 =?iso-8859-7?Q?QfscFA2WJf2vpFyJK4daow63YtprZLoLMKFf6kW/CMKlBe6VJMyfmNjFa8?=
 =?iso-8859-7?Q?9aEZqgo/xMdW2OsXko55zMlKumyntukegcvnuec+NQR4wCYmesIxy64Fbv?=
 =?iso-8859-7?Q?bWVHi5ofJ6yp30ngZ13MhkuAAcuHqmgiy/idFYd8DCA7hwYFk2iClT3Qnd?=
 =?iso-8859-7?Q?R+jr3h8/7FHSNCCmwjGF1sVNgn1BAybkiI/8M2iEuuh3e+DR0uoa0iouis?=
 =?iso-8859-7?Q?Oe5wzoZ7KnZVEZCYzXFM//eUHXA+oUtqHaVYqg9Rxq5rlL1d8qYNwfQJ/l?=
 =?iso-8859-7?Q?f4cYRndL8e/7V3xNrcyolA1kbLE1fyc+xAGQZbd7B42Mr62sL6ukzFbFIn?=
 =?iso-8859-7?Q?fCSLQ9f7Z0NEK86qTeh0FsfTfD1SKZLuJ/nklFDritWJcsxLZdSo0jUz00?=
 =?iso-8859-7?Q?ZOezbpXq+RSBCn/DFtlFjBHIUk25s2BRR9d3Tqybgiw7cJ7kMTqi5ApucC?=
 =?iso-8859-7?Q?8JIVo+khVxHqxvbU8u5yGGnvBScjfzxSVVwmRyo2WaPQfnFKBiVTP0v17n?=
 =?iso-8859-7?Q?exNV4QCJg77bjPpQRPwHNN7LVbOdT1PLVQvq6Y1idSKS/l7feF9ttcB6LM?=
 =?iso-8859-7?Q?fzvSndgQfycrcX4LRoQ78o1og89Bq31zGEgMnMF+7K4iMUxZB2qlHAGeXd?=
 =?iso-8859-7?Q?L12Q1mvmN+N4ArH3uoNlVRlmJx29xruIMwxx1naKTned+0l5cd5MWiBs04?=
 =?iso-8859-7?Q?HN6eIY6C9714BSL/gSG3hJAOSZFrmYUapZkDp4tuwtgIXbRRr6mYoDTn69?=
 =?iso-8859-7?Q?FBA9AH9JsnJ0tbui+orXsPEiMsZcAxfH49FCivNNxWIkl8xWjhJizNrwij?=
 =?iso-8859-7?Q?yU77FY5cM5FGgNEod5AQzCG+JZ/ld2hmKuC0uA11gNzI1vcDM11rJbNzyK?=
 =?iso-8859-7?Q?ApyfBKtdqHNsRCByeWHz3ZhTj94NA+DSMtEYPZlvfQsKaRew1wqKneNKKQ?=
 =?iso-8859-7?Q?nBa788F6bxtYWKKrFwKlsq2eNgg21R+MUvWoIqlYNmNTiDxmyLIwWghjXQ?=
 =?iso-8859-7?Q?S71/Gc2bLArH1POZshCwuVMqzBIpj3bijpqG/Jwvqk6qlmis0Niq7wTas7?=
 =?iso-8859-7?Q?dMEY2peNqiCLrE4f2DbCsmRrbQgfUBhMG6tPH0FSwZooCVUO7SAb49hEYN?=
 =?iso-8859-7?Q?T9nXoj2sAFUBE6nJaLrXwD6PcrxjxvFFWxWCq2BcSWaOnWiwvX2lYe1bUG?=
 =?iso-8859-7?Q?mcLpT/paBoD3wAm4aNdlmcAFQmUcCYUySaJ6aZazG9Bei668FJ9DR6oGSD?=
 =?iso-8859-7?Q?rJyin5lsRSsrKcZuivzzc8SOX0MNabX/80riTi+7PGIiO7a4kskuYq5hGp?=
 =?iso-8859-7?Q?kv2SxENWtSkYSxECpJ0ksUQzllKS7U/j9iAWym20kB0A=3D=3D?=
Content-Type: text/plain; charset="iso-8859-7"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a91d9a5e-957a-440a-5e50-08da0596d742
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2022 08:44:24.0249
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MEE+PnKrOwPXZ6t9CJOOVsAwgOFUKftB+dTFYL1SATPdRtvwbRgAPgpbmY8I+3pE64bE8M5mOMY0dLDj6C+6IGGD591PK+dVlJdxB/BG0nY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4038
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

> Subject: Re: [PATCH v5 1/3] media: dt-bindings: media: renesas,vsp1:
> Document RZ/{G2L,V2L} VSPD bindings
>=20
> Hi Biju,
>=20
> Thank you for the patch.
>=20
> On Sat, Mar 12, 2022 at 08:42:03AM +0000, Biju Das wrote:
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
> > ---
> >  .../bindings/media/renesas,vsp1.yaml          | 52 ++++++++++++++-----
> >  1 file changed, 39 insertions(+), 13 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> > b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> > index 990e9c1dbc43..2696a4582251 100644
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
> > +            - description: LCDC Main clock
> > +            - description: LCDC Register Access Clock
> > +            - description: LCDC Video Clock
>=20
> Shouldn't we avoid referring to LCDC in the VSP bindings ?

OK will drop prefix LCDC.

>=20
> > +        clock-names:
> > +          items:
> > +            - const: du.0
>=20
> Similarly, I'm not sure this is a good name from the point of view of the
> VSP.

OK, will use the name 'aclk', which is Main clock for this module which is
shared with LCDC. 'du.0' is not valid any more here as we are using differe=
nt
CRTC implementation for RZ/G2LC.

>=20
> > +            - const: pclk
> > +            - const: vclk
>=20
> I couldn't find those names in the documentation, where do they come from

HW manual (page 312) mentions about LCDC_CLK_A, LCDC_CLK_P & LCDC_CLK_D.

Detailed description is mentioned in Clock list document. Please see below.

	LCDC_CLK_A	M0=F6	PLL3	200	200		LCDC  Main clock
	LCDC_CLK_P	ZT=F6	PLL3	100	100		LCDC Register Access Clock=09
	LCDC_CLK_D	M3=F6	SEL_PLL5_4	148.5~5.803	LCDC Video Clock=09

> ? Could you maybe share a DT integration example ?

Please see below,

+		fcpvd0: fcp@10880000 {
+			compatible =3D "renesas,fcpv";
+			reg =3D <0 0x10880000 0 0x10000>;
+			clocks =3D <&cpg CPG_MOD R9A07G044_LCDC_CLK_A>,
+				 <&cpg CPG_MOD R9A07G044_LCDC_CLK_P>,
+				 <&cpg CPG_MOD R9A07G044_LCDC_CLK_D>;
+			power-domains =3D <&cpg>;
+			resets =3D <&cpg R9A07G044_LCDC_RESET_N>;
+		};

+		vspd0: vsp@10870000 {
+			compatible =3D "renesas,rzg2l-vsp2";
+			reg =3D <0 0x10870000 0 0x10000>;
+			interrupts =3D <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&cpg CPG_MOD R9A07G044_LCDC_CLK_A>,
+				 <&cpg CPG_MOD R9A07G044_LCDC_CLK_P>,
+				 <&cpg CPG_MOD R9A07G044_LCDC_CLK_D>;
+			clock-names =3D "du.0", "pclk", "vclk";
+			power-domains =3D <&cpg>;
+			resets =3D <&cpg R9A07G044_LCDC_RESET_N>;
+			renesas,fcp =3D <&fcpvd0>;
+		};

+		du: display@0x10890000 {
+			compatible =3D "renesas,du-r9a07g044l";
+			reg =3D <0 0x10890000 0 0x10000>;
+			interrupts =3D <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&cpg CPG_MOD R9A07G044_LCDC_CLK_A>,
+				 <&cpg CPG_MOD R9A07G044_LCDC_CLK_P>,
+				 <&cpg CPG_MOD R9A07G044_LCDC_CLK_D>;
+			clock-names =3D "du.0", "pclk", "vclk";
+			power-domains =3D <&cpg>;
+			resets =3D <&cpg R9A07G044_LCDC_RESET_N>;
+			reset-names =3D "du.0";
+			renesas,vsps =3D <&vspd0 0>;
+
+			status =3D "disabled";
+
+			ports {
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+
+				port@0 {
+					reg =3D <0>;
+					du_out_rgb: endpoint {
+					};
+				};
+
+				port@1 {
+					reg =3D <1>;
+					du_out_dsi0: endpoint {
+					};
+				};
+			};
+		};

+		dsi0: dsi@10860000 {
+			compatible =3D "renesas,r9a07g044-mipi-dsi";
+			reg =3D	<0 0x10860000 0 0x10000>, /* LINK */
+				<0 0x10850000 0 0x10000>; /* DPHY */
+
+			clocks =3D <&cpg CPG_MOD R9A07G044_MIPI_DSI_PLLCLK>,
+				 <&cpg CPG_MOD R9A07G044_MIPI_DSI_SYSCLK>,
+				 <&cpg CPG_MOD R9A07G044_MIPI_DSI_ACLK>,
+				 <&cpg CPG_MOD R9A07G044_MIPI_DSI_PCLK>,
+				 <&cpg CPG_MOD R9A07G044_MIPI_DSI_VCLK>,
+				 <&cpg CPG_MOD R9A07G044_MIPI_DSI_LPCLK>;
+			clock-names =3D "pllclk", "sysclk", "aclk", "pclk", "vclk", "lpclk";
+			power-domains =3D <&cpg>;
+			resets =3D <&cpg R9A07G044_MIPI_DSI_CMN_RSTB>,
+				 <&cpg R9A07G044_MIPI_DSI_ARESET_N>,
+				 <&cpg R9A07G044_MIPI_DSI_PRESET_N>;
+			reset-names =3D "rst", "arst", "prst";
+			status =3D "disabled";
+
+			ports {
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+
+				port@0 {
+					reg =3D <0>;
+					dsi0_in: endpoint {
+						remote-endpoint =3D <&dsi0_in>;
+					};
+				};
+
+				port@1 {
+					reg =3D <1>;
+					dsi0_out: endpoint {
+						remote-endpoint =3D <&du_out_dsi0>;
+					};
+				};
+			};
+		};

+	hdmi-out {
+		compatible =3D "hdmi-connector";
+		type =3D "d";
+
+		port {
+			hdmi_con_out: endpoint {
+				remote-endpoint =3D <&adv7535_out>;
+			};
+		};
+	};

+&dsi0 {
+	status =3D "okay";
+
+	ports {
+		port@1 {
+			dsi0_out: endpoint {
+				data-lanes =3D <1 2 3 4>;
+				remote-endpoint =3D <&adv7535_in>;
+			};
+		};
+	};
+};

+&du {
+	status =3D "okay";
+};

+&i2c1 {
+	pinctrl-0 =3D <&i2c1_pins>;
+	pinctrl-names =3D "default";
+
+	status =3D "okay";
+
+	adv7535: hdmi@3d {
+		compatible =3D "adi,adv7535";
+		reg =3D <0x3d>;
+
+		avdd-supply =3D <&reg_1p8v>;
+		dvdd-supply =3D <&reg_1p8v>;
+		pvdd-supply =3D <&reg_1p8v>;
+		a2vdd-supply =3D <&reg_1p8v>;
+		v3p3-supply =3D <&reg_3p3v>;
+		v1p2-supply =3D <&reg_1p8v>;
+
+		adi,dsi-lanes =3D <4>;
+		adi,disable-lanes-override;
+
+		ports {
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+
+			port@0 {
+				reg =3D <0>;
+				adv7535_in: endpoint {
+					remote-endpoint =3D <&dsi0_out>;
+				};
+			};
+
+			port@1 {
+				reg =3D <1>;
+				adv7535_out: endpoint {
+					remote-endpoint =3D <&hdmi_con_out>;
+				};
+			};
+		};
+	};

Cheers,
Biju

>=20
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
