Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B0AE3B3A0E
	for <lists+linux-media@lfdr.de>; Fri, 25 Jun 2021 02:13:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbhFYAPs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 20:15:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbhFYAPs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 20:15:48 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2DF0C061574
        for <linux-media@vger.kernel.org>; Thu, 24 Jun 2021 17:13:27 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id 21so6627708pfp.3
        for <linux-media@vger.kernel.org>; Thu, 24 Jun 2021 17:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lITQes0iBLiJqo64kQcf6MfY2419xehwB0F4UXUdPlU=;
        b=c4XG5SeHflHUgvXIXN26J+oFXM5bzGY3W9seO8M+VMrZq8yuiPC5mgQ2pz2luR0fsW
         rJufH93B0DTzR9q0LTNB7WsgKLqDPT5Waq5vmGZGZb5Pg+pf8MYQ/iUZL31Lvn2ij1o2
         NDtdu94OgYVheShb49jgz788vrF6uZxirC1CAvaSnlKkZwaXyh0p5QbfGn2bP602zzPO
         mEMmSPW43Vi0MQsndXRKjfD5HUz7X5aVsdYCYBP9trj167zraSY+koGPeDeHwD1JvRZN
         bmRRoFwp0Io3vFyl3EtjNY9WOqAOh+4OQtyYff5LfF6zM76X9CBn1vPgKb0E1aAzh3KB
         bsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lITQes0iBLiJqo64kQcf6MfY2419xehwB0F4UXUdPlU=;
        b=DcC0Tupxc7jqj9/zvm4IepJZB25pjmHbG0Ku0pvTaG/UijN9mP68vAly5aPaCr6Mlc
         8Z2b5VqJiBwM3ZbCUqbNfGm3aFPtrZlNWB5zOFqarYMmF5dixErtXChLUmQ8oA8iFkob
         6hfC9BdN+IR7dheBFmJWH37ILc/ZV5NZgWqHld0+Bnk0oyUBbQiyfx4GD3O+dsZ80LAu
         Ztr19CRuqjNBUphPEJZs9pWBtO+1QKwvDtBNFPPI3WVauWvNwsShPlnwx4KrUVbghU0B
         pyEvI6K5k8baQfDSNQ0VkduSxPVComvfq2/qUpedZlqDF3AObhcr2wwUVxFA9ep3U75f
         HUjg==
X-Gm-Message-State: AOAM533tJ+7lI2mdf+/FK9HbjzFrM0S73Cm0CyZIamXH2FyJCRbLInfD
        7L4N0TIRG/tCWQVwlzXKWCGnt2yN8w09yw==
X-Google-Smtp-Source: ABdhPJy95eT1vM/DVFeGWQMOXSoLw48RRfx+vfGUlMwKz8ii2Ud+1ZSPvpa6oJ0vJSnx+l/V5u4qig==
X-Received: by 2002:a63:c058:: with SMTP id z24mr7137557pgi.264.1624580007499;
        Thu, 24 Jun 2021 17:13:27 -0700 (PDT)
Received: from ada-comp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id h22sm3799060pfc.21.2021.06.24.17.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 17:13:27 -0700 (PDT)
From:   Deborah Brouwer <deborahbrouwer3563@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, jaffe1@gmail.com,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH v5 1/3] cec-follower: use log_addr_type to get local device type
Date:   Thu, 24 Jun 2021 17:13:09 -0700
Message-Id: <b40d7dbedb87240a2bd58b2a0ab28158c8a7d4c5.1624578960.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1624578960.git.deborahbrouwer3563@gmail.com>
References: <cover.1624578960.git.deborahbrouwer3563@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A device may use a Backup logical address (aka Reserved in CEC
Version < 2.0) if the logical addresses that the device would normally
used are unavailable. Since a Backup logical address is not unique to any
device type, it cannot be used to determine the device type of the
follower. Instead use the more accurate log_addr_type as returned by
CEC_ADAP_G_LOG_ADDRS to find the device type.

Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
---
 utils/cec-follower/cec-follower.h     | 2 +-
 utils/cec-follower/cec-processing.cpp | 7 ++++---
 utils/cec-follower/cec-tuner.cpp      | 2 +-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/utils/cec-follower/cec-follower.h b/utils/cec-follower/cec-follower.h
index 3fa95417..343ae998 100644
--- a/utils/cec-follower/cec-follower.h
+++ b/utils/cec-follower/cec-follower.h
@@ -222,7 +222,7 @@ void sad_encode(const struct short_audio_desc *sad, __u32 *descriptor);
 
 // cec-tuner.cpp
 void tuner_dev_info_init(struct state *state);
-void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me);
+void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me, __u8 type);
 
 // CEC processing
 void reply_feature_abort(struct node *node, struct cec_msg *msg,
diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
index 41bb990c..b1c8f3d9 100644
--- a/utils/cec-follower/cec-processing.cpp
+++ b/utils/cec-follower/cec-processing.cpp
@@ -271,7 +271,7 @@ static void update_deck_state(struct node *node, unsigned me, __u8 deck_state_ne
 	}
 }
 
-static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
+static void processMsg(struct node *node, struct cec_msg &msg, unsigned me, __u8 type)
 {
 	__u8 to = cec_msg_destination(&msg);
 	__u8 from = cec_msg_initiator(&msg);
@@ -672,7 +672,7 @@ static void processMsg(struct node *node, struct cec_msg &msg, unsigned me)
 	case CEC_MSG_SET_TIMER_PROGRAM_TITLE:
 	case CEC_MSG_TIMER_CLEARED_STATUS:
 	case CEC_MSG_TIMER_STATUS:
-		process_tuner_record_timer_msgs(node, msg, me);
+		process_tuner_record_timer_msgs(node, msg, me, type);
 		return;
 
 		/* Dynamic Auto Lipsync */
@@ -1009,6 +1009,7 @@ void testProcessing(struct node *node, bool wallclock)
 	doioctl(node, CEC_S_MODE, &mode);
 	doioctl(node, CEC_ADAP_G_LOG_ADDRS, &laddrs);
 	me = laddrs.log_addr[0];
+	__u8 type = laddrs.log_addr_type[0];
 
 	poll_remote_devs(node, me);
 
@@ -1088,7 +1089,7 @@ void testProcessing(struct node *node, bool wallclock)
 					       msg.sequence, ts2s(msg.rx_ts, wallclock).c_str());
 			}
 			if (node->adap_la_mask)
-				processMsg(node, msg, me);
+				processMsg(node, msg, me, type);
 		}
 
 		__u8 pwr_state = current_power_state(node);
diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index b9c21684..d1718986 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -482,7 +482,7 @@ static bool analog_set_tuner_dev_info(struct node *node, struct cec_msg *msg)
 	return false;
 }
 
-void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me)
+void process_tuner_record_timer_msgs(struct node *node, struct cec_msg &msg, unsigned me, __u8 type)
 {
 	bool is_bcast = cec_msg_is_broadcast(&msg);
 
-- 
2.25.1

