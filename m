Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 747646F9FD9
	for <lists+linux-media@lfdr.de>; Mon,  8 May 2023 08:28:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232518AbjEHG2J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 May 2023 02:28:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232185AbjEHG2H (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 May 2023 02:28:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9632A19D56
        for <linux-media@vger.kernel.org>; Sun,  7 May 2023 23:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683527230;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=u+GKPljtf0bbm0Sf5mRrqhpg9XbqJkeZDiXckq915Y0=;
        b=IiYbzZYq4mqp4jLeBKnk+OT4Lp/jnLOFcoa4MWzXFQTGwotd3YQWdWSLr38yysOk0TYg36
        7sTAgZ/q/XWP6FBXEhhjRj5fyREX0Aa5QT9Gh8JAtDkNAcuvS3dZshvriKz0aWiJ1QaYl+
        wzNEvfIqQrSOwwtohZO36rtxpOaObP8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-OoUHPfJmMnOgCQv8XPLGjg-1; Mon, 08 May 2023 02:27:09 -0400
X-MC-Unique: OoUHPfJmMnOgCQv8XPLGjg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2496B811E7C;
        Mon,  8 May 2023 06:27:09 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.158])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 22776492C13;
        Mon,  8 May 2023 06:27:05 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v2 3/5] staging: media: atomisp: sh_css_sp: Remove #ifdef ISP2401
Date:   Mon,  8 May 2023 14:26:30 +0800
Message-Id: <20230508062632.34537-3-hpa@redhat.com>
In-Reply-To: <20230508062632.34537-1-hpa@redhat.com>
References: <20230508062632.34537-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The actions of ISP2401 and 2400 will be determined at the runtime.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
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
2.40.1

