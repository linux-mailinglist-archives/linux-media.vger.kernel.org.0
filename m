Return-Path: <linux-media+bounces-19450-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 280B099AA12
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 19:32:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9CBC286C47
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 17:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C98C1C6F49;
	Fri, 11 Oct 2024 17:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a6sRzBhO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46F05228;
	Fri, 11 Oct 2024 17:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728667864; cv=none; b=j91DWZyUDtKnWygE3PTw1oaqIHNWQnotusx3YEnjixNMi/pCnjh/W8+qM6UqLNIS+rCEMRMYXwCv4icOfx8uV9zExQ3ceVy67QriaGDfG5T84GEtxLpw+8Of5axOx0SLoD4elWMWJfKW/ngekKh4E4KCksT0ovbliOZ0Cp/NlPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728667864; c=relaxed/simple;
	bh=T8keBBIKmh+gQilFeSMtnLq1tChWN51TvIxv5AmsMX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eQ+VVOi2ZRqvYebQz+FeJPLchZrYCq1FOXYC/HvpECO0vw92+yjz4Z7TQFWl6G4ymmygDu/6jN4FqYcEFWEMTVlW5G6XNrVgxGl9NjdLUxr/e0Rq4hv+veLmqMNEc343bcvkcnSySQKTdtRcY2ziVdlauyHUC0vVwAl/FuOuDqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a6sRzBhO; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d4612da0fso1777791f8f.0;
        Fri, 11 Oct 2024 10:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728667861; x=1729272661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39t/gj4BnzJio6PIx0Gz5cXfMhkF8u41aLRktL+ki3g=;
        b=a6sRzBhOtv5Dg/80SmrGzJ57+EmLOql591qEpS9dFi16uRpf8CJ7c6E0OLyjbH5SYR
         lG+943YG/NZP5GADdL/mD0yr/MOgk1EoITetuMJzVVbgy964KFq3RiLAlDrEGHcKp/dz
         aL9ECru9okM6yza4fUYAADF0snk9j/7gCmPAGMTW6Ps97vOB3+ooqRGSJ5zqHPxGgJmA
         od2Hh0R4Cg8/QKOI14cE8iNAn64nX/NFu94et7PidyEEBWrU4GeWoVC1AYw2uJy9jXoM
         aym6lQxPifJ6zwpH/Ktpy5+Y/pFPUJYr6GVv7ni64u78h2bzKPvSmpxASjdcbP2UQL3k
         SQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728667861; x=1729272661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=39t/gj4BnzJio6PIx0Gz5cXfMhkF8u41aLRktL+ki3g=;
        b=JC6lF4HzsKCiIUZsVzvcyPPR1Ib56n32Zo8/LTurXlE8bUJhRwgtEK83hPKpYXzrTB
         uixEaJ4cgiKgGmHAdXs3LCEpHCk5Qrdgh57NNe+nIZOZT1nQIZLSyDPYdZGjuJyBON66
         9SamIzYVxyOR0YsEaOiHn1weN/fEqA+L9NYVbrghn5Ih0thPmSJouUR0RFCN8Vbry3EX
         MVKq1aWK4Bxrz+eoK6YxZEfcjStDYw1A3XJlYwr56ZKjpE40kiX1100MdZcDDXlxIcNV
         HWFF+ORi/cThzq5gvq09cYUAYWuPMmVnjtwdFmNoxUHuVdNgFRgHD0i8+UHqeOUF3jMe
         jbDw==
X-Forwarded-Encrypted: i=1; AJvYcCWPTcZD9cSQb/uqMgRj1CGE/NAPw74ZXQ86/vRcUlIJBmD5o/VI6xjHey6Lw/3B33+BLqFWUGxzwm2JuSMPL05QIBg=@vger.kernel.org, AJvYcCXKklUwodH/bGf2yTQPfLLBqfl/40tbal3BFJb4WfRFV1Xtjllx6RvtrLVXPGttejpdLE/mEVlRBc1p17k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTcW4WgZA4RtXzuiLFbhHLKDFLpqlTBiJOmttxFroW6fOf7vGF
	uAd4bubSuY/rlxXELvq+aaHApUMmJoF/XZhJmiODxDUJ6fdqCxFE
X-Google-Smtp-Source: AGHT+IH9mlAZJfntfOBzrJiG39wS4TDQFeymdFwTYpyvvmcIzGFM8WNRSSjWp02axAdnk+/TYCnrCQ==
X-Received: by 2002:a5d:44c5:0:b0:37d:3141:5b6 with SMTP id ffacd0b85a97d-37d551d6533mr3171820f8f.12.1728667861064;
        Fri, 11 Oct 2024 10:31:01 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b79fa0asm4396516f8f.83.2024.10.11.10.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 10:31:00 -0700 (PDT)
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
Subject: [PATCH v5 02/22] media: rzg2l-cru: Mark sink and source pad with MUST_CONNECT flag
Date: Fri, 11 Oct 2024 18:30:32 +0100
Message-ID: <20241011173052.1088341-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241011173052.1088341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241011173052.1088341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
index 19e0ba9596c9..69cd45b26951 100644
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


