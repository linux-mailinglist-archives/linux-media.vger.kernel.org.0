Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE08522E44D
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 05:15:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728017AbgG0DPD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jul 2020 23:15:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728005AbgG0DPC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jul 2020 23:15:02 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72957C0619D2
        for <linux-media@vger.kernel.org>; Sun, 26 Jul 2020 20:15:02 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id x9so7282435plr.2
        for <linux-media@vger.kernel.org>; Sun, 26 Jul 2020 20:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=62pANw/ml//RnU8vL+cJAWOPfu/VyBCsRu2W1LT4GIw=;
        b=e/ekYuEhEmBU7PxAie9b8+jpw6vqMbi7kn8+F1xLZlLUbZr9EUjwHhd+HUdYIWAYIa
         kPImGwBqBkY/0vuPkM01HZGqkz4MmcZn8E5AIIp8DgrVCjLWzoR6s+5VHSMaSkjG30Zx
         K+h72l4ntWVbeRurarnqFGnSjJh5flv5yMe/tWXr5Vwppopym5boLQIs8uc+BuDnzykL
         leuIhob1sI0MrU4cMZ0rjZ0uOp3q+JiQCLid25lWG5CSwrPRasgSHOfQHbqp3oUpQ3xK
         Emjol+xa9NQeUR8astK6hUMxw62MC6W1onwje0J18dNZA0sDoYw7B14PV7Vo8aRppOoQ
         QfFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=62pANw/ml//RnU8vL+cJAWOPfu/VyBCsRu2W1LT4GIw=;
        b=oDxHGlbTuq4XNu3zzPAZnLD3QTsHlVQ4BT1Msjvq8h/3KXbOEPK/Qax6W9N4Q6DnEg
         KFUlt2ixM8r4hRFsmhmgIGTsgGK5aLM0JYaZVq2zgWJE0CCdeP9YN+fpKorU+1Y1nl4H
         SN0Adqb92LlaXuD+DrMAWbYozUzUZBbP1tKiZh0bRhb8Ut4l3ouOfBagyrqNvHdvxt3H
         pqjjSfERP6yNEffBYxqGmiXiwpTkT8su7tamUDY1st32jLyPDH9z0mwyDY5rUISgbfua
         lZ0U80uY3m73L+9dtPF9CS6hvnb0fvh1QRGGvyOZAnfpC7TTnF6uwJEBpoglhnTR8f9p
         3NyA==
X-Gm-Message-State: AOAM532WfWKcpFmaN0A1p4KlOLgG9WPw3OHozMWviryNKdfnebig6fWb
        GnM86f7EVVhqrenrIehyiQDDOryC74c=
X-Google-Smtp-Source: ABdhPJwhq0QZ2gre0xKg+7UPGb7iS6lmmlLbpt1dykQQQjceMG5s+DGefJ1DIEoHDxsappfqbsn6oQ==
X-Received: by 2002:a17:902:ed14:: with SMTP id b20mr18253970pld.25.1595819701764;
        Sun, 26 Jul 2020 20:15:01 -0700 (PDT)
Received: from mangix-trapnet.lan ([2001:470:1f05:79e::a89])
        by smtp.gmail.com with ESMTPSA id t126sm13259345pfd.214.2020.07.26.20.15.00
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 20:15:00 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 4/8] [clang-tidy] use using instead of typedef
Date:   Sun, 26 Jul 2020 20:14:52 -0700
Message-Id: <20200727031456.232955-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200727031456.232955-1-rosenp@gmail.com>
References: <20200727031456.232955-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found with modernize-use-using

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/cec-ctl/cec-ctl.cpp                 |  4 ++--
 utils/rds-ctl/rds-ctl.cpp                 |  2 +-
 utils/v4l2-compliance/v4l2-test-media.cpp |  2 +-
 utils/v4l2-ctl/v4l2-ctl-common.cpp        | 14 +++++++-------
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
index 8ae800bb..0cdab383 100644
--- a/utils/cec-ctl/cec-ctl.cpp
+++ b/utils/cec-ctl/cec-ctl.cpp
@@ -1749,8 +1749,8 @@ static __u16 parse_phys_addr_from_edid(const char *edid_path)
 	return pa;
 }
 
-typedef std::vector<std::string> dev_vec;
-typedef std::map<std::string, std::string> dev_map;
+using dev_vec = std::vector<std::string>;
+using dev_map = std::map<std::string, std::string>;
 
 static void list_devices()
 {
diff --git a/utils/rds-ctl/rds-ctl.cpp b/utils/rds-ctl/rds-ctl.cpp
index 12ec8bae..f58c1fa2 100644
--- a/utils/rds-ctl/rds-ctl.cpp
+++ b/utils/rds-ctl/rds-ctl.cpp
@@ -39,7 +39,7 @@
 #define ARRAY_SIZE(arr) ((int)(sizeof(arr) / sizeof((arr)[0])))
 
 typedef std::vector<std::string> dev_vec;
-typedef std::map<std::string, std::string> dev_map;
+using dev_map = std::map<std::string, std::string>;
 
 /* Short option list
 
diff --git a/utils/v4l2-compliance/v4l2-test-media.cpp b/utils/v4l2-compliance/v4l2-test-media.cpp
index f5101e33..acbee331 100644
--- a/utils/v4l2-compliance/v4l2-test-media.cpp
+++ b/utils/v4l2-compliance/v4l2-test-media.cpp
@@ -322,7 +322,7 @@ static media_link_desc link_disabled;
 
 int testMediaEnum(struct node *node)
 {
-	typedef std::map<__u32, media_entity_desc> entity_map;
+	using entity_map = std::map<__u32, media_entity_desc>;
 	entity_map ent_map;
 	id_set has_default_set;
 	struct media_entity_desc ent;
diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
index c8705a04..8ecfa972 100644
--- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
@@ -34,22 +34,22 @@ struct ctrl_subset {
 
 typedef std::map<unsigned, std::vector<struct v4l2_ext_control> > class2ctrls_map;
 
-typedef std::map<std::string, struct v4l2_query_ext_ctrl> ctrl_qmap;
+using ctrl_qmap = std::map<std::string, struct v4l2_query_ext_ctrl>;
 static ctrl_qmap ctrl_str2q;
-typedef std::map<unsigned, std::string> ctrl_idmap;
+using ctrl_idmap = std::map<unsigned int, std::string>;
 static ctrl_idmap ctrl_id2str;
 
-typedef std::map<std::string, ctrl_subset> ctrl_subset_map;
+using ctrl_subset_map = std::map<std::string, ctrl_subset>;
 static ctrl_subset_map ctrl_subsets;
 
-typedef std::list<std::string> ctrl_get_list;
+using ctrl_get_list = std::list<std::string>;
 static ctrl_get_list get_ctrls;
 
-typedef std::map<std::string, std::string> ctrl_set_map;
+using ctrl_set_map = std::map<std::string, std::string>;
 static ctrl_set_map set_ctrls;
 
-typedef std::vector<std::string> dev_vec;
-typedef std::map<std::string, std::string> dev_map;
+using dev_vec = std::vector<std::string>;
+using dev_map = std::map<std::string, std::string>;
 
 static enum v4l2_priority prio = V4L2_PRIORITY_UNSET;
 
-- 
2.26.2

