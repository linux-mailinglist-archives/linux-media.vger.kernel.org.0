Return-Path: <linux-media+bounces-40843-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A05A4B331EB
	for <lists+linux-media@lfdr.de>; Sun, 24 Aug 2025 20:13:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF6893BC009
	for <lists+linux-media@lfdr.de>; Sun, 24 Aug 2025 18:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 478472E2EE4;
	Sun, 24 Aug 2025 18:09:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6946C2E2DCB;
	Sun, 24 Aug 2025 18:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756058953; cv=none; b=m+8617SO6Jcd1ir1AbYWAmG9gThpWZralQuOkatj8fkvcXqtk+pAx5TGUAPbHvSxany9nJ6KDYhCl4NSdIec9Y0rbQLuGEjvXGEnbLsq6iBjl6qsCG2jVzjQCNNnWyywi0OnvtoVEVQ/kAXafjn6Ly6vuuZgPhqW4CPMNSkh3fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756058953; c=relaxed/simple;
	bh=7pxLygUVVsRvmFQkkKritAb1b2kU29bpkk/P91YDML8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RZVprVF9L2TZiMzv+ynEtrAhobXiQwHxkT/HuqnDKDiW+hrjk70VEwAavaklUuHK2Shk/jpti/AxhMAGir+WX5dLQegFIt6dy45O6vHK2pNlDH3xVMdJ0fGyvpXMSaG0dVtQVYKdqrOt/BKGn03DpCamyy5oDbYUvKtAK5LMlmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id A16BD1F0005B;
	Sun, 24 Aug 2025 18:09:10 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 301EFB01DDA; Sun, 24 Aug 2025 18:09:10 +0000 (UTC)
X-Spam-Level: *
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id 1069BB01DD0;
	Sun, 24 Aug 2025 18:07:37 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH v2 4/4] Documentation: media: Document V4L2_H264_DECODE_PARAM_FLAG_PFRAME/BFRAME
Date: Sun, 24 Aug 2025 20:07:35 +0200
Message-ID: <20250824180735.765587-5-paulk@sys-base.io>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250824180735.765587-1-paulk@sys-base.io>
References: <20250824180735.765587-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These flags are meant for a very specific use-case, add a mention of it.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../userspace-api/media/v4l/ext-ctrls-codec-stateless.rst | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
index 0da635691fdc..de1e3873385c 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
@@ -618,10 +618,14 @@ Stateless Codec Control ID
       -
     * - ``V4L2_H264_DECODE_PARAM_FLAG_PFRAME``
       - 0x00000008
-      -
+      - All submitted slices for the frame are P slices. This is a compability
+        flag required for decoders that only support decoding such frames, but
+        should not be required for slice-based decoders.
     * - ``V4L2_H264_DECODE_PARAM_FLAG_BFRAME``
       - 0x00000010
-      -
+      - All submitted slices for the frame are B slices. This is a compability
+        flag required for decoders that only support decoding such frames, but
+        should not be required for slice-based decoders.
 
 .. raw:: latex
 
-- 
2.50.1


