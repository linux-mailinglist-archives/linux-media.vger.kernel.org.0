Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28D377A6611
	for <lists+linux-media@lfdr.de>; Tue, 19 Sep 2023 16:01:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232507AbjISOBi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Sep 2023 10:01:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232437AbjISOBh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Sep 2023 10:01:37 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2202EEC
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 07:01:28 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9a6190af24aso767050766b.0
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 07:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695132086; x=1695736886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6oRwCzhtluh7KJMF5lT3XS9ae5EYBgE3uoXqIs8NKgc=;
        b=WZ0wzhlM5QtAMOqBUUbci/ZS0d8MiQgDAPApgcgKx5WrEd7s/Pvb9RawSHIFYZrqiz
         JQaek/C+9dI5xVu35gxwZm+slnvUo5zhrcVV+0l8bXl7sZkEl03L4iMlQ+eamN8066o4
         7UcxSpzqHN1OZH59Pxc933aa6jS5PKcEKKQEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695132086; x=1695736886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6oRwCzhtluh7KJMF5lT3XS9ae5EYBgE3uoXqIs8NKgc=;
        b=i5AxefEZcXqxGmjiViXURU2djsukCtt0CijNx9M17gYoLn8MJ2P1PelEgU7B5E2fhM
         i/7YnUoWum58qUVz0EJCEpz4iFud6BwqgYKnfgOpr0tgznj4nx6IzSSPsOgQdvuBQjsf
         qwa9R3jQYGmY9G+wJXwM0e8sNLZrmqk7Uyo7QIunIzVywalsTg825kj2mOAxcQPy0RAZ
         KNRcK5011HoHlzv1sxIYVBJ+D/yxLYhs18PCPEPDLoeM/rNXN+Se/8ePnrVbbB42PxHr
         b83MMMlhonZLfnGXJDlyEKBZ/wqBhW9Riaji1zmjo+chRU7sdiL3NDKd/inV6OmRDmag
         MYMw==
X-Gm-Message-State: AOJu0Yy+57MzPjgX287F03lRP6mfVr4fXQ6dhUFvZRlKnZD+1a1qPzI4
        mIIIdBsNGRFIQqsMPnJxkOvEpbIDAsohsirDqoahGQ==
X-Google-Smtp-Source: AGHT+IGlWIiPCuvYMrSJG1giBCreRxmVTDCrOGbszgK9vo/xUhwYekKZIGrwVThmRropb5UBUYflRg==
X-Received: by 2002:a17:906:cc9:b0:9a1:af6f:e373 with SMTP id l9-20020a1709060cc900b009a1af6fe373mr10434735ejh.42.1695132086122;
        Tue, 19 Sep 2023 07:01:26 -0700 (PDT)
Received: from penguin.lxd ([100.104.168.126])
        by smtp.gmail.com with ESMTPSA id qt11-20020a170906eceb00b009a19fa8d2e9sm7656403ejb.206.2023.09.19.07.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 07:01:25 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
X-Google-Original-From: Ricardo Ribalda <ricardo@ribalda.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     Ricardo Ribalda <ricardo@ribalda.com>
Subject: [PATCH] yavta: Format type errors for non x86 arches
Date:   Tue, 19 Sep 2023 16:01:23 +0200
Message-Id: <20230919140123.6277-1-ricardo@ribalda.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

mipsel64el, ppc64el, ia64, ppc64, sparc64 and x32 have different lenghts
for long long ints, which result in some compilation errors.

Lets add some castings to help the compiler deal with this.

We cannot use the Format macro constants ffrom inttypes because they
seem to not be compatible with kernel (__u64 et al) types.

Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>
---
 yavta.c | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/yavta.c b/yavta.c
index d562863..bf54e4f 100644
--- a/yavta.c
+++ b/yavta.c
@@ -1313,7 +1313,8 @@ static void video_query_menu(struct device *dev,
 			printf("  %u: %.32s%s\n", menu.index, menu.name,
 			       menu.index == value ? " (*)" : "");
 		else
-			printf("  %u: %lld%s\n", menu.index, menu.value,
+			printf("  %u: %lld%s\n", menu.index,
+			       (long long)menu.value,
 			       menu.index == value ? " (*)" : "");
 	};
 }
@@ -1360,7 +1361,7 @@ static void video_print_control_value(const struct v4l2_query_ext_ctrl *query,
 			printf("0x%08x", ctrl->value);
 			break;
 		case V4L2_CTRL_TYPE_INTEGER64:
-			printf("%lld", ctrl->value64);
+			printf("%lld", (long long)ctrl->value64);
 			break;
 		case V4L2_CTRL_TYPE_STRING:
 			printf("%s", ctrl->string);
@@ -1399,9 +1400,11 @@ static int video_get_control(struct device *dev,
 	}
 
 	if (full) {
-		printf("control 0x%08x `%s' min %lld max %lld step %lld default %lld ",
-			query->id, query->name, query->minimum, query->maximum,
-			query->step, query->default_value);
+		printf("control 0x%08x `%s' min %lld max %lld step %llu default %lld ",
+		       query->id, query->name, (long long)query->minimum,
+		       (long long)query->maximum,
+		       (unsigned long long)query->step,
+		       (long long)query->default_value);
 		if (query->nr_of_dims) {
 			for (i = 0; i < query->nr_of_dims; ++i)
 				printf("[%u]", query->dims[i]);
@@ -2190,13 +2193,16 @@ static int video_do_capture(struct device *dev, unsigned int nframes,
 
 		clock_gettime(CLOCK_MONOTONIC, &ts);
 		get_ts_flags(buf.flags, &ts_type, &ts_source);
-		printf("%u (%u) [%c] %s %u %u B %ld.%06ld %ld.%06ld %.3f fps ts %s/%s\n", i, buf.index,
-			(buf.flags & V4L2_BUF_FLAG_ERROR) ? 'E' : '-',
-			v4l2_field_name(buf.field),
-			buf.sequence, video_buffer_bytes_used(dev, &buf),
-			buf.timestamp.tv_sec, buf.timestamp.tv_usec,
-			ts.tv_sec, ts.tv_nsec/1000, fps,
-			ts_type, ts_source);
+		printf("%u (%u) [%c] %s %u %u B %lld.%06lld %lld.%06lld %.3f fps ts %s/%s\n",
+		       i, buf.index,
+		       (buf.flags & V4L2_BUF_FLAG_ERROR) ? 'E' : '-',
+		       v4l2_field_name(buf.field),
+		       buf.sequence, video_buffer_bytes_used(dev, &buf),
+		       (long long)buf.timestamp.tv_sec,
+		       (long long)buf.timestamp.tv_usec,
+		       (long long)ts.tv_sec,
+		       (long long)(ts.tv_nsec / 1000), fps,
+		       ts_type, ts_source);
 
 		last = buf.timestamp;
 
@@ -2252,8 +2258,9 @@ static int video_do_capture(struct device *dev, unsigned int nframes,
 	bps = size/(ts.tv_nsec/1000.0+1000000.0*ts.tv_sec)*1000000.0;
 	fps = i/(ts.tv_nsec/1000.0+1000000.0*ts.tv_sec)*1000000.0;
 
-	printf("Captured %u frames in %lu.%06lu seconds (%f fps, %f B/s).\n",
-		i, ts.tv_sec, ts.tv_nsec/1000, fps, bps);
+	printf("Captured %u frames in %llu.%06llu seconds (%f fps, %f B/s).\n",
+	       i, (long long)ts.tv_sec, (long long)(ts.tv_nsec / 1000), fps,
+	       bps);
 
 done:
 	video_free_buffers(dev);
-- 
2.30.2

