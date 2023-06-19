Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85F82734B55
	for <lists+linux-media@lfdr.de>; Mon, 19 Jun 2023 07:26:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbjFSF0D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jun 2023 01:26:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbjFSF0C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jun 2023 01:26:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 173811AA
        for <linux-media@vger.kernel.org>; Sun, 18 Jun 2023 22:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687152314;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=gQSgAqSd16TiDy+6bfDlT4CcMxczGbc1cVgP0RYa0hY=;
        b=gNoyu4wWD+CpLl16fR00OLeaO29z97mS8M4lIJMw2CoyX1TsPLhbxrpUfEhZHQuO1C1Nie
        tcs3+e9g9VY1QZAZ8WZmypHGYFI1Pvd3hVcBVMMGBGbHtZdNz9GditnFns40eqqHzwlAN2
        DyfAkNvEFYRcRBYMjVJuQLbNI5x5Av0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-308-LzgutWKSMhmiqM2lzkOmqg-1; Mon, 19 Jun 2023 01:25:10 -0400
X-MC-Unique: LzgutWKSMhmiqM2lzkOmqg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A779800193;
        Mon, 19 Jun 2023 05:25:10 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.119])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 009C283B88;
        Mon, 19 Jun 2023 05:25:05 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v3 0/3] Remove #ifdef ISP2401 and unifying sh_css_sp_group structure
Date:   Mon, 19 Jun 2023 13:24:50 +0800
Message-Id: <20230619052453.48598-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The changes in v3 include:
1. Tweaked the patch order.
2. Corrected the errors in v2.

Kate Hsuan (3):
  media: atomisp: ia_css_debug: Removed unused codes for debug
  media: atomisp: Removed unused HAS_WATCHDOG_SP_THREAD_DEBUG debug
  media: atomisp: sh_css_internal: sh_css_params: Unifying
    sh_css_sp_group data structure

 .../pci/hive_isp_css_common/debug_global.h    |   7 -
 .../media/atomisp/pci/ia_css_acc_types.h      |   6 +-
 .../runtime/debug/interface/ia_css_debug.h    |  12 --
 .../pci/runtime/debug/src/ia_css_debug.c      | 165 ------------------
 .../media/atomisp/pci/sh_css_internal.h       |  41 +----
 .../staging/media/atomisp/pci/sh_css_params.c |  41 ++++-
 6 files changed, 42 insertions(+), 230 deletions(-)

-- 
2.40.1

