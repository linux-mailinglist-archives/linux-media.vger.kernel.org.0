Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F939701699
	for <lists+linux-media@lfdr.de>; Sat, 13 May 2023 14:33:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238195AbjEMMdB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 08:33:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbjEMMdA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 08:33:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C71B22D69
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 05:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683981133;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=YsbJ7qSNvpq2XigXMR+ACHOqZQpsDFBJl45yzFLRe6o=;
        b=MeZtLPed8sSYnnqhdEuo9q8jOzvwQi/2yvkyIek3eTcO2CM8b0oyBN2gFqBgxw98BLbZRO
        l4JrcLq5wLCLw3HTk1skftd3APhM2zstoNVga0tij2twCj9kjzQWiFxsoPIQptNmI/N9U+
        6f9TCIQGKr36+maTWGpB6BJR6mrygrk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-7T8HJ010OA-1PHSzt5y4-g-1; Sat, 13 May 2023 08:32:02 -0400
X-MC-Unique: 7T8HJ010OA-1PHSzt5y4-g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96E0A380673E;
        Sat, 13 May 2023 12:32:01 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.46])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E624140C2076;
        Sat, 13 May 2023 12:31:59 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 00/30] media: atomisp: Register only 1 /dev/video# node + cleanups
Date:   Sat, 13 May 2023 14:31:29 +0200
Message-Id: <20230513123159.33234-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

Here is an atomisp patch-series to continue the simplification /
exotic feature removal of atomisp. Specifically this series
makes atomisp register only 1 /dev/video# node.

The other patches are some preparation + follow-up work for
this change, as well as a whole bunch of folow-up clean-ups.

The cleanups focus on removing the various count / users functions
which atomisp used before when there were multiple nodes. This
is preparation work for eventually allowing opening the same
node multipe-times, as is normal for standard v4l2 /dev/video#
nodes.

Regards,

Hans


Hans de Goede (30):
  media: atomisp: Remove res_overflow parameter from atomisp_try_fmt()
  media: atomisp: Remove Continuous capture and SDV run-modes
  media: atomisp: Remove isp->need_gfx_throttle field
  media: atomisp: Drop atomisp_get_css_buf_type()
  media: atomisp: Replace source-pad checks with run-mode checks
  media: atomisp: Register only 1 /dev/video# node
  media: atomisp: Drop atomisp_is_vf_pipe()
  media: atomisp: Rename video_out_preview to video_out
  media: atomisp: Remove source_pad parameter from functions and structs
  media: atomisp: Remove 1 line atomisp_flush_bufs_and_wakeup() helper
  media: atomisp: Remove atomisp_subdev_register_video_nodes() helper
  media: atomisp: Remove a bunch of unused atomisp_css_*() functions
  media: atomisp: Remove unused mipi_frame_size field from
    atomisp_[sub_]device
  media: atomisp: Remove isp_timeout flag
  media: atomisp: Remove atomisp_sensor_start_stream()
  media: atomisp: Simplify atomisp_[start|stop]_streaming()
  media: atomisp: Simplify atomisp_css_[start|stop]()
  media: atomisp: Simplify atomisp_open() and atomisp_release()
  media: atomisp: Simplify atomisp_pipe_check()
  media: atomisp: Turn asd->streaming state tracker into a bool
  media: atomisp: Remove no longer used atomisp_css_flush()
  media: atomisp: Remove atomisp_streaming_count()
  media: atomisp: Simplify atomisp_isr() and recovery_work()
  media: atomisp: Rename atomisp_destroy_pipes_stream_force() to
    atomisp_destroy_pipes_stream()
  media: atomisp: Allow system suspend to continue with open /dev/video#
    nodes
  media: atomisp: Remove atomisp_[sub]dev_users()
  media: atomisp: Remove unused css_pipe_id argument from
    atomisp_css_[start|stop]()
  media: atomisp: Remove unused atomisp_get_css_pipe_id() function
  media: atomisp: Remove in_reset argument from atomisp_css_start()
  media: atomisp: Set asd.subdev.devnode once from
    isp_subdev_init_entities()

 .../media/atomisp/include/linux/atomisp.h     |   5 +-
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 371 ++++++------------
 .../staging/media/atomisp/pci/atomisp_cmd.h   |   8 +-
 .../media/atomisp/pci/atomisp_compat.h        |  41 +-
 .../media/atomisp/pci/atomisp_compat_css20.c  | 283 ++-----------
 .../staging/media/atomisp/pci/atomisp_drvfs.c |   2 +-
 .../staging/media/atomisp/pci/atomisp_fops.c  | 176 +--------
 .../staging/media/atomisp/pci/atomisp_fops.h  |   3 -
 .../media/atomisp/pci/atomisp_internal.h      |   9 -
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 212 ++--------
 .../staging/media/atomisp/pci/atomisp_ioctl.h |   5 -
 .../media/atomisp/pci/atomisp_subdev.c        | 198 ++--------
 .../media/atomisp/pci/atomisp_subdev.h        |  30 +-
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 120 +-----
 14 files changed, 254 insertions(+), 1209 deletions(-)

-- 
2.40.1

