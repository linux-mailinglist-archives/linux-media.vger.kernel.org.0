Return-Path: <linux-media+bounces-13887-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 745829119BA
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 06:47:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95AB71C21434
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 04:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59FC12D1FC;
	Fri, 21 Jun 2024 04:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="famBotpb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDB213D615
	for <linux-media@vger.kernel.org>; Fri, 21 Jun 2024 04:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718945216; cv=none; b=bLx9vw06iiUqTpNAbPNqa2ECkzAdsD+J+Jo+QhcQ4vlNWHINm1hIeqJMtZfZ9n/qSSwa9Kz9HVU0w5bnxA3hV9fUnXffq24ikqmVV2rBW8mIPhpRK9WaM+IjlPlpz54XB9UjtnJzo1trD7g7mAf/w7e2tq2y9cKyYdVvz0vq4PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718945216; c=relaxed/simple;
	bh=16MhtMxKDZcpnZf3ioCOy4a13qt3L50A9IKwXb5/1Ts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mduzvPB6DuFWDelRE8WAh1bRTIRsa/s+/LdyF+0lM2DpdnlgDfAgyb93VtoYjjeAv+Ijoafne4N00wm5Wet18hqCMAVnYvCOvRR1VDHLjyENolxFVnlsfbODkx9YvekcR44GWui6+n5E/m1iXPkPZKSRa2BZV0XHV4IP0GNgvgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=famBotpb; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1f99fe4dc5aso13446685ad.0
        for <linux-media@vger.kernel.org>; Thu, 20 Jun 2024 21:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718945214; x=1719550014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSAH0M+p9QRAU7e73G9yxB5HQZ3+B+UK81pFfBELJCU=;
        b=famBotpbRQSNGOMQlo6EMShOfHLsaKFlbHNVBjMiqXi+aEv58eD8J3yaauUo96228F
         U2aIvXO9rmkkrT98FqwSXoNuFX/OK9AWXuZQt0N7rHHMhJiTclvDe99KMSVlu1JptFS4
         wmsr1YAN/If1y15dxUmjeBnVj2TQZvq2Po4ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718945214; x=1719550014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LSAH0M+p9QRAU7e73G9yxB5HQZ3+B+UK81pFfBELJCU=;
        b=KxPD1l1RY+jDObqlovlD/XUd2FxniasAljr19sHDfDL5YOc6zjgYiykq69M28wJV8j
         1iIML680DpaCTV/m7wGyf1ZS28XTrtxB/uaEo53AuLMcqMze4kkDU1cpNRzgmqwX0hsS
         ntpAeNkvj3x9P+nHhUkImKwMHDXSnV+w1pi8qTylHyv40Sa/+Jz3XfWi7JVtA8/etPmX
         5oVmK9HT8TVmM/OaJ0jTtt1tUmb8ju5zTu68H1GBoM8fM1ulRWIwHCnqtozXvYxBwn1d
         L1iTIR3XglMhFhv42hc1Hc6h6rAwk78SaE/QrXcSodmkzWZg50f0N+JKQHJ8oOmCEKmp
         Gymw==
X-Forwarded-Encrypted: i=1; AJvYcCV6KPv3UGO3k94v2fFZOz5kMdNRfXClAgUS2Wme/bzsk9mKh80E1E97PtX0gTLlfqrFhOjbDWqaxEQk4Jm0MRu+vy/J5X1qrwW0NqE=
X-Gm-Message-State: AOJu0Yyuh2qBrv7+QlQ4JpMinEZbcEprLWyr9SbC/cch41T2dKicbaoP
	vsigwTNXRhEqiaBAFsR7oD8peY7tGttlyENAYFY1Pr9SN4pKKQRjPLjdTXCj7w==
X-Google-Smtp-Source: AGHT+IEtoZcjZRs4Z2hN3BH58jpAvugCjNxXZr2Faov/subK0weBwx3axbvKSoceK3U++yd30EP7Yw==
X-Received: by 2002:a17:903:1cf:b0:1f7:3379:1c71 with SMTP id d9443c01a7336-1f9aa3ebf53mr82891885ad.27.1718945214189;
        Thu, 20 Jun 2024 21:46:54 -0700 (PDT)
