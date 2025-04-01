Return-Path: <linux-media+bounces-29164-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B0EA77EA1
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 17:13:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0AE716ADFE
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 15:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8DB51ACED1;
	Tue,  1 Apr 2025 15:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hr8lUFde"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D26C205510;
	Tue,  1 Apr 2025 15:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743520357; cv=none; b=et3iT1dL73BjiLDMSnfMe8xxXi6QrM1tnTFcWJnJf2Demj7mOTOMWHNwWSfsvo8B/j8jx/fQYnUYqUeB2/6tYPLuYGJT+7vFQp5LFJb1toXxeesyOHKtmg3eBqq7SWirVVaKhzvxDoyXx43PU5MiiQdu1mbgueXIQdEDy5cAe30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743520357; c=relaxed/simple;
	bh=27MxOwa0fmEfX/9H4+tLla6KG4vQ8w1k90H6/5GWbIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WQGadsEAnEtL3QMMoNy0plA4/AAbg4GHNWeWD0DoxAPHRilpgGOD5kqwPRcC6TNlrn0z5M2m1Ou56td1YahnRednQuPFZALjep0xlb63AFseN6cmLoLv/qTMlbnetjEO3Hi65dkxv5LYK94GRZO/x4SgX0DgRmqQebMEtMY+Jg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hr8lUFde; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA2EC4CEE9;
	Tue,  1 Apr 2025 15:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743520356;
	bh=27MxOwa0fmEfX/9H4+tLla6KG4vQ8w1k90H6/5GWbIg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Hr8lUFdexJsRLQMvm29VTlAGCQO0L1pZLvDlAwjxZ4bpErfqzIpjLBq2OtOXxzRh9
	 VFBC7Opxicgqb6+hrI0Y/HxJapJuGmLLJ9TGRvNGkwkQqnIz4BO8mMFMw++YK4hbJW
	 o6PIJhEo05AWLoAdMyGcdIBi9BBqEr6CzCVmGDWVLCFpaHiu0Bs276XRKu97e1VgCB
	 atGqBUF5fCLolrotK3MCo0KjkWouPGlD6hl4n4kqI7pFmXBUNzNcVotkL0bbPyYwEl
	 SWq0xGv3MDWv08TASTLKCqNWi48TWDmdk5xuuykpkFnBPcJHhlIho8dIaG0DckpUhV
	 bN9rth5Lj2aIg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 01 Apr 2025 17:12:21 +0200
Subject: [PATCH v2 1/2] dma-buf: heaps: system: Remove global variable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-dma-buf-ecc-heap-v2-1-043fd006a1af@kernel.org>
References: <20250401-dma-buf-ecc-heap-v2-0-043fd006a1af@kernel.org>
In-Reply-To: <20250401-dma-buf-ecc-heap-v2-0-043fd006a1af@kernel.org>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1768; i=mripard@kernel.org;
 h=from:subject:message-id; bh=27MxOwa0fmEfX/9H4+tLla6KG4vQ8w1k90H6/5GWbIg=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOlvmCKKlxsyzbi2ILc0RZkjiSUqyWlmZ6HH8/Jalmvej
 Vu3HC/tKGVhEONikBVTZIkRNl8Sd2rW6042vnkwc1iZQIYwcHEKwEQWCzMyLHeP6tMWm3gqIU5A
 UbhhDs/yqbXrpDjCDqULiC5quRJ8gOF/uaKY3q+X4RlO8p3brr/5UuO2eduaf2vilOfuWLKNSz2
 IFwA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The system heap has been using its struct dma_heap pointer but wasn't
using it anywhere.

Since we'll need additional parameters to attach to that heap type,
let's create a private structure and set it as the dma_heap drvdata,
removing the global variable in the process.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/dma-buf/heaps/system_heap.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 26d5dc89ea1663a0d078e3a5723ca3d8d12b935f..adf422eaa33a52794f952d9d4260b8743d37f421 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -19,11 +19,13 @@
 #include <linux/module.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 
-static struct dma_heap *sys_heap;
+struct system_heap {
+	struct dma_heap *heap;
+};
 
 struct system_heap_buffer {
 	struct dma_heap *heap;
 	struct list_head attachments;
 	struct mutex lock;
@@ -422,17 +424,22 @@ static const struct dma_heap_ops system_heap_ops = {
 };
 
 static int __init system_heap_create(void)
 {
 	struct dma_heap_export_info exp_info;
+	struct system_heap *sys_heap;
+
+	sys_heap = kzalloc(sizeof(*sys_heap), GFP_KERNEL);
+	if (!sys_heap)
+		return -ENOMEM;
 
 	exp_info.name = "system";
 	exp_info.ops = &system_heap_ops;
-	exp_info.priv = NULL;
+	exp_info.priv = sys_heap;
 
-	sys_heap = dma_heap_add(&exp_info);
-	if (IS_ERR(sys_heap))
-		return PTR_ERR(sys_heap);
+	sys_heap->heap = dma_heap_add(&exp_info);
+	if (IS_ERR(sys_heap->heap))
+		return PTR_ERR(sys_heap->heap);
 
 	return 0;
 }
 module_init(system_heap_create);

-- 
2.49.0


