Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 073291AB67D
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 06:07:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbgDPEG6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 00:06:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725298AbgDPEG4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 00:06:56 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8657DC061A0C
        for <linux-media@vger.kernel.org>; Wed, 15 Apr 2020 21:06:55 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id g32so1034359pgb.6
        for <linux-media@vger.kernel.org>; Wed, 15 Apr 2020 21:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vBW5JjfrlfKKX9lDJqutOPYFfUzpp1RfMLPNFPQojl8=;
        b=XR9bYnc5nUgHKRIjopz+NxeSnIC5mMAW2yEOdmZnoDwLanIG63jOFwWX/oAAZsmQPG
         TL+Ob0UecxWwzcICSUuNTyjewE8B7nP0ZYAHFdtvDhBS60KJHUrHiAEBQ/tS90GsaSgK
         F73jYcWQNaeIDajVgF07Sxb3H7yct0WfRbnAMMw/H+Xi4YWCBLmYFB9A60O1jmh/RYQU
         FTpY3ju32tTx5lFvnV1JpAS75FmE/iRA8wEQV0AaoXvF0OPSD3X+haSfBCdnuPReRZdO
         UWjU205KzZmZ2gZA6tGjjyRtGdNKN8sCQ1agg7q0xjL11HdMVmiAzL2ifzLSTCiOM4uN
         +fcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vBW5JjfrlfKKX9lDJqutOPYFfUzpp1RfMLPNFPQojl8=;
        b=uj5psZcwYi2yPrzQ5/ZOZ2Y+tFDgtzhMDNz9ICdEthdQ8l5xKJVncCONPKAavkjRlQ
         1ZTPEFETD7vEGwU+G/kNGVoqlAdpi3yxeONzSwmLVvPAG+GJe8BZvcSOonMwATe4eS+b
         FMhbopb/DmDU1zkxsvnMCuCQDxyBfqx0H7J979yvX2xNLkVt6WjS3AEERkAlId1fGeei
         ID1qZAYvaAWdqhrHB1tD8jo7aM+WzznO6PZMufkV4pHhtdQEKJPKWYYb0DzRS+MGdQDq
         cawdSt8XA8PE8R94wVKvuQOQ0wYF6PmykDEs7KMp0zUyZPvROoNfSZYtTy5G7bggHuJJ
         fRoA==
X-Gm-Message-State: AGi0PuZVZhsOl6YQ2ndwJyQKsXw2LI5woGi4kHGqa2tzT1ijpdJE3GvJ
        LTHvufLLNCs2swgJDvFhlEohZ2Op
X-Google-Smtp-Source: APiQypIKXBapX4JrbRtibpV2crCAjju7ePZE/IgtgcihpDybjRwLnQELF/ikZD4XnDAKjg6PiP5SFA==
X-Received: by 2002:aa7:86c9:: with SMTP id h9mr27980064pfo.294.1587010014725;
        Wed, 15 Apr 2020 21:06:54 -0700 (PDT)
Received: from localhost.localdomain (astound-69-42-19-227.ca.astound.net. [69.42.19.227])
        by smtp.gmail.com with ESMTPSA id l71sm9643964pge.3.2020.04.15.21.06.53
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 21:06:54 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH] treewide: remove pointless c_str
Date:   Wed, 15 Apr 2020 21:06:52 -0700
Message-Id: <20200416040652.388559-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found with clang-tidy's readability-redundant-string-cstr

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/v4l2-compliance/v4l2-compliance.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index 97b96a21..8bdbecc2 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -871,7 +871,7 @@ static std::string make_devname(const char *device, const char *devname,
 		return device;
 	if (is_media) {
 		close(media_fd);
-		return media_devname.c_str();
+		return media_devname;
 	}
 
 	media_v2_topology topology;
-- 
2.25.2

