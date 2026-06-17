Return-Path: <linux-media+bounces-65105-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mDfEBwONMmrA1wUAu9opvQ
	(envelope-from <linux-media+bounces-65105-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 14:03:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C08A69971E
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 14:03:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=stAN+czd;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65105-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65105-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5463331621E9
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 11:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDBA1396565;
	Wed, 17 Jun 2026 11:56:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEDB3F0777;
	Wed, 17 Jun 2026 11:56:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781697365; cv=none; b=X09ulTd66tXZetCnZbc8emm3jihkIidcb6s3HA48pDHHsZ6gx2v0F2soyWjiRXfaCX8zgRoVWafO9D6gFH8FJ9qN4CLNMMPd7ImWj99SJxLJP4O7KGdBNCg187OlFujRzjYjLPLRPqCQpAwqNOVO9skz/xxJMo9RtcQO71I0GyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781697365; c=relaxed/simple;
	bh=TQpu4ZDSe8o6iU2aimqX4sqTDMPQM2QGuVyZ2YPewCk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dnpQgWQQt4W44sogsKv6S3WAnj5p9JrjQ3lrzjKYH20qrAY791CsD9xyPOzmT0rNitjNdhpRZVM8IbS5YrLPqausMQjTZ6CQ8cS3J+3eafDM4MuHFefIkI5HFQYePMAdyxFE5mnL2KbLwg96k/O938udPwjTw7xVQvzROj/diBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=stAN+czd; arc=none smtp.client-ip=213.167.242.64
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 60D9A664;
	Wed, 17 Jun 2026 13:55:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781697318;
	bh=TQpu4ZDSe8o6iU2aimqX4sqTDMPQM2QGuVyZ2YPewCk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=stAN+czdJofimo4QLtFOFcc10yCEfdEJCzgH/1Q1aiKlcG7qttKUGOQIkk9deaNJP
	 0EGcWOYcvT/LAA0PopbEdGQVnjICEdTyCZGYeFPCR55tjr2u030hDAivrQf1g73fgY
	 3/2ZkzTyGjpBBP7G0McK5GlvJ8SoBaMw2zPmWvtw=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 17 Jun 2026 14:54:54 +0300
Subject: [PATCH v6 01/11] media: rcar-vin: Fix comment related to stride
 handling
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-rcar-streams-v6-1-1260eb72dff7@ideasonboard.com>
References: <20260617-rcar-streams-v6-0-1260eb72dff7@ideasonboard.com>
In-Reply-To: <20260617-rcar-streams-v6-0-1260eb72dff7@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1033;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=TQpu4ZDSe8o6iU2aimqX4sqTDMPQM2QGuVyZ2YPewCk=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqMotDIdYZJdjnamP4uo8u0YiJvpkcCKjPlJcna
 lmnzZDCP0WJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCajKLQwAKCRD6PaqMvJYe
 9b8ND/9BrO/14zJcxA0f4UyvxTrTZVYQI1f4rIYelwaTKOY63M4ZiptFiTLvEKunUPQdkh6wIOP
 JEd/oayedBpC/rtDimdCNFaOy8WEW6KKBHKV54KvxLx2arV51ExGopLX+BdO7/cJppyftwJndEk
 q0OjRBBkJnk2Ps/SEDTyhpjSXHHfMawu+dX/dT7yF2GFZwYckN6NMSIj8TMH51cjQJtUPekDcey
 w8e4YOokzgXoqeXDQPt2qr4N4IkyxakDHbc0v7Y708FHzkdpQFBKW9iLRC0/nEXh+l+ZqdQUuX0
 ySVryDFWaC7FQwe+3C9LsLXiwd1soU6BoCYVTqMHaKYWaOcL3+AI+ty2fiEARHP+43zYreWEays
 tjXl+ZFXQROeRB9musYzllgGz1cdHdQ44hIeCRf7GzkiQ7TvdQ6oPL896hYFn+i6Fnf7/pDClMP
 U5zcxwJ+KW+y+RpP8Iu5XkMhZSQiBHyZGS2LuLkDKJ7pRRi1LBbh8K6Xq9xlknsCo+SoFJnovK+
 vBq6KmTiM5xN+RvSg4ZCzWQjynNSPFGDpyN8XuALLWdPlDdve2Fo7YfpouTriHbBIE0qtN+ydHm
 OpKkMkKhsq/3uDUwwzQM40dXT8/gOpUu7r/0E0ugjOiVfKD2PLdtSwyYEmjVrZbCXuWiXuL9zhc
 JMdEL0cQrJ9DRuQ==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65105-lists,linux-media=lfdr.de,renesas];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:niklas.soderlund@ragnatech.se,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:mchehab+huawei@kernel.org,m:laurent.pinchart@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:tomi.valkeinen+renesas@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-media,renesas,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6C08A69971E

The comment says the stride has to be aligned to 16 bytes, but it should
be 16 pixels, as VNIS_REG register is in pixels.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Fixes: 40c6da8a9c0f ("media: renesas: vin: Fix RAW8 (again)")
---
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index f9af9177e02f..d6c69c674d57 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -678,7 +678,7 @@ void rvin_crop_scale_comp(struct rvin_dev *vin)
 
 	/*
 	 * VNIS_REG has four lowest bits always 0, i.e. the stride has to be
-	 * aligned to 16 bytes. This is done in rvin_format_bytesperline().
+	 * aligned to 16 pixels. This is done in rvin_format_bytesperline().
 	 */
 
 	fmt = rvin_format_from_pixel(vin, vin->format.pixelformat);

-- 
2.43.0


