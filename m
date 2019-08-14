Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EED18D11D
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 12:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727817AbfHNKpw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 06:45:52 -0400
Received: from mail-qk1-f201.google.com ([209.85.222.201]:50533 "EHLO
        mail-qk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726704AbfHNKpw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 06:45:52 -0400
Received: by mail-qk1-f201.google.com with SMTP id e18so99026190qkl.17
        for <linux-media@vger.kernel.org>; Wed, 14 Aug 2019 03:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=8XQAtQU5Jlu+LsGTeIXfkeaCQsZPIsgrkBYJbMGoesk=;
        b=wAGnbRj9PtduDVibdtuPHio7e/rJAlCgqGevJw5McsZd2dItB2v8f3QDxCwHSu8HnM
         hUudYGzKO7cP39DlSJRj4tGIzVVVD7YI5T4VmE5kX9Ysovpeys+pbhVZL19mRvhyQd+8
         VLquRzmzP4RRraDhLhZzueBc3kZpUJqwnpT6b3CROj2A6T+JhMWMJRGpUjKUox6rDt72
         F111botUFvVQxo0CP38qO0gmkZYQiQLXbzFf6gL2kTKpae0HQtsskmb1ezaYubpNWNwX
         5o8X9kKoMAeofuebkUCLBd1/FR6Cd1qGADTZ3sbk+bh6Qg+9HVOoW6nWSeNsHZJ8SYh1
         pu9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=8XQAtQU5Jlu+LsGTeIXfkeaCQsZPIsgrkBYJbMGoesk=;
        b=uoYhziRsmA8Bbxqg1CMy0y6r/WQ89JqbmRf7Ztr6nnxXiMW/YBErBe8s0hIaDiMS+r
         1joKnKFEyB4dV62Fq/KBj31PpQolxwZ8uRcJUgFi6rZSc+VrQPYOBXURM82rx+E/dkY9
         WxeEjewHbqKSznY6CtcqmfVVinXMh41W9ngr5dBfDlu5RuPxjGiOWUtExyH7Rn5w2HM0
         yBtIfmkWxJUQBFeFnvRNXJ1ZCBJNux/hLPfxbWBHGLjz9ZP7lAjEla0kEN2x71a8WD9C
         0PDI0bBr9gEwQuOks03rKOXuKs4qti3+MbIknYN3lb37KlJnT+/NaeROH8VLhlLaT/5G
         D+jw==
X-Gm-Message-State: APjAAAVJgCCew0yIc6f5Tu3ugbrDVyL5ym0II3ylTAnne9sTQoQ5rLDy
        rHu+5+rGZPHV8H/upCZmo5voA8UwWgg=
X-Google-Smtp-Source: APXvYqwFkux6bJUDOmhEL2ANd2DCyCR/Ryr/QNHOfXxiv2yXbVUydh25N5n46qj8ALQfXM0+XquobHEFP2Y=
X-Received: by 2002:a05:6214:1254:: with SMTP id q20mr2062924qvv.164.1565779550564;
 Wed, 14 Aug 2019 03:45:50 -0700 (PDT)
Date:   Wed, 14 Aug 2019 12:45:01 +0200
In-Reply-To: <20190814104520.6001-1-darekm@google.com>
Message-Id: <20190814104520.6001-4-darekm@google.com>
Mime-Version: 1.0
References: <20190814104520.6001-1-darekm@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v7 3/9] dw-hdmi-cec: use cec_notifier_cec_adap_(un)register
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
        Kate Stewart <kstewart@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org
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

