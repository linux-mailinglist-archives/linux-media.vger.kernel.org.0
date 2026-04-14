Return-Path: <linux-media+bounces-58738-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHUKGoca3mmFnAkAu9opvQ
	(envelope-from <linux-media+bounces-58738-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 12:44:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8BB3F8E6E
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 12:44:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C1ECD30D1A1F
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 10:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C54893D9DA8;
	Tue, 14 Apr 2026 10:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LR64qcMh"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9543E3D891C
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 10:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776162958; cv=none; b=matICHeFDBoyJOo0Hvwj3xcexDHb3dV2eWVFt8HRKCMUHT8ljnAc69lSqxMO1rop1zc5W02qFv2ezxFd1kR9SYlu3FeVP20EzNat+9BgEQqrgk7YrHUmT+nAoUykBz0Ck/nilkSnPVel7ThlYhRXss9GGF7w63czPJrk6DVqMKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776162958; c=relaxed/simple;
	bh=B5XmvUYW1jTDhNqkevXKRrhh5k6s1JMCLZijPpbrq14=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p5fZC5SwFeqzIcoUu5SVhKoi54lp1vLeDr7muSicDsgpoEe2FD6z0+utWPjUJVRCo+Uz/SWkKVeYtJvGfHYpBWRhbGyBJ3wGq6Vm44CYc0FTyqIqTLE0Id/WHPIxhwevdy/yOvrcYxWzq7/kNI+yvy3TV0xNfkCH9f02CBK/fNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LR64qcMh; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776162952; x=1807698952;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=B5XmvUYW1jTDhNqkevXKRrhh5k6s1JMCLZijPpbrq14=;
  b=LR64qcMhQ3/48nXada0bfr7qV0KzZvvjyUIVNSpUT84Z1DfGUWn8WRLW
   9RCihVBYXP7BoPBI4bFknYQJ948emUKFvw+F0e+S9eShUCXmf4PNf5gVY
   jkliPeiQTb4obZT5DK6/I0FmFaHPg3NiBvok+btQtYNV4rCsP5BwvrR8/
   gEsPGfjPjVeMAJ5Ad7bsLB8vu39O6uLwi9zv9enrxdYNQ+n3qeNKbY2vH
   tK7IOlWD1iU+y9yQ+hjs7e9Y/ZIt+pJFZ6v91BDTPTcNgx6AfC4NWTaq4
   gx0+GTvuGOw8Ke1sHAK0pyRUmldXtoM/XJZcyejojUYXTmY9Vh+mJcoT+
   g==;
X-CSE-ConnectionGUID: 2h5decrtT/OC3vLH+xYNpw==
X-CSE-MsgGUID: +uddrEY8RIW2RVKmbWiJaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="88498420"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="88498420"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 03:35:49 -0700
X-CSE-ConnectionGUID: RsTo1AP3TRKRD/CRsTRVqw==
X-CSE-MsgGUID: v891/f+xRzWS4pyoIxTLzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="268029951"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.154])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 03:35:43 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5F12F120333;
	Tue, 14 Apr 2026 13:36:00 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wCb7f-00000004HnQ-2woQ;
	Tue, 14 Apr 2026 13:35:59 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	jai.luthra@ideasonboard.com
Subject: [PATCH 1/1] media: Documentation: Improve PIXEL_RATE control documentation
Date: Tue, 14 Apr 2026 13:35:59 +0300
Message-ID: <20260414103559.1021712-1-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_FROM(0.00)[bounces-58738-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,intel.com:email];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DA8BB3F8E6E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document explicitly that the PIXEL_RATE control reflects the actual
frequency at which the pixels are read in the pixel array. It is thus
orthogonal to analogue binning.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/v4l/ext-ctrls-image-process.rst      | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
index 6d516f041ca2..8616bcd67270 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
@@ -41,6 +41,11 @@ Image Process Control IDs
     The configuration of the frame rate is performed by selecting the desired
     horizontal and vertical blanking. The unit of this control is Hz.
 
+    Note that this control isn't affected by analogue binning as the pixels are
+    still being read at the same frequency as without analogue binning, only
+    what is being read is different (a single pixel value vs. a binned pixel
+    value based on the values of two or more pixels).
+
 ``V4L2_CID_TEST_PATTERN (menu)``
     Some capture/display/sensor devices have the capability to generate
     test pattern images. These hardware specific test patterns can be
-- 
2.47.3


