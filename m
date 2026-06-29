Return-Path: <linux-media+bounces-65941-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dDDZLeVrQmpS6wkAu9opvQ
	(envelope-from <linux-media+bounces-65941-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 14:58:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 286D16DAA40
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 14:58:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=mM0zhUTP;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65941-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65941-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 403BB30B7E9C
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 12:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D33EF403B0A;
	Mon, 29 Jun 2026 12:40:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926373FE363
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 12:40:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782736841; cv=none; b=bpMkTmQagSaS6LNQHmYxfBy4Adn5VRfYgn7DhLqsjTl++zYNk204xmCMTdAJ67TgAZAdLB6BVUxIDzaoTVVBCECD1PrTFPqpIsclDKENd0KxnnG6HH2bqrje5clZrFYsYxsfn1I29Z/n51M5YqnA8PpD6/L44a3yQFr1Jhnnb4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782736841; c=relaxed/simple;
	bh=7/aTZgA/LD6Da9wZcE/qmmq355MH6OXpSsd/14e2K9s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Fq3rdmpPaL6cGdpNvVXWEPRrbZV2IXReaZ0qFJHyxpaJRHoql1OCbH9QWryb6PI2F8d/XoXH38ghMvy5q+eHe0u+a2ErLK9BWt5EYW6tB4CJMNmbne59P85GGJcROkSoQFxF7FS6DpHnxyPTep2OZwoMLEy9NLPMqJJYUF8qOzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mM0zhUTP; arc=none smtp.client-ip=209.85.167.53
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aeb78090edso978045e87.0
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 05:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782736838; x=1783341638; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5zIAdJCKbNENVfvgscOhTkga/yddpfFOCN8UPHqhg2w=;
        b=mM0zhUTPdHpWHzslD5KvyGjFeatHO/V35Yu0byPjS81wQskvfk2ZpXinSp6fZ9oET1
         5pMAlas9U4SPAkU4nblRyN9Omy/5oD+mRJIBZsx3TwnPt3P6KkYaFlXDuBvJzn6qpuXC
         e+sWntuex2UiDXGEiGvlIWqiTiV/X8Npx83yk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736838; x=1783341638;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zIAdJCKbNENVfvgscOhTkga/yddpfFOCN8UPHqhg2w=;
        b=sirSUxsD7I+nsm9ls4xOqUA1Ea3/vSfk/e87Nf8B/vxQQUuG1GjTi15KCROEFJFZ13
         g13cOWBdlDRP33FxZiSr1j1iSlXdtUnDK/wVDvvhHGzSAT2T1mVxMC4riJQT08FhEhBg
         3Qs3jRPEG+aet/MqJkFrY+8GmqB+jUggrUUastGKTj39/GHMvqtHWb6fO49M9oVWM+Rp
         1wUVuedpimcllrrGJZwXX2AXx1i1wyPxxoi57Dm6EjxK6z+i6zH4acGI3OZML0hDasNX
         aNmM7N/X8GwQ0PoGolD9DKyNKCKi1jr9WV81ox3MREah6I87XImdR0b5Jec4B6FAVfEU
         jKqA==
X-Gm-Message-State: AOJu0Yy1oa7UxgAyiGfXk7JVAJPaqYHcXf0I/FPea4xOn5C4GBL3BNxN
	Hn9zEiRcplRfWiXlTG2QExfS4u7h+ylP3tBsQ1GHVa6TIk2qZDEFMtsugGfhZd/beg==
X-Gm-Gg: AfdE7ckgOf+GlPzPXF6svvJlr11QF18qZ24z8yTIHSBcwLij9GqRLIZ3cdEK2BMU8B5
	6AtwHU1hOPXCePZBO4kPioewku72Kc7X7lfxrpMLv/jjhux5s/rt+vguxVjlaTX1m8BhkkCnE7R
	7X6Ot3ROqCX+89C23UaYwOucVRZ43bVb8/edQ5Lq0dXH904aLdLCCdToayUgIfohcZQzt54wgyR
	BF0hBTdfaTSEFoOAXcca368acZO3JJTg8qnsMFfU1msQDvdtjVbMc9m7kiGvsbeSMAwsu9ehR6/
	i8keYhr3/L3Z1bZlXtucRyqsy56vcmnlBpG20zGwD1CknXlsu+HXex/BOLlKUr9Zk+YH+sN1nwX
	ywcb0S62/UTP4LsU/C/LJ5nWYaDVsLEd+/pqHCuAwcizRSPxqe+wxJ2kZqCBu/Tq+wamdZVqByU
	7OzAsDLuY4r0tP4GZK1JN9GslfFDF2Pwh7YzUffjqO8Q6M91CoGboaxXPN7msae8+aTQ6r
X-Received: by 2002:a05:6512:65ca:b0:5ae:ab24:6537 with SMTP id 2adb3069b0e04-5aeab246676mr1148410e87.32.1782736837802;
        Mon, 29 Jun 2026 05:40:37 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad69579a76sm5909277e87.51.2026.06.29.05.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:40:37 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Jun 2026 12:40:36 +0000
Subject: [PATCH dtv-scan-tables v2] CONTRIBUTE.md: Add new file
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-contribute-v2-1-a1e4bb16c02c@chromium.org>
X-B4-Tracking: v=1; b=H4sIAMNnQmoC/22NwQ6CMBBEf4Xs2TWlSkVP/ofhAGWBTaQl29JoC
 P9uw9njTN682SCQMAV4FBsIJQ7sXQ76VICdWjcScp8zaKWNMvqK1rso3K2RkGpbXSqtVV0T5ME
 iNPDnkL2gjwmDbR3GtnvnrsnAxCF6+R5nqTywf95UYonmbgaV3VbR7Wkn8TOv89nLCM2+7z+1U
 RXIuAAAAA==
X-Change-ID: 20260624-contribute-e8c53522088e
To: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65941-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:hverkuil@kernel.org,m:benjamin.mugnier@foss.st.com,m:ribalda@chromium.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,contribute.md:url,chromium.org:dkim,chromium.org:email,chromium.org:mid,chromium.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 286D16DAA40

It helps the user configure its repo. If they do it, it will help
media-ci.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2:
- Add .b4-config file
- Link to v1: https://lore.kernel.org/r/20260624-contribute-v1-1-696f0220c0e7@chromium.org
---
 .b4-config    |  3 +++
 CONTRIBUTE.md | 23 +++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/.b4-config b/.b4-config
new file mode 100644
index 00000000..96a9fb86
--- /dev/null
+++ b/.b4-config
@@ -0,0 +1,3 @@
+[b4]
+  send-series-cc = linux-media@vger.kernel.org
+  send-prefixes = dtv-scan-tables
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


