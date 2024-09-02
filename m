Return-Path: <linux-media+bounces-17326-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2820F9683BE
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 11:54:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9EC21F23B02
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 09:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 726B31D4170;
	Mon,  2 Sep 2024 09:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UIs5vJZX"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75C41D3658
	for <linux-media@vger.kernel.org>; Mon,  2 Sep 2024 09:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725270776; cv=none; b=by1JdTjNGl8+HuxB5RWT+aQnfMhcTYvAF9EpTUYR6ngNrkiydAWGNr5dw+TZOoc06t8Lb/pyn536sxhh9s3VSSLfhAl+aue4QL+7I85xxgDqy9OxxUafdObpabEIVA3ZljyYYmXJkNqT5t2EaQs18m4ki25KE58JHc1s/xLMxi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725270776; c=relaxed/simple;
	bh=OooiacXm/zKxINu0agQeu6ejYOVFzSMQNxpWJLfIVwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FNzLeZXh2symj9qboXM8rfSRtJPo524Nbgixouytk1djATv6OAYMweaHyxwzDlQhzp0J91AbRfoQGInBBJOjIoXuW8YVo4SK7n+mfQKyqVvQZOMetO/0tUOiXr0CiVLfzshZs8xO+jpbYnUKt66UZCCRhDohZIMuOE8GXZD087g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UIs5vJZX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725270773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wEzeMqAFycpnhfcrNJoCCYl+P6m154w0Ry7nNfWsZOk=;
	b=UIs5vJZXHm0QhVI/tn9PryE6GG9FvLOcfX/hhfjzBhu5KctH44YumEFSe3WNYpKvkdM5la
	6NteswHJFRghLAIb+F3tklbU7Rkjp+iPq787SHWlzO23bIqMMzgz9RM4uHssDqPL9yNyFz
	yE/JvwxNIgt7KaqjzOqLlXxxAWIRe6U=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-531-672kvCdGO76V5UQzEy4Vhg-1; Mon,
 02 Sep 2024 05:52:50 -0400
X-MC-Unique: 672kvCdGO76V5UQzEy4Vhg-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B74F71954229;
	Mon,  2 Sep 2024 09:52:48 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.30])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 296F319560A3;
	Mon,  2 Sep 2024 09:52:42 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>,
	andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 3/3] media: atomisp: Improve binary finding debug logging
Date: Mon,  2 Sep 2024 11:52:29 +0200
Message-ID: <20240902095229.59059-3-hdegoede@redhat.com>
In-Reply-To: <20240902095229.59059-1-hdegoede@redhat.com>
References: <20240902095229.59059-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

The atomisp firmware contains a number of different pipeline binaries
inside its firmware file and the driver selects the right one depending
on the selected pipeline configuration.

Sometimes (e.g. when the selected output resolution is too big) it fails
to find a binary. This happens especially when adding support for new
sensors.

Improve the logging when this happens to make debugging easier:

1. Replace ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, ...) with standard
   dev_dbg() calls so that the logs can be enabled with dyndbg

2. Do not dump_stack() when this fails, doing so adds no useful extra
   info

3. With the dump_stack() call gone, remove the wrapper and rename
   __ia_css_binary_find() to ia_css_binary_find()

4. On error use dev_err() instead of dev_dbg() so that when things
   fail it is clear why they fail without needing to enable dyndbg

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Note the log messages could also do with a bit of rewording and
reflowing them to put more arguments on a single line to use less
lines. I consider that out of scope for this patch which already
enough (see the 1-4 enough) something like this should be done
in a follow-up patch IMHO.
---
 .../atomisp/pci/runtime/binary/src/binary.c   | 295 +++++++++---------
 1 file changed, 139 insertions(+), 156 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index b0f904a5e442..1c72c2b5817f 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -923,8 +923,9 @@ ia_css_binary_fill_info(const struct ia_css_binary_xinfo *xinfo,
 	return 0;
 }
 
