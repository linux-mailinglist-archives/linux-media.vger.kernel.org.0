Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6106D6E98C2
	for <lists+linux-media@lfdr.de>; Thu, 20 Apr 2023 17:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233581AbjDTPuO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Apr 2023 11:50:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232190AbjDTPuK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Apr 2023 11:50:10 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21D4019BD
        for <linux-media@vger.kernel.org>; Thu, 20 Apr 2023 08:50:09 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E7FCA9DE;
        Thu, 20 Apr 2023 17:49:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682005799;
        bh=6iauqVBS8+niI3edePDmuo/4blxnMkwoKXBw1+3iUNw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AsS97UdTLcTDrURloV0bQ7coEbGzAIopeZfjc7FjI3P9QxTmpF7ArIPWQ0999cH38
         7pVqfPfv8LYay6yAp3MXazRtDQlG1SWI5Sm4N02tRuVK38ho2yVQettFRwR/s6WzmR
         El0L+M1+z7KaiUn6aNfm7wV6JRqIMPU1EjfdjIOA=
Date:   Thu, 20 Apr 2023 18:50:19 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     bingbu.cao@intel.com
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, hdegoede@redhat.com,
        bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com,
        hongju.wang@intel.com, daniel.h.kang@intel.com
Subject: Re: [RFC PATCH 00/14] Intel IPU6 and IPU6 input system drivers
Message-ID: <20230420155019.GA21943@pendragon.ideasonboard.com>
References: <20230413100429.919622-1-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230413100429.919622-1-bingbu.cao@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

Thank you for the patches.

On Thu, Apr 13, 2023 at 06:04:15PM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> This patch series adds a driver for Intel IPU6 input system.
> IPU6 is the sixth generation of Imaging Processing Unit, it is a PCI
> device which can be found in some Intel Client Platforms. User can use
> IPU6 to capture images from MIPI camera sensors.
> 
> IPU6 has its own firmware which exposes ABIs to driver, and communicates
> with CSE to do firmware authentication. IPU6 has its MMU hardware, so
> the driver sets up a page table to allow IPU6 DMA to access the system
> memory.
> 
> IPU6 input system driver uses MC and V4L2 sub-device APIs besides V4L2.

I had a look through the series, and it's a bit difficult to understand
how the different pieces interact with each other. Would it be possible
to provide some high-level documentation for the driver design, as well
as a high-level view of the hardware (and firmware) components ? It
would help the review process. Documentation/driver-api/media/drivers/
would be a good location for that.

> ---
> TODOs:
>   - Add support for multiplexed streams
>   - Add firmware CSI2 lanes configuration verification and documentation
> 
> ---
> 
> Bingbu Cao (13):
>   media: intel/ipu6: add Intel IPU6 PCI device driver
>   media: intel/ipu6: add IPU virtual bus driver
>   media: intel/ipu6: add IPU6 buttress interface driver
>   media: intel/ipu6: CPD parsing for get firmware components
>   media: intel/ipu6: add IPU6 DMA mapping API and MMU table
>   media: intel/ipu6: add syscom interfaces between firmware and driver
>   media: intel/ipu6: input system ABI between firmware and driver
>   media: intel/ipu6: add IPU6 CSI2 receiver v4l2 sub-device
>   media: intel/ipu6: add the CSI2 DPHY implementation
>   media: intel/ipu6: add input system driver
>   media: intel/ipu6: input system video capture nodes
>   media: add Kconfig and Makefile for IPU6
>   MAINTAINERS: add maintainers for Intel IPU6 input system driver
> 
>  MAINTAINERS                                   |   10 +
>  drivers/media/pci/Kconfig                     |    1 +
>  drivers/media/pci/intel/Makefile              |    3 +-
>  drivers/media/pci/intel/ipu6/Kconfig          |   15 +
>  drivers/media/pci/intel/ipu6/Makefile         |   23 +
>  drivers/media/pci/intel/ipu6/ipu6-bus.c       |  263 ++++
>  drivers/media/pci/intel/ipu6/ipu6-bus.h       |   69 +
>  drivers/media/pci/intel/ipu6/ipu6-buttress.c  |  916 ++++++++++++
>  drivers/media/pci/intel/ipu6/ipu6-buttress.h  |  109 ++
>  drivers/media/pci/intel/ipu6/ipu6-cpd.c       |  359 +++++
>  drivers/media/pci/intel/ipu6/ipu6-cpd.h       |  107 ++
>  drivers/media/pci/intel/ipu6/ipu6-dma.c       |  497 ++++++
>  drivers/media/pci/intel/ipu6/ipu6-dma.h       |   19 +
>  drivers/media/pci/intel/ipu6/ipu6-fw-com.c    |  417 ++++++
>  drivers/media/pci/intel/ipu6/ipu6-fw-com.h    |   47 +
>  drivers/media/pci/intel/ipu6/ipu6-fw-isys.c   |  566 +++++++
>  drivers/media/pci/intel/ipu6/ipu6-fw-isys.h   |  574 +++++++
>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  575 +++++++
>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |   75 +
>  .../media/pci/intel/ipu6/ipu6-isys-dwc-phy.c  |  549 +++++++
>  .../media/pci/intel/ipu6/ipu6-isys-jsl-phy.c  |  245 +++
>  .../media/pci/intel/ipu6/ipu6-isys-mcd-phy.c  |  735 +++++++++
>  drivers/media/pci/intel/ipu6/ipu6-isys-phy.h  |   24 +
>  .../media/pci/intel/ipu6/ipu6-isys-queue.c    |  869 +++++++++++
>  .../media/pci/intel/ipu6/ipu6-isys-queue.h    |   97 ++
>  .../media/pci/intel/ipu6/ipu6-isys-subdev.c   |  309 ++++
>  .../media/pci/intel/ipu6/ipu6-isys-subdev.h   |   70 +
>  .../media/pci/intel/ipu6/ipu6-isys-video.c    | 1132 ++++++++++++++
>  .../media/pci/intel/ipu6/ipu6-isys-video.h    |  120 ++
>  drivers/media/pci/intel/ipu6/ipu6-isys.c      | 1326 +++++++++++++++++
>  drivers/media/pci/intel/ipu6/ipu6-isys.h      |  190 +++
>  drivers/media/pci/intel/ipu6/ipu6-mmu.c       |  833 +++++++++++
>  drivers/media/pci/intel/ipu6/ipu6-mmu.h       |   65 +
>  .../intel/ipu6/ipu6-platform-buttress-regs.h  |  231 +++
>  .../intel/ipu6/ipu6-platform-isys-csi2-reg.h  |  187 +++
>  .../media/pci/intel/ipu6/ipu6-platform-regs.h |  177 +++
>  drivers/media/pci/intel/ipu6/ipu6-platform.h  |   31 +
>  drivers/media/pci/intel/ipu6/ipu6.c           |  969 ++++++++++++
>  drivers/media/pci/intel/ipu6/ipu6.h           |  344 +++++
>  39 files changed, 13147 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/media/pci/intel/ipu6/Kconfig
>  create mode 100644 drivers/media/pci/intel/ipu6/Makefile
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-bus.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-bus.h
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-buttress.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-buttress.h
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-cpd.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-cpd.h
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-dma.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-dma.h
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-com.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-com.h
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-jsl-phy.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-mcd-phy.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-phy.h
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-video.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-video.h
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys.h
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-mmu.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-mmu.h
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-platform-isys-csi2-reg.h
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-platform-regs.h
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-platform.h
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6.h

-- 
Regards,

Laurent Pinchart
