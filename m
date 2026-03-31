Return-Path: <linux-media+bounces-57768-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aP57CV6jy2kUJwYAu9opvQ
	(envelope-from <linux-media+bounces-57768-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:35:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B8236810E
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 271BD303E20F
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 10:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 839C73ED128;
	Tue, 31 Mar 2026 10:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="I/ugPnnv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCBE3EDAC6;
	Tue, 31 Mar 2026 10:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774952885; cv=none; b=IhO3oA2ta8TdTgN6qIurVvOrfula37cwz5V2AU3gg36mYTTWz/4ng3hJnaxEpXxe3GR3hPlDFeO6ykGf3T7WhNwkwNTheqFS79VEAZc7R18WkqTT3vH4vcIJtHNR3XVij0zISDCPVVChXyzRmR7xb7PFpowJ63UW4CAJEyW7Ex0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774952885; c=relaxed/simple;
	bh=kX+ISnjO+wiRcsff0j8EClx9Y2S6Wmthb5WFQGtIgdw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bL2jDBao+zUNbfSTG1zQLNGbO7CTcwvM6IlHodbrGuOg2tDRrBMYITRLcazJnlygr/lOGO+fYI5divEL+e8wjbXO6Hrwn/saE2vGkFg37BqgvnsB6ygB9d/gDyEWZDKmspWlORcx3KKUPeanzSQ6yfjsLXLTTVPyOuob8ttR4yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=I/ugPnnv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [100.93.44.16] (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 575C920FF;
	Tue, 31 Mar 2026 12:26:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774952795;
	bh=kX+ISnjO+wiRcsff0j8EClx9Y2S6Wmthb5WFQGtIgdw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I/ugPnnvyn3obu7jouJ8xZW9xevFXuM+iTh23PUstfm18TRHrQDNKYacqfZ0wnKJH
	 UCgmJun0TXryDZpEeVF8s6deW7pVAkgZmVOBaRXKTP4WsaXLH7ZI3/8wQ3sHgRKG82
	 eylSsNV4xwFu/8ESgQgx+u9ahI2wA5Xp6g7ryOH8=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 31 Mar 2026 12:27:35 +0200
Subject: [PATCH v2 05/15] media: rzg2l-cru: Remove locking from start/stop
 routines
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-b4-cru-rework-v2-5-f94b238b35d4@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2737;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=Uuk7lcfbtpAjlHBBE22CWr+cqDkZ2gR9YusOOZ7JHJI=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBpy6GoQXJDm0RclbCA5qOpLwStSDFm6ehex9c1A
 kQyDm+Lg3iJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCacuhqAAKCRByNAaPFqFW
 PDTTD/0Vk6wvKhqXOr1t1tX1tMaFOrZbNLdbV0VPcwsirtx7SQm9tFbS+EA4WZ88X2RQAx6b2An
 JthOobUc+VVOAb+t3ceT4ue4AYGqsDAjrKUfSxVtb2ARiPG+urXaCCxglOCufjTBsblTz4zmBAs
 3gxKrA6DiZjuYeOvZ7yNOH68oXnffPhBk0uFX1vOAy6jBYczlE+gPfcqLCGodcjLra8hpe4j8WR
 khe7Kj9xGQj1PkbVwd4PworPQjmDyExLbKi36cmFiIKI4eIVZ14oivHrfXO8IzyhjMca2b31Yq6
 x8dMtmAemnGBsBCea2n9MT961L192DDeW19SPUSHKos+d77kl1VCVKxLxkUEAbFWpfB7QKgudJj
 /UW1VWT6/Mrw3jdBUBNBEu6FRbf0urUcDpxxFdTwOsyOGOU0kU5jR+nFz+3EQlBdRR1wKXaNGz1
 zM/k8zKnhk5aJFB95LjKLWHsFm07jTYGMHHQiMrMbYkxQcxeO+35CfzKyK93Aiye0dlu6rs9v3S
 UvqUBVO+BHvEp9Lkbq0aaGF5RgToo9y4R7DGbnn4WEHw5j1aO8tj2XSzXpbDX+xRDGoeruns5PX
 0npmYyIfxAR5Wn+DlPDj9nhKu4dHtnoFafT1nnlFALKRgVuld91UwfwbDgJSR1LzE8lNfN71Eg7
 f8RtM8ueb/NRMYg==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57768-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: B7B8236810E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

The start/stop streaming routines do not need to lock the whole function
body against possible concurrent accesses to the CRU buffers or hardware
registers.

The stop function starts by disabling interrupts, and only this portion
needs to be protected not to race against a possible IRQ.

Once interrupts are disabled, nothing in the video device driver can race
and once the peripheral has been disabled we can release all pending
buffers.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 75928b0f48be..96c71f1357f8 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -340,23 +340,19 @@ bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru)
 void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
 {
 	unsigned int retries = 0;
-	unsigned long flags;
 	u32 icnms;
 
-	spin_lock_irqsave(&cru->qlock, flags);
-
-	/* Disable and clear the interrupt */
-	cru->info->disable_interrupts(cru);
+	scoped_guard(spinlock_irq, &cru->qlock) {
+		/* Disable and clear the interrupt */
+		cru->info->disable_interrupts(cru);
+	}
 
 	/* Stop the operation of image conversion */
 	rzg2l_cru_write(cru, ICnEN, 0);
 
 	/* Wait for streaming to stop */
-	while ((rzg2l_cru_read(cru, ICnMS) & ICnMS_IA) && retries++ < RZG2L_RETRIES) {
-		spin_unlock_irqrestore(&cru->qlock, flags);
+	while ((rzg2l_cru_read(cru, ICnMS) & ICnMS_IA) && retries++ < RZG2L_RETRIES)
 		msleep(RZG2L_TIMEOUT_MS);
-		spin_lock_irqsave(&cru->qlock, flags);
-	}
 
 	icnms = rzg2l_cru_read(cru, ICnMS) & ICnMS_IA;
 	if (icnms)
@@ -400,8 +396,6 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
 
 	/* Resets the image processing module */
 	rzg2l_cru_write(cru, CRUnRST, 0);
-
-	spin_unlock_irqrestore(&cru->qlock, flags);
 }
 
 static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
@@ -469,8 +463,6 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 	csi_vc = ret;
 	cru->svc_channel = csi_vc;
 
-	guard(spinlock_irqsave)(&cru->qlock);
-
 	/* Select a video input */
 	rzg2l_cru_write(cru, CRUnCTRL, CRUnCTRL_VINSEL(0));
 

-- 
2.53.0


