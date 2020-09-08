Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CD83260F66
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 12:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729251AbgIHKMo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 06:12:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:59830 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728982AbgIHKMf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Sep 2020 06:12:35 -0400
Received: from mail.kernel.org (ip5f5ad5ce.dynamic.kabel-deutschland.de [95.90.213.206])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 80CD021D7A;
        Tue,  8 Sep 2020 10:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599559952;
        bh=JRCHmfWSpGS/adPTYfUKHsn7RfTWRGVyO5P/nq3YOkc=;
        h=From:To:Cc:Subject:Date:From;
        b=Jpfve9Etd0fsu8gR2oYSjeceLDPIOfQkQhBvKUJZG1FrvlB7XS+B25yFGawucZKLl
         p4zafcUzajhImk1hWjlA0VGUqguI7aQ2Wj9NYVqtlbrffg56WAlNMi8vmkpzgVXaQa
         O77dsFQlUIPLiT8clIylK04BKgSny8PdCN0ycxAw=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kFac1-00B3qZ-0q; Tue, 08 Sep 2020 12:12:29 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        devel@driverdev.osuosl.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org,
        Anant Thazhemadam <anant.thazhemadam@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] address W=1 warnings at staging/media/atomisp
Date:   Tue,  8 Sep 2020 12:12:21 +0200
Message-Id: <cover.1599141140.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The linux-media policy is to have zero warnings with W=1. However, when
I started using a Jenkins instance at https://builder.linuxtv.org to automate
such tests, I didn't notice that a bug at the scripts were just ignoring
warnings.

Now that this is fixed, we need to get rid of the warnings that got
re-introduced when the atomisp driver was reverted, as otherwise,
every time a common header is touched, we'll see messages like
those:

  Error/warnings:

  patches/0001-media-mxl5xx-remove-unused-including-linux-version.h.patch:

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
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2841 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1200 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1531 vivid_create_instance() parse error: __split_smt: function too hairy.  Giving up after 301 seconds

This series solve all atomisp W=1 warnings.

Mauro Carvalho Chehab (5):
  media: atomisp: get rid of some cleanup leftovers
  media: atomisp: print a warning if error while setting downscaler
  media: atomisp: get rid of unused vars
  media: atomisp: move a static constant out of a header file
  media: atomisp: get rid of -Wsuggest-attribute=format warnings

 .../staging/media/atomisp/pci/atomisp_cmd.c   |  6 ---
 .../media/atomisp/pci/atomisp_compat_css20.c  | 20 ++------
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |  3 --
 .../host/input_formatter.c                    |  4 ++
 .../host/input_formatter_local.h              |  4 --
 .../staging/media/atomisp/pci/ia_css_env.h    |  4 +-
 .../isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c |  3 --
 .../kernels/sdis/sdis_2/ia_css_sdis2.host.c   |  3 --
 .../isp/kernels/vf/vf_1.0/ia_css_vf.host.c    |  5 ++
 .../atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c  |  4 +-
 drivers/staging/media/atomisp/pci/sh_css.c    | 47 ++-----------------
 .../staging/media/atomisp/pci/sh_css_mipi.c   | 12 -----
 .../media/atomisp/pci/sh_css_param_shading.c  | 25 +++-------
 .../staging/media/atomisp/pci/sh_css_params.c |  3 +-
 14 files changed, 29 insertions(+), 114 deletions(-)

-- 
2.26.2


