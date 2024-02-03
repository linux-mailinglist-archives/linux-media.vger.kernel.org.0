Return-Path: <linux-media+bounces-4631-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFBA847FBA
	for <lists+linux-media@lfdr.de>; Sat,  3 Feb 2024 03:59:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64E40281F0A
	for <lists+linux-media@lfdr.de>; Sat,  3 Feb 2024 02:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EF2ED2FC;
	Sat,  3 Feb 2024 02:47:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078B8747F
	for <linux-media@vger.kernel.org>; Sat,  3 Feb 2024 02:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706928450; cv=none; b=n3lG7KHCPuqGfeVPExd7IXryhbucfLHO5YJC+el6bKaIDXp6b/4LtNZPNT3hsSmugdthwrB5zeegfGGxOFR+WNh6Hd23/7r0+eVd4fDyjLOlEeJuXMKDamDmXzyChxuzICXtnJfC059BGhtkQQyljUEZvu0rq0AeSHv5iu0tQ1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706928450; c=relaxed/simple;
	bh=70u4H22H5aRdhrtzWSyHfUSnoOBo5pxke/3yisH1U40=;
	h=Date:Message-ID:From:To:Subject; b=Xqha/zgo97fNuvLd0g63q2jttOqLcX8uYRmt2eglheb3WGowOSwCG5QfIa3bPGK38RudEsysOXo+y4eOLNkd8I86vmGXLWMw9NPegqgzXfxTb6FxZWqgGO6mqZcZo0GoK/pgKu01WQ1UE8DK2h7GXAwdfC2yu63Py6p++Mwmz+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C8DEC43390
	for <linux-media@vger.kernel.org>; Sat,  3 Feb 2024 02:47:28 +0000 (UTC)
Date: Sat, 03 Feb 2024 03:47:26 +0100
Message-ID: <e5b2dfeb06f4f867c7aa8b9606f9826d.hverkuil@xs4all.nl>
From: "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: ERRORS
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Sat Feb  3 03:00:20 CET 2024
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	feb8831be9d468ee961289c6a275536a1ee0011c
v4l-utils git hash:	d700deb143685b8217aa8a6eeeba3b090d4287fc
edid-decode git hash:	7a27b339cf5ee1ab431431a844418a7f7c16d167
gcc version:		i686-linux-gcc (GCC) 13.2.0
ccache version:		ccache version 4.8.3
smatch/sparse repo:     git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8575-g7162b9ec
sparse version:		v0.5.0-8575-g7162b9ec
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: a8f15603520a101f1beb6cee5f6d82d6278c5d47
host hardware:		x86_64
host os:		6.1.55-cobaltpc1

linux-git-powerpc64: OK
linux-git-arm: OK
linux-git-arm64: OK
linux-git-i686: OK
linux-git-x86_64: OK
no-acpi.config: OK
no-of.config: OK
no-pm.config: OK
no-pm-sleep.config: OK
no-debug-fs.config: OK
sparse: WARNINGS:

drivers/staging/media/atomisp/pci/atomisp_drvfs.c:40:14: warning: symbol 'dbgopt' was not declared. Should it be static?
drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures

smatch: WARNINGS:

drivers/media/i2c/adv7180.c:1526 adv7180_probe() warn: 'client->irq' from request_threaded_irq() not released on lines: 1526.
drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
drivers/staging/media/atomisp/pci/sh_css.c:3609 ia_css_pipe_enqueue_buffer() warn: sizeof(NUMBER)?
drivers/media/platform/st/sti/hva/hva-hw.c:412 hva_hw_probe() warn: 'hva->clk' from clk_prepare() not released on lines: 412.

COMPILE_TEST: OK
strcpy/strncpy/strlcpy: OK
abi-compliance: ABI OK
pahole: ABI OK
utils: OK
spec-git: ERRORS:

Documentation/media/driver-api/v4l2-common:6: ./include/media/v4l2-common.h:566: ERROR: Unexpected indentation.
Documentation/media/driver-api/v4l2-common:6: ./include/media/v4l2-common.h:567: WARNING: Block quote ends without a blank line; unexpected unindent.

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


date:			Sat Feb  3 03:18:59 CET 2024
virtme-64: OK: Final Summary: 1864, Succeeded: 1864, Failed: 0, Warnings: 0
virtme-32: WARNINGS: Final Summary: 1728, Succeeded: 1728, Failed: 0, Warnings: 2

date:			Sat Feb  3 03:45:50 CET 2024

Detailed results are available here:

https://hverkuil.home.xs4all.nl/logs/Saturday.log

Detailed regression test results are available here:

https://hverkuil.home.xs4all.nl/logs/Saturday-test-media-64.log
https://hverkuil.home.xs4all.nl/logs/Saturday-test-media-64-dmesg.log
https://hverkuil.home.xs4all.nl/logs/Saturday-test-media-32.log
https://hverkuil.home.xs4all.nl/logs/Saturday-test-media-32-dmesg.log

Full logs are available here:

https://hverkuil.home.xs4all.nl/logs/Saturday.tar.bz2

The Media Infrastructure API from this daily build is here:

https://hverkuil.home.xs4all.nl/spec/index.html

