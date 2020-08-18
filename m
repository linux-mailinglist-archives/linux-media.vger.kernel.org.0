Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA07E247C02
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 03:52:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726357AbgHRBwg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 21:52:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbgHRBwd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 21:52:33 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3890EC061342
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2020 18:52:31 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id t23so14061066qto.3
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2020 18:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=szzpFDA9AlK4enccjSiFaUNDWItaYlytHuvona3L4xE=;
        b=XrifYsF5rKfoCWUjJR56iJTuvGs1mu+hofxMCRYvN1bgU+9hCume8MfdskDYx/GXUi
         qvEoW0g2PrbsvnXO5CaiZC1mOPUQAVJ9FMbksSCTsWnT24/upbZp/dhWv4hX4hHLZZ+i
         FLEIIS2aoHuICneFAVnJh2bcK/OldVdEs4CP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=szzpFDA9AlK4enccjSiFaUNDWItaYlytHuvona3L4xE=;
        b=Ka6K8uxQKfDmIpucF6EHZroORtNQkl7glW5fspCmttYVAgz30bR3WCxRqSt11E86n2
         zXoOdhF/sxnSUAocfqWwWYBDtQqZkZH2paNFNq5TG276IE/hk+vTd/brzfoJYImNWiXf
         Ueml/sGqAKAMRiAqo68JVzL9Ll+J1NchpK4KzRd150YeAnZe3qQp9P3ICPGUfOGWrboj
         6QSGHYvaVwAl0n2Tm5h4Qkt9Ov3qq0c24uM7pC/9/2El+DNyYz/Kh0MU9ug4b49EAVH5
         foLqq/sz4WFqV6HArz3sF60eO+5SYPzwUd3rBugftdIV1rNqC773uCMPlLZNgztG5XPF
         eEVw==
X-Gm-Message-State: AOAM533Xdjg3kBezowBGVK7+KUUSqCprvZcu9FdgEDUIY2OYffESjV2K
        +J2lcyUXYpYbrqTXSYvfEr+1lQSrtQ2LT0p36t5N3w==
X-Google-Smtp-Source: ABdhPJxTMwbSOeJZ+JjlM+dBnOrWPf2Un6ZL7ISpGYM5sJBiPu9rwbZVoK+XvNs2l/kehDF6aM8NBGUpgV8YpoFB/PU=
X-Received: by 2002:ac8:45c7:: with SMTP id e7mr16254448qto.187.1597715550749;
 Mon, 17 Aug 2020 18:52:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200609012518.198908-1-stevensd@chromium.org>
 <20200609055021-mutt-send-email-mst@kernel.org> <CAD=HUj7wJfoKj_K44Cs9eEmh=OQHZ1+qz7ZHxoscHjYgOMXvZQ@mail.gmail.com>
 <20200817105008.mi3ukh6kxgi37gjs@sirius.home.kraxel.org> <20200817111234.i7pqtnnk2ciw4rqb@sirius.home.kraxel.org>
In-Reply-To: <20200817111234.i7pqtnnk2ciw4rqb@sirius.home.kraxel.org>
From:   David Stevens <stevensd@chromium.org>
Date:   Mon, 17 Aug 2020 18:52:19 -0700
Message-ID: <CAD=HUj65N3ejzYgUcpHLvPHguXFDC-B4OFeNOfvSML1zdoNRPg@mail.gmail.com>
Subject: Re: [virtio-dev] Re: [PATCH v5 0/3] Support virtio cross-device resources
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
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
        <linaro-mm-sig@lists.linaro.org>, virtio-dev@lists.oasis-open.org,
        alex.williamson@redhat.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 17, 2020 at 4:12 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Mon, Aug 17, 2020 at 12:50:08PM +0200, Gerd Hoffmann wrote:
> > On Tue, Jun 23, 2020 at 10:31:28AM +0900, David Stevens wrote:
> > > Unless there are any remaining objections to these patches, what are
> > > the next steps towards getting these merged? Sorry, I'm not familiar
> > > with the workflow for contributing patches to Linux.
> >
> > Sorry, just have been busy and not paying as much attention to drm
> > patches as usual.  Playing catch-up now.  Queued for drm-misc-next,
> > unless something goes wrong in my testing the patches should land
> > in linux-next soon and be merged upstream in the next merge window.
>
> Oh, spoke too soon.  scripts/checkpatch.pl has a bunch of codestyle
> warnings.  Can you fix them and resend?

Sent a new version to fix the line length warning. There's still a
MAINTAINER warning, but I think the new virtio_dma_buf file can fall
under virtio core (and the existing wildcards do match it), rather
than get its own MAINTAINER entry. I can break it out into its own
thing if that's better, though.

-David
