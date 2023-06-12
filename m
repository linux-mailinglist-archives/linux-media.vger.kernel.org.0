Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5E1572B7D9
	for <lists+linux-media@lfdr.de>; Mon, 12 Jun 2023 07:59:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234726AbjFLF7C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jun 2023 01:59:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234564AbjFLF7A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jun 2023 01:59:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 112DBE69
        for <linux-media@vger.kernel.org>; Sun, 11 Jun 2023 22:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686549494;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bTGxp+ABQXzObUunB5Foxg7Kx1k5kJvK45SIL7x3bQo=;
        b=LXWxCYJf/H3v18UwHTwFSy3JWxGIz24Q+122TXaLa+8+t7Z4qIn2HKzEiHVDLLE1chGvm5
        eXa5WJKfKcAAwrkxcLoe49Dly6sV5cEFVYF4W47gSDKgFt8k5J3eNMiBVYcRKevsyX/LWI
        NVbImx+tU/ecNhqSQpWnhLpopYcw/e4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-sn6EHz8yM7Gw-VYpwIItJw-1; Mon, 12 Jun 2023 01:58:11 -0400
X-MC-Unique: sn6EHz8yM7Gw-VYpwIItJw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E067811E78;
        Mon, 12 Jun 2023 05:58:10 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.34])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9C5D41121314;
        Mon, 12 Jun 2023 05:58:07 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v2 3/3] atomisp: sh_css_params: write the sp_group config according to the ISP model
Date:   Mon, 12 Jun 2023 13:57:18 +0800
Message-Id: <20230612055718.453554-4-hpa@redhat.com>
In-Reply-To: <20230612055718.453554-1-hpa@redhat.com>
References: <20230612055718.453554-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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
 .../staging/media/atomisp/pci/sh_css_params.c | 41 ++++++++++++++++++-
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 588f2adab058..22a9fed006f6 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -3720,10 +3720,47 @@ struct ia_css_shading_table *ia_css_get_shading_table(struct ia_css_stream
 
 ia_css_ptr sh_css_store_sp_group_to_ddr(void)
 {
+	u8 *write_buf;
+	u8 *buf_ptr;
+
 	IA_CSS_ENTER_LEAVE_PRIVATE("void");
+
+	write_buf = kzalloc(sizeof(struct sh_css_sp_group), GFP_KERNEL);
+	if (!write_buf)
+		return 0;
+
+	buf_ptr = write_buf;
+	if (IS_ISP2401) {
+		memcpy(buf_ptr, &sh_css_sp_group.config, 3);
+		buf_ptr += 3;
+		memcpy(buf_ptr, &sh_css_sp_group.config.enable_isys_event_queue, 2);
+		buf_ptr += 2;
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

