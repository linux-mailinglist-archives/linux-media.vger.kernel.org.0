Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C853F779F10
	for <lists+linux-media@lfdr.de>; Sat, 12 Aug 2023 12:47:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231426AbjHLKrP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Aug 2023 06:47:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbjHLKrO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Aug 2023 06:47:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB3C9211B
        for <linux-media@vger.kernel.org>; Sat, 12 Aug 2023 03:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691837188;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=m9W5ai7H7CUetv3d/Spr4U/Md6fUQTUL7anIUIfrJl8=;
        b=cHE6UNyP5JpI6XvztR8cwJqjRmdkW3/Q0yO9h3zJLz7+gw3pzGb6amJopEwxOji6Pca74I
        01uT44jInXha0QmBaxfQOX3LmQoPNVdZjzv6o3lGy/HGgMgmzfZ4B31Mt55EqVO+0gUmIG
        Y0uJAuQNF70jMRRKeDW4V7yU1LHwRas=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-7-rMCprpMsPI2oelVtOykKLw-1; Sat, 12 Aug 2023 06:46:23 -0400
X-MC-Unique: rMCprpMsPI2oelVtOykKLw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C62B801CF3;
        Sat, 12 Aug 2023 10:46:22 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.45])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B6A00492B0F;
        Sat, 12 Aug 2023 10:46:20 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH] media: atomisp: Simplify some if (IS_ISP2401...) statements
Date:   Sat, 12 Aug 2023 12:46:12 +0200
Message-ID: <20230812104612.38806-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace:

 if (!IS_ISP2401 || (IS_ISP2401 && xxx))

with:

 if (!IS_ISP2401 || xxx)

If the right side of the '||' needs to be evaluated then it is
already known that IS_ISP2401 is true, so no need to check for it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 81f18db7316c..f35c90809414 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -7351,7 +7351,7 @@ static int capture_start(struct ia_css_pipe *pipe)
 		}
 	}
 	/* old isys: need to send_mipi_frames() in all pipe modes */
-	if (!IS_ISP2401 || (IS_ISP2401 && pipe->config.mode != IA_CSS_PIPE_MODE_COPY)) {
+	if (!IS_ISP2401 || pipe->config.mode != IA_CSS_PIPE_MODE_COPY) {
 		err = send_mipi_frames(pipe);
 		if (err) {
 			IA_CSS_LEAVE_ERR_PRIVATE(err);
@@ -8077,7 +8077,7 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 
 	/* check if mipi size specified */
 	if (stream_config->mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR)
-		if (!IS_ISP2401 || (IS_ISP2401 && !stream_config->online))
+		if (!IS_ISP2401 || !stream_config->online)
 		{
 			unsigned int port = (unsigned int)stream_config->source.port.port;
 
-- 
2.41.0

