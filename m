Return-Path: <linux-media+bounces-10192-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFAC8B3399
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 11:09:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93264286582
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 09:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3661313D89C;
	Fri, 26 Apr 2024 09:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="rpLMW8l0"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6CB13CFA0
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 09:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714122536; cv=pass; b=GE0zEKajGFjudBWdPSUhyenaHdxuKLayl9lWGYAk5S42+rBGxPn+GDjdFIt7uG+ScE6MHGCK6xFxRg7MpfqV38WOlEoO3eYh0e5BverxBXme1bJ5saV4KLLzwQvirhGGigu3iajmTgdAuazhT04FiYYpEcw/+wizVW3q0ZjXUz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714122536; c=relaxed/simple;
	bh=232VZ5Q1mYb/2w2p/LdFwuCtfTp3ocVv43AhmXvtVXs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L86iOVJxfRwicpZlTjrHEwzAA/H6xKiczvZX4TtYsc8wOsfiBB7JxOF2cCx1A/y4CxiG9eNXUJBslKVTuX5IAPyVXAhPLCHHkY84oQm3G49K8jkeYfvr6m2ziYBYO3vPsjTqpV8Nwm7/c/MoozTPP+mkE2D03TwXI1cZqI1QpBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=rpLMW8l0; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4VQn2p15kQz49Q35;
	Fri, 26 Apr 2024 12:08:50 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1714122530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=VGH1/kA3XFUGm6t4GwQ/vNh6coFSHz94Tpte7kyssTk=;
	b=rpLMW8l0NRTwotGOElWxul8ev0yRLaW/amJFTBgEsuVQiO+auUiVBie3zswQDp/iaKw5cE
	rDJwMJKJKerWRdvzbdi5eOGGX7vbeeafwR+JK5bn+ma1Q5SI+PoSGmy/LQ70kBRzx8LoTg
	7VqVJo6J+STl8p1PLNKzVLwqrObGZweGBAK2m93q87g3kdbtfivKfuY+etc/0hgiyi5EPa
	2yBCBz7OJ4Y/MkrcGjZ2HCJPKpsKmkKS9Q0XfXInvzvZpIdGKLdccsDbxbL+coSOLpdGZC
	wMca4sWAmGD4cEU4ko0msQY6qbnwW2ZqdJ6HrdcyfSAz0VA/fcbkDRK6hkxZAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1714122530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=VGH1/kA3XFUGm6t4GwQ/vNh6coFSHz94Tpte7kyssTk=;
	b=elkuK53C3rRnB1ub9+xsCjUAi/hxw5ISwqoAefhKflbNx/41uWv5JBZaUoeupR6q8kdsgB
	lyFK0L03klkh+H3h3NAZ0AYIwLr5d/xanhaup7SbGGvKyj8QA11cswta4+8XgM59LXP4uB
	UzmA68VcqXjeELRRXS9BtIYkheo5dyXD+Z8vkF2H80jkSL+lGX3W2Qe4Bo03Li/lY5EtRN
	7Z/tFi2x0sLV+GjaXm8NffXcWnSPsUxyPvEyt2eEy+H6EJHFapEOceo0hZ77492zmNOx6W
	AgYjgI5HUq5x6GVkXZs8FP0Z0HZ+Y9N5LAC91Ly03/4E8sLsxtpYWEbLCPyO3g==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1714122530; a=rsa-sha256;
	cv=none;
	b=ioFb+/qo423nEvqUx9ADWdSrllJI0bpDu3PNYCpG6xa3yh9d1N9hWxLPdW5tHQClFttJye
	3q3g6qf5QaBLTZtHH2VqA0tIHyFZHiRCtETRKQOke2rZq0n+v/zJhmcgVNFUq69c0G2pVZ
	ADjoUlgQyIV7WfJ5PBWEUzr5NLrNRgZvDJfGR6U0sSyas2lpznf+qv692y/1sFUqRzoMC3
	IrHOgdT9YL2HurD8zNsf3taUAw0e5wAqe+k82AJabbhaZstEMSEgpq4HmDAxNBPcUEVg8a
	BAlwWYVhIO8kcMVfJit1ypitZQOZjymTYK7lNcJbJv9uh90dQDyEHIhSSIjqGA==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id E491F634C96;
	Fri, 26 Apr 2024 12:08:49 +0300 (EEST)
Date: Fri, 26 Apr 2024 09:08:49 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR 6.10] Unicam and IPU6 ISYS drivers
Message-ID: <ZitvIaILBsCaYGhS@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

Here are drivers for Unicam and IPU6 ISYS, prepended by the first part of
the metadata series. Both drivers can be used without the ROUTING IOCTL
with partial functionality. The ROUTING IOCTL enablement patch will enable
the rest of the functionality when it is merged later on.

