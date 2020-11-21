Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B0282BC03C
	for <lists+linux-media@lfdr.de>; Sat, 21 Nov 2020 16:25:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727942AbgKUPZS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 21 Nov 2020 10:25:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727912AbgKUPZR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 21 Nov 2020 10:25:17 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14616C061A4C
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2020 07:25:16 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id j205so17696807lfj.6
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2020 07:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=spqUZvPy4NHY/a1UsDzVVuOTjv+SIpL3p3jLdPjUdqM=;
        b=Ks0whlYv+buJ8xPqUvgCUUgOHJkL4rNxZt2ZONI0dg1SVOkcVT1CCKpvARqT5hpYkD
         SnnnUkCJ3aWhqA9MaheabV0xqjdys1Qx+3w3e52g2LCKqazOog/rYjsIBlg5w3HLqNBK
         hoJH44ChHraPcuIWNn1ylddRLbux60apRzh53KR4atkq1UeS1HeltudmyU27lC5VJBob
         j7tVnJUQzPvfpsQI+tPzI/vctg/BB7bSJB/S6oUvrLcigw/iseNlipW7k1Dex+Vqao+/
         5415kUcK94re2U0oJt48m3Lb3kydeEtrrghyZLeI1qFhERq71G04G+GNwhGw4tpC30W/
         VbcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=spqUZvPy4NHY/a1UsDzVVuOTjv+SIpL3p3jLdPjUdqM=;
        b=qqQwJOVU88F1ZV37M6Y3W1Gsv67KZy1l8EggTTDNeHXWaVaRQXI+4x7tqD1B3ReTRO
         lzMbix58D0+/VYZnKfv1BepS8aceRtJDwB9oBvXfwK0Ne+i6u+J0DBEK9WUEJlf8kv15
         MFvXIceLmVT6PTfFvZvEXITvQ8uQU8XRiBIxGH0hrP38Ze2yt4bquA/lVJoBKNcuk4de
         rjOwTVISOCSBvbrRHmx0KFxwwbxFk6pl+AgrugXdLWcvp0eWLiYrKvnyM62g8QaEyfu0
         V0FRCnPx4H5f92ywilWDtfia4I5uuat3CwCWUZKJ/BvDqgpnkAuYwp5LFiRR1+K2rNhw
         ieXA==
X-Gm-Message-State: AOAM532fCNKZbU9HsdGDazNJix4EumoxifY68NhGcuoRVrNrMhhQGZZ/
        jDFwjQA5VYZ3jcJaKfz+wVaLR4/fRDdmffRamDcFaQ==
X-Google-Smtp-Source: ABdhPJyS9LbpGfdpQYHXmnDrzfnibwvfS5blTArd1lMikEBDTEFt+94v9QRZ/n65nEZOXFA7iYcIDqREwDfok2BWMNI=
X-Received: by 2002:a05:6512:3e7:: with SMTP id n7mr9650079lfq.585.1605972314342;
 Sat, 21 Nov 2020 07:25:14 -0800 (PST)
MIME-Version: 1.0
References: <20201113124239.2667502-1-linus.walleij@linaro.org> <20201121132742.GA2121607@robh.at.kernel.org>
In-Reply-To: <20201121132742.GA2121607@robh.at.kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 21 Nov 2020 16:25:02 +0100
Message-ID: <CACRpkda6EDjtDEK6N0kvnpyBD+6ofgdBcUeqn70VG4FY_0X1-g@mail.gmail.com>
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

On Sat, Nov 21, 2020 at 2:27 PM Rob Herring <robh@kernel.org> wrote:
> On Fri, Nov 13, 2020 at 01:42:38PM +0100, Linus Walleij wrote:

> > +  richtek,rfs:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 7680
> > +    maximum: 367000
> > +    description: The resistance value of the RFS resistor. This
>
> Units? Add a defined unit suffix to the property name and you can drop
> the type.

Do you mean that if I rename this property as:

richtek,rfs-ohms

there will be some automagic machinery in dtschema that checks that
it is an uint32?

Is there a list of these magic suffixes somewhere?

Yours,
Linus Walleij
