Return-Path: <linux-media+bounces-34564-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CB9AD6507
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 03:16:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3D9C172D2A
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 01:16:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A4A915ADB4;
	Thu, 12 Jun 2025 01:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sn+TuWXy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A501D156236
	for <linux-media@vger.kernel.org>; Thu, 12 Jun 2025 01:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749690957; cv=none; b=jbfhrVjqM2uU42wUwIOHdAvcv0XTDmV7Ic1eFgYsfeiD2FxElnGBpw3hTDgR69J4K5kiBPUM56cizg0iTylURs/LLTUVaTmta6Fd99C9VtdaSTPxkSlxHWczZS4yOgysLWk9IUyKPkWNY0Msg5mDHD7mzBoH3LkXQtQI4+qs6wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749690957; c=relaxed/simple;
	bh=/XhbVM4wWSMUnltH22SqmYD67wEfCALUV37VwxYBKRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gy6fd1xgQ6DMgFyhWD/7ZYMmYbDbxGPVg9DlXQ8PkOuabv8Md/h9Z18AEX1VDx27yMd0cvKQ/cBc5euUIpwUTTvg34/kU6ve7yMhdOFTh45arVKXqDQElRgWUMGfyxIdCKHtdgLEbuyhzm5qlZCgU+FDZqtzNumaqeRPHNWhOZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sn+TuWXy; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-32b358f9265so89671fa.0
        for <linux-media@vger.kernel.org>; Wed, 11 Jun 2025 18:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749690953; x=1750295753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZ2Yg+hw1/125iG7FYFyo2XHO42QFH1nZ0UWT9nVLTA=;
        b=sn+TuWXy5TcFuBJYENNxSMmOI4z3COBpKgtHUc5Ph4Hz05HqB2+u/e1hB0jCvdXQiR
         p89+q13PpjLXJZXbOsVsVdoKPh34EjD026dETAv2JmkMKb/3I8P6EAgYoNo6Y0s1mbj/
         WSWqd2kQFgA5lezNs001H5LRA0yuSLQ7HuggS/QyQhaJi9SCbRCNqZoWYypY3KdNMbu8
         4XBQKjZnvNCML/PAj8lbkMR/OMqRy4XX/UAvSMM9JxKWFwtTwoNnS9yA9rHH6Joz4PD7
         KsJ+Z+ZjAP82ldTCV0RsnM9w8kAWeKoY6pPl8gcMDnhWgsvfEkHD5wUHim9A1VNExOYh
         2x8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749690953; x=1750295753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dZ2Yg+hw1/125iG7FYFyo2XHO42QFH1nZ0UWT9nVLTA=;
        b=EJKG0GjgQSmMzx/0Qx4EL8RDt09neXGnJMA3t38gUKVIk9NqYrXYX/qdHe6rbpkxiW
         CqLqQCj9UUg/pG2f3uXwwYCBeeTsxH1pxpPkkoono3FjyQfRf1qDxW/swi95C+2ShMHp
         uPLRaibDRS3acEAuQE4uo/vXN7oXCmdDeHQKv2ORfUgnL/Qpo2IBVD1JUW9kckuYNwxU
         ZSrYJ0umRpyxmuNPnNWdvEKGbxp1e259IJ+hxPMauRRB03voTHSewAZlMCfvPaQ2rKTV
         7G4uVQdAvGSb6JRDFc3X/ShgbhRJK0o6nhLd2Ork91AliUCEbqGDGltfLgEWmbLuucNu
         Tdjw==
X-Forwarded-Encrypted: i=1; AJvYcCWuYsITF6UN0ea5NuJp7SQ2/bTZ2cf8OCsUR+9sT5Qk7oJVYNNS2lvoL5fImSVTcETA7ZjW1hy9N75gsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpMp32c8/dt+NjnrDfliJ545ovd2sOLoMCxWUkqEjdOXY6mZMY
	5UWYJ5OY8n9BBK8R3ZTVLnH2tZrmGcPcjtUgHMcmLBgGCbQ5ljsMIyuUY7NoHntM6fc=
