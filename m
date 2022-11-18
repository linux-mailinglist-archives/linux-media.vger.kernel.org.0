Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F095562FB53
	for <lists+linux-media@lfdr.de>; Fri, 18 Nov 2022 18:13:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242513AbiKRRNQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Nov 2022 12:13:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242511AbiKRRNL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Nov 2022 12:13:11 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B53298CF3B;
        Fri, 18 Nov 2022 09:13:08 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4D7946268C;
        Fri, 18 Nov 2022 17:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0354C433B5;
        Fri, 18 Nov 2022 17:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668791587;
        bh=LQ5A/e8CgQVFLBigqBguOxFC9FFS8Lq2fAETvnelO/w=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=FR6guwZYs71agmrE6ijvqHNwcJorSIpk3mwGcV6lRQm97vKuJu8MB65+tNaQKoYj4
         TvI/GeFJyMziEr5ChoRd2p9LehsORll5srtaK/6oclMNkfvTiKHRssG29BvR1OdPCW
         hjzDjaAGOy2gPlxy1iVq3BFy0F1RxhoT1JlFiOya/+kv1boP27pFqCok9yOiG2bD1g
         47o7dVNe7EXYwT1GUoLCkKgmlTsMxr1UT6w0rqUXDwFHGzW/ZeYNIw1BjMpoOjY6xj
         mZs4xsvUi3R4zPYe5rxDSrul1Ory5BI6BDTJAcCqnOSiJd9Yzz6bB2Uf3e6Xo6UYhm
         z4thDChcPL2dA==
Received: by mail-lf1-f42.google.com with SMTP id l12so9203493lfp.6;
        Fri, 18 Nov 2022 09:13:07 -0800 (PST)
X-Gm-Message-State: ANoB5pmARZ0If3PUYwR1edIslmiNEWWCc5CnyBs2SobD/AtnluEHrcu+
        x5oI/ZH87pqlP6+C7Dd+AUJsIVGT7ZXkngo1Vw==
X-Google-Smtp-Source: AA0mqf6s3OajSz9Cx1DIji/O92g5Pd3HhVaTqXwH3TmdRP7hmPmlUDwyutPk3lHU04AREN7qJYtarOwMPGOdljkI9EU=
X-Received: by 2002:ac2:4f13:0:b0:4a2:5c46:4b4d with SMTP id
 k19-20020ac24f13000000b004a25c464b4dmr3023588lfr.433.1668791585680; Fri, 18
 Nov 2022 09:13:05 -0800 (PST)
MIME-Version: 1.0
References: <20221111132906.2212662-1-hljunggr@cisco.com> <20221111132906.2212662-4-hljunggr@cisco.com>
 <20221116200729.GA761467-robh@kernel.org> <3d7ab1ba-bc9e-4385-8ca8-73d062b383a3@xs4all.nl>
 <CAL_Jsq+M2A-5B+ZM2xjZVYXdQFyU=7coitVe9aKx9GHpR_H1Ug@mail.gmail.com> <6243860a-e535-340e-989a-cffbb005bf59@xs4all.nl>
