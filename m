Return-Path: <linux-media+bounces-31735-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46075AA9DB0
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 23:00:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0D4517F04A
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 21:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 319932701CE;
	Mon,  5 May 2025 21:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rc61kRMg"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DB1270EDF
	for <linux-media@vger.kernel.org>; Mon,  5 May 2025 21:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746478834; cv=none; b=YMa77tWiugU/6acGG1cVRIyA2bVI8Yxg0Aue+2EpCR8p1MUH/zV5YwjJDXVX6yWLc9JLurqtkMNGZEohwKL25OQyI6foc9uMJVxnGDHqxXnx7uRHORi5ybrjfgQwSFh1dkBn9UyflwrX9QvOCQrekbx1YlupU91FIPNIsbVINSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746478834; c=relaxed/simple;
	bh=9saEK3UouWBgHJKnUexi2Sl7U1O/yZEm05qmOezGf6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cId0bdZ71eGhlKeRJreJ0R6hpxv75oqo/WNP90KbW/UeJx2Z8JGK70zyeTXeFDBJkFjACJMJM15+9Q161ft9AHqg5qQXtLQNLCMzY1LrXeWyErOSwe9bNesRSt9lLjKJZmmbE7lUQjmlDrFLKT3LY2l8qVoXVQacVophfTYoL2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rc61kRMg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746478831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d5b6MoY0jFIJKsqT2hqkdH3TTuap/AgYbu2DVqqRXyk=;
	b=Rc61kRMg3wmZN9Z7LCh/6BZpLmLKQ8eYMy8EZ+hkmnH1SuOv/4NlaYEevQO/0orTYmdLqH
	Yj7FOARatTMPMbXgPw/ficV9j91o0QbKCXVazR0E63JtvnYK5aXOqPoPVFdhezNkcX/NBC
	IjVfEV7ToCAK1yKUY/kvTWts+HgHfg4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-227-WQeTj6GXOfGxWL47eAlTJw-1; Mon,
 05 May 2025 17:00:28 -0400
X-MC-Unique: WQeTj6GXOfGxWL47eAlTJw-1
X-Mimecast-MFC-AGG-ID: WQeTj6GXOfGxWL47eAlTJw_1746478827
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 82903180034A;
	Mon,  5 May 2025 21:00:27 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.45.224.24])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 89DE1195608D;
	Mon,  5 May 2025 21:00:25 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 4/5] media: atomisp: Always free MIPI / CSI-receiver buffers from ia_css_uninit()
Date: Mon,  5 May 2025 23:00:07 +0200
Message-ID: <20250505210008.152659-5-hdegoede@redhat.com>
In-Reply-To: <20250505210008.152659-1-hdegoede@redhat.com>
References: <20250505210008.152659-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

The atomisp interrupt handling will free the MIPI / CSI-receiver buffers
when processing a frame-completion event if the stop_requested flag is set,
but only in the ISP2400 / BYT, not in the ISP2401 / CHT case.

There are 2 problems with this:

1. Since this is only done in the BYT case the "mipi frames are not freed."
   warning always triggers on CHT devices.

2. There are 2 stop_requested flags, ia_css_pipe.stop_requested and
   ia_css_pipeline.stop_requested. The ISR checks the ia_css_pipe flag,
   but atomisp_css_stop() sets the ia_css_pipeline.stop_requested flag.
   So even on BYT freeing the buffers from the ISR never happens.

   This likely is a good thing since the buffers get freed on the first
   frame completion event and there might be multiple frames queued up.

Fix things by completely dropping the freeing of the MIPI buffers from
the ISR as well as the stop_requested flag always freeing the buffers
from ia_css_uninit().

Also drop the warning since this now always is expected behavior.

Note that ia_css_uninit() get called whenever streaming is stopped
through atomisp_stop_stream() calling atomisp_reset() so the buffers
are still freed whenever streaming is stopped.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/ia_css_pipe.h   |  2 --
 .../pipeline/interface/ia_css_pipeline.h      |  1 -
 .../pci/runtime/pipeline/src/pipeline.c       |  2 --
 drivers/staging/media/atomisp/pci/sh_css.c    | 27 -------------------
 .../staging/media/atomisp/pci/sh_css_mipi.c   | 11 --------
 .../staging/media/atomisp/pci/sh_css_mipi.h   |  2 --
 6 files changed, 45 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_pipe.h b/drivers/staging/media/atomisp/pci/ia_css_pipe.h
