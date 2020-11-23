Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 441302C17A0
	for <lists+linux-media@lfdr.de>; Mon, 23 Nov 2020 22:27:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729668AbgKWVXX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 16:23:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726270AbgKWVXX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 16:23:23 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCE37C0613CF
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2020 13:23:22 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id s27so5854716lfp.5
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2020 13:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vRZ/gKrfEgXXPL3DmEFvGxpTfGP1G2iZrpLKbx41KPU=;
        b=JFAU1aYQDQw7PAw6MuOA4Haf/FSt2b20JWn46yctmfUW7d3b0XtyKdBfRLw4Ki7Uah
         4DXsscwINcAaysL1AyrDQR2AYEeQiIaM7tZDDjWu0j7r8FhEs8gGFPiEQkmYnoXeTQ+F
         ZHGSr6cXBktjGmWjyH9CK2qccW/2izQwCs4tWqmN/3DJ1pCY3if+bqrKy30fxU+cSt8U
         ax0q2Kolx75J9yV89jDKNM7UCdN8LCLKD/avamFApLoGOtMMBYEoUWVR1QKLW479qRns
         YeCycSvj44T9T51EGhTMJfsfYPAAg34QKhnzqxqplYcJpavb93QDa/lhiGg4LOlGds13
         aV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vRZ/gKrfEgXXPL3DmEFvGxpTfGP1G2iZrpLKbx41KPU=;
        b=rk/HIXr+fa5EOefRmX0DjY3RxdpTspvelZapiVEb15F4hG1TApXZOVtkpgO7jgGSNP
         08JPPxMTU9unw9A8ir72Yw6Vdp6sohUJS2aHpblpGKXNMrqTkNKvakV9il1T/f+BhIKs
         gi4GgW8qJfFjrl5V88QqaKS9nKSE0v2ToRMIed1sejk6NUVfEDcUMzz8tasC8m1/2b0u
         dNLkqQ7I1GKuYMnaQRmkiPNkLGBb32gcIa4r1itMq6uQ3nuczrQMY8SRefDyEX9mCtkW
         7KImy5CFR6AkATS6wHMPlMhAXiv5Pv957q816xofBDF5cDj2cI7jqN8v2JCoXS1+WFbT
         QDMg==
X-Gm-Message-State: AOAM533Hsp89uG5F8y9DziBew1jYgwVMk27FPRN774Q9X7oJvPZ8JKzs
        jEbceGPSWVNGOxhQ/LbtbC+vwwVu8EoVU1SaH6q4Bw==
X-Google-Smtp-Source: ABdhPJy2Q0A7D8Lk4T9WUvsZAqStaMJ1heV2jCWT5l7VWJMu9ZmC9IWtTK3/IWTF52cjUy4teKASDDQm/uH/X/faXvI=
X-Received: by 2002:a19:7b06:: with SMTP id w6mr477889lfc.260.1606166601367;
 Mon, 23 Nov 2020 13:23:21 -0800 (PST)
MIME-Version: 1.0
References: <20201113124239.2667502-1-linus.walleij@linaro.org>
 <20201121132742.GA2121607@robh.at.kernel.org> <CACRpkda6EDjtDEK6N0kvnpyBD+6ofgdBcUeqn70VG4FY_0X1-g@mail.gmail.com>
In-Reply-To: <CACRpkda6EDjtDEK6N0kvnpyBD+6ofgdBcUeqn70VG4FY_0X1-g@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 23 Nov 2020 22:23:09 +0100
Message-ID: <CACRpkdZvEstDXx9-m7n09H1FmbwnT014Lyv2nDdc_nXM0KUbpA@mail.gmail.com>
Subject: Re: [PATCH 1/2 v5] dt-bindings: leds: Add DT binding for Richtek RT8515
To:     Rob Herring <robh@kernel.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, newbytee@protonmail.com,
        Stephan Gerhold <stephan@gerhold.net>,
        phone-devel@vger.kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Nov 21, 2020 at 4:25 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> > Units? Add a defined unit suffix to the property name and you can drop
> > the type.
>
> Do you mean that if I rename this property as:
>
> richtek,rfs-ohms
>
> there will be some automagic machinery in dtschema that checks that
> it is an uint32?
>
> Is there a list of these magic suffixes somewhere?

Got impatient and grepped around myself :D
So schemas/property-units.yaml and meta-schemas/vendor-props.yaml
explains a lot!

Clever, we should add these example tweaks to the example schema
as illustration of available intrinsics.

Okidoki, respinning tagging on -ohms!

Yours,
Linus Walleij
