Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15972570C82
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 23:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231954AbiGKVMd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 17:12:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231948AbiGKVMP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 17:12:15 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E77528247B
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 14:12:08 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-10be0d7476aso8202389fac.2
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 14:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UdBFHF56DJCJ7TVTujTvKpBH89sBJrOSHbI3IjUu/5k=;
        b=Abr43rShDbmDOl7eDvr+8IqRRqycv2rTEkZVORgxxj/Eynw9PS7PIaSw8WFrvyvLSi
         zLmKk/B8dmnrUX3o78pS4bHrMaT5Qc7mo4nt3RjY933+33KocRDQ8nv3mLzd9du86DJ2
         6CwpqlESkxYh4rEOPPmD7CxtPPb4a8gauROm/6zfR/ggnFW/Spz7cmrLsBGwLcSYAQ96
         a4V/IGvrwCE8mN5mwmqEHaCWEAdTNpgmWTfqe/ZZCRbp8/ZH8eqLxh0BmmfQ8I8ba9UM
         wyNq/U6g2WZU21efd3OQQ61I4CyInHBs4PHUqT8Y9SUGNeFQTWpELp6i6J1PoUXWK0pO
         fXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UdBFHF56DJCJ7TVTujTvKpBH89sBJrOSHbI3IjUu/5k=;
        b=t3uRDRUpz10m3vv6N0nzh48TQPa7ZoFjXo/0NvZugl1VifPbunMOn7KUEpLdF0zWKt
         W1QCpXaingv2cU4bWwaBjurLqsbBG0p0ZZzvhvkyu4THFuWkm+n9/dLuElpOUrsLAXWV
         2HOCdcUy+iI9jrddKNHlik7IHEbUarGNkugcRgTsM4J/dq6noysophWnsm6dRJNC47mY
         CFT6jpZ28N3NtvoZUeh/Z0lfoR3noLocZ7SiFiSIrGKCU869mZqpMWntCQr1HnTmhZ7+
         2ib4l7xL0eUxSQxilTaDUWghF1iaBlV+Qlh4+2I0rkR6H+0Cq4P2gg4R5ZpYLhL+zvjN
         1FWQ==
X-Gm-Message-State: AJIora/4GBZulGS3mN3gIM9kWl3FAo6K2ZnVdJ2YoyzuDJ9DqjBW/bEY
        0eIvHsPn6kMdlQzhdGe16DCw3C1IbUx2t6dY
X-Google-Smtp-Source: AGRyM1v1o3gDWK5MQ0gtVhHxbLXfSGQeLVeGwJDTrU3G+4bYsZkIF+Fc8L8jKMPdGN1n5vDPaNj+IA==
X-Received: by 2002:a05:6870:c149:b0:100:9ea3:7913 with SMTP id g9-20020a056870c14900b001009ea37913mr167513oad.150.1657573927728;
        Mon, 11 Jul 2022 14:12:07 -0700 (PDT)
Received: from zeta-build.. ([190.190.187.68])
        by smtp.gmail.com with ESMTPSA id c128-20020aca3586000000b00338869042fdsm3198817oia.32.2022.07.11.14.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 14:12:07 -0700 (PDT)
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH v2 8/8] videobuf2: Remove vb2_find_timestamp()
Date:   Mon, 11 Jul 2022 18:11:41 -0300
Message-Id: <20220711211141.349902-9-ezequiel@vanguardiasur.com.ar>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20220711211141.349902-1-ezequiel@vanguardiasur.com.ar>
References: <20220711211141.349902-1-ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that we've transitioned all users to vb2_find_buffer API,
remove the unused vb2_find_timestamp().

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Acked-by: Tomasz Figa <tfiga@chromium.org>
---
 drivers/media/common/videobuf2/videobuf2-v4l2.c | 13 -------------
 include/media/videobuf2-v4l2.h                  | 16 ----------------
 2 files changed, 29 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index f26cb8586bd4..4e84a0e1aca2 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -625,19 +625,6 @@ static const struct vb2_buf_ops v4l2_buf_ops = {
 	.copy_timestamp		= __copy_timestamp,
 };
 
-int vb2_find_timestamp(const struct vb2_queue *q, u64 timestamp,
-		       unsigned int start_idx)
-{
-	unsigned int i;
-
-	for (i = start_idx; i < q->num_buffers; i++)
-		if (q->bufs[i]->copied_timestamp &&
-		    q->bufs[i]->timestamp == timestamp)
-			return i;
-	return -1;
-}
-EXPORT_SYMBOL_GPL(vb2_find_timestamp);
-
 struct vb2_buffer *vb2_find_buffer(struct vb2_queue *q, u64 timestamp)
 {
 	unsigned int i;
diff --git a/include/media/videobuf2-v4l2.h b/include/media/videobuf2-v4l2.h
index 76e405c0b003..5a845887850b 100644
--- a/include/media/videobuf2-v4l2.h
+++ b/include/media/videobuf2-v4l2.h
@@ -62,22 +62,6 @@ struct vb2_v4l2_buffer {
 #define to_vb2_v4l2_buffer(vb) \
 	container_of(vb, struct vb2_v4l2_buffer, vb2_buf)
 
-/**
- * vb2_find_timestamp() - Find buffer with given timestamp in the queue
- *
- * @q:		pointer to &struct vb2_queue with videobuf2 queue.
- * @timestamp:	the timestamp to find.
- * @start_idx:	the start index (usually 0) in the buffer array to start
- *		searching from. Note that there may be multiple buffers
- *		with the same timestamp value, so you can restart the search
- *		by setting @start_idx to the previously found index + 1.
- *
- * Returns the buffer index of the buffer with the given @timestamp, or
- * -1 if no buffer with @timestamp was found.
- */
-int vb2_find_timestamp(const struct vb2_queue *q, u64 timestamp,
-		       unsigned int start_idx);
-
 /**
  * vb2_find_buffer() - Find a buffer with given timestamp
  *
-- 
2.34.3

