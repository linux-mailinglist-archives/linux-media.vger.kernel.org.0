Return-Path: <linux-media+bounces-44971-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0173FBEED12
	for <lists+linux-media@lfdr.de>; Sun, 19 Oct 2025 23:14:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF0933B91D1
	for <lists+linux-media@lfdr.de>; Sun, 19 Oct 2025 21:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D09723817E;
	Sun, 19 Oct 2025 21:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b="dqdsdPtD"
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119F51EC01B
	for <linux-media@vger.kernel.org>; Sun, 19 Oct 2025 21:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760908443; cv=none; b=NW4yhjfeLYlukpWlacn1EsCO8e9uujpXrUx7wLy0AxFDg9/rGm3pxkWCTfCtWgO2MCoYN5azsFhKDxL7Ixw8xCaZwtiBrbDA3RJ1B6src2gA+sifcz1eDC/mM5CRmkAjk66aqHTgeX8QWxkZviZst+ktJRJUFTbvo25L8nWxj8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760908443; c=relaxed/simple;
	bh=XedO90ypOdggAFyBaulxnXgess3PoQWn3O7RimdfMYw=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=i2XMHIg+cirEGD0tD38gq4ZxkzyxevPnY0ya3zs4fQgWRZ86jSxQN+hXF/mJIoa9O0FamzD5fErC49hBT/9Qdbnu4x6okNAmeinio/lq5vwwsNSda4V3WPGiIgyVhVBU+O0BGGXCbYFPQ1Oo40EV/9e6MOFTqJS45aE4/XxO1dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b=dqdsdPtD; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linuxtv.org
	; s=s1; h=List-ID:Content-Type:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:Reply-To:From:Date:Sender:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/kDO+5ZO4hRTfNgdDh5d4cF5ZueAwUHkF1XsXa3SfYI=; b=dqdsdPtDhUu6s1+X8iBzruezhY
	wZbYGNTIKVowe5+0wimq/2T05leDIr6o8XhrSpW4w8/AYX+AWItF3ud7GxBHSfbbReXnkTtwj8+wA
	7O2sB7LpF8439fSs9IhMvh58awaOG2oCQc5MUSIH6EAWLQtn+myGtx/f/0r/MAzngCKBvAKUIECZL
	MtKTPHFfWu+AIyLRoz1YhUFLHCcZrD3fHGCSFT5aOFASeyeg5oxiU9pN1cUBN01SPbb9wNLGy/Gfs
	XhzOcBJzTwTYCTWC/ZT3pLquZaVgQ/AfqV9NOxpoVKTACD7RJAqzPBpdvkuY1ktJ7mxtCzcVoPFYM
	mv4KEQwA==;
Received: from builder.linuxtv.org ([140.211.167.10])
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1vAaj3-0006GB-0U;
	Sun, 19 Oct 2025 21:14:01 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1vAaj2-00HMtL-18;
	Sun, 19 Oct 2025 21:14:01 +0000
Date: Sun, 19 Oct 2025 21:13:59 +0000 (UTC)
From: Jenkins Builder Robot <jenkins@linuxtv.org>
Reply-To: mchehab@kernel.org, media-committers@linuxtv.org,
	linux-media@vger.kernel.org
To: mchehab@kernel.org, media-committers@linuxtv.org,
	linux-media@vger.kernel.org, hverkuil@xs4all.nl
Message-ID: <2136340073.2.1760908440353@builder.linuxtv.org>
In-Reply-To: <128102591.2.1760735975289@builder.linuxtv.org>
References: <128102591.2.1760735975289@builder.linuxtv.org>
Subject: [Jenkins] media.git_drivers_build #440: build failed for x86_64
 allyesconfig x86_64 allmodconfig x86_64 no PM
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1_1162964637.1760908440097"
X-Jenkins-Job: media.git_drivers_build

------=_Part_1_1162964637.1760908440097
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Some tests failed:
	FAIL: x86_64 allyesconfig
	FAIL: x86_64 allmodconfig
	PASS: arm32 allmodconfig
	FAIL: x86_64 no PM
	PASS: arm32 allyesconfig
	PASS: arm64 allyesconfig
	PASS: arm64 allmodconfig
	PASS: clang15 allmodconfig

