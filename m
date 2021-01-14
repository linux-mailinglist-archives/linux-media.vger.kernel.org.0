Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B5D82F5634
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 02:57:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726590AbhANBoZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 20:44:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727381AbhANBR2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 20:17:28 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D86CC061795
        for <linux-media@vger.kernel.org>; Wed, 13 Jan 2021 17:16:47 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id a12so5645377lfl.6
        for <linux-media@vger.kernel.org>; Wed, 13 Jan 2021 17:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HV7acaig/IuRZH0FvYIco0+cS2A927XztjWMUTsde/M=;
        b=IXFf8TxyLoXqmiwzz7jnOBU1brF71r/TNOHrgUJum6TzTj2MIzEndUMppFjUPpZn98
         4HDRv5Mvwa5T7985Dy+e/m+R7NkWVG/359jcS5PeLV5tSzqbLd3rGClr5PYTPtr351Bv
         EyCVa+dYmnuYdWmJDX3DTEXb6uiUo0D9zv4W+ZWMNR0210lP16WR8KA9MbrSNaD39ByL
         s/nV32dLVX9hpWXJPGrnyO/BnYr3h9GdmP62XTGTGY6YQeKEI2gpmkAFWyeQ2PDcKV+v
         77jr6b5CADe+kxxmnh17PJZXtSagcndB2UDmXd48HiYlMzsV3htGuZTOjwhNzedCh3Cx
         kDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HV7acaig/IuRZH0FvYIco0+cS2A927XztjWMUTsde/M=;
        b=V1bWY+MTaO6S6yUx7a5TmH7WL26djcU8RlrHytYY0KgraJnz0X38LDhK9z3wNFB0Jo
         rE8LsCAZaczj5kWtNv+bBwp5aZFW5gyC85Rg6TiFipdfW/MaN8gQpq2BnuEqNeZyZwgo
         KIhLJfigd+Zg0IchcvH4Grtw5qROrjMKUHMYOm1af6rgHa2uXDph9yUZm+jssV4RvGZm
         oGKJ/sQxFBVjByfQaBAvSXL7cdjaEe74E/eaakNl5IQ2Z9VDknO/PNd8oJXikFLFZ67r
         3p643wQCzgmztwVHvhvN/7yJDVZ/ZljTNhvO59m3dK8j41bw36OmrE5xzMtfqLtlyKE2
         EX2A==
X-Gm-Message-State: AOAM530oUatPDxl2lbb+bCsGz86OJH96Xpj4OgbzXUBYWNVD1T+LNjgB
        v591+q60QkTjiXLzM7iBdOIyc0thJtrFCN8ggzExag==
X-Google-Smtp-Source: ABdhPJyI7Qrj9xwod84Gx794EFJRqixlMuHqyjZlGkjTwv6t48YBJWudycgrvf0f6eTRNZ69PMLPYboo+0BS1hJIeXs=
X-Received: by 2002:ac2:5145:: with SMTP id q5mr1915337lfd.626.1610587005736;
 Wed, 13 Jan 2021 17:16:45 -0800 (PST)
MIME-Version: 1.0
References: <1610567539-16750-1-git-send-email-veeras@codeaurora.org>
In-Reply-To: <1610567539-16750-1-git-send-email-veeras@codeaurora.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Wed, 13 Jan 2021 17:16:34 -0800
Message-ID: <CALAqxLVCf0w2oO2CPYp4R=Fk2yPGptDXY3v+RW5qzycg8R3NeA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dma-fence: allow signaling drivers to set fence timestamp
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

On Wed, Jan 13, 2021 at 11:52 AM Veera Sundaram Sankaran
<veeras@codeaurora.org> wrote:
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

Looks ok to me, also did some brief testing w/ AOSP and didn't see any
regressions.

Reviewed-by: John Stultz <john.stultz@linaro.org>

thanks
-john
