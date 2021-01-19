Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE84C2FC10C
	for <lists+linux-media@lfdr.de>; Tue, 19 Jan 2021 21:32:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392091AbhASUbt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jan 2021 15:31:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392094AbhASUb0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jan 2021 15:31:26 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A8EBC061573
        for <linux-media@vger.kernel.org>; Tue, 19 Jan 2021 12:30:46 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id u21so23504601lja.0
        for <linux-media@vger.kernel.org>; Tue, 19 Jan 2021 12:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nF7UbpB2XeoCjbiO8VMOKYIHRLbtv9cSr4i7RtcGNLw=;
        b=GiX2j5Kt1ekUGCYLmuPr3Gve1jltlwAlXhP2At39z+/uek4RxUF3MfgJWoXEvat9CE
         L6E4m1fHeO4flYsscnqsgGIHnK+gphGU8FLCU+F8+5ptsMoEnHwbVDOqoHbxhEMUYIXc
         mQdC1OVchX+wt4Y8CmlLKX7sHaPTOT/2t3CcSpZJHNbIrujw4QioYSnAf78HbhWWzbDd
         0cwR3gAW1DI98X1pJVqFck0oITbPBRGugj1dD1u84cJpjH8UMz8VWPC6gENCXK1y5iaD
         FlRMGuFfCyo3n0tjB/ohjAQtpURlvnMjOpCHaDjhgZxOsisPsFP8/kLndAPCU9fqH7E7
         rq9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nF7UbpB2XeoCjbiO8VMOKYIHRLbtv9cSr4i7RtcGNLw=;
        b=BAA5E79Qjl4yh+DYpfymBd/hJjSbpWSwa74VYCyLpdtyhIUgadrVRQxjf1rX2AEY4P
         c4pmUqxFAax1rVbAiaiYgzY78G1VngwzhX+xlaBezJP4FAQnC2WDJf6mdUwEeuAizpdq
         zMznkLIzwQC1rRCgIqTF1mkyYN4y/MS+ODdS97uOLtr6HDmCVAU8+SBx+LxqsySp+Ql2
         glJ3azZMALEaUkLlCr0jzTcoIN2dcITJd9GEtcbW5Q0xCCr1Ofiuigdd3djW1mZl8qCg
         b8VyslLS+2u4kDG1x4kWn6EM5DK6Z4oJBKxaMDdSjLKUQAoQ77LWS0+eYMjL+59zGEoG
         md3w==
X-Gm-Message-State: AOAM532u6Tmsckiyw9PY2v34sMqd+7I6WRdEwIeTzuW1OEdv2G+m0bWP
        ShDuWOzsLZkY6IKDutYINqvFBR+1GdEbzsVEiYC3Mg==
X-Google-Smtp-Source: ABdhPJx5YvfQq/BpJkwnrqT77I3705LpbokmXAy1PRaAygaddGOSWbFfD5d4ga04BDUPWi0m67euPyhBFxqc37g4alo=
X-Received: by 2002:a2e:8090:: with SMTP id i16mr999488ljg.257.1611088244719;
 Tue, 19 Jan 2021 12:30:44 -0800 (PST)
MIME-Version: 1.0
References: <1610757107-11892-1-git-send-email-veeras@codeaurora.org>
In-Reply-To: <1610757107-11892-1-git-send-email-veeras@codeaurora.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 19 Jan 2021 12:30:32 -0800
Message-ID: <CALAqxLUr09++rtqy56q-KfkKYtPKd8mV-r=Zou7vZVmyNze7Og@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dma-fence: allow signaling drivers to set fence timestamp
To:     Veera Sundaram Sankaran <veeras@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-media <linux-media@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
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

On Fri, Jan 15, 2021 at 4:31 PM Veera Sundaram Sankaran
<veeras@codeaurora.org> wrote:
>
> Some drivers have hardware capability to get the precise HW timestamp
> of certain events based on which the fences are triggered. The delta
> between the event HW timestamp & current HW reference timestamp can
> be used to calculate the timestamp in kernel's CLOCK_MONOTONIC time
> domain. This allows it to set accurate timestamp factoring out any
> software and IRQ latencies. Add a timestamp variant of fence signal
> function, dma_fence_signal_timestamp to allow drivers to update the
> precise timestamp for fences.
>
> Changes in v2:
> - Add a new fence signal variant instead of modifying fence struct
>
> Changes in v3:
> - Add timestamp domain information to commit-text and
> dma_fence_signal_timestamp documentation
>
> Signed-off-by: Veera Sundaram Sankaran <veeras@codeaurora.org>
> ---
>  drivers/dma-buf/dma-fence.c | 70 ++++++++++++++++++++++++++++++++++++++++-----
>  include/linux/dma-fence.h   |  3 ++
>  2 files changed, 66 insertions(+), 7 deletions(-)

Thanks for respinning this!

Reviewed-by: John Stultz <john.stultz@linaro.org>

-john
