Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F7F520738C
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2020 14:40:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390707AbgFXMkm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jun 2020 08:40:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389336AbgFXMkk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jun 2020 08:40:40 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2FAAC0613ED
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2020 05:40:39 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id l10so2120529wrr.10
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2020 05:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=czN3cUkpv1kQMmkdRcQEF5/Tglr7qZIFUxQDipDH7uQ=;
        b=is0Z0ODH/O+1Z8kGKxdQpfE/eHMOamZ8WM08/XUTs5fTahr1lRWMbYNhrSx36JEx80
         jm0SXM7lP7FJ6urZbI0ZeedHteSfUrKXctd4Z0u4EhEwVVG0DUNLXTfgnDKfdrqXB9Ok
         IxHbspUT7ImzGzKy8sGYElGZiW8WRf+uGr1YDGfpL83/FeNEzdTk8qofPuTOm9ocnmVR
         Z+MjcK6Y6qa7sBYxHRlf7+Ki2HjJYs+nuQ1FHfFBb+Vg8ac51Vnf6v25ARlO+WxZWnk1
         gFACYtSzNFbiEqF05aJEIEdM84r2Ut7VuWGakTD1x9Fng6RsLGO4TTO3vX14r1QrrXoW
         6U7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=czN3cUkpv1kQMmkdRcQEF5/Tglr7qZIFUxQDipDH7uQ=;
        b=tvbaiRHtDzdqoHN7dM6pjk4reMJF2XBO0oaQi4QkAowsz0+4xgehb1GJUGlQHsd9qb
         eiEbgBhKQcAmfgV6ogYKInE3bd3aZ+1U+c/zbzTow2+IAW+9k1Bc6Q/ocQVJ709snmde
         rWhsBIXhJMqoa9zQyxpC540wjaK7cmHkcNR7hFIQdrOJPputCOgi6TxZiY8SSvQiLIkk
         B2jp1SunA6PLloG1DE36fzsMOc6aA3xDQSj6CkcrliHpaQ88fSUYt8pNGFmiypW26uV5
         pNhmQlj/XxXNGSOuDmr7gT/Xit1FxmYEEUEvjd/mfbfcmR3Fg6kSJCK2B4MCYZfd1nDp
         Zk+w==
X-Gm-Message-State: AOAM5326jXNKcjwixZOkgK/xdjj6o3UGyvYumU+V9qep+//ek1foM5FR
        8CVSa14NdDQ81I7QnTe+eV+kbdh7BWfsCWRl3S2v7g==
X-Google-Smtp-Source: ABdhPJxiHs8qC0MdyilZ/rFdbQ/99kxjF7AUJ3DV0kzlDEUC72lAGx/Ou3kmkDtmsJQ13jfoLnylFsg8pzdKioVquDk=
X-Received: by 2002:adf:81c8:: with SMTP id 66mr26492530wra.348.1593002437120;
 Wed, 24 Jun 2020 05:40:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200622100520.143622-1-darekm@google.com> <ca796f62-7d1f-3391-0373-ec9b98b1c47a@xs4all.nl>
In-Reply-To: <ca796f62-7d1f-3391-0373-ec9b98b1c47a@xs4all.nl>
From:   Dariusz Marcinkiewicz <darekm@google.com>
Date:   Wed, 24 Jun 2020 14:40:25 +0200
Message-ID: <CALFZZQHuqx+H=7pd9t=XYWqKppMzze0XsXwRVA5kLZfwWYLmKQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] media: cros-ec-cec: do not bail on
 device_init_wakeup failure
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
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

Hello.

I realized that I sent the previous answer using HTML, and as a
consequence it was blocked from mailing lists. Sending it again
(apologies for double posting).

On Mon, Jun 22, 2020 at 12:23 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 22/06/2020 12:05, Dariusz Marcinkiewicz wrote:
> > Do not fail probing when device_init_wakeup fails.
> >
> > device_init_wakeup fails when the device is already enabled as wakeup
> > device. Hence, the driver fails to probe the device if:
> > - The device has already been enabled for wakeup (via e.g. sysfs)
> > - The driver has been unloaded and is being loaded again.
> >
> > This goal of the patch is to fix the above cases.
> >
> > Overwhelming majority of the drivers do not check device_init_wakeup
> > return value.
> >
> > Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
>
> This can be CCed to stable, I guess?
>

That issue is not a recent regression but has been in there since the
very beginning.  So it might be argued that is it not severe enough to
warrant cc'ing stable. Happy to do that anyways if you think
otherwise.

> Can you provide a Fixes: tag as well?
>

Done, submitted v2 with that a couple of days ago.

Thank you and best regards.
