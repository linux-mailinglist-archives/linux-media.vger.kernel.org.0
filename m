Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4921B436CE8
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 23:44:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232154AbhJUVqQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 17:46:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231446AbhJUVqQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 17:46:16 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA8D1C061764
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 14:43:59 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id g79-20020a1c2052000000b00323023159e1so1147838wmg.2
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 14:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q80H4X8cmtIQEgUB2e56kv+SIwIlfsWDwStJzV882LY=;
        b=Z/SpehXI+VeKxH6aJhlVNsQAYiojDOfc1FiLTUYGgrtXGgpAU/gIWQTvlp/kEFF1mf
         um7Xg7G9Vk0abUVp560QIlKUnWV3K+bHmUYmGTeh9wV/Dxk88L51Vz6w0hbX8eoR3Ety
         64/cxoUagN9qa76fgj8N140tJP294wIWZb5Y6aYQAl5KCOFGCoR/wxePIgN/6QmIYr8U
         Fh6oSdq6s5zKSRozZ79pDMZkkOeHumkueiYToqHQmqu6WxWJdc3XAjvVQb7jvvD/xfo1
         zgXvQL8qwdnFgpvi35E+QS7I2f9eD/BC5P4N7WU8cwpKqnB4NZS3NJqdoJKs3VSYxGfU
         uNmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q80H4X8cmtIQEgUB2e56kv+SIwIlfsWDwStJzV882LY=;
        b=5ch4HqqIP2t3ecsrmSaMAZFTZoAM/1pN6RX63r2rb5Rdh9Ov3amad/XZGrle1ilQDn
         MWq7UV7fRydruhYcSkjfjKp4AWaIBAqIQmcPVanHAqSU2ufPuqKgZS1fxkUojm/tRlcQ
         R1nFnDcR07pctOjdh7SYknBLcLiNpH1l78Ee/5030AamcH8ZsRpF6zPo2nrjun4GMmr3
         d14GepKFzvHIB1t/T/oxqIaSBn0var1vrWQTY5mWGqKwYBRSXOL32tluB49g+R9vm+6j
         /0zZ7WfY87qJIoyu2gfELVmyswnZ/1+Xycb60RJyw6BPQzCZlk6F4PDZJCdRc9BiGptX
         Bunw==
X-Gm-Message-State: AOAM531ycWg9mzRWtyostPU/RRctJwNaHrtygsmLUAa+CDs2wG8izyc0
        gUVDmGLdw3Lo5rX9u/Jz/DhSbQpwWns=
X-Google-Smtp-Source: ABdhPJy+oWMZIlqDyw04/0XFGXV7jtb/88/buDdUsyChMEvQqzWwGv0/RgGVSB0I2Nvt5OKkdXeaaA==
X-Received: by 2002:a7b:c08b:: with SMTP id r11mr9304744wmh.167.1634852638390;
        Thu, 21 Oct 2021 14:43:58 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id r205sm6378507wma.3.2021.10.21.14.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 14:43:58 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, paul.kocialkowski@bootlin.com
Cc:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        hdegoede@redhat.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
Subject: [PATCH v3 03/16] media: i2c: Defer probe if not endpoint found
Date:   Thu, 21 Oct 2021 22:43:18 +0100
Message-Id: <20211021214331.1188787-4-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021214331.1188787-1-djrscally@gmail.com>
References: <20211021214331.1188787-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ov8865 driver is one of those that can be connected to a CIO2
device by the cio2-bridge code. This means that the absence of an
endpoint for this device is not necessarily fatal, as one might be
built by the cio2-bridge when it probes. Return -EPROBE_DEFER if no
endpoint is found rather than a fatal error.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v3:

	- None

 drivers/media/i2c/ov8865.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 7513b54a2aa8..ae3902d3de95 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2796,10 +2796,8 @@ static int ov8865_probe(struct i2c_client *client)
 	/* Graph Endpoint */
 
 	handle = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
-	if (!handle) {
-		dev_err(dev, "unable to find endpoint node\n");
-		return -EINVAL;
-	}
+	if (!handle)
+		return -EPROBE_DEFER;
 
 	sensor->endpoint.bus_type = V4L2_MBUS_CSI2_DPHY;
 
-- 
2.25.1

