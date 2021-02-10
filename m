Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4CC6316E3B
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 19:14:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233728AbhBJSOH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 13:14:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232318AbhBJSMK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 13:12:10 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CAA3C06174A;
        Wed, 10 Feb 2021 10:11:30 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id p21so4185253lfu.11;
        Wed, 10 Feb 2021 10:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OutgQr4yqOXcvI+2VAqCroHhiEUOTQsB+VYfkyokZfQ=;
        b=K/tNUGRyyg1JPaXFeIAty+vAt1pa4AVtgnZrjOi1idCaLomaXtFM6eqPAodd+MPpDc
         7Zauh8bXZX8g+xFKJE6RRC3SqD/gf4SaSt8/UfI9dw62iqnQB5RAhll52imITGCbpp4i
         yUqyVBHbO670x72ouOOdZVIr3K3qMbkshnhRVf+mEKMscZZ5FRHD+krSb4q2/oTw/df6
         TnH2K5Ik+KY51i5xyhJx1GC8jgGYoVIOIAzAd6A6HC7T/fbpxrx/IMR1Lz7p5JVr4e50
         +8DsuwZtYCFuyNUsAEf28DC4g/AssHPnTC3oe3oGZUCMMfhJnQCpGZznB3Kzho/9bTm4
         m6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OutgQr4yqOXcvI+2VAqCroHhiEUOTQsB+VYfkyokZfQ=;
        b=QOtiLP3BZaI44hX7Nb5iffue8obVHcJOnj/CJ8hWF0fF2zS87l0RjxUm/w8SkzuAPt
         OmKTW3/sShXy9nZzHgaQCzsrTTWuF2Xz/eMp8o2YgSjEs/BE1/Yg+PYJGVwECK83rbT0
         445LczMWB1W34bOiGGkUeAGZGs2DTiC5T4fw9thFrV7k6XsuSG2eusCrHTapNFhYvKnv
         0QUBMnuV13nihoe33NuqMFehE8/wInBnDSk/8TSSgRgTRvuU3/o4Y23pm9sEz1CmM68R
         PdPaXMNSioygu8ual7l5YreiUM3nCqux+WGxeAlIizjdFUyWA3wKzQtPFB/P5wCZNO8r
         +7YQ==
X-Gm-Message-State: AOAM5336atBW9+mcI3N6kn4ikD/RgL4/PW2kQz+VNTrE/73zq6+HBmXV
        evcbiuN79ljKZQWiwdlyz6qNI5WZj9zc4XsR0f8=
X-Google-Smtp-Source: ABdhPJyjGB27CNQYWLoAURbKcwGlNjGMcPNWjNOM02k+hJrUyW/hRPYOrE16tF9ARShrkrMiN857gpu3qNSwgxCScKs=
X-Received: by 2002:ac2:5f0b:: with SMTP id 11mr2255557lfq.578.1612980688543;
 Wed, 10 Feb 2021 10:11:28 -0800 (PST)
MIME-Version: 1.0
References: <20210203163348.30686-1-TheSven73@gmail.com> <804285cff81878a2c188d1b823182114f891ca38.camel@ndufresne.ca>
In-Reply-To: <804285cff81878a2c188d1b823182114f891ca38.camel@ndufresne.ca>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Wed, 10 Feb 2021 13:11:17 -0500
Message-ID: <CAGngYiX2tQ3egFX0CZSMd8QBG_-FuXCWL9R1whu77J7ZE+M_+w@mail.gmail.com>
Subject: Re: [BUG REPORT] media: coda: mpeg4 decode corruption on i.MX6qp only
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Adrian Ratiu <adrian.ratiu@collabora.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Bonjour Nicolas,

On Wed, Feb 10, 2021 at 11:11 AM Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
>
> Are you sure you aren't just running out of CMA ? This is the only things that
> comes to mind at the moment, sorry if it's not that useful.

Thanks for the suggestion! No worries, this is such a strange/weird
problem, that basically any idea has merit at this point.

I tried increasing the CMA area from 256M -> 512M, but there was no
impact. The critical framebuffer width still remains the same
(=0x900).

And everything works fine on a classic i.MX6Quad, it's only the
i.MX6QuadPlus that has the problem. I am running i.MX6Quad and
i.MX6QuadPlus side-by-side with identical kernels/rootfses. Obviously
the devicetree is slightly different.

Sven
