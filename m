Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B38A7147F3
	for <lists+linux-media@lfdr.de>; Mon, 29 May 2023 12:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231451AbjE2Kip (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 May 2023 06:38:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230328AbjE2Kin (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 May 2023 06:38:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 642E9C2
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 03:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685356675;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=5il0+aRaGMuXhw8xMM06nkbrd1NgMJXgNuwRSAbA+hs=;
        b=Pdr9DZLR8as7ObXSIEVPfnKvdhkuw/aY9G+xgyww5hmA5mkXgSYHTnBnDxMJ8VRE51vK2U
        MoeqWkxtXaYTCyrx06C7hBkLEy1XJGbMQG8ArktM4W4Npa29geBERBAAryDbyCon9PaQBe
        7IgWR8ixfhe3SyWsMGHah5bhZYL4K8E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-154-mvLX7VDaN3OypXEL5fRoSw-1; Mon, 29 May 2023 06:37:52 -0400
X-MC-Unique: mvLX7VDaN3OypXEL5fRoSw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C93261C06901;
        Mon, 29 May 2023 10:37:51 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.96])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2AD362166B2B;
        Mon, 29 May 2023 10:37:50 +0000 (UTC)
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
Subject: [PATCH 00/21] media: atomisp: Use selection API info to determine sensor padding
Date:   Mon, 29 May 2023 12:37:20 +0200
Message-Id: <20230529103741.11904-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

Here is my next round of atomisp work.

The atomisp wants some extra padding for processing in the data it receives
from the sensor. E.g. For 1600x1200 it wants to receive 1616x1216 from
the sensor. Currently the private sensor driver copies it uses give it
e.g. 1616x1216 and the ISP2 code then substracts 16 before reporting
the resolution to userspace.

This patch series adds support for the v4l2 selections API and specifically
the crop target so that atomisp can request the extra padding from standard
v4l2 sensor drivers. This is implemented / tested with the atomisp_ov2680
driver.

Besides that there is the usual cleanups / prep work.

With the padding solved, the last bit of private atomisp sensor API is
gone now. So we can start working on getting rid of its private sensor
driver copies.

As mentioned in the updated TODO file the next step is to port
various improvements from the atomisp_ov2680 private sensor driver
to the generic ov2680 sensor driver (such as the selections support)
and then switch to the generic ov2680 sensor driver.

Regards,

Hans


Hans de Goede (21):
  media: atomisp: Update TODO
  media: atomisp: ov2680: s/ov2680_device/ov2680_dev/
  media: atomisp: ov2680: s/input_lock/lock/
  media: atomisp: ov2680: Add missing ov2680_calc_mode() call to probe()
  media: atomisp: ov2680: Add init_cfg pad-op
  media: atomisp: ov2680: Implement selection support
  media: atomisp: Remove a bunch of sensor related custom IOCTLs
  media: atomisp: Remove redundant atomisp_subdev_set_selection() calls
    from atomisp_set_fmt()
  media: atomisp: Simplify atomisp_subdev_set_selection() calls in
    atomisp_set_fmt()
  media: atomisp: Add target validation to
    atomisp_subdev_set_selection()
  media: atomisp: Remove bogus fh use from atomisp_set_fmt*()
  media: atomisp: Add input helper variable for
    isp->asd->inputs[asd->input_curr]
  media: atomisp: Add ia_css_frame_pad_width() helper function
  media: atomisp: Refactor atomisp_try_fmt() / atomisp_set_fmt()
  media: atomisp: Add support for sensors which implement selection API
    / cropping
  media: atomisp: Pass MEDIA_BUS_FMT_* code when calling enum_frame_size
    pad-op
  media: atomisp: Make atomisp_init_sensor() check if the sensor
    supports binning
  media: atomisp: Use selection API info to determine sensor padding
  media: atomisp: Set crop before setting fmt
  media: atomisp: Add enum_framesizes function for sensors with
    selection / crop support
  media: atomisp: csi2-bridge: Set PMC clk-rate for sensors to 19.2 MHz

 drivers/staging/media/atomisp/TODO            | 233 ++-----
 .../media/atomisp/i2c/atomisp-ov2680.c        | 204 +++++-
 drivers/staging/media/atomisp/i2c/ov2680.h    |  20 +-
 .../media/atomisp/i2c/ov5693/atomisp-ov5693.c |  40 --
 .../media/atomisp/include/linux/atomisp.h     | 120 ----
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 612 ++++++------------
 .../staging/media/atomisp/pci/atomisp_cmd.h   |  14 +-
 .../atomisp/pci/atomisp_compat_ioctl32.h      |  55 --
 .../media/atomisp/pci/atomisp_csi2_bridge.c   |  68 +-
 .../media/atomisp/pci/atomisp_internal.h      |   9 +
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 174 +++--
 .../media/atomisp/pci/atomisp_subdev.c        |  18 +-
 .../media/atomisp/pci/atomisp_subdev.h        |   3 +
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |  85 +++
 .../runtime/frame/interface/ia_css_frame.h    |   2 +
 .../atomisp/pci/runtime/frame/src/frame.c     |  44 +-
 16 files changed, 685 insertions(+), 1016 deletions(-)

-- 
2.40.1

