Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B6705140F8
	for <lists+linux-media@lfdr.de>; Fri, 29 Apr 2022 05:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236259AbiD2Db7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Apr 2022 23:31:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236224AbiD2Db5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Apr 2022 23:31:57 -0400
Received: from out1.migadu.com (out1.migadu.com [IPv6:2001:41d0:2:863f::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5437C0D02;
        Thu, 28 Apr 2022 20:28:39 -0700 (PDT)
Date:   Fri, 29 Apr 2022 11:28:10 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1651202916;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WR7AidTezt3FhuHMgE1GKtelbFYIEUudur94Uc7U6sQ=;
        b=xKr3p3iG1CdWcIoCvh74pr/16V95IjrnfEpjJjpakdxDjhj16raMvB01Ffq7Koo5qKH+dQ
        yM+kdMncSOk+cVivhE/eOa/R9nWd7Fvv0pgsLZfkHgzlReSwhUOxVsM/b02FL6OTQVYSTc
        MkFgS+z/ruizZd+tD7wnD00g243IeXg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Cai Huoqing <cai.huoqing@linux.dev>
To:     Mikko Perttunen <cyndis@kapsi.fi>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 0/4] drm/nvdla: Add driver support for NVDLA
Message-ID: <20220429032810.GA10104@chq-T47>
References: <20220426060808.78225-1-cai.huoqing@linux.dev>
 <YmqgailZKIuY7zTZ@orome>
 <beacfd71-ebd0-7fde-187f-34b7a42a47de@kapsi.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <beacfd71-ebd0-7fde-187f-34b7a42a47de@kapsi.fi>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 28 4月 22 18:56:07, Mikko Perttunen wrote:
> On 4/28/22 17:10, Thierry Reding wrote:
> > On Tue, Apr 26, 2022 at 02:07:57PM +0800, Cai Huoqing wrote:
> > > The NVIDIA Deep Learning Accelerator (NVDLA) is an open source IP
> > > which is integrated into NVIDIA Jetson AGX Xavier,
> > > so add driver support for this accelerator."
> > 
> > Hi,
> > 
> > nice to see this work going on. For subsequent revisions, can you please
> > also Cc the Tegra mailing list (linux-tegra@vger.kernel.org) as well as
> > the Tegra platform maintainers (that's Jon Hunter and myself). This will
> > make sure that more people with an interest in this will see your work.
> > Not everyone follows dri-devel, linaro-mm-sig or linux-media.
> > 
> > Thanks,
> > Thierry
> 
> From a quick glance it looks like this driver pokes DLA hardware directly
> which is not the intended programming model on Tegra hardware (there are
> Falcon microcontrollers that offload task scheduling and synchronization
> from the CPU). The hardware is also behind the Host1x bus so a simple
> platform device is not sufficient.
> 
> Was this driver developed against some platform with OpenDLA hardware (i.e.
> not Tegra)?
> 
> If so, we'd need to verify if the hardware matches the hardware in Tegra194.
> Also, this driver may not be ideal for Tegra platforms since we would lack
> the hardware scheduling and synchronization facilities. It is likely
> necessary to have separate drivers for OpenDLA and Tegra's DLA integration.
> 
> Thanks,
> Mikko
> 
Tegra DLA seems to work with a slave coprocessor, the host driver just
impelement message queue, share buffer, notification... The hardware
detail of DLA maybe in the slave driver(not linux OS?).

Sure, This driver just support for the SOCs or FPGAs that OPENDLA
inside. I will change this kind of description "integrated into NVIDIA Jetson AGX Xavier"
this driver dont support for Tegra directly.

Thanks,
Cai
> > 
> > > 
> > > v1->v2:
> > > *Rename nvdla_drm.[ch] to nvdla_drv.[ch] and rename nvdla_ioctl.h to nvdla_drm.h,
> > >   move it to uapi.
> > >   comments link: https://lore.kernel.org/lkml/20bac605-97e6-e5cd-c4e4-83a8121645d8@amd.com/
> > > *Remove the  onexistent filename  in Makefile
> > >   comments link: https://lore.kernel.org/lkml/202204201512.pp20MXT5-lkp@intel.com/
> > > *Sort file names alphabetically in Makefile.
> > > *Rearrange the error messages, and use drm_err/_dbg() instead of pr_err/_dbg().
> > > *Replace  "dla_" prefix with "nvdla_"
> > > *Check the iosys_map by iosys_map_is_null(), and check "ret" directly.
> > > *Using iosys_map_memcpy_to/_from() for iosys_map instead of memcpy()
> > > *Fix parameter error "dma_buf_vunmap(buf, ptr)", use "&map" instead of "ptr"
> > > *Use iosys_map instead of kvaddr and use "iosys_map_set_vaddr()" to initialize iosys_map
> > > *Using "vma->vm_pgoff -= drm_vma_node_start(&obj->vma_node)" to update vm_pgoff is cleaner
> > > *Remove the unused nvdla_drm_gem_mmap, register drm_gem_mmap to file_operations directly.
> > > *Use DEFINE_DRM_GEM_FOPS() to define nvdla_drm_fops.
> > > *Remove the unused nvdla_drm_gem_mmap_buf, register drm_gem_prime_mmap to drm_driver directly.
> > >   comments link: https://lore.kernel.org/lkml/7fa19996-5830-af3d-ab24-08c76e1d5604@suse.de/
> > > *Fix typo and some code style
> > > *Remove unused function nvdla_get_time_us()
> > >   comments link: https://lore.kernel.org/lkml/0fa9ab41-c18e-a569-e6fe-a0e9d965905e@stargateuniverse.net/
> > > 
> > > Cai Huoqing (4):
> > >    MAINTAINERS: Add the driver info of the NVDLA
> > >    drm/nvdla: Add driver support for NVDLA
> > >    drm/nvdla: Add register head file of NVDLA
> > >    drm/nvdla/uapi: Add UAPI of NVDLA driver
> > > 
> > >   MAINTAINERS                             |    7 +
> > >   drivers/gpu/drm/Kconfig                 |    2 +
> > >   drivers/gpu/drm/Makefile                |    1 +
> > >   drivers/gpu/drm/nvdla/Kconfig           |    8 +
> > >   drivers/gpu/drm/nvdla/Makefile          |   17 +
> > >   drivers/gpu/drm/nvdla/nvdla_bdma.c      |  198 +
> > >   drivers/gpu/drm/nvdla/nvdla_cache.c     |  202 +
> > >   drivers/gpu/drm/nvdla/nvdla_cdp.c       |  299 ++
> > >   drivers/gpu/drm/nvdla/nvdla_common.c    |  293 ++
> > >   drivers/gpu/drm/nvdla/nvdla_common.h    |  835 +++
> > >   drivers/gpu/drm/nvdla/nvdla_conv.c      |  684 +++
> > >   drivers/gpu/drm/nvdla/nvdla_drv.c       |  694 +++
> > >   drivers/gpu/drm/nvdla/nvdla_drv.h       |  129 +
> > >   drivers/gpu/drm/nvdla/nvdla_engine.c    |  233 +
> > >   drivers/gpu/drm/nvdla/nvdla_engine.h    |  272 +
> > >   drivers/gpu/drm/nvdla/nvdla_gem.c       |  358 ++
> > >   drivers/gpu/drm/nvdla/nvdla_pdp.c       |  448 ++
> > >   drivers/gpu/drm/nvdla/nvdla_reg.h       | 6411 +++++++++++++++++++++++
> > >   drivers/gpu/drm/nvdla/nvdla_rubik.c     |  214 +
> > >   drivers/gpu/drm/nvdla/nvdla_sched.h     |   37 +
> > >   drivers/gpu/drm/nvdla/nvdla_scheduler.c | 1012 ++++
> > >   drivers/gpu/drm/nvdla/nvdla_sdp.c       |  723 +++
> > >   include/uapi/drm/nvdla_drm.h            |   99 +
> > >   23 files changed, 13176 insertions(+)
> > >   create mode 100644 drivers/gpu/drm/nvdla/Kconfig
> > >   create mode 100644 drivers/gpu/drm/nvdla/Makefile
> > >   create mode 100644 drivers/gpu/drm/nvdla/nvdla_bdma.c
> > >   create mode 100644 drivers/gpu/drm/nvdla/nvdla_cache.c
> > >   create mode 100644 drivers/gpu/drm/nvdla/nvdla_cdp.c
> > >   create mode 100644 drivers/gpu/drm/nvdla/nvdla_common.c
> > >   create mode 100644 drivers/gpu/drm/nvdla/nvdla_common.h
> > >   create mode 100644 drivers/gpu/drm/nvdla/nvdla_conv.c
> > >   create mode 100644 drivers/gpu/drm/nvdla/nvdla_drv.c
> > >   create mode 100644 drivers/gpu/drm/nvdla/nvdla_drv.h
> > >   create mode 100644 drivers/gpu/drm/nvdla/nvdla_engine.c
> > >   create mode 100644 drivers/gpu/drm/nvdla/nvdla_engine.h
> > >   create mode 100644 drivers/gpu/drm/nvdla/nvdla_gem.c
> > >   create mode 100644 drivers/gpu/drm/nvdla/nvdla_pdp.c
> > >   create mode 100644 drivers/gpu/drm/nvdla/nvdla_reg.h
> > >   create mode 100644 drivers/gpu/drm/nvdla/nvdla_rubik.c
> > >   create mode 100644 drivers/gpu/drm/nvdla/nvdla_sched.h
> > >   create mode 100644 drivers/gpu/drm/nvdla/nvdla_scheduler.c
> > >   create mode 100644 drivers/gpu/drm/nvdla/nvdla_sdp.c
> > >   create mode 100644 include/uapi/drm/nvdla_drm.h
> > > 
> > > -- 
> > > 2.25.1
> > > 
> 
