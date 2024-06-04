Return-Path: <linux-media+bounces-12502-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D29CE8FAC26
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 09:38:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 897D92824C4
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 07:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F6DE14039D;
	Tue,  4 Jun 2024 07:37:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C45D1EB30
	for <linux-media@vger.kernel.org>; Tue,  4 Jun 2024 07:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717486678; cv=none; b=HZUtP82BSaPs/SnU2NxdoGj0Rcd+wiV0a9YTpOH1GB0hZsb7TyITSMrgHIa4byfIu3uCg692yGBM0AIBizBdEcvSJq6CPDChZWuKRfe7lnSA8jNp3ph/a++YrRMLvQlGzkgmZKJQnLZKm/RNRXE7iVR9J4uYu8lzMSK+3B5Pgac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717486678; c=relaxed/simple;
	bh=WabLcK7ew6mFSnhUn15FX7Ftay8kRHpCivCIPbfYGTg=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=mRBKZV2L4kr8HdgjFzGy4+nJqDPCimSrqwUqN/LrgZHBi+Dt6kOaWotLUF2c94oe9nFkYmIL27DxT5+qkdqiah3sHGJJpri+EcDCC/UpyNT1gzJ4K/oWPu+1L/wj8nUZnauhPEe3KqTyCzHrNeLPpHfYhgr+zDi9aBW/nIunIYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Received: from builder.linuxtv.org ([140.211.167.10])
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1sEOk0-0003hd-05;
	Tue, 04 Jun 2024 07:37:56 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1sEOjy-000I7s-1b;
	Tue, 04 Jun 2024 07:37:55 +0000
Date: Tue, 4 Jun 2024 07:37:54 +0000 (UTC)
From: Jenkins Builder Robot <jenkins@linuxtv.org>
Reply-To: mchehab@kernel.org, media-committers@linuxtv.org,
	linux-media@vger.kernel.org
To: mchehab@kernel.org, media-committers@linuxtv.org,
	linux-media@vger.kernel.org, hverkuil@xs4all.nl
Message-ID: <976284328.2.1717486675286@builder.linuxtv.org>
Subject: [Jenkins] stage-drivers-build #202: build failed for clang15
 allmodconfig
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1_1237005307.1717486675234"
X-Jenkins-Job: stage-drivers-build

------=_Part_1_1237005307.1717486675234
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Some tests failed:
	PASS: arm32 allmodconfig
	PASS: x86_64 allyesconfig
	PASS: arm64 allyesconfig
	PASS: arm32 allyesconfig
	PASS: x86_64 allmodconfig
	PASS: x86_64 no PM
	PASS: arm64 allmodconfig
	FAIL: clang15 allmodconfig

GENERAL INFO

BUILD SUCCESSFUL
Build URL: https://builder.linuxtv.org/job/stage-drivers-build/202/
Project: stage-drivers-build
Date of build: Tue, 4 Jun 2024 06:45:06 GMT
Build duration: 52 min and counting


