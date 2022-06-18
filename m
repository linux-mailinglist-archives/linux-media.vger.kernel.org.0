Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56F8D550752
	for <lists+linux-media@lfdr.de>; Sun, 19 Jun 2022 00:23:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234387AbiFRWXn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Jun 2022 18:23:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234001AbiFRWXm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Jun 2022 18:23:42 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B70710FFD
        for <linux-media@vger.kernel.org>; Sat, 18 Jun 2022 15:23:41 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 14B0383F6A;
        Sun, 19 Jun 2022 00:23:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1655591020;
        bh=RCjH1QPo/2w7OjHRig25Ob2Y4ZrRSsmXBv51Nn+xmN8=;
        h=From:To:Cc:Subject:Date:From;
        b=n4bWJPUsUsyJcgwNnVe4Y+ejqeDmwr6I0HiB0LAQmgJnqifMlftO7YVGzLl7eoGsh
         PnPyJqO1jGpZtWyhBSpZVQECoL4ofq4bXrd5Id0caQ5dBeyj73rMVgUZaReK9DbTt2
         ostbcKZcqCelj1GkiUhLJH0lta2Lw3yxIdxGzmURvMyKzCj25olHoRcyp9fBRcLjt4
         DbCf0tZX/A9Gm28XSbL6ntEaunzaIB18pVPlw/EyjCUK0rT+9Pa1tFbW/oitJCKKM7
         TrLduJVv5AEAHrY7EKSJky+Gs7wEAv7oMpTS/gMsy16+tt+F6kJAm5/ZUxCWROXwNG
         0No5AEK3mm/8Q==
From:   Marek Vasut <marex@denx.de>
To:     linux-media@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Amelie DELAUNAY <amelie.delaunay@foss.st.com>,
        Hugues FRUCHET <hugues.fruchet@foss.st.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philippe CORNU <philippe.cornu@foss.st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] media: stm32: dcmi: Register V4L2 subdev nodes
Date:   Sun, 19 Jun 2022 00:23:35 +0200
Message-Id: <20220618222335.478205-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Unless the V4L2 device calls v4l2_device_register_subdev_nodes(),
the /dev/v4l-subdev* sub-device nodes are not registered and thus
not created. Add the missing call.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alain Volmat <alain.volmat@foss.st.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Amelie DELAUNAY <amelie.delaunay@foss.st.com>
Cc: Hugues FRUCHET <hugues.fruchet@foss.st.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Philippe CORNU <philippe.cornu@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index 5f08ba47ea96b..56f4e04bc7c49 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -1805,6 +1805,12 @@ static int dcmi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 
 	dcmi->vdev->ctrl_handler = dcmi->source->ctrl_handler;
 
+	ret = v4l2_device_register_subdev_nodes(&dcmi->v4l2_dev);
+	if (ret) {
+		dev_err(dcmi->dev, "Count not register subdev nodes\n");
+		return ret;
+	}
+
 	ret = dcmi_formats_init(dcmi);
 	if (ret) {
 		dev_err(dcmi->dev, "No supported mediabus format found\n");
-- 
2.35.1

