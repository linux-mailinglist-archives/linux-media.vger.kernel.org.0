Return-Path: <linux-media+bounces-19173-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AF59936A1
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 20:49:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DFED1F247FE
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 18:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D7C91DE4E8;
	Mon,  7 Oct 2024 18:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZEnJB23o"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFF51DE3C4;
	Mon,  7 Oct 2024 18:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728326935; cv=none; b=dV1OAWCs2HqlPYpx0kiqJJkmnmBNPiFPNCzOl1RQ9pmvzeuW1Wq7cWMECrG7YmYhU6a60Z/Xb4AVf3/nBY8PQFPclBGHbnvVhgZPtoBf4RGrZqUk2yKMEM9IuaeTAp6L2E/kNK0AnnFLBllIJQSp39PtjKqlTuRL/qqhvu/StGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728326935; c=relaxed/simple;
	bh=EqMgQ7qYiKXRyYfaLbrU8JB9/SiOPCFQH5V8Wh0MYjg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZG7YIKJKjkemXyEK3x0+12oAev+HOARKxp4R8VfQ9VXUBeODwYsOoGRso8r3H8QQXIJILUY8vCs5IMX80J7prIOWk+pwLf8sp5/NYcS1hmR0A7b4GTFdXrGsZjcJFFVXEh8TCMzF95rEFsPKErip2x9TlSOmPgATpOmDLkjhVn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZEnJB23o; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a99422c796eso303548266b.3;
        Mon, 07 Oct 2024 11:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728326932; x=1728931732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LMIpghf6+FEz2yCIvJrjByNXfmRyRcuz+y+EE9o6Ajs=;
        b=ZEnJB23olItIxnPcLxSEAFkOYrR/TrblPVah+xlN8nzKkOFTshJ+pzAjxJne4vfQoD
         pQJk/4Ur5Ued6pTmaqaLVUoAV5hVS7wL8sqfGnzQbKDNxHJ4vtVNqtSpVoSHWnYf/TM/
         0ZnlweUm54oe9rTfPL/2AgWzQJmdRjuzzFs/eCGZ+OFQfRXbQMF5HZ9VuLQeCsvX8cyG
         An8mmsQPxlRXa3KMW8tFvlv21Y3o5cBwTSop0HOPqfuJoDLq3xcKsooN6L/8t1PStc8L
         tr+9QgAbLHrSD4A7bhv5lB/OARu+ws2rmADdlj6TlmqIYSpXp+SGTAKsS+jMQxtdpSWF
         PNRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728326932; x=1728931732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LMIpghf6+FEz2yCIvJrjByNXfmRyRcuz+y+EE9o6Ajs=;
        b=Y+cUvWmNlaY6ojF2FfwCgBj3cPUZYb6QKVogDRGll7ggPWSqWTqHt/bAQc34dKRj8G
         Krjxew5iUTjIUo4GGFVZGZxJWjd01AYgz2pSBsljNM2lcvbZO3dS67m1eiD/okQKabnV
         jg8dzxcssG6ejFuUBFNm/b9AIGjXgP5y4fzP+j5Ou/LGXIMqqJfg8Rd+41MGXQppPdkN
         dMpjdkUbEClc1BblrXqKflC8l/EO94eKDr/0SRXKi+JKjUZ86IRMDpUI3DEejq74Db//
         bz3So6GUyJwbiMn1AMAhFvLcp7jRLFnPkazMwPoaHXCFPwxrBaqmCeUxcDeKcKrgRWNm
         d2Tw==
X-Forwarded-Encrypted: i=1; AJvYcCU3ijIRoKtddWFyXHoZIlpwpq6+x5aQ9IeLmDP6QWa/fCeAmFArTIP7OL00TR0oWI/rKEsEAQKSdmUTtMk2DyUo+RQ=@vger.kernel.org, AJvYcCXdPiQ43CVDsoPUqjcSTL+ju71eaItevF5JS06mFZoSMH/KYiPVvVfXqMqUNjEymLLR7Bp7QXdkbD4UEyU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx809OSRcP7XDdOJiU8C/ibxnGcachrR0isPq52Y74JYeJLkaX0
	SL96/dVGN2FGo6BKiVWqzXdzkucha0U67GgVB0vpkkLeymQ2qeTY
X-Google-Smtp-Source: AGHT+IEowsX72R4MAwQkyk82QxJTcoez/ZeJov6/yeRD/sKv6u2uxhTezHbhs6u/j0fqGqQellwjFw==
X-Received: by 2002:a17:907:3183:b0:a8d:29b7:ecf3 with SMTP id a640c23a62f3a-a991bce3fbcmr1460233166b.13.1728326931601;
        Mon, 07 Oct 2024 11:48:51 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:f429:642d:d66a:1085])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9953d48594sm180102766b.176.2024.10.07.11.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 11:48:51 -0700 (PDT)
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
Subject: [PATCH v4 04/17] media: rzg2l-cru: csi2: Use ARRAY_SIZE() in media_entity_pads_init()
Date: Mon,  7 Oct 2024 19:48:26 +0100
Message-ID: <20241007184839.190519-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241007184839.190519-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241007184839.190519-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The media_entity_pads_init() function was previously hardcoded to use a
magic number for the number of pads. Replace the magic number with the
ARRAY_SIZE() macro to determine the number of pads dynamically.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 2f4c87ede8bf..abacf53b944c 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -804,7 +804,8 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	 */
 	csi2->pads[RZG2L_CSI2_SOURCE].flags = MEDIA_PAD_FL_SOURCE |
 					      MEDIA_PAD_FL_MUST_CONNECT;
-	ret = media_entity_pads_init(&csi2->subdev.entity, 2, csi2->pads);
+	ret = media_entity_pads_init(&csi2->subdev.entity, ARRAY_SIZE(csi2->pads),
+				     csi2->pads);
 	if (ret)
 		goto error_pm;
 
-- 
2.43.0


