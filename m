Return-Path: <linux-media+bounces-57990-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JUBBfrkzmk5rQYAu9opvQ
	(envelope-from <linux-media+bounces-57990-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 23:51:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A61A38E740
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 23:51:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93D973031AE9
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 21:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2CC8378D8D;
	Thu,  2 Apr 2026 21:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PhbQbfc0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796F637B002
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 21:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775166592; cv=none; b=EIUibn8EzHceP0dIVQYoXCln06TRh9j0513h4CLx+ckLoiLv5EtchA/T2NgyGoFYMM7bpF9pXa9r7t8FYAEuucbuxR27trSrPcieR66sqqb65I4Pa9q0WBnxXDdJze4gsQj8fIgjOnFk5WASji7DwI9u0K3Cf0/AJqRG1wbg6l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775166592; c=relaxed/simple;
	bh=eP0tefb6sp6Y08jOiuqQJUMTGV2rR4sTM/+j125+cY0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bli2J+540CV6q9ApiVt3PwvFjWFjQKD2CDzWVIfmC7j9Qulx5CX9gaammgyZhXB2Ef0AmoEDxKgEXrF8O9PHRHxrKovos66Yb/1HlPxKYydIBjQQ6JILXueOPgzPoRJT+9QBAdxUscQ+4vuYwuWOhIFnxXegd+skM4/hHQ9PW/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PhbQbfc0; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775166589; x=1806702589;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eP0tefb6sp6Y08jOiuqQJUMTGV2rR4sTM/+j125+cY0=;
  b=PhbQbfc0AuM2vZ/HyZd1geB4jPPIYP9ytSneqEDb1qQ+y6x5TA7dz+ms
   2waSPxQLf/UgD2iTjUILzOhzl/UENIURnH1MJJny6KVyBQonPK7iCxptz
   WXfz3fq10lExTDNpNMgpzrHCCKr5u/FpFK/ciHyOidTstnbcQRrQMT/Iz
   f9w/ck0T7OWIUQk782FEARfuKWrhOWPr1pkq6Jxl9YQo+TN79FAyEp2aD
   j68spJrSayrajdUvnu4xOOd1fVOeK2/pDCYPLG4zhfO44Cduf+xjAFTu/
   PQ+XN4vuYmt4qIYHFQ2UFvFB9T40yLNy+pUMjZFuwoPZ7D9paXvMJjqEr
   g==;
X-CSE-ConnectionGUID: ktqjvgHoQ22EJETVMTUcJw==
X-CSE-MsgGUID: Jrp68PbeRGmd+brjDPkzwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="75405625"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="75405625"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 14:49:48 -0700
X-CSE-ConnectionGUID: bK3zTGYDSy+lBC8BoRjS0A==
X-CSE-MsgGUID: al5CGt4LRaCNe4/9qCq8RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="250154322"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.118])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 14:49:46 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C3522121FE9;
	Fri, 03 Apr 2026 00:49:54 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w8PvG-0000000G3gm-0f8b;
	Fri, 03 Apr 2026 00:49:54 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Leon Luo <leonl@leopardimaging.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 0/6] Remove surplus kernel-doc comments
Date: Fri,  3 Apr 2026 00:49:48 +0300
Message-ID: <20260402214954.3827408-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_FROM(0.00)[bounces-57990-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6A61A38E740
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi folks,

Some drivers include kernel-doc comments for the driver's callbacks that
are better documented elsewhere. Drop these comments as redundant.

Sakari Ailus (6):
  media: imx274: Remove redundant kernel-doc comments
  media: imx334: Remove redundant kernel-doc comments
  media: imx335: Remove redundant kernel-doc comments
  media: imx412: Remove redundant kernel-doc comments
  media: ov9282: Remove redundant kernel-doc comments
  media: tvp514x: Remove redundant kernel-doc comments

 drivers/media/i2c/imx274.c  | 38 ---------------
 drivers/media/i2c/imx334.c  | 93 -------------------------------------
 drivers/media/i2c/imx335.c  | 87 ----------------------------------
 drivers/media/i2c/imx412.c  | 82 --------------------------------
 drivers/media/i2c/ov9282.c  | 67 --------------------------
 drivers/media/i2c/tvp514x.c | 55 +---------------------
 6 files changed, 1 insertion(+), 421 deletions(-)

-- 
2.47.3


