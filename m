Return-Path: <linux-media+bounces-61192-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIebCjdtAmodswEAu9opvQ
	(envelope-from <linux-media+bounces-61192-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 01:58:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B62D4517A98
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 01:58:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7732A306318A
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 23:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6673736C9CB;
	Mon, 11 May 2026 23:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="arnNQL1z"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5892936A361;
	Mon, 11 May 2026 23:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778543815; cv=none; b=b9r3abWQaWhwWEN9Dh3UsbxYbnu88us+XJjrlsWZsM5WobDQt4MG4R9Ivc9BvCg7/DBrlLcQ3HiVQYYv3MBJmx/O/vVGp4vrbg6Gfvc2Svx62gHUNJYDaWsC4kd5/yPk6F/AJf0VeKhsMd8Dk1BFlX7ldI35j1a6ayEDrIimk1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778543815; c=relaxed/simple;
	bh=I5d+4K7h/aBDUFewAuRMs9MKDzFzwUrbqwk7QyJgHBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lR5XAVRHKGaOkttY7nLWyGRLCW8OF9nrktoDrsc6b06it8I8f5CqpMcCx+8ISmt5Zb8ZnUHtAHjqHiHPwJJQG7piPJwZIfJndf+YcYMsTrix1AywhdiK72Tr6JyQyz4+Cxv/OiP/JZ9aErvbPxB9sY9Wa/IlZXFdbAik8tNK5m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=arnNQL1z; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D4B8145C;
	Tue, 12 May 2026 01:56:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778543803;
	bh=I5d+4K7h/aBDUFewAuRMs9MKDzFzwUrbqwk7QyJgHBE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=arnNQL1zsaigma594P+2QTqaJkNGWsYLBA7e12HKPv0qiX8A9ClS/gQr3syC5n/XD
	 8drXvDtsj+pzPJYOcmTTCxtjcaLoIvNjjSixhYqjgUa/i1d7C3fEAaazWogViW2mb7
	 xq8tujWeMWrn515320qsEwADsrxOAvK/oWFZ5apI=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 09/11] media: renesas: vsp1: Simplify iteration over format arrays
Date: Tue, 12 May 2026 02:56:33 +0300
Message-ID: <20260511235637.3468558-10-laurent.pinchart+renesas@ideasonboard.com>
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
X-Rspamd-Queue-Id: B62D4517A98
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61192-lists,linux-media=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:dkim]
X-Rspamd-Action: no action

Introduce a vsp1_for_each_format() macro to iterate over format arrays,
to improve readability. No functional change intended.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../media/platform/renesas/vsp1/vsp1_pipe.c   | 36 ++++++-------------
 1 file changed, 10 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
index f9c7c75a7ad0..7197f2917417 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
@@ -229,6 +229,10 @@ static const struct vsp1_format_info vsp1_video_hsit_formats[] = {
 	  1, { 32, 0, 0 }, false, false, 1, 1, false },
 };
 
+#define vsp1_for_each_format(info, formats) \
+	for (const struct vsp1_format_info *info = &formats[0]; \
+	     info < formats + ARRAY_SIZE(formats); ++info)
+
 /**
  * vsp1_get_format_info - Retrieve format information for a 4CC
  * @vsp1: the VSP1 device
@@ -240,30 +244,20 @@ static const struct vsp1_format_info vsp1_video_hsit_formats[] = {
 const struct vsp1_format_info *vsp1_get_format_info(struct vsp1_device *vsp1,
 						    u32 fourcc)
 {
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(vsp1_video_formats); ++i) {
-		const struct vsp1_format_info *info = &vsp1_video_formats[i];
-
+	vsp1_for_each_format(info, vsp1_video_formats) {
 		if (info->fourcc == fourcc)
 			return info;
 	}
 
 	if (vsp1->info->gen == 2) {
-		for (i = 0; i < ARRAY_SIZE(vsp1_video_gen2_formats); ++i) {
-			const struct vsp1_format_info *info =
-				&vsp1_video_gen2_formats[i];
-
+		vsp1_for_each_format(info, vsp1_video_gen2_formats) {
 			if (info->fourcc == fourcc)
 				return info;
 		}
 	}
 
 	if (vsp1_feature(vsp1, VSP1_HAS_HSIT)) {
-		for (i = 0; i < ARRAY_SIZE(vsp1_video_hsit_formats); ++i) {
-			const struct vsp1_format_info *info =
-				&vsp1_video_hsit_formats[i];
-
+		vsp1_for_each_format(info, vsp1_video_hsit_formats) {
 			if (info->fourcc == fourcc)
 				return info;
 		}
@@ -287,8 +281,6 @@ const struct vsp1_format_info *
 vsp1_get_format_info_by_index(struct vsp1_device *vsp1, unsigned int index,
 			      u32 code)
 {
-	unsigned int i;
-
 	if (!code) {
 		if (index < ARRAY_SIZE(vsp1_video_formats))
 			return &vsp1_video_formats[index];
@@ -308,9 +300,7 @@ vsp1_get_format_info_by_index(struct vsp1_device *vsp1, unsigned int index,
 		return NULL;
 	}
 
-	for (i = 0; i < ARRAY_SIZE(vsp1_video_formats); ++i) {
-		const struct vsp1_format_info *info = &vsp1_video_formats[i];
-
+	vsp1_for_each_format(info, vsp1_video_formats) {
 		if (info->mbus == code) {
 			if (!index)
 				return info;
@@ -319,10 +309,7 @@ vsp1_get_format_info_by_index(struct vsp1_device *vsp1, unsigned int index,
 	}
 
 	if (vsp1->info->gen == 2) {
-		for (i = 0; i < ARRAY_SIZE(vsp1_video_gen2_formats); ++i) {
-			const struct vsp1_format_info *info =
-				&vsp1_video_gen2_formats[i];
-
+		vsp1_for_each_format(info, vsp1_video_gen2_formats) {
 			if (info->mbus == code) {
 				if (!index)
 					return info;
@@ -332,10 +319,7 @@ vsp1_get_format_info_by_index(struct vsp1_device *vsp1, unsigned int index,
 	}
 
 	if (vsp1_feature(vsp1, VSP1_HAS_HSIT)) {
-		for (i = 0; i < ARRAY_SIZE(vsp1_video_hsit_formats); ++i) {
-			const struct vsp1_format_info *info =
-				&vsp1_video_hsit_formats[i];
-
+		vsp1_for_each_format(info, vsp1_video_hsit_formats) {
 			if (info->mbus == code) {
 				if (!index)
 					return info;
-- 
Regards,

Laurent Pinchart


