Return-Path: <linux-media+bounces-58612-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMtbODzK22nzGgkAu9opvQ
	(envelope-from <linux-media+bounces-58612-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 18:37:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1783E4DE1
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 18:37:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C8AE301B91A
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 16:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E1A52DA76C;
	Sun, 12 Apr 2026 16:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l2mATZi0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF706280CE5
	for <linux-media@vger.kernel.org>; Sun, 12 Apr 2026 16:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776011787; cv=none; b=S3dX57HCEYLBT57LJeQJ6V/a1NIsgzqMBNw1f1hvF7B8CrN9AT6Lt/WnGkIpjgnr0wKAMjPgXKbTAaiTiYbov30OJsdVJghYP7BIttm+b9A4zfZSUHYaHUwuLhwSj8UKGYO3NPVrboS7l17NJLBNlo6SqLtwe8dIsDq/MOWOPWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776011787; c=relaxed/simple;
	bh=QrDJhhk0twAoCgQb0RphuWTv0vbxFxQEpBvzjFSkNow=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SIc7K6QrqDs0nDNepE3Rvh4slspq2Zu5YAgPp3pk9OteHU4KR0wjNkNsH+CahuuEUQ6BoPBPghXBnUree6oe0i/AGuT5RpfwtkMS6EWWMu+9Fbf7OK913uS+zbfcyMPmde+DDvpg/fniOB8EoIJQ/Jpi5j1PGTqPw+k6LpYWvro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l2mATZi0; arc=none smtp.client-ip=74.125.82.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-1273349c56bso4663807c88.0
        for <linux-media@vger.kernel.org>; Sun, 12 Apr 2026 09:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776011786; x=1776616586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/9Q7XW5fCWd+W/KHOAvk90/HILYyws38daEBVyb/sVw=;
        b=l2mATZi0OrSws6PqfWE9zYTMpcD/sk6v7AL/1rpXpBrt9mrSqNHl0zyfeRWEhThVsm
         sTazkxNvRBdTLFPCTLoeqOM4tREWA1ZBmSzuXWk7W/+bMcua+1ESpR/DY5V079oZqJ2+
         GMnXox604nGvG2Iy/deES6RJ3TaaIBY7DncGkMetI9ZWm9fSgnTeDb6tkfiNs/z0ZLOr
         2naXwW4cQ/Rmjk0wWHfdRTe/+J4tMJrvAJ0xEvx/6FU/VDEZwvmJPZXgCQ+gl/dfLek7
         zplPDL7Iowg7HVGhPDFXVuFhY2ce4PrZzOjdaFBE5sISUW1R5LBZghQn6mQCAoyPXGva
         iI+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776011786; x=1776616586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9Q7XW5fCWd+W/KHOAvk90/HILYyws38daEBVyb/sVw=;
        b=swdCIR8UZPqbplKMGfww0LGV1++FxHlELsVwK7cFTQrcpXTvG7n+Lg/mcVoLo8yx0B
         e6aEAFtnaYkMTeZse4VPa0xo+4mjJ717qRET+zYpjGA9BXNt+i7yRqqvGJ10xAOMhuX8
         2hKzY0WVA1DaDK8nYRnQgoMIptCnrD7pNCs8qiPIav/K+2DZNwBOZDMKMgsQic75HRYb
         KHrEp9AbaabLWbC0x1/VF1pNYFZy4oufPMAviRzSGr+a7y40odkUgUeRvw6hNJVJxRRs
         4kMFi7ZiVUpUTmpP+Fj6PlW3tSnpwRkfRkFN2zYZCIpnu6qxOJxdMSw63OR+EJRtZkTy
         IGCA==
X-Forwarded-Encrypted: i=1; AJvYcCUTXoaNK4c5vT3Gu+kRahTfcKsHjk1mpC28oi77nllyMgBOocTCIrUFMMj56baMU7YqWgJr+bMVMGvfSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgx+T5BX6z5l0ZtmDRbgHuFUwtX7L5lDVorh0KNEqw+TkAZRQU
	z2TPl+sA8cf341YkSw1VvBZY+gkcwXa0meBdmDYrfuYn+SNRT1/iFyj4
X-Gm-Gg: AeBDiesDjx1ZTxrvtsuyiy1N2THEyqvVPzrU+7GKmGCPXR1VXxy6CojTEq53r0fvNda
	fdFg/DY3stZvldoYVjthSykA3kb4n0d8rQdmqUrbsu6Lmu7lCXIK5OR31ET5Imry+TLOwHOtJIy
	UF/Yz09X0sCRmyQDJli+0Lzi/M7xtErN5pE8ZIjKG1zKlzjFfaih91eAAlDHscX9tFk/1pezQ2O
	phSZdoYM34SxbIn400FzIFzjJHoQiObHHs5ztVaSgwWfCgq0rq8TjVu4/cSRD9RA04ej1adbISV
	ZPdLQr6W1sH6L+UsFbFiXLeKYFBVW62RV7KJ6ATx6D2ErUR4tQTk9mag4FxgIPuMywGN/+uO0e+
	bKn6uhsdcafgEjpjlXiDr1t4lcomrrq5plBDc1Ktd8s+tGTZqe4GWZJKoHa7oD9Er09N7qbC/MW
	CJnYBk4ei//22pki7t4M7QpsKyep+rqICCuDABFND1HCOZmf1jlDPTP1s=
X-Received: by 2002:a05:7022:6a9:b0:123:3488:899f with SMTP id a92af1059eb24-12c34f14188mr5695800c88.32.1776011785777;
        Sun, 12 Apr 2026 09:36:25 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c34acb077sm10201730c88.6.2026.04.12.09.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 09:36:24 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] media: tegra-video: tegra210: ensure PHY is disabled in pg_mode stop path
Date: Sun, 12 Apr 2026 16:36:00 +0000
Message-Id: <20260412163600.29925-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,bootlin.com];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,vger.kernel.org,lists.linux.dev,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-58612-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4A1783E4DE1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tegra210_csi_port_start_streaming() enables the CSI PHY regardless
of pg_mode, but tegra210_csi_port_stop_streaming() skips disabling
the PHY when pg_mode is set due to an early return.

Remove the early return so that the PHY disable path is always
executed, ensuring consistent teardown.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/media/tegra-video/tegra210.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra210.c b/drivers/staging/media/tegra-video/tegra210.c
index da99f19a39e7..57b5da11da93 100644
--- a/drivers/staging/media/tegra-video/tegra210.c
+++ b/drivers/staging/media/tegra-video/tegra210.c
@@ -1095,11 +1095,9 @@ tegra210_csi_port_stop_streaming(struct tegra_csi_channel *csi_chan, u8 portno)
 		 (0xf << CSI_PP_START_MARKER_FRAME_MAX_OFFSET) |
 		 CSI_PP_DISABLE);
 
-	if (csi_chan->pg_mode) {
+	if (csi_chan->pg_mode)
 		tpg_write(csi, portno, TEGRA_CSI_PATTERN_GENERATOR_CTRL,
 			  PG_DISABLE);
-		return;
-	}
 
 	if (csi_chan->numlanes == 4) {
 		csi_write(csi, portno, TEGRA_CSI_PHY_CIL_COMMAND,
-- 
2.34.1


