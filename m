Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54A607A827F
	for <lists+linux-media@lfdr.de>; Wed, 20 Sep 2023 14:59:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234753AbjITM7z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Sep 2023 08:59:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236232AbjITM7w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Sep 2023 08:59:52 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BD9799
        for <linux-media@vger.kernel.org>; Wed, 20 Sep 2023 05:59:45 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9adca291f99so690163066b.2
        for <linux-media@vger.kernel.org>; Wed, 20 Sep 2023 05:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695214784; x=1695819584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LV2gN9+eTiXkyca2dO5MxUoq8LWJ1nU2KvHcYErMcdE=;
        b=KBW7CHiC+c7tX6SZySiFzOqmAbDwCvqUeMX/qgbNN4P+Y6ha5wdKwI0hvuFH0tSPy5
         Bvp+BeyX2Q936HgYKCVyrbIXy/qIFvlwaHTpgu2yImyTu/6Hnpzpb047YED98O0ALKWi
         YgtnKWdQ/Prt1V+MdvWJjIGafgdAXEK5vxz3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695214784; x=1695819584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LV2gN9+eTiXkyca2dO5MxUoq8LWJ1nU2KvHcYErMcdE=;
        b=gAnBSLRul+Y3iyQfvhcUNWO0msjnwzSNHjlPxfhu9yJpS3kYrjuf3PIoEeJ71tHhx8
         HePBr4OupHVv6RGrQbYZl52tzqXy9aUXu9MeOoFZCbgzogVeY95fezqEzKNLet4/Vo0L
         JNEM+Wqhk8sjPvvmO1A6vTn+PIVv6yM4lh0KonxPdoRURXGNVGeiyxzjoTVrkpK6T5II
         WNw1CkGmyQBIGu+YYIsEnYdvbE8EcMFzxxqF0EKZySH1bmccvChymZNLzhl8aNuKzmTh
         czXldG2JircmdQrSj8iTIH+V3JQoFDrtZON3Xiak0gxAxCPuqYEcUnhim0x2BCqLwMuP
         y0oQ==
X-Gm-Message-State: AOJu0YxmCGpj9vMAd4KebNMFGdNs84gY86IQc5eqRJmEbN7PdMkNEOLd
        FKRi9UoqVnVyyAnES19fK5WbC8OI5K2tADTLF/VWoA==
X-Google-Smtp-Source: AGHT+IHv4DCTnMXjZDl18vyrgEZDeqvs5KBRdiugIQGySfYUM3jWDBacwgRyheAdIANNCfWJiClNmg==
X-Received: by 2002:a17:907:2ccb:b0:9a2:23b:db60 with SMTP id hg11-20020a1709072ccb00b009a2023bdb60mr1973566ejc.54.1695214783617;
        Wed, 20 Sep 2023 05:59:43 -0700 (PDT)
Received: from penguin.lxd ([100.104.168.126])
        by smtp.gmail.com with ESMTPSA id dk14-20020a170906f0ce00b00992b2c55c67sm9306090ejb.156.2023.09.20.05.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 05:59:43 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
X-Google-Original-From: Ricardo Ribalda <ricardo@ribalda.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, hverkuil@xs4all.nl
Cc:     Ricardo Ribalda <ricardo@ribalda.com>
Subject: [PATCH] yavta: Format type errors for non x86 arches
Date:   Wed, 20 Sep 2023 14:59:39 +0200
Message-Id: <20230920125939.1478-1-ricardo@ribalda.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

mipsel64el, ppc64el, ia64, ppc64, sparc64 and x32 have different lenghts
for long long ints, which result in some compilation errors.

Lets add some castings and inttypes macros to help the compiler deal with
this.

We have to use the castings, because kernel types (__u64 et al) does not
seem to be compatible with inttypes macros.

Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>
---
 yavta.c | 34 ++++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/yavta.c b/yavta.c
