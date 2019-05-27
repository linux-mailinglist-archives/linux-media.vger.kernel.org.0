Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 881282AFD3
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 10:15:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbfE0IPS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 May 2019 04:15:18 -0400
Received: from mail-yw1-f65.google.com ([209.85.161.65]:41092 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726404AbfE0IPR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 May 2019 04:15:17 -0400
Received: by mail-yw1-f65.google.com with SMTP id t140so3706010ywe.8;
        Mon, 27 May 2019 01:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8L8FxJvLC6rdJRaEPp+bxb7cZDFl4i6J9lltUnwH0Us=;
        b=AVGdfQETMoH5SxwK3z793+ehooy4pLBSM3xLn/Bswr3N0KfGnt0Fhqw3hoYJVQ40bl
         M49M/c/NDMmzmjtfZLywbrm8ep9XCX3xUGH8WLrvvgpwk5OMkppGvpXIKgMytQLcUA8z
         XZhjbyDG0kezcP3Xw6j5ljsSqTAl7x79r0eG3ZWc5aISMRYZ8Ml8eLVpkUf8kzyOOovF
         ONjyUy3hzEvTBhp63PEusjXlmra2S3rD0e5iEu+Ji6mwBLngZLDJF79CU8k5wafQfvx8
         f4c8sCr/yBIwNvwpHScSAK35aDc48IBSIytwpuUE30pfQpJht29hv+rAhz6BxRa8TSBq
         FI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8L8FxJvLC6rdJRaEPp+bxb7cZDFl4i6J9lltUnwH0Us=;
        b=QZFJ3w088GrnS4r+z1spgKKPHT9ZPg7qZRu5N4+5baFITZmOR5mkldu98blYwnqT7Q
         dpRrQaGQ9zB6TnDHpGRECop+v5agpQrvu+ccRbswHoNHLyCFK/93/30jsq/NWilCFHQM
         Hl02+mbRXaK1pZSSQpZNTR5Y4c5WIUMf4KTAqcp6W2PgwBszgz9kEGitfvJ6wN3o5NJE
         d3/3e+qeEc6eF1JVXtTWco6uFKZa8Sye/ZGOM9mP4LyP/MOsZ8/UlrgcYhf+PSfnfeHE
         GkmnaYZvvDBr+EIYJjE9/xhtKV3aFyKgSPSKidpmIRX12+kMhau8Y0KiY0GUs121VLr5
         vVew==
X-Gm-Message-State: APjAAAUGL4YZfFCD7kFQa3aSgpTnmq7N3E/acPa3khOs5JXsa9fYOhCB
        EFtyVHyFGxZ+OyMsJhvFz4AJfSC3vI9UQYd6Cig=
X-Google-Smtp-Source: APXvYqwRLS3tvAtNy9ARQjniVMZA3QRwur4yo4izgAaeMy+E02aGyKEzarZnYXXpC1mDOrmutQcTBxmiXCPytcJqrNQ=
X-Received: by 2002:a0d:ea4c:: with SMTP id t73mr54679241ywe.472.1558944916838;
 Mon, 27 May 2019 01:15:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190526222536.10917-1-peron.clem@gmail.com> <20190526222536.10917-4-peron.clem@gmail.com>
 <20190527074745.5oyt5tyuoc75ntiq@flea>
In-Reply-To: <20190527074745.5oyt5tyuoc75ntiq@flea>
From:   =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date:   Mon, 27 May 2019 10:15:05 +0200
Message-ID: <CAJiuCcd7Ekg5fHQy0sLaiJLdPtH2U0UaMgHkCfhZQOmPg=0RHw@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] ARM: dts: sunxi: prefer A31 instead of A13 for ir
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-media@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maxime,


On Mon, 27 May 2019 at 09:47, Maxime Ripard <maxime.ripard@bootlin.com> wro=
te:
>
> On Mon, May 27, 2019 at 12:25:29AM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > Since A31, memory mapping of the IR driver has changed.
> >
> > Prefer the A31 bindings instead of A13.
> >
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >  arch/arm/boot/dts/sun6i-a31.dtsi   | 2 +-
> >  arch/arm/boot/dts/sun8i-a83t.dtsi  | 2 +-
> >  arch/arm/boot/dts/sun9i-a80.dtsi   | 2 +-
> >  arch/arm/boot/dts/sunxi-h3-h5.dtsi | 2 +-
>
> Can you split the H3 in a separate patch? this will go through a
> separate branch.

Ok I will,
Thanks,
Cl=C3=A9ment

>
> Thanks!
> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