CHANGE SET

  	 Revision  by hverkuil: (media: ipu-bridge: add mod_devicetable.h header inclusion)

	 change: edit include/media/ipu-bridge.h

  	 Revision  by hverkuil: (media: i2c: Fix imx412 exposure control)

	 change: edit drivers/media/i2c/imx412.c

  	 Revision  by hverkuil: (media: i2c: hi846: Fix V4L2_SUBDEV_FORMAT_TRY get_selection())

	 change: edit drivers/media/i2c/hi846.c

  	 Revision  by hverkuil: (media: v4l: async: Fix NULL pointer dereference in adding ancillary links)

	 change: edit drivers/media/v4l2-core/v4l2-async.c

  	 Revision  by hverkuil: (media: i2c: imx258: Remove unused defines)

	 change: edit drivers/media/i2c/imx258.c

  	 Revision  by hverkuil: (media: i2c: imx258: Make image geometry meet sensor requirements)

	 change: edit drivers/media/i2c/imx258.c

  	 Revision  by hverkuil: (media: i2c: imx258: Disable digital cropping on binned modes)

	 change: edit drivers/media/i2c/imx258.c

  	 Revision  by hverkuil: (media: i2c: imx258: Remove redundant I2C writes.)

	 change: edit drivers/media/i2c/imx258.c

  	 Revision  by hverkuil: (media: i2c: imx258: Add regulator control)

	 change: edit drivers/media/i2c/imx258.c

  	 Revision  by hverkuil: (media: i2c: imx258: Make V4L2_CID_VBLANK configurable.)

	 change: edit drivers/media/i2c/imx258.c

  	 Revision  by hverkuil: (media: i2c: imx258: Split out common registers from the mode based ones)

	 change: edit drivers/media/i2c/imx258.c

  	 Revision  by hverkuil: (media: i2c: imx258: Add support for 24MHz clock)

	 change: edit drivers/media/i2c/imx258.c

  	 Revision  by hverkuil: (media: i2c: imx258: Add support for running on 2 CSI data lanes)

	 change: edit drivers/media/i2c/imx258.c

  	 Revision  by hverkuil: (media: i2c: imx258: Follow normal V4L2 behaviours for clipping exposure)

	 change: edit drivers/media/i2c/imx258.c

  	 Revision  by hverkuil: (media: i2c: imx258: Add get_selection for pixel array information)

	 change: edit drivers/media/i2c/imx258.c

  	 Revision  by hverkuil: (media: i2c: imx258: Allow configuration of clock lane behaviour)

	 change: edit drivers/media/i2c/imx258.c

  	 Revision  by hverkuil: (media: i2c: imx258: Correct max FRM_LENGTH_LINES value)

	 change: edit drivers/media/i2c/imx258.c

  	 Revision  by hverkuil: (media: i2c: imx258: Issue reset before starting streaming)

	 change: edit drivers/media/i2c/imx258.c

  	 Revision  by hverkuil: (media: i2c: imx258: Set pixel_rate range to the same as the value)

	 change: edit drivers/media/i2c/imx258.c

  	 Revision  by hverkuil: (media: i2c: imx258: Support faster pixel rate on binned modes)

	 change: edit drivers/media/i2c/imx258.c

  	 Revision  by hverkuil: (dt-bindings: media: imx258: Rename to include vendor prefix)

	 change: delete Documentation/devicetree/bindings/media/i2c/imx258.yaml

	 change: add Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml

	 change: edit MAINTAINERS

  	 Revision  by hverkuil: (dt-bindings: media: imx258: Add alternate compatible strings)

	 change: edit Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml

  	 Revision  by hverkuil: (media: i2c: imx258: Change register settings for variants of the sensor)

	 change: edit drivers/media/i2c/imx258.c

  	 Revision  by hverkuil: (media: i2c: imx258: Make HFLIP and VFLIP controls writable)

	 change: edit drivers/media/i2c/imx258.c

  	 Revision  by hverkuil: (media: i2c: imx258: Use v4l2_link_freq_to_bitmap helper)

	 change: edit drivers/media/i2c/imx258.c

  	 Revision  by hverkuil: (media: i2c: imx258: Convert to new CCI register access helpers)

	 change: edit drivers/media/i2c/Kconfig

	 change: edit drivers/media/i2c/imx258.c

  	 Revision  by hverkuil: (media: async: Warn on attept to create an ancillary link to a non-subdev)

	 change: edit drivers/media/v4l2-core/v4l2-async.c

  	 Revision  by hverkuil: (media: staging: max96712: Store format in subdev active state)

	 change: edit drivers/staging/media/max96712/max96712.c

  	 Revision  by hverkuil: (media: ipu6: Rework CSI-2 sub-device streaming control)

	 change: edit drivers/media/pci/intel/ipu6/ipu6-isys-video.c

	 change: edit drivers/media/pci/intel/ipu6/ipu6-isys-queue.c

	 change: edit drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h

	 change: edit drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c

  	 Revision  by hverkuil: (media: subdev: Add privacy led helpers)

	 change: edit drivers/media/v4l2-core/v4l2-subdev.c

  	 Revision  by hverkuil: (media: subdev: Use v4l2_subdev_has_op() in v4l2_subdev_enable/disable_streams())

	 change: edit drivers/media/v4l2-core/v4l2-subdev.c

  	 Revision  by hverkuil: (media: subdev: Add checks for subdev features)

	 change: edit drivers/media/v4l2-core/v4l2-subdev.c

  	 Revision  by hverkuil: (media: subdev: Fix use of sd-&gt;enabled_streams in call_s_stream())

	 change: edit drivers/media/v4l2-core/v4l2-subdev.c

	 change: edit include/media/v4l2-subdev.h

  	 Revision  by hverkuil: (media: subdev: Improve v4l2_subdev_enable/disable_streams_fallback)

	 change: edit drivers/media/v4l2-core/v4l2-subdev.c

	 change: edit include/media/v4l2-subdev.h

  	 Revision  by hverkuil: (media: subdev: Add v4l2_subdev_is_streaming())

	 change: edit drivers/media/v4l2-core/v4l2-subdev.c

	 change: edit include/media/v4l2-subdev.h

  	 Revision  by hverkuil: (media: subdev: Support privacy led in v4l2_subdev_enable/disable_streams())

	 change: edit drivers/media/v4l2-core/v4l2-subdev.c

  	 Revision  by hverkuil: (media: subdev: Refactor v4l2_subdev_enable/disable_streams())

	 change: edit drivers/media/v4l2-core/v4l2-subdev.c

  	 Revision  by hverkuil: (media: subdev: Support single-stream case in v4l2_subdev_enable/disable_streams())

	 change: edit drivers/media/v4l2-core/v4l2-subdev.c

  	 Revision  by hverkuil: (media: subdev: Support non-routing subdevs in v4l2_subdev_s_stream_helper())

	 change: edit drivers/media/v4l2-core/v4l2-subdev.c

  	 Revision  by hverkuil: (media: subdev: Improve s_stream documentation)

	 change: edit include/media/v4l2-subdev.h

  	 Revision  by hverkuil: (media: dt-bindings: media: Add bindings for IMX283)

	 change: edit MAINTAINERS

	 change: add Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml

  	 Revision  by hverkuil: (media: i2c: Add imx283 camera sensor driver)

	 change: edit MAINTAINERS

	 change: edit drivers/media/i2c/Kconfig

	 change: edit drivers/media/i2c/Makefile

	 change: add drivers/media/i2c/imx283.c

  	 Revision  by hverkuil: (media: i2c: dw9768: remove unused struct &#039;regval_list&#039;)

	 change: edit drivers/media/i2c/dw9768.c

  	 Revision  by hverkuil: (media: i2c: ks0127: remove unused struct &#039;adjust&#039;)

	 change: edit drivers/media/i2c/ks0127.c

  	 Revision  by hverkuil: (media: i2c: tw9910: remove unused strust &#039;regval_list&#039;)

	 change: edit drivers/media/i2c/tw9910.c

  	 Revision  by hverkuil: (media: i2c: adv7511: remove unused struct &#039;i2c_reg_value&#039;)

	 change: edit drivers/media/i2c/adv7511-v4l2.c

  	 Revision  by hverkuil: (media: ipu6: Print CSR messages using debug level)

	 change: edit drivers/media/pci/intel/ipu6/ipu6-buttress.c

  	 Revision  by hverkuil: (media: v4l2-cci: Always assign *val)

	 change: edit drivers/media/v4l2-core/v4l2-cci.c

  	 Revision  by hverkuil: (media: v4l2-subdev: Fix v4l2_subdev_state_get_format() documentation)

	 change: edit include/media/v4l2-subdev.h

  	 Revision  by hverkuil: (media: v4l2-subdev: Provide const-aware subdev state accessors)

	 change: edit include/media/v4l2-subdev.h

  	 Revision  by hverkuil: (media: rkisp1: Mark subdev state pointers as const)

	 change: edit drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c

	 change: edit drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c

  	 Revision  by hverkuil: (dt-bindings: media: add Maxim MAX96717 GMSL2 Serializer)

	 change: add Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml

  	 Revision  by hverkuil: (dt-bindings: media: add Maxim MAX96714 GMSL2 Deserializer)

	 change: add Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml

  	 Revision  by hverkuil: (media: i2c: add MAX96717 driver)

	 change: edit MAINTAINERS

	 change: edit drivers/media/i2c/Kconfig

	 change: edit drivers/media/i2c/Makefile

	 change: add drivers/media/i2c/max96717.c

  	 Revision  by hverkuil: (media: i2c: add MAX96714 driver)

	 change: edit drivers/media/i2c/Kconfig

	 change: edit MAINTAINERS

	 change: edit drivers/media/i2c/Makefile

	 change: add drivers/media/i2c/max96714.c

  	 Revision  by hverkuil: (drivers: media: max96717: stop the csi receiver before the source)

	 change: edit drivers/media/i2c/max96717.c

  	 Revision  by hverkuil: (media: ov5693: Drop privacy-LED GPIO control)

	 change: edit drivers/media/i2c/ov5693.c
------=_Part_1_1237005307.1717486675234--

