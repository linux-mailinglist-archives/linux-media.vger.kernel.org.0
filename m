Return-Path: <linux-media+bounces-36682-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2927AF78EC
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 16:56:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 271FA4E7735
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 14:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8D632E7F0B;
	Thu,  3 Jul 2025 14:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OjE4mXtC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC9B2EAB95
	for <linux-media@vger.kernel.org>; Thu,  3 Jul 2025 14:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751554407; cv=none; b=F0C0mcnka3tBAQ8YRwVOnd0aUa7BWyiACLYacJXayAkxAI9dXdrtawQjJTGY5KPb5d6MMKIIkeIdQ3F7ufd5gP+AbgHfyjDnXsPh35GrIbt7n/q88TqDlp3Eek4XHOOzDv4NQQo1WX3XIRpBb+aE4DdpFljZcymy4qUJFG6VmOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751554407; c=relaxed/simple;
	bh=8lEc1bxD5ddHBG0PumhK5oOLEI4pDpj5bp0OTcJyPCI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=umMQMaAxAtSikpcP/QW5hrBQGq91OvhxN6ofnq0wc9CtmdGC92IH7AZQ4OSYug9jJGVRHY+KiWRVAnj+A19SipLeSTOMrVKCkuHLmnhByxS2oH+iqyvvj+y1e0nMZ8RyTIU/tB9aTxlIYImGXovI9HxQ0/JnTio/Vxjs/ERc4+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OjE4mXtC; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751554405; x=1783090405;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8lEc1bxD5ddHBG0PumhK5oOLEI4pDpj5bp0OTcJyPCI=;
  b=OjE4mXtCbc4ySnAVmv7+oLBhkvNxVWPBZU15WqsnJiEGBK7BCrXfTKOw
   zgi9NykLALiii08T/BtvlPAeA6fo4a6Md4YyeCX92wVPw2NVwWn2dTuyz
   1a0cXrbYZWfvBsS0vu9/G3Y2PZVx70Hp7N5mT9O8tg4mE6fSFZUl4Cp41
   4EcJjTvJL+o1vw+HgGJjRTL/s3mhpbdBU/mL9WXhz0GSS+v2PQhzTi0JT
   tXp1xZAevZGIeYVSyu0aPNWxuytt3u1BZMelt47BxitKsSr/6hM6P/nha
   amftsBOaIqWwgYP5jwJz9jfa0wveEUSuFFTlcnJY79bXvezLPmbJqj1/Z
   Q==;
X-CSE-ConnectionGUID: OZks3ozqS0K2yi6oA15gSA==
X-CSE-MsgGUID: hbNsEH4JR+Wtga4FrD6HxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53601922"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="53601922"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 07:53:25 -0700
X-CSE-ConnectionGUID: NHr4XpJ4QDihGyjkEzC/lA==
X-CSE-MsgGUID: Es93ZFKZSku72wJlg1eeuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="154885483"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.116])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 07:53:24 -0700
Received: from svinhufvud.lan (syyslaukka.retiisi.eu [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id DCFF144419;
	Thu,  3 Jul 2025 17:53:19 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	bingbu.cao@intel.com
Subject: [PATCH 1/1] media: ipu7: Drop IPU8 PCI ID for now
Date: Thu,  3 Jul 2025 17:53:19 +0300
Message-Id: <20250703145319.1757064-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver is intended for IPU7 at the moment so drop the IPU8 PCI ID.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
This goes on top of the IPU7 patches.

 drivers/staging/media/ipu7/ipu7.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7/ipu7.c
index 4a70d3527cb7..1b4f01db13ca 100644
--- a/drivers/staging/media/ipu7/ipu7.c
+++ b/drivers/staging/media/ipu7/ipu7.c
@@ -2752,7 +2752,6 @@ static const struct dev_pm_ops ipu7_pm_ops = {
 static const struct pci_device_id ipu7_pci_tbl[] = {
 	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, IPU7_PCI_ID)},
 	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, IPU7P5_PCI_ID)},
-	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, IPU8_PCI_ID)},
 	{0,}
 };
 MODULE_DEVICE_TABLE(pci, ipu7_pci_tbl);
-- 
2.39.5


