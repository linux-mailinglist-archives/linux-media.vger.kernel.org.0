Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2D031B3408
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 02:37:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726328AbgDVAhw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 20:37:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726409AbgDVAhu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 20:37:50 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 122F5C0610D5
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2020 17:37:50 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id t4so197825plq.12
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2020 17:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=YGJ8/DZCc9FFoo5IGFrlESNs8sn6Q6EVkv7cKPznHe0=;
        b=nFoXvso18amYPZqijC7+lEsfcLCzsf4DQwwyB8rNeb68YCiffcbhYtBOVDjE6WhBuG
         3Sa6N4Y/X2rtzs4IiZicaiEHlQDVM84nhBxdhKFAkyhDEnNY9lh+729W3OEk+VwoOL63
         m+Y5cArI48Zt4+gqCfAxj9ItlIY/Gm06lnbts6CdOtgB8Kjl2Rk6jFS+CJKK+d+LfkNc
         7zkoGyj6fRg6rGEqh5gA0lQ8dh2sFmRdKUqTzj7yt/LdCprgirEWFTngAvFFaXYzcIxm
         qwkEO2WvNfkdTPqIyF2PJXNX3oOG43fmndTtFGnG0N4xb7RZ7qHUUiznfnEnCeBezt/2
         Y0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YGJ8/DZCc9FFoo5IGFrlESNs8sn6Q6EVkv7cKPznHe0=;
        b=HLbYBrxo/kC9bM40RMNcBDVhfvZOs/v/sfgFBEd+PxbmsC4YZeJgom3o4+D4CYg0wu
         Go7jucMX9Ud61bmoLmGRvTWRnKJakjYg4rhy/oF/MTC16S3sDSIOI6h8G4/ZahYlmzYX
         6SClVtarx5mIJ18ipdWKh2A/3+4kQQ0ihJOL3L67LYx9hmxqH1LHa1TuLUoP37iMDwnS
         UYrG3ei5VvB64XIVm1CKhZvO5RfC6fHIzzUF7r3oiwdFMFqfUTf6RBan5nh1tUgipJr/
         fntYy/lDrlHlIxw7ETj+g8azg8GN7NDskjSkukNY/tUJvyFXWGlPhfRoP6OhZrrq1zGI
         oYyw==
X-Gm-Message-State: AGi0PuYmDw6DUjkyE4PPKCHM/fo2LaGpyyGvR6Ld2Lff6O0npSoq/h/W
        jTyV1Z4gG2tT4Psh5xvszdGWcLmx
X-Google-Smtp-Source: APiQypKGw2Vz9Tvxffcn3c5XyxQUukZ7A5RihXihbDzYqSg/nIK9SbAF1N/+rVjYXWToAQk6f6rlzg==
X-Received: by 2002:a17:90a:6403:: with SMTP id g3mr7628389pjj.99.1587515869181;
        Tue, 21 Apr 2020 17:37:49 -0700 (PDT)
Received: from localhost.localdomain (76-14-109-232.rk.wavecable.com. [76.14.109.232])
        by smtp.gmail.com with ESMTPSA id y16sm1359676pfp.45.2020.04.21.17.37.48
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 17:37:48 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 12/12] utils: fix wrong format
Date:   Tue, 21 Apr 2020 17:37:35 -0700
Message-Id: <20200422003735.3891-12-rosenp@gmail.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200422003735.3891-1-rosenp@gmail.com>
References: <20200422003735.3891-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found with -Wformat-pedantic

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/v4l2-compliance/v4l2-test-formats.cpp | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
index 9e98cf99..390702bc 100644
--- a/utils/v4l2-compliance/v4l2-test-formats.cpp
+++ b/utils/v4l2-compliance/v4l2-test-formats.cpp
@@ -664,10 +664,10 @@ static bool matchFormats(const struct v4l2_format &f1, const struct v4l2_format
 			return true;
 		printf("\t\tG_FMT:     %dx%d@%dx%d, %d, %x, %p, %d, %p, %x\n",
 			win1.w.width, win1.w.height, win1.w.left, win1.w.top, win1.field,
-			win1.chromakey, win1.clips, win1.clipcount, win1.bitmap, win1.global_alpha);
+			win1.chromakey, (void *)win1.clips, win1.clipcount, win1.bitmap, win1.global_alpha);
 		printf("\t\tTRY/S_FMT: %dx%d@%dx%d, %d, %x, %p, %d, %p, %x\n",
 			win2.w.width, win2.w.height, win2.w.left, win2.w.top, win2.field,
-			win2.chromakey, win2.clips, win2.clipcount, win2.bitmap, win2.global_alpha);
+			win2.chromakey, (void *)win2.clips, win2.clipcount, win2.bitmap, win2.global_alpha);
 		return false;
 	case V4L2_BUF_TYPE_VBI_CAPTURE:
 	case V4L2_BUF_TYPE_VBI_OUTPUT:
-- 
2.25.2

