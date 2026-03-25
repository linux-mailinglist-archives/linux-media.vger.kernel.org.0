Return-Path: <linux-media+bounces-56981-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLR7MpXBw2kRtwQAu9opvQ
	(envelope-from <linux-media+bounces-56981-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 12:05:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79221323787
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 12:05:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 71C8130F4F23
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 10:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3342B3C5551;
	Wed, 25 Mar 2026 10:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lCRVMUO4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B953A6F04
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 10:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436323; cv=none; b=BgsPvce6pylOX1JJ6FJzuQqOCztxLFIv7Kz/hkj6F9BG6tFNhHLPInVjKJs1JHefyAhAMvYB7jUtECSE+iuL6cE8onwJHUwS6oI+1PVJxlnC6owkEcazbu8VqpB3eY4BabSHOtXwWA6C3cIMtRnkXZ/j6AnGs6He4UlVzqBfsBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436323; c=relaxed/simple;
	bh=QJr3IO0NBhQN06ES4RQzVF/mhvyAkuI4PXtOR+OpcJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hEyDi/mI8vrMXrcKVwLiP85CMw0zB0vJqBLONQ4cBMMWu4+TAsmQyHWhvMtcuFMVkA60KO9PMQDIwGkZXe+AVdmoxWL6M+/56gtGiAVn6KEDDv58qN2lJILnXrR7AbnLxTbGebQwrL065iI87DvG51ytfXDuVypwhNX8bKnCnEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lCRVMUO4; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774436323; x=1805972323;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QJr3IO0NBhQN06ES4RQzVF/mhvyAkuI4PXtOR+OpcJQ=;
  b=lCRVMUO4ssUGA6qnY6yflKQgrtMm+KGgRW5TlQLmQCVeaOAJv+aenHdS
   xKoGBe2s3LEzBZsnJ9Q/FVL3TmmGI49AhIbCALinEmGWc9Lau4hUeOJfM
   3qUVHnx3Q34wYeCL8amcRn5s1ocwjlc6QjW9c2SvE/XbiXyvxD9lyMTzF
   +ojcc0QzKmQKP0VC62CtAGD9f2Eafwxf45GNHBNEye3TZWXcBFJS9Kt4Z
   CARlYHcNt/ei3UwkuZxiVduVRW9VxweHfLtVXaAs+wx0Em/aMZR30oZh3
   mP4cHiXXmI9NtiivtoemXeFGi5KmS9oAIi1gMOJSPdDtE2HSe092wzg5k
   w==;
X-CSE-ConnectionGUID: A6qPSlZRSca+9BSetN6KOg==
X-CSE-MsgGUID: sxMKCTYVQGaOiPRn3YpkYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="74496305"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="74496305"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 03:58:41 -0700
X-CSE-ConnectionGUID: 71xYAD/OThiuYbhrvNWZqA==
X-CSE-MsgGUID: 9QZ63VWDSfKtp/JFa1Mg1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="221763481"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.64])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 03:58:35 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id AB120122422;
	Wed, 25 Mar 2026 12:58:30 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w5LwJ-00000004wAl-0XGe;
	Wed, 25 Mar 2026 12:58:19 +0200
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
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v3 14/22] media: uapi: Bump the STREAMS bit a little
Date: Wed, 25 Mar 2026 12:58:11 +0200
Message-ID: <20260325105818.1176816-16-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260325105818.1176816-1-sakari.ailus@linux.intel.com>
References: <20260325105818.1176816-1-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-56981-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,linux.intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 79221323787
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Bump the V4L2_SUBDEV_CAP_STREAMS by one bit up, order to avoid confusing
libcamera with streams that has moved forward from the original libcamera
implementation. The bit can presumably be taken into use but only after
the other free bits.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/uapi/linux/v4l2-subdev.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
index 2347e266cf75..6160c3e21436 100644
--- a/include/uapi/linux/v4l2-subdev.h
+++ b/include/uapi/linux/v4l2-subdev.h
@@ -196,8 +196,11 @@ struct v4l2_subdev_capability {
 /* The v4l2 sub-device video device node is registered in read-only mode. */
 #define V4L2_SUBDEV_CAP_RO_SUBDEV		0x00000001
 
+/* Reserved, old STREAMS bit libcamera used before API stabilisation. */
+/* #define V4L2_SUBDEV_CAP_STREAMS_PRELIMINARY	0x00000002 */
+
 /* The v4l2 sub-device supports routing and multiplexed streams. */
-#define V4L2_SUBDEV_CAP_STREAMS			0x00000002
+#define V4L2_SUBDEV_CAP_STREAMS			0x00000004
 
 /*
  * Is the route active? An active route will start when streaming is enabled
-- 
2.47.3


