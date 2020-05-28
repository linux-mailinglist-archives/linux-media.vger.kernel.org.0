Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 912981E5AD1
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2020 10:31:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727004AbgE1Ibb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 May 2020 04:31:31 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:32410 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726960AbgE1Ibb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 May 2020 04:31:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590654688;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=gYZwLjj7CzD0ymsoazFzJV5eo30qTW4FW8DTfD17Jfg=;
        b=Vyk+lWFUm6D6WOApcnDYM0ukHG3YBuPkqwJc5ht4bTw+UrNuudCtYU2wi2cGMgBOPpUJXA
        sDTGwGy9tlVEFJ07wXoWRZrOg6JsxNy5dfgXi9uAjFt7UXh8QI8++Elwa5CkXG6k5yoVIe
        JnDInMql/nh0TakE44Mytxl0NOeT68M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-X8CmvGu5MHitdtBIJs14og-1; Thu, 28 May 2020 04:31:21 -0400
X-MC-Unique: X8CmvGu5MHitdtBIJs14og-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E9FCBFC2;
        Thu, 28 May 2020 08:31:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com [10.36.113.50])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 09ADE62932;
        Thu, 28 May 2020 08:31:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 450E616E2C; Thu, 28 May 2020 10:31:15 +0200 (CEST)
Date:   Thu, 28 May 2020 10:31:15 +0200
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     David Stevens <stevensd@chromium.org>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        virtio-dev@lists.oasis-open.org
Subject: Re: [PATCH v4 0/3] Support virtio cross-device resources
Message-ID: <20200528083115.a6p3y24x3vqzcj4k@sirius.home.kraxel.org>
References: <20200526105811.30784-1-stevensd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526105811.30784-1-stevensd@chromium.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 26, 2020 at 07:58:08PM +0900, David Stevens wrote:
> This patchset implements the current proposal for virtio cross-device
> resource sharing [1]. It will be used to import virtio resources into
> the virtio-video driver currently under discussion [2]. The patch
> under consideration to add support in the virtio-video driver is [3].
> It uses the APIs from v3 of this series, but the changes to update it
> are relatively minor.
> 
> This patchset adds a new flavor of dma-bufs that supports querying the
> underlying virtio object UUID, as well as adding support for exporting
> resources from virtgpu.
> 
> [1] https://markmail.org/thread/2ypjt5cfeu3m6lxu
> [2] https://markmail.org/thread/p5d3k566srtdtute
> [3] https://markmail.org/thread/j4xlqaaim266qpks
> 
> v3 -> v4 changes:
>  - Replace dma-buf hooks with virtio dma-buf from v1.
>  - Remove virtio_attach callback, as the work that had been done
>    in that callback is now done on dma-buf export. The documented
>    requirement that get_uuid only be called on attached virtio
>    dma-bufs is also removed.
>  - Rebase and add call to virtio_gpu_notify for ASSIGN_UUID.
> 
> David Stevens (3):
>   virtio: add dma-buf support for exported objects
>   virtio-gpu: add VIRTIO_GPU_F_RESOURCE_UUID feature
>   drm/virtio: Support virtgpu exported resources

Looks all sane to me.  mst, have you looked at the virtio core changes?
How we are going to merge this?  If you ack I can merge via
drm-misc-next.  Merging through virtio queue would be fine too.

thanks,
  Gerd

