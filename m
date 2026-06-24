Return-Path: <linux-media+bounces-65516-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Py8kHzSRO2pUZwgAu9opvQ
	(envelope-from <linux-media+bounces-65516-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 10:11:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D92C36BC75F
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 10:11:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=aakT23HS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65516-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65516-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1DE3530485FB
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 08:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21CDA39936E;
	Wed, 24 Jun 2026 08:11:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F9E39281B
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 08:11:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782288682; cv=none; b=B++P0FWtt6TnopEaLvGh/zA2sgs+c2e5sCvusw675/vECBCzcrRvQZjSSEq2NhHx10ihAlw2PnOcewwxA5awgt29p1A8Q9rpAY5/mF+xda+qInrcVI3HO6c4V2Ui885En3A0kiRd9F/scGKkVxha/4y0VSvDFxG/AeHGp3WWBQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782288682; c=relaxed/simple;
	bh=09NMPoG/spnXBis+VqJ+rYXDAc9zZk6bGTehKwsBkRE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NU6NRyX5V8Hbj1ncYlyS9WAtHhOBlMVtsJoRU/jSHSEuSla+e9oywMRqy5CNYihqSEmvFRp2XFrWt1Vbe73X7L0VW6hZMhR9ceGoLnbaLts/+/zo0NvGX6Y8V8BgNeK3X+xoKSKCXFKO5wsy/AneGQQGagZa/V9wAkMwDtbxSGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aakT23HS; arc=none smtp.client-ip=209.85.167.53
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5ad49c55ce1so551208e87.0
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 01:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782288679; x=1782893479; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4ZspwGUoA2U3bTatRsJu7EIHEwqqw33/XeST7dBdN1U=;
        b=aakT23HSWHl8S7r+EiTMZVI3idlSm9nkTr8vEdo3IivOGFQh74c5G8oLMR3nqe90fe
         JIEcFH2dIOGtA82XC7HY7YjAjqz3hZMf/35O5U9vk+d4ecdEQmP2m1IFx1aGtAIDpKRw
         BWDwnnvwmtDXfN7tCnBJuOLiRc7aaSI4RC6Mc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782288679; x=1782893479;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ZspwGUoA2U3bTatRsJu7EIHEwqqw33/XeST7dBdN1U=;
        b=d85vUmjfL9W6AoeVIoyTjJvRuhWP35j0qBeO2cpL7o6570Z0wA0IGlIUubPD0/JbZ3
         pmLcfBBHVb9sSJzw18MNWsFmQ41YoIPR3gTqVw8iD9742ioCQckLJX7JGR3fKuwrWjQv
         ctaPv5ep8XQKB67tFzTlOyav0cnV2tjeOqcaPYMq2gc7Bqp0IH6lhVN5vYaQSabU+lqI
         WSFmXjnv4d39mN38W+sy5Y0LU22HiMcgdcCY8wBStUa127ClWfkkyniUtG4CeHqiXgok
         pU5Jump4kC9AGMLhxAE6EWxG/TukInELlJEyK/rmK9vKgQPVnG/z1FCnDMvcInNcSkk0
         RXpQ==
X-Gm-Message-State: AOJu0YysJUVNMjnhwYWhHvPNDu2qZNSCvNmA1v0WnKmvS8jMDOPWvzdG
	5zycJrLjEcrIaRIM0UxtAK3V3ThBIkoY6TKj2TonrYnhrpji0oQv4AQ6iCzK60wxih9G/JTkumg
	wS60=
X-Gm-Gg: AfdE7cnJbNBk+IMbNUaXI3lTrPow9uyWAsnLpUNkvutWVt9fo4mw+VUPgEtYGexaRyB
	sg0DrcZZb6pKFsna79QckVhG+dsyXNn0rn2s3XD8MTxcSACGc7gI/dRnUHp+EVv71iOlfShb7RS
	XnoylTokmzDQdeV/ALPO3q+psLQLOQzVfjmxjnuQD+mbQpzaKvXbBaxaSeMkrsUO3oavUSlJCeZ
	pNG2fW82Lny8JwD1qeeYlIHIp7eQLy8PqeZEFnDpPoGnenn4a452iJLUlR4dUgYxIK9HAvKSCnH
	2+XcUJdl5+7tj+hnikyuXr+NITcpYLMsz/BZ/gloUqu2wwKDMMcp2ij/3xMoQIknoogDpQuFsI0
	lcVRsIrNAkNHhrw9gbJBPgyBdKM89FxyDcRcbuode+I2N4HbEfxbiOGndxvKgDKG0pghWIcvpyW
	QtsZCillC8deMX+ym5SGdkmgimkysRBGYYpXSjW0UcyE/Y/WdmfL9Y1wElBL7RzSiL7COT
X-Received: by 2002:a05:6512:1286:b0:5aa:123d:b755 with SMTP id 2adb3069b0e04-5ae9d5794cdmr529617e87.28.1782288679241;
        Wed, 24 Jun 2026 01:11:19 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999af9f376sm34008531fa.9.2026.06.24.01.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 01:11:17 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 24 Jun 2026 08:11:14 +0000
Subject: [PATCH dtv-scan-tables] CONTRIBUTE.md: Add new file
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-contribute-v1-1-696f0220c0e7@chromium.org>
X-B4-Tracking: v=1; b=H4sIACGRO2oC/x2MWwqAIBAArxL73YJtD6SrRB9mWy2EhZoE0d2TP
 mdg5oHAXjhAXzzgOUmQw2WoygLsZtzKKHNmIEWd6qhBe7joZboiI2vb1i2R0pohB6fnRe5/NsA
 cEwZrHEYz7dmN7/sBKjy6bW0AAAA=
X-Change-ID: 20260624-contribute-e8c53522088e
To: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65516-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:hverkuil@kernel.org,m:ribalda@chromium.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D92C36BC75F

It helps the user configure its repo. If they do it, it will help
media-ci.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 CONTRIBUTE.md | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/CONTRIBUTE.md b/CONTRIBUTE.md
new file mode 100644
index 00000000..b76b108b
--- /dev/null
+++ b/CONTRIBUTE.md
@@ -0,0 +1,23 @@
+## Repository
+
+dtv-scan-tables official repository is hosted at https://git.linuxtv.org/dtv-scan-tables.git
+
+## Contributions
+
+Patches are welcome! Please send your patches to `linux-media@vger.kernel.org`
+using the prefix `[PATCH dtv-scan-tables]`. E.g:
+
+```
+git config set format.subjectPrefix "PATCH dtv-scan-tables"
+```
+
+## b4 config
+
+If you use b4[1] for your contributor workflow you can use these options:
+
+```
+git config set b4.send-series-cc linux-media@vger.kernel.org
+git config set b4.send-prefixes dtv-scan-tables
+```
+
+[1] https://b4.docs.kernel.org/en/latest/contributor/overview.html

---
base-commit: be35975ac877ba020aaf1df4e0e352c9d11ffcf1
change-id: 20260624-contribute-e8c53522088e

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


