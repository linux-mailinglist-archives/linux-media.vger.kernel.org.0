Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE8C38B62A
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 13:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727929AbfHMLEH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 07:04:07 -0400
Received: from mail-vs1-f73.google.com ([209.85.217.73]:40043 "EHLO
        mail-vs1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbfHMLEH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 07:04:07 -0400
Received: by mail-vs1-f73.google.com with SMTP id v9so28901360vsq.7
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2019 04:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=saq5XDceOIgoGr9TXKhDgKirX3SqKoE0qoHBi968/xk=;
        b=gDO1KkDTJUciiu/w2pWa46oNOHB2NW+diPTrQSe6UjOmk/n2EoRpy+rDWdBYJuiKzY
         6x6LgDF5KDKyv9VXmseeyAu3LhFkBOtjkbVjLcCMTQsulzf1fQZYMwK97ErqMxCmCX3D
         S7EApgu5kjDAFza//vwbwwa1Gk59twIlmD1KY7DRHQFJrGUzS5zFJe0CbCc0GIqHF4io
         VFLPmmZnVQfYKNtjAbG8Evu6bf3DyEGgeEqB45NKR7BoQ3ILZ+L7a3sdX45sWfvGO1sY
         XSFc2NiIuWZftfLGRjyOg7nh1+UFJBut3iAOv4jzfoc8SYbt4t+/WIT5Jms6mAK+9E0I
         NTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=saq5XDceOIgoGr9TXKhDgKirX3SqKoE0qoHBi968/xk=;
        b=p2M5Rws7C2ETp27geigYTyOB2tzZajJFddwrvM/72GB3pUxiRuWvA++dTrMrersNhH
         BpnteeOHLcax+Mor7i7iyAsNsoZPmDm8PX+szVz3Oc5ktNK5Io31ayGFT49UmUbQcll7
         XOgYIvz9MZncq3VS5kqysQL4tPbLb3Nnc1cZD0wZaNX3etUvwOw0V598j6iLlvN6HoAY
         4Vqc/zjngrtOnMrR2UxlUbyKatzLt92p4cN31iXbHXe8ab0+mJ335qjTsRftNW9vFelb
         vmvt+KeGyu6c7L4u5NUdi8RAfjxva0gKWF2pYWuPLrIJK+xlBwoYjdAY5Mp86jprfThG
         ExOQ==
X-Gm-Message-State: APjAAAX4bhvl6m+k7FSLIbTzKCKPPB5TKYTZU6rcncrWzP/1O+Pyq61+
        o+HXh20md2v3jN1WmB7Iss2p4QgZ/SE=
X-Google-Smtp-Source: APXvYqyRU0LZVcPWtHHZrERKAl27mwogAt6+FnB4yxVhw/aK7Ob1F1wrsG/rm4k4QQRTeI1EszqJIbqVp0I=
X-Received: by 2002:a67:fa44:: with SMTP id j4mr10655278vsq.138.1565694246217;
 Tue, 13 Aug 2019 04:04:06 -0700 (PDT)
Date:   Tue, 13 Aug 2019 13:02:38 +0200
In-Reply-To: <20190813110300.83025-1-darekm@google.com>
Message-Id: <20190813110300.83025-7-darekm@google.com>
Mime-Version: 1.0
References: <20190813110300.83025-1-darekm@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v6 6/8] drm: tegra: use cec_notifier_conn_(un)register
From:   Dariusz Marcinkiewicz <darekm@google.com>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "open list:DRM DRIVERS FOR NVIDIA TEGRA" 
        <linux-tegra@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the new cec_notifier_conn_(un)register() functions to
(un)register the notifier for the HDMI connector, and fill in
the cec_connector_info.

Changes since v4:
	- only create a CEC notifier for HDMI connectors

Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/gpu/drm/tegra/output.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index bdcaa4c7168cf..34373734ff689 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -70,6 +70,11 @@ tegra_output_connector_detect(struct drm_connector *connector, bool force)
 
 void tegra_output_connector_destroy(struct drm_connector *connector)
 {
+	struct tegra_output *output = connector_to_output(connector);
+
+	if (output->cec)
+		cec_notifier_conn_unregister(output->cec);
+
 	drm_connector_unregister(connector);
 	drm_connector_cleanup(connector);
 }
@@ -163,18 +168,11 @@ int tegra_output_probe(struct tegra_output *output)
 		disable_irq(output->hpd_irq);
 	}
 
-	output->cec = cec_notifier_get(output->dev);
-	if (!output->cec)
-		return -ENOMEM;
-
 	return 0;
 }
 
 void tegra_output_remove(struct tegra_output *output)
 {
-	if (output->cec)
-		cec_notifier_put(output->cec);
-
 	if (output->hpd_gpio)
 		free_irq(output->hpd_irq, output);
 
@@ -184,6 +182,7 @@ void tegra_output_remove(struct tegra_output *output)
 
 int tegra_output_init(struct drm_device *drm, struct tegra_output *output)
 {
+	int connector_type;
 	int err;
 
 	if (output->panel) {
@@ -199,6 +198,21 @@ int tegra_output_init(struct drm_device *drm, struct tegra_output *output)
 	if (output->hpd_gpio)
 		enable_irq(output->hpd_irq);
 
+	connector_type = output->connector.connector_type;
+	/*
+	 * Create a CEC notifier for HDMI connector.
+	 */
+	if (connector_type == DRM_MODE_CONNECTOR_HDMIA ||
+	    connector_type == DRM_MODE_CONNECTOR_HDMIB) {
+		struct cec_connector_info conn_info;
+
+		cec_fill_conn_info_from_drm(&conn_info, &output->connector);
+		output->cec = cec_notifier_conn_register(output->dev, NULL,
+							 &conn_info);
+		if (!output->cec)
+			return -ENOMEM;
+	}
+
 	return 0;
 }
 
-- 
2.23.0.rc1.153.gdeed80330f-goog

