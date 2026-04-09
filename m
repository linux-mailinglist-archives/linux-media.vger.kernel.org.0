Return-Path: <linux-media+bounces-58422-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PUMKCIJ2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58422-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:16:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A64DE3CF486
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:16:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 216783028899
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51C5A34321A;
	Thu,  9 Apr 2026 20:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I1k8uy+X"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5677B33F591
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765731; cv=none; b=EnJ6ozQ8uTV7yZToUySvfzWlVTdrn/NOtO+1Os/tms5GFHSKjVFqvy6dsNuLfCSYYs7qNdV1/J/dF022HhTzYsNY1oCIlMej975S2bpNb8PIDsiLcOtvRDXUScRdMbOdm2LjjXRofGOinSnVe8fMlaQFlcuKYFKTPozyzgwnU08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765731; c=relaxed/simple;
	bh=3WdIz9LVxXBYv8lu09hYy86WBCBxYYYgvC3dLbEoSoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YDjevtMSwWMlB4MQ2TMWmJ0amPfmKsXsbC+pqmY9cyNDoRvEMEn7QsY3QrA+CmcCmBk48/eNeKpPaV9Azb18KbrmwaxoHwkc80B4zIxI4dmqcjuwWrOYY3llQ25kRPWmxtH3sc6E0OBN0AOzXhhMDz+fWlISeHpX4abHiriRGwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I1k8uy+X; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765730; x=1807301730;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3WdIz9LVxXBYv8lu09hYy86WBCBxYYYgvC3dLbEoSoo=;
  b=I1k8uy+XQ2Z5tJc/joScM8o5qmhf6M0waehoonzeNlNFuVEOQuN6f+xJ
   nyyf9RHNYZvAfw5vif4sSb0tKsNLXzgPhN0NPwJcYo957dfcFtf1tTZi+
   REx6nAOUJOrfQSJeHk6CpV26CVOlsKPYWetyCNqeoKFjUv5xlG574aVmV
   9pAp2puXWtNNkMhuaxQXQnie6/TiXubTA65+2lzzy3WwX/oniBrBy6Duc
   f39sOAGARNVOR0vU5ScD4xIclEJivmUVDKGSXZBcKJdjUX6kbux0y5dhd
   ByZh6Nqa5OhFuz92KAUdnqTaxHIHoekQ97ejD47CRcMPvJQ78v2JID78M
   Q==;
X-CSE-ConnectionGUID: S1oIpAR3TIiiUpXnv6a6SQ==
X-CSE-MsgGUID: F1S5mkkuRomyk0Gi/FA+kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87409071"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="87409071"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:17 -0700
X-CSE-ConnectionGUID: Mfuk9wESQYiP6IiEqV7vRw==
X-CSE-MsgGUID: mYJiYbKeRqaq5yd/zHGbFQ==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:11 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 54C0D122542;
	Thu, 09 Apr 2026 23:15:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmH-000000045lK-38nR;
	Thu, 09 Apr 2026 23:15:01 +0300
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
Subject: [PATCH v12 10/86] media: Documentation: Document raw mbus codes and CFA for cameras
Date: Thu,  9 Apr 2026 23:13:45 +0300
Message-ID: <20260409201501.975242-11-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	TAGGED_FROM(0.00)[bounces-58422-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,intel.com:dkim,intel.com:email,ideasonboard.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A64DE3CF486
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the use of raw mbus codes for camera sensors and how the
V4L2_CID_CFA_PATTERN and V4L2_CID_CFA_PATTERN_FLIP controls are used to
convey the color filter array pattern on UAPI.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/drivers/camera-sensor.rst   | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
index 75fd9166383f..75d783b75c48 100644
--- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
+++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
@@ -39,6 +39,19 @@ format set on a source pad at the end of the device's internal pipeline.
 
 Most sensor drivers are implemented this way.
 
+V4L2_CID_CFA_PATTERN, raw mbus formats, flipping and cropping
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+For raw image data originating from camera sensors, specific :ref:`raw mbus
+codes MEDIA_BUS_FMT_RAW_x (where 'x' is the bit depth)
+<v4l2-mbus-pixelcode-generic-raw>` are used as Color Filter Array (CFA) agnostic
+raw formats. The :ref:`V4L2_CID_CFA_PATTERN <image-source-control-cfa-pattern>`
+control in the same sub-device defines the native CFA pattern of the
+device. Flipping may further affect the readout pattern as indicated by the
+:ref:`V4L2_CID_CFA_PATTERN_FLIP <image-source-control-cfa-pattern-flip>`
+control. Further on, cropping also has an effect on the pattern if cropped
+amount is not divisible by the size of the pattern, horizontally and vertically.
+
 Frame interval configuration
 ----------------------------
 
-- 
2.47.3


