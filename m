Return-Path: <linux-media+bounces-13025-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C8E9050E9
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 12:53:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AD3E1F221E4
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 10:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28C6A16EC1E;
	Wed, 12 Jun 2024 10:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ABjKWT+1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E94316EC08;
	Wed, 12 Jun 2024 10:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718189584; cv=none; b=O/C4z8fjEcSn1RN0qZwX4LymQL1FpMpyO4bKqGfQp6O5C1ElmPeDLfiorF2t8wVO64fJxzClwdMgmNXB045QgKloYEY3tkopFsuq/spLpsRSfobCkyzEgY4/LhsiCuk1Yk5bIfwauxcNCqIeL0VWONBgHorRoi15WOuupmQ5250=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718189584; c=relaxed/simple;
	bh=2kj58qBP7FxoSCa5xKHPmCM/1eQ+8Ps7f9qbYfMXyVI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MlFsYir5Vvsx9IPm4jCy1sipfWRXb6aheD9rJcju6aw6IbHdTVpR6NG0e75dp7N7tJ39UZrV3rUVk8iLqShYspK1o2QHtYPF2dSHylOnG6HBfUjb4HivXfIjLCAl40x94ydYZPSBrhXFJvNMTLA2gxYNCvewxCe45QaCN5rWrVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ABjKWT+1; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-79550284502so134848285a.2;
        Wed, 12 Jun 2024 03:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718189582; x=1718794382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=flZgWFKhxWxGjaqOkdyMdJqS0YRaXDWOZAS2UaEwY1c=;
        b=ABjKWT+1WyEGVqbp+dcguFpWD6MP5C1fAcrEFHRr02MjYHMvTdV17Fnoc7CGlBvadr
         wvsAZWVqoW82WU/XAmrshMi6n5bcU4woW0ZLaSq/01s340gY/dHyopNy8tvzy01pFQCi
         ZxZsgdissD0Moe0bTQizdNsxYM9j1GG/TraDW7VeABjId+1F6eKD472B/DFtLQJUzckY
         TgBSNyX1zE0H9ydTdvfz/7s1Nw2vRKFxX3cOqMl+avXsoCTUGwUhJg+TcisYTHwBFE8f
         Eg4gCT7WuLDJMDPZKpMs4uPuwFXdhE8PbtbqgUeVwAQLQYoEEGQRBttfnvStSk7QHYXs
         hQKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718189582; x=1718794382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=flZgWFKhxWxGjaqOkdyMdJqS0YRaXDWOZAS2UaEwY1c=;
        b=VNNh9UHGIgpYTz6vpOYy6jvcN9vWpVPzfNKL1Wc8+NjUi1NDlwy7Rpavuy1mpIpOFn
         P4mwSthWsbC73ouGKEfL7jrPUbncc+u8mDVsfXKI/QpBjUHl6pUI7SLOVEs27SToWOxD
         KESu7eXRnU2Hg5JEqGDBKmcdp37jkQy+CjvX5kWbqUlgCbOPQGeQfWzlHHQLw2CqGWv4
         k6nFOGQyf2H5IMOuTF0QKS1EldiA3Mb9XbZlrkGpY9z9ol5pxpM/PLgFuL0gaxuLk2mS
         dGbjqcYjzjKoNNFYY2AgHn/9393RzMl03bV4VegYEcpk+bzp7TkSvLZuCvObXLkdRUmN
         a6WA==
X-Forwarded-Encrypted: i=1; AJvYcCX4pkwZibhYXiwvG84MFotJBgHP06UCISwtXEXmEdo5U3KrO/68P8CUJrQWvGA0bc4hixaZTqUDhBC13fddk6KKskegVZaUNHBnKl3WomY67Ah5jMAFJ0OVWWy4/R9mGYOmalIEqcXybo0=
X-Gm-Message-State: AOJu0YxVEx0IVwUSVRFD3YMzxBktjxck9BB95b6Eu96/c9NqcsgN9UNR
	kl8Pu2HZqdmK+pTvO6YgguroEXnOVfvuoIXL/kiLpQNDRqPCFkfF
X-Google-Smtp-Source: AGHT+IG03VCubVJFPRBzLaPxCBDKnO23hWH4/PaX1JLdVSVW8yvfzl9Kojj1v/Si3ZT7YU3BdzOFcw==
X-Received: by 2002:a05:620a:28c7:b0:795:4f8b:88ee with SMTP id af79cd13be357-797f613e827mr127082385a.76.1718189581831;
        Wed, 12 Jun 2024 03:53:01 -0700 (PDT)
Received: from sheun-Legion-5-15IAH7H.phub.net.cable.rogers.com ([2607:fea8:bad7:5400:f2b7:e8f6:98dd:a423])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7954c3580aasm447074385a.136.2024.06.12.03.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 03:53:01 -0700 (PDT)
From: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
To: sakari.ailus@linux.intel.com,
	dave.stevenson@raspberrypi.com,
	jacopo@jmondi.org,
	mchehab@kernel.org
Cc: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	javier.carrasco.cruz@gmail.com,
	julia.lawall@inria.fr
Subject: [PATCH v2] media: i2c: ov5647: replacing of_node_put with __free(device_node)
Date: Wed, 12 Jun 2024 06:51:58 -0400
Message-ID: <20240612105232.400361-1-abdulrasaqolawani@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace instance of of_node_put with __free(device_node)
to protect against any memory leaks due to future changes
in control flow.

Signed-off-by: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
---
 drivers/media/i2c/ov5647.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 7e1ecdf2485f..0fb4d7bff9d1 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -1360,24 +1360,21 @@ static int ov5647_parse_dt(struct ov5647 *sensor, struct device_node *np)
 	struct v4l2_fwnode_endpoint bus_cfg = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY,
 	};
-	struct device_node *ep;
+	struct device_node *ep __free(device_node) =
+		of_graph_get_endpoint_by_regs(np, 0, -1);
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
-	return ret;
+	return 0;
 }
 
 static int ov5647_probe(struct i2c_client *client)
-- 
2.43.0


