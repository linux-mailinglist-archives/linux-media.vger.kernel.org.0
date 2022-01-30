Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 989B74A3BF4
	for <lists+linux-media@lfdr.de>; Mon, 31 Jan 2022 00:59:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243787AbiA3X7K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Jan 2022 18:59:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241651AbiA3X7K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Jan 2022 18:59:10 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24EFFC061714
        for <linux-media@vger.kernel.org>; Sun, 30 Jan 2022 15:59:10 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id k6-20020a05600c1c8600b003524656034cso5139295wms.2
        for <linux-media@vger.kernel.org>; Sun, 30 Jan 2022 15:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3jJ0g27dpE1FUu3MPy8YxNnCH8nvgWy6GR4rkrcef5o=;
        b=GSmf0muxy9deZ2hL+lVMfPRZ9wWaJDwAM7NcmHet2TImu1Y0ImdwB2qX6il+G6+C0c
         PpRMV1do1RnOhkTF3hrOv9nIButtvsI8m1zzvHOV7RBrF82gobVzP54IJZhozx+jicfn
         hI0TBoNdxjGJJqwWXaXzcfQqDgtCprqNho6Ji5tq5os2OSnuJRN8L0Uwfmcz3L6c5Ual
         5xZiRSTt5N2tY70ns5rHK2rfWUPusuQQZsV6di6c2gsx+gd9k6w0hfALtw+VshGFm4NJ
         KixHFg5VUCGrHDO9nAClNuLrjzvkVlCxJPhBcimYS8i6FT6ZCSHghFWMtw9hMBrbEGlO
         ayEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3jJ0g27dpE1FUu3MPy8YxNnCH8nvgWy6GR4rkrcef5o=;
        b=pBmN44RcQDD8DeX4VrHD0Myqho3yTErOqFZJAAh9GJWicPPNHmER7/72Vjoo4HbZfs
         lyfJwVePUELIvPt59QU21A2NhN56Y+6ovcUYLnysXam8lQaTioiMxAofRhUN1INmMAAW
         Mpm8fDWHw8Yy64n8+UVe+p9eX89WwcyL0F+1ee3OqCKvlG/wXQ6ftxOV0yb6MDIeUpp5
         +gPAZ/Y8wuZmKPQVHHvDbObvVZYvBfXtIFY2wEPO+bXt3jPfTf3iwXNASvetaxhVrKFj
         5po5DyyIeQYk+J3a++ivVDON6l6Qaa803BNqvVWpBGEwv51cVhiEVmPwoKwZDbfZYFMl
         zA2Q==
X-Gm-Message-State: AOAM532P8eFUfv/IUYyukNbmcmcJdZTtKTgucp03TPUMkc/OcupBkQWG
        4Fs622KKGnWVkKAI1oHI80MUfOIupz4=
X-Google-Smtp-Source: ABdhPJzSV5eAjHoUiE6Tb04AF1J4I8wvc/pfMPqepm8Ru1a3nU6DkeuKalY3PAG2cPf8E1daEETexA==
X-Received: by 2002:a7b:cbda:: with SMTP id n26mr25225403wmi.76.1643587148829;
        Sun, 30 Jan 2022 15:59:08 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id 11sm11993663wrb.30.2022.01.30.15.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 15:59:08 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Cc:     sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        hanlinchen@chromium.org, tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
Subject: [PATCH v2 3/6] media: docs: Add entries documenting ancillary links
Date:   Sun, 30 Jan 2022 23:58:18 +0000
Message-Id: <20220130235821.48076-4-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220130235821.48076-1-djrscally@gmail.com>
References: <20220130235821.48076-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add some elements to the uAPI documentation to explain the new link
type, their purpose and some aspects of their current implementation.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes since v1:

	- New patch

 .../media/mediactl/media-controller-model.rst            | 6 ++++++
 .../userspace-api/media/mediactl/media-types.rst         | 9 ++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/mediactl/media-controller-model.rst b/Documentation/userspace-api/media/mediactl/media-controller-model.rst
index 222cb99debb5..f77cb9d952e5 100644
--- a/Documentation/userspace-api/media/mediactl/media-controller-model.rst
+++ b/Documentation/userspace-api/media/mediactl/media-controller-model.rst
@@ -33,3 +33,9 @@ are:
 
 -  An **interface link** is a point-to-point bidirectional control
    connection between a Linux Kernel interface and an entity.
+
+- An **ancillary link** is a point-to-point connection describing a physical
+  relationship between two entities. For example this could represent the
+  fact that a particular camera sensor and lens controller form a single
+  physical module, meaning this lens controller drives the lens for this
+  camera sensor.
\ No newline at end of file
diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
index 0a26397bd01d..d69bae359e5b 100644
--- a/Documentation/userspace-api/media/mediactl/media-types.rst
+++ b/Documentation/userspace-api/media/mediactl/media-types.rst
@@ -413,7 +413,7 @@ must be set for every pad.
 
     *  -  ``MEDIA_LNK_FL_LINK_TYPE``
        -  This is a bitmask that defines the type of the link. Currently,
-	  two types of links are supported:
+	  three types of links are supported:
 
 	  .. _MEDIA-LNK-FL-DATA-LINK:
 
@@ -423,3 +423,10 @@ must be set for every pad.
 
 	  ``MEDIA_LNK_FL_INTERFACE_LINK`` if the link is between an
 	  interface and an entity
+
+	  .. _MEDIA-LNK-FL-ANCILLARY-LINK:
+
+	  ``MEDIA_LNK_FL_ANCILLARY_LINK`` if the link is between two
+	  different entities. This at present implies both MEDIA_LNK_FL_ENABLED
+	  and MEDIA_LNK_FL_IMMUTABLE, however applications should not rely on
+	  that being the case in the future.
-- 
2.25.1

