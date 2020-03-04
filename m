Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9BB1178C10
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2020 09:01:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726137AbgCDIB3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Mar 2020 03:01:29 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:28573 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725271AbgCDIB3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Mar 2020 03:01:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583308888;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=zRcprHlNKHf2Y4uTuJshwgaM2L8IjHdUUjSNLW2L6Ws=;
        b=gORuy6F4pLvYyCGS0df0WFZulpLe0HLWGeH9PIVWkdGAOxIMd3Ba+RxgTRVYzCDZjqM2+J
        hoBp0P8ZEuLpOHa4409XoOhMPe+ciuW8Ogcc+hMUEw+w3ij2TAWGLnGK/x7jBq8JcvD7QU
        uJrc7lWYAheaF+xdBN0KgGnAzNjcTQo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-7VMskJu9NeKxqy4Gs6rfng-1; Wed, 04 Mar 2020 03:01:26 -0500
X-MC-Unique: 7VMskJu9NeKxqy4Gs6rfng-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8551801E5C;
        Wed,  4 Mar 2020 08:01:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-150.ams2.redhat.com [10.36.116.150])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B825D1BC6D;
        Wed,  4 Mar 2020 08:01:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 0266617506; Wed,  4 Mar 2020 09:01:20 +0100 (CET)
Date:   Wed, 4 Mar 2020 09:01:19 +0100
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
Subject: Re: [PATCH v2 4/4] drm/virtio: Support virtgpu exported resources
Message-ID: <20200304080119.i55opxkhk4kdt4hp@sirius.home.kraxel.org>
References: <20200302121524.7543-1-stevensd@chromium.org>
 <20200302121524.7543-5-stevensd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200302121524.7543-5-stevensd@chromium.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

  Hi,

> +	if (vgdev->has_resource_assign_uuid) {
> +		spin_lock(&vgdev->resource_export_lock);
> +		if (bo->uuid_state == UUID_NOT_INITIALIZED) {
> +			bo->uuid_state = UUID_INITIALIZING;
> +			needs_init = true;
> +		}
> +		spin_unlock(&vgdev->resource_export_lock);
> +
> +		if (needs_init) {
> +			ret = virtio_gpu_cmd_resource_assign_uuid(vgdev, bo);

You can submit a fenced command, then wait on the fence here.  Removes
the need for UUID_INITIALIZING.

Also note that this function will be called only once, on the first
export.  When exporting the same object again drm will simply reuse
the existing dmabuf.  You can drop UUID_NOT_INITIALIZED and needs_init.

So you are left with only two uuid_state states.  You could turn uuid
into a pointer, so it gets only allocated when needed.  Also uuid ==
NULL can be used for "uuid not available" then.

cheers,
  Gerd

