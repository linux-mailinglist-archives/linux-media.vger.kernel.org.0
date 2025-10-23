Return-Path: <linux-media+bounces-45427-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CE826C037F7
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 23:08:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B1B844ECEF3
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 21:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A83727781E;
	Thu, 23 Oct 2025 21:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b="ZfRK2e2T"
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A593227057D
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 21:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761253729; cv=none; b=oQfEt4m9yH20oqhBeFHbY0nueDuXz+d61D6/UzDUAnJQbpqVxOdVlclWLSOdrENTRRBTyNKDM13ATjX3FSuBb4uedT/e6EE7e+KIeshgNY9hPF/4kCEj+k1Qj/Pf4DZHpCSShiZ1vgrpCnfbBS6IOxJsQMxueTkbYRfJ9upvh9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761253729; c=relaxed/simple;
	bh=PRfDvGNZoPrgURZ0Nby1wVwf2OXil+8BbqxoCMIvN+Q=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=PbFFO4sCUEA/qoxU8bQJWVo/pB9ErniVq4a0EQPzIKay9pd5TZ+QOai7V8/M9mUoi9zphfWfUfyukU7PYr/VQ8T1FLwlhHPoMjBgQ7LcaQc8jGywUd35hWAwJNtecfOCm4gcnu+A/9zNdsgcBqunJ1Nu2R7TxFSw7sqxnhtNeQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b=ZfRK2e2T; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linuxtv.org
	; s=s1; h=List-ID:Content-Type:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:Reply-To:From:Date:Sender:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xjyXDp4YcrPPbvuDtP91KnRICU5+qC8iZ4V4Fp//yYg=; b=ZfRK2e2Tw4ng7qZ+ZMrZYDbklc
	QDs5F5QjM8J9iaSQibmlpM0wPcbRFcky1uSSsn0aw3ZFsF3YvrEiHktFTDACifS2L6DJr3QcwFR7g
	EIbS9qh1itA1Zj0qs6UzZsowxNsWOAZ4sJc0RQF9VhvsjWwBBp+qFETeBJ1ICSGxOOaFw2SZTWlPO
	i74iad/L/GC/QgKEvMH6ISSMvRqgVPEuwcV5KYp/6Y1b8G7cnnoh+Fqg4pUSbxMikoYpBET5XImso
	ApQz1qx0+CuIUqfTsRfNmnY3ohTrEXdv4UbkXZOdJVFKMMHmaAFfNfQcirbojdglXja4I+1KGoVVP
	QlstioDw==;
Received: from builder.linuxtv.org ([140.211.167.10])
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1vC2YA-00006T-1O;
	Thu, 23 Oct 2025 21:08:46 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1vC2YA-000J6f-12;
	Thu, 23 Oct 2025 21:08:46 +0000
Date: Thu, 23 Oct 2025 21:08:45 +0000 (UTC)
From: Jenkins Builder Robot <jenkins@linuxtv.org>
Reply-To: mchehab@kernel.org, media-committers@linuxtv.org,
	linux-media@vger.kernel.org
To: mchehab@kernel.org, media-committers@linuxtv.org,
	linux-media@vger.kernel.org, hverkuil@xs4all.nl
Message-ID: <2023706324.2.1761253726325@builder.linuxtv.org>
In-Reply-To: <2136340073.2.1760908440353@builder.linuxtv.org>
References: <2136340073.2.1760908440353@builder.linuxtv.org>
Subject: [Jenkins] media.git_drivers_build #441: build failed for x86_64
 allyesconfig x86_64 allmodconfig x86_64 no PM
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1_69361507.1761253726024"
X-Jenkins-Job: media.git_drivers_build

------=_Part_1_69361507.1761253726024
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Some tests failed:
	PASS: arm32 allmodconfig
	FAIL: x86_64 allyesconfig
	FAIL: x86_64 allmodconfig
	FAIL: x86_64 no PM
	PASS: arm32 allyesconfig
	PASS: arm64 allyesconfig
	PASS: arm64 allmodconfig
	PASS: clang15 allmodconfig

GENERAL INFO

BUILD SUCCESSFUL
Build URL: https://builder.linuxtv.org/job/media.git_drivers_build/441/
Project: media.git_drivers_build
Date of build: Thu, 23 Oct 2025 21:05:07 GMT
Build duration: 3 min 38 sec and counting


