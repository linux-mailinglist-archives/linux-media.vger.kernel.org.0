Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D207725BB23
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 08:38:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbgICGie (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 02:38:34 -0400
Received: from www.linuxtv.org ([130.149.80.248]:44814 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725919AbgICGie (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Sep 2020 02:38:34 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kDinT-00Cc0x-2b; Thu, 03 Sep 2020 06:32:35 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kDivp-0007WH-Jk; Thu, 03 Sep 2020 06:41:13 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for v5.9-rc4] media fixes (#66764)
Date:   Thu,  3 Sep 2020 06:41:13 +0000
Message-Id: <20200903064113.28864-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200903081057.78407ab4@coco.lan>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20200903081057.78407ab4@coco.lan/
Build log: https://builder.linuxtv.org/job/patchwork/66699/
Build time: 00:19:08
Link: https://lore.kernel.org/linux-media/20200903081057.78407ab4@coco.lan

gpg: Signature made Thu 03 Sep 2020 06:04:27 AM UTC
gpg:                using RSA key F909AE68FC11DF09C1755C00085F3EBD8EE4E115
gpg: Good signature from "Mauro Carvalho Chehab <mchehab+huawei@kernel.org>" [unknown]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <m.chehab@samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@osg.samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@s-opensource.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab+samsung@kernel.org>" [ultimate]
gpg:                 aka "[jpeg image of size 3594]" [ultimate]

Summary: got 3/10 patches with issues, being 1 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-ti-vpe-cal-Fix-compilation-on-32-bit-ARM.patch:

    allyesconfig: return code #0:
	  struct gdc_warp_param_mem_s *isp_data_ptr;

    allyesconfig: return code #0:
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:3204 video_put_user() warn: check that 'ev32' doesn't leak information (struct has a hole after 'type')
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:3229 video_put_user() warn: check that 'vb32' doesn't leak information (struct has a hole after 'memory')
	../drivers/media/tuners/qt1010.c: ../drivers/media/tuners/qt1010.c:239 qt1010_init_meas1() error: uninitialized symbol 'val2'.
	../drivers/media/tuners/qt1010.c: ../drivers/media/tuners/qt1010.c:273 qt1010_init_meas2() error: uninitialized symbol 'val'.
	../drivers/media/pci/ttpci/av7110_v4l.c: ../drivers/media/pci/ttpci/av7110_v4l.c:163 ves1820_set_tv_freq() warn: unsigned 'freq' is never less than zero.
	../drivers/media/pci/ttpci/av7110_v4l.c: ../drivers/media/pci/ttpci/av7110_v4l.c:165 ves1820_set_tv_freq() warn: unsigned 'freq' is never less than zero.
	../drivers/media/v4l2-core/videobuf-dma-sg.c: ../drivers/media/v4l2-core/videobuf-dma-sg.c:245 videobuf_dma_init_kernel() warn: should 'nr_pages << 12' be a 64 bit type?
	../drivers/media/dvb-frontends/tda10021.c: ../drivers/media/dvb-frontends/tda10021.c:153 tda10021_set_symbolrate() warn: unsigned 'symbolrate' is never less than zero.
	../drivers/media/dvb-frontends/tda10021.c: ../drivers/media/dvb-frontends/tda10021.c:155 tda10021_set_symbolrate() warn: unsigned 'symbolrate' is never less than zero.
	../drivers/media/dvb-frontends/tda10021.c: ../drivers/media/dvb-frontends/tda10021.c:157 tda10021_set_symbolrate() warn: unsigned 'symbolrate' is never less than zero.
	../drivers/media/dvb-frontends/tda10021.c: ../drivers/media/dvb-frontends/tda10021.c:159 tda10021_set_symbolrate() warn: unsigned 'symbolrate' is never less than zero.
	../drivers/media/dvb-frontends/tda10086.c: ../drivers/media/dvb-frontends/tda10086.c:300 tda10086_set_symbol_rate() warn: unsigned 'symbol_rate' is never less than zero.
	../drivers/media/dvb-frontends/tda10086.c: ../drivers/media/dvb-frontends/tda10086.c:303 tda10086_set_symbol_rate() warn: unsigned 'symbol_rate' is never less than zero.
	../drivers/media/dvb-frontends/tda10086.c: ../drivers/media/dvb-frontends/tda10086.c:306 tda10086_set_symbol_rate() warn: unsigned 'symbol_rate' is never less than zero.
	../drivers/media/dvb-frontends/tda10086.c: ../drivers/media/dvb-frontends/tda10086.c:309 tda10086_set_symbol_rate() warn: unsigned 'symbol_rate' is never less than zero.
	../drivers/media/dvb-frontends/tda10086.c: ../drivers/media/dvb-frontends/tda10086.c:312 tda10086_set_symbol_rate() warn: unsigned 'symbol_rate' is never less than zero.
	../drivers/media/dvb-frontends/tda10086.c: ../drivers/media/dvb-frontends/tda10086.c:315 tda10086_set_symbol_rate() warn: unsigned 'symbol_rate' is never less than zero.
	../drivers/media/dvb-frontends/tda10086.c: ../drivers/media/dvb-frontends/tda10086.c:318 tda10086_set_symbol_rate() warn: unsigned 'symbol_rate' is never less than zero.
	../drivers/media/dvb-frontends/tda10086.c: ../drivers/media/dvb-frontends/tda10086.c:321 tda10086_set_symbol_rate() warn: unsigned 'symbol_rate' is never less than zero.
	../drivers/media/dvb-frontends/tda10086.c: ../drivers/media/dvb-frontends/tda10086.c:324 tda10086_set_symbol_rate() warn: unsigned 'symbol_rate' is never less than zero.
	../drivers/media/dvb-frontends/tda10086.c: ../drivers/media/dvb-frontends/tda10086.c:327 tda10086_set_symbol_rate() warn: unsigned 'symbol_rate' is never less than zero.
	../drivers/media/rc/serial_ir.c: ../drivers/media/rc/serial_ir.c:550 serial_ir_probe() warn: should '8 << ioshift' be a 64 bit type?
	../drivers/media/radio/wl128x/fmdrv_common.c: ../drivers/media/radio/wl128x/fmdrv_common.c:736 fm_irq_handle_rdsdata_getcmd_resp() warn: potential spectre issue 'rds_fmt.data.groupdatabuff.buff' [w]
	../drivers/media/pci/cx25821/cx25821-alsa.c: ../drivers/media/pci/cx25821/cx25821-alsa.c:146 cx25821_alsa_dma_init() warn: should 'nr_pages << 12' be a 64 bit type?
	../drivers/media/pci/cx88/cx88-alsa.c: ../drivers/media/pci/cx88/cx88-alsa.c:286 cx88_alsa_dma_init() warn: should 'nr_pages << 12' be a 64 bit type?
	../drivers/media/pci/cx23885/cx23885-alsa.c: ../drivers/media/pci/cx23885/cx23885-alsa.c:83 cx23885_alsa_dma_init() warn: should 'nr_pages << 12' be a 64 bit type?
	../drivers/media/pci/saa7134/saa7134-tvaudio.c: ../drivers/media/pci/saa7134/saa7134-tvaudio.c:686 saa_dsp_writel() warn: should 'reg << 2' be a 64 bit type?
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1200 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1341 vivid_create_instance() parse error: __split_smt: function too hairy.  Giving up after 301 seconds
	../drivers/media/pci/saa7134/saa7134-alsa.c: ../drivers/media/pci/saa7134/saa7134-alsa.c:267 saa7134_alsa_dma_init() warn: should 'nr_pages << 12' be a 64 bit type?
	SPARSE:../drivers/media/platform/qcom/venus/hfi_venus.c ../drivers/media/platform/qcom/venus/hfi_venus.c:133:5:  warning: symbol 'venus_fw_debug' was not declared. Should it be static?
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2856 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0002-media-media-v4l2-core-Fix-kernel-infoleak-in-video_p.patch:

   checkpatch.pl:
	$ cat patches/0002-media-media-v4l2-core-Fix-kernel-infoleak-in-video_p.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:10: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)

patches/0005-media-i2c-imx214-select-V4L2_FWNODE.patch:

   checkpatch.pl:
	$ cat patches/0005-media-i2c-imx214-select-V4L2_FWNODE.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:9: ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 32a363d0b0b1 ("media: Kconfig files: use select for V4L2 subdevs and MC")'


Error #512 when building PDF docs

