Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB4193A7432
	for <lists+linux-media@lfdr.de>; Tue, 15 Jun 2021 04:42:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229918AbhFOCn7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 22:43:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229760AbhFOCn4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 22:43:56 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2204AC0613A2;
        Mon, 14 Jun 2021 19:41:51 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id s19so32054681ioc.3;
        Mon, 14 Jun 2021 19:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/6YobJtysgNkHHP/8jtP3hdJ8X5o/uVgs51N6mNDXC4=;
        b=jackmsGVoua19MvudgiAJcjQkrwhdHF+zCUTXh4uSSel9BygAYCBnpY+R6CEtn+rm2
         gAQ/yg601IDmk2b1kK4Ms4nEJRuskiGqbwJZPxOIBLUFTj7MYe65CESBXj8wE+PtH4DD
         fg19mr+Z6PY1sYWvYWeMQW5lDMH6VtFhoR/UT7aTcXjsXn9xWZzL2G9Lch1YdQn+TnnT
         BTBRi+7cqc0xcT9915o+RMc0rwdsdlfdcA8phMEDdoA3lIkud2uS8zW/tjU+RczFvnjl
         touF09cqDYBiwey2n6P14BvhxfIeGkd0xdBIvs1YMW9mhPFjWQhamx3QdvJ97bmVFacu
         +RSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/6YobJtysgNkHHP/8jtP3hdJ8X5o/uVgs51N6mNDXC4=;
        b=gOyqrNGhcY+p56LQgbidNFqW6l6pGnz/V0RrODhjpT9UxpeUTV7sQZLMWJK5n+jXdy
         vHqjPSw9yxS95whnzBHy+++ox5N2KRj3lfAI3uL5d9dWuuJKjf8b5qpRkuu6BBCGwziR
         mOcKS7Tymg4D0zHVdPrTOkWEqrVrr+jO8viQbU/3sZA/B3dkXGvVzTbHLA7LaUryT9Pq
         IIpnijABdbq24SazO7Wlnd1eaEMU1c613OfrUBDxE0J/kMqxL3BZKcNiaknBXDlACVva
         WfzgkkmqktwVNp6zh2VHQmkYRJZh8HphdYr0mLCasxdbRpB/1pGiRjEcwNImrX47/Tlr
         llxg==
X-Gm-Message-State: AOAM530X2OEvOb/kpWTk7ztuKKluDyF0RUu5nYaHk4M4HlYKiFfljW0y
        UrJQMuw1ylDvnf/8paTN0MKqZfcK5uP2vw==
X-Google-Smtp-Source: ABdhPJzZ/oY/79h/RnnXGhRrQfg3q4zOpJgHIeYfmJ7+cljb8nBTHmCJFVJSchThYPmqB3y3Ngm0Vg==
X-Received: by 2002:a63:4915:: with SMTP id w21mr19925512pga.363.1623722808540;
        Mon, 14 Jun 2021 19:06:48 -0700 (PDT)
Received: from yanshuaijun.ccdomain.com ([103.220.76.197])
        by smtp.gmail.com with ESMTPSA id u9sm622478pjy.33.2021.06.14.19.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 19:06:47 -0700 (PDT)
From:   Herman <herman.yim88@gmail.com>
X-Google-Original-From: Herman <yanshuaijun@yulong.com>
To:     a.hajda@samsung.com, mchehab@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Herman <yanshuaijun@yulong.com>
Subject: [PATCH v2] drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c : fix typo 'in deed imporant' > 'indeed important'
Date:   Tue, 15 Jun 2021 10:06:36 +0800
Message-Id: <20210615020636.526-1-yanshuaijun@yulong.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Change 'imporant' into 'important'.

Signed-off-by: Herman <yanshuaijun@yulong.com>
---

v1: Change 'imporant' into 'important'
v2: Change 'in deed' into 'indeed'.

 drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c b/drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c
index 49503c20d320..28a06dc343fd 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c
@@ -1418,7 +1418,7 @@ static void s5p_mfc_try_run_v5(struct s5p_mfc_dev *dev)
 		if (test_and_clear_bit(0, &dev->hw_lock) == 0)
 			mfc_err("Failed to unlock hardware\n");
 
-		/* This is in deed imporant, as no operation has been
+		/* This is indeed important, as no operation has been
 		 * scheduled, reduce the clock count as no one will
 		 * ever do this, because no interrupt related to this try_run
 		 * will ever come from hardware. */
-- 
2.25.1

