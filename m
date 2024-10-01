Return-Path: <linux-media+bounces-18943-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E06298BF4E
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 16:13:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39CAF2810B0
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 14:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2728D1CB527;
	Tue,  1 Oct 2024 14:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nan77YaG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1091CB316;
	Tue,  1 Oct 2024 14:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727791796; cv=none; b=oaquWCzY4p/fx5ValALO17gbQrNeehSn/C2SNj+5wzGAb4fxM2t2kBHvaShyQejdEP7lgnNmBaaEBJpZBf/eQGTMj/beM9kQ4W7TLzKz+ZZV+KeJRuFurM8JG6GG0Kel80M1I4NvW5nPcpLB5BRZdIX3DdMeVEg5WgRg8c2gs3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727791796; c=relaxed/simple;
	bh=SJTRTbWmnZwCGFQVnRVMdb5VwjnbG13f5ZKT+nULsnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HqQ86rlFVKXTjYjK9aCAhbN8VZVlLkc6UqgWu1B2RZELsWcv+UP5/SNvNROE4RBnLrXbmtTf+yFKEsjx4KTVD9ViCR0k1l4ojC0zUfbsqKJbHI0FWPKrHGg69LNAs5Hx81eXao3fOtqgeKIHlfjlC7xomDhXqf59ikThvvcU7d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nan77YaG; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a8b155b5e9eso24950466b.1;
        Tue, 01 Oct 2024 07:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727791793; x=1728396593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ZRYacs3XWBh6ijJlsVrmfu6VX8ZiHszX4t2XbLm/zs=;
        b=nan77YaGgYYJD9rTJQRg+1Ir7lp7Ckhcy6BOynnF/IebMAkFFs/DxPqg9gnhTygqjj
         MC0sFU78iwl4TkxVcFDSLQ5qkloyHynL4PtlbmH2iVgG9VydOM8FvvzUw2Ra7EAF01XK
         TZ6QgZZzaLpcsZuGIAQp5eBPcA/jH9AXH60lY6oUpg1yd/uE5aETbBFrKRX96rlpU8kw
         7GAYx9RVqb2GhfBf/kxlWh0d+nhZ1kbbm3j5/CIPMJ9A9648przJu4sVeJEAYWLvg2P2
         fA0xiBiHbc5NqZDhRmLQPC0obuWW2XhxX0x4y9u8JiFEcf+qKLeq/J1725GEId5EVie9
         lLgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727791793; x=1728396593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ZRYacs3XWBh6ijJlsVrmfu6VX8ZiHszX4t2XbLm/zs=;
        b=VaDnC81UN1fuAn4uFQ65RVtXGZBYKQ+6XK0vG9oZEevQJyT9KkXP3TQSuEqhYx3d9B
         iI1t21yKnOvbX8yHUclMNgv7/7YIxdKiab/+38hmnI+oQILcn80qdAmadLrjelkCx33S
         6oQ8Njuwk02R+/Ygfh1bNlS50p50fjtqO79U3hqS6Ibmr5f0Y02QoQNcwwjSXOQ6g9U2
         V/ueM0LTV+5Td4kMS1CVod/BZxy+wN51j4/eD88NRgFn5nufgXZpE4yQLVVqVeH3ULFR
         MXPbVjrg3MPzrdSDUTRDthXu+J/PA7YV928FiY8zBu5QRmldEGk6zN15HUmuf39kYsSn
         V0UA==
X-Forwarded-Encrypted: i=1; AJvYcCW/5RjaT8YVnRiyAdPZp1d5sP/DZY3elh1JeUePbB3h7cYCUai7tnRzQpMhgBomikyb+K4P2L0e8GbDKYs=@vger.kernel.org, AJvYcCWijXE/Oi8VscBttudlTzDP7tqM0Rqx8obQdA8HQOF56XejFKMFQ5b3xpW2yIT2Z2E6fn1DiYLug/2UyY57p0Uj4g4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNA9EXj2ZFJulVTU7Q7iopfxfVWR7XH4BaZDe/+nL0GDgj2qhy
	md4dSmn+Bm7RbLUCMGxKreuFq+3Tv0X31CUj6tYpoe1hA53WeI4x
X-Google-Smtp-Source: AGHT+IEVk8duLih4owN395mdfx7XArQbxUcycbZDoXF/Ag6slvaT0vtMYIelFqwVakFGFrA5l0ug3A==
X-Received: by 2002:a17:907:6e9e:b0:a8d:5184:d94b with SMTP id a640c23a62f3a-a93c4ae8f11mr1812482166b.49.1727791793177;
        Tue, 01 Oct 2024 07:09:53 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2776de0sm723532966b.2.2024.10.01.07.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 07:09:52 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 14/17] media: rzg2l-cru: csi2: Use rzg2l_csi2_formats array in enum_frame_size
Date: Tue,  1 Oct 2024 15:09:16 +0100
Message-ID: <20241001140919.206139-15-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241001140919.206139-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241001140919.206139-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Make use of `rzg2l_csi2_formats` array in rzg2l_csi2_enum_frame_size() to
validate if the `fse->code` is supported.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v2->v3
- Updated subject line
- Dropped fse->index check
- Collected RB tag

v1->v2
- New patch
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 7b76d495cfe4..e21142d3b67d 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -573,6 +573,9 @@ static int rzg2l_csi2_enum_frame_size(struct v4l2_subdev *sd,
 	if (fse->index != 0)
 		return -EINVAL;
 
+	if (!rzg2l_csi2_code_to_fmt(fse->code))
+		return -EINVAL;
+
 	fse->min_width = RZG2L_CSI2_MIN_WIDTH;
 	fse->min_height = RZG2L_CSI2_MIN_HEIGHT;
 	fse->max_width = RZG2L_CSI2_MAX_WIDTH;
-- 
2.43.0


