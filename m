Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78DF154D2E7
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 22:50:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345256AbiFOUur (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 16:50:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344041AbiFOUuq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 16:50:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9CED654FBA
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 13:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655326244;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=FUyr5N2CgvS2Z28ILcwk0UTYKxr+xY+nnqc9EbSifcU=;
        b=H37JOsy6s5SFt4hxguqH62fFoflDKeItYPbB4ShY434BegIUU/FYHivmscBcscSm/ha5nm
        g2IGFYhZ5b6GoM5Iq5wtUQTT7reGUYKDzcjlHGmiobEuZtcxzjGABgos2jlcvh19O9fWhJ
        clOS0WLsyMKrEDztRQYZds0aMl7OX98=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-NlVzS3N9N0uOBjXLm9XxLw-1; Wed, 15 Jun 2022 16:50:40 -0400
X-MC-Unique: NlVzS3N9N0uOBjXLm9XxLw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33E2985A585;
        Wed, 15 Jun 2022 20:50:40 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.27])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 98558111F5;
        Wed, 15 Jun 2022 20:50:38 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH v2 00/40] media: atomisp: Various hmm and other cleanups
Date:   Wed, 15 Jun 2022 22:49:57 +0200
Message-Id: <20220615205037.16549-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

Here is v2 of my atomisp hmm (and other) cleanups series. As mentioned
in the coverletter of v1, this is part of slowly working towards porting
the code to videobuf2 to add/fix mmap support.

v2 addresses a few small remarks from Andy and adds Andy's Reviewed-by
to all the patches, thank you Andy!

Regards,

Hans


Hans de Goede (40):
  media: atomisp: remove the unused RAW_BUF_STRIDE macro
  media: atomisp: remove unused ia_css_frame_allocate_contiguous*()
    functions
  media: atomisp: drop contiguous argument from
    ia_css_frame_allocate_with_buffer_size()
  media: atomisp: drop contiguous argument from
    frame_allocate_with_data()
  media: atomisp: drop contiguous argument from frame_create()
  media: atomisp: drop IA_CSS_FRAME_FORMAT_MIPI support from
    ia_css_frame_init_planes()
  media: atomisp: drop contiguous flag from struct ia_css_frame
  media: atomisp: drop ATOMISP_MAP_FLAG_CONTIGUOUS
  media: atomisp: remove hmm_pool_[un]register()
  media: atomisp: remove dynamic and reserved pool code
  media: atomisp: remove hmm pool code
  media: atomisp: remove hmm_mem_stats
  media: atomisp: remove pool related kernel cmdline options
  media: atomisp: remove unused attribute argument from
    ia_css_frame_map()
  media: atomisp: drop hmm_page_type
  media: atomisp: removed unused hmm_bo_get_page_info() function
  media: atomisp: remove bogus comment above hmm_bo_allocated()
    prototype
  media: atomisp: remove private acceleration ioctls
  media: atomisp: remove atomisp_acc.c
  media: atomisp: remove unused atomisp_*css_* functions
  media: atomisp: asc.acc.pipeline is always NULL
  media: atomisp: remove no longer used atomisp_css_acc_done() function
  media: atomisp: remove atomisp_is_acc_enabled()
  media: atomisp: drop unused ATOMISP_ACC_FW_LOAD_* defines
  media: atomisp: drop ATOMISP_MAP_FLAG_CLEARED
  media: atomisp: drop unused ATOMISP_MAP_FLAG_* flags
  media: atomisp: remove unused hmm address translation functions
  media: atomisp: add hmm_create_from_userdata() helper
  media: atomisp: Simplify hmm_alloc() calls
  media: atomisp: drop highmem var/arg from the hmm code
  media: atomisp: drop HMM_BO_SHARE type
  media: atomisp: remove hmm_page_object
  media: atomisp: fix __get_frame_info() error handling
  media: atomisp: add error checking to atomisp_create_pipes_stream()
  media: atomisp: add error logging to
    atomisp_destroy_pipes_stream_force()
  media: atomisp: use atomisp_create_pipes_stream() in more places
  media: atomisp: use atomisp_css_update_stream() in more places
  media: atomisp: use atomisp_destroy_pipes_stream_force() in more
    places
  media: atomisp: remove force argument from
    __destroy_[stream[s]|pipe[s]]()
  media: atomisp: Add a notes.txt file

 drivers/staging/media/atomisp/Makefile        |   3 -
 .../staging/media/atomisp/include/hmm/hmm.h   |  32 +-
 .../media/atomisp/include/hmm/hmm_bo.h        |  37 +-
 .../media/atomisp/include/hmm/hmm_common.h    |  26 -
 .../media/atomisp/include/hmm/hmm_pool.h      | 116 ----
 .../media/atomisp/include/linux/atomisp.h     | 146 ----
 drivers/staging/media/atomisp/notes.txt       |  30 +
 .../staging/media/atomisp/pci/atomisp_acc.c   | 625 ------------------
 .../staging/media/atomisp/pci/atomisp_acc.h   | 120 ----
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  33 +-
 .../media/atomisp/pci/atomisp_compat.h        |  29 +-
 .../media/atomisp/pci/atomisp_compat_css20.c  | 365 ++--------
 .../atomisp/pci/atomisp_compat_ioctl32.h      |  58 --
 .../staging/media/atomisp/pci/atomisp_drvfs.c |   7 +-
 .../staging/media/atomisp/pci/atomisp_fops.c  |  13 -
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  73 +-
 .../staging/media/atomisp/pci/atomisp_ioctl.h |   1 -
 .../media/atomisp/pci/atomisp_subdev.c        |   3 -
 .../media/atomisp/pci/atomisp_subdev.h        |  10 -
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |  32 -
 drivers/staging/media/atomisp/pci/hmm/hmm.c   | 186 +-----
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    | 261 ++------
 .../media/atomisp/pci/hmm/hmm_dynamic_pool.c  | 234 -------
 .../media/atomisp/pci/hmm/hmm_reserved_pool.c | 253 -------
 .../media/atomisp/pci/ia_css_frame_public.h   |  40 --
 .../kernels/sdis/sdis_1.0/ia_css_sdis.host.c  |   2 +-
 .../kernels/sdis/sdis_2/ia_css_sdis2.host.c   |   2 +-
 .../pci/isp/modes/interface/isp_const.h       |   6 -
 .../pci/runtime/debug/src/ia_css_debug.c      |   2 -
 .../runtime/frame/interface/ia_css_frame.h    |   7 +-
 .../atomisp/pci/runtime/frame/src/frame.c     | 105 +--
 .../pci/runtime/isp_param/src/isp_param.c     |   2 +-
 .../atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c  |   3 +-
 .../atomisp/pci/runtime/spctrl/src/spctrl.c   |   2 +-
 drivers/staging/media/atomisp/pci/sh_css.c    |   5 -
 .../media/atomisp/pci/sh_css_firmware.c       |   2 +-
 .../staging/media/atomisp/pci/sh_css_mipi.c   |   3 +-
 .../staging/media/atomisp/pci/sh_css_params.c |  47 +-
 38 files changed, 205 insertions(+), 2716 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/include/hmm/hmm_pool.h
 create mode 100644 drivers/staging/media/atomisp/notes.txt
 delete mode 100644 drivers/staging/media/atomisp/pci/atomisp_acc.c
 delete mode 100644 drivers/staging/media/atomisp/pci/atomisp_acc.h
 delete mode 100644 drivers/staging/media/atomisp/pci/hmm/hmm_dynamic_pool.c
 delete mode 100644 drivers/staging/media/atomisp/pci/hmm/hmm_reserved_pool.c

-- 
2.36.0

