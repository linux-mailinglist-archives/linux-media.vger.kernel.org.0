Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8AE572B7D6
	for <lists+linux-media@lfdr.de>; Mon, 12 Jun 2023 07:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234013AbjFLF6Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jun 2023 01:58:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231485AbjFLF6Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jun 2023 01:58:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9621DE67
        for <linux-media@vger.kernel.org>; Sun, 11 Jun 2023 22:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686549459;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=TFqzGpv584zUtcEatY8I7u9eGb/Y9WKhH3NALOezmT8=;
        b=QbRfVh/sw0RNjz165DGntJTXv0YbA95pKnhNtcIRPwxbY/BmHzmHfWNnWgOfElg4BWQQJN
        DWqgpqMpEVd0gJj/wv6cDciNZa7VrTSUvEIqlzxu9KVG6o+9Ryk4YxjDBftdfh/HIyDv/O
        vkj7yIw0oB5OFeGxxoZayG0z8osmpE0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-_gWViJQSNku59SULBPet6A-1; Mon, 12 Jun 2023 01:57:35 -0400
X-MC-Unique: _gWViJQSNku59SULBPet6A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 170A68027F5;
        Mon, 12 Jun 2023 05:57:35 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.34])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E3EB01121314;
        Mon, 12 Jun 2023 05:57:31 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v2 0/3] Remove #ifdef ISP2401 and unifying sh_css_sp_group structure
Date:   Mon, 12 Jun 2023 13:57:15 +0800
Message-Id: <20230612055718.453554-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The changes in v2 include:
1. Squashed patches #1 and #3 to resolve the build issue.
2. Introduced a new patch to remove the unused debug codes and variables.
3. Added a NULL pointer check for memory allocation failure.
4. Fixed the memory offset when copying the configuration to the buffer.

Kate Hsuan (3):
  media: atomisp: sh_css_internal: Unifying sh_css_sp_group to remove
    #ifdef ISP2401
  media: atomisp: ia_css_debug: remove unused
    HAS_WATCHDOG_SP_THREAD_DEBUG codes
  atomisp: sh_css_params: write the sp_group config according to the ISP
    model

 .../pci/hive_isp_css_common/debug_global.h    |   7 -
 .../media/atomisp/pci/ia_css_acc_types.h      |   6 +-
 .../runtime/debug/interface/ia_css_debug.h    |  12 --
 .../pci/runtime/debug/src/ia_css_debug.c      | 165 ------------------
 .../media/atomisp/pci/sh_css_internal.h       |  41 +----
 .../staging/media/atomisp/pci/sh_css_params.c |  41 ++++-
 6 files changed, 42 insertions(+), 230 deletions(-)

-- 
2.40.1

