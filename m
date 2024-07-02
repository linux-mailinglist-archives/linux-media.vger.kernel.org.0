Return-Path: <linux-media+bounces-14553-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D96D8924861
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 21:34:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 941C62831C1
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 19:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 456651CE09B;
	Tue,  2 Jul 2024 19:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AQDE/297"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C13B1CCCDA
	for <linux-media@vger.kernel.org>; Tue,  2 Jul 2024 19:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719948829; cv=none; b=ZSlAuT4YzFkThdUgEIF+Mouy0wB0uY7UNfjndYDhxhVKrsw2EKqoyZ+muPfftNhvz07gjeBuF9qd6/8ZINvAM2N+c0koRIMxSeJ7T5j6/lYPQVjRBiNYNmtVUfZHzCyMzV26LjdWXx/nxoJ6PLUC4ZuPK5si0HPhN+p4acG88uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719948829; c=relaxed/simple;
	bh=fOIhJz+0yod2SuxSAgHdmqPoeVWNlgLlZDHJ9qgMFzg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sII86BPcBZTRKMxbr8RXUOYgk+tjAwytsuFKmuawC3GM+HJTnhxLQllqd/OZY4eS5VkoVLshm/tvzao9W045XOOkemcihebyNL8Hj5DS69lgeuICWznR/GiioERUym7QH931vXjNOqtbSGZjnE+aPxtW100UuEam26i6SJ4DaS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AQDE/297; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1f9fb3ca81bso26427125ad.3
        for <linux-media@vger.kernel.org>; Tue, 02 Jul 2024 12:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719948827; x=1720553627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WPV/17eP89KjnNG6iXD4b3yUiVesxwTGG7KbdEadf2w=;
        b=AQDE/297iTuMJfjk7XetbR4jh4i/MmEZg45gtpeUqo4nwYDu9LhQb2/Xc+QGVwJfdl
         vvMSb55Gbwyv2eCR2qwmZiKqkUbrv9fiuzjiyBezvKvVmN16YhOb9P72xng38h85bLFr
         hrbd7AnhZEKr7Sj85NeizmLUfSBi0JPsKFDcTQg/NA/xZ3TDQhV4jz5WozALu+p3xzx/
         TBrpYWJkWo8sfycE9SwT2F2nuhUH109Y1Y1NhYvqCyBfWyiZggGo7qNqIcXtO6xT0Chw
         igj8QCHjO5DErozyngoCz6kDJczfkHLB0KII0lee4+vKzgm4vxla2KEHK8mvM5qt88n+
         vePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719948827; x=1720553627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WPV/17eP89KjnNG6iXD4b3yUiVesxwTGG7KbdEadf2w=;
        b=D2mTnD0wjB5xyjhosZ+kQKBWi3grsqb2yDakehmcMlch/dEVS74l2nDuJEXbHBaMnD
         Rz6nwC3LRqaTdTabHx8MbSlJaIduug1vutA1+GlGjmheK4UBdZcNjkkmAFLRVOSkhjof
         LiKus1Rhxfj3T83U/RJm032xRYBjHvWOoq55vbRuZaPS8SRzz3oh/HWNOGMr+5KDQ5xI
         dALl3fhL0GH/5AIo2kptRwOvdALLWlg8jYiA/Hp6NzjNIUVcKgSQKHpFZrnCDrZ16RH5
         94J7cKNfBXYry3h7QrPmRCxfPZu8Ig/BcDqVwY1K5EcG9M/IOGkdIIwmpzekJA0cACqJ
         uDHg==
X-Gm-Message-State: AOJu0YzKw+DB7IGyJ8S/3dt7XHXyzqu7nQ8FKoC0NWC7LbotpxuctoBE
	ucjST9/l72WDF2PkpO8OdGgje6XoUJpYw0QtvQIrUuVaHfxY+LJYtb/fbw==
X-Google-Smtp-Source: AGHT+IHC151wiVBhSKHdTqWhDSfpQmTJhIVUhZc5FuRL+ZyHHumV0/DNCirqZkt2MxXgpL4Ha7hLgg==
X-Received: by 2002:a17:902:f68e:b0:1fa:925b:5b77 with SMTP id d9443c01a7336-1fadbd07fc8mr67128385ad.64.1719948827339;
        Tue, 02 Jul 2024 12:33:47 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac1538fe7sm88441795ad.172.2024.07.02.12.33.46
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 12:33:46 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-media@vger.kernel.org
Subject: [PATCH 3/4] v4l-utils: use 64-bit off_t format
Date: Tue,  2 Jul 2024 12:33:42 -0700
Message-ID: <20240702193343.5742-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240702193343.5742-1-rosenp@gmail.com>
References: <20240702193343.5742-1-rosenp@gmail.com>
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


