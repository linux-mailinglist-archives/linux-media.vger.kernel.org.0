Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E31A508C30
	for <lists+linux-media@lfdr.de>; Wed, 20 Apr 2022 17:33:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380247AbiDTPfp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Apr 2022 11:35:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234264AbiDTPfo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Apr 2022 11:35:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88B383EBB4;
        Wed, 20 Apr 2022 08:32:57 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E95F25B;
        Wed, 20 Apr 2022 17:32:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650468774;
        bh=jlpngKO/FI3bADlKQVTGDZ8LcMNXa7Y656X0iNkw2O8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=FK4Nvn1+u6TCKmSvdTRwKoT2vxn+7YZUdx51yNKSN0HeLtZtJQdzKPNB6QmsmOcKu
         8Q5WOqIvjEjTLnQrhp9JCNqvBG/bnHkcQ0lMV7oG1/Gsg6XnzGo5UaXlSPGPg9XUjA
         of06fEEOe7juqdNNTTjrLMEHX9VvWmqQoO8MIuEs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <OS0PR01MB592245415D71BF56713201C886F59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220419181757.63346-1-biju.das.jz@bp.renesas.com> <20220419181757.63346-2-biju.das.jz@bp.renesas.com> <CAMuHMdXAgJf89ZS_SnF0UMU9tUhROqDxP5N_mAeNj9N6oQBAUw@mail.gmail.com> <OS0PR01MB592245415D71BF56713201C886F59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Subject: RE: [PATCH v8 1/5] media: dt-bindings: media: renesas,vsp1: Document RZ/G2L VSPD bindings
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>, open list:
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, ;
Illegal-Object: Syntax error in Cc: address found on vger.kernel.org:
        Cc:     ;
                        ^-missing semicolon to end mail group, extraneous tokens in mailbox, missing end of mailbox
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 20 Apr 2022 16:32:51 +0100
Message-ID: <165046877192.2845844.13545707310221592534@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Biju Das (2022-04-20 11:52:17)
> Hi Geert,
>=20
> Thanks for the feedback.
>=20
> > Subject: Re: [PATCH v8 1/5] media: dt-bindings: media: renesas,vsp1:
> > Document RZ/G2L VSPD bindings
> >=20
> > Hi Biju,
> >=20
> > On Tue, Apr 19, 2022 at 8:18 PM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > Document VSPD found in RZ/G2L SoC. VSPD block is similar to VSP2-D
> > > found on R-Car SoC's, but it does not have a version register and it
> > > has 3 clocks compared to 1 clock on vsp1 and vsp2.
> > >
> > > This patch introduces a new compatible 'renesas,r9a07g044-vsp2' to
> > > handle these differences.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > > v7->v8:
> >=20
> > Thanks for the update!
> >=20
> > >  * Added Clock-names to false for Non RZ/G2L SoC's
> > >  * Replaced compatble 'renesas,rzg2l-vsp2'->'renesas,r9a07g044-vsp2'
> >=20
> > Don't you want to keep "renesas,rzg2l-vsp2" as a fallback...
>=20
> As we have .soc field in info structure. I am Planning to add separate SW=
 SoC version for RZ/V2L, as 0x81.
>=20
> Model version for RZ/G2L alike SoC's will be same, but SoC version will b=
e different for RZ/G2L, RZ/V2L and RZ/G2UL.
>=20
> >=20
> > > --- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> > > +++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> > > @@ -17,6 +17,7 @@ description:
> > >  properties:
> > >    compatible:
> > >      enum:
> > > +      - renesas,r9a07g044-vsp2 # RZ/G2L
> > >        - renesas,vsp1 # R-Car Gen2 and RZ/G1
> > >        - renesas,vsp2 # R-Car Gen3 and RZ/G2
> > >
> >=20
> > > @@ -50,17 +51,43 @@ required:
> > >
> > >  additionalProperties: false
> > >
> > > -if:
> > > -  properties:
> > > -    compatible:
> > > -      items:
> > > -        - const: renesas,vsp1
> > > -then:
> > > -  properties:
> > > -    renesas,fcp: false
> > > -else:
> > > -  required:
> > > -    - renesas,fcp
> > > +allOf:
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: renesas,vsp1
> > > +    then:
> > > +      properties:
> > > +        renesas,fcp: false
> > > +    else:
> > > +      required:
> > > +        - renesas,fcp
> > > +
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: renesas,r9a07g044-vsp2
> >=20
> > ... so you can check for  "renesas,rzg2l-vsp2" here (and in the driver),
> > and don't have to update this check (and the driver) when adding support
> > for RZ/V2L later?
>=20
> As we introduced .soc field in device_info and plan to add separate S/W S=
oC version for V2L,
> fallback is not relevant anymore.
>=20
> Kieran/Geert/Laurent, Please correct me, if my understanding is wrong?

I think so, With a version register we can detect at runtime what
hardware we're on - and thus the generic comaptible match is
appropriate. But on these targets - if we can't detect the hardware I
think there's no generic option and it needs to be explicit in the DT.

--
Kieran

> Regards,
> Biju
>
