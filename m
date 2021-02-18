Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 780EF31ECAB
	for <lists+linux-media@lfdr.de>; Thu, 18 Feb 2021 18:05:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234111AbhBRQ57 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Feb 2021 11:57:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:39590 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231398AbhBROzV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Feb 2021 09:55:21 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 943A964EB9;
        Thu, 18 Feb 2021 14:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613660078;
        bh=G1o3sltRRgh2gaudrfVPAl3cfmWIH60ygZShn9u7C+0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=mQd9f8XcRwdbNjtFodNA0zCyokDf0TgyQH4wBSADfAKQW8HJ/b0rNY01rig/c4sNE
         pYLJU7PkY17IsDVdZkwc0k9CeWdZA6ysyi40iEs9N6Al5xcwvlOMM/hiDpysWFFesg
         rd9ZN9VyGGqLeO5PC9LqdXbss4OA8zD8Zm0oywC2AshWytroXyN6ynTb+4xISuQv9a
         ebIKaBLjW+uvvdJEFaOZa8yalTArsSKsjSMk+oDWtnsLcdjXqVzLZv3RM87lq+ouHl
         2JZvZo0a9mv5WkVoWPONvk03+ZxZ4yi5rno5IC+WzttCEFlFouLMEdcaL3jJixiXvz
         v77QMu7bKOMog==
Received: by mail-ej1-f41.google.com with SMTP id bl23so6066651ejb.5;
        Thu, 18 Feb 2021 06:54:38 -0800 (PST)
X-Gm-Message-State: AOAM531ObfIbrp3kBU557GDTVwh9rOcwmXt3OMc15bRk2h1vv/bzcNu1
        cT7vIPox1NGnLkfe/UZvTZFEed3wuF5eZUpEYA==
X-Google-Smtp-Source: ABdhPJxxWrEv48LJyTQCqlhuzhEJKbr+V+CGGHgE3gsPwH2Idv+DGKJKnUdZy9z9bYC2qSTpCbocZDlXK4kEkBPdcNM=
X-Received: by 2002:a17:906:4094:: with SMTP id u20mr1702711ejj.525.1613660076908;
 Thu, 18 Feb 2021 06:54:36 -0800 (PST)
MIME-Version: 1.0
References: <20210111142309.193441-1-maxime@cerno.tech> <20210111142309.193441-14-maxime@cerno.tech>
 <CAL_JsqJ3QBoJVXnpeMz1X56F6VWEe_HzTKs9efrDWh3ccdr=5A@mail.gmail.com>
In-Reply-To: <CAL_JsqJ3QBoJVXnpeMz1X56F6VWEe_HzTKs9efrDWh3ccdr=5A@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 18 Feb 2021 08:54:23 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLKpT4y5gOH4kenHySY1n1pyV4sAEzGuwPV7V4vUJWevQ@mail.gmail.com>
Message-ID: <CAL_JsqLKpT4y5gOH4kenHySY1n1pyV4sAEzGuwPV7V4vUJWevQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/15] dt-binding: display: bcm2711-hdmi: Add CEC and
 hotplug interrupts
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Eric Anholt <eric@anholt.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE" 
        <linux-rpi-kernel@lists.infradead.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Feb 1, 2021 at 12:56 PM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Jan 11, 2021 at 8:27 AM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > The CEC and hotplug interrupts were missing when that binding was
> > introduced, let's add them in now that we've figured out how it works.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  .../bindings/display/brcm,bcm2711-hdmi.yaml   | 20 ++++++++++++++++++-
> >  1 file changed, 19 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> > index 7ce06f9f9f8e..6e8ac910bdd8 100644
> > --- a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> > +++ b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> > @@ -53,6 +53,24 @@ properties:
> >        - const: audio
> >        - const: cec
> >
> > +  interrupts:
> > +    items:
> > +      - description: CEC TX interrupt
> > +      - description: CEC RX interrupt
> > +      - description: CEC stuck at low interrupt
> > +      - description: Wake-up interrupt
> > +      - description: Hotplug connected interrupt
> > +      - description: Hotplug removed interrupt
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: cec-tx
> > +      - const: cec-rx
> > +      - const: cec-low
> > +      - const: wakeup
> > +      - const: hpd-connected
> > +      - const: hpd-removed
> > +
> >    ddc:
> >      allOf:
> >        - $ref: /schemas/types.yaml#/definitions/phandle
> > @@ -90,7 +108,7 @@ required:
> >    - resets
> >    - ddc
> >
> > -additionalProperties: false
> > +unevaluatedProperties: false
>
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml:
> 'additionalProperties' is a required property
>
> And you missed the DT list, so no checks ran.

This is still failing in linux-next.

Rob
