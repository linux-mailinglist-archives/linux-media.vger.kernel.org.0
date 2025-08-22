Return-Path: <linux-media+bounces-40775-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E239DB31B7E
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 16:29:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA74BB285AF
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 14:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EFC63128D0;
	Fri, 22 Aug 2025 14:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="miAKsje/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56CA31197D;
	Fri, 22 Aug 2025 14:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755872388; cv=none; b=F//AVQtH4fcPehIUxjNrO3oMqAdmYMFB9ViSBiH6OiE6bba1rfCLAFgr+5TVjeBKrgZKegaiwg+MbugvtsCvYVweUvaISN2XmLFIW6UR77gm7ihR/zqw2a9f8KNAvFDOB71wn0UC8iK6YQrbDEDQljvStSEh0XS8mu8qt8e7kBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755872388; c=relaxed/simple;
	bh=6KNyilChtfEfKAJL2KTz7S3+EmJ+UL4s3OTBvprovpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y68VDYw/nomqRSEOub7Cx5CcJ9yCLS8faowqiHd+BMOi2t5dRgyMUJkF1ZtCPycfpXfQHLqqdgKVh7+imfoLPudKvE+JyYiMEBMy7mWPgapqHRu8EFwX4CWzTl88X/+5XYwypIRtxA+i5YHZ28f+pTAk8w8txWwFBfs5vCR1/iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=miAKsje/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BACEC2BC87;
	Fri, 22 Aug 2025 14:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755872388;
	bh=6KNyilChtfEfKAJL2KTz7S3+EmJ+UL4s3OTBvprovpQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=miAKsje/nfOyunqaqtj4aa3jGRjwdsh3CVfqAUM0XNA7e0ukqTN/HJRKYVxST7EKs
	 t9pvMB9/OHsSZdQz45SC4OmGD0xlWXWqE+jZ+qMTps+sItb44S3lgN8P/lS47ZlxVX
	 X4Ew8ZEUoS5/7QS8bLEGVWi6ZxR8nVUwW8fa5755zdn6LMHYVmc9klkFyweHuzld+r
	 Ff5G2Xybd23mxysIMlDrEONskhMZguzx63hxuYVCmMMdWGl6jO9XkWfX5PsXyJyai0
	 5rut41JyxHalBAXtdAbgzJqjolHU++Bo6vrIXx0IedNx+hTeJwuJWPXRH2pyeei0BX
	 kqzRlP4qFg3Iw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1upScM-0000000CCrR-1RxK;
	Fri, 22 Aug 2025 16:19:46 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2 09/24] docs: uapi: media: Makefile: use parse-headers.py
Date: Fri, 22 Aug 2025 16:19:21 +0200
Message-ID: <7025759744f74058eee55c35e8cd8cb5a2953fca.1755872208.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1755872208.git.mchehab+huawei@kernel.org>
References: <cover.1755872208.git.mchehab+huawei@kernel.org>
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


