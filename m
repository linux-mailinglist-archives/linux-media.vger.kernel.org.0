Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C44C131A879
	for <lists+linux-media@lfdr.de>; Sat, 13 Feb 2021 00:54:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231564AbhBLXxj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Feb 2021 18:53:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229980AbhBLXx1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Feb 2021 18:53:27 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 370F9C061574;
        Fri, 12 Feb 2021 15:52:47 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id g10so1353910wrx.1;
        Fri, 12 Feb 2021 15:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c3J0XcePyleo796OvAaICLfI1i20geRcVa5TsLh1tao=;
        b=Ri4AMW9WYsRMqlRHoKub72GSWBvDgwFPnMTKhWh0wBPrcwosb6T8gdQwPeEAoaopzY
         DlptP0AAw2P9cCAUZBfQXy0zgQBUhVm2BT+zYBRyzNimA6JYxtx2za4t90YXqEycJia4
         dI/ydnuMjPu1bzm7v6CjiTmzrf8Q2oz5nI2H/aGnLFOPDqGEjFMHYFbgV1hNFzSzvmNP
         kj1ECwKHmM8qTmocYLec+Lacd9R19q8aU5n+fKNK14jH9a1sSUD+NAkJk71tIzWRiOHC
         yfL14o71yRL4da7YGU2zrbWX53U1SUU+nhr+9zDSLR/que85rwUbcd3mOhyjj+knnDZy
         ohZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c3J0XcePyleo796OvAaICLfI1i20geRcVa5TsLh1tao=;
        b=Lh4aysQLoJTFYAbvKhFvMbl3jwx0kEs0qjcPCytZclOREYxtNpITrfQjU8gppUZ/1d
         oEs8zRsiFhQcoXtKX2+Itk1RlMHNIReFQ9M8s3HyEZ2CTNzb9PLZ65C0Yg3kVWZvQgXR
         7jT9GxZ7/mQLWxkXZmQtqvQOSNXdTvXUJ2Kiyd2dngM8XOo6kgyEPRtycc8Pq90f1J9X
         wDY8YMd65wjzkSzKXnC4L89Me9wNlrvmktgLF+Yxgq8yBH8XiZ7G8RQKwweOnT4kbcV4
         HCL0VGSxzINwiS1L9FGXXu8LmiPLM4z5FRE08aAm94Q/YwuPoaws8LIiiz0JSF0GOlL4
         nzCw==
X-Gm-Message-State: AOAM530fW1/2SXE3OOiM2y9D/jMxY/7bOUNNRZnAKEbx8ZmoQoO6oVid
        6/pggAO7HpCpEUEFlPsCbS4mDprUotYmE86EINo=
X-Google-Smtp-Source: ABdhPJy5ege6vYLkKFNBg45tfxjKebdizpZt3Rwblyqb6bDBWNW2cRm35aKN8i+fn5joETlGoWPu0tLUHi/KopCNX2o=
X-Received: by 2002:adf:e511:: with SMTP id j17mr6291375wrm.251.1613173965866;
 Fri, 12 Feb 2021 15:52:45 -0800 (PST)
MIME-Version: 1.0
References: <20210203163348.30686-1-TheSven73@gmail.com> <804285cff81878a2c188d1b823182114f891ca38.camel@ndufresne.ca>
 <CAGngYiWt9Q4jWksiniC6vqUw29L3mOFuQpw7Dz_BK9Ye9FbQ1Q@mail.gmail.com> <20210211143233.GA1360@pengutronix.de>
In-Reply-To: <20210211143233.GA1360@pengutronix.de>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Fri, 12 Feb 2021 18:52:34 -0500
Message-ID: <CAGngYiWAohHXYPfd5NJc4URVuMA4GP01jvRV78uM5P+H7zKx-A@mail.gmail.com>
Subject: Re: [BUG REPORT] media: coda: mpeg4 decode corruption on i.MX6qp only
To:     Philipp Zabel <pza@pengutronix.de>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
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

Philipp, Fabio,

I was able to verify that the PREs do indeed overrun their allocated ocram area.

Section 38.5.1 of the iMX6QuadPlus manual indicates the ocram size
required: width(pixels) x 8 lines x 4 bytes. For 2048 pixels max, this
comes to 64K. This is what the PRE driver allocates. So far, so good.

The trouble starts when we're displaying a section of a much wider
bitmap. This happens in X when using two displays. e.g.:
HDMI 1920x1088
LVDS 1280x800
X bitmap 3200x1088, left side displayed on HDMI, right side on LVDS.

In such a case, the stride will be much larger than the width of a
display scanline.

This is where things start to go very wrong.

I found that the ocram area used by the PREs increases with the
stride. I experimentally found a formula:
ocam_used = display_widthx8x4 + (bitmap_width-display_width)x7x4

As the stride increases, the PRE eventually overruns the ocram and...
ends up in the "ocram aliased" area, where it overwrites the ocram in
use by the vpu/coda !

I could not find any PRE register setting that changes the used ocram area.

Sven