-static int __ia_css_binary_find(struct ia_css_binary_descr *descr,
-				struct ia_css_binary *binary) {
+int ia_css_binary_find(struct ia_css_binary_descr *descr,
+		       struct ia_css_binary *binary)
+{
 	int mode;
 	bool online;
 	bool two_ppc;
@@ -953,10 +954,10 @@ static int __ia_css_binary_find(struct ia_css_binary_descr *descr,
 	/* MW: used after an error check, may accept NULL, but doubtfull */
 	assert(binary);
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-			    "ia_css_binary_find() enter: descr=%p, (mode=%d), binary=%p\n",
-			    descr, descr->mode,
-			    binary);
+	dev_dbg(atomisp_dev,
+		"ia_css_binary_find() enter: descr=%p, (mode=%d), binary=%p\n",
+		descr, descr->mode,
+		binary);
 
 	mode = descr->mode;
 	online = descr->online;
@@ -1001,15 +1002,15 @@ static int __ia_css_binary_find(struct ia_css_binary_descr *descr,
 	}
 
 	/* print a map of the binary file */
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,	"BINARY INFO:\n");
+	dev_dbg(atomisp_dev,	"BINARY INFO:\n");
 	for (i = 0; i < IA_CSS_BINARY_NUM_MODES; i++) {
 		xcandidate = binary_infos[i];
 		if (xcandidate) {
-			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,	"%d:\n", i);
+			dev_dbg(atomisp_dev, "%d:\n", i);
 			while (xcandidate) {
-				ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, " Name:%s Type:%d Cont:%d\n",
-						    xcandidate->blob->name, xcandidate->type,
-						    xcandidate->sp.enable.continuous);
+				dev_dbg(atomisp_dev, " Name:%s Type:%d Cont:%d\n",
+					xcandidate->blob->name, xcandidate->type,
+					xcandidate->sp.enable.continuous);
 				xcandidate = xcandidate->next;
 			}
 		}
@@ -1021,9 +1022,9 @@ static int __ia_css_binary_find(struct ia_css_binary_descr *descr,
 		struct ia_css_binary_info *candidate = &xcandidate->sp;
 		/* printf("sh_css_binary_find: evaluating candidate:
 		 * %d\n",candidate->id); */
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-				    "ia_css_binary_find() candidate = %p, mode = %d ID = %d\n",
-				    candidate, candidate->pipeline.mode, candidate->id);
+		dev_dbg(atomisp_dev,
+			"ia_css_binary_find() candidate = %p, mode = %d ID = %d\n",
+			candidate, candidate->pipeline.mode, candidate->id);
 
 		/*
 		 * MW: Only a limited set of jointly configured binaries can
@@ -1032,17 +1033,17 @@ static int __ia_css_binary_find(struct ia_css_binary_descr *descr,
 		*/
 		if (!candidate->enable.continuous &&
 		    continuous && (mode != IA_CSS_BINARY_MODE_COPY)) {
-			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-					    "ia_css_binary_find() [%d] continue: !%d && %d && (%d != %d)\n",
-					    __LINE__, candidate->enable.continuous,
-					    continuous, mode,
-					    IA_CSS_BINARY_MODE_COPY);
+			dev_dbg(atomisp_dev,
+				"ia_css_binary_find() [%d] continue: !%d && %d && (%d != %d)\n",
+				__LINE__, candidate->enable.continuous,
+				continuous, mode,
+				IA_CSS_BINARY_MODE_COPY);
 			continue;
 		}
 		if (striped && candidate->iterator.num_stripes == 1) {
-			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-					    "ia_css_binary_find() [%d] continue: binary is not striped\n",
-					    __LINE__);
+			dev_dbg(atomisp_dev,
+				"ia_css_binary_find() [%d] continue: binary is not striped\n",
+				__LINE__);
 			continue;
 		}
 
