Return-Path: <linux-media+bounces-52576-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOJgMYZGjGnXkQAAu9opvQ
	(envelope-from <linux-media+bounces-52576-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 10:06:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A423122876
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 10:06:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0EDBC305F6D4
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 09:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5E52352C48;
	Wed, 11 Feb 2026 09:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yydd4JiR"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18120350D4C
	for <linux-media@vger.kernel.org>; Wed, 11 Feb 2026 09:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770800749; cv=none; b=rrMj9R1BmJQB3CwVYTfI3Wu0j5N4OcHw+SwhCVlN+zi4YZzsqbKcUOLhmBWOQ5ntRnhxfRwMsw2Ht3WtKNGggoBMW16KtFlot2jxlnnOW3Ec8VIx8iQZbI/7DKuM5OB+N5oUJe5DXc2oODS6yo1WVAu2+WQSIGX749r2YPUF5Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770800749; c=relaxed/simple;
	bh=dCsvyMVg04NUshTtPig3Ihy4C7BpBi1Ejo/7qFJQV7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YQexX0MNPUCwx2nMoHBGyD/H89UH7uvmXhMhLnX1EV37T+lfXoNDoqMEzr9UjmfhPZ/PnotRaWTb9UBgUW+PmVK2SlfkdGLfLf1Fldr4ZVt1tEWAZDdCRCSsh7+T0dGxxUnV4pPCJPilXqeSArb0Z80LLUBXV1imRLJSuy/EavQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yydd4JiR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1636C19425;
	Wed, 11 Feb 2026 09:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770800748;
	bh=dCsvyMVg04NUshTtPig3Ihy4C7BpBi1Ejo/7qFJQV7w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yydd4JiR5hCi7SDm7JnIvgy7SrdHpk4pWzkqtAhKdDduAwH+7xYafgxIV7R5gDsXb
	 ocIQFt21m6trEJBOscQZwlgclGcMW8zz8p46IbY2Qq3Xu6jh/LAIo+g6BdVngrq5cU
	 TMFtcO8hI/7RiVr/v/CVGiO5UsQ6Xgk+t3NUeqVLnTDKqKaQbrG9iMJdNIS7MOd68Y
	 1Uk9tNlSt52wlIJoii2G/S2PfY8hpOqzAjnagd6e0EQc23yyc2F53Q34qxMNhoVOxp
	 Uy0FDweXuGQt/rNT3/R9YPfYRvQo/bTEXwg5BAog37aSo3Sm72Tis/Lx3Ou5Qnf7Yd
	 igDcaJ7vIo9qA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sean Young <sean@mess.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv9 2/3] docs: media: document Media Maintainers
Date: Wed, 11 Feb 2026 09:58:39 +0100
Message-ID: <f5ab8716f27cbdce550670fa3364b6a50d3c5d9a.1770800320.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1770800320.git.hverkuil+cisco@kernel.org>
References: <cover.1770800320.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52576-lists,linux-media=lfdr.de,cisco];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,huawei,cisco];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,intel.com:email,collabora.com:email]
X-Rspamd-Queue-Id: 3A423122876
X-Rspamd-Action: no action

Document who the Media Maintainers are and what their
responsibilities are.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/maintainer-entry-profile.rst        | 51 +++++++++++++++++--
 1 file changed, 48 insertions(+), 3 deletions(-)

diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
index 2a1fc9205b61..a059d17e66c0 100644
--- a/Documentation/driver-api/media/maintainer-entry-profile.rst
+++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
@@ -357,13 +357,58 @@ With the Pull Request workflow, Pull Requests shall use PGP-signed tags.
 For more details about PGP signing, please read
 Documentation/process/maintainer-pgp-guide.rst.
 
-Subsystem Media Maintainers
----------------------------
+List of Media Maintainers
+-------------------------
 
-The subsystem maintainers are:
+The Media Maintainers listed here all have patchwork access and can
+make Pull Requests or have commit rights.
+
+The Media Subsystem Maintainers are:
   - Mauro Carvalho Chehab <mchehab@kernel.org>
   - Hans Verkuil <hverkuil@kernel.org>
 
+The Media Core Maintainers are:
+  - Sakari Ailus <sakari.ailus@linux.intel.com>
+
+    - Media controller drivers
+    - Core media controller framework
+    - ISP
+    - sensor drivers
+    - v4l2-async and v4l2-fwnode core frameworks
+    - v4l2-flash-led-class core framework
+
+  - Mauro Carvalho Chehab <mchehab@kernel.org>
+
+    - DVB
+
+  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+
+    - Media controller drivers
+    - Core media controller framework
+    - ISP
+
+  - Hans Verkuil <hverkuil@kernel.org>
+
+    - V4L2 drivers
+    - V4L2 and videobuf2 core frameworks
+    - HDMI CEC drivers
+    - HDMI CEC core framework
+
+  - Sean Young <sean@mess.org>
+
+    - Remote Controller (infrared) drivers
+    - Remote Controller (infrared) core framework
+
+The Media Driver Maintainers responsible for specific areas are:
+  - Nicolas Dufresne <nicolas.dufresne@collabora.com>
+
+    - Codec drivers
+    - M2M driver not otherwise delegated
+
+  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
+
+    - Qualcomm drivers
+
 Submit Checklist Addendum
 -------------------------
 
-- 
2.51.0


