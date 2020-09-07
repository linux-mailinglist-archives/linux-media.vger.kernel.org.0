Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7011125F978
	for <lists+linux-media@lfdr.de>; Mon,  7 Sep 2020 13:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728985AbgIGLa7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Sep 2020 07:30:59 -0400
Received: from www.linuxtv.org ([130.149.80.248]:48126 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729043AbgIGLaV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Sep 2020 07:30:21 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kFEnK-0007hj-MT; Mon, 07 Sep 2020 10:54:42 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kFEvp-0006dZ-5A; Mon, 07 Sep 2020 11:03:29 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.10] Remove deprecated usbvision driver (#66819)
Date:   Mon,  7 Sep 2020 11:03:29 +0000
Message-Id: <20200907110329.25471-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <5c991e83-e97a-4f42-54be-41a400eba666@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/5c991e83-e97a-4f42-54be-41a400eba666@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/67276/
Build time: 00:20:08
Link: https://lore.kernel.org/linux-media/5c991e83-e97a-4f42-54be-41a400eba666@xs4all.nl

gpg: Signature made Mon 07 Sep 2020 10:26:08 AM UTC
gpg:                using RSA key AAA7FFBA4D2D77EF4CAEA1421326E0CD23ABDCE5
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: got 1/1 patches with issues, being 1 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-usbvision-remove-deprecated-driver.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:164:2: warning: function ‘atomisp_css2_dbg_print’ might be a candidate for ‘gnu_printf’ format attribute [-Wsuggest-attribute=format]
	../drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:170:2: warning: function ‘atomisp_css2_dbg_ftrace_print’ might be a candidate for ‘gnu_printf’ format attribute [-Wsuggest-attribute=format]
	../drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:170:2: warning: function ‘atomisp_css2_dbg_ftrace_print’ might be a candidate for ‘gnu_printf’ format attribute [-Wsuggest-attribute=format]
	../drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:176:2: warning: function ‘atomisp_css2_err_print’ might be a candidate for ‘gnu_printf’ format attribute [-Wsuggest-attribute=format]
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2814:31: warning: variable ‘stream_config’ set but not used [-Wunused-but-set-variable]
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2893:31: warning: variable ‘stream_config’ set but not used [-Wunused-but-set-variable]
	../drivers/staging/media/atomisp/pci/atomisp_v4l2.c:1432:15: warning: variable ‘a0_max_id’ set but not used [-Wunused-but-set-variable]
	../drivers/staging/media/atomisp/pci/sh_css_mipi.c:410:27: warning: variable ‘mipi_intermediate_info’ set but not used [-Wunused-but-set-variable]
	../drivers/staging/media/atomisp/pci/sh_css.c:1366:24: warning: variable ‘stream’ set but not used [-Wunused-but-set-variable]
	../drivers/staging/media/atomisp/pci/sh_css.c:2702:22: warning: variable ‘capture_pipe’ set but not used [-Wunused-but-set-variable]
	../drivers/staging/media/atomisp/pci/sh_css.c:2831:7: warning: variable ‘continuous’ set but not used [-Wunused-but-set-variable]
	../drivers/staging/media/atomisp/pci/sh_css.c:3534:15: warning: variable ‘num_output_pins’ set but not used [-Wunused-but-set-variable]
	../drivers/staging/media/atomisp/pci/sh_css.c:3937:55: warning: variable ‘vf_pp_binary’ set but not used [-Wunused-but-set-variable]
	../drivers/staging/media/atomisp/pci/sh_css.c:3937:38: warning: variable ‘preview_binary’ set but not used [-Wunused-but-set-variable]
	../drivers/staging/media/atomisp/pci/sh_css.c:3937:24: warning: variable ‘copy_binary’ set but not used [-Wunused-but-set-variable]
	../drivers/staging/media/atomisp/pci/sh_css.c:3936:26: warning: variable ‘me’ set but not used [-Wunused-but-set-variable]
	../drivers/staging/media/atomisp/pci/sh_css.c:5749:24: warning: variable ‘copy_binary’ set but not used [-Wunused-but-set-variable]
	../drivers/staging/media/atomisp/pci/sh_css.c:6013:7: warning: variable ‘continuous’ set but not used [-Wunused-but-set-variable]
	../drivers/staging/media/atomisp/pci/sh_css.c:6012:7: warning: variable ‘memory’ set but not used [-Wunused-but-set-variable]
	../drivers/staging/media/atomisp/pci/sh_css.c:7329:24: warning: variable ‘copy_binary’ set but not used [-Wunused-but-set-variable]
	../drivers/staging/media/atomisp/pci/sh_css.c:7459:26: warning: variable ‘num_vf_pp_stage’ set but not used [-Wunused-but-set-variable]
	../drivers/staging/media/atomisp/pci/sh_css.c:10420:22: warning: variable ‘pipe_id’ set but not used [-Wunused-but-set-variable]
	../drivers/staging/media/atomisp/pci/sh_css_param_shading.c:239:4: warning: variable ‘padded_width’ set but not used [-Wunused-but-set-variable]
	../drivers/staging/media/atomisp/pci/sh_css_params.c:1099:36: warning: variable ‘row_padding’ set but not used [-Wunused-but-set-variable]
	../drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c:237:31: warning: variable ‘isp_data_ptr’ set but not used [-Wunused-but-set-variable]
	../drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c:119:28: warning: variable ‘ver_num_isp’ set but not used [-Wunused-but-set-variable]
	../drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c:119:15: warning: variable ‘hor_num_isp’ set but not used [-Wunused-but-set-variable]
	../drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c:127:6: warning: variable ‘err’ set but not used [-Wunused-but-set-variable]
	In file included from ../drivers/staging/media/atomisp//pci/hive_isp_css_include/input_formatter.h:34,
	                 from ../drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:55:
	../drivers/staging/media/atomisp//pci/hive_isp_css_common/host/input_formatter_local.h:118:27: warning: ‘input_formatter_alignment’ defined but not used [-Wunused-const-variable=]
	../drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c:244:7: warning: variable ‘succes’ set but not used [-Wunused-but-set-variable]

    allyesconfig: return code #0:
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:3204 video_put_user() warn: check that 'ev32' doesn't leak information (struct has a hole after 'type')
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:3229 video_put_user() warn: check that 'vb32' doesn't leak information (struct has a hole after 'memory')
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1200 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1332 vivid_create_instance() parse error: __split_smt: function too hairy.  Giving up after 302 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2856 em28xx_v4l2_init() parse error: turning off implications after 60 seconds


Error #512 when building PDF docs

