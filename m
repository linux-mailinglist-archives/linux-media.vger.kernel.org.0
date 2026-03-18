Return-Path: <linux-media+bounces-56261-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kK9MFLI8u2lehQIAu9opvQ
	(envelope-from <linux-media+bounces-56261-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 01:00:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFAD2C3FF2
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 01:00:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 248263145419
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 23:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BF4A393DDA;
	Wed, 18 Mar 2026 23:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="G0RuoMDc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AC23939BC;
	Wed, 18 Mar 2026 23:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773878369; cv=none; b=k3cjnXIAqIdZ9tEQEi+9BwBQkay1cnsRKPKCDKJl8L0xLdf32tTE9JZbpIT8LtnnzvsfTyzRReffqLXrRkNpWjFyj5YLAXW0sFWnY4BL2yVFCQj2yUoAsk+pVcs8NuXZVPhFSVyVT4QlRL9WzFsZNyxjPwg/aSKGQznWfCsfVsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773878369; c=relaxed/simple;
	bh=6lTbvVsA2+VSb1qmR5Q6DzqClilPvVdNFFaxuSYlJAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dZig7BLp91wAMBuu4oNZHyPPX2/Fe5niUH1tLtIakuO8GCc3DWWU76G7sv3qxam5JfAyz+8qEfxNATJnBdycVcq/GVwNKJSqDY2goNmT5PULMTM/f8TnnOjqhRC5YNrmzSZPX8MkfpnRdSnap1ABX+TcX2nOjzzeswAbZf1dLDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=G0RuoMDc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 34B91BE1;
	Thu, 19 Mar 2026 00:58:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773878289;
	bh=6lTbvVsA2+VSb1qmR5Q6DzqClilPvVdNFFaxuSYlJAY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G0RuoMDccZsF1ued+O1Yl+CwlIfTEoEIKXG5OyblmkDpfiSCaHQ6PX2YiYfWiWL8z
	 q1VziSNE8V4Hm0acs5OwvzH0PYzqyCJ2RkQxPaZuRq+pO8CxBr1lHmewBK6+mZi1Sy
	 fCK/M2Dt3kkP5yGoEBB817xsij5yLUlt+Y1Ps47E=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v4 10/13] media: renesas: vsp1: histo: Fix size enumeration
Date: Thu, 19 Mar 2026 01:59:04 +0200
Message-ID: <20260318235907.831556-11-laurent.pinchart+renesas@ideasonboard.com>
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
	TAGGED_FROM(0.00)[bounces-56261-lists,linux-media=lfdr.de,renesas];
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
X-Rspamd-Queue-Id: DCFAD2C3FF2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The histogram supports size enumeration on the sink pad only, as the
source pad outputs a metadata format. The correct error code when
enumeration is not supported is -ENOTTY, not -EINVAL. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_histo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_histo.c b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
index f97aecb22058..313b9f3ce0f1 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_histo.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
@@ -183,7 +183,7 @@ static int histo_enum_frame_size(struct v4l2_subdev *subdev,
 				 struct v4l2_subdev_frame_size_enum *fse)
 {
 	if (fse->pad != HISTO_PAD_SINK)
-		return -EINVAL;
+		return -ENOTTY;
 
 	return vsp1_subdev_enum_frame_size(subdev, sd_state, fse);
 }
-- 
Regards,

Laurent Pinchart


