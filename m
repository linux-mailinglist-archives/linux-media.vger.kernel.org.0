Return-Path: <linux-media+bounces-63110-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDqHDDyyGmoH7ggAu9opvQ
	(envelope-from <linux-media+bounces-63110-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 11:47:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AC27960BF5C
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 11:47:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 84812304C35D
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 09:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBAAF3A1682;
	Sat, 30 May 2026 09:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TmaGpsIX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359DF3859DE
	for <linux-media@vger.kernel.org>; Sat, 30 May 2026 09:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780134328; cv=none; b=AC8n2RIdDgwdelX1E8yh/bNUcKhhKwNz2Q4f42czY3q7L5yd1WDiKC7IiC05XvhQOZwVR6o6Qn9Q/hOK724AhqoJ2UKF3HYay90NOghgBDbbsCfyTXpumn4p5nsgz8YqxscnO06hxxStWv57WqsiB+ooXKjQ47WQ9oalYmuezMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780134328; c=relaxed/simple;
	bh=LyUfGFZW+p2oW5KkXZ5y3kByeO4P0yiGXlBBXARqQcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HW+lvojLNo4GQupDLxu8Z7IVFJKCTr4vvIQ11zPylwVPrAln7ysytVVyWjeyRN/tCh/tZ7AFZkZWoZf7gMEKrBCDt1RpUQ9UTodMqhmroiiYTUxbFaJteVrKyXs6v4b+5MPevBGYZpdE2Oghwqp2ozkZHinGFK4h6bgJzCwg/h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TmaGpsIX; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2bf1cda2b17so12737735ad.1
        for <linux-media@vger.kernel.org>; Sat, 30 May 2026 02:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780134326; x=1780739126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVc/26APRiTPbdxNs/jo+GGLcrXaHHIyPQYjeJMMqc0=;
        b=TmaGpsIXexhGH1R9Km1Kwtx+/SsypTBXVHmITwz3cC5u8zKS/wUNREyHwq4fXcO/K5
         1rKi6JhsMbKRkAnJBWqSFAFtS7dRmr4rrTut/FgSH3SAyWDAu3SxhMLxLoYfcNQZxqgn
         Xa46dovW4ElCie4QRUNRsfIKCn+NhTMTxIxLwOfavbND/1ho7DiMYMh/VF9SoiUMwVL9
         1zqdQqccxKADuOj/jxX0WFnYpbw0gOfRy2Aw1arfA2ryfx2SRu9rQeZLoUKYOudPHcK2
         ogJsEEMCxjI+HwBBnQdkVUsg2DOUCepXqZzFcZBxyuOTaZ0AN11cCA43WFjKkmkqr0p6
         M3fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780134326; x=1780739126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aVc/26APRiTPbdxNs/jo+GGLcrXaHHIyPQYjeJMMqc0=;
        b=HB30DXZ/Bt/jQEwIwCkiFNH87oX3jDu1/D6upXz5tCdo3aKZ2ejCPiquu9qLaJ6YZt
         rYgkJyK+2rZX4WJFY/KZu6FWxPiPGFJcfIh91JKmg/vpyE59q9d9afcG0Tz3Q0ceQqiT
         xD54OESPB3MuZbG3pMuabl8l0X0Lwk5i2N0lI1JwlatttxKJe1x7rlaw4amCiZKQQLUU
         F2RYNpuFVLPwQqYfpsUR2hENGl+QxTl/c5KsxYilnyeHW29n76OTCGUyR9Vz1YSb9Z+v
         rg8XDON26RzcreH3GrqFJTunJ9TfZmfx0yVMSumkVEnGrI00N9+V3pHMjsmJPqAemhxX
         Y6Vg==
X-Forwarded-Encrypted: i=1; AFNElJ+PE3xuSU3+IjeeTBGtlELhWu/4hVCZqSP5i53cWd5EODQr977dedIVgXSppA75pRG67X78xtmnpR+IRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YytCeg5eey+hQJX0/b2YafoFMjI40J4igN+OktUw60lw7WyUgXV
	4f9Gtb+alFgEqx928GKYn2oQUruJoM7siwil+IYfiY1sIUU452PPNiST
X-Gm-Gg: Acq92OGUjSQ+zzYPlBlSOdGbvCasHOxQbwDqPME/OXSVRnJTBf3yvuJNlxsbi3LtHLt
	yW4No9+m4ohfYtY9lqfYbBAqarURvQrGbbSDVLwAAv6Tbd7mfNQhB1Z6o1R8v7E1p0+2NTsaB26
	GP/A3M9/zb7SU/H2X5teecAINGFS8RA9uAMqJuPTXocvyzZvmZECZKN4/zTmikeschLcSiKEhx3
	aDwAZrJGb1q3EhGlxGSuArkYGiZVCnkr6+u5j3jnShiSUb1fnSwlFQyAi//ZGZYNAGtg1v7wRoI
	Cfbya3uBUeLtfp3O44RqF3fG1O2peU05Yw3beb2L8ixod5GcbD6r6yVB97//kEUNhWc2Byx3J+0
	RHcQy22Nw/UdPBMO6UQYE3Tp0qf/KGtcEowmIGRBLWInBZlXQ5nBkyI3TgdL9LeqbUto/aJlw6i
	1fdO1PQo6ObcssQ980XjOxZzaJWllOwyA=
X-Received: by 2002:a17:902:c402:b0:2b0:6068:4c5f with SMTP id d9443c01a7336-2bf2048b983mr72327425ad.8.1780134326539;
        Sat, 30 May 2026 02:45:26 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e700csm61529945ad.10.2026.05.30.02.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 02:45:25 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [PATCH v6 8/8] gpu: drm: meson: Fix DMA max segment size for DMABUF imports
Date: Sat, 30 May 2026 15:12:54 +0530
Message-ID: <20260530094326.11892-9-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260530094326.11892-1-linux.amoon@gmail.com>
References: <20260530094326.11892-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63110-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,baylibre.com,googlemail.com,linuxfoundation.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,ndufresne.ca];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linuxamoon@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ndufresne.ca:email]
X-Rspamd-Queue-Id: AC27960BF5C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When using hardware-accelerated video decoding via v4l2m2m-copy with mpv or
similar players, the video decoder driver (`meson_vdec`) exports contiguous
memory allocations as DMABUFs. When these buffers are subsequently imported
by the display controller driver (`meson-drm`) for rendering via the GPU or
compositor, the DMA API throws constraint validation warnings.

- Call dma_set_max_seg_size(dev, UINT_MAX) to allow large
  scatter‑gather segments.
- Ensures the DRM core and canvas allocations can handle
  full sized buffers without hitting DMA‑API warnings.

This aligns the driver with common DMA setup practices and
avoids failures on platforms with strict segment limits.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/gpu/drm/meson/meson_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 49ff9f1f16d3..8570add8b831 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -247,6 +247,8 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 		goto free_drm;
 	}
 
+	dma_set_max_seg_size(dev, UINT_MAX);
+
 	ret = meson_canvas_alloc(priv->canvas, &priv->canvas_id_osd1);
 	if (ret)
 		goto free_drm;
-- 
2.50.1