@@ -1050,58 +1051,58 @@ static int __ia_css_binary_find(struct ia_css_binary_descr *descr,
 		    (mode != IA_CSS_BINARY_MODE_COPY) &&
 		    (mode != IA_CSS_BINARY_MODE_CAPTURE_PP) &&
 		    (mode != IA_CSS_BINARY_MODE_VF_PP)) {
-			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-					    "ia_css_binary_find() [%d] continue: (%d != %d)\n",
-					    __LINE__,
-					    candidate->pipeline.isp_pipe_version, isp_pipe_version);
+			dev_dbg(atomisp_dev,
+				"ia_css_binary_find() [%d] continue: (%d != %d)\n",
+				__LINE__,
+				candidate->pipeline.isp_pipe_version, isp_pipe_version);
 			continue;
 		}
 		if (!candidate->enable.reduced_pipe && enable_reduced_pipe) {
-			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-					    "ia_css_binary_find() [%d] continue: !%d && %d\n",
-					    __LINE__,
-					    candidate->enable.reduced_pipe,
-					    enable_reduced_pipe);
+			dev_dbg(atomisp_dev,
+				"ia_css_binary_find() [%d] continue: !%d && %d\n",
+				__LINE__,
+				candidate->enable.reduced_pipe,
+				enable_reduced_pipe);
 			continue;
 		}
 		if (!candidate->enable.dvs_6axis && enable_dvs_6axis) {
-			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-					    "ia_css_binary_find() [%d] continue: !%d && %d\n",
-					    __LINE__,
-					    candidate->enable.dvs_6axis,
-					    enable_dvs_6axis);
+			dev_dbg(atomisp_dev,
+				"ia_css_binary_find() [%d] continue: !%d && %d\n",
+				__LINE__,
+				candidate->enable.dvs_6axis,
+				enable_dvs_6axis);
 			continue;
 		}
 		if (candidate->enable.high_speed && !enable_high_speed) {
-			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-					    "ia_css_binary_find() [%d] continue: %d && !%d\n",
-					    __LINE__,
-					    candidate->enable.high_speed,
-					    enable_high_speed);
+			dev_dbg(atomisp_dev,
+				"ia_css_binary_find() [%d] continue: %d && !%d\n",
+				__LINE__,
+				candidate->enable.high_speed,
+				enable_high_speed);
 			continue;
 		}
 		if (!candidate->enable.xnr && need_xnr) {
-			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-					    "ia_css_binary_find() [%d] continue: %d && !%d\n",
-					    __LINE__,
-					    candidate->enable.xnr,
-					    need_xnr);
+			dev_dbg(atomisp_dev,
+				"ia_css_binary_find() [%d] continue: %d && !%d\n",
+				__LINE__,
+				candidate->enable.xnr,
+				need_xnr);
 			continue;
 		}
 		if (!(candidate->enable.ds & 2) && enable_yuv_ds) {
-			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-					    "ia_css_binary_find() [%d] continue: !%d && %d\n",
-					    __LINE__,
-					    ((candidate->enable.ds & 2) != 0),
-					    enable_yuv_ds);
+			dev_dbg(atomisp_dev,
+				"ia_css_binary_find() [%d] continue: !%d && %d\n",
+				__LINE__,
+				((candidate->enable.ds & 2) != 0),
+				enable_yuv_ds);
 			continue;
 		}
 		if ((candidate->enable.ds & 2) && !enable_yuv_ds) {
-			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-					    "ia_css_binary_find() [%d] continue: %d && !%d\n",
-					    __LINE__,
-					    ((candidate->enable.ds & 2) != 0),
-					    enable_yuv_ds);
+			dev_dbg(atomisp_dev,
+				"ia_css_binary_find() [%d] continue: %d && !%d\n",
+				__LINE__,
+				((candidate->enable.ds & 2) != 0),
+				enable_yuv_ds);
 			continue;
 		}
 
