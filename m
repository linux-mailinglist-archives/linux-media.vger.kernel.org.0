Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C58964CB1AD
	for <lists+linux-media@lfdr.de>; Wed,  2 Mar 2022 23:03:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242331AbiCBWEG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Mar 2022 17:04:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242251AbiCBWED (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Mar 2022 17:04:03 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D12FC9930
        for <linux-media@vger.kernel.org>; Wed,  2 Mar 2022 14:03:19 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id j17so4969959wrc.0
        for <linux-media@vger.kernel.org>; Wed, 02 Mar 2022 14:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iKVMZBiFy16mG3Dfyafd/mMa87sEc9/DrYdseAp/SmA=;
        b=KkKr+64tlreZsZtfb+EYXbCd1f9PA5ds203rOrD0Vc97CwQy0d8sZjx4GMiY0sSNte
         PvreF3MN5DANeMYbCQpvhd2RBx5nqIHbsr/5hWGw3PBOQ2Nq62k1OmLXeh9giXwVjG3d
         islNFDUc/4SElPlCl+zcWugamE0A9YpHy7lpeE9W7/d3TwQx/N8Ozvd3v1du3y68n0kh
         6j4hj4JM0mJ7GrXZYFhwKsJsmi+Ul40mrmfIpaV/87xc6pTNfp4ZhmVSIsFVmExfTTyE
         GdT1nPD5NYX9BI15uqhXFnfzWZHnmZ9DOKxrkJw7yrh4TsIisuKdaOFqgTdUF0ugX2FA
         GQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iKVMZBiFy16mG3Dfyafd/mMa87sEc9/DrYdseAp/SmA=;
        b=l6AXWCKxOijSB0hA7d/u27k4lesKhpHyR/fAmD3XE3Or6+BqPEA8QQ3zyH3w7dfmVB
         bpCc+fEtftBnXOz48BTraD6fqLeWBJorvl6VnEN8aK3PMT4yXCs5AEnrHMTw32scIUf9
         1EmZBObgWkjOCUCXA0zwmTUSL/MNjxEWin3kJRuvS/dvwEp349xygSa0NzDqjn4gutyn
         ZYwfUZV93jHJ/x1ASly8cPx+n+hiBJOc1PUor3U9zQc2RzhHkX2AUnjS3nst6CTrUZK0
         M/MgomxyHPEoK/JW0F/aWZBz5TZMtcsxh+tJY5+92j+CTQ23R7oTLetaC+dGmj4cRCbW
         AANw==
X-Gm-Message-State: AOAM531ZU3MnRwyD32Nib5byBri+fe3UCNfS8KNokG87MD6vEDx65wGI
        yu4ELAuQKX72/7ioDbIqhDhUuiN6rLp5DQ==
X-Google-Smtp-Source: ABdhPJysv6qzhhcHXob1XlKrY+1H3kUXWeq6zWkvJOiGorg2Fm1Y0767bWfPjeBmwER/3EXpWoBbUw==
X-Received: by 2002:a05:6000:1a89:b0:1f0:4b5b:e0ce with SMTP id f9-20020a0560001a8900b001f04b5be0cemr781355wry.425.1646258597807;
        Wed, 02 Mar 2022 14:03:17 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c4f1000b0033383cdeea1sm229258wmq.10.2022.03.02.14.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 14:03:17 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Cc:     sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        hanlinchen@chromium.org, tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
Subject: [PATCH v3 4/5] media: entity: Add support for ancillary links
Date:   Wed,  2 Mar 2022 22:03:03 +0000
Message-Id: <20220302220304.1327896-5-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220302220304.1327896-1-djrscally@gmail.com>
References: <20220302220304.1327896-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add functions to create ancillary links, so that they don't need to
be manually created by users.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Daniel Scally <djrscally@gmail.com>
---

Changes since v2:

	- Fixed some typos and comment phrasing (Laurent)
	- Changed the position of the new function to go after media_entity_call()
	(Laurent)

Changes since v1:

	- Hardcoded MEDIA_LINK_FL_IMMUTABLE and MEDIA_LINK_FL_ENABLED (Laurent)

Changes since the rfc:

	- (Laurent) Set gobj0 and gobj1 directly instead of the other union
	members
	- (Laurent) Added MEDIA_LNK_FL_IMMUTABLE to the kerneldoc for the new
	create function

 drivers/media/mc/mc-entity.c | 22 ++++++++++++++++++++++
 include/media/media-entity.h | 19 +++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 1a7d0a4fb9e8..d7e2f78a83cc 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -1032,3 +1032,25 @@ void media_remove_intf_links(struct media_interface *intf)
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
index fea489f03d57..2a58defc4886 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -1108,4 +1108,23 @@ void media_remove_intf_links(struct media_interface *intf);
 	(((entity)->ops && (entity)->ops->operation) ?			\
 	 (entity)->ops->operation((entity) , ##args) : -ENOIOCTLCMD)
 
+/**
+ * media_create_ancillary_link() - create an ancillary link between two
+ *				   instances of &media_entity
+ *
+ * @primary:	pointer to the primary &media_entity
+ * @ancillary:	pointer to the ancillary &media_entity
+ *
+ * Create an ancillary link between two entities, indicating that they
+ * represent two connected pieces of hardware that form a single logical unit.
+ * A typical example is a camera lens controller being linked to the sensor that
+ * it is supporting.
+ *
+ * The function sets both MEDIA_LNK_FL_ENABLED and MEDIA_LNK_FL_IMMUTABLE for
+ * the new link.
+ */
+struct media_link *
+media_create_ancillary_link(struct media_entity *primary,
+			    struct media_entity *ancillary);
+
 #endif
-- 
2.25.1

