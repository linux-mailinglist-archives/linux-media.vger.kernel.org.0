Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1A9739B088
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 04:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbhFDCoE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Jun 2021 22:44:04 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:42779 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbhFDCoE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Jun 2021 22:44:04 -0400
Received: by mail-pj1-f65.google.com with SMTP id l23-20020a17090a0717b029016ae774f973so4391918pjl.1
        for <linux-media@vger.kernel.org>; Thu, 03 Jun 2021 19:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:in-reply-to:references:content-transfer-encoding;
        bh=JmcmQOQ5frLxEaakr6DWk0TV8VbyRPrIy9jBJZW1SDc=;
        b=H46wvLXY8FUml/zz4D00ux4Xqcmvawb0nRRaBucz5gx7mioYuZ567c/Fj/PM39NapB
         jBoK6y1lgc9mg3d7mdsrEqcC2/SHq+dPP4GrUlEFYyY+UqhpNiGvppxqlxzi2orHQshW
         LVlClafUwOzWZyIga2+0Ukw6cxrODy+5yoU0iyo5h4ic7Xg3udNuBrawHLSoL8XTESOw
         0mIR7cyeYDKTKxUam+A7kad/jcuvHON229PdPsUCeXnlqb1EGQKFYcsn/hzx9l+8hRJG
         wtexuq+VL3UtiuBPdLUWKRglHysNld+cJ+teviZycpLs+Z05YquSlhh6uGkti6B4YZx9
         c3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:in-reply-to:references
         :content-transfer-encoding;
        bh=JmcmQOQ5frLxEaakr6DWk0TV8VbyRPrIy9jBJZW1SDc=;
        b=VDK+kpTz/bKPhmb3j1YPPMGkKgV2/fLHp0w+DDOyNJCotLgFeXAtjYFAcC5Cpe7c6I
         NjIPMtM+kywiYJeTs6U1T7IKFu/AuEeNahIuhBDk4Ya1vCTj+ODWrkcP9X14JoL8NqtA
         7uQ7XmvC7ljaH+VoL/RJZeesEOtxSzDw1sEVsrgJ11zaeK5lafe/cKeq9RZjbICNNg/K
         WaMJBOKvnDkzBUvtrqqAZK8uqjyAgU3Gc00DVjg2aDS3DC7fa4d80QM8zkC9nCjkyYwI
         xOsU+EhurLxHtElGjCSEThYIIWp7/zulVvae6PMfcLdaSOV3OwnwlhJnbijzp8gAgz63
         vkfA==
X-Gm-Message-State: AOAM531UUR17a5OtnBO7NZh+QHtU93yg8upPvFtr7FB6laLWn35q0io+
        WYWdJRVHRyh2o15Azj1voB4AaJxSQKJl6w==
X-Google-Smtp-Source: ABdhPJykLc7PNAudaucoCSQrNfJ8KU3hqp6KzpKLMVeovJqN7hf84/X2gCUZpp7zkcrmJHqT1MQi4w==
X-Received: by 2002:a17:902:a983:b029:fb:973:956a with SMTP id bh3-20020a170902a983b02900fb0973956amr2121247plb.79.1622774466106;
        Thu, 03 Jun 2021 19:41:06 -0700 (PDT)
Received: from djbComp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id z9sm3166356pji.47.2021.06.03.19.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 19:41:05 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, jaffe1@gmail.com,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v4 1/2] cec-follower: emulate features for CEC versions < CEC 2.0
Date:   Thu,  3 Jun 2021 19:40:52 -0700
Message-Id: <fdf4a535983de1c55e73767796c29c290d641202.1622773904.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1622773904.git.deborahbrouwer3563@gmail.com>
References: <cover.1622773904.git.deborahbrouwer3563@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1622773904.git.deborahbrouwer3563@gmail.com>
References: <cover.1622773904.git.deborahbrouwer3563@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For CEC adapters using versions < CEC 2.0, read the CEC Features
as configured in the CEC adapter and emulate the features that are
present.

Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
---
 utils/cec-follower/cec-follower.cpp | 42 ++++++++++++++++-------------
 utils/libcecutil/cec-info.cpp       |  2 --
 2 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
