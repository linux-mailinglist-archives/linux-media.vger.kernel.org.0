Return-Path: <linux-media+bounces-64817-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3J2QKqzeLmq/5QQAu9opvQ
	(envelope-from <linux-media+bounces-64817-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 19:02:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 51268681ABC
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 19:02:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=hBSTNb2y;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64817-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64817-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48B1A303FF1E
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 16:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D017B3A542F;
	Sun, 14 Jun 2026 16:57:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB74307481
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 16:57:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781456250; cv=none; b=RWF9LAooQG+dE3DVDFWGVnDrlqvrIMoC89vkgtxiveUMjAGAw8E8LIXbDcNOeKdbTd4Jb4myNfFPwIOHI7I5b2j1Tq0NAZJbC9//29w98/46jx/bMCPaskJR8b5AReog+ZpRtTidy1J3wP25HM5z6DMBqcbUdEDN9Vpne9E6k3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781456250; c=relaxed/simple;
	bh=nCYCPVMm7UiRnt72HgVaO88SMofkYM4zDJXXTr6L3Uc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HDGNRpltHN8Tj1mv2pbH6egCtRrg8Y3AvcrzrrUKLWvfHMn98HmMgTHWKxojavAhLb3qTOFNLc++wnP2wIl8P5vBuIxdPlYyfRwc1J6j9X43kvFZauO5bTOUYt3f+Br4s4lxiHhJYjmQ7og3knF6Z6x5jQ8yHuPenFh5A7+uXho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hBSTNb2y; arc=none smtp.client-ip=209.85.214.180
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c0a5354da1so20423045ad.0
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 09:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781456247; x=1782061047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ikv7Eqa2s2Mrx2CW5Hi2avcXl63yH6FHKP5OPXB/6lg=;
        b=hBSTNb2yMrWRrDKTsDwkUpoMX79fxS0Zg+gJ+RMFciNY5vIrC2LJhzv9uoxaGklkcX
         C39bQGLP9TItXqE95fwCP61uEaxXWE88NWR+zhlAyzSttQK0VBgFdpYZdB7jMXa24zH7
         JAEGtUVRBzpoJFeywGvrBOAxFayLfZRDz1nJG8Aod/Zdaz3AC++LxnN9D1Cs3l0AuFMu
         7oK6SozqpJ7C9hy6eq/j1umXeEosCZRUXKnay4bvc2jK9dSUdKC05wCaVW1iUySzr3X9
         H/NMcwFqTMd0uoAJ7Yt18XlKvvzm7DwIpgZ7LLohVbtTa1OCSb3CZRbhYH74jRVwK2C5
         kr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781456247; x=1782061047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ikv7Eqa2s2Mrx2CW5Hi2avcXl63yH6FHKP5OPXB/6lg=;
        b=phAwiAldQbVWFDzf9/1PoW64yc5zUsPHDz7CaiolsKZMYPMP1vCgGIBCWRcoSrk9fm
         0beM7z0J/m6+UW7IOUSpURhzbX8UqvthtHUYBIe19VM/wpPihc7Js/y0sJLoEM9w3BXU
         ys5mi+4+Rp/Y+ImI3vZUlYTdnWukI/w4fgxPKEJajJr9yXxMXuk8v46CV2hXB3d7mGlG
         z0VgpySk8R4hqscsElpHbd6VfFRttlJAEpxx40Y7qGLMArSb4XDd21qVczAQildDKyHP
         v1nTuZyKUpfC+KrbezHyXZbruGAVTsKF6YXPQ7jNeeL3xUvinPE+5aHPWVeCMcUBhhQi
         V6yA==
X-Gm-Message-State: AOJu0YxsDUdoq6IdaMZjsIuwC5wuY/7SGT40kLZ39FUBJZvx/SdM+I3X
	FF+6JPNMhUvQ23/RJaCYMm1/h3KNBu65aQWk5MU7ImBJse1qWOK12io4GAuKBNIJ
X-Gm-Gg: Acq92OFdZGqJs6Gz+SvLcWWojmTgvH3A4TD7eDmQ/3QA/lo6qvljr/hiDauohVAqpPd
	SGethftgOd4DEWWIkqYXYFxWkk/7fyZTHKBSZVoX3AxulyBVF1v4UDBOU/7jwec8AHQD6/XErbh
	PjffMSX9jXpjmv4Srb8QxshwYG+HTdRljiRzWno3BsId7Nd9YwRXRMr5SIzKVIpAMgJoguleBfY
	/EcKUTjZT+URpMLkGosauyxA6LIbIrtaSWu1QW4TSJ9xUJvmrm+60btCMubjs864inoJg7XVJM3
	BG+uFyWmHG7Bek7Izgfb//0uJgc+F2CHsAl6nEEf7bCCtivGJD1m374+umMDNWDJYpd5phNlN5w
	an50Q/FCNVank7XYmDsfmGtGdh3gbeQ/b2F9IirxjJUiagRYh4SwWGZdq+ff9jZvQauq/fufsiG
	xP5Nf8WHiYE9TfBK91X6gAx+e4zO/T4gUgkan/z7Yr2OmcADMWKvsf
X-Received: by 2002:a17:903:1a70:b0:2bf:367b:f46f with SMTP id d9443c01a7336-2c3fdfc2b12mr84794015ad.30.1781456247354;
        Sun, 14 Jun 2026 09:57:27 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5590sm85284025ad.14.2026.06.14.09.57.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 09:57:26 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/22] media: platform: csisp: Add missing media_entity_cleanup()
Date: Sun, 14 Jun 2026 22:25:48 +0530
Message-ID: <20260614165630.3896-12-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614165630.3896-1-birenpandya@gmail.com>
References: <20260614165630.3896-1-birenpandya@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ragnatech.se,glider.be,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64817-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:birenpandya@gmail.com,m:niklas.soderlund@ragnatech.se,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 51268681ABC

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/renesas/rcar-isp/csisp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index 8fb2cc3b5650..51db5ad25c47 100644
--- a/drivers/media/platform/renesas/rcar-isp/csisp.c
+++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
@@ -556,6 +556,7 @@ static int risp_probe(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&isp->notifier);
 error_pm:
 	pm_runtime_disable(&pdev->dev);
+	media_entity_cleanup(&isp->subdev.entity);
 
 	return ret;
 }
@@ -569,6 +570,7 @@ static void risp_remove(struct platform_device *pdev)
 
 	v4l2_async_unregister_subdev(&isp->subdev);
 	v4l2_subdev_cleanup(&isp->subdev);
+	media_entity_cleanup(&isp->subdev.entity);
 
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.50.1 (Apple Git-155)


