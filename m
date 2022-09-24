Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56A015E8A43
	for <lists+linux-media@lfdr.de>; Sat, 24 Sep 2022 10:48:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233626AbiIXIsa convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Sat, 24 Sep 2022 04:48:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbiIXIs1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Sep 2022 04:48:27 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7638E741A
        for <linux-media@vger.kernel.org>; Sat, 24 Sep 2022 01:48:25 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1oc0pf-009U3r-Pz; Sat, 24 Sep 2022 08:48:20 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1oc0pe-00FbPg-2C; Sat, 24 Sep 2022 08:48:17 +0000
Date:   Sat, 24 Sep 2022 08:48:17 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        mchehab@linuxtv.org
Message-ID: <14251207.2.1664009297444@builder.linuxtv.org>
Subject: Build failed in Jenkins: media_stage_gcc #111
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: media_stage_gcc
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/media_stage_gcc/111/display/redirect?page=changes>

Changes:

[Mauro Carvalho Chehab] media: hantro: Store HEVC bit depth in context

[Mauro Carvalho Chehab] media: hantro: HEVC: Fix auxilary buffer size calculation

[Mauro Carvalho Chehab] media: hantro: HEVC: Fix chroma offset computation

[Mauro Carvalho Chehab] media: hantro: postproc: Configure output regs to support 10bit

[Mauro Carvalho Chehab] media: Hantro: HEVC: Allows 10-bit bitstream

[Mauro Carvalho Chehab] media: hantro: imx8m: Enable 10bit decoding

[Mauro Carvalho Chehab] media: hantro: Allows luma and chroma depth to be different

[Mauro Carvalho Chehab] media: staging: ipu3-imgu: Fix BNR wb gain documentation

[Mauro Carvalho Chehab] media: ov5640: Use runtime PM

[Mauro Carvalho Chehab] media: v4l2: Fix v4l2_i2c_subdev_set_name function documentation

[Mauro Carvalho Chehab] media: i2c: mt9v111: Fix typo 'the the' in comment

[Mauro Carvalho Chehab] media: ar0521: fix error return code in ar0521_power_on()

[Mauro Carvalho Chehab] media: ar0521: Remove redundant variable ret

[Mauro Carvalho Chehab] media: ipu3-imgu: Fix NULL pointer dereference in active selection access

[Mauro Carvalho Chehab] media: v4l: subdev: Fail graciously when getting try data for NULL state

[Mauro Carvalho Chehab] media: ar0521: Fix return value check in writing initial registers

[Mauro Carvalho Chehab] media: ov8865: Fix an error handling path in ov8865_probe()

[Mauro Carvalho Chehab] media: sun6i-mipi-csi2: Depend on PHY_SUN6I_MIPI_DPHY

[Mauro Carvalho Chehab] media: Remove incorrect comment from struct v4l2_fwnode_endpoint

[Mauro Carvalho Chehab] media: Documentation: mc: add definitions for stream and pipeline

[Mauro Carvalho Chehab] media: media-entity.h: add include for min()

[Mauro Carvalho Chehab] media: subdev: increase V4L2_FRAME_DESC_ENTRY_MAX to 8

[Mauro Carvalho Chehab] media: mc: entity: Rename streaming_count -> start_count

[Mauro Carvalho Chehab] media: mc: entity: Add iterator helper for entity pads

[Mauro Carvalho Chehab] media: mc: entity: Merge media_entity_enum_init and __media_entity_enum_init

[Mauro Carvalho Chehab] media: mc: entity: Move media_entity_get_fwnode_pad() out of graph walk section

[Mauro Carvalho Chehab] media: mc: entity: Add media_entity_pipeline() to access the media pipeline

[Mauro Carvalho Chehab] media: v4l2-dev: Add videodev wrappers for media pipelines

[Mauro Carvalho Chehab] media: drivers: use video device pipeline start/stop

[Mauro Carvalho Chehab] media: drivers: use video_device_pipeline()

[Mauro Carvalho Chehab] media: mc: entity: add alloc variant of pipeline_start

[Mauro Carvalho Chehab] media: drivers: use video_device_pipeline_alloc_start()

[Mauro Carvalho Chehab] media: mc: entity: Rewrite media_pipeline_start()

