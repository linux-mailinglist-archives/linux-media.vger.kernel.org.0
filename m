Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02A057D6ADB
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 14:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233880AbjJYMJK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 08:09:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232666AbjJYMJJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 08:09:09 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F40648F
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 05:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698235746; x=1729771746;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XQpy2ptIfOj9q3hmmgnSUvAijOMR+dqn2dPcGci4hBA=;
  b=FXYx6eNN7GJhv5vdoUK1AO0PKinWJQQBC3zrMjxS73AShihIoiSAJyCO
   7vKWnkNzCoLplLtdJfKRPMea1m0MKVdcS6YmiolxpO3Pw+vFnw+V94IdA
   P/TalV8EEXw8dsYrQIYNOdxSuZbM2irg775Y+CzmvSbt9VHQFFdzH/Fuk
   UbaVbafSI7i8JwRTIl3Ng/eretAPxWzkM71V/ulN3fv/cuFMoa47na1DZ
   V+f99QmIMoeJ9On1zWCMreqKb1xqTlY3SIOnyXnqgtsdIF8/gfy4mRqvv
   yi2Tn4Oshj2GULgvlblAoUpIdLX3uhdguHmwsR3TqrcejoT6eSF4TNRTS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="387109374"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="387109374"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 05:09:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="849510769"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="849510769"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 05:09:03 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 3EFB211F82E;
        Wed, 25 Oct 2023 15:09:01 +0300 (EEST)
Date:   Wed, 25 Oct 2023 12:09:01 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     bingbu.cao@intel.com
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
        ilpo.jarvinen@linux.intel.com, andreaskleist@gmail.com,
        claus.stovgaard@gmail.com, tfiga@chromium.org,
        senozhatsky@chromium.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com,
        hongju.wang@intel.com
Subject: Re: [PATCH v2 15/15] Documentation: add documentation of Intel IPU6
 driver and hardware overview
Message-ID: <ZTkFXRwqyU8J8JDT@kekkonen.localdomain>
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
 <20231024112924.3934228-16-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231024112924.3934228-16-bingbu.cao@intel.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

Thanks for the patch. It's a nice piece of documentation for the most
complex CSI-2 receiver driver. :-)

On Tue, Oct 24, 2023 at 07:29:24PM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> Add a documentation for an overview of IPU6 hardware and describe the main
> the components of IPU6 driver.
> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>  .../driver-api/media/drivers/index.rst        |   1 +
>  .../driver-api/media/drivers/ipu6.rst         | 205 ++++++++++++++++++
>  2 files changed, 206 insertions(+)
>  create mode 100644 Documentation/driver-api/media/drivers/ipu6.rst
> 
> diff --git a/Documentation/driver-api/media/drivers/index.rst b/Documentation/driver-api/media/drivers/index.rst
> index c4123a16b5f9..7f6f3dcd5c90 100644
> --- a/Documentation/driver-api/media/drivers/index.rst
> +++ b/Documentation/driver-api/media/drivers/index.rst
> @@ -26,6 +26,7 @@ Video4Linux (V4L) drivers
>  	vimc-devel
>  	zoran
>  	ccs/ccs
> +	ipu6
>  
>  
>  Digital TV drivers
> diff --git a/Documentation/driver-api/media/drivers/ipu6.rst b/Documentation/driver-api/media/drivers/ipu6.rst
> new file mode 100644
> index 000000000000..2685e4a0d7ba
> --- /dev/null
> +++ b/Documentation/driver-api/media/drivers/ipu6.rst
> @@ -0,0 +1,205 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +==================
> +Intel IPU6 Driver
> +==================
> +
> +Author: Bingbu Cao <bingbu.cao@intel.com>
> +
> +Overview
> +=========
> +
> +Intel IPU6 is the sixth generation of Intel Image Processing Unit used in some
> +Intel Chipsets such as Tiger Lake, Jasper Lake, Alder Lake, Raptor Lake and
> +Meteor Lake. IPU6 consists of two major systems - Input System (IS) and

I'd use a semicolon:				  ^

