Return-Path: <linux-media+bounces-64818-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eYVBDJ3dLmoE5QQAu9opvQ
	(envelope-from <linux-media+bounces-64818-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 18:58:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B09A76819C5
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 18:58:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=M8tGUaKJ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64818-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64818-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 07E3C30120F5
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 16:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A5CE3C98B7;
	Sun, 14 Jun 2026 16:57:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A392F3955EC
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 16:57:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781456253; cv=none; b=REnZyBxeG8NxqXzKFovFeVm6sOVXd0PBdDWtC8voXUc9glw969ixrdYfFpZdV1J2z/6/9nlwdyccrI8ExHOTp1JErR+nQBg4vFxkiXSP09+C+ZBZi8go1MZyhsoj9k1yifh7QE89terKXz/IgssR/BT3xydjfUXxvy4NPeyCY1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781456253; c=relaxed/simple;
	bh=BNGN1bV2nN7rnMkdTKtIKT6IixZTEuyFuCKxYicGbhA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hLepV8AaZz/fXcppP14ykSDCQNkdIRJlX+HIVqcBBGMSUhvvQSxhxNdY7GfixYxanTfYN6pPklwCrwmSFklnl16BnmDHju5iFwdaE3Oz2GtUrsgy1zh2ZGnuWN77IT+/NZVH+jJ8BFfoiOp93vypD/1f4q/gBm1qWdf+vhhDQbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M8tGUaKJ; arc=none smtp.client-ip=209.85.216.43
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-36b9ec98144so2066771a91.1
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 09:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781456251; x=1782061051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+L99sVtNytpFRVB1bghhyyea1pubOB/MzWaAimiWcNk=;
        b=M8tGUaKJAjp0wtCMJggOjcw6B2eogFbU1JNonjo5q0U2vznvqw1TVDOXvznXH3C8iG
         qB9mzFmdt1faT2+eibuUcK2vV6D9HGiNDpr20xR+F3WC5Nkg904DaCLbHCo2mL9WY4DL
         ekJBSqo0VC/NN9qQ+W0qtzuZmCSEzk3hxGBA04wGCv2Kjp2DrFA1VCTGIjHSOmu+d68d
         xldYBLl0nRj9RF9NJqdQ2Yoe1vfu9KcnEhaUcwBy9U38cWoqHrn0xt6CJ4H4L//5b0uF
         a4D/1v+6KMp3Q4QpIKlFXRmNPxhn7dtr4+zsemPzI4M37v3aZkePFbLBzlZPIbCnRLgK
         iQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781456251; x=1782061051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+L99sVtNytpFRVB1bghhyyea1pubOB/MzWaAimiWcNk=;
        b=jmr/Rv9eyyQqvwguqnq6sCDNPacPvWjDzfKI3mcCHSMT3NKAvG7UxrC/i9Xx+JcgWI
         HkHJSjoHCIqIHOF3w+THwF7UukKfE57UbkZUIRMGC/2njpbCV58HXqXMeejT/TdE/OSe
         v+NDAvDrwx3YrR5Pwk4Kf0PIar+IPOclytM/J4x5xP+RULT7+JR6I3Y0zhmSS2p9036+
         2DkaFbV3guuCfwG4GZ+n8gSIuAD2nGoGfGmDCJ+GVTCydrmKaD9MrSzWkwD+EHRyngZm
         EmzyelK498tTpnjNdwG4El6sxgWvo7gXa5Bcpd17vKWnJ+uMUEQ2OQSWPiKmYnRC2idr
         ktSg==
X-Gm-Message-State: AOJu0YzFinEOTlMdGreuFoBMVaP6ll31xOIFZIj9/2qRFI9oNuPuCAYn
	Aa5h3jSN4hRAwo+wEpTI4XgRatO5f+Ch9ItwEkGpW5ewXOw8sN6RObq0qt+F0P+J
X-Gm-Gg: Acq92OElMUS8Ov+K12XzQipaA2+QMFGlgrKisWwyCwffnETVRC3BHX+wqvBEnfB3fHA
	eU1+RYcNUsa/OCozz8qZJKRPu4HPkKdJyLNIt5e8xajEoTp2KpWMEb9en/fCVKWDDguYTZntovG
	pPNfNhQB0p49WJt4c49AxfVFbiOCr3ntn/QFXM7wpQYxGh0jFrDCyHVr244u64czLxJyoNk2WQK
	s4s57vFtajGsGSbOX2sKLFDKsRY/rDWHp5/HPG7WLqrY92OPLc5S//CBQeLQJchBY7qsuFVhDtT
	BeETfGsuQNioYgFncvPbUjoV1lfIPuPUNeUdX6oBf1j437kh35AA/e4carfXpEtfqSZStCZ9HxN
	jlenGR2eyyoFl072cwcShuUgFOBAEsaG+SWfRbi9D5aE1pvsTfLS0qbCFdJhMzbjPlGUsJwnIS+
	1hYOwe/i6mWnDWDRnjZrES5ycVC5GvTJLVDngJvSsKdgsYAqoiieam
X-Received: by 2002:a17:902:c942:b0:2c1:ef9:450e with SMTP id d9443c01a7336-2c41216d3f6mr123255135ad.27.1781456251045;
        Sun, 14 Jun 2026 09:57:31 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5590sm85284025ad.14.2026.06.14.09.57.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 09:57:30 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/22] media: platform: rcar-core: Add missing media_entity_cleanup()
Date: Sun, 14 Jun 2026 22:25:49 +0530
Message-ID: <20260614165630.3896-13-birenpandya@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ragnatech.se,glider.be,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64818-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:birenpandya@gmail.com,m:niklas.soderlund@ragnatech.se,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B09A76819C5

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/renesas/rcar-vin/rcar-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index c8d564aa1eba..a3952bcbcc60 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -1250,6 +1250,7 @@ static int rcar_vin_probe(struct platform_device *pdev)
 	rvin_id_put(vin);
 err_dma:
 	rvin_dma_unregister(vin);
+	media_entity_cleanup(&vin->vdev.entity);
 
 	return ret;
 }
@@ -1274,6 +1275,7 @@ static void rcar_vin_remove(struct platform_device *pdev)
 	rvin_id_put(vin);
 
 	rvin_dma_unregister(vin);
+	media_entity_cleanup(&vin->vdev.entity);
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(rvin_pm_ops, rvin_suspend, rvin_resume);
-- 
2.50.1 (Apple Git-155)


