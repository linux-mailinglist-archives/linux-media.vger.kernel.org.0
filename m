Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C798751E35
	for <lists+linux-media@lfdr.de>; Thu, 13 Jul 2023 12:05:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234518AbjGMKFi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jul 2023 06:05:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234435AbjGMKFV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jul 2023 06:05:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0648E269F
        for <linux-media@vger.kernel.org>; Thu, 13 Jul 2023 03:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689242646;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rOVJDTFrcAstOS0UfsxYlchXQfmdDZV7WwXYoUlB40Q=;
        b=GQ9AnAgsFRr9at7vglUc0LPj3PqXC60KIPUn8FSW1QKeu8egghdnbz/APC+llb1Fw6H18l
        TGHNn1M7/tMAXb37JTYwUSpHPwTjwouuNQYbJ+h45tKrONE1c1j+lrymxiuVvmdtAbQc1z
        DoEkkpHq0yO0u0q3LRnbIkb5OBPGp8s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-B3Q0_ON5MWSItB7fqeENUQ-1; Thu, 13 Jul 2023 06:04:03 -0400
X-MC-Unique: B3Q0_ON5MWSItB7fqeENUQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92BEB104458C;
        Thu, 13 Jul 2023 10:04:02 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.111])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 765CA1120ABB;
        Thu, 13 Jul 2023 10:03:58 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 07/11] media: atomisp: pipeline: Removed #if defined(ISP2401) to make driver generic
Date:   Thu, 13 Jul 2023 18:02:27 +0800
Message-ID: <20230713100231.308923-8-hpa@redhat.com>
In-Reply-To: <20230713100231.308923-1-hpa@redhat.com>
References: <20230713100231.308923-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Removed #if defined(ISP2401) to make driver generic.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 .../atomisp/pci/runtime/pipeline/interface/ia_css_pipeline.h    | 2 --
 .../staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c   | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/pipeline/interface/ia_css_pipeline.h b/drivers/staging/media/atomisp/pci/runtime/pipeline/interface/ia_css_pipeline.h
index 222c381ff3b9..5f5dab7252aa 100644
--- a/drivers/staging/media/atomisp/pci/runtime/pipeline/interface/ia_css_pipeline.h
+++ b/drivers/staging/media/atomisp/pci/runtime/pipeline/interface/ia_css_pipeline.h
@@ -241,7 +241,6 @@ bool ia_css_pipeline_uses_params(struct ia_css_pipeline *pipeline);
  */
 bool ia_css_pipeline_get_sp_thread_id(unsigned int key, unsigned int *val);
 
-#if defined(ISP2401)
 /**
  * @brief Get the pipeline io status
  *
@@ -250,7 +249,6 @@ bool ia_css_pipeline_get_sp_thread_id(unsigned int key, unsigned int *val);
  *	Pointer to pipe_io_status
  */
 struct sh_css_sp_pipeline_io_status *ia_css_pipeline_get_pipe_io_status(void);
-#endif
 
 /**
  * @brief Map an SP thread to this pipeline
diff --git a/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c b/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
index e9e187649a65..3d8741e7d5ca 100644
--- a/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
+++ b/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
@@ -454,12 +454,10 @@ bool ia_css_pipeline_has_stopped(struct ia_css_pipeline *pipeline)
 	return sp_group.pipe[thread_id].num_stages == 0;
 }
 
-#if defined(ISP2401)
 struct sh_css_sp_pipeline_io_status *ia_css_pipeline_get_pipe_io_status(void)
 {
 	return(&sh_css_sp_group.pipe_io_status);
 }
-#endif
 
 bool ia_css_pipeline_is_mapped(unsigned int key)
 {
-- 
2.41.0

