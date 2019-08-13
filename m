Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 528198B621
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 13:03:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727196AbfHMLDt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 07:03:49 -0400
Received: from mail-qt1-f202.google.com ([209.85.160.202]:47111 "EHLO
        mail-qt1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726600AbfHMLDt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 07:03:49 -0400
Received: by mail-qt1-f202.google.com with SMTP id g33so7068674qtc.14
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2019 04:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=8XQAtQU5Jlu+LsGTeIXfkeaCQsZPIsgrkBYJbMGoesk=;
        b=WONVccTIDftVGDULY91dHjvEzbQk3VhS9tlpsFUt/enibyOhbHo3b0DFcLewogMBDc
         xloAzgsKjOvC4JHqImA6XZqZ9jRNJ5EK4ZOiClT3bWa5BIHWdOsUPHw3sAG+6mNN+Wfu
         U8Abd4dxv6ucp2qlfEgK5xSyVYx2UF+yjDweJ+zWobe6kv0lykLYshfNTbDfIMe1Hfxn
         b+h7b0wcWnyH7KRBwS/M5bb+p26QB/Lh2KK1QgTroLTD2RlwxcRwJaSIJglkwTT8ESJp
         jRZAETsPoZjKR9LScyy1NPY89PdS90jvaEbg1HjVQGGD98Z3zzDrfnyPal6oeYj+jqDh
         +eyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=8XQAtQU5Jlu+LsGTeIXfkeaCQsZPIsgrkBYJbMGoesk=;
        b=MxwYG6JBE2TGeKsrci5tIr9SkITSe6GwLSkTqjCW6IkYZsqGk/DB9RCv3sGpze5n/t
         EIeBA042Vs2knmXIedEDgcFJRb2zNFa0HYDccexYlC7d4Ph5L4pQSclhqc9EyvQonWWd
         9TuzHi5EOccysPPrrJ2OfF7SAtAjQu4WEd31aOsBIjiXcFCN2DpaUscwokSVA38BY2vh
         dXnObDc0LRKojtQgmGTnLtlHmc7UbehCPhER4gZt53piTfV4luuKaVhrsDaOdI4VTvdV
         BEVMLe0rV9OHKJ5AVBke3tzpzitTOqMWZRaevhrU96cHM0ugwlSA4f2knt+Bqp8/KA7Z
         oaPA==
X-Gm-Message-State: APjAAAWzLMLfXe7qXZny6eAGMXDXLthrqYpNAt17kncMJhzYnH6AL+zh
        3nTJA6+hvhv0vbSqaU0oQ3IiFYAl9CM=
X-Google-Smtp-Source: APXvYqyDDzweTJoOpSrCJBhYFA2bPdcntFbwhRbcFvhSWKkyE6mKScSn8KJ6qn2GtAZSopDoFcKlju1Uov8=
X-Received: by 2002:ae9:f812:: with SMTP id x18mr26524005qkh.290.1565694228612;
 Tue, 13 Aug 2019 04:03:48 -0700 (PDT)
Date:   Tue, 13 Aug 2019 13:02:34 +0200
In-Reply-To: <20190813110300.83025-1-darekm@google.com>
Message-Id: <20190813110300.83025-3-darekm@google.com>
Mime-Version: 1.0
References: <20190813110300.83025-1-darekm@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v6 2/8] dw-hdmi-cec: use cec_notifier_cec_adap_(un)register
From:   Dariusz Marcinkiewicz <darekm@google.com>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Enrico Weigelt <info@metux.net>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        open list <linux-kernel@vger.kernel.org>
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
Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
index 0f949978d3fcd..ac1e001d08829 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
@@ -256,8 +256,8 @@ static int dw_hdmi_cec_probe(struct platform_device *pdev)
 	dw_hdmi_write(cec, 0, HDMI_CEC_POLARITY);
 
 	cec->adap = cec_allocate_adapter(&dw_hdmi_cec_ops, cec, "dw_hdmi",
-					 CEC_CAP_LOG_ADDRS | CEC_CAP_TRANSMIT |
-					 CEC_CAP_RC | CEC_CAP_PASSTHROUGH,
+					 CEC_CAP_DEFAULTS |
+					 CEC_CAP_CONNECTOR_INFO,
 					 CEC_MAX_LOG_ADDRS);
 	if (IS_ERR(cec->adap))
 		return PTR_ERR(cec->adap);
@@ -278,13 +278,14 @@ static int dw_hdmi_cec_probe(struct platform_device *pdev)
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
 
@@ -294,8 +295,6 @@ static int dw_hdmi_cec_probe(struct platform_device *pdev)
 	 */
 	devm_remove_action(&pdev->dev, dw_hdmi_cec_del, cec);
 
-	cec_register_cec_notifier(cec->adap, cec->notify);
-
 	return 0;
 }
 
@@ -303,8 +302,8 @@ static int dw_hdmi_cec_remove(struct platform_device *pdev)
 {
 	struct dw_hdmi_cec *cec = platform_get_drvdata(pdev);
 
+	cec_notifier_cec_adap_unregister(cec->notify);
 	cec_unregister_adapter(cec->adap);
-	cec_notifier_put(cec->notify);
 
 	return 0;
 }
-- 
2.23.0.rc1.153.gdeed80330f-goog