> +Processing System (PS). IPU6 are visible on the PCI bus as a single device,
> +it can be found by ``lspci``:
> +
> +``0000:00:05.0 Multimedia controller: Intel Corporation Device xxxx (rev xx)``
> +
> +IPU6 has a 16 MB BAR in PCI configuration Space for MMIO registers which is
> +visible for driver.
> +
> +Buttress
> +=========
> +
> +The IPU6 is connecting to the system fabric with ``Buttress`` which is enabling
> +host driver to control the IPU6, it also allows IPU6 access the system memory to
> +store and load frame pixel streams and any other metadata.
> +
> +``Buttress`` mainly manages several system functionalities - power management,
> +interrupt handling, firmware authentication and global timer sync.
> +
> +IS and PS Power flow
> +---------------------------
> +
> +IPU6 driver initialize the IS and PS power up or down request by setting the
> +Buttress frequency control register for IS and PS -
> +``IPU6_BUTTRESS_REG_IS_FREQ_CTL`` and ``IPU6_BUTTRESS_REG_PS_FREQ_CTL`` in
> +function:
> +
> +.. c:function:: int ipu6_buttress_power(..., bool on)
> +
> +Buttress forwards the request to Punit, after Punit execute the power up flow,
> +buttress indicates driver that IS or PS is powered up by updating the power
> +status registers.
> +
> +.. Note:: IS power up needs take place prior to PS power up, IS power down needs
> +	  take place after PS power down due to hardware limitation.
> +
> +
> +Interrupt
> +------------
> +
> +IPU6 interrupt can be generated as MSI or INTA, interrupt will be triggered
> +when IS, PS, Buttress event or error happen, driver can get the interrupt
> +cause by reading the interrupt status register ``BUTTRESS_REG_ISR_STATUS``,
> +driver firstly clear the irq status and then call specific IS or PS irq handler.
> +
> +.. c:function:: irqreturn_t ipu6_buttress_isr(int irq, ...)
> +
> +Security and firmware authentication
> +-------------------------------------
> +To address the IPU6 firmware security concerns, the IPU6 firmware needs to
> +undergo an authentication process before it is allowed to executed on the IPU6
> +internal processors. Driver will work with Converged Security Engine (CSE) to
> +complete authentication process. CSE is responsible of authenticating the
> +IPU6 firmware, the authenticated firmware binary is copied into an isolated
> +memory region. Firmware authentication process is implemented by CSE following
> +an IPC handshake with driver. There are some Buttress registers used by CSE and
> +driver to communicate with each other as IPC messages.
> +
> +.. c:function:: int ipu6_buttress_authenticate(...)
> +
> +Global timer sync
> +------------------
> +IPU driver initiates a Hammock Harbor synchronization flow each time it starts
> +camera operation. IPU will synchronizes an internal counter in the Buttress
> +with a copy of SoC time, this counter keeps the updated time until camera
> +operation is stopped. Driver can use this time counter to calibrate the
> +timestamp based on the timestamp in response event from firmware.
> +
> +.. c:function:: int ipu6_buttress_start_tsc_sync(...)
> +
> +
> +DMA and MMU
> +============
> +
> +IPU6 has its own scalar processor where the firmware run at, it has
> +an internal 32-bits virtual address space. IPU6 has MMU address translation
> +hardware to allow that scalar process access the internal memory and external
> +system memory through IPU6 virtual address. The address translation is
> +based on two levels of page lookup tables stored in system memory which are
> +maintained by IPU6 driver. IPU6 driver sets the level-1 page table base address
> +to MMU register and allow MMU to lookup the page table.
> +
> +IPU6 driver exports its own DMA operations. Driver will update the page table
> +entries for each DMA operation and invalidate the MMU TLB after each unmap and
> +free.
> +
> +.. code-block:: none
> +
> +    const struct dma_map_ops ipu6_dma_ops = {
> +	   .alloc = ipu6_dma_alloc,
> +	   .free = ipu6_dma_free,
> +	   .mmap = ipu6_dma_mmap,
> +	   .map_sg = ipu6_dma_map_sg,
> +	   .unmap_sg = ipu6_dma_unmap_sg,
> +	   ...
> +    };
> +
> +.. Note:: IPU6 MMU works behind IOMMU, so for each IPU6 DMA ops, driver will
> +	  call generic PCI DMA ops to ask IOMMU to do the additional mapping
> +	  if VT-d enabled.
> +
> +
> +Firmware file format
> +=====================
> +
> +IPU6 release the firmware in Code Partition Directory (CPD) file format. The
> +CPD firmware contains a CPD header, several CPD entries and CPD components.
> +CPD component includes 3 entries - manifest, metadata and module data. Manifest
> +and metadata are defined by CSE and used by CSE for authentication. Module data
> +is defined by IPU6 which holds the binary data of firmware called package
> +directory. IPU6 driver (``ipu6-cpd.c``) parses and validates the CPD firmware
> +file and get the package directory binary data of IPU6 firmware, copy it to
> +specific DMA buffer and sets its base address to Buttress ``FW_SOURCE_BASE``
> +register, CSE will do authentication for this firmware binary.
> +
> +
> +Syscom interface
> +================
> +
> +IPU6 driver communicates with firmware via syscom ABI. Syscom is an
> +inter-processor communication mechanism between IPU scalar processor and CPU.
> +There are a number of resources shared between firmware and software.
> +A system memory region where the message queues reside, firmware can access the
> +memory region via IPU MMU. Syscom queues are FIFO fixed depth queues with
> +configurable elements ``token`` (message). There is also a common IPU MMIO
> +registers where the queue read and write indices reside. Software and firmware
> +work as producer and consumer of tokens in queue, and update the write and read
> +indices separately when sending or receiving each message.
> +
> +IPU6 driver must prepare and configure the number of input and output queues,
> +configure the count of tokens per queue and the size of per token before
> +initiate and start the communication with firmware, firmware and software must
> +use same configurations. IPU6 Buttress has a number of firmware boot parameter
> +registers which can be used to store the address of configuration and initiate
> +the Syscom state, then driver can request firmware to start and run via setting
> +the scalar processor control status register.
> +
> +
> +Input System
> +==============
> +
> +IPU6 input system consists of MIPI D-PHY and several CSI receiver controllers,
> +it can capture image pixel data from camera sensors or other MIPI CSI output
> +devices.
> +
> +DPHYs and CSI2 ports lane mapping

