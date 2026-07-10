Return-Path: <linux-media+bounces-67247-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xbB8Au+1UGpW3wIAu9opvQ
	(envelope-from <linux-media+bounces-67247-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 11:05:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4598D738D07
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 11:05:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mess.org header.s=2020 header.b=DKgRKquz;
	dkim=pass header.d=mess.org header.s=2020 header.b=LtnHROeA;
	dmarc=pass (policy=none) header.from=mess.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67247-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67247-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0157A302AE06
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 08:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C48A3F210B;
	Fri, 10 Jul 2026 08:54:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB443DB996;
	Fri, 10 Jul 2026 08:53:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783673641; cv=none; b=iIBw+m3HUH/3k6uSek5bFqBguZxN4hA9+TYURkRx+4Svob9tZJrqgqRa1dsBgEyWy05L2GiaRBVREs8cT2g+m/3d7afSTUQyDLVcAVqu8UOejMKFEtOXuI7/xOz8Xbilnx2s4n8ZiZMTf4MrctnfN9TSCDJZikE1AjNaqgB4QWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783673641; c=relaxed/simple;
	bh=vIGWW0q7qDZpE2XaivemThfhoGPHq88Yr7BOi4F1Frg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QI76fOcMXkEC7WWRvTTpw8tJKKzaEgcfZtCkqQj13ypcSrpbOq/FTProl1p7lexCntoayUbb7s5BUrf/SUFF56H9JeCFgo5y+iIgeXRkaqhXL7WXMbE0Q6+AsRWDGaDH+gIE+69IB7VHIXzDIuhTeDk/a2uEanYu+arAakZa6ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=DKgRKquz; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=LtnHROeA; arc=none smtp.client-ip=92.243.27.206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783673633; bh=vIGWW0q7qDZpE2XaivemThfhoGPHq88Yr7BOi4F1Frg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DKgRKquzn6u4GXvR3/4y/vMTUockSPa2h+DGHTaeQLkTeROgA08ygLth5qiaHBzTn
	 SGjidYDFmxY1GDXbGvzyArcGg9f/C0ukLz1LqtVmfl7ISklIWndmzIkV+BW8I/MmbM
	 DfJJ1x09BZ7Pj9sa4oCojjyVZB2JKWAhWCtM0yUXWPCYlRBGHLPavYRSVYzD3TmDP6
	 akihak+3B211H2h4/A5M5q/0H3/CINMFzmWhWM/pYvt78Ic+wkWSG67yFSr1szptm3
	 zyjUxINeRdHiu8tBCIqLmSElfFuUmmEEB7lOHNVUva3Zdv+tiGlljVZaqgSwKxeFzX
	 AIMIxsTJU9zUg==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id E1A5B40B49; Fri, 10 Jul 2026 09:53:53 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783673631; bh=vIGWW0q7qDZpE2XaivemThfhoGPHq88Yr7BOi4F1Frg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LtnHROeAAHlaigMezuutfO9f/l1ULsb3aJaFpPhAQPgENEoAIUOe+6n7FqS2l+ILH
	 8x5HVlkA5CMGf9Duq1HWQd+WMg7H940vYfptn/oPQsuExaP/ZtzqgJ65K0/8fHq7b+
	 iojICn0qJ75RSwTDYK+DsjH7XzwzZyxPvzDUffCDYKQUI7E3tt5MrAcXkQyhZuJANM
	 yhoeeWaAa7boVU1eup6mzSGRqT+gsmP/LwlY1QjQXTO5nu557ha867/5ExeqeQjea4
	 w2RikHrKYgbltR+6MSKrpScJghhsblE0gmXOMdQV16nR8jiQoQOT4Q0z0K67aTw3S4
	 O9QcJ/4yhigaA==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id C022840B4C;
	Fri, 10 Jul 2026 09:53:51 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Zhangfei Gao <zhangfei.gao@linaro.org>,
	Guoxiong Yan <yanguoxiong@huawei.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] media: ir-hix5hd2: Ensure rdev is setup before interrupts are enabled
Date: Fri, 10 Jul 2026 09:53:35 +0100
Message-ID: <81c6f7a6243bbe73fbac2d9bd763b0e40b400125.1783673420.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1783673420.git.sean@mess.org>
References: <cover.1783673420.git.sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[mess.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[mess.org:s=2020];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67247-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:sean@mess.org,m:mchehab@kernel.org,m:zhangfei.gao@linaro.org,m:yanguoxiong@huawei.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[sean@mess.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[mess.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sean@mess.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mess.org:from_mime,mess.org:email,mess.org:mid,mess.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4598D738D07

Once the interrupt handler is enabled, priv->rdev can be used. Ensure
it is setup correctly so there is no race condition.

Fixes: a84fcdaa9058 ("[media] rc: Introduce hix5hd2 IR transmitter driver")
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/ir-hix5hd2.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/rc/ir-hix5hd2.c b/drivers/media/rc/ir-hix5hd2.c
index 1b061e4a3dcf..aa3de4d57a58 100644
--- a/drivers/media/rc/ir-hix5hd2.c
+++ b/drivers/media/rc/ir-hix5hd2.c
@@ -316,6 +316,9 @@ static int hix5hd2_ir_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto clkerr;
 
+	priv->rdev = rdev;
+	priv->dev = dev;
+
 	if (devm_request_irq(dev, priv->irq, hix5hd2_ir_rx_interrupt,
 			     0, pdev->name, priv) < 0) {
 		dev_err(dev, "IRQ %d register failed\n", priv->irq);
@@ -323,8 +326,6 @@ static int hix5hd2_ir_probe(struct platform_device *pdev)
 		goto regerr;
 	}
 
-	priv->rdev = rdev;
-	priv->dev = dev;
 	platform_set_drvdata(pdev, priv);
 
 	return ret;
-- 
2.55.0


