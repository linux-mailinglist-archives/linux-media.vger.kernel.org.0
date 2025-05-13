Return-Path: <linux-media+bounces-32400-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A31AB56FF
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 16:24:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B8D24A6510
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 14:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D3332BE7A5;
	Tue, 13 May 2025 14:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WGQEdub4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F4D2BE10B
	for <linux-media@vger.kernel.org>; Tue, 13 May 2025 14:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747146254; cv=none; b=rOlEMwqOV4pd/KyBFV+IIv9it3pjAPqdzwSwLmIRLUmOhHb2c1sHkrEeUltUrySf/ZAQBLO/L72A+IVtULyAToxYC6EkdriNpYVUFqzLkS9ZQBuYMjg75qNFgQr88NxEaibqBZHExxyB2Zt/Q4IkuU8ciFqyJb1fcFTUDQSG0x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747146254; c=relaxed/simple;
	bh=Dg/kRgRiQN2QvOJWPN/51Hfk4qa0Ifb2gj/F+hVKG5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ffoMpO8o+jjowTfS1G5lM529RfTlV5czqQmJN8UBMR+FlSBXH4RmHdVSL+btNoY0wEYb/evhGzAYYBljhc9bTgsBoACm1LjIrUiYz+sGn00VFC0UGmb4yq7bb/MLy/QckbU0KH0ui77gyW0TOqyLDrMyK7jWuk7V9r6IoHdX2Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WGQEdub4; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54e66deb66fso891129e87.3
        for <linux-media@vger.kernel.org>; Tue, 13 May 2025 07:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747146251; x=1747751051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5/auQxm3IrAhfUVDmTuHtjr7cikuNi8RLWcR7PSjSIA=;
        b=WGQEdub4bgnJ3E7gJKXdrCAgNNErSBCU0oi9ccWArHL9gEz4+oKMKlnhX27YaVVjRJ
         4de89VU6EzBuwEC5HM7gz0A12B7BP5v6BG8WywLhLTAtyEqEB4QuNa2+4ERAM5M2WC4v
         NQB14czX3paTVL/1mZIBIrd2xrbOp3BOcJv0CDPv3WnevNpjmaxGeRWcp+YUDoN1Bg3F
         x9ghImOEm2d8aZK6NSmfppLlGwmKLWwL3aqfJxG5uWEBuKc6lrx17ghgIh5fYvfFU4hB
         nDrXRGzb4mdaZj5DxnPw+a9mKf59VnHw0VFkY2DhQLO0BtdquVGzk8anEHDrShjy5t9c
         k30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146251; x=1747751051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5/auQxm3IrAhfUVDmTuHtjr7cikuNi8RLWcR7PSjSIA=;
        b=KEVwmyhHqnbnOmeF6i8o3QfSI+WA+r8FBiiOBsccug7reaMH9NTnPvLez5qSB0cOHr
         faBrwRTKgYkZ25S5T/cUB1xvIU3biURZqzQPgr4+tDZl8cb8a6umDnrZBUO9J19RWQ6a
         V81aqAzh5y3OGAnLOFlYhs0WeB1iM1Dz8tPo/q1qnsxlypIEmLQPyFw+zhjhSiU5cPbp
         Dt8+stjSPqxKqXDLZ02xLclYqil/iDQkmAezDM8j7cPjkN4MKNqnIbq0LmHt75f8q3MO
         6YK9QTi/R+22ybFq0uYBrCfeHVlRhxITCUqnGkD7W9fDSZcliN55k7cZhgenUkaIuJMm
         7IEw==
X-Gm-Message-State: AOJu0YxgQERCPfP1X+YD48ucu/BbDfcB1L43GgN1u9qby5i1lPEN4+6+
	OdCZtEVqRslycRppsAs7Y8ySOgkpwExtgXzvRg+lcuv4ujsb/lMuWQp4endz5r4=
X-Gm-Gg: ASbGncs3DrRsTI/f+quJK3cNHVCmp+Wbnb55FESZmulCL4p6CsRK9uTLOuTnVM1lw+V
	Ep6nTR3gvxCFce8SYs0BBHxIdVElwbtTRy7jwfW81KNgw+1VYg/Opvn8eaLV1D27SbTbZF61IQB
	NBkm6e70MjIrIUiUAVmnsx4JHQj3/W/V6CqVA34aMFMpRpHRCUlMWfzkaUBxeXfcN7+DjPHxkUO
	iZSRoSlCQjVKCn/DXBl5BdFXro7gO/+5JIa36M+eQ3xJO7NFWgz/KSV9EJ59qU3Q1vK5y+zYXjO
	K1OTfOF0+8QnT4Nqgr6ISCsQSgw3QfHcRxt4E2u74qm8/ypVXatjGb3/6DQAKcAflr+MYKxvxRg
	5d0vEfMPPfi2YZQZ0F+7hh1buwl5wUanpEnFPFt5fDmewEYmXgtk=
