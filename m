Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB26D55B282
	for <lists+linux-media@lfdr.de>; Sun, 26 Jun 2022 16:47:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230388AbiFZOrT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jun 2022 10:47:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiFZOrS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jun 2022 10:47:18 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8CB7E002
        for <linux-media@vger.kernel.org>; Sun, 26 Jun 2022 07:47:15 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 3B2128210A;
        Sun, 26 Jun 2022 16:47:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1656254833;
        bh=TeB9LnL9L5sIkMMjH8oYw6fQxRwr73MHDrTeUOq3HOk=;
        h=From:To:Cc:Subject:Date:From;
        b=Z0k1INX/CfWwAzjsEIBVWi2B9wmb5wVyA+X2rZH8wPSZX0c7jtndJAH8/lFbJYheR
         K5jTQdYDIBLhb/dRmj/bLmW7uA1K9ZjuSgvvgQgiwePmV3uspu8YwsLZbs7ZtwhEUC
         KxNznAUXtqi2Ov4yqtSiPpxc1xIdwCtQ/wpxMBIj07sxORj+++KcuNTH4tmBDAWLEN
         QIInIL0GN3Izic42VwseNOcfjAMRTz4rWn8sGz8aKByHcJgtooNVuWmaQ47hOtKNRy
         utGYamWOHCQcTKK+NSdYea9rJ4tC23M06H0EoPo2HDGuShzVS0HvDZl+miXoGfk5tv
         ZUFzuifO36P3Q==
From:   Marek Vasut <marex@denx.de>
To:     linux-media@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH] media: v4l2-ctrls: Fix missing newline in examples
Date:   Sun, 26 Jun 2022 16:47:01 +0200
Message-Id: <20220626144701.13909-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
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

Replace supportedn with supported\n , i.e. add the missing backslash.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/userspace-api/media/v4l/control.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/control.rst b/Documentation/userspace-api/media/v4l/control.rst
index 3eec651742605..4463fce694b08 100644
--- a/Documentation/userspace-api/media/v4l/control.rst
+++ b/Documentation/userspace-api/media/v4l/control.rst
@@ -461,10 +461,10 @@ Example: Changing controls
 	    perror("VIDIOC_QUERYCTRL");
 	    exit(EXIT_FAILURE);
 	} else {
-	    printf("V4L2_CID_BRIGHTNESS is not supportedn");
+	    printf("V4L2_CID_BRIGHTNESS is not supported\n");
 	}
     } else if (queryctrl.flags & V4L2_CTRL_FLAG_DISABLED) {
-	printf("V4L2_CID_BRIGHTNESS is not supportedn");
+	printf("V4L2_CID_BRIGHTNESS is not supported\n");
     } else {
 	memset(&control, 0, sizeof (control));
 	control.id = V4L2_CID_BRIGHTNESS;
-- 
2.35.1

