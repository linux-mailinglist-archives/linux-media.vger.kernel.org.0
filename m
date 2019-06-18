Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 992FB49541
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 00:39:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbfFQWjb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 18:39:31 -0400
Received: from mail-lj1-f171.google.com ([209.85.208.171]:44436 "EHLO
        mail-lj1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbfFQWjb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 18:39:31 -0400
Received: by mail-lj1-f171.google.com with SMTP id k18so10921927ljc.11
        for <linux-media@vger.kernel.org>; Mon, 17 Jun 2019 15:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iXSdbUs/8ZNq9bcgsoA4xJKLIiWK01RgIUBBiFE9k5A=;
        b=Wr1MfNl7ddC5tPONTtlpyPnWowe2J76wZZiKmsiDem7uPqxe6tEzKb04JGzlYxdonK
         xAOszbxl+6zmasipDpneXShPpsUmpE2kBT+WQNcKfXDztr3h5Vhl+yZrPJH5tt/5Ynct
         LF/rHtLGHhgupspLc8g4pJ2M3FDbgMf7DdHcHT4Hma3KUZVJuJHnjieMi9ykPUo4u+l+
         GUEPTdGODz+eKRAwCqJRTdKWOLPIlzeLoE/GXoguJ0QPN9D3l9jVsAeqiYgI6t1i4iUt
         BngHtwX99+7+WBS1d9J0aIel79+/NXCqis7wJyeM20tp9DZ5Pem56d5c1kowg9MH0IPl
         +O7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iXSdbUs/8ZNq9bcgsoA4xJKLIiWK01RgIUBBiFE9k5A=;
        b=q/WT9tcRHQ0fnsm+MNfOtICjvFsmYdh76aNmOisIdovXbNJvh1TyyYRVfO95ul27GU
         BIEwQzlaGElCg/iDoP3FSuy9JRcEilavk+AHeQ18PtmxXaVGqBd7yuZYcjRRzeHiP3Op
         i0Ev+mqtkuByke2zW1KDsosiPNr/LLauIl/dUcomLhowdKdSDZNvQ0fmKsKi4xw+A0Js
         KY6GjewBd298OFPoOdm0NG/YrNaYcgsDnwo8fLVf1z/cZwJI7A8LpaNitKU/7FzD3I7y
         zYyDlJa/SORMS8cSxvqYYBGihZKwybXp6paC+tqAw7AA6+FO8fy5mCakLEnrCj04Y6sU
         Q9kA==
X-Gm-Message-State: APjAAAX38/tbqO0JzN+kV41lUZBbrrE2qQSQB6+k2WAZKaHZtGHIA+lN
        3xtWyDKTvbfBn+4N9XCnNT7pHpcHIPqudw==
X-Google-Smtp-Source: APXvYqwec1bu7K3wm9/a5QVuIsbjRfhS1LJMqhIGuEXPXa9ZbjG+TLBoQYswCL2GGtIc3P2GDL1n8g==
X-Received: by 2002:a2e:3913:: with SMTP id g19mr44957728lja.212.1560811168818;
        Mon, 17 Jun 2019 15:39:28 -0700 (PDT)
Received: from localhost.localdomain ([178.74.2.49])
        by smtp.gmail.com with ESMTPSA id i23sm2287347ljb.7.2019.06.17.15.39.27
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 15:39:28 -0700 (PDT)
From:   Johan Korsnes <johan.korsnes@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Johan Korsnes <johan.korsnes@gmail.com>
Subject: [PATCH v3 4/9] media: vivid: add number of HDMI ports to device state
Date:   Tue, 18 Jun 2019 09:37:21 +0200
Message-Id: <20190618073726.61776-5-johan.korsnes@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190618073726.61776-1-johan.korsnes@gmail.com>
References: <20190618073726.61776-1-johan.korsnes@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This will be used for HDMI-specific controls such as hotplug detection
and power present.

Signed-off-by: Johan Korsnes <johan.korsnes@gmail.com>
---
 drivers/media/platform/vivid/vivid-core.c | 2 ++
 drivers/media/platform/vivid/vivid-core.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/platform/vivid/vivid-core.c b/drivers/media/platform/vivid/vivid-core.c
index b1d5332b363f..8c211fba3c66 100644
--- a/drivers/media/platform/vivid/vivid-core.c
+++ b/drivers/media/platform/vivid/vivid-core.c
@@ -720,6 +720,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 		in_type_counter[HDMI]--;
 		dev->num_inputs--;
 	}
+	dev->num_hdmi_inputs = in_type_counter[HDMI];
 
 	/* how many outputs do we have and of what type? */
 	dev->num_outputs = num_outputs[inst];
@@ -742,6 +743,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 		out_type_counter[HDMI]--;
 		dev->num_outputs--;
 	}
+	dev->num_hdmi_outputs = out_type_counter[HDMI];
 
 	/* do we create a video capture device? */
 	dev->has_vid_cap = node_type & 0x0001;
diff --git a/drivers/media/platform/vivid/vivid-core.h b/drivers/media/platform/vivid/vivid-core.h
index 9cd535570d50..495609bd9952 100644
--- a/drivers/media/platform/vivid/vivid-core.h
+++ b/drivers/media/platform/vivid/vivid-core.h
@@ -180,9 +180,11 @@ struct vivid_dev {
 	/* supported features */
 	bool				multiplanar;
 	unsigned			num_inputs;
+	unsigned int			num_hdmi_inputs;
 	u8				input_type[MAX_INPUTS];
 	u8				input_name_counter[MAX_INPUTS];
 	unsigned			num_outputs;
+	unsigned int			num_hdmi_outputs;
 	u8				output_type[MAX_OUTPUTS];
 	u8				output_name_counter[MAX_OUTPUTS];
 	bool				has_audio_inputs;
-- 
2.19.1

