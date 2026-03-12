Return-Path: <linux-media+bounces-55503-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGddGsvYsmlDQAAAu9opvQ
	(envelope-from <linux-media+bounces-55503-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 16:16:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 258FD274194
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 16:16:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 206CD30DB1B9
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 15:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEED73CB2C7;
	Thu, 12 Mar 2026 15:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bitbyteword.org header.i=@bitbyteword.org header.b="av5vlO/h"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89E43CAE8D
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 15:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773327959; cv=none; b=nnlj1f8qbDyqs3L0xb4w233BZVhIq2te6jqrynUm3URZtWcWrTKtEfUEWiHyWjKC6UYPh+oIyAbEPqvBr+s1koKG0t2ubJhoT/QPtaGwt7/4D76HRwevaoXLfPONEPwjhxeJhKouszRZ1jnyrJrzB49jVb/Tto7oPKqNDc3QBtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773327959; c=relaxed/simple;
	bh=CsLd9LpjDyThm27pkmlRfJ8mGowBNerp6e/POVZmOvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gz4jWpp4lzE6wmGoqs3SH/F8sJPagaZ1maYMPpD77vG7TIb3XKWBo0cFDc3W7IMWZzBGtPW6H9KbJOatZiKx/WyQnYbnqzcN+aV1UlyOv0KxPYn5ZSfd7BSp3aP18d6yIc437jZ9BdOMgcltrAswfU8WiaoGFK9omtod6nATcRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bitbyteword.org; spf=pass smtp.mailfrom=bitbyteword.org; dkim=pass (2048-bit key) header.d=bitbyteword.org header.i=@bitbyteword.org header.b=av5vlO/h; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bitbyteword.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bitbyteword.org
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7d55b97f358so883360a34.3
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 08:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bitbyteword.org; s=google; t=1773327957; x=1773932757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6q/8hBK1ObEUJJeEuPBlXFpYM8cpAj3EFJgYDsQfdk=;
        b=av5vlO/hWPSnXk3FoQ+G/eerbmozw34hKUXX4oTWuO5fgu//lr9HClDw3VejR4dYLO
         CLMdWp2eNrwkDP4zYNiY72Hr/u8K8FrBBS6gyFi0ML59Xm9JFDZLdaL1TowKB3xsHYjm
         bxI/vzAfLdznTye63FFgHbP5qmOsZ9Ko2qlZ+ckUNC0bVKxYVeTr57NQKGIQQnsr8+9v
         qWQRM3OENO8bmnMpL7s6PzEC5Ou2bym36M9TqUgfBjc6Swiitm1WUXYob89YO2C+e/03
         55FdW5AAW2TPxFnLG5EWM5PnqB9Bm9aTpcU9HkSTPHt41MGn9y006oBRrIh+h99IUH9Y
         6kBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773327957; x=1773932757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F6q/8hBK1ObEUJJeEuPBlXFpYM8cpAj3EFJgYDsQfdk=;
        b=OgiRrqjIV8hRhu+JXQeatD8lAkjIbpKzG9MQ3bcFtVgz8AH/sSWnY5DC74Wfco9HzQ
         p1A5YMk7iIPq4/DjP6hbZovGIlRCIrrX/3u2C64OHZ2ElYR6szarqZ8rdlzcX2lKYGxt
         gG/Xzxpb9TqZR/Wf8Pxgup/dBBcu7nIc8Hk0GViuPeNrfK8uPklrlQ/sFzZzfwf0rtib
         RfLup4NhwRnb4X5F7tshsYT1b83XeQxueDT1JyViCERC7JYEnYV7Skv9d1ZM67y8R1zO
         kn0YAynSR1xAJwyuW0nqa623E/UFjJ65lFfLMNHAl8TlN84PpVps0ZWpC9pP9HNHxV7G
         xazg==
X-Forwarded-Encrypted: i=1; AJvYcCXW0ivreqK7FsM11xvcmgPBtLSOsY3cs7lkcoA43gfytJuRurliPGsz14pIAHv8oi/fWVut55DnjN6W8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YywDptJkKdDan2H+LOOUnAsy/nyQr9Xxa9L1ayoOeQWBbEHYhhz
	Mhn65FcjLRzywcKH27Eq88C7j4hIQK6d+8rjyqwl4teAcjgQnonWvzh2aVMZAIyEGe4=
X-Gm-Gg: ATEYQzxU6heSs9xFvsy4U5mPGC41MakZbXiqhWnizl74Y9mAg+pxlXqbIYE6d2zavJs
	vV5aV6qXiQuFp80kizRNygRJBznfybkvS6FRXsuJmz2vgF99WLRrNTYGVytXYDirWW4juzjcUD9
	8cEhthz6NAzZsI/dxHJkvHlxL02sdX6QxGybE29+h8Id++gcWOuCLvQ7Guuz89VLpVSWVC1fSL2
	j8tPEU3Um5uHZpqcp5QYcOs4SgsS69Zxph0bNfHa/2sUoD/4dII7z0tufUjDaL2wMtKC2N8sx81
	aELqGMaQcS+SPdNHTtgj9P4T7GJJdQvsmQ2w8cqxH3Yk6YP2bsgzIyGVg7xU3SK5o7edp6eqo0R
	XC7LRwyFR0SfsCeG1vissE7e/nPQWeqjgjxjSPMgMEIsVu6uPPiK7BhomBBdWadjy+4Q7PQdVP1
	QbjUgVnyXAssDVRl9yrTvgdwgXxzHdFuWiFURqmiRM+TZVTVFOBCBxqTMJ3Q6je49E2thXE3S4L
	bgU
X-Received: by 2002:a05:6830:6a92:b0:7d7:4361:e33a with SMTP id 46e09a7af769-7d76a8da6b6mr4642874a34.30.1773327956799;
        Thu, 12 Mar 2026 08:05:56 -0700 (PDT)
Received: from vinmini.lan (c-73-143-21-186.hsd1.vt.comcast.net. [73.143.21.186])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d76aedae57sm4321776a34.28.2026.03.12.08.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:05:56 -0700 (PDT)
From: "Vineeth Pillai (Google)" <vineeth@bitbyteword.org>
To: 
Cc: "Vineeth Pillai (Google)" <vineeth@bitbyteword.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH 08/15] dma-buf: Use trace_invoke_##name() at guarded tracepoint call sites
Date: Thu, 12 Mar 2026 11:05:03 -0400
Message-ID: <20260312150523.2054552-9-vineeth@bitbyteword.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312150523.2054552-1-vineeth@bitbyteword.org>
References: <20260312150523.2054552-1-vineeth@bitbyteword.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bitbyteword.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bitbyteword.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55503-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[bitbyteword.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vineeth@bitbyteword.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[goodmis.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bitbyteword.org:dkim,bitbyteword.org:email,bitbyteword.org:mid,infradead.org:email]
X-Rspamd-Queue-Id: 258FD274194
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace trace_foo() with the new trace_invoke_foo() at sites already
guarded by trace_foo_enabled(), avoiding a redundant
static_branch_unlikely() re-evaluation inside the tracepoint.
trace_invoke_foo() calls the tracepoint callbacks directly without
utilizing the static branch again.

Suggested-by: Steven Rostedt <rostedt@goodmis.org>
Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Vineeth Pillai (Google) <vineeth@bitbyteword.org>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/dma-buf/dma-fence.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 35afcfcac5910..8884ad1ff0dab 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -535,7 +535,7 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
 
 	if (trace_dma_fence_wait_start_enabled()) {
 		rcu_read_lock();
-		trace_dma_fence_wait_start(fence);
+		trace_invoke_dma_fence_wait_start(fence);
 		rcu_read_unlock();
 	}
 	if (fence->ops->wait)
@@ -544,7 +544,7 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
 		ret = dma_fence_default_wait(fence, intr, timeout);
 	if (trace_dma_fence_wait_end_enabled()) {
 		rcu_read_lock();
-		trace_dma_fence_wait_end(fence);
+		trace_invoke_dma_fence_wait_end(fence);
 		rcu_read_unlock();
 	}
 	return ret;
-- 
2.53.0


