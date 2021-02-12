Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7D19319B16
	for <lists+linux-media@lfdr.de>; Fri, 12 Feb 2021 09:17:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbhBLIQO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 12 Feb 2021 03:16:14 -0500
Received: from mga05.intel.com ([192.55.52.43]:1231 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229832AbhBLIP4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Feb 2021 03:15:56 -0500
IronPort-SDR: RWT7fVn9bT4b7fDU8Tn0z9DW06Uyv4ArsEn32t28y22jL6JPgLbeWiwLUslQUoZK9dJVT2WOxh
 BjiiTFnE56+Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9892"; a="267223019"
X-IronPort-AV: E=Sophos;i="5.81,173,1610438400"; 
   d="scan'208";a="267223019"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2021 00:15:14 -0800
IronPort-SDR: FZHRZjqH+kTqIdMXXK2PFg7ilnH+URbu5ff2N6QHIBSgFsSFDHbgCoaDH1rkO+ypE/MVZz9EcL
 /kaI4IuOpLwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,173,1610438400"; 
   d="scan'208";a="511233670"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga004.jf.intel.com with ESMTP; 12 Feb 2021 00:15:13 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 12 Feb 2021 00:15:13 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 12 Feb 2021 00:15:12 -0800
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2106.002;
 Fri, 12 Feb 2021 00:15:12 -0800
From:   "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To:     Gerd Hoffmann <kraxel@redhat.com>
CC:     Daniel Vetter <daniel@ffwll.ch>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "Vetter, Daniel" <daniel.vetter@intel.com>,
        "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
        "Kim, Dongwon" <dongwon.kim@intel.com>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [RFC v3 2/3] virtio: Introduce Vdmabuf driver
Thread-Topic: [RFC v3 2/3] virtio: Introduce Vdmabuf driver
Thread-Index: AQHW+gCTpvRVWdGfdEuO7KEMCe95EKpKQvKAgAQvVwCAABxAAIAAXFfggAEm5oCAAH4bcIABHRyAgAJ/T4A=
Date:   Fri, 12 Feb 2021 08:15:12 +0000
Message-ID: <bad576177eb24085a73570e8ad03d2cc@intel.com>
References: <20210203073517.1908882-1-vivek.kasireddy@intel.com>
 <20210203073517.1908882-3-vivek.kasireddy@intel.com>
 <YB1sRx1GrT8rATEg@phenom.ffwll.local>
 <20210208075748.xejgcb4il2egow2u@sirius.home.kraxel.org>
 <YCEGrrT0/eqqz/ok@phenom.ffwll.local>
 <8ba4ad64be3546bda9a2ed2129bf98e4@intel.com>
 <20210209084453.5oqepy7zdwtxgrpu@sirius.home.kraxel.org>
 <2ef01dc941684a15a4f30e6239ae42df@intel.com>
 <20210210091641.ahjtgcdalw7viuei@sirius.home.kraxel.org>
In-Reply-To: <20210210091641.ahjtgcdalw7viuei@sirius.home.kraxel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
x-originating-ip: [10.22.254.132]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Gerd,

> > > You don't have to use the rendering pipeline.  You can let the i915
> > > gpu render into a dma-buf shared with virtio-gpu, then use
> > > virtio-gpu only for buffer sharing with the host.
[Kasireddy, Vivek] Just to confirm my understanding of what you are suggesting, are
you saying that we need to either have Weston allocate scanout buffers (GBM surface/BO)
using virtio-gpu and render into them using i915; or have virtio-gpu allocate pages and 
export a dma-buf and have Weston create a GBM BO by calling gbm_bo_import(fd) and
render into the BO using i915?

> Hmm, why a big mode switch?  You should be able to do that without modifying the
> virtio-gpu guest driver.  On the host side qemu needs some work to support the most
> recent virtio-gpu features like the buffer uuids (assuming you use qemu userspace), right
> now those are only supported by crosvm.
[Kasireddy, Vivek] We are only interested in Qemu UI at the moment but if we were to use
virtio-gpu, we are going to need to add one more vq and support for managing buffers, 
events, etc.

Thanks,
Vivek

> 
> It might be useful to add support for display-less virtio-gpu, i.e.
> "qemu -device virtio-gpu-pci,max_outputs=0".  Right now the linux driver throws an error
> in case no output (crtc) is present.  Should be fixable without too much effort though,
> effectively the sanity check would have to be moved from driver initialization to
> commands like SET_SCANOUT which manage the outputs.
> 
> take care,
>   Gerd

