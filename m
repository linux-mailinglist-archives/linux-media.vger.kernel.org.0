Return-Path: <linux-media+bounces-56260-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMvGDaw8u2lmhQIAu9opvQ
	(envelope-from <linux-media+bounces-56260-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 01:00:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BE82C3FE3
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 01:00:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94242313F41E
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 23:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 709B33939CE;
	Wed, 18 Mar 2026 23:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OMHtb+yQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06B93939BC;
	Wed, 18 Mar 2026 23:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773878366; cv=none; b=ZNjNOrG2oeOK96hhBPGXa7oCg0uQOYk5VdhzFoEb4dD6vGloJ9gYcyy9+U07ooFv/Kw3bWIc+YjpKni94JMgND8gUMpj0Djvh/AbWyJLujMv81/r1TbCG6lnAxtnqlD5fu8MFbCLxao1+wADP7ulNmehFc2jATl74ACj24r0OBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773878366; c=relaxed/simple;
	bh=XEOlXbZm4sVMR/hQWHXSdc1OSjlyxGgGH6dNpjX4iFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jhMkTdcih+h8uOzLE49wOnTHY1w9Yt8HqtMuJuMLGwkjY1RlePG2tMqE9PkUCQjUgOTEKipwp2h2HguOc0OR4fHLGzi65EoFgkQ7uX//8fywr2hOTqiUNSqYrTMfeJRmlNK/PVjfo8/9bxXm6OS1jL6o9ria4gf3BDpEQGJMGBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OMHtb+yQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id ECEFC9A6;
	Thu, 19 Mar 2026 00:58:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773878288;
	bh=XEOlXbZm4sVMR/hQWHXSdc1OSjlyxGgGH6dNpjX4iFU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OMHtb+yQw7fQrZ5ZgmhfWj4uFJyKti3JJ5MRlNGz5KS/fdjtttMkp7cavRyCXPS42
	 owzmpMnQ2jEMJTIcVkNJGtZDYlWNLCnRGobmmWtuX6svMaxWiVROTcig9aSxwCWA/i
	 hh7/9QYmSZYy4ak3wq9l6RYKSjGHjGqQdu29vnGk=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v4 09/13] media: renesas: vsp1: histo: Fix code enumeration
Date: Thu, 19 Mar 2026 01:59:03 +0200
Message-ID: <20260318235907.831556-10-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260318235907.831556-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20260318235907.831556-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-56260-lists,linux-media=lfdr.de,renesas];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: C0BE82C3FE3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The histogram media bus code enumeration does not check the index when
operating on the source pad, resulting in an infinite loop if userspace
keeps enumerating code without any loop boundary. Fix it by returning an
error for indices larger than 0 as the pad supports a single format.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_histo.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_histo.c b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
index d7843c170f94..f97aecb22058 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_histo.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
@@ -168,7 +168,10 @@ static int histo_enum_mbus_code(struct v4l2_subdev *subdev,
 				struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->pad == HISTO_PAD_SOURCE) {
-		code->code = MEDIA_BUS_FMT_FIXED;
+		if (code->index > 0)
+			return -EINVAL;
+
+		code->code = MEDIA_BUS_FMT_METADATA_FIXED;
 		return 0;
 	}
 
-- 
Regards,

Laurent Pinchart


