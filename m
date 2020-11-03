Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B45282A415E
	for <lists+linux-media@lfdr.de>; Tue,  3 Nov 2020 11:12:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728067AbgKCKMV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Nov 2020 05:12:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728069AbgKCKMP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Nov 2020 05:12:15 -0500
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CA69C061A47
        for <linux-media@vger.kernel.org>; Tue,  3 Nov 2020 02:12:14 -0800 (PST)
Received: by mail-il1-x142.google.com with SMTP id p10so15614492ile.3
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2020 02:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b9Ktpm35fisVuHEhjhohgaqyboE8BmrrMoCITk9vnK8=;
        b=0kZJ8Rb9+0/H3MVDUevyCTWAc1pKYDKmZzYacQKCMmC/UQ66qmBgifq30qeC2iVztI
         ATPY1knKGSXDzJ6+Nm3tm3Ffn81WkUy/sBCmPfD94FibScrq8/Ui+9TUYldHJ7pcnk1t
         gx+nhhl2zwwSRNNGE6X3g+mK8ICIfWN15TzWFBAm2Ac+Fnp/Nc7mvMvQxol3TgeHLuHe
         fB2HlcDfVoQUKXEDUTDlyUi1MwQ1IJbHWYhRPhxFdctoJ/ps1THqNVawMwUkgd/uHgQv
         AYOBJizY9XV1L84dWspkXE7W+jTkhJPV/Ws9WaUAfWMNJujPYu+ExPkpZXByTNBy8wKU
         VaOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b9Ktpm35fisVuHEhjhohgaqyboE8BmrrMoCITk9vnK8=;
        b=CIeduWMB6+LZH/a1NYAfo6u9dpIQtda08mCyaWvY0VxVta55nBRQpPa4Wpe6CtUSt5
         thLM9WyjzQhR1Zn7J1I/yd6TVxKYpFv0Admliyy6uXoNp04XVQk7ASLOyOGKbURTxPWz
         cpD7fFzsdzVQUuaFPQVyYfDUYe5zeQcKGEuAyiRwsaYUw0lRm6NTeN+As+0FordqoAXh
         jnn4Y0Lf0MevGOrswmyiy3oDJoQaHoAUmvRtV8mKuxDtuHEJgUwa4C92ifTMUwGtas8d
         4SBdWU+TbDjdEm1Smb5zi08aRFKhFD6afb5VM9+eQHeqqMYd2rr2LS68fbPEuMRAunRw
         AIHw==
X-Gm-Message-State: AOAM530OuOoJBoXtAKPG7OcQoWUAwmTrvshBNolljYVuYO9JIblqj6eP
        IDL+vFtKLMoETbJqBcVrn4B61qLW0vj8yxnFAaR8mQ==
X-Google-Smtp-Source: ABdhPJxXaKRnidyqbx6iUG254lVJzvxaSAJ3Y8t7tBOtYCNJcNKDXTe4r/tIo6bcU8qIdoqImm6tntmYdwdU1LT5yRY=
X-Received: by 2002:a05:6e02:926:: with SMTP id o6mr14285653ilt.287.1604398333472;
 Tue, 03 Nov 2020 02:12:13 -0800 (PST)
MIME-Version: 1.0
References: <20201102152037.963-1-brgl@bgdev.pl> <21d80265fccfcb5d76851c84d1c2d88e0421ab85.camel@perches.com>
In-Reply-To: <21d80265fccfcb5d76851c84d1c2d88e0421ab85.camel@perches.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 3 Nov 2020 11:12:02 +0100
Message-ID: <CAMRc=Me4-4Cmoq3UdpYEEhERP6fvt97bEJsZYhrcFSQf+a_voA@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] slab: provide and use krealloc_array()
To:     Joe Perches <joe@perches.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Tony Luck <tony.luck@intel.com>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        linaro-mm-sig@lists.linaro.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-edac@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
        netdev <netdev@vger.kernel.org>, linux-mm@kvack.org,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 3, 2020 at 5:14 AM Joe Perches <joe@perches.com> wrote:
>
> On Mon, 2020-11-02 at 16:20 +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Andy brought to my attention the fact that users allocating an array of
> > equally sized elements should check if the size multiplication doesn't
> > overflow. This is why we have helpers like kmalloc_array().
> >
> > However we don't have krealloc_array() equivalent and there are many
> > users who do their own multiplication when calling krealloc() for arrays.
> >
> > This series provides krealloc_array() and uses it in a couple places.
>
> My concern about this is a possible assumption that __GFP_ZERO will
> work, and as far as I know, it will not.
>

Yeah so I had this concern for devm_krealloc() and even sent a patch
that extended it to honor __GFP_ZERO before I noticed that regular
krealloc() silently ignores __GFP_ZERO. I'm not sure if this is on
purpose. Maybe we should either make krealloc() honor __GFP_ZERO or
explicitly state in its documentation that it ignores it?

This concern isn't really related to this patch as such - it's more of
a general krealloc() inconsistency.

Bartosz
