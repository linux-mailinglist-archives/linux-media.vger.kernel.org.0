Return-Path: <linux-media+bounces-17379-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A19D968B64
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 17:58:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D2261C21299
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 15:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CBC81C62B1;
	Mon,  2 Sep 2024 15:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ia+Onzaf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DAD1A3053;
	Mon,  2 Sep 2024 15:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725292662; cv=none; b=PxXhdyyUow2ZTyuL6IsgicwiUX/SuN0iJ9Zo9y2+SJvRQ2n6lBjUqV0aYcXNNqR4qUfFAWmvL76flKqBWDbS5VS5p5v84fKlQ3o+kRLar2LvE6Xn7onWZTF1GvU4yNh7a/DzrUUo2gg8ih4/TA0YcUvsekihUOZGdlFjrEqckKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725292662; c=relaxed/simple;
	bh=545SzH11XYDnTThOv4+RccI0gK/V1QB8eBYGK3TtJew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=exQQqlsbgiWBCE0ZK0KADJ5fxbCZ694wGFXHzsPIndc3EHfjTCQjmArv703AXzvK2Z876DdAHjj+aPyyqp5rgNoNeIG0quMZzuQzaPDLHhbVY4JpQ5kORqZBAsKhF8t2Ad/WPbLbHtuvRaFIWfHqgHVySxOSnyg05VqB+qJLkAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ia+Onzaf; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a869332c2c2so857335666b.0;
        Mon, 02 Sep 2024 08:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725292659; x=1725897459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w4oT7d5JXUFK7x6k61bLujQ6czdYd/ZPn3pkZyd7gi4=;
        b=ia+Onzaf73xMDrAPvMO3ng0FDHPqIg79mUvHtHLdHeQU60bSnJ9GfEZdBXi/Rw8RUY
         S16SHuUtQvXDNPB9inoAfhW17C2cUxWcsbyyQVyfvDExgVXUTBZ3M4GV8X2n/D67AM5z
         5DL88vWG1yPVf11irnQN70QcXaHO2yR7cWcJ1Xt4W7okRzz52f/0SUnC7HgwTRHca1JF
         NMXujxkxkWrBrR41pUTkKPEjZsEMn7FK8c5nwqwvgc4dAyno3sWmlBiu0pHPX22nPfqL
         6Ql5oMYpiM3BdvHRiAHovw0Sb/lYCAJ9/VmGl7DTrWxdYnAX2Yy/IoBp5P4KcyL/glYv
         GWmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725292659; x=1725897459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w4oT7d5JXUFK7x6k61bLujQ6czdYd/ZPn3pkZyd7gi4=;
        b=SDyGCxAuVfBbydChwLZCc4M7ZH5YBzWfvHsVcYSQuE0gPHwqJa5+lsk6plHzlPNq4M
         xUlPh0Al8X4pvvooCg1Yaa541CcLfhTnsgn5n1tL5AGt5ehDQQpLEq6Zbuiql73Tr/hs
         gDI4s4+QOoxGRWo1cvTY1gg+p8CmLJsQ+UUCoOCPZxgWJ13LpTZtEsA9iN2vvw8+ngCC
         W3QK+EExU+wzprOVd82TbPm5of6LqeSdFf9rPlcA9NgI0Pd/V98GZ2wo2yqlJCHJqonO
         1IDaj3buqNdmh3S2PiEYIy7SA6Eueh84Pxv2IZ4NjoU2Kgv3f8b7jGBVFSF3jZvZNvK4
         Z94Q==
X-Forwarded-Encrypted: i=1; AJvYcCV9pVJHS4fALeGt5g9uICPP6cMKJ9f9YPl0zNV047kMi9FdRDTu/mZ8Am/QHc2Xf7X3eK0Pl7JEdjVWx3I=@vger.kernel.org, AJvYcCVKzLaCTeqNTWau/fGr1WXBevJykH0KlNwlxG4lUS+vTZU8Rv0WXMvPyuRhdcj8j+ngcj0uEnurUsERWI4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1hbNKy8sS2/0z70F31SwCbGJ6hlOHxIwOZRsu9+G3u+8cRxg3
	RTzMpnFaPccskfo5Um3Epp53CDUHL+XlYvw+E5gEfyCsUPZIF17z
X-Google-Smtp-Source: AGHT+IG8+G+ISoXqqXfk53k8g5fxRXUlI2gKzbNonBvSChRGgrPyHad6P03xGhRAItpXgVL+q3y7RQ==
X-Received: by 2002:a17:907:6d11:b0:a86:9ff9:6768 with SMTP id a640c23a62f3a-a89827a401bmr1510643266b.22.1725292658598;
        Mon, 02 Sep 2024 08:57:38 -0700 (PDT)
Received: from [127.0.1.1] ([2001:67c:2330:2002:af84:a410:1c4f:f793])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891d6f87sm570951366b.158.2024.09.02.08.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 08:57:38 -0700 (PDT)
From: bbara93@gmail.com
Date: Mon, 02 Sep 2024 17:57:30 +0200
Subject: [PATCH v3 5/7] media: i2c: imx290: Avoid communication during
 probe()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240902-imx290-avail-v3-5-b32a12799fed@skidata.com>
References: <20240902-imx290-avail-v3-0-b32a12799fed@skidata.com>
In-Reply-To: <20240902-imx290-avail-v3-0-b32a12799fed@skidata.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Benjamin Bara <benjamin.bara@skidata.com>
X-Mailer: b4 0.14.1

From: Benjamin Bara <benjamin.bara@skidata.com>

As we don't know the mode during probe(), it doesn't make sense to
update the sensors' registers with assumptions. Avoid the communication
in this case.

Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
Changes since v2:
- new
---
 drivers/media/i2c/imx290.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index ece4d66001f5..9610e9fd2059 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -769,6 +769,10 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
 	if (!pm_runtime_get_if_in_use(imx290->dev))
 		return 0;
 
+	/* V4L2 controls values will be applied only when mode is known */
+	if (imx290->current_mode == &imx290_mode_off)
+		return 0;
+
 	state = v4l2_subdev_get_locked_active_state(&imx290->sd);
 	format = v4l2_subdev_state_get_format(state, 0);
 

-- 
2.46.0