X-Google-Smtp-Source: AGHT+IHqwEbFhZhgXovx7bSWXvfgsMhzKBNxgoML9g87PhfEO8ZtLUbvptRFKBUuDrk1kKgcCCoHpQ==
X-Received: by 2002:a05:6512:b10:b0:54d:6dd3:614e with SMTP id 2adb3069b0e04-54fc67aa84emr2239184e87.1.1747146250792;
        Tue, 13 May 2025 07:24:10 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc644fba0sm1871813e87.23.2025.05.13.07.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:24:10 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 7/9] media: qcom: camss: change internals of endpoint parsing to fwnode handling
Date: Tue, 13 May 2025 17:23:51 +0300
Message-ID: <20250513142353.2572563-8-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
References: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since a few called V4L2 functions operate with fwnode arguments the change
from OF device nodes to fwnodes brings a simplification to the code.

Because camss_probe() as the single caller of camss_of_parse_endpoint_node()
has no need to know a number of async registered remote devices, it makes
sense to remove the related computation from it. In addition there is no
reason to check for a OF device availability on CAMSS side, the check is
useless as the always passed one.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 52 ++++++++++-------------
 1 file changed, 23 insertions(+), 29 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 39c5472f4552..d4745fb21152 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2973,16 +2973,16 @@ static const struct parent_dev_ops vfe_parent_dev_ops = {
 };
 
 /*
- * camss_of_parse_endpoint_node - Parse port endpoint node
- * @dev: Device
- * @node: Device node to be parsed
+ * camss_parse_endpoint_node - Parse port endpoint node
+ * @dev: CAMSS device
+ * @ep: Device endpoint to be parsed
  * @csd: Parsed data from port endpoint node
  *
  * Return 0 on success or a negative error code on failure
  */
-static int camss_of_parse_endpoint_node(struct device *dev,
-					struct device_node *node,
-					struct camss_async_subdev *csd)
+static int camss_parse_endpoint_node(struct device *dev,
+				     struct fwnode_handle *ep,
+				     struct camss_async_subdev *csd)
 {
 	struct csiphy_lanes_cfg *lncfg = &csd->interface.csi2.lane_cfg;
 	struct v4l2_mbus_config_mipi_csi2 *mipi_csi2;
@@ -2990,7 +2990,7 @@ static int camss_of_parse_endpoint_node(struct device *dev,
 	unsigned int i;
 	int ret;
 
-	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(node), &vep);
+	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
 	if (ret)
 		return ret;
 
@@ -3025,52 +3025,46 @@ static int camss_of_parse_endpoint_node(struct device *dev,
 }
 
 /*
- * camss_of_parse_ports - Parse ports node
- * @dev: Device
- * @notifier: v4l2_device notifier data
+ * camss_parse_ports - Parse ports node
+ * @dev: CAMSS device
  *
- * Return number of "port" nodes found in "ports" node
+ * Return 0 on success or a negative error code on failure
  */
-static int camss_of_parse_ports(struct camss *camss)
+static int camss_parse_ports(struct camss *camss)
 {
 	struct device *dev = camss->dev;
-	struct device_node *node = NULL;
-	struct device_node *remote = NULL;
-	int ret, num_subdevs = 0;
+	struct fwnode_handle *fwnode = dev_fwnode(dev), *ep;
+	int ret;
 
-	for_each_endpoint_of_node(dev->of_node, node) {
+	fwnode_graph_for_each_endpoint(fwnode, ep) {
 		struct camss_async_subdev *csd;
+		struct fwnode_handle *remote;
 
-		if (!of_device_is_available(node))
-			continue;
-
-		remote = of_graph_get_remote_port_parent(node);
+		remote = fwnode_graph_get_remote_port_parent(ep);
 		if (!remote) {
 			dev_err(dev, "Cannot get remote parent\n");
 			ret = -EINVAL;
 			goto err_cleanup;
 		}
 
-		csd = v4l2_async_nf_add_fwnode(&camss->notifier,
-					       of_fwnode_handle(remote),
+		csd = v4l2_async_nf_add_fwnode(&camss->notifier, remote,
 					       struct camss_async_subdev);
-		of_node_put(remote);
+		fwnode_handle_put(remote);
 		if (IS_ERR(csd)) {
 			ret = PTR_ERR(csd);
 			goto err_cleanup;
 		}
 
-		ret = camss_of_parse_endpoint_node(dev, node, csd);
+		ret = camss_parse_endpoint_node(dev, ep, csd);
 		if (ret < 0)
 			goto err_cleanup;
-
-		num_subdevs++;
 	}
 
-	return num_subdevs;
+	return 0;
 
 err_cleanup:
-	of_node_put(node);
+	fwnode_handle_put(ep);
+
 	return ret;
 }
 
@@ -3626,7 +3620,7 @@ static int camss_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dev);
 
-	ret = camss_of_parse_ports(camss);
+	ret = camss_parse_ports(camss);
 	if (ret < 0)
 		goto err_v4l2_device_unregister;
 
-- 
2.45.2


