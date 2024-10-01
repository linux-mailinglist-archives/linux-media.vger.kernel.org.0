Return-Path: <linux-media+bounces-18930-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF2F98BF1F
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 16:09:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F49C1C23AC9
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 14:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B5791C6F66;
	Tue,  1 Oct 2024 14:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hclKxNO8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD761C6F46;
	Tue,  1 Oct 2024 14:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727791780; cv=none; b=Qfe9A6+bosgBiWR4Y4Jcj5fsK+qSpSY0dntIuc7xCs4TyeDZfFEbofnQVGbu3ALToxvNfS4Ptf11ilemieQdpfA3sQqun7YyUQ7ipRvSqVFg8zrLFkiLJqqDxs/1njRKttg3kvGg4FNLFRiyXdEXE8TbYlHtvteHBn148tPcFnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727791780; c=relaxed/simple;
	bh=vhQNxQEiZziPlVYVNr7hvuLE9kKYD2yWi41dPJSaC/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OAzAeNexLB97WZcg9xgN0eQuSzLmqk6uLljXT+8th0q77RDk/MyX1qugLuiHY9ez1wtWUQnleCUcGhVfKG4Lia3gN1TnYQiDNMaTkaJ+ubsc2fQEZv8BDrrJ15xr030aYHuXoJJwcgc990x8hYszRqxLBixTqGmHTF6SLQU4kSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hclKxNO8; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a8a6d1766a7so23426366b.3;
        Tue, 01 Oct 2024 07:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727791777; x=1728396577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jP23dmPDc7uchDdpz9d4iXAGP0Fl5jTlXHnPXF10UuU=;
        b=hclKxNO8efn2xrmmkjqDs8pKVVSMl1z84I7fQIP1MyttHowRsVi/yGbj4M7iYlBzfk
         uyz1Mqle/6dhl1RXF9eZDAv5cfwbz+LV1pVTHh+u8D6n8CuefUPrkb4krVP41h5dsafV
         +a70c94yDr9g2aHLK2/yK4MD9UAd4CIjIWl2gqcf9AB+3ftNNNeRlutNcuaqEXv7pVVT
         UDGUg1K+onOM76TY0tixgGrpcrNc94TE7MGRtCrWzuuKE7iteSo4D8KnV8xgdpft1n5p
         wMoWvSTtGKKEnbeQ5JG/W5L5flDE33uTIqovNj15MlnvHV84KM9Sa+EUXhVr+ykI5a6y
         qHFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727791777; x=1728396577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jP23dmPDc7uchDdpz9d4iXAGP0Fl5jTlXHnPXF10UuU=;
        b=Qd0gNzTixiOtKnQzVy/9c/ilGI/i0gP/1XdCuv/1IQkmGpk/nytBJzoT/g6CWgl7ka
         Za2iT1KH3bHnlvLWuGQYpoddaTLTTTWh5cdABrru3hxLe/qqQ69I1NXKJOv8ZfBOLbQh
         5izvCrKxj8ECb1K4+UbUnwQKf8i3B/mUVf5X7KLFVpKsS1401t7tCoXWU1rPCoIJXTIb
         PyYEcmz+73gorPh2Tz+B3CC7vEecJhbKkdIw0hYhlLZSTyfg2GJa90jKs+LL/4SzFSJI
         6byfhTKnsgaX3+ssPajdH+vD/Ox7JDUI4trw11lgrQjo/jD5TNJIMKvmTELagkWoe43U
         DSng==
X-Forwarded-Encrypted: i=1; AJvYcCXFyF7nQisPX/GR6Fv4c5Wd7A/KQFAD9SkK+wLVE2V2DygmzcixMJoNWNuKa37vRLXYLLVSavD6LtXHFFA=@vger.kernel.org, AJvYcCXKSc1mqoCvD/jWEYQmZL4ui6wZ699OI/37h95ZhwD1PZofWC7S9O0zrWtGPBVmo58vBt4QX5LGNInAGpxE/uQ93nk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgG4ubpUZuUQkpGEKSd+IvVn2pTt3Nxx4kKAMaNjFodidwdBc3
	h2mWx4OK7o+kv8BgKZVDD3MUAaEPfKcapbJN7j25nWdvjW7UADY6QGseBA==
X-Google-Smtp-Source: AGHT+IHLHpzkxgRr5Lk9SQADo56gHqRczXItY9/v6x+FHIIZJqgVHmeP2xYFrFjpEKpNr5r5jmDxrg==
X-Received: by 2002:a17:907:7e8c:b0:a86:9fbd:5168 with SMTP id a640c23a62f3a-a93c48f8877mr1653122966b.10.1727791776931;
        Tue, 01 Oct 2024 07:09:36 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2776de0sm723532966b.2.2024.10.01.07.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 07:09:36 -0700 (PDT)
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
Subject: [PATCH v3 01/17] media: rzg2l-cru: Use RZG2L_CRU_IP_SINK/SOURCE enum entries
Date: Tue,  1 Oct 2024 15:09:03 +0100
Message-ID: <20241001140919.206139-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Use enum values (`RZG2L_CRU_IP_SINK` and `RZG2L_CRU_IP_SOURCE`) instead
of hardcoded array indices.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v2->v3
- Updated subject line
- Collected RB tag

v1->v2
- New patch
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index ac8ebae4ed07..9f0ea1de50da 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -217,8 +217,8 @@ int rzg2l_cru_ip_subdev_register(struct rzg2l_cru_dev *cru)
 	ip->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
 	ip->subdev.entity.ops = &rzg2l_cru_ip_entity_ops;
 
-	ip->pads[0].flags = MEDIA_PAD_FL_SINK;
-	ip->pads[1].flags = MEDIA_PAD_FL_SOURCE;
+	ip->pads[RZG2L_CRU_IP_SINK].flags = MEDIA_PAD_FL_SINK;
+	ip->pads[RZG2L_CRU_IP_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
 
 	ret = media_entity_pads_init(&ip->subdev.entity, 2, ip->pads);
 	if (ret)
-- 
2.43.0