GENERAL INFO

BUILD SUCCESSFUL
Build URL: https://builder.linuxtv.org/job/media.git_drivers_build/440/
Project: media.git_drivers_build
Date of build: Sun, 19 Oct 2025 21:05:06 GMT
Build duration: 8 min 53 sec and counting


CHANGE SET

  	 Revision  by hverkuil: (media: v4l2-mem2mem: Document that v4l2_m2m_get_vq() never returns NULL)

	 change: edit include/media/v4l2-mem2mem.h

	 change: edit drivers/media/v4l2-core/v4l2-mem2mem.c

  	 Revision  by hverkuil: (media: allgro-dvt: Drop unneeded v4l2_m2m_get_vq() NULL check)

	 change: edit drivers/media/platform/allegro-dvt/allegro-core.c

  	 Revision  by hverkuil: (media: meson-g2d: Drop unneeded v4l2_m2m_get_vq() NULL check)

	 change: edit drivers/media/platform/amlogic/meson-ge2d/ge2d.c

  	 Revision  by hverkuil: (media: amphion: Drop unneeded v4l2_m2m_get_vq() NULL check)

	 change: edit drivers/media/platform/amphion/vdec.c

	 change: edit drivers/media/platform/amphion/venc.c

  	 Revision  by hverkuil: (media: coda: Drop unneeded v4l2_m2m_get_vq() NULL check)

	 change: edit drivers/media/platform/chips-media/coda/coda-common.c

  	 Revision  by hverkuil: (media: imagination: e5010: Drop unneeded v4l2_m2m_get_vq() NULL check)

	 change: edit drivers/media/platform/imagination/e5010-jpeg-enc.c

  	 Revision  by hverkuil: (media: m2m-deinterlace: Drop unneeded v4l2_m2m_get_vq() NULL check)

	 change: edit drivers/media/platform/m2m-deinterlace.c

  	 Revision  by hverkuil: (media: mediatek: jpeg: Drop unneeded v4l2_m2m_get_vq() NULL check)

	 change: edit drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c

  	 Revision  by hverkuil: (media: mediatek: vcodec: Drop unneeded v4l2_m2m_get_vq() NULL check)

	 change: edit drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c

	 change: edit drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c

	 change: edit drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c

	 change: edit drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c

  	 Revision  by hverkuil: (media: dw100: Drop unneeded v4l2_m2m_get_vq() NULL check)

	 change: edit drivers/media/platform/nxp/dw100/dw100.c

  	 Revision  by hverkuil: (media: imx-jpeg: Drop unneeded v4l2_m2m_get_vq() NULL check)

	 change: edit drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c

  	 Revision  by hverkuil: (media: imx-pxp: Drop unneeded v4l2_m2m_get_vq() NULL check)

	 change: edit drivers/media/platform/nxp/imx-pxp.c

  	 Revision  by hverkuil: (media: nxp: imx8-isi: Drop unneeded v4l2_m2m_get_vq() NULL check)

	 change: edit drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c

  	 Revision  by hverkuil: (media: mx2_emmaprp: Drop unneeded v4l2_m2m_get_vq() NULL check)

	 change: edit drivers/media/platform/nxp/mx2_emmaprp.c

  	 Revision  by hverkuil: (media: qcom: iris: Drop unneeded v4l2_m2m_get_vq() NULL check)

	 change: edit drivers/media/platform/qcom/iris/iris_venc.c

	 change: edit drivers/media/platform/qcom/iris/iris_vdec.c

  	 Revision  by hverkuil: (media: qcom: venus: Drop unneeded v4l2_m2m_get_vq() NULL check)

	 change: edit drivers/media/platform/qcom/venus/venc.c

	 change: edit drivers/media/platform/qcom/venus/vdec.c

  	 Revision  by hverkuil: (media: renesas: fdp1: Drop unneeded v4l2_m2m_get_vq() NULL check)

	 change: edit drivers/media/platform/renesas/rcar_fdp1.c

  	 Revision  by hverkuil: (media: rcar_jpu: Drop unneeded v4l2_m2m_get_vq() NULL check)

	 change: edit drivers/media/platform/renesas/rcar_jpu.c

  	 Revision  by hverkuil: (media: platform: rga: Drop unneeded v4l2_m2m_get_vq() NULL check)

	 change: edit drivers/media/platform/rockchip/rga/rga.c

  	 Revision  by hverkuil: (media: samsung: s5p-g2d: Drop unneeded v4l2_m2m_get_vq() NULL check)

	 change: edit drivers/media/platform/samsung/s5p-g2d/g2d.c

  	 Revision  by hverkuil: (media: samsung: s5p-jpeg: Drop unneeded v4l2_m2m_get_vq() NULL check)

	 change: edit drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c

  	 Revision  by hverkuil: (media: stm32: dma2d: Drop unneeded v4l2_m2m_get_vq() NULL check)

	 change: edit drivers/media/platform/st/stm32/dma2d/dma2d.c

  	 Revision  by hverkuil: (media: ti: vpe: Drop unneeded v4l2_m2m_get_vq() NULL check)

	 change: edit drivers/media/platform/ti/vpe/vpe.c

  	 Revision  by hverkuil: (media: vicodec: Drop unneeded v4l2_m2m_get_vq() NULL check)

	 change: edit drivers/media/test-drivers/vicodec/vicodec-core.c

  	 Revision  by hverkuil: (media: vim2m: Drop unneeded v4l2_m2m_get_vq() NULL check)

	 change: edit drivers/media/test-drivers/vim2m.c

  	 Revision  by hverkuil: (media: dvbdev: Use %pe format specifier)

	 change: edit drivers/media/dvb-core/dvbdev.c

  	 Revision  by hverkuil: (media: mn88443x: Use %pe format specifier)

	 change: edit drivers/media/dvb-frontends/mn88443x.c

  	 Revision  by hverkuil: (media: adv7842: Use %pe format specifier)

	 change: edit drivers/media/i2c/adv7842.c

  	 Revision  by hverkuil: (media: ar0521: Use %pe format specifier)

	 change: edit drivers/media/i2c/ar0521.c

  	 Revision  by hverkuil: (media: ccs: Use %pe format specifier)

	 change: edit drivers/media/i2c/ccs/ccs-core.c

  	 Revision  by hverkuil: (media: i2c: ds90ub913: Use %pe format specifier)

	 change: edit drivers/media/i2c/ds90ub913.c

  	 Revision  by hverkuil: (media: i2c: ds90ub953: Use %pe format specifier)

	 change: edit drivers/media/i2c/ds90ub953.c

  	 Revision  by hverkuil: (media: i2c: imx274: Use %pe format specifier)

	 change: edit drivers/media/i2c/imx274.c

  	 Revision  by hverkuil: (media: i2c: imx335: Use %pe format specifier)

	 change: edit drivers/media/i2c/imx335.c

  	 Revision  by hverkuil: (media: i2c: imx412: Use %pe format specifier)

	 change: edit drivers/media/i2c/imx412.c

  	 Revision  by hverkuil: (media: i2c: max9286: Use %pe format specifier)

	 change: edit drivers/media/i2c/max9286.c

  	 Revision  by hverkuil: (media: i2c: max96717: Use %pe format specifier)

	 change: edit drivers/media/i2c/max96717.c

  	 Revision  by hverkuil: (media: i2c: mt9m111: Use %pe format specifier)

	 change: edit drivers/media/i2c/mt9m111.c

  	 Revision  by hverkuil: (media: i2c: mt9v111: Use %pe format specifier)

	 change: edit drivers/media/i2c/mt9v111.c

  	 Revision  by hverkuil: (media: i2c: ov5675: Use %pe format specifier)

	 change: edit drivers/media/i2c/ov5675.c

  	 Revision  by hverkuil: (media: i2c: ov5693: Use %pe format specifier)

	 change: edit drivers/media/i2c/ov5693.c

  	 Revision  by hverkuil: (media: i2c: ov9282: Use %pe format specifier)

	 change: edit drivers/media/i2c/ov9282.c

  	 Revision  by hverkuil: (media: rj54n1cb0c: Use %pe format specifier)

	 change: edit drivers/media/i2c/rj54n1cb0c.c

  	 Revision  by hverkuil: (media: i2c: st-mipid02: Use %pe format specifier)

	 change: edit drivers/media/i2c/st-mipid02.c

  	 Revision  by hverkuil: (media: ipu-bridge: Use %pe format specifier)

	 change: edit drivers/media/pci/intel/ipu-bridge.c

  	 Revision  by hverkuil: (media: ipu3-cio2: Use %pe format specifier)

	 change: edit drivers/media/pci/intel/ipu3/ipu3-cio2.c

  	 Revision  by hverkuil: (media: ipu6: isys: Use %pe format specifier)

	 change: edit drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c

  	 Revision  by hverkuil: (media: mediatek: vcodec: Use %pe format specifier)

	 change: edit drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c

  	 Revision  by hverkuil: (media: imx8mq-mipi-csi2: Use %pe format specifier)

	 change: edit drivers/media/platform/nxp/imx8mq-mipi-csi2.c

  	 Revision  by hverkuil: (media: platform: rzg2l-cru: Use %pe format specifier)

	 change: edit drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c

  	 Revision  by hverkuil: (media: renesas: vsp1: Use %pe format specifier)

	 change: edit drivers/media/platform/renesas/vsp1/vsp1_drv.c

  	 Revision  by hverkuil: (media: rkisp1: Use %pe format specifier)

	 change: edit drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c

	 change: edit drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c

  	 Revision  by hverkuil: (media: samsung: exynos4-is: Use %pe format specifier)

	 change: edit drivers/media/platform/samsung/exynos4-is/media-dev.c

  	 Revision  by hverkuil: (media: ti: cal Use %pe format specifier)

	 change: edit drivers/media/platform/ti/cal/cal.c

  	 Revision  by hverkuil: (media: staging: ipu3-imgu: Use %pe format specifier)

	 change: edit drivers/staging/media/ipu3/ipu3.c

  	 Revision  by hverkuil: (media: staging/ipu7: Use %pe format specifier)

	 change: edit drivers/staging/media/ipu7/ipu7-isys-csi2.c

	 change: edit drivers/staging/media/ipu7/ipu7-isys-csi-phy.c

  	 Revision  by hverkuil: (media: v4l2-mem2mem: Don&#039;t copy frame flags in v4l2_m2m_buf_copy_metadata())

	 change: edit drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c

	 change: edit drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c

	 change: edit drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c

	 change: edit drivers/media/platform/rockchip/rkvdec/rkvdec.c

	 change: edit drivers/media/platform/amphion/vdec.c

	 change: edit drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c

	 change: edit drivers/media/platform/sunxi/sun8i-di/sun8i-di.c

	 change: edit drivers/staging/media/imx/imx-media-csc-scaler.c

	 change: edit drivers/media/v4l2-core/v4l2-mem2mem.c

	 change: edit drivers/media/platform/chips-media/coda/coda-jpeg.c

	 change: edit drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c

	 change: edit drivers/media/platform/allegro-dvt/allegro-core.c

	 change: edit drivers/media/platform/amphion/venc.c

	 change: edit drivers/media/test-drivers/visl/visl-dec.c

	 change: edit drivers/media/platform/st/stm32/dma2d/dma2d.c

	 change: edit drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c

	 change: edit drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c

	 change: edit drivers/media/platform/verisilicon/hantro_drv.c

	 change: edit drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_if.c

	 change: edit drivers/media/platform/rockchip/rga/rga.c

	 change: edit drivers/media/platform/chips-media/coda/coda-bit.c

	 change: edit drivers/staging/media/sunxi/cedrus/cedrus_dec.c

	 change: edit drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c

	 change: edit drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c

	 change: edit drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c

	 change: edit drivers/media/platform/nxp/dw100/dw100.c

	 change: edit drivers/media/platform/nvidia/tegra-vde/h264.c

	 change: edit drivers/media/test-drivers/vim2m.c

	 change: edit drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c

	 change: edit drivers/media/platform/imagination/e5010-jpeg-enc.c

	 change: edit include/media/v4l2-mem2mem.h

	 change: edit drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c

	 change: edit drivers/media/test-drivers/vicodec/vicodec-core.c
------=_Part_1_1162964637.1760908440097--

