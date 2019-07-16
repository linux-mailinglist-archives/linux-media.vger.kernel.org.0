Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8CB86A363
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2019 09:58:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730750AbfGPH6t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jul 2019 03:58:49 -0400
Received: from mail-vk1-f201.google.com ([209.85.221.201]:48228 "EHLO
        mail-vk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726539AbfGPH6s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jul 2019 03:58:48 -0400
Received: by mail-vk1-f201.google.com with SMTP id x71so652090vkd.15
        for <linux-media@vger.kernel.org>; Tue, 16 Jul 2019 00:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=Y0eJ4pSh22lZlPekVxJNJZYe8l8R+Qjf/bJaf0Pgidw=;
        b=PNkJ+YkiNvIQD2mvldrWYlCL7lNP6694Ggzk5e3oE6YDCL1N2JjEfV5VIa0Tw2fP0M
         ZG7Knm2w7R7DkAbG7khbXIRMV41L5zYO1HqIBPTu08+KHY0phDKkXtOE0pDUx/g3VhVj
         9rC6ewSWZiGK0d4LlSTyJcAhRfHwO7XaNJAAmZYnoR5Qvb9KcveR0muxwofBNGB870kA
         S7HAFwcKjhZbbMYUOEPUbb6uDZMbXyR3ccdWnNHpVdeRCTYHtUpnCxDr63B9P4rF8B2F
         8zul72whS7N2ZhwURaUuBgpZ9zsFQRuHdCUy5rSpyvSglYa6fwJUHmQQqOEkcYdhFHss
         Cjqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Y0eJ4pSh22lZlPekVxJNJZYe8l8R+Qjf/bJaf0Pgidw=;
        b=oW4OO7d3sPgYBGloP2rE4RFMOS6UPcN5eIbw10zTqUo2Zg7Q0CsnJG6D4caH4io+qV
         an/XzdSYjkKbYANuNU95bCGnsZPrVKKBw27JuSdN7Eq31WDXYqaJfYWrpEmNOe3KGT/a
         9h5yjab2L7DVhjB9WHWNm5IoG8bFoI+VPOI8ILAE1GgSFqaZvuDfAv+nYa5CYEi+wPnO
         mCuCfGJwxc53UG47QPeSQD8Pe4023P96j+lZj/6i/PAaG3F3h6Q2M/XXwmQxtoFRhmlm
         OxkAEUP98YGSaZAe3ZzHG+lBYQKvDqeLp4HH8HcyvPkyV/mqLYiAM/hRvPaazW8x31pC
         gWlg==
X-Gm-Message-State: APjAAAUEhj9HNaPKpnirXbowrtd1F2P9dztfWDjJkq/mruPfQKCXLqtj
        zXGfAwdfZt5ZzxjHtk9U8tgeECp5GVgF26v+RNshAPhaRWHq/nf92xoQKolMomJuprfsJGwpExM
        FNAe1PvRkfdOxYNPRBUwC8p14y2RrO5jqjJlV9O54auzNFwWE68K7Qo3J830T40b+oYb7
X-Google-Smtp-Source: APXvYqx6AKau+vn76nt+tDEomvC0J8yQHoYI6Azbuv9I7RS+SsZ6iEIlD6Z9IfJjOrOPRh5Mctx7/fliBHw=
X-Received: by 2002:a1f:3244:: with SMTP id y65mr11465917vky.77.1563263927514;
 Tue, 16 Jul 2019 00:58:47 -0700 (PDT)
Date:   Tue, 16 Jul 2019 09:58:14 +0200
In-Reply-To: <20190716075820.260202-1-darekm@google.com>
Message-Id: <20190716075820.260202-4-darekm@google.com>
Mime-Version: 1.0
References: <20190716075820.260202-1-darekm@google.com>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
Subject: [PATCH v3 3/9] dw-hdmi-cec: use cec_notifier_cec_adap_(un)register
From:   Dariusz Marcinkiewicz <darekm@google.com>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        hverkuil@xs4all.nl
Cc:     Dariusz Marcinkiewicz <darekm@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the new cec_notifier_cec_adap_(un)register() functions to
(un)register the notifier for the CEC adapter.

Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
index 6c323510f1288..6f7ecacb7d1fb 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
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

