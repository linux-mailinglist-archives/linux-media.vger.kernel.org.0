Return-Path: <linux-media+bounces-41838-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A8CB457EE
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 14:35:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA2E63A9F0E
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 12:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB902345745;
	Fri,  5 Sep 2025 12:35:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-190d.mail.infomaniak.ch (smtp-190d.mail.infomaniak.ch [185.125.25.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA90145B3F
	for <linux-media@vger.kernel.org>; Fri,  5 Sep 2025 12:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757075714; cv=none; b=LvLK3w9yaErluT9fgG/rOBMoK9/b7WEoGWWbK1N2ieRv4tAytCe4U80J5286lz1JVsMLVgz4zRMnkJcKqzvUTUBYNkOI+ZasaIRFe7xSziYkzLTD5E+Sq6WRDf28CUm/g6GtVHFirPGB8VOZIY7LHYhPDvmNtICekdIgwtpkOvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757075714; c=relaxed/simple;
	bh=0Mmig8PuVe7QJjJsdRulCvLRiAbEx9jjoJb4e0XZKq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=NLFm+jbNbYaS8doxkfbtAQThrB9FfnWSd2q5LbgdWKbBb3UtH3qghWMe7/F86rRuagwmSSddMkmySG13WwBGyeMUqXgBgKtyTawJqtyoAaV0UpXfOQgHvAsBCKQZuFZ64pp/4vN8Y1RHUn4zzwaR3e1sQZ1Kn8eRXGjPMbkyGFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=185.125.25.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6b])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cJFlf4cb9zXfP;
	Fri,  5 Sep 2025 14:19:42 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4cJFlf1xz0zQ2L;
	Fri,  5 Sep 2025 14:19:42 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Fri, 05 Sep 2025 14:19:34 +0200
Subject: [PATCH 3/3] v4l2-ctl: do not fail on kernel not implementing
 VIDIOC_SUBDEV_QUERYCAP
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-opt-ioctl-v1-3-4b3ae770fc4b@cherry.de>
References: <20250905-opt-ioctl-v1-0-4b3ae770fc4b@cherry.de>
In-Reply-To: <20250905-opt-ioctl-v1-0-4b3ae770fc4b@cherry.de>
To: linux-media@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

The comment above the code snippet specifies that we do not want to fail
on kernels not implementing VIDIOC_SUBDEV_QUERYCAP (5.9 and earlier) but
calling doioctl will still set app_result to a negative value if the
kernel doesn't implement it.

Therefore, let's mark this ioctl as optional to avoid falsely reporting
an error.

Fixes: fc89f67d9fe0 ("v4l2-ctl: add support for VIDIOC_SUBDEV_QUERYCAP")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 utils/v4l2-ctl/v4l2-ctl.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
index c287c74d5dff869b2a74a2e2bfebc77d0b9e3f1e..afaffd71b1e9a50a7975dc3200825aaba16e1473 100644
--- a/utils/v4l2-ctl/v4l2-ctl.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl.cpp
@@ -1369,7 +1369,7 @@ int main(int argc, char **argv)
 	} else if (is_subdev) {
 		// This ioctl was introduced in kernel 5.10, so don't
 		// exit if this ioctl returns an error.
-		doioctl(fd, VIDIOC_SUBDEV_QUERYCAP, &subdevcap);
+		doioctl_opt(fd, VIDIOC_SUBDEV_QUERYCAP, &subdevcap);
 		subdevclientcap.capabilities = ~0ULL;
 		if (doioctl_opt(fd, VIDIOC_SUBDEV_S_CLIENT_CAP, &subdevclientcap))
 			subdevclientcap.capabilities = 0ULL;

-- 
2.51.0


