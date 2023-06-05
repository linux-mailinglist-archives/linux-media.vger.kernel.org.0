Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14269722378
	for <lists+linux-media@lfdr.de>; Mon,  5 Jun 2023 12:30:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231562AbjFEKaT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Jun 2023 06:30:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231280AbjFEKaR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Jun 2023 06:30:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BF8FED
        for <linux-media@vger.kernel.org>; Mon,  5 Jun 2023 03:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685960969;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8AtwIALSdDfeC27ZQtwOHEZtWeXJnZHUT6kwQAx9PzQ=;
        b=UZ52QaQ5kkBmdrRlmdQnnWeAkkG4scSQ1wOB3/tUuxsXLbudPHO7ObIBtSwqD1xZpmUTRn
        DVnsALdxzpC4C5kBTyr//sFiMjK+9b9xnU88+mB5i3mOXMR/SvG+kF121CAHN17VKQVz2x
        GTXahmxroPraxxOn0GwiAJJDsWGwMOA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-116-IsVGsLD0PQ-KyruKzhMB7w-1; Mon, 05 Jun 2023 06:29:25 -0400
X-MC-Unique: IsVGsLD0PQ-KyruKzhMB7w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 263D0101A531;
        Mon,  5 Jun 2023 10:29:25 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.47])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2BA2A9E75;
        Mon,  5 Jun 2023 10:29:21 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 2/3] atomisp: sh_css_params: write the sp_group config according to the ISP model
Date:   Mon,  5 Jun 2023 18:29:02 +0800
Message-Id: <20230605102903.924283-3-hpa@redhat.com>
In-Reply-To: <20230605102903.924283-1-hpa@redhat.com>
References: <20230605102903.924283-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Pick up the necessary part of sp_group configuration for both model and
then copy those parts into a tempetory buffer. This buffer is finally
written to the ISP with correct length.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 .../staging/media/atomisp/pci/sh_css_params.c | 37 ++++++++++++++++++-
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 588f2adab058..2913d9d6d226 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -3720,10 +3720,43 @@ struct ia_css_shading_table *ia_css_get_shading_table(struct ia_css_stream
 
 ia_css_ptr sh_css_store_sp_group_to_ddr(void)
 {
+	u8 *write_buf;
+	u8 *buf_ptr;
+
 	IA_CSS_ENTER_LEAVE_PRIVATE("void");
+
+	write_buf = kzalloc(sizeof(u8) * 8192, GFP_KERNEL);
+
+	buf_ptr = write_buf;
+	if (IS_ISP2401) {
+		memcpy(buf_ptr, &sh_css_sp_group.config, sizeof(u8) * 5);
+		buf_ptr += (sizeof(u8) * 5);
+		memset(buf_ptr, 0, 3);
+		buf_ptr += 3; /* Padding 3 bytes for struct sh_css_sp_config*/
+	} else {
+		memcpy(buf_ptr, &sh_css_sp_group.config, sizeof(sh_css_sp_group.config));
+		buf_ptr += sizeof(sh_css_sp_group.config);
+	}
+
+	memcpy(buf_ptr, &sh_css_sp_group.pipe, sizeof(sh_css_sp_group.pipe));
+	buf_ptr += sizeof(sh_css_sp_group.pipe);
+
+	if (IS_ISP2401) {
+		memcpy(buf_ptr, &sh_css_sp_group.pipe_io, sizeof(sh_css_sp_group.pipe_io));
+		buf_ptr += sizeof(sh_css_sp_group.pipe_io);
+		memcpy(buf_ptr, &sh_css_sp_group.pipe_io_status,
+		       sizeof(sh_css_sp_group.pipe_io_status));
+		buf_ptr += sizeof(sh_css_sp_group.pipe_io_status);
+	}
+
+	memcpy(buf_ptr, &sh_css_sp_group.debug, sizeof(sh_css_sp_group.debug));
+	buf_ptr += sizeof(sh_css_sp_group.debug);
+
 	hmm_store(xmem_sp_group_ptrs,
-		   &sh_css_sp_group,
-		   sizeof(struct sh_css_sp_group));
+		  write_buf,
+		  buf_ptr - write_buf);
+
+	kfree(write_buf);
 	return xmem_sp_group_ptrs;
 }
 
-- 
2.40.1

