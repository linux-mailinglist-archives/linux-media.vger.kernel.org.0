Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29F52467C57
	for <lists+linux-media@lfdr.de>; Fri,  3 Dec 2021 18:17:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353361AbhLCRVJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Dec 2021 12:21:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353356AbhLCRVJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Dec 2021 12:21:09 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5BB1C061751;
        Fri,  3 Dec 2021 09:17:44 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id d24so7285019wra.0;
        Fri, 03 Dec 2021 09:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:content-transfer-encoding:date:message-id:cc:subject
         :from:to:references:in-reply-to;
        bh=fO4r4gsjGVizfHzvjtVzf6PaITpDlhXOXaurJb9WRMM=;
        b=QAIuYEt4MVozw2zJpXy9n9s4yuKA3sYSKfEagHzSiKD+5t61CAYGIuICCIcSrmyerX
         H4cH/uVWZyfgsS3dyB2bpNM4jJbpvIUWvczzOAakbOXxJ4TremX/frK753gp/jer5vSx
         qsNYyLLz5khEAs/tasSjecL4Z2ycgaRHeZBCkVjhTdqEg+PeoDHTQwJGfL8jUxC7XZxF
         YWepGFV6VyLRRYGmND/7ZLowb5wecGti7FoyqcFGFeNfRDQLxtEqOapfrXeqUbKf7vNm
         zZMjgG9XFnxIbMNBsBnh5pVMFO50XGD8rfk/5LfMPfupFmX904m/me07YD0u0S6Pb/Pd
         GuOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:cc:subject:from:to:references:in-reply-to;
        bh=fO4r4gsjGVizfHzvjtVzf6PaITpDlhXOXaurJb9WRMM=;
        b=U/MXEJyc32rAbmmVpiTlqA3FwVMKYHiT9vqdx2KA5GHv2ZkLTgurqmT1b5hpx0FtYA
         PfLOAUq1b6HhUJAJBAEj2dFIct+L/F7iAen2tPdeNQav6ceAByi81yh/4VAGHS8fl9C5
         36VK7qDn9x/w/qzFQ4GrRC0R0P1iohu3pcOnjL+9V7GhaVZ9lFsKtzP7tTkvanKEtsTw
         JJ+G6Zulr7IRFvyrqAI7CzyyF+Y19Z6Up4E7zr0/mX2AbLY78VRGGXl3jF1/a1gVcHxE
         8oPVtO/C/+Cx2EUFhr6jy+vcijZzfXotVbWjxU/AevwjWFd9x33M3XDW/mVMKEi9xgpH
         EBHg==
X-Gm-Message-State: AOAM530FxLJxxfhkxXWyr2FjuYZCj1ey5grGpVIqJ7jhP1hweZcAEXIf
        qkX43zK+oogUWIM9J+MIPDN6K7SJaIp2GQ==
X-Google-Smtp-Source: ABdhPJwSlZ5YrUJqxTWiDOCJlgxNck9X5BnMZl+c+BWgq8iNfD/zikiOh4fWUGC0q5/M0T26tXlVBw==
X-Received: by 2002:adf:da41:: with SMTP id r1mr23344323wrl.443.1638551863245;
        Fri, 03 Dec 2021 09:17:43 -0800 (PST)
Received: from localhost (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id f18sm3162247wre.7.2021.12.03.09.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 09:17:42 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 03 Dec 2021 17:17:41 +0000
Message-Id: <CG5U5PGJPN7E.23M1PTULHYT82@arch-thunder>
Cc:     <devicetree@vger.kernel.org>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        "Shawn Guo" <shawnguo@kernel.org>,
        "Sascha Hauer" <s.hauer@pengutronix.de>,
        "Pengutronix Kernel Team" <kernel@pengutronix.de>,
        "Fabio Estevam" <festevam@gmail.com>,
        "NXP Linux Team" <linux-imx@nxp.com>,
        <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2] dt-bindings: media: nxp,imx7-mipi-csi2: Drop bad
 if/then schema
From:   "Rui Miguel Silva" <rmfrfs@gmail.com>
To:     "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        "Rob Herring" <robh@kernel.org>
References: <20211203164828.187642-1-robh@kernel.org>
 <YapPYZieGxxNr/da@pendragon.ideasonboard.com>
In-Reply-To: <YapPYZieGxxNr/da@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi both,
FWIW,
On Fri Dec 3, 2021 at 5:09 PM WET, Laurent Pinchart wrote:

> Hi Rob,
>
> Thank you for the patch.
>
> On Fri, Dec 03, 2021 at 10:48:28AM -0600, Rob Herring wrote:
> > The if/then schema for 'data-lanes' doesn't work as 'compatible' is at =
a
> > different level than 'data-lanes'. To make it work, the if/then schema
> > would have to be moved to the top level and then whole hierarchy of
> > nodes down to 'data-lanes' created. I don't think it is worth the
> > complexity to do that, so let's just drop it.
> >=20
> > The error in this schema is masked by a fixup in the tools causing the
> > 'allOf' to get overwritten. Removing the fixup as part of moving to
> > json-schema draft 2019-09 revealed the issue:
> >=20
> > Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.example.dt.y=
aml: mipi-csi@30750000: ports:port@0:endpoint:data-lanes:0: [1] is too shor=
t
> > 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetr=
ee/bindings/media/nxp,imx7-mipi-csi2.yaml
> > Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.example.dt.y=
aml: mipi-csi@32e30000: ports:port@0:endpoint:data-lanes:0: [1, 2, 3, 4] is=
 too long
> > 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetr=
ee/bindings/media/nxp,imx7-mipi-csi2.yaml
> >=20
> > The if condition was always true because 'compatible' did not exist in
> > 'endpoint' node and a non-existent property is true for json-schema.
> >=20
> > Fixes: 85b62ff2cb97 ("media: dt-bindings: media: nxp,imx7-mipi-csi2: Ad=
d i.MX8MM support")
> > Cc: Rui Miguel Silva <rmfrfs@gmail.com>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Cc: Shawn Guo <shawnguo@kernel.org>
> > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > Cc: Fabio Estevam <festevam@gmail.com>
> > Cc: NXP Linux Team <linux-imx@nxp.com>
> > Cc: linux-media@vger.kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>

Cheers,
     Rui
>
> > ---
> > v2:
> >  - Add note that imx7 only supports 2 lanes
> > ---
> >  .../bindings/media/nxp,imx7-mipi-csi2.yaml         | 14 ++------------
> >  1 file changed, 2 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2=
.yaml b/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> > index 877183cf4278..1ef849dc74d7 100644
> > --- a/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> > +++ b/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> > @@ -79,6 +79,8 @@ properties:
> > =20
> >              properties:
> >                data-lanes:
> > +                description:
> > +                  Note that 'fsl,imx7-mipi-csi2' only supports up to 2=
 data lines.
> >                  items:
> >                    minItems: 1
> >                    maxItems: 4
> > @@ -91,18 +93,6 @@ properties:
> >              required:
> >                - data-lanes
> > =20
> > -            allOf:
> > -              - if:
> > -                  properties:
> > -                    compatible:
> > -                      contains:
> > -                        const: fsl,imx7-mipi-csi2
> > -                then:
> > -                  properties:
> > -                    data-lanes:
> > -                      items:
> > -                        maxItems: 2
> > -
> >        port@1:
> >          $ref: /schemas/graph.yaml#/properties/port
> >          description:
>
> --=20
> Regards,
>
> Laurent Pinchart



