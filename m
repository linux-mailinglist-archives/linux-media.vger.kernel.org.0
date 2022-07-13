Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEC475739A0
	for <lists+linux-media@lfdr.de>; Wed, 13 Jul 2022 17:05:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236799AbiGMPFa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jul 2022 11:05:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236766AbiGMPFQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jul 2022 11:05:16 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D27241983
        for <linux-media@vger.kernel.org>; Wed, 13 Jul 2022 08:05:14 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id o8so6683740wms.2
        for <linux-media@vger.kernel.org>; Wed, 13 Jul 2022 08:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=REFGbYhE8dpEN5VkA7iNJtkkSRmeBAdrouvG3pc5rZ4=;
        b=AM60TdZ8HZ7OvyRBTLrizQyAPLSegdev4X8ef/09hXQ+9EFvoS7XjwIxhY63YCpNiU
         7uSFl6+2V79L8KUeZ+9ysF/Ewo0Zk3Giv9QaI6kIPmPYMAQkv/nU8QmniG0W0guT2K14
         hLuMRyufymQJR9pM7CjhmuqPNb209cVatb34s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=REFGbYhE8dpEN5VkA7iNJtkkSRmeBAdrouvG3pc5rZ4=;
        b=eyHe/xJ0asKO+K6lIbFYMrrQ7WEa+tH/6N7V8k4X7sq/h1PTQ17lwSGTWIwtQH+LTc
         keXgZMBBsOwdU1Oc+OaOMaqo6+61mVfD+wTZZb++NstfMPFBuE9jrEveGbOCyQoyb9xM
         E42geuZHwlDkSK9zQJCPQmDcgoJKySKH9dz4yNSVS6ZCkUVMn7oIStb6m/QeA1PzyKrC
         wh/qSIl/M/5H7+Y6dbGaup2JRQxWcO9jqzu3lCB2TAQoVrxV0HqYXE6qPJXoTWAXqS+o
         9e2TbzCtyyArUy8SEkIH5WIOIbd9iyUA2GtubC7U4Di91h09ihNuTYR2AY1YPWdCdt+K
         aKHQ==
X-Gm-Message-State: AJIora+LIITUuNeQuoVXMvKtofKpC0YbUAWqMI2gvc1QBEPzxM1gc93O
        9C93icAx7VtmyfAQQUJEd3oAMQ==
X-Google-Smtp-Source: AGRyM1tHZLl/74d091mxos1zDPmZ1SRQ+WdI5OSIR3EtkxpYjxa0w7cskJrV9t4ghkhHnD0Qyi9QKQ==
X-Received: by 2002:a05:600c:4306:b0:3a2:e9e0:3626 with SMTP id p6-20020a05600c430600b003a2e9e03626mr3979142wme.175.1657724712868;
        Wed, 13 Jul 2022 08:05:12 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i.station (net-188-217-51-7.cust.vodafonedsl.it. [188.217.51.7])
        by smtp.gmail.com with ESMTPSA id f17-20020a05600c4e9100b003a2d87aea57sm1465537wmq.10.2022.07.13.08.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 08:05:12 -0700 (PDT)
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To:     tommaso.merciai@amarulasolutions.com
Cc:     linuxfancy@googlegroups.com, linux-amarula@amarulasolutions.com,
        quentin.schulz@theobroma-systems.com,
        Jacopo Mondi <jacopo@jmondi.org>,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/6] media: ov5693: add dvdd into ov5693_supply_names array
Date:   Wed, 13 Jul 2022 17:05:02 +0200
Message-Id: <20220713150506.2085214-3-tommaso.merciai@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220713150506.2085214-1-tommaso.merciai@amarulasolutions.com>
References: <20220713150506.2085214-1-tommaso.merciai@amarulasolutions.com>
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

Add missing "dvdd" (Digital circuit power) entry into ov5693_supply_names
array

Signed-off-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Daniel Scally <djrscally@gmail.com>
---
Changes since v3:
 - Add reviewed-by tag, suggested by Jacopo, Krzysztof

Changes since v4:
 - Add Daniel reviewed-by tag

 drivers/media/i2c/ov5693.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index f410333c4c67..9e84468d920e 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -132,6 +132,7 @@
 static const char * const ov5693_supply_names[] = {
 	"avdd",		/* Analog power */
 	"dovdd",	/* Digital I/O power */
+	"dvdd",		/* Digital circuit power */
 };
 
 #define OV5693_NUM_SUPPLIES	ARRAY_SIZE(ov5693_supply_names)
-- 
2.25.1

