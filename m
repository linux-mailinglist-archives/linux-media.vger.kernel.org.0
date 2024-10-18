Return-Path: <linux-media+bounces-19894-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C644A9A427C
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 17:33:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 862FA28302D
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 15:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD3F82038B6;
	Fri, 18 Oct 2024 15:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PwiWQmNG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303DF202F75;
	Fri, 18 Oct 2024 15:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729265581; cv=none; b=kAdMrTThkSBGPQ157v+ClQgDT+YGMqq/aXZkPqStQdbjq++6g4MagbHjHbgGcpl3w9yMU6lIRvWyuV3PWwJBGLn0XgJsYnEZ/EquA2d+LhezUwCw86/vpj9R8QhzfTs4tKxt+6yF/+c99OXqhTLKxONZ0sxZ7PNQUx//uqgSsu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729265581; c=relaxed/simple;
	bh=iTJKSEF16E43zVmfQtqF/5u9/yvKDJsy21D0mcI92jM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n37v3AwQUpeGDWpbUzFuEurIk0ze40JEpwKkQcg2JzjIhU5d2o5kgvKwrPU6oBvGX1oDa1YUToSv9FyTkEBaPRPIatmU32ft0Qp4gAUTXXj6HePXVcsPb84pA3fC0rTvNgpcx3C0NL7VREzkVblVlb1Rn63gSqx1OcOVz137YG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PwiWQmNG; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42f6bec84b5so23771785e9.1;
        Fri, 18 Oct 2024 08:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729265577; x=1729870377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQTqtXrmpcC6iNo64gTDZhO+SiUPdaFfjejoTF2plSc=;
        b=PwiWQmNGES87dTIgkYSKKPjhqy6Hkg29ViIdEectzsIIPx8/XgpaWCfGYhkiKnCW+B
         buJumUtvV1rNLBMMVfcv1if/+qItdG3Rh+t6lZWAR8LOyqeA1V6pLlf+mvGgCLuyicIG
         yHC67QHeHqMWEqPN8YKx9c3xEvFzNBIAj4pBAm2fhrVemxBAExuG8UW5u82IeiutzPmB
         HYiHQpnKnsHV303I7nXnsLJ/Cp8XgYwo59BOTaveR6jvOfeE5tmZxSnbKZGBheuALZjj
         qifjkQ3Ne4zib+4c/EEdUwIibQWE01WJt59VeMdkhuOW5ivwt+OwspKroDlYbB38puKM
         AUqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729265577; x=1729870377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQTqtXrmpcC6iNo64gTDZhO+SiUPdaFfjejoTF2plSc=;
        b=d5YuS0ppQCwqp6nHtso+K4chdUiyo9/fZRTvQif9F45z5iLIBct80I1ViEv5hrG5rm
         lcCNmDX2LLqpPba5lG1SlImBwC2imqLFVmRJe2S57mk5YDqgpto6Lkyij/5Ei7z4s8L8
         qbWN59TnwN/H4HKomOLIPVfWa8EamDUAEdV3lAqcDvKDbz5H1ou5GSN8g/vm080XKsp7
         TfcRtoDkCYi/UpBm30xQGbyyxJsxn1aaeL+31+tf7ErJBsBJ1MUnE7TevB40CY13RO6l
         nhrwtQyx2dB/d2ZtfSPtWB3EuLQnvltJuZIQj5X9Lw/D9w4TJYwfWfcqkZNS6Ga8xcAc
         03YA==
X-Forwarded-Encrypted: i=1; AJvYcCVnPlKeMIC/T/EhWIQAr1KUmjrngxwcsOpixjVgwiRCV0zbBB5y1L2WHFJeIKI4JgV1QmBYsz1NJQ7xtluxgy6ZJ64=@vger.kernel.org, AJvYcCWPrylYcJs4XEEZ+/4Q33QwKMNFdVlnsNvW+4xh4BaeKNtdLvrV5z5pwhfsqB/iIwZXXWjBq+TEi8q+4Tk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfjcj2igj2v/W13IBtdSQVft6fd7jtKtPOhyUTEvmysFz0WZQ6
	RAdA1mOUB6CAOjJZO9I8ZxNSWDxwf29Ui9RRqZ/Fs7dU6V3HeHjK
X-Google-Smtp-Source: AGHT+IFwwhSuyJ2zF9URtpu4CAZXhlHHWkC30Kd8nSgmxkbNI7uKsbl7NMimEGvR3hNL1Iq/ZfcWrw==
X-Received: by 2002:a05:600c:1e28:b0:42c:b750:1a1e with SMTP id 5b1f17b1804b1-431615991f4mr24250885e9.0.1729265575486;
        Fri, 18 Oct 2024 08:32:55 -0700 (PDT)
Received: from localhost.localdomain ([2a06:5906:61b:2d00:d416:f456:3869:adaf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316067e7b9sm30615595e9.6.2024.10.18.08.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 08:32:54 -0700 (PDT)
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
Subject: [PATCH v3 02/10] media: i2c: ov5645: Use local `dev` pointer for subdev device assignment
Date: Fri, 18 Oct 2024 16:32:22 +0100
Message-ID: <20241018153230.235647-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018153230.235647-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241018153230.235647-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/i2c/ov5645.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index bcbf3239d3ea..d344d3447a95 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -1188,7 +1188,7 @@ static int ov5645_probe(struct i2c_client *client)
 	ov5645->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
 			    V4L2_SUBDEV_FL_HAS_EVENTS;
 	ov5645->pad.flags = MEDIA_PAD_FL_SOURCE;
-	ov5645->sd.dev = &client->dev;
+	ov5645->sd.dev = dev;
 	ov5645->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 
 	ret = media_entity_pads_init(&ov5645->sd.entity, 1, &ov5645->pad);
-- 
2.43.0


