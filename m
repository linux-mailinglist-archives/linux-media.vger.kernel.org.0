Return-Path: <linux-media+bounces-14428-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ED991D4A4
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 00:44:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FD15280FB4
	for <lists+linux-media@lfdr.de>; Sun, 30 Jun 2024 22:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8373E768FD;
	Sun, 30 Jun 2024 22:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hfi+3QHt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6A357CBB
	for <linux-media@vger.kernel.org>; Sun, 30 Jun 2024 22:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719787486; cv=none; b=MIh319GzO+mV3GRwoTLpi9ez18gvPzYQF/tBKin0Vp9Bt8LHP2hWFVEtNNxzdoWRJZ2Ia3VtCJKEAZfxqXA2sA1Zjxkl/++rUqWBveSIlxj55a5Q1gvDsWIqD90RC9cFMQhbClkEt0yloi/uP0z1t+0NGehgT97dQFpOzelStCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719787486; c=relaxed/simple;
	bh=fOIhJz+0yod2SuxSAgHdmqPoeVWNlgLlZDHJ9qgMFzg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XIJ6BEMhnjshhz56IDibeTaPyTWhf1oGdfRc5SanHy6FBiAEgCir1hzjcAaDaFp8wBT72brvGg4O9swMootWdviOy+br/OZ8gJTweeIzSOknw7JZ+gln7wtdFbJG5aiKZ1s7BjeeL1GMIrSCANdG45IAFVccknqjFCHCcsAvvTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hfi+3QHt; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2c7ecfc9e22so1302577a91.0
        for <linux-media@vger.kernel.org>; Sun, 30 Jun 2024 15:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719787484; x=1720392284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WPV/17eP89KjnNG6iXD4b3yUiVesxwTGG7KbdEadf2w=;
        b=Hfi+3QHtxs6g1G85/TG/eJ5oejLuVRyARTLg2aDFLTtE1srlvaca6TQ+8rMxFrSafM
         kmiBC3uWMmjOiuJJZ13dvZVdijnjCCGKxatrK4en61rLjRzeORZNPyn6OHxPLg+HdSol
         WHrjx6NJHcwdLdC6ftsWz8LnCdLq/WJMsgXiW3Mbv0MLoUqGv2u+qDD+48ouXI4GLRs8
         yRsVTqk3rmjsU+lQYZY9MKyJPnsYSfOS0BBij3LzmBcEosuWUOYwGR8qVekYz4DWy1RC
         Ys4Vi6H7sMQkwR3J4NbV8ofWFKQwkkavkOAVKpROYl5VuWqNFynFUbyVtqvMzPpVGvL4
         K1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719787484; x=1720392284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WPV/17eP89KjnNG6iXD4b3yUiVesxwTGG7KbdEadf2w=;
        b=hsNip5WcTfJVnmtt0qcKJ6rkL2d+0JNbIuIkcMYO0Pe08Npn7UEsNysVnmR0wsI2y0
         SJreCt8sMvbe9aelgJgmHxR9i+rLmFIhMKPIwi0hS7lJ4dkC+wslNFWJu94hGc0D9q94
         i0eR9eTjFLvtmwCSd6XMUcDq6LVa0igEJdrIxq9Yu9LMmAOpMxKIGqS1qAd4MN4HoQBR
         X3TG7Gu2cl2Le7xfLmKkR/St5hcNUWQoCLMz1trZ/BFRkBMoEZ8VHt+X2MIjwhPdk3/3
         y3GLSOwnjQo4rp4le13Ybm5FUlQiTSH+oMcQztVdH5ZQfG3sVhBJ+Lug+Tepo9K5l4cN
         Zk8g==
X-Gm-Message-State: AOJu0YzvX+lSvk+mysLiOvmQ4he97iUwySetHDy9SAkHIe+N2UwnspOs
	clNfI5f8RNV9TNTaq9qROOcEHGA9c+5dI1ywiNKxNfdwHvDOcCzXSINoYQ==
X-Google-Smtp-Source: AGHT+IH0Z/DKKwzGb4pih6pIXa69IQYiG1nI22fgYPkMlqabaGPR+3nFY5ddpBmd33czN0G+En95BA==
X-Received: by 2002:a17:903:2446:b0:1fa:13fc:33ea with SMTP id d9443c01a7336-1fadbc8bca0mr20476445ad.16.1719787483531;
        Sun, 30 Jun 2024 15:44:43 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac15396casm51018995ad.175.2024.06.30.15.44.42
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 15:44:43 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-media@vger.kernel.org
Subject: [PATCH 2/4] v4l-utils: use 64-bit off_t format
Date: Sun, 30 Jun 2024 15:44:38 -0700
Message-ID: <20240630224440.5912-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240630224440.5912-1-rosenp@gmail.com>
References: <20240630224440.5912-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

musl uses 64-bit off_t by default on all platforms. Cast and fix format
to work everywhere.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/v4l2-tracer/retrace.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/v4l2-tracer/retrace.cpp b/utils/v4l2-tracer/retrace.cpp
index 60d64d8b..010936c0 100644
--- a/utils/v4l2-tracer/retrace.cpp
+++ b/utils/v4l2-tracer/retrace.cpp
@@ -72,7 +72,7 @@ void retrace_mmap(json_object *mmap_obj, bool is_mmap64)
 	                           (long) buf_address_retrace_pointer);
 
 	if (is_verbose() || (errno != 0)) {
-		fprintf(stderr, "fd: %d, offset: %ld, ", fd_retrace, off);
+		fprintf(stderr, "fd: %d, offset: %lld, ", fd_retrace, (long long)off);
 		if (is_mmap64)
 			perror("mmap64");
 		else
-- 
2.45.2