Please pull.


The following changes since commit faa4364bef2ec0060de381ff028d1d836600a381:

  media: stk1160: fix bounds checking in stk1160_copy_video() (2024-04-24 13:49:56 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.10-metadata-2-signed

for you to fetch changes up to 11446f255e33a704779d7ee95edaffd14f415d80:

  media: Documentation: add documentation of Intel IPU6 driver and hardware overview (2024-04-26 11:39:38 +0300)

----------------------------------------------------------------
Unicam and IPU6 ISYS drivers, with additional metadata patches

----------------------------------------------------------------
Bingbu Cao (16):
      media: intel/ipu6: add Intel IPU6 PCI device driver
      media: intel/ipu6: add IPU auxiliary devices
      media: intel/ipu6: add IPU6 buttress interface driver
      media: intel/ipu6: CPD parsing for get firmware components
      media: intel/ipu6: add IPU6 DMA mapping API and MMU table
      media: intel/ipu6: add syscom interfaces between firmware and driver
      media: intel/ipu6: input system ABI between firmware and driver
      media: intel/ipu6: add IPU6 CSI2 receiver v4l2 sub-device
      media: intel/ipu6: add the CSI2 DPHY implementation
      media: intel/ipu6: input system video nodes and buffer queues
      media: intel/ipu6: add the main input system driver
      media: intel/ipu6: add Kconfig and Makefile
      media: MAINTAINERS: add maintainers for Intel IPU6 input system driver
      media: intel/ipu6: support line-based metadata capture support
      media: Documentation: add Intel IPU6 ISYS driver admin-guide doc
      media: Documentation: add documentation of Intel IPU6 driver and hardware overview

Dave Stevenson (2):
      dt-bindings: media: Add bindings for bcm2835-unicam
      media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface

Jean-Michel Hautbois (2):
      media: v4l: Add V4L2-PIX-FMT-Y12P format
      media: v4l: Add V4L2-PIX-FMT-Y14P format

Laurent Pinchart (1):
      media: v4l2-subdev: Clearly document that the crop API won't be extended

Sakari Ailus (15):
      media: Documentation: Add "stream" into glossary
      media: uapi: Add generic serial metadata mbus formats
      media: uapi: Document which mbus format fields are valid for metadata
      media: uapi: v4l: Add generic 8-bit metadata format definitions
      media: v4l: Support line-based metadata capture
      media: v4l: Set line based metadata flag in V4L2 core
      media: Documentation: Additional streams generally don't harm capture
      media: Documentation: Document S_ROUTING behaviour
      media: v4l: subdev: Add a function to lock two sub-device states, use it
      media: v4l: subdev: Copy argument back to user also for S_ROUTING
      media: v4l: subdev: Add len_routes field to struct v4l2_subdev_routing
      media: v4l: subdev: Return routes set using S_ROUTING
      media: v4l: subdev: Add trivial set_routing support
      media: ipu6: Add PCI device table header
      media: ivsc: csi: Use IPU bridge

 Documentation/admin-guide/media/ipu6-isys.rst      |  161 ++
 .../admin-guide/media/ipu6_isys_graph.svg          |  548 ++++
 Documentation/admin-guide/media/v4l-drivers.rst    |    1 +
 .../bindings/media/brcm,bcm2835-unicam.yaml        |  127 +
 Documentation/driver-api/media/drivers/index.rst   |    1 +
 Documentation/driver-api/media/drivers/ipu6.rst    |  205 ++
 Documentation/userspace-api/media/glossary.rst     |   12 +
 Documentation/userspace-api/media/v4l/dev-meta.rst |   21 +
 .../userspace-api/media/v4l/dev-subdev.rst         |   31 +-
 .../userspace-api/media/v4l/meta-formats.rst       |    3 +-
 .../userspace-api/media/v4l/metafmt-generic.rst    |  340 +++
 .../userspace-api/media/v4l/pixfmt-yuv-luma.rst    |   48 +
 .../userspace-api/media/v4l/subdev-formats.rst     |  269 +-
 .../userspace-api/media/v4l/vidioc-enum-fmt.rst    |    7 +
 .../media/v4l/vidioc-subdev-g-crop.rst             |    6 +-
 .../media/v4l/vidioc-subdev-g-routing.rst          |   51 +-
 .../userspace-api/media/videodev2.h.rst.exceptions |    1 +
 MAINTAINERS                                        |   17 +
 drivers/media/pci/intel/Kconfig                    |    1 +
 drivers/media/pci/intel/Makefile                   |    1 +
 drivers/media/pci/intel/ipu6/Kconfig               |   18 +
 drivers/media/pci/intel/ipu6/Makefile              |   23 +
 drivers/media/pci/intel/ipu6/ipu6-bus.c            |  165 ++
 drivers/media/pci/intel/ipu6/ipu6-bus.h            |   58 +
 drivers/media/pci/intel/ipu6/ipu6-buttress.c       |  912 +++++++
 drivers/media/pci/intel/ipu6/ipu6-buttress.h       |   92 +
 drivers/media/pci/intel/ipu6/ipu6-cpd.c            |  362 +++
 drivers/media/pci/intel/ipu6/ipu6-cpd.h            |  105 +
 drivers/media/pci/intel/ipu6/ipu6-dma.c            |  502 ++++
 drivers/media/pci/intel/ipu6/ipu6-dma.h            |   19 +
 drivers/media/pci/intel/ipu6/ipu6-fw-com.c         |  413 +++
 drivers/media/pci/intel/ipu6/ipu6-fw-com.h         |   47 +
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c        |  487 ++++
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.h        |  568 ++++
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c      |  663 +++++
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h      |   82 +
 drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c   |  536 ++++
 drivers/media/pci/intel/ipu6/ipu6-isys-jsl-phy.c   |  242 ++
 drivers/media/pci/intel/ipu6/ipu6-isys-mcd-phy.c   |  720 +++++
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c     |  811 ++++++
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.h     |   78 +
 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c    |  403 +++
 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h    |   59 +
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c     | 1399 ++++++++++
 drivers/media/pci/intel/ipu6/ipu6-isys-video.h     |  141 +
 drivers/media/pci/intel/ipu6/ipu6-isys.c           | 1367 ++++++++++
 drivers/media/pci/intel/ipu6/ipu6-isys.h           |  206 ++
 drivers/media/pci/intel/ipu6/ipu6-mmu.c            |  845 ++++++
 drivers/media/pci/intel/ipu6/ipu6-mmu.h            |   73 +
 .../pci/intel/ipu6/ipu6-platform-buttress-regs.h   |  226 ++
 .../pci/intel/ipu6/ipu6-platform-isys-csi2-reg.h   |  172 ++
 drivers/media/pci/intel/ipu6/ipu6-platform-regs.h  |  179 ++
 drivers/media/pci/intel/ipu6/ipu6.c                |  895 +++++++
 drivers/media/pci/intel/ipu6/ipu6.h                |  342 +++
 drivers/media/pci/intel/ivsc/mei_csi.c             |   20 +-
 drivers/media/platform/Kconfig                     |    1 +
 drivers/media/platform/Makefile                    |    1 +
 drivers/media/platform/broadcom/Kconfig            |   23 +
 drivers/media/platform/broadcom/Makefile           |    3 +
 .../media/platform/broadcom/bcm2835-unicam-regs.h  |  246 ++
 drivers/media/platform/broadcom/bcm2835-unicam.c   | 2741 ++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c               |   43 +-
 drivers/media/v4l2-core/v4l2-subdev.c              |   50 +-
 include/media/ipu6-pci-table.h                     |   28 +
 include/media/v4l2-subdev.h                        |   42 +
 include/uapi/linux/media-bus-format.h              |    9 +
 include/uapi/linux/v4l2-mediabus.h                 |   18 +-
 include/uapi/linux/v4l2-subdev.h                   |   14 +-
 include/uapi/linux/videodev2.h                     |   24 +
 69 files changed, 18259 insertions(+), 65 deletions(-)
 create mode 100644 Documentation/admin-guide/media/ipu6-isys.rst
 create mode 100644 Documentation/admin-guide/media/ipu6_isys_graph.svg
 create mode 100644 Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
 create mode 100644 Documentation/driver-api/media/drivers/ipu6.rst
 create mode 100644 Documentation/userspace-api/media/v4l/metafmt-generic.rst
 create mode 100644 drivers/media/pci/intel/ipu6/Kconfig
 create mode 100644 drivers/media/pci/intel/ipu6/Makefile
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-bus.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-bus.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-buttress.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-buttress.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-cpd.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-cpd.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-dma.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-dma.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-com.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-com.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-jsl-phy.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-mcd-phy.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-video.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-video.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-mmu.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-mmu.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-platform-isys-csi2-reg.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-platform-regs.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6.h
 create mode 100644 drivers/media/platform/broadcom/Kconfig
 create mode 100644 drivers/media/platform/broadcom/Makefile
 create mode 100644 drivers/media/platform/broadcom/bcm2835-unicam-regs.h
 create mode 100644 drivers/media/platform/broadcom/bcm2835-unicam.c
 create mode 100644 include/media/ipu6-pci-table.h

-- 
Kind regards,

Sakari Ailus

