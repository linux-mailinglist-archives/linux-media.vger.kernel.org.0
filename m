Return-Path: <linux-media+bounces-40873-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D79E7B336D9
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 08:54:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4E311898FD4
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 06:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2A57288C96;
	Mon, 25 Aug 2025 06:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RQrp85x4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D884287257
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 06:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756104798; cv=none; b=O60ZNUgkHisydk6oR1vO2ZdeBpHiUwsAxp++9GO9m/RnCgBT005oJwTYZm+tFRvXWZO8DUrxTS8XWypdSu8YCaOGTFByn+4oi3b5DZRjtEeGYR9ar97lnagzRwbK2/x5cjIJu/e6qWdLYaT+5t78fLYT7WOgnP6WthejZq9DHIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756104798; c=relaxed/simple;
	bh=e4plMWX7Y08I3aCOZjuwuqMbBWvJfYBKz86PFv30pzc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YofFk8D72JeJEotZLOjNiTkU43S0QAVHtv9e+r3qtHSOlts95YPzt9jvyJqR1iBxj8GiIKA5o1dYOMZsMjh6OKMqavnO+VVOyPD52vA2cRFZMm9/uHcR4fzLGAqX6x3xGQi1n78XQPSIACg+C48TdAGfcc3mfswUrdapLM7THcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RQrp85x4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63C20C116B1;
	Mon, 25 Aug 2025 06:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756104797;
	bh=e4plMWX7Y08I3aCOZjuwuqMbBWvJfYBKz86PFv30pzc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RQrp85x4J7e52YNw7+dNTzmh5cKQcLUUZ6Ie2+STxCT6Tw5Xz0oDWOeXue/YEcYLu
	 l8dal/icUZZG6p23O533C0WqbIgDn6VWi6cSYvBGmua8bBJoWK3Q7Zw23xh6ErS6lW
	 JTLV43ss8hFaHaIggvjOjZm8hzknXHMW3584rqbm5g/JmiT3AOsYDQaJV1XZbXJZNe
	 5IfpOb5Vthhxf1nfVKPR92fs3XsY7K+9MDTTX/LlT91vET+YZFjoV24qwijIFTUtiE
	 bf2KQNY227cQfwudxrsmsCLcb5S0HpgPsfsLJnEvRgdGmvFsuU02kBG2Eo3M23z+hz
	 a8kqy0SQq9ZUw==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@kernel.org>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 8/8] gpu: drm: display: drm_dp_cec: update Hans' email address
Date: Mon, 25 Aug 2025 08:51:55 +0200
Message-ID: <9b18e1f8241e9df6d8f8b2286a197c25031de25b.1756104715.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1756104715.git.hverkuil+cisco@kernel.org>
References: <cover.1756104715.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans Verkuil <hverkuil@kernel.org>

Replace hverkuil@xs4all.nl by hverkuil@kernel.org.

Signed-off-by: Hans Verkuil <hverkuil@kernel.org>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/display/drm_dp_cec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_cec.c b/drivers/gpu/drm/display/drm_dp_cec.c
index 3b50d817c839..436bfe9f9081 100644
--- a/drivers/gpu/drm/display/drm_dp_cec.c
+++ b/drivers/gpu/drm/display/drm_dp_cec.c
@@ -42,7 +42,7 @@
  *
  * https://hverkuil.home.xs4all.nl/cec-status.txt
  *
- * Please mail me (hverkuil@xs4all.nl) if you find an adapter that works
+ * Please mail me (hverkuil@kernel.org) if you find an adapter that works
  * and is not yet listed there.
  *
  * Note that the current implementation does not support CEC over an MST hub.
-- 
2.47.2


