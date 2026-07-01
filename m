Return-Path: <linux-media+bounces-66198-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Sd29EIf2RGpu4AoAu9opvQ
	(envelope-from <linux-media+bounces-66198-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 13:14:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 850606EC9F9
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 13:14:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Kv4lrFZt;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66198-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66198-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D47C30A742B
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 11:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C88743B7778;
	Wed,  1 Jul 2026 11:12:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3753B8413
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 11:12:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782904368; cv=none; b=QP37+odAe1n14EIBLIXq569/gsuNKFjyZGGTpAJIE/xQXNOMrHca1IihrpjpjvzKjDBGuxg9loNAdq3/mq3tRgjDaP8AFr4bNfxoNprxFavdkV3VWj7XS8Nzv7mJD+krSqJOdJ3nD18lrw8YicqVYdhBdQqnPTJ3qt2CxgRZEJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782904368; c=relaxed/simple;
	bh=kwA92qseeq4bRhv7oLnnSWdSGjvn0QS4sfz6cv0HOpA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f3qHblwnHgKQUQkeRMWihhyRwuLR9LT1vErBA+5E1n74kQBtHXlj4qnB+kemzWVO1BxtbBQ4f95r/NJmy+Y04wB7hNANoSWYpesajIPwWe5cfDPqIOTo2PfL9Gd09rG7XTZbIsC/ozt/NgNTELlNBLXd9GNY8CN+Do+PiTafNxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kv4lrFZt; arc=none smtp.client-ip=74.125.82.180
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-30b6dad2382so941328eec.0
        for <linux-media@vger.kernel.org>; Wed, 01 Jul 2026 04:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782904366; x=1783509166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LkoKVbcxFCdFsy87mxquQYAqVgDQSp2s1Hkwlfg3a08=;
        b=Kv4lrFZtfTgXUvmzbF7Mo91WOeylCdOhfHKWVNd38gx161gw/daAVrvDGcWKivxL/J
         /hYQBKsBYzYdeOBapM+vxGBOAQAxHcjxUs+CGMTL9nCr5hLNLBFg00dTfz4x0R0tKuOU
         LqOY6QyCoyJP5Eg+GjRVvjcM+HPu7V4sUFjnZmiiWGAzYAs82dOUYPNfvQgXjmOHgFe1
         tCQUedDzH13bp4lXmnnFzcXj2MfdI2cX2mhRWTnrV9YK4eoiw18T/k3awADxk2k0NMaI
         jSWZqu4iSjcTy7fMW4flpXwxOdqhqifcwXAo8+Gr6XDiG4kJwMpobwcD+D/iibzNLxbp
         QEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782904366; x=1783509166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LkoKVbcxFCdFsy87mxquQYAqVgDQSp2s1Hkwlfg3a08=;
        b=mijReBPBVVz9WUmlN46MQ9PgzqmAmAh9SSBba/QRiNhHL1N2sSVtB26E4vldfZ6hn4
         Rq+PyjnoFivl/JB+7oL0lSPRqEJWlllL02gqjmevvEkOydtK8mvwdv0URlZfxl8yIQY9
         EN35hZZR6OiSOjlTR824LEvNYGbsDL2B8LzMTs7L7cHWt4lxhcn+S+UbC87yyZ6kjrp+
         PnOIfg8g+f/5xotQdcUKIZfhvAg98iiUZ2t093yhLmgVIeKv2gxWpg7XEC08AaVU5u6q
         vdmfULi7P2TbwkH8nJfAawoFgQ8v8YTWL/GRZip7m/mrwfzc10knQzBaCuVMS0bUSzjh
         i/0w==
X-Forwarded-Encrypted: i=1; AHgh+Rq10mRZ4GyIe3kXMCKpSJx1DwP/UIBcSy1CQACja4s0aHsCvxgYYvLKN2o6ErDovUaT95lBO+rPbbYbsw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo7y4aHyL+6wEDPlZ1BLznlPKedBlSoPIrdT54NIwzAyKXKefB
	j6DPwghj5saYnwA25Q8TD8ApSYjcFCeepQRs8vTHJH0CehxO2gnshJ/q
X-Gm-Gg: AfdE7ckO0V26yVeyFs7/nZ4kW0W8kkggnjRkbyg3jwq+LefEQYHbQ5mUpECbMm6S/HM
	bo097s72AwpcFqf4FFcgkI0YJLGAmC2Z/rtVcShGOouY5b1UrqjcAvqnwuUrZ1F4l0TuiaF/zp7
	09hgwkkIih2nYe5x8AYTu/UJgdEIYm1QMScgbG+o8SOJIwcftsA2ECzhoaIdUpt1Hr2337IzR2D
	W3bd+PamzkKmFad1bC0QYiZiPytu+cUr5vHHcNyQCKwEq7JBJFp+ok7b//j03ZMhoPe/F15g4Jd
	FXn8guYCC/FajyYJZ52o9NAIRDTvALt+w2cD8e42ZWLu4BlK2ANPx1709nGtgHPOnb5Iu9ct6ag
	L0MN4v8w/UacGMMDm2k7rQzSAe8bImbmqjW3uHwcqMizfLIoDTw3iDroNgf0S2+YRrXd0KPvcix
	oaSjZWemf1HCCKzpWm4SQ=
X-Received: by 2002:a05:7300:3213:b0:30e:cb0a:fe7c with SMTP id 5a478bee46e88-30eff0a9e50mr1173027eec.17.1782904365910;
        Wed, 01 Jul 2026 04:12:45 -0700 (PDT)
Received: from ahmi-PC.lan ([2401:4900:88f4:d9c5:fca7:1ff8:6590:ebe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2fb6514sm16687832eec.7.2026.07.01.04.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 04:12:45 -0700 (PDT)
From: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Hans Verkuil <hverkuil@kernel.org>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
Subject: [PATCH] media: rkvdec: Propagate platform_get_irq() errors
Date: Wed,  1 Jul 2026 16:42:03 +0530
Message-ID: <20260701111203.62092-1-ahmisaranrao@gmail.com>
X-Mailer: git-send-email 2.43.0
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vanguardiasur.com.ar,kernel.org,sntech.de,collabora.com,vger.kernel.org,lists.infradead.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66198-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:detlev.casanova@collabora.com,m:ezequiel@vanguardiasur.com.ar,m:mchehab@kernel.org,m:heiko@sntech.de,m:hverkuil@kernel.org,m:boris.brezillon@collabora.com,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:ahmisaranrao@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ahmisaranrao@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ahmisaranrao@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 850606EC9F9

platform_get_irq() returns a positive IRQ number on success and a
negative error code on failure. It no longer returns zero. The driver
currently returns -ENXIO for all failures, which loses useful errors
such as -EPROBE_DEFER.

Return the error from platform_get_irq() directly.

Fixes: cd33c830448b ("media: rkvdec: Add the rkvdec driver")
Signed-off-by: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 1d1e9bfef8e9..37683a6bb40f 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1818,8 +1818,8 @@ static int rkvdec_probe(struct platform_device *pdev)
 	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq <= 0)
-		return -ENXIO;
+	if (irq < 0)
+		return irq;
 
 	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
 					rkvdec_irq_handler, IRQF_ONESHOT,
-- 
2.43.0