@@ -1115,100 +1116,100 @@ static int __ia_css_binary_find(struct ia_css_binary_descr *descr,
 				       candidate->vf_dec.is_variable ||
 				       /* or more than one output pin. */
 				       xcandidate->num_output_pins > 1)) {
-			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-					    "ia_css_binary_find() [%d] continue: (%p != NULL) && !(%d || %d || (%d >%d))\n",
-					    __LINE__, req_vf_info,
-					    candidate->enable.vf_veceven,
-					    candidate->vf_dec.is_variable,
-					    xcandidate->num_output_pins, 1);
+			dev_dbg(atomisp_dev,
+				"ia_css_binary_find() [%d] continue: (%p != NULL) && !(%d || %d || (%d >%d))\n",
+				__LINE__, req_vf_info,
+				candidate->enable.vf_veceven,
+				candidate->vf_dec.is_variable,
+				xcandidate->num_output_pins, 1);
 			continue;
 		}
 		if (!candidate->enable.dvs_envelope && need_dvs) {
-			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-					    "ia_css_binary_find() [%d] continue: !%d && %d\n",
-					    __LINE__,
-					    candidate->enable.dvs_envelope, (int)need_dvs);
+			dev_dbg(atomisp_dev,
+				"ia_css_binary_find() [%d] continue: !%d && %d\n",
+				__LINE__,
+				candidate->enable.dvs_envelope, (int)need_dvs);
 			continue;
 		}
 		/* internal_res check considers input, output, and dvs envelope sizes */
 		ia_css_binary_internal_res(req_in_info, req_bds_out_info,
 					   req_bin_out_info, &dvs_env, candidate, &internal_res);
 		if (internal_res.width > candidate->internal.max_width) {
-			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-					    "ia_css_binary_find() [%d] continue: (%d > %d)\n",
-					    __LINE__, internal_res.width,
-					    candidate->internal.max_width);
+			dev_dbg(atomisp_dev,
+				"ia_css_binary_find() [%d] continue: (%d > %d)\n",
+				__LINE__, internal_res.width,
+				candidate->internal.max_width);
 			continue;
 		}
 		if (internal_res.height > candidate->internal.max_height) {
-			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-					    "ia_css_binary_find() [%d] continue: (%d > %d)\n",
-					    __LINE__, internal_res.height,
-					    candidate->internal.max_height);
+			dev_dbg(atomisp_dev,
+				"ia_css_binary_find() [%d] continue: (%d > %d)\n",
+				__LINE__, internal_res.height,
+				candidate->internal.max_height);
 			continue;
 		}
 		if (!candidate->enable.ds && need_ds && !(xcandidate->num_output_pins > 1)) {
-			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-					    "ia_css_binary_find() [%d] continue: !%d && %d\n",
-					    __LINE__, candidate->enable.ds, (int)need_ds);
+			dev_dbg(atomisp_dev,
+				"ia_css_binary_find() [%d] continue: !%d && %d\n",
+				__LINE__, candidate->enable.ds, (int)need_ds);
 			continue;
 		}
 		if (!candidate->enable.uds && !candidate->enable.dvs_6axis && need_dz) {
-			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-					    "ia_css_binary_find() [%d] continue: !%d && !%d && %d\n",
-					    __LINE__, candidate->enable.uds,
-					    candidate->enable.dvs_6axis, (int)need_dz);
+			dev_dbg(atomisp_dev,
+				"ia_css_binary_find() [%d] continue: !%d && !%d && %d\n",
+				__LINE__, candidate->enable.uds,
+				candidate->enable.dvs_6axis, (int)need_dz);
 			continue;
 		}
 		if (online && candidate->input.source == IA_CSS_BINARY_INPUT_MEMORY) {
-			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-					    "ia_css_binary_find() [%d] continue: %d && (%d == %d)\n",
-					    __LINE__, online, candidate->input.source,
-					    IA_CSS_BINARY_INPUT_MEMORY);
+			dev_dbg(atomisp_dev,
+				"ia_css_binary_find() [%d] continue: %d && (%d == %d)\n",
+				__LINE__, online, candidate->input.source,
+				IA_CSS_BINARY_INPUT_MEMORY);
 			continue;
 		}
 		if (!online && candidate->input.source == IA_CSS_BINARY_INPUT_SENSOR) {
-			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-					    "ia_css_binary_find() [%d] continue: !%d && (%d == %d)\n",
-					    __LINE__, online, candidate->input.source,
-					    IA_CSS_BINARY_INPUT_SENSOR);
+			dev_dbg(atomisp_dev,
+				"ia_css_binary_find() [%d] continue: !%d && (%d == %d)\n",
+				__LINE__, online, candidate->input.source,
+				IA_CSS_BINARY_INPUT_SENSOR);
 			continue;
 		}
 		if (req_bin_out_info->res.width < candidate->output.min_width ||
 		    req_bin_out_info->res.width > candidate->output.max_width) {
-			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-					    "ia_css_binary_find() [%d] continue: (%d > %d) || (%d < %d)\n",
-					    __LINE__,
-					    req_bin_out_info->padded_width,
-					    candidate->output.min_width,
-					    req_bin_out_info->padded_width,
-					    candidate->output.max_width);
+			dev_dbg(atomisp_dev,
+				"ia_css_binary_find() [%d] continue: (%d > %d) || (%d < %d)\n",
+				__LINE__,
+				req_bin_out_info->padded_width,
+				candidate->output.min_width,
+				req_bin_out_info->padded_width,
+				candidate->output.max_width);
 			continue;
 		}
 		if (xcandidate->num_output_pins > 1 &&
 		    /* in case we have a second output pin, */
 		    req_vf_info) { /* and we need vf output. */
 			if (req_vf_info->res.width > candidate->output.max_width) {
-				ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-						    "ia_css_binary_find() [%d] continue: (%d < %d)\n",
-						    __LINE__,
-						    req_vf_info->res.width,
-						    candidate->output.max_width);
+				dev_dbg(atomisp_dev,
+					"ia_css_binary_find() [%d] continue: (%d < %d)\n",
+					__LINE__,
+					req_vf_info->res.width,
+					candidate->output.max_width);
 				continue;
 			}
 		}
 		if (req_in_info->padded_width > candidate->input.max_width) {
-			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-					    "ia_css_binary_find() [%d] continue: (%d > %d)\n",
-					    __LINE__, req_in_info->padded_width,
-					    candidate->input.max_width);
+			dev_dbg(atomisp_dev,
+				"ia_css_binary_find() [%d] continue: (%d > %d)\n",
+				__LINE__, req_in_info->padded_width,
+				candidate->input.max_width);
 			continue;
 		}
 		if (!binary_supports_output_format(xcandidate, req_bin_out_info->format)) {
-			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-					    "ia_css_binary_find() [%d] continue: !%d\n",
-					    __LINE__,
-					    binary_supports_output_format(xcandidate, req_bin_out_info->format));
+			dev_dbg(atomisp_dev,
+				"ia_css_binary_find() [%d] continue: !%d\n",
+				__LINE__,
+				binary_supports_output_format(xcandidate, req_bin_out_info->format));
 			continue;
 		}
 		if (xcandidate->num_output_pins > 1 &&
@@ -1217,11 +1218,11 @@ static int __ia_css_binary_find(struct ia_css_binary_descr *descr,
 		    /* check if the required vf format
 		    is supported. */
 		    !binary_supports_output_format(xcandidate, req_vf_info->format)) {
-			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-					    "ia_css_binary_find() [%d] continue: (%d > %d) && (%p != NULL) && !%d\n",
-					    __LINE__, xcandidate->num_output_pins, 1,
-					    req_vf_info,
-					    binary_supports_output_format(xcandidate, req_vf_info->format));
+			dev_dbg(atomisp_dev,
+				"ia_css_binary_find() [%d] continue: (%d > %d) && (%p != NULL) && !%d\n",
+				__LINE__, xcandidate->num_output_pins, 1,
+				req_vf_info,
+				binary_supports_output_format(xcandidate, req_vf_info->format));
 			continue;
 		}
 
