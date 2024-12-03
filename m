Return-Path: <linux-media+bounces-22508-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 587169E161B
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 09:46:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0EF17B22134
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 08:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4F471BC9F4;
	Tue,  3 Dec 2024 08:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f9PDWIkG"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553A6156F45
	for <linux-media@vger.kernel.org>; Tue,  3 Dec 2024 08:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733213916; cv=none; b=locqGZ2AMvhUbaOP9wqvQEAF+D7jU7tJnKY+8wlZue4OIjSVTrHI+3RL0J/P/jU8+C9D6zIMSCE2zCdCeyeeliqcka3PI4OsSOPb9BJ8JcJYIUEWZl3lCGkXxSWvwzwScNhEPQ4txfpkBnOExNVyi3EWOtFntTsnlQWHcyF3LXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733213916; c=relaxed/simple;
	bh=iu2a3PHNkTTcquqo0wUQvoWIBdxQvp1uCDdsVBBLQMw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VIBWtgbSpLKOlQQTg1uqs+32ADs8xhuBgPoluDd/IBEz77j2uHJQ44vA94DcHpl3B1d6I7RHYYZ3s9cOxk42AIhXTy2jR20pY/A2UI6FiFA7DWU6i0VIvUs8pBNm/BJU+sSVISJIHXn5QJiM9I+RCBndgtp34W4eFmSDjPHD8YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f9PDWIkG; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733213914; x=1764749914;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iu2a3PHNkTTcquqo0wUQvoWIBdxQvp1uCDdsVBBLQMw=;
  b=f9PDWIkGofMMhZKIN8Avrm15onzcSTqn/plyIhVGZmWfqknirf3gGoci
   wR0oBzYYgPcS9cjeQB7+x8K48tTWFTPyJEB8HTKlqhFYWEYIxidYGJWGC
   lFu1g8CJenM5+AOMYTrI/91eIZjZG7Kgi9QLeiLs+GT/Q6h4y4IbfvKJm
   OGvGs74y6aEN0iYwk9fGsKqWlSMjR8t5bQ6HfLUnE8S0S9RqQGKlajiyV
   mx5imRimO3An7M0L21MRHvKasAE7n4OZpNLnw7kka+JkLK+uoOBjB29ln
   C7SHQSZURuLKMvJzXW8K2667n1sxAkxUGiEIyRJkXM0YKT9XKyC7vplwe
   w==;
X-CSE-ConnectionGUID: LlYskpP3Ql2kOyCpVr85QA==
X-CSE-MsgGUID: cuTtxEu+S/WjpW7r8EdzMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="44802677"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="44802677"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 00:18:33 -0800
X-CSE-ConnectionGUID: P+UNfeQ9RdeO2UkODdNaUw==
X-CSE-MsgGUID: 2DQZvcLWTSesGXVMKeiJUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="93558885"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 00:18:32 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1B04B11F775;
	Tue,  3 Dec 2024 10:18:30 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1tIO74-003ZKF-05;
	Tue, 03 Dec 2024 10:18:30 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: david@ixit.cz
Subject: [PATCH 1/1] media: ccs: Fix CCS static data parsing for large block sizes
Date: Tue,  3 Dec 2024 10:18:20 +0200
Message-Id: <20241203081820.850767-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The length field of the CCS static data blocks was mishandled, leading to
wrong interpretation of the length header for blocks that are 16 kiB in
size. Such large blocks are very, very rare and so this wasn't found
earlier.

As the length is used as part of for input validation, the issue has no
security implications.

Fixes: a6b396f410b1 ("media: ccs: Add CCS static data parser library")
Cc: stable@vger.kernel.org
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ccs/ccs-data.c b/drivers/media/i2c/ccs/ccs-data.c
index 08400edf77ce..9d42137f4799 100644
--- a/drivers/media/i2c/ccs/ccs-data.c
+++ b/drivers/media/i2c/ccs/ccs-data.c
@@ -97,7 +97,7 @@ ccs_data_parse_length_specifier(const struct __ccs_data_length_specifier *__len,
 		plen = ((size_t)
 			(__len3->length[0] &
 			 ((1 << CCS_DATA_LENGTH_SPECIFIER_SIZE_SHIFT) - 1))
-			<< 16) + (__len3->length[0] << 8) + __len3->length[1];
+			<< 16) + (__len3->length[1] << 8) + __len3->length[2];
 		break;
 	}
 	default:
-- 
2.39.5