index d562863..d8c9d14 100644
--- a/yavta.c
+++ b/yavta.c
@@ -1313,7 +1313,8 @@ static void video_query_menu(struct device *dev,
 			printf("  %u: %.32s%s\n", menu.index, menu.name,
 			       menu.index == value ? " (*)" : "");
 		else
-			printf("  %u: %lld%s\n", menu.index, menu.value,
+			printf("  %u: %" PRId64 "%s\n", menu.index,
+			       (int64_t)menu.value,
 			       menu.index == value ? " (*)" : "");
 	};
 }
@@ -1360,7 +1361,7 @@ static void video_print_control_value(const struct v4l2_query_ext_ctrl *query,
 			printf("0x%08x", ctrl->value);
 			break;
 		case V4L2_CTRL_TYPE_INTEGER64:
-			printf("%lld", ctrl->value64);
+			printf("%" PRId64, (int64_t)ctrl->value64);
 			break;
 		case V4L2_CTRL_TYPE_STRING:
 			printf("%s", ctrl->string);
@@ -1399,9 +1400,10 @@ static int video_get_control(struct device *dev,
 	}
 
 	if (full) {
-		printf("control 0x%08x `%s' min %lld max %lld step %lld default %lld ",
-			query->id, query->name, query->minimum, query->maximum,
-			query->step, query->default_value);
+		printf("control 0x%08x `%s' min %" PRId64 " max %" PRId64 " step %" PRIu64 " default %" PRId64 " ",
+		       query->id, query->name, (int64_t)query->minimum,
+		       (int64_t)query->maximum, (uint64_t)query->step,
+		       (int64_t)query->default_value);
 		if (query->nr_of_dims) {
 			for (i = 0; i < query->nr_of_dims; ++i)
 				printf("[%u]", query->dims[i]);
@@ -2190,13 +2192,16 @@ static int video_do_capture(struct device *dev, unsigned int nframes,
 
 		clock_gettime(CLOCK_MONOTONIC, &ts);
 		get_ts_flags(buf.flags, &ts_type, &ts_source);
-		printf("%u (%u) [%c] %s %u %u B %ld.%06ld %ld.%06ld %.3f fps ts %s/%s\n", i, buf.index,
-			(buf.flags & V4L2_BUF_FLAG_ERROR) ? 'E' : '-',
-			v4l2_field_name(buf.field),
-			buf.sequence, video_buffer_bytes_used(dev, &buf),
-			buf.timestamp.tv_sec, buf.timestamp.tv_usec,
-			ts.tv_sec, ts.tv_nsec/1000, fps,
-			ts_type, ts_source);
+		printf("%u (%u) [%c] %s %u %u B %" PRId64 ".%06" PRId64 " %" PRId64 ".%06" PRId64 " %.3f fps ts %s/%s\n",
+		       i, buf.index,
+		       (buf.flags & V4L2_BUF_FLAG_ERROR) ? 'E' : '-',
+		       v4l2_field_name(buf.field),
+		       buf.sequence, video_buffer_bytes_used(dev, &buf),
+		       (int64_t)buf.timestamp.tv_sec,
+		       (int64_t)buf.timestamp.tv_usec,
+		       (int64_t)ts.tv_sec,
+		       (int64_t)(ts.tv_nsec / 1000), fps,
+		       ts_type, ts_source);
 
 		last = buf.timestamp;
 
@@ -2252,8 +2257,9 @@ static int video_do_capture(struct device *dev, unsigned int nframes,
 	bps = size/(ts.tv_nsec/1000.0+1000000.0*ts.tv_sec)*1000000.0;
 	fps = i/(ts.tv_nsec/1000.0+1000000.0*ts.tv_sec)*1000000.0;
 
-	printf("Captured %u frames in %lu.%06lu seconds (%f fps, %f B/s).\n",
-		i, ts.tv_sec, ts.tv_nsec/1000, fps, bps);
+	printf("Captured %u frames in %" PRId64 ".%06" PRId64 " seconds (%f fps, %f B/s).\n",
+	       i, (int64_t)ts.tv_sec, (int64_t)(ts.tv_nsec / 1000), fps,
+	       bps);
 
 done:
 	video_free_buffers(dev);
-- 
2.30.2

