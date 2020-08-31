Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CAF6257F2E
	for <lists+linux-media@lfdr.de>; Mon, 31 Aug 2020 19:01:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728211AbgHaRBf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Aug 2020 13:01:35 -0400
Received: from www.linuxtv.org ([130.149.80.248]:60252 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726249AbgHaRBc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Aug 2020 13:01:32 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kCn5l-009OvT-SC; Mon, 31 Aug 2020 16:55:38 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kCnE5-0005Kk-1Z; Mon, 31 Aug 2020 17:04:13 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.10] DVB & RC fixes (v2) (#66652)
Date:   Mon, 31 Aug 2020 17:04:12 +0000
Message-Id: <20200831170412.20461-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200830122609.GA22247@gofer.mess.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20200830122609.GA22247@gofer.mess.org/
Build log: https://builder.linuxtv.org/job/patchwork/66330/
Build time: 00:23:45
Link: https://lore.kernel.org/linux-media/20200830122609.GA22247@gofer.mess.org

gpg: Signature made Sun 30 Aug 2020 12:16:46 PM UTC
gpg:                using RSA key A624251A26084A9ED9E4C8B6425F639D3960FA9E
gpg:                issuer "sean@mess.org"
gpg: Good signature from "Sean Young <sean@mess.org>" [full]

Summary: got 2/6 patches with issues, being 2 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-mxl5xx-remove-unused-including-linux-version.h.patch:

    allyesconfig: return code #0:
	  struct gdc_warp_param_mem_s *isp_data_ptr;

    allyesconfig: return code #0:
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:3204 video_put_user() warn: check that 'ev32' doesn't leak information (struct has a hole after 'type')
	../drivers/media/v4l2-core/v4l2-ioctl.c: ../drivers/media/v4l2-core/v4l2-ioctl.c:3229 video_put_user() warn: check that 'vb32' doesn't leak information (struct has a hole after 'memory')
	../drivers/media/tuners/qt1010.c: ../drivers/media/tuners/qt1010.c:239 qt1010_init_meas1() error: uninitialized symbol 'val2'.
	../drivers/media/tuners/qt1010.c: ../drivers/media/tuners/qt1010.c:273 qt1010_init_meas2() error: uninitialized symbol 'val'.
	../drivers/media/dvb-frontends/tda10021.c: ../drivers/media/dvb-frontends/tda10021.c:153 tda10021_set_symbolrate() warn: unsigned 'symbolrate' is never less than zero.
	../drivers/media/dvb-frontends/tda10021.c: ../drivers/media/dvb-frontends/tda10021.c:155 tda10021_set_symbolrate() warn: unsigned 'symbolrate' is never less than zero.
	../drivers/media/dvb-frontends/tda10021.c: ../drivers/media/dvb-frontends/tda10021.c:157 tda10021_set_symbolrate() warn: unsigned 'symbolrate' is never less than zero.
	../drivers/media/dvb-frontends/tda10021.c: ../drivers/media/dvb-frontends/tda10021.c:159 tda10021_set_symbolrate() warn: unsigned 'symbolrate' is never less than zero.
	../drivers/media/v4l2-core/videobuf-dma-sg.c: ../drivers/media/v4l2-core/videobuf-dma-sg.c:245 videobuf_dma_init_kernel() warn: should 'nr_pages << 12' be a 64 bit type?
	../drivers/media/pci/ttpci/av7110_v4l.c: ../drivers/media/pci/ttpci/av7110_v4l.c:163 ves1820_set_tv_freq() warn: unsigned 'freq' is never less than zero.
	../drivers/media/pci/ttpci/av7110_v4l.c: ../drivers/media/pci/ttpci/av7110_v4l.c:165 ves1820_set_tv_freq() warn: unsigned 'freq' is never less than zero.
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
	SPARSE:../drivers/media/platform/qcom/venus/hfi_venus.c ../drivers/media/platform/qcom/venus/hfi_venus.c:133:5:  warning: symbol 'venus_fw_debug' was not declared. Should it be static?
	../drivers/media/pci/cx23885/cx23885-alsa.c: ../drivers/media/pci/cx23885/cx23885-alsa.c:83 cx23885_alsa_dma_init() warn: should 'nr_pages << 12' be a 64 bit type?
	../drivers/media/pci/cx25821/cx25821-alsa.c: ../drivers/media/pci/cx25821/cx25821-alsa.c:146 cx25821_alsa_dma_init() warn: should 'nr_pages << 12' be a 64 bit type?
	../drivers/media/radio/wl128x/fmdrv_common.c: ../drivers/media/radio/wl128x/fmdrv_common.c:736 fm_irq_handle_rdsdata_getcmd_resp() warn: potential spectre issue 'rds_fmt.data.groupdatabuff.buff' [w]
	../drivers/media/pci/cx88/cx88-alsa.c: ../drivers/media/pci/cx88/cx88-alsa.c:286 cx88_alsa_dma_init() warn: should 'nr_pages << 12' be a 64 bit type?
	../drivers/media/pci/saa7134/saa7134-tvaudio.c: ../drivers/media/pci/saa7134/saa7134-tvaudio.c:686 saa_dsp_writel() warn: should 'reg << 2' be a 64 bit type?
	../drivers/media/pci/saa7134/saa7134-alsa.c: ../drivers/media/pci/saa7134/saa7134-alsa.c:267 saa7134_alsa_dma_init() warn: should 'nr_pages << 12' be a 64 bit type?
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2841 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1200 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1460 vivid_create_instance() parse error: __split_smt: function too hairy.  Giving up after 308 seconds

patches/0005-media-rc-harmonize-infrared-durations-to-microsecond.patch:

    allyesconfig: return code #0:
	../drivers/media/rc/serial_ir.c: ../drivers/media/rc/serial_ir.c:550 serial_ir_probe() warn: should '8 << ioshift' be a 64 bit type?
	../drivers/media/pci/saa7134/saa7134-tvaudio.c: ../drivers/media/pci/saa7134/saa7134-tvaudio.c:686 saa_dsp_writel() warn: should 'reg << 2' be a 64 bit type?
	../drivers/media/pci/cx88/cx88-alsa.c: ../drivers/media/pci/cx88/cx88-alsa.c:286 cx88_alsa_dma_init() warn: should 'nr_pages << 12' be a 64 bit type?
	../drivers/media/pci/saa7134/saa7134-alsa.c: ../drivers/media/pci/saa7134/saa7134-alsa.c:267 saa7134_alsa_dma_init() warn: should 'nr_pages << 12' be a 64 bit type?
	../drivers/media/pci/cx23885/cx23885-alsa.c: ../drivers/media/pci/cx23885/cx23885-alsa.c:83 cx23885_alsa_dma_init() warn: should 'nr_pages << 12' be a 64 bit type?
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2841 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1200 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1456 vivid_create_instance() parse error: __split_smt: function too hairy.  Giving up after 304 seconds


Error #512 when building PDF docs

