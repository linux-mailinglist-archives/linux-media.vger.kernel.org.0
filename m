Return-Path: <linux-media+bounces-18811-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF2898A1CE
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 14:16:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F30AB24B4E
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 12:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3337519A28B;
	Mon, 30 Sep 2024 12:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jHeah8oO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347E4199FBE
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 12:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697894; cv=none; b=GObd6GU6feEPIvEjhQV2Qhr55F1FX0duLniSEQtJ4L1EDORzjwRXnfrvQwOzPyAHyMCnFuKChRhy20z9M0ZzOnq9ccttjTIKSWNFy23ceoUvX8hmd9hcLectnH0jqCsqgBbkwP/AnUpyOkmdc8OoJ8UzsKrNSOGuIRkFnBkk2po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697894; c=relaxed/simple;
	bh=gioH4bb8ZF2A2YJ3Gh5wVo7at/LilX8METihZcFwy7M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PbcgfQAEjdeYH8751kRtT/J0ZNDPE7IokTTRDTpdTJ7shwY+DAQLTmzDjgYSelbKL0mJU7sK584BaLrf6SzHySfJSulBh+YBpqdngu8FIWCGDef9UEvLr4HO8YXJ6v9nmT8e5c2zssTZ1ILwlN2ptBeOL/NZWZziHcKknUx/lgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jHeah8oO; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6cb4c013b78so18082016d6.1
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 05:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697892; x=1728302692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fkGnsANo5NZRR329f/RKKIwKl1Ms+i/uz0ChSSNIXaI=;
        b=jHeah8oO68kIPGWg7xm/cF1UGNNVFsKwXRjbczpMJTNy8LwDco56IQaLyiYBbYokda
         v+FrMADNKDKvDfg3IM8SO94cteDSwU85YcWR2EJKNAWz7MQzP7DnmLiZJvmGdLUlEbf0
         TIUPDYVv+CFvvXGz3zTB3sdMDsk7OxUj9w7FA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697892; x=1728302692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fkGnsANo5NZRR329f/RKKIwKl1Ms+i/uz0ChSSNIXaI=;
        b=m6KvyrsXXOjzuJM+f2RdySy7RYtd1dw8gcqyCosAq5NkxMocn1hVomvoCXPU0qfMRA
         NN2esdEGZ/RcBNmixaIvPuIU3FUCVliS9i8M2RuvtyQLZeCznpbRZT9FOU88sHYzIBAm
         UAJ8/X4AOniGleAWRZLvLsJ5kz4DPhsaDeeU/nUY0pk/R1/4VX8NpkYv9RbpCF78ulD7
         s/w9Gy8/e7HgU9KNSGPHFKXhODTSGQmiJahbtB7Gh8FaSdJzN+isu/eqb1vX9nPaU/te
         0wUEy4PGTuYVowJvzqGsLTt19YC0FSWf9YBScFUmtpA7tlB/huHzk48ffE9okgiG/58z
         Yptg==
X-Gm-Message-State: AOJu0YzbiiebG8EqfkblNKYGxI0kvfZ+7rCOE+auqwXUcWZz/BtUk2KB
	/UUOpY9zeLv4QAgumpDlKLkDgR8l5fr4yxHe2qgUpN5OOMHb+vfggthb4wxI0Q==
X-Google-Smtp-Source: AGHT+IHSrAGEQVH1G1zMvd/O9AA5MhvLH1UshVFh4gerMrNNX+7ODpeAcur/C3J29WO/FfgVZP2azA==
X-Received: by 2002:a05:6214:33c5:b0:6cb:4def:4ce4 with SMTP id 6a1803df08f44-6cb4def4dd3mr121217066d6.32.1727697892043;
        Mon, 30 Sep 2024 05:04:52 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:50 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:18 +0000
Subject: [PATCH 23/45] media: ipu6: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-23-81e137456ce0@chromium.org>
References: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
In-Reply-To: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Mike Isely <isely@pobox.com>, 
 Olli Salonen <olli.salonen@iki.fi>, 
 Maxim Levitsky <maximlevitsky@gmail.com>, Sean Young <sean@mess.org>, 
 Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, 
 Jemma Denson <jdenson@gmail.com>, 
 Patrick Boettcher <patrick.boettcher@posteo.de>, 
 Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>, 
 Andy Walls <awalls@md.metrocast.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Eddie James <eajames@linux.ibm.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Tim Harvey <tharvey@gateworks.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, openbmc@lists.ozlabs.org, 
 linux-aspeed@lists.ozlabs.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The following cocci warning is fixed:
drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:247:51-57: opportunity for str_on_off(enable)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 051898ce53f4..522dbf52c82b 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -244,7 +244,7 @@ static int ipu6_isys_csi2_set_stream(struct v4l2_subdev *sd,
 	u32 mask = 0;
 	u32 i;
 
-	dev_dbg(dev, "stream %s CSI2-%u with %u lanes\n", enable ? "on" : "off",
+	dev_dbg(dev, "stream %s CSI2-%u with %u lanes\n", str_on_off(enable),
 		csi2->port, nlanes);
 
 	cfg.port = csi2->port;

-- 
2.46.1.824.gd892dcdcdd-goog


