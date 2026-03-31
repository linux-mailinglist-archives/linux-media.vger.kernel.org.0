Return-Path: <linux-media+bounces-57745-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKOmJn+Ly2kuIwYAu9opvQ
	(envelope-from <linux-media+bounces-57745-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 10:53:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4733667B0
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 10:53:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 472EB3013FF5
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 08:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4344B3E8C63;
	Tue, 31 Mar 2026 08:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="zjIN2Usd"
X-Original-To: linux-media@vger.kernel.org
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1327037997E;
	Tue, 31 Mar 2026 08:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.119.170.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774946632; cv=none; b=edu/I8KhUT7aRSuGZvwCMo8GFxLMnBe+H5sHIZqkHmGsnYziy7B4KYKb/M/57+FHisFlMLHTww7u1GjXWVRqH/CPPlb3tx1NpCvBOrN0Owq5p5b/p4kzq+s0S1GY22eEI3h6IgKG/KdX6VLZaYSym2jgWJIiVrEjV3JnFdjQNaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774946632; c=relaxed/simple;
	bh=gyel+Qs8o9xQG7pO5jw3XcolPOkXMIylFo1LvEqkiHw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ncFJognyBmZse4II0QXMWdzEceYuSKebth7zbHktq/HvOd0m9N8rAieka9CB2rkCtd+JLByE7vOmQHVyrUe2wHWereJYbNgjLu5s9jU2PcJ2Jn/umPkGyc4jf1y/kzyP1N7kP6plxIQcc7SRoCVzt3AI9aZivDmhJrxm7PtEhrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net; spf=pass smtp.mailfrom=crapouillou.net; dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b=zjIN2Usd; arc=none smtp.client-ip=185.119.170.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crapouillou.net;
	s=mail; t=1774946628;
	bh=gyel+Qs8o9xQG7pO5jw3XcolPOkXMIylFo1LvEqkiHw=;
	h=From:To:Cc:Subject:Date:From;
	b=zjIN2Usdjm3THZUIFWcIDrn7GenkSCB2qeVjHkoR0LbJtW+xu1TU+rM3AQSwdRGe+
	 2FaLiSg6l2R8hvbLUIYQVVOAojw8JY8Juns5DlJvn7vY4M3f8GZraDBNzd13bo1zLw
	 mumo07mugJae/bYTfxcXxW052QqUOXoCCWU94Yek=
From: Paul Cercueil <paul@crapouillou.net>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3] media: v4l2-common: Always register clock with device-specific name
Date: Tue, 31 Mar 2026 10:43:40 +0200
Message-ID: <20260331084340.67613-1-paul@crapouillou.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[crapouillou.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[crapouillou.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57745-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paul@crapouillou.net,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[crapouillou.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,crapouillou.net:dkim,crapouillou.net:email,crapouillou.net:mid]
X-Rspamd-Queue-Id: 8D4733667B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

If we need to register a dummy fixed-frequency clock, always register it
using a device-specific name.

This supports the use case where a system has two of the same sensor,
meaning two instances of the same driver, which previously both tried
(and failed) to create a clock with the same name.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: include requested clock id in fixed clock name
    
    v3: support NULL clock id

 drivers/media/v4l2-core/v4l2-common.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 554c591e1113..0f9c78cfc6ed 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -792,14 +792,15 @@ struct clk *__devm_v4l2_sensor_clk_get(struct device *dev, const char *id,
 	if (ret)
 		return ERR_PTR(ret == -EINVAL ? -EPROBE_DEFER : ret);
 
-	if (!id) {
+	if (id)
+		clk_id = kasprintf(GFP_KERNEL, "clk-%s-%s", dev_name(dev), id);
+	else
 		clk_id = kasprintf(GFP_KERNEL, "clk-%s", dev_name(dev));
-		if (!clk_id)
-			return ERR_PTR(-ENOMEM);
-		id = clk_id;
-	}
 
-	clk_hw = devm_clk_hw_register_fixed_rate(dev, id, NULL, 0, rate);
+	if (!clk_id)
+		return ERR_PTR(-ENOMEM);
+
+	clk_hw = devm_clk_hw_register_fixed_rate(dev, clk_id, NULL, 0, rate);
 	if (IS_ERR(clk_hw))
 		return ERR_CAST(clk_hw);
 
-- 
2.53.0


