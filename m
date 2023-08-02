Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACB4776C9F4
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 11:57:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231657AbjHBJ5Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 05:57:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230457AbjHBJ5Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 05:57:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2B01E64
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 02:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690970189;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=fRaj3jv/AtOHQi5OxsRX9rrfmfsF8lew/r+LRAVAKNc=;
        b=eO8AN5k7rcrL0LCXaiWKF2eEkFtUEdQAPGu9prMWL5TzYfVsViIHxTEa8q1bw3q9jiuRiR
        /Wh9NCU61s2GroD2gIl79nIzSAIobWX24eIk32RIkUeFjpTV1DsFBtouukG5BjoIMo0RlG
        ryYYHKOw4tM0HSKqxshXFWzaWzGDGfY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-AL6mPqVxOKi2KO__vdwYZA-1; Wed, 02 Aug 2023 05:56:26 -0400
X-MC-Unique: AL6mPqVxOKi2KO__vdwYZA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB906800FF1;
        Wed,  2 Aug 2023 09:56:25 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.18])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DEFC8401DA9;
        Wed,  2 Aug 2023 09:56:22 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 00/12] Make atomisp driver to be generic
Date:   Wed,  2 Aug 2023 17:55:54 +0800
Message-ID: <20230802095606.1298152-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This batch of work removed all the #ifdef and made the driver able to
drive both ISP2400 and ISP2401. The changes include:

1. #ifdef were removed and the driver execution flow is determined in
   runtime.
2. ia_css_mipi_frame_enable_check_on_size() wasn't used so it also
   removed.
3. sh_css_config_input_network() for ISP2400 and ISP2401 was determined
   in compiler time. This was also renamed to
   sh_css_config_input_network_2400() and
   sh_css_config_input_network_2401() for both types of atomisp.
4. The atomisp type test at the begining of the driver was removed so
   this driver can drive both types of atomisp.

Kate Hsuan (12):
  media: atomisp: ia_css_raw.host: Remove #ifdef ISP2401 to make the
    driver generic
  media: atomisp: binary: Removed #ifdef ISP2401 to make driver generic
  media: atomisp: hive_isp_css_include: Removed #ifdef ISP2401 to make
    driver generic
  media: atomisp: atomisp_compat_css20: Removed #ifdef ISP2401 to make
    driver generic
  media: atomisp: sh_css_mipi: Removed unused code
    ia_css_mipi_frame_enable_check_on_size()
  media: atomisp: sh_css: Removed #ifdef ISP2401 to make the driver
    generic
  media: atomisp: sh_css_sp: Remove #ifdef ISP2401 to make driver
    generic
  media: atomisp: sh_css: Removed #ifdef ISP2401 to make driver generic
  media: atomisp: sh_css: Renamed sh_css_config_input_network()
  media: atomisp: sh_css: Removed #ifdef ISP2401 to make code generic
  media: atomisp: sh_css: Removed #ifdef ISP2401 to make the driver
    generic
  media: atomisp: atomisp_v4l2: Removed unnecessary code

 .../media/atomisp/pci/atomisp_compat_css20.c  |  14 +-
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |  19 --
 .../hive_isp_css_include/host/csi_rx_public.h |   2 -
 .../host/pixelgen_public.h                    |   2 -
 .../staging/media/atomisp/pci/ia_css_mipi.h   |  16 --
 .../isp/kernels/raw/raw_1.0/ia_css_raw.host.c |  21 +-
 .../atomisp/pci/runtime/binary/src/binary.c   |  15 +-
 drivers/staging/media/atomisp/pci/sh_css.c    | 232 ++++++++----------
 .../staging/media/atomisp/pci/sh_css_mipi.c   |  29 ---
 drivers/staging/media/atomisp/pci/sh_css_sp.c |  60 ++---
 drivers/staging/media/atomisp/pci/sh_css_sp.h |   2 -
 11 files changed, 143 insertions(+), 269 deletions(-)

-- 
2.41.0

