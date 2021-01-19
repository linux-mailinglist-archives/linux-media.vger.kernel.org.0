Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 913902FC110
	for <lists+linux-media@lfdr.de>; Tue, 19 Jan 2021 21:32:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729786AbhASUcX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jan 2021 15:32:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730420AbhASUcQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jan 2021 15:32:16 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAEA0C061573
        for <linux-media@vger.kernel.org>; Tue, 19 Jan 2021 12:31:32 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id b26so30993143lff.9
        for <linux-media@vger.kernel.org>; Tue, 19 Jan 2021 12:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/nJcXNoH8E3aokPgO4BKfYF5qohGlAlcDu7kLVa0nBA=;
        b=DYUO2d4yCSIx4re3VOc4/ejR4WqTUcf27k5UZ6RV9JxY36OFGaixYjqS4nz3+0SSqE
         L9CJf326BCDrmNptAHBfZl73wCmr87tEeElAp1V7MadlglUZY/yI/GwyhY96izF8BrGj
         ETe6diBX9DQJLKINfEQyfHQDTJD3Z9bNz2rhIM/l6LAIyqEDoGY4Oz7YvgIoPgOUg95I
         qEr2O8r1hNa8OknyZkdRtmPfFSO5W+s1Kj7b4QfxYEdOudnAutghQqr84srwWazErzDk
         n7iJJILsOHRPIcRdSPdSncqlOgkRx9n2xVjB0k3cpyvWYKgKSo8PHH8WYXBOqS+zMg/7
         1xng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/nJcXNoH8E3aokPgO4BKfYF5qohGlAlcDu7kLVa0nBA=;
        b=uAWzJFtQruNsKAPPOpP5hAgAnfZbY4cbJTC/e5dP3EGa7PmRNsMXkGIDfjCGl8MDNF
         S+wXn1aCHT9NLDpyCZSPSShX65OssPpNYgGLEVSV3ZtddVU28BfCN+0P+n2kX08foFpo
         vWe52zy1tKwwSUTHrqjqwUmH7d58xjbpLabXQNwIWPFPfLtrLHsnzf9/IFIZxwSl1pwO
         +lUwCll0eQbmkai3WWjvNyNUbHq4QVvhI7+SQzHKhp3RThobJLlzblLH8sdtgxfIH4EH
         b1c4WBJVcw2hx8i4a6CuGPhw74baAYwHmTOndoH+DH8r2cOjpnqh5lheRUi69SePhHq8
         ThzQ==
X-Gm-Message-State: AOAM533Dw/SXN6aEahBKv1PkDHT+43MnIpGzERr9ziAiSakd3QGJ/8lz
        FkahySVxkMP4EWSJkgWtDfWf1woBmZeWxneByxFTdA==
X-Google-Smtp-Source: ABdhPJzn6b8f4IdmLW+Jc4y/BacRK4n5UWsqai7H2T3iKIHKBVAXQ9I/doUhxxJ2NE90WdVGTsbugI4YcP/KGNlmhM4=
X-Received: by 2002:a19:8357:: with SMTP id f84mr2538481lfd.567.1611088291224;
 Tue, 19 Jan 2021 12:31:31 -0800 (PST)
MIME-Version: 1.0
References: <1610757107-11892-1-git-send-email-veeras@codeaurora.org> <1610757107-11892-2-git-send-email-veeras@codeaurora.org>
In-Reply-To: <1610757107-11892-2-git-send-email-veeras@codeaurora.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 19 Jan 2021 12:31:19 -0800
Message-ID: <CALAqxLX9Jh8NpXQwQ5ssBYuypbzzNg2OF+hPxxYfCnvzmzNOWg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drm/drm_vblank: set the dma-fence timestamp during send_vblank_event
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
> The explicit out-fences in crtc are signaled as part of vblank event,
> indicating all framebuffers present on the Atomic Commit request are
> scanned out on the screen. Though the fence signal and the vblank event
> notification happens at the same time, triggered by the same hardware
> vsync event, the timestamp set in both are different. With drivers
> supporting precise vblank timestamp the difference between the two
> timestamps would be even higher. This might have an impact on use-mode
> frameworks using these fence timestamps for purposes other than simple
> buffer usage. For instance, the Android framework [1] uses the
> retire-fences as an alternative to vblank when frame-updates are in
> progress. Set the fence timestamp during send vblank event using a new
> drm_send_event_timestamp_locked variant to avoid discrepancies.
>
> [1] https://android.googlesource.com/platform/frameworks/native/+/master/
> services/surfaceflinger/Scheduler/Scheduler.cpp#397
>
> Changes in v2:
> - Use drm_send_event_timestamp_locked to update fence timestamp
> - add more information to commit text
>
> Changes in v3:
> - use same backend helper function for variants of drm_send_event to
> avoid code duplications
>
> Changes in v4:
> - remove WARN_ON from drm_send_event_timestamp_locked
>
> Signed-off-by: Veera Sundaram Sankaran <veeras@codeaurora.org>
> ---

Looks good, as expected no longer seeing the warning.

Reviewed-by: John Stultz <john.stultz@linaro.org>

thanks
-john
