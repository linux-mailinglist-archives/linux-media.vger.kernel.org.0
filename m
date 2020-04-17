Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D65681AE76A
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 23:16:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727974AbgDQVQQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 17:16:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726723AbgDQVQN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 17:16:13 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F03BC061A0C
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2020 14:16:13 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id v2so1400831plp.9
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2020 14:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+iHz23kiiUry6ZfoYWOiibljR+KVP7PQdbEgEJagytA=;
        b=gocAVwiQPq42P9bYSZOs9dZCMxqI4bmkQFVOsr2P9bTwWt6revgVl3okDMlThB/Td7
         +i9omrSiDxvXIBhMwd5gsPuBEKZ0jOVQ/tKO0SlEgro1spVIrHFeNV8IRx1qysbe8tMv
         d5LKyhizn2+4zQEizzrw5/TYhfohbawsS9dzJTl5MsIFEQKIReM2noO85jcO6bPb/UQp
         FjkEJDBOoea97mfBpDxkiAw6eWmtQTjMWm87DkkLr6qc9HPyyIhK4VF0auCGbitEQZ0X
         lrlrxsmD5gw+Nq5w4W4AnybS7QcQ3CCN0R6JNo+DDTvhdZf6jbZvWELjzpsBkGl2LcWC
         gpsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+iHz23kiiUry6ZfoYWOiibljR+KVP7PQdbEgEJagytA=;
        b=cY6nHO7EcTKTNdOrqHH+T2hnb3Z/M1NTYyJkQ0+HX4kjfvqPCA8hvayW2xoDYFmJOQ
         ufqDz//qiYyUJNlohxONxDGzKHdayWgShJW5mwWNk0YKyoaoxTUjVsMUhNxP7tJ9A2ME
         icmWDyJXPlAsQ696K0ZuATKo2xOfp7quS0RBYYwuliNz3GbXZOVJoMzw6hJ9ARiAzAqU
         HY5sw7Uhxx2DL+KyOS0Mqo498w0tuXNDzRJRD371sYRYm/Qp2+fiGgSzQpjb27JGHZfj
         Vc+8q+Xss/3wHmb6fBw4xZGSFzcVxfS94TC8f8hM09HOtgxiVUVFjxewpp83T6rdJxq9
         AWnw==
X-Gm-Message-State: AGi0PuYMOfFuO1JfS3ydu2Skx+gO9o/VLJxGMO9Qci43OoBff2qvuS6y
        FMFAjn+35uABtoL+SdwXYOofHVxTMYA=
X-Google-Smtp-Source: APiQypLL+V2ZJLGXOn67IojdYsanW25yGzaBXru4+HIb4c6V8SScGs+CUS/ooLzMfX+49nXVhiApLQ==
X-Received: by 2002:a17:90a:210b:: with SMTP id a11mr7055744pje.31.1587158172925;
        Fri, 17 Apr 2020 14:16:12 -0700 (PDT)
Received: from localhost.localdomain (astound-69-42-19-227.ca.astound.net. [69.42.19.227])
        by smtp.gmail.com with ESMTPSA id m3sm19351641pgt.27.2020.04.17.14.16.12
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 14:16:12 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH] treewide: fix wrong identation
Date:   Fri, 17 Apr 2020 14:16:11 -0700
Message-Id: <20200417211611.4588-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found with clang-tidy's readability-misleading-indentation

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 lib/libdvbv5/dvb-demux.c                  | 9 +++++----
 lib/libdvbv5/dvb-dev-local.c              | 2 +-
 utils/v4l2-compliance/v4l2-compliance.cpp | 3 ++-
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/lib/libdvbv5/dvb-demux.c b/lib/libdvbv5/dvb-demux.c
index d3534293..ff710456 100644
--- a/lib/libdvbv5/dvb-demux.c
+++ b/lib/libdvbv5/dvb-demux.c
@@ -178,15 +178,16 @@ int dvb_get_pmt_pid(int patfd, int sid)
 
 	while (!patread){
 		if (((count = read(patfd, buf, sizeof(buft))) < 0) && errno == EOVERFLOW)
-		count = read(patfd, buf, sizeof(buft));
+			count = read(patfd, buf, sizeof(buft));
+
 		if (count < 0) {
-		perror("read_sections: read error");
-		return -1;
+			perror("read_sections: read error");
+			return -1;
 		}
 
 		section_length = ((buf[1] & 0x0f) << 8) | buf[2];
 		if (count != section_length + 3)
-		continue;
+			continue;
 
 		buf += 8;
 		section_length -= 8;
diff --git a/lib/libdvbv5/dvb-dev-local.c b/lib/libdvbv5/dvb-dev-local.c
index e98b967a..fa185cda 100644
--- a/lib/libdvbv5/dvb-dev-local.c
+++ b/lib/libdvbv5/dvb-dev-local.c
@@ -748,7 +748,7 @@ static int dvb_local_dmx_get_pmt_pid(struct dvb_open_descriptor *open_dev, int s
 
 		section_length = ((buf[1] & 0x0f) << 8) | buf[2];
 		if (count != section_length + 3)
-		continue;
+			continue;
 
 		buf += 8;
 		section_length -= 8;
diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index ed152fce..3983a8a8 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -428,7 +428,8 @@ static void restoreState()
 	if (node->has_outputs) {
 		node->s_output(state.output.index);
 		if (state.output.audioset)
-		node->s_audout(state.aoutput.index);
+			node->s_audout(state.aoutput.index);
+
 		if (node->g_caps() & V4L2_CAP_MODULATOR) {
 			node->s_modulator(state.modulator);
 			node->s_frequency(state.freq);
-- 
2.25.2

