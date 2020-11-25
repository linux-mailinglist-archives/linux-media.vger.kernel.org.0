Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D52E52C3A28
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 08:33:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727352AbgKYHco (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 02:32:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727247AbgKYHco (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 02:32:44 -0500
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAF1EC0613D6
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 23:32:43 -0800 (PST)
Received: by mail-ej1-x641.google.com with SMTP id z5so1592168ejp.4
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 23:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z0kiqVefEuj1c1EK0YD5O7NC2u+drbKVj6pcJlOBK3w=;
        b=OFT2Hs8UzKOKtSOzYf/ERtas1sZ0mVebhVkiTnGj2k/sH24GLOCfOTd3/9d0Lpq1Gj
         ZwfDKcVdxAd/OKobI4rXJ0hBRNGhfLb0nxKnPIpQpeuQElV9hQpvSZx1BL4XKlAmsQLA
         UkO1UUiWf3yaF/Oq6aLm8vtXwVYRuv0r9oXgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z0kiqVefEuj1c1EK0YD5O7NC2u+drbKVj6pcJlOBK3w=;
        b=OZai9/bjmqjdESVG4csVZPXbhktQxrODgUCgZ4HjfImorLnRxiIBAXsFglwpsDuWox
         fR5k+mnfUhTTqYdkL1h30adbL1rzweYJFheUyvKeGQzlnzYz1HUnUPrTGYweWm+ESifv
         XMSntLqt4GwUTZEknRhV+pdiJkpfDy91YS5jtCuiwuvQeOuO9/93VSaA29syZBVCLaSt
         sL832oaWoqTH3rYka8qFvslpOZFu6krkMk3zf9Pbgdx9n77ShzSGJhC5CWD1LG12//zI
         8pMd8H5FjaL3ZDA+aC1bxQQnF1QO02igde8qKq3nFyhVQOgXz/pqCS9l54Vcvcdto5g+
         dv3w==
X-Gm-Message-State: AOAM530uJ4Z5ulfsUg6ffmcyRHFcY6Vq18sDXNgdUST6QDj0JRMW4RgI
        aziMSHmkwXztJk+JXJ1GvqBfGYj1FbjcFg==
X-Google-Smtp-Source: ABdhPJzxkgRO1cqLJ/DOgrYcWDIwz3zibOZ8FHUlV8wKlEpfdfN4voHe63Y1uqtDZ9aUgEE3xZZL0A==
X-Received: by 2002:a17:906:2452:: with SMTP id a18mr2017949ejb.66.1606289561939;
        Tue, 24 Nov 2020 23:32:41 -0800 (PST)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id p91sm678102edp.9.2020.11.24.23.32.40
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 23:32:40 -0800 (PST)
Received: by mail-wr1-f54.google.com with SMTP id m6so848458wrg.7
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 23:32:40 -0800 (PST)
X-Received: by 2002:adf:ed11:: with SMTP id a17mr2449865wro.197.1606289560075;
 Tue, 24 Nov 2020 23:32:40 -0800 (PST)
MIME-Version: 1.0
References: <20201116155008.118124-1-robert.foss@linaro.org>
 <cf0b935d-3ccd-8360-1b52-89fab0b181eb@linux.intel.com> <CAG3jFyssMMHpi4WgWmeDjuVYKz12UwJoBT0WoOsdB4PZxnuqSw@mail.gmail.com>
 <e132769f-cfb5-141a-6cd1-603d82a92b9e@linux.intel.com>
In-Reply-To: <e132769f-cfb5-141a-6cd1-603d82a92b9e@linux.intel.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 25 Nov 2020 16:32:28 +0900
X-Gmail-Original-Message-ID: <CAAFQd5A=kYufStO7ni4j6f+grDpsoigskcj1LdiG9NRN=cvviQ@mail.gmail.com>
Message-ID: <CAAFQd5A=kYufStO7ni4j6f+grDpsoigskcj1LdiG9NRN=cvviQ@mail.gmail.com>
Subject: Re: [PATCH] media: ov8856: Remove 3280x2464 mode
To:     Bingbu Cao <bingbu.cao@linux.intel.com>
Cc:     Robert Foss <robert.foss@linaro.org>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ben Kao <ben.kao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

On Wed, Nov 25, 2020 at 1:15 PM Bingbu Cao <bingbu.cao@linux.intel.com> wrote:
>
>
>
> On 11/24/20 6:20 PM, Robert Foss wrote:
> > On Tue, 24 Nov 2020 at 10:42, Bingbu Cao <bingbu.cao@linux.intel.com> wrote:
> >>
> >> Hi, Robert
> >>
> >> I remember that the full size of ov8856 image sensor is 3296x2480 and we can get the 3280x2464
> >> frames based on current settings.
> >>
> >> Do you have any issues with this mode?
> >
> > As far as I can tell using the 3280x2464 mode actually yields an
> > output resolution that is 3264x2448.
> >
> > What does your hardware setup look like? And which revision of the
> > sensor are you using?
> >
>
> Robert, the sensor revision I am using is v1.1. I just checked the actual output pixels on our
> hardware, the output resolution with 2464 mode is 3280x2464, no black pixels.
>
> As Tomasz said, some ISP has the requirement of extra pixel padding, From the ov8856 datasheet,
> the central 3264x2448 pixels are *suggested* to be output from the pixel array and the boundary
> pixels can be used for additional processing. In my understanding, the 32 dummy lines are not
> black lines.

The datasheet says that only 3264x2448 are active pixels. What pixel
values are you seeing outside of that central area? In the datasheet,
those look like "optically black" pixels, which are not 100% black,
but rather as if the sensor cells didn't receive any light - noise can
be still there.

Best regards,
Tomasz