"D-PHY" and "CSI-2"

> +---------------------------------
> +
> +IPU6 integrates different D-PHY IPs on different SoCs, on Tiger Lake and Alder
> +Lake, IPU6 integrates MCD10 D-PHY, IPU6SE on Jasper Lake integrates JSL D-PHY
> +and IPU6EP on Meteor Lake integrates a Synopsys DWC D-PHY. There is an adaption
> +layer between D-PHY and CSI receiver controller which includes port
> +configuration, PHY wrapper or private test interfaces for D-PHY. There are 3
> +D-PHY drivers ``ipu6-isys-mcd-phy.c``, ``ipu6-isys-jsl-phy.c`` and
> +``ipu6-isys-dwc-phy.c`` program the above 3 D-PHYs in IPU6.
> +
> +Different IPU6 version has different DPHY lanes mappings, On Tiger Lake, there
> +are 12 data lanes and 8 clock lanes, IPU6 support maximum 8 CSI2 ports, see
> +the ppi mmapping in ``ipu6-isys-mcd-phy.c`` for more information. On Jasper Lake
> +and Alder Lake, DPHY has 8 data lanes and 4 clock lanes, IPU6 support maximum 4
> +CSI2 ports. For Meteor Lake, DPHY has 12 data lanes and 6 clock lanes, IPU6
> +support maximum 6 CSI2 ports.
> +
> +.. Note:: Each adjacent CSI ports work as a pair and share the data lanes.
> +	  For example, for CSI port 0 and 1, CSI port 0 support maximum 4
> +	  data lanes, CSI port 1 support maximum 2 data lanes, CSI port 0
> +	  with 2 data lanes can work together with CSI port 1 with 2 data lanes.
> +	  If trying to use CSI port 0 with 4 lanes, CSI port 1 will not be
> +	  available as the 4 data lanes are shared by CSI port 0 and 1. Same
> +	  scenario is also applied for CSI port 2/3, 4/5 and 7/8.
> +
> +IS firmware ABIs
> +----------------
> +
> +IPU6 firmware define a series of ABIs to software. In general, software firstly
> +prepare the stream configuration ``struct ipu6_fw_isys_stream_cfg_data_abi``
> +and send the configuration to firmware via sending ``STREAM_OPEN`` command.
> +Stream configuration includes input pins and output pins, input pin
> +``struct ipu6_fw_isys_input_pin_info_abi`` defines the resolution and data type
> +of input source, output pin ``struct ipu6_fw_isys_output_pin_info_abi``
> +defines the output resolution, stride and frame format, etc. Once driver get the
> +interrupt from firmware that indicates stream open successfully, driver will
> +send the ``STREAM_START`` and ``STREAM_CAPTURE`` command to request firmware to
> +start capturing image frames. ``STREAM_CAPTURE`` command queues the buffers to
> +firmware with ``struct ipu6_fw_isys_frame_buff_set``, software then wait the
> +interrupt and response from firmware, ``PIN_DATA_READY`` means data ready
> +on specific output pin and then software return the buffers to user.
> +
> +.. Note:: See Documentation/admin-guide/media/ipu6-isys.rst for how to do

Could you add a direct link instead? See e.g.
Documentation/driver-api/media/camera-sensor.rst for an example.

> +	  capture by IPU6 IS driver.
> +
> +

-- 
Regards,

Sakari Ailus
