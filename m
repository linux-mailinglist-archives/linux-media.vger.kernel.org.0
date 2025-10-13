Return-Path: <linux-media+bounces-44297-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0AEBD3732
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 16:18:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 14D704F39C7
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 14:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35D4627464F;
	Mon, 13 Oct 2025 14:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Jjl7VHg9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465402EE274
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 14:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364919; cv=none; b=TXrEwOkziXV5jAphj92nlIoFHh1RIuhrW6kmUAhqci1WbKe1my6QakSWXfbrjFy1xzJSlzVvQpM/dyK49rMuUIFValrsOft47f0WXJlppFw2lIG+38qrlAI5Y2cWfLGt8aPIfNCXg1y5j6LRGR4MVuGhBhgrMQrhuNV0WHx8VhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364919; c=relaxed/simple;
	bh=6oC75UBV5kQKcDj22i/SCXI/g3seRGkpC1t1HJaeaO4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AngXacbFa1JASMvYZ0PDZO7r2ynSfS+ebbbUlrmTX5WiClrNAMh5ZNexFsD6BuVtRu3Uv1Iwa2u1brvra8p6PEBXXRlOrjFKGogcNe5fElVEL/EaPemBrEzuvZlZRMJfCdcCoDDfISsWeI5/6CMZ3jSmZMJsYP3c91I14htgtoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Jjl7VHg9; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-59093864727so2839378e87.3
        for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 07:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364904; x=1760969704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PvGrgXxce3b673ZvWJmL2O2P/vGZxGBn/PkoM5SNlqE=;
        b=Jjl7VHg947TD9nYIiNrTYoTl9C6fcT8B5pODDOePLIBOizbupFznj3wKKtUHwPTaPY
         IMfaa47c7xAd2W8gJr7rvjEZDlHP0mm5lVm78Dwe5IGviSyPLuflRWrod8Wxc7OdM/Pt
         WG+TbUwRi6cfa+7kMQNMQHsxI7x7BUF/MFUGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364904; x=1760969704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PvGrgXxce3b673ZvWJmL2O2P/vGZxGBn/PkoM5SNlqE=;
        b=EO3CbO50uqxDqHgzRYdk+7fAws8vYi321vGA9XWJ1jODd7pxuMEwnu1c0WC+jVAdHg
         3DUfbD161DnaOD22asOE7y0xytKYAe1EAAalm6D6K4hwT9RWo9Ne5bcQprd/EszpYp9X
         ejAsAfZ5UOt/yT5IdP0q4PCxIsy1XVdppilWYqX0Qs65OfR6MyQJEgO/j4Qxsr7rGL7Y
         VggS8t3uaDnBIUgDvvXhXHv7oGau/xuHpYh0Gf5z2Ng1SqkMZtYbMzTtrW1F/ErEd0kp
         45BgSjWcBaw4Lo1gbOcMv55jFzCqVlXYbdfNzWeuwpzWv36C3rN3+POKb1b62o/+LuNL
         87fg==
X-Forwarded-Encrypted: i=1; AJvYcCXrff5ZyfSWaN9KHWvyO0HB2rWVU/O/OBiQJL6qQkpe2mvPAjUiMWtJqfvks/cczr3KxdmvrSoli69njg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWcjzx67JD14CdcBY7o5m4otB0y/c6/w9erlRAH9/tHTGHLbiO
	9P3uNhGD5F13LsJJoz7e1nfyk/B50nMqIc+a/mJjh3mentjWZdP9GrkYjcrO3p8wEw==
X-Gm-Gg: ASbGncv/EuljTVLZNeqbGt4THdSGXJErzkAVCL7hDtv9jeN5gawiG3lU5woCj3z1I1A
	ydCjJOHLa5PgifLvNyGgSRie/t01yyOtyx0iZRPvzK6yXD5Hu8VA0nyrOoQsLHBWd5QCZcQqoz3
	0k3cIy0pmhWeZwW9VRfBnLLTFwD6Py9V0wCgDmc/N/GDhtl+mgFbjVx/cdX47ftsdOu6hZurI0v
	PuY5TTuQP10Bp65FzlK28kJ2gpgRf/PT6K7FOUDVkpviwfQZH3vOrbeafXtfzT5g9QVKe2+MpOh
	5Q7vyZYkLVz8Q3nsSR+bFC3B2cdueSSYehBLypsryP7YJOpZVQd7dhpDiNUYnLExtZ82kXPOxPB
	RMkmUPYieTHZRgemkjpLxLftVbD70erLBw7aTBL3U8ndjh+6xmhZKcwqm23VcbXbDLZpKQiKJYv
	1OjbH7laqCHM2bkRuRbTg1srnvSh29
X-Google-Smtp-Source: AGHT+IGGd6j7B+8NL75y4mrJN6TXhWVlixXUpX+LgX1rgjlDHLsFmo3oZTEn3Lq8AvVEZR1xSQXSLQ==
X-Received: by 2002:a05:6512:3b12:b0:576:d217:3f79 with SMTP id 2adb3069b0e04-5906d8b179emr5620261e87.15.1760364903769;
        Mon, 13 Oct 2025 07:15:03 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:03 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:04 +0000
Subject: [PATCH 24/32] media: mediatek: vcodec: Use %pe format specifier
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-24-2c5efbd82952@chromium.org>
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
In-Reply-To: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 =?utf-8?q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Leon Luo <leonl@leopardimaging.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Julien Massot <julien.massot@collabora.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, Daniel Scally <djrscally@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
 Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The %pe format specifier is designed to print error pointers. It prints
a symbolic error name (eg. -EINVAL) and it makes the code simpler by
omitting PTR_ERR().

This patch fixes this cocci report:
./platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c:187:3-10: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
index 5ad3797836db15bb62744d6699cdd2d6f05ad01b..643d6fff088b22dd58c0b05d5699432ccd0bc582 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
@@ -183,8 +183,8 @@ static void mtk_vcodec_dbgfs_vdec_init(struct mtk_vcodec_dec_dev *vcodec_dev)
 
 	vcodec_dev->dbgfs.vcodec_root = debugfs_create_dir("vcodec-dec", NULL);
 	if (IS_ERR(vcodec_dev->dbgfs.vcodec_root))
-		dev_err(&vcodec_dev->plat_dev->dev, "create vcodec dir err:%ld\n",
-			PTR_ERR(vcodec_dev->dbgfs.vcodec_root));
+		dev_err(&vcodec_dev->plat_dev->dev, "create vcodec dir err:%pe\n",
+			vcodec_dev->dbgfs.vcodec_root);
 
 	vcodec_root = vcodec_dev->dbgfs.vcodec_root;
 	debugfs_create_x32("mtk_v4l2_dbg_level", 0644, vcodec_root, &mtk_v4l2_dbg_level);

-- 
2.51.0.760.g7b8bcc2412-goog


