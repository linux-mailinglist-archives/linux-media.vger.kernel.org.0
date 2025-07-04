Return-Path: <linux-media+bounces-36792-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5F5AF8AD8
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 10:12:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E6677B3C7D
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 08:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58E872F547E;
	Fri,  4 Jul 2025 07:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LBLn6fZS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7C02F49F2;
	Fri,  4 Jul 2025 07:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615707; cv=none; b=qMRCTjaHJBnKxvmWo6jRRR5sTrzMFYj7jEOaf8UhDPHtscwdSpsgooArpDMBCuUUjvfgH5gNhEt63WoC2TuWz86WVz2qVWG7VVT61OKN2d+nILyiDjbVH5TTcrJqLFE09z4lvZR+eoeloUBWBBiSfxvhOO/GcZXf+tbDZeKXvhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615707; c=relaxed/simple;
	bh=jYjiHNs7+nnRhnxWuagXuOKoGclwye4obrP5Szc2NG8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AyuAMJA9KaiGKCaJNqxxgtCuPZToRDXX46E3ttIG1EOX4V7r9wQscuoQDpwyHvpTvDKaWRLdG6faOrcn2BeNDS1x7vAi/oYJfnW4psy3kqLUY/jaOpfUwu5/xmVcwkH5mlj9KyK9ev0EhC9h8I4xOwL+X7QP1gn0wXitzZ9PH9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LBLn6fZS; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615706; x=1783151706;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jYjiHNs7+nnRhnxWuagXuOKoGclwye4obrP5Szc2NG8=;
  b=LBLn6fZSESyQCV1KttD/iq2fYgEmxUL0fAJVuQ0eVncbe8kV5EtLXeap
   2kaRCcOMS8ff+8I1Cvn0tuwP/dAfhhQkZyBfDFxcKVwR6S+u5l1LMDOqJ
   6jsz9XeB1wR/4wNDJsnFo7NDBeaNzE0q4nFkpH3FKViA/LbgZ5zMSt/Ue
   j3/5rXx2QFEVmQaSRjfJdNexM+6q/0Amc6PSJFQXKvd9u/FCSHn96mmRh
   OnJfC4e5MPp5tNR/m4NG6NHwq0khI7XonIM8N67lwuVjoiM/1V2ZgCM3h
   A7ew3HWTKlZDC7nSVmNBYxnakrF7qSz/zqbGMs3+Q5o1MJtBBG8QWMBAA
   w==;
X-CSE-ConnectionGUID: +J++fAuJQxq1PNxATQmyqQ==
X-CSE-MsgGUID: 4lMjmpzoR6ima6TRrhO45g==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64194264"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="64194264"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:59 -0700
X-CSE-ConnectionGUID: yk+YfJ50SW+r/4KA71Ve/g==
X-CSE-MsgGUID: l2mPlxxSSpS0B9pgrJDDKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158616671"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:55 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 3937244433;
	Fri,  4 Jul 2025 10:54:51 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 64/80] media: rkvdec: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:50 +0300
Message-Id: <20250704075450.3221972-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
The cover letter of the set can be found here
<URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.

In brief, this patch depends on PM runtime patches adding marking the last
busy timestamp in autosuspend related functions. The patches are here, on
rc2:

        git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
                pm-runtime-6.17-rc1

 drivers/staging/media/rkvdec/rkvdec.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index d707088ec0dc..445f7c92eee3 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -765,7 +765,6 @@ static void rkvdec_job_finish(struct rkvdec_ctx *ctx,
 {
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
-	pm_runtime_mark_last_busy(rkvdec->dev);
 	pm_runtime_put_autosuspend(rkvdec->dev);
 	rkvdec_job_finish_no_pm(ctx, result);
 }
-- 
2.39.5