index b7a41ac2..1f598fdf 100644
--- a/utils/cec-follower/cec-follower.cpp
+++ b/utils/cec-follower/cec-follower.cpp
@@ -508,26 +508,30 @@ int main(int argc, char **argv)
 
 	cec_driver_info(caps, laddrs, node.phys_addr, conn_info);
 
-	if (laddrs.cec_version >= CEC_OP_CEC_VERSION_2_0) {
-		bool is_dev_feat = false;
-
-		for (__u8 byte : laddrs.features[0]) {
-			if (is_dev_feat) {
-				node.source_has_arc_rx = (byte & CEC_OP_FEAT_DEV_SOURCE_HAS_ARC_RX) != 0;
-				node.sink_has_arc_tx = (byte & CEC_OP_FEAT_DEV_SINK_HAS_ARC_TX) != 0;
-				node.has_aud_rate = (byte & CEC_OP_FEAT_DEV_HAS_SET_AUDIO_RATE) != 0;
-				node.has_deck_ctl = (byte & CEC_OP_FEAT_DEV_HAS_DECK_CONTROL) != 0;
-				node.has_rec_tv = (byte & CEC_OP_FEAT_DEV_HAS_RECORD_TV_SCREEN) != 0;
-				node.has_osd_string = (byte & CEC_OP_FEAT_DEV_HAS_SET_OSD_STRING) != 0;
-				break;
-			}
-			if (byte & CEC_OP_FEAT_EXT)
-				continue;
-			if (!is_dev_feat)
-				is_dev_feat = true;
-			else
-				break;
+	/*
+	 * For CEC 1.4, features of a logical address may still be
+	 * filled in according to the CEC 2.0 guidelines even though
+	 * the CEC framework won’t use the features in the CEC 2.0
+	 * CEC_MSG_REPORT_FEATURES.
+	 */
+	bool is_dev_feat = false;
+
+	for (__u8 byte : laddrs.features[0]) {
+		if (is_dev_feat) {
+			node.source_has_arc_rx = (byte & CEC_OP_FEAT_DEV_SOURCE_HAS_ARC_RX) != 0;
+			node.sink_has_arc_tx = (byte & CEC_OP_FEAT_DEV_SINK_HAS_ARC_TX) != 0;
+			node.has_aud_rate = (byte & CEC_OP_FEAT_DEV_HAS_SET_AUDIO_RATE) != 0;
+			node.has_deck_ctl = (byte & CEC_OP_FEAT_DEV_HAS_DECK_CONTROL) != 0;
+			node.has_rec_tv = (byte & CEC_OP_FEAT_DEV_HAS_RECORD_TV_SCREEN) != 0;
+			node.has_osd_string = (byte & CEC_OP_FEAT_DEV_HAS_SET_OSD_STRING) != 0;
+			break;
 		}
+		if (byte & CEC_OP_FEAT_EXT)
+			continue;
+		if (!is_dev_feat)
+			is_dev_feat = true;
+		else
+			break;
 	}
 	printf("\n");
 
diff --git a/utils/libcecutil/cec-info.cpp b/utils/libcecutil/cec-info.cpp
index 8b3c55e8..3c768261 100644
--- a/utils/libcecutil/cec-info.cpp
+++ b/utils/libcecutil/cec-info.cpp
@@ -448,8 +448,6 @@ void cec_driver_info(const struct cec_caps &caps,
 		       cec_prim_type2s(laddrs.primary_device_type[i]));
 		printf("\t    Logical Address Type   : %s\n",
 		       cec_la_type2s(laddrs.log_addr_type[i]));
-		if (laddrs.cec_version < CEC_OP_CEC_VERSION_2_0)
-			continue;
 		printf("\t    All Device Types       : %s\n",
 		       cec_all_dev_types2s(laddrs.all_device_types[i]).c_str());
 
-- 
2.17.1

