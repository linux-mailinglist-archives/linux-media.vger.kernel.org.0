Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCD132FEC92
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 15:03:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730743AbhAUODN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jan 2021 09:03:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730845AbhAUOBU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jan 2021 09:01:20 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C964C0613C1
        for <linux-media@vger.kernel.org>; Thu, 21 Jan 2021 06:00:39 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id q12so2601924lfo.12
        for <linux-media@vger.kernel.org>; Thu, 21 Jan 2021 06:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K8BMXTeaE3oPt4xC0UBSh95/rbcE7z2V9jAZrbMx+6I=;
        b=JmQnXe77uGNKzuD1/lCSiAM+GxZ/LyvZQ/+WJoy6KLDHxuOJEFqeXyMCLqhVbseWbx
         GB4OSylMqZtGMnS6vf4AbMMJ2kdewkkZ7kJr7mGNuKnPabc1bMeHMnUONmA22fYSl5h4
         Fwt3KlQF2R6Z0FQrQc8VhumBj4L6uhgV4VZwwUG3ty3gykgotRjSZjJi0dUpecc9letY
         /Uxyuv/0aOti9kVabV9mU0yZrDaOrVCZx4vd3VNHL+HE0GknZttr+BbiU64F0bHwsYbn
         N40zDRQlg8M2vSJxC5Miv9xKgZHD3Kz5wdk7XokP5XkNkFzHiKNs9X1uLfuIX/5rucC9
         0Rug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K8BMXTeaE3oPt4xC0UBSh95/rbcE7z2V9jAZrbMx+6I=;
        b=psuf31rSWSnDNAFSFiA5/0dKcvpCLR85dqezKDFZRgCu2oak0+qnGSCz91vPIEdy+N
         0e0P+tlJgcOXC6vSRiSnRhCt4JE2ngRTnh2xSF/H1EiMq+5A9xFSbGxGEpgmme8qxLfm
         ffEPecUMaj16mLdJB/tHauBgn1nqwSXUQ1gQuaOgEmQqVdNd5A7UCcDYqLVkRlIa6xTX
         rGjQlXBscmLXad1iZ02c9EY1inpvZ1NIq/VoL5KHYH1TvskDfZ0J1+NQ2FC2WO8es7LA
         MJaljdZ2x4Wb6yNV1C52msAUvqzxGe2PFUfMNBeUlF10E5KJ+qvMk/7bRi5h8TLmidLJ
         ufIg==
X-Gm-Message-State: AOAM530giD8XcCS04fs5uonSXw1ZprRHCVpYgle/fQflEarjbUsWJUlu
        +cV0ZXCKu4A1kKL+CMDDJsjGdMqq47uYW02fttPHIGSyNPgXMrBB
X-Google-Smtp-Source: ABdhPJwGcdyEbDfXPSpzRVqKX0xJz8/CfO6pS5iy1wKsyjSvmz8Dyzv+Ns9mXjZranZW5dbt/sp8pwZdlwq0GFqe7xI=
X-Received: by 2002:ac2:511c:: with SMTP id q28mr2637602lfb.343.1611237638090;
 Thu, 21 Jan 2021 06:00:38 -0800 (PST)
MIME-Version: 1.0
References: <1610757107-11892-1-git-send-email-veeras@codeaurora.org> <CALAqxLUr09++rtqy56q-KfkKYtPKd8mV-r=Zou7vZVmyNze7Og@mail.gmail.com>
In-Reply-To: <CALAqxLUr09++rtqy56q-KfkKYtPKd8mV-r=Zou7vZVmyNze7Og@mail.gmail.com>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Thu, 21 Jan 2021 19:30:26 +0530
Message-ID: <CAO_48GFjWknXrRLHby6LVFbh0hzY2793FjLwzz9knnHnb7_EXQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dma-fence: allow signaling drivers to set fence timestamp
To:     John Stultz <john.stultz@linaro.org>
Cc:     Veera Sundaram Sankaran <veeras@codeaurora.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-media <linux-media@vger.kernel.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        pdhaval@codeaurora.org, abhinavk@codeaurora.org,
        jsanka@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Veera,

On Wed, 20 Jan 2021 at 02:00, John Stultz <john.stultz@linaro.org> wrote:
>
> On Fri, Jan 15, 2021 at 4:31 PM Veera Sundaram Sankaran
> <veeras@codeaurora.org> wrote:
> >
> > Some drivers have hardware capability to get the precise HW timestamp
> > of certain events based on which the fences are triggered. The delta
> > between the event HW timestamp & current HW reference timestamp can
> > be used to calculate the timestamp in kernel's CLOCK_MONOTONIC time
> > domain. This allows it to set accurate timestamp factoring out any
> > software and IRQ latencies. Add a timestamp variant of fence signal
> > function, dma_fence_signal_timestamp to allow drivers to update the
> > precise timestamp for fences.

Thank you for the patches!

Daniel, Christian, Gustavo: if there are no objections, I will queue
up this series via drm-misc-next.

> >
> > Changes in v2:
> > - Add a new fence signal variant instead of modifying fence struct
> >
> > Changes in v3:
> > - Add timestamp domain information to commit-text and
> > dma_fence_signal_timestamp documentation
> >
> > Signed-off-by: Veera Sundaram Sankaran <veeras@codeaurora.org>
> > ---
> >  drivers/dma-buf/dma-fence.c | 70 ++++++++++++++++++++++++++++++++++++++++-----
> >  include/linux/dma-fence.h   |  3 ++
> >  2 files changed, 66 insertions(+), 7 deletions(-)
>
> Thanks for respinning this!
>
> Reviewed-by: John Stultz <john.stultz@linaro.org>
>
> -john

Best,
Sumit.
