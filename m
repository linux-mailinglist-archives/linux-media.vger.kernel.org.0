Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 135A5247F0D
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 09:11:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbgHRHLf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 03:11:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726273AbgHRHLc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 03:11:32 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FFA9C061389
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2020 00:11:32 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id d27so14424230qtg.4
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2020 00:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n3a7THydnGAc5AUiVljLET4u580OnrFmLIy37AEhH7s=;
        b=cSXYbK0KhcTVcj3BN3p2cBdYHCmnPysTZnSvj9ozXtLSA19RMMmA89oJO5/M1Xu2Sv
         Q2CmHVgmJ/KCHNsetwkfVKIzQFCyjKAUb6lnuLbq1xJpxHek2X/hnt5SkFX8hXQbF2Io
         7W9qXbc0V6MaWGjCotnlmRdc76WVPPRnUfJls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n3a7THydnGAc5AUiVljLET4u580OnrFmLIy37AEhH7s=;
        b=HQSEZz8BPTPnsCnXavK5G76gSVBLsPq5uu/0YNW8JBIEcLJ7XRpfVqIPz0XFD7P9WB
         +ysf5zpog/qoGdQJ77D1/BP/qGLiGqM7WQDm/zVfyDcAcdbl3cgxXedtkEInzEDHe/IK
         07tRhElj3UoDnImrCtGNo5qi/QqZGgSJPoh7+r3jC86jAV8DxtUq6XA3L9265GYLZ9pe
         oiOkYYAl6LtRBJadOjtSbUKLzF4lg2X7fMXIW67DdqMkE91Ehnpe6dWitKPYjPtDzU1t
         DaLlzmg/kvArbspuXtCif+3hiFGkeXLExxYkREA4Al15cEc4eteh416ReW1L4Q4vHnAs
         brXw==
X-Gm-Message-State: AOAM530Lz5w5pNpbmFpTjDtiP3FqtkLWQ+rki6rOTfy3D6L2DPw0kyzR
        I9drATJCDJUxOarMI7u0gg3+FXaA2A0EtacTrjbLUw==
X-Google-Smtp-Source: ABdhPJyZusOXlJEolyPUq2uzLSLnrLlZCeUK74TdElz/4gT5+YLKvVKLVDF3+1Btr0gUklkg9hbaYCqMSoip66/ILus=
X-Received: by 2002:aed:3587:: with SMTP id c7mr17004433qte.136.1597734691473;
 Tue, 18 Aug 2020 00:11:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200818013744.3327271-1-stevensd@chromium.org> <20200818055949.6si4jzuubba5dx5u@sirius.home.kraxel.org>
In-Reply-To: <20200818055949.6si4jzuubba5dx5u@sirius.home.kraxel.org>
From:   David Stevens <stevensd@chromium.org>
Date:   Tue, 18 Aug 2020 00:11:21 -0700
Message-ID: <CAD=HUj5xqNE=7VPMH5MDq8h735-OnbancrkemJGkDKYmeddfNQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] Support virtio cross-device resources
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
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

> Hmm, checkpatch still complains, full log below.
>
> IIRC "dim checkpatch" runs scripts/checkpatch.pl with --strict
> so it is a bit more picky ...

Ah, I didn't know --strict was being used. I'll send an update
momentarily. Sorry for the churn.

> -:250: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
> #250: FILE: drivers/gpu/drm/virtio/virtgpu_vq.c:1118:
> +       uint32_t resp_type = le32_to_cpu(resp->hdr.type);
>

For consistency with the rest of the virtgpu code, I'll leave uint32_t.

Cheers,
David
