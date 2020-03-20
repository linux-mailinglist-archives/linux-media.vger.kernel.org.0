Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15FE518C7A6
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2020 07:48:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726878AbgCTGsp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Mar 2020 02:48:45 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:23819 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726232AbgCTGso (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Mar 2020 02:48:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584686923;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=I8J6IN+TuY0BJsRchoBI9oAN0K/XoUEqJ8kuURXbQjM=;
        b=ghp/qxRR52Pa0JwCFG1E1YEfoc/yEsoQuokJKQ7Qn+eBjtTomqE5VsuzSSGL0dEopJ+JgE
        GQSzSWq2WSjhIjWhsekd4nZnvM6dSh1OlzHr5FxrMTACUY6wVVDVnLUqjUHu0Tiatpyb3E
        FkumCf2/05Vox2eY/VnX20B1//K6QAs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-hj1uEHnlPI2nAfHMwlmZAQ-1; Fri, 20 Mar 2020 02:48:37 -0400
X-MC-Unique: hj1uEHnlPI2nAfHMwlmZAQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBE23477;
        Fri, 20 Mar 2020 06:48:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-49.ams2.redhat.com [10.36.112.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C96EEBBBF2;
        Fri, 20 Mar 2020 06:48:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 954249DB3; Fri, 20 Mar 2020 07:48:30 +0100 (CET)
Date:   Fri, 20 Mar 2020 07:48:30 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     David Stevens <stevensd@chromium.org>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        virtio-dev@lists.oasis-open.org
Subject: Re: [PATCH v3 0/4] Support virtio cross-device resources
Message-ID: <20200320064830.svdgh4xuxbxz6bc4@sirius.home.kraxel.org>
References: <20200311112004.47138-1-stevensd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311112004.47138-1-stevensd@chromium.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 11, 2020 at 08:20:00PM +0900, David Stevens wrote:
> This patchset implements the current proposal for virtio cross-device
> resource sharing [1], with minor changes based on recent comments. It
> is expected that this will be used to import virtio resources into the
> virtio-video driver currently under discussion [2].
> 
> This patchset adds a new hook to dma-buf, for querying the dma-buf's
> underlying virtio UUID. This hook is then plumbed through DRM PRIME
> buffers, and finally implemented in virtgpu.

Looks all fine to me.  We should wait for the virtio protocol update
(patch 3/4) being accepted into the virtio specification.  When this is
done I'll go commit this to drm-misc-next.

cheers,
  Gerd

