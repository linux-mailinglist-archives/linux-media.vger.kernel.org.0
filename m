Return-Path: <linux-media+bounces-11114-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4588BF5A1
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 07:43:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 613ABB23F74
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 05:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6043A179A8;
	Wed,  8 May 2024 05:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hMFUuw8E"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A0A1DFC5;
	Wed,  8 May 2024 05:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715146978; cv=none; b=XBvdgpiVICUrcUaToM7OrRhFSySy+bzwdSmpB5cRtFFzc29OZ1D/oUkbAIbO39o9JiYlEwblHG7ORPJfT4SMpJkI8cT+WUTCM5DXRp5OFOWeCbTUnvknxWyRe4mUFp8uvz1iPB4F+UM7xJ7FS6Sx/oY/X+jx5HBr0Za1XqQPcXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715146978; c=relaxed/simple;
	bh=C4633FM/2fwr3jRA6+nCGxJmj6K03Kpsy2481BbSSKk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DMtTwc7VjNcsPBp4Y9mDTtCdFLAvMmVNWcyZYUyIi8+0XuNGO50Jg67gUO8tb934tuu/XfiujaAR6dJXp2lORsS/l8SKfzYFicd79f79pG5u7Y2yMoZfCkCTpQugtzZIntyxXaEY7VnYVfckS9mOiFnbrp2MYgkWsqgNCKkvSgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hMFUuw8E; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7928c351c6bso366266585a.0;
        Tue, 07 May 2024 22:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715146975; x=1715751775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hWdYBTdI6YHyaOO3KZJOsp4QvXAU01tQunIm8J+oqpI=;
        b=hMFUuw8EsFNO+/OZjjbVUhv8GLo1IQm2d3WaApoP0Pif1EB4Eg4mOR4Uh8O1EjQ+MS
         Grs/N4CPhzWOaRgBPtzqF9dFB6xrnNhCbKx2ypERWVkmEgCPUTbryG/AC2REaIHrIepc
         VkHpXKVE48DBh9TPK5wBh+hfzMI0X84jVg1zofK4IrHFk9ufhH3bO5egliNX15KQ+r3F
         dTd3G3+7o1QYUj9e+vJ93Pg/+YTNtCB6S/Jcc5VzYd3gKXeovG2zYlSGYfAebVFVGezN
         2JuMfHw4eheolhZ0fWcJ8I00tdCMnsgqlDbVmsIh1ZL8XdR5QLgchji/oWd7vH5whmCN
         tZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715146975; x=1715751775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hWdYBTdI6YHyaOO3KZJOsp4QvXAU01tQunIm8J+oqpI=;
        b=DF74vnsydj4kx39tROcIF9+NB8wyJam3892Bd+VcWY4urIUDYKszDP5r3Lrd9mVLR6
         qSptMK+/TTPnf04hQLcf7j2u1pq01VzQwzp4pYDldX5IoQOrQxNmcyAld3gALcbQniGl
         Y9Ngt97yJ6ry/Kn+xqHdtCZnujabexjLQHhqSkgNYZPOR4xRhbQfRjutwAwABQpzY/bl
         HJ41WmLLO1yjghIQs7+ru5ycT4sLpFtbZFXS9p4AsHColwWgrm7KQIHgW8l5vGmDeqmG
         A5flidiOp7r88mPpDZ1WiA6RN2DS54x/KGsNggXfi3rzhMiIGpq/Y9AvZgnHNKyhauEC
         DBPA==
X-Forwarded-Encrypted: i=1; AJvYcCUCUeWNknQ7mk55peNjj0rwNgmnE0I+uX6G/K1OdCaANt10Nyd86OYLP1A1IvZMa75jkkHm/mezmNdynu/ACa8e0HuyqjCfkgHueai8nO0+jwq+IwaXLCtswlZNii5h93ZlO367PACF4UA=
X-Gm-Message-State: AOJu0YyR3TxcXSJnsf/8dVaUfbFJHjphWFC532KiJ9KqG/1faPO5hW/j
	EEUzBfNt5YDCerpf09KnoKsOvMBgzYtIEclLdXg8W7xMyweDY475
X-Google-Smtp-Source: AGHT+IH3Gtb9zcwRjA7/rwW8zyDSMRH/7dVvKMi9jFfO9cbK2TDr0XFTDAyoMfutkp2MuFiMCB9ysQ==
X-Received: by 2002:a05:620a:56c2:b0:790:9b2c:fdb7 with SMTP id af79cd13be357-792b27b11b8mr182761085a.23.1715146975632;
        Tue, 07 May 2024 22:42:55 -0700 (PDT)
Received: from debug-VirtualBox.phub.net.cable.rogers.com (pool-174-114-162-125.cpe.net.cable.rogers.com. [174.114.162.125])
        by smtp.gmail.com with ESMTPSA id i21-20020a05620a145500b00792aad04aeasm1148218qkl.102.2024.05.07.22.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 22:42:55 -0700 (PDT)
From: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
To: akari.ailus@linux.intel.com,
	dave.stevenson@raspberrypi.com,
	jacopo@jmondi.org,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	julia.lawall@inria.fr
Cc: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	skhan@linuxfoundation.org,
	javier.carrasco.cruz@gmail.com
Subject: [PATCH] media: i2c: replacing of_node_put with __free(device_node)
Date: Wed,  8 May 2024 01:42:53 -0400
Message-Id: <20240508054253.1568781-1-abdulrasaqolawani@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replaced instance of of_node_put with __free(device_node)
and removed goto statement to protect against any memory leaks
due to future changes in control flow.

Suggested-by: Julia Lawall <julia.lawall@inria.fr>
Signed-off-by: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
---
 drivers/media/i2c/ov5647.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 7e1ecdf2485f..d593dba092e3 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -1360,23 +1360,19 @@ static int ov5647_parse_dt(struct ov5647 *sensor, struct device_node *np)
 	struct v4l2_fwnode_endpoint bus_cfg = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY,
 	};
-	struct device_node *ep;
+	struct device_node *ep __free(device_node) = of_graph_get_endpoint_by_regs(np, 0, -1);
 	int ret;
 
-	ep = of_graph_get_endpoint_by_regs(np, 0, -1);
 	if (!ep)
 		return -EINVAL;
 
 	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep), &bus_cfg);
 	if (ret)
-		goto out;
+		return ret;
 
 	sensor->clock_ncont = bus_cfg.bus.mipi_csi2.flags &
 			      V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;
 
-out:
-	of_node_put(ep);
-
 	return ret;
 }
 
-- 
2.34.1


