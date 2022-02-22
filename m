Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B029C4BFE08
	for <lists+linux-media@lfdr.de>; Tue, 22 Feb 2022 17:03:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232441AbiBVQDx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Feb 2022 11:03:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230118AbiBVQDw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Feb 2022 11:03:52 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6D8210C500
        for <linux-media@vger.kernel.org>; Tue, 22 Feb 2022 08:03:26 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id bu29so25876278lfb.0
        for <linux-media@vger.kernel.org>; Tue, 22 Feb 2022 08:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3k0jS2/x3i8Wmkomw+LPIWLbqx+hB/MPooCxs2/j14Y=;
        b=GZ979gXEHSU9EAVNVEOg59anBxJSB4PMurQeqbCNuzV0UFDHVqCPzJyP+M2x7G72Tn
         flP6yvxu2YFyCWtC37Bq8x3bbA3KhQvi8l+oIrgkyjnFmAt826DoxIYwVbhLhIHTiswa
         71a9P6WvCOlpUBs++eSOIMlrV+uPmX5OizXIOiozFwBgO47klG+fU8ewkIgjtucGkd/g
         glBQHsDN7y5OQ2WUj3jyGwNYgVehQb9lnSRzuP251bFl0I+RRoBgWKGDW2TwFI7oTMfB
         hCdrhqevSy9gJdqio7TjS63OwxCYgU0ezxImPyMhWjv03XkmnTNcnoor9JY31WePkzCI
         d2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3k0jS2/x3i8Wmkomw+LPIWLbqx+hB/MPooCxs2/j14Y=;
        b=OnIboBUbmp3tEIRoKw5QYRW+bhBCNM27oW6RH95L9MxpwL9SHEUN3OMeXiXpsVln4U
         BBnBVoKnbxdwJd0KFlVGijxHbaCiHvQusIbxmsQfHACJaA8orTtHcpP61THVeYwUygwz
         i7/iFIrhLI7FbIJpS6E6HjQW1jy+y8qTjuXDaXw9X0Lma5MhYr1bxwSg4BoAQZxQLeNO
         q8/ByFFRDt//HaS+dRrwKgZbCVIY9TyXAans6lgX6iidLKggwXPSJz73Vig7zpCggWCr
         r8HN62vA8GTi/htgojeNOIjwTmLNYcbmojkNAu512sQWEAcWRmIgyNsm699uFelu+VPs
         XVYQ==
X-Gm-Message-State: AOAM531KDw68viw5VY/zAK2iDqg+bnP+DuRc4k/upCLCkzm/Wz4iR59H
        yUNpm10cnIT409borF5EUD2qdw==
X-Google-Smtp-Source: ABdhPJzLyBn1y6y7ayfJCx6iuhQDqTQeAtAu9S1XUvXDnEiab/7RhMXcrL5/cjXtKBssCFT6PN2zVg==
X-Received: by 2002:ac2:42c2:0:b0:443:7f05:b8ad with SMTP id n2-20020ac242c2000000b004437f05b8admr17237442lfl.40.1645545805040;
        Tue, 22 Feb 2022 08:03:25 -0800 (PST)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id x25sm1416214lfu.80.2022.02.22.08.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 08:03:24 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Ettore Chimenti <ek5.chimenti@gmail.com>
Subject: [PATCH] media: cec: seco: Drop pointless include
Date:   Tue, 22 Feb 2022 17:01:21 +0100
Message-Id: <20220222160121.54272-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This driver uses GPIO descriptors not the old legacy GPIO
API so stop including <linux/gpio.h>.

Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Ettore Chimenti <ek5.chimenti@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/media/cec/platform/seco/seco-cec.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/cec/platform/seco/seco-cec.c b/drivers/media/cec/platform/seco/seco-cec.c
index ae138cc253fd..e6541c195499 100644
--- a/drivers/media/cec/platform/seco/seco-cec.c
+++ b/drivers/media/cec/platform/seco/seco-cec.c
@@ -12,7 +12,6 @@
 #include <linux/delay.h>
 #include <linux/dmi.h>
 #include <linux/gpio/consumer.h>
-#include <linux/gpio.h>
 #include <linux/interrupt.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
-- 
2.34.1

