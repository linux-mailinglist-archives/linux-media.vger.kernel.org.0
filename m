Return-Path: <linux-media+bounces-58411-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AP8ZFP0I2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58411-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:15:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9E73CF412
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:15:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ED76B300A5A1
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4186033B970;
	Thu,  9 Apr 2026 20:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gXPtunkB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DFD339B2D
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765726; cv=none; b=mVSfMHG1cUY4TY0h9P3QkHxBylucTqKieBH0g5M1DkC53kkvC3mBRfaBi8WIbpR40chAqu4gBGYvznRZ63wUnYinc7kSUKOy5fDzqYY0AcLqiZRF9PQeQOOUagoEKGvqfBsV+QA+Owkb1ODOBIr61Od9nxuq3c7bIECzV6PLN2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765726; c=relaxed/simple;
	bh=hUJEvGGezlhJ1vY9jKF3ClIKi9FUNzgHpmPrUiJVaho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V6dRAIxBS1JEX6rHD2nzEglDPSpWvWH1gKu675VvY8WZWzNWeyRstq+3Uav0TJ7T2gbNPG+nC11B0X/ZdvYMhyk8VymlDOATIsQnZaN4KCAkNpHgWbG3LA5S8ePK/Hl7umDiXYvRNkGnOETJTl7Ks/nR5aH9P2cWWv8g1wuoDPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gXPtunkB; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765725; x=1807301725;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hUJEvGGezlhJ1vY9jKF3ClIKi9FUNzgHpmPrUiJVaho=;
  b=gXPtunkB+kwHWxR/3Hinpcn1kWOli+HtPhvWzPBD/hgNpwPZSybFMyxw
   rQZSG7PIg4p2jkc2zhltsaTwcZfV/i2bUxehQ4QO2vcJp/D91lxwPJvA+
   VLCXiayz8vr9zg8GzEZ2tajljaLagQx+kLHZqHiCRoI+KK/tHlEjAuOUR
   3qdkDzMt1JAe5cQDV1/2WDYGBWcORVtJKGtaET5SqDkss1WagEhcpx45r
   ZKjhBit33clEKv4tr6aazSNEIgAa9+Nc8+RybUGwYioUSK5YYemtDcDri
   fubg0n7OxT4Tetz6R5fgfjngbfiA2z+06+BRIIhmTkKs3MrmPtQRpl/AG
   w==;
X-CSE-ConnectionGUID: C16AH7DATq6jFvr+YF92qA==
X-CSE-MsgGUID: aDAdGoByShq/oqHO91PrTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87408997"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="87408997"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:17 -0700
X-CSE-ConnectionGUID: DlbOJwLMS3qAy+pbqly6Iw==
X-CSE-MsgGUID: eBl0+PA4SNCcj4uHe9BbyQ==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:11 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 405CF12229E;
	Thu, 09 Apr 2026 23:15:13 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmH-000000045l7-2w4T;
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
Subject: [PATCH v12 07/86] media: Documentation: Reference CFA_PATTERN control in raw mbus docs
Date: Thu,  9 Apr 2026 23:13:42 +0300
Message-ID: <20260409201501.975242-8-sakari.ailus@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-58411-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 5E9E73CF412
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a reference to the V4L2_CID_CFA_PATTERN control in the generic raw
media bus code documentation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 Documentation/userspace-api/media/v4l/subdev-formats.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index 7d34c2991f81..3aa5bfdd5175 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -3865,6 +3865,9 @@ Bayer and other Colour Filter Arrays (CFAs) on serial interfaces. The packing of
 the data on the bus is determined by the hardware, however the bit depth is
 still specific to the format.
 
+The native Colour Filter Array (CFA) pattern is determined by the
+:ref:`V4L2_CID_CFA_PATTERN <image-source-control-cfa-pattern>` control.
+
 .. tabularcolumns:: |p{2.0cm}|p{4.0cm}|p{11.3cm}|
 
 .. cssclass:: longtable
-- 
2.47.3