CHANGE SET

  	 Revision  by corbet: (tools: docs: parse_data_structs.py: drop contents header)

	 change: edit tools/docs/lib/parse_data_structs.py

  	 Revision  by corbet: (tools: docs: parse_data_structs.py: output a line number)

	 change: edit tools/docs/lib/parse_data_structs.py

  	 Revision  by corbet: (docs: kernel_include.py: fix line numbers for TOC)

	 change: edit Documentation/sphinx/kernel_include.py

	 change: edit tools/docs/lib/parse_data_structs.py

  	 Revision  by corbet: (docs: kernel_include.py: propose alternatives)

	 change: edit Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions

	 change: edit Documentation/sphinx/kernel_include.py

	 change: edit Documentation/userspace-api/media/v4l/videodev.rst

  	 Revision  by corbet: (tools: docs: parse_data_structs: make process_exceptions two stages)

	 change: edit tools/docs/lib/parse_data_structs.py

  	 Revision  by corbet: (tools: docs: parse_data_structs.py: get rid of process_exceptions())

	 change: edit Documentation/sphinx/kernel_include.py

	 change: edit tools/docs/parse-headers.py

	 change: edit tools/docs/lib/parse_data_structs.py

  	 Revision  by corbet: (tools: docs: parse_data_structs.py: add namespace support)

	 change: edit tools/docs/lib/parse_data_structs.py

  	 Revision  by corbet: (tools: docs: parse_data_structs.py: accept more reftypes)

	 change: edit tools/docs/lib/parse_data_structs.py

  	 Revision  by corbet: (docs: media: dvb: use TOC instead of file contents at headers)

	 change: edit Documentation/userspace-api/media/dvb/headers.rst

  	 Revision  by corbet: (docs: media: dvb: enable warnings for most headers)

	 change: edit Documentation/userspace-api/media/dvb/frontend.h.rst.exceptions

	 change: edit Documentation/userspace-api/media/dvb/headers.rst

  	 Revision  by corbet: (docs: media: rc: use TOC instead of file contents for LIRC header)

	 change: edit Documentation/userspace-api/media/rc/lirc-header.rst

  	 Revision  by corbet: (docs: media: mediactl: use TOC instead of file contents)

	 change: edit Documentation/userspace-api/media/mediactl/media.h.rst.exceptions

	 change: edit Documentation/userspace-api/media/mediactl/media-header.rst

  	 Revision  by corbet: (docs: kernel_include.py: use get_close_matches() to propose alternatives)

	 change: edit Documentation/sphinx/kernel_include.py

  	 Revision  by corbet: (docs: media: add missing c namespace to V4L headers)

	 change: edit Documentation/userspace-api/media/v4l/crop.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-srggb8.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-compressed.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-srggb12p.rst

	 change: edit Documentation/userspace-api/media/v4l/selection-api-targets.rst

	 change: edit Documentation/userspace-api/media/v4l/planar-apis.rst

	 change: edit Documentation/userspace-api/media/v4l/subdev-formats.rst

	 change: edit Documentation/userspace-api/media/v4l/v4l2.rst

	 change: edit Documentation/userspace-api/media/v4l/libv4l.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-y8i.rst

	 change: edit Documentation/userspace-api/media/v4l/ext-ctrls-colorimetry.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-srggb12.rst

	 change: edit Documentation/userspace-api/media/v4l/meta-formats.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-sdr-cu08.rst

	 change: edit Documentation/userspace-api/media/v4l/yuv-formats.rst

	 change: edit Documentation/userspace-api/media/v4l/dev-mem2mem.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-y16i.rst

	 change: edit Documentation/userspace-api/media/v4l/dev-touch.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-cnf4.rst

	 change: edit Documentation/userspace-api/media/v4l/selections-common.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-tch-tu16.rst

	 change: edit Documentation/userspace-api/media/v4l/metafmt-vsp1-hgo.rst

	 change: edit Documentation/userspace-api/media/v4l/capture.c.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-z16.rst

	 change: edit Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst

	 change: edit Documentation/userspace-api/media/v4l/selection-api-vs-crop-api.rst

	 change: edit Documentation/userspace-api/media/v4l/audio.rst

	 change: edit Documentation/userspace-api/media/v4l/metafmt-d4xx.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-inzi.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-tch-tu08.rst

	 change: edit Documentation/userspace-api/media/v4l/dev-encoder.rst

	 change: edit Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-v4l2-mplane.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-sdr-ru12le.rst

	 change: edit Documentation/userspace-api/media/v4l/tuner.rst

	 change: edit Documentation/userspace-api/media/v4l/ext-ctrls-fm-rx.rst

	 change: edit Documentation/userspace-api/media/v4l/app-pri.rst

	 change: edit Documentation/userspace-api/media/v4l/control.rst

	 change: edit Documentation/userspace-api/media/v4l/selection-api-configuration.rst

	 change: edit Documentation/userspace-api/media/v4l/selection-api-examples.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-srggb16.rst

	 change: edit Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst

	 change: edit Documentation/userspace-api/media/v4l/selection-api.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-sdr-cu16le.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-rgb.rst

	 change: edit Documentation/userspace-api/media/v4l/field-order.rst

	 change: edit Documentation/userspace-api/media/v4l/sdr-formats.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-srggb14p.rst

	 change: edit Documentation/userspace-api/media/v4l/colorspaces-details.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-uv8.rst

	 change: edit Documentation/userspace-api/media/v4l/v4l2grab-example.rst

	 change: edit Documentation/userspace-api/media/v4l/extended-controls.rst

	 change: edit Documentation/userspace-api/media/v4l/ext-ctrls-fm-tx.rst

	 change: edit Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst

	 change: edit Documentation/userspace-api/media/v4l/dev-meta.rst

	 change: edit Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-tch-td16.rst

	 change: edit Documentation/userspace-api/media/v4l/capture-example.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-bayer.rst

	 change: edit Documentation/userspace-api/media/v4l/ext-ctrls-dv.rst

	 change: edit Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-srggb8-pisp-comp.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-m420.rst

	 change: edit Documentation/userspace-api/media/v4l/dev-event.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-sdr-pcu20be.rst

	 change: edit Documentation/userspace-api/media/v4l/dev-subdev.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-srggb10alaw8.rst

	 change: edit Documentation/userspace-api/media/v4l/dv-timings.rst

	 change: edit Documentation/userspace-api/media/v4l/metafmt-uvc.rst

	 change: edit Documentation/userspace-api/media/v4l/selection-api-intro.rst

	 change: edit Documentation/userspace-api/media/v4l/metafmt-pisp-be.rst

	 change: edit Documentation/userspace-api/media/v4l/querycap.rst

	 change: edit Documentation/userspace-api/media/v4l/depth-formats.rst

	 change: edit Documentation/userspace-api/media/v4l/user-func.rst

	 change: edit Documentation/userspace-api/media/v4l/metafmt-generic.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-sdr-pcu16be.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt.rst

	 change: edit Documentation/userspace-api/media/v4l/compat.rst

	 change: edit Documentation/userspace-api/media/v4l/colorspaces-defs.rst

	 change: edit Documentation/userspace-api/media/v4l/dev-decoder.rst

	 change: edit Documentation/userspace-api/media/v4l/v4l2-selection-flags.rst

	 change: edit Documentation/userspace-api/media/v4l/v4l2-selection-targets.rst

	 change: edit Documentation/userspace-api/media/v4l/dev-osd.rst

	 change: edit Documentation/userspace-api/media/v4l/metafmt-vsp1-hgt.rst

	 change: edit Documentation/userspace-api/media/v4l/devices.rst

	 change: edit Documentation/userspace-api/media/v4l/fourcc.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-srggb10p.rst

	 change: edit Documentation/userspace-api/media/v4l/videodev.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-sdr-pcu18be.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-indexed.rst

	 change: edit Documentation/userspace-api/media/v4l/dev-radio.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-intro.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-y12i.rst

	 change: edit Documentation/userspace-api/media/v4l/ext-ctrls-rf-tuner.rst

	 change: edit Documentation/userspace-api/media/v4l/common.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-reserved.rst

	 change: edit Documentation/userspace-api/media/v4l/v4l2grab.c.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-sdr-cs14le.rst

	 change: edit Documentation/userspace-api/media/v4l/standard.rst

	 change: edit Documentation/userspace-api/media/v4l/dev-overlay.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-srggb10dpcm8.rst

	 change: edit Documentation/userspace-api/media/v4l/tch-formats.rst

	 change: edit Documentation/userspace-api/media/v4l/video.rst

	 change: edit Documentation/userspace-api/media/v4l/ext-ctrls-detect.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-srggb10.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-tch-td08.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-srggb14.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-v4l2.rst

	 change: edit Documentation/userspace-api/media/v4l/colorspaces.rst

	 change: edit Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst

	 change: edit Documentation/userspace-api/media/v4l/metafmt-pisp-fe.rst

	 change: edit Documentation/userspace-api/media/v4l/metafmt-intel-ipu3.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-packed-hsv.rst

	 change: edit Documentation/userspace-api/media/v4l/ext-ctrls-jpeg.rst

	 change: edit Documentation/userspace-api/media/v4l/hsv-formats.rst

	 change: edit Documentation/userspace-api/media/v4l/metafmt-c3-isp.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-sdr-cs08.rst

	 change: edit Documentation/userspace-api/media/v4l/biblio.rst

	 change: edit Documentation/userspace-api/media/v4l/metafmt-vivid.rst

	 change: edit Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst

	 change: edit Documentation/userspace-api/media/v4l/dev-sdr.rst

	 change: edit Documentation/userspace-api/media/v4l/pixfmt-srggb10-ipu3.rst

	 change: edit Documentation/userspace-api/media/v4l/common-defs.rst

  	 Revision  by corbet: (docs: media: videodev2.h.rst.exceptions: fix namespace on refs)

	 change: edit Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions

  	 Revision  by corbet: (media: docs: add a missing reference for VIDIOC_QUERY_CTRL)

	 change: edit Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst

  	 Revision  by corbet: (media: docs: videodev2.h.rst.exceptions: ignore struct __kernel_v4l2_timeval)

	 change: edit Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions

  	 Revision  by corbet: (media: docs: add some C domain missing references)

	 change: edit Documentation/userspace-api/media/v4l/buffer.rst

	 change: edit Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst

  	 Revision  by corbet: (docs: cec: cec.h.rst.exceptions: fix broken references from cec.h)

	 change: edit Documentation/userspace-api/media/cec/cec.h.rst.exceptions

  	 Revision  by corbet: (docs: cec: show broken xrefs and show TOC instead of cec.h content)

	 change: edit Documentation/userspace-api/media/cec/cec-header.rst

  	 Revision  by corbet: (docs: media: dmx_types: place kerneldoc at the right namespace)

	 change: edit Documentation/userspace-api/media/dvb/dmx_types.rst

  	 Revision  by corbet: (docs: media: dvb: headers: warn about broken cross references)

	 change: edit Documentation/userspace-api/media/dvb/headers.rst

  	 Revision  by corbet: (docs: media: dvb: fix dmx.h.rst.exceptions)

	 change: edit Documentation/userspace-api/media/dvb/dmx.h.rst.exceptions

  	 Revision  by hverkuil: (media: mediatek: vcodec: Use spinlock for context list protection lock)

	 change: edit drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c

	 change: edit drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h

	 change: edit drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c

	 change: edit drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h

	 change: edit drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c

	 change: edit drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c

	 change: edit drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c

  	 Revision  by hverkuil: (media: platform: mtk-mdp3: fix device leaks at probe)

	 change: edit drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c

  	 Revision  by hverkuil: (media: verisilicon: Fix CPU stalls on G2 bus error)

	 change: edit drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c

	 change: edit drivers/media/platform/verisilicon/imx8m_vpu_hw.c

	 change: edit drivers/media/platform/verisilicon/hantro_g2.c

	 change: edit drivers/media/platform/verisilicon/hantro_g2_regs.h

	 change: edit drivers/media/platform/verisilicon/hantro_hw.h

	 change: edit drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c

  	 Revision  by hverkuil: (media: verisilicon: Protect G2 HEVC decoder against invalid DPB index)

	 change: edit drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c

  	 Revision  by hverkuil: (media: amphion: Remove vpu_vb_is_codecconfig)

	 change: edit drivers/media/platform/amphion/vpu_v4l2.h

	 change: edit drivers/media/platform/amphion/vpu_v4l2.c

	 change: edit drivers/media/platform/amphion/vpu_malone.c

  	 Revision  by hverkuil: (media: amphion: Cancel message work before releasing the VPU core)

	 change: edit drivers/media/platform/amphion/vpu_v4l2.c

  	 Revision  by hverkuil: (media: mediatek: vcodec: Fix a reference leak in mtk_vcodec_fw_vpu_init())

	 change: edit drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c

  	 Revision  by hverkuil: (media: v4l2-ctrls: add full AV1 profile validation in validate_av1_sequence())

	 change: edit drivers/media/v4l2-core/v4l2-ctrls-core.c

  	 Revision  by hverkuil: (media: allegro: print warning if channel creation timeout occurs)

	 change: edit drivers/media/platform/allegro-dvt/allegro-core.c

  	 Revision  by hverkuil: (media: allegro: process all pending status mbox messages)

	 change: edit drivers/media/platform/allegro-dvt/allegro-core.c

  	 Revision  by hverkuil: (media: allegro: fix race conditions in channel handling)

	 change: edit drivers/media/platform/allegro-dvt/allegro-core.c

  	 Revision  by hverkuil: (media: renesas: fdp1: Use %pe format specifier)

	 change: edit drivers/media/platform/renesas/rcar_fdp1.c
------=_Part_1_69361507.1761253726024--

