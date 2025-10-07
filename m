Return-Path: <linux-media+bounces-43844-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E1FBC19D4
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 15:59:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EA29189AF10
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 14:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 549102E1C6F;
	Tue,  7 Oct 2025 13:59:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-1908.mail.infomaniak.ch (smtp-1908.mail.infomaniak.ch [185.125.25.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A59C2E11D5
	for <linux-media@vger.kernel.org>; Tue,  7 Oct 2025 13:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759845588; cv=none; b=kFwUQmjhOor8EHEQgQH8Lh/wIHcpZEEYApuI0aV7DVNOW8bhvLLhkcf7YoxyBMWgHaNOJ8rLeSv+jVdiyF/HkBwIcMuMtsh9EW9b4gkSjLQw3A9yr/sluzVIaDHMwR+Tjuot6Sty9XuLBEW6N3taq+VlgoB5n1jCWPoG3IYoATE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759845588; c=relaxed/simple;
	bh=dDCm+LtSp/pn1Ys0cr/xPeWWmI++NV8Jk+JpEEOu35E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To; b=et+j/qWa5c1FvP9bSx9iuqRf3dQc2v8UoYwtqTF6FGZriveb3gYnBf1h3yJ3KSjXP8VO3Q4H3dFNTG4d7tf9pfihC1O6jgEprGNylXizwdF5pEJt7G6b4SqaKJ9O5/4u5Y8QSii4qo7CQ1nQHg0ypJLj35qyFTc7r8cDD4/jmXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=185.125.25.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cgy2F01xFzmGG;
	Tue,  7 Oct 2025 15:40:37 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4cgy2D3f5QzLPr;
	Tue,  7 Oct 2025 15:40:36 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Subject: [PATCH v2 0/2] v4l2-ctl: make VIDIOC_SUBDEV_S_CLIENT_CAP and
 VIDIOC_SUBDEV_QUERYCAP ioctl optional
Date: Tue, 07 Oct 2025 15:40:02 +0200
Message-Id: <20251007-opt-ioctl-v2-0-6482dbb4be08@cherry.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADIY5WgC/22NwQqDMBBEf0X23C2JxkY99T+KB41rsyBGkjRUx
 H9v8NzjzDzeHBDIMwXoigM8JQ7s1hzKWwHGDuubkKecoRRlLVpRo9sisjNxwarRss29FI8GMr9
 5mvl7uV6Q1IKfyEuAPk+WQ3R+v16SvIA/wiRRoBqrgbQWs1Hj01jyfr9PBP15nj8SS3S8rQAAA
 A==
X-Change-ID: 20250905-opt-ioctl-387192021068
To: Quentin Schulz <quentin.schulz@cherry.de>, linux-media@vger.kernel.org
X-Mailer: b4 0.14.3
X-Infomaniak-Routing: alpha

Some ioctls are optional and the logic around it handle it nicely,
except that doioctl (via doioctl_name) sets app_result static variable
to -1 if the ioctl fails (regardless of the errno, which could tell us
whether the ioctl fails because it isn't implemented or because of it
truly failing).

However, v4l2-ctl exit code is from app_result. So it is possible to
have this tool perform the expected task (albeit failing to use an
optional ioctl) and still report to the user that it failed to do so.

Let's switch doioctl to use test_ioctl for those optional ioctls.

This migrates two ioctl VIDIOC_SUBDEV_S_CLIENT_CAP and
VIDIOC_SUBDEV_QUERYCAP to be optional ioctls.

Note:
 - wondering if VIDIOC_SUBDEV_QUERYCAP really is optional considering
   the code in v4l2-compliance/v4l2-test-subdevs:
   fail_on_test(doioctl(node, VIDIOC_SUBDEV_QUERYCAP, &caps));
   which also has a nice comment above saying "// Must always be there"
 - wondering if there aren't more optional ioctl considering how many
   doioctl calls aren't actually exiting early the tools,
   Should we add something like __attribute__ ((warn_unused_result))
   so we know for sure doioctl shouldn't be used if we don't check its
   result, though that wouldn't catch if(do_ioctl(...)) for optional
   ioctls like VIDIOC_SUBDEV_S_CLIENT_CAP here for example,
 - I assume we may want to backport those to stable branches? (e.g.
   Debian Trixie is using 1.30.1 and I experienced this bug with that
   package version)
 - only tested the lack of VIDIOC_SUBDEV_S_CLIENT_CAP on a 6.1 kernel,
   didn't test missing VIDIOC_SUBDEV_QUERYCAP,

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Changes in v2:
- removed first patch implementing a doioctl_opt,
- switched from doioctl_opt to use test_ioctl directly instead,
- added comment for VIDIOC_SUBDEV_S_CLIENT_CAP to highlight it's
  optional, which matches what the logic introduced in the original
  commit,
- reworded commit logs,
- Link to v1: https://lore.kernel.org/r/20250905-opt-ioctl-v1-0-4b3ae770fc4b@cherry.de

---
Quentin Schulz (2):
      v4l2-ctl: do not fail on kernel not implementing VIDIOC_SUBDEV_S_CLIENT_CAP
      v4l2-ctl: do not fail on kernel not implementing VIDIOC_SUBDEV_QUERYCAP

 utils/v4l2-ctl/v4l2-ctl.cpp | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
---
base-commit: cfe205ade3d0d09fabe4efb4fc1326ce7371b3db
change-id: 20250905-opt-ioctl-387192021068

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


