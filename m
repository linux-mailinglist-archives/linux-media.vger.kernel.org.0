Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDE3D63401B
	for <lists+linux-media@lfdr.de>; Tue, 22 Nov 2022 16:24:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233200AbiKVPYR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Nov 2022 10:24:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233955AbiKVPYP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Nov 2022 10:24:15 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A24020184
        for <linux-media@vger.kernel.org>; Tue, 22 Nov 2022 07:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669130597;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=ojW41h0RdJfN52cCZflfu82DPiwzwXenRSuetwhRix8=;
        b=KVWaRlq5CNdvvK1gBT2N4qwGhV9imSEGiKVTqDHwk4SyxQ1xQiSu7DNSRMwrht9m8pNdaI
        FIXA92eQPyn/wlSquScENvMIUloigMVPXDoijsuD4v78uYKbh4Omzdtff0G69N7UeUWa0y
        wXRUAeHOXBBnMNfQT4dJ7HITOQEem9Y=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-131-0e66PLBbN_SUjDO4uIz2uw-1; Tue, 22 Nov 2022 10:23:15 -0500
X-MC-Unique: 0e66PLBbN_SUjDO4uIz2uw-1
Received: by mail-ej1-f69.google.com with SMTP id hb35-20020a170907162300b007ae6746f240so8365663ejc.12
        for <linux-media@vger.kernel.org>; Tue, 22 Nov 2022 07:23:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ojW41h0RdJfN52cCZflfu82DPiwzwXenRSuetwhRix8=;
        b=CLDdAefSfc2k/KiIQQdgNGAm6bgzV9fLSNPkFdZV6zs99uymhYM5yDzsgyV2rSoRYg
         5jBbB27orNln55vvTbUOTecm2uykfnFNxNayqWsnpkUnNUAGLCX++lP7WY6pYaga1zZr
         CVwTSVzUp/hkw5RSUqgqN3OA16mEEqpyOXSTOLh5W/JaS47EmXsKdCo1rb6gBkb+ZwNy
         0d5IBzUu16456kvU4qr8KO4ykDx80kJLVdawPvgGppGIKnLZ8K9wK5KVVLgBBZb4ROZl
         EiCZ6I0wg3zssTU9GTLw1+Vep0oUlegAVtnxDqlgJXd8dlkFKhEn0JBJct116AIZnswK
         +C6g==
X-Gm-Message-State: ANoB5pn5d84XV/GYfxqlaEf0TeaeYJoSD3b243srqCR+UY4kI5hj7v2k
        LyNftYGKJpngKO2xXugoPodHcKdRUmphHi3Rs0On+X+iF3Etn929W1c1gdq3dL+HrRFOshBn709
        eRs/uAW0WUHjfU14Jx4J9V5w=
X-Received: by 2002:a05:6402:2070:b0:467:5e4f:591 with SMTP id bd16-20020a056402207000b004675e4f0591mr7260631edb.414.1669130593228;
        Tue, 22 Nov 2022 07:23:13 -0800 (PST)
X-Google-Smtp-Source: AA0mqf53rVMHOuxZHxrhLSvtXdejQx7YllwXwfWEX7E4yGdwDlfN0tp8Bp0q0/+ULpVJAjLX0eEF+w==
X-Received: by 2002:a05:6402:2070:b0:467:5e4f:591 with SMTP id bd16-20020a056402207000b004675e4f0591mr7260617edb.414.1669130593019;
        Tue, 22 Nov 2022 07:23:13 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id lb3-20020a170907784300b007417041fb2bsm6145322ejc.116.2022.11.22.07.23.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Nov 2022 07:23:12 -0800 (PST)
Message-ID: <460fca9c-4583-724b-519b-2f5a9530415f@redhat.com>
Date:   Tue, 22 Nov 2022 16:23:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] media: atomisp: Changes for 6.2-1
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-staging@lists.linux.dev
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here are all my atomisp changes for 6.2 + 1 atomisp patch from Andy.

All these patches have been posted on the list and I have addressed
all review remarks to these patches.

Highlights:
-videobuf2 support (including working mmap support!)
-v4l2 API fixes, fixing TRY_FMT so that various pixelformats now work
-remove more dead code, dropping another 1800 lines of code
-power-management cleanup, this is preparation work for getting rid of
 the errors in dmesg on (runtime) suspend/resume

Regards,

Hans


