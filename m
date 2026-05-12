Return-Path: <linux-media+bounces-61322-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNnjA6aPA2qM7QEAu9opvQ
	(envelope-from <linux-media+bounces-61322-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 22:37:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AD7529626
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 22:37:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 667223072D57
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 20:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44CBD3C661C;
	Tue, 12 May 2026 20:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YxvBYi6M"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6026A3C4554
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 20:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617778; cv=none; b=TYbpAZAHDivTM1Gs4UOdMe020tePgXV/SfYkfS7/c7Y4FT88R1jRzyCtrnhzeZAo4YuSzCwNAdRz8dfHjbDnpykIbzc8x4gf9E+sUEwzK3Ugy47Wtj50K+EbzrI+FaKtFSyR6M2dI4kQtl3Z1EiLe9AcXXljgHp2yh2LtH4LkMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617778; c=relaxed/simple;
	bh=9+d9DA+2u9lo4UNQ8lVccw1/tfPriiuFVSc+pacyDTY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EplgVE2mAGTLkg79wXjvQqNAWnxpQEpXEtK5vnBEpfaAzm655z7HuObFcMZHFiB6h1xm4AnOPzuRYYt6BZUYRJHI01u4Gj9vVCfvyewj/DxCdTikFFxJuyT8q6cQM3OIJD5D1dBYuwmlZ3Mt92zA5s1dFWhwzc/0xlNmXQJajP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YxvBYi6M; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488ba840146so53775275e9.1
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 13:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778617775; x=1779222575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=718MVFj4b+rdA+Skqd/sKif3e/MndwJ2n/ALSewbJow=;
        b=YxvBYi6M9XLBJBy7MD9fnb0zMZPGBysPGCUmTW03nEr2Y/tcmUFCxG0cHOA/ao1dGL
         etuxtoCloTOmbZ0Bx7OgyuR2++aoZcUxvhvNHe96YyDql+fUKq2rv82mDkTeTNf/TJk1
         Co2OWKdyXpLxZ7NB9BVmf1h8nhateaNHbp6ZxRYlm4BUVBWJxDMQfMFT387e+bPV6fPC
         cLsC5gak6EauTh+CbNxhqw9EobkeVhW5lb2hrbfH0p24CSc9uWlN8+I/0SzrXBo8Re6G
         dv5tT/h8cObHAHjlmMCHebrT5yaseXUQHVOlxrUWIjYP2djUkhYLnbtps/bJOle72ufG
         C4CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778617775; x=1779222575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=718MVFj4b+rdA+Skqd/sKif3e/MndwJ2n/ALSewbJow=;
        b=aLfpPOxUoVZlD3WWlf50R+33osrAfSk8LHzso2NoIa2C9ibeL6P4hKxYJCkxb+ekV1
         aHFy/tFdPyxfzDBNXlF03xe78OCthkT2ZctMzAoNdW8kao65NAE23THxqTYb5FOnP9bS
         7Oykefr5OVaJl5OT8pyTEUi7L/YZq7TqGNlCgEqb+aHRXK+GAcndp4Q87vzWzCW8rx7P
         lT5XZ8Gnc5xW5XNhwX+FhvhX/VW+NXVW11YHpd6cetICewEXkYldHz1WjgQQvgUL0x9I
         PkNyjAjXhrJElLU1pXyHMqOtnijoLWk3o6zABRaedE/k6pCTazdcIgPgElxll+uOGzZB
         zyqQ==
X-Gm-Message-State: AOJu0YwuRuhvYvwBVgwWdg/9RhdMhtMrQJa+rqxY5uxTvKLaBDKCC5UZ
	C4ZfJI/LKxMv1Gu49n3dXNp5VgS6GkG8zf9DnLNl5tidVbkH81uHyBxO
X-Gm-Gg: Acq92OEcM5UfAtMrrZ8pHIHGdczHJXUlSvtkfdaE6M9c0lFyVIQW73J1uiDtzCEu8w9
	ObBtEE3B9SlGjwQn0uVlrB9aPrmETbUm9Bjy54Ap8Nx9G4xiYmt+L4JVvYOrSUZ03hblDk0e5DR
	r4BXFw0D35631BYmsdQaHvxAEOGzs+eHCs2CYUWTBVuy7A7Kt50oBuBZ27oW8ruRsw86N3+0P1S
	KxCPtKZzRQQqvkXR3CLixOqKq7YP+oTi4J9bm324qcEmEEfI1JPHTuJfb5NZcYgu6fxOybe5YVW
	qMxVmNn8Dxj7Y767RyhnHrgzJ/NhKPdrVaQaftqWjnv1xk07nxsAPz8olauMk0XGEINmyCDgRSM
	MYj9pR9Sk+9n0A0CT3mn+49sUYQXQloC2Zi62oO2IJmd3n8EKRQtBd5HyeY+/WqpXD2p7WdHxB6
	SsnO5S6gQIkGVQL2syowMPlBrhlgZxiaCCAG6kdJpDJYLJ+gnWQETlr713X5jUA9KZ/F3/AN89D
	P4hSGFt/OTBt46fMRrrVnHBjitT6MXtMwQ=
X-Received: by 2002:a05:600c:4ecc:b0:488:ac01:72b6 with SMTP id 5b1f17b1804b1-48fc9a391fbmr6177355e9.21.1778617774632;
        Tue, 12 May 2026 13:29:34 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:77f5:545a:798:321])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d27d31sm36899415e9.8.2026.05.12.13.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 13:29:34 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: rcar-vin: Enable NV12 support for RZ/G2H
Date: Tue, 12 May 2026 21:29:31 +0100
Message-ID: <20260512202931.1051379-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E1AD7529626
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61322-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FREEMAIL_TO(0.00)[ragnatech.se,ideasonboard.com,kernel.org,glider.be,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The Renesas RZ/G2H (R8A774E1) SoC supports outputting NV12 format, but
this capability is currently not advertised by the driver.

Set the .nv12 flag to true in the rcar_info_r8a774e1 structure to enable
support for this format.

Fixes: fe98df32bd9e4 ("media: rcar-vin: Enable support for R8A774E1")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/platform/renesas/rcar-vin/rcar-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index c8d564aa1eba..e16b33096fd2 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -925,6 +925,7 @@ static const struct rvin_group_route rcar_info_r8a774e1_routes[] = {
 
 static const struct rvin_info rcar_info_r8a774e1 = {
 	.model = RCAR_GEN3,
+	.nv12 = true,
 	.max_width = 4096,
 	.max_height = 4096,
 	.routes = rcar_info_r8a774e1_routes,
-- 
2.54.0


