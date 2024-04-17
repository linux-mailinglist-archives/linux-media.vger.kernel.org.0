Return-Path: <linux-media+bounces-9652-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F00F8A7DAF
	for <lists+linux-media@lfdr.de>; Wed, 17 Apr 2024 10:05:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 277321C21A11
	for <lists+linux-media@lfdr.de>; Wed, 17 Apr 2024 08:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 816B17C6E3;
	Wed, 17 Apr 2024 08:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=kolabnow.com header.i=@kolabnow.com header.b="xAiJchLk"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.kolabnow.com (mx.kolabnow.com [212.103.80.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758D6184D
	for <linux-media@vger.kernel.org>; Wed, 17 Apr 2024 08:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.103.80.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713341100; cv=none; b=KO2ok0rj7CVqtg5PeIjZO0lQjwb/JZneiK9/+1J+/d1QncrDmAq7gpEZa5otwH309Bh2XwIR9vCvstvZi2rhw0OHpWSZ58ZwYjdOw8UjukPgz8t7OVqLJW1cY1yOH/x1kRlVAVzCC4n+VlSc9QUsfAuGmOzpzEOeJBuGnjijEVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713341100; c=relaxed/simple;
	bh=MzoqO/9FWoW4IoMD26PIT8LT1GhUxEETqippDr5pXk4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OcX9Y+LKqt1Q8cahGbqXCejh1DJbdCi4uZ/55DgrqCMHxzk1ipudBuIFuhJiKlGNW4ie4iGD58AOG4zmaA29pOj1oe2PCUmZHKITb+c8DEefh1rsQ3suhINHW7ZG0HrcVefnlkvEEGNDqT5VIcgreZmhdnL0S/hJx+6rSgmaDU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hansg.org; spf=pass smtp.mailfrom=hansg.org; dkim=pass (4096-bit key) header.d=kolabnow.com header.i=@kolabnow.com header.b=xAiJchLk; arc=none smtp.client-ip=212.103.80.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hansg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hansg.org
Received: from localhost (unknown [127.0.0.1])
	by mx.kolabnow.com (Postfix) with ESMTP id D16DB30E3E0E;
	Wed, 17 Apr 2024 09:56:46 +0200 (CEST)
Authentication-Results: ext-mx-out013.mykolab.com (amavis);
 dkim=pass (4096-bit key) reason="pass (just generated, assumed good)"
 header.d=kolabnow.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:mime-version:date:date:message-id:received:received:received;
	 s=dkim20160331; t=1713340604; x=1715155005; bh=IwgZl/ti4SS0UiwZ
	Kl4boI+vlvCXg4PxTQ+8NXVZTqc=; b=xAiJchLkZB8C+T+GwcQ75SQcLJWRSqcz
	cm+E16h6LIRdcEJQzEHPXk7sCeF0Q2SseCLg9U4ORVW3zEqIcvV4wZnq4c/SctFD
	1sefGL+1drgk0rBpSoysBS4/+Rak/KvuQ82muSiFYr/xHWIPFHaU0WYZ1WvAaLp0
	WL5/KdymkaL+orrLiqi5Y+4d+WsZtNR9WZIhKJgxU1RmcXQvaqeg5dZxqQzOCpFG
	5E1IDwcotoFAziyKVMqalAFuvDubMZe+N34pdh1Wdtp9hApR6ZDSuTUgL7b7RjI3
	bJ5pIdFdv7pIFEs5VDh6ptEqTwlBpLeQb8jntHo6GBElRwBXF3keu4sK2254KvSh
	Lm3UIJASReyJWfStxGPbdJkx4iX4L7y9h2ZoHcYd4zdnVvoETlvj7hZDyEBTbP7z
	wBnKCEpwt40QWVg6K3GYcVgy1OWwC60Hf6BmeV8/qu8SpSURP5BPdTC3CEqtnqBn
	eTg4RKaBCmw7yiFmvrD8fdH9NXo1F9VPxvBjhwDuST09bOYJMywqXVHoMB1XJSAJ
	ouA2WGYxsgAdGLj/w67RrrkyoaVS0h5I4Fgp46lWMek+liJUrVR1AMxn+8VFypft
	HkR6bv5E8laUGybbXxHz/khlF9E7q2vvUSjQHHfD8br+18BfwtJRGCGfoCNlcnRO
	AFsg/BnPJI4=
X-Virus-Scanned: amavis at mykolab.com
X-Spam-Flag: NO
X-Spam-Score: -1
X-Spam-Level:
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out013.mykolab.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id zKd8iIXf9yo0; Wed, 17 Apr 2024 09:56:44 +0200 (CEST)
Received: from int-mx009.mykolab.com (unknown [10.9.13.9])
	by mx.kolabnow.com (Postfix) with ESMTPS id C052130E3E0D;
	Wed, 17 Apr 2024 09:56:42 +0200 (CEST)
Received: from ext-subm010.mykolab.com (unknown [10.9.6.10])
	by int-mx009.mykolab.com (Postfix) with ESMTPS id 2907A20E5B19;
	Wed, 17 Apr 2024 09:56:42 +0200 (CEST)
Message-ID: <77c32f87-cdec-4dd0-85b8-c75ca7405438@hansg.org>
Date: Wed, 17 Apr 2024 09:56:40 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 00/19] Intel IPU6 and IPU6 input system drivers
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: bingbu.cao@intel.com, laurent.pinchart@ideasonboard.com,
 andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, claus.stovgaard@gmail.com,
 tomi.valkeinen@ideasonboard.com, tfiga@chromium.org,
 senozhatsky@chromium.org, andreaskleist@gmail.com,
 bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com, hongju.wang@intel.com
References: <20240416201105.781496-1-sakari.ailus@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hans@hansg.org>
In-Reply-To: <20240416201105.781496-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,
On 4/16/24 10:10 PM, Sakari Ailus wrote:
> Hello everyone,
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
> 
> I can now capture images from ov01a10 and ov2740 sensors (including
> metadata from the latter).
> 
> The series applies on top of the metadata patchset
> <URL:https://lore.kernel.org/linux-media/20240416193319.778192-1-sakari.ailus@linux.intel.com/T/#t>.

Thank you for the new version!

I assume that the posting of this new version means that you have solved
the stability issues where the laptop would freeze after sttreaming from
an ov2740 sensor with metadata once ?

What about the unrelated ov2740 driver issue where the sensor would not
always start streaming for which you temporarily disabled runtime pm
for the sensor as a workaround any progress on that ?

Do you have a git branch available with the metadata + this series
somewhere for easy testing ?  I would like to give this a test run on
my own IPU6 + ov2740 laptop.

Regards,

Hans






> 
> ---
> since v3:
> 
> - Prepend the series with IPU bridge changes for more reliable
>   IPU bridge initialisation.
> 
> - Split off the IPU6 PCI device ID table (due to the former change).
> 
> - Documentation improvements (mostly non-technical).
> 
> - Update copyright year.
> 
> - Remove unused struct ipu6_buttress_constraint and a few other unused
>   definitions.
> 
> - Miscellaneous cleanups.
> 
> - Make functions static if they can be so.
> 
> - Merge watermark setup error handling bugfix from Hongju.
> 
> - Use media_pad_remote_pad_unique() instead of
>   media_pad_remote_pad_first() in figuring out the remote sub-device.
> 
> - Determine the number of queues by counting the video nodes in the graph.
> 
> - Make the links from the external sub-devices to CSI-2 receivers enabled
>   and immutable.
> 
> - Simplify determining CSI-2 port control base port offset.
> 
> - Create only as many links as needed between CSI-2 receivers and video
>   nodes (one per video node).
> 
> v2 -> v3:
>   - Add line-based metadata capture support
>   - Fix header files inclusion issues
>   - Fix the CSI2 timing calculation
>   - Fix crash when remove module during streaming
>   - Remove some unused code
>   - Use cross-referencing links in documentation
>   - Update Makefile to use ":=" for objects
>   - Fix several bugs and coding style issues
> 
> v1 -> v2:
>   - Add multiplexed streams support
>   - Use auxiliary bus to register IPU6 devices
>   - Add IPU6 hardware and driver overview documentation
>   - Updata IPU6 admin-guide documentation
>   - Update number of source pads and video nodes to support
>     multiplexed streams
> 
> TODOs:
>   - Add firmware CSI2 lanes configuration verification
> 
> Bingbu Cao (16):
>   media: intel/ipu6: add Intel IPU6 PCI device driver
>   media: intel/ipu6: add IPU auxiliary devices
>   media: intel/ipu6: add IPU6 buttress interface driver
>   media: intel/ipu6: CPD parsing for get firmware components
>   media: intel/ipu6: add IPU6 DMA mapping API and MMU table
>   media: intel/ipu6: add syscom interfaces between firmware and driver
>   media: intel/ipu6: input system ABI between firmware and driver
>   media: intel/ipu6: add IPU6 CSI2 receiver v4l2 sub-device
>   media: intel/ipu6: add the CSI2 DPHY implementation
>   media: intel/ipu6: input system video nodes and buffer queues
>   media: intel/ipu6: add the main input system driver
>   media: intel/ipu6: add Kconfig and Makefile
>   MAINTAINERS: add maintainers for Intel IPU6 input system driver
>   media: intel/ipu6: support line-based metadata capture support
>   Documentation: add Intel IPU6 ISYS driver admin-guide doc
>   Documentation: add documentation of Intel IPU6 driver and hardware
>     overview
> 
> Sakari Ailus (3):
>   media: ipu6: Add PCI device table header
>   media: ivsc: csi: Use IPU bridge
>   media: Kconfig: Select MEDIA_CONTROLLER for VIDEO_V4L2_SUBDEV_API
> 
>  Documentation/admin-guide/media/ipu6-isys.rst |  161 ++
>  .../admin-guide/media/ipu6_isys_graph.svg     |  548 +++++++
>  .../admin-guide/media/v4l-drivers.rst         |    1 +
>  .../driver-api/media/drivers/index.rst        |    1 +
>  .../driver-api/media/drivers/ipu6.rst         |  205 +++
>  MAINTAINERS                                   |   10 +
>  drivers/media/pci/intel/Kconfig               |    1 +
>  drivers/media/pci/intel/Makefile              |    1 +
>  drivers/media/pci/intel/ipu6/Kconfig          |   17 +
>  drivers/media/pci/intel/ipu6/Makefile         |   23 +
>  drivers/media/pci/intel/ipu6/ipu6-bus.c       |  165 ++
>  drivers/media/pci/intel/ipu6/ipu6-bus.h       |   58 +
>  drivers/media/pci/intel/ipu6/ipu6-buttress.c  |  912 +++++++++++
>  drivers/media/pci/intel/ipu6/ipu6-buttress.h  |   92 ++
>  drivers/media/pci/intel/ipu6/ipu6-cpd.c       |  362 +++++
>  drivers/media/pci/intel/ipu6/ipu6-cpd.h       |  105 ++
>  drivers/media/pci/intel/ipu6/ipu6-dma.c       |  502 ++++++
>  drivers/media/pci/intel/ipu6/ipu6-dma.h       |   19 +
>  drivers/media/pci/intel/ipu6/ipu6-fw-com.c    |  413 +++++
>  drivers/media/pci/intel/ipu6/ipu6-fw-com.h    |   47 +
>  drivers/media/pci/intel/ipu6/ipu6-fw-isys.c   |  487 ++++++
>  drivers/media/pci/intel/ipu6/ipu6-fw-isys.h   |  568 +++++++
>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  667 ++++++++
>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |   82 +
>  .../media/pci/intel/ipu6/ipu6-isys-dwc-phy.c  |  536 +++++++
>  .../media/pci/intel/ipu6/ipu6-isys-jsl-phy.c  |  242 +++
>  .../media/pci/intel/ipu6/ipu6-isys-mcd-phy.c  |  720 +++++++++
>  .../media/pci/intel/ipu6/ipu6-isys-queue.c    |  824 ++++++++++
>  .../media/pci/intel/ipu6/ipu6-isys-queue.h    |   78 +
>  .../media/pci/intel/ipu6/ipu6-isys-subdev.c   |  408 +++++
>  .../media/pci/intel/ipu6/ipu6-isys-subdev.h   |   59 +
>  .../media/pci/intel/ipu6/ipu6-isys-video.c    | 1401 +++++++++++++++++
>  .../media/pci/intel/ipu6/ipu6-isys-video.h    |  137 ++
>  drivers/media/pci/intel/ipu6/ipu6-isys.c      | 1368 ++++++++++++++++
>  drivers/media/pci/intel/ipu6/ipu6-isys.h      |  206 +++
>  drivers/media/pci/intel/ipu6/ipu6-mmu.c       |  845 ++++++++++
>  drivers/media/pci/intel/ipu6/ipu6-mmu.h       |   73 +
>  .../intel/ipu6/ipu6-platform-buttress-regs.h  |  226 +++
>  .../intel/ipu6/ipu6-platform-isys-csi2-reg.h  |  172 ++
>  .../media/pci/intel/ipu6/ipu6-platform-regs.h |  179 +++
>  drivers/media/pci/intel/ipu6/ipu6.c           |  895 +++++++++++
>  drivers/media/pci/intel/ipu6/ipu6.h           |  342 ++++
>  drivers/media/pci/intel/ivsc/mei_csi.c        |   20 +-
>  drivers/media/v4l2-core/Kconfig               |    3 +-
>  include/media/ipu6-pci-table.h                |   28 +
>  45 files changed, 14206 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/admin-guide/media/ipu6-isys.rst
>  create mode 100644 Documentation/admin-guide/media/ipu6_isys_graph.svg
>  create mode 100644 Documentation/driver-api/media/drivers/ipu6.rst
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
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6.h
>  create mode 100644 include/media/ipu6-pci-table.h
> 


