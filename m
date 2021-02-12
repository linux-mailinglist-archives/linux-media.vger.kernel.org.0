Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE073319D0B
	for <lists+linux-media@lfdr.de>; Fri, 12 Feb 2021 12:08:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230481AbhBLLF0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Feb 2021 06:05:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37313 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230407AbhBLLDT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Feb 2021 06:03:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613127709;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+Gx/mG4h1X8FM7fWz9h2H0rRVjTdjgBag2KkGy2ksa4=;
        b=Q6E34cY9Pf44J31joUkcFlD92HClrQgQTqAMTKkoY9365c9WVj5Ph8jB6/hRGUo+9mBMuh
        9UGvJDdbUzchO7BN5JyGUyQdrywJGvILX9hpgamVS1bcy+Kqu+38S2GoLG8Zw4tUOnHYKP
        SuyY8NaC/t9CSwWlW59TmnWixibkPvw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-lNMjW9KBPxa8Yl5DPST9Qw-1; Fri, 12 Feb 2021 06:01:45 -0500
X-MC-Unique: lNMjW9KBPxa8Yl5DPST9Qw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF2A2801965;
        Fri, 12 Feb 2021 11:01:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-161.ams2.redhat.com [10.36.112.161])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 5255A5C3FD;
        Fri, 12 Feb 2021 11:01:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id C438918003AF; Fri, 12 Feb 2021 12:01:40 +0100 (CET)
Date:   Fri, 12 Feb 2021 12:01:40 +0100
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
Message-ID: <20210212110140.gdpu7kapnr7ovdcn@sirius.home.kraxel.org>
References: <20210203073517.1908882-1-vivek.kasireddy@intel.com>
 <20210203073517.1908882-3-vivek.kasireddy@intel.com>
 <YB1sRx1GrT8rATEg@phenom.ffwll.local>
 <20210208075748.xejgcb4il2egow2u@sirius.home.kraxel.org>
 <YCEGrrT0/eqqz/ok@phenom.ffwll.local>
 <8ba4ad64be3546bda9a2ed2129bf98e4@intel.com>
 <20210209084453.5oqepy7zdwtxgrpu@sirius.home.kraxel.org>
 <2ef01dc941684a15a4f30e6239ae42df@intel.com>
 <20210210091641.ahjtgcdalw7viuei@sirius.home.kraxel.org>
 <bad576177eb24085a73570e8ad03d2cc@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bad576177eb24085a73570e8ad03d2cc@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Feb 12, 2021 at 08:15:12AM +0000, Kasireddy, Vivek wrote:
> Hi Gerd,
> 
> > > > You don't have to use the rendering pipeline.  You can let the i915
> > > > gpu render into a dma-buf shared with virtio-gpu, then use
> > > > virtio-gpu only for buffer sharing with the host.
> [Kasireddy, Vivek] Just to confirm my understanding of what you are suggesting, are
> you saying that we need to either have Weston allocate scanout buffers (GBM surface/BO)
> using virtio-gpu and render into them using i915; or have virtio-gpu allocate pages and 
> export a dma-buf and have Weston create a GBM BO by calling gbm_bo_import(fd) and
> render into the BO using i915?

Not sure what the difference between the former and the latter is.

> > Hmm, why a big mode switch?  You should be able to do that without modifying the
> > virtio-gpu guest driver.  On the host side qemu needs some work to support the most
> > recent virtio-gpu features like the buffer uuids (assuming you use qemu userspace), right
> > now those are only supported by crosvm.
> [Kasireddy, Vivek] We are only interested in Qemu UI at the moment but if we were to use
> virtio-gpu, we are going to need to add one more vq and support for managing buffers, 
> events, etc.

Should be easy and it should not need any virtio-gpu driver changes.

You can use virtio-gpu like a dumb scanout device.  Create a dumb
bo, create a framebuffer for the bo, map the framebuffer to the crtc.

Then export the bo, import into i915, use it as render target.  When
rendering is done flush (DRM_IOCTL_MODE_DIRTYFB).  Alternatively
allocate multiple bo's + framebuffers and pageflip.

Pretty standard workflow for cases where rendering and scanout are
handled by different devices.  As far I know not uncommon in the arm
world.

Right now this will involve a memcpy() for any display update because
qemu is a bit behind on supporting recent virtio-gpu features.

take care,
  Gerd

