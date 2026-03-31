Return-Path: <linux-media+bounces-57778-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gC6jCC6ky2mTJwYAu9opvQ
	(envelope-from <linux-media+bounces-57778-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:38:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C02E3681E4
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:38:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13ADB3063D45
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 10:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 766933F8DF3;
	Tue, 31 Mar 2026 10:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uGHuLUkK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B354F3F87FA;
	Tue, 31 Mar 2026 10:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774952899; cv=none; b=LLN8usN+Wj5u0YgayuetVTkC98+O+yrC6uyNW1Qefj64/EFdRQEY6YIDsi7WwW48+X6vQQYq1MmlnoVBX5K4qB1Nhf7UpCx/8oej3tjbDlZLhcsCOe7w9ahqB34m+LKezTXFIDuMbSKtTAi2LufRxl0uSb040gCcCa+LOZIOxdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774952899; c=relaxed/simple;
	bh=B7Z0qz1KWQYocWsu5+Ifr/zBqKWMWpNbiEUfrqDJ1y0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HMWij8hgVOHJOCaNGCefxWkQJyxa2jX0Wq0pknzMEIMlEGz4fX7HGrtpdyGR9CfAvh//eOKih4SCnsFAWcjCo504qhRcV902eiGXufa4Tn/QHdDC/f/JsnihTWVo4oufkw3AHYDO2/HH/kvlRpk6VDjfshJsrWqbCSXx3m4YXfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uGHuLUkK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [100.93.44.16] (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 86FEC1E5A;
	Tue, 31 Mar 2026 12:26:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774952803;
	bh=B7Z0qz1KWQYocWsu5+Ifr/zBqKWMWpNbiEUfrqDJ1y0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uGHuLUkKxTsTnGtpiiYF1BWIvURXijGXYVPjpChmh3J2a4oybz+s26EIj6RGUI9qH
	 Q4zIj53OdP2fcqKtH/juUbN0+o6ZjtDuH1Kg5xQ0zd4qbiOR7RfzlZvWaY1qNrc5Uo
	 SBAVvZL/iXoDwX/k705wYK2KlSDiAjmLKkfPzVcc=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 31 Mar 2026 12:27:45 +0200
Subject: [PATCH v2 15/15] media: rzg2l-cru: Simplify irq return value
 handling
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-b4-cru-rework-v2-15-f94b238b35d4@ideasonboard.com>
References: <20260331-b4-cru-rework-v2-0-f94b238b35d4@ideasonboard.com>
In-Reply-To: <20260331-b4-cru-rework-v2-0-f94b238b35d4@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
 =?utf-8?q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1486;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=gRFkpLLIbDTTNqHG9UI0gnxHk9cmv8yF4XICpOXdbIg=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBpy6GptX0NXeWwkVsBdoPnNxbbQihNQVJ2k/bNd
 ocdYo15KGaJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCacuhqQAKCRByNAaPFqFW
 PHF9D/9EG/1bQHgZrFVDNvKZA5OJlGK/QvlYAQziYV+ZWqXQ5QYLObYxht8QPLC4Pd6flhQjG/e
 cJxcNXfm9fHZv5tkOzZG9GaFgKR8sh6TbhUBYrB6vZyPk1ICMpB44WNRHDNhRSawwCl7UditUW5
 S3ld2ExZW5oEqNO37TFmsGWF6VnTN06PVBqbvl3W0f2WPJFZMgAZ+tu1KvY3TrTLZtawuj50xgc
 N8TUGbMLqS6m8f0kCkcAa9yZjw/wB9Wtjfv+QNV8nhp4vClw9+dJsq4GUVwCo5zKBNwbYsLMHxR
 FkryAnKi70dfvrKO+M64BxWrg9LaqrOUiONuvIJV4opes8zFtIxw8i6Y7Do7JeARAHS6bJ4bTYm
 o8h4dqq6tdrFo545P7O1U+dylKNTWX1PglnhsTSPgpsgatoeJ7lHNWC3xcDtZKG+3kmdHReZacs
 rzg2rhKDnZhVu02vpQYw/wBpAyQefOCKki4fdgEoIW0ImcLLFZfm226EBPTXBTJFs0Yg6rsAEzb
 Yv1ep0O5oGFUfhwT1N8iy1uNspnWCsc++ALE594DgHNQP5KzkScbMTbKn/cIHiWbGm7GHSVg82r
 akmmM70EHnVKLXyeR8724T8AFt/bL92otYPSOZWtpUZ/Kq6+7sp9ijL0JbRPsJJqJsNMNTsK5ks
 B83MFJxzcL2i0Mw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57778-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,protonmail.com,bp.renesas.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 6C02E3681E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

The rzg2l_cru_irq() irq handler uses a local variable to store the
handler return value.

Simplify it by using IRQ_NONE and IRQ_HANDLED.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index e2073cc1afc6..3390e08cd868 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -591,16 +591,13 @@ static void rzg2l_cru_stop_streaming(struct rzg2l_cru_dev *cru)
 irqreturn_t rzg2l_cru_irq(int irq, void *data)
 {
 	struct rzg2l_cru_dev *cru = data;
-	unsigned int handled = 0;
 	u32 irq_status;
 	u32 amnmbs;
 	int slot;
 
 	irq_status = rzg2l_cru_read(cru, CRUnINTS);
 	if (!irq_status)
-		return IRQ_RETVAL(handled);
-
-	handled = 1;
+		return IRQ_NONE;
 
 	rzg2l_cru_write(cru, CRUnINTS, rzg2l_cru_read(cru, CRUnINTS));
 
@@ -634,7 +631,7 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
 	/* Prepare for next frame */
 	rzg2l_cru_fill_hw_slot(cru, slot);
 
-	return IRQ_RETVAL(handled);
+	return IRQ_HANDLED;
 }
 
 irqreturn_t rzg3e_cru_irq(int irq, void *data)

-- 
2.53.0


