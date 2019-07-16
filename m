Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FCDA6A8B9
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2019 14:29:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732756AbfGPM2C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jul 2019 08:28:02 -0400
Received: from mail-qt1-f201.google.com ([209.85.160.201]:40534 "EHLO
        mail-qt1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbfGPM2C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jul 2019 08:28:02 -0400
Received: by mail-qt1-f201.google.com with SMTP id e32so17820147qtc.7
        for <linux-media@vger.kernel.org>; Tue, 16 Jul 2019 05:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=WKnJOrrH+qEjXJlHnLjxekGXT6Nyo0Ar07pMa+L141I=;
        b=n4f99IIGQ/sBB0GuD4rl+xs8/oXHJkQcX3OM73RGn37RttaiUqoOctoeyT2l1UYGhQ
         hvyGRwxpt487t/PhhUqTwXfN6bfn2EbnKK7CMc/Xf2KNRPQTm8P/E4n089d+wt5eXP/F
         lLLervtY4lXhkYq055LWpJwb6B1L6v9+yMoyEvh/fwYWYSe62yUWCQXpl12f/W8PQWE2
         C5jK8u9L6fQJ/mLhE2N2Nc7tm7+0L6lR5XgT2INUm/tJfUgUdLUpXAjsOQHdY3RvD08E
         1LsJqJ8BF+YnvkBFax7GLDQywFwxYGzzMD/Z1ZyfOfo0LBOIC0XF9BVCGrjYzkp4QIIL
         7nLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=WKnJOrrH+qEjXJlHnLjxekGXT6Nyo0Ar07pMa+L141I=;
        b=KZSSmd6bryly33lPdFV2nt0YI9sMWBy2g7PlRtohPzcJkO7pdir67brv08JvNeGI3I
         KMPv5fuwNxEccK1ljOkDYaBzJc252Eq36bdklQOj6AOlvc1uRyplgM7aoEnfyn0a/FWo
         uZxcmBw70XBoThL/EA8Sx9dAzVgndj/6W17l3fwbhixNiB8Yrki33We+wrhKlLpNwUIy
         Vqv0Vv2U2a/FVEwkqP5fzkB0/ODsyvwlsod3jzOSgfJaqV1f8wIiVsrLMEkfQ2ZrOAyZ
         PY6KU/tMDDrBLTcjXNpSEgk99nN7ZsaJzap02JTZO7hRHMc8oJI8ntMrj0XOgHuN93G/
         Tk4w==
X-Gm-Message-State: APjAAAWbNGKtMFtBnT6daMtJ6Qt3YxKjc7VQy62triIIWJ7skW80lPCI
        e5zbFzWRbmow8VgtLZ7ZGf/OLWAVgnVz17/UYEXzgmF2xmAim6RmOIcKuT8mXm4Vhl+vqlgpFFd
        w5ERAOMiUpNIGNC0gUH/5QXI0mQUDPBUvYDcBHk5JXJ5D54G03i51ovq0HkmqxaE59cZL
X-Google-Smtp-Source: APXvYqyjmJNA0lGswric4KjURdEdHK75avBTBj4LlAdVjqIT/7eivnt6wsktrsiqcLshs648Mnv0vbWrNgE=
X-Received: by 2002:a0c:b2da:: with SMTP id d26mr23608767qvf.48.1563280081630;
 Tue, 16 Jul 2019 05:28:01 -0700 (PDT)
Date:   Tue, 16 Jul 2019 14:27:12 +0200
In-Reply-To: <20190716122718.125993-1-darekm@google.com>
Message-Id: <20190716122718.125993-4-darekm@google.com>
Mime-Version: 1.0
References: <20190716122718.125993-1-darekm@google.com>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
Subject: [PATCH v4 3/9] dw-hdmi-cec: use cec_notifier_cec_adap_(un)register
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
2.22.0.510.g264f2c817a-goog

