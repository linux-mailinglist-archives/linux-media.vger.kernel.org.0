Return-Path: <linux-media+bounces-40612-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 702E3B2FC80
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 16:28:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE9AD720E07
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 14:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 280EB2882C9;
	Thu, 21 Aug 2025 14:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MGd/ulva"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB38279DB6;
	Thu, 21 Aug 2025 14:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755786099; cv=none; b=YpWPVzZllUlvxqabbZrPp6W4GjB6LuZupkXVhb/w3JlwcTbsGdKSUGimevHLokUOw+xc5zJTV1MXlssBK/lAq2zIBCtIRNE7ofCfy2vC7p6FZul81L3wVAPuOHbS4Zn6jr0YIIe1H84yRmlrc9ax0wxKowkbDi7K1GczLP2L/Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755786099; c=relaxed/simple;
	bh=6KNyilChtfEfKAJL2KTz7S3+EmJ+UL4s3OTBvprovpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k+PunpL4vdGsXE/aGQdU2km4QF4xJ7EyaGijHfV74GJF16pUKn945Hxt/sroxbtP4BVt5Xo72ZxIZyy5x+/d357XetwaAniwjETa5nd/OG2xpfp8vMuKcJm3o89w9U12z57fJ+Y+X2UG9E75pEKcJXnR3TOOLpALIw5R6rVUkKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MGd/ulva; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FE08C4CEF4;
	Thu, 21 Aug 2025 14:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755786099;
	bh=6KNyilChtfEfKAJL2KTz7S3+EmJ+UL4s3OTBvprovpQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MGd/ulvamzFNYwH8HntAI+wJCTDGmKqFD+/O6YmHkSRqjxWmSOl1kFLxtf1xUhCiB
	 j6egBehk81HRFuGoVZ79wloy7jC7cLXZZN6jZ2wmICNfpy6wCJpnyzsqv4AM2f2Q3k
	 7ztjg83kBZG8lZ8L07tuB1ewqXKPrwBbHgK0qSSkqtvSt+yEeFGm4lBOwhtDZm7CHH
	 Cq9Dh0nohIYuD72buLaK1YwjK/tdjPF1M1vHQwKSbIr5mlrdn8YfVxqto4slbXfBJN
	 1D98HLM2zqrwUjZczkMH4HLrr0iEO1FE0nF/ZRrJvoprbx4NG0jntmR/LoER/veBFu
	 v/ZrC2xoz1wlA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1up6Ab-0000000BT8a-0uCv;
	Thu, 21 Aug 2025 16:21:37 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 09/24] docs: uapi: media: Makefile: use parse-headers.py
Date: Thu, 21 Aug 2025 16:21:15 +0200
Message-ID: <a1530f4abe90fe86de97e4515d566619e624868a.1755784930.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1755784929.git.mchehab+huawei@kernel.org>
References: <cover.1755784929.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Now that we have a new parser, use it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/userspace-api/media/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/Makefile b/Documentation/userspace-api/media/Makefile
index 3d8aaf5c253b..accc734d045a 100644
--- a/Documentation/userspace-api/media/Makefile
+++ b/Documentation/userspace-api/media/Makefile
@@ -3,7 +3,7 @@
 # Rules to convert a .h file to inline RST documentation
 
 SRC_DIR=$(srctree)/Documentation/userspace-api/media
-PARSER = $(srctree)/Documentation/sphinx/parse-headers.pl
+PARSER = $(srctree)/tools/docs/parse-headers.py
 UAPI = $(srctree)/include/uapi/linux
 KAPI = $(srctree)/include/linux
 
-- 
2.50.1


