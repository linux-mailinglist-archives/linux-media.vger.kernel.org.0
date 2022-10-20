Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E9B260692C
	for <lists+linux-media@lfdr.de>; Thu, 20 Oct 2022 21:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbiJTTzt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Oct 2022 15:55:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbiJTTzr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Oct 2022 15:55:47 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02EBAEEAAB
        for <linux-media@vger.kernel.org>; Thu, 20 Oct 2022 12:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666295745;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=6kSfRgV2BZv3Dzycdbn9g6qwtfB3Vtm5f+Ue155uRUk=;
        b=HP+ywMLXgSpo7dpxWrk9ziv5XWqyA+IQm/yJjaGAIr3BAZtTW/MO9HS32maGTxHzRT74gy
        HZu5W9pXY8E8XaHTAY4wqxIEi2VPGmV01mrPAiqgc6CGBFqsDb23Z5O7FvEtfbPeX+P+5b
        rV7Exr/C9XdQuOX8LvH1sNq3/xYCSNY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-4q5j0E4WM0OyhZbGHndtlA-1; Thu, 20 Oct 2022 15:55:41 -0400
X-MC-Unique: 4q5j0E4WM0OyhZbGHndtlA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A545F1C051A4;
        Thu, 20 Oct 2022 19:55:40 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.86])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2553940C6EC3;
        Thu, 20 Oct 2022 19:55:39 +0000 (UTC)
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
Subject: [PATCH v2 00/17] media: atomisp: Convert to videobuf2
Date:   Thu, 20 Oct 2022 21:55:16 +0200
Message-Id: <20221020195533.114049-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

Here is v2 of my patch series converting the staging atomisp driver to use
the videobuf2 framework, fixing MMAP mode not working.

New in v2 is that the "media: atomisp: Convert to videobuf2" patch
now also contains moving over to using a per vb_queue lock as is
standard for v4l2 drivers. This removes a bunch of FIXME + checkpatch
warnings (due to commented out prep for this) from v1 of this patch.
This v2 also fixes the 1 new warning pointed out by the lkp test robot.

For some more background info here are the still relevant bits of
the v1 cover-letter:

This also contains an important fix to try_fmt handling, so that
the various supported output formats can actually be used by userspace
which calls try_fmt before doing s_fmt.

So slowly this is starting to look more and more like a standard
v4l2 device (with all the complex pipeline handling hidden in the driver,
moving that to userspace seems to be impossible with this design since
multiple pipeline steps are handled by a single firmware program).

Regards,

Hans


Hans de Goede (17):
  media: atomisp: Add hmm_create_from_vmalloc_buf() function
  media: atomisp: Add ia_css_frame_init_from_info() function
  media: atomisp: Make atomisp_q_video_buffers_to_css() static
  media: atomisp: On streamoff wait for buffers owned by the CSS to be
    given back
  media: atomisp: Remove unused atomisp_buffers_queued[_pipe] functions
  media: atomisp: Also track buffers in a list when submitted to the ISP
  media: atomisp: Add an index helper variable to atomisp_buf_done()
  media: atomisp: Use new atomisp_flush_video_pipe() helper in
    atomisp_streamoff()
  media: atomisp: Add ia_css_frame_get_info() helper
  media: atomisp: Convert to videobuf2
  media: atomisp: Make it possible to call atomisp_set_fmt() without a
    file handle
  media: atomisp: Fix VIDIOC_REQBUFS failing when VIDIOC_S_FMT has not
    been called yet
  media: atomisp: Refactor atomisp_adjust_fmt()
  media: atomisp: Fix atomisp_try_fmt_cap() always returning YUV420
    pixelformat
  media: atomisp: Make atomisp_g_fmt_cap() default to YUV420
  media: atomisp: Remove __atomisp_get_pipe() helper
  media: atomisp: gc0310: Power on sensor from set_fmt() callback

 .../media/atomisp/i2c/atomisp-gc0310.c        |  14 +-
 drivers/staging/media/atomisp/i2c/gc0310.h    |   1 +
 .../staging/media/atomisp/include/hmm/hmm.h   |   2 +
 .../media/atomisp/include/hmm/hmm_bo.h        |   4 +-
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 353 ++++--------
 .../staging/media/atomisp/pci/atomisp_cmd.h   |   9 +-
 .../media/atomisp/pci/atomisp_common.h        |   6 +-
 .../media/atomisp/pci/atomisp_compat.h        |   3 +-
 .../media/atomisp/pci/atomisp_compat_css20.c  |   6 +-
 .../staging/media/atomisp/pci/atomisp_fops.c  | 528 ++++++-----------
 .../staging/media/atomisp/pci/atomisp_fops.h  |  13 -
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 536 ++++--------------
 .../staging/media/atomisp/pci/atomisp_ioctl.h |  10 +-
 .../media/atomisp/pci/atomisp_subdev.c        |   2 +
 .../media/atomisp/pci/atomisp_subdev.h        |  22 +-
 drivers/staging/media/atomisp/pci/hmm/hmm.c   |  15 +-
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    |  32 +-
 .../media/atomisp/pci/ia_css_frame_public.h   |  36 +-
 .../bayer_io_ls/ia_css_bayer_io.host.c        |  10 +-
 .../yuv444_io_ls/ia_css_yuv444_io.host.c      |  10 +-
 .../isp/kernels/ref/ref_1.0/ia_css_ref.host.c |   2 +-
 .../isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.c |   4 +-
 .../pci/runtime/debug/src/ia_css_debug.c      |  26 +-
 .../atomisp/pci/runtime/frame/src/frame.c     |  82 +--
 drivers/staging/media/atomisp/pci/sh_css.c    |  38 +-
 .../staging/media/atomisp/pci/sh_css_params.c |  17 +-
 drivers/staging/media/atomisp/pci/sh_css_sp.c |  52 +-
 27 files changed, 640 insertions(+), 1193 deletions(-)

-- 
2.37.3

