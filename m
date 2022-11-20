Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD70B6316E5
	for <lists+linux-media@lfdr.de>; Sun, 20 Nov 2022 23:42:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbiKTWmQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Nov 2022 17:42:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbiKTWmM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Nov 2022 17:42:12 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFBD023391
        for <linux-media@vger.kernel.org>; Sun, 20 Nov 2022 14:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668984076;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=zWsY7me8MOS3sBsygckucgqj2kMsgqocuMeL0iSzpMw=;
        b=cxHRUSy7zDUWOapNWZvf3GpllWhlOroQEiqY/sN+Wv7owE2rYd3Y/MFj/QVtKTBL0+9J+F
        4UvapWqQSGs+f4EK6g35PV/s3I/6T2F/7IvOYNj4O13nlGr5PM8qkoe7WA1MKBch3VBGgt
        wkWN/e0U2di7UCxCzVIJ8ZTgS/i/Qlw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18-zp8cT3ldNM2KrzjBFAXmMw-1; Sun, 20 Nov 2022 17:41:10 -0500
X-MC-Unique: zp8cT3ldNM2KrzjBFAXmMw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 312C5185A794;
        Sun, 20 Nov 2022 22:41:10 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.70])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9D95047505E;
        Sun, 20 Nov 2022 22:41:08 +0000 (UTC)
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
Subject: [PATCH 00/20] media: atomisp: Misc. cleanups / fixes
Date:   Sun, 20 Nov 2022 23:40:41 +0100
Message-Id: <20221120224101.746199-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

Here is another round of atomisp cleanups / fixes + preparation work
for getting rid of the ugly PCI power-management errors in dmesg
when doing (runtime)suspend/resume.

Regards,

Hans


Hans de Goede (20):
  media: atomisp: Silence: 'atomisp_q_one_s3a_buffer: drop one s3a stat
    which has exp_id xx' log messages
  media: atomisp: Remove accelerator pipe creation code
  media: atomisp: Remove unused QOS defines / structure member
  media: atomisp: Flush queue on atomisp_css_start() error
  media: atomisp: Log an error on failing to alloc private-mem
  media: atomisp: Fix deadlock when the /dev/video# node is closed while
    still streaming
  media: atomisp: Remove 2 unused accelerator mode related functions
  media: atomisp: Remove atomisp_css_yuvpp_configure_viewfinder()
    function
  media: atomisp: Remove unused ia_css_frame_*() functions
  media: atomisp: Drop userptr support from hmm
  media: atomisp: Remove double atomisp_mrfld_power_down()/_up() calls
    from atomisp_reset()
  media: atomisp: Remove atomisp_mrfld_power_down()/_up()
  media: atomisp: Remove clearing of config from atomisp_css_uninit()
  media: atomisp: Remove atomisp_css_suspend()/_resume()
  media: atomisp: Remove sw_contex.power_state checks
  media: atomisp: Remove duplication between runtime-pm and normal-pm
    code
  media: atomisp: Move calling of css_[un]init() to power_on()/_off()
  media: atomisp: Remove atomisp_ospm_dphy_down() call from probe error
    path
  media: atomisp: Remove atomisp_ospm_dphy_up()/_down() functions
  media: atomisp_ov2680: Fix 1280x720 -> 1296x736 resolution

 drivers/staging/media/atomisp/i2c/ov2680.h    |  46 +-
 .../staging/media/atomisp/include/hmm/hmm.h   |   1 -
 .../media/atomisp/include/hmm/hmm_bo.h        |   2 -
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  76 +--
 .../staging/media/atomisp/pci/atomisp_cmd.h   |   8 +-
 .../media/atomisp/pci/atomisp_compat.h        |  11 -
 .../media/atomisp/pci/atomisp_compat_css20.c  |  88 +--
 .../staging/media/atomisp/pci/atomisp_fops.c  |  34 +-
 .../media/atomisp/pci/atomisp_internal.h      |   1 -
 .../staging/media/atomisp/pci/atomisp_ioctl.c |  80 ++-
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 104 +--
 .../pipe/interface/ia_css_pipe_stagedesc.h    |   5 -
 .../pci/camera/pipe/src/pipe_stagedesc.c      |  21 -
 drivers/staging/media/atomisp/pci/hmm/hmm.c   |  19 +-
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    |  54 +-
 .../media/atomisp/pci/ia_css_frame_public.h   |  74 ---
 .../staging/media/atomisp/pci/ia_css_pipe.h   |   3 +-
 .../media/atomisp/pci/ia_css_pipe_public.h    |  69 --
 .../pci/runtime/debug/src/ia_css_debug.c      |   7 -
 .../atomisp/pci/runtime/frame/src/frame.c     | 121 ----
 .../pipeline/interface/ia_css_pipeline.h      |   2 -
 .../pci/runtime/pipeline/src/pipeline.c       |   8 -
 drivers/staging/media/atomisp/pci/sh_css.c    | 608 +-----------------
 .../media/atomisp/pci/sh_css_internal.h       |  13 -
 .../staging/media/atomisp/pci/sh_css_legacy.h |   1 -
 drivers/staging/media/atomisp/pci/sh_css_sp.c |   2 +-
 26 files changed, 121 insertions(+), 1337 deletions(-)

-- 
2.38.1

