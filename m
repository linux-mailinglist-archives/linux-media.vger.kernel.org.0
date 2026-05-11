Return-Path: <linux-media+bounces-61187-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPHHEN1sAmqosgEAu9opvQ
	(envelope-from <linux-media+bounces-61187-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 01:57:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A145179EF
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 01:57:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BF2153022B98
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 23:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C290336A36F;
	Mon, 11 May 2026 23:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Mgi4p/WZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4B236A351;
	Mon, 11 May 2026 23:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778543808; cv=none; b=oDmAU5AJSDpiavS04cxojlYGLcDXP+65fRLdWdnBXruX/DiMIHkaFcPvzU7PNG4ESkUcAi6IC2ztGUQcjM19m+Ynd3WC/ONGNSW6qrj2qPQQZNtot+UJkdorvYB42iZWdDVrNo63839nEDmzUVSyAIt9Z6tpbD8FFiDlUhTQ2q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778543808; c=relaxed/simple;
	bh=WaI1CaivcO3SBvuzDR8Tm5rPyhH7QKHE2rsCMfNJz3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F+4Ms89xAVWgGOtnK7ntaL0aWd7NZXxi0P3GL90JTa94QowD0ah9HXzocqmciZKCxNpCih9a2njMbsztIx0oLcVrIejOohATRgP4ZdqDFtuykyenmbFIYYTrgahbuNgEeprrqKl3k6j6TplwaRFoZzMvq4fulWX6OXK3zGY0LWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Mgi4p/WZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EDA1E517;
	Tue, 12 May 2026 01:56:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778543797;
	bh=WaI1CaivcO3SBvuzDR8Tm5rPyhH7QKHE2rsCMfNJz3Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mgi4p/WZyPmGHd0YNfh9VUTXVfuWSZ3AdR1J/ggW+HFooYMTpX5hMLNLy2FZBcFkk
	 bepjqaG9OPoXxcnz9AdKBEpAU2O8h+i2mlN4HbkytazWE03YajMwpum4tC/RaUWyhf
	 OxB7e/wosnHbGYqpvGLOcM/mCmBnjLeAXDcXqw7k=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 04/11] drm: renesas: rz-du: Switch to new VSP API
Date: Tue, 12 May 2026 02:56:28 +0300
Message-ID: <20260511235637.3468558-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511235637.3468558-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20260511235637.3468558-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 58A145179EF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61187-lists,linux-media=lfdr.de,renesas];
	PRECEDENCE_BULK(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,ideasonboard.com,bp.renesas.com,gmail.com,ffwll.ch];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The vsp1_du_setup_lif() function is deprecated. Use the new
vsp1_du_enable() and vsp1_du_disable() functions instead.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Biju, I would like to merge this for v7.2 through the media tree instead
of the DRM tree. Would that be OK with you, or do you expect conflicting
changes to the rz-du driver for v7.2 ?
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
index bd486377f037..d5a1d36db2c1 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
@@ -55,12 +55,12 @@ void rzg2l_du_vsp_enable(struct rzg2l_du_crtc *crtc)
 		.callback_data = crtc,
 	};
 
-	vsp1_du_setup_lif(crtc->vsp->vsp, crtc->vsp_pipe, &cfg);
+	vsp1_du_enable(crtc->vsp->vsp, crtc->vsp_pipe, &cfg);
 }
 
 void rzg2l_du_vsp_disable(struct rzg2l_du_crtc *crtc)
 {
-	vsp1_du_setup_lif(crtc->vsp->vsp, crtc->vsp_pipe, NULL);
+	vsp1_du_disable(crtc->vsp->vsp, crtc->vsp_pipe);
 }
 
 void rzg2l_du_vsp_atomic_flush(struct rzg2l_du_crtc *crtc)
-- 
Regards,

Laurent Pinchart


