Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0982D3161FC
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 10:20:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbhBJJUY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 04:20:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21162 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230280AbhBJJSR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 04:18:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612948609;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=KajS67I+i5BpKQ99uXSNDjgQPmQkOT9qLUWTp/ktN+o=;
        b=cd6GH2HE5uGBHOqAy3AqfVwBYdT2c71usiDKFdrs5aV2MvkiD5+qfC5XE24uQgOxD4ooon
        42j3sHSyhcvR2bp1kgz8uH+/cEFkDY7cMoLerBcWDmrOM5FOuVQ9RwLXqNMZ5ZdQv9gbhE
        vY0iSV68M9+AsHlg3s4oSoJ0ExmQL7I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-1xqaUBcyOBi7KIZWJaDH_w-1; Wed, 10 Feb 2021 04:16:45 -0500
X-MC-Unique: 1xqaUBcyOBi7KIZWJaDH_w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC397BBEE4;
        Wed, 10 Feb 2021 09:16:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-161.ams2.redhat.com [10.36.112.161])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B68C10016F6;
        Wed, 10 Feb 2021 09:16:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id B59A418000AB; Wed, 10 Feb 2021 10:16:41 +0100 (CET)
Date:   Wed, 10 Feb 2021 10:16:41 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "Vetter, Daniel" <daniel.vetter@intel.com>,
        "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
        "Kim, Dongwon" <dongwon.kim@intel.com>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [RFC v3 2/3] virtio: Introduce Vdmabuf driver
Message-ID: <20210210091641.ahjtgcdalw7viuei@sirius.home.kraxel.org>
References: <20210203073517.1908882-1-vivek.kasireddy@intel.com>
 <20210203073517.1908882-3-vivek.kasireddy@intel.com>
 <YB1sRx1GrT8rATEg@phenom.ffwll.local>
 <20210208075748.xejgcb4il2egow2u@sirius.home.kraxel.org>
 <YCEGrrT0/eqqz/ok@phenom.ffwll.local>
 <8ba4ad64be3546bda9a2ed2129bf98e4@intel.com>
 <20210209084453.5oqepy7zdwtxgrpu@sirius.home.kraxel.org>
 <2ef01dc941684a15a4f30e6239ae42df@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ef01dc941684a15a4f30e6239ae42df@intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> > You don't have to use the rendering pipeline.  You can let the i915 gpu
> > render into a dma-buf shared with virtio-gpu, then use virtio-gpu only for
> > buffer sharing with the host.
> [Kasireddy, Vivek] Is this the most viable path forward? I am not sure how complex or 
> feasible it would be but I'll look into it.
> Also, not using the rendering capabilities of virtio-gpu and turning it into a sharing only
> device means there would be a giant mode switch with a lot of if() conditions sprinkled
> across. Are you OK with that?

Hmm, why a big mode switch?  You should be able to do that without
modifying the virtio-gpu guest driver.  On the host side qemu needs
some work to support the most recent virtio-gpu features like the
buffer uuids (assuming you use qemu userspace), right now those
are only supported by crosvm.

It might be useful to add support for display-less virtio-gpu, i.e.
"qemu -device virtio-gpu-pci,max_outputs=0".  Right now the linux
driver throws an error in case no output (crtc) is present.  Should
be fixable without too much effort though, effectively the sanity
check would have to be moved from driver initialization to commands
like SET_SCANOUT which manage the outputs.

take care,
  Gerd

