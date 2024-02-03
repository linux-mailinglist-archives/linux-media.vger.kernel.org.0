Return-Path: <linux-media+bounces-4633-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 225D3848491
	for <lists+linux-media@lfdr.de>; Sat,  3 Feb 2024 09:59:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6202A1F25DD5
	for <lists+linux-media@lfdr.de>; Sat,  3 Feb 2024 08:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97CDD5C905;
	Sat,  3 Feb 2024 08:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/6JKPvQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FB95C902
	for <linux-media@vger.kernel.org>; Sat,  3 Feb 2024 08:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706950766; cv=none; b=MGe4JaSPYEVfRIPZbFgrwW4A+MLtObUqV0OYQxowbPhl5QfQUeeaiZrkrL+IrA7FqD/3X+ndeUOqCVaosf3BIMPuAy4j4kCFTzVQ2xuPrGbDkdnoJ6bhmgUZjRLxOT8urVSYLqzoIyPxovjOg9sHgPtInRyPWefBO/A8DWOqmSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706950766; c=relaxed/simple;
	bh=ffVSefF62PxEzED67WMHXASvdQkJUoi1CXkFM9GJsYA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ERYhdYIE383SMRWViSswU8x6ha51hU/6oVfP2OXh1BldH1p4WIRBTsobJzkASpQLhaBPoiPLp6CQ6j91majHgOCEH9/LU9w/yS3NpIIy0QEzXTA2WrRStIaJ2zA+ShvNXnF6NHqiybs/krgxsJJppgOJVz8G7WS1CDsxmTlC+Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G/6JKPvQ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40fc6343bd2so12614135e9.1
        for <linux-media@vger.kernel.org>; Sat, 03 Feb 2024 00:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706950762; x=1707555562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AoaIqixVTkbZUeuWbyHAxkaqAjNkaRhcwndyAA7vs2g=;
        b=G/6JKPvQ7tJIWhwOdxcx18GqOa7G6/sryliBqi3p+ZWy8dsFimx/inmIti0qOKXM9J
         7nt/P/9NrXxuPHhWIfg1yIlLeAz/pC4Q+A2PrvDDxNDG6fFd34VNGkMiFpJsSGTL9e6T
         8zrr3/3U/ZB1XtNuKIevMKpxBY8mR/heE/P6vqLQocNzKO3PATHh7+0WkP+3ZvAYS4Xk
         La35oKN0TvOF1SXIh3PvHXc9CYbbM3Fxi39XcrOcB5zeGO/rKiwZhJmiZK7hTPJo/Ffi
         OlSLxMYQ28bshQwrDFHQ5p7H8+nQdga+wIRtqffLDNasLNRB0TR/guYJvkYnKB+GV/e4
         6L2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706950762; x=1707555562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AoaIqixVTkbZUeuWbyHAxkaqAjNkaRhcwndyAA7vs2g=;
        b=iSq4wROD4fc0TeSYYKaQLJCuDdzzvcftDadp9kPr4SYJ/7Y3/s963moD45mDUnov/+
         fYCcam/EVVA+xtJG6ibruBbX5e2Y0jsZhEI6//DcMXyL3AIHUKSHOvbC4rKJDqYoI+hb
         +fjL09PEpI8+rANOrPTOdz+EaNqJlirOvFeMpJo1V80MOeHjq4LCLRf28sTVgE/dduPR
         V4HJEpkxiYsKDhFhKY5sSojCKgHrE92gIkA6d5dhYPxHoROj27+4MjuRIekOBy+xDDAA
         eD9+zKSkVgQ3KTCmTvn1VvKtvnuAQcLg6qBGQ+JZ8Se+W8svfEggJcPzIdCBiL1xB0Gt
         2kiw==
X-Gm-Message-State: AOJu0Yx+XkXBzJTc6YFHLx3F1iwUMds+9YnhY1ixW6F6xS7fGxVQe8xr
	//g0a37Qk0pNOVvUdsBq3SsylfCa9HgFc7X8aaTOprGMVkUh6HxCHzifHBdEbA==
X-Google-Smtp-Source: AGHT+IHB53oornoneo7vKTHkKIZIw0gjWP27qSKJwP+i4ShTcBHd+oqi53xwVuq71K/+Fzxyv/sfqw==
X-Received: by 2002:a05:600c:19cf:b0:40e:fbdd:238a with SMTP id u15-20020a05600c19cf00b0040efbdd238amr501700wmq.37.1706950762203;
        Sat, 03 Feb 2024 00:59:22 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUfO1N6sg1CK3hs2ChW/b9rWQ6t0Vk0IRpoOqJ5+khWLOuJpuiLKj455VycuRrzfdR9/RM1G6AZvbAA3+3CfN3pPUZC16rmeCNe5jhuQg9fMaQ6WKDsOB9T
Received: from localhost.localdomain ([105.163.2.172])
        by smtp.gmail.com with ESMTPSA id n8-20020a05600c500800b0040fd1629443sm773538wmr.18.2024.02.03.00.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Feb 2024 00:59:21 -0800 (PST)
From: Dorcas Anono Litunya <anonolitunya@gmail.com>
To: linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl,
	jaffe1@gmail.com,
	Dorcas Anono Litunya <anonolitunya@gmail.com>
Subject: [PATCH] documentation: media: vivid: Modify typo in documentation
Date: Sat,  3 Feb 2024 11:58:05 +0300
Message-Id: <20240203085805.107653-1-anonolitunya@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct the default value of node_type vivid parameter to 0xe1d3d.

Signed-off-by: Dorcas Anono Litunya <anonolitunya@gmail.com>
---
 Documentation/admin-guide/media/vivid.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/media/vivid.rst b/Documentation/admin-guide/media/vivid.rst
index 58ac25b2c385..b6f658c0997e 100644
--- a/Documentation/admin-guide/media/vivid.rst
+++ b/Documentation/admin-guide/media/vivid.rst
@@ -60,7 +60,7 @@ all configurable using the following module options:
 - node_types:
 
 	which devices should each driver instance create. An array of
-	hexadecimal values, one for each instance. The default is 0x1d3d.
+	hexadecimal values, one for each instance. The default is 0xe1d3d.
 	Each value is a bitmask with the following meaning:
 
 		- bit 0: Video Capture node
-- 
2.34.1


