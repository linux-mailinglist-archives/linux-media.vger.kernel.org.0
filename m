Return-Path: <linux-media+bounces-64781-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CG/aA4bYLWo9lQQAu9opvQ
	(envelope-from <linux-media+bounces-64781-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 00:24:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D51F67FEB1
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 00:24:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=iJizFJCw;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64781-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64781-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A85B302A06C
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 22:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D82F53769F2;
	Sat, 13 Jun 2026 22:24:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494FD334C3C
	for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 22:23:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781389440; cv=none; b=L1DGXvqVtFgHkSV/mJG9ZDRJAFyHzgNKufmHOa68mtoUixJxksPehCbYeNnBzt0lSfRnhgSdAO/WPV0p/1fMgr10ilkcOKQxU1D1TBki1My3dKrhhbjlcB3pbF4+9wIxM537lFUEL3d6+P1sKZhGa4xN89zuLQYiz5FwBVhi6BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781389440; c=relaxed/simple;
	bh=D9cZp1iaCX7mYpMmba+/C9YETECXX2Z7drF5j960sBo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QQAFWILKMXSvWoCxVwcr2OjCuyDx8W7xwnyomBeOwJkOvlPmEFpqSpUVR0+CuULAtDYu/CyEdLiO/Ro61CDyF6+T+pBYJZt8dCqib3WgjYnSQPbEe7ICLdzKp1THpRfQtKS9k+/GHqETE16lo2DGHJQN/7zfrv74AnB18H53xIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJizFJCw; arc=none smtp.client-ip=74.125.82.67
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-1370417c01cso2706276c88.1
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 15:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781389438; x=1781994238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gVvTmy2kjAxDOQ5oAUZAa+g5F4bDNkNdVicqOVQl7M4=;
        b=iJizFJCwPip+Qn0xcztsbSYAa7F9S/nLgLGU0CRPi9ZeTXSWAYas29zeq7fEVmQVcW
         kYiV9DeGZ+8vqJ/IQc0hm4+C5WMCmJ066zLuCUScL7z0nqJxARZM06r/OYEXrrPaVWLD
         r149xU3ikllV/RBLLJIovXWgiy4zs/ex0/aXOVun+lZyMMegCIlHiEgySqBbQYo69/u+
         XaHDMXhETJwM3V0oIUujjQvZDYft13Z1twaYs/hSQov51yA0oC4lBpI9ouNTUxuxoZ3q
         HTu1ARKMj12tlzseOV5blo/GngCSU/2Kgfou/dKxmYX6P6VrGxkflDuudF6pDUl73b2d
         49ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781389438; x=1781994238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gVvTmy2kjAxDOQ5oAUZAa+g5F4bDNkNdVicqOVQl7M4=;
        b=Hgma9hkgN45yisYAp6H0sFnsNCEVSlx+tT0hYfXTmR5h4+DtV7PhXHe5R0hc+nTQDo
         3VI0TAMHr2bhbMxoVDbQDTdM6titVTnpsAzJrOZ4BtRkFQN4cs/482QHEnoo+PNfO6v1
         lMmepTPYhKSnK3JhyQT3isz1A+Z9iHcBIoHz8l8YeoCUOZV4j5Sl+xF3hEDnB0vp3PDX
         dbSdbCCx65fShOELh4LOm6dNeEZbEF19wmmBx7CIAxXnABp24nty6wVi7vfjIwN72W1Y
         2JYWfItgCRL4TMSWqVqI7HtGa5xi/2Xapwb5xJwBsfMIaHeqFk+Tr3vQiELkvvViRPri
         d0GA==
X-Forwarded-Encrypted: i=1; AFNElJ8PQ32GEnrAF9RuDeiWcdQTTJzFFP2FsIX4XSRPZEg7DRDtNm8Zc+lRwRljMSa9Vs6UtgI2YPu7RPWOVA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/uICFC+3we3Ra69KcUi+lYbF+6tUeKCDxpUBiNCWEkZmVDRNX
	W06169Gp7BfmGqul9EElkI8F/IKvvUnxHa9B8bInW1bwNLAlIR3QVzi7
X-Gm-Gg: Acq92OEtNOcC2TBvk7HRN/IiaGI9RHQs5St9v7KrvYWGQ5+deu5Sfpoql6rjzIeG3wD
	A9CWEzP7nXyFYzlWBDwN19xbbvU0NXnBHlA4xhfJuCgSfk0HuRhkfcK51I6zm7Iqg6/QiUxZeXb
	CF5nbkYodNzmEJ5VNN9X5emmjmh+Dcgt0GowdI4ew0eF62Yf4wC2x2sML/ny0XG3YqTS2LxslAo
	zRRF6JHlp4tq1UhAvtBLsapgWzWhJVIB4BQcJ6R9mLQTClWuCWcioHUGBj8LMxoQlPimHBNH+up
	byKSO58JEWAj3Brh7gIJBcVr0ZOXN/C4+WJG7/d/9RiM6ZAdnZvQgSR0Xfp5vitgYqmCcxZelcX
	DIRYtaMLqWj9rdAFvyCkXJgODvLZCB8LPON7i0TlZI1mhq1Hz5g+1Gp+SLKRobdgfiTVO1Tlwx0
	BatarsVRO5f4KkUCS40iHUEY7bu+USQxfW21FntS1jYvMl+oOnlWQdUhAMkFj0Lx85BotkO/LkJ
	JOEBoziTP2ZTsxuS15lW1Lzec0PI+d3X6yCQrMu6Ss6eg9fvPkL+EQYiRI0i7nMELB+iO0b1pP4
	UQ/Pxhtt3HrCqI0LOA==
X-Received: by 2002:a05:7300:dc88:b0:304:b93a:5107 with SMTP id 5a478bee46e88-3082004ba43mr4735033eec.21.1781389438357;
        Sat, 13 Jun 2026 15:23:58 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb9a2e7sm8811701eec.30.2026.06.13.15.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 15:23:58 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: "GitAuthor: Ethan Nelson-Moore" <enelsonmoore@gmail.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] [media] mt2063: correct CONFIG_MEDIA_TUNER_MT2063 macro name in comment
Date: Sat, 13 Jun 2026 15:23:46 -0700
Message-ID: <20260613222349.102397-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,collabora.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64781-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:enelsonmoore@gmail.com,m:linux-media@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:mchehab@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org,lists.infradead.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[enelsonmoore@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5D51F67FEB1

A comment in drivers/media/tuners/mt2063.h incorrectly refers to
CONFIG_DVB_MT2063 instead of CONFIG_MEDIA_TUNER_MT2063. Correct it.

Discovered while searching for CONFIG_* symbols referenced in code but
not defined in any Kconfig file.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 drivers/media/tuners/mt2063.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/tuners/mt2063.h b/drivers/media/tuners/mt2063.h
index 30d03cd76061..6c4b6c68ec25 100644
--- a/drivers/media/tuners/mt2063.h
+++ b/drivers/media/tuners/mt2063.h
@@ -24,6 +24,6 @@ static inline struct dvb_frontend *mt2063_attach(struct dvb_frontend *fe,
 	return NULL;
 }
 
-#endif /* CONFIG_DVB_MT2063 */
+#endif /* IS_REACHABLE(CONFIG_MEDIA_TUNER_MT2063) */
 
 #endif /* __MT2063_H__ */
-- 
2.43.0


