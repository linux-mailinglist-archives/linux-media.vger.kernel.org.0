Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B4F82F5628
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 02:57:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727813AbhANBmo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 20:42:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727818AbhANBlq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 20:41:46 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 424F2C0617A5
        for <linux-media@vger.kernel.org>; Wed, 13 Jan 2021 17:30:06 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id v67so5711621lfa.0
        for <linux-media@vger.kernel.org>; Wed, 13 Jan 2021 17:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aQdUb0QePLnuFrfCeP/LOSw2Xg60qZ7zBQYZnqDVCzg=;
        b=mWx0FFv6l0JQEO1gJrEOwbGnx+hbJgKUmeb0WjXIVBUODVuFVn6OojgGXSemTSNTCn
         D1Lit8Dd4ucMJEWkDfEY7SngrwQDPsOR2gQvkaN05+XporpavkAB/UWVcTI81Bwv5ElL
         3XA9ZWlsZ3GNpBjo+JgkctZzIpRXj+fP0+bGpEpSPSq/XBKb2QlzG6iYBomECFktpCY7
         xXd3+TxqCypkaa8arbh13weAO/j6MuXEjVl3qBX98x7sF4RP4he09Bh7WRR8Tm/Cc3Eb
         EvyvfteSqkCtwivupQoV3CHU/bEqSrzss0oo+wikFWPk71NaxvP0gH76ggNETQ4E7HTG
         GCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aQdUb0QePLnuFrfCeP/LOSw2Xg60qZ7zBQYZnqDVCzg=;
        b=bWf2MaM1XTWTwUJSsgFbP1NgoDIBURfgE57x4qidwXsGgE+cfq1WYvHZWd8SsQ2XWJ
         q7XUFbtCML6JtRi8Irq2UCpCgDbbXjkuX8ykv3LbLIZSdJo+EmwMqrO6QQa8eyL0lBxN
         atkjqky3rAJkwsVgdyHqlAfObHdNCDQz0wpJhjJY2lV3r1656DIpda3UVmgj3X8QYShR
         +VVP3CpebC9dRMN42ideDaoXllkP/2NPMKbPoTdH0YPsa6ZHMjh3p0qdQcSEflCD570G
         Qj3L800n0IGg+ulC0Zw/wSgFmtAUfABnxEx7z4WkvDxYgzr9j5gnqeE8g2BY+B04iYbo
         A/0g==
X-Gm-Message-State: AOAM533Cln2p0wWNsDlZj5c3SSCcUrs/xVXyxZ4gtpIZrA19ToxdQRwe
        I+TKqr+7YHTsTJe2lBTHOeR8z9b25ckRFJgJPx6WyA==
X-Google-Smtp-Source: ABdhPJxClhSkXf89Ld5gScQwsma53h5el9CVUO54i38kiNii8q8c6ZsOOz3HeDiLty1kK9qqh+4pz2hkNTwNaDn654k=
X-Received: by 2002:a19:8357:: with SMTP id f84mr2034699lfd.567.1610587804819;
 Wed, 13 Jan 2021 17:30:04 -0800 (PST)
MIME-Version: 1.0
References: <1610567539-16750-1-git-send-email-veeras@codeaurora.org> <1610567539-16750-2-git-send-email-veeras@codeaurora.org>
In-Reply-To: <1610567539-16750-2-git-send-email-veeras@codeaurora.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Wed, 13 Jan 2021 17:29:53 -0800
Message-ID: <CALAqxLXtXcxwpBDiGfmaWpFONaRc7AtX-GCdRqTd6Ynz9pRTng@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/drm_vblank: set the dma-fence timestamp during send_vblank_event
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
> Signed-off-by: Veera Sundaram Sankaran <veeras@codeaurora.org>

Looks good. I appreciate you addressing my earlier comments and
sending this out again!

Reviewed-by: John Stultz <john.stultz@linaro.org>

thanks
-john
