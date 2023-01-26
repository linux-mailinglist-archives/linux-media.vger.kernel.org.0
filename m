Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFB8567D495
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 19:47:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231621AbjAZSrp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 13:47:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbjAZSrp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 13:47:45 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 082C33C11;
        Thu, 26 Jan 2023 10:47:43 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id 7so1693406pga.1;
        Thu, 26 Jan 2023 10:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/sYNXgIceCk3p6tYWEDeSR7UlzMzyVQx3QPxbApKokA=;
        b=AHZu8Ckc2ufLvj7Ocu9KgpHcNeap19k0hx5RUV/h3oC/6bY1U4SA793D1HXzjJL3Je
         1OpaGJ8Npgda4U5m/v7vzslkAQBoYzU3gEw6BBx3mkOJn6qEMedxlU9uSlusdWPguEZ9
         6feNUNtaPDvMDfBQEEzreWSVc19lEotTLDaiF6lHoefbRvYywCoMYoqlkPrcaayT+r+/
         eIUWdgqmsa/qZpD9oOhnZ+fNKSjwOBVt7Z1oaTuQfOsEk6jL77uDHHBBrs0NQtiEDaQZ
         oNUzWUOn2RKdL35xABSgIYxfjdwK2co+RRaGiGZKKKrstqyITcfYlzHUtp1kAoGBVR3a
         Y8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/sYNXgIceCk3p6tYWEDeSR7UlzMzyVQx3QPxbApKokA=;
        b=Rc/nlf/lItpsTzdXKgTPWxjBa6xYeiSFgGXGJumvaxS9Vbgdirauif7duQL9FcPVDq
         SN1wncnQhOslnJHCkvc+deVMeYoNr8yPcjmMSpq/QE3IZioU2EfNfw08crxzysqFcpCy
         V7ZS3vItf1y1Xcq2rwBb0DASwxhDcbwN5W6nrqxPErJ1dHa4rosUoSAhoQvd1vcjNO9Q
         LLQ/c9RnO5quNPo7d6rXIOJgARzbzmP4ZBdLfe+dWPP2vwiVAubTNtVfHun7oIbJADIH
         p7qm/RBbriT9LEoeThKAfO4Nsci7YkKIBWPDRTCga+hkv8/64IW8/AX1rxV8tchuKbKf
         wLUg==
X-Gm-Message-State: AFqh2kpQQkxlkLSrRFk/TbC9WoOYSmJ0hyI33m/n3NS00XdwbnX3B+xC
        Rwfe/EjEzKOGO8Jcs/G/hD+Ul24ck46XgRRrdQ8=
X-Google-Smtp-Source: AMrXdXuyDwrdlZHbEe0uUseFr8ZI2hhnifBc/+qcRC0OIBVHykjj4/o/ZLRoIDSYDLXodJGN9yJUygwFAnDGKHmeGp4=
X-Received: by 2002:a62:3302:0:b0:58d:a7e6:89e3 with SMTP id
 z2-20020a623302000000b0058da7e689e3mr4265162pfz.67.1674758862290; Thu, 26 Jan
 2023 10:47:42 -0800 (PST)
MIME-Version: 1.0
References: <20230126170603.11896-1-laurent.pinchart@ideasonboard.com>
 <20230126170603.11896-3-laurent.pinchart@ideasonboard.com>
 <CAHCN7xJNGCd=Sghu3oe9_yjSg0ybXRFHaVLaZmC2guXCy7ty1A@mail.gmail.com> <Y9LI//H0a8P8c0gL@pendragon.ideasonboard.com>
