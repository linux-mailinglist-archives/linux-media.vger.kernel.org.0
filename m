Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7473917A1B0
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2020 09:51:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725955AbgCEIvD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Mar 2020 03:51:03 -0500
Received: from mail-qv1-f68.google.com ([209.85.219.68]:44413 "EHLO
        mail-qv1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbgCEIvD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Mar 2020 03:51:03 -0500
Received: by mail-qv1-f68.google.com with SMTP id b13so2063717qvt.11
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2020 00:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=El/sfTpddW1bZLTnEnZCZcYJORrAN8Tq9vEVAml0EDE=;
        b=Vx/5vkxdn/hKg0Q8e8NxBkcGhDJsI7LG99cvLlcR/CVLIZ3nLfz++O1Kmbsg/jzf9L
         zKzg6AUYXpm1eBFv9Q/0M27de2rBPlAOqTARP+BlnJoakmL7bC0yE+sPNk6GGceazIs7
         OFDwJ48nJmQd4RvveTIeupNBOekk28UEEb3QA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=El/sfTpddW1bZLTnEnZCZcYJORrAN8Tq9vEVAml0EDE=;
        b=Qyhk+S/Eh8UVf31RzOKYPY82zA2BWmFXmaO620O1M7ctUjI5UdIyP1N1Yfe1+q8LyX
         6/Si3nwi+A0mGC5C1OIcq+/xgVjgI448RG3AqUpT88zhcTTodEc9B0KSDzAeDo3yNJ6C
         pNwCaIqROvnBunD9+Kl+NrEz1FYBBC2TL2Kov4VsPYAuARfSWQy/ANxt3l0Li6nT7n8L
         xOT5W5XBhAbqCsmILmEmh2vqneEIlMBMIdOdrD3hwYqMyoIihsuXzj2qq7pTIW4ru9nX
         RNxwmz8NaQt3XlbHVED1yBdjYc+fvM9b0iJ6RuWwMW1S+Zs4XWc0FCMeN1Ibz1ADIKZx
         HJ1w==
X-Gm-Message-State: ANhLgQ1mfjYtWdbuZvpz9/kHvAqRivZ8p4BNPvaz2rwFPQN564eko5UX
        zJc3Ve0qu++czqT4j1odKL6QV2tIlpThs0CrbvP1Bw==
X-Google-Smtp-Source: ADFU+vuXxgY7/ed9EAAffDRefWFzcupI8LrsMya2Q/mcmPS0VFPAjByjJPtT1mwbJ0eu/04sihvT5tTllkXJEr3T8J8=
X-Received: by 2002:a05:6214:10c1:: with SMTP id r1mr5594398qvs.70.1583398262104;
 Thu, 05 Mar 2020 00:51:02 -0800 (PST)
MIME-Version: 1.0
References: <20200302121524.7543-1-stevensd@chromium.org> <20200302121524.7543-5-stevensd@chromium.org>
 <20200304080119.i55opxkhk4kdt4hp@sirius.home.kraxel.org>
In-Reply-To: <20200304080119.i55opxkhk4kdt4hp@sirius.home.kraxel.org>
From:   David Stevens <stevensd@chromium.org>
Date:   Thu, 5 Mar 2020 17:50:51 +0900
Message-ID: <CAD=HUj7jS5jaRmiJwtGMSQZnR8Qd0VvPkBSbs1d-nATdczWdZA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/virtio: Support virtgpu exported resources
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        "Michael S . Tsirkin" <mst@redhat.com>,
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
        linaro-mm-sig@lists.linaro.org, virtio-dev@lists.oasis-open.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 4, 2020 at 5:01 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > +     if (vgdev->has_resource_assign_uuid) {
> > +             spin_lock(&vgdev->resource_export_lock);
> > +             if (bo->uuid_state == UUID_NOT_INITIALIZED) {
> > +                     bo->uuid_state = UUID_INITIALIZING;
> > +                     needs_init = true;
> > +             }
> > +             spin_unlock(&vgdev->resource_export_lock);
> > +
> > +             if (needs_init) {
> > +                     ret = virtio_gpu_cmd_resource_assign_uuid(vgdev, bo);
>
> You can submit a fenced command, then wait on the fence here.  Removes
> the need for UUID_INITIALIZING.

Synchronously waiting is simper, but only doing the wait when trying
to use the UUID can help to hide the latency of the virito commands.
That can save quite a bit of time when setting up multiple buffers for
a graphics pipeline, which I think is worthwhile.

-David
