Return-Path: <linux-media+bounces-57212-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAb2NT5YxmmMIwUAu9opvQ
	(envelope-from <linux-media+bounces-57212-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 11:13:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC49342478
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 11:13:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 40759310CDEF
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 10:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EFD23AD50D;
	Fri, 27 Mar 2026 10:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="bhI7VeN0"
X-Original-To: linux-media@vger.kernel.org
Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60833AA50F;
	Fri, 27 Mar 2026 10:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774606112; cv=none; b=aGmMjIa9Kxo9KSWpCoRhjjk0rjWz1d3JC6NZZhW9M4yiju4MLTThzrJlMj9U9MdF/j5LliXM+rNFdzO3fTORclaCRPC8HcOreE/fjDzELCPxlW/KAk9aVx1Oo5FsnU+fdjIQ8Aagqp29/FyxVfCgxskiZds5oNSZHOGCB/o4G0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774606112; c=relaxed/simple;
	bh=8G40OCQgplRJmsLZCqvY+SqvdoddbK2f911JGeeQnOs=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=lj77o+trPJsUGgauEWGPchT5FFm8gOk8VUdB/qKtSPgo/t5aw9g+VVDIbSvIbDRmTw+isZct1t8MC+2T1RvPGEWD4yYMJadAdv45VbsFuxqcu7OCLpuHVxTqfKQxqhAgyU1RiTyFU5US24fBwqvoBkcxJs6bt2gjJHs9SOjeBA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=bhI7VeN0; arc=none smtp.client-ip=43.163.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774606100; bh=DeNphzXrIWqC+f0pK/OMpMj3if5YA040WlRIO2rbttc=;
	h=From:To:Cc:Subject:Date;
	b=bhI7VeN0Yts64DnpQnelg3LcwGdntp7CmElj3wxubYqzeDvn+p5r6D+vKlUDYN059
	 ksmCcw2HN0Rh0dsu7uPES559IsBT6Nx9ZNmQ/z7rvp/auubT+gihLsV5j7NFNTvvYu
	 jd5EiUF5cAm+E3PB7TfoQGnWSSaa6zc28WRfiRAg=
Received: from LAPTOP-KQCD4QBN.localdomain ([123.121.145.48])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 21082440; Fri, 27 Mar 2026 18:08:16 +0800
X-QQ-mid: xmsmtpt1774606096tuhf2ycjc
Message-ID: <tencent_E0887CABB6170ECFB0163A15F94507DD4E08@qq.com>
X-QQ-XMAILINFO: NGZp1yYNf7Y+/TTNrQSMJggTFeZNCGfJPZuYVFkvDHPAkjHsqFAPIJbhRWp1UK
	 KYbN/cvERotPgccx07qMttpUu5V11/Qp1ufAlyVWK2m9hitlGej1Q0LxdIHzbL/Dy8EvTNYdS0Xa
	 lExo4kvvL4KobT9jx2DXbm3YipYSLEEM4igpFPutgQgqsVeOOgLLE8xmrJU3rRTejTzUqOCzL2H6
	 6UIBqxXPYwZNeU3LpjrNwroGtWgzOeFr9XlST0Ju6Qr9FaphRLUPSfwohKEZOftapaB3l71O+rAu
	 hy9U8MRY2G+QBRYRcfLgNCHT66/Y0dljFRy+OjflFru3CBJljN9hQqfQS9lrjA3UHe64neElMio+
	 aeaO6v4aRgy1Fze7dMIpMQKa3zUEJvc9y12735k4fKh85dCzPU+0Pa/BfvXUNyCYN9lK1VuIEm08
	 YObtXf3y0APnwZhfiJycJusl1e7+4NWk7VLgJmXMg9Gg8wn7GV0+sjWXjA8pWhiBh5QsWmo3EJKz
	 m1d1PawKQZiXVpVTkcSlbMQUakq15Pragd3ezjjijpuvjEWaqGm/lVkEObnX5U/s1SheROR2JXbp
	 +eOwONJONknn8nbB6YWE5TyqUHmOID5XnEBu2bgunu6RII2/MbGmr4Z6lZTocUxjEEU3PMxpn9Sd
	 0IHzvBnHMynln1sqC8fwXmtMATVzq22/bvS5/vzUtyudRmri2X/J4yNYzd26iIY6CZJsIPS8w41j
	 3UgwbZj0ErVvakxWvQIZ7OocXlvTTziidiYVfn3xwF1uCCNDMJXohkaKa8fh56KSjPmNDGRfzS/g
	 TLEWfKL0jmTuHQ1kH4WzORdyKWirtmChLZ+N+u3y9sUtY07AthyEDeJr/rNt+kHL6azWFlBzLodo
	 Amvwk56G6v6ijP8hfrLBu+DJvbYeQCSezlIq1dGa2Fnxc0fqrfEybSGGMDAZRmwLAUwrTld+jhvs
	 BpJT8wQkz5YMFRZGI29osT9yTcbLg637mR4dbtlS8deZjxwW/H7nHtActskJiNir5YqYwmYcayFI
	 ZX6nflIHb15MjhBzlcpJKZe63IjXn6vrc9viJFPEUv/RRqk4b4RGXJuWgq21DJIgC49fAyKQ==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: Wenyuan Li <2063309626@qq.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus Elfring <Markus.Elfring@web.de>,
	gszhai@bjtu.edu.cn,
	25125332@bjtu.edu.cn,
	25125283@bjtu.edu.cn,
	23120469@bjtu.edu.cn,
	Wenyuan Li <2063309626@qq.com>
Subject: [PATCH v4]can: mcp251x: add error handling for power enable in open and resume
Date: Fri, 27 Mar 2026 18:08:14 +0800
X-OQ-MSGID: <20260327100815.23565-1-2063309626@qq.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,web.de,bjtu.edu.cn,qq.com];
	TAGGED_FROM(0.00)[bounces-57212-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qq.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[qq.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[2063309626@qq.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qq.com:dkim,qq.com:email,qq.com:mid]
X-Rspamd-Queue-Id: 5AC49342478
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add missing error handling for mcp251x_power_enable() calls in both
mcp251x_open() and mcp251x_can_resume() functions.

In mcp251x_open(), if power enable fails, the driver should not continue
with device initialization. Add proper error checking and jump to
existing out_close label.

In mcp251x_can_resume(), if power enable fails during system resume,
propagate the error to PM framework and log the error with dev_err()
for debugging.

This ensures the driver properly handles power control failures and
maintains correct device state.
Signed-off-by: Wenyuan Li <2063309626@qq.com>

Add missing error handling for mcp251x_power_enable() calls in both
mcp251x_open() and mcp251x_can_resume() functions.

In mcp251x_open(), if power enable fails, jump to error path to close
candev without attempting to disable power again.

In mcp251x_can_resume(), properly check return values of power enable
calls for both power and transceiver regulators. If any fails, return
the error code to the PM framework and log the failure.

This ensures the driver properly handles power control failures and
maintains correct device state.

Signed-off-by: Wenyuan Li <2063309626@qq.com>
---
 drivers/net/can/spi/mcp251x.c | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/net/can/spi/mcp251x.c b/drivers/net/can/spi/mcp251x.c
index bb7782582f40..e59220aa70ed 100644
--- a/drivers/net/can/spi/mcp251x.c
+++ b/drivers/net/can/spi/mcp251x.c
@@ -1225,7 +1225,11 @@ static int mcp251x_open(struct net_device *net)
 	}
 
 	mutex_lock(&priv->mcp_lock);
-	mcp251x_power_enable(priv->transceiver, 1);
+	ret = mcp251x_power_enable(priv->transceiver, 1);
+	if (ret) {
+		dev_err(&spi->dev, "failed to enable transceiver power: %pe\n", ERR_PTR(ret));
+		goto out_close_candev;
+	}
 
 	priv->force_quit = 0;
 	priv->tx_skb = NULL;
@@ -1272,6 +1276,7 @@ static int mcp251x_open(struct net_device *net)
 	mcp251x_hw_sleep(spi);
 out_close:
 	mcp251x_power_enable(priv->transceiver, 0);
+out_close_candev:
 	close_candev(net);
 	mutex_unlock(&priv->mcp_lock);
 	if (release_irq)
@@ -1516,11 +1521,25 @@ static int __maybe_unused mcp251x_can_resume(struct device *dev)
 {
 	struct spi_device *spi = to_spi_device(dev);
 	struct mcp251x_priv *priv = spi_get_drvdata(spi);
+	int ret = 0;
+
+	if (priv->after_suspend & AFTER_SUSPEND_POWER) {
+		ret = mcp251x_power_enable(priv->power, 1);
+		if (ret) {
+			dev_err(dev, "failed to restore power: %pe\n", ERR_PTR(ret));
+			return ret;
+		}
+	}
 
-	if (priv->after_suspend & AFTER_SUSPEND_POWER)
-		mcp251x_power_enable(priv->power, 1);
-	if (priv->after_suspend & AFTER_SUSPEND_UP)
-		mcp251x_power_enable(priv->transceiver, 1);
+	if (priv->after_suspend & AFTER_SUSPEND_UP) {
+		ret = mcp251x_power_enable(priv->transceiver, 1);
+		if (ret) {
+			dev_err(dev, "failed to restore transceiver power: %pe\n", ERR_PTR(ret));
+			if (priv->after_suspend & AFTER_SUSPEND_POWER)
+				mcp251x_power_enable(priv->power, 0);
+			goto out;
+		}
+	}
 
 	if (priv->after_suspend & (AFTER_SUSPEND_POWER | AFTER_SUSPEND_UP))
 		queue_work(priv->wq, &priv->restart_work);
@@ -1529,7 +1548,8 @@ static int __maybe_unused mcp251x_can_resume(struct device *dev)
 
 	priv->force_quit = 0;
 	enable_irq(spi->irq);
-	return 0;
+out:
+	return ret;
 }
 
 static SIMPLE_DEV_PM_OPS(mcp251x_can_pm_ops, mcp251x_can_suspend,
-- 
2.43.0


