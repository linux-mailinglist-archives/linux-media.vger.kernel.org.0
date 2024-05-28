Return-Path: <linux-media+bounces-12077-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E75288D1870
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 12:23:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84EBF1F24D20
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 10:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0DEB16B728;
	Tue, 28 May 2024 10:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mGk7jASP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBFE16B737
	for <linux-media@vger.kernel.org>; Tue, 28 May 2024 10:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716891753; cv=none; b=fqHTZSCLh7LDhn70883xzYqk9dBaOcOrl/wCm/fcGEwjLB5rFRyagAc2LtolUtFlOZzpZVxUHi9r/4GUPKpBSPQyCvpx7Oxq3pv6o8ljlXprOhUhVp2JQ6njgEq6oHwO+TVwMsomA5MKZ3geTWzIVjOwJl2wjrShiy9QpTOWjHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716891753; c=relaxed/simple;
	bh=UNrszc699w64xqgsiqwyHkSTg+/CB5VqS4wmTdiLudY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CTW27c6V4y3ZWuL3HTf0rhBfInsKaiz3r5NgPJwtzsr0/gl4KD6fNqSnGUAjXD0daRfqTVdSDY+Tb4jKym2BHthfpSdOBGJDJGapAFSA9Dz/8WxIuZJeBjXHKtoxcnUtkFvIXf+bJu8NiAkqlyzvlR7tF7hWKImVM8w/4Knm/tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mGk7jASP; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716891752; x=1748427752;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UNrszc699w64xqgsiqwyHkSTg+/CB5VqS4wmTdiLudY=;
  b=mGk7jASPp1AI1TDD8wJA9aizDW7HJQim5ulM6qH7Lfao9mXlhEwRF+UT
   mpEoAn4w0UZz2uXRnpvpiKz8x8oUmPJSnUVlR4DkGi+B/B9SVnmwdWrPE
   QC6W7QUoEzQX1xQcfQZFV6MiPQFYE+ZuqpNFtRyyPmDs00xy2VOraNISn
   AgngqAWZ2tDb5rjpRsRPipn/AALQKAaQR5rje5nV7j2rS5X1ZbnLphwoU
   DlHAEeaAefNiobVR/+/Woy/gxAuYjhHccIAKpRZMSymhfa1WrUAo/24MC
   KdiV6d7cXRxsJvjmNatJkKNlnhOH17Vp8CouxOuWzHnT+IlhMoy3gvji0
   A==;
X-CSE-ConnectionGUID: Tx0mJtkQReaVxxfit5JJiQ==
X-CSE-MsgGUID: NlhfFFcASoy1DOQjdoIW1Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="17061058"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; 
   d="scan'208";a="17061058"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 03:22:28 -0700
X-CSE-ConnectionGUID: h4bD/JQ2SH2vmPKkmQLBQA==
X-CSE-MsgGUID: wbWtjv+yShCn8UuP8yTjLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; 
   d="scan'208";a="35525099"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 03:22:26 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D4B3311FB11;
	Tue, 28 May 2024 13:22:23 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sBtyJ-00CCXv-2f;
	Tue, 28 May 2024 13:22:23 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: wentong.wu@intel.com,
	bingbu.cao@linux.intel.com
Subject: [PATCH 1/2] media: mei: csi: Put the IPU device reference
Date: Tue, 28 May 2024 13:22:12 +0300
Message-Id: <20240528102213.2908148-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240528102213.2908148-1-sakari.ailus@linux.intel.com>
References: <20240528102213.2908148-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mei csi's probe function obtains a reference to the IPU device but
never puts that reference. Do that now.

Fixes: 33116eb12c6b ("media: ivsc: csi: Use IPU bridge")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ivsc/mei_csi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
index 89b582a221ab..53151d016188 100644
--- a/drivers/media/pci/intel/ivsc/mei_csi.c
+++ b/drivers/media/pci/intel/ivsc/mei_csi.c
@@ -677,6 +677,7 @@ static int mei_csi_probe(struct mei_cl_device *cldev,
 		return -ENODEV;
 
 	ret = ipu_bridge_init(&ipu->dev, ipu_bridge_parse_ssdb);
+	put_device(&ipu->dev);
 	if (ret < 0)
 		return ret;
 	if (WARN_ON(!dev_fwnode(dev)))
-- 
2.39.2


