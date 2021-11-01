Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95DBF441196
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 01:11:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230321AbhKAAOC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 31 Oct 2021 20:14:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230309AbhKAAOB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 31 Oct 2021 20:14:01 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7A2BC061714
        for <linux-media@vger.kernel.org>; Sun, 31 Oct 2021 17:11:28 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id m22so25880066wrb.0
        for <linux-media@vger.kernel.org>; Sun, 31 Oct 2021 17:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bYnE53sxt9EV2GvZuCKcpnnthXDrxGNArdfz3SURGLA=;
        b=RhAoK5E6EmqwM0sYGDN7oxU5Cm0PfjDISMBlP6V2kOmvvZ7OU7RI2SpPZVYjeiRxPE
         wapM72XDbpjPdraPtdL8Jc01QBzCauzxmjvcA6+BaG0mMhix6ZnTSAOmXbSI8bgZrcaU
         8dpiqWB/63XSDWsAq3JEdBOonqudkjoNEyaPc5+LafORJwoLE0J82yfXdhjGib0IjouD
         Cp8njFMs8cRYlTCi8qad7+zEru9cMKcU8WylAaroAFDoS9byVQxXKbIU3UUk9eK7s2Fv
         CWP/9k2wjOLMJcYlXtpXriSkwN4K+Zo6Bx3o+yd12Iz6Cw+nawTC95jwCXd7A/CPjfnX
         YHOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bYnE53sxt9EV2GvZuCKcpnnthXDrxGNArdfz3SURGLA=;
        b=A8YIEyx7G/spt0Hkh75XwLmMmUYUNMw+cQCiHHatQVmVqk9mE9gVwlaxmaCtssz2iy
         uGdPZdD43+55ZagKGRUdJ/03Zgvu+QshNpbZYDaNVDKgSSlRETtBaVi0aWvpLueefSnC
         h3neiGI7F7pE0ukLg24dTbcNyT2YRTfQi82vwT6lqNsIqCL0GhBUJBhVd6M+7ZoLxZbV
         3id9J4PymojWbq3wA0nPk0lZwA60cRVbbNhdws2FsjmZ1CZMcSAF9R5lKCnTGhnRRn0E
         PURGJIMnIwLQMu7MHEgPDFezBaR+lQeEyVB5JbcORQxlnevogECEhousrqf2ruUFAoMs
         i6YQ==
X-Gm-Message-State: AOAM532Nchf37RBTdTjyC94WFAw4coFAwMVvdMJiMiN8zdZRFoEBXY7z
        KEXvHoQecwidkVzQsKMslEBUCMHRvds=
X-Google-Smtp-Source: ABdhPJzF2UA9chRxGDy3k+ufPNfZkRfrkHsWkARTW9S4rg6UTtyl8PiRvY6Luw4q0PEuR+Uex2rJjw==
X-Received: by 2002:a5d:63ca:: with SMTP id c10mr34764428wrw.407.1635725487504;
        Sun, 31 Oct 2021 17:11:27 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id k6sm12557678wri.83.2021.10.31.17.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 17:11:27 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Daniel Scally <djrscally@gmail.com>,
        linux-media@vger.kernel.org
Cc:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v4 03/16] media: i2c: Defer probe if not endpoint found
Date:   Mon,  1 Nov 2021 00:11:06 +0000
Message-Id: <20211101001119.46056-4-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101001119.46056-1-djrscally@gmail.com>
References: <20211101001119.46056-1-djrscally@gmail.com>
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
 drivers/media/i2c/ov8865.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 8e3f8a554452..9bc8d5d8199b 100644
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

