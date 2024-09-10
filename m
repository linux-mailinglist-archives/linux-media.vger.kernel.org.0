Return-Path: <linux-media+bounces-18119-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A15974136
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 19:54:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48DDC1C25847
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 17:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8E61A42A4;
	Tue, 10 Sep 2024 17:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZh3DNT0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2124718EFF8;
	Tue, 10 Sep 2024 17:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725990863; cv=none; b=UDdI9pfaz0A6cU1/7rI6UrzVn3V4W3OzL58u2DbIzdyZx/LEZZVysKJn6BqDSYS5hhbxYVQZt1odWzxzXaImGC24xSOVX2y/1aDb2fafxKWjges67kp3SMXjWaau292IUNTblwbIN7xhVIw3EfrB+Lt62B+ikxs6S8HlbYq4U/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725990863; c=relaxed/simple;
	bh=GpOciCVq4t/tJoPu521/2pt+bx2It1u3tQQVxBe82Mo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pZst87i2KK/HgixSYmcZP5MMaNMvktmBBOQmJ81cK6nOw0VmtEJmPMX07WTuEr+lDoti1gzt8aQLacqNWTQEIIE2ozpXeBIBmecRLAKoRvK3qVvmHiIpH/fqEiEaeyq5RG1d/+15iQWQt4sYziIddQ4X7Yl+8mlSo8yrPgdENTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gZh3DNT0; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42cbb08a1a5so10713975e9.3;
        Tue, 10 Sep 2024 10:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725990860; x=1726595660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0YpDvq1aX8RM/8T4KEaByBhSLAjHidzJa16dqw9KTCc=;
        b=gZh3DNT0lmilKP+3apknAKb4v35VVDAUI/U2SCXnjNdJRabo9yFd5QSoNazjmb2Q8i
         7YfMHUIAHfOz69K0tPo8DvFP6DTvg4zPiiYHivjRqgr6bdKqZjNvUyAu0KV4HafpkzaH
         VFOXB1G8tdBKVH+ifT7TQX4ICCKfaljlGtHJ89V8ASTTF54HztSORvCTG06fOgdXbG+h
         pf6husd24ZWWdFR7MoJ05uzROjc4XaXlOmuQ9HEQok7Fr14LfRjBjRa6QxNwVVwrlX1s
         7PTjGD3X7vCal2jBG55IpWouZ8AOjgrNUT1dOQmt26+sIObum31asFTOfD49qxhFTOQi
         tucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725990860; x=1726595660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0YpDvq1aX8RM/8T4KEaByBhSLAjHidzJa16dqw9KTCc=;
        b=Vrea/UyC8kaAecWj9jv9SgdRGoonSPyHW6arRbIi/8Dquq6HMV9xCMUnfkQtChGhJW
         y8VnIEW5BlOk9S/6SArcPB4eOOr6DuLD/3J+mpTzu4sJFIMcs9M3qelWecWNI9lAi0pI
         V9KB71/R6ztZugJ+AqVEejwWZ4byt3wcaiP+sErG64raaXHbPf1X3CyEmUwHqPCIwtgr
         5JwQuNXL0oU6SLcrnXBbUXkYxPNJudqOB0EtYoR9EuaxknfxZi3ZV+XOm0xuuJzicS76
         SwOy2N/4H9cUDp2zS822fO1zlfjM7jSuR1vSg0jacHmJIsPqMmGh04LFPqqqMj9CuFi+
         uLSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUG4EjHgn+/yn9zXUUZnGVZLgO6rWyK/fRDKUouPLIUjnCHGia2l4ExuiRMy+kshRVI+XKyVEufmf7a9k0gEEZI2s=@vger.kernel.org, AJvYcCVsC8buJkCsMeZqxylsblsISl5SAUfc0R8SBL0YecUQUXG9Zfsj0yEN+1KKyxYrwol5euoZk95zHY+cNr8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJZUVaI5HvCen0MaaAsAHuUpBr7wCuSvuJTMTDL8wPiYiAICV1
	tfZlCv27YzyhkH9BQ3BaER3RYLqeYNxKW8JLZ5LheXORif0CgEsy
X-Google-Smtp-Source: AGHT+IGCnLGn2NbSb5IisyeGs1jbhQbm8aHmE69KOdX9MnTXZBrQ0nrfIb6GbqB6tfmg8YeFFshAsQ==
X-Received: by 2002:a5d:5244:0:b0:374:b97b:c69 with SMTP id ffacd0b85a97d-378b07fecfbmr330663f8f.48.1725990860274;
        Tue, 10 Sep 2024 10:54:20 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:94a6:1e64:e5a2:2b2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675c40sm9516562f8f.51.2024.09.10.10.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 10:54:19 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 01/16] media: platform: rzg2l-cru: rzg2l-ip: Use the RZG2L_CRU_IP_SINK/SOURCE enum entries
Date: Tue, 10 Sep 2024 18:53:42 +0100
Message-Id: <20240910175357.229075-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
2.34.1


