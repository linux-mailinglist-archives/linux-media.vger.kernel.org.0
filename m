Return-Path: <linux-media+bounces-49151-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29631CCF3D4
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 10:58:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 50F85301BCF0
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 09:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D42BA2F6927;
	Fri, 19 Dec 2025 09:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cvZTlzZv"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566B92F12A5
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 09:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766138325; cv=none; b=Q/8Ygg3wIa1LVVY8CNOZzn9yBI4ftnkJ8npxQNwU2x7PZt8ntV0EN8/+Lg7bf+hdhGcwpAkHxeSJBa7gcNE5nx8muIAGN1paEOn9CSCdI+vMOHk3eup8HU8MT18MkUd5TVQNSzXlgEMM8hjeMRSXEWOPJnj67wx04ZbhxK1rJX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766138325; c=relaxed/simple;
	bh=+mMESgzzb6acfquzrDCuEr93M/7sArxV+C+fQ2QUuog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LnFbgo0h3d/GLoTIbZhGs7nH5qnZPwfzz0aGSj5//ay0g0ym9GyI5eM3/8X4o9WNghjtfXvvbfimEZmrdsEnIIxKOYKdZo7D1RH5ecpbkElufNxETLfleCGrE3fdZzTGukOrkjuJGGJmHK5PL0/h8jSpwVX6opkzIW66jQnYJ5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cvZTlzZv; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766138323; x=1797674323;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+mMESgzzb6acfquzrDCuEr93M/7sArxV+C+fQ2QUuog=;
  b=cvZTlzZvv6/9xj1HhRjgaHrX0v8SulbuKa2Z8vPLAldZK/VXSX51/aCl
   irSCORAAQzm8gKtfyHw8fN3Mqn/sXGarf1WvTORVDvp3Ie3n3If2umoy/
   q+80dmPP589DLu6m0LkAU/V80PnYs8/nmvEEFNtgfAsIqNKF6V3XjWrqC
   NvLKpx0TDprP7iBybrWXZSfqz9lOSoTF35w2G06/8OV0oQS0Sce2xiEMs
   xLF33G5V5ErKexAPfecKu4znk0gry7wwTGSTpQmdsuD5yXT49pvcSyLPg
   VGIJI6s6OXycbi/8OUoFLjvAp+OInooL8lnd8vnDyssadXH+Szvs6VoRv
   g==;
X-CSE-ConnectionGUID: N7Or0Et2Q3eHdiOQhAPjLg==
X-CSE-MsgGUID: 2UzydEdWTVuAfh429D8s4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="71945166"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="71945166"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 01:58:37 -0800
X-CSE-ConnectionGUID: Lm3S0V+6QYu5nFOkocu2lw==
X-CSE-MsgGUID: 1D61dTwrQ7OTWeF0O06gHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="197973398"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.226])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 01:58:36 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 086D9121DA7;
	Fri, 19 Dec 2025 11:58:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vWXFl-0000000BsRg-2vhw;
	Fri, 19 Dec 2025 11:58:29 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH 05/13] media: ipu6: Remove redundant streaming start via buffer queueing
Date: Fri, 19 Dec 2025 11:58:21 +0200
Message-ID: <20251219095829.2830843-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251219095829.2830843-1-sakari.ailus@linux.intel.com>
References: <20251219095829.2830843-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The videobuf2 framework will ensure buffers are queued before streaming is
started. Remove the support for starting streaming based on queued
buffers.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index 8f05987cdb4e..fdf41b3cf60e 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -408,13 +408,6 @@ static void buf_queue(struct vb2_buffer *vb)
 	ipu6_isys_buf_to_fw_frame_buf(buf, stream, &bl);
 	ipu6_fw_isys_dump_frame_buff_set(dev, buf, stream->nr_output_pins);
 
-	if (!stream->streaming) {
-		ret = ipu6_isys_stream_start(av, &bl, true);
-		if (ret)
-			dev_err(dev, "stream start failed.\n");
-		goto out;
-	}
-
 	/*
 	 * We must queue the buffers in the buffer list to the
 	 * appropriate video buffer queues BEFORE passing them to the
-- 
2.47.3


