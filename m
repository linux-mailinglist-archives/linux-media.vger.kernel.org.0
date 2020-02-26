Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB0A16F647
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 04:57:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbgBZD5M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Feb 2020 22:57:12 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:37144 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726136AbgBZD5M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Feb 2020 22:57:12 -0500
Received: by mail-qt1-f195.google.com with SMTP id j34so1323136qtk.4
        for <linux-media@vger.kernel.org>; Tue, 25 Feb 2020 19:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y43f351GsocmwieumGvRVXcMvZ/sEk6tnZeuhSLflZ0=;
        b=ZTP0S5/QDGhwujJhePEeqS8RMJkWkFJa/5JZyyUqiRn+ilygUdrbn911hQNVMntZy3
         zOVmYLjUDv+1xez2rK2QVc0DQfcPJ2wyrY370P5wT5ptsjyywr20gibLSnkSa/oD3SzQ
         709zTNnUw5Qbx/eMUMt6+qNAINBmx2JE1k9GI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y43f351GsocmwieumGvRVXcMvZ/sEk6tnZeuhSLflZ0=;
        b=IfIvaSF265/Gf+9vyhgagutQ4Q4SxHvzxHeB2VRMYCeUvThWfIZPwuamw435SlS1/F
         cQzzotv+UVzlphCXW7MpO/SIub5UKjaHm2W/spXNBokUR2DnqIGt2Z4RbzxGEtA70wmh
         5wrrlU7/A9w6EA9yaQtG3nrOsUWjN+C4mVDWbT0PJsETvLQFm/F7qafNjCNKvvX/v+gv
         qQkAt2p9IslvQfvH3BhonjZUK2rgFQVZDVuGj6+xohAeiciXOkZANTmvxchdCjRaqHg5
         zOTC4owdCVvpiokPWfYgbZi56uizUfxux1eE4FOKGthrWBVMUPJtpT7lFQI8SeSLp8TO
         R6yA==
X-Gm-Message-State: APjAAAUdqIBh+ykFKflG0fLEp6stcLZjTnVyUWoGazqFZrvt3X5/Yy+N
        MdA53Sk7voCggbHvDkJSMfTNS/nyc3UxIPDHPbFxUA==
X-Google-Smtp-Source: APXvYqxT1mskDKO8pPXeGfj5i3NbuWvfjJvcsQi12sua3ZaKB+zMAp1/1nwwdHvRa+8Box6GWFczVQuvTFidlmGN/dU=
X-Received: by 2002:aed:3e6d:: with SMTP id m42mr2584657qtf.187.1582689429791;
 Tue, 25 Feb 2020 19:57:09 -0800 (PST)
MIME-Version: 1.0
References: <20200219080637.61312-1-stevensd@chromium.org> <20200219080637.61312-2-stevensd@chromium.org>
 <20200225061008.wqxqppfglzmwvtid@sirius.home.kraxel.org>
In-Reply-To: <20200225061008.wqxqppfglzmwvtid@sirius.home.kraxel.org>
From:   David Stevens <stevensd@chromium.org>
Date:   Wed, 26 Feb 2020 12:56:58 +0900
Message-ID: <CAD=HUj7h1d8dXG94FUtj4fmeUvUM0dm6NW8WHGZAceHae0zGLw@mail.gmail.com>
Subject: Re: [virtio-dev] Re: [PATCH 1/2] virtio: add dma-buf support for
 exported objects
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linaro-mm-sig@lists.linaro.org, virtio-dev@lists.oasis-open.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 25, 2020 at 3:10 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Wed, Feb 19, 2020 at 05:06:36PM +0900, David Stevens wrote:
> > This change adds a new flavor of dma-bufs that can be used by virtio
> > drivers to share exported objects. A virtio dma-buf can be queried by
> > virtio drivers to obtain the UUID which identifies the underlying
> > exported object.
>
> That duplicates a bunch of code from dma-buf.c in virtio_dma_buf.c.
>
> How about dma_buf_{get,set}_uuid, simliar to dma_buf_set_name?

While I'm not opposed to such an API, I'm also hesitant to make
changes to the dma-buf API for a single use case.

As for the duplicated code around virtio_dma_buf_export_info, it can
be removed by sacrificing a little bit of type safety, if that's
preferable.

-David
