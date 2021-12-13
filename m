Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FC33473879
	for <lists+linux-media@lfdr.de>; Tue, 14 Dec 2021 00:29:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244180AbhLMX3J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Dec 2021 18:29:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244154AbhLMX3I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Dec 2021 18:29:08 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBE66C06173F
        for <linux-media@vger.kernel.org>; Mon, 13 Dec 2021 15:29:07 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id a9so29623049wrr.8
        for <linux-media@vger.kernel.org>; Mon, 13 Dec 2021 15:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MgCtKC+Gd7kApujFsuR5TW5hz/ErAzIhf2rX5Pgmy5o=;
        b=fpit3YupVLRQCsiBB98paZPY/vws70ChOL/XADsgVF+afDYelu3wOsyXvfZp07Yf7o
         ndFBw+WRAtNMGJBYbZFUGgwLGzlp4qHkCjIYn04iy9f72bbyrJd/AUrbcGn2TM7XLNyU
         +cDf7APM95/8gyD9ibCDD59KxHrOJBokmhdBLlGPOOZy576lD2EEOZLKx2RggT01inI6
         OsxdBUsGarGkvz9cqyR8hDzHL/ZGYDj+GFjPyEPdjDACCx9tyH8pVdmlI4OUaH4hD2UG
         NL5vpAuXU613PQv6iRCmiz81P7QZdJMaVrVJCvhxUVJaHeuCC/mNtOHGDFCMrkGJh/mM
         NIXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MgCtKC+Gd7kApujFsuR5TW5hz/ErAzIhf2rX5Pgmy5o=;
        b=IdT5P2yWjcFvYSvT/IfZhKv8wBPUiCUxeaZMsVvw0yyJZoCV3PEZQttklvEywPIxjh
         v0oOOgmj9DmKXFFkHJqCdYPw/V6ZkexjCzLI9N53aWA+udhcuktARUERz7stnZm8sknB
         A86Zn0BUPuIpYNC6FEmDj7dSDP62VyRphNQoXwIjL/U8g7XvfCZ1Nu/gzra6IFD3mVW8
         TxCEtgBJHSZzb64tmtOo+BSzNdKWvB1MbLiCfeEcISTCla9mivIOh+5CyFKmU3JfLPfX
         8tTaVp8SAOsiRlOv+Fee7ScypFGSIDFcA09IjN5ezPTnuNgBny7yncZlGWSXxqhaJqwY
         nYEw==
X-Gm-Message-State: AOAM5332iUaWsf9y2dfpK2XDmSF9YijZg9OF2jD8/GE58iobPDpsZpih
        0oDXdR6dEAEtUDsXCM0bw4PvXhuAK6E=
X-Google-Smtp-Source: ABdhPJx3yb6CKioC+of69sRZt9ZhFjNno0BY3/9Z+rr7mxoEowwx35RVewqpHNlQ6z/8uOlnrGS03g==
X-Received: by 2002:adf:900f:: with SMTP id h15mr1736128wrh.562.1639438146517;
        Mon, 13 Dec 2021 15:29:06 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id 38sm12551643wrc.1.2021.12.13.15.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 15:29:05 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Cc:     sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        hanlinchen@chromium.org, tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
Subject: [PATCH 2/5] media: entity: Add link_type() helper
Date:   Mon, 13 Dec 2021 23:28:46 +0000
Message-Id: <20211213232849.40071-3-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211213232849.40071-1-djrscally@gmail.com>
References: <20211213232849.40071-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now we have three types of media link, printing the right name during
debug output is slightly more complicated. Add a helper function to
make it easier.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes since the rfc:

	- new patch

 drivers/media/mc/mc-entity.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index f40f41977142..d79eb88bc167 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -60,6 +60,20 @@ static inline const char *intf_type(struct media_interface *intf)
 	}
 };
 
+static inline const char *link_type(struct media_link *link)
+{
+	switch (link->flags & MEDIA_LNK_FL_LINK_TYPE) {
+	case MEDIA_LNK_FL_DATA_LINK:
+		return "data";
+	case MEDIA_LNK_FL_INTERFACE_LINK:
+		return "interface";
+	case MEDIA_LNK_FL_ANCILLARY_LINK:
+		return "ancillary";
+	default:
+		return "unknown";
+	}
+}
+
 __must_check int __media_entity_enum_init(struct media_entity_enum *ent_enum,
 					  int idx_max)
 {
@@ -107,9 +121,7 @@ static void dev_dbg_obj(const char *event_name,  struct media_gobj *gobj)
 
 		dev_dbg(gobj->mdev->dev,
 			"%s id %u: %s link id %u ==> id %u\n",
-			event_name, media_id(gobj),
-			media_type(link->gobj0) == MEDIA_GRAPH_PAD ?
-				"data" : "interface",
+			event_name, media_id(gobj), link_type(link),
 			media_id(link->gobj0),
 			media_id(link->gobj1));
 		break;
-- 
2.25.1

