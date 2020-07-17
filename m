Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA7DF2235FF
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 09:36:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728121AbgGQHgV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 03:36:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbgGQHgU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 03:36:20 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E069C061755;
        Fri, 17 Jul 2020 00:36:20 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id 207so5005587pfu.3;
        Fri, 17 Jul 2020 00:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uoIcD6K+jqu+zRT0DyWA5LlYkttEC1REY3iS6fetokg=;
        b=BBGOosQ4rdLrE+BvisBUEjDWy3yz8138qDCHb1T8Ez7G4qhwkV+RHgJNp58TK0pNzw
         fbIT0slrgz6NFbzyz1xXWjcIeN6JT2QyH/ZoqdMJ1nsGh+dVkeCYDaO2FY3u7CYla5du
         6bQIIocz5RXLEUlF0Y2gajFtsKLscXOjXs8zypqlSe3S7DxWtInE7ywqvJas2Y75hTXB
         SCJZ6jKEo9gmZL+zWTVmbC+PYNLIJ2bJfrvtjW5WWIGsGfiixA+zfB/X13qSY+ltR+mR
         MI6VHRRvNzZgWyrns4aMJw8Rv9vXbAcaBkUoknzjMKdbEXBZpeDpdSkPq8TnxBYh9kYu
         /ddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uoIcD6K+jqu+zRT0DyWA5LlYkttEC1REY3iS6fetokg=;
        b=SSHAV28cnIreHkw1+DvpEVNQsYWfABYTx/Kxf/hJXAmiUvKUQAJY4HbrVii7383927
         j+aWSzHoZIfdhAc75N+kh95imAW6Gik3xEFckmH6wZ69U2wX0pHNRx7NVzReCUH88pOa
         F7/V81KTEJDZndob2SPTEgip3Udhs8MNABAQS3ZssOTZAXqIOfZXDrTgVmiydqQ6H3j6
         dGIyHJJJXwDunrmiTFq7IYMbnjirdyKDVtD/AfFIKc2piu7yCiui3tMXYvLBgLPmMqfe
         OXbGb8c9/dyWVwUpyUuTesQOvgqh6CBXfnIAnQJBtINwZJFBIhU4YtDqaqvp9HSWL9J2
         bOZA==
X-Gm-Message-State: AOAM532mFPsQOOPQhRVV1B7qEgvMjPTxg65I3kGp3gPlZjUOS0RV6vgu
        fHm19Tgyt5OusioV+mjhyOo=
X-Google-Smtp-Source: ABdhPJwM9UKVyIimMdi4A6iMT2sP9070+N1XiTDKxpM+WZVs0VqrZLQ0Tf9GRsq00RxqKoLnd/i7sA==
X-Received: by 2002:a63:745:: with SMTP id 66mr7868463pgh.316.1594971380040;
        Fri, 17 Jul 2020 00:36:20 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
        by smtp.gmail.com with ESMTPSA id z25sm6794704pfg.140.2020.07.17.00.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 00:36:19 -0700 (PDT)
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
Subject: [PATCH v3 3/6] cx25821: use generic power management
Date:   Fri, 17 Jul 2020 13:04:33 +0530
Message-Id: <20200717073436.249623-4-vaibhavgupta40@gmail.com>
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

