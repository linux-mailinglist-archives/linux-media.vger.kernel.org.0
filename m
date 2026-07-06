Return-Path: <linux-media+bounces-66701-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id inzJJsFfS2pjQQEAu9opvQ
	(envelope-from <linux-media+bounces-66701-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 09:56:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A4770DD40
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 09:56:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=cn2OSR+w;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66701-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-66701-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6348F31C8D79
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 07:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C3753F4DDD;
	Mon,  6 Jul 2026 07:00:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EC23BE15D;
	Mon,  6 Jul 2026 06:59:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783321204; cv=none; b=UWJE+OQ0NtsXW/RXZPxG0jOjf7wDNAnq4HS9xrB4Z3B3VwcVMVbrcZ0dZl+lpDHWv2zOXETikmyhBLID2NEGtySr1SdQOYhDsX4GbgUPbeJeu2jsfKFcomlRs3RfEnBJCedrCDMvNH7zkTEirEmrTiJbyHXYnfcoyx6LnroOs5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783321204; c=relaxed/simple;
	bh=jwL0g5dH7njtzSsEwuD5XFbdRBMtwYqheZmzk9XFmHU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=krethcX+Isn8rjKo9dqvr4eu44fYlfcDXHCuksfDOyaEVVVzHVM9vkMHZiY0YorHWfH9ZZPQx4i0mJ4rXhjommXsXAIGt2Ywvd4EDjNy0EuiaEq1DIR6LKXzpejc2Yz9m3JdJH+3tHSz2NnpfpjmwwqzrGia7+cPIEDirpEooJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cn2OSR+w; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 688A61F000E9;
	Mon,  6 Jul 2026 06:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783321196;
	bh=f0esyvSou6XOjJdnHtKHcqUSq5aX2adAFR6jn3DxN+w=;
	h=From:To:Cc:Subject:Date;
	b=cn2OSR+wY+H9AjbL+MoRf7GMKGr0OKdSdK+RmhcSHvidP80vP1BMprRheDi4J0Asv
	 uEtsljRrCMjYbl3ROwchBrWXWP37/+41GV7QGw+EbTjW0x6mt/ccTfia+PUO2VFlSq
	 KwzGdYXOfT/qbU1WrqcW7Eoff/ER2/9K9r1dLN2xn3+fDqbGirxi9z39MgD7/4OEr4
	 Y3uyfn/zYA6O5kIcKb56aMOvJsGxDsgq08l6wSm/MXpvR2D8hxA/e/DcStKO8823r5
	 Rgst78jQYpiVNL8A/Zg6YlLJy04CBngptYjPr2C0xcj4BTxsoZUmW0Hl8K/DNuiZbq
	 F4o2Ts0hqYy+g==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wgdJ4-00000001dMX-0vbh;
	Mon, 06 Jul 2026 08:59:54 +0200
From: Johan Hovold <johan@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org,
	Moudy Ho <moudy.ho@mediatek.com>
Subject: [PATCH] media: platform: mtk-mdp3: fix NULL deref on failed SCP lookup
Date: Mon,  6 Jul 2026 08:59:27 +0200
Message-ID: <20260706065927.389604-1-johan@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,collabora.com,vger.kernel.org,lists.infradead.org,kernel.org,mediatek.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:lgs201920130244@gmail.com,m:linux-media@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:johan@kernel.org,m:stable@vger.kernel.org,m:moudy.ho@mediatek.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	URIBL_MULTI_FAIL(0.00)[mediatek.com:server fail,sto.lore.kernel.org:server fail,vger.kernel.org:server fail];
	FORGED_SENDER(0.00)[johan@kernel.org,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-66701-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mediatek.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 38A4770DD40

Add the missing sanity check after looking up the SCP to avoid
dereferencing a NULL-pointer in case its driver has not yet been bound.

Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
Cc: stable@vger.kernel.org	# 6.1
Cc: Moudy Ho <moudy.ho@mediatek.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---

This one applies on top of Guangshuo's fix:

	https://lore.kernel.org/r/20260704173119.254975-1-lgs201920130244@gmail.com

Johan


 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index 121b1006ffdc..f412aadb5996 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -296,6 +296,11 @@ static int mdp_probe(struct platform_device *pdev)
 		mdp->scp = platform_get_drvdata(mm_pdev);
 	}
 
+	if (!mdp->scp) {
+		ret = -EPROBE_DEFER;
+		goto err_destroy_clock_wq;
+	}
+
 	mdp->rproc_handle = scp_get_rproc(mdp->scp);
 	dev_dbg(&pdev->dev, "MDP rproc_handle: %p", mdp->rproc_handle);
 
-- 
2.54.0


