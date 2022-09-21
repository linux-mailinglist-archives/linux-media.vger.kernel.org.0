Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AECF5BFDA3
	for <lists+linux-media@lfdr.de>; Wed, 21 Sep 2022 14:18:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbiIUMSS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Sep 2022 08:18:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbiIUMSP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Sep 2022 08:18:15 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A228979D5
        for <linux-media@vger.kernel.org>; Wed, 21 Sep 2022 05:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663762692;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=h5UHltYGd5JjVyUQOy1D8w2tyX9wje2dqNCgNznShVE=;
        b=gaXwJvda9DDod/qf38oOvgJKFWUCuy7UzR0qXOx4GUkgfsgQIhrSasHIw1/TWkgMf1wcwy
        hvO4Xr7tiEX+G7mg174IA8P3M84ujZic7Pwog6OJnUnEsu76+FPA5CxyOuE6SZWuirOy8V
        TZHHDCFJaIzk/z27qSRZ/Rkj5t50Z30=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-553-ol8fgioHNuO0reCuj5De_w-1; Wed, 21 Sep 2022 08:18:11 -0400
X-MC-Unique: ol8fgioHNuO0reCuj5De_w-1
Received: by mail-ed1-f72.google.com with SMTP id x5-20020a05640226c500b00451ec193793so4283587edd.16
        for <linux-media@vger.kernel.org>; Wed, 21 Sep 2022 05:18:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date;
        bh=h5UHltYGd5JjVyUQOy1D8w2tyX9wje2dqNCgNznShVE=;
        b=sae7418XIzKPpdXeEw7pY4nZDDUYs4OSWxN2rcI3Y0D5yHpTNDy5+2LUketjJXC4rS
         g4BRX7ZjibmoRsn80j1wqDBbNo01vr4EYdICASMJNgDV/1sW4eRliJaOFCSRvT6nF2Oq
         vNxzwfPeh2EaRHz0eYfBQLogfSOStpMAL6xOM8yLX17x+iby5EDuAN/vRxPUQ1cdOBRX
         eLJA4X7OLzbYszub7eyks7JEDDkun8j75BEDh+XkdtJIJ1RlL7d2Jf2hNBF3iHmMAz1V
         kFGENeZPrIfoZ2DyPbCY2XQQDFRfclrk9fHK2DjaccUviVJQu4OF2i1WKqlZWeZmpQQH
         4Jag==
X-Gm-Message-State: ACrzQf2WwTSkQiQtDErEb0fc+JbsNGtrjPPgt5sfGMCtyt2x9XC3BTz7
        +BGR2YiPv0e1Ptu8Cwk2ZvyVNQxRGGh/7zstDCavmN/eEll9DCdojp7E1D976b131Rpx8OVNxWM
        tRDEy/K8009YubyB34DX2Neg=
X-Received: by 2002:a05:6402:50ca:b0:451:a711:1389 with SMTP id h10-20020a05640250ca00b00451a7111389mr24070690edb.239.1663762689956;
        Wed, 21 Sep 2022 05:18:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM554kanQ+wsWfRcLAPQ+XpFTBlUzPfdqNVT8vSj1+b0FrCsCw8s2ae+s3QK/KrfHySPiiXupA==
X-Received: by 2002:a05:6402:50ca:b0:451:a711:1389 with SMTP id h10-20020a05640250ca00b00451a7111389mr24070673edb.239.1663762689693;
        Wed, 21 Sep 2022 05:18:09 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id u17-20020a1709061db100b0074a82932e3bsm1227205ejh.77.2022.09.21.05.18.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 05:18:09 -0700 (PDT)
Message-ID: <b4337cdf-c52b-d696-cc7c-e3923589ce4c@redhat.com>
Date:   Wed, 21 Sep 2022 14:18:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-US
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-staging@lists.linux.dev
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] media: atomisp: Changes for 6.1-1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

As discussed here are all my atomisp changes for 6.1 + 3 atomisp
patches from others as a pull-req.

All these patches have been posted on the list and I have addressed
all review remarks to these patches.

Highlights:
-Fix VIDIOC_TRY_FMT so that it actually works
-hmm[_bo] cleanups (videobuf2 conversion prep)
-locking cleanups (videobuf2 conversion prep)
-remove software watchdog implementation
-lots of other cleanups
-in total this removes over 2000 lines of code

Regards,

Hans

p.s.
This pull-req is for a signed tag, if you don't have my public key
yet you can find it here:
https://git.kernel.org/pub/scm/docs/kernel/pgpkeys.git/tree/keys/7C31E21A98D21E0D.asc


The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git tags/media-atomisp-6.1-1

for you to fetch changes up to 537715a44f042f8d93a1554c87b9a05d377cd7f2:

  media: atomisp_gmin_platform: Unexport and split camera_sensor_csi() (2022-09-21 11:14:05 +0200)

----------------------------------------------------------------
media: atomisp: Changes for 6.1-1

Highlights:
-hmm[_bo] cleanups (videobuf2 conversion prep)
-locking cleanups (videobuf2 conversion prep)
-remove software watchdog implementation
-lots of other cleanups
-in total this removes over 2000 lines of code

