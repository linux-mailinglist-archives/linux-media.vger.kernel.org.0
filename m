Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F219056137D
	for <lists+linux-media@lfdr.de>; Thu, 30 Jun 2022 09:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233166AbiF3Hpg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 03:45:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233146AbiF3Hpe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 03:45:34 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11A773A70A
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 00:45:33 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id cf14so25384944edb.8
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 00:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VNYYioEE6eRAWTo799NfZ03VtyHU0+m847tUVl43Yck=;
        b=YLjiXgvt9WepSmT9ZWnR5NUIPpyCbwSk9tCnGGCA2MfRQJ/JQiQv3MrwkZKcd/ANyt
         95Z1mmWkFJRAhnXMGxLr6usLtWiqEogLMVG0Gh96jm1DsCvDisP9v1JOYJGkUo0qCeW6
         skVfivMIR2LzuOFje+9s9oRNrsyjTks2W1Guo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VNYYioEE6eRAWTo799NfZ03VtyHU0+m847tUVl43Yck=;
        b=sz8gVe1JY4tqUciQcpgwxo6pqiNl/cq/XwfKXwJJlyzAMMYGWavsS7ttglI/E7oVSm
         qilaEoz+OhXCMbhbYWBS2o/D3xLJ3WzRtabL9z90HTKfs9YdfX/VyWEiQXy00OiLeZT7
         U38w6tSkf/Nta6IYg7W7+TgiMSC9hfrx/FbuFQcpgzyEx8bmundYlkDwMJMttWq2OamX
         V28poQgaeqaleakPBz3SKpCzxDPXdIi+QfF28IgF0yD7GBDl6VdCIePj86HpWLGtffOL
         8mxcz/1NcMjRHh5TZyzZQIOC7fg036Kp3q2AFNortbENEkvv9O5ncDdzIfw4GLsA5iVD
         lznA==
X-Gm-Message-State: AJIora/aT4NgZGMFaUH1kXsfaEPlEUoLN99F9s5vNZ0735AAj2esQNZE
        FKqoeb4Mr//qiut4uW4G7ZUmLQ==
X-Google-Smtp-Source: AGRyM1sFj8MoQk6ICrYzIG/7k4fYwLARHuMRDZqT7YjTSOwCdeamIUesx/jFGg0+IMSxYVgWyznfWg==
X-Received: by 2002:a05:6402:4408:b0:435:9ed2:9be with SMTP id y8-20020a056402440800b004359ed209bemr9590051eda.81.1656575131548;
        Thu, 30 Jun 2022 00:45:31 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i.station (net-188-217-58-216.cust.vodafonedsl.it. [188.217.58.216])
        by smtp.gmail.com with ESMTPSA id b13-20020aa7c90d000000b0043564320274sm12594731edt.19.2022.06.30.00.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 00:45:31 -0700 (PDT)
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To:     tommaso.merciai@amarulasolutions.com
Cc:     linuxfancy@googlegroups.com, linux-amarula@amarulasolutions.com,
        quentin.schulz@theobroma-systems.com,
        Jacopo Mondi <jacopo@jmondi.org>,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/6] media: ov5693: add dvdd into ov5693_supply_names array
Date:   Thu, 30 Jun 2022 09:45:21 +0200
Message-Id: <20220630074525.481790-3-tommaso.merciai@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220630074525.481790-1-tommaso.merciai@amarulasolutions.com>
References: <20220630074525.481790-1-tommaso.merciai@amarulasolutions.com>
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
---
Changes since v3:
 - Add reviewed-by tag, suggested by Jacopo, Krzysztof

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

