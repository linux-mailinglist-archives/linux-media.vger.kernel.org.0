Return-Path: <linux-media+bounces-22875-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 037219E91FA
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 12:18:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B68781881D19
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 11:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69953218EA4;
	Mon,  9 Dec 2024 11:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YLc/opPH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0ED5215167
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 11:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733743071; cv=none; b=QiqVKIEbktMPL4lHmc1HZr49p3rQfgOYj5H6Uoz3A79XPIfgsfmT5Qe5bSTHJob9NAVRtkpdWgs6i1xPurhE7veQgm4l3ypfoQPEHS96w2Pdc9nZz+nEif8vWpgiL4AKK1uOZkGL7WZELckTiNOS5lub8ByP0qsLXuPej1fHv90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733743071; c=relaxed/simple;
	bh=NRUJlWWawmQVjsjD9Y+P+Wlg4ktln0J/E6xDrQMQJlA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wmw1tBaearLw2MLSGJAdog197os4HuX2sutszOqQzv2vcl4qS5ph3ZyAM5RDygA4mZ7Ko6b5STNbY6lpkQTkbASyHrols1xMzgFxFSKWYdOEBbSrwXZPQGGnnlOa3fHqgq36p2aQ+AutT0GVbAK7DfchXKSfjLBEQysDDfPA/Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YLc/opPH; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733743070; x=1765279070;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NRUJlWWawmQVjsjD9Y+P+Wlg4ktln0J/E6xDrQMQJlA=;
  b=YLc/opPHKpnvqYjyssDqLJqeuLw+9CvzGkX/V/8vpTKqdGvmfM9qs6MT
   rNcbyI1uuj8iUfgjELisbecTBRKgP4RZhKbObsCPyh4MKbPdR3ZLbpgNu
   tfK+DLfT1lgTmNMk/wmkraG4C2PEK5qN8iGKMNMUYbkIQIoOV8l9KkOax
   7aHxLe2jGNgG1VWBRfpyid3QHSYXBbHdrVy1uljg+8FeWgWfHgWfkfYv8
   xt3rcryVmtWTbFiI72o73WRCeGCeU22EyxbEcQJvgyPNsF5VTwhkzy7AE
   PeYyc156L8r+OwF/sw4qGjGWdqi7HqqaKcEL36f2zqkGSigVIp+z1uANm
   Q==;
X-CSE-ConnectionGUID: xxCBYH4YRmWHl1+oFX48eQ==
X-CSE-MsgGUID: Cn2h73NuQdOCpOhXIcRU0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="44713113"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; 
   d="scan'208";a="44713113"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 03:17:49 -0800
X-CSE-ConnectionGUID: enPFQMbiSOCM/v95ShKoPA==
X-CSE-MsgGUID: rsxqvjZ2SRiRje/1/1UoYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; 
   d="scan'208";a="118280960"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.39])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 03:17:47 -0800
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	david@ixit.cz,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH] media: ccs: Print a warning on CCS static data parse failure
Date: Mon,  9 Dec 2024 12:17:38 +0100
Message-ID: <20241209111738.79679-1-mehdi.djait@linux.intel.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ccs_data_parse() return value is not propagated up to the probe
function, making it difficult on static data parse Failure.
Improve this by printing a warning when ccs_data_parse() fails.

Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-data.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ccs/ccs-data.c b/drivers/media/i2c/ccs/ccs-data.c
index c40d859166dd..f64fbfa1c7b5 100644
--- a/drivers/media/i2c/ccs/ccs-data.c
+++ b/drivers/media/i2c/ccs/ccs-data.c
@@ -976,6 +976,7 @@ int ccs_data_parse(struct ccs_data_container *ccsdata, const void *data,
 out_cleanup:
 	kvfree(bin.base);
 	memset(ccsdata, 0, sizeof(*ccsdata));
+	dev_warn(dev, "failed to parse CCS static data file: %d\n", rval);
 
 	return rval;
 }
-- 
2.47.1


