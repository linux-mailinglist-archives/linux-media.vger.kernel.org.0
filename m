Return-Path: <linux-media+bounces-41837-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F85BB457ED
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 14:35:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B7233A8C21
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 12:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 797362EC0A3;
	Fri,  5 Sep 2025 12:35:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-190d.mail.infomaniak.ch (smtp-190d.mail.infomaniak.ch [185.125.25.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB26263F2D
	for <linux-media@vger.kernel.org>; Fri,  5 Sep 2025 12:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757075714; cv=none; b=bLAyTWDZcW26YAp2SSCdsyzyJjsZ0RhyEmB24XLKWahh+Fb/gZIAB/U5LahOfN/R1EQPMR59Glu+oiYu36zKpTjJpd/B8nEg3c7LgXShHKIp0gWLJpYcuLRNxEjfhVZlU7Q1ZTgdOVLkLGvzZE0HQj96rzIk5mOhEC7VqrtYjrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757075714; c=relaxed/simple;
	bh=RejpoqRAsGCxH4TRngUHB64g5iARfkrSm8JtQAuWpjw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=eCzmouc16MDf/mcfN4M9CtAod4b31+YINRlI/8JITBrgM1EimanOg/TDgCCsc5u8U4tlaM8jgKqnpUiwhX1UO3D6ymNOOwfhm7he9yoZ/wNOafYuWgzsve3bGdyAja1bwoDi5oGkMbBEB6RVPtr726UWC1nd7UU51C7qpbwa2sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=185.125.25.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6b])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cJFlf24QFzXCM;
	Fri,  5 Sep 2025 14:19:42 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4cJFld6SV0zSfD;
	Fri,  5 Sep 2025 14:19:41 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Fri, 05 Sep 2025 14:19:33 +0200
Subject: [PATCH 2/3] v4l2-ctl: do not fail on kernel not implementing
 VIDIOC_SUBDEV_S_CLIENT_CAP
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-opt-ioctl-v1-2-4b3ae770fc4b@cherry.de>
References: <20250905-opt-ioctl-v1-0-4b3ae770fc4b@cherry.de>
In-Reply-To: <20250905-opt-ioctl-v1-0-4b3ae770fc4b@cherry.de>
To: linux-media@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

VIDIOC_SUBDEV_S_CLIENT_CAP is only available in kernels 6.4 and later.

The current logic has a fallback in case the ioctl fails by simply
stating there's no capabilities available for the subdev.

Let's mark this ioctl as optional to avoid kernels lacking it making
v4l2-ctl command fail (but still doing what it's been asked to do).

Fixes: 2b2ba7e0e86c ("v4l2-ctl/compliance: read and show the subdev client capabilities")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 utils/v4l2-ctl/v4l2-ctl.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
index b71b24dab9aafd3538bd2ebc5999a32a5c3c3dfa..c287c74d5dff869b2a74a2e2bfebc77d0b9e3f1e 100644
--- a/utils/v4l2-ctl/v4l2-ctl.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl.cpp
@@ -1371,7 +1371,7 @@ int main(int argc, char **argv)
 		// exit if this ioctl returns an error.
 		doioctl(fd, VIDIOC_SUBDEV_QUERYCAP, &subdevcap);
 		subdevclientcap.capabilities = ~0ULL;
-		if (doioctl(fd, VIDIOC_SUBDEV_S_CLIENT_CAP, &subdevclientcap))
+		if (doioctl_opt(fd, VIDIOC_SUBDEV_S_CLIENT_CAP, &subdevclientcap))
 			subdevclientcap.capabilities = 0ULL;
 	}
 	if (!is_subdev) {

-- 
2.51.0