The following changes since commit f0c4d9fc9cc9462659728d168387191387e903cc:

  Linux 6.1-rc4 (2022-11-06 15:07:11 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git tags/media-atomisp-6.2-1

for you to fetch changes up to 72b02aeb99edcf1670ee7ba6cf4aee02d4b07fdd:

  media: atomisp: Make bds_factors_list be type of struct u32_fract (2022-11-21 14:08:32 +0100)

----------------------------------------------------------------
Highlights:
-videobuf2 support (including working mmap support!)
-v4l2 API fixes, fixing TRY_FMT so that various pixelformats now work
-remove more dead code, dropping another 1800 lines of code
-power-management cleanup, this is preparation work for getting rid of
 the errors in dmesg on (runtime) suspend/resume

----------------------------------------------------------------
Andy Shevchenko (1):
      media: atomisp: Make bds_factors_list be type of struct u32_fract

Hans de Goede (37):
      media: atomisp: Add hmm_create_from_vmalloc_buf() function
      media: atomisp: Add ia_css_frame_init_from_info() function
      media: atomisp: Make atomisp_q_video_buffers_to_css() static
      media: atomisp: On streamoff wait for buffers owned by the CSS to be given back
      media: atomisp: Remove unused atomisp_buffers_queued[_pipe] functions
      media: atomisp: Also track buffers in a list when submitted to the ISP
      media: atomisp: Add an index helper variable to atomisp_buf_done()
      media: atomisp: Use new atomisp_flush_video_pipe() helper in atomisp_streamoff()
      media: atomisp: Add ia_css_frame_get_info() helper
      media: atomisp: Convert to videobuf2
      media: atomisp: Make it possible to call atomisp_set_fmt() without a file handle
      media: atomisp: Fix VIDIOC_REQBUFS failing when VIDIOC_S_FMT has not been called yet
      media: atomisp: Refactor atomisp_adjust_fmt()
      media: atomisp: Fix atomisp_try_fmt_cap() always returning YUV420 pixelformat
      media: atomisp: Make atomisp_g_fmt_cap() default to YUV420
      media: atomisp: Remove __atomisp_get_pipe() helper
      media: atomisp: gc0310: Power on sensor from set_fmt() callback
      media: atomisp: Silence: 'atomisp_q_one_s3a_buffer: drop one s3a stat which has exp_id xx' log messages
      media: atomisp: Remove accelerator pipe creation code
      media: atomisp: Remove unused QOS defines / structure member
      media: atomisp: Flush queue on atomisp_css_start() error
      media: atomisp: Log an error on failing to alloc private-mem
      media: atomisp: Fix deadlock when the /dev/video# node is closed while still streaming
      media: atomisp: Remove 2 unused accelerator mode related functions
      media: atomisp: Remove atomisp_css_yuvpp_configure_viewfinder() function
      media: atomisp: Remove unused ia_css_frame_*() functions
      media: atomisp: Drop userptr support from hmm
      media: atomisp: Remove double atomisp_mrfld_power_down()/_up() calls from atomisp_reset()
      media: atomisp: Remove atomisp_mrfld_power_down()/_up()
      media: atomisp: Remove clearing of config from atomisp_css_uninit()
      media: atomisp: Remove atomisp_css_suspend()/_resume()
      media: atomisp: Remove sw_contex.power_state checks
      media: atomisp: Remove duplication between runtime-pm and normal-pm code
      media: atomisp: Move calling of css_[un]init() to power_on()/_off()
      media: atomisp: Remove atomisp_ospm_dphy_down() call from probe error path
      media: atomisp: Remove atomisp_ospm_dphy_up()/_down() functions
      media: atomisp_ov2680: Fix 1280x720 -> 1296x736 resolution

 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c |  14 +-
 drivers/staging/media/atomisp/i2c/gc0310.h         |   1 +
 drivers/staging/media/atomisp/i2c/ov2680.h         |  46 +-
 drivers/staging/media/atomisp/include/hmm/hmm.h    |   3 +-
 drivers/staging/media/atomisp/include/hmm/hmm_bo.h |   4 +-
 drivers/staging/media/atomisp/pci/atomisp_cmd.c    | 430 ++++----------
 drivers/staging/media/atomisp/pci/atomisp_cmd.h    |  17 +-
 drivers/staging/media/atomisp/pci/atomisp_common.h |   6 +-
 drivers/staging/media/atomisp/pci/atomisp_compat.h |  14 +-
 .../media/atomisp/pci/atomisp_compat_css20.c       |  94 +--
 drivers/staging/media/atomisp/pci/atomisp_fops.c   | 535 ++++++-----------
 drivers/staging/media/atomisp/pci/atomisp_fops.h   |  13 -
 .../staging/media/atomisp/pci/atomisp_internal.h   |   1 -
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c  | 615 +++++---------------
 drivers/staging/media/atomisp/pci/atomisp_ioctl.h  |  10 +-
 drivers/staging/media/atomisp/pci/atomisp_subdev.c |   2 +
 drivers/staging/media/atomisp/pci/atomisp_subdev.h |  22 +-
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   | 104 +---
 .../camera/pipe/interface/ia_css_pipe_binarydesc.h |  13 +-
 .../camera/pipe/interface/ia_css_pipe_stagedesc.h  |   5 -
 .../atomisp/pci/camera/pipe/src/pipe_binarydesc.c  |  55 +-
 .../atomisp/pci/camera/pipe/src/pipe_stagedesc.c   |  21 -
 drivers/staging/media/atomisp/pci/hmm/hmm.c        |  20 +-
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c     |  64 +-
 .../media/atomisp/pci/ia_css_frame_public.h        | 108 ++--
 drivers/staging/media/atomisp/pci/ia_css_pipe.h    |   3 +-
 .../staging/media/atomisp/pci/ia_css_pipe_public.h |  69 ---
 .../ipu2_io_ls/bayer_io_ls/ia_css_bayer_io.host.c  |  10 +-
 .../yuv444_io_ls/ia_css_yuv444_io.host.c           |  10 +-
 .../pci/isp/kernels/ref/ref_1.0/ia_css_ref.host.c  |   2 +-
 .../pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c  |   4 +-
 .../media/atomisp/pci/runtime/binary/src/binary.c  |  42 +-
 .../atomisp/pci/runtime/debug/src/ia_css_debug.c   |  33 +-
 .../media/atomisp/pci/runtime/frame/src/frame.c    | 203 ++-----
 .../runtime/pipeline/interface/ia_css_pipeline.h   |   2 -
 .../atomisp/pci/runtime/pipeline/src/pipeline.c    |   8 -
 drivers/staging/media/atomisp/pci/sh_css.c         | 646 +--------------------
 .../staging/media/atomisp/pci/sh_css_internal.h    |  13 -
 drivers/staging/media/atomisp/pci/sh_css_legacy.h  |   1 -
 .../media/atomisp/pci/sh_css_param_shading.c       |  19 +-
 drivers/staging/media/atomisp/pci/sh_css_params.c  |  17 +-
 drivers/staging/media/atomisp/pci/sh_css_sp.c      |  54 +-
 42 files changed, 776 insertions(+), 2577 deletions(-)

