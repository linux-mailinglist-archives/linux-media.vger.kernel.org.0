Return-Path: <linux-media+bounces-49587-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB6CCDF83B
	for <lists+linux-media@lfdr.de>; Sat, 27 Dec 2025 11:56:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06B9730054B5
	for <lists+linux-media@lfdr.de>; Sat, 27 Dec 2025 10:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6D862749CF;
	Sat, 27 Dec 2025 10:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I21YEpwb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADAA2673B7
	for <linux-media@vger.kernel.org>; Sat, 27 Dec 2025 10:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766832974; cv=none; b=TwffTzXkZzDlOPtll86gjkMTOYYl6vK2hhabdSuc5tAlRAG4dRtqeBJsk5pIoPzhbIr2dg1ua48gdZetn+SYE2bR3lbG1SR5fhzYlRIjwKCBM3L41XLIshc1PzEizKHV5W6MRYVrq1bb1vPgrGJo9YGCpCLXKBi35m/kQlunhVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766832974; c=relaxed/simple;
	bh=rwK8Yb8lMppqkdA0k3CGzENNnh2QljvEb2uEw3c5S/0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=do1fDKhE+flvmPf5cKt8LV5oJUqk7togp0KmJZbwFd85G75hO9DDKy0jMulEJQkxuoJYiIxYDqMB0ewlbDvHjJ5wPf0r8pYlYKqDkRNVD7xIbls17U/0xF8vbYOlXRGLfTYXnZKcFXHlYKLhHp2PwAntQMz+JN05dfmaGWScCso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I21YEpwb; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7b9387df58cso12611679b3a.3
        for <linux-media@vger.kernel.org>; Sat, 27 Dec 2025 02:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766832972; x=1767437772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LVirW5At3YCuRHq9p7Wco6R/vGAcg0AwQjMQ8Fn6NiU=;
        b=I21YEpwb/56U6UJK+12gryXQ2cVEk1h+l9HqVxhbXPMaw/WcWv1/v/5eSImrjfu8DL
         fOHMTP29Wil5uex6LADJo1XxIxH+Ph8ZOKx2EgCwuUs5KcigO6v68LZofYQei1VJPatv
         Ax2aMUPlJSQERT8EaTKH89wOLkEnxDtEmCjAQ4upWO5FkpQpytBViTV9dVaL3aK2Dkc6
         r3/CZLJZrQb7IORCcJ+7k7pKFeXFGdwgnKSOhJ82Zp38FLzeRkAUMc71myIqWFPkBX0f
         7d0pccMcBPYSJV83G+hFYvyxCZMLjPBA+gGGU2Ubhpxi+PQWh9PkJte0/YcmosA0zAVA
         yK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766832972; x=1767437772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVirW5At3YCuRHq9p7Wco6R/vGAcg0AwQjMQ8Fn6NiU=;
        b=ZycZDxs6mX5ixOYA/jcN2M2l0mdphc09ZUqt92QIn55/pOrt95cVpI/0EcxEHQk16k
         Adm7YdJS2X5bvl9RTC1J5fa9biH/IH1YX/CYSGIp72+FKHKzjoDJjdev4uG03RLLVLH1
         yJYk88OrGyP9uyv4qWo2xtg8mCPW3GLHctjSqh/mHDhp/zTrXbTlGq3PVFGW9jCj8zXF
         9c509HS8CBF8iv7pp9bFwt582ZxaRNhEkLhdnNFqulE7g5HOEQF1nBnsRLAEvcwe6B1c
         5uhKuTR/OCYhvJxgf8fEvFvDjiFXCL0NBe0g+K6oIj4j/m2Puq8kB+lnlffE3OAeQmpM
         owtw==
X-Forwarded-Encrypted: i=1; AJvYcCV6Af+q6DzSI249GZAroI/Ta38d1Wg+IVXs6Wa90jhONxk/mUd6/yQgebqpTUGm+Lku3kBUOssob8H+ew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yys+e4CKHgl3fJF/xPexZJ4bOmbBjwTG6rwKreZXIkbEx9+y3Dy
	fmm+bKyUp0MhxHtb3Md+6CUuZNQRrJLIFCyrlWig1Tn2riwlwdwAfqfV5J6qiA==
X-Gm-Gg: AY/fxX4rFEYVavyfzT6RLBfTxFc8Lr1a+9EeGhIHUT7Sw3Zh+OPspy/VIc1bETX6bbx
	3DQeG4CSjhieuQHx2K1xP4BSC6sHrxxX7a5F7Z5ZqXnvAZgZEkYUIi3GpfdEotq4gbdQn0dU9KD
	+Y0Wb8/MUs6juq3H/6JYDTLAxEYwfKfK+6bj/G+OzaX/DhF0zzsSwfcARBonlfKblKtTNhO8n+p
	MllLPSAh4asaCHX+H1kwjHOGLJHUL2Y6n7kEZBakAR0FqZLzzXQXdZRzhWWyK0RK4CVy9aCv1OJ
	ig5jw/ijIi60ndDezVqSmi6c3UvVH2oyVnajibYzcXR21fdhRj2rbe8FJRo0U14abfnK1hUoQ+s
	yN/bSI9tE7Dp4xGlWNEAv8gO6WWjJ3+/1oIYShlNKL0vDlExl24VgJ+LFBQ8B0zcxQTalB9Ei29
	p6c8s1BJl/Zac=
X-Google-Smtp-Source: AGHT+IG8WBFof84aUXLTwKlxQlmnuR5dooYmbUKjfMbjmU/pNywcIPii27EqnSFFQ7LuiEuPTwLpKw==
X-Received: by 2002:a05:6a00:4190:b0:7e8:450c:61a5 with SMTP id d2e1a72fcca58-7ff6705c572mr23370792b3a.60.1766832971979;
        Sat, 27 Dec 2025 02:56:11 -0800 (PST)
Received: from karthik.. ([43.247.159.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e589b0csm24762552b3a.56.2025.12.27.02.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 02:56:11 -0800 (PST)
From: Karthikey D Kadati <karthikey3608@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikey D Kadati <karthikey3608@gmail.com>
Subject: [PATCH] staging: media: atomisp: fix block comment coding style
Date: Sat, 27 Dec 2025 16:25:20 +0530
Message-ID: <20251227105520.23086-1-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the checkpatch.pl warning:
WARNING: Block comments use a trailing */ on a separate line

This change aligns the block comment at line 1384 with the standard
Linux kernel coding style for better readability.

Signed-off-by: Karthikey D Kadati <karthikey3608@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 3a4eb4f6d..327836372 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1380,8 +1380,10 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
 	if (atomisp_css_get_grid_info(asd, pipe_id))
 		return;
 
-	/* We must free all buffers because they no longer match
-	   the grid size. */
+	/*
+	 * We must free all buffers because they no longer match
+	 * the grid size.
+	 */
 	atomisp_css_free_stat_buffers(asd);
 
 	err = atomisp_alloc_css_stat_bufs(asd, ATOMISP_INPUT_STREAM_GENERAL);
-- 
2.43.0


