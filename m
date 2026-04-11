Return-Path: <linux-media+bounces-58595-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eF6jNSC52mkO5wgAu9opvQ
	(envelope-from <linux-media+bounces-58595-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 23:12:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E2A3E1B6A
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 23:12:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48CF5302DF56
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 21:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90AE93BED40;
	Sat, 11 Apr 2026 21:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U/1c1C7v"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31732FFDE3
	for <linux-media@vger.kernel.org>; Sat, 11 Apr 2026 21:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775941897; cv=none; b=rch8Cl7ATuYpoDdwRvxIh5c0P8uW/4Mncj/Eevzlp1hCbmwyPdo7VDCbYf4t7LP5fF+qR5NwsvLESdVWpionOn2Mjme1wFefDsZZ4ES7eG7O+2mfZFp4gUw35qsjq5bivmbSgOIm9NXx+4N1mM7AKt4zB0lq2lbDfxU/bOO8XmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775941897; c=relaxed/simple;
	bh=nhMSujJJRVBmSCprErQbzFzUxp1Z3dBMo2c0e3hpQHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=baPwLGfJSU2KvMdr3kl6z1itQSkIMZvzTPwR3Ym1xPSRhWJ+kxImfvTiN+38dLYDKpzbvKr59D2qWdinbGbBfxDr1EU2Gvxlqao0DWzY3OOTinJKjx/ymEauomtWO0hQf+9rxg92c+9qTyOJgQu/PzQO8ivUmzV5nAirSEy2d9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U/1c1C7v; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-670c6c6e64dso1859833a12.2
        for <linux-media@vger.kernel.org>; Sat, 11 Apr 2026 14:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775941894; x=1776546694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jwSw6IsbUHDab63/LFAeDKthmZW0BMxAR2iJQycE4LQ=;
        b=U/1c1C7vZsUELJS7q8baHmiRUFvreL5/FTVnz8/XAyUNAkE0CNO0qHJgWUa4u1xHJM
         RaLQaCTKhQdhaHZygar7QRgC5X2Py58oOLCPHUQw+5E+4kY7VyqhgX9Tr8Ypx0jvyspW
         sm2L15z/SIOhsNRkdYKW5nP6N4d0Q6JU+/Qd96ZtGf+9du6ySVBrlaL4nFbfjMjwJV2q
         /7map1upzLTmS7f5sMtDGwa99Gpx7SEV1xhuSmLvzMm8C8AOVSVfKo09cVKrVyVvEbqC
         USv/zxfyJMmgT/JwuI9/3CR/hFTmknPOEBXWedorK7U74JppUAiphC0sTeoQBgr8vjor
         nXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775941894; x=1776546694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jwSw6IsbUHDab63/LFAeDKthmZW0BMxAR2iJQycE4LQ=;
        b=WpXY0GvIxXHVXOZ1yOoWUuxcu15SIjpb+Vu4AgAQlRmSff5gpNrNw5OiImec7IUyNC
         16P2d+MFqMBNsJkNZEiRHFi+NOXi+2ndgDSNy5BXZqIIToLlGVmUseNmPaCeQ/hQ6NaC
         1WLatBqBq0loHlZJmmSdPeyukaH+uGMRnQ8OKdEnCHiCIonQ8Vqd+m81pFBQjzIhLVCj
         m/9WkHDghBorsyDQer0lWHDooTuV0PIbvZFTkUVt7QzLB4iu367X4vSzv3GNfVR5g7kB
         cWGXA5trwKfvefqVz1Nxi8ZTdFRVKPi2rkB3xmDoCJDKBJMmJphi44pxn4Noolio05wF
         BqGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbTdtMX8c+UAbx75pE8iN7KhxrAWz6fitHspKqcBIcH8De8BrlmKmu8U6W+Rf7DhdxMNiyhUHu4V7l7A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjcvls1ZC7fErSvxZNWwzNPtfBabQwmG/IWalWTy1TiRunLM69
	HbRx/lZFJ1d3Oo3ZWlXY1hG2UV5TTS4Lf5Cz4lcrQvD9hZHfF+CqoVhT
X-Gm-Gg: AeBDieve33K4a/LmJkI5GF0P2rqjK0WEnCl4SZe0dqa89QLLpO1ZIyqs9cpq0tyEo9+
	A39KBuN76WA1aUcH7dwNwA/GN+cn6j9uCh3n3vuBolDmXutlPzr8I5nYyFyJFjjP4bAetAOzf7J
	bEpFi2ghVqBoCZniKNcytjPp8a70tXw8AHIGkEiU2ncjCAMcfFaXw/gCjyCI2viUnTnvAMy5u+y
	Rez9EC1VZ+Efr4/TRu3fr7VD6HdsCuUQz5w27MYS1aSKpbRqckVBbpr9bM021zsedw4+dh4wMLi
	pi0Hkg6LlIxXaJZ6t9n3BN/GICtm1hyV0VjIdVEcmy6ac1sAOolfP7lRuG8DnwGd8EGnEAR597e
	AtnQTuUFA1s+ecO2RFYliooeL0TTtgqD9GRZioGidc4Q+aFVHgbDs1r5T77vULwd03J1EzLSi5c
	Xg1GvXIzXxOaINRP21HF+PThRdIMutZBIOG+YzEKfzfaxtXEEodn/Z0MhW887i0DmDMtV08hqPE
	gi+b07dOmnM12jU03QTyDJ/rsdE6ocbmrVQl07i7WC4UkU5k8kxlHh+9SMEFnRhtmZ3qpj9CUmp
	jLv/6Q==
X-Received: by 2002:a05:6402:1f4d:b0:670:a401:c977 with SMTP id 4fb4d7f45d1cf-670a401d3fdmr3133815a12.25.1775941893972;
        Sat, 11 Apr 2026 14:11:33 -0700 (PDT)
Received: from ahossu.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670702eec8asm1511110a12.2.2026.04.11.14.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 14:11:33 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH 2/2] staging: media: tegra-video: add missing error checks in vi_tpg_fmts_bitmap_init()
Date: Sat, 11 Apr 2026 23:10:05 +0200
Message-ID: <20260411211006.150782-2-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411211006.150782-1-hossu.alexandru@gmail.com>
References: <20260411211006.150782-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-58595-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[nvidia.com,bootlin.com,kernel.org,linuxfoundation.org,vger.kernel.org,lists.linux.dev,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[hossualexandru@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 52E2A3E1B6A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tegra_get_format_idx_by_code() returns -1 when the requested format is
not found in the SoC format table. vi_tpg_fmts_bitmap_init() does not
check this return value before passing it to bitmap_set(). A negative
index converted to unsigned would result in an out-of-bounds memory
access, corrupting adjacent kernel memory.

Add WARN_ON() guards so that any future SoC addition or Kconfig change
that exposes this path fails loudly rather than silently corrupting memory.

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index afc7327ef318..e6416ea8503e 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1025,11 +1025,15 @@ static void vi_tpg_fmts_bitmap_init(struct tegra_vi_channel *chan)
 
 	index = tegra_get_format_idx_by_code(chan->vi,
 					     MEDIA_BUS_FMT_SRGGB10_1X10, 0);
+	if (WARN_ON(index < 0))
+		return;
 	bitmap_set(chan->tpg_fmts_bitmap, index, 1);
 
 	index = tegra_get_format_idx_by_code(chan->vi,
 					     MEDIA_BUS_FMT_RGB888_1X32_PADHI,
 					     0);
+	if (WARN_ON(index < 0))
+		return;
 	bitmap_set(chan->tpg_fmts_bitmap, index, 1);
 }
 
-- 
2.53.0


