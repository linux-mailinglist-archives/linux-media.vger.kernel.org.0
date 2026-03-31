Return-Path: <linux-media+bounces-57770-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFtMCXSjy2kUJwYAu9opvQ
	(envelope-from <linux-media+bounces-57770-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:35:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE9F36811C
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:35:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B84CC3166632
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 10:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23F6C3F210D;
	Tue, 31 Mar 2026 10:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bK1y72IS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518793EE1D1;
	Tue, 31 Mar 2026 10:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774952887; cv=none; b=Qz+VGJogfwt35/LwzD2y9imxoM6u+TjqMQ1n1JOUOQu/ig1ltjnnisNPyn5SnfcpkFKjVYAYr1EF2skFZTbc0WBGW8rOq+LispYw1kRQ5QFbQNP9hAeNeTWB6nszJRKjLFWfYngSq1mQe2bLNifyyIJtFDEJe7BODqGaJacRYdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774952887; c=relaxed/simple;
	bh=7xuKiQfXgTPjE0z6KBnOmpGIap5q6NxAqZ9TNd1vHNw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OWn/dgisaOv9kY2u1M8PhnGtCgif8WDTAfdLTyU+/BOvUUHdT3AdO4D+BdiuLCUj/qUlvQBKEDi6D1voO8wCKH/qlLWlJlr+j1+GIptwcnh3ERmTHzIBm//VPKwaTaELfPm3Po4VY70UpiF/a8wpyWtO/D7AUiRuRGHbcv/yhy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bK1y72IS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [100.93.44.16] (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C07E02443;
	Tue, 31 Mar 2026 12:26:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774952797;
	bh=7xuKiQfXgTPjE0z6KBnOmpGIap5q6NxAqZ9TNd1vHNw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bK1y72ISKaf1pWU3htcoO/gM6YlhE39gVVB6lPO/ybrFmOIDLqyikCKIkjL1M24Va
	 uHkZpw7568rBe5TAnRLjwfA4NNM6AZ/XMKcVp6xFEkp/AvUgiGzU8YS7Koah+yT9lT
	 cmtGw3nBnrl8orULjEkVRwdaE3QwPCsWxWhXlc70=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 31 Mar 2026 12:27:37 +0200
Subject: [PATCH v2 07/15] media: rzg2l-cru: Remove wrong locking comment
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-b4-cru-rework-v2-7-f94b238b35d4@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1175;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=WM8nzRvMFvdAOBZqJ2Wu99CcuFTnda0NCrG8kZ6B910=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBpy6GorJPaxmqAK48G/uBgZ0RyclnOZnqPt9J3K
 OEVtIOAO1yJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCacuhqAAKCRByNAaPFqFW
 PIP0D/0cHo03v40wijyVWDV6xfJHMQfJ0tqSVPC0YFCd2hgMPFeSA7Lxmu6wa1/Ug7yuSLW3iuS
 hnMsgwnwy+o+tR1sogBje7A4V8ANrWRd9PC4pZehd81xUs3U+Xs8GIbpPVtZsHm8axCe7IeMK4g
 LNpZ+14M+5FvnxwI9KxknQQPMjIgc45VeCrS/Rjf7yNLz77lqsO3K3grJOO9+uwC6/5ltp28V0g
 UfdjjIW6OXVTjSV1De9fev+L2Et1z7ud8cSIiZmqGeMVn9gfVxT8qTx8yqomjupNCA8ii7it03w
 A4eYgIgNBUwPIrHo2gv7ECEdhem4SvUQpsRBbA811md4NfeHCq2eBJVJneqDoUne2nOiOG/KRBL
 wMQl8C+aAgt7quF+kR2+lidqv4Lu+IHC5tE9P22jEtcQy52OF+lmFxPWJ8dtfK3AYnGIPQf5w9X
 6QC0WREyRrUePGvCOzqueYMyBy+XK3Mo5Xwg2G3prtxcZyHkDlRYi0DHzZs0d2uYLR57e0N6rNW
 fvFujf/q+6L3BLghnLVTrlQ39uIVaT/qMLwy6CSF/9daHUJqSGgor5j9I8FQ4MeUa6vFbJDJ3BM
 028XGtewsZ8mOACJ6R40+dM7I9m2QxoL7h7+3kT2pXr+F2tTRSp3egVCIWGF5zXuIT5qLHgmXR4
 yM39XrtG+yEpQ/Q==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57770-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 9FE9F36811C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

A function documented as "need to hold qlock before calling" actually
takes the lock itself.

Drop the comment and prepare to replace it with proper annotations where
appropriate.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index b2d1b6a4aaaa..c49131587679 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -105,7 +105,6 @@ __rzg2l_cru_read_constant(struct rzg2l_cru_dev *cru, u32 offset)
 	 __rzg2l_cru_read_constant(cru, offset) : \
 	 __rzg2l_cru_read(cru, offset))
 
-/* Need to hold qlock before calling */
 static void return_unused_buffers(struct rzg2l_cru_dev *cru,
 				  enum vb2_buffer_state state)
 {

-- 
2.53.0


