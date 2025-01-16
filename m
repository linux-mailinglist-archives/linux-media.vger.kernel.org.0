Return-Path: <linux-media+bounces-24842-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 647F3A13A13
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 13:41:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CDAE166E26
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 12:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BCC01DE8A5;
	Thu, 16 Jan 2025 12:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mx1V4is1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7475F1DE4E1
	for <linux-media@vger.kernel.org>; Thu, 16 Jan 2025 12:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737031288; cv=none; b=KpOt2mVFmNl02H0clWuL1bQsmgCpxBj+19Mg2F2osbxNCppePemdzSQJ51eIw7OqtJQaEdRWBEvgqve+uZrHx4cBPdytKzeycEjtzseVxdnfMkJo3lPLsS1EfoWQOnVl+C4xQ2/UFdDTLYfPz58uKvUGbNwiTchIlqtgT5aQ7DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737031288; c=relaxed/simple;
	bh=f+czwIfF0InZCE2qwraDABj6zDvOrnudA6FetipO1v8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gdNVHvk/Q5k8Wvx2Ez6YjJvPxyTKT7oo1jyytcMdG2gOahile5GzwNeaLV6sZaTwD6wGOkE7VZCH1Yl/W6x0z0ilKtFAWoDdeGcg+Nb7i6nRLYah9XzgRMsjJPuS1Q+UOMtt3B1dJmu/tFVXqRXYBiw8y3/SpXl8tdTnA7z4h6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mx1V4is1; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737031286; x=1768567286;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=f+czwIfF0InZCE2qwraDABj6zDvOrnudA6FetipO1v8=;
  b=Mx1V4is1T3nQFhm5hOTjt0cPuzCBjdRctbUxfqy46tOzDZXXQ+HsftJV
   erF1C0IghpHqdVHaEa1T/OjO53rZ4VeEKpH50cHWRbVFrEz5XjS+TPasT
   KkVvm+ef5ONdJfGZu6dxXz6Y1yJzA+HOO0cSMjtzkZAzNhBiI8KjnxcXI
   QO2cKa2CnwznHOROjejVOAEHBgw7UxstqzFrh3GTWqQVOa+C+gwhiyRTz
   jjWIeDjHMPy53EdAfUyHljnk7HV7U0Vy0TIRfvEShIKgiv0TyKqHYt29j
   hzqLw2sZS3MUEFztSbrEQaH7Zv5dt/6H+YQWdGTdFtNqANWsM9y3PlpSj
   g==;
X-CSE-ConnectionGUID: NznoetGHRWiLy1+z5dXDZg==
X-CSE-MsgGUID: wp9gnwmBQEaDrWLFYx4kJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37568959"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="37568959"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 04:41:25 -0800
X-CSE-ConnectionGUID: SskWHTpqQg20QO7uzdy+Lw==
X-CSE-MsgGUID: YwC4tLduSDCGhu3gICXBdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="106025362"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 04:41:24 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 687E711FA93;
	Thu, 16 Jan 2025 14:41:21 +0200 (EET)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>
Subject: [PATCH 2/4] media: i2c: ccs: Set the device's runtime PM status correctly in probe
Date: Thu, 16 Jan 2025 14:41:16 +0200
Message-Id: <20250116124118.42130-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250116124118.42130-1-sakari.ailus@linux.intel.com>
References: <20250116124118.42130-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set the device's runtime PM status to suspended in probe error paths where
it was previously set to active.

Fixes: 9447082ae666 ("[media] smiapp: Implement power-on and power-off sequences without runtime PM")
Cc: stable@vger.kernel.org # for >= v5.15
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 45b317216aba..004d28c33287 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3566,6 +3566,7 @@ static int ccs_probe(struct i2c_client *client)
 out_disable_runtime_pm:
 	pm_runtime_put_noidle(&client->dev);
 	pm_runtime_disable(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
 
 out_cleanup:
 	ccs_cleanup(sensor);
-- 
2.39.5