X-Gm-Gg: ASbGncvGC//bjfg5e4NAsZrtMSYi+h2qQvjiZG5ay7gzOFyP0jvTs/K9GPVg04Ea699
	3c0WzHO7kadHuN0eYSa7PKGw50l426FqoBaRtPpB+3D2eEoIAxrJXmWpQbva6DHHymMu4nPulUf
	VUs4qc4+ZSjClITTUxIoS2GV1AB+1VGckd38Edi0ovSl5pknU/W82P5NzfsjM3DFOUevh+XbvSP
	s/hJARkbJaYqI8G4PTO0gyCHHO8IgTceE7GzBRt3JEh8G6nqaGgf95pbr0vSHjDp2CZeXqN+kxk
	qi8zcoetmwgzTHcdT136pNr+Sv5DgrUx99Roq/N0oNJ+JRPBnT2NKIg02Ju+Qy33u37h6y2Nkuh
	oz+ZiXw/9b3b0EW6xapR7eGD/ncFIJ/Y8FD6mzEJFoNTNGGhyxmk=
X-Google-Smtp-Source: AGHT+IHm91uAYi4NKW7xBMaxW2aWgQgZM3ryOzUpvaUBQco+HVLoDZFQ7XSw3K4U3HUpWMmUW8p0Bw==
X-Received: by 2002:a05:6512:3d0d:b0:553:2bf7:77bf with SMTP id 2adb3069b0e04-5539c0d3b49mr633019e87.8.1749690952737;
        Wed, 11 Jun 2025 18:15:52 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553a7018069sm62808e87.157.2025.06.11.18.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 18:15:51 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 07/10] media: qcom: camss: csiphy: probe any present children CSIPHY subdevices
Date: Thu, 12 Jun 2025 04:15:28 +0300
Message-ID: <20250612011531.2923701-8-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add CSIPHY driver routines to catch any possible csiphy subdevices
under CAMSS device tree node.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../media/platform/qcom/camss/camss-csiphy.c  | 248 ++++++++++++++++++
 .../media/platform/qcom/camss/camss-csiphy.h  |   3 +
 drivers/media/platform/qcom/camss/camss.c     |   2 +
 3 files changed, 253 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index f561811b7617..3020f7d0f621 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -17,6 +17,7 @@
 #include <linux/pm_runtime.h>
 #include <media/media-entity.h>
 #include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
 #include "camss-csiphy.h"
@@ -24,6 +25,17 @@
 
 #define MSM_CSIPHY_NAME "msm_csiphy"
 
+struct csiphy_priv {
+	struct device *dev;
+	unsigned int id;
+	struct camss *camss;
+	struct csiphy_device *csiphy;
+
+	struct v4l2_async_notifier notifier;
+
+	bool combo_mode;
+};
+
 static const struct csiphy_format_info formats_8x16[] = {
 	{ MEDIA_BUS_FMT_UYVY8_1X16, 8 },
 	{ MEDIA_BUS_FMT_VYUY8_1X16, 8 },
@@ -836,3 +848,239 @@ void msm_csiphy_unregister_entity(struct csiphy_device *csiphy)
 	v4l2_device_unregister_subdev(&csiphy->subdev);
 	media_entity_cleanup(&csiphy->subdev.entity);
 }
