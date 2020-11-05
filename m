Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA8F92A7857
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 08:53:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbgKEHxw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 02:53:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726152AbgKEHxw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Nov 2020 02:53:52 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2927AC0613D2
        for <linux-media@vger.kernel.org>; Wed,  4 Nov 2020 23:53:52 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id 11so567716ljf.2
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2020 23:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uWxXaFjaX2JSFXvoISaJ2nJGcPKFBfvWFO1ioi84K5o=;
        b=LJEtMmMPnPNPuMOUjflAShtf/tGL+Srg3vIXk+Lh9SsAUj7yk2rRC4aN2nBaIEeBaH
         7srSBNMaaQU4FOWJVKx5aYqjKLliAMLz9fH3ilnVAdUb8Aw4B2moCRMuzCCkF9X2ZKR7
         idPu03npS0S+dIGpYKBd1q5mep93sRahA0zoeHLrMJpedNtAyosrk4IeNLEFVhV84rRi
         YMtdyjACyWB3SkSjjAC+T4HWDmo+63ag4qIcV9tlCSWgI4nUnkUPHHXQ9LQNoh5P1xK1
         X5oXHgtp+BLLQj0ouYR5zkyglNR0i1dk6IyQB642/q+WU6l+tApxCj0NZaZpp3Ktyd5X
         zHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uWxXaFjaX2JSFXvoISaJ2nJGcPKFBfvWFO1ioi84K5o=;
        b=VuUzYjfelih52soFvUDgKTRTtq3rk+UYcL0/cc64RiLDHW7dPfi1POQAkO9YgYsu/H
         Z+KRiuksRuRmg3FbRflehlHMDD52EyD+4Tnj5DISLSfBv91qFOgBqlDVdlA8IXfn2IW9
         CSzVSJqCyFObsrhrO4XWaH7QtD4kA9sb2UOXQvjf+gYTWf6Zigj4QzAuV8QG9ylqAmxc
         +IiA7lFCscHrip28ZnC4JrVXOIILjF/3SYJFBhXVHc6EBmLaCUXgSZzcDh0O+qBSTrau
         KaALjicGXcviL5brFjCW9F84id1ldwGC33wgZsncvJaH2J1ueU9R33Q4w5wtcBryhVNJ
         lReQ==
X-Gm-Message-State: AOAM533A92he4F+p1UbGaROvB0V4za0fxHRaDB53uEbYWDO7C6bLL3+a
        7xKBMOwtESOJ2K7la4Qk7s/dKuA4XVJoCWJthiWJLCxkT1wNmQ==
X-Google-Smtp-Source: ABdhPJxm7yZCg2+JWcvzDpHbnsyXEVmR6Ak6pvhrNxzGAq4WPHDY8br8g2VKo+Vo2nD1GExdkdG3YDlede23s3WS2do=
X-Received: by 2002:a05:651c:1205:: with SMTP id i5mr449252lja.283.1604562830673;
 Wed, 04 Nov 2020 23:53:50 -0800 (PST)
MIME-Version: 1.0
References: <20201030143715.577641-1-narmstrong@baylibre.com>
In-Reply-To: <20201030143715.577641-1-narmstrong@baylibre.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 Nov 2020 08:53:39 +0100
Message-ID: <CACRpkdZnpjas-WYuXhJ_mwCTqTP5DpWHcnNmGpdCQjrr3xGnYg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] media: meson: Add support for the Amlogic GE2D
 Accelerator Unit
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Todd Kjos <tkjos@google.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        John Stultz <john.stultz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Neil,

this is just a drive-by question and I'm looping in Todd in the hopes for
a discussion or clarification.

On Fri, Oct 30, 2020 at 3:37 PM Neil Armstrong <narmstrong@baylibre.com> wrote:

> The GE2D is a 2D accelerator with various features like configurable blitter
> with alpha blending, frame rotation, scaling, format conversion and colorspace
> conversion.
>
> The driver implements a Memory2Memory VB2 V4L2 streaming device permitting:
> - 0, 90, 180, 270deg rotation
> - horizontal/vertical flipping
> - source cropping
> - destination compositing
> - 32bit/24bit/16bit format conversion
>
> This adds the support for the GE2D version found in the AXG SoCs Family.

We are starting to see a bunch of these really nicely abstracted blitters
and other 2D-accelerators now.

Is stuff like Android going to pick up and use this to blit and blend
generic buffers?

Or is this in essence a camera and/or video out accelerator thing?

The placement of this driver in drivers/media makes me think that
it is for cameras or video output, but the functionality is actually
quite generic.

I've been half-guessing that userspace like Android actually mostly
use GPUs to composit their graphics, but IIUC this can sometimes be
used for 2D compositing, and when used will often be quicker and/or
more energy efficient than using a GPU for the same task.

Yours,
Linus Walleij
