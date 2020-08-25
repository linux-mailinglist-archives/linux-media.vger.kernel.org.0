Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2414F2514F0
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 11:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728361AbgHYJC0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Aug 2020 05:02:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728272AbgHYJCV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 05:02:21 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BFC1C061574
        for <linux-media@vger.kernel.org>; Tue, 25 Aug 2020 02:02:20 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id j7so10950876oij.9
        for <linux-media@vger.kernel.org>; Tue, 25 Aug 2020 02:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ecZcPI7/Sf2QaHnt5CgELAxXcrAGGkNqcsMqK1lVfB4=;
        b=xHKPdF2fYixOmSv2xi/QN72gXFaQ62tcmQeB1kihvvEW7ovkTOv3AxUEXQFIM/kk34
         uaNMWV6BbQQvT6tp1eU8hYpjYUAxYWbxh01HVE06HK3fvSee7t85yr3WF7sXkoADaX8s
         Bj2Lt0BhWUAf6ofcwjRW+vyB2/cPsu3Mv9C3pYe4n5tpU+mUZ/jn2SgxGWzyE9ntwcT9
         v4wxmTKXS9cRIYI9jSRzvGtGefk7QxXy9kBgvFI/i7Sd6RGYfnzHeZ2RR4xnJpz6zYnT
         JEww+u6lHVdVIX2rX5bU28FzA4DL/fCXh9ZyMCwb+dFg8Z+8dB6WPCicc2SE5cqH3h2Y
         GE0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ecZcPI7/Sf2QaHnt5CgELAxXcrAGGkNqcsMqK1lVfB4=;
        b=ip5pyfF8b1XodjXLTAnRf37Jw/facjtSQQNLce1wFlVnztmK8Vxy+40ziyUTmyay4U
         MhyjLpVcDtVgwAo0zYEIYJGM3orjZLmaBFc39QcmCfUbztoO/6OCLk9Vw8BJG+vul5Kx
         iQQjZN3jYv5QVd/KzZ8b31TcVQ8yRP/Sf7Y9Q/Nbt+ExODJgNNBkeY5om1idxmdiKlE/
         fQv/xGOtrw+aUnuRIhBNm1hNvFY4C08Xm3fPYZ3GFQJmiXjAWbPgNH1K89orB+lPtQp/
         JJ/yg/XGDUr9zw//Tf0qGv//V2HO4G7pKw5cjDYPxCdyeufUgk2cak3uYYcnBjdN2jFg
         MOYw==
X-Gm-Message-State: AOAM533t8HX/gfDE8XJ8MjzGJ9d46rkvDBXR0ozPuFSATRX4/IASxHJ1
        YqdEy7nTaB6Wxrz2kqZgz5vw43ux/aK2RCksr2O7Aw==
X-Google-Smtp-Source: ABdhPJwwiFD4pBHewOtnzV/X5MtjNH663zCRpk0ncltSp+zcIRGso9TBIJYwFINA0I6H+hJQg4l8D4OJycQ/WqLqmYs=
X-Received: by 2002:aca:d8c5:: with SMTP id p188mr422064oig.47.1598346139780;
 Tue, 25 Aug 2020 02:02:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAHUa44FrxidzSUOM_JchOTa5pF6P+j8uZJA5DpKfGLWaS6tCcw@mail.gmail.com>
 <20200824211125.1867329-1-jhubbard@nvidia.com> <20200825083204.GA2068961@jade>
 <1f111bb4-6e93-93d5-66ff-b9d4d456140f@nvidia.com>
In-Reply-To: <1f111bb4-6e93-93d5-66ff-b9d4d456140f@nvidia.com>
From:   Jens Wiklander <jens.wiklander@linaro.org>
Date:   Tue, 25 Aug 2020 11:02:08 +0200
Message-ID: <CAHUa44FnAmK-Qm+AQ8SqqHPZSRrmp4oOichp5yO212b3y_LAJg@mail.gmail.com>
Subject: Re: [PATCH v3] tee: convert convert get_user_pages() --> pin_user_pages()
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     arm-soc <arm@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>,
        "tee-dev @ lists . linaro . org" <tee-dev@lists.linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org,
        DRI Development <dri-devel@lists.freedesktop.org>,
        linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 25, 2020 at 10:54 AM John Hubbard <jhubbard@nvidia.com> wrote:
>
> On 8/25/20 1:32 AM, Jens Wiklander wrote:
> > On Mon, Aug 24, 2020 at 02:11:25PM -0700, John Hubbard wrote:
> ...
> >> OK, one more try, this time actually handling the _USER_MAPPED vs.
> >> _KERNEL_MAPPED pages!
> >>
> >> thanks,
> >> John Hubbard
> >> NVIDIA
> >
> > Looks good and it works too! :-) I've tested it on my Hikey board with
> > the OP-TEE test suite.
> > I'm picking this up.
> >
>
> Great! I see that I have, once again, somehow doubled up on the subject line:
> "tee: convert convert ...". This particular typo just seems to stick to me. :)
>
> If you get a chance to fix that up by changing it to just a single "convert"
> I'd appreciate it.

Sure, no problem.

Cheers,
Jens
