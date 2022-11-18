Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27E7962F923
	for <lists+linux-media@lfdr.de>; Fri, 18 Nov 2022 16:20:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242142AbiKRPU1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Nov 2022 10:20:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242101AbiKRPU0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Nov 2022 10:20:26 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C99431CB08;
        Fri, 18 Nov 2022 07:20:24 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DD06FB82448;
        Fri, 18 Nov 2022 15:20:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68B9FC433D6;
        Fri, 18 Nov 2022 15:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668784821;
        bh=SpvFCOXvPUWOiKQM23aihGopezt0vreTxIsAJdpgDSo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=oc7/TRl+C+oGFHGA0/HLwnXKqEXXKpT8Tx1dY16SqJw9lkVcvNICA1XLIGSXswup6
         ZCR0Dt5ZXnGKfZGGN8GMnfQRp4ozowb3pInAPwMMW9SI47DOhfZruVNKHsQj+Bvr8I
         L9awqeg9l3UqAcPXsJHTBJ2ld9thZxkgJKn9DlHZDXmRrHBaKLm9WcWc0W5NHCVH5K
         y59ypGSpQJqGabhYvkUWLvJgWSjzrqjbZEJzjWHm1qRYedZEA4xn2LEiOOKPt8tKJL
         fLTECJFPPQxv3KvG5674syCZ/4udl0gDwx8cjqsIr/gXJMPeP/2xG0d02Mm20JWI/m
         ciPdalNuQJJKg==
Received: by mail-lf1-f52.google.com with SMTP id g7so8722373lfv.5;
        Fri, 18 Nov 2022 07:20:21 -0800 (PST)
X-Gm-Message-State: ANoB5pkBof8ICQJ2tjTYSiHW0oglqXBmu7tKpOO6Yj3H9dJRTO5ZpwYv
        Qkap2Y2FTcQj1unfP1Q6c2siIsYJaNI86D67qA==
X-Google-Smtp-Source: AA0mqf4EL07ceQCbbxeKyc252T6oLQShTRKBiEUE8bTfHXb2zfJ9zXJeBa/xS2aGnC6wqvpDpDa5FPgo/eVCoOSa/xI=
X-Received: by 2002:ac2:442f:0:b0:4a2:8d76:abaa with SMTP id
 w15-20020ac2442f000000b004a28d76abaamr2707645lfl.74.1668784819339; Fri, 18
 Nov 2022 07:20:19 -0800 (PST)
MIME-Version: 1.0
References: <20221111132906.2212662-1-hljunggr@cisco.com> <20221111132906.2212662-4-hljunggr@cisco.com>
 <20221116200729.GA761467-robh@kernel.org> <3d7ab1ba-bc9e-4385-8ca8-73d062b383a3@xs4all.nl>
In-Reply-To: <3d7ab1ba-bc9e-4385-8ca8-73d062b383a3@xs4all.nl>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 18 Nov 2022 09:20:10 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+M2A-5B+ZM2xjZVYXdQFyU=7coitVe9aKx9GHpR_H1Ug@mail.gmail.com>
Message-ID: <CAL_Jsq+M2A-5B+ZM2xjZVYXdQFyU=7coitVe9aKx9GHpR_H1Ug@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] dt-bindings: media: add cat24c208 bindings
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Erling Ljunggren <hljunggr@cisco.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

+Bartosz

On Fri, Nov 18, 2022 at 4:34 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 11/16/22 21:07, Rob Herring wrote:
> > On Fri, Nov 11, 2022 at 02:29:04PM +0100, Erling Ljunggren wrote:
> >> Add devicetree bindings for new cat24c208 EDID EEPROM driver.
> >>
> >> Signed-off-by: Erling Ljunggren <hljunggr@cisco.com>
> >> ---
> >>  .../bindings/media/i2c/onnn,cat24c208.yaml    | 46 +++++++++++++++++++
> >>  1 file changed, 46 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,cat24c208.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,cat24c208.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,cat24c208.yaml
> >> new file mode 100644
> >> index 000000000000..492eecb3ab7c
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/media/i2c/onnn,cat24c208.yaml
> >> @@ -0,0 +1,46 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/media/i2c/onnn,cat24c208.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: ON Semiconductor CAT24C208 EDID EEPROM driver
> >> +
> >> +maintainers:
> >> +  - Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >> +
> >> +description: |
> >> +  CAT24C208 is a dual port i2c EEPROM designed for EDID storage.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: onnn,cat24c208
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  input-connector:
> >> +    description: |
> >> +      Phandle to the video input connector, used to find
> >> +      the HPD gpio and the connector label, both optional.
> >> +    $ref: /schemas/types.yaml#/definitions/phandle
> >
> > The binding and driver feel the wrong way around to me. It seems
> > like you should have a driver for the connector and it needs HPD GPIO,
> > label, and EEPROM. The driver instead looks mostly like an EEPROM driver
> > that hooks into a few connector properties.
>
> A device like this is typically used next to an HDMI receiver: the DDC
> lines and the HPD line are connected to the EDID EEPROM, and the video
> is handled by the HDMI receiver.
>
> Most HDMI receivers will have the EDID part integrated into the chip itself
> (see e.g. the adv7604 driver), but that doesn't have to be the case. The EDID
> can be completely separate, it doesn't matter for the receiver part.
>
> In our specific use-case there isn't even an HDMI receiver since the HDMI
> video is passed through and this EDID EEPROM is used to help debug HDMI
> issues by presenting custom EDIDs, similar to something like this:
>
> https://www.amazon.com/dp/B0722NVQHX
>
> The HPD line is controlled by the EDID part since it has to be low if there
> is no EDID or pulled low for at least 100ms if the EDID is being modified.

There is no HPD control on the EEPROM itself. So HPD does not belong
in the EEPROM node. That is the fundamental problem with the binding.

We've always started bindings without connector nodes and just shove
properties into whatever node we do have. Then things evolve to be
more complicated with different h/w and that doesn't work. Start with
a connector even if you think it is overkill.

> > Reading the datasheet, I don't see anything special about accessing the
> > EEPROM from the host (DSP) side. Wouldn't the default at24 driver work?
> > It exposes regmap and nvmem.
>
> No. It is not a regular EEPROM, it is dedicated to store EDIDs. It has to
> correctly toggle the HPD line and inform other drivers (specifically HDMI CEC)
> of EDID updates.
>
> I don't see how the at24 could work: besides the eeprom i2c address it has to
> deal with two additional i2c devices: the segment address and the config
> address of the device itself. Writing to the eeprom from the host side requires
> a write to the segment address followed by a write to the eeprom part itself,
> and that's not something the at24 can do. And it is also something very specific
> to the VESA E-DDC standard (freely downloadable from vesa.org).

The addressing is different on the DSP (as the datasheet calls it)
side compared to the DDC side which has the EDID_SEL signal. Linux
only sees the DSP side, right? Looking at it a bit more, it looks like
the segment addressing is different from at24 which uses an i2c
address per segment. It is similar to ee1004 SPD where the segment is
selected by a write to a 2nd i2c address.

> Note that historically the first EDID EEPROMs most likely did work like the
> at24, but as EDID sizes grew beyond 256 bytes the E-DDC standard was created
> and that departed from the normal EEPROMs.

What happens if/when you have more than 1 part to support? Why not
provide a regmap or nvmem to the EDID storage and then the backend
device can be anything. I could imagine we could have a s/w
implementation.

Anyways, I don't really care if you do any of that now, but I still
think the binding is backwards. It's the connector you are managing,
not just an EEPROM, so you should bind to the connector and from there
gather all the resources you need to do that (EEPROM, HPD).

Rob
