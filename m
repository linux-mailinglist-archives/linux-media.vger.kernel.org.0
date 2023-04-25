Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 105AD6EDD2E
	for <lists+linux-media@lfdr.de>; Tue, 25 Apr 2023 09:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233341AbjDYHuU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Apr 2023 03:50:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233311AbjDYHuP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Apr 2023 03:50:15 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A66F495
        for <linux-media@vger.kernel.org>; Tue, 25 Apr 2023 00:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682408968;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gOJcr7Qsfj+7Fsru7Co8WtERENCAjTf9OL1IbvxGJ3M=;
        b=fmqmi7ZMHM/FJUSlw5Cdlf1Fq0HAZZWnP2TqMyWxE/PA1d11IOkztZcchdzdxIw964fR6O
        DyCPQR+S7BER8JeKU8jIOUDk5DmQ8kq/PxUS+y5Se+7ol7vXW2T1AupjVsJ6RTMyBz2x3X
        nREQVlg8Er7dyixcfQlDyY7itspfdW0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-IPifzD0JPkWqNVoP7AQJxQ-1; Tue, 25 Apr 2023 03:49:24 -0400
X-MC-Unique: IPifzD0JPkWqNVoP7AQJxQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B2B83814955;
        Tue, 25 Apr 2023 07:49:24 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.153])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4AB3914171B8;
        Tue, 25 Apr 2023 07:49:20 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 3/5] staging: media: atomisp: sh_css_sp: Remove #ifdef ISP2401
Date:   Tue, 25 Apr 2023 15:48:39 +0800
Message-Id: <20230425074841.29063-4-hpa@redhat.com>
In-Reply-To: <20230425074841.29063-1-hpa@redhat.com>
References: <20230425074841.29063-1-hpa@redhat.com>
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

The actions of ISP2401 and 2400 will be determined at the runtime.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/staging/media/atomisp/pci/sh_css_sp.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index 0dd58a7fe2cc..297e1b981720 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -952,12 +952,10 @@ sh_css_sp_init_stage(struct ia_css_binary *binary,
 		return 0;
 	}
 
-#if defined(ISP2401)
-	(void)continuous;
-	sh_css_sp_stage.deinterleaved = 0;
-#else
-	sh_css_sp_stage.deinterleaved = ((stage == 0) && continuous);
-#endif
+	if (IS_ISP2401)
+		sh_css_sp_stage.deinterleaved = 0;
+	else
+		sh_css_sp_stage.deinterleaved = ((stage == 0) && continuous);
 
 	initialize_stage_frames(&sh_css_sp_stage.frames);
 	/*
-- 
2.39.2

