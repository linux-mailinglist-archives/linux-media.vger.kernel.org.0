Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4688D69E2D8
	for <lists+linux-media@lfdr.de>; Tue, 21 Feb 2023 16:00:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233890AbjBUPAG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Feb 2023 10:00:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233570AbjBUPAD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Feb 2023 10:00:03 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C4016A40
        for <linux-media@vger.kernel.org>; Tue, 21 Feb 2023 06:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676991557;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=dOc5CS2FubCLAxDHAY8q6RFc+VJ5S708OlrKD5xOGSc=;
        b=Kdyfo5Xxl9nC5JxyuR3mXa7dp2pN6RW9BiY1TB0gFOWle9aClG3Oz7MYj94P/3SYk71KWP
        0C3taAznDOKnjCnzsZmyqVLLR0f9R+YP9/vxOjxGeymZwREe7UV5zjqS9xAhELd+rIeVAP
        Ef7VeNQeMGjyPgbjoRTdu0ZeFEzSByw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-512-KgftFsNjNmuh90wob39Ejw-1; Tue, 21 Feb 2023 09:59:12 -0500
X-MC-Unique: KgftFsNjNmuh90wob39Ejw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E14785A588;
        Tue, 21 Feb 2023 14:59:11 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.195.177])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6037B2026D4B;
        Tue, 21 Feb 2023 14:59:08 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 00/10] media: atomisp: Remove depth-mode and continuous mode support
Date:   Tue, 21 Feb 2023 15:58:56 +0100
Message-Id: <20230221145906.8113-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

This is the first step of the removal of special/obscure features
discussed here:

https://lore.kernel.org/linux-media/ea81b17b-7d1f-a5e1-11dd-04db310e1e50@redhat.com/

Plus some follow-up patches removing some dead code (some new dead
code as well as some pre-existing dead code).

Regards,

Hans


Hans de Goede (10):
  media: atomisp: Remove depth-mode support
  media: atomisp: Remove continuous mode support
  media: atomisp: Remove delayed_init related code
  media: atomisp: Remove crop_needs_override from atomisp_set_fmt()
  media: atomisp: Remove atomisp_css_enable_raw_binning()
  media: atomisp: Remove atomisp_get_metadata_type()
  media: atomisp: Remove unused SOC_CAMERA, XENON_FLASH and FILE_INPUT
    subdev types
  media: atomisp: Remove ATOMISP_USE_YUVPP()
  media: atomisp: Remove yuvpp_mode
  media: atomisp: Remove online_process setting

 .../media/atomisp/include/linux/atomisp.h     |  26 -
 .../atomisp/include/linux/atomisp_platform.h  |   9 +-
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 744 ++----------------
 .../staging/media/atomisp/pci/atomisp_cmd.h   |   9 -
 .../media/atomisp/pci/atomisp_compat.h        |   7 -
 .../media/atomisp/pci/atomisp_compat_css20.c  | 321 +-------
 .../staging/media/atomisp/pci/atomisp_fops.c  | 110 +--
 .../media/atomisp/pci/atomisp_internal.h      |  21 -
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 162 +---
 .../staging/media/atomisp/pci/atomisp_ioctl.h |   3 -
 .../media/atomisp/pci/atomisp_subdev.c        |  78 +-
 .../media/atomisp/pci/atomisp_subdev.h        |  16 -
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |  35 +-
 13 files changed, 129 insertions(+), 1412 deletions(-)

-- 
2.39.1

