Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6E174A3BF5
	for <lists+linux-media@lfdr.de>; Mon, 31 Jan 2022 00:59:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243863AbiA3X7M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Jan 2022 18:59:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241651AbiA3X7L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Jan 2022 18:59:11 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A459C061714
        for <linux-media@vger.kernel.org>; Sun, 30 Jan 2022 15:59:11 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id w11so22061537wra.4
        for <linux-media@vger.kernel.org>; Sun, 30 Jan 2022 15:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OPpoJnU/qyg2/VoeGoW1Rn4aPz6S0A9ibACKGoGZN18=;
        b=mi2/QUg5gWiGvQqVrMJ9tD3a+99R4h/pf625IaJ5ekxUwfe734jVrYfEvS85V7l82X
         Ki2ZNyC4CmrYAdOhONydYzPPH/nkEbr7yvZfJrBqWfi9EgYKJ2GcPq9S95q4z2TpH8lD
         +qvFsW2c5zoy52JHyL3IWnmxVzoKFUWDcsL668OxOy5CtbiRNRhgpuHJs4mF0T1BY9y5
         xHnb9JAmFP8TSUD9I5LHLfjlsHDhczP1rVnFdq7iqoLZsFcvRnNVAn4+LK82R12OIKjD
         7snvR3fzYVdRcjPD2t4m+eNDVf99bHr/EIL0nv77fY903gPOumGeARe1NQp1ZaT0cZ++
         n36g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OPpoJnU/qyg2/VoeGoW1Rn4aPz6S0A9ibACKGoGZN18=;
        b=g0npUoI6QYNmgrGGHLhShtUGkk3CKbK7GgJXZtnoV1FSECLVsLcvN9m4fOeJYzZZ7h
         BAbXjO+8lkpzytuTQAJzc+eosLUvHov755FbxFTwLDueP/wF7boIQUiENYTI64SDys9b
         FFvAOLHiXfcX8H4LrDnuMnUQ8oqK4hTZ0/wk7MttfJIEEujbYJ007/aNPMMI4RtNiJSI
         WeJOX6HhjkISWzCkhORaSYKVNxhcTDHfKdT9S66PK8+YjblOGqudc/p7sCUZt8Bfrh0r
         Oo/xWBySGxbzWZocHA63wBoOB7X8ZMyLwY7c+t+9PeHKgGQv4tf2wxlHRbW7PW2qjN1l
         ThhA==
X-Gm-Message-State: AOAM530HOAENfwbEeLeOnXOD3bg54dqY840u+k3b+Ez/tEe8hQYg7/pr
        muNXMGmBNWULfrpPaa/N6+xocatI2zw=
X-Google-Smtp-Source: ABdhPJw/ZKDFFuQpy2pfkYk48xdzvk7TXgvZRkEm9DSG5fVyY1ZAxYR7N9RhYmUdcddXvCxA23DvNg==
X-Received: by 2002:a5d:47cf:: with SMTP id o15mr15151828wrc.577.1643587149642;
        Sun, 30 Jan 2022 15:59:09 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id 11sm11993663wrb.30.2022.01.30.15.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 15:59:09 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Cc:     sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        hanlinchen@chromium.org, tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
Subject: [PATCH v2 4/6] media: entity: Add link_type_name() helper
Date:   Sun, 30 Jan 2022 23:58:19 +0000
Message-Id: <20220130235821.48076-5-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220130235821.48076-1-djrscally@gmail.com>
References: <20220130235821.48076-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now we have three types of media link, printing the right name during
debug output is slightly more complicated. Add a helper function to
make it easier.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes since v1:

	- renamed function to link_type_name() (Laurent)

Changes since the rfc:

	- new patch

 drivers/media/mc/mc-entity.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 2a6e16fb0048..29d1285c805a 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -60,6 +60,20 @@ static inline const char *intf_type(struct media_interface *intf)
 	}
 };
 
+static inline const char *link_type_name(struct media_link *link)
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
+			event_name, media_id(gobj), link_type_name(link),
 			media_id(link->gobj0),
 			media_id(link->gobj1));
 		break;
-- 
2.25.1

