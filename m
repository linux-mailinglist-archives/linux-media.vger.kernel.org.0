Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F133F578D37
	for <lists+linux-media@lfdr.de>; Tue, 19 Jul 2022 00:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236409AbiGRWC1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jul 2022 18:02:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236400AbiGRWCY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jul 2022 18:02:24 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A04C30F40
        for <linux-media@vger.kernel.org>; Mon, 18 Jul 2022 15:02:23 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-10c8e8d973eso27580813fac.5
        for <linux-media@vger.kernel.org>; Mon, 18 Jul 2022 15:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UdBFHF56DJCJ7TVTujTvKpBH89sBJrOSHbI3IjUu/5k=;
        b=wTFG8JWjShO5RNne+JFekypG5Jun3Z5JIEH+vyfzhLBlGdU3IBQsxWmjzY9A//MPbd
         rbrty3FJrIcYAIe4+QpZ+Jw8usCg0M1t/NQ6SaJZfehWJ8pL9kQL3jea1SnWkYzIlwJn
         k6gemebyT1TUIP+p7XkvwQKCKbomhP+6ECd4p5gkhBYU5TuLASId3JFpmQYgYQrJeiIZ
         OFgUDSxDA/A0v0eFvkvAhGhE6oHgUsjR2MjGx53TGIvCR7jOOF7jk9AhVTpQlflXTYmK
         tAm6l0alQnFFnPmqHezfvMTknOoT9vWuAImEcXQf0hz5DKT1vmwD/HN70lEffAi6OWKb
         oiXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UdBFHF56DJCJ7TVTujTvKpBH89sBJrOSHbI3IjUu/5k=;
        b=PoHPfkRSt62bzcfZpG29ALx0ag39Mx5zcqffs/buUl8avMLIbq934WG8dM9ixtnQTy
         Orf+fOckSs2pUv2Ugu8p9PMw34v0GGCkYAPzJ94zp5lz4m0TNU0iHgUwj28R8MobK+ZW
         BEtTH/VRDaKxPzZS9hyzq3C8vl03ojTVs32k2EatU73Ao9xstPv9X906Ja6n5s7cvLb5
         Z7AjG15VUc1xsKc+YzbxMEmsMulQzzF1vwAAnu1G9Jb5itNaEzkBoEk3EY7qG6rHP/9+
         ZCHDeRkULffDVwDmO28eXFQvZ/RwYxeUqih7eF9OOe2mxORXkVV5Mzf8MoYg7yA7/Qg5
         /Xsw==
X-Gm-Message-State: AJIora+kh9RGk3b5Vhpw4UrZwM5J78TlaKDMP725AaFQPPjq5F5gTC3g
        uc9f5BOJuYzj0RvBjkqW8n6ta/P2RZfH7m9o
X-Google-Smtp-Source: AGRyM1vB/B9eryf5swntZ6a7FaXZ/PDoV23ychjM/n23I/soPsdtUbR9hUTrm9sjNJ8atxYP1gPpYw==
X-Received: by 2002:a05:6870:2186:b0:10b:f3fa:a07b with SMTP id l6-20020a056870218600b0010bf3faa07bmr18360882oae.266.1658181742537;
        Mon, 18 Jul 2022 15:02:22 -0700 (PDT)
Received: from zeta-build.. ([190.190.187.68])
        by smtp.gmail.com with ESMTPSA id x27-20020a9d459b000000b0061c68a35fdfsm3793183ote.9.2022.07.18.15.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 15:02:22 -0700 (PDT)
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH v3 2/2] videobuf2: Remove vb2_find_timestamp()
Date:   Mon, 18 Jul 2022 19:02:11 -0300
Message-Id: <20220718220211.97995-2-ezequiel@vanguardiasur.com.ar>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20220718220211.97995-1-ezequiel@vanguardiasur.com.ar>
References: <20220718220211.97995-1-ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
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

