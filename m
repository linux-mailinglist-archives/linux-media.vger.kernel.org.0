Return-Path: <linux-media+bounces-17622-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A4E96C928
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 23:08:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 476881C24EB9
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 21:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28DF2165F0E;
	Wed,  4 Sep 2024 21:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WuR0DZqs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88C014EC60;
	Wed,  4 Sep 2024 21:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725484068; cv=none; b=d68WpYu3+cYIheSWBgib3E1FIIxBgnY2q1XumQ9nuPkh3e1U9BX8lOTMt8L69laYilpWIeS1DKTmvG6+SiTWnUmfWdG4YngsUBroofVZQHQbDG/dqVypOI8pmxfgwDeU4fYEWR9SfJV4KMyPH0L3h6T9wyacTZEvAe/tFpOt2ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725484068; c=relaxed/simple;
	bh=JGdJLaovjJBbYCO4/ZAujBbI9fa+eu1eoBgflmmamM4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nFfhf/p2V2gleuYSIh5GXQqQzW4IxRQFsid4XsWzNcdn8UeIOaElwAuLCx2/B4oWELAIFi8PcXFfbJgt7X3ZZ6PrdqGA+oj/IueOSsl6E6qxo167XOIF5iPc5D1Dvky0yumLy/ry8vFWe9esNJn3OdHyoJvVxY1DOGH8+DOYuGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WuR0DZqs; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-428e0d18666so59124545e9.3;
        Wed, 04 Sep 2024 14:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725484065; x=1726088865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EKDEYlUyX9mtDWuZXG8A6gqXn9QYzoYPNiuiR8K1vRg=;
        b=WuR0DZqstu/k8DnBSpEFoRyIr22HQVOLnqP2BkLGbeLbMY/9RvxVsKrxa2wEo2ie0F
         u4RF0UhxnDx3/RqeI5Bo+0j9XzfuhevKuLwcjFDbfajOjY6pvm+7iFtkIkAqbYRRgebG
         3SRuJo9b0V+uD53S/C79AMkCCyBCRspoNHkO6kbY3Em9If6j1mWJFduJw109TjLxLaeL
         /jDIdFvE7wYiVxTqmiBXO7aMRbBxSZzywM5y+WHipr+MOPLebN0t3MxlIwjUbolEfUzb
         FvBhJ/v2L+3AwpcgbMDV+151QG+cMq8JbwlouJ3ztm8DrCKgV984CCL61dZBmYi61XQ2
         AgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725484065; x=1726088865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EKDEYlUyX9mtDWuZXG8A6gqXn9QYzoYPNiuiR8K1vRg=;
        b=tnIw1X7BwXuDlp+52V9RF3dxX5831JAl6d+v2Bb6SqanFR3PWNJ3PbxNAunsGOMGJt
         5bGDcICCS0nfjdZQnm8lfVw913vZm8PVLjXwAq4ds4hJHCS7ncrKiZxVsYNXhZ0Or9YW
         KJUQyS8issMajNydPrihsCiL174wUcf8/7UmlYt/9/ft36P6U4bfF8ZBOVC8aTOUC4p0
         jPNF76TvH0/uKrwWj4AueRZnVsItw76uYhjtsTSPI8IRGUx+6xa/AtNFEBzYh1Kdxx8b
         aTd4Dwp5uvGvvNZITov3gOtS15/5qfzw9jpoQRpB20H+TAlBQ+IYKpAqlk1kJN2M7++F
         n51Q==
X-Forwarded-Encrypted: i=1; AJvYcCWCbh2bk6yO31kDCfClX54917z7WAMWUcBuUmWUZGNjm/RmDhPzIWX5h6IRNqfXmbd5ZyXdT+ZZHCNLfdM=@vger.kernel.org, AJvYcCXum7xAh0HHQZ2Cxm5hggLmjUsjo9BZ4heH6vbM7Gj+vKA9mLBuDOFaI2PC8Kj0X1hgJt7VCWBD1yks40sqi6YfGKQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXCxQsWHM8fWu732k34JbnBzf88v7VH5xwMGK1+tEZUHgtsCMa
	p4rySdxQAbWDafZeLpRgUdMcR7VMYZ+x0At190xT3AaTR6WteWq6
X-Google-Smtp-Source: AGHT+IEJEdlvZiZejf9Ym+pUkIiUf7OIMvZfRqGYvcm6nl9i/Uhhz+CPD+JFbg4H1U6opl7Ha3W+gw==
X-Received: by 2002:a5d:68d1:0:b0:374:cb30:b9b3 with SMTP id ffacd0b85a97d-374cb30bbe9mr7356400f8f.2.1725484064838;
        Wed, 04 Sep 2024 14:07:44 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:c57c:1e61:792:2ab1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42c7a41bdc8sm158821485e9.3.2024.09.04.14.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 14:07:44 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 02/12] media: i2c: ov5645: Use local `dev` pointer for subdev device assignment
Date: Wed,  4 Sep 2024 22:07:09 +0100
Message-Id: <20240904210719.52466-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240904210719.52466-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240904210719.52466-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

While assigning the subdev device pointer, use the local `dev` pointer
which is already extracted from the `i2c_client` pointer.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/i2c/ov5645.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index 6eedd0310b02..ab3a419df2df 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -1187,7 +1187,7 @@ static int ov5645_probe(struct i2c_client *client)
 	ov5645->sd.internal_ops = &ov5645_internal_ops;
 	ov5645->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
 	ov5645->pad.flags = MEDIA_PAD_FL_SOURCE;
-	ov5645->sd.dev = &client->dev;
+	ov5645->sd.dev = dev;
 	ov5645->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 
 	ret = media_entity_pads_init(&ov5645->sd.entity, 1, &ov5645->pad);
-- 
2.34.1


