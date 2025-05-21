Return-Path: <linux-media+bounces-32990-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEAEABECDC
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 09:15:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DB8C1BA5540
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 07:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D6F3231853;
	Wed, 21 May 2025 07:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GU4mcS9C"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1028F199EAF;
	Wed, 21 May 2025 07:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747811740; cv=none; b=t2vjC1/qk4NjjHTVqgupJp7jKIy+l4RSDwPDV6lLn8Sz3cgzrcNC583XEo9MGrbSw8lLJ015Nm4KbcDPbfj+YCIc6AuQoM0IxB/+a4TrK5+CZUEDNKRUFv/dB+OBBHc0q17ucDGG+wpkTOtwV5Rjm4EZV21zr3itvXB+v2m8/H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747811740; c=relaxed/simple;
	bh=0fo+PyTyAPW8D2o+IjPBOYqUeUIvEeG1x4XAcEZ/+4U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SWcTSiEQQb+iGw9gTf8nPqOAMFAjY/+98nAzgOBldAk0VAUsTUc3JkOR6dbXVBS7C0eHBuUwcfVFdZu5ev29WOI2qV81Xz/MdrtKsSGpv8cuYQMumrRA3Dwu9NP3Iee/Ol37FgHbwrtMOS5hZyP/lRcuajKDqACtny+Y4VJA0xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GU4mcS9C; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747811740; x=1779347740;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0fo+PyTyAPW8D2o+IjPBOYqUeUIvEeG1x4XAcEZ/+4U=;
  b=GU4mcS9CcthECvikVYevjnLLEY2JNyHdd6kJgZ4rFY6T2ykphnKHVMfB
   3lt/yfFxkWtOE5IN+MP3KHBVBPNTaFeS+qAkkxB66qRluhueiEIhPaopF
   73AoK/JqoWnQ4BJZ2TNdAmKJMJC6/YDG0lOAyUrwP2Ylr7qTVtkY5vUN7
   fgXXPNKzKahKLbA8t/JNTg3jodbm2l+YVzNRRFRGRyf+hHwRcjtggYAhb
   7Y9Crr757gghWy1aFqBCDWf01AyIrLbiv90jCrgTKKAKrJvU6xnKCu+Wq
   1yWKc2+9bmQsfSkHNWpDgVopkyBMdFnQdExAPtBr947R/WxXCw1B2mI38
   w==;
X-CSE-ConnectionGUID: uwja/7rXQHOeT4fMvFzs+w==
X-CSE-MsgGUID: gHbfGiquTJumPw439ByJmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="60007259"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="60007259"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 00:15:32 -0700
X-CSE-ConnectionGUID: O0dAtafdT5imdYMm5b4/xA==
X-CSE-MsgGUID: KYUzfv2ZQAe+L8ACyUyO0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="170939369"
Received: from bjledic266.bj.intel.com ([172.16.127.175])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 00:15:28 -0700
From: Dongcheng Yan <dongcheng.yan@intel.com>
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	hverkuil@xs4all.nl,
	hdegoede@redhat.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	bingbu.cao@linux.intel.com
Cc: xiaohong.zou@intel.com,
	dongcheng.yan@linux.intel.com,
	hao.yao@intel.com,
	stable@vger.kernel.org
Subject: [PATCH v1] media: i2c: set lt6911uxe's reset_gpio to GPIOD_OUT_LOW
Date: Wed, 21 May 2025 15:15:19 +0800
Message-Id: <20250521071519.2611242-1-dongcheng.yan@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

reset_gpio needs to be an output and set to GPIOD_OUT_LOW, to ensure
lt6911uxe is in reset state during probe.

This issue was found on the onboard lt6911uxe, where the reset_pin was
not reset, causing the lt6911uxe to fail to probe.

Fixes: e49563c3be09d4 ("media: i2c: add lt6911uxe hdmi bridge driver")
Cc: stable@vger.kernel.org
Signed-off-by: Dongcheng Yan <dongcheng.yan@intel.com>
---
 drivers/media/i2c/lt6911uxe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/lt6911uxe.c b/drivers/media/i2c/lt6911uxe.c
index c5b40bb58a37..4e2109db0145 100644
--- a/drivers/media/i2c/lt6911uxe.c
+++ b/drivers/media/i2c/lt6911uxe.c
@@ -600,7 +600,7 @@ static int lt6911uxe_probe(struct i2c_client *client)
 
 	v4l2_i2c_subdev_init(&lt6911uxe->sd, client, &lt6911uxe_subdev_ops);
 
-	lt6911uxe->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_IN);
+	lt6911uxe->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(lt6911uxe->reset_gpio))
 		return dev_err_probe(dev, PTR_ERR(lt6911uxe->reset_gpio),
 				     "failed to get reset gpio\n");

base-commit: f2151613e040973c868d28c8b00885dfab69eb75
prerequisite-patch-id: 6cade6d98fab1ea36ed59fe5502d7d2457180ca5
-- 
2.34.1