@@ -1229,11 +1230,11 @@ static int __ia_css_binary_find(struct ia_css_binary_descr *descr,
 		if (xcandidate->num_output_pins == 1 &&
 		    req_vf_info && candidate->enable.vf_veceven &&
 		    !binary_supports_vf_format(xcandidate, req_vf_info->format)) {
-			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-					    "ia_css_binary_find() [%d] continue: (%d == %d) && (%p != NULL) && %d && !%d\n",
-					    __LINE__, xcandidate->num_output_pins, 1,
-					    req_vf_info, candidate->enable.vf_veceven,
-					    binary_supports_vf_format(xcandidate, req_vf_info->format));
+			dev_dbg(atomisp_dev,
+				"ia_css_binary_find() [%d] continue: (%d == %d) && (%p != NULL) && %d && !%d\n",
+				__LINE__, xcandidate->num_output_pins, 1,
+				req_vf_info, candidate->enable.vf_veceven,
+				binary_supports_vf_format(xcandidate, req_vf_info->format));
 			continue;
 		}
 
@@ -1241,37 +1242,37 @@ static int __ia_css_binary_find(struct ia_css_binary_descr *descr,
 		if (xcandidate->num_output_pins == 1 &&
 		    req_vf_info && candidate->enable.vf_veceven) { /* and we need vf output. */
 			if (req_vf_info->res.width > candidate->output.max_width) {
-				ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-						    "ia_css_binary_find() [%d] continue: (%d < %d)\n",
-						    __LINE__,
-						    req_vf_info->res.width,
-						    candidate->output.max_width);
+				dev_dbg(atomisp_dev,
+					"ia_css_binary_find() [%d] continue: (%d < %d)\n",
+					__LINE__,
+					req_vf_info->res.width,
+					candidate->output.max_width);
 				continue;
 			}
 		}
 
 		if (!supports_bds_factor(candidate->bds.supported_bds_factors,
 					 descr->required_bds_factor)) {
-			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-					    "ia_css_binary_find() [%d] continue: 0x%x & 0x%x)\n",
-					    __LINE__, candidate->bds.supported_bds_factors,
-					    descr->required_bds_factor);
+			dev_dbg(atomisp_dev,
+				"ia_css_binary_find() [%d] continue: 0x%x & 0x%x)\n",
+				__LINE__, candidate->bds.supported_bds_factors,
+				descr->required_bds_factor);
 			continue;
 		}
 
 		if (!candidate->enable.dpc && need_dpc) {
-			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-					    "ia_css_binary_find() [%d] continue: 0x%x & 0x%x)\n",
-					    __LINE__, candidate->enable.dpc,
-					    descr->enable_dpc);
+			dev_dbg(atomisp_dev,
+				"ia_css_binary_find() [%d] continue: 0x%x & 0x%x)\n",
+				__LINE__, candidate->enable.dpc,
+				descr->enable_dpc);
 			continue;
 		}
 
 		if (candidate->uds.use_bci && enable_capture_pp_bli) {
-			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-					    "ia_css_binary_find() [%d] continue: 0x%x & 0x%x)\n",
-					    __LINE__, candidate->uds.use_bci,
-					    descr->enable_capture_pp_bli);
+			dev_dbg(atomisp_dev,
+				"ia_css_binary_find() [%d] continue: 0x%x & 0x%x)\n",
+				__LINE__, candidate->uds.use_bci,
+				descr->enable_capture_pp_bli);
 			continue;
 		}
 
