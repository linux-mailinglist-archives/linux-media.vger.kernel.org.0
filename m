Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B618A5691B9
	for <lists+linux-media@lfdr.de>; Wed,  6 Jul 2022 20:28:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234049AbiGFS1T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jul 2022 14:27:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234028AbiGFS1S (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jul 2022 14:27:18 -0400
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1EE96436
        for <linux-media@vger.kernel.org>; Wed,  6 Jul 2022 11:27:16 -0700 (PDT)
Received: by mail-ua1-x929.google.com with SMTP id u12so3263482uap.11
        for <linux-media@vger.kernel.org>; Wed, 06 Jul 2022 11:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5IdTe03T4AbQW3cQ+frSJyoDxiG9eWKIQ4uCqO8KXZ4=;
        b=a44ubRV55zQ1AZtYKCbVMinunDOe4rwc2pZvSauSYy5diqTxZLw4LVdSpi/sCWmxt1
         QFkHr6JdsWo+xDl7rtVC5oEBYvpgvQFSp9padrA/TJLthCjvZ2QmRM4+jCrssNtDReNn
         sCKs9n0NEKjtPrEdrlpBT4AazVTbw4+e3URQc7B0YRVrL71UkORan40s5NR4ykw8mrz7
         WaTse9b6Kt2wg/EP+ApZ6kt8zi2WKtzcnzxxxAt1ZMWpu82NyCdwSFOPpS00gI14vlb9
         ut4neTFBBpdMKuG9VlA6OrFWLdf2t5iiZ3Q7KQd29FTta2nuF4ADtcVjmwLKpvPeRUvs
         957w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5IdTe03T4AbQW3cQ+frSJyoDxiG9eWKIQ4uCqO8KXZ4=;
        b=ro1ObF8jFAL9iFUlHuJRNgHHOMsVl470F10SJyenAHUK1JnB4WjRmD6s2w/HdaD/G8
         ioC8ep6Xlr38iXG/vwibY4Kg8AJv7+lrEx0+DO+uOzZMsi7rJ8AosHV0NRe9IylIVIao
         tN1WoVnJjZwX1WR7vsUDlIlzfc6fQOC06jWM518UY8GfQS39IzGnb3xR/G5W0O9j6kAV
         GSlCv8Rk+KIBa/B5wjKw7vZPI6ooph1DZSznElSpIntlWSV3JUX8lJUrFfpw9EEePvjI
         PLWodf2oDUr2ik2iEdvxGgEiuWlqoAm6hh8drkau3rzR1X6gRdJqE9+6+HU6bgioJNxv
         PlEg==
X-Gm-Message-State: AJIora+NhjcAfERC0TB1uRc8fDK8wtnbNCxHKqjJbsQobuxRTKD6GfJD
        fwnu40RPc5zJKU+qdnb4JPeIZnVrbNxmtSc9
X-Google-Smtp-Source: AGRyM1vejyMjrY8q5Bjgz6aa4ackRpzH3NS3rC3B3F2Wtht3Ptl8sWiaNRGi38LCC0c/FymCA6Dogg==
X-Received: by 2002:a9f:35ef:0:b0:37f:18d2:4578 with SMTP id u44-20020a9f35ef000000b0037f18d24578mr20821637uad.65.1657132035461;
        Wed, 06 Jul 2022 11:27:15 -0700 (PDT)
Received: from zeta-build.. ([190.190.187.68])
        by smtp.gmail.com with ESMTPSA id bl9-20020a056102508900b003563680212asm7445539vsb.27.2022.07.06.11.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 11:27:15 -0700 (PDT)
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 1/8] videobuf2: Introduce vb2_find_buffer()
Date:   Wed,  6 Jul 2022 15:26:50 -0300
Message-Id: <20220706182657.210650-2-ezequiel@vanguardiasur.com.ar>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20220706182657.210650-1-ezequiel@vanguardiasur.com.ar>
References: <20220706182657.210650-1-ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Ezequiel Garcia <ezequiel@collabora.com>

All users of vb2_find_timestamp() combine it with vb2_get_buffer()
to retrieve a videobuf2 buffer, given a u64 timestamp.

Introduce an API for this use-case. Users will be converted to the new
API as follow-up commits.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 include/media/videobuf2-v4l2.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/media/videobuf2-v4l2.h b/include/media/videobuf2-v4l2.h
index d818d9707695..7f9ae5b39b78 100644
--- a/include/media/videobuf2-v4l2.h
+++ b/include/media/videobuf2-v4l2.h
@@ -78,6 +78,24 @@ struct vb2_v4l2_buffer {
 int vb2_find_timestamp(const struct vb2_queue *q, u64 timestamp,
 		       unsigned int start_idx);
 
+/**
+ * vb2_find_buffer() - Find a buffer with given timestamp
+ *
+ * @q:		pointer to &struct vb2_queue with videobuf2 queue.
+ * @timestamp:	the timestamp to find.
+ *
+ * Returns the buffer with the given @timestamp, or NULL if not found.
+ */
+static inline struct vb2_buffer *vb2_find_buffer(struct vb2_queue *q,
+						 u64 timestamp)
+{
+	int index = vb2_find_timestamp(q, timestamp, 0);
+
+	if (index < 0)
+		return NULL;
+	return vb2_get_buffer(q, index);
+}
+
 int vb2_querybuf(struct vb2_queue *q, struct v4l2_buffer *b);
 
 /**
-- 
2.34.3

