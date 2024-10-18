Return-Path: <linux-media+bounces-19878-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 675989A4001
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 15:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 275BB28504C
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 13:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3489204942;
	Fri, 18 Oct 2024 13:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VR9aK1U9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23352204099;
	Fri, 18 Oct 2024 13:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729258520; cv=none; b=Tq1PR+mDbRpArAdl0D5kL6dwRJfj6JJLX6STBvizRo4MXu+L7LZ3GpED6DDML+1e05rYOBBCHpGwQpq/Z1gFFJwO+lJiIHQAA9G5Ca/80U90CaK5zVebOq+q5bVDum3M9k5RO2/w43741qW817HcVUhafmNSyKpgTnr8TYNLMt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729258520; c=relaxed/simple;
	bh=iLZOVU3YiNAFnEGYBvMAWuofYknlyFWUQwL0sgtvlNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iS6xgvIJ37uNVYO0JVr+HUsHNfCyfAu+iVQf2ZkffuaxDhvXmQElBlJ+F6wbEnIMkiE5X7tFpOUQnvZaiAeqAdmiSCUs1JoJohTD0J2XKy8HHHDSMI5RbHYzs2Vo8YjgVS1eB4PixmEeJmFzVvsxJopHrRdD6rYw3DmYcZSD2MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VR9aK1U9; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37d533b5412so1502146f8f.2;
        Fri, 18 Oct 2024 06:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729258516; x=1729863316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nky1P2dXpB22MDGCjnPFN5ftZZLoZSsMxjzNL1As6N8=;
        b=VR9aK1U95x392OuNsq61EjDJXzO7V4bvRxak0qDkwzW9QZysS8YTYPBrOVyJxABlp7
         eAye2SqnhMewgjegZGl/xar3pGSSMCMZbEXFYQIR6msj4aHuUBYwX8CciRvFxxzIPPMG
         S8kLfuFid4k4FWa98dVMZOkXIZ/nw+z8tl5SquIkSalauv4R9e6gnyH/KMtQNcxrNx8o
         B4SqqEJn+Jj6qBI4jminLfQyTE54J+KnZ+NpF6sxlteKzqBSCf2IsAi2oS3rHOqePxgP
         UAO5inENLX+1P3vRt+Asjvz8+vpmhFNaCYbb7GOPSUEZ+xdY876C6NnYUcyDKixFdCTK
         jWoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729258516; x=1729863316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nky1P2dXpB22MDGCjnPFN5ftZZLoZSsMxjzNL1As6N8=;
        b=wGEKPPgrMjTu8+VWysdG0hM7t8yUH6WxnlmIg1yljROwzBEWu0kJB9ELvEJa8cOeM2
         uURbLo+1cMuWXKvvLTnKT1CxVldK8pq3zAdjFN4P0slk1D7mVuBYklC6GXEZ+LaOROYB
         tzPd+aWdmK3FtrqTOIXO/PdXysfGRxIvTIGPHNf1BIBb8Lc4FVG/W5T/bX97+iXKcQB0
         jT52vsmtnUIS3HXBH2WdlesY8dLI2UWYYYKbeMECJbamReZLd/wfc2uzwKCM4nkTgpEo
         j8HgI0f4ABdU2D4fFiX6+b48irp/1bOC/ipPsY1V8Jxw8cy8lyIm1+NvS+QnDnnQvDg3
         t0RA==
X-Forwarded-Encrypted: i=1; AJvYcCUv6413xHVDJgN/qw9bqpd0FwlKBsLeBGYssWx+VoVGWdKLC8lPXh/Z7fSWKbR41144r6En+IzALcpQNbchwm7EpLw=@vger.kernel.org, AJvYcCXeGNEekHSPmlJuNXmlfqgs/kM1iW0sb/6MIB8EArq/mBfPC6h667GlPvJ4MpbQ8X5alO9OXWpCpFM8sm4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyATIsjBO2xHqEL1mI2HvaiGiIvO5Midd6L4kLFpNPmERjjLHom
	vYaApm0ZvHgZk5nwkQRL22DlueNrcXk/BqMQnBdeLptMrMD3YWtvo0PpNA==
X-Google-Smtp-Source: AGHT+IG5gRjrN1Z0bChB2aeQM+7T7a39cH2S6CZWTuHuTEnzM74YiLC0pml0E61PjQKK6C7CJalaGg==
X-Received: by 2002:adf:cf08:0:b0:37c:d179:2f77 with SMTP id ffacd0b85a97d-37eab4d13aamr1697130f8f.12.1729258516265;
        Fri, 18 Oct 2024 06:35:16 -0700 (PDT)
Received: from localhost.localdomain ([2a06:5906:61b:2d00:d416:f456:3869:adaf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160e0a7acsm24320475e9.22.2024.10.18.06.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 06:35:15 -0700 (PDT)
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
Subject: [PATCH v6 17/23] media: rzg2l-cru: csi2: Remove unused field from rzg2l_csi2_format
Date: Fri, 18 Oct 2024 14:34:40 +0100
Message-ID: <20241018133446.223516-18-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Remove the unused `datatype` field from the `rzg2l_csi2_format` struct and
update the `rzg2l_csi2_formats[]` array to reflect the updated structure.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index dee8c1a749c7..7a658518b4d6 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -183,12 +183,11 @@ static const struct rzg2l_csi2_timings rzg2l_csi2_global_timings[] = {
 
 struct rzg2l_csi2_format {
 	u32 code;
-	unsigned int datatype;
 	unsigned int bpp;
 };
 
 static const struct rzg2l_csi2_format rzg2l_csi2_formats[] = {
-	{ .code = MEDIA_BUS_FMT_UYVY8_1X16,	.datatype = 0x1e, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_UYVY8_1X16, .bpp = 16 },
 };
 
 static inline struct rzg2l_csi2 *sd_to_csi2(struct v4l2_subdev *sd)
-- 
2.43.0