----------------------------------------------------------------
Andy Shevchenko (2):
      media: atomisp_gmin_platform: Switch to use acpi_evaluate_dsm_typed()
      media: atomisp_gmin_platform: Unexport and split camera_sensor_csi()

Dan Carpenter (1):
      media: atomisp: prevent integer overflow in sh_css_set_black_frame()

Hans de Goede (41):
      media: atomisp-ov2680: Fix ov2680_set_fmt()
      media: atomisp-ov2680: Don't take the input_lock for try_fmt calls.
      media: atomisp-ov2680: Improve ov2680_set_fmt() error handling
      media: atomisp-notes: Add info about sensors v4l2_get_subdev_hostdata() use
      media: atomisp: Fix VIDIOC_TRY_FMT
      media: atomisp: Make atomisp_try_fmt_cap() take padding into account
      media: atomisp: hmm_bo: Simplify alloc_private_pages()
      media: atomisp: hmm_bo: Further simplify alloc_private_pages()
      media: atomisp: hmm_bo: Rewrite alloc_private_pages() using pages_array helper funcs
      media: atomisp: hmm_bo: Rewrite free_private_pages() using pages_array helper funcs
      media: atomisp: hmm_bo: Drop PFN code path from alloc_user_pages()
      media: atomisp: Ensure that USERPTR pointers are page aligned
      media: atomisp: Fix device_caps reporting of the registered video-devs
      media: atomisp: Remove file-injection support
      media: atomisp: Remove atomisp_file_fops and atomisp_file_ioctl_ops
      media: atomisp: Remove the outq videobuf queue
      media: atomisp: Remove never set file_input flag
      media: atomisp: Remove the ACC device node
      media: atomisp: Remove some further ATOMISP_ACC_* related dead code
      media: atomisp: Remove empty atomisp_css_set_cont_prev_start_time() function
      media: atomisp: Split subdev and video-node registration into 2 steps
      media: atomisp: Register /dev/* nodes at the end of atomisp_pci_probe()
      media: atomisp: Remove loading mutex
      media: atomisp: Fix v4l2_fh resource leak on open errors
      media: atomisp: Simplify v4l2_fh_open() error handling
      media: atomisp: Use a normal mutex for the main lock
      media: atomisp: Remove unused lock member from struct atomisp_sub_device
      media: atomisp: Fix locking around asd->streaming read/write
      media: atomisp: Remove asd == NULL checks from ioctl handling
      media: atomisp: Add atomisp_pipe_check() helper
      media: atomisp: Remove watchdog timer
      media: atomisp: Move atomisp_streaming_count() check into __atomisp_css_recover()
      media: atomisp: Rework asd->streaming state update in __atomisp_streamoff()
      media: atomisp: Drop streamoff_mutex
      media: atomisp: Use video_dev.lock for ioctl locking
      media: atomisp: Remove a couple of not useful function wrappers
      media: atomisp: Drop unnecessary first_streamoff check
      media: atomisp: Make atomisp_set_raw_buffer_bitmap() static
      media: atomisp: Remove unused atomisp_css_get_dis_statistics()
      media: atomisp: Remove const/fixed camera_caps
      media: atomisp: Remove atomisp_source_pad_to_stream_id()

 drivers/staging/media/atomisp/Makefile             |   1 -
 drivers/staging/media/atomisp/i2c/atomisp-ov2680.c |  19 +-
 drivers/staging/media/atomisp/include/hmm/hmm_bo.h |   6 -
 .../staging/media/atomisp/include/linux/atomisp.h  |  14 -
 .../atomisp/include/linux/atomisp_gmin_platform.h  |   2 -
 .../media/atomisp/include/linux/atomisp_platform.h |  18 -
 drivers/staging/media/atomisp/notes.txt            |  19 +
 drivers/staging/media/atomisp/pci/atomisp_cmd.c    | 715 ++-----------------
 drivers/staging/media/atomisp/pci/atomisp_cmd.h    |  11 +-
 drivers/staging/media/atomisp/pci/atomisp_compat.h |  10 -
 .../media/atomisp/pci/atomisp_compat_css20.c       | 100 +--
 drivers/staging/media/atomisp/pci/atomisp_file.c   | 229 ------
 drivers/staging/media/atomisp/pci/atomisp_file.h   |  44 --
 drivers/staging/media/atomisp/pci/atomisp_fops.c   | 274 ++------
 .../media/atomisp/pci/atomisp_gmin_platform.c      |  94 ++-
 .../staging/media/atomisp/pci/atomisp_internal.h   |  55 +-
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c  | 768 ++++-----------------
 drivers/staging/media/atomisp/pci/atomisp_ioctl.h  |  14 +-
 drivers/staging/media/atomisp/pci/atomisp_subdev.c | 133 +---
 drivers/staging/media/atomisp/pci/atomisp_subdev.h |  71 +-
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   | 164 +----
 drivers/staging/media/atomisp/pci/atomisp_v4l2.h   |   3 -
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c     | 198 +-----
 drivers/staging/media/atomisp/pci/sh_css_params.c  |   4 +-
 24 files changed, 445 insertions(+), 2521 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/atomisp_file.c
 delete mode 100644 drivers/staging/media/atomisp/pci/atomisp_file.h

