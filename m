Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC25B2231DD
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 05:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726962AbgGQD6m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jul 2020 23:58:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726768AbgGQD6l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jul 2020 23:58:41 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E966C061755;
        Thu, 16 Jul 2020 20:58:41 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id z5so6033307pgb.6;
        Thu, 16 Jul 2020 20:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uoIcD6K+jqu+zRT0DyWA5LlYkttEC1REY3iS6fetokg=;
        b=bKpE8LOjMvFIC6gWt1Rw1tJ7UdBTguCQsj3+hovT5dVVSMINoc2pucCNbUUnbTkIup
         fOYndAIcKasKzo2sCIFJpj5z2pHQ3zW/YBhK2UyErJpjDAWzD5xMZBE0IuazYc6yoagl
         llPHEsuW3TyFWfs878gNgNyoBaLbYyTYXtg9VfTLnwMuIJQKImcSTwpm19AlK763gDiU
         xHvkPpTMGSwUBvAL/fzqaiTXm4fXHYuPOCvys5xTQYqSLXoCpg9jjYXRiDCHbEdY0g7c
         7qV8vNk6VLM0S/6N8kh1yI/xJ7FhojVNW1Fb40c0h9pktvLb9x4XRyfG4StDAy8nVS/f
         iUcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uoIcD6K+jqu+zRT0DyWA5LlYkttEC1REY3iS6fetokg=;
        b=qXjQWF/O8nlkGPS2m9X5ceX2qJcpJ+xPGk+CzwwviKKz6YT97i9k9g7P90ja/mg+Gb
         gN1DkUQeraj3cBr/vMVG7ml88hBvNE93xUtW1pUNNN0wGrUZWpYZzfiZ6Pu9LcOCnlGS
         hAgwnOi94JWThA8mddppuAKUBA4JBAVEml6sp/G6TGbTxHlf9G8yBzNct1JwX2fHuwPb
         E5oU0HACzF0oWsLZE/L8PhXKpGc5XdV4/6WECMrN4yuCrCI8FJp9Wjxxo5y7e6i88J6k
         2GBPxbAuS9HavDGbF/eh5KLiT+/2wyqVQOYVZ7QKHG/V/Pc1DmyZOc3OYjk9HI77QXer
         OoXw==
X-Gm-Message-State: AOAM533YfpsvbnRrMlXKCBqH7YcA6E5MXGvdAllGYZUQ+PZ1OGkIdXgh
        G+9Zo+awuev8iguY/vxPFVE=
X-Google-Smtp-Source: ABdhPJwuoPA25J5s/ea5ilueDEYzrTbRAno/FQjJKgAyD7vJ0/bwceFuK19x/GbKuYSaE4iOASm8rA==
X-Received: by 2002:a65:4502:: with SMTP id n2mr7042061pgq.132.1594958320850;
        Thu, 16 Jul 2020 20:58:40 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
        by smtp.gmail.com with ESMTPSA id v11sm6227907pgs.22.2020.07.16.20.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 20:58:40 -0700 (PDT)
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
Subject: [PATCH v2 3/6] cx25821: use generic power management
Date:   Fri, 17 Jul 2020 09:26:05 +0530
Message-Id: <20200717035608.97254-4-vaibhavgupta40@gmail.com>
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
 drivers/media/pci/cx25821/cx25821-core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/pci/cx25821/cx25821-core.c b/drivers/media/pci/cx25821/cx25821-core.c
index 41be22ce66f3..55018d9e439f 100644
--- a/drivers/media/pci/cx25821/cx25821-core.c
+++ b/drivers/media/pci/cx25821/cx25821-core.c
@@ -1374,9 +1374,6 @@ static struct pci_driver cx25821_pci_driver = {
 	.id_table = cx25821_pci_tbl,
 	.probe = cx25821_initdev,
 	.remove = cx25821_finidev,
-	/* TODO */
-	.suspend = NULL,
-	.resume = NULL,
 };
 
 static int __init cx25821_init(void)
-- 
2.27.0

