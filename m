Return-Path: <linux-media+bounces-58253-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPh0OVR31mlQFggAu9opvQ
	(envelope-from <linux-media+bounces-58253-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 17:42:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6193BE5F0
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 17:42:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AAD8530567B7
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 15:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FBB23D75DA;
	Wed,  8 Apr 2026 15:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LjFCl5Vi"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9983A2579
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 15:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775662811; cv=none; b=JCVQ894A60uICzbS4kfPDKRvVp5P4vzYFnMx9sKFGeGkKdSh/Y2+n9npYCbt7xKSY3alsHHcPuV7xSeQ5KTrkJIV6eABbVsPEd1BzCwrGBX/Tn3haf3+m4JT2boG0488dfGiTfNl4qDXFHIh0jsZGhSYOaarmPp8JtyUHAml1aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775662811; c=relaxed/simple;
	bh=wYNnny9oXXzq29zZc10s3/tHyMrNU2YdK+d6JfinpMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SageTDHHJyENfR3sQzw2UEyZ/0keoLByV2Zn6j/3sBWmyRxZ1yViuGRKco0E00mFsS7Fb48kmdWYk2ovXmdOhDGZ80JIXmBOISt3Qme9zDlRSjqQWxo6qorm3pH16u69hqYABT3jw48B75rv9ee3uFI1+KpS6BiGRTTLyIXwzo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LjFCl5Vi; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775662808; x=1807198808;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wYNnny9oXXzq29zZc10s3/tHyMrNU2YdK+d6JfinpMw=;
  b=LjFCl5Vi4O0hS++2uqJ1B6C83hAVdzZqOuTj52d3LIHfsQHMTkNbSGlM
   Q8S5MGfI0zMxcgGLM2eJiFEW7cet/Ub62T/I4UewkwhMzuVXBSU8fswy3
   z03iRE1DPMAE0ZGDvlz21XcrLt769F/HSEjD0LNT44RL0GWc7xx7VHOAA
   isrl8GHnPQxHTF6ODqkKvl7NVTi1A6faM0NkLEfyyWhxLnUW58+O4JaDK
   osQUfM5nfkziJ5xwcBZlDfQeO8t3JioltJn9KiWRJ1uyaOY4fM1hQ9EWN
   wO/uAathUs++aANfZY5T+7puGDLYLW4e0FEqHv9nUJ2Nw94/G9OH8z8uR
   g==;
X-CSE-ConnectionGUID: WAjVwFjJR8mOJphm5YKN2w==
X-CSE-MsgGUID: YuBqkTnaSr+0jDL9l8AfSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="94038388"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="94038388"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 08:39:54 -0700
X-CSE-ConnectionGUID: 2KM/W1IQQWKSkkFN/xsfHA==
X-CSE-MsgGUID: MbxKfKlKRj2uFE80hPo5Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="223740292"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.104])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 08:39:45 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 12654121F87;
	Wed, 08 Apr 2026 18:39:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAV0F-000000044DC-25WE;
	Wed, 08 Apr 2026 18:39:39 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
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
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: [PATCH v4 14/29] media: Documentation: Improve LINK_FREQ documentation
Date: Wed,  8 Apr 2026 18:39:23 +0300
Message-ID: <20260408153939.969381-15-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	TAGGED_FROM(0.00)[bounces-58253-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[30];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,nxp.com:email,linux.intel.com:mid,ideasonboard.com:email];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.933];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2E6193BE5F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a reference to the LINK_FREQ control and clarify the meaning of the
control as for C-PHY the matter is less obvious.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
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


