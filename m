Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C3701BD367
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2020 06:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726045AbgD2EGd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 00:06:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725497AbgD2EGc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 00:06:32 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DC86C03C1AD
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2020 21:06:31 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id fu13so238302pjb.5
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2020 21:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Tix+JDc416wZdNYQbAN7QNgNaU823auhpAJWZ/nMdxI=;
        b=JIt/DX0coHfK2T9gZ6vaK13jCgJqpPhQ3i/xGd3nFlDF1tJdCQaBVXO2+Fogn3I0RF
         PFQSH+mVdwAP49pSuMRzC+rOTC24BXa2pSfWmk7B5yNB6o3mSG5j4BW+154qpJh/jLpt
         IQbFUvP77jI0MPLCuGQL46muS9AEfDkgLJTsabc1D2ni4E2FYaKI6SLnQwIZJaF8nSsz
         0dx/k2szMEC6o45UP7AzeV5g4Y3N49HAJLTbJgLgQOIk5WMowvEOifUctUBXooYgAgpn
         m7f4qtC9ZEITbgmSq5SUW5exY6/43ifGeP81rcRqGBKLPrfpiuTNfsmeydj1zz+fCQ2t
         RolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Tix+JDc416wZdNYQbAN7QNgNaU823auhpAJWZ/nMdxI=;
        b=dfNwAum/xrisFSHDX+ghUtom76qQ4HGuLkQXX0ED5kZSjdHcv2xIEgNKQlxpUnaLdK
         nhS8z5iuywJSXW7vYy2HLCBcdiWO7WCbPh79B8i9pdDtnNAAG59IS59Mp6a9SbCOZHQh
         39SPiDbNaU781F+WFGiGfcWnq7rTNWv9tCpxlx5jTYjh604wUHmAL0KiJnGqag0qibhs
         6bpOfPXzcHxyGi8BrM77OjYnSZMGksjFNWn2RdFNrXs/mLqNLebDUIbdoIBSq1hipLBP
         KW6p4Qq3ZAh0/VXAwenF1RREWFVfL+E1BFyYXcTctQnJ6GJ/U6wHlKJ9nr6MlzwZu7M7
         YCaQ==
X-Gm-Message-State: AGi0PuY9D90wdxBQIEWmfiUETHK5gQZIdr2ZYoZxaNWASxy7IxJ+t0HO
        wAW3eZSBhwrvArd4iCdXD9HJClaw0VI=
X-Google-Smtp-Source: APiQypLRe8tF0TkDIF9cUvmUX88MXSCUpf9u70h7GE84Kg97XxF9dE6NDEA9l3Eo3DtHvoYgOHd37Q==
X-Received: by 2002:a17:90a:fd94:: with SMTP id cx20mr782679pjb.157.1588133190690;
        Tue, 28 Apr 2020 21:06:30 -0700 (PDT)
Received: from localhost.localdomain (76-14-109-232.rk.wavecable.com. [76.14.109.232])
        by smtp.gmail.com with ESMTPSA id i25sm16103370pfo.196.2020.04.28.21.06.30
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 21:06:30 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 2/7] utils: replace strrchr with std variant
Date:   Tue, 28 Apr 2020 21:06:22 -0700
Message-Id: <20200429040627.27859-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200429040627.27859-1-rosenp@gmail.com>
References: <20200429040627.27859-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/cec-ctl/cec-ctl.cpp          | 2 +-
 utils/v4l2-ctl/v4l2-ctl-common.cpp | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
index 7db7ca38..899b83b1 100644
--- a/utils/cec-ctl/cec-ctl.cpp
+++ b/utils/cec-ctl/cec-ctl.cpp
@@ -1651,7 +1651,7 @@ static void stress_test_power_cycle(struct node &node, unsigned cnt,
 
 static int calc_node_val(const char *s)
 {
-	s = strrchr(s, '/') + 1;
+	s = std::strrchr(s, '/') + 1;
 
 	if (!memcmp(s, "cec", 3))
 		return atol(s + 3);
diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
index 764d984a..47f5da1a 100644
--- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
@@ -152,7 +152,7 @@ static int calc_node_val(const char *s)
 {
 	int n = 0;
 
-	s = strrchr(s, '/') + 1;
+	s = std::strrchr(s, '/') + 1;
 
 	for (unsigned i = 0; prefixes[i]; i++) {
 		unsigned l = strlen(prefixes[i]);
-- 
2.25.3

