Return-Path: <linux-media+bounces-41619-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3306CB4114E
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 02:23:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5444488129
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 00:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2116D18A6B0;
	Wed,  3 Sep 2025 00:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pIkmBkHF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA821891A9
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 00:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756858993; cv=none; b=NSDLyNxG98MKHGlKjkjJl96hHBiMTAvNPY5la0b5t8alp6QdFuqRJaogO8G/UwmACimu4/RtTcDejXC4yo48Dujztqm9dvyr7Ccsm7t2QkxsoRIDdPa53RWShMNBcl5xLHOSjZWsHPO8IF+Ft7sAP1ds15SJ4NaaxKh3wxUKfIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756858993; c=relaxed/simple;
	bh=90ob9/t3YxVrWZvOIbki9BV2MSu7FtEbIVyu2FmbVI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OHjlvBrROfQBmG62thXaTucfPyj0IhhhuWQfY4qvRFZKC55woppRtY4alXNc+QD1Sawdehh6xu27Nlvix7SeZeeFddPgjndp2o8oqct/zlZSJYFC7Wy41G1nQeD/Wa68M7X2loeXfqp9ibCCJ+1U5igVJscBqOmvSptyFKIBI+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pIkmBkHF; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55f6d164d37so1011464e87.3
        for <linux-media@vger.kernel.org>; Tue, 02 Sep 2025 17:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756858990; x=1757463790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o2USbe6RBvGLraWIOuZ7Kl2anITPV7/ZWi53dlFPxg4=;
        b=pIkmBkHFc0eTVtx66RHNLK7dOc40ExYTy3iGswcpqe0e/wGyxNI2v8U9GKl40a5eqn
         amyx3AmMqQv7gIg869xqgdhRau5ZGzHIezCNjxy6Q65A+lyGdsCe5dyq/adIDAiwBkZu
         MkOriEYIpqlmn5B+D3871gqpUFSY6EdFsKIwS6jZTKO9eeO0Vt6HzOwp8xwFk65kHPeU
         C1pJnHIlDwa2r5GKnYfk8lSeZIP8izUu1edSqkiMkC3/oNgLzQgvYQ0qfUchoto27tGZ
         i6gUxSz0Zbj853C3DzT6zu0vb7+ROHHVgFD9xF9v6+OrrBOab4bD1/hz+8c2pbvRXyFY
         bbyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756858990; x=1757463790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o2USbe6RBvGLraWIOuZ7Kl2anITPV7/ZWi53dlFPxg4=;
        b=U1A+OsiYGPPDZM5cRRqRgKtVkYMQEpsnxE3O0PmqGgBQ23uOf25w60j/nDaNKVUJjg
         /y6dAUxSkn+tNCk6jkINHB46YX7QzD9bOcL0PcSD+wLUb4WYk93oFEZarx5fhJufyWBH
         A0Ve5tzciwMp+7cjiXotWppUYZK9U/dUetuCIt7X7G3+gF1kPf9JWhv373rFrjZialzI
         jP41elSMaxhZ3RGJtxt7c/xB9HPoikKltYBiv+NyRmKdd9LU4CNCGAe8guoTseT8Bq/F
         SlzCjRNFHwjXxKA/NhQ3h2idMvkMF84+OruNVkASPtWYTyfx+7j0b55Ry4XxoWqkxyEz
         M6NQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMBt4Xgbqy1DyNGTD0OB4VBomKFpcBE6rgFDQ/nlGPHHFIR8SYyv8gJvQAaP/wPJynFl3X5G3GuqyZNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMDavllXuGVAO+WDO2IZbxp1W7ZFyQ+y9nL523ulpnguQIzr49
	ZLVW7f9wP32NFhqpskZQzjrIWDZhLb03Uk/sBJS0WsasRE6l++8muxEO8jTNnLRt+x8=
X-Gm-Gg: ASbGncu8c0CNhsNLhFXPPZcJCgSLKa/+aDA6SndyPcrLph6826Ago5z9U9S6FPG2h8p
	K4guTUGPiAZ0ODCEJuVXPHSXIm48gN6D/bjgZZV6jwRK8a3csZMfyOmcgau0lnS3Ukc3lNAV1cz
	VjCUddE52rQ34N7YzqZCkSlcnD4fg0vUYqmeeMFvSFMJ2ro1mNfNyNmCmtjif7P0POF6HNM7tpe
	Hft2qTZz+X4ZM7JM2/dO8mdcCFD876P0sKcbDWu6KZFh5aTftdJBWGXo3t/cD/ha1WxHB2DQHGE
	lusjLMSpscONx/Qk+PMNT1ZUUxC3p/hNkYZwhyPmoF/dPkkWGmurujw8MGH9ZbpT72+GjjjVlfN
	D/aQKvvGGZ2lT4P417SnuLi7nIcDQ+MVM0ZguAa73uU0MKDS1M17GlESrNU2PEFrSLun2Wo0=
X-Google-Smtp-Source: AGHT+IHxyPJiIG+anKFUoqMZr3UQwx3Pl95ntx8DnT78HDmC1kF1GQhOBB2E5YfC8IZ7m4SyaJKkFg==
X-Received: by 2002:a05:6512:108e:b0:55f:3ebc:132c with SMTP id 2adb3069b0e04-55f6af04c8bmr2776306e87.0.1756858990026;
        Tue, 02 Sep 2025 17:23:10 -0700 (PDT)
Received: from thyme.local (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608acfaae4sm129649e87.99.2025.09.02.17.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 17:23:08 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 4/5] media: qcom: camss: change internals of endpoint parsing to fwnode handling
Date: Wed,  3 Sep 2025 03:22:54 +0300
Message-ID: <20250903002255.346026-5-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250903002255.346026-1-vladimir.zapolskiy@linaro.org>
References: <20250903002255.346026-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since a few called V4L2 functions operate with fwnode arguments the change
from OF device nodes to fwnodes brings a simplification to the code.

The camss_parse_endpoint_node() function is called once by camss_probe(),
and there is no use of knowing a number of asynchronously registered
remote devices, so it makes sense to remove the related computation from
the function.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 49 +++++++++++------------
 1 file changed, 23 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 42f392f6f3a8..be1c62d27e2b 100644
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
 
@@ -3025,49 +3025,46 @@ static int camss_of_parse_endpoint_node(struct device *dev,
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
 
@@ -3623,7 +3620,7 @@ static int camss_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dev);
 
-	ret = camss_of_parse_ports(camss);
+	ret = camss_parse_ports(camss);
 	if (ret < 0)
 		goto err_v4l2_device_unregister;
 
-- 
2.49.0


