Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E87AD433F27
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 21:20:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233512AbhJSTWb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Oct 2021 15:22:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230432AbhJSTWa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Oct 2021 15:22:30 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A88EDC061749
        for <linux-media@vger.kernel.org>; Tue, 19 Oct 2021 12:20:17 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id z77-20020a1c7e50000000b0030db7b70b6bso4905044wmc.1
        for <linux-media@vger.kernel.org>; Tue, 19 Oct 2021 12:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=amR5E21CDw5X8QX4CstPCgodDZD+lqoTSxPHB2qr7Ig=;
        b=Ka8VZYZsOcTMzI1jGk0SCPDey+kEEeWGt7hTj1ELEMRC8NZdBIzDb0zPnqY1joAANw
         r4CVZsMhMjp3KXq6WpIZS9pPFpBB/VL18anwlWCmKigVs8TJp1IScJ55Qk8gVDvU7Ko7
         kkMlav+jg/4Y0Q5ok/2Bk7FKhSe5mhfmK/PPe1RCzGs7utewat4r4OvJPjcbJzUAcVTS
         ZRojxRykdWtuhuwhyCtKM6U6dD+5xzLgYILN87K0F2Sn1cuX8dRM96QRN0vPtaXgQl55
         DZyAfq05QE7ApcgmOwDmBZZPD8zk1CTB6bFZt2dCNSjvrZR32LV1lyoT5ki49pEltadj
         kvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=amR5E21CDw5X8QX4CstPCgodDZD+lqoTSxPHB2qr7Ig=;
        b=jyZwzoN5WVbDTOBMNWVW1uErbxkZDDZHe1Yctr6YJX6k1exBtGDX/ymTblps4GmAG6
         774onIECyotQlIXr9phFoOyHALnKi7Gj+OL6ezJkYeLzAhDOaTnSvUHqoWKdewH+5NVa
         jV/JkGuv8IeMZi67v6hLvOeLKV1063+YaGKepdXiOmwUYGifHPkk+QtDHJtL9M5M6qHl
         WdiFzoglpoZAWepenXIvCb1HJK/y5ohSDQJgHAmuGFRsgkXHp/HMt9ERbW5LYgEnay/3
         6JLWICdS6ELID11Qt5VSAPcglsI1abueMggcrsMRzJ9jlpK9mtoK7iHhn9/9GYeQTOVc
         Wa7A==
X-Gm-Message-State: AOAM530PKFwWrrzCxBv9Y0LFF3KnxXi3OEm3gm/MIVeRqE2Q5htNOgzv
        FVYbDo4pNZgjuoCSo2FG8Y3xnA==
X-Google-Smtp-Source: ABdhPJxxYMd8IjtvD5uEEskS5hahrYgXWtOMz7rYEOq21IVk/maFKtUiCNzL40jjl6K9rS+La+vU+g==
X-Received: by 2002:a7b:c199:: with SMTP id y25mr8160997wmi.55.1634671216133;
        Tue, 19 Oct 2021 12:20:16 -0700 (PDT)
Received: from localhost (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.gmail.com with ESMTPSA id h8sm18190197wrm.27.2021.10.19.12.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 12:20:15 -0700 (PDT)
Date:   Tue, 19 Oct 2021 21:20:14 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2] dt-bindings: adv748x: Convert bindings to json-schema
Message-ID: <YW8abhwv5HbLWpcR@bismarck.dyn.berto.se>
References: <20211014105236.1947798-1-niklas.soderlund+renesas@ragnatech.se>
 <163429798440.4171071.15971721694401389459@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <163429798440.4171071.15971721694401389459@Monstersaurus>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

Thanks for your feedback.

On 2021-10-15 12:39:44 +0100, Kieran Bingham wrote:
> Quoting Niklas Söderlund (2021-10-14 11:52:36)
> > Convert ADV748X analog video decoder documentation to json-schema.
> > 
> > While converting the bindings extend it to enforce that all port@n nodes
> > shall be encapsulated inside a ports node. This change do not effect
> 
> Trivial nit:
> 'This change does not affect'
> or
> 'This change does not have an effect on'

Thanks.

