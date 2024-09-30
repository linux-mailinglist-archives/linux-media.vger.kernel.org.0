Return-Path: <linux-media+bounces-18814-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0B998A1AB
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 14:12:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90D731F261E0
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 12:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8183119C54C;
	Mon, 30 Sep 2024 12:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lYdUKf2J"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9DB19AD5C
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 12:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697899; cv=none; b=DUIAc2dyrMavZJOGZ+ws9TA1/injVdKnhWqjrzJ56vMj25Pvy82yeFSt6DRqcaG4kocTiyKnrE2LRf85q/CZwN/VnUjuNhrnTUmjl6VFfnj+dJjAbnyAnQYMAPBuuf1oRxRhnAVr2IqPxSk4sE9PQUSBTGkHcdjL/cvECw5zvao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697899; c=relaxed/simple;
	bh=zAHXtBXd38DxPFfjTz25yyTkm38285rSqJvPg7EppSk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iGwDCfH4tQ1NECyX3cwbcjqqUClvkEmhIwVsOudvzrCBS7qQih8wg3VKZE9Q1CDYe/b2XMp19r3qAYS5dqhaOFlb9Z7n2IcDPYQoznuMQ+VoNKyk/yV1DG79efr9YLskW8C6iAXBf6mg1Y8vbowhb7p0qYqNGzvT8Zhk6MSr6oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lYdUKf2J; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5e57b7cac4fso2523622eaf.1
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 05:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697897; x=1728302697; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tIonQ/DAaQ73YEKHhPQbmT6IJ8ZJpmHYGgDzVtOZCdY=;
        b=lYdUKf2JjE1EYxU55bjIvjJy6t7qwFDm4tLUqdM+2RF7FRThCUN1YNPQSNzuio9o6m
         Teje2KqJ6HeCByswrwaUIlLdGOhwj3ohB5QvBCEY0Ulc2EnYVr/oy2NKH3KKFLtTUtOR
         xsGKKFzpRZ/AeaYD1IjnT0AG2oaS1bNCb947Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697897; x=1728302697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tIonQ/DAaQ73YEKHhPQbmT6IJ8ZJpmHYGgDzVtOZCdY=;
        b=UXqceR9MRb6+V4hB4w0k2T2qiQBunF8SUg8eYUK4wOyiwEM1B+EhWPJXxk9/5dyLZd
         VuoIAmukYmp21abVnk5EzOQx5iLtG6MgZCiUQsKUme7ZQmc5UocHMmP6cpexaeu09qbd
         mdoe63jfkLxMrbFaC9vDvu7+XA1PsJLO9z9XV6Edx0hnD1ZTJW0A+1NOnw7cNxIMRPFz
         vnpIywS44HyxdHASY0FZi5qI22Kda6/VLxUw49bk/K+O8lQ08NlJAP5hi8yoF/l/uhXH
         CfyWDqtB1otKilgyoU+6GA0kUZv4+yNx17z+p2wmuEzwDlY+I/hZLKVmyObLbp9qp4a/
         dafA==
X-Gm-Message-State: AOJu0Yzhs7d6PXhGFn5i/9CL/h4ZugFnCUHnMUchOk40um99i7We1+l9
	maXCw0QZdBaj33rDpsTG0Va0C69tHxap6H/5p6zrpwKKhruvi4Brqf/64dHjDA==
X-Google-Smtp-Source: AGHT+IGBBDkCLdkyPSXSamdMv+lg/+wwDPA6EahlQnUNGQaV2riLXTLngR4tQbOORFsEO3I87GPG9Q==
X-Received: by 2002:a05:6358:54a6:b0:1b8:33fc:ae71 with SMTP id e5c5f4694b2df-1becbc9be95mr344688455d.16.1727697897424;
        Mon, 30 Sep 2024 05:04:57 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:56 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:21 +0000
Subject: [PATCH 26/45] media: videobuf2: Use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-26-81e137456ce0@chromium.org>
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

The following cocci warnings are fixed:
drivers/media/common/videobuf2/videobuf2-core.c:3008:2-6: opportunity for str_read_write(read)
drivers/media/common/videobuf2/videobuf2-core.c:2860:2-8: opportunity for str_read_write(( read ))

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/common/videobuf2/videobuf2-core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 29a8d876e6c2..05678fa14fe9 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -2857,7 +2857,8 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
 		return -EBUSY;
 
 	dprintk(q, 3, "setting up file io: mode %s, count %d, read_once %d, write_immediately %d\n",
-		(read) ? "read" : "write", q->min_reqbufs_allocation, q->fileio_read_once,
+		str_read_write(read), q->min_reqbufs_allocation,
+		q->fileio_read_once,
 		q->fileio_write_immediately);
 
 	fileio = kzalloc(sizeof(*fileio), GFP_KERNEL);
@@ -3005,7 +3006,7 @@ static size_t __vb2_perform_fileio(struct vb2_queue *q, char __user *data, size_
 	int ret;
 
 	dprintk(q, 3, "mode %s, offset %ld, count %zd, %sblocking\n",
-		read ? "read" : "write", (long)*ppos, count,
+		str_read_write(read), (long)*ppos, count,
 		nonblock ? "non" : "");
 
 	if (!data)

-- 
2.46.1.824.gd892dcdcdd-goog


