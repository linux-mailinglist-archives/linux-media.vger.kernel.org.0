Return-Path: <linux-media+bounces-11635-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC928C9958
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 09:32:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56282B21CB2
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 07:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 758B61B970;
	Mon, 20 May 2024 07:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C2YsMNdW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761CF18C3B
	for <linux-media@vger.kernel.org>; Mon, 20 May 2024 07:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716190343; cv=none; b=s29waOk10C6h7U2B1KvqBawJch3dpVzGtZ57sx8bnNlrjj9rj5+1TzcExsQrKn5XPLHxPZN8Zj5ISNcGVDGDcriGI13XJucLxP2LsbA3/8rA5D4Gxwvq3Ta5somP3f1H7FGu3MRxhFh7YIa4DrLLpausLfdxKpc5sGrTOKc62WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716190343; c=relaxed/simple;
	bh=E8G1aQf1IIySHcTyYgWSooTz78I8BzbK6uiTqRqalyk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=m3BCQF88h1Y9LvDSpMgF3OFdsPYGciqWrCT3/anDztALf6eCpM7OYJkgKD9xK/9lp2sFLp3yzXF8Ek7SlZyVXa7Xvf2BTVewq7W4p2eT8odLgxCCCusMo/zYThRVfM6xqD+ZlI9hrNZKspOh6kHcaw0bW4gcx742BjBMDwoAcYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C2YsMNdW; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716190343; x=1747726343;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=E8G1aQf1IIySHcTyYgWSooTz78I8BzbK6uiTqRqalyk=;
  b=C2YsMNdWqF+2hXmHLBFtZX9OApubRIPE9DwqGHetr9ZT7soiHT9xz0hd
   aKwSxsghD4q7yEscdz80ib0yFXpdgm7REWjnQug/NIK1hZwzHr51ED011
   gvq7ek+afS/lVeBoovnOGVoAbluYUukZcK+em+Rj4cEiX1F/TNxg+tMrG
   C7DDO73GJbOQRWkGsPaM8D9FDB/2J9tA6CA7wI9Co8bAPtzCkECGApcP2
   5wxsnSy5Cnxm2uR5OqFrZuRtDPYcyfou4bBXHv1BZ8CqNiOsp8iv5CPO8
   /CfxiqFgg3jD33MCha9wNkwR7Z4LcLk9DdxJ+ZUgAy5NgON3uRQ2wVaV6
   g==;
X-CSE-ConnectionGUID: AtvGo0YTRtqZKbhUz6MzXQ==
X-CSE-MsgGUID: kE5FbxwGQfSNnRuP9UPfwQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="22878243"
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; 
   d="scan'208";a="22878243"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 00:32:22 -0700
X-CSE-ConnectionGUID: I/YHpfynSO6YszDzZCvJ9A==
X-CSE-MsgGUID: 9Qp4VEoFToCIhgMS1FDbWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; 
   d="scan'208";a="32464378"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 00:32:20 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8E03F11F82A;
	Mon, 20 May 2024 10:32:17 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1s8xVJ-0002V2-1b;
	Mon, 20 May 2024 10:32:17 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Daniel Scally <djrscally@gmail.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Subject: [PATCH 1/1] media: async: Warn on attept to create an ancillary link to a non-subdev
Date: Mon, 20 May 2024 10:32:07 +0300
Message-Id: <20240520073207.9600-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Warn if a lens or a flash async sub-device is bound to a non-sub-device
notifier. This isn't meaningful and unlikely to happen in practice but
print a warning as we nevertheless won't consider this an error.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-async.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index c477723c07bf..81a9b5473969 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -323,8 +323,12 @@ static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
 	    sd->entity.function != MEDIA_ENT_F_FLASH)
 		return 0;
 
-	if (!n->sd)
+	if (!n->sd) {
+		dev_warn(notifier_dev(n),
+			 "not a sub-device notifier, not creating an ancillary link for %s!\n",
+			 dev_name(sd->dev));
 		return 0;
+	}
 
 	link = media_create_ancillary_link(&n->sd->entity, &sd->entity);
 
-- 
2.39.2


