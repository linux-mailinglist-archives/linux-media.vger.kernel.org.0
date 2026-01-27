Return-Path: <linux-media+bounces-51652-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOwjNsCreGl9rwEAu9opvQ
	(envelope-from <linux-media+bounces-51652-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 13:12:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B87294166
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 13:12:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BF5E30564C2
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 12:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B3D34D393;
	Tue, 27 Jan 2026 12:09:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450B31CAA68;
	Tue, 27 Jan 2026 12:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769515786; cv=none; b=bf92LAwrhsmAJU/An+V6xrJwTmVtRT39bjjMXqlboI6aqEx5K2Jwq8Ejy7qiHcUYJjj0RCvtJmkIvHGySWRp/BOnx6cTOGqDLC/OF80vYNuUrvR37Qyy1Ez2cG9uJ/gCToL8j0Ksh1HisvnPUjwOKlcf4YyH1HtswL5laH8QVH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769515786; c=relaxed/simple;
	bh=xVSArCsgkvc14SfDXsZ8Qcxa5lbmokjpA/ZJYEzxHUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uVuh/vl/EikxtSu+TeJsI9cG37Bmtnwb0B5INCD+6qa1SKli/iKXal+/5ps3JGW6dYVFRLhi6EO288mLQjaTDjDDy4MgvsjBa8UeMkUgj2yD7adcGtXB/QhiHGha9wtKG1RAwV5qrcWo93DDyaflVRPMKbkyvdz98SVdFAIgW/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from localhost (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id B0D7E86C53;
	Tue, 27 Jan 2026 13:09:32 +0100 (CET)
From: tumic@gpxsee.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH 2/2] media:admin-guide:mgb4: Add zDML color mapping info
Date: Tue, 27 Jan 2026 13:09:13 +0100
Message-ID: <20260127120913.4690-3-tumic@gpxsee.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127120913.4690-1-tumic@gpxsee.org>
References: <20260127120913.4690-1-tumic@gpxsee.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tumic@gpxsee.org,linux-media@vger.kernel.org];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[gpxsee.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-51652-lists,linux-media=lfdr.de];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,digiteqautomotive.com:email]
X-Rspamd-Queue-Id: 3B87294166
X-Rspamd-Action: no action

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

Document the zDML (Audi Digital Matrix Light) color mapping option for
the inputs and the new outputs color mapping property.

Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
---
 Documentation/admin-guide/media/mgb4.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/admin-guide/media/mgb4.rst b/Documentation/admin-guide/media/mgb4.rst
index 0a8a56e837f7..8e429fd77712 100644
--- a/Documentation/admin-guide/media/mgb4.rst
+++ b/Documentation/admin-guide/media/mgb4.rst
@@ -74,6 +74,7 @@ Common FPDL3/GMSL input parameters
 
     | 0 - OLDI/JEIDA
     | 1 - SPWG/VESA (default)
+    | 2 - ZDML
 
 **link_status** (R):
     Video link status. If the link is locked, chips are properly connected and
@@ -240,6 +241,13 @@ Common FPDL3/GMSL output parameters
     *Note: This parameter can not be changed while the output v4l2 device is
     open.*
 
+**color_mapping** (RW):
+    Mapping of the outgoing bits in the signal to the colour bits of the pixels.
+
+    | 0 - OLDI/JEIDA
+    | 1 - SPWG/VESA (default)
+    | 2 - ZDML
+
 **frame_rate** (RW):
     Output video signal frame rate limit in frames per second. Due to
     the limited output pixel clock steps, the card can not always generate
-- 
2.52.0


