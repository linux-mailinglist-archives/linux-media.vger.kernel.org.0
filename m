Return-Path: <linux-media+bounces-52580-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NFBNVZHjGkHkgAAu9opvQ
	(envelope-from <linux-media+bounces-52580-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 10:09:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A3C1228C9
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 10:09:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB611302A6B7
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 09:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFDD03542F1;
	Wed, 11 Feb 2026 09:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y6FPB/IP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC96354AC6
	for <linux-media@vger.kernel.org>; Wed, 11 Feb 2026 09:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770800965; cv=none; b=m59cVRwMQBPj7Zt92j2T/vOPMVnKGasRfJcyaUuviYR73gQGfwrAdIU9ZWpJYiIcWHPsSTf93ASlDMvncS0QfuskrgzZ/b5Ym0V5s3SP0YKnVY6pTxAZqDdGrLvsV154wIDAU6jZ+E4+cVh/ANTIegOkv8f7fRmgh2R3jxW2BcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770800965; c=relaxed/simple;
	bh=ySYfTqmyUjUx0qaZCJ4q/Gjd81iDecFTl1mQgu0nnPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V5oiGKtKarQSU6pZoobZhUj1TJNxe14RnHrN89AfMGizpNFdt+OTQWvq1CsFujtEWFpALjWW78WIL1HCtHlCdQ1TTJV72tQ/+KXbibkTEBn9UUN+JD7qG0tIccDlBtdDwzy4mFukyOIljuJ+VGmRSFKm3FTpftvVfmzvgryLZDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y6FPB/IP; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770800964; x=1802336964;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ySYfTqmyUjUx0qaZCJ4q/Gjd81iDecFTl1mQgu0nnPI=;
  b=Y6FPB/IPfZZoE7/V353NO3wcuXRTP4opB3t7Blj6D9C6GVhVJpippftt
   UCBHpBE04alRraV5HnUuMWDTDa3W+YkbMqI+yfDGt5AHU9XL31cJOaXPQ
   iRWyG93zMAd1J7v8R0qQVrDy1kCoUKea0tMkBvM8Q7A7TEs2yTC91TSME
   AUT915YGqdMeNODqs/Xxsilw87hYvh7vywz+g1LJgGnZUY34VM9YApu5r
   QYscwUw1qejrXX1TqKng/3wMC+F2QGErjSza739RSMKYzYJ7pzTvUNSGV
   B6/edvVLk3gs5FaQilZ4Zsp9qr6NPI7lqwF6o5Xbr1sf6DSOgnv+FKN62
   g==;
X-CSE-ConnectionGUID: YjxUN0EASK6ONevDF1DR3A==
X-CSE-MsgGUID: XftAQz8ASgGDs6M0fHmX+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="72018912"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="72018912"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 01:09:21 -0800
X-CSE-ConnectionGUID: c+3gdEiKQGeDq260rhh8+Q==
X-CSE-MsgGUID: 7T5pk0yYQ6iKmkzcMWsEIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="212222785"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.208])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 01:09:15 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id AAFA6121D43;
	Wed, 11 Feb 2026 11:09:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vq6Do-00000007lZw-2IFh;
	Wed, 11 Feb 2026 11:09:20 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: [PATCH v2 03/14] media: Documentation: Improve LINK_FREQ documentation
Date: Wed, 11 Feb 2026 11:09:09 +0200
Message-ID: <20260211090920.1851141-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260211090920.1851141-1-sakari.ailus@linux.intel.com>
References: <20260211090920.1851141-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-52580-lists,linux-media=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 39A3C1228C9
X-Rspamd-Action: no action

Add a reference to the LINK_FREQ control and precise the meaning of the
control as for C-PHY the matter is less obvious.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/driver-api/media/tx-rx.rst                      | 3 ++-
 .../userspace-api/media/v4l/ext-ctrls-image-process.rst       | 4 +++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
index 22e1b13ecde9..7df2407817b3 100644
--- a/Documentation/driver-api/media/tx-rx.rst
+++ b/Documentation/driver-api/media/tx-rx.rst
@@ -93,7 +93,8 @@ where
    * - variable or constant
      - description
    * - link_freq
-     - The value of the ``V4L2_CID_LINK_FREQ`` integer64 menu item.
+     - The value of the :ref:`V4L2_CID_LINK_FREQ <v4l2-cid-link-freq>` integer64
+       menu item.
    * - nr_of_lanes
      - Number of data lanes used on the CSI-2 link.
    * - 2
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
index 6d516f041ca2..ee88933256dd 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
@@ -24,7 +24,9 @@ Image Process Control IDs
 .. _v4l2-cid-link-freq:
 
 ``V4L2_CID_LINK_FREQ (integer menu)``
-    The frequency of the data bus (e.g. parallel or CSI-2).
+    The fundamental frequency of the operating symbol rate (serial interfaces
+    such as CSI-2) or the sampling rate (parallel interfaces such as DVP or
+    Bt.565) of the data interface.
 
 .. _v4l2-cid-pixel-rate:
 
-- 
2.47.3


