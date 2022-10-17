Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1C1A600930
	for <lists+linux-media@lfdr.de>; Mon, 17 Oct 2022 10:52:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230365AbiJQIwN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Oct 2022 04:52:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbiJQIvz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Oct 2022 04:51:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 267015073E
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 01:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665996666;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=FjYHEebma8UYIFvq1Yz9+6YiyBVirhL+oeP6HjonLqk=;
        b=Z7OPnbPjkpTV9PldQSqsj1wFqkytcr6irwLqSb+c56X5RdH1QkYz9cwMOr2ZpE8AAEyLJC
        m2oU2QECv0t/kvE72ng5TnhNHlheaB0OkVQRnuJ0X4VFpMRpyyPGDCYY/FsSGTGZi/5B3C
        +UbCJyLmcQMDK+Xk5lRblmh8v6R+Pv8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-NsTFl27aP5243UdZdk9oPQ-1; Mon, 17 Oct 2022 04:51:02 -0400
X-MC-Unique: NsTFl27aP5243UdZdk9oPQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A299186E91C;
        Mon, 17 Oct 2022 08:51:01 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.44])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3273A10A58CE;
        Mon, 17 Oct 2022 08:50:59 +0000 (UTC)
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
Subject: [PATCH 00/17] media: atomisp: Convert to videobuf2
Date:   Mon, 17 Oct 2022 10:50:40 +0200
Message-Id: <20221017085057.7483-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

This patch series converts the staging atomisp driver to use the videobuf2
framework, fixing MMP mode now working.

This also contains an important fix to try_fmt handling, so that
the various supported output formats can actually be used by userspace
which calls try_fmt before doing s_fmt.

One thing missing from this conversion is moving over to using a per queue
mutex. After getting the basic videobuf2 conversion in place I first needed
to do a bunch of other fixes (like the try_fmt one) to make camorama work
again, so I ran out of time this weekend.

There is a bunch of preparation in the form of commented
out code + FIXME comments in "media: atomisp: Convert to videobuf2"
this causes a bunch of checkpatch warnings. Moving to a per queue
mutex is my next planned patch (series?).

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
 .../staging/media/atomisp/pci/atomisp_fops.c  | 521 ++++++-----------
 .../staging/media/atomisp/pci/atomisp_fops.h  |  13 -
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 543 ++++--------------
 .../staging/media/atomisp/pci/atomisp_ioctl.h |  10 +-
 .../media/atomisp/pci/atomisp_subdev.c        |   1 +
 .../media/atomisp/pci/atomisp_subdev.h        |  20 +-
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
 27 files changed, 643 insertions(+), 1187 deletions(-)

-- 
2.37.3