> 
> > drivers parsing the ports@n nodes.
> > 
> 
> Glad to hear it ;-)
> 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > * Changes since v1
> > - Update commit message to mention the added ports node.
> > 
> > Hello,
> > 
> > This conversion revealed a problem with the Renesas DTSI files for the
> > adv7482 nodes. A fix for that have been submitted in a separate patch,
> > 
> 
> Great.
> 
> >     [PATCH] arm64: dts: renesas: Add ports node to all adv7482 nodes
> > 
> > Kind Regards,
> > Niklas Söderlund
> > ---
> >  .../devicetree/bindings/media/i2c/adv748x.txt | 116 ----------
> >  .../bindings/media/i2c/adv748x.yaml           | 211 ++++++++++++++++++
> >  2 files changed, 211 insertions(+), 116 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/media/i2c/adv748x.txt
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/adv748x.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/adv748x.txt b/Documentation/devicetree/bindings/media/i2c/adv748x.txt
> > deleted file mode 100644
> > index 4f91686e54a6b939..0000000000000000
> > --- a/Documentation/devicetree/bindings/media/i2c/adv748x.txt
> > +++ /dev/null
> > @@ -1,116 +0,0 @@
> > -* Analog Devices ADV748X video decoder with HDMI receiver
> > -
> > -The ADV7481 and ADV7482 are multi format video decoders with an integrated
> > -HDMI receiver. They can output CSI-2 on two independent outputs TXA and TXB
> > -from three input sources HDMI, analog and TTL.
> > -
> > -Required Properties:
> > -
> > -  - compatible: Must contain one of the following
> > -    - "adi,adv7481" for the ADV7481
> > -    - "adi,adv7482" for the ADV7482
> > -
> > -  - reg: I2C slave addresses
> > -    The ADV748x has up to twelve 256-byte maps that can be accessed via the
> > -    main I2C ports. Each map has it own I2C address and acts as a standard
> > -    slave device on the I2C bus. The main address is mandatory, others are
> > -    optional and remain at default values if not specified.
> > -
> > -Optional Properties:
> > -
> > -  - interrupt-names: Should specify the interrupts as "intrq1", "intrq2" and/or
> > -                    "intrq3". All interrupts are optional. The "intrq3" interrupt
> > -                    is only available on the adv7481
> > -  - interrupts: Specify the interrupt lines for the ADV748x
> > -  - reg-names : Names of maps with programmable addresses.
> > -               It shall contain all maps needing a non-default address.
> > -               Possible map names are:
> > -                 "main", "dpll", "cp", "hdmi", "edid", "repeater",
> > -                 "infoframe", "cbus", "cec", "sdp", "txa", "txb"
> > -
> > -The device node must contain one 'port' child node per device input and output
> > -port, in accordance with the video interface bindings defined in
> > -Documentation/devicetree/bindings/media/video-interfaces.txt. The port nodes
> > -are numbered as follows.
> > -
> > -         Name          Type            Port
> > -       ---------------------------------------
> > -         AIN0          sink            0
> > -         AIN1          sink            1
> > -         AIN2          sink            2
> > -         AIN3          sink            3
> > -         AIN4          sink            4
> > -         AIN5          sink            5
> > -         AIN6          sink            6
> > -         AIN7          sink            7
> > -         HDMI          sink            8
> > -         TTL           sink            9
> > -         TXA           source          10
> > -         TXB           source          11
> > -
> > -The digital output port nodes, when present, shall contain at least one
> > -endpoint. Each of those endpoints shall contain the data-lanes property as
> > -described in video-interfaces.txt.
> > -
> > -Required source endpoint properties:
> > -  - data-lanes: an array of physical data lane indexes
> > -    The accepted value(s) for this property depends on which of the two
> > -    sources are described. For TXA 1, 2 or 4 data lanes can be described
> > -    while for TXB only 1 data lane is valid. See video-interfaces.txt
> > -    for detailed description.
> > -
> > -Ports are optional if they are not connected to anything at the hardware level.
> > -
> > -Example:
> > -
> > -       video-receiver@70 {
> > -               compatible = "adi,adv7482";
> > -               reg = <0x70 0x71 0x72 0x73 0x74 0x75
> > -                      0x60 0x61 0x62 0x63 0x64 0x65>;
> > -               reg-names = "main", "dpll", "cp", "hdmi", "edid", "repeater",
> > -                           "infoframe", "cbus", "cec", "sdp", "txa", "txb";
> > -
> > -               #address-cells = <1>;
> > -               #size-cells = <0>;
> > -
> > -               interrupt-parent = <&gpio6>;
> > -               interrupt-names = "intrq1", "intrq2";
> > -               interrupts = <30 IRQ_TYPE_LEVEL_LOW>,
> > -                            <31 IRQ_TYPE_LEVEL_LOW>;
> > -
> > -               port@7 {
> > -                       reg = <7>;
> > -
> > -                       adv7482_ain7: endpoint {
> > -                               remote-endpoint = <&cvbs_in>;
> > -                       };
> > -               };
> > -
> > -               port@8 {
> > -                       reg = <8>;
> > -
> > -                       adv7482_hdmi: endpoint {
> > -                               remote-endpoint = <&hdmi_in>;
> > -                       };
> > -               };
> > -
> > -               port@a {
> > -                       reg = <10>;
> > -
> > -                       adv7482_txa: endpoint {
> > -                               clock-lanes = <0>;
> > -                               data-lanes = <1 2 3 4>;
> > -                               remote-endpoint = <&csi40_in>;
> > -                       };
> > -               };
> > -
> > -               port@b {
> > -                       reg = <11>;
> > -
> > -                       adv7482_txb: endpoint {
> > -                               clock-lanes = <0>;
> > -                               data-lanes = <1>;
> > -                               remote-endpoint = <&csi20_in>;
> > -                       };
> > -               };
> > -       };
> > diff --git a/Documentation/devicetree/bindings/media/i2c/adv748x.yaml b/Documentation/devicetree/bindings/media/i2c/adv748x.yaml
> > new file mode 100644
> > index 0000000000000000..37df0441d8790c6e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/adv748x.yaml
> > @@ -0,0 +1,211 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/adv748x.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Analog Devices ADV748X video decoder with HDMI receiver
> > +
> > +maintainers:
> 
> Optionally...
> + Niklas? ;-)

