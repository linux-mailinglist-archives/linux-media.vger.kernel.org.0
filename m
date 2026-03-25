Return-Path: <linux-media+bounces-56993-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FS3CuDBw2kRtwQAu9opvQ
	(envelope-from <linux-media+bounces-56993-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 12:07:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A5ABC32381E
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 12:07:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5770230CCFBB
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 10:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 947423CA493;
	Wed, 25 Mar 2026 10:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bUgj3BTP"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1384D3C8728
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 10:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436332; cv=none; b=iXMcFh1zvhVOhJVNp0WfJE0cIeosUYeggX6ygUlEMr23OhWX6GztOsJccArMhP4b3B05YtSzTnU2QD4TMGn2KLXAaASYg2MF+l5VKIz5hyAsy4xD8ff5bAV3iYsRoLHTv2YVr0Y3mQBKXWlO1oM4u25pWWAWRllQCqZzTpFUvp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436332; c=relaxed/simple;
	bh=eC/g/BB3ptL9As+MQeQclsXvXodNTzzp+uj4SLpGek0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tR4rbr0TsKDjcVqVZnFrjkqojh1okaQjBvJWM4YQfx4K7mt76Izwr8xNcRTwNRsuP4tRXBS3KzB3Msn8ApQEd+df7nkpge5GXYF9qWmyb5qpY5YuBJCuccQiBmot0S03Fgbyt26RrOmEWrlk4vt6Lwy+YLYKW11zW1kyDiOZC48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bUgj3BTP; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774436331; x=1805972331;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eC/g/BB3ptL9As+MQeQclsXvXodNTzzp+uj4SLpGek0=;
  b=bUgj3BTP+Ix02+lXd2iuy8lAHzQ7YbeIfpjPCHvtTTWpC7YcBRGsAs14
   YZoRJPPG3z8r7XzI8K5WTP2kW2eyjlfADE9PRv1V8mot+V5Koep0uqYHu
   fUNxAqJbYX1rWdRcdz+KaFUb2+/s1IKgFqE0y2KrvV7yIOVL0W85HpdhB
   /vfPvqDfbo7uEm958/p4taePVUZbsXh63yFcEuBdIlwhpOsYPfCUVIH2b
   +xY+2MDBlJugkFuANmYV42Xq1RxXQlu2JZEhWGtms47TNTpVtlinVoaUN
   GfRpnD8+e+M5aLmltcq5Pbk40dK2ht2pex/rO0nzZ7eIlz4MH6JV7oxKg
   A==;
X-CSE-ConnectionGUID: thYK5MmBRDa2IQvp9lD4Ng==
X-CSE-MsgGUID: d/CYD7zKTOW+WThdqDxElw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="74496445"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="74496445"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 03:58:49 -0700
X-CSE-ConnectionGUID: ybvUcegMS2qlGYPoi/mLJA==
X-CSE-MsgGUID: aAU4jaTTSxuByqZ9aa/6ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="221763537"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.64])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 03:58:43 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id AB0A01223F8;
	Wed, 25 Mar 2026 12:58:30 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1w5LwJ-00000004wAh-0SHo;
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
Subject: [PATCH v3 14/14] media: Improve enable_streams and disable_streams documentation
Date: Wed, 25 Mar 2026 12:58:10 +0200
Message-ID: <20260325105818.1176816-15-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-56993-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:dkim,intel.com:email,nxp.com:email,ideasonboard.com:email];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A5ABC32381E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document that enable_streams may start additional streams and
disable_streams may not disable requested streams if other related streams
are still enabled.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
 include/media/v4l2-subdev.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index d256b7ec8f84..4588992b4417 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -814,6 +814,10 @@ struct v4l2_subdev_state {
  *	V4L2_SUBDEV_CAP_STREAMS sub-device capability flag can ignore the mask
  *	argument.
  *
+ *	Starting the requested streams may require starting additional
+ *	streams. Streams that are started together due to hardware are called a
+ *	stream group.
+ *
  * @disable_streams: Disable the streams defined in streams_mask on the given
  *	source pad. Subdevs that implement this operation must use the active
  *	state management provided by the subdev core (enabled through a call to
@@ -823,6 +827,9 @@ struct v4l2_subdev_state {
  *	Drivers that support only a single stream without setting the
  *	V4L2_SUBDEV_CAP_STREAMS sub-device capability flag can ignore the mask
  *	argument.
+ *
+ *	A stream group is disabled when one or more streams in the stream
+ *	group are disabled.
  */
 struct v4l2_subdev_pad_ops {
 	int (*enum_mbus_code)(struct v4l2_subdev *sd,
-- 
2.47.3


