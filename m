Return-Path: <linux-media+bounces-56258-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPEbLZo8u2lehQIAu9opvQ
	(envelope-from <linux-media+bounces-56258-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 01:00:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6A82C3FCC
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 01:00:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA3A430A87AE
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 23:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E53A393DEE;
	Wed, 18 Mar 2026 23:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NdQRu/Ap"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4273939A9;
	Wed, 18 Mar 2026 23:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773878364; cv=none; b=CWKtWuRSYntSd0bRnSK+XbSfS09mh4B7DOcygnAT3OBNCEeL5iBX0ruX5dKy0kof0FDIqRctoleQay692IGIeBoGwK8gaSMyNNh1C4XWwL0miGQ9dL62yUmPb1HZVejpNN1EZSETMudw2Le0kIy5M2bieAu38rq+Pr0tADdlzQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773878364; c=relaxed/simple;
	bh=gLusdaZpzZV/R2o46xC9iIKOyF8IVORea2zrIZcUUo0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WOLcz3GL9l+kDClAwa4ih4vBq5CUC0Y/wGDkiC2zwMXnpk++Q6Aaza0ljocCPKMGIJ+pSjFvBZrkaNAAgYYoZadH2oW2jVyIo7uBlebcbCdgRJnHCWs8siR8lfBb2wJZhrW86T7RsfTvbqsjPma4bAljnx8Vw7NAdpzIzMy3qmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NdQRu/Ap; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 549561AA6;
	Thu, 19 Mar 2026 00:58:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773878285;
	bh=gLusdaZpzZV/R2o46xC9iIKOyF8IVORea2zrIZcUUo0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NdQRu/Ap4RahmgPEtrpQLbyDMClFXrhzdjHnH2VqqN5x7r/b77J2vluyRvItmvZs6
	 E13vAcw4hyimeImIjkH6KTSBUdTqIQJqN1GS/GwPPE83k7hGXB1bu9n1Bu5DrQXedG
	 TYQ9Ri7LIiPOU03ua0fN5gfzZkcDTIrY3bj0D0Ec=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v4 07/13] media: renesas: vsp1: brx: Fix format propagation
Date: Thu, 19 Mar 2026 01:59:01 +0200
Message-ID: <20260318235907.831556-8-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260318235907.831556-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20260318235907.831556-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56258-lists,linux-media=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 0F6A82C3FCC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The format width and height is never propagated to the BRX source pad,
leaving its initial configuration invalid. Propagate the whole format
from the first sink pad to the source pad instead of only propagating
the media bus code. This fixes compliance with the subdev format
propagation rules.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/vsp1/vsp1_brx.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_brx.c b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
index dd651cef93e4..911359faa600 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_brx.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
@@ -156,14 +156,20 @@ static int brx_set_format(struct v4l2_subdev *subdev,
 		compose->height = format->height;
 	}
 
-	/* Propagate the format code to all pads. */
+	/*
+	 * Propagate the format code to all pads, and the whole format to the
+	 * source pad.
+	 */
 	if (fmt->pad == BRX_PAD_SINK(0)) {
 		unsigned int i;
 
-		for (i = 0; i <= brx->entity.source_pad; ++i) {
+		for (i = 0; i < brx->entity.source_pad; ++i) {
 			format = v4l2_subdev_state_get_format(state, i);
 			format->code = fmt->format.code;
 		}
+
+		format = v4l2_subdev_state_get_format(state, i);
+		*format = fmt->format;
 	}
 
 done:
-- 
Regards,

Laurent Pinchart


