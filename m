Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB28F1B1511
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 20:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728130AbgDTSq4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 14:46:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728118AbgDTSqz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 14:46:55 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A883C061A10
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2020 11:46:55 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id x3so5371462pfp.7
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2020 11:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=YMKCiBqOo3NYeVY2TxxXAO5i0dheV6Bw/cbrfxZRXk8=;
        b=IPjH7gfz8PHBS2a1xbaP/i5y0daI/qVxVqctG0H95pcgdvmeJbcUVfVhWw84lEFjn2
         fcqczc7S+RoT+jH0ZeQMJ8yFuD4nB8X6KP68/2x/dxljriXRU1Jbag7hpZ5WswNJ+EWW
         979q1bXJc5ydByFX8NpXS0nO2WHj2Kasis0MMGl0a2JSTFEx9H1/YXyOjJR3sKDMRqYy
         J0zUgM+aGCjxkki8FcAyHcpKofrrYuTuaPHnYrpgzK+6u7/YO5O052C8fgwT68/4kxAJ
         hZxpBPahfRpmzP3PseXOXYalDNGYiywKlxr1Q7AeoqcR4Q39NgLbS/YHHmieAVH6GGoR
         vAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YMKCiBqOo3NYeVY2TxxXAO5i0dheV6Bw/cbrfxZRXk8=;
        b=Y9QBiyWZ+sbI8F4zbB/a8LIac2i7dNAAQVUuJjaXjp+moiJMY69ML1mKRfD8ixsdnq
         bddkAvSxlBmPPNhtayLXXQYoKyB21cZahy0aKe8knOOQz22EVZ6tdWlPs6EKi+5BPgfJ
         teZUZ1ZQwjL/8eOnjOQjXbqtYF30EFPROQ5/n1FxmazwYvQ2cfGlCtjJ9nJmlkSY3i0S
         y4SFR/7pHdPUQgqWsB4XW1sULkNQnmwhBzunAk4iiPoX/XSQSCwnCuNorTUUjJnpwWiG
         d3uzbPpYGZ7kJuFPpbYNM3bmP1ZTxTF7yTYFKKNHFbxlQDStDOF8K+SQHxnQuP2nskIs
         1fGQ==
X-Gm-Message-State: AGi0PubocgKdAyZyf8Nt6Id4FEFV7ER6wx2qP/+20ACzBMG6J4NhLFPM
        Sy5wwEZg/DY2p7TznvYY74UZpefL
X-Google-Smtp-Source: APiQypIAk/Na4lvV5wIF+8hRm8zaguXIOnrdZZV6YIugM+bCIOyZbMOE9GMif5CrW5Wv+bbVd+8m9A==
X-Received: by 2002:a63:5fd0:: with SMTP id t199mr18145536pgb.207.1587408414717;
        Mon, 20 Apr 2020 11:46:54 -0700 (PDT)
Received: from localhost.localdomain (76-14-109-232.rk.wavecable.com. [76.14.109.232])
        by smtp.gmail.com with ESMTPSA id n8sm182443pfq.213.2020.04.20.11.46.54
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 11:46:54 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 4/7] treewide: apply performance fixes
Date:   Mon, 20 Apr 2020 11:46:46 -0700
Message-Id: <20200420184649.4202-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200420184649.4202-1-rosenp@gmail.com>
References: <20200420184649.4202-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found with performance*

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/v4l2-compliance/v4l2-compliance.cpp | 2 +-
 utils/v4l2-compliance/v4l2-compliance.h   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index 0c3af294..bb32bae6 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -301,7 +301,7 @@ int check_0(const void *p, int len)
 static std::map<std::string, std::string> stream_from_map;
 static std::map<std::string, bool> stream_hdr_map;
 
-std::string stream_from(std::string pixelformat, bool &use_hdr)
+std::string stream_from(const std::string& pixelformat, bool &use_hdr)
 {
 	if (stream_from_map.find(pixelformat) == stream_from_map.end()) {
 		if (pixelformat.empty())
diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
index 43754519..921e15be 100644
--- a/utils/v4l2-compliance/v4l2-compliance.h
+++ b/utils/v4l2-compliance/v4l2-compliance.h
@@ -263,7 +263,7 @@ int check_0(const void *p, int len);
 int restoreFormat(struct node *node);
 void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_node, media_type type,
 	      unsigned frame_count, unsigned all_fmt_frame_count);
-std::string stream_from(std::string pixelformat, bool &use_hdr);
+std::string stream_from(const std::string& pixelformat, bool &use_hdr);
 
 // Media Controller ioctl tests
 int testMediaDeviceInfo(struct node *node);
-- 
2.25.2

