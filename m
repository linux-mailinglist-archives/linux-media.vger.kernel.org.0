Return-Path: <linux-media+bounces-8104-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 29273890278
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 15:59:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB9DFB23B78
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 14:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C2E2128826;
	Thu, 28 Mar 2024 14:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WsifRo0r"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D29D12E1C9;
	Thu, 28 Mar 2024 14:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711637944; cv=none; b=sc5Jrp4LWYUJxFnoBCi9hbQTwF8hK8nkRcnUF4Kb1vqOoq81bXdxovthBVekCkeL4RS4WoQ+KFYs41pCIBgIv42jXxdqoSg+2YMPK/BEjtHsK+hVGLU+TMirPMAk+cu+uMJECTEDH+lmEDAIE7h7nLlLyOxBMsxAAZ+rpUpFXZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711637944; c=relaxed/simple;
	bh=mRNRI+YAClY01qlDQWZnp5Gtt4dWIWnaZj5uufyFsC8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jpLOUdFiL7diZBYiXYEGaD/rvRqZGplV6OfWiEz9VmztRkKZ/DyEXZRSOAbIH/cS8tUlR4hm6Q28belnjJGxg68uqOL1zOUl8NEwc2aTt6Gjwqdc30BMPXGWSjzbfS0aSyad304Uv2SS/DFQexr2403Ugzg8/Qb4dntfpDRflrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WsifRo0r; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-366b8b0717cso1325055ab.1;
        Thu, 28 Mar 2024 07:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711637942; x=1712242742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bEOhmw+qAWXKqAhpyedbrOjiGZm65ri1Oy3rNcS55c8=;
        b=WsifRo0rRfu60IfslvrEkDr3j63Y4V7EURgbGUp11t3Y7FCSUbeI9FAoCMWdKx5AYg
         34ChTiSe1uMGsgfBFN8eEiMLFeeq2Xe496FyUG2H2b1dJyHeYfyo/MifJCOPPgp9aeFq
         dxQGupxasmJJonOUU4Gwn9icSzFvLIwqqJztfqHlimAQQimCj6F/lJSndIZkAj+W2qp+
         KpTIomNoG0K1oKMwYp2A0nxBqIbwErrCSpcrgpBFdDXy5WnkyYFAnlJr0KnKEbIkJWoG
         zi3DNaMah7p9vvIe/P3BdraPCsN2vT6LT3WmFwKkwHWQ7eQAq5h5vvYPEj8ARcEHwDVW
         Cnyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711637942; x=1712242742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bEOhmw+qAWXKqAhpyedbrOjiGZm65ri1Oy3rNcS55c8=;
        b=X9h4FUOlKimtWN/4gVJWb3AB5LEPeVXDN2MXT9oew/CmZE0hk1NkCpmp2+VI9cwXk4
         Qgi5h7sgY8bdIEg+73imC634kpUBye1zlQuoz7Qyzn1bWRjAbWne3MtDlBtxDB72NZGW
         77NNDnlq9guDpbV8cZpPFRGVJA+s/FY06bHlF7l3gkyK4W2aFQKVNzl7+h4poqoqXF3b
         jBHOqZrPeducjLA4FwVxMwWUDOzyB0YgQkSQZXjOc5qarpM+6UsEvtg3HnwhCunVCrC0
         hRqvzC3u9Eu6aKqHZOEE5XNDeVmBR2SHJpP017Fmwm1Frq2KFOzOa9HwJv+6TTDyNEJ3
         24ag==
X-Forwarded-Encrypted: i=1; AJvYcCVdDTHN3eY8Sp7ZI9O2/w/h1XQtmWAKkeOrPXUpYb0hpjgPMXFCqPD3pZHzqEw6Y83DTmcU1Tqa+dkJwrkq/cnxHDqCncjnN1oM+BYQ0X3hoi+E9kzzDIzojR7lxNtSIDM8RRo=
X-Gm-Message-State: AOJu0YzBSarxV/U+lcDO6Fgftk+2QpuWQ5iqM7faBw0DCkOsms/f7A10
	/JWox+TO9deF0ERonkjnvAfQHG83v7b0DJPw6MkBiytxFsJL/3kXUJNian0D
X-Google-Smtp-Source: AGHT+IFFFpxIJ9D+xvMR3vm5qw+sMLgba6Rv7MOBKR9AEGs4Dx7TjMu47lntFKKetaKkOZvUruM1XQ==
X-Received: by 2002:a92:d486:0:b0:366:b533:cef1 with SMTP id p6-20020a92d486000000b00366b533cef1mr3286707ilg.1.1711637942391;
        Thu, 28 Mar 2024 07:59:02 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:918f:1fce:e47c:7f91])
        by smtp.gmail.com with ESMTPSA id r24-20020a63e518000000b005bdbe9a597fsm1392278pgh.57.2024.03.28.07.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 07:59:01 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: rmfrfs@gmail.com,
	hansg@kernel.org,
	linux-media@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>,
	stable@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2] media: ov2680: Clear the 'ret' variable on success
Date: Thu, 28 Mar 2024 11:58:41 -0300
Message-Id: <20240328145841.2514534-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Since commit 63b0cd30b78e ("media: ov2680: Add bus-cfg / endpoint
property verification") even when the correct 'link-frequencies'
property is passed in the devicetree, the driver fails to probe:

ov2680 1-0036: probe with driver ov2680 failed with error -22

The reason is that the variable 'ret' may contain the -EINVAL value
from a previous assignment:

ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
			       &rate);

Fix the problem by clearing 'ret' on the successful path.

Tested on imx7s-warp board with the following devicetree:

port {
	ov2680_to_mipi: endpoint {
		remote-endpoint = <&mipi_from_sensor>;
		clock-lanes = <0>;
		data-lanes = <1>;
		link-frequencies = /bits/ 64 <330000000>;
	};
};

Cc: stable@vger.kernel.org
Fixes: 63b0cd30b78e ("media: ov2680: Add bus-cfg / endpoint property verification")
Suggested-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Use Hans' suggestion to clear 'ret'.

 drivers/media/i2c/ov2680.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 39d321e2b7f9..3e3b7c2b492c 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -1135,6 +1135,7 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
 		goto out_free_bus_cfg;
 	}
 
+	ret = 0;
 out_free_bus_cfg:
 	v4l2_fwnode_endpoint_free(&bus_cfg);
 	return ret;
-- 
2.34.1


