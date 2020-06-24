Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA7E20794C
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2020 18:39:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404699AbgFXQjk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jun 2020 12:39:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404107AbgFXQjj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jun 2020 12:39:39 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3A3BC061573
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2020 09:39:39 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id k6so2954853wrn.3
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2020 09:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9qWPTeZoKMjCXc64GQ7odtJSAM2fu8a0khctluIk9SA=;
        b=qlgJbXEPKQLANz2j2UICh59mbu5FsUN+1x2EmtthBfmBGKY81jAJGgYjk2IndW4i4u
         790hfR2tX8NAwv69MsJLEO9vLctpeZdh5f6rpLqqBD+iQOPo7cloqZ3LjttP6Qho3MIm
         KPr64VH3CDONsgwHrL6kCY+19+CCzRe24uoLIrGo4NcvTcJ+sbOX1Nxp+iHeolEXt2jl
         Upy4Mpn+tQGuSPKVcPEH3Ey3Cz2DPz6FPUKn7Avg49IxV0IQmhEthpAMrkulOqSIapp+
         b+sDjHa8dH5oxu/Deh4hh55wDc05LLZ7Uh6kGq/5UlmFAHjf9uldZ7hDbWvrwH/icEr8
         j2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9qWPTeZoKMjCXc64GQ7odtJSAM2fu8a0khctluIk9SA=;
        b=sRDNHJugvNasr4C5V3gBT6BFrsPbdA6DV3mCwhHb+AGAWwe23IsVQ02jyJ6YgGvRhe
         08v9f3RDBG6n2/Aj2C3GxyulwNoFxK4mEC+yCbJSy6KHKECOLtrYa1zo221w95tjb7Xk
         h+URdBIGbU9XXK+oFtNDN/7KzLRmDCP7nHqVYKc9K+P9mI69hlxcKcMX7Ub+Goo1wnaw
         kOIizOGl22+o4IXIL5DLBLp2aAR5K/G/Zgmtx6gXFBxPa4gb+OxolzZ6gKTqbhIIXmSq
         uwp7c+T6gykjOeowbZZOypk1aRY5X2ZGw3BKu6KctY+ZYXyTl06xRDIKENmu/oXdyqMe
         ANnA==
X-Gm-Message-State: AOAM533l33iVDEDmmLncjEyZYWauB6gzIL4UA6MhywwjWABIvJW+XPla
        VxfWvtkE2TFWBJw6TMOnxAXC0+6rOCBGkI47GhSB9g==
X-Google-Smtp-Source: ABdhPJyQDKTrL6+M1EYqgNcHeEbBrBLAxm0wfWqQmlyuqUTky28XVq0mnhNe79NFFQEHtwrvC5tKKMx2Rj7DyjgKd5U=
X-Received: by 2002:adf:81c8:: with SMTP id 66mr27603502wra.348.1593016778290;
 Wed, 24 Jun 2020 09:39:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200622100520.143622-1-darekm@google.com> <ca796f62-7d1f-3391-0373-ec9b98b1c47a@xs4all.nl>
 <CALFZZQHuqx+H=7pd9t=XYWqKppMzze0XsXwRVA5kLZfwWYLmKQ@mail.gmail.com> <CABXOdTfyzKtT4jWLhBwV5ecG1Bc2g88vUfKB6OspmF0mTafxpA@mail.gmail.com>
In-Reply-To: <CABXOdTfyzKtT4jWLhBwV5ecG1Bc2g88vUfKB6OspmF0mTafxpA@mail.gmail.com>
From:   Dariusz Marcinkiewicz <darekm@google.com>
Date:   Wed, 24 Jun 2020 18:39:25 +0200
Message-ID: <CALFZZQHsDV9XPyeJ4_NJ=FHF3LSk4j0aMWF3fbvDEdUrs_0O1g@mail.gmail.com>
Subject: Re: [PATCH RESEND] media: cros-ec-cec: do not bail on
 device_init_wakeup failure
To:     Guenter Roeck <groeck@google.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Lee Jones <lee.jones@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Dariusz Marcinkiewicz <darekm@chromium.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi.

On Wed, Jun 24, 2020 at 4:45 PM Guenter Roeck <groeck@google.com> wrote:

> > On Mon, Jun 22, 2020 at 12:23 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> > >
> > > > Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
> > >
> > > This can be CCed to stable, I guess?
> > >
> >
> > That issue is not a recent regression but has been in there since the
> > very beginning.  So it might be argued that is it not severe enough to
> > warrant cc'ing stable. Happy to do that anyways if you think
> > otherwise.
> >
>
> Confused. Internally you would like to have this patch applied to
> chromeos-4.4. Here you suggest that it may not be important enough to
> apply to stable releases. Which one is it ?
>

It affects us on 4.4, hence the backport to 4.4. I have nothing
against this being merged into the mainline stable. I simply wasn't
sure if that should be considered severe enough to be backported
there. As said before, I am happy to CC this to stable.

Thank you and best regards.

(apologies for double post again)
