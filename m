Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C0F93112F8
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 22:01:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233643AbhBETSA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 14:18:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233772AbhBETQt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Feb 2021 14:16:49 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43EB8C0613D6
        for <linux-media@vger.kernel.org>; Fri,  5 Feb 2021 12:57:52 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id s18so9398598ljg.7
        for <linux-media@vger.kernel.org>; Fri, 05 Feb 2021 12:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UUDqQnCKLG8KlWlCervJ1Pe6jRg7p+GmbjcM8bmlEX4=;
        b=hTuP4Xe0dt/q3oqh3WxdK8WGoQT5bwOWppy5lDWL0FJ79OTi34QaAq8VYfekwNprHi
         EDjGv5SLiNbttTG655zTOIlrIIHFuaJSq9aH08B5xUiltpXV8YGSBlyoE46ETKttc7CU
         NsDx4vC4wV2WJ3/kUgTEuUHNC7jKOvtRUgyuTeA1OotbHdC2YE2xg/2X9A1hhKDya3nc
         ByKBhpokGuNoQKZ6EhdpW9y+mODbabMBJ0VYWswu1rVFb+wDlJFxApcm7nH6lLmA+bwE
         EOLx0jc0appDILj7MhFkuYQPHEBqKMJuKlR5Ii6rQA+pK8PEyTmH+0Vg3n7BT/uVVuqg
         rg9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UUDqQnCKLG8KlWlCervJ1Pe6jRg7p+GmbjcM8bmlEX4=;
        b=WOCGm9Yy7AHGU5A07C1qDIbsQWCNg7ZYnLqmqhERvWIOJCF3duguHQCsSM4RpvBXfx
         WQ+KLYA0r2LbYTVFSLa5OCHJuAmsbVo7/FhM56xk0dPfXVqvFjSoOq8ICAcBjw8jqTG5
         4vWOkYv3oS59vP1bMvgOncH73UDSUAMc+XXlK1Cl781uMawpzaxzPltKcrjADLl5GxMk
         sv1jz0Onc0DjMRYmCgjv8EgKR8U9Xb1iVLB4vsC0qDs3FA0a/jU9OEK0AfhIwy3XRAlT
         QhEw2mAWGl13iO4Xq6AB7Mfo/7LOVyc0CvZPEoBHvFcAcNhhE6ej3M1MOZnzUeqv3O12
         sD5g==
X-Gm-Message-State: AOAM533mugMvZsfG3qt9F0gSw5BBRLNhTqtaHyN41SKmNTGH2eD9Gk/z
        3/yeBQkjIwp55uWLTzlsGN29hR+ou3LYUmB7Io6H4A==
X-Google-Smtp-Source: ABdhPJxLRfs8FH8bDIRywnbs42yMG9zKgx3Ds5nJMGF16QcPzaNxGXYCaRQqdYXCd6YTt9yxw5HXYLW3omFCA4RPLzI=
X-Received: by 2002:a2e:3018:: with SMTP id w24mr3858868ljw.333.1612558670803;
 Fri, 05 Feb 2021 12:57:50 -0800 (PST)
MIME-Version: 1.0
References: <20210205080621.3102035-1-john.stultz@linaro.org> <0864e2a8-3a44-e7db-828f-abdac7c64471@amd.com>
In-Reply-To: <0864e2a8-3a44-e7db-828f-abdac7c64471@amd.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Fri, 5 Feb 2021 12:57:38 -0800
Message-ID: <CALAqxLXfK0eYGXDqsyfvMUzu6dxOb56WOe07ZsTayi3j1bT51g@mail.gmail.com>
Subject: Re: [RFC][PATCH v6 0/7] Generic page pool & deferred freeing for
 system dmabuf heap
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>,
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Feb 5, 2021 at 2:36 AM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
> Am 05.02.21 um 09:06 schrieb John Stultz:
> > Input would be greatly appreciated. Testing as well, as I don't
> > have any development hardware that utilizes the ttm pool.
>
> We can easily do the testing and the general idea sounds solid to me.
>

Thanks so much again for the feedback!

> I see three major things we need to clean up here.
> 1. The licensing, you are moving from BSD/MIT to GPL2.

Yea, this may be sticky, as it's not just code re-used from one dual
licensed file, but combination of GPL2 work, so advice here would be
appreciated.

> 2. Don't add any new overhead to the TTM pool, especially allocating a
> private object per page is a no-go.

This will need some more series rework to solve. I've got some ideas,
but we'll see if they work.

> 3. What are you doing with the reclaim stuff and why?

As I mentioned, it's a holdover from earlier code, and I'm happy to
drop it and defer to other accounting/stats discussions that are
ongoing.

> 4. Keeping the documentation would be nice to have.

True. I didn't spend much time with documentation, as I worried folks
may have disagreed with the whole approach. I'll work to improve it
for the next go around.

Thanks so much again for the review and feedback! I really appreciate
your time here.
-john
