Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93C1730783A
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 15:37:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231564AbhA1Og3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 09:36:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231489AbhA1Og0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 09:36:26 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03AD9C061788
        for <linux-media@vger.kernel.org>; Thu, 28 Jan 2021 06:35:45 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id p21so7853669lfu.11
        for <linux-media@vger.kernel.org>; Thu, 28 Jan 2021 06:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4HZ6vN2eEe9xlgJg6Acm1pXtbaRzCfTxTjwFlP4TFpU=;
        b=Dh6TtiOQldz7ctr2Vjc++l9sPFfbz1uIReK71LDhdAY7CMAfgSiOEAqExkoDQ4raee
         yiBKxu4aZyluG12epsDcVxU1V39k8CXSIeMG/3bOPvOWIoLFk8h0swTVl/glwTbkpjmk
         y56Bs8b22Ho+WA8dKqByZ9YpfuqOno7Df/De+xGLZEw6jy4cAjXsHChNzqt//SrwbPv/
         MFHIA7jAk/+jRjq2aXWCXav5v0/3LTauDbWHHZq5QthKDu2DlkOk0hEKjvSEHG23GPwW
         gggykyjVJ2IFuEciGMa8k0nx5G7Ug4zbvGdN9ksTDPu6JgRXIwl+ERrbHJbY6IRIJlWM
         IF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4HZ6vN2eEe9xlgJg6Acm1pXtbaRzCfTxTjwFlP4TFpU=;
        b=hRuEt4jdNmarZhESnbxKb8w8PItAP9+7KmKmrrgrnBqrpN7x27sh0R8GfcIwvHtI8B
         iCshhirhbkUYdw4BqhKZyS762rJcrQCRwLEEXtpKnI9zrl1nmY4e6AuTGROGvJNerkJO
         C3tHgHbwEfFEvu7LTFZz9gDYSZ94g4aHnb11PJxtf61z9hykFAfFraFUhUbqp5gARGc1
         P2IsXUHewRV8djZ9iaHuVppLRJuCrZ84B8bV7MD79H42T95qHPtgf9MlO9eWhNdCOO4d
         spnhmzdVbQsFtmPRbi3XNUy0tLbethnUsCyc+wzsm7ox7ESeh6nkJCkMu0XnwAq5KKDw
         /LoA==
X-Gm-Message-State: AOAM533Wu7syEQierh5TmkpzqxOtbIsNNLmBdjfTY6gCH/JNpeWsn3sc
        gSqRX0RuRYC++Gxysf4IwCUig/rceE6u7xS9IRME/g==
X-Google-Smtp-Source: ABdhPJwqwI0JXhluBVDgebMB/GJcLtoIuHaluDFZq7+Xj1RNJkY2OfC2kWQ4Clsu3GEZqQhCkC1nm3F37DJn50NMaO8=
X-Received: by 2002:ac2:5d51:: with SMTP id w17mr5544918lfd.343.1611844543382;
 Thu, 28 Jan 2021 06:35:43 -0800 (PST)
MIME-Version: 1.0
References: <20210126204240.418297-1-hridya@google.com> <YBFXPbePURupbe+y@kroah.com>
 <CAO_48GHrpi9XxPhP2evwH_ZJmbVSWqxCvsYg6S2Syh-mrWBHzA@mail.gmail.com>
 <c0684400-c1e2-0ebd-ad09-cb7b24db5764@gmail.com> <CAO_48GGsOTLdqAQMO9vrLtWAKG6spByMC-GXwDv_f3ENvpemfA@mail.gmail.com>
 <Fu3J-fHQvkd_umZraMnhxQhFJR_JCDmgUssMBA4GJgRwo4UpIPKvVSh51Os9FQkABkhSL6tmEAV4vwBZa7hFWFTgujmjaBmrgqJJ75KM8ZU=@emersion.fr>
In-Reply-To: <Fu3J-fHQvkd_umZraMnhxQhFJR_JCDmgUssMBA4GJgRwo4UpIPKvVSh51Os9FQkABkhSL6tmEAV4vwBZa7hFWFTgujmjaBmrgqJJ75KM8ZU=@emersion.fr>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Thu, 28 Jan 2021 20:05:32 +0530
Message-ID: <CAO_48GEzi2b5M8Gv2E2L1s76VcPksA812ZqY1ihbpxkDkwb5_A@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v3] dmabuf: Add the capability to expose
 DMA-BUF stats in sysfs
To:     Simon Ser <contact@emersion.fr>
Cc:     Christian Koenig <christian.koenig@amd.com>,
        Android Kernel Team <kernel-team@android.com>,
        kernel test robot <lkp@intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        Linaro MM SIG <linaro-mm-sig@lists.linaro.org>,
        hyesoo.yu@samsung.com, Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Simon,

On Thu, 28 Jan 2021 at 20:01, Simon Ser <contact@emersion.fr> wrote:
>
> On Thursday, January 28th, 2021 at 1:03 PM, Sumit Semwal <sumit.semwal@linaro.org> wrote:
>
> > Since he didn't comment over Hridya's last clarification about the
> > tracepoints to track total GPU memory allocations being orthogonal to
> > this series, I assumed he agreed with it.
>
> IIRC he's away this week. (I don't remember when he comes back.)
>
> > Daniel, do you still have objections around adding this patch in?
>
> (Adding him explicitly in CC)
Thanks for doing this!

Best,
Sumit.
