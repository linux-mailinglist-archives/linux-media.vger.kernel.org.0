Return-Path: <linux-media+bounces-31090-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A879CA9D83B
	for <lists+linux-media@lfdr.de>; Sat, 26 Apr 2025 08:15:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2001179512
	for <lists+linux-media@lfdr.de>; Sat, 26 Apr 2025 06:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AD8B1B0406;
	Sat, 26 Apr 2025 06:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kkFI1IrL"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA00211C;
	Sat, 26 Apr 2025 06:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745648132; cv=none; b=ts8S4XtDbxSeDYbm6TOoLIkFNmPZ1YWJlSmsv7l53oU6APE0VswnQRxXS9/6ZymQ2yQosA5DqRbIZgjE6JizDDE+a3k7EZa7GIKtwD9EEFprD681s+ZnF7JvP7Ww9pn4ajb7ydVUJYdTw3fcjneCXROwgsQFf6/8gZZOiApa/hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745648132; c=relaxed/simple;
	bh=mxCUaaqj8mwcZsewtRcy5pF5fmWFDs+r5MaxX0wTrqc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=g++8uhXMpKmYBKrPmdEy2uQLWWbwce4LDXdSEPAHRSqaYJ2D/zB8x2LELQNmRwcb2f28gt9cBYkKbPVR/Y6ObFttFdCMkN1tbu8D9coJEpjPvAIrKaTLRxTcJz6WTZkcFLhgL4zUu3RnD1gvdyJ1nQJBptCwhq7I6axDuui78pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kkFI1IrL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A9BBC4CEE2;
	Sat, 26 Apr 2025 06:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745648131;
	bh=mxCUaaqj8mwcZsewtRcy5pF5fmWFDs+r5MaxX0wTrqc=;
	h=From:To:Cc:Subject:Date:From;
	b=kkFI1IrLTK0aACJ7gZ/yLEFFfaa+kNZAVkalayMKjTEutDzdEFjbKfOc6k11cF3YO
	 f9D7W+VHPCZxh6zbj8Q00oAWB25M6c5DduTy4gaf97L3DYscuoR2dLwVnGlpYZj/xb
	 Vpkf3a/gAOrHb9Y7ilOiAAq3D4KZ03gtZBY2p9+UlPifeafFCbDLWvz9zn2ijdw9yK
	 9SaALKojSTRb9Vun73p+fZOB0nKh6k8g13K9bcfZkiIJ3OpsQNLqu1xRwMvAR1+ugy
	 1zH1hTQHEoQuic1L4ns51BmidwYAN6YY18/k8gnHLn3JntxRqti3dBERrrcw0WRrWY
	 jH4uWwuZltRcA==
From: Kees Cook <kees@kernel.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Kees Cook <kees@kernel.org>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] media: iris: Cast iris_hfi_gen2_get_instance() allocation type
Date: Fri, 25 Apr 2025 23:15:27 -0700
Message-Id: <20250426061526.work.106-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1624; i=kees@kernel.org; h=from:subject:message-id; bh=mxCUaaqj8mwcZsewtRcy5pF5fmWFDs+r5MaxX0wTrqc=; b=owGbwMvMwCVmps19z/KJym7G02pJDBk8lf8/L1zdfnqr/7SgAl+WQ4e2Ploz1zio/0rkxk4e2 wNL70/I6ChlYRDjYpAVU2QJsnOPc/F42x7uPlcRZg4rE8gQBi5OAZjIz5+MDDdOF5+KsT/2Obd6 8yX53/pB0m4rmiZulxKdO61pa9HNDQUMv9mPme83m7covjxsRss16Yuz56Uy/d6mlfbx2/mAA3K SEzgB
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

In preparation for making the kmalloc family of allocators type aware,
we need to make sure that the returned type from the allocation matches
the type of the variable being assigned. (Before, the allocator would
always return "void *", which can be implicitly cast to any pointer type.)

The assigned type is "struct iris_inst *", but the returned type is
"struct iris_inst_hfi_gen2 *". The allocation is intentionally larger as
the first member of struct iris_inst_hfi_gen2 is struct iris_inst, so
this is by design. Cast the allocation type to match the assignment.

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: <linux-media@vger.kernel.org>
Cc: <linux-arm-msm@vger.kernel.org>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index a908b41e2868..351820deb893 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -953,5 +953,5 @@ void iris_hfi_gen2_command_ops_init(struct iris_core *core)
 
 struct iris_inst *iris_hfi_gen2_get_instance(void)
 {
-	return kzalloc(sizeof(struct iris_inst_hfi_gen2), GFP_KERNEL);
+	return (struct iris_inst *)kzalloc(sizeof(struct iris_inst_hfi_gen2), GFP_KERNEL);
 }
-- 
2.34.1


