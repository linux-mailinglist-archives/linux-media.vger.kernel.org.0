Return-Path: <linux-media+bounces-43845-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D78BBC19D7
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 15:59:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DDC264F68B3
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 13:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 549882E1C7A;
	Tue,  7 Oct 2025 13:59:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-42a8.mail.infomaniak.ch (smtp-42a8.mail.infomaniak.ch [84.16.66.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52282D7DE9
	for <linux-media@vger.kernel.org>; Tue,  7 Oct 2025 13:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759845588; cv=none; b=XvquB/qVf8Hyz6ftGFWBquiq5vqhLy3vqUAgCg8RQ9p3NQ+kBUsfXzOggfVn9TevY0J+mJ5Ibgz4VJcs5TfSr0EzPYkJhgpJlpDDa5mVsECIEAj6s3oULvGIhfmKT2QGPbf3gFpoFsm3+3525qiHCgRQfS/n4QureyQ9fAaHHeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759845588; c=relaxed/simple;
	bh=WIWXA+XiMAWcMUU8h9dYm16asoIHvYzd6N12al3qn4E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=F2ag7abhXarmNYb56TTI8xDGG8fVRsfhpDmcCZdXKXpy3ao2/lwjHmukUppQYu/KXsFplF+5qfDsDVMMxsZH8ECV0rvOTGZs8z6b8CywRzltTQ6pUfqkbWpzb5133Zj7+fMLmC0jweLH8BJpfrd5yVDqXnJgGnI+0RkAVQcyipE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=84.16.66.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cgy2F61qfzmnq;
	Tue,  7 Oct 2025 15:40:37 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4cgy2F2WSDzK8C;
	Tue,  7 Oct 2025 15:40:37 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 07 Oct 2025 15:40:04 +0200
Subject: [PATCH v4l-utils v2 2/2] v4l2-ctl: do not fail on kernel not
 implementing VIDIOC_SUBDEV_QUERYCAP
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-opt-ioctl-v2-2-6482dbb4be08@cherry.de>
References: <20251007-opt-ioctl-v2-0-6482dbb4be08@cherry.de>
In-Reply-To: <20251007-opt-ioctl-v2-0-6482dbb4be08@cherry.de>
To: Quentin Schulz <quentin.schulz@cherry.de>, linux-media@vger.kernel.org
X-Mailer: b4 0.14.3
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

The comment above the code snippet specifies that we do not want to fail
on kernels not implementing VIDIOC_SUBDEV_QUERYCAP (5.9 and earlier) but
calling doioctl will still set app_result to a negative value if the
kernel doesn't implement it (this ioctl returning -1 with errno set to
ENOTTY). Considering app_result is used as the exit code of the program,
ignoring the return value of doioctl function is not enough to
make this ioctl truly optional.

Let's handle this ioctl as optional to avoid kernels lacking it making
v4l2-ctl command fail (but still doing what it's been asked to do) by
calling test_ioctl directly.

Fixes: fc89f67d9fe0 ("v4l2-ctl: add support for VIDIOC_SUBDEV_QUERYCAP")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 utils/v4l2-ctl/v4l2-ctl.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
index 17c262fc..842e22fd 100644
--- a/utils/v4l2-ctl/v4l2-ctl.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl.cpp
@@ -1369,7 +1369,7 @@ int main(int argc, char **argv)
 	} else if (is_subdev) {
 		// This ioctl was introduced in kernel 5.10, so don't
 		// exit if this ioctl returns an error.
-		doioctl(fd, VIDIOC_SUBDEV_QUERYCAP, &subdevcap);
+		test_ioctl(fd, VIDIOC_SUBDEV_QUERYCAP, &subdevcap);
 		subdevclientcap.capabilities = ~0ULL;
 		// This ioctl was introduced in kernel 6.4, so don't
 		// exit if this ioctl returns an error.

-- 
2.51.0


