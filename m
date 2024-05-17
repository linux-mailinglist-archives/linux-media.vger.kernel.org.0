Return-Path: <linux-media+bounces-11579-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3918C8102
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 08:45:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A44AB21753
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 06:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B21F14A8D;
	Fri, 17 May 2024 06:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TKDeBZm6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5FA134A6
	for <linux-media@vger.kernel.org>; Fri, 17 May 2024 06:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715928303; cv=none; b=WEyXA8CdWQE3BOkLzUjVvIVgEOJ1KtLjyMsQFggFj3rvCaXzAlIqij9TsnE+1aeJHCoaodLMue/i//eUKwBJo6wkIG4Vh8SD1tjUlewWaf9vJNksDYGqqkd44O/x6T2MyuhJYEzF6RygSNhkPtHl8NSt+XKLn4reD6J+rAT+pmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715928303; c=relaxed/simple;
	bh=+12XXNgrnsliUL+ZlKFqe9M2muc1RwSghsAoGT/ad6w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ayJf1DDa28DGkHSgly43+ge/yAyysJjb9buwXlNPw200AWmz8zzVM/EDzkw6f27V+fzIblS/MYxTL+66sEIsFUztbW8N5dVUxbopZvgTJ7YLPVekcHCYOEzKtpvWqW52q3F7GaFAHZVgNX/0LtzltqSrt3Xzblbr06rQqwwDqe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TKDeBZm6; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715928302; x=1747464302;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+12XXNgrnsliUL+ZlKFqe9M2muc1RwSghsAoGT/ad6w=;
  b=TKDeBZm6hKq0Qo83zwH+Jwt0gDs56kRTBENOXWmCloZe+FD3RwfiqVq/
   5MZ3sHJlix/xpc66e8HEIn+3a65BwR7g1/hx2lA60uSH5QaQ4LjNt8WPG
   opruPo8db4Oa0P4fhCROuIHxDHW2lMa/ayogLPRmU0m3h0mRIdr0sSmQS
   uD2eHCUlZIGLICzT3k+3jwM0nes05JnNpgt4ULtG1hDBvCJD12rmkfPeQ
   7Uwee+3p5/cp/KdYzqqmMls7u+Hl0pcbkaUcyJIGzQ60e7/bYU8rn4tvr
   Gx4SK9nKJWvcCrOjN7k0cHIM8z7lXUk8ZzuDOnhH8XgXEmrcMhC+X6IWF
   Q==;
X-CSE-ConnectionGUID: v9+CmSzaRaqugd6FZEY6Kg==
X-CSE-MsgGUID: Em7MauuFTY6K+rnShduPtQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="37466028"
X-IronPort-AV: E=Sophos;i="6.08,166,1712646000"; 
   d="scan'208";a="37466028"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 23:45:01 -0700
X-CSE-ConnectionGUID: Eg+XUrz+TBy+REAg6BtObQ==
X-CSE-MsgGUID: HyARlL71RxC5YCQvQVV0RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,166,1712646000"; 
   d="scan'208";a="31679739"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 23:45:00 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 04A8811FA44;
	Fri, 17 May 2024 09:44:58 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1s7rKr-0001Gt-2z;
	Fri, 17 May 2024 09:44:57 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: tomi.valkeinen@ideasonboard.com
Subject: [PATCH 1/1] media: Documentation: v4l: Fix ACTIVE route flag
Date: Fri, 17 May 2024 09:44:47 +0300
Message-Id: <20240517064447.4879-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The documentation in one occasion mentions the
VIDIOC_SUBDEV_STREAM_FL_ACTIVE flag. This was meant to be
V4L2_SUBDEV_STREAM_FL_ACTIVE as it's a flag, not an IOCTL. Fix it.

Fixes: cd2c75454d74 ("media: Documentation: Document S_ROUTING behaviour")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/userspace-api/media/v4l/dev-subdev.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index 0f9eda3187f3..161b43f1ce66 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -582,7 +582,7 @@ depending on the hardware. In all cases, however, only routes that have the
 Devices generating the streams may allow enabling and disabling some of the
 routes or have a fixed routing configuration. If the routes can be disabled, not
 declaring the routes (or declaring them without
-``VIDIOC_SUBDEV_STREAM_FL_ACTIVE`` flag set) in ``VIDIOC_SUBDEV_S_ROUTING`` will
+``V4L2_SUBDEV_STREAM_FL_ACTIVE`` flag set) in ``VIDIOC_SUBDEV_S_ROUTING`` will
 disable the routes. ``VIDIOC_SUBDEV_S_ROUTING`` will still return such routes
 back to the user in the routes array, with the ``V4L2_SUBDEV_STREAM_FL_ACTIVE``
 flag unset.
-- 
2.39.2