@@ -1290,13 +1291,6 @@ static int __ia_css_binary_find(struct ia_css_binary_descr *descr,
 		break;
 	}
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-			    "ia_css_binary_find() selected = %p, mode = %d ID = %d\n",
-			    xcandidate, xcandidate ? xcandidate->sp.pipeline.mode : 0, xcandidate ? xcandidate->sp.id : 0);
-
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-			    "ia_css_binary_find() leave: return_err=%d\n", err);
-
 	if (!err && xcandidate)
 		dev_dbg(atomisp_dev,
 			"Using binary %s (id %d), type %d, mode %d, continuous %s\n",
@@ -1306,23 +1300,12 @@ static int __ia_css_binary_find(struct ia_css_binary_descr *descr,
 			xcandidate->sp.pipeline.mode,
 			xcandidate->sp.enable.continuous ? "true" : "false");
 
+	if (err)
+		dev_err(atomisp_dev, "Failed to find a firmware binary matching the pipeline parameters\n");
 
 	return err;
 }
 
-int ia_css_binary_find(struct ia_css_binary_descr *descr,
-		       struct ia_css_binary *binary)
-{
-	int ret = __ia_css_binary_find(descr, binary);
-
-	if (unlikely(ret)) {
-		dev_dbg(atomisp_dev, "Seeking for binary failed at:");
-		dump_stack();
-	}
-
-	return ret;
-}
-
 unsigned
 ia_css_binary_max_vf_width(void)
 {
-- 
2.46.0