[Mauro Carvalho Chehab] media: mc: entity: Add has_pad_interdep entity operation

[Mauro Carvalho Chehab] media: mc: convert pipeline funcs to take media_pad

[Mauro Carvalho Chehab] media: dt-bindings: dongwoon,dw9714: convert to dtschema

[Mauro Carvalho Chehab] media: dt-bindings: media: samsung,exynos5250-gsc: convert to dtschema

[Mauro Carvalho Chehab] media: atomisp_gmin_platform: Switch to use acpi_evaluate_dsm_typed()

[Mauro Carvalho Chehab] media: atomisp-ov2680: Fix ov2680_set_fmt()

[Mauro Carvalho Chehab] media: atomisp-ov2680: Don't take the input_lock for try_fmt calls.

[Mauro Carvalho Chehab] media: atomisp-ov2680: Improve ov2680_set_fmt() error handling

[Mauro Carvalho Chehab] media: atomisp-notes: Add info about sensors v4l2_get_subdev_hostdata() use

[Mauro Carvalho Chehab] media: atomisp: Fix VIDIOC_TRY_FMT

[Mauro Carvalho Chehab] media: atomisp: Make atomisp_try_fmt_cap() take padding into account

[Mauro Carvalho Chehab] media: atomisp: hmm_bo: Simplify alloc_private_pages()

[Mauro Carvalho Chehab] media: atomisp: hmm_bo: Further simplify alloc_private_pages()

[Mauro Carvalho Chehab] media: atomisp: hmm_bo: Rewrite alloc_private_pages() using pages_array helper funcs

[Mauro Carvalho Chehab] media: atomisp: hmm_bo: Rewrite free_private_pages() using pages_array helper funcs

[Mauro Carvalho Chehab] media: atomisp: hmm_bo: Drop PFN code path from alloc_user_pages()

[Mauro Carvalho Chehab] media: atomisp: Ensure that USERPTR pointers are page aligned

[Mauro Carvalho Chehab] media: atomisp: Fix device_caps reporting of the registered video-devs

[Mauro Carvalho Chehab] media: atomisp: Remove file-injection support

[Mauro Carvalho Chehab] media: atomisp: Remove atomisp_file_fops and atomisp_file_ioctl_ops

[Mauro Carvalho Chehab] media: atomisp: Remove the outq videobuf queue

[Mauro Carvalho Chehab] media: atomisp: Remove never set file_input flag

[Mauro Carvalho Chehab] media: atomisp: Remove the ACC device node

[Mauro Carvalho Chehab] media: atomisp: Remove some further ATOMISP_ACC_* related dead code

[Mauro Carvalho Chehab] media: atomisp: Remove empty atomisp_css_set_cont_prev_start_time() function

[Mauro Carvalho Chehab] media: atomisp: Split subdev and video-node registration into 2 steps