You mean so we know who to blame for these bindings in the future ;-) 
Will do.

> 
> > +  - Kieran Bingham <kieran.bingham@ideasonboard.com>
> > +
> > +description:
> > +  The ADV7481 and ADV7482 are multi format video decoders with an integrated
> > +  HDMI receiver. They can output CSI-2 on two independent outputs TXA and TXB
> > +  from three input sources HDMI, analog and TTL.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - adi,adv7481
> > +          - adi,adv7482
> > +
> > +  reg:
> > +    minItems: 1
> > +    maxItems: 12
> > +    description:
> > +      The ADV748x has up to twelve 256-byte maps that can be accessed via the
> > +      main I2C ports. Each map has it own I2C address and acts as a standard
> > +      slave device on the I2C bus. The main address is mandatory, others are
> > +      optional and remain at default values if not specified.
> > +
> > +  reg-names:
> > +    minItems: 1
> > +    items:
> > +      - const: main
> > +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
> > +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
> > +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
> > +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
> > +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
> > +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
> > +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
> > +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
> > +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
> > +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
> > +      - enum: [ dpll, cp, hdmi, edid, repeater, infoframe, cbus, cec, sdp, txa, txb ]
> 
> Is there any way to specify that these have to be used uniquely? I.e. no
> duplciates? Or is that automatic?

No, as far as I know it is not possible to enforce that each item is 
only used once. I tried to do that for a different binding a while ago 
so maybe something have changed since then, if so please let me know.

> 
> 
> 
> > +
> > +  interrupts: true
> > +
> > +  interrupt-names: true
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    patternProperties:
> > +      "^port@[0-7]$":
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Input port nodes for analog inputs AIN[0-7].
> > +
> > +    properties:
> > +      port@8:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Input port node for HDMI.
> > +
> > +      port@9:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Input port node for TTL.
> > +
> > +      port@a:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description:
> > +          Output port node, single endpoint describing the CSI-2 transmitter TXA.
> 
> I guess there's nothing to explicitly state if it's a sink or a source
> in the port nodes?
> 
> The table made it nice and clear which were sink/source ... and that
> gets a bit obfuscated here.
> 
> Of course it's mentioned as they are "Input" or "Output" nodes, but I
> liked the clarity the table had.
> 
> Not a blocker though I don't think....

I explicitly chose to use input / output port here instead of source / 
sink as the later is V4L2 specific while input / output is used in the 
hardware manual. I have no strong opinion here so can change if we can 
find a larger consensus for what word to use for media bindings.

