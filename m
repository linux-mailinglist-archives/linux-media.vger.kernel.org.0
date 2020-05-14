Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C48871D29D8
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 10:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726056AbgENITx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 04:19:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725886AbgENITx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 04:19:53 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5EF2C061A0C
        for <linux-media@vger.kernel.org>; Thu, 14 May 2020 01:19:52 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id 4so2173541qtb.4
        for <linux-media@vger.kernel.org>; Thu, 14 May 2020 01:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nV+pjnxNzhUaIVaL0d+Q+czgaVh94PJJNBtyQf89HuA=;
        b=bwqQu7dsz6fMq5SL+sSD61OzDG6vFt+sG+Dtmn2KHQEXyvruCjQJRVMO0rcUkWbR4U
         3sBG2XIUE/tDcJxqlcxCKRZwVtTGXiqQqrz1W1j1VCo+pamFrLGrbNEVowY6fZeWz3dF
         lP8o4i0KqfUWhOHYFoa1pol4Wf7ScVyeR1jFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nV+pjnxNzhUaIVaL0d+Q+czgaVh94PJJNBtyQf89HuA=;
        b=BhRuucajegbW/4+96CoEFBNxnrMap0x/dTUXiY4TRZ+sOzmJetBdpoMcov4OjCJogc
         sfgr6p4YnC5WBgwaKX3PQrF5uCWsiw3MV3qByEz2TOgIoE3HQRRKbKkERyqEoTQIMUm9
         BgsMP43F3KL8Qpry+hNnxClkxO58UUBoLL231+O7VCrf3pYBlpruJF+nET0DU3rEamhh
         HcTNTi3dbiQQBs6+BJeckhR771W1QhWH8Pqd9p7i+moNvK9tl56olPFHmfI2YYHyC9qI
         qXgNGOICG8UGaX7e84LrxAKSZ/EJZ9uRzAGMuKL+ivm1NIBFn/6PrB7jDXxm3fVwoDOf
         UkoA==
X-Gm-Message-State: AOAM533XYKCMneUxLKRbWPlOSp4asgSGYSMJCPkiYEFs4+OevoOPGxgc
        S3Otjyl1slaERfpF9x1DMvRvz+sAQVwtZGuVEuUxDQ==
X-Google-Smtp-Source: ABdhPJy6BMxSQgw3762kK+QUyfrMZlOFJwduKjgq+7fX+Y9LnDP2guRYrUbaIterDx66ZYtt4hHEjjuKFL7NsBC5yw0=
X-Received: by 2002:aed:24a6:: with SMTP id t35mr3208654qtc.72.1589444391477;
 Thu, 14 May 2020 01:19:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200311112004.47138-1-stevensd@chromium.org> <20200311112004.47138-2-stevensd@chromium.org>
 <CAKMK7uHFgiHLe9oiFBr-VR-6rU9-hLTpBTEVNh0ezyj54u70jw@mail.gmail.com>
In-Reply-To: <CAKMK7uHFgiHLe9oiFBr-VR-6rU9-hLTpBTEVNh0ezyj54u70jw@mail.gmail.com>
From:   David Stevens <stevensd@chromium.org>
Date:   Thu, 14 May 2020 17:19:40 +0900
Message-ID: <CAD=HUj6k-y1=64zY8ZFOQBZ7WSUWiQfvkiTpXXt10JB_CGqk1A@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dma-buf: add support for virtio exported objects
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Gerd Hoffmann <kraxel@redhat.com>,
        David Airlie <airlied@linux.ie>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:VIRTIO CORE, NET..." 
        <virtualization@lists.linux-foundation.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, virtio-dev@lists.oasis-open.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sorry for the duplicate reply, didn't notice this until now.

> Just storing
> the uuid should be doable (assuming this doesn't change during the
> lifetime of the buffer), so no need for a callback.

Directly storing the uuid doesn't work that well because of
synchronization issues. The uuid needs to be shared between multiple
virtio devices with independent command streams, so to prevent races
between importing and exporting, the exporting driver can't share the
uuid with other drivers until it knows that the device has finished
registering the uuid. That requires a round trip to and then back from
the device. Using a callback allows the latency from that round trip
registration to be hidden.

-David
