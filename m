Return-Path: <linux-media+bounces-7093-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D92AA87C13A
	for <lists+linux-media@lfdr.de>; Thu, 14 Mar 2024 17:27:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7810F1F22117
	for <lists+linux-media@lfdr.de>; Thu, 14 Mar 2024 16:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 530817352C;
	Thu, 14 Mar 2024 16:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mail.tikatika.nl header.i=@mail.tikatika.nl header.b="PWysMl3z"
X-Original-To: linux-media@vger.kernel.org
Received: from tika.stderr.nl (tika.stderr.nl [94.142.244.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6F87351B
	for <linux-media@vger.kernel.org>; Thu, 14 Mar 2024 16:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.142.244.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710433666; cv=none; b=MUXEa98rrY/ABDt3yHol3hZE+rkIXLYTpbdC1B3+wAUlqYwbO1M4tm//hZ+du4iFGT5EKzVxuRnXmeZ53c58IgIjiKsxG62G91k1oScect1qnq0JgBsTokwj6ocPgyBgdA3leo9jbVjssriaJhV4Vq9Es9mlQEBQ4C36lk55ZQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710433666; c=relaxed/simple;
	bh=oNFSqlaG4x7we24V8dokKP1YpyR6/0jKC7+q4AUhTQU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XG42+/9Dl4zotg0+QrnzRghk6bVD9XIkzX9YqafSWOwrHqY8ucdMxDisoUPFZI4MfK6WUEH25H7FIa+ReKTLDMI9ruzwER2ne9/rFlDFmkQMumJdhkCkgNaW7aQw3gqSpo36dangswBYfmnl1JTB/5EWU3OHq4OVCnwcpo/7MLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stdin.nl; spf=none smtp.mailfrom=stdin.nl; dkim=pass (1024-bit key) header.d=mail.tikatika.nl header.i=@mail.tikatika.nl header.b=PWysMl3z; arc=none smtp.client-ip=94.142.244.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stdin.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stdin.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mail.tikatika.nl; s=201709.tika; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XBkuPEAr5U5qPNPTTDZwYjzo7U5PVKEMZ5UAlphWfRE=; b=PWysMl3zuo1VJUIyoUlrR8BVtJ
	YVIO+bRq/lTdqnhHCnzLZjYJEBvLSbKokIn2tN6tGnKcZonouu8SIgU58U8nIZEp3sRnTyHEe4eiP
	Bi3gN3MZ+kEnusPW8O4QtuU+J4WiX7vWFpWs4RJwlT2zJLRAtg7ppshSQEgVLZlXrNZg=;
X-Preliminary-Spam-Score: -2.3 (--)
Received: from 89-250-188-118.tangos.nl ([89.250.188.118] helo=dottie)
	by tika.stderr.nl with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <matthijs@stdin.nl>)
	id 1rkncn-000YW6-2p
	for linux-media@vger.kernel.org;
	Thu, 14 Mar 2024 17:08:10 +0100
Received: from matthijs (uid 1000)
	(envelope-from matthijs@stdin.nl)
	id 4037e
	by dottie (DragonFly Mail Agent v0.13);
	Thu, 14 Mar 2024 17:08:09 +0100
From: Matthijs Kooijman <matthijs@stdin.nl>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthijs Kooijman <matthijs@stdin.nl>
Subject: [PATCH] media: docs: Fix mem_offset name in multiplane example
Date: Thu, 14 Mar 2024 17:06:07 +0100
Message-Id: <20240314160606.111354-1-matthijs@stdin.nl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The v4l2_buffer type has an "offset" field, but the corresponding field
in the v4l2_plane type is called "mem_offset". Use the correct name in
this example.

Signed-off-by: Matthijs Kooijman <matthijs@stdin.nl>
---
 Documentation/userspace-api/media/v4l/mmap.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/mmap.rst b/Documentation/userspace-api/media/v4l/mmap.rst
index a5672573dd6fd..1a48c3cbda179 100644
--- a/Documentation/userspace-api/media/v4l/mmap.rst
+++ b/Documentation/userspace-api/media/v4l/mmap.rst
@@ -188,7 +188,7 @@ Example: Mapping buffers in the multi-planar API
 	    buffers[i].start[j] = mmap(NULL, buffer.m.planes[j].length,
 		     PROT_READ | PROT_WRITE, /* recommended */
 		     MAP_SHARED,             /* recommended */
-		     fd, buffer.m.planes[j].m.offset);
+		     fd, buffer.m.planes[j].m.mem_offset);
 
 	    if (MAP_FAILED == buffers[i].start[j]) {
 		/* If you do not exit here you should unmap() and free()
-- 
2.40.1


