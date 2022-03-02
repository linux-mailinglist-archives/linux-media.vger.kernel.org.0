Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DBEE4CB1AC
	for <lists+linux-media@lfdr.de>; Wed,  2 Mar 2022 23:03:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242213AbiCBWEC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Mar 2022 17:04:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236829AbiCBWEC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Mar 2022 17:04:02 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68EC3C9920
        for <linux-media@vger.kernel.org>; Wed,  2 Mar 2022 14:03:17 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id p9so4870722wra.12
        for <linux-media@vger.kernel.org>; Wed, 02 Mar 2022 14:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YKGA5UWMc55hY8HA5b3tbE4nKkQsSj8ptMeMEZUkbOw=;
        b=FyNOhyuG177UMLONMDCkT7x1indfKOMwgZGDMdOAPOfUD0Ll9euA0UUs2CazupxXrS
         /NWQWn2s+9QmZTeIasfnn3NsJqnnCFsTS+4FSqAoz+vR4UPddTSLiGUqGFxrS32ydk9e
         VAyfCLsoqGbhStNAtB2w4nk5Bs45IXGCuBl6UM9cyOExslfHmLEfHldoH4bpmxhMNWgf
         Yf3TESV3ARtc7pPz6K/zy+B9ZWWjywRZbiu/dSffhmFrTbKogoZFU9XdRxDLqyuE1k58
         FKm34QApLLThQdxaIdhOwvaz24T3/E61Ul86gR8ukF5+08tNyFdkqRUAPyCwdWnJlUIP
         JIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YKGA5UWMc55hY8HA5b3tbE4nKkQsSj8ptMeMEZUkbOw=;
        b=Nr/lmnZ7c9AbE1YPA1SHIZghOm7x6RjVUNQRPw/NBjfc+AvGQvWun2QsuPcy0KA2Z1
         yw3Lnc2aehfX1wwfVZ4iQXcQN8hqgRp6Y1M4BnkhE0aOfBsraf04vhl3VU3RYymqs9jW
         +ElqH1HBdIoIvEmyOFaQTA0NEhrJ6WY8iUAlcATCVyzDGnh+sOO0kH9vQwa30pD7ZmjY
         AjLJOocU0VM0SXQHOd5iOszXU4JLASZ0+n9tfAyr0+HdUMei9jAQFRqqDHfZYl3Oq7lL
         HL1OeLAUU9/zMdRxr3UntJM8LhCHtkLlBXXA8ST4I5DdP5od3slD+uki9HdOUGedsWUZ
         q8RQ==
X-Gm-Message-State: AOAM532Amqr+xJbUjoLxzjvykb+m2cmUnemCWLF9NfxyFyBUxux7EnUt
        yJb0WR2Mu1z6WYXOzoS8jOQ17NOxij86wQ==
X-Google-Smtp-Source: ABdhPJxMIKajnWlXcuk2d3gJQvUNhBChqqzdVAPi4G9BEEW5cx63o05khjLd0WO6nNYWfzYFjL4tuw==
X-Received: by 2002:adf:d1c2:0:b0:1f0:435a:14ae with SMTP id b2-20020adfd1c2000000b001f0435a14aemr3242140wrd.404.1646258595890;
        Wed, 02 Mar 2022 14:03:15 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c4f1000b0033383cdeea1sm229258wmq.10.2022.03.02.14.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 14:03:15 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Cc:     sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        hanlinchen@chromium.org, tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
Subject: [PATCH v3 2/5] media: media.h: Add new media link type
Date:   Wed,  2 Mar 2022 22:03:01 +0000
Message-Id: <20220302220304.1327896-3-djrscally@gmail.com>
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

To describe in the kernel the connection between devices and their
supporting peripherals (for example, a camera sensor and the vcm
driving the focusing lens for it), add a new type of media link
to introduce the concept of these ancillary links.

Add some elements to the uAPI documentation to explain the new link
type, their purpose and some aspects of their current implementation.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Daniel Scally <djrscally@gmail.com>
---

Changes since v1:

	- None

changes since the rfc:

	- Split out into its own patch (mostly so it can be followed by patch
	#3, which corrects some media-core code that is otherwise broken by the
	new links)

 .../media/mediactl/media-controller-model.rst   |  6 ++++++
 .../media/mediactl/media-types.rst              | 17 ++++++++++++-----
 include/uapi/linux/media.h                      |  1 +
 3 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/Documentation/userspace-api/media/mediactl/media-controller-model.rst b/Documentation/userspace-api/media/mediactl/media-controller-model.rst
index 222cb99debb5..78bfdfb2a322 100644
--- a/Documentation/userspace-api/media/mediactl/media-controller-model.rst
+++ b/Documentation/userspace-api/media/mediactl/media-controller-model.rst
@@ -33,3 +33,9 @@ are:
 
 -  An **interface link** is a point-to-point bidirectional control
    connection between a Linux Kernel interface and an entity.
+
+- An **ancillary link** is a point-to-point connection denoting that two
+  entities form a single logical unit. For example this could represent the
+  fact that a particular camera sensor and lens controller form a single
+  physical module, meaning this lens controller drives the lens for this
+  camera sensor.
\ No newline at end of file
diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
index 0a26397bd01d..60747251d409 100644
--- a/Documentation/userspace-api/media/mediactl/media-types.rst
+++ b/Documentation/userspace-api/media/mediactl/media-types.rst
@@ -412,14 +412,21 @@ must be set for every pad.
 	  is set by drivers and is read-only for applications.
 
     *  -  ``MEDIA_LNK_FL_LINK_TYPE``
-       -  This is a bitmask that defines the type of the link. Currently,
-	  two types of links are supported:
+       -  This is a bitmask that defines the type of the link. The following
+	  link types are currently supported:
 
 	  .. _MEDIA-LNK-FL-DATA-LINK:
 
-	  ``MEDIA_LNK_FL_DATA_LINK`` if the link is between two pads
+	  ``MEDIA_LNK_FL_DATA_LINK`` for links that represent a data connection
+     between two pads.
 
 	  .. _MEDIA-LNK-FL-INTERFACE-LINK:
 
-	  ``MEDIA_LNK_FL_INTERFACE_LINK`` if the link is between an
-	  interface and an entity
+	  ``MEDIA_LNK_FL_INTERFACE_LINK`` for links that associate an entity to its
+     interface.
+
+	  .. _MEDIA-LNK-FL-ANCILLARY-LINK:
+
+	  ``MEDIA_LNK_FL_ANCILLARY_LINK`` for links that represent a physical
+     relationship between two entities. The link may or may not be ummutable, so
+     applications must not assume either case.
\ No newline at end of file
diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
index 200fa8462b90..afbae7213d35 100644
--- a/include/uapi/linux/media.h
+++ b/include/uapi/linux/media.h
@@ -226,6 +226,7 @@ struct media_pad_desc {
 #define MEDIA_LNK_FL_LINK_TYPE			(0xf << 28)
 #  define MEDIA_LNK_FL_DATA_LINK		(0 << 28)
 #  define MEDIA_LNK_FL_INTERFACE_LINK		(1 << 28)
+#  define MEDIA_LNK_FL_ANCILLARY_LINK		(2 << 28)
 
 struct media_link_desc {
 	struct media_pad_desc source;
-- 
2.25.1

