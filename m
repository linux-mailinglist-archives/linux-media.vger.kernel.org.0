Return-Path: <linux-media+bounces-4066-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A08868385BA
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 03:51:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11CF21F26C74
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 02:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62E86A2D;
	Tue, 23 Jan 2024 02:51:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0217F4
	for <linux-media@vger.kernel.org>; Tue, 23 Jan 2024 02:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705978285; cv=none; b=n207yC1/cdbS6SvzyO9FmXaQh7I9NzQcCg2gco2ejiWuvdt8143zQq1dLUimZbqTo4hQc27sX1gxEQ3sf2yGo/JOsJDUgCTIgs9fTvg2exm5zcFnYWzWNNgW+X7VezErS3LOlM/2P8Ot4J49zTcC4a02KpadXn0XjBC9cWtjfVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705978285; c=relaxed/simple;
	bh=kQow4DG7Fj12WJsuxwsqfwAVtja8caX13IWyEvAem9s=;
	h=Date:Message-ID:From:To:Subject; b=en6xjRwd2fafJ1S43jmqLMjPqPgeBBy9R0tn1ZH/T53nSZEqz3h0FJk12uHOnMjNO4F9YqoE+cmbSmWKagIy2tUTTgtgK+PWXa9yJqTGbDvpYH3aveHGTwAh2Tdjed27/Xcsp812UuCCbMMQlhcCZzMFnv/TzXhQW5No7EHE8aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3381AC433C7
	for <linux-media@vger.kernel.org>; Tue, 23 Jan 2024 02:51:24 +0000 (UTC)
Date: Tue, 23 Jan 2024 03:51:22 +0100
Message-ID: <da442249fb9f7dc2dd42d54e7dbd25e4.hverkuil@xs4all.nl>
From: "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Tue Jan 23 03:00:23 CET 2024
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	eba5e4075505b758fb36967e83ba43d4b994a2e0
v4l-utils git hash:	d700deb143685b8217aa8a6eeeba3b090d4287fc
edid-decode git hash:	6e4132123fae3d71ac9350d71a60a7a97020df13
gcc version:		i686-linux-gcc (GCC) 13.2.0
ccache version:		ccache version 4.8.3
smatch/sparse repo:     git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8549-gd0c870a7
sparse version:		v0.5.0-8549-gd0c870a7
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: 984d07544ad3abbb1ea6b06f44ae531858c1c047
host hardware:		x86_64
host os:		6.1.55-cobaltpc1

linux-git-arm: WARNINGS:

drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c:57: warning: Excess struct member 'wait_key_frame' description in 'vdec_vp8_slice_info'
drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c:166: warning: Excess struct member 'mv_joint' description in 'vdec_vp9_slice_counts_map'

linux-git-arm64: WARNINGS:

drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c:57: warning: Excess struct member 'wait_key_frame' description in 'vdec_vp8_slice_info'
drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c:166: warning: Excess struct member 'mv_joint' description in 'vdec_vp9_slice_counts_map'

linux-git-powerpc64: WARNINGS:

drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c:57: warning: Excess struct member 'wait_key_frame' description in 'vdec_vp8_slice_info'
drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c:166: warning: Excess struct member 'mv_joint' description in 'vdec_vp9_slice_counts_map'

linux-git-i686: WARNINGS:

drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c:57: warning: Excess struct member 'wait_key_frame' description in 'vdec_vp8_slice_info'
drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c:166: warning: Excess struct member 'mv_joint' description in 'vdec_vp9_slice_counts_map'

linux-git-x86_64: WARNINGS:

drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c:57: warning: Excess struct member 'wait_key_frame' description in 'vdec_vp8_slice_info'
drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c:166: warning: Excess struct member 'mv_joint' description in 'vdec_vp9_slice_counts_map'

no-acpi.config: WARNINGS:

drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c:57: warning: Excess struct member 'wait_key_frame' description in 'vdec_vp8_slice_info'
drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c:166: warning: Excess struct member 'mv_joint' description in 'vdec_vp9_slice_counts_map'