> 
> 
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: /schemas/media/video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              clock-lanes:
> > +                maxItems: 1
> > +
> > +              data-lanes:
> > +                minItems: 1
> > +                maxItems: 4
> > +
> > +            required:
> > +              - clock-lanes
> > +              - data-lanes
> > +
> > +      port@b:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description:
> > +          Output port node, single endpoint describing the CSI-2 transmitter TXB.
> 
> I do like that we managed to align TXA = port 10 = a and TXB = port 11 =
> b...

I find it annoying that we went over 10 nodes, as port@a { reg = <10>; } 
is really not straight forward ;-)

> 
> 
> 
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: /schemas/media/video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              clock-lanes:
> > +                maxItems: 1
> > +
> > +              data-lanes:
> > +                maxItems: 1
> > +
> > +            required:
> > +              - clock-lanes
> > +              - data-lanes
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: adi,adv7481
> > +    then:
> > +      properties:
> > +        interrupts:
> > +          minItems: 1
> > +          maxItems: 3
> > +
> > +        interrupt-names:
> > +          minItems: 1
> > +          items:
> > +            - enum: [ intrq1, intrq2, intrq3 ]
> > +            - enum: [ intrq1, intrq2, intrq3 ]
> > +            - enum: [ intrq1, intrq2, intrq3 ]
> > +    else:
> > +      properties:
> > +        interrupts:
> > +          minItems: 1
> > +          maxItems: 2
> > +
> > +        interrupt-names:
> > +          minItems: 1
> > +          items:
> > +            - enum: [ intrq1, intrq2 ]
> > +            - enum: [ intrq1, intrq2 ]
> > +
> > +additionalProperties: false
> 
> Ah yes, this is actually an improvement on the earlier version as now
> it's clear that there is a difference between the number of IRQs which
> wasn't evident before.
> 
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - ports
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        video-receiver@70 {
> > +            compatible = "adi,adv7482";
> > +            reg = <0x70 0x71 0x72 0x73 0x74 0x75 0x60 0x61 0x62 0x63 0x64 0x65>;
> 
> I know this was like that before, but it seems odd having 0x70-75, then
> 0x60-65.
> 
> The 'main' has to be 70, and probably kept first, which is probably why
> I split it into two lines at least....
> 
> Is there a specific reason it's been joined up to a single line here?

Not really it fitted on one line within 80 characters so I probably did 
it with out thinking when fixing the formating. But I agree it makes 
more sens to align it will reg-names splitting. Will break in two lines 
in next versions.

> 
> 
> Anyway, I don't see any blockers here - just discussion points really,
> and I'm pleased to see it converted.
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Thanks!

> 
> > +            reg-names = "main", "dpll", "cp", "hdmi", "edid", "repeater",
> > +                        "infoframe", "cbus", "cec", "sdp", "txa", "txb";
> > +
> > +            interrupt-parent = <&gpio6>;
> > +            interrupts = <30 IRQ_TYPE_LEVEL_LOW>, <31 IRQ_TYPE_LEVEL_LOW>;
> > +            interrupt-names = "intrq1", "intrq2";
> > +
> > +            ports {
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +
> > +                port@7 {
> > +                    reg = <7>;
> > +
> > +                    adv7482_ain7: endpoint {
> > +                        remote-endpoint = <&cvbs_in>;
> > +                    };
> > +                };
> > +
> > +                port@8 {
> > +                    reg = <8>;
> > +
> > +                    adv7482_hdmi: endpoint {
> > +                        remote-endpoint = <&hdmi_in>;
> > +                    };
> > +                };
> > +
> > +                port@a {
> > +                    reg = <10>;
> > +
> > +                    adv7482_txa: endpoint {
> > +                        clock-lanes = <0>;
> > +                        data-lanes = <1 2 3 4>;
> > +                        remote-endpoint = <&csi40_in>;
> > +                    };
> > +                };
> > +
> > +                port@b {
> > +                    reg = <11>;
> > +
> > +                    adv7482_txb: endpoint {
> > +                        clock-lanes = <0>;
> > +                        data-lanes = <1>;
> > +                        remote-endpoint = <&csi20_in>;
> > +                    };
> > +                };
> > +            };
> > +        };
> > +    };
> > -- 
> > 2.33.0
> >

-- 
Regards,
Niklas Söderlund
