Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A19AA6EDD25
	for <lists+linux-media@lfdr.de>; Tue, 25 Apr 2023 09:49:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231189AbjDYHtx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Apr 2023 03:49:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233082AbjDYHtv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Apr 2023 03:49:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D6B630CD
        for <linux-media@vger.kernel.org>; Tue, 25 Apr 2023 00:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682408948;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=5RHO07m1f9W2RKPCP1klHGEZU5kaUC4LlrOjGSFX8WQ=;
        b=A2EZpHWyA02s0f+YY9FybUTpam40l+1IdA9GINAqkgzkniVbm9RjPuRKvQpIqNZopW2nW/
        mGQiT4ExD+GkOwUPe61liwotrbqEdSVy73CFeRpgwRP3fUMd1BGJ4AuSWAxpN0k4bxKgiQ
        CrsXkLI01vcco5MTZI5nvcw0ZkuO0p8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-283-GVLX56wXOSmNYAQtP5_adQ-1; Tue, 25 Apr 2023 03:49:06 -0400
X-MC-Unique: GVLX56wXOSmNYAQtP5_adQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 616A71C07587;
        Tue, 25 Apr 2023 07:49:06 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.153])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 56A07140263F;
        Tue, 25 Apr 2023 07:49:02 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 0/5] staging: media: atomisp: Remove #ifdef 2401
Date:   Tue, 25 Apr 2023 15:48:36 +0800
Message-Id: <20230425074841.29063-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since #ifdef ISP2401 is used to determine the action of both models in compiler
time, we have to provide two binaries for both models. It is very unfriendly for
the users and for the package management aspect.

The proposed patch removed the #ifdef ISP2041 from the codes and made the 
path for both models can be determined at the runtime. Some of the #ifdef is 
highly integrated with functions and data structures. If we try to remove 
them, it will cause many issues, such as duplicated variable/function name
and data length. Therefore, these patches focus on removing the #ifdef
without affecting the change of structure.

Kate Hsuan (5):
  staging: media: atomisp: sh_css: Remove #ifdef ISP2401
  staging: media: atomisp: runtime: frame: remove #ifdef ISP2401
  staging: media: atomisp: sh_css_sp: Remove #ifdef ISP2401
  staging: media: atomisp: sh_css_firmware: determine firmware version
    at runtime
  staging: media: atomisp: sh_css_mipi: Remove #ifdef 2041

 .../atomisp/pci/runtime/frame/src/frame.c     |  15 +-
 drivers/staging/media/atomisp/pci/sh_css.c    | 584 +++++++++---------
 .../media/atomisp/pci/sh_css_firmware.c       |  18 +-
 .../staging/media/atomisp/pci/sh_css_mipi.c   | 101 ++-
 drivers/staging/media/atomisp/pci/sh_css_sp.c |  10 +-
 5 files changed, 359 insertions(+), 369 deletions(-)

-- 
2.39.2

