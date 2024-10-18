Return-Path: <linux-media+bounces-19870-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CD89A3FE7
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 15:37:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D0E01F258B6
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 13:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D96120265F;
	Fri, 18 Oct 2024 13:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/B3X4Ct"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CA22022C0;
	Fri, 18 Oct 2024 13:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729258509; cv=none; b=jSg/N+JOG7KH+53mK3Fh34/UBQPrz4RFicPUgU3GTqCNuqZ7tnn7rLrFhH7ZPiyPyHpx6prbI98fGx92m6MDS2J+kFsuN0VIJhQRqDG7u8W82n3EUc3SvnSQpmaawYFb0NeB7FHF5fjNy9zKHPEIDnz0r5pNKNxyFTRZ9sVWtxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729258509; c=relaxed/simple;
	bh=jjKhdL2ZlFvCxK6TQCDrMqBP3ZWyNv7UnbEcwC/zyfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CBmYqCK6W1ajeQ0/ZY5iREavEapMATb984Kr3eUUKf+dNYxSgp8XVkp5YPFxXnVvDOlQs+XawUV9q4nu19aAqgyTKp29aEBJ3OM6ZEq1e/bAlzWixoT06/+YIqYce5KEioXhVi+w58ZdpILxLPJuxV3G1+lSOtBEybCQ3kBEQZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/B3X4Ct; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4315e62afe0so15118055e9.1;
        Fri, 18 Oct 2024 06:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729258506; x=1729863306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LOA5rh/i3sB2aiZsIVyQZqxDqnBUHZOsMDWgLcJkZqo=;
        b=A/B3X4CtuLq8Mp/L4mNQY3IIinSvpqMDvNU3LP9aqj9HPy4P+cPHPF1WcSGemI8c+A
         Ux6y0HPgoh2Oc0l7pfrYkbqYpZuDOhmT75MnAjiYjcO2rAtbPJlrwFDpD0JM2NuUV/+6
         doEU0k8w+OOR5W+qull8LEG7HoGTIHx0oDx/QvYcLGtEhQ3nroLinamvRpTqnLpfQMTJ
         YaCSkMeoxfrxppke3kL/qnxSQ2FV4Cg83b8va9y6cNSqQ7sgOS3ZtVWnHQLGIdGBXSJD
         CROLz7yAX2mp5RVINPKIW1yLqM10VfnasihpdT5bwqVVnL2DzLxOIptyTEljr0lBj83c
         SZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729258506; x=1729863306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LOA5rh/i3sB2aiZsIVyQZqxDqnBUHZOsMDWgLcJkZqo=;
        b=jRIqzDHKmuGLS1D33Aq5RlxgkRP9TX1mFmNmpoFOLsf+vSdfFhx+aL/fu2gaEhGQNM
         ww/MPKNDJQUWQJI67WTJrfHRD/snlsV2zuvrjgoTbBEJ7IbOwgLSqGcOkaAC9VcWVjG+
         +j95zgBrBCc0kj1mLQmx+RbioGhjiTEe+Oulwv4VXj8Jumz9ks2srsEV78xi1187Opm4
         WFgm1gGeZNKHOocPZ7sJsM3Gw3EPosWNOgXOJPgDJbQIogo027RRfdmnQXZiPQmKk/KS
         fxavOtFpjeWv+0msQKGbTPCkmL3EhG6//ajiprxFlBlrZRp4oM6lpWRjWEMyirXAfjLF
         prDQ==
X-Forwarded-Encrypted: i=1; AJvYcCV//ZxeIp1A9vIBIUy9OuQKpXXQW/FxZcW9h3Pyv6uHzUePD2enOX64P3ozJzwEtt5+zX7SK2nd1gDB3O1WCkhObXo=@vger.kernel.org, AJvYcCXT247vk3h6UUEdpNHi1jwCU+NxjCC24uQgWMma1OabC2sv5ItAEvpNNQsAU+Oy0YC81SyPTsY1DKCU6Tw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFDOj7ljNudgnAlEJKzoixOaKfK7i9tMaP7Tj/szdnbCcJhZj5
	QeGPehO0K1KjDnO/dGQBz9iwNe4bSpjEGPuiWVlGbPUG5O66hK0R
X-Google-Smtp-Source: AGHT+IFFkmPrPsaccyHOM8SlcK7JXLS1oZQqJx5Ux4bfM5ae/7pIePIk05dSlc4rR3RDg44K/ckBMQ==
X-Received: by 2002:a05:600c:4687:b0:42c:b9c8:2bb0 with SMTP id 5b1f17b1804b1-431616331d2mr15713515e9.4.1729258505494;
        Fri, 18 Oct 2024 06:35:05 -0700 (PDT)
Received: from localhost.localdomain ([2a06:5906:61b:2d00:d416:f456:3869:adaf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160e0a7acsm24320475e9.22.2024.10.18.06.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 06:35:04 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 09/23] media: rzg2l-cru: Remove unused fields from rzg2l_cru_ip_format struct
Date: Fri, 18 Oct 2024 14:34:32 +0100
Message-ID: <20241018133446.223516-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018133446.223516-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241018133446.223516-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Simplified the `rzg2l_cru_ip_format` struct by removing the unused
`datatype` and `bpp` fields from the structure in `rzg2l-ip.c`.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index aee7d4ba70b0..7b006a0bfaae 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -10,12 +10,10 @@
 
 struct rzg2l_cru_ip_format {
 	u32 code;
-	unsigned int datatype;
-	unsigned int bpp;
 };
 
 static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
-	{ .code = MEDIA_BUS_FMT_UYVY8_1X16,	.datatype = 0x1e, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_UYVY8_1X16, },
 };
 
 static const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code)
-- 
2.43.0


