Return-Path: <linux-media+bounces-10253-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CC88B3F0A
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 20:15:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B5F51F233A4
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 18:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 768AA160787;
	Fri, 26 Apr 2024 18:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="ezXxP99P"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2643716C86A
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 18:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714155192; cv=pass; b=SvrCYp6YtS3gowCXv6oy1iiRpq8HnpXaTwBJasl64og10zTA+Y10oh8Nm2sTEFklUIah0FKF2d71UzP51H1OPTDPyw3GctqsOXvrwGa37p9piRfxU/PaaNdGPNGyQoZZvUqEIREmcXWhwDdMNTk87F2tAeZeRionkA7BRR5g9/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714155192; c=relaxed/simple;
	bh=IpSDOwePLW9F/XkdYIjChV34n9MwCEEUA/eMlJU99nY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NKOXsptmseioCOHcEdHV3lIkfrT/lRp6oku5dXozX/DrajqeKgcThn/97KWvaPNyMy/hN35ALJk3n1eTiiamePc5W/Mm4Dkk3hYrwpAwfkbrvxIUbgrAXLEKvRfyhfuQMf5d6QmpqCaTCJ0BctSbnQ612F3usX5Hj0RQCuRj5Ys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=ezXxP99P; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4VR16p0Gcxz49Q3M;
	Fri, 26 Apr 2024 21:13:05 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1714155186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=IoolqVQX+TNNXzyjr78nwoy2F26ZHRTVqfvzziRNGdI=;
	b=ezXxP99PkdQwzkJQwX3Li3kHNizANl2FdrR4ED/A41e1Vw7Wo3zC3G1hjrTPDG6b5Z1vPY
	bjX5uKpICtGcpcMablUutvvmj/se9LHgPoP1f+CpuR1vBn0NP6XCkcYs2DwNgFvcWGIJEW
	/MWI4vYMFae/h1UUCfkl3DPl4RciVEfiyAncHjm4YoC8CoF3Nnk+wNuGdqfcvhrhWigheA
	u1JqWW20Oacz2FFfEBO13BxlKpYmtAA+lPQbTM1Rj6viuLhooM1Ufe08EvO92QHBi1+RPE
	7MLA2Hvy3sJUpklYt6pL9I4RE002kRtQBazTZkvsQ52T1v7S0+f5VlT42ESJ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1714155186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=IoolqVQX+TNNXzyjr78nwoy2F26ZHRTVqfvzziRNGdI=;
	b=t78+5oLakxBdhCBHv0b/rONz6kFJa3+z7s+p3+lmeERDRof+PM/euZzE+ygnAytpdXqp0O
	gGj0fWoP2/8XDvpgrqjMgeT1DtIxrpVGL70HjWyXK38oldWIot1qlORLbXGR5vBM6LGGb7
	XUlHPAiwjHHubXdgTy6vqK8irH/qnAW5KQFdQLR9fQPe/1SEeypZJ5kHFt/C1euyRX2Fk9
	vHuVsLqn2bvT/DnkkGQ4Kn9nUN0kguE8t++3YUIIOoUodbb8vf8+8qujYfnZRAwv2aoLX5
	PnWHSeOHu037Pe3WNgV+EHTiIBUczGibyPUfnv8mT7P74t0kbRqaXfDfnD06vQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1714155186; a=rsa-sha256;
	cv=none;
	b=leQn0t6t7UWQ0VZuTHLU4zzyLb5TwzZx8nIsVnahqlazcAut4e5e8uGJQ9UHKC6xdw8CRt
	4lQhj5sJvZxF3p/BSYCyiWQRZ5VhA9Ys8UAE3n97ocJGICWAyQptSuJL7/R1+K0OtSqAG1
	TZPyGQFOp4X8IAIJ7lW6aNjzmd23PZ2A7hbwNiLoAKcawoGOCdLLir1xlzxwdX4SGJsfjA
	dBDQt97QF8dPcLmpcgkc3PMpanp+aSqFMTOvlBIfF+8PtyjYYOGxGfLRDs6aKN2+A1Cwme
	/BNLugYJEsUCSwxahMUkW+XoZtX/ACd0k/10yvQCCTwwO4+pRMBxPmF+FS3FNg==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id AFB97634CA9;
	Fri, 26 Apr 2024 21:13:05 +0300 (EEST)
