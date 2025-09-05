Return-Path: <linux-media+bounces-41836-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BF6B457AF
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 14:25:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25F881B2759F
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 12:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C5434F468;
	Fri,  5 Sep 2025 12:25:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-42af.mail.infomaniak.ch (smtp-42af.mail.infomaniak.ch [84.16.66.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B6432A81A
	for <linux-media@vger.kernel.org>; Fri,  5 Sep 2025 12:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757075114; cv=none; b=Qd56k7cMIedCTuvk+WKCX+Nq4VvLwBpw1/jAA4V1dPuhXfv3Ao0GB52VXiePJGcr1nRlSiYzKSNzMkbMC2gWCGiKnROO8mPXzNPH9g3glLgXEEVC4cj2TWKFEucnOOGDySysa4u6iV61cM4HIkuJnbW6Ende5l3cYh3uXtmCYv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757075114; c=relaxed/simple;
	bh=fEyg1VwGXFAMnOiaAKbNczbWVFjl5nwxiSSc59c/UE4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To; b=K7vmRBE2klwMPmDdwyZpRTdlNDoxyHqOV8+HqhfHNQtzCFo6Vy+6OoGkQEbXNJIwZ02FSSVJWjuE2HtqzAEYxhmhJ17TP6vEL4pst2iB1F09fJAv3PlDXUpAneUIvZ1tdPxwMxvdaI7zILPseJ+PYbCpl3J/RwEWCaoqA1lgpGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=84.16.66.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6b])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cJFld3lgzzXGT;
	Fri,  5 Sep 2025 14:19:41 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4cJFld0QnRzPXD;
	Fri,  5 Sep 2025 14:19:41 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Subject: [PATCH 0/3] v4l2-ctl/rds-ctl: support optional ioctl and migrate
 some code to it
Date: Fri, 05 Sep 2025 14:19:31 +0200
Message-Id: <20250905-opt-ioctl-v1-0-4b3ae770fc4b@cherry.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFPVumgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSwNT3fyCEt3M/OSSHF1jC3NDS6C4oYGZhRJQfUFRalpmBdis6NjaWgD
 /CY+FWwAAAA==
X-Change-ID: 20250905-opt-ioctl-387192021068
To: linux-media@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha

Some ioctls are optional and the logic around it handle it nicely,
except that doioctl (via doioctl_name) sets app_result static variable
to -1 if the ioctl fails.

However, both rds-ctl and v4l2-ctl exit code is from app_result. So it
is possible to have those tools perform the expected task (albeit
failing to use an optional ioctl) and still report to the user that it
failed to do so.

Let's add a new function doioctl_opt which allows to NOT set the
app_result variable when the ioctl fails.

This migrates two ioctl VIDIOC_SUBDEV_S_CLIENT_CAP and
VIDIOC_SUBDEV_QUERYCAP to be optional ioctls.

Note:
 - rds-ctl receives the same patch but doesn't make use of it, simply
   for consistency, but can be dropped if desired,
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

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (3):
      v4l2-ctl/rds-ctl: do not set app_result if an ioctl is optional
      v4l2-ctl: do not fail on kernel not implementing VIDIOC_SUBDEV_S_CLIENT_CAP
      v4l2-ctl: do not fail on kernel not implementing VIDIOC_SUBDEV_QUERYCAP

 utils/rds-ctl/rds-ctl.cpp   | 7 ++++---
 utils/v4l2-ctl/v4l2-ctl.cpp | 8 ++++----
 utils/v4l2-ctl/v4l2-ctl.h   | 5 +++--
 3 files changed, 11 insertions(+), 9 deletions(-)
---
base-commit: fc46fc8771bff905204e7463ab03ed1f355436b1
change-id: 20250905-opt-ioctl-387192021068

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


