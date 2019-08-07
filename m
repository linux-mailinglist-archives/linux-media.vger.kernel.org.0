Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4F5D8483E
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2019 10:54:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727453AbfHGIyp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Aug 2019 04:54:45 -0400
Received: from mail-qt1-f202.google.com ([209.85.160.202]:49092 "EHLO
        mail-qt1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726244AbfHGIyp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Aug 2019 04:54:45 -0400
Received: by mail-qt1-f202.google.com with SMTP id x7so81595306qtp.15
        for <linux-media@vger.kernel.org>; Wed, 07 Aug 2019 01:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=tYzitGZaVbEZqsWCVoM4nGJXWDHkLAxcBvoGyaZfPDw=;
        b=YC8QKxzgIX1jfg1zNl8Yv+YrpOUt+X52YrCWyr4QEFu3zNq9aCfuN5Opwmn3Y90gpk
         Xs00rs1SVl84v4bmJWvYlCn/ZFY5XpUVvkJ9rmLArf8XEJXxc2YlSH9ldA74gpGe/RJE
         ZhAR5TcN0D1tjrtkVASaAEMxWPVigJnUPMpOpKKUqS3HkdC9V3vwHg0lG8G7uub5o5nE
         YjWTdpVXsPRPt5W01HawEMncJclyjg5IGI4DlEJA3CT5g0ngF6FapDYqxzqsOrQgT9Tl
         xIR2YPSzsZM69c7eavCQ2RJyALkHL5MqEihAfYDbhmN9nGqDWB2kFkQA46AzMQJ53u6K
         FDtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=tYzitGZaVbEZqsWCVoM4nGJXWDHkLAxcBvoGyaZfPDw=;
        b=pbqLD7Z5Zey2HRgCiilvszVpllx4CzNwzpBLn6e7QQ3USUt38DdTs/oSG2QanzbL6J
         aQpmwOyUZtsVFUjVsU5Kc58Ffw5GcU23Hbs9RrSu8AXyTJIu9vhpHFHgwVBx0f9w3XkS
         hZGePSM0fU0BU6yqhj/ek1lX4FGvfNm9pHz4igZ+23Taqa/IeoNQAWWWJ7EGNNfBSsb8
         5s0GCsUcjVVniI45fIS/7UO7ypqa/6GBpeE43HRksIWsA62lu8iiiohh2dMSkDkvXuyx
         vn8+uwhjaRljlbY+m5JBEYB9/YnsXQn5FPqhfVunmC031aL46cDfgCYcDkaefxtya6uz
         TxoQ==
X-Gm-Message-State: APjAAAWbcihoGohl+nS0edRuxLEGSbYW7WbIHz9k/Tu030WOPM3V5dpL
        NYPIn2m+4zlBWBjn620NMiEzJkjFmFD4Q+sEsXXCHqRZx97Z0vtzfnVDUCwzaeNNd4F1ln51kaI
        bXHtC5f1wKysDQhnnOLL/Xhf6AAxicesemkqzDD2TS+RSi3mkBljig3nZHzkRrmw2dHqp
X-Google-Smtp-Source: APXvYqwxckXYeuLUg6V16q1PEJ8QXThl7Pgl4CPiQMQA299wv/5nSvVFOqCLQ7xLFJonpuPaSN73bj7ZRR8=
X-Received: by 2002:a37:90c1:: with SMTP id s184mr7228671qkd.217.1565168084723;
 Wed, 07 Aug 2019 01:54:44 -0700 (PDT)
Date:   Wed,  7 Aug 2019 10:52:26 +0200
In-Reply-To: <20190807085232.151260-1-darekm@google.com>
Message-Id: <20190807085232.151260-4-darekm@google.com>
Mime-Version: 1.0
References: <20190807085232.151260-1-darekm@google.com>
X-Mailer: git-send-email 2.22.0.770.g0f2c4a37fd-goog
Subject: [PATCH v5 3/9] dw-hdmi-cec: use cec_notifier_cec_adap_(un)register
From:   Dariusz Marcinkiewicz <darekm@google.com>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl
Cc:     Dariusz Marcinkiewicz <darekm@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the new cec_notifier_cec_adap_(un)register() functions to
(un)register the notifier for the CEC adapter.

Also adds CEC_CAP_CONNECTOR_INFO capability to the adapter.

Changes since v3:
	- add CEC_CAP_CONNECTOR_INFO to cec_allocate_adapter,
	- replace CEC_CAP_LOG_ADDRS | CEC_CAP_TRANSMIT |
	CEC_CAP_RC | CEC_CAP_PASSTHROUGH with CEC_CAP_DEFAULTS.

Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
index 6c323510f1288..361acff2111cf 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
@@ -259,8 +259,8 @@ static int dw_hdmi_cec_probe(struct platform_device *pdev)
 	dw_hdmi_write(cec, 0, HDMI_CEC_POLARITY);
 
 	cec->adap = cec_allocate_adapter(&dw_hdmi_cec_ops, cec, "dw_hdmi",
-					 CEC_CAP_LOG_ADDRS | CEC_CAP_TRANSMIT |
-					 CEC_CAP_RC | CEC_CAP_PASSTHROUGH,
+					 CEC_CAP_DEFAULTS |
+					 CEC_CAP_CONNECTOR_INFO,
 					 CEC_MAX_LOG_ADDRS);
 	if (IS_ERR(cec->adap))
 		return PTR_ERR(cec->adap);
@@ -281,13 +281,14 @@ static int dw_hdmi_cec_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	cec->notify = cec_notifier_get(pdev->dev.parent);
+	cec->notify = cec_notifier_cec_adap_register(pdev->dev.parent,
+						     NULL, cec->adap);
 	if (!cec->notify)
 		return -ENOMEM;
 
 	ret = cec_register_adapter(cec->adap, pdev->dev.parent);
 	if (ret < 0) {
-		cec_notifier_put(cec->notify);
+		cec_notifier_cec_adap_unregister(cec->notify);
 		return ret;
 	}
 
@@ -297,8 +298,6 @@ static int dw_hdmi_cec_probe(struct platform_device *pdev)
 	 */
 	devm_remove_action(&pdev->dev, dw_hdmi_cec_del, cec);
 
-	cec_register_cec_notifier(cec->adap, cec->notify);
-
 	return 0;
 }
 
@@ -306,8 +305,8 @@ static int dw_hdmi_cec_remove(struct platform_device *pdev)
 {
 	struct dw_hdmi_cec *cec = platform_get_drvdata(pdev);
 
+	cec_notifier_cec_adap_unregister(cec->notify);
 	cec_unregister_adapter(cec->adap);
-	cec_notifier_put(cec->notify);
 
 	return 0;
 }
-- 
2.22.0.770.g0f2c4a37fd-goog

