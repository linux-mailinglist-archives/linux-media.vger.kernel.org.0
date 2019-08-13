Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC6738B626
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 13:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbfHMLED (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 07:04:03 -0400
Received: from mail-qk1-f201.google.com ([209.85.222.201]:33378 "EHLO
        mail-qk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbfHMLED (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 07:04:03 -0400
Received: by mail-qk1-f201.google.com with SMTP id f22so14841183qkg.0
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2019 04:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=ip9lF/U/ATkDBCN52xa8MDYElKkFg+n6UubAPvcwdoQ=;
        b=L8MnBJ66KutyhXM1pVJve1tTkI9eCP1J5jPB3Zz1KokSDUH6mh59HIERL2XGmcVUPr
         3WrIC6I9g5N127W9P+9Rp5VuHoeaKnvsC+8o341cSsS2xtEvgkrarWZA8QbeVAOjMGe1
         liVA/FbdyxZivqYi7Yr+irg6HA4OxJeMf/IF0alLg66zc6sUjvufCQCkDO3FCvv2e4Zv
         3SHnX+IE4HMfr4asT3FCECTYCwZKb0b2SKzJ3if+MCbZXG6GvmwgU3l8ogIEl6tkipYu
         e7wOP85XCH2b5SpFdqb7dERv+2Zz6z1h5BRtL99ey4tkpST978h96jVyK5Chw7JsPAFd
         Yfpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=ip9lF/U/ATkDBCN52xa8MDYElKkFg+n6UubAPvcwdoQ=;
        b=QCCH3rbrqaFzDmTnEsHCmjTvi4J8gNFK7PX7nngsiFMuhwn6KhjfNmvlGzf/X/ig62
         MUrDVz+AOY/Btow82lXmiMqveRWiQ+1Rs6FpmC+E16h9e3w/ebtryDVv6Lpzx0oMZ/Z6
         sNNvAYTHIXPs8JIRc8Wxbl3LMUxB3qogEtaSyvkbJ+rXlSbVCe62WnxnbtramWW+aJpu
         y312/L3Y1i9HgaZo17OotKWG1rMUbor3dS5ZdMUeIHQKSWV6KfVj+tSKzg6UwpLMoIS7
         FzhoqBlTCaq5h7RZyooQiaWHoVCBC+eas0/K7+Fq9D4fVVkQVsshq8KTOUEmRfYTUAfF
         xN9g==
X-Gm-Message-State: APjAAAUxp3j1SLhxAfNYfurMUORVYjBklmxGuR3Q+ki5CWDaxoU3huu5
        IMVeUCcZKQsrcovscBKy2S+N5ihTCzA=
X-Google-Smtp-Source: APXvYqysSUrmxH++r5MmUXV4gWwiLxUMWPgS8nugFZzvIugrQ9MfQDgywxdIlcVe+Xz2GFVznywfU+Ysfvs=
X-Received: by 2002:ac8:6105:: with SMTP id a5mr15179523qtm.285.1565694242255;
 Tue, 13 Aug 2019 04:04:02 -0700 (PDT)
Date:   Tue, 13 Aug 2019 13:02:37 +0200
In-Reply-To: <20190813110300.83025-1-darekm@google.com>
Message-Id: <20190813110300.83025-6-darekm@google.com>
Mime-Version: 1.0
References: <20190813110300.83025-1-darekm@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v6 5/8] drm: sti: use cec_notifier_conn_(un)register
From:   Dariusz Marcinkiewicz <darekm@google.com>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Vincent Abriou <vincent.abriou@st.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the new cec_notifier_conn_(un)register() functions to
(un)register the notifier for the HDMI connector, and fill
in the cec_connector_info.

Changes since v2:
	Don't invalidate physical address before unregistering the
	notifier.

Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
---
 drivers/gpu/drm/sti/sti_hdmi.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index 9862c322f0c4a..bd15902b825ad 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -1256,6 +1256,7 @@ static int sti_hdmi_bind(struct device *dev, struct device *master, void *data)
 	struct drm_device *drm_dev = data;
 	struct drm_encoder *encoder;
 	struct sti_hdmi_connector *connector;
+	struct cec_connector_info conn_info;
 	struct drm_connector *drm_connector;
 	struct drm_bridge *bridge;
 	int err;
@@ -1318,6 +1319,14 @@ static int sti_hdmi_bind(struct device *dev, struct device *master, void *data)
 		goto err_sysfs;
 	}
 
+	cec_fill_conn_info_from_drm(&conn_info, drm_connector);
+	hdmi->notifier = cec_notifier_conn_register(&hdmi->dev, NULL,
+						    &conn_info);
+	if (!hdmi->notifier) {
+		hdmi->drm_connector = NULL;
+		return -ENOMEM;
+	}
+
 	/* Enable default interrupts */
 	hdmi_write(hdmi, HDMI_DEFAULT_INT, HDMI_INT_EN);
 
@@ -1331,6 +1340,9 @@ static int sti_hdmi_bind(struct device *dev, struct device *master, void *data)
 static void sti_hdmi_unbind(struct device *dev,
 		struct device *master, void *data)
 {
+	struct sti_hdmi *hdmi = dev_get_drvdata(dev);
+
+	cec_notifier_conn_unregister(hdmi->notifier);
 }
 
 static const struct component_ops sti_hdmi_ops = {
@@ -1436,10 +1448,6 @@ static int sti_hdmi_probe(struct platform_device *pdev)
 		goto release_adapter;
 	}
 
-	hdmi->notifier = cec_notifier_get(&pdev->dev);
-	if (!hdmi->notifier)
-		goto release_adapter;
-
 	hdmi->reset = devm_reset_control_get(dev, "hdmi");
 	/* Take hdmi out of reset */
 	if (!IS_ERR(hdmi->reset))
@@ -1459,14 +1467,11 @@ static int sti_hdmi_remove(struct platform_device *pdev)
 {
 	struct sti_hdmi *hdmi = dev_get_drvdata(&pdev->dev);
 
-	cec_notifier_set_phys_addr(hdmi->notifier, CEC_PHYS_ADDR_INVALID);
-
 	i2c_put_adapter(hdmi->ddc_adapt);
 	if (hdmi->audio_pdev)
 		platform_device_unregister(hdmi->audio_pdev);
 	component_del(&pdev->dev, &sti_hdmi_ops);
 
-	cec_notifier_put(hdmi->notifier);
 	return 0;
 }
 
-- 
2.23.0.rc1.153.gdeed80330f-goog

