Return-Path: <linux-media+bounces-31272-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B80AA06D4
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 11:17:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C8F43B181E
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 09:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33ED12BE0EC;
	Tue, 29 Apr 2025 09:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z5C3idTJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1942BCF47;
	Tue, 29 Apr 2025 09:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918192; cv=none; b=Ww3DF5IkEHb71p4ryyB+htJ+lFd3bNuRRDce1R5KhEFd7yx1xr6MQBIDHfCONuNb+hfVpV4JwMfmUBynBFb7v3RL0B4ra13F7hozU0/U9oxeKjYo8lHRJv4qlx9q3OmtDD2D7b4taiUAFA9y2J3G/yRVo0PMwaHSxxJTvq2CO14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918192; c=relaxed/simple;
	bh=KHAcCzi8r+gLFX9kyOF/uZktb4VUCkbEGhq0VC/nyZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fWVi8WxhF7SqGs9eYZfduPOR9ssTQADKfKyL/RCo80nRSedlVJTj4YXAKGDRBvfjKYQttQZVstk7k0/UfFRoRrK40mZG+ESpwEwy7I/ZarEIGJIdgtN5Y3b7gqTs1YjdlqIrZwk9VyOf9ppU+uTOE4PtMNOetFiTHAaK9GBE9Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z5C3idTJ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso28086895e9.3;
        Tue, 29 Apr 2025 02:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745918189; x=1746522989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KeJgTmuZzCKwKoJc+TwHzXYTTIM/SKnA9dAgPlVjns=;
        b=Z5C3idTJ/adoqITifC62KxBsxKaj96gHKeTI8XSZkH/ZGbdpotwM7Z9c46MVPUqkLX
         6TXdUkln3RfogG8jYJ3j4iTNdKCxXLiGQuXPca7173ON2NVbyh/SaBhnh7PDHQu+AOf2
         SvY7kwXQLKBVkxMTToBT7jlAifw6BUqskSNyF7j8nCB03OyB3iBN9SpQjjvll1AZ8od3
         /WFkPqifEMTCrelKLXs4DRzDfICq1EadkQlT2W4pDn8czn9pidgo7QSClAfxCGoZCAoO
         NTEV1nfYTQhH1mnlprPlImxcFDR5Km/ot32XzQoFUBnTRZSj+OhzRGTPAamn17qeIdzC
         y3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745918189; x=1746522989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7KeJgTmuZzCKwKoJc+TwHzXYTTIM/SKnA9dAgPlVjns=;
        b=QWZBxkELQDZOfJqvJb14H6X2Ra7+OREo0XrDjUUFrau47+NUBUtDZC6ArPMaG78iqj
         9xmackxL1FIIaYkXdlNduL7JkVkn9ynBgmd5e6QFoaAr44pZ0jcQ4bCT7BJGXZnswMUh
         jVBS9JuWlgueW55tMzpPGlgCKfKMWfHDYtecIWrNYoJsrrAMjZG0gpLBUdNyrRE8qWw2
         iWkpqJd6YIZ0ffwD9irfXGbh5MJ4/83Zr1gwyii5U5W/h1kjOrr+qrQiOSaBWyOTFWSa
         4QPKlGY7tobV9gsSfY29icQ1YpEC/ueclH7jcG57S9NYzAG3/bvs7lhWw4tLkGlXnW3H
         xwBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVj0Yhl0V8MqFlsiDT6vCfd97L8kBXFMrvo2gYeNPKO/yN1EEhDJCyPkz/yB4GmfPeAq2w7qFqHgVPdyvQ=@vger.kernel.org, AJvYcCXTpl+cyIxUn2j0S/V07n0Vgh1ZiMbeEThvIUPaP4Cke4VrOGnavegK25uP4olV/AR/c5e1CeIWVdPrEGKuXQlGK+M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtDXUSPtCUmnvnuh8FizlfPq5EHYu5vhItmW1FT7pzvpX7GChC
	+nlEpdVRivLqGxSQiKtz0xwy6N8/U3R24ZWYjUPyoOeSU+YF1AH9
X-Gm-Gg: ASbGncsKGhCqvgu1KItPpxW6I0iIOrrzjcp6qn3W7bxXxkZd1JyuvRNWicqB6/G0s2r
	LQTCZmJjERKvDFPgJgCfcSaWakfnjsMArTreaDBqQiVMWH+sPnkiqtzBoobzi2GSquwPVAVnZpL
	xwbJjZDAyEGRcmFMdMFntRW09209mJ3QUIT56jfq8Q6lErwI0kUpGCo6lvCoNxaUL4svKOo3XKK
	V5WaNDjT5WXsmkLIdtvUtXv9qFZhRRDGvDFwG2ko25zsOTvE2mjv7O0QcrmaCUj3ELmhIVQ5Zw+
	0/QaF33mpIyJPtO5ILuk47Hr+/uKqQ8WTspcojA0qnM7q5B9ULQswFh73rPg2E0dT5O81RR6181
	u
X-Google-Smtp-Source: AGHT+IE+oTitP0kg3NKVy6ddhQBEno6bUB/yIK27P24vu1rE3FirVxhSn8Kcjounaw0OGXazop/pcA==
X-Received: by 2002:a05:600c:3c8f:b0:43c:f0ae:da7 with SMTP id 5b1f17b1804b1-441ad3a1e0dmr13495505e9.7.1745918188815;
        Tue, 29 Apr 2025 02:16:28 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:2ea7:2f5b:5fec:29c9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a536a1ddsm151103945e9.30.2025.04.29.02.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 02:16:28 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/2] media: renesas: rzg2l-cru: Fix typo in rzg3e_fifo_empty name
Date: Tue, 29 Apr 2025 10:16:09 +0100
Message-ID: <20250429091609.9947-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429091609.9947-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250429091609.9947-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Correct the misnamed FIFO-empty helper for the RZ/G3E CRU. Rename
`rz3e_fifo_empty` to `rzg3e_fifo_empty` to match the intended
naming convention.

Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
Closes: https://lore.kernel.org/all/TY3PR01MB11346E57A3DF8D8A90A405E4686812@TY3PR01MB11346.jpnprd01.prod.outlook.com/
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c  | 2 +-
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h   | 2 +-
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 5fa73ab2db53..db27819d8200 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -366,7 +366,7 @@ static const struct rzg2l_cru_info rzg3e_cru_info = {
 	.irq_handler = rzg3e_cru_irq,
 	.enable_interrupts = rzg3e_cru_enable_interrupts,
 	.disable_interrupts = rzg3e_cru_disable_interrupts,
-	.fifo_empty = rz3e_fifo_empty,
+	.fifo_empty = rzg3e_fifo_empty,
 	.csi_setup = rzg3e_cru_csi2_setup,
 };
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index c30f3b281284..56feda6e6207 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -199,7 +199,7 @@ void rzg3e_cru_enable_interrupts(struct rzg2l_cru_dev *cru);
 void rzg3e_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
 
 bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru);
-bool rz3e_fifo_empty(struct rzg2l_cru_dev *cru);
+bool rzg3e_fifo_empty(struct rzg2l_cru_dev *cru);
 void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
 			  const struct rzg2l_cru_ip_format *ip_fmt,
 			  u8 csi_vc);
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 3d0810b3c35e..ab35caf97c51 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -323,7 +323,7 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 	return 0;
 }
 
-bool rz3e_fifo_empty(struct rzg2l_cru_dev *cru)
+bool rzg3e_fifo_empty(struct rzg2l_cru_dev *cru)
 {
 	u32 amnfifopntr = rzg2l_cru_read(cru, AMnFIFOPNTR);
 
-- 
2.49.0


