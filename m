Return-Path: <linux-media+bounces-19170-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDDA993693
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 20:49:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8BDB280DC8
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 18:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F13B51DE3A3;
	Mon,  7 Oct 2024 18:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="haTA3sAD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE881DC046;
	Mon,  7 Oct 2024 18:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728326931; cv=none; b=dwJI262+ZR9i4JbzI7TaijtJPlvOvIc//VvrqQLPoFzcfBxl2oT1pcpnHqnAVx0WUkdRdz9Fw9nShm/PioqDvS014vj85Mq43gCjo4jlG+OMBBF+KGOjngeBHYduWwItol6e3NxYWwRiouz70gDiRH+txWlRBLhNZO6PcC358Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728326931; c=relaxed/simple;
	bh=i1qXdEBpnGriWoad2OUw0LjWiot65g8XR1zyIQJI1lo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZjriL+7Orv+wQCKYbsGh7wn1jCOzNQXXdx54Ysr9jYQ0NwYg/1WFH3ue7yvSKwIJ+n+JTbhp0JQP7ARfVtPgXQFA1CP6pEXjLrPRO9PsvKTlZaqPBGiyCgpVjuOprE6JmNUZojPXTieNFNQEzzt9We+6M2Iz4DJMF4kA6N8owMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=haTA3sAD; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a9943897c07so310427866b.3;
        Mon, 07 Oct 2024 11:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728326928; x=1728931728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6hiBvRbwfsdlAJRIKTRoCgEM0lXiJPtAQiM4M7Yq7o=;
        b=haTA3sADoIkkG7cIqEG4Sq2MUy9FpfJcXRUGPdBg10fzwaQ3vQQSpdLrH4hoSMg05t
         lWCMdkEhLOMKrZMtrfFS5ykVl9jeiJHxS+llUftqzZxjwsUZtsdEZYNTZArR2N+IYHt9
         30jTAaLyyCoM/yeK9PLcWNrp8Tw9nlYdIHIcFq8qxwEnEeUPvnJzH0dTJO4wSjkJqEnF
         DUXp52dIWdaL7EJiewr9rvvgGekFRt9KSwpusyt0uQvjKZaSMN1wDnljpOVOlzhnqP0b
         M+7l7nhLMokWZmXo1VLUAxT4WrKJzD0cs1+BfMHaPco4EIB1EDJb3fjPDxQYAi1RqAuE
         3E2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728326928; x=1728931728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N6hiBvRbwfsdlAJRIKTRoCgEM0lXiJPtAQiM4M7Yq7o=;
        b=h0TStiDPgVpAfYg5z5FQdl/CcFPG2/fVroHkk2EgS2UqczW0ej6U9kKKpL2pwhzokZ
         Hb4RCOi+XxaBUV4U39l+dca7RHPa7woL/aXC5gXPVSv14ifiIFWZxWETMhNmma6pMDgL
         a0Aj5GYUPOJSUtxvIovOdAAdkpDJgFnCr4YjMBo6EizRKwGZ2NtnrG7Z7PjKB7Dwlgda
         oAh1c826b0gLX21gQPeTaAF5Ksee+5sofuzyV5JzUIanjCf7qIpAcXTMKeCiiqvsiVGh
         xWomfveRVPcSdp5y5h9WcSCZ6Rs4YbgVzQkM9jLTFUgh+5Tz2Rme/AlvPTn1FJtgQiJK
         taZw==
X-Forwarded-Encrypted: i=1; AJvYcCVUNVFUyBDnslsxUKnI+Ees3SYwyHrGWcT6ttdXXLBuAzSByiYnvQklrqybyR2CqZehPzz1iG/+EfvmySEdFOFPqdo=@vger.kernel.org, AJvYcCWrGfpnUJDOwp8bjyGeUwR4gliHpdN/gfNStWWQ9uBEPUTKuqns0lDk40tW1ADyHulLclUfhF15HFf26a8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMj2bCw8PgXu/teaH9iTfE89XKzUBqPGFa0M9RJr4VEspyWq2R
	mDR1IFVHVCF1o4atD93irhzddnEyGF1lno4OERXJIHfhkvg7GYK2
X-Google-Smtp-Source: AGHT+IGQvX4/I3SQeMaxk5/UXMxVH4W5OYkyllMmFHJ62Z4QX1F7Sr3lzfzpt+B5AC2c7G3tbQlqYw==
X-Received: by 2002:a17:907:934a:b0:a7d:c148:ec85 with SMTP id a640c23a62f3a-a991c053223mr1537177466b.62.1728326928134;
        Mon, 07 Oct 2024 11:48:48 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:f429:642d:d66a:1085])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9953d48594sm180102766b.176.2024.10.07.11.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 11:48:47 -0700 (PDT)
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
Subject: [PATCH v4 01/17] media: rzg2l-cru: Use RZG2L_CRU_IP_SINK/SOURCE enum entries
Date: Mon,  7 Oct 2024 19:48:23 +0100
Message-ID: <20241007184839.190519-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Use enum values (`RZG2L_CRU_IP_SINK` and `RZG2L_CRU_IP_SOURCE`) instead
of hardcoded array indices.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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


