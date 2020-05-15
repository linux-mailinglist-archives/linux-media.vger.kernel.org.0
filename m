Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5B451D4709
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2020 09:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726720AbgEOH0d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 May 2020 03:26:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726434AbgEOH03 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 May 2020 03:26:29 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37414C05BD09
        for <linux-media@vger.kernel.org>; Fri, 15 May 2020 00:26:28 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id z5so623186qvw.4
        for <linux-media@vger.kernel.org>; Fri, 15 May 2020 00:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yQ+8bQqVXCGgiMZpHhx8CRsJZ+7vvYouTuTdyPbncmE=;
        b=QDWBz3RUFZANTCfesmQRxLfudLR6lDXvkwQiP0JZK/Zi3SINJJlPUbU6EqOQgQFhj3
         jneZ5wcaAmgNP6xRm91oVntIzCcCm4+IDgxkpG7k2AMTSmKapOyCRKa6SzRWtAkIlknt
         3Vjoy1l/UAQSqOIQpSYl083UGeHjb01hQBypU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yQ+8bQqVXCGgiMZpHhx8CRsJZ+7vvYouTuTdyPbncmE=;
        b=PCX7Vv+waFAlFm6Rl5IU4u2Ky7s/PdgmPXmzNpxHNyKqSU4szU+/NKTaKPjzCX4Gdl
         +RKSeSLsYlC4HVokOxs5BrDxrS0wI28HVdJbuT44cco0ELW77I/+v8BQnRQbEg0qGV1z
         6Js0SxwrC6gypD+uX4eUKm9RJ+fSCEf8E4ynBSKai6ivXsYcqBkj0kaQ84dhhT3uYXDZ
         oGnvpTNoKu+Yrgi3OR3of545+50Dxk1psZYs8HA8K894X2/zcRg18OknvKvzeEDSJfBB
         42Pt0Re88GN/5tUmixnbaiInxqFP27is2RKdkUBISVi7fHAFVH7irsyYhwd8VzYywgM3
         7jUg==
X-Gm-Message-State: AOAM532vUjT8eRVWRty4p1TbzhUkJbh8gCXOoJrbqmibCFQrA5HN6EEI
        hYI/NObhjSe+zmTC2NUOkn5D8tdVKRZksKsYJgaZLQ==
X-Google-Smtp-Source: ABdhPJx1EFKHl7a6Wvqqoe4z/fgmS4Q3vrumNb01ocuJbWu2dJGymSisslGXpi2Jk+BTqytlgb0JT5aqQU+B+OWZaAw=
X-Received: by 2002:ad4:580b:: with SMTP id dd11mr2192873qvb.145.1589527587111;
 Fri, 15 May 2020 00:26:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200311112004.47138-1-stevensd@chromium.org> <20200311112004.47138-5-stevensd@chromium.org>
 <20200513123326-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200513123326-mutt-send-email-mst@kernel.org>
From:   David Stevens <stevensd@chromium.org>
Date:   Fri, 15 May 2020 16:26:15 +0900
Message-ID: <CAD=HUj5qcMLw__LfJizR6nzCR9Qmu21Sjk3i0j_8+=rxt1Hk=w@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] drm/virtio: Support virtgpu exported resources
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jason Wang <jasowang@redhat.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        open list <linux-kernel@vger.kernel.org>,
        ML dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:VIRTIO GPU DRIVER" 
        <virtualization@lists.linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, virtio-dev@lists.oasis-open.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> > +     if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_RESOURCE_UUID)) {
> > +             vgdev->has_resource_assign_uuid = true;
> > +     }
>
>
> Just a question: this relies on DMA bufs so I assume it is
> not really assumed to work when DMA API is bypassed, right?
> Rather than worry what does it mean, how about just
> disabling  this feature without PLATFORM_DMA for now?

By PLATFORM_DMA, do you mean CONFIG_DMA_SHARED_BUFFER? Virtio-gpu
depends on DRM, which selects that feature. So I think DMA bufs should
always be available when virtio-gpu is present.

-David