Received: from mstaudt.tok.corp.google.com ([2401:fa00:8f:203:3c9:e095:f93c:9c3c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9ebbb5aa5sm4780755ad.271.2024.06.20.21.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 21:46:53 -0700 (PDT)
From: Max Staudt <mstaudt@chromium.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ricardo Ribalda <ribalda@chromium.org>,
	Max Staudt <mstaudt@chromium.org>
Subject: [PATCH v1 3/3] staging: media: ipu3: Stop streaming in inverse order of starting
Date: Thu, 20 Jun 2024 23:45:43 +0900
Message-ID: <20240620145820.3910239-4-mstaudt@chromium.org>
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
In-Reply-To: <20240620145820.3910239-1-mstaudt@chromium.org>
References: <20240620145820.3910239-1-mstaudt@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imgu_vb2_stop_streaming() did not order shutdown items in the inverse
order and count of what imgu_vb2_start_streaming() does. Consequently,
v6.7's new WARN_ON in call_s_stream() started screaming because it was
called multiple times on the entire pipe, yet it should only be called
when the pipe is interrupted by any first node being taken offline.

This reorders streamoff to be the inverse of streamon, and uses
analogous conditions to decide when and how often to call additional
teardown functions.

v4l2_subdev_call(s_stream, 0) remains outside the streaming_lock,
analogously to imgu_vb2_start_streaming().

Signed-off-by: Max Staudt <mstaudt@chromium.org>
---
 drivers/staging/media/ipu3/ipu3-v4l2.c | 36 +++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index 3ff390b04e1a..e7aee7e3db5b 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -535,29 +535,51 @@ static void imgu_vb2_stop_streaming(struct vb2_queue *vq)
 		container_of(vq, struct imgu_video_device, vbq);
 	int r;
 	unsigned int pipe;
+	bool stop_streaming = false;
 
+	/* Verify that the node had been setup with imgu_v4l2_node_setup() */
 	WARN_ON(!node->enabled);
 
 	pipe = node->pipe;
 	dev_dbg(dev, "Try to stream off node [%u][%u]", pipe, node->id);
-	imgu_pipe = &imgu->imgu_pipe[pipe];
-	r = v4l2_subdev_call(&imgu_pipe->imgu_sd.subdev, video, s_stream, 0);
-	if (r)
-		dev_err(&imgu->pci_dev->dev,
-			"failed to stop subdev streaming\n");
 
+	/*
+	 * When the first node of a streaming setup is stopped, the entire
+	 * pipeline needs to stop before individual nodes are disabled.
+	 * Perform the inverse of the initial setup.
+	 *
+	 * Part 1 - s_stream on the entire pipeline
+	 */
 	mutex_lock(&imgu->streaming_lock);
-	/* Was this the first node with streaming disabled? */
 	if (imgu->streaming) {
 		/* Yes, really stop streaming now */
 		dev_dbg(dev, "IMGU streaming is ready to stop");
 		r = imgu_s_stream(imgu, false);
 		if (!r)
 			imgu->streaming = false;
+		stop_streaming = true;
 	}
-
 	mutex_unlock(&imgu->streaming_lock);
 
+	/* Part 2 - s_stream on subdevs
+	 *
+	 * If we call s_stream multiple times, Linux v6.7's call_s_stream()
+	 * WARNs and aborts. Thus, disable all pipes at once, and only once.
+	 */
+	if (stop_streaming) {
+		for_each_set_bit(pipe, imgu->css.enabled_pipes,
+				 IMGU_MAX_PIPE_NUM) {
+			imgu_pipe = &imgu->imgu_pipe[pipe];
+
+			r = v4l2_subdev_call(&imgu_pipe->imgu_sd.subdev,
+					     video, s_stream, 0);
+			if (r)
+				dev_err(&imgu->pci_dev->dev,
+					"failed to stop subdev streaming\n");
+		}
+	}
+
+	/* Part 3 - individual node teardown */
 	video_device_pipeline_stop(&node->vdev);
 	imgu_return_all_buffers(imgu, node, VB2_BUF_STATE_ERROR);
 }
-- 
2.45.2.627.g7a2c4fd464-goog


