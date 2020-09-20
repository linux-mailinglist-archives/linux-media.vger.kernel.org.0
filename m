Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11AF42711CF
	for <lists+linux-media@lfdr.de>; Sun, 20 Sep 2020 04:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726805AbgITCuC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Sep 2020 22:50:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726760AbgITCuC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Sep 2020 22:50:02 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F1CCC061755
        for <linux-media@vger.kernel.org>; Sat, 19 Sep 2020 19:50:02 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id m15so5088721pls.8
        for <linux-media@vger.kernel.org>; Sat, 19 Sep 2020 19:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=AAro5MuFlyxpWbC5rTtWxYic0G1KoueUhlbAD8FTuHM=;
        b=cBPjKQ3P1mSD6DBCIOOszySNN0vIKit1GnDsPknaT6Y4qA7pKoGLsQ7p/xIv8P1LIP
         HzDyq7ydI0wE+KrMfyp/X2TGsux2uxVgg5Q4gWZ4S6m016IYKY5Ynn7hcfKeeuch0l52
         koA5nlRpp4KdnNT6LvUY6tNChERgy06/1iFDwdYGA8XYwc/u6joPz5sqSsIKz4pW2jPB
         enugN+irzkDsJ4RPu+MP2GrY++QSHkp82UNsYucI/yL8R9Wj1otCdztRlHtXFp3JtJ1k
         hb7yee86ofGvrWdwnN5KF6FIN8o6aRYp4DBMOw9wGMw1Fghn6nexmRssRbT9FhHHGfVi
         GJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AAro5MuFlyxpWbC5rTtWxYic0G1KoueUhlbAD8FTuHM=;
        b=TOb5JC9wdoqR3dg2v6gixzU2DztxCgPDwk7SeKSEK8uT/DMEAErEC88/oH9is2O4IE
         88z0c4C8g1nRiDW5oUZdbtT/bHumJV4w858x03wqXxkr6yrodORKzJgttAH0Oamuak0N
         +nI/fbjx0/0pH04QMZElRcjQGD52+U6ZlB3wG4q5inGCwbrHrUOsY995QzDulBK+BNSq
         eLZdDuppP++Phb1s5ieib3xPDWmZv3SLvZoz0qGneFsOghnpt5ddNEV9HjtPvE4cyvDK
         28RvLTWjhcKlbuyN1Rj/omTzWlDpxcWA5URD40BiYgjNxT2FRpZzJLoWayeF2heXBJPe
         XW1A==
X-Gm-Message-State: AOAM531SuyeItnnOy6BP6K//+cnRn7C/ywP4+iVqrGdWAhA2bfXYYAKe
        c76cq3uMi7Ro+nEkKu3uI4xxNy60ubARZQ==
X-Google-Smtp-Source: ABdhPJx7vS9gVHolc8jdo49TICGQ+uAA06zCReNQJRvivCN4JwvkK8FTT6VjzNHdxzchP5+fEsXU+Q==
X-Received: by 2002:a17:90a:d90f:: with SMTP id c15mr19777039pjv.160.1600570201431;
        Sat, 19 Sep 2020 19:50:01 -0700 (PDT)
Received: from mangix-trapnet.lan ([2001:470:1f05:79e::a89])
        by smtp.gmail.com with ESMTPSA id bx18sm6814197pjb.6.2020.09.19.19.50.00
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2020 19:50:00 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 2/2][cppcheck: use const references
Date:   Sat, 19 Sep 2020 19:49:58 -0700
Message-Id: <20200920024958.8203-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200920024958.8203-1-rosenp@gmail.com>
References: <20200920024958.8203-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found with constVariable

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/common/media-info.cpp | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/common/media-info.cpp b/utils/common/media-info.cpp
index 5e40bafc2..2d7caf3dd 100644
--- a/utils/common/media-info.cpp
+++ b/utils/common/media-info.cpp
@@ -439,7 +439,7 @@ static __u32 read_topology(int media_fd, __u32 major, __u32 minor,
 			*is_invalid = true;
 		return MEDIA_ENT_F_UNKNOWN;
 	}
-	media_v2_interface &iface = v2_ifaces[i];
+	const media_v2_interface &iface = v2_ifaces[i];
 	for (i = 0; i < topology.num_links; i++) {
 		__u32 type = v2_links[i].flags & MEDIA_LNK_FL_LINK_TYPE;
 
@@ -486,7 +486,7 @@ static __u32 read_topology(int media_fd, __u32 major, __u32 minor,
 	if (is_radio)
 		return MEDIA_ENT_F_UNKNOWN;
 
-	media_v2_entity &ent = v2_ents[i];
+	const media_v2_entity &ent = v2_ents[i];
 	printf("Entity Info:\n");
 	printf("\tID               : 0x%08x (%u)\n", ent.id, ent.id);
 	printf("\tName             : %s\n", ent.name);
-- 
2.26.2

