Return-Path: <linux-media+bounces-67525-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QlPWDulZVWoHnQAAu9opvQ
	(envelope-from <linux-media+bounces-67525-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 23:34:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9AA74F47E
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 23:34:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mess.org header.s=2020 header.b=FNbRC4gB;
	dkim=pass header.d=mess.org header.s=2020 header.b=tk+Uuiz7;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67525-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67525-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=mess.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB784313B876
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 21:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A71369D6D;
	Mon, 13 Jul 2026 21:31:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9D33630B2;
	Mon, 13 Jul 2026 21:31:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783978296; cv=none; b=Avo1kIwStVNETU9nKc+joyEzSxu0YCq3wVZF6y0KvfR/A5XvT1IHsCnXc8sVDijwMmPfn4suYNOMKF0+XxfT8Sr5H2weAObe8WsuRfl0vVJ/rX18CEeuxkN+IMotb9+xp4khciB7d7afgiYDsA86DGZwch4mLcOIKLuyvQpTjJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783978296; c=relaxed/simple;
	bh=PFYYQhVg4NRarAQ81g5gFeRQ3Pkd+XUXZYeUxj9P9Kk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=axCw+mlVt+NifdfVUoIOC5NxA5PxFeXH34fRrlH9HV20JgA4wjJJpDqQxBLfGNvPETW+E7Ld1EJ58J1l7mqME4hroCCDC2xaLpxEnFI6lCxwaJtIDThfd9BggwimmC+gBk48hG2zI1g/6S0CZsppU4kdTivBf9PshSojBbWwF4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=FNbRC4gB; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=tk+Uuiz7; arc=none smtp.client-ip=92.243.27.206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783978285; bh=PFYYQhVg4NRarAQ81g5gFeRQ3Pkd+XUXZYeUxj9P9Kk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FNbRC4gB+SpWMGW8ztCekBfJlfqz/+8jkaE/JIF0M3HML2U5xHhmiP+MO8lCGXfus
	 b7+4obJeouYqeRt4/behFBvhLx2CseixLojP9NtyIoMqyISsUY+9YZ4akcDGJ8k6dl
	 cBocm+0q9tQVstwxIAfUPHMpSNqgjVCHEyW6/gSimX7v16UIUtbwIcb+8wDa6HBaO7
	 EywYz9jak7YxPmjZwoO5FVXmqXm0dbIBjZL29Sxp+vZmUHNtxZuxCfwRIrdYRZiEmO
	 AYfOl2AEVlVWOFZ/eZsmJ9BLpmUlxlXwfe+0UbbfAPDSzdSYLyIn1t2wbIJmSYNqLr
	 bLo2SnKLnt5Xw==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 129D341E9F; Mon, 13 Jul 2026 22:31:25 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783978284; bh=PFYYQhVg4NRarAQ81g5gFeRQ3Pkd+XUXZYeUxj9P9Kk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tk+Uuiz7dx6b0K76rO+IqBr7UYSiJuIM3z/Nm1TLA1YJECFKTxPulnLmu6f3PWM98
	 d38LYkaWefQXGkU15JYrHREz1+XE2OJYiqVzitLuI8qMJfvjxVsjK2+pPYAdbUTEFv
	 oPSeMjTTtMUUs+xCkBRuQyAHP3d2gkuB/7/FWJPWxVmwyXX7qQf/XuZZjH7KW12ekS
	 DXPghBtGhMJEPhtdp1xfU4nSaitT5urfWLpvwrLFB0F5ooN+aELeVveuJT29CdlLcn
	 YOHuMYcSP/7L7ox8/ZAe4FVPJDpqae82Lgc+LzekMTunD0O33RAdYuBxGmep8cw3Jg
	 W7VfVBwzgYrpA==
Received: from maru.home (host86-148-148-68.range86-148.btcentralplus.com [86.148.148.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id D531040155;
	Mon, 13 Jul 2026 22:31:23 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/11] media: sunxi-cir: Ensure no more interrupts can occur before free
Date: Mon, 13 Jul 2026 22:31:00 +0100
Message-ID: <397628f5644f6488f111a3a3ee07d00ce01a13b0.1783977550.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1783977550.git.sean@mess.org>
References: <cover.1783977550.git.sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mess.org,none];
	R_DKIM_ALLOW(-0.20)[mess.org:s=2020];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:sean@mess.org,m:mchehab@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:patrice.chotard@foss.st.com,m:hverkuil+cisco@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sean@mess.org,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67525-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[vger.kernel.org,mess.org,kernel.org,gmail.com,sholland.org,foss.st.com];
	DKIM_TRACE(0.00)[mess.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sean@mess.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mess.org:from_mime,mess.org:mid,mess.org:email,mess.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8C9AA74F47E

Only call rc_free_device() once the hardware has been stopped.

Fixes: dccc0c3ddf8f ("media: rc: fix race between unregister and urb/irq callbacks")
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/sunxi-cir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index 28e840a7e5b8..af1ee08ffdbe 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -374,8 +374,8 @@ static void sunxi_ir_remove(struct platform_device *pdev)
 	struct sunxi_ir *ir = platform_get_drvdata(pdev);
 
 	rc_unregister_device(ir->rc);
-	rc_free_device(ir->rc);
 	sunxi_ir_hw_exit(&pdev->dev);
+	rc_free_device(ir->rc);
 }
 
 static void sunxi_ir_shutdown(struct platform_device *pdev)
-- 
2.55.0


