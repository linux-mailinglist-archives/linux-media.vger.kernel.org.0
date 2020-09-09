Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A144A262FBB
	for <lists+linux-media@lfdr.de>; Wed,  9 Sep 2020 16:26:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730526AbgIIOZq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Sep 2020 10:25:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729507AbgIIM7a (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Sep 2020 08:59:30 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 387EAC061573
        for <linux-media@vger.kernel.org>; Wed,  9 Sep 2020 05:57:23 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id b124so2047422pfg.13
        for <linux-media@vger.kernel.org>; Wed, 09 Sep 2020 05:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sslab.ics.keio.ac.jp; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=/xkIWni8SgM73BFi4hmvbWE+41W2IJ3UZaLFsKLGrO0=;
        b=YwkDJHyKoglYQYFHc7LcxMWbQGCUl28Hi1L9vfSTiRoQHDFZ/9HixdLYvuQzUyBm15
         z6QM6Om7t/Yg4JfftmrNdAYJIUIpCD9O62viw/Qaha/v962oMvVgzddrvI3w+kF200RS
         AoIIjoXRgEo78UrMFb6wOCqZ4yAzq9mwLPv0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/xkIWni8SgM73BFi4hmvbWE+41W2IJ3UZaLFsKLGrO0=;
        b=W+UueSpmRtQC+yVAkrnwclFCovtlq3/l1UgV0WAdMJogOdAX8cJsnLR7vLnJ2MONUZ
         +pbw0s4Bw9yOJDfyuO6UW/G9XB6cKKnAAAO65r6JYiXUJkOUwynbBXLUdepJpzXzcxEF
         lh4XXh918VMg9e8vEKLaf9G2zxJeIv60JqLzDLx8+CJ00P97u9pK6l0e6YZJJTIDbzVQ
         OczIOMYsO3B9CqqQ+UXgkXnbR4y31MSUw+BHVzgAzegP/0FU00WgOuNVNYrGO57gXd0L
         i59xwbWhrjaxShJcSPPnTH7vH2+lRFJbtmpVgRy6QyMI/zu3aGOHayn8nSXpCoBktFXw
         E51w==
X-Gm-Message-State: AOAM531yrWkTK2t46I9FTR+/gX2FheTlZmQwgdpYfHC6h1/JtbswuUym
        ciOimvm0+TGcJrbSoVju+AAyPg==
X-Google-Smtp-Source: ABdhPJwT/47DO5VQWrTBUV23H0KtdJegUF7iPDdwPNWnUhe3halt7b6g1qpksE6Sf0QqVS79V7FBQw==
X-Received: by 2002:a63:e813:: with SMTP id s19mr545536pgh.33.1599656242537;
        Wed, 09 Sep 2020 05:57:22 -0700 (PDT)
Received: from brooklyn.i.sslab.ics.keio.ac.jp (sslab-relay.ics.keio.ac.jp. [131.113.126.173])
        by smtp.googlemail.com with ESMTPSA id l21sm2192191pgb.35.2020.09.09.05.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 05:57:21 -0700 (PDT)
From:   Keita Suzuki <keitasuzuki.park@sslab.ics.keio.ac.jp>
Cc:     keitasuzuki.park@sslab.ics.keio.ac.jp,
        takafumi@sslab.ics.keio.ac.jp,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: siano: fix memory leak of debugfs members in smsdvb_hotplug
Date:   Wed,  9 Sep 2020 12:56:57 +0000
Message-Id: <20200909125659.20586-1-keitasuzuki.park@sslab.ics.keio.ac.jp>
X-Mailer: git-send-email 2.17.1
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When dvb_create_media_graph fails, the debugfs kept inside client should
be released. However, the current implementation does not release them.

Fix this by adding a new goto label to call smsdvb_debugfs_release.

Fixes: 0d3ab8410dcb ("[media] dvb core: must check dvb_create_media_graph()")
Signed-off-by: Keita Suzuki <keitasuzuki.park@sslab.ics.keio.ac.jp>
---
 drivers/media/common/siano/smsdvb-main.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/common/siano/smsdvb-main.c b/drivers/media/common/siano/smsdvb-main.c
index 88f90dfd368b..ae17407e477a 100644
--- a/drivers/media/common/siano/smsdvb-main.c
+++ b/drivers/media/common/siano/smsdvb-main.c
@@ -1169,12 +1169,15 @@ static int smsdvb_hotplug(struct smscore_device_t *coredev,
 	rc = dvb_create_media_graph(&client->adapter, true);
 	if (rc < 0) {
 		pr_err("dvb_create_media_graph failed %d\n", rc);
-		goto client_error;
+		goto media_graph_error;
 	}
 
 	pr_info("DVB interface registered.\n");
 	return 0;
 
+media_graph_error:
+	smsdvb_debugfs_release(client);
+
 client_error:
 	dvb_unregister_frontend(&client->frontend);
 
-- 
2.17.1

