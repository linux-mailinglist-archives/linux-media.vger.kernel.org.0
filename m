Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC9033DD46C
	for <lists+linux-media@lfdr.de>; Mon,  2 Aug 2021 13:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233386AbhHBLBZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Aug 2021 07:01:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232553AbhHBLBY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Aug 2021 07:01:24 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95CB0C0613D5;
        Mon,  2 Aug 2021 04:01:14 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id s22-20020a17090a1c16b0290177caeba067so5243241pjs.0;
        Mon, 02 Aug 2021 04:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SBgORfE72/F8bvZ2E4Lkq7+Ur0TIBEwAuizWaZ2J00o=;
        b=nUF8d8HONixMnqI8KfeSi0XX6vf8czl8bmAdM5TZSurKWyLuq8slGlZ1u/ExTag0wL
         +WL30oVTWsvET+Btxr2a673Ykcm181eET849f3aGJIpKEvwr93Y2UesTHhvG24sNhbMe
         keTVOzXxcwRmlnoWysth40LzL80I6ca33GM/5GM/aiGZk7VbTx2XkHjpSu/L5Yndup13
         myM+rAua1+qQ4fQHRvD1XZyBSCZ3jK1Vz77BruQvm++/e/2drm9tj5QadwfNcBw/GGNi
         a86DwgmmBgqwyhkhfos8IjB3TQiTuI7UdDscFzzdq1VUtowC1HU0fh1f+1GKO7gDZxcs
         0JiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SBgORfE72/F8bvZ2E4Lkq7+Ur0TIBEwAuizWaZ2J00o=;
        b=ndpkFZ2CpZsOsMn9NDjstcYSUGCh6UgH6D0+ihpVGbkAoTxGJSgJ0R3ZjimgUKupae
         WUXToW7WqPwB+XSxhlERoSVLpYHN8hru0VDJTOgEsx9U4lwS7H3i5FwsiKaCpdaUeeZD
         cYcP3B9s8kUPD1CWQ5JkTlxDE+YoSvyBYqXqHyuSaMVV0oyBXnb1JmrU1cf0+jWWgBzu
         Had0eV3Q89IX3Uo6RPTIwIkpsgXiteplhMWZOtpBPq0QN3YyomP3OGcsbyoRPMbzs/FY
         011+6G7kOMOGWTsHfet0aHehCXEnrVxUWotANMsoRZ0hPFung9pR6f/tKp+8vNsWXNjL
         jsKA==
X-Gm-Message-State: AOAM531SZ736Nq6UeIp1b8zGx8d/ZKM7aC6bgW8EZYrBDaCJB23NgPEn
        CqlpkMVwM61kZtffHeL328I=
X-Google-Smtp-Source: ABdhPJwGS8bFSLMvhhOrzq+iAjlK4pB4O1Rc9eIPpiwmKOfHgMBD/1xSQLFZW4Vl2TiTSWMuYQnz0w==
X-Received: by 2002:a17:90a:ab0b:: with SMTP id m11mr16262296pjq.221.1627902074168;
        Mon, 02 Aug 2021 04:01:14 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id v30sm9709158pgk.25.2021.08.02.04.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 04:01:13 -0700 (PDT)
From:   Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
        peterz@infradead.org, mingo@redhat.com, will@kernel.org,
        longman@redhat.com, boqun.feng@gmail.com, sumit.semwal@linaro.org,
        christian.koenig@amd.com
Cc:     Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
        gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [RESEND PATCH v2 1/2] locking/lockdep: Provide lockdep_assert{,_once}() helpers
Date:   Mon,  2 Aug 2021 18:59:56 +0800
Message-Id: <20210802105957.77692-2-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210802105957.77692-1-desmondcheongzx@gmail.com>
References: <20210802105957.77692-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Peter Zijlstra <peterz@infradead.org>

Extract lockdep_assert{,_once}() helpers to more easily write composite
assertions like, for example:

	lockdep_assert(lockdep_is_held(&drm_device.master_mutex) ||
		       lockdep_is_held(&drm_file.master_lookup_lock));

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Acked-by: Boqun Feng <boqun.feng@gmail.com>
Acked-by: Waiman Long <longman@redhat.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/linux/lockdep.h | 41 +++++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index 5cf387813754..9fe165beb0f9 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -306,31 +306,29 @@ extern void lock_unpin_lock(struct lockdep_map *lock, struct pin_cookie);
 
 #define lockdep_depth(tsk)	(debug_locks ? (tsk)->lockdep_depth : 0)
 
-#define lockdep_assert_held(l)	do {					\
-		WARN_ON(debug_locks &&					\
-			lockdep_is_held(l) == LOCK_STATE_NOT_HELD);	\
-	} while (0)
+#define lockdep_assert(cond)		\
+	do { WARN_ON(debug_locks && !(cond)); } while (0)
 
-#define lockdep_assert_not_held(l)	do {				\
-		WARN_ON(debug_locks &&					\
-			lockdep_is_held(l) == LOCK_STATE_HELD);		\
-	} while (0)
+#define lockdep_assert_once(cond)	\
+	do { WARN_ON_ONCE(debug_locks && !(cond)); } while (0)
 
-#define lockdep_assert_held_write(l)	do {			\
-		WARN_ON(debug_locks && !lockdep_is_held_type(l, 0));	\
-	} while (0)
+#define lockdep_assert_held(l)		\
+	lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
 
-#define lockdep_assert_held_read(l)	do {				\
-		WARN_ON(debug_locks && !lockdep_is_held_type(l, 1));	\
-	} while (0)
+#define lockdep_assert_not_held(l)	\
+	lockdep_assert(lockdep_is_held(l) != LOCK_STATE_HELD)
 
-#define lockdep_assert_held_once(l)	do {				\
-		WARN_ON_ONCE(debug_locks && !lockdep_is_held(l));	\
-	} while (0)
+#define lockdep_assert_held_write(l)	\
+	lockdep_assert(lockdep_is_held_type(l, 0))
 
-#define lockdep_assert_none_held_once()	do {				\
-		WARN_ON_ONCE(debug_locks && current->lockdep_depth);	\
-	} while (0)
+#define lockdep_assert_held_read(l)	\
+	lockdep_assert(lockdep_is_held_type(l, 1))
+
+#define lockdep_assert_held_once(l)		\
+	lockdep_assert_once(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
+
+#define lockdep_assert_none_held_once()		\
+	lockdep_assert_once(!current->lockdep_depth)
 
 #define lockdep_recursing(tsk)	((tsk)->lockdep_recursion)
 
@@ -407,6 +405,9 @@ extern int lock_is_held(const void *);
 extern int lockdep_is_held(const void *);
 #define lockdep_is_held_type(l, r)		(1)
 
+#define lockdep_assert(c)			do { } while (0)
+#define lockdep_assert_once(c)			do { } while (0)
+
 #define lockdep_assert_held(l)			do { (void)(l); } while (0)
 #define lockdep_assert_not_held(l)		do { (void)(l); } while (0)
 #define lockdep_assert_held_write(l)		do { (void)(l); } while (0)
-- 
2.25.1

