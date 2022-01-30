Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25C134A3BF6
	for <lists+linux-media@lfdr.de>; Mon, 31 Jan 2022 00:59:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243874AbiA3X7N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Jan 2022 18:59:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243865AbiA3X7M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Jan 2022 18:59:12 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E761EC061714
        for <linux-media@vger.kernel.org>; Sun, 30 Jan 2022 15:59:11 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id j5-20020a05600c1c0500b0034d2e956aadso8190626wms.4
        for <linux-media@vger.kernel.org>; Sun, 30 Jan 2022 15:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/aoh8o1GHLWarjipXS3EzkDQkIHXyhnCnloR5RFP+40=;
        b=kvI+t8u3jyndZQNunoe4nqv47WHuRbg4YPSv6Odo6OPiEv0im85w6vzCQGWxAkcvz7
         fYxBerJdUuzJmgl+KiaNOtysT+v7v8vvKp1sjViqAyXvlJa9bqVw/HRJfKtVeOPciuF9
         eFx5UsvDTw/Y8VXf5tp5DX2tFW+AfnG2vySSGDv9Woi9A83ZmFrBaT270fACqTkrXQrG
         fYdOf9a41mF8a5X8tIJhaFbtG6zwFMW73pX6czKS4jY6Q6sAgHUBRu498nJWPuwlk5LM
         qiqOK7HjmKOyDWDEGrgDLTH1UW4sWKfb23C8kagWJGJFfSoTTjoBJOLSqFByP4tLVx/f
         Exwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/aoh8o1GHLWarjipXS3EzkDQkIHXyhnCnloR5RFP+40=;
        b=wZjqRv2/rxh96rpvZZbghuSDZvbd5UC3nPb4Eu8ZNDzk8dulT6CwQmm9AN+ssXSZ8O
         JSbRmmHaREibkC3KLcij7Mo7Vc/NAGB/+ZdBnUEzlTFpyJmB/z2mH7EykWgKxlzX6UYj
         dfqrVwX1UxilNsSZ8qKCe601ArtfQGIf2i1LZS/vEFBjeGu4jwpgt4YJRlXmRR55Pacc
         4EA3h1fpAgj7ev0eSQ3v5o5qRJrzZ3bi9I+pKmUrp5dFg0wYgJCBXooglB4r6sXy/7Ee
         42oDmBm29kteOBtDfzzK+F/JEvwNLk5eB+/oyWLzJHHEd4678hry3xNT614j6gZrS/Tc
         yzNw==
X-Gm-Message-State: AOAM533ex2zULJohsp+SdF0F/pzFr1wfvhrR6xpgHgIqE34Pn74M0pei
        YEXofY+lCg/B92bPFjfLkKjcQbdX6G4=
X-Google-Smtp-Source: ABdhPJwB2XKV5p1z3Kvb7mNjKR3Vd7lXlpF4KogSPjUFaFQ8nYHq8v9r65qUazoAf/YqbaAlX+nXUA==
X-Received: by 2002:a05:600c:2053:: with SMTP id p19mr24905342wmg.29.1643587150560;
        Sun, 30 Jan 2022 15:59:10 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id 11sm11993663wrb.30.2022.01.30.15.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 15:59:10 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Cc:     sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        hanlinchen@chromium.org, tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
Subject: [PATCH v2 5/6] media: entity: Add support for ancillary links
Date:   Sun, 30 Jan 2022 23:58:20 +0000
Message-Id: <20220130235821.48076-6-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220130235821.48076-1-djrscally@gmail.com>
References: <20220130235821.48076-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add functions to create ancillary links, so that they don't need to
be manually created by users.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---

Changes since v1:

	- Hardcoded MEDIA_LINK_FL_IMMUTABLE and MEDIA_LINK_FL_ENABLED (Laurent)

Changes since the rfc:

	- (Laurent) Set gobj0 and gobj1 directly instead of the other union
	members
	- (Laurent) Added MEDIA_LNK_FL_IMMUTABLE to the kerneldoc for the new
	create function

 drivers/media/mc/mc-entity.c | 22 ++++++++++++++++++++++
 include/media/media-entity.h | 21 +++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 29d1285c805a..7bf2c73a3886 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -1050,3 +1050,25 @@ void media_remove_intf_links(struct media_interface *intf)
 	mutex_unlock(&mdev->graph_mutex);
 }
 EXPORT_SYMBOL_GPL(media_remove_intf_links);
+
+struct media_link *media_create_ancillary_link(struct media_entity *primary,
+					       struct media_entity *ancillary)
+{
+	struct media_link *link;
+
+	link = media_add_link(&primary->links);
+	if (!link)
+		return ERR_PTR(-ENOMEM);
+
+	link->gobj0 = &primary->graph_obj;
+	link->gobj1 = &ancillary->graph_obj;
+	link->flags = MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED |
+		      MEDIA_LNK_FL_ANCILLARY_LINK;
+
+	/* Initialize graph object embedded in the new link */
+	media_gobj_create(primary->graph_obj.mdev, MEDIA_GRAPH_LINK,
+			  &link->graph_obj);
+
+	return link;
+}
+EXPORT_SYMBOL_GPL(media_create_ancillary_link);
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index fea489f03d57..afeda41ece4c 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -1104,6 +1104,27 @@ void media_remove_intf_links(struct media_interface *intf);
  * it will issue a call to @operation\(@entity, @args\).
  */
 
+/**
+ * media_create_ancillary_link() - create an ancillary link between two
+ *				   instances of &media_entity
+ *
+ * @primary:	pointer to the primary &media_entity
+ * @ancillary:	pointer to the ancillary &media_entity
+ *
+ * Create an ancillary link between two entities, indicating that they
+ * represent two connected pieces of hardware that form a single logical unit.
+ * A typical example is a camera lens being linked to the sensor that it is
+ * supporting.
+ *
+ * The function sets both MEDIA_LNK_FL_ENABLED and MEDIA_LNK_FL_IMMUTABLE for
+ * the new link. This behaviour may be subject to change in the future, so
+ * userspace applications using ancillary links should ensure that ancillary
+ * links are enabled when in use.
+ */
+struct media_link *
+media_create_ancillary_link(struct media_entity *primary,
+			    struct media_entity *ancillary);
+
 #define media_entity_call(entity, operation, args...)			\
 	(((entity)->ops && (entity)->ops->operation) ?			\
 	 (entity)->ops->operation((entity) , ##args) : -ENOIOCTLCMD)
-- 
2.25.1

