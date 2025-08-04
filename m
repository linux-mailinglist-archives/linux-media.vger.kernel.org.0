Return-Path: <linux-media+bounces-38867-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8548B1A6B2
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 17:55:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8AB016C1A5
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 15:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E7125A341;
	Mon,  4 Aug 2025 15:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R/TVEbUt"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4912814AD20
	for <linux-media@vger.kernel.org>; Mon,  4 Aug 2025 15:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754322726; cv=none; b=eCol69Tghbk19GRllporbXvsy9JZMlkH3S+WxOozNOj70f9OpI+4vd2VZnHZDRFJhkTkm+EuoUHNF9RKR5YuZZmwHayMQgyTKjI59NyKoEIKa8otf5TQwxS+/pKN0MlgMMDu73JDm2ABscyR31p5yY3+SnULb6aBjSWSEAcVtWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754322726; c=relaxed/simple;
	bh=aqfRqeEfJzQVK9V0JXQYCiz2Bx/fCvoFvueVJRW5LC0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JbEQTj6vE1gOtHizrsk3o6dng6+U+OhpbOEiARjW+7zvtssODTpMIM9kpT8KfpOKchXqTyvGKEpPv2XJtCXGpcPs1V1UcX+lDMsUjsAQvg3KzPdo7aP/vNw53wD2oTCmX0Z+VmWRpeF3kXfsaUEei/GZs9H9Bgl3jSlSoDhCU04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R/TVEbUt; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754322726; x=1785858726;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aqfRqeEfJzQVK9V0JXQYCiz2Bx/fCvoFvueVJRW5LC0=;
  b=R/TVEbUtUVy9fChDv6VhgbSsOJnm3J/9gkQCMC9dcnTEUcedi5JNrtL8
   0OfMxL7doa8z846blEhKNoz4vj1rLu8ehWUCYpa9jHTXRlc/5Xvdl7Gdw
   J4eFGRS4NBILzrhc0n3l+DafANJiEVo/K5fq0lUkgOtaqgpoDzrQA5iIN
   0bP/3ci9g2XrL2+AeElopSfAUUAl1yctXMoDFC/EAsf9A9KRTrNtwncG0
   dMDut+TwpcD3ESekqknsVY8uiS8miVPfykBSHE7zyIbNTGHFx8aqdLQPX
   YHd+IB9B8Fb2TNc/lD3S4I+2OgqzSoHtcZ4X3pU0Y/t8EIoNyB5TF0a7I
   w==;
X-CSE-ConnectionGUID: IvM7tUcHRB6WcqPQnystXg==
X-CSE-MsgGUID: ac+rGT4PS3KhQtLIAIEbFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="56484261"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56484261"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 08:52:05 -0700
X-CSE-ConnectionGUID: lSXUN6IYTue3aQsgHCynxQ==
X-CSE-MsgGUID: fo84/CSyTMyx9tg2kM9Byg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="169500278"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.80])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 08:52:04 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E800611FBD0;
	Mon,  4 Aug 2025 18:52:00 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uixTk-001cZt-2q;
	Mon, 04 Aug 2025 18:52:00 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hans@jjverkuil.nl
Subject: [v4l-utils PATCH v2 0/2] Fix module unloading, vimc device naming
Date: Mon,  4 Aug 2025 18:51:58 +0300
Message-Id: <20250804155200.386609-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This set fixes test driver module unloading and vimc device naming (see
<20231129141545.87461-3-sakari.ailus@linux.intel.com> on LMML).

since v1:

- Rework module loading and unloading. All loaded modules are now
  unloaded, too, by new functions handling the respective operations.

Sakari Ailus (2):
  contrib/test/test-media: Fix module unloading
  contrib/test/test-media: Probe the vimc device

 contrib/test/test-media | 134 ++++++++++++++++++++++------------------
 1 file changed, 75 insertions(+), 59 deletions(-)

-- 
2.39.5