index c97d2ae356fd..77072694eb42 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_pipe.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_pipe.h
@@ -102,8 +102,6 @@ struct ia_css_yuvpp_settings {
 struct osys_object;
 
 struct ia_css_pipe {
-	/* TODO: Remove stop_requested and use stop_requested in the pipeline */
-	bool                            stop_requested;
 	struct ia_css_pipe_config       config;
 	struct ia_css_pipe_extra_config extra_config;
 	struct ia_css_pipe_info         info;
diff --git a/drivers/staging/media/atomisp/pci/runtime/pipeline/interface/ia_css_pipeline.h b/drivers/staging/media/atomisp/pci/runtime/pipeline/interface/ia_css_pipeline.h
index 316eaa2070ea..8b7cbf31a1a2 100644
--- a/drivers/staging/media/atomisp/pci/runtime/pipeline/interface/ia_css_pipeline.h
+++ b/drivers/staging/media/atomisp/pci/runtime/pipeline/interface/ia_css_pipeline.h
@@ -34,7 +34,6 @@ struct ia_css_pipeline_stage {
 struct ia_css_pipeline {
 	enum ia_css_pipe_id pipe_id;
 	u8 pipe_num;
-	bool stop_requested;
 	struct ia_css_pipeline_stage *stages;
 	struct ia_css_pipeline_stage *current_stage;
 	unsigned int num_stages;
diff --git a/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c b/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
index aabebe61ec77..cb8d652227a7 100644
--- a/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
+++ b/drivers/staging/media/atomisp/pci/runtime/pipeline/src/pipeline.c
@@ -198,7 +198,6 @@ int ia_css_pipeline_request_stop(struct ia_css_pipeline *pipeline)
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
 			    "ia_css_pipeline_request_stop() enter: pipeline=%p\n",
 			    pipeline);
-	pipeline->stop_requested = true;
 
 	/* Send stop event to the sp*/
 	/* This needs improvement, stop on all the pipes available
@@ -663,7 +662,6 @@ static void pipeline_init_defaults(
 
 	pipeline->pipe_id = pipe_id;
 	pipeline->stages = NULL;
-	pipeline->stop_requested = false;
 	pipeline->current_stage = NULL;
 
 	memcpy(&pipeline->in_frame, &ia_css_default_frame,
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 5a8e8e67aa13..73bd87f43a8c 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -2002,10 +2002,6 @@ ia_css_uninit(void)
 
 	sh_css_params_free_default_gdc_lut();
 
-	/* TODO: JB: implement decent check and handling of freeing mipi frames */
-	if (!mipi_is_free())
-		dev_warn(atomisp_dev, "mipi frames are not freed.\n");
-
 	/* cleanup generic data */
 	sh_css_params_uninit();
 	ia_css_refcount_uninit();
@@ -3743,23 +3739,6 @@ ia_css_pipe_dequeue_buffer(struct ia_css_pipe *pipe,
 			case IA_CSS_BUFFER_TYPE_INPUT_FRAME:
 			case IA_CSS_BUFFER_TYPE_OUTPUT_FRAME:
 			case IA_CSS_BUFFER_TYPE_SEC_OUTPUT_FRAME:
-				if (pipe && pipe->stop_requested) {
-					if (!IS_ISP2401) {
-						/*
-						 * free mipi frames only for old input
-						 * system for 2401 it is done in
-						 * ia_css_stream_destroy call
-						 */
-						return_err = free_mipi_frames(pipe);
-						if (return_err) {
-							IA_CSS_LOG("free_mipi_frames() failed");
-							IA_CSS_LEAVE_ERR(return_err);
-							return return_err;
-						}
-					}
-					pipe->stop_requested = false;
-				}
-				fallthrough;
 			case IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME:
 			case IA_CSS_BUFFER_TYPE_SEC_VF_OUTPUT_FRAME:
 				frame = (struct ia_css_frame *)HOST_ADDRESS(ddr_buffer.kernel_ptr);
@@ -4095,8 +4074,6 @@ sh_css_pipe_start(struct ia_css_stream *stream)
 		return err;
 	}
 
-	pipe->stop_requested = false;
-
 	switch (pipe_id) {
 	case IA_CSS_PIPE_ID_PREVIEW:
 		err = preview_start(pipe);
@@ -4120,19 +4097,15 @@ sh_css_pipe_start(struct ia_css_stream *stream)
 		for (i = 1; i < stream->num_pipes && 0 == err ; i++) {
 			switch (stream->pipes[i]->mode) {
 			case IA_CSS_PIPE_ID_PREVIEW:
-				stream->pipes[i]->stop_requested = false;
 				err = preview_start(stream->pipes[i]);
 				break;
 			case IA_CSS_PIPE_ID_VIDEO:
-				stream->pipes[i]->stop_requested = false;
 				err = video_start(stream->pipes[i]);
 				break;
 			case IA_CSS_PIPE_ID_CAPTURE:
-				stream->pipes[i]->stop_requested = false;
 				err = capture_start(stream->pipes[i]);
 				break;
 			case IA_CSS_PIPE_ID_YUVPP:
-				stream->pipes[i]->stop_requested = false;
 				err = yuvpp_start(stream->pipes[i]);
 				break;
 			default:
diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index 42f14ed853e1..971b685cdb58 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -185,17 +185,6 @@ mipi_init(void)
 		ref_count_mipi_allocation[i] = 0;
 }
 
-bool mipi_is_free(void)
-{
-	unsigned int i;
-
-	for (i = 0; i < N_CSI_PORTS; i++)
-		if (ref_count_mipi_allocation[i])
-			return false;
-
-	return true;
-}
-
 /*
  * @brief Calculate the required MIPI buffer sizes.
  * Based on the stream configuration, calculate the
diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.h b/drivers/staging/media/atomisp/pci/sh_css_mipi.h
index 6f7389f44baa..b3887ee3c75a 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.h
@@ -14,8 +14,6 @@
 void
 mipi_init(void);
 
-bool mipi_is_free(void);
-
 int
 allocate_mipi_frames(struct ia_css_pipe *pipe, struct ia_css_stream_info *info);
 
-- 
2.49.0


