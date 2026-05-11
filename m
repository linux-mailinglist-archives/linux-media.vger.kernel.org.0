Return-Path: <linux-media+bounces-61133-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCNROj/pAWohmQEAu9opvQ
	(envelope-from <linux-media+bounces-61133-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 16:35:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBC351043D
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 16:35:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 647623062D89
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 14:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CF063FE35C;
	Mon, 11 May 2026 14:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="K2uSfrlm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECEA3FE372;
	Mon, 11 May 2026 14:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778509979; cv=none; b=Mz1q6rDOiWCwXxxBuHwijihIeQ6siRvwU4vuI6og1QQEiBJYjt4pNny1D9DBpcis9zwdLIGmFO/zLorC4z/C3vwRseehFV+2YYRWNFZyAcjFlvJZc688EA1mqYQ3UXunfXmYY6kfyNyBvOMfZhYZWCat4baTnVEpP0/4TeIu+Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778509979; c=relaxed/simple;
	bh=Gc1QV4QHGnRLMYxcgyfUg4GUnrd3P27efU/EAKqHBDI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OQvxZBfbH+eqZBIPTKQjH9BaZ/2YFsDD/3s1yWr3ZK4vRvShHicJqmYYqRIDsIuYyNcsNg+gFP+//zNT9yrFYDs9FsIkx5ogwD9mlyeb16Gu8/d3mgAN4xVeTUV9fgeeMkI+MKOcRkAD+y88qJ3yPAaxdPdKUGNyznCo7w0yRek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=K2uSfrlm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-109-113-28-211.net.vodafone.it [109.113.28.211])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2CECC9D1;
	Mon, 11 May 2026 16:32:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778509969;
	bh=Gc1QV4QHGnRLMYxcgyfUg4GUnrd3P27efU/EAKqHBDI=;
	h=From:To:Cc:Subject:Date:From;
	b=K2uSfrlmRAvsRqkRIpB/iCLQYiecn8MAyogo0cJWnfJmoT+h//K8lcU9a7nBHvil6
	 pNqjXfgwvUra0X9LtCjfWUGr506HDunl267w84QM/s5bvYdueMM9xRTTx47uGhUTaQ
	 ftTtZRF98u+PyLnxP/SsZdHE8H3NI4C1+wvxHQ6U=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH] media: rzv2h-ivc: Add myself as co-maintainer
Date: Mon, 11 May 2026 16:32:38 +0200
Message-ID: <20260511143239.136253-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8EBC351043D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61133-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add myself as co-maintainer of the RZ/V2H(P) IVC block.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 81d53481d3f7..f2be8f02dffb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22751,6 +22751,7 @@ F:	drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c

 RENESAS RZ/V2H(P) INPUT VIDEO CONTROL BLOCK DRIVER
 M:	Daniel Scally <dan.scally@ideasonboard.com>
+M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml
--
2.53.0


