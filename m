Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82D6251B1F6
	for <lists+linux-media@lfdr.de>; Thu,  5 May 2022 00:31:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230058AbiEDWei (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 May 2022 18:34:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237672AbiEDWe3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 May 2022 18:34:29 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA6B72B1A9
        for <linux-media@vger.kernel.org>; Wed,  4 May 2022 15:30:51 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id j15so3824577wrb.2
        for <linux-media@vger.kernel.org>; Wed, 04 May 2022 15:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WHkXA0eWimFClf7wSQc2ZrjEMI+cQiIgeyRQAJkX8CA=;
        b=TfS2izcwGf47DyV64epBDbX/zwrWVe7vCWYHk0cGa6rr+ABcy26O8bIjEZq/hoOym/
         RQgSrJexTFcE9XLZ4AJKc1N8WZYQwVW1CrUPZ7U5c7yMtyzj+wfXSpRDlBY/DuRdQFuC
         4TerNxxr8iCAlUnR9yegnh6lga1CbqhdwzEDDkJg6u/HgnAO7Km6wE3wdp5o0M6Rddm8
         DbcufTFlWDHiNuhyC81Bj8cJH6f4grmIStWw1hfYlJRNpyUu3sR+ZRqeyTxGNYYvFm5P
         zgKswJ8M53sISq7KuyDFAG3IBpC96uzu7uIW8LddhTdgZ44yhot4urjfHurfjJ+YEVMe
         1qTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WHkXA0eWimFClf7wSQc2ZrjEMI+cQiIgeyRQAJkX8CA=;
        b=akWWVvhpdLjauirYqchNC2fvAWidFoXbfZ/gtL//l3coC2Ww7Pucw8B3UmdBZi1ZOE
         O6v5KBvOlV5mzL9vIL65ctP0hqf8xbe99fkagFS3BkM+OVhhy9mKJkIlVoLA33a7e6JX
         +vOHsxnb8mquY7CY+ysrU1uDT0lf4ESUl4mZPe/rMqrh6VzR3s165pNar/ECAhYhdlC3
         EMvc8JiF8s1kzWVaGqhEYqrVw5KHwIbA1DjIjkghsvOdr8nStC4noMeu6VqEO8/HoLRP
         eLTtd63jnVb7LCeFPhCvOsZmg5HvQofgSKTi4A3dKuJ29FXEwe5BXhRNes220+XF1rEf
         l6mA==
X-Gm-Message-State: AOAM5318AP1o3XxTdxBI3arxrEz/nzIgRpZ+C118Ky7jgOu5vPkLDr+z
        /ke2olNgYWSoQWiUlCEc8pOHUPydHNY=
X-Google-Smtp-Source: ABdhPJxxMa4UpqpSPQP6SYzdaE5jFYbEuQe6teDjFZm90JOelcwqFLz/G2gMnmXciJnvif853OckFg==
X-Received: by 2002:a5d:608b:0:b0:20c:7a44:d8c1 with SMTP id w11-20020a5d608b000000b0020c7a44d8c1mr6488064wrt.287.1651703450609;
        Wed, 04 May 2022 15:30:50 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id h29-20020adfaa9d000000b0020c5253d913sm12501442wrc.95.2022.05.04.15.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 15:30:50 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v3 11/15] media: ipu3-cio2: Add INT347E to cio2-bridge
Date:   Wed,  4 May 2022 23:30:23 +0100
Message-Id: <20220504223027.3480287-12-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504223027.3480287-1-djrscally@gmail.com>
References: <20220504223027.3480287-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The OVTI7251 sensor can be found on x86 laptops with an IPU3, and so
needs to be supported by the cio2-bridge. Add it to the table of
supported sensors.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v3:

	- None

Changes in v2:

	- Switched to 319.2MHz link frequency

 drivers/media/pci/intel/ipu3/cio2-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
index 7ccb7b6eaa82..df6c94da2f6a 100644
--- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
+++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
@@ -25,6 +25,8 @@ static const struct cio2_sensor_config cio2_supported_sensors[] = {
 	CIO2_SENSOR_CONFIG("INT33BE", 1, 419200000),
 	/* Omnivision OV8865 */
 	CIO2_SENSOR_CONFIG("INT347A", 1, 360000000),
+	/* Omnivision OV7251 */
+	CIO2_SENSOR_CONFIG("INT347E", 1, 319200000),
 	/* Omnivision OV2680 */
 	CIO2_SENSOR_CONFIG("OVTI2680", 0),
 };
-- 
2.25.1

