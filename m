Return-Path: <linux-media+bounces-52294-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OH17Mw/phWkLIQQAu9opvQ
	(envelope-from <linux-media+bounces-52294-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 14:13:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E67EFDF0F
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 14:13:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 910C73008D6F
	for <lists+linux-media@lfdr.de>; Fri,  6 Feb 2026 13:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF8DD3D522F;
	Fri,  6 Feb 2026 13:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PcdGn8Oc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C0836C593
	for <linux-media@vger.kernel.org>; Fri,  6 Feb 2026 13:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770383624; cv=none; b=Gt8zOu83Bhwkk7InN0r8/DVadVIUBCpxQnmuzX8lWA7XTgkTeFRjmlNytPzwe1DKuNSyxkW9ECvckhmBejQQo3CmPUhbq1KYLPBUiY9CvHpXhHSEZEzBDQkah5ze+SWPh7r0FBdQ/B6AURO6Jk/shdf9tsnXJwTzyA1KGpMD1Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770383624; c=relaxed/simple;
	bh=Vx8A7FZTtYn2Jxf9hMYBpQgiCLbZiFDydP9VTOLEUFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p80EbWBUz8akAQ4YxyAH9Cs6lJPb8O6sDavGv4gvC8JbjQZ9RUZrROh0X7qHsZksR7P9LsUNJI3g42eBvvBhPJkVct0Nws53g7CYKmkQj4RWR5RgwlvkK6RQE3svyqCT8DD3C2pkmIFQjLRlxIVTmANW8RFQgeMtoySNOa3PKOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PcdGn8Oc; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770383624; x=1801919624;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Vx8A7FZTtYn2Jxf9hMYBpQgiCLbZiFDydP9VTOLEUFs=;
  b=PcdGn8OcjAsNJQZmpQlSPqVCjlamC61MLYAMYC8Aku9p0ioltbEnnwjA
   BEIk48r8efHACqXoFCTtbinxMRqE51ouUo/4sEClY7plQJ4Tl+RBPjZo4
   mj5NNnDPNj+PzKW9O6edA/phM3zvmdUPkTTJXHvIa4nQIrIpuTEt0sltC
   n5njEdp2YDHgVGFJFaAL74CGHc0nrKCHN3J6NBNGBUbhzeAgnG9/WU77Y
   XI6GWBV+ypshmX3jaJcv8VfaBCPGSYEQCRwstMZJ6ubHesjrLtWKux59Z
   1IIGqxFK1UPIHZ5T6hoD+59K4mkg8Eo6kO6vEwLt5PVdf8mG1NjAsKjsc
   Q==;
X-CSE-ConnectionGUID: rWffwPQBSViu8P3VW1iokA==
X-CSE-MsgGUID: hNhMcfMZS8aYwdbYbwaGDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="75441181"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="75441181"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 05:13:43 -0800
X-CSE-ConnectionGUID: 7OdOehAMTFiCZtOSrNYgdw==
X-CSE-MsgGUID: vJ/TXngVRaG67hn4jdXz+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="215391288"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.219])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 05:13:38 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 81B76121EA1;
	Fri, 06 Feb 2026 15:13:40 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1voLeL-00000005Tsa-1X4y;
	Fri, 06 Feb 2026 15:13:29 +0200
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
Subject: [PATCH 09/13] media: Document enable_streams and disable_streams behaviour
Date: Fri,  6 Feb 2026 15:13:26 +0200
Message-ID: <20260206131329.1306429-10-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260206131329.1306429-1-sakari.ailus@linux.intel.com>
References: <20260206131329.1306429-1-sakari.ailus@linux.intel.com>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-52294-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,linux.intel.com:mid,ideasonboard.com:email];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6E67EFDF0F
X-Rspamd-Action: no action

Document that enable_streams may start additional streams and
disable_streams may not disable requested streams if other related streams
are still enabled.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 include/media/v4l2-subdev.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index a37d9a847196..de2684b15b96 100644
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


