Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D38AA45B74B
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 10:21:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230292AbhKXJYj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 04:24:39 -0500
Received: from mail-ua1-f53.google.com ([209.85.222.53]:33435 "EHLO
        mail-ua1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbhKXJYi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 04:24:38 -0500
Received: by mail-ua1-f53.google.com with SMTP id a14so3800498uak.0;
        Wed, 24 Nov 2021 01:21:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nwaHK+ei8VNQ10NScjkc4peX2dV9WKtVGklq8RmEoEs=;
        b=KYvKwFpF4bfJ3VOaUKKLsTj1m9bjco1QdNdcXa+PgVzjoDXz8R3Il7ZZ5xTA0L/EPB
         40JOl36kF80T7163qXTTpwavjCv7i+ZjrdJZs59skcA8LGPmuszOFVMNafVTI8qtS2r1
         Yw8DXR+EslVatOPsNmVN/xR3PxaW7jJI3Gx7Nx1cshlXt3Sps5oJwNdw1U8qiUTmWV+E
         3G2yPd8tBQkfYNyaJNedF920kIL2hHr2G/BhH43zc9wTe5JDTuaQH2NHPMESHs7IXzYo
         o90TdgdADnGOKON+2MxAkzBTYvTzlJdHl/KA8agkblKNFEWrgGo6x42ej5gMnZ5ZHY1c
         m/BQ==
X-Gm-Message-State: AOAM533G38Z1S2Q0gClKogoBYNlWzrpFcAsVkvcjpdjRZe+EcRoqxhuX
        2eN1zfLa6X1ksfpi9M57tJ5qxPi4Xg0gBw==
X-Google-Smtp-Source: ABdhPJwfEEJKy9hS5BM7LQZx9CynF0ym9fckYkJK87KjoY1mSqH8HGI8g6tt9fxeExJBAjoDTnCDKQ==
X-Received: by 2002:a67:c11a:: with SMTP id d26mr21373453vsj.29.1637745688957;
        Wed, 24 Nov 2021 01:21:28 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id s16sm7818618uag.14.2021.11.24.01.21.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 01:21:28 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id a14so3800387uak.0;
        Wed, 24 Nov 2021 01:21:28 -0800 (PST)
X-Received: by 2002:a9f:2431:: with SMTP id 46mr7916314uaq.114.1637745688257;
 Wed, 24 Nov 2021 01:21:28 -0800 (PST)
MIME-Version: 1.0
References: <4f8526dafcd3a88631ef2bc8bd2bb4652368d3cb.1626261172.git.geert+renesas@glider.be>
 <CAMuHMdX3M1ZUBF+fs3LHrx8fdWqJ0Mv9XC3Yb9mTkXRmhctTvQ@mail.gmail.com> <YZ4CjUcWdRt3Dmb0@valkosipuli.retiisi.eu>
In-Reply-To: <YZ4CjUcWdRt3Dmb0@valkosipuli.retiisi.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 24 Nov 2021 10:21:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUQk7gwg8Hfin+1mw=JE5zbvRJr7W75xWzAS-X1rrd12g@mail.gmail.com>
Message-ID: <CAMuHMdUQk7gwg8Hfin+1mw=JE5zbvRJr7W75xWzAS-X1rrd12g@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: media: renesas,jpu: Convert to json-schema
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Wed, Nov 24, 2021 at 10:14 AM Sakari Ailus <sakari.ailus@iki.fi> wrote:
> On Wed, Nov 24, 2021 at 10:06:38AM +0100, Geert Uytterhoeven wrote:
> > On Wed, Jul 14, 2021 at 1:17 PM Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> > > Convert the Renesas JPEG Processing Unit Device Tree binding
> > > documentation to json-schema.
> > >
> > > Document missing properties.
> > > Update the example to match reality.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Reviewed-by: Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > ---
> > > v2:
> > >   - Add Reviewed-by.
> >
> > Why was the status of this patch changed from "Reviewed" to "Not
> > Applicable" in the linux-media patchwork?
> > https://patchwork.linuxtv.org/project/linux-media/patch/4f8526dafcd3a88631ef2bc8bd2bb4652368d3cb.1626261172.git.geert+renesas@glider.be/
> >
> > Who's gonna take it?
>
> It seems to be assigned to me in Patchwork but I don't remember it. Hmm.

Yes, it was in that state since August 5.

> I can take it.

Thank you, this is one of the few remaining binding conversions for
Renesas SoC components.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
