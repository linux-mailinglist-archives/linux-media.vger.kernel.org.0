Return-Path: <linux-media+bounces-19863-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 530419A3FD1
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 15:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 740491C23BE2
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 13:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCD0F1EE03A;
	Fri, 18 Oct 2024 13:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vd0L8bLJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2764CB667;
	Fri, 18 Oct 2024 13:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729258500; cv=none; b=omrhpIWaNpO3+dPLtii7rTVAJPmoumz9KglmMO4dj6CTv+e80UiPe4uG8Y15uuMPQC+29VtAeihc2tur2QaB1hKvab91XJRbDUUOGdlwdNgNCRMzd99RgSVKoV0rYRkk00+tvQV0AOv6riqJQn8KCDRgMHQIAMbyn5ajAJGCaSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729258500; c=relaxed/simple;
	bh=uZKPksgqQXYAFjaVTG5r+mbOST1Bvbh7s/7CGAT/xgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dSgEblH2bCyMFurZaPbIhYbIiHdjpZe0q5ty0KfdZmtvqA3ONQQVAh/t8IUAZyVssxEpLOReopmhtT2qIndrH79TY0vxQe0sW1oFyQwr/kTgGT2+SQLKp9YEYuHOzwCh3yeEAbi/BpBrE/ScQlXmSkNni7KFabo4n35BoOGsRaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vd0L8bLJ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4314b316495so20194385e9.2;
        Fri, 18 Oct 2024 06:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729258496; x=1729863296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5z7tndQL48sGbzY5YWFWfX5NjQnoyKt2xoxkttaM88=;
        b=Vd0L8bLJr6N/E5DrIbug/ijR4+W34b0GpAW0Sv9eZkwSwz2BIB/UtTxLDujp5aQ5To
         vlDbv4ocbBrPYKptjnxHVE+pb/lXkD25mU2IlvPj/Cgghqmn/uCPiy/j8UYypEuAum+I
         wkaBqrzoXn0pPqmiVTKrSPhJ7FAI/bDPYdko2Bc9kU6TWIBab0orqojPUICv7mM7RZIT
         RUIeWU24jotuUH7dHF4xF51855m6iP13Wr7o2xzCIAa+BWLdk5nOAagwO60K7zXLLt9b
         knym3esILD0KtfnzQA8KfELj3nhDnW6CVU3OTC+oZKlUPBU8/hmlTmdGBC8BptVlrx1k
         Ky0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729258496; x=1729863296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/5z7tndQL48sGbzY5YWFWfX5NjQnoyKt2xoxkttaM88=;
        b=M/MJh8ysjALyEUOso/BgO4vTGmPKppRcSYgIabmB6PF1/eLh3onURaAFEfhbOdadjs
         q9XYBpeIX3u/9rOE1s8UgDZUF2G38hv5hvtijMBNiiICloNZgKwPHtMXpN5w9xLvd3/A
         aYlOjxu5qFxujksst+ijHYCJjISDXjuI+joKFl4si4Wm6QYfrp2lc2nLv6PE8k/DJ6co
         JIbmUlEURSwlYakeoyADFKZxWDl5l9Zk77oyJTmv/+OFiMQonaVqha9hNXjopsz9gsEO
         uGkcFvEuEai6VDZPhi5hp9Pp5o+/7qvSjZy2iKuvTiGnWTEO5VC9SnjO38HD0pVNmyNK
         fC6A==
X-Forwarded-Encrypted: i=1; AJvYcCX6xEkzDsWilBW9eN48PfU9QDf2zqaGEpfI5a3HztACsk+Cpu00K+LSqQnUUbGKExLuCgNBEF336Ir23sthIOLFzng=@vger.kernel.org, AJvYcCXHCZ0EY6yJdu90NvHN+g7WdzWe/qoUuhn1cj4QsA8U2jaY5+ez9VG+14RVFushJe1R6O0FvFu5NFceJnA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcWVa8Akay+v3fNrmmBH0mhHvs2lh5QeXiRe9bq/fGG98LHBd7
	Xw/yhCcie0bbSlKI0YsCWd0I3BTQum3Nu54bIl39k3tlM/7W3Yit
X-Google-Smtp-Source: AGHT+IH+ZLOMtoyMBavV9A9nkk+JTlxm2FuxLo+xp3VEJfnGhkXi7nWX0yUuNuTKXxPUrAEHenhZyA==
X-Received: by 2002:a5d:58f6:0:b0:37d:2e78:8875 with SMTP id ffacd0b85a97d-37eab731ac2mr1677278f8f.56.1729258496039;
        Fri, 18 Oct 2024 06:34:56 -0700 (PDT)
Received: from localhost.localdomain ([2a06:5906:61b:2d00:d416:f456:3869:adaf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160e0a7acsm24320475e9.22.2024.10.18.06.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 06:34:55 -0700 (PDT)
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
Subject: [PATCH v6 02/23] media: rzg2l-cru: Mark sink and source pad with MUST_CONNECT flag
Date: Fri, 18 Oct 2024 14:34:25 +0100
Message-ID: <20241018133446.223516-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Mark the sink and source pad with the MEDIA_PAD_FL_MUST_CONNECT flag to
ensure pipeline validation fails if it is not connected.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 2 +-
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c   | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 922aa2c58d46..43da91c4fdc3 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -209,7 +209,7 @@ static int rzg2l_cru_media_init(struct rzg2l_cru_dev *cru)
 	const struct of_device_id *match;
 	int ret;
 
-	cru->pad.flags = MEDIA_PAD_FL_SINK;
+	cru->pad.flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_MUST_CONNECT;
 	ret = media_entity_pads_init(&cru->vdev.entity, 1, &cru->pad);
 	if (ret)
 		return ret;
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index 9f0ea1de50da..700d8b704689 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -217,8 +217,10 @@ int rzg2l_cru_ip_subdev_register(struct rzg2l_cru_dev *cru)
 	ip->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
 	ip->subdev.entity.ops = &rzg2l_cru_ip_entity_ops;
 
-	ip->pads[RZG2L_CRU_IP_SINK].flags = MEDIA_PAD_FL_SINK;
-	ip->pads[RZG2L_CRU_IP_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+	ip->pads[RZG2L_CRU_IP_SINK].flags = MEDIA_PAD_FL_SINK |
+					    MEDIA_PAD_FL_MUST_CONNECT;
+	ip->pads[RZG2L_CRU_IP_SOURCE].flags = MEDIA_PAD_FL_SOURCE |
+					      MEDIA_PAD_FL_MUST_CONNECT;
 
 	ret = media_entity_pads_init(&ip->subdev.entity, 2, ip->pads);
 	if (ret)
-- 
2.43.0


