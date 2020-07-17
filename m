Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E47FB2231DA
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 05:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726856AbgGQD60 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jul 2020 23:58:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726768AbgGQD6Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jul 2020 23:58:25 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFB62C061755;
        Thu, 16 Jul 2020 20:58:25 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id t15so5744398pjq.5;
        Thu, 16 Jul 2020 20:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zkwfq5Uv+GY1uwPYszvR2jSGTXRIJ42mdhpNQh9+c3E=;
        b=lhuvquXTh98LzGrLH3A6gsJcb/6gr9Yecke49um+BtmAznQ7j2KoJdKAYYMrCJ4jtu
         q+E31pDYVZ5SY8mIlr+06VbIncUv3I5fluiXXnFVCmFxFmEqw9T1XiF3ziRuG9IYvoBp
         8Qs+P7bdPnmXdydbtcQP56KBvIFF+8JLIAfKiKZPv6YNlBs7isW9PGf/aMbKIfqT26MF
         s2CG9YSISdUW4sMafArMv0X0stcOZH2rGTBYZ6kZLw9QuXRjIzOZ1/hZ2PXx9SufkOQp
         MeVz4WDm+3DdKP2htXG89eLCmTIgEYNNFXawb9i+mpcxQevDy70rIBJZw9gu4r2eRNxD
         tn6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zkwfq5Uv+GY1uwPYszvR2jSGTXRIJ42mdhpNQh9+c3E=;
        b=SJD5Rqn/bqsPGVIN0qJaHccPhXdcNUgxHBw9piMbDsttFK/P0uVp9lvydBZX0bFuff
         ySavMBdYsJpgCQEWhOsyco3F6b2LXqZ/7LYLT5qVZzryjfoykUYZY8utmVhz9AzzsIG6
         0N/2pXqkIp0T3f73O3KKyGBg2K9wr+yioix921uFAokjvYdCHCKRpVFauQ7kvY/ACGoH
         HjXcQO7W0RcC4hn7uRhjdjo4m/Nz0lhEBnTHY07Gbue7cPKp9IW0E+4049lC7MqjkdVR
         85ZdlQb3aqHay5ZZPQoHJIXlo50G1CxMCW6YXeZ5pvRaWNpIwxUaraD+zc8k19ZfBI1q
         Sn/A==
X-Gm-Message-State: AOAM530ZnoIBKyUr4UAQQ1KzntJBBdDpziFTdz791xmZhOvpV3Fk24SG
        6K+pSG++qAvzSs7Rd/DeIn0=
X-Google-Smtp-Source: ABdhPJyb7s566EgEI5F+X4b7pgZcGEbw6DNOfk6/Xm3jbpNrZLoR3mhRC866dwJSjrm+XyUgMWdrVg==
X-Received: by 2002:a17:90a:db82:: with SMTP id h2mr8156594pjv.162.1594958305431;
        Thu, 16 Jul 2020 20:58:25 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
        by smtp.gmail.com with ESMTPSA id v11sm6227907pgs.22.2020.07.16.20.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 20:58:25 -0700 (PDT)
From:   Vaibhav Gupta <vaibhavgupta40@gmail.com>
To:     Bjorn Helgaas <helgaas@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Helgaas <bjorn@helgaas.com>,
        Vaibhav Gupta <vaibhav.varodek@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2 2/6] cx23885: use generic power management
Date:   Fri, 17 Jul 2020 09:26:04 +0530
Message-Id: <20200717035608.97254-3-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717035608.97254-1-vaibhavgupta40@gmail.com>
References: <20200717035608.97254-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The .suspend() and .resume() callbacks are not defined for this driver.
Still, their power management structure follows the legacy framework. To
bring it under the generic framework, simply remove the binding of
callbacks from struct "pci_driver".

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/media/pci/cx23885/cx23885-core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/pci/cx23885/cx23885-core.c b/drivers/media/pci/cx23885/cx23885-core.c
index 7e0b0b7cc2a3..4b0c53f61fb7 100644
--- a/drivers/media/pci/cx23885/cx23885-core.c
+++ b/drivers/media/pci/cx23885/cx23885-core.c
@@ -2235,9 +2235,6 @@ static struct pci_driver cx23885_pci_driver = {
 	.id_table = cx23885_pci_tbl,
 	.probe    = cx23885_initdev,
 	.remove   = cx23885_finidev,
-	/* TODO */
-	.suspend  = NULL,
-	.resume   = NULL,
 };
 
 static int __init cx23885_init(void)
-- 
2.27.0

