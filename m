Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D77082235FD
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 09:36:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728097AbgGQHgJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 03:36:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727972AbgGQHgJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 03:36:09 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED3F9C061755;
        Fri, 17 Jul 2020 00:36:08 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id k5so5983278pjg.3;
        Fri, 17 Jul 2020 00:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zkwfq5Uv+GY1uwPYszvR2jSGTXRIJ42mdhpNQh9+c3E=;
        b=D/hVv9WX7fGnjTnF2TtlxKi9Bdv2r5Yn5MpmXaqQWPwk0Bo77NAho3BfGjVUWXXK8A
         WRaB5KCjbZxQDG4AAJt0SgsgSAlsdkzhWRa34HOhCjzqDcZZ3T9E1jjCsAvmGTNzTujF
         Tp9YH1m1vY6WvnzkxxzXfCKF0TfNxt2GPF1Qd6TPIqmtxwykQrx8jvL7gqcy0noBmYm+
         CvphtLW3S+Z6PxUIa8vv81Q+8nXuYmqNBlvHdLKMyG5ERv4p6qFmS7UH2+d12erO2tnN
         sHcQelcUWEj4IQOxZzuSIu8FRyATnAokIIBKDWO7ZKct9POBXTqDUYSMH0yJzmCimdqP
         XW7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zkwfq5Uv+GY1uwPYszvR2jSGTXRIJ42mdhpNQh9+c3E=;
        b=N2YNYQszYzijZV8f12dWovddUwAdb083wb71Jf5uxhD9xxxGFaxaoKxRq/GzyvLA3t
         ASEnQ23BJu/yzW47dvC+Z7vTUhg0HFNvnORpSrq9/K/L/EUpEf2LJzvUGP9z2GmKqx64
         cRVjapAzNwGzoQTusgxDHI482K8T5yoIn7N/WfdGRFHPuaBG+AcP3U0CtiP7cWxius6n
         LlREMfBcTgCWZjqZaL3jzgN6KLpuR3Dz8QG100n5vINsZZxw313V4R+56HDkk1dC24Fn
         /tyuYU4dve1uZeseaAOXC175PO8LKHH+T5/cuFa8DveWabSzdQkVHEdWnM6iEu/ryviB
         I1nw==
X-Gm-Message-State: AOAM5324o8L2gUguchhdvtzAwIRviPZG64/1TQo6XHGRpf1+gw4XwRCR
        XD3G/ew3VNM1ksY+o6K7J4A=
X-Google-Smtp-Source: ABdhPJy0xCmVamzmwrOZ/O76sKzkqD/pUvypW+uITtcfZz1jLPRMSXMKmbiaordscXX7klkOaMe1SQ==
X-Received: by 2002:a17:902:525:: with SMTP id 34mr6945679plf.80.1594971368500;
        Fri, 17 Jul 2020 00:36:08 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
        by smtp.gmail.com with ESMTPSA id z25sm6794704pfg.140.2020.07.17.00.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 00:36:08 -0700 (PDT)
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
Subject: [PATCH v3 2/6] cx23885: use generic power management
Date:   Fri, 17 Jul 2020 13:04:32 +0530
Message-Id: <20200717073436.249623-3-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717073436.249623-1-vaibhavgupta40@gmail.com>
References: <20200717073436.249623-1-vaibhavgupta40@gmail.com>
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