Date: Fri, 26 Apr 2024 18:13:05 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>, laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org
Subject: [GIT PULL v3 FOR 6.10] Unicam and IPU6 ISYS drivers
Message-ID: <ZivusZfL8cC6HPum@valkosipuli.retiisi.eu>
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

since v2:

- Toss Laurent's patch to disable the metadata format definitions in
  UAPI, on the top.

- Squash Laurent's patch to fix ret assignment in the Unicam driver.

since v1:

- Fix a compile issue in an intermediate patch. The result is unaffected by
  this (no diff).

The diff to v2 is:

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index e91d02a64770..6ac4ea8efb1a 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -2519,6 +2519,7 @@ static int unicam_async_nf_init(struct unicam_device *unicam)
 		    num_data_lanes != 4) {
 			dev_err(unicam->dev, "%u data lanes not supported\n",
 				num_data_lanes);
+			ret = -EINVAL;
 			goto error;
 		}
 
@@ -2526,6 +2527,7 @@ static int unicam_async_nf_init(struct unicam_device *unicam)
 			dev_err(unicam->dev,
 				"Endpoint uses %u data lanes when %u are supported\n",
 				num_data_lanes, unicam->max_data_lanes);
+			ret = -EINVAL;
 			goto error;
 		}
 
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 2f9762842313..fe6b67e83751 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -841,6 +841,7 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */
 #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
 
+#ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when
  * adding new ones!
@@ -852,6 +853,7 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_GENERIC_CSI2_16	v4l2_fourcc('M', 'C', '1', 'G') /* 16-bit CSI-2 packed 8-bit metadata */
 #define V4L2_META_FMT_GENERIC_CSI2_20	v4l2_fourcc('M', 'C', '1', 'K') /* 20-bit CSI-2 packed 8-bit metadata */
 #define V4L2_META_FMT_GENERIC_CSI2_24	v4l2_fourcc('M', 'C', '1', 'O') /* 24-bit CSI-2 packed 8-bit metadata */
+#endif
 
 /* priv field value to indicates that subsequent fields are valid. */
 #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe

Please pull.


The following changes since commit faa4364bef2ec0060de381ff028d1d836600a381:

  media: stk1160: fix bounds checking in stk1160_copy_video() (2024-04-24 13:49:56 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.10-metadata-5-no-fmts-signed

for you to fetch changes up to 58e783fc4885b2f04e7ae201a6f854dd4dfde06d:

  media: uapi: v4l: Don't expose generic metadata formats to userspace (2024-04-26 21:09:31 +0300)

----------------------------------------------------------------
Unicam and IPU6 ISYS drivers, with metadata formats but in-kernel only

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

Laurent Pinchart (2):
      media: v4l2-subdev: Clearly document that the crop API won't be extended
      media: uapi: v4l: Don't expose generic metadata formats to userspace

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
 drivers/media/platform/broadcom/bcm2835-unicam.c   | 2743 ++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c               |   43 +-
 drivers/media/v4l2-core/v4l2-subdev.c              |   50 +-
 include/media/ipu6-pci-table.h                     |   28 +
 include/media/v4l2-subdev.h                        |   42 +
 include/uapi/linux/media-bus-format.h              |    9 +
 include/uapi/linux/v4l2-mediabus.h                 |   18 +-
 include/uapi/linux/v4l2-subdev.h                   |   14 +-
 include/uapi/linux/videodev2.h                     |   26 +
 69 files changed, 18263 insertions(+), 65 deletions(-)
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

