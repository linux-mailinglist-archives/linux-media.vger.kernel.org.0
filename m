Return-Path: <linux-media+bounces-38552-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCFCB13855
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 11:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1172617B11A
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 09:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB2BA26158D;
	Mon, 28 Jul 2025 09:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fGfWLHTE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2650025BF13
	for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 09:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753696119; cv=none; b=Wl4dXcbBUGlBQuLtM350W0RLoadkh5O9BdXA8oPzxrzRfXWk1qhMf20hWpzR5MuO034Sueod268ujtr32zHeA6DH84cVwXdwIEFzGjXt/PogIVeE6lT2FSDyw1MlAp9AjATf1UmKWj0vkrIxVXeI7o4Y0MgIs5r2irqOBmdBwAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753696119; c=relaxed/simple;
	bh=5OxUAZ7Y+sSxxYZPmZEOWfLe9nY/JcJ5UtKgik4FNkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WI3hcRc+Vh5EQG5LwBvUEBOk7LRqZBCC5fbjIHzjBAChenwGOJM+hSXUbZHQ3STQ6mjfG6kd/oakRGWqcTinOzjbGSPMSLP9e4wYefXFSTlYHLFW4GpF42gV8CSuT6ikzBdaEH/ENVyDXDDXWsLvpUA5f5KHZDD3sh1mciDZpoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fGfWLHTE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC5B4C4CEF6;
	Mon, 28 Jul 2025 09:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753696118;
	bh=5OxUAZ7Y+sSxxYZPmZEOWfLe9nY/JcJ5UtKgik4FNkU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fGfWLHTEyfpcloyCnDfkv/uMKbOvBBTipLkpylujkAxxEPe/cnVB0E20CTTq8LOdT
	 r3l7Hcld+so+EXuCYnK3XHZPAO0zhrL11YfDcXQxqO70xTkwBBRHvTFNr7ROORjLES
	 MDPSIVLMlpS8nMxMWwUZe3JQK4mNJNoKSCwDSwPKIt87JBxChbKTCrT9XD8B/JUket
	 R3R3I1zaZGwYTV8M602W0kfPtVZ5MnYC1vEv6LBBJD8KmyO2rQqgArvkTNGDFOAvfh
	 pRNDo5gKf5fSUxmXP9hkfKe+u8fBnjK5+BukhyfT3FP6LuO45aADSYIpHUfrSLg9D5
	 GmlifRu/qCARQ==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@kernel.org>,
	dri-devel@lists.freedesktop.org
Subject: [PATCHv2 8/8] gpu: drm: display: drm_dp_cec: update Hans' email address
Date: Mon, 28 Jul 2025 11:47:03 +0200
Message-ID: <948b67aa923d0887b538912357c218c71417dac6.1753696023.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1753696022.git.hverkuil+cisco@kernel.org>
References: <cover.1753696022.git.hverkuil+cisco@kernel.org>
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
index ed31471bd0e2..d0dcc9b4b92d 100644
--- a/drivers/gpu/drm/display/drm_dp_cec.c
+++ b/drivers/gpu/drm/display/drm_dp_cec.c
@@ -41,7 +41,7 @@
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


