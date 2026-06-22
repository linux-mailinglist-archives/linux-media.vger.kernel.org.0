Return-Path: <linux-media+bounces-65385-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iI7OAvNPOWrRqQcAu9opvQ
	(envelope-from <linux-media+bounces-65385-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 17:08:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7D96B09A5
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 17:08:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=kfPpXJeP;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65385-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65385-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69014303674F
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 15:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0806D32720D;
	Mon, 22 Jun 2026 15:05:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C31C3264EF
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 15:05:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782140734; cv=none; b=eZv53O9QqViyi1QepjeLm4qUJVyoBtAcbL/lmIQtqnMk3jCdO0hmc/twYNgHPTWr+ZWjzNCU1vHSYynEJnmyUS2RyEKj37/NplVsTnr/sE16APWBgVeNLcIMxa52FK59d+imozeyL4QEk8W1/2BpOCM/GZ/Gz6fMMius0aBXeG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782140734; c=relaxed/simple;
	bh=ikcqpOvl5IQ1bOkrSs4EAPqGyxNCiKOfgIfVMejmauk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hd8M5bNRspMpOeHuWvztArvlGOfiUdpzBkfDRTSB4A38PyVU34faYQeUmqLH2xEYbQXr7TUHBKUhEwY1jE+O1ORbbxjqxAwGEdyCVCDlehkItJipzFIEvSVYzfuzSpPiSqGVslriC2zSzBRb9IxvoFTndvGfwd5UVacnKR1pgOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kfPpXJeP; arc=none smtp.client-ip=209.85.210.176
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-842848fd613so3668511b3a.3
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 08:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782140732; x=1782745532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=znlvhEDVWgk86nX3HQBgnFoFqXFA2zVuL0AKn/CCZps=;
        b=kfPpXJeP1nwvjJNgkgF/4xA2vEz6IL7q/E0w1VMGOJHq4Mo6cGgozIcasrmumjjEZ8
         TqmE8fOCcVXRnwIxRLL8OLwN3+/JwbC0zABcob0H9T0HqXDjnC2XoM5A9R70Ci4Nm3hM
         AdPWgtXYdVaddfaFsy/r1QrkOhuADHiP7q3+dpu3WEn30/PffnDA5sOGBxSXEsEE4ONT
         PHyNjvql/sgcGLzUQE/1AN1kape2tTXnAl7Pd9KlB13k28HCE6Q49L+bl0a9M8sfo0bR
         OJAdCe/u3LlMf4PiUGCgMCv16nI32dRXRR0JY+xlZ9yNYOMddRS9XMFyQ+WPawWO2To/
         pRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782140732; x=1782745532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=znlvhEDVWgk86nX3HQBgnFoFqXFA2zVuL0AKn/CCZps=;
        b=TYzdAyLY64E/LDIuyPSwekM+zBPsMncyzXxzeYah0n9HNPNRSkvkMZhB7G3mP+r2tY
         ZCmBsq6921HB6HdEyPXNDYZ/zuWsMhqMbwdZjIMlU9z63bpq1fXPWNBWib4DWTmQ3BL3
         FWai9C8xP5IHoHsBbCWxAH/RkdTu7wafPKlxCW1aMFbrci1JXM7KzaNRl2kS4No5RYhb
         qr+p1RJFCNdRfhQskdEsEvENfWUPz+XAVkU2Z9EHhQt17AfFRWMLdZQ84rX/RRKix+uA
         SRYEPl1wK5i+9B0Rdzd17dXAfqf7H2N6OibJ99HLJ7fXadFJsrVcFIGIS3B225tyYfkI
         prow==
X-Gm-Message-State: AOJu0YycA/ktorUW8Ow8LvpxIiIfR2q1QQ9xb5AxP1Ub0qJKCzDHtGZq
	cjGiUox6DimloOPlnVKGdNj5gp3y+WqTR5kByqRPNs17uLNTzPDv0wE2
X-Gm-Gg: AfdE7cnvsGjB1cT/uvtncZ1hrPkVELejebGst3c0vwdVouRDkRywnzf8nhzOnR5HPZ1
	7Wb0fNqf2UM95goxHSNkdU+6GhxDWmasrGwfoKTZV8B8SmqnZrOk0HXdJ7MDfoOaTXTRdq8HKXT
	PIDqK6lOuTmxMIDivlEPwwMfrxoLy1NqH+wOSIzcdk6ZW9BpxCAwj530qPki6oST6PB3NZlE1aN
	WVIgGnyLe8KM3AZK44iI06BUWCGeZiToGLu0yu9Be8UACDgK+14oZEHZodAeZvy7NySv9wDJ67/
	48Usdaf0HNCXQhKk45qcHnt8IX+c38yk/cUxGFv+Ykr3hdPlSdb097f4591Q8hQBFL5UXQOLDN8
	tXpK2jdXE1SswsGPiZAroVB4vtk5Q4VeTdLGEIBXT5n+KCrN3wKTEyI7ijvTjChKalvBEaL2S/w
	BQLui2mndLlg7VC0qN7Znn8LvvyRna0HznjYLTO9AeA4m5GNQuCdhvUBRX8MxyIsMXZMIyITalp
	XWlUHQd
X-Received: by 2002:a05:6a00:4b07:b0:845:3fea:966 with SMTP id d2e1a72fcca58-84562479216mr10935861b3a.15.1782140732319;
        Mon, 22 Jun 2026 08:05:32 -0700 (PDT)
Received: from localhost.localdomain ([115.99.236.201])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ea22c7sm7751544b3a.44.2026.06.22.08.05.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 Jun 2026 08:05:31 -0700 (PDT)
From: Mani Bharadwaj <manibharadwajcr@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Mani Bharadwaj <manibharadwajcr@gmail.com>
Subject: [PATCH v2] staging: atomisp: anr: move trailing statement to its own line
Date: Mon, 22 Jun 2026 20:35:24 +0530
Message-ID: <20260622150524.31133-1-manibharadwajcr@gmail.com>
X-Mailer: git-send-email 2.54.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65385-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-staging@lists.linux.dev,m:manibharadwajcr@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[manibharadwajcr@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manibharadwajcr@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5C7D96B09A5

Move the return statement in ia_css_anr_dump() to its own line
to fix the following checkpatch error:

  ERROR: trailing statements should be on next line

No functional change.

Changes in v2:
- Resend with proper formatting via git-send-email.
  The earlier submission had formatting issues due to a
  misconfigured mail client.

Signed-off-by: Mani Bharadwaj <manibharadwajcr@gmail.com>
---
 .../atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c      | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
index 899d56623..fd50a20ac 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
@@ -36,7 +36,8 @@ ia_css_anr_dump(
     const struct sh_css_isp_anr_params *anr,
     unsigned int level)
 {
-	if (!anr) return;
+	if (!anr)
+		return;
 	ia_css_debug_dtrace(level, "Advance Noise Reduction:\n");
 	ia_css_debug_dtrace(level, "\t%-32s = %d\n",
 			    "anr_threshold", anr->threshold);
-- 
2.54.0