no-of.config: WARNINGS:

drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c:57: warning: Excess struct member 'wait_key_frame' description in 'vdec_vp8_slice_info'
drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c:166: warning: Excess struct member 'mv_joint' description in 'vdec_vp9_slice_counts_map'

no-pm.config: WARNINGS:

drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c:57: warning: Excess struct member 'wait_key_frame' description in 'vdec_vp8_slice_info'
drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c:166: warning: Excess struct member 'mv_joint' description in 'vdec_vp9_slice_counts_map'

no-pm-sleep.config: WARNINGS:

drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c:57: warning: Excess struct member 'wait_key_frame' description in 'vdec_vp8_slice_info'
drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c:166: warning: Excess struct member 'mv_joint' description in 'vdec_vp9_slice_counts_map'

no-debug-fs.config: WARNINGS:

drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c:57: warning: Excess struct member 'wait_key_frame' description in 'vdec_vp8_slice_info'
drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c:166: warning: Excess struct member 'mv_joint' description in 'vdec_vp9_slice_counts_map'

sparse: WARNINGS:

drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c:57: warning: Excess struct member 'wait_key_frame' description in 'vdec_vp8_slice_info'
drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c:166: warning: Excess struct member 'mv_joint' description in 'vdec_vp9_slice_counts_map'

smatch: WARNINGS:

drivers/media/i2c/adv7180.c:1526 adv7180_probe() warn: 'client->irq' from request_threaded_irq() not released on lines: 1526.
drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c:57: warning: Excess struct member 'wait_key_frame' description in 'vdec_vp8_slice_info'
drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c:166: warning: Excess struct member 'mv_joint' description in 'vdec_vp9_slice_counts_map'
drivers/media/platform/st/sti/hva/hva-hw.c:412 hva_hw_probe() warn: 'hva->clk' from clk_prepare() not released on lines: 412.

COMPILE_TEST: OK
strcpy/strncpy/strlcpy: OK
abi-compliance: ABI OK
pahole: ABI OK
utils: OK
spec-git: OK
kerneldoc: WARNINGS:

include/uapi/linux/videodev2.h:1072: warning: Excess struct member 'mem_offset' description in 'v4l2_plane'
include/uapi/linux/videodev2.h:1072: warning: Excess struct member 'userptr' description in 'v4l2_plane'
include/uapi/linux/videodev2.h:1072: warning: Excess struct member 'fd' description in 'v4l2_plane'
include/uapi/linux/videodev2.h:1137: warning: Excess struct member 'offset' description in 'v4l2_buffer'
include/uapi/linux/videodev2.h:1137: warning: Excess struct member 'userptr' description in 'v4l2_buffer'
include/uapi/linux/videodev2.h:1137: warning: Excess struct member 'fd' description in 'v4l2_buffer'
include/uapi/linux/videodev2.h:1137: warning: Excess struct member 'planes' description in 'v4l2_buffer'
include/uapi/linux/videodev2.h:2448: warning: Excess struct member 'pix' description in 'v4l2_format'
include/uapi/linux/videodev2.h:2448: warning: Excess struct member 'pix_mp' description in 'v4l2_format'
include/uapi/linux/videodev2.h:2448: warning: Excess struct member 'win' description in 'v4l2_format'
include/uapi/linux/videodev2.h:2448: warning: Excess struct member 'vbi' description in 'v4l2_format'
include/uapi/linux/videodev2.h:2448: warning: Excess struct member 'sliced' description in 'v4l2_format'
include/uapi/linux/videodev2.h:2448: warning: Excess struct member 'raw_data' description in 'v4l2_format'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'partition' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'skip' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'intra_inter' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'tx32p' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'tx16p' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'tx8p' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'y_mode' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'uv_mode' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'comp' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'comp_ref' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'single_ref' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'mv_mode' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'filter' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'mv_joint' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'sign' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'classes' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'class0' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'bits' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'class0_fp' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'fp' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'class0_hp' description in 'v4l2_vp9_frame_symbol_counts'
include/media/v4l2-vp9.h:144: warning: Excess struct member 'hp' description in 'v4l2_vp9_frame_symbol_counts'
include/media/cec.h:297: warning: Excess struct member 'status_file' description in 'cec_adapter'
include/media/cec.h:297: warning: Excess struct member 'error_inj_file' description in 'cec_adapter'
drivers/media/usb/dvb-usb/dvb-usb.h:164: warning: Excess struct member 'num_frontends' description in 'dvb_usb_adapter_fe_properties'
drivers/media/usb/dvb-usb/dvb-usb.h:164: warning: Excess struct member 'frontend_ctrl' description in 'dvb_usb_adapter_fe_properties'
drivers/media/pci/dt3155/dt3155.h:185: warning: Excess struct member 'stats' description in 'dt3155_priv'
drivers/media/platform/qcom/venus/core.h:512: warning: Excess struct member 'priv' description in 'venus_inst'
drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h:163: warning: Excess struct member 'hw_rdy' description in 'mtk_jpegenc_comp_dev'
drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h:66: warning: Excess struct member 'list' description in 'mtk_video_dec_buf'
drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.h:47: warning: Excess struct member 'dev' description in 'vdec_vpu_inst'
drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.h:39: warning: Excess struct member 'list' description in 'mtk_video_enc_buf'
drivers/media/platform/samsung/s5p-mfc/s5p_mfc_common.h:733: warning: Excess struct member 'frame_type' description in 's5p_mfc_ctx'
drivers/media/platform/samsung/exynos4-is/fimc-lite.h:180: warning: Excess struct member 'pipeline' description in 'fimc_lite'
drivers/media/platform/samsung/exynos4-is/fimc-lite.h:180: warning: Excess struct member 'pipeline_ops' description in 'fimc_lite'
drivers/media/platform/samsung/exynos4-is/fimc-lite.h:180: warning: Excess struct member 'active_buf_count' description in 'fimc_lite'
drivers/media/platform/verisilicon/hantro.h:277: warning: Excess struct member 'jpeg_enc' description in 'hantro_ctx'
drivers/media/i2c/adv748x/adv748x.h:199: warning: Excess struct member 'i2c_addresses' description in 'adv748x_state'
drivers/media/i2c/ccs/ccs-quirk.h:50: warning: Excess struct member 'write' description in 'ccs_quirk'
drivers/media/i2c/ccs/ccs-quirk.h:50: warning: Excess struct member 'reg' description in 'ccs_quirk'
drivers/media/i2c/ccs/ccs-quirk.h:50: warning: Excess struct member 'value' description in 'ccs_quirk'
drivers/staging/media/meson/vdec/vdec.h:111: warning: Excess struct member 'use_offsets' description in 'amvdec_ops'


date:			Tue Jan 23 03:19:19 CET 2024
virtme-64: WARNINGS: Final Summary: 3284, Succeeded: 3284, Failed: 0, Warnings: 2
virtme-32: OK: Final Summary: 3412, Succeeded: 3412, Failed: 0, Warnings: 0

date:			Tue Jan 23 03:49:45 CET 2024

Detailed results are available here:

https://hverkuil.home.xs4all.nl/logs/Tuesday.log

Detailed regression test results are available here:

https://hverkuil.home.xs4all.nl/logs/Tuesday-test-media-64.log
https://hverkuil.home.xs4all.nl/logs/Tuesday-test-media-64-dmesg.log
https://hverkuil.home.xs4all.nl/logs/Tuesday-test-media-32.log
https://hverkuil.home.xs4all.nl/logs/Tuesday-test-media-32-dmesg.log

Full logs are available here:

https://hverkuil.home.xs4all.nl/logs/Tuesday.tar.bz2

The Media Infrastructure API from this daily build is here:

https://hverkuil.home.xs4all.nl/spec/index.html

