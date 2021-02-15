Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88AC731BB5E
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 15:49:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229811AbhBOOtJ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 15 Feb 2021 09:49:09 -0500
Received: from www.linuxtv.org ([130.149.80.248]:34588 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229652AbhBOOtI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Feb 2021 09:49:08 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lBfAb-00Aa2T-PF; Mon, 15 Feb 2021 14:48:14 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1lBfEG-0006sD-9P; Mon, 15 Feb 2021 14:52:00 +0000
Date:   Mon, 15 Feb 2021 14:51:59 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1404926469.0.1613400720125@builder.linuxtv.org>
Subject: Build failed in Jenkins: linux-media #190
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: linux-media
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/linux-media/190/display/redirect>

Changes:


------------------------------------------
[...truncated 1446 lines...]
  CC [M]  drivers/media/pci/solo6x10/solo6x10-tw28.o
  CC [M]  drivers/media/pci/solo6x10/solo6x10-gpio.o
  CC [M]  drivers/media/pci/tw5864/tw5864-core.o
  CC [M]  drivers/media/i2c/lm3560.o
  CC [M]  drivers/media/i2c/lm3646.o
  CC [M]  drivers/media/pci/cobalt/cobalt-v4l2.o
  CC [M]  drivers/media/pci/cobalt/cobalt-i2c.o
  CC [M]  drivers/media/pci/cobalt/cobalt-omnitek.o
  CC [M]  drivers/media/pci/tw5864/tw5864-video.o
  CC [M]  drivers/media/pci/solo6x10/solo6x10-disp.o
  CC [M]  drivers/media/pci/tw5864/tw5864-h264.o
  CC [M]  drivers/media/pci/tw5864/tw5864-util.o
  CC [M]  drivers/media/i2c/ak881x.o
  CC [M]  drivers/staging/media/atomisp/pci/atomisp_compat_css20.o
  CC [M]  drivers/media/pci/cobalt/cobalt-flash.o
  CC [M]  drivers/staging/media/atomisp/pci/atomisp_compat_ioctl32.o
  CC [M]  drivers/media/pci/solo6x10/solo6x10-enc.o
  CC [M]  drivers/staging/media/atomisp/pci/atomisp_csi2.o
  CC [M]  drivers/media/i2c/video-i2c.o
  LD [M]  drivers/media/pci/tw5864/tw5864.o
  CC [M]  drivers/staging/media/atomisp/pci/atomisp_drvfs.o
  CC [M]  drivers/media/i2c/ml86v7667.o
  CC [M]  drivers/media/pci/cobalt/cobalt-cpld.o
  CC [M]  drivers/media/pci/cobalt/cobalt-alsa-main.o
  CC [M]  drivers/media/pci/cobalt/cobalt-alsa-pcm.o
  CC [M]  drivers/staging/media/atomisp/pci/atomisp_file.o
  CC [M]  drivers/media/i2c/ov2659.o
  CC [M]  drivers/media/pci/solo6x10/solo6x10-v4l2-enc.o
  CC [M]  drivers/staging/media/atomisp/pci/atomisp_fops.o
  CC [M]  drivers/staging/media/atomisp/pci/atomisp_ioctl.o
  LD [M]  drivers/media/pci/cobalt/cobalt.o
  CC [M]  drivers/media/i2c/tc358743.o
  CC [M]  drivers/media/i2c/hi556.o
  CC [M]  drivers/media/pci/solo6x10/solo6x10-g723.o
  CC [M]  drivers/staging/media/atomisp/pci/atomisp_subdev.o
  CC [M]  drivers/staging/media/atomisp/pci/atomisp_tpg.o
  CC [M]  drivers/staging/media/atomisp/pci/atomisp_v4l2.o
  CC [M]  drivers/media/pci/solo6x10/solo6x10-eeprom.o
  CC [M]  drivers/staging/media/atomisp/pci/sh_css_firmware.o
  CC [M]  drivers/media/i2c/imx214.o
  CC [M]  drivers/staging/media/atomisp/pci/sh_css_host_data.o
  CC [M]  drivers/staging/media/atomisp/pci/sh_css_hrt.o
  LD [M]  drivers/media/pci/solo6x10/solo6x10.o
  CC [M]  drivers/staging/media/sunxi/cedrus/cedrus.o
  CC [M]  drivers/media/i2c/imx219.o
  CC [M]  drivers/staging/media/meson/vdec/esparser.o
  CC [M]  drivers/staging/media/rkvdec/rkvdec.o
  CC [M]  drivers/staging/media/omap4iss/iss.o
  CC [M]  drivers/staging/media/atomisp/pci/sh_css_metrics.o
  CC [M]  drivers/staging/media/imx/imx-media-capture.o
  CC [M]  drivers/staging/media/meson/vdec/vdec.o
  CC [M]  drivers/staging/media/imx/imx-media-dev-common.o
  CC [M]  drivers/staging/media/sunxi/cedrus/cedrus_video.o
  CC [M]  drivers/staging/media/sunxi/cedrus/cedrus_hw.o
  CC [M]  drivers/staging/media/atomisp/pci/sh_css_mipi.o
  CC [M]  drivers/staging/media/rkvdec/rkvdec-h264.o
  CC [M]  drivers/media/i2c/imx258.o
  CC [M]  drivers/staging/media/omap4iss/iss_csi2.o
  CC [M]  drivers/staging/media/meson/vdec/vdec_helpers.o
  CC [M]  drivers/staging/media/imx/imx-media-of.o
  CC [M]  drivers/staging/media/sunxi/cedrus/cedrus_dec.o
  CC [M]  drivers/staging/media/meson/vdec/vdec_platform.o
  CC [M]  drivers/media/i2c/imx274.o
  LD [M]  drivers/staging/media/rkvdec/rockchip-vdec.o
  CC [M]  drivers/media/i2c/imx290.o
In file included from ../include/media/v4l2-subdev.h:14,
                 from ../include/media/v4l2-device.h:13,
                 from ../drivers/staging/media/imx/imx-media-of.c:11:
../drivers/staging/media/imx/imx-media-of.c: In function ‘imx_media_of_add_csi’:
../include/media/v4l2-async.h:179:4: error: ‘__type’ undeclared (first use in this function); did you mean ‘_ctype’?
  ((__type *)__v4l2_async_notifier_add_fwnode_subdev(notifier, fwnode, \
    ^~~~~~
../drivers/staging/media/imx/imx-media-of.c:32:8: note: in expansion of macro ‘v4l2_async_notifier_add_fwnode_subdev’
  asd = v4l2_async_notifier_add_fwnode_subdev(&imxmd->notifier,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/media/v4l2-async.h:179:4: note: each undeclared identifier is reported only once for each function it appears in
  ((__type *)__v4l2_async_notifier_add_fwnode_subdev(notifier, fwnode, \
    ^~~~~~
../drivers/staging/media/imx/imx-media-of.c:32:8: note: in expansion of macro ‘v4l2_async_notifier_add_fwnode_subdev’
  asd = v4l2_async_notifier_add_fwnode_subdev(&imxmd->notifier,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/media/v4l2-async.h:179:12: error: expected expression before ‘)’ token
  ((__type *)__v4l2_async_notifier_add_fwnode_subdev(notifier, fwnode, \
            ^
../drivers/staging/media/imx/imx-media-of.c:32:8: note: in expansion of macro ‘v4l2_async_notifier_add_fwnode_subdev’
  asd = v4l2_async_notifier_add_fwnode_subdev(&imxmd->notifier,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
make[5]: *** [../scripts/Makefile.build:279: drivers/staging/media/imx/imx-media-of.o] Error 1
make[4]: *** [../scripts/Makefile.build:496: drivers/staging/media/imx] Error 2
make[4]: *** Waiting for unfinished jobs....
  CC [M]  drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.o
  CC [M]  drivers/staging/media/atomisp/pci/sh_css_mmu.o
  CC [M]  drivers/staging/media/omap4iss/iss_csiphy.o
  CC [M]  drivers/staging/media/meson/vdec/vdec_1.o
  CC [M]  drivers/staging/media/atomisp/pci/sh_css.o
  CC [M]  drivers/media/i2c/imx319.o
  CC [M]  drivers/staging/media/sunxi/cedrus/cedrus_h264.o
  CC [M]  drivers/staging/media/sunxi/cedrus/cedrus_h265.o
  CC [M]  drivers/staging/media/sunxi/cedrus/cedrus_vp8.o
  CC [M]  drivers/staging/media/atomisp/pci/sh_css_param_dvs.o
  CC [M]  drivers/staging/media/omap4iss/iss_ipipeif.o
  CC [M]  drivers/staging/media/meson/vdec/vdec_hevc.o
  CC [M]  drivers/staging/media/meson/vdec/codec_mpeg12.o
  CC [M]  drivers/media/i2c/imx334.o
  CC [M]  drivers/staging/media/meson/vdec/codec_h264.o
  CC [M]  drivers/staging/media/meson/vdec/codec_hevc_common.o
  CC [M]  drivers/staging/media/atomisp/pci/sh_css_param_shading.o
  CC [M]  drivers/staging/media/omap4iss/iss_ipipe.o
  LD [M]  drivers/staging/media/sunxi/cedrus/sunxi-cedrus.o
  CC [M]  drivers/staging/media/omap4iss/iss_resizer.o
  CC [M]  drivers/staging/media/omap4iss/iss_video.o
  CC [M]  drivers/staging/media/meson/vdec/codec_vp9.o
  CC [M]  drivers/media/i2c/imx355.o
  CC [M]  drivers/staging/media/atomisp/pci/sh_css_params.o
  CC [M]  drivers/media/i2c/max9286.o
  LD [M]  drivers/staging/media/omap4iss/omap4-iss.o
  CC [M]  drivers/staging/media/atomisp/pci/sh_css_sp.o
In file included from ../drivers/media/i2c/max9286.c:26:
../drivers/media/i2c/max9286.c: In function ‘max9286_v4l2_notifier_register’:
../include/media/v4l2-async.h:179:4: error: ‘__type’ undeclared (first use in this function); did you mean ‘_ctype’?
  ((__type *)__v4l2_async_notifier_add_fwnode_subdev(notifier, fwnode, \
    ^~~~~~
../drivers/media/i2c/max9286.c:612:9: note: in expansion of macro ‘v4l2_async_notifier_add_fwnode_subdev’
   mas = v4l2_async_notifier_add_fwnode_subdev(&priv->notifier,
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/media/v4l2-async.h:179:4: note: each undeclared identifier is reported only once for each function it appears in
  ((__type *)__v4l2_async_notifier_add_fwnode_subdev(notifier, fwnode, \
    ^~~~~~
../drivers/media/i2c/max9286.c:612:9: note: in expansion of macro ‘v4l2_async_notifier_add_fwnode_subdev’
   mas = v4l2_async_notifier_add_fwnode_subdev(&priv->notifier,
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../include/media/v4l2-async.h:179:12: error: expected expression before ‘)’ token
  ((__type *)__v4l2_async_notifier_add_fwnode_subdev(notifier, fwnode, \
            ^
../drivers/media/i2c/max9286.c:612:9: note: in expansion of macro ‘v4l2_async_notifier_add_fwnode_subdev’
   mas = v4l2_async_notifier_add_fwnode_subdev(&priv->notifier,
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
make[4]: *** [../scripts/Makefile.build:279: drivers/media/i2c/max9286.o] Error 1
make[3]: *** [../scripts/Makefile.build:496: drivers/media/i2c] Error 2
make[2]: *** [../scripts/Makefile.build:496: drivers/media] Error 2
make[2]: *** Waiting for unfinished jobs....
  CC [M]  drivers/staging/media/atomisp/pci/sh_css_stream_format.o
  LD [M]  drivers/staging/media/meson/vdec/meson-vdec.o
  CC [M]  drivers/staging/media/atomisp/pci/sh_css_version.o
  CC [M]  drivers/staging/media/atomisp/pci/base/refcount/src/refcount.o
  CC [M]  drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_binarydesc.o
  CC [M]  drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_stagedesc.o
  CC [M]  drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_util.o
  CC [M]  drivers/staging/media/atomisp/pci/camera/util/src/util.o
  CC [M]  drivers/staging/media/atomisp/pci/hmm/hmm_bo.o
  CC [M]  drivers/staging/media/atomisp/pci/hmm/hmm_dynamic_pool.o
  CC [M]  drivers/staging/media/atomisp/pci/hmm/hmm.o
  CC [M]  drivers/staging/media/atomisp/pci/hmm/hmm_reserved_pool.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2.host.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.o
  CC [M]  drivers/staging/most/video/video.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.o
  CC [M]  drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.o
  CC [M]  drivers/staging/vc04_services/bcm2835-camera/controls.o
  CC [M]  drivers/staging/greybus/light.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/bnlm/ia_css_bnlm.host.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr_1.0/ia_css_bnr.host.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/bnr/bnr2_2/ia_css_bnr2_2.host.o
  LD [M]  drivers/staging/most/video/most_video.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_1.0/ia_css_cnr.host.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_2/ia_css_cnr2.host.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/copy_output/copy_output_1.0/ia_css_copy_output.host.o
  LD [M]  drivers/staging/greybus/gb-light.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/crop/crop_1.0/ia_css_crop.host.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/csc/csc_1.0/ia_css_csc.host.o
  LD [M]  drivers/staging/vc04_services/bcm2835-camera/bcm2835-v4l2.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc.host.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc1_5/ia_css_ctc1_5.host.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/de/de_1.0/ia_css_de.host.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/de/de_2/ia_css_de2.host.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/dp/dp_1.0/ia_css_dp.host.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/fc/fc_1.0/ia_css_formats.host.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_2/ia_css_gc2.host.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/ipu2_io_ls/yuv444_io_ls/ia_css_yuv444_io.host.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/iterator/iterator_1.0/ia_css_iterator.host.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc.host.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/macc/macc1_5/ia_css_macc1_5.host.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/ob/ob_1.0/ia_css_ob.host.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/ob/ob2/ia_css_ob2.host.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/qplane/qplane_2/ia_css_qplane.host.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/raw_aa_binning/raw_aa_binning_1.0/ia_css_raa.host.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc.host.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/tdf/tdf_1.0/ia_css_tdf.host.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/wb/wb_1.0/ia_css_wb.host.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr.host.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr.host.o
  CC [M]  drivers/staging/media/atomisp/pci/isp/kernels/ynr/ynr_2/ia_css_ynr2.host.o
  CC [M]  drivers/staging/media/atomisp/pci/mmu/isp_mmu.o
  CC [M]  drivers/staging/media/atomisp/pci/mmu/sh_mmu_mrfld.o
  CC [M]  drivers/staging/media/atomisp/pci/runtime/binary/src/binary.o
  CC [M]  drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.o
  CC [M]  drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.o
  CC [M]  drivers/staging/media/atomisp/pci/runtime/event/src/event.o
  CC [M]  drivers/staging/media/atomisp/pci/runtime/frame/src/frame.o
  CC [M]  drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.o
  CC [M]  drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.o
  CC [M]  drivers/staging/media/atomisp/pci/runtime/isys/src/csi_rx_rmgr.o
  CC [M]  drivers/staging/media/atomisp/pci/runtime/isys/src/ibuf_ctrl_rmgr.o
  CC [M]  drivers/staging/media/atomisp/pci/runtime/isys/src/isys_dma_rmgr.o
  CC [M]  drivers/staging/media/atomisp/pci/runtime/isys/src/isys_init.o
  CC [M]  drivers/staging/media/atomisp/pci/runtime/isys/src/isys_stream2mmio_rmgr.o
  CC [M]  drivers/staging/media/atomisp/pci/runtime/isys/src/rx.o
  CC [M]  drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.o
  CC [M]  drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.o
  CC [M]  drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.o
  CC [M]  drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.o
  CC [M]  drivers/staging/media/atomisp/pci/runtime/timer/src/timer.o
  CC [M]  drivers/staging/media/atomisp/pci/css_2401_system/hive/ia_css_isp_configs.o
  CC [M]  drivers/staging/media/atomisp/pci/css_2401_system/hive/ia_css_isp_params.o
  CC [M]  drivers/staging/media/atomisp/pci/css_2401_system/hive/ia_css_isp_states.o
  CC [M]  drivers/staging/media/atomisp/pci/css_2401_system/host/isys_irq.o
  CC [M]  drivers/staging/media/atomisp/pci/atomisp_gmin_platform.o
  LD [M]  drivers/staging/media/atomisp/atomisp.o
make[3]: *** [../scripts/Makefile.build:496: drivers/staging/media] Error 2
make[2]: *** [../scripts/Makefile.build:496: drivers/staging] Error 2
make[1]: *** [/var/lib/jenkins/workspace/linux-media/Makefile:1805: drivers] Error 2
make[1]: Leaving directory '/var/lib/jenkins/workspace/linux-media/x86_64_mod'
make: *** [Makefile:185: __sub-make] Error 2
[Pipeline] }
[Pipeline] // node
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
Failed in branch x86_64 (builtin/mod)
[Pipeline] // parallel
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Declarative: Post Actions)
[Pipeline] step
