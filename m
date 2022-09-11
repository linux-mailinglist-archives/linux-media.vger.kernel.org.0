Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35A955B5025
	for <lists+linux-media@lfdr.de>; Sun, 11 Sep 2022 19:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbiIKRRH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Sep 2022 13:17:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbiIKRRF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Sep 2022 13:17:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ADF32610F
        for <linux-media@vger.kernel.org>; Sun, 11 Sep 2022 10:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662916623;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=VVwyhfHpPOJ9wjYK3HtXvIRDA3wFzIZ7xyvjh/lTqOc=;
        b=jVXBz519Mp83pBZUmZD3PmKflIt0BRzV3VaN6pHCXh7WN3yKP4rBQbfzIN60tqGvgukrfQ
        iFILXwHuWG+LiMyIi4R5bLbi7SW1rHqgID3zialXdonz2Ccynskp3EBbNa/C+eHPymQoEt
        hWPX86/Vsjk1kZV+dg5VTb/0aD+QV80=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-f-xo41jKN4GoVzjlSGkuAw-1; Sun, 11 Sep 2022 13:16:58 -0400
X-MC-Unique: f-xo41jKN4GoVzjlSGkuAw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 907A81C05156;
        Sun, 11 Sep 2022 17:16:57 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.10])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C713C492C3B;
        Sun, 11 Sep 2022 17:16:55 +0000 (UTC)
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
Subject: [PATCH 00/17] media: atomisp: further cleanups / unwanted code removal
Date:   Sun, 11 Sep 2022 19:16:36 +0200
Message-Id: <20220911171653.568932-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

Here is another atomisp patch-series with further cleanups / unwanted code
removal. Note this mostly cleaning up things which I hit while I'm still
working towards converting the driver to videobuf2.

The main goal of this series was to make the atomisp locking more like
that of other v4l2 drivers, which is acomplished in the
"media: atomisp: Use video_dev.lock for ioctl locking" patch.

Regards,

Hans


Andy Shevchenko (1):
  media: atomisp_gmin_platform: Unexport and split camera_sensor_csi()

Hans de Goede (16):
  media: atomisp: Use a normal mutex for the main lock
  media: atomisp: Remove unused lock member from struct
    atomisp_sub_device
  media: atomisp: Fix locking around asd->streaming read/write
  media: atomisp: Remove asd == NULL checks from ioctl handling
  media: atomisp: Add atomisp_pipe_check() helper
  media: atomisp: Remove watchdog timer
  media: atomisp: Move atomisp_streaming_count() check into
    __atomisp_css_recover()
  media: atomisp: Rework asd->streaming state update in
    __atomisp_streamoff()
  media: atomisp: Drop streamoff_mutex
  media: atomisp: Use video_dev.lock for ioctl locking
  media: atomisp: Remove a couple of not useful function wrappers
  media: atomisp: Drop unnecessary first_streamoff check
  media: atomisp: Make atomisp_set_raw_buffer_bitmap() static
  media: atomisp: Remove unused atomisp_css_get_dis_statistics()
  media: atomisp: Remove const/fixed camera_caps
  media: atomisp: Remove atomisp_source_pad_to_stream_id()

 .../include/linux/atomisp_gmin_platform.h     |   2 -
 .../atomisp/include/linux/atomisp_platform.h  |  18 -
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 581 ++----------------
 .../staging/media/atomisp/pci/atomisp_cmd.h   |   9 +-
 .../media/atomisp/pci/atomisp_compat.h        |   4 -
 .../media/atomisp/pci/atomisp_compat_css20.c  |  74 +--
 .../staging/media/atomisp/pci/atomisp_fops.c  |  87 +--
 .../media/atomisp/pci/atomisp_gmin_platform.c |  86 ++-
 .../media/atomisp/pci/atomisp_internal.h      |  39 +-
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 567 ++++-------------
 .../staging/media/atomisp/pci/atomisp_ioctl.h |  10 +-
 .../media/atomisp/pci/atomisp_subdev.c        |  34 +-
 .../media/atomisp/pci/atomisp_subdev.h        |  24 +-
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |  65 +-
 14 files changed, 267 insertions(+), 1333 deletions(-)

-- 
2.37.3

