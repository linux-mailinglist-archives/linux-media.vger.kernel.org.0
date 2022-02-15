Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 130524B7AFE
	for <lists+linux-media@lfdr.de>; Wed, 16 Feb 2022 00:07:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241437AbiBOXIF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Feb 2022 18:08:05 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240552AbiBOXIE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Feb 2022 18:08:04 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A2A8654F
        for <linux-media@vger.kernel.org>; Tue, 15 Feb 2022 15:07:53 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id d27so518706wrb.5
        for <linux-media@vger.kernel.org>; Tue, 15 Feb 2022 15:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ihc3y3MKZexrKZJkAwHz5nfKWryLTjQ76jG7vqQNZLc=;
        b=JUShL6Q5Qg4Hwyuli0ivgr+NJ5YVa4GNro4TPm1yK1kdqWf4dMUkEggeI12ZTdTyXf
         4qcHU9286mka5IQdy9t/Sgssua9shGlIAy5taodoTsBrCBkU/U2VnGZUw+mHaDam6ElW
         a4HMTS1AKO4+WFfBWptiu1t9ZWwNwBXwVfnXie468Y/afXYrvWijvhSwTwqwJ1NZkENe
         3vaKn2Ej2vDIJhi1w863vjj/jEoBpvM3HYLb5yuN/imtlttUxrtUcSfrxLMKX1kadLK8
         vRbNflMVeIkjl6vkQ64GJrVQ0rS6BL3HX1nJcRC2c8IxyECIpDlLKCHwMnkX2bq947h2
         993A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ihc3y3MKZexrKZJkAwHz5nfKWryLTjQ76jG7vqQNZLc=;
        b=wuEOAv3EZ3fZxoT3uwv8qimTaCr/VYw/5ZAPDaC6KNa47fSpdIAHH98K7c5DNHKGVp
         /6PgmWGrzMaNpbeXd76HEORmUEpD3+kEiUfoM4o2y2it372qmilhoCRxuU68+su1cqwE
         sL57iKkNQbYH/pIIOcm5RoI+LOyROCvDo3JgDw6LNQQO2GWMERc1WKi/vycPxItu66O8
         L0b0Gkc+FnxGM+C0IQQGoEl6wqxTYdWXK0aqMaQBy4uWjZjwpVubUFqLAZH1vIgcUdTO
         /oPox71OEZstkc3OoLt33WMN8SK+gh9+OBdqLrKow0dbJXuZDpdExDNZUnEg+pEcONYT
         96Ng==
X-Gm-Message-State: AOAM533hjzrs2leBh85DOspHCG6Dg5RRg6RSwQl6Qd59rJld5dojEOAS
        cwMqLgkIqRw7tmlmTtQNWe2nGhFXTbSvCA==
X-Google-Smtp-Source: ABdhPJwYSlwBoE7BfQdb3hbX90uwdBy4HgxYCYq7NtIgX8VaoJnoFtrvMdI0dwOHkTyB0y919YFVWA==
X-Received: by 2002:a5d:40c8:0:b0:1e3:e76:129b with SMTP id b8-20020a5d40c8000000b001e30e76129bmr129927wrq.295.1644966471915;
        Tue, 15 Feb 2022 15:07:51 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id w18sm16956590wrl.62.2022.02.15.15.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 15:07:51 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH 02/10] media: ipu3-cio2: Add support for V4L2_PIX_FMT_IPU3_Y10
Date:   Tue, 15 Feb 2022 23:07:29 +0000
Message-Id: <20220215230737.1870630-3-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220215230737.1870630-1-djrscally@gmail.com>
References: <20220215230737.1870630-1-djrscally@gmail.com>
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

We have platforms where a camera sensor transmits Y10 data to
the CIO2 device - add support for that (packed) format to the
ipu3-cio2 driver.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index 0e9b0503b62a..ea2f9f70a64e 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -65,7 +65,12 @@ static const struct ipu3_cio2_fmt formats[] = {
 		.fourcc		= V4L2_PIX_FMT_IPU3_SRGGB10,
 		.mipicode	= 0x2b,
 		.bpp		= 10,
-	},
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_Y10_1X10,
+		.fourcc		= V4L2_PIX_FMT_IPU3_Y10,
+		.mipicode	= 0x2b,
+		.bpp		= 10,
+	}
 };
 
 /*
-- 
2.25.1