In-Reply-To: <Y9LI//H0a8P8c0gL@pendragon.ideasonboard.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Thu, 26 Jan 2023 12:47:31 -0600
Message-ID: <CAHCN7xJ1KxbQGrt657HAz3_PiFtmkjaUoDKxbOMwO124TgXvfg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: media: imx8-isi: Use 'port' instead
 of 'ports' for i.MX8MN
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-imx@nxp.com, kernel@pengutronix.de,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 26, 2023 at 12:40 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Adam,
>
> On Thu, Jan 26, 2023 at 12:31:16PM -0600, Adam Ford wrote:
> > On Thu, Jan 26, 2023 at 11:06 AM Laurent Pinchart wrote:
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > >  .../bindings/media/nxp,imx8-isi.yaml          | 39 +++++++++++--------
> > >  1 file changed, 22 insertions(+), 17 deletions(-)
> >
> > Is there a reason not to squash the two bindings into just one patch?
>
> As indicated in the cover letter, I've kept this separate to clearly
> show the impact on the bindings. If using a 'port' node is the preferred
> option, I can squash this patch, if using a 'ports' unconditionally is
> favoured, then I'll just drop it.

Sorry, I missed that.

That makes sense

adam
>
> > > diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> > > index 6038b9b5ab36..121594569395 100644
> > > --- a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> > > +++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> > > @@ -52,11 +52,21 @@ properties:
> > >    power-domains:
> > >      maxItems: 1
> > >
> > > +  port:
> > > +    $ref: /schemas/graph.yaml#/properties/port
> > > +    description: |
> > > +      The port represents the Pixel Link input to the ISI. It shall have a
> > > +      single endpoint. This property is only used for ISI instances with a
> > > +      single port (as in the i.MX8MN). For instances that includes multiple
> > > +      ports, the 'ports' property shall be used instead.
> > > +
> > >    ports:
> > >      $ref: /schemas/graph.yaml#/properties/ports
> > >      description: |
> > >        Ports represent the Pixel Link inputs to the ISI. Their number and
> > > -      assignment are model-dependent. Each port shall have a single endpoint.
> > > +      assignment are model-dependent. For ISI instances that have a single
> > > +      port, the 'port' property should be used instead. Each port shall have a
> > > +      single endpoint.
> > >
> > >  required:
> > >    - compatible
> > > @@ -65,7 +75,6 @@ required:
> > >    - clocks
> > >    - clock-names
> > >    - fsl,blk-ctrl
> > > -  - ports
> > >
> > >  allOf:
> > >    - if:
> > > @@ -77,12 +86,11 @@ allOf:
> > >        properties:
> > >          interrupts:
> > >            maxItems: 1
> > > -        ports:
> > > -          properties:
> > > -            port@0:
> > > -              description: MIPI CSI-2 RX
> > > -          required:
> > > -            - port@0
> > > +        port:
> > > +          description: MIPI CSI-2 RX
> > > +        ports: false
> > > +      required:
> > > +        - port
> > >
> > >    - if:
> > >        properties:
> > > @@ -93,6 +101,7 @@ allOf:
> > >        properties:
> > >          interrupts:
> > >            maxItems: 2
> > > +        port: false
> > >          ports:
> > >            properties:
> > >              port@0:
> > > @@ -102,6 +111,8 @@ allOf:
> > >            required:
> > >              - port@0
> > >              - port@1
> > > +      required:
> > > +        - ports
> > >
> > >  additionalProperties: false
> > >
> > > @@ -122,15 +133,9 @@ examples:
> > >          fsl,blk-ctrl = <&disp_blk_ctrl>;
> > >          power-domains = <&disp_blk_ctrl IMX8MN_DISPBLK_PD_ISI>;
> > >
> > > -        ports {
> > > -            #address-cells = <1>;
> > > -            #size-cells = <0>;
> > > -
> > > -            port@0 {
> > > -                reg = <0>;
> > > -                isi_in: endpoint {
> > > -                    remote-endpoint = <&mipi_csi_out>;
> > > -                };
> > > +        port {
> > > +            isi_in: endpoint {
> > > +                remote-endpoint = <&mipi_csi_out>;
> > >              };
> > >          };
> > >      };
>
> --
> Regards,
>
> Laurent Pinchart