[Mauro Carvalho Chehab] media: atomisp: Register /dev/* nodes at the end of atomisp_pci_probe()

[Mauro Carvalho Chehab] media: atomisp: Remove loading mutex

[Mauro Carvalho Chehab] media: atomisp: Fix v4l2_fh resource leak on open errors

[Mauro Carvalho Chehab] media: atomisp: Simplify v4l2_fh_open() error handling

[Mauro Carvalho Chehab] media: atomisp: prevent integer overflow in sh_css_set_black_frame()

[Mauro Carvalho Chehab] media: atomisp: Use a normal mutex for the main lock

[Mauro Carvalho Chehab] media: atomisp: Remove unused lock member from struct atomisp_sub_device

[Mauro Carvalho Chehab] media: atomisp: Fix locking around asd->streaming read/write

[Mauro Carvalho Chehab] media: atomisp: Remove asd == NULL checks from ioctl handling

[Mauro Carvalho Chehab] media: atomisp: Add atomisp_pipe_check() helper

[Mauro Carvalho Chehab] media: atomisp: Remove watchdog timer

[Mauro Carvalho Chehab] media: atomisp: Move atomisp_streaming_count() check into __atomisp_css_recover()

[Mauro Carvalho Chehab] media: atomisp: Rework asd->streaming state update in __atomisp_streamoff()

[Mauro Carvalho Chehab] media: atomisp: Drop streamoff_mutex

[Mauro Carvalho Chehab] media: atomisp: Use video_dev.lock for ioctl locking

[Mauro Carvalho Chehab] media: atomisp: Remove a couple of not useful function wrappers

[Mauro Carvalho Chehab] media: atomisp: Drop unnecessary first_streamoff check

[Mauro Carvalho Chehab] media: atomisp: Make atomisp_set_raw_buffer_bitmap() static

[Mauro Carvalho Chehab] media: atomisp: Remove unused atomisp_css_get_dis_statistics()

[Mauro Carvalho Chehab] media: atomisp: Remove const/fixed camera_caps

[Mauro Carvalho Chehab] media: atomisp: Remove atomisp_source_pad_to_stream_id()

[Mauro Carvalho Chehab] media: atomisp_gmin_platform: Unexport and split camera_sensor_csi()


------------------------------------------
[...truncated 43.79 KB...]
  HDRINST usr/include/rdma/cxgb4-abi.h
  HDRINST usr/include/rdma/mlx5_user_ioctl_verbs.h
  HDRINST usr/include/rdma/bnxt_re-abi.h
  HDRINST usr/include/rdma/mlx4-abi.h
  HDRINST usr/include/rdma/ocrdma-abi.h
  HDRINST usr/include/rdma/ib_user_sa.h
  HDRINST usr/include/rdma/mlx5-abi.h
  HDRINST usr/include/rdma/erdma-abi.h
  HDRINST usr/include/rdma/ib_user_ioctl_verbs.h
  HDRINST usr/include/rdma/hns-abi.h
  HDRINST usr/include/rdma/rdma_netlink.h
  HDRINST usr/include/rdma/hfi/hfi1_user.h
  HDRINST usr/include/rdma/hfi/hfi1_ioctl.h
  HDRINST usr/include/rdma/rdma_user_ioctl.h
  HDRINST usr/include/rdma/ib_user_verbs.h
  HDRINST usr/include/scsi/scsi_netlink.h
  HDRINST usr/include/scsi/scsi_netlink_fc.h
  HDRINST usr/include/scsi/scsi_bsg_mpi3mr.h
  HDRINST usr/include/scsi/fc/fc_els.h
  HDRINST usr/include/scsi/fc/fc_ns.h
  HDRINST usr/include/scsi/fc/fc_fs.h
  HDRINST usr/include/scsi/fc/fc_gs.h
  HDRINST usr/include/scsi/cxlflash_ioctl.h
  HDRINST usr/include/scsi/scsi_bsg_fc.h
  HDRINST usr/include/scsi/scsi_bsg_ufs.h
  HDRINST usr/include/sound/asound_fm.h
  HDRINST usr/include/sound/hdsp.h
  HDRINST usr/include/sound/asound.h
  HDRINST usr/include/sound/snd_ar_tokens.h
  HDRINST usr/include/sound/skl-tplg-interface.h
  HDRINST usr/include/sound/firewire.h
  HDRINST usr/include/sound/compress_offload.h
  HDRINST usr/include/sound/sof/header.h
  HDRINST usr/include/sound/sof/abi.h
  HDRINST usr/include/sound/sof/tokens.h
  HDRINST usr/include/sound/sof/fw.h
  HDRINST usr/include/sound/sfnt_info.h
  HDRINST usr/include/sound/asoc.h
  HDRINST usr/include/sound/compress_params.h
  HDRINST usr/include/sound/intel/avs/tokens.h
  HDRINST usr/include/sound/usb_stream.h
  HDRINST usr/include/sound/emu10k1.h
  HDRINST usr/include/sound/hdspm.h
  HDRINST usr/include/sound/snd_sst_tokens.h
  HDRINST usr/include/sound/asequencer.h
  HDRINST usr/include/sound/sb16_csp.h
  HDRINST usr/include/sound/tlv.h
  HDRINST usr/include/video/uvesafb.h
  HDRINST usr/include/video/sisfb.h
  HDRINST usr/include/video/edid.h
  HDRINST usr/include/xen/privcmd.h
  HDRINST usr/include/xen/evtchn.h
  HDRINST usr/include/xen/gntalloc.h
  HDRINST usr/include/xen/gntdev.h
  HDRINST usr/include/linux/version.h
  HDRINST usr/include/asm/prctl.h
  HDRINST usr/include/asm/mce.h
  HDRINST usr/include/asm/debugreg.h
  HDRINST usr/include/asm/kvm.h
  HDRINST usr/include/asm/auxvec.h
  HDRINST usr/include/asm/a.out.h
  HDRINST usr/include/asm/signal.h
  HDRINST usr/include/asm/hwcap2.h
  HDRINST usr/include/asm/swab.h
  HDRINST usr/include/asm/vm86.h
  HDRINST usr/include/asm/hw_breakpoint.h
  HDRINST usr/include/asm/vsyscall.h
  HDRINST usr/include/asm/posix_types_64.h
  HDRINST usr/include/asm/boot.h
  HDRINST usr/include/asm/unistd.h
  HDRINST usr/include/asm/perf_regs.h
  HDRINST usr/include/asm/mman.h
  HDRINST usr/include/asm/e820.h
  HDRINST usr/include/asm/msr.h
  HDRINST usr/include/asm/siginfo.h
  HDRINST usr/include/asm/ucontext.h
  HDRINST usr/include/asm/byteorder.h
  HDRINST usr/include/asm/posix_types_x32.h
  HDRINST usr/include/asm/vmx.h
  HDRINST usr/include/asm/ist.h
  HDRINST usr/include/asm/shmbuf.h
  HDRINST usr/include/asm/bootparam.h
  HDRINST usr/include/asm/posix_types_32.h
  HDRINST usr/include/asm/sembuf.h
  HDRINST usr/include/asm/amd_hsmp.h
  HDRINST usr/include/asm/svm.h
  HDRINST usr/include/asm/mtrr.h
  HDRINST usr/include/asm/stat.h
  HDRINST usr/include/asm/setup.h
  HDRINST usr/include/asm/sigcontext32.h
  HDRINST usr/include/asm/msgbuf.h
  HDRINST usr/include/asm/sgx.h
  HDRINST usr/include/asm/kvm_perf.h
  HDRINST usr/include/asm/ptrace.h
  HDRINST usr/include/asm/processor-flags.h
  HDRINST usr/include/asm/sigcontext.h
  HDRINST usr/include/asm/posix_types.h
  HDRINST usr/include/asm/statfs.h
  HDRINST usr/include/asm/bitsperlong.h
  HDRINST usr/include/asm/kvm_para.h
  HDRINST usr/include/asm/ptrace-abi.h
  HDRINST usr/include/asm/ldt.h
  HDRINST usr/include/asm/sockios.h
  HDRINST usr/include/asm/poll.h
  HDRINST usr/include/asm/socket.h
  HDRINST usr/include/asm/fcntl.h
  HDRINST usr/include/asm/types.h
  HDRINST usr/include/asm/unistd_x32.h
  HDRINST usr/include/asm/param.h
  HDRINST usr/include/asm/termios.h
  HDRINST usr/include/asm/resource.h
  HDRINST usr/include/asm/unistd_64.h
  HDRINST usr/include/asm/termbits.h
  HDRINST usr/include/asm/ioctls.h
  HDRINST usr/include/asm/unistd_32.h
  HDRINST usr/include/asm/ipcbuf.h
  HDRINST usr/include/asm/bpf_perf_event.h
  HDRINST usr/include/asm/errno.h
  HDRINST usr/include/asm/ioctl.h
  UPD     include/generated/asm-offsets.h
  CALL    scripts/checksyscalls.sh
  CC      init/main.o
  CHK     include/generated/compile.h
  CC      init/do_mounts.o
  CC      init/do_mounts_rd.o
  CC      init/do_mounts_initrd.o
  CC      init/initramfs.o
  CC      init/calibrate.o
  CC      init/init_task.o
  UPD     include/generated/compile.h
  CC      init/version.o
  AR      init/built-in.a
+ make W=1 -j9 drivers/staging/media/
  DESCEND objtool
  CALL    scripts/atomic/check-atomics.sh
  CALL    scripts/checksyscalls.sh
  CC      drivers/staging/media/max96712/max96712.o
  CC      drivers/staging/media/deprecated/cpia2/cpia2_v4l.o
  CC      drivers/staging/media/rkvdec/rkvdec.o
  CC      drivers/staging/media/deprecated/stkwebcam/stk-webcam.o
  CC      drivers/staging/media/omap4iss/iss.o
  CC      drivers/staging/media/imx/imx-media-capture.o
  CC      drivers/staging/media/deprecated/meye/meye.o
  CC      drivers/staging/media/meson/vdec/esparser.o
  CC      drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.o
  AR      drivers/staging/media/max96712/built-in.a
  CC      drivers/staging/media/imx/imx-media-dev-common.o
  CC      drivers/staging/media/deprecated/cpia2/cpia2_usb.o
  CC      drivers/staging/media/rkvdec/rkvdec-h264.o
  CC      drivers/staging/media/deprecated/stkwebcam/stk-sensor.o
  CC      drivers/staging/media/omap4iss/iss_csi2.o
  CC      drivers/staging/media/imx/imx-media-of.o
  AR      drivers/staging/media/deprecated/meye/built-in.a
  CC      drivers/staging/media/sunxi/cedrus/cedrus.o
  CC      drivers/staging/media/meson/vdec/vdec.o
  AR      drivers/staging/media/atomisp/i2c/ov5693/built-in.a
  CC      drivers/staging/media/atomisp/i2c/atomisp-mt9m114.o
  CC      drivers/staging/media/sunxi/cedrus/cedrus_video.o
  CC      drivers/staging/media/imx/imx-media-utils.o
  CC      drivers/staging/media/deprecated/cpia2/cpia2_core.o
  AR      drivers/staging/media/deprecated/stkwebcam/built-in.a
  CC      drivers/staging/media/imx/imx-media-dev.o
  CC      drivers/staging/media/omap4iss/iss_csiphy.o
  CC      drivers/staging/media/rkvdec/rkvdec-vp9.o
  CC      drivers/staging/media/imx/imx-media-internal-sd.o
  CC      drivers/staging/media/meson/vdec/vdec_helpers.o
  CC      drivers/staging/media/atomisp/i2c/atomisp-gc2235.o
  CC      drivers/staging/media/sunxi/cedrus/cedrus_hw.o
  CC      drivers/staging/media/sunxi/cedrus/cedrus_dec.o
  CC      drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.o
  CC      drivers/staging/media/imx/imx-ic-common.o
  CC      drivers/staging/media/omap4iss/iss_ipipeif.o
  AR      drivers/staging/media/deprecated/cpia2/built-in.a
  CC      drivers/staging/media/imx/imx-ic-prp.o
  AR      drivers/staging/media/rkvdec/built-in.a
  CC      drivers/staging/media/imx/imx-ic-prpencvf.o
  CC      drivers/staging/media/meson/vdec/vdec_platform.o
  CC      drivers/staging/media/atomisp/i2c/atomisp-ov2722.o
  CC      drivers/staging/media/atomisp/i2c/atomisp-ov2680.o
  CC      drivers/staging/media/atomisp/i2c/atomisp-gc0310.o
  CC      drivers/staging/media/sunxi/cedrus/cedrus_h264.o
  CC      drivers/staging/media/sunxi/cedrus/cedrus_h265.o
  CC      drivers/staging/media/sunxi/cedrus/cedrus_vp8.o
  CC      drivers/staging/media/omap4iss/iss_ipipe.o
  CC      drivers/staging/media/meson/vdec/vdec_1.o
  CC      drivers/staging/media/imx/imx-media-vdic.o
  CC      drivers/staging/media/imx/imx-media-csc-scaler.o
  CC      drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.o
  CC      drivers/staging/media/atomisp/i2c/atomisp-lm3554.o
  CC      drivers/staging/media/omap4iss/iss_resizer.o
  CC      drivers/staging/media/imx/imx-media-csi.o
  CC      drivers/staging/media/omap4iss/iss_video.o
  AR      drivers/staging/media/sunxi/cedrus/built-in.a
  AR      drivers/staging/media/sunxi/built-in.a
  CC      drivers/staging/media/meson/vdec/vdec_hevc.o
  CC      drivers/staging/media/meson/vdec/codec_mpeg12.o
  CC      drivers/staging/media/meson/vdec/codec_h264.o
  CC      drivers/staging/media/imx/imx-media-fim.o
  CC      drivers/staging/media/imx/imx6-mipi-csi2.o
  AR      drivers/staging/media/atomisp/i2c/built-in.a
  CC      drivers/staging/media/atomisp/pci/atomisp_cmd.o
  AR      drivers/staging/media/omap4iss/built-in.a
  CC      drivers/staging/media/meson/vdec/codec_hevc_common.o
  CC      drivers/staging/media/ipu3/ipu3-mmu.o
  CC      drivers/staging/media/atomisp/pci/atomisp_compat_css20.o
  CC      drivers/staging/media/ipu3/ipu3-dmamap.o
  CC      drivers/staging/media/atomisp/pci/atomisp_csi2.o
  CC      drivers/staging/media/atomisp/pci/atomisp_drvfs.o
  CC      drivers/staging/media/atomisp/pci/atomisp_fops.o
  CC      drivers/staging/media/atomisp/pci/atomisp_ioctl.o
  CC      drivers/staging/media/imx/imx7-media-csi.o
  CC      drivers/staging/media/ipu3/ipu3-tables.o
  CC      drivers/staging/media/meson/vdec/codec_vp9.o
  CC      drivers/staging/media/atomisp/pci/atomisp_subdev.o
  CC      drivers/staging/media/imx/imx8mq-mipi-csi2.o
  CC      drivers/staging/media/atomisp/pci/atomisp_tpg.o
  CC      drivers/staging/media/ipu3/ipu3-css-pool.o
drivers/staging/media/atomisp/pci/atomisp_ioctl.c: In function ‘atomisp_streamon’:
drivers/staging/media/atomisp/pci/atomisp_ioctl.c:1714:30: error: variable ‘sink’ set but not used [-Werror=unused-but-set-variable]
 1714 |   struct v4l2_mbus_framefmt *sink;
      |                              ^~~~
cc1: all warnings being treated as errors
make[4]: *** [scripts/Makefile.build:249: drivers/staging/media/atomisp/pci/atomisp_ioctl.o] Error 1
make[4]: *** Waiting for unfinished jobs....
  CC      drivers/staging/media/ipu3/ipu3-css-fw.o
  CC      drivers/staging/media/ipu3/ipu3-css-params.o
  CC      drivers/staging/media/ipu3/ipu3-css.o
  CC      drivers/staging/media/ipu3/ipu3-v4l2.o
  CC      drivers/staging/media/ipu3/ipu3.o
  AR      drivers/staging/media/imx/built-in.a
  AR      drivers/staging/media/meson/vdec/built-in.a
  CC      drivers/staging/media/deprecated/tm6000/tm6000-cards.o
make[3]: *** [scripts/Makefile.build:465: drivers/staging/media/atomisp] Error 2
make[3]: *** Waiting for unfinished jobs....
  CC      drivers/staging/media/deprecated/tm6000/tm6000-core.o
  CC      drivers/staging/media/deprecated/fsl-viu/fsl-viu.o
  CC      drivers/staging/media/deprecated/tm6000/tm6000-i2c.o
  CC      drivers/staging/media/deprecated/tm6000/tm6000-video.o
  CC      drivers/staging/media/deprecated/tm6000/tm6000-stds.o
  CC      drivers/staging/media/deprecated/tm6000/tm6000-alsa.o
  CC      drivers/staging/media/deprecated/tm6000/tm6000-input.o
  AR      drivers/staging/media/ipu3/built-in.a
  CC      drivers/staging/media/deprecated/tm6000/tm6000-dvb.o
  AR      drivers/staging/media/deprecated/fsl-viu/built-in.a
  AR      drivers/staging/media/deprecated/tm6000/built-in.a
make[2]: *** [scripts/Makefile.build:465: drivers/staging/media] Error 2
make[1]: *** [scripts/Makefile.build:465: drivers/staging] Error 2
make: *** [Makefile:1855: drivers] Error 2
Build step 'Execute shell' marked build as failure