+
+static int csiphy_notify_bound(struct v4l2_async_notifier *notifier,
+			       struct v4l2_subdev *subdev,
+			       struct v4l2_async_connection *asd)
+{
+	struct csiphy_priv *csiphy_priv = container_of(notifier,
+						struct csiphy_priv, notifier);
+	struct camss_async_subdev *csd = container_of(asd,
+						struct camss_async_subdev, asd);
+	struct csiphy_device *csiphy = csiphy_priv->csiphy;
+	struct media_entity *sensor = &subdev->entity;
+	unsigned int i;
+
+	/* Keep parsed media interface data, but set the correct port id */
+	csiphy->id = csiphy_priv->id;
+	csiphy->cfg.csi2 = &csd->interface.csi2;
+
+	for (i = 0; i < sensor->num_pads; i++)
+		if (sensor->pads[i].flags & MEDIA_PAD_FL_SOURCE)
+			break;
+
+	if (i == sensor->num_pads) {
+		dev_err(csiphy_priv->dev, "No source pad in external entity\n");
+		return -EINVAL;
+	}
+
+	return media_create_pad_link(sensor, i, &csiphy->subdev.entity,
+				MSM_CSIPHY_PAD_SINK,
+				MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED);
+}
+
+static int csiphy_notify_complete(struct v4l2_async_notifier *notifier)
+{
+	struct csiphy_priv *csiphy = container_of(notifier, struct csiphy_priv,
+						  notifier);
+	struct camss *camss = csiphy->camss;
+
+	return v4l2_device_register_subdev_nodes(&camss->v4l2_dev);
+}
+
+static const struct v4l2_async_notifier_operations csiphy_notify_ops = {
+	.bound = csiphy_notify_bound,
+	.complete = csiphy_notify_complete,
+};
+
+static int msm_csiphy_parse_ports(struct csiphy_priv *csiphy)
+{
+	struct device *dev = csiphy->dev;
+	struct fwnode_handle *fwnode = dev_fwnode(dev), *ep;
+	unsigned int num_endpoints = fwnode_graph_get_endpoint_count(fwnode,
+						FWNODE_GRAPH_DEVICE_DISABLED);
+	int ret;
+
+	switch (num_endpoints) {
+	case 0:
+		return 0;
+	case 1:
+		break;
+	case 2:
+		csiphy->combo_mode = true;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	v4l2_async_nf_init(&csiphy->notifier, &csiphy->camss->v4l2_dev);
+	csiphy->notifier.ops = &csiphy_notify_ops;
+
+	fwnode_graph_for_each_endpoint(fwnode, ep) {
+		struct camss_async_subdev *csd;
+
+		csd = v4l2_async_nf_add_fwnode_remote(&csiphy->notifier, ep,
+						struct camss_async_subdev);
+		if (IS_ERR(csd)) {
+			ret = PTR_ERR(csd);
+			goto err_remote;
+		}
+
+		ret = camss_parse_endpoint_node(dev, ep, csd);
+		if (ret < 0)
+			goto err_remote;
+	}
+
+	ret = v4l2_async_nf_register(&csiphy->notifier);
+	if (ret)
+		goto err_cleanup;
+
+	return 0;
+
+err_remote:
+	fwnode_handle_put(ep);
+err_cleanup:
+	v4l2_async_nf_cleanup(&csiphy->notifier);
+
+	return ret;
+}
+
+static int msm_csiphy_init(struct csiphy_priv *csiphy)
+{
+	struct camss *camss = csiphy->camss;
+	unsigned int i = csiphy->id, j;
+	int ret;
+
+	ret = msm_csiphy_subdev_init(camss, &camss->csiphy[i], i);
+	if (ret < 0) {
+		dev_err(csiphy->dev, "Failed to init csiphy%d sub-device: %d\n",
+			i, ret);
+		return ret;
+	}
+
+	ret = msm_csiphy_register_entity(&camss->csiphy[i], &camss->v4l2_dev);
+	if (ret < 0) {
+		dev_err(csiphy->dev, "Failed to register csiphy%d entity: %d\n",
+			i, ret);
+		return ret;
+	}
+
+	for (j = 0; j < camss->res->csid_num; j++) {
+		ret = media_create_pad_link(&camss->csiphy[i].subdev.entity,
+					    1 /* source */,
+					    &camss->csid[j].subdev.entity,
+					    0 /* sink */,
+					    0);
+		if (ret < 0) {
+			dev_err(csiphy->dev,
+				"Failed to link csiphy%d to csid: %d\n",
+				i, ret);
+			msm_csiphy_unregister_entity(&camss->csiphy[i]);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int msm_csiphy_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *phy_node = dev_of_node(dev), *camss_node;
+	struct csiphy_priv *csiphy_priv;
+	struct of_phandle_iterator it;
+	struct camss *camss;
+	unsigned int i = 0;
+	int ret;
+
+	/* Bail out if camss device driver has not yet been registered */
+	camss = dev_get_drvdata(dev->parent);
+	if (!camss || !camss->v4l2_dev.dev)
+		return -EPROBE_DEFER;
+
+	camss_node = of_get_parent(phy_node);
+	if (!camss_node)
+		return -ENODEV;
+
+	of_for_each_phandle(&it, ret, camss_node, "phys", "#phy-cells", -1) {
+		if (it.node != phy_node) {
+			i++;
+			continue;
+		}
+
+		if (!of_node_name_eq(it.node, "phy") ||
+		    !of_device_is_available(it.node))
+			ret = -ENODEV;
+
+		of_node_put(it.node);
+		break;
+	}
+	of_node_put(camss_node);
+
+	if (ret)
+		return ret;
+
+	if (i >= camss->res->csiphy_num)
+		return -EINVAL;
+
+	csiphy_priv = devm_kzalloc(dev, sizeof(*csiphy_priv), GFP_KERNEL);
+	if (!csiphy_priv)
+		return -ENOMEM;
+
+	csiphy_priv->dev = dev;
+	csiphy_priv->camss = camss;
+	csiphy_priv->id = i;
+	csiphy_priv->csiphy = &camss->csiphy[i];
+
+	ret = msm_csiphy_init(csiphy_priv);
+	if (ret < 0)
+		goto err_parse;
+
+	ret = msm_csiphy_parse_ports(csiphy_priv);
+	if (ret < 0)
+		goto err_cleanup;
+
+	dev_set_drvdata(dev, csiphy_priv);
+
+	return 0;
+
+err_cleanup:
+	msm_csiphy_unregister_entity(csiphy_priv->csiphy);
+err_parse:
+	v4l2_async_nf_unregister(&csiphy_priv->notifier);
+	v4l2_async_nf_cleanup(&csiphy_priv->notifier);
+
+	return ret;
+}
+
+static void msm_csiphy_remove(struct platform_device *pdev)
+{
+	struct csiphy_priv *csiphy_priv = dev_get_drvdata(&pdev->dev);
+
+	msm_csiphy_unregister_entity(csiphy_priv->csiphy);
+
+	v4l2_async_nf_unregister(&csiphy_priv->notifier);
+	v4l2_async_nf_cleanup(&csiphy_priv->notifier);
+}
+
+static const struct of_device_id csiphy_dt_match[] = {
+	{ .compatible = "qcom,csiphy", },
+	{}
+};
+
+static struct platform_driver csiphy_platform_driver = {
+	.probe	= msm_csiphy_probe,
+	.remove	= msm_csiphy_remove,
+	.driver	= {
+		.name		= "qcom-csiphy",
+		.of_match_table	= csiphy_dt_match,
+	},
+};
+
+void __init msm_csiphy_driver_register(void) {
+	platform_driver_register(&csiphy_platform_driver);
+}
+
+void __exit msm_csiphy_driver_unregister(void) {
+	platform_driver_unregister(&csiphy_platform_driver);
+}
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index f092b7ff2f26..b984aa745c78 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -120,6 +120,9 @@ int msm_csiphy_register_entity(struct csiphy_device *csiphy,
 
 void msm_csiphy_unregister_entity(struct csiphy_device *csiphy);
 
+void msm_csiphy_driver_register(void);
+void msm_csiphy_driver_unregister(void);
+
 extern const struct csiphy_formats csiphy_formats_8x16;
 extern const struct csiphy_formats csiphy_formats_8x96;
 extern const struct csiphy_formats csiphy_formats_sdm845;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 40bb20bbe8b4..57a522fcb8c0 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3955,6 +3955,7 @@ static struct platform_driver qcom_camss_driver = {
 
 static int __init qcom_camss_init(void)
 {
+	msm_csiphy_driver_register();
 	return platform_driver_register(&qcom_camss_driver);
 }
 module_init(qcom_camss_init);
@@ -3962,6 +3963,7 @@ module_init(qcom_camss_init);
 static void __exit qcom_camss_exit(void)
 {
 	platform_driver_unregister(&qcom_camss_driver);
+	msm_csiphy_driver_unregister();
 }
 module_exit(qcom_camss_exit);
 
-- 
2.49.0


