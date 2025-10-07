Return-Path: <linux-media+bounces-43841-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 277D7BC18FF
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 15:49:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19235189570B
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 13:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D5862E090E;
	Tue,  7 Oct 2025 13:49:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-bc0a.mail.infomaniak.ch (smtp-bc0a.mail.infomaniak.ch [45.157.188.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A484DEACD
	for <linux-media@vger.kernel.org>; Tue,  7 Oct 2025 13:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.157.188.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759844984; cv=none; b=Pux6UA7lPQCe3qVdAssPZf8/uxBzF+NcdudpHTe9+bSIYhRJcwSBy1tRSsZtDliaBLj6bPwsamXR/FwHshE/lxPvFP9tdYcUGH3ajIJ430Tfra5rvT5lKZe16sf4XNLRevruX5xNrK6Y/Z/xRkErxjo+3eRSq2dEQcQHf9Fw3wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759844984; c=relaxed/simple;
	bh=CJazJCOnbw9ev7/eM5JfEemRwziGt/8334yzw9wrYjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=AM1CIE/jEeI/RqK7BfJDRaA9VWnfewGhdULZPU16q29xt5ITTfbQsPwDwVCqS0+g+i9SdnJjeZNfYBoInrVnxC5XbkH8cOyAO9P5HG21RYf8xxtBERuc2Uf2Fw/csnEJYeU0VLSM/C7fhFroSXECciuP0D57wxf/4GBbZjvoIJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=45.157.188.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cgy2F2r8GzgLM;
	Tue,  7 Oct 2025 15:40:37 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4cgy2D7299zLGK;
	Tue,  7 Oct 2025 15:40:36 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 07 Oct 2025 15:40:03 +0200
Subject: [PATCH v4l-utils v2 1/2] v4l2-ctl: do not fail on kernel not
 implementing VIDIOC_SUBDEV_S_CLIENT_CAP
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-opt-ioctl-v2-1-6482dbb4be08@cherry.de>
References: <20251007-opt-ioctl-v2-0-6482dbb4be08@cherry.de>
In-Reply-To: <20251007-opt-ioctl-v2-0-6482dbb4be08@cherry.de>
To: Quentin Schulz <quentin.schulz@cherry.de>, linux-media@vger.kernel.org
X-Mailer: b4 0.14.3
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

VIDIOC_SUBDEV_S_CLIENT_CAP is only available in kernels 6.4 and later.

The current logic has a fallback in case the ioctl fails by simply
stating there's no capabilities available for the subdev.

However, doioctl sets app_result on any ioctl fail (regardless of errno,
which is set to ENOIOCTLCMD when this ioctl doesn't exist). Considering
app_result is used as the exit code of the program, ignoring the return
value of doioctl function is not enough to make this ioctl truly
optional.

Let's handle this ioctl as optional to avoid kernels lacking it making
v4l2-ctl command fail (but still doing what it's been asked to do) by
calling test_ioctl directly.

Fixes: 2b2ba7e0e86c ("v4l2-ctl/compliance: read and show the subdev client capabilities")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 utils/v4l2-ctl/v4l2-ctl.cpp | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
index 30a6db69..17c262fc 100644
--- a/utils/v4l2-ctl/v4l2-ctl.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl.cpp
@@ -1371,7 +1371,9 @@ int main(int argc, char **argv)
 		// exit if this ioctl returns an error.
 		doioctl(fd, VIDIOC_SUBDEV_QUERYCAP, &subdevcap);
 		subdevclientcap.capabilities = ~0ULL;
-		if (doioctl(fd, VIDIOC_SUBDEV_S_CLIENT_CAP, &subdevclientcap))
+		// This ioctl was introduced in kernel 6.4, so don't
+		// exit if this ioctl returns an error.
+		if (test_ioctl(fd, VIDIOC_SUBDEV_S_CLIENT_CAP, &subdevclientcap))
 			subdevclientcap.capabilities = 0ULL;
 	}
 	if (!is_subdev) {

-- 
2.51.0


