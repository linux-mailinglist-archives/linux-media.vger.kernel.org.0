Return-Path: <linux-media+bounces-8148-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E286890DCB
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 23:44:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EF851C237F1
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 22:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E0133BBE2;
	Thu, 28 Mar 2024 22:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gGO0ZD07"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A2E28DCA;
	Thu, 28 Mar 2024 22:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711665867; cv=none; b=ksi0jYLOOqfprFXVaUvPgzu4aNcG4q1WS8s2dN1hXDrmVE4jy1eIzYKWBbRhyvTGe3ccjJXS2c5Eql/vHg8p/huYc/m4cDOXntieMPc07SZ5zwO37Lt+6ETmTf/pxLfYhlbTRjavDu1Mv89yQapDZ02VEyo/XCYrRXC5Vo8QEDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711665867; c=relaxed/simple;
	bh=c3y08xt8WX3gKpLjiR3vPSUSjnlEc9rwriv3RDGddRc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BnMqnqK9qW+h93FGMpobXmHE3jFUIUhawh0iHvJM74lsSE9RZHr5Pj7Z0P5A3hTX9ibfxB7piG9Xz0k/+goZ84VBEnX4hfFDB+1zb+9vYZffNnpTi24qtBFRGgN7At+yLzwsCg9b5xUQ7/ZrZYwUbH7JOVYZ2ZCDY7DT4CXefdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gGO0ZD07; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5d862e8b163so309846a12.1;
        Thu, 28 Mar 2024 15:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711665865; x=1712270665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2fb7ARSCTkkzaRExaYB+HhJDJgPWjFBY2n/btvSfA60=;
        b=gGO0ZD07u1kasxtPcnozL7hHXF7mTDOGC4binXpwmlm8LTU0w9iyvF1wURd3uPoirH
         ktE8teFu3XaOvb9KJL6Wl/Ot1g2h4zwuLPrDJvzekFjcpmsa0M2Wn7PfEr0X+AoMUgJ/
         R4Rv8dPc0tGCvwTZHZaIxaX34DQLJR2MHN49QUyJwS+fYTbWjg4+jX24xsE/Lj5GrnAf
         UtT4KmDJDMn0OmMN/UAxoUyhOhilwCwUZ+Fkxpc0RIfNJ7F9DrWKuLp4EBQ6D10/JPu3
         JzekINtDmbx5vtV22Y+22iIEniT9edq882b8iD5pSkCu7KoCA/ETKGgU8pVRftyOCwfY
         VgaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711665865; x=1712270665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2fb7ARSCTkkzaRExaYB+HhJDJgPWjFBY2n/btvSfA60=;
        b=vbR+kmtkHrcJybVqgTPed/ryh8Nbdx9o1/GdnTcd4AiJKAAdXMGqOr8DCaNRs2runR
         JjLpw0wdODPlOVJ9HKX2uBqGManc6YGXcrkVGrh24qpVuOSYNgmEJzo0UNsL5jWIIZrF
         Kbzw2KVwUEsfVLEc9HOVsQWbzxeQ3gRhsR6XHDKvlW43xMgc4KxxzAGekan55mwWT9tR
         NYcGK2zs1ch+tL7lITno6jOAqbWIhyqUzjS4DMZPtjcGONE4haEHg39Sufxjuy9W/PXJ
         iu8ScD+DiCbMOLwDMxHCFNDUHRMWKuJYpT1ZWSU0w9DyJC4tQk14Lo6hBNk3H7HRRqaU
         JbQg==
X-Forwarded-Encrypted: i=1; AJvYcCVWLIqnbR5HqFobyNlzPzqIzK+1nN+q2b/JWgFqmwnMRLoVAMJfQ9YJEz5Q7zE91kwrc0BkLWXJM9lCY2bgrKjYDxIFQOQrwND1XFYaQQSZGpit/wkfNiL3j8q0GQB1hqGlQqs=
X-Gm-Message-State: AOJu0Yzuap3HatjR/vd8NgtAvNJvGPA2vHZhuXEkZFnQXWZS5UXtK4WG
	dKlZIobfP5Cb03sVDm91s/77zj44ALhCsDGWMTSFFWMN1BI5uJwj
X-Google-Smtp-Source: AGHT+IF2SY0WQJdypi3TwaYbsbsixETtqS/1bW/NOcLoNuv3OXlqKGNPjx71yVBg9cHD9qhxUe47yQ==
X-Received: by 2002:a17:902:e88b:b0:1dd:b54c:df51 with SMTP id w11-20020a170902e88b00b001ddb54cdf51mr848384plg.4.1711665864805;
        Thu, 28 Mar 2024 15:44:24 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:918f:1fce:e47c:7f91])
        by smtp.gmail.com with ESMTPSA id o4-20020a1709026b0400b001dd59b54f9fsm2152522plk.136.2024.03.28.15.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 15:44:24 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: hdegoede@redhat.com,
	rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com,
	linux-media@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>,
	stable@vger.kernel.org
Subject: [PATCH v3 1/2] media: ov2680: Clear the 'ret' variable on success
Date: Thu, 28 Mar 2024 19:44:12 -0300
Message-Id: <20240328224413.2616294-1-festevam@gmail.com>
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
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
Changes since v2:
- Collected Hans' Reviewed-by tag.

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


