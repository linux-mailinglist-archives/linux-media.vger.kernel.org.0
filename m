Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D66136662E
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 09:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236756AbhDUHVQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 03:21:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236727AbhDUHVP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 03:21:15 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EEB2C06174A
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 00:20:42 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id v13so7532003ple.9
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 00:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=L9QNhOfkitg4jDlWiEN6PC85EXYAfGnClF8IkWPpAEc=;
        b=JtO5Rjwa8cbD+86EiUiucsmouoE4e1h48R9l9krY0A0ccAJjlU8MQ6GwLuS5FXS5Rd
         4/JW0/I7nbt2E49KJvTyYmqHHLATL4zEOxRPGIEXtXlGpr8f4BIWVHNr/7VNZGcRgeO0
         ZcqGVbogkXLHMgbhm3IV6Q/QqtJcZfxhmdAADJ4U4kHtISIpTMigqSwFV1iZ0/a6z0/3
         SAEbzbu9pa0WX+tPu8oGNVo3WC91FFtqnM/zeNOGhSmRuQOw9fCUjyylUShFiQjhLnyG
         p/G/bRA55gPC94AC7ig7ZAV6jSZjntJMxrjqCC1fa+cnFOHwlhsSCDOJ6tBt2LuhTYHw
         VsTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L9QNhOfkitg4jDlWiEN6PC85EXYAfGnClF8IkWPpAEc=;
        b=MscTFaQoH2BJa5igXd+FV4NDAL8sBkva8KmM1Ibd0g3K3Weu/dp0r5wPAkuDYBje0P
         dEOI8dS/EKyJbhmZPAaQPuS5D45Wg/asZgOitm7NF1D7ODsvGqyazd5jFElu60ry7tAb
         siOAL/ZARdbn7T1QMLKKwkFoo0/08kHtRs4reBOHej7dakkdU7qutd+03wGC40esh4/7
         xxdcy2yDYa8Vp1dERFdrqTUpOmQ+iXCKIOjgzBaBJxS9cjOmI3GINW1aBIVYa/ySHGXk
         O8SWqXV8+JA5I0j/CmjW5+9ZXmYQ+oNjBh18cDx6jy5VWl/9oCFcfSeMuANtwVfTvKRS
         ntQQ==
X-Gm-Message-State: AOAM532vMmacMxD6EEecECJhUsjcmAyQW0ZK5p2+nlh/a+WcE9rxCzZB
        vhDU642dWdBBNq7tZc4zKjMBnTS0v0q+pA==
X-Google-Smtp-Source: ABdhPJwNVyEHbvFCHMgjGMgAlaUgy0mO4EgOWZBUy3Ku0Wub67Czc9o3Amjv0kkg9sOpI/mTmoKsAA==
X-Received: by 2002:a17:902:6b81:b029:ea:dcc5:b841 with SMTP id p1-20020a1709026b81b02900eadcc5b841mr32379710plk.29.1618989641991;
        Wed, 21 Apr 2021 00:20:41 -0700 (PDT)
Received: from mangix-trapnet.lan ([2001:470:1f05:79e::a89])
        by smtp.gmail.com with ESMTPSA id p10sm907815pfo.210.2021.04.21.00.20.41
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 00:20:41 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 7/8] v4l2-utils: turn mbus_names into const vector
Date:   Wed, 21 Apr 2021 00:20:34 -0700
Message-Id: <20210421072035.4188497-7-rosenp@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210421072035.4188497-1-rosenp@gmail.com>
References: <20210421072035.4188497-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allows usage of a more standard for loop.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/v4l2-ctl/v4l2-ctl-subdev.cpp | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
index d0f391bba..f2be9442c 100644
--- a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
@@ -1,3 +1,5 @@
+#include <vector>
+
 #include "v4l2-ctl.h"
 
 struct mbus_name {
@@ -5,10 +7,9 @@ struct mbus_name {
 	__u32 code;
 };
 
-static struct mbus_name mbus_names[] = {
+static const std::vector<mbus_name> mbus_names{
 	{ "Fixed", MEDIA_BUS_FMT_FIXED },
 #include "media-bus-format-names.h"
-	{ nullptr, 0 }
 };
 
 /* selection specified */
@@ -343,9 +344,9 @@ static void print_framefmt(const struct v4l2_mbus_framefmt &fmt)
 {
 	__u32 colsp = fmt.colorspace;
 	__u32 ycbcr_enc = fmt.ycbcr_enc;
-	unsigned int i;
+	size_t i;
 
-	for (i = 0; mbus_names[i].name; i++)
+	for (i = 0; i < mbus_names.size(); i++)
 		if (mbus_names[i].code == fmt.code)
 			break;
 	printf("\tWidth/Height      : %u/%u\n", fmt.width, fmt.height);
@@ -554,9 +555,9 @@ void subdev_get(cv4l_fd &_fd)
 
 static void print_mbus_code(__u32 code)
 {
-	unsigned int i;
+	size_t i;
 
-	for (i = 0; mbus_names[i].name; i++)
+	for (i = 0; i < mbus_names.size(); i++)
 		if (mbus_names[i].code == code)
 			break;
 	if (mbus_names[i].name)
@@ -568,9 +569,8 @@ static void print_mbus_code(__u32 code)
 
 static void print_mbus_codes(int fd, __u32 pad)
 {
-	struct v4l2_subdev_mbus_code_enum mbus_code;
+	struct v4l2_subdev_mbus_code_enum mbus_code = {};
 
-	memset(&mbus_code, 0, sizeof(mbus_code));
 	mbus_code.pad = pad;
 	mbus_code.which = V4L2_SUBDEV_FORMAT_TRY;
 
-- 
2.30.2