In-Reply-To: <6243860a-e535-340e-989a-cffbb005bf59@xs4all.nl>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 18 Nov 2022 11:12:56 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+7Vo0woX8J4LqSry564kvDmpLte619RyjAkziGqs5vpg@mail.gmail.com>
Message-ID: <CAL_Jsq+7Vo0woX8J4LqSry564kvDmpLte619RyjAkziGqs5vpg@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] dt-bindings: media: add cat24c208 bindings
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Erling Ljunggren <hljunggr@cisco.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 18, 2022 at 9:46 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 11/18/22 16:20, Rob Herring wrote:
> > +Bartosz
> >
> > On Fri, Nov 18, 2022 at 4:34 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >>
> >> On 11/16/22 21:07, Rob Herring wrote:
> >>> On Fri, Nov 11, 2022 at 02:29:04PM +0100, Erling Ljunggren wrote:
> >>>> Add devicetree bindings for new cat24c208 EDID EEPROM driver.
> >>>>
> >>>> Signed-off-by: Erling Ljunggren <hljunggr@cisco.com>
> >>>> ---
> >>>>  .../bindings/media/i2c/onnn,cat24c208.yaml    | 46 +++++++++++++++++++
> >>>>  1 file changed, 46 insertions(+)
> >>>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,cat24c208.yaml
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,cat24c208.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,cat24c208.yaml
> >>>> new file mode 100644
> >>>> index 000000000000..492eecb3ab7c
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/media/i2c/onnn,cat24c208.yaml
> >>>> @@ -0,0 +1,46 @@
> >>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>>> +%YAML 1.2
> >>>> +---
> >>>> +$id: http://devicetree.org/schemas/media/i2c/onnn,cat24c208.yaml#
> >>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>> +
> >>>> +title: ON Semiconductor CAT24C208 EDID EEPROM driver
> >>>> +
> >>>> +maintainers:
> >>>> +  - Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >>>> +
> >>>> +description: |
> >>>> +  CAT24C208 is a dual port i2c EEPROM designed for EDID storage.
> >>>> +
> >>>> +properties:
> >>>> +  compatible:
> >>>> +    const: onnn,cat24c208
> >>>> +
> >>>> +  reg:
> >>>> +    maxItems: 1
> >>>> +
> >>>> +  input-connector:
> >>>> +    description: |
> >>>> +      Phandle to the video input connector, used to find
> >>>> +      the HPD gpio and the connector label, both optional.
> >>>> +    $ref: /schemas/types.yaml#/definitions/phandle
> >>>
> >>> The binding and driver feel the wrong way around to me. It seems
> >>> like you should have a driver for the connector and it needs HPD GPIO,
> >>> label, and EEPROM. The driver instead looks mostly like an EEPROM driver
> >>> that hooks into a few connector properties.
> >>
> >> A device like this is typically used next to an HDMI receiver: the DDC
> >> lines and the HPD line are connected to the EDID EEPROM, and the video
> >> is handled by the HDMI receiver.
> >>
> >> Most HDMI receivers will have the EDID part integrated into the chip itself
> >> (see e.g. the adv7604 driver), but that doesn't have to be the case. The EDID
> >> can be completely separate, it doesn't matter for the receiver part.
> >>
> >> In our specific use-case there isn't even an HDMI receiver since the HDMI
> >> video is passed through and this EDID EEPROM is used to help debug HDMI
> >> issues by presenting custom EDIDs, similar to something like this:
> >>
> >> https://www.amazon.com/dp/B0722NVQHX
> >>
> >> The HPD line is controlled by the EDID part since it has to be low if there
> >> is no EDID or pulled low for at least 100ms if the EDID is being modified.
> >
> > There is no HPD control on the EEPROM itself. So HPD does not belong
> > in the EEPROM node. That is the fundamental problem with the binding.
>
> Perhaps there is a terminology issue here: the input-connector phandle
> points to a connector (an hdmi-connector in our case, but it can also
> be a dvi-connector for example). The driver gets the HPD gpio from
> the connector node. Perhaps the example should be extended with the
> hdmi-connector node?

You do need to define a connector node. But 'hdmi-connector' is taken
and means an hdmi output (though maybe it got used by someone for an
input?). The input side has and does different things, so we should
define a new compatible rather than complicate our lives trying to
reuse and extend the current one. So you need 'hdmi-in-connector'
compatible or something like that. You can possibly add this to the
existing hdmi-connector schema depending on how much the existing
properties may apply. For example, ddc-i2c-bus points to an i2c slave
for a s/w EDID?

> Or do you mean that the hdmi-connector node should point to the EDID
> driver?

DT does not have drivers, but yes, the HDMI connector node should
point to the EEPROM h/w device.

Rob
