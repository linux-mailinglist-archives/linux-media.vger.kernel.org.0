Return-Path: <linux-media+bounces-35612-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE425AE3D92
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 13:00:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FE1A1640C5
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 11:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0248923C8CD;
	Mon, 23 Jun 2025 11:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cUpjIDVt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6491510E9
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 11:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750676443; cv=none; b=s9XEVomK6NdJVIb/DM3TbjVmMbrMeOqv+s0620nuG6AJcIndSGEm1iI+4NgxEtCYO61fYGGFC3cmjxIlygc/QVSrh47T7YOYRo3x64/f9OzlofdWi7Mhb4yrIifWVcINgwO2pW/4uF7/T8HgzMnaL9/VGUtrYSmkHM946leJNwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750676443; c=relaxed/simple;
	bh=/XhST8fDhzVmghcjCtFJNhxmNOLk1HANA5qL6DFNmRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kiroY3rod+jimGq0AhqX1NSiSLkYeHfzkLVaKRmCeTYSmn8veCwekqMf0gDu0WImbyEmct+TEk21FJ8moZqtRqYxh2k6zWYp9dt+GPlrmnf3Byo8+TSfqTmBIO29Iv0SBZ/HUGwp7VPMbpndOdBsVReXex+MIKahgWgLm8ejIbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cUpjIDVt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEAD4C4CEF5;
	Mon, 23 Jun 2025 11:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750676443;
	bh=/XhST8fDhzVmghcjCtFJNhxmNOLk1HANA5qL6DFNmRU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cUpjIDVtXfi6B6Z7tMtaCFc88rYywHa4mBRY7pNIjc8yuFSIbWOOs0BSoNxUCZeC7
	 SYDflulD9GmV+GGCpv010tUZfEnpuIWMUloVGh5qHYSSz266VN0Y/XsBtgAhJ8mNa8
	 yTFqEjyc0BPvvsNvbfKPgpoiUSjbEZHPtrBx1VmAKO43+CSu1L24UiQFMCpse+N+cj
	 iCXtmYIJJVTdnsPexxsqMs1MI4FafSQnDQMGEMxOPKW1Df3NxQn0qR+gZLP3rGrIz1
	 TlEitK8LkIu45rXXCrS52dhmvJGwbglGj7L8InYZcLZejcP4MsqLBsxTZXjK7uvg5p
	 tgfksCKH43rtg==
From: Hans de Goede <hansg@kernel.org>
To: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 2/4] media: ov7251: Improve error logging when fwnode is not found
Date: Mon, 23 Jun 2025 13:00:33 +0200
Message-ID: <20250623110035.18340-3-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623110035.18340-1-hansg@kernel.org>
References: <20250623110035.18340-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans de Goede <hdegoede@redhat.com>

The ov7251 driver waits for the endpoint fwnode to show up in case this
fwnode is created by a bridge-driver.

It does this by returning -EPROBE_DEFER, but it does not use
dev_err_probe() so no reason for deferring gets registered.

After 30 seconds the kernel logs a warning that the probe is still
deferred, which looks like this:

[   33.952052] i2c i2c-INT347E:00: deferred probe pending: (reason unknown)

Use dev_err_probe() when returning -EPROBE_DEFER to register the probe
deferral reason changing the error to:

deferred probe pending: waiting for fwnode graph endpoint

Also update the comment to not refer to the no longer existing cio2-bridge
code.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov7251.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 3226888d77e9..31a42d81e970 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -1486,9 +1486,14 @@ static int ov7251_check_hwcfg(struct ov7251 *ov7251)
 	unsigned int i, j;
 	int ret;
 
+	/*
+	 * Sometimes the fwnode graph is initialized by the bridge driver
+	 * Bridge drivers doing this may also add GPIO mappings, wait for this.
+	 */
 	endpoint = fwnode_graph_get_next_endpoint(fwnode, NULL);
 	if (!endpoint)
-		return -EPROBE_DEFER; /* could be provided by cio2-bridge */
+		return dev_err_probe(ov7251->dev, -EPROBE_DEFER,
+				     "waiting for fwnode graph endpoint\n");
 
 	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
 	fwnode_handle_put(endpoint);
-- 
2.49.0


